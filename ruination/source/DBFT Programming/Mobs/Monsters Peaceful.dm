//	mob
//	proc
/*		Find_Mobs_In_View(var/mob/Monster/P)
			for(P in oview(12))
				if(P in oview(12))
					spawn()P.Wander(usr)
			spawn(20)src.Find_Mobs_In_View()*/


mob


	Monster/Peaceful

//Crimzon patch 2.61 new AI

		proc
			AttackMOBpeace(mob/PC/M)
				var/attack_text = rand(1,2)
				var/text
				if(attack_text == 1)
					text = "\red [src] Punches you!"
				if(attack_text == 2)
					text = "\red [src] Kicks you!"
				if(src.KO)
					return
				if(M.buku)
					return
				if(M.safe)
					return
				if(M.dead)
					return
				if(!M)
					return
				var/attackpower = src.strength+src.powerlevel*0.1
				if(!M)return
				var/defensepower = (M.defence * (M.durability/100)) + (M.powerlevel * 0.01)
				var/damage = attackpower-defensepower
				if(!M)return
				var/cdamage = ((src.strength+src.powerlevel*0.1)*2)-defensepower
				if(damage < 1)
					damage = 1
				if(cdamage < 1)
					cdamage = 1
				if(istype(M,/mob/PC))
					if(!M)return
					if(!src)return
					if(prob(M.dodge/5))
						flick("IT",M)
						M.attacker = src.name.
						if(!M)return
						M.dodge_exp += 5+round(M.level/250)
						M.Dodge_Level()
						if(M.attacktext)
							M << output("<font color=green>You dodge [src]'s attack","output2")
						return
					else
						if(!M)return
						if(!src)return
						if(prob(M.block/5))
							M.attacker = src.name
							if(!M)return
							M.powerlevel -= damage/4
							M.block_exp += 5+round(M.level/250)
							M.Block_Level()
							if(M.attacktext)
								M << output("<font color=green>You block [src]'s attack","output2")
							M.DeathCheck(src)
							return
						else
							if(!M)return
							if(!src)return
							if(prob(M.counter/5))
								if(!usr)return
								usr.powerlevel -= ((damage) + (damage *0.30))
								M.count_exp += 5+round(M.level/250)
								M.Counter_Level()
								if(M.attacktext)
									M << output("<font color=green>You counter [src]'s attack","output2")
								usr.DeathCheck(M)
								return
							else
								if(!M)return
								if(!src)return
								if(prob(src.critical))
									if(!M)return
									if(M.attacktext)
										M << output("[text]","output2")
									M.attacker = src.name
									if(!M)return
									M.powerlevel-=cdamage
									M.DeathCheck(src)
									return
								else
									if(!M)return
									if(!src)return
									if(M.attacktext)
										M << output("[text]","output2")
									M.attacker = src.name
									if(!M)return
									M.powerlevel -= damage
									M.DeathCheck(src)
									return


			AIpeaceful()
//				world << "B"
				if(src.sleeping)
					return
				if(AITarget)
					if(get_dist(src, AITarget) > 1)
						step_to(src, AITarget,1,src.movespeed)
						sleep(1)
					else
						AttackMOBpeace(AITarget)
						sleep(10)
					if(get_dist(src, AITarget) > 13)
						//world << "<font color =blue><b>[src.name] LOST TARGET loc: [src.x],[src.y],[src.z] PL [src.powerlevel]"
						AITarget = null
						//sleeping = 1
						//walk_rand(src,1,3)
						src.WanderAround()
						return

				else
					//get_target()
			//		world << "<b>GOT NO TARGET"
					//walk_rand(src,1,3)
					AITarget = null
					src.WanderAround()
					return

				spawn() AIpeaceful()



		New()
			..()
			density=1
			pk=1
			safe=0
			src.CreateName()
			src.initialloc=src.loc
			for(var/area/Horde_Point/H in oview(1,src))
				src.horde_mob=1
				return
//			Wander()

