extends Node
## Gameplay rules ported from DBZ Savages (Zeta.dme by DragonSlayer4000).
## Sources: new_char_handling.dm (creation), mobs.dm (Levelup, Resting, meditate, Healing,
## punchcheck/kickcheck/kicheck, mentors), battle_system.dm (Attack1, KO, Die, FormTwo, SSJ,
## FlightLearn/KiTechLearn/AuraTechLearn/FocusLearn), objs.dm (training equipment, techniques,
## transformations, gravity), skills.dm and the NPC verbs.

signal log_msg(text: String, color: Color)
signal dialog(title: String, text: String, options: Array, cb: Callable)

const SAVE_PATH := "user://savages_save.json"
const SPAWN := Vector3i(77, 85, 1)            # mob/Login: src.loc = locate(77,85,1)
const AFTERLIFE := Vector3i(54, 9, 3)         # Die(): src.loc = locate(54,9,3)
const SKILLS := []                            # (no skill levels in this game; kept for the UI)
const SKILL_NAMES := {}
const ZNAMES := {1: "Earth", 2: "Snake Way", 3: "Interiors & Other World", 4: "Training Grounds",
	5: "Namek", 6: "Snowlands", 7: "Desert Planet", 8: "Hell", 9: "City & Mall", 10: "King Kai's Planet",
	11: "Android Base", 12: "Training Hall", 14: "The Lookout", 15: "Hyperbolic Time Chamber", 20: "Area 20"}
const HOTBAR_VERSION := 1

## Races offered at creation (new_char_handling.dm CreateNewCharacter).
const RACES := ["Earth-sei-jin", "Saiya-jin", "Halfbreed", "Namek-sei-jin", "Biological Android", "Android", "Changling", "Demon"]
const RACE_INFO := {
	"Earth-sei-jin": "Humans of Earth. Pick your look and hair colour. Learn Kaioken and Mystic power later.",
	"Saiya-jin": "Warrior race with a tail. Enrage can awaken Super Saiya-jin; Transform reaches SSJ4.",
	"Halfbreed": "Half human, half Saiya-jin. Can become Super Saiya-jin or Mystic.",
	"Namek-sei-jin": "Nameks can become Super Namek through Enrage.",
	"Biological Android": "Starts at 100 powerlevel. Type 001 looks human; the Cell type can transform twice.",
	"Android": "Built by Dr. Gero. Starts at 100 powerlevel. Gero can upgrade you to Super Android.",
	"Changling": "Frieza's race: three transformations unlocked through Enrage.",
	"Demon": "Janemba's kin. Starts with 800 powerlevel and 2 strength.",
	"Buu Demon": "A rare Buu Demon (1 in 75). Knows Wrap, Regeneration, Universal Scan, Ki Absorb and Kaioken.",
}
const SKINS := {"White (Pale)": "male-white.dmi", "Tan": "male.dmi", "Dark Brown": "male-black.dmi", "Olive": "male-olive.dmi"}
const HAIRS := {"Bald": "", "Long": "hair_black_long.dmi", "Spikey": "hair_black_spikey.dmi", "Short": "hair_black_short.dmi",
	"Goku": "hair_goku.dmi", "Vegeta": "hair_vegeta.dmi", "Gohan": "hair_Gohan.dmi"}
const ANDROID_HAIRS := ["Bald", "Short", "Spikey", "Long"]
const FACIAL := {"None": "", "Goatee": "black_goatee.dmi", "Goat": "black_goat.dmi", "Mustache": "black_mustache.dmi"}
const STYLES := ["Kame", "Piccolo", "Vegeta", "Tien"]
const FACES := {"None": "default.dmi", "Goku": "goku.bmp", "Gohan": "gohan.bmp", "Vegeta": "vegeta.bmp", "Trunks": "trunks.bmp",
	"Goten": "goten.bmp", "Kami": "kame.bmp", "Dende": "dende.bmp", "Turles": "turles.bmp", "Vegeta2": "vegeta2.bmp", "Frieza": "icer.bmp"}

## Techniques. kind: beam (Ki amount / target DEF), blast, disc (amount, ignores DEF), bind, buff, utility.
## learn: where the original grants it.
const TECHS := {
	"KiBlast": {"name": "Ki Blast", "kind": "blast", "icon": "kame5b.dmi", "glyph": "KI", "learn": "Ki Tech at 150 max powerlevel", "desc": "Strength x5 damage for 100 Ki."},
	"Kamehameha": {"name": "Kame Hame Ha", "kind": "beam", "icon": "kame.dmi", "glyph": "KHH", "learn": "Kame-sennin, average stat 10"},
	"Masenko": {"name": "Masenko", "kind": "beam", "icon": "kame2.dmi", "glyph": "MSK", "learn": "Gohan (apprentice), average stat 15"},
	"FinalFlash": {"name": "Final Flash", "kind": "beam", "icon": "kame3.dmi", "glyph": "FF", "learn": "Vegeta (apprentice), average stat 8"},
	"BigBang": {"name": "Big Bang", "kind": "beam", "icon": "bigbang.dmi", "glyph": "BB", "learn": "Vegeta (apprentice), average stat 16"},
	"SpecialBeamCannon": {"name": "Special Beam Cannon", "kind": "beam", "icon": "kame4.dmi", "glyph": "SBC", "learn": "Piccolo (apprentice), average stat 10"},
	"DonDonPa": {"name": "Dondonpa", "kind": "beam", "icon": "kame5.dmi", "glyph": "DDP", "learn": "Guadil (apprentice), 15 max powerlevel"},
	"Burning": {"name": "Burning Attack", "kind": "beam", "icon": "kame6.dmi", "glyph": "BRN", "learn": "Kolan (Trunks), average stat 25"},
	"Renzuko": {"name": "Renzuko Energy Dan", "kind": "volley", "icon": "kame7.dmi", "glyph": "RZK", "learn": "750 max powerlevel", "desc": "Two blasts of Ki/50 each for 35 stamina."},
	"SpiritBomb": {"name": "Spirit Bomb", "kind": "beam", "icon": "sbomb.dmi", "glyph": "SB", "learn": "King Kai at 2,500 powerlevel", "desc": "Charges 10% more than the Ki you put in."},
	"Kienzan": {"name": "Kien-zan", "kind": "disc", "icon": "kame5b.dmi", "glyph": "KZN", "learn": "Krillin, average stat 2", "desc": "Destructo Disc: the Ki amount (max 30,000) ignores defense."},
	"GalacticDonut": {"name": "Galactic Donut", "kind": "bind", "icon": "Gdonut.dmi", "glyph": "GD", "learn": "Gotenks, average stat 20", "desc": "Traps the target for a few seconds. 100 Ki."},
	"Fly": {"name": "Bukujutsu (Fly)", "kind": "utility", "glyph": "FLY", "learn": "100 max powerlevel", "desc": "Fly over everything."},
	"PowerUp": {"name": "Power Up", "kind": "utility", "glyph": "PUP", "learn": "Aura Tech at 375 max powerlevel", "desc": "Raise your Ki towards its maximum using stamina."},
	"Focus": {"name": "Focus", "kind": "utility", "glyph": "FOC", "learn": "Focus Tech at 425 max powerlevel", "desc": "Focus your inner strength: Ki to full."},
	"Kaioken": {"name": "Kaioken", "kind": "utility", "glyph": "KAI", "learn": "King Kai at 250 powerlevel", "desc": "Each level adds 1,341 Ki (max level = max powerlevel / 1,341). Strains your stamina."},
	"Zanzoken": {"name": "Zanzoken", "kind": "utility", "glyph": "ZAN", "learn": "Gohan (apprentice), average stat 20", "desc": "Move so fast you vanish: monsters lose you. Drains stamina."},
	"Tayioken": {"name": "Tayioken", "kind": "utility", "glyph": "TAY", "learn": "Guadil (apprentice), average stat 10", "desc": "Solar Flare: blinds every monster around you."},
	"InstantTransmission": {"name": "Instant Transmission", "kind": "utility", "glyph": "IT", "learn": "King Kai at 1,000 powerlevel", "desc": "Teleport to someone you know."},
	"Regeneration": {"name": "Regeneration", "kind": "utility", "glyph": "RGN", "learn": "Buu Demons", "desc": "Regenerate 5 health a second until healed."},
	"KiAbsorb": {"name": "Ki Absorb", "kind": "utility", "glyph": "ABS", "learn": "Dr. Gero (apprentice), average stat 20", "desc": "Absorb Ki blasts aimed at you."},
	"Sense": {"name": "Sense", "kind": "utility", "glyph": "SEN", "learn": "Aura Tech at 375 max powerlevel", "desc": "Sense the powerlevels around you."},
	"Enrage": {"name": "Enrage", "kind": "utility", "glyph": "ENR", "learn": "Kolan (Trunks), average stat 10", "desc": "Release your rage: Ki to full, and it may awaken your race's transformation."},
	"Wrap": {"name": "Wrap", "kind": "bind", "icon": "assimilate.dmi", "glyph": "WRP", "learn": "Buu Demons", "desc": "Wrap a monster up. 100 Ki."},
}
## Mentors (Talk to become their apprentice, then Learn). req: avg = (STR+DEF+SPD)/3, maxpl.
const MENTORS := {
	"/mob/other/Kame": {"name": "Kame-sennin", "master": "", "teach": [["Kamehameha", "avg", 10]]},
	"/mob/other/Krillin": {"name": "Krillin", "master": "", "teach": [["Kienzan", "avg", 2]]},
	"/mob/Gohan": {"name": "Gohan", "master": "Gohan", "teach": [["Zanzoken", "avg", 20], ["Masenko", "avg", 15]]},
	"/mob/Piccolo": {"name": "Piccolo", "master": "Piccolo", "teach": [["SpecialBeamCannon", "avg", 10]]},
	"/mob/Gotenks": {"name": "Gotenks", "master": "Gotenks", "teach": [["GalacticDonut", "avg", 20]]},
	"/mob/other/Vegeta": {"name": "Vegeta", "master": "Vegeta", "teach": [["FinalFlash", "avg", 8], ["BigBang", "avg", 16]]},
	"/mob/other/Tienshinhan": {"name": "Guadil", "master": "Guadil", "teach": [["Tayioken", "avg", 10], ["DonDonPa", "maxpl", 15]]},
	"/mob/other/Gero": {"name": "Dr. Gero", "master": "Gero", "teach": [["Fly", "avg", 1], ["KiAbsorb", "avg", 20]]},
	"/mob/other/Trunks": {"name": "Kolan", "master": "", "teach": [["Enrage", "avg", 10], ["Burning", "avg", 25]]},
	"/mob/other/Goku": {"name": "Goku", "master": "Goku", "teach": [["unlock", "maxpl", 100]]},
	"/mob/other/deathtrainer": {"name": "Death", "master": "Death", "teach": [["majin", "avg", 50]]},
}
## Transformations: [name, required average stat, str, def, spd, icon (""= keep), maxpl multiplier]
const FORMS := {
	"ssj": [["Super Saiya-jin", 25, 25, 20, 0, ""], ["Ultra Super Saiya-jin", 50, 50, 35, 10, "USupersayajin.dmi"],
		["Super Saiya-jin 2", 75, 70, 50, 40, ""], ["Super Saiya-jin 3", 100, 100, 70, 60, ""], ["Super Saiya-jin 4", 135, 125, 90, 100, ""]],
	"changling": [["Form Two", 30, 25, 20, 0, "ChangeForm2.dmi"], ["Form Three", 70, 50, 35, 10, "ChangeForm3.dmi"], ["Form Four", 100, 70, 50, 40, "ChangeForm4.dmi"]],
	"cell": [["Form Two", 25, 20, 15, 0, "Cell1.dmi"], ["Form Three", 75, 50, 35, 30, "Cell2.dmi"]],
	"mystic": [["Mystic", 100, 50, 35, 0, ""]],
}
const SHOP := [["Senzu Bean", 5000, "senzu"], ["Blue Gi", 150, "clothes-bluegi.dmi"], ["Orange Gi", 150, "clothes-orangegi.dmi"],
	["Black Gi", 150, "clothes-blackgi.dmi"], ["Namek Gi", 500, "namekgi.dmi"], ["Blue Underclothing", 50, "clothes-blueunder.dmi"],
	["Orange Underclothing", 50, "clothes-orangeunder.dmi"], ["Black Underclothing", 50, "clothes-blackunder.dmi"],
	["White Boots and Gloves", 50, "gloves-boots.dmi"], ["Boxing Gloves", 100, "boxing.dmi"], ["Turben", 500, "turben.dmi"],
	["Cape", 500, "cape.dmi"], ["Saiyan Armor", 500, "saiyanarmor.dmi"], ["Scouter", 2000, "red-scouter.dmi"]]
