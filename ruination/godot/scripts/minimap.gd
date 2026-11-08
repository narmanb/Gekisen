extends Control
## Minimap: the tiles around you coloured from their own sprites, monsters red, people cyan,
## you white. Tap it to cycle small / medium / large; drag it to move it. Remembered between runs.

const RADIUS := 20
const SIZES := [160.0, 240.0, 320.0]
const DRAG_START := 12.0
var size_i := 0
var colors := {}          # type index -> Color
var images := {}          # icon id -> Image
var last := 0.0
var touch := -1           # finger index holding the map
var press_at := Vector2.ZERO
var grab := Vector2.ZERO
var dragged := false
var ui                    # set by ui.gd


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE      # touches are handled in _input (no mouse emulation double-taps)
	var d: Dictionary = _prefs().get("minimap_layout", {})
	size_i = clampi(int(d.get("size", 0)), 0, SIZES.size() - 1)
	var s: float = SIZES[size_i]
	var vs := get_viewport_rect().size
	position = Vector2(float(d.get("x", vs.x - s - 10)), float(d.get("y", 76)))
	_apply_size()
	get_viewport().size_changed.connect(_clamp)


func _input(e: InputEvent) -> void:
	if not is_visible_in_tree():
		return
	if e is InputEventScreenTouch:
		if e.pressed:
			if touch == -1 and Rect2(global_position, size).has_point(e.position) and not _blocked():
				touch = e.index
				press_at = e.position
				grab = e.position - position
				dragged = false
				get_viewport().set_input_as_handled()
		elif e.index == touch:
			touch = -1
			if not dragged:
				size_i = (size_i + 1) % SIZES.size()
				var c := position + size / 2
				var s: float = SIZES[size_i]
				position = c - Vector2(s, s) / 2         # grow / shrink around the centre
				_apply_size()
			_save()
			get_viewport().set_input_as_handled()
	elif e is InputEventScreenDrag and e.index == touch:
		if not dragged and (e.position - press_at).length() > DRAG_START:
			dragged = true
		if dragged:
			position = e.position - grab
			_clamp()
		get_viewport().set_input_as_handled()


## Don't steal touches meant for an open dialog or the skills book.
func _blocked() -> bool:
	return ui != null and (ui._modal_open() or ui.book.visible or ui.stats_panel.visible or ui.menu_panel.visible or (ui.notes_panel != null and ui.notes_panel.visible))


func _apply_size() -> void:
	var s: float = SIZES[size_i]
	custom_minimum_size = Vector2(s, s)       # set first: size can't go below the old minimum
	size = Vector2(s, s)
	_clamp()
	queue_redraw()


func _clamp() -> void:
	var vs := get_viewport_rect().size
	position = Vector2(clampf(position.x, 0, maxf(0, vs.x - size.x)), clampf(position.y, 0, maxf(0, vs.y - size.y)))


func reset_layout() -> void:
	size_i = 0
	var vs := get_viewport_rect().size
	position = Vector2(vs.x - SIZES[0] - 10, 76)
	_apply_size()
	_save()


func _prefs() -> Dictionary:
	var path := "user://ui_prefs.json"
	if not FileAccess.file_exists(path):
		return {}
	var v = JSON.parse_string(FileAccess.get_file_as_string(path))
	return v if v is Dictionary else {}


func _save() -> void:
	var d := _prefs()
	d["minimap_layout"] = {"x": position.x, "y": position.y, "size": size_i}
	var f := FileAccess.open("user://ui_prefs.json", FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(d))


func _process(_d: float) -> void:
	if not visible or Game.pe == null:
		return
	var t := Time.get_ticks_msec()
	if t - last > 250:
		last = t
		queue_redraw()


func _tile_color(ti: int) -> Color:
	if colors.has(ti):
		return colors[ti]
	var ty: Dictionary = Data.types.get(str(ti), {})
	var c := Color(0, 0, 0, 0)
	if ty.has("icon") and not ty.has("invis"):
		var id := int(ty["icon"])
		var fr := Data.frame(id, ty.get("state", ""), int(ty.get("dir", 2)), 0, false)
		if not fr.is_empty():
			if not images.has(id):
				images[id] = (fr[0] as Texture2D).get_image()
			var img: Image = images[id]
			var r: Rect2 = fr[1]
			var acc := Color(0, 0, 0, 0)
			var n := 0
			for sy in 4:
				for sx in 4:
					var px := img.get_pixel(int(r.position.x + (sx + 0.5) * r.size.x / 4.0), int(r.position.y + (sy + 0.5) * r.size.y / 4.0))
					if px.a > 0.5:
						acc += px
						n += 1
			if n > 0:
				c = Color(acc.r / n, acc.g / n, acc.b / n, 1)
				if int(ty.get("dense", 0)) == 1:
					c = c.darkened(0.45)
	colors[ti] = c
	return c


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, size), Color(0, 0, 0, 0.6))
	var pe: Mob = Game.pe
	if pe == null:
		return
	var n := RADIUS * 2 + 1
	var cs := size.x / n
	for dy in range(-RADIUS, RADIUS + 1):
		for dx in range(-RADIUS, RADIUS + 1):
			var stack := Data.turf_stack(pe.x + dx, pe.y + dy, pe.z)
			var c := Color(0, 0, 0, 0)
			for i in range(stack.size() - 1, -1, -1):
				var tc := _tile_color(int(stack[i]))
				if tc.a > 0:
					c = tc
					break
			if c.a > 0:
				draw_rect(Rect2((dx + RADIUS) * cs, (RADIUS - dy) * cs, cs + 0.5, cs + 0.5), c)
	var ents: Dictionary = Game.world.ents.get(pe.z, {})
	for m in ents:
		if m.dead or m.invisible or m == pe:
			continue
		var dx: int = m.x - pe.x
		var dy: int = m.y - pe.y
		if absi(dx) > RADIUS or absi(dy) > RADIUS:
			continue
		var col := Color(1, 0.25, 0.25) if m.kind == "monster" else (Color(0.4, 0.9, 1) if m.kind == "npc" else Color(0, 0, 0, 0))
		if col.a > 0:
			draw_rect(Rect2((dx + RADIUS) * cs - 1, (RADIUS - dy) * cs - 1, cs + 2, cs + 2), col)
	var c0 := Vector2(RADIUS * cs + cs / 2, RADIUS * cs + cs / 2)
	draw_circle(c0, maxf(2.5, cs * 0.9), Color.BLACK)
	draw_circle(c0, maxf(1.8, cs * 0.65), Color.WHITE)
	draw_rect(Rect2(Vector2.ZERO, size), Color(1, 1, 1, 0.35), false, 1.5)
	draw_string(ThemeDB.fallback_font, Vector2(4, size.y - 5), "%s (%d,%d)" % [Game.zname(pe.z), pe.x, pe.y], HORIZONTAL_ALIGNMENT_LEFT, size.x - 8, 11, Color(1, 1, 1, 0.85))
