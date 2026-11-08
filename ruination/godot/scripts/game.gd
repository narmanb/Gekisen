extends Node
## Gameplay rules ported from Dragonball Ruination's DM code.
## (AttackNormal, Monster AI Attack2, ProjectilesJustin dmg, Self Train, Meditate_Gain,
##  Rest_Gain, Level_Up, Exp_Check, Skill_Gain, transformations.)

signal log_msg(text: String, color: Color, cat: String)
signal dialog(title: String, text: String, options: Array, cb: Callable)

const SAVE_PATH := "user://ruination_save.json"
const SPAWN := Vector3i(395, 252, 7)
const SKILLS := ["melee", "block", "dodge", "counter", "critical", "durability", "ki_control",
	"ki_cast", "ki_power", "ki_use", "ki_res", "reflect", "weapon"]
const SKILL_NAMES := {"melee": "Melee", "block": "Block", "dodge": "Dodge", "counter": "Counter",
	"critical": "Critical", "durability": "Durability", "ki_control": "Ki Control", "ki_cast": "Ki Cast",
	"ki_power": "Ki Power", "ki_use": "Ki Use", "ki_res": "Ki Resistance", "reflect": "Reflect", "weapon": "Weapon"}
const FOCUS := ["Strength", "Defense", "Ki", "Powerlevel", "Exp"]
const PK_LEVEL := 2000
const BASE_ACTIONS := ["attack", "talk", "selftrain", "meditate", "rest", "transform", "revert", "focus"]
## Techniques that are actions rather than attacks: they live in the action panel, not on the hotbar by default.
const UTILITY_KINDS := ["utility"]
const HOTBAR_VERSION := 3
const HOTBAR_SLOTS := 27          # 3 pages of 9 (the dragon hotbar has 9 slots)
const ZNAMES := {1: "Earth", 2: "Namek", 3: "Planet Vegeta", 4: "Realm of the Gods", 5: "Buildings",
	6: "The Lookout", 7: "Other World", 8: "Dr. Gero's Lab", 9: "Whis' Planet", 10: "Beerus' Planet",
	11: "Space", 12: "Space"}
const HAIRS := {"Bald": "", "Goku": "hair - goku.dmi", "Vegeta": "hair - vegeta.dmi",
	"Teen Gohan": "hair - teen gohan.dmi", "Adult Gohan": "hair - adult gohan.dmi",
	"Future Gohan": "hair - future gohan.dmi", "Hercule": "hair - hercule.dmi", "Raditz": "hair - raditz.dmi",
	"Trunks Long": "hair - trunks long.dmi", "Female Long": "hair_femalelong.dmi",
	"Female Ponytail": "hairfemaleponytail.dmi"}
const MODES := [[1000, 0.1, "Super Easy"], [2000, 0.1, "Easy"], [3500, 0.25, "Medium"], [5000, 0.5, "Hard"],
	[7500, 1.0, "Hardcore"], [10000, 1.5, "Expert"], [13500, 2.0, "Sensei"], [18000, 3.0, "Master"],
	[25000, 4.0, "Grandmaster"], [35000, 5.0, "Legendary"], [50000, 6.0, "Mythical"], [75000, 8.0, "Godly"]]

var now := 0.0
var world: Node2D
var P := {}                 # player save data
var pe: Mob                 # player entity
var monsters := {}
var projectiles: Array = []
var busy := ""              # selftrain | meditate | rest | power
var busy_next := 0.0
var cooldowns := {}
var buffs := {}             # stat -> {mult, until}
var toggles := {}           # aura / kaioken / shield
var move_dir := 0
var last_tick := 0.0
var last_save := 0.0
var last_melee := 0.0
var last_hurt := 0.0
var timers: Array = []
var traveling := false
var running := false
var session := {}           # baseline for the Gains tab
var grav := 0.0             # active gravity machine strength (0 = off)
var grav_machine: Mob = null
var grav_next := 0.0
var gravtrain := 0.0        # training bonus from the last gravity pull (original M.gravtrain)


func _process(_d: float) -> void:
	now = float(Time.get_ticks_msec())
	if not running or pe == null:
		return
	if not timers.is_empty():
		var due := timers.filter(func(t): return t[0] <= now)
		timers = timers.filter(func(t): return t[0] > now)
		for t in due:
			t[1].call()
	if move_dir != 0 and not pe.mid_step(now) and not traveling:
		try_step(move_dir)
	for m in monsters.keys():
		if m.z == pe.z and not m.dead and now >= m.next_think:
			think(m)
	update_projectiles()
	if grav > 0.0 and now >= grav_next:
		gravity_pull()
	if busy != "" and now >= busy_next:
		busy_tick()
	if now - last_tick >= 1000.0:
		second_tick()
		last_tick = now
	if now - last_save > 30000.0:
		save()
		last_save = now


func after(ms: float, f: Callable) -> void:
	timers.append([now + ms, f])


func msg(t: String, c := Color.WHITE, cat := "general") -> void:
	log_msg.emit(t, c, cat)


## Stat ticks, like the original's "output2" pane: white normally, red when boosted.
func tick(t: String, boosted := false) -> void:
	log_msg.emit(t, Color(1, 0.4, 0.35) if boosted else Color(0.92, 0.92, 0.95), "tick")


func ask(title: String, text: String, opts: Array, cb: Callable) -> void:
	dialog.emit(title, text, opts, cb)


static func fmt(n: float) -> String:
	if absf(n) >= 1.0e15:
		return "%.3e" % n
	var neg := n < 0
	var s := str(int(absf(roundf(n))))
	var out := ""
	var c := 0
	for i in range(s.length() - 1, -1, -1):
		out = s[i] + out
		c += 1
		if c % 3 == 0 and i > 0:
			out = "," + out
	return ("-" if neg else "") + out


func zname(z: int) -> String:
	return ZNAMES.get(z, "Area %d" % z)


# =================================================================== spawning
func spawn_from_map(ti: int, x: int, y: int, z: int) -> void:
	var t: Dictionary = Data.types[str(ti)]
	var p: String = t["path"]
	if p.begins_with("/mob/Monster/"):
		spawn_monster(p, x, y, z, t)
		return
	var m := Mob.new()
	m.x = x
	m.y = y
	m.z = z
	m.from_x = x
	m.from_y = y
	m.icon = int(t.get("icon", -1))
	m.state = t.get("state", "")
	m.dir = int(t.get("dir", 2))
	m.name = t.get("name", "")
	m.dense = int(t.get("dense", 0)) == 1
	m.layer = float(t.get("layer", 4.0 if p.begins_with("/mob") else 3.0))
	m.pixel_x = t.get("pixel_x", 0)
	m.pixel_y = t.get("pixel_y", 0)
	m.invisible = t.has("invis")
	m.path = p
	m.kind = "npc" if p.begins_with("/mob") else "obj"
	m.gravity = int(t.get("gravity", 0))
	if p.begins_with("/mob/Gravity_Room"):
		if m.gravity > 0:
			m.name = "Gravity Machine %dx" % m.gravity
		else:
			m.kind = "obj"      # the other pieces of the machine sprite
	if m.icon < 0:
		m.dense = false
	world.add(m)


func spawn_monster(p: String, x: int, y: int, z: int, t := {}) -> Mob:
	var d: Dictionary = Data.mobs.get(p, {})
	var m := Mob.new()
	m.x = x
	m.y = y
	m.z = z
	m.from_x = x
	m.from_y = y
	m.icon = int(t.get("icon", d.get("icon", -1)))
	m.state = t.get("state", d.get("state", ""))
	m.name = d.get("name", p.get_file().replace("_", " "))
	m.kind = "monster"
	m.path = p
	m.layer = 4.0
	m.level = _num(d.get("level", 1))
	m.powerlevel_max = maxf(1.0, _num(d.get("powerlevel_max", d.get("powerlevel", 10))))
	m.powerlevel = m.powerlevel_max
	m.strength = maxf(1.0, _num(d.get("strength", 1)))
	m.defence = maxf(0.0, _num(d.get("defence", 1)))
	m.durability = _num(d.get("durability", 100))
	m.kidefense = _num(d.get("kidefense", 2))
	m.ki_res = _num(d.get("ki_res", 10))
	m.dodge = _num(d.get("dodge", 0))
	m.block = _num(d.get("block", 0))
	m.exp_reward = _num(d.get("exp", 0))
	m.zenni_reward = _num(d.get("zenni", 0))
	m.race = str(d.get("race", ""))
	m.home = Vector3i(x, y, z)
	m.aggro = not p.begins_with("/mob/Monster/Peaceful")
	m.respawn = true
	m.next_think = now + randf_range(300, 1500)
	world.add(m)
	monsters[m] = true
	return m


func _num(v) -> float:
	if v is float or v is int:
		return float(v)
	if v is String:
		var s: String = v.strip_edges()
		if s.is_valid_float():
			return s.to_float()
		var e := Expression.new()       # values like "1000000000 * 23000"
		if e.parse(s.replace(" ", "")) == OK:
			var r = e.execute()
			if r is float or r is int:
				return float(r)
	return 0.0


# =================================================================== player
func new_player(o: Dictionary) -> Dictionary:
	var rd: Dictionary = Data.rules["races"][o["race"]]
	var p := {
		"name": o.get("name", "Fighter"), "race": o["race"], "gene": o.get("gene", ""),
		"gender": o.get("gender", "Male"), "skin": o.get("skin", "Tan"), "hair": o.get("hair", "Goku"),
		"variant": o.get("variant", ""),
		"level": 1, "exp": 0.0, "tnl": 20.0, "expup": 0.0, "moden": 1, "mode": "Beginner", "modes": 0,
		"zenni": 500.0, "tp": 0.0,
		"pl_bonus": 0.0, "powerlevel": 300.0, "ki": 300.0, "ki_max": 300.0,
		"strength_max": 250.0, "defence_max": 250.0, "stam": 0.0, "stam_max": 1000.0,
		"power_multi": 4.0, "ki_multi": 4.0, "strength_multi": 4.0, "defence_multi": 4.0,
		"skills": {}, "learned": [], "hotbar": [], "form": 0, "focus": "Strength", "med_focus": "ki_control",
		"x": SPAWN.x + randi_range(-4, 4), "y": SPAWN.y + randi_range(-6, 6), "z": SPAWN.z, "dir": 2,
		"kills": 0, "playtime": 0.0,
	}
	var mul: Dictionary = rd.get("multi", {})
	for k in ["power", "ki", "strength", "defence"]:
		p[k + "_multi"] = float(mul.get(k, 4))
	var gm: Dictionary = rd.get("gene_multi", {}).get(p["gene"], {})
	for k in gm:
		p[k + "_multi"] += float(gm[k])
	for s in SKILLS:
		p["skills"][s] = [10.0, 0.0, 75.0]       # value, exp, tnl
	var rs: Dictionary = rd.get("skills", {})
	for s in rs:
		if p["skills"].has(s):
			p["skills"][s][0] = float(rs[s])
	p["hotbar"] = ["t:KiBlast"]
	p["hotbar_v"] = HOTBAR_VERSION
	return p


# Appearance rules from New Login Crim.dm (Choose_Base, CreateChar, ApplyIconHair) and
# Powerlevel_Birth.dm (the *_Multi procs that swap the icon for some genes).
# Only these races use the human base with a skin and hair choice:
const HUMAN_BASE := ["Human", "Saiyan", "Half Saiyan", "Android"]
const GENE_ICONS := {
	"Changeling": {"Vindictive": "cooler - form.dmi", "Regalis": "kc-form-1.dmi"},
	"Kai": {"Zealot": "zealotkai.dmi"},
	"Demon": {"Vile": "demon - janemba.dmi", "Fomhoire": "demon - form 4.dmi"},
	"Tuffle": {"Venerable": "universe 2 tuffle - form 1.dmi"},
	"Alien": {"Hitman": "hit.dmi", "Pride Trooper": "jiren.dmi", "Yardrat": "yardratbase.dmi",
		"Moro": "moro base.dmi", "Kamenian": "kamenian.dmi", "Rebrianne": "rebrianne1.dmi"},
}
const GENE_OVERLAYS := {"Hitman": "hit armour.dmi", "Pride Trooper": "pride trooper.dmi"}
const DEMON_HAIR := {"Goku": "hair_-_goku_super_saiyan_-_ruination_dt.dmi", "Hercule": "hair_-_hercule_ssj_dt.dmi",
	"Adult Gohan": "hair - adult gohan dt.dmi", "Teen Gohan": "banto_kid_gohan_hair_dt.dmi",
	"Future Gohan": "hair - adult gohan dt.dmi", "Vegeta": "hair_-_vegeta_super_saiyan_-_ruination_dt.dmi",
	"Trunks Long": "hair_-_trunks_long_dt.dmi", "Raditz": "hair_-_raditz_ssj_rose_dt.dmi",
	"Female Long": "hair_femalelongssj_dt.dmi", "Female Ponytail": "hairfemaleponytail_ssj_dt.dmi"}
const LYCANTHROPES := ["Basil", "Bergamo", "Lavender"]


## Which appearance choices a race/gene has, as [title, key, values].
func look_options(p: Dictionary) -> Array:
	var r: String = p["race"]
	var g: String = p.get("gene", "")
	if r in HUMAN_BASE:
		return [["Gender", "gender", ["Male", "Female"]], ["Skin", "skin", ["Tan", "White", "Dark"]],
			["Hair", "hair", HAIRS.keys()]]
	if r == "Bio Android":
		return [["Colour", "skin", ["Green", "Blue"]]]
	if r == "Feline":
		return [["Type", "skin", ["Destructive", "Chaotic"]]]
	if r == "Alien" and g == "Lycanthrope":
		return [["Lycanthrope", "variant", LYCANTHROPES]]
	if r == "Demon" and g == "Fomhoire":
		var hs: Array = HAIRS.keys()
		hs.erase("Bald")
		return [["Hair (3rd form)", "hair", hs]]
	return []


## Form sprite; a few depend on skin or gender (HumanTransRoshi, Android21Trans).
func form_icon(p: Dictionary, f: Dictionary) -> String:
	if f.is_empty():
		return ""
	var n := int(f.get("form", 1))
	var sk: String = {"Tan": "tan", "White": "white", "Dark": "dark"}.get(p.get("skin", "Tan"), "tan")
	if p["race"] == "Human" and p.get("gene", "") == "Roshi":
		return "roshi_trans %s.dmi" % sk if n == 1 else "male roshi false ui- %s.dmi" % sk
	if p["race"] == "Android" and p.get("gene", "") == "Gluttonous" and p.get("gender", "Male") != "Female":
		return "male - android 21 trans.dmi" if n == 1 else "a21malegood2.dmi"
	return f.get("icon", "")


