extends CanvasLayer
## All UI: title, character creation, HUD, log, joystick, hotbar, skills book, stats, dialogs.

const SLOTS := 10
const PAGES := 3
const GOLD := Color(1, 0.72, 0.18)
const PANEL_BG := Color(0.06, 0.07, 0.13, 0.94)

var root: Control
var hud: Control
var log_box: VBoxContainer
var bars := {}
var hud_labels := {}
var hotbar: Control
var slots: Array = []
var page := 0
var page_label: Button
var stick: Control
var attack_btn: Control
var action_panel: Control
var action_buttons: Array = []
var book_cancel: Button
var modal_layer: Control
var dialog_panel: PanelContainer
var dialog_queue: Array = []
var book: PanelContainer
var book_grid: GridContainer
var book_info: Label
var assign_id := ""
var assign_hint: Label
var stats_panel: PanelContainer
var stats_label: RichTextLabel
var menu_panel: PanelContainer
var create_root: Control
var title_root: Control
var font_big := 22
var touches := {}            # index -> {kind, slot, t}
var creation := {}


func _ready() -> void:
	root = Control.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(root)
	_theme()
	_build_hud()
	_build_hotbar()
	_build_stick()
	_build_book()
	_build_stats()
	_build_menu()
	modal_layer = Control.new()
	modal_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	modal_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(modal_layer)
	Game.log_msg.connect(_on_log)
	Game.dialog.connect(_on_dialog)
	set_game_ui(false)
	show_title()


func _theme() -> void:
	var th := Theme.new()
	th.default_font_size = 18
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.16, 0.18, 0.3, 0.92)
	sb.set_corner_radius_all(10)
	sb.set_border_width_all(1)
	sb.border_color = Color(1, 1, 1, 0.18)
	sb.content_margin_left = 12
	sb.content_margin_right = 12
	sb.content_margin_top = 8
	sb.content_margin_bottom = 8
	var sbh := sb.duplicate()
	sbh.bg_color = Color(0.25, 0.28, 0.45, 0.95)
	var sbp := sb.duplicate()
	sbp.bg_color = Color(0.85, 0.55, 0.1, 0.95)
	th.set_stylebox("normal", "Button", sb)
	th.set_stylebox("hover", "Button", sbh)
	th.set_stylebox("pressed", "Button", sbp)
	th.set_stylebox("focus", "Button", StyleBoxEmpty.new())
	var pnl := StyleBoxFlat.new()
	pnl.bg_color = PANEL_BG
	pnl.set_corner_radius_all(14)
	pnl.set_border_width_all(2)
	pnl.border_color = GOLD
	pnl.content_margin_left = 16
	pnl.content_margin_right = 16
	pnl.content_margin_top = 12
	pnl.content_margin_bottom = 12
	th.set_stylebox("panel", "PanelContainer", pnl)
	var le := sb.duplicate()
	le.bg_color = Color(0.1, 0.11, 0.2)
	th.set_stylebox("normal", "LineEdit", le)
	th.set_color("font_color", "Label", Color(0.95, 0.95, 0.97))
	root.theme = th


func _label(text: String, size := 18, col := Color(0.95, 0.95, 0.97)) -> Label:
	var l := Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", size)
	l.add_theme_color_override("font_color", col)
	l.add_theme_color_override("font_outline_color", Color.BLACK)
	l.add_theme_constant_override("outline_size", 4)
	return l


## Place an anchored control by its offsets from the anchor. Setting .position instead
## depends on the parent's size at that moment, which is not final yet on some starts
## (the joystick could end up off-screen when continuing a saved game).
func _offs(c: Control, off: Vector2) -> void:
	var s := c.size if c.size != Vector2.ZERO else c.custom_minimum_size
	c.offset_left = off.x
	c.offset_top = off.y
	c.offset_right = off.x + s.x
	c.offset_bottom = off.y + s.y


func _button(text: String, cb: Callable, size := 18) -> Button:
	var b := Button.new()
	b.text = text
	b.add_theme_font_size_override("font_size", size)
	b.pressed.connect(cb)
	return b


func set_game_ui(on: bool) -> void:
	for n in [hud, hotbar, stick, attack_btn, action_panel]:
		n.visible = on


# =================================================================== HUD
func _build_hud() -> void:
	hud = Control.new()
	hud.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	hud.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(hud)
	var panel := PanelContainer.new()
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0.55)
	sb.set_corner_radius_all(10)
	sb.content_margin_left = 10
	sb.content_margin_right = 10
	sb.content_margin_top = 6
	sb.content_margin_bottom = 6
	panel.add_theme_stylebox_override("panel", sb)
	panel.position = Vector2(8, 8)
	panel.custom_minimum_size = Vector2(330, 0)
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(panel)
	var v := VBoxContainer.new()
	v.add_theme_constant_override("separation", 2)
	panel.add_child(v)
	hud_labels["name"] = _label("", 17, GOLD)
	v.add_child(hud_labels["name"])
	hud_labels["level"] = _label("", 14)
	v.add_child(hud_labels["level"])
	for b in [["hp", "Powerlevel", Color(0.9, 0.25, 0.25)], ["ki", "Ki", Color(0.25, 0.5, 0.95)],
			["stam", "Stamina", Color(0.85, 0.6, 0.15)], ["exp", "Skill exp", Color(0.6, 0.35, 0.9)]]:
		v.add_child(_bar(b[0], b[1], b[2]))
	hud_labels["info"] = _label("", 13, Color(0.75, 0.78, 0.9))
	v.add_child(hud_labels["info"])
	log_box = VBoxContainer.new()
	log_box.position = Vector2(10, 250)
	log_box.custom_minimum_size = Vector2(560, 0)
	log_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	log_box.add_theme_constant_override("separation", 0)
	hud.add_child(log_box)
	# top-right buttons
	var tr := HBoxContainer.new()
	tr.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
	_offs(tr, Vector2(-330, 10))
	tr.custom_minimum_size = Vector2(320, 56)
	tr.alignment = BoxContainer.ALIGNMENT_END
	tr.add_theme_constant_override("separation", 8)
	hud.add_child(tr)
	tr.add_child(_button("Skills", func(): toggle_book(), 18))
	tr.add_child(_button("Stats", func(): toggle_stats(), 18))
	tr.add_child(_button("Menu", func(): menu_panel.visible = not menu_panel.visible, 18))
	assign_hint = _label("", 20, GOLD)
	assign_hint.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM)
	assign_hint.offset_top -= 150
	assign_hint.offset_bottom -= 150
	assign_hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	assign_hint.grow_horizontal = Control.GROW_DIRECTION_BOTH
	hud.add_child(assign_hint)


