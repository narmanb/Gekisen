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
	for b in [["pl", "Powerlevel", Color(0.9, 0.25, 0.25)], ["ki", "Ki", Color(0.25, 0.5, 0.95)],
			["stam", "Fatigue", Color(0.85, 0.6, 0.15)], ["exp", "Exp", Color(0.6, 0.35, 0.9)]]:
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
	tr.position = Vector2(-330, 10)
	tr.custom_minimum_size = Vector2(320, 56)
	tr.alignment = BoxContainer.ALIGNMENT_END
	tr.add_theme_constant_override("separation", 8)
	hud.add_child(tr)
	tr.add_child(_button("Skills", func(): toggle_book(), 18))
	tr.add_child(_button("Stats", func(): toggle_stats(), 18))
	tr.add_child(_button("Menu", func(): menu_panel.visible = not menu_panel.visible, 18))
	assign_hint = _label("", 20, GOLD)
	assign_hint.set_anchors_and_offsets_preset(Control.PRESET_CENTER_BOTTOM)
	assign_hint.position.y -= 150
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
	hud_labels["name"].text = "%s  (%s %s)" % [P["name"], P["gene"], P["race"]]
	var f := Game.current_form()
	var busy_txt: String = {"selftrain": " · training", "meditate": " · meditating", "rest": " · resting", "power": " · powering up"}.get(Game.busy, "")
	hud_labels["level"].text = "Level %s · %s Mode%s%s" % [Game.fmt(P["level"]), P["mode"], " · Form %d" % P["form"] if not f.is_empty() else "", busy_txt]
	_set_bar("pl", P["powerlevel"], Game.cap("powerlevel"))
	_set_bar("ki", P["ki"], Game.cap("ki"))
	_set_bar("stam", P["stam"], P["stam_max"])
	_set_bar("exp", P["exp"], P["tnl"])
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
			elif info.has("tech") and Game.tech_cost(Data.tech(info["tech"])) > float(Game.P["ki"]):
				draw_rect(r, Color(0.1, 0.1, 0.3, 0.55))
			if (id == "selftrain" and Game.busy == "selftrain") or (id == "meditate" and Game.busy == "meditate") or (id == "rest" and Game.busy == "rest"):
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
	hotbar.position = Vector2(-w / 2.0 + 40, -84)
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
	attack_btn.position = Vector2(-140, -140)
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
	stick.position = Vector2(24, -214)
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
	book.position = Vector2(-380, -280)
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
	var nxt := ""
	for e in Data.rules["learn"]:
		if (not e.has("race") or e["race"] == Game.P["race"]) and (not e.has("gene") or e["gene"] == Game.P["gene"]) \
				and not e.has("req") and int(e["level"]) > int(Game.P["level"]) and not e["tech"] in Game.P["learned"]:
			if nxt == "" or int(e["level"]) < int(nxt.get_slice("|", 0)):
				nxt = "%d|%s" % [int(e["level"]), Data.tech(e["tech"]).get("name", e["tech"])]
	if nxt != "":
		var l := _label("Next technique: %s at level %s" % [nxt.get_slice("|", 1), Game.fmt(int(nxt.get_slice("|", 0)))], 14, Color(0.7, 0.8, 1))
		book_grid.add_child(l)


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
	stats_panel.position = Vector2(-350, -280)
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
	stats_label.custom_minimum_size = Vector2(660, 400)
	stats_label.add_theme_font_size_override("normal_font_size", 16)
	v.add_child(stats_label)


func toggle_stats() -> void:
	stats_panel.visible = not stats_panel.visible
	if stats_panel.visible:
		book.visible = false
		_refresh_stats()


