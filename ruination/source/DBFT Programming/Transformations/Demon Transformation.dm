// Fomhoire
mob/proc
	DemonTransMaleOne()
		if(src.doing||src.transformed)
			return

		if(src.gene == "Fomhoire")
			if(src.transformed)
				return
			src.transformed = 1
			var/list/menu = list()
			if(src.level >= 25000) menu += "Super Demon"
			if(src.level >= 85000) menu += "Demon King"
			if(src.level >= 150000) menu += "Demon God"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Super Demon")
					var/fn = 1
					src.pickingtrans = 0
					src.DemonSaiyanTrans(fn)
				if("Demon King")
					var/fn = 2
					src.pickingtrans = 0
					src.DemonSaiyanTrans(fn)
				if("Demon God")
					var/fn = 3
					src.pickingtrans = 0
					src.DemonSaiyanTrans(fn)

				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0

		if(src.gene == "Malevolent")

			if(src.transformed)
				return
			src.transformed = 1
			var/list/menu = list()
			if(src.level >= 25000 && src.corrupts >= 250) menu += "Form 1"
			if(src.level >= 50000 && src.corrupts >= 500) menu += "Form 2"
			if(src.level >= 100000 && src.corrupts >= 750) menu += "Form 3"
			if(src.level >= 150000 && src.gone_prince == 1) menu += "Form 4"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.DemonTransMaleTwo(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.DemonTransMaleTwo(fn)
				if("Form 3")
					var/fn = 3
					src.pickingtrans = 0
					src.DemonTransMaleTwo(fn)
				if("Form 4")
					var/fn = 4
					src.pickingtrans = 0
					src.DemonTransMaleTwo(fn)

				if("Cancel")
					src.transformed = 0
					src.pickingtrans = 0


mob
	proc
		DemonSaiyanTrans(form as num)
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


				var/plg = 24
				var/kig = 24
				var/kidefg = 24
				var/strg = 24
				var/defg = 24




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
				//src.Skin_Apply()
				//src.HHair_Apply()
				src.icon_state = ""
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				src.icon = 'Demon - Form 7.dmi'



				src.form_1 = 1
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
				//src.SHHair_Apply()
				src.icon_state = ""
				src.overlays += 'Elec Human Red.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.icon = 'Demon Race.dmi'



				src.form_2 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return

			if(form==3)
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
				//src.SHHair_Apply()
				src.icon_state = ""
			//	src.overlays += 'Elec Human Red.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.icon = 'Demon Race Trans.dmi'
				src.DemonHair_Apply()
/*
				if(src.hair == "Goku")
			//		src.overlays -= src.hair_icon
					//src.overlays -= 'Hair - Goku.dmi'
					src.overlays += 'Hair_-_Goku_Super_Saiyan_-_Ruination_DT.dmi'
				if(src.hair == "Hercule")
			//		src.overlays -= src.hair_icon
			//		src.overlays -= 'Hair - Hercule.dmi'
					src.overlays += 'Hair_-_Hercule_SSJ_DT.dmi'
				if(src.hair == "Adult Gohan")
			//		src.overlays -= src.hair_icon
				//	src.overlays -= 'Hair - Adult Gohan.dmi'
					src.overlays += 'Hair - Adult Gohan DT.dmi'
				if(src.hair == "Teen Gohan")
			//		src.overlays -= src.hair_icon
					//src.overlays -= 'Hair - Teen Gohan.dmi'
					src.overlays += 'Banto_Kid_Gohan_Hair_DT.dmi'
				if(src.hair == "Future Gohan")
			//		src.overlays -= src.hair_icon
			//		src.overlays -= 'Hair - Future Gohan.dmi'
					src.overlays += 'Hair - Adult Gohan DT.dmi'
				if(src.hair == "Vegeta")
			//		src.overlays -= src.hair_icon
				//	src.overlays -= 'Hair - Vegeta.dmi'
					src.overlays += 'Hair_-_Vegeta_Super_Saiyan_-_Ruination_DT.dmi'
				if(src.hair == "Trunks Long")
			//		src.overlays -= src.hair_icon
				//	src.overlays -= 'Hair - Trunks Long.dmi'
					src.overlays += 'Hair_-_Trunks_Long_DT.dmi'
				if(src.hair == "Raditz")
			//		src.overlays -= src.hair_icon
					//src.overlays -= 'Hair - Raditz.dmi'
					src.overlays += 'Hair_-_Raditz_SSJ_Rose_DT.dmi'
				if(src.hair == "Female Long")
			//		src.overlays -= src.hair_icon
			//		src.overlays -= 'Hair_FemaleLong.dmi'
					src.overlays += 'Hair_FemaleLongSSj_DT.dmi'
				if(src.hair == "Female Ponytail")
			//		src.overlays -= src.hair_icon
			//		src.overlays -= 'HairFemalePonytail.dmi'
					src.overlays += 'HairFemalePonytail_Ssj_DT.dmi'
*/
				src.form_3 = 1
				src.frozen = 0
				src.doing = 0
				//spawn(2) src.BuffReapply()
				return
mob
	proc
		DemonTransMaleTwo(form as num)
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

				src.power_maxm += (17+(src.trans_lvl/4))
				src.ki_maxm += (17+(src.trans_lvl/4))
				src.kidefense_maxm += (17+(src.trans_lvl/4))
				src.strength_maxm += (17+(src.trans_lvl/4))
				src.defence_maxm += (17+(src.trans_lvl/4))
				src.speed_maxm += (12+(src.trans_lvl/4))

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
				src.icon = 'Demon - Form 2.dmi'
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

				src.power_maxm += (36+(src.trans_lvl/4))
				src.ki_maxm += (36+(src.trans_lvl/4))
				src.kidefense_maxm += (33+(src.trans_lvl/4))
				src.strength_maxm += (28+(src.trans_lvl/4))
				src.defence_maxm += (26+(src.trans_lvl/4))
				src.speed_maxm += (26+(src.trans_lvl/4))

				src.trans_exp += round(5+(src.level/1000))
				src.transsexp += round(8+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(6+(src.level/750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Demon - Form 3.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays += 'Elec Demon 1.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
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

				src.power_maxm += (75+(src.trans_lvl/4))
				src.ki_maxm += (75+(src.trans_lvl/4))
				src.kidefense_maxm += (70+(src.trans_lvl/4))
				src.strength_maxm += (58+(src.trans_lvl/4))
				src.defence_maxm += (56+(src.trans_lvl/4))
				src.speed_maxm += (56+(src.trans_lvl/4))

				src.trans_exp += round(6+(src.level/1000))
				src.transsexp += round(10+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(8+(src.level/750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Demon - Form 4.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 1.dmi'
				src.overlays += 'Elec Black.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,7))
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

				src.power_maxm += (100+(src.trans_lvl/4))
				src.ki_maxm += (100+(src.trans_lvl/4))
				src.kidefense_maxm += (105+(src.trans_lvl/4))
				src.strength_maxm += (76+(src.trans_lvl/4))
				src.defence_maxm += (75+(src.trans_lvl/4))
				src.speed_maxm += (74+(src.trans_lvl/4))

				src.trans_exp += round(7+(src.level/1000))
				src.transsexp += round(12+(src.level/500))
				src.Trans_Level()
				src.Trans_Speed()
				src.ki_con_exp += round(10+(src.level/750))
				src.Ki_Con_Level()
				src.icon_state = ""
				src.icon = 'Demon - Form 5.dmi'
				src.underlays -= src.underlays
				src.overlays -= src.aura
				src.Big_Aura()
				src.overlays -= 'Elec Demon 2.dmi'
				src.overlays += 'Elec Demon 3.dmi'
				src.BlueLightningEffect()
				Explode(new /Effect/BasicBoom(src.loc,1,9))
				src.form_4 = 1
				src.prince = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				//spawn(2) src.BuffReapply()
				return
mob/proc
	DemonTrans()
		if(src.gene=="Vile")
			src.pickingtrans = 0
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000  && src.corrupts >= 1000)
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
					//100

					src.powerlevel_max *= 8.5
					src.ki_max *= 8.5
					src.kidefense_max *= 8.5
					src.strength_max *= 8.5
					src.defence_max *= 8.5
					src.speed_max *= 8.5

					src.overlays += 'Elec Red Big.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.icon = 'Demon - Form 3.dmi'
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
					if(src.powerlevel_max >= 30000000)
						if(src.karma == "Evil" && src.karma_rating >= 95)
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


							src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
							src.ki = round((src.ki_control * src.ki_max)/100)
							src.kidefense = round((src.ki_control * src.kidefense_max)/100)
							src.strength = round((src.ki_control * src.strength_max)/100)
							src.defence = round((src.ki_control * src.defence_max)/100)
							src.speed = round((src.ki_control * src.speed_max)/100)
							var/plg = (3.75+(src.trans_lvl/20))
							var/kig =(3.75+(src.trans_lvl/20))
							var/kidefg = (3.75+(src.trans_lvl/20))
							var/strg = (3.75+(src.trans_lvl/20))
							var/defg = (3.75+(src.trans_lvl/20))

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
							src.overlays -= 'Elec Red Big.dmi'
							src.overlays += 'Elec Black.dmi'
							src.Big_Aura()
							src.icon_state = ""

							src.trans_exp += round(3+(src.level/10000))
							src.transsexp += round(6+(src.level/5000))
							src.Trans_Level()
							src.Trans_Speed()
							src.ki_con_exp += round(3+(src.level/7500))
							src.Ki_Con_Level()
							src.icon = 'Demon - Form 5.dmi'
							src.BlueLightningEffect()
							Explode(new /Effect/BasicBoom(src.loc,1,11))
							src.form_2 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							spawn(10) src.Trans_Gain()
							spawn(35) src.trans_delay=0
							//spawn(2) src.BuffReapply()
							return


/*		if(src.gene=="Vile")
			if(!src.form_1)
				if(src.powerlevel_max >= 425000000  && src.corrupts >= 450)
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
					//100
					//src.melee_max += 12


					src.powerlevel_max *= 28
					src.ki_max *= 25
					src.kidefense_max *= 25
					src.strength_max *= 22.5
					src.defence_max *= 21
					src.speed_max *= 21

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.icon = 'Demon - Form 3.dmi'
					src.overlays += 'Elec Red Big.dmi'
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
					if(src.powerlevel_max >= 7500000000)
						if(src.karma == "Evil" && src.karma_rating >= 100)
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
							src.melee += 12
							src.block += 6
							src.dodge += 10
							src.counter += 12
							src.critical += 12
							src.durability += 10
							//src.ki_control += 8
							src.ki_cast += 10
							src.ki_power += 10
							src.ki_use += 10
							src.ki_res += 10
							src.reflect += 10
							src.weapon += 10
							src.weapon_power += 10
							src.weapon_resistance += 10

							src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
							src.ki = round((src.ki_control * src.ki_max)/100)
							src.kidefense = round((src.ki_control * src.kidefense_max)/100)
							src.strength = round((src.ki_control * src.strength_max)/100)
							src.defence = round((src.ki_control * src.defence_max)/100)
							src.speed = round((src.ki_control * src.speed_max)/100)
							src.powerlevel *= 6+(src.trans_lvl/8)
							src.ki *= 5.7+(src.trans_lvl/8)
							src.kidefense*=5.8+(src.trans_lvl/8)
							src.strength *= 4.8+(src.trans_lvl/8)
							src.defence *= 4.4+(src.trans_lvl/8)
							src.speed *= 4.6+(src.trans_lvl/8)

							src.underlays -= src.underlays
							src.overlays -= src.aura
							src.Big_Aura()
							src.icon_state = ""

							src.trans_exp += round(3+(src.level/10000))
							src.transsexp += round(6+(src.level/5000))
							src.Trans_Level()
							src.Trans_Speed()
							src.ki_con_exp += round(3+(src.level/7500))
							src.Ki_Con_Level()
							src.icon = 'Demon - Form 5.dmi'
							src.overlays -= 'Elec Red Big.dmi'
							src.overlays += 'Elec Demon 3.dmi'
							src.BlueLightningEffect()
							Explode(new /Effect/BasicBoom(src.loc,1,11))
							src.form_2 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							spawn(10) src.Trans_Gain()
							spawn(35) src.trans_delay=0
							return*/

		if(src.gene == "Sinister")
			src.pickingtrans = 0
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000 && src.karma == "Evil" && src.karma_rating >= 50)
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
					//80

					src.powerlevel_max *= 8
					src.ki_max *= 8
					src.kidefense_max *= 8
					src.strength_max *= 8
					src.defence_max *= 8
					src.speed_max *= 8

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.overlays += 'Elec Red Big.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.icon = 'Demon - Form 3.dmi'
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
					if(src.powerlevel_max >= 30000000  && src.karma == "Evil" && src.karma_rating >= 100)
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
						//120


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

						src.overlays -= 'Elec Red Big.dmi'
						src.overlays += 'Elec Demon 3.dmi'
						src.underlays -= src.underlays
						src.overlays -= src.aura
						src.Big_Aura()
						src.icon_state = ""
						src.form_2 = 1
						src.icon = 'Demon - Form 6.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						src.trans_delay=0
						src.spam_delay=0
						spawn(40) src.cant_trans = 0
						return

