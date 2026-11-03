obj/Quests
	Demon_Blade_Quest
		name = "The Demonic Blade"
		density = 1
		icon = 'Demon Blade.dmi'
		icon_state = "pull out"
		verb
			Pull_Out()
				set category = "Actions"
				set src in oview(1)
				if(usr.doing)
					usr << "You are doing something!"
					return
				if(usr.d_blade_quest == 0)
					if(usr.karma == "Evil")
						if(usr.inven_min<usr.inven_max)
							var/chance = 100
							if(prob(chance))
								usr << "You attempt to pull out the Demon Blade...."
								usr.doing=1
								usr.frozen=1
								usr.zanz_lock=1
								sleep(150)
								player << "<font color=#990000>[usr] has managed to pull out <u>The Dreadful Demon Blade</u>!</font>"
								usr.contents += new/obj/Equipment/Demon_Blade
								usr.exp += 100000
								usr << "<font color=white>Exp +100,000</font>"
								usr.Level_Up()
								usr.d_blade_quest = 1
								usr.doing=0
								usr.frozen=0
								usr.zanz_lock=0
								return
							else
								usr << "You attempt to pull out the Demon Blade...."
								usr.doing=1
								usr.frozen=1
								usr.zanz_lock=1
								sleep(150)
								usr.doing=0
								usr.frozen=0
								usr.zanz_lock=0
								usr << "Despite your best efforts, the Demon Blade seems unmovable."
								return
						else
							usr << "You do not have anymore space in your inventory."
							return
					else
						usr << "Only users Pure Evil entities may possess the power of the Demonic Blade."
						return
				else
					usr << "<font color = white>[usr]:</font> Wait, I already have one."
					return