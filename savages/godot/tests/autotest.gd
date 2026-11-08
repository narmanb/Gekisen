extends Node
## Automated smoke test: run with
##   godot --path savages/godot -- --autotest [--shots=DIR]
## Drives character creation, training, mentors, combat, transformation, death and
## the afterlife, gravity training and saving, and takes screenshots.
## Prints "AUTOTEST OK" at the end.

var shots := "user://shots"
var ui


func _ready() -> void:
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--shots="):
			shots = a.substr(8)
	DirAccess.make_dir_recursive_absolute(shots)
	ui = get_parent().get_node("UI")
	run()


func wait(sec: float) -> void:
	await get_tree().create_timer(sec).timeout


func shot(name: String) -> void:
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png(shots + "/" + name + ".png")
	print("shot ", name)


func state() -> String:
	var P := Game.P
	return "hp=%s/%s ki=%s/%s str=%s def=%s spd=%s stam=%d exp=%s/%s bp=%d zenni=%s pos=%d,%d,%d busy=%s form=%s learned=%s" % [
		Game.fmt(P["health"]), Game.fmt(P["maxhealth"]), Game.fmt(P["pl"]), Game.fmt(Game.cap("powerlevel")),
		Game.fmt(Game.stat("str")), Game.fmt(Game.stat("def")), Game.fmt(Game.stat("spd")), int(P["stamina"]),
		Game.fmt(P["exp"]), Game.fmt(P["maxexp"]), int(P["bp"]), Game.fmt(P["zenni"]), P["x"], P["y"], P["z"], Game.busy,
		P.get("form_name", ""), str(P["learned"])]


func find(path: String) -> Array:
	for e in Data.map["entities"]:
		if Data.types[str(int(e[0]))]["path"] == path:
			return [int(e[1]), int(e[2]), int(e[3])]
	return []


func go_near(path: String, dy := -1) -> Array:
	var p := find(path)
	if p.is_empty():
		print("NOT FOUND ", path)
		return p
	Game.world.load_z(p[2])
	Game.teleport(p[0], p[1] + dy, p[2])
	return p


func gallery() -> void:
	var layer := CanvasLayer.new()
	layer.layer = 50
	add_child(layer)
	var bg := ColorRect.new()
	bg.color = Color(0.12, 0.13, 0.2)
	bg.size = Vector2(1280, 720)
	layer.add_child(bg)
	var combos: Array = []
	for r in Game.RACES + ["Buu Demon"]:
		combos.append({"race": r, "gender": "Male", "skin": "Tan", "hair": "Spikey", "hair_rgb": [0, 0, 0], "type": "Type 001 (Human)"})
	combos.append({"race": "Earth-sei-jin", "gender": "Female", "hair": "Long", "hair_rgb": [200, 40, 0]})
	combos.append({"race": "Saiya-jin", "gender": "Male", "skin": "Olive", "hair": "Goku", "hair_rgb": [0, 0, 0], "facial": "Goatee"})
	combos.append({"race": "Halfbreed", "gender": "Male", "skin": "Dark Brown", "hair": "Vegeta", "hair_rgb": [40, 40, 200]})
	combos.append({"race": "Namek-sei-jin", "skin": "Dark"})
	combos.append({"race": "Biological Android", "type": "Cell"})
	combos.append({"race": "Saiya-jin", "gender": "Male", "skin": "Tan", "hair": "Spikey", "formset": "ssj", "form": 1})
	combos.append({"race": "Saiya-jin", "gender": "Male", "skin": "Tan", "hair": "Spikey", "formset": "ssj", "form": 2})
	combos.append({"race": "Changling", "formset": "changling", "form": 3})
	var i := 0
	for p in combos:
		var sv = ui.SpriteView.new()
		sv.scale_k = 3.0
		sv.size = Vector2(150, 110)
		sv.position = Vector2((i % 8) * 158, int(i / 8) * 170)
		var m := Mob.new()
		m.dir = 2
		Game.build_appearance(p, m)
		sv.mob = m
		layer.add_child(sv)
		var l := Label.new()
		l.text = "%s\n%s" % [p["race"], p.get("hair", p.get("type", "")) if p.get("form", 0) == 0 else "form %d" % p["form"]]
		l.add_theme_font_size_override("font_size", 12)
		l.position = sv.position + Vector2(10, 112)
		layer.add_child(l)
		i += 1
	await wait(0.5)
	await shot("02b_gallery")
	layer.queue_free()