func has_hair(p: Dictionary) -> bool:
	return p["race"] in HUMAN_BASE


func base_icon(p: Dictionary) -> int:
	var r: String = p["race"]
	var g: String = p.get("gene", "")
	var rd: Dictionary = Data.rules["races"][r]
	var icons: Array = rd.get("icons", [])
	if r in HUMAN_BASE:
		var female: bool = p.get("gender", "Male") == "Female"
		var sk: String = {"Tan": "tan", "White": "white", "Dark": "dark"}.get(p.get("skin", "Tan"), "tan")
		if r == "Android" and g == "Gluttonous":
			if female:
				return Data.icon_id("android 21 female - %s.dmi" % sk)
			return Data.icon_id({"tan": "male - android 21 tan.dmi", "white": "male - android 21.dmi", "dark": "male - android 21 dark.dmi"}[sk])
		if r == "Human" and g == "Roshi":
			return Data.icon_id("male roshi - %s.dmi" % sk)
		return Data.icon_id("%s - %s.dmi" % ["female" if female else "male", sk])
	if r == "Bio Android" and p.get("skin", "") == "Blue" and icons.size() > 1:
		return Data.icon_id(icons[1])
	if r == "Feline":
		return Data.icon_id("beeruschaotic.dmi" if p.get("skin", "") == "Chaotic" else "beerus.dmi")
	if r == "Alien" and g == "Lycanthrope":
		var v: String = p.get("variant", "")
		return Data.icon_id((v if v in LYCANTHROPES else "Basil").to_lower() + ".dmi")
	var gi: String = GENE_ICONS.get(r, {}).get(g, "")
	if gi != "" and Data.icon_id(gi) >= 0:
		return Data.icon_id(gi)
	if icons.is_empty():
		return Data.icon_id("male - tan.dmi")
	return Data.icon_id(icons[0])


func build_appearance(p: Dictionary = P, e: Mob = pe) -> void:
	var rd: Dictionary = Data.rules["races"][p["race"]]
	var f := current_form(p)
	e.icon = base_icon(p)
	var fi := form_icon(p, f)
	if fi != "" and Data.icon_id(fi) >= 0:
		e.icon = Data.icon_id(fi)
	e.overlays = []
	e.underlays = []
	var go: String = GENE_OVERLAYS.get(p.get("gene", ""), "")
	if p["race"] == "Alien" and go != "" and Data.icon_id(go) >= 0:
		e.overlays.append({"icon": Data.icon_id(go)})
	# Fomhoire demons have no hair until their third form (DemonHair_Apply in Hair.dm)
	if p["race"] == "Demon" and p.get("gene", "") == "Fomhoire" and int(p.get("form", 0)) >= 3:
		var dt := Data.icon_id(DEMON_HAIR.get(p.get("hair", "Goku"), ""))
		if dt >= 0:
			e.overlays.append({"icon": dt})
	if has_hair(p):
		var base_hair: String = HAIRS.get(p.get("hair", "Bald"), "")
		var hid := Data.icon_id(base_hair)
		if not f.is_empty() and int(f.get("ssjhair", 0)) == 1 and base_hair != "":
			# Hair.dm SSJHair_Apply / USSJHair_Apply: "<hair> ssj.dmi", "<hair> ussj.dmi", SSJ3/SSJ4 hair
			var n := int(p.get("form", 1))
			var cand: Array = []
			if n >= 5:
				cand = ["hair - ssj4.dmi"]
			elif n == 4:
				cand = ["hair - ssj3.dmi"]
			elif n == 3:
				cand = [base_hair.replace(".dmi", " ussj.dmi")]
			cand.append_array([base_hair.replace(".dmi", " ssj.dmi"), base_hair.replace(".dmi", "ssj.dmi")])
			for c in cand:
				if Data.icon_id(c) >= 0:
					hid = Data.icon_id(c)
					break
		if hid >= 0:
			e.overlays.append({"icon": hid})
	if e == pe:
		var big := _big_aura(p) if not f.is_empty() and bool(p.get("trans_aura", true)) else ""
		var bid := Data.icon_id(big) if big != "" else -1
		if bid >= 0:
			# Aura.dm Big_Aura(): the bottom half behind you, the "top" half above your head in front
			e.underlays.append({"icon": bid, "state": "", "alpha": 0.95})
			e.overlays.append({"icon": bid, "state": "top", "py": 32, "alpha": 0.95})
		elif busy == "power" or toggles.get("aura", false):
			var aura := Data.icon_id("defaultaurablue.dmi")
			if aura >= 0:
				e.underlays.append({"icon": aura, "state": "", "alpha": 0.9})
		if toggles.get("kaioken", false):
			var ka := Data.icon_id("kaio aura.dmi")
			if ka >= 0:
				e.underlays.append({"icon": ka, "state": ""})
	e.name = p.get("name", "")


## Aura.dm Big_Aura(): which transformation aura each race gets.
func _big_aura(p: Dictionary) -> String:
	var r: String = p["race"]
	var g: String = p.get("gene", "")
	var fn := int(p.get("form", 0))
	match r:
		"Saiyan":
			if g == "Godly" and fn == 6:
				return "ssjbauranew.dmi"
			return "big aura 10.dmi" if g == "Legendary" else "big aura.dmi"
		"Half Saiyan": return "big aura.dmi"
		"Changeling": return "big aura 3.dmi"
		"Majin": return "big aura 2.dmi"
		"Namekian", "Saibaman", "Bio Android": return "big aura 5.dmi"
		"Kai": return "androa.dmi"
		"Android": return "androa.dmi" if fn >= 1 else "big aura 7.dmi"
		"Tuffle", "Dragon", "Konat", "Human": return "big aura 6.dmi"
		"Demon": return ["", "demona.dmi", "demona2.dmi", "demona3.dmi", ""][mini(fn, 4)]
	return ""


func start(p: Dictionary) -> void:
	session = {}
	call_deferred("_snapshot_session")
	P = p
	for s in SKILLS:
		if not P["skills"].has(s):
			P["skills"][s] = [10.0, 0.0, 75.0]
	var hb: Array = P["hotbar"]
	if int(P.get("hotbar_v", 1)) < HOTBAR_VERSION:
		# old saves had the basic actions on the bar; they now live in the action panel
		for i in hb.size():
			if hb[i] in BASE_ACTIONS or hb[i] == "travel" or (str(hb[i]).begins_with("t:") and _is_utility(str(hb[i]).substr(2))):
				hb[i] = ""
		P["hotbar_v"] = 2
	if int(P.get("hotbar_v", 2)) < 3:
		# pages of 10 -> pages of 9: keep each page's first 9 slots, move the 10th into a free slot
		var old := hb.duplicate()
		var spare: Array = []
		hb.clear()
		for pg in 3:
			for i in 10:
				var v: String = str(old[pg * 10 + i]) if pg * 10 + i < old.size() else ""
				if i < 9:
					hb.append(v)
				elif v != "":
					spare.append(v)
		for v in spare:
			var e := hb.find("")
			if e >= 0:
				hb[e] = v
		P["hotbar_v"] = HOTBAR_VERSION
	for i in hb.size():
		if hb[i] == "travel":
			hb[i] = ""
	while hb.size() < HOTBAR_SLOTS:
		hb.append("")
	if "PowerUp" in P["learned"] and not "PowerDown" in P["learned"]:
		(P["learned"] as Array).append("PowerDown")
	pe = Mob.new()
	pe.kind = "player"
	pe.x = int(P["x"])
	pe.y = int(P["y"])
	pe.z = int(P["z"])
	pe.from_x = pe.x
	pe.from_y = pe.y
	pe.dir = int(P.get("dir", 2))
	busy = ""
	toggles = {}
	buffs = {}
	world.load_z(pe.z)
	if not world.can_enter(pe, pe.x, pe.y, pe.z):
		_nearest_free(pe.x, pe.y, pe.z)
	world.add(pe)
	world.focus = pe
	build_appearance()
	running = true
	last_tick = now
	skill_gain(true)
	msg("Welcome to Dragonball Ruination, %s!" % P["name"], Color(1, 0.75, 0.2))
	if int(P["level"]) < PK_LEVEL:
		msg("Self Train to level %s to unlock battle techniques. Rest when you get tired." % fmt(PK_LEVEL), Color(0.6, 0.85, 1))


func _nearest_free(x: int, y: int, z: int) -> void:
	for r in range(1, 12):
		for dx in range(-r, r + 1):
			for dy in range(-r, r + 1):
				if world.can_enter(pe, x + dx, y + dy, z):
					pe.x = x + dx
					pe.y = y + dy
					pe.from_x = pe.x
					pe.from_y = pe.y
					return


# =================================================================== derived stats
func skill(s: String) -> float:
	var v: float = P["skills"][s][0]
	if buffs.has(s):
		v *= float(buffs[s]["mult"])
	return v


func current_form(p: Dictionary = P) -> Dictionary:
	var n := int(p.get("form", 0))
	if n <= 0:
		return {}
	var fl := forms_for(p)
	return fl[n - 1] if n <= fl.size() else {}


func forms_for(p: Dictionary = P) -> Array:
	var rf: Dictionary = Data.rules["forms"].get(p["race"], {})
	var lst = rf.get(p.get("gene", ""), rf.get("*", null))
	if lst == null and not rf.is_empty():
		lst = rf.values()[0]
	if lst == null or (lst as Array).is_empty():
		lst = [{"form": 1, "level": 20000, "pl": 10, "ki": 10, "str": 11, "def": 11},
			{"form": 2, "level": 50000, "pl": 20, "ki": 20, "str": 22, "def": 22},
			{"form": 3, "level": 100000, "pl": 30, "ki": 30, "str": 33, "def": 33},
			{"form": 4, "level": 150000, "pl": 40, "ki": 40, "str": 44, "def": 44}]
	return lst


func _buff(stat: String) -> float:
	var m := 1.0
	if buffs.has(stat):
		m *= float(buffs[stat]["mult"])
	if stat in ["strength", "powerlevel"] and toggles.get("kaioken", false):
		m *= 1.5
	return m


func kc() -> float:
	return clampf(skill("ki_control"), 1.0, 100.0) / 100.0


func pl_max() -> float:
	var calc: float = float(P["strength_max"]) * 0.2 + float(P["ki_max"]) * 0.2 + float(P["defence_max"]) * 0.6
	return maxf(300.0, calc + float(P["pl_bonus"]))


func cap(stat: String) -> float:
	var f := current_form()
	match stat:
		"powerlevel":
			return pl_max() * kc() * form_mult("pl") * _buff(stat)
		"ki":
			return float(P["ki_max"]) * kc() * form_mult("ki") * _buff(stat)
		"strength":
			return float(P["strength_max"]) * kc() * form_mult("str") * _buff(stat)
		"defence":
			return float(P["defence_max"]) * kc() * form_mult("def") * _buff(stat)
	return 0.0


func tired() -> bool:
	return float(P["stam"]) >= float(P["stam_max"])


func fatigue(v: float) -> void:
	if buffs.has("stamina"):
		v *= 0.5
	P["stam"] = clampf(float(P["stam"]) + v, 0.0, float(P["stam_max"]))


# =================================================================== movement
func set_move_dir(d: int) -> void:
	move_dir = d


func dir_to(dx: int, dy: int) -> int:
	var d := 0
	if dy > 0:
		d |= 1
	elif dy < 0:
		d |= 2
	if dx > 0:
		d |= 4
	elif dx < 0:
		d |= 8
	return d if d != 0 else 2


func try_step(d: int) -> void:
	if now < pe.stun_until:
		return
	if busy != "":
		stop_busy()
	pe.dir = d
	P["dir"] = d
	var nx: int = pe.x + Data.DIR_DX[d]
	var ny: int = pe.y + Data.DIR_DY[d]
	var dur := 105.0 if pe.flying else 165.0
	if world.can_enter(pe, nx, ny, pe.z):
		world.move(pe, nx, ny, pe.z, dur, now)
		_entered()
	elif Data.DIR_DX[d] != 0 and Data.DIR_DY[d] != 0:
		if world.can_enter(pe, pe.x + Data.DIR_DX[d], pe.y, pe.z):
			world.move(pe, pe.x + Data.DIR_DX[d], pe.y, pe.z, dur, now)
			_entered()
		elif world.can_enter(pe, pe.x, pe.y + Data.DIR_DY[d], pe.z):
			world.move(pe, pe.x, pe.y + Data.DIR_DY[d], pe.z, dur, now)
			_entered()
	else:
		var tur := Data.turf(nx, ny, pe.z)
		if tur.has("enter") and tur["enter"].has("warp"):
			var w: Array = tur["enter"]["warp"]
			teleport(int(w[0]), int(w[1]), int(w[2]))
	P["x"] = pe.x
	P["y"] = pe.y
	P["z"] = pe.z


func _entered() -> void:
	var tur := Data.turf(pe.x, pe.y, pe.z)
	if tur.has("enter") and tur["enter"].has("warp"):
		var w: Array = tur["enter"]["warp"]
		if tur["enter"].has("msg"):
			msg(tur["enter"]["msg"], Color(0.8, 0.8, 0.9))
		teleport(int(w[0]), int(w[1]), int(w[2]))


func teleport(x: int, y: int, z: int) -> void:
	if z != pe.z:
		world.load_z(z)
		msg("You arrive at %s." % zname(z), Color(0.6, 0.85, 1))
	var tx := x
	var ty := y
	if not world.can_enter(pe, x, y, z):
		var found := false
		for r in range(1, 6):
			for dx in range(-r, r + 1):
				for dy in range(-r, r + 1):
					if not found and world.can_enter(pe, x + dx, y + dy, z):
						tx = x + dx
						ty = y + dy
						found = true
	world.move(pe, tx, ty, z, 0, now)
	P["x"] = pe.x
	P["y"] = pe.y
	P["z"] = pe.z
	projectiles = projectiles.filter(func(pr): return pr.z == z)


