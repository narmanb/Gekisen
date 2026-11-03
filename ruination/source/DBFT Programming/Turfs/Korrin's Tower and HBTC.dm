
mob
	var
		hbtc_times=0
		hbtc_timer=600
		in_hbtc=0
	proc
		HBTC_Countdown()
			return
			if(src.z==6)
				src.verbs+=new/mob/PC/verb/HBTC_Timer_Check()
				src.hbtc_timer-=1
				if(src.hbtc_timer<=0)
					src.loc=locate(50,295,6)
					src.it_lock=0
					src.it_blocked=0
					src.grav=0
					src.in_hbtc=0
					src.hbtc_timer=800
					src.verbs-=new/mob/PC/verb/HBTC_Timer_Check()
					src<<"Your time in the HBTC has expired."
					return
				spawn(300)src.HBTC_Countdown()
				return
			else
				src.it_lock=0
				src.it_blocked=0
				src.grav=0
				src.in_hbtc=0
				src.hbtc_timer=800

mob
	PC
		verb
			HBTC_Timer_Check()
				set category = "Channels"
				set hidden = 1
				if(src.hbtc_timer>=0)
					var/x=round(src.hbtc_timer/2)
					alert("You have [x] minutes left in the HBTC","HBTC Timer Check")
					return
				else
					usr<<"You are not in the HBTC"
					return
//crim 2.61 made sure gravity is activated on tile entry
turf
	Gravity
	//	Entered(var/mob/PC/M)
	//		if(M.grav)return
	//		for(var/mob/Gravity_Room_Gen_II/G in view(12,M))
	//			G.Gravity(M)

		HBTC
			layer = 999
			Entered(var/mob/PC/M)
				if(istype(M,/mob/PC))
					var/strrand=rand(20,30)
					var/defrand=rand(20,30)
					M.exp+=rand(20,30)
					M.strength+=strrand
					M.strength_max+=strrand
					M.defence+=defrand
					M.defence_max+=defrand
					M.powerlevel-=strrand*3000
					M.staminaleft+=rand(0.5,2)
					M.Level_Up()
					M.GRAVITYDeath()
		SubTC
			Entered(var/mob/PC/M)
				if(istype(M,/mob/PC))
					var/strrand=rand(5,15)
					var/defrand=rand(5,15)
					M.exp+=rand(8,18)
					M.strength+=strrand
					M.strength_max+=strrand
					M.defence+=defrand
					M.defence_max+=defrand
					M.powerlevel-=strrand*5000
					M.staminaleft+=rand(0.5,3)
					M.Level_Up()
					M.GRAVITYDeath()
turf
	Sub_Passages
		SubTC
			Entered(var/mob/PC/M)
				if(istype(M,/mob/PC))
					var/newx=M.x+23
					M.loc=locate(newx,M.y,M.z)
		Enter_SubTC
			Entered(var/mob/PC/M)
				if(istype(M,/mob/PC))
					for(var/turf/Sub_Passages/Leave_SubTC/T in world)
						M.loc=locate(T.x,T.y+1,T.z)
		Leave_SubTC
			Entered(var/mob/PC/M)
				if(istype(M,/mob/PC))
					for(var/turf/Sub_Passages/Enter_SubTC/T in world)
						M.loc=locate(T.x,T.y-1,T.z)
	Passages
		HBTC
			Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
				//		switch(alert("Do you want to enter the HBTC? You will gain +20% stat ticks from training in here. You can also spar with another player, and gain stat ticks that way.","Enter the HBTC?","Yes","No"))
				//			if("No")
				//				return

						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.fused)
							return
						if(M.focus_boxing||M.boxing||M.meditating||M.dualtrain)
							return
					//	if(M.hbtc_times<3)
						M.in_hbtc=0
					//	player << "<font color=#0066ff>Training Information:<font color=white> [M] has entered the Hyper-Bolic Time Chamber!"
						M.loc=locate(243,305,6)
						M.dir = SOUTH
						M.it_lock=1
						M.it_blocked=1
				//		M.safe=1
						M.grav=0
						M.hbtc_times+=1
						M.in_hbtc=1
						M.in_war = 0
						M.challenge = 0
						M.in_tourney = 0

					//	M.hbtc_timer=800
					//	spawn(1)M.HBTC_Countdown()
			Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.focus_boxing||M.boxing||M.meditating||M.dualtrain)
							return
						M.loc=locate(49,296,6)
						M.it_lock=0
						M.it_blocked=0
						M.safe=0
						M.grav=0
						M.in_hbtc=0
					//	M.hbtc_timer=800
					//	M.verbs-=new/mob/PC/verb/HBTC_Timer_Check()
					//if("No")
					//	return
					/*
					switch(	alert("Are you sure you want to leave the HBTC?","Leave HBTC","Yes","No"))
						if("Yes")
							if(istype(M,/mob/PC))
								M.loc=locate(49,296,6)
								M.it_lock=0
								M.it_blocked=0
								M.safe=0
								M.grav=0
								M.in_hbtc=0
							//	M.hbtc_timer=800
							//	M.verbs-=new/mob/PC/verb/HBTC_Timer_Check()
						if("No")
							return
							*/