func _bar(key: String, title: String, col: Color) -> Control:
	var c := Control.new()
	c.custom_minimum_size = Vector2(310, 18)
	var bg := ColorRect.new()
	bg.color = Color(1, 1, 1, 0.12)
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	c.add_child(bg)
	var fill := ColorRect.new()
	fill.color = col
	fill.position = Vector2.ZERO
	fill.size = Vector2(310, 18)
	c.add_child(fill)
	var l := _label(title, 12)
	l.position = Vector2(6, -1)
	c.add_child(l)
	bars[key] = [fill, l, title]
	return c


func _set_bar(key: String, cur: float, mx: float, txt := "") -> void:
	var b: Array = bars[key]
	var k := clampf(cur / maxf(mx, 1.0), 0.0, 1.0)
	b[0].size = Vector2(310 * k, 18)
	b[1].text = "%s  %s" % [b[2], txt if txt != "" else "%s / %s" % [Game.fmt(cur), Game.fmt(mx)]]


func _process(_d: float) -> void:
	if not Game.running:
		return
	var P := Game.P
	hud_labels["name"].text = "%s  (%s)%s" % [P["name"], P["race"], "  ✝" if P.get("dead", false) and not P.get("newb", false) else ""]
	var busy_txt: String = {"train": " · training", "meditate": " · meditating", "rest": " · resting", "powerup": " · powering up", "block": " · blocking"}.get(Game.busy, "")
	var form_txt: String = " · " + str(P.get("form_name", "")) if int(P.get("form", 0)) > 0 else ""
	if Game.kaioken > 0:
		form_txt += " · Kaioken"
	hud_labels["level"].text = "Max PL %s · %d SP · Anger %d%s%s" % [Game.fmt(P["maxpl"]), int(P["skpts"]), int(P["anger"]), form_txt, busy_txt]
	_set_bar("hp", P["pl"], Game.cap("powerlevel"))
	_set_bar("ki", P["ki"], Game.cap("ki"))
	_set_bar("stam", P["stam"], P["maxstam"])
	_set_bar("exp", P["skexp"], P["maxskexp"])
	hud_labels["info"].text = "%s zenni · %s (%d,%d)%s" % [Game.fmt(P["zenni"]), Game.zname(int(P["z"])), int(P["x"]), int(P["y"]),
		(" · SAFE" if Data.is_safe(int(P["x"]), int(P["y"]), int(P["z"])) else "") + (" · %dx GRAVITY" % int(Game.grav) if Game.grav > 0.0 else "")]
	for s in slots:
		s.queue_redraw()
	attack_btn.queue_redraw()
	if Engine.get_process_frames() % 15 == 0:
		_refresh_actions()
	for b in action_buttons:
		b.queue_redraw()
	# fade old log lines
	var t := Time.get_ticks_msec()
	for l in log_box.get_children():
		var age: float = t - float(l.get_meta("t"))
		l.modulate.a = clampf(1.0 - (age - 9000.0) / 1500.0, 0.0, 1.0)
	if stats_panel.visible and Engine.get_process_frames() % 20 == 0:
		_refresh_stats()


func _on_log(text: String, col: Color) -> void:
	var l := _label(text, 15, col)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size = Vector2(560, 0)
	l.set_meta("t", Time.get_ticks_msec())
	log_box.add_child(l)
	while log_box.get_child_count() > 6:
		var c := log_box.get_child(0)
		log_box.remove_child(c)
		c.queue_free()


