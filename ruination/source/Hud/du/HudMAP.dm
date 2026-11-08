var/hp=0
var/ki=0
mob/var/tmp/calledexphud = 0
mob/var/tmp/oldpercenth = 0
mob/var/tmp/oldpercentk = 0
mob/var/tmp/oldpercente = 0
/*
mob/verb/updateh()
	src.updateHealth()
	src.updateki()
//	new/obj/expmeters/exp_01(src.client)
//	new/obj/expmeters/exp_02(src.client)
//	new/obj/expmeters/exp_03(src.client)
	src.updateexp()
	*/
mob
	proc
		updateHealth()
			if(!src)return
			//return
		//	world << "[src] called updatehealth"
//			if(!src)return
		///	for(var/obj/hudMeters/o in src.client.screen)
			//	del(o)
	//		new/obj/hudMeters/health_01(src.client)
	//		new/obj/hudMeters/health_02(src.client)
	//		new/obj/hudMeters/health_03(src.client)
	//		new/obj/hudMeters/health_04(src.client)
		//	if(src.powerlevel_max*100 <= 0)
		//		spawn(10) src.updateHealth(
		//		return
			var/percent=round(src.powerlevel/src.powerlevel_max*100,1)
		//	world << "<font color = red>Percent: [percent] Oldpercent [src.oldpercenth]"
			if(percent==src.oldpercenth)
				return
			if(percent>100) percent = 100
			//else if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/hudMeters/o in src.client.screen)
		//		world << "[o.name] [o.icon_state]"
				o.icon_state=num2text(percent)
		//	spawn(10)
		//		if(!src)return
		//		src.updateHealth()
		//		return

		updateki()
			if(!src)return
			//return
	//		return
		//	world << "[src] called updateki"
		//		for(var/obj/kimeters/o in src.client.screen)
		//			del(o)
	//		new/obj/kimeters/ki_01(src.client)
	//		new/obj/kimeters/ki_02(src.client)
	//		new/obj/kimeters/ki_03(src.client)
			var/percent2=round(src.ki/src.ki_max*100,1)
			if(percent2==src.oldpercentk)
			//	src << "old ki percent"
				return
			if(percent2>100) percent2 = 100
		//	else if(percent2<0) percent2=0

			if(percent2<0) percent2=0
			var/p1
			var/p2
			var/p3
			var/p4
			for(var/obj/kimeters/ki_01/o in src.client.screen)
				if(percent2 > 11)
					o.icon_state = "full"
				else
					o.icon_state=num2text(percent2)

			for(var/obj/kimeters/ki_02/p in src.client.screen)
				switch(percent2)
					if(12 to 43)
						p.icon_state=num2text(percent2)
					else
						if(percent2 < 12)
							p.icon_state="empty"
						if(percent2 > 43)
							p.icon_state="full"

			for(var/obj/kimeters/ki_03/q in src.client.screen)
				switch(percent2)
					if(44 to 75)
						q.icon_state=num2text(percent2)
					else
						if(percent2 < 44)
							q.icon_state="empty"
						if(percent2 > 75)
							q.icon_state="full"

			for(var/obj/kimeters/ki_04/r in src.client.screen)
				switch(percent2)
					if(75 to 100)
						r.icon_state=num2text(percent2)
					else
						r.icon_state="empty"

//			spawn(10)
//				if(!src)return
//				src.updateki()
//				return

		updateexp()
			if(!src)return
			if(src.calledlvlup)return
		//	return
		//	if(src.calledexphud)return
		//	src.calledexphud=1
		//	spawn(50) src.calledexphud = 1
		//	world << "[src] called updateexp"
			var/percent3=round(src.exp/src.tnl*100,10)
			if(percent3==src.oldpercente)
			//	src << "old exp percent"
				return
			if(percent3>100) percent3=100

			if(percent3<0) percent3=0
			for(var/obj/expmeters/o in src.client.screen)
				o.icon_state=num2text(percent3)
		//	spawn(10)
		//		if(!src)return
		//		src.updateexp()
		//		return






