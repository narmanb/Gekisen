/var
	tournytime=0
	tournament = 0
	match = 0
	type = ""
	started=0
	juniort=0
	worldt=0
	galactict=0
	universalt=0
	list/Entries = list()
	list/Contestants = list()
	list/Winners = list()
mob
	var
		tmp
			tourny=0
			juniorc=0
			worldc=0
			galacticc=0
			universalc=0
mob/Tournament
	verb
		Enter_Tournament()
			set category = "Channels"
			set name = "Enter Tournament"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Enter Tourny")
			if(usr.dead)
				usr<<"\red You are dead!"
				return
			if(usr.fused)
				usr<<"\red You are fused!"
				return
			if(usr.in_hbtc)
				usr<<"You cannot enter tournaments right now."
				return
			if(!usr.pk)
				usr<<"You are not a combatant, train more!"
				return
			if(started)
				usr<<"<font color=white>The tournament has already started</font></b></u>"
				return
			if(!tournament)
				usr<<"<font color=white>Tournament isn't open yet."
				return
			if(usr.tourny)
				usr<<"<font color=white><b><u>You're already in the tournament!</font></b></u>"
				return
			var/dbsinv = 0
			for(var/obj/O in src)
				if(O.dball)
					dbsinv++
			if(dbsinv>0)
				usr<<"<font color=white>You cannot enter a tournament while holding the dragonballs"
				return
