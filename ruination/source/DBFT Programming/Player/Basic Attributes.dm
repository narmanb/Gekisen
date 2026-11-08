
mob
	var
		tmp
			safe=0
			frozen=0
			cooldown=0
			doing=0
			talking=0
			challenge=0
			challenger=""
			regen_dead=0
			glare_delay=0
			glare_on=0
			ki_lock=0
			buku_lock=0
			it_lock=0
			aura_on=0
			buku=0
			e_db_1=0
			e_db_2=0
			e_db_3=0
			e_db_4=0
			e_db_5=0
			e_db_6=0
			e_db_7=0
			n_db_1=0
			n_db_2=0
			n_db_3=0
			n_db_4=0
			n_db_5=0
			n_db_6=0
			n_db_7=0
			b_db_1=0
			b_db_2=0
			b_db_3=0
			b_db_4=0
			b_db_5=0
			b_db_6=0
			b_db_7=0



			finalformfuse=0
			target=0
			owner = ""
			asking_fuse=0
			waiting=0
			firing_bomb=0

			tmp/tourny_watch=0
			blocking=0
			countering=0
			deflecting=0
			dodging=0
			regen_delay=0

			grav_delay=0
			candy_zapped=0
			hiting=0
			grav=0
			makingitem=0
			saving=0
			online=0
			dt_delay=0

			kienzan_target=""
			oocmute=0
			saymute=0
			spam_delay=0
			cant_trans=0
			GMLocked=0
			tp_delay=0
			power_delay=0
			rest_delay=0
			finish_delay=0



			say_delay=0
			adminsay_delay=0
			admin_muted=0

			boxing=0
			focus_boxing=0
			meditating=0
			boxing_delay=0
			meditating_delay=0
			focus_boxing_delay=0
			trans_delay=0
			rest=0

			attack_lock=0
			charging=0
			galing=0

			speeding=0

			splits=0



		weightgi = 0
		weightcape = 0
		weightarmor = 0
		weightarm = 0
		weightleg = 0
		weightankle = 0
		weightwrist = 0
		weighthead = 0
		suitequipped = 0
		weightsword = 0

		splits_max=0
		title="Player"
		rank = "Newbie"
		race=""
		gene=""
		warrior_level = ""
		karma="Good"
		karma_rating=0
		skin=""
		regens=100
		level=1
		exp=0
		expb=0
		expm=1
		expbm=0
		tnl=20

		mode = "Weak"
		moden = 0
		staminaleft_exp=0
		staminaleft_tnl=100


		tpu=0
		tpc=0
		tpcm=0
		zp=0
		zpu=0
		zpc=0
		zpcm=0
		statc=0
		statcm=0
		tsb=0

		custom_points=0

		tp=0
		powerlevel = 10
		powerlevel_max = 10
		powerlevel_bonus = 0
		power_multi
		power_maxm = 1
		ki = 5
		ki_max = 5
		ki_bonus = 0
		ki_multi
		ki_maxm = 1
		kidefense = 2
		kidefense_max = 2
		kidefense_bonus = 0
		kidefense_multi
		kidefense_maxm = 1
		strength = 1
		strength_max = 1
		strength_bonus = 0
		strength_multi
		strength_maxm = 1
		defence = 1
		defence_max = 1
		defence_bonus = 0
		defence_multi
		defence_maxm = 1
		speed = 1
		speed_max = 1
		speed_bonus = 0
		speed_multi
		speed_maxm = 1
		staminaleft=0
		staminaleft_max=1000
		rage=0
		rage_max=100
		melee = 10
		melee_exp = 0
		melee_tnl = 75
		melee_mastered = 0
		melee_max = 10
		melee_bonus = 0
		dodge = 10
		dodge_exp = 0
		dodge_tnl = 75
		dodge_mastered = 0
		dodge_max=10
		dodge_bonus = 0
		block = 10
		block_exp = 0
		block_tnl = 75
		block_mastered = 0
		block_max=10
		block_bonus = 0
		counter = 10
		count_exp = 0
		count_tnl = 75
		counter_mastered = 0
		counter_max=10
		counter_bonus = 0
		critical = 10
		crit_exp = 0
		crit_tnl = 75
		critical_mastered = 0
		critical_max=10
		critical_bonus = 0
		durability = 10
		durability_exp = 0
		durability_tnl = 75
		durability_mastered = 0
		durability_max=10
		durability_bonus = 0
		ki_control = 10
		ki_con_exp = 0
		ki_con_tnl = 75
		ki_control_mastered = 0
		ki_control_max = 10
		ki_control_bonus = 0
		ki_cast = 10
		ki_cast_exp = 0
		ki_cast_tnl = 55
		ki_cast_mastered = 0
		ki_cast_max = 10
		ki_cast_bonus = 0
		ki_power = 10
		ki_pow_exp = 0
		ki_pow_tnl = 75
		ki_power_mastered = 0
		ki_power_max = 10
		ki_power_bonus = 0
		ki_use = 10
		ki_use_exp = 0
		ki_use_tnl = 75
		ki_use_mastered = 0
		ki_use_max = 10
		ki_use_bonus = 0
		ki_res = 10
		ki_res_exp = 0
		ki_res_tnl = 75
		ki_res_mastered = 0
		ki_res_max = 10
		ki_res_bonus = 0
		reflect = 10
		reflect_exp = 0
		reflect_tnl = 75
		reflect_mastered = 0
		reflect_max=10
		reflect_bonus = 0
		weapon = 10
		weapon_exp = 0
		weapon_tnl = 75
		weapon_mastered = 0
		weapon_max = 10
		weapon_bonus = 0
		weapon_power = 10
		weapon_power_exp = 0
		weapon_power_tnl = 75
		weapon_power_mastered = 0
		weapon_power_max = 10
		weapon_power_bonus = 0
		weapon_resistance = 10
		weapon_res_exp = 0
		weapon_res_tnl = 75
		weapon_res_mastered = 0
		weapon_resistance_max = 10
		weapon_res_bonus = 0
		zenni=500
		eats=0
		absorbs=0
		assasin_kill=0
		infects=0
		corrupts=0
		drains=0
		pks=0
		kills=0
		deaths=0
		dead=0
		shards_used=0
		inven_min=0
		inven_max=25
		energy_code=0
		random=0
		pk=0
		chips=0
		chips_max=0
		mchips=0
		mchips_max=0
		in_arena=0
		weight=0
		add_exp=0
		wishes=0
		nwishes=0
		bwishes=0
		in_war = 0
		fused = 0
		follow = ""
		FuseFollower = 0
		followmob = 0
		it_taken = 0
		challenge_on = 1
		trans_aura_on = 1
		crater_on = 1
		first_login_after_update = 0

		head			= "EMPTY"
		back			= "EMPTY"
		chest			= "EMPTY"
		legs			= "EMPTY"
		feet			= "EMPTY"
		arms 			= "EMPTY"
		hands			= "EMPTY"
		waist 			= "EMPTY"
		underclothes 	= "EMPTY"
		clothes			= "EMPTY"
		weapone			= "EMPTY"
		suit			= "EMPTY"

		clothes_eq		= 0
		GItem_eq		= 0
		scouter 		= 0
		scouter_eq 		= 0
		scouter_channel = 1
		armor 			= 0
		armor_eq 		= 0
		under 			= 0
		under_eq 		= 0
		belt			= 0
		belt_eq			= 0
		helmet 			= 0
		helmet_eq 		= 0
		gloves 			= 0
		gloves_eq 		= 0
		cloak			= 0
		cloak_eq		= 0
		z_sword 		= 0
		demon_blade		= 0
		radar 			= 0
		hench_equiped 	= 0
		saiyan_equiped 	= 0
		sellable_items	= 0



		//NEW TRANS VARS
		transOpl = 0
		transOki = 0
		transOkidef = 0
		transOstr = 0
		transOdef = 0

		//these store the numbers
		trans_pl_gain = 0
		trans_ki_gain = 0
		trans_kidef_gain = 0
		trans_str_gain = 0
		trans_def_gain = 0

		hasgokubody = 0 // This is for zealot gene. Set to 1 when they wish for goku black

		//REBIRTH VARS
		rebirths = 0
		tmp/isrebirthing = 0

		//GYM VARS

		in_herculegym = 0

	//PC
	//	verb
