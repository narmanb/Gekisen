mob/proc/HumanRevert()
	if(src.gene == "Roshi")
		if(src.form_1||src.transformed)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.transformed = 0
			src.overlays -= 'Elec Human Blue.dmi'

			src.overlays -= 'Elec Human Red.dmi'

			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)
			var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
			var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
			var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
			var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
			var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef
			//src.powerlevel_max = src.powerlevel_max/pd

			src.powerlevel_max = plleft
			src.ki_max = kileft
			src.kidefense_max = kidefleft
			src.strength_max = strleft
			src.defence_max = defleft
			src.powerlevel *= plper
			src.ki *= kiper

			if(src.skin=="darkf"||src.skin=="dark")
				src.icon = 'Male Roshi - Dark.dmi'
			if(src.skin=="whitef"||src.skin=="white")
				src.icon = 'Male Roshi - White.dmi'
			if(src.skin=="tanf"||src.skin=="tan")
				src.icon = 'Male Roshi - Tan.dmi'




			src.Power_Redefine()
		//	src.Skin_Apply()
			src.Hair_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return
		else
			return


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
			src.transformed = 0
			src.overlays -= 'Elec Human Blue.dmi'

			src.overlays -= 'Elec Human Red.dmi'

			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)
			var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
			var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
			var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
			var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
			var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef
			//src.powerlevel_max = src.powerlevel_max/pd

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
	if(src.gene == "Mystic")
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
			src.overlays -= 'Elec Red Big.dmi'
			src.overlays -= 'Elec White.dmi'
			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)
			var/plleft = src.powerlevel_max - (src.trans_pl_gain - src.transOpl)
			var/kileft = src.ki_max - (src.trans_ki_gain - src.transOki)
			var/kidefleft = src.kidefense_max - (src.trans_kidef_gain - src.transOkidef)
			var/strleft = src.strength_max - (src.trans_str_gain - src.transOstr)
			var/defleft = src.defence_max - (src.trans_def_gain - src.transOdef)

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
	if(src.gene == "Majin Incarnate")
		if(src.form_3)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_3 = 0
			src.transformed = 0
			src.overlays -= 'Elec Human Blue.dmi'
			src.overlays -= 'Elec Human Red.dmi'
			var/plper = (src.powerlevel / src.powerlevel_max)
			var/kiper = (src.ki / src.ki_max)

			/*
			var/plleft = src.powerlevel_max - (src.trans_pl_gain - src.transOpl)
			var/kileft = src.ki_max - (src.trans_ki_gain - src.transOki)
			var/kidefleft = src.kidefense_max - (src.trans_kidef_gain - src.transOkidef)
			var/strleft = src.strength_max - (src.trans_str_gain - src.transOstr)
			var/defleft = src.defence_max - (src.trans_def_gain - src.transOdef)
*/

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
	if(src.gene == "Bloodthirsty")
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

			src.Skin_Apply()
			src.Hair_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return
		else
			return