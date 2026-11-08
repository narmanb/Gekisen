turf
	turf/DenseTile
		density = 1
	outside
		density=0
		icon='nameturfs.dmi'
		grass/icon_state="grass"
	terrain
		density=0
		icon='turfs23.dmi'
		icon_state="12,2"
	water
		icon='nameturfs.dmi'
		icon_state="water"
		density=1

	dungeonwall
		density=1
		icon='dungeon turf.dmi'
		northwall1/icon_state="northwall1"
		northwall2/icon_state="northwall2"
		eastwall1/icon_state="eastwall"
		westwall1/icon_state="westwall1"


	dungeonfloor
		density=0
		icon='dungeonfloor.dmi'
		tile1/icon_state="tile1"


obj
	stairs
		density=0
		icon='stairs.dmi'
		stairs/icon_state="stair"

	grounditems
		density=0
		icon='dungeonfloor.dmi'
		stone1/icon_state="stone1"
		stone2/icon_state="stone2"
		bones1/icon_state="bones1"
		bones2/icon_state="bones2"

	wallitems
		density=1
		icon='dungeon turf.dmi'
		torch/icon_state="torch"
		torch2/icon_state="torch2"


	overlay
		density=0
		icon='overlay.dmi'
		overlay/icon_state="1"
		layer= FLOAT_LAYER
obj
	turfs
		density=0
		icon='pokemon turf.dmi'
		bush/icon_state="F1"
	bush
		icon='12.dmi'
		plant/icon_state="e"
		density=0
	treez
		icon='trees23.dmi'
		icon_state="21"
	path
		density=0
		icon='path.dmi'
		icon_state="top"


obj
	overlay
		density=0
		icon='overlay.dmi'
		overlay/icon_state="1"
		layer= FLOAT_LAYER

obj
	dungeonwallitems
		density=1
		icon='dungeon turf.dmi'
		torch/icon_state="torch"
		torch2/icon_state="torch2"
	Beerustree
		density=0
		icon='giant tree.dmi'
		beerustree/icon_state="tree"
	cavecliff
		density=1
		icon='poketurfs.dmi'
		icon_state="newgym7"
	ground
		density=1
		icon='turfs211.dmi'
		icon_state="2"
	trees
		density=1
		icon='trees.dmi'
		icon_state="d4"
	bushes
		density=1
		icon='bush.dmi'
		icon_state="stationary"
	chopped
		density=1
		icon='chopped.dmi'
		icon_state="1"
	flower
		density=0
		icon='flower.dmi'
		icon_state="1"
	tree
		density=0
		icon='tree1.dmi'
		icon_state="stationary"
mob/NPC
	Ness
		icon='lapras2.dmi'
		density = 0
		it_blocked = 1

		New()
			spawn()src.WanderNess()
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
	/*
turf

	Floors
		Void_Zone
			density = 1
			opacity = 1
			Enter(mob/PC/M)
				if(istype(M,/mob/PC))
					return
				else
					return
mob/PC

mob
*/