/*			View_Map()
				set category="Channels"
				if(src.spam_delay)
					return
				src.spam_delay=1
				var/map = input("Please choose a map option?") in list("View Earth's Map","View Namek's Map","View Planet Vegeta's Map","View Planet Yardrat's Map","Cancel")
				if(map=="Cancel")
					src.spam_delay=0
					return
				if(map=="View Location")
					src<<browse(null)
					if(src.z==1)
						var/icon/M = icon('Map Earth.png')
						var/xx=src.x
						var/yy=src.y
						M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
						M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
					usr << browse_rsc('Map Yardrat.png')
					var/html = {"<img src="Map Yardrat.png" width="200px" height="200px" />"}
					src << browse(html, "window=Map;size=250x250")
						spawn(25)src.spam_delay=0
					if(src.z==2)
						var/icon/M = icon('Map Namek.png')
						var/xx=src.x
						var/yy=src.y
						M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
						M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
						usr<<browse_rsc(M)
						spawn(25)src.spam_delay=0
					if(src.z==3)
						var/icon/M = icon('Map Vegeta.png')
						var/xx=src.x
						var/yy=src.y
						M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
						M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
						usr<<browse_rsc(M)
						spawn(25)src.spam_delay=0
					if(src.z==4)
						var/icon/M = icon('Map Yardrat.png')
						var/xx=src.x
						var/yy=src.y
						M.DrawBox(rgb(160,0,0),(xx/2)-2,(yy/2)-2,(xx/2)+2,(yy/2)+2)
						M.DrawBox(rgb(215,92,0),(xx/2)-1,(yy/2)-1,(xx/2)+1,(yy/2)+1)
						usr<<browse_rsc(M)
						spawn(25)src.spam_delay=0
						src<<"You cannot check your location here."
						spawn(25)src.spam_delay=0
				if(map=="View Earth's Map")
					usr << browse_rsc('Map Earth.png')
					var/html = {"<img src="Map Earth.png" width="200px" height="200px" />"}
					src << browse(html, "window=Map;size=250x250")
					spawn(25)src.spam_delay=0
				if(map=="View Namek's Map")
					usr << browse_rsc('Map Namek.png')
					var/html = {"<img src="Map Namek.png" width="200px" height="200px" />"}
					src << browse(html, "window=Map;size=250x250")
					spawn(25)src.spam_delay=0
				if(map=="View Planet Vegeta's Map")
					usr << browse_rsc('Map Vegeta.png')
					var/html = {"<img src="Map Vegeta.png" width="200px" height="200px" />"}
					src << browse(html, "window=Map;size=250x250")
					spawn(25)src.spam_delay=0
					spawn(25)src.spam_delay=0
				if(map=="View Planet Yardrat's Map")
					usr << browse_rsc('Map Yardrat.png')
					var/html = {"<img src="Map Yardrat.png" width="200px" height="200px" />"}
					src << browse(html, "window=Map;size=250x250")
					spawn(25)src.spam_delay=0*/
