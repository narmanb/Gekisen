mob
	var
		inverted=0
		learn_IP = 0
		invertlvl = 0
		invertexp = 0
		inverttnl = 25
		invertm = 0
		invertspd = 0
		invertsexp = 0
		invertstnl = 25
		invertsm = 0
		first_invert = 0
		invertdelay = 51
		tmp/invertmenu=0

obj/Technique/InvertPower
	verb/Invert_Power()
		set category = "Combat"
		if(usr.doing)
			return
		if(usr.kaioken)
			return
		if(usr.KO)
			return
		if(usr.trans_delay)
			usr << "Your body is still recovering from transforming."
			return
		if(usr.doing||usr.transformed||usr.inverted||usr.invertmenu)
			return
		usr.invertmenu=1
		if(usr.powerlevel_max > usr.powerlevel_saved) usr.powerlevel_saved = usr.powerlevel_max
		if(usr.ki_max > usr.ki_saved) usr.ki_saved = usr.ki_max
		if(usr.strength_max > usr.strength_saved) usr.strength_saved = usr.strength_max
		if(usr.defence_max > usr.defence_saved) usr.defence_saved = usr.defence_max

		var/list/menu = list()
		if(usr.level >= 20000) menu += "Invert 1"
		if(usr.level >= 60000) menu += "Invert 2"
		if(usr.level >= 150000) menu += "Invert 3"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Invert 1")
				usr.invertmenu=0

				var/fn = 1
				usr.InvertForm(fn)
			if("Invert 2")
				usr.invertmenu=0
				var/fn = 2
				usr.InvertForm(fn)
			if("Invert 3")
				usr.invertmenu=0
				var/fn = 3
				usr.InvertForm(fn)


			if("Cancel")
				usr.invertmenu=0
				return