# =================================================================== abilities
## Everything the player can put on the hotbar: base actions + learned techniques.
func abilities() -> Array:
	var out: Array = BASE_ACTIONS.duplicate()
	for t in P.get("learned", []):
		out.append("t:" + t)
	return out


func ability_info(id: String) -> Dictionary:
	match id:
		"attack": return {"name": "Attack", "desc": "Punch the enemy in front of you (or the nearest one).", "glyph": "ATK", "color": Color(0.75, 0.2, 0.15)}
		"talk": return {"name": "Talk", "desc": "Talk to the person next to you.", "glyph": "TLK", "color": Color(0.2, 0.55, 0.55)}
		"selftrain": return {"name": "Self Train", "desc": "Shadow box to gain exp, zenni and stats in your training focus. Tires you out.", "glyph": "TRN", "color": Color(0.25, 0.5, 0.25)}
		"meditate": return {"name": "Meditate", "desc": "Meditate to train a skill (default Ki Control) and recover ki.", "glyph": "MED", "color": Color(0.3, 0.35, 0.7)}
		"rest": return {"name": "Rest", "desc": "Recover from fatigue and heal.", "glyph": "RST", "color": Color(0.35, 0.35, 0.4)}
		"transform": return {"name": "Transform", "desc": "Transform into your next form (race and gene specific).", "glyph": "TRF", "color": Color(0.85, 0.65, 0.1)}
		"revert": return {"name": "Revert", "desc": "Return to your base form.", "glyph": "REV", "color": Color(0.5, 0.4, 0.2)}
		"focus": return {"name": "Training Focus", "desc": "Choose what Self Train and Meditate improve.", "glyph": "FOC", "color": Color(0.4, 0.3, 0.5)}
	if id.begins_with("t:"):
		var key := id.substr(2)
		var t := Data.tech(key)
		var info := {"name": t.get("name", key), "glyph": _abbr(t.get("name", key)), "color": _tech_color(t), "tech": key}
		info["desc"] = _tech_desc(t)
		if t.has("icon") and Data.icon_id(t["icon"]) >= 0:
			info["icon"] = Data.icon_id(t["icon"])
			info["state"] = t.get("state", "")
		return info
	return {"name": id, "glyph": "?", "color": Color.GRAY, "desc": ""}


func _abbr(n: String) -> String:
	var parts := n.split(" ", false)
	if parts.size() >= 2:
		return (parts[0].substr(0, 1) + parts[1].substr(0, 2)).to_upper()
	return n.substr(0, 3).to_upper()


func _tech_color(t: Dictionary) -> Color:
	match t.get("kind", ""):
		"blast": return Color(0.2, 0.45, 0.85)
		"multi": return Color(0.25, 0.6, 0.9)
		"aoe": return Color(0.85, 0.35, 0.1)
		"bind": return Color(0.55, 0.25, 0.65)
		"strike": return Color(0.7, 0.2, 0.2)
		"buff": return Color(0.8, 0.6, 0.1)
		"heal": return Color(0.2, 0.7, 0.35)
	return Color(0.4, 0.4, 0.45)


func _tech_desc(t: Dictionary) -> String:
	var d := ""
	match t.get("kind", ""):
		"blast":
			d = ("Beam" if t.get("beam", 0) else "Ki projectile") + " (range %d)%s." % [int(t.get("range", 18)), ", explodes" if t.get("splash", 0) else ""]
		"multi":
			d = "Fires a volley of %d ki blasts." % int(t.get("shots", 3))
		"aoe":
			d = "Explosion around you (radius %d)." % int(t.get("radius", 2))
		"bind":
			d = "Damages and immobilises the target for %d s." % int(t.get("stun", 3))
		"strike":
			d = "Powerful close-range attack."
		"buff":
			d = "Boosts %s." % t.get("stat", "")
		"heal":
			d = "Restores your health." if float(t.get("amount", 0)) > 0 else "Absorbs ki."
		_:
			d = {"fly": "Toggle flight: fast travel, passes over obstacles.", "sense": "Sense the power of nearby enemies.",
				"teleport": "Instant Transmission back to Capsule City.", "dash": "Dash forward.",
				"oozaru": "Transform into a giant ape for a while.", "powerup": "Charge your power and ki.",
				"powerdown": "Lower your power."}.get(t.get("what", ""), "Technique.")
	if t.has("cost"):
		d += " Ki cost %s." % fmt(tech_cost(t))
	if t.has("cd"):
		d += " Cooldown %ss." % str(t["cd"])
	return d


func tech_cost(t: Dictionary) -> float:
	# var/cost = ((curki * a) * (usr.kiuse/100)) + b   with kiuse = 120
	var c = t.get("cost")
	if c == null or P.is_empty():
		return 0.0
	var curki: float = float(P["ki_max"]) * kc()
	var extra := float(c[2]) * 1.2 if c.size() > 2 else 0.0     # "+(N*usr.kiuse)" costs
	return roundf(curki * float(c[0]) * 1.2 + float(c[1]) + extra)


func cooldown_left(id: String) -> float:
	return maxf(0.0, float(cooldowns.get(id, 0.0)) - now)


func use_ability(id: String) -> void:
	if id == "" or pe == null or traveling:
		return
	match id:
		"attack": melee()
		"talk": interact()
		"selftrain": toggle_busy("selftrain")
		"meditate": toggle_busy("meditate")
		"rest": toggle_busy("rest")
		"transform": transform()
		"revert": revert()
		"focus": choose_focus()
		_:
			if id.begins_with("t:"):
				use_tech(id.substr(2))


# =================================================================== combat
func facing_target(any_adjacent := true) -> Mob:
	var fx: int = pe.x + Data.DIR_DX[pe.dir]
	var fy: int = pe.y + Data.DIR_DY[pe.dir]
	for o in world.at(fx, fy, pe.z):
		if o.kind == "monster" and not o.dead:
			return o
	if any_adjacent:
		for d in [2, 1, 4, 8, 6, 10, 5, 9]:
			for o in world.at(pe.x + Data.DIR_DX[d], pe.y + Data.DIR_DY[d], pe.z):
				if o.kind == "monster" and not o.dead:
					pe.dir = d
					return o
	return null


func nearest_monster(r: int) -> Mob:
	var best: Mob = null
	var bd := 9999
	for m in monsters:
		if m.dead or m.z != pe.z:
			continue
		var d: int = maxi(absi(m.x - pe.x), absi(m.y - pe.y))
		if d <= r and d < bd:
			bd = d
			best = m
	return best


func melee() -> void:
	var cd := clampf(60.0 - skill("melee") / 2.0, 2.0, 15.0) * 25.0   # AttackNormal cooldown
	if now - last_melee < maxf(280.0, cd):
		return
	if busy != "":
		stop_busy()
	if tired():
		msg("You are too tired to fight!", Color(1, 0.4, 0.4))
		return
	var m := facing_target()
	pe.do_flick("attack", now)
	last_melee = now
	if m == null:
		for o in world.at(pe.x + Data.DIR_DX[pe.dir], pe.y + Data.DIR_DY[pe.dir], pe.z):
			if o.kind == "npc":
				interact(o)
		return
	if Data.is_safe(pe.x, pe.y, pe.z):
		msg("You are in a Safe Zone!", Color(1, 0.4, 0.4))
		return
	# AttackNormal
	var attack := cap("strength") * (skill("melee") / 100.0) * randf_range(0.6, 1.0)
	var defense := m.defence * (m.durability / 100.0) * randf_range(0.85, 1.0)
	var dmg := attack - defense
	var crit := randf() * 100.0 < 1.0 + skill("critical") / 10.0
	if crit:
		dmg *= 1.2
		_skill_exp("critical", 5 + int(P["level"]) / 750)
	dmg = maxf(1.0, roundf(dmg))
	m.powerlevel -= dmg
	m.target = pe
	_skill_exp("melee", 2 + int(P["level"]) / 1250)
	fatigue(1)
	if randf() < 0.1:
		P["strength_max"] = float(P["strength_max"]) + randi_range(10, 100) + float(P["level"]) / 2.0
	world.floater(m.x, m.y, m.z, ("CRIT " if crit else "") + fmt(dmg), Color(1, 0.85, 0.3) if not crit else Color(1, 0.4, 0.2))
	if m.powerlevel <= 0:
		monster_die(m)


func monster_attack(m: Mob) -> void:
	if pe.flying or Data.is_safe(pe.x, pe.y, pe.z):
		return
	m.do_flick("attack", now)
	var attack := m.strength + m.powerlevel * 0.1
	var defense := cap("defence") * (skill("durability") / 100.0) + cap("powerlevel") * 0.01
	var dmg := maxf(1.0, attack - defense)
	if toggles.get("shield", false):
		dmg *= 0.65
	if buffs.has("barrier"):
		dmg *= 0.5
	if randf() * 100.0 < skill("dodge") / 5.0:
		_skill_exp("dodge", 5 + int(P["level"]) / 250)
		world.floater(pe.x, pe.y, pe.z, "Dodge", Color(0.7, 0.9, 1))
		return
	if randf() * 100.0 < skill("block") / 5.0:
		dmg /= 4.0
		_skill_exp("block", 5 + int(P["level"]) / 250)
	if randf() * 100.0 < skill("counter") / 10.0:
		_skill_exp("counter", 5 + int(P["level"]) / 250)
		var cdmg := maxf(1.0, cap("strength") * skill("melee") / 100.0 - m.defence * m.durability / 100.0)
		m.powerlevel -= cdmg
		world.floater(m.x, m.y, m.z, "Counter " + fmt(cdmg), Color(1, 0.8, 0.3))
		if m.powerlevel <= 0:
			monster_die(m)
			return
	P["powerlevel"] = float(P["powerlevel"]) - roundf(dmg)
	last_hurt = now
	_skill_exp("durability", 1 + int(P["level"]) / 1500)
	if busy != "":
		stop_busy()
	world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.3, 0.3))
	if float(P["powerlevel"]) <= 0:
		player_ko(m)


func monster_die(m: Mob) -> void:
	if m.dead:
		return
	m.dead = true
	world.remove(m)
	P["kills"] = int(P["kills"]) + 1
	var e := m.exp_reward
	var z := m.zenni_reward
	if buffs.has("exp"):
		e *= float(buffs["exp"]["mult"])
	P["exp"] = float(P["exp"]) + e
	P["zenni"] = float(P["zenni"]) + z
	msg("You defeated %s! +%s exp, +%s zenni" % [m.name, fmt(e), fmt(z)], Color(0.5, 1, 0.5), "combat")
	level_up()
	var path := m.path
	var home := m.home
	monsters.erase(m)
	if m.respawn:
		after(randf_range(45000, 60000), func(): spawn_monster(path, home.x, home.y, home.z))


func player_ko(by: Mob, reason := "") -> void:
	revert(true)
	stop_busy()
	gravity_off()
	msg(reason if reason != "" else "%s knocked you out!" % (by.name if by else "Someone"), Color(1, 0.35, 0.35), "combat")
	msg("You wake up in the hospital.", Color(0.8, 0.8, 0.8))
	for m in monsters:
		if m.target == pe:
			m.target = null
	P["powerlevel"] = cap("powerlevel")
	P["ki"] = cap("ki")
	P["stam"] = 0.0
	pe.flying = false
	teleport(SPAWN.x, SPAWN.y, SPAWN.z)
	_update_state()
	build_appearance()
	save()


# =================================================================== techniques
func use_tech(key: String) -> void:
	var t := Data.tech(key)
	if t.is_empty():
		return
	var id := "t:" + key
	if cooldown_left(id) > 0:
		return
	var kind: String = t.get("kind", "utility")
	var offensive := kind in ["blast", "multi", "aoe", "bind", "strike", "missile", "bigball", "wave", "push", "powerdash", "burstrush"]
	if offensive:
		if int(P["level"]) < PK_LEVEL:
			msg("Reach level %s to be able to use battle techniques." % fmt(PK_LEVEL), Color(1, 0.5, 0.4))
			return
		if Data.is_safe(pe.x, pe.y, pe.z):
			msg("You are in a Safe Zone!", Color(1, 0.4, 0.4))
			return
		if tired():
			msg("You are too tired to fight!", Color(1, 0.4, 0.4))
			return
		if pe.flying and kind != "blast":
			msg("You can't do that while flying.", Color(1, 0.4, 0.4))
			return
	var cost := tech_cost(t)
	if float(P["ki"]) < cost:
		msg("You don't have enough ki!", Color(1, 0.4, 0.4))
		return
	if busy != "" and offensive:
		stop_busy()
	P["ki"] = float(P["ki"]) - cost
	cooldowns[id] = now + float(t.get("cd", 0.6 if kind == "blast" else 1.5)) * 1000.0
	if offensive:
		fatigue(10)
		_skill_exp("ki_cast", 3 + int(P["level"]) / 2000)
		_skill_exp("ki_use", 5 + int(P["level"]) / 1000)
	match kind:
		"blast":
			pe.do_flick("blast", now)
			if t.get("spawn", "") == "triple":
				# Techniques3.dm: one blast in front and one on each side, all flying the same way
				var dmg := blast_damage(t)
				for side in [0, 2, -2]:
					var sd: int = pe.dir if side == 0 else _turn(pe.dir, side)
					fire(pe, t, dmg, pe.dir, pe.x + Data.DIR_DX[sd], pe.y + Data.DIR_DY[sd])
			else:
				fire(pe, t, blast_damage(t), pe.dir)
		"missile":
			_missiles(t)
		"bigball":
			_bigball(t)
		"wave":
			_wave(t)
		"multi":
			var n := int(t.get("shots", 3))
			var base := _ki_damage(float(t.get("pow", 0.05)))
			var dirs := _volley_dirs(pe.dir, n)
			for i in n:
				var vd: int = dirs[i]
				after(i * 110.0, func(): fire(pe, {"icon": "techs.dmi", "state": "blastr", "range": 14, "speed": 14}, base, vd))
		"aoe":
			_explosion(pe.x, pe.y, pe.z, int(t.get("radius", 2)), _ki_damage(float(t.get("pow", 0.1))), null)
			if t.has("selfcost"):
				P["powerlevel"] = maxf(1.0, float(P["powerlevel"]) * (1.0 - float(t["selfcost"])))
		"bind":
			_bind(t)
		"push":
			_push()
		"powerdash":
			_power_dash(t)
		"burstrush":
			_burst_rush()
		"strike":
			_strike(t)
		"buff":
			var stat: String = t.get("stat", "")
			if int(t.get("toggle", 0)) == 1:
				toggles[stat] = not toggles.get(stat, false)
				msg("%s %s." % [t.get("name", key), "on" if toggles[stat] else "off"], Color(1, 0.85, 0.4))
			else:
				buffs[stat] = {"mult": float(t.get("mult", 1.25)), "until": now + float(t.get("secs", 60)) * 1000.0}
				msg("%s! (%s boosted for %ds)" % [t.get("name", key), stat, int(t.get("secs", 60))], Color(1, 0.85, 0.4))
			build_appearance()
		"heal":
			var amt: float = cap("powerlevel") * float(t.get("amount", 0.2))
			P["powerlevel"] = minf(cap("powerlevel"), float(P["powerlevel"]) + amt)
			if t.has("ki"):
				P["ki"] = minf(cap("ki"), float(P["ki"]) + cap("ki") * float(t["ki"]))
			if int(t.get("drain", 0)) == 1:
				var m := facing_target()
				if m:
					_hit_monster(m, amt * 0.5, Color(0.5, 1, 0.5))
			world.floater(pe.x, pe.y, pe.z, "+" + fmt(amt), Color(0.4, 1, 0.5))
		_:
			utility(t, key)


