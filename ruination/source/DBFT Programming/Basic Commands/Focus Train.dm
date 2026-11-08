//crim 2.61 Added second training Focus
mob/var/training1 = ""
mob/var/training2 = ""
mob/var/ftrain = 0
mob/var/tmp/gravtrain = 0
mob/PC/verb/Concentrate()
	set category = "Training"
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Concentrate")
//	src.afk_time = 0

	switch(input("What will your primary concentration be on?","Concentrate")in list("Ki","Strength","Defense","Exp","nothing specific"))
		if("Powerlevel")
			src.training1 = "Powerlevel"
			src << output("You will now concentrate on Powerlevel","output2")
		if("Ki")
			src.training1 = "Ki"
			src << output("You will now concentrate on Ki","output2")
		if("Ki Defense")
			src.training1 = "Ki Defense"
			src << output("You will now concentrate on Ki Defense","output2")
		if("Strength")
			src.training1 = "Strength"
			src << output("You will now concentrate on Strength","output2")
		if("Defense")
			src.training1 = "Defense"
			src << output("You will now concentrate on Defense","output2")
		if("Speed")
			src.training1 = "Speed"
			src << output("You will now concentrate on Speed","output2")
		if("Stamina")
			src.training1 = "Stamina"
			src << output("You will now concentrate on Stamina","output2")
		if("Exp")
			src.training1 = "Exp"
			src << output("You will now concentrate on Exp","output2")
		if("nothing specific")
			src.training1 = ""
	sleep(1)
	switch(input("What will your secondary concentration be on?","Concentrate")in list("Ki","Strength","Defense","Exp","nothing specific"))

		if("Powerlevel")
			src.training2 = "Powerlevel"
			src << output("You will now concentrate on Powerlevel","output2")
			return
		if("Ki")
			src.training2 = "Ki"
			src << output("You will now concentrate on Ki","output2")
			return
		if("Ki Defense")
			src.training2 = "Ki Defense"
			src << output("You will now concentrate on Ki Defense","output2")
			return
		if("Strength")
			src.training2 = "Strength"
			src << output("You will now concentrate on Strength","output2")
			return
		if("Defense")
			src.training2 = "Defense"
			src << output("You will now concentrate on Defense","output2")
			return
		if("Speed")
			src.training2 = "Speed"
			src << output("You will now concentrate on Speed","output2")
			return

		if("Stamina")
			src.training2 = "Stamina"
			src << output("You will now concentrate on Stamina","output2")
			return
		if("Exp")
			src.training2 = "Exp"
			src << output("You will now concentrate on Exp","output2")
		if("nothing specific")
			src.training2 = ""
			return

mob/PC/verb/FocusTrain()
	set category = "Training"
	set name="Focus Train"
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Focus Train")
/*	if(src.dtrain)
		src<<"You are already training in another way"
		return
	if(src.strain)
		src<<"You are already training in another way"
		return
	if(src.mtrain)
		src<<"You are already training in another way"
		return*/

//	if(src.starttrain)
//		return
//	if(src.jailed)
//		src << "can't do this while jailed"
//		return
	if(src.boxing||src.dualtrain)
		return
	if(src.boxing_delay)
		src << output("You must wait before Training again","output2")
		return
	if(src.focus_boxing)
		src.boxing_delay = 1
		src.icon_state = ""
		src.focus_boxing = 0
		spawn(20)src.ftrain = 0
		src.frozen = 0
		src.doing = 0
		src.thrown=0
		src.undercheck=0
		src.gravtrain=0
		src << output("You stop training.","output2")
		spawn(25)src.boxing_delay = 0
		return
	if(src.staminaleft >= src.staminaleft_max)
		src << output("You are too tired to train.","output2")
		src.ftrain=0
		src.undercheck=0
		src.gravtrain = 0
		return
	if(src.doing)
		src.undercheck=0
		src.focus_boxing = 0
		return
//	src.starttrain=1
//	if(src.transformed||src.inverted||src.form_1||src.form_2||src.form_3||src.form_4||src.form_5||src.form_6)
//		src.frozen = 1
//		src << "You are about to revert before you begin to train"
//		sleep(2)
//		src.frozen = 1
//		src.RevertProc()
//		src.frozen = 1
//		sleep(35)
	if(src.train)
		return
