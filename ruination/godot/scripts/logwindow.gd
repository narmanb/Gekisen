extends Control
## Message window: a movable, resizable, minimisable box for the game log and the training
## stat ticks (the original sent those to a separate "output2" pane).
## Looks: "panel" (dark, see-through), "clear" (no background, stays) or "fade" (lines fade out).
## Tabs: All, Ticks, Combat, Gains (what you've gained this session).

const PREFS := "user://ui_prefs.json"
const MAX_ENTRIES := 300
const MIN_SIZE := Vector2(260, 120)

var entries: Array = []          # [text, color, cat, msec]
var tab := "all"
var look := "panel"
var minimized := false
var header: PanelContainer
var title: Label
var body: RichTextLabel
var grip: Control
var tab_buttons := {}
var look_button: Button
var min_button: Button
var bg: StyleBoxFlat
var dirty := true
var drag_from := Vector2.ZERO
var dragging := false
var resizing := false
var full_size := Vector2(540, 210)
var font: Font


func _ready() -> void:
	font = ThemeDB.fallback_font
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	header = PanelContainer.new()
	var hs := StyleBoxFlat.new()
	hs.bg_color = Color(0.1, 0.12, 0.2, 0.85)
	hs.set_corner_radius_all(6)
	hs.content_margin_left = 6
	hs.content_margin_right = 4
	header.add_theme_stylebox_override("panel", hs)
	header.mouse_filter = Control.MOUSE_FILTER_STOP
	header.gui_input.connect(_on_header_input)
	add_child(header)
	var h := HBoxContainer.new()
	h.add_theme_constant_override("separation", 3)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	header.add_child(h)
	title = Label.new()
	title.text = "≡ Messages"
	title.add_theme_font_size_override("font_size", 13)
	title.add_theme_color_override("font_color", Color(1, 0.85, 0.4))
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(title)
	for t in [["all", "All"], ["tick", "Ticks"], ["combat", "Combat"], ["gains", "Gains"]]:
		var b := _small(t[1], _set_tab.bind(t[0]))
		tab_buttons[t[0]] = b
		h.add_child(b)
	look_button = _small("◐", _cycle_look)
	look_button.tooltip_text = "Panel / Clear / Fading"
	h.add_child(look_button)
	min_button = _small("–", _toggle_min)
	h.add_child(min_button)
	bg = StyleBoxFlat.new()
	bg.bg_color = Color(0, 0, 0, 0.5)
	bg.set_corner_radius_all(6)
	bg.content_margin_left = 8
	bg.content_margin_right = 8
	bg.content_margin_top = 4
	body = RichTextLabel.new()
	body.bbcode_enabled = true
	body.scroll_active = true
	body.scroll_following = true
	body.selection_enabled = false
	body.add_theme_font_size_override("normal_font_size", 14)
	body.add_theme_font_size_override("bold_font_size", 14)
	body.add_theme_constant_override("outline_size", 4)
	body.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.9))
	body.mouse_filter = Control.MOUSE_FILTER_PASS
	add_child(body)
	grip = Control.new()
	grip.custom_minimum_size = Vector2(26, 26)
	grip.size = Vector2(26, 26)
	grip.mouse_filter = Control.MOUSE_FILTER_STOP
	grip.gui_input.connect(_on_grip_input)
	grip.draw.connect(_draw_grip)
	add_child(grip)
	_load()
	_layout()


func _small(text: String, cb: Callable) -> Button:
	var b := Button.new()
	b.text = text
	b.add_theme_font_size_override("font_size", 12)
	b.custom_minimum_size = Vector2(28, 24)
	b.focus_mode = Control.FOCUS_NONE
	b.pressed.connect(cb)
	return b


func add_entry(text: String, col: Color, cat: String) -> void:
	entries.append([text, col, cat, Time.get_ticks_msec()])
	if entries.size() > MAX_ENTRIES:
		entries.pop_front()
	dirty = true


func _process(_d: float) -> void:
	if tab == "gains" and Engine.get_process_frames() % 30 == 0:
		dirty = true
	if look == "fade" and Engine.get_process_frames() % 15 == 0:
		dirty = true
	if dirty and not minimized:
		dirty = false
		_render()