## Monsters placed in single player at their original (re)spawn points (battle_system.dm Die()).
const MONSTER_SPAWNS := [["/mob/monsters/Raditz", 25, 138, 1], ["/mob/monsters/Vegeta", 60, 71, 9], ["/mob/monsters/Buu", 75, 75, 8]]
const MONSTER_REWARD := {"Saibaman": [50, 1, 10], "Saiya-jin (NPC)": [2500, 1, 200], "Buu (NPC)": [5000, 1, 1000],
	"Vegeta x(NPC)": [500000, 1, 1000000], "Vegeta (NPC)": [500000, 1, 1000000], "Scottish Cheese": [10, 0, 0]}

var now := 0.0
var world: Node2D
var P := {}
var pe: Mob
var monsters := {}
var projectiles: Array = []
var busy := ""              # train | meditate
var busy_next := 0.0
var train_kind := ""
var cooldowns := {}
var move_dir := 0
var last_tick := 0.0
var last_save := 0.0
var last_melee := 0.0
var timers: Array = []
var traveling := false
var running := false
var grav := 0.0             # gravitron setting (playergravity)
var grav_next := 0.0
var zanzoken := false
var absorbing := false
var regen := false
var kaioken := 0


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
const EQUIPMENT := ["/obj/Gravitron", "/obj/Gravitrontwo", "/obj/WeightTraining100", "/obj/training/SpeedBag",
	"/obj/Machine", "/obj/MeditationPad", "/obj/heal", "/obj/saibamachine2"]


func spawn_from_map(ti: int, x: int, y: int, z: int) -> void:
	var t: Dictionary = Data.types[str(ti)]
	var p: String = t["path"]
	if p.begins_with("/mob/monsters/"):
		spawn_monster(p, x, y, z, t)
		return
	if p.begins_with("/mob/other/choosing_character"):
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
	m.name = str(d.get("name", p.get_file())).capitalize()
	m.kind = "monster"
	m.path = p
	m.layer = 4.0
	var src: Dictionary = MONSTER_STATS.get(p, {})
	m.powerlevel_max = float(src.get("health", 10))       # monsters fight with their health pool
	m.powerlevel = m.powerlevel_max
	m.ki = float(src.get("pl", 100))
	m.strength = float(src.get("str", 5))
	m.defence = 1.0                                     # defense is unset in the original (0); use 1
	m.race = str(src.get("race", ""))
	m.home = Vector3i(x, y, z)
	m.aggro = true
	m.respawn = true
	m.next_think = now + randf_range(300, 1500)
	world.add(m)
	monsters[m] = true
	return m


## mobs.dm /mob/monsters/* (health, strength, powerlevel, race)
const MONSTER_STATS := {
	"/mob/monsters/saibaman": {"health": 10, "str": 5, "pl": 100, "race": "Saibaman"},
	"/mob/monsters/bman": {"health": 10, "str": 25, "pl": 1000, "race": "Scottish Cheese"},
	"/mob/monsters/Raditz": {"health": 1000, "str": 32, "pl": 1400, "race": "Saiya-jin (NPC)"},
	"/mob/monsters/Vegeta": {"health": 1000000, "str": 125, "pl": 12500, "race": "Vegeta (NPC)"},
	"/mob/monsters/Buu": {"health": 100000000000, "str": 125, "pl": 95000000, "race": "Buu (NPC)"},
}


# =================================================================== character creation
func new_player(o: Dictionary) -> Dictionary:
	var race: String = o["race"]
	var p := {
		"name": o.get("name", "Fighter"), "race": race, "gender": o.get("gender", "Male"), "skin": o.get("skin", "Tan"),
		"hair": o.get("hair", "Spikey"), "hair_rgb": o.get("hair_rgb", [0, 0, 0]), "facial": o.get("facial", "None"),
		"type": o.get("type", ""), "alignment": o.get("alignment", "Good"), "style": o.get("style", "Kame"),
		"face": o.get("face", "None"), "title": "",
		"bp": 0, "levels": 0, "exp": 0.0, "maxexp": 500.0,
		"health": 10.0, "maxhealth": 10.0, "pl": 5.0, "maxpl": 5.0, "str": 1.0, "def": 2.0, "spd": 0.0,
		"stamina": 100.0, "zenni": 3000.0, "will": 0, "honor": 0, "purity": 0,
		"attribute": "", "master": "", "learned": [], "hotbar": [], "hotbar_v": HOTBAR_VERSION,
		"formset": "", "form": 0, "form_name": "Normal", "gone": false, "mystic": false, "majin": false, "unlock": false,
		"dead": false, "bubbles": false, "items": {}, "worn": [], "kicharge": 0.5, "known": [],
		"aura_rgb": [0, 0, 0], "x": SPAWN.x, "y": SPAWN.y, "z": SPAWN.z, "dir": 2, "kills": 0, "playtime": 0.0,
	}
	match race:
		"Demon":
			p["pl"] = 800.0
			p["maxpl"] = 800.0
			p["str"] = 2.0
		"Biological Android", "Android":
			p["pl"] = 100.0
			p["maxpl"] = 100.0
		"Buu Demon":
			p["maxpl"] = 5.0 + randi_range(1, 15000)
			p["pl"] = p["maxpl"]
			p["learned"] = ["Wrap", "Regeneration", "KiAbsorb", "Kaioken"]
	if race == "Biological Android" and p["type"] == "Cell":
		p["race"] = "Bio-Android Cell"
	# Alignment roll (the original rolled it on the login mob by mistake, so it never stuck)
	var r := randi_range(1, 1000)
	if r == 1000:
		p["str"] = 100.0
		p["maxpl"] = 100000.0
		p["attribute"] = "Legendary Super Saiya-jin" if race == "Saiya-jin" else "Legend"
		if race == "Saiya-jin":
			p["formset"] = "ssj"
			p["gone"] = true
	elif r >= 899:
		p["maxpl"] += randi_range(1, 1000)
		p["attribute"] = "Elite Warrior"
	elif r >= 700:
		p["maxpl"] += randi_range(1, 105)
		p["attribute"] = "High-Class Warrior"
		p["will"] += 1
		p["honor"] += 1
		p["purity"] += 1
	elif r >= 400:
		p["maxpl"] += randi_range(1, 30)
		p["attribute"] = "Medium-Class Warrior"
	elif r >= 100:
		p["maxpl"] += randi_range(1, 5)
		p["attribute"] = "Low-Class Warrior"
		p["will"] += randi_range(3, 5)
	else:
		p["attribute"] = "Peasant Warrior"
		p["will"] += randi_range(5, 10)
	p["pl"] = p["maxpl"]
	p["hotbar"] = []
	for k in p["learned"]:
		if TECHS[k]["kind"] != "utility":
			p["hotbar"].append("t:" + k)
	return p


