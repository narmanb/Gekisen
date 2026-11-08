mob/var/warrior_quest_start = 0
mob/var/warrior_quest_complete = 0
mob/var/strength_test_start = 0
mob/var/strength_test_complete = 0
mob/var/green_kills = 0

mob/NPC/Yamcha
	icon = 'NPCs - New.dmi'
	icon_state = "Yamcha"
	name = "Yamcha"
	powerlevel = 1000000000000000000000
	density = 1
	safe = 1
	ITflag = 1
	frozen = 1
	energy_code = 1256433
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(2)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Yamcha")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			if(usr.fused)
				return
			spawn(30)usr.talking=0
			usr.talking = 1
			if(!usr.warrior_quest_start)
				usr << "<font color = white>Yamcha:</font> Hi [usr.name]. I see you've decided to start down the path of Martial Arts?"
				sleep(15)
				if(!usr)return
				switch(alert("Begin your Training?","Quest: Warrior's Path","Yes","Not Yet"))
					if("Yes")
						usr.warrior_quest_start = 1
						usr.talking = 0
						usr.contents += new/obj/Quests/Yamcha/A_Warriors_Path
						usr << "<font color = white>Yamcha:</font> Great! Get to Training!"
					else
						usr << "<font color = white>Yamcha:</font> Oh, ok."
						usr.talking = 0
						return
			else
				if(!usr.warrior_quest_complete)
					if(usr.level >= 500)
						usr << "<font color = white>Yamcha:</font> Great, your learning fast!"
						usr.warrior_quest_complete = 1
						usr.exp+=1000
						usr << "<font color=white>Exp +1,000</font>"
						usr.zp+=1
						usr << "<font color=red>You have gained a Z Point!</font>"
						usr.Level_Up()
						usr.talking = 0
						for(var/obj/Quests/Yamcha/A_Warriors_Path/Q)
							del(Q)
					else
						usr << "<font color = white>Yamcha:</font> You still aren't ready, keep Training!"
						usr.talking = 0
						return
				else
					switch(alert("Hi [usr.name]. What can I do for you today?","Yamcha","Do you have a Task?","Nothing"))
						if("Do you have a Task?")
							if(!usr.strength_test_start)
								usr << "<font color = white>Yamcha:</font> Hi again [usr.name]. I have another Task for you if your are Interested?"
								sleep(15)
								if(!usr)return
								switch(alert("Begin your Training?","Quest: A Test of Strength","Yes","Not Yet"))
									if("Yes")
										usr.strength_test_start = 1
										usr.green_kills=0
										usr.contents += new/obj/Quests/Yamcha/A_Test_of_Strength
										usr.talking = 0
										usr << "<font color = white>Yamcha:</font> Good to Hear! What I want you to do is <font color = red>Kill 5 Saibamen</font>"
										return
									else
										usr << "<font color = white>Yamcha:</font> Oh, ok."
										usr.talking = 0
										return
							else
								if(!usr.strength_test_complete)
									if(usr.green_kills >= 5)
										usr << "<font color = white>Yamcha:</font> Great work, your proving to be a Strong Warrior!"
										usr.green_kills = 0
										usr.exp += 8000
										usr.Level_Up()
										usr << "\white EXP +8,000"
										usr.zp+=1
										usr << "<font color=red>You have gained a Z Point!</font>"
										usr.strength_test_start = 0
										usr.strength_test_complete = 1
										for(var/obj/Quests/Yamcha/A_Test_of_Strength/Q)
											del(Q)
