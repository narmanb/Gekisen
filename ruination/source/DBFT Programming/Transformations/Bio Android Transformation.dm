mob/proc/BioTrans()
	if(src.doing)
		return
	else
		if(src.gene=="Pure Blooded")
			src.pickingtrans = 0
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000  && src.absorbs >= 400 && src.level >= 40000)
					src.doing = 1
					src.icon_state = "enrage"
					src.frozen = 1
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
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
					//50


					src.powerlevel_max *= 5
					src.ki_max *= 5
					src.kidefense_max *= 5
					src.strength_max *= 5
					src.defence_max *= 5
					src.speed_max *= 5

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
					if(src.skin=="green")
						src.icon = 'Bio Android - Form 2.dmi'
					else
						src.icon = 'Bio Android Blue - Form 2.dmi'
					src.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(src.loc,1,7))
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_2)
					if(src.powerlevel_max >= 30000000  && src.absorbs >= 800 && src.level >= 80000)
				//		for(var/obj/Technique/Absorb/T in src)
				//			del(T)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans2t!="")
							view(8)<<"\white[src]: \font [src.trans2t]"
						src.frozen = 1
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)

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
						//100


						src.powerlevel_max *= 16
						src.ki_max *= 16
						src.kidefense_max*=16
						src.strength_max *= 16
						src.defence_max *= 16
						src.speed_max *= 16

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.overlays += 'Elec Blue Big.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon_state = ""
						//src.icon = 'Bio Android - Form 3.dmi'

						if(src.skin=="green")
							src.icon = 'Bio Android - Form 3.dmi'
						else
							src.icon = 'Bio Android Blue - Form 3.dmi'

						src.BlueLightningEffect()

						Explode(new /Effect/BasicBoom(src.loc,1,9))
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return

		if(src.gene=="Perfect")
			if(!src.form_1)
				src.pickingtrans = 0
				if(src.powerlevel_max >= 25000000  && src.absorbs >= 500 && src.level >= 50000)
					src.doing = 1
					src.icon_state = "enrage"
					src.frozen = 1
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
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
					//50


					src.powerlevel_max *= 2
					src.ki_max *= 2
					src.kidefense_max *= 2
					src.strength_max *= 2
					src.defence_max *= 2
					src.speed_max *= 2

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
					//src.icon = 'Bio Android - Form 2.dmi'
					if(src.skin=="green")
						src.icon = 'Bio Android - Form 2.dmi'
					else
						src.icon = 'Bio Android Blue - Form 2.dmi'
					src.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(src.loc,1,7))
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_2)
					src.pickingtrans = 0
					if(src.powerlevel_max >= 30000000  && src.absorbs >= 1000 && src.level >= 100000)
					//	for(var/obj/Technique/Absorb/T in src)
					//		del(T)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans2t!="")
							view(8)<<"\white[src]: \font [src.trans2t]"
						src.frozen = 1
						src.learn_invertpower=0
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)
						src.BlueLightningEffect()
						sleep(7)

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
						//50


						src.powerlevel_max *= 4
						src.ki_max *= 4
						src.kidefense_max*=4
						src.strength_max *= 4
						src.defence_max *= 4
						src.speed_max *= 4

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.overlays += 'Elec Blue Big.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon_state = ""
					//	src.icon = 'Bio Android - Form 3.dmi'
						if(src.skin=="green")
							src.icon = 'Bio Android - Form 3.dmi'
						else
							src.icon = 'Bio Android Blue - Form 3.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,9))
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return
				else
					if(!src.form_3) //SEMI
						src.pickingtrans = 0
						if(src.powerlevel_max >= 50000000  && src.level >= 120000)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans3t!="")
								view(8)<<"\white[src]: \font [src.trans3t]"
							src.frozen = 1
							src.BlueLightningEffect()
							sleep(src.trans_spd/5)
							src.BlueLightningEffect()
							sleep(src.trans_spd/5)
							src.BlueLightningEffect()
							sleep(src.trans_spd/5)
							src.BlueLightningEffect()
							sleep(src.trans_spd/5)
							src.BlueLightningEffect()
							sleep(src.trans_spd/5)
							if(src.crater_on)
								new/obj/techs/Overlays/Crater_Center(src.loc)

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
							//100


							src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
							src.ki = round((src.ki_control * src.ki_max)/100)
							src.kidefense = round((src.ki_control * src.kidefense_max)/100)
							src.strength = round((src.ki_control * src.strength_max)/100)
							src.defence = round((src.ki_control * src.defence_max)/100)
							src.speed = round((src.ki_control * src.speed_max)/100)




							var/plg = (4+(src.trans_lvl/20))
							var/kig =(4+(src.trans_lvl/20))
							var/kidefg = (4+(src.trans_lvl/20))
							var/strg = (4+(src.trans_lvl/20))
							var/defg = (4+(src.trans_lvl/20))

							src.transOpl = src.powerlevel_max //only include these
							src.transOki = src.ki_max //on first form
							src.transOkidef = src.kidefense_max
							src.transOstr = src.strength_max
							src.transOdef = src.defence_max


							src.trans_pl_gain = plg * src.powerlevel_max
							src.trans_ki_gain = kig * src.ki_max
							src.trans_kidef_gain = kidefg * src.kidefense_max
							src.trans_str_gain = strg * src.strength_max
							src.trans_def_gain = defg * src.defence_max


							src.powerlevel_max *= plg
							src.ki_max *= kig
							src.kidefense_max *= kidefg
							src.strength_max *= strg
							src.defence_max *= defg




							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.Big_Aura()
							src.icon_state = ""
							src.trans_exp += round(3+(src.level/10000))
							src.transsexp += round(6+(src.level/5000))
							src.Trans_Level()
							src.Trans_Speed()
							src.ki_con_exp += round(3+(src.level/7500))
							src.Ki_Con_Level()
						//	src.icon = 'Bio Android - Form 4.dmi'
							if(src.skin=="green")
								src.icon = 'Bio Android - Form 4.dmi'
							else
								src.icon = 'Bio Android Blue - Form 4.dmi'
							src.BlueLightningEffect()
							Explode(new /Effect/BasicBoom(src.loc,1,11))
							src.form_3 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							spawn(10) src.Trans_Gain()
							spawn(35) src.trans_delay=0
							//spawn(2) src.BuffReapply()
							return
