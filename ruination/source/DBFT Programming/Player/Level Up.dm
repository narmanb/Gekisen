mob
	var
		level_tp = 0
		level_chance = 0
		spam_lvl = 0
		stam_up = 2
		zpup = 2
		expup = 0
		lvluphold = 0
mob/var/tmp/calledlvlup=0
mob/var/tmp/bankCanDoQuest=0

mob/proc/Level_Up()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.calledlvlup)
		return
	if(src.lvluphold)
		return

	while(src.exp >= src.tnl)
		var/ki_gain = rand(1,4) + ((src.level * 0.1)  * (src.ki_multi/5))
		//var/kid_gain = rand(1,4) + ((src.level * 0.01)  * (src.kidefense_multi)) + src.kidefense_bonus
		var/str_gainlvlup = rand(1,4) + ((src.level * 0.1) * (src.strength_multi/5))
		var/def_gainlvlup = rand(1,4) + ((src.level * 0.1) * (src.defence_multi/5))
	//	var/spd_gain = round(rand(1,5) + ((src.level * 0.04) * (src.speed_multi))+ src.speed_bonus)
	//	power_gain = (power_gain/2)+rand(src.power_multi,src.power_multi*2)
		ki_gain = (ki_gain/2)
	//	kid_gain = (kid_gain/2)+rand(1,3)
		str_gainlvlup = (str_gainlvlup/2)
		def_gainlvlup = (def_gainlvlup/2)


				// pl = pl * (src.power_multi/5)

	//	var/pg = power_gain/10000
		var/kg = ki_gain/10000
	//	var/kdg = kid_gain/10000
		var/sg = str_gainlvlup/10000
		var/dg = def_gainlvlup/10000

	//	pg = pg * 10000
	//	kg = kg * 10000
	//	kdg = kdg * 10000
	//	sg = sg * 10000
	//	dg = dg * 10000
	//	world << "[num2text(pg,100)] [num2text(kg,100)] [num2text(sg,100)]"
//		power_gain =
	//	pg = num2text(pg,100)
	//	kg = num2text(kg,100)

		src.exp-=src.tnl
		src.level++
		src.zpup ++
		src.level_chance++
		src.spam_lvl++
		if(src.lvls_on == 1)
			src << output("<font size = 1><font color = #0066FF><b>Level up! You are now level [applycommas(src.level)]</b><br>\
			Ki + [applycommas(ki_gain)]<br>\
			Strength + [applycommas(str_gainlvlup)]<br>Defense + [applycommas(def_gainlvlup)]</font>","output2")

		//	src << output("<font size = 1><font color = #0066FF><b>Level up! You are now level [applycommas(src.level)]</b><br>Your Power surges as your Powerlevel + [applycommas(power_gain)]<br>\
		//	Ki + [applycommas(ki_gain)]<br>\
		//	Strength + [applycommas(str_gainlvlup)]<br>Defense + [applycommas(def_gainlvlup)]</font>","output2")
		//	src << output("<font size = 1><font color = white>Your Power surges as your Powerlevel increases +[applycommas(power_gain)]</font>","output2")
		//	src << output("<font size = 1><font color = white>You feel much more energized as your Ki increases +[applycommas(ki_gain)]</font>","output2")
		//	src << output("<font size = 1><font color = white>You feel a surge in your energy as your Ki Defence increases +[applycommas(kid_gain)]</font>","output2")
		//	src << output("<font size = 1><font color = white>Your muscles bulge as your Strength increases +[applycommas(str_gainlvlup)]</font>","output2")
		//	src << output("<font size = 1><font color = white>You feel your body become more durable Defence +[applycommas(def_gainlvlup)]</font>","output2")
	//		src << output("<center><font color = white>You feel lighter and faster Speed +[spd_gain]</font></center>","output2")

		if(src.zpup >= 5000)
			src.zpup = 0
			src.zp += 1
			src << output("<center><Font color=red>You Obtain a Z Points!</font></center>")
/*
		if(src.zpup >= 1500)
			if(prob(src.zpc))
				src.zpup = 0
				src.zp += 2
				src << output("<center><Font color=red>You Obtain 2 Z Points!</font></center>")
			else
				src.zpup = 0
				src.zp ++
				src << output("<center><Font color=red>You Obtain a Z Point!</font></center>")

*/