//screen_loc = "WEST+0:320,NORTH+0:-400"
obj
	hudMeters
		health_01
			icon='Health1.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				//screen_loc="WEST+1,NORTH-1"
				screen_loc="map2:0,0"
				//screen_loc="4,24"
				c.screen+=src
		health_02
			icon='Health2.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:1,0"
				c.screen+=src
		health_03
			icon='Health3.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:2,0"
				c.screen+=src
		health_04
			icon='Health4.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:3,0"
				//screen_loc="7,24"
				c.screen+=src
		trans_health_01
			icon='TransHealth1.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				//screen_loc="4,24"
				screen_loc="map2:0,0"
				c.screen+=src
		trans_health_02
			icon='TransHealth2.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				//screen_loc="5,24"
				screen_loc="map2:1,0"
				c.screen+=src
		trans_health_03
			icon='TransHealth3.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:2,0"
				screen_loc="6,24"
				c.screen+=src
		trans_health_04
			icon='TransHealth4.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:3,0"
			//	screen_loc="7,24"
				c.screen+=src

	kimeters
		ki_01
			icon='KI1.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:0,0"
				//screen_loc="4,24"
				c.screen+=src
		ki_02
			icon='KI2.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:1,0"
				//screen_loc="5,24"
				c.screen+=src
		ki_03
			icon='KI3.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:2,0"
//				screen_loc="6,24"
				c.screen+=src
		ki_04
			icon='KI4.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:3,0"
//				screen_loc="6,24"
				c.screen+=src
		trans_ki_01
			icon='TransKI1.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:0,0"
				//screen_loc="4,24"
				c.screen+=src
		trans_ki_02
			icon='TransKI2.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:1,0"
				//screen_loc="5,24"
				c.screen+=src
		trans_ki_03
			icon='TransKI3.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				//screen_loc="6,24"
				screen_loc="map2:2,0"
				c.screen+=src
	/*	ki_04
			icon='KI4.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="5,16"
				c.screen+=src
*/
	expmeters

		exp_01
			icon='EXP1.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:0,0"

				//screen_loc="4,24"
				c.screen+=src
		exp_02
			icon='EXP2.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:1,0"
				//screen_loc="5,24"
				c.screen+=src
		exp_03
			icon='EXP3.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="map2:2,0"
			//	screen_loc="6,24"
				c.screen+=src
		exp_04
		/*
			icon='EXP4.dmi'
			icon_state="0"
			layer = 100
			New(client/c)
				screen_loc="5,16"
				c.screen+=src*/


obj
//Hud0 is the dragonball icon
	Hud_0
		icon='Health1.dmi'
		icon_state="Sample0"
		screen_loc="3,24"
		New(client/c)
			//screen_loc="NORTH+4,WEST+1"

			screen_loc="3,24"
			c.screen+=src
	Hud_1
		icon='Health1.dmi'
		icon_state="Sample1"
		screen_loc="4,24"
	Hud_2
		icon='Health1.dmi'
		icon_state="Sample2"
		screen_loc="5,24"
	Hud_3
		icon='Health1.dmi'
		icon_state="Sample3"
		screen_loc="6,24"
	Hud_4
		icon='Health1.dmi'
		icon_state="Sample4"
		screen_loc="7,24"
	Trams_Hud_1
		icon='Health1.dmi'
		icon_state="Sample1"
		screen_loc="4,24"
	Trans_Hud_2
		icon='TransHealth1.dmi'
		icon_state="Sample2"
		screen_loc="5,24"
	Trans_Hud_3
		icon='TransHealth1.dmi'
		icon_state="Sample3"
		screen_loc="6,24"
	Trans_Hud_4
		icon='TransHealth1.dmi'
		icon_state="Sample4"
		screen_loc="7,24"

/*
		xealth()
			if(!src)return
			if(src.form_1)
				for(var/obj/hudMeters/o in src.client.screen)
					del(o)
				new/obj/hudMeters/trans_health_01(src.client)
				new/obj/hudMeters/trans_health_02(src.client)
				new/obj/hudMeters/trans_health_03(src.client)
				new/obj/hudMeters/trans_health_04(src.client)
			else
				if(!src)return
				for(var/obj/hudMeters/o in src.client.screen)
					del(o)
				new/obj/hudMeters/health_01(src.client)
				new/obj/hudMeters/health_02(src.client)
				new/obj/hudMeters/health_03(src.client)
				new/obj/hudMeters/health_04(src.client)
		//	if(src.powerlevel_max*100 <= 0)
		//		spawn(10) src.updateHealth()
		//		return
			var/percent=round(src.powerlevel/src.powerlevel_max*100,10)
			if(percent>200) percent = 100
			else if(percent>100) percent=100
			if(percent<0) percent=0
			for(var/obj/hudMeters/o in src.client.screen)
				o.icon_state=num2text(percent)
		//	spawn(10)
		//		if(!src)return
		//		src.updateHealth()
		//		return

		*/