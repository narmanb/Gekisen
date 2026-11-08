//MR FIX CAUSES PROBLEMS WITH SUITS


obj/Equipment/Suits
	Trunks_Suit
		name = "Trunks Suit"
		icon = 'TrunksSuit.dmi'
		density = 0
		equiped = 0
		value = 1000000000*5
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.weapon_power-=10
					usr.weapon-=10
					usr.melee-=10
					usr.weapon_resistance -= 5

					usr.weapon_power_bonus -= 10
					usr.weapon_bonus -= 10
					usr.melee_bonus -= 10
					usr.weapon_res_bonus -= 5

					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.weapon_power+=10
					usr.weapon+=10
					usr.melee+=10
					usr.weapon_resistance += 5

					usr.weapon_power_bonus += 10
					usr.weapon_bonus += 10
					usr.melee_bonus += 10
					usr.weapon_res_bonus += 5

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "weapon + 10, weapon power + 10, melee + 10, weapon resistance + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return

	Bardock_Suit
		name = "Bardock Suit"
		icon = 'BardockSuit.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000*5
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.ki_res-=15
					usr.ki_use-=10
					usr.ki_cast-=10

					usr.ki_res_bonus-=15
					usr.ki_use_bonus-=10
					usr.ki_cast_bonus-=10
					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_res+=15
					usr.ki_use+=10
					usr.ki_cast+=10

					usr.ki_res_bonus+=15
					usr.ki_use_bonus+=10
					usr.ki_cast_bonus+=10

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki resistance + 15, ki use + 10, ki cast + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	TuffleArmorBlue
		name = "Tuffle Blue Armor"
		icon = 'TuffleArmorBlue.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000*5
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.melee-=15
					usr.ki_power-=10
					usr.durability-=5


					usr.melee_bonus-=15
					usr.ki_power_bonus-=10
					usr.durability_bonus-=5

					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.melee+=15
					usr.ki_power+=10
					usr.durability+=5

					usr.melee_bonus+=15
					usr.ki_power_bonus+=10
					usr.durability_bonus+=5

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "melee + 15, ki power + 10, durability + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	GokuSuitGreen
		name = "Goku Suit Green"
		icon = 'GokuSuitGreen.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000*7.5
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.melee-=5
					usr.ki_power-=5
					usr.durability-=5
					usr.ki_res-=10

					usr.melee_bonus-=5
					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=10
					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.melee+=5
					usr.ki_power+=5
					usr.durability+=5
					usr.ki_res+=10

					usr.melee_bonus+=5
					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=10

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki Resistance + 10, ki power + 5, durability + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return

	SayiansCellsagasArmor
		name = "Saiyan Armor Cell Saga"
		icon = 'SayiansCellsagasArmor.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000*7.5
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.ki_power-=5
					usr.ki_use-=5
					usr.durability-=5
					usr.weapon_resistance-=10

					usr.ki_use_bonus-=5
					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.weapon_res_bonus-=10

					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_power+=5
					usr.ki_use+=5
					usr.durability+=5
					usr.weapon_resistance+=10

					usr.ki_use_bonus+=5
					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.weapon_res_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki power + 5, ki use + 5, durability + 5, weapon resistance + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return

	VegitoSuit
		name = "Vegito Suit"
		icon = 'VegitoSuit.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000*10
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.durability-=5
					usr.ki_power-=10
					usr.ki_res-=10


					usr.ki_power_bonus-=10
					usr.durability_bonus-=5
					usr.ki_res_bonus-=10

					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=10
					usr.ki_res+=10

					usr.durability_bonus+=5
					usr.ki_power_bonus+=10
					usr.ki_res_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 10, ki resistance + 10, durability + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return