//	src.starttrain=0
	if(!src.focus_boxing)
		src.boxing_delay = 1
		src.icon_state = "spar fury"
		src.focus_boxing = 1
		src.doing = 1
		src.ftrain = 1
		src.frozen = 1
		src << output("You begin to train!","output2")
		spawn(5) src.Focus_Box_Gain()
		spawn(25) src.boxing_delay = 0

mob/PC/proc/Focus_Box_Gain()

	src.gravtrain = 0
	while(src.focus_boxing)
		if(!src.focus_boxing)
		//	src << "break FT"
			src.icon_state = null
			break
		//if(!src.frozen)
		//	src.undercheck=0
		//	return
		if(src.staminaleft >= src.staminaleft_max)
			src.staminaleft = src.staminaleft_max
			src.focus_boxing = 0
			src.frozen = 0
			src.doing = 0
			src.icon_state = ""
			src.undercheck=0
			src.gravtrain = 0
			src << output("You collapse on the floor trying to catch your breathe.","output2")
			return

		if(src.boxing||src.dualtrain)
			break
		var/tp = rand(1,2)+(src.in_hbtc * rand(1,6)+round(src.level/10000)+moden*1)
		var/z = round(rand(5,450) + src.level/2)
		var/expgain = round((rand(3,15)+src.level/500)*src.expm)+1
		if(src.gravtrain)
			expgain += expgain * 0.6
			expgain += expgain * src.gravtrain
			tp += tp * src.gravtrain
			//src << "EXPGAIN"
		var/bonus=((weightankle+weightarm+weightleg+weightarmor+weightcape+weightgi+weighthead+weightwrist+weightsword)+(z_sword||demon_blade))+1

		if(weightankle||weightarm||weightleg||weightarmor||weightcape||weightgi||weightwrist||z_sword||demon_blade)expgain=round(expgain*bonus)

		if(src.juniorc)expgain*=1.05
		if(src.worldc)expgain*=1.1
		if(src.galacticc)expgain*=1.15
		if(src.universalc)expgain*=1.2

		if(src.smallshard)expgain*=1.25
		if(src.largeshard)expgain*=1.5
		if(src.greatshard)expgain*=2
		if(src.massshard)expgain*=3

		if(src.expbuff)expgain*=1.4

		if(src.smallshardz)z*=1.25
		if(src.largeshardz)z*=1.5
		if(src.greatshardz)z*=2
		if(src.massshardz)z*=3

		if(src.in_hbtc)
			tp*=2
			expgain*=2
		else
			tp*=2
			expgain*=2

//		if(src.in_herculegym && src.level < 150000)
//			tp*=2
	//		expgain*=1.5
		z*=szenni
		expgain*=sexp
	/*	for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				tp/2
				expgain/2
	*/
		if(prob(3))
		/*	if(src.smallshards)
				tp=round(tp*1.13)
			if(src.largeshards)
				tp=round(tp*1.25)
			if(src.greatshards)
				tp=round(tp*1.5)
			if(src.massshards)
				tp=round(tp*2)*/
			if(prob(src.tpc))
				tp*=2
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = red>Training points +[applycommas(tp)]","output2")
			else
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = white>Training points +[applycommas(tp)]","output2")

		if(prob(10))
			src.zenni += z
		src.exp+=expgain
		if(src.hudenabled)
			if(!src.calledlvlup&&!src.calledexphud)
				src.calledexphud = 1
				spawn(50) src.calledexphud = 0
				spawn() src.updateexp()
		if(src.undercheck)
			var/mob/GMC=src.checker
			GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Self Train)"
		src.Character_Up()
		spawn() src.statgain()
		//if(!src.staminabuff)src.staminaleft+=4
		//spawn(1)src.Level_Up()
		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()
		sleep(6)
	src.icon_state = null


mob/proc/Character_Up()
	var/tickprob = 66
	var/pwrprob = 0
	var/kiprob = 10
	//var/kidprob = 10
	var/strprob = 10
	var/defprob = 10
