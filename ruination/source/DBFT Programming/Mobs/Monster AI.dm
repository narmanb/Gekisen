//Crim patch 2.61 added lists for mob respawning
var
	list
		Saibaman_Repop=new/list
		Saibaman_Loc=new/list
		Namekian_Repop=new/list
		Namekian_Loc=new/list
		Saiyan_Repop=new/list
		Saiyan_Loc=new/list
		Android_Repop=new/list
		Android_Loc=new/list
		Angel_Repop=new/list
		Angel_Loc=new/list
		Demon_Repop=new/list
		Demon_Loc=new/list
		Dragon_Repop=new/list
		Dragon_Loc=new/list
		Bio_Repop=new/list
		Bio_Loc=new/list
		Misc_Repop=new/list
		Misc_Loc=new/list
		Majin_Repop=new/list
		Majin_Loc=new/list
		Quest_Loc=new/list
		Quest_Repop=new/list
		Rose_Loc=new/list
		Rose_Repop=new/list
		NewSaiyan_Repop=new/list
		NewSaiyan_Loc=new/list
		Quest_Loc2=new/list
		Quest_Repop2=new/list
		Beerus_Loc=new/list
		Beerus_Repop=new/list
proc
	npc_respawn(T,D,L)
		spawn(D)
			new T(L)

			/*
mob/var
	TierOnePL = 1000000
	TierOneKI = 1000000
	TierOneKID = 400000
	TierOneSTR = 350000
	TierOneDEF = 200000

	TierTwoPL = 10000000
	TierTwoKI = 10000000
	TierTwoKID = 4500000
	TierTwoSTR = 3800000
	TierTwoDEF = 2200000

	TierThreePL = 100000000
	TierThreeKI = 100000000
	TierThreeKID = 50000000
	TierThreeSTR = 40000000
	TierThreeDEF = 30000000

	TierFourPL = 2000000000
	Ti3erFourKI = 1000000000
	TierFourKID = 500000000
	TierFourSTR = 450000000
	TierFourDEF = 350000000
	*/
mob
	PC
		Move()
			.=..()
			if(src.safe) // should i keep this
				return
			for(var/mob/Monster/MainMobs/M in oview(12))
				if(M.sleeping)
					M.sleeping = 0
					M.AITarget = src  // added this line
					if(!M)return
					spawn() M.AI()
			if(src.z == 8)
				for(var/mob/Monster/ExplosiveMobs/M in oview(16))
					if(M.sleeping)
						M.sleeping = 0
						M.AITarget = src  // added this line
						if(!M)return
						//spawn() M.AI_Explode()
						spawn() M.Find_AI()
			if(src.z == 10)
				for(var/mob/Monster/BeerusMobs/M in oview(16))
					if(M.sleeping)
						M.sleeping = 0
						M.AITarget = src  // added this line
						if(!M)return
						spawn() M.AI_Beerus()
	/*		for(var/mob/Saga/S in oview(12))
				if(S.sleeping)
					S.sleeping = 0
					if(!S)return
					spawn(1) S.SagaAI()*/

mob
	proc
/*		Find_Mobs_In_View(var/mob/Monster/P)
			for(P in oview(12))
				if(P in oview(12))
					spawn()P.Wander(usr)
			spawn(20)src.Find_Mobs_In_View()*/

		Wander(var/mob/PC/M)
			while(src&&M in oview(13))
				var/Found = FALSE
				for(M in oview(13))
					if(get_dist(src,M)>1)
						step_towards(src,M)
						//walk_towards(Ref,Trg,Lag=0,Speed=0)
					else
						if(get_dist(src,M)<=1)
							src.Attack2(M)
					Found = TRUE
					break
				if(Found != TRUE)
					sleep(4)
				sleep(4)

/*Mob Wander prob to check if there is a closer person to target, will need to iron this out
		Wander(var/mob/PC/M)
			while(src&&M in oview(12))
				var/Found = FALSE
				for(M in oview(12))
					if(get_dist(src,M)>1)
						for(var/mob/PC/N in oview(12))
							if(N!=M)
								if(get_dist(src,M)<get_dist(src,N))
									step_towards(src,M)
								else
									M=N
									step_towards(src,M)
					else
						if(get_dist(src,M)<=1)
							src.Attack2(M)
					Found = TRUE
					break
				if(Found != TRUE)
					sleep(4)
				sleep(4)*/

		Attack2(mob/M)
			var/attack_text = rand(1,2)
			var/text
			if(attack_text == 1)
				text = "\red [usr] Punches you!"
			if(attack_text == 2)
				text = "\red [usr] Kicks you!"
			if(!M)
				return
			if(src.attack_lock)
				return
			if(src.buku)
				return
			if(src.cooldown)
				return
			if(src.KO)
				return
			if(M.buku)
				return
			if(M == src)
				return
			if(M.safe)
				return
			if(M.dead)
				return
			var/attackpower = src.strength+src.powerlevel*0.1
			var/defensepower=(M.defence+(M.powerlevel*0.1)+1)
			var/damage = attackpower-defensepower
			var/cdamage = ((src.strength+src.powerlevel*0.1)*2)-defensepower
			if(damage < 1)
				damage = 1
			if(cdamage < 1)
				cdamage = 1
			if(istype(M,/mob/PC))
				if(src.cooldown)
					return
				else
					if(prob(M.dodge/5))
						flick("IT",M)
						if(!M)return
						M.attacker = src.name
						M.dodge_exp += 5+round(M.level/250)
						M.Dodge_Level()
						if(M.attacktext)
							M << output("<font color=green>You dodge [usr]'s attack","output2")
						usr.cooldown = 1
						spawn(10)usr.cooldown = 0
						return
					else
						if(prob(M.block/5))
							M.attacker = src.name
							if(!M)return
							M.powerlevel -= damage/4
							M.block_exp += 5+round(M.level/250)
							M.Block_Level()
							if(M.attacktext)
								M << output("<font color=green>You block [usr]'s attack","output2")
							M.DeathCheck(src)
							usr.cooldown = 1
							spawn(10) usr.cooldown = 0
							return
						else
							if(prob(M.counter/5))
								if(!M)return
								usr.powerlevel -= ((damage) + (damage *0.30))
								M.count_exp += 5+round(M.level/250)
								M.Counter_Level()
								if(M.attacktext)
									M << output("<font color=green>You counter [usr]'s attack","output2")
								usr.DeathCheck(M)
								usr.cooldown = 1
								spawn(10) usr.cooldown = 0
								return
							else
								if(prob(usr.critical))
									if(!M)return
									if(M.attacktext)
										M << output("[text]","output2")
									M.attacker = src.name
									M.powerlevel-=cdamage
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn(10) usr.cooldown = 0
									return
								else
									if(!M)return
									if(M.attacktext)
										M << output("[text]","output2")
									M.attacker = src.name
									M.powerlevel -= damage
									M.DeathCheck(src)
									usr.cooldown = 1
									spawn(10) usr.cooldown = 0
									return

mob

	NPC
		New()
			density=1
			pk=0
			safe=1
			..()
	Monster

//Crimzon patch 2.61 new AI

		proc
			AttackMOB(mob/PC/M)
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
									if(M.hudenabled)
										spawn() M.updateHealth()
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
									if(M.hudenabled)
										spawn() M.updateHealth()
									M.DeathCheck(src)
									return


			AI()
				if(src.sleeping)
					return
				if(AITarget)
					if(get_dist(src, AITarget) > 1)
						step_to(src, AITarget,1,src.movespeed)
						sleep(2)
					else
						AttackMOB(AITarget)
						sleep(11)
			//		if(src.z == 0)
						//world << "[src] has no loc AItarg: [src.AITarget]"
			//			return
					if(get_dist(src, AITarget) > 13)
						//world << "<font color =blue><b>[src.name] LOST TARGET loc: [src.x],[src.y],[src.z] PL [src.powerlevel]"
						AITarget = null
						sleeping = 1
						return

				else
					//get_target()
			//		world << "<b>GOT NO TARGET"
					sleeping = 1
					AITarget = null
					return

				spawn() AI()


			AI2()

				if(src.name == "ADead Saiba")
					world << "<font color = red>SHOULD BE DEAD"
				if(src.sleeping)

					return

				if(AITarget)
					if(src.name == "ADead Saiba")
						world << "<font color = red><b>SHOULD BE DEAD"
					if(get_dist(src, AITarget) > 1)
						if(src.name == "ADead Saiba")
							world << "<font color = white>SHOULD BE DEAD"
						step_to(src, AITarget,1,src.movespeed)
						sleep(2)
					else
						AttackMOB(AITarget)
						sleep(11)
					if(get_dist(src, AITarget) > 13)
						if(src.name == "ADead Saiba")
							world << "<font color = green>SHOULD BE DEAD"
						AITarget = null
						sleeping = 1
						return

				else
					if(src.name == "ADead Saiba")
						world << "<font color = green>SHOULD BE DEAD NO TARGET"
					get_target()

					if(AITarget)
						sleep(5)

					else
						world << "<b>GOT NO TARGET"
						sleeping = 1
						AITarget = null
						return
						/*
						if(src.name == "ADead Saiba")
							world << "<font color = blue>SHOULD BE DEAD NO TARGET"
						var/mob/PC/p = locate(/mob/PC) in orange(13, src)
						if(!p)
							if(src.name == "ADead Saiba")
								world << "<font color = blue><b>SHOULD BE DEAD NO TARGET"
							sleeping = 1
							AITarget = null
							return
							*/

				spawn() AI()

			get_target()

				world << "<font color = yellow>CALLED FOR TARGET"


				/*
				for(var/mob/PC/M in oview(12, src))
					if(M in oview(12, src))
						AITarget = M
						return
					else*

						world << "<font color = yellow><B>cALLED for target 2"
						sleeping=1
						AITarget = null
					break
					*/

				for(var/mob/PC/M in player)
					if(get_dist(src, M) <= 13)
						AITarget = M
						return
					else
						world << "AINT GOT NO TARGET IN GET TARGET"
						sleeping = 1
						AITarget = null
					break
		New()
			..()
			density=1
			pk=1
			hudenabled=0

			safe=0
			//src.CreateName()
			src.initialloc=src.loc
			//for(var/area/Horde_Point/H in oview(1,src))
			//	src.horde_mob=1
			//	return