/*
		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1


			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."
					*/


	MKsuitBlue
		name = "MK Suit Blue"
		icon = 'MKsuitBlue.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	MKsuitGreen
		name = "MK Suit Green"
		icon = 'MKsuitGreen.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return

	MKsuitLightBlue
		name = "MK Suit Light Blue"
		icon = 'MKsuitLightBlue.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	MKsuitOrange
		name = "MK Suit Orange"
		icon = 'MKsuitOrange.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	MKsuitPurple
		name = "MK Suit Purple"
		icon = 'MKsuitPurple.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	MKsuitRed
		name = "MK Suit Red"
		icon = 'MKsuitRed.dmi'
		density = 0
		equiped = 0
		value = 1000000000*15
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.melee-=5
					usr.ki_cast-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.melee_bonus-=5
					usr.ki_cast_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.melee+=5
					usr.ki_cast+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.melee_bonus+=5
					usr.ki_cast_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, ki cast + 5, melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	AntiGokuSuit
		name = "Anti Goku Suit"
		icon = 'AntiGokuSuit.dmi'
		density = 0
		equiped = 0
		value = 1000000000*30
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=10
					usr.ki_power-=5
					usr.ki_res-=10
					usr.ki_use-=10
					usr.melee-=15
					usr.ki_cast-=10

					usr.ki_power_bonus-=5
					usr.durability_bonus-=10
					usr.ki_res_bonus-=10
					usr.ki_use_bonus-=10
					usr.melee_bonus-=15
					usr.ki_cast_bonus-=10

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=10
					usr.ki_power+=5
					usr.ki_res+=10
					usr.ki_use+=10
					usr.melee+=15
					usr.ki_cast+=10

					usr.ki_power_bonus+=5
					usr.durability_bonus+=10
					usr.ki_res_bonus+=10
					usr.ki_use_bonus+=10
					usr.melee_bonus+=15
					usr.ki_cast_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 10, durability + 10, ki use + 10, ki cast + 10, melee + 15"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return



	AkatsukiOutfit
		name = "Akatsuki Outfit"
		icon = 'AkatsukiOutfit.dmi'
		density = 0
		equiped = 0
		value = 1000000000*40
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=20
					usr.ki_power+=10
					usr.ki_res-=20
					usr.melee-=15


					usr.ki_power_bonus+=10
					usr.durability_bonus-=20
					usr.ki_res_bonus-=20
					usr.melee_bonus-=15

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=20
					usr.ki_res+=20
					usr.melee+=15
					usr.ki_power-=10


					usr.ki_power_bonus-=10
					usr.durability_bonus+=20
					usr.ki_res_bonus+=20
					usr.melee_bonus+=15

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki resistance + 20, durability + 20, melee + 15"
					usr << "You have lost <b>10 Ki Power</b> while you have this suit equipped!"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return




	Tuxedo
		name = "Tuxedo"
		icon = 'tuxsuit.dmi'
		density = 0
		equiped = 0
		value = 1000000000*50
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_res-=5
					usr.melee-=20


					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.melee_bonus-=20


					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_res+=5
					usr.melee+=20

					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.melee_bonus+=20
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "melee + 20, ki resistance + 5, durability + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	SpaceSuit
		name = "Space Suit"
		icon = 'SpaceSuit.dmi'
		density = 0
		equiped = 0
		value = 1000000000*50
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability+=10
					usr.ki_res-=10
					usr.ki_power-=13
					usr.ki_use-=5

					usr.durability_bonus+=10
					usr.ki_res_bonus-=10
					usr.ki_power_bonus-=13
					usr.ki_use_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability-=10
					usr.ki_res+=10
					usr.ki_power+=13
					usr.ki_use+=5

					usr.durability_bonus-=10
					usr.ki_res_bonus+=10
					usr.ki_power_bonus+=13
					usr.ki_use_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki Power + 13, Ki resistance + 10, Ki use + 5"
					usr << "You have lost <b>10 Durability</b> while you have this suit equipped!"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return



	KingVegetaSuit
		name = "King Vegeta Suit"
		icon = 'King Vegeta Suit.dmi'