//	var/spdprob = 5
//	var/stmprob = 5
	var/expprob = 10





	var/stat = rand(1,4)
//	var/plold = round(rand(2,6) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.powerlevel_bonus*1))
//	var/kiold = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.ki_bonus*2))
//	var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.strength_bonus*2))
//	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.defence_bonus*2))
	var/exp = round((rand(45,75)+(src.level/250))*src.moden)

	exp = round(exp+(exp*(src.statc*0.01)))
	var/lvlgains = src.level
	if(src.level > 200000)
		lvlgains = 200000
	lvlgains = rand(lvlgains*0.3,lvlgains*0.5)
	var/plvlgains = lvlgains * 1
	var/pl = (rand(2,6) + plvlgains * src.moden) + src.powerlevel_bonus*4
	var/ki = (rand(1,4) + lvlgains * src.moden) + src.ki_bonus*4
	var/str = (rand(1,4) + lvlgains * src.moden) + src.strength_bonus*4
	var/def = (rand(1,4) + lvlgains * src.moden) + src.defence_bonus*4
	pl = pl * (src.power_multi/5)
	ki = ki * (src.ki_multi/5)
	str = str * (src.strength_multi/5)
	def = def * (src.defence_multi/5)

//	world << "ki: [ki]  plold: [kiold]"
//	var/pldiv = pl/200
	pl = round(pl/15)
	ki = round(ki/20)
//	kid = round(kid/20)
	str = round(str/20)
	def = round(def/20)
//	if(pl < 1) pl = 1
//	if(ki < 1) ki = 1
//	if(kid < 1) kid = 1
//	if(str < 1) str = 1
//	if(def < 1) def = 1

		//src << "STATGAIN"
	pl = round(pl*0.5)
	ki = round(ki*0.5)
	str = round(str*0.5)
	def = round(def*0.5)
	exp = round(exp*2)


	if(src.smallshards)
		pl = round(pl*1.25)
		ki = round(ki*1.25)
		str = round(str*1.25)
		def = round(def*1.25)
		exp = round(exp*1.25)

	if(src.largeshards)
		pl = round(pl*1.5)
		ki = round(ki*1.5)
		str = round(str*1.5)
		def = round(def*1.5)
		exp = round(exp*1.5)

	if(src.greatshards)
		pl = round(pl*1.75)
		ki = round(ki*1.75)
		str = round(str*1.75)
		def = round(def*1.75)
		exp = round(exp*1.75)

	if(src.massshards)
		pl = round(pl*2)
		ki = round(ki*2)
		str = round(str*2)
		def = round(def*2)
		exp = round(exp*2)

	if(src.in_hbtc)
		pl = round(pl*1.3)
		ki = round(ki*1.3)
		str = round(str*1.3)
		def = round(def*1.3)
		exp = round(exp*2)
	else
		pl = round(pl*1.3)
		ki = round(ki*1.3)
		str = round(str*1.3)
		def = round(def*1.3)
		exp = round(exp*2)
	if(src.in_herculegym && src.level < 200000)
		exp = round(exp*2)


	ki += src.ki_bonus*2
	str += src.strength_bonus*2
	def += src.defence_bonus*2
	if(src.focus_boxing||src.dualtrain)
		pl = round(pl*2)
		ki = round(ki*2)
		str = round(str*2)
		def = round(def*2)

		exp = round(exp/2)


	if(src.gravtrain)
		pl += pl * src.gravtrain
		ki += ki * src.gravtrain
		str += str * src.gravtrain
		def += def * src.gravtrain

/*
	if(src.sparticks)
		pl = round(pl*10)
		ki = round(ki*10)
		//kid = round(kid*2)
		str = round(str*10)
		def = round(def*10)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		tickprob = 1
		src.sparticks = 0
*/

