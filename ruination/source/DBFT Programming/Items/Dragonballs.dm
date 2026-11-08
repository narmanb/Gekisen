mob/proc/CheckInventory()
	var/count = 0
	for(var/obj/Equipment/E in src)
		count ++
	for(var/obj/Gym/G in src)
		count ++
	for(var/obj/Props/Furnature/GF in src)
		count ++
	for(var/obj/S in contents)
		if(S.value)
			src.sellable_items++
	src.inven_min = count
	if(src.inven_min>=src.inven_max)
		src<<"You have no more space in your inventory."
		return TRUE
obj/Earth_Dragonballs
	dball=1
	layer=MOB_LAYER-1
	Earth_Dragonball_1
		name = "Earth Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "1"
		density = 0
		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You cannot pick up this!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_1 = 0
				usr.inven_min -= 1
	Earth_Dragonball_2
		name = "Earth Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_2 = 0
				usr.inven_min -= 1
	Earth_Dragonball_3
		name = "Earth Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_3 = 0
				usr.inven_min -= 1
	Earth_Dragonball_4
		name = "Earth Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "4"
		density = 0
		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_4 = 0
				usr.inven_min -= 1
	Earth_Dragonball_5
		name = "Earth Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_5 = 0
				usr.inven_min -= 1
	Earth_Dragonball_6
		name = "Earth Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_6 = 0
				usr.inven_min -= 1
	Earth_Dragonball_7
		name = "Earth Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "7"
		density = 0

		verb
			Summon_Dragon()
				set category = null
			//	if(usr.wishes < 7)
				if(usr.e_db_1 && usr.e_db_2 && usr.e_db_3 && usr.e_db_4 && usr.e_db_5 && usr.e_db_6 && usr.e_db_7)
					usr.Summon_Dragon("Shenron")
				else
					usr<<"You need to have all 7 dragonballs to summon the dragon"
//				else
//					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.e_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.e_db_7 = 0
				usr.inven_min -= 1

obj/Namek_Dragonballs
	dball=1
	layer=MOB_LAYER
	Namek_Dragonball_1
		name = "Namekian Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "n1"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_1 = 0
				usr.inven_min -= 1
	Namek_Dragonball_2
		name = "Namekian Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "n2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_2 = 0
				usr.inven_min -= 1
	Namek_Dragonball_3
		name = "Namekian Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "n3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_3 = 0
				usr.inven_min -= 1
	Namek_Dragonball_4
		name = "Namekian Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "n4"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_4 = 0
				usr.inven_min -= 1
	Namek_Dragonball_5
		name = "Namekian Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "n5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_5 = 0
				usr.inven_min -= 1
	Namek_Dragonball_6
		name = "Namekian Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "n6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_6 = 0
				usr.inven_min -= 1
	Namek_Dragonball_7
		name = "Namekian Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "n7"
		density = 0
		verb
			Summon_Dragon()
				set category = null
				if(usr.nwishes < 3)
					if(usr.n_db_1 && usr.n_db_2 && usr.n_db_3 && usr.n_db_4 && usr.n_db_5 && usr.n_db_6 && usr.n_db_7)
						usr.Summon_Dragon("Porunga")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.n_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.n_db_7 = 0
				usr.inven_min -= 1