//junior
			if(tnum == 1)
				if(usr.level >= 50000)
					usr << "You must be below level 50,000 to join this tournament."
					return
				else
					usr.loc=locate(rand(465,490),rand(25,30),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.in_tourney=1
					usr.safe=1
					usr.ki_lock=1
					usr.attack_lock=1
					usr.zanz_lock=1
					usr.it_lock=1
					if(usr.juniorc)
						player<<"<font color=#0033ff><b><u>[usr] joined the tournament! The Junior Title is now on the line!!!</font></b></u>"
						juniort = 1
					else
						player<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//world
			if(tnum == 3)
				usr.loc=locate(rand(465,490),rand(25,30),7)
				Entries.Add(usr)
				Contestants.Add(usr)
				usr.tourny=1
				usr.in_tourney=1
				usr.safe=1
				usr.ki_lock=1
				usr.attack_lock=1
				usr.zanz_lock=1
				usr.it_lock=1
				if(usr.worldc)
					player<<"<font color=#ff3300><b><u>[usr] joined the tournament! The World Title is now on the line!!!</font></b></u>"
					worldt = 1
				else
					player<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//galactic
			if(tnum == 2)
				if(usr.level <= 50000 && usr.level < 100000)
					usr << "You must be level  50 001 or higher to join this tournament."
					return
				else
					usr.loc=locate(rand(465,490),rand(25,30),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.in_tourney=1
					usr.safe=1
					usr.ki_lock=1
					usr.attack_lock=1
					usr.zanz_lock=1
					usr.it_lock=1
					if(usr.galacticc)
						player<<"<font color=#6600ff><b><u>[usr] joined the tournament! The Galactic Title is now on the line!!!</font></b></u>"
						galactict = 1
					else
						player<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//universal
			if(tnum == 4)
				if(usr.level <= 99999)
					usr << "You must be level 100 000 or higher to join this tournament."
					return
				else
					usr.loc=locate(rand(465,490),rand(25,30),7)
					Entries.Add(usr)
					Contestants.Add(usr)
					usr.tourny=1
					usr.in_tourney=1
					usr.safe=1
					usr.ki_lock=1
					usr.attack_lock=1
					usr.zanz_lock=1
					usr.it_lock=1
					if(usr.universalc)
						player<<"<font color=#66ffff><b><u>[usr] joined the tournament! The Universal Title is now on the line!!!</font></b></u>"
						universalt = 1
					else
						player<<"<font color=white><b><u>[usr] joined the tournament!</font></b></u>"
//race

		Leave_Tournament()
			set category = "Channels"
			set name = "Leave Tournament"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Leave Tourny")
			if(!tournament)
				usr<<"<font color=white>Tournament isn't open yet."
				return
			if(started)
				usr<<"<font color=white>You cannot leave the tournament!</font>"
				return
			if(!usr.tourny)
				usr<<"<font color=white><b><u>You're not in the tournament!</font></b></u>"
				return
			if(usr.juniorc||usr.worldc||usr.galacticc||usr.universalc)
				usr<<"<font color=white>You cannot leave the tournament if you are a title holder.</font>"
				return
			else
				usr.loc = locate(400,260,7)
				usr.tourny=0
				usr.in_tourney=0
				usr.safe=0
				usr.ki_lock=0
				usr.attack_lock=0
				usr.zanz_lock=0
				usr.it_lock=0
				usr.in_herculegym = 0
				Entries.Remove(usr)
				Contestants.Remove(usr)
				player<<"<font color=white><b><u>[usr] left the tournament!</font></b></u>"




proc
	Prize(var/mob/M in Winners)
	/*	if(tnum==2||tnum==4||tnum==6||tnum==8||tnum==10||tnum==12||tnum==14||tnum==16||tnum==18||tnum==20||tnum==22||tnum==24||tnum==26||tnum==28||tnum==30||tnum==32||tnum==34||tnum==36)
			player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the race tournament and will receive 250 levels!</font>"
			started=0
			var/amount=250
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)
				*/

		if(tnum == 1)
			player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the junior tournament and will receive 500 levels & 1000 Training Points!</font>"
			if(juniort)
				player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] is now the <FONT COLOR=#0000cd>J</FONT><FONT COLOR=#2222c7>u</FONT><FONT COLOR=#4444bf>n</FONT><FONT COLOR=#6666b8>i</FONT><FONT COLOR=#8888b0>o</FONT><FONT COLOR=#a9a9a9>r</FONT><FONT COLOR=#8e8eaf> </FONT><FONT COLOR=#7171b5>C</FONT><FONT COLOR=#5555bc>h</FONT><FONT COLOR=#3939c2>a</FONT><FONT COLOR=#1c1cc8>m</FONT><FONT COLOR=#0000cd>p</FONT>!!</font>"
				M.juniorc = 1

				juniort = 0
	/*		else
				if(prob(15))
					player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] is now the <FONT COLOR=#0000cd>J</FONT><FONT COLOR=#2222c7>u</FONT><FONT COLOR=#4444bf>n</FONT><FONT COLOR=#6666b8>i</FONT><FONT COLOR=#8888b0>o</FONT><FONT COLOR=#a9a9a9>r</FONT><FONT COLOR=#8e8eaf> </FONT><FONT COLOR=#7171b5>C</FONT><FONT COLOR=#5555bc>h</FONT><FONT COLOR=#3939c2>a</FONT><FONT COLOR=#1c1cc8>m</FONT><FONT COLOR=#0000cd>p</FONT>!!</font>"
					M.juniorc = 1
					juniort = 0*/
			started=0
			//var/amount=500
			M.exp += M.tnl * 500
			M.tp+=1000
			M.in_tourney=0
		//	M.lvluphold=0
		//	while(amount>0)
		//		M.exp = M.tnl
		//		M.Level_Up()
		//		amount -= 1
		//		sleep(1)

		if(tnum == 3)
			player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the world tournament and will receive 1000 levels!</font>"
			if(worldt)
				player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] is now the <FONT SIZE=+1><FONT COLOR=#b22222>W</FONT><FONT COLOR=#a7373a>o</FONT><FONT COLOR=#9b4b52>r</FONT><FONT COLOR=#8f606a>l</FONT><FONT COLOR=#837482>d</FONT><FONT COLOR=#778899> </FONT><FONT COLOR=#837482>C</FONT><FONT COLOR=#8f606a>h</FONT><FONT COLOR=#9b4b52>a</FONT><FONT COLOR=#a7373a>m</FONT><FONT COLOR=#b22222>p</FONT></FONT>!!</font>"
				M.worldc = 1
				worldt = 0
			started=0
			M.in_tourney=0
			//M.lvluphold=0
			M.exp += M.tnl * 1000
			//M.tp+=1000
	//		while(amount>0)
	//			M.exp = M.tnl
	//			M.Level_Up()
	//			amount -= 1
	//			sleep(1)

		if(tnum == 2)
			player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the galactic tournament and will receive 1000 levels!</font>"
			if(galactict)
				player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] is now the <FONT SIZE=+1><FONT COLOR=#0000cd>G</FONT><FONT COLOR=#2b2acd>a</FONT><FONT COLOR=#5554cd>l</FONT><FONT COLOR=#807ecd>a</FONT><FONT COLOR=#aba7cd>c</FONT><FONT COLOR=#d5d1cd>t</FONT><FONT COLOR=#fffacd>i</FONT><FONT COLOR=#dbd7cd>c</FONT><FONT COLOR=#b7b3cd> </FONT><FONT COLOR=#928fcd>C</FONT><FONT COLOR=#6e6ccd>h</FONT><FONT COLOR=#4948cd>a</FONT><FONT COLOR=#2524cd>m</FONT><FONT COLOR=#0000cd>p</FONT></FONT>!!</font>"
				M.galacticc = 1
				galactict = 0
			started=0
			M.in_tourney=0
			//M.lvluphold=0
			M.exp += M.tnl * 1000
			M.tp+=1000

		if(tnum == 4)
			player<<"<font color=#cc0000>Tournament News: </font><font color=white>[M] has won the universal tournament and will receive 1500 levels!</font>"
			if(universalt)
				player<<"<font color=#cc0000>Tournament News: </font><font color=white>]M] is now the <FONT SIZE=+1><FONT COLOR=#00ffff>U</FONT><FONT COLOR=#1be8fa>n</FONT><FONT COLOR=#35cff3>i</FONT><FONT COLOR=#50b7ed>v</FONT><FONT COLOR=#6b9ee6>e</FONT><FONT COLOR=#8686e0>r</FONT><FONT COLOR=#a06dd9>s</FONT><FONT COLOR=#ba55d3>a</FONT><FONT COLOR=#a06dd9>l</FONT><FONT COLOR=#8686e0> </FONT><FONT COLOR=#6b9ee6>C</FONT><FONT COLOR=#50b7ed>h</FONT><FONT COLOR=#35cff3>a</FONT><FONT COLOR=#1be8fa>m</FONT><FONT COLOR=#00ffff>p</FONT></FONT>!!</font>"
				M.universalc = 1
				universalt = 0
			started=0
			M.in_tourney=0
		//	M.lvluphold=0
			M.exp += M.tnl * 1500


		M.loc = locate(400,260,7)