obj
	var
		guild=""
		weight=0
		dball=0
		equiped
		value=0
		enchantment
		condition
		condition_max
		armour_protection
		hench_armour
		saiyan_armour
		item_owner
		uses=0
		lastx
		lasty
		lastz
		cooldown
		owner
		power = 0
		target = ""
		owners = ""
		range=0
//		oshown=1
/*
client
	North()
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=NORTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=NORTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==NORTH)
						usr.clasharrow=SOUTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	South()
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=SOUTH
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==SOUTH)
						usr.clasharrow=NORTH
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	East()
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=EAST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=EAST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==EAST)
						usr.clasharrow=WEST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()
	West()
		if(usr.thrown)
			return 0
		if(usr.frozen)
			if(usr.firing_bomb)
				7for(var/obj/Tech/B in world)
					if(B.owner==usr)
						B.dir=WEST
						return 0
				for(var/obj/techs/Overlays/B in world)
					if(B.owner==usr)
						B.dir=WEST
						return 0
			else
				for(var/obj/Tech/B in world)
					if(B.owner==usr&&usr.clasharrow==usr.dir)
						usr.clasharrow=EAST
						var/multi=1
						if(usr.form_1)multi=2
						if(usr.form_2)multi=2.2
						if(usr.form_3||usr.inverted)multi=2.3
						if(usr.form_4)multi=2.4
						if(usr.form_5)multi=2.5
						if(usr.form_6)multi=2.6
						B.clashrush+=(usr.ki_max*(0.06*multi))
						return 0
		..()

*/


