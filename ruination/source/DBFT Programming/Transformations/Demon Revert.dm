mob/proc/DemonRevert()
	if(src.gene == "Fomhoire")
		if(src.transformed)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.transformed = 0
			src.overlays -= 'Elec Demon 1.dmi'
			src.overlays -= 'Elec Black.dmi'
			src.overlays -= 'Elec Demon 3.dmi'
			src.overlays -= 'Elec Human Red.dmi'
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

			src.icon = 'Demon - Form 4.dmi'
			src.DemonHair_Remove()
			src.Power_Redefine()
			//src.Skin_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return
	if(src.gene == "Malevolent")
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
			src.overlays -= 'Elec Demon 1.dmi'
			src.overlays -= 'Elec Black.dmi'
			src.overlays -= 'Elec Demon 3.dmi'
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
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return


	if(src.gene == "Vile")
		if(src.form_2)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_2 = 0

			src.overlays -= 'Elec Black.dmi'
			src.overlays += 'Elec Red Big.dmi'
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
			oview() << "[src.name] has reverted from his Demon Form."
			src.icon_state = ""
			src.icon = 'Demon - Form 3.dmi'
			src.frozen = 0
			return
		else
			return
	else
		return
/*
	if(src.gene == "Vile")
		if(src.form_2)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_2 = 0
			src.icon = 'Demon - Form 3.dmi'
			src.transformed = 0
			src.overlays -= 'Elec Demon 1.dmi'
			src.overlays -= 'Elec Black.dmi'
			src.overlays -= 'Elec Demon 3.dmi'
			src.Power_Redefine()
			src.Skin_Apply()
			oview() << "[src.name] has reverted from his Transformed state."
			src.icon_state = ""
			src.frozen = 0
			return
		else
			return
	else
		return*/