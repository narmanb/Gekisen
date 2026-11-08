#!/usr/bin/env python3
"""Extract game rules for the Godot port of Dragonball Ruination -> data/rules.json

* races: starting skills, icons, genes, stat multipliers (Powerlevel_Birth.dm, New Login Crim.dm)
* learn: race / gene / level -> technique (Player/Learn Skills.dm, Skill_Gain)
* techniques: every /obj/Technique with display name, ki cost, cooldown and how it works.
  Projectile techniques use their /obj/blasts damage coefficients
  (Damage = (PL*a + Ki*b + Str*c + Def*d) * scale_stat/100).
* forms: transformation level requirements and stat multipliers per race and gene
"""
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, '..', '..', 'android-port', 'tools'))
import build_world as BW  # noqa: E402  (tree cache + helpers)

ROOT = BW.ROOT
DATA = BW.DATA
SKILLS = ['melee', 'block', 'dodge', 'counter', 'critical', 'durability', 'ki_control', 'ki_cast',
          'ki_power', 'ki_use', 'ki_res', 'reflect', 'weapon', 'weapon_power', 'weapon_resistance']

# Hand classification of the non-projectile techniques (what their DM verbs do).
# kind: aoe (hits everything in radius), multi (fires several ki blasts), strike (big melee hit),
#       bind (damage + stun), buff, heal, utility.  pow = ki coefficient for damage.
OTHER = {
    'AcidRain': ('multi', {'shots': 6, 'pow': 0.06}), 'FlameShower': ('multi', {'shots': 6, 'pow': 0.06}),
    'KiShower': ('multi', {'shots': 6, 'pow': 0.06}), 'RapidBlast': ('multi', {'shots': 5, 'pow': 0.05}),
    'ShineMissile': ('multi', {'shots': 6, 'pow': 0.07}), 'HellZoneGrenade': ('multi', {'shots': 8, 'pow': 0.08}),
    'GenocideAttack': ('multi', {'shots': 10, 'pow': 0.07}), 'TripleKiBlast': ('multi', {'shots': 3, 'pow': 0.08}),
    'BurningAttack': ('multi', {'shots': 3, 'pow': 0.1}), 'BlasterShell': ('multi', {'shots': 4, 'pow': 0.12}),
    'ZapCannon': ('multi', {'shots': 2, 'pow': 0.12}), 'BigBangAttack': ('aoe', {'radius': 2, 'pow': 0.3}),
    'RevengeDeathBall': ('aoe', {'radius': 3, 'pow': 0.35}), 'GalacticTyrant': ('aoe', {'radius': 2, 'pow': 0.25}),
    'ExplosiveWave': ('aoe', {'radius': 2, 'pow': 0.08}), 'SuperExplosionWave': ('aoe', {'radius': 3, 'pow': 0.15}),
    'AngryExplosion': ('aoe', {'radius': 3, 'pow': 0.2}), 'EnergyField': ('aoe', {'radius': 2, 'pow': 0.12}),
    'DamageField': ('aoe', {'radius': 3, 'pow': 0.05}), 'FinalExplosion': ('aoe', {'radius': 4, 'pow': 0.6, 'selfcost': 0.9}),
    'BlowUp': ('aoe', {'radius': 3, 'pow': 0.5, 'selfcost': 0.9}), 'SelfDestruct': ('aoe', {'radius': 4, 'pow': 0.7, 'selfcost': 0.95}),
    'Glare': ('bind', {'pow': 0.02, 'stun': 3}), 'SolarFlare': ('bind', {'pow': 0.0, 'stun': 4, 'radius': 3}),
    'DemonShackle': ('bind', {'pow': 0.05, 'stun': 4}), 'FatWrap': ('bind', {'pow': 0.05, 'stun': 4}),
    'ImprisonmentBall': ('bind', {'pow': 0.08, 'stun': 4}), 'GalacticDonut': ('bind', {'pow': 0.05, 'stun': 4}),
    # Push.dm / PowerDash.dm / Techniques.dm Burst_Rush, see game.gd for the formulas
    'BurstRush': ('burstrush', {'cost': [0.0, 100000], 'cd': 12.0}),
    'PowerDash': ('powerdash', {'cost': [0.0, 0], 'cd': 7.0, 'range': 20}),
    'Push': ('push', {'cost': [0.0, 0], 'cd': 6.5}), 'ExecutionersStrike': ('strike', {'pow': 2.2}),
    'DimensionSwordAttack': ('strike', {'pow': 2.5}), 'ThousandSwordSlash': ('strike', {'pow': 2.0, 'hits': 3}),
    'DemonSword': ('strike', {'pow': 1.8}), 'SauzerBlade': ('strike', {'pow': 1.8}),
    'Assasinate': ('strike', {'pow': 3.0}), 'Infect': ('strike', {'pow': 0.6, 'dot': 5}),
    'Corrupt': ('strike', {'pow': 0.6, 'dot': 5}),
    'BuffDefense': ('buff', {'stat': 'defence', 'mult': 1.25, 'secs': 60}),
    'BuffKi': ('buff', {'stat': 'ki', 'mult': 1.25, 'secs': 60}),
    'BuffPowerlevel': ('buff', {'stat': 'powerlevel', 'mult': 1.25, 'secs': 60}),
    'BuffStamina': ('buff', {'stat': 'stamina', 'mult': 1.0, 'secs': 60}),
    'BuffStrength': ('buff', {'stat': 'strength', 'mult': 1.25, 'secs': 60}),
    'AdvancedTraining': ('buff', {'stat': 'exp', 'mult': 2.0, 'secs': 120}),
    'Aura': ('buff', {'stat': 'aura', 'mult': 1.0, 'secs': 0, 'toggle': 1}),
    'Kaioken': ('buff', {'stat': 'kaioken', 'mult': 1.5, 'secs': 0, 'toggle': 1, 'drain': 0.01}),
    'UnleashRage': ('buff', {'stat': 'strength', 'mult': 1.4, 'secs': 30}),
    'KiShield': ('buff', {'stat': 'shield', 'mult': 0.65, 'secs': 0, 'toggle': 1, 'drain': 0.005}),
    'EnergyBarrier': ('buff', {'stat': 'barrier', 'mult': 0.5, 'secs': 20}),
    'GravityField': ('buff', {'stat': 'exp', 'mult': 1.5, 'secs': 120}),
    'InvertPower': ('buff', {'stat': 'ki', 'mult': 1.3, 'secs': 60}),
    'MajinSorcery': ('buff', {'stat': 'strength', 'mult': 1.2, 'secs': 60}),
    'Zanzoken': ('buff', {'stat': 'dodge', 'mult': 1.5, 'secs': 15}),
    'AfterImage': ('buff', {'stat': 'dodge', 'mult': 1.5, 'secs': 15}),
    'SlowField': ('bind', {'pow': 0.02, 'stun': 2, 'radius': 3}),
    'Regenerate': ('heal', {'amount': 0.35}), 'HealField': ('heal', {'amount': 0.25}),
    'Absorb': ('heal', {'amount': 0.2, 'drain': 1}), 'Drain': ('heal', {'amount': 0.15, 'drain': 1}),
    'KiAbsorb': ('heal', {'amount': 0.0, 'ki': 0.3}), 'Sacrifice': ('heal', {'amount': 0.5}),
    'Fly': ('utility', {'what': 'fly'}), 'Sense': ('utility', {'what': 'sense'}),
    'UniversalScan': ('utility', {'what': 'sense'}), 'InstantTransmission': ('utility', {'what': 'teleport'}),
    'TimeSkip': ('utility', {'what': 'dash'}), 'SplitForm': ('utility', {'what': 'none'}),
    'FakeMoon': ('utility', {'what': 'oozaru'}), 'PowerUp': ('utility', {'what': 'powerup'}),
    'PowerDown': ('utility', {'what': 'powerdown'}), 'CustomAttack': ('utility', {'what': 'none'}),
}