//	tickprob = 1
//	player << "HTEST"
	if(prob(66))
		if(src.training1 == "Powerlevel")
			if(prob(pwrprob))
				if(prob(src.statc))
					if(pl <= 0)
						pl=rand(10,25)
					pl = round(pl+(pl*(src.statc*0.01)))
					src.powerlevel_max += pl
					if(src.training_on == 1)
						src << output("<font color = red>Powerlevel +[applycommas(pl)]","output2")
				else
					if(pl <= 0)
						pl=rand(10,25)
					src.powerlevel_max += pl
					if(src.training_on == 1)
						src << output("<font color = white>Powerlevel +[applycommas(pl)]","output2")

		if(src.training1 == "Ki")
			if(prob(kiprob))
				if(prob(src.statc))
					if(ki <= 0)
						ki=rand(10,25)
					ki = round(ki+(ki*(src.statc*0.01)))
					src.ki_max += ki
					if(src.training_on == 1)
						src << output("<font color = red>Ki +[applycommas(ki)]","output2")
				else
					if(ki <= 0)
						ki=rand(10,25)
					src.ki_max += ki
					if(src.training_on == 1)
						src << output("<font color = white>Ki +[applycommas(ki)]","output2")

//		if(src.training1 == "Ki Defense")
//			if(prob(kidprob))
//				if(prob(src.statc))
//					if(kid <= 0)
//						kid=rand(10,25)
//					kid = round(kid+(kid*(src.statc*0.01)))
//					src.kidefense_max += kid
//					if(src.training_on == 1)
//						src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
//				else
//					if(kid <= 0)
//						kid=rand(10,25)
//					src.kidefense_max += kid
//					if(src.training_on == 1)
//						src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")

		if(src.training1 == "Strength")
			if(prob(strprob))
				if(prob(src.statc))
					if(str <= 0)
						str=rand(10,25)
					str = round(str+(str*(src.statc*0.01)))
					src.strength_max += str
					if(src.training_on == 1)
						src << output("<font color = red>Strength +[applycommas(str)]","output2")
				else
					if(str<=0)
						str=rand(10,25)
					src.strength_max += str
					if(src.training_on == 1)
						src << output("<font color = white>Strength +[applycommas(str)]","output2")

		if(src.training1 == "Defense")
			if(prob(defprob))
				if(prob(src.statc))
					if(def <= 0)
						def=rand(10,25)
					def = round(def+(def*(src.statc*0.01)))
					src.defence_max += def
					if(src.training_on == 1)
						src << output("<font color = red>Defense +[applycommas(def)]","output2")
				else
					if(def<=0)
						def=rand(10,25)
					src.defence_max += def
					if(src.training_on == 1)
						src << output("<font color = white>Defense +[applycommas(def)]","output2")
