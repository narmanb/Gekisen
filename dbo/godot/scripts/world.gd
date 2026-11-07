extends Node2D
## Draws the converted BYOND map and everything on it, and answers collision queries.

const T := 32.0

var ents := {}        # z -> {Mob: true}
var cells := {}       # z -> {key: [Mob]}
var spawned := {}
var cam: Camera2D
var focus: Mob
var floaters: Array = []   # {x,y,z,text,color,t0,dur}
var font: Font


func _ready() -> void:
	cam = Camera2D.new()
	cam.zoom = Vector2(2, 2)
	add_child(cam)
	cam.make_current()
	font = ThemeDB.fallback_font
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST


func key(x: int, y: int) -> int:
	return x + y * 1024


func zh(z: int) -> int:
	return int(Data.zinfo(z)["h"])


func to_px(fx: float, fy: float, z: int) -> Vector2:
	return Vector2((fx - 1.0) * T, (zh(z) - fy) * T)


func load_z(z: int) -> void:
	Data.load_z(z)
	if not ents.has(z):
		ents[z] = {}
		cells[z] = {}
	if spawned.has(z):
		return
	spawned[z] = true
	for e in Data.map["entities"]:
		if int(e[3]) == z:
			Game.spawn_from_map(int(e[0]), int(e[1]), int(e[2]), z)


func add(m: Mob) -> void:
	if not ents.has(m.z):
		ents[m.z] = {}
		cells[m.z] = {}
	ents[m.z][m] = true
	_index(m)


func remove(m: Mob) -> void:
	_unindex(m)
	if ents.has(m.z):
		ents[m.z].erase(m)


func _index(m: Mob) -> void:
	var c: Dictionary = cells[m.z]
	var k := key(m.x, m.y)
	if not c.has(k):
		c[k] = []
	c[k].append(m)


func _unindex(m: Mob) -> void:
	if not cells.has(m.z):
		return
	var a = cells[m.z].get(key(m.x, m.y))
	if a:
		a.erase(m)


func at(x: int, y: int, z: int) -> Array:
	if not cells.has(z):
		return []
	return cells[z].get(key(x, y), [])


func can_enter(m: Mob, x: int, y: int, z: int) -> bool:
	var tur := Data.turf(x, y, z)
	if tur.is_empty():
		return false
	if m.flying:
		return true          # BYOND: a non-dense (flying) mob passes over everything
	var rule = tur.get("enter")
	if rule != null and rule.has("block"):
		return false
	if int(tur.get("dense", 0)) == 1:
		return false
	for o in at(x, y, z):
		if o != m and o.dense and not o.dead and not o.flying:
			return false
	return true


func move(m: Mob, x: int, y: int, z: int, dur: float, now: float) -> void:
	_unindex(m)
	if z != m.z:
		if ents.has(m.z):
			ents[m.z].erase(m)
		m.z = z
		m.x = x
		m.y = y
		m.from_x = x
		m.from_y = y
		m.move_dur = 0.0
		add(m)
		return
	m.from_x = m.x
	m.from_y = m.y
	m.x = x
	m.y = y
	m.move_start = now
	m.move_dur = dur
	_index(m)


func floater(x: int, y: int, z: int, text: String, color: Color) -> void:
	floaters.append({"x": x, "y": y, "z": z, "text": text, "color": color, "t0": Game.now, "dur": 900.0})


# ------------------------------------------------------------------ drawing
func _process(_d: float) -> void:
	if focus:
		var p := focus.pos(Game.now)
		cam.position = to_px(p.x, p.y, focus.z) + Vector2(T / 2, T / 2)
		var vs := get_viewport_rect().size
		cam.zoom = Vector2.ONE * maxf(1.0, roundf(minf(vs.x, vs.y) / (T * 11.0)))
	floaters = floaters.filter(func(f): return Game.now - f["t0"] < f["dur"])
	queue_redraw()


func _sprite(id: int, st: String, d: int, pos: Vector2, now: float, moving: bool, fl: Dictionary, alpha := 1.0, ci: CanvasItem = null, center := false, tint = null) -> void:
	if id < 0:
		return
	var fr: Array
	if not fl.is_empty() and Data.has_state(id, fl["state"]):
		fr = Data.frame(id, fl["state"], d, now, false, fl["start"])
	else:
		fr = Data.frame(id, st, d, now, moving)
	if fr.is_empty():
		return
	var r: Rect2 = fr[1]
	var tex: Texture2D = fr[0] if tint == null else Data.tint_texture(id, tint)
	var target: CanvasItem = ci if ci != null else self
	var ox := -(r.size.x - T) / 2.0 if center and r.size.x > T else 0.0
	target.draw_texture_rect_region(tex, Rect2(pos.x + ox, pos.y + T - r.size.y, r.size.x, r.size.y), r, Color(1, 1, 1, alpha))


## Draw a mob (with overlays) onto another canvas item, e.g. a UI preview.
func draw_mob_on(ci: CanvasItem, m: Mob) -> void:
	var now := Game.now
	for u in m.underlays:
		_sprite(u["icon"], "", m.dir, Vector2.ZERO, now, false, {}, u.get("alpha", 1.0), ci, true)
	_sprite(m.icon, m.state, m.dir, Vector2.ZERO, now, false, {}, 1.0, ci)
	for o in m.overlays:
		var st = o.get("state")
		_sprite(o["icon"], m.state if st == null else st, m.dir, Vector2.ZERO, now, false, {}, o.get("alpha", 1.0), ci, true, o.get("tint"))