# =================================================================== hotbar
class HotSlot extends Control:
	var ui
	var idx := 0
	func _draw() -> void:
		var r := Rect2(Vector2.ZERO, size)
		var id: String = ui.slot_id(idx)
		var bg := Color(0.08, 0.09, 0.15, 0.85)
		draw_rect(r, bg)
		if id != "":
			var info: Dictionary = Game.ability_info(id)
			draw_rect(r.grow(-3), Color(info["color"], 0.55))
			var drew := false
			if info.has("icon"):
				var fr := Data.frame(int(info["icon"]), info.get("state", ""), 4, Game.now, true)
				if not fr.is_empty():
					var src: Rect2 = fr[1]
					var k := minf((size.x - 12) / src.size.x, (size.y - 12) / src.size.y)
					var dst := Rect2((size - src.size * k) / 2, src.size * k)
					draw_texture_rect_region(fr[0], dst, src)
					drew = true
			var font := ThemeDB.fallback_font
			if not drew:
				var g: String = info["glyph"]
				var w := font.get_string_size(g, HORIZONTAL_ALIGNMENT_LEFT, -1, 18).x
				draw_string(font, Vector2((size.x - w) / 2, size.y / 2 + 7), g, HORIZONTAL_ALIGNMENT_LEFT, -1, 18, Color.WHITE)
			var nm: String = info["name"]
			if nm.length() > 10:
				nm = nm.substr(0, 9) + "."
			var nw := font.get_string_size(nm, HORIZONTAL_ALIGNMENT_LEFT, -1, 10).x
			draw_string(font, Vector2((size.x - nw) / 2, size.y - 4), nm, HORIZONTAL_ALIGNMENT_LEFT, -1, 10, Color(1, 1, 1, 0.9))
			var cd: float = Game.cooldown_left(id)
			if cd > 0:
				draw_rect(r, Color(0, 0, 0, 0.6))
				var s := "%.1f" % (cd / 1000.0)
				var cw := font.get_string_size(s, HORIZONTAL_ALIGNMENT_LEFT, -1, 16).x
				draw_string(font, Vector2((size.x - cw) / 2, size.y / 2 + 6), s, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
			if Game.is_active(id):
				draw_rect(r, Color(1, 0.8, 0.3), false, 3)
		var hl: bool = ui.assign_id != ""
		draw_rect(r, GOLD if hl else Color(1, 1, 1, 0.25), false, 2 if hl else 1)
		var key := str((idx + 1) % 10)
		draw_string(ThemeDB.fallback_font, Vector2(4, 13), key, HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(1, 1, 1, 0.7))


class BigButton extends Control:
	var ui
	var label := "ATTACK"
	func _draw() -> void:
		var c := size / 2
		draw_circle(c, size.x / 2, Color(0.7, 0.15, 0.1, 0.85))
		draw_arc(c, size.x / 2 - 1, 0, TAU, 48, Color(1, 1, 1, 0.35), 2)
		var font := ThemeDB.fallback_font
		var w := font.get_string_size(label, HORIZONTAL_ALIGNMENT_LEFT, -1, 18).x
		draw_string(font, Vector2(c.x - w / 2, c.y + 7), label, HORIZONTAL_ALIGNMENT_LEFT, -1, 18, Color.WHITE)


func slot_id(i: int) -> String:
	if Game.P.is_empty():
		return ""
	var hb: Array = Game.P["hotbar"]
	var k := page * SLOTS + i
	return hb[k] if k < hb.size() else ""


func _build_hotbar() -> void:
	hotbar = Control.new()
	hotbar.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM)
	var w := SLOTS * 68 + 90
	hotbar.custom_minimum_size = Vector2(w, 76)
	hotbar.size = Vector2(w, 76)
	_offs(hotbar, Vector2(-w / 2.0 + 40, -84))
	hotbar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(hotbar)
	var bg := Panel.new()
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0, 0, 0, 0.5)
	sb.set_corner_radius_all(10)
	bg.add_theme_stylebox_override("panel", sb)
	bg.position = Vector2(-6, -4)
	bg.size = Vector2(w + 12, 80)
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hotbar.add_child(bg)
	for i in SLOTS:
		var s := HotSlot.new()
		s.ui = self
		s.idx = i
		s.position = Vector2(i * 68, 4)
		s.size = Vector2(64, 64)
		s.mouse_filter = Control.MOUSE_FILTER_IGNORE
		hotbar.add_child(s)
		slots.append(s)
	var pg := _button("Bar 1\n▶", func(): _page(1), 15)
	pg.position = Vector2(SLOTS * 68 + 4, 4)
	pg.custom_minimum_size = Vector2(78, 64)
	pg.size = Vector2(78, 64)
	hotbar.add_child(pg)
	page_label = pg
	attack_btn = BigButton.new()
	attack_btn.ui = self
	attack_btn.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_RIGHT)
	attack_btn.size = Vector2(120, 120)
	_offs(attack_btn, Vector2(-140, -140))
	attack_btn.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(attack_btn)
	action_panel = Control.new()
	action_panel.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	action_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(action_panel)


## Round buttons on the right edge for the non-combat actions (train, meditate, rest,
## fly, power up, transform...). They can also be placed on the hotbar from the Skills book.
class ActionButton extends Control:
	var id := ""
	func _draw() -> void:
		var info: Dictionary = Game.ability_info(id)
		var c := size / 2
		var on: bool = Game.is_active(id)
		draw_circle(c, size.x / 2, Color(info["color"], 0.9) if on else Color(0.08, 0.09, 0.15, 0.78))
		draw_arc(c, size.x / 2 - 1, 0, TAU, 40, GOLD if on else Color(info["color"].lightened(0.3), 0.9), 3 if on else 2)
		var font := ThemeDB.fallback_font
		var g: String = info["glyph"]
		var w := font.get_string_size(g, HORIZONTAL_ALIGNMENT_LEFT, -1, 15).x
		draw_string(font, Vector2(c.x - w / 2, c.y + 2), g, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color.WHITE)
		var nm: String = info["name"].replace("Instant Transmission", "Teleport")
		var nw := font.get_string_size(nm, HORIZONTAL_ALIGNMENT_LEFT, -1, 9).x
		draw_string(font, Vector2(c.x - nw / 2, c.y + 15), nm, HORIZONTAL_ALIGNMENT_LEFT, -1, 9, Color(1, 1, 1, 0.85))