obj/Black_Dragonballs
	dball=1
	layer=MOB_LAYER
	Black_Dragonball_1
		name = "Black Star Dragonball 1"
		icon = 'dragonball.dmi'
		icon_state = "b1"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_1 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_1 = 0
				usr.inven_min -= 1
	Black_Dragonball_2
		name = "Black Star Dragonball 2"
		icon = 'dragonball.dmi'
		icon_state = "b2"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_2 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_2 = 0
				usr.inven_min -= 1
	Black_Dragonball_3
		name = "Black Star Dragonball 3"
		icon = 'dragonball.dmi'
		icon_state = "b3"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_3 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_3 = 0
				usr.inven_min -= 1
	Black_Dragonball_4
		name = "Black Star Dragonball 4"
		icon = 'dragonball.dmi'
		icon_state = "b4"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_4 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_4 = 0
				usr.inven_min -= 1
	Black_Dragonball_5
		name = "Black Star Dragonball 5"
		icon = 'dragonball.dmi'
		icon_state = "b5"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_5 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_5 = 0
				usr.inven_min -= 1
	Black_Dragonball_6
		name = "Black Star Dragonball 6"
		icon = 'dragonball.dmi'
		icon_state = "b6"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_6 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_6 = 0
				usr.inven_min -= 1
	Black_Dragonball_7
		name = "Black Star Dragonball 7"
		icon = 'dragonball.dmi'
		icon_state = "b7"
		density = 0

		verb
			Summon_Dragon()
				set category = null
				if(usr.bwishes < 1)
					if(usr.b_db_1 && usr.b_db_2 && usr.b_db_3 && usr.b_db_4 && usr.b_db_5 && usr.b_db_6 && usr.b_db_7)
						usr.Summon_Dragon("Black Shenron")
					else
						usr<<"You need to have all 7 dragonballs to summon the dragon"
				else
					usr<<"You have already used up all of your wishes"
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.pk&&!usr.dead)
					if(Move(usr))
						usr << "You pick up the [src]"
						usr.b_db_7 = 1
						usr.inven_min += 1
					else
						usr << "You cannot pick up the [src]"
						return
				else
					usr << "You are not a Combatant!"
					return
			Drop()
				set category = null
				src.loc = usr.loc
				usr << "You drop the [src]"
				usr.b_db_7 = 0
				usr.inven_min -= 1
world
	proc
		Earth_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Earth_Dragonballs))
						return
				player<<"<center><font color=yellow>Earth Dragonballs have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,500),rand(1,500),1)
						if(T.dbable)
							new/obj/Earth_Dragonballs/Earth_Dragonball_7(T)
							db7=1
							break
		Namek_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Namek_Dragonballs))
						return
				player<<"<center><font color=yellow>Namekian Dragonballs have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,500),rand(1,500),2)
						if(T.dbable)
							new/obj/Namek_Dragonballs/Namek_Dragonball_7(T)
							db7=1
							break
		Black_Dragonball_Spawn(S=1)
			set background=1
			sleep(0)
			spawn(1)
				sleep(S)
				for(var/obj/O in world)
					if(istype(O,/obj/Black_Dragonballs))
						return
				player<<"<center><font color=yellow>The <font color =gray>Black Star Dragonballs</font> have been scattered!"
				var/db1=0
				var/db2=0
				var/db3=0
				var/db4=0
				var/db5=0
				var/db6=0
				var/db7=0
				spawn(1)
					while(!db1)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_1(T)
							db1=1
							break
					while(!db2)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_2(T)
							db2=1
							break
					while(!db3)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_3(T)
							db3=1
							break
					while(!db4)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_4(T)
							db4=1
							break
					while(!db5)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_5(T)
							db5=1
							break
					while(!db6)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_6(T)
							db6=1
							break
					while(!db7)
						var/turf/T=locate(rand(1,500),rand(1,500),rand(1,4))
						if(T.dbable)
							new/obj/Black_Dragonballs/Black_Dragonball_7(T)
							db7=1
							break