func _refresh_stats() -> void:
	var P := Game.P
	var f := Game.fmt
	var s := "[b]%s[/b] — %s %s (%s)\n" % [P["name"], P["gene"], P["race"], P["gender"]]
	s += "Level %s (%s Mode) · Exp %s / %s\n" % [f.call(P["level"]), P["mode"], f.call(P["exp"]), f.call(P["tnl"])]
	s += "Powerlevel %s / %s   (max %s)\n" % [f.call(P["powerlevel"]), f.call(Game.cap("powerlevel")), f.call(Game.pl_max())]
	s += "Ki %s / %s   (max %s)\n" % [f.call(P["ki"]), f.call(Game.cap("ki")), f.call(P["ki_max"])]
	s += "Strength %s (max %s) · Defence %s (max %s)\n" % [f.call(Game.cap("strength")), f.call(P["strength_max"]), f.call(Game.cap("defence")), f.call(P["defence_max"])]
	s += "Multipliers: Power %s · Ki %s · Str %s · Def %s\n" % [P["power_multi"], P["ki_multi"], P["strength_multi"], P["defence_multi"]]
	s += "Fatigue %s / %s · Zenni %s · Kills %s\n" % [f.call(P["stam"]), f.call(P["stam_max"]), f.call(P["zenni"]), P["kills"]]
	s += "Training focus: %s · Meditation: %s\n\n[b]Skills[/b]\n" % [P["focus"], Game.SKILL_NAMES[P["med_focus"]]]
	var col := 0
	for k in Game.SKILLS:
		var sk: Array = P["skills"][k]
		s += "%-14s %3d  " % [Game.SKILL_NAMES[k], int(sk[0])]
		col += 1
		if col % 3 == 0:
			s += "\n"
	s += "\n\n[b]Transformations[/b] (%s gene)\n" % P["gene"]
	var i := 0
	for fm in Game.forms_for():
		i += 1
		s += "Form %d — level %s, power x%s%s\n" % [i, f.call(fm["level"]), str(fm["pl"]), "  [color=yellow](current)[/color]" if int(P["form"]) == i else ""]
	var mins := int(float(P["playtime"]) / 60.0)
	s += "\nPlay time %dh %dm" % [mins / 60, mins % 60]
	stats_label.text = s


# =================================================================== menu
func _build_menu() -> void:
	menu_panel = PanelContainer.new()
	menu_panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	menu_panel.custom_minimum_size = Vector2(380, 0)
	menu_panel.position = Vector2(-190, -200)
	menu_panel.visible = false
	root.add_child(menu_panel)
	var v := VBoxContainer.new()
	v.add_theme_constant_override("separation", 8)
	menu_panel.add_child(v)
	v.add_child(_label("Menu", 22, GOLD))
	v.add_child(_button("Training Focus", func(): menu_panel.visible = false; Game.choose_focus()))
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
	dialog_panel.position = Vector2(-260, -240)
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
	v.position = Vector2(-300, -220)
	v.custom_minimum_size = Vector2(600, 0)
	v.add_theme_constant_override("separation", 14)
	title_root.add_child(v)
	var t1 := _label("DRAGONBALL", 40, Color(1, 0.85, 0.4))
	t1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(t1)
	var t2 := _label("RUINATION", 72, Color(1, 0.55, 0.1))
	t2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	t2.add_theme_constant_override("outline_size", 10)
	t2.add_theme_color_override("font_outline_color", Color(0.45, 0.1, 0))
	v.add_child(t2)
	var t3 := _label("single-player edition", 18, Color(0.6, 0.62, 0.75))
	t3.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(t3)
	var save := Game.load_save()
	if not save.is_empty():
		v.add_child(_button("Continue  (%s, level %s %s)" % [save.get("name", "?"), Game.fmt(save.get("level", 1)), save.get("race", "")], func(): _begin(save), 22))
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
	creation = {"race": "Saiyan", "gene": "", "gender": "Male", "skin": "Tan", "hair": "Goku", "name": ""}
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


func _race_step() -> void:
	var v := _clear_create()
	v.add_child(_label("Choose your race", 28, GOLD))
	var h := HBoxContainer.new()
	h.size_flags_vertical = Control.SIZE_EXPAND_FILL
	h.add_theme_constant_override("separation", 16)
	v.add_child(h)
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(720, 0)
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	h.add_child(sc)
	var grid := GridContainer.new()
	grid.columns = 4
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	sc.add_child(grid)
	var right := VBoxContainer.new()
	right.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(right)
	var preview := SpriteView.new()
	preview.custom_minimum_size = Vector2(200, 200)
	right.add_child(preview)
	var info := _label("", 15)
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size = Vector2(380, 0)
	right.add_child(info)
	var select := func(r: String):
		creation["race"] = r
		var rd: Dictionary = Data.rules["races"][r]
		creation["gene"] = rd["genes"][0]
		preview.mob = _preview_mob()
		var m: Dictionary = rd["multi"]
		var techs: Array = []
		for e in Data.rules["learn"]:
			if e.get("race", "") == r and not e.has("gene"):
				techs.append("%s (%s)" % [Data.tech(e["tech"]).get("name", e["tech"]), Game.fmt(e["level"])])
		var sk: Dictionary = rd["skills"]
		var sks: Array = []
		for k in sk:
			if not k.ends_with("_max"):
				sks.append("%s %d" % [Game.SKILL_NAMES.get(k, k), int(sk[k])])
		info.text = "%s\nPower x%s · Ki x%s · Strength x%s · Defence x%s\nGenes: %s\nStarting skills: %s\nRace techniques: %s" % [
			r, m.get("power", 4), m.get("ki", 4), m.get("strength", 4), m.get("defence", 4),
			", ".join(rd["genes"]), ", ".join(sks), ", ".join(techs) if not techs.is_empty() else "shared techniques"]
	for r in Data.rules["races"]:
		var b := Button.new()
		b.text = r
		b.custom_minimum_size = Vector2(170, 64)
		b.clip_text = true
		var icon_id := Game.base_icon({"race": r, "gender": "Male", "skin": "Tan"})
		var fr := Data.frame(icon_id, "", 2, 0, false)
		if not fr.is_empty():
			var at := AtlasTexture.new()
			at.atlas = fr[0]
			at.region = Rect2(fr[1].position + Vector2(0, fr[1].size.y - 32), Vector2(32, 32))
			b.icon = at
		b.pressed.connect(func(): select.call(r))
		grid.add_child(b)
	select.call(creation["race"])
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): create_root.queue_free(); create_root = null; show_title(), 20))
	nav.add_child(_button("Next: Gene", func(): _gene_step(), 20))