/*
		src.powerlevel_max += power_gain
		src.ki_max += ki_gain
		src.kidefense_max += kid_gain
		src.strength_max += str_gainlvlup
		src.defence_max += def_gainlvlup
		*/
	//	var/randomnumber = rand(100000,1000000)
	//	world<<"random1: [applycommas(randomnumber)]"
	//	randomnumber += kg
	//	world<<"random2: [applycommas(randomnumber)]"
	//	src.powerlevel_max += pg * 10000
		src.ki_max += kg * 10000
	//	src.kidefense_max += kdg * 10000
		src.strength_max += sg * 10000
		src.defence_max += dg * 10000
	//	src.speed_max += spd_gain
	//	src.stam_up ++
		src.tnl += src.expup

		if(src.level >= src.lastcompleteBankRaid+10000)
			src.BankQuestCanTake=1
		//	src << "Can do bank quest again"
			src.lastcompleteBankRaid = src.level
			if(!src.bankCanDoQuest)
				src.bankCanDoQuest=1
				src << "<font color = yellow><b>You get word that the Bank is about to be robbed..."

		if(src.hudenabled)
			if(!src.calledexphud)
				src.calledexphud = 1
				spawn(50) src.calledexphud = 0
				spawn() src.updateexp()


		if(src.spam_lvl>=50)
			if(CreationSpam.Find("2[src.ckey]"))
				CreationSpam.Remove("2[src.ckey]")
			else
				if(CreationSpam.Find("1[src.ckey]"))
					CreationSpam.Remove("1[src.ckey]")
			src.spam_lvl=0
		if(!src.gone_ssj && src.race == "Saiyan")
			if(src.gene == "Prideful"||src.gene == "Legendary"||src.gene == "Godly")
				src.TrainSSJ()
		src.Skill_Gain()
		src.Exp_Check()
		sleep(1)

	src.calledlvlup=0
//	world << "<b>FIVE"





