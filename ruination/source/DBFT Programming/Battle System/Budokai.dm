var
	list
		TourneyPeople = list()
		FFAPeople = list()
	tourney_limit=15
	tourney_llimit=25000
	tourney_count=0
	tourney_on=1
	tourney_register=0
	tourney_type=""
	budofighter1=0
	budofighter2=0
	budofighter3=0
	budofighter4=0
	budofighter5=0
	budofighter6=0
	budofighter7=0
	budofighter8=0
	budofighter9=0
	budofighter10=0
	budofighter11=0
	budofighter12=0
	budofighter13=0
	budofighter14=0
	budofighter15=0
	prize1=0
	prize2=0
	prize3=0
	prize4=0
mob
	var
		tmp
			ceye
			in_budo=0
		in_tourney=0
		//in_budo=0
	PC/verb
		Watch_Budokai()
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Watch Budo")
			if(usr.tourny1_watch)
				usr << "Please stop watching the tournament first"
				return
			if(!usr.tourny_watch)
				usr.ceye=client.eye
				usr.client.perspective=EYE_PERSPECTIVE
				client.eye=locate(381,19,7)
				usr.tourny_watch=1
				return
			else
				client.eye=usr.ceye
				usr.client.perspective=EDGE_PERSPECTIVE
				usr.tourny_watch=0
				return




	Tourney
		verb
			Budokai_Registration()
				set category = "Budokai"
				if(usr.dead)
					usr<<"You are dead"
					return
				if(usr.in_hbtc)
					usr<<"You cannot enter tournaments while in HBTC."
					return
				if(usr.in_herculegym)
					usr<<"Pleae exit Hercule Gym to enter the tournament."
					return
				if(usr.in_war)
					usr<<"You are in a War"
					return
				if(tourney_count>=tourney_limit)
					usr<<"There are no more open spots"
					return
				if(usr.level>tourney_llimit)
					usr<<"Max level for this budokai is [tourney_llimit]"
					return
				else
					if(!usr.in_tourney)
						switch(alert("Do you want to Join the Budokai?","Budokai Registration","Yes","No"))
							if("No")
								return
							else
								if(!tourney_register)
									usr<<"Registration isn't open at the time."
									return
								if(usr.in_tourney)
									return
								if(usr.dead)
									usr<<"You are dead."
									return
								if(usr.in_war)
									usr<<"You are in War."
									return
								if(tourney_count>=tourney_limit)
									usr<<"There are no more open spots."
									return
								if(!usr.pk)
									usr<<"You are not a pk!"
									return
								tourney_count+=1
								usr.in_tourney=1
								usr.it_lock=1
								usr.in_budo=1
								TourneyPeople.Add(usr)
								usr.loc=locate(rand(370,390),rand(34,41),7)
								player <<"<font color=red>Budokai: \white [usr] has \green <u>Registered</u> \white for the Budokai!"
								return
					else
						switch(alert("Do you want to Resign from the Budokai?","Budokai Registration","Yes","No"))
							if("No")
								return
							else
								if(!tourney_register)
									usr<<"Registration isn't open at the time."
									return
								if(!usr.in_tourney)
									return
								if(usr.dead)
									usr<<"You are dead."
									return
								if(usr.in_war)
									usr<<"You are in War."
									return
								tourney_count-=1
								usr.in_tourney=0
								usr.in_budo=0
								usr.it_lock=0
								TourneyPeople.Remove(usr)
								usr.loc=locate(400,260,7)
								player <<"<font color=red>Budokai: \white [usr] has \red <u>Resigned</u> \white from the Budokai!"
								return

	TourneyMaster
		verb
			Budokai_Handle()
				set category = "Budokai"
				switch(input("What do you want to do?","Budokai")in list("Start Registration","End Registration","Start Next Match","Budokai Boot","End Budokai","Budokai Announce","Give Prize","Cancel"))
					if("Cancel")
						return
					if("Give Prize")
						switch(input("Which prize would you like to give out?","Give Prize")in list("First Place","Second Place","Third Place","Competitor"))
							if("First Place")
								if(!prize1)
									src << "First Place prize was not set!"
									return
								var/mob/A = input("Give prize:")as null | anything in TourneyPeople
								A.tp+=prize1
								world << "<font color = #5f9ea0 size = 2>[prize1] Training Points has been won by: </font><font color = white>[A]!</font>"
							if("Second Place")
								if(!prize2)
									src << "Second Place prize was not set!"
									return
								var/mob/A = input("Give prize:")as null | anything in TourneyPeople
								A.tp+=prize2
								world << "<font color = #5f9ea0 size = 2>[prize2] Training Points has been won by: </font><font color = white>[A]!</font>"
							if("Third Place")
								if(!prize3)
									src << "Third Place prize was not set!"
									return
								var/mob/A = input("Give prize:")as null | anything in TourneyPeople
								A.tp+=prize3
								world << "<font color = #5f9ea0 size = 2>[prize3] Training Points has been won by: </font><font color = white>[A]!</font>"
							if("Competitor")
								if(!prize4)
									src << "Competitor prize was not set!"
									return
								var/mob/A = input("Give prize:")as null | anything in TourneyPeople
								A.tp+=prize4
								world << "<font color = #5f9ea0 size = 2>[prize4] Training Points has been won by: </font><font color = white>[A]!</font>"
					if("Budokai Announce")
						var/t=input("What do you wish to annouce?")as null | text
						if(!t||t=="")
							return
						else
							for(var/mob/M in world)
								if(M.in_tourney)
									M<<"<font color=#CC0000><center>Budokai:<br><br>[t]<br>"
							src<<"<font color=#CC0000><center>Budokai:<br><br>[t]<br>"
					if("Budokai Boot")
						var/mob/A = input("Budokai Boot who?")as null | anything in TourneyPeople
						switch(alert("Boot [A]?","","Yes","No"))
							if("Yes")
								var/reason=input("Type in the reason if wanted.")as null | text
								if(reason)
									world << "<FONT color = red>Budokai:<FONT color = White> [usr] \red Booted [A]([reason])"
								else
									world << "<FONT color = red>Budokai:<FONT color = White> [usr] \red Booted [A]"
								if(!A)
									return
								A.in_tourney=0
								A.in_budo=0
								A.sparlocked = 0
								TourneyPeople.Remove(A)
								A.loc=locate(400,260,7)
								tourney_count-=1
								return
					if("End Budokai")
						for(var/mob/M in world)
							M.verbs -= new/mob/Tourney/verb/Budokai_Registration
							if(M.in_tourney)
								M.it_lock=0
								M.it_lock=0
								M.loc=locate(rand(390,400),rand(245,260),7)
								M.in_tourney=0
								M.in_budo=0
						tourney_register=0
						tourney_count=0
						budofighter1=0
						budofighter2=0
						tourney_on=0
						prize1=0
						prize2=0
						prize3=0
						prize4=0
						TourneyPeople=new/list()
						world << "<font color=red>Budokai: \white [usr] Canceled the Budokai!"
						return
					if("End Registration")
						tourney_register=0
						for(var/mob/M in world)
							M.verbs-=new/mob/Tourney/verb/Budokai_Registration
						world << "<font color=red>Budokai: \white Registrations for the Budokai are closed!"
						return
					if("Start Registration")
						var/limit=input("Set the Budokai player limit.")as num
						var/llimit=input("Set the player level limit.")as num
						if(!limit)
							return
						else
							tourney_limit=limit
						if(!llimit)
							return
						else
							tourney_llimit=llimit
						prize1=input("Set the FIRST PLACE Training Point prize.")as num
						prize2=input("Set the SECOND PLACE Training Point prize.")as num
						prize3=input("Set the THIRD PLACE Training Point prize.")as num
						prize4=input("Set the Fighter Training Point prize.")as num
						if(prize1<0)
							prize1=0
						if(prize1>1000000)
							prize1=1000000
						if(prize2<0)
							prize2=0
						if(prize2>500000)
							prize2=500000
						if(prize3<0)
							prize3=0
						if(prize3>300000)
							prize3=300000
						if(prize4<0)
							prize4=0
						if(prize4>100000)
							prize4=100000
						tourney_register=1
						tourney_on=1
						TourneyPeople=new/list()
						for(var/mob/PC/M in player)
							M.in_tourney=0
							M.in_budo=0
							M.verbs+=new/mob/Tourney/verb/Budokai_Registration
						world << "<font color=red>Budokai: \white Registrations for the Budokai are open!  First Place Prize: [prize1] Training Points  Player Level Limit: [tourney_llimit]"
						return