func draw_mob(m: Mob, pos: Vector2, now: float) -> void:
	var moving := m.is_moving(now)
	var fl: Dictionary = m.flick if (not m.flick.is_empty() and now < m.flick["end"]) else {}
	if not m.flick.is_empty() and fl.is_empty():
		m.flick = {}
	var p := pos + Vector2(m.pixel_x, -m.pixel_y)
	for u in m.underlays:
		_sprite(u["icon"], u.get("state", "") if u.get("state") != null else m.state, m.dir, p, now, moving, fl, u.get("alpha", 1.0), null, true, u.get("tint"))
	_sprite(m.icon, m.state, m.dir, p, now, moving, fl)
	for o in m.overlays:
		var st = o.get("state")
		_sprite(o["icon"], m.state if st == null else st, m.dir, p, now, moving, fl, o.get("alpha", 1.0), null, true, o.get("tint"))


func _draw() -> void:
	if focus == null:
		return
	var now := Game.now
	var z := focus.z
	var h := zh(z)
	var vs := get_viewport_rect().size / cam.zoom
	var tl := cam.position - vs / 2
	var x0 := int(floor(tl.x / T)) + 1 - 1
	var x1 := int(ceil((tl.x + vs.x) / T)) + 1
	var row0 := int(floor(tl.y / T)) - 1
	var row1 := int(ceil((tl.y + vs.y) / T)) + 1
	# turfs. Icons bigger than one tile (beds, couches, buildings: 64x64 "big objects")
	# extend up and to the right of their tile, so they are drawn in a second pass,
	# otherwise the neighbouring floor tiles would paint over parts of them.
	var big: Array = []
	for row in range(row0, row1 + 4):
		var y := h - row
		for x in range(x0 - 3, x1 + 1):
			var stack := Data.turf_stack(x, y, z)
			if stack.is_empty():
				continue
			var p := Vector2((x - 1) * T, row * T)
			for ti in stack:
				var ty: Dictionary = Data.types[str(int(ti))]
				if not ty.has("icon") or ty.has("invis"):
					continue
				var id := int(ty["icon"])
				var meta = Data.by_id.get(id)
				var pp := p + Vector2(ty.get("pixel_x", 0), -ty.get("pixel_y", 0))
				if meta != null and (int(meta["w"]) > 32 or int(meta["h"]) > 32 or float(ty.get("layer", 2.0)) > 3.0):
					big.append([id, ty.get("state", ""), int(ty.get("dir", 2)), pp])
				elif x >= x0 and row <= row1:
					_sprite(id, ty.get("state", ""), int(ty.get("dir", 2)), pp, now, false, {})
	for b in big:
		_sprite(b[0], b[1], b[2], b[3], now, false, {})
	# movables
	var list: Array = []
	if ents.has(z):
		for m in ents[z]:
			if m.invisible or m.dead:
				continue
			var mp: Vector2 = m.pos(now)
			if mp.x < x0 - 6 or mp.x > x1 + 2 or (h - mp.y) < row0 - 2 or (h - mp.y) > row1 + 6:
				continue
			list.append([m, mp])
	list.sort_custom(func(a, b): return a[0].layer < b[0].layer if a[0].layer != b[0].layer else a[1].y > b[1].y)
	for it in list:
		var m: Mob = it[0]
		draw_mob(m, to_px(it[1].x, it[1].y, z), now)
		if m.kind == "monster" and m.powerlevel < m.powerlevel_max:
			var bp := to_px(it[1].x, it[1].y, z) + Vector2(3, -4)
			var k := clampf(m.powerlevel / maxf(1.0, m.powerlevel_max), 0.0, 1.0)
			draw_rect(Rect2(bp, Vector2(26, 3)), Color(0, 0, 0, 0.6))
			draw_rect(Rect2(bp, Vector2(26 * k, 3)), Color.LIME_GREEN if k > 0.5 else (Color.GOLD if k > 0.2 else Color.RED))
	# names for nearby monsters and NPCs
	for it in list:
		var m: Mob = it[0]
		if (m.kind == "monster" or m.kind == "npc") and abs(m.x - focus.x) <= 6 and abs(m.y - focus.y) <= 5:
			var np := to_px(it[1].x, it[1].y, z) + Vector2(16, -7)
			var col := Color(1, 0.55, 0.55) if m.target == focus else (Color(0.7, 0.9, 1) if m.kind == "npc" else Color.WHITE)
			_text(m.name, np, 7, col)
	# floating combat text
	for f in floaters:
		if f["z"] != z:
			continue
		var k: float = (now - f["t0"]) / f["dur"]
		var fp := to_px(f["x"], f["y"], z) + Vector2(16, -2 - k * 18)
		_text(f["text"], fp, 8, Color(f["color"], 1.0 - k))


func _text(s: String, center: Vector2, size: int, col: Color) -> void:
	var w := font.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, size).x
	draw_string(font, center + Vector2(-w / 2 + 0.5, 0.5), s, HORIZONTAL_ALIGNMENT_LEFT, -1, size, Color(0, 0, 0, col.a))
	draw_string(font, center + Vector2(-w / 2, 0), s, HORIZONTAL_ALIGNMENT_LEFT, -1, size, col)
