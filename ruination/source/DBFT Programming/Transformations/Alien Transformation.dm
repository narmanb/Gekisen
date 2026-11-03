mob/proc
	AlienTrans()
		if(src.doing)
			return

		if(src.gene == "Yardrat")
			src.pickingtrans = 0
			if(src.doing||src.transformed)
				return
			src.YardratTrans()
	//		src.transformed=1
		if(src.gene == "Moro")
			if(src.doing||src.transformed)
				return
			src.transformed=1
			var/list/menu = list()
			if(src.level >= 50000) menu += "Form 1"
			if(src.level >= 150000) menu += "Form 2"
			//if(src.level >= 135000) menu += "Form 3"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.MoroTrans(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.MoroTrans(fn)


				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0



		if(src.gene == "Lycanthrope")
			src.pickingtrans = 0
			if(src.doing||src.transformed)
				return
			src.LycanthropeTrans()


		if(src.gene == "Kamenian")
			if(src.doing||src.transformed)
				return
			src.transformed=1
			var/list/menu = list()
			if(src.level >= 20000) menu += "Form 1"
			if(src.level >= 60000) menu += "Form 2"
			if(src.level >= 135000) menu += "Form 3"
			if(src.level >= 200000) menu += "Form 4"

			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.KamenianTrans(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.KamenianTrans(fn)

				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.KamenianTrans(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.KamenianTrans(fn)

				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0

/*
			src.pickingtrans = 0
			if(src.doing||src.transformed)
				return
			src.KamenianTrans()
			*/

		if(src.gene == "Pride Trooper")
			if(src.doing||src.transformed)
				return
			src.transformed=1
			var/list/menu = list()
			if(src.level >= 25000) menu += "Form 1"
			if(src.level >= 75000) menu += "Form 2"
			if(src.level >= 135000) menu += "Form 3"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.PTForm(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.PTForm(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.PTForm(fn)

				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0

		if(src.gene == "Rebrianne")
			if(src.doing||src.transformed)
				return
			src.transformed=1
			var/list/menu = list()
			if(src.level >= 50000) menu += "Form 1"
			if(src.level >= 150000) menu += "Form 2"
			//if(src.level >= 135000) menu += "Form 3"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.ribform(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.ribform(fn)


				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0




		if(src.gene=="Hitman")
			src.pickingtrans = 0
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000  && src.assasin_kill >= 400 && src.level >= 40000)
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
					//src.melee_max += 7
					/*src.block_max += 4
					src.dodge_max += 5
					src.counter_max += 5
					src.critical_max += 4
					src.durability_max += 5
					src.ki_control_max += 6
					src.ki_cast_max += 5
					src.ki_power_max += 6
					src.ki_use_max += 4
					src.ki_res_max += 6
					src.reflect_max += 3
					src.weapon_max += 5
					src.weapon_power_max += 5
					src.weapon_resistance_max += 5
					src.melee += 7
					src.block += 4
					src.dodge += 5
					src.counter += 5
					src.critical += 4
					src.durability += 5
					//src.ki_control += 6

					src.ki_cast += 5
					src.ki_power += 6
					src.ki_use += 4
					src.ki_res += 6
					src.reflect += 3

					src.weapon += 5
					src.weapon_power += 5
					src.weapon_resistance += 5
					*/




					src.powerlevel_max *= 6
					src.ki_max *= 6
					src.kidefense_max *= 6
					src.strength_max *= 6
					src.defence_max *= 6
					src.speed_max *= 6

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
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
					//spawn(2) src.BuffReapply()
					return
			else
				if(!src.form_2)
					if(src.powerlevel_max >= 30000000  && src.assasin_kill >= 800 && src.level >= 80000)
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
						//src.melee_max += 12
						/*src.block_max += 9
						src.dodge_max += 10
						src.counter_max += 10
						src.critical_max += 8
						src.durability_max += 10
						src.ki_control_max += 11
						src.ki_cast_max += 10
						src.ki_power_max += 11
						src.ki_use_max += 9
						src.ki_res_max += 12
						src.reflect_max += 8
						src.weapon_max += 5
						src.weapon_power_max += 5
						src.weapon_resistance_max += 5
						src.melee += 12
						src.block += 9
						src.dodge += 10
						src.counter += 10
						src.critical += 8
						src.durability += 10
						//src.ki_control += 11
						src.ki_cast += 10
						src.ki_power += 11
						src.ki_use += 9
						src.ki_res += 12
						src.reflect += 8
						src.weapon += 10
						src.weapon_power += 10
						src.weapon_resistance += 10
*/
						src.powerlevel_max *= 14.15
						src.ki_max *= 14.15
						src.kidefense_max*= 14.15
						src.strength_max *= 14.15
						src.defence_max *= 14.15
						src.speed_max *= 14.15

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
		PTForm(form as num)
		//	if(src.transformed)
		//		src << "You are already
		//		return
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


				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
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

				var/plg = 30
				var/kig = 30
				var/kidefg = 30
				var/strg = 30
				var/defg = 30

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

				src.power_maxm += 10
				src.ki_maxm += 5
				src.kidefense_maxm += 20
				src.strength_maxm += 20
				src.defence_maxm += 20
				src.speed_maxm += 20

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Blue Big.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
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
				//200

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

				src.power_maxm += round(115+(src.trans_lvl/10))
				src.ki_maxm += round(95+(src.trans_lvl/10))
				src.kidefense_maxm += round(100+(src.trans_lvl/10))
				src.strength_maxm += round(77+(src.trans_lvl/10))
				src.defence_maxm += round(74+(src.trans_lvl/10))
				src.speed_maxm += round(76+(src.trans_lvl/10))

				src.trans_exp += round(7+(src.level/5000))
				src.transsexp += round(12+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays -= 'Elec Blue Big.dmi'
				src.overlays += 'Elec Green Big.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

		ribform(form as num)
		//	if(src.transformed)
		//		src << "You are already
		//		return
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

				var/plg = 20
				var/kig = 20
				var/kidefg = 20
				var/strg = 20
				var/defg = 20

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

				src.icon = 'rebriannetrans.dmi'
				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
			//	src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
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

				var/plg = 65
				var/kig = 65
				var/kidefg = 65
				var/strg = 65
				var/defg = 65

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

				src.power_maxm += 10
				src.ki_maxm += 5
				src.kidefense_maxm += 20
				src.strength_maxm += 20
				src.defence_maxm += 20
				src.speed_maxm += 20

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.overlays += 'Elec Blue Big.dmi'
				src.icon = 'rebriannetrans2.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return

mob
	proc
		YardratTrans()
			if(!src.form_1)
				if(src.level >= 85000)
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





					src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
					src.ki = round((src.ki_control * src.ki_max)/100)
					src.kidefense = round((src.ki_control * src.kidefense_max)/100)
					src.strength = round((src.ki_control * src.strength_max)/100)
					src.defence = round((src.ki_control * src.defence_max)/100)
					src.speed = round((src.ki_control * src.speed_max)/100)

					var/plg = (50+(src.trans_lvl/20))
					var/kig =(60+(src.trans_lvl/20))
					var/kidefg = (50+(src.trans_lvl/20))
					var/strg = (50+(src.trans_lvl/20))
					var/defg = (50+(src.trans_lvl/20))

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
					//src.Big_Aura()
					//src.HHair_Apply()
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


		LycanthropeTrans()
			if(!src.form_1)
				if(src.level >= 85000)
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





					src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
					src.ki = round((src.ki_control * src.ki_max)/100)
					src.kidefense = round((src.ki_control * src.kidefense_max)/100)
					src.strength = round((src.ki_control * src.strength_max)/100)
					src.defence = round((src.ki_control * src.defence_max)/100)
					src.speed = round((src.ki_control * src.speed_max)/100)

					var/plg = (62+(src.trans_lvl/20))
					var/kig =(62+(src.trans_lvl/20))
					var/kidefg = (62+(src.trans_lvl/20))
					var/strg = (62+(src.trans_lvl/20))
					var/defg = (62+(src.trans_lvl/20))

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
					//src.Big_Aura()
					//src.HHair_Apply()
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






		KamenianTrans(form as num)
			if(form==1)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (10+(src.trans_lvl/20))
				var/kig =(10+(src.trans_lvl/20))
				var/kidefg = (10+(src.trans_lvl/20))
				var/strg = (10+(src.trans_lvl/20))
				var/defg = (10+(src.trans_lvl/20))

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
				//src.Big_Aura()
				//src.HHair_Apply()
				if(src.karma == "Good")
					src.icon = 'KamenianTrans.dmi'
				else
					src.icon = 'kamevil1.dmi'

				spawn(1) src.icon_state = ""

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

			if(form==2)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (23+(src.trans_lvl/20))
				var/kig =(23+(src.trans_lvl/20))
				var/kidefg = (23+(src.trans_lvl/20))
				var/strg = (23+(src.trans_lvl/20))
				var/defg = (23+(src.trans_lvl/20))

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
				//src.Big_Aura()
				//src.HHair_Apply()
				if(src.karma == "Good")
					src.icon = 'kamform3.dmi'
				else
					src.icon = 'kamevil2.dmi'

				spawn(1) src.icon_state = ""

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

			if(form==3)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (41+(src.trans_lvl/20))
				var/kig =(41+(src.trans_lvl/20))
				var/kidefg = (41+(src.trans_lvl/20))
				var/strg = (41+(src.trans_lvl/20))
				var/defg = (41+(src.trans_lvl/20))

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
				//src.Big_Aura()
				//src.HHair_Apply()
				if(src.karma == "Good")
					src.icon = 'kamform4.dmi'
				else
					src.icon = 'kamevil3.dmi'

				spawn(1) src.icon_state = ""

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


			if(form==4)
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

				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (60+(src.trans_lvl/20))
				var/kig =(61+(src.trans_lvl/20))
				var/kidefg = (61+(src.trans_lvl/20))
				var/strg = (61+(src.trans_lvl/20))
				var/defg = (61+(src.trans_lvl/20))

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
				//src.Big_Aura()
				//src.HHair_Apply()
				if(src.karma == "Good")
					src.icon = 'kamform5.dmi'
				else
					src.icon = 'kamevil4.dmi'

				spawn(1) src.icon_state = ""

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
/*
		MoroTrans()
			if(!src.form_1)
				if(src.level >= 60000)
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





					src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
					src.ki = round((src.ki_control * src.ki_max)/100)
					src.kidefense = round((src.ki_control * src.kidefense_max)/100)
					src.strength = round((src.ki_control * src.strength_max)/100)
					src.defence = round((src.ki_control * src.defence_max)/100)
					src.speed = round((src.ki_control * src.speed_max)/100)

					var/plg = (63+(src.trans_lvl/20))
					var/kig =(62+(src.trans_lvl/20))
					var/kidefg = (59+(src.trans_lvl/20))
					var/strg = (59+(src.trans_lvl/20))
					var/defg = (59+(src.trans_lvl/20))

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
					//src.Big_Aura()
					//src.HHair_9Apply()
					src.icon = 'MoroTrans.dmi'
					spawn(1) src.icon_state = ""

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

					*/

		MoroTrans(form as num)
		//	if(src.transformed)
		//		src << "You are already
		//		return
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

				var/plg = 30
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
				src.icon = 'MoroTrans.dmi'
				spawn(1) src.icon_state = ""

				//src.overlays += 'Elec Blackred.dmi'
				//src.icon = 'rebriannetrans.dmi'
				src.trans_exp += round(4+(src.level/5000))
				src.transsexp += round(7+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(5+(src.level/3750))
				src.Ki_Con_Level()
				src.underlays -= src.underlays
				src.overlays -= src.aura
			//	src.overlays += 'Elec Blue Small.dmi'
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				spawn(10) src.Trans_Gain()
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

				var/plg = 65
				var/kig = 65
				var/kidefg = 65
				var/strg = 65
				var/defg = 65

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

				src.power_maxm += 10
				src.ki_maxm += 5
				src.kidefense_maxm += 20
				src.strength_maxm += 20
				src.defence_maxm += 20
				src.speed_maxm += 20

				src.trans_exp += round(6+(src.level/5000))
				src.transsexp += round(10+(src.level/2500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(7+(src.level/3750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.underlays -= src.underlays
				src.overlays -= src.aura
			//	src.overlays += 'Elec Blue Big.dmi'
		//	src.icon = 'rebriannetrans2.dmi'
				src.icon = 'MoroTrans2.dmi'
				spawn(1) src.icon_state = ""

				src.overlays += 'Elec Blackred.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return