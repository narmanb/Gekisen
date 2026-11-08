//mob/verb/train()
//	spawn(-1) usr.Spar_Ticks()


mob/proc/Spar_Ticks()
	var/tickprob = 100
	var/pwrprob = 0
	var/kiprob = 100
	//var/kidprob = 10
	var/strprob = 100
	var/defprob = 100
//	var/spdprob = 5
//	var/stmprob = 5
	var/expprob = 100

	var/stat = rand(1,8)
//	var/plold = round(rand(2,6) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.powerlevel_bonus*1))
//	var/kiold = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.ki_bonus*2))
//	var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.strength_bonus*2))
//	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+(src.defence_bonus*2))
	var/exp = round((rand(45,75)+(src.level/250))*src.moden)
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






	pl = round(pl*5)
	ki = round(ki*5)
	//kid = round(kid*2)
	str = round(str*5)
	def = round(def*5)
//	spd = round(spd*2)
//		stm = round(stm*2)





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
					if(def<=0)
						def=rand(10,25)
					src.exp += exp
					if(src.training_on == 1)
						src << output("<font color = white>EXP +[applycommas(exp)]","output2")


	src.calcmaxpl()