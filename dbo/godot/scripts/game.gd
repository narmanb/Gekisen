extends Node
## Gameplay rules ported from Dragonball Online v1.3 (DBOTeam).
## Sources: mobs/char_handling.dm (creation), mobs/mobs.dm (punchcheck/kickcheck/kicheck and the
## dummy variants, rest, meditate, Levelup, Ki trainers, teachers), combat/battle_system.dm
## (TakeDamage, KO, Die, FlightLearn/KiTechLearn/AuraTechLearn/FocusLearn, SSJ), combat/styles.dm,
## combat/skills/skills.dm (techniques), items/objs.dm (transformations, gravitrons, weights),
## mobs/monsters.dm (monsters, rewards and AI).

signal log_msg(text: String, color: Color)
signal dialog(title: String, text: String, options: Array, cb: Callable)

const SAVE_PATH := "user://dbo_save.json"
const INTRO := Vector3i(42, 61, 20)            # new characters start here, immortal
const AFTERLIFE := Vector3i(52, 10, 3)         # Die(): src.loc = locate(52,10,3)
const SKILLS := []
const SKILL_NAMES := {}
const ZNAMES := {1: "South City", 2: "Snake Way", 3: "Other World", 4: "Space Pods", 5: "Namek",
	6: "Satan City", 7: "Planet Vegeta", 8: "Hell & Lookout", 9: "Kame Island", 10: "Kaioshin's Planet",
	11: "West City", 12: "North City", 13: "East City", 14: "Wilderness", 15: "Forest", 16: "Desert",
	17: "Brolly's Planet", 18: "Cell Games", 19: "Snake Way", 20: "Newbie Island", 21: "New Namek",
	22: "Wasteland", 23: "Frieza's Ship", 24: "Heaven", 25: "Lookout Island"}
const HOTBAR_VERSION := 1

const RACES := ["Earthling", "Saiyan", "Half-Saiyan", "Namek", "Android (Biological)", "Android (Mechanical)", "Changling", "Buu", "Wizard"]
## char_handling.dm: starting powerlevel / ki / stamina, sprite and techniques
const RACE_DATA := {
	"Earthling": {"pl": 25, "ki": 50, "stam": 100, "icon": "male.dmi", "hair": true, "forms": "superh",
		"info": "Earth's warriors. Kame-sennin can awaken Super Human at 400,000 powerlevel."},
	"Saiyan": {"pl": 25, "ki": 50, "stam": 100, "icon": "male.dmi", "hair": true, "forms": "ssj", "tail": true,
		"info": "Born fighters with a tail. Enrage at great power awakens Super Saiyan; then USSJ, SSJ2 and SSJ3."},
	"Half-Saiyan": {"pl": 25, "ki": 50, "stam": 100, "icon": "male.dmi", "hair": true, "forms": "ssj",
		"info": "Half Earthling, half Saiyan, with the Super Saiyan line."},
	"Namek": {"pl": 25, "ki": 50, "stam": 100, "icon": "namek.dmi", "forms": "snj", "skills": ["Regeneration", "Grow"],
		"info": "Nameks regenerate and can grow. Dende awakens Super Namek at 1,200,000 powerlevel."},
	"Android (Biological)": {"pl": 500, "ki": 250, "stam": 50, "icon": "biocell1.dmi", "forms": "cell",
		"skills": ["Fly", "KiBlast", "KiBeam", "Zanzoken"],
		"info": "Cell's kind: starts strong and evolves into Perfect Form."},
	"Android (Mechanical)": {"pl": 2000, "ki": 6000, "stam": 100, "icon": "male.dmi", "hair": true, "forms": "supera",
		"skills": ["Fly", "KiAbsorb", "KiBlast", "KiBeam", "Focus", "Sense", "Zanzoken", "Enrage"],
		"info": "Dr. Gero's creations: huge Ki that restores itself. Gero can upgrade you to Super Android."},
	"Changling": {"pl": 25, "ki": 50, "stam": 100, "icon": "changling.dmi", "forms": "transform",
		"info": "Frieza's race, with five forms (Frieza teaches them)."},
	"Buu": {"pl": 5000, "ki": 500, "stam": 75, "icon": "buu.dmi", "forms": "buu",
		"skills": ["Fly", "KiAbsorb", "KiBlast", "KiBeam", "Focus", "Sense", "Zanzoken", "Enrage", "Regeneration"],
		"info": "Majin Buu's kin: tough, regenerating, and grows from Fat Buu to Super Buu."},
	"Wizard": {"pl": 25, "ki": 5000, "stam": 100, "icon": "wizard.dmi",
		"skills": ["Fly", "KiAbsorb", "KiBlast", "KiBeam", "Focus", "Sense", "Zanzoken", "Regeneration"],
		"info": "Babidi's kind: weak bodies but enormous Ki."},
}
const HAIRS := {"Bald": "", "Long": "hair_black_long.dmi", "Spikey": "hair_black_spikey.dmi", "Short Spikey": "gtvegeta.dmi",
	"Mohawk": "hair_mohawk.dmi", "Short": "hair_black_short.dmi", "Recoome": "hair_reccoom.dmi", "Goku": "hair_goku.dmi",
	"Vegeta": "hair_vegeta.dmi", "Vegito": "hair_vegito.dmi", "Trunks": "hair_trunks.dmi", "Goten": "hair_goten.dmi", "Gohan": "hair_gohan.dmi"}
const HAIR_COLOURS := {"Black": [0, 0, 0], "Brown": [90, 50, 10], "Blonde": [200, 170, 40], "Red": [170, 20, 10],
	"Blue": [20, 50, 180], "Green": [20, 140, 30], "Purple": [120, 20, 150], "White": [230, 230, 230]}
const HOMETOWNS := {"Satan City": Vector3i(116, 98, 6), "South City": Vector3i(77, 77, 1), "North City": Vector3i(59, 94, 12),
	"East City": Vector3i(65, 98, 13), "West City": Vector3i(76, 114, 11)}
const ALIGN := {"Good": 100, "Neutral": 0, "Evil": -100}
## combat/styles.dm: damage = attacker powerlevel x rand(min, max) %
const STANCE := {"Basic Stance": [1.0, 5.0, 0], "Namekian Stance": [2.5, 15.0, 5], "Changling Stance": [2.0, 10.0, 6],
	"Turtle Hermit Stance": [1.5, 6.0, 0], "Kai Stance": [1.5, 6.0, 15], "Advanced Stance": [2.5, 10.0, 5]}