/*	Prize(var/mob/M in Winners)
		player<<"Tournament News: [M] has won the world tournament and will receive a prize of their choice"
		started=0
		var/prize
		prize=input(M,"Congratulations, You Won! Please Select Your Prize")in list("Training Points","Karma","PowerLevel","Ki","Ki Defense","Strength","Defence","Speed")
		switch(prize)
			if("Training Points")
				var/wtprize = 1000 + round(M.level/10)
			//	var/chance=rand(1000,2000)
				if(type == "Junior")
					M.tp += wtprize
					M << "<font color=#5f9ea0>You have been blessed with more training points.([wtprize])"
				if(type == "World")
					M.tp += wtprize * 1.5
					M << "<font color=#5f9ea0>You have been blessed with more training points.([wtprize*1.5])"
				if(type == "Galactic")
					M.tp += wtprize * 2
					M << "<font color=#5f9ea0>You have been blessed with more training points.([wtprize*2])"
				if(type == "Universal")
					M.tp += wtprize * 3
					M << "<font color=#5f9ea0>You have been blessed with more training points.([wtprize]*2)"
			if("Karma")
				switch(input(M,"Which Karma do you wish to have?","Karma",) in list ("Evil","Good"))
					if("Evil")
						M.karma="Evil"
						M.karma_rating=50
					if("Good")
						M.karma="Good"
						M.karma_rating=50
			if("PowerLevel")
				var/wpprize = 500000 + round(M.powerlevel_max/1000)
				M.powerlevel_max+=wpprize
				M<<"<font color=#5f9ea0>You have been blessed with more Power.([wpprize])"
			if("Ki")
				var/wkprize = 500000 + round(M.ki_max/1000)
				M.ki_max+=wkprize
				M<<"<font color=#5f9ea0>You have been blessed with more Ki.([wkprize])"
			if("Ki Defense")
				var/wkdprize = 500000 + round(M.kidefense_max/1000)
				M.kidefense_max+=wkdprize
				M<<"<font color=#5f9ea0>You have been blessed with more Ki Defense.([wkdprize])"
			if("Strength")
				var/wsprize = 500000 + round(M.strength_max/1000)
				M.strength_max+=wsprize
				M<<"<font color=#5f9ea0>You have been blessed with more Strength.([wsprize])"
			if("Defence")
				var/wdprize = 500000 + round(M.defence_max/1000)
				M.defence_max+=wdprize
				M<<"<font color=#5f9ea0>You have been blessed with more Defence.([wdprize])"
			if("Speed")
				var/wfprize = 500000 + round(M.speed_max/1000)
				M.speed_max+=wfprize
				M<<"<font color=#5f9ea0>You have been blessed with more Speed.([wfprize])"
			if("Stamina")
				var/weprize = 10000 + round(M.level*5)
				M.staminaleft_max+=weprize
				M<<"<font color=#5f9ea0>You have been blessed with more Stamina.([weprize])"
		M.loc = locate(154,165,1)*/

