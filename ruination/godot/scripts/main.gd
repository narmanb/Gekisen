extends Node
## Entry point: the world renderer and the UI. Game and Data are autoloads.


func _ready() -> void:
	var world := preload("res://scripts/world.gd").new()
	world.name = "World"
	add_child(world)
	Game.world = world
	Game.running = false
	Game.monsters = {}
	Game.projectiles = []
	Game.timers = []
	var ui := preload("res://scripts/ui.gd").new()
	ui.name = "UI"
	add_child(ui)
	var tests := OS.get_cmdline_user_args()
	if tests.has("--autotest"):
		var t = load("res://tests/autotest.gd").new()
		add_child(t)
	elif tests.has("--balance"):
		add_child(load("res://tests/balance.gd").new())