mob
	proc
		InvertForm(form as num)
			usr.transOpl = usr.powerlevel_max //only include these
			usr.transOki = usr.ki_max //on first form
			usr.transOkidef = usr.kidefense_max
			usr.transOstr = usr.strength_max
			usr.transOdef = usr.defence_max
			if(form==1)
				usr.inverted = 1
				usr.form_1 = 1
				usr.safe = 1
				usr.doing = 1
				usr.icon_state = "enrage"
				if(usr.trans1t!="")
					view(12)<<"\white[usr]: \font [usr.trans1t]"
				usr.frozen = 1
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/3)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/3)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/3)

				usr.melee = (usr.melee_max+usr.melee_bonus)
				usr.block = (usr.block_max+usr.block_bonus)
				usr.dodge = (usr.dodge_max+usr.dodge_bonus)
				usr.counter = (usr.counter_max+usr.counter_bonus)
				usr.critical = (usr.critical_max+usr.critical_bonus)
				usr.durability = (usr.durability_max+usr.durability_bonus)
				usr.ki_control = (usr.ki_control_max+usr.ki_control_bonus)
				usr.ki_cast = (usr.ki_cast_max+usr.ki_cast_bonus)
				usr.ki_power = (usr.ki_power_max+usr.ki_power_bonus)
				usr.ki_use = (usr.ki_use_max+usr.ki_use_bonus)
				usr.ki_res = (usr.ki_res_max+usr.ki_res_bonus)
				usr.reflect = (usr.reflect_max+usr.reflect_bonus)
				usr.weapon = (usr.weapon_max+usr.weapon_bonus)
				usr.weapon_power = (usr.weapon_power_max+usr.weapon_power_bonus)
				usr.weapon_resistance = (usr.weapon_resistance_max+usr.weapon_res_bonus)
				//50


				usr.powerlevel = round((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = round((usr.ki_control * usr.ki_max)/100)
				usr.kidefense = round((usr.ki_control * usr.kidefense_max)/100)
				usr.strength = round((usr.ki_control * usr.strength_max)/100)
				usr.defence = round((usr.ki_control * usr.defence_max)/100)
				usr.speed = round((usr.ki_control * usr.speed_max)/100)

				var/plg = (5+(usr.invertlvl/20))
				var/kig =(5+(usr.invertlvl/20))
				var/kidefg = (5+(usr.invertlvl/20))
				var/strg = (5+(usr.invertlvl/20))
				var/defg = (5+(usr.invertlvl/20))


				usr.transOpl = usr.powerlevel_max //only include these
				usr.transOki = usr.ki_max //on first form
				usr.transOkidef = usr.kidefense_max
				usr.transOstr = usr.strength_max
				usr.transOdef = usr.defence_max



				usr.trans_pl_gain = plg * usr.powerlevel_max
				usr.trans_ki_gain = kig * usr.ki_max
				usr.trans_kidef_gain = kidefg * usr.kidefense_max
				usr.trans_str_gain = strg * usr.strength_max
				usr.trans_def_gain = defg * usr.defence_max

				usr.powerlevel_max *= plg
				usr.ki_max *= kig
				usr.kidefense_max *= kidefg
				usr.strength_max *= strg
				usr.defence_max *= defg

				usr.invertexp += round(3+(usr.level/6000))
				usr.invertsexp += round(6+(usr.level/3000))
				usr.Invert_Level()
				usr.Invert_Speed()
				usr.ki_con_exp += round(4+(usr.level/4000))
				usr.Ki_Con_Level()
				spawn(10)usr.Invertgain()
				usr.icon_state = ""
				usr.overlays += 'Elec White Small.dmi'
				Explode(new /Effect/BasicBoom(usr.loc,1,5))
				usr.Big_Aura()
				usr.aura_on = 1
				usr.frozen = 0
				usr.doing = 0
				usr.safe = 0
			//	spawn(2) usr.BuffReapply()
				return

			if(form==2)
				usr.inverted = 1
				usr.form_2 = 1
				usr.safe = 1
				usr.doing = 1
				usr.icon_state = "enrage"
				if(usr.trans1t!="")
					view(12)<<"\white[usr]: \font [usr.trans1t]"
				usr.frozen = 1
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/4)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/4)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/4)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/4)

				usr.melee = (usr.melee_max+usr.melee_bonus)
				usr.block = (usr.block_max+usr.block_bonus)
				usr.dodge = (usr.dodge_max+usr.dodge_bonus)
				usr.counter = (usr.counter_max+usr.counter_bonus)
				usr.critical = (usr.critical_max+usr.critical_bonus)
				usr.durability = (usr.durability_max+usr.durability_bonus)
				usr.ki_control = (usr.ki_control_max+usr.ki_control_bonus)
				usr.ki_cast = (usr.ki_cast_max+usr.ki_cast_bonus)
				usr.ki_power = (usr.ki_power_max+usr.ki_power_bonus)
				usr.ki_use = (usr.ki_use_max+usr.ki_use_bonus)
				usr.ki_res = (usr.ki_res_max+usr.ki_res_bonus)
				usr.reflect = (usr.reflect_max+usr.reflect_bonus)
				usr.weapon = (usr.weapon_max+usr.weapon_bonus)
				usr.weapon_power = (usr.weapon_power_max+usr.weapon_power_bonus)
				usr.weapon_resistance = (usr.weapon_resistance_max+usr.weapon_res_bonus)
				//100


				usr.powerlevel = round((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = round((usr.ki_control * usr.ki_max)/100)
				usr.kidefense = round((usr.ki_control * usr.kidefense_max)/100)
				usr.strength = round((usr.ki_control * usr.strength_max)/100)
				usr.defence = round((usr.ki_control * usr.defence_max)/100)
				usr.speed = round((usr.ki_control * usr.speed_max)/100)
				var/plg = (20+(usr.invertlvl/20))
				var/kig =(20+(usr.invertlvl/20))
				var/kidefg = (20+(usr.invertlvl/20))
				var/strg = (20+(usr.invertlvl/20))
				var/defg = (20+(usr.invertlvl/20))

				//usr.transOpl = usr.powerlevel_max - usr.transOpl //only include these
				//usr.transOki = usr.ki_max //on first form
			//	usr.transOkidef = usr.kidefense_max
			//	usr.transOstr = usr.strength_max
			//	usr.transOdef = usr.defence_max
//						usr.transOpl = usr.trans_pl_gain - usr.transOpl
			//	world << "<font color = blue>transOpl before: [applycommas(usr.transOpl)]"
			//	//usr.transOpl += usr.powerlevel_max - (usr.powerlevel_max - usr.transOpl)  // 10mil =  20mil + (20mil - 10mil)  so = 10mil
			//	usr.transOpl = usr.powerlevel_max - usr.transOpl
			//	world << "<font color = red>transOpl after powerlevelmax - transOpl: [applycommas(usr.transOpl)]"
			//	usr.transOpl = usr.powerlevel_max

//						usr.transOpl = usr.trans_pl_gain - usr.transOpl

				//usr.trans_pl_gain





				usr.trans_pl_gain = plg * usr.powerlevel_max
				usr.trans_ki_gain = kig * usr.ki_max
				usr.trans_kidef_gain = kidefg * usr.kidefense_max
				usr.trans_str_gain = strg * usr.strength_max
				usr.trans_def_gain = defg * usr.defence_max



				usr.powerlevel_max *= plg
				usr.ki_max *= kig
				usr.kidefense_max *= kidefg
				usr.strength_max *= strg
				usr.defence_max *= defg


				usr.invertexp += round(5+(usr.level/6000))
				usr.invertsexp += round(10+(usr.level/3000))
				usr.Invert_Level()
				usr.Invert_Speed()
				usr.ki_con_exp += round(7+(usr.level/4000))
				usr.Ki_Con_Level()
				usr.icon_state = ""
				usr.overlays -= 'Elec White Small.dmi'
				usr.overlays += 'Elec White.dmi'
				Explode(new /Effect/BasicBoom(usr.loc,1,7))
				usr.frozen = 0
				usr.doing = 0
				usr.safe = 0
			//	spawn(2) usr.BuffReapply()
				return

			if(form==3)

				usr.inverted = 1
				usr.form_3 = 1
				usr.safe = 1
				usr.doing = 1
				usr.icon_state = "enrage"
				if(usr.trans1t!="")
					view(12)<<"\white[usr]: \font [usr.trans1t]"
				usr.frozen = 1
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/5)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/5)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/5)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/5)
				usr.BlueLightningEffect()
				sleep(usr.invertdelay/5)

				usr.melee = (usr.melee_max+usr.melee_bonus)
				usr.block = (usr.block_max+usr.block_bonus)
				usr.dodge = (usr.dodge_max+usr.dodge_bonus)
				usr.counter = (usr.counter_max+usr.counter_bonus)
				usr.critical = (usr.critical_max+usr.critical_bonus)
				usr.durability = (usr.durability_max+usr.durability_bonus)
				usr.ki_control = (usr.ki_control_max+usr.ki_control_bonus)
				usr.ki_cast = (usr.ki_cast_max+usr.ki_cast_bonus)
				usr.ki_power = (usr.ki_power_max+usr.ki_power_bonus)
				usr.ki_use = (usr.ki_use_max+usr.ki_use_bonus)
				usr.ki_res = (usr.ki_res_max+usr.ki_res_bonus)
				usr.reflect = (usr.reflect_max+usr.reflect_bonus)
				usr.weapon = (usr.weapon_max+usr.weapon_bonus)
				usr.weapon_power = (usr.weapon_power_max+usr.weapon_power_bonus)
				usr.weapon_resistance = (usr.weapon_resistance_max+usr.weapon_res_bonus)
				//150
	//			usr.transOpl = usr.trans_pl_gain - usr.transOpl


				usr.powerlevel = round((usr.ki_control * usr.powerlevel_max)/100)
				usr.ki = round((usr.ki_control * usr.ki_max)/100)
				usr.kidefense = round((usr.ki_control * usr.kidefense_max)/100)
				usr.strength = round((usr.ki_control * usr.strength_max)/100)
				usr.defence = round((usr.ki_control * usr.defence_max)/100)
				usr.speed = round((usr.ki_control * usr.speed_max)/100)

			//	world << "<font color = blue>transOpl before: [applycommas(usr.transOpl)]"
			//	//usr.transOpl += usr.powerlevel_max - (usr.powerlevel_max - usr.transOpl)  // 60mil =  20mil + (20mil - 10mil)  so = 10mil
			//	usr.transOpl = usr.powerlevel_max - usr.transOpl
			//	world << "<font color = red>transOpl after powerlevelmax - transOpl: [applycommas(usr.transOpl)]"

				var/plg = (40+(usr.invertlvl/20))
				var/kig =(40+(usr.invertlvl/20))
				var/kidefg = (40+(usr.invertlvl/20))
				var/strg = (40+(usr.invertlvl/20))
				var/defg = (40+(usr.invertlvl/20))

				usr.trans_pl_gain = plg * usr.powerlevel_max
				usr.trans_ki_gain = kig * usr.ki_max
				usr.trans_kidef_gain = kidefg * usr.kidefense_max
				usr.trans_str_gain = strg * usr.strength_max
				usr.trans_def_gain = defg * usr.defence_max


				usr.powerlevel_max *= plg
				usr.ki_max *= kig
				usr.kidefense_max *= kidefg
				usr.strength_max *= strg
				usr.defence_max *= defg


				usr.invertexp += round(7+(usr.level/6000))
				usr.invertsexp += round(12+(usr.level/3000))
				usr.Invert_Level()
				usr.Invert_Speed()
				usr.ki_con_exp += round(10+(usr.level/4000))
				usr.Ki_Con_Level()
				usr.icon_state = ""
				usr.overlays -= 'Elec White.dmi'
				usr.overlays += 'Elec Black.dmi'
				Explode(new /Effect/BasicBoom(usr.loc,1,9))
				usr.frozen = 0
				usr.doing = 0
				usr.safe = 0
			//	spawn(2) usr.BuffReapply()
				return

