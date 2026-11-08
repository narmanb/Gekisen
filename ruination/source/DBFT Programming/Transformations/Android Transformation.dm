/*
					src.powerlevel_max *= 11
					src.ki_max *= 9
					src.kidefense_max *= 10
					src.strength_max *= 8.5
					src.defence_max *= 7
					src.speed_max *= 7
These lines are the multis^^
You want to go to the last form for the src.gene, find this section and work backwards adding up the last form and so on to get a total _max amount for each stat.,
ie. mechanical android has powerlevel_max values of *=11 and *=15 therefore mechanical powerlevel trans multi is a total of 11*15=165, where as bionic has one trans multi
of 250x.
This isnt balanced and would need to be a bit less of a discrepancy. Feel free to find a high end, middle end and low end and use the same figures relatively if you want, consider any race bonuses
ie. absorbs, infects, drains etc, these races will need to have slightly lower muultis.


The transformation buffs are in the transformation folder, here it has the reqs for trans after if powerlevel_max>= && chips >=. IF your balancing feel free to change these reqs as well.
The melee max etc can stay the same but change the  powerlevel max etc in the 4th paragraph below. Use basic multiplacation to get the end result and work backwards is easiest.*/
mob/proc/AndroidTrans()
	if(src.doing)
		return
	if(src.cant_trans)
		return
	else
		src.pickingtrans = 0



		if(src.gene=="Gluttonous")
			if(src.transformed)
				return

	//	src.transformed=1

			src.pickingtrans = 1
			var/list/menu = list()
			if(src.level >= 25000) menu += "Form 1"
			if(src.level >= 100000) menu += "Form 2"
			menu += "Cancel"
			switch(input("Which form would you like to transform to?") in menu)
				if("Form 1")
					var/fn = 1
					src.pickingtrans = 0
					src.Android21Trans(fn)
				if("Form 2")
					var/fn = 2
					src.pickingtrans = 0
					src.Android21Trans(fn)
				if("Cancel")
					src.pickingtrans = 0
					src.transformed = 0
					return

		//	src.Android21Trans()
		if(src.gene=="Mechanical")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000  && src.chips >= 50)
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

//trans adjust
					src.powerlevel_max *= 6
					src.ki_max *= 6
					src.kidefense_max *= 6
					src.strength_max *= 6
					src.defence_max *= 6
					src.speed_max *= 6

					src.overlays += 'Elec Light Blue.dmi'
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
					src.icon = 'AndroidForm9.dmi'
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
					if(src.powerlevel_max >= 30000000  && src.chips >= 100)
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


//trans adjust
						src.powerlevel_max *= 13.3
						src.ki_max *= 13.3
						src.kidefense_max *= 13.3
						src.strength_max *= 13.3
						src.defence_max *= 13.3
						src.speed_max *= 13.3

						src.overlays -= 'Elec Light Blue.dmi'
						src.overlays += 'Elec Light Blue.dmi'
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
						src.form_2 = 1
						src.icon = 'AndroidForm5.dmi'
						src.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(src.loc,1,11))
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						src.trans_delay=0
						src.spam_delay=0
						spawn(40) src.cant_trans = 0
						return

		if(src.gene=="Bionic")
			if(!src.form_1)
				if(src.powerlevel_max >= 35000000  && src.chips >= 100)
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
					//200

//trans adjust
					src.powerlevel_max *= 85
					src.ki_max *= 85
					src.kidefense_max *= 85
					src.strength_max *= 85
					src.defence_max *= 85
					src.speed_max *= 85

					src.overlays += 'Elec Light Blue.dmi'
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
					src.icon = 'AndroidForm5.dmi'
					src.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(src.loc,1,11))
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					src.trans_delay=0
					src.spam_delay=0
					spawn(40) src.cant_trans = 0
					return



mob
	proc
		Android21Trans(form as num)
			src.transOpl = src.powerlevel_max //only include these
			src.transOki = src.ki_max //on first form
			src.transOkidef = src.kidefense_max
			src.transOstr = src.strength_max
			src.transOdef = src.defence_max

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


				src.weapon += 10
				src.weapon_power += 10
				src.weapon_resistance += 10


				src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
				src.ki = round((src.ki_control * src.ki_max)/100)
				src.kidefense = round((src.ki_control * src.kidefense_max)/100)
				src.strength = round((src.ki_control * src.strength_max)/100)
				src.defence = round((src.ki_control * src.defence_max)/100)
				src.speed = round((src.ki_control * src.speed_max)/100)

				var/plg = (24+(src.trans_lvl/20))
				var/kig =(24+(src.trans_lvl/20))
				var/kidefg = (24+(src.trans_lvl/20))
				var/strg = (24+(src.trans_lvl/20))
				var/defg = (24+(src.trans_lvl/20))

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
				if(src.gender2 == "female")
					if(src.karma == "Good")
						src.icon='Android 21 Female trans good.dmi'
					else
						src.icon='Android 21 Female trans evil.dmi'
				if(src.gender2 == "male")
					if(src.karma == "Good")
						src.icon='Male - Android 21 trans.dmi'
					else
						src.icon='Male - Android 21 trans evil.dmi'



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
			//	src.HHair_Apply()
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
				var/kig =(58+(src.trans_lvl/20))
				var/kidefg = (55+(src.trans_lvl/20))
				var/strg = (58+(src.trans_lvl/20))
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
				if(src.gender2 == "female")
					if(src.karma == "Good")
						src.icon='A21FemaleGood2.dmi'
					else
						src.icon='A21FemaleEvil2.dmi'
				if(src.gender2 == "male")
					if(src.karma == "Good")
						src.icon='A21MaleGood2.dmi'
					else
						src.icon='A21MaleEvil2.dmi'



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
			//	src.HHair_Apply()
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

mob/proc/AndroidRevert()
	//alert("form 1 [src.form_1]  transformed [src.transformed] ONE")
	if(src.gene == "Gluttonous")
		if(src.form_1)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.transformed = 0
			src.overlays -= 'Elec Blackred.dmi'
			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)

			var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
			var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
			var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
			var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
			var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef

			/*
			var/plleft = src.powerlevel_max - (src.trans_pl_gain - src.transOpl)
			var/kileft = src.ki_max - (src.trans_ki_gain - src.transOki)
			var/kidefleft = src.kidefense_max - (src.trans_kidef_gain - src.transOkidef)
			var/strleft = src.strength_max - (src.trans_str_gain - src.transOstr)
			var/defleft = src.defence_max - (src.trans_def_gain - src.transOdef)
*/
			src.powerlevel_max = plleft
			src.ki_max = kileft
			src.kidefense_max = kidefleft
			src.strength_max = strleft
			src.defence_max = defleft
			src.powerlevel *= plper
			src.ki *= kiper

			src.Power_Redefine()
			if(src.gender2 == "female")
				if(src.skin=="tanf21")
					src.icon = 'Android 21 Female - Tan.dmi'
				if(src.skin=="whitef21")
					src.icon = 'Android 21 Female - White.dmi'
				if(src.skin=="darkf21")
					src.icon = 'Android 21 Female - Dark.dmi'
			else
				if(src.skin=="tanm21")
					src.icon = 'Male - Android 21 Tan.dmi'
				if(src.skin=="whitem21")
					src.icon = 'Male - Android 21.dmi'
				if(src.skin=="darkm21")
					src.icon = 'Male - Android 21 Dark.dmi'


			//src.Skin_Apply()
		//	src.Hair_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
		//	alert("form 1 [src.form_1]  transformed [src.transformed] TWO")
			return