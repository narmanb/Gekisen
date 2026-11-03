mob/var/z_sword_quest = 0
mob/var/legendarysword = 0
obj/Quests
	Z_Sword_Quest
		name = "The Legendary Z-Sword"
		density = 1
		icon = 'Z-sword.dmi'
		icon_state = "pull out"
		verb
			Pull_Out()
				set category = "Actions"
				set src in oview(1)
				if(usr.doing)
					usr << "You are doing something!"
					return
				if(!usr.z_sword_quest)
					if(usr.karma == "Good")
						if(usr.strength >= 50000000)
							if(usr.inven_min<usr.inven_max)
								if(prob(100))
									usr << "You attempt to pull out the Z Sword...."
									usr.doing=1
									usr.frozen=1
									usr.zanz_lock=1
									sleep(150)
									player << "<font color=#1111ff>[usr] has managed to pull out <u>The Legendary Z Sword</u>!</font>"
									usr.contents += new/obj/Equipment/Z_Sword
									usr.exp += 100000
									usr << "<font color=white>Exp +100,000</font>"
									usr.Level_Up()
									usr.z_sword_quest = 1
									usr.doing=0
									usr.frozen=0
									usr.zanz_lock=0
									return
								else
									usr << "You attempt to pull out the Z Sword...."
									usr.doing=1
									usr.frozen=1
									usr.zanz_lock=1
									sleep(150)
									usr.doing=0
									usr.frozen=0
									usr.zanz_lock=0
									usr << "Despite your best efforts, the Z Sword seems unmovable."
									return
							else
								usr<<"You have no space in your inventory."
								return
						else
							usr << "You need 50.000.000 strength."
							return
					else
						usr << "Only those with a Pure Heart may take the Z-Sword."
						return
				else
					usr << "<font color = white>[usr]:</font> Wait, I already have one."
					return