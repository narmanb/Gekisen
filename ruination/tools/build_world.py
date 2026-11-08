#!/usr/bin/env python3
"""Build world data for the Godot port of Dragonball Ruination.

Reads the DM sources + DBZ_Ruination_Map.dmm and writes into the Godot project:
  data/types.json    resolved atom types used by the map (icon, state, density, stats...)
  data/map.json      z-level info, tile definitions (turf stacks + flags), placed objects/mobs
  data/z<N>.bin      uint16 LE tile grid, rows top->bottom
  data/mobs.json     every /mob type with stats (monsters, NPCs) for spawning
"""
import json
import os
import pickle
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, '..', '..', 'android-port', 'tools'))
import dmparse as D  # noqa: E402

ROOT = os.path.join(HERE, '..', 'source')
GODOT = os.path.join(HERE, '..', 'godot')
DATA = os.path.join(GODOT, 'data')
MAPFILE = os.path.join(ROOT, 'DBZ_Ruination_Map.dmm')
MAXX = MAXY = 500
MAXZ = 12

STAT_VARS = ['level', 'powerlevel', 'powerlevel_max', 'ki', 'ki_max', 'strength', 'defence',
             'exp', 'zenni', 'race', 'melee', 'block', 'dodge', 'counter', 'durability', 'ki_res', 'kidefense']


def load_tree():
    cache = os.path.join(HERE, '.tree.pkl')
    srcs = []
    for dp, dn, fn in os.walk(ROOT):
        srcs += [os.path.join(dp, f) for f in fn if f.endswith('.dm')]
    newest = max(os.path.getmtime(s) for s in srcs)
    if os.path.exists(cache) and os.path.getmtime(cache) > newest and \
            os.path.getmtime(cache) > os.path.getmtime(D.__file__):
        return pickle.load(open(cache, 'rb'))
    t = D.Tree()
    for s in sorted(srcs):
        t.parse_file(s)
    pickle.dump(t, open(cache, 'wb'))
    return t


def lit(v):
    return D.literal(v) if v is not None else None


def num(v, default=0):
    x = lit(v)
    if isinstance(x, (int, float)):
        return x
    return default


def text(v):
    x = lit(v)
    if isinstance(x, str):
        return re.sub(r'<[^>]+>|\\[a-z]+ ?', '', x).strip()
    return None


def icon_key(v):
    x = lit(v)
    if isinstance(x, dict) and 'icon' in x:
        return os.path.basename(x['icon'].replace('\\', '/')).lower()
    return None


def enter_rule(tree, path):
    owner, proc = tree.find_proc(path, 'Enter')
    if not proc:
        owner, proc = tree.find_proc(path, 'Entered')
    if not proc:
        return None
    body = proc['body']
    for m in re.finditer(r'\.loc\s*=\s*locate\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)', body):
        x, y, z = int(m.group(1)), int(m.group(2)), int(m.group(3))
        if 1 <= x <= MAXX and 1 <= y <= MAXY and 1 <= z <= MAXZ:
            rule = {'warp': [x, y, z]}
            note = re.search(r'M\s*<<\s*"([^"\[]{8,})"', body)
            if note and not re.search(r"cannot|can't|don't|must|need|key", note.group(1), re.I):
                rule['msg'] = re.sub(r'<[^>]+>', '', note.group(1)).strip()
            return rule
    if re.search(r'return\s*0', body) and not re.search(r'return\s*1', body):
        return {'block': 'all'}
    return None


