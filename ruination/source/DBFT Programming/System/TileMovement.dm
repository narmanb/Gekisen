

mob/var/tmp/move_delay=0.6  // was 1  //AND WAS 0.8

//var/move_delay=1  // 0 for 10 fps, 0.75 for 20(now 1),  1 for 40
world
    icon_size = 32
    fps = 30 //20


#define MOVE_SLIDE 1
#define MOVE_JUMP 2
#define MOVE_TELEPORT 4

#define TILE_WIDTH  32
#define TILE_HEIGHT 32
//#define TICK_LAG    0.4 // SET THIS TO 0.25 FOR 40 FPS  0.5 for 20 fps 1 for 10fps set to (10 / world.fps)  // 0.4 for 25 FPS

#define TICK_LAG    0.3 // SET THIS TO 0.25 FOR 40 FPS  0.5 for 20 fps 1 for 10fps set to (10 / world.fps)  // 0.4 for 25 FPS

/*
mob/verb/changemove()
	src.move_delay = input("NEW MOVENUM",src.move_delay) as num

mob/verb/changemove2()
	src.move_delay = input("NEW MOVENUM",src.move_delay) as num
	src.move_delay = src.move_delay * TICK_LAG
*/

mob
	appearance_flags = LONG_GLIDE //make diagonal and horizontal moves take the same amount of time
	animate_movement = FORWARD_STEPS
	var
//		move_delay = 1 //how long between self movements this movable should be forced to wait.
		tmp
			next_move = 0 //the world.time value of the next allowed self movement
			last_move = 0 //the world.time value of the last self movement
			move_dir = 0 //the direction of the current/last movement
			move_flags = 0 //the type of the current/last movement



	Move(atom/NewLoc,Dir=0)
		if(frozen||regen_dead||gravityfieldon||binded||GMLocked||KO||sleeping)
			return 0
		var/time = world.time
		if(next_move>time && move_delay != 0)
			return 0
		if(!NewLoc) //if the new location is null, treat this as a failed slide and an edge bump.
			move_dir = Dir
			move_flags = MOVE_SLIDE
		else if(isturf(loc)&&isturf(NewLoc)) //if this is a movement between two turfs
			var/dx = NewLoc.x - x //get the distance delta
			var/dy = NewLoc.y - y
			if(z==NewLoc.z&&abs(dx)<=1&&abs(dy)<=1) //if only moving one tile on the same layer, mark the current move as a slide and figure out the move_dir
				move_dir = 0
				move_flags = MOVE_SLIDE
				if(dx>0) move_dir |= EAST
				else if(dx<0) move_dir |= WEST
				if(dy>0) move_dir |= NORTH
				else if(dy<0) move_dir |= SOUTH
			else //jumping between z levels or more than one tile is a jump with no move_dir
				move_dir = 0
				move_flags = MOVE_JUMP
		else //moving into or out of a null location or another atom other than a turf is a teleport with no move_dir
			move_dir = 0
			move_flags = MOVE_TELEPORT
		glide_size = TILE_WIDTH / max(move_delay,TICK_LAG) * TICK_LAG //set the glide size
		. = ..() //perform the movement
		last_move = time //set the last movement time
		if(.)
			next_move = time+move_delay








proc/get_glide_size(n, dir)
	return (dir & (dir - 1)) ? n + (n >> 1) : n

/*
mob
	appearance_flags = LONG_GLIDE //make diagonal and horizontal moves take the same amount of time
	animate_movement = SLIDE_STEPS
	var
		mtype =1
		tmp/mspeed = 0
		//move_delay = 5   // how many ticks the player must wait between movements
		tmp // these vars are not saved
			move_time = 0    // the earliest time the mob may move


			*/
/*
client
	Move()
		if(mob.mtype==1)
			world << "movetime: [mob.move_time]  movedelay [mob.move_delay]  GLIDE: [mob.glide_size]"
			if(world.time < mob.move_time) // not enough time passed

				return

	        // set the move_time for move_delay ticks from now
			mob.move_time = world.time + mob.move_delay
			//mob.glide_size = get_glide_size(mob.move_delay, mob.dir)
			return ..() // do the default Move() proc and return what it returns

		if(mob.mtype==2)
			world << "movetime: [mob.move_time]  movedelay [mob.move_delay] GLIDE: [mob.glide_size]"
			if(mob.frozen||mob.regen_dead||mob.gravityfieldon||mob.binded||mob.GMLocked||mob.KO||mob.sleeping)
				world << "ACTIVE"
				return 0
			if(mob.mspeed <= 0)
				mob.mspeed = 1
				//mob.glide_size = get_glide_size(mob.move_delay, mob.dir)
				mob.move_time = world.time + mob.move_delay //take out
				..()
				sleep(mob.move_delay)
				mob.mspeed = 0
			else
				return
*/

/*

client/Move()

	if(mob.frozen||mob.regen_dead||mob.gravityfieldon||mob.binded||mob.GMLocked||mob.KO||mob.sleeping)
		return 0
	if(mob.mspeed <= 0)
		mob.mspeed = 1
		..()
		sleep(mob.move_delay)
		mob.mspeed = 0
	else
		return
*/

/*
mob/verb/changedelay()
	set category = "TEST"
	src.move_delay = input("new delay current: [src.move_delay]",src.move_delay) as num
	src << "new delay: [src.move_delay]"





mob/verb/changemoveTYPE()
	set category = "TEST"
	src.mtype = input("move type [src.mtype]",src.mtype) as num
	src << "new mode: [src.mtype]"







mob/verb/changeGlide()
	set category = "TEST"
	src.glide_size = input("glide_size  [src.glide_size]",src.glide_size) as num
	src << "new glide_size: [src.glide_size]"



*/







