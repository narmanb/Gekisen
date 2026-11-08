mob
	var
		lifecycle_delay = 10
		movement_probability = 50


	Move()
		if (isDead())
			return 0
		return ..()

mob
	verb
		Attack1(mob/M in oview(1))
			set category = "Fighting"
			set name = "Attack"
			var/damage = usr.strength - M.defense
			var/colour = "white"
			if(istype(M,/mob/monsters))
				if(usr.friend == "[M]")
					usr<<"You cannot betray your friend"
				else
					if(usr.attacking == 1) usr << "<I><font color = blue>You try to attack, but your already attacking."
					else
						if(M.pk == 0 || !M.pk) usr << "There not a pker."
						if(usr.pk == 0 || !usr.pk) usr<< "You aren't a pker"
						else
							if(stamina <= 1) usr << "You need to rest."
							else
								if(usr.flight == 1) usr << "Not while flying!"
								else
									if(usr.strength - M.defense > 0)
										if(usr.block == 1)
											usr<<"You cannot attack while blocking"
										else
											usr.attacking = 1
											if(M.block == 1)
												var/damage1 = (usr.strength - M.defense)/1.5
												var/block = rand(1,2)
												if(block == 1)
													view() << "<I><font color = red>[usr] Hits [M] only to be blocked doing [damage1] damage."
													s_damage(M,damage1,colour)
													M.health -= damage1
													usr.loc = locate(M.x,M.y-1,M.z)
													usr.icon_state = "weight-training-right"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
												else
													view() << "<I><font color = red>[usr] Hits [M] only to be blocked completely."
													s_damage(M,0,colour)
													usr.loc = locate(M.x,M.y+1,M.z)
													usr.icon_state = "weight-training-right"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
											else
												var/hit = rand(1,5)
												if(hit == 1)
													view() << "<I><font color = blue>[usr] High-kicks [M]"
													usr.icon_state = "kick"
													s_damage(M,damage,colour)
													M.health -= damage
													usr.loc = locate(M.x+1,M.y,M.z)
													usr.icon_state = "sparround"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
												if(hit == 2)
													view() << "<I><font color = blue>[usr] Low-kicks [M]"
													usr.icon_state = "kick"
													s_damage(M,damage,colour)
													M.health -= damage
													usr.loc = locate(M.x-1,M.y-1,M.z)
													usr.icon_state = "sparkick"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
												if(hit == 3)
													view() << "<I><font color = blue>[usr] High-punches [M]"
													usr.icon_state = "punch"
													s_damage(M,damage,colour)
													M.health -= damage
													usr.loc = locate(M.x,M.y-1,M.z)
													usr.icon_state = "weight-training-left"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
												if(hit == 4)
													view() << "<I><font color = blue>[usr] Low-punches [M]"
													usr.icon_state = "punch"
													s_damage(M,damage,colour)
													M.health -= damage
													usr.loc = locate(M.x,M.y+1,M.z)
													usr.icon_state = "sparpunch"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
												else
													view() << "<I><Font color = blue>[usr] delt barely any damage to [M]!"
													s_damage(M,"1",colour)
													M.health-=1
													usr.loc = locate(M.x-1,M.y,M.z)
													usr.icon_state = "weight-training-left"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
													M.KO()
												usr.Levelup()
												M.KO()
												if(usr.speed <= 10)
													sleep(11)
												else
													if(usr.speed <= 30)
														sleep(10)
													else
														if(usr.speed <= 100)
															sleep(7)
														else
															if(usr.speed <= 150)
																sleep(5)
												stamina-=2
												usr.attacking = 0
												usr.icon_state = ""
												if(hit == 5)
													view() << "<I><font color = blue>[usr] kicks [M], but misses"
													usr.loc = locate(M.x,M.y-1,M.z)
													usr.icon_state = "sparkick"
													if(usr.speed <= 10)
														sleep(5)
													else
														if(usr.speed <= 30)
															sleep(4)
														else
															if(usr.speed <= 100)
																sleep(3)
													usr.icon_state = ""
			if(istype(M,/mob/characters))
				if(usr.attacking == 1)
				else
					if(M.pk == 0) usr << "There not a pker."
					if(usr.pk == 0) usr<< "You aren't a pker"
					else
						if(stamina <= 1) usr << "You need to rest."
						else
							if(usr.flight == 1) usr << "Not while flying!"
							else
								if(usr.strength - M.defense > 0)
									if(usr.block == 1)
										usr<<"You cannot attack while blocking"
									else
										usr.attacking = 1
										if(M.block == 1)
											var/damage1 = (usr.strength - M.defense)/1.5
											var/block = rand(1,2)
											if(block == 1)
												view() << "<I><font color = red>[usr] Hits [M] only to be blocked doing [damage1] damage."
												s_damage(M,damage1,colour)
												M.health -= damage1
												usr.icon_state = "weight-training-right"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
											else
												view() << "<I><font color = red>[usr] Hits [M] only to be blocked completely."
												s_damage(M,0,colour)
												usr.icon_state = "weight-training-right"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
										else
											var/hit = rand(1,5)
											if(hit == 1)
												view() << "<I><font color = blue>[usr] High-kicks [M]"
												usr.icon_state = "kick"
												s_damage(M,damage,colour)
												M.health -= damage
												usr.icon_state = "sparround"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
											if(hit == 2)
												view() << "<I><font color = blue>[usr] Low-kicks [M]"
												usr.icon_state = "kick"
												s_damage(M,damage,colour)
												M.health -= damage
												usr.icon_state = "sparkick"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
											if(hit == 3)
												view() << "<I><font color = blue>[usr] High-punches [M]"
												usr.icon_state = "punch"
												s_damage(M,damage,colour)
												M.health -= damage
												usr.icon_state = "weight-training-left"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
											if(hit == 4)
												view() << "<I><font color = blue>[usr] Low-punches [M]"
												usr.icon_state = "punch"
												s_damage(M,damage,colour)
												M.health -= damage
												usr.icon_state = "sparpunch"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
											else
												view() << "<I><Font color = blue>[usr] delt barely any damage to [M]!"
												s_damage(M,"1",colour)
												M.health-=1
												usr.icon_state = "weight-training-left"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""
												M.KO()
											usr.Levelup()
											M.KO()
											if(usr.speed <= 10)
												sleep(11)
											else
												if(usr.speed <= 30)
													sleep(10)
												else
													if(usr.speed <= 100)
														sleep(7)
													else
														if(usr.speed <= 150)
															sleep(5)
											stamina-=2
											usr.attacking = 0
											usr.icon_state = ""
											if(hit == 5)
												view() << "<I><font color = blue>[usr] kicks [M], but misses"
												usr.icon_state = "sparkick"
												if(usr.speed <= 10)
													sleep(5)
												else
													if(usr.speed <= 30)
														sleep(4)
													else
														if(usr.speed <= 100)
															sleep(3)
												usr.icon_state = ""


