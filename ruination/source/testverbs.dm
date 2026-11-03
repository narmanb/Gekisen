mob/verb/getzsword()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	src.z_sword = 1

mob/verb/ticklaginfo()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	src << "world tick lag: [world.tick_lag] client tick lag: [client.tick_lag]"
	src << "world fps: [world.fps] client fps: [client.fps]"
	src << "glide: [client.glide_size]"
	src << "client fps: [client.fps]"
mob/verb/ticklagset()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	world.tick_lag = input("Set world Tick Lag","World Tick Lag",world.tick_lag) as num
	client.tick_lag = input("Set client Tick Lag","client Tick Lag",client.tick_lag) as num
	client.glide_size = input("Set client glide size","client glide size",client.glide_size) as num
	src.ticklaginfo()
mob/verb/setclientfps()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	client.fps = input("setclient fps","client fps",client.fps) as num
	src.ticklaginfo()

mob/verb/SETFPS()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	world.fps = input("Set world fps","World FPS",world.fps) as num
	src.ticklaginfo()

mob/verb/setglide()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	client.glide_size = input("Set client glide size","client glide size",client.glide_size) as num
	var newglide = client.glide_size
	for(var/mob/M in world)
		M.glide_size = newglide
	src.ticklaginfo()




mob/verb/changefps()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	src << "current fps: [world.fps]  tick lag = [world.tick_lag]  "
	switch(input("Set FPS settings (default 30)","Set FPS") in list("10 FPS","20 FPS","30 FPS","40 FPS","CANCEL"))
		if("10 FPS")
			world.fps = 10
			world.tick_lag = 1
		//	global.move_delay = 0
		if("20 FPS")
			world.fps = 20
			world.tick_lag = 0.5
			//global.move_delay = 0.75
			//global.move_delay = 1
		if("30 FPS")
			world.fps = 30
			world.tick_lag = 0.3
		if("40 FPS")
			world.fps = 40
			world.tick_lag = 0.25
		//	global.move_delay = 1
	world << "<font size = 1><b>World FPS set to [world.fps]"
	src << "tick lag: [world.tick_lag]"
	src << " "
	src.ticklaginfo()

var/beamlag=0
var/beamspeed=1

mob/verb
	changeprojectilespeed()
		set category = "TEST"
		set hidden = 1
		if(src.key != "Narmanb")
			return

		global.beamlag = input("Enter beamlag:","beamlag",global.beamlag) as num
		global.beamspeed = input("Enter beamspeed:","PNCDELAY",global.beamspeed) as num

	CHANGEMOVEDELAY()
		set category = "TEST"
		set hidden = 1
		src.move_delay = input("Enter movedelay:","movedelay",src.move_delay) as num

	CHANGEGLOBALMOVEDELAY()
		set category = "TEST"
		set hidden = 1
		if(src.key != "Narmanb")
			return
		//src << "move delay: [global.move_delay]"
	//	global.move_delay = input("Enter movedelay:","movedelay",global.move_delay) as num
	//	src << "move delay: [global.move_delay]"

	ANIMATEMOVEMENT()
		set category = "TEST"
		set hidden = 1
		if(src.key != "Narmanb")
			return
		src << "animatemovement: [animate_movement]"
		switch(input("Set animate movement","Animate Movement") in list("NO STEPS","FORWARD STEPS","SLIDE STEPS","CANCEL"))

			if("NO STEPS")
				animate_movement = 0
			if("FORWARD STEPS")
				animate_movement = 1
			if("SLIDE STEPS")
				animate_movement = 2

		src << "animatemovement: [animate_movement]"
mob/verb/objectloop()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	var/list/types = new
	for(var/obj/O)
		types[O.type] = (types[O.type]||0) + 1
	src << "Obj counts by type:"
	for(var/t in types)
		src << "[t]: [types[t]]"


mob/verb/mobloop()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	var/list/types = new
	for(var/mob/O)
		types[O.type] = (types[O.type]||0) + 1
	src << "mob counts by type:"
	for(var/t in types)
		src << "[t]: [types[t]]"

mob/verb/debugmenu()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	switch(input("Select Option","Debug Menu") in list("changefps","ticklaginfo","ticklagset","setclientfps","SETFPS","CHANGEGLOBALMOVEDELAY","setglide","changeprojectilespeed","ANIMATEMOVEMENT","objectloop","mobloop","Cancel"))
		if("changefps")
			usr.changefps()
		if("ticklaginfo")
			usr.ticklaginfo()
		if("ticklagset")
			usr.ticklagset()
		if("setclientfps")
			usr.setclientfps()
		if("SETFPS")
			usr.SETFPS()
		if("CHANGEGLOBALMOVEDELAY")
			usr.CHANGEGLOBALMOVEDELAY()
		if("setglide")
			usr.setglide()
		if("changeprojectilespeed")
			usr.changeprojectilespeed()
		if("ANIMATEMOVEMENT")
			usr.ANIMATEMOVEMENT()
		if("objectloop")
			usr.objectloop()
		if("mobloop")
			usr.mobloop()

/*

mob/verb/statsup() //test verb
	src.powerlevel += 10000000000
	src.powerlevel_max = src.powerlevel
	src.ki = src.powerlevel*2
	src.ki_max = src.ki
	src.level+=50000
	src.ki_cast = 100
	src.ki_use = 100
	src.zenni += 1000000000

mob/verb/giveexptoself()
	var/howmuchexp = input("give urself exp","give exp") as num
	usr.exp += howmuchexp
	usr << "exp + [howmuchexp]"
	src.Level_Up()




mob/verb/changeracetestgeneric()
	set category = "TEST"
	set hidden = 1
	if(src.key != "Narmanb")
		return
	src << "Current race: [src.race]"
	src.race = input("inputnewrace","Race",src.race) as text
	src << "New race: [src.race]"
	src.learn_generic1=0
	*/