## Techniques: kind beam (Ki you charge x power x focus factor), blast (1% max Ki x1.25), bind, utility.
const TECHS := {
	"KiBlast": {"name": "Ki Blast", "kind": "blast", "icon": "cki.dmi", "glyph": "KI", "learn": "Ki Tech: 600 max PL + Advanced Ki Knowledge"},
	"KiBeam": {"name": "Ki Beam", "kind": "beam", "power": 1.0, "icon": "custattack.dmi", "glyph": "BM", "learn": "Ki Tech: 600 max PL + Advanced Ki Knowledge"},
	"Kamehameha": {"name": "Kamehameha", "kind": "beam", "power": 1.2, "icon": "choublast.dmi", "glyph": "KHH", "learn": "Kame-sennin"},
	"Masenko": {"name": "Masenko", "kind": "beam", "power": 1.15, "icon": "flashki.dmi", "glyph": "MSK", "learn": "Piccolo (Namek/Earthling, 15 SP)", "sp": 15, "pl": 0, "ki": 4000, "teacher": "Piccolo"},
	"SpecialBeamCannon": {"name": "Special Beam Cannon", "kind": "beam", "power": 1.4, "icon": "specialbeamcannon.dmi", "glyph": "SBC", "learn": "Piccolo (Namek, 10 SP, 9,800 max Ki)", "sp": 10, "ki": 9800, "teacher": "Piccolo", "race": ["Namek"]},
	"GalicGun": {"name": "Galick Gun", "kind": "beam", "power": 1.2, "icon": "galicki.dmi", "glyph": "GG", "learn": "Vegeta (10 SP, 18,000 max PL)", "sp": 10, "pl": 18000, "teacher": "Vegeta"},
	"BigBang": {"name": "Big Bang", "kind": "beam", "power": 1.35, "icon": "bigbang.dmi", "glyph": "BB", "learn": "Vegeta (30 SP, 700,000 max PL)", "sp": 30, "pl": 700000, "teacher": "Vegeta"},
	"FinalFlash": {"name": "Final Flash", "kind": "beam", "power": 1.6, "icon": "flashblast.dmi", "glyph": "FF", "learn": "Vegeta (200 SP, 5,000,000 max PL)", "sp": 200, "pl": 5000000, "teacher": "Vegeta"},
	"Dodonpa": {"name": "Dodonpa", "kind": "beam", "power": 1.15, "icon": "dodonpa.dmi", "glyph": "DDP", "learn": "Tenshinhan (10 SP, 1,200 max PL)", "sp": 10, "pl": 1200, "teacher": "Tenshinhan"},
	"Tayioken": {"name": "Tayioken", "kind": "utility", "glyph": "TAY", "learn": "Tenshinhan (25 SP, 50,000 max PL)", "sp": 25, "pl": 50000, "teacher": "Tenshinhan", "desc": "Solar Flare: blinds the enemies around you."},
	"Spiritball": {"name": "Spirit Ball", "kind": "beam", "power": 1.3, "icon": "spiritball.dmi", "glyph": "SPB", "learn": "Yamcha (Earthling, 25 SP, 250,000 max PL)", "sp": 25, "pl": 250000, "teacher": "Yamcha", "race": ["Earthling"]},
	"Burning": {"name": "Burning Attack", "kind": "beam", "power": 1.3, "icon": "flashblast.dmi", "glyph": "BRN", "learn": "Trunks (Half-Saiyan, 25 SP, 250,000 max PL)", "sp": 25, "pl": 250000, "teacher": "Trunks", "race": ["Half-Saiyan"]},
	"DeathBeam": {"name": "Death Beam", "kind": "beam", "power": 1.25, "icon": "eyeki.dmi", "glyph": "DB", "learn": "Frieza (30 SP, 3,100 max PL)", "sp": 30, "pl": 3100, "teacher": "Frieza"},
	"Renzoku": {"name": "Renzoku Energy Dan", "kind": "beam", "power": 1.3, "icon": "cki.dmi", "glyph": "RZK", "learn": "Brolly (25 SP, 26,000 max Ki)", "sp": 25, "ki": 26000, "teacher": "Brolli"},
	"ChouKamehameha": {"name": "Chou Kamehameha", "kind": "beam", "power": 1.8, "icon": "choublast.dmi", "glyph": "CKH", "learn": "Goku (120 SP, 12,000,000 max PL)", "sp": 120, "pl": 12000000, "teacher": "Goku"},
	"SpiritBomb": {"name": "Spirit Bomb", "kind": "beam", "power": 2.0, "icon": "sbomb.dmi", "glyph": "SB", "learn": "King Kai (30 SP, 14,000 max PL, Ki Combat)", "desc": "Gathers energy: the Ki you charge counts double."},
	"Kaioken": {"name": "Kaioken", "kind": "utility", "glyph": "KAI", "learn": "King Kai (20 SP, 12,000 max PL, Ki Control)", "desc": "Doubles your powerlevel while it strains your stamina."},
	"TimeFreeze": {"name": "Time Freeze", "kind": "bind", "glyph": "TF", "learn": "Guldo (30 SP, 32,000 max Ki)", "sp": 30, "ki": 32000, "teacher": "Guldo", "desc": "Freezes the enemies around you for a few seconds."},
	"InstantTransmission": {"name": "Instant Transmission", "kind": "utility", "glyph": "IT", "learn": "Yardrat (good, 75 SP, 2,500,000 max PL)", "sp": 75, "pl": 2500000, "teacher": "Yardrat1", "desc": "Teleport to someone you know."},
	"Fly": {"name": "Bukujutsu (Fly)", "kind": "utility", "glyph": "FLY", "learn": "100 max PL + Ki Knowledge", "desc": "Fly over everything."},
	"Zanzoken": {"name": "Zanzoken", "kind": "utility", "glyph": "ZAN", "learn": "Ki Tech", "desc": "Vanish from sight: monsters lose you while it drains stamina."},
	"PowerUp": {"name": "Power Up", "kind": "utility", "glyph": "PUP", "learn": "Aura Tech: 1,100 max PL + Ki Control", "desc": "Raise your powerlevel up to its maximum."},
	"Sense": {"name": "Sense", "kind": "utility", "glyph": "SEN", "learn": "Aura Tech", "desc": "Sense the powerlevels around you."},
	"Focus": {"name": "Focus", "kind": "utility", "glyph": "FOC", "learn": "1,600 max PL + Ki Control", "desc": "Focus: your Ki and powerlevel return to full."},
	"Enrage": {"name": "Enrage", "kind": "utility", "glyph": "ENR", "learn": "1,600 max PL + Ki Control", "desc": "When your anger is full, unleash it. Saiyans can awaken Super Saiyan this way."},
	"KiAbsorb": {"name": "Ki Absorb", "kind": "utility", "glyph": "ABS", "learn": "Androids, Buu, Wizards", "desc": "Absorb Ki from attacks: blocks half the damage you take."},
	"Regeneration": {"name": "Regeneration", "kind": "utility", "glyph": "RGN", "learn": "Namek, Buu, Wizard", "desc": "Regenerate your powerlevel quickly."},
	"Grow": {"name": "Grow", "kind": "utility", "glyph": "GRW", "learn": "Namek", "desc": "Grow giant: +50% powerlevel for a while."},
}
## items/objs.dm /obj/transes: [name, required max powerlevel, powerlevel multiplier]
const FORMS := {
	"ssj": [["Super Saiyan", 900000, 2.5], ["Ultra Super Saiyan", 2500000, 5.25], ["Super Saiyan 2", 4200000, 7.0], ["Super Saiyan 3", 15000000, 10.0]],
	"transform": [["Form 2", 425000, 3.5], ["Form 3", 675000, 4.5], ["Form 4", 950000, 6.0], ["Form 4 (Full Power)", 1200000, 6.4], ["Form 5", 5200000, 8.0]],
	"cell": [["Semi-Perfect Form", 0, 2.0], ["Perfect Form", 1200000, 3.0], ["Super Perfect Form", 8600000, 4.0]],
	"buu": [["Fat Buu", 675000, 4.0], ["Super Buu", 1000000, 5.0], ["Super Buu (Gotenks)", 2600000, 6.0], ["Super Buu (Gohan)", 12000000, 7.0]],
	"superh": [["Super Human", 400000, 4.0]],
	"snj": [["Super Namek", 1200000, 4.0]],
	"supera": [["Super Android", 2600000, 4.0]],
}
## Ki trainers (mobs.dm Ki_Trainer1 / Ki_Trainer2): [flag, name, skill points, max Ki bonus, needs]
const KI_LESSONS := [["kikn", "Ki Knowledge", 5, 50, ""], ["ki_imp", "Advanced Ki Knowledge", 10, 500, "kikn"],
	["kicntrl", "Ki Control", 20, 1000, "ki_imp"], ["kicombt", "Ki Combat", 40, 5000, "kicntrl"], ["ekc", "Enhanced Ki Combat", 60, 15000, "kicombt"]]
const SHOP := [["Senzu Bean", 1000, "senzu"], ["Weighted Clothing", 500, "weight"], ["Blue Kai Gi", 100, "clothes-bluekaigi.dmi"],
	["Turtle Gi", 100, "kamegi.dmi"], ["Black Gi", 100, "clothes-blackgi.dmi"], ["Kai Gi", 300, "clothes-redkaigi.dmi"], ["Saiyan Armor", 300, "saiyanarmor.dmi"]]

var now := 0.0
var world: Node2D
var P := {}
var pe: Mob
var monsters := {}
var projectiles: Array = []
var busy := ""              # train | meditate | rest | powerup
var busy_next := 0.0
var train_tier := 1
var train_kind := ""
var cooldowns := {}
var move_dir := 0
var last_tick := 0.0
var last_save := 0.0
var last_melee := 0.0
var timers: Array = []
var traveling := false
var running := false
var grav := 0.0
var grav_next := 0.0
var zanzoken := false
var absorbing := false
var regen := false
var kaioken := 0
var grown := 0.0


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


func msg(t: String, c := Color.WHITE) -> void:
	log_msg.emit(t, c)


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
const EQUIPMENT := ["/obj/Gravitron", "/obj/Gravitrontwo", "/obj/Gravitronthree", "/obj/Gravitronfour", "/obj/Gravitronx",
	"/obj/CCGravitronx", "/obj/WeightTraining100", "/obj/WeightTraining1000", "/obj/pbag", "/obj/Machine", "/obj/heal"]


func spawn_from_map(ti: int, x: int, y: int, z: int) -> void:
	var t: Dictionary = Data.types[str(ti)]
	var p: String = t["path"]
	if p.begins_with("/monster/"):
		if not p.begins_with("/monster/Pikkon") and not p.begins_with("/monster/train"):
			spawn_monster(p, x, y, z, t)
		return
	if p.begins_with("/obj/charasel") or p.begins_with("/mob/login"):
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
	m.kind = "npc" if p.begins_with("/mob") else ("equip" if p in EQUIPMENT else "obj")
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
	m.name = str(d.get("name", p.get_file())).replace("\"", "")
	m.kind = "monster"
	m.path = p
	m.layer = 4.0
	m.powerlevel_max = maxf(1.0, float(d.get("powerlevel", 25)))
	m.powerlevel = m.powerlevel_max
	m.ki = float(d.get("ki", 50))
	m.race = str(d.get("race", ""))
	m.home = Vector3i(x, y, z)
	m.aggro = int(d.get("ap", -100)) < 0          # ap -100 evil, +100 friendly
	m.respawn = true
	m.next_think = now + randf_range(300, 1500)
	world.add(m)
	monsters[m] = true
	return m


# =================================================================== character creation
func new_player(o: Dictionary) -> Dictionary:
	var race: String = o["race"]
	var rd: Dictionary = RACE_DATA[race]
	var home: Vector3i = HOMETOWNS.get(o.get("hometown", "Satan City"), HOMETOWNS["Satan City"])
	var p := {
		"name": o.get("name", "Fighter"), "race": race, "hair": o.get("hair", "Spikey"),
		"hair_rgb": HAIR_COLOURS.get(o.get("hair_colour", "Black"), [0, 0, 0]), "hair_colour": o.get("hair_colour", "Black"),
		"alignment": o.get("alignment", "Neutral"), "ap": ALIGN.get(o.get("alignment", "Neutral"), 0),
		"hometown": o.get("hometown", "Satan City"), "hx": home.x, "hy": home.y, "hz": home.z,
		"pl": float(rd["pl"]), "maxpl": float(rd["pl"]), "ki": float(rd["ki"]), "maxki": float(rd["ki"]),
		"stam": float(rd["stam"]), "maxstam": float(rd["stam"]), "focus": 1000.0,
		"skexp": 0.0, "maxskexp": 100.0, "skpts": 0, "zenni": 0.0, "kills": 0, "deaths": 0, "anger": 0,
		"know": {}, "learned": (rd.get("skills", []) as Array).duplicate(), "hotbar": [], "hotbar_v": HOTBAR_VERSION,
		"stance": "Namekian Stance" if race == "Namek" else ("Changling Stance" if race == "Changling" else "Basic Stance"),
		"formset": "", "form": 0, "form_name": "Normal", "weight": 0,
		"dead": true, "newb": true, "kaistart": 0, "bubbles": false, "gregory": false,
		"items": {}, "worn": [], "kicharge": 0.5, "known": [],
		"x": INTRO.x, "y": INTRO.y, "z": INTRO.z, "dir": 2, "playtime": 0.0,
	}
	if race in ["Android (Biological)", "Buu"]:
		p["formset"] = rd["forms"]          # their forms come with the body
	if race == "Android (Mechanical)":
		p["know"] = {"kikn": 1, "ki_imp": 1}
	for k in p["learned"]:
		if TECHS[k]["kind"] != "utility":
			p["hotbar"].append("t:" + k)
	return p


