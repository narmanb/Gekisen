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


## An open patch of ground (no walls, water or safe zone) 4 tiles behind and 14 ahead, 7 up and down.
func find_open(cx: int, cy: int, z: int) -> Vector2i:
	for r in range(0, 60, 2):
		for dx in range(-r, r + 1, 2):
			for dy in [-r, r]:
				if _open_at(cx + dx, cy + dy, z):
					return Vector2i(cx + dx, cy + dy)
	return Vector2i(cx, cy)


func _open_at(x: int, y: int, z: int) -> bool:
	for dx in range(-4, 15):
		for dy in range(-7, 8):
			var t := Data.turf(x + dx, y + dy, z)
			if t.is_empty() or int(t.get("dense", 0)) == 1 or Data.is_safe(x + dx, y + dy, z):
				return false
	return true


func touch_at(a: Vector2, b: Vector2) -> void:
	var t := InputEventScreenTouch.new()
	t.index = 0
	t.position = a
	t.pressed = true
	Input.parse_input_event(t)
	await get_tree().process_frame
	if a != b:
		for i in 5:
			var d := InputEventScreenDrag.new()
			d.index = 0
			d.position = a.lerp(b, (i + 1) / 5.0)
			Input.parse_input_event(d)
			await get_tree().process_frame
	var u := InputEventScreenTouch.new()
	u.index = 0
	u.position = b
	u.pressed = false
	Input.parse_input_event(u)
	await get_tree().process_frame
	await get_tree().process_frame


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
	# stat points screen (SetMultis.dm)
	var pts_seen := false
	ui._points_step(Game.new_player(ui.creation), func(_p): pts_seen = true)
	ui._points_change("ki_multi", 1)
	ui._points_change("strength_multi", 1)
	await wait(0.3)
	await shot("03b_stat_points")
	print("POINTS left ", ui._pts_p["points"], " ki ", ui._pts_p["ki_multi"], " str ", ui._pts_p["strength_multi"])
	ui.create_root.queue_free()
	ui.create_root = null
	ui._begin(Game.new_player(ui.creation))
	await wait(1.0)
	print("START ", state())
	print("HOTBAR ", Game.P["hotbar"].slice(0, 10))
	await shot("04_spawn")
	ui._train_menu()
	await wait(0.3)
	await shot("04a_train_menu")
	ui._dialog_pick("Cancel", 4)
	# --- Omni King (rebirth)
	var omni := Mob.new()
	omni.path = "/mob/NPC/Omni_King"
	omni.name = "Omni King"
	Game.interact(omni)
	await wait(0.3)
	await shot("04r_omni_king_early")
	while not ui.dialog_queue.is_empty():
		ui._dialog_pick("OK", 0)
	var lv_keep: int = Game.P["level"]
	Game.P["level"] = Game.rebirth_level()
	Game.interact(omni)
	await wait(0.3)
	await shot("04s_omni_king_rebirth")
	print("REBIRTH at level ", Game.rebirth_level(), " offered ", ui.dialog_queue[0][2] if not ui.dialog_queue.is_empty() else "-")
	ui._dialog_pick("No", 1)
	Game.P["level"] = lv_keep
	# --- test menu
	ui._test_menu()
	await wait(0.3)
	await shot("04t_test_menu")
	ui._dialog_pick("Level Up…", 0)
	ui._dialog_pick("100", 3)
	print("TEST LEVEL ", Game.P["level"])
	assert(int(Game.P["level"]) >= 101)
	ui._on_test_tp("To an NPC", 0)
	await wait(0.3)
	await shot("04u_tp_npcs")
	print("NPC targets ", ui._tp_rows.size(), " first ", ui._tp_rows.slice(0, 3))
	var ni: int = ui._tp_rows.size() / 2
	var nrow: Array = ui._tp_rows[ni]
	ui._dialog_pick("x", ni)
	print("TP NPC -> ", nrow, " at ", Game.pe.x, ",", Game.pe.y, ",", Game.pe.z)
	ui._on_test_tp("To an Enemy", 0)
	print("ENEMY targets ", ui._tp_rows.size(), " first ", ui._tp_rows.slice(0, 3))
	ui._dialog_pick("x", 0)
	ui._on_test_tp("To Coordinates", 0)
	await wait(0.3)
	await shot("04v_tp_coords")
	ui._close_coord()
	Game.test_teleport(395, 256, 7)
	ui._test_menu()
	ui._dialog_pick("Learn All Techniques", 2)
	await wait(0.5)
	await shot("04w_learned_all")
	print("LEARNED ", Game.P["learned"].size(), " panel ", Game.panel_actions())
	var goku := Mob.new()
	goku.path = "/mob/NPC/SSJ4Goku"
	goku.name = "SSJ4 Goku"
	Game.P["learned"].erase("X10_Kamehameha")
	Game.P["level"] = Game.remap_level(9000)
	Game._teach(goku)
	var not_yet: bool = not "X10_Kamehameha" in Game.P["learned"]
	ui.close_dialogs() if ui.has_method("close_dialogs") else null
	while not ui.dialog_queue.is_empty():
		ui._dialog_pick("OK", 0)
	Game.P["level"] = Game.remap_level(10000)
	Game._teach(goku)
	while not ui.dialog_queue.is_empty():
		ui._dialog_pick("OK", 0)
	print("TEACHER X10 at 9000: ", not not_yet, " at 10000: ", "X10_Kamehameha" in Game.P["learned"])
	assert(not_yet and "X10_Kamehameha" in Game.P["learned"])
	# --- instant transmission: NPC list, ki cost, lock-on, arrival
	Game.it_lock_until = 0.0
	Game.P["ki"] = 1000.0
	Game.use_tech("InstantTransmission")
	await wait(0.3)
	await shot("04y_it_menu")
	var it_n: int = Game._it_rows.size()
	var it_target: Array = Game._it_rows[0]
	Game.P["ki"] = 1000.0         # the per-second tick caps Ki at its max; the test character's max is under 500
	ui._dialog_pick("x", 1)
	await wait(4.0)
	print("IT ", it_n, " targets -> ", it_target, " now at ", Game.pe.x, ",", Game.pe.y, ",", Game.pe.z)
	assert(Game.pe.z == int(it_target[3]) and absi(Game.pe.x - int(it_target[1])) <= 6)
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
		# --- technique audit: Triple Ki Blast, splash, Explosive Wave, missiles, big ball
		for m in Game.monsters:
			if m.z == Game.pe.z and maxi(absi(m.x - Game.pe.x), absi(m.y - Game.pe.y)) <= 20:
				m.dead = true
				Game.world.remove(m)
		var open_spot := find_open(Game.pe.x, Game.pe.y, Game.pe.z)
		print("OPEN SPOT ", open_spot)
		Game.test_teleport(open_spot.x, open_spot.y, Game.pe.z)
		for m in Game.monsters:
			if m.z == Game.pe.z and maxi(absi(m.x - Game.pe.x), absi(m.y - Game.pe.y)) <= 20:
				m.dead = true
				Game.world.remove(m)
		var dummies: Array = []
		for off in [[5, 0], [5, 1], [6, 1], [2, 2], [-2, 2], [3, -2], [-3, -1], [0, 6], [7, 4]]:
			var dm: Mob = Game.spawn_monster("/mob/Monster/MainMobs/Goon_1", Game.pe.x + off[0], Game.pe.y + off[1], Game.pe.z)
			dm.powerlevel_max = 1.0e12
			dm.powerlevel = 1.0e12
			dm.aggro = false
			dm.next_think = Game.now + 600000.0
			dummies.append(dm)
		Game.P["level"] = Game.remap_level(5300)
		Game.P["ki_max"] = 169961.0 / Game.kc()      # roughly your character in the last screenshot
		for spec in [["TripleKiBlast", 4, 0.25], ["Kamehameha", 4, 0.5], ["ExplosiveWave", 4, 0.75], ["RapidBlast", 4, 1.6], ["KiShower", 4, 1.6], ["BigBangAttack", 4, 0.35], ["SuperExplosionWave", 4, 1.0], ["PowerDash", 4, 0.35], ["Push", 4, 0.3], ["BurstRush", 4, 0.9]]:
			Game.cooldowns.clear()
			Game.P["ki"] = Game.cap("ki")
			Game.P["powerlevel"] = Game.cap("powerlevel")
			Game.P["stam"] = 0.0
			Game.pe.stun_until = 0.0
			var before: Array = dummies.map(func(dm): return dm.powerlevel)
			Game.pe.dir = spec[1]
			if not spec[0] in Game.P["learned"]:
				Game.P["learned"].append(spec[0])
			Game.use_tech(spec[0])
			await wait(spec[2])
			await shot("05t_%s" % spec[0])
			await wait(1.5)
			var hits: Array = []
			for di in dummies.size():
				var lost: float = before[di] - dummies[di].powerlevel
				if lost > 0:
					hits.append("(%d,%d)=%s" % [dummies[di].x - Game.pe.x, dummies[di].y - Game.pe.y, Game.fmt(lost)])
			print("TECH ", spec[0], " PL ", Game.fmt(Game.cap("powerlevel")), " Ki ", Game.fmt(Game.cap("ki")), " ki_power ", Game.skill("ki_power"), " hits ", hits)
		for dm in dummies:
			print("DUMMY at ", dm.x - Game.pe.x, ",", dm.y - Game.pe.y, " took ", Game.fmt(dm.powerlevel_max - dm.powerlevel))
			dm.dead = true
			Game.world.remove(dm)
		var keep_bonus: float = Game.P["pl_bonus"]
		Game.P["pl_bonus"] = keep_bonus + 1.0e9        # stay standing through the AI / saga checks
		Game.test_teleport(open_spot.x, open_spot.y, 1)
		# --- monster AI: a Goon chases and punches, an Exploding Saibaman glows and blows up,
		# killing an Exploding Cell gives a level
		Game.P["powerlevel"] = Game.cap("powerlevel")
		var goon: Mob = Game.spawn_monster("/mob/Monster/MainMobs/Goon_1", Game.pe.x - 6, Game.pe.y + 4, Game.pe.z)
		var pl0: float = Game.P["powerlevel"]
		await wait(3.0)
		print("AI goon awake=", goon.awake, " dist=", maxi(absi(goon.x - Game.pe.x), absi(goon.y - Game.pe.y)), " PL lost=", Game.fmt(pl0 - Game.P["powerlevel"]))
		assert(goon.awake and maxi(absi(goon.x - Game.pe.x), absi(goon.y - Game.pe.y)) <= 1)
		goon.dead = true
		Game.world.remove(goon)
		Game.monsters.erase(goon)
		Game.P["powerlevel"] = Game.cap("powerlevel")
		var sb: Mob = Game.spawn_monster("/mob/Monster/ExplosiveMobs/Exploding_Saibaman", Game.pe.x + 7, Game.pe.y, Game.pe.z)
		sb.respawn = false
		pl0 = Game.P["powerlevel"]
		var shot_taken := false
		for i in 60:
			await wait(0.1)
			if not shot_taken and sb.state == "exploding" and maxi(absi(sb.x - Game.pe.x), absi(sb.y - Game.pe.y)) <= 4:
				await shot("05m_exploding_close")
				shot_taken = true
			if sb.dead:
				break
		await shot("05m_exploded")
		print("AI saiba exploded=", sb.dead, " PL lost=", Game.fmt(pl0 - Game.P["powerlevel"]), " of max ", Game.fmt(Game.pl_max()))
		assert(sb.dead)
		var cellm: Mob = Game.spawn_monster("/mob/Monster/ExplosiveMobs/Exploding_Cell", Game.pe.x + 1, Game.pe.y, Game.pe.z)
		cellm.respawn = false
		var lv0: int = Game.P["level"]
		var ex0: float = Game.P["exp"]
		Game._hit_monster(cellm, 10.0, Color.WHITE, "ki")
		print("AI cell kill level ", lv0, " -> ", Game.P["level"], " exp ", Game.fmt(ex0), " -> ", Game.fmt(Game.P["exp"]))
		assert(int(Game.P["level"]) > lv0 or float(Game.P["exp"]) > ex0)
		Game.P["powerlevel"] = Game.cap("powerlevel")
		# --- sagas: Raditz's Double Sunday, then Vegeta and Nappa land
		Game.start_saga("villain", "Match my power")
		await wait(0.3)
		var rad: Mob = Game.saga_bosses[0]
		Game.test_teleport(rad.x - 10, rad.y, rad.z)
		Game.P["powerlevel"] = Game.cap("powerlevel")
		await wait(0.3)
		Game.saga_data()["bosses"]["Raditz"]["moves"] = ["double_sunday"]
		rad.awake = true
		Game.test_teleport(open_spot.x, open_spot.y, 1)
		Game.world.move(rad, open_spot.x + 9, open_spot.y, 1, 0, Game.now)
		var plr: float = Game.P["powerlevel"]
		var dxr: int = Game.pe.x - rad.x
		var dyr: int = Game.pe.y - rad.y
		print("SAGA raditz at ", rad.x, ",", rad.y, " player ", Game.pe.x, ",", Game.pe.y, " move ok ", Game._saga_move(rad, dxr, dyr, maxi(absi(dxr), absi(dyr))))
		await wait(0.85)
		await shot("05s_double_sunday")
		await wait(1.0)
		print("SAGA double sunday PL lost ", Game.fmt(plr - Game.P["powerlevel"]))
		Game.saga_data()["bosses"]["Raditz"]["moves"] = ["double_sunday", "blast"]
		Game._hit_monster(rad, rad.powerlevel_max * 2.0, Color.WHITE, "")
		await wait(5.0)
		print("SAGA part ", Game.P["saga"]["part"], " bosses ", Game.saga_bosses.map(func(b): return b.name))
		assert(int(Game.P["saga"]["part"]) == 1 and Game.saga_bosses.size() == 2)
		await shot("05s_vegeta_nappa")
		# Frieza's ki volley: aimed at you, re-aims twice
		var fz: Mob = Game._spawn_saga_boss("Frieza", 0, open_spot.x + 8, open_spot.y + 3, 1)
		Game.test_teleport(open_spot.x, open_spot.y, 1)
		Game.saga_data()["bosses"]["Frieza"]["moves"] = ["volley"]
		var vdx: int = Game.pe.x - fz.x
		var vdy: int = Game.pe.y - fz.y
		Game._saga_move(fz, vdx, vdy, maxi(absi(vdx), absi(vdy)))
		await wait(0.4)
		var vol: Array = Game.projectiles.filter(func(p): return p.owner == fz)
		print("SAGA volley shots ", vol.size(), " aim ", vol[0].aim if not vol.is_empty() else "-", " adjust ", vol[0].adjust_left if not vol.is_empty() else -1, " player ", Game.pe.x, ",", Game.pe.y)
		await shot("05s_frieza_volley")
		await wait(1.5)
		Game.saga_data()["bosses"]["Frieza"]["moves"] = ["death_beam", "death_ball", "volley"]
		Game.end_saga()
		Game.P["pl_bonus"] = keep_bonus
		Game.P["powerlevel"] = Game.cap("powerlevel")
		# --- beams: head starts in front, real trail, diagonals (8-dir Kamehameha, rotated 4-dir ones)
		for m in Game.monsters:          # clear the area so the shots fly their full length
			if m.z == Game.pe.z and maxi(absi(m.x - Game.pe.x), absi(m.y - Game.pe.y)) <= 20:
				m.dead = true
				Game.world.remove(m)
		Game.test_teleport(Game.pe.x, Game.pe.y - 3, Game.pe.z)
		for b in [["Kamehameha", 4], ["Kamehameha", 5], ["SpecialBeamCannon", 9], ["Masenko", 6], ["GalickGun", 1]]:
			Game.cooldowns.clear()
			Game.P["ki"] = Game.cap("ki")
			Game.pe.dir = b[1]
			Game.use_tech(b[0])
			if b[1] == 4:
				for fi in 4:
					await wait(0.06)
					await shot("04z_head_%d" % fi)
			await wait(0.3)
			await shot("04x_beam_%s_%d" % [b[0], b[1]])
			await wait(1.2)

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
	Game.P["level"] = Game.remap_level(25000)
	Game.skill_gain(false)
	Game.P["stam"] = 0.0
	Game.P["level"] = Game.remap_level(60000)
	Game.transform()
	await wait(0.3)
	print("FORM MENU ", ui.dialog_queue[0][2] if not ui.dialog_queue.is_empty() else "none")
	await shot("11a_form_menu")
	ui._dialog_pick("Form 2", 1)            # trans_lvl 0 -> Form 2 (Form 3 needs trans level 25)
	await wait(2.5)
	await shot("11b_transforming")
	await wait(3.0)
	print("TRANSFORMED form=", Game.P["form"], " x", Game.form_mult("pl"), " trans_lvl=", Game.trans_lvl(), " exp=", Game.P.get("trans_exp"), " panel ", Game.panel_actions())
	assert(int(Game.P["form"]) == 2)
	await shot("11_transform")
	Game.P["trans_lvl"] = 30
	Game.revert()
	Game.transform()
	print("FORM MENU at trans 30 ", ui.dialog_queue[0][2] if not ui.dialog_queue.is_empty() else "none")
	while not ui.dialog_queue.is_empty():
		ui._dialog_pick("Cancel", 0)
	Game.P["level"] = Game.remap_level(25000)
	Game.P["form"] = 1
	Game.build_appearance()
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
	# --- message window, gains, stats and minimap
	Game.teleport(395, 252, 7)
	Game.use_ability("selftrain")
	await wait(4.0)
	ui.logwin._set_tab("tick")
	await wait(0.3)
	await shot("15a_log_ticks")
	ui.logwin._set_tab("gains")
	await wait(0.6)
	await shot("15b_log_gains")
	ui.logwin._set_tab("all")
	ui.logwin.set_look("clear")
	await wait(0.3)
	await shot("15c_log_clear")
	ui.logwin.set_look("panel")
	ui.logwin.position = Vector2(300, 120)
	ui.logwin.full_size = Vector2(420, 160)
	ui.logwin._layout()
	# minimap: tap cycles sizes, drag moves it
	var mm = ui.minimap
	var s0: float = mm.size.x
	await touch_at(mm.global_position + mm.size / 2, mm.global_position + mm.size / 2)
	var s1: float = mm.size.x
	await touch_at(mm.global_position + mm.size / 2, mm.global_position + mm.size / 2)
	var s2: float = mm.size.x
	await touch_at(mm.global_position + mm.size / 2, mm.global_position + mm.size / 2)
	var s3: float = mm.size.x
	print("MINIMAP sizes ", [s0, s1, s2, s3])
	assert(s1 > s0 and s2 > s1 and is_equal_approx(s3, s0))
	await touch_at(mm.global_position + Vector2(20, 20), Vector2(700, 300))
	print("MINIMAP moved to ", mm.position)
	assert(mm.position.distance_to(Vector2(680, 280)) < 2)
	await touch_at(mm.global_position + mm.size / 2, mm.global_position + mm.size / 2)
	await wait(0.5)
	await shot("15d_moved_minimap")
	mm.reset_layout()
	ui.logwin.reset_layout()
	Game.stop_busy()
	ui.toggle_stats()
	await wait(0.4)
	await shot("15e_stats")
	ui.stats_label.get_v_scroll_bar().value = 400
	await wait(0.3)
	await shot("15f_stats_scrolled")
	ui.toggle_stats()
	ui.menu_panel.visible = true
	await wait(0.3)
	await shot("16a_menu")
	ui.show_notes(false)
	await wait(0.3)
	await shot("16b_update_notes")
	ui.show_notes(true)
	await wait(0.3)
	await shot("16c_legacy_notes")
	print("NOTES ", ui.notes_label.get_parsed_text().length(), " chars")
	ui.notes_panel.visible = false
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
	var loaded := 0
	for n in ["punchhit.wav", "kamehameha_fire.wav", "expload.wav", "teleport.wav", "powerup.wav", "aura_full.wav", "strong_hit_01.ogg", "meleeflash.ogg"]:
		Game._sfx_last.erase(n)
		Game.sfx(n)
		if Game._sfx_cache.get(n) != null:
			loaded += 1
	print("SOUNDS loaded ", loaded, "/8, playing ", Game._sfx_players.filter(func(a): return a.playing).size())
	assert(loaded == 8)
	print("AUTOTEST OK")
	get_tree().quit()