def techniques(tree):
    out = {}
    for p, v in sorted(tree.types.items()):
        if not (p.startswith('/obj/Technique/') and p.count('/') == 3):
            continue
        verbs = [(n, pr) for n, pr in v.procs.items() if pr['verb']]
        if not verbs:
            continue
        key = p.split('/')[-1]
        n, pr = verbs[0]
        b = pr['body']
        disp = re.search(r'set name\s*=\s*"([^"]+)"', b)
        name = (disp.group(1) if disp else n).replace('_', ' ')
        t = {'name': name}
        m = re.search(r'TechCD\("[^"]*",\s*(\d+)\)', b)
        if m:
            t['cd'] = int(m.group(1)) / 10.0
        m = re.search(r'var/cost\s*=\s*\(\(curki \* ([\d.]+)\)\*\(usr\.kiuse/(\d+)\)\)\+(\d+)', b)
        if m:
            t['cost'] = [float(m.group(1)), int(m.group(3))]
        else:
            m = re.search(r'var/cost\s*=\s*(\d+)\+\((\d+)\*usr\.kiuse\)', b)
            if m:
                t['cost'] = [0.0, int(m.group(1)), int(m.group(2))]     # flat + per point of Ki Use
        bc = re.sub(r'/\*.*?\*/', '', b, flags=re.S)
        bc = '\n'.join(l for l in bc.split('\n') if not l.strip().startswith('//'))
        blasts = re.findall(r'new\s*/obj/blasts/(\w+)', bc) + re.findall(r'var/obj/blasts/(\w+)/\w+\s*=\s*new', bc)
        tech_objs = re.findall(r'var/obj/Tech/([\w/]+)/\w+\s*=\s*new', bc)
        if blasts:
            t['kind'] = 'blast'
            t.update(blast(tree, blasts[0]))
            if len(re.findall(r'var/obj/blasts/\w+/\w+\s*=\s*new\(techloc', bc)) == 3:
                t['spawn'] = 'triple'      # front + both sides, all flying the same way
            if re.search(r'src\.Trace\(\)', tree.find_proc('/obj/blasts/' + blasts[0], 'New')[1]['body'] if tree.find_proc('/obj/blasts/' + blasts[0], 'New')[1] else ''):
                t['homing'] = 1
        elif key in WAVES:
            t.update(WAVES[key])
        elif tech_objs and tech_objs[0] in MISSILE_OBJS:
            t.update(missile(bc, tech_objs))
        elif tech_objs and tech_objs[0].startswith('BeamH/Bang'):
            t.update(bigball(bc))
        elif key in OTHER:
            kind, params = OTHER[key]
            t['kind'] = kind
            t.update(params)
        else:
            t['kind'] = 'utility'
            t['what'] = 'none'
        if 'cost' not in t and t['kind'] in ('aoe', 'multi', 'bind', 'strike'):
            t['cost'] = [0.05, 1000]
        out[key] = t
    return out


