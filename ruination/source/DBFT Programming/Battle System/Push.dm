//////////////////////////////////////////////////////////////////////////////
// Author: 	Goten84
// Date:	Feb 5, 2007
// Email:	vqholt@gmail.com
//////////////////////////////////////////////////////////////////////////////
// This demo shows you how you can create a technique in a game that will
// push back an opponent a certain amount of tiles. Within that length
// of time the user will have no control over their player. I'm using Naruto
// for this demo since this would probably relate heavly to those great
// fangames (cough, cough)... or maybe those were the only icons I could
// easily get a hold of (cough, cough). =)
//
// Now if there's a better way to do this just let me know... or make a new
// demo. Also, this demo shows you how to move the person based on your
// direction, but doesn't necessarily take into account if you're beside
// the person or not, or if you're the enemy. So, that will be your homework!
// I can't do everything for you guys! Learning means fixing and practicing!
//
// Task to do on your own
//-------------------------------------------------------------
// - Make sure the enemy doesn't go out of bounds
// - Make sure you're beside the enemy when you use the technique
// - Try to flick the icon to use some "nifty" animation
// - Try to have fun!
//////////////////////////////////////////////////////////////////////////////

// Here we have our world

// How about for our mobs we use Saskue and Naruto, that's classic duo right?
mob
	var/tmp/beingpushed = 0



	// This method will control whether or not we can move around.
//	Move()
//		if (canMove)
//			..()



// So, here we just concentrate on defining the push function for our player.
mob

	// Note that in this method we will move the enemy by pixels. That way
	// we don't get a choppy push animation. You can call this method
	// Rasengan or something cool like that (I just call it the PushEnemy function.
	// Use your imagination though!
	// mob/enemy/e is the enemy in question
	// tileOffset is the amount of tiles you want to push the enemy
	// pixelOffset is the amount of pixels you want to move the enemy by to reach
	//             its tile goal.
	proc/PushEnemy(mob/e, tileOffset, pixelOffset)
		var/static/step = 0 			// How far we have moved (not in pixels).
		var/static/pixel_step = 0		// How far we have moved in pixels.
		e.frozen = 1					// We don't want the enemy to move while their being pushed.

		pixel_step += pixelOffset		// Update the amount of pixel movement.

		// Here you should check the tile offset. If we only want to move the player
		// by 1 tile then this is pretty pointless. If we want to move the player
		// more than 1 tile, then we'll have something really interesting going on.
		if(!e)
			return
		if (tileOffset == 1)
			step++
		else if(32 - pixel_step <= 0)
			step++
			pixel_step = 0

		// Here we'll just wait 1/10 of a second before we call the function again. Also,
		// we base the movement of the enemy from our direction.

		spawn(1)
			if(!e)
				return
			var/stoppush=0
			//var/turf/T=locate(/turf)

			for(var/atom/M in oview(1))
				if(M.density && M != src && M != e)
					world << "ONE [M]"
					if(istype(M,/mob)||istype(M,/turf)||istype(M,/obj))
						world << "two [M]"

						if(M in get_step(e,src.dir))
							stoppush = 1
							world << "<B>THREE	[M]"
						/*
						if(src.dir==NORTH&&M.y==e.y+1&&M.x==e.x)

							stoppush = M
							world << "THREE [stoppush] [M]"
						else if(src.dir==SOUTH&&M.y==e.y-1&&M.x==e.x)
							stoppush = M
						else if(src.dir==WEST&&M.x==e.x-1&&M.y==e.y)
							stoppush = M
						else if(src.dir==EAST&&M.x==e.x+1&&M.y==e.y)
							stoppush = M
							*/
			if (step != tileOffset && !stoppush)

				switch (src.dir)
					if (NORTH)
						e.pixel_y += pixelOffset
					if (SOUTH)
						e.pixel_y -= pixelOffset
					if (EAST)
						e.pixel_x += pixelOffset
					if (WEST)
						e.pixel_x -= pixelOffset
				PushEnemy(e, tileOffset, pixelOffset)
			else
				switch (src.dir)
					if (NORTH)
						e.loc = locate(e.loc.x, e.loc.y+step, e.loc.z)
					if (SOUTH)
						e.loc = locate(e.loc.x, e.loc.y-step, e.loc.z)
					if (EAST)
						e.loc = locate(e.loc.x+step, e.loc.y, e.loc.z)
					if (WEST)
						e.loc = locate(e.loc.x-step, e.loc.y, e.loc.z)

				// We want to reset these variables. The pixel_x and pixel_y distort the
				// location of the character and we want to make sure we set them back to 0.
				// Furthermore we want to set step and pixel_step back to 0 since they are
				// static variables.

				e.frozen = 0
				e.pixel_x = 0
				e.pixel_y = 0
				step = 0
				pixel_step = 0

	proc/ThrowMob(mob/e, tileamount, sleeptime, dir)
	//	world << "<b><font color = yellow>ONE"
		//e.frozen = 1					// We don't want the enemy to move while their being pushed.
		src.pushcd = 1
		spawn(65) src.pushcd = 0
		e.beingpushed=1
		e.move_delay = 0
		var/howmanytiles = rand(tileamount,tileamount+2)
		var/i=0
		for(i=0, i<howmanytiles, i++)
			var/brk = 0
		//	world << "<b><font color = yellow>TWO"
			if(brk)
				src << "BREAK"
				break
			//var/brk2=0
		//	world << "e: [e]  dir: [dir] move delay ONE: [e.move_delay]"
			e.frozen = 0
			//step(e,dir)
			//step_away(e,src,5,Speed=0)
			e.beingpushed=0
			walk(e,dir,0,1)
			e.beingpushed=1
		//	world << "<b><font color = yellow>move delay TWO: [e.move_delay]"
	/*		switch (dir)


				if (NORTH)
				//	var/atom/M=locate(/atom) in get_step(src,src.dir)
				//	if(
					for(var/atom/O in locate(e.loc.x, e.loc.y+1, e.loc.z))
						var/turf/t=locate(/turf) in locate(e.loc.x, e.loc.y+1, e.loc.z)
						world << "<font size = 2>t: [t]   tloc: [t.loc]"

						if(istype(O,/turf))
							world << "HARD TURF"
							if(O.density)
								world << "<B>HARD HARD HARD"
						world << "1 [O]"
						if(O.density)
							world << "2 [O]"
							brk2=1
					if(!brk2)
						//e.loc = locate(e.loc.x, e.loc.y+1, e.loc.z)
						step(e,NORTH)
						world << "successful"
					else
						world << "BLOCKED"
				if (SOUTH)
					for(var/atom/O in locate(e.loc.x, e.loc.y-1, e.loc.z))
						world << "1 [O]"
						if(O.density)
							world << "2 [O]"
							brk2=1
					if(!brk2)
					//	e.loc = locate(e.loc.x, e.loc.y-1, e.loc.z)
						world << "successful"
						step(e,SOUTH)
					else
						world << "BLOCKED"
				if (EAST)
					for(var/atom/O in locate(e.loc.x+1, e.loc.y, e.loc.z))
						world << "1 [O]"
						if(O.density)
							world << "2 [O]"
							brk2=1
					if(!brk2)
					//	e.loc = locate(e.loc.x+1, e.loc.y, e.loc.z)
						step(e,EAST)
						world << "successful"
					else
						world << "BLOCKED"
				if (WEST)
					for(var/atom/O in locate(e.loc.x-1, e.loc.y, e.loc.z))
						world << "1 [O]"
						if(O.density)
							world << "2 [O]"
							brk2=1
					if(!brk2)
					//	e.loc = locate(e.loc.x-1, e.loc.y, e.loc.z)
						world << "successful"
						step(e,WEST)
					else
						world << "BLOCKED"
			*/

			sleep(1)
		walk(e,0)
	//	world << "<b><font color = yellow>4"
		e.frozen = 0
	//	world << "move delay 3: [e.move_delay]"
		e.move_delay = 0.6
		e.beingpushed=0

	//for(var/obj/Type/O in get_step()/locate())
