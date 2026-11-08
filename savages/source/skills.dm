



obj/techs
	spiritbomb
		verb
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
			sbomb(mob/characters/M in oview(15))
				set name = "Spirit Bomb"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "You are firing something already."
					if(usr.kame == 0)
						var/dam = input("How much do you wish to put into the spirit bomb?") as num|null
						if(dam < 0)
							usr << "You cant fire that"
							return 0
						if(dam > usr.maxpowerlevel)
							view(6) << "[usr] explodes from putting too much energy in the Spirit Bomb."
							usr.powerlevel = 0
							usr.Die()
						if(dam <= usr.maxpowerlevel)
							view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
							var/snart = new /obj/sbomb(locate(usr.x,usr.y+1,usr.z))
							usr.icon_state = "sbomb"
							usr.kame = 1
							loop
							sleep(100)

							switch(input("Do you wish to fire the spirit bomb or continue charging?", "Spirit Bomb", text) in list ("Fire", "Charge"))
								if ("Fire")
									del(snart)
									usr.kame = 0
									usr.icon_state=""
									s_missile('sbomb.dmi',usr,M)


									sleep(5)
									M.health -= dam/M.defense
									usr.powerlevel -= dam
									usr.KO()
									M.Die()
								if ("Charge")
									dam+=(dam/10)
									goto loop

					usr.powerlevelRefresh()
					M.powerlevelRefresh()



	it
		verb
			Instant_Transmission(mob/characters/M in world)
				set name = "Instant Transmission"
				set category = "Fighting"
				if(usr.dead == 1)
					usr<<"You can't use IT when you are Dead!"
				else
					if(findText("[usr.knowmob]","[M.name]")==0)
						usr << "You cannot seem to remember [M] well... You better use Remember Someone on him."
					else
						for(var/mob/characters/P in view(1))
							if(P.npp == 1||P.npc == 1)
								usr << "<b>You cannot bring [P.name] with you."
							else
								P.loc=locate(M.x,M.y+1,M.z)
								P << "<b>[usr] brings you to [M] with Instant Transmission."
							usr.x = M:x
							usr.y = M:y-1
							usr.z = M:z
							usr.safe = 0
							usr << "You go infront of [M]."
							M << "[usr] blurs in front of you."


	worldscan
		verb
			World_Scan()
				set category = "Fighting"
				set name = "World Scan"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<b>------------------"
						usr << "<b><font color = blue>[M] :<font color = green> [M.powerlevel]"
						usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"
					else
						usr.powerlevel += 0



	uniscan
		verb
			Uni_Scan()
				set category = "Fighting"
				set name = "Universal Scan"
				for(var/mob/characters/M in world)
					usr << "<b>------------------"
					usr << "<b><font color = blue>[M] :<font color = green> [M.powerlevel]"
					usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"










	regen
		verb
			Regeneration()
				set name = "Regeneration"
				set category = "Fighting"
				if(usr.tech == 1)
					usr << "You feel yourself stop healing."
					usr.tech = 0
				else
					usr << "You feel yourself begin healing."
					usr.tech = 1
					usr.techcheck()
				usr.powerlevelRefresh()

	techwork
		verb
			Tech_Workings()
				set name = "Technical Workings"
				set category = "Fighting"
				if(usr.tech == 1)
					usr << "You turn off your Technical Workings."
					usr.tech = 0
				else
					usr << "You turn on your Technical Workings."
					usr.tech = 1
					usr.techcheck()


	wrap
		verb
			Wrap(mob/characters/M in oview(6))
				set name = "Wrap"
				set category = "Fighting"
				if(usr.ased == 1)
					usr << "<b>You have wrapped recently!!</b>"
				if(usr.ased == 0)
					if(usr.spar == 1)
						usr << "<b>You cant while sparring."
					if(usr.spar == 0)
						if(usr.flight == 1)
							usr << "<b>You are too busy to! (You are flying)."
						if(usr.flight == 0)
							M.kiloc = M.loc
							usr.powerlevel -= 100
							usr.powerlevelRefresh()
							s_missile('assimilate.dmi',usr,M)
							view(6) << "[usr.name] launches an Wrap attack at [M.name]!"
							sleep(5)
							if(M.loc == M.kiloc)
								usr.ased = 1
								view(6) << "<font color = blue><i>[M] gets held by [usr]'s Wrap!!"
								sleep(5)
								M.move = 0
								M.overlays += /obj/assim
								sleep(100)
								usr.ased = 0
								M.overlays -= /obj/assim
								M.move = 1




							else
								view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the wrap to go by him!"


	GalacticDonut
		verb
			GalacticDonut(mob/characters/M in oview(6))
				set name = "GalacticDonut"
				set category = "Fighting"
				if(usr.ased == 1)
					usr << "<b>You have used that to recently!!</b>"
				if(usr.ased == 0)
					if(usr.spar == 1)
						usr << "<b>You cant while sparring."
					if(usr.spar == 0)
						if(usr.flight == 1)
							usr << "<b>You are too busy to! (You are flying)."
						if(usr.resting==1)
							usr<<"You are Resting"
						if(usr.flight == 0&&usr.resting==0)
							M.kiloc = M.loc
							s_missile('Gdonut.dmi',usr,M)
							usr.powerlevel -= 100
							usr.powerlevelRefresh()
							view(6) << "[usr.name] launches an Galactic Donut attack at [M.name]!"
							sleep(5)
							if(M.loc == M.kiloc)
								usr.ased = 1
								view(6) << "<font color = blue><i>[M] gets held by [usr]'s Galactic Donut!!"
								sleep(5)
								M.move = 0
								M.overlays += /obj/Gdonut
								sleep(200)
								usr.ased = 0
								M.overlays -= /obj/Gdonut
								M.move = 1




							else
								view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the Galactic Donut to go by him!"



	bsplitform
		verb
			Multiply()
				set name = "Bman Multiply! ;)"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "<b>You cant while sparring."
				if(usr.spar == 0)
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
					if(usr.flight == 0)
						new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
						view(6) << "<font size = 1><font color = green>Oohhhweee!!! A new <font size = 3>Bman<font size = 1> is born!"



	kiabsorb
		verb
			Ki_Absorb()
				set name = "Ki Absorb"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "<b>You cant while sparring."
				else
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
					if(usr.resting==1)
						usr<<"You are resting"
					if(usr.flight == 0&&usr.resting==0||!usr.flight&& !usr.resting||usr.flight == 0&& !usr.resting || !usr.flight&& usr.resting == 0)
						if(usr.absorb == 1)
							usr << "<b>You are currently waiting to absorb."
						else
							view(6) << "<b><font color = blue>[usr.name] gets ready to absorb."
							usr.absorb = 1
							usr.overlays += /obj/kiabsorb
							sleep(50)
							usr.absorb = 0
							usr.overlays -= /obj/kiabsorb
				usr.powerlevelRefresh()





	bukujutsu
		verb
			bukujutsu(mob/monsters/M in view(1))
				set name = "Bukujutsu(Fly)"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "Not while sparring."
				if(usr.spar == 0)
					if(usr.z == 3)
						usr << "<b>There isnt enough room here."
					if(usr.z == 10)
						usr << "<b>Its way too heavy in here..."
					if(usr.z == 12)
						usr << "<b>There isnt enough room here."
					else
						if(usr.fly == 1)
							if(usr.flight == 1 || M.density == 0)
								usr << "You float to the ground..."
								usr.density = 1
								usr.flight = 0
								usr.meditate = 0
								usr.icon_state = ""
								if(usr.speed >= 10)
									usr.rundelay = 4
									if(usr.speed >= 30)
										usr.rundelay = 3
										if(usr.speed >= 70)
											usr.rundelay = 2
											if(usr.speed >= 100)
												usr.rundelay = 1
								if(M.friend == "[usr]")
									M.density = 1
									M.icon_state = ""
									M.follow = ""
							else
								usr << "You begin to float above...."
								usr.density = 0
								if(usr.speed >= 10)
									usr.rundelay = 3
									if(usr.speed >= 30)
										usr.rundelay = 2
										if(usr.speed >= 70)
											usr.rundelay = 1
											if(usr.speed >= 100)
												usr.rundelay = 0
								else
									usr.rundelay = 4
								if(M.friend == "[usr]")
									M.density = 0
									M.icon_state = "buku"
									M.follow = usr.name
									M.fusionfollow()
								usr.flight = 1
								usr.meditate = 0
								usr.icon_state = "buku"
						else
							usr<<"You aren't a Ghost"

	aura
		verb
			powerup()
				set name = "Power Up"
				set category = "Fighting"
				if(usr.ptime == 1)
					usr << "You just cant seem too."
				if(usr.ptime == 0)
					if(usr.powered == null||1||0)
						usr.powerlevelRefresh()
						if(usr.powerlevel >= usr.maxpowerlevel)
							usr << "You're at full powerlevel."
						if(usr.powerlevel < usr.maxpowerlevel)
							usr << "<B>An aura flickers around you."
							var/aura = 'whiteaura.dmi'
							aura += rgb(usr.customred,usr.customgreen,usr.customblue)
							usr.underlays += aura
							if(usr.powerlevel >= 1000000)
								usr.overlays += /obj/ray
							if(usr.powerlevel < 1000000)
								usr.powerlevel += 0
							usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
							usr.powerlevel = round(usr.powerlevel)
							usr.stamina -= rand(1,10)
							sleep(50)
							if(usr.stamina <= 10)

								usr.underlays -= aura
							if(usr.stamina > 11)
								if(usr.powerlevel >= usr.maxpowerlevel)
									usr.underlays -= aura

								if(usr.powerlevel < usr.maxpowerlevel)
									usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
									usr.powerlevel = round(usr.powerlevel)
									usr.stamina -= rand(1,10)
									sleep(50)
								if(usr.stamina <= 10)

									usr.underlays -= aura
								if(usr.stamina > 11)
									if(usr.powerlevel >= usr.maxpowerlevel)
										usr.underlays -= aura

									if(usr.powerlevel < usr.maxpowerlevel)
										usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
										usr.powerlevel = round(usr.powerlevel)
										usr.stamina -= rand(1,10)
										sleep(50)
									if(usr.stamina <= 10)

										usr.underlays -= aura
									if(usr.stamina > 11)
										if(usr.powerlevel >= usr.maxpowerlevel)
											usr.underlays -= aura

										if(usr.powerlevel < usr.maxpowerlevel)
											usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
											usr.powerlevel = round(usr.powerlevel)
											usr.stamina -= rand(1,10)
											sleep(50)
										if(usr.stamina <= 10)

											usr.underlays -= aura
										if(usr.stamina > 11)
											if(usr.powerlevel >= usr.maxpowerlevel)
												usr.underlays -= aura

											if(usr.powerlevel < usr.maxpowerlevel)
												usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
												usr.powerlevel = round(usr.powerlevel)
												usr.stamina -= rand(1,10)
												sleep(50)
											if(usr.stamina <= 10)

												usr.underlays -= aura
											if(usr.stamina > 11)
												if(usr.powerlevel >= usr.maxpowerlevel)
													usr.underlays -= aura

												if(usr.powerlevel < usr.maxpowerlevel)
													usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
													usr.powerlevel = round(usr.powerlevel)
													usr.stamina -= rand(1,10)
													sleep(50)
												if(usr.stamina <= 10)

													usr.underlays -= aura
												if(usr.stamina > 11)
													if(usr.powerlevel >= usr.maxpowerlevel)
														usr.underlays -= aura

													if(usr.powerlevel < usr.maxpowerlevel)
														usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
														usr.powerlevel = round(usr.powerlevel)
														usr.stamina -= rand(1,10)
														sleep(50)
													if(usr.stamina <= 10)

														usr.underlays -= aura
													if(usr.stamina > 11)
														if(usr.powerlevel >= usr.maxpowerlevel)
															usr.underlays -= aura

														if(usr.powerlevel < usr.maxpowerlevel)
															usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
															usr.powerlevel = round(usr.powerlevel)
															usr.stamina -= rand(1,10)
															sleep(50)
														if(usr.stamina <= 10)

															usr.underlays -= aura
														if(usr.stamina > 11)
															if(usr.powerlevel >= usr.maxpowerlevel)
																usr.underlays -= aura

															if(usr.powerlevel < usr.maxpowerlevel)
																usr.powerlevel += (usr.maxpowerlevel / rand(8,10))
																usr.powerlevel = round(usr.powerlevel)
															usr.stamina -= rand(1,10)
							usr << "You finish powering up."
							usr.underlays -= aura
							usr.overlays -= /obj/ray
							usr.ptime = 1
							sleep(1800)
							usr.ptime = 0




			powerdown()
				set name = "Power Down"
				set category = "Fighting"
				var/amount = input("What powerlevel do you wish to powerdown to?", "Power Down") as num|null
				if(amount >= usr.powerlevel)
					usr << "<b>You must power-up for that."
				if(amount < usr.powerlevel)
					if(amount < 0)
						usr << "<b>You dont want to die, do you?"
					if(amount >= 1)
						usr << "<b>You lower your powerlevel to <font color = blue>[amount]</font>."
						oview(20) << "<i><font color = blue>You sense a powerlevel drop in the distance."
						usr.powerlevel = amount
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura
						usr.overlays -= 'whiteaura.dmi'
						usr.overlays -= /obj/whiteaura

						usr.powerlevelRefresh()

	focus
		verb
			Focus()
				set name = "Focus"
				set category = "Fighting"
				set desc = "To focus inner strength."
				if(usr.ptime == 1)
					usr << "You cant seem to store it."
				if(usr.ptime == 0)
					if(usr.focused == 1)
						usr << "You are focused already."
					if(usr.focused == 0)
						var/amount = input("How much powerlevel do you wish to focus?", "Focus") as num|null
						if(amount < 0)
							usr << "You cant focus that"
							return 0
						if(amount > (usr.maxpowerlevel * 1.5))
							usr << "<b>You begin to feel the energy absorb into  you...."
							sleep(20)
							view(6) << "<font color = blue><i>[usr] explodes while focusing energy into himself!"
							usr.powerlevel = 0
							usr.Die()
						if(amount <= (usr.maxpowerlevel * 1.5))
							usr << "<b>You begin to feel the energy absorb into you...."
							usr.focused = 1
							sleep(20)
							usr.powerlevel = amount
							sleep(300)
							if(usr.powerlevel <= usr.maxpowerlevel)
								usr.powerlevel += 0
								usr.ptime = 1
								usr.focused = 0
								sleep(3000)
								usr.ptime = 0
							if(usr.powerlevel > usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
								usr << "<b>The energy escapes from you."
								usr.ptime = 1
								usr.focused = 0
								sleep(3000)
								usr.ptime = 0



						usr.powerlevelRefresh()




	Kaioken
		verb
			Kaioken()
				set category = "Fighting"
				var/amount = input("What level of Kaioken?") as num|null
				if(amount == 0||amount == null)
					usr << "<b>You begin to release your kaioken...."
					sleep(rand(50,150))
					usr.kaioken = 0
					if(usr.powerlevel < usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.underlays -= 'kaioaura.dmi'
					usr.overlays-='elec.dmi'
				if(amount >= 1)
					if(amount > (usr.maxpowerlevel / 1341))
						usr << "<b>From too much pressure, you explode under Kaioken!!!"
						view(6) << "<b>[usr] explodes from the use of Kaioken!"
						usr.powerlevel = 0
						usr.Die()
					if(amount <= (usr.maxpowerlevel / 1341) && usr.ssj==0)
						if(usr.kaioken == 1)
							usr << "You need to wait."
						if(usr.kaioken == 0)
							if(amount > 100)
								usr << "Sorry Kaoken cant go that high"
							if(amount ==100)
								if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
									usr<<"You go Giji Super Sayajin!"
									view(6) << "<font color = red><b>GIJI SUPERSAIYAJIN!!!!!"
								else
									view(6) << "<font color = red><b>SUPER KAOKEN!!!"
								amount = round(amount)
								usr.powerlevel += (amount * 1341)
								usr.powerlevel = round(usr.powerlevel)

								usr.stamina -= (rand(1,30))
								usr.overlays+='elec.dmi'
								usr.kaiokenstrain()
							usr.underlays += 'kaioaura.dmi'
							usr.kaioken = 1
							if(amount<100)
								amount = round(amount)
								usr.powerlevel += (amount * 1341)
								usr.powerlevel = round(usr.powerlevel)
								view(6) << "<font color = red><b>KAIOKEN TIMES [amount]!!!"
								usr.stamina -= (rand(1,30))
								usr.kaiokenstrain()
							usr.underlays += 'kaioaura.dmi'
							usr.kaioken = 1
						usr.powerlevelRefresh()
					else
						usr << "Cant use Kaioken and Be a Super Saiyajin"


	Zanzoken
		verb
			Zanzoken()
				set category = "Fighting"
				if(usr.invisibility == 1)
					usr << "You stop using Zanzoken."
					usr.invisibility = 0
					usr.zanzoken = 0
				else
					usr << "You start using Zanzoken."
					usr.icon_state = "zan"
					sleep(6)
					usr.icon_state = ""
					usr.invisibility = 1
					usr.zanzoken = 1
					if(usr.key == "Phoenix Man")
						return
					else
						testing
						if(usr.zanzoken == 1)
							sleep(6)
							usr.stamina -= rand(1,2)
							if(usr.stamina <= 1)
								usr << "You stop using Zanzoken, because it wore off."
								usr.invisibility = 0
							else
								goto testing

//Blasts//
obj
	kame
		icon = 'turfs.dmi'
		icon_state = "Kame"
		layer = MOB_LAYER + 99
obj
	renzuko
		icon='kame.dmi'
		icon_state="Renzuko"
		layer = MOB_LAYER + 99
obj/techs
	Kamehameha
		verb
			Kamehameha(mob/characters/M in oview(6))
				set name = "Kame Hame Ha"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					var/amount = input("How much energy do you wish to put into it?") as num|null
					amount = round(amount)

					if(amount >= 1)
						if(amount > usr.powerlevel)
							usr.kame = 1
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Kaaaa....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Meeee....."
							sleep(18)
							usr.overlays += /obj/kame
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Haaaa....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Meeee....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!!!"
							view(6) << "<font color = red>From putting too much energy in the Kame Hame Ha wave, [usr] explodes!"
							usr.overlays -= /obj/kame
							usr.powerlevel = 0
							usr.kame = 0
							usr.overlays -= /obj/kame
							usr.Die()
						if(amount <= usr.powerlevel)
							usr.kame = 1
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Kaaaa....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Meeee....."
							sleep(18)
							usr.overlays += /obj/kame
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Haaaa....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>Meeee....."
							sleep(18)
							view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!!!"
							usr.overlays -= /obj/kame
							if(M.z == usr.z)
								usr.overlays -= /obj/kame
								s_missile('kame.dmi', usr, M)
								usr.kame = 0
								usr.powerlevel -= amount
								if(M.absorb == 1)
									view(6) << "[M] absorbs [usr]'s Kame Hame ha!"
									M.powerlevel += amount
								if(M.absorb == 0)
									M.health -= amount/M.defense
									view(6) << "<font color = red>[usr] shoots a Kame Hame Ha at [M]!!!"
								M.Die()
								usr.KO()
							else
								usr << "<b>You launch your Kame Hame Ha, but [M] is out of sight."
								usr.overlays -= /obj/kame
								usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	BigBang
		verb
			BigBang(mob/characters/M in oview(6))
				set name = "Big Bang"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Big"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Bang"
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"
								view(6) << "<font color = red>From putting too much energy in the Big Bang Attack, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Big"
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Bang"
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Big Bang attack!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('bigbang.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Big Bang Attack at [M]!!!"
												M.powerlevel -= amount
										else
											view(6) << "<font color = red>[usr] shoots a Big Bang Attack at [M]!!!"
											M.powerlevel -= amount

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Big Bang Attack, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	Masenko
		verb
			Masenko(mob/characters/M in oview(6))
				set name = "Masenko"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Ma..."
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>senko...."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!"
								view(6) << "<font color = red>From putting too much energy in the Masenko Attack, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Ma..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>senko..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame2.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame2b.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Masenko!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame2.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame2b.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Masenko at [M]!!!"
												M.health -= amount/M.defense
										else
											view(6) << "<font color = red>[usr] shoots a Masenko at [M]!!!"
											M.health -= amount/M.defense

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Masenko, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	FinalFlash
		verb
			FinalFlash(mob/characters/M in oview(6))
				set name = "Final Flash"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Final......"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Flash...."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!"
								view(6) << "<font color = red>From putting too much energy in the Final Flash Attack, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Final..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Flash..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame3.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame3b.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Final Flash!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame3.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame3b.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Final Flash at [M]!!!"
												M.health -= amount/M.defense
										else
											view(6) << "<font color = red>[usr] shoots a Final Flash at [M]!!!"
											M.health -= amount/defense

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Final Flash, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	SpecialBeamCannon
		verb
			SpecialBeamCannon(mob/characters/M in oview(6))
				set name = "Special Beam Cannon"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>SPECIAL......"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>BEAM...."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>CANNON!!!"
								view(6) << "<font color = red>From putting too much energy in the special beam cannon, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>SPECIAL..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>BEAM..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>CANNON!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame4.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame4b.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Special Beam Cannon!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame4.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame4b.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Special Beam Cannon at [M]!!!"
												M.health -= amount/M.defense
										else
											view(6) << "<font color = red>[usr] shoots a Special Beam Cannon at [M]!!!"
											M.health -= amount/M.defense

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Special Beam Cannon, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	DonDonPa
		verb
			DonDonPa(mob/characters/M in oview(6))
				set name = "Dondonpa"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Don......"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Don...."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>PA!!!"
								view(6) << "<font color = red>From putting too much energy in the DonDonPa, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Don..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Don..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>PA!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame5.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									sleep(0.001)
									s_missile('kame5b.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Dondonpa!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame5.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												sleep(0.001)
												s_missile('kame5b.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Dondonpa at [M]!!!"
												M.health -= amount/M.defense
										else
											view(6) << "<font color = red>[usr] shoots a Dondonpa at [M]!!!"
											M.health -= amount/M.defense

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Dondonpa, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
						usr.powerlevelRefresh()
						M.powerlevelRefresh()

	Burning
		verb
			Burning(mob/characters/M in oview(6))
				set name = "BurningAttack"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount = input("How much energy do you wish to put into it?") as num|null
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>*moves arms like crazy*......"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>BURNING...."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"
								view(6) << "<font color = red>From putting too much energy in the Burning Attack, [usr] explodes!"
								usr.overlays -= /obj/kame
								usr.powerlevel = 0
								usr.kame = 0
								usr.Die()
							if(amount <= usr.powerlevel)
								usr.kame = 1
								usr.overlays += /obj/kame
								view(6) << "<font color = red>[usr]:<font color = white> <tt>*moves arms like crazy*"
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>BURNING..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"
								usr.overlays -= /obj/kame
								if(M.z == usr.z)
									usr.overlays -= /obj/kame
									s_missile('kame6.dmi', usr, M)
									usr.kame = 0
									usr.powerlevel -= amount
									if(M.absorb == 1)
										view(6) << "[M] absorbs [usr]'s Burning Attack!"
										M.powerlevel += amount
									if(M.absorb == 0)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame6.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a Burning Attack at [M]!!!"
												M.health -= amount/M.defense
										else
											view(6) << "<font color = red>[usr] shoots a Burning Attack at [M]!!!"
											M.health -= amount/M.defense

											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Burning Attack, but [M] is out of sight."
									usr.overlays -= /obj/kame
									usr.kame = 0
					usr.powerlevelRefresh()
					M.powerlevelRefresh()

	Renzuko
		verb
			Renzuko(mob/characters/M in oview(6))
				set name = "Renzuko Energy Dan"
				set category = "Fighting"
				if(usr.pk == 0)
					usr << "You need to turn PK Mode on"
				if(M.pk == 0)
					usr << "Not while he/she is not in PK Mode"
				else
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0)
						var/amount =usr.powerlevel/50
						amount = usr.powerlevel/50

						if(amount >= 1)
							if(usr.stamina<=0)
								usr.kame = 1

								view(6) << "<font color = red>[usr]:<font color = white> <tt>Prepair to die!!"
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Renzuko energy dan!!."
								sleep(30)
								sleep(30)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Ha..."
								view(6) << "<font color = red>,[usr]puts is so exhausted he faints!"
								usr.overlays += /obj/renzuko
								sleep(0.001)
								usr.overlays -= /obj/renzuko
								usr.powerlevel = 0
								usr.kame = 0
								usr.powerlevelRefresh()
								usr.KO()
							if(usr.stamina>0)
								usr.kame = 1

								view(6) << "<font color = red>[usr]:<font color = white> <tt>Prepair to die!!..."
								sleep(20)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Renzuko energy dan!!"
								sleep(20)
								usr.overlays += /obj/renzuko
								view(6) << "<font color = red>[usr]:<font color = white> <tt>HA,HA,HA,HA,HA,HA!!!"
								sleep(2)
								usr.stamina-=35
								if(M.z == usr.z)
									usr.overlays -= /obj/renzuko
									s_missile('kame7.dmi', usr, M)
									sleep(5)
									s_missile('kame7.dmi', usr, M)
									sleep(5)
									s_missile('kame7.dmi', usr, M)
									sleep(5)
									s_missile('kame7.dmi', usr, M)
									sleep(5)
									s_missile('kame7.dmi', usr, M)
									sleep(5)
									s_missile('kame7.dmi', usr, M)
									usr.kame = 0
									sleep(7)
									usr.overlays -= /obj/renzuko

									if(M.absorb == 0||M.absorb==1)
										if(M.powerlevel >= usr.powerlevel)
											M.random = rand(1,3)
											if(M.random == 3)
												view(6) << "[M] reflects [usr]'s blast back at him!"
												s_missile('kame7.dmi', M, usr)
												usr.health -= amount/usr.defense
												usr.powerlevelRefresh()
												M.powerlevelRefresh()
												usr.Die()
											else

												view(6) << "<font color = red>[usr] shoots a barrage of ki blasts at [M]!!!"
												M.health -= amount/M.defense
												M.health -= amount/M.defense
												M.health -= amount/M.defense
												M.health -= amount/M.defense
												M.health -= amount/M.defense
												M.health -= amount/M.defense
												usr.powerlevelRefresh()
												M.powerlevelRefresh()
										else
											view(6) << "<font color = red>[usr] shoots a barrage of ki blasts at [M]!!!"
											M.health -= amount/M.defense
											M.health -= amount/M.defense
											M.health -= amount/M.defense
											M.health -= amount/M.defense
											M.health -= amount/M.defense
											M.health -= amount/M.defense
											usr.powerlevelRefresh()
											M.powerlevelRefresh()
											M.Die()
											usr.KO()
								else
									usr << "<b>You launch your Renzuko energy dan, but [M] is out of sight."
									usr.overlays -= /obj/renzuko
									usr.kame = 0