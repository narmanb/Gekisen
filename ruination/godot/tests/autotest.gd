extends Node
## Automated smoke test: run with
##   godot --path ruination/godot -- --autotest [--shots=DIR]
## Drives character creation, training, combat, techniques and transformation and
## saves screenshots. Prints "AUTOTEST OK" at the end.

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
	return "lvl=%s exp=%s/%s pl=%s/%s ki=%s/%s str=%s def=%s stam=%s zenni=%s pos=%d,%d,%d busy=%s form=%s learned=%d" % [
		P["level"], Game.fmt(P["exp"]), Game.fmt(P["tnl"]), Game.fmt(P["powerlevel"]), Game.fmt(Game.cap("powerlevel")),
		Game.fmt(P["ki"]), Game.fmt(Game.cap("ki")), Game.fmt(Game.cap("strength")), Game.fmt(Game.cap("defence")),
		Game.fmt(P["stam"]), Game.fmt(P["zenni"]), P["x"], P["y"], P["z"], Game.busy, P["form"], (P["learned"] as Array).size()]


func run() -> void:
	await wait(1.0)
	await shot("01_title")
	ui._start_creation()
	await wait(0.5)
	await shot("02_race")
	ui.creation = {"race": "Saiyan", "gene": "Honourable", "gender": "Male", "skin": "Tan", "hair": "Vegeta", "name": "Tester"}
	ui._look_step()
	await wait(0.4)
	await shot("03_look")
	ui._begin(Game.new_player(ui.creation))
	await wait(1.0)
	print("START ", state())
	await shot("04_spawn")
	# --- self training
	Game.use_ability("selftrain")
	await wait(6.0)
	print("TRAINED ", state())
	await shot("05_training")
	Game.use_ability("rest")
	await wait(2.0)
	print("RESTED ", state())
	Game.stop_busy()
	# --- jump ahead: simulate a long training session
	for i in 4000:
		Game.self_train_tick()
		Game.P["stam"] = 0.0
	print("LONG TRAIN ", state())
	Game.P["skills"]["ki_control"][0] = 60.0
	Game.P["powerlevel"] = Game.cap("powerlevel")
	Game.P["ki"] = Game.cap("ki")
	print("SKILLS ", Game.P["learned"])
	# --- travel to Earth with the space pod and pick a beatable monster
	Game.travel_menu()
	await wait(0.3)
	await shot("06a_travel")
	ui._dialog_pick("Earth", 1)
	await wait(2.0)
	print("LANDED ", state())
	var target: Mob = null
	var best := 99999.0
	for m in Game.monsters:
		if m.z == Game.pe.z and not m.dead and not Data.is_safe(m.x, m.y, m.z) and m.name.contains("Green"):
			var d: float = Vector2(m.x - Game.pe.x, m.y - Game.pe.y).length()
			if d < best:
				best = d
				target = m
	if target:
		print("TARGET ", target.name, " lvl ", target.level, " pl ", Game.fmt(target.powerlevel), " at ", target.x, ",", target.y)
		Game.teleport(target.x, target.y - 1, target.z)
		Game.pe.dir = 1
		await wait(0.3)
		for i in 40:
			if target.dead:
				break
			Game.last_melee = 0
			Game.melee()
			await wait(0.12)
		print("AFTER MELEE ", state(), " target pl ", Game.fmt(target.powerlevel), " dead ", target.dead)
		await shot("06_melee")
		Game.P["ki"] = Game.cap("ki")
		Game.use_ability("t:KiBlast")
		await wait(0.25)
		await shot("07_kiblast")
		await wait(1.0)
		for k in ["t:Kamehameha", "t:ExplosiveWave", "t:RapidBlast"]:
			if k.substr(2) in Game.P["learned"]:
				Game.P["ki"] = Game.cap("ki")
				Game.cooldowns.clear()
				Game.use_ability(k)
				await wait(0.35)
				await shot("08_" + k.substr(2))
				await wait(0.8)
		print("AFTER TECHS ", state())
	# --- skills book + assign to hotbar
	ui.toggle_book()
	await wait(0.4)
	await shot("09_book")
	if not Game.P["learned"].is_empty():
		ui._pick("t:" + Game.P["learned"][-1])
		ui._slot_tap(9)
	ui.toggle_book()
	ui.toggle_stats()
	await wait(0.3)
	await shot("10_stats")
	ui.toggle_stats()
	# --- transformation
	Game.P["level"] = 25000
	Game.skill_gain(false)
	Game.P["stam"] = 0.0
	Game.transform()
	await wait(0.6)
	print("TRANSFORMED ", state())
	await shot("11_transform")
	# --- warp test: walk onto the nearest warp turf on this z
	var w := Vector3i.ZERO
	for y in range(1, 500):
		for x in range(1, 500):
			var t := Data.turf(x, y, Game.pe.z)
			if t.has("enter") and t["enter"].has("warp"):
				w = Vector3i(x, y, Game.pe.z)
				break
		if w != Vector3i.ZERO:
			break
	if w != Vector3i.ZERO:
		Game.revert(true)
		Game.teleport(w.x, w.y - 1, w.z)
		await wait(0.2)
		Game.set_move_dir(1)
		await wait(0.4)
		Game.set_move_dir(0)
		await wait(0.5)
		print("WARP from ", w, " -> ", state())
		await shot("12_warp")
	Game.save()
	print("SAVED ", FileAccess.file_exists(Game.SAVE_PATH))
	print("AUTOTEST OK")
	get_tree().quit()