## Look options for a race: [title, key, values]
func look_options(p: Dictionary) -> Array:
	var r: String = p["race"]
	match r:
		"Earth-sei-jin", "Saiya-jin", "Halfbreed":
			var o: Array = [["Gender", "gender", ["Male", "Female"]]]
			if p.get("gender", "Male") == "Male":
				o.append(["Skin", "skin", SKINS.keys()])
			o.append(["Hair", "hair", HAIRS.keys()])
			if p.get("gender", "Male") == "Male":
				o.append(["Facial hair", "facial", FACIAL.keys()])
			return o
		"Biological Android":
			var o2: Array = [["Type", "type", ["Type 001 (Human)", "Cell"]]]
			if p.get("type", "") != "Cell":
				o2.append(["Gender", "gender", ["Male", "Female"]])
				if p.get("gender", "Male") == "Male":
					o2.append(["Skin", "skin", SKINS.keys()])
				o2.append(["Hair", "hair", ANDROID_HAIRS])
			return o2
		"Android":
			var o3: Array = [["Gender", "gender", ["Male", "Female"]]]
			if p.get("gender", "Male") == "Male":
				o3.append(["Skin", "skin", SKINS.keys()])
			o3.append(["Hair", "hair", ANDROID_HAIRS])
			return o3
		"Namek-sei-jin":
			return [["Skin", "skin", ["Light", "Dark"]]]
	return []


func has_hair(p: Dictionary) -> bool:
	var r: String = p["race"]
	return (r in ["Earth-sei-jin", "Saiya-jin", "Halfbreed", "Android"] or (r == "Biological Android" and p.get("type", "") != "Cell")) \
		and p.get("hair", "Bald") != "Bald"


func base_icon(p: Dictionary) -> int:
	match p["race"]:
		"Namek-sei-jin":
			return Data.icon_id("namek-dark.dmi" if p.get("skin", "") == "Dark" else "namek.dmi")
		"Changling":
			return Data.icon_id("changling.dmi")
		"Demon":
			return Data.icon_id("Janemba.dmi")
		"Buu Demon":
			return Data.icon_id("buu.dmi")
		"Bio-Android Cell":
			return Data.icon_id("Cell.dmi")
		"Biological Android":
			if p.get("type", "") == "Cell":
				return Data.icon_id("Cell.dmi")
	if p.get("gender", "Male") == "Female":
		return Data.icon_id("female.dmi")
	return Data.icon_id(SKINS.get(p.get("skin", "Tan"), "male.dmi"))


func _rgb(a) -> Color:
	var v: Array = a if a is Array else [0, 0, 0]
	return Color8(int(v[0]), int(v[1]), int(v[2]))


func build_appearance(p: Dictionary = P, e: Mob = pe) -> void:
	e.icon = base_icon(p)
	var f := current_form(p)
	if not f.is_empty() and str(f[5]) != "" and Data.icon_id(f[5]) >= 0:
		e.icon = Data.icon_id(f[5])
	if p["race"] == "Namek-sei-jin" and p.get("gone", false):
		e.icon = Data.icon_id("super-namek.dmi")
	e.overlays = []
	e.underlays = []
	for w in p.get("worn", []):
		if Data.icon_id(w) >= 0:
			e.overlays.append({"icon": Data.icon_id(w)})
	if p["race"] == "Saiya-jin":
		e.overlays.append({"icon": Data.icon_id("tail.dmi")})
	var fac: String = FACIAL.get(p.get("facial", "None"), "")
	if fac != "" and p.get("gender", "Male") == "Male":
		e.overlays.append({"icon": Data.icon_id(fac)})
	if has_hair(p):
		var hair: String = HAIRS.get(p["hair"], "")
		var tint = _rgb(p.get("hair_rgb"))
		var fs: String = p.get("formset", "")
		var n := int(p.get("form", 0))
		if fs == "ssj" and n > 0:
			# objs.dm /obj/ssj Transform: golden hair per level
			var gold := {1: "hair_super_saiyajin.dmi", 2: "hair_ultrasuper_saiyajin.dmi", 3: "hair_super_saiyajin2.dmi", 4: "hair_ssj3_goku.dmi", 5: "hair_ssj4_goku.dmi"}
			hair = gold.get(n, hair)
			tint = null
		elif fs == "mystic" and n > 0:
			hair = "hair_black_spikey.dmi"
		if Data.icon_id(hair) >= 0:
			var o := {"icon": Data.icon_id(hair)}
			if tint != null and tint != Color8(0, 0, 0):
				o["tint"] = tint
			e.overlays.append(o)
	if p.get("majin", false):
		e.overlays.append({"icon": Data.icon_id("majin.dmi")})
	if p.get("dead", false):
		e.overlays.append({"icon": Data.icon_id("halo.dmi")})
	if e == pe:
		var fs2: String = p.get("formset", "")
		if fs2 == "ssj" and int(p.get("form", 0)) > 0:
			e.underlays.append({"icon": Data.icon_id("ssjaura.dmi"), "state": ""})
		elif fs2 == "mystic" and int(p.get("form", 0)) > 0:
			e.overlays.append({"icon": Data.icon_id("myticaura.dmi"), "state": ""})
		if kaioken > 0:
			e.underlays.append({"icon": Data.icon_id("kaioaura.dmi"), "state": ""})
		elif busy == "powerup":
			var au := {"icon": Data.icon_id("whiteaura.dmi"), "state": ""}
			if _rgb(p.get("aura_rgb")) != Color8(0, 0, 0):
				au["tint"] = _rgb(p.get("aura_rgb"))
			e.underlays.append(au)
	e.name = p.get("name", "")
	e.flying = e.flying


func start(p: Dictionary) -> void:
	P = p
	for k in ["items", "worn", "known", "learned", "hotbar"]:
		if not P.has(k):
			P[k] = [] if k != "items" else {}
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
	for s in MONSTER_SPAWNS:
		world.load_z(int(s[3]))
	_spawn_bosses()
	build_appearance()
	running = true
	last_tick = now
	last_save = now
	msg("Welcome to DBZ Savages, %s!" % P["name"], Color(1, 0.85, 0.3))
	msg("Train on the dummies, weights and speed bags to grow. Meditate to rest. Find a master to learn techniques.", Color(0.6, 0.85, 1))


func _spawn_bosses() -> void:
	for s in MONSTER_SPAWNS:
		var exists := false
		for m in monsters:
			if m.path == s[0]:
				exists = true
		if not exists:
			var at := _walkable_near(int(s[1]), int(s[2]), int(s[3]))
			spawn_monster(s[0], at.x, at.y, at.z)
	# more saibamen around the two the map places on Earth (55,75) and (57,46)
	var n := 0
	for m in monsters:
		if m.path == "/mob/monsters/saibaman":
			n += 1
	for i in range(n, 8):
		var c: Vector2i = [Vector2i(55, 75), Vector2i(57, 46)][i % 2]
		var at2 := _walkable_near(c.x + randi_range(-5, 5), c.y + randi_range(-5, 5), 1)
		spawn_monster("/mob/monsters/saibaman", at2.x, at2.y, at2.z)


## Nearest tile a monster can stand on (not void, not dense, not a safe zone or warp).
func _walkable_near(x: int, y: int, z: int) -> Vector3i:
	world.load_z(z)
	for r in range(0, 60):
		for dx in range(-r, r + 1):
			for dy in range(-r, r + 1):
				if maxi(absi(dx), absi(dy)) != r:
					continue
				var tx := x + dx
				var ty := y + dy
				var t := Data.turf(tx, ty, z)
				if t.is_empty() or int(t.get("dense", 0)) == 1 or t.has("enter") or str(t.get("path", "")).ends_with("Void"):
					continue
				if Data.is_safe(tx, ty, z) or not world.at(tx, ty, z).is_empty():
					continue
				return Vector3i(tx, ty, z)
	return Vector3i(x, y, z)


# =================================================================== stats
func avg_stat() -> float:
	return (float(P["str"]) + float(P["def"]) + float(P["spd"])) / 3.0


func current_form(p: Dictionary = P) -> Array:
	var fs: String = p.get("formset", "")
	var n := int(p.get("form", 0))
	if fs == "" or n <= 0 or not FORMS.has(fs) or n > FORMS[fs].size():
		return []
	return FORMS[fs][n - 1]


func forms_for(p: Dictionary = P) -> Array:
	return FORMS.get(p.get("formset", ""), [])


## Stats with the current transformation's bonus.
func stat(s: String) -> float:
	var v := float(P[s])
	var f := current_form()
	if not f.is_empty():
		v += float({"str": f[2], "def": f[3], "spd": f[4]}.get(s, 0))
	return v


