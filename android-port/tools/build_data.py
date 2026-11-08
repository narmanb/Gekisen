#!/usr/bin/env python3
"""Build the game data used by the web/Android port from the BYOND sources.

Reads the .dm sources and map.dmp, writes:
  web/data/types.json      resolved type table (icon, state, density, stats...)
  web/data/map.json        z-level index + tile definitions
  web/data/z<N>.bin        uint16 little-endian tile grid (400x400, top row first)
"""
import gzip
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
import dmparse as D  # noqa: E402

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
WEB = os.path.join(ROOT, 'android-port', 'web')

STAT_VARS = ['powerlevel', 'maxpowerlevel', 'strength', 'defense', 'hp', 'maxhp', 'race',
             'ki', 'maxki', 'zenni']


def icon_key(v):
    lit = D.literal(v)
    if isinstance(lit, dict) and 'icon' in lit:
        return lit['icon'].replace('\\', '/').lower()
    return None


def num(v, default=0):
    lit = D.literal(v)
    if isinstance(lit, (int, float)):
        return lit
    return default


def text(v):
    lit = D.literal(v)
    if isinstance(lit, str):
        return re.sub(r'<[^>]+>', '', lit)
    return None


def enter_rule(tree, path):
    """Classify a turf/obj Enter() proc into a simple rule for the port."""
    owner, proc = tree.find_proc(path, 'Enter')
    if not proc:
        return None
    body = proc['body']
    m = re.search(r'Warp\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)', body) or \
        re.search(r'locate\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)', body)
    if m:
        return {'warp': [int(m.group(1)), int(m.group(2)), int(m.group(3))]}
    if re.search(r'usr\.x\s*=\s*1\b', body):
        return {'wrap': 'x1'}
    if re.search(r'usr\.y\s*=\s*1\b', body):
        return {'wrap': 'y1'}
    m = re.search(r'usr\.x\s*=\s*(\d+)', body)
    if m:
        return {'wrap': 'x' + m.group(1)}
    m = re.search(r'usr\.y\s*=\s*(\d+)', body)
    if m:
        return {'wrap': 'y' + m.group(1)}
    if 'istype(usr,/mob/monsters)' in body.replace(' ', ''):
        return {'block': 'monsters'}
    if 'return 0' in body and 'gravitytype' not in body and 'heal' not in path:
        return {'block': 'all'}
    return None