# Explosion techniques (verbs in Techniques*.dm), damage worked out in game.gd from these:
#  ExplosiveWave: oview(3), damage = PL/2 - kidef/125/((2+dist)/2), BasicBoom fire rings 3 and 5
#  SuperExplosionWave: ExplosionSEW pulses of radius 2, 3, 4, each ki_max*ki_power/100/3
#  FinalExplosion: oview(8), damage = ki*ki_power/100/((2+dist)/2); you are left at 0 powerlevel
WAVES = {
    'ExplosiveWave': {'kind': 'wave', 'wave': 'explosive', 'radius': 3, 'boom': [3, 5]},
    'SuperExplosionWave': {'kind': 'wave', 'wave': 'sew', 'pulses': [2, 3, 4]},
    'FinalExplosion': {'kind': 'wave', 'wave': 'final', 'radius': 8, 'boom': [4, 8]},
}
# /obj/Tech missiles (Technique_Procs.dm Scatter): homing ki balls. icon_state and the delay
# before they start moving (New(): spawn(1) or spawn(63)).
MISSILE_OBJS = {'KiMissile': ('blast', 0.1), 'ScatterBlast': ('scatter', 6.3),
                'GenocideBlast': ('genocide', 6.3), 'AcidBlast': ('acid', 6.3)}


def _setp(body):
    out = {}
    for stat, k in re.findall(r'var/rand\w+\s*=\s*(?:round\()?usr\.(\w+)\s*\*\s*([\d.]+)', body):
        out[stat] = float(k)
    return out


