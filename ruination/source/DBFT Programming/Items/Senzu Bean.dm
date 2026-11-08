mob/var/fullness = 0
mob/var/tmp/fulltimeron = 0
mob/proc/Hunger()
	if(src.fullness > 0 && !src.fulltimeron)
		src.fulltimeron=1
	if(src.fullness > 0 && src.fulltimeron)
		src.fullness -= 1
		spawn(50) src.Hunger()
	if(src.fullness <= 0 && src.fulltimeron)
		src.fullness = 0
		src.fulltimeron = 0

	//if(src.fullness > 0 && src.fulltimeron)
	//	src << "return"
	//  	return


obj/Equipment/Consumable
	Senzu
		name = "Senzu Bean"
		icon = 'Senzu Bean.dmi'
		value=500
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
		//		if(usr.kaioken)
		//			usr<<"You can't use a Senzu Bean while in Kaioken"
		//			return
				view(14)<< "<font size = 2><b>[usr] has eaten a: [src.name]."
				usr.fullness+=rand(150,250)
				if(!usr.fulltimeron)
					spawn(-1) usr.Hunger()

				usr.powerlevel = round((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = round((usr.ki_control * usr.ki_max)/100)
				usr.kidefense = round((usr.ki_control * usr.kidefense_max)/100)
				usr.strength = round((usr.ki_control * usr.strength_max)/100)
				usr.defence = round((usr.ki_control * usr.defence_max)/100)
				usr.speed = round((usr.ki_control * usr.speed_max)/100)
				usr.staminaleft = 0
				del(src)
				if(usr.CheckInventory()==TRUE)return
				return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src]</u>."
				usr.inven_min -= 1