## Values the generic UI asks for.
func cap(s: String) -> float:
	match s:
		"powerlevel", "ki":
			return float(P["maxpl"]) + kaioken * 1341.0
		"strength":
			return stat("str")
		"defence":
			return stat("def")
	return 0.0


func pl_max() -> float:
	return float(P["maxpl"])


func tired() -> bool:
	return float(P["stamina"]) <= 1.0


func use_stamina(v: float) -> void:
	P["stamina"] = maxf(0.0, float(P["stamina"]) - v)


func gain_maxpl(v: float) -> void:
	P["maxpl"] = float(P["maxpl"]) + v
	learn_checks()


func gain_exp(v: float) -> void:
	P["exp"] = float(P["exp"]) + roundf(v)
	level_up()


## mobs.dm Levelup()
func level_up() -> void:
	while float(P["exp"]) >= float(P["maxexp"]):
		P["exp"] = float(P["exp"]) - float(P["maxexp"])
		P["levels"] = int(P["levels"]) + 1
		P["bp"] = int(P["bp"]) + 6
		P["will"] = int(P["will"]) + randi_range(2, 3)
		P["honor"] = int(P["honor"]) + randi_range(2, 3)
		P["purity"] = int(P["purity"]) + randi_range(2, 3)
		P["maxexp"] = float(P["maxexp"]) + 200.0
		P["maxpl"] = float(P["maxpl"]) + 5.0
		P["pl"] = cap("powerlevel")
		P["maxhealth"] = float(P["maxhealth"]) + randi_range(5, 10)
		P["health"] = float(P["maxhealth"])
		var z := randi_range(100, 1000)
		P["zenni"] = float(P["zenni"]) + z
		msg("Level up! +6 battle points (%d unspent). The Eternal Dragon gives you %d zenni for your effort." % [int(P["bp"]), z], Color(1, 0.85, 0.3))
		world.floater(pe.x, pe.y, pe.z, "LEVEL UP", Color(1, 0.9, 0.3))
		save()


## Battle Point Distribution
func spend_bp(stat_key: String, n: int) -> void:
	n = mini(n, int(P["bp"]))
	if n <= 0:
		return
	if stat_key == "bal":
		var each := n / 3
		if each <= 0:
			return
		for s in ["str", "def", "spd"]:
			P[s] = float(P[s]) + each
		P["bp"] = int(P["bp"]) - each * 3
	else:
		P[stat_key] = float(P[stat_key]) + n
		P["bp"] = int(P["bp"]) - n


## battle_system.dm FlightLearn / KiTechLearn / AuraTechLearn / FocusLearn
func learn_checks() -> void:
	var mp := float(P["maxpl"])
	if mp >= 100:
		_learn("Fly", "You have acquired the knowledge of Bukujutsu!")
	if mp >= 150:
		_learn("KiBlast", "You have acquired the knowledge of Ki Tech!")
	if mp >= 375:
		_learn("PowerUp", "You have acquired the knowledge of Aura Tech!")
		_learn("Sense", "")
	if mp >= 425:
		_learn("Focus", "You have acquired the knowledge of Focus Tech!")
	if mp >= 750:
		_learn("Renzuko", "You learn Renzuko Energy Dan!")


func _learn(key: String, text: String) -> bool:
	var l: Array = P["learned"]
	if key in l:
		return false
	l.append(key)
	msg(text if text != "" else "You learn %s!" % TECHS[key]["name"], Color(1, 0.6, 0.3))
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
	# speed -> run delay (bukujutsu verb: rundelay 4..0)
	var spd := stat("spd")
	var dur := 190.0 - minf(spd, 100.0) * 0.8
	if pe.flying:
		dur *= 0.7
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
		gravity_off("You leave the gravitron.")


# =================================================================== abilities
const BASE_ACTIONS := ["attack", "talk", "train", "meditate", "transform", "revert", "kicharge"]


func abilities() -> Array:
	var out: Array = BASE_ACTIONS.duplicate()
	for k in P.get("learned", []):
		out.append("t:" + k)
	return out


func ability_info(id: String) -> Dictionary:
	match id:
		"attack": return {"name": "Attack", "desc": "Punch and kick: Strength minus the target's Defense.", "glyph": "ATK", "color": Color(0.75, 0.25, 0.2)}
		"talk": return {"name": "Talk / Use", "desc": "Talk to people, use training equipment and machines next to you.", "glyph": "USE", "color": Color(0.2, 0.55, 0.55)}
		"train": return {"name": "Train", "desc": "Train punches, kicks or Ki on a training dummy next to you.", "glyph": "TRN", "color": Color(0.25, 0.55, 0.25)}
		"meditate": return {"name": "Meditate / Rest", "desc": "Recover stamina, Ki and health, and slowly gain exp, purity, honor and will.", "glyph": "MED", "color": Color(0.35, 0.35, 0.7)}
		"transform": return {"name": "Transform", "desc": "Transform to your next form (needs a high enough average stat).", "glyph": "TRF", "color": Color(0.85, 0.7, 0.15)}
		"revert": return {"name": "Revert", "desc": "Return to normal.", "glyph": "REV", "color": Color(0.5, 0.5, 0.5)}
		"senzu": return {"name": "Senzu Bean (%d)" % int(P.get("items", {}).get("senzu", 0)), "desc": "Restores Ki, health and stamina.", "glyph": "SNZ", "color": Color(0.3, 0.6, 0.25)}
		"kicharge": return {"name": "Ki Charge %d%%" % int(float(P.get("kicharge", 0.5)) * 100), "desc": "How much of your Ki goes into each beam.", "glyph": "%d%%" % int(float(P.get("kicharge", 0.5)) * 100), "color": Color(0.3, 0.5, 0.8)}
	if id.begins_with("t:"):
		var k := id.substr(2)
		var t: Dictionary = TECHS.get(k, {})
		var col := Color(0.25, 0.45, 0.8)
		match str(t.get("kind", "")):
			"beam", "disc", "volley": col = Color(0.2, 0.55, 0.85)
			"blast": col = Color(0.75, 0.6, 0.2)
			"bind": col = Color(0.6, 0.3, 0.7)
			"utility": col = Color(0.3, 0.5, 0.4)
		var d: String = t.get("desc", "")
		if d == "" and t.get("kind", "") == "beam":
			d = "Fires the Ki you charge (Ki Charge setting). Damage = Ki / target defense."
		return {"name": t.get("name", k), "desc": "%s\nLearned from: %s" % [d, t.get("learn", "?")], "glyph": t.get("glyph", k.substr(0, 3)), "color": col}
	return {"name": id, "desc": "", "glyph": id.substr(0, 3).to_upper(), "color": Color.GRAY}


func tech_cost(t: Dictionary) -> float:
	return float(P["pl"]) * float(P.get("kicharge", 0.5))


func cooldown_left(id: String) -> float:
	return maxf(0.0, float(cooldowns.get(id, 0.0)) - now)


func panel_actions() -> Array:
	var out: Array = ["talk", "train", "meditate"]
	for k in ["Fly", "PowerUp", "Focus", "Kaioken", "Zanzoken", "InstantTransmission", "Enrage", "Regeneration", "KiAbsorb", "Sense"]:
		if k in P.get("learned", []):
			out.append("t:" + k)
	if not forms_for().is_empty():
		out.append_array(["transform", "revert"])
	return out


func is_active(id: String) -> bool:
	match id:
		"train": return busy == "train"
		"meditate": return busy == "meditate"
		"t:Fly": return pe.flying
		"t:PowerUp": return busy == "powerup"
		"t:Kaioken": return kaioken > 0
		"t:Zanzoken": return zanzoken
		"t:KiAbsorb": return absorbing
		"t:Regeneration": return regen
		"revert": return int(P.get("form", 0)) > 0
	return false


func use_ability(id: String) -> void:
	if not running:
		return
	if cooldown_left(id) > 0:
		return
	match id:
		"attack": melee()
		"talk": interact()
		"train": train_menu()
		"meditate": toggle_meditate()
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


# =================================================================== combat
## battle_system.dm Attack1
func melee() -> void:
	var cd := 700.0 - minf(stat("spd"), 100.0) * 4.0
	if now - last_melee < cd:
		return
	if busy != "":
		stop_busy()
	if pe.flying:
		msg("Not while flying!", Color(1, 0.5, 0.4))
		return
	if float(P["stamina"]) <= 1:
		msg("You need to rest.", Color(1, 0.4, 0.4))
		return
	var m := facing_target()
	last_melee = now
	pe.do_flick("sparpunch" if randf() < 0.5 else "sparkick", now)
	if m == null:
		for o in world.at(pe.x + Data.DIR_DX[pe.dir], pe.y + Data.DIR_DY[pe.dir], pe.z):
			if o.kind == "npc" or o.kind == "equip":
				interact(o)
		return
	var dmg := stat("str") - m.defence
	m.target = pe
	use_stamina(2)
	if dmg <= 0:
		msg("You are too weak to hurt %s." % m.name, Color(1, 0.6, 0.4))
		return
	var hit := randi_range(1, 5)
	if hit == 5:
		world.floater(m.x, m.y, m.z, "miss", Color(0.8, 0.8, 0.8))
		return
	if randf() < 0.2:
		dmg = 1.0             # "delt barely any damage"
	_hit_monster(m, dmg, Color(1, 0.85, 0.3))