def missile(body, objs):
    obj = objs[0].split('/')[0]
    state, hover = MISSILE_OBJS[obj]
    st = re.findall(r'\.icon_state\s*=\s*"(blast\w*)"', body)
    if st:
        state = st[0]
    m = re.search(r'\.power\s*=\s*round\(src\.setpower/([\d.]+)\)', body)
    res = {'kind': 'missile', 'obj': obj, 'icon': 'techs.dmi', 'state': state, 'hover': hover,
           'setp': _setp(body), 'div': float(m.group(1)) if m else float(len(objs))}
    # missiles created unconditionally vs. extra ones behind "if(usr.level>N)"
    extra = [int(x) for x in re.findall(r'if\(usr\.level\s*>=?\s*(\d+)\)', body)]
    res['count'] = len(objs) - len(extra)
    if extra:
        res['extra'] = extra
    first = body.find('var/obj/Tech/')
    gaps = re.findall(r'sleep\((\d+)\)', body[first:])
    res['gap'] = max(set(gaps), key=gaps.count) and int(max(set(gaps), key=gaps.count)) / 10.0 if gaps else 0.2
    offs = re.findall(r'\.loc\s*=\s*locate\(usr\.x([+-]\d+)?\s*,\s*usr\.y([+-]\d+)?', body)
    if offs:
        res['offsets'] = [[int(a or 0), int(b or 0)] for a, b in offs]
    return res


def bigball(body):
    pre = re.findall(r'C\.icon_state\s*=\s*"(\w+) c"', body)
    pre = pre[0] if pre else 'ba'
    return {'kind': 'bigball', 'icon': 'burning attack.dmi', 'state': pre + ' c', 'prefix': pre,
            'setp': _setp(body)}


def blast(tree, bname):
    p = '/obj/blasts/' + bname
    v = tree.resolve(p)
    res = {'blast': bname}
    ik = BW.icon_key(v.get('icon'))
    if ik:
        res['icon'] = ik
    st = BW.lit(v.get('icon_state'))
    res['state'] = st if isinstance(st, str) else ''
    owner, New = tree.find_proc(p, 'New')
    body = New['body'] if New else ''
    coef = {}
    for var, stat, k in re.findall(r'var/rand(\w+)\s*=\s*(?:round\()?Owner\.(\w+)\s*\*\s*([\d.]+)', body):
        coef[stat] = float(k)
    m = re.search(r'src\.Damage\s*=.*Owner\.(\w+)\s*/\s*100', body)
    scale = m.group(1) if m else 'ki_power'
    m = re.search(r'src\.Damage\s*=\s*\(Owner\.(\w+)\s*\*\s*([\d.]+)\)\s*\*\s*\(Owner\.(\w+)/100\)', body)
    if m:
        coef = {m.group(1): float(m.group(2))}
        scale = m.group(3)
    if not coef:
        coef = {'powerlevel': 0.05, 'ki': 0.05}
    res['coef'] = coef
    res['scale'] = scale
    m = re.search(r'mlength\s*=\s*(\d+)', body)
    res['range'] = int(m.group(1)) if m else int(BW.num(v.get('mlength'), 18))
    m = re.search(r'splashrange\s*=\s*(\d+)', body)
    res['splash'] = int(m.group(1)) if m else 0
    m = re.search(r'splashdmg\s*=\s*round\(src\.Damage\s*\*\s*([\d.]+)\)', body)
    res['splashk'] = float(m.group(1)) if m else 0.0
    res['beam'] = 1 if BW.num(v.get('Trail')) or re.search(r'Trail\s*=\s*1', body) else 0
    if re.search(r'pierce\s*=\s*1', body) or BW.num(v.get('pierce')):
        res['pierce'] = 1
    m = re.search(r'shootspeed\s*=\s*(\d+)', body)
    if m:
        res['speed'] = int(m.group(1))
    return res


def learn_table(tree):
    b = tree.types['/mob'].procs['Skill_Gain']['body']
    b = re.sub(r'/\*.*?\*/', '', b, flags=re.S)
    stack, out = [], []
    for line in b.split('\n'):
        s = line.strip()
        if not s or s.startswith('//'):
            continue
        ind = len(line) - len(line.lstrip('\t'))
        while stack and stack[-1][0] >= ind:
            stack.pop()
        m = re.match(r'if\((.*)\)$', s)
        if m:
            stack.append((ind, m.group(1)))
            continue
        m = re.search(r'new/obj/Technique/(\w+)', s)
        if not m:
            continue
        race, lvl, gene, req = None, 0, None, None
        for _, c in stack:
            r = re.search(r'race\s*==\s*"([^"]+)"', c)
            lv = re.search(r'level\s*>=?\s*(\d+)', c)
            g = re.search(r'gene\s*==\s*"([^"]+)"', c)
            if r:
                race = r.group(1)
            elif lv:
                lvl = max(lvl, int(lv.group(1)))
            elif g:
                gene = g.group(1)
            elif 'weapon' in c and 'learn' not in c:
                req = 'weapon'
            elif 'mastered' in c:
                req = 'ki_control_mastered'
        e = {'tech': m.group(1), 'level': lvl}
        if race:
            e['race'] = race
        if gene:
            e['gene'] = gene
        if req:
            e['req'] = req
        out.append(e)
    return out