func _preview_mob() -> Mob:
	var m := Mob.new()
	m.dir = 2
	Game.build_appearance(creation, m)
	return m


func _gene_step() -> void:
	var v := _clear_create()
	var r: String = creation["race"]
	var rd: Dictionary = Data.rules["races"][r]
	v.add_child(_label("Choose your %s gene" % r, 28, GOLD))
	var info := _label("", 16)
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	for g in rd["genes"]:
		var gm: Dictionary = rd.get("gene_multi", {}).get(g, {})
		var bonus: Array = []
		for k in gm:
			bonus.append("%s +%s" % [k, gm[k]])
		var p := {"race": r, "gene": g}
		var fl := Game.forms_for(p)
		var lv: Array = []
		for f in fl:
			lv.append(Game.fmt(f["level"]))
		var gtech: Array = []
		for e in Data.rules["learn"]:
			if e.get("gene", "") == g and (e.get("race", r) == r):
				gtech.append(Data.tech(e["tech"]).get("name", e["tech"]))
		var txt := "%s — %d forms (levels %s)%s%s" % [g, fl.size(), ", ".join(lv),
			"; bonus " + ", ".join(bonus) if not bonus.is_empty() else "",
			"; techniques: " + ", ".join(gtech) if not gtech.is_empty() else ""]
		var b := _button(txt, _pick_gene.bind(g), 16)
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		v.add_child(b)
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _race_step(), 20))


func _pick_gene(g: String) -> void:
	creation["gene"] = g
	var rd: Dictionary = Data.rules["races"][creation["race"]]
	if rd.get("custom", false) or creation["race"] in ["Bio Android", "Feline"]:
		_look_step()
	else:
		_name_step()


func _look_step() -> void:
	var v := _clear_create()
	var r: String = creation["race"]
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
	var rot := _button("Rotate", func(): preview.mob.dir = {2: 4, 4: 1, 1: 8, 8: 2}[preview.mob.dir])
	if r == "Bio Android":
		opts.add_child(_choice("Colour", ["Green", "Blue"], "skin", refresh))
	elif r == "Feline":
		opts.add_child(_label("Your appearance depends on your gene.", 16))
	else:
		opts.add_child(_choice("Gender", ["Male", "Female"], "gender", refresh))
		opts.add_child(_choice("Skin", ["Tan", "White", "Dark"], "skin", refresh))
		opts.add_child(_choice("Hair", Game.HAIRS.keys(), "hair", refresh))
	opts.add_child(rot)
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _gene_step(), 20))
	nav.add_child(_button("Next: Name", func(): _name_step(), 20))


func _choice(title: String, values: Array, key: String, refresh: Callable) -> Control:
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	var l := _label(title, 18)
	l.custom_minimum_size = Vector2(90, 0)
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
	v.add_child(_label("What's your name?", 28, GOLD))
	var le := LineEdit.new()
	le.max_length = 15
	le.custom_minimum_size = Vector2(420, 52)
	le.add_theme_font_size_override("font_size", 24)
	le.placeholder_text = "Letters only, 2-15 characters"
	le.text = creation.get("name", "")
	v.add_child(le)
	var err := _label("", 16, Color(1, 0.5, 0.4))
	v.add_child(err)
	v.add_child(_label("%s · %s gene" % [creation["race"], creation["gene"]], 18, Color(0.75, 0.8, 0.95)))
	var nav := HBoxContainer.new()
	nav.alignment = BoxContainer.ALIGNMENT_END
	nav.add_theme_constant_override("separation", 12)
	v.add_child(nav)
	nav.add_child(_button("Back", func(): _gene_step(), 20))
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
