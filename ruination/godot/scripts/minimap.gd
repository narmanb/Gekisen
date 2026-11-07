extends Control
## Minimap: the tiles around you coloured from their own sprites, monsters red, people cyan,
## you white. Tap it to switch between small and large.

const RADIUS := 20
var big := false
var colors := {}          # type index -> Color
var images := {}          # icon id -> Image
var last := 0.0


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP
	gui_input.connect(_on_input)
	_apply_size()


func _on_input(e: InputEvent) -> void:
	if e is InputEventMouseButton and e.pressed and e.button_index == MOUSE_BUTTON_LEFT:
		big = not big
		_apply_size()
		accept_event()


func _apply_size() -> void:
	var s := 300.0 if big else 160.0
	size = Vector2(s, s)
	custom_minimum_size = size
	var vs := get_viewport_rect().size
	position = Vector2(vs.x - 435 - s, 8)        # between the HUD and the top-right buttons
	queue_redraw()


func _process(_d: float) -> void:
	if not visible or Game.pe == null:
		return
	var t := Time.get_ticks_msec()
	if t - last > 250:
		last = t
		var vs := get_viewport_rect().size
		position.x = vs.x - 435 - size.x
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