/*
mob/verb/deleteitemdrops()

	for(var/obj/Equipment/M in world)
		if(isturf(M.loc))
			usr << "DELETED [M]"
			del M
*/
/*
mob
	verb
		Burst_Rush()
			set category = "Techniques"
			if(usr.frozen)
				return
			if(usr.burst_delay)
				usr << "You must wait to use this again!"
				return

			if(usr.doing)
				usr << "You are already doing something!"
				return

			if(usr.buku)
				return

			if(usr.dead)
				return

			if(usr.ki_lock)
				usr << "Cannot use this Technique at his time"
				return

			if(!usr.pk)
				usr << "You are not a Combatant!"
				return
			for(var/turf/Floors/Safe_Zone/S in view(12))
				if(S in view(10))
					usr << "They are in a Safe Zone!"
					return
			var/targ
			for(var/mob/M in oview(10))
				if(targ) continue
				if(M.x == usr.x || M.y == usr.y)
					targ = M
					usr << "TARGET ACQUIRED: [targ]"

			if(!targ)
				usr << "you hab no target"
				return
			if(usr.burst_delay)
				usr << "You must wait to use this again!"
				return
			usr.burst_delay = 1
			spawn(120)usr.burst_delay = 0
			usr.attackCD = 1
			spawn(6) usr.attackCD = 0
			view(12) << "\white [src]: So you think you can run??"
			sleep(20)
			view(12) << "\white [src]: I DONT THINK SO!!!!"
		//	if(M.x != usr.x || M.y != usr.y)
		//		usr << "TARGET MOVED"
		//		return
			if(!targ)
				usr << "NO TARG"
				return
		//	targ.frozen=1
			usr.doing=1
			var/mob/M = targ
		//	targ.doing=1
			usr.ki-=10000000
			flick("IT",usr)
			//if(!M in view(12))
			//	return
			if(targ.x&&targ.y&&targ.z)
				usr.loc=locate(targ.x,targ.y-1,targ.z)
				usr.dir=NORTH
			/*
			var/attackpower=round(((usr.strength * usr.melee)/100) + (usr.powerlevel / 100))
			var/defensepower=round(((M.defence * M.durability)/100) + (M.powerlevel / 100))
			var/A=round(attackpower-defensepower)

			if(A>0)
				M.powerlevel-=A
				*/
			view() << "<font color=red>[usr] punches [targ] in the face!</font>"

			sleep(5)
			flick("IT",usr)
			if(targ.x&&targ.y&&targ.z)
				usr.loc=locate(targ.x-1,targ.y,targ.z)
				usr.dir=EAST
	//		A = round(attackpower-defensepower)
	//		if(A>0)
	//			M.powerlevel-=A
			view() << "<font color=red>[usr] stops [targ] from fleeing!</font>"

		//	M.zanz_lock=1
		//	M.it_lock=1
		//	spawn(100) M.zanz_lock=0
		//	spawn(120) M.it_lock=0
			sleep(3)
			usr.doing=0
			usr.doing=0
			if(istype(targ,/mob/PC))
				if(targ.dead)
					targ.frozen=0
					usr.doing=0
					targ.doing=0
					usr.doing=0
					return 0
				targ.frozen=0
				targ.doing=0

				*/


/*
mob
	verb
		Dash()
//			if(src.ki.val>=src.Ki.max*0.1)
			if(!dashing)
				dashing=1
				var/turf/t
				switch(src.dir)
					if(SOUTH)
						t=locate(src.x,src.y-2,src.z)
					if(NORTH)
						t=locate(src.x,src.y+2,src.z)
					if(WEST)
						t=locate(src.x-2,src.y,src.z)
					if(EAST)
						t=locate(src.x+2,src.y,src.z)
				sleep(1)
				if(t)
					if(t.density==0&&!locate(/mob) in t)
						flick("IT",src)
					//	PlaySFX('Evasion1.ogg',7)
					//	LKp(src.Ki.max*0.1)
						var/obj/a=new
						a.appearance=src.appearance
						a.loc=src.loc
						a.dir=src.dir
						src.StepSet(a)
						//animate(a,alpha=0,time=10)
						spawn(11)del a
						src.loc=t
				dashing=0

	proc/StepSet(var/atom/movable/m)
		m.x=src.y
		m.y=src.y

*/

				/*
mob/var/timetowait=10
mob/verb/changewait()
	usr << "[usr.timetowait]"
	usr.timetowait = input("new timetowait number") as num
	usr << "[usr.timetowait]"

*/

//Title: Get Closest Objects
//Credit to: DivineOpeanut
//Contributed by: DivineOpeanut

/*
A simple but flexible proc for finding the closest objects to a given center.
*/


proc
    //  ---------------------------------------------------------------------------------
    //  Args:
    //      center:         an object on the map
    //      oftype:         the object type searched for (/atom/movable by default)
    //      group:          only objects in the group[] will be searched (world.contents by default)
    //      num_return:     the amount of objects to return (1 by default)
    //      dist_method:    the proc used to measure distance. if no proc is specified,
    //                          get_dist() will be used.
    //
    //  Returns:
    //      A list of objects (or object) closest to [center].
    //  ---------------------------------------------------------------------------------

	get_closest_objects(center, oftype=/atom/movable, list/group=world.contents, num_return=1, dist_method)
		var/closest_objects[] = list()

		for (var/cycle in 1 to ((group.len < num_return) ? group.len : num_return))
			//  world << "Cycle [1]:"
			var/closest_object
			var/closest_dist

			for (var/object in group)
				if (oftype && !istype(object,oftype))   continue
				if (object in closest_objects)          continue
				var/dist_to =   (dist_method ? call(dist_method)(center,object) : get_dist(center,object))
				world << "[object] found in [object:x], [object:y], [object:z] with distance [dist_to]."
				if(!closest_object || dist_to < closest_dist)
					closest_object  =   object
					closest_dist    =   dist_to
					world << "[object] is now closest_object."

			if(!closest_object)
				world << "No closest_object found. Breaking loop and returning."
				break

			closest_objects +=  closest_object
			world << "Added closest_object to closest_objects. closest_objects is now of length [closest_objects.len]."

		return  closest_objects

mob/verb/FINDDBS()
	set hidden = 1

	var/center  =   usr
	var/oftype  =   /obj/Earth_Dragonballs

	// This is just one of the many things you can do with the "group" arg. If this variable is set
	// to 1, 5, or 8, objects that are further than that number of tiles from [center] will not be \
	// searched.
	var/group[] =   input(usr,"What maximum range?") as anything in list("1","5","8","any range")
	switch(group)
		if("1")  group   =   orange(1,usr)
		if("5")  group   =   orange(5,usr)
		if("8")  group   =   orange(8,usr)
		if("any range") group   =   world.contents - center

	var/num_return  =   input(usr,"How many objects at most should be marked?") as num


	var/objects[] = get_closest_objects(center,oftype,group,num_return)
	for (var/obj/mark in objects)
		usr<< "object found at [mark.x], [mark.y], [mark.z]"

/*
client/verb/Test()
	src << Do_It()

proc/Do_It()
	set waitfor = FALSE

	. = "hi"    // Set the return value
	sleep(0) // sleep() initiates a "wait", but Do_It has a FALSE waitfor!

	world << "bye"*/
mob
	verb
		DeleteScoreboard()
			set hidden = 1
			if(usr.key != "Narmanb")
				return
			switch(alert("Are you sure you want to delete the scoreboard?","","Yes","No"))
				if("Yes")
					var/list/file_list = flist("world save files/system/scoreboard/")
					file_list.Add("Cancel")
					var/file_chosen=input("Which save file would you like to delete??","Delete Save File") in file_list
					if(file_chosen == "Cancel")
						return
					else
						var/copied = copytext("[file_chosen]",1,-11)
						for(var/mob/M in player)
							if(M.client&&M.client.ckey==copied)
								del( M)
						fdel("world save files/system/scoreboard/[file_chosen]")
						usr<<"[file_chosen] scoreboard file deleted"
						AdminMessage("[usr] has deleted [file_chosen] scoreboard file.")
						return

/*
var/mobdelay=2
mob/verb
	CHANGEMOBMOVEDELAY()
		set category = "TEST"
		if(src.key != "Narmanb")
			return
		src << "mobdelay: [global.mobdelay]"
		global.mobdelay = input("Enter mobdelay:","mobdelay",global.mobdelay) as num
		src << "mobdelay: [global.mobdelay]"
*/

//Title: Human-Readable Time
//Credit to: Foomer
//Contributed by: Jtgibson