/*
		if(src.training1 == "Speed")
			if(prob(spdprob))
				if(prob(src.statc))
					if(spd <= 0)
						spd=rand(10,25)
					spd = round(spd+(spd*(src.statc*0.01)))
					src.speed_max += spd
					if(src.training_on == 1)
						src << output("<font color = red>Speed +[applycommas(spd)]","output2")
				else
					if(spd<=0)
						spd=rand(10,25)
					src.speed_max += spd
					if(src.training_on == 1)
						src << output("<font color = white>Speed +[applycommas(spd)]","output2")

		if(src.training1 == "Stamina")
			if(prob(stmprob))
				if(prob(src.statc))
					if(stm <= 0)
						stm=rand(25,75)
					stm = round(stm+(stm*(src.statc*0.01)))
					src.staminaleft_max += stm
					if(src.training_on == 1)
						src << output("<font color = red>Stamina +[applycommas(stm)]","output2")
				else
					src.staminaleft_max += stm
					if(src.training_on == 1)
						src << output("<font color = white>Stamina +[applycommas(stm)]","output2")
*/
		if(src.training1 == "Exp")
			if(prob(expprob))
				if(prob(src.statc))
					if(exp <= 0)
						exp=rand(10,25)
					exp = round(exp+(exp*(src.statc*0.01)))
					src.exp += exp
					if(src.training_on == 1)
						src << output("<font color = red>EXP +[applycommas(exp)]","output2")
				else
					if(exp<=0)
						exp=rand(10,25)
					src.exp += exp
					if(src.training_on == 1)
						src << output("<font color = white>EXP +[applycommas(exp)]","output2")

		if(src.training1 == "")
		/*
			if(prob(pwrprob))

				if(stat == 1)
					if(prob(src.statc))
						if(pl <= 0)
							pl=rand(10,25)
						pl = round(pl+(pl*(src.statc*0.01)))
						src.powerlevel_max += pl
						if(src.training_on == 1)
							src << output("<font color = red>Powerlevel +[applycommas(pl)]","output2")
					else
						if(pl<=0)
							pl=rand(10,25)
						src.powerlevel_max += pl
						if(src.training_on == 1)
							src << output("<font color = white>Powerlevel +[applycommas(pl)]","output2")
*/
			if(prob(kiprob))
				if(stat == 1)
					if(prob(src.statc))
						if(ki <= 0)
							ki=rand(10,25)
						ki = round(ki+(ki*(src.statc*0.01)))
						src.ki_max += ki
						if(src.training_on == 1)
							src << output("<font color = red>Ki +[applycommas(ki)]","output2")
					else
						if(ki<=0)
							ki=rand(10,25)
						src.ki_max += ki
						if(src.training_on == 1)
							src << output("<font color = white>Ki +[applycommas(ki)]","output2")

	/*
			if(prob(kidprob))
				if(stat == 3)
					if(prob(src.statc))
						if(ki <= 0)
							ki=rand(10,25)
						ki = round(ki+(ki*(src.statc*0.01)))
						src.kidefense_max += kid
						if(src.training_on == 1)
							src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
					else
						if(kid<=0)
							kid=rand(10,25)
						src.kidefense_max += kid
						if(src.training_on == 1)
							src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")
*/
			if(prob(strprob))
				if(stat == 2)
					if(prob(src.statc))
						if(str <= 0)
							str=rand(10,25)
						str = round(str+(str*(src.statc*0.01)))
						src.strength_max += str
						if(src.training_on == 1)
							src << output("<font color = red>Strength +[applycommas(str)]","output2")
					else
						if(str<=0)
							str=rand(10,25)
						src.strength_max += str
						if(src.training_on == 1)
							src << output("<font color = white>Strength +[applycommas(str)]","output2")

			if(prob(defprob))
				if(stat == 3)
					if(prob(src.statc))
						if(def <= 0)
							def=rand(10,25)
						def = round(def+(def*(src.statc*0.01)))
						src.defence_max += def
						if(src.training_on == 1)
							src << output("<font color = red>Defense +[applycommas(def)]","output2")
					else
						if(def<=0)
							def=rand(10,25)
						src.defence_max += def
						if(src.training_on == 1)
							src << output("<font color = white>Defense +[applycommas(def)]","output2")
/*
			if(prob(spdprob))
				if(stat == 6)
					if(prob(src.statc))
						if(spd <= 0)
							spd=rand(10,25)
						spd = round(spd+(spd*(src.statc*0.01)))
						src.speed_max += spd
						if(src.training_on == 1)
							src << output("<font color = red>Speed +[applycommas(spd)]","output2")
					else
						if(spd<=0)
							spd=rand(10,25)
						src.speed_max += spd
						if(src.training_on == 1)
							src << output("<font color = white>Speed +[applycommas(spd)]","output2")

			if(prob(stmprob))
				if(stat == 7)
					if(prob(src.statc))
						if(stm <= 0)
							stm=rand(25,75)
						stm = round(stm+(stm*(src.statc*0.01)))
						src.staminaleft_max += stm
						if(src.training_on == 1)
							src << output("<font color = red>Stamina +[applycommas(stm)]","output2")
					else
						src.staminaleft_max += stm
						if(src.training_on == 1)
							src << output("<font color = white>Stamina +[applycommas(stm)]","output2")
*/
			if(prob(expprob))
				if(stat == 4)
					if(prob(src.statc))
						if(exp <= 0)
							exp=rand(10,25)
						exp = round(exp+(exp*(src.statc*0.01)))
						src.exp += exp
						if(src.training_on == 1)
							src << output("<font color = red>EXP +[applycommas(exp)]","output2")
					else
						if(def<=0)
							def=rand(10,25)
						src.exp += exp
						if(src.training_on == 1)
							src << output("<font color = white>EXP +[applycommas(exp)]","output2")

	else
		if(src.training2 == "Powerlevel")
			if(prob(pwrprob))
				if(prob(src.statc))
					if(pl <= 0)
						pl=rand(10,25)
					pl = round(pl+(pl*(src.statc*0.01)))
					src.powerlevel_max += pl
					if(src.training_on == 1)
						src << output("<font color = red>Powerlevel +[applycommas(pl)]","output2")
				else
					if(pl <= 0)
						pl=rand(10,25)
					src.powerlevel_max += pl
					if(src.training_on == 1)
						src << output("<font color = white>Powerlevel +[applycommas(pl)]","output2")

		if(src.training2 == "Ki")
			if(prob(kiprob))
				if(prob(src.statc))
					if(ki <= 0)
						ki=rand(10,25)
					ki = round(ki+(ki*(src.statc*0.01)))
					src.ki_max += ki
					if(src.training_on == 1)
						src << output("<font color = red>Ki +[applycommas(ki)]","output2")
				else
					if(ki <= 0)
						ki=rand(10,25)
					src.ki_max += ki
					if(src.training_on == 1)
						src << output("<font color = white>Ki +[applycommas(ki)]","output2")

