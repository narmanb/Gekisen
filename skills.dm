mob/proc/Getpissed()
	if(src.enragelevel<4)
		src.enragelevel+=1
		if(src.powerlevel>src.maxpowerlevel*10)
			src.powerlevel=src.maxpowerlevel*10
		var/oldpowerlevel=src.powerlevel
		src.powerlevel=(src.powerlevel*125)/100
		if(src.powerlevel>src.maxpowerlevel*10)
			src.powerlevel=src.maxpowerlevel*10
		var/increase=src.powerlevel-oldpowerlevel
		src.enragegain+=increase
		spawn()
			src.SSJ()
			src.SNJ()
		src.Ragecool()
mob/proc/refreshcustomverbs()
	sleep(10)
	if(src.customattacks[1])
		var/slot=1
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_1(src,namez)
	if(src.customattacks[2])
		var/slot=2
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_2(src,namez)
	if(src.customattacks[3])
		var/slot=3
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_3(src,namez)
	if(src.customattacks[4])
		var/slot=4
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_4(src,namez)
	if(src.customattacks[5])
		var/slot=5
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_5(src,namez)
	if(src.customattacks[6])
		var/slot=6
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_6(src,namez)
	if(src.customattacks[7])
		var/slot=7
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_7(src,namez)
	if(src.customattacks[8])
		var/slot=8
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_8(src,namez)
	if(src.customattacks[9])
		var/slot=9
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_9(src,namez)
	if(src.customattacks[10])
		var/slot=10
		var/savefile/F = new("attacks/[src.customattacks[slot]].sav")
		var/namez
		F["name"]>>namez
		new/mob/Customattack/verb/custom_10(src,namez)
mob/proc/Ragecool()
	if(src.enragelevel==1)
		sleep(600)
		if(src.enragelevel==1)
			src.enragelevel=0
			src.powerlevel-=src.enragegain
			src.enragegain=0
	if(src.enragelevel==2)
		sleep(1200)
		if(src.enragelevel==2)
			src.enragelevel=0
			src.powerlevel-=src.enragegain
			src.enragegain=0
	if(src.enragelevel==3)
		sleep(1800)
		if(src.enragelevel==3)
			src.enragelevel=0
			src.powerlevel-=src.enragegain
			src.enragegain=0
	if(src.enragelevel==4)
		sleep(2400)
		if(src.enragelevel==4)
			src.enragelevel=0
			src.powerlevel-=src.enragegain
			src.enragegain=0
mob
	ChouKamehameha
		verb
			ChouKamehameha()
				set name = "Chou Kamehameha"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[10]

						if(amount >= 2000)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1

									if(usr.sounds==1)
										spawn()usr<<'sounds/kame_charge.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/kame_charge.wav'
									var/temp=usr.icon_state
									usr.icon_state="ki"
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>KAME HAME HA!!!"
									usr.ki-= amount
									amount=amount*450
									if(usr.kame==1)
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										usr.move=0
										var/obj/X
										if(usr.dir==NORTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
										if(usr.dir==EAST)
											X = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
										if(usr.dir==SOUTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
										if(usr.dir==WEST)
											X = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
										X.dir=usr.dir
										if(X.dir==4)
											X.overlays+=new/obj/Choukamehameha/c23
											X.overlays+=new/obj/Choukamehameha/c24
											X.overlays+=new/obj/Choukamehameha/c33
											X.overlays+=new/obj/Choukamehameha/c34
										if(X.dir==8)
											X.overlays+=new/obj/Choukamehameha/c23
											X.overlays+=new/obj/Choukamehameha/c24
											X.overlays+=new/obj/Choukamehameha/c33
											X.overlays+=new/obj/Choukamehameha/c34
										if(X.dir==1)
											X.overlays+=new/obj/Choukamehameha/c21
											X.overlays+=new/obj/Choukamehameha/c22
											X.overlays+=new/obj/Choukamehameha/c31
											X.overlays+=new/obj/Choukamehameha/c32
										if(X.dir==2)
											X.overlays+=new/obj/Choukamehameha/c21
											X.overlays+=new/obj/Choukamehameha/c22
											X.overlays+=new/obj/Choukamehameha/c31
											X.overlays+=new/obj/Choukamehameha/c32
										X.kitype=2
										if(usr.sounds==1)
											spawn()usr<<'sounds/kamehameha_fire.wav'
										for(var/mob/characters/L in oview(4))
											if(L.client)
												if(L.sounds==1)
													spawn()L<<'sounds/kamehameha_fire.wav'
										Firestraight(X,'kame7.dmi',amount,X.dir,usr,'choutrail.dmi',12)
										usr.icon_state=temp
									//	usr.move=1
									//	usr.kame=0
						else
							usr<<"You must use more than 2000 ki for a Chou Kamehameha"
						for(var/obj/U in oview(9))
							if(U.npc==5)
								del(U)
						usr.kame=0



mob
	Personalizedattack
		verb
			Customizeattck()
				set category = "Fighting"
				set name = "Customize specialattack"
				if(usr.customizing==0)
					usr.customizing=1
					var/q1=input("What do you want to name your ki attack?") as null|text
					if(q1=="")
						q1="Custom Attack"
					else
						usr.customname=q1
					switch(input("What blast style do you want?", "Customization", text) in list ("Energy Blast(Big Bang style)","Energy Ball(Spirit bomb style)","Energy Beam(Freiza beam style)"))
						if("Energy Blast(Big Bang style)")
							usr.kiblasttype=1
						if("Energy Ball(Spirit bomb style)")
							usr.kiblasttype=2
						if("Energy Beam(Freiza beam style)")
							usr.kiblasttype=3
					var/q2=input("How much red do you want to be in it? 0=black,255=white") as null|num
					usr.kired=q2
					var/q3=input("How much green do you want to be in it? 0=black,255=white") as null|num
					usr.kigreen=q3
					var/q4=input("How much blue do you want to be in it? 0=black,255=white") as null|num
					usr.kiblue=q4
					var/q5=input("What do you want to say when you use it?") as null|text
					usr.kispeech=q5
					var/points=5
					alert(usr,"Choose what you prefer in your attack, firing speed or power.")
					usr.powerbonus=280
					usr.timebonus=20
					loop
					if(points>0)
						var/speed = "Blast Speed ([usr.timebonus])"
						var/power = "Blast Power ([usr.powerbonus])"
						var/takespeed = "Remove Blast Speed ([usr.timebonus])"
						var/takepower = "Remove Blast Power ([usr.powerbonus])"
						var/list/menu = new()
						menu += speed
						menu += power
						menu += takepower
						menu += takespeed
						var/result = input("Points remaining ([points])", ".Ki blast") in menu
						if (result == speed)
							usr.timebonus+=10
							points-=1
							goto loop
						if (result == power)
							usr.powerbonus+=20
							points-=1
							goto loop
						if (result == takespeed)
							if(usr.timebonus>=20)
								usr.timebonus-=10
								points+=1
							goto loop
						if (result == takepower)
							if(usr.powerbonus>=40)
								usr.powerbonus-=20
								points+=1
							goto loop
					usr.customizing=0
// Personlized Attack Category Setting & Usage
			Personalattck(mob/characters/M in oview(8))
				set category = "Fighting"
				set name = "CustomAttack"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[14]
						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									usr.overlays += /obj/kame
									var/kispeed= 150-usr.timebonus
									sleep(kispeed)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>[usr.kispeech]"
									usr.overlays -= /obj/kame
									if(M.z == usr.z)
										usr.overlays -= /obj/kame
										if(usr.kiblasttype==1)
											usr.custommissile='kamex.dmi'
										if(usr.kiblasttype==0|null)
											usr.custommissile='kamex.dmi'
										if(usr.kiblasttype==2)
											usr.custommissile='kamex2.dmi'
										if(usr.kiblasttype==3)
											usr.custommissile='kamex3.dmi'
										usr.custommissile+= rgb(usr.kired,usr.kigreen,usr.kiblue)
										if(usr.custommissile)
											s_missile(usr.custommissile, usr, M)
										usr.custommissile=""
										spawn(3)usr.kame = 0
										usr.ki -= amount
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										amount=amount*usr.powerbonus
										amount=((amount*50)/(M.powerlevel+1))
										if(M.absorb == 1)
											view(6) << "[M] absorbs [usr]'s [usr.customname]!"
											M.ki += amount
										if(M.absorb == 0)
											if(M)
												if(M.powerlevel >= usr.powerlevel)
													M.random = rand(1,3)
													if(M.random == 3)
														view(6) << "[M] reflects [usr]'s blast back at him!"
														if(usr.custommissile)
															s_missile(custommissile, M, usr)
														usr.hp-= amount


														if(usr)

															var/O = new /obj/crator(usr.loc)
															var/I = new /mob/smoke(usr.loc)
															flick("smoke",I)
															spawn()usr.Die()

															sleep(50)
															del(I)
															////flick("disapear",O:mob)
															sleep(200)
															del(O)
													else

														view(6) << "<font color = red>[usr] shoots a [usr.customname] at [M]!!!"
														if(M.block==1)
															M.hp-= amount /10
														else
															M.hp-= amount
														spawn()
															if(M.race!=null|"")
																var/O = new /obj/crator(M.loc)
																var/I = new /mob/smoke(M.loc)
																flick("smoke",I)
																M.Die()
																sleep(50)
																del(I)
																//flick("disapear",O:mob)
																sleep(200)
																del(O)
														spawn()usr.KO()
												else
													view(6) << "<font color = red>[usr] shoots a [usr.customname] at [M]!!!"
													if(M.block==1)
														M.hp-= amount /10
													else
														M.hp-= amount
													if(M.race!=null|"")

														var/O = new /obj/crator(M.loc)
														var/I = new /mob/smoke(M.loc)
														flick("smoke",I)
														M.Die()

														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)

													spawn()usr.KO()
									else
										usr << "<b>You launch your [usr.customname], but [M] is out of sight."
										usr.overlays -= /obj/kame
										spawn(3)usr.kame = 0



mob
	spiritbomb
		verb
			sbomb(mob/characters/M in oview(15))
				set name = "Spirit Bomb"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "You are firing something already."
					if(usr.kame == 0 && usr.move==1)
						var/initialdam = input("How much do you wish to put into the spirit bomb?") as num|null
						if(initialdam > usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								initialdam=usr.ki
								view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
								var/obj/snart = new /obj/sbomb(locate(usr.x,usr.y+1,usr.z))
								var/dam=initialdam

								snart.owner=usr.key
								usr.icon_state = "sbomb"
								usr.kame = 1
								usr.ki -= dam
								dam*=(usr.powerlevel/usr.maxpowerlevel)
								loop
								sleep(100)
								switch(input("Do you wish to fire the spirit bomb??or continue charging.", "Spirit Bomb", text) in list ("Fire", "Charge"))
									if ("Fire")
										M=src
										del(snart)
										if(usr.sounds==1)
											spawn()usr<<'sounds/spiritbomb_fire.wav'
										for(var/mob/characters/L in oview(4))
											if(L.client)
												if(L.sounds==1)
													spawn()L<<'sounds/spiritbomb_fire.wav'
										spawn(3)usr.kame = 0
										dam=dam*600
										dam=(dam/(src.powerlevel+1))*50
										usr.icon_state=""
										var/inrange=0
										if(src)
											if(src.z==usr.z)
												inrange=1
										if(inrange==1)
											s_missile('sbomb.dmi',usr,src)
											sleep(5)
											if(src)
												src.hp-= dam

												if(src.race!=null|"")
													if(usr.sounds==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/characters/L in oview(4))
														if(L.client)
															if(L.sounds==1)
																spawn()L<<'sounds/expload.wav'
													var/O = new /obj/crator(src.loc)
													var/I = new /mob/smoke(src.loc)
													spawn()src.Die()
													flick("smoke",I)
													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)
											spawn()usr.KO()
									if ("Charge")
										dam+=(dam/10)
										for(var/mob/characters/o in oview(2))
											switch(input(o,"Do you want to help charge [usr]'s Spirit Bomb?.", "Spirit Bomb", text) in list ("Yes", "No"))
												if("Yes")
													var/dam2 = input(o,"How much do you wish to put into the spirit bomb?") as num|null
													if(dam2<o.ki&&dam2>0)
														dam+=dam2
														o.ki-=dam2
										goto loop

						if(initialdam <= usr.ki && initialdam>0)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
								var/obj/snart = new /obj/sbomb(locate(usr.x,usr.y+1,usr.z))
								var/dam=initialdam
								snart.owner=usr.key
								usr.icon_state = "sbomb"
								usr.kame = 1
								usr.ki -= dam
								dam*=(usr.powerlevel/usr.maxpowerlevel)
								loop
								sleep(100)
								switch(input("Do you wish to fire the spirit bomb??or continue charging.", "Spirit Bomb", text) in list ("Fire", "Charge"))
									if ("Fire")
										if(usr.sounds==1)
											spawn()usr<<'sounds/spiritbomb_fire.wav'
										for(var/mob/characters/L in oview(4))
											if(L.client)
												if(L.sounds==1)
													spawn()L<<'sounds/spiritbomb_fire.wav'
										del(snart)
										spawn(3)usr.kame = 0
										dam=dam*400
										dam=(dam/(M.powerlevel+1))*50
										usr.icon_state=""
										var/inrange=0
										if(M)
											if(M.z==usr.z)
												inrange=1
										if(inrange==1)
											s_missile('sbomb.dmi',usr,M)
											sleep(5)
											spawn()usr.KO()
											if(M)
												M.hp-= dam
												if(M.race!=null|"")
													if(usr.sounds==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/characters/L in oview(4))
														if(L.client)
															if(L.sounds==1)
																spawn()L<<'sounds/expload.wav'
													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													spawn()M.Die()
													flick("smoke",I)
													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)
									if ("Charge")
										dam+=(dam/10)
										for(var/mob/characters/o in oview(2))
											switch(input(o,"Do you want to help charge [usr]'s Spirit Bomb?.", "Spirit Bomb", text) in list ("Yes", "No"))
												if("Yes")
													var/dam2 = input(o,"How much do you wish to put into the spirit bomb?") as num|null
													if(dam2<o.ki&&dam2>0)
														dam+=dam2
														o.ki-=dam2
										goto loop

