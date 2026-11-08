// Gameplay: player, monsters, combat, training, transformations, quests, saving.
// Formulas follow the original DM code (mobs.dm AttackMob, battle_system.dm Die, skills.dm).
'use strict';

const rand = (a, b) => a + Math.floor(Math.random() * (b - a + 1));
const fmt = n => Math.floor(n).toLocaleString('en-US');
const ZNAMES = { 1: 'Earth', 2: 'Snake Way', 3: 'Other World', 4: 'Heaven', 5: 'Namek', 8: 'Hell',
  10: 'Kami\'s Lookout', 12: 'King Kai\'s Planet', 14: 'Sacred World', 15: 'West City', 16: 'Satan City',
  17: 'Space', 18: 'Saga Battlefield', 19: 'Planet Dark', 20: 'East City', 21: 'North City',
  22: 'Capsule Town', 23: 'South City', 24: 'Hyperbolic Room' };
const SAVE_KEY = 'gekisen_save_v1';
const START = [70, 82, 10];
const DEATH_LOC = [55, 4, 3];
const REVIVE_LOC = [74, 35, 10];

const Game = {
  player: null,
  floaters: [],
  projectiles: [],
  monsters: new Set(),
  timers: [],
  moveDir: 0,
  now: 0,
  busy: null,          // 'meditate' | 'rest' | 'train' | 'power' | 'travel'
  lastAttack: 0,
  lastKi: 0,
  attackTurn: 0,
  lastSave: 0,
  log: [],
  onLog: null,
  onDialog: null,

  // ------------------------------------------------------------------ helpers
  msg(text, color) {
    this.log.push({ text, color: color || '#fff', t: performance.now() });
    if (this.log.length > 60) this.log.shift();
    this.onLog && this.onLog();
  },
  floater(x, y, z, text, color) {
    this.floaters.push({ x, y, z, text, color: color || '#ff0', t0: this.now, dur: 900 });
  },
  after(ms, fn) { this.timers.push({ t: this.now + ms, fn }); },
  mobDef(path) { return Assets.scripts.mobs[path]; },
  isWaterish(x, y, z) {
    const tt = World.turfTypes(x, y, z);
    if (!tt) return false;
    return tt.some(i => /water|ocean|lava|cliff/i.test(Assets.types[i].path));
  },
  zname(z) { return ZNAMES[z] || ('Area ' + z); },

  // -------------------------------------------------------------- map spawns
  spawnFromMap(typeIdx, x, y, z) {
    const t = Assets.types[typeIdx];
    const p = t.path;
    if (p.startsWith('/mob/monsters/')) return this.spawnMonster(p, x, y, z, t, true);
    const e = new Ent({
      x, y, z, icon: t.icon != null ? t.icon : null, state: t.state || '', dir: t.dir || 2,
      name: t.name, dense: t.dense, layer: t.layer || (p.startsWith('/mob') ? 4 : 3),
      pixel_x: t.pixel_x || 0, pixel_y: t.pixel_y || 0, invis: t.invis || 0,
      path: p, kind: p.startsWith('/mob') ? 'npc' : 'obj', type: t,
    });
    if (e.kind === 'npc' && e.icon == null) e.dense = 0;
    World.add(e);
    return e;
  },

  spawnMonster(path, x, y, z, t, fromMap) {
    const d = this.mobDef(path) || t || {};
    const icon = (t && t.icon != null) ? t.icon : d.icon;
    const st = (t && t.state != null) ? t.state : (d.state || '');
    const pl = Number(d.powerlevel) || 1, mpl = Number(d.maxpowerlevel) || pl;
    const hp = Number(d.hp) || 150, maxhp = Math.max(hp, Number(d.maxhp) || 150);
    const race = String(d.race || '');
    const civilian = path.indexOf('/people/') >= 0;
    const e = new Ent({
      x, y, z, icon, state: st, name: (d.name || path.split('/').pop()).replace(/\(NPC\)/, '').trim() || 'NPC',
      dense: 1, layer: 4, path, kind: 'monster', race, civilian,
      powerlevel: Math.max(pl, 1), maxpowerlevel: Math.max(mpl, pl, 1), strength: Number(d.strength) || 1,
      defense: Number(d.defense) || 0, hp, maxhp, home: [x, y, z], fromMap,
      nextThink: this.now + rand(200, 1500), nextAttack: 0, aggro: !civilian, target: null,
      respawn: fromMap && /freerange|people|demon|DarknessDemon/.test(path),
    });
    // NPC civilians get random clothes/hair like the original randomperson New()
    if (civilian) {
      const hairs = ['hair_kros_long.dmi', 'hair_punk.dmi', 'hair_yajirobe.dmi', 'hair_dan_spikeyshort.dmi',
        'hair_dan_long.dmi', 'hair_dan_short.dmi', 'hair_trunks.dmi', 'hair_dan_spikey.dmi'];
      const cols = [[255, 255, 153], [51, 51, 51], [170, 0, 0], [153, 102, 0], [51, 0, 0]];
      const clothes = ['clothes-blackshirt.dmi', 'clothes-redshirt.dmi', 'clothes-blueshirt.dmi',
        'clothes-greyshirt.dmi', 'clothes-blackgi.dmi', 'clothes-orangegi.dmi', 'clothes-greygi.dmi',
        'clothes-redgi.dmi', 'clothes-greenshirt.dmi'];
      const c = Assets.iconId(clothes[rand(0, clothes.length - 1)]);
      if (c != null) e.overlays.push({ icon: c });
      if (Math.random() < 0.8) {
        const h = Assets.iconId(hairs[rand(0, hairs.length - 1)]);
        if (h != null) e.overlays.push({ icon: h, tint: cols[rand(0, cols.length - 1)] });
      }
      e.aggro = false;
    }
    if (/Training|Killable/.test(race)) e.aggro = false;
    World.add(e);
    this.monsters.add(e);
    return e;
  },

  // ----------------------------------------------------------- player setup
  newPlayer(opts) {
    const r = RACES[opts.raceKey];
    const p = {
      name: opts.name || 'Fighter', raceKey: opts.raceKey, race: r.race, gender: opts.gender || 'Male',
      skin: opts.skin || 'Tan', hair: opts.hair || 'Spikey', hairColor: opts.hairColor || [0, 0, 0],
      powerlevel: 100, maxpowerlevel: 100, hp: 200, maxhp: 200, ki: 100, maxki: 100,
      stamina: 100, maxstamina: 100, zenni: 0, strength: 1, defense: 1, questsdone: 0,
      dead: 0, x: START[0], y: START[1], z: START[2], dir: 2, form: -1, unlocked: 0,
      clothes: [], kicolor: 'yellow', flight: 0, kills: 0, created: Date.now(), playtime: 0,
    };
    // Buu Demon easter egg from the original (1 in 750)
    if (Math.random() < 1 / 750) {
      p.race = 'Buu Demon'; p.buu = 1; p.powerlevel = 5; p.maxpowerlevel = 5 + rand(1, 15000);
    }
    if (r.race === 'Bio-Android') { p.powerlevel = p.maxpowerlevel = 540; }
    if (r.race === 'Android') { p.powerlevel = p.maxpowerlevel = 1000; }
    return p;
  },

  baseIcon(p) {
    const r = RACES[p.raceKey];
    if (p.buu) return Assets.iconId('buu.dmi');
    if (r.icon) return Assets.iconId(r.icon);
    return Assets.iconId(SKIN_ICONS[p.gender][p.skin]);
  },

  buildAppearance() {
    const p = this.player, e = this.pe;
    const r = RACES[p.raceKey];
    const tr = p.form >= 0 ? TRANS[r.trans[p.form]] : null;
    e.icon = (tr && tr.icon && Assets.iconId(tr.icon) != null) ? Assets.iconId(tr.icon) : this.baseIcon(p);
    e.overlays = [];
    e.underlays = [];
    for (const c of p.clothes) {
      const id = Assets.iconId(c);
      if (id != null) e.overlays.push({ icon: id });
    }
    if (r.hair && !p.buu) {
      let hid = null, tint = null;
      if (tr && tr.hair) hid = Assets.iconId(tr.hair);
      else if (tr && tr.ts) {
        const s = SSJ_HAIR[HAIRSTYLES[p.hair] ? HAIRSTYLES[p.hair][0] : 'Spikey'] || SSJ_HAIR.Spikey;
        hid = Assets.iconId(s[0]); tint = s[1] || null;
      } else if (HAIRSTYLES[p.hair] && HAIRSTYLES[p.hair][1]) {
        hid = Assets.iconId(HAIRSTYLES[p.hair][1]); tint = p.hairColor;
      }
      if (hid != null) e.overlays.push({ icon: hid, tint: (tint && tint.some(v => v)) ? tint : null });
    }
    if (r.tail && !p.tailCut) {
      const t = Assets.iconId('tail.dmi');
      if (t != null) e.overlays.push({ icon: t });
    }
    if (tr && tr.over) { const o = Assets.iconId(tr.over); if (o != null) e.overlays.push({ icon: o }); }
    if (tr && tr.elec) { const o = Assets.iconId(tr.elec); if (o != null) e.overlays.push({ icon: o, state: '' }); }
    if (tr && tr.under) { const u = Assets.iconId(tr.under); if (u != null) e.underlays.push({ icon: u, state: '' }); }
    if (this.busy === 'power') {
      const a = Assets.iconId('whiteaura.dmi');
      if (a != null) e.underlays.push({ icon: a, state: '', tint: [0, 0, 120] });
    }
    if (p.dead) { const h = Assets.iconId('halo.dmi'); if (h != null) e.overlays.push({ icon: h, state: '' }); }
    e.name = p.name;
  },

  async start(p) {
    for (const k of ['powerlevel', 'maxpowerlevel', 'hp', 'maxhp', 'ki', 'maxki', 'stamina', 'maxstamina', 'zenni']) {
      if (!Number.isFinite(p[k])) p[k] = { hp: p.maxhp || 150, maxhp: 150, maxstamina: 100, stamina: 100, ki: 100, maxki: 100, zenni: 0 }[k] || p.maxpowerlevel || 100;
    }
    this.player = p;
    this.recalcStats();
    this.pe = new Ent({ x: p.x, y: p.y, z: p.z, dir: p.dir, kind: 'player', dense: 1, layer: 4, name: p.name });
    this.busy = null;
    this.buildAppearance();
    await World.loadZ(p.z);
    World.add(this.pe);
    this.updateState();
    this.msg('Welcome to Gekisen, ' + p.name + '!', '#ffb000');
    if (!p.introDone) {
      this.msg('Train with the equipment, then talk to the Sensei to leave the training hall.', '#9cf');
      p.introDone = 1;
    }
    this.checkUnlocks(true);
  },

  // --------------------------------------------------------------- per frame
  update(now) {
    this.now = now;
    const p = this.player;
    if (!p) return;
    // timers
    if (this.timers.length) {
      const due = this.timers.filter(t => t.t <= now);
      this.timers = this.timers.filter(t => t.t > now);
      for (const t of due) t.fn();
    }
    this.floaters = this.floaters.filter(f => now - f.t0 < f.dur);
    // movement
    if (this.moveDir && !this.pe.isMovingStrict(now) && !this.traveling) this.tryStep(this.moveDir);
    // monsters near player
    for (const m of this.monsters) {
      if (m.z !== this.pe.z || m.dead) continue;
      if (now >= m.nextThink) this.think(m);
    }
    this.updateProjectiles(now);
    this.tickStats(now);
    if (now - this.lastSave > 30000) { this.save(); this.lastSave = now; }
  },

  lastTick: 0,
  tickStats(now) {
    if (now - this.lastTick < 500) return;
    const dt = now - this.lastTick;
    this.lastTick = now;
    const p = this.player;
    p.playtime += dt / 1000;
    const r = RACES[p.raceKey];
    // transformation drain (objects.dm: drain reduced by mastery)
    if (p.form >= 0) {
      const tr = TRANS[r.trans[p.form]];
      const mastery = p.maxpowerlevel / (tr.prereq + 1);
      let drain = tr.drain;
      for (const th of [1.2, 1.5, 1.8, 2, 2.3, 2.5, 2.8, 3]) if (mastery > th) drain--;
      drain = Math.max(0, drain);
      if (drain && Math.random() < 0.5) p.stamina -= drain * 0.5;
      if (p.stamina <= 0) { p.stamina = 0; this.msg('You are too exhausted to stay transformed.', '#f88'); this.revert(); }
      p.powerlevel = p.maxpowerlevel * tr.boost;
    } else if (!this.busy || this.busy !== 'power') {
      // natural recovery of current PL toward max
      if (p.powerlevel < p.maxpowerlevel) p.powerlevel = Math.min(p.maxpowerlevel, p.powerlevel + p.maxpowerlevel / 40);
      if (p.powerlevel > p.maxpowerlevel && p.form < 0) p.powerlevel = p.maxpowerlevel;
    }
    // slow passive regen when idle
    if (!this.busy && !this.inCombat()) {
      p.stamina = Math.min(p.maxstamina, p.stamina + 0.25);
      p.ki = Math.min(p.maxki, p.ki + p.maxki / 400);
      p.hp = Math.min(p.maxhp, p.hp + 0.15);
    }
    // ki capacity grows with power (original kept maxki separate; tie it loosely to PL)
    const wantKi = 100 + Math.floor(Math.sqrt(p.maxpowerlevel) * 2);
    if (p.maxki < wantKi) p.maxki = wantKi;
    this.recalcStats();
    // heal tanks / healing objects
    for (const e of World.at(this.pe.x, this.pe.y, this.pe.z)) {
      if (e.path === '/obj/heal' || e.path === '/obj/spar') {
        p.hp = Math.min(p.maxhp, p.hp + 10); p.stamina = Math.min(p.maxstamina, p.stamina + 5);
      }
    }
    this.checkUnlocks(false);
  },

  // Antihack.dm CheatChecker2(): derived player stats
  recalcStats() {
    const p = this.player;
    p.defense = 100 + p.maxki / 30 * 4;
    p.strength = 100 + p.maxki / 5 * 4;
    p.maxhp = 200 + (p.hpBonus || 0);
    if (p.hp > p.maxhp) p.hp = p.maxhp;
  },

  inCombat() { return this.now - Math.max(this.lastAttack, this.lastHurt || 0) < 4000; },

  // ---------------------------------------------------------------- movement
  setMoveDir(d) { this.moveDir = d; },

  tryStep(d) {
    const p = this.player, e = this.pe;
    if (this.busy && this.busy !== 'power') this.stopBusy();
    if (this.busy === 'power') this.stopBusy();
    e.dir = d;
    p.dir = d;
    let nx = e.x + DIR_DX[d], ny = e.y + DIR_DY[d];
    const dur = p.flight ? 110 : 160;
    if (World.canEnter(e, nx, ny, e.z)) {
      // diagonal moves must not cut corners through solid tiles
      World.moveEnt(e, nx, ny, e.z, dur, this.now);
      this.onEnter(nx, ny, e.z);
    } else if (DIR_DX[d] && DIR_DY[d]) {
      // slide along walls
      if (World.canEnter(e, e.x + DIR_DX[d], e.y, e.z)) {
        World.moveEnt(e, e.x + DIR_DX[d], e.y, e.z, dur, this.now); this.onEnter(e.x, e.y, e.z);
      } else if (World.canEnter(e, e.x, e.y + DIR_DY[d], e.z)) {
        World.moveEnt(e, e.x, e.y + DIR_DY[d], e.z, dur, this.now); this.onEnter(e.x, e.y, e.z);
      }
    } else {
      const tur = World.turf(nx, ny, e.z);
      if (tur && tur.enter && tur.enter.warp) this.onEnterRule(tur.enter);
    }
    p.x = e.x; p.y = e.y; p.z = e.z;
  },

  onEnter(x, y, z) {
    const tur = World.turf(x, y, z);
    if (tur && tur.enter) this.onEnterRule(tur.enter);
  },

  onEnterRule(rule) {
    const e = this.pe;
    if (rule.warp) {
      const [x, y, z] = rule.warp;
      this.teleport(x, y, z);
    } else if (rule.wrap) {
      const v = parseInt(rule.wrap.slice(1), 10);
      if (rule.wrap[0] === 'x') this.teleport(v, e.y, e.z, true);
      else this.teleport(e.x, v, e.z, true);
    }
  },

  async teleport(x, y, z, quiet) {
    const e = this.pe;
    const zchange = z !== e.z;
    if (zchange) {
      this.traveling = true;
      await World.loadZ(z);
      this.traveling = false;
      if (!quiet) this.msg('You arrive at ' + this.zname(z) + '.', '#9cf');
    }
    // find nearest free tile
    let tx = x, ty = y;
    if (!World.canEnter(e, x, y, z)) {
      outer: for (let r = 1; r < 4; r++) for (let dx = -r; dx <= r; dx++) for (let dy = -r; dy <= r; dy++) {
        if (World.canEnter(e, x + dx, y + dy, z)) { tx = x + dx; ty = y + dy; break outer; }
      }
    }
    World.moveEnt(e, tx, ty, z, 0, this.now);
    const p = this.player;
    p.x = e.x; p.y = e.y; p.z = e.z;
    this.projectiles = this.projectiles.filter(pr => pr.z === z);
  },

  // ------------------------------------------------------------------ combat
  facingTarget() {
    const e = this.pe;
    const fx = e.x + DIR_DX[e.dir], fy = e.y + DIR_DY[e.dir];
    let t = World.at(fx, fy, e.z).find(o => (o.kind === 'monster' || o.kind === 'npc') && !o.dead);
    if (t) return t;
    // auto-face the nearest adjacent monster (touch friendly)
    for (const d of [2, 1, 4, 8, 6, 10, 5, 9]) {
      const o = World.at(e.x + DIR_DX[d], e.y + DIR_DY[d], e.z).find(m => m.kind === 'monster' && !m.dead);
      if (o) { e.dir = d; this.player.dir = d; return o; }
    }
    return null;
  },

  damage(att, def) {
    // mobs.dm AttackMob
    const dpl = Math.max(1, def.powerlevel);
    let dmg = (att.powerlevel / dpl) * 2;
    const ratio = (att.strength || 1) / ((def.defense || 0) + (def.strength || 1));
    if (dmg < 1) dmg = 1 + ratio;
    if (dmg > 40) dmg = 40 + ratio;
    return dmg;
  },

  attack() {
    const p = this.player, e = this.pe;
    if (this.now - this.lastAttack < 420 || p.dead && false) return;
    if (this.busy) this.stopBusy();
    const t = this.facingTarget();
    const fl = ['sparfury', 'sparkick', 'sparpunch'][rand(0, 2)];
    e.doFlick(Assets.hasState(e.icon, fl) ? fl : 'sparfury', this.now);
    this.lastAttack = this.now;
    if (!t) return;
    if (t.kind === 'npc') { this.interact(t); return; }
    if (World.isSafe(e.x, e.y, e.z) || World.isSafe(t.x, t.y, t.z)) { this.msg('This is a no pk zone.', '#f88'); return; }
    if (p.stamina < 1) { this.msg('You are too tired!', '#f88'); return; }
    const dmg = this.damage(p, t);
    t.hp -= dmg;
    t.target = e;
    if (t.civilian) this.flee(t);
    Assets.play(fl === 'sparkick' ? 'kickhit.wav' : 'punchhit.wav', 0.4);
    t.doFlick('sparhit', this.now);
    this.floater(t.x, t.y, t.z, dmg.toFixed(1), '#ffd23f');
    p.stamina = Math.max(0, p.stamina - 0.3);
    // gains: rand(0,30) on a lucky punch, small otherwise; plus the attackturn bonus
    p.maxpowerlevel += Math.random() < 1 / 7 ? rand(0, 30) : rand(0, 1);
    if (this.now - this.attackTurn > 4000) {
      this.attackTurn = this.now;
      const gb = Math.min(p.maxpowerlevel, 5000000);
      p.maxpowerlevel += gb / 4000 + rand(1, 10);
    }
    if (t.hp <= 0) this.monsterDie(t);
  },

  kiBlast() {
    const p = this.player, e = this.pe;
    if (this.now - this.lastKi < 600) return;
    if (this.busy) this.stopBusy();
    if (World.isSafe(e.x, e.y, e.z)) { this.msg('This is a no pk zone.', '#f88'); return; }
    const cost = p.maxki / 20;
    if (p.ki < cost) { this.msg('You are out of Ki.', '#f88'); return; }
    this.lastKi = this.now;
    p.ki -= cost;
    let amount = (p.maxpowerlevel / 20) * (p.powerlevel / Math.max(1, p.maxpowerlevel));
    if (p.form >= 0) amount = (p.maxpowerlevel / 20) * TRANS[RACES[p.raceKey].trans[p.form]].boost;
    e.doFlick('ki', this.now);
    Assets.play('burning_fire.wav', 0.4);
    this.fire(e, KI_COLORS[p.kicolor] || 'kame7.dmi', amount, e.dir, 8);
  },

  fire(owner, iconName, amount, dir, steps) {
    let d = dir;
    if (d === 5 || d === 9) d = 1; else if (d === 6 || d === 10) d = 2;
    const pr = new Ent({ x: owner.x, y: owner.y, z: owner.z, dir: d, icon: Assets.iconId(iconName), state: '',
      layer: 5, kind: 'proj', owner, amount, steps, nextStep: this.now + 40 });
    World.add(pr);
    this.projectiles.push(pr);
  },

  updateProjectiles(now) {
    for (const pr of this.projectiles) {
      if (pr.dead || now < pr.nextStep) continue;
      pr.nextStep = now + 55;
      const nx = pr.x + DIR_DX[pr.dir], ny = pr.y + DIR_DY[pr.dir];
      const hit = World.at(nx, ny, pr.z).find(o => o !== pr.owner && !o.dead &&
        (o.kind === 'monster' || o.kind === 'player') && !(pr.owner.kind === 'monster' && o.kind === 'monster'));
      const tur = World.turf(nx, ny, pr.z);
      if (hit) {
        this.kiHit(pr, hit);
        this.killProj(pr);
        continue;
      }
      if (!tur || (tur.dense && !this.isWaterish(nx, ny, pr.z)) || pr.steps <= 0) { this.killProj(pr); continue; }
      World.moveEnt(pr, nx, ny, pr.z, 55, now);
      pr.steps--;
    }
    this.projectiles = this.projectiles.filter(p => !p.dead);
  },

  killProj(pr) {
    pr.dead = true;
    World.remove(pr);
  },

  kiHit(pr, o) {
    // obj/Kishot: amount=(damage/(O.powerlevel+1))*150
    const isP = o.kind === 'player';
    const tgt = isP ? this.player : o;
    if (isP && (this.dying || this.player.dead && o.z !== this.pe.z)) return;
    let amount = (pr.amount / (tgt.powerlevel + 1)) * 150;
    if (isP && this.busy === 'block') amount /= 5;
    amount = Math.min(amount, tgt.maxhp * 0.6);
    if (!isP) o.hp -= amount;
    Assets.play('expload.wav', 0.3);
    this.floater(o.x, o.y, o.z, amount.toFixed(1), o.kind === 'player' ? '#ff5050' : '#7ff');
    if (o.kind === 'monster') {
      o.target = this.pe;
      if (o.civilian) this.flee(o);
      this.player.maxpowerlevel += rand(0, 3);
      if (o.hp <= 0) this.monsterDie(o);
    } else if (isP) {
      this.player.hp -= amount;
      this.lastHurt = this.now;
      if (this.player.hp <= 0) this.playerDie(pr.owner);
    }
  },

  // ------------------------------------------------------------ monster AI
  think(m) {
    const pe = this.pe, p = this.player;
    m.nextThink = this.now + (m.aggro ? rand(380, 650) : rand(1500, 4000));
    const dx = pe.x - m.x, dy = pe.y - m.y, dist = Math.max(Math.abs(dx), Math.abs(dy));
    const engaged = m.target === pe || (m.aggro && dist <= 6 && !p.dead && !World.isSafe(pe.x, pe.y, pe.z));
    if (m.fleeUntil && this.now < m.fleeUntil) {
      this.stepMob(m, this.dirTo(-dx, -dy));
      return;
    }
    if (engaged && dist <= 12 && !World.isSafe(m.x, m.y, m.z)) {
      // regain power slowly like the original (1 in 20 chance)
      if (m.powerlevel < m.maxpowerlevel && Math.random() < 0.05) m.powerlevel = Math.min(m.maxpowerlevel, m.powerlevel + m.maxpowerlevel / 20);
      if (dist <= 1) {
        m.dir = this.dirTo(dx, dy);
        if (this.now >= m.nextAttack) {
          m.nextAttack = this.now + rand(900, 1400);
          this.monsterAttack(m);
        }
      } else {
        // bosses (and strong monsters) sometimes fire ki
        if ((dx === 0 || dy === 0) && dist <= 6 && m.maxpowerlevel >= 10000 && Math.random() < 0.12) {
          m.dir = this.dirTo(dx, dy);
          m.doFlick('ki', this.now);
          this.fire(m, 'kame7red.dmi', m.powerlevel / 20, m.dir, 7);
        } else {
          this.chase(m, dx, dy);
        }
      }
      return;
    }
    m.target = null;
    // wander near home
    if (Math.random() < 0.5) {
      let d = [1, 2, 4, 8][rand(0, 3)];
      const [hx, hy] = m.home;
      if (Math.abs(m.x - hx) > 5 || Math.abs(m.y - hy) > 5) d = this.dirTo(hx - m.x, hy - m.y);
      this.stepMob(m, d);
    }
  },

  dirTo(dx, dy) {
    let d = 0;
    if (dy > 0) d |= 1; else if (dy < 0) d |= 2;
    if (dx > 0) d |= 4; else if (dx < 0) d |= 8;
    return d || 2;
  },

  chase(m, dx, dy) {
    const d = this.dirTo(dx, dy);
    if (this.stepMob(m, d)) return;
    // try the two axis-aligned alternatives
    const alts = [];
    if (dx) alts.push(dx > 0 ? 4 : 8);
    if (dy) alts.push(dy > 0 ? 1 : 2);
    for (const a of alts) if (a !== d && this.stepMob(m, a)) return;
    this.stepMob(m, [1, 2, 4, 8][rand(0, 3)]);
  },

  stepMob(m, d) {
    const nx = m.x + DIR_DX[d], ny = m.y + DIR_DY[d];
    m.dir = d;
    if (!World.canEnter(m, nx, ny, m.z)) return false;
    const tur = World.turf(nx, ny, m.z);
    if (tur && tur.enter && (tur.enter.warp || tur.enter.wrap)) return false;
    World.moveEnt(m, nx, ny, m.z, 280, this.now);
    return true;
  },

  flee(m) {
    m.fleeUntil = this.now + 2500;
    m.nextThink = this.now;
  },

  monsterAttack(m) {
    const p = this.player;
    if (m.z !== this.pe.z || this.dying) return;
    const dmg = this.damage(m, p) / (this.busy === 'block' ? 5 : 1);
    const fl = ['sparfury', 'sparkick', 'sparpunch'][rand(0, 2)];
    m.doFlick(fl, this.now);
    p.hp -= dmg;
    this.lastHurt = this.now;
    this.pe.doFlick('sparhit', this.now);
    Assets.play('punchhit.wav', 0.25);
    this.floater(this.pe.x, this.pe.y, this.pe.z, dmg.toFixed(1), '#ff5050');
    // getting hit toughens you up a little
    p.maxpowerlevel += rand(0, 1);
    if (this.busy && this.busy !== 'block') this.stopBusy();
    if (p.hp <= 0) this.playerDie(m);
  },

  monsterDie(m) {
    if (m.dead) return;
    const p = this.player;
    m.dead = true;
    World.remove(m);
    p.kills++;
    const boss = Assets.scripts.quests.bosses[m.race];
    if (boss) return this.bossDie(m, boss);
    if (m.civilian) {
      this.msg('You killed ' + m.name + '...', '#aaa');
    } else {
      // battle_system.dm FreeEnemy(NPC) rewards
      const mp = m.maxpowerlevel;
      let gain, zen;
      if (mp <= 100000) { gain = mp / 50 + rand(20, 50); zen = mp <= 20000 ? rand(20, 50) : rand(50, 90); }
      else if (mp < 500000) { gain = mp / 100 + rand(20, 50); zen = rand(50, 90); }
      else if (mp < 2000000) { gain = mp / 150 + rand(20, 50); zen = rand(50, 90); }
      else if (mp < 5000000) { gain = mp / 200 + rand(20, 50); zen = rand(50, 90); }
      else { gain = mp / 300 + rand(20, 50); zen = rand(50, 90); }
      if (p.maxpowerlevel > mp) gain = gain / (p.maxpowerlevel / mp);
      gain = Math.max(1, Math.floor(gain));
      p.maxpowerlevel += gain;
      p.zenni = Math.min(10000000, p.zenni + zen);
      this.msg('You defeated ' + m.name + '! +' + fmt(gain) + ' max PL, +' + zen + ' zenni', '#7f7');
    }
    if (m.respawn) {
      this.after(rand(50000, 60000), () => {
        const [x, y, z] = m.home;
        this.monsters.delete(m);
        this.spawnMonster(m.path, x, y, z, null, true);
      });
    } else {
      this.monsters.delete(m);
    }
  },

  bossDie(m, b) {
    const p = this.player;
    p.zenni = Math.min(10000000, p.zenni + b.zenni);
    if (b.bonus) p.maxpowerlevel += b.bonus;
    // still more of this group alive on this z (e.g. 3 saibamen, Cell Jrs)?
    const others = [...this.monsters].some(o => o !== m && !o.dead && o.race === m.race && o.z === m.z);
    this.monsters.delete(m);
    this.msg('You defeated ' + m.name + '!' + (b.zenni ? ' +' + fmt(b.zenni) + ' zenni' : ''), '#ffb000');
    if (others) return;
    const msgs = b.msgs || [];
    msgs.slice(1).forEach((t, i) => this.after(900 * (i + 1), () => this.msg(t, '#ffd27f')));
    if (b.spawn) {
      const [path, x, y, z] = b.spawn;
      this.after(1500, () => {
        const exists = [...this.monsters].some(o => o.path === path && !o.dead && o.z === z);
        if (!exists) { this.spawnMonster(path, x, y, z, null, false); this.msg((this.mobDef(path) || {}).name + ' appears!', '#f66'); }
      });
    }
    if (b.quest != null && p.questsdone < b.quest) {
      p.questsdone = b.quest;
      this.after(3000, () => {
        if (b.warp) this.teleport(b.warp[0], b.warp[1], b.warp[2]);
        this.msg('Saga progress: ' + p.questsdone + '/24. ' + this.nextQuestHint(), '#9cf');
        this.save();
      });
    }
  },

  async playerDie(killer) {
    const p = this.player;
    if (this.dying) return;
    this.dying = true;
    p.hp = p.maxhp;
    this.revert(true);
    this.stopBusy();
    this.msg((killer && killer.name ? killer.name + ' has defeated you!' : 'You have been defeated!'), '#f55');
    if (p.dead) {
      this.msg('Your spirit reforms at the check-in station.', '#ccc');
    } else {
      this.msg('You died. Ask Baba to return you to the living world.', '#ccc');
    }
    p.dead = 1;
    for (const m of this.monsters) if (m.target === this.pe) m.target = null;
    await new Promise(r => setTimeout(r, 900));
    p.hp = p.maxhp; p.stamina = p.maxstamina; p.powerlevel = p.maxpowerlevel; p.ki = p.maxki;
    await this.teleport(DEATH_LOC[0], DEATH_LOC[1], DEATH_LOC[2]);
    this.buildAppearance();
    this.dying = false;
    this.save();
  },

  revive() {
    const p = this.player;
    p.dead = 0;
    this.buildAppearance();
    this.teleport(REVIVE_LOC[0], REVIVE_LOC[1], REVIVE_LOC[2]);
    this.msg('You return to the land of the living!', '#7f7');
  },

  // --------------------------------------------------------------- training
  stopBusy() {
    const was = this.busy;
    this.busy = null;
    if (this.busyTimer) { clearInterval(this.busyTimer); this.busyTimer = null; }
    this.updateState();
    if (was === 'power') this.buildAppearance();
    if (was === 'meditate') this.msg('You stop meditating.');
    if (was === 'rest') this.msg('You stop resting.');
    if (was === 'train') this.msg('You stop training.');
  },

  updateState() {
    const e = this.pe;
    if (!e) return;
    if (this.busy === 'meditate' || this.busy === 'rest') e.state = 'meditate';
    else if (this.busy === 'train' && this.trainKind === 'lift') e.state = 'weight-lifting';
    else if (this.player.flight) e.state = 'buku';
    else if (this.busy === 'block') e.state = Assets.hasState(e.icon, 'sparblock') ? 'sparblock' : '';
    else e.state = '';
  },

  startBusy(kind, interval, fn) {
    if (this.busy === kind) { this.stopBusy(); return; }
    if (this.busy) this.stopBusy();
    this.busy = kind;
    this.updateState();
    this.busyTimer = setInterval(() => {
      if (this.busy !== kind) return;
      fn();
    }, interval);
  },

  meditate() {
    const p = this.player;
    if (this.busy === 'meditate') return this.stopBusy();
    if (p.flight) { this.msg('Not while flying.'); return; }
    this.msg('You begin meditating.', '#9cf');
    // mobs.dm meditate(): every 5s stamina -= rand(1,2); 1 in 2: maxPL += rand(20,50)
    this.startBusy('meditate', 2500, () => {
      if (p.stamina < 1) { this.msg('You are too tired to keep meditating.'); return this.stopBusy(); }
      p.stamina -= rand(1, 2);
      p.ki = Math.min(p.maxki, p.ki + p.maxki / 10);
      if (Math.random() < 0.5) {
        const g = rand(20, 50) + Math.floor(p.maxpowerlevel / 5000);
        p.maxpowerlevel += g;
        this.floater(this.pe.x, this.pe.y, this.pe.z, '+' + g, '#9cf');
      }
    });
  },

  rest() {
    const p = this.player;
    if (this.busy === 'rest') return this.stopBusy();
    if (p.flight) { this.msg('Not while flying.'); return; }
    this.msg('You start resting.', '#9cf');
    let regen = 1;
    // mobs.dm Resting(): stamina += rand(1,2), hp += regenrate (doubling)
    this.startBusy('rest', 500, () => {
      p.stamina = Math.min(p.maxstamina, p.stamina + rand(1, 2));
      p.hp = Math.min(p.maxhp, p.hp + regen);
      regen = Math.min(regen * 2, 40);
      p.ki = Math.min(p.maxki, p.ki + p.maxki / 50);
      if (p.hp >= p.maxhp && p.stamina >= p.maxstamina) { this.msg('You feel fully rested.'); this.stopBusy(); }
    });
  },

  powerUp() {
    const p = this.player;
    if (this.busy === 'power') return this.stopBusy();
    if (p.stamina < 5) { this.msg('You feel too tired.', '#f88'); return; }
    this.msg('An aura flickers around you.', '#9cf');
    Assets.play('powerup.wav', 0.4);
    this.startBusy('power', 500, () => {
      p.ki = Math.min(p.maxki, p.ki + p.maxki / 8);
      p.stamina -= rand(1, 3) / 2;
      if (p.powerlevel < p.maxpowerlevel) p.powerlevel = Math.min(p.maxpowerlevel, p.powerlevel + p.maxpowerlevel / rand(15, 20));
      if (Math.random() < 0.15) p.maxpowerlevel += rand(1, 5);
      if (p.stamina <= 0 || p.ki >= p.maxki) { this.msg('You finish powering up.'); this.stopBusy(); }
    });
    this.buildAppearance();
  },

  block() {
    if (this.busy === 'block') return this.stopBusy();
    if (this.busy) this.stopBusy();
    this.busy = 'block';
    this.updateState();
  },

  toggleFlight() {
    const p = this.player;
    if (p.maxpowerlevel < 1000 && !p.flight) { this.msg('You need 1,000 max PL to learn Bukujutsu (flight).', '#f88'); return; }
    if (this.busy) this.stopBusy();
    p.flight = p.flight ? 0 : 1;
    this.msg(p.flight ? 'You take to the sky.' : 'You land.', '#9cf');
    if (!p.flight && !World.canEnter(this.pe, this.pe.x, this.pe.y, this.pe.z) && this.isWaterish(this.pe.x, this.pe.y, this.pe.z)) {
      p.flight = 1; this.msg('You can\'t land here!', '#f88');
    }
    this.pe.flying = !!p.flight;
    this.updateState();
  },

  trainOn(obj) {
    const p = this.player;
    const eq = EQUIPMENT[obj.path];
    if (!eq) return false;
    if (p.maxpowerlevel < eq.req) { this.msg('You need ' + fmt(eq.req) + ' max PL to use the ' + eq.label + '.', '#f88'); return true; }
    if (this.busy === 'train') { this.stopBusy(); return true; }
    this.trainKind = eq.kind;
    this.msg('You begin training on the ' + eq.label + '.', '#9cf');
    const face = this.dirTo(obj.x - this.pe.x, obj.y - this.pe.y);
    if (obj.x !== this.pe.x || obj.y !== this.pe.y) this.pe.dir = face;
    this.startBusy('train', eq.kind === 'lift' ? 1500 : 1000, () => {
      if (p.stamina < 5) { this.msg('You feel too weak to continue.', '#f88'); return this.stopBusy(); }
      p.stamina -= eq.kind === 'lift' ? 2 : 1;
      if (eq.kind === 'bag') { this.pe.doFlick('weight-training-right', this.now); obj.doFlick('pbaghit', this.now); }
      if (eq.kind === 'dummy') { this.pe.doFlick(['sparfury', 'sparkick'][rand(0, 1)], this.now); }
      const g = rand(eq.gain[0], eq.gain[1]);
      p.maxpowerlevel += g;
      this.floater(this.pe.x, this.pe.y, this.pe.z, '+' + g, '#9f9');
    });
    return true;
  },

  // ----------------------------------------------------------- transforming
  checkUnlocks(silent) {
    const p = this.player;
    const r = RACES[p.raceKey];
    while (p.unlocked < r.trans.length && p.maxpowerlevel >= TRANS[r.trans[p.unlocked]].prereq) {
      const tr = TRANS[r.trans[p.unlocked]];
      p.unlocked++;
      if (!silent) {
        this.msg('You sense a hidden power about to be released... You can now use ' + tr.name + '!', '#ffb000');
        this.pe.doFlick('trans', this.now);
      }
    }
  },

  transform() {
    const p = this.player;
    const r = RACES[p.raceKey];
    if (!p.unlocked) {
      this.msg('You have not unlocked a transformation yet (' + TRANS[r.trans[0]].name + ' at ' + fmt(TRANS[r.trans[0]].prereq) + ' max PL).', '#f88');
      return;
    }
    if (p.form + 1 >= p.unlocked) { this.msg('You can\'t go any further. Train more!', '#f88'); return; }
    if (p.stamina < 10) { this.msg('You are too tired to transform.', '#f88'); return; }
    p.form++;
    const tr = TRANS[r.trans[p.form]];
    p.powerlevel = p.maxpowerlevel * tr.boost;
    this.msg('You transform into ' + tr.name + '!', '#ffb000');
    Assets.play('powerup.wav', 0.6);
    this.pe.doFlick('trans', this.now);
    this.buildAppearance();
  },

  revert(quiet) {
    const p = this.player;
    if (p.form < 0) return;
    p.form = -1;
    if (p.powerlevel > p.maxpowerlevel) p.powerlevel = p.maxpowerlevel;
    if (!quiet) this.msg('You revert to your normal form.');
    this.buildAppearance();
  },

  // ------------------------------------------------------------ interaction
  nearby() {
    const e = this.pe;
    const out = [];
    for (let dx = -1; dx <= 1; dx++) for (let dy = -1; dy <= 1; dy++) {
      for (const o of World.at(e.x + dx, e.y + dy, e.z)) {
        if (o === e || o.dead || o.kind === 'proj') continue;
        if (this.interactable(o)) out.push(o);
      }
    }
    // prefer the faced tile
    const fx = e.x + DIR_DX[e.dir], fy = e.y + DIR_DY[e.dir];
    out.sort((a, b) => ((b.x === fx && b.y === fy) - (a.x === fx && a.y === fy)) || ((a.x === e.x && a.y === e.y) ? -1 : 0));
    return out;
  },

  interactable(o) {
    if (o.kind === 'npc') return true;
    if (o.kind === 'monster') return o.civilian || /Training/.test(o.race);
    if (EQUIPMENT[o.path]) return true;
    if (/Quest\d+Enter/.test(o.path)) return true;
    if (/heal|Gravitron|Sign|dragonballs/.test(o.path)) return true;
    return false;
  },

  interact(o) {
    const p = this.player;
    if (!o) {
      const list = this.nearby();
      if (!list.length) { this.msg('There is nothing here to interact with.', '#888'); return; }
      o = list[0];
    }
    if (EQUIPMENT[o.path]) { this.trainOn(o); return; }
    const q = Assets.scripts.quests.entrances[o.path];
    if (q) return this.questEntrance(q);
    if (o.civilian) { this.dialog(o.name || 'Villager', NPC_TALK[rand(0, NPC_TALK.length - 1)]); return; }
    if (o.path === '/obj/heal') { p.hp = p.maxhp; p.stamina = p.maxstamina; this.msg('You feel refreshed.', '#7f7'); return; }
    if (/Gravitron/.test(o.path)) {
      this.dialog('Gravity Machine', 'The gravity machine hums. Training in high gravity was removed in this single-player version - use the weights and bags instead!');
      return;
    }
    if (/dragonballs/.test(o.path)) {
      p.dragonballs = p.dragonballs || {};
      p.dragonballs[o.path] = 1;
      World.remove(o);
      o.dead = true;
      const n = Object.keys(p.dragonballs).length;
      this.msg('You found a Dragonball! (' + n + '/7)', '#ffb000');
      if (n >= 7) this.wishMenu();
      return;
    }
    this.npcTalk(o);
  },

  questEntrance(q) {
    const p = this.player;
    this.choose(q.title, q.prompt, ['Yes', 'No'], async ch => {
      if (ch !== 'Yes') return;
      if (p.questsdone < q.req) { this.msg('It isn\'t time for this fight yet. ' + this.nextQuestHint(), '#f88'); return; }
      if (p.questsdone > q.req) { this.msg(q.done, '#aaa'); return; }
      await this.teleport(q.dest[0], q.dest[1], q.dest[2]);
      // spawn the encounter unless it is already in progress
      const alive = {};
      for (const m of this.monsters) if (!m.dead && m.z === 18) alive[m.path] = (alive[m.path] || 0) + 1;
      for (const s of q.spawns) {
        if (alive[s[0]]) { alive[s[0]]--; continue; }
        this.spawnMonster(s[0], s[1], s[2], s[3], null, false);
      }
      this.msg('Defeat ' + q.title + '!', '#f66');
    });
  },

  nextQuestHint() {
    const p = this.player;
    if (p.questsdone >= 24) return 'You have completed every saga!';
    for (const [path, q] of Object.entries(Assets.scripts.quests.entrances)) {
      if (q.req !== p.questsdone) continue;
      // find an entrance placed outside the arena (z18)
      const tidx = Object.keys(Assets.types).filter(k => Assets.types[k].path === path).map(Number);
      const spots = Assets.map.entities.filter(e => tidx.includes(e[0]) && e[3] !== 18);
      if (spots.length) {
        const s = spots[0];
        return 'Next: ' + q.title + ' - find the entrance on ' + this.zname(s[3]) + ' at (' + s[1] + ',' + s[2] + ').';
      }
      return 'Next: ' + q.title + '.';
    }
    return '';
  },

  npcTalk(o) {
    const p = this.player;
    const path = o.path;
    if (/Shopkeeper/.test(path) || path === '/mob/NPCs/Bulma') return this.shop(o);
    if (path === '/mob/Barber') return this.barber(o);
    if (path === '/mob/Baba') {
      this.choose('Baba', p.dead ? 'Do you wish to return to the living world?' : 'You may now return to earth!', ['Return to Earth', 'Stay'], ch => {
        if (ch === 'Return to Earth') { if (p.dead) this.revive(); else this.teleport(REVIVE_LOC[0], REVIVE_LOC[1], REVIVE_LOC[2]); }
      });
      return;
    }
    if (path === '/mob/other/Yemma') {
      this.choose('King Yemma', 'You are a good hearted person, you may continue to heaven, or run Snake Way to convince King Kai to train you.',
        ['Heaven', 'King Kais', 'Return to the living (Baba)', 'Im not sure yet'], ch => {
          if (ch === 'Heaven') this.teleport(69, 6, 4);
          if (ch === 'King Kais') this.teleport(74, 2, 2);
          if (ch === 'Return to the living (Baba)') { if (p.dead) this.revive(); else this.teleport(REVIVE_LOC[0], REVIVE_LOC[1], REVIVE_LOC[2]); }
        });
      return;
    }
    if (path === '/mob/tester/kingkai') {
      this.choose('King Kai', 'So you made it all the way down Snake Way! What do you want?', ['Train me', 'Return to Earth', 'Nothing'], ch => {
        if (ch === 'Train me') {
          if (p.kingkai) { this.msg('King Kai: I have already taught you everything I can.'); return; }
          p.kingkai = 1; const g = Math.max(5000, Math.floor(p.maxpowerlevel * 0.25)); p.maxpowerlevel += g;
          this.msg('King Kai trains you! +' + fmt(g) + ' max PL', '#ffb000');
        }
        if (ch === 'Return to Earth') { if (p.dead) this.revive(); else this.teleport(REVIVE_LOC[0], REVIVE_LOC[1], REVIVE_LOC[2]); }
      });
      return;
    }
    if (path === '/mob/Controlls') {
      this.choose('Space Pod', 'Choose a Destination', ['Earth', 'Namek', 'Dark', 'Cancel'], ch => {
        const dest = { Earth: [131, 270, 22], Namek: [76, 82, 5], Dark: [60, 58, 19] }[ch];
        if (!dest) return;
        if (ch === 'Namek' && p.questsdone < 2) { this.msg('You dont know where Namek is. (Defeat Vegeta first)', '#f88'); return; }
        this.travel('You will arrive on ' + ch + ' soon, please enjoy the ride.', dest);
      });
      return;
    }
    const npc = Assets.scripts.npcs[path];
    if (npc) {
      const opts = [];
      const actions = [];
      for (const v of npc) {
        for (const op of v.opts) {
          const label = op[0] === 'Go' || op[0] === 'Yes' ? v.verb.replace(/_/g, ' ') : op[0];
          opts.push(label); actions.push(() => this.teleport(op[1], op[2], op[3]));
        }
      }
      const text = (npc.find(v => v.text.length) || { text: [] }).text[0] || ('Hello, ' + p.name + '.');
      if (opts.length) {
        opts.push('Nevermind'); actions.push(() => {});
        this.choose(o.name, text.replace(/\byou\b/, p.name), opts, (ch, i) => actions[i] && actions[i]());
      } else {
        this.dialog(o.name, text);
      }
      return;
    }
    this.dialog(o.name || 'Someone', '...');
  },

  travel(text, dest) {
    this.msg(text, '#9cf');
    this.traveling = true;
    this.onFade && this.onFade(true);
    setTimeout(async () => {
      this.traveling = false;
      await this.teleport(dest[0], dest[1], dest[2]);
      this.onFade && this.onFade(false);
    }, 2500);
  },

  shop(o) {
    const p = this.player;
    const opts = SHOP.map(s => s.item + ' *' + s.price + '*').concat(['Take off all clothes', 'Ki blast colour', 'Nothing']);
    this.choose(o.name || 'Shopkeeper', 'Hello! What do you wish to buy? (You have ' + fmt(p.zenni) + ' zenni)', opts, (ch, i) => {
      if (i < SHOP.length) {
        const it = SHOP[i];
        if (p.zenni < it.price) { this.msg('insufficient funds', '#f88'); return; }
        const colors = GI_COLORS.filter(c => Assets.iconId(it.icon(c)) != null);
        this.choose(o.name, 'What color would you like?', colors.concat(['Cancel']), c => {
          if (c === 'Cancel') return;
          p.zenni -= it.price;
          // replace an existing item of the same kind
          const suffix = { Underclothing: 'under' }[it.item] || it.item.toLowerCase();
          p.clothes = p.clothes.filter(x => !x.endsWith(suffix + '.dmi'));
          p.clothes.push(it.icon(c));
          this.buildAppearance();
          this.msg('You got a ' + c + ' ' + it.item + '!', '#7f7');
        });
      } else if (ch === 'Take off all clothes') { p.clothes = []; this.buildAppearance(); }
      else if (ch === 'Ki blast colour') {
        this.choose(o.name, 'Pick a ki colour', Object.keys(KI_COLORS), c => { p.kicolor = c; this.msg('Ki colour set to ' + c + '.'); });
      }
    });
  },

  barber(o) {
    const p = this.player;
    const r = RACES[p.raceKey];
    if (!r.hair) { this.dialog('Barber', 'Sorry, I can\'t do anything with your... head.'); return; }
    this.choose('Barber', 'Want a new look?', ['Change hairstyle', 'Change hair colour', 'Change skin colour', 'Nevermind'], ch => {
      if (ch === 'Change hairstyle') this.choose('Barber', 'Pick a style', Object.keys(HAIRSTYLES), h => { p.hair = h; this.buildAppearance(); });
      if (ch === 'Change hair colour') {
        const cols = { Black: [0, 0, 0], Brown: [90, 50, 10], Blond: [200, 180, 60], Red: [170, 0, 0], Blue: [0, 40, 160],
          Green: [0, 120, 0], Purple: [110, 0, 140], White: [220, 220, 220], Pink: [220, 90, 150] };
        this.choose('Barber', 'Pick a colour', Object.keys(cols), c => { p.hairColor = cols[c]; this.buildAppearance(); });
      }
      if (ch === 'Change skin colour' && r.skin) this.choose('Barber', 'Pick a skin colour', SKINS, s => { p.skin = s; this.buildAppearance(); });
    });
  },

  wishMenu() {
    const p = this.player;
    this.choose('Shenron', 'You have gathered all seven Dragonballs. State your wish!', ['Power', 'Wealth', 'Immortality'], ch => {
      if (ch === 'Power') { const g = Math.max(10000, Math.floor(p.maxpowerlevel * 0.5)); p.maxpowerlevel += g; this.msg('Your wish is granted! +' + fmt(g) + ' max PL', '#ffb000'); }
      if (ch === 'Wealth') { p.zenni += 100000; this.msg('Your wish is granted! +100,000 zenni', '#ffb000'); }
      if (ch === 'Immortality') { p.hpBonus = (p.hpBonus || 0) + 100; this.recalcStats(); p.hp = p.maxhp; this.msg('Your wish is granted! Your body grows tougher.', '#ffb000'); }
      p.dragonballs = {};
    });
  },

  dialog(title, text) { this.onDialog && this.onDialog(title, text, ['OK'], () => {}); },
  choose(title, text, opts, cb) { this.onDialog && this.onDialog(title, text, opts, cb); },

  // ------------------------------------------------------------------- save
  save() {
    if (!this.player) return;
    try { localStorage.setItem(SAVE_KEY, JSON.stringify(this.player)); } catch (e) { /* storage full or blocked */ }
  },
  loadSave() {
    try {
      const s = localStorage.getItem(SAVE_KEY);
      return s ? JSON.parse(s) : null;
    } catch (e) { return null; }
  },
  deleteSave() { try { localStorage.removeItem(SAVE_KEY); } catch (e) { /* ignore */ } },
};

// strict "is mid-step" check used for input pacing
Ent.prototype.isMovingStrict = function (now) { return this.moveDur && now - this.moveStart < this.moveDur; };
