mob/verb
	Logout1()
		set hidden = 1
		switch(input("What do you wat to do?","Log Out",text) in list("Cancel","Logout of the Game"))
			if("Cancel")
				return
			if("Logout of the Game")
				if(src.client.key == host)
					src.Shutdown_Server61231()
				else
					src.client.SaveMob()
					src.Logout()
					del(src)
mob/proc/Shutdown_Server61231()
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 10 seconds!"
	sleep(50)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 5 seconds!"
	sleep(10)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 4 seconds!"
	sleep(10)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 3 seconds!"
	sleep(10)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 2 seconds!"
	sleep(10)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down in 1 second!"
	for(var/mob/characters/M in world)
		if(M.client)
			M.client.SaveMob()
			M << "<FONT COLOR = BLUE><I>Character Saved.</I></FONT>"
	sleep(10)
	world << "<B><FONT COLOR = RED><FONT SIZE = 3>World is shutting down now!"
	world.Del()

mob/verb
	OpVerb()
		set name = "Misc Verbs"
		set category = "Other"
		switch(input("What would you want to know about?",null,text) in list ("Mystic Time","GK Plane Time","WK Plane Time","Fix Appearance","Cancel"))
			if("Mystic Time")
				usr << "You have [usr.mystt] minutes before your Mystic training is over!"
			if("GK Plane Time")
				usr << "You have [usr.gkpt] minutes before you land at Grand Kai's Planet!"
			if("WK Plane Time")
				usr << "You have [usr.wkpt] minutes before you land at West Kai's Planet!"
			if("Fix Appearance")
				usr.overlays.Cut()
				usr.underlays.Cut()
				usr.hairrestore()
				usr.skinrestore()
				usr.aurarestore()
				for(var/obj/items/I in worn)
					if(istype(I))
						I.Restore(src)
				if(dead)
					overlays += /obj/halo
				if(majined)
					overlays += 'icons/M.dmi'

mob/verb
	OnOffC()
		set name = "On/Off Commands"
		set category = "Other"
		switch(input("What would you like to turn on or off?","On - Off Commands",text) in list ("Starting Message","Starting Music","For GM/ENF only","Cancel"))
			if("Cancel")
				return
			if("Starting Message")
				if(usr.nstartmsg )
					usr.nstartmsg = 0
					usr << "Starting Message of the Day is enabled"
				else
					usr.nstartmsg = 1
					usr << "Starting Message of the Day is disabled"
			if("Starting Music")
				if(usr.nstartmus )
					usr.nstartmus = 0
					usr << "Starting Music is enabled"
				else
					usr.nstartmus = 1
					world << sound(null)
					usr << "Starting Music is disabled"

			if("For GM/ENF only")
				if(usr.gm  || usr.enf  || usr.key == host || usr.hpwr)
					switch(input("What would you like to turn on or off?","On - Off Commands for GM and ENF",text) in list ("Enemy Kill Messages","Kill Messages","Special Messages","Chat Log Messages","Cancel"))
						if("Cancel")
							return
						if("Kill Messages")
							if(usr.killalert )
								usr.killalert = 0
								usr << "Kill Alert Messages is enabled."
							else
								usr.killalert = 1
								usr << "Kill Alert Messages is disabled."
						if("Enemy Kill Messages")
							if(usr.ekillalert )
								usr.ekillalert = 0
								usr << "Enemy Kill Alert Messages is enabled."
							else
								usr.ekillalert = 1
								usr << "Enemy Kill Alert Messages is disabled."
						if("Special Messages")
							if(usr.key != "GhostAnime" && usr.key != "Vakir" && usr.key != "Aegeta" && usr.key != "Destroy")
								alert("You can't use this!")
								return
							else
								if(usr.gmenfalert )
									usr.gmenfalert = 0
									usr << "GM/ENF Tracker Alert Messages is disabled."
								else
									usr.gmenfalert = 1
									usr << "GM/ENF Tracker Alert Messages is enabled."
						if("Chat Log Messages")
							switch(input("What level do you want Chat Log Messages to be at? The higher the level will also give you messages of the lower ones (eg: L2 will give you both messages of L1 and L2). Your current level is [usr.chatsl]!","Chat Log Message",text) in list("L1 - Say","L2 - Guild","L3 - Telepath", "L0 - Null","Cancel"))
								if("L1 - Say")
									usr.chatsl = 1
									usr << "\green Chat Level set to [usr.chatsl]!"
									return
								if("L2 - Guild")
									usr.chatsl = 2
									usr << "\green Chat Level set to [usr.chatsl]!"
									return
								if("L3 - Telepath")
									usr.chatsl = 3
									usr << "\green Chat Level set to [usr.chatsl]!"
									return
								if("L0 - Null")
									usr.chatsl = 0
									usr << "\green Chat Level set to [usr.chatsl]!"
									return
								if("Cancel")
									return
				else
					alert("You are not a GM or ENF")


mob/verb/IgnoreUnignore(mob/M in players)
	set name = "Ignore/UnIgnore"
	set category = "Other"
	switch(alert("Select an option","IgnoreUnignore","Ignore","UnIgnore"))
		if("Ignore")
			ignore.Add(M)
		if("UnIgnore")
			ignore.Remove(M)
mob/var/list/ignore = list()
mob/verb/CheckIgnore()
	set name = "Check Ignore"
	set desc = "Check to see who you are ignoring"
	set category = "Other"
	for(var/mob/X in world)
		if(X.client)
			if(usr.ignore.Find(X))
				usr << "[X.name]([X.key])"
				usr.ignorecounter += 1
			else if(!ignorecounter)
				usr.ignorecounter = 0
	usr << "Players ignored by you: [ignorecounter]."
	usr.ignorecounter = 0
mob/var/ignorecounter