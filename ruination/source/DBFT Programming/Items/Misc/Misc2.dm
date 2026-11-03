

/*obj/Equipment/Consumable

	Water
		name = "Bottle of Water"
		icon = 'Misc.dmi'
		icon_state = "Water"
		density = 0

		value = 50
		equiped = 0

		condition = 1
		condition_max = 1

		Click()
			if(src in usr:contents)
				usr.ki += usr.ki_max / 25
				usr.fatigue -= 20

				if(usr.ki > usr.ki_max)
					usr.ki = usr.ki_max

				if(usr.fatigue < 0)
					usr.fatigue = 0

				usr.inven_min -= 1
				del(src)
				return

		verb

			Examine()
				set category = null
				var/examine_water = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Bottle of Water</font></td>  </tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>    <td width=174 height=12><font face=Tahoma size=1>Restore Ki by 25%</font></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr>    <td width=273 colspan=2 height=48><font face=Tahoma size=1>Simple bottle of Water. Drinking it will help restore the Energy of whomever drinks it.</font></td>  </tr></table>"
				usr << browse(examine_water,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr << "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr << "No more room for items."
				else
					usr << "You are unable to pick up the: <u>[src.name]</u>."

			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."

	Lemonade
		name = "Bottle of Lemonade"
		icon = 'Misc.dmi'
		icon_state = "Lemonade"
		density = 0

		value = 100
		equiped = 0

		condition = 1
		condition_max = 1

		Click()
			if(src in usr:contents)
				usr.ki += usr.ki_max / 50
				usr.fatigue -= 45

				if(usr.ki > usr.ki_max)
					usr.ki = usr.ki_max
					.
				if(usr.fatigue < 0)
					usr.fatigue = 0

				usr.inven_min -= 1
				del(src)
				return

		verb

			Examine()
				set category = null
				var/examine_lemonade = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Bottle of Lemonade</font></td>  </tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>    <td width=174 height=12><font face=Tahoma size=1>Restore Ki by 50%</font></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr>    <td width=273 colspan=2 height=48><font face=Tahoma size=1>Simple bottle of Lemonade. Drinking it will help restore the Energy of whomever drinks it.</font></td>  </tr></table>"
				usr << browse(examine_lemonade,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr << "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr << "No more room for items."
				else
					usr << "You are unable to pick up the: <u>[src.name]</u>."

			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."

	Hotdog
		name = "Hotdog"
		icon = 'Misc.dmi'
		icon_state = "Hotdog"
		density = 0

		value = 75
		equiped = 0

		condition = 1
		condition_max = 1

		Click()
			if(src in usr:contents)
				usr.powerlevel += usr.powerlevel_max / 50
				usr.fatigue -= 50

				if(usr.powerlevel > usr.powerlevel_max)
					usr.powerlevel = usr.powerlevel_max

				if(usr.fatigue < 0)
					usr.fatigue = 0

				usr.inven_min -= 1
				del(src)
				return

		verb

			Examine()
				set category = null
				var/examine_hotdog = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr>    <td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Hotdog</font></td>  </tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>    <td width=174 height=12><font face=Tahoma size=1>Restore PL by 50%</font></td>  </tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48><font face=Tahoma size=1>A commonly found and very easy to make food. The hotdog, when consumed, will help to restore some Powerlevel.</font></td>  </tr></table>"
				usr << browse(examine_hotdog,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr << "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr << "No more room for items."
				else
					usr << "You are unable to pick up the: <u>[src.name]</u>."

			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."

	Apple
		name = "Apple"
		icon = 'Misc.dmi'
		icon_state = "Apple"
		density = 0

		value = 12
		equiped = 0

		condition = 1
		condition_max = 1

		Click()
			if(src in usr:contents)
				usr.powerlevel += usr.powerlevel_max / 15
				usr.fatigue -= 15

				if(usr.powerlevel > usr.powerlevel_max)
					usr.powerlevel = usr.powerlevel_max

				if(usr.fatigue < 0)
					usr.fatigue = 0

				usr.inven_min -= 1
				del(src)
				return

		verb

			Examine()
				set category = null
				var/examine_apple = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr>    <td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Apple</font></td>  </tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>    <td width=174 height=12><font face=Tahoma size=1>Restore PL by 15%</font></td>  </tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48><font face=Tahoma size=1>A commonly found and fruit that grows on certain trees. Apple's, when consumed, will help to restore some Powerlevel.</font></td>  </tr></table>"
				usr << browse(examine_apple,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr << "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr << "No more room for items."
				else
					usr << "You are unable to pick up the: <u>[src.name]</u>."

			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."

*/

