mob/NPC/Dende
	//icon_state = "Dende"
	name = "Dende"
	icon = 'dende.dmi'
	density = 1
	safe = 1
	frozen = 1
	energy_code = 6574567
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Dende")
		if(usr.manipulated || usr.buff1 || usr.buff2 || usr.buff3 || usr.buff4)
			usr << "<font color = white>Dende:</font> Oh [usr.name], those wounds look bad, let me heal you!"
			sleep(10)
			usr << "<font color = #0066FF>Dende puts his hands on your head and you feel much better!"
			sleep(25)
			usr.powerlevel = usr.powerlevel_max
			usr.ki = usr.ki_max
			usr.strength = usr.strength_max
			usr.defence = usr.defence_max
			usr << "<font color = white>Dende:</font> There, I hope that helps you [usr.name]!"
			usr.BuffReapply()
			src.icon_state = "Dende"
			return
		else
			usr << "<font color = white>Dende:</font> How are you today [usr.name]?"
			return



mob/NPC/TutorialHelper
	icon_state = "Tutorial Helper"
	name = "Newbie"
	density = 1
	safe = 1
	energy_code = 4574167
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		switch(input("Newbie Helper: What do you need?")in list("Read Newbie Guide","Never Mind"))
			if("Never Mind")
				return
			if("Read Newbie Guide")
				sleep(50)
				spawn(1)usr.guidefile()
				winset(usr,"Guide","is-visible=true")
				return




