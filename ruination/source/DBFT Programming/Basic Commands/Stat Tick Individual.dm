
mob/var/sparticks = 0
mob/proc/StatTick(mob/M)
	if(src.client.address == M.client.address)
		src << "No spar ticks on alts"
		M << "No spar ticks on alts"
		return
	src.sparticks = 1
	src.Character_Up()
	return
	var/whichstat = rand(1,4)
//	var/pl = round(rand(2,6) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
	//var/pl3 = round(rand(1,3) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
//	var/ki = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.ki_bonus)
	var/kid = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.kidefense_bonus)
	//var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.strength_bonus)
//	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.defence_bonus)
//	var/str = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.strength_bonus)
//	var/def = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.defence_bonus)
	//var/spd = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.speed_bonus)
//	var/stm = round(rand(20,30)+(src.level/200))
	var/exp = round((rand(50,75)+(src.level/500))*src.moden)


	var/lvlgains = src.level
	if(src.level > 200000)
		lvlgains = 200000
	lvlgains = rand(lvlgains*0.3,lvlgains*0.5)
	var/plvlgains = lvlgains * 1
	var/pl = (rand(2,6) + plvlgains * src.moden) + src.powerlevel_bonus*4
	var/ki = (rand(1,4) + lvlgains * src.moden) + src.ki_bonus*4
	var/str = (rand(1,4) + lvlgains * src.moden) + src.strength_bonus*4
	var/def = (rand(1,4) + lvlgains * src.moden) + src.defence_bonus*4


//	var/pldiv = pl/200
	pl = pl/50
	ki = ki/50
	kid = kid/50
	str = str/50
	def = def/50

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
		pl = round(pl*2)
		ki = round(ki*2)
		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*2)


//	if(src.focus_boxing)
	pl = round(pl*3)
	ki = round(ki*3)
	kid = round(kid*3)
	str = round(str*3)
	def = round(def*3)
//	spd = round(spd*2)
//		stm = round(stm*2)
	exp = round(exp*3)


	if(whichstat == 1)

		if(pl<=0)
			pl=rand(10,25)
		src.powerlevel_max += pl
		if(src.training_on == 1)
			src << output("<font color = yellow>Powerlevel +[applycommas(pl)]","output2")
	if(whichstat == 2)

		if(ki<=0)
			ki=rand(10,25)
		src.ki_max += ki
		if(src.training_on == 1)
			src << output("<font color = yellow>Ki +[applycommas(ki)]","output2")

	if(whichstat == 3)

		if(str<=0)
			str=rand(10,25)
		src.strength_max += str
		if(src.training_on == 1)
			src << output("<font color = yellow>Strength +[applycommas(str)]","output2")
	if(whichstat == 4)

		if(def<=0)
			def=rand(10,25)
		src.defence_max += def
		if(src.training_on == 1)
			src << output("<font color = yellow>Defense +[applycommas(def)]","output2")
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





mob/proc/StatTickOffense(mob/M)
//	if(src.client.address == M.client.address)
//		src << "No spar ticks on alts"
//		M << "No spar ticks on alts"
//		return
	src.sparticks = 1
	spawn() src.Spar_Ticks()
	spawn() M.Spar_Ticks()
	return


	var/whichstat = rand(2,3)
//	var/pl = round(rand(2,6) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
	//var/pl3 = round(rand(1,3) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
//	var/ki = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.ki_bonus)
	var/kid = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.kidefense_bonus)
//	var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.strength_bonus)
//	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.defence_bonus)
	var/exp = round((rand(50,75)+(src.level/500))*src.moden)

	var/lvlgains = src.level
	if(src.level > 200000)
		lvlgains = 200000
	lvlgains = rand(lvlgains*0.3,lvlgains*0.5)
	var/plvlgains = lvlgains * 1
	var/pl = (rand(2,6) + plvlgains * src.moden) + src.powerlevel_bonus*4
	var/ki = (rand(1,4) + lvlgains * src.moden) + src.ki_bonus*4
	var/str = (rand(1,4) + lvlgains * src.moden) + src.strength_bonus*4
	var/def = (rand(1,4) + lvlgains * src.moden) + src.defence_bonus*4