/*
This is just for anyone who might want to use it.  Could be useful in some text-
based games where everything is better when it's in flashy word-written format
and uses proper grammar.  So, what this does is it accepts a single number of
seconds as an argument and outputs that number in days, hours, minutes and
seconds. As an example: num2time(50332) would return this: "13 hours, 58 minutes
and 52 seconds."  If anyone wants it, you're free to use it in whatever you want.

(Special thanks to Jtgibson, since I butchered part of his ThingyList proc for
this.)
  --Foomer

(Thingylist's current incarnation is found under the name
"Sentence-Formatted List Output Proc" on the Snippets Database. --Jtgibson.)
*/


proc/num2time(time, list/list=list())
	var/seconds = time % 60
	var/minutes = round(time/60) % 60
	var/hours = round(time/3600) % 24
	var/days = round(time/86400)

	if(days) list += "[days] day\s"
	if(hours) list += "[hours] hour\s"
	if(minutes) list += "[minutes] minute\s"
	if(seconds) list += "[seconds] second\s"

	if(list.len > 2)
		var/message
		for(var/cycle = 1, cycle < list.len, cycle++)
			message += "[list[cycle]], "
		return "[message], and [list[list.len]]"
	else if(list.len == 2) return "[list[1]] and [list[2]]"
	else if(list.len == 1) return "[list[1]]"
	else return


///*
//Testing code/sample implementation:


/*
mob/verb/testdisc()
	usr << "<A HREF=https://discord.gg/xUNsbjt>Join Ruinations Discord!</A>"
	*/
/*

mob/verb/addstat()
	usr << "added 100mil each stat"
	usr.powerlevel_max += 100000000
	usr.ki_max += 100000000
	usr.kidefense_max += 100000000
	usr.strength_max += 100000000
	usr.defence_max += 100000000

mob/verb/setstats()
	usr << "stats set to 2bil"

	usr.powerlevel_max = 2000000000
	usr.ki_max = 2000000000
	usr.kidefense_max = 2000000000
	usr.strength_max = 2000000000
	usr.defence_max = 2000000000


*/
var
	list
		GC_Repop=new/list
		GC_Loc=new/list



mob/verb/GarbageCollection()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	var/count
	usr << "FAST Garbage Collection started"
//	AdminMessage("[usr]([usr.key]) manually Collec")
	for(var/mob/Monster/M)
		if(M.name == "GC Mob")
			count++
			M.name = "Restored Mob"
			GC_Repop.Add(src.type)
			GC_Loc.Add(src.initialloc)
		sleep(1)
	usr << "<b>[count] mobs collected for GC</b>"
	sleep(2)
	for(var/i=1 to GC_Repop.len)
		var/misc=GC_Repop[i]
		new misc(GC_Loc[i])
	usr << "<b>mobs restored</b>"
	sleep(2)
	GC_Repop = null
	GC_Loc = null
	GC_Repop = new/list
	GC_Loc = new/list

mob/verb/GC()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	var/count
	usr << "FAST Garbage Collection started"
//	AdminMessage("[usr]([usr.key]) manually Collec")
	for(var/mob/Monster/M)
		if(M.name == "GC Mob")
			count++
			M.name = "Restored Mob"
			GC_Repop.Add(src.type)
			GC_Loc.Add(src.initialloc)
	usr << "<b>[count] mobs collected for GC</b>"
	sleep(2)
	for(var/i=1 to GC_Repop.len)
		var/misc=GC_Repop[i]
		new misc(GC_Loc[i])
	usr << "<b>mobs restored</b>"
	sleep(2)
	GC_Repop = null
	GC_Loc = null
	GC_Repop = new/list
	GC_Loc = new/list

mob/verb/CheckGC()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	var/count
	usr << "Checking GC"
//	AdminMessage("[usr]([usr.key]) manually Collec")
	for(var/mob/Monster/M)
		if(M.name == "GC Mob")
			count++
	usr << "<b>[count] mobs waiting to be GC</b>"





