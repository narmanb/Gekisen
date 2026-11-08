mob/var/kaioken = 0
mob/var/tmp/kaiokenB = 0
mob/var/tmp/kaiokenCD = 0


			//	src.overlays-=src.aura
			//	src.underlays-=src.underlays
			//	src.aura_on = 1
			//	if(src.race == "Saiyan" || src.race == "Half Saiyan")
			//		src.underlays += new/obj/Aura/SSJ_Aura

//var/kaioaura2 = file('[KaiokenNewAura].dmi')
//var/kaioaura2 = obj/Aura/Kaioken_Aura
mob/var/kaioaura = new/obj/Aura/Kaioken_Aura()
obj/Technique/Kaioken

	verb/Kaioken()
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Kaioken")
		if(techs_on==0)
			usr<<"Techniques have currently been disabled"
			return
//		if(usr.dead)
//			usr << "You are dead."
//			return
		if(usr.doing)
			usr << "You are already doing something."
			return
		if(usr.rest)
			usr<<"You must stop resting."
			return
		if(usr.Oozaru)
			usr << "You cannot use kaioken while in Oozaru!"
			return
		if(usr.kaiokenCD)
			usr << "You must wait a bit to use this again!"
			return
	//	if(usr.manipulated||usr.buff1||usr.buff2||usr.buff3||usr.buff4)
	//		usr << "You cannot use kaioken while buffed"
	//		return
	//	if(usr.form_1)
	//		usr << "Your body cannot handle the stress of Kaioken!"
	//		return
//		if(usr.inverted)
//			usr << "Your body cannot handle the stress of Kaioken!"
//			return
		if(usr.powering||usr.powered)
			usr << "You cannot do this while powering up or recovering from powering up!"
			return
		var/kaioken_limit = 20
		/*
		if(usr.race == "Bio Android" || usr.race == "Namekian" || usr.race == "Majin" || usr.race == "Tuffle")
			kaioken_limit = 100
		if(usr.race == "Dragon")
			kaioken_limit = 150
		if(usr.race == "Human")
			if(usr.gene == "Bloodthirsty")
				kaioken_limit = 200
		if(usr.race == "Kai"||usr.race == "Majin Wizard")
			kaioken_limit = 250
		*/
		/*
		if(usr.race == "Kai")
			if(usr.gene == "Pure Blooded")
				kaioken_limit = 30
		if(usr.race == "Majin Wizard")
			kaioken_limit=30\
			*/
	//	if(usr.race == "Namekian")
	//		kaioken_limit = 30
//		if(usr.staminaleft_max >= 1800)
//			kaioken_limit = 50

	//	var/kaiopotential = usr.staminaleft_max
		switch(usr.staminaleft_max)
			if(600 to 800)
				kaioken_limit = 5
			if(1000 to 1100)
				kaioken_limit = 10
			if(1200 to 1300)
				kaioken_limit = 11
			if(1400 to 1500)
				kaioken_limit = 12
			if(1600 to 1700)
				kaioken_limit = 13
			if(1800 to 1900)
				kaioken_limit = 14
			if(2000)
				kaioken_limit = 15
			if(2100 to 2200)
				kaioken_limit = 16
			if(2300 to 2400)
				kaioken_limit = 17
			if(2500 to 2600)
				kaioken_limit = 18
			if(2700 to 2800)
				kaioken_limit = 19
			if(2900 to 3000)
				kaioken_limit = 20
/*
			if(600 to 800)
				kaioken_limit = 10
			if(1000 to 1100)
				kaioken_limit = 11
			if(1200 to 1300)
				kaioken_limit = 12
			if(1400 to 1500)
				kaioken_limit = 13
			if(1600 to 1700)
				kaioken_limit = 15
			if(1800 to 1900)
				kaioken_limit = 17
			if(2000)
				kaioken_limit = 18
			if(2100 to 3000)
				kaioken_limit = 20
				*/
		if(usr.kaioken)
			usr << "You relax your Kaioken state"
			usr.kaioken = 0
			usr.overlays -= usr.kaioaura
			usr.doing = 0
			usr.kaiokenCD = 1
			spawn(200) usr.kaiokenCD = 0
			//usr.Power_Redefine()
			usr.powerdown(25)
			return

		var/plcheck = round(usr.powerlevel/usr.powerlevel_max*100)
		if(plcheck < 40)
			usr << "You must be at least 50% of your powerlevel to use kaioken!"
			//usr << "[plcheck]"
			return


		//var/kaioken_bonus = input("What is the level of your Kaioken? ([kaioken_limit] is Max)") as num | null
		var/kaioken_bonus = kaioken_limit
		if(usr.doing)
			usr << "You are busy doing something!"
			return
		if(usr.Oozaru)
			usr << "You cannot use kaioken while in Oozaru!"
			return
		usr.doing = 1
		if(!kaioken_bonus && usr.kaioken)
			usr << "You relax your Kaioken state"
			usr.kaioken = 0
			usr.overlays -= usr.kaioaura
			usr.doing = 0
			usr.kaiokenCD = 1
			spawn(200) usr.kaiokenCD = 0
			//usr.Power_Redefine()
			usr.powerdown(25)
			return
		if(!kaioken_bonus && !usr.kaioken)
			usr.doing = 0
			return

		if(usr.kaioken)
			usr << "You are already using Kaioken. Reset it by Entering 0"
			usr.doing = 0
			return
		if(kaioken_bonus < 0)
			usr << "You cannot enter a negative value!"
			usr.doing = 0
			return
		if(kaioken_bonus > kaioken_limit)
			if(prob(kaioken_bonus-kaioken_limit))
				view(8) << "<font color = red>[usr] collapses from the strain of Kaioken!"
				usr.kaioken = 0
				usr.overlays -= usr.kaioaura
				usr.doing = 0
				usr.sight |= BLIND
				//usr.Power_Redefine()

				usr.powerdown(1)
				sleep(90)
				usr.sight &= ~BLIND
				return