mob/System/Admin/Verbs/Doomsday/verb
	Update_Server(f as file)
		set category = "Admin"
		player<<"<font color=red>World Shutdown enabled. Saving Characters."
		for(var/mob/PC/M in player)
			if(!M.loggedin)continue
			M.client.SaveChar()
			sleep(1)
		player<<"<font color=red>Characters Saved! World Shutdown in 30 seconds."
		AdminMessage("[usr] has innitiated the world shutdown.")
		sleep(100)
		player<<"<font color=red>World Shutdown in 20 seconds."
		sleep(100)
		player<<"<font color=red>World Shutdown in 10 seconds."
		cantsaveatall=1
		sleep(100)
		player<<"<font color=red>Shutdown."
		fdel("Dragonball Ruination.dmb")
		fcopy(f,"Dragonball Ruination.dmb")
		world.Reboot()


	Delete_file()
		set category = "Admin"
		var/list/file_list = flist("world save files/")
		file_list.Add("Cancel")
		var/file_chosen=input("Which file would you like to delete??","Delete File") in file_list
		if(file_chosen == "Cancel")
			return
		if(file_chosen == "Edit Use/")
			var/list/edit_list = flist("world save files/Edit Use/")
			edit_list.Add("Cancel")
			if(edit_list == "Cancel")
				return
			else
				var/edit_chosen=input("Which file would you like to Delete??","Delete File") in edit_list
				fdel("world save files/Edit Use/[edit_chosen]")
				return
		if(file_chosen == "Login Log/")
			var/list/login_list = flist("world save files/Login Log/")
			login_list.Add("Cancel")
			if(login_list == "Cancel")
				return
			else
				var/login_chosen=input("Which file would you like to Delete??","Delete File") in login_list
				fdel("world save files/Edit Use/[login_chosen]")
				return
		else
			fdel("world save files/[file_chosen]")
			usr << "<b>You have Deleted [file_chosen], you will need to reboot for any changes to take effect!</b>"
			return


mob/proc/Doomsday()
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))
		src.verbs+=X
	for(var/X in typesof(/mob/System/Admin/Verbs/Doomsday/verb))
		src.verbs+=X
	src.GMLevel = 100




obj/Equipment/Consumable

	Hetap
		name = "Bottle of Hetap"
		icon = 'Hetap.dmi'
		icon_state = "hetap"
		density = 0

		value = 10000000
		equiped = 0

		condition = 1
		condition_max = 1

		Click()
			if(src in usr:contents)
				if(usr.fullness > 0)
					usr << "You are too full to eat another senzu bean!"
					return
				if(usr.regen_dead)
					usr<<"You can't eat this at the moment."
					return
				if(usr.KO)
					return
				if(usr.in_tourney)
					usr << "You can't use a senzu bean while in a tournament"
					return

				view(14)<< "<font size = 2><b>[usr] has drank a bottle of Hetap!"
				usr.fullness+=rand(500,650)
				if(!usr.fulltimeron)
					spawn(-1) usr.Hunger()

				usr.powerlevel = round((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = round((usr.ki_control * usr.ki_max)/100)
			//	usr.kidefense = round((usr.ki_control * usr.kidefense_max)/100)
				usr.strength = round((usr.ki_control * usr.strength_max)/100)
				usr.defence = round((usr.ki_control * usr.defence_max)/100)
				usr.speed = round((usr.ki_control * usr.speed_max)/100)
				usr.powerlevel = usr.powerlevel + ((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = usr.ki + ((usr.ki_control * usr.ki_max)/100)
				usr.strength = usr.strength + ((usr.ki_control * usr.strength_max)/100)
				usr.defence = usr.defence + ((usr.ki_control * usr.defence_max)/100)
				usr.staminaleft = 0
				del(src)
				if(usr.CheckInventory()==TRUE)return
				return
		verb

	//		Examine()
	//	39		set category = null
	//			var/examine_water = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Bottle of Water</font></td>  </tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td>    <td width=174 height=12><font face=Tahoma size=1>Restore Ki by 25%</font></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr>    <td width=273 colspan=2 height=48><font face=Tahoma size=1>Simple bottle of Water. Drinking it will help restore the Energy of whomever drinks it.</font></td>  </tr></table>"
	//			usr << browse(examine_water,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr << "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr << "No more room for items."
				else
					usr << "You are unable to pick up the: <u>[src.name]</u>."

			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
				usr.inven_min -= 1




mob/proc/HetapSickness(var/Level)
	//spawn(100)
	while(src&&Level>1)
		//src<<"OSHIT!"
		client.dir=pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST,NORTHEAST,NORTHWEST)
		var/randcolor = pick("Invert", "BGR", "Greyscale", "Polaroid", "GRB", "RBG", "BRG", "GBR")
		var/ColorMatrix/c = new("[randcolor]")
		var/sleeptime = rand(10,20)
		src << "[randcolor]"
		animate(src.client, color = c.matrix, time = 1)
		spawn(sleeptime-5) animate(src.client, color = null, time = 5)
		sleep(sleeptime)
		Level--
		if(client.dir==NORTH) return
	client.dir=NORTH
	src << "DONE WITH THE SICKNESS"
/*
mob/verb/HetapTest()
	var/num = input("sickness cycles?") as num
	spawn() src.HetapSickness(num)
	*/