def races(tree):
    b = tree.types['/mob'].procs['CreateChar']['body']
    body = b[b.find('switch(src.newrace)'):]
    parts = re.split(r'\n\t+if\("([^"]+)"\)\n', body)
    res = {}
    for j in range(1, len(parts), 2):
        race, blk = parts[j], parts[j + 1]
        skills = {k: int(v) for k, v in re.findall(r'mobcreation\.(\w+)\s*=\s*(\d+)', blk) if k in SKILLS}
        icons = [os.path.basename(i).lower() for i in re.findall(r"icon\s*=\s*'([^']+)'", blk)]
        res[race] = {'skills': skills, 'icons': icons}
    # genes + multipliers
    pb = open(os.path.join(ROOT, 'DBFT Programming', 'System', 'Powerlevel_Birth.dm'), encoding='latin-1').read()
    multis = {}
    for name, blk in re.findall(r'\n\t\t(\w+)_Multi\(\)\n(.*?)(?=\n\t\t\w+\(\)\n|\Z)', pb, re.S):
        base = {k: float(v) for k, v in re.findall(r'src\.(power|ki|strength|defence)_multi\s*=\s*([\d.]+)', blk)}
        genes = {}
        for g, gblk in re.findall(r'if\(src\.gene == "([^"]+)"\)\n((?:\t{4}.*\n?)+)', blk):
            genes[g] = {k: float(v) for k, v in re.findall(r'src\.(power|ki|strength|defence)_multi\s*\+=\s*([\d.]+)', gblk)}
        multis[name] = {'base': base, 'genes': genes}
    birth = pb[pb.find('Power_Birth()'):]
    for race in list(res):
        m = re.search(r'if\(src\.race == "%s"[^\n]*\)\n(.*?)(?=\n\t\t\tif\(src\.race ==|\n\t\t\t//|\Z)' % re.escape(race), birth, re.S)
        genes, mproc = [], None
        if m:
            blk = m.group(1)
            genes = list(dict.fromkeys(re.findall(r'src\.gene\s*=\s*"([^"]+)"', blk)))
            mm = re.search(r'src\.(\w+)_Multi\(\)', blk)
            mproc = mm.group(1) if mm else None
        if not mproc:
            guess = race.replace(' ', '_')
            mproc = guess if guess in multis else None
        mult = multis.get(mproc, {'base': {'power': 4, 'ki': 4, 'strength': 4, 'defence': 4}, 'genes': {}})
        if race == 'Alien':
            genes = ['Hitman', 'Pride Trooper', 'Yardrat', 'Moro', 'Lycanthrope', 'Kamenian', 'Rebrianne']
        res[race]['genes'] = genes or ['Pure Blooded']
        res[race]['multi'] = mult['base'] or {'power': 4, 'ki': 4, 'strength': 4, 'defence': 4}
        res[race]['gene_multi'] = mult['genes']
        # races that pick a skin + hair on the human base (Choose_Base / ApplyIconHair)
        res[race]['custom'] = race in ('Human', 'Saiyan', 'Half Saiyan', 'Android')
        if race == 'Android' and 'Android21' in multis:
            # "Gluttonous (Android 21)": its own base multipliers, stored as a gene bonus
            a21 = multis['Android21']['base']
            res[race]['genes'].append('Gluttonous')
            res[race]['gene_multi']['Gluttonous'] = {k: a21.get(k, 4) - res[race]['multi'].get(k, 4)
                                                     for k in ('power', 'ki', 'strength', 'defence')
                                                     if a21.get(k, 4) != res[race]['multi'].get(k, 4)}
    return res