mob/Monster
	Peaceful

		Bunny
			name = "Bunny"
			icon = 'bunny.dmi'
			icon_state = "1"
			density = 1
			animate_movement = FORWARD_STEPS
			powerlevel = 1500
			powerlevel_max = 1500
			ki = 5
			ki_max = 5
			kidefense = 1
			kidefense_max = 1
			speed = 1000
			strength = 1
			defence = 1
			karma = "Good"
			race = "Peaceful Mob"
			level = 5
			zenni = 500
			exp = 1000
			melee=20
			block=20
			dodge=20
			counter=20
			critical=20
			durability=20
			ki_control=20
			ki_cast=20
			ki_power=20
			ki_use=20
			ki_res=20
			reflect=20
			weapon=20
			weapon_power=20
			weapon_resistance=20
			movespeed = 3
			respawn = 3500
			New()
				src.sleeping = 0

				//walk_rand(src,30,30)
				if(prob(50))
					icon_state = "2"
				spawn() src.WanderAround()
				..()
		//	Bump(mob/M)
		//		if(istype(M,/mob/PC))
		//			src.Attack2(M)
			Del()
				if(startloc) Remake(src.type, src.startloc, src.respawn)
				..()

		Sheep
			name = "Sheep"
			icon = 'Sheep.dmi'

			density = 1
			animate_movement = FORWARD_STEPS
			powerlevel = 2500
			powerlevel_max = 2500
			ki = 5
			ki_max = 5
			kidefense = 1
			kidefense_max = 1
			speed = 1000
			strength = 5
			defence = 5
			karma = "Good"
			race = "Peaceful Mob"
			level = 10
			zenni = 1000
			exp = 1500
			melee=20
			block=20
			dodge=20
			counter=20
			critical=20
			durability=20
			ki_control=20
			ki_cast=20
			ki_power=20
			ki_use=20
			ki_res=20
			reflect=20
			weapon=20
			weapon_power=20
			weapon_resistance=20
			movespeed = 3
			respawn = 3500
			New()
				src.sleeping = 0

				//walk_rand(src,30,30)
				if(prob(50))
					icon = 'SheepBlack.dmi'
				spawn() src.WanderAround()
				..()
		//	Bump(mob/M)
		//		if(istype(M,/mob/PC))
		//			src.Attack2(M)
			Del()
				if(startloc) Remake(src.type, src.startloc, src.respawn)
				..()

		Citizen
			name = "Citizen"
			icon = 'Male - Tan.dmi'

			density = 1
			animate_movement = FORWARD_STEPS
			powerlevel = 5000
			powerlevel_max = 5000
			ki = 5
			ki_max = 5
			kidefense = 1
			kidefense_max = 1
			speed = 1000
			strength = 5
			defence = 100
			karma = "Good"
			race = "Peaceful Mob"
			level = 5000
			zenni = 2000
			exp = 2500
			melee=100
			block=20
			dodge=20
			counter=20
			critical=20
			durability=100
			ki_control=20
			ki_cast=20
			ki_power=20
			ki_use=20
			ki_res=100
			reflect=20
			weapon=20
			weapon_power=20
			weapon_resistance=20
			movespeed = 1
			respawn = 5000
			New()
				if(prob(25))
					icon = 'Male - Dark.dmi'

				if(prob(15))
					icon = '71dbzmobs.dmi'
					icon_state = "bigdude"
				else
					var/randhair = rand(1,4)
					if(randhair == 1)
						src.overlays+='Hair - Adult Gohan.dmi'
					if(randhair == 2)
						src.overlays+='Hair - Future Gohan.dmi'
					if(randhair == 3)
						src.overlays+='Hair - Hercule H.dmi'
					if(randhair == 4)
						src.overlays+='Weighted TurbenWhite.dmi'
					var/randgi = rand(1,2)
					var/randunder = rand(1,2)
//					var/gi = 'Black Gi.dmi'
//					var/under = 'Black Under.dmi'
					if(randunder==1)
						src.overlays+='Black Under.dmi'
					else
						src.overlays+='Red Under.dmi'
					if(randgi==1)
						src.overlays+='Black Gi.dmi'
					else
						src.overlays+='Blue Gi.dmi'
					if(prob(30))
						if(prob(50))
							src.overlays+='Black Cape.dmi'
						else
							src.overlays+='White Cape.dmi'




				src.sleeping = 0

				//walk_rand(src,30,30)

				spawn() src.WanderAround()
				..()
		//	Bump(mob/M)
		//		if(istype(M,/mob/PC))
		//			src.Attack2(M)
			Del()
				if(startloc) Remake(src.type, src.startloc, src.respawn)
				..()


mob/proc/WanderAround()
	if(src.AITarget)
		return
	while(!src.AITarget)
		switch(rand(1,4))
			if(1)step(src,NORTH)
			if(2)step(src,SOUTH)
			if(3)step(src,EAST)
			if(4)step(src,WEST)
		sleep(30)

/*
mob/NPC
	Ness
		icon = 'nessicon.dmi'
		density = 0 // 0 density should allow it to walk through water which has density
		New()
			spawn() src.WanderNess()
			..()



mob/proc/WanderNess()
step(src,EAST)
sleep(30)
step(src,EAST)
sleep(40)
step(src,WEST)
sleep(30)
step(src,WEST)
sleep(40)
spawn() src.WanderNess()








				*/