mob
	proc
		isDead()
			if (move == 0)
				return 1
			return 0

		LifeCycle()
			if (client || isDead())
				return 1

			if (prob(movement_probability))
				step_rand(src)

			spawn(lifecycle_delay)
				LifeCycle()



		FlightLearn()
			if(usr.maxpowerlevel >= 100)
				if(usr.flightlearn == 0)
					usr.flightlearn = 1
					usr.contents += new /obj/techs/bukujutsu
					usr << "<font color = red><b><i>You have aquired the knowlage of <u>Bukujutsu</u></font>!"
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		KiTechLearn()
			if(usr.maxpowerlevel >= 150)
				if(usr.kitechlearn == 0)
					usr.kitech = "Aquired"
					usr.kitechlearn = 1
					usr << "<font color = red><b><i>You have aquired the knowlage of <u>Ki Tech.</u></font>!"
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		AuraTechLearn()
			if(usr.maxpowerlevel >= 375)
				if(usr.auratechlearn == 0)
					usr.auratech = "Aquired"
					usr.auratechlearn = 1
					usr << "<font color = red><b><i>You have aquired the knowlage of <u>Aura Tech.</u></font>!"
					usr.contents += new /obj/techs/aura
					usr.contents += new /obj/sense
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0

		AuraMake()
			if(stylename=="Satan"||stylename=="Korin"||stylename=="Unknown")
				stylename="Kame"
			if(usr.maxpowerlevel >= 400)
				if(usr.aura == 0||usr.aura == null)
					alert("You will now be able to choose your aura color.")
					usr.underlays -= /obj/whiteaura
					usr.aura = 1
					var/cred = input("How much red do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cgreen = input("How much green do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cblue = input("How much blue do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					usr.customred = cred
					usr.customgreen = cgreen
					usr.customblue = cblue



		techcheck()
			if(usr.health >= usr.maxhealth)
				usr.powerlevel += 0
			if(usr.health < usr.maxhealth)
				if(usr.tech == 0)
					usr.powerlevel += 0
				if(usr.tech == 1)
					usr.health += 5
					sleep(5)
					usr.techcheck()


		bitchslap()
			if(src.slap == 0)
				src.powerlevel += 0
			if(src.slap == 1)
				src << "God: BITCH! *God smacks you!*"
				src.health -= src.health / 8
				src.will -= 1
				src.honor -= 1
				src.purity -= 1






		FocusLearn()

			if (usr.maxpowerlevel >=750)
				if (usr.bangtechlearn==0)
					usr.contents += new /obj/techs/Renzuko
					alert("You learn Renzuko Energy Dan!")
					usr.bangtechlearn=1
			if(usr.maxpowerlevel >= 425)
				if(usr.focustechlearn == 0)
					usr.focustech = "Aquired"
					usr.focustechlearn = 1
					usr.focused = 0
					usr << "<font color = red><b><i>You have aquired the knowledge of <u>Focus Tech.</u></font>!"
					usr.contents += new /obj/techs/focus
				else
					usr.maxpowerlevel += 0
			else
				usr.maxpowerlevel += 0




		Die()

			if(src.health <= 0)
				if(src.npp == 1||src.npp == null)
					src << "<b>You feel like your about to die, but the letters <i>N P P</i> appear in your brain."
				if(src.npp == 0)
					src.trainpl = (src.maxpowerlevel * 1.5)
					src.trainpl = round(src.trainpl)

					if(src.race == "Saibaman")
						for(var/mob/monsters/M in view(1))
							if(M.friend == "")
								usr.zenni += 50
								usr << "<b>You get 50 zenni from that kill."
								usr.exp += (rand(1,10))
								src.loc=locate(0,0,0)
								usr.killsaiba += 1
								sleep(100)
								del(src)
							else
								usr<< "<b> You killed [M.friend]'s Monster! How dare you!"
								M.loc = locate(M.friend)
					if(src.race == "Saiya-jin (NPC)")
						for(var/mob/monsters/M in view(1))
							if(M.friend == "")
								usr.zenni += 2500
								usr << "<b>You get 2500 zenni from that kill."
								usr.exp += (rand(1,200))
								src.loc=locate(0,0,0)
								sleep(2000)
								new /mob/monsters/Raditz(locate(25,138,1))
								del(src)
							else
								usr<< "<b> You killed [M.friend]'s Monster! How dare you!"
								M.loc = locate(M.friend)
					if(src.race == "Scottish Cheese")
						del(src)
					if(src.race == "Buu (NPC)")
						for(var/mob/monsters/M in view(1))
							if(M.friend == "")
								usr.zenni += 5000
								usr << "<b>You get 5000 zenni from that kill."
								usr.exp += (rand(1,1000))
								src.loc=locate(0,0,0)
								src.random = rand(1,5)
							else
								usr<< "<b> You killed [M.friend]'s Monster! How dare you!"
								M.loc = locate(M.friend)
					if(src.race == "Vegeta x(NPC)")
						for(var/mob/monsters/M in view(1))
							if(M.friend == "")
								usr.zenni += 500000
								usr << "<b>You get 500000 zenni from that kill."
								usr.exp += (rand(1,1000000))
								src.loc=locate(0,0,0)
								src.random = rand(1,5)
								if(src.random == 5)
									switch(input("You are worthy of my attack. Do you wish to learn 'Big Bang Attack'?", "Vegeta", text) in list ("Yes","No"))
										if("Yes")
											usr.contents += new /obj/techs/BigBang
											alert("You learn Big Bang attack!")
											usr.kame = 0
								sleep(2000)
								new /mob/monsters/Vegeta(locate(60,71,9))
							else
								usr<< "<b> You killed [M.friend]'s Monster! How dare you!"
								M.loc = locate(M.friend)
					else
						world << "<b> <font color = red> INFO: [usr.name] has died...poor thing..."
						if(src.race == "Android")

							src << "<b>You get blown to pieces, and you begin to get built by Dr. Gero!"
							if(src.gotdb1==1)
								src.gotdb1=0
								new /obj/dragonballs/earth1(locate(src.x,src.y,src.z))
							if(src.gotdb2==1)
								src.gotdb2=0
								new /obj/dragonballs/earth2(locate(src.x,src.y,src.z))
							if(src.gotdb3==1)
								src.gotdb3=0
								new /obj/dragonballs/earth3(locate(src.x,src.y,src.z))
							if(src.gotdb4==1)
								src.gotdb4=0
								new /obj/dragonballs/earth4(locate(src.x,src.y,src.z))
							if(src.gotdb5==1)
								src.gotdb5=0
								new /obj/dragonballs/earth5(locate(src.x,src.y,src.z))
							if(src.gotdb6==1)
								src.gotdb6=0
								new /obj/dragonballs/earth6(locate(src.x,src.y,src.z))
							if(src.gotdb7==1)
								src.gotdb7=0
								new /obj/dragonballs/earth7(locate(src.x,src.y,src.z))
							checkchips
							if(src.chips>0)
								src.chips-=1
								new /obj/Androidchip(locate(src.x,src.y,src.z))
								goto checkchips
							if(src.haschip==1)

								new /obj/Androidchip(locate(src.x,src.y,src.z))
								src.haschip=0
							src.loc=locate(125,145,3)
							src.dead=1
							src<<"You have been sent here to wait while Dr.Gero rebuilds you."
							sleep(1000)
							src.loc=locate(56,111,3)
							src.dead=0
						else
							if(src.dead == 1)
								src << "You have died again!"
								src.icon_state = ""
								src.spar = 0
								src.dead = 1
								src.safe = 1
								src.ko = 0

								src.grav = 0
								src.density = 1
								src.powerlevel = src.maxpowerlevel
								src.health = src.maxhealth
								if(src.gotdb1==1)
									src.gotdb1=0
									new /obj/dragonballs/earth1(locate(src.x,src.y,src.z))
								if(src.gotdb2==1)
									src.gotdb2=0
									new /obj/dragonballs/earth2(locate(src.x,src.y,src.z))
								if(src.gotdb3==1)
									src.gotdb3=0
									new /obj/dragonballs/earth3(locate(src.x,src.y,src.z))
								if(src.gotdb4==1)
									src.gotdb4=0
									new /obj/dragonballs/earth4(locate(src.x,src.y,src.z))
								if(src.gotdb5==1)
									src.gotdb5=0
									new /obj/dragonballs/earth5(locate(src.x,src.y,src.z))
								if(src.gotdb6==1)
									src.gotdb6=0
									new /obj/dragonballs/earth6(locate(src.x,src.y,src.z))
								if(src.gotdb7==1)
									src.gotdb7=0
									new /obj/dragonballs/earth7(locate(src.x,src.y,src.z))
								src.loc=locate(54,9,3)
							if(src.dead == 0)
								if(src.name == usr.name)
									view(6) << "<font color = red><i>[src] dies right infront of you!"
									world << "<font color = red><b>Info: [src] has killed himself."
									if(usr.gotdb1==1)
										usr.gotdb1=0
										new /obj/dragonballs/earth1(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb2==1)
										usr.gotdb2=0
										new /obj/dragonballs/earth2(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb3==1)
										usr.gotdb3=0
										new /obj/dragonballs/earth3(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb4==1)
										usr.gotdb4=0
										new /obj/dragonballs/earth4(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb5==1)
										usr.gotdb5=0
										new /obj/dragonballs/earth5(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb6==1)
										usr.gotdb6=0
										new /obj/dragonballs/earth6(locate(usr.x,usr.y,usr.z))
									if(usr.gotdb7==1)
										usr.gotdb7=0
										new /obj/dragonballs/earth7(locate(usr.x,usr.y,usr.z))
									usr.verbs-= /mob/dbz/verb/Summon_Shenlong
								else
									view(6) << "<font color = red><i>[src] dies right infront of you!"
									world << "<font color = red><b>Info: [src] has been killed by [usr]."
						//		for(var/obj/dragonballs/O in src.contents)
						//			O.loc = locate(src.x,src.y,src.z)
								src.loc=locate(54,9,3)
								src.powerlevel = src.maxpowerlevel
								src.health = src.maxhealth
								src.icon_state = ""
								src.spar = 0
								src.safe = 1
								src.dead = 1
								src.overlays += 'halo.dmi'
								src.grav = 0
								src.density = 1
								src.ko = 0
								for(var/mob/characters/M in oview(6))
									if(usr.befriend == M.name)
										if(M.angered == 1)
											usr.powerlevel += 0
										if(M.angered == 0)
											view(10) << "<b><font color = blue>[M.name]: THATS ENOUGH!!!!!!!!!!!!"
											view(10) << "<i><b><font color = red>[M.name] explodes in anger as he sees his best friend die!"
											M.underlays += /obj/whiteaura
											M.powerlevel = (M.powerlevel * 4)
											M.purity += 20
											M.will += 20
											M.ragename = src.name
											M.angered= 1
											M.honor += 20
											M.SSJ()
											M << "<font color = red><font size = 5>Hate <font color = blue>fills your soul as you see your best friend, [src.name], die infront of you."
											sleep(600)
											M.underlays -= /obj/whiteaura
											M.angered = 0
											if(M.powerlevel <= M.maxpowerlevel)
												M.powerlevel += 0
											if(M.powerlevel > M.maxpowerlevel)
												M.powerlevel = M.maxpowerlevel
									else
										if(usr.angered == 1)
											usr.powerlevel += 0
										if(usr.angered == 0)
											view(6) << "<b><font color = blue>[M.name]: aaaAAAHHHHH!!!!!!!!!!"
											view(6) << "<i><b><font color = red>[M.name] explodes in anger as a huge aura surrounds him!"
											M.underlays += /obj/whiteaura
											M.powerlevel = (M.powerlevel * 2)
											M.purity += 1
											M.angered = 1
											M.ragename = src.name
											M.will += 1
											M.honor += 1
											M.SSJ()
											M << "<font color = red>Hate <font color = blue>fills your soul as you see [src.alignment] [src.name] die infront of you."
											sleep(100)
											M.underlays -= /obj/whiteaura
											M.angered = 0
											if(M.powerlevel <= M.maxpowerlevel)
												M.powerlevel += 0
											if(M.powerlevel > M.maxpowerlevel)
												M.powerlevel = M.maxpowerlevel
							else
								usr.powerlevel += 0




		KO()
			if(src.spar == 1)
				if(src.stamina <= 4)
					view(6) << "<b>[src] is out of breath!</b>"
					src.ko = 1
					src.lose = 1
					src.grav = 0
					src.ko = 0
					for(var/mob/characters/M in view(2))
						M.win = 1
						M.WinMatch()
					src.LoseMatch()
				else
					src.powerlevel += 0
			else
				if(src.health <= 0)
					view(6) << "<b>[src] is knocked out!!</b>"
					src.ko = 1
					src.move = 0
					src.grav = 0
					sleep(100)
					src.ko = 0
					src.move = 1
					src.powerlevel = 5
					src.health = 5
					src.random = rand(1,3)
					src.enterdintourney = 0
					if(src.random == 3)
						src.maxpowerlevel += rand(1,2)
					if(src.random == 2)
						src.maxpowerlevel += rand(0,1)
					if(src.random == 1)
						src.powerlevel += 0
				else
					src.powerlevel += 0


		FormTwo()
			if(usr.gonessj == null||usr.gonessj == 0)
				if(usr.race == "Changling")
					if(((usr.strength +usr.speed + usr.defense)/3) >= 30)
						usr << "<b>You begin to feel your body straining...."
						sleep(rand(1,100))
						usr << "<b>Your body begins to transform!!"
						flick("form2",usr)
						usr << "<b>Your clothes cannot fit your body anymore."
						usr.icon = 'ChangeForm2.dmi'
						usr.gonessj = 1
						usr.state = "Form Two"
						usr.contents += new /obj/transform
				if(usr.race == "Bio-Android Cell")
					if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
						usr << "<b>You begin to feel your body straining...."
						sleep(rand(1,100))
						usr << "<b>Your body begins to transform!!"
						flick("trans",usr)
						usr << "<b>You feel your power increasing dramatically."
						usr.icon = 'Cell1.dmi'
						usr.gonessj = 1
						usr.state = "Form Two"
						usr.contents += new /obj/celltransform



		SNJ()
			if(usr.gonessj == 1)
				usr.powerlevel += 0
			if(usr.gonessj == 0||usr.gonessj == null)
				if(usr.race == "Namek-sei-jin"||usr.race == "Namek-jin")
					if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
						if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
							usr.random = rand(1,4)
							usr << "You sense a hidden power about to be released from you...."
							if(usr.random == 1||usr.random == 3)
								flick("trans",usr)
								usr.icon = 'super-namek.dmi'
								usr.maxpowerlevel = (usr.maxpowerlevel * 2)
								usr.strength += 40
								usr.defense += 25
								usr.speed += 20
								usr.will += 100
								usr.honor += 100
								usr.purity += 100
								usr.gonessj = 1
								usr << "<b>Your skin turns dark and your eyes turn red. You sense your power increase greatly."
							if(usr.random == 2||usr.random == 4||usr.random == 5)
								usr << "<b>You couldn't unleash your hidden power."
								usr.gonessj = 1
								sleep(100)
								usr.gonessj = 0
						else
							usr.powerlevel += 0
					else
						usr.powerlevel += 0
				else
					usr.powerlevel += 0
			else
				usr.powerlevel += 0



		SSJ()
			if(usr.kaioken == 1)
				usr << "<b>You begin to get angered, but Kaioken strains your body."
			if(usr.kaioken == 0)
				if(usr.gonessj == 1)
					usr.powerlevel += 0
				if(usr.gonessj == 0)
					if(usr.race == "Saiya-jin"||usr.race == "Halfbreed")
						if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
							usr.gonessj = 1
							usr.race = "Saiya-jin"
							usr << "<b>Tears start to fill your eyes...."
							oview(6) << "<b>Tears start to fill [usr]'s eyes...."
							usr.icon_state = "ssj"
							sleep(30)
							if(((usr.strength +usr.speed + usr.defense)/3) <= 15)
								usr << "<b>You calm down, and return to normal."
								usr.icon_state = ""
								usr.gonessj = 0
							if(((usr.strength +usr.speed + usr.defense)/3) >= 15)
								usr << "<b>Your hair starts to stand on end..."
								oview(6) << "<b>[usr]'s hair begins to stand on end..."
								sleep(30)
								usr.random = rand(1,2)
								if(((usr.strength +usr.speed + usr.defense)/3) < 25)
									usr << "<b>You calm down, and return to normal."
									usr.icon_state = ""
									usr.gonessj = 0
								if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
									usr.random = rand(1,2)
									if(usr.random == 2)
										view(30) << "<b>[usr]: <font size = 6>aaaaaaaAAHHHHHHHHHHHH!!!!!!!!!!!!"
										view(150) << "The ground begins to shake severly!!!</b>"
										sleep(20)
										flick("gonessj",usr)

										usr.maxpowerlevel += 500
										usr.maxpowerlevel = round(usr.maxpowerlevel)
										usr.icon_state = ""
										if (usr.hair=="Spikey")
											usr.overlays += 'hair_super_saiyajin.dmi'
											usr.overlays -= 'hair_black_spikey.dmi'
										if (usr.hair=="long")
											var/hairover = 'hair_black_long.dmi'
											hairover += rgb(160,160,50)
											usr.overlays += hairover
											usr.overlays += 'hair_super_saiyajin.dmi'
										if (usr.hair=="Short")
											usr.overlays += 'hair_super_saiyajin.dmi'
											usr.overlays -= 'hair_black_short.dmi'
										if (usr.hair=="Gohan")
											usr.overlays += 'hair_super_saiyajin.dmi'
											usr.overlays -= 'hair_gohan.dmi'
										if (usr.hair=="Vegeta")
											var/hairover = 'hair_vegeta.dmi'
											hairover += rgb(180,180,80)
											usr.overlays += hairover
										if (usr.hair=="Goku")
											usr.overlays += 'hair_ssj_goku.dmi'
											usr.overlays -= 'hair_goku.dmi'
										if (usr.hair=="Bald")
											usr.overlays +='Hair_Bald_Supersayajin.dmi'
										usr.overlays += /obj/tail
										usr.underlays += 'ssjaura.dmi'
										usr.opl = usr.powerlevel
										usr.powerlevel = usr.powerlevel * (rand(2,3))
										sleep(50)
										usr.powerlevel = usr.opl
										usr.random = rand(1,2)
										if(usr.random == 1)
											usr << "<b>You do not yet know the extent of Super Saiya-jin."
											usr.maxpowerlevel -= 120
											usr << "<b>You get control of your body again."
											usr.underlays -= 'ssjaura.dmi'
											usr.underlays -= 'elec.dmi'

											usr.gonessj = 0
											if (usr.hair=="Spikey")
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												usr.overlays += hairover
											if (usr.hair=="Short")
												var/hairover = 'hair_black_short.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												usr.overlays += hairover
											if (usr.hair=="Goku")
												var/hairover = 'hair_goku.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_ssj_goku.dmi'
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Bald")
												usr.overlays -='Hair_Bald_Supersayajin.dmi'
										if(usr.random == 2)
											usr.gonessj = 1
											usr << "<b>You understand the extent of Super Saiya-jin 2!!</b>"
											usr << "<b>You get control of your body again."
											usr.underlays -= 'ssjaura.dmi'
											usr.contents += new /obj/ssj
											usr.ssj = 0
											if (usr.hair=="Spikey")
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												usr.overlays += hairover
											if (usr.hair=="Short")
												var/hairover = 'hair_black_short.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												usr.overlays += hairover
											if (usr.hair=="Goku")
												var/hairover = 'hair_goku.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_ssj_goku.dmi'
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Bald")
												usr.overlays -='Hair_Bald_Supersayajin.dmi'
									else

										view(30) << "<b>[usr]: <font size = 5>aaaAAAHHHHHHHHHHHH!!!!!!!!!!!!"
										view(150) << "The ground begins to shake!!!</b>"
										sleep(20)
										flick("gonessj",usr)
										usr.icon_state = ""
										usr.overlays += 'hair_super_saiyajin.dmi'
										usr.underlays += 'ssjaura.dmi'
										usr.opl = usr.powerlevel
										usr.powerlevel = usr.powerlevel * (rand(2,3))
										sleep(50)
										usr.powerlevel = usr.opl
										usr.random = rand(1,2)
										if(usr.random == 1)
											usr << "<b>You do not yet know the extent of Super Saiya-jin."

											usr << "<b>You get control of your body again."
											usr.underlays -= 'ssjaura.dmi'
											usr.gonessj = 0
											if (usr.hair=="Spikey")
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												usr.overlays += hairover
											if (usr.hair=="Short")
												var/hairover = 'hair_black_short.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												usr.overlays += hairover
											if (usr.hair=="Goku")
												var/hairover = 'hair_goku.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_ssj_goku.dmi'
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Bald")
												usr.overlays -='Hair_Bald_Supersayajin.dmi'
										if(usr.random == 2)
											usr.gonessj = 1
											usr << "<b>You understand the extent of Super Saiya-jin!!</b>"
											usr << "<b>You get control of your body again."
											usr.underlays -= 'ssjaura.dmi'
											usr.overlays += usr.hair
											usr.contents += new /obj/ssj
											usr.ssj = 0
											usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Spikey")
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												usr.overlays += hairover
											if (usr.hair=="Short")
												var/hairover = 'hair_black_short.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												usr.overlays += hairover
											if (usr.hair=="Goku")
												var/hairover = 'hair_goku.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_ssj_goku.dmi'
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(rhair,ghair,bhair)
												usr.overlays += hairover
												usr.overlays -= 'hair_super_saiyajin.dmi'
											if (usr.hair=="Bald")
												usr.overlays -='Hair_Bald_Supersayajin.dmi'



mob
	proc
		LoseMatch()
			if(src.enterdintourney == 1)
				if(src.lose == 1)
					for(var/mob/characters/M in oview(1))
						M.win = 1
						WinMatch(src)
					world<<"<I><font color=yellow>[src] has been eliminated!"
					src.loc = locate(79,53,1)
					src.intourney = 0
					src.stamina = 100
					src.lose = 0
					src.enterdintourney = 0
					src.intourney = 0
					src.fly = 1
					src.verbs += /mob/verb/Attack1
					src.verbs += /mob/verb/Finish

				else
			else
		WinMatch()
			if(src.win == 1)
				world<<"<I><font color=green>[src] has won!!!"
				src.loc = locate(82,53,1)
				src.zenni += 1000
				src.level += 6
				src.exp = src.maxexp
				Levelup()
				src.win = 0
				src.intourney = 0
				src.stamina = 100
				src.enterdintourney = 0
				src.fly = 1
				src.verbs += /mob/verb/Attack1
				src.verbs += /mob/verb/Finish

			else


mob/monsters
	New()
		..()
		spawn(200)
			LifeCycle()
		return

	LifeCycle()
		if (client || isDead())
			return

		var/action_taken

		for (var/mob/other_mob in oview(1, src))
			if (istype(other_mob, /mob/monsters) || other_mob.isDead())
				continue

			Attack1(other_mob)
			action_taken = 1

		for (var/mob/other_mob in oview(3, src))
			if (istype(other_mob, /mob/monsters) || other_mob.isDead())
				continue
				step_towards(src, other_mob)
				action_taken = 1


		if (action_taken)
			spawn(lifecycle_delay)
				LifeCycle()
			return
		..()