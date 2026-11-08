mob/var/tmp/canrespawn=1
mob/proc/respawnfunction(n as num)
	src.canrespawn=0
	spawn(n)
		src.canrespawn=1
		//src << "test"
		if(src.dead)
			src << "<i>You can now talk to King Yemma and be revived"


turf/SnakeWay/King_Yama
	icon = 'King Yama.dmi'
	name = "King Yema"
	verb/Talk()
		set src in oview(12)
		set category = "Actions"
		/*
		usr << "<font color = white>King Yema:</font> Off you go to Snake Way to meet King Kai!"
		var/random= rand(1,4)
		if(random==1)
			usr.loc = locate(257,440,7)
		if(random==2)
			usr.loc = locate(275,356,7)
		if(random==3)
			usr.loc = locate(395,379,7)
		if(random==4)
			usr.loc = locate(347,400,7)

		*/
		if(usr.focus_boxing||usr.boxing||usr.meditating||usr.train)
			usr << "Stop training before you talk to Yemma!"
			return
		if(!usr.canrespawn)
			usr << "<font color = white><b>King Yemma:</white> You must wait a few minutes before I can send you back."
			return
		usr.talking=0
		usr << "<font color = white><b>King Yemma:</white> I see you are ready to go, let me revive you."
	//	usr.powerlevel = usr.powerlevel_max
		usr.powerlevel = round((usr.powerlevel_max*usr.ki_control)/100)

		usr.ki = round((usr.ki_max*usr.ki_control)/100)

	//	if(usr.kidefense >= ((usr.ki_control * usr.kidefense_max)/100)*0.9)
	//		usr.kidefense = round((usr.kidefense_max*usr.ki_control)/100)

//		if(usr.strength >= ((usr.ki_control * usr.strength_max)/100)*0.9)
		usr.strength = round((usr.strength_max*usr.ki_control)/100)

//				if(usr.defence >= ((usr.ki_control * usr.defence_max)/100)*0.9)
		usr.defence = round((usr.defence_max*usr.ki_control)/100)
		usr.overlays -= 'Halo.dmi'
		usr.overlays -= 'Halo.dmi'
		usr.overlays -= 'Halo.dmi'
		usr.in_tourney = 0
		usr.buku = 0
		usr.density = 1
		usr.doing = 0
		usr.move_delay = 0.8
		usr.icon_state = ""
		/*switch(usr.spawn_point)
			if("Babidi")
				usr.loc = locate(376,245,1)
			if("Yamcha")
				usr.loc = locate(393,117,1)
			if("Frieza")
				usr.loc = locate(247,32,2)
			if("Goku")
				usr.loc = locate(125,50,1)
			if("Guru")
				usr.loc = locate(57,167,2)
			if("Hercule")
				usr.loc = locate(50,165,1)
			if("Roshi")
				usr.loc = locate(179,25,1)
			if("Piccolo")
				usr.loc = locate(304,182,2)
			if("Tien")
				usr.loc = locate(206,244,1)
			if("Vegeta")
				usr.loc = locate(215,144,1)
			if("Yardrat")
				usr.loc = locate(95,105,4)*/
	//	usr.loc = locate(rand(400,420),rand(250,260),7)
		if(!usr.in_budo)
			usr.loc = locate(rand(390,402),rand(244,263),7)
			usr.safe = 1
		else
			usr.loc=locate(rand(370,390),rand(34,41),7)
//		usr.loc = locate(rand(390,402),rand(244,263),7)

		usr.dead = 0
		spawn(50)
			if(!usr)return
			usr.safe = 0
	KingYama1
		icon_state = "1"
		density = 0
		layer = 5
	KingYama2
		icon_state = "2"
		density = 0
		layer = 5
	KingYama3
		icon_state = "3"
		density = 0
		layer = 5
	KingYama4
		icon_state = "4"
		density = 0
		layer = 5
	KingYama5
		icon_state = "5"
		density = 0
		layer = 5
	KingYama6
		icon_state = "6"
		density = 0
		layer = 5
	KingYama7
		icon_state = "7"
		density = 0
		layer = 5
	KingYama8
		icon_state = "8"
		density = 0
		layer = 5
	KingYama9
		icon_state = "9"
		density = 0
		layer = 5
	KingYama10
		icon_state = "10"
		density = 0
		layer = 5
	KingYama11
		icon_state = "11"
		density = 0
		layer = 5
	KingYama12
		icon_state = "12"
		density = 0
		layer = 5
	KingYama13
		icon_state = "13"
		density = 0
		layer = 5
	KingYama14
		icon_state = "14"
		density = 0
		layer = 5
	KingYama15
		icon_state = "15"
		density = 0
		layer = 5
	KingYama16
		icon_state = "16"
		density = 0
		layer = 5
	KingYama17
		icon_state = "17"
		density = 1
	KingYama18
		icon_state = "18"
		density = 1
	KingYama19
		icon_state = "19"
		density = 1
	KingYama20
		icon_state = "20"
		density = 1
	KingYama21
		icon_state = "21"
		density = 1