func _refresh_actions() -> void:
	var ids: Array = Game.panel_actions()
	var cur: Array = []
	for b in action_buttons:
		cur.append(b.id)
	if cur == ids:
		return
	for b in action_buttons:
		b.queue_free()
	action_buttons.clear()
	# two columns above the attack button, filled bottom-up
	var vs := root.get_viewport_rect().size
	var d := 62.0
	for i in ids.size():
		var b := ActionButton.new()
		b.id = ids[i]
		b.size = Vector2(56, 56)
		var col := i % 2
		var row := i / 2
		b.position = Vector2(vs.x - 80 - col * d - (36 if row == 0 else 0), vs.y - 220 - row * d)
		b.mouse_filter = Control.MOUSE_FILTER_IGNORE
		action_panel.add_child(b)
		action_buttons.append(b)


func _action_at(p: Vector2) -> String:
	for b in action_buttons:
		if (p - (b.global_position + b.size / 2)).length() <= b.size.x / 2 + 3:
			return b.id
	return ""


func _page(d: int) -> void:
	page = (page + d + PAGES) % PAGES
	page_label.text = "Bar %d\n▶" % (page + 1)


func _slot_at(p: Vector2) -> int:
	for s in slots:
		if Rect2(s.global_position, s.size).has_point(p):
			return s.idx
	return -1


func _slot_tap(i: int) -> void:
	var k := page * SLOTS + i
	if assign_id != "":
		var hb: Array = Game.P["hotbar"]
		var old := hb.find(assign_id)
		if old >= 0:
			hb[old] = hb[k]
		hb[k] = assign_id
		Game.msg("Placed %s on bar %d slot %d." % [Game.ability_info(assign_id)["name"], page + 1, i + 1], GOLD)
		_cancel_assign()
		return
	Game.use_ability(slot_id(i))


func _slot_clear(i: int) -> void:
	var k := page * SLOTS + i
	var hb: Array = Game.P["hotbar"]
	if hb[k] != "":
		Game.msg("Removed %s from the bar." % Game.ability_info(hb[k])["name"], Color(0.8, 0.8, 0.8))
		hb[k] = ""


# =================================================================== joystick + touch routing
class Stick extends Control:
	var knob := Vector2.ZERO
	func _draw() -> void:
		var c := size / 2
		draw_circle(c, size.x / 2, Color(1, 1, 1, 0.08))
		draw_arc(c, size.x / 2 - 1, 0, TAU, 48, Color(1, 1, 1, 0.25), 2)
		draw_circle(c + knob, size.x / 5, Color(1, 1, 1, 0.3))


func _build_stick() -> void:
	stick = Stick.new()
	stick.set_anchors_and_offsets_preset(Control.PRESET_BOTTOM_LEFT)
	stick.size = Vector2(190, 190)
	_offs(stick, Vector2(24, -214))
	stick.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(stick)


func _modal_open() -> bool:
	return dialog_panel != null and is_instance_valid(dialog_panel) or create_root != null or title_root != null


func _input(event: InputEvent) -> void:
	if not Game.running or not hud.visible:
		return
	if event is InputEventScreenTouch:
		var p: Vector2 = event.position
		if event.pressed:
			if _modal_open() or book.visible and Rect2(book.global_position, book.size).has_point(p):
				return
			if Rect2(stick.global_position, stick.size).has_point(p):
				touches[event.index] = {"kind": "stick"}
				_stick_move(p)
				get_viewport().set_input_as_handled()
			elif _slot_at(p) >= 0:
				touches[event.index] = {"kind": "slot", "slot": _slot_at(p), "t": Time.get_ticks_msec()}
				get_viewport().set_input_as_handled()
			elif _action_at(p) != "":
				var aid := _action_at(p)
				touches[event.index] = {"kind": "action"}
				if assign_id == "":
					Game.use_ability(aid)
				get_viewport().set_input_as_handled()
			elif (p - (attack_btn.global_position + attack_btn.size / 2)).length() < attack_btn.size.x / 2:
				touches[event.index] = {"kind": "attack", "t": Time.get_ticks_msec()}
				Game.use_ability("attack")
				get_viewport().set_input_as_handled()
		else:
			var t = touches.get(event.index)
			if t == null:
				return
			touches.erase(event.index)
			match t["kind"]:
				"stick":
					stick.knob = Vector2.ZERO
					stick.queue_redraw()
					Game.set_move_dir(0)
				"slot":
					var held := Time.get_ticks_msec() - int(t["t"])
					if _slot_at(p) == t["slot"]:
						if held > 600:
							_slot_clear(t["slot"])
						else:
							_slot_tap(t["slot"])
			get_viewport().set_input_as_handled()
	elif event is InputEventScreenDrag:
		var t = touches.get(event.index)
		if t != null and t["kind"] == "stick":
			_stick_move(event.position)
			get_viewport().set_input_as_handled()
	elif event is InputEventKey and event.pressed and not event.echo:
		if _modal_open():
			if event.keycode in [KEY_ENTER, KEY_SPACE] and dialog_panel != null and is_instance_valid(dialog_panel):
				var bs := dialog_panel.find_children("*", "Button", true, false)
				if not bs.is_empty():
					bs[0].emit_signal("pressed")
			return
		var kc: int = event.keycode
		if kc >= KEY_1 and kc <= KEY_9:
			_slot_tap(kc - KEY_1)
		elif kc == KEY_0:
			_slot_tap(9)
		elif kc == KEY_SPACE:
			Game.use_ability("attack")
		elif kc == KEY_TAB:
			_page(1)
		elif kc == KEY_K:
			toggle_book()
		elif kc == KEY_ESCAPE:
			if assign_id != "":
				_cancel_assign()
			elif book.visible:
				toggle_book()
		elif kc == KEY_C:
			toggle_stats()
	_keys_move()


var _held := {}