func _bind(t: Dictionary) -> void:
	var targets: Array = []
	if t.has("radius"):
		for m in monsters:
			if not m.dead and m.z == pe.z and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= int(t["radius"]):
				targets.append(m)
	else:
		var m := facing_target()
		if m == null:
			m = nearest_monster(6)
		if m:
			targets.append(m)
	if targets.is_empty():
		msg("No target in range.", Color(0.8, 0.8, 0.8))
	for m in targets:
		m.stun_until = now + float(t.get("stun", 3)) * 1000.0
		_hit_monster(m, _ki_damage(float(t.get("pow", 0.05))), Color(0.85, 0.5, 1))


func _strike(t: Dictionary) -> void:
	if t.has("dash"):
		for i in int(t["dash"]):
			var nx: int = pe.x + Data.DIR_DX[pe.dir]
			var ny: int = pe.y + Data.DIR_DY[pe.dir]
			if facing_target(false) != null or not world.can_enter(pe, nx, ny, pe.z):
				break
			world.move(pe, nx, ny, pe.z, 60, now)
	var m := facing_target()
	if m == null:
		msg("No target in range.", Color(0.8, 0.8, 0.8))
		return
	var dmg := maxf(1.0, cap("strength") * skill("melee") / 100.0 - m.defence * m.durability / 100.0) * float(t.get("pow", 1.5))
	for h in int(t.get("hits", 1)):
		if not m.dead:
			_hit_monster(m, dmg, Color(1, 0.6, 0.3))
	if t.has("dot") and not m.dead:
		m.dot_until = now + float(t["dot"]) * 1000.0
		m.dot_amount = dmg * 0.1
	if t.has("knock") and not m.dead:
		for i in int(t["knock"]):
			var kx: int = m.x + Data.DIR_DX[pe.dir]
			var ky: int = m.y + Data.DIR_DY[pe.dir]
			if world.can_enter(m, kx, ky, m.z):
				world.move(m, kx, ky, m.z, 70, now)
	pe.do_flick("attack", now)


# =================================================================== melee techniques
## Push.dm Push(): the enemy in front takes round(str*melee% - def*dur/150)*0.4 (at least 1)
## + level*15 and is thrown 1-3 tiles.
func _push() -> void:
	var m := facing_target(false)
	if m == null:
		return
	pe.do_flick("attack", now)
	var dmg := maxf(1.0, roundf(cap("strength") * skill("melee") / 100.0 - m.defence * m.durability / 150.0) * 0.4)
	_hit_monster(m, dmg + int(P["level"]) * 15.0, Color(1, 0.6, 0.3), "")
	if not m.dead:
		_throw(m, pe.dir, randi_range(1, 3))


## ThrowMob(): slide the enemy a few tiles, stopping at anything solid.
func _throw(m: Mob, d: int, tiles: int) -> void:
	for i in tiles:
		var nx: int = m.x + Data.DIR_DX[d]
		var ny: int = m.y + Data.DIR_DY[d]
		if not world.can_enter(m, nx, ny, m.z):
			break
		after(i * 100.0, func(): if not m.dead and world.can_enter(m, nx, ny, m.z): world.move(m, nx, ny, m.z, 100.0, now))
	m.stun_until = maxf(m.stun_until, now + tiles * 100.0 + 200.0)


## PowerDash.dm PowDash(): dash up to 20 tiles leaving after-images and slam into the first
## enemy in the way: round(str*melee% - def*dur%)*0.6 (at least 1) + level*15.
func _power_dash(t: Dictionary) -> void:
	if pe.flying:
		msg("You can't use this technique while flying", Color(1, 0.4, 0.4))
		return
	pe.do_flick("IT", now)
	var path: Array = []
	var x := pe.x
	var y := pe.y
	var target: Mob = null
	for i in int(t.get("range", 20)):
		var nx: int = x + Data.DIR_DX[pe.dir]
		var ny: int = y + Data.DIR_DY[pe.dir]
		for o in world.at(nx, ny, pe.z):
			if o.kind == "monster" and not o.dead:
				target = o
		if target != null or not world.can_enter(pe, nx, ny, pe.z):
			break
		x = nx
		y = ny
		path.append(Vector2i(x, y))
	var step_ms := 30.0
	for i in path.size():
		var p: Vector2i = path[i]
		after(300.0 + i * step_ms, func():
			_after_image(pe.x, pe.y)
			world.move(pe, p.x, p.y, pe.z, step_ms, now)
			P["x"] = pe.x
			P["y"] = pe.y)
	pe.stun_until = now + 300.0 + path.size() * step_ms
	if target != null:
		var m := target
		after(300.0 + path.size() * step_ms, func():
			if m.dead:
				return
			var dmg := maxf(1.0, roundf(cap("strength") * skill("melee") / 100.0 - m.defence * m.durability / 100.0) * 0.6)
			msg("%s slammed into %s!" % [P["name"], m.name], Color(1, 0.8, 0.4), "combat")
			_hit_monster(m, dmg + int(P["level"]) * 15.0, Color(1, 0.5, 0.2), ""))


func _after_image(x: int, y: int) -> void:
	var a := Mob.new()
	a.kind = "fx"
	a.x = x
	a.y = y
	a.z = pe.z
	a.from_x = x
	a.from_y = y
	a.icon = pe.icon
	a.state = "IT" if Data.has_state(pe.icon, "IT") else pe.state
	a.dir = pe.dir
	a.overlays = pe.overlays.duplicate()
	a.underlays = pe.underlays.duplicate()
	a.layer = 4.5
	a.dense = false
	world.add(a)
	after(200.0, func(): world.remove(a))      # disappearimage(): gone after two ticks


## Techniques.dm Burst_Rush: 100,000 Ki. Appear below, left and right of the enemy with an
## attack each time, then throw it; it is slowed and can't act for a while. (No damage in the
## original: it sets up your next attacks.)
func _burst_rush() -> void:
	var m := facing_target()
	if m == null:
		m = _nearest_to(pe.x, pe.y, pe.z, 8)
	if m == null:
		msg("No target in range.", Color(0.8, 0.8, 0.8))
		P["ki"] = float(P["ki"]) + 100000.0
		return
	var spots := [[0, -1, 1], [-1, 0, 4], [1, 0, 8]]     # dx, dy, facing (N, E, W)
	for i in spots.size():
		var sp: Array = spots[i]
		after(i * 400.0, func():
			if m.dead:
				return
			pe.do_flick("IT", now)
			world.move(pe, m.x + int(sp[0]), m.y + int(sp[1]), m.z, 0, now)
			P["x"] = pe.x
			P["y"] = pe.y
			pe.dir = int(sp[2])
			after(60.0, func(): pe.do_flick("attack", now)))
	after(850.0, func():
		if not m.dead:
			_throw(m, pe.dir, randi_range(1, 3))
			m.stun_until = now + 5000.0
			m.next_attack = now + 5000.0)
	pe.stun_until = now + 900.0


func _volley_dirs(d: int, n: int) -> Array:
	var sides: Array
	if Data.DIR_DX[d] == 0:
		sides = [d | 4, d | 8]
	elif Data.DIR_DY[d] == 0:
		sides = [d | 1, d | 2]
	else:
		sides = [d & 3, d & 12]
	var out: Array = []
	for i in n:
		out.append(d if (i % 3 == 0 or n <= 3) else sides[i % 2])
	return out


func utility(t: Dictionary, key: String) -> void:
	match t.get("what", ""):
		"fly":
			pe.flying = not pe.flying
			if busy != "":
				stop_busy()
			msg("You take to the sky." if pe.flying else "You land.", Color(0.6, 0.85, 1))
			if not pe.flying and not world.can_enter(pe, pe.x, pe.y, pe.z):
				pe.flying = true
				msg("You can't land here!", Color(1, 0.4, 0.4))
			_update_state()
		"sense":
			var lst: Array = []
			for m in monsters:
				if not m.dead and m.z == pe.z and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= 15:
					lst.append(m)
			lst.sort_custom(func(a, b): return maxi(absi(a.x - pe.x), absi(a.y - pe.y)) < maxi(absi(b.x - pe.x), absi(b.y - pe.y)))
			var txt := ""
			for m in lst.slice(0, 8):
				txt += "%s (lvl %s) PL %s\n" % [m.name, fmt(m.level), fmt(m.powerlevel)]
			ask("Sense", txt if txt != "" else "You sense no one nearby.", ["OK"], func(_c, _i): pass)
		"teleport":
			instant_transmission()
		"dash":
			for i in 3:
				var nx: int = pe.x + Data.DIR_DX[pe.dir]
				var ny: int = pe.y + Data.DIR_DY[pe.dir]
				if world.can_enter(pe, nx, ny, pe.z):
					world.move(pe, nx, ny, pe.z, 40, now)
			P["x"] = pe.x
			P["y"] = pe.y
		"oozaru":
			if P["race"] in ["Saiyan", "Half Saiyan"]:
				buffs["strength"] = {"mult": 10.0, "until": now + 60000.0}
				buffs["defence"] = {"mult": 5.0, "until": now + 60000.0}
				var oz := Data.icon_id("oozaru.dmi")
				if oz >= 0:
					pe.icon = oz
				after(60000.0, func(): build_appearance())
				msg("You look at the fake moon and transform into an Oozaru!", Color(1, 0.6, 0.3))
			else:
				msg("You create a fake moon. It's pretty.", Color(0.8, 0.8, 0.8))
		"powerup":
			toggle_busy("power")
		"powerdown":
			# Power Down.dm: "What percentage do you wish to power down to?"
			if busy == "power":
				stop_busy()
			ask("Power Down", "What percentage do you wish to power down to?", ["75%", "50%", "25%", "10%", "Cancel"], func(c: String, _i: int):
				if c == "Cancel":
					return
				var pct := float(c.trim_suffix("%")) / 100.0
				P["powerlevel"] = minf(float(P["powerlevel"]), cap("powerlevel") * pct)
				P["ki"] = minf(float(P["ki"]), cap("ki") * pct)
				msg("You power down to %s." % c, Color(0.8, 0.8, 0.8)))
		_:
			msg("%s isn't available in this version yet." % t.get("name", key), Color(0.8, 0.8, 0.8))


func _ki_damage(pw: float) -> float:
	return (maxf(float(P["powerlevel"]), 0.0) * 0.05 + cap("ki") * pw * 2.0) * skill("ki_power") / 100.0


func blast_damage(t: Dictionary) -> float:
	var co: Dictionary = t.get("coef", {"powerlevel": 0.05, "ki": 0.05})
	var d := 0.0
	d += float(co.get("powerlevel", 0)) * maxf(float(P["powerlevel"]), 0.0)
	d += float(co.get("ki", 0)) * maxf(float(P["ki"]), 0.0)
	d += float(co.get("strength", 0)) * cap("strength")
	d += float(co.get("defence", 0)) * cap("defence")
	var scale: String = t.get("scale", "ki_power")
	var sv := skill(scale) if P["skills"].has(scale) else 100.0
	d *= sv / 100.0
	return roundf(d)


func fire(owner: Mob, t: Dictionary, dmg: float, d: int, sx := -99999, sy := -99999) -> void:
	var pr := Mob.new()
	pr.kind = "proj"
	pr.x = owner.x if sx == -99999 else sx
	pr.y = owner.y if sy == -99999 else sy
	pr.z = owner.z
	pr.from_x = pr.x
	pr.from_y = pr.y
	pr.dir = d
	pr.icon = Data.icon_id(t.get("icon", "techs.dmi"))
	pr.state = t.get("state", "")
	pr.layer = 5.0
	pr.dense = false
	pr.owner = owner
	pr.damage = dmg
	pr.tech = t
	pr.steps = int(t.get("range", 18))
	pr.next_step = now + 30
	if t.get("beam", 0):
		_setup_beam(pr)
	pr.homing = int(t.get("homing", 0)) == 1
	# critblast: prob(ki_cast/4) for +35%, added in dmg() to the direct hit only (splash uses the base)
	pr.crit = owner == pe and randf() * 100.0 < skill("ki_cast") / 4.0
	world.add(pr)
	projectiles.append(pr)
	if sx != -99999:
		# created on its own tile (Triple Ki Blast sides): hit whatever already stands there
		for o in world.at(pr.x, pr.y, pr.z):
			if o.kind == "monster" and not o.dead:
				_blast_hit(pr, o, pr.x, pr.y)
				break
		if not world.can_enter(pr, pr.x, pr.y, pr.z) and not pr.dead:
			_kill_proj(pr)


const DIR_ANGLE := {4: 0.0, 5: -PI / 4, 1: -PI / 2, 9: -PI * 3 / 4, 8: PI, 10: PI * 3 / 4, 2: PI / 2, 6: PI / 4}


## Beams (ProjectilesJustin.dm): the head appears on the tile in front of the shooter and leaves
## a trail piece ("<state>t") on every tile it passes. Diagonal shots turn the straight sprite 45°
## and stretch the trail pieces so they join up.
func _setup_beam(pr: Mob) -> void:
	pr.invisible = true          # shown once it reaches the tile in front (first step)
	for cand in [pr.state + "t", pr.state + " trail"]:
		if Data.has_state(pr.icon, cand):
			pr.trail_state = cand
			break
	# Diagonals always use the east-facing sprite turned 45°: even the 8-direction beam sprites'
	# diagonal frames don't join up from tile to tile.
	if pr.dir in [5, 6, 9, 10]:
		pr.face = 4
		pr.rot = DIR_ANGLE[pr.dir]