/*

mob/proc/Level_Up()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.calledlvlup)
		return
	if(src.exp >= src.tnl)
		var/power_gain = round(rand(1,6) + ((src.level * 0.04)  * (src.power_multi))+ src.powerlevel_bonus)
		var/ki_gain = round(rand(1,5) + ((src.level * 0.04)  * (src.ki_multi))+ src.ki_bonus)
		var/kid_gain = round(rand(1,5) + ((src.level * 0.04)  * (src.kidefense_multi)) + src.kidefense_bonus)
		var/str_gainlvlup = round(rand(1,5) + ((src.level * 0.04) * (src.strength_multi))+ src.strength_bonus)
		var/def_gainlvlup = round(rand(1,5) + ((src.level * 0.04) * (src.defence_multi))+ src.defence_bonus)
		var/spd_gain = round(rand(1,5) + ((src.level * 0.04) * (src.speed_multi))+ src.speed_bonus)

		src.calledlvlup=1

		src.exp-=src.tnl
		src.level++
		src.zpup ++
		src.level_chance++
		src.spam_lvl++
		if(src.lvls_on == 1)
			src << output("<font size = 1><font color = #0066FF>You are now level [src.level] <font color=red>[src.name]</font></font>","output2")
			src << output("<font size = 1><font color = white>Your Power surges as your Powerlevel increases +[applycommas(power_gain)]</font>","output2")
			src << output("<font size = 1><font color = white>You feel much more energized as your Ki increases +[applycommas(ki_gain)]</font>","output2")
			src << output("<font size = 1><font color = white>You feel a surge in your energy as your Ki Defence increases +[applycommas(kid_gain)]</font>","output2")
			src << output("<font size = 1><font color = white>Your muscles bulge as your Strength increases +[applycommas(str_gainlvlup)]</font>","output2")
			src << output("<font size = 1><font color = white>You feel your body become more durable Defence +[applycommas(def_gainlvlup)]</font>","output2")
	//		src << output("<center><font color = white>You feel lighter and faster Speed +[spd_gain]</font></center>","output2")

		if(src.zpup >= 1500)
			if(prob(src.zpc))
				src.zpup = 0
				src.zp += 2
				src << output("<center><Font color=red>You Obtain 2 Z Points!</font></center>")
			else
				src.zpup = 0
				src.zp ++
				src << output("<center><Font color=red>You Obtain a Z Point!</font></center>")

		src.powerlevel_max += power_gain
		src.ki_max += ki_gain
		src.kidefense_max += kid_gain
		src.strength_max += str_gainlvlup
		src.defence_max += def_gainlvlup
		src.speed_max += spd_gain
		src.stam_up ++
		src.tnl += src.expup

		if(src.level >= src.lastcompleteBankRaid+10000)
			src.BankQuestCanTake=1
		//	src << "Can do bank quest again"
			src.lastcompleteBankRaid = src.level
			if(!src.bankCanDoQuest)
				src.bankCanDoQuest=1
				src << "<font color = yellow><b>You get word that the Bank is about to be robbed..."


		if(src.spam_lvl>=50)
			if(CreationSpam.Find("2[src.ckey]"))
				CreationSpam.Remove("2[src.ckey]")
			else
				if(CreationSpam.Find("1[src.ckey]"))
					CreationSpam.Remove("1[src.ckey]")
			src.spam_lvl=0
		if(!src.gone_ssj && src.race == "Saiyan")
			if(src.gene == "Prideful"||src.gene == "Legendary"||src.gene == "Godly")
				src.TrainSSJ()
		spawn(1)src.Skill_Gain()
		spawn(1)src.Exp_Check()
		if(src.exp >= src.tnl)

			spawn(15)
				src.calledlvlup=0
				src.Level_Up()
		else

			src.calledlvlup=0
		return

*/
/*
mob/proc/Fatigue_Level_Up()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.staminaleft_exp >= src.staminaleft_tnl)
		src.staminaleft_tnl += 2
		src.staminaleft_exp -= src.staminaleft_tnl
		src.staminaleft_max += 250+round(src.level/20)
		src << output("\white You feel your Endurance increase...","output2")

*/
mob/proc/TrainSSJ()
	if(!src.client)return
	if(!src.loggedin)return
	if(src.gene == "Prideful" || src.gene == "Godly")
		if(src.race=="Saiyan")
			if(src.powerlevel_max>=17500000 && src.level >= 5000)
				src.buku = 0
				src.rest = 0
				src.frozen = 1
				src.boxing = 0
				src.focus_boxing = 0
				src.doing = 1
				src.icon_state = ""
				src.gone_ssj = 1
				src.density=1
				src.icon_state = "enrage"
				view(8) << output("\white <I>[src.name] feels an uncontrollable rage burning in him as he remembers those Saiyans who have surpassed him.")
				sleep(25)
				view(8) << output("\white <I>[src.name] clenchs his fists, as tears well in his eyes. Veins protrude from his hands and forehead as the ground rumbles")
				sleep(25)
				view(8) << output("\white [src.name]: I AM THE STRONGEST OF THE SAIYANS! NO ONE SHALL SURPASS ME!!")
				src.icon_state = ""
				src.contents += new/obj/Transform/Transform
				src.contents += new/obj/Transform/Revert
				src.SaiyanTrans()
				Explode(new /Effect/BasicBoom(src.loc,1,5))
				sleep(25)
				src.frozen=0
				src.doing=0
				var/chance = rand(20,60)
				if(prob(chance))
					src << "You are unable to fully control your Super Saiyan state!"
					src.SaiyanRevert()
	else
		if(src.gene == "Legendary")
			if(src.race=="Saiyan")
				if(src.powerlevel_max>=42500000)
					src.buku = 0
					src.rest = 0
					src.frozen = 1
					src.boxing = 0
					src.focus_boxing = 0
					src.doing = 1
					src.icon_state = ""
					src.gone_ssj = 1
					src.density=1
					src.icon_state = "enrage"
					view(8) << output("\white <I>[src.name] feels a surge of pure power.")
					sleep(25)
					view(8) << output("\white <I>[src.name] laughs as he begins to regain control of his mind")
					sleep(25)
					view(8) << output("\white [src.name]: HAHAHAHAHAHAHAHAHA!!")
					src.icon_state = ""
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert
					src.SaiyanTrans()
					Explode(new /Effect/BasicBoom(src.loc,1,7))
					sleep(25)
					src.frozen=0
					src.doing=0
					var/chance = rand(20,60)
					if(prob(chance))
						src << "You are unable to fully control your Super Saiyan state!"
						src.SaiyanRevert()