func _keys_move() -> void:
	if _modal_open():
		return
	var dx := 0
	var dy := 0
	if Input.is_physical_key_pressed(KEY_UP) or Input.is_physical_key_pressed(KEY_W):
		dy += 1
	if Input.is_physical_key_pressed(KEY_DOWN) or Input.is_physical_key_pressed(KEY_S):
		dy -= 1
	if Input.is_physical_key_pressed(KEY_RIGHT) or Input.is_physical_key_pressed(KEY_D):
		dx += 1
	if Input.is_physical_key_pressed(KEY_LEFT) or Input.is_physical_key_pressed(KEY_A):
		dx -= 1
	var any := dx != 0 or dy != 0
	if any:
		Game.set_move_dir(Game.dir_to(dx, dy))
		_held["k"] = true
	elif _held.get("k", false):
		_held["k"] = false
		Game.set_move_dir(0)


func _stick_move(p: Vector2) -> void:
	var c := stick.global_position + stick.size / 2
	var v := p - c
	var mx := stick.size.x / 2 - 20
	if v.length() > mx:
		v = v.normalized() * mx
	stick.knob = v
	stick.queue_redraw()
	if v.length() < 14:
		Game.set_move_dir(0)
		return
	var a := rad_to_deg(atan2(-v.y, v.x))
	var sector := int(roundf(fposmod(a, 360.0) / 45.0)) % 8
	Game.set_move_dir([4, 5, 1, 9, 8, 10, 2, 6][sector])


# =================================================================== skills book
func _build_book() -> void:
	book = PanelContainer.new()
	book.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	book.custom_minimum_size = Vector2(760, 470)
	_offs(book, Vector2(-380, -280))
	book.visible = false
	root.add_child(book)
	var v := VBoxContainer.new()
	book.add_child(v)
	var h := HBoxContainer.new()
	v.add_child(h)
	var t := _label("Skills & Techniques", 22, GOLD)
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(t)
	book_cancel = _button("Cancel placing", func(): _cancel_assign())
	book_cancel.visible = false
	h.add_child(book_cancel)
	h.add_child(_button("Close", func(): toggle_book()))
	book_info = _label("Tap a skill to see what it does, then tap a hotbar slot to place it there. Hold a hotbar slot to clear it.", 15, Color(0.8, 0.82, 0.9))
	book_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	book_info.custom_minimum_size = Vector2(720, 60)
	v.add_child(book_info)
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(720, 340)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	v.add_child(sc)
	book_grid = GridContainer.new()
	book_grid.columns = 4
	book_grid.add_theme_constant_override("h_separation", 6)
	book_grid.add_theme_constant_override("v_separation", 6)
	sc.add_child(book_grid)


func toggle_book() -> void:
	book.visible = not book.visible
	if book.visible:
		stats_panel.visible = false
		_refresh_book()
	else:
		_cancel_assign()


func _cancel_assign() -> void:
	assign_id = ""
	assign_hint.text = ""
	if book_cancel:
		book_cancel.visible = false
	if book_info:
		book_info.text = "Tap a skill to see what it does, then tap a hotbar slot to place it there. Hold a hotbar slot to clear it."


func _refresh_book() -> void:
	for c in book_grid.get_children():
		c.queue_free()
	for id in Game.abilities():
		var info := Game.ability_info(id)
		var b := Button.new()
		b.text = info["name"]
		b.custom_minimum_size = Vector2(174, 54)
		b.add_theme_font_size_override("font_size", 15)
		b.clip_text = true
		var sb := StyleBoxFlat.new()
		sb.bg_color = Color(info["color"], 0.75)
		sb.set_corner_radius_all(8)
		sb.content_margin_left = 6
		b.add_theme_stylebox_override("normal", sb)
		if info.has("icon"):
			var fr := Data.frame(int(info["icon"]), info.get("state", ""), 4, 0, false)
			if not fr.is_empty():
				var at := AtlasTexture.new()
				at.atlas = fr[0]
				at.region = fr[1]
				b.icon = at
				b.expand_icon = true
		b.pressed.connect(func(): _pick(id))
		book_grid.add_child(b)
	if int(Game.P.get("items", {}).get("senzu", 0)) > 0:
		var sb2 := _button("Senzu Bean (%d)" % int(Game.P["items"]["senzu"]), func(): _pick("senzu"), 15)
		sb2.custom_minimum_size = Vector2(174, 54)
		book_grid.add_child(sb2)
	var todo: Array = []
	for k in Game.TECHS:
		if not k in Game.P["learned"]:
			todo.append("%s (%s)" % [Game.TECHS[k]["name"], Game.TECHS[k]["learn"]])
	if not todo.is_empty() and assign_id == "":
		book_info.text = "Tap something to put it on the hotbar.\nStill to learn: " + "; ".join(todo)


func _pick(id: String) -> void:
	var info := Game.ability_info(id)
	assign_id = id
	book_info.text = "%s — %s\nNow tap a hotbar slot to place it (or tap the slot keys 1-0)." % [info["name"], info["desc"]]
	assign_hint.text = "Tap a hotbar slot to place %s" % info["name"]
	book_cancel.visible = true


# =================================================================== stats
func _build_stats() -> void:
	stats_panel = PanelContainer.new()
	stats_panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	stats_panel.custom_minimum_size = Vector2(700, 470)
	_offs(stats_panel, Vector2(-350, -280))
	stats_panel.visible = false
	root.add_child(stats_panel)
	var v := VBoxContainer.new()
	stats_panel.add_child(v)
	var h := HBoxContainer.new()
	v.add_child(h)
	var t := _label("Character", 22, GOLD)
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(t)
	h.add_child(_button("Close", func(): toggle_stats()))
	stats_label = RichTextLabel.new()
	stats_label.bbcode_enabled = true
	stats_label.custom_minimum_size = Vector2(660, 330)
	stats_label.add_theme_font_size_override("normal_font_size", 16)
	v.add_child(stats_label)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	v.add_child(row)
	bp_label = _label("", 16, GOLD)
	row.add_child(bp_label)
	row.add_child(_button("Change Stance", func(): _stance_menu(), 14))
	row.add_child(_button("Eat Senzu Bean", func(): Game.eat_senzu(); _refresh_stats(), 14))


