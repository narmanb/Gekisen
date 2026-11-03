var
	sagas_on= 0
	sagas_evil=0
	sagas_good=0
	saga="Not On"
	part="Not On"
	saga_difficulty="Easy"
	saga_episode=0
	saga_spawned=0
proc
	SAGA_DIFFICULTY()
		return
		if(saga_difficulty == "Pathetic")
			for(var/mob/Saga/M in world)
				M.level = M.level/4
				M.exp=(M.level*20)
				M.zenni=(M.level*(M.level/5)*0.1)
				M.powerlevel_max = M.powerlevel_max/4
				M.ki_max = M.ki_max/4
				M.kidefense_max = M.kidefense_max/4
				M.strength_max = M.strength_max/4
				M.defence_max = M.defence_max/4
				M.speed_max = M.speed_max/4
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.speed >= M.speed_max)
					M.speed = M.speed_max
		if(saga_difficulty == "Easy")
			for(var/mob/Saga/M in world)
				M.level = M.level/2
				M.exp=(M.level*20)
				M.zenni=(M.level*(M.level/2)*0.1)
				M.powerlevel_max = M.powerlevel_max/2
				M.ki_max = M.ki_max/2
				M.kidefense_max = M.kidefense_max/2
				M.strength_max = M.strength_max/2
				M.defence_max = M.defence_max/2
				M.speed_max = M.speed_max/2
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.speed >= M.speed_max)
					M.speed = M.speed_max
		if(saga_difficulty == "Medium")
			for(var/mob/Saga/M in world)
				M.level=M.level
				M.exp=(M.level*20)
				M.zenni=(M.level*(M.level/2)*0.1)
				M.powerlevel_max = M.powerlevel_max
				M.ki_max = M.ki_max
				M.kidefense_max = M.kidefense_max
				M.strength_max = M.strength_max
				M.defence_max = M.defence_max
				M.speed_max = M.speed_max
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.speed >= M.speed_max)
					M.speed = M.speed_max
		if(saga_difficulty == "Hard")
			for(var/mob/Saga/M in world)
				M.level = M.level*2
				M.exp=(M.level*20)
				M.zenni=(M.level*(M.level/2)*0.1)
				M.powerlevel_max = M.powerlevel_max*2
				M.ki_max = M.ki_max*2
				M.kidefense_max = M.kidefense_max*2
				M.strength_max = M.strength_max*2
				M.defence_max = M.defence_max*2
				M.speed_max = M.speed_max*2
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.speed >= M.speed_max)
					M.speed = M.speed_max
		if(saga_difficulty == "Extreme")
			for(var/mob/Saga/M in world)
				M.level = M.level*3.5
				M.exp=(M.level*20)
				M.zenni=(M.level*(M.level/2)*0.1)
				M.powerlevel_max = M.powerlevel_max*3.5
				M.ki_max = M.ki_max*3.5
				M.kidefense_max = M.kidefense_max*3.5
				M.strength_max = M.strength_max*3.5
				M.defence_max = M.defence_max*3.5
				M.speed_max = M.speed_max*3.5
				if(M.powerlevel >= M.powerlevel_max)
					M.powerlevel = M.powerlevel_max
				if(M.ki >= M.ki_max)
					M.ki = M.ki_max
				if(M.kidefense >= M.kidefense_max)
					M.kidefense = M.kidefense_max
				if(M.strength >= M.strength_max)
					M.strength = M.strength_max
				if(M.defence >= M.defence_max)
					M.defence = M.defence_max
				if(M.speed >= M.speed_max)
					M.speed = M.speed_max
