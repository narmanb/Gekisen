extends Node
## Balance simulator: godot --path ruination/godot -- --balance
## Plays a fresh character through hours of play without real time passing and prints the
## numbers at checkpoints. Self Train ticks every 0.6 s, Meditate every 2.4 s; resting is skipped,
## so a real hour of play is somewhat slower than one simulated hour.

var ui


func _ready() -> void:
	ui = get_parent().get_node("UI")
	await get_tree().process_frame
	if not OS.get_cmdline_user_args().has("--mob-only"):
		for race in [["Saiyan", "Honourable"], ["Human", "Pure Blooded"], ["Changeling", "Pure Blooded"]]:
			run_afk(race[0], race[1])
	run_mob("Saiyan", "Honourable")
	print("BALANCE DONE")
	get_tree().quit()


func fresh(race: String, gene: String) -> void:
	var p := Game.new_player({"race": race, "gene": gene, "name": "Sim"})
	Game.P = p
	Game.buffs = {}
	Game.gravtrain = 0.0


func row(label: String) -> String:
	var P := Game.P
	return "%-8s lvl %5d  PL %14s  Ki %14s  Str %14s  Def %14s  KiCtl %3d%%" % [label, int(P["level"]), Game.fmt(Game.cap("powerlevel")),
		Game.fmt(Game.cap("ki")), Game.fmt(Game.cap("strength")), Game.fmt(Game.cap("defence")), int(Game.kc() * 100)]


## AFK: Self Train (rotating focus each hour) with a Meditate tick in place of every 4th Self Train tick.
func run_afk(race: String, gene: String) -> void:
	fresh(race, gene)
	print("--- AFK Self Train + Meditate: %s (%s) start %s" % [race, gene, Game.fmt(Game.cap("powerlevel"))])
	var focus := ["Powerlevel", "Strength", "Defense", "Ki"]
	var checks := [1, 5, 10, 25, 50, 100, 200, 400]
	var hour := 0
	for h in checks[-1]:
		Game.P["focus"] = focus[h % 4]
		for t in 6000:
			Game.P["stam"] = 0.0
			if t % 4 == 3:
				var se := (5 + int(Game.P["level"]) / 1000) * 2
				Game._skill_exp("ki_control", se)
			else:
				Game.self_train_tick()
		hour = h + 1
		if hour in checks:
			print(row("%dh" % hour))


## Mobbing: 400 kills an hour of monsters as strong as you (plus that hour's Self Train between fights).
func run_mob(race: String, gene: String) -> void:
	fresh(race, gene)
	print("--- Mobbing 400 kills/h at your power + Self Train: %s (%s)" % [race, gene])
	var checks := [1, 5, 10, 25, 50, 100, 200]
	for h in checks[-1]:
		Game.P["focus"] = ["Powerlevel", "Strength", "Defense", "Ki"][h % 4]
		for k in 400:
			var m := Mob.new()
			m.kind = "monster"
			m.powerlevel_max = Game.cap("powerlevel")
			m.exp_reward = roundf(10.0 * sqrt(m.powerlevel_max))
			m.respawn = false
			m.path = "/sim"
			Game.monsters[m] = true
			Game.monster_die(m)
			for t in 6:
				Game.P["stam"] = 0.0
				if t == 5:
					Game._skill_exp("ki_control", (5 + int(Game.P["level"]) / 1000) * 2)
				else:
					Game.self_train_tick()
		if (h + 1) in checks:
			print(row("%dh" % (h + 1)))