var bp_label: Label


func _stance_menu() -> void:
	var opts: Array = ["Basic Stance"]
	match Game.P["race"]:
		"Namek": opts.append("Namekian Stance")
		"Changling": opts.append("Changling Stance")
	if "Kamehameha" in Game.P["learned"]:
		opts.append("Turtle Hermit Stance")
	if Game.P.get("know", {}).get("kicombt", 0) == 1:
		opts.append("Advanced Stance")
	if Game.P.get("bubbles", false) and Game.P.get("gregory", false):
		opts.append("Kai Stance")
	Game.ask("Combat Stance", "Damage per hit is a % of your powerlevel:\n" + "\n".join(opts.map(func(o): return "%s: %s-%s%%, %s%% critical" % [o, Game.STANCE[o][0], Game.STANCE[o][1], Game.STANCE[o][2]])), opts, func(c: String, _i: int):
		Game.P["stance"] = c
		Game.msg("You take the %s." % c, Color(0.8, 0.9, 1))
		_refresh_stats())


func toggle_stats() -> void:
	stats_panel.visible = not stats_panel.visible
	if stats_panel.visible:
		book.visible = false
		_refresh_stats()


func _refresh_stats() -> void:
	var P := Game.P
	var f := Game.fmt
	var s := "[b]%s[/b] — %s · %s (alignment %d) · from %s\n" % [P["name"], P["race"], P["alignment"], int(P["ap"]), P["hometown"]]
	s += "Powerlevel %s / %s (max %s)\n" % [f.call(P["pl"]), f.call(Game.cap("powerlevel")), f.call(P["maxpl"])]
	s += "Ki %s / %s · Stamina %s / %s · Focus %d\n" % [f.call(P["ki"]), f.call(Game.cap("ki")), f.call(P["stam"]), f.call(P["maxstam"]), int(P["focus"])]
	s += "Skill exp %d / %d · Skill points %d · Zenni %s\n" % [int(P["skexp"]), int(P["maxskexp"]), int(P["skpts"]), f.call(P["zenni"])]
	s += "Stance: %s · Anger %d/10 · Kills %d · Deaths %d%s\n" % [P["stance"], int(P["anger"]), int(P["kills"]), int(P["deaths"]), " · Dead (halo)" if P.get("dead", false) and not P.get("newb", false) else ""]
	var kn: Array = []
	for l in Game.KI_LESSONS:
		if P["know"].get(l[0], 0) == 1:
			kn.append(l[1])
	s += "Ki lessons: %s\n" % (", ".join(kn) if not kn.is_empty() else "none yet (Ki Trainers)")
	var fl := Game.forms_for()
	if not fl.is_empty():
		s += "\n[b]Transformations[/b]\n"
		var i := 0
		for fm in fl:
			i += 1
			s += "%s — %s max powerlevel, x%s%s\n" % [fm[0], f.call(fm[1]), str(fm[2]), "  [color=yellow](current)[/color]" if int(P["form"]) == i else ""]
	var mins := int(float(P["playtime"]) / 60.0)
	s += "\nPlay time %dh %dm" % [mins / 60, mins % 60]
	stats_label.text = s
	bp_label.text = "Senzu Beans: %d " % int(P["items"].get("senzu", 0))


# =================================================================== menu
func _build_menu() -> void:
	menu_panel = PanelContainer.new()
	menu_panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	menu_panel.custom_minimum_size = Vector2(380, 0)
	_offs(menu_panel, Vector2(-190, -200))
	menu_panel.visible = false
	root.add_child(menu_panel)
	var v := VBoxContainer.new()
	v.add_theme_constant_override("separation", 8)
	menu_panel.add_child(v)
	v.add_child(_label("Menu", 22, GOLD))
	v.add_child(_button("Skills & Hotbar", func(): menu_panel.visible = false; toggle_book()))
	v.add_child(_button("Character Stats", func(): menu_panel.visible = false; toggle_stats()))
	v.add_child(_button("Save Game", func(): menu_panel.visible = false; Game.save(); Game.msg("Game saved.", Color(0.5, 1, 0.5))))
	v.add_child(_button("Save & Quit to Title", func(): Game.save(); get_tree().reload_current_scene()))
	v.add_child(_button("Close", func(): menu_panel.visible = false))


# =================================================================== dialogs
func _on_dialog(title: String, text: String, opts: Array, cb: Callable) -> void:
	dialog_queue.append([title, text, opts, cb])
	if dialog_queue.size() == 1:
		_show_dialog()


func _show_dialog() -> void:
	if dialog_queue.is_empty():
		return
	var d: Array = dialog_queue[0]
	Game.set_move_dir(0)
	dialog_panel = PanelContainer.new()
	dialog_panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	dialog_panel.custom_minimum_size = Vector2(520, 0)
	_offs(dialog_panel, Vector2(-260, -240))
	modal_layer.add_child(dialog_panel)
	var v := VBoxContainer.new()
	v.add_theme_constant_override("separation", 8)
	dialog_panel.add_child(v)
	v.add_child(_label(d[0], 22, GOLD))
	var l := _label(d[1], 17)
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size = Vector2(480, 0)
	v.add_child(l)
	var opts: Array = d[2]
	var holder: Container = v
	if opts.size() > 6:
		var sc := ScrollContainer.new()
		sc.custom_minimum_size = Vector2(480, 300)
		var vv := VBoxContainer.new()
		vv.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		sc.add_child(vv)
		v.add_child(sc)
		holder = vv
	for i in opts.size():
		var o: String = opts[i]
		var b := _button(o, func(): _dialog_pick(o, i))
		holder.add_child(b)


