mob/proc/FelineTrans()
	if(src.doing)
		return
	if(src.cant_trans)
		return
	else
		src.pickingtrans = 0
		if(src.gene=="Destructive")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000)
					src.cant_trans = 1
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)

					src.melee = (src.melee_max+src.melee_bonus)
					src.block = (src.block_max+src.block_bonus)
					src.dodge = (src.dodge_max+src.dodge_bonus)
					src.counter = (src.counter_max+src.counter_bonus)
					src.critical = (src.critical_max+src.critical_bonus)
					src.durability = (src.durability_max+src.durability_bonus)
					src.ki_control = (src.ki_control_max+src.ki_control_bonus)
					src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
					src.ki_power = (src.ki_power_max+src.ki_power_bonus)
					src.ki_use = (src.ki_use_max+src.ki_use_bonus)
					src.ki_res = (src.ki_res_max+src.ki_res_bonus)
					src.reflect = (src.reflect_max+src.reflect_bonus)
					src.weapon = (src.weapon_max+src.weapon_bonus)
					src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
					src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)


					src.powerlevel_max *= 8
					src.ki_max *= 8
					src.kidefense_max *= 8
					src.strength_max *= 8
					src.defence_max *= 8
					src.speed_max *= 8

					src.overlays += 'Elec Blue Big.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(src.loc,1,7))
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					src.trans_delay=0
					src.spam_delay=0
					spawn(40) src.cant_trans = 0
					return
			else
				if(!src.form_2)
					if(src.powerlevel_max >= 30000000)
						src.cant_trans = 1
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(8)<<"\white[src]: \font [src.trans1t]"
						src.frozen = 1
						src.BlueLightningEffect()
						sleep(8)
						src.BlueLightningEffect()
						sleep(8)
						src.BlueLightningEffect()
						sleep(8)
						src.BlueLightningEffect()
						sleep(8)
						src.BlueLightningEffect()
						sleep(8)
						for(var/obj/Technique/InvertPower/T in src)
							del(T)

						src.melee = (src.melee_max+src.melee_bonus)
						src.block = (src.block_max+src.block_bonus)
						src.dodge = (src.dodge_max+src.dodge_bonus)
						src.counter = (src.counter_max+src.counter_bonus)
						src.critical = (src.critical_max+src.critical_bonus)
						src.durability = (src.durability_max+src.durability_bonus)
						src.ki_control = (src.ki_control_max+src.ki_control_bonus)
						src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
						src.ki_power = (src.ki_power_max+src.ki_power_bonus)
						src.ki_use = (src.ki_use_max+src.ki_use_bonus)
						src.ki_res = (src.ki_res_max+src.ki_res_bonus)
						src.reflect = (src.reflect_max+src.reflect_bonus)
						src.weapon = (src.weapon_max+src.weapon_bonus)
						src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
						src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)


						src.powerlevel_max *= 10
						src.ki_max *= 10
						src.kidefense_max *= 10
						src.strength_max *= 10
						src.defence_max *= 10
						src.speed_max *= 10
						src.overlays -= 'Elec Blue Big.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max
						src.icon_state = ""
						src.form_2 = 1
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						src.trans_delay=0
						src.spam_delay=0
						spawn(40) src.cant_trans = 0
						return

		if(src.gene=="Godly")
			if(!src.form_1)
				if(src.powerlevel_max >= 30000000)
					src.cant_trans = 1
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					src.BlueLightningEffect()
					sleep(8)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)

					src.melee = (src.melee_max+src.melee_bonus)
					src.block = (src.block_max+src.block_bonus)
					src.dodge = (src.dodge_max+src.dodge_bonus)
					src.counter = (src.counter_max+src.counter_bonus)
					src.critical = (src.critical_max+src.critical_bonus)
					src.durability = (src.durability_max+src.durability_bonus)
					src.ki_control = (src.ki_control_max+src.ki_control_bonus)
					src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
					src.ki_power = (src.ki_power_max+src.ki_power_bonus)
					src.ki_use = (src.ki_use_max+src.ki_use_bonus)
					src.ki_res = (src.ki_res_max+src.ki_res_bonus)
					src.reflect = (src.reflect_max+src.reflect_bonus)
					src.weapon = (src.weapon_max+src.weapon_bonus)
					src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
					src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)


					src.powerlevel_max *= 85
					src.ki_max *= 86
					src.kidefense_max *= 85
					src.strength_max *= 85
					src.defence_max *= 86
					src.speed_max *= 85
					src.overlays += 'Elec Red Big.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(src.loc,1,11))
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					src.trans_delay=0
					src.spam_delay=0
					spawn(40) src.cant_trans = 0
					return