mob
	chouspiritbomb
		verb
			sbomb(mob/characters/M in oview(15))
				set name = "Chou Spirit Bomb"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "You are firing something already."
					if(usr.kame == 0 && usr.move==1)
						var/initialdam = input("How much do you wish to put into the spirit bomb?") as num|null
						if(initialdam > usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								initialdam=usr.ki
								view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
								if(initialdam<2000)
									usr<<"A chou spirit bomb requires at least 2000 ki to be created."
								if(initialdam>=2000)
									var/obj/snart = new /obj/sbombprojectile(locate(usr.x,usr.y+1,usr.z))
									var/dam=initialdam
									snart.owner=usr.key
									usr.icon_state = "sbomb"
									usr.kame = 1
									usr.ki -= dam
									dam*=(usr.powerlevel/usr.maxpowerlevel)
									loop
									sleep(100)
									switch(input("Do you wish to fire the spirit bomb??or continue charging.", "Spirit Bomb", text) in list ("Fire", "Charge"))
										if ("Fire")
											if(usr.sounds==1)
												spawn()usr<<'sounds/spiritbomb_fire.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/spiritbomb_fire.wav'
											spawn(3)usr.kame = 0
											dam=dam*500
											dam=(dam/(M.powerlevel+1))*50
											usr.icon_state=""
											var/inrange=0
											if(M)
												if(M.z==usr.z)
													inrange=1
											if(inrange==1)
												s_missile(snart,usr,M)
												sleep(20)
												del(snart)
												sleep(5)
												spawn()usr.KO()
												if(M)
													M.hp-= dam
													if(M.race!=null|"")
														if(usr.sounds==1)
															spawn()usr<<'sounds/expload.wav'
														for(var/mob/characters/L in oview(4))
															if(L.client)
																if(L.sounds==1)
																	spawn()L<<'sounds/expload.wav'
														var/O = new /obj/crator(M.loc)
														var/I = new /mob/smoke(M.loc)
														spawn()M.Die()
														flick("smoke",I)
														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
										if ("Charge")
											dam+=(dam/10)
											for(var/mob/characters/o in oview(4))
												switch(input(o,"Do you want to help charge [usr]'s Spirit Bomb?.", "Spirit Bomb", text) in list ("Yes", "No"))

													if("Yes")
														var/dam2 = input(o,"How much do you wish to put into the spirit bomb?") as num|null
														if(dam2<o.ki&&dam2>0)
															dam+=dam2
															o.ki-=dam2
											goto loop
						if(initialdam <= usr.ki && initialdam>0)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								view(6) << "[usr] begins charging a Spirit Bomb!!!</u></b>"
								if(initialdam<2000)
									usr<<"You need to use at least 2000 ki to create a spirit bomb."
								if(initialdam>=2000)
									var/obj/snart = new /obj/sbombprojectile(locate(usr.x,usr.y+1,usr.z))
									var/dam=initialdam
									snart.owner=usr.key
									usr.icon_state = "sbomb"
									usr.kame = 1
									usr.ki -= dam
									dam*=(usr.powerlevel/usr.maxpowerlevel)
									loop
									sleep(100)
									switch(input("Do you wish to fire the spirit bomb??or continue charging.", "Spirit Bomb", text) in list ("Fire", "Charge"))
										if ("Fire")
											if(usr.sounds==1)
												spawn()usr<<'sounds/spiritbomb_fire.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/spiritbomb_fire.wav'
											spawn(3)usr.kame = 0
											dam=dam*400
											dam=(dam/(M.powerlevel+1))*50
											usr.icon_state=""
											var/inrange=0
											if(M)
												if(M.z==usr.z)
													inrange=1
											if(inrange==1)
												s_missile(snart,usr,M)
												sleep(20)
												del(snart)
												spawn()usr.KO()
												if(M)
													M.hp-= dam
													if(M.race!=null|"")
														if(usr.sounds==1)
															spawn()usr<<'sounds/expload.wav'
														for(var/mob/characters/L in oview(4))
															if(L.client)
																if(L.sounds==1)
																	spawn()L<<'sounds/expload.wav'
														var/O = new /obj/crator(M.loc)
														var/I = new /mob/smoke(M.loc)
														spawn()M.Die()
														flick("smoke",I)
														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
										if ("Charge")
											dam+=(dam/10)
											for(var/mob/characters/o in oview(2))
												switch(input(o,"Do you want to help charge [usr]'s Spirit Bomb?.", "Spirit Bomb", text) in list ("Yes", "No"))
													if("Yes")
														var/dam2 = input(o,"How much do you wish to put into the spirit bomb?") as num|null
														if(dam2<o.ki&&dam2>0)
															dam+=dam2
															o.ki-=dam2
											goto loop


var/list/GuildMasters=list("Hikitsu","Volk900","Tasukisan ","Silverstar9","Darktasuki13")
var/list/GuildNames=list("")

area/GuildPass
	Enter(mob/characters/O)
		if(istype(O,/mob/characters))
			for(var/X in GuildMasters)
				if(X==O.key||X==O.name)
					return 1
				else
					return 0


mob
	itx
		verb
			Weights1(mob/M in world)
				set name= "Weight System (500 weight Gain!*500 zenni)"
				set category = "Training"
				set popup_menu = 1
				set src = usr
				var/obj/xcontents = input("Contents","Contents") in M.contents
				if(M.ckey==src.key)

				else
					usr << "No you aren't!!!"
					if(M.zenni<500||src.worn == 1)
						M << "Not enough zenni!!!!, or Item is in use"
					else
						if(M.weight>180005)
							M << "Too much anchor!!!"
						else
							xcontents.weight+=500
							src.zenni-=500
							M << "This will cost you 500 zenni! 500 Weight Added"

mob
	itx
		verb
			Weights12(mob/M in world)
				set name= "Weight System (Remove 500 weight Gain!)"
				set category = "Training"
				set popup_menu = 1
				set src = usr
				var/obj/xcontents = input("Contents","Contents") in M.contents
				if(M.ckey==src.key)


				else
					usr << "No you aren't!!!"

					if(src.worn == 1)
						M << "Item is in use"
					else
						if(M.weight==0)
							M << "No more anchor!!!"
						else
							xcontents.weight-=500
							M << "500 weight removed"



mob
	itx
		verb
			Instant_Transmission2()
				set name = "Quick Movement"
				set category = "Fighting"
				set instant = 1


				var/list/Xl = new() //Que?
				var/Pdir=(usr.dir)
				usr=src
				if(usr.z==17)
					usr<<"You can't do this here!"
//						else if(usr.jailed == 1)
//							usr<<"You are jailed, you can't IT right now."
				else
					if(usr.sounds==1)
						spawn()usr<<'sounds/teleport.wav'
					for(var/mob/characters/L in oview(4))
						if(L.client)
							if(L.sounds==1)
								spawn()L<<'sounds/teleport.wav'

					if(Pdir==NORTH)
						usr.y=usr.y
						usr.Move(get_step(usr,NORTH), NORTH)
						usr.invisibility = 1
						flick("zan",usr)
						sleep(15)
						usr.invisibility = 0
						for(var/turf/ZVoid/U in src.loc)
							usr.x=usr.y-3

					if(Pdir==SOUTH)
						usr.y=usr.y
						usr.Move(get_step(usr,SOUTH), SOUTH)
						usr.invisibility = 1
						flick("zan",usr)
						sleep(15)
						usr.invisibility = 0
						for(var/turf/ZVoid/U in src.loc)
							usr.x=usr.y+3

					if(Pdir==EAST)
						usr.x=usr.x
						usr.Move(get_step(usr,EAST), EAST)
						usr.invisibility = 1
						flick("zan",usr)
						sleep(15)
						usr.invisibility = 0
						for(var/turf/ZVoid/U in src.loc)
							usr.x=usr.x-1
					if(Pdir==WEST)
						usr.x=usr.x
						usr.Move(get_step(usr,WEST), WEST)
						usr.invisibility = 1
						flick("zan",usr)
						sleep(15)
						usr.invisibility = 0

mob
	itx
		verb
			Instant_Transmission1(mob/D in oview(20))
				set name = "Instantaneous Movement"
				set category = "Fighting"
				var/list/Xl = new() //Que?

				if(usr.z==17)
					usr<<"You can't do this here!"
//						else if(usr.jailed == 1)
//							usr<<"You are jailed, you can't IT right now."
				else
					var/newx = D:x
					var/newy = D:y
					var/newz = D:z

					sleep(10)
					if(usr.z==17)
						usr.overlays-='ccpod.dmi'
						usr.podloc=locate(usr.x,usr.y,usr.z)
						usr.lastplanet="Pod"
						for(var/obj/X in usr.contents)
							if(X.name=="Spacepod")
								del(X)
					if(usr.sounds==1)
						spawn()usr<<'sounds/teleport.wav'
					for(var/mob/characters/L in oview(4))
						if(L.client)
							if(L.sounds==1)
								spawn()L<<'sounds/teleport.wav'
					usr.x = newx
					usr.y = newy
					usr.z = newz
					usr.nopk=0
					usr.safe = 0
					if(usr.loc.loc)
						if(usr.loc.loc:safe==1)
							usr.nopk=1
						else
							usr.nopk=0
					usr << "You go infront of [D]."
					D << "[usr] blurs in front of you."

mob
	itx
		verb
			Instant_Transmission()
				set name = "Instant Transmission"
				set category = "Fighting"
				var/list/Xl = new()
				switch(input("Instant Transmission to (Type)","IT") in list("Player","NPC/Place"))
					if("Player")
						for(var/mob/L in world)
							if(L.client)
								Xl+=L
					if("NPC/Place")
						for(var/mob/L in world)
							if(!L.client)
								Xl+=L
				var/mob/M=input("Choose a target","Target")as mob in Xl
				if(usr.z==18)
					sleep(50)
				if(usr.cantitto==0)
					if(M.powerlevel<100&&istype(M,/mob/characters/))
						usr<<"[M]'s Powerlevel is to low for you to pinpoint."
					else
						if(usr.dead == 1)
							usr<<"You can't use IT when you are dead!"
//						else if(usr.jailed == 1)
//							usr<<"You are jailed, you can't IT right now."
						else

							if(findText("[usr.knowmob]","[M.name]")==0)
								usr << "You cannot seem to remember [M] well... You better use Remember Someone on him."
							else
								if(M.invisibility==1||M.y>135&&M.z==3||M.z==15||M.z==14||M.npc==10||M.z==16||M.z==18||M.z==20||M.z==21||M.z==22||M.z==23||M.z==7||M.z==0||M.z==null||M.x==0||M.y==0||M.x==null||M.y==null||M.cantitto==1||(M.z==19&&!(usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")))
									usr<<"Thats out of bounds"
								else
									var/newx = M:x
									var/newy = M:y
									var/newz = M:z

									sleep(10)
									if(usr.z==17)
										usr.overlays-='ccpod.dmi'
										usr.podloc=locate(usr.x,usr.y,usr.z)
										usr.lastplanet="Pod"
										for(var/obj/X in usr.contents)
											if(X.name=="Spacepod")
												del(X)
									if(usr.sounds==1)
										spawn()usr<<'sounds/teleport.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/teleport.wav'
									usr.x = newx
									usr.y = newy
									usr.z = newz
									usr.nopk=0
									usr.safe = 0
									if(usr.loc.loc)
										if(usr.loc.loc:safe==1)
											usr.nopk=1
										else
											usr.nopk=0
									usr << "You go infront of [M]."
									M << "[usr] blurs in front of you."
mob
	it
		verb
			Instant_Transmission(mob/M as mob in world)
				set name = "Instant Transmission"
				set category = "Fighting"
				if(usr.cantitto==0)
					if(M.powerlevel<100&&istype(M,/mob/characters/))
						usr<<"[M]'s Powerlevel is to low for you to pinpoint."
					else
						dead
						if(usr.dead == 1)
							usr<<"You can't use IT when you are Dead!"
						else
							sleep(20)
							if(usr.dead==1)
								goto dead
							if(findText("[usr.knowmob]","[M.name]")==0)
								usr << "You cannot seem to remember [M] well... You better use Remember Someone on him."
							else
								if(M.invisibility==1||M.y>135&&M.z==3||M.z==15||M.z==14||M.npc==10||M.z==16||M.z==18||M.z==20||M.z==21||M.z==22||M.z==23||M.z==0||M.z==null||M.x==0||M.y==0||M.x==null||M.y==null||M.cantitto==1||(M.z==19&&!(usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")))
									usr<<"Thats out of bounds"
								else
									var/newx = M:x
									var/newy = M:y
									var/newz = M:z

									sleep(10)
									if(usr.z==17)
										usr.overlays-='ccpod.dmi'
										usr.podloc=locate(usr.x,usr.y,usr.z)
										usr.lastplanet="Pod"
										for(var/obj/X in usr.contents)
											if(X.name=="Spacepod")
												del(X)
									if(usr.sounds==1)
										spawn()usr<<'sounds/teleport.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/teleport.wav'
									usr.x = newx
									usr.y = newy
									usr.z = newz
									usr.nopk=0
									usr.safe = 0
									if(usr.loc.loc)
										if(usr.loc.loc:safe==1)
											usr.nopk=1
										else
											usr.nopk=0
									usr << "You go infront of [M]."
									M << "[usr] blurs in front of you."


mob
	worldscan
		verb
			World_Scan()
				set category = "Fighting"
				set name = "World Scan"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<b>------------------"
						usr << "<b><font color = blue>[M] :<font color = green> [num2text(M.powerlevel,100)]"
						usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"
					else
						usr.powerlevel += 0


mob
	uniscan
		verb
			Uni_Scan()
				set category = "Fighting"
				set name = "Universal Scan"
				for(var/mob/characters/M in world)
					usr << "<b>------------------"
					usr << "<b><font color = blue>[M] :<font color = green> [num2text(M.powerlevel,100)]"
					usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"









mob
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

mob
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

mob
	wrap
		verb
			Wrap(mob/M in oview(6))
				set name = "Wrap"
				set category = "Fighting"
				if(usr.ased == 300)
					usr << "<b>You have wrapped recently!!</b>"
				if(usr.ased == 0)
					if(usr.spar == 1)
						usr << "<b>You cant while sparring."
					if(usr.spar == 0)
						if(usr.flight == 1)
							usr << "<b>You are too busy to! (You are flying)."
						if(usr.flight == 0)
							var/atom/kiloc = locate(M.x,M.y,M.z)
							s_missile('assimilate.dmi',usr,M)
							view(6) << "[usr.name] launches an Wrap attack at [M.name]!"
							sleep(5)
							if(M.loc.x==kiloc.x && M.loc.y==kiloc.y && M.loc.z == kiloc.z)
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

mob
	GalacticDonut
		verb
			GalacticDonut(mob/M in oview(6))
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
							if(usr.ki>0)
								var/atom/kiloc = locate(M.x,M.y,M.z)
								usr.ki-=usr.maxki/4
								s_missile('Gdonut.dmi',usr,M)
								view(6) << "[usr.name] launches an Galactic Donut attack at [M.name]!"
								sleep(5)
								if(M.loc.x==kiloc.x && M.loc.y==kiloc.y && M.loc.z == kiloc.z)
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










mob
	kiabsorb
		verb
			Ki_Absorb()
				set name = "Ki Absorb"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "<b>You cant while sparring."
				if(usr.spar == 0)
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
					if(usr.resting==1)
						usr<<"You are resting"
					if(usr.flight == 0&&usr.resting==0)
						if(usr.absorb == 1)
							usr << "<b>You are currently waiting to absorb."
						if(usr.absorb == 0)
							if(usr.ki>usr.maxki)
								usr.ki=usr.maxki
							view(6) << "<b><font color = blue>[usr.name] gets ready to absorb."
							usr.absorb = 1
							sleep(50)
							usr.absorb = 0
							if(usr.ki>usr.maxki)
								usr.ki=usr.maxki


mob
	bukujutsu
		verb
			bukujutsu()
				set name = "Bukujutsu(Fly)"
				set category = "Fighting"
				if(usr.spar == 1)
					usr << "Not while sparring."
				if(usr.spar == 0)
					if(usr.z == 3)
						usr << "<b>There isnt enough room here."
					if(usr.z == 10)
						usr << "<b>Its way too heavy in here..."
					else
						if(usr.flight == 1)
							usr << "You float to the ground..."
							usr.density = 1
							usr.flight = 0
							usr.layer=MOB_LAYER
							usr.meditate = 0
							usr.icon_state = ""
							usr.underlays=0
							if(usr.auraon==1)
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
						else
							usr << "You begin to float above...."
							usr.layer=MOB_LAYER+2
							usr.density = 0
							usr.flight = 1
							usr.meditate = 0
							usr.icon_state = "buku"
							usr.underlays=0
							if(usr.auraon==1)
								var/aura = 'whiteaura5.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura




mob
	aura
		verb
			powerup()
				set name = "Power Up"
				set category = "Fighting"
				if(usr.ptime == 0)
					if(usr.poweringup==0)
						if(usr.stamina>=5)
							usr.poweringup=1
							usr << "<B>An aura flickers around you."
							if(usr.sounds==1)
								spawn()usr<<'sounds/powerup.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'sounds/powerup.wav'

							usr.underlays=0
							if(usr.auratype==0)
								var/aura = 'whiteaura.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura
							if(usr.auratype==1)
								var/aura = 'whiteaura2.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura
							if(usr.auratype==2)
								var/aura = 'whiteaura3.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura
							if(usr.auratype==3)
								var/aura = 'whiteaura4.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura
							if(usr.auratype==4)
								var/aura = 'whiteaura6.dmi'
								aura += rgb(usr.customred,usr.customgreen,usr.customblue)
								usr.underlays += aura
							kiloop
							if(usr.ki<usr.maxki)
								usr.ki+=usr.maxki/8
								usr.stamina-=rand(1,10)
								if(usr.ki>usr.maxki)
									usr.ki=usr.maxki
								sleep(50)
								goto kiloop


							if(usr.powerlevel >= usr.maxpowerlevel)
								usr << "You're at full powerlevel."

							if(usr.powerlevel < usr.maxpowerlevel)


								if(usr.powerlevel >= 1000000)
									usr.overlays += /obj/ray
								if(usr.powerlevel < 1000000)
									usr.powerlevel += 0
								plloop
								usr.powerlevel += (usr.maxpowerlevel / rand(15,20))
								usr.powerlevel = round(usr.powerlevel)
								usr.stamina -= rand(1,10)
								sleep(25)
//								if(usr.weight>usr.maxpowerlevel/1000)
//									if(usr.weight<usr.maxpowerlevel/500)
//										if(usr.powerlevel>usr.maxpowerlevel/2)
//											usr.powerlevel=usr.maxpowerlevel/2
//								if(usr.weight<usr.maxpowerlevel/1000)
//									sleep(3)
//									if(usr.powerlevel>usr.maxpowerlevel/3 * 2)
//										usr.powerlevel=usr.maxpowerlevel/3 * 2
								if(usr.powerlevel<usr.maxpowerlevel&& usr.stamina>0)//(usr.powerlevel<usr.maxpowerlevel&& usr.stamina>0&& usr.weight<=0)// && usr.weight<=0)||(usr.weight<usr.maxpowerlevel/500 && usr.powerlevel<usr.maxpowerlevel/2)||(usr.weight<usr.maxpowerlevel/1000&&usr.powerlevel<usr.maxpowerlevel/3 * 2))
									goto plloop
								usr << "You finish powering up."
								usr.basepowerlevel= usr.powerlevel
								usr.underlays -= aura
								usr.overlays -= /obj/ray
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
							usr.poweringup=0
						else
							usr<<"You feel to tired"



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
						usr.basepowerlevel=usr.powerlevel
						usr.underlays =0



mob
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
						if(amount > (usr.maxpowerlevel * 1.5))
							usr << "<b>You begin to feel the energy absorb into  you...."
							sleep(20)
							view(6) << "<font color = blue><i>[usr] explodes while focusing energy into himself!"
							usr.powerlevel = 0
							spawn()usr.Die()
						if(amount <= (usr.maxpowerlevel * 1.5)&& amount >0)
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







mob
	Kaioken
		verb
			Kaioken()
				set category = "Fighting"
				var/amount = input("What level of Kaioken? 0 releases it") as num|null
				if(amount == 0||amount == null)
					usr << "<b>You begin to release your kaioken...."
					usr.kaioken = 0
					if(usr.powerlevel < usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.underlays = 0
					usr.overlays-='elec.dmi'
				if(amount >= 1)
					if((amount*5)>usr.ki)
						usr<<"You dont have enough Ki!"
					else
						if(usr.sounds==1)
							spawn()usr<<'sounds/powerup.wav'
						for(var/mob/characters/L in oview(4))
							if(L.client)
								if(L.sounds==1)
									spawn()L<<'sounds/powerup.wav'
						usr.ki-=(amount*5)
						if(amount > (usr.maxpowerlevel / 1341))
							usr << "<b>From too much pressure, you explode under Kaioken!!!"
							view(6) << "<b>[usr] explodes from the use of Kaioken!"
							usr.powerlevel = 0
							spawn()usr.Die()
						if(amount <= (usr.maxpowerlevel / 1341) && usr.ssj==0)
							if(usr.kaioken == 1)
								usr<< "You release your Kaioken"
								usr.kaioken = 0
								if(usr.powerlevel < usr.maxpowerlevel)
									usr.powerlevel += 0
								if(usr.powerlevel >= usr.maxpowerlevel)
									usr.powerlevel = usr.maxpowerlevel
								usr.underlays = 0
								usr.overlays-='elec.dmi'
							if(usr.kaioken == 0)
								if(amount > 100)
									usr << "Sorry Kaioken cant go that high"
								if(amount ==100)
									if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
										usr<<"You go Giji Super Sayajin!"
										view(6) << "<font color = red><b>GIJI SUPERSAIYAJIN!!!!!"
									else
										view(6) << "<font color = red><b>SUPER KAIOKEN!!!"
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

						else
							usr << "Cant use Kaoken and Be a Supersayajin"

mob
	Zanzoken
		verb
			Zanzoken()
				set category = "Fighting"
				if(usr.creator==1)
					if(usr.invisibility == 1)
						usr << "You stop using Zanzoken."
						usr.invisibility = 0
						usr.zanzoken = 0
					else
						usr << "You start using Zanzoken."
						flick("zan",usr)
						sleep(5)
						usr.invisibility = 1
						usr.zanzoken = 1
						if(usr.creator==1)
							return
						else
							testing
							if(usr.zanzoken == 1)
								sleep(5)
								usr.stamina -= rand(1,2)
								if(usr.stamina <= 1)
									usr << "You stop using Zanzoken, because it wore off."
									usr.invisibility = 0
								else
									goto testing
				else
					usr<<"Zanzoken is disabled"

//Blasts//
obj
	kame
		icon = 'turfs.dmi'
		icon_state = "Kame"
		layer = MOB_LAYER + 3
obj
	renzuko
		icon='kame.dmi'
		icon_state="Renzuko"
		layer = MOB_LAYER + 3
mob
	Kamehameha
		verb
			Kamehameha()
				set name = "Kame Hame Ha"
				set category = "Fighting"
				if(usr.nopk==0)
					var/amount=skillkiusage[1]

					if(amount >= 1)
						if(amount > usr.ki)
							usr<<"You dont have that much ki!"
						if(amount <= usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame = 1
								usr.counter=0
								var/temp = usr.icon_state
								usr.icon_state="ki"
								if(usr.sounds==1)
									spawn()usr<<'sounds/basicbeam_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/basicbeam_fire.wav'
								sleep(1)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Kame--Hame--HA!"
								usr.ki-= amount
								if(usr.powerlevel>usr.maxpowerlevel)
									amount=amount*(usr.powerlevel/usr.maxpowerlevel)
								amount=amount*330
								var/obj/Proj
								if(usr.dir==NORTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
								if(usr.dir==EAST)
									Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
								if(usr.dir==SOUTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
								if(usr.dir==WEST)
									Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
								Proj.kitype=2
								Proj.icon='Techs/kamehameha.dmi'
								Firestraight(Proj,'Techs/kamehameha.dmi',amount,usr.dir,usr,'Techs/kamehamehatail.dmi',10)
								usr.icon_state=temp
mob
	BigBangKamehameha
		verb
			BigBangKamehameha()
				set name = "BigBang-KameHameHa"
				set category = "Fighting"
				if(usr.nopk==0)
					var/amount=skillkiusage2[1]

					if(amount >= 1)
						if(amount > usr.ki)
							usr<<"You dont have that much ki!"
						if(amount <= usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame = 1
								usr.counter=0
								var/temp = usr.icon_state
								usr.icon_state="ki"
								if(usr.sounds==1)
									spawn()usr<<'sounds/basicbeam_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/basicbeam_fire.wav'
								sleep(1)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Big Bang Kamehameha!"
								usr.ki-= amount
								if(usr.powerlevel>usr.maxpowerlevel)
									amount=amount*(usr.powerlevel/usr.maxpowerlevel)
								amount=amount*460
								var/obj/Proj
								if(usr.dir==NORTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
								if(usr.dir==EAST)
									Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
								if(usr.dir==SOUTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
								if(usr.dir==WEST)
									Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
								Proj.kitype=2
								Proj.icon='Techs/BBkame.dmi'
								Firestraight(Proj,'Techs/BBkame.dmi',amount,usr.dir,usr,'Techs/BBkametail.dmi',10)
								usr.icon_state=temp
mob
	FinalKamehameha
		verb
			FinalKamehameha()
				set name = "Final-KameHameHa"
				set category = "Fighting"
				if(usr.nopk==0)
					var/amount=skillkiusage2[2]

					if(amount >= 1)
						if(amount > usr.ki)
							usr<<"You dont have that much ki!"
						if(amount <= usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame = 1
								usr.counter=0
								var/temp = usr.icon_state
								usr.icon_state="ki"
								if(usr.sounds==1)
									spawn()usr<<'sounds/basicbeam_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/basicbeam_fire.wav'
								sleep(1)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Final Kamehameha!"
								usr.ki-= amount
								if(usr.powerlevel>usr.maxpowerlevel)
									amount=amount*(usr.powerlevel/usr.maxpowerlevel)
								amount=amount*370
								var/obj/Proj
								if(usr.dir==NORTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
								if(usr.dir==EAST)
									Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
								if(usr.dir==SOUTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
								if(usr.dir==WEST)
									Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
								Proj.kitype=2
								Proj.icon='Techs/Kamehameha X10 Head.dmi'
								Firestraight(Proj,'Techs/Kamehameha X10 Head.dmi',amount,usr.dir,usr,'Techs/Kamehameha X10 Tail.dmi',10)
								usr.icon_state=temp
mob
	FinalShine
		verb
			FinalShine()
				set name = "Final Shine"
				set category = "Fighting"
				if(usr.nopk==0)
					var/amount=skillkiusage2[3]

					if(amount >= 1)
						if(amount > usr.ki)
							usr<<"You dont have that much ki!"
						if(amount <= usr.ki)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame = 1
								usr.counter=0
								var/temp = usr.icon_state
								usr.icon_state="ki"
								if(usr.sounds==1)
									spawn()usr<<'sounds/basicbeam_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/basicbeam_fire.wav'
								sleep(1)
								view(6) << "<font color = red>[usr]:<font color = white> <tt>Final Shine!"
								usr.ki-= amount
								if(usr.powerlevel>usr.maxpowerlevel)
									amount=amount*(usr.powerlevel/usr.maxpowerlevel)
								amount=amount*440
								var/obj/Proj
								if(usr.dir==NORTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
								if(usr.dir==EAST)
									Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
								if(usr.dir==SOUTH)
									Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
								if(usr.dir==WEST)
									Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
								Proj.kitype=2
								Proj.icon='Techs/Final Shine Head.dmi'
								Firestraight(Proj,'Techs/Final Shine Head.dmi',amount,usr.dir,usr,'Techs/Final Shine Tail.dmi',10)
								usr.icon_state=temp
mob/verb/Save()
	set category = "Communication"
	if(usr.savedrec==0)
		usr.savedrec=1
		sleep(20)
		usr<<"Character Saved"
		usr.save()
		spawn()
			sleep(600)
			usr.savedrec=0

mob/proc/save()
	client.SaveMob()
mob
	FusionDance
		verb
			Fuse(mob/characters/M in oview(1))
				set category = "Fighting"
				if(usr.fused==0 && M.fused==0 && usr.ozz==0 && M.ozz==0)
					if(usr.hasfused==1||M.hasfused==1)
						usr<<"Cant fuse while in permanent fusion"
					else
						if(M.fusionlearn==1)
							usr.powerlevel += 0
							if(usr.fusioncool==1)
								usr<<"Cant fuse yet.."
							else
								var/inrange=0
								switch(input(M,"Would you like to fuse with [usr]?","Fuse") in list("Yes","No"))
									if("Yes")
										for(var/mob/characters/X in oview(1))
											if(X==M)
												inrange=1
										if(inrange==1)
											if(usr.hasfused==0&&M.hasfused==0)
												if(usr.fused==0 && M.fused==0)
													usr.save()
													M.save()
													var/list/temp1[] = usr.overlays
													usr.ooverlays=temp1.Copy(1,0)
													usr.overlays=0
													var/list/temp2[] = M.overlays
													M.ooverlays=temp2.Copy(1,0)
													M.overlays=0
													if (usr.dead==1)
														usr.overlays+='halo.dmi'
													var/lead = copytext(usr.name,1,5)
													var/load = copytext(M.name,6)
													usr.overlays+=usr.hairicon
													var/hairoverone = 'hairstrip.dmi'
													hairoverone += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverone
													var/hairoverthree = 'hairstrip2.dmi'
													hairoverthree += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverthree
													view(6) << "[M] and [usr] fuse to make [lead][load]!!!"
													view(6) << "<font face = arial><tt>---===FUSION HA!!!===---"
													if(usr.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(M.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													usr.oname=usr.name
													M.oname=M.name
													usr.overlays+='elec.dmi'
													usr.name = "<b>[lead][load]</b>"
													M.name = "<b>[lead][load]</b>"
													usr.overlays+='GogetaVest.dmi'

													usr.omaxpowerlevel=usr.maxpowerlevel
													M.omaxpowerlevel=M.maxpowerlevel
													if(usr.maxpowerlevel>M.maxpowerlevel*2)
														M.maxpowerlevel+=M.maxpowerlevel
														usr.maxpowerlevel=M.maxpowerlevel
														goto plboosted
													if(M.maxpowerlevel>usr.maxpowerlevel*2)
														usr.maxpowerlevel+=usr.maxpowerlevel
														M.maxpowerlevel=usr.maxpowerlevel
														goto plboosted
													if(usr.maxpowerlevel<M.maxpowerlevel*2&&M.maxpowerlevel<usr.maxpowerlevel*2)
														usr.maxpowerlevel += M.maxpowerlevel
														M.maxpowerlevel=usr.maxpowerlevel
														goto plboosted
													M.maxpowerlevel=0
													M.powerlevel=0
													plboosted
													usr.powerlevel=usr.maxpowerlevel
													M.hasfused=1
													usr.hasfused=1
													usr.fused=1
													M.fused=1
													M.invisibility=1
													M.follow=usr.name
													M.fusebitch=1
													M.fusionfollow(usr)
										else
											usr<<"You need to be right next to [M]"



mob
	BigBang
		verb
			BigBang(mob/M in oview(6))
				set name = "Big Bang"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[12]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.targets=M
									src=usr.targets
									usr.kame = 1
									usr.overlays += /obj/kame
									if(src.doomy==1)
										spawn()usr<<'sounds/basicbeam_charge.wav'
									for(var/mob/L in view(4))
										if(src.doomy==1)
											if(src.doomy==1)
												spawn()L<<'sounds/basicbeam_charge.wav'
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Big"
									sleep(24)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Bang"
									sleep(24)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"
									flick("ki",usr)

									usr.overlays -= /obj/kame
									if(src.z == usr.z)
										usr.overlays -= /obj/kame
										if(usr.sounds==1)
											spawn()usr<<'sounds/bigbang_fire.wav'
										for(var/mob/L in oview(4))
											if(src)
												if(L.sounds==1)
													spawn()L<<'sounds/bigbang_fire.wav'
										s_missile('kame3.dmi', usr, src)
										spawn(3)usr.kame = 0
										usr.ki -= amount
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										amount=amount*250
										amount=((amount*50)/(src.powerlevel+1))
										if(src.absorb == 1)
											view(6) << "[src] absorbs [usr]'s Big Bang attack!"
											src.ki += amount/300
											if(src.ki>src.maxki)
												src.ki=src.maxki
										if(src.absorb == 0)
											if(M.powerlevel>=1)
												M.random = rand(1,2)
												if(M.random == 2||M.random == 1)
													view(6) << "[src] Gets hammered by [usr] ki pressure!"
													M.hp-= amount


													if(src.doomy==1)

														var/O = new /obj/crator(src.loc)
														var/I = new /mob/smoke(src.loc)
														flick("smoke",I)
														spawn()src.Die()

														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
												else
													view(6) << "<font color = red>[usr] shoots a Big Bang Attack at [src]!!!"
													if(src.block==1)
														M.hp-= amount /10
													else
														M.hp-= amount
											else
												view(6) << "<font color = red>[usr] shoots a Big Bang Attack at [src]!!!"
												if(src.block==1)

													M.hp-= amount /10
												else
													M.hp-= amount
												if(src.race!=null|"")
													if(src.doomy==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/L in oview(4))
														if(src.client)
															if(src.doomy==1)
																spawn()src<<'sounds/expload.wav'

													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													flick("smoke",I)
													spawn()src.Die()

													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)

										else
											usr << "<b>You launch your Big Bang Attack, but [src] is out of sight."
											usr.overlays -= /obj/kame
											spawn(3)usr.kame = 0
mob
	Masenko
		verb
			Masenko(mob/M in oview(6))
				set name = "Masenko"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[12]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.targets=M
									src=usr.targets
									usr.kame = 1
									usr.overlays += /obj/kame
									if(src.doomy==1)
										spawn()usr<<'sounds/basicbeam_charge.wav'
									for(var/mob/L in view(4))
										if(src.doomy==1)
											if(src.doomy==1)
												spawn()L<<'sounds/basicbeam_charge.wav'
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Ma..."
									sleep(18)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>senko..."
									sleep(18)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>HAAAA!!!"
									flick("ki",usr)

									usr.overlays -= /obj/kame
									if(src.z == usr.z)
										usr.overlays -= /obj/kame
										if(usr.sounds==1)
											spawn()usr<<'sounds/bigbang_fire.wav'
										for(var/mob/L in oview(4))
											if(src)
												if(L.sounds==1)
													spawn()L<<'sounds/bigbang_fire.wav'
										s_missile('kame2.dmi', usr, src)
										spawn(3)usr.kame = 0
										usr.ki -= amount
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										amount=amount*250
										amount=((amount*50)/(src.powerlevel+1))
										if(src.absorb == 1)
											view(6) << "[src] absorbs [usr]'s Masenko attack!"
											src.ki += amount/300
											if(src.ki>src.maxki)
												src.ki=src.maxki
										if(src.absorb == 0)
											if(M.powerlevel>=1)
												M.random = rand(1,2)
												if(M.random == 2||M.random == 1)
													view(6) << "[src] Gets hammered by [usr] ki pressure!"
													M.hp-= amount


													if(src.doomy==1)

														var/O = new /obj/crator(src.loc)
														var/I = new /mob/smoke(src.loc)
														flick("smoke",I)
														spawn()src.Die()

														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
												else
													view(6) << "<font color = red>[usr] shoots a Masenko Attack at [src]!!!"
													if(src.block==1)
														M.hp-= amount /10
													else
														M.hp-= amount
											else
												view(6) << "<font color = red>[usr] shoots a Masenko Attack at [src]!!!"
												if(src.block==1)

													M.hp-= amount /10
												else
													M.hp-= amount
												if(src.race!=null|"")
													if(src.doomy==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/L in oview(4))
														if(src.client)
															if(src.doomy==1)
																spawn()src<<'sounds/expload.wav'

													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													flick("smoke",I)
													spawn()src.Die()

													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)

										else
											usr << "<b>You launch your Big Bang Attack, but [src] is out of sight."
											usr.overlays -= /obj/kame
											spawn(3)usr.kame = 0

mob
	FinalFlash
		verb
			FinalFlash()
				set name = "Final Flash"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[8]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									usr.counter=0
									sleep(1)

									view(6) << "<font color = red>[usr]:<font color = white> <tt>Final.. Flash"
									var/tempiconstate=usr.icon_state
									usr.icon_state="ki"
									usr.ki-= amount
									if(usr.powerlevel>usr.maxpowerlevel)
										amount=amount*(usr.powerlevel/usr.maxpowerlevel)
									amount+=amount*400
									if(usr.sounds==1)
										spawn()usr<<'sounds/kamehameha_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/kamehameha_fire.wav'
									var/obj/Proj
									if(usr.dir==NORTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
									if(usr.dir==EAST)
										Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
									if(usr.dir==SOUTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
									if(usr.dir==WEST)
										Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
									Proj.kitype=2
									Proj.icon='kame.dmi'
									Firestraight(Proj,'kame.dmi',amount,usr.dir,usr,'kametrail.dmi',10)
									usr.icon_state=tempiconstate
									//	usr.kame=0
mob
	DoubleTsuihikidan
		verb
			DoubleTsuihikidan()
				set name = "Double Tsuihikidan"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[5]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									usr.counter=0
									var/temp=usr.icon_state
									usr.icon_state="ki"
									if(usr.sounds==1)
										spawn()usr<<'sounds/burning_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/burning_fire.wav'
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Double-Tsuihikidan!"
									usr.ki-= amount
									if(usr.powerlevel>usr.maxpowerlevel)
										amount=amount*(usr.powerlevel/usr.maxpowerlevel)
									amount=amount*340
									var/obj/Proj
									if(usr.dir==NORTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
									if(usr.dir==EAST)
										Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
									if(usr.dir==SOUTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
									if(usr.dir==WEST)
										Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
									Proj.kitype=2
									Proj.icon='kame10.dmi'
									Firestraight(Proj,'kame10.dmi',amount,usr.dir,usr,'kametrail4.dmi',10)
									usr.icon_state=temp
								//	usr.move=1
								//	usr.kame=0
						for(var/obj/U in oview(9))
							if(U.npc==5)
								del(U)
					//	usr.move=1
					//	usr.kame=0
mob
	GalekGun
		verb
			GalekGun()
				set name = "Galek Gun"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[3]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									usr.counter=0
									var/temp = usr.icon_state
									usr.icon_state="ki"
									if(usr.sounds==1)
										spawn()usr<<'sounds/basicbeam_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/basicbeam_fire.wav'
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Galek-GUN!"
									usr.ki-= amount
									if(usr.powerlevel>usr.maxpowerlevel)
										amount=amount*(usr.powerlevel/usr.maxpowerlevel)
									amount=amount*330
									var/obj/Proj
									if(usr.dir==NORTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
									if(usr.dir==EAST)
										Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
									if(usr.dir==SOUTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
									if(usr.dir==WEST)
										Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
									Proj.kitype=2
									Proj.icon='kame9.dmi'
									Firestraight(Proj,'kame9.dmi',amount,usr.dir,usr,'kametrail3.dmi',10)
									usr.icon_state=temp
								//	usr.move=1
								//	usr.kame=0

mob
	Kikho
		verb
			Kikho()
				set name = "Kikho"
				set category = "Fighting"
			/*	if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=usr.maxki/10
						amount = round(amount)

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									usr.counter=0
									sleep(4)
									flick("ki",usr)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>KIKHO!"
									if(usr.sounds==1)
										spawn()usr<<'sounds/burning_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/burning_fire.wav'
									usr.ki-= amount
									if(usr.powerlevel>usr.maxpowerlevel)
										amount=amount*(usr.powerlevel/usr.maxpowerlevel)
									amount=amount*300
									usr.10
									if(usr.kame==1)
										for(var/mob/L in oview(10))
											if(usr.dir==4&&L.y==usr.y||usr.dir==8&&L.y==usr.y||usr.dir==1&&L.x==usr.x||usr.dir==2&&L.x==usr.x)
												usr.counter+=1
										usr.move=0
										var/FinalFlash = new /obj/Kikho(usr.loc)
										if(usr.counter>0)
											for(var/mob/M in oview(10))
												if(M.key!=usr.key)
													if(usr.dir==4&&M.y==usr.y||usr.dir==8&&M.y==usr.y||usr.dir==1&&M.x==usr.x||usr.dir==2&&M.x==usr.x)

														if(usr.dir==4&&M.x>usr.x||usr.dir==8&&M.x<usr.x||usr.dir==1&&M.y>usr.y||usr.dir==2&&M.y<usr.y)

															for(var/obj/X in oview(1))

																if(X.npc==4)
																	X.ki=amount;X.owner=usr.key

																	X.dir=usr.dir
																	usr.move=0
																	var/distance=5

																	looping
																	if(X.dir==4)
																		X.x+=1
																	if(X.dir==8)
																		X.x-=1
																	if(X.dir==1)
																		X.y+=1
																	if(X.dir==2)
																		X.y-=1
																	sleep(3)
																	if(X.loc==locate(M.x,M.y,M.z))
																		amount=((amount*50)/(M.powerlevel+1))
																		usr.move=1
																		usr.kame=0
																		del(FinalFlash)
																		for(var/obj/U in oview(9))
																			if(U.npc==5)
																				del(U)

																		if(M.absorb == 0||M.absorb==1)
																			if(M.powerlevel >= usr.powerlevel)
																				M.random = rand(1,3)
																				if(M.creator==1)
																					view(6) << "[M] reflects [usr]'s blast back at him!"
																					s_missile('kame9.dmi', M, usr)
																					usr. amount
																					if(usr)

																						spawn()usr.KO()
																				else

																					view(6) << "<font color = red>[usr] hits [M] with Kikho!"
																					if(M.block==1)
																						M.powerlevel -= 0
																					else
																						M.hp-=amount
																						if(M.client||istype(M,/mob/monsters))
																							if(M.powerlevel<usr.powerlevel*1.5)
																								spawn()M.knockbackproc(3,usr.dir)


																			else
																				view(6) << "<font color = red>[usr] hits [M] with Kikho!"
																				if(M.block==1)
																					M.powerlevel -= 0
																				else
																					M.hp-=amount
																					if(M.client||istype(M,/mob/monsters))
																						if(M.powerlevel<usr.powerlevel*1.5)
																							spawn()M.knockbackproc(3,usr.dir)


																				if(M.race!=null|"")
																					M.Die(usr)
																					sleep(50)
																					sleep(200)
																				spawn()usr.KO()

																	else
																		if(distance<=0)
																			usr.move=1
																			del(FinalFlash)
																			for(var/obj/U in oview(9))
																				if(U.npc==5)
																					del(U)


																		else
																			distance-=1
																			goto looping
										else
											if(usr.counter<=0)
												for(var/obj/X in oview(1))
													if(X.npc==4)
														X.ki=amount;X.owner=usr.key
														X.dir=usr.dir
														usr.move=0
														var/distance=5
														looping
														if(X.dir==4)
															X.x+=1
														if(X.dir==8)
															X.x-=1
														if(X.dir==1)
															X.y+=1
														if(X.dir==2)
															X.y-=1
														sleep(2)
														if(distance<=0)
															usr.move=1
															del(FinalFlash)
														else
															distance-=1
															goto looping
										del(FinalFlash)

						for(var/obj/U in oview(9))
							if(U.npc==5)
								del(U)
						usr.kame=0*/
mob
	SpecialBeamCannon
		verb
			SpecialBeamCannon()
				set name = "Special Beam Cannon"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[7]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									var/temp=usr.icon_state
									usr.icon_state="ki"
									usr.counter=0
									if(usr.sounds==1)
										spawn()usr<<'sounds/sbc_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/sbc_fire.wav'
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Special Beam Cannon"
									usr.ki-= amount
									if(usr.powerlevel>usr.maxpowerlevel)
										amount=amount*(usr.powerlevel/usr.maxpowerlevel)
									amount+=amount*450
									var/obj/Proj
									if(usr.dir==NORTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
									if(usr.dir==EAST)
										Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
									if(usr.dir==SOUTH)
										Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
									if(usr.dir==WEST)
										Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
									Proj.kitype=2
									Proj.icon='kame4.dmi'
									Firestraight(Proj,'kame4.dmi',amount,usr.dir,usr,'kametrail2.dmi',10)
									usr.icon_state=temp
								//	usr.move=1
								//	usr.kame=0
mob
	DonDonPa
		verb
			DonDonPa(mob/M in oview(6))
				set name = "Dondonpa"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[12]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.targets=M
									src=usr.targets
									usr.kame = 1
									usr.overlays += /obj/kame
									if(src.doomy==1)
										spawn()usr<<'sounds/basicbeam_charge.wav'
									for(var/mob/L in view(4))
										if(src.doomy==1)
											if(src.doomy==1)
												spawn()L<<'sounds/basicbeam_charge.wav'
									usr.overlays += /obj/kame
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Don..."
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Don..."
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>PA!!!"
									flick("ki",usr)

									usr.overlays -= /obj/kame
									if(src.z == usr.z)
										usr.overlays -= /obj/kame
										if(usr.sounds==1)
											spawn()usr<<'sounds/bigbang_fire.wav'
										for(var/mob/L in oview(4))
											if(src)
												if(L.sounds==1)
													spawn()L<<'sounds/bigbang_fire.wav'
										s_missile('kame5.dmi', usr, src)
										spawn(3)usr.kame = 0
										usr.ki -= amount
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										amount=amount*250
										amount=((amount*50)/(src.powerlevel+1))
										if(src.absorb == 1)
											view(6) << "[src] absorbs [usr]'s DonDonPa attack!"
											src.ki += amount/300
											if(src.ki>src.maxki)
												src.ki=src.maxki
										if(src.absorb == 0)
											if(M.powerlevel>=1)
												M.random = rand(1,2)
												if(M.random == 2||M.random == 1)
													view(6) << "[src] Gets hammered by [usr] ki pressure!"
													M.hp-= amount


													if(src.doomy==1)

														var/O = new /obj/crator(src.loc)
														var/I = new /mob/smoke(src.loc)
														flick("smoke",I)
														spawn()src.Die()

														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
												else
													view(6) << "<font color = red>[usr] shoots a DonDonPa Attack at [src]!!!"
													if(src.block==1)
														M.hp-= amount /10
													else
														M.hp-= amount
											else
												view(6) << "<font color = red>[usr] shoots a DonDonPa Attack at [src]!!!"
												if(src.block==1)

													M.hp-= amount /10
												else
													M.hp-= amount
												if(src.race!=null|"")
													if(src.doomy==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/L in oview(4))
														if(src.client)
															if(src.doomy==1)
																spawn()src<<'sounds/expload.wav'

													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													flick("smoke",I)
													spawn()src.Die()

													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)

									else
										usr << "<b>You launch your Dondonpa, but [M] is out of sight."
										usr.overlays -= /obj/kame
										spawn(3)usr.kame = 0
mob
	Burning
		verb
			Burning(mob/M in oview(6))
				set name = "BurningAttack"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount=skillkiusage[12]

						if(amount >= 1)
							if(amount > usr.ki)
								usr<<"You dont have that much ki"
							if(amount <= usr.ki)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.targets=M
									src=usr.targets
									usr.kame = 1
									usr.overlays += /obj/kame
									if(src.doomy==1)
										spawn()usr<<'sounds/basicbeam_charge.wav'
									for(var/mob/L in view(4))
										if(src.doomy==1)
											if(src.doomy==1)
												spawn()L<<'sounds/basicbeam_charge.wav'
									usr.kame = 1
									usr.overlays += /obj/kame
									flick("ki",usr)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>*moves arms like crazy*"
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>BURNING..."
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>ATTACK!!!"

									usr.overlays -= /obj/kame
									if(src.z == usr.z)
										usr.overlays -= /obj/kame
										if(usr.sounds==1)
											spawn()usr<<'sounds/bigbang_fire.wav'
										for(var/mob/L in oview(4))
											if(src)
												if(L.sounds==1)
													spawn()L<<'sounds/bigbang_fire.wav'
										s_missile('kame5.dmi', usr, src)
										spawn(3)usr.kame = 0
										usr.ki -= amount
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										amount=amount*250
										amount=((amount*50)/(src.powerlevel+1))
										if(src.absorb == 1)
											view(6) << "[src] absorbs [usr]'s Burning attack!"
											src.ki += amount/300
											if(src.ki>src.maxki)
												src.ki=src.maxki
										if(src.absorb == 0)
											if(M.powerlevel>=1)
												M.random = rand(1,2)
												if(M.random == 2||M.random == 1)
													view(6) << "[src] Gets hammered by [usr] ki pressure!"
													M.hp-= amount


													if(src.doomy==1)

														var/O = new /obj/crator(src.loc)
														var/I = new /mob/smoke(src.loc)
														flick("smoke",I)
														spawn()src.Die()

														sleep(50)
														del(I)
														////flick("disapear",O:mob)
														sleep(200)
														del(O)
												else
													view(6) << "<font color = red>[usr] shoots a Burning Attack at [src]!!!"
													if(src.block==1)
														M.hp-= amount /10
													else
														M.hp-= amount
											else
												view(6) << "<font color = red>[usr] shoots a Burning Attack at [src]!!!"
												if(src.block==1)

													M.hp-= amount /10
												else
													M.hp-= amount
												if(src.race!=null|"")
													if(src.doomy==1)
														spawn()usr<<'sounds/expload.wav'
													for(var/mob/L in oview(4))
														if(src.client)
															if(src.doomy==1)
																spawn()src<<'sounds/expload.wav'

													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													flick("smoke",I)
													spawn()src.Die()

													sleep(50)
													del(I)
													////flick("disapear",O:mob)
													sleep(200)
													del(O)

									else
										usr << "<b>You launch your Burning Attack, but [M] is out of sight."
										usr.overlays -= /obj/kame
										spawn(3)usr.kame = 0
atom/movable
	proc
		follow(atom/M)
			if(M)
				if(src)
					src.loc=locate(M.x,M.y,M.z)
					sleep(1)
					spawn()src.follow(M)
mob
	Scattershot
		verb
			Scattershot(mob/M in oview(6))
				set name = "Kakusandan"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount =usr.powerlevel/9
						amount = usr.powerlevel/9
						amount=((amount*50)/(M.powerlevel+1))

						if(amount > 0)
							if(usr.ki<=0)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr<<"You dont have enough Ki"
							if(usr.ki>0)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1

									view(6) << "<font color = red>[usr]:<font color = white> <tt>Prepair to die!!..."
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Kakusandan!!"
									sleep(10)
									usr.overlays += /obj/renzuko
									view(6) << "<font color = red>[usr]:<font color = white> <tt>HA,HA,HA,HA,HA,HA!!!"
									sleep(12)
									flick("ki",usr)
									usr.ki-=usr.maxki/100*20
									usr.overlays -= /obj/renzuko
									if(M)
										if(M.z == usr.z)
											usr.overlays -= /obj/renzuko
											s_missile('kame7.dmi', usr, M)
											var/obj/A = new /obj/scatter(M.loc)
											A.follow(M)
											sleep(1)
											s_missile('kame7.dmi', usr, M)
											sleep(2)
											s_missile('kame7.dmi', usr, M)
											sleep(1)
											s_missile('kame7.dmi', usr, M)
											sleep(2)
											s_missile('kame7.dmi', usr, M)
											sleep(1)
											s_missile('kame7.dmi', usr, M)
											spawn(3)usr.kame = 0
											sleep(30)
											del(A)
											usr.overlays -= /obj/renzuko
											if(M.absorb == 0||M.absorb==1)
												view(6) << "<font color = red>[usr] shoots a barrage of ki blasts at [M]!!!"
												if(M.block==1)
													M.hp-= amount /5
												else
													M.hp-= amount
												if(M.hp>200)
													spawn()
														if(M.race!=null|"")
															var/O = new /obj/crator(M.loc)
															var/I = new /mob/smoke(M.loc)
															flick("smoke",I)
															spawn()M.Die()
															sleep(50)
															del(I)
															sleep(200)
															del(O)
												spawn()usr.KO()
										else
											usr << "<b>You launch your ScatterShot, but [M] is out of sight."
											usr.overlays -= /obj/renzuko
											spawn(3)usr.kame = 0
mob
	Renzuko
		verb
			Renzuko(mob/M in oview(6))
				set name = "Renzuko Energy Dan"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount =usr.powerlevel/60
						amount = usr.powerlevel/60
						amount=((amount*50)/(M.powerlevel+1))

						if(amount>0)
							if(usr.ki<=0)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr<<"You dont have enough Ki"
							if(usr.ki>0)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1

									view(6) << "<font color = red>[usr]:<font color = white> <tt>Prepair to die!!..."
									sleep(20)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Renzuko energy dan!!"
									sleep(10)
									usr.overlays += /obj/renzuko
									view(6) << "<font color = red>[usr]:<font color = white> <tt>HA,HA,HA,HA,HA,HA!!!"
									sleep(12)
									flick("ki",usr)
									usr.ki-=usr.maxki/100*20
									usr.overlays -= /obj/renzuko
									if(M.z == usr.z)
										usr.overlays -= /obj/renzuko
										s_missile('kame8.dmi', usr, M)
										sleep(5)
										s_missile('kame8.dmi', usr, M)
										sleep(3)
										s_missile('kame8.dmi', usr, M)
										sleep(5)
										s_missile('kame8.dmi', usr, M)
										sleep(3)
										s_missile('kame8.dmi', usr, M)
										sleep(5)
										s_missile('kame8.dmi', usr, M)
										spawn(3)usr.kame = 0
										sleep(3)
										usr.overlays -= /obj/renzuko

										if(M.absorb == 0||M.absorb==1)
											view(6) << "<font color = red>[usr] shoots a barrage of ki blasts at [M]!!!"
											if(M.block==1)
												M.hp-= amount /10
											else
												M.hp-= amount
											if(M.block==1)
												M.hp-= amount /10
											else
												M.hp-= amount
											if(M.block==1)
												M.hp-= amount /10
											else
												M.hp-=amount
											if(M.block==1)
												M.hp-=amount /10
											else
												M.hp-=amount
											if(M.block==1)
												M.hp-=amount /10
											else
												M.hp-=amount
											if(M.block==1)
												M.hp-=amount /10
											else
												M.hp-=amount
											if(M.hp>200)
												spawn()
													if(M.race!=null|"")
														var/O = new /obj/crator(M.loc)
														var/I = new /mob/smoke(M.loc)
														flick("smoke",I)
														M.Die()
														sleep(50)
														del(I)
														//flick("disapear",O:mob)
														sleep(200)
														del(O)
											spawn()usr.KO()
									else
										usr << "<b>You launch your Renzuko energy dan, but [M] is out of sight."
										usr.overlays -= /obj/renzuko
										spawn(3)usr.kame = 0

mob
	kiblast
		verb
			kiblast()
				set name = "Ki Blast"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame == 1)
						usr << "<tt>You are currently using a blast"
					if(usr.kame == 0 && usr.move==1)
						var/amount =(usr.maxpowerlevel/20)
						amount*= (usr.powerlevel/usr.maxpowerlevel)
						if(amount >= 1)
							if(usr.ki<=0)
								if(usr.kame==1)
									usr<<"You are already firing a blast"
								else
									spawn(3)usr.kame = 0
									usr<<"You are out of Ki"
							if(usr.ki>0)
								if(usr.kame==1)
									sleep(1)
								else
									usr.kame = 0
									usr.counter=0
									flick("ki",usr)
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>HA!"
									usr.ki-=usr.maxki/20
									if(usr.sounds==1)
										spawn()usr<<'sounds/burning_fire.wav'
									for(var/mob/characters/L in oview(4))
										if(L.client)
											if(L.sounds==1)
												spawn()L<<'sounds/burning_fire.wav'
									if(usr.kame==0)
										var/projicon='kame7.dmi'
										if(usr.kiblastcolor=="red")
											projicon='kame7red.dmi'
										if(usr.kiblastcolor=="teal")
											projicon='kame7teal.dmi'
										if(usr.kiblastcolor=="green")
											projicon='kame7green.dmi'
										if(usr.kiblastcolor=="blue")
											projicon='kame7blue.dmi'
										if(usr.kiblastcolor=="black")
											projicon='kame7black.dmi'
										if(usr.kiblastcolor=="purple")
											projicon='kame7purple.dmi'
										if(usr.kiblastcolor=="pink")
											projicon='kame7pink.dmi'
										if(usr.kiblastcolor=="yellow")
											projicon='kame7.dmi'
										if(usr.kiblastcolor=="orange")
											projicon='kame7orange.dmi'
										if(usr.kiblastcolor=="custom")
											var/tempicon
											var/savefile/F = new("icons/[src.projectile].sav")
											F["icon"]>>tempicon
											projicon=tempicon
										var/projdir=usr.dir
										var/obj/dan_projectile/M = new/obj/dan_projectile(locate(usr.x,usr.y,usr.z))
										M.kitype=1
										usr.move=1
										spawn()Firestraight(M,projicon,amount,projdir,usr,,8)
										spawn(5)
											usr.move=1
											usr.kame=0
									//	sleep(5)
									//	usr.move=1
									//	usr.kame=0
				else
					usr<<"This is a no pk zone"
//Blasts//
obj
	kame
		icon = 'turfs.dmi'
		icon_state = "Kame"
		layer = MOB_LAYER + 3
obj
	renzuko
		icon='kame.dmi'
		icon_state="Renzuko"
		layer = MOB_LAYER + 3