/*					if("Start FFA Budokai")
						var/pnum = tourney_count
						switch(alert("Begin FFA Budokai?","FFA Budokai","Yes","No"))
							if("Yes")
								if(pnum < 4)
									usr << "You need atleast 4 people for a FFA."
									return
								for(var/mob/PC/M in player)
									if(M.in_tourney)
										M.frozen = 1
										M.doing = 1
										M.safe = 1
										M.it_lock = 1
										M.zanz_lock = 1
										M.attack_lock = 1
										M.ki_lock = 1
										FFAPeople.Add(M)

								//var/listx =
								//var/i = 1
								//for(i in TourneyPeople)
								//	i=TourneyPeople.len++
								//	m.loc=locate(listx,listy,1)
								var/mob/PC/A = rand in TourneyPeople
								TourneyPeople.Remove(A)
								sleep(10)
								A.loc=locate(295,240,1)
								pnum -= 1
								var/mob/PC/B = anything in TourneyPeople
								TourneyPeople.Remove(B)
								sleep(10)
								B.loc=locate(295,230,1)
								pnum -= 1
								var/mob/PC/C = anything in TourneyPeople
								TourneyPeople.Remove(C)
								sleep(10)
								C.loc=locate(295,220,1)
								pnum -= 1
								var/mob/PC/D = anything in TourneyPeople
								TourneyPeople.Remove(D)
								sleep(10)
								D.loc=locate(310,240,1)
								pnum -= 1
								var/mob/PC/E = anything in TourneyPeople
								TourneyPeople.Remove(E)
								sleep(10)
								E.loc=locate(310,230,1)
								pnum -= 1
								if(pnum > 0)
									var/mob/PC/F = anything in TourneyPeople
									TourneyPeople.Remove(F)
									sleep(10)
									F.loc=locate(310,220,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/G = anything in TourneyPeople
									TourneyPeople.Remove(G)
									sleep(10)
									G.loc=locate(325,240,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/H = anything in TourneyPeople
									TourneyPeople.Remove(H)
									sleep(10)
									H.loc=locate(325,230,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/I = anything in TourneyPeople
									TourneyPeople.Remove(I)
									sleep(10)
									I.loc=locate(325,220,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/J = anything in TourneyPeople
									TourneyPeople.Remove(J)
									sleep(10)
									J.loc=locate(340,240,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/K = anything in TourneyPeople
									TourneyPeople.Remove(K)
									sleep(10)
									K.loc=locate(340,230,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/L = anything in TourneyPeople
									TourneyPeople.Remove(L)
									sleep(10)
									L.loc=locate(340,220,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/M = anything in TourneyPeople
									TourneyPeople.Remove(M)
									sleep(10)
									M.loc=locate(355,240,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/N = anything in TourneyPeople
									TourneyPeople.Remove(N)
									sleep(10)
									N.loc=locate(355,230,1)
									pnum -= 1
								if(pnum > 0)
									var/mob/PC/O = anything in TourneyPeople
									TourneyPeople.Remove(O)
									sleep(10)
									O.loc=locate(355,220,1)
									pnum -= 1
								world << "<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>Free For All Begins in!</font>"
								sleep(30)
								world << "<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>3</font>"
								sleep(10)
								world << "<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>2</font>"
								sleep(10)
								world << "<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>1</font>"
								sleep(10)
								world << "<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 3>GO</font>"
								for(var/mob/PC/M in player)
									if(M.in_tourney)
										M.frozen = 0
										M.doing = 0
										M.safe = 0
										M.it_lock = 0
										M.zanz_lock = 0
										M.attack_lock = 0
										M.ki_lock = 0

							else
								return*/

					if("Start Next Match")
						var/mob/A = input("Select opponent #1")as null | anything in TourneyPeople
						switch(alert("Opponent #1: [A]","Budokai","Yes","No"))
							if("Yes")
								var/mob/B = input("Select opponent #2")as null | anything in TourneyPeople
								switch(alert("Opponent #2: [B]","Budokai","Yes","No"))
									if("Yes")
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>The next match is starting soon!: [A] vs [B]!</font>"
										A << "<b><font color = #5f9ea0 size = 1>You have 30 seconds to prepare!"
										B << "<b><font color = #5f9ea0 size = 1>You have 30 seconds to prepare!"
										A.doing = 0
										B.doing = 0
										sleep(300)
										if(!A||!B)
											usr<<"One of them logged out."
											return
										A.loc=locate(371,20,7)
										A.frozen = 1
									//	A.doing = 1
										A.safe = 1
										A.it_lock = 1
										A.zanz_lock = 1
										A.attack_lock = 1
										A.ki_lock = 1
										B.loc=locate(391,20,7)
										B.frozen = 1
										B.doing = 1
										B.safe = 1
										B.it_lock = 1
										B.zanz_lock = 1
										B.attack_lock = 1
										B.ki_lock = 1
										budofighter1=A
										budofighter2=B
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>Next Match: [A] vs [B]!</font>"
										sleep(30)
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>3</font>"
										sleep(10)
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>2</font>"
										sleep(10)
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 2>1</font>"
										sleep(10)
										player <<"<font color = #5f9ea0 size = 3>Budokai Information: </font><font color = white size = 3>GO</font>"
										A.frozen = 0
										A.doing = 0
										A.safe = 0
										A.it_lock = 0
										A.zanz_lock = 0
										A.attack_lock = 0
										A.ki_lock = 0
										B.frozen = 0
										B.doing = 0
										B.safe = 0
										B.it_lock = 0
										B.zanz_lock = 0
										B.attack_lock = 0
										B.ki_lock = 0
										return
									else
										return
							else
								return

mob
	proc
		Budokai_Check()
			if(tourney_on&&tourney_register)
				src.verbs += new/mob/Tourney/verb/Budokai_Registration
				return
			else
				src.verbs -= new/mob/Tourney/verb/Budokai_Registration
				return
proc
	BudokaiResign(mob/N)
		if(!N.in_tourney)return
		for(var/mob/PC/M in player)
			if(M==N)continue
			if(M==budofighter1||M==budofighter2)
				M.loc=locate(rand(390,400),rand(245,260),7)
		budofighter1=0
		budofighter2=0
		N.in_tourney=0
		N.in_budo=0
		return
/*turf
	Floors
		BudokaiOutside
			density=1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				if(M==budofighter1||M==budofighter2)
					BudokaiResign(M)
					TourneyPeople.Remove(M)
					tourney_count--
					M.loc = locate(rand(93,119),rand(588,604),6)
					return
				else
					M.loc=locate(rand(76,96),rand(69,74),7)*/