func look_options(p: Dictionary) -> Array:
	if RACE_DATA[p["race"]].get("hair", false):
		return [["Hair", "hair", HAIRS.keys()], ["Hair colour", "hair_colour", HAIR_COLOURS.keys()]]
	return []


func has_hair(p: Dictionary) -> bool:
	return RACE_DATA.get(p["race"], {}).get("hair", false) and p.get("hair", "Bald") != "Bald"


func base_icon(p: Dictionary) -> int:
	return Data.icon_id(RACE_DATA.get(p["race"], RACE_DATA["Earthling"])["icon"])


func _rgb(a) -> Color:
	var v: Array = a if a is Array else [0, 0, 0]
	return Color8(int(v[0]), int(v[1]), int(v[2]))


## Sprites for forms that change the body (objs.dm transes)
const FORM_ICONS := {"Form 2": "ChangeForm2.dmi", "Form 3": "ChangeForm3.dmi", "Form 4": "ChangeForm4.dmi", "Form 4 (Full Power)": "ChangeForm4.dmi",
	"Form 5": "ChangeForm6.dmi", "Semi-Perfect Form": "biocell2.dmi", "Perfect Form": "biocell3.dmi", "Super Perfect Form": "biocell3.dmi",
	"Fat Buu": "Fat Buu.dmi", "Super Buu": "Super Buu.dmi", "Super Buu (Gotenks)": "Super Buu.dmi", "Super Buu (Gohan)": "Super Buu.dmi"}


func build_appearance(p: Dictionary = P, e: Mob = pe) -> void:
	e.icon = base_icon(p)
	var fn: String = p.get("form_name", "Normal")
	if int(p.get("form", 0)) > 0 and FORM_ICONS.has(fn) and Data.icon_id(FORM_ICONS[fn]) >= 0:
		e.icon = Data.icon_id(FORM_ICONS[fn])
	e.overlays = []
	e.underlays = []
	for w in p.get("worn", []):
		if Data.icon_id(w) >= 0:
			e.overlays.append({"icon": Data.icon_id(w)})
	if RACE_DATA.get(p["race"], {}).get("tail", false) and Data.icon_id("tail.dmi") >= 0:
		e.overlays.append({"icon": Data.icon_id("tail.dmi")})
	if has_hair(p):
		var hair: String = HAIRS.get(p["hair"], "")
		var tint = _rgb(p.get("hair_rgb"))
		if p.get("formset", "") == "ssj" and int(p.get("form", 0)) > 0:
			# objs.dm ssjhairrestore: a golden version of each hair style; SSJ3 has its own long hair
			var style: String = {"Spikey": "", "Short Spikey": "", "Short": "", "Long": "long", "Recoome": "reccoom", "Vegito": "vegeta"}.get(p["hair"], str(p["hair"]).to_lower())
			var gold := "hair_super_saiyan%s.dmi" % ("_" + style if style != "" else "")
			if int(p["form"]) >= 4:
				gold = "ssj3.dmi"
			if Data.icon_id(gold) < 0:
				gold = "hair_super_saiyan.dmi"
			hair = gold
			tint = null
		if Data.icon_id(hair) >= 0:
			var o := {"icon": Data.icon_id(hair)}
			if tint != null and tint != Color8(0, 0, 0):
				o["tint"] = tint
			e.overlays.append(o)
	if p.get("dead", false) and not p.get("newb", false) and Data.icon_id("halo.dmi") >= 0:
		e.overlays.append({"icon": Data.icon_id("halo.dmi")})
	if e == pe:
		if p.get("formset", "") == "ssj" and int(p.get("form", 0)) > 0 and Data.icon_id("ssjaura.dmi") >= 0:
			e.underlays.append({"icon": Data.icon_id("ssjaura.dmi"), "state": ""})
		elif kaioken > 0 and Data.icon_id("kaioaura.dmi") >= 0:
			e.underlays.append({"icon": Data.icon_id("kaioaura.dmi"), "state": ""})
		elif busy == "powerup" and Data.icon_id("whiteaura.dmi") >= 0:
			e.underlays.append({"icon": Data.icon_id("whiteaura.dmi"), "state": ""})
	e.name = p.get("name", "")


func start(p: Dictionary) -> void:
	P = p
	for k in ["items", "worn", "known", "learned", "hotbar", "know"]:
		if not P.has(k):
			P[k] = {} if k in ["items", "know"] else []
	var hb: Array = P["hotbar"]
	while hb.size() < 30:
		hb.append("")
	if pe != null:
		world.remove(pe)
	pe = Mob.new()
	pe.kind = "player"
	pe.layer = 4.5
	pe.x = int(P["x"])
	pe.y = int(P["y"])
	pe.z = int(P["z"])
	pe.from_x = pe.x
	pe.from_y = pe.y
	pe.dir = int(P.get("dir", 2))
	world.load_z(pe.z)
	world.add(pe)
	world.focus = pe
	build_appearance()
	running = true
	last_tick = now
	last_save = now
	msg("Welcome to Dragonball Online, %s!" % P["name"], Color(1, 0.85, 0.3))
	if P.get("newb", false):
		msg("You are on Newbie Island. Talk to the Intro guides; Intro 2 sends you to %s when you're ready." % P["hometown"], Color(0.6, 0.85, 1))
	msg("Train (punches, kicks, Ki) to raise your powerlevel. Skill exp becomes skill points: spend them at the Ki Trainers and teachers.", Color(0.6, 0.85, 1))


# =================================================================== stats
func current_form(p: Dictionary = P) -> Array:
	var fs: String = p.get("formset", "")
	var n := int(p.get("form", 0))
	if fs == "" or n <= 0 or not FORMS.has(fs) or n > FORMS[fs].size():
		return []
	return FORMS[fs][n - 1]


func forms_for(p: Dictionary = P) -> Array:
	return FORMS.get(p.get("formset", ""), [])


func cap(s: String) -> float:
	match s:
		"powerlevel":
			var c := float(P["maxpl"])
			var f := current_form()
			if not f.is_empty():
				c *= float(f[2])
			if kaioken > 0:
				c *= 2.0
			if grown > now:
				c *= 1.5
			return c
		"ki":
			var c2 := float(P["maxki"])
			var f2 := current_form()
			if not f2.is_empty():
				c2 *= float(f2[2]) * 0.75
			return c2
	return 0.0


func stat(s: String) -> float:
	return float(P.get(s, 0))


func knows(flag: String) -> bool:
	return int(P["know"].get(flag, 0)) == 1


func use_stamina(v: float) -> void:
	P["stam"] = maxf(0.0, float(P["stam"]) - v)


## mobs.dm Levelup(): skill exp -> skill points
func gain_skexp(v: float) -> void:
	P["skexp"] = float(P["skexp"]) + v
	var got := 0
	while float(P["skexp"]) >= float(P["maxskexp"]):
		P["skexp"] = float(P["skexp"]) - float(P["maxskexp"])
		got += 1
	if got > 0:
		P["skpts"] = int(P["skpts"]) + got
		msg("You gained %s skill point%s! (%d)" % [got, "s" if got > 1 else "", int(P["skpts"])], Color(1, 0.5, 0.4))
		world.floater(pe.x, pe.y, pe.z, "+%d SP" % got, Color(1, 0.6, 0.4))


func grow(pl_add: float, ki_add: float, stam_add: float) -> void:
	P["maxpl"] = float(P["maxpl"]) + pl_add
	P["maxki"] = float(P["maxki"]) + ki_add
	P["maxstam"] = float(P["maxstam"]) + stam_add
	learn_checks()


## battle_system.dm FlightLearn / KiTechLearn / AuraTechLearn / FocusLearn
func learn_checks() -> void:
	var mp := float(P["maxpl"])
	if mp >= 100 and knows("kikn"):
		_learn("Fly", "You have learned the ability, Bukujutsu (Fly)!")
	if mp >= 600 and knows("ki_imp") and not "KiBlast" in P["learned"]:
		P["maxki"] = float(P["maxki"]) + 500
		_learn("KiBlast", "You can now use your Ki! You have learned Ki Blast!")
		_learn("KiBeam", "")
		_learn("Zanzoken", "")
	if mp >= 1100 and knows("kicntrl") and not "PowerUp" in P["learned"]:
		P["maxki"] = float(P["maxki"]) + 500
		_learn("PowerUp", "You have learned the ability, Power Up!")
		_learn("Sense", "")
	if mp >= 1600 and knows("kicntrl"):
		_learn("Focus", "You have learned the ability, Focus!")
		_learn("Enrage", "")


func _learn(key: String, text: String) -> bool:
	var l: Array = P["learned"]
	if key in l:
		return false
	l.append(key)
	msg(text if text != "" else "You have learned the ability, %s!" % TECHS[key]["name"], Color(0.5, 0.75, 1))
	if TECHS[key]["kind"] != "utility":
		var hb: Array = P["hotbar"]
		var i := hb.find("")
		if i >= 0:
			hb[i] = "t:" + key
	return true


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
	var dur := 120.0 if pe.flying else 175.0
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
		if tur.has("enter") and (tur["enter"].has("warp") or tur["enter"].has("move")):
			_warp(tur["enter"], nx, ny)
	P["x"] = pe.x
	P["y"] = pe.y
	P["z"] = pe.z


func _entered() -> void:
	var tur := Data.turf(pe.x, pe.y, pe.z)
	if not tur.has("enter"):
		return
	var r: Dictionary = tur["enter"]
	if r.has("land") and pe.flying:
		toggle_fly()
	if r.has("warp") or r.has("move"):
		_warp(r, pe.x, pe.y)


