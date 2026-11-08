extends Node
## Automated smoke test: godot --path dbo/godot -- --autotest [--shots=DIR]
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
	return "pl=%s/%s maxpl=%s ki=%s/%s stam=%d skexp=%d sp=%d zenni=%s pos=%d,%d,%d busy=%s form=%s dead=%s learned=%s" % [
		Game.fmt(P["pl"]), Game.fmt(Game.cap("powerlevel")), Game.fmt(P["maxpl"]), Game.fmt(P["ki"]), Game.fmt(P["maxki"]),
		int(P["stam"]), int(P["skexp"]), int(P["skpts"]), Game.fmt(P["zenni"]), P["x"], P["y"], P["z"], Game.busy,
		P.get("form_name", ""), P["dead"], str(P["learned"])]


func close_dialogs() -> void:
	ui.dialog_queue.clear()
	if ui.dialog_panel != null and is_instance_valid(ui.dialog_panel):
		ui.dialog_panel.queue_free()
	ui.dialog_panel = null


func pick(opt: String) -> void:
	# answer the dialog that is currently shown
	var d = ui.dialog_queue[0] if not ui.dialog_queue.is_empty() else null
	if d == null:
		print("NO DIALOG for ", opt)
		return
	var i: int = d[2].find(opt)
	if i < 0:
		for k in d[2].size():
			if str(d[2][k]).begins_with(opt):
				i = k
	if i < 0:
		print("NO OPTION ", opt, " in ", d[2])
		close_dialogs()
		return
	ui._dialog_pick(d[2][i], i)


func find(path: String, z := 0) -> Array:
	for e in Data.map["entities"]:
		if Data.types[str(int(e[0]))]["path"] == path and (z == 0 or int(e[3]) == z):
			return [int(e[1]), int(e[2]), int(e[3])]
	return []


func go_near(path: String, dy := -1, z := 0) -> Mob:
	var p := find(path, z)
	if p.is_empty():
		print("NOT FOUND ", path)
		return null
	Game.world.load_z(p[2])
	Game.teleport(p[0], p[1] + dy, p[2])
	return Game._near(path, 2)


