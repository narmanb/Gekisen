mob/proc
	HumanTrans()


		if(src.gene == "Majin Incarnate")
			src.pickingtrans = 0
			src.HumanMITrans()
			return
		if(src.gene == "Bloodthirsty")
			src.pickingtrans = 0
			src.HumanBTTrans()
			return
		if(src.doing||src.transformed||src.inverted)
			return
		src.transformed=1

		if(src.gene == "Roshi")
			var/list/menu = list()
			if(src.level >= 25000) menu += "Bulk Up"
			if(src.level >= 100000) menu += "False UI"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Bulk Up")
					var/fn = 1
					src.pickingtrans = 0
					src.HumanTransRoshi(fn)
				if("False UI")
					var/fn = 2
					src.pickingtrans = 0
					src.HumanTransRoshi(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.HumanTransRoshi(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.HumanTransRoshi(fn)

				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0
		if(src.gene == "Pure Blooded")
			var/list/menu = list()
			if(src.level >= 25000) menu += "Form 1"
			if(src.level >= 50000) menu += "Form 2"
			if(src.level >= 100000) menu += "Form 3"
			if(src.level >= 150000) menu += "Form 4"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.HumanTransPB(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.HumanTransPB(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.HumanTransPB(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.HumanTransPB(fn)

				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0

		if(src.gene == "Mystic")

			var/list/menu = list()
			if(src.level >= 20000) menu += "Form 1"
			if(src.level >= 50000 && trans_lvl < 25) menu += "Form 2"
			if(src.level >= 50000 && src.trans_lvl >= 25) menu += "Form 3"
			if(src.level >= 100000) menu += "Form 4"
			if(src.level >= 150000) menu += "Form 5"
			if(src.level >= 175000) menu += "Form 6"
			if(src.level >= 200000) menu += "Form 7"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.HumanTransMystic(fn)

				if("Form 5")
					var/fn = 5
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Form 6")
					var/fn = 6
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Form 7")
					var/fn = 7
					src.pickingtrans = 0
					src.HumanTransMystic(fn)
				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0
mob
	proc
		HumanTransRoshi(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max
			if(form==1)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 29
				var/kig = 29
				var/kidefg = 29
				var/strg = 29
				var/defg = 29




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
				src.strength_maxm += round(56+(src.trans_lvl/4))
				src.defence_maxm += round(58+(src.trans_lvl/4))
				src.speed_maxm += round(56+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.Skin_Apply()
				src.HHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				if(src.skin=="darkf"||src.skin=="dark")
					src.icon = 'Roshi_Trans Dark.dmi'
				if(src.skin=="whitef"||src.skin=="white")
					src.icon = 'Roshi_Trans White.dmi'
				if(src.skin=="tanf"||src.skin=="tan")
					src.icon = 'Roshi_Trans Tan.dmi'



				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
			if(form==2)
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

				src.power_maxm += round(100+(src.trans_lvl/4))
				src.ki_maxm += round(100+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(74+(src.trans_lvl/4))
				src.defence_maxm += round(76+(src.trans_lvl/4))
				src.speed_maxm += round(75+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.SHHair_Apply()
				src.icon_state = ""
				src.overlays += 'Elec Human Red.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))

				if(src.skin=="darkf"||src.skin=="dark")
					src.icon = 'Male Roshi False UI- Dark.dmi'
				if(src.skin=="whitef"||src.skin=="white")
					src.icon = 'Male Roshi False UI- White.dmi'
				if(src.skin=="tanf"||src.skin=="tan")
					src.icon = 'Male Roshi False UI- Tan.dmi'




				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
	proc
		HumanTransPB(form as num)
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

				src.power_maxm += round(16+(src.trans_lvl/4))
				src.ki_maxm += round(16+(src.trans_lvl/4))
				src.kidefense_maxm += round(16+(src.trans_lvl/4))
				src.strength_maxm += round(11+(src.trans_lvl/4))
				src.defence_maxm += round(13+(src.trans_lvl/4))
				src.speed_maxm += round(12+(src.trans_lvl/4))

				src.trans_exp += round(3+(src.level/1000))
				src.transsexp += round(6+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(3+(src.level/750))
				src.Ki_Con_Level()
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				spawn(10) src.Trans_Gain()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.icon_state = ""
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

				src.power_maxm += round(36+(src.trans_lvl/4))
				src.ki_maxm += round(36+(src.trans_lvl/4))
				src.kidefense_maxm += round(33+(src.trans_lvl/4))
				src.strength_maxm += round(26+(src.trans_lvl/4))
				src.defence_maxm += round(28+(src.trans_lvl/4))
				src.speed_maxm += round(26+(src.trans_lvl/4))

				src.trans_exp += round(4+(src.level/1000))
				src.transsexp += round(7+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/750))
				src.Ki_Con_Level()
				src.USSJ_Apply()
				src.icon_state = ""
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.overlays += "Elec Human Blue.dmi"
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
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
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(70+(src.trans_lvl/4))
				src.strength_maxm += round(56+(src.trans_lvl/4))
				src.defence_maxm += round(58+(src.trans_lvl/4))
				src.speed_maxm += round(56+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.Skin_Apply()
				src.HHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_3 = 1
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

				src.power_maxm += round(100+(src.trans_lvl/4))
				src.ki_maxm += round(100+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(74+(src.trans_lvl/4))
				src.defence_maxm += round(76+(src.trans_lvl/4))
				src.speed_maxm += round(75+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.overlays -= src.aura
				src.underlays -= src.underlays
				src.Big_Aura()
				src.SHHair_Apply()
				src.icon_state = ""
				src.overlays += 'Elec Human Red.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_4 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return

mob
	proc
		HumanTransMystic(form as num)
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
				src.HHair_Apply()
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)


				var/plg = 20
				var/kig = 20
				var/kidefg = 20
				var/strg = 20
				var/defg = 20

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

				src.power_maxm += round(52+(src.trans_lvl/4))
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

				src.power_maxm += round(75+(src.trans_lvl/4))
				src.ki_maxm += round(75+(src.trans_lvl/4))
				src.kidefense_maxm += round(70+(src.trans_lvl/4))
				src.strength_maxm += round(64+(src.trans_lvl/4))
				src.defence_maxm += round(61+(src.trans_lvl/4))
				src.speed_maxm += round(62+(src.trans_lvl/4))

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


				var/plg = 55
				var/kig = 55
				var/kidefg = 55
				var/strg = 55
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

				src.power_maxm += round(90+(src.trans_lvl/4))
				src.ki_maxm += round(105+(src.trans_lvl/4))
				src.kidefense_maxm += round(105+(src.trans_lvl/4))
				src.strength_maxm += round(75+(src.trans_lvl/4))
				src.defence_maxm += round(74+(src.trans_lvl/4))
				src.speed_maxm += round(76+(src.trans_lvl/4))

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
			if(form==7)
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




				var/plg = (60+(src.trans_lvl/20))
				var/kig =(62+(src.trans_lvl/20))
				var/kidefg = (62+(src.trans_lvl/20))
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

				src.power_maxm += round(100+(src.trans_lvl/4))
				src.ki_maxm += round(110+(src.trans_lvl/4))
				src.kidefense_maxm += round(115+(src.trans_lvl/4))
				src.strength_maxm += round(30+(src.trans_lvl/4))
				src.defence_maxm += round(27+(src.trans_lvl/4))
				src.speed_maxm += round(29+(src.trans_lvl/4))

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
				return
mob
	proc
		HumanMITrans()
			if(!src.form_1)

				if(src.powerlevel_max >= 25000000)
					src.doing = 1
					src.icon_state = "enrage"
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					sleep(20)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)
					src.learn_invertpower=0

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
					src.kidefense_max *= 3
					src.strength_max *= 3
					src.defence_max *= 3
					src.speed_max *= 3
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.spam_delay=0
					src.trans_delay=0
					src.doing = 0
					return
			else
				if(!src.form_2)
					if(src.powerlevel_max >= 30000000  && src.eats >= 600)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans2t!="")
							view(8)<<"\white[src]: \font [src.trans2t]"
						src.frozen = 1
						sleep(19)
						src.contents+=new/obj/Transform/Revert

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
						src.form_2 = 1
						src.frozen = 0
						src.doing = 0
						src.trans_delay=0
						src.spam_delay=0
						return
				else
					if(!src.form_3)
						if(src.powerlevel_max >= 50000000 && src.eats >= 1000)
							src.doing = 1
							src.icon_state = "enrage"
							if(src.trans3t!="")
								view(8)<<"\white[src]: \font [src.trans3t]"
							src.frozen = 1
							sleep(19)
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

							var/plg = (1+(src.trans_lvl/20))
							var/kig =(1+(src.trans_lvl/20))
							var/kidefg = (1+(src.trans_lvl/20))
							var/strg = (1+(src.trans_lvl/20))
							var/defg = (1+(src.trans_lvl/20))


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


							src.overlays -= 'Elec Blue Big.dmi'
							src.overlays += 'Elec Red Big.dmi'
							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.icon_state = ""
							src.form_3 = 1
							src.trans_exp += round(3+(src.level/10000))
							src.transsexp += round(6+(src.level/5000))
							src.Trans_Level()
							src.Trans_Speed()
							src.ki_con_exp += round(3+(src.level/7500))
							src.Ki_Con_Level()
							src.frozen = 0
							src.spam_delay=0
							src.trans_delay=0
							src.doing = 0
							spawn(10) src.Trans_Gain()
							spawn(35) src.trans_delay=0
							//spawn(2) src.BuffReapply()
							return
mob
	proc
		HumanBTTrans()
			if(!src.form_1)
				if(src.level >= 85000)
					if(!src.ascended_ssj)
						src.doing = 1
						src.icon_state = "enrage"
						if(src.trans1t!="")
							view(12)<<"\white[src]: \font [src.trans1t]"
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


						src.weapon += 10
						src.weapon_power += 10
						src.weapon_resistance += 10


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
						src.HHair_Apply()
						src.icon_state = ""
						src.overlays += 'Elec Blackred.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,9))
						spawn(10) src.Trans_Gain()
						src.form_1 = 1
						src.transformed = 1
						src.frozen = 0
						src.doing = 0
						//spawn(2) src.BuffReapply()
						return