mob/Monster
	BeerusMobs
		GokuSSJBlue
			name = "Goku SSJ Blue"
			icon = 'Male - Tan.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 250
			powerlevel_max = 1000000000 * 250
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 15
			kidefense_max = 1000000000 * 15
			speed = 50000
			strength = 1000000000 * 1100
			defence = 1000000000 * 22

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
			respawn = 2000
			Del()
				src.Item_Drop_Beerus()
				if(prob(0.5))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()


			New()
				..()
				src.overlays+='gokublue.dmi'
				src.overlays+='Goku Whis Suit.dmi'
				frozen = 1
				spawn(rand(35,43)) frozen = 0
		GokuSSJGod
			name = "Goku SSJ God"
			icon = 'Goku Super Saiyan God.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 250
			powerlevel_max = 1000000000 * 250
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 15
			kidefense_max = 1000000000 * 15
			speed = 50000
			strength = 1000000000 * 1100
			defence = 1000000000 * 20
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
			respawn = 2000
			Del()
				src.Item_Drop_Beerus()
				if(prob(0.5))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()
			New()

				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()

		MechikaburaDemon
			name = "Mechikabura Demon"
			icon = 'Demon Race Trans.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 250
			powerlevel_max = 1000000000 * 250
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 15
			kidefense_max = 1000000000 * 15
			speed = 50000
			strength = 1000000000 * 1100
			defence = 1000000000 * 15
			karma = "Evil"
			race = "Demon"
			level = 300000000
			zenni = 550000*5
			pk = 1
			exp = 2700000*5
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
			respawn = 2000
			Del()
				src.Item_Drop_Beerus()
				if(prob(0.5))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()
			New()

				src.overlays+='Hair_-_Vegeta_Super_Saiyan_-_Ruination_DT.dmi'
				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()
		Monaka
			name = "Monaka"
			icon = 'Base Monaka.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 250
			powerlevel_max = 1000000000 * 250
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 15
			kidefense_max = 1000000000 * 15
			speed = 50000
			strength = 1000000000 * 1100
			defence = 1000000000 * 10
			karma = "Evil"
			race = "Alien"
			level = 200000000
			zenni = 500000*5
			pk = 1
			exp = 2400000*5
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
			respawn = 2000
			Del()
				src.Item_Drop_Beerus()
				if(prob(0.5))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()
			New()

				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()

		GreenMoro
			name = "Green Moro"
			icon = 'Green MoroTrans.dmi'
			density = 1
			it_blocked = 1

			powerlevel = 1000000000 * 250
			powerlevel_max = 1000000000 * 250
			ki = 300000000
			ki_max = 300000000
			kidefense = 1000000000 * 15
			kidefense_max = 1000000000 * 15
			speed = 50000
			strength = 1000000000 * 1100
			defence = 1000000000 * 25

			karma = "Evil"
			race = "Alien"
			level = 300000000
			zenni = 600000*5
			pk = 1
			exp = 2900000*5
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
			respawn = 2000
			Del()
				src.Item_Drop_Beerus()
				if(prob(0.5))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))

				..()
			New()

				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()


		FusionZamasu
			name = "Fusion Merged Zamasu"
			icon = 'Fusion Merged Zamasu Distorted.dmi'
			density = 1
			it_blocked = 1
			movespeed = 4
			powerlevel = 1000000000 * 3500
			powerlevel_max = 1000000000 * 3500
			ki = 300000000
			ki_max = 300000000
			kidefense = 1000000000 * 100
			kidefense_max = 1000000000 * 100
			speed = 50000
			strength = 1000000000 * 5000
			defence = 1000000000 * 50
			karma = "Evil"
			race = "Alien"
			level = 300000000
			zenni = 600000*5
			pk = 1
			exp = 2900000*5
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
			respawn = 3000
			Del()
				src.Item_Drop_Beerus()
				if(prob(1))
					var/obj/O = new/obj/Equipment/Buff_Items/ZP_Shard
					O.loc = src.loc
				if(src.startloc) Remake(src.type, src.startloc, src.respawn+rand(0,200))
				..()
			New()

				frozen = 1
				spawn(rand(35,43)) frozen = 0
				..()



mob/NPC
	Beerus
		icon = 'beerusNPC.dmi'
		density= 1
		//safe= 1
		//frozen= 1
		//energy_code= 6678554
		it_blocked= 1
		New()
			..()
			//src.CreateName()
		verb
			Talk()
				set src in oview(6)
				set category = null
				usr << "<font color = white>Beerus:</font>[usr.name], I'm a very generous god. But there's just one thing I absolutely cannot stand. And that is the insensitivity of people who won't give me my due respect!"
	Whis
		icon = 'NPCs.dmi'
		icon_state="Whis"
		density= 1
		//safe= 1
		//frozen= 1
		//energy_code= 6678554
		it_blocked= 1
		New()
			..()
			//src.CreateName()