mob/proc/InvertRevert()
	if(usr.KO)
		return
	if(usr.inverted)
		usr.frozen = 1
		usr.icon_state = "enrage"
		sleep(10)
		usr.inverted = 0
		usr.aura_on = 0
		usr.underlays -= usr.underlays
		usr.overlays -= usr.aura
		usr.overlays -= 'Kaio Aura.dmi'
		usr.aura_on = 0
		usr.overlays -= 'Elec White Small.dmi'
		usr.overlays -= 'Elec White.dmi'
		usr.overlays -= 'Elec Black.dmi'

		var/plper = (src.powerlevel / src.powerlevel_max)
		var/kiper = (src.ki / src.ki_max)


	//	var/plleft = src.powerlevel_max - (src.trans_pl_gain - src.transOpl)
	//	var/kileft = src.ki_max - (src.trans_ki_gain - src.transOki)
	//	var/kidefleft = src.kidefense_max - (src.trans_kidef_gain - src.transOkidef)
	//	var/strleft = src.strength_max - (src.trans_str_gain - src.transOstr)
	//	var/defleft = src.defence_max - (src.trans_def_gain - src.transOdef)


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

		//usr.Power_Redefine()
		src.powerdown(30)
		oview() << "[usr.name] has reverted from his Transformed state."
		usr.icon_state = ""
		usr.frozen = 0
		usr.doing = 0
		usr.trans_delay = 1
		usr.form_1 = 0
		usr.form_2 = 0
		usr.form_3 = 0
		usr.boxing = 0
		usr.focus_boxing = 0
		spawn(35)usr.trans_delay = 0

		return
	else
		return

