class_name Mob
extends RefCounted
## Anything that lives on the map: the player, monsters, NPCs, objects, projectiles.

var x := 1
var y := 1
var z := 1
var dir := 2
var icon := -1
var state := ""
var overlays: Array = []     # [{icon, state?(null = follow), alpha?}]
var underlays: Array = []
var name := ""
var dense := true
var layer := 4.0
var kind := "obj"            # player, monster, npc, obj, proj
var path := ""
var pixel_x := 0.0
var pixel_y := 0.0
var invisible := false
var dead := false
var flying := false
var gravity := 0            # gravity machine strength (x), 0 = not a machine

# smooth movement
var from_x := 1.0
var from_y := 1.0
var move_start := 0.0
var move_dur := 0.0
var flick := {}              # {state, start, end}

# stats (monsters / player)
var level := 1.0
var powerlevel := 1.0
var powerlevel_max := 1.0
var ki := 0.0
var ki_max := 0.0
var strength := 1.0
var defence := 1.0
var durability := 1.0
var kidefense := 0.0
var ki_res := 10.0
var dodge := 0.0
var block := 0.0
var exp_reward := 0.0
var zenni_reward := 0.0
var race := ""

# AI
var home := Vector3i.ZERO
var aggro := false
var target: Mob = null
var next_think := 0.0
var next_attack := 0.0
var stun_until := 0.0
var dot_until := 0.0
var dot_amount := 0.0
var respawn := false

# projectile
var owner: Mob = null
var damage := 0.0
var steps := 0
var next_step := 0.0
var tech := {}
var trail: Array = []
var face := -1              # sprite direction override (diagonal beams drawn from a straight sprite)
var rot := 0.0              # sprite rotation in radians around the tile centre
var stretch := 1.0          # sprite x-scale (diagonal trail pieces are longer)
var trail_state := ""
var crit := false
var homing := false         # Trace Nuke / ki missiles steer toward the nearest monster
var hover_until := 0.0      # missiles wait here before they start moving
var power := 0.0            # missile / big ball power
var pieces: Array = []      # big ball: the other 8 sprite pieces riding along
var pow_left: Array = []    # big ball: power left in each of the 9 pieces


func pos(now: float) -> Vector2:
	if move_dur <= 0.0:
		return Vector2(x, y)
	var k := (now - move_start) / move_dur
	if k >= 1.0:
		move_dur = 0.0
		return Vector2(x, y)
	return Vector2(from_x + (x - from_x) * k, from_y + (y - from_y) * k)


func is_moving(now: float) -> bool:
	return move_dur > 0.0 and now - move_start < move_dur + 60.0


func mid_step(now: float) -> bool:
	return move_dur > 0.0 and now - move_start < move_dur


func do_flick(st: String, now: float) -> void:
	var l := Data.flick_length(icon, st)
	if l > 0.0:
		flick = {"state": st, "start": now, "end": now + l}
