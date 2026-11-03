mob/proc/BioRevert()
	if(src.form_3)
		if(!src.inverted)
			src.frozen = 1
			src.icon_state = "enrage"
			sleep(10)
			src.doing = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.overlays -= 'Elec Blue Small.dmi'
			src.overlays -= 'Elec Blue Big.dmi'
			src.overlays -= 'Elec Red Big.dmi'
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
			oview() << "[src.name] has reverted from his Power Weighted Form."
			src.icon_state = ""
		//	src.icon = 'Bio Android - Form 3.dmi'
			if(src.skin=="green")
				src.icon = 'Bio Android - Form 3.dmi'
			else
				src.icon = 'Bio Android Blue - Form 3.dmi'
			src.frozen = 0
			return
	else
		return