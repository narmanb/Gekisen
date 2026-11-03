//var/list/GRAV = list (".")
//mob/proc/GRAV_CHECK(T as text,var/list/L)
//	for(var/V in L)
//		if(findtext(T,V))
//			return TRUE
//obj
//	var
//		grav = 0
//		gravon = 0
mob/var
	gravplgained = 0
	gravmaxplgain = 0 //1000000000000
	gravkigained = 0
	gravmaxkigain = 0 //1000000000000

	gravkidefgained = 0
	gravmaxkidefgain = 0 //1000000000000

	gravstrgained = 0
	gravmaxstrgain = 0 //1000000000000
	gravdefgained = 0
	gravmaxdefgain = 0 //1000000000000

	isgravmachine=0
	countgrav=0
	tmp/ingrav=0
//mob/training/Gravity_Room
mob/Gravity_Room
	icon = 'Gravity Well.dmi'
	density = 1
	isgravmachine=1
	var/totalamount = 100
	Gravity_Well_1
		icon_state = "1"
//	Gravity_Well_2
//		icon_state = "2"
	Gravity_Well_3
		icon_state = "3"
	Gravity_Well_4
		icon_state = "4"
	Gravity_Well_5
		icon_state = "5"
	Gravity_Well_6
		icon_state = "6"
	Gravity_Well_7
		icon_state = "7"
	Gravity_Well_8
		icon_state = "8"
	Gravity_Well_9
		icon_state = "9"
	Gravity_Well_10
		icon_state = "10"
		density = 0
		layer = 8
	Gravity_Well_11
		icon_state = "11"
		density = 0
		layer = 8
	Gravity_Well_12
		icon_state = "12"
		density = 0
		layer = 8
	Gravity
		icon_state = "gravity"
		density = 0
		layer = 10

	Gravity_Pull
		icon_state = "gravity pull"
		density = 0
		layer = 10

//	Gravity_Control
	Gravity_Well_2
		icon_state = "2"
		//var/amount = 0
		var/gravity = 0
		verb/Set_Gravity()
			set src in oview(3)
			set category = "Gravity Controls"
			if(usr.talking)
				return
			usr.talking=1
			switch(alert("Turn on the gravity machine? ([src.totalamount]x gravity)","Gravity Training","Turn on the gravity","Turn off the gravity","Cancel"))
				if("Cancel")
					usr.talking = 0
					return

				if("Turn off the gravity")

					view(usr) << output("<b><Font size=1><Font color=green>[usr] <font color = red>turned off<font color = green> the gravity machine","default.output2")
					src.gravity=null
					usr.talking = 0
					for(var/mob/PC/N in oview(30, src))
						N.gravtrain = 0
					return
					//spawn() src.GravityPull()


				if("Turn on the gravity")
					if(src.gravity > 0)
						usr<<output("<b><Font size=1>The gravity machine is already on!","default.output2")
						usr.talking = 0
						return
					usr<<output("<b><Font size=1><Font color=aqua>You set the gravity to: <font color=yellow>[src.totalamount]","default.output2")
					src.gravity=src.totalamount
					usr.talking = 0
					spawn() src.GravityPull()
			//		for(var/mob/M in oview(10))
			//			for(var/turf/Floors/Gravity_Floor/T in oview(M,0))

			//				M<<output("<b><Font size=1><Font color=aqua>[usr] sets the gravity to: <font color=yellow>[amount] [gravity]","default.output2")
		//		for(var/mob/Gravity_Room/Gravity/H in view(src))
		//			H.alpha = 255
//		verb
//			Check_Gravity()
//				set src in oview(3)
//				set category = "Gravity Controls"
//				usr << "\red Gravity is set to: x[round(amount)]"
//				return
		//New()
		//	.=..()
		//	for(var/mob/Gravity_Room/Gravity/G in view(src))
		//		G.alpha = 0