func _warp(r: Dictionary, fx: int, fy: int) -> void:
	if r.has("msg"):
		msg(r["msg"], Color(0.8, 0.8, 0.9))
	if r.has("warp"):
		var w: Array = r["warp"]
		teleport(int(w[0]), int(w[1]), int(w[2]))
		return
	var mv: Array = r["move"]
	var cur := [fx, fy, pe.z]
	var out := []
	for i in 3:
		out.append(int(mv[i][1]) if mv[i][0] == "abs" else cur[i] + int(mv[i][1]))
	teleport(out[0], out[1], out[2])


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
	if grav > 0.0:
		gravity_off("The gravity begins to shut down.")


# =================================================================== abilities
const BASE_ACTIONS := ["attack", "talk", "train", "meditate", "rest", "block", "transform", "revert", "kicharge"]


func abilities() -> Array:
	var out: Array = BASE_ACTIONS.duplicate()
	for k in P.get("learned", []):
		out.append("t:" + k)
	return out


func ability_info(id: String) -> Dictionary:
	match id:
		"attack": return {"name": "Attack", "desc": "Punch or kick: your powerlevel x your stance's damage %.", "glyph": "ATK", "color": Color(0.75, 0.25, 0.2)}
		"talk": return {"name": "Talk / Use", "desc": "Talk to people and use training equipment next to you.", "glyph": "USE", "color": Color(0.2, 0.55, 0.55)}
		"train": return {"name": "Train", "desc": "Self-train punches, kicks or Ki. Next to a training dummy the gains are 2x (Class I) or 4x (Class II).", "glyph": "TRN", "color": Color(0.25, 0.55, 0.25)}
		"meditate": return {"name": "Meditate", "desc": "Recover Ki and stamina, raise your focus and sometimes gain Ki.", "glyph": "MED", "color": Color(0.35, 0.35, 0.7)}
		"rest": return {"name": "Rest", "desc": "Recover stamina and powerlevel.", "glyph": "RST", "color": Color(0.4, 0.45, 0.6)}
		"block": return {"name": "Block", "desc": "Throw up your arms: most hits are blocked, but you can't move.", "glyph": "BLK", "color": Color(0.5, 0.5, 0.35)}
		"transform": return {"name": "Transform", "desc": "Transform to your next form.", "glyph": "TRF", "color": Color(0.85, 0.7, 0.15)}
		"revert": return {"name": "Revert", "desc": "Return to normal.", "glyph": "REV", "color": Color(0.5, 0.5, 0.5)}
		"senzu": return {"name": "Senzu Bean (%d)" % int(P.get("items", {}).get("senzu", 0)), "desc": "Restores powerlevel, Ki and stamina.", "glyph": "SNZ", "color": Color(0.3, 0.6, 0.25)}
		"kicharge": return {"name": "Ki Charge %d%%" % int(float(P.get("kicharge", 0.5)) * 100), "desc": "How much of your Ki goes into each beam.", "glyph": "%d%%" % int(float(P.get("kicharge", 0.5)) * 100), "color": Color(0.3, 0.5, 0.8)}
	if id.begins_with("t:"):
		var k := id.substr(2)
		var t: Dictionary = TECHS.get(k, {})
		var col := Color(0.25, 0.45, 0.8)
		match str(t.get("kind", "")):
			"beam": col = Color(0.2, 0.55, 0.85)
			"blast": col = Color(0.75, 0.6, 0.2)
			"bind": col = Color(0.6, 0.3, 0.7)
			"utility": col = Color(0.3, 0.5, 0.4)
		var d: String = t.get("desc", "")
		if d == "" and t.get("kind", "") == "beam":
			d = "Fires the Ki you charge (Ki Charge). Damage = Ki x %s x focus." % str(t.get("power", 1.0))
		if d == "" and t.get("kind", "") == "blast":
			d = "Costs 1% of your max Ki; deals 1.25x that."
		return {"name": t.get("name", k), "desc": "%s\nLearned from: %s" % [d, t.get("learn", "?")], "glyph": t.get("glyph", k.substr(0, 3)), "color": col}
	return {"name": id, "desc": "", "glyph": id.substr(0, 3).to_upper(), "color": Color.GRAY}


func tech_cost(_t: Dictionary) -> float:
	return float(P["ki"]) * float(P.get("kicharge", 0.5))


func cooldown_left(id: String) -> float:
	return maxf(0.0, float(cooldowns.get(id, 0.0)) - now)


func panel_actions() -> Array:
	var out: Array = ["talk", "train", "meditate", "rest", "block"]
	for k in ["Fly", "PowerUp", "Focus", "Kaioken", "Zanzoken", "InstantTransmission", "Enrage", "Regeneration", "KiAbsorb", "Sense", "Grow", "Tayioken"]:
		if k in P.get("learned", []):
			out.append("t:" + k)
	if P.get("formset", "") != "":
		out.append_array(["transform", "revert"])
	return out


func is_active(id: String) -> bool:
	match id:
		"train": return busy == "train"
		"meditate": return busy == "meditate"
		"rest": return busy == "rest"
		"block": return busy == "block"
		"t:Fly": return pe.flying
		"t:PowerUp": return busy == "powerup"
		"t:Kaioken": return kaioken > 0
		"t:Zanzoken": return zanzoken
		"t:KiAbsorb": return absorbing
		"t:Regeneration": return regen
		"t:Grow": return grown > now
		"revert": return int(P.get("form", 0)) > 0
	return false


func use_ability(id: String) -> void:
	if not running or cooldown_left(id) > 0:
		return
	match id:
		"attack": melee()
		"talk": interact()
		"train": train_menu()
		"meditate": _toggle("meditate", "You begin meditating.")
		"rest": _toggle("rest", "You begin resting.")
		"block": _toggle("block", "You throw up your arms and block incoming attacks.")
		"transform": transform()
		"revert": revert()
		"senzu": eat_senzu()
		"kicharge":
			var c := float(P.get("kicharge", 0.5))
			P["kicharge"] = {0.25: 0.5, 0.5: 0.75, 0.75: 1.0, 1.0: 0.25}.get(c, 0.5)
			msg("Ki Charge: %d%% of your Ki goes into each beam." % int(float(P["kicharge"]) * 100), Color(0.6, 0.8, 1))
		_:
			if id.begins_with("t:"):
				use_tech(id.substr(2))


func facing_target(any_adjacent := true) -> Mob:
	var fx: int = pe.x + Data.DIR_DX[pe.dir]
	var fy: int = pe.y + Data.DIR_DY[pe.dir]
	for o in world.at(fx, fy, pe.z):
		if o.kind == "monster" and not o.dead and _hostile(o):
			return o
	if any_adjacent:
		for d in [2, 1, 4, 8, 6, 10, 5, 9]:
			for o in world.at(pe.x + Data.DIR_DX[d], pe.y + Data.DIR_DY[d], pe.z):
				if o.kind == "monster" and not o.dead and _hostile(o):
					pe.dir = d
					return o
	return null


## Punch(): you can't hit monsters on your own side (both good or both evil)
func _hostile(m: Mob) -> bool:
	var ap := int(P.get("ap", 0))
	return not ((m.aggro and ap < 0) or (not m.aggro and ap >= 0))


func nearest_monster(r: int) -> Mob:
	var best: Mob = null
	var bd := 9999
	for m in monsters:
		if m.dead or m.z != pe.z or not _hostile(m):
			continue
		var d: int = maxi(absi(m.x - pe.x), absi(m.y - pe.y))
		if d <= r and d < bd:
			bd = d
			best = m
	return best


# =================================================================== combat
## mobs.dm Punch / Kick with combat/styles.dm stances
func melee() -> void:
	if now - last_melee < 450.0:
		return
	if busy != "":
		stop_busy()
	if zanzoken:
		msg("You can't attack while using Zanzoken.", Color(1, 0.5, 0.4))
		return
	var m := facing_target()
	last_melee = now
	pe.do_flick("punch" if randf() < 0.5 else "kick", now)
	if m == null:
		for o in world.at(pe.x + Data.DIR_DX[pe.dir], pe.y + Data.DIR_DY[pe.dir], pe.z):
			if o.kind == "npc" or o.kind == "equip":
				interact(o)
		return
	m.target = pe
	if randi_range(1, 4) == 1:
		world.floater(m.x, m.y, m.z, "miss", Color(0.8, 0.8, 0.8))
		return
	var st: Array = STANCE.get(P.get("stance", "Basic Stance"), STANCE["Basic Stance"])
	var dmg := maxf(1.0, float(P["pl"]) * randf_range(st[0], st[1]) / 100.0)
	if randf() * 100.0 < float(st[2]):
		dmg = float(P["pl"])
		world.floater(m.x, m.y - 0, m.z, "CRITICAL", Color(1, 0.4, 0.2))
	_hit_monster(m, dmg, Color(1, 0.85, 0.3))


## battle_system.dm TakeDamage: a 1 in 5 swing lands for 5-10% of the attacker's powerlevel
func monster_attack(m: Mob) -> void:
	if pe.flying or zanzoken:
		return
	m.do_flick("attack", now)
	if randi_range(1, 5) != 1:
		return
	var dmg := maxf(1.0, m.powerlevel * randf_range(5, 10) / 100.0)
	if busy == "block":
		if randi_range(1, 4) != 4:
			world.floater(pe.x, pe.y, pe.z, "block", Color(0.8, 0.8, 1))
			return
		dmg *= 0.6
		stop_busy()
	if absorbing:
		dmg *= 0.5
	P["pl"] = float(P["pl"]) - roundf(dmg)
	if busy in ["train", "meditate", "rest", "powerup"]:
		stop_busy()
	world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.3, 0.3))
	if float(P["pl"]) <= 0:
		player_ko(m)


func _hit_monster(m: Mob, raw: float, col: Color) -> void:
	if m.dead:
		return
	var dmg := maxf(1.0, roundf(raw))
	m.powerlevel -= dmg
	m.target = pe
	world.floater(m.x, m.y, m.z, fmt(dmg), col)
	if m.powerlevel <= 0:
		monster_die(m)