mob/proc/Summon_Dragon(D)
	world.ShutDownRadar()
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Has used a wish from [D]")
	if(D=="Shenron")
		if(src.e_db_1 && src.e_db_2 && src.e_db_3 && src.e_db_4 && src.e_db_5 && src.e_db_6 && src.e_db_7)
			for(var/obj/Earth_Dragonballs/O in world)
				del(O)
			src.e_db_1 = 0

			src.e_db_2 = 0
			src.e_db_3 = 0
			src.e_db_4 = 0
			src.e_db_5 = 0
			src.e_db_6 = 0
			src.e_db_7 = 0
			player <<"<font color = green><b>The Sky Darkens as [D] is summoned!</font>"
			//var/icon/I=new('Shenron Summon.dmi')
			var/obj/dragons/EarthShen/I=new
			I.loc=src.loc
			//src.overlays+=I

			spawn(1)world.Earth_Dragonball_Spawn(9000)
			sleep(15)
			switch(input("What is your wish?")in list("Power","Z Points","Karma","Training Points","Change Energy Code"))
				if("Change Energy Code")
					src.energy_code=rand(0000001,9999999)

					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
				//	alert("Your wish has been granted!")
				if("Custom Points")
					src.custom_points += 100
					//src.wishes +=1
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
				//	alert("Your wish has been granted!")
				if("Training Points")

					var/tpgain = rand(300,500)
					if(prob(5))
						tpgain += rand(1,500)
					src.tp += tpgain
					src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(tpgain)] TP"
					//src.wishes +=1
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
					//alert("Your wish has been granted!")

				if("Z Points")
					var/zpgain = rand(1,10)
					if(prob(25))
						zpgain += rand(1,10)





					src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(zpgain)] ZP"
					src.zp += zpgain

					src.wishes +=1
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
				//	alert("Your wish has been granted!")
				if("Level")
					var/amount=3000
					src.wishes +=1
					src.lvluphold = 0
					src.lvls_on = 0
					src.overlays-=I
					while(amount>0)
						usr.exp = usr.tnl
						usr.Level_Up()
						amount -= 1
						sleep(1)
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
					//alert("Your wish has been granted!")
				if("Power")
					var/hn = round(src.powerlevel_max * 0.2)
					if(hn > 4000000)
						hn = 4000000
					var/plg2 = src.powerlevel_max/1000
					var/kig2 = src.ki_max/1000
					var/strg2 = src.strength_max/1000
					var/defg2 = src.defence_max/1000


					if(plg2 > 1000000) plg2 = 1000000
					if(kig2 > 1000000) kig2 = 1000000
					if(strg2 > 1000000) strg2 = 1000000
					if(defg2 > 1000000) defg2 = 1000000

					var/plg = hn+plg2
					var/kig = hn+kig2
					var/strg = hn+strg2
					var/defg = hn+defg2


					if(plg > 5000000) plg = 5000000
					if(kig > 5000000) kig = 5000000
					if(strg > 5000000) strg = 5000000
					if(defg > 5000000) defg = 5000000


					src.powerlevel_max += plg
					src.ki_max += kig
//					src.kidefense_max += kidg
					src.strength_max += strg
					src.defence_max += defg
					src << "<font color = yellow><b>Your wish has been granted, you have gained:<br>Max powerlevel + [applycommas(plg)]<br>Max ki + [applycommas(kig)]<br>Max Strength + [applycommas(strg)]<br>Max Defense + [applycommas(defg)]"




				//	src.wishes +=1
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
//						alert("Your wish has been granted!")

				if("Karma")
					switch(alert("Do you wish to be Pure or Evil?","","Pure","Evil"))
						if("Pure")
							src.karma = "Good"
							src.karma_rating = 100
						else
							src.karma = "Evil"
							src.karma_rating = 100
				//	src.wishes +=1
					src << browse(null)
					player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
				//	alert("Your wish has been granted!")
			src.wishes +=1

			sleep(10)
			del I
			//src.overlays-=I

	if(D=="Porunga")
		if(src.nwishes < 3)
			if(src.n_db_1 && src.n_db_2 && src.n_db_3 && src.n_db_4 && src.n_db_5 && src.n_db_6 && src.n_db_7)
				for(var/obj/Namek_Dragonballs/O in world)
					del(O)
				src.n_db_1 = 0
				src.n_db_2 = 0
				src.n_db_3 = 0
				src.n_db_4 = 0
				src.n_db_5 = 0
				src.n_db_6 = 0
				src.n_db_7 = 0
				player <<"<font color = green><b>The Sky Darkens as [D] is summoned!</font>"