/*
//get_speed_delay(n) takes an argument speed "n" and returns how long it would take to travel 1 tile at this speed in 10ths of a second
proc/get_speed_delay(n)
	return (world.icon_size * world.tick_lag) / (!n ? 1 : n)

//get_glide_size(n, dir) takes an argument speed "n", and direction "dir", and returns the smoothest possible glide_size setting
proc/get_glide_size(n, dir)
	return (dir & (dir - 1)) ? n + (n >> 1) : n

atom/movable
	var/speedd = 20
	var/tmp/move_time = 0
	var/tmp/transferring = 0

	Move()
		if(!src.loc) return ..()

		if(world.time < src.move_time) return 0

		if(transferring) return 0

		. = ..()

		if(.)
			src.move_time = world.time + get_speed_delay(src.speedd)
			src.glide_size = get_glide_size(src.speedd, src.dir)

		return .

	proc/Transfer(atom/location)
		if(!location) return

		src.transferring = 1

		spawn(get_speed_delay(src.speedd) - world.tick_lag)
			src.x = location.x
			src.y = location.y
			src.z = location.z

			spawn(world.tick_lag)
				src.transferring = 0





mob/robot
	var/tmp/counterr = 0
	var/tmp/ndir = NORTH
	speedd = 2

	New()
		..()
		spawn do_program()

	proc/do_program()
		if(world.time >= move_time)
			if(step(src, ndir))
				counterr++
				if(counterr >= 5)
					counterr = 0
					if(ndir == NORTH) ndir = SOUTH
					else if(ndir == SOUTH) ndir = NORTH

		spawn(world.tick_lag) do_program()

mob/PC
//	icon = '_mob.dmi'

	var/w,a,s,d = 0

	Click()
		var/val = input("What speed?", "Set your speed") as null | num
		if(!val) return
		speedd = val

	Login()
		..()
		winset(client, "w", "parent=macro;name=w;command=keydown+w")
		winset(client, "w+up", "parent=macro;name=w+up;command=keyup+w")

		winset(client, "a", "parent=macro;name=a;command=keydown+a")
		winset(client, "a+up", "parent=macro;name=a+up;command=keyup+a")

		winset(client, "s", "parent=macro;name=s;command=keydown+s")
		winset(client, "s+up", "parent=macro;name=s+up;command=keyup+s")

		winset(client, "d", "parent=macro;name=d;command=keydown+d")
		winset(client, "d+up", "parent=macro;name=d+up;command=keyup+d")


		spawn move_loop()

	verb/set_speed(n as num)
		src.speedd = n

	proc/move_loop()
		if(world.time >= move_time) //should we do anything?
			if(!step(src, (s && (SOUTH || s)) | (w && (NORTH || w)) | (a && (WEST || a)) | (d && (EAST || d)))) //try desired direction
				if(!step(src, (s && (SOUTH || s)) | (w && (NORTH || w)))) //that failed, try north or south
					step(src, (a && (WEST || a)) | (d && (EAST || d))) //that failed, try east or west
		spawn(world.tick_lag) move_loop() //return, and do it again

	verb/keydown(k as text)
		set hidden = 1
		set instant = 1
		if(k == "w") w = 1
		if(k == "a") a = 1
		if(k == "s") s = 1
		if(k == "d") d = 1

	verb/keyup(k as text)
		set hidden = 1
		set instant = 1
		if(k == "w") w = 0
		if(k == "a") a = 0
		if(k == "s") s = 0
		if(k == "d") d = 0

		*/
		/*

world
	icon_size = 32
	fps = 30 //20


#define MOVE_SLIDE 1
#define MOVE_JUMP 2
#define MOVE_TELEPORT 4

#define TILE_WIDTH  32
#define TILE_HEIGHT 32
#define TICK_LAG    0.3
client
	var/tmp
		movekeys = 0
		movedir = 0
		movestart
	verb
		MoveKey(dir as num,state as num)
			set hidden = 1 //hide this verb from all expansion and panels
			set instant = 1 //allow this verb to ignore the one verb per frame rule
			var/okeys = movekeys
			var/odir = turn(dir,180) //get the opposite dir
			if(state) //if this is a keypress
				movekeys |= dir //turn on the direction bit
				movedir |= dir
				if(movekeys&odir) //if the player is holding the opposite direction
					movedir &= ~odir //turn off the opposite bit
			else //if this is a keyrelease
				movekeys &= ~dir //turn off the direction bit
				movedir &= ~dir
				if(movekeys&odir) //if the player is still holding the opposite direction
					movedir |= odir //turn on the opposite bit
			if(movekeys&&!okeys) //was this the first movement
				spawn(0) //delay the movement until all the verbs triggered this frame have been processed
					MoveLoop()

	proc
		MoveLoop()
			set waitfor = 0 //do not prevent the parent procedure from continuing
			if(movestart==null) //only call if we're not currently moving
				var/time = world.time //keep track of the current time
				movestart = time //track the start of the movement
				while(movekeys&&movestart==time) //if keys are still being held and the current movement is the active one
					Move(mob.loc,movedir) //move the current mob
					sleep(TICK_LAG) //sleep for one tick
				movestart = null //end the current movement loop

    //define stubs for the built in functions. These are completely worthless.
	North()
	South()
	East()
	West()
	Southeast()
	Southwest()
	Northwest()
	Northeast()



atom
	movable
		appearance_flags = LONG_GLIDE //diagonal glides are made equal to horizontal and vertical glides in duration
		var
			move_delay = 0
			tmp/next_move = 0
		Move()
			var/time = world.time
			if(time<next_move) return 0 //refuse to move if we are delayed
			glide_size = TILE_WIDTH/max(move_delay,TICK_LAG)*TICK_LAG //smooth the glide size
			. = ..()
			next_move = time+move_delay //set the movement delay

			*/