mob/proc/Invertgain()
	if(usr.inverted == 1)
		if(usr.form_3 == 1)
			usr.invertexp += rand(4,5)
			usr.Invert_Level()
			spawn(1800-(usr.invertlvl*17))usr.Invertgain()
			return
		else
			if(usr.form_2 == 1)
				usr.invertexp += rand(5,6)
				usr.Invert_Level()
				spawn(1800-(usr.invertlvl*17))usr.Invertgain()
				return
			else
				if(usr.form_1 == 1)
					usr.invertexp += rand(6,7)
					usr.Invert_Level()
					spawn(1800-(usr.invertlvl*17))usr.Invertgain()
					return
	else
		return

mob/proc/Invert_Level()
	if(usr.invertlvl < 100)
		if(usr.invertexp >= inverttnl)
			usr.invertlvl ++
			usr.invertexp -= inverttnl
			usr.inverttnl += round(usr.inverttnl * 0.1)
			usr << "<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#fb0901>:</FONT><FONT COLOR=#f61202>:</FONT><FONT COLOR=#f21b02> </FONT><FONT COLOR=#ed2403>I</FONT><FONT COLOR=#e82d04>n</FONT><FONT COLOR=#e33605>v</FONT><FONT COLOR=#de3f06>e</FONT><FONT COLOR=#da4806>r</FONT><FONT COLOR=#d55107>t</FONT><FONT COLOR=#d05a08> </FONT><FONT COLOR=#cb6309>s</FONT><FONT COLOR=#c66c0a>k</FONT><FONT COLOR=#c2750a>i</FONT><FONT COLOR=#bd7e0b>l</FONT><FONT COLOR=#b8860b>l</FONT><FONT COLOR=#bd7e0b> </FONT><FONT COLOR=#c2750a>i</FONT><FONT COLOR=#c66c0a>n</FONT><FONT COLOR=#cb6309>c</FONT><FONT COLOR=#d05a08>r</FONT><FONT COLOR=#d55107>e</FONT><FONT COLOR=#da4806>a</FONT><FONT COLOR=#de3f06>s</FONT><FONT COLOR=#e33605>e</FONT><FONT COLOR=#e82d04>d</FONT><FONT COLOR=#ed2403>!</FONT><FONT COLOR=#f21b02> </FONT><FONT COLOR=#f61202>:</FONT><FONT COLOR=#fb0901>:</FONT><FONT COLOR=#ff0000>.</FONT> </center>"
	else
		if(!usr.invertm)
			if(usr.invertexp >= inverttnl)
				usr.invertlvl = 100
			//	usr.invertdelay = 1
				usr.invertm = 1
				usr << "<center><FONT COLOR=#48d1cc>.</FONT><FONT COLOR=#50c5c1>:</FONT><FONT COLOR=#57b9b5>:</FONT><FONT COLOR=#5faca8> </FONT><FONT COLOR=#67a09c>I</FONT><FONT COLOR=#6e9390>n</FONT><FONT COLOR=#768784>v</FONT><FONT COLOR=#7e7a78>e</FONT><FONT COLOR=#856d6b>r</FONT><FONT COLOR=#8d615f>t</FONT><FONT COLOR=#945453> </FONT><FONT COLOR=#9c4847>s</FONT><FONT COLOR=#a43b3a>k</FONT><FONT COLOR=#ab2f2e>i</FONT><FONT COLOR=#b22222>l</FONT><FONT COLOR=#ac2e2d>l</FONT><FONT COLOR=#a53939> </FONT><FONT COLOR=#9e4544>M</FONT><FONT COLOR=#965150>A</FONT><FONT COLOR=#8f5d5b>S</FONT><FONT COLOR=#886866>T</FONT><FONT COLOR=#817472>E</FONT><FONT COLOR=#7a807d>R</FONT><FONT COLOR=#738c89>E</FONT><FONT COLOR=#6c9794>D</FONT><FONT COLOR=#65a39f>!</FONT><FONT COLOR=#5dafab> </FONT><FONT COLOR=#56bbb6>:</FONT><FONT COLOR=#4fc6c2>:</FONT><FONT COLOR=#48d1cc>.</FONT></center>"
		else
			return