## monsters.dm /monster Dead(): max powerlevel, max Ki, skill exp and a bag of zenni
func monster_die(m: Mob) -> void:
	if m.dead:
		return
	m.dead = true
	world.remove(m)
	P["kills"] = int(P["kills"]) + 1
	var d: Dictionary = Data.mobs.get(m.path, {})
	var plg := randi_range(int(d.get("plgivemin", 0)), int(d.get("plgivemax", 0)))
	var kig := randi_range(int(d.get("kigivemin", 0)), int(d.get("kigivemax", 0)))
	var z := randi_range(int(d.get("goldmin", 0)), int(d.get("goldmax", 0)))
	P["zenni"] = float(P["zenni"]) + z
	msg("You defeated %s! +%s max PL, +%s max Ki, +%s zenni" % [m.name, fmt(plg), fmt(kig), fmt(z)], Color(0.5, 1, 0.5))
	grow(plg, kig, 0)
	gain_skexp(randi_range(int(d.get("skexpgivemin", 0)), int(d.get("skexpgivemax", 0))))
	P["ap"] = clampi(int(P["ap"]) + (10 if m.aggro else -10), -1000, 1000)
	var path := m.path
	var home := m.home
	monsters.erase(m)
	after(randf_range(30000, 60000), func(): spawn_monster(path, home.x, home.y, home.z))


## battle_system.dm KO(): knocked out for a while, then back at 5 powerlevel.
## A monster finishes off whoever it knocks out: you die (Die) unless you're still a newbie (immortal).
func player_ko(by: Mob, reason := "") -> void:
	revert(true)
	stop_busy()
	gravity_off()
	kaioken = 0
	for m in monsters:
		if m.target == pe:
			m.target = null
			m.next_think = now + 5000
	P["pl"] = 5.0
	if randi_range(1, 3) == 3:
		P["maxpl"] = float(P["maxpl"]) + randi_range(1, 2)
	pe.flying = false
	if randf() < 0.05 and int(P["ap"]) >= -25:
		P["anger"] = mini(10, int(P["anger"]) + 1)
		msg("You get angered by your weakness.", Color(1, 0.4, 0.4))
	if by != null and not P.get("dead", false):
		die("%s finishes you off!" % by.name)
		return
	if P.get("newb", false) or P.get("dead", false):
		msg(reason if reason != "" else "You suddenly feel like you're going to die, but immortality prevents you from death!", Color(1, 0.4, 0.4))
		P["pl"] = float(P["maxpl"]) * 0.05
	else:
		msg(reason if reason != "" else "You are knocked out!", Color(1, 0.35, 0.35))
	pe.stun_until = now + 3000
	build_appearance()


func die(text: String) -> void:
	msg(text, Color(1, 0.3, 0.3))
	msg("You have died. Talk to King Yemma to be judged; King Kai's training sends you back to life.", Color(0.9, 0.9, 0.6))
	P["dead"] = true
	P["deaths"] = int(P["deaths"]) + 1
	P["pl"] = float(P["maxpl"])
	teleport(AFTERLIFE.x, AFTERLIFE.y, AFTERLIFE.z)
	build_appearance()
	save()


func revive() -> void:
	P["dead"] = false
	P["newb"] = false
	P["kaistart"] = 0
	P["bubbles"] = false
	P["gregory"] = false
	teleport(int(P["hx"]), int(P["hy"]), int(P["hz"]))
	build_appearance()
	save()


# =================================================================== techniques
func use_tech(key: String) -> void:
	var t: Dictionary = TECHS.get(key, {})
	if t.is_empty() or not key in P.get("learned", []):
		return
	if busy != "" and t["kind"] != "utility":
		stop_busy()
	match str(t["kind"]):
		"beam":
			if zanzoken:
				msg("You can't use that while using Zanzoken.", Color(1, 0.5, 0.4))
				return
			var amount := roundf(float(P["ki"]) * float(P.get("kicharge", 0.5)))
			if amount < 1:
				msg("You don't have enough Ki.", Color(1, 0.5, 0.4))
				return
			P["ki"] = float(P["ki"]) - amount
			# skills.dm: beamdmg = amount x power x (focus x 2) / max focus
			var dmg := amount * float(t.get("power", 1.0)) * (float(P["focus"]) * 2.0) / 1000.0
			if key == "SpiritBomb":
				dmg *= 2.0
			cooldowns["t:" + key] = now + 1500.0
			msg("%s!" % t["name"], Color(0.6, 0.9, 1))
			_fire(t, dmg, pe.dir)
		"blast":
			var kiperc := float(P["maxki"]) * 0.01
			if float(P["ki"]) < kiperc:
				msg("You don't have enough Ki.", Color(1, 0.5, 0.4))
				return
			P["ki"] = float(P["ki"]) - kiperc
			cooldowns["t:" + key] = now + 500.0
			_fire(t, kiperc * 1.25, pe.dir)
		"bind":
			var n := 0
			for m in monsters:
				if m.z == pe.z and not m.dead and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= 5:
					m.stun_until = now + 5000.0
					n += 1
			cooldowns["t:" + key] = now + 20000.0
			msg("%s! %d enemies can't move." % [t["name"], n], Color(0.9, 0.7, 1))
		"utility":
			utility(key)


func _fire(t: Dictionary, dmg: float, d: int) -> void:
	var pr := Mob.new()
	pr.kind = "proj"
	pr.x = pe.x
	pr.y = pe.y
	pr.z = pe.z
	pr.from_x = pr.x
	pr.from_y = pr.y
	pr.dir = d
	pr.icon = Data.icon_id(t.get("icon", "cki.dmi"))
	if pr.icon < 0:
		pr.icon = Data.icon_id("cki.dmi")
	pr.state = ""
	pr.layer = 5.0
	pr.dense = false
	pr.owner = pe
	pr.damage = dmg
	pr.tech = t
	pr.steps = 10
	pr.next_step = now + 30
	world.add(pr)
	projectiles.append(pr)


func update_projectiles() -> void:
	for pr in projectiles:
		if pr.dead or now < pr.next_step:
			continue
		pr.next_step = now + 45.0
		var nx: int = pr.x + Data.DIR_DX[pr.dir]
		var ny: int = pr.y + Data.DIR_DY[pr.dir]
		var hit: Mob = null
		for o in world.at(nx, ny, pr.z):
			if o != pr.owner and not o.dead and o.kind == "monster" and _hostile(o):
				hit = o
				break
		var tur := Data.turf(nx, ny, pr.z)
		if hit:
			_hit_monster(hit, pr.damage, Color(0.5, 0.9, 1))
			_kill_proj(pr)
			continue
		if tur.is_empty() or int(tur.get("dense", 0)) == 1 or pr.steps <= 0:
			_kill_proj(pr)
			continue
		if pr.tech.get("kind", "") == "beam":
			var tr := Mob.new()
			tr.kind = "proj"
			tr.x = pr.x
			tr.y = pr.y
			tr.z = pr.z
			tr.from_x = tr.x
			tr.from_y = tr.y
			tr.dir = pr.dir
			tr.icon = pr.icon
			tr.layer = 4.9
			tr.dense = false
			world.add(tr)
			pr.trail.append(tr)
		world.move(pr, nx, ny, pr.z, pr.next_step - now, now)
		pr.steps -= 1
	projectiles = projectiles.filter(func(p): return not p.dead)


func _kill_proj(pr: Mob) -> void:
	pr.dead = true
	world.remove(pr)
	var tr: Array = pr.trail
	after(250, func(): _remove_all(tr))


func _remove_all(lst: Array) -> void:
	for t in lst:
		world.remove(t)


func utility(key: String) -> void:
	match key:
		"Fly":
			toggle_fly()
		"PowerUp":
			if busy == "powerup":
				stop_busy()
			elif float(P["pl"]) >= cap("powerlevel"):
				msg("You're at full power.", Color(0.8, 0.8, 0.8))
			else:
				_set_busy("powerup", 300.0)
				msg("An aura flickers around you.", Color(0.9, 0.9, 1))
		"Focus":
			P["pl"] = maxf(float(P["pl"]), float(P["maxpl"]))
			P["ki"] = maxf(float(P["ki"]), float(P["maxki"]))
			cooldowns["t:Focus"] = now + 30000.0
			msg("You focus your inner strength.", Color(0.9, 0.9, 1))
		"Kaioken":
			if kaioken > 0:
				kaioken = 0
				P["pl"] = minf(float(P["pl"]), cap("powerlevel"))
				msg("You release the Kaioken.", Color(0.9, 0.9, 0.9))
			elif int(P.get("form", 0)) > 0:
				msg("You can't use Kaioken while transformed.", Color(1, 0.5, 0.4))
			else:
				kaioken = 1
				P["pl"] = float(P["pl"]) * 2.0
				msg("KAIOKEN!!", Color(1, 0.4, 0.3))
			build_appearance()
		"Zanzoken":
			zanzoken = not zanzoken
			msg("You move faster than the eye can see!" if zanzoken else "You slow down and reappear.", Color(0.8, 0.9, 1))
			if zanzoken:
				for m in monsters:
					if m.target == pe:
						m.target = null
		"Tayioken":
			var n := 0
			for m in monsters:
				if m.z == pe.z and not m.dead and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= 6:
					m.stun_until = now + 6000.0
					m.target = null
					n += 1
			cooldowns["t:Tayioken"] = now + 15000.0
			msg("TAIYOKEN!! %d enemies are blinded." % n, Color(1, 1, 0.6))
		"InstantTransmission":
			_it_menu()
		"Regeneration":
			regen = not regen
			msg("You begin to regenerate." if regen else "You stop regenerating.", Color(0.6, 1, 0.6))
		"KiAbsorb":
			absorbing = not absorbing
			msg("You get ready to absorb energy." if absorbing else "You stop absorbing.", Color(0.6, 0.9, 1))
		"Grow":
			grown = now + 60000.0
			P["pl"] = float(P["pl"]) * 1.5
			cooldowns["t:Grow"] = now + 90000.0
			msg("You grow to a giant size!", Color(0.6, 1, 0.6))
		"Sense":
			var lst: Array = []
			for m in monsters:
				if m.z == pe.z and not m.dead and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= 30:
					lst.append("%s (%d,%d): %s" % [m.name, m.x, m.y, fmt(m.powerlevel)])
			ask("Sense", "\n".join(lst.slice(0, 14)) if not lst.is_empty() else "You sense nothing nearby.", ["OK"], func(_c: String, _i: int): pass)
		"Enrage":
			enrage()