//			spawn(1)
//				GravityPull()


		proc/GravityPull()

			if(!src.gravity)
				return


			//for(var/mob/PC/M in view())
			var/count = 0
			for(var/mob/PC/M in oview(16, src))


			//	if(!M)
			//		world << "No players in range"

			//		src.gravity = 0
			//		return
				//if(M)
				if(M in oview(16, src))
					count++
					/*
					var/randdmg = rand(2,3)
					var/dmgtaken = (M.powerlevel_max / randdmg)/rand(1.5,3)
					if(prob(35))
						dmgtaken = dmgtaken * 0.7
					//var/originalpl = round(M.powerlevel/M.powerlevel_max*100)
					M.powerlevel -= dmgtaken
					*/
					var/dmgtaken = M.powerlevel_max*(src.gravity/2000)
					var/randdmg = rand(1,3)
					if(randdmg == 1)
						dmgtaken = dmgtaken * 0.01
					if(randdmg == 2)
						dmgtaken = dmgtaken * 0.05
					if(randdmg == 3)
						dmgtaken = dmgtaken * 0.11
					M.powerlevel-=dmgtaken
					if(M.staminaleft < M.staminaleft_max)
						if(prob(20))
							M.staminaleft += M.staminaleft_max*0.020
						else
							M.staminaleft += M.staminaleft_max*0.005
						if(M.staminaleft<0)
							M.staminaleft = 0
					M.gravtrain = src.gravity/rand(1300,1800)
			//		world << "<font color = blue><b>M.gravtrain = [M.gravtrain]"

					M<<output("<b><font color=green><font size=1>The (<font color=yellow>x[src.gravity]<font color=green>) gravity drained <font color = yellow>[applycommas(dmgtaken)]<font color = green> of your health!","default.output2")
					var/plcheck = round(M.powerlevel/M.powerlevel_max*100)
					if(plcheck < 25)
						M<<output("<b><font color=red><font size=1>You feel extremely weak from gravity pushing down on you!","default.output2")
							//usr << "[plcheck]"

					if(M.powerlevel<=0)
						//M.DeathCheck(src)
						M.GRAVITYDeath()
				else
					//world << "<font color = yellow>[M] not in range"
					M.gravtrain=0
					//src.gravity = 0
					return
			//world << "<font color = aqua><b>COUNT: [count]"
			if(count==0)
			//	oview() << "<font color = red>NO PLAYER WITHIN RANGE"
				src.gravity = 0
				return

			spawn(75) src.GravityPull()

					//	src.icon_state="gravityoff"





/*
		proc/GravityPull()

			while(src.gravity)


				for(var/mob/PC/M in view())
					if(!M)
						world << "No players in range"

						src.gravity = 0
						break
					if(M)
						/*
						var/randdmg = rand(2,3)
						var/dmgtaken = (M.powerlevel_max / randdmg)/rand(1.5,3)
						if(prob(35))
							dmgtaken = dmgtaken * 0.7
						//var/originalpl = round(M.powerlevel/M.powerlevel_max*100)
						M.powerlevel -= dmgtaken
						*/
						var/dmgtaken = M.powerlevel_max*(src.gravity/1000)
						if(prob(65))
							dmgtaken = dmgtaken * 0.5
						M.powerlevel-=dmgtaken
						if(M.staminaleft < M.staminaleft_max)
							if(prob(20))
								M.staminaleft += M.staminaleft_max*0.08
							else
								M.staminaleft += M.staminaleft_max*0.035
							if(M.staminaleft<0)
								M.staminaleft = 0
						M.gravtrain = src.gravity/rand(500,700)

						M<<output("<b><font color=green><font size=1>The (<font color=yellow>x[src.gravity]<font color=green>) gravity drained [applycommas(dmgtaken)] of your health!","default.output2")





						if(M.powerlevel<=0)
							//M.DeathCheck(src)
							M.GRAVITYDeath()




				//	world << "3"
//				world << "<b>sleep20"
				sleep(rand(30,80))
			//world << "loop broke"


					//	src.icon_state="gravityoff"


*/