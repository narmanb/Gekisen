mob/proc/DragonTrans()
	if(src.doing)
		return
	else
		src.pickingtrans = 0
		if(src.gene == "Fierce")

			if(!src.form_1)
				if(src.powerlevel_max >= 50000000  && src.level >= 150000)
					if(src.e_db_1 && src.e_db_2 && src.e_db_3 && src.e_db_4 && src.e_db_5 && src.e_db_6 && src.e_db_7)
						src.e_db_1=0
						src.e_db_2=0
						src.e_db_3=0
						src.e_db_4=0
						src.e_db_5=0
						src.e_db_6=0
						src.e_db_7=0
						for(var/obj/Earth_Dragonballs/O in src)
							del(O)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(8)<<"\white[src]: \font [trans1t]"
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
						src.ki_max *= 85
						src.kidefense_max *= 85
						src.strength_max *= 89
						src.defence_max *= 87
						src.speed_max *= 85

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon = 'Omega.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.icon_state = ""
						src.form_1 = 1
						src.transformed=1
						src.frozen = 0
						src.spam_delay=0
						src.doing = 0
						src.safe = 0
						world.Earth_Dragonball_Spawn(1)
						return

		if(src.gene == "Almighty")
			if(!src.form_1)
				if(src.powerlevel_max >= 50000000  && src.level >= 150000)
					if(src.n_db_1 && src.n_db_2 && src.n_db_3 && src.n_db_4 && src.n_db_5 && src.n_db_6 && src.n_db_7)
						src.n_db_1=0
						src.n_db_2=0
						src.n_db_3=0
						src.n_db_4=0
						src.n_db_5=0
						src.n_db_6=0
						src.n_db_7=0
						for(var/obj/Namek_Dragonballs/O in src)
							del(O)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(8)<<"\white[src]: \font [trans1t]"
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
						src.ki_max *= 89
						src.kidefense_max *= 87
						src.strength_max *= 85
						src.defence_max *= 85
						src.speed_max *= 85

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon = 'Omega.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.icon_state = ""
						src.form_1 = 1
						src.transformed=1
						src.frozen = 0
						src.spam_delay=0
						src.doing = 0
						src.safe = 0
						world.Namek_Dragonball_Spawn(1)
						return

		if(src.gene == "Desolate")
			if(!src.form_1)
				if(src.powerlevel_max >= 50000000  && src.level >= 150000)
					if(src.b_db_1 && src.b_db_2 && src.b_db_3 && src.b_db_4 && src.b_db_5 && src.b_db_6 && src.b_db_7)
						src.b_db_1=0
						src.b_db_2=0
						src.b_db_3=0
						src.b_db_4=0
						src.b_db_5=0
						src.b_db_6=0
						src.b_db_7=0
						for(var/obj/Black_Dragonballs/O in src)
							del(O)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(8)<<"\white[src]: \font [trans1t]"
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
						src.ki_max *= 85
						src.kidefense_max *= 85
						src.strength_max *= 85
						src.defence_max *= 85
						src.speed_max *= 85

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon = 'Desolate Dragon.dmi'
						src.overlays += 'Elec Red Big.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.icon_state = ""
						src.form_1 = 1
						src.transformed=1
						src.frozen = 0
						src.spam_delay=0
						src.doing = 0
						src.safe = 0
						world.Black_Dragonball_Spawn(1)
						return