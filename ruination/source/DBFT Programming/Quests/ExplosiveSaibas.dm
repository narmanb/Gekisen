//ExplosionSuicideMobs(range,turf/startloc as turf,dmg as num,mob/nohit as mob)
//ExplosionSuicideMobs(2,src.loc,100000,src)
mob/var
	ExplodingSaibamanKills=0
	ExplodingSaibamanKillsMax=0
	explodingsaibaDay=0
	tmp/explodecurrentkills=0
	typeai=0

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

		Exploding_Saibaman
			name = "Exploding Saibaman"
			icon = 'SaibamanEXPLODE.dmi'
			density = 1
			respawn = 1950
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
			typeai=1
			Del()
				if(prob(0.25))

					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				//src.Item_Drop()
		//		if(!halt_repop)
//
//					if(!horde_mob)
//						Quest_Repop.Add(src.type)
//						Quest_Loc.Add(src.initialloc)
				if(startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()
			New()
			//	var/blastrange = rand(1,3)
				frozen = 1
				spawn(rand(24,27)) frozen = 0
				..()


		Exploding_SaibamanBoss
			name = "Head Saibaman"
			icon = 'RedSaibaBoss2.dmi'
			density = 1
			powerlevel = 1000000000 * 75000
			powerlevel_max = 1000000000 * 75000
			ki = 1000000000000
			ki_max = 1000000000000
			kidefense = 1
			kidefense_max = 1
			speed = 50000
			strength = 1000000000000
			defence = 1
			karma = "Evil"
			race = "Exploding Saibaman"
			level = 1000000
			zenni = 100000
			pk = 1
			exp = 1000000
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
			typeai=2
			Del()
				if(prob(10))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
//					if(ran2 == 2)
//						var/obj/O = new/obj/Equipment/Buff_Items/MKIDEF_Shard
//						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MSTR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDEF_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
				//src.Item_Drop()
			/*
				if(!halt_repop)

					if(!horde_mob)
						Quest_Repop.Add(src.type)
						Quest_Loc.Add(src.initialloc)
						*/
				..()
			New()
			//	var/blastrange = rand(1,3)
		//		frozen = 1
		//		sleep(rand(1,4))
		//		frozen = 0
				..()
		Exploding_Saibaman_Pawns
			name = "Exploding Saibaman"
			icon = 'SaibamanEXPLODE.dmi'
			density = 1
			powerlevel = 1
			powerlevel_max = 1
			ki = 1000000000000
			ki_max = 1000000000000
			kidefense = 1
			kidefense_max = 1
			speed = 50000
			strength = 1000000000000
			defence = 1
			karma = "Evil"
			race = "Exploding Saibaman"
			level = 1000000
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
			typeai=1
			Del()
				if(prob(1))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
		//			if(ran2 == 2)
		//				var/obj/O = new/obj/Equipment/Buff_Items/MKIDEF_Shard
		//				O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MSTR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDEF_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
				//src.Item_Drop()
//				if(!halt_repop)

				//	if(!horde_mob)
					//	Quest_Repop.Add(src.type)
					//	Quest_Loc.Add(src.initialloc)
				..()
			New()
			//	var/blastrange = rand(1,3)
				..()
		proc
			Find_AI()
				if(src.typeai == 1)
					walk_to(src,src.AITarget,0,2,2)
					src.AI_Explode()
				if(src.typeai == 2)

					src.AI_ExplodeBoss()
				if(src.typeai == 3)
					walk_to(src,src.AITarget,0,1,1)
					src.AI_ExplodeCell()
			AI_Explode()
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


						if(get_dist(src, AITarget) <= 2)
							spawn(-1)src.MobExplode()
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
				//spawn(6) AI_Explod
				spawn(6) AI_Explode()

			AI_ExplodeBoss()
				//world << "[src] one"
				if(src.sleeping||src.frozen)
					//world << "[src] sleep"
					src.sleeping=1
					return
				if(AITarget)
				//	world << "[src] two"
					//if(get_dist(src, AITarget) > 1 && get_dist(src, AITarget) < 4)
					if(get_dist(src, AITarget) < 4)
				//		world << "[src] three"
						step_to(src, AITarget,1,src.movespeed)
						//sleep(5)
						sleep(2)
					else
						while(get_dist(src,AITarget) >= 4)
							if(!src.cooldown)
								var/count = 0
								for(var/mob/Monster/ExplosiveMobs/Exploding_Saibaman_Pawns/M in view(15))
									count++
								if(count < 15)
									src.cooldown = 1
									spawn(10) src.cooldown = 0
								//	var/mob/Monster/ExplosiveMobs/Exploding_Saibaman_Pawns/M=new/mob/Monster/ExplosiveMobs/Exploding_Saibaman_Pawns(get_step(src,src.dir),src)
									var/mob/Monster/ExplosiveMobs/Exploding_Saibaman_Pawns/O = new

									O.loc = src.loc
									O.AITarget = AITarget
									O.sleeping = 0
									spawn() O.AI_Explode()
//									for(var/mob/PC/M in oview(15))
//										O.AITarget = M
//										world << "[O] [O.AITarget] [M]"
//										O.AI_Explode()


								//	for(var/mob/PC/M in oview(15))
								//		if(O.sleeping)
								//			O.sleeping = 0
								//			O.AITarget = M  // added this line
								//			if(!O)return
								//			spawn() O.AI()
								else
									src.cooldown = 1
									spawn(50) src.cooldown = 0
								//oview() << "[O.name] has spawned!"
							if(get_dist(src, AITarget) > 7)

								step_to(src, AITarget,1,src.movespeed)
							//sleep(6)
							sleep(4)
					if(get_dist(src, AITarget) <= 1)
						if(prob(5))
							spawn(-1)src.MobExplode()
							src.sleeping=1
							return
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
				spawn() AI_ExplodeBoss()

			MobExplode()
				//src.icon_state = "exploding"
				src.icon_state = "explodetime"
			//	var/icon/i = icon(src.icon, mob.icon_state)
			//	i.Scale(48, 48)
			//	src.icon = i
				//var/growtime = rand(4,7)
				var/growtime = rand(3,9)
				animate(src, transform = matrix()*2.5, alpha = 0, time = growtime)
				src.frozen = 1
				sleep(growtime)
				if(!src)
					return
				//src.frozen = 1
				//src.icon_state = "dead"
				var/b = src
				b=src.loc
				//if(a==src)

				var/obj/S=new/obj/Corpse/ExplosiveSaibaCorpse(b)
				S.dir = src.dir

				//ExplosionSuicideMobs(2,src.loc,100000,src)
//				sleep(1)
	/*
				for(var/turf/T in range(2,S.loc))
					T.overlays += 'explosion.dmi'
					spawn(6) T.overlays -= 'explosion.dmi'
				for(var/mob/PC/M in range(2,S.loc))
					//M.powerlevel -= M.powerlevel_max/2
					M.powerlevel -= 150000
					world <<output("<B><font size = 2><font color = red>[src]s explosion damaged you severely! Be careful!","default.output2")
					if(M.buku)
						view() << "<b><font color=red>[src]'s attack forces [M] to land!</font>"
						M.buku = 0
						M.density = 1
						M.icon_state = ""
						M.doing = 0
						if(!M.timeskipeffect)
							M.move_delay = 0.6
					if(M.powerlevel <= 0)
						spawn() M.DeathCheck(src)
				*/


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
	ExplosiveSaibaCorpse
		icon='SaibamanEXPLODE.dmi'
		icon_state="dead"
		density = 0 //should this be 1?
		New()
			dir = pick(1,2,4,8)
			corpsedelete()


obj/proc
	corpsedelete()
		var/blastrange = rand(2,3) //maybe make health based on this.. divide max pl by (blast range #)
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays += 'explosion.dmi'
			spawn(2) T.overlays -= 'explosion.dmi'
		for(var/mob/PC/M in range(blastrange,src.loc))
			//M.powerlevel -= M.powerlevel_max/2
			var/dmgtaken = (M.powerlevel_max / blastrange)/rand(1,3)
			if(prob(35))
				dmgtaken = dmgtaken * 0.7
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
				spawn() M.EXPLOSIONdeath("horde of vengeful saibamen!")
		spawn(110) src.loc = null
		//del src
		//spawn(rand(90,140)) del src //might be too long




		/*
		this is kinda good, but need feedback. probably need more mobs, and ways to combo to heal yourself*/


mob/proc
	ExplodingSaibaReward()
		if(prob(10))
			if(src.powerlevel < src.powerlevel_max)
				src.powerlevel+=src.powerlevel_max*0.10
			if(src.ki < src.ki_max)
				src.ki+=src.ki_max*0.10
			if(src.staminaleft > 0)
				staminaleft -= src.staminaleft_max*0.08
				if(src.staminaleft<0)
					src.staminaleft = 0





	//	var/lvlprob = rand(1,3)
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



		if(prob(25))
			var/stat = round(rand(100,5000)+src.level/2)
			if(stat > 350000)
				stat = 350000
			src << output("<font color = white><b>All of your stats increase by [applycommas(stat)]","output2")
			src.powerlevel_max += stat
			src.ki_max += stat
			src.kidefense_max += stat
			src.strength_max += stat
			src.defence_max += stat
	//	if(prob(50))
	//		src <<output("<B><font size = 1><font color = white>Exp + [applycommas(src.tnl)] [src.tnl]","default.output2")
	//		src.exp += src.tnl



		var/qpgain = rand(1,3)
		if(prob(50))
			qpgain += rand(1,2)
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


	//	if(lvlprob > 0)
	//		src.exp += src.tnl+5

	//	if(lvlprob==3)
	//		src.exp += src.tnl+10

		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()

	//	if(prob(0.01))
	//		src <<output("<B><font color=red>You have gained a Z Point!</font></B>","default.output2")
	//		src.zp += 1

/*
		if(prob(5))
			var/s1=locate(/obj/Equipment/Suits/SaiyamanSuit/) in src.contents
			if(!s1)
				var/obj/Equipment/Suits/SaiyamanSuit/O = new
				src.contents += O
				src << "<font color = green><font size = 2><b>You just obtained a Great Saiyaman suit!"


		if(prob(1.5))
			var/s2=locate(/obj/Equipment/Suits/SpidermanSuit/) in src.contents
			if(!s2)
				var/obj/Equipment/Suits/SpidermanSuit/O2 = new
				src.contents += O2
				src << "<font color = green><font size = 2><b>You just obtained a Spiderman suit!"
		if(prob(0.2))
			var/s3=locate(/obj/Equipment/Suits/MegamanXGigaArmor/) in src.contents
			if(!s3)
				var/obj/Equipment/Suits/MegamanXGigaArmor/O3 = new
				src.contents += O3
				src << "<font color = green><font size = 2><b>You just obtained a Megaman X Giga Armor suit!"
*/
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