world
	proc
		SAGA_CHECK()
			if(sagas_on&&sagas_evil)
				if(!saga_episode&&!saga_spawned)
					for(var/mob/Saga/M in world)
						del(M)
					saga = "Saiyan"
					part = "Raditz"
					saga_episode = 1
					saga_spawned=1
					var/Raditz = /mob/Saga/Raditz
					new Raditz(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode==2&&saga_spawned!=2)
					saga = "Saiyan"
					part = "Vegeta and Nappa"
					saga_spawned=2
					var/Vegeta = /mob/Saga/Vegeta
					new Vegeta(locate(rand(393,466),rand(35,86),1))
					var/Nappa = /mob/Saga/Nappa
					new Nappa(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode==4&&saga_spawned!=4)
					saga = "Frieza"
					part = "Ginyu Force"
					saga_spawned=4
					var/Jeice = /mob/Saga/Jeice
					new Jeice(locate(rand(393,466),rand(35,86),1))
					var/Burter = /mob/Saga/Burter
					new Burter(locate(rand(393,466),rand(35,86),1))
					var/Recoom = /mob/Saga/Recoom
					new Recoom(locate(rand(393,466),rand(35,86),1))
					var/Guldo = /mob/Saga/Guldo
					new Guldo(locate(rand(393,466),rand(35,86),1))
					var/Ginyu = /mob/Saga/Ginyu
					new Ginyu(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode==9&&saga_spawned!=9)
					saga = "Frieza"
					part = "Frieza: Form 1"
					saga_spawned=9
					var/Frieza = /mob/Saga/Frieza
					new Frieza(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 10)
					saga = "Frieza"
					part = "Frieza: Form 2"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 11)
					saga = "Frieza"
					part = "Frieza: Form 3"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 12)
					saga = "Frieza"
					part = "Frieza: Form 4"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 13)
					saga = "Frieza"
					part = "Frieza: Form 4 100%"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 14&&saga_spawned!=14)
					saga = "Android"
					part = "Cyborg Frieza"
					saga_spawned=14
					var/Cyborg_Frieza = /mob/Saga/MechaFrieza
					new Cyborg_Frieza(locate(rand(393,466),rand(35,86),1))
					var/King_Cold = /mob/Saga/KingCold
					new King_Cold(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 16&&saga_spawned!=16)
					saga = "Cooler"
					part = "Cooler"
					saga_spawned=16
					var/Cooler = /mob/Saga/Cooler
					new Cooler(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 17)
					saga = "Cooler"
					part = "Metal Cooler"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 18&&saga_spawned!=18)
					saga = "Android"
					part = "Android 19 and 20"
					saga_spawned=18
					var/Android_19 = /mob/Saga/Android19
					new Android_19(locate(rand(393,466),rand(35,86),1))
					var/Dr_Gero = /mob/Saga/Android20
					new Dr_Gero(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 20&&saga_spawned!=20)
					saga = "Android"
					part = "Android 16, 17 and 18"
					saga_spawned=20
					var/Android_16 = /mob/Saga/Android16
					new Android_16(locate(rand(393,466),rand(35,86),1))
					var/Android_17 = /mob/Saga/Android17
					new Android_17(locate(rand(393,466),rand(35,86),1))
					var/Android_18 = /mob/Saga/Android18
					new Android_18(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 23&&saga_spawned!=23)
					saga = "Android"
					part = "Cell: Form I"
					saga_spawned=23
					var/Cell = /mob/Saga/Cell
					new Cell(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 24)
					saga = "Android"
					part = "Cell: Imperfect Form"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 25)
					saga = "Android"
					part = "Cell: Perfect Form"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 26)
					saga = "Android"
					part = "Cell: Power Weighted"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 27)
					saga = "Android"
					part = "Cell: Perfect Form Power Weighted"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 28&&saga_spawned!=28)
					saga = "Brolly"
					part = "Brolly"
					saga_spawned=28
					var/Broly = /mob/Saga/Brolly
					new Broly(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 29)
					saga = "Brolly"
					part = "Legendary Super Saiyan"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 30&&saga_spawned!=30)
					saga = "Majin"
					part = "Babidi and Dabura"
					saga_spawned=30
					var/Dabura = /mob/Saga/Dabura
					new Dabura(locate(rand(393,466),rand(35,86),1))
					var/Babidi = /mob/Saga/Babidi
					new Babidi(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 32&&saga_spawned!=32)
					saga = "Majin"
					part = "Fat Buu"
					saga_spawned=32
					var/Fat_Buu = /mob/Saga/MajinBuu
					new Fat_Buu(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 33)
					saga = "Majin"
					part = "Evil Buu"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 34)
					saga = "Majin"
					part = "Super Buu"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 35)
					saga = "Majin"
					part = "Kid Buu"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 36&&saga_spawned!=36)
					saga = "Baby"
					part = "Baby"
					saga_spawned=36
					spawn(1)SAGA_DIFFICULTY()
					var/Bebi = /mob/Saga/Baby
					new Bebi(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 37)
					saga = "Baby"
					part = "Baby Vegeta"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 38)
					saga = "Baby"
					part = "Golden Oozaru Baby"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 39&&saga_spawned!=39)
					saga = "Super 17"
					part = "Super 17"
					saga_spawned=39
					var/Super17 = /mob/Saga/Super17
					new Super17(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 40&&saga_spawned!=40)
					saga = "Shenron"
					part = "Shenron"
					saga_spawned=40
					var/Shenron = /mob/Saga/Shenron
					new Shenron(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 41)
					saga = "Shenron"
					part = "Omega Shenron"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 42)
					saga = "Not On"
					part = "Not On"
					saga_spawned=0
					saga_episode=0
					sagas_on = 0