func toggle_fly() -> void:
	if pe.flying:
		pe.flying = false
		msg("You float to the ground...", Color(0.8, 0.8, 0.9))
	else:
		if busy != "":
			stop_busy()
		pe.flying = true
		msg("You begin to float above....", Color(0.8, 0.8, 0.9))
	_update_state()


func _it_menu() -> void:
	var opts: Array = []
	for k in P.get("known", []):
		opts.append(k)
	if opts.is_empty():
		msg("You don't know anyone to teleport to yet. Talk to people first.", Color(0.8, 0.8, 0.8))
		return
	opts.append("Cancel")
	ask("Instant Transmission", "Who do you want to teleport to?", opts, func(c: String, _i: int):
		for z in world.ents:
			for o in world.ents[z]:
				if o.kind == "npc" and o.name == c:
					teleport(o.x, o.y - 1, o.z)
					return)


## /obj/techs/enrage: needs full anger (10). Saiyans may awaken Super Saiyan (mob SSJ()).
func enrage() -> void:
	if int(P["anger"]) < 10:
		msg("You aren't angry enough yet (anger %d / 10). You get angry when you're knocked out." % int(P["anger"]), Color(0.9, 0.7, 0.5))
		return
	P["anger"] = 1
	cooldowns["t:Enrage"] = now + 30000.0
	pe.do_flick("enrage", now)
	P["pl"] = float(P["pl"]) + randf_range(1, float(P["maxpl"]))
	msg("You explode with rage!", Color(1, 0.4, 0.3))
	if P["race"] in ["Saiyan", "Half-Saiyan"] and P.get("formset", "") == "":
		if float(P["maxpl"]) >= 1200000 and float(P["maxki"]) >= 500000 and randi_range(1, 3) != 1:
			P["formset"] = "ssj"
			msg("A golden aura surrounds your body... You have discovered Super Saiyan!", Color(1, 0.85, 0.2))


func transform() -> void:
	var fl := forms_for()
	if fl.is_empty():
		msg("You don't have a transformation yet.", Color(0.8, 0.8, 0.8))
		return
	if busy in ["meditate", "rest"]:
		msg("You can't transform while meditating or resting.", Color(1, 0.5, 0.4))
		return
	if float(P["stam"]) < 0.5 * float(P["maxstam"]):
		msg("You are too tired to transform.", Color(1, 0.5, 0.4))
		return
	var cur := int(P.get("form", 0))
	if cur >= fl.size():
		msg("You are already at your strongest form.", Color(0.8, 0.8, 0.8))
		return
	var nf: Array = fl[cur]
	if float(P["maxpl"]) < float(nf[1]):
		msg("You need %s max powerlevel for %s." % [fmt(nf[1]), nf[0]], Color(1, 0.5, 0.4))
		return
	if kaioken > 0:
		kaioken = 0
	P["form"] = cur + 1
	P["form_name"] = nf[0]
	P["pl"] = cap("powerlevel")
	P["ki"] = cap("ki")
	pe.do_flick("enrage", now)
	msg("You transform: %s! (x%s)" % [nf[0], str(nf[2])], Color(1, 0.85, 0.2))
	build_appearance()


func revert(quiet := false) -> void:
	if int(P.get("form", 0)) == 0:
		return
	P["form"] = 0
	P["form_name"] = "Normal"
	P["pl"] = minf(float(P["pl"]), float(P["maxpl"]))
	P["ki"] = minf(float(P["ki"]), float(P["maxki"]))
	if not quiet:
		msg("You revert back to your normal state.", Color(0.8, 0.8, 0.8))
	build_appearance()


# =================================================================== monster AI
## monsters.dm action(): evil monsters hunt good/neutral players weaker than 40x their power;
## friendly ones hunt evil players.
func think(m: Mob) -> void:
	m.next_think = now + 700.0
	if now < m.stun_until:
		return
	var dx := pe.x - m.x
	var dy := pe.y - m.y
	var dist := maxi(absi(dx), absi(dy))
	var hidden: bool = zanzoken or pe.flying or Data.is_safe(pe.x, pe.y, pe.z) or P.get("newb", false)
	var wants := _hostile(m) and float(P["pl"]) < m.powerlevel * 40.0
	if not hidden and (m.target == pe or (wants and dist <= 6)) and dist <= 12:
		if dist <= 1:
			m.dir = dir_to(dx, dy)
			monster_attack(m)
		else:
			m.next_think = now + 450.0
			_chase(m, dx, dy)
		return
	m.target = null
	if randf() < 0.5:
		var d: int = [1, 2, 4, 8][randi() % 4]
		if absi(m.x - m.home.x) > 6 or absi(m.y - m.home.y) > 6:
			d = dir_to(m.home.x - m.x, m.home.y - m.y)
		_step_mob(m, d)


func _chase(m: Mob, dx: int, dy: int) -> void:
	if _step_mob(m, dir_to(dx, dy)):
		return
	if dx != 0 and _step_mob(m, 4 if dx > 0 else 8):
		return
	if dy != 0 and _step_mob(m, 1 if dy > 0 else 2):
		return


func _step_mob(m: Mob, d: int) -> bool:
	var nx: int = m.x + Data.DIR_DX[d]
	var ny: int = m.y + Data.DIR_DY[d]
	m.dir = d
	if not world.can_enter(m, nx, ny, m.z) or Data.is_safe(nx, ny, m.z):
		return false
	if Data.turf(nx, ny, m.z).has("enter"):
		return false
	world.move(m, nx, ny, m.z, 300, now)
	return true


# =================================================================== training
func _set_busy(kind: String, first: float) -> void:
	busy = kind
	busy_next = now + first
	_update_state()
	build_appearance()


func stop_busy() -> void:
	if busy == "":
		return
	var t: String = {"train": "You stop training.", "meditate": "You relieve yourself from your meditative state.", "rest": "You stop resting.", "block": "You throw down your arms."}.get(busy, "")
	if t != "":
		msg(t, Color(0.8, 0.8, 0.8))
	busy = ""
	_update_state()
	build_appearance()


func _update_state() -> void:
	match busy:
		"meditate", "rest":
			pe.state = "meditate"
		"train":
			pe.state = ""
		_:
			pe.state = "buku" if pe.flying and Data.has_state(pe.icon, "buku") else ""


func _toggle(kind: String, start_msg: String) -> void:
	if busy == kind:
		stop_busy()
		return
	if pe.flying and kind != "block":
		msg("You can't do that while flying.", Color(1, 0.6, 0.4))
		return
	if int(P.get("form", 0)) > 0 and kind in ["meditate", "rest"]:
		msg("You can't meditate/rest while being transformed.", Color(1, 0.6, 0.4))
		return
	_set_busy(kind, 1000.0)
	msg(start_msg, Color(0.7, 0.8, 1))


## hud train button / Dummy Train / Dummy2 TrainII
func train_menu() -> void:
	if busy == "train":
		stop_busy()
		return
	if float(P["stam"]) <= 0:
		msg("You are too tired to train.", Color(1, 0.5, 0.4))
		return
	train_tier = 1
	if _near("/mob/other/Dummy2", 1) != null:
		train_tier = 4
	elif _near("/mob/other/Dummy", 1) != null:
		train_tier = 2
	var where: String = ["Self-Training", "Class I Dummy (2x)", "", "Class II Dummy (4x)"][train_tier - 1]
	ask(where, "Select a type of training.", ["Punches", "Kicks", "Ki", "None"], _on_train)


func _on_train(c: String, _i: int) -> void:
	if c == "None":
		stop_busy()
		return
	if pe.flying:
		toggle_fly()
	train_kind = c
	_set_busy("train", 1200.0)
	msg("You begin training your %s." % c.to_lower(), Color(0.7, 0.9, 0.7))


func busy_tick() -> void:
	match busy:
		"train":
			# punchcheck / kickcheck / kicheck (+ the dummy variants 2 and 3)
			busy_next = now + (1200.0 if train_kind == "Punches" and train_tier == 1 else 1500.0)
			if float(P["stam"]) <= 0:
				msg("You have become too tired and have stopped training.", Color(1, 0.4, 0.4))
				P["stam"] = 0.0
				stop_busy()
				return
			var k := float(train_tier)
			pe.do_flick({"Punches": "punch", "Kicks": "kick", "Ki": "kiblast"}.get(train_kind, "punch"), now)
			use_stamina({"Punches": 5.0, "Kicks": 2.0, "Ki": 2.0 if train_tier == 1 else 4.0}.get(train_kind, 5.0))
			gain_skexp(randi_range(1, 3) if train_tier == 1 else randi_range(3, 7))
			if randi_range(0, 2) > 0:
				var mp := float(P["maxpl"])
				var mk := float(P["maxki"])
				var ms := float(P["maxstam"])
				match train_kind:
					"Punches":
						grow(1 + mp * 0.0002 * k, 1 + mk * 0.0002 * k, 1 + ms * 0.00004 * k)
					"Kicks":
						grow(1 + mp * 0.0004 * k, 0, 1 + ms * 0.00004 * k)
					"Ki":
						grow(0, 1 + mk * 0.0004 * k, 1 + ms * 0.00004 * k)
		"rest":
			# rest(): stamina back, powerlevel regenerates with focus
			busy_next = now + randf_range(1000, 3000)
			P["stam"] = minf(float(P["maxstam"]), float(P["stam"]) + float(P["maxstam"]) * 0.01 * randi_range(3, 10))
			if float(P["pl"]) < float(P["maxpl"]):
				P["pl"] = minf(float(P["maxpl"]), float(P["pl"]) + float(P["focus"]) * float(P["maxpl"]) * 0.0001 + 1)
			if float(P["stam"]) >= float(P["maxstam"]) and float(P["pl"]) >= float(P["maxpl"]):
				msg("You stop resting.", Color(0.8, 0.8, 0.8))
				busy = ""
				_update_state()
		"meditate":
			# meditate(): every 3 s
			busy_next = now + 3000.0
			P["stam"] = minf(float(P["maxstam"]), float(P["stam"]) + float(P["maxstam"]) * 0.01 * randi_range(1, 2))
			if float(P["ki"]) < float(P["maxki"]):
				P["ki"] = minf(float(P["maxki"]), float(P["ki"]) + float(P["maxki"]) * float(P["focus"]) * 0.0001)
			P["focus"] = minf(1000.0, float(P["focus"]) + randi_range(50, 100))
			if randf() < 0.01:
				var ki := randi_range(1, 2)
				P["maxki"] = float(P["maxki"]) + ki
				msg("You feel that you have gained some ki.", Color(0.6, 0.8, 1))
			learn_checks()
		"powerup":
			busy_next = now + 600.0
			if float(P["stam"]) <= 10 or float(P["pl"]) >= cap("powerlevel"):
				stop_busy()
				return
			P["pl"] = minf(cap("powerlevel"), float(P["pl"]) + roundf(float(P["maxpl"]) / randf_range(8, 10)))
			use_stamina(randi_range(1, 5))
		"block":
			busy_next = now + 25000.0
			stop_busy()