def forms(tree):
    out = {}
    tdir = os.path.join(ROOT, 'DBFT Programming', 'Transformations')
    for fn in sorted(os.listdir(tdir)):
        if not (fn.endswith('Transformation.dm') or fn == 'BioWarrior Transform.dm') or fn.startswith('Transform'):
            continue
        race = fn.replace(' Transformation.dm', '').replace(' Transform.dm', '')
        src = open(os.path.join(tdir, fn), encoding='latin-1').read()
        src = re.sub(r'/\*.*?\*/', '', src, flags=re.S)
        # Form procs (e.g. MoroTrans(form), PTForm(form)) are called from a per-gene
        # dispatcher. Attribute each proc to the gene that calls it so its multipliers and
        # icons don't get mixed with another gene's.
        lines_all = src.split('\n')
        procs = [(i, m.group(1)) for i, l in enumerate(lines_all)
                 for m in [re.match(r'^\t{1,2}(\w+)\((?:form as num)?\)\s*$', l)] if m]
        pnames = {n for _, n in procs}
        proc_body = {}
        for k, (i, n) in enumerate(procs):
            j = procs[k + 1][0] if k + 1 < len(procs) else len(lines_all)
            proc_body[n] = proc_body.get(n, '') + '\n'.join(lines_all[i:j])
        proc_gene = {}
        for g, region in gene_regions(src):
            for n in re.findall(r'src\.(\w+)\(', region):
                if n in pnames:
                    proc_gene[n] = g if proc_gene.get(n, g) == g else '*'
        proc_at = []
        for i, n in procs:
            proc_at.append((i, n))
        menus = {}
        stack = []
        cur = None
        seq = {}
        curproc = None
        pi = 0
        for li, line in enumerate(src.split('\n')):
            while pi < len(proc_at) and proc_at[pi][0] <= li:
                curproc = proc_at[pi][1]
                pi += 1
            dflt = proc_gene.get(curproc, '*')
            s = line.strip()
            if not s or s.startswith('//'):
                continue
            ind = len(line) - len(line.lstrip('\t'))
            while stack and stack[-1][0] >= ind:
                stack.pop()
            m = re.match(r'if\((.*)\)\s*(menu \+= "Form (\d+)")?$', s)
            if m and m.group(2):
                g = next((re.search(r'gene\s*==\s*"([^"]+)"', c).group(1) for _, c in stack
                          if re.search(r'gene\s*==\s*"([^"]+)"', c)), '*')
                lv = re.search(r'level\s*>=\s*(\d+)', m.group(1))
                if lv:
                    menus.setdefault(g, {}).setdefault(int(m.group(3)), int(lv.group(1)))
                continue
            if m:
                stack.append((ind, m.group(1)))
                continue
            m = re.match(r'var/(plg|kig|strg|defg)\s*=\s*\(?([\d.]+)', s)
            if m:
                g = next((re.search(r'gene\s*==\s*"([^"]+)"', c).group(1) for _, c in stack
                          if re.search(r'gene\s*==\s*"([^"]+)"', c)), dflt)
                f = next((int(re.search(r'form\s*==\s*(\d+)', c).group(1)) for _, c in stack
                          if re.search(r'form\s*==\s*(\d+)', c)), None)
                if f is None:
                    continue
                seq.setdefault(g, {}).setdefault(f, {})[m.group(1)] = float(m.group(2))
                cur = (g, f)
                continue
            m = re.match(r"src\.icon\s*=\s*'([^']+)'", s)
            if m and cur:
                seq.setdefault(cur[0], {}).setdefault(cur[1], {}).setdefault('icon', os.path.basename(m.group(1)).lower())
            if 'SSJHair_Apply' in s and cur:
                seq.setdefault(cur[0], {}).setdefault(cur[1], {})['ssjhair'] = 1
        race_forms = {}
        for g, mm in menus.items():
            lst = []
            for f in sorted(mm):
                st = seq.get(g, {}).get(f) or seq.get('*', {}).get(f) or {}
                if not st and seq:
                    # fall back to any gene's multipliers for that form number
                    for gg in seq.values():
                        if f in gg:
                            st = gg[f]
                            break
                lst.append({'form': f, 'level': mm[f], 'pl': st.get('plg', 2), 'ki': st.get('kig', 2),
                            'str': st.get('strg', 2), 'def': st.get('defg', 2),
                            **({'icon': st['icon']} if 'icon' in st else {}),
                            **({'ssjhair': 1} if st.get('ssjhair') else {})})
            race_forms[g] = lst
        # second pass: sequential "if(level >= N) -> next form" style (no menus)
        for g, region in gene_regions(src):
            if g in race_forms and race_forms[g]:
                continue
            for n in re.findall(r'src\.(\w+)\(', region):
                if n in proc_body and proc_gene.get(n) == g:
                    region += '\n' + proc_body[n]
            levels = []
            for lv in re.findall(r'src\.level\s*>=\s*(\d+)', region):
                lv = int(lv)
                if lv not in levels:
                    levels.append(lv)
            levels = sorted(levels)[:7]
            if not levels:
                # forms gated on powerlevel/eats/chips (Majin, Android, Feline, Konat, Tuffle):
                # read them in order, split at each "src.form_N = 1"
                parts = re.split(r'src\.form_\d\s*=\s*1', region)
                segs = parts[:-1]
                star = race_forms.get('*') or []
                lst = []
                for k, seg in enumerate(segs[:7]):
                    # the icon is set just before or just after the form flag
                    after = parts[k + 1].split('if(')[0]
                    mm = re.findall(r'var/plg\s*=\s*\(?([\d.]+)', seg) or \
                        re.findall(r'src\.powerlevel_max\s*\*=\s*([\d.]+)', seg)
                    mult = float(mm[-1]) if mm else DEFAULT_MULT[min(k, len(DEFAULT_MULT) - 1)]
                    ic = re.findall(r"src\.icon\s*=\s*'([^']+)'", after) or \
                        re.findall(r"src\.icon\s*=\s*'([^']+)'", seg.split('enrage')[-1])
                    lvl = star[k]['level'] if k < len(star) else DEFAULT_LEVELS[min(k, len(DEFAULT_LEVELS) - 1)]
                    f = {'form': k + 1, 'level': lvl,
                         'pl': mult, 'ki': mult, 'str': mult, 'def': mult}
                    if ic:
                        f['icon'] = os.path.basename(ic[0]).lower()
                    lst.append(f)
                if lst:
                    race_forms[g] = lst
                continue
            mults = [float(x) for x in re.findall(r'var/plg\s*=\s*\(?([\d.]+)', region)]
            icons = [os.path.basename(i).lower() for i in re.findall(r"src\.icon\s*=\s*'([^']+)'", region)]
            lst = []
            for k, lv in enumerate(levels):
                mm = mults[k] if k < len(mults) else DEFAULT_MULT[min(k, len(DEFAULT_MULT) - 1)]
                f = {'form': k + 1, 'level': lv, 'pl': mm, 'ki': mm, 'str': mm * 1.1, 'def': mm * 1.1}
                if k < len(icons):
                    f['icon'] = icons[k]
                lst.append(f)
            race_forms[g] = lst
        out[race] = race_forms
    return out


