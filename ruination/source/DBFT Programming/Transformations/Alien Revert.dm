mob/proc/AlienRevert()
	if(src.gene == "Hitman")
		return
	if(src.form_1||src.transformed)
		src.frozen = 1
		src.icon_state = "enrage"
		sleep(10)
		src.doing = 0
		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.transformed = 0
		src.overlays -= src.aura
		src.aura = 0
		src.overlays -= 'Elec Blue Small.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.overlays -= 'Elec White.dmi'
		src.overlays -= 'Elec Green Big.dmi'
		src.overlays -= 'Elec Red Big.dmi'
		src.overlays -= 'Elec Blue Big.dmi'
		src.overlays -= 'Elec Blackred.dmi'
		var/plper = (src.powerlevel / src.powerlevel_max)
		var/kiper = (src.ki / src.ki_max)
		//var/plleft = (src.powerlevel_max - src.trans_pl_gain) + src.transOpl
		var/kileft = (src.ki_max - src.trans_ki_gain) + src.transOki
		var/kidefleft = (src.kidefense_max - src.trans_kidef_gain) + src.transOkidef
		var/strleft = (src.strength_max - src.trans_str_gain) + src.transOstr
		var/defleft = (src.defence_max - src.trans_def_gain) + src.transOdef
		src.calcmaxpl()
		//src.powerlevel_max = plleft
		src.ki_max = kileft
		src.kidefense_max = kidefleft
		src.strength_max = strleft
		src.defence_max = defleft
		src.powerlevel *= plper
		src.ki *= kiper
		if(src.gene == "Moro")
			src.icon = 'Moro Base.dmi'
		if(src.gene == "Kamenian")
			src.icon = 'Kamenian.dmi'
		if(src.gene == "Rebrianne")
			src.icon = 'rebrianne1.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		return
	else
		return