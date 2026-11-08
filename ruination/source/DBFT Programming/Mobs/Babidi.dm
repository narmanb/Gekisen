mob/var/majin = 0
mob/var/gone_majin = 0
mob/NPC/

	Babidi
		name = "Babidi"
		icon_state = "Babidi"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 5758964
		New()
			..()
			src.CreateName()
		verb
			Talk()
				set src in oview(4)
				set category = null
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Talked to Babadi")
				if(usr.level < 150000)
					usr << "<font color = white><BIG>\icon[src]</BIG> Babidi:</white> You are too weak to join my army!"
					return
				if(usr.talking)
					usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
					return
				spawn(30)usr.talking=0
				usr.talking=1

				if(usr.race != "Majin" || usr.race != "Saibaman")
					if(usr.karma == "Evil")
						if(usr.karma_rating >= 50)
							if(!usr.gone_majin)
								if(usr.level >= 75000)
									switch(alert("Do you wish to join my army?","Join Babidi?","Yes","Not Yet"))
										if("Yes")
											if(usr.gone_majin)
												usr.talking=0
												usr<<"You are already Majinised"
												return
											usr << "<font color = white>Babidi:</font> He He He, I sense evil deep within your soul. Let me unlock it!"
											sleep(50)
											usr << "<font color = white>You feel Babidi take control of your mind!"
											usr.icon_state = "enrage"
											usr.frozen = 1
											usr.doing = 1
											sleep(40)
											if(!usr)return
											usr << "<font color = white>Babidi:</white> He He. How do you feel [usr.name]? He He..."
											usr.icon_state = ""
											usr.frozen = 0
											usr.doing = 0
											usr.powerlevel_max += 50000000
											usr.ki_max += 50000000
											usr.kidefense_max += 50000000
											usr.strength_max += 50000000
											usr.defence_max += 50000000
											usr.speed_max += 50000000
											//usr.staminaleft_max += 15000+(usr.level*10)
											//usr.overlays += 'Majin.dmi'
											usr.safe = 0
											//usr.majin = 1
											usr.gone_majin = 1
											usr.talking=0
											return
										if("Not Yet")
											usr.talking=0
											usr << "<font color = white>Babidi:</font> Then what do you want? Go away!"
											return
								else
									usr.talking=0
									usr << "<font color = white>Babidi:</font> You need to be over level 5000 to accept my training!"
									return
						else
							usr << "<font color = white>Babidi:</font> Your not evil enough, come back when your not such a goody two shoes!"
							usr.talking=0
							return
					else
						usr << "<font color = white>Babidi:</font> You must be Evil for me to train you!"
						usr.talking=0
						return
				else
					usr << "<font color = white>Babidi:</font> I won't train Majins or Saibaman!"
					usr.talking=0
					return
			Set_Spawn_Point()
				set src in oview(1)
				set category=null
				switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
					if("Yes")
						usr.spawn_point = "Babidi"
					else
						return