/*
mob
	verb
		PowerUp2()
			if(usr.doing == 1)
				usr << "You are already doing something!"
				return

			if(usr.powered == 1)
				usr << "There is no reason to power up!"
				return

			if(usr.buku == 1)
				usr << "You cannot Power Up whilst flying!"
				return

			if(usr.KO == 1)
				return

			if(usr.Oozaru == 1)
				usr << "You cannot Power Up whilst in Oozaru"
				return

			if(usr.power_delay == 1)
				usr << "You must wait a moment before using Power Up again!"
				return

			if(usr.staminaleft > usr.staminaleft_max)
				usr << "You are too tired to power up!"
				return
			if(usr.powering)
				usr.icon_state = ""
				usr << "You stop powering up"
				usr.frozen = 0
				usr.doing = 0
				usr.buku_lock=0
				usr.powering = 0
				return

			for(var/mob/M in view(8))
				if(usr.powerlevel >= (M.powerlevel * 10) && !M.isgravmachine)

					var/FallDir = get_dir(usr,M)
					usr.dir = FallDir
					step(M,FallDir)
					switch(FallDir)
						if(NORTH)M.dir = SOUTH
						if(NORTHWEST)M.dir = SOUTHEAST
						if(WEST)M.dir = EAST
						if(SOUTHWEST)M.dir = NORTHEAST
						if(SOUTH)M.dir = NORTH
						if(SOUTHEAST)M.dir = NORTHWEST
						if(EAST)M.dir = WEST
						if(NORTHEAST)M.dir = SOUTHWEST

			//usr.Powering_Up()

			usr.power_delay = 1
			usr.frozen = 1
			usr.powering = 1
			usr.doing = 1
			usr.buku_lock = 1
			usr.icon_state = "enrage"
			usr << "You begin to focus your power.."
			usr << "Power  up 1"
			if(usr.powerlevel >= 1000000 && usr.powerlevel <= 10000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,3))
			sleep(15)
			usr.power_delay = 0
			sleep(20)
			if(usr.powerlevel >= 100000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,5))
			sleep(20)
			if(usr.powerlevel >= 500000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,7))
			usr << "Power  up 2"
			//while(usr.powering && usr.powerlevel < ((usr.powerlevel_max*usr.ki_control)/100) && usr.ki < ((usr.ki_max*usr.ki_control)/100))
			world << "[applycommas(((usr.powerlevel_max*usr.ki_control)/100))]"
			//while(usr.powering && usr.powerlevel < usr.powerlevel_max && usr.ki < usr.ki_max)

			while(usr.powering)
				var/plto = ((usr.powerlevel_max*usr.ki_control)/100)
				var/kito = ((usr.ki_max*ki_control)/100)

				//	usr << "You are completely powered up"
				var/plregain
				var/kiregain
				plregain = round(usr.powerlevel_max/rand(10,18))
				kiregain = round(usr.ki_max/rand(8,14))
				usr<< "<font color=blue><i>You gain [applycommas(plregain)] powerlevel."
			//	oview(20)<<output("<I><font color=blue>You sense a powerlevel rise in the distance.","infoPane.infoOutput")
				//KI USAGE HERE
				if(usr.powerlevel < plto)
					usr.powerlevel+=plregain

				if(usr.ki < kito)
					usr.ki+=kiregain
				//if(usr.powerlevel >= ((usr.powerlevel_max*usr.ki_control)/100) && usr.ki >= ((usr.ki_max*usr.ki_control)/100))
				//if(usr.powerlevel>=usr.maxpowerlevel && )
				if(usr.powerlevel >= plto && usr.ki >= kito)
					usr<< "<font color=blue><B>You are completely powered up."
					usr.powering=0
					usr.powerlevel=plto
					usr.ki=kito
					usr.kidefense=((usr.kidefense_max*ki_control)/100)
					usr.strength=((usr.strength_max*ki_control)/100)
					usr.defence=((usr.defence_max*ki_control)/100)
					usr.frozen = 0
					usr.doing = 0
					usr.buku_lock=0

					usr.icon_state = ""
				sleep(rand(14,32))



mob
	verb
		PowerUp3()
			if(usr.powering)
				usr.icon_state = ""
				usr << "You stop powering up"
				usr.frozen = 0
				usr.doing = 0
				usr.buku_lock=0
				usr.powering = 0
				var/plto = ((usr.powerlevel_max*usr.ki_control)/100)
				var/kito = ((usr.ki_max*ki_control)/100)
				if(usr.powerlevel > plto || usr.ki > kito)
					spawn(20) usr.Slowly_PD()
				return
			if(usr.doing == 1)
				usr << "You are already doing something!"
				return

		//	if(usr.powered == 1)
		//		usr << "There is no reason to power up!"
		//		return

			if(usr.buku == 1)
				usr << "You cannot Power Up whilst flying!"
				return

			if(usr.KO == 1)
				return

			if(usr.Oozaru == 1)
				usr << "You cannot Power Up whilst in Oozaru"
				return

			if(usr.power_delay == 1)
				usr << "You must wait a moment before using Power Up again!"
				return

			if(usr.staminaleft >= usr.staminaleft_max)
				usr << "You are too tired to power up!"
				return


			for(var/mob/M in view(8))
				if(usr.powerlevel >= (M.powerlevel * 10) && !M.isgravmachine)

					var/FallDir = get_dir(usr,M)
					usr.dir = FallDir
					step(M,FallDir)
					switch(FallDir)
						if(NORTH)M.dir = SOUTH
						if(NORTHWEST)M.dir = SOUTHEAST
						if(WEST)M.dir = EAST
						if(SOUTHWEST)M.dir = NORTHEAST
						if(SOUTH)M.dir = NORTH
						if(SOUTHEAST)M.dir = NORTHWEST
						if(EAST)M.dir = WEST
						if(NORTHEAST)M.dir = SOUTHWEST

			//usr.Powering_Up()
			usr.Put_Aura()
			usr.overlays += 'Power Elec.dmi'
			usr.aura_on = 1
			usr.power_delay = 1
			usr.frozen = 1
			usr.powering = 1
			usr.doing = 1
			usr.buku_lock = 1
			usr.icon_state = "enrage"
			usr << "You begin to focus your power.."
			usr << "Power  up 1"
			if(usr.powerlevel >= 1000000 && usr.powerlevel <= 10000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,3))
			sleep(15)
			usr.power_delay = 0
			sleep(20)
			if(usr.powerlevel >= 100000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,5))
			sleep(20)
			if(usr.powerlevel >= 500000000)
				usr.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(usr.loc,1,7))
			usr << "Power  up 2"
			//while(usr.powering && usr.powerlevel < ((usr.powerlevel_max*usr.ki_control)/100) && usr.ki < ((usr.ki_max*usr.ki_control)/100))
			world << "[applycommas(((usr.powerlevel_max*usr.ki_control)/100))]"
			//while(usr.powering && usr.powerlevel < usr.powerlevel_max && usr.ki < usr.ki_max)
			while(usr.powering && usr.staminaleft < usr.staminaleft_max)

				var/plto = ((usr.powerlevel_max*usr.ki_control)/100)
				var/kito = ((usr.ki_max*ki_control)/100)

				//	usr << "You are completely powered up"
				var/plregain
				var/kiregain
				plregain = round(usr.powerlevel_max/rand(10,18))
				kiregain = round(usr.ki_max/rand(8,14))
				usr<< "<font color=blue><i>You gain [applycommas(plregain)] powerlevel."
			//	oview(20)<<output("<I><font color=blue>You sense a powerlevel rise in the distance.","infoPane.infoOutput")
				//KI USAGE HERE
				if(usr.powerlevel < plto*2)
					usr.powerlevel+=plregain

				if(usr.ki < kito*2)
					usr.ki+=kiregain
				//if(usr.powerlevel >= ((usr.powerlevel_max*usr.ki_control)/100) && usr.ki >= ((usr.ki_max*usr.ki_control)/100))
				//if(usr.powerlevel>=usr.maxpowerlevel && )
				if(usr.powerlevel >= plto*2 && usr.ki >= kito*2)
					usr<< "<font color=blue><B>You are completely powered up."
					usr.powering=0
					usr.powerlevel=plto*2
					usr.ki=kito*2
					usr.kidefense=((usr.kidefense_max*ki_control)/100)*2
					usr.strength=((usr.strength_max*ki_control)/100)*2
					usr.defence=((usr.defence_max*ki_control)/100)*2
					usr.frozen = 0
					usr.doing = 0
					usr.buku_lock=0
					spawn(20) usr.Slowly_PD()
					usr.icon_state = ""
				sleep(rand(14,32))



	proc
		Slowly_PD()
			world << "<font color = red>Slow Power Down<b>start"
			if(src.powering == 1)
				return
			world << "<font color = red>Slow Power Down<b>start2"
//			if(powered == 0)
//				return
			world << "<font color = red>Slow Power Down<b>start3"
		//	if(usr.inverted == 0 || usr.transformed == 0)

			if(src.powerlevel <= ((src.ki_control * src.powerlevel_max)/100) && src.ki <= ((src.ki_control * src.ki_max)/100))
				world << "<font color = red>Slow Power Down<b>ONE"
				src.PD_Check()
				return
			else
				world << "<font color = red>Slow Power Down<b>TWO"
				if(src.powerlevel >= ((src.ki_control * src.powerlevel_max)/100))
					src.powerlevel -= round(src.powerlevel_max / 40)

				if(src.ki >= ((src.ki_control * src.ki_max)/100))
					src.ki -= round(src.ki_max/40)

				if(src.kidefense >= ((src.ki_control * src.kidefense_max)/100))
					src.kidefense -= round(src.kidefense_max/40)

				if(src.strength >= ((src.ki_control * src.strength_max)/100))
					src.strength -= round(src.strength_max/40)

				if(src.defence >= ((src.ki_control * src.defence_max)/100))
					src.defence -= round(src.defence_max/40)

				//if(src.speed >= ((src.ki_control * src.speed_max)/100))
				//	src.speed -= round(src.speed_max/40)

				spawn(15) src.Slowly_PD()


		PD_Check()

			world << "<font color = yellow>Power Down Check<b>ONE"
			if(src.powerlevel <= ((src.powerlevel_max*src.ki_control)/100) && src.ki <= ((src.ki_max*src.ki_control)/100))
				world << "<font color = yellow>Power Down Check<b>TWO"
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays -= 'Elec Blue Small.dmi'
				src.underlays -= src.underlays
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Kaio Aura.dmi'
				src.aura_on = 0
				src.powered = 0
				src.powerlevel = round((src.powerlevel_max*src.ki_control)/100)
				src.ki = round((src.ki_max*src.ki_control)/100)
				src.kidefense = round((src.kidefense_max*src.ki_control)/100)
				src.strength = round((src.strength_max*src.ki_control)/100)
				src.defence = round((src.defence_max*src.ki_control)/100)
				//src.speed = round((src.speed_max*src.ki_control)/100)
				src << "<font color=blue>You are now at your base power"
				src.BuffReapply()
				return


mob/verb/COSTCHECK()
	var/num1 = input("Input first number",50000000) as num
	var/num2 = input("Input second number",10000000) as num
	usr << "num1+(num2*usr.kiuse)"
	var/cost = num1+(num2*usr.kiuse)
	usr << "<b>Cost: [applycommas(cost)]"
suffix = "(Worn)"
oshown=1
	*/
