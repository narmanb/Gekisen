// Asset loading: data files, icon atlases (converted from the original .dmi files), sounds.
'use strict';

const DIR = { N: 1, S: 2, E: 4, W: 8, NE: 5, NW: 9, SE: 6, SW: 10 };
const DIR_INDEX = { 2: 0, 1: 1, 4: 2, 8: 3, 6: 4, 10: 5, 5: 6, 9: 7 };
const DIR_DX = { 1: 0, 2: 0, 4: 1, 8: -1, 5: 1, 9: -1, 6: 1, 10: -1 };
const DIR_DY = { 1: 1, 2: -1, 4: 0, 8: 0, 5: 1, 9: 1, 6: -1, 10: -1 };

const Assets = {
  icons: null,      // dmi name -> meta
  byId: [],         // id -> meta
  types: null,
  map: null,
  scripts: null,
  images: {},       // id -> HTMLImageElement
  tinted: {},       // id|rgb -> canvas
  sounds: {},
  muted: false,

  async loadJSON(path) {
    const r = await fetch(path);
    if (!r.ok) throw new Error('Failed to load ' + path);
    return r.json();
  },

  async init(progress) {
    progress && progress('Loading data...');
    const [icons, types, map, scripts] = await Promise.all([
      this.loadJSON('data/icons.json'), this.loadJSON('data/types.json'),
      this.loadJSON('data/map.json'), this.loadJSON('data/scripts.json')]);
    this.icons = icons;
    for (const [name, meta] of Object.entries(icons)) {
      meta.name = name;
      this.byId[meta.id] = meta;
    }
    this.types = types;
    this.map = map;
    this.scripts = scripts;
  },

  iconId(name) {
    if (name == null) return null;
    if (typeof name === 'number') return name;
    const m = this.icons[name.toLowerCase()];
    return m ? m.id : null;
  },

  image(id) {
    let img = this.images[id];
    if (!img) {
      img = new Image();
      img.src = 'assets/icons/' + id + '.png';
      this.images[id] = img;
    }
    return img;
  },

  preload(ids) {
    return Promise.all(ids.map(id => new Promise(res => {
      const img = this.image(id);
      if (img.complete) return res();
      img.onload = img.onerror = () => res();
    })));
  },

  // DM "icon + rgb(r,g,b)": add the colour to every opaque pixel.
  tint(id, rgb) {
    if (!rgb) return this.image(id);
    const key = id + '|' + rgb.join(',');
    let c = this.tinted[key];
    if (c) return c;
    const img = this.image(id);
    if (!img.complete || !img.naturalWidth) return img;
    c = document.createElement('canvas');
    c.width = img.naturalWidth;
    c.height = img.naturalHeight;
    const g = c.getContext('2d');
    g.drawImage(img, 0, 0);
    const d = g.getImageData(0, 0, c.width, c.height);
    const p = d.data;
    for (let i = 0; i < p.length; i += 4) {
      if (p[i + 3]) {
        p[i] = Math.min(255, p[i] + rgb[0]);
        p[i + 1] = Math.min(255, p[i + 1] + rgb[1]);
        p[i + 2] = Math.min(255, p[i + 2] + rgb[2]);
      }
    }
    g.putImageData(d, 0, 0);
    this.tinted[key] = c;
    return c;
  },

  // Resolve the atlas frame for an icon state, BYOND style.
  // moving: prefer the movement ("M:") variant.  t: time in ms.  flickStart: ms or null
  frame(id, state, dir, t, moving, flickStart) {
    const meta = this.byId[id];
    if (!meta) return null;
    const S = meta.states;
    state = state || '';
    let st, animate = true;
    if (moving && S['M:' + state]) st = S['M:' + state];
    else if (S[state]) { st = S[state]; }
    else if (S['M:' + state]) { st = S['M:' + state]; animate = moving; }
    else if (S['']) st = S[''];
    else if (S['M:']) { st = S['M:']; animate = moving; }
    else return null;
    const [dirs, frames, first, delays] = st;
    let di = 0;
    if (dirs >= 4) {
      di = DIR_INDEX[dir] || 0;
      if (di >= dirs) di = di === 4 || di === 6 ? 2 : 3;
    }
    let f = 0;
    if (frames > 1 && animate) {
      let total = 0;
      for (let k = 0; k < frames; k++) total += (delays[k] || 1);
      let tick = Math.floor((flickStart != null ? t - flickStart : t) / 100);
      if (flickStart != null) tick = Math.min(tick, total - 1);
      tick %= total;
      for (f = 0; f < frames; f++) {
        tick -= (delays[f] || 1);
        if (tick < 0) break;
      }
      if (f >= frames) f = frames - 1;
    }
    const k = first + f * dirs + di;
    return { w: meta.w, h: meta.h, sx: (k % 16) * meta.w, sy: Math.floor(k / 16) * meta.h };
  },

  hasState(id, state) {
    const meta = this.byId[id];
    return !!(meta && (meta.states[state] || meta.states['M:' + state]));
  },

  flickLength(id, state) {
    const meta = this.byId[id];
    const st = meta && (meta.states[state] || meta.states['M:' + state]);
    if (!st) return 0;
    let total = 0;
    for (let k = 0; k < st[1]; k++) total += (st[3][k] || 1);
    return total * 100;
  },

  // --- sound ---------------------------------------------------------------
  play(name, vol) {
    if (this.muted) return;
    let a = this.sounds[name];
    if (!a) {
      a = new Audio('assets/sounds/' + name);
      this.sounds[name] = a;
    }
    try {
      const n = a.cloneNode();
      n.volume = vol == null ? 0.5 : vol;
      n.play().catch(() => {});
    } catch (e) { /* ignore */ }
  },
};