func monster_attack(m: Mob) -> void:
	if pe.flying or zanzoken:
		return
	m.do_flick("attack", now)
	var dmg := m.strength - stat("def")
	if dmg <= 0:
		world.floater(pe.x, pe.y, pe.z, "0", Color(0.8, 0.8, 0.8))
		return
	if randi_range(1, 5) == 5:
		world.floater(pe.x, pe.y, pe.z, "miss", Color(0.8, 0.8, 0.8))
		return
	P["health"] = float(P["health"]) - dmg
	if busy != "":
		stop_busy()
	world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.3, 0.3))
	if float(P["health"]) <= 0:
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


## battle_system.dm Die() rewards
func monster_die(m: Mob) -> void:
	if m.dead:
		return
	m.dead = true
	world.remove(m)
	P["kills"] = int(P["kills"]) + 1
	var rw: Array = MONSTER_REWARD.get(m.race, [10, 1, 10])
	var z := float(rw[0])
	var e := float(randi_range(int(rw[1]), int(rw[2])))
	P["zenni"] = float(P["zenni"]) + z
	msg("You defeated %s! +%s zenni, +%s exp" % [m.name, fmt(z), fmt(e)], Color(0.5, 1, 0.5))
	gain_exp(e)
	if m.race in ["Vegeta (NPC)", "Vegeta x(NPC)"] and randi_range(1, 5) == 5:
		ask("Vegeta", "You are worthy of my attack. Do you wish to learn 'Big Bang Attack'?", ["Yes", "No"], func(c: String, _i: int):
			if c == "Yes":
				_learn("BigBang", "You learn Big Bang attack!"))
	var path := m.path
	var home := m.home
	monsters.erase(m)
	if m.respawn:
		after(randf_range(30000, 45000), func(): spawn_monster(path, home.x, home.y, home.z))


## battle_system.dm KO(): health back to 5, a chance of +1..2 max powerlevel.
## A boss that knocks you out finishes you off: you die and go to the Other World.
func player_ko(by: Mob, reason := "") -> void:
	revert(true)
	stop_busy()
	gravity_off()
	for m in monsters:
		if m.target == pe:
			m.target = null
			m.next_think = now + 4000
	P["health"] = 5.0
	P["pl"] = minf(float(P["pl"]), 5.0) if float(P["maxpl"]) > 5 else float(P["pl"])
	if randi_range(1, 3) == 3:
		gain_maxpl(randi_range(1, 2))
	pe.flying = false
	if by != null and by.path != "/mob/monsters/saibaman" and by.path != "/mob/monsters/bman" and not P.get("dead", false):
		die("%s finishes you off..." % by.name)
		return
	msg(reason if reason != "" else "%s knocks you out!" % (by.name if by else "Something"), Color(1, 0.35, 0.35))
	pe.stun_until = now + 2500
	build_appearance()


## battle_system.dm Die(): you wake up in the Other World with a halo.
func die(text: String) -> void:
	msg(text, Color(1, 0.3, 0.3))
	msg("You have died. Talk to Kinjin to be judged, then find King Kai to return to Earth.", Color(0.9, 0.9, 0.6))
	P["dead"] = true
	P["health"] = float(P["maxhealth"])
	P["pl"] = cap("powerlevel")
	teleport(AFTERLIFE.x, AFTERLIFE.y, AFTERLIFE.z)
	build_appearance()
	save()


func revive(to: Vector3i) -> void:
	P["dead"] = false
	P["bubbles"] = false
	teleport(to.x, to.y, to.z)
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
		"beam", "disc":
			if pe.flying:
				msg("Not while flying!", Color(1, 0.5, 0.4))
				return
			var amount := roundf(float(P["pl"]) * float(P.get("kicharge", 0.5)))
			if amount < 1:
				msg("You don't have enough energy.", Color(1, 0.5, 0.4))
				return
			if key == "Kienzan":
				amount = minf(amount, 30000.0)
			if key == "SpiritBomb":
				amount *= 1.1
			P["pl"] = maxf(0.0, float(P["pl"]) - amount / (1.1 if key == "SpiritBomb" else 1.0))
			cooldowns["t:" + key] = now + 1500.0
			msg("%s!" % t["name"], Color(0.6, 0.9, 1))
			# beams: amount / target defense (monster defense counts as 1); the disc ignores defense
			_fire(t, amount, pe.dir)
		"blast":
			if float(P["pl"]) < 100:
				msg("You need 100 Ki for a Ki blast.", Color(1, 0.5, 0.4))
				return
			P["pl"] = float(P["pl"]) - 100.0
			cooldowns["t:" + key] = now + 800.0
			_fire(t, maxf(2.0, stat("str") * 5.0 - 1.0), pe.dir)
		"volley":
			if float(P["stamina"]) <= 0:
				msg("You are too tired.", Color(1, 0.5, 0.4))
				return
			use_stamina(35)
			var amt := float(P["pl"]) / 50.0
			cooldowns["t:" + key] = now + 1200.0
			_fire(t, amt, pe.dir)
			after(200, func(): _fire(t, amt, pe.dir))
		"bind":
			if float(P["pl"]) < 100:
				msg("You need 100 Ki.", Color(1, 0.5, 0.4))
				return
			var m := facing_target() if facing_target(false) == null else facing_target(false)
			if m == null:
				m = nearest_monster(5)
			if m == null:
				msg("There is nobody to trap.", Color(0.7, 0.7, 0.7))
				return
			P["pl"] = float(P["pl"]) - 100.0
			m.stun_until = now + 5000.0
			cooldowns["t:" + key] = now + 6000.0
			world.floater(m.x, m.y, m.z, "Trapped!", Color(0.9, 0.6, 1))
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
	pr.icon = Data.icon_id(t.get("icon", "kame.dmi"))
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
			if o != pr.owner and not o.dead and o.kind == "monster":
				hit = o
				break
		var tur := Data.turf(nx, ny, pr.z)
		if hit:
			var dmg: float = pr.damage
			if pr.tech.get("kind", "") in ["beam", "volley"]:
				dmg = pr.damage / maxf(1.0, hit.defence)
			_hit_monster(hit, dmg, Color(0.5, 0.9, 1))
			_kill_proj(pr)
			continue
		if tur.is_empty() or int(tur.get("dense", 0)) == 1 or pr.steps <= 0:
			_kill_proj(pr)
			continue
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
				msg("You're at full powerlevel.", Color(0.8, 0.8, 0.8))
			else:
				_set_busy("powerup", 300.0)
				msg("An aura flickers around you.", Color(0.9, 0.9, 1))
		"Focus":
			P["pl"] = cap("powerlevel")
			cooldowns["t:Focus"] = now + 20000.0
			msg("You begin to feel the energy absorb into you....", Color(0.9, 0.9, 1))
		"Kaioken":
			_kaioken_menu()
		"Zanzoken":
			zanzoken = not zanzoken
			pe.invisible = false
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
		"Sense":
			var lst: Array = []
			for m in monsters:
				if m.z == pe.z and not m.dead and maxi(absi(m.x - pe.x), absi(m.y - pe.y)) <= 30:
					lst.append("%s (%d,%d): %s" % [m.name, m.x, m.y, fmt(m.ki)])
			ask("Sense", "\n".join(lst) if not lst.is_empty() else "You sense nothing nearby.", ["OK"], func(_c: String, _i: int): pass)
		"Enrage":
			enrage()


func toggle_fly() -> void:
	if pe.flying:
		pe.flying = false
		msg("You float to the ground...", Color(0.8, 0.8, 0.9))
	else:
		if pe.z in [3, 10, 12]:
			msg("There isn't enough room here.", Color(1, 0.6, 0.4))
			return
		if busy != "":
			stop_busy()
		pe.flying = true
		msg("You begin to float above....", Color(0.8, 0.8, 0.9))
	_update_state()


func _kaioken_menu() -> void:
	var mx := int(float(P["maxpl"]) / 1341.0)
	var opts: Array = ["Release"]
	for lv in [2, 3, 4, 10, 20, 100]:
		if lv <= mini(mx, 100):
			opts.append("x%d" % lv)
	if opts.size() == 1:
		opts.append("x1")
	opts.append("Cancel")
	ask("Kaioken", "Each level adds 1,341 Ki. You can handle up to x%d (max powerlevel / 1,341)." % mx, opts, _on_kaioken)


func _on_kaioken(c: String, _i: int) -> void:
	if c == "Release":
		kaioken = 0
		P["pl"] = minf(float(P["pl"]), cap("powerlevel"))
		msg("You begin to release your kaioken....", Color(0.9, 0.9, 0.9))
	elif c.begins_with("x"):
		if int(P.get("form", 0)) > 0:
			msg("Can't use Kaioken and be transformed.", Color(1, 0.5, 0.4))
			return
		kaioken = int(c.substr(1))
		P["pl"] = float(P["pl"]) + kaioken * 1341.0
		use_stamina(randi_range(1, 30))
		msg("KAIOKEN TIMES %d!!!" % kaioken, Color(1, 0.4, 0.3))
	build_appearance()


func _it_menu() -> void:
	var opts: Array = []
	for k in P.get("known", []):
		opts.append(k)
	if opts.is_empty():
		msg("You don't know anyone to teleport to yet. Talk to people first.", Color(0.8, 0.8, 0.8))
		return
	opts.append("Cancel")
	ask("Instant Transmission", "Who do you want to teleport to?", opts, _on_it)