proc
	KILLTOURNY()
		for(var/mob/PC/M in player)
			M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
			M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			if(M.tourny)
				M<<"For participating in the tournament you are rewarded with 100 levels."
				/*
				var/amount=50
				while(amount>0)
					M.exp = M.tnl
					M.Level_Up()
					amount -= 1
					sleep(1)
					*/

				M.exp += M.tnl * 100
				M.tourny = 0
				M.safe=0
				M.ki_lock=0
				M.attack_lock=0
				M.zanz_lock=0
				M.it_lock=0

				Entries.Remove(M)
				Contestants.Remove(usr)
				M.loc = locate(400,260,7)
				M.in_herculegym = 0
		tournament=0
		juniort=0
		worldt=0
		galactict=0
		universalt=0
		started=0
/*proc
	NextTourney()
		tnum ++
		if(tnum >= 38)
			tnum = 1
		if(tnum == 1||tnum==9||tnum==17||tnum==25||tnum==33)
			world << output("<font color = white><center><b>The Junior Martial Arts Tournament will begin in 5 Minutes!","output2")
		if(tnum == 3||tnum==11||tnum==19||tnum==27||tnum==35)
			world << output("<font color = white><center><b>The World Tournament will begin in 5 Minutes!","output2")
		if(tnum == 5||tnum==13||tnum==21||tnum==29)
			world << output("<font color = white><center><b>The Galactic Tournament will begin in 5 Minutes!","output2")
		if(tnum == 7||tnum==15||tnum==23||tnum==31)
			world << output("<font color = white><center><b>The Universal Tournament will begin in 5 Minutes!","output2")
		if(tnum == 2)
			world << output("<font color = red><center><b>The Android Tournament will begin in 5 Minutes!","output2")
		if(tnum == 4)
			world << output("<font color = green><center><b>The Bio Android Tournament will begin in 5 Minutes!","output2")
		if(tnum == 6)
			world << output("<font color = blue><center><b>The Bio Warrior Tournament will begin in 5 Minutes!","output2")
		if(tnum == 8)
			world << output("<font color = purple><center><b>The Changeling Tournament will begin in 5 Minutes!","output2")
		if(tnum == 10)
			world << output("<font color = dark red><center><b>The Demon Tournament will begin in 5 Minutes!","output2")
		if(tnum == 12)
			world << output("<font color = white><center><b>The Dragon Tournament will begin in 5 Minutes!","output2")
		if(tnum == 14)
			world << output("<font color = yellow><center><b>The Half Saiyan Tournament will begin in 5 Minutes!","output2")
		if(tnum == 16)
			world << output("<font color = blue><center><b>The Heran Tournament will begin in 5 Minutes!","output2")
		if(tnum == 18)
			world << output("<font color = white<center>><b>The Human Tournament will begin in 5 Minutes!","output2")
		if(tnum == 20)
			world << output("<font color = light blue><center><b>The kai Tournament will begin in 5 Minutes!","output2")
		if(tnum == 22)
			world << output("<font color = purple><center><b>The Konat Tournament will begin in 5 Minutes!","output2")
		if(tnum == 24)
			world << output("<font color = pink><center><b>The Majin Tournament will begin in 5 Minutes!","output2")
		if(tnum == 26)
			world << output("<font color = purple><center><b>The Feline Tournament will begin in 5 Minutes!","output2")
		if(tnum == 28)
			world << output("<font color = dark green><center><b>The Namekian Tournament will begin in 5 Minutes!","output2")
		if(tnum == 30)
			world << output("<font color = green><center><b>The Saibaman Tournament will begin in 5 Minutes!","output2")
		if(tnum == 32)
			world << output("<font color = yellow><center><b>The Saiyan Tournament will begin in 5 Minutes!","output2")
		if(tnum == 34)
			world << output("<font color = grey><center><b>The Tuffle Tournament will begin in 5 Minutes!","output2")
*/
proc
	AutoStartTourney()
		set background = 1
		tnum++
		if(tnum >= 5)
			tnum = 1
		for(var/mob/M in player)
			if(M.tourny == 1)
				return
		if(tournament == 1)
			return
		else
			//world << "SHOULD DISPLAY TOURNEY STUFF.  tournament: [tournament]   tnum: [tnum]"
			if(tnum == 1)
				//var/tmp/check=0
				//for(var/mob/M in player)
				//	if(M.level <= 50000)
				//		check ++
				//if(check<=1)
				player<<output("<center><font size=1><font color = white><b><center>The Junior Martial Arts Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Channels tab and select Enter Tournament.","output1")
				//else
					//tnum++
			if(tnum == 3)
				player << output("<center><font size=1><font color = red><b><center>The World Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Channels tab and select Enter Tournament.","output1")
			if(tnum == 2)
				//var/tmp/check=0
				//for(var/mob/M in player)
				//	if(M.level >= 50000 && M.level < 100000)
				//		check ++
				//if(check<=1)
				player<<output("<center><font size=1><font color = white><b><center>The Galactic Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Channels tab and select Enter Tournament.","output1")
				//else
				//	tnum++
			if(tnum == 4)
				//var/tmp/check=0
				//for(var/mob/M in player)
				//	if(M.level >= 100000)
				//		check ++
				//if(check<=1)
				player<<output("<center><font size=1><font color = white><b><center>The Universal Tournament has begun! You have 2 minutes to enter.<br><font size = 1>To join please go to Channels tab and select Enter Tournament.","output1")
				//else
				//	tnum++

			tournament = 1
			for(var/mob/PC/M in player)
				M.verbs += new/mob/Tournament/verb/Enter_Tournament()
				M.verbs += new/mob/Tournament/verb/Leave_Tournament()
				for(var/mob/Q in Entries)
					Entries.Remove(Q)
				for(var/mob/S in Winners)
					Winners.Remove(S)
				for(var/mob/C in Contestants)
					Contestants.Remove(C)
			spawn(300) TourneyCountdown()
			spawn(1200) AutoStopTourney()
	TourneyCountdown()
		set background = 1
		player<<output("<font color = white><b><center>The Tournament is due to start in 1.5 minutes.","output1")
		for(var/mob/PC/M in player)
			M.verbs += new/mob/Tournament/verb/Enter_Tournament()
			M.verbs += new/mob/Tournament/verb/Leave_Tournament()
		sleep(300)
		player<<output("<font color = white><b><center>The Tournament is due to start in 1 minutes.","output1")
		for(var/mob/PC/M in player)
			M.verbs += new/mob/Tournament/verb/Enter_Tournament()
			M.verbs += new/mob/Tournament/verb/Leave_Tournament()
		sleep(300)
		player<<output("<font color = white><b><center>The Tournament is due to start in 30 seconds.","output1")
		for(var/mob/PC/M in player)
			M.verbs += new/mob/Tournament/verb/Enter_Tournament()
			M.verbs += new/mob/Tournament/verb/Leave_Tournament()
		return
	AutoStopTourney()
		if(tournament == 1)
	//		world << "<center><font size=3><font color = red><b><center>The tournament entry has now ended."
	//		world << "<font size=1><font color = red><b>The following people are in the tournament"
	//		for(var/mob/M in player)
	//			if(M.tourny)
	//				world << "[M]"
			for(var/mob/PC/M in player)
				M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
				M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			if(Entries.len<=1 && Winners.len<1)
				started=0
				player<<output("<center><font size=3><font color=#5f9ea0>Not enough players, Tournament cancelled.","output1")
				for(var/mob/PC/M in player)
					M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
					M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
					M.in_tourney = 0
				tournament=0
				KILLTOURNY()
			Tournament_AI()

	AutoTournyRevive()
		for(var/mob/D in player)
			if(D.dead)
				D.overlays -= 'Halo.dmi'
				D.dead = 0
				D.safe = 0
				D.ki_lock=0
				D.attack_lock=0
				D.zanz_lock=0
				D.it_lock=0
				D.in_tourney=0
				D.loc=locate(rand(390,400),rand(245,260),7)
				D.in_herculegym = 0
				spawn(300)
					if(!D)return
					D.safe = 0

