mob/proc
	BojackTrans()
		if(src.doing||src.transformed)
			return
		src.transformed=1
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
				src.BojackTransForm(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.BojackTransForm(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.BojackTransForm(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.BojackTransForm(fn)

			if("Cancel")
				src.transformed = 0
				src.pickingtrans = 0
mob/proc
	BojackTransForm(form as num)
		src.transOpl = src.powerlevel_max //only include these
		src.transOki = src.ki_max //on first form
		src.transOkidef = src.kidefense_max
		src.transOstr = src.strength_max
		src.transOdef = src.defence_max
		if(src.gene == "Pure Blooded")
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
				var/strg = 10
				var/defg = 10

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
				//80


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 25
				var/kig = 25
				var/kidefg = 25
				var/strg = 25
				var/defg = 25

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
				//120


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
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)
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
				var/plg = (50+(src.trans_lvl/20))
				var/kig =(50+(src.trans_lvl/20))
				var/kidefg = (50+(src.trans_lvl/20))
				var/strg = (50+(src.trans_lvl/20))
				var/defg = (50+(src.trans_lvl/20))

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
				src.ki_maxm += round(90+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(75+(src.trans_lvl/4))
				src.defence_maxm += round(75+(src.trans_lvl/4))
				src.speed_maxm += round(74+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(9+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Green Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Bojack Rage.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

		if(src.gene == "Primal")
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
				//70

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 12
				var/kig = 12
				var/kidefg = 12
				var/strg = 15
				var/defg = 12

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

				src.power_maxm += round(16+(src.trans_lvl/4))
				src.ki_maxm += round(17+(src.trans_lvl/4))
				src.kidefense_maxm += round(18+(src.trans_lvl/4))
				src.strength_maxm += round(11.5+(src.trans_lvl/4))
				src.defence_maxm += round(9.5+(src.trans_lvl/4))
				src.speed_maxm += round(10.5+(src.trans_lvl/4))

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
				//100

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 25
				var/kig = 25
				var/kidefg = 25
				var/strg = 28
				var/defg = 2.5

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

				src.power_maxm += round(39+(src.trans_lvl/4))
				src.ki_maxm += round(37+(src.trans_lvl/4))
				src.kidefense_maxm += round(38+(src.trans_lvl/4))
				src.strength_maxm += round(28+(src.trans_lvl/4))
				src.defence_maxm += round(27+(src.trans_lvl/4))
				src.speed_maxm += round(26+(src.trans_lvl/4))

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
				src.ki_maxm += round(72+(src.trans_lvl/4))
				src.kidefense_maxm += round(73+(src.trans_lvl/4))
				src.strength_maxm += round(57.5+(src.trans_lvl/4))
				src.defence_maxm += round(54.5+(src.trans_lvl/4))
				src.speed_maxm += round(55.5+(src.trans_lvl/4))

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
				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)
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

				src.power_maxm += round(114+(src.trans_lvl/4))
				src.ki_maxm += round(94+(src.trans_lvl/4))
				src.kidefense_maxm += round(109+(src.trans_lvl/4))
				src.strength_maxm += round(77+(src.trans_lvl/4))
				src.defence_maxm += round(77+(src.trans_lvl/4))
				src.speed_maxm += round(76+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(9+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Green Big.dmi'
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Bojack Rage.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