//Go to good sagas
			if(sagas_on&&sagas_good)
				if(!saga_episode&&!saga_spawned)
					saga = "Saiyan"
					part = "Goku and Piccolo"
					saga_episode = 1
					saga_spawned = 1
					var/Goku1 = /mob/Saga/Goku1
					var/Piccolo1 = /mob/Saga/Piccolo1
					new Goku1(locate(rand(393,466),rand(35,86),1))
					new Piccolo1(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 3&&saga_spawned!=3)
					saga = "Saiyan"
					part = "Saiyan Force"
					saga_spawned = 3
					var/Goku2 = /mob/Saga/Goku2
					var/Piccolo2 = /mob/Saga/Piccolo2
					var/Gohan1 = /mob/Saga/Gohan1
					var/Choutzu1 = /mob/Saga/Choutzu1
					var/Krillin1 = /mob/Saga/Krillin1
					var/Tien1 = /mob/Saga/Tien1
					var/Yamcha1 = /mob/Saga/Yamcha1
					new Goku2(locate(rand(393,466),rand(35,86),1))
					new Piccolo2(locate(rand(393,466),rand(35,86),1))
					new Gohan1(locate(rand(393,466),rand(35,86),1))
					new Choutzu1(locate(rand(393,466),rand(35,86),1))
					new Krillin1(locate(rand(393,466),rand(35,86),1))
					new Tien1(locate(rand(393,466),rand(35,86),1))
					new Yamcha1(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 10&&saga_spawned!=10)
					saga = "Frieza"
					part = "Gohan and Krillin"
					saga_spawned = 10
					var/Gohan2 = /mob/Saga/Gohan2
					var/Krillin2 = /mob/Saga/Krillin2
					new Gohan2(locate(rand(393,466),rand(35,86),1))
					new Krillin2(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 12&&saga_spawned!=12)
					saga = "Frieza"
					part = "Goku and Vegeta"
					saga_spawned = 12
					var/Goku3 = /mob/Saga/Goku3
					var/Vegeta2 = /mob/Saga/Vegeta2
					new Goku3(locate(rand(393,466),rand(35,86),1))
					new Vegeta2(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 14&&saga_spawned!=14)
					saga = "Frieza"
					part = "Super Saiyan Goku"
					saga_spawned = 14
					var/Goku4 = /mob/Saga/Goku4
					new Goku4(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 15&&saga_spawned!=15)
					saga = "Android"
					part = "Future Trunks"
					saga_spawned=15
					var/Trunks1 = /mob/Saga/Trunks1
					new Trunks1(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 16&&saga_spawned!=16)
					saga = "Cooler"
					part = "Goku and Vegeta"
					saga_spawned=16
					var/Goku5 = /mob/Saga/Goku5
					var/Vegeta3 = /mob/Saga/Vegeta3
					new Goku5(locate(rand(393,466),rand(35,86),1))
					new Vegeta3(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 18&&saga_spawned!=18)
					saga = "Android"
					part = "Super Saiyan Vegeta"
					saga_spawned=18
					var/Vegeta4 = /mob/Saga/Vegeta4
					new Vegeta4(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 19&&saga_spawned!=19)
					saga = "Android"
					part = "Super Saiyan Gohan"
					saga_spawned=19
					var/Goku6 = /mob/Saga/Goku6
					var/Gohan3 = /mob/Saga/Gohan3
					new Goku6(locate(rand(393,466),rand(35,86),1))
					new Gohan3(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 21)
					saga = "Android"
					part = "Super Saiyan 2 Gohan"
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 22&&saga_spawned!=22)
					saga = "Brolly"
					part = "Trunks and Goten"
					saga_spawned=22
					var/Trunks2 = /mob/Saga/Trunks2
					var/Goten1 = /mob/Saga/Goten1
					new Trunks2(locate(rand(393,466),rand(35,86),1))
					new Goten1(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 24&&saga_spawned!=24)
					saga = "Majin"
					part = "Majin Vegeta"
					saga_spawned=24
					var/Vegeta5 = /mob/Saga/Vegeta5
					new Vegeta5(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 25&&saga_spawned!=25)
					saga = "Majin"
					part = "Super Saiyan 3 Goku"
					saga_spawned=25
					var/Goku7 = /mob/Saga/Goku7
					new Goku7(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 26&&saga_spawned!=26)
					saga = "Majin"
					part = "Gotenks and Mystic Gohan"
					saga_spawned=26
					var/Gotenks1 = /mob/Saga/Gotenks1
					var/Gohan4 = /mob/Saga/Gohan4
					new Gotenks1(locate(rand(393,466),rand(35,86),1))
					new Gohan4(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 28&&saga_spawned!=28)
					saga = "Majin"
					part = "Vegito"
					saga_spawned=28
					var/Vegito1 = /mob/Saga/Vegito1
					new Vegito1(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 29&&saga_spawned!=29)
					saga = "Baby"
					part = "Goku"
					saga_spawned=29
					var/Goku8 = /mob/Saga/Goku8
					new Goku8(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 30&&saga_spawned!=30)
					saga = "Baby"
					part = "Super Saiyan 3 Goku"
					saga_spawned=30
					var/Goku9 = /mob/Saga/Goku9
					new Goku9(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 31&&saga_spawned!=31)
					saga = "Baby"
					part = "Super Saiyan 4 Goku"
					saga_spawned=31
					var/Goku10 = /mob/Saga/Goku10
					new Goku10(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 32&&saga_spawned!=32)
					saga = "Super 17"
					part = "Super Saiyan 4 Goku"
					saga_spawned=32
					var/Goku11 = /mob/Saga/Goku11
					new Goku11(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 33&&saga_spawned!=33)
					saga = "Shenron"
					part = "SSJ4 Goku and Vegeta"
					saga_spawned=33
					var/Vegeta6 = /mob/Saga/Vegeta6
					new Vegeta6(locate(rand(393,466),rand(35,86),1))
					var/Goku12 = /mob/Saga/Goku12
					new Goku12(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 35&&saga_spawned!=35)
					saga = "Shenron"
					part = "Super Saiyan 4 Gogeta"
					saga_spawned=35
					var/Gogeta = /mob/Saga/Gogeta
					new Gogeta(locate(rand(393,466),rand(35,86),1))
					spawn(1)SAGA_DIFFICULTY()
				if(saga_episode == 36)
					saga = "Not On"
					part = "Not On"
					saga_spawned = 0
					saga_episode = 0
					sagas_on = 0
			spawn(300)SAGA_CHECK()

