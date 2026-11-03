// World: z-levels converted from map.dmp, collision, entity index and rendering.
'use strict';

const TILE = 32;

class Ent {
  constructor(o) {
    Object.assign(this, {
      x: 1, y: 1, z: 1, dir: 2, icon: null, state: '', name: '', dense: 0, layer: 3,
      overlays: [], underlays: [], tint: null, flick: null, moving: false,
      fromX: 0, fromY: 0, moveStart: 0, moveDur: 0, pixel_x: 0, pixel_y: 0, invis: 0,
      alpha: 1,
    }, o);
    this.fromX = this.x;
    this.fromY = this.y;
  }
  // interpolated position in tiles
  pos(now) {
    if (!this.moveDur) return [this.x, this.y];
    const k = Math.min(1, (now - this.moveStart) / this.moveDur);
    if (k >= 1) { this.moveDur = 0; return [this.x, this.y]; }
    return [this.fromX + (this.x - this.fromX) * k, this.fromY + (this.y - this.fromY) * k];
  }
  isMoving(now) { return this.moveDur && now - this.moveStart < this.moveDur + 60; }
  doFlick(state, now) {
    const len = Assets.flickLength(this.icon, state);
    if (!len) return;
    this.flick = { state, start: now, end: now + len };
  }
}

const World = {
  grids: {},         // z -> Uint16Array (or null if filled)
  ents: {},          // z -> Set of Ent
  cells: {},         // z -> Map(key -> [Ent])
  spawnedZ: {},
  areaFlags: {},

  key(x, y) { return x + y * 1024; },

  zinfo(z) { return Assets.map.z[z] || { w: 400, h: 400, fill: 0 }; },

  async loadZ(z) {
    const zi = this.zinfo(z);
    if (!(z in this.grids)) {
      if (zi.fill != null) {
        this.grids[z] = null;
      } else {
        const r = await fetch('data/z' + z + '.bin');
        const buf = await r.arrayBuffer();
        this.grids[z] = new Uint16Array(buf);
      }
    }
    if (!this.spawnedZ[z]) {
      this.spawnedZ[z] = true;
      this.ents[z] = this.ents[z] || new Set();
      this.cells[z] = this.cells[z] || new Map();
      for (const e of Assets.map.entities) {
        if (e[3] === z) Game.spawnFromMap(e[0], e[1], e[2], e[3]);
      }
    }
    // preload icons used by the visible turfs lazily (images load on demand)
  },

  tile(x, y, z) {
    const zi = this.zinfo(z);
    if (x < 1 || y < 1 || x > zi.w || y > zi.h) return -1;
    const g = this.grids[z];
    if (!g) return zi.fill;
    return g[(zi.h - y) * zi.w + (x - 1)];
  },

  turfTypes(x, y, z) {
    const t = this.tile(x, y, z);
    if (t < 0) return null;
    return Assets.map.tiles[t].t;
  },

  // the "real" turf is the last one listed in the map cell
  turf(x, y, z) {
    const tt = this.turfTypes(x, y, z);
    if (!tt || !tt.length) return null;
    return Assets.types[tt[tt.length - 1]];
  },

  isSafe(x, y, z) {
    const t = this.tile(x, y, z);
    return t >= 0 && (Assets.map.tiles[t].f & 1);
  },

  add(e) {
    if (!this.ents[e.z]) { this.ents[e.z] = new Set(); this.cells[e.z] = new Map(); }
    this.ents[e.z].add(e);
    this.index(e);
  },

  remove(e) {
    this.unindex(e);
    if (this.ents[e.z]) this.ents[e.z].delete(e);
  },

  index(e) {
    const m = this.cells[e.z];
    const k = this.key(e.x, e.y);
    let a = m.get(k);
    if (!a) { a = []; m.set(k, a); }
    a.push(e);
  },

  unindex(e) {
    const m = this.cells[e.z];
    if (!m) return;
    const a = m.get(this.key(e.x, e.y));
    if (a) {
      const i = a.indexOf(e);
      if (i >= 0) a.splice(i, 1);
    }
  },

  at(x, y, z) {
    const m = this.cells[z];
    return (m && m.get(this.key(x, y))) || [];
  },

  // can mover enter (x,y,z)?
  canEnter(mover, x, y, z) {
    const tur = this.turf(x, y, z);
    if (!tur) return false;
    const rule = tur.enter;
    if (rule && rule.block) {
      if (rule.block === 'all') return false;
      if (rule.block === 'monsters' && mover.kind !== 'player') return false;
    }
    if (tur.dense && !(mover.flying && Game.isWaterish(x, y, z))) return false;
    for (const e of this.at(x, y, z)) {
      if (e !== mover && e.dense && !e.dead) return false;
    }
    return true;
  },

  moveEnt(e, x, y, z, dur, now) {
    this.unindex(e);
    if (z !== e.z) {
      this.ents[e.z] && this.ents[e.z].delete(e);
      e.z = z;
      e.x = x; e.y = y;
      e.fromX = x; e.fromY = y; e.moveDur = 0;
      this.add(e);
      return;
    }
    e.fromX = e.x; e.fromY = e.y;
    e.x = x; e.y = y;
    e.moveStart = now; e.moveDur = dur || 0;
    this.index(e);
  },

  // ---------------------------------------------------------------- render
  drawSprite(g, id, state, dir, px, py, now, moving, flick, tint, alpha) {
    if (id == null) return;
    const meta = Assets.byId[id];
    if (!meta) return;
    let fr;
    if (flick && Assets.hasState(id, flick.state)) fr = Assets.frame(id, flick.state, dir, now, false, flick.start);
    else fr = Assets.frame(id, state, dir, now, moving);
    if (!fr) return;
    const img = tint ? Assets.tint(id, tint) : Assets.image(id);
    if (!img.width && !img.naturalWidth) return;
    if (alpha != null && alpha < 1) g.globalAlpha = alpha;
    // big icons are anchored at the bottom-left of the tile like BYOND
    g.drawImage(img, fr.sx, fr.sy, fr.w, fr.h, Math.round(px), Math.round(py + TILE - fr.h), fr.w, fr.h);
    if (alpha != null && alpha < 1) g.globalAlpha = 1;
  },

  drawEnt(g, e, sx, sy, now) {
    const moving = e.isMoving(now);
    const fl = e.flick && now < e.flick.end ? e.flick : null;
    if (e.flick && !fl) e.flick = null;
    const px = sx + (e.pixel_x || 0), py = sy - (e.pixel_y || 0);
    for (const u of e.underlays) this.drawSprite(g, u.icon, u.state || '', e.dir, px + (u.px || 0), py + (u.py || 0), now, moving, fl, u.tint, u.alpha);
    this.drawSprite(g, e.icon, e.state, e.dir, px, py, now, moving, fl, e.tint, e.alpha);
    for (const o of e.overlays) this.drawSprite(g, o.icon, o.state != null ? o.state : e.state, e.dir, px + (o.px || 0), py + (o.py || 0), now, moving, fl, o.tint, o.alpha);
  },

  render(g, cam, vw, vh, now) {
    const z = cam.z;
    g.fillStyle = '#000';
    g.fillRect(0, 0, vw, vh);
    const tilesX = Math.ceil(vw / TILE) + 2, tilesY = Math.ceil(vh / TILE) + 2;
    const left = cam.x - vw / TILE / 2 + 0.5, top = cam.y + vh / TILE / 2 - 0.5;
    const x0 = Math.floor(left) - 1, y1 = Math.ceil(top) + 1;
    const offX = -(left - x0) * TILE, offY = -(y1 - top) * TILE;
    const turfIcons = Assets.types;
    // turfs
    for (let j = 0; j < tilesY + 1; j++) {
      const y = y1 - j;
      for (let i = 0; i < tilesX + 1; i++) {
        const x = x0 + i;
        const tt = this.turfTypes(x, y, z);
        if (!tt) continue;
        const sx = offX + i * TILE, sy = offY + j * TILE;
        for (let k = 0; k < tt.length; k++) {
          const ty = turfIcons[tt[k]];
          if (ty.icon == null || ty.invis) continue;
          this.drawSprite(g, ty.icon, ty.state, ty.dir || 2, sx + (ty.pixel_x || 0), sy - (ty.pixel_y || 0), now, false, null, null);
        }
      }
    }
    // movables, sorted by layer then north-to-south
    const list = [];
    const set = this.ents[z];
    if (set) {
      for (const e of set) {
        if (e.invis || e.hidden) continue;
        const [ex, ey] = e.pos(now);
        if (ex < x0 - 6 || ex > x0 + tilesX + 2 || ey > y1 + 2 || ey < y1 - tilesY - 6) continue;
        list.push([e, ex, ey]);
      }
    }
    list.sort((a, b) => (a[0].layer - b[0].layer) || (b[2] - a[2]));
    for (const [e, ex, ey] of list) {
      const sx = offX + (ex - x0) * TILE, sy = offY + (y1 - ey) * TILE;
      this.drawEnt(g, e, sx, sy, now);
    }
    // floating text
    for (const ft of Game.floaters) {
      if (ft.z !== z) continue;
      const k = (now - ft.t0) / ft.dur;
      const sx = offX + (ft.x - x0) * TILE + 16, sy = offY + (y1 - ft.y) * TILE - 4 - k * 20;
      g.globalAlpha = Math.max(0, 1 - k);
      g.font = 'bold 10px monospace';
      g.textAlign = 'center';
      g.fillStyle = '#000';
      g.fillText(ft.text, sx + 1, sy + 1);
      g.fillStyle = ft.color;
      g.fillText(ft.text, sx, sy);
      g.globalAlpha = 1;
    }
    return { x0, y1, offX, offY };
  },
};
