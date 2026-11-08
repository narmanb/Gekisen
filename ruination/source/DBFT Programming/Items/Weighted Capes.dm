obj/Equipment
	Cape
		icon='Black Cape.dmi'
		name = "Weighted Cape"
		density = 0
		equiped = 0
		value = 1000000
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(!usr.weightcape)
					if(usr.back == "EMPTY")
						if(src.equiped)
							usr << "Error: </B> [src.name] is already equipped!"
							return
						if(src.item_owner!=usr.key&&src.item_owner)
							usr<<"Error: This item is Bio-Linked to someone."
							return
						if(src.power > 0)
							usr.overlays += src.icon
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.back = src.name
							usr.weightcape = src.power
						//	if(usr.ki_control_bonus>=32)
							src.equiped = 1
						//		return
							if(src.enchantment == "Melee")
								usr.melee += src.power
								usr.melee_bonus += src.power
							if(src.enchantment == "Block")
								usr.block += src.power
								usr.block_bonus += src.power
							if(src.enchantment == "Dodge")
								usr.dodge += src.power
								usr.dodge_bonus += src.power
							if(src.enchantment == "Counter")
								usr.counter += src.power
								usr.counter_bonus += src.power
							if(src.enchantment == "Critical")
								usr.critical += src.power
								usr.critical_bonus += src.power
							if(src.enchantment == "Ki Control")
								usr.ki_control += src.power
								usr.ki_control_bonus += src.power
							if(src.enchantment == "Ki Power")
								usr.ki_power += src.power
								usr.ki_power_bonus += src.power
							if(src.enchantment == "Ki Use")
								usr.ki_use += src.power
								usr.ki_use_bonus += src.power
							if(src.enchantment == "Ki Resistance")
								usr.ki_res += src.power
								usr.ki_res_bonus += src.power
							if(src.enchantment == "Deflect")
								usr.reflect += src.power
								usr.reflect_bonus += src.power
							if(src.enchantment == "Durability")
								usr.durability += src.power
								usr.durability_bonus += src.power
							if(src.enchantment == "Weapon")
								usr.weapon += src.power
								usr.weapon_bonus += src.power

							if(src.enchantment == "Weapon Power")
								usr.weapon_power += src.power
								usr.weapon_power_bonus += src.power

							if(src.enchantment == "Weapon Resistance")
								usr.weapon_resistance += src.power
								usr.weapon_res_bonus += src.power

							src.equiped = 1
							return
						else
							usr.overlays += src.icon
							usr << "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.weight+=src.weight
							usr.back = src.name
							if(src.name == "Ultra Weighted Cape")
								usr.weightcape = 4
							if(src.name == "Super Weighted Cape")
								usr.weightcape = 3
							if(src.name == "Advanced Weighted Cape")
								usr.weightcape = 2
							if(src.name == "Weighted Cape")
								usr.weightcape = 1
							src.equiped = 1
							return
					else
						usr << "Error: You already have something equipped on your Shoulders!"
						return

				if(usr.weightcape >= 1)
					if(src.equiped)
						if(src.power > 0)
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.weight-=src.weight
							if(src.enchantment == "Melee")
								usr.melee -= src.power
								usr.melee_bonus -= src.power
							if(src.enchantment == "Block")
								usr.block -= src.power
								usr.block_bonus -= src.power
							if(src.enchantment == "Dodge")
								usr.dodge -= src.power
								usr.dodge_bonus -= src.power
							if(src.enchantment == "Counter")
								usr.counter -= src.power
								usr.counter_bonus -= src.power
							if(src.enchantment == "Critical")
								usr.critical -= src.power
								usr.critical_bonus -= src.power
							if(src.enchantment == "Ki Control")
								usr.ki_control -= src.power
								usr.ki_control_bonus -= src.power
							if(src.enchantment == "Ki Power")
								usr.ki_power -= src.power
								usr.ki_power_bonus -= src.power
							if(src.enchantment == "Ki Use")
								usr.ki_use -= src.power
								usr.ki_use_bonus -= src.power
							if(src.enchantment == "Ki Resistance")
								usr.ki_res -= src.power
								usr.ki_res_bonus -= src.power
							if(src.enchantment == "Deflect")
								usr.reflect -= src.power
								usr.reflect_bonus -= src.power
							if(src.enchantment == "Durability")
								usr.durability -= src.power
								usr.durability_bonus -= src.power

							if(src.enchantment == "Weapon")
								usr.weapon -= src.power
								usr.weapon_bonus -= src.power

							if(src.enchantment == "Weapon Power")
								usr.weapon_power -= src.power
								usr.weapon_power_bonus -= src.power

							if(src.enchantment == "Weapon Resistance")
								usr.weapon_resistance -= src.power
								usr.weapon_res_bonus -= src.power
							usr.back = "EMPTY"
							usr.weightcape = 0
							src.equiped = 0
							return
						else
							usr.overlays -= src.icon
							usr << "You have unequiped the: <u>[src]</u>."
							usr.weight-=src.weight
							suffix = null
							usr.back = "EMPTY"
							usr.weightcape = 0
							src.equiped = 0
							return
					else
						usr<<"Error:</B> You may only have one of: <u>[src.name]</u> equipped."
						return


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
					usr.inven_min -= 1
					usr << "You have dropped the: <u>[src]</u>."
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."