mob/Monster/Move()
//	if(src.frozen)
//		return 0
	if(src.beingpushed)
		return 0
	if(src.regen_dead)
		return
	if(src.gravityfieldon)
		return 0
	if(src.binded)
		return 0
	if(src.GMLocked)
		return 0
	if(usr.KO)
		return 0
	if(src.sleeping)
		return
	//.

	var/walkdelay=src.movespeed
	/*
	if(src.speed >= 5000000 && src.speed <= 50000000)
		walkdelay = 3.5
	if(src.speed >= 50000000 && src.speed <= 500000000)
		walkdelay = 3
	if(src.speed >= 500000000 && src.speed <= 5000000000)
		walkdelay = 2.5
	if(src.speed >= 5000000000 && src.speed <= 50000000000)
		walkdelay = 2
	if(src.speed >= 50000000000 && src.speed <= 500000000000)
		walkdelay = 1.5
	if(src.speed >= 500000000000)
		walkdelay = 1
	if(src.buku)
		walkdelay-=1
	if(walkdelay<1)
		walkdelay=1
*/
//	walkdelay = 2


	if(src.speeding<=0)
	//	.=..()
	//	if(.)
		src.speeding = 1
		if(src.thrown)
			src.speeding=0
		/*
		if(usr.weight>0&&!src.buku)
			var/xp=usr.weight
			if(xp>16)
				xp=16
			usr.exp+=xp
			if(src.expbuff)usr.exp+=xp
			if(!usr.staminabuff)usr.staminaleft+=xp*0.4
			usr.staminaleft_exp+=xp*0.07
			spawn(1)
				usr.Fatigue_Level_Up()
				usr.Level_Up()
				usr.Tired_KO()
				*/

		sleep(walkdelay)
		src.speeding = 0
		..()



proc/applycommas(number)
	number=round(number,1)
	number=num2text(number,1000)
	var/digits=length(number)
	var/remaining=0
	var/returnnumber
	while(digits>=1)
		if(digits>3)
			var/end=","+copytext(number,digits-2,digits+1)
			var/get=end
			returnnumber=get+returnnumber
			remaining=(length(get)-1)+remaining
			digits-=3
		else
			var/get=copytext(number,1,(length(number)+1)-remaining)
			returnnumber=get+returnnumber
			digits=0
		sleep(-1)
	return returnnumber
mob/PC/Stat()

	if(statpanel("Vitals"))

		//statpanel("Vitals")
	//	stat("world.cpu", world.cpu)
		stat("Level:","[applycommas(src.level)]")
		//stat("EXP:","[applycommas(src.exp)]/[applycommas(src.tnl)]")

		stat("EXP:","[round(src.exp/src.tnl*100)]% (+[(src.expb*100)]%)")
		stat("-----------")

		if(src.powered||src.powering||src.kaioken)
			stat("PL:","<font color = #FF0000>[round(src.powerlevel/src.powerlevel_max*100)]%")
			stat("KI:","<font color = #FF0000>[round(src.ki/src.ki_max*100)]%")
		else
			stat("PL:","[round(src.powerlevel/src.powerlevel_max*100)]%")
			stat("KI:","[round(src.ki/src.ki_max*100)]%")
		stat("Fatigue:","[round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%")
		if(src.fullness > 0)
			stat("<font color = #008000><b>You are full")


		stat("[src.pvpflagtxt]")

		//stat("-----------")

		stat("Powerlevel:","[applycommas(src.powerlevel)] / [applycommas(src.powerlevel_max)]")
	//	stat("Powerlevel:","[applycommas(src.powerlevel)] / [applycommas(src.powerlevel_max)] ([applycommas(src.powerlevel_bonus)])")
		stat("Ki:","[applycommas(src.ki)] / [applycommas(src.ki_max)] ([applycommas(src.ki_bonus)])")