//		if(src.training2 == "Ki Defense")
//			if(prob(kidprob))
//				if(prob(src.statc))
//					if(kid <= 0)
//						kid=rand(10,25)
//					kid = round(kid+(kid*(src.statc*0.01)))
//					src.kidefense_max += kid
//					if(src.training_on == 1)
//						src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
//				else
//					if(kid <= 0)
//						kid=rand(10,25)
//					src.kidefense_max += kid
//					if(src.training_on == 1)
//						src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")

		if(src.training2 == "Strength")
			if(prob(strprob))
				if(prob(src.statc))
					if(str <= 0)
						str=rand(10,25)
					str = round(str+(str*(src.statc*0.01)))
					src.strength_max += str
					if(src.training_on == 1)
						src << output("<font color = red>Strength +[applycommas(str)]","output2")
				else
					if(str<=0)
						str=rand(10,25)
					src.strength_max += str
					if(src.training_on == 1)
						src << output("<font color = white>Strength +[applycommas(str)]","output2")

		if(src.training2 == "Defense")
			if(prob(defprob))
				if(prob(src.statc))
					if(def <= 0)
						def=rand(10,25)
					def = round(def+(def*(src.statc*0.01)))
					src.defence_max += def
					if(src.training_on == 1)
						src << output("<font color = red>Defense +[applycommas(def)]","output2")
				else
					if(def<=0)
						def=rand(10,25)
					src.defence_max += def
					if(src.training_on == 1)
						src << output("<font color = white>Defense +[applycommas(def)]","output2")
/*
		if(src.training2 == "Speed")
			if(prob(spdprob))
				if(prob(src.statc))
					if(spd <= 0)
						spd=rand(10,25)
					spd = round(spd+(spd*(src.statc*0.01)))
					src.speed_max += spd
					if(src.training_on == 1)
						src << output("<font color = red>Speed +[applycommas(spd)]","output2")
				else
					if(spd<=0)
						spd=rand(10,25)
					src.speed_max += spd
					if(src.training_on == 1)
						src << output("<font color = white>Speed +[applycommas(spd)]","output2")

		if(src.training2 == "Stamina")
			if(prob(stmprob))
				if(prob(src.statc))
					if(stm <= 0)
						stm=rand(25,75)
					stm = round(stm+(stm*(src.statc*0.01)))
					src.staminaleft_max += stm
					if(src.training_on == 1)
						src << output("<font color = red>Stamina +[applycommas(stm)]","output2")
				else
					src.staminaleft_max += stm
					if(src.training_on == 1)
						src << output("<font color = white>Stamina +[applycommas(stm)]","output2")
*/
		if(src.training2 == "Exp")
			if(prob(expprob))
				if(prob(src.statc))
					if(exp <= 0)
						exp=rand(10,25)
					exp = round(exp+(exp*(src.statc*0.01)))
					src.exp += exp
					if(src.training_on == 1)
						src << output("<font color = red>EXP +[applycommas(exp)]","output2")
				else
					src.exp += exp
					if(src.training_on == 1)
						src << output("<font color = white>EXP +[applycommas(exp)]","output2")

		if(src.training2 == "")
