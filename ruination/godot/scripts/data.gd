extends Node
## Game data converted from the original BYOND project (see ../tools).

const TILE := 32
const DIR_INDEX := {2: 0, 1: 1, 4: 2, 8: 3, 6: 4, 10: 5, 5: 6, 9: 7}
const DIR_DX := {1: 0, 2: 0, 4: 1, 8: -1, 5: 1, 9: -1, 6: 1, 10: -1}
const DIR_DY := {1: 1, 2: -1, 4: 0, 8: 0, 5: 1, 9: 1, 6: -1, 10: -1}

var icons := {}        # dmi name -> meta
var by_id := {}        # id -> meta
var types := {}        # type index (String) -> dict
var map := {}          # z info, tiles, entities
var mobs := {}         # mob type path -> dict
var rules := {}        # races, learn, techniques, forms
var grids := {}        # z -> PackedByteArray (uint16 LE)
var textures := {}     # id -> Texture2D
var tinted := {}


func _ready() -> void:
	icons = _json("res://data/icons.json")
	for k in icons:
		var m: Dictionary = icons[k]
		m["name"] = k
		by_id[int(m["id"])] = m
	types = _json("res://data/types.json")
	map = _json("res://data/map.json")
	mobs = _json("res://data/mobs.json")
	rules = _json("res://data/rules.json")


func _json(path: String) -> Variant:
	var txt := FileAccess.get_file_as_string(path)
	var v = JSON.parse_string(txt)
	if v == null:
		push_error("could not load " + path)
		return {}
	return v


func icon_id(name: String) -> int:
	if name == "":
		return -1
	var m = icons.get(name.to_lower())
	return int(m["id"]) if m != null else -1


func texture(id: int) -> Texture2D:
	if textures.has(id):
		return textures[id]
	var t: Texture2D = load("res://icons/%d.png" % id)
	textures[id] = t
	return t


## Frame lookup (BYOND semantics): movement ("M:") states, direction and animation.
## Returns [Texture2D, Rect2] or [] when the state does not exist.
func frame(id: int, state: String, dir: int, t_ms: float, moving: bool, flick_start := -1.0) -> Array:
	var meta = by_id.get(id)
	if meta == null:
		return []
	var S: Dictionary = meta["states"]
	var st = null
	var animate := true
	if moving and S.has("M:" + state):
		st = S["M:" + state]
	elif S.has(state):
		st = S[state]
	elif S.has("M:" + state):
		st = S["M:" + state]
		animate = moving
	elif S.has(""):
		st = S[""]
	elif S.has("M:"):
		st = S["M:"]
		animate = moving
	else:
		return []
	var dirs := int(st[0])
	var frames := int(st[1])
	var first := int(st[2])
	var delays: Array = st[3]
	var di := 0
	if dirs >= 4:
		di = DIR_INDEX.get(dir, 0)
		if di >= dirs:
			di = 2 if di == 4 or di == 6 else 3
	var f := 0
	if frames > 1 and animate:
		var total := 0.0
		for k in frames:
			total += float(delays[k]) if k < delays.size() else 1.0
		var tick := floorf((t_ms - flick_start) / 100.0) if flick_start >= 0 else floorf(t_ms / 100.0)
		if flick_start >= 0:
			tick = minf(tick, total - 1)
		tick = fmod(tick, total)
		while f < frames:
			tick -= float(delays[f]) if f < delays.size() else 1.0
			if tick < 0:
				break
			f += 1
		f = mini(f, frames - 1)
	var k := first + f * dirs + di
	var cols := int(meta.get("cols", 16))
	var w := float(meta["w"])
	var h := float(meta["h"])
	return [texture(id), Rect2((k % cols) * w, (k / cols) * h, w, h)]


func has_state(id: int, state: String) -> bool:
	var meta = by_id.get(id)
	return meta != null and (meta["states"].has(state) or meta["states"].has("M:" + state))


func flick_length(id: int, state: String) -> float:
	var meta = by_id.get(id)
	if meta == null:
		return 0.0
	var st = meta["states"].get(state, meta["states"].get("M:" + state))
	if st == null:
		return 0.0
	var total := 0.0
	for k in int(st[1]):
		total += float(st[3][k]) if k < st[3].size() else 1.0
	return total * 100.0


# ------------------------------------------------------------------ map
func zinfo(z: int) -> Dictionary:
	return map["z"].get(str(z), {"w": 500, "h": 500, "fill": 0})


func load_z(z: int) -> void:
	if grids.has(z):
		return
	var zi := zinfo(z)
	if zi.has("fill"):
		grids[z] = PackedByteArray()
		return
	grids[z] = FileAccess.get_file_as_bytes("res://data/z%d.bin" % z)


func tile(x: int, y: int, z: int) -> int:
	var zi := zinfo(z)
	var w := int(zi["w"])
	var h := int(zi["h"])
	if x < 1 or y < 1 or x > w or y > h:
		return -1
	var g: PackedByteArray = grids.get(z, PackedByteArray())
	if g.is_empty():
		return int(zi.get("fill", 0))
	return g.decode_u16(((h - y) * w + (x - 1)) * 2)


func turf_stack(x: int, y: int, z: int) -> Array:
	var t := tile(x, y, z)
	if t < 0:
		return []
	return map["tiles"][t]["t"]


func turf(x: int, y: int, z: int) -> Dictionary:
	var tt := turf_stack(x, y, z)
	if tt.is_empty():
		return {}
	return types[str(int(tt[tt.size() - 1]))]


func is_safe(x: int, y: int, z: int) -> bool:
	var t := tile(x, y, z)
	return t >= 0 and (int(map["tiles"][t]["f"]) & 1) != 0


func tech(key: String) -> Dictionary:
	return rules["techniques"].get(key, {})