func _dialog_pick(o: String, i: int) -> void:
	var d: Array = dialog_queue.pop_front()
	dialog_panel.queue_free()
	dialog_panel = null
	var cb: Callable = d[3]
	if cb.is_valid():
		cb.call(o, i)
	if not dialog_queue.is_empty():
		_show_dialog()


# =================================================================== title + creation
func _fullscreen_bg() -> Control:
	var c := Control.new()
	c.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var bg := ColorRect.new()
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	bg.color = Color(0.04, 0.04, 0.09)
	c.add_child(bg)
	root.add_child(c)
	return c


func show_title() -> void:
	title_root = _fullscreen_bg()
	var v := VBoxContainer.new()
	v.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	_offs(v, Vector2(-300, -220))
	v.custom_minimum_size = Vector2(600, 0)
	v.add_theme_constant_override("separation", 14)
	title_root.add_child(v)
	var t1 := _label("DRAGONBALL", 40, Color(1, 0.85, 0.4))
	t1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(t1)
	var t2 := _label("ONLINE", 72, Color(1, 0.55, 0.1))
	t2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t2.add_theme_constant_override("outline_size", 10)
	t2.add_theme_color_override("font_outline_color", Color(0.45, 0.1, 0))
	v.add_child(t2)
	var t3 := _label("v1.3 · single-player edition", 18, Color(0.6, 0.62, 0.75))
	t3.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(t3)
	var save := Game.load_save()
	if not save.is_empty():
		v.add_child(_button("Continue  (%s, %s, %s max powerlevel)" % [save.get("name", "?"), save.get("race", ""), Game.fmt(save.get("maxpl", 25))], func(): _begin(save), 22))
	_title_has_save = not save.is_empty()
	v.add_child(_button("New Character", _on_new_character, 22))


var _title_has_save := false


func _on_new_character() -> void:
	if not _title_has_save:
		_start_creation()
	else:
		Game.ask("New Character", "Your saved character will be overwritten when you start. Continue?", ["Create new", "Cancel"], _confirm_new)


func _confirm_new(c: String, _i: int) -> void:
	if c == "Create new":
		_start_creation()


func _begin(p: Dictionary) -> void:
	if title_root:
		title_root.queue_free()
		title_root = null
	if create_root:
		create_root.queue_free()
		create_root = null
	set_game_ui(true)
	Game.start(p)
	Game.save()


func _start_creation() -> void:
	if title_root:
		title_root.queue_free()
		title_root = null
	creation = {"race": "Earthling", "hair": "Spikey", "hair_colour": "Black", "alignment": "Neutral", "hometown": "Satan City", "name": ""}
	create_root = _fullscreen_bg()
	_race_step()


func _clear_create() -> VBoxContainer:
	for c in create_root.get_children():
		if not c is ColorRect:
			c.queue_free()
	var v := VBoxContainer.new()
	v.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	v.offset_left = 24
	v.offset_right = -24
	v.offset_top = 16
	v.offset_bottom = -16
	v.add_theme_constant_override("separation", 10)
	create_root.add_child(v)
	return v


class SpriteView extends Control:
	var mob: Mob
	var scale_k := 4.0
	func _process(_d: float) -> void:
		queue_redraw()
	func _draw() -> void:
		if mob == null:
			return
		var fr := Data.frame(mob.icon, "", mob.dir, Game.now, false)
		var h := 32.0
		if not fr.is_empty():
			h = fr[1].size.y
		draw_set_transform(Vector2((size.x - 32 * scale_k) / 2, size.y - h * scale_k - 4), 0, Vector2(scale_k, scale_k))
		var w: Node2D = Game.world
		w.call("draw_mob_on", self, mob)
		draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)


class FaceView extends Control:
	## 64x64 face portraits are split into four 32x32 states "x,y" (y counted from the bottom).
	var icon := -1
	func _draw() -> void:
		if icon < 0:
			return
		var k := size.x / 64.0
		for st in [["0,1", 0, 0], ["1,1", 1, 0], ["0,0", 0, 1], ["1,0", 1, 1]]:
			var fr := Data.frame(icon, st[0], 2, 0, false)
			if fr.is_empty():
				fr = Data.frame(icon, "", 2, 0, false)
			if not fr.is_empty():
				draw_texture_rect_region(fr[0], Rect2(st[1] * 32 * k, st[2] * 32 * k, 32 * k, 32 * k), fr[1])


