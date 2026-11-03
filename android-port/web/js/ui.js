// UI: main loop, rendering surface, touch/keyboard input, HUD, menus, character creation.
'use strict';

const $ = id => document.getElementById(id);

const UI = {
  canvas: null, g: null, scale: 2, vw: 0, vh: 0,
  running: false,
  dialogQueue: [],

  async boot() {
    this.canvas = $('view');
    this.g = this.canvas.getContext('2d');
    window.addEventListener('resize', () => this.resize());
    this.resize();
    try {
      await Assets.init(t => { $('loading').textContent = t; });
    } catch (e) {
      $('loading').textContent = 'Failed to load game data: ' + e.message;
      return;
    }
    $('loading').classList.add('hidden');
    $('title-btns').classList.remove('hidden');
    const save = Game.loadSave();
    $('btn-continue').classList.toggle('hidden', !save);
    $('btn-continue').onclick = () => this.startGame(save);
    $('btn-new').onclick = () => {
      if (!save) return this.showCreate();
      this.dialog('New character', 'Start a new character? Your saved character (' + save.name + ', ' +
        fmt(save.maxpowerlevel) + ' max PL) will be overwritten when you press Start.', ['Create new', 'Cancel'],
      ch => { if (ch === 'Create new') this.showCreate(); });
    };
    Game.onLog = () => this.renderLog();
    Game.onDialog = (t, txt, opts, cb) => this.dialog(t, txt, opts, cb);
    Game.onFade = on => $('fade').classList.toggle('hidden', !on);
    this.bindControls();
    this.bindMenu();
    document.addEventListener('visibilitychange', () => { if (document.hidden) Game.save(); });
    window.addEventListener('pagehide', () => Game.save());
  },

  resize() {
    const dpr = window.devicePixelRatio || 1;
    const w = Math.floor(window.innerWidth * dpr), h = Math.floor(window.innerHeight * dpr);
    this.canvas.width = w;
    this.canvas.height = h;
    // integer scale so that roughly 11 tiles fit across the short side
    this.scale = Math.max(1, Math.round(Math.min(w, h) / (TILE * 11)));
    this.vw = Math.ceil(w / this.scale);
    this.vh = Math.ceil(h / this.scale);
    this.g.imageSmoothingEnabled = false;
  },

  async startGame(save) {
    $('title').classList.add('hidden');
    $('create').classList.add('hidden');
    $('fade').classList.remove('hidden');
    await Game.start(save);
    $('fade').classList.add('hidden');
    for (const id of ['hud', 'log', 'menu-btn', 'controls']) $(id).classList.remove('hidden');
    Game.save();
    if (!this.running) {
      this.running = true;
      requestAnimationFrame(t => this.frame(t));
    }
  },

  frame(t) {
    const now = performance.now();
    Game.update(now);
    const pe = Game.pe;
    if (pe) {
      const [cx, cy] = pe.pos(now);
      const g = this.g;
      g.setTransform(this.scale, 0, 0, this.scale, 0, 0);
      g.imageSmoothingEnabled = false;
      World.render(g, { x: cx, y: cy, z: pe.z }, this.vw, this.vh, now);
      this.renderNames(g, cx, cy, now);
      if (!this.hudT || now - this.hudT > 150) { this.hudT = now; this.renderHud(); }
    }
    requestAnimationFrame(tt => this.frame(tt));
  },

  // name/health labels above the closest monsters
  renderNames(g, cx, cy, now) {
    const pe = Game.pe;
    g.font = '8px Verdana';
    g.textAlign = 'center';
    for (const m of Game.monsters) {
      if (m.dead || m.z !== pe.z) continue;
      if (Math.abs(m.x - pe.x) > 7 || Math.abs(m.y - pe.y) > 7) continue;
      const [mx, my] = m.pos(now);
      const sx = (mx - cx) * TILE + this.vw / 2, sy = (cy - my) * TILE + this.vh / 2 - 18;
      if (m.civilian && m.hp >= m.maxhp) continue;
      const k = Math.max(0, Math.min(1, m.hp / m.maxhp));
      g.fillStyle = 'rgba(0,0,0,.6)';
      g.fillRect(sx - 13, sy + 2, 26, 3);
      g.fillStyle = k > 0.5 ? '#5f5' : k > 0.2 ? '#fd4' : '#f44';
      g.fillRect(sx - 13, sy + 2, 26 * k, 3);
      if (!m.civilian) {
        g.fillStyle = '#000';
        g.fillText(m.name, sx + 0.5, sy + 0.5);
        g.fillStyle = m.target ? '#ff8a8a' : '#fff';
        g.fillText(m.name, sx, sy);
      }
    }
  },

  renderHud() {
    const p = Game.player;
    if (!p) return;
    const r = RACES[p.raceKey];
    $('h-name').textContent = p.name + (p.dead ? ' (dead)' : '');
    $('h-form').textContent = p.form >= 0 ? TRANS[r.trans[p.form]].name : (Game.busy ? '· ' + ({ meditate: 'meditating', rest: 'resting', train: 'training', power: 'powering up', block: 'blocking' }[Game.busy] || '') : '');
    $('h-pl').textContent = fmt(p.powerlevel);
    $('h-mpl').textContent = fmt(p.maxpowerlevel);
    $('b-hp').style.width = Math.max(0, 100 * p.hp / p.maxhp) + '%';
    $('b-ki').style.width = Math.max(0, 100 * p.ki / p.maxki) + '%';
    $('b-st').style.width = Math.max(0, 100 * p.stamina / p.maxstamina) + '%';
    $('h-zenni').textContent = fmt(p.zenni);
    $('h-area').textContent = Game.zname(p.z) + ' (' + p.x + ',' + p.y + ')';
    for (const b of document.querySelectorAll('.act')) {
      const a = b.dataset.act;
      b.classList.toggle('on', (a === 'power' && Game.busy === 'power') || (a === 'block' && Game.busy === 'block'));
    }
    // fade old log lines
    const now = performance.now();
    const lines = $('log').children;
    for (let i = 0; i < lines.length; i++) {
      const age = now - Number(lines[i].dataset.t);
      lines[i].style.opacity = age > 9000 ? 0 : 1;
    }
  },

  renderLog() {
    const el = $('log');
    el.innerHTML = '';
    for (const l of Game.log.slice(-5)) {
      const d = document.createElement('div');
      d.textContent = l.text;
      d.style.color = l.color;
      d.dataset.t = l.t;
      el.appendChild(d);
    }
  },

  // ---------------------------------------------------------------- dialogs
  dialog(title, text, opts, cb) {
    this.dialogQueue.push({ title, text, opts, cb });
    if (this.dialogQueue.length === 1) this.showDialog();
  },

  showDialog() {
    const d = this.dialogQueue[0];
    if (!d) { $('dialog').classList.add('hidden'); return; }
    Game.setMoveDir(0);
    $('dlg-title').textContent = d.title;
    $('dlg-text').textContent = d.text;
    const box = $('dlg-opts');
    box.innerHTML = '';
    d.opts.forEach((o, i) => {
      const b = document.createElement('button');
      b.textContent = o;
      b.onclick = () => {
        this.dialogQueue.shift();
        $('dialog').classList.add('hidden');
        try { d.cb && d.cb(o, i); } finally { setTimeout(() => this.showDialog(), 0); }
      };
      box.appendChild(b);
    });
    $('dialog').classList.remove('hidden');
  },

  // --------------------------------------------------------------- controls
  bindControls() {
    const stick = $('stick'), knob = $('stick-knob');
    let sid = null;
    const setDir = (ev) => {
      const r = stick.getBoundingClientRect();
      const cx = r.left + r.width / 2, cy = r.top + r.height / 2;
      let dx = ev.clientX - cx, dy = ev.clientY - cy;
      const len = Math.hypot(dx, dy), max = r.width / 2 - 20;
      if (len > max) { dx = dx / len * max; dy = dy / len * max; }
      knob.style.transform = 'translate(' + dx + 'px,' + dy + 'px)';
      if (len < 14) { Game.setMoveDir(0); return; }
      const a = Math.atan2(-dy, dx) * 180 / Math.PI; // 0 = east, 90 = north
      const sector = Math.round(((a + 360) % 360) / 45) % 8;
      Game.setMoveDir([4, 5, 1, 9, 8, 10, 2, 6][sector]);
    };
    stick.addEventListener('pointerdown', ev => { sid = ev.pointerId; stick.setPointerCapture(sid); setDir(ev); ev.preventDefault(); });
    stick.addEventListener('pointermove', ev => { if (ev.pointerId === sid) setDir(ev); });
    const end = ev => { if (ev.pointerId !== sid) return; sid = null; knob.style.transform = ''; Game.setMoveDir(0); };
    stick.addEventListener('pointerup', end);
    stick.addEventListener('pointercancel', end);

    const acts = {
      attack: () => Game.attack(), ki: () => Game.kiBlast(), use: () => Game.interact(),
      power: () => Game.powerUp(), block: () => Game.block(),
    };
    for (const b of document.querySelectorAll('.act')) {
      let rep = null;
      b.addEventListener('pointerdown', ev => {
        ev.preventDefault();
        if (this.dialogQueue.length) return;
        const a = b.dataset.act;
        acts[a]();
        if (a === 'attack' || a === 'ki') rep = setInterval(acts[a], a === 'attack' ? 450 : 650);
      });
      const stop = () => { if (rep) { clearInterval(rep); rep = null; } };
      b.addEventListener('pointerup', stop);
      b.addEventListener('pointercancel', stop);
      b.addEventListener('pointerleave', stop);
    }

    // keyboard (desktop / testing)
    const keys = new Set();
    const keyDir = () => {
      let dx = 0, dy = 0;
      if (keys.has('ArrowUp') || keys.has('w')) dy += 1;
      if (keys.has('ArrowDown') || keys.has('s')) dy -= 1;
      if (keys.has('ArrowRight') || keys.has('d')) dx += 1;
      if (keys.has('ArrowLeft') || keys.has('a')) dx -= 1;
      Game.setMoveDir(dx || dy ? Game.dirTo(dx, dy) : 0);
    };
    window.addEventListener('keydown', ev => {
      if (!Game.player || ev.target.tagName === 'INPUT') return;
      const k = ev.key.length === 1 ? ev.key.toLowerCase() : ev.key;
      if (['ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'w', 'a', 's', 'd'].includes(k)) { keys.add(k); keyDir(); ev.preventDefault(); return; }
      if (this.dialogQueue.length) {
        if (k === 'Enter' || k === ' ') { const b = $('dlg-opts').querySelector('button'); b && b.click(); }
        return;
      }
      if (ev.repeat && k !== ' ') return;
      const map = { ' ': 'attack', f: 'ki', e: 'use', p: 'power', b: 'block' };
      if (map[k]) { acts[map[k]](); ev.preventDefault(); }
      if (k === 'm') Game.meditate();
      if (k === 'r') Game.rest();
      if (k === 't') Game.transform();
      if (k === 'y') Game.toggleFlight();
    });
    window.addEventListener('keyup', ev => {
      const k = ev.key.length === 1 ? ev.key.toLowerCase() : ev.key;
      if (keys.delete(k)) keyDir();
    });
  },

  bindMenu() {
    $('menu-btn').onclick = () => { $('menu').classList.toggle('hidden'); Game.setMoveDir(0); };
    for (const b of document.querySelectorAll('#menu button')) {
      b.onclick = () => {
        const m = b.dataset.m;
        $('menu').classList.add('hidden');
        const p = Game.player;
        if (m === 'meditate') Game.meditate();
        if (m === 'rest') Game.rest();
        if (m === 'fly') Game.toggleFlight();
        if (m === 'transform') Game.transform();
        if (m === 'revert') Game.revert();
        if (m === 'save') { Game.save(); Game.msg('Game saved.', '#7f7'); }
        if (m === 'sound') { Assets.muted = !Assets.muted; Game.msg('Sound ' + (Assets.muted ? 'off' : 'on') + '.'); }
        if (m === 'quest') this.dialog('Saga', 'Sagas completed: ' + p.questsdone + '/24\n\n' + Game.nextQuestHint(), ['OK']);
        if (m === 'stats') {
          const r = RACES[p.raceKey];
          const next = p.unlocked < r.trans.length ? TRANS[r.trans[p.unlocked]] : null;
          const mins = Math.floor(p.playtime / 60);
          this.dialog('Stats', [
            'Name: ' + p.name, 'Race: ' + p.race + ' (' + p.gender + ')',
            'Powerlevel: ' + fmt(p.powerlevel) + ' / ' + fmt(p.maxpowerlevel),
            'HP: ' + Math.ceil(p.hp) + ' / ' + p.maxhp, 'Ki: ' + Math.floor(p.ki) + ' / ' + p.maxki,
            'Stamina: ' + Math.floor(p.stamina) + ' / ' + p.maxstamina, 'Zenni: ' + fmt(p.zenni),
            'Transformations: ' + (p.unlocked ? r.trans.slice(0, p.unlocked).map(k => TRANS[k].name).join(', ') : 'none'),
            next ? 'Next form: ' + next.name + ' at ' + fmt(next.prereq) + ' max PL' : 'All forms unlocked!',
            'Flight: ' + (p.maxpowerlevel >= 1000 ? 'learned' : 'at 1,000 max PL'),
            'Kills: ' + p.kills, 'Play time: ' + Math.floor(mins / 60) + 'h ' + (mins % 60) + 'm',
          ].join('\n'), ['OK']);
        }
        if (m === 'title') { Game.save(); location.reload(); }
      };
    }
  },

  // ----------------------------------------------------- character creation
  showCreate() {
    $('title').classList.add('hidden');
    $('create').classList.remove('hidden');
    const race = $('c-race'), skin = $('c-skin'), hair = $('c-hair');
    race.innerHTML = Object.keys(RACES).map(r => '<option>' + r + '</option>').join('');
    race.value = 'Saiya-jin';
    skin.innerHTML = SKINS.map(s => '<option>' + s + '</option>').join('');
    skin.value = 'Tan';
    hair.innerHTML = Object.keys(HAIRSTYLES).map(h => '<option>' + h + '</option>').join('');
    hair.value = 'Goku';
    $('c-name').value = $('c-name').value || 'Kakarot';
    let dir = 2;
    const draft = () => ({
      name: $('c-name').value.trim().slice(0, 24) || 'Fighter', raceKey: race.value, gender: $('c-gender').value,
      skin: skin.value, hair: hair.value, hairColor: [+$('c-r').value, +$('c-g').value, +$('c-b').value],
    });
    const refresh = async () => {
      const r = RACES[race.value];
      $('l-skin').classList.toggle('hidden', !r.skin);
      $('l-hair').classList.toggle('hidden', !r.hair);
      $('l-hcol').classList.toggle('hidden', !r.hair);
      const t = TRANS[r.trans[0]];
      $('c-info').textContent = 'Transformations: ' + r.trans.map(k => TRANS[k].name).join(' → ') + '. First at ' + fmt(t.prereq) + ' max PL.';
      const d = draft();
      const p = Game.newPlayer(d);
      p.buu = 0;
      const tmp = new Ent({ dir });
      const save = [Game.player, Game.pe];
      Game.player = p; Game.pe = tmp;
      Game.buildAppearance();
      Game.player = save[0]; Game.pe = save[1];
      const ids = [tmp.icon, ...tmp.overlays.map(o => o.icon)].filter(x => x != null);
      await Assets.preload(ids);
      const c = $('preview'), g = c.getContext('2d');
      g.setTransform(1, 0, 0, 1, 0, 0);
      g.clearRect(0, 0, c.width, c.height);
      g.imageSmoothingEnabled = false;
      g.setTransform(3, 0, 0, 3, 0, 0);
      World.drawEnt(g, tmp, 0, 0, 0);
    };
    for (const id of ['c-gender', 'c-race', 'c-skin', 'c-hair', 'c-r', 'c-g', 'c-b']) $(id).oninput = refresh;
    $('rot').onclick = () => { dir = { 2: 4, 4: 1, 1: 8, 8: 2 }[dir]; refresh(); };
    $('c-back').onclick = () => { $('create').classList.add('hidden'); $('title').classList.remove('hidden'); };
    $('c-start').onclick = () => {
      const p = Game.newPlayer(draft());
      if (p.buu) Game.msg('You have been born a Buu Demon!', '#f8f');
      this.startGame(p);
    };
    refresh();
  },
};

window.addEventListener('load', () => UI.boot());