//				var/icon/I2=new('Porunga Summon.dmi')
			//	src.overlays+=I
//				I2.layer = 150
//				I2.loc=locate(src.x,src.y,src.z)
				var/obj/dragons/NamekPorunga/I=new
				I.loc=src.loc



				spawn(1)world.Namek_Dragonball_Spawn(18000)
				sleep(15)
				switch(input("What is your wish?") in list ("Power","Z Points","Training Points"))
					if("Change Energy Code")
						src.energy_code=rand(0000001,9999999)
					//	src.nwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						//alert("Your wish has been granted!")
					if("Training Points")
						var/tpgain = 50000

						src.tp += tpgain
						src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(tpgain)] TP"
						//src.nwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
				//		alert("Your wish has been granted!")
					if("Z Points")
						var/zpgain = 50+round(src.level/1000)
						if(zpgain > 150)
							zpgain = 150
						src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(zpgain)] ZP"
						src.zp += zpgain
						//src.nwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
//						alert("Your wish has been granted!")
/*					if("Zenni")
						src.zenni += 100000000+round(src.level*5000)
						src.nwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						//alert("Your wish has been granted!")
						return*/
					if("Level")
						var/amount=10000
						//src.nwishes +=1
						src.lvls_on = 0
						src.lvluphold = 0
						while(amount>0)
							usr.exp = usr.tnl
							usr.Level_Up()
							amount -= 1
							sleep(1)
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
						//alert("Your wish has been granted!")
					if("Power")
						//src.powerlevel_max += 200000000+round(src.powerlevel_max/500)
						var/gn = round(src.powerlevel_max * 0.1)
						if(gn > 30000000)
							gn = 30000000
						var/plg2 = src.powerlevel_max/500
						var/kig2 = src.ki_max/500
						var/strg2 = src.strength_max/500
						var/defg2 = src.defence_max/500

						if(plg2 > 10000000) plg2 = 10000000
						if(kig2 > 10000000) kig2 = 10000000
						if(strg2 > 10000000) strg2 = 10000000
						if(defg2 > 10000000) defg2 = 10000000

						var/plg = gn+plg2
						var/kig = gn+kig2
						var/strg = gn+strg2
						var/defg = gn+defg2

						if(plg > 40000000) plg = 40000000
						if(kig > 40000000) kig = 40000000
						if(strg > 40000000) strg = 40000000
						if(defg > 40000000) defg = 40000000


						src.powerlevel_max += plg
						src.ki_max += kig
						src.strength_max += strg
						src.defence_max += defg
						src << "<font color = yellow><b>Your wish has been granted, you have gained:<br>Max powerlevel + [applycommas(plg)]<br>Max ki + [applycommas(kig)]<br>Max Strength + [applycommas(strg)]<br>Max Defense + [applycommas(defg)]"

						//src.nwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
					///	alert("Your wish has been granted!")

				src.nwishes +=1
				sleep(10)
				del I
				//src.overlays-=I
				//for(var/icon/dragon/I in oview(10))

				//	sleep(-1)
				//	del 1
		else
			alert("You have used all your wishes up!")
			return
	if(D=="Black Shenron")
	//	if(src.gene == "Zealot")
		//	if(src.transformed == 0 && src.form_1 == 0 && src.form_2 == 0)

		if(!src.bwishes)
			if(src.b_db_1 && src.b_db_2 && src.b_db_3 && src.b_db_4 && src.b_db_5 && src.b_db_6 && src.b_db_7)
				for(var/obj/Black_Dragonballs/O in world)
					del(O)
				src.b_db_1 = 0
				src.b_db_2 = 0
				src.b_db_3 = 0
				src.b_db_4 = 0
				src.b_db_5 = 0
				src.b_db_6 = 0
				src.b_db_7 = 0
				player <<"<font color = green><b>The Sky Darkens as <font color=gray>[D]</font> is summoned!</font>"
				//var/icon/I=new('Black Shenron.dmi')
				//src.overlays+=I
				var/obj/dragons/BSDBdrag/I=new
				I.loc=src.loc

				spawn(1)world.Black_Dragonball_Spawn(36000)
				sleep(15)
				var/list/Menu = list()
				alert("You only get one BSDB wish, so choose wisely")
				//alert("Z Points is a good wish if you want to increase your stat ticks. The amount you gain is based on your level, with a cap of 250.")
			//	alert("Wishing for levels gets you 30k levels, and can be used if you wish to level quickly. It is advised that you do not join any tournaments, or engage any players/mobs until you have recieved all of them.")
				alert("If you wish for endurance, it will increase your max stamina by 1000, which is helpful for PVP. Your stamina also effects your max kaioken limit. This is the only way to increase your stamina after character creation")
				alert("Wishing for power gives you Ki, Strength, Defense, all based on your max stats. You will be automatically reverted when you make this wish.")
				if(src.gene == "Zealot" && src.hasgokubody == 0)

					alert("If you wish to obtains Gokus body you can not have permed already, and if you choose this path and are inverted, you will automatically be inverted")
				//	alert(


					if(src.transformed == 1)
						alert("Sorry, you have already permed so you cannot become Goku Black")
					else
						Menu += "Gokus Body"