def main():
    tree = D.load(ROOT)
    icons = json.load(open(os.path.join(WEB, 'data', 'icons.json')))

    lines = open(os.path.join(ROOT, 'map.dmp'), encoding='latin-1').read().split('\n')
    keydefs = {}
    zstart = {}
    for i, l in enumerate(lines):
        m = re.match(r'^"(\w+)" = \((.*)\)$', l)
        if m:
            keydefs[m.group(1)] = m.group(2)
            continue
        m = re.match(r'^\((\d+),(\d+),(\d+)\) = \{"$', l)
        if m:
            zstart[int(m.group(3))] = i + 1

    # ---- type table -------------------------------------------------------
    types = {}
    type_index = {}

    def add_type(path, overrides=None):
        key = path + (json.dumps(overrides, sort_keys=True) if overrides else '')
        if key in type_index:
            return type_index[key]
        v = dict(tree.resolve(path))
        if overrides:
            v.update(overrides)
        ik = icon_key(v.get('icon'))
        ent = {'path': path}
        if ik and ik in icons:
            ent['icon'] = icons[ik]['id']
            ent['state'] = D.literal(v.get('icon_state')) or ''
            if not isinstance(ent['state'], str):
                ent['state'] = ''
        elif ik and ik.endswith('.png'):
            ent['png'] = ik
        ent['name'] = text(v.get('name')) or path.split('/')[-1]
        # BYOND built-in default: mobs are dense, everything else is not
        dens = v.get('density')
        if dens is None or D.literal(dens) is None:
            dens = '1' if path.startswith('/mob') else '0'
        ent['dense'] = 1 if num(dens) else 0
        if num(v.get('opacity')):
            ent['opaque'] = 1
        layer = D.literal(v.get('layer'))
        if isinstance(layer, (int, float)):
            ent['layer'] = layer
        d = D.literal(v.get('dir'))
        if isinstance(d, int) and d != 2:
            ent['dir'] = d
        for pv in ('pixel_x', 'pixel_y'):
            if num(v.get(pv)):
                ent[pv] = num(v.get(pv))
        if num(v.get('invisibility')):
            ent['invis'] = num(v.get('invisibility'))
        if path.startswith('/mob'):
            for s in STAT_VARS:
                if s in v:
                    lit = D.literal(v[s])
                    if isinstance(lit, (int, float, str)):
                        ent[s] = lit
            verbs = []
            for p in tree.chain(path):
                t = tree.types.get(p)
                if t:
                    verbs += [n for n, pr in t.procs.items() if pr.get('verb') and n not in verbs]
            ent['verbs'] = verbs
        rule = enter_rule(tree, path)
        if rule:
            ent['enter'] = rule
        idx = len(types)
        types[idx] = ent
        type_index[key] = idx
        return idx

    # ---- tile definitions ----------------------------------------------------
    tiledefs = []
    tiledef_index = {}
    key_to_tile = {}
    key_objs = {}
    for k, body in keydefs.items():
        parts = re.findall(r'(/[\w/]+)(\{[^}]*\})?', body)
        turfs = []
        objs = []
        area = None
        for path, ov in parts:
            overrides = {}
            if ov:
                for a in re.split(r';\s*', ov.strip('{}')):
                    if '=' in a:
                        n, val = a.split('=', 1)
                        if n.strip() != 'tag':
                            overrides[n.strip()] = val.strip()
            if path.startswith('/area'):
                area = path
            elif path.startswith('/turf'):
                turfs.append(add_type(path, overrides or None))
            else:
                objs.append(add_type(path, overrides or None))
        flags = 0
        if area and 'nopk' in area:
            flags |= 1
        sig = (tuple(turfs), flags)
        if sig not in tiledef_index:
            tiledef_index[sig] = len(tiledefs)
            tiledefs.append({'t': list(turfs), 'f': flags})
        key_to_tile[k] = tiledef_index[sig]
        if objs:
            key_objs[k] = objs

    zinfo = {}
    entities = []
    os.makedirs(os.path.join(WEB, 'data'), exist_ok=True)
    for z, start in sorted(zstart.items()):
        rows = []
        i = start
        while not lines[i].startswith('"}'):
            rows.append(lines[i])
            i += 1
        h = len(rows)
        w = len(rows[0]) // 3
        grid = bytearray(w * h * 2)
        distinct = set()
        for r, row in enumerate(rows):
            for c in range(w):
                k = row[3 * c:3 * c + 3]
                t = key_to_tile[k]
                distinct.add(t)
                grid[(r * w + c) * 2] = t & 255
                grid[(r * w + c) * 2 + 1] = t >> 8
                if k in key_objs:
                    for o in key_objs[k]:
                        entities.append([o, c + 1, h - r, z])
        if len(distinct) <= 1:
            zinfo[z] = {'w': w, 'h': h, 'fill': distinct.pop()}
            continue
        with open(os.path.join(WEB, 'data', 'z%d.bin' % z), 'wb') as fh:
            fh.write(grid)
        zinfo[z] = {'w': w, 'h': h}

    out = {'z': zinfo, 'tiles': tiledefs, 'entities': entities}
    json.dump(out, open(os.path.join(WEB, 'data', 'map.json'), 'w'), separators=(',', ':'))
    json.dump(types, open(os.path.join(WEB, 'data', 'types.json'), 'w'), separators=(',', ':'))
    print('types', len(types), 'tiledefs', len(tiledefs), 'entities', len(entities),
          'zlevels', len(zinfo))




def build_quests(tree):
    """Extract the saga quest chain: entrances (QuestNEnter/Fight) and boss deaths."""
    entrances = {}
    for path, t in tree.types.items():
        m = re.match(r'^/obj/(Quest\d+Enter\d?)$', path)
        if not m or 'Fight' not in t.procs:
            continue
        b = t.procs['Fight']['body']
        title = re.search(r'input\("([^"]*)",\s*"([^"]*)"', b)
        req = re.search(r'questsdone==(\d+)', b)
        dest = re.search(r'usr\.loc=locate\((\d+),\s*(\d+),\s*(\d+)\)', b)
        spawns = re.findall(r'new /mob/monsters/(\w+)\(locate\((\d+),\s*(\d+),\s*(\d+)\)\)', b)
        done_msg = re.findall(r'usr<<"(You have already[^"]*)"', b)
        entrances[path] = {
            'prompt': title.group(1) if title else 'Enter?',
            'title': title.group(2) if title else path,
            'req': int(req.group(1)) if req else 0,
            'dest': [int(x) for x in dest.groups()] if dest else None,
            'spawns': [['/mob/monsters/' + s[0], int(s[1]), int(s[2]), int(s[3])] for s in spawns],
            'done': done_msg[0] if done_msg else 'You have already done this.',
        }
    bosses = {}
    src = open(os.path.join(ROOT, 'battle_system.dm'), encoding='latin-1').read()
    blocks = re.split(r'\n\s*if\(src\.race\s*==\s*"', src)
    for blk in blocks[1:]:
        race = blk.split('"', 1)[0]
        body = blk[:4000]
        nxt = re.search(r'\n\s*if\(src\.race\s*==', body)
        if nxt:
            body = body[:nxt.start()]
        qd = re.search(r'M\.questsdone=(\d+)', body)
        spawn0 = re.search(r'new /mob/monsters/(\w+)\(locate', body)
        if not qd and not spawn0:
            continue
        zen = re.search(r'(?:U|M)\.zenni\s*\+=\s*(\d+)', body)
        warp = re.search(r'M\.loc=locate\((\d+),\s*(\d+),\s*(\d+)\)', body)
        bonus = re.search(r'M\.maxpowerlevel\s*\+=\s*(\d+)', body)
        msgs = [re.sub(r'<[^>]+>|\[[^\]]*\]', '', s) for s in re.findall(r'M\s*<<\s*"([^"]*)"', body)]
        spawn = re.search(r'new /mob/monsters/(\w+)\(locate\((\d+),\s*(\d+),\s*(\d+)\)\)', body)
        bosses[race] = {
            'quest': int(qd.group(1)) if qd else None,
            'zenni': int(zen.group(1)) if zen else 0,
            'warp': [int(x) for x in warp.groups()] if (warp and qd) else None,
            'bonus': int(bonus.group(1)) if bonus else 0,
            'msgs': [m for m in msgs if m.strip()][:6],
            'spawn': ['/mob/monsters/' + spawn.group(1), int(spawn.group(2)), int(spawn.group(3)),
                      int(spawn.group(4))] if spawn else None,
        }
    return {'entrances': entrances, 'bosses': bosses}