func update_projectiles() -> void:
	for pr in projectiles:
		if pr.dead or now < pr.next_step or now < pr.hover_until:
			continue
		if pr.tech.get("kind", "") == "missile":
			_missile_step(pr)
			continue
		if pr.tech.get("kind", "") == "bigball":
			_bigball_step(pr)
			continue
		var spd := 900.0 / maxf(4.0, float(pr.tech.get("speed", 18)))
		pr.next_step = now + clampf(spd, 25.0, 80.0)
		if pr.homing:
			var tg := _nearest_to(pr.x, pr.y, pr.z, 12)
			if tg:
				pr.dir = dir_to(signi(tg.x - pr.x), signi(tg.y - pr.y))
		var nx: int = pr.x + Data.DIR_DX[pr.dir]
		var ny: int = pr.y + Data.DIR_DY[pr.dir]
		var hit: Mob = null
		for o in world.at(nx, ny, pr.z):
			if o != pr.owner and not o.dead and o.kind == "monster":
				hit = o
				break
		var tur := Data.turf(nx, ny, pr.z)
		if hit:
			_blast_hit(pr, hit, nx, ny)
			if pr.dead:
				continue
		if tur.is_empty() or int(tur.get("dense", 0)) == 1 or pr.steps <= 0:
			# ProjectilesJustin.dm Move()/Bump(): a splash blast also goes off where it stops
			if int(pr.tech.get("splash", 0)) > 0:
				_explosion(pr.x, pr.y, pr.z, int(pr.tech["splash"]), pr.damage * 0.5, null)
			_kill_proj(pr)
			continue
		if pr.tech.get("beam", 0) and pr.invisible:
			# first step: appear on the tile in front of the shooter, no trail under them
			world.move(pr, nx, ny, pr.z, 0, now)
			pr.invisible = false
			pr.steps -= 1
			continue
		if pr.tech.get("beam", 0) and pr.trail_state != "":
			var tr := Mob.new()
			tr.kind = "proj"
			tr.x = pr.x
			tr.y = pr.y
			tr.z = pr.z
			tr.from_x = tr.x
			tr.from_y = tr.y
			tr.dir = pr.dir
			tr.icon = pr.icon
			tr.state = pr.trail_state
			tr.face = pr.face
			tr.rot = pr.rot
			if pr.rot != 0.0:
				tr.stretch = 1.5
			tr.layer = 4.9
			tr.dense = false
			world.add(tr)
			pr.trail.append(tr)
		world.move(pr, nx, ny, pr.z, pr.next_step - now, now)
		pr.steps -= 1
	projectiles = projectiles.filter(func(p): return not p.dead)


## A blast reaching a monster: ProjectilesJustin.dm dmg(): Damage - kidefense*ki_res/100
## (at least 1), then Explosion(splashrange) around it with splashdmg for everyone else.
func _blast_hit(pr: Mob, hit: Mob, x: int, y: int) -> void:
	_hit_monster(hit, pr.damage + (roundf(pr.damage * 0.35) if pr.crit else 0.0), Color(1, 0.4, 0.3) if pr.crit else Color(0.5, 0.9, 1), "ki")
	if randf() < 0.1:
		_skill_exp("ki_power", 1 + int(P["level"]) / 1250)
	if int(pr.tech.get("splash", 0)) > 0:
		_explosion(x, y, pr.z, int(pr.tech["splash"]), pr.damage * float(pr.tech.get("splashk", 0.5)), hit)
	if not pr.tech.get("pierce", 0):
		_kill_proj(pr)


func _turn(d: int, quarter_turns: int) -> int:
	# BYOND turn(): positive = counter-clockwise. quarter_turns counts 45-degree steps.
	var order := [1, 9, 8, 10, 2, 6, 4, 5]          # N, NW, W, SW, S, SE, E, NE
	var i := order.find(d)
	return order[(i + quarter_turns + 8) % 8]


func _nearest_to(x: int, y: int, z: int, r: int) -> Mob:
	var best: Mob = null
	var bd := r + 1
	for m in monsters:
		if m.dead or m.z != z:
			continue
		var dd := maxi(absi(m.x - x), absi(m.y - y))
		if dd < bd:
			bd = dd
			best = m
	return best


# =================================================================== missiles
## Rapid Blast, Ki/Flame Shower, Shine Missile (/obj/Tech/KiMissile) and Hell Zone Grenade,
## Acid Rain, Genocide (ScatterBlast...): Technique_Procs.dm Scatter(). Power is
## (PL*a + Ki*b) * ki_power/100 / count; each ball homes on the nearest monster in 12 tiles.
func _missiles(t: Dictionary) -> void:
	var setp: Dictionary = t.get("setp", {})
	var sp := 0.0
	for stat in setp:
		var v: float = float(P["powerlevel"]) if stat == "powerlevel" else (float(P["ki"]) if stat == "ki" else cap(stat))
		sp += maxf(v, 0.0) * float(setp[stat])
	sp *= skill("ki_power") / 100.0
	var power := roundf(sp / float(t.get("div", 10)))
	var n := int(t.get("count", 3))
	for lv in t.get("extra", []):
		if int(P["level"]) > int(lv):
			n += 1
	var offs: Array = t.get("offsets", [])
	var gap := float(t.get("gap", 0.2)) * 1000.0
	var hover := float(t.get("hover", 0.1)) * 1000.0
	var d := pe.dir
	for i in n:
		var o: Array = offs[i] if i < offs.size() else [0, 0]
		after(i * gap, func(): _spawn_missile(t, power, d, int(o[0]), int(o[1]), hover))


func _spawn_missile(t: Dictionary, power: float, d: int, ox: int, oy: int, hover: float) -> void:
	if pe == null:
		return
	var pr := Mob.new()
	pr.kind = "proj"
	pr.x = pe.x + ox
	pr.y = pe.y + oy
	pr.z = pe.z
	pr.from_x = pr.x
	pr.from_y = pr.y
	pr.dir = d
	pr.icon = Data.icon_id(t.get("icon", "techs.dmi"))
	pr.state = t.get("state", "blast")
	pr.layer = 5.0
	pr.dense = false
	pr.owner = pe
	pr.power = power
	pr.tech = t
	pr.steps = 40
	pr.homing = true
	pr.hover_until = now + hover
	world.add(pr)
	projectiles.append(pr)


func _missile_step(pr: Mob) -> void:
	pr.next_step = now + 70.0
	var tg := _nearest_to(pr.x, pr.y, pr.z, 12)
	if tg:
		pr.dir = dir_to(signi(tg.x - pr.x), signi(tg.y - pr.y))
	var nx: int = pr.x + Data.DIR_DX[pr.dir]
	var ny: int = pr.y + Data.DIR_DY[pr.dir]
	var tur := Data.turf(nx, ny, pr.z)
	if pr.steps <= 0 or tur.is_empty() or int(tur.get("dense", 0)) == 1:
		_kill_proj(pr)
		return
	world.move(pr, nx, ny, pr.z, 70.0, now)
	pr.steps -= 1
	for m in world.at(nx, ny, pr.z):
		if m.kind == "monster" and not m.dead:
			# damage = (your PL + power*0.6-1.0) - (their PL + kidefense*ki_res/100), at least power
			var dmg := maxf(pr.power, roundf((float(P["powerlevel"]) + pr.power * randf_range(0.6, 1.0)) - (m.powerlevel + m.kidefense * m.ki_res / 100.0)))
			_hit_monster(m, dmg, Color(0.6, 0.85, 1), "")
			if not m.dead:      # ExplodeDamage(): the blast goes off on the target as well
				_hit_monster(m, maxf(1.0, pr.power - roundf(m.kidefense * m.ki_res)), Color(1, 0.7, 0.3), "")
			_boom_fx(nx, ny, pr.z, "explosion.dmi", 400.0)
			_kill_proj(pr)
			return


# =================================================================== big balls
## Big Bang Attack, Burning Attack, Blaster Shell, Revenge Death Ball: nine 32x32 pieces of a
## 96x96 ball ("bb c", "bb tl"...) that fly together (BangAttack2). Each piece hits for
## power*0.8-1.2 - (their PL + kidefense*ki_res/100), at least power/4, then loses their PL.
func _bigball(t: Dictionary) -> void:
	var setp: Dictionary = t.get("setp", {})
	var sp := 0.0
	for stat in setp:
		var v: float = float(P["powerlevel"]) if stat == "powerlevel" else (float(P["ki"]) if stat == "ki" else cap(stat))
		sp += maxf(v, 0.0) * float(setp[stat])
	var power := roundf(sp * skill("ki_power") / 100.0)
	var d := pe.dir
	if d in [5, 9]:
		d = 1
	elif d in [6, 10]:
		d = 2
	var pre: String = t.get("prefix", "bb")
	var icon := Data.icon_id(t.get("icon", "burning attack.dmi"))
	var head: Mob = null
	for part in [["c", 0, 0], ["tl", -32, 32], ["t", 0, 32], ["tr", 32, 32], ["l", -32, 0], ["r", 32, 0], ["bl", -32, -32], ["b", 0, -32], ["br", 32, -32]]:
		var pc := Mob.new()
		pc.kind = "proj"
		pc.x = pe.x + Data.DIR_DX[d]
		pc.y = pe.y + Data.DIR_DY[d]
		pc.z = pe.z
		pc.from_x = pc.x
		pc.from_y = pc.y
		pc.dir = d
		pc.icon = icon
		pc.state = "%s %s" % [pre, part[0]]
		pc.pixel_x = part[1]
		pc.pixel_y = part[2]
		pc.layer = 5.5
		pc.dense = false
		world.add(pc)
		if head == null:
			head = pc
		else:
			head.pieces.append(pc)
		head.pow_left.append(power)
	head.owner = pe
	head.tech = t
	head.steps = 20
	head.next_step = now + 80.0
	projectiles.append(head)
	_bigball_hits(head)


func _bigball_step(pr: Mob) -> void:
	pr.next_step = now + 80.0
	var nx: int = pr.x + Data.DIR_DX[pr.dir]
	var ny: int = pr.y + Data.DIR_DY[pr.dir]
	var tur := Data.turf(nx, ny, pr.z)
	if pr.steps <= 0 or tur.is_empty() or int(tur.get("dense", 0)) == 1 or pr.pow_left.max() <= 0:
		_remove_all(pr.pieces)
		_kill_proj(pr)
		return
	_boom_fx(pr.x, pr.y, pr.z, "dirt.dmi", 10000.0, 3.5)      # T.overlays += 'Dirt.dmi' for 10 s
	world.move(pr, nx, ny, pr.z, 80.0, now)
	for pc in pr.pieces:
		world.move(pc, nx, ny, pr.z, 80.0, now)
	pr.steps -= 1
	_bigball_hits(pr)


func _bigball_hits(pr: Mob) -> void:
	for m in world.at(pr.x, pr.y, pr.z):
		if m.kind != "monster" or m.dead:
			continue
		var total := 0.0
		for i in pr.pow_left.size():
			var pw: float = pr.pow_left[i]
			if pw <= 0:
				continue
			var dmg := maxf(roundf(pw / 4.0), roundf(pw * randf_range(0.8, 1.2) - (m.powerlevel + m.kidefense * m.ki_res / 100.0)))
			pr.pow_left[i] = pw - maxf(m.powerlevel, 0.0)
			total += dmg
		if total > 0:
			_hit_monster(m, total, Color(1, 0.75, 0.3), "")


# =================================================================== explosion techniques
## Explosive Wave / Super Explosion Wave / Final Explosion (Techniques*.dm), see build_rules.py.
func _wave(t: Dictionary) -> void:
	if pe.flying:
		msg("You can't use this technique while flying", Color(1, 0.4, 0.4))
		return
	var w: String = t.get("wave", "explosive")
	var cx := pe.x
	var cy := pe.y
	var cz := pe.z
	pe.stun_until = now + 700.0
	pe.state = "enrage" if Data.has_state(pe.icon, "enrage") else pe.state
	match w:
		"explosive":
			var dmg := roundf(float(P["powerlevel"]) / 2.0)
			after(500, func(): _basic_boom(cx, cy, cz, 3))
			after(700, func():
				_basic_boom(cx, cy, cz, 5)
				for m in monsters.keys():
					if m.dead or m.z != cz:
						continue
					var dist := maxi(absi(m.x - cx), absi(m.y - cy))
					if dist <= int(t.get("radius", 3)) and dist > 0:
						var kidefcalc := roundf(m.defence * 0.4 * m.ki_res / 100.0)
						_hit_monster(m, maxf(0.0, dmg - roundf(kidefcalc / 125.0) / ((2.0 + dist) / 2.0)), Color(1, 0.6, 0.2), "")
				_update_state())
		"sew":
			var dmg := roundf(cap("ki") * skill("ki_power") / 100.0 / 3.0)
			var i := 0
			for r in t.get("pulses", [2, 3, 4]):
				var rr := int(r)
				after(500 + i * 400, func(): _sew_pulse(cx, cy, cz, rr, dmg))
				i += 1
			after(500 + i * 400, func(): _update_state())
		"final":
			var base := roundf(maxf(float(P["ki"]), 0.0) * skill("ki_power") / 100.0)
			after(700, func():
				_basic_boom(cx, cy, cz, 4)
				after(200, func(): _basic_boom(cx, cy, cz, 8))
				for m in monsters.keys():
					if m.dead or m.z != cz:
						continue
					var dist := maxi(absi(m.x - cx), absi(m.y - cy))
					if dist <= 8 and dist > 0:
						_hit_monster(m, maxf(0.0, base / ((2.0 + dist) / 2.0)), Color(1, 0.5, 0.2), "")
				P["powerlevel"] = 0.0
				player_ko(null, "You used up all your energy in a Final Explosion!"))