proc
	Tournament_AI()
		started=1
		if(Entries.len<1 && Winners.len<1)
	//		player<<"<center><font size=2><font color=#5f9ea0>Tournament over, all contestants have left..."
			for(var/mob/C in player)
				if(C.client)
					if(C.tourny==1)
						C.tourny=0
						C.safe=0
						C.ki_lock=0
						C.attack_lock=0
						C.zanz_lock=0
						C.it_lock=0
						C.in_herculegym = 0
			KILLTOURNY()
			started=0
			return
		if(Entries.len<1 && Winners.len==1)
			tournament=0
			player<<"<center><font size=1><font color=#5f9ea0>Tournament over, winner is:"
			for(var/mob/M in Winners)
				player<<M
				Prize(M)
				Entries=list()
				Winners=list()
				M.it_lock=0
				M.pvpflagged=0
				M.pvptimer=0
				M.in_herculegym = 0

			for(var/mob/C in player)
				if(C.client)
					C.tourny=0
					C.safe=0
					C.ki_lock=0
					C.attack_lock=0
					C.zanz_lock=0
					C.it_lock=0
					C.in_herculegym = 0
			for(var/mob/PC/M in player)
				M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
				M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
			started=0
			spawn(50)AutoTournyRevive()
			return
		if(Entries.len < 2)
			NextRound()
		else
			FixEntries()
			if(match)
				return
			if(!Entries||Entries.len<2)
				Tournament_AI()
				return
			player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: Are you ready for battle?"
			player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: Next up is..."
			sleep(15)
			Matches()

	FixEntries()
		var/list/Cop=list()
		for(var/mob/PC/A in Entries)
			var/good=1
			if(A&&ismob(A)&&A.client&&A.z==7)
				for(var/mob/B in Cop)
					if(A==B)
						good=0
				if(good)
					Cop+=A
				else
		Entries=Cop

	Matches()
		FixEntries()
		if(!Entries||Entries.len<2)
			Tournament_AI()
			return
		var/mob/A=Entries[rand(1,Entries.len)]
		var/mob/B=Entries[rand(1,Entries.len)]
		if(!A||!B||A==B||A.z!=7||B.z!=7)
			Matches()
			return
		match=1
		if(!(A && B))
			match=0
			Tournament_AI()
			return
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: [A] V.S. [B]!"
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: You have 15 seconds to prepare yourselves!"
		sleep(150)
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: 3!"
		sleep(10)
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: 2!"
		sleep(10)
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: 1!"
		sleep(10)
		if(!A||!B||A==B||A.z!=7||B.z!=7)
			match=0
			player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: Match Cancelled..."
			Tournament_AI()
			return
		player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: FIGHT!"
		sleep(1)
		if(!A||!B||A==B||A.z!=7||B.z!=7)
			match=0
			player<<"<center><font size=1><font color=#5f9ea0>Tournament Announcer: Match Cancelled..."
			Tournament_AI()
			return
		if(A)A.loc=locate(465,13,7)
		if(B)B.loc=locate(488,13,7)
		A.safe=0
		A.ki_lock=0
		A.attack_lock=0
		A.zanz_lock=0
		A.it_lock=0
		B.safe=0
		B.ki_lock=0
		B.attack_lock=0
		B.zanz_lock=0
		B.it_lock=0
		Fight(A,B)
		FixEntries()
		match=0
		Tournament_AI()

