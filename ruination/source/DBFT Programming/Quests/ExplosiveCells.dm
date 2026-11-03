//ExplosionSuicideMobs(range,turf/startloc as turf,dmg as num,mob/nohit as mob)
//ExplosionSuicideMobs(2,src.loc,100000,src)
mob/var
	ExplodingCellKills=0
	ExplodingCellKillsMax=0

	tmp/explodecurrentkillscell=0
//	typeai=0

//var/totalminis = 0
//days_since_joined = (datejoined - world.realtime) / 864000
/*
mob/verb/checkday()
	world << "month: [_month] day [_day] hour [_hour]"


mob/verb/setday()
	world << "day was set to [usr.explodingsaibaDay]"
	world << "today is [_cday]"
	usr.explodingsaibaDay = _cday
	*/
mob/Monster
	ExplosiveMobs

		Exploding_Cell
			name = "Exploding Cell"
			icon = 'Cell JrRed.dmi'
			respawn = 2000
			density = 1
			powerlevel = 2
			powerlevel_max = 2
			ki = 1000000000000
			ki_max = 1000000000000
			kidefense = 1
			kidefense_max = 1
			speed = 50000
			strength = 1000000000000
			defence = 1
			karma = "Evil"
			race = "Exploding"
			level = 10000000
			zenni = 1000
			pk = 1
			exp = 1
			melee=100
			block=100
			dodge=100
			counter=100
			critical=100
			durability=100
			ki_control=100
			ki_cast=100
			ki_power=100
			ki_use=100
			ki_res=100
			reflect=100
			weapon=100
			weapon_power=100
			weapon_resistance=100
			movespeed=0

			typeai=3
			Del()
				if(prob(1.5))

					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
			//	world << "startloc : [startloc]"
				if(startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				//src.Item_Drop()
	//			if(!halt_repop)
	//				if(!horde_mob)
	//					Quest_Repop2.Add(src.type)
	//					Quest_Loc2.Add(src.initialloc)
				..()
			New()
			//	var/blastrange = rand(1,3)
			//	src.startloc=src.loc
				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()

		proc
			AI_ExplodeCell()
				//world << "[src] one"
				if(src.sleeping||src.frozen)
					//world << "[src] sleep"
					src.sleeping = 1
					return
				if(AITarget)
				//	world << "[src] two"
					if(get_dist(src, AITarget) <= 6)



						if(src.icon_state != "exploding")
						//	if(get_dist(src, AITarget) <= 5)
							src.icon_state = "exploding"


						if(get_dist(src, AITarget) <= 3)
							spawn(-1)src.MobExplodeCell()
							src.sleeping=1
							return

					else
						if(src.icon_state != "")
							src.icon_state = ""
					if(get_dist(src, AITarget) > 20)
						AITarget = null
						walk(src,0)
						sleeping = 1

						return
				else
					walk(src,0)
					sleeping = 1
					AITarget = null
				//	world << "[src] four null"
					return
				spawn(6) AI_ExplodeCell()

			MobExplodeCell()
				//src.icon_state = "exploding"
				src.icon_state = "explodetime"
			//	var/icon/i = icon(src.icon, mob.icon_state)
			//	i.Scale(48, 48)
			//	src.icon = i
				//var/growtime = rand(4,7)
				var/growtime = rand(3,6)
				animate(src, transform = matrix()*3, alpha = 0, time = growtime)
				src.frozen = 1
				sleep(growtime)
				if(!src)
					return
				//src.frozen = 1
				//src.icon_state = "dead"
				var/b = src
				b=src.loc
				//if(a==src)

				var/obj/S=new/obj/Corpse/ExplosiveCellCorpse(b)
				S.dir = src.dir
				//sleep(2)

			//	src.loc = null
				del src


					//alert("YOUVE BEEN HIT")


				//	if(isarea(A) || istype(A,/obj/blasts/trails)) continue
					//if(isarea(A))
						//A.overlays += 'explosion.dmi'
						//spawn(5) A.overlays -= 'explosion.dmi'
						//flick('explosion.dmi',A)
				//	if(isturf(A))
				//		A.overlays += 'explosion.dmi'
				//		spawn(5) A.overlays -= 'explosion.dmi'

obj/Corpse
	ExplosiveCellCorpse
		icon='CellExplode.dmi'
		icon_state="dead"
		density = 0 //should this be 1?
		New()
			dir = pick(1,2,4,8)
			corpsedeletecell()


obj/proc
	corpsedeletecell()
		var/blastrange = rand(2,4) //maybe make health based on this.. divide max pl by (blast range #)
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays += 'explosion.dmi'
			spawn(2) T.overlays -= 'explosion.dmi'
		for(var/mob/PC/M in range(blastrange,src.loc))
			//M.powerlevel -= M.powerlevel_max/2
			var/dmgtaken = (M.powerlevel_max / blastrange)/rand(1,3)
			if(prob(15))
				dmgtaken = dmgtaken * 1.2
			//var/originalpl = round(M.powerlevel/M.powerlevel_max*100)
			M.powerlevel -= dmgtaken
			if(M.hudenabled)
				spawn() M.updateHealth()
		//	var/newpl = originalpl - round(M.powerlevel/M.powerlevel_max*100)
		//	usr << "<font size = 2>Damaged you for [newpl]"
			M <<output("<B><font size = 1><font color = red>[src]s explosion reduced your powerlevel to [round(M.powerlevel/M.powerlevel_max*100)]%","default.output2")

			var/ColorMatrix/c = new("Invert")
			animate(M.client, color = c.matrix, time = 2)
			spawn(3) animate(M.client, color = null, time = 2)
		//	animate(M.client, color = c.matrix, time = 3)
		//	spawn(5) animate(M.client, color = null, time = 3)
			if(M.buku)
				view() << "<b><font color=red>[src]'s attack forces [M] to land!</font>"
				M.buku = 0
				M.density = 1
				M.icon_state = ""
				M.doing = 0
				if(!M.timeskipeffect)
					M.move_delay = 0.6
			if(M.powerlevel <= 0)
				spawn() M.EXPLOSIONdeath("swarm of hostile cell juniors!")
		spawn(110) src.loc = null
		//del src
		//spawn(rand(90,140)) del src //might be too long




		/*
		this is kinda good, but need feed	back. probably need more mobs, and ways to combo to heal yourself*/


mob/proc
	ExplodingCellReward()
		if(prob(5))
			if(src.powerlevel < src.powerlevel_max)
				src.powerlevel+=src.powerlevel_max*0.10
			if(src.ki < src.ki_max)
				src.ki+=src.ki_max*0.10
			if(src.staminaleft > 0)
				staminaleft -= src.staminaleft_max*0.08
				if(src.staminaleft<0)
					src.staminaleft = 0

		var/lvlprob = rand(1,3)
/*
		if(src.ExplodingSaibamanKillsMax < 100000)
			lvlprob = rand(1,5)
		if(src.ExplodingSaibamanKillsMax < 75000)
			lvlprob = rand(1,3)
		if(src.ExplodingSaibamanKillsMax < 50000)
			lvlprob = rand(1,2)
		if(src.ExplodingSaibamanKillsMax < 15000)
			lvlprob = 1
*/
		//world << "CALLED REWARD lvlprob [lvlprob]  kills [src.ExplodingSaibamanKills]"



		if(prob(35))
			var/stat = round(rand(100,5000)+src.level/2)
			if(stat > 500000)
				stat = 500000
			src << output("<font color = white><b>All of your stats increase by [applycommas(stat)]","output2")
			src.powerlevel_max += stat
			src.ki_max += stat
			src.kidefense_max += stat
			src.strength_max += stat
			src.defence_max += stat
	//	if(prob(50))
	//		src <<output("<B><font size = 1><font color = white>Exp + [applycommas(src.tnl)] [src.tnl]","default.output2")
	//		src.exp += src.tnl



		var/qpgain = rand(2,8)
		if(prob(50))
			qpgain += rand(2,12)
		src <<output("<B><font size = 1>Quest Points + [qpgain] (Total: [applycommas(src.questpoints)])","default.output2")
		questpoints += qpgain
/*
		if(lvlprob == 1)
			src.exp += src.tnl

			if(!src.calledlvlup)
				if(src.exp >= src.tnl)
					spawn()src.Level_Up()

					*/
		src.exp += src.tnl


//		if(lvlprob > 0)
//			src.exp += src.tnl+5

		if(lvlprob==3)
			src.exp += src.tnl+10

		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()

		if(prob(0.005))
			src <<output("<B><font color=red>You have gained a Z Point!</font></B>","default.output2")
			src.zp += 1

		return
				/*
				MegamanXGigaArmor SpidermanSuit  SaiyamanSuit
									var/obj/Equipment/Suits/SaiyamanSuit/O = new
									if(usr.zenni >= O.value*10000)
										usr.zenni -= O.value*10000
										usr << "You bought [src] for [applycommas(O.value*10000)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0
		*/
		/*
	explodezonedrain()
		var/prevx = src.x
		var/prevy = src.y

		sleep(80)
		if(src.x == prevx && src.y == prevy)
			usr << "<b><font size = 2>The gravity in here pulls down on you<br>"

		while(src.inexplodezone)



						src.powerlevel+=src.powerlevel_max*0.03
						src.staminaleft+=src.staminaleft_max*0.06
						src << output("<font size = 1><i><font color = green>Regenerating, Powerlevel: [round(src.powerlevel/src.powerlevel_max*100)]% Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")

						if(src.staminaleft > src.staminaleft_max)
							src.staminaleft = src.staminaleft_max

							*/


							/*





			AI_Explode()
				//world << "[src] one"
				if(src.sleeping)
					//world << "[src] sleep"
					return
				if(AITarget)
				//	world << "[src] two"
					if(get_dist(src, AITarget) > 8)
				//		world << "[src] three"
						step_to(src, AITarget,1,src.movespeed)
						//sleep(5)
						sleep(1)
					else

						//src.icon_state = "exploding"
						while(get_dist(src,AITarget) <= 13)

							if(get_dist(src, AITarget) <= 4)
								break

							if(get_dist(src, AITarget) <= 2)
								spawn(-1)src.MobExplode()
								src.sleeping=1
								return

							step_to(src, AITarget,1,src.movespeed)
							//sleep(6)

							sleep(rand(1,2))

						if(get_dist(src,AITarget) <= 4)
							src.icon_state = "exploding"
						else
							src.icon_state = ""

						while(get_dist(src,AITarget) <= 4)
							if(get_dist(src, AITarget) <= 2)
								spawn(-1)src.MobExplode()
								src.sleeping=1
								return

							step_to(src, AITarget,1,src.movespeed)
							//sleep(6)
							sleep(2)



					if(src.z == 0)
						//world << "[src] has no loc AItarg: [src.AITarget]"
						return
					if(get_dist(src, AITarget) > 21)
						AITarget = null

						sleeping = 1
						return
				else
					sleeping = 1
					AITarget = null
				//	world << "[src] four null"
					return
				spawn() AI_Explode()
*/



//Credit to: Shadowdarke (slightly modified by Spuzzum)
//Contributed by: Spuzzum
mob
	var
		respawn = 200
		turf/startloc


	New(loc)
		..(loc) // default new stuff
		startloc = loc // store the starting loc for use later


proc/Remake(atom_type, loc, delay)
	if(loc) // if we know where it started
		if(delay != -1) spawn(delay) new atom_type(loc)
/*


atom/movable
	var
		respawn = 200
		turf/startloc

	New(loc)
		..(loc) // default new stuff
		startloc = loc // store the starting loc for use later

	Del()
		if(startloc) Remake(src.type, src.startloc, src.respawn)
		..() // default del stuff


proc/Remake(atom_type, loc, delay)
	if(loc) // if we know where it started
		if(delay != -1) spawn(delay) new atom_type(loc)

*/
/* For objects that you can pick up, you might want to stick
"Remake(src.type, src.startloc, src.respawn)" (without the quotes,
of course) directly into the get verb, so that you don't need to
actually destroy the item for it to respawn.

If you don't want something to respawn, set its respawn time to -1. */


//Then just stick respawn times (in ticks) in the mob and obj declarations

/*
//For example:
mob/spider
    respawn = 350 //35 seconds

mob/rat_boss
    respawn = 6000 //10 minutes

obj/health_potion
    respawn = 450 //45 seconds

obj/super_health_potion
    respawn = 4500 //7 minutes and 30 seconds
*/

//Be careful with this.  If you do global saving and an object doesn't
// exist at the time the server goes down, it will never come back.
//Most people don't do global saving, however, so this shouldn't apply to you.