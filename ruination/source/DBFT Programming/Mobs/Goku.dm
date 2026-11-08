mob/var/potential_unlocked=0
mob/var/gokupotential = 0
mob/var/learn_x10kamehameha=0
mob
	NPC
		DeadGoku
			name = "Goku(Afterlife)"
			icon = 'NPCs.dmi'
			icon_state="After Life Goku"
			density = 1
			ITflag = 1
			safe = 1
			frozen = 1
			energy_code = 8147722
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Afterlife Gokuuu")
					usr << "<font color=white>Goku: </font>Hey there!"

					if(usr.level < 100000)
						usr << "<font color = white><BIG>\icon[src]</BIG> Goku:</white> You need to be stronger for me to teach you!"
						return
					sleep(20)
					if(!usr.talking)
						if(!usr.gokupotential)
							spawn(30)usr.talking=0
							usr.talking=1
							usr << "<font color=white>Goku: </font>I can sense a great power deep within you. Let me unlock it for you."
							sleep(20)
							switch(alert("Unlock your potential?","Can only be done ONCE","Yes","No"))
								if("Yes")
									if(usr.gokupotential)
										usr.talking=0
										return
									if(usr.form_1||usr.transformed||usr.inverted)
										usr << "<font color=white>Goku: </font>You cannot use this while transformed!"
										usr.talking=0
										return
									usr.gokupotential=1
									usr << "<font color=white>Goku: </font>Ok, just stay still for a moment."
									usr.icon_state = "meditate"
									usr.frozen=1
									usr.doing=1
									sleep(150)
									if(usr.form_1||usr.transformed||usr.inverted)
										usr << "<font color=white>Goku: </font>You cannot use this while transformed!"
										usr.frozen=0
										usr.doing=0
										usr.talking=0
										usr.icon_state = ""
										usr.gokupotential=0
										return
								/*
									var/plgain = usr.powerlevel_max * 0.15
									var/kigain = usr.ki_max * 0.15
									var/strgain = usr.strength_max * 0.15
									var/defgain = usr.defence_max * 0.15
									*/
									var/plgain = usr.powerlevel_max * 0.2
									var/kigain = usr.ki_max * 0.2
									var/strgain = usr.strength_max * 0.2
									var/defgain = usr.defence_max * 0.2
									usr.powerlevel_max += plgain
									usr.ki_max += kigain
									usr.kidefense_max += 25000000
									usr.strength_max += strgain
									usr.defence_max += defgain
									usr.speed_max += 25000000
									spawn(200)
										usr << "<font color = green><b>Powerlevel + [applycommas(plgain)]<br>Ki + [applycommas(kigain)]<br>Strength + [applycommas(strgain)]<br>Defense + [applycommas(defgain)]"
										//usr << "<font color = green><b>Powerlevel + [plgain]<br>Ki + [kigain]<br>Strength + [strgain]<br>Defense + [defgain]"
									//usr.staminaleft_max += 15000+(usr.level*10)

									sleep(150)
									usr << "<font color = white><b>\icon[src] [src.name]: </b>WOW, I was right!! You are much stronger than I thought you were."
									sleep(20)
									usr << "<font color = white><b>\icon[src] [src.name]: </b>MAYBE WE can fight sometime. HA HE HA!"
									sleep(30)
									usr << "<font color = white><b>\icon[src] [src.name]: </b>Ok, see you around [usr]!"

									usr.frozen=0
									usr.doing=0
									usr.talking=0
									usr.icon_state = ""
								if("No")
									usr.talking=0
									return


				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return

		Goku
			name = "Goku"
			icon_state="Goku"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 2290876
			New()
				..()

				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Goku")
					if(!usr.talking)
						usr.talking = 1
						if(usr.level>=4000&&!usr.learn_afterimage)
							usr.learn_afterimage=1
							usr.contents+=new/obj/Technique/AfterImage
							usr<<"<center>\white .:: You learn After Image ::."
							usr.talking=0
							return
						if(usr.level<4000)
							usr<<"<font color = white><b>\icon[src] [src.name]: </b>Get to level 4,000 and I'll teach you something."
							usr.talking=0
							return

						if(usr.level>=4000&&usr.learn_afterimage)
							usr<<"<font color = white><b>\icon[src] [src.name]: </b>I already taught you after image! Click away from me!"
							usr.talking=0
							return

				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return

		SSJ3Goku
			name = "SSJ3 Goku"
			icon_state="GokuSSJ3"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 3944826
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to SSJ3 Goku")
				//	if(usr.race == "Half Saiyan"||usr.race=="Saiyan")
					if(!usr.talking)
						usr.talking = 1
						if(usr.level>=10000&&!usr.learn_dragonfist)
							usr.learn_dragonfist=1
							usr.contents+=new/obj/Technique/DragonFist
							usr<<"<center>\white .:: You learn Dragon Fist ::."
							usr.talking=0
							return

						if(usr.race=="Saiyan")
							if(usr.level<10000)
								usr<<"<font color = white><b>\icon[src] [src.name]: </b>Get to level 10 000 and I'll teach you something."
								usr.talking = 0
								return
						usr.talking = 0
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return

		SSJ4Goku
			name = "SSJ4 Goku"
			icon = 'NPCs - New.dmi'
			icon_state="Goku Ssj4"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 5496515
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to SSJ4 Goku")
					if(!usr.talking)
						usr.talking=1
						if(usr.level>=10000&&!usr.learn_x10kamehameha)
							usr.learn_x10kamehameha=1
							usr.contents+=new/obj/Technique/X10_Kamehameha
							usr<<"<center>\white .:: You learn <font color=red>X10 Kamehameha</font> ::."
							usr.talking=0
							return
						if(usr.level<10000)
							usr<<"<font color = white><b>\icon[src] [src.name]: </b>Get to level 10 000 and I'll teach you something."
							usr.talking = 0
							return
						usr.talking = 0
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Goku"
						else
							return


		ChiChi
			name = "Chi Chi"
			icon = 'MISCMOBS.dmi'
			icon_state="chichi"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 8296515
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to ChiChi")
					if(!usr.talking)
						usr.talking=1
						spawn(50) usr.talking = 0

						usr<<"<font color = white><b>\icon[src] [src.name]: </b>Have you seen Goten? Tell him to come room right away if you see him!"
						usr.talking = 0
						return
						usr.talking = 0