func _on_it(c: String, _i: int) -> void:
	for o in _all_npcs():
		if o.name == c:
			teleport(o.x, o.y - 1, o.z)
			msg("You put two fingers to your forehead and vanish...", Color(0.8, 0.9, 1))
			return


func _all_npcs() -> Array:
	var out: Array = []
	for z in world.ents:
		for o in world.ents[z]:
			if o.kind == "npc":
				out.append(o)
	return out


## /obj/enrage: Ki boost and the first transformation (FormTwo / SSJ / SNJ)
func enrage() -> void:
	if int(P.get("form", 0)) > 0 or kaioken > 0:
		msg("You are already powered up.", Color(0.8, 0.8, 0.8))
		return
	cooldowns["t:Enrage"] = now + 30000.0
	pe.do_flick("enrage", now)
	msg("You let your rage explode!", Color(1, 0.4, 0.3))
	P["pl"] = cap("powerlevel")
	var a := avg_stat()
	var r: String = P["race"]
	if P.get("gone", false):
		return
	if r in ["Saiya-jin", "Halfbreed"] and not P.get("mystic", false) and a >= 10:
		if randi_range(1, 2) == 2 or a >= 25:
			P["gone"] = true
			P["formset"] = "ssj"
			msg("Your hair stands on end and flashes gold... You have awakened Super Saiya-jin! (Transform)", Color(1, 0.85, 0.2))
	elif r == "Changling" and a >= 30:
		P["gone"] = true
		P["formset"] = "changling"
		msg("Your body begins to change... You can now Transform.", Color(1, 0.6, 1))
	elif r == "Bio-Android Cell" and a >= 25:
		P["gone"] = true
		P["formset"] = "cell"
		msg("Your cells evolve... You can now Transform.", Color(0.6, 1, 0.6))
	elif r == "Namek-sei-jin" and a >= 25:
		if randi_range(1, 5) in [1, 3]:
			P["gone"] = true
			P["maxpl"] = float(P["maxpl"]) * 2.0
			P["str"] = float(P["str"]) + 40
			P["def"] = float(P["def"]) + 25
			P["spd"] = float(P["spd"]) + 20
			msg("You become a Super Namek!", Color(0.5, 1, 0.5))
			build_appearance()
	if P.get("gone", false):
		_auto_panel()


func _auto_panel() -> void:
	pass


func transform() -> void:
	var fl := forms_for()
	if fl.is_empty():
		msg("You don't have a transformation yet.%s" % (" Learn Enrage from Kolan." if P["race"] in ["Saiya-jin", "Halfbreed", "Changling", "Bio-Android Cell", "Namek-sei-jin"] else ""), Color(0.8, 0.8, 0.8))
		return
	if float(P["stamina"]) <= 5:
		msg("You feel too weak to.", Color(1, 0.5, 0.4))
		return
	if kaioken > 0:
		msg("Can't use Kaioken and transform.", Color(1, 0.5, 0.4))
		return
	var cur := int(P.get("form", 0))
	if cur >= fl.size():
		msg("You are already at your strongest form.", Color(0.8, 0.8, 0.8))
		return
	var nf: Array = fl[cur]
	if avg_stat() < float(nf[1]):
		msg("You need an average stat of %d for %s (yours: %d)." % [nf[1], nf[0], int(avg_stat())], Color(1, 0.5, 0.4))
		return
	P["form"] = cur + 1
	P["form_name"] = nf[0]
	use_stamina(10)
	pe.do_flick("enrage", now)
	msg("You explode in rage and become %s!" % nf[0], Color(1, 0.85, 0.2))
	build_appearance()


func revert(quiet := false) -> void:
	if int(P.get("form", 0)) == 0:
		return
	P["form"] = 0
	P["form_name"] = "Normal"
	if not quiet:
		msg("You revert to normal.", Color(0.8, 0.8, 0.8))
	build_appearance()


# =================================================================== monster AI
func think(m: Mob) -> void:
	m.next_think = now + 1000.0          # lifecycle_delay = 10
	if now < m.stun_until:
		return
	var dx := pe.x - m.x
	var dy := pe.y - m.y
	var dist := maxi(absi(dx), absi(dy))
	var hidden := zanzoken or pe.flying or Data.is_safe(pe.x, pe.y, pe.z)
	if not hidden and (m.target == pe or dist <= 3) and dist <= 10:
		if dist <= 1:
			m.dir = dir_to(dx, dy)
			monster_attack(m)
		else:
			m.next_think = now + 500.0
			_chase(m, dx, dy)
		return
	m.target = null
	if randf() < 0.5:                    # movement_probability = 50
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
	if busy == "train":
		msg("You stop training.", Color(0.8, 0.8, 0.8))
	elif busy == "meditate":
		msg("You stop meditating.", Color(0.8, 0.8, 0.8))
	busy = ""
	_update_state()
	build_appearance()


func _update_state() -> void:
	match busy:
		"meditate":
			pe.state = "meditate"
		"train":
			pe.state = "sparstand"
		_:
			pe.state = "buku" if pe.flying and Data.has_state(pe.icon, "buku") else ""


## /mob/other/Dummy Train: punches, kicks or Ki
func train_menu() -> void:
	if busy == "train":
		stop_busy()
		return
	if _near("/mob/other/Dummy", 1) == null:
		msg("You need a training dummy next to you. (Dummies are in the training grounds and halls.)", Color(1, 0.7, 0.4))
		return
	ask("Training Dummy", "What do you want to train?", ["Punches", "Kicks", "Ki", "None"], _on_train)


func _on_train(c: String, _i: int) -> void:
	if c == "None":
		stop_busy()
		return
	if pe.flying:
		toggle_fly()
	train_kind = c
	_set_busy("train", 1500.0)
	msg("You begin training your %s." % c.to_lower(), Color(0.7, 0.9, 0.7))


func toggle_meditate() -> void:
	if busy == "meditate":
		stop_busy()
		return
	if pe.flying:
		msg("Not while flying.", Color(1, 0.6, 0.4))
		return
	_set_busy("meditate", 500.0)
	msg("You begin meditating.", Color(0.7, 0.8, 1))


var med_tick := 0


func busy_tick() -> void:
	match busy:
		"train":
			# punchcheck / kickcheck / kicheck (every 1.5 s)
			busy_next = now + 1500.0
			if float(P["stamina"]) < 1:
				msg("You are too tired!", Color(1, 0.4, 0.4))
				stop_busy()
				return
			var ki := train_kind == "Ki"
			pe.do_flick({"Punches": "sparfury", "Kicks": "sparkick", "Ki": "sparkifury"}.get(train_kind, "sparfury"), now)
			use_stamina(randi_range(1, 7 if ki else 5))
			if randi_range(1, 2) == 2:
				var g := randi_range(1, 7 if ki else 5)
				gain_maxpl(g)
				world.floater(pe.x, pe.y, pe.z, "+%d" % g, Color(0.6, 1, 0.6))
		"meditate":
			# Resting() every 0.5 s, meditate() every 5 s, Healing() every 10 s
			busy_next = now + 500.0
			med_tick += 1
			var mx := 100.0
			if float(P["stamina"]) < mx:
				P["stamina"] = minf(mx, float(P["stamina"]) + randi_range(1, 10))
			P["pl"] = minf(cap("powerlevel"), float(P["pl"]) + randi_range(100, 500))
			P["health"] = minf(float(P["maxhealth"]), float(P["health"]) + randi_range(1, 5))
			if med_tick % 10 == 0:
				if randi_range(1, 2) == 2:
					gain_exp(randi_range(10, 15))
				if randi_range(1, 30) == 30:
					msg("You feel more purified.", Color(0.8, 0.9, 1))
					P["purity"] = int(P["purity"]) + 1
				if randi_range(1, 29) == 29:
					msg("You feel more honor enter your blood.", Color(0.8, 0.9, 1))
					P["honor"] = int(P["honor"]) + 1
				if randi_range(1, 28) == 28:
					msg("You get more will to fight.", Color(0.8, 0.9, 1))
					P["will"] = int(P["will"]) + 1
				learn_checks()
		"powerup":
			busy_next = now + 600.0
			if float(P["stamina"]) <= 10 or float(P["pl"]) >= cap("powerlevel"):
				stop_busy()
				return
			P["pl"] = minf(cap("powerlevel"), float(P["pl"]) + roundf(float(P["maxpl"]) / randf_range(8, 10)))
			use_stamina(randi_range(1, 10))


func _near(path: String, r: int) -> Mob:
	for dx in range(-r, r + 1):
		for dy in range(-r, r + 1):
			for o in world.at(pe.x + dx, pe.y + dy, pe.z):
				if o.path == path or (path.ends_with("/") and o.path.begins_with(path)):
					return o
	return null


# =================================================================== equipment
func use_equipment(o: Mob) -> void:
	if pe.flying:
		msg("Not while flying.", Color(1, 0.6, 0.4))
		return
	match o.path:
		"/obj/WeightTraining100":
			_lift()
		"/obj/training/SpeedBag":
			_speedbag(o)
		"/obj/Machine":
			_punch_machine()
		"/obj/MeditationPad":
			_med_pad()
		"/obj/Gravitron", "/obj/Gravitrontwo":
			var opts: Array = ["Off", "10x", "50x", "100x", "200x", "300x", "500x", "Cancel"]
			ask("Gravitron", "How much gravity would you like? (It is suggested to be at least 1,000 powerlevel before gravity training.)\nCurrently: %s" % ("%dx" % int(grav) if grav > 0 else "off"), opts, _on_grav)
		"/obj/heal":
			P["health"] = float(P["maxhealth"])
			msg("You feel healed.", Color(0.6, 1, 0.6))
		"/obj/saibamachine2":
			spawn_monster("/mob/monsters/saibaman", o.x + 1, o.y, o.z)
			spawn_monster("/mob/monsters/saibaman", o.x - 1, o.y, o.z)
			msg("The machine spits out two Saibamen!", Color(1, 0.6, 0.4))