//		stat("Ki Defense:","[applycommas(src.kidefense)] / [applycommas(src.kidefense_max)] ([applycommas(src.kidefense_bonus)])")
		stat("Strength:","[applycommas(src.strength)] / [applycommas(src.strength_max)] ([applycommas(src.strength_bonus)])")


		stat("Defense:","[applycommas(src.defence)] / [applycommas(src.defence_max)] ([applycommas(src.defence_bonus)])")


		stat("-----------")
		stat("Energy Code:","[applycommas(src.energy_code)]")



		if(src.massshardp)
			stat("<font color = #66ffff>Permanent Exp Shard Activated</font>")
		if(src.massshardsp)
			stat("<font color = #66ff66>Permanent Stat Shard Activated</font>")
		if(src.massshardzp)
			stat("<font color =#ffff00>Permanent Zenni Shard Activated</font>")
		if(src.scouter)
			stat("Location:","[src.x],[src.y],[src.z]")
		if(src.zpvkills > 0)
			stat("<font color =#FF8000>[src.zpvkills] extra kills remaining</font>")
			//stat("-----------")
	//	sleep(15)

	if(statpanel("Overall"))
		//statpanel("Overall")
		stat("-----Character-----")
		stat("Race:","[src.race]")
		stat("Gene:","[src.gene]")



	//	stat("Class:","[src.class]")
	//	stat("Warrior Level:","[src.warrior_level]")
//		stat("POWERMULTI:","[src.power_multi]")
		stat("Ki Stat Multi:","[src.ki_multi]")
//		stat("KIDEFMULTI:","[src.kidefense_multi]")
		stat("Strength Stat Multi:","[src.strength_multi]")
		stat("Defense Stat Multi:","[src.defence_multi]")
//		stat("Resets:",src.resets)
		stat("Rebirths:",src.rebirths)

		stat("Rank:","[src.rank]")
	//	stat("Specialty:","[src.specialty]")
		stat("Karma:","[src.karma] - [round(src.karma_rating)]%")
		stat("-----Training-----")
		stat("Concentraining Primarily on:",training1)
		stat("Concentraining Secondarily on:",training2)
		stat("Mode:","[src.mode] ([src.moden])")
		stat("Training Point Crit:","[src.tpc]%")
	//	stat("Z Point Crit:","[src.zpc]%")
		stat("Stat Crit:","[src.statc]%")

		stat("Training Points:","[applycommas(src.tp)]")

		stat("Z points:",src.zp)
	//	stat("Z point cap:","[src.zpspent]/[src.zpcap]")