/*

obj/Equipment/var/oshown=1
obj/Equipment/verb/RemoveIcon(obj/Equipment/o in usr.contents)
//mob/PC/verb/Toggle_Icon(obj/Equipment/o in usr.contents)
	if(o.suffix == "(Worn)")
		if(o.oshown)
			o.oshown = 0

			world << "usr ([usr] src [src] 2 [src.icon]"
			usr.overlays -= src.icon
		else
			world << "USR PUTS BACK ON"
			usr.overlays += src.icon
			o.owshown = 1
	else
		usr << "You are not wearing this piece of equipment"
		*/
obj/Equipment/var/oshown=1
/obj/verb/RemoveI(obj/A as obj in usr)
///obj/Equipment/verb/RemoveI(obj/A as obj in usr)
	set name = "Remove1"
//	set category = "Other"

	set src in oview(1)
	set category = null

	set hidden = 1
	var/tmp/used=0

	if(used==0)
		if(A)	//Derp derp implied versus explicit src
			src = A

		if (!usr)
			return
		if(istype(src, /obj/Equipment))

			if(src.suffix == "(Worn)")
				if(src:oshown)
					src:oshown = 0
					usr.overlays -= src.icon
				else
					usr.overlays += src.icon
					src:oshown = 1
	else
		usr << "You are not wearing this piece of equipment"

		used=1
		spawn(15) used=0

	return
/*
/atom/verb/RemoveV(atom/A as obj in usr)
///obj/Equipment/verb/RemoveI(obj/A as obj in usr)
	set name = "Show/Hide Icon"
//	set category = "Other"

//	set src in usr
	set category = null

//	set hidden = 1
	var/tmp/used=0

	if(used==0)
		if(A)	//Derp derp implied versus explicit src
			src = A

		if (!usr)
			return
		if(istype(src, /obj/Equipment))
			if(src.suffix == "(Worn)")
				switch(alert("Show or Hide [src]?",,"Show","Hide","Cancel"))
					if("Show")
						usr.overlays += src.icon
					if("Hide")
						usr.overlays -= src.icon
						usr.overlays -= src.icon
						usr.overlays -= src.icon
						usr.overlays -= src.icon
		/*
			if(src.suffix == "(Worn)")
				if(src:oshown)
					src:oshown = 0
					usr.overlays -= src.icon
				else
					usr.overlays += src.icon
					src:oshown = 1
					*/
	else
		usr << "You are not wearing this piece of equipment"

		used=1
		spawn(15) used=0

	return
*/
obj
	Equipment
		verb
			ShowRemove()
				set category = null
				set name = "Show/Hide Icon"
				//usr << "[src.name]"
				if(istype(src, /obj/Equipment))
					if(src.suffix == "(Worn)")
						switch(alert("Show or Hide [src]?",,"Show","Hide","Cancel"))
							if("Show")
								usr.overlays += src.icon
							if("Hide")
								usr.overlays -= src.icon
								usr.overlays -= src.icon
								usr.overlays -= src.icon
								usr.overlays -= src.icon
					else
						usr << "You are not wearing this piece of equipment"






/*

/*
// _interface.dm
// created:          24/3/2014
// last modified by: Valekor
// description: players like creating (extensive) descriptions of their characters. These can be look at using the 'Examine' verb
// but having entire walls of text be displayed in the same window as roleplay takes place would cause extensive amounts of clutter.
// as such, there are a few skin instances created to cater to these needs:

// win_playerDsc  - The window which will be opened to display the profile written. Either a simple bit of text or a HTML-styled page, this can be up to the player.
// brow_playerDsc - The actual brower to which the player description will be sent.
// lbl_playerDsc  - Top of the page, a label displaying the character name, perhaps a title of choice.

// win_playerEdit - The window for editing player description.
// inp_playerEdit - A multi-line text input area.
*/

mob/player/verb/edit_profile()
	set name = "Edit Character Profile"
	set category = "Other"

	var/tmp/char_desc = input(src,"Character Description","[src]",src.desc) as message
	src.desc = char_desc
	src << "Your character description has been updated."


/atom/verb/examine(atom/A as mob|obj|turf in view(15,usr))
	set name = "Examine"
	set category = "Other"
	var/tmp/used=0

	if(used==0)
		if(A)	//Derp derp implied versus explicit src
			src = A

		if (!usr)
			return

		if(ismob(usr) && get_dist(usr,src)>15)
			usr << "That's too far away to examine."
			return

		var/icon/I = src.getIconImage()
		usr << "This is \icon[I] \an [src.name]."
		if(A.Serial)
			usr << "It seems to have a serial number of [A.Serial]."
		if(src.desc)
			if(istype(src, /mob/player)) // if they're a player, load description window
				winshow(usr, "win_playerDsc")
				usr << browse(src.desc, "window=brow_playerDsc")
			else
				usr << src.desc
				if(isobj(src))
					usr.Display_Magic(src)

		used=1
		spawn(15) used=0

	return

*/

/*
mob/verb/addTenMilpl()
	usr.powerlevel_max += 10000000
	usr << "<b>added"
	usr << "trans0pl [applycommas(usr.transOpl)]"
	usr << "trans_pl_gain [applycommas(usr.trans_pl_gain)]"

mob/verb/SETtoTenMIL()
	usr.powerlevel_max = 10000000
	usr << "<b>set"
	usr << "trans0pl [applycommas(usr.transOpl)]"
	usr << "trans_pl_gain [applycommas(usr.trans_pl_gain)]"

*/
/*
mob
	verb
		BigBeamAttack()
			var/trg
			var/mob/T=locate(/mob) in get_step(usr,usr.dir)
			if(T)
				trg = T
			if(usr.chosentarget)
				if(!T) spawn(-1) usr.FaceTarget()
			var/obj/blasts/BigBeamAttack/M=new/obj/blasts/BigBeamAttack(get_step(usr,usr.dir),usr)
			if(prob(usr.ki_cast/4))
				M.critblast=1
			if(trg)
				M.dmg(trg,usr,M)
				return
			M.Fire2()


		BigBeamAttack2()
			var/trg
			var/mob/T=locate(/mob) in get_step(usr,usr.dir)
			if(T)
				trg = T
			if(usr.chosentarget)
				if(!T) spawn(-1) usr.FaceTarget()
			var/obj/blasts/BigBeamAttack2/M=new/obj/blasts/BigBeamAttack2(get_step(usr,usr.dir),usr)
			if(prob(usr.ki_cast/4))
				M.critblast=1
			if(trg)
				M.dmg(trg,usr,M)
				return
			M.Fire2()
			*/