def build_npcs(tree, paths):
    """Travel verbs (menus of destinations) on NPCs found on the map."""
    out = {}
    for p in paths:
        verbs = []
        for c in tree.chain(p):
            t = tree.types.get(c)
            if not t or c in ('/mob', '/obj', '/atom', '/atom/movable'):
                continue
            for n, pr in t.procs.items():
                if not pr['verb'] or n in [v['verb'] for v in verbs]:
                    continue
                b = pr['body']
                opts = []
                # labelled destinations: if("Label") ... locate(x,y,z)
                for lab, x, y, z in re.findall(
                        r'if\s*\((?:result\s*==\s*)?"?([\w\' ]+)"?\)[^\n]*\n(?:(?![ \t]*if\s*\(\s*(?:result\s*==\s*)?"?[\w\' ]+"?\)\s*\n)[^\n]*\n){0,14}?[^\n]*locate\((\d+),\s*(\d+),\s*(\d+)\)', b):
                    if lab not in [o[0] for o in opts]:
                        opts.append([lab, int(x), int(y), int(z)])
                if not opts:
                    m = re.search(r'usr\.loc\s*=\s*locate\((\d+),\s*(\d+),\s*(\d+)\)', b)
                    if m:
                        opts.append(['Go', int(m.group(1)), int(m.group(2)), int(m.group(3))])
                alerts = [re.sub(r'\[[^\]]*\]', 'you', a) for a in re.findall(r'(?:alert|usr\s*<<)\s*\(?\s*"([^"]{12,})"', b)]
                if opts or alerts:
                    verbs.append({'verb': n, 'opts': opts, 'text': alerts[:3]})
        if verbs:
            out[p] = verbs
    return out


def extra():
    tree = D.load(ROOT)
    m = json.load(open(os.path.join(WEB, 'data', 'map.json')))
    types = json.load(open(os.path.join(WEB, 'data', 'types.json')))
    paths = sorted(set(types[str(e[0])]['path'] for e in m['entities']))
    q = build_quests(tree)
    npcs = build_npcs(tree, paths)
    # make sure every boss/spawn type is in the type table
    want = set()
    for e in q['entrances'].values():
        for s in e['spawns']:
            want.add(s[0])
    for b in q['bosses'].values():
        if b['spawn']:
            want.add(b['spawn'][0])
    for b in q['bosses'].values():
        if b['spawn']:
            want.add(b['spawn'][0])
    for pth in tree.types:
        if pth.startswith(('/mob/monsters/', '/mob/characters/')):
            want.add(pth)
    mobs = {}
    for pth in sorted(want):
        v = tree.resolve(pth)
        ent = {'name': text(v.get('name')) or pth.split('/')[-1]}
        ik = icon_key(v.get('icon'))
        icons = json.load(open(os.path.join(WEB, 'data', 'icons.json')))
        if ik in icons:
            ent['icon'] = icons[ik]['id']
            st = D.literal(v.get('icon_state'))
            ent['state'] = st if isinstance(st, str) else ''
        for sv in STAT_VARS:
            lit = D.literal(v.get(sv)) if sv in v else None
            if isinstance(lit, (int, float, str)):
                ent[sv] = lit
        mobs[pth] = ent
    json.dump({'quests': q, 'npcs': npcs, 'mobs': mobs},
              open(os.path.join(WEB, 'data', 'scripts.json'), 'w'), indent=0)
    print('quests', len(q['entrances']), 'bosses', len(q['bosses']), 'npcs', len(npcs))


if __name__ == '__main__':
    main()
    extra()