func _sew_pulse(cx: int, cy: int, cz: int, r: int, dmg: float) -> void:
	# ExplosionSEW(): every tile in range(r); dmg - kidefcalc/400
	# Same ground fire + scorch look as Explosive Wave (explosion.dmi is the projectile splash).
	for dx in range(-r, r + 1):
		for dy in range(-r, r + 1):
			_boom_fx(cx + dx, cy + dy, cz, "explosionaoe.dmi", 500.0)
			_boom_fx(cx + dx, cy + dy, cz, "dirt.dmi", 1000.0, 3.5)
	for m in monsters.keys():
		if m.dead or m.z != cz or maxi(absi(m.x - cx), absi(m.y - cy)) > r:
			continue
		var kidefcalc := roundf(m.defence * 0.4 * m.ki_res / 100.0)
		_hit_monster(m, maxf(1.0, roundf(dmg - kidefcalc / 400.0)), Color(1, 0.6, 0.2), "")


## Explosion.dm BasicBoom: fire spreading out ring by ring (one ring per tick), leaving dirt.
func _basic_boom(cx: int, cy: int, cz: int, power: int) -> void:
	for dx in range(-power + 1, power):
		for dy in range(-power + 1, power):
			var dist := maxi(absi(dx), absi(dy))
			var tur := Data.turf(cx + dx, cy + dy, cz)
			if tur.is_empty() or int(tur.get("dense", 0)) == 1:
				continue
			var x := cx + dx
			var y := cy + dy
			after(dist * 60.0, func():
				_boom_fx(x, y, cz, "explosionaoe.dmi", 300.0)     # fire.dmi is empty in the source; this is its AoE fire
				_boom_fx(x, y, cz, "dirt.dmi", 1000.0, 3.5))


## A short-lived sprite on a tile (explosion, fire, scorched dirt).
func _boom_fx(x: int, y: int, z: int, icon_name: String, ms: float, layer := 6.0) -> void:
	var ic := Data.icon_id(icon_name)
	if ic < 0 or pe == null or z != pe.z:
		return
	var fx := Mob.new()
	fx.kind = "fx"
	fx.x = x
	fx.y = y
	fx.z = z
	fx.from_x = x
	fx.from_y = y
	fx.icon = ic
	fx.layer = layer
	fx.dense = false
	fx.flick = {"state": "", "start": now, "end": now + ms}
	world.add(fx)
	after(ms, func(): world.remove(fx))


func _kill_proj(pr: Mob) -> void:
	pr.dead = true
	world.remove(pr)
	_remove_all(pr.trail)        # the trail goes with the head (ProjectilesJustin.dm: del(T) on Del)
	pr.trail = []


func _remove_all(lst: Array) -> void:
	for t in lst:
		world.remove(t)


func _hit_monster(m: Mob, raw: float, col: Color, mode := "melee") -> void:
	if m.dead:
		return
	var dmg := raw
	match mode:
		"ki":       # ki blast direct hit (dmg(): Damage - kidefense*ki_res/100)
			dmg = raw - m.kidefense * (m.ki_res / 100.0)
		"splash":   # Explosion(): dmg - defence*0.4*ki_res/100
			dmg = raw - roundf(m.defence * 0.4 * (m.ki_res / 100.0))
		"melee":
			dmg = raw - m.defence * 0.04
	dmg = maxf(1.0, roundf(dmg))
	m.powerlevel -= dmg
	m.target = pe
	world.floater(m.x, m.y, m.z, fmt(dmg), col)
	if m.powerlevel <= 0:
		monster_die(m)


## explosionAoEJustin.dm Explosion(): explosion.dmi on every tile within range(r) for 0.4 s;
## every monster in it except the one hit takes the splash damage (minus 40% of its defence,
## scaled by ki resistance); the shooter takes a tenth if caught in it.
func _explosion(x: int, y: int, z: int, r: int, dmg: float, skip: Mob) -> void:
	for dx in range(-r, r + 1):
		for dy in range(-r, r + 1):
			_boom_fx(x + dx, y + dy, z, "explosion.dmi", 400.0)
	for m in monsters.keys():
		if m == skip or m.dead or m.z != z:
			continue
		if maxi(absi(m.x - x), absi(m.y - y)) <= r:
			_hit_monster(m, dmg, Color(1, 0.6, 0.2), "splash")
	if pe != null and pe.z == z and maxi(absi(pe.x - x), absi(pe.y - y)) <= r and dmg > 0:
		P["powerlevel"] = maxf(1.0, float(P["powerlevel"]) - roundf(dmg / 10.0))


# =================================================================== monster AI
func think(m: Mob) -> void:
	m.next_think = now + (randf_range(380.0, 650.0) if (m.target or m.aggro) else randf_range(1500.0, 3500.0))
	if now < m.stun_until:
		return
	if now < m.dot_until:
		_hit_monster(m, m.dot_amount, Color(0.6, 1, 0.4))
		if m.dead:
			return
	var dx := pe.x - m.x
	var dy := pe.y - m.y
	var dist := maxi(absi(dx), absi(dy))
	var can_hunt := not Data.is_safe(pe.x, pe.y, pe.z) and not traveling
	var engaged := m.target == pe or (m.aggro and dist <= 12 and int(P["level"]) >= PK_LEVEL and can_hunt)
	if engaged and dist <= 14 and can_hunt:
		if dist <= 1:
			m.dir = dir_to(dx, dy)
			if now >= m.next_attack:
				m.next_attack = now + randf_range(900.0, 1400.0)
				monster_attack(m)
		else:
			_chase(m, dx, dy)
		return
	m.target = null
	if m.powerlevel < m.powerlevel_max:
		m.powerlevel = minf(m.powerlevel_max, m.powerlevel + m.powerlevel_max * 0.05)
	if randf() < 0.35:
		var d: int = [1, 2, 4, 8][randi() % 4]
		if absi(m.x - m.home.x) > 5 or absi(m.y - m.home.y) > 5:
			d = dir_to(m.home.x - m.x, m.home.y - m.y)
		_step_mob(m, d)


func _chase(m: Mob, dx: int, dy: int) -> void:
	if _step_mob(m, dir_to(dx, dy)):
		return
	if dx != 0 and _step_mob(m, 4 if dx > 0 else 8):
		return
	if dy != 0 and _step_mob(m, 1 if dy > 0 else 2):
		return
	_step_mob(m, [1, 2, 4, 8][randi() % 4])


func _step_mob(m: Mob, d: int) -> bool:
	var nx: int = m.x + Data.DIR_DX[d]
	var ny: int = m.y + Data.DIR_DY[d]
	m.dir = d
	if not world.can_enter(m, nx, ny, m.z) or Data.is_safe(nx, ny, m.z):
		return false
	if Data.turf(nx, ny, m.z).has("enter"):
		return false
	world.move(m, nx, ny, m.z, 280, now)
	return true


# =================================================================== training
func toggle_busy(kind: String) -> void:
	if busy == kind:
		stop_busy()
		return
	if busy != "":
		stop_busy()
	if kind != "rest" and tired():
		msg("You are too tired. Rest first!", Color(1, 0.4, 0.4))
		return
	if pe.flying and kind != "power":
		msg("Not while flying.", Color(1, 0.4, 0.4))
		return
	if kind == "rest" and float(P["stam"]) <= 0 and float(P["powerlevel"]) >= cap("powerlevel") * 0.999:
		msg("You aren't tired.", Color(0.8, 0.8, 0.8))
		return
	busy = kind
	busy_next = now + 600.0
	match kind:
		"selftrain": msg("You begin shadow boxing. (Focus: %s)" % P["focus"], Color(0.6, 0.85, 1))
		"meditate": msg("You begin meditating on %s." % SKILL_NAMES[P["med_focus"]], Color(0.6, 0.85, 1))
		"rest": msg("You sit down and rest.", Color(0.6, 0.85, 1))
		"power": msg("You begin powering up!", Color(1, 0.85, 0.4))
	_update_state()
	build_appearance()


func stop_busy() -> void:
	if busy == "":
		return
	var was := busy
	busy = ""
	_update_state()
	if was == "power":
		build_appearance()


func _update_state() -> void:
	if pe == null:
		return
	match busy:
		"meditate", "rest":
			pe.state = "meditate"
		"selftrain":
			pe.state = "spar fury"
		_:
			pe.state = "flight" if pe.flying and Data.has_state(pe.icon, "flight") else ""


func busy_tick() -> void:
	match busy:
		"selftrain":
			busy_next = now + 600.0
			if tired():
				msg("You collapse on the floor trying to catch your breath.", Color(1, 0.5, 0.4))
				stop_busy()
				return
			self_train_tick()
		"meditate":
			busy_next = now + 2400.0
			if tired():
				stop_busy()
				return
			var se := (5 + int(P["level"]) / 1000) * 2
			if gravtrain > 0.0:
				se *= 2
			_skill_exp(P["med_focus"], se)
			var skm: Array = P["skills"][P["med_focus"]]
			tick("%s exp +%d (%d / %d, level %d)" % [SKILL_NAMES[P["med_focus"]], se, int(skm[1]), int(skm[2]), int(skm[0])], gravtrain > 0.0)
			P["ki"] = minf(cap("ki"), float(P["ki"]) + cap("ki") * 0.05)
			fatigue(4)
			world.floater(pe.x, pe.y, pe.z, "+%d %s" % [se, SKILL_NAMES[P["med_focus"]]], Color(0.6, 0.8, 1))
		"rest":
			busy_next = now + 1000.0
			var mx: float = P["stam_max"]
			P["stam"] = maxf(0.0, float(P["stam"]) - randf_range(mx / 20.0, mx / 10.0))
			var k := ((kc() * 100.0 / 30.0) * (kc() * 100.0 / 20.0) + 1.0) / 5.0
			P["powerlevel"] = minf(cap("powerlevel"), float(P["powerlevel"]) + pl_max() / 50.0 * k + cap("powerlevel") * 0.02)
			P["ki"] = minf(cap("ki"), float(P["ki"]) + float(P["ki_max"]) / 50.0 * k + cap("ki") * 0.02)
			if float(P["stam"]) <= 0 and float(P["powerlevel"]) >= cap("powerlevel") * 0.999:
				msg("You feel rested.", Color(0.6, 1, 0.6))
				stop_busy()
		"power":
			busy_next = now + 500.0
			P["powerlevel"] = minf(cap("powerlevel"), float(P["powerlevel"]) + cap("powerlevel") / 10.0)
			P["ki"] = minf(cap("ki"), float(P["ki"]) + cap("ki") / 10.0)
			fatigue(3)
			if float(P["powerlevel"]) >= cap("powerlevel") and float(P["ki"]) >= cap("ki"):
				msg("You are fully powered up.", Color(1, 0.85, 0.4))
				stop_busy()


func self_train_tick() -> void:
	var lvl := float(P["level"])
	var moden := float(P["moden"])
	var expgain := roundf((randf_range(5, 20) + lvl / 250.0) * 1.2 * 4.0) + 1.0
	var zen := roundf(randf_range(15, 600) + lvl / 2.0)
	# Character_Up: stat gains in the chosen focus
	var lg := minf(lvl, 200000.0)
	lg = randf_range(lg * 0.3, lg * 0.5)
	var focus: String = P["focus"]
	var boosted := gravtrain > 0.0 or buffs.has("exp")
	if randf() < 0.66 and randf() < 0.25:
		var g := 0.0
		match focus:
			"Powerlevel":
				g = maxf(roundf((randf_range(2, 6) + lg * moden) * float(P["power_multi"]) / 5.0 / 15.0 * 0.65), randf_range(10, 25)) * (1.0 + gravtrain)
				P["pl_bonus"] = float(P["pl_bonus"]) + g
				tick("Powerlevel +%s" % fmt(g), boosted)
			"Ki":
				g = maxf(roundf((randf_range(1, 4) + lg * moden) * float(P["ki_multi"]) / 5.0 / 20.0 * 0.65), randf_range(10, 25)) * (1.0 + gravtrain)
				P["ki_max"] = float(P["ki_max"]) + g
				tick("Ki +%s" % fmt(g), boosted)
			"Strength":
				g = maxf(roundf((randf_range(1, 4) + lg * moden) * float(P["strength_multi"]) / 5.0 / 20.0 * 0.65), randf_range(10, 25)) * (1.0 + gravtrain)
				P["strength_max"] = float(P["strength_max"]) + g
				tick("Strength +%s" % fmt(g), boosted)
			"Defense":
				g = maxf(roundf((randf_range(1, 4) + lg * moden) * float(P["defence_multi"]) / 5.0 / 20.0 * 0.65), randf_range(10, 25)) * (1.0 + gravtrain)
				P["defence_max"] = float(P["defence_max"]) + g
				tick("Defense +%s" % fmt(g), boosted)
			"Exp":
				expgain *= 1.5
	if randf() < 1.0 / 12.0:
		var k: String = ["ki_max", "strength_max", "defence_max"][randi() % 3]
		P[k] = float(P[k]) + 4.0
		tick("%s +4" % {"ki_max": "Ki", "strength_max": "Strength", "defence_max": "Defense"}[k])
	if buffs.has("exp"):
		expgain *= float(buffs["exp"]["mult"])
	if gravtrain > 0.0:
		expgain += expgain * gravtrain
	P["exp"] = float(P["exp"]) + expgain
	if randf() < 0.05:
		var tpg := roundf((randi_range(3, 12) + int(moden * 2)) * (1.0 + gravtrain))
		P["tp"] = float(P["tp"]) + tpg
		tick("Training points +%s" % fmt(tpg), boosted)
	if randf() < 0.15:
		P["zenni"] = float(P["zenni"]) + zen
		tick("Zenni +%s" % fmt(zen))
	fatigue(2)
	level_up()


func choose_focus() -> void:
	var opts: Array = []
	for f in FOCUS:
		opts.append("Train: " + f)
	for s in SKILLS:
		opts.append("Meditate: " + SKILL_NAMES[s])
	opts.append("Cancel")
	ask("Training Focus", "Self Train focus: %s\nMeditation focus: %s" % [P["focus"], SKILL_NAMES[P["med_focus"]]], opts, _on_focus)


func _on_focus(c: String, _i: int) -> void:
	if c.begins_with("Train: "):
		P["focus"] = c.substr(7)
		msg("Self Train will now focus on %s." % P["focus"], Color(0.6, 0.85, 1))
	elif c.begins_with("Meditate: "):
		var nm := c.substr(10)
		for s in SKILLS:
			if SKILL_NAMES[s] == nm:
				P["med_focus"] = s
		msg("You will meditate on %s." % nm, Color(0.6, 0.85, 1))


