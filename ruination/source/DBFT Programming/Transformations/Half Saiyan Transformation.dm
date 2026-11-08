mob/proc/HalfSaiyanTrans()
	if(src.doing)
		return
	if(src.Oozaru)
		return

	if(src.doing||src.transformed)
		return
	src.transformed=1
	if(src.gene == "Mystic")
		var/list/menu = list()
		if(src.level >= 20000) menu += "Form 1"
		if(src.level >= 50000 && trans_lvl < 25) menu += "Form 2"
		if(src.level >= 50000 && src.trans_lvl >= 25) menu += "Form 3"
		if(src.level >= 100000) menu += "Form 4"
		if(src.level >= 150000) menu += "Form 5"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Form 1")
				var/fn = 1
				src.pickingtrans = 0
				src.HalfSaiyanMysticTrain(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.HalfSaiyanMysticTrain(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.HalfSaiyanMysticTrain(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.HalfSaiyanMysticTrain(fn)
			if("Form 5")
				var/fn = 5
				src.pickingtrans = 0
				src.HalfSaiyanMysticTrain(fn)
			if("Cancel")
				src.transformed = 0
				src.pickingtrans = 0
	if(src.gene == "Legendary")
		var/list/menu = list()
		if(src.level >= 20000) menu += "Form 1"
		if(src.level >= 50000 && trans_lvl < 25) menu += "Form 2"
		if(src.level >= 50000 && src.trans_lvl >= 25) menu += "Form 3"
		if(src.level >= 100000) menu += "Form 4"
		if(src.level >= 150000) menu += "Form 5"
		if(src.level >= 200000) menu += "Form 6"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Form 1")
				var/fn = 1
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)
			if("Form 5")
				var/fn = 5
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)
			if("Form 6")
				var/fn = 6
				src.pickingtrans = 0
				src.HalfSaiyanLegendTran(fn)

			if("Cancel")
				src.pickingtrans = 0
				src.transformed = 0

	if(src.gene == "Rageful")
		var/list/menu = list()
		if(src.level >= 20000) menu += "Form 1"
		if(src.level >= 50000 && trans_lvl < 25) menu += "Form 2"
		if(src.level >= 50000 && src.trans_lvl >= 25) menu += "Form 3"
		if(src.level >= 100000) menu += "Form 4"
		if(src.level >= 150000) menu += "Form 5"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Form 1")
				var/fn = 1
				src.pickingtrans = 0
				src.HalfSaiyanRagefulTran(fn)
			if("Form 2")
				var/fn = 2
				src.pickingtrans = 0
				src.HalfSaiyanRagefulTran(fn)
			if("Form 3")
				var/fn = 3
				src.pickingtrans = 0
				src.HalfSaiyanRagefulTran(fn)
			if("Form 4")
				var/fn = 4
				src.pickingtrans = 0
				src.HalfSaiyanRagefulTran(fn)
			if("Form 5")
				var/fn = 5
				src.pickingtrans = 0
				src.HalfSaiyanRagefulTran(fn)
			if("Cancel")
				src.transformed = 0
				src.pickingtrans = 0

mob
	proc
		HalfSaiyanMysticTrain(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form==1)
		//	if(!src.ascended_ssj)
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
				//40

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

				src.power_maxm += round(13+(src.trans_lvl/4))
				src.ki_maxm += round(13+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(8+(src.trans_lvl/4))
				src.defence_maxm += round(8+(src.trans_lvl/4))
				src.speed_maxm += round(8+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.SSJHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
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
				//70

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

				src.power_maxm += round(23+(src.trans_lvl/4))
				src.ki_maxm += round(23+(src.trans_lvl/4))
				src.kidefense_maxm += round(20+(src.trans_lvl/4))
				src.strength_maxm += round(18+(src.trans_lvl/4))
				src.defence_maxm += round(16+(src.trans_lvl/4))
				src.speed_maxm += round(2+(src.trans_lvl/8))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==3)
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



				var/plg = 30
				var/kig = 33
				var/kidefg = 33
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

				src.power_maxm += round(25+(src.trans_lvl/4))
				src.ki_maxm += round(24+(src.trans_lvl/4))
				src.kidefense_maxm += round(26+(src.trans_lvl/4))
				src.strength_maxm += round(19+(src.trans_lvl/4))
				src.defence_maxm += round(18+(src.trans_lvl/4))
				src.speed_maxm += round(17+(src.trans_lvl/4))

				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)

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
				//120

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

				src.power_maxm += round(75+(src.trans_lvl/4))
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(70+(src.trans_lvl/4))
				src.strength_maxm += round(64+(src.trans_lvl/4))
				src.defence_maxm += round(61+(src.trans_lvl/4))
				src.speed_maxm += round(62+(src.trans_lvl/4))

				src.overlays -= 'Hair - Goku SSJ.dmi'
				src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
				src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
				src.overlays -= 'Hair - Future Gohan SSJ.dmi'
				src.overlays -= 'Hair - Vegeta SSJ.dmi'
				src.overlays -= 'Hair - Trunks Long SSJ.dmi'
				src.overlays -= 'Hair - Raditz SSJ.dmi'
				src.overlays -= 'Hair - Goku USSJ.dmi'
				src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
				src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
				src.overlays -= 'Hair - Future Gohan USSJ.dmi'
				src.overlays -= 'Hair - Vegeta USSJ.dmi'
				src.overlays -= 'Hair - Trunks Long USSJ.dmi'
				src.overlays -= 'Hair - Raditz USSJ.dmi'
			//	src.HHair_Apply()
				src.underlays -= src.underlays
				src.overlays -= src.aura
			//rc.Big_Aura()
			//rc.overlays -= 'Elec Red Big.dmi'
			//	src.overlays += 'Elec White.dmi'
				src.SSJHair_Apply()
				src.Skin_Apply()
				src.overlays += 'mysticlightning.dmi'
				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return

			if(form==5)
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

				src.power_maxm += round(45+(src.trans_lvl/4))
				src.ki_maxm += round(48+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(38+(src.trans_lvl/4))
				src.defence_maxm += round(37+(src.trans_lvl/4))
				src.speed_maxm += round(36+(src.trans_lvl/4))

				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'
				src.underlays += 'mysticaura1.dmi'
				src.overlays += 'mysticaura2.dmi'
				src.overlays += 'mysticlightning.dmi'

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(6+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""

				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return

		HalfSaiyanRagefulTran(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form==1)
		//	if(!src.ascended_ssj)
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
				//40

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

				src.power_maxm += round(13+(src.trans_lvl/4))
				src.ki_maxm += round(13+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(8+(src.trans_lvl/4))
				src.defence_maxm += round(8+(src.trans_lvl/4))
				src.speed_maxm += round(8+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.SSJHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
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
				//70

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

				src.power_maxm += round(23+(src.trans_lvl/4))
				src.ki_maxm += round(23+(src.trans_lvl/4))
				src.kidefense_maxm += round(20+(src.trans_lvl/4))
				src.strength_maxm += round(18+(src.trans_lvl/4))
				src.defence_maxm += round(16+(src.trans_lvl/4))
				src.speed_maxm += round(2+(src.trans_lvl/8))

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==3)
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



				var/plg = 30
				var/kig = 33
				var/kidefg = 33
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

				src.power_maxm += round(25+(src.trans_lvl/4))
				src.ki_maxm += round(24+(src.trans_lvl/4))
				src.kidefense_maxm += round(26+(src.trans_lvl/4))
				src.strength_maxm += round(19+(src.trans_lvl/4))
				src.defence_maxm += round(18+(src.trans_lvl/4))
				src.speed_maxm += round(17+(src.trans_lvl/4))

				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)
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

				src.power_maxm += round(45+(src.trans_lvl/4))
				src.ki_maxm += round(48+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(38+(src.trans_lvl/4))
				src.defence_maxm += round(37+(src.trans_lvl/4))
				src.speed_maxm += round(36+(src.trans_lvl/4))

				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(6+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.SSJHair_Apply()
				src.Skin_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==5)

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
				//100

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 67
				var/kig = 65
				var/kidefg = 65
				var/strg = 65
				var/defg = 65

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
				src.ki_maxm += round(48+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(38+(src.trans_lvl/4))
				src.defence_maxm += round(37+(src.trans_lvl/4))
				src.speed_maxm += round(36+(src.trans_lvl/4))

				src.underlays -= src.underlays
				src.overlays -= src.aura
				//src.Big_Aura()
				src.underlays += new/obj/Aura/Rage_Aura
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(6+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.SSJHair_Apply()
				src.Skin_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
					/*
						else
							if(!src.form_5 && src.form_4)
								if(src.powerlevel_max >= 1375000000)
									src.doing = 1
									src.icon_state = "enrage"
									if(src.trans5t!="")
										view(8)<<"\white[src]: \font [src.trans6t]"
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

									var/plg = (5+(src.trans_lvl/20))
									var/kig =(5+(src.trans_lvl/20))
									var/kidefg = (5+(src.trans_lvl/20))
									var/strg = (5+(src.trans_lvl/20))
									var/defg = (5+(src.trans_lvl/20))

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

									src.power_maxm += round(90+(src.trans_lvl/4))
									src.ki_maxm += round(105+(src.trans_lvl/4))
									src.kidefense_maxm += round(105+(src.trans_lvl/4))
									src.strength_maxm += round(75+(src.trans_lvl/4))
									src.defence_maxm += round(74+(src.trans_lvl/4))
									src.speed_maxm += round(76+(src.trans_lvl/4))

									src.overlays -= 'Hair - Goku SSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
									src.overlays -= 'Hair - Future Gohan SSJ.dmi'
									src.overlays -= 'Hair - Vegeta SSJ.dmi'
									src.overlays -= 'Hair - Trunks Long SSJ.dmi'
									src.overlays -= 'Hair - Raditz SSJ.dmi'
									src.overlays -= 'Hair - Goku USSJ.dmi'
									src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
									src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
									src.overlays -= 'Hair - Future Gohan USSJ.dmi'
									src.overlays -= 'Hair - Vegeta USSJ.dmi'
									src.overlays -= 'Hair - Trunks Long USSJ.dmi'
									src.overlays -= 'Hair - Raditz USSJ.dmi'
									src.HHair_Apply()
									src.underlays -= src.underlays
									src.overlays -= src.aura
									src.Big_Aura()
									src.overlays -= 'Elec Red Big.dmi'
									src.overlays += 'Elec White.dmi'

									src.trans_exp += round(7+(src.level/5000))
									src.transsexp += round(12+(src.level/2500))
									src.Trans_Level()
									src.Trans_Speed()
									src.ki_con_exp += round(10+(src.level/3750))
									src.Ki_Con_Level()
									src.icon_state = ""
									src.BlueLightningEffect()
									Explode(new /Effect/BasicBoom(src.loc,1,9))
									src.form_5 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0
									//spawn(2) src.BuffReapply()
									return
						*/
						/*	else
								if(!src.form_6 && src.form_4)
									if(src.powerlevel_max >= 1650000000)
										src.doing = 1
										src.icon_state = "enrage"
										if(src.trans6t!="")
											view(8)<<"\white[src]: \font [src.trans5t]"
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
										//200
										src.melee += 20
										src.block += 17
										src.dodge += 23
										src.counter += 17
										src.critical += 16
										src.durability += 20
										//src.ki_control += 18
										src.ki_cast += 20
										src.ki_power += 21
										src.ki_use += 23
										src.ki_res += 23
										src.reflect += 20
										src.weapon += 20
										src.weapon_power += 20
										src.weapon_resistance += 20

										src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
										src.ki = round((src.ki_control * src.ki_max)/100)
										src.kidefense = round((src.ki_control * src.kidefense_max)/100)
										src.strength = round((src.ki_control * src.strength_max)/100)
										src.defence = round((src.ki_control * src.defence_max)/100)
										src.speed = round((src.ki_control * src.speed_max)/100)

										src.powerlevel *= (190+(src.trans_lvl/4))
										src.ki *= (192+(src.trans_lvl/4))
										src.kidefense *= (192+(src.trans_lvl/4))
										src.strength *= (188+(src.trans_lvl/4))
										src.defence *= (188+(src.trans_lvl/4))
										src.speed *= (190+(src.trans_lvl/4))

										src.power_maxm = 0
										src.ki_maxm = 0
										src.kidefense_maxm = 0
										src.strength_maxm = 0
										src.defence_maxm = 0
										src.speed_maxm = 0

										src.power_maxm += round(100+(src.trans_lvl/4))
										src.ki_maxm += round(110+(src.trans_lvl/4))
										src.kidefense_maxm += round(115+(src.trans_lvl/4))
										src.strength_maxm += round(30+(src.trans_lvl/4))
										src.defence_maxm += round(27+(src.trans_lvl/4))
										src.speed_maxm += round(29+(src.trans_lvl/4))

										src.overlays -= 'Hair - Goku SSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
										src.overlays -= 'Hair - Future Gohan SSJ.dmi'
										src.overlays -= 'Hair - Vegeta SSJ.dmi'
										src.overlays -= 'Hair - Trunks Long SSJ.dmi'
										src.overlays -= 'Hair - Raditz SSJ.dmi'
										src.overlays -= 'Hair - Goku USSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
										src.overlays -= 'Hair - Future Gohan USSJ.dmi'
										src.overlays -= 'Hair - Vegeta USSJ.dmi'
										src.overlays -= 'Hair - Trunks Long USSJ.dmi'
										src.overlays -= 'Hair - Raditz USSJ.dmi'
										if(src.hair != "Bald")
											src.overlays += 'Hair - SSJ3.dmi'
										src.underlays -= src.underlays
										src.overlays -= src.aura
										src.Big_Aura()

										src.icon_state = ""
										src.BlueLightningEffect()
										Explode(new /Effect/BasicBoom(src.loc,1,11))
										src.form_6 = 1
										src.frozen = 0
										src.doing = 0
										src.safe = 0
										//spawn(2) src.BuffReapply()
										return*/
mob
	proc
		HalfSaiyanLegendTran(form as num)
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


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 10
				var/kig = 10
				var/kidefg = 10
				var/strg = 12
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

				src.power_maxm += round(13+(src.trans_lvl/4))
				src.ki_maxm += round(13+(src.trans_lvl/4))
				src.kidefense_maxm += round(10+(src.trans_lvl/4))
				src.strength_maxm += round(9+(src.trans_lvl/4))
				src.defence_maxm += round(7+(src.trans_lvl/4))
				src.speed_maxm += round(8+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/5000))
				src.transsexp += round(6+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.SSJHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
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


				var/plg = 25
				var/kig = 25
				var/kidefg = 25
				var/strg = 28
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

				src.power_maxm += round(23+(src.trans_lvl/4))
				src.ki_maxm += round(23+(src.trans_lvl/4))
				src.kidefense_maxm += round(20+(src.trans_lvl/4))
				src.strength_maxm += round(19+(src.trans_lvl/4))
				src.defence_maxm += round(18+(src.trans_lvl/4))
				src.speed_maxm += round(2+(src.trans_lvl/8))

				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(4+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==3)

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
				//90

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 35
				var/kig = 35
				var/kidefg = 35
				var/strg = 38
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

				src.power_maxm += round(25+(src.trans_lvl/4))
				src.ki_maxm += round(24+(src.trans_lvl/4))
				src.kidefense_maxm += round(26+(src.trans_lvl/4))
				src.strength_maxm += round(19+(src.trans_lvl/4))
				src.defence_maxm += round(18+(src.trans_lvl/4))
				src.speed_maxm += round(17+(src.trans_lvl/4))

				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.overlays += 'Elec Blue Small.dmi'

				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.USSJ_Apply()
				src.USSJHair_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==4)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = 45
				var/kig = 45
				var/kidefg = 45
				var/strg = 48
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

				src.power_maxm += round(54+(src.trans_lvl/4))
				src.ki_maxm += round(48+(src.trans_lvl/4))
				src.kidefense_maxm += round(50+(src.trans_lvl/4))
				src.strength_maxm += round(39+(src.trans_lvl/4))
				src.defence_maxm += round(38+(src.trans_lvl/4))
				src.speed_maxm += round(37+(src.trans_lvl/4))

				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Blue Small.dmi'
				src.overlays += 'Elec Blue Big.dmi'

				src.trans_exp += round(5+(src.level/5000))
				src.transsexp += round(8+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(6+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.SSJHair_Apply()
				src.Skin_Apply()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==5)

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



				var/plg = 55
				var/kig = 55
				var/kidefg = 55
				var/strg = 58
				var/defg = 55

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
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(70+(src.trans_lvl/4))
				src.strength_maxm += round(64+(src.trans_lvl/4))
				src.defence_maxm += round(62+(src.trans_lvl/4))
				src.speed_maxm += round(63+(src.trans_lvl/4))

				src.USSJHair_Apply()
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays -= src.aura
				src.overlays += 'Elec Red Big.dmi'
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==6)
				src.doing = 1
				src.icon_state = "enrage"
				if(src.trans6t!="")
					view(8)<<"\white[src]: \font [src.trans5t]"
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
				//200

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (65+(src.trans_lvl/20))
				var/kig =(65+(src.trans_lvl/20))
				var/kidefg = (65+(src.trans_lvl/20))
				var/strg = (70+(src.trans_lvl/20))
				var/defg = (65+(src.trans_lvl/20))

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
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(100+(src.trans_lvl/4))
				src.strength_maxm += round(78+(src.trans_lvl/4))
				src.defence_maxm += round(75+(src.trans_lvl/4))
				src.speed_maxm += round(76+(src.trans_lvl/4))
				src.overlays -= src.hair_icon
				src.overlays -= 'Hair - Goku SSJ.dmi'
				src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
				src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
				src.overlays -= 'Hair - Future Gohan SSJ.dmi'
				src.overlays -= 'Hair - Vegeta SSJ.dmi'
				src.overlays -= 'Hair - Trunks Long SSJ.dmi'
				src.overlays -= 'Hair - Raditz SSJ.dmi'
				src.overlays -= 'Hair - Goku USSJ.dmi'
				src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
				src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
				src.overlays -= 'Hair - Future Gohan USSJ.dmi'
				src.overlays -= 'Hair - Vegeta USSJ.dmi'
				src.overlays -= 'Hair - Trunks Long USSJ.dmi'
				src.overlays -= 'Hair - Raditz USSJ.dmi'
				if(src.hair != "Bald")
					src.overlays += 'Hair - SSJ3.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,11))
				src.form_5 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
						/*	else

								if(!src.form_6 && src.form_5)
									if(src.powerlevel_max >= 2000000000)
										src.doing = 1
										src.icon_state = "enrage"
										if(src.trans6t!="")
											view(8)<<"\white[src]: \font [src.trans5t]"
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

										var/plg = (5+(src.trans_lvl/20))
										var/kig =(5+(src.trans_lvl/20))
										var/kidefg = (5+(src.trans_lvl/20))
										var/strg = (5+(src.trans_lvl/20))
										var/defg = (5+(src.trans_lvl/20))

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
										src.ki_maxm += round(110+(src.trans_lvl/4))
										src.kidefense_maxm += round(115+(src.trans_lvl/4))
										src.strength_maxm += round(30+(src.trans_lvl/4))
										src.defence_maxm += round(27+(src.trans_lvl/4))
										src.speed_maxm += round(29+(src.trans_lvl/4))

										src.overlays -= 'Hair - Goku SSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan SSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan SSJ.dmi'
										src.overlays -= 'Hair - Future Gohan SSJ.dmi'
										src.overlays -= 'Hair - Vegeta SSJ.dmi'
										src.overlays -= 'Hair - Trunks Long SSJ.dmi'
										src.overlays -= 'Hair - Raditz SSJ.dmi'
										src.overlays -= 'Hair - Goku USSJ.dmi'
										src.overlays -= 'Hair - Adult Gohan USSJ.dmi'
										src.overlays -= 'Hair - Teen Gohan USSJ.dmi'
										src.overlays -= 'Hair - Future Gohan USSJ.dmi'
										src.overlays -= 'Hair - Vegeta USSJ.dmi'
										src.overlays -= 'Hair - Trunks Long USSJ.dmi'
										src.overlays -= 'Hair - Raditz USSJ.dmi'
										src.overlays -= 'Hair - SSJ3.dmi'
										if(src.hair != "Bald")
											src.overlays += 'Hair - SSJ4(fused).dmi'
										src.underlays -= src.underlays
										src.overlays -= src.aura
										src.Big_Aura()

										src.icon_state = ""
										src.BlueLightningEffect()
										Explode(new /Effect/BasicBoom(src.loc,1,13))
										src.form_6 = 1
										src.frozen = 0
										src.doing = 0
										src.safe = 0
										//spawn(2) src.BuffReapply()
										return
*/