mob/verb/MobInfo()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	usr << "Gathering mob info...."
	var/count
	var/count2
//	AdminMessage("[usr]([usr.key]) manually Collec")
	for(var/mob/Monster/M)
		count++
	for(var/mob/Monster/ExplosiveMobs/N)
		count2++
	usr << "<b>[count] total mobs<br>[count2] exploding saibas"



mob/verb/ClearSaibaZone()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	usr << "Clearing saiba zone.."
	var/count
	for(var/mob/Monster/ExplosiveMobs/N)
		count++
		del N
	usr << "<b>[count] mobs deleted from saiba zone"


mob/verb/ClearAllMobs()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	usr << "Clearing all mobs.."
	var/count
	for(var/mob/Monster/N)
		count++
		del N
	usr << "<b>[count] mobs deleted"


mob/verb/BlastInfo()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	usr << "Gathering blast info...."
	var/count
	var/count2
//	AdminMessage("[usr]([usr.key]) manually Collec")
	for(var/obj/blasts/M)
		count++
	for(var/obj/blasts/trails/N)
		count2++
	usr << "<b>[count] total blasts <br>[count2] total trails"

/*


mob/verb/testfilter1()

	src.filters += filter(type="outline", size = 1, color=rgb(90,89,89))


mob/verb/testfilter1a()

	src.filters += filter(type="outline", size = 0, color=rgb(90,89,89))


mob/verb/testfilter2()
	src.filters += filter(type="drop_shadow", x=0, y=0,size=5, offset=2, color=rgb(255,255,170))



mob/verb/testfilter2a()
	src.filters += filter(type="drop_shadow", x=0, y=0,size=5, offset=2, color=rgb(90,89,89))



mob/verb/nullfilters()
	src.filters = null



atom/proc/BlurFade2()
	filters += filter(type = "blur", size = 0)
	// Animating a filter of src
	animate(filters[filters.len], size = 5, time = 10)
	// Switching back to src to animate the next step
	animate(src, alpha = 0, time = 2.5)


atom/proc/GlowFade()
	filters += filter(type = "drop_shadow", size = 0)
	// Animating a filter of src
	animate(filters[filters.len], size = 5, time = 10, color=rgb(90,89,89))
	// Switching back to src to animate the next step
	animate(src, alpha = 0, time = 2.5)

atom/proc/GlowFade2()
	filters += filter(type = "drop_shadow", size = 0)
	// Animating a filter of src
	animate(filters[filters.len], size = 5, time = 10, color=rgb(90,89,89))
	// Switching back to src to animate the next step
	animate(src, alpha = 100, time = 2.5)

atom/proc/GlowFade3()
	filters += filter(type = "drop_shadow", size = 1)
	// Animating a filter of src
	animate(filters[filters.len], size = 5, time = 10, color=rgb(90,89,89))
	// Switching back to src to animate the next step
	animate(src, alpha = 100, time = 2.5)
//	if(M) animate(M, alpha = 255, time = 3)
mob/verb/Blur1()
	src.BlurFade()

mob/verb/Blur2()
	src.BlurFade2()

mob/verb/Glow1()
	src.GlowFade()

mob/verb/Glow2()
	src.GlowFade2()

mob/verb/Glow3()
	src.GlowFade3()


mob/verb/testfilter3()
	while(src)
		src.filters += filter(type="drop_shadow", x=0, y=0,size=3, offset=2, color=rgb(90,89,89))
		sleep(10)
		src.filters = null
		src.filters += filter(type="drop_shadow", x=0, y=0,size=5, offset=2, color=rgb(90,89,89))
		sleep(10)
*/
/*

mob
	verb
		RageAura()
			src.overlays-=src.aura
			src.underlays-=src.underlays
			src.aura_on = 1
		//	src.underlays += new/obj/Aura/SSJ_Aura
			src.underlays += new/obj/Aura/Rage_Aura
			return

*/


//mob/verb/picker()
//	var/pick = pick(25;1,75;2)
//	world << "pick: [pick]"

