obj/Equipment
	Z_Sword
		name = "Z Sword"
		icon = 'Z-Sword.dmi'
		icon_state = "drop"
		var/sword = 'Z-sword.dmi'
		value = 50000000
		density = 0
		weight=2.6
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(usr.strength < 50000000)
					usr << "<font color=red>You've tried to pick up the Z Sword, but it's weight overwhelms you."
					return
				else
					if(!usr.z_sword)
						if(usr.weapone == "EMPTY")
							if(src.item_owner!=usr.key&&src.item_owner)
								usr<<"Error: This item is Bio-Linked to someone."
								return
							usr.overlays += sword
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.z_sword = 1
							src.equiped = 1
							usr.weightsword = 2
							usr.weapone = src.name
						else
							usr << "Error: You already have something equipped as your Weapon!"
							return
					else
						usr.overlays -= sword
						usr << "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.z_sword = 0
						src.equiped = 0
						usr.weightsword = 0
						usr.weapone = "EMPTY"

		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.level < 500)
					usr << "<font color=blue>You need to be level 500 or higher to be able to pick up this Sword."
					return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Summon_Elder_Kai()
				set category = null
				if(usr.race == "Half Saiyan" || usr.race == "Human")
					if(usr.karma == "Good" && usr.karma_rating >= 50)
						if(usr.powerlevel_max >= 875000000)
							if(!usr.gone_mystic && usr.gene == "Mystic")
								for(var/mob/NPC/N in oview(15))
									if(N.name == "Supreme Kai")
										var/mob/NPC/Elder_Kai/M = new
										M.owner=usr
										M.loc = usr.loc
						else
							usr<<"You need a base powerlevel of 875,000,000."
							return
					else
						usr<<"You need 50% Good Karma."
						return
				else
					usr << "You can't summon Elder Kai."
					return

obj/Equipment
	LegendarySword
		name = "Legendary Sword"
		icon = 'Legendary Sword.dmi'
		icon_state = "drop"
		value = 1000000
		density = 0
		Click()
			if(usr.doing)
				return
			if(src in usr:contents)
				if(!usr.legendarysword)
					if(usr.weapone == "EMPTY")
						if(usr.powerlevel<usr.powerlevel_max*0.05)
							usr<<"You are too weak to wield your Sword."
							return
						usr.overlays+=src.icon
						usr<<"You have equiped the: <u>[src]</u>."
						suffix="{Worn}"
						usr.weapone = src.name
						usr.weightsword = 3
						//usr.strength+=75000*usr.level

//			var/g=locate(/obj/techniques/ChanglingForm4) in usr.Skills
//			if(!g)
//				var/b=newlist(/obj/techniques/ChanglingForm4)
//				usr.Skills+=b

						var/ss=locate(/obj/Technique/Sword_Slash) in usr.contents
						if(!ss)

							usr.contents += new/obj/Technique/Sword_Slash
						var/tss=locate(/obj/Technique/ThousandSwordSlash) in usr.contents
						if(!tss)
							usr.contents += new/obj/Technique/ThousandSwordSlash
						usr.legendarysword=1
						src.equiped=1
						usr.speed-=1000
						if(usr.speed<1000)
							usr.speed=1000
						//usr.LSwordDrain(usr.powerlevel_max*0.05)
				else
					usr.overlays-=src.icon
					usr<<"You have unequiped the: <u>[src]</u>."
					for(var/obj/Equipment/LegendarySword/L in src.contents)
						L.suffix=null
					usr.speed=usr.speed_max
					suffix=null
					usr.legendarysword=0
					src.equiped=0
					usr.weightsword = 0
					usr.strength=usr.strength_max
					usr.weapone = "EMPTY"
mob
	proc
		LSwordDrain(drain)
			if(src.legendarysword)
				src.powerlevel-=drain
				if(src.powerlevel<1)
					src.powerlevel=1
					src.overlays-='Legendary Sword.dmi'
					src.legendarysword=0
					src.strength=src.strength_max
					for(var/obj/Equipment/LegendarySword/L in src.contents)
						L.suffix=null
					src<<"You are too weak to wield your Sword."
					src.speed=usr.speed_max
					return
				else
					spawn(30)src.LSwordDrain(drain)



obj/Equipment
	Dragon_Sword
		name = "Dragon Sword"
		icon = 'DragonSword.dmi'
		icon_state = "dragon sword"
		var/sword = 'DragonSword.dmi'
		value = 1000000
		density = 0
		equiped = 0
		weight=3
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
		//		if(usr.strength < 10000000000)
		//			usr << "<font color=red>You've tried to pick up the Dragon Sword, but it's weight overwhelms you."
		//			return
		//		else
				if(usr.weapone != "EMPTY" && src.equiped == 0)
					usr << "Error: You already have something equipped as your Weapon!"
					return
				if(usr.weapone == "EMPTY" && src.equiped == 0)
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += sword
					usr << "You have equiped the: <u>[src]</u>."
					suffix = "(Worn)"
					usr.weightsword = 4
					src.equiped = 1
					usr.weapone = src.name
				else
					usr.overlays -= sword
					usr << "You have unequiped the: <u>[src]</u>."
					suffix = null
					//usr.z_sword = 0
					src.equiped = 0
					usr.weightsword = 0
					usr.weapone = "EMPTY"

		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
			//	if(usr.level < 100000)
			//		usr << "<font color=blue>You need to be level 100,000 or higher to be able to pick up this Sword."
			//		return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	Dual_Swords
		name = "Dual Swords"
		icon = 'dualsword1.dmi'
		icon_state = "drop"
		var/sword = 'dualsword1.dmi'
		value = 1000000
		density = 0
		equiped = 0
		weight=4
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
		//		if(usr.strength < 10000000000)
		//			usr << "<font color=red>You've tried to pick up the Dragon Sword, but it's weight overwhelms you."
		//			return
		//		else
				if(usr.weapone != "EMPTY" && src.equiped == 0)
					usr << "Error: You already have something equipped as your Weapon!"
					return
				if(usr.weapone == "EMPTY" && src.equiped == 0)
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += sword
					usr << "You have equiped the: <u>[src]</u>."
					suffix = "(Worn)"
					usr.weightsword = 4
					src.equiped = 1
					usr.weapone = src.name
				else
					usr.overlays -= sword
					usr << "You have unequiped the: <u>[src]</u>."
					suffix = null
					//usr.z_sword = 0
					src.equiped = 0
					usr.weightsword = 0
					usr.weapone = "EMPTY"

		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
			//	if(usr.level < 100000)
			//		usr << "<font color=blue>You need to be level 100,000 or higher to be able to pick up this Sword."
			//		return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