## /obj/WeightTraining100 Lift
func _lift() -> void:
	if cooldown_left("lift") > 0:
		return
	if float(P["stamina"]) < 5:
		msg("You feel too weak to.", Color(1, 0.5, 0.4))
		return
	cooldowns["lift"] = now + 1000.0
	pe.do_flick("weight-lifting", now)
	use_stamina(2)
	var g := 0
	if randi_range(1, 5) == 5:
		g += 10
		use_stamina(1)
		gain_exp(60)
	if randi_range(1, 5) == 5:
		g += 15
		use_stamina(1)
		gain_exp(30)
	if randi_range(1, 5) == 5:
		g += 4
		use_stamina(2)
		gain_exp(10)
	if g > 0:
		gain_maxpl(g)
		world.floater(pe.x, pe.y, pe.z, "+%d" % g, Color(0.6, 1, 0.6))
	learn_checks()


## /obj/training/SpeedBag Hit Speedbag (needs sparring stance; we skip it)
func _speedbag(o: Mob) -> void:
	if cooldown_left("bag") > 0:
		return
	if float(P["stamina"]) < 5:
		msg("You feel too weak to.", Color(1, 0.5, 0.4))
		return
	cooldowns["bag"] = now + 500.0
	pe.dir = dir_to(o.x - pe.x, o.y - pe.y)
	pe.do_flick("sparpunch", now)
	world.floater(o.x, o.y, o.z, fmt(stat("str")), Color(1, 0.85, 0.3))
	var r := randi_range(1, 12)
	if r >= 11:
		use_stamina(1)
		gain_exp(roundf((stat("str") + stat("def") + stat("spd")) / 2.0) + 1)
		learn_checks()


## /obj/Machine Punching Contest: win zenni
func _punch_machine() -> void:
	if cooldown_left("machine") > 0:
		return
	cooldowns["machine"] = now + 1500.0
	pe.do_flick("sparpunch", now)
	var dmg := roundf(float(P["pl"]) / randi_range(1, 8)) + randi_range(0, 15)
	msg("You hit the machine, doing about %s damage to it." % fmt(dmg), Color(0.7, 0.8, 1))
	if randi_range(1, 2) == 2:
		var z := randi_range(1, 1000)
		P["zenni"] = float(P["zenni"]) + z
		msg("You got %d zenni from that last hit." % z, Color(1, 0.9, 0.4))
	else:
		gain_maxpl(randi_range(1, 2))


## /obj/MeditationPad Meditate
func _med_pad() -> void:
	if cooldown_left("pad") > 0:
		return
	if float(P["stamina"]) < 2:
		msg("You feel too weak to.", Color(1, 0.5, 0.4))
		return
	cooldowns["pad"] = now + 2000.0
	pe.do_flick("meditate", now)
	use_stamina(1)
	match randi_range(1, 4):
		2:
			msg("You feel a bit wiser.", Color(0.8, 0.9, 1))
			gain_maxpl(randi_range(1, 3))
		3:
			msg("You have gained superior knowledge.", Color(0.8, 0.9, 1))
			gain_maxpl(randi_range(2, 5))
		_:
			msg("You have not gained any knowledge from that.", Color(0.7, 0.7, 0.7))


func _on_grav(c: String, _i: int) -> void:
	if c == "Cancel":
		return
	if c == "Off":
		gravity_off("You turn off the gravity....")
		return
	grav = float(c.trim_suffix("x"))
	grav_next = now + 4000.0
	msg("You hear the machine turn on... (%dx gravity)" % int(grav), Color(0.6, 0.9, 1))


func gravity_off(text := "") -> void:
	if grav <= 0.0:
		return
	grav = 0.0
	if text != "":
		msg(text, Color(0.7, 0.9, 0.7))


## objs.dm playergravity(): every 4 s, health -= grav * rand(1,3), exp += grav / rand(1,50), max PL + 1
func gravity_pull() -> void:
	grav_next = now + 4000.0
	var dmg := grav * randi_range(1, 3)
	P["health"] = float(P["health"]) - dmg
	world.floater(pe.x, pe.y, pe.z, fmt(dmg), Color(1, 0.8, 0.3))
	if float(P["health"]) <= 0:
		gravity_off()
		player_ko(null, "The gravity crushes you and you pass out!")
		return
	msg(["You feel the gravity pull down on you. You seem stronger.", "You feel yourself getting used to the gravity.", "You feel the full force of the gravity!!"][randi() % 3], Color(0.7, 0.9, 0.7))
	gain_exp(roundf(grav / randi_range(1, 50)))
	gain_maxpl(1)


# =================================================================== periodic
func second_tick() -> void:
	P["playtime"] = float(P["playtime"]) + 1.0
	if kaioken > 0:
		# kaiokenstrain(): wears out your stamina
		use_stamina(1 + kaioken / 20)
		if float(P["stamina"]) <= 0:
			_on_kaioken("Release", 0)
			msg("Your body can't take the Kaioken anymore!", Color(1, 0.5, 0.4))
	if zanzoken:
		use_stamina(randi_range(1, 2))
		if float(P["stamina"]) <= 1:
			zanzoken = false
			msg("You are too tired to keep up Zanzoken.", Color(1, 0.6, 0.4))
	if regen:
		P["health"] = minf(float(P["maxhealth"]), float(P["health"]) + 5)
		if float(P["health"]) >= float(P["maxhealth"]):
			regen = false
	if int(P.get("form", 0)) > 0 and float(P["stamina"]) <= 0:
		msg("You are too tired to stay transformed.", Color(1, 0.6, 0.4))
		revert()
	if busy == "" and not pe.mid_step(now):
		# slowly recover when idle
		P["stamina"] = minf(100.0, float(P["stamina"]) + 0.5)


# =================================================================== NPCs
func interactables() -> Array:
	var out: Array = []
	for dx in range(-1, 2):
		for dy in range(-1, 2):
			for o in world.at(pe.x + dx, pe.y + dy, pe.z):
				if o != pe and (o.kind == "npc" or o.kind == "equip") and not o.dead and not o.invisible and o.icon >= 0:
					out.append(o)
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
	if o.path == "/mob/other/Dummy":
		train_menu()
		return
	if o.name != "" and not o.name in P["known"] and o.path.begins_with("/mob/"):
		(P["known"] as Array).append(o.name)
	var d: Dictionary = Data.mobs.get(o.path, {})
	if MENTORS.has(o.path):
		_mentor(o)
		return
	match o.path:
		"/mob/Dende":
			P["health"] = float(P["maxhealth"])
			ask("Dende", "Greetings, let me heal you.", ["Go back to Earth", "OK"], func(c: String, _i: int):
				if c == "Go back to Earth":
					teleport(77, 82, 1))
			return
		"/mob/SpacePod":
			ask("Space Pod", "Where do you want to fly?", ["Namek", "Earth", "Cancel"], func(c: String, _i: int):
				if c == "Namek":
					teleport(76, 82, 5)
				elif c == "Earth":
					teleport(128, 38, 1))
			return
		"/mob/melp/Shopkeeper", "/mob/melp/Shopkeeper2", "/mob/melp/Vegitto":
			_shop(o)
			return
		"/mob/melp/A16":
			ask("Android 16", "An Android Chip costs 1,000 zenni.", ["Buy", "No"], func(c: String, _i: int):
				if c == "Buy" and _pay(1000):
					P["items"]["chip"] = int(P["items"].get("chip", 0)) + 1
					msg("You buy an Android Chip. (%d)" % P["items"]["chip"], Color(0.8, 0.9, 1)))
			return
		"/mob/Barber":
			_barber()
			return
		"/mob/videl":
			ask("Videl", "Hey how's it going? Do you want to change your aura colour?", ["White", "Red", "Blue", "Gold", "Purple", "No"], func(c: String, _i: int):
				var cols := {"White": [0, 0, 0], "Red": [200, 0, 0], "Blue": [0, 60, 220], "Gold": [200, 160, 0], "Purple": [140, 0, 180]}
				if cols.has(c):
					P["aura_rgb"] = cols[c]
					msg("Your aura is now %s." % c.to_lower(), Color(0.8, 0.9, 1)))
			return
		"/mob/other/Kinjin":
			if P.get("alignment", "Good") == "Good":
				ask("King Yemma", "For being good hearted, you may continue to Snake Way.", ["Go"], func(_c: String, _i: int): teleport(74, 2, 2))
			else:
				ask("King Yemma", "You evil fiend.... you will now GO TO HELL!!!", ["..."], func(_c: String, _i: int): teleport(randi_range(20, 130), randi_range(20, 130), 8))
			return
		"/mob/bubb/bubbles":
			if not P.get("bubbles", false):
				P["bubbles"] = true
				ask("King Kai", "King Kaio: You caught my beloved Bubbles! Come talk to me to end your training.", ["OK"], func(_c: String, _i: int): pass)
			return
		"/mob/tester/kingkai":
			_king_kai()
			return
		"/mob/kaioshin":
			_kaioshin()
			return
		"/mob/ElderKaoshin":
			if P["race"] in ["Saiya-jin", "Halfbreed", "Earth-sei-jin"] and not P.get("mystic", false):
				ask("Elder Kaioshin", "Do you wish to become Mystic? If you do then you cannot become a Super Saiyan EVER again.", ["Yes", "No"], func(c: String, _i: int):
					if c == "Yes":
						revert(true)
						P["mystic"] = true
						P["formset"] = "mystic"
						msg("Your hidden power awakens. You can Transform to Mystic at an average stat of 100.", Color(0.9, 0.8, 1)))
			else:
				ask("Elder Kaioshin", "There is nothing more I can unlock in you.", ["OK"], func(_c: String, _i: int): pass)
			return
		"/mob/other/drbriefs":
			ask("Dr. Briefs", "Welcome to Capsule Corp! My inventions are not for sale yet.", ["OK"], func(_c: String, _i: int): pass)
			return
		"/mob/lostfriend":
			if int(P.get("quest1", 0)) == 1:
				P["quest1"] = 2
				ask(o.name, "Oh really? I had chores to do, that's why. Tell Kolan I'm sorry!", ["OK"], func(_c: String, _i: int): pass)
				return
	var talk: String = d.get("talk", "")
	if talk == "":
		talk = "Hello, %s." % P["name"]
	ask(o.name, talk, ["OK"], func(_c: String, _i: int): pass)