mob
	Monster
		proc
			AttackMOB2(mob/PC/M)
		//		world << "ONE"   					// TEST
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
			//	var/attackpower = src.strength+src.powerlevel*0.1
				if(!M)return
			//	var/defensepower = (M.defence * (M.durability/100)) + (M.powerlevel * 0.01)
				var/damage = 1
				if(!M)return
			//	var/cdamage = ((src.strength+src.powerlevel*0.1)*2)-defensepower



		//		world << "2"   					// TEST
				if(istype(M,/mob/PC))
					if(!M)return
					if(!src)return
					//world << "3"   					// TEST
				//	var/dmgpercent = 1
					//var/randdmg = rand(1,3)
					var/defmulti = M.defence_multi
					var/dmgpercent = rand(15,35)/100
					switch(defmulti)
						if(1 to 4)
							dmgpercent = rand(15,35)/100
						if(5)
							dmgpercent = rand(15,30)/100
						if(6)
							dmgpercent = rand(15,30)/100
						if(7)
							dmgpercent = rand(15,25)/100
						if(8)
							dmgpercent = rand(15,23)/100
						if(9)
							dmgpercent = rand(15,21)/100
						if(10)
							dmgpercent = rand(15,19)/100
						if(11)
							dmgpercent = rand(13,19)/100
						if(12)
							dmgpercent = rand(11,17)/100
						if(13)
							dmgpercent = rand(11,15)/100
						if(14)
							dmgpercent = rand(8,15)/100
						if(15)
							dmgpercent = rand(8,13)/100
						if(16)
							dmgpercent = rand(5,13)/100
						if(17)
							dmgpercent = rand(5,11)/100
						if(18)
							dmgpercent = rand(4,11)/100
						else
							dmgpercent = rand(4,10)/100


					dmgpercent = M.powerlevel_max * dmgpercent

					/*
					if(randdmg == 1)
						dmgpercent = M.powerlevel_max * 0.25
					if(randdmg == 2)
						dmgpercent = M.powerlevel_max * 0.35
					if(randdmg == 3)
						dmgpercent = M.powerlevel_max * 0.50
						*/
//	world << "damage1: [applycommas(dmgpercent)]"
					if(!M)return
					if(!src)return
		//			world << "four"   					// TEST
					if(M.attacktext)
						M << output("[text]","output2")
					M.attacker = src.name
					if(!M)return
		//			world << "[M] [applycommas(M.powerlevel)]"
		//			world << "dmgpercent: [applycommas(dmgpercent)]"
					M.powerlevel -= dmgpercent
		//			world << "[M] [applycommas(M.powerlevel)]"
				//	world << "<b>damageFINAL: [applycommas(dmgpercent)]"
					if(M.hudenabled)
						spawn() M.updateHealth()
					M.DeathCheck(src)
			//		world << "5"   					// TEST
					return


			AI_Beerus()
				if(src.sleeping)
					return
				if(AITarget)
					if(get_dist(src, AITarget) > 1)
						step_to(src, AITarget,1,src.movespeed)
						sleep(2)
					else
						AttackMOB2(AITarget)
						sleep(26)
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

				spawn() AI_Beerus()

				/*
mob/NPC/ScarredSaiyan
	name = "Battle Scarred Saiyan"
	icon = 'MISCMOBS.dmi'
	icon_state = "raekwon"
	density = 1
	safe = 1
	frozen = 1
	energy_code = 356153687464
	New()
		..()
		src.CreateName()
	verb/Talk()
		set src in oview(1)
		set category = null
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Battle Scarred Saiyan")
		if(usr.talking)
			usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
			return
		switch(alert("I need your help!",,"Thin horde of mobs","Walk away"))
			if("Walk away")
				return
			if("Thin horde of mobs")
				usr.talking=1

				if(!usr.startedexplodingsaibaquest)
					usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Mutated saibamen are rapidly multiplying inside this building, I cannot win on my own, please kill 5,000 exploding saibamen for me!"
					usr.startedexplodingsaibaquest = 1
					usr.contents += new/obj/Quests/InjuredSaiyan/ExplodingSaibas
					usr.talking=0
					return
				else
					if(usr.ExplodingSaibamanKills >= 5000)
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Thank you! Here is your reward. However there is more work to be done, talk to me if you wish to help out more."
						usr.exp+=500000

						usr << "<font color=white>Exp +500,000<br>Quest Points + 50</font>"
						usr.questpoints += 50
						usr.zp+=5
						usr.ExplodingSaibamanKills -= 5000
						usr.startedexplodingsaibaquest = 0
						usr << "<font color=red>You have gained 5 Z Points!</font>"
						usr.Level_Up()
						for(var/obj/Quests/InjuredSaiyan/ExplodingSaibas/Q)
							del(Q)
						usr.talking=0
						return
					else
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> You have killed [usr.ExplodingSaibamanKills] exploding saibamen!"
						usr.talking=0


				*/