//		name = "Trunks Suit"
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"
					usr.ki_power-=5
					usr.ki_use-=5
					usr.durability-=5
					usr.weapon_resistance-=10

					usr.ki_use_bonus-=5
					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.weapon_res_bonus-=10

					return
				//if(!usr.suitequipped)
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"
					//usr.weight+=src.weight

					usr.suit = src.name
//						usr.weightarmor = src.power
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_power+=5
					usr.ki_use+=5
					usr.durability+=5
					usr.weapon_resistance+=10

					usr.ki_use_bonus+=5
					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.weapon_res_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki power + 5, ki use + 5, durability + 5, weapon resistance + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	BrolySuit
		name = "Broly Suit"
		icon = 'BrolySuitMetal.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=30
					usr.ki_res-=10
					usr.melee-=5
					usr.ki_power-=5


					usr.durability_bonus-=30
					usr.ki_res_bonus-=10
					usr.melee_bonus-=5
					usr.ki_power_bonus-=5


					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=30
					usr.ki_res+=10
					usr.melee+=5
					usr.ki_power+=5

					usr.durability_bonus+=30
					usr.ki_res_bonus+=10
					usr.melee_bonus+=5
					usr.ki_power_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "durability + 30, melee + 5,ki power + 5, ki resistance + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	GokuBlackSuit
		name = "Goku Black Suit"
		icon = 'GokuBlackSuit.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=10
					usr.ki_res-=5
					usr.ki_power-=5
					usr.melee-=5
					usr.dodge-=5
					usr.block-=5

					usr.durability_bonus-=10
					usr.ki_res_bonus-=5
					usr.ki_power_bonus-=5
					usr.melee_bonus-=5
					usr.dodge_bonus-=5
					usr.block_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=10
					usr.ki_res+=5
					usr.ki_power+=5
					usr.melee+=5
					usr.dodge+=5
					usr.block+=5

					usr.durability_bonus+=10
					usr.ki_res_bonus+=5
					usr.ki_power_bonus+=5
					usr.melee_bonus+=5
					usr.dodge_bonus+=5
					usr.block_bonus+=5

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Durability + 10, Ki resistance + 5, Ki power + 5"
					usr << "Melee + 5, Dodge + 5, Block + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	SaiyamanSuit
		name = "Saiyaman Suit"
		icon = 'Saiyaman Suit.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=10
					usr.counter-=10
					usr.melee-=15

					usr.durability_bonus-=10
					usr.counter_bonus-=10
					usr.melee_bonus-=15
					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=10
					usr.counter+=10
					usr.melee+=15

					usr.durability_bonus+=10
					usr.counter_bonus+=10
					usr.melee_bonus+=15
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "melee + 15, counter + 10, durability + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	SpidermanSuit
		name = "Spiderman Suit"
		icon = 'Spiderman Suit.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.ki_cast-=15
					usr.dodge-=25
					usr.melee-=10

					usr.ki_cast_bonus-=15
					usr.dodge_bonus-=25
					usr.melee_bonus-=10
					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_cast+=15
					usr.dodge+=25
					usr.melee+=10

					usr.ki_cast_bonus+=15
					usr.dodge_bonus+=25
					usr.melee_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Dodge + 25, Ki Cast + 15, Melee + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return



	MegamanXGigaArmor
		name = "MegamanX Giga Armor"
		icon = 'MegamanX GigaArmor.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.ki_cast-=50
					usr.ki_res-=15
					usr.durability-=10

					usr.ki_cast_bonus-=50
					usr.ki_res_bonus-=15
					usr.durability_bonus-=10
					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_cast+=50
					usr.ki_res+=15
					usr.durability+=10

					usr.ki_cast_bonus+=50
					usr.ki_res_bonus+=15
					usr.durability_bonus+=10
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki Cast + 50, Ki Resistance + 15, Durability + 10"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	SupermanSuit
		name = "Superman Suit"
		icon = 'Superman Suit.dmi'
		density = 0
		equiped = 0
		value = 1000000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.ki_power-=10
					usr.melee-=10
					usr.critical-=50
					usr.ki_cast-=40

					usr.ki_power_bonus-=10
					usr.melee_bonus-=10
					usr.critical_bonus-=50
					usr.ki_cast_bonus-=40

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.ki_power+=10
					usr.melee+=10
					usr.critical+=50
					usr.ki_cast+=40

					usr.ki_power_bonus+=10
					usr.melee_bonus+=10
					usr.critical_bonus+=50
					usr.ki_cast_bonus+=40

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Ki Power + 10, Melee + 10, Critical + 20, Ki Cast + 20"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return







	Saitama_Suit
		name = "Saitama Suit"
		icon = 'Saitama_Suit.dmi'
		density = 0
		equiped = 0
		value = 100000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"


					usr.melee-=10
					usr.critical-=20
					usr.durability-=5

					usr.melee_bonus-=10
					usr.critical_bonus-=20
					usr.durability_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.melee+=10
					usr.critical+=20
					usr.durability+=5

					usr.melee_bonus+=10
					usr.critical_bonus+=20
					usr.durability_bonus+=5

					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Critical + 20, Melee + 10, Durability + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return



	Videl_Saiyaman_Suit
		name = "Videl Saiyaman Suit"
		icon = 'Videl_Saiyaman_Suit.dmi'
		density = 0
		equiped = 0
		value = 100000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"


					usr.dodge-=20
					usr.melee-=5
					usr.block-=10
					usr.block_bonus-=10
					usr.dodge_bonus-=20
					usr.melee_bonus-=5
					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.dodge+=20
					usr.melee+=5
					usr.block+=10
					usr.block_bonus+=10
					usr.dodge_bonus+=20
					usr.melee_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "Dodge + 20, Block + 10, Melee + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return


	GreenLanternSuit
		name = "Green Lantern Suit"
		icon = 'GreenLanternSuit.dmi'
		density = 0
		equiped = 0
		value = 100000000
		Click()
			if(src in usr:contents)
				if(src.equiped)
					usr.overlays -= src.icon
					usr << "You have unequipped the: <u>[src]</u>."
					suffix = null
					usr.suit = null
					src.equiped = 0
					usr.suit = "EMPTY"

					usr.durability-=5
					usr.ki_power-=5
					usr.ki_res-=5
					usr.ki_use-=5
					usr.block-=5
					usr.dodge-=5

					usr.ki_power_bonus-=5
					usr.durability_bonus-=5
					usr.ki_res_bonus-=5
					usr.ki_use_bonus-=5
					usr.dodge_bonus-=5
					usr.block_bonus-=5

					return
				if(usr.suit == "EMPTY")
					if(src.equiped)
						usr << "Error: [src.name] is already equipped!"
						return
					if(src.item_owner!=usr.key&&src.item_owner)
						usr<<"Error: This item is Bio-Linked to someone."
						return
					usr.overlays += src.icon
					usr << "You have equipped the: <u>[src]</u>."
					suffix = "(Worn)"

					usr.suit = src.name
					src.equiped = 1

					usr.suitequipped=1

					//DO ENCHANTMENTS HERE
					usr.durability+=5
					usr.ki_power+=5
					usr.ki_res+=5
					usr.ki_use+=5
					usr.dodge+=5
					usr.block+=5

					usr.ki_power_bonus+=5
					usr.durability_bonus+=5
					usr.ki_res_bonus+=5
					usr.ki_use_bonus+=5
					usr.dodge_bonus+=5
					usr.block_bonus+=5
					usr << "While you have [src] equipped the following skills have recieved a boost:"
					usr << "ki power + 5, ki resistance + 5, durability + 5, ki use + 5, block + 5, dodge + 5"
					return
				else
					usr << "Error: You already have a suit equipped!"
					return