mob/var/learn_freeze=0
mob
	NPC
		Yajirboe
			name = "Yajirobe"
			icon = 'NPCs - New.dmi'
			icon_state = "Yajirobe"
			safe = 1
			energy_code = 2886323
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Yajirobi")
					if(usr.talking || usr.fused)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					spawn(30)usr.talking=0
					usr.talking=1
					switch(alert("What can I do for you?","","Learn Techniques","Chat","Never Mind"))
						if("Never Mind")
							usr.talking=0
							return
						if("Learn Techniques")
							if(!usr.learn_freeze)
								if(usr.level < 100000000)
									usr.contents += new/obj/Technique/Freeze
									usr.learn_freeze=1
									usr.talking=0
								//	usr << "<font color=#800000><u>Technique Information:</u></font> You have learned<font color=red> Freeze."
									usr << "<center><font color = white>.:: You learn Freeze  ::.</font></center></center>"
									usr << "<font color = white>Yajirobe: </font>Hmph...your enemy will be frozen in time with mah special technique!"
									return
								else
									usr << "<font color = white>Yajirobe: </font>Psh, get out of here before I kick your butt."
									usr.talking=0
									return
							else
								usr << "<font color = white>Yajirobe: </font>Erm? Just use it on someone, but not me."
								usr.talking=0
								return
						if("Chat")
							usr << "<font color = white>Yajirobe: </font>Well, why don't you just buy me something to eat...?"
							sleep(30)
							usr << "<font color = white>Yajirobe: </font>C'mon, hurry up! I'm hungry fool!"
							sleep(30)
							usr << "<font color = white>Yajirobe: </font>That's does it! FREEZE!!!"
							sleep(30)
							usr.talking=0
							usr.GMLocked=1
							spawn(30)usr.GMLocked=0
							return