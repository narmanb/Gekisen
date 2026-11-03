mob/proc
	SaibamanTransPB()
		if(src.doing||src.transformed)
			return
		src.transformed=1
		var/list/menu = list()

		if(src.level >= 25000 && src.infects >= 150) menu += "Form 1"
		if(src.level >= 50000 && src.infects >= 300) menu += "Form 2"
		if(src.level >= 100000 && src.infects >= 450) menu += "Form 3"
		if(src.level >= 150000 && src.infects >= 600) menu += "Form 4"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Form 1")
				var/fn = 1
				src.pickingtrans = 0
				src.SaibaPDtrans(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.SaibaPDtrans(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.SaibaPDtrans(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.SaibaPDtrans(fn)

			if("Cancel")
				src.transformed = 0
				src.pickingtrans = 0
mob
	proc
		SaibaPDtrans(form as num)
			src.transOpl = src.powerlevel_max
			src.transOki = src.ki_max
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form==1)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/2)
				src.BlueLightningEffect()
				sleep(src.trans_spd/2)

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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 10
				var/kig = 10
				var/kidefg = 10
				var/strg = 10
				var/defg = 10

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



				src.power_maxm = 0
				src.ki_maxm = 0
				src.kidefense_maxm = 0
				src.strength_maxm = 0
				src.defence_maxm = 0
				src.speed_maxm = 0

				src.power_maxm += round(22+(src.trans_lvl/4))
				src.ki_maxm += round(22+(src.trans_lvl/4))
				src.kidefense_maxm += round(22+(src.trans_lvl/4))
				src.strength_maxm += round(15+(src.trans_lvl/4))
				src.defence_maxm += round(15+(src.trans_lvl/4))
				src.speed_maxm += round(15+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.icon = 'Saibaman - Form 2.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				spawn(10) src.Trans_Gain()
				src.icon_state=""
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==2)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans2t!="")
					view(8)<<"\white[src]: \font [src.trans2t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)

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
				//80

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 23
				var/kig = 23
				var/kidefg = 23
				var/strg = 23
				var/defg = 23

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

				src.power_maxm = 0
				src.ki_maxm = 0
				src.kidefense_maxm = 0
				src.strength_maxm = 0
				src.defence_maxm = 0
				src.speed_maxm = 0

				src.power_maxm += round(45+(src.trans_lvl/4))
				src.ki_maxm += round(56+(src.trans_lvl/4))
				src.kidefense_maxm += round(55+(src.trans_lvl/4))
				src.strength_maxm += round(37+(src.trans_lvl/4))
				src.defence_maxm += round(38+(src.trans_lvl/4))
				src.speed_maxm += round(35+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.overlays+='Elec Green Big.dmi'
				src.icon = 'Saibaman - Form 3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.icon_state=""
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==3)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans3t!="")
					view(8)<<"\white[src]: \font [src.trans3t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)

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
				//120

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 40
				var/kig = 40
				var/kidefg = 40
				var/strg = 40
				var/defg = 40

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

				src.power_maxm = 0
				src.ki_maxm = 0
				src.kidefense_maxm = 0
				src.strength_maxm = 0
				src.defence_maxm = 0
				src.speed_maxm = 0

				src.power_maxm += round(75+(src.trans_lvl/4))
				src.ki_maxm += round(85+(src.trans_lvl/4))
				src.kidefense_maxm += round(85+(src.trans_lvl/4))
				src.strength_maxm += round(65+(src.trans_lvl/4))
				src.defence_maxm += round(67+(src.trans_lvl/4))
				src.speed_maxm += round(66+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon = 'Saibaman - Form 4.dmi'
				src.overlays-='Elec Green Big.dmi'
				src.overlays+='Elec Black.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.icon_state=""
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (55+(src.trans_lvl/20))
				var/kig =(55+(src.trans_lvl/20))
				var/kidefg = (55+(src.trans_lvl/20))
				var/strg = (55+(src.trans_lvl/20))
				var/defg = (55+(src.trans_lvl/20))

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



				src.power_maxm = 0
				src.ki_maxm = 0
				src.kidefense_maxm = 0
				src.strength_maxm = 0
				src.defence_maxm = 0
				src.speed_maxm = 0

				src.power_maxm += round(100+(src.trans_lvl/4))
				src.ki_maxm += round(110+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(74+(src.trans_lvl/4))
				src.defence_maxm += round(76+(src.trans_lvl/4))
				src.speed_maxm += round(74+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(12+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/3750))
				src.Ki_Con_Level()
				src.icon = 'Saibaman - Form 5.dmi'
				src.overlays-='Elec Black.dmi'
				src.overlays+='Elec Red Big.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.icon_state=""
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

mob/proc/SaibamanTrans()
	if(src.doing)
		return
	else
		src.pickingtrans = 0
		if(src.gene == "Virulent")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000 && src.infects >= 250)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					sleep(20)
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

					src.powerlevel_max *= 2.5
					src.ki_max *= 2.5
					src.kidefense_max*=2.5
					src.strength_max *= 2.5
					src.defence_max *= 2.5
					src.speed_max *= 2.5

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
					src.icon = 'Saibaman - Form 2.dmi'
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.doing = 0
					src.spam_delay=0
					src.trans_delay=0
					return
			else
				if(!src.form_2)
					if(src.powerlevel_max >= 30000000 && src.infects >= 500)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans2t!="")
							view(8)<<"\white[src]: \font [src.trans2t]"
						src.frozen = 1
						sleep(20)

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

						src.powerlevel_max *= 3
						src.ki_max *= 3
						src.kidefense_max*=3
						src.strength_max *= 3
						src.defence_max *= 3
						src.speed_max *= 3

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.Big_Aura()
						src.overlays+='Elec Green Big.dmi'
						src.icon_state = ""
						src.icon = 'Saibaman - Form 3.dmi'
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.spam_delay=0
						src.trans_delay=0
						return
				else
					if(!src.form_3)
						if(src.powerlevel_max >= 50000000 && src.infects >= 750)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans3t!="")
								view(8)<<"\white[src]: \font [src.trans3t]"
							src.frozen = 1
							sleep(20)
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

							src.powerlevel_max *= 3
							src.ki_max *= 3
							src.kidefense_max*=3
							src.strength_max *= 3
							src.defence_max *= 3
							src.speed_max *= 3

							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.kidefense=src.kidefense_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							src.speed = src.speed_max

							src.overlays-='Elec Green Big.dmi'
							src.overlays+='Elec Black.dmi'
							src.icon_state = ""
							src.icon = 'Saibaman - Form 4.dmi'
							src.form_3 = 1
							src.frozen = 0
							src.doing = 0
							src.trans_delay=0
							src.spam_delay=0
							return
					else
						if(!src.form_4)
							if(src.powerlevel_max >= 75000000 && src.infects >= 1000)
								src.doing = 1
								src.icon_state = "enrage"
								if(src.trans4t!="")
									view(8)<<"\white[src]: \font [src.trans4t]"
								src.frozen = 1
								sleep(30)
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

								src.powerlevel_max *= 3.5
								src.ki_max *= 3.5
								src.kidefense_max*=3.5
								src.strength_max *= 3.5
								src.defence_max *= 3.5
								src.speed_max *= 3.5

								src.powerlevel = src.powerlevel_max
								src.ki = src.ki_max
								src.kidefense=src.kidefense_max
								src.strength = src.strength_max
								src.defence = src.defence_max
								src.speed = src.speed_max

								src.overlays-='Elec Black.dmi'
								src.overlays+='Elec Red Big.dmi'
								src.icon_state = ""
								src.icon = 'Saibaman - Form 5.dmi'
								src.form_4 = 1
								src.frozen = 0
								src.spam_delay=0
								src.doing = 0
								src.trans_delay=0
								return

		if(src.gene == "Godly")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000 && src.infects >= 600 && src.level >= 60000)
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

					src.powerlevel_max *= 8.5
					src.ki_max *= 8.7
					src.kidefense_max *= 8.7
					src.strength_max *= 8.5
					src.defence_max *= 8.5
					src.speed_max *= 8.5

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.overlays += 'Elec Black.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.icon = 'Saibaman - Form 4.dmi'
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
					if(src.powerlevel_max >= 50000000 && src.infects >= 1200  && src.level >= 120000)
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

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.overlays -= 'Elec Black.dmi'
						src.overlays += 'Elec Light Blue.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon_state = ""
						src.form_2 = 1
						src.icon = 'Saibaman - Form 7.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						src.trans_delay=0
						src.spam_delay=0
						spawn(40) src.cant_trans = 0
						return