//			Wander()

mob/Monster
	MainMobs

		Cell_Jr
			name = "Cell Jr."
			icon = 'Cell Jr.dmi'
			density = 1
			powerlevel = 1350000
			powerlevel_max = 1350000
			ki = 100000
			ki_max = 100000
			kidefense = 150000
			kidefense_max = 150000
			speed = 50000
			strength = 286000
			defence = 150000
			critical = 20
			karma = "Evil"
			race = "Bio Android"
			level = 30000
			zenni = 11000
			pk = 1
			exp = 33000
			melee=35
			block=35
			dodge=35
			counter=35
			critical=35
			durability=35
			ki_control=35
			ki_cast=35
			ki_power=35
			ki_use=35
			ki_res=35
			reflect=35
			weapon=35
			weapon_power=35
			weapon_resistance=35
			movespeed = 1.5
		//	Bump(mob/M)
		//		if(istype(M,/mob/PC))
		//			src.Attack2(M)
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()


		Green_Saiba_Man
			name = "Green Saibaman"
			icon = 'Saibaman - Form 1.dmi'
			powerlevel = 10000
			powerlevel_max = 10000
			ki = 100000
			ki_max = 100000
			kidefense = 400
			kidefense_max = 400
			speed = 1000
			strength = 1500
			defence = 750
			karma = "Evil"
			race = "Green Saibaman"
			level = 10000
			zenni = 1500
			exp = 5500
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
			movespeed = 4
			Del()
				//world << "<b><font color = red>DELETED [src] "
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saibaman_Repop.Add(src.type)
						Saibaman_Loc.Add(src.initialloc)
				..()
		White_Saiba_Man
			name = "White Saibaman"
			icon = 'Saibaman - Form 6.dmi'
			powerlevel = 110000
			powerlevel_max = 110000
			ki = 10000
			ki_max = 10000
			kidefense = 20000
			kidefense_max = 20000
			speed = 50000
			strength = 45000
			defence = 25000
			karma = "Evil"
			race = "White Saibaman"
			level = 15000
			zenni = 1400
			exp = 10000
			melee=35
			block=35
			dodge=35
			counter=35
			critical=35
			durability=35
			ki_control=35
			ki_cast=35
			ki_power=35
			ki_use=35
			ki_res=35
			reflect=35
			weapon=35
			weapon_power=35
			weapon_resistance=35
			movespeed = 2
			Del()
				//src.Item_Drop()
				//world << "<b><font color = red>DELETED [src] "
				if(!halt_repop)
					if(!horde_mob)
						Saibaman_Repop.Add(src.type)
						Saibaman_Loc.Add(src.initialloc)
				..()

		Black_Saiba_Man
			name = "Black Saibaman"
			icon = 'Saibaman - Form 4.dmi'
			powerlevel = 10000000 * 10000
			powerlevel_max = 10000000 * 10000
			ki = 800000 * 10000
			ki_max = 800000 * 10000
			kidefense = 800000 * 10000
			kidefense_max = 800000 * 10000
			speed = 50000 * 10000
			strength = 250000 * 10000
			defence = 190000 * 10000
			karma = "Evil"
			race = "Black Saibaman"
			level = 100000
			zenni = 85000
			exp = 70000
			melee=60
			block=60
			dodge=60
			counter=60
			critical=60
			durability=60
			ki_control=60
			ki_cast=20
			ki_power=60
			ki_use=60
			ki_res=60
			reflect=60
			weapon=60
			weapon_power=60
			weapon_resistance=60
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saibaman_Repop.Add(src.type)
						Saibaman_Loc.Add(src.initialloc)
				..()
		Red_Saiba_Man
			name = "Red Saibaman"
			icon = 'Saibaman - Form 5.dmi'
			powerlevel = 75000000 * 10000
			powerlevel_max = 75000000 * 10000
			ki = 46000000 * 10000
			ki_max = 46000000 * 10000
			kidefense = 48000000 * 10000
			kidefense_max = 48000000 * 10000
			speed = 6000000 * 10000
			strength = 2000000 * 10000
			defence = 2000000 * 10000
			karma = "Evil"
			race = "Red Saibaman"
			level = 1000000
			zenni = 130000
			exp = 100000
			melee=65
			block=65
			dodge=65
			counter=65
			critical=65
			durability=65
			ki_control=65
			ki_cast=65
			ki_power=65
			ki_use=65
			ki_res=65
			reflect=65
			weapon=65
			weapon_power=65
			weapon_resistance=65
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saibaman_Repop.Add(src.type)
						Saibaman_Loc.Add(src.initialloc)
				..()
		God_Saiba_Man
			name = "God Saibaman"
			icon = 'Saibaman - Form 7.dmi'
			powerlevel = 1000000000*800
			powerlevel_max = 1000000000*800
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000*200
			kidefense_max = 1000000000*200
			speed = 50000
			strength = 1000000000*100
			defence = 1000000000*50
			karma = "Evil"
			race = "God Saibaman"
			level = 1000000
			zenni = 160000*4
			exp = 395000*4
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saibaman_Repop.Add(src.type)
						Saibaman_Loc.Add(src.initialloc)
				..()
		Goon_1
			name = "Frieza's Henchman"
			icon = 'Henchman 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 450000
			powerlevel_max = 450000
			ki = 300000
			ki_max = 300000
			kidefense = 350000
			kidefense_max = 350000
			speed = 50000
			strength = 60000
			defence = 45000
			karma = "Evil"
			race = "Henchman"
			level = 3500
			KO = 0
			zenni = 1000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 8000
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25
			ki_res=25
			reflect=25
			weapon=25
			weapon_power=25
			weapon_resistance=25
			movespeed = 2
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Goon_2
			name = "Frieza's Henchman"
			icon = 'Henchman 2.dmi'
			density = 1
			powerlevel = 550000
			powerlevel_max = 550000
			ki = 250000
			ki_max = 250000
			kidefense = 250000
			kidefense_max = 250000
			speed = 5000000
			strength = 85000
			defence = 65000
			karma = "Evil"
			race = "Henchman"
			level = 13500
			zenni = 14000
			pk = 1
			exp = 9500
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25
			ki_res=25
			reflect=25
			weapon=25
			weapon_power=25
			weapon_resistance=25
			movespeed = 2
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Goon_3
			name = "Frieza's Henchman"
			icon = 'Henchman 3.dmi'
			density = 1
			powerlevel = 470000
			powerlevel_max = 470000
			ki = 350000
			ki_max = 350000
			kidefense = 350000
			kidefense_max = 350000
			speed = 5000000
			strength = 650000
			defence = 250000
			karma = "Evil"
			race = "Henchman"
			level = 8500
			zenni = 20000
			pk = 1
			exp = 10000
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25
			ki_res=25
			reflect=25
			weapon=25
			weapon_power=25
			weapon_resistance=25
			movespeed = 4
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		TuffleVillager
			name = "Tuffle"
			icon = 'Bebi - Form 1.dmi'
			density = 1
			powerlevel = 650000000
			powerlevel_max = 650000000
			ki = 250000000
			ki_max = 250000000
			kidefense = 75000000
			kidefense_max = 75000000
			speed = 45000000
			strength = 95000000
			defence = 75000000
			karma = "Good"
			race = "Tuffle"
			level = 50000
			zenni = 12000
			pk = 1
			exp = 37000
			melee=40
			block=40
			dodge=40
			counter=40
			critical=40
			durability=40
			ki_control=40
			ki_cast=40
			ki_power=40
			ki_use=40
			ki_res=40
			reflect=40
			weapon=40
			weapon_power=40
			weapon_resistance=40
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()

		Oozaru_Golden
			name = "Golden Oozaru"
			icon = 'GOozaru (1).dmi'
			density = 1
			powerlevel = 2000000000*10
			powerlevel_max = 2000000000*10
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*10
			kidefense_max = 200000000*10
			speed = 50000
			strength = 500000000*10
			defence = 250000000*10
			karma = "Evil"
			race = "Saiyan"
			level = 4000000
			zenni = 35000
			pk = 1
			exp = 225000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+=new/obj/techs/Overlays/GOozaru_top

		Oozaru
			name = "Oozaru"
			icon = 'Oozaru.dmi'
			density = 1
			powerlevel = 140000000*2
			powerlevel_max = 140000000*2
			ki = 100000000
			ki_max = 100000000
			kidefense = 60000000*2
			kidefense_max = 60000000*2
			speed = 50000
			strength = 50000000*2
			defence = 25000000*2
			karma = "Evil"
			race = "Saiyan"
			level = 80000
			zenni = 100000
			pk = 1
			exp = 75000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+=new/obj/techs/Overlays/Oozaru_top
		/*
		Monster
			name = "Ice Monster"
			icon = 'IceWarrior.dmi'
			density = 1
			powerlevel = 3000000 * 100000
			powerlevel_max = 3000000 * 100000
			ki = 550000 * 100000
			ki_max = 550000 * 100000
			kidefense = 95000 * 100000
			kidefense_max = 95000 * 100000
			speed = 35000 * 100000
			strength = 95000 * 100000
			defence = 95000 * 100000
			karma = "Evil"
			race = "Ice Monster"
			level = 130000
			zenni = 300000
			pk = 1
			exp = 150000
			melee=60
			block=60
			dodge=60
			counter=60
			critical=60
			durability=60
			ki_control=60
			ki_cast=60
			ki_power=60
			ki_use=60
			ki_res=60
			reflect=60
			weapon=60
			weapon_power=60
			weapon_resistance=60
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
*/
		Namekian_1
			name = "Young Namekian"
			icon = 'Namek - Normal.dmi'
			density = 1
			powerlevel = 3000000
			powerlevel_max = 3000000
			ki = 100000
			ki_max = 100000
			kidefense = 310000
			kidefense_max = 310000
			speed = 50000
			strength = 685000
			defence = 345000
			karma = "Good"
			karma_rating = 1
			race = "Namekian"
			level = 40000
			zenni = 16000
			pk = 1
			exp = 30000
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Namekian_2
			name = "Namekian"
			icon = 'Namek - Normal.dmi'
			density = 1
			powerlevel = 100000000*2
			powerlevel_max = 100000000*2
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*2
			kidefense_max = 50000000*2
			speed = 50000
			strength = 40000000*2
			defence = 30000000*2
			karma = "Good"
			race = "Namekian"
			level = 80000
			zenni = 45000
			pk = 1
			exp = 61000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Friza_3
			name = "Friza Third Form"
			icon = 'Frieza3rd.dmi'
			density = 1
			powerlevel = 100000000*4
			powerlevel_max = 100000000*4
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*4
			kidefense_max = 50000000*4
			speed = 50000
			strength = 40000000*4
			defence = 30000000*4
			karma = "Good"
			race = "Namekian"
			level = 110000
			zenni = 65000
			pk = 1
			exp = 73000
			melee=70
			block=70
			dodge=70
			counter=70
			critical=70
			durability=70
			ki_control=70
			ki_cast=70
			ki_power=70
			ki_use=70
			ki_res=70
			reflect=70
			weapon=70
			weapon_power=70
			weapon_resistance=70
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Namekian_3
			name = "Super Namekian"
			icon = 'Namek - Super.dmi'
			density = 1
			powerlevel = 2000000000
			powerlevel_max = 2000000000
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000
			kidefense_max = 200000000
			speed = 50000
			strength = 500000000
			defence = 250000000
			karma = "Good"
			race = "Namekian"
			level = 185000
			zenni = 115000
			pk = 1
			exp = 75000
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Namekian_3_Changling_Mecha
			name = "Mechanical Friza"
			icon = 'Changling - Mecha.dmi'
			density = 1
			powerlevel = 3000000000
			powerlevel_max = 3000000000
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000
			kidefense_max = 200000000
			speed = 50000
			strength = 590000000
			defence = 450000000
			karma = "Evil"
			race = "Changling"
			level = 190000
			zenni = 150000
			pk = 1
			exp = 125000
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Namekian_4_Changeling_Form_6
			name = "Evil Godly Cooler"
			icon = 'Changeling Form 6 V2.dmi'
			density = 1
			powerlevel = 1000000000 * 2000
			powerlevel_max = 1000000000 * 2000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 100
			kidefense_max = 1000000000 * 100
			speed = 50000
			strength = 1000000000 * 100
			defence = 1000000000 * 50
			karma = "Evil"
			race = "Cooler"
			level = 3000000
			zenni = 300000*5
			pk = 1
			exp = 250000*5
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Namekian_4
			name = "Corrupted Namekian"
			icon = 'Namek - Super5.dmi'
			density = 1
			powerlevel = 1000000000 * 3500
			powerlevel_max = 1000000000 * 3500
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 180
			kidefense_max = 1000000000 * 180
			speed = 50000
			strength = 1000000000 * 350
			defence = 1000000000 * 100
			karma = "Evil"
			race = "Namekian"
			level = 3000000
			zenni = 130000*5
			pk = 1
			exp = 450000*6
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		Omega_Fused_Namekian
			name = "Omega Fused Namekian Warrior"
			icon = 'Omega Fused Namekian Warrior.dmi'
			density = 1
			powerlevel = 1000000000 * 3000
			powerlevel_max = 1000000000 * 3000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 180
			kidefense_max = 1000000000 * 180
			speed = 50000
			strength = 1000000000 * 350
			defence = 1000000000 * 100
			karma = "Good"
			race = "Namekian"
			level = 2800000
			zenni = 90000*4
			pk = 1
			exp = 510000*5
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Namekian_Repop.Add(src.type)
						Namekian_Loc.Add(src.initialloc)
				..()
		General_Tao
			name = "General Tao"
			icon = 'General-Tao No robot.dmi'
			density = 1
			powerlevel = 375000
			powerlevel_max = 375000
			ki = 100000
			ki_max = 100000
			kidefense = 65000
			kidefense_max = 65000
			speed = 50000
			strength = 86000
			defence = 70000
			karma = "Evil"
			race = "Android"
			level = 30000
			zenni = 16000
			pk = 1
			exp = 12500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			movespeed = 2
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		General_Tao_2
			name = "Mecha General Tao"
			icon = 'General-Tao Robot.dmi'
			density = 1
			powerlevel = 1550000*2
			powerlevel_max = 1550000*2
			ki = 100000*2
			ki_max = 100000*2
			kidefense = 250000*2
			kidefense_max = 250000*2
			speed = 50000*2
			strength = 486000*2
			defence = 350000*2
			karma = "Evil"
			race = "Android"
			level = 40000
			zenni = 25000
			pk = 1
			exp = 17500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Android_1
			name = "Droid"
			icon = 'AndroidForm2.dmi'
			density = 1
			powerlevel = 1350000*2
			powerlevel_max = 1350000*2
			ki = 100000*2
			ki_max = 100000*2
			kidefense = 150000*2
			kidefense_max = 150000*2
			speed = 50000*2
			strength = 286000*2
			defence = 150000*2
			karma = "Evil"
			race = "Android"
			level = 40000
			zenni = 16000
			pk = 1
			exp = 12500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			movespeed = 2
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Android_2
			name = "Android"
			icon = 'Male - Tan.dmi'
			density = 1
			powerlevel = 100000000*2
			powerlevel_max = 100000000*2
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*2
			kidefense_max = 50000000*2
			speed = 50000
			strength = 40000000*2
			defence = 30000000*2
			karma = "Evil"
			race = "Android"
			level = 80000
			zenni = 75000
			pk = 1
			exp = 50000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Android_3
			name = "Enraged Android 13"
			icon = 'Android 13 2.dmi'
			density = 1
			powerlevel = 100000000*3
			powerlevel_max = 100000000*3
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*3
			kidefense_max = 50000000*3
			speed = 50000
			strength = 40000000*3
			defence = 30000000*3
			karma = "Evil"
			race = "Android"
			level = 100000
			zenni = 20000
			pk = 1
			exp = 61000
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				if(prob(12))
					var/obj/O = new/obj/Equipment/Consumable/MChip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Android_4
			name = "Ultimate Android"
			icon = 'AndroidForm5.dmi'
			density = 1
			powerlevel = 100000000*5
			powerlevel_max = 100000000*5
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*4
			kidefense_max = 50000000*4
			speed = 50000
			strength = 40000000*5
			defence = 30000000*6
			karma = "Evil"
			race = "Android"
			level = 100000
			zenni = 30000
			pk = 1
			exp = 91000
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
			Del()
				if(prob(8))
					var/obj/O = new/obj/Equipment/Consumable/MChip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Saiyan_1
			name = "Saiyan Warrior"
			icon = 'Male - Tan.dmi'
			density = 1
			powerlevel = 300000
			powerlevel_max = 300000
			ki = 100000
			ki_max = 100000
			kidefense = 55000
			kidefense_max = 55000
			speed = 50000
			strength = 80000
			defence = 40000
			karma = "Evil"
			race = "Saiyan"
			level = 28000
			zenni = 1700
			pk = 1
			exp = 23500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			movespeed = 1.5
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+='Hair - Trunks Long.dmi'
		Saiyan_2_Bardockssj1
			name = "Super Saiyan Bardock"
			icon = 'Bardock Ssj Universo 3.dmi'
			density = 1
			powerlevel = 100000000*2.25
			powerlevel_max = 100000000*2.25
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*2.25
			kidefense_max = 50000000*2.25
			speed = 50000
			strength = 40000000*2.25
			defence = 30000000*2.25
			karma = "Evil"
			race = "Saiyan"
			level = 90000
			zenni = 45000
			pk = 1
			exp = 60000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		Saiyan_2
			name = "Super Saiyan"
			icon = 'Male - Tan.dmi'
			density = 1
			powerlevel = 1000000000*10
			powerlevel_max = 1000000000*10
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000*20
			kidefense_max = 1000000000*20
			speed = 50000
			strength = 1000000000*10
			defence = 1000000000*5
			karma = "Evil"
			race = "Saiyan"
			level = 130000
			zenni = 75000*3
			pk = 1
			exp = 64500*6
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+='Hair - Vegeta SSJ.dmi'
		Saiyan_3
			name = "Super Saiyan 3"
			icon = 'Male - Tan.dmi'
			density = 1
			powerlevel = 1000000000*90
			powerlevel_max = 1000000000*90
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000*30
			kidefense_max = 1000000000*30
			speed = 50000
			strength = 1000000000*35
			defence = 1000000000*20
			karma = "Evil"
			race = "Saiyan"
			level = 300000
			zenni = 17500*4
			pk = 1
			exp = 121000*4
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+='Hair - SSJ3.dmi'
		BioAndroid_1
			name = "Bio Android"
			icon = 'Bio Android - Form 1.dmi'
			density = 1
			powerlevel = 50000000
			powerlevel_max = 50000000
			ki = 35000000
			ki_max = 35000000
			kidefense = 8000000
			kidefense_max = 8000000
			speed = 5000000
			strength = 6500000
			defence = 4000000
			karma = "Evil"
			race = "Bio Android"
			level = 40000
			zenni = 16000
			pk = 1
			exp = 12500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Bio_Repop.Add(src.type)
						Bio_Loc.Add(src.initialloc)
				..()
		BioAndroid_2
			name = "Imperfect Bio Android"
			icon = 'Bio Android - Form 2.dmi'
			density = 1
			powerlevel = 100000000*2
			powerlevel_max = 100000000*2
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*2
			kidefense_max = 50000000*2
			speed = 50000
			strength = 40000000*2
			defence = 30000000*2
			karma = "Evil"
			race = "Bio Android"
			level = 80000



			zenni = 75000
			pk = 1
			exp = 60000*3
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Bio_Repop.Add(src.type)
						Bio_Loc.Add(src.initialloc)
				..()
		BioAndroid_3
			name = "Perfect Bio Android"
			icon = 'Bio Android - Form 3.dmi'
			density = 1
			powerlevel = 2000000000*3
			powerlevel_max = 2000000000*3
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*3
			kidefense_max = 200000000*3
			speed = 50000
			strength = 500000000*3
			defence = 250000000*3
			karma = "Evil"
			race = "Bio Android"
			level = 250000
			zenni = 15000
			pk = 1
			exp = 110000
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Bio_Repop.Add(src.type)
						Bio_Loc.Add(src.initialloc)
				..()
		BioAndroid_4
			name = "Power Weighted Bio Android"
			icon = 'Bio Android - Form 4.dmi'
			density = 1
			powerlevel = 2000000000*29
			powerlevel_max = 2000000000*29
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*27
			kidefense_max = 200000000*27
			speed = 50000
			strength = 500000000*30
			defence = 250000000*30
			karma = "Evil"
			race = "Bio Android"
			level = 3000000
			zenni = 70000
			pk = 1
			exp = 265000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Bio_Repop.Add(src.type)
						Bio_Loc.Add(src.initialloc)
				..()
		Kai_1
			name = "Young Kai"
			icon = 'Kai - Form 1.dmi'
			density = 1
			powerlevel = 250000000
			powerlevel_max = 250000000
			ki = 35000000
			ki_max = 35000000
			kidefense = 3500000
			kidefense_max = 3500000
			speed = 5000000
			strength = 6500000
			defence = 4000000
			karma = "Good"
			race = "Kai"
			level = 20000
			zenni = 16000
			pk = 1
			exp = 12500
			melee=30
			block=30
			dodge=30
			counter=30
			critical=30
			durability=30
			ki_control=30
			ki_cast=30
			ki_power=30
			ki_use=30
			ki_res=30
			reflect=30
			weapon=30
			weapon_power=30
			weapon_resistance=30
			movespeed = 3
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Kai_2
			name = "Kai"
			icon = 'Kai - Form 1.dmi'
			density = 1
			powerlevel = 2500000 * 100000
			powerlevel_max = 2500000 * 100000
			ki = 350000 * 10000
			ki_max = 350000 * 10000
			kidefense = 100000 * 10000
			kidefense_max = 100000 * 10000
			speed = 50000 * 10000
			strength = 65000 * 10000
			defence = 45000 * 10000
			karma = "Good"
			race = "Kai"
			level = 80000
			zenni = 75000
			pk = 1
			exp = 60000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Kai_3
			name = "Elder Kai"
			icon = 'Kai - Form 1.dmi'
			density = 1
			powerlevel = 125000000 * 100000
			powerlevel_max = 125000000 * 100000
			ki = 30000000 * 10000
			ki_max = 30000000 * 10000
			kidefense = 12000000 * 10000
			kidefense_max = 12000000 * 10000
			speed = 500000 * 10000
			strength = 650000 * 10000
			defence = 450000 * 10000
			karma = "Good"
			race = "Kai"
			level = 200000
			zenni = 150000
			pk = 1
			exp = 125000
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Kai_4
			name = "Grand Kai"
			icon = 'Kai - Form 1.dmi'
			density = 1
			powerlevel = 5000000 * 10000000
			powerlevel_max = 1000000 * 10000000
			ki = 350000 * 1000000
			ki_max = 350000 * 1000000
			kidefense = 200000 * 1000000
			kidefense_max = 200000 * 1000000
			speed = 120000 * 1000000
			strength = 150000 * 1000000
			defence = 125000 * 1000000
			karma = "Good"
			race = "Kai"
			level = 3000000
			zenni = 300000
			pk = 1
			exp = 250000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Goku_1
			name = "Battle Damaged Goku"
			icon = 'GokuBattleDamaged.dmi'
			powerlevel = 35000
			powerlevel_max = 35000
			ki = 100000
			ki_max = 100000
			kidefense = 5000
			kidefense_max = 5000
			speed = 50000
			strength = 9000
			defence = 6000
			karma = "Good"
			race = "Saiyan"
			level = 20000
			zenni = 2500
			exp = 15000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Majin_1
			name = "Young Majin"
			icon = 'Majin - Form 1.dmi'
			powerlevel = 40000
			powerlevel_max = 40000
			ki = 100000
			ki_max = 100000
			kidefense = 5500
			kidefense_max = 5500
			speed = 50000
			strength = 11500
			defence = 7500
			karma = "Evil"
			race = "Majin"
			level = 20000
			zenni = 2700
			exp = 16000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Majin_2
			name = "Majin"
			icon = 'Majin - Form 3.dmi'
			powerlevel = 2500000000
			powerlevel_max = 2500000000
			ki = 65000000
			ki_max = 65000000
			kidefense = 22500000
			kidefense_max = 22500000
			speed = 12000000
			strength = 12500000
			defence = 12500000
			karma = "Evil"
			race = "Majin"
			level = 80000
			zenni = 25000
			exp = 15000
			melee=35
			block=35
			dodge=35
			counter=35
			critical=35
			durability=35
			ki_control=35
			ki_cast=35
			ki_power=35
			ki_use=35
			ki_res=35
			reflect=35
			weapon=35
			weapon_power=35
			weapon_resistance=35
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Majin_3
			name = "Super Majin"
			icon = 'Majin - Form 4.dmi'
			powerlevel = 2000000000*2
			powerlevel_max = 2000000000*2
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*2
			kidefense_max = 200000000*2
			speed = 50000
			strength = 500000000*2
			defence = 250000000*2
			karma = "Evil"
			race = "Majin"
			level = 225000
			zenni = 65000
			exp = 50000
			melee=60
			block=60
			dodge=60
			counter=60
			critical=60
			durability=60
			ki_control=60
			ki_cast=20
			ki_power=60
			ki_use=60
			ki_res=60
			reflect=60
			weapon=60
			weapon_power=60
			weapon_resistance=60
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Majin_4
			name = "Evil Majin"
			icon = 'Majin - Form 7.dmi'
			powerlevel = 2000000000*26
			powerlevel_max = 2000000000*26
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*25
			kidefense_max = 200000000*25
			speed = 50000
			strength = 500000000*25
			defence = 250000000*25
			karma = "Evil"
			race = "Majin"
			level = 1000000
			zenni = 110000
			exp = 100000
			melee=65
			block=65
			dodge=65
			counter=65
			critical=65
			durability=65
			ki_control=65
			ki_cast=65
			ki_power=65
			ki_use=65
			ki_res=65
			reflect=65
			weapon=65
			weapon_power=65
			weapon_resistance=65
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Majin_5
			name = "Kid Buu"
			icon = 'Majin - Form 5.dmi'
			powerlevel = 2000000000*29
			powerlevel_max = 2000000000*29
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*25
			kidefense_max = 200000000*25
			speed = 50000
			strength = 500000000*25
			defence = 250000000*25
			karma = "Evil"
			race = "Majin"
			level = 3000000
			zenni = 135000
			exp = 700000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Majin_Repop.Add(src.type)
						Majin_Loc.Add(src.initialloc)
				..()
		Tuffle_1
			name = "Young Tuffle"
			icon = 'Bebi - Form 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 10000000
			powerlevel_max = 10000000
			ki = 3000000
			ki_max = 3000000
			kidefense = 950000
			kidefense_max = 950000
			speed = 300000
			strength = 450000
			defence = 250000
			karma = "Evil"
			race = "Tuffle"
			level = 20000
			KO = 0
			zenni = 10000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 7500
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25
			ki_res=25
			reflect=25
			weapon=25
			weapon_power=25
			weapon_resistance=25
			movespeed = 3
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Tuffle_2
			name = "Tuffle"
			icon = 'Bebi - Form 2.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 100000000
			powerlevel_max = 100000000
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000
			kidefense_max = 50000000
			speed = 50000
			strength = 40000000
			defence = 30000000
			karma = "Evil"
			race = "Tuffle"
			level = 80000
			KO = 0
			zenni = 90000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 75000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()

				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Tuffle_3
			name = "Super Tuffle"
			icon = 'Bebi - Form 3.dmi'
			density = 1
			dead = 0
			powerlevel = 2000000000*2
			powerlevel_max = 2000000000*2
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*2
			kidefense_max = 200000000*2
			speed = 50000
			strength = 500000000*2
			defence = 250000000*2
			karma = "Evil"
			race = "Tuffle"
			level = 200000
			KO = 0
			zenni = 20000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 120000
			melee=75
			block=75
			dodge=75
			counter=75
			critical=75
			durability=75
			ki_control=75
			ki_cast=75
			ki_power=75
			ki_use=75
			ki_res=75
			reflect=75
			weapon=75
			weapon_power=75
			weapon_resistance=75
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Tuffle_4
			name = "Ultra Tuffle"
			icon = 'Bebi - Form 3.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 2000000000*27
			powerlevel_max = 2000000000*27
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*27
			kidefense_max = 200000000*27
			speed = 50000
			strength = 500000000*27
			defence = 250000000*27
			karma = "Evil"
			race = "Tuffle"
			level = 2000000
			KO = 0
			zenni = 50000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 250000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Misc_Repop.Add(src.type)
						Misc_Loc.Add(src.initialloc)
				..()
		Saiyan_4
			name = "Super Saiyan 4"
			icon = 'Male - SSJ 4.dmi'
			density = 1
			powerlevel = 1000000000*200
			powerlevel_max = 1000000000*200
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000*50
			kidefense_max = 1000000000*50
			speed = 50000
			strength = 1000000000*50
			defence = 1000000000*30
			karma = "Evil"
			race = "Saiyan"
			level = 500000
			zenni = 30000*4
			pk = 1
			exp = 175000*5
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+='Hair - SSJ4.dmi'


		Saiyan_SSJ5
			name = "Super Saiyan 5"
			icon = 'Male - SSJ 5.dmi'
			density = 1
			powerlevel = 1000000000*400
			powerlevel_max = 1000000000*400
			ki = 200000000
			ki_max = 200000000  //259,262,414,848
			kidefense = 1000000000*100
			kidefense_max = 1000000000*100
			speed = 50000
			strength = 1000000000*70
			defence = 1000000000*50
			karma = "Evil"
			race = "Saiyan"
			level = 750000
			zenni = 36000*4
			pk = 1
			exp = 195000*9
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						NewSaiyan_Repop.Add(src.type)
						NewSaiyan_Loc.Add(src.initialloc)
				..()
			New()
				..()
				src.overlays+='Hair - SSJ4(fused).dmi'
		/*
		Sand_Reaper
			name = "Sand Reaper"
			icon = 'SandTrooper.dmi'
			density = 1
			powerlevel = 8000000 * 1000000
			powerlevel_max = 3000000 * 1000000
			ki = 650000 * 1000000
			ki_max = 650000 * 1000000
			kidefense = 420000 * 1000000
			kidefense_max = 420000 * 1000000
			speed = 120000 * 1000000
			strength = 450000 * 1000000
			defence = 425000 * 1000000
			karma = "Evil"
			race = "Did You Just Assume My Race?"
			level = 3000000
			zenni = 3000000
			pk = 1
			exp = 5000000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
	*/
		Saiyan_5
			name = "Super Saiyan God"
			icon = 'SSJ_8.dmi'
			density = 1
			powerlevel = 1000000000 * 23000
			powerlevel_max = 1000000000 * 23000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 10000
			kidefense_max = 1000000000 * 10000
			speed = 50000
			strength = 1000000000 * 8500
			defence = 1000000000 * 9000
			karma = "Evil"
			race = "Saiyan"
			level = 3000000
			zenni = 400000*3
			pk = 1
			exp = 3500000*5
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		VegetaSSJGod
			name = "Vegeta SSJ God"
			icon = 'VegetaSSGodSSred.dmi'
			density = 1
			it_blocked = 1
			powerlevel = 1000000000 * 20000
			powerlevel_max = 1000000000 * 20000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 8000
			kidefense_max = 1000000000 * 8000
			speed = 50000
			strength = 1000000000 * 8500
			defence = 1000000000 * 6000
			karma = "Good"
			race = "Saiyan"
			level = 30000000
			zenni = 225000*5
			pk = 1
			exp = 3000000*5
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
			Del()
				/*
				if(prob(1))
					var/ran2 = rand(1,100)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/PMEXP_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PMSTT_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/PMZ_Shard
						O.loc = src.loc
						*/
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		GohanSSJM
			name = "Mystic Super Saiyan Gohan"
			icon = 'MysticGohanSsj.dmi'
			density = 1
			powerlevel = 1000000000 * 1800
			powerlevel_max = 1000000000 * 1800
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 200
			kidefense_max = 1000000000 * 200
			speed = 50000
			strength = 1000000000 * 400
			defence = 1000000000 * 100
			karma = "Good"
			race = "Saiyan"
			level = 3000000
			zenni = 110000*3
			pk = 1
			exp = 200000*5
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
			Del()
				/*
				if(prob(1))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/MKIDEF_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MSTR_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDEF_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
						*/
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		Majin_Abs_Pic
			name = "Piccolo Absorbed Buu"
			icon = 'Buu with Piccolo Absorbed.dmi'
			density = 1
			powerlevel = 1000000000 * 1400
			powerlevel_max = 1000000000 * 1400
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 500
			kidefense_max = 1000000000 * 500
			speed = 50000
			strength = 1000000000 * 400
			defence = 1000000000 * 500
			karma = "Evil"
			race = "Majin"
			level = 3000000
			zenni = 65000*5
			pk = 1
			exp = 220000*5
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
			Del()


				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		GokuSSJRose
			name = "Goku SSJ Rose"
			icon = 'Black (Super Saiyan Rose) 2.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 10000
			powerlevel_max = 1000000000 * 10000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 2000
			kidefense_max = 1000000000 * 2000
			speed = 50000
			strength = 1000000000 * 4500
			defence = 1000000000 * 3000
			karma = "Evil"
			race = "Saiyan"
			level = 300000000
			zenni = 550000*5
			pk = 1
			exp = 2500000*5
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
			weapon_power=85
			weapon_resistance=100
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Rose_Repop.Add(src.type)
						Rose_Loc.Add(src.initialloc)
				..()
		Super_GODLY_Frieza
			name = "Ascended Frieza"
			icon = 'Changling - Form 4 100 blue.dmi'
			density = 1
			powerlevel = 1000000000 * 3000
			powerlevel_max = 1000000000 * 3000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 400
			kidefense_max = 1000000000 * 400
			speed = 50000
			strength = 1000000000 * 700
			defence = 1000000000 * 300
			karma = "Evil"
			race = "Reaper"
			level = 3000000
			zenni = 400000*3
			pk = 1
			exp = 1550000 * 3
			melee=75
			block=75
			dodge=75
			counter=75
			critical=75

			durability=75
			ki_control=75
			ki_cast=75
			ki_power=75
			ki_use=75
			ki_res=75
			reflect=75
			weapon=75
			weapon_power=100
			weapon_resistance=100
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		Angel_1
			name = "Lesser Angel"
			icon = 'Male - White.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 300000
			powerlevel_max = 300000
			ki = 100000
			ki_max = 100000
			kidefense = 50000
			kidefense_max = 50000
			speed = 50000
			strength = 85000
			defence = 45000
			karma = "Good"
			karma_rating= 1
			race = "Angel"
			level = 20000
			KO = 0
			zenni = 25000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 20000
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25
			ki_res=25
			reflect=25
			weapon=2
			weapon_power=25
			weapon_resistance=25
			movespeed = 2
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Angel_Repop.Add(src.type)
						Angel_Loc.Add(src.initialloc)
				..()
			New()
	//			//src.Item_Drop()
				..()
				src.overlays+='Halo.dmi'
				src.overlays+='Black Gi.dmi'
		Angel_2
			name = "Angel"
			icon = 'Male - White.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 200000000
			powerlevel_max = 200000000
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000
			kidefense_max = 50000000
			speed = 50000
			strength = 60000000
			defence = 30000000
			karma = "Good"
			karma_rating= 1
			race = "Angel"
			level = 60000
			KO = 0
			zenni = 80000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 75000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Angel_Repop.Add(src.type)
						Angel_Loc.Add(src.initialloc)
				..()
			New()
	//			//src.Item_Drop()
				..()
				src.overlays+='Halo.dmi'
				src.overlays+='Black Gi.dmi'

		Angel_3
			name = "Arch Angel"
			icon = 'Male - White.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 100000000*15
			powerlevel_max = 100000000*15
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*15
			kidefense_max = 50000000*15
			speed = 50000
			strength = 40000000*15
			defence = 30000000*15
			karma = "Good"
			karma_rating= 1
			race = "Angel"
			level = 180000
			KO = 0
			zenni = 200000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 140000
			melee=75
			block=75
			dodge=75
			counter=75
			critical=75
			durability=75
			ki_control=75
			ki_cast=75
			ki_power=75
			ki_use=75
			ki_res=75
			reflect=75
			weapon=75
			weapon_power=75
			weapon_resistance=75
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Angel_Repop.Add(src.type)
						Angel_Loc.Add(src.initialloc)
				..()
			New()
	//			//src.Item_Drop()
				..()
				src.overlays+='Halo.dmi'
				src.overlays+='Black Gi.dmi'
				src.overlays+='Black Cape.dmi'
		Angel_4
			name = "Michael"
			icon = 'Male - White.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 100000000*25
			powerlevel_max = 100000000*25
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*25
			kidefense_max = 50000000*25
			speed = 50000
			strength = 40000000*25
			defence = 30000000*25
			karma = "Good"
			karma_rating= 1
			race = "Angel"
			level = 3000000
			KO = 0
			zenni = 20000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 254000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Angel_Repop.Add(src.type)
						Angel_Loc.Add(src.initialloc)
				..()
			New()
	//			//src.Item_Drop()
				..()
				src.overlays+='Halo.dmi'
				src.overlays+='Black Gi.dmi'
				src.overlays+='Black Cape.dmi'
		Demon_1
			name = "Lesser Demon"
			icon = 'Demon - Form 1.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 310000
			powerlevel_max = 310000
			ki = 100000
			ki_max = 100000
			kidefense = 50000
			kidefense_max = 50000
			speed = 50000
			strength = 85000
			defence = 45000
			karma = "Evil"
			race = "Demon"
			level = 20000
			KO = 0
			zenni = 25000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 15000
			melee=25
			block=25
			dodge=25
			counter=25
			critical=25
			durability=25
			ki_control=25
			ki_cast=25
			ki_power=25
			ki_use=25

			ki_res=25
			reflect=25
			weapon=25
			weapon_power=25
			weapon_resistance=25
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Demon_Repop.Add(src.type)
						Demon_Loc.Add(src.initialloc)
				..()
		Demon_2
			name = "Demon"
			icon = 'Demon - Form 2.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 110000000
			powerlevel_max = 110000000
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000
			kidefense_max = 50000000
			speed = 50000
			strength = 40000000
			defence = 30000000
			karma = "Evil"
			race = "Demon"
			level = 60000
			KO = 0
			zenni = 10000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 77000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Demon_Repop.Add(src.type)
						Demon_Loc.Add(src.initialloc)
				..()
		Demon_3
			name = "Greater Demon"
			//icon = 'DemonWarrior.dmi'
			icon = 'Changling - Form 11 Blue.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 100000000*12
			powerlevel_max = 100000000*12
			ki = 100000000
			ki_max = 100000000
			kidefense = 50000000*12
			kidefense_max = 50000000*12
			speed = 50000
			strength = 40000000*12
			defence = 30000000*12
			karma = "Evil"
			race = "Demon"
			level = 180000
			KO = 0
			zenni = 20000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 100000
			melee=75
			block=75
			dodge=75
			counter=75
			critical=75
			durability=75
			ki_control=75
			ki_cast=75
			ki_power=75
			ki_use=75
			ki_res=75
			reflect=75
			weapon=75
			weapon_power=75
			weapon_resistance=75
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Demon_Repop.Add(src.type)
						Demon_Loc.Add(src.initialloc)
				..()

		Demon_3_V2
			name = "Undead Knight"
			//icon = 'UndeadKnight.dmi'
			icon = 'Changling - Form 11 Blue.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 2000000000*3
			powerlevel_max = 2000000000*3
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*4
			kidefense_max = 200000000*4
			speed = 50000
			strength = 500000000*3
			defence = 250000000*2
			karma = "Evil"
			race = "Demon"
			level = 210000
			KO = 0
			zenni = 30000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 500000
			melee=75
			block=75
			dodge=75
			counter=75
			critical=75
			durability=75
			ki_control=75
			ki_cast=75
			ki_power=75
			ki_use=75
			ki_res=75
			reflect=75
			weapon=75
			weapon_power=75
			weapon_resistance=75
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Demon_Repop.Add(src.type)
						Demon_Loc.Add(src.initialloc)
				..()
		Demon_4
			name = "Janemba"
			icon = 'Janemba.dmi'
			density = 1
			dead = 0
			safe = 0
			powerlevel = 2000000000*10
			powerlevel_max = 2000000000*10
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000*10
			kidefense_max = 200000000*10
			speed = 50000
			strength = 500000000*15
			defence = 250000000*10
			karma = "Evil"
			race = "Demon"
			level = 2000000
			KO = 0
			zenni = 75000
			frozen = 0
			cooldown = 0
			pk = 1
			exp = 250000
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
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Demon_Repop.Add(src.type)
						Demon_Loc.Add(src.initialloc)
				..()
		Dragon_1
			name = "Dragon"
			icon = 'Shenron level 9 - Green.dmi'
			density = 1
			powerlevel = 1000000000 * 1500
			powerlevel_max = 1000000000 * 1500
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 200
			kidefense_max = 1000000000 * 200
			speed = 50000
			strength = 1000000000 * 350
			defence = 1000000000 * 100
			karma = "Evil"
			race = "Dragon"
			level = 3000000
			zenni = 75000*5
			pk = 1
			exp = 480000*5
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
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Dragon_Repop.Add(src.type)
						Dragon_Loc.Add(src.initialloc)
				..()
		Dragon_2
			name = "Infernal Dragon"
			icon = 'Infernal Dragon.dmi'
			icon_state = ""
			density = 1
			powerlevel = 1000000000 * 2000
			powerlevel_max = 1000000000 * 2000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 240
			kidefense_max = 1000000000 * 240
			speed = 50000
			strength = 1000000000 * 425
			defence = 1000000000 * 150
			karma = "Evil"
			race = "Dragon"
			level = 3000000
			zenni = 100000*5
			pk = 1
			exp = 750000*4
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
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Dragon_Repop.Add(src.type)
						Dragon_Loc.Add(src.initialloc)
				..()

		Dragon_3
			name = "Lacerating Dragon"
			icon = 'Desolate Dragon GR.dmi'
			icon_state = ""
			density = 1
			powerlevel = 1000000000 * 2600
			powerlevel_max = 1000000000 * 2600
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 300
			kidefense_max = 1000000000 * 300
			speed = 50000
			strength = 1000000000 * 550
			defence = 1000000000 * 250
			karma = "Evil"
			race = "Dragon"
			level = 6666660
			zenni = 150000*5
			pk = 1
			exp = 1000000*5
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
			Del()
				//src.Item_Drop()


				if(!halt_repop)
					if(!horde_mob)
						Dragon_Repop.Add(src.type)
						Dragon_Loc.Add(src.initialloc)
				..()
		Dragon_4
			name = "Celestial Dragon"
			icon = 'CelestialDragonMob.dmi'
			icon_state = ""
			density = 1
			it_blocked = 1
			powerlevel = 1000000000 * 3000
			powerlevel_max = 1000000000 * 3000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 400
			kidefense_max = 1000000000 * 400
			speed = 50000
			strength = 1000000000 * 700
			defence = 1000000000 * 300
			karma = "Evil"
			race = "Dragon"
			level = 3000000
			zenni = 175000*5
			pk = 1
			boss = 1
			exp = 1250000*5
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
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Dragon_Repop.Add(src.type)
						Dragon_Loc.Add(src.initialloc)
				..()
		Mewtwo
			name = "Mewtwo"
			icon = 'mewtwo.dmi'
			icon_state = ""
			density = 1
			it_blocked = 1
			powerlevel = 1000000000 * 20000
			powerlevel_max = 1000000000 * 20000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 100
			kidefense_max = 1000000000 * 100
			speed = 50000
			strength = 1000000000 * 4500
			defence = 1000000000 * 200
			karma = "Evil"
			race = "Pokemon"
			level = 3000000
			zenni = 250000
			pk = 1
			boss = 1
			exp = 20000000
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

	//	Unused Mobs

		TigerMan
			name = "TigerMan"
			icon = 'NPCs3.dmi'
			icon_state = "TigerMan"
			density = 1
			powerlevel = 90000000
			powerlevel_max = 90000000
			ki = 88000000
			kidefense = 88000000
			speed = 2500
			strength = 85000000
			defence = 85000000
			karma = "Good"
			race = "Hybrid"
			level = 600
			zenni = 24000
			tp = 200
			pk = 1
			exp = 3000
	/*		Del()
				if(prob(13))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MStr_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDef_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MKiDef_Shard
						O.loc = src.loc
				..()*/
		/*
		Vegito
			name = "Vegito"
			icon = 'NPCs3.dmi'
			icon_state = "Vegito"
			density = 1
			powerlevel = 5000000 * 1000
			powerlevel_max = 5000000 * 1000
			ki = 5000000 * 1000
			ki_max = 5000000 * 1000
			speed = 5500
			strength = 5000000 * 1000
			strength_max = 5000000 * 1000
			defence = 5000000 * 1000
			defence_max = 5000000 * 1000
			kidefense = 5000000 * 1000
			kidefense_max = 5000000 * 1000
			karma = "Good"
			race = "Saiyan"
			level = 50000
			tp = 10000
			pk = 1
			exp = 10000
			zenni = 300000
	/*		Del()
				if(prob(8))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/KI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/Str_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/Def_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/KiDef_Shard
						O.loc = src.loc
				..()*/
		Gotenks
			name = "Gotenks"
			icon = 'NPCs3.dmi'
			icon_state = "Gotenks"
			density = 1
			powerlevel = 2500000 * 1000
			powerlevel_max = 2500000 * 1000
			ki = 2500000 * 1000
			ki_max = 2500000 * 1000
			speed = 5500
			strength = 2500000 * 1000
			strength_max = 2500000 * 1000
			defence = 2500000 * 1000
			defence_max = 2500000 * 1000
			kidefense = 2500000 * 1000
			kidefense_max = 2500000 * 1000
			karma = "Good"
			race = "Saiyan"
			level = 15000
			zenni = 250000
			tp = 8000
			pk = 1
			exp = 7500
	/*		Del()
				if(prob(3))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/KI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/Str_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/Def_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/KiDef_Shard
						O.loc = src.loc
				..()*/

		Cell
			name = "Cell"
			icon = 'NPCs3.dmi'
			icon_state = "Cell"
			density = 1
			powerlevel = 4350000
			powerlevel_max = 4350000
			ki = 100000
			ki_max = 100000
			kidefense = 550000
			kidefense_max = 550000
			speed = 50000
			strength = 686000
			defence = 250000

			karma = "Good"
			race = "Saiyan"
			level = 15000
			zenni = 250000
			tp = 8000
			pk = 1
			exp = 7500
	/*		Del()
				if(prob(8))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/KI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/PL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/Str_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/Def_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/KiDef_Shard
						O.loc = src.loc
				..()*/
		Vegito2
			name = "Vegito SSJ"
			icon = 'NPCs3.dmi'
			icon_state = "Vegito2"
			density = 1
			powerlevel = 5000000 * 100000
			powerlevel_max = 5000000 * 100000
			ki = 5000000 * 100000
			ki_max = 5000000 * 100000
			speed = 5500
			strength = 5000000 * 100000
			strength_max = 5000000 * 100000
			defence = 5000000 * 100000
			defence_max = 5000000 * 100000
			kidefense = 5000000 * 100000
			kidefense_max = 5000000 * 100000
			karma = "Good"
			race = "Saiyan"
			level = 100000
			zenni = 20000000
			tp = 50000
			pk = 1
			exp = 50000
	/*		Del()
				if(prob(8))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/LKI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/LPL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/LStr_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/LDef_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/LKiDef_Shard
						O.loc = src.loc
				..()*/
		Robot
			name = "Robot #1"
			icon = 'NPCs3.dmi'
			icon_state = "Bot"
			density = 1
			powerlevel = 3000000
			powerlevel_max = 3000000
			ki = 2800000
			kidefense = 2800000
			speed = 5500
			strength = 2500000
			defence = 2500000
			karma = "Evil"
			race = "Robot"
			level = 600
			zenni = 4000
			tp = 20
			pk = 1
			exp = 350
		Robot2
			name = "Robot #2"
			icon = 'NPCs3.dmi'
			icon_state = "Bot2"
			density = 1
			powerlevel = 6000000
			powerlevel_max = 6000000
			ki = 5800000
			kidefense = 5800000
			speed = 5500
			strength = 5500000
			defence = 5500000
			karma = "Evil"
			race = "Robot"
			level = 600
			zenni = 6000
			tp = 35
			pk = 1
			exp = 500
		Robot3
			name = "Robot #3"
			icon = 'NPCs3.dmi'
			icon_state = "Bot3"
			density = 1
			powerlevel = 15000000
			powerlevel_max = 15000000
			ki = 18000000
			kidefense = 18000000
			speed = 5500
			strength = 20000000
			defence = 20000000
			karma = "Evil"
			race = "Robot"
			level = 600
			zenni = 10000
			tp = 65
			pk = 1
			exp = 800
		Robot4
			name = "Robot #4"
			icon = 'NPCs3.dmi'
			icon_state = "Bot4"
			density = 1
			powerlevel = 30000000
			powerlevel_max = 30000000
			ki = 28000000
			kidefense = 28000000
			speed = 5500
			strength = 25000000
			defence = 25000000
			karma = "Evil"
			race = "Robot"
			level = 600
			zenni = 20000
			tp = 135
			pk = 1
			exp = 1250
	/*		Del()
				if(prob(13))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MStr_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDef_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MKiDef_Shard
						O.loc = src.loc
				..()*/
		Robot5
			name = "Robot #5"
			icon = 'NPCs3.dmi'
			icon_state = "Bot5"
			density = 1
			powerlevel = 150000000
			powerlevel_max = 150000000
			ki = 130000000
			kidefense = 130000000
			speed = 5500
			strength = 120000000
			defence = 120000000
			karma = "Evil"
			race = "Robot"
			level = 600
			zenni = 100000
			tp = 450
			pk = 1
			exp = 2000
	/*		Del()
				if(prob(14))
					var/ran2 = rand(1,5)
					if(ran2 == 1)
						var/obj/O = new/obj/Equipment/Buff_Items/MKI_Shard
						O.loc = src.loc
					if(ran2 == 2)
						var/obj/O = new/obj/Equipment/Buff_Items/MPL_Shard
						O.loc = src.loc
					if(ran2 == 3)
						var/obj/O = new/obj/Equipment/Buff_Items/MStr_Shard
						O.loc = src.loc
					if(ran2 == 4)
						var/obj/O = new/obj/Equipment/Buff_Items/MDef_Shard
						O.loc = src.loc
					if(ran2 == 5)
						var/obj/O = new/obj/Equipment/Buff_Items/MKiDef_Shard
						O.loc = src.loc
				..()*/
				*/
		Brolly
			name = "Brolly"
			icon = 'BrolySS1.dmi'
			density = 1
			powerlevel = 1000000000 * 4000
			powerlevel_max = 1000000000 * 4000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 500
			kidefense_max = 1000000000 * 500
			speed = 50000
			strength = 1000000000 * 500
			defence = 1000000000 * 400
			karma = "Evil"
			race = "Saiyan"
			level = 300000
			zenni = 145000*5
			pk = 1
			exp = 150000*7
			melee=80
			block=80
			dodge=80
			counter=80
			critical=80
			durability=80
			ki_control=80
			ki_cast=80
			ki_power=80
			ki_use=80
			ki_res=80
			reflect=80
			weapon=80
			weapon_power=80
			weapon_resistance=80
			Del()
				//src.Item_Drop()
				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()

		BrollySSJGod
			name = "Brolly SSJ God"
			icon = 'BrolySSGod.dmi'
			icon_state = "BrollySSJGod"
			density = 1
			it_blocked = 1
			powerlevel = 1000000000 * 16000
			powerlevel_max = 1000000000 * 16000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 15000
			kidefense_max = 1000000000 * 15000
			speed = 50000
			strength = 1000000000 * 9000
			defence = 1000000000 * 10000
			karma = "Evil"
			race = "Saiyan"
			level = 30000000
			zenni = 300000*4
			pk = 1
			exp = 5000000*3
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
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		Goku_UI
			name = "Ultra Instinct Goku"
			icon = 'Ultra Instinct Goku Battle Damaged By Broken.dmi'
			density = 1
			it_blocked = 1
			powerlevel = 1000000000 * 45000
			powerlevel_max = 1000000000 * 45000
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 16000
			kidefense_max = 1000000000 * 16000
			speed = 50000
			strength = 1000000000 * 11000
			defence = 1000000000 * 13000
			karma = "Good"
			race = "Saiyan"
			level = 30000000
			zenni = 400000*4
			pk = 1
			exp = 4000000*5
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
			Del()
				//src.Item_Drop()

				if(!halt_repop)
					if(!horde_mob)
						Saiyan_Repop.Add(src.type)
						Saiyan_Loc.Add(src.initialloc)
				..()
		Droid13
			name = "Android 13"
			icon = 'NPCs.dmi'
			icon_state = "13"
			density = 1
			powerlevel = 2000000000
			powerlevel_max = 2000000000
			ki = 200000000
			ki_max = 200000000
			kidefense = 200000000
			kidefense_max = 200000000
			speed = 50000
			strength = 500000000*3
			defence = 250000000*2
			karma = "Evil"
			race = "Android"
			level = 80000
			zenni = 75000
			pk = 1
			exp = 55000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Droid14
			name = "Android 14"
			icon = 'NPCs.dmi'
			icon_state = "14"
			density = 1
			powerlevel = 2500000 * 10000
			powerlevel_max = 2500000 * 10000
			ki = 350000 * 10000
			ki_max = 350000 * 10000
			kidefense = 300000 * 10000
			kidefense_max = 300000 * 10000
			speed = 50000 * 10000
			strength = 65000 * 10000
			defence = 45000 * 10000
			karma = "Evil"
			race = "Android"
			level = 80000
			zenni = 75000
			pk = 1
			exp = 60000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()
		Droid15
			name = "Android 15"
			icon = 'NPCs.dmi'
			icon_state = "15"
			density = 1
			powerlevel = 2500000 * 10000
			powerlevel_max = 2500000 * 10000
			ki = 350000 * 10000
			ki_max = 350000 * 10000
			kidefense = 300000 * 10000
			kidefense_max = 300000 * 10000
			speed = 50000 * 10000
			strength = 65000 * 10000
			defence = 45000 * 10000
			karma = "Evil"
			race = "Android"
			level = 80000
			zenni = 75000
			pk = 1
			exp = 60000
			melee=50
			block=50
			dodge=50
			counter=50
			critical=50
			durability=50
			ki_control=50
			ki_cast=50
			ki_power=50
			ki_use=50
			ki_res=50
			reflect=50
			weapon=50
			weapon_power=50
			weapon_resistance=50
			Del()
				if(prob(10))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				if(!halt_repop)
					if(!horde_mob)
						Android_Repop.Add(src.type)
						Android_Loc.Add(src.initialloc)
				..()





	/*
		proc
			SagaPowerUp()
				if(src.powering)
					if(src.powerlevel>=src.powerlevel_max)
						src.powerlevel=src.powerlevel_max
					if(src.ki>=src.ki_max)
						src.ki=src.ki_max
					if(src.powerlevel>=src.powerlevel_max&&src.ki>=src.ki_max)
						src.powering=0
						src.doing=0
						src.frozen=0
						src.power_delay=0
						src.overlays-='Full Aura.dmi'
						return
					else
						spawn(25)src.SagaPowerUp()
					src.powerlevel+=src.powerlevel_max*0.15
					src.ki+=src.ki_max*0.15
					if(src.powerlevel>=src.powerlevel_max&&src.ki>=src.ki_max)
						src.powerlevel=src.powerlevel_max
						src.ki=src.ki_max
						src.powering=0
						src.doing=0
						src.power_delay=0
						src.frozen=0
						src.overlays-='Full Aura.dmi'
						return
					else
						spawn(25)src.SagaPowerUp()
			SagaAI()
				spawn while(src)
					if(src.powerlevel<=src.powerlevel_max*0.20||src.ki<=src.ki_max*0.15)
						if(!src.powering)
							if(src.power_delay)
								return
							if(src.doing)
								return
							src.power_delay=1
							src.powering=1
							src.doing=1
							src.frozen=1
							src.overlays+='Full Aura.dmi'
							spawn(20)
								src.SagaPowerUp()
					if(prob(5))
						if(!src.doing)
							if(src.dir==NORTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==src.x&&M.y>src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==SOUTH)
								for(var/mob/PC/M in oview(8))
									if(M.x==src.x&&M.y<src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==EAST)
								for(var/mob/PC/M in oview(8))
									if(M.x>src.x&&M.y==src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
							if(src.dir==WEST)
								for(var/mob/PC/M in oview(8))
									if(M.x<src.x&&M.y==src.y)
										if(src.has_beam!=0)
											if(src.ki>=5000)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: [src.beam_txt]!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
										else
											if(src.ki>=500)
												src.doing=1
												src.frozen=1
												view(8)<<"[src]: HA!"
												var/obj/Tech/BeamH/A=new
												spawn(5)
													A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
					sleep(30)*/


	NPC
		Dead_Namek
			name = "{NPC}Dead Namek"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Namek"
			density = 0
			dead = 1
			safe = 1
	NPC
		Dead_Henchman
			name = "{NPC}Dead Henchman"
			icon = 'NPCs2.dmi'
			icon_state = "Dying Hench"
			density = 0
			dead = 1
			safe = 1
	NPC
		Bodyguard
			name = "{NPC}Frieza's Bodyguard"
			icon = 'NPCs2.dmi'
			icon_state = "Henchman"
			density = 1
			dead = 1
			safe = 1