func gallery() -> void:
	var layer := CanvasLayer.new()
	layer.layer = 50
	add_child(layer)
	var bg := ColorRect.new()
	bg.color = Color(0.12, 0.13, 0.2)
	bg.size = Vector2(1280, 720)
	layer.add_child(bg)
	var combos: Array = []
	for r in Game.RACES:
		combos.append({"race": r, "hair": "Goku", "hair_rgb": [0, 0, 0]})
	combos.append({"race": "Earthling", "hair": "Vegeta", "hair_rgb": [170, 20, 10]})
	combos.append({"race": "Saiyan", "hair": "Spikey", "formset": "ssj", "form": 1, "form_name": "Super Saiyan"})
	combos.append({"race": "Saiyan", "hair": "Goku", "formset": "ssj", "form": 4, "form_name": "Super Saiyan 3"})
	combos.append({"race": "Changling", "formset": "transform", "form": 3, "form_name": "Form 4"})
	combos.append({"race": "Buu", "formset": "buu", "form": 2, "form_name": "Super Buu"})
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
		l.text = "%s\n%s" % [p["race"], p.get("form_name", p.get("hair", ""))]
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
	ui.creation = {"race": "Saiyan", "hair": "Goku", "hair_colour": "Black", "alignment": "Good", "hometown": "Satan City", "name": "Tester"}
	ui._look_step()
	await wait(0.4)
	await shot("03_look")
	ui._begin(Game.new_player(ui.creation))
	await wait(1.0)
	print("START ", state())
	await shot("04_newbie_island")
	# --- self training
	Game._on_train("Punches", 0)
	await wait(4.0)
	print("TRAINED ", state())
	await shot("05_training")
	Game.stop_busy()
	Game._toggle("meditate", "")
	await wait(3.5)
	await shot("06_meditate")
	Game.stop_busy()
	# --- Ki trainer on Newbie Island
	var kt := go_near("/mob/other/Ki_Trainer1", -1, 20)
	await wait(0.3)
	Game.P["skpts"] = 200
	Game.interact(kt)
	await wait(0.3)
	await shot("07_ki_trainer")
	close_dialogs()
	for l in Game.KI_LESSONS:
		Game.P["know"][l[0]] = 1
	Game.P["maxpl"] = 2000.0
	Game.learn_checks()
	print("LESSONS ", state())
	# --- Intro 2 -> hometown
	close_dialogs()
	var i2 := go_near("/mob/other/Intro2", -1, 20)
	await wait(0.3)
	Game.interact(i2)
	await wait(0.2)
	pick("Yes")
	await wait(0.6)
	print("HOMETOWN ", state())
	await shot("08_hometown")
	# --- fight a thug in Satan City
	Game.P["pl"] = 2000.0
	Game.P["ki"] = Game.P["maxki"]
	var target: Mob = null
	for m in Game.monsters:
		if m.path == "/monster/evil/thug" and not m.dead:
			target = m
			break
	if target:
		Game.teleport(target.x, target.y - 1, target.z)
		Game.pe.dir = 1
		await wait(0.3)
		for i in 30:
			if target.dead:
				break
			Game.last_melee = 0
			Game.melee()
			await wait(0.05)
		print("AFTER MELEE thug hp ", target.powerlevel, " dead ", target.dead, " ", state())
	await shot("09_fight")
	var t2: Mob = null
	for m in Game.monsters:
		if m.path == "/monster/evil/thug" and not m.dead:
			t2 = m
	if t2:
		Game.teleport(t2.x, t2.y - 2, t2.z)
		Game.pe.dir = 1
		t2.stun_until = Game.now + 3000
		await wait(0.2)
		Game.use_ability("t:KiBeam")
		await wait(0.1)
		await shot("10_beam")
		await wait(1.0)
		print("AFTER BEAM thug dead ", t2.dead, " ", state())
	# --- teacher: Vegeta in Satan City? (any placed one)
	close_dialogs()
	var v := go_near("/mob/other/Vegeta")
	if v:
		Game.P["maxpl"] = 20000.0
		Game.interact(v)
		await wait(0.3)
		await shot("11_teacher")
		pick("Learn Galick Gun")
		print("TEACHER ", Game.P["learned"])
	# --- Super Saiyan
	Game.P["maxpl"] = 1300000.0
	Game.P["maxki"] = 600000.0
	Game.P["anger"] = 10
	Game.P["stam"] = Game.P["maxstam"]
	for i in 6:
		if Game.P["formset"] != "":
			break
		Game.P["anger"] = 10
		Game.cooldowns.clear()
		Game.enrage()
	Game.transform()
	await wait(0.5)
	print("TRANSFORMED ", state())
	await shot("12_ssj")
	Game.revert()
	# --- death and the afterlife
	var rad: Mob = null
	for m in Game.monsters:
		if m.path == "/monster/saiyansaga/raditz":
			rad = m
	if rad:
		Game.player_ko(rad)
	print("DIED ", state())
	await wait(0.5)
	await shot("13_afterlife")
	close_dialogs()
	go_near("/mob/other/yemma", -1)
	var y: Mob = null
	print("YEMMA ", y, " ", (y.kind + " " + str(y.icon) + " at " + str(y.x) + "," + str(y.y)) if y else "", " me ", Game.pe.x, ",", Game.pe.y, " q=", ui.dialog_queue.size())
	Game.interact(y)
	print("YEMMA q after=", ui.dialog_queue.size())
	await wait(0.2)
	pick("OK")
	await wait(0.5)
	print("JUDGED ", state())
	await shot("14_judged")
	close_dialogs()
	var kk := go_near("/mob/other/kingkai")
	Game.interact(kk)
	pick("Yes")
	Game.P["bubbles"] = true
	Game.P["gregory"] = true
	Game.interact(kk)
	await wait(0.3)
	await shot("15_kingkai")
	pick("Send me back to Earth")
	await wait(0.5)
	print("REVIVED ", state())
	# --- gravitron
	close_dialogs()
	var g := go_near("/obj/Gravitron", 0)
	Game.P["pl"] = Game.P["maxpl"]
	Game._on_grav("10x", 0)
	for i in 6:
		Game.grav_next = 0.0
		await wait(0.1)
	print("GRAVITY ", Game.grav, " ", state())
	Game.gravity_off()
	# --- spells (normally the Wizard race's)
	for k in ["Immolation", "Blind", "FlameShield"]:
		Game._learn(k, "")
	var foe: Mob = null
	for m in Game.monsters:
		if m.path == "/monster/evil/thug" and not m.dead:
			foe = m
	if foe:
		Game.teleport(foe.x, foe.y - 1, foe.z)
		Game.P["stam"] = Game.P["maxstam"]
		print("SPELL dist ", maxi(absi(foe.x - Game.pe.x), absi(foe.y - Game.pe.y)), " z ", foe.z, "/", Game.pe.z, " hostile ", Game._hostile(foe), " near ", Game.nearest_monster(6))
		Game.log_msg.connect(func(t, _c): print("  MSG ", t))
		Game.use_ability("t:Blind")
		print("SPELL blind stunned=", foe.stun_until > Game.now)
		Game.spell_ready = 0
		Game.P["stam"] = Game.P["maxstam"]
		Game.use_ability("t:Immolation")
		print("SPELL immolation dead=", foe.dead)
		Game.spell_ready = 0
		Game.P["stam"] = Game.P["maxstam"]
		Game.use_ability("t:FlameShield")
		print("SPELL shield=", Game.shield_until > Game.now)
	# --- Guru's request
	close_dialogs()
	var guru := go_near("/mob/other/Guru")
	Game.interact(guru)
	close_dialogs()
	Game.interact(go_near("/mob/quest/Nail"))
	close_dialogs()
	Game.interact(go_near("/mob/quest/Dende"))
	close_dialogs()
	Game.interact(go_near("/mob/other/Guru"))
	close_dialogs()
	print("GURU stage=", Game.P.get("guru"), " sp=", Game.P["skpts"])
	# --- space pod: Capsule Corp hangar -> pod -> Namek
	var ccsp := go_near("/obj/ccsp", -1, 23)
	Game.interact(ccsp)
	await wait(0.3)
	print("POD at ", Game.P["x"], ",", Game.P["y"], ",", Game.P["z"])
	var con := Game._near("/obj/ccsspaceconsole", 8)
	if con:
		Game.teleport(con.x, con.y - 1, con.z)
		Game.interact(Game._near("/obj/ccsspaceconsole", 2))
		await wait(0.2)
		await shot("16a_spacepod")
		pick("Namek")
		Game.travel_at = Game.now + 100
		await wait(0.5)
	print("SPACE TRAVEL ", Game.P["x"], ",", Game.P["y"], ",", Game.P["z"])
	# --- time machine
	close_dialogs()
	var tm := go_near("/obj/timemachineproto", -1, 11)
	Game.interact(Game._near("/obj/timemachineproto", 2))
	pick("Cell's Timeline")
	Game.travel_at = Game.now + 100
	await wait(0.5)
	print("TIME TRAVEL ", Game.P["x"], ",", Game.P["y"], ",", Game.P["z"])
	# --- Babidi's Ship
	close_dialogs()
	go_near("/mob/HBQe", -2)
	Game.interact()
	await wait(0.3)
	print("SHIP at ", Game.P["x"], ",", Game.P["y"], ",", Game.P["z"])
	Game.interact(Game._near("/obj/items/quest/BuuT", 3))
	pick("Go down to the next level")
	await wait(0.3)
	await shot("16b_ship")
	var boss: Mob = null
	for m in Game.monsters:
		if m.path.begins_with("/monster/quest/reincarnate/PuiPui") and not m.dead:
			boss = m
	if boss:
		Game.monster_die(boss)
	Game.interact(Game._near("/obj/items/quest/BuuT", 3))
	pick("Go down to the next level")
	await wait(0.3)
	print("SHIP floor=", Game.P.get("ship_floor"), " pos ", Game.P["x"], ",", Game.P["y"])
	close_dialogs()
	ui.show_info("Quests", Game.quest_log())
	await wait(0.3)
	await shot("16c_quests")
	ui.info_panel.visible = false
	ui.show_info("Techniques to Learn", ui._todo_text())
	await wait(0.3)
	await shot("16d_todo")
	ui.info_panel.visible = false
	ui.toggle_book()
	await wait(0.4)
	await shot("16_skills")
	ui.toggle_book()
	ui.toggle_stats()
	await wait(0.4)
	await shot("17_stats")
	ui.toggle_stats()
	Game.save()
	print("SAVED ", FileAccess.file_exists(Game.SAVE_PATH))
	print("AUTOTEST OK")
	get_tree().quit()