//		if(src.custom_points > 0)
//			stat("Custom Points:",src.custom_points)

	//	stat("Skill Points:",src.skill_points)
		stat("Rage:",src.rage)
		//stat("HBTC times: ","[src.hbtc_times]/3")
		stat("Shards Used:","[shards_used]")
		stat("Training Points Used:","[applycommas(tpu)]")
		stat("Z Points Used:","[zpu]")
		//stat("Total Stat Bonuses:","[applycommas(tsb)]")
		stat("-----Transformations-----")
		if(src.race == "Kai")
			if(src.gene == "Zealot" && src.hasgokubody == 0)
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			if(src.gene == "Pure Blooded")
				stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.hasgokubody == 1 || src.race == "Bio Warrior" || src.race == "Majin Wizard" || src.race == "Changeling" || src.race == "Half Saiyan" || src.race == "Heran" || src.race == "Saiyan")
			stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
			stat("Transformation Skill:","[src.trans_lvl]")
			stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
			stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Dragon" || src.race == "Konat"||src.race == "Feline")
			stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
			stat("Invert Skill:","[src.invertlvl]")
			stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
			stat("Invert Speed:","[src.invertdelay/10] seconds")

		if(src.race == "Android")
			if(src.gene == "Gluttonous")
				stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
			else
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
		if(src.race == "Bio Android")
			if(src.gene == "Pure Blooded")
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			else
				if(src.gene == "Perfect")
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
					stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
					stat("Transformation Skill:","[src.trans_lvl]")
					stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
					stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Demon")
			if(src.gene == "Malevolent")
				stat("Transformation Exp:","[round(src.trans_exp /src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
			else
				if(src.gene == "Sinister" && !src.transformed)
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
				else
					if(src.gene == "Vile" && !src.transformed)
						stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
						stat("Invert Skill:","[src.invertlvl]")
						stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
						stat("Invert Speed:","[src.invertdelay/10] seconds")
						stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
						stat("Transformation Skill:","[src.trans_lvl]")
						stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
						stat("Transformation Speed:","[src.trans_spd/10] seconds")
					else
						stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
						stat("Transformation Skill:","[src.trans_lvl]")
						stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
						stat("Transformation Speed:","[src.trans_spd/10] seconds")

		if(src.race == "Alien")
			if(src.gene == "Hitman")
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			else
				stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Human")
			if(src.gene == "Pure Blooded" || src.gene == "Mystic" || src.gene == "Bloodthirsty" || src.gene == "Roshi")
				stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
			else
				if(src.gene == "Majin Incarnate")
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
					stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
					stat("Transformation Skill:","[src.trans_lvl]")
					stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
					stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Namekian")
			if(src.gene == "Pure Blooded" || src.gene == "Descendant")
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			else
				if(src.gene == "Corrupted")
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
					stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
					stat("Transformation Skill:","[src.trans_lvl]")
					stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
					stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Majin")
			if(src.gene == "Pure Blooded")
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			else
				if(src.gene == "Malicious")
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
					stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
					stat("Transformation Skill:","[src.trans_lvl]")
					stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
					stat("Transformation Speed:","[src.trans_spd/10] seconds")
		if(src.race == "Saibaman")
			if(src.gene == "Pure Blooded")
				stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
				stat("Transformation Skill:","[src.trans_lvl]")
				stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
				stat("Transformation Speed:","[src.trans_spd/10] seconds")
			else
				if(src.gene == "Virulent" || src.gene == "Godly")
					if(!src.transformed)
						stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
						stat("Invert Skill:","[src.invertlvl]")
						stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
						stat("Invert Speed:","[src.invertdelay/10] seconds")
		if(src.race == "Tuffle")
			if(src.gene == "Pure Blooded")
				stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
				stat("Invert Skill:","[src.invertlvl]")
				stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
				stat("Invert Speed:","[src.invertdelay/10] seconds")
			else
				if(src.gene == "Virulent"||src.gene == "Venerable")
					stat("Invert Exp:","[round(src.invertexp/src.inverttnl*100)]%")
					stat("Invert Skill:","[src.invertlvl]")
					stat("Invert Speed Exp:","[round(src.invertsexp/src.invertstnl*100)]%")
					stat("Invert Speed:","[src.invertdelay/10] seconds")
					stat("Transformation Exp:","[round(src.trans_exp/src.trans_tnl*100)]%")
					stat("Transformation Skill:","[src.trans_lvl]")
					stat("Transformation Speed Exp:","[round(src.transsexp/src.transstnl*100)]%")
					stat("Transformation Speed:","[src.trans_spd/10] seconds")
		stat("-----Physical Skills-----")

		stat("Melee:","[src.melee] ([src.melee_exp]/[src.melee_tnl])  ([src.melee_bonus])")


		stat("Block:","[src.block] ([src.block_exp]/[src.block_tnl])  ([src.block_bonus])")


		stat("Dodge","[src.dodge] ([src.dodge_exp]/[src.dodge_tnl]) ([src.dodge_bonus])")

		stat("Counter Attack:","[src.counter] ([src.count_exp]/[src.count_tnl]) ([src.counter_bonus])")


		stat("Critical:","[src.critical] ([src.crit_exp]/[src.crit_tnl]) ([src.critical_bonus])")


		stat("Durability:","[src.durability] ([src.durability_exp]/[src.durability_tnl]) ([src.durability_bonus])")

		stat("-----Energy Skills-----")

		stat("Ki Control:","[src.ki_control] ([src.ki_con_exp]/[src.ki_con_tnl]) ([src.ki_control_bonus])")


		stat("Ki Cast:","[src.ki_cast] ([src.ki_cast_exp]/[src.ki_cast_tnl]) ([src.ki_cast_bonus])")


		stat("Ki Power:","[src.ki_power] ([src.ki_pow_exp]/[src.ki_pow_tnl]) ([src.ki_power_bonus])")


		stat("Ki Use:","[src.ki_use] ([src.ki_use_exp]/[src.ki_use_tnl]) ([src.ki_use_bonus])")


		stat("Ki Resistance:","[src.ki_res] ([src.ki_res_exp]/[src.ki_res_tnl]) ([src.ki_res_bonus])")


//		stat("Deflect:","[src.reflect] ([src.reflect_exp]/[src.reflect_tnl]) ([src.reflect_bonus])")


		stat("-----Weapon Skills-----")

		stat("Weapon:","[src.weapon] ([src.weapon_exp]/[src.weapon_tnl]) ([src.weapon_bonus])")

		stat("Weapon Power:","[src.weapon_power] ([src.weapon_power_exp]/[src.weapon_power_tnl]) ([src.weapon_power_bonus])")

		stat("Weapon Resistance:","[src.weapon_resistance] ([src.weapon_res_exp]/[src.weapon_res_tnl]) ([src.weapon_res_bonus])")

		stat("-----PVP-----")
		stat("Kills:","[applycommas(src.kills)]")
		stat("Player Kills:","[src.pks]")
		if(src.race == "Android")
			stat("Chips Installed:","[src.chips]")
		if(src.race == "Android")
			stat("Mega Chips Installed:","[src.mchips]")
		if(src.race == "Bio Android")
			stat("Absorbs:","[src.absorbs]")
		if(src.race == "Alien")
			if(src.gene== "Hitman")
				stat("Assassinations:","[src.assasin_kill]")
		if(src.race == "Demon")
			stat("Corruptions:","[src.corrupts]")
		if(src.race == "Namekian")
			if(src.gene == "Corrupted")
				stat("Corruptions:","[src.corrupts]")
		if(src.race == "Saibaman" || src.race == "Tuffle")
			stat("Infections:","[src.infects]")
		if(src.race == "Majin")
			stat("Candies Eaten:","[src.eats]")
		if(src.race == "Human" && src.gene == "Majin Incarnate")
			stat("Candies Eaten:","[src.eats]")
		stat("Deaths:","[applycommas(src.deaths)]")
		stat("-----Wishes-----")
		stat("Earth Wishes:","[wishes]")
		stat("Namek Wishes:","[nwishes]/3")
		stat("Black Wishes:","[bwishes]/1")
		stat("-----------")

		//sleep(15)


		//if(src.tab_inventory)
	if(statpanel("Inventory"))
		stat("Head:",src.head)
		stat("Back:",src.back)
		stat("Chest:",src.chest)
		stat("Clothes:",src.clothes)
		stat("Underclothing:",src.underclothes)
		stat("Arms:",src.arms)
		stat("Hands:",src.hands)
		stat("Waist",src.waist)
		stat("Legs:",src.legs)
		stat("Feet:",src.feet)
		stat("Weapon:",src.weapone)
		stat("Suit:",src.suit)
		if(src.inven_min > 0)
			stat("--------","")
			for(var/obj/Equipment/O1 in src)
				stat(O1)
			for(var/obj/Gym/GI in src)
				stat(GI)
			for(var/obj/Props/Furnature/GF in src)
				stat(GF)
			for(var/obj/Earth_Dragonballs/O2 in src)
				stat(O2)
			for(var/obj/Namek_Dragonballs/O3 in src)
				stat(O3)
			for(var/obj/Black_Dragonballs/O4 in src)
				stat(O4)
		stat("--------","")
		stat("Zenni:","[applycommas(src.zenni)]")
		stat("Banked Zenni:","[applycommas(src.banked_zenni)]")
		stat("Space:","[src.inven_min] / [src.inven_max]")
		//sleep(15)
	if(src.tab_quests)
		if(statpanel("Quests"))
			stat("Quest Points:","[applycommas(src.questpoints)]")
			stat("Exploding Saibaman Total Kills:","[applycommas(src.ExplodingSaibamanKillsMax)]")
			stat("Exploding Cell Junior Total Kills:","[applycommas(src.ExplodingCellKillsMax)]")
			if(src.startedfarm)
				stat("Farmer Kill Quest:","[applycommas(src.killsfarm)] / 10000")
			else
				stat("Farmer Kill Quest:","Find the farmer who needs help saving his crops from overpopulated mobs!")

			if(src.BankQuestCanTake)
				stat("Bank Raid Quest:","A thief needs your help raiding the bank, seek him out!")

			for(var/obj/Quests/O in contents)
			//if(statpanel("Quests"))
				stat(O)


/*
	if(src.in_guild&&src.tab_guild&&statpanel("Guild Members"))
		for(var/mob/PC/M in player)
			if(M.guild_name == src.guild_name)
				stat("-----------")
				stat("[M] ([M.key])")
				stat("Level:","[M.level]")
				stat("Race:","[M.race]")
		//		stat("Class:","[M.class]")
				stat("Warrior Level:","[M.warrior_level]")
				stat("Rank:","[M.rank]")
		//		stat("Specialty:","[M.specialty]")
				stat("Player Kills:","[M.pks]")
		//sleep(15)
		*/
/*
	if(src.tab_saga&&statpanel("Saga"))
		stat("Current Saga:","[saga]")
		stat("Saga Part:","[part]")
		stat("Saga Difficulty:","[saga_difficulty]")
		for(var/mob/Saga/M in world)
			stat(M)
			var/planet
			if(M.z == 1)planet = "Earth"
			if(M.z == 2)planet = "Namek"
			if(M.z == 3)planet = "Planet Vegeta"
			if(M.z == 7)planet = "Other World"
			stat("Location:","[planet]([M.x],[M.y],[M.z])")
			stat("","")
			*/

//	for(var/obj/Vote/V in world)
//		if(statpanel("Vote"))
//			stat(V)
//			stat("Vote starter:","[V.VoterN]{[V.Voter]}")
//			stat("Vote target:","[V.VotedN]{[V.Voted]}")
//			stat("Vote reason:","[V.reason]")
//			stat("Votes (Y/N):","[V.yes]/[V.no]")
//			stat("Time left:","[V.time] seconds")
//			stat("----------")




proc/Time()
	var/hours = 0;var/minutes = 0;var/seconds = 0;var/temp
	temp = world.time-50
	seconds = round(temp/10)
	while(seconds >= 60)
		seconds -= 60
		++minutes
	while(minutes >= 60)
		minutes -= 60
		++hours
	if(minutes < 10)
		minutes = num2text(minutes)
		minutes = "0[minutes]"
	if(seconds < 10)
		seconds = num2text(seconds)
		seconds = "0[seconds]"
	return "[hours] hrs:[minutes] min(s):[seconds] secs"



proc/commas(T)
    // Account for decimals
	var/result=""
	var/dotpos=findtext(T,".")
	if (dotpos)
		result=copytext(T,dotpos)
		T=copytext(T,1,dotpos)
    // Insert commas
	var/addednum=0
	while(length(T))
		if (addednum && T!="-" && T!="+") result=","+result
		addednum=1
		result=copytext(T,max(1,length(T)-2))+result
		T=copytext(T,1,max(1,length(T)-2))
	return result
