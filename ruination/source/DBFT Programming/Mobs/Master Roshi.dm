mob/var/roshi_quest_start = 0
mob/var/roshi_quest_complete = 0
mob/var/got_rock = 0

mob
	NPC
		Master_Roshi
			name = "Master Roshi"
			//icon = 'NPCs - New.dmi'
			//icon_state="Master Roshi"
			icon = 'roshi.dmi'
			density = 1
			safe = 1
			frozen = 1
			energy_code = 9987654
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Roshi")
					var/quote = rand(1,4)
					if(quote == 1)
						usr << "<font color = white><font color = white><BIG>\icon[src]</BIG>Master Roshi: Do your legs hurt? Cause you've been running all through my dreams!</font> "



					if(quote == 2)
						usr << "<font color = white><font color = white><BIG>\icon[src]</BIG>Master Roshi: In an ancient time, Earth was nearly destroyed. Not by man, but by Gods from the sky."
					if(quote == 3)
						usr << "<font color = white><font color = white><BIG>\icon[src]</BIG>Master Roshi: Well, I'm like a turtle and you're part fish, so what do you say you and me go inside and learn more about our species?</font> "


					if(quote == 4)
						usr << "<font color = white><BIG>\icon[src]</BIG> Master Roshi:</font> Hi [usr.name]. I'm naturally bald!"


					return
					if(!usr.roshi_quest_start)
						if(usr.level >= 20000)
							usr << "<font color = white>Master Roshi:</font> Hi [usr.name]. I have an intersting skill to teach if you."
							sleep(15)
							switch(alert("You want to learn the Kamehameha Wave?","","Yes","No"))
								if("Yes")
									usr.roshi_quest_start=1
									usr<<"<font color = white>Master Roshi:</font> I have hidden a rock somewhere around this island. Find it and I'll teach you a powerfull technique!"
									usr << "<font color = white>Master Roshi:</font> Good to Hear! I'll need you to find this Rock i'll throw somewhere in the world!"
								else
									usr << "<font color = white>Master Roshi:</font> When you change your mind come see me."
									return
						else
							usr << "<font color = white>Master Roshi:</font> You're strong, but I know you can become stronger. Come see me later."
					else
						if(!usr.roshi_quest_complete)
							if(usr.got_rock)
								usr << "<font color = white>Master Roshi:</font> Good work [usr.name]!"
								usr<<"<center>You have learned \blue Kamehameha"
								usr.roshi_quest_complete = 1
								usr.contents+=new/obj/Technique/Kamehameha
								usr.exp += 20000
								usr.Level_Up()
							else
								usr << "<font color = white>Master Roshi:</font> You haven't found the rock yet!"
								return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Roshi"
						else
							return