func _render() -> void:
	if tab == "gains":
		body.text = Game.session_report()
		return
	var now := Time.get_ticks_msec()
	var lines: Array = []
	for e in entries:
		if tab != "all" and e[2] != tab:
			continue
		if look == "fade" and now - int(e[3]) > 10000:
			continue
		lines.append("[color=#%s]%s[/color]" % [(e[1] as Color).to_html(false), str(e[0]).replace("[", "[lb]")])
	if look == "fade":
		lines = lines.slice(maxi(0, lines.size() - 6))
	body.text = "\n".join(lines)


func _set_tab(t: String) -> void:
	tab = t
	dirty = true
	_layout()
	_save()


func _cycle_look() -> void:
	look = {"panel": "clear", "clear": "fade", "fade": "panel"}[look]
	dirty = true
	_layout()
	_save()
	Game.msg("Message window: %s." % {"panel": "dark panel", "clear": "clear (no background)", "fade": "fading overlay"}[look], Color(0.7, 0.8, 1))


func set_look(l: String) -> void:
	look = l
	dirty = true
	_layout()
	_save()


func _toggle_min() -> void:
	minimized = not minimized
	dirty = true
	_layout()
	_save()


func reset_layout() -> void:
	position = Vector2(10, 250)
	full_size = Vector2(540, 210)
	minimized = false
	look = "panel"
	tab = "all"
	dirty = true
	_layout()
	_save()


func _layout() -> void:
	var vs := get_viewport_rect().size
	full_size = Vector2(clampf(full_size.x, MIN_SIZE.x, vs.x - 20), clampf(full_size.y, MIN_SIZE.y, vs.y - 60))
	size = Vector2(full_size.x, 30 if minimized else full_size.y)
	position = Vector2(clampf(position.x, 0, maxf(0, vs.x - size.x)), clampf(position.y, 0, maxf(0, vs.y - 30)))
	header.position = Vector2.ZERO
	header.size = Vector2(full_size.x, 30)
	header.custom_minimum_size = Vector2(full_size.x, 30)
	body.visible = not minimized
	grip.visible = not minimized
	body.position = Vector2(0, 32)
	body.size = Vector2(full_size.x, full_size.y - 32)
	grip.position = full_size - Vector2(26, 26)
	body.add_theme_stylebox_override("normal", bg if look == "panel" else StyleBoxEmpty.new())
	header.modulate.a = 1.0 if look == "panel" or minimized else 0.55
	min_button.text = "□" if minimized else "–"
	for k in tab_buttons:
		tab_buttons[k].modulate = Color(1, 0.9, 0.5) if k == tab else Color(1, 1, 1)
	grip.queue_redraw()


func _draw_grip() -> void:
	var c := Color(1, 1, 1, 0.5 if look == "panel" else 0.3)
	for i in 3:
		var o := 8.0 + i * 6.0
		grip.draw_line(Vector2(26, o), Vector2(o, 26), c, 2)


func _on_header_input(e: InputEvent) -> void:
	if e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_LEFT:
		dragging = e.pressed
		drag_from = e.global_position - position
		if not e.pressed:
			_save()
		accept_event()
	elif e is InputEventMouseMotion and dragging:
		position = e.global_position - drag_from
		_layout()
		accept_event()


func _on_grip_input(e: InputEvent) -> void:
	if e is InputEventMouseButton and e.button_index == MOUSE_BUTTON_LEFT:
		resizing = e.pressed
		if not e.pressed:
			_save()
		accept_event()
	elif e is InputEventMouseMotion and resizing:
		full_size = e.global_position - position
		_layout()
		accept_event()


func contains(p: Vector2) -> bool:
	return visible and Rect2(global_position, size).has_point(p)


func _save() -> void:
	var f := FileAccess.open(PREFS, FileAccess.WRITE)
	if f:
		var d := _prefs()
		d["log"] = {"x": position.x, "y": position.y, "w": full_size.x, "h": full_size.y, "look": look, "min": minimized, "tab": tab}
		f.store_string(JSON.stringify(d))


func _prefs() -> Dictionary:
	if not FileAccess.file_exists(PREFS):
		return {}
	var v = JSON.parse_string(FileAccess.get_file_as_string(PREFS))
	return v if v is Dictionary else {}


func _load() -> void:
	var d: Dictionary = _prefs().get("log", {})
	position = Vector2(float(d.get("x", 10)), float(d.get("y", 250)))
	full_size = Vector2(float(d.get("w", 540)), float(d.get("h", 210)))
	look = str(d.get("look", "panel"))
	minimized = bool(d.get("min", false))
	tab = str(d.get("tab", "all"))