proc
	Fight(mob/A,mob/B)
		set background = 1
		while(1)
			if(!B || B.z != 7 || B.dead || !B.tourny)
				if(!B)
					player<<"<center><font size=1><font color=#5f9ea0>[A] has won his round because his opponent has left!"
				else
			//		var/lprize = 300 + round(B.level/20)
					player<<"<center><font size=1><font color=#5f9ea0>[A] has eliminated [B]!"
					Entries.Remove(B)
					B.tourny=0
					B<<"For participating in the tournament you are rewarded with 100 levels."
					B.exp += B.tnl * 100

				Winners.Add(A)
				Entries.Remove(A)
				A.loc=locate(rand(465,490),rand(25,30),7)
				if(A.level <= 10000)
					A.Power_Redefine()
				return
			if(!A || A.z != 7 || A.dead || !A.tourny)
				if(!A)
					player<<"<center><font size=1><font color=#5f9ea0>[B] has won his round because his opponent has left!"
				else
			//		var/lprize = 300 + round(A.level/20)
					player<<"<center><font size=1><font color=#5f9ea0>[B] has eliminated [A]!"
					Entries.Remove(A)
					A.tourny=0
					A<<"For participating in the tournament you are rewarded with 100 levels."
					A.exp += A.tnl * 100
					//A.tp+=1000
				Winners.Add(B)
				Entries.Remove(B)
				B.loc=locate(rand(465,490),rand(25,30),7)
				if(B.level <= 10000)
					B.Power_Redefine()
				return
			else
				sleep(10)
				continue

	NextRound()
		for(var/mob/M in Winners)
			Entries.Add(M)
			M.loc=locate(rand(465,490),rand(25,30),7)
			sleep(10)
			Winners.Remove(M)
		if(Entries.len<2)
			KILLTOURNY()
			return
		player<<"<center><font size=1><font color=#5f9ea0>Tournament News: The next round will now begin!"
		Tournament_AI()