func _near(path: String, r: int) -> Mob:
	for dx in range(-r, r + 1):
		for dy in range(-r, r + 1):
			for o in world.at(pe.x + dx, pe.y + dy, pe.z):
				if o.path == path:
					return o
	return null


# =================================================================== equipment
func use_equipment(o: Mob) -> void:
	if pe.flying:
		msg("Not while flying.", Color(1, 0.6, 0.4))
		return
	if o.path.find("Gravitron") >= 0:
		ask("Gravitron", "Input an amount of gravity. (It is suggested that you train to at least 1,000 powerlevel first.)\nCurrently: %s" % ("%dx" % int(grav) if grav > 0 else "off"),
			["Off", "10x", "25x", "50x", "100x", "200x", "300x", "Cancel"], _on_grav)
		return
	match o.path:
		"/obj/WeightTraining100", "/obj/WeightTraining1000":
			if cooldown_left("lift") > 0:
				return
			if float(P["stam"]) < 5:
				msg("You feel too weak.", Color(1, 0.5, 0.4))
				return
			cooldowns["lift"] = now + 1000.0
			use_stamina(2)
			var big := o.path.ends_with("1000")
			grow((0.15 if randf() < 0.5 else 0.075) * (10.0 if big else 1.0), 0, 0)
			gain_skexp(1 if randf() < 0.3 else 0)
			world.floater(pe.x, pe.y, pe.z, "lift", Color(0.6, 1, 0.6))
		"/obj/pbag":
			if cooldown_left("bag") > 0:
				return
			cooldowns["bag"] = now + 900.0
			pe.do_flick("punch", now)
			use_stamina(randi_range(0, 3))
			grow(1 + float(P["maxpl"]) * 0.0000028, 0, 0)
		"/obj/Machine":
			if cooldown_left("machine") > 0:
				return
			cooldowns["machine"] = now + 1500.0
			var z := randi_range(1, 100)
			P["zenni"] = float(P["zenni"]) + z
			msg("You hit the machine and win %d zenni." % z, Color(1, 0.9, 0.4))
		"/obj/heal":
			P["pl"] = maxf(float(P["pl"]), float(P["maxpl"]))
			P["stam"] = float(P["maxstam"])
			msg("You feel healed.", Color(0.6, 1, 0.6))


func _on_grav(c: String, _i: int) -> void:
	if c == "Cancel":
		return
	if c == "Off":
		gravity_off("The gravity begins to shut down.")
		return
	if P.get("newb", false):
		msg("You can't use the gravity while being immortal!", Color(1, 0.5, 0.4))
		return
	grav = float(c.trim_suffix("x"))
	grav_next = now + 2000.0
	msg("You hear the machine turn on... (%dx gravity)" % int(grav), Color(0.6, 0.9, 1))


func gravity_off(text := "") -> void:
	if grav <= 0.0:
		return
	grav = 0.0
	if text != "":
		msg(text, Color(0.7, 0.9, 0.7))


## objs.dm playergravity(): drains stamina; the pull hurts but makes you stronger
func gravity_pull() -> void:
	grav_next = now + 2000.0
	if busy in ["meditate", "rest"]:
		gravity_off("You can't meditate/rest while using the gravity!")
		return
	use_stamina(1)
	if float(P["stam"]) <= 0:
		gravity_off("You don't have any stamina to last against the gravity!")
		return
	if randi_range(1, 4) == 1:
		var dmg := grav * randi_range(5, 30)
		P["pl"] = float(P["pl"]) - dmg
		world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.8, 0.3))
		msg("You feel the gravity pull down on you. You seem stronger.", Color(0.7, 0.9, 0.7))
		grow(1 + float(P["maxpl"]) * 0.00002 * grav, 0, 0)
		gain_skexp(randi_range(1, 2))
		if float(P["pl"]) <= 0:
			gravity_off()
			player_ko(null, "The gravity is too much: you pass out!")


# =================================================================== periodic
func second_tick() -> void:
	P["playtime"] = float(P["playtime"]) + 1.0
	if kaioken > 0:
		use_stamina(2)
		if float(P["stam"]) <= 0:
			utility("Kaioken")
			msg("Your body can't take the Kaioken anymore!", Color(1, 0.5, 0.4))
	if zanzoken:
		use_stamina(1)
		if float(P["stam"]) <= 1:
			zanzoken = false
			msg("You are too tired to keep up Zanzoken.", Color(1, 0.6, 0.4))
	if regen:
		P["pl"] = minf(float(P["maxpl"]), float(P["pl"]) + float(P["maxpl"]) * 0.02)
		if float(P["pl"]) >= float(P["maxpl"]):
			regen = false
	if int(P.get("form", 0)) > 0:
		use_stamina(maxf(0.2, float(P["maxstam"]) * 0.004))
		if float(P["stam"]) <= 0:
			msg("You are too tired to stay transformed.", Color(1, 0.6, 0.4))
			revert()
	if P["race"] == "Android (Mechanical)" and int(P["playtime"]) % 20 == 0 and float(P["ki"]) < float(P["maxki"]):
		P["ki"] = float(P["maxki"])
		msg("Your Ki has been restored back to normal!", Color(0.6, 0.8, 1))
	if busy == "" and not pe.mid_step(now):
		P["stam"] = minf(float(P["maxstam"]), float(P["stam"]) + float(P["maxstam"]) * 0.002)


# =================================================================== NPCs
func interactables() -> Array:
	var out: Array = []
	for dx in range(-1, 2):
		for dy in range(-1, 2):
			for o in world.at(pe.x + dx, pe.y + dy, pe.z):
				if o != pe and (o.kind == "npc" or o.kind == "equip") and not o.dead and not o.invisible and o.icon >= 0:
					out.append(o)
	# King Yemma sits behind a huge desk: the original let you double-click him from afar
	if out.is_empty():
		var y := _near("/mob/other/yemma", 6)
		if y != null:
			out.append(y)
	out.sort_custom(func(a, b): return (0 if a.kind == "npc" else 1) * 10 + absi(a.x - pe.x) + absi(a.y - pe.y) < (0 if b.kind == "npc" else 1) * 10 + absi(b.x - pe.x) + absi(b.y - pe.y))
	return out


func interact(o: Mob = null) -> void:
	if o == null:
		var l := interactables()
		if l.is_empty():
			msg("There is no one here to talk to.", Color(0.6, 0.6, 0.6))
			return
		o = l[0]
	if o.kind == "equip":
		use_equipment(o)
		return
	if o.path in ["/mob/other/Dummy", "/mob/other/Dummy2"]:
		train_menu()
		return
	if o.name != "" and not o.name in P["known"]:
		(P["known"] as Array).append(o.name)
	var key: String = o.path.get_file()
	var none := func(_c: String, _i: int): pass
	match key:
		"Intro":
			ask("Intro 1", "Hello and welcome to Dragonball Online! Train, meditate and rest with the buttons on the right. Your hometown awaits when you're ready - talk to Intro 2.", ["OK"], none)
		"Intro2":
			ask("Intro 2", "It looks like you're ready to venture into the world of Dragonball Online! Are you ready to go? You can never come back here again!", ["Yes", "No"], func(c: String, _i: int):
				if c == "Yes":
					P["dead"] = false
					P["newb"] = false
					teleport(int(P["hx"]), int(P["hy"]), int(P["hz"]))
					msg("You have been transported to your hometown!", Color(0.6, 1, 0.6))
					build_appearance())
		"Ki_Trainer1", "Ki_Trainer2":
			_ki_trainer(o)
		"yemma":
			_yemma()
		"kingkai":
			_king_kai()
		"bubbles", "gregory":
			if int(P.get("kaistart", 0)) > 0:
				P[key] = true
				ask("King Kai", "You caught %s! Come talk to me again." % key.capitalize(), ["OK"], none)
			else:
				ask(key.capitalize(), "Ook ook!", ["OK"], none)
		"Kame":
			var opts: Array = []
			if not "Kamehameha" in P["learned"]:
				opts.append("Learn Kamehameha")
			if P["race"] == "Earthling" and P.get("formset", "") == "":
				opts.append("Super Human (400,000 max PL)")
			opts.append("Leave")
			ask("Kame-sennin", "Greetings! I am the Turtle Hermit.", opts, func(c: String, _i: int):
				if c == "Learn Kamehameha":
					_learn("Kamehameha", "Kame-sennin teaches you the Kamehameha!")
				elif c.begins_with("Super Human"):
					if float(P["maxpl"]) >= 400000:
						P["formset"] = "superh"
						msg("Kame-sennin unlocks your hidden power: you can transform to Super Human!", Color(1, 0.85, 0.3))
					else:
						msg("You need to be stronger.", Color(1, 0.6, 0.4)))
		"dende":
			if P["race"] == "Namek" and P.get("formset", "") == "" and float(P["maxpl"]) >= 1200000:
				P["formset"] = "snj"
				ask("Dende", "I sense great power in you. You can now become a Super Namek!", ["OK"], none)
			else:
				P["pl"] = maxf(float(P["pl"]), float(P["maxpl"]))
				ask("Dende", "Let me heal you.", ["OK"], none)
		"Frieza":
			_teacher(o, "Frieza", ["DeathBeam"], "transform" if P["race"] == "Changling" else "")
		"Gero":
			_teacher(o, "Gero", [], "supera" if P["race"] == "Android (Mechanical)" and float(P["maxpl"]) >= 2600000 else "")
		"Piccolo", "Vegeta", "Tenshinhan", "Yamcha", "Trunks", "Guldo", "Brolli", "Goku", "Yardrat1":
			_teacher(o, key, [], "")
		"Shopkeeper", "Shopkeeper2", "Shopkeeper4", "Shopkeeper5", "NamekShopkeeper", "SaiyanShopkeeper", "SaiyanShopkeeper2":
			_shop(o)
		"Barber":
			if not RACE_DATA[P["race"]].get("hair", false):
				ask("Barber", "Sorry, I can't cut that.", ["OK"], none)
			else:
				var opts2: Array = HAIRS.keys()
				opts2.append("Leave")
				ask("Barber", "What hair style do you want?", opts2, func(c: String, _i: int):
					if HAIRS.has(c):
						P["hair"] = c
						build_appearance())
		_:
			var d: Dictionary = Data.mobs.get(o.path, {})
			var talk: String = d.get("talk", "")
			ask(o.name, talk if talk != "" else "Hello, %s." % P["name"], ["OK"], none)