/*
mob
	verb
		BBA()
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
//			if(usr.tech_cooldown)
//				usr<<"You must cooldown."
//				return
			if(usr.doing||usr.buku)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return

			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "Reach level 2000 to be able to use battle techniques."
				return
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "<font color=#ff0000>You are too tired to fight!</font>"
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "You are in a Safe Zone!"
					return
			usr.doing=1
			usr.attackCD = 1
			spawn(6) usr.attackCD = 0
			usr.frozen=1
			//usr.tech_cooldown=1
			usr.overlays+='Charge Blue.dmi'
			usr.ki_cast_exp += 8 + round(usr.level/500)
			usr.Ki_Cast_Level()
			usr.ki_use_exp += 10 + round(usr.level/300)
			usr.Ki_Use_Level()

			usr.staminaleft += 150

	//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
			var/randPL = round(usr.powerlevel*0.10)
			var/randKI = round(usr.ki*0.20)
			//src.setpower = round((randPL + randKI) * usr.ki_power/100)
			usr.icon_state="ki1"
			spawn(2)
				usr.icon_state="ki2"
			view(8)<<"\white [usr]: BIG BANG.."
			sleep(1)
			view(8)<<"\white [usr]: ATTACK!"

			usr.overlays-='Charge Blue.dmi'
			usr.icon_state="ki3"
			if(prob(usr.ki_cast))
				usr.ki_cast_exp += 12 + round(usr.level/200)
				usr.Ki_Cast_Level()
				spawn(10)
					usr.icon_state=""
					usr.frozen=0
					usr.doing=0
//var/obj/blasts/BB/M=new/obj/blasts/BB(get_step(usr,usr.dir),usr)
			/*	var/obj/blasts/BangC/C=new
				var/obj/blasts/BangTL/TL=new
				var/obj/blasts/BangT/T=new
				var/obj/blasts/BangTR/TR=new
				var/obj/blasts/BangL/L=new
				var/obj/blasts/BangR/R=new
				var/obj/blasts/BangBL/BL=new
				var/obj/blasts/BangB/B=new
				var/obj/blasts/BangBR/BR=new*/


				var/obj/blasts/BOMBS/BangC/C=new/obj/blasts/BOMBS/BangC(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangTL/TL=new/obj/blasts/BOMBS/BangTL(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangT/T=new/obj/blasts/BOMBS/BangT(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangTR/TR=new/obj/blasts/BOMBS/BangTR(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangL/L=new/obj/blasts/BOMBS/BangL(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangR/R=new/obj/blasts/BOMBS/BangR(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangBL/BL=new/obj/blasts/BOMBS/BangBL(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangB/B=new/obj/blasts/BOMBS/BangB(get_step(usr,usr.dir),usr)
				var/obj/blasts/BOMBS/BangBR/BR=new/obj/blasts/BOMBS/BangBR(get_step(usr,usr.dir),usr)
				C.icon_state="bb c"
				TL.icon_state="bb tl"
				T.icon_state="bb t"
				TR.icon_state="bb tr"
				L.icon_state="bb l"
				R.icon_state="bb r"
				BL.icon_state="bb bl"
				B.icon_state="bb b"
				BR.icon_state="bb br"
				C.name="Big Bang Attack"
				TL.name="Big Bang Attack"
				T.name="Big Bang Attack"
				TR.name="Big Bang Attack"
				L.name="Big Bang Attack"
				R.name="Big Bang Attack"
				BL.name="Big Bang Attack"
				B.name="Big Bang Attack"
				BR.name="Big Bang Attack"
				C.owner=usr
			//	C.loc=usr.loc
				C.dir=usr.dir
				TL.owner=usr
			//	TL.loc=usr.loc
				TL.dir=usr.dir
				T.owner=usr
			//	T.loc=usr.loc
				T.dir=usr.dir
				TR.owner=usr
			//	TR.loc=usr.loc
				TR.dir=usr.dir
				L.owner=usr
			//	L.loc=usr.loc
				L.dir=usr.dir
				R.owner=usr
			//	R.loc=usr.loc
				R.dir=usr.dir
				BL.owner=usr
			//	BL.loc=usr.loc
				BL.dir=usr.dir
				B.owner=usr
			//	B.loc=usr.loc
				B.dir=usr.dir
				BR.owner=usr
			//	BR.loc=usr.loc
				BR.dir=usr.dir
				usr.density = 0
				spawn(-1)C.UpdateBombTrails4()


				sleep(40)

				C.Fire2()
			//	sleep(5)
				//C.Fire2()
				TL.Fire2()
				T.Fire2()
				TR.Fire2()
				L.Fire2()
				R.Fire2()
				BL.Fire2()
				B.Fire2()
				BR.Fire2()
				usr.density = 1

			else
				spawn(15)
					usr.icon_state=""
					usr.frozen=0
					usr.doing=0

				return



obj
	proc
		UpdateBombTrails2()  // gotta move it forward one tile
			for(var/obj/blasts/BOMBS/BangTL/TL in world)
				if(TL.owner==src.owner)
					TL.loc=locate(src.x-1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangT/T in world)
				if(T.owner==src.owner)
					T.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangTR/TR in world)
				if(TR.owner==src.owner)
					TR.loc=locate(src.x+1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangL/L in world)
				if(L.owner==src.owner)
					L.loc=locate(src.x-1,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangR/R in world)
				if(R.owner==src.owner)
					R.loc=locate(src.x+1,src.y+1,src.z)
		//	for(var/obj/blasts/BOMBS/BangR/C in world)
		//		if(C.owner==src.owner)
		//			C.loc=locate(src.x,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangBL/BL in world)
				if(BL.owner==src.owner)
					BL.loc=locate(src.x-1,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangB/B in world)
				if(B.owner==src.owner)
					B.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangBR/BR in world)
				if(BR.owner==src.owner)
					BR.loc=locate(src.x+1,src.y-1,src.z)

		UpdateBombTrails3()
			for(var/obj/blasts/BOMBS/BangTL/TL in world)
				if(TL.owner==src.owner)
					TL.loc=locate(src.x-1,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangT/T in world)
				if(T.owner==src.owner)
					T.loc=locate(src.x,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangTR/TR in world)
				if(TR.owner==src.owner)
					TR.loc=locate(src.x+1,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangL/L in world)
				if(L.owner==src.owner)
					L.loc=locate(src.x-1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangR/R in world)
				if(R.owner==src.owner)
					R.loc=locate(src.x+1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangBL/BL in world)
				if(BL.owner==src.owner)
					BL.loc=locate(src.x-1,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangB/B in world)
				if(B.owner==src.owner)
					B.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangBR/BR in world)
				if(BR.owner==src.owner)
					BR.loc=locate(src.x+1,src.y-1,src.z)
		//	spawn(1)src.UpdateBombTrails()

		UpdateBombTrails4()
			for(var/obj/blasts/BOMBS/BangTL/TL in world)
				if(TL.owner==src.owner)
					TL.loc=locate(src.x-1,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangT/T in world)
				if(T.owner==src.owner)
					T.loc=locate(src.x,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangTR/TR in world)
				if(TR.owner==src.owner)
					TR.loc=locate(src.x+1,src.y+1,src.z)
			for(var/obj/blasts/BOMBS/BangL/L in world)
				if(L.owner==src.owner)
					L.loc=locate(src.x-1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangR/R in world)
				if(R.owner==src.owner)
					R.loc=locate(src.x+1,src.y,src.z)
			for(var/obj/blasts/BOMBS/BangBL/BL in world)
				if(BL.owner==src.owner)
					BL.loc=locate(src.x-1,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangB/B in world)
				if(B.owner==src.owner)
					B.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/blasts/BOMBS/BangBR/BR in world)
				if(BR.owner==src.owner)
					BR.loc=locate(src.x+1,src.y-1,src.z)
		//	spawn(1)src.UpdateBombTrails()

mob
	verb
		BB()
			//var/cost = 10000000+(100000*usr.kiuse)
			var/curki = round((usr.ki_control * usr.ki_max)/100)
			var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "Safe Zone!"
					return
			if(usr.dead)
				usr<<"You are dead."
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return

			if(usr.doing||usr.buku)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<cost)
				usr<<"Your ki is too low."
				return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "You are not a Combatant!"
				return
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "<font color=#ff0000>You are too tired to fight!</font>"
				return
			usr.attackCD = 1
			spawn(6) usr.attackCD = 0
			usr.doing=1
			usr.frozen=1
			//usr.tech_cooldown=1
			view()<<"\white[usr]: [src.name]!"
			//spawn(1)
			usr.frozen=0
			usr.doing=0
			usr.ki_use_exp += 5 + round(usr.level/600)
			usr.Ki_Use_Level()
			usr.ki -= cost
			usr.staminaleft += 15
			var/trg
			var/mob/T=locate(/mob) in get_step(usr,usr.dir)
			if(T)
				trg = T
			if(usr.chosentarget)
				if(!T) spawn(-1) usr.FaceTarget()
			var/obj/blasts/BB/M=new/obj/blasts/BB(get_step(usr,usr.dir),usr)
			if(prob(usr.ki_cast/4))
				M.critblast=1
			if(trg)
				M.dmg(trg,usr,M)
				return
			M.Fire2()


			*/


			/*
//mob/var/hp1 = new/obj/hudMeters/health_01()
mob/var/hp2 = new/obj/hudMeters/health_02()
mob/var/hp3 = new/obj/hudMeters/health_03()
mob/var/hp4 = 'Health4.dmi'//new/obj/hudMeters/health_04()
mob/var/hp5 = new/obj/hudMeters/health_04()

mob/var/icon/hp1 = new('Health1.dmi')

mob/verb/updategrid()
	world << hp1
	world << hp2
	alert("1")
	src<<output(hp1,"HUD.gPL1:1,1")
	alert("2")
	src<<output(hp2,"HUD.gPL2:1,1")
	alert("3")
	src<<output(hp3,"HUD.gPL3:1,1")
	alert("4")
	//hp4.icon_state = "100"
	src<<output(hp4,"HUD.gPL4:1,1")


mob/verb/updategrid2()
	world << hp1
	world << hp2

	src<<output(hp1,"HUD.gPL1:0,0")
	src<<output(hp2,"HUD.gPL2:1,1")
	src<<output(hp3,"HUD.gPL3:1,1")
	src<<output(hp5,"HUD.gPL4:1,1")

mob/verb/updategrid3()
	//var/icon/I = icon(usr.hp5,"100")

//	I.icon_state = "100"
	usr.hp4.icon_state = "100"

	src<<output(usr.hp4,"HUD.gPL4:1,1")
	/*
mob
	proc
		updateH()
			if(!src)return

		//	for(var/obj/hudMeters/o in src.client.screen)
		//		del(o)
		//	new/obj/hudMeters/health_01(src.client)
		//	new/obj/hudMeters/health_02(src.client)
		//	new/obj/hudMeters/health_03(src.client)
		//	new/obj/hudMeters/health_04(src.client)
		//	if(src.powerlevel_max*100 <= 0)
		//		spawn(10) src.updateHealth()
		//		return
			var/percent=round(src.powerlevel/src.powerlevel_max*100,10)
			if(percent>200) percent = 100
			else if(percent>100) percent=100
			if(percent<0) percent=0
		//	for(var/obj/hudMeters/o in src.client.screen)
		//		o.icon_state=num2text(percent)
			spawn(10)
				if(!src)return
				src.updateHealth()
				return
				*/
				*/









/*

var
	list/opposite_dirs = list(SOUTH,NORTH,null,WEST,null,null,null,EAST)

client
	var/tmp
		mloop = 0
		move_dir = 0 //keep track of the direction the player is currently trying to move in.
		keypresses = 0

    //rebind your interface so that your north/south/east/west keypresses are bound to:
    //keydown: MoveKey [Direction] 1
    //keyup: MoveKey [Direction] 0
    //Directions:
    //NORTH = 1
    //SOUTH = 2
    //EAST = 4
    //WEST = 8

	verb
		MoveKey(Dir as num,State as num)
			set hidden = 1
			//if we are currently not moving at the start of this function call, set a flag for later
			if(!move_dir)
				. = 1

			//get the opposite direction
			var/opposite = opposite_dirs[Dir]

			if(State)
			    //turn on the bitflags
				move_dir |= Dir
				keypresses |= Dir

			    //make sure that conflicting directions result in the newest one being dominant.
				if(opposite&keypresses)
					move_dir &= ~opposite
			else
			    //turn off the bitflags
				move_dir &= ~Dir
				keypresses &= ~Dir

			    //restore non-dominant directional keypress
				if(opposite&keypresses)
					move_dir |= opposite

			//if earlier flag was set, and we now are going to be moving
			if(.&&move_dir)
				move_loop()

    //no need for these. Just disable them.
	Northeast()
	Northwest()
	Southeast()
	Southwest()
	North()
	South()
	East()
	West()

	proc
		move_loop()
			set waitfor = 0
			if(src.mloop) return
			mloop = 1
			src.Move(mob.loc,move_dir)
			while(src.move_dir)
				sleep(world.tick_lag)
				if(src.move_dir)
					src.Move(mob.loc,move_dir)
			mloop = 0
			*/


/*

var
	worldstarttime = 0
	worldstarttimeofday = 0
client/Stat()
	if (!worldstarttime || worldstarttimeofday)
		worldstarttime = world.time
		worldstarttimeofday = world.timeofday
	var/tickdrift = (world.timeofday - worldstarttimeofday) - (world.time - worldstarttime)  / world.tick_lag
	statpanel("Tick Drift", "[round(tickdrift)] Missed ticks")
	statpanel("Tick Usage","[world.tick_usage]")
	..()


proc/lagstopsleep()
	var/tickstosleep = 1
	do
		sleep(world.tick_lag*tickstosleep)
		tickstosleep *= 2 //increase the amount we sleep each time since sleeps are expensive (5-15 proc calls)
	while(world.tick_usage > 75 && (tickstosleep*world.tick_lag) < 32) //stop if we get to the point where we sleep for seconds at a time


	*/
/*
mob
	verb
		Make_Icon2()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used make iocn")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/icon/I=input("Select your Guild Item's icon:")as null|icon
			if(!length(I))
				usr.makingitem=0
				return
			if(length(I) > filesizemax)
				usr << "File is too large. 50kb max."
				usr.makingitem=0
				return
			switch(alert(usr,"Overlay or Underlay?(Overlays show on top of your character's icon \
				and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
				if("Overlay")
					var/obj/Equipment/O = new
					var/N = input("Whats the name?","","Player Item","[usr]'s Item") as text
					if(Check_For_Spam(N,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						usr.makingitem = 0
						return
					if(!N)
						N = "[usr]'s Item"
					if(lentext(N)>15)
						N = "[usr]'s Item"
					if(N == null)
						N = "[usr]'s Item"
					N=html_encode(N)
					var/px = input("pixel x offset?","","pixel x offset","[usr]'s Item") as num
					var/py = input("pixel y offset?","","pixel y offset","[usr]'s Item") as num
					O.name = N
					O.icon = I
					O.pixel_x = px
					O.pixel_y = py
					O.customequip=1


					usr.contents += O
				//	usr.inven_min += 1
					usr.makingitem = 0
					usr<<"[N] was created successfully!"
					return
				if("Underlay")
					var/obj/Equipment/O = new
					var/N = input("Whats the name?","","Guild Item","[usr]'s Item") as text
					if(Check_For_Spam(N,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						usr.makingitem = 0
						return
					if(!N)
						N = "[usr]'s Item"
					if(lentext(N)>15)
						N = "[usr]'s Item"
					if(N == null)
						N = "[usr]'s Item"
					N=html_encode(N)
					O.name = N
					O.customequip=2
					O.icon = I
					usr.contents += O
				//	usr.inven_min += 1
					usr.makingitem = 0
					usr<<"[N] was created successfully!"
					return

					*/
/*
mob
	verb
		Beam()
			var/trg
			var/mob/T=locate(/mob) in get_step(usr,usr.dir)
			if(T)
				trg = T
			if(usr.chosentarget)
				if(!T) spawn(-1) usr.FaceTarget()
			var/obj/blasts/Beam/M=new/obj/blasts/Beam(get_step(usr,usr.dir),usr)
			if(prob(usr.ki_cast/4))
				M.critblast=1
			if(trg)
				M.dmg(trg,usr,M)
				return
			M.Fire2()

			*/

mob/var/tmp/detonatecd = 0
mob/verb/Detonate()
	set category = "Techniques"
	if(usr.detonatecd)
		usr << "You must wait to use this again"
		return
	usr.detonatecd = 1
	spawn(40) usr.detonatecd = 0
	//for(var/obj/blasts/trails/T in src.BlastList)// del(T)
	for(var/obj/blasts/trails/Q in src.BlastList)
		del Q
	for(var/obj/blasts/T in src.BlastList)// del(T)

		if(T.splashrange >= 1)
			var/rng = T.splashrange
			var/locc = T.loc
			var/dmg = T.splashdmg
			var/beam = T
			Explosion(rng,locc,beam,dmg,beam)
		else
			var/rng = 1
			var/locc = T.loc
			var/dmg = usr.powerlevel * 0.01
			var/beam = T
			Explosion(rng,locc,beam,dmg,beam)
//		for(var/obj/blasts/trails/Q in src.BlastList)
//			del Q
		del T

mob/verb/OOO()
	set hidden = 1
	var/a = 2000000000*10
	var/b = 2000000000*10*0.1
	var/c = (2000000000*10)*0.1
	world << "[applycommas(a)]"
	world << "[applycommas(b)]"
	world << "[applycommas(c)]"