/*
			if(prob(pwrprob))
				if(stat == 1)
					if(prob(src.statc))
						if(pl <= 0)
							pl=rand(10,25)
						pl = round(pl+(pl*(src.statc*0.01)))
						src.powerlevel_max += pl
						if(src.training_on == 1)
							src << output("<font color = red>Powerlevel +[applycommas(pl)]","output2")
					else
						if(pl<=0)
							pl=rand(10,25)
						src.powerlevel_max += pl
						if(src.training_on == 1)
							src << output("<font color = white>Powerlevel +[applycommas(pl)]","output2")
*/
			if(prob(kiprob))
				if(stat == 1)
					if(prob(src.statc))
						if(ki <= 0)
							ki=rand(10,25)
						ki = round(ki+(ki*(src.statc*0.01)))
						src.ki_max += ki
						if(src.training_on == 1)
							src << output("<font color = red>Ki +[applycommas(ki)]","output2")
					else
						if(ki<=0)
							ki=rand(10,25)
						src.ki_max += ki
						if(src.training_on == 1)
							src << output("<font color = white>Ki +[applycommas(ki)]","output2")
/*
			if(prob(kidprob))
				if(stat == 3)
					if(prob(src.statc))
						if(kid <= 0)
							kid=rand(10,25)
						kid = round(kid+(kid*(src.statc*0.01)))
						src.kidefense_max += kid
						if(src.training_on == 1)
							src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
					else
						if(kid<=0)
							kid=rand(10,25)
						src.kidefense_max += kid
						if(src.training_on == 1)
							src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")
*/
			if(prob(strprob))
				if(stat == 2)
					if(prob(src.statc))
						if(str <= 0)
							str=rand(10,25)
						str = round(str+(str*(src.statc*0.01)))
						src.strength_max += str
						if(src.training_on == 1)
							src << output("<font color = red>Strength +[applycommas(str)]","output2")
					else
						if(str<=0)
							str=rand(10,25)
						src.strength_max += str
						if(src.training_on == 1)
							src << output("<font color = white>Strength +[applycommas(str)]","output2")

			if(prob(defprob))
				if(stat == 3)
					if(prob(src.statc))
						if(def <= 0)
							def=rand(10,25)
						def = round(def+(def*(src.statc*0.01)))
						src.defence_max += def
						if(src.training_on == 1)
							src << output("<font color = red>Defense +[applycommas(def)]","output2")
					else
						if(def<=0)
							def=rand(10,25)
						src.defence_max += def
						if(src.training_on == 1)
							src << output("<font color = white>Defense +[applycommas(def)]","output2")
/*
			if(prob(spdprob))
				if(stat == 6)
					if(prob(src.statc))
						if(spd <= 0)
							spd=rand(10,25)
						spd = round(spd+(spd*(src.statc*0.01)))
						src.speed_max += spd
						if(src.training_on == 1)
							src << output("<font color = red>Speed +[applycommas(spd)]","output2")
					else
						if(spd<=0)
							spd=rand(10,25)
						src.speed_max += spd
						if(src.training_on == 1)
							src << output("<font color = white>Speed +[applycommas(spd)]","output2")

			if(prob(stmprob))
				if(stat == 7)
					if(prob(src.statc))
						if(stm <= 0)
							stm=rand(25,75)
						stm = round(stm+(stm*(src.statc*0.01)))
						src.staminaleft_max += stm
						if(src.training_on == 1)
							src << output("<font color = red>Stamina +[applycommas(stm)]","output2")
					else
						src.staminaleft_max += stm
						if(src.training_on == 1)
							src << output("<font color = white>Stamina +[applycommas(stm)]","output2")
*/
			if(prob(expprob))
				if(stat == 4)
					if(prob(src.statc))
						if(exp <= 0)
							exp=rand(10,25)
						exp = round(exp+(exp*(src.statc*0.01)))
						src.exp += exp
						if(src.training_on == 1)
							src << output("<font color = red>EXP +[applycommas(exp)]","output2")
					else
						src.exp += exp
						if(src.training_on == 1)
							src << output("<font color = white>EXP +[applycommas(exp)]","output2")
	src.calcmaxpl()