## Teachers: techniques cost skill points and need a minimum max powerlevel / max Ki (mobs.dm Learn verbs)
func _teacher(o: Mob, teacher: String, extra: Array, form_set: String) -> void:
	var lines: Array = []
	var opts: Array = []
	for k in TECHS:
		var t: Dictionary = TECHS[k]
		if t.get("teacher", "") != teacher and not k in extra:
			continue
		if t.has("race") and not P["race"] in t["race"]:
			continue
		var done: bool = k in P["learned"]
		lines.append("%s — %s%s" % [t["name"], t["learn"], " (learned)" if done else ""])
		if not done:
			opts.append("Learn " + t["name"])
	if form_set != "" and P.get("formset", "") == "":
		opts.append("Unlock transformation")
		lines.append("Your race's transformation can be unlocked here.")
	opts.append("Leave")
	ask(o.name, ("You have %d skill points.\n" % int(P["skpts"])) + ("\n".join(lines) if not lines.is_empty() else "I have nothing to teach you."), opts, func(c: String, _i: int):
		if c == "Unlock transformation":
			P["formset"] = form_set
			msg("%s unlocks your transformation! (Transform)" % o.name, Color(1, 0.85, 0.3))
			return
		for k in TECHS:
			if c == "Learn " + TECHS[k]["name"]:
				var t2: Dictionary = TECHS[k]
				if float(P["maxpl"]) < float(t2.get("pl", 0)) or float(P["maxki"]) < float(t2.get("ki", 0)):
					msg("You need to be a bit stronger.", Color(1, 0.6, 0.4))
				elif int(P["skpts"]) < int(t2.get("sp", 0)):
					msg("You need %d skill points!" % int(t2.get("sp", 0)), Color(1, 0.6, 0.4))
				else:
					P["skpts"] = int(P["skpts"]) - int(t2.get("sp", 0))
					_learn(k, "%s teaches you %s!" % [o.name, t2["name"]]))


func _ki_trainer(o: Mob) -> void:
	var opts: Array = []
	for l in KI_LESSONS:
		if not knows(l[0]):
			opts.append("%s - %d skill points" % [l[1], l[2]])
	opts.append("Cancel")
	ask(o.name, "Greetings %s. What do you wish to learn today? (You have %d skill points.)" % [P["name"], int(P["skpts"])], opts, func(c: String, _i: int):
		for l in KI_LESSONS:
			if c.begins_with(l[1] + " -"):
				if l[4] != "" and not knows(l[4]):
					msg("You need to learn the previous Ki lesson first!", Color(1, 0.6, 0.4))
				elif int(P["skpts"]) < int(l[2]):
					msg("You need skill points!", Color(1, 0.6, 0.4))
				else:
					P["skpts"] = int(P["skpts"]) - int(l[2])
					P["know"][l[0]] = 1
					P["maxki"] = float(P["maxki"]) + float(l[3])
					msg("You have learned %s!" % l[1], Color(0.5, 0.75, 1))
					learn_checks())


## King Yemma judges the dead by alignment
func _yemma() -> void:
	if not P.get("dead", false) or P.get("newb", false):
		ask("King Yemma", "You're not dead! Get out of here.", ["OK"], func(_c: String, _i: int): pass)
		return
	var ap := int(P["ap"])
	var where := "Snake Way"
	if ap < -25:
		where = "Hell"
	elif ap <= 25:
		where = ["Snake Way", "Hell", "Hell", "Heaven", "Heaven"][randi() % 5]
	ask("King Yemma", "Hmm... Go to %s!" % where, ["OK"], _on_yemma.bind(where))


func _on_yemma(_c: String, _i: int, where: String) -> void:
	match where:
		"Snake Way": teleport(74, 2, 2)
		"Hell": teleport(74, 76, 8)
		"Heaven": teleport(144, 7, 24)


## King Kai: catch Bubbles, then Gregory; then he sends you back to life and teaches
func _king_kai() -> void:
	var opts: Array = []
	var text := "Greetings, I am King Kai."
	if int(P.get("kaistart", 0)) == 0:
		text += " Do you wish to undergo my training? Go capture Bubbles and Gregory, then come talk to me again."
		opts.append("Yes")
	elif P.get("bubbles", false) and P.get("gregory", false):
		text += " You have completed my training!"
		if float(P["maxpl"]) >= 12000 and knows("kicntrl") and not "Kaioken" in P["learned"]:
			opts.append("Learn Kaioken (20 SP)")
		if float(P["maxpl"]) >= 14000 and knows("kicombt") and not "SpiritBomb" in P["learned"]:
			opts.append("Learn Spirit Bomb (30 SP)")
		if P.get("dead", false):
			opts.append("Send me back to Earth")
	else:
		text += " You still have to catch Bubbles%s." % (" and Gregory" if not P.get("gregory", false) else "")
	opts.append("Leave")
	ask("King Kai", text, opts, _on_king_kai)


func _on_king_kai(c: String, _i: int) -> void:
	match c:
		"Yes":
			P["kaistart"] = 1
		"Learn Kaioken (20 SP)":
			if int(P["skpts"]) >= 20:
				P["skpts"] = int(P["skpts"]) - 20
				_learn("Kaioken", "King Kai teaches you the Kaioken!")
			else:
				msg("You need 20 skill points!", Color(1, 0.6, 0.4))
		"Learn Spirit Bomb (30 SP)":
			if int(P["skpts"]) >= 30:
				P["skpts"] = int(P["skpts"]) - 30
				_learn("SpiritBomb", "King Kai teaches you the Spirit Bomb!")
			else:
				msg("You need 30 skill points!", Color(1, 0.6, 0.4))
		"Send me back to Earth":
			msg("You have completed my training! I will now send you back to Earth!", Color(0.8, 1, 0.8))
			revive()


func _pay(z: float) -> bool:
	if float(P["zenni"]) < z:
		msg("Sorry, you don't have enough zenni.", Color(1, 0.6, 0.4))
		return false
	P["zenni"] = float(P["zenni"]) - z
	return true


func _shop(o: Mob) -> void:
	var opts: Array = []
	for it in SHOP:
		opts.append("%s (%s z)" % [it[0], fmt(it[1])])
	if not (P["worn"] as Array).is_empty():
		opts.append("Take off clothes")
	opts.append("Leave")
	ask(o.name if o.name != "" else "Shop", "What would you like? You have %s zenni." % fmt(P["zenni"]), opts, _on_shop)


func _on_shop(c: String, i: int) -> void:
	if c == "Take off clothes":
		P["worn"] = []
		build_appearance()
		return
	if i < 0 or i >= SHOP.size() or not c.begins_with(SHOP[i][0]):
		return
	var it: Array = SHOP[i]
	if not _pay(float(it[1])):
		return
	match it[2]:
		"senzu":
			P["items"]["senzu"] = int(P["items"].get("senzu", 0)) + 1
			msg("You buy a Senzu Bean.", Color(0.6, 1, 0.6))
			var hb: Array = P["hotbar"]
			if not "senzu" in hb and hb.find("") >= 0:
				hb[hb.find("")] = "senzu"
		"weight":
			P["weight"] = int(P.get("weight", 0)) + 1
			msg("You buy weighted clothing: training gives a little more.", Color(0.8, 0.9, 1))
		_:
			var w: Array = P["worn"]
			if not it[2] in w:
				w.append(it[2])
			msg("You put on the %s." % it[0], Color(0.8, 0.9, 1))
			build_appearance()


func eat_senzu() -> void:
	if int(P["items"].get("senzu", 0)) <= 0:
		msg("You don't have any Senzu Beans.", Color(0.8, 0.8, 0.8))
		return
	P["items"]["senzu"] = int(P["items"]["senzu"]) - 1
	P["pl"] = maxf(float(P["pl"]), float(P["maxpl"]))
	P["ki"] = maxf(float(P["ki"]), float(P["maxki"]))
	P["stam"] = float(P["maxstam"])
	msg("You feel better as you eat a Senzu Bean.", Color(0.6, 1, 0.6))


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
	if what == NOTIFICATION_APPLICATION_PAUSED or what == NOTIFICATION_WM_CLOSE_REQUEST:
		save()