func _race_step() -> void:
	var v := _clear_create()
	v.add_child(_label("What race do you wish to be?", 28, GOLD))
	var h := HBoxContainer.new()
	h.size_flags_vertical = Control.SIZE_EXPAND_FILL
	h.add_theme_constant_override("separation", 16)
	v.add_child(h)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	h.add_child(grid)
	var right := VBoxContainer.new()
	right.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(right)
	var preview := SpriteView.new()
	preview.custom_minimum_size = Vector2(200, 200)
	right.add_child(preview)
	var info := _label("", 17)
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size = Vector2(420, 0)
	right.add_child(info)
	var select := func(r: String):
		creation["race"] = r
		preview.mob = _preview_mob()
		var rd: Dictionary = Game.RACE_DATA[r]
		info.text = "%s\n\n%s\n\nStarts with %s powerlevel, %s Ki and %s stamina.%s" % [r, rd["info"], Game.fmt(rd["pl"]), Game.fmt(rd["ki"]), Game.fmt(rd["stam"]),
			"\nStarting techniques: " + ", ".join((rd.get("skills", []) as Array).map(func(k): return Game.TECHS[k]["name"])) if rd.has("skills") else ""]
	for r in Game.RACES:
		var b := Button.new()
		b.text = r
		b.custom_minimum_size = Vector2(250, 50)
		b.add_theme_font_size_override("font_size", 18)
		b.icon = _icon_tex(Game.base_icon({"race": r}))
		b.pressed.connect(func(): select.call(r))
		grid.add_child(b)
	select.call(creation["race"])
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): create_root.queue_free(); create_root = null; show_title(), 20))
	nav.add_child(_button("Next", func(): _look_step() if not Game.look_options(creation).is_empty() else _background_step(), 20))


func _icon_tex(icon_id: int) -> Texture2D:
	var fr := Data.frame(icon_id, "", 2, 0, false)
	if fr.is_empty():
		return null
	var at := AtlasTexture.new()
	at.atlas = fr[0]
	at.region = Rect2(fr[1].position + Vector2(0, fr[1].size.y - 32), Vector2(32, 32))
	return at


func _preview_mob() -> Mob:
	var m := Mob.new()
	m.dir = 2
	Game.build_appearance(creation, m)
	return m


func _look_step() -> void:
	var v := _clear_create()
	v.add_child(_label("Appearance", 28, GOLD))
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 24)
	v.add_child(h)
	var preview := SpriteView.new()
	preview.custom_minimum_size = Vector2(220, 240)
	preview.mob = _preview_mob()
	h.add_child(preview)
	var opts := VBoxContainer.new()
	opts.add_theme_constant_override("separation", 10)
	h.add_child(opts)
	var refresh := func(): preview.mob = _preview_mob()
	for o in Game.look_options(creation):
		opts.add_child(_choice(o[0], o[2], o[1], _look_step))
	opts.add_child(_button("Rotate", func(): preview.mob.dir = {2: 4, 4: 1, 1: 8, 8: 2}[preview.mob.dir]))
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _race_step(), 20))
	nav.add_child(_button("Next", func(): _background_step(), 20))


func _background_step() -> void:
	var v := _clear_create()
	v.add_child(_label("Background", 28, GOLD))
	var left := VBoxContainer.new()
	left.add_theme_constant_override("separation", 10)
	v.add_child(left)
	left.add_child(_choice("Alignment", ["Good", "Neutral", "Evil"], "alignment", _background_step))
	left.add_child(_label("Evil monsters hunt good and neutral fighters; the Z fighters hunt evil ones.\nKing Yemma judges the dead by their alignment.", 14, Color(0.75, 0.8, 0.95)))
	left.add_child(_choice("Hometown", Game.HOMETOWNS.keys(), "hometown", _background_step))
	left.add_child(_label("You start on Newbie Island; Intro 2 sends you to your hometown.", 14, Color(0.75, 0.8, 0.95)))
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _look_step() if not Game.look_options(creation).is_empty() else _race_step(), 20))
	nav.add_child(_button("Next: Name", func(): _name_step(), 20))


func _choice(title: String, values: Array, key: String, refresh: Callable) -> Control:
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	var l := _label(title, 18)
	l.custom_minimum_size = Vector2(130, 0)
	h.add_child(l)
	var ob := OptionButton.new()
	ob.add_theme_font_size_override("font_size", 18)
	for i in values.size():
		ob.add_item(values[i])
		if values[i] == creation.get(key, ""):
			ob.select(i)
	if not values.has(creation.get(key, "")):
		creation[key] = values[0]
	ob.item_selected.connect(_on_choice.bind(key, values, refresh))
	h.add_child(ob)
	return h


func _on_choice(i: int, key: String, values: Array, refresh: Callable) -> void:
	creation[key] = values[i]
	refresh.call()


func _name_step() -> void:
	var v := _clear_create()
	v.add_child(_label("What is your name?", 28, GOLD))
	var le := LineEdit.new()
	le.max_length = 15
	le.custom_minimum_size = Vector2(420, 52)
	le.add_theme_font_size_override("font_size", 24)
	le.placeholder_text = "Letters only, 2-15 characters"
	le.text = creation.get("name", "")
	v.add_child(le)
	var err := _label("", 16, Color(1, 0.5, 0.4))
	v.add_child(err)
	v.add_child(_label("%s · %s · %s" % [creation["race"], creation["alignment"], creation["hometown"]], 18, Color(0.75, 0.8, 0.95)))
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _background_step(), 20))
	_name_edit = le
	_name_err = err
	nav.add_child(_button("Start", _on_start, 22))


var _name_edit: LineEdit
var _name_err: Label


func _on_start() -> void:
	var n := _name_edit.text.strip_edges()
	var ok := n.length() >= 2
	for ch in n:
		if not (ch.to_lower() in "abcdefghijklmnopqrstuvwxyz "):
			ok = false
	if not ok:
		_name_err.text = "Only letters A-Z are allowed, 2-15 characters."
		return
	creation["name"] = n.substr(0, 1).to_upper() + n.substr(1)
	_begin(Game.new_player(creation))


func _on_buu(c: String, _i: int) -> void:
	if c == "Make Buu Demon":
		creation["race"] = "Buu Demon"
	_begin(Game.new_player(creation))