func _skill_exp(s: String, amount: float) -> void:
	var sk: Array = P["skills"][s]
	if sk[0] >= 100:
		return
	sk[1] += amount
	while sk[1] >= sk[2] and sk[0] < 100:
		sk[1] -= sk[2]
		sk[2] = roundf(sk[2] * 1.1)
		sk[0] += 1
		tick("%s increased to %d!" % [SKILL_NAMES[s], int(sk[0])], true)
		if s == "ki_control" and sk[0] >= 100:
			skill_gain(false)


# =================================================================== levels
func level_up() -> void:
	var leveled := false
	var guard := 0
	while float(P["exp"]) >= float(P["tnl"]) and guard < 5000:
		guard += 1
		var L := float(P["level"])
		var kg := (randf_range(1, 4) + L * 0.1 * float(P["ki_multi"]) / 5.0) / 2.0
		var sg := (randf_range(1, 4) + L * 0.1 * float(P["strength_multi"]) / 5.0) / 2.0
		var dg := (randf_range(1, 4) + L * 0.1 * float(P["defence_multi"]) / 5.0) / 2.0
		P["exp"] = float(P["exp"]) - float(P["tnl"])
		P["level"] = int(P["level"]) + 1
		P["ki_max"] = float(P["ki_max"]) + kg
		P["strength_max"] = float(P["strength_max"]) + sg
		P["defence_max"] = float(P["defence_max"]) + dg
		P["tnl"] = float(P["tnl"]) + float(P["expup"])
		leveled = true
		var lv := int(P["level"])
		var mi := int(P["modes"])
		if mi < MODES.size() and lv >= int(MODES[mi][0]):
			P["expup"] = float(P["expup"]) + float(MODES[mi][1])
			P["moden"] = int(P["moden"]) + 1
			P["mode"] = MODES[mi][2]
			P["modes"] = mi + 1
			msg("Training Information: you have entered %s Mode!" % P["mode"], Color(0.4, 0.6, 1))
		if lv == PK_LEVEL:
			msg("You can now use battle techniques and fight monsters!", Color(1, 0.75, 0.2))
	if leveled:
		skill_gain(false)


## Skill_Gain(): learn techniques by race / gene / level.
func skill_gain(silent: bool, ignore_level := false) -> void:
	var learned: Array = P["learned"]
	for e in Data.rules["learn"]:
		var tkey: String = e["tech"]
		if tkey in learned:
			continue
		if e.has("race") and e["race"] != P["race"]:
			continue
		if e.has("gene") and e["gene"] != P["gene"]:
			continue
		if int(P["level"]) < int(e["level"]) and not ignore_level:
			continue
		var req = e.get("req")
		if req == "weapon":
			continue
		if req == "ki_control_mastered" and float(P["skills"]["ki_control"][0]) < 100 and not ignore_level:
			continue
		if Data.tech(tkey).is_empty():
			continue
		_learn(tkey, silent)


# =================================================================== test menu
## Test helpers behind the Test button: level up N times, refill, learn everything, teleport.
func test_level_up(n: int) -> void:
	var start_lv := int(P["level"])
	for i in n:
		P["exp"] = float(P["tnl"])
		level_up()
	P["powerlevel"] = cap("powerlevel")
	P["ki"] = cap("ki")
	msg("Test: level %d → %d." % [start_lv, int(P["level"])], Color(0.6, 1, 0.6))


func test_restore() -> void:
	P["powerlevel"] = cap("powerlevel")
	P["ki"] = cap("ki")
	P["stam"] = 0.0
	msg("Test: powerlevel and Ki refilled, fatigue cleared.", Color(0.6, 1, 0.6))


func test_learn_all() -> void:
	var before: int = P["learned"].size()
	skill_gain(false, true)
	for path in TEACHERS:
		for e in TEACHERS[path]:
			if _teachable(e, true):
				_learn(e[0])
	msg("Test: learned %d techniques." % (P["learned"].size() - before), Color(0.6, 1, 0.6))


## Map placements as teleport targets. kind "npc" or "monster"; one entry per name per area.
func test_targets(kind: String, it_only := false) -> Array:
	var seen := {}
	var out: Array = []
	for e in Data.map["entities"]:
		var t: Dictionary = Data.types.get(str(int(e[0])), {})
		var p: String = t.get("path", "")
		if not p.begins_with("/mob") or t.has("invis") or p.begins_with("/mob/Gravity_Room"):
			continue
		var is_mon := p.begins_with("/mob/Monster/")
		if is_mon != (kind == "monster"):
			continue
		if it_only and not p.begins_with("/mob/NPC"):
			continue
		var nm: String = t.get("name", "")
		if is_mon:
			nm = str(Data.mobs.get(p, {}).get("name", nm))
		if nm == "":
			nm = p.get_file().replace("_", " ")
		var z := int(e[3])
		var k := "%s|%d" % [nm, z]
		if seen.has(k):
			seen[k][4] += 1
			continue
		var row := [nm, int(e[1]), int(e[2]), z, 1]
		seen[k] = row
		out.append(row)
	out.sort_custom(func(a, b): return a[3] < b[3] if a[3] != b[3] else a[0].naturalnocasecmp_to(b[0]) < 0)
	return out


# =================================================================== instant transmission
## Instant Transmittion.dm: pick an NPC's energy signal, pay 500 Ki, stand still while you lock
## on (3 s, 1.5 s for the Yardrat gene), then appear next to them. Not from z 8 and up, not while
## gravity is on, and a 6 s lock afterwards.
var it_lock_until := 0.0
var it_busy := false
var _it_rows: Array = []


func instant_transmission() -> void:
	if it_busy or now < it_lock_until:
		msg("Cannot use this Technique right now.", Color(1, 0.5, 0.4))
		return
	if busy != "":
		msg("You are already doing something.", Color(1, 0.5, 0.4))
		return
	if grav > 0:
		return
	if pe.z >= 8:
		msg("You cannot use instant transmission while in this zone!", Color(1, 0.5, 0.4))
		return
	_it_rows = test_targets("npc", true)
	var opts: Array = ["Cancel"]
	for r in _it_rows:
		opts.append("%s (%s)" % [r[0], zname(r[3])])
	ask("Instant Transmission", "IT to who?", opts, _on_it_pick)


func _on_it_pick(_c: String, i: int) -> void:
	if i == 0:
		return
	var r: Array = _it_rows[i - 1]
	if float(P["ki"]) < 500.0:
		msg("You do not have enough Ki!", Color(1, 0.5, 0.4))
		return
	if busy != "" or it_busy:
		msg("You are already doing something.", Color(1, 0.5, 0.4))
		return
	var ms := 3000.0 if P.get("gene", "") != "Yardrat" else 1500.0
	P["ki"] = float(P["ki"]) - 500.0
	it_busy = true
	it_lock_until = now + ms + 600.0 + 6000.0
	set_move_dir(0)
	pe.stun_until = now + ms + 600.0
	pe.state = "IT" if Data.has_state(pe.icon, "IT") else pe.state
	msg("Locating %s's energy signal..." % r[0], Color(0.8, 0.85, 1))
	after(ms, func(): msg("%s Found!" % r[0], Color(0.8, 0.85, 1)))
	after(ms + 600.0, func(): _it_arrive(r))


func _it_arrive(r: Array) -> void:
	it_busy = false
	_update_state()
	if pe.dead:
		return
	teleport(int(r[1]), int(r[2]) - 1, int(r[3]))      # in front of them (they block their own tile)
	pe.do_flick("IT", now)
	msg("%s appears from nowhere!" % P["name"], Color(0.6, 0.85, 1))


func test_teleport(x: int, y: int, z: int) -> void:
	stop_busy()
	teleport(x, y, z)
	msg("Test: teleported to %s (%d,%d)." % [zname(z), pe.x, pe.y], Color(0.6, 1, 0.6))


func _is_utility(key: String) -> bool:
	return Data.tech(key).get("kind", "utility") in UTILITY_KINDS


## Actions shown in the on-screen action panel (base actions + learned utility techniques).
## The round (dragon ball) buttons: only what you can actually do right now.
## Training actions live behind the Train button at the top.
func panel_actions() -> Array:
	# Fixed set and order: Rest, Talk, Fly, Power Up, Power Down, Transform, Revert.
	# Rest and Talk are always there; the rest only once you can use them.
	var out: Array = ["rest", "talk"]
	for k in ["Fly", "PowerUp", "PowerDown"]:
		if k in P.get("learned", []):
			out.append("t:" + k)
	if not available_forms().is_empty():
		out.append("transform")
	if int(P.get("form", 0)) > 0 and can_revert():
		out.append("revert")
	return out


func is_active(id: String) -> bool:
	match id:
		"selftrain": return busy == "selftrain"
		"meditate": return busy == "meditate"
		"rest": return busy == "rest"
		"t:PowerUp": return busy == "power"
		"t:Fly": return pe != null and pe.flying
		"revert": return int(P.get("form", 0)) > 0
	return false


func _auto_hotbar(id: String) -> void:
	var hb: Array = P["hotbar"]
	if id in hb:
		return
	for i in hb.size():
		if hb[i] == "":
			hb[i] = id
			return


# =================================================================== transform
# =================================================================== transformations
## Transformations/*.dm. Two kinds:
##  * menu races (Saiyan, Half Saiyan, Human, Changeling...): Transform opens "Which form would you
##    like to transform to?" with every form you qualify for; each form multiplies your BASE stats
##    (some by x + trans_lvl/20). You must revert before picking another.
##  * step races (Namekian, Majin, Android, Dragon...): each Transform goes one form further and
##    multiplies your CURRENT stats again, so the forms stack.
## Transforming takes trans_spd/10 seconds (5.1 s at first, quicker as Transformation Speed rises),
## with blue lightning around you and an explosion ring at the end. Staying transformed costs
## nothing; time in a form raises your Transformation level (Trans_Gain).
const NO_REVERT := {"Android": ["Mechanical", "Bionic"], "Bio Android": ["Pure Blooded", "Perfect"], "Alien": ["Hitman"], "Kai": ["Zealot"]}
var transforming := false


func _tdef(k: String, v: float) -> float:
	if not P.has(k):
		P[k] = v
	return float(P[k])


func trans_lvl() -> float:
	return _tdef("trans_lvl", 0.0)


func form_mult(key: String) -> float:
	var cur := int(P.get("form", 0))
	if cur <= 0:
		return 1.0
	var fl := forms_for()
	var stack := int(fl[0].get("stack", 0)) == 1
	var m := 1.0
	for i in range(0 if stack else cur - 1, mini(cur, fl.size())):
		var f: Dictionary = fl[i]
		m *= float(f.get(key, 1)) + float(f.get(key + "_t", 0)) * trans_lvl()
	return m


func form_name(f: Dictionary) -> String:
	return f.get("name", "Form %d" % int(f["form"]))


func is_step_race() -> bool:
	var fl := forms_for()
	return not fl.is_empty() and int(fl[0].get("stack", 0)) == 1


func can_revert() -> bool:
	return not P.get("gene", "") in NO_REVERT.get(P["race"], [])


## The menu lines' conditions. Counters this port doesn't keep (eats, corrupts, infects, chips,
## absorbs, assassin kills, karma) count as met.
func form_ready(f: Dictionary) -> bool:
	if int(P["level"]) < int(f.get("level", 0)):
		return false
	for c in f.get("req", []):
		var v: String = c[0]
		var have: float
		match v:
			"level": have = float(P["level"])
			"trans_lvl": have = trans_lvl()
			"powerlevel_max": have = pl_max()
			_: continue
		var want := float(c[2])
		var ok := true
		match str(c[1]):
			">=": ok = have >= want
			">": ok = have > want
			"<=": ok = have <= want
			"<": ok = have < want
			"==": ok = have == want
		if not ok:
			return false
	return true


func available_forms() -> Array:
	var fl := forms_for()
	var cur := int(P.get("form", 0))
	if is_step_race():
		return [fl[cur]] if cur < fl.size() and form_ready(fl[cur]) else []
	if cur > 0:
		return []
	return fl.filter(func(f): return form_ready(f))


func transform() -> void:
	if transforming:
		return
	if busy != "":
		stop_busy()
	var opts := available_forms()
	if opts.is_empty():
		var fl := forms_for()
		var cur := int(P["form"])
		if cur > 0 and not is_step_race():
			msg("Revert first to pick another form.", Color(0.8, 0.8, 0.8))
		elif cur >= fl.size():
			msg("You are already at your strongest form.", Color(0.8, 0.8, 0.8))
		else:
			msg("You need level %s for your next form (%s gene)." % [fmt(fl[cur]["level"]), P["gene"]], Color(1, 0.5, 0.4))
		return
	if is_step_race():
		_do_transform(int(opts[0]["form"]))
		return
	var names: Array = opts.map(func(f): return form_name(f))
	names.append("Cancel")
	ask("Transform", "Which form would you like to transform to?", names, func(c: String, i: int):
		if c != "Cancel":
			_do_transform(int(opts[i]["form"])))


func _do_transform(n: int) -> void:
	transforming = true
	var spd := _tdef("trans_spd", 51.0)
	var ms := spd * 100.0
	set_move_dir(0)
	pe.stun_until = now + ms
	pe.state = "enrage" if Data.has_state(pe.icon, "enrage") else pe.state
	_lightning()
	after(ms / 2.0, func(): _lightning())
	after(ms, func():
		transforming = false
		P["form"] = n
		P["powerlevel"] = cap("powerlevel")
		P["ki"] = cap("ki")
		# Trans_Level / Trans_Speed experience for transforming
		P["trans_exp"] = _tdef("trans_exp", 0.0) + roundf(3.0 + float(P["level"]) / 5000.0)
		P["transsexp"] = _tdef("transsexp", 0.0) + roundf(6.0 + float(P["level"]) / 2500.0)
		_trans_levels()
		P["trans_gain_at"] = float(P["playtime"]) + _trans_gain_secs()
		_update_state()
		_lightning()
		_basic_boom(pe.x, pe.y, pe.z, 3)
		var f: Dictionary = forms_for()[n - 1]
		msg("You transform! (%s: power x%s)" % [form_name(f), str(snappedf(form_mult("pl"), 0.01))], Color(1, 0.75, 0.2))
		build_appearance())


