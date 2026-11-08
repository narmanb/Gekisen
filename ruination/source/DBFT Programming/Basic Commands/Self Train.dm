mob/var/training=0
mob/var/strain = 0
mob/var/tmp
	checker=""
	undercheck=0
	sttps=0
	starttrain=0

mob/PC/verb/SelfTrain()
	set category = "Training"
	set name="Self Train"
	if(src.playerwatch==1)
		PlayerWatch(usr,"Self Train")
//	if(src.inverted||src.form_1||src.form_2||src.form_3||src.form_4||src.form_5||src.form_6)
//		src << "You must reverFRt to base form before you can train"
//		return
//	if(src.starttrain)
//		return
	if(src.boxing_delay)
		src << output("You must wait before Training again","output2")
		return
//	if(src.jailed)
//		src << "can't do this while jailed"
//		return
	/*if(src.dtrain)
		src<<"You are already training in another way"
		return
	if(src.ftrain)
		src<<"You are already training in another way"
		return
	if(src.mtrain)
		src<<"You are already training in another way"
		return*/
	if(src.focus_boxing||src.dualtrain)
		return
	if(src.boxing)
		src.boxing_delay = 1
		src.icon_state = ""
		src.boxing = 0
		src.frozen = 0
		src.doing = 0
		src.strain = 0
		src.thrown=0
		src.undercheck=0
		src << output("You stop training.","output2")
		spawn(35)src.boxing_delay = 0
		return
	if(src.staminaleft >= src.staminaleft_max)
		src.undercheck=0
		src << output("You are too tired to train.","output2")
		src.strain=0
		return
	if(src.doing)
		src.undercheck=0
		return
	if(src.train)
		return

//	src.starttrain=1
//	if(src.transformed||src.inverted||src.form_1||src.form_2||src.form_3||src.form_4||src.form_5||src.form_6)
//		src.frozen = 1
//		src << "You are about to revert before you begin to train"
//		sleep(2)
//		src.RevertProc()
//		src.frozen = 1
//		sleep(35)
//		src.frozen = 0
//	src.starttrain=0

	if(!src.boxing)
		src.boxing_delay = 1
		src.strain = 1
		src.icon_state = "spar fury"
		src.boxing = 1
		src.doing = 1
		src.frozen = 1
		src << output("You begin to train!","output2")
		spawn(5) src.Box_Gain()
		spawn(35) src.boxing_delay = 0

mob/PC/proc/Box_Gain()
	src.gravtrain = 0
	while(src.boxing)
		if(!src.boxing)
			src.icon_state = null
			break
		if(src.dtrain)
			src<<"You are already training in another way"
			return
		if(src.ftrain)
			src<<"You are already training in another way"
			src.boxing = 0
			src.frozen = 0
			src.doing = 0
			src.icon_state = ""
			src.undercheck=0
			return
		if(src.mtrain)
			src<<"You are already training in another way"
			src.boxing = 0
			src.frozen = 0
			src.doing = 0
			src.icon_state = ""
			src.undercheck=0
			return
		if(src.staminaleft >= src.staminaleft_max)
			src.staminaleft = src.staminaleft_max
			src.boxing = 0
			src.frozen = 0
			src.doing = 0
			src.icon_state = ""
			src.undercheck=0
			src << output("You collapse on the floor trying to catch your breathe.","output2")
			return
		if(src.focus_boxing||src.dualtrain)
			break
		if(!src.boxing)
			src.undercheck=0
			return
		if(!src.frozen)
			src.undercheck=0
			return

		var/tp = rand(1,3)+(1 * rand(2,9))+round(src.level/10000)+moden*2
		var/z = round(rand(15,600) + src.level/2)
		var/expgain = round((rand(5,20)+src.level/250)*src.expm)+(src.in_hbtc*5)+(src.in_herculegym*5)+1
		if(src.gravtrain)
			expgain += expgain * 1.5
			expgain += expgain * src.gravtrain
			tp += tp * src.gravtrain
		//	src << "EXPGAIN"
		var/bonus=((weightankle+weightarm+weightleg+weightarmor+weightcape+weightgi+weighthead+weightwrist+weightsword)+(z_sword||demon_blade))+1

		if(weightankle||weightarm||weightleg||weightarmor||weightcape||weightgi||weightwrist||z_sword||demon_blade)expgain=round(expgain*bonus)

		if(src.juniorc)expgain*=1.1
		if(src.worldc)expgain*=1.2
		if(src.galacticc)expgain*=1.3
		if(src.universalc)expgain*=1.4

		if(src.smallshard)expgain*=1.25
		if(src.largeshard)expgain*=1.5
		if(src.greatshard)expgain*=2
		if(src.massshard)expgain*=3

		if(src.expbuff)expgain*=2

		if(src.smallshardz)z*=1.25
		if(src.largeshardz)z*=1.5
		if(src.greatshardz)z*=2
		if(src.massshardz)z*=3
		expgain*=1.2
		if(src.in_hbtc)
			tp*=2
			expgain*=4
		else
			//expgain*=3
			expgain*=4
			tp*=2
		if(src.in_herculegym && src.level < 150000)
			tp*=2
			//expgain*=2.75

		expgain*=sexp
		z*=szenni
	/*	for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				tp/2
				expgain/2
				*/
		if(prob(5))
			if(prob(src.tpc))
				tp*=2
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = red>Training points +[applycommas(tp)]","output2")
			else
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = white>Training points +[applycommas(tp)]","output2")

		if(prob(15))
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
		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()
		sleep(6)
	src.icon_state = null






