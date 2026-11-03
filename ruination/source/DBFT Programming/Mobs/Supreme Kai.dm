mob/NPC
	Supreme_Kai
		name = "Supreme Kai"
		icon = 'NPCs - New.dmi'
		icon_state = "Supreme Kai"
		density = 1
		safe = 1
		frozen = 1
		ITflag = 1
		energy_code = 3317954
		New()
			src.CreateName()
		verb/Talk()
			set src in oview(3)
			set category = null
			switch(input("What do you need [usr.name]?","")in list("I want to go to King Kai's","Never Mind"))
				if("Never Mind")
					return
				if("I want to go to King Kai's")
					usr.loc = locate(50,452,6)