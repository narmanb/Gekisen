//mob/var/goku_killed=0
//mob/var/gero_quest=0

mob
	NPC
		Dr_Gero
			name = "Dr. Gero"
			icon = 'NPCs - New.dmi'
			icon_state = "Dr.Gero"
			density = 1
			it_blocked=1
			frozen = 1
			race = "Android"
			karma = "Evil"
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Gero")
					if(usr.race == "Android")
						if(!usr.learn_ssdeadlybomber)
							switch(input("Dr Gero: What do you need [usr]?")in list("Download Skill","Nothing"))
								if("Download Skill")
									if(usr.level >= 40000 && usr.chips >= 5)
										usr << "<font color = white>Downloading the new skill into your system..."
										usr.frozen = 1
										usr.sight |= BLIND
										sleep(50)
										usr.frozen = 0
										usr.sight &= ~BLIND
										usr.contents+=new/obj/Technique/SSDeadlyBomber
										sleep(1)
										usr <<"<font color = white>Skill Download successfull."
										usr.frozen = 0
										usr.learn_ssdeadlybomber=1
										return
									else
										usr << "<font color = white>Error:</font> Hardware not compatible... aka you need level 40k and 5 chips"
										return
								if("Nothing")
									return
					else
						usr << "<font color = white>Dr Gero:</font> You need to be an android to speak to me!"
						return