mob/proc/Invert_Speed()
	if(usr.invertspd < 100)
		if(usr.invertsexp >= invertstnl)
			usr.invertspd ++
			usr.invertsexp -= invertstnl
			usr.invertstnl += round(usr.invertstnl * 0.1)
			usr.invertdelay -= 0.5
			usr << "<center><FONT COLOR=#0000cd>.</FONT><FONT COLOR=#0f0fce>:</FONT><FONT COLOR=#1d1dcf>:</FONT><FONT COLOR=#2c2cd0> </FONT><FONT COLOR=#3b3bd1>I</FONT><FONT COLOR=#4a4ad2>n</FONT><FONT COLOR=#5858d3>v</FONT><FONT COLOR=#6767d4>e</FONT><FONT COLOR=#7676d6>r</FONT><FONT COLOR=#8585d7>t</FONT><FONT COLOR=#9393d8> </FONT><FONT COLOR=#a2a2d9>s</FONT><FONT COLOR=#b1b1da>p</FONT><FONT COLOR=#c0c0db>e</FONT><FONT COLOR=#cecedc>e</FONT><FONT COLOR=#dcdcdc>d</FONT><FONT COLOR=#cecedc> </FONT><FONT COLOR=#c0c0db>i</FONT><FONT COLOR=#b1b1da>n</FONT><FONT COLOR=#a2a2d9>c</FONT><FONT COLOR=#9393d8>r</FONT><FONT COLOR=#8585d7>e</FONT><FONT COLOR=#7676d6>a</FONT><FONT COLOR=#6767d4>s</FONT><FONT COLOR=#5858d3>e</FONT><FONT COLOR=#4a4ad2>d</FONT><FONT COLOR=#3b3bd1>!</FONT><FONT COLOR=#2c2cd0> </FONT><FONT COLOR=#1d1dcf>:</FONT><FONT COLOR=#0f0fce>:</FONT><FONT COLOR=#0000cd>.</FONT> </center>"
	else
		if(!usr.invertsm)
			if(usr.invertsexp >= invertstnl)
				usr.invertspd = 100
				usr.invertdelay = 1
				usr.invertsm = 1
				usr.invertspd = 1
				usr << "<center><FONT COLOR=#6a5acd>.</FONT><FONT COLOR=#6367be>:</FONT><FONT COLOR=#5b74ae>:</FONT><FONT COLOR=#52809e> </FONT><FONT COLOR=#4a8d8f>I</FONT><FONT COLOR=#429a7f>n</FONT><FONT COLOR=#3aa76f>v</FONT><FONT COLOR=#31b35f>e</FONT><FONT COLOR=#29c04f>r</FONT><FONT COLOR=#21cd3f>t</FONT><FONT COLOR=#19da30> </FONT><FONT COLOR=#10e620>s</FONT><FONT COLOR=#08f310>p</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#08f310>e</FONT><FONT COLOR=#10e620>d</FONT><FONT COLOR=#19da30> </FONT><FONT COLOR=#21cd3f>M</FONT><FONT COLOR=#29c04f>a</FONT><FONT COLOR=#31b35f>x</FONT><FONT COLOR=#3aa76f>e</FONT><FONT COLOR=#429a7f>d</FONT><FONT COLOR=#4a8d8f>!</FONT><FONT COLOR=#52809e> </FONT><FONT COLOR=#5b74ae>:</FONT><FONT COLOR=#6367be>:</FONT><FONT COLOR=#6a5acd>.</FONT></center>"
		else
			return

mob/proc/Invert_Upkeep()
	var/amount1 = round(50000 - (src.invertlvl * 450))
	var/amount2 = round(1500000 - (src.invertlvl * 14500))
	var/amount3 = round(15000000 - (src.invertlvl * 145000))

	if(src.majin == 1)
		return

	if(src.form_1 == 0)
		return
	else
		if(src.form_1 == 1)
			if(amount1 >= 0)
				src.ki -= amount1
			else
				return
		if(src.form_2 == 1)
			if(amount2 >= 0)
				src.ki -= amount2
			else
				return
		if(src.form_3 == 1)
			if(amount3 >= 0)
				src.ki -= amount3
			else
				return

		if(src.ki < 1000)
			src.InvertRevert()
			return
		else
			spawn(50) src.Invert_Upkeep()