mob
	var
		sleeping=1
		mob/PC/AITarget
		initialx
		initialy
		initialz
		turf/initialloc
		respawn_time=600
		horde_mob=0
		boss=0
		movespeed = 1


mob/PC
	TESTnpcOne
		icon = 'Male - SSJ17.dmi'
		name = "Test NPC 1"
		level = 10000

	TESTnpcTwo
		icon = 'Male - SSJ18.dmi'
		name = "Test NPC 2"
		level = 100000



mob/Monster/Dummy
	Dummy
		name = "Nappa Test Dummy"
		icon = 'EarthMonsters.dmi'
		icon_state = "Nappa"
		safe = 0
		density = 1
		powerlevel = 10000000 * 1000000
		powerlevel_max = 10000000 * 1000000
		ki = 350000 * 10000
		ki_max = 350000 * 10000
		kidefense = 300000 * 10000
		kidefense_max = 300000 * 10000
		speed = 50000 * 10000
		strength = 0
		defence = 0
		karma = "Evil"
		race = "Dummy"
		level = 1
		zenni = 0
		pk = 1
		exp = 0
		melee=50
		block=100
		dodge=100
		counter=100
		critical=100
		durability=100
		ki_control=50
		ki_cast=50
		ki_power=50
		ki_use=50
		ki_res=100
		reflect=50
		weapon=50
		weapon_power=50
		weapon_resistance=100