DEFAULT_MULT = [5, 8, 10, 12, 15, 18, 22]
DEFAULT_LEVELS = [20000, 50000, 100000, 150000, 200000, 250000, 300000]


def gene_regions(src):
    """Yield (gene, text) for each `if(src.gene == "X")` block (indentation based)."""
    lines = src.split('\n')
    i = 0
    while i < len(lines):
        m = re.match(r'^(\t*)if\(src\.gene\s*==\s*"([^"]+)"\)\s*$', lines[i])
        if m:
            ind = len(m.group(1))
            j = i + 1
            while j < len(lines) and (not lines[j].strip() or lines[j].strip().startswith('//')
                                      or len(lines[j]) - len(lines[j].lstrip('\t')) > ind):
                j += 1
            yield m.group(2), '\n'.join(lines[i:j])
            i = j
            continue
        i += 1


FORM_FILE_RACE = {'Changling': 'Changeling', 'Namek': 'Namekian', 'Bio Android': 'Bio Android',
                  'BioWarrior': 'Bio Warrior', 'Bojack': 'Heran', 'Babidi': 'Majin Wizard',
                  'Konat': 'Konat', 'Kai': 'Kai', 'Feline': 'Feline', 'Dragon': 'Dragon'}


def main():
    tree = BW.load_tree()
    rules = {
        'races': races(tree),
        'learn': learn_table(tree),
        'techniques': techniques(tree),
    }
    fr = forms(tree)
    rules['forms'] = {FORM_FILE_RACE.get(k, k): v for k, v in fr.items()}
    json.dump(rules, open(os.path.join(DATA, 'rules.json'), 'w'), indent=1)
    r = rules['races']
    print('races', len(r), 'learn', len(rules['learn']), 'techs', len(rules['techniques']),
          'forms', {k: {g: len(v) for g, v in fv.items()} for k, fv in rules['forms'].items()})
    for k, v in r.items():
        print(' ', k, v['genes'], v['multi'], v['icons'][:2], v['custom'])


if __name__ == '__main__':
    main()