//				Menu += "Z Points"
				Menu += "Endurance"
			//	Menu += "Training Points"
				Menu += "Power"
			//	Menu += "Level"




//				switch(input("Choose your gene","Choose Your Gene") in list("Honourable","Prideful","Legendary","Godly"))
				switch(input("What is your wish?") in Menu)//list ("Level","Power","Ki","Ki Defense","Strength","Defence","Speed","Endurance","Training Points","Z Points"))
					if("Gokus Body")
						src.doing = 1
						src.frozen = 1
						if(!src.hasgokubody)
							sleep(30)
							src.kaioken = 0
							src.kaiokenB = 0
							if(src.inverted)
								src.InvertRevert()
							sleep(20)
							src.skin = "tan"
							src.icon = 'Male - Tan.dmi'
							src.hair = "Goku"
							src.hair_icon = 'Hair - Goku.dmi'
							//src.bwishes +=1
							src.overlays += src.hair_icon
							usr.contents += new/obj/Equipment/Suits/GokuBlackSuit

							for(var/obj/Technique/InvertPower/T in src)
								del(T)
							src.hasgokubody=1
							src << "<font color = yellow><b>Your wish has been granted. You now inhabit the body of the warrior Goku"
						src.doing = 0
						src.frozen = 0
					if("Training Points")
						var/tpgain = 1000000+round(src.level*25)
						src.tp += tpgain
//						src.bwishes +=1
						src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(tpgain)] TP"
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
					//	alert("Your wish has been granted!")
					if("Z Points")
						var/zpgain = 100 + round(src.level/1000)
						if(zpgain > 400)
							zpgain = round(400)
						src.zp += round(zpgain
						)
//						src.bwishes +=1
						src << "<font color = yellow><b>Your wish has been granted, you have gained [applycommas(zpgain)] ZP"
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
					//	alert("Your wish has been granted!")
