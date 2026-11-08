




mob/proc
	ChanglingTrans()
		if(src.doing||src.transformed)
			return
		src.transformed=1
		if(src.gene == "Pure Blooded")
			var/list/menu = list()
			if(src.level>=20000&&src.level<50000) menu += "Form 1"
			if(src.level >= 50000 && src.level <= 100000) menu += "Form 2"
			if(src.level >= 100000) menu += "Form 3"
			if(src.level >= 150000) menu += "Form 4"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.ChangTransPure(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.ChangTransPure(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.ChangTransPure(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.ChangTransPure(fn)

				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0

		if(src.gene == "Rageful")
			var/list/menu = list()



			if(src.level >= 20000) menu += "Form 1"
			if(src.level >= 50000) menu += "Form 2"
			if(src.level >= 80000) menu += "Form 3"
			if(src.level >= 120000) menu += "Form 4"
			if(src.level >= 170000) menu += "Form 5"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.ChangTransRage(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.ChangTransRage(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.ChangTransRage(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.ChangTransRage(fn)

				if("Form 5")
					var/fn = 5
					src.pickingtrans = 0
					src.ChangTransRage(fn)
				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0

		if(src.gene == "Regalis")
			var/list/menu = list()
			if(src.level >= 20000) menu += "Form 1"
			if(src.level >= 50000) menu += "Form 2"
			if(src.level >= 80000) menu += "Form 3"
			if(src.level >= 120000) menu += "Form 4"
			if(src.level >= 170000) menu += "Form 5"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.ChangTransRegalis(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.ChangTransRegalis(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.ChangTransRegalis(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.ChangTransRegalis(fn)
				if("Form 5")
					var/fn = 5
					src.pickingtrans = 0
					src.ChangTransRegalis(fn)
				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0


		if(src.gene == "Vindictive")
			var/list/menu = list()
			if(src.level >= 35000) menu += "Form 1"
			if(src.level >= 75000) menu += "Form 2"
			if(src.level >= 130000) menu += "Form 3"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.ChangTransV(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.ChangTransV(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.ChangTransV(fn)

				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0



mob
	proc
		ChangTransPure(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form == 1)
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
				var/strg = 13
				var/defg = 13

				src.transOpl = src.powerlevel_max
				src.transOki = src.ki_max
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

				src.power_maxm += round(17+(src.trans_lvl/4))
				src.ki_maxm += round(18+(src.trans_lvl/4))
				src.kidefense_maxm += round(19+(src.trans_lvl/4))
				src.strength_maxm += round(12+(src.trans_lvl/4))
				src.defence_maxm += round(13+(src.trans_lvl/4))
				src.speed_maxm += round(13+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/1000))
				src.transsexp += round(6+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.icon = 'Cooler - Form 2.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 2)
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
				//100

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)




				var/plg = 20
				var/kig = 20
				var/kidefg = 20
				var/strg = 23
				var/defg = 23


				src.transOpl = src.powerlevel_max
				src.transOki = src.ki_max
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

				src.power_maxm += round(40+(src.trans_lvl/4))
				src.ki_maxm += round(38+(src.trans_lvl/4))
				src.kidefense_maxm += round(40+(src.trans_lvl/4))
				src.strength_maxm += round(28.5+(src.trans_lvl/4))
				src.defence_maxm += round(29.5+(src.trans_lvl/4))
				src.speed_maxm += round(29.5+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/1000))
				src.transsexp += round(7+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.icon = 'Cooler - Form 2.dmi'
				src.icon_state = ""
				src.overlays += 'Elec Blue Big.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 3)
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
				//150


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)



				var/plg = 45
				var/kig = 45
				var/kidefg = 45
				var/strg = 47
				var/defg = 47


				src.transOpl = src.powerlevel_max
				src.transOki = src.ki_max
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

				src.power_maxm += round(73+(src.trans_lvl/4))
				src.ki_maxm += round(76+(src.trans_lvl/4))
				src.kidefense_maxm += round(74+(src.trans_lvl/4))
				src.strength_maxm += round(56+(src.trans_lvl/4))
				src.defence_maxm += round(58+(src.trans_lvl/4))
				src.speed_maxm += round(55+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.icon = 'Cooler - Form 2.dmi'
				src.icon_state = ""
				src.overlays += 'Elec Red Big.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 4)
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
				//200


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (60+(src.trans_lvl/20))
				var/kig =(60+(src.trans_lvl/20))
				var/kidefg = (60+(src.trans_lvl/20))
				var/strg = (63+(src.trans_lvl/20))
				var/defg = (63+(src.trans_lvl/20))

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

				src.power_maxm += round(105+(src.trans_lvl/4))
				src.ki_maxm += round(95+(src.trans_lvl/4))
				src.kidefense_maxm += round(110+(src.trans_lvl/4))
				src.strength_maxm += round(75+(src.trans_lvl/4))
				src.defence_maxm += round(75+(src.trans_lvl/4))
				src.speed_maxm += round(75+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(10+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(12+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Blue Dark.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Cooler - Form 4.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

mob
	proc
		ChangTransRage(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form == 1)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd)

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
				//40

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 10
				var/kig = 13
				var/kidefg = 13
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

				src.power_maxm += round(12+(src.trans_lvl/4))
				src.ki_maxm += round(14+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(8+(src.trans_lvl/4))
				src.defence_maxm += round(7+(src.trans_lvl/4))
				src.speed_maxm += round(9+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/1000))
				src.transsexp += round(6+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Changling - Form 2.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 2)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans2t!="")
					view(8)<<"\white[src]: \font [src.trans2t]"
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
				//70


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 25
				var/kig = 27
				var/kidefg = 27
				var/strg = 25
				var/defg = 25

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

				src.power_maxm += round(25+(src.trans_lvl/4))
				src.ki_maxm += round(24+(src.trans_lvl/4))
				src.kidefense_maxm += round(23+(src.trans_lvl/4))
				src.strength_maxm += round(16+(src.trans_lvl/4))
				src.defence_maxm += round(17+(src.trans_lvl/4))
				src.speed_maxm += round(17+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/1000))
				src.transsexp += round(7+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays+='Elec Blue Small.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Changling - Form 3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 3)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans3t!="")
					view(8)<<"\white[src]: \font [src.trans3t]"
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
				//100

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 35
				var/kig = 35
				var/kidefg = 35
				var/strg = 35
				var/defg = 35

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

				src.power_maxm += round(48+(src.trans_lvl/4))
				src.ki_maxm += round(54+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(37+(src.trans_lvl/4))
				src.defence_maxm += round(38+(src.trans_lvl/4))
				src.speed_maxm += round(38+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'
				src.icon_state = ""
				src.icon = 'Changling - Form 4.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 4)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
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

				var/plg = 45
				var/kig = 47
				var/kidefg = 47
				var/strg = 45
				var/defg = 45

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
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(75+(src.trans_lvl/4))
				src.strength_maxm += round(62+(src.trans_lvl/4))
				src.defence_maxm += round(63+(src.trans_lvl/4))
				src.speed_maxm += round(63+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/1000))
				src.transsexp += round(10+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Changling - Form 4 100.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 5)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans5t!="")
					view(8)<<"\white[src]: \font [src.trans5t]"
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
				//150

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (60+(src.trans_lvl/20))
				var/kig =(63+(src.trans_lvl/20))
				var/kidefg = (63+(src.trans_lvl/20))
				var/strg = (60+(src.trans_lvl/20))
				var/defg = (60+(src.trans_lvl/20))

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

				src.power_maxm += round(110+(src.trans_lvl/4))
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(77.5+(src.trans_lvl/4))
				src.defence_maxm += round(77.5+(src.trans_lvl/4))
				src.speed_maxm += round(76.5+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Changling - Golden Form.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return




		ChangTransRegalis(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form == 1)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd)

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
				//40

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 13
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

				src.power_maxm += round(12+(src.trans_lvl/4))
				src.ki_maxm += round(14+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(8+(src.trans_lvl/4))
				src.defence_maxm += round(7+(src.trans_lvl/4))
				src.speed_maxm += round(9+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/1000))
				src.transsexp += round(6+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'KC-Form-2.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 2)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans2t!="")
					view(8)<<"\white[src]: \font [src.trans2t]"
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
				//70


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 27
				var/kig = 25
				var/kidefg = 25
				var/strg = 25
				var/defg = 25

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

				src.power_maxm += round(25+(src.trans_lvl/4))
				src.ki_maxm += round(24+(src.trans_lvl/4))
				src.kidefense_maxm += round(23+(src.trans_lvl/4))
				src.strength_maxm += round(16+(src.trans_lvl/4))
				src.defence_maxm += round(17+(src.trans_lvl/4))
				src.speed_maxm += round(17+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/1000))
				src.transsexp += round(7+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays+='Elec Blue Small.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'KC-Form-3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 3)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans3t!="")
					view(8)<<"\white[src]: \font [src.trans3t]"
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
				//100

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 35
				var/kig = 35
				var/kidefg = 35
				var/strg = 35
				var/defg = 35

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

				src.power_maxm += round(48+(src.trans_lvl/4))
				src.ki_maxm += round(54+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(37+(src.trans_lvl/4))
				src.defence_maxm += round(38+(src.trans_lvl/4))
				src.speed_maxm += round(38+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'
				src.icon_state = ""
				src.icon = 'KC-Form-4.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 4)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
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

				var/plg = 45
				var/kig = 47
				var/kidefg = 47
				var/strg = 45
				var/defg = 45

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
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(75+(src.trans_lvl/4))
				src.strength_maxm += round(62+(src.trans_lvl/4))
				src.defence_maxm += round(63+(src.trans_lvl/4))
				src.speed_maxm += round(63+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/1000))
				src.transsexp += round(10+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'KC-Form-Gold.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 5)
				src.doing = 1
					src.icon_state = "enrage"
				if(src.trans5t!="")
					view(8)<<"\white[src]: \font [src.trans5t]"
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
				//150

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (63+(src.trans_lvl/20))
				var/kig =(60+(src.trans_lvl/20))
				var/kidefg = (60+(src.trans_lvl/20))
				var/strg = (60+(src.trans_lvl/20))
				var/defg = (60+(src.trans_lvl/20))

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

				src.power_maxm += round(110+(src.trans_lvl/4))
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(77.5+(src.trans_lvl/4))
				src.defence_maxm += round(77.5+(src.trans_lvl/4))
				src.speed_maxm += round(76.5+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'KC-Form-Platinum.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

mob
	proc
		ChangTransV(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form == 1)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd)

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
				//40

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

				src.power_maxm += round(12+(src.trans_lvl/4))
				src.ki_maxm += round(14+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(8+(src.trans_lvl/4))
				src.defence_maxm += round(7+(src.trans_lvl/4))
				src.speed_maxm += round(9+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/1000))
				src.transsexp += round(6+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Cooler - Form 2.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				spawn(10) src.Trans_Gain()
				src.form_1 = 1
				src.transformed = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 2)

				src.doing = 1
				src.icon_state = "enrage"
				src.frozen = 1
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
				src.BlueLightningEffect()
				sleep(src.trans_spd/4)
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

				var/plg = 45
				var/kig = 45
				var/kidefg = 45
				var/strg = 45
				var/defg = 45

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
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(75+(src.trans_lvl/4))
				src.strength_maxm += round(62+(src.trans_lvl/4))
				src.defence_maxm += round(63+(src.trans_lvl/4))
				src.speed_maxm += round(63+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/1000))
				src.transsexp += round(10+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'CoolerGolden.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
			if(form == 3)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans5t!="")
					view(8)<<"\white[src]: \font [src.trans5t]"
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
				//150

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (63+(src.trans_lvl/20))
				var/kig =(63+(src.trans_lvl/20))
				var/kidefg = (63+(src.trans_lvl/20))
				var/strg = (63+(src.trans_lvl/20))
				var/defg = (63+(src.trans_lvl/20))

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

				src.power_maxm += round(110+(src.trans_lvl/4))
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(77.5+(src.trans_lvl/4))
				src.defence_maxm += round(77.5+(src.trans_lvl/4))
				src.speed_maxm += round(76.5+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Red Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'CoolerPlatinum.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