## Mentor Talk / Learn verbs (mobs.dm)
func _mentor(o: Mob) -> void:
	var m: Dictionary = MENTORS[o.path]
	var lines: Array = []
	var opts: Array = []
	if m["master"] != "" and P["master"] != m["master"]:
		lines.append("Do you wish to follow the way of '%s'?" % m["name"])
		if P["master"] == "":
			opts.append("Become apprentice")
		else:
			lines.append("(You already follow %s.)" % P["master"])
	else:
		for t in m["teach"]:
			var key: String = t[0]
			var need := "average stat %d" % t[2] if t[1] == "avg" else "%s max powerlevel" % fmt(t[2])
			var nm: String = TECHS[key]["name"] if TECHS.has(key) else {"unlock": "Unlock Potential", "majin": "Become Majin"}.get(key, key)
			var done: bool = key in P["learned"] or (key == "unlock" and P.get("unlock", false)) or (key == "majin" and P.get("majin", false))
			lines.append("%s — needs %s%s" % [nm, need, " (learned)" if done else ""])
			if not done:
				opts.append("Learn " + nm)
	if o.path == "/mob/other/Trunks":
		opts.append("Quests")
	opts.append("Leave")
	ask(m["name"], "\n".join(lines) if not lines.is_empty() else "Greetings.", opts, _on_mentor.bind(o.path))


func _on_mentor(c: String, _i: int, path: String) -> void:
	var m: Dictionary = MENTORS[path]
	if c == "Become apprentice":
		P["master"] = m["master"]
		msg("You are now %s's apprentice." % m["name"], Color(0.8, 0.9, 1))
		return
	if c == "Quests":
		var q := int(P.get("quest1", 0))
		if q == 2:
			P["quest1"] = 3
			P["zenni"] = float(P["zenni"]) + 1000
			P["bp"] = int(P["bp"]) + 4
			ask("Kolan", "Thanks a lot, you have made my day! (+1,000 zenni, +4 battle points)", ["OK"], func(_c: String, _i: int): pass)
		elif q == 3:
			ask("Kolan", "Thanks again for finding my friend!", ["OK"], func(_c: String, _i: int): pass)
		else:
			P["quest1"] = 1
			ask("Kolan", "Can you please find my best friend? I told him to meet me at the mall, but he didn't show up. Please ask him why he didn't show.", ["OK"], func(_c: String, _i: int): pass)
		return
	if not c.begins_with("Learn "):
		return
	for t in m["teach"]:
		var key: String = t[0]
		var nm: String = TECHS[key]["name"] if TECHS.has(key) else {"unlock": "Unlock Potential", "majin": "Become Majin"}.get(key, key)
		if c != "Learn " + nm:
			continue
		var ok: bool = avg_stat() >= float(t[2]) if t[1] == "avg" else float(P["maxpl"]) >= float(t[2])
		if not ok:
			msg("You need to be a bit stronger.", Color(1, 0.6, 0.4))
			return
		match key:
			"unlock":
				P["unlock"] = true
				P["maxpl"] = roundf(float(P["maxpl"]) * 1.1)
				msg("You feel your hidden power be unlocked!", Color(1, 0.85, 0.3))
			"majin":
				P["majin"] = true
				P["maxpl"] = float(P["maxpl"]) + 500
				P["maxhealth"] = float(P["maxhealth"]) + 1000
				P["health"] = float(P["maxhealth"])
				msg("You are now becoming Majin!", Color(1, 0.4, 0.4))
				build_appearance()
			_:
				_learn(key, "%s teaches you %s." % [m["name"], TECHS[key]["name"]])


func _king_kai() -> void:
	if not P.get("dead", false):
		ask("King Kai", "Do you want to go to Kaioshin's for extreme training?", ["Yes", "No"], func(c: String, _i: int):
			if c == "Yes":
				teleport(21, 125, 10))
		return
	if not P.get("bubbles", false):
		ask("King Kai", "You haven't caught Bubbles yet! Catch my monkey and come back.", ["OK"], func(_c: String, _i: int): pass)
		return
	var pl := float(P["pl"])
	if pl >= 250:
		_learn("Kaioken", "Before you leave, I will teach you Kaioken.")
	if pl >= 2500:
		_learn("SpiritBomb", "Before you leave, I will teach you Spirit Bomb.")
	if pl >= 1000:
		_learn("InstantTransmission", "Before you leave, I will teach you Instant Transmission.")
	msg("You may now return to Earth!", Color(0.8, 1, 0.8))
	revive(Vector3i(70, 85, 1))


func _kaioshin() -> void:
	var a := avg_stat()
	if a >= 8:
		_learn("Kaioken", "Before you leave, I will teach you Kaioken.")
	if a >= 18:
		_learn("SpiritBomb", "Before you leave, I will teach you Spirit Bomb.")
	if a >= 30:
		_learn("InstantTransmission", "Before you leave, I will teach you Instant Transmission.")
	ask("Kaioshin", "Where do you want to go?", ["Return to Earth", "Return to Kaio's Planet", "Stay"], func(c: String, _i: int):
		if c == "Return to Earth":
			revive(SPAWN)
		elif c == "Return to Kaio's Planet":
			teleport(11, 4, 10))


func _pay(z: float) -> bool:
	if float(P["zenni"]) < z:
		msg("Sorry, you don't have enough money.", Color(1, 0.6, 0.4))
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
	ask(o.name if o.name != "" else "Shop", "What would you like? You have %s zenni.\nSenzu Beans: %d" % [fmt(P["zenni"]), int(P["items"].get("senzu", 0))], opts, _on_shop)


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
	if it[2] == "senzu":
		P["items"]["senzu"] = int(P["items"].get("senzu", 0)) + 1
		msg("You buy a Senzu Bean. Eat it from the Stats screen.", Color(0.6, 1, 0.6))
		_auto_hotbar_item()
		return
	var w: Array = P["worn"]
	if not it[2] in w:
		w.append(it[2])
	msg("You get a %s! You put it on." % it[0], Color(0.8, 0.9, 1))
	build_appearance()


func _auto_hotbar_item() -> void:
	var hb: Array = P["hotbar"]
	if not "senzu" in hb:
		var i := hb.find("")
		if i >= 0:
			hb[i] = "senzu"


## /obj/senzu Eat
func eat_senzu() -> void:
	if int(P["items"].get("senzu", 0)) <= 0:
		msg("You don't have any Senzu Beans.", Color(0.8, 0.8, 0.8))
		return
	P["items"]["senzu"] = int(P["items"]["senzu"]) - 1
	P["pl"] = cap("powerlevel")
	P["health"] = float(P["maxhealth"])
	P["stamina"] = 150.0
	msg("You feel better as you eat a Senzu Bean.", Color(0.6, 1, 0.6))


func _barber() -> void:
	if not has_hair(P) and not P["race"] in ["Earth-sei-jin", "Saiya-jin", "Halfbreed", "Android", "Biological Android"]:
		ask("Barber", "Sorry, I can't do anything with your... head.", ["OK"], func(_c: String, _i: int): pass)
		return
	var hs: Array = HAIRS.keys() if P["race"] in ["Earth-sei-jin", "Saiya-jin", "Halfbreed"] else ANDROID_HAIRS
	var opts: Array = hs.duplicate()
	opts.append("Dye: Black")
	opts.append("Dye: Brown")
	opts.append("Dye: Red")
	opts.append("Dye: Blue")
	opts.append("Leave")
	ask("Barber", "Do you want to get your hair cut?", opts, func(c: String, _i: int):
		if c in hs:
			P["hair"] = c
		elif c.begins_with("Dye: "):
			P["hair_rgb"] = {"Black": [0, 0, 0], "Brown": [90, 50, 10], "Red": [170, 20, 10], "Blue": [20, 40, 170]}[c.substr(5)]
		build_appearance())


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
