mob/proc
	KaiTrans()
		if(src.gene == "Zealot" && src.hasgokubody == 0)
			src.pickingtrans = 0
			src.ZealotPermTrans()
			return
		if(src.doing||src.transformed||src.inverted)
			return
		src.transformed=1
		if(src.gene == "Zealot")
			if(src.hasgokubody)
				src.transformed=0
				src.pickingtrans = 0
				src.ZealotSSJRtrans()





		if(src.gene == "Pure Blooded")
			var/list/menu = list()
			if(src.level >= 15000 && src.level < 35000) menu += "Form 1"
			if(src.level >= 35000 && src.level < 75000) menu += "Form 2"
			if(src.level >= 75000) menu += "Form 3"
			if(src.level >= 120000) menu += "Form 4"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.KaiTrainsPB(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.KaiTrainsPB(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.KaiTrainsPB(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.KaiTrainsPB(fn)

				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0
mob
	proc
		KaiTrainsPB(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 8
				var/kig = 8
				var/kidefg = 8
				var/strg = 8
				var/defg = 8

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

				src.power_maxm += round(15+(src.trans_lvl/4))
				src.ki_maxm += round(16+(src.trans_lvl/4))
				src.kidefense_maxm += round(17+(src.trans_lvl/4))
				src.strength_maxm += round(11+(src.trans_lvl/4))
				src.defence_maxm += round(9+(src.trans_lvl/4))
				src.speed_maxm += round(10+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
				usr.Big_Aura()
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==2)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 15
				var/kig = 15
				var/kidefg = 15
				var/strg = 15
				var/defg = 15

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

				src.power_maxm += round(37+(src.trans_lvl/4))
				src.ki_maxm += round(35+(src.trans_lvl/4))
				src.kidefense_maxm += round(37+(src.trans_lvl/4))
				src.strength_maxm += round(27+(src.trans_lvl/4))
				src.defence_maxm += round(26+(src.trans_lvl/4))
				src.speed_maxm += round(25+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.overlays += 'Elec Blue Big.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
				usr.Big_Aura()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==3)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
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

				var/plg = 24
				var/kig = 24
				var/kidefg = 24
				var/strg = 24
				var/defg = 24

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

				src.power_maxm += round(70+(src.trans_lvl/4))
				src.ki_maxm += round(69+(src.trans_lvl/4))
				src.kidefense_maxm += round(70+(src.trans_lvl/4))
				src.strength_maxm += round(56+(src.trans_lvl/4))
				src.defence_maxm += round(53+(src.trans_lvl/4))
				src.speed_maxm += round(54+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.overlays += 'Elec Blue Big.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				spawn(10) src.Trans_Gain()
				usr.Big_Aura()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return

			if(form==4)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans2t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)
				src.BlueLightningEffect()
				sleep(src.trans_spd/6)

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

				var/plg = (45+(src.trans_lvl/20))
				var/kig =(45+(src.trans_lvl/20))
				var/kidefg = (45+(src.trans_lvl/20))
				var/strg = (45+(src.trans_lvl/20))
				var/defg = (45+(src.trans_lvl/20))

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

				src.power_maxm += round(95+(src.trans_lvl/4))
				src.ki_maxm += round(100+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(74+(src.trans_lvl/4))
				src.defence_maxm += round(76+(src.trans_lvl/4))
				src.speed_maxm += round(75+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(12+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/3750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.overlays += 'Elec Blue Dark.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
mob
	proc
		ZealotSSJRtrans()
			if(src.hasgokubody)
				if(!src.form_1)
					if(src.level >= 130000) //I NEED TO PUT SSJROSE STUFF HERE

						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans4t!="")
							view(8)<<"\white[src]: \font [src.trans1t]"

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



						src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
						src.ki = round((src.ki_control * src.ki_max)/100)
						src.kidefense = round((src.ki_control * src.kidefense_max)/100)
						src.strength = round((src.ki_control * src.strength_max)/100)
						src.defence = round((src.ki_control * src.defence_max)/100)
						src.speed = round((src.ki_control * src.speed_max)/100)

						var/plg = (70+(src.trans_lvl/20))
						var/kig =(70+(src.trans_lvl/20))
						var/kidefg = (70+(src.trans_lvl/20))
						var/strg = (70+(src.trans_lvl/20))
						var/defg = (70+(src.trans_lvl/20))

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

						src.power_maxm += round(13+(src.trans_lvl/3))
						src.ki_maxm += round(13+(src.trans_lvl/3))
						src.kidefense_maxm += round(12+(src.trans_lvl/3))
						src.strength_maxm += round(10+(src.trans_lvl/3))
						src.defence_maxm += round(10+(src.trans_lvl/3))
						src.speed_maxm += round(10+(src.trans_lvl/3))

						src.trans_exp += round(3+(src.level/5000))
						src.transsexp += round(6+(src.level/2500))
						src.Trans_Level()
						src.Trans_Speed()
						src.ki_con_exp += round(3+(src.level/3750))
						src.Ki_Con_Level()
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.SSJRHair_Apply()
						src.icon_state = ""
					//	src.overlays += 'Elec Blackred.dmi'
						src.overlays += 'Rosesparkle.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,9))
						spawn(10) src.Trans_Gain()
						src.form_1 = 1
						src.transformed = 1
						src.frozen = 0
						src.doing = 0
						//spawn(2) src.BuffReapply()
						return
				return

mob
	proc
		ZealotPermTrans()
			if(!src.form_1)
				if(src.powerlevel_max>=25000000)
					if(src.doing)
						return
					else
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(8)<<"\white[src]: \font [src.trans1t]"
						src.frozen = 1
						src.BlueLightningEffect()
						sleep(src.trans_spd/3)
						src.BlueLightningEffect()
						sleep(src.trans_spd/3)
						src.BlueLightningEffect()
						sleep(src.trans_spd/3)

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
						src.ki_max *= 9
						src.kidefense_max*=9
						src.strength_max *= 8.5
						src.defence_max *= 8.5
						src.speed_max *= 8.5

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.kidefense=src.kidefense_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.speed = src.speed_max

						src.power_maxm = 0
						src.ki_maxm = 0
						src.kidefense_maxm = 0
						src.strength_maxm = 0
						src.defence_maxm = 0
						src.speed_maxm = 0

						src.power_maxm += round(15+(src.trans_lvl/4))
						src.ki_maxm += round(16+(src.trans_lvl/4))
						src.kidefense_maxm += round(17+(src.trans_lvl/4))
						src.strength_maxm += round(11+(src.trans_lvl/4))
						src.defence_maxm += round(9+(src.trans_lvl/4))
						src.speed_maxm += round(10+(src.trans_lvl/4))

					//	src.trans_exp += round(3+(src.level/5000))
					//	src.transsexp += round(6+(src.level/2500))
					//	src.Trans_Level()
					//	src.Trans_Speed()
						src.ki_con_exp += round(3+(src.level/3750))
						src.Ki_Con_Level()
						src.overlays -= src.aura
						src.underlays -= src.underlays
						src.overlays += 'Elec Blue Small.dmi'
						src.icon_state = ""
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,5))
						//spawn(10) src.Trans_Gain()
						usr.Big_Aura()
						src.form_1 = 1
						src.transformed = 1
						src.frozen = 0
						src.doing = 0
						//spawn(2) src.BuffReapply()
						return
			else
				if(!src.form_2)
					if(src.powerlevel_max>=30000000)
						if(src.doing)
							return
						else
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans1t!="")
								view(8)<<"\white[src]: \font [src.trans2t]"
							src.frozen = 1
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)
							src.BlueLightningEffect()
							sleep(src.trans_spd/6)

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

							src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
							src.ki = round((src.ki_control * src.ki_max)/100)
							src.kidefense = round((src.ki_control * src.kidefense_max)/100)
							src.strength = round((src.ki_control * src.strength_max)/100)
							src.defence = round((src.ki_control * src.defence_max)/100)
							src.speed = round((src.ki_control * src.speed_max)/100)


							src.powerlevel_max *= 10
							src.ki_max *= 10.5
							src.kidefense_max*=10.5
							src.strength_max *= 10
							src.defence_max *= 10
							src.speed_max *= 10

							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.kidefense=src.kidefense_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							src.speed = src.speed_max

							src.power_maxm = 0
							src.ki_maxm = 0
							src.kidefense_maxm = 0
							src.strength_maxm = 0
							src.defence_maxm = 0
							src.speed_maxm = 0

							src.power_maxm += round(135+(src.trans_lvl/4))
							src.ki_maxm += round(160+(src.trans_lvl/4))
							src.kidefense_maxm += round(110+(src.trans_lvl/4))
							src.strength_maxm += round(80+(src.trans_lvl/4))
							src.defence_maxm += round(80+(src.trans_lvl/4))
							src.speed_maxm += round(80+(src.trans_lvl/4))

							src.trans_exp += round(7+(src.level/5000))
							src.transsexp += round(12+(src.level/2500))
							src.Trans_Level()
							src.Trans_Speed()
							src.ki_con_exp += round(10+(src.level/3750))
							src.Ki_Con_Level()
							src.overlays -= src.aura
							src.underlays -= src.underlays
							src.overlays += 'Elec Blue Dark.dmi'
							src.icon_state = ""
							src.BlueLightningEffect()
							Explode(new /Effect/BasicBoom(src.loc,1,9))
							src.form_2 = 1
							src.frozen = 0
							src.doing = 0
							//spawn(2) src.BuffReapply()
							return

mob/proc/KaiRevert()
	if(src.gene == "Pure Blooded")
		if(src.form_1||src.transformed)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.transformed = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Blue Dark.dmi'
			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)
			var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
			var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
			var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
			var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
			var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef

			src.powerlevel_max = plleft
			src.ki_max = kileft
			src.kidefense_max = kidefleft
			src.strength_max = strleft
			src.defence_max = defleft
			src.powerlevel *= plper
			src.ki *= kiper

			src.Power_Redefine()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return

	if(src.gene == "Zealot" && src.hasgokubody)
		if(src.form_1)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.transformed = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Blue Dark.dmi'

			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec White.dmi'
			src.overlays -= 'Hair - SSJ3.dmi'
			src.overlays -= 'Hair - SSJ4.dmi'
			src.overlays -= 'Hair - SSJ4(fused).dmi'
			src.overlays -= 'ssj4tail.dmi'
			src.overlays -= 'Elec Green Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec Blue Big.dmi'

			src.overlays -= 'Rosesparkle.dmi'

			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)
			var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
			var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
			var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
			var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
			var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef


			src.powerlevel_max = plleft
			src.ki_max = kileft
			src.kidefense_max = kidefleft
			src.strength_max = strleft
			src.defence_max = defleft
			src.powerlevel *= plper
			src.ki *= kiper

			src.Power_Redefine()
			src.Skin_Apply()
			src.Hair_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return
	else
		return