/*										if(usr.race=="Human"&&usr.level>=7500)
											if(!usr.learn_spiritball)
												usr.learn_spiritball=1
												usr.contents+=new/obj/Technique/SpiritBall
												usr<<"\white <center>.:: You learn Spirit Ball ::."*/
										usr.talking = 0
										return

									else
										usr << "<font color = white>Yamcha:</font> Go kill 5 saibamen!"
										usr.talking = 0
										return
								else
									usr << "You have already done this quest!"
									return

				//		if("Use Training Points")
				//			if(!usr.tp)
				//				usr << "<font color = white>Yamcha:</font> You don't have any training points."
				//				usr.talking = 0
				//				return
				//			switch(input("Where do you wish to use your TPs?","TPs")in list("Powerlevel","Ki","Ki Defense","Strength","Defense",/*"Speed",*,"Exp","Cancel"))
								if("Cancel")
									usr.talking=0
									return
								if("Powerlevel")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/pl = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Powerlevel!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Ki")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/pl = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.ki_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Ki!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Ki Defense")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/pl = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.kidefense_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Ki Defense!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Strength")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/str = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.strength_max += str
									usr << "<font color = white>Yamcha:</font> You have gained [str] Strength!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Defense")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/str = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.defence_max += str
									usr << "<font color = white>Yamcha:</font> You have gained [str] Defense!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Speed")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/str = rand(425,500) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.speed_max += str
									usr << "<font color = white>Yamcha:</font> You have gained [str] Speed!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Stamina")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/pl = rand(5,6) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.staminaleft_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Stamina!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
								if("Exp")
									var/TP = input ("How many TPs do you wish to use?") as num
									var/pl = (100+(usr.level*0.01)) * TP
									if(TP > usr.tp)
										usr << "<font color = white>Yamcha:</font> You don't have that many TPs!"
										usr.talking = 0
										return
									if(TP == 0 || TP == null || !TP)
										usr.talking = 0
										return
									if(TP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.exp += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Exp!"
									usr.tp -= TP
									usr.tpu += TP
									usr.talking = 0
									return
						if("Use Z Points")
							if(!usr.zp)
								usr << "<font color = white>Yamcha:</font> You don't have any Z points."
								usr.talking = 0
								return
							switch(input("Where do you wish to use your Z Points?","Z Points")in list("Powerlevel","Ki","Ki Defense","Strength","Defense",/*"Speed",*/"Exp","Cancel"))
								if("Cancel")
									usr.talking=0
									return
								if("Powerlevel")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.powerlevel_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] bonus to Powerlevel!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Ki")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.ki_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] bonus to Ki!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Ki Defense")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.kidefense_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] bonus to Ki Defense!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Strength")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.strength_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] Bonus to Strength!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Defense")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.defence_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] bonus to Defense!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Speed")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = round(((rand(80,100) + (usr.moden * rand(80,100))))* ZP)
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.speed_bonus += pl
									usr << "<font color = white>Yamcha:</font> You have gained a [pl] bonus to Speed!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Stamina")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = ZP
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									usr.staminaleft_max += pl
									usr << "<font color = white>Yamcha:</font> You have gained [pl] Stamina!"
									usr.zp -= ZP
									usr.zpu += ZP
									usr.tsb += pl
									usr.talking = 0
									return
								if("Exp")
									var/ZP = input ("How many Z Points do you wish to use?") as num
									var/pl = 0.04 * ZP
									if(ZP > usr.zp)
										usr << "<font color = white>Yamcha:</font> You don't have that many Z Points!"
										usr.talking = 0
										return
									if(ZP == 0 || ZP == null || !ZP)
										usr.talking = 0
										return
									if(ZP < 0)
										usr << "<font color = white>Yamcha:</font> You must enter a positive number!"
										usr.talking = 0
										return
									if(usr.expbm)
										usr << "<font color = white>Yamcha:</font> Your Exp Bonus is maxed!"
										return
									usr.expb += pl
									usr.expm += pl
									if(usr.expb >= 5)
										usr.expb = 5
										usr.expm = 6
										usr.expbm = 1
									usr << "<font color = white>Yamcha:</font> You have gained a [(pl*100)]% bonus to Exp!"
									usr.zp -= ZP
									usr.zpu += ZP
							//		usr.tsb += pl
									usr.talking = 0
									return

						if("Nothing")
							usr.talking = 0
							return
		Set_Spawn_Point()
			set src in oview(1)
			set category=null
			switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
				if("Yes")
					usr.spawn_point = "Yamcha"
				else
					return