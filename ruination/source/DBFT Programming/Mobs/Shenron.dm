mob/var/sunlock = 0

mob
	NPC
		ShenronB
			name = "Shenron"
			icon_state="shenron"
			density = 1
			safe = 1
			it_blocked = 1
			energy_code = 8675309
			New()
				..()

			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Shenron- dragon buff")
					if(usr.level < 200000)
						usr << "<font color = white><BIG>\icon[src]</BIG> Shenron:</white> You are far too weak to recieve my training, it would leave you dead!"
						return
					if(!usr.talking)
						usr.talking = 1
						if(!usr.sunlock)
							if(usr.level >= 36000)
								if(usr.karma == "Evil" && usr.karma_rating >= 75)
									usr << "<font color = white>Shenron:</font> Goku was never really good at unlocking potential. Let me fix his mess up."
									sleep(20)
									switch(alert("Train with Shenron?","Can only be done ONCE","Yes","No"))
										if("Yes")
											if(!usr.sunlock)
												usr.sunlock = 1
												sleep(50)
												usr << "<font color = white>You feel Shenron unlock your full potental!"
												sleep(50)
												usr << "<font color = white>Shenron:</font> There, How does that feel [usr.name]?"
												usr.powerlevel_max += 50000000
												usr.ki_max += 50000000
												usr.kidefense_max += 50000000
												usr.strength_max += 50000000
												usr.defence_max += 50000000
												usr.speed_max += 50000000
									//			usr.staminaleft_max += 25000+(usr.level*10)
												usr.talking=0
												return
											else
												usr.talking = 0
												return
										if("No")
											usr << "<font color = white>Shenron:</font> Return when you want your true power, [usr.name]"
											usr.talking = 0
											return
								else
									usr << "<font color = white>Shenron:</font> Get out of here before I destroy you, do gooder!"
									usr.talking = 0
									return
							else
								usr << "<font color = white>Shenron:</font>You need level 36k to get my special training, come back when you have hit the gym."
								usr.talking = 0
								return
						else
							usr << "<font color = white>Shenron:</font> Dont be greedy [usr.name]. I only help somebody out once. Now buzz off, I have work todo."
							usr.talking = 0
							return
					else
						usr<<"You are already talking"