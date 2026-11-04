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


## One preview per race / gene (and per look option that changes the sprite).
func gallery() -> void:
	var layer := CanvasLayer.new()
	layer.layer = 50
	add_child(layer)
	var bg := ColorRect.new()
	bg.color = Color(0.12, 0.13, 0.2)
	bg.size = Vector2(1280, 720)
	layer.add_child(bg)
	var combos: Array = []
	for r in Data.rules["races"]:
		for g in Data.rules["races"][r]["genes"]:
			var p := {"race": r, "gene": g, "gender": "Male", "skin": "Tan", "hair": "Goku", "variant": ""}
			combos.append(p)
			if r == "Alien" and g == "Lycanthrope":
				for v in ["Bergamo", "Lavender"]:
					var q := p.duplicate()
					q["variant"] = v
					combos.append(q)
			if r == "Demon" and g == "Fomhoire":
				var q := p.duplicate()
				q["form"] = 3
				q["variant"] = "(form 3)"
				combos.append(q)
			if r == "Feline" and g == "Destructive":
				var q := p.duplicate()
				q["skin"] = "Chaotic"
				combos.append(q)
			if r == "Bio Android" and g == "Pure Blooded":
				var q := p.duplicate()
				q["skin"] = "Blue"
				combos.append(q)
	var i := 0
	for p in combos:
		var sv = ui.SpriteView.new()
		sv.scale_k = 2.0
		sv.size = Vector2(84, 76)
		sv.position = Vector2((i % 15) * 85, int(i / 15) * 118)
		var m := Mob.new()
		m.dir = 2
		Game.build_appearance(p, m)
		sv.mob = m
		layer.add_child(sv)
		var l := Label.new()
		l.text = "%s\n%s%s" % [p["race"], p["gene"], (" " + p["variant"]) if p["variant"] != "" else ""]
		l.add_theme_font_size_override("font_size", 10)
		l.position = sv.position + Vector2(0, 78)
		layer.add_child(l)
		i += 1
	print("GALLERY ", combos.size())
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
	ui.creation = {"race": "Saiyan", "gene": "Honourable", "gender": "Male", "skin": "Tan", "hair": "Vegeta", "name": "Tester"}
	ui._look_step()
	await wait(0.4)
	await shot("03_look")
	ui._begin(Game.new_player(ui.creation))
	await wait(1.0)
	print("START ", state())
	print("HOTBAR ", Game.P["hotbar"].slice(0, 10))
	await shot("04_spawn")
	Game.teleport(399, 247, 7)
	await wait(0.4)
	await shot("04b_bed")
	Game.teleport(431, 276, 7)
	await wait(0.4)
	await shot("04c_couch")
	Game.teleport(395, 252, 7)
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
	# --- leave the Other World hospital through its exit warp (lands on Earth)
	Game.teleport(417, 225, 7)
	await wait(0.3)
	Game.try_step(2)
	await wait(1.5)
	await shot("06a_earth")
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
	# --- gravity room (100x machine at 10,123 on z5)
	Game.teleport(10, 121, 5)
	await wait(0.5)
	Game.interact()
	await wait(0.3)
	await shot("13a_gravity_menu")
	ui._dialog_pick("Turn on the gravity", 0)
	Game.grav_next = 0.0
	await wait(0.3)
	var e0: float = Game.P["exp"]
	Game.use_ability("selftrain")
	await wait(3.0)
	print("GRAVITY grav=", Game.grav, " gravtrain=", Game.gravtrain, " ", state())
	await shot("13b_gravity")
	Game.stop_busy()
	Game.teleport(64, 387, 1)
	Game.grav_next = 0.0
	await wait(0.3)
	print("GRAVITY AFTER LEAVING grav=", Game.grav)
	Game.save()
	print("SAVED ", FileAccess.file_exists(Game.SAVE_PATH))
	# --- continue from the save after a window resize (the joystick must stay on screen)
	Game.running = false
	ui.set_game_ui(false)
	ui.show_title()
	DisplayServer.window_set_size(Vector2i(1100, 560))
	await wait(0.6)
	ui._begin(Game.load_save())
	await wait(0.6)
	var vr: Rect2 = ui.get_viewport().get_visible_rect()
	print("STICK ", ui.stick.get_global_rect(), " in view ", vr.encloses(ui.stick.get_global_rect()), " ATTACK in view ", vr.encloses(ui.attack_btn.get_global_rect()))
	await shot("14_continue_resized")
	print("AUTOTEST OK")
	get_tree().quit()