def main():
    tree = load_tree()
    icons = json.load(open(os.path.join(DATA, 'icons.json')))

    types = {}
    tindex = {}

    def add_type(path, overrides=None):
        key = path + (json.dumps(overrides, sort_keys=True) if overrides else '')
        if key in tindex:
            return tindex[key]
        v = dict(tree.resolve(path))
        if overrides:
            v.update(overrides)
        ent = {'path': path}
        ik = icon_key(v.get('icon'))
        if ik and ik in icons:
            ent['icon'] = icons[ik]['id']
            st = lit(v.get('icon_state'))
            ent['state'] = st if isinstance(st, str) else ''
        ent['name'] = text(v.get('name')) or path.split('/')[-1].replace('_', ' ')
        dens = v.get('density')
        if dens is None or lit(dens) is None:
            dens = '1' if path.startswith('/mob') else '0'
        ent['dense'] = 1 if num(dens) else 0
        if num(v.get('opacity')):
            ent['opaque'] = 1
        layer = lit(v.get('layer'))
        if isinstance(layer, (int, float)):
            ent['layer'] = layer
        d = lit(v.get('dir'))
        if isinstance(d, int) and d != 2:
            ent['dir'] = d
        for pv in ('pixel_x', 'pixel_y'):
            if num(v.get(pv)):
                ent[pv] = num(v.get(pv))
        if num(v.get('invisibility')):
            ent['invis'] = 1
        if path.endswith('Gravity_Well_2'):
            ent['gravity'] = int(num((overrides or {}).get('totalamount'), 100))
        if 'Safe_Zone' in path:
            ent['safe'] = 1
        rule = enter_rule(tree, path)
        if rule:
            ent['enter'] = rule
        idx = len(types)
        types[idx] = ent
        tindex[key] = idx
        return idx

    lines = open(MAPFILE, encoding='latin-1').read().split('\n')
    keydefs, zstart = {}, {}
    for i, l in enumerate(lines):
        m = re.match(r'^"(\w+)" = \((.*)\)$', l)
        if m:
            keydefs[m.group(1)] = m.group(2)
            continue
        m = re.match(r'^\((\d+),(\d+),(\d+)\) = \{"$', l)
        if m:
            zstart[int(m.group(3))] = i + 1

    tiledefs, tdi, key_tile, key_objs = [], {}, {}, {}
    for k, body in keydefs.items():
        turfs, objs, area = [], [], None
        for path, ov in re.findall(r'(/[\w/]+)(\{[^}]*\})?', body):
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
        if any(types[t].get('safe') for t in turfs) or (area and re.search(r'safe', area, re.I)):
            flags |= 1
        sig = (tuple(turfs), flags)
        if sig not in tdi:
            tdi[sig] = len(tiledefs)
            tiledefs.append({'t': turfs, 'f': flags})
        key_tile[k] = tdi[sig]
        if objs:
            key_objs[k] = objs

    zinfo, entities = {}, []
    for z, start in sorted(zstart.items()):
        rows = []
        i = start
        while not lines[i].startswith('"}'):
            rows.append(lines[i])
            i += 1
        h, w = len(rows), len(rows[0]) // 3
        grid = bytearray(w * h * 2)
        distinct = set()
        for r, row in enumerate(rows):
            for c in range(w):
                k = row[3 * c:3 * c + 3]
                t = key_tile[k]
                distinct.add(t)
                grid[(r * w + c) * 2] = t & 255
                grid[(r * w + c) * 2 + 1] = t >> 8
                for o in key_objs.get(k, ()):
                    entities.append([o, c + 1, h - r, z])
        if len(distinct) <= 1:
            zinfo[z] = {'w': w, 'h': h, 'fill': distinct.pop()}
            continue
        open(os.path.join(DATA, 'z%d.bin' % z), 'wb').write(grid)
        zinfo[z] = {'w': w, 'h': h}

    # every mob type (for spawning, monsters and NPC metadata)
    mobs = {}
    for p in sorted(tree.types):
        if not p.startswith('/mob/'):
            continue
        v = tree.resolve(p)
        ent = {'name': text(v.get('name')) or p.split('/')[-1].replace('_', ' ')}
        ik = icon_key(v.get('icon'))
        if ik in icons:
            ent['icon'] = icons[ik]['id']
            st = lit(v.get('icon_state'))
            ent['state'] = st if isinstance(st, str) else ''
        for s in STAT_VARS:
            if s in v:
                x = lit(v[s])
                if isinstance(x, (int, float, str)):
                    ent[s] = x
        verbs = []
        for c in tree.chain(p):
            t = tree.types.get(c)
            if t and c not in ('/mob', '/mob/PC'):
                verbs += [n for n, pr in t.procs.items() if pr.get('verb') and n not in verbs]
        if verbs:
            ent['verbs'] = verbs
        # first line of dialogue from the NPC's verbs (alerts / messages to the player)
        for c in tree.chain(p):
            t = tree.types.get(c)
            if not t or c in ('/mob', '/mob/PC', '/mob/NPC'):
                continue
            for n, pr in t.procs.items():
                if not pr.get('verb') or 'talk' in ent:
                    continue
                for s in re.findall(r'(?:alert\(|usr\s*<<|src\s*<<|<<\s*")\s*(?:usr,\s*)?"([^"]{20,})"', pr['body']):
                    s = re.sub(r'<[^>]+>|\\[a-z]+ ?', '', s)
                    s = re.sub(r'\[usr\]|\[src\]|\[usr\.name\]', 'warrior', s)
                    s = re.sub(r'\[[^\]]*\]', '...', s).strip()
                    if len(s) >= 20 and not re.search(r'already talking|Mr Fix|Unequip|already caught|pvp', s, re.I):
                        ent['talk'] = s
                        break
        if re.search(r'Dende|Korin|Heal|Doctor|Nurse', p):
            ent['healer'] = True
        mobs[p] = ent

    os.makedirs(DATA, exist_ok=True)
    json.dump({'z': zinfo, 'tiles': tiledefs, 'entities': entities},
              open(os.path.join(DATA, 'map.json'), 'w'), separators=(',', ':'))
    json.dump(types, open(os.path.join(DATA, 'types.json'), 'w'), separators=(',', ':'))
    json.dump(mobs, open(os.path.join(DATA, 'mobs.json'), 'w'), separators=(',', ':'))
    print('types', len(types), 'tiles', len(tiledefs), 'entities', len(entities), 'z', sorted(zinfo),
          'mobs', len(mobs))


if __name__ == '__main__':
    main()
