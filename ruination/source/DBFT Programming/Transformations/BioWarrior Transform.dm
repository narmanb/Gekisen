mob/proc
	BioWarriorTrans()
		if(src.doing||src.transformed)
			return
		src.transformed=1
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
				src.BioWTransForm(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.BioWTransForm(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.BioWTransForm(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.BioWTransForm(fn)

			if("Form 5")
				var/fn = 5
				src.pickingtrans = 0
				src.BioWTransForm(fn)

			if("Cancel")
				src.transformed = 0
				src.pickingtrans = 0

mob/proc
	BioWTransForm(form as num)
		src.transOpl = src.powerlevel_max //only include these
		src.transOki = src.ki_max //on first form
		src.transOkidef = src.kidefense_max
		src.transOstr = src.strength_max
		src.transOdef = src.defence_max

		if(src.gene == "Primitive")
			if(form == 1)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
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





				var/plg = 5
				var/kig = 5
				var/kidefg = 5
				var/strg = 5
				var/defg = 5

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

				src.power_maxm += round(9+(src.trans_lvl/4))
				src.ki_maxm += round(10+(src.trans_lvl/4))
				src.kidefense_maxm += round(8+(src.trans_lvl/4))
				src.strength_maxm += round(7+(src.trans_lvl/4))
				src.defence_maxm += round(7.5+(src.trans_lvl/4))
				src.speed_maxm += round(6.5+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Warrior1.dmi'
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

				var/plg = 15
				var/kig = 15
				var/kidefg = 15
				var/strg = 15
				var/defg = 15

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

				src.power_maxm += round(20+(src.trans_lvl/4))
				src.ki_maxm += round(21+(src.trans_lvl/4))
				src.kidefense_maxm += round(19+(src.trans_lvl/4))
				src.strength_maxm += round(15+(src.trans_lvl/4))
				src.defence_maxm += round(15+(src.trans_lvl/4))
				src.speed_maxm += round(14+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior2.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Demon 1.dmi'
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
				if(src.trans3t!="")
					view(8)<<"\white[src]: \font [src.trans3t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
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

				var/plg = 30
				var/kig = 30
				var/kidefg = 30
				var/strg = 30
				var/defg = 30

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
				src.strength_maxm += round(40+(src.trans_lvl/4))
				src.defence_maxm += round(39+(src.trans_lvl/4))
				src.speed_maxm += round(38+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior3.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 1.dmi'
				src.overlays += 'Elec Demon 2.dmi'
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
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
				src.frozen = 1
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
				src.strength_maxm += round(61+(src.trans_lvl/4))
				src.defence_maxm += round(60+(src.trans_lvl/4))
				src.speed_maxm += round(60+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior4.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 2.dmi'
				src.overlays += 'Elec Demon 3.dmi'
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


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (55+(src.trans_lvl/20))
				var/kig =(55+(src.trans_lvl/20))
				var/kidefg = (55+(src.trans_lvl/20))
				var/strg = (60+(src.trans_lvl/20))
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

				src.power_maxm += round(95+(src.trans_lvl/4))
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(75+(src.trans_lvl/4))
				src.defence_maxm += round(75+(src.trans_lvl/4))
				src.speed_maxm += round(74+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(12+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior5.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 3.dmi'
				src.overlays += 'Elec Demon 3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

		if(src.gene == "Genetically Modified")
			if(form == 1)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans1t!="")
					view(8)<<"\white[src]: \font [src.trans1t]"
				src.frozen = 1
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





				var/plg = 5
				var/kig = 5
				var/kidefg = 5
				var/strg = 5
				var/defg = 5

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

				src.power_maxm += round(9+(src.trans_lvl/4))
				src.ki_maxm += round(10+(src.trans_lvl/4))
				src.kidefense_maxm += round(8+(src.trans_lvl/4))
				src.strength_maxm += round(7+(src.trans_lvl/4))
				src.defence_maxm += round(7.5+(src.trans_lvl/4))
				src.speed_maxm += round(6.5+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.icon_state = ""
				src.icon = 'Warrior1.dmi'
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

				var/plg = 15
				var/kig = 15
				var/kidefg = 15
				var/strg = 15
				var/defg = 15

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

				src.power_maxm += round(20+(src.trans_lvl/4))
				src.ki_maxm += round(21+(src.trans_lvl/4))
				src.kidefense_maxm += round(19+(src.trans_lvl/4))
				src.strength_maxm += round(15+(src.trans_lvl/4))
				src.defence_maxm += round(15+(src.trans_lvl/4))
				src.speed_maxm += round(14+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior2.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Demon 1.dmi'
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
				if(src.trans3t!="")
					view(8)<<"\white[src]: \font [src.trans3t]"
				src.frozen = 1
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
				src.BlueLightningEffect()
				sleep(src.trans_spd/3)
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

				var/plg = 30
				var/kig = 30
				var/kidefg = 30
				var/strg = 30
				var/defg = 30

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
				src.strength_maxm += round(40+(src.trans_lvl/4))
				src.defence_maxm += round(39+(src.trans_lvl/4))
				src.speed_maxm += round(38+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior3.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 1.dmi'
				src.overlays += 'Elec Demon 2.dmi'
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
				if(src.trans4t!="")
					view(8)<<"\white[src]: \font [src.trans4t]"
				src.frozen = 1
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
				src.strength_maxm += round(61+(src.trans_lvl/4))
				src.defence_maxm += round(60+(src.trans_lvl/4))
				src.speed_maxm += round(60+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior4.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 2.dmi'
				src.overlays += 'Elec Demon 3.dmi'
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


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (60+(src.trans_lvl/20))
				var/kig =(60+(src.trans_lvl/20))
				var/kidefg = (60+(src.trans_lvl/20))
				var/strg = (62+(src.trans_lvl/20))
				var/defg = (62+(src.trans_lvl/20))

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
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(75+(src.trans_lvl/4))
				src.defence_maxm += round(75+(src.trans_lvl/4))
				src.speed_maxm += round(74+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(12+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Warrior5.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 3.dmi'
				src.overlays += 'Elec Demon 3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return