//	var/pldiv = pl/200
	pl = pl/60
	ki = ki/60
	kid = kid/60
	str = str/60
	def = def/60

//	pl = round(pl*0.5)
//	ki = round(ki*0.5)
//	str = round(str*0.5)
//	def = round(def*0.5)
//	exp = round(exp*2)


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
		pl = round(pl*2)
		ki = round(ki*2)
		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*2)



	pl = round(pl*5)
	ki = round(ki*5)
	kid = round(kid*5)
	str = round(str*5)
	def = round(def*5)
//	spd = round(spd*2)
//		stm = round(stm*2)
	exp = round(exp*4)

	if(whichstat == 2)
		src.ki_max += ki
		src << output("<font color = yellow>Ki +[applycommas(ki)]","output2")
	if(whichstat == 3)
		src.strength_max += str
		src << output("<font color = yellow>Strength +[applycommas(str)]","output2")
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





mob/proc/StatTickDefense(mob/M)

	if(src.client.address == M.client.address)
		src << "No spar ticks on alts"
		M << "No spar ticks on alts"
		return
	src.sparticks = 1
	spawn() src.Character_Up()
	return


	var/whichstat = rand(1,2)
//	var/pl = round(rand(2,6) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
	//var/pl3 = round(rand(1,3) + (rand((src.level*0.4),(src.level*0.6))*src.moden)+src.powerlevel_bonus)
//	var/ki = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.ki_bonus)
	var/kid = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.kidefense_bonus)
//	var/str = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.strength_bonus)
//	var/def = round(rand(1,4) + (rand((src.level*0.3),(src.level*0.5))*src.moden)+src.defence_bonus)
//	var/str = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.strength_bonus)
//	var/def = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.defence_bonus)
	//var/spd = round(rand(10,15) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.speed_bonus)
//	var/stm = round(rand(20,30)+(src.level/200))
	var/exp = round((rand(50,75)+(src.level/500))*src.moden)
	var/lvlgains = src.level
	if(src.level > 200000)
		lvlgains = 200000
	lvlgains = rand(lvlgains*0.3,lvlgains*0.5)
	var/plvlgains = lvlgains * 1
	var/pl = (rand(2,6) + plvlgains * src.moden) + src.powerlevel_bonus*4
	var/ki = (rand(1,4) + lvlgains * src.moden) + src.ki_bonus*4
	var/str = (rand(1,4) + lvlgains * src.moden) + src.strength_bonus*4
	var/def = (rand(1,4) + lvlgains * src.moden) + src.defence_bonus*4


//	var/pldiv = pl/200
//	world << "pl [applycommas(pl)]  ki [applycommas(ki)] str [applycommas(str)]"
	pl = pl/60
	ki = ki/60
	kid = kid/60
	str = str/60
	def = def/60
//	world << "2 pl [applycommas(pl)]  ki [applycommas(ki)] str [applycommas(str)]"
//	pl = round(pl*0.5)
//	ki = round(ki*0.5)
//	str = round(str*0.5)
//	def = round(def*0.5)
//	exp = round(exp*2)

//	world << "3 pl [applycommas(pl)]  ki [applycommas(ki)] str [applycommas(str)]"
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
		pl = round(pl*2)
		ki = round(ki*2)
		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)
	//	spd = round(spd*2)
//		stm = round(stm*2)
		exp = round(exp*2)


//	if(src.focus_boxing)
	pl = round(pl*5)
	ki = round(ki*5)
	kid = round(kid*5)
	str = round(str*5)
	def = round(def*5)
//	spd = round(spd*2)
//		stm = round(stm*2)
	exp = round(exp*3)

//	world << " 4 pl [applycommas(pl)]  ki [applycommas(ki)] str [applycommas(str)]"
	if(whichstat == 1)
		src.powerlevel_max += pl
		src << output("<font color = yellow>Powerlevel +[applycommas(pl)]","output2")
	if(whichstat == 2)
		src.defence_max += def
		src << output("<font color = yellow>Defense +[applycommas(def)]","output2")
		/*
	if(whichstat == 1)
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
	if(whichstat == 2)
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

	if(whichstat == 3)
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
	if(whichstat == 4)
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
				*/
	//world << "5 pl [applycommas(pl)]  ki [applycommas(ki)] str [applycommas(str)]"