///		if(usr.form_1)
	//		usr << "Your body cannot handle the stress of Kaioken!"
	//		return
	//	if(usr.inverted)
	//		usr << "Your body cannot handle the stress of Kaioken!"
	//		return
		if(usr.powering||usr.powered)
			usr << "You cannot do this while powering up or recovering from powering up!"
			return
		var/currentmax = (usr.powerlevel_max*usr.ki_control)/100
		if(kaioken_bonus >= kaioken_limit)
			usr.icon_state = "enrage"
			usr.frozen = 1
			usr.doing = 1
			usr.kaioken = 1
			usr.kaiokenB = round(kaioken_bonus/4.3)
			view(8) << "<B><font color = white>[usr]:</font> \red Super Kaioken times [kaioken_bonus]!"
			sleep(20)
			usr.icon_state = ""
			usr.frozen = 0
			usr.doing = 0

			usr.powerlevel += (rand(300,600)+(currentmax * (kaioken_bonus / 15)))
			usr.ki += (rand(300,600)+(usr.ki_max * (kaioken_bonus / 15)))
			usr.overlays += usr.kaioaura

			usr.strength += (rand(300,600)+(usr.strength_max * (kaioken_bonus / 15)))
			usr.defence += (rand(300,600)+(usr.defence_max * (kaioken_bonus / 15)))
			if(usr.hudenabled)
				spawn() usr.updateHealth()
				spawn() usr.updateki()
			usr.Kaio_Strain()
		else
			if(kaioken_bonus >= 1)
				usr.icon_state = "enrage"
				usr.frozen = 1
				usr.doing = 1
				usr.kaioken = 1
				usr.kaiokenB = round(kaioken_bonus/2.6)
				view(8) << "<B><font color = white>[usr]:</font> \red Kaioken times [kaioken_bonus]!"
				sleep(15)
				usr.icon_state = ""
				usr.frozen = 0
				usr.doing = 0
				usr.powerlevel += (rand(300,600)+(currentmax * (kaioken_bonus / 16)))
				usr.ki += (rand(300,600)+(usr.ki_max * (kaioken_bonus / 16)))
				usr.overlays += usr.kaioaura

				usr.strength += (rand(300,600)+(usr.strength_max * (kaioken_bonus / 16)))
				usr.defence += (rand(300,600)+(usr.defence_max * (kaioken_bonus / 16)))
				if(usr.hudenabled)
					spawn() usr.updateHealth()
					spawn() usr.updateki()
				usr.Kaio_Strain()
			return
mob/proc/Kaio_Strain()
	if(src.staminaleft > src.staminaleft_max)
		src.staminaleft = src.staminaleft_max
	if(!src.kaioken)
		src.kaioken = 0
		src.kaiokenB = 0
		return
	else

		src.staminaleft += rand(3,src.kaiokenB*rand(1,3)) + rand(0,11)
		if(src.staminaleft+210 >= src.staminaleft_max)
			src << output("<font size = 1><b><font color = red>Kaioken Strain, Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")

		if(src.staminaleft >= src.staminaleft_max)
			view(8) << "<font size = -1><B><font color = red>[src]'s collapses from the strain of Kaioken!"
			src.overlays -= usr.kaioaura
			src.kaioken = 0
			src.kaiokenB = 0
			usr.kaiokenCD = 1
			spawn(1000) usr.kaiokenCD = 0
			src.KO=1
			src.frozen=1
			src.doing=1
			src.sight |= BLIND
			src.powerdown(5)
			//src.Power_Redefine()
			sleep(300)
			src.KO=0
			src.frozen=0
			src.doing=0
			src.sight &= ~BLIND
		else
			spawn(rand(11,28))src.Kaio_Strain()