// Yea, I know, you can resengan yourself... should be an easy fix right?
mob/proc
	Push()
		// Here we will move the enemy 2 tiles at a rate of 4 pixels per 1/10 seconds.
		//src.PushEnemy(e, 2, 4)
		var/mob/a=locate(/mob) in get_step(src,src.dir)
		//src.PushEnemy(a, 2, 16)
		if(!a)
			return
		if(istype(a,/mob/PC)||istype(a,/mob/Monster)||istype(a,/mob/SPECIAL))
			if(a.KO||a.dead)
				return
			flick("attack",src)
			var/attackpower = src.strength * (src.melee / 100)
		//	world << "attackpower: [attackpower]  TARGET: [a]"
			var/defensepower=round((a.defence * a.durability)/150)
		//	world << "defensepower: [defensepower]	TARGET: [a]"
			var/damage=round((attackpower-defensepower))*0.40
		//	world << "damage ONE: [damage]	TARGET: [a]"
			if(damage < 1)
				damage = 1
		//	world << "damage TWO: [damage]	TARGET: [a]"
			damage= damage+(src.level*15)

			if(istype(a,/mob/PC) && istype(src,/mob/SPECIAL))
				spawn(-1) a.PVPflagged(4)
				spawn(-1) src.PVPflagged(6)
				a.rage += round(rand(5,10))
				if(a.rage >= 100)
					a.rage = 100
				if(a.iting && a.pvpflagged)
					a.ITstop = 1
					damage *= 2
					src << output("<font size=1><b><font color=yellow>[a]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

			if(src.spar && a.spar)
				var/mindmg = round(a.powerlevel_max*0.05)
				damage = mindmg

		//	world << "damage THREE: [damage]	TARGET: [a]"
			a.powerlevel-=damage
			a << output("<font color = red><b>You are thrown back for <font color = yellow>[applycommas(damage)] damage<font color = red> by [src]!","default.output2")
			src << output("<font color = red><b>You pushed [a] back for <font color = yellow>[applycommas(damage)] damage<font color = red>!","default.output2")
			if(src.lethalon)
				src.AutoFinish(a)
			else
				//a.KO()
				KO(a)
		//	var/randdist = rand(4,4)
		//	var/randspd = rand(49,60) // 49 is good
		//	world << "randdist [randdist]  randspd [randspd]"
		//	world << "<b>RIGHT BEFORE"
			if(a)
		//		world << "<b>RIGHT AFTER"
				src.ThrowMob(a, 1, 10, src.dir)




//mob/verb/Throw()
//	src.Push()
mob/var/tmp/pushcd=0
obj/Technique/Push
	verb
		Push()
			set category = "Combat"
//			if(usr.ki.val>=usr.Ki.max*0.1)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Push")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.pushcd)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are busy"
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "You are in a Safe Zone!"
					return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(usr.icon_state == "flight"||usr.buku == 1)
				usr<<"You can't use this technique while flying"
				return
			usr.Push()
/*
mob/verb/Throw2()
	var/mob/a=locate(/mob) in get_step(src,src.dir)
	//src.PushEnemy(a, 2, 16)
	if(!a)
		return
	src.Thrown(a)
	*/