## BlueLightningEffect(): a bolt strikes somewhere within 6 tiles for two seconds.
func _lightning() -> void:
	var ic := Data.icon_id("lightning.dmi")
	if ic < 0 or pe == null:
		return
	var b := Mob.new()
	b.kind = "fx"
	b.x = pe.x + randi_range(-6, 6)
	b.y = pe.y + randi_range(-6, 6)
	b.z = pe.z
	b.from_x = b.x
	b.from_y = b.y
	b.icon = ic
	b.state = "5"
	b.layer = 9.0
	b.dense = false
	world.add(b)
	after(2000.0, func(): world.remove(b))


func _trans_gain_secs() -> float:
	return maxf(15.0, 90.0 - trans_lvl() * 0.75)          # spawn(900 - trans_lvl*7.5) ticks


func _trans_levels() -> void:
	# Trans_Level(): tnl 75, +10% per level, mastered at 100 (trans_spd 1)
	while trans_lvl() < 100 and _tdef("trans_exp", 0.0) >= _tdef("trans_tnl", 75.0):
		P["trans_exp"] = float(P["trans_exp"]) - float(P["trans_tnl"])
		P["trans_lvl"] = trans_lvl() + 1
		P["trans_tnl"] = float(P["trans_tnl"]) + roundf(float(P["trans_tnl"]) * 0.1)
		tick("Transformation level increased to %d!" % int(P["trans_lvl"]), true)
		if int(P["trans_lvl"]) >= 100:
			P["trans_spd"] = 1.0
	# Trans_Speed(): each level makes transforming 0.05 s faster
	while _tdef("trans_speed", 0.0) < 100 and _tdef("transsexp", 0.0) >= _tdef("transstnl", 75.0):
		P["transsexp"] = float(P["transsexp"]) - float(P["transstnl"])
		P["trans_speed"] = float(P["trans_speed"]) + 1
		P["trans_spd"] = maxf(1.0, _tdef("trans_spd", 51.0) - 0.5)
		P["transstnl"] = float(P["transstnl"]) + roundf(float(P["transstnl"]) * 0.1)
		if int(P["trans_speed"]) >= 100:
			P["trans_spd"] = 1.0


func revert(quiet := false) -> void:
	if int(P["form"]) == 0:
		return
	if not can_revert():
		if not quiet:
			msg("This transformation can't be reverted.", Color(1, 0.5, 0.4))
		return
	P["form"] = 0
	P["powerlevel"] = minf(float(P["powerlevel"]), cap("powerlevel"))
	P["ki"] = minf(float(P["ki"]), cap("ki"))
	if not quiet:
		msg("You revert to your base form.", Color(0.8, 0.8, 0.8))
	build_appearance()


# =================================================================== per second
func second_tick() -> void:
	P["playtime"] = float(P["playtime"]) + 1.0
	for k in buffs.keys():
		if now > float(buffs[k]["until"]):
			buffs.erase(k)
			msg("Your %s boost wears off." % k, Color(0.8, 0.8, 0.8))
	if int(P["form"]) > 0 and float(P["playtime"]) >= float(P.get("trans_gain_at", 0)):
		# Trans_Gain(): form 1: +1, 2: +2-3, 3: +3, 4: +4-5, 5+: +5 transformation exp
		var fn := int(P["form"])
		var g: int = [0, 1, randi_range(2, 3), 3, randi_range(4, 5), 5][mini(fn, 5)]
		P["trans_exp"] = _tdef("trans_exp", 0.0) + g
		_trans_levels()
		P["trans_gain_at"] = float(P["playtime"]) + _trans_gain_secs()
	if toggles.get("kaioken", false):
		P["powerlevel"] = float(P["powerlevel"]) - cap("powerlevel") * 0.01
		fatigue(2)
		if float(P["powerlevel"]) <= cap("powerlevel") * 0.05:
			toggles["kaioken"] = false
			msg("Your body can't take the Kaioken anymore!", Color(1, 0.5, 0.4))
			build_appearance()
	if toggles.get("shield", false):
		P["ki"] = float(P["ki"]) - cap("ki") * 0.005
		if float(P["ki"]) <= 0:
			toggles["shield"] = false
	if pe.flying:
		fatigue(0.5)
	if busy == "" and now - last_hurt > 5000.0:
		P["ki"] = minf(cap("ki"), float(P["ki"]) + cap("ki") * 0.01)
		P["powerlevel"] = minf(cap("powerlevel"), float(P["powerlevel"]) + cap("powerlevel") * 0.005)
		P["stam"] = maxf(0.0, float(P["stam"]) - 1.0)
	P["powerlevel"] = minf(float(P["powerlevel"]), cap("powerlevel"))
	P["ki"] = minf(float(P["ki"]), cap("ki"))


# =================================================================== NPCs
func interactables() -> Array:
	var out: Array = []
	for dx in range(-3, 4):
		for dy in range(-3, 4):
			for o in world.at(pe.x + dx, pe.y + dy, pe.z):
				if o != pe and o.kind == "npc" and not o.dead and not o.invisible and o.icon >= 0:
					if o.gravity > 0 or (absi(dx) <= 1 and absi(dy) <= 1):
						out.append(o)
	out.sort_custom(func(a, b): return absi(a.x - pe.x) + absi(a.y - pe.y) < absi(b.x - pe.x) + absi(b.y - pe.y))
	return out


func interact(o: Mob = null) -> void:
	if o == null:
		var l := interactables()
		if l.is_empty():
			msg("There is no one here to talk to.", Color(0.6, 0.6, 0.6))
			return
		o = l[0]
	if o.gravity > 0:
		grav_machine_menu(o)
		return
	if TEACHERS.has(o.path) and _teach(o):
		return
	var d: Dictionary = Data.mobs.get(o.path, {})
	var talk: String = d.get("talk", "")
	if talk == "":
		talk = "Hello, %s. Keep training!" % P["name"]
	var opts := ["Heal me", "OK"] if d.get("healer", false) else ["OK"]
	ask(o.name, talk, opts, _on_talk)


## NPC teachers (Mobs/*.dm Talk verbs): each teaches one technique per talk, in order, when
## you meet its level (and race / gene) requirement. Skill_Gain only covers the race techniques;
## the named beams (X10 Kamehameha, Galick Gun, Final Flash, Special Beam Cannon...) come from here.
const TEACHERS := {
	"/mob/NPC/Goku": [["AfterImage", 4000]],
	"/mob/NPC/SSJ3Goku": [["DragonFist", 10000]],
	"/mob/NPC/SSJ4Goku": [["X10_Kamehameha", 10000]],
	"/mob/NPC/Vegeta": [["GalickGun", 20000], ["FinalFlash", 32000, "Saiyan"], ["BigBangAttack", 40000, "Saiyan"],
		["FinalShine", 40000, "Saiyan", "Prideful"]],
	"/mob/NPC/Piccolo": [["Zanzoken", 12500], ["LightGrenade", 20000], ["SpecialBeamCannon", 25000, "Namekian"]],
	"/mob/NPC/Tien": [["SolarFlare", 7500], ["SplitForm", 15000], ["TriBeam", 25000]],
	"/mob/NPC/Trunks": [["FinishBuster", 25000], ["BurningAttack", 40000, "Half Saiyan"]],
	"/mob/NPC/Yardrat_Sensei": [["InstantTransmission", 750]],
	"/mob/NPC/Frieza": [["DeathBeam", 0, "Changeling"]],
	"/mob/NPC/Dr_Gero": [["SSDeadlyBomber", 40000, "Android"]],
}


func _teachable(e: Array, ignore_level := false) -> bool:
	if Data.tech(e[0]).is_empty() or e[0] in P["learned"]:
		return false
	if e.size() > 2 and P["race"] != e[2]:
		return false
	if e.size() > 3 and P.get("gene", "") != e[3]:
		return false
	return ignore_level or int(P["level"]) >= int(e[1])


## Returns true if the teacher said something (taught you, or told you what level to reach).
func _teach(o: Mob) -> bool:
	var lst: Array = TEACHERS[o.path]
	for e in lst:
		if _teachable(e):
			_learn(e[0])
			ask(o.name, "Here, let me teach you %s." % Data.tech(e[0]).get("name", e[0]), ["Thanks!"], func(_c, _i): pass)
			return true
	var next_lv := 0
	for e in lst:
		if _teachable(e, true) and (next_lv == 0 or int(e[1]) < next_lv):
			next_lv = int(e[1])
	if next_lv > 0:
		ask(o.name, "Get to level %s and I'll teach you something." % fmt(next_lv), ["OK"], func(_c, _i): pass)
		return true
	return false


func _learn(tkey: String, silent := false) -> void:
	var learned: Array = P["learned"]
	if tkey in learned:
		return
	learned.append(tkey)
	if tkey == "PowerUp" and not "PowerDown" in learned:
		learned.append("PowerDown")
	if not silent:
		msg(".:: You learn %s ::." % Data.tech(tkey).get("name", tkey), Color(1, 1, 0.5))
	if not _is_utility(tkey):
		_auto_hotbar("t:" + tkey)


func _on_talk(c: String, _i: int) -> void:
	if c == "Heal me":
		P["powerlevel"] = cap("powerlevel")
		P["ki"] = cap("ki")
		P["stam"] = 0.0
		msg("You feel fully restored.", Color(0.5, 1, 0.5))


# =================================================================== gravity rooms
## The gravity building (Earth, south-west of Capsule City) has four chambers with machines
## at 100x, 200x, 300x and 500x. Ported from System/Gravity.dm: every pull (7.5 s) drains
## powerlevel_max * gravity/2000 * (1%, 5% or 11%) and adds fatigue; while gravity is on,
## Self Train gives gravity/1300-1800 more exp, TP and stat ticks and Meditate gives double.
func grav_machine_menu(o: Mob) -> void:
	var state := "ON at %dx" % int(grav) if grav > 0.0 else "off"
	ask("Gravity Training", "Turn on the gravity machine? (%dx gravity)\nThe machine is %s.\nWhile it is on you lose some powerlevel every pull, but Self Train and Meditate give more." % [o.gravity, state],
		["Turn on the gravity", "Turn off the gravity", "Cancel"], _on_grav.bind(o))


func _on_grav(c: String, _i: int, o: Mob) -> void:
	match c:
		"Turn on the gravity":
			if grav > 0.0 and grav_machine == o:
				msg("The gravity machine is already on!", Color(1, 0.8, 0.4))
				return
			grav = float(o.gravity)
			grav_machine = o
			grav_next = now + 1500.0
			msg("You set the gravity to: %dx" % o.gravity, Color(0.4, 1, 1))
		"Turn off the gravity":
			gravity_off("You turned off the gravity machine.")


func gravity_off(text := "") -> void:
	if grav <= 0.0:
		return
	grav = 0.0
	grav_machine = null
	gravtrain = 0.0
	if text != "":
		msg(text, Color(0.5, 1, 0.5))


func gravity_pull() -> void:
	grav_next = now + 7500.0
	var o := grav_machine
	if o == null or o.z != pe.z or absi(o.x - pe.x) > 16 or absi(o.y - pe.y) > 16:
		gravity_off("You left the gravity room; the machine shuts down.")
		return
	var dmg: float = cap("powerlevel") * (grav / 2000.0) * [0.01, 0.05, 0.11][randi() % 3]
	P["powerlevel"] = float(P["powerlevel"]) - dmg
	var mx: float = P["stam_max"]
	if float(P["stam"]) < mx:
		fatigue(mx * (0.02 if randf() < 0.2 else 0.005))
	gravtrain = grav / randf_range(1300.0, 1800.0)
	world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.85, 0.3))
	msg("The (x%d) gravity drained %s of your health!" % [int(grav), fmt(dmg)], Color(0.5, 1, 0.5))
	if float(P["powerlevel"]) <= 0.0:
		gravity_off()
		player_ko(null, "The gravity crushed you!")
	elif float(P["powerlevel"]) < cap("powerlevel") * 0.25:
		msg("You feel extremely weak from gravity pushing down on you!", Color(1, 0.4, 0.4))


# =================================================================== session gains
func _snapshot_session() -> void:
	if P.is_empty():
		return
	var sk := {}
	for k in SKILLS:
		sk[k] = float(P["skills"][k][0])
	session = {"t": Time.get_ticks_msec(), "level": float(P["level"]), "pl": cap("powerlevel"), "ki": cap("ki"),
		"str": cap("strength"), "def": cap("defence"), "tp": float(P["tp"]), "zenni": float(P["zenni"]),
		"kills": int(P["kills"]), "skills": sk, "learned": (P["learned"] as Array).size()}


## The Gains tab of the message window: what you've gained since you started playing this time
func session_report() -> String:
	if session.is_empty():
		return "Gains will show here once you start training."
	var mins := maxf(1.0 / 60.0, (Time.get_ticks_msec() - float(session["t"])) / 60000.0)
	var hr := 60.0 / mins
	var rows := [["Levels", float(P["level"]) - float(session["level"])], ["Powerlevel", cap("powerlevel") - float(session["pl"])],
		["Ki", cap("ki") - float(session["ki"])], ["Strength", cap("strength") - float(session["str"])],
		["Defense", cap("defence") - float(session["def"])], ["Training points", float(P["tp"]) - float(session["tp"])],
		["Zenni", float(P["zenni"]) - float(session["zenni"])], ["Kills", float(int(P["kills"]) - int(session["kills"]))]]
	var s := "[b]This session[/b] — %dm %ds\n" % [int(mins), int(mins * 60) % 60]
	for r in rows:
		if r[1] != 0:
			s += "%s  +%s   [color=#9ab](%s / hour)[/color]\n" % [r[0], fmt(r[1]), fmt(r[1] * hr)]
	var sk := ""
	for k in SKILLS:
		var d := float(P["skills"][k][0]) - float(session["skills"].get(k, P["skills"][k][0]))
		if d > 0:
			sk += "%s +%d  " % [SKILL_NAMES[k], int(d)]
	if sk != "":
		s += "Skills: " + sk + "\n"
	var nt := (P["learned"] as Array).size() - int(session["learned"])
	if nt > 0:
		s += "New techniques: %d\n" % nt
	return s


# =================================================================== saving
func save() -> void:
	if P.is_empty():
		return
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(P))


func load_save() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {}
	var v = JSON.parse_string(FileAccess.get_file_as_string(SAVE_PATH))
	return v if v is Dictionary else {}


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		save()