func run() -> void:
	await wait(1.0)
	await shot("01_title")
	ui._start_creation()
	await wait(0.5)
	await shot("02_race")
	await gallery()
	ui.creation = {"race": "Saiya-jin", "gender": "Male", "skin": "Tan", "hair": "Spikey", "hair_rgb": [0, 0, 0],
		"facial": "None", "type": "", "alignment": "Good", "style": "Kame", "face": "Goku", "name": "Tester"}
	ui._look_step()
	await wait(0.4)
	await shot("03_look")
	ui._background_step()
	await wait(0.4)
	await shot("03b_background")
	ui._begin(Game.new_player(ui.creation))
	await wait(1.0)
	print("START ", state(), " attribute=", Game.P["attribute"])
	await shot("04_spawn")
	# --- dummy training
	var d := go_near("/mob/other/Dummy")
	await wait(0.4)
	Game._on_train("Punches", 0)
	await wait(5.0)
	print("TRAINED ", state())
	await shot("05_training")
	Game.stop_busy()
	Game.toggle_meditate()
	await wait(6.0)
	print("MEDITATED ", state())
	await shot("06_meditate")
	Game.stop_busy()
	# --- weights and speed bag
	go_near("/obj/WeightTraining100", 0)
	await wait(0.3)
	for i in 30:
		Game.cooldowns.erase("lift")
		Game.P["stamina"] = 100.0
		Game.interact()
	print("LIFTED ", state())
	await shot("07_weights")
	# --- jump ahead: a long training session
	for i in 400:
		Game.gain_maxpl(randi_range(1, 5))
		Game.gain_exp(60)
	Game.P["pl"] = Game.cap("powerlevel")
	print("LONG TRAIN ", state())
	Game.spend_bp("bal", 999999)
	print("SPENT BP ", state())
	# --- mentors
	go_near("/mob/other/Kame")
	await wait(0.3)
	Game.interact()
	await wait(0.3)
	await shot("08_mentor")
	ui._dialog_pick("Learn Kame Hame Ha", 0)
	await wait(0.2)
	go_near("/mob/other/Trunks")
	await wait(0.3)
	Game._on_mentor("Learn Enrage", 0, "/mob/other/Trunks")
	Game._on_mentor("Learn Burning Attack", 0, "/mob/other/Trunks")
	print("MENTORS ", Game.P["learned"])
	# --- shop
	go_near("/mob/melp/Shopkeeper")
	await wait(0.3)
	Game._on_shop("Senzu Bean (5,000 z)", 0)
	Game._on_shop("Blue Gi (150 z)", 1)
	print("SHOP items=", Game.P["items"], " worn=", Game.P["worn"])
	# --- fight saibamen on Earth
	var target: Mob = null
	for m in Game.monsters:
		if m.path == "/mob/monsters/saibaman" and not m.dead:
			target = m
			break
	if target:
		Game.teleport(target.x, target.y - 1, target.z)
		await wait(0.3)
		Game.pe.dir = 1
		for i in 10:
			Game.last_melee = 0
			Game.melee()
			await wait(0.15)
		print("AFTER MELEE target hp ", target.powerlevel, " dead ", target.dead, " ", state())
	await shot("09_fight")
	var t2: Mob = null
	for m in Game.monsters:
		if m.path == "/mob/monsters/saibaman" and not m.dead:
			t2 = m
	if t2:
		Game.teleport(t2.x, t2.y - 2, t2.z)
		Game.pe.dir = 1
		await wait(0.2)
		Game.use_ability("t:Kamehameha")
		await wait(0.1)
		await shot("10_kamehameha")
		await wait(1.0)
		print("AFTER BEAM saibaman dead ", t2.dead, " ", state())
	# --- enrage -> super saiya-jin -> transform
	Game.use_ability("t:Enrage")
	Game.cooldowns.clear()
	if not Game.P["gone"]:
		Game.enrage()
	Game.use_ability("transform")
	await wait(0.5)
	print("TRANSFORMED ", state(), " formset=", Game.P["formset"])
	await shot("11_ssj")
	Game.revert()
	# --- killed by Raditz: afterlife, King Yemma, Snake Way, King Kai
	var rad: Mob = null
	for m in Game.monsters:
		if m.path == "/mob/monsters/Raditz":
			rad = m
	Game.P["health"] = 1.0
	Game.P["def"] = 0.0
	if rad:
		Game.teleport(rad.x, rad.y - 1, rad.z)
		for i in 20:
			if Game.P.get("dead", false):
				break
			Game.monster_attack(rad)
	print("DIED dead=", Game.P["dead"], " ", state())
	Game.P["def"] = 40.0
	await wait(0.5)
	await shot("12_afterlife")
	go_near("/mob/other/Kinjin", -2)
	await wait(0.3)
	Game.interact(Game._near("/mob/other/Kinjin", 6))
	await wait(0.2)
	ui._dialog_pick("Go", 0)
	await wait(0.5)
	print("SNAKE WAY ", state())
	await shot("13_snakeway")
	go_near("/mob/bubb/bubbles")
	Game.interact(Game._near("/mob/bubb/bubbles", 2))
	ui._dialog_pick("OK", 0)
	go_near("/mob/tester/kingkai")
	await wait(0.3)
	await shot("14_kingkai")
	Game.interact(Game._near("/mob/tester/kingkai", 2))
	await wait(0.5)
	print("REVIVED dead=", Game.P["dead"], " ", state())
	# --- gravitron
	go_near("/obj/Gravitron", 0)
	await wait(0.3)
	Game._on_grav("10x", 0)
	Game.grav_next = 0.0
	await wait(0.5)
	print("GRAVITY ", Game.grav, " ", state())
	await shot("15_gravity")
	Game.gravity_off()
	ui.toggle_book()
	await wait(0.4)
	await shot("16_skills")
	ui.toggle_book()
	Game.P["bp"] = 12
	ui.toggle_stats()
	await wait(0.4)
	await shot("17_stats")
	ui._spend("str", 10)
	print("BP after spend ", Game.P["bp"], " str ", Game.P["str"])
	ui.toggle_stats()
	# --- walk through a door warp (Kame House)
	Game.teleport(77, 85, 1)
	await wait(0.3)
	Game.save()
	print("SAVED ", FileAccess.file_exists(Game.SAVE_PATH))
	print("AUTOTEST OK")
	get_tree().quit()