mob
	Saga
		icon='Sagas.dmi'
		pk=1
		density=1
		safe=0
		var
			has_beam=0
			beam_txt=""
			beamI='Techs.dmi'
			beamIS=0
			beamIST=0
			CPS=1
	//		sleeping=1
	//		mob/PC/AITarget
		proc
			SagaAI()
				spawn()SagaAI()
			get_target()

			AttackSAGA(mob/PC/M)
				var/attack_text = rand(1,2)
				var/text
				if(attack_text == 1)
					text = "\red [src] Punches you!"
				if(attack_text == 2)
					text = "\red [src] Kicks you!"
				if(!M)
					return
				if(src.KO)
					return
				if(M.buku)
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
					if(!M)return
					if(!src)return
					if(prob(M.dodge/5))
						flick("IT",M)
						M.attacker = src.name
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
									M.powerlevel-=cdamage
									M.DeathCheck(src)
									return
								else
									if(!M)return
									if(!src)return
									if(M.attacktext)
										M << output("[text]","output2")
									M.attacker = src.name
									M.powerlevel -= damage
									M.DeathCheck(src)
									return
		New()
			..()
			spawn(1)
				var/pl=(src.level*src.level*500)+rand(1,1000)
				var/str=(src.level*src.level*200)+rand(1,1000)
				src.powerlevel = pl
				src.powerlevel_max = pl
				src.ki=pl*0.9
				src.ki_max=pl*0.9
				src.kidefense=pl*0.85
				src.kidefense_max=pl*0.85
				src.strength=str
				src.strength_max=str
				src.defence=str
				src.defence_max=str
				src.speed=str
				src.speed_max=str
				src.exp=(src.level*20)
				src.zenni=(src.level*100)+100
				if(saga_difficulty == "Pathetic")
					src.level*=0.25
					src.powerlevel_max*=0.25
					src.ki_max*=0.25
					src.kidefense_max*=0.25
					src.strength_max*=0.25
					src.defence_max*=0.25
					src.speed_max*=0.25
					src.exp=(src.level*50)
					src.zenni=(src.level*100)+100
					src.Power_Redefine()
				if(saga_difficulty == "Easy")
					src.level*=0.5
					src.powerlevel_max*=0.5
					src.ki_max*=0.5
					src.kidefense_max*=0.5
					src.strength_max*=0.5
					src.defence_max*=0.5
					src.speed_max*=0.5
					src.exp=(src.level*50)
					src.zenni=(src.level*100)+100
					src.Power_Redefine()
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
			SagaBeam()
				/*spawn while(src)
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
								src.SagaPowerUp()*/
				if(prob(10))
					if(!src.doing)
						if(src.dir==NORTH)
							for(var/mob/PC/M in oview(10))
								if(M.x==src.x&&M.y>src.y)
									if(src.has_beam!=0)
										if(src.ki>=5000)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: [src.beam_txt]!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
									else
										if(src.ki>=500)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: HA!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
						if(src.dir==SOUTH)
							for(var/mob/PC/M in oview(10))
								if(M.x==src.x&&M.y<src.y)
									if(src.has_beam!=0)
										if(src.ki>=5000)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: [src.beam_txt]!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
									else
										if(src.ki>=500)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: HA!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
						if(src.dir==EAST)
							for(var/mob/PC/M in oview(10))
								if(M.x>src.x&&M.y==src.y)
									if(src.has_beam!=0)
										if(src.ki>=5000)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: [src.beam_txt]!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
									else
										if(src.ki>=500)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: HA!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
						if(src.dir==WEST)
							for(var/mob/PC/M in oview(10))
								if(M.x<src.x&&M.y==src.y)
									if(src.has_beam!=0)
										if(src.ki>=5000)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: [src.beam_txt]!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackBeam(src,"[src.has_beam]",src.ki*0.5,'Techs.dmi',"[src.beamIS]","[src.beamIST]",0)
									else
										if(src.ki>=500)
											src.doing=1
											src.frozen=1
											view(10)<<"[src]: HA!"
											var/obj/Tech/BeamH/A=new
											spawn(5)
												A.TechAttackStraight(src,"Ki Blast",src.ki*0.07,'Techs.dmi',"kiblast",0)
				sleep(30)