mob/proc/Character_Up_ST()

	var/pwrprob = 0
	var/kiprob = 5
	var/kidprob = 5
	var/strprob = 5
	var/defprob = 5
//	var/spdprob = 5
//	var/stmprob = 5
	var/expprob = 5
	var/stat = rand(1,8)
	var/pl = round(rand(2,6) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
	//var/pl3 = round(rand(1,3) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
	var/ki = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.ki_bonus)
	var/kid = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.kidefense_bonus)
	var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.strength_bonus)
	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.defence_bonus)
//	var/str = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.strength_bonus)
//	var/def = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.defence_bonus)
	//var/spd = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.speed_bonus)
//	var/stm = round(rand(20,30)+(src.level/200))
	var/exp = round((rand(50,75)+(src.level/500))*src.moden)

//	var/pldiv = pl/200
	pl = pl/200
	ki = ki/200
	kid = kid/200
	str = str/200
	def = def/200

	pl = round(pl*0.5)
	ki = round(ki*0.5)
	str = round(str*0.5)
	def = round(def*0.5)
	exp = round(exp*2)


	if(pl < 1) pl = 1
	if(ki < 1) ki = 1
	if(kid < 1) kid = 1
	if(str < 1) str = 1
	if(def < 1) def = 1


	if(src.smallshards)
		pl = round(pl*1.25)
		ki = round(ki*1.25)
		kid = round(kid*1.25)
		str = round(str*1.25)
		def = round(def*1.25)
	//	spd = round(spd*1.5)
		//stm = round(stm*1.5)
		exp = round(exp*1.25)

	if(src.largeshards)
		pl = round(pl*1.5)
		ki = round(ki*1.5)
		kid = round(kid*1.5)
		str = round(str*1.5)
		def = round(def*1.5)
	//	spd = round(spd*2)
		//stm = round(stm*2)
		exp = round(exp*1.5)

	if(src.greatshards)
		pl = round(pl*1.75)
		ki = round(ki*1.75)
		kid = round(kid*1.75)
		str = round(str*1.75)
		def = round(def*1.75)
//		spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*1.75)

	if(src.massshards)
		pl = round(pl*2)
		ki = round(ki*2)
		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)
	//	spd = round(spd*2)
		//stm = round(stm*2)
		exp = round(exp*2)

	if(src.in_hbtc)
		pl = round(pl*1.2)
		ki = round(ki*1.2)
		kid = round(kid*1.2)
		str = round(str*1.2)
		def = round(def*1.2)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*1.2)
	if(src.in_herculegym && src.level < 100000)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*1.2)

	if(src.focus_boxing)
		pl = round(pl*2)
		ki = round(ki*2)
		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*2)


	if(prob(66))
		if(src.training1 == "")
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

			if(prob(kiprob))
				if(stat == 2)
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

			if(prob(strprob))
				if(stat == 4)
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
				if(stat == 5)
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
				if(stat == 8)
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

		if(src.training2 == "Ki Defense")
			if(prob(kidprob))
				if(prob(src.statc))
					if(kid <= 0)
						kid=rand(10,25)
					kid = round(kid+(kid*(src.statc*0.01)))
					src.kidefense_max += kid
					if(src.training_on == 1)
						src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
				else
					if(kid <= 0)
						kid=rand(10,25)
					src.kidefense_max += kid
					if(src.training_on == 1)
						src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")

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

			if(prob(kiprob))
				if(stat == 2)
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

			if(prob(strprob))
				if(stat == 4)
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
				if(stat == 5)
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
				if(stat == 8)
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