/*					if("Zenni")
						src.zenni += 2500000000+round(src.level*10000)
						src.bwishes +=1
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						alert("Your wish has been granted!")
						return*/
					if("Level")
						src.lvls_on = 0
						src.lvluphold = 0
						var/amount=25000
						//src.bwishes +=1
						while(amount>0)
							usr.exp = usr.tnl
							usr.Level_Up()
							amount -= 1
							sleep(1)
						src << "<font color = yellow><b>Your wish has been granted, you are steadily gaining 30,000 levels. It would be a good idea to get to a safe place, no killing mobs, no tournaments, until your levels are in"
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						//alert("Your wish has been granted!")
					if("Power")

						if(src.inverted)
							src.InvertRevert()
						if(src.race == "Bio Android")
							src.BioRevert()
						if(src.race == "Bio Warrior")
							src.BioWarriorRevert()
						if(src.race == "Heran")
							src.BojackRevert()
						if(src.race == "Changeling")
							src.ChanglingRevert()
						if(src.race == "Demon")
							src.DemonRevert()
						if(src.race == "Half Saiyan")
							src.HalfSaiyanRevert()
						if(src.race == "Human")
							src.HumanRevert()
						if(src.race == "Kai")
							if(src.gene == "Pure Blooded"||src.gene == "Zealot")
								src.KaiRevert()

						if(src.race == "Majin")
							src.MajinRevert()
						if(src.race == "Majin Wizard")
							src.BabidiRevert()
						if(src.race == "Namekian")
							src.NamekRevert()
						if(src.race == "Saibaman")
							src.SaibamanRevert()
						if(src.race == "Saiyan")
							src.SaiyanRevert()
						if(src.race == "Tuffle")
							src.TuffleRevert()
						if(src.race=="Alien")
							if(src.gene!="Hitman")
								src.AlienRevert()


						if(src.race=="Android")
							if(src.gene=="Gluttonous")
								src.AndroidRevert()

						sleep(20)
						var/fn = round(src.powerlevel_max * 0.5)
						if(fn > 1000000000)
							fn = 1000000000
						var/plg2 = src.powerlevel_max/200
						var/kig2 = src.ki_max/200
						var/strg2 = src.strength_max/200
						var/defg2 = src.defence_max/200

						if(plg2 > 1000000000) plg2 = 1000000000
						if(kig2 > 1000000000) kig2 = 1000000000
						if(strg2 > 1000000000) strg2 = 1000000000
						if(defg2 > 1000000000) defg2 = 1000000000

						var/plg = fn+plg2
						var/kig = fn+kig2
						var/strg = fn+strg2
						var/defg = fn+defg2

						if(plg > 2000000000) plg = 2000000000
						if(kig > 2000000000) kig = 2000000000
						if(strg > 2000000000) strg = 2000000000
						if(defg > 2000000000) defg = 2000000000

						if(plg < 50000000) plg = 50000000
						if(kig < 50000000) kig = 50000000
						if(strg < 50000000) strg = 50000000
						if(defg < 50000000) defg = 50000000

						src.powerlevel_max += plg
						src.ki_max += kig
						src.strength_max += strg
						src.defence_max += defg
						src << "<font color = yellow><b>Your wish has been granted, you have gained:<br>Max powerlevel + [applycommas(plg)]<br>Max ki + [applycommas(kig)]<br>Max Strength + [applycommas(strg)]<br>Max Defense + [applycommas(defg)]"



						//src.bwishes +=1
						src << browse(null)
						//src << "<font color = yellow><b>Your wish has been granted, you have gained:<br>Max powerlevel + [applycommas(plg)]<br>Max ki + [applycommas(kig)]<br>Max Ki Defense + [applycommas(kidg)]<br>Max Strength + [applycommas(strg)]<br>Max Defense + [applycommas(defg)]"

						player <<"<font color = green>The sky turns to it's normal color as <font color=gray>[D]</font> grants the wish and departs away!</font>"
						//alert("Your wish has been granted!")

					if("Endurance")
						src.staminaleft_max += 1000
				//		src.bwishes +=1
						src << "<font color = yellow><b>Your wish has been granted, your stamina has now doubled"
						src << browse(null)
						player <<"<font color = green>The sky turns to it's normal color as [D] grants the wish and departs away!</font>"
					//	alert("Your wish has bxeen granted!")
				src.bwishes +=1
				sleep(10)
				del I
			//	src.overlays-=I
		else
			alert("You have already used your wish!")
			return

obj/dragons
	EarthShen  //('Porunga Summon.dmi')  Black Shenron.dmi')
		icon = 'Shenron Summon.dmi'
		//layer = MOB_LAYER+1

	NamekPorunga
		icon = 'Porunga Summon.dmi'

	BSDBdrag
		icon = 'Black Shenron.dmi'


