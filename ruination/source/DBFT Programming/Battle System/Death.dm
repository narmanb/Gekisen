mob
	var
		witness_deaths = 0
		arena_lose = 0
		arena_win = 0
		enraged=0
		gone_ssj=0
		pvp_level = 0
		pvp_rating = 0
		tmp
			gained
mob
	proc
		ResetSomeStats()
			src.thrown=0
			src.ftrain=0
			src.dtrain=0
			src.strain =0
			src.mtrain=0
			src.overlays-=icon('Techs.dmi',"galaticdonut")
			src.overlays-=icon('Techs.dmi',"demonshackle")
			src.overlays-=icon('Techs.dmi',"imprisonmentball")
			src.binded=0
			src.doing=0
			src.frozen=0
			src.boxing=0
	//		src.dualtrain=0
			src.finish_delay=0
			src.deflecting = 0
			src.dodging = 0
			src.blocking = 0
			src.countering = 0
			src.ftrain = 0
			src.mtrain = 0
			src.dtrain = 0
			src.strain = 0
			src.e_db_1 = 0
			src.e_db_2 = 0
			src.e_db_3 = 0
			src.e_db_4 = 0
			src.e_db_5 = 0
			src.e_db_6 = 0
			src.e_db_7 = 0
			src.n_db_1 = 0
			src.n_db_2 = 0
			src.n_db_3 = 0
			src.n_db_4 = 0
			src.n_db_5 = 0
			src.n_db_6 = 0
			src.n_db_7 = 0
			src.b_db_1 = 0
			src.b_db_2 = 0
			src.b_db_3 = 0
			src.b_db_4 = 0
			src.b_db_5 = 0
			src.b_db_6 = 0
			src.b_db_7 = 0
		Rage_Unleash()
			if(src.race == "Saiyan" && !src.gone_ssj)
				if(src.gene == "Honourable")
					if(src.powerlevel_max >= 17500000)
						if(src.witness_deaths >= 1)
							if(!src.gone_ssj)
								src.gone_ssj = 1
								for(var/mob/PC/M in oview(8))
									if(M != src)
										M << "\white <I>[src.name] Stands there, his face twisted with Rage..."
										spawn(10) M << "\white <I>[src.name] clentchs his fists, as tears well in his eyes. Veins protrude from [src.name]'s hands and forehead as the ground rumbles"
								src << "\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died in front of you"
								sleep(10)
								src << "\white <I>You clentch your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles"
								src.icon_state = "enrage"
								sleep(10)
								view(8) << "\white [src.name]: I WILL NOT LET IT HAPPEN ANYMORE!"
								src.powerlevel = src.powerlevel_max
								src.contents += new/obj/Transform/Transform
								src.contents += new/obj/Transform/Revert
								spawn(1) src.SaiyanTrans()
								Explode(new /Effect/BasicBoom(src.loc,1,4))

			if(src.race == "Half Saiyan" && !src.gone_ssj2)
				if(src.gene == "Mystic")
					if(src.powerlevel_max >= 350000000)
						if(src.witness_deaths >= 1)
							if(!src.gone_ssj2)
								for(var/mob/PC/M in oview(8))
									if(M != src)
										M << "\white <I>[src.name] Stands there, his face twisted with Rage..."
										spawn(10) M << "\white <I>[src.name] clentchs his fists, as tears well in his eyes. Veins protrude from [src.name]'s hands and forehead as the ground rumbles"
								src << "\white <I>You feel an uncontrollable rage burning in you as you remember the people who have died infront of you"
								sleep(10)
								src << "\white <I>You clentch your fists, as tears well in your eyes. Veins protrude from your hands and forehead as the ground rumbles"
								src.icon_state = "enrage"
								sleep(10)
								view(8) << "\white [src.name]: I must let it all go...I musn't hold back...I may not be strong enough...but..."
								sleep(10)
								view(8) << "\white [src.name]: I can't...give...UP! I WON'T GIVE UP!!"
								src.powerlevel = src.powerlevel_max
								src.form_1 = 1
								src.form_2 = 1
								src.form_3 = 0
								src.gone_ssj2 = 1
								src.HalfSaiyanTrans()
								Explode(new/Effect/BasicBoom(src.loc,1,6))


mob/proc/DeathCheck()
	if(src.powerlevel <= 0)
		src.in_hbtc=0
		if(!src.color)
			animate(src, color = null, alpha = 255, time = 5)
		..()
	return
mob/Monster/DeathCheck(mob/PC/M)


	if(src.powerlevel <= 0)
		var/bonus_exp = round(src.exp)
		if(M.expbuff)bonus_exp*=1.1
//		var/bonus_tp = rand(75,120)
/*
		if(src.name == "Exploding Saibaman")
			M.ExplodingSaibamanKills += 1
			M.1ingSaibamanKillsMax += 1
			M.explodecurrentkills += 1
			if(prob(50))
				bonus_exp = M.tnl
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingSaibaReward()
		if(src.name == "Exploding Cell")
			M.ExplodingCellKills += 1
			M.ExplodingCellKillsMax += 1
			M.explodecurrentkillscell += 1
			bonus_exp = M.tnl*rand(2,4)
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingCellReward()
			*/

//		var/bonus_sp = 1
		if(istype(M,/mob/PC))
/* The Code for ultra instinct saiyans
		if(src.race == "Saiyan")
			if(prob(5))
				src.SaiyanRevert()
				if(src.powerlevel_max >= 25000000)
					src.safe=1
					src.doing = 1
					src.icon_state = "enrage"
					sleep(25)
							view(8)<<"\white[src]: \font AAAAAAAAAAAaaaaaHHHHH"
					src.frozen = 1
					src.powerlevel = src.powerlevel_max
					if(src.ki>src.ki_max)
						src.ki = src.ki_max
					if(src.kidefense>src.kidefense_max)
						src.kidefense=src.kidefense_max
					if(src.strength>src.strength_max)
						src.strength = src.strength_max
					if(src.defence>src.defence_max)
						src.defence = src.defence_max
					src.overlays -= src.aura
					src.underlays -= src.underlays
					src.powerlevel *= 240
					src.ki *= 180
					src.kidefense*=180
					src.strength *= 220
					src.defence *= 190
					src.block += 700
					src.dodge += 700
					src.critical += 200
					src.reflect += 700
					src.counter += 700
					src.speed=src.speed_max-20000
					if(src.speed<500)
						src.speed=500
					src.icon_state = ""
					src.Skin_Apply()
					src.form_3 = 0
					src.frozen = 0
					src.doing = 0
					src.safe =0
					src.UI=1
					src.overlays += 'Ultra Instinct.dmi'
					this sleep is for how long until the changes are reverted
					spawn(300)src.SaiyanRevert()src.UI=0
					return*/
			if(M.in_party)
				var/count=0
				for(var/mob/M2 in player)
					if(M2.in_party == 0) continue
					if(M2.party_name==M.party_name)
						count++
						var/exp2=round(src.exp/count)
						var/z=round(src.zenni/count)
						if(M2.smallshard)
							exp2*=1.25
						if(M2.largeshard)
							exp2*=1.5
						if(M2.greatshard)
							exp2*=1.75
						if(M2.massshard)
							exp2*=2
						if(M2.smallshardz)
							z*=1.25
						if(M2.largeshardz)
							z*=1.5
						if(M2.greatshardz)
							z*=1.75
						if(M2.massshardz)
							z*=2
						exp2*=M2.expm
						exp2*=sexp
						z*=szenni
						M2.exp+=exp2

						M2.zenni+=z
						if(M2.hudenabled)
							if(!M2.calledlvlup&&!M2.calledexphud)
								//M2.calledexphud = 1
								//spawn(50) M2.calledexphud = 0
								spawn() M2.updateexp()
						if(M2.partyrewards)
							//M2 << output("\gray Zenni +[applycommas(z)]","output2")
							M2 << output("EXP +[applycommas(exp2)]<br>Zenni +[applycommas(z)]","output2")
						if(!M2.calledlvlup)
							if(M2.exp >= M2.tnl)
								spawn(-1)M2.Level_Up()
						//spawn(-1) M2.Level_Up()
			else
				if(M.smallshard)
					bonus_exp*=1.25
				if(M.largeshard)
					bonus_exp*=1.5
				if(M.greatshard)
					bonus_exp*=1.75
				if(M.massshard)
					bonus_exp*=2
				if(M.smallshardz)
					src.zenni*=1.25
				if(M.largeshardz)
					src.zenni*=1.5
				if(M.greatshardz)
					src.zenni*=1.75
				if(M.massshardz)
					src.zenni*=2
		/*		if(prob(1))
					if(prob(50))
						M.skill_points += bonus_sp
						M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
			/*
				if(prob(20))
					if(prob(src.tpc))
						bonus_tp*=2
						src.tp += bonus_tp
						if(src.training_on == 1)
							src << output("<b><font color = red>Training points +[tp]","output2")
					else
						src.tp += bonus_tp
						if(src.training_on == 1)
							src << output("<font color = white>Training points +[tp]","output2")

*/
/*
				if(src.race == "Exploding Saibaman")
					M.ExplodingSaibamanKills += 1
					M.ExplodingSaibamanKillsMax += 1
					M.explodecurrentkills += 1
					if(prob(50))
						bonus_exp = src.tnl
					//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
					//if(M.ExplodingSaibamanKills >= 5)
					spawn(-1) M.ExplodingSaibaReward()
*/

				bonus_exp*=M.expm
				bonus_exp*=sexp
				src.zenni*=szenni
				M.exp += bonus_exp
				M.zenni += src.zenni
				if(M.hudenabled)
					if(!M.calledlvlup&&!M.calledexphud)
						//M.calledexphud = 1
						//spawn(50) M.calledexphud = 0
						spawn() M.updateexp()
				if(M.killrewards)
					M << output("\white Zenni +[applycommas(src.zenni)]","output2")
					M << output("\white EXP +[applycommas(bonus_exp)]","output2")

				if(M.karma == "Good"&&src.karma == "Good")
					M.karma_rating -= 0.1
				if(M.karma == "Good"&&src.karma == "Evil")
					if(M.karma_rating>=100)
						M.karma_rating=100
					else
						M.karma_rating += 0.1
				if(M.karma == "Evil"&&src.karma == "Good")
					if(M.karma_rating>=100)
						M.karma_rating=100
					else
						M.karma_rating += 0.1
				if(M.karma == "Evil"&&src.karma == "Evil")
					M.karma_rating -= 0.1
				if(M.karma_rating < 0)
					if(M.karma == "Good")
						M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
						M.karma = "Evil"
						M.karma_rating = 0
					else
						M << output("<I>You feel the Good inside of you begin to awaken...","output2")
						M.karma = "Good"
						M.karma_rating = 0

		if(src.race == "Green Saibaman")
			M.green_kills+=1
		if(src.race == "Henchman")
			M.thug_kills+=1
		if(src.race == "Namekian Warrior")
			M.namek_kills+=1
		if(src.race == "Dragon")
			M.dragonkills+=1
		if(M.startedfarm)
			M.killsfarm += 1


//Crim added 2.65, if you are 20k levels higher than the mob you wont get a kill rank for killing it
		var/klevel = round(20000+(src.level*1))
		if(M.level<=klevel)
			M.kills +=1*s_kill
		if(M.zpvkills > 0)
			M.kills += 1
			M.zpvkills -= 1
			if(M.zpvkills <= 0)
				M << "<font size = 2><b><red>Your zp kill bonus has expired"
		M.Rank_Up()
		spawn(-1) src.Item_Drop()
		src.dead=1
		if(!M.calledlvlup)
			if(M.exp >= M.tnl)
				spawn(-1)M.Level_Up()
		if(prob(20))
			spawn(-1) M.StatTick()
		//M.Character_Up_ST()
		del src
	//	src.name = "GC Mob"
	//	src.AITarget = null
	//	src.loc = null

	//	src.loc = locate(0,0,0)
		//world << "<font color = green>THREE<b>[src] target: [src.AITarget] loc: [src.loc]"
		//spawn() GCcheck(src)

		//world << "target: [src.AITarget]"
		//spawn(20) world << "<font color = red>target: [src.AITarget]"
		//spawn(200) world << "<font color = blue>target: [src.AITarget]"
		//world << "<font color = red>Spawn over"
		//itemref = null
		//if(check)
		//	world << "<font color = blue><b>CHECK DELETED"
		//	del check
		..()

mob/Saga/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp= src.exp
		var/bonus_tp = rand(100,150)
//		var/bonus_sp = 1
		if(M.expbuff)bonus_exp*=1.2
		if(istype(M,/mob/PC))
			if(M.in_party)
				var/count=0
				for(var/mob/M2 in player)
					if(M2.party_name==M.party_name)
						count+=1
						var/exp2=round(src.exp/count)
						var/z=round(src.zenni/count)
						if(M2.smallshard)
							exp2*=1.25
						if(M2.largeshard)
							exp2*=1.5
						if(M2.greatshard)
							exp2*=2
						if(M2.massshard)
							exp2*=3
						if(M2.smallshardz)
							z*=1.25
						if(M2.largeshardz)
							z*=1.5
						if(M2.greatshardz)
							z*=2
						if(M2.massshardz)
							z*=3
						exp2*=M.expm
						exp2*=sexp
						z*=szenni
						M2.zenni+=z
						M2.exp += exp2
						M2 << output("\white Zenni +[applycommas(z)]","output2")
						M2 << output("\white EXP +[applycommas(exp2)]","output2")
						spawn(-1) M2.Level_Up()
			else
				if(M.smallshard)
					bonus_exp*=1.25
				if(M.largeshard)
					bonus_exp*=1.5
				if(M.greatshard)
					bonus_exp*=2
				if(M.massshard)
					bonus_exp*=3
				if(M.smallshardz)
					src.zenni*=1.25
				if(M.largeshardz)
					src.zenni*=1.5
				if(M.greatshardz)
					src.zenni*=2
				if(M.massshardz)
					src.zenni*=3
		/*		if(prob(1))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
				if(prob(30))
					if(prob(src.tpc))
						bonus_tp*=2
						src.tp += bonus_tp
						if(src.training_on == 1)
							src << output("<b><font color = red>Training points +[tp]","output2")
					else
						src.tp += bonus_tp
						if(src.training_on == 1)
							src << output("<font color = white>Training points +[tp]","output2")
				bonus_exp*=M.expm
				bonus_exp*=sexp
				M.exp += bonus_exp
				M.zenni += src.zenni
				M << output("\white Zenni +[applycommas(src.zenni)]","output2")
				M << output("\white EXP +[applycommas(bonus_exp)]","output2")
	//			M.PK_LVLUP(src.CPS)
				spawn(-1) M.Level_Up()
				if(M.karma == "Good"&&sagas_good)
					M.karma_rating -= 1
				if(M.karma == "Good"&&sagas_evil)
					if(M.karma_rating>=100)
						M.karma_rating=100
					else
						M.karma_rating += 1
				if(M.karma == "Evil"&&sagas_good)
					if(M.karma_rating>=100)
						M.karma_rating=100
					else
						M.karma_rating += 1
				if(M.karma == "Evil"&&sagas_evil)
					M.karma_rating -= 1
				if(M.karma_rating < 0)
					if(M.karma == "Good")
						M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
						M.karma = "Evil"
						M.karma_rating = 0
					else
						M << output("<I>You feel the Good inside of you begin to awaken...","output2")
						M.karma = "Good"
						M.karma_rating = 0
		if(istype(src,/mob/Saga))
			saga_episode ++

		player <<"<FONT color = #990000>Saga Information:<FONT color = White> [M] defeated [src]!"

/*		var/klevel = round(20000+(src.level*1))
		if(M.level<=klevel)
			M.kills +=1
		else
			M<<"You are too strong to get a kill point, please kill mobs that your no more than 20k levels above"*/
		M.kills+=1
		M.Rank_Up()
		spawn() src.Item_Drop()
		del(src)
		..()

mob/PC/DeathCheck(mob/M,T)

	if(src.powerlevel <= 0)
		src.pvpflagged=0
		src.pvptimer=0
		src.in_hbtc=0
/*		for(var/turf/Floors/CTF_Field/S in view(6))
			if(S in view(8))
				if(src.powerlevel <= 0)
					for(var/obj/Flag/O in src)
						O.loc = src.loc
						..()
					src.Power_Redefine()
					src.overlays -= rtarget
					src.overlays -= btarget
					src << "<Font color=white>You can return to the game shortly."
					src.loc=locate(150,193,9)
					spawn(300)
						if(src.ctfteam=="Blue")
							src.loc=locate(80,127,9)
						if(src.ctfteam=="Red")
							src.loc=locate(22,127,9)
					return
*/
		for(var/turf/Floors/Safe_Zone/S in oview(12,src))
			if(S in oview(12,src))
				if(src.powerlevel<1)
					src.powerlevel=1
				return
		for(var/turf/Floors/BudokaiZone/S in view(1,src))
			if(S in view(1,src))
				if(src.powerlevel<1)
					src.powerlevel=1
				return
		var/deathmsg = 0
		if(!T||T=="")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			deathmsg = 1
		if(T=="Infect")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Infected by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(T=="Absorb")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Absorbed by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(T=="Candy")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been turned to Candy by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(T=="Corrupt")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Corrupted by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(T=="Drain")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been Drained by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(T=="Assasinate")
			T="<FONT color = red>Battle Information:<FONT color = White> [src] has been assassinated by [M]!"
			src.regen_dead=1
			deathmsg = 1
		if(deathmsg == 0)
			T = "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			player << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
		player << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
		if(M)
			M.attacker=""
		src.attacker=""
		if(src==M)goto cont
		if(prob(30))
			if(src==M) goto cont
			if(M.gained) goto cont
			if(prob(M.zpc))
				player <<"<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>2 Z Points<font color=white> from [src]'s final breathe!</font>"
				M.zp += 2
				spawn(50)M.gained=0
				M.gained=1
			else
				player <<"<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>1 Z Point<font color=white> from [src]'s final breathe!</font>"
				M.zp ++
				spawn(50)M.gained=0
				M.gained=1
			goto cont
		cont
	/*		if(M.powerlevel_max >= src.powerlevel_max)
				if(prob(66))
					world << "<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>1 Z Point<font color=white> from [src]'s final breathe!</font>"
					M.zp ++
				else
					world << "<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>2 Z Points<font color=white> from [src]'s final breathe!</font>"
					M.zp += 2
			else
				if(prob(33))
					world << "<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>1 Z Point<font color=white> from [src]'s final breathe!</font>"
					M.zp ++
				else
					world << "<font color=#0066ff>Training Information:<font color=white> [M] has claimed </font><font color=red>2 Z Points<font color=white> from [src]'s final breathe!</font>"
					M.zp += 2*/

		for(var/mob/PC/M2 in oview(8))
			if(M2!=M&&M2!=src)
				if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
					M2.witness_deaths ++
					if(!src.gone_ssj)
						spawn(1)M2.Rage_Unleash()
				M2 << output("\red You feel your Rage Grow...","output2")
				M2.rage += round(rand(15,25))
				if(M2.rage >= 100)
					M2.rage = 100
		src.ResetSomeStats()
		if(M.karma == src.karma)
			M.karma_rating -= 1
		else
			M.karma_rating += 1
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << output("<I>You feel the Good inside of you begin to awaken...","output2")
				M.karma = "Good"
				M.karma_rating = 0
		for(var/obj/Earth_Dragonballs/O1 in src)
			O1.loc = src.loc
		for(var/obj/Namek_Dragonballs/O2 in src)
			O2.loc = src.loc
		for(var/obj/Black_Dragonballs/O3 in src)
			O3.loc = src.loc
		for(var/obj/Equipment/Event_Item/O4 in src)
			player << "<font color = #ea0000>Event Information: <font color = white>[src.name] dropped [O4.name]!"
			O4.loc = src.loc
		src.Power_Redefine()
		if(src.race == "HHHH")
			src.regen_dead=0
			src.dead=1
			if(M!=src)

				var/bonus_exp = M.level*10
				if(bonus_exp > src.level*10)
					bonus_exp = src.level*10
				bonus_exp += rand(20,1000)
				var/bonus_tp = rand(100,250)
	//			var/bonus_sp = 2

				if(M.expbuff)bonus_exp*=2
				if(istype(M,/mob/PC))
			/*		if(prob(5))
						M.skill_points += bonus_sp
						M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
					if(prob(50))
						M.tp += bonus_tp
						M << output("\white Training Points +[bonus_tp]","output2")
					bonus_exp*=M.expm
					M.exp += bonus_exp
					M << output("\white EXP +[applycommas(bonus_exp)]","output2")
					if(src.zenni>10)
						if(M!=src)
							var/zn=src.zenni
							M.zenni+=zn/2
							M << output("\white Zenni +[applycommas(round(zn/2))]","output2")
							src.zenni-=zn/2
			//		var/cpnumber=(1+round(src.level/100))
			//		M.PK_LVLUP(cpnumber)
					if(!M.calledlvlup)
						if(M.exp >= src.tnl)
							spawn(-1)M.Level_Up()
					//spawn(-1) M.Level_Up()
					if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
						M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
						Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
						M.zenni+=src.headvalue
						src.headvalue=0
						var/savefile/B=new("world save files/Bounty.sav")
						B["Bounty"]<<Bounty
			src.kiabsorb=0
			src.buku = 0
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.UnTraining()
			//src.training = 0
			src.focus_boxing = 0
			src.dualtrain = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			src.it_lock=1
			spawn(100)src.it_lock=0
			src.loc=locate(211,430,6)
			if(M.challenger == src && src.challenger == M)
				player <<"\yellow Arena Battle: \white [M] has won the challenge against [src]!"
				M.arena_win += 1
				src.arena_lose += 1
				M << "For winning the challenge, you are rewarded with 7000 training points."
				M.tp += 7000
				src << "For putting up a valiant fight, you are rewarded with 2000 training points."
				src.tp += 2000
				M.loc=locate(400,260,7)
				arena_on=0
				M.it_lock=0
				M.it_blocked=0
				M.challenger = ""
				src.challenger = ""
				M.challenge = 0
				src.challenge = 0
				M.pvpflagged=0
				M.pvptimer=0
		/*	if(src.in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--*/
			src.attack_lock = 0
			src.ki_lock = 0
			src.buku_lock = 0
			src.it_blocked = 1
			spawn(100)src.dead = 0
			src.powerlevel = 50
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.overlays -= 'Halo.dmi'
			src.deaths += 1
			M.pks+=1
			M.pvp_level++
			M.pvp_rating++
			M.Check_PVP()
			BudokaiResign(src)
			Ranking(M)
			if(src==M)
				player <<"<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
			else
				player <<"[T]"
			src.GWUpdate()
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if(src.race == "Alien"&&src.gene=="Pride Trooper")
			src.regen_dead=0
			src.dead=1
			if(M!=src)
				var/bonus_exp = M.level/5
				if(bonus_exp > src.level)
					bonus_exp = src.level
				bonus_exp += rand(20,1000)
				var/bonus_tp = rand(100,250)
	//			var/bonus_sp = 2
	//			var/bonus_sp = 2
				if(M.expbuff)bonus_exp*=2
				if(istype(M,/mob/PC))
			/*		if(prob(5))
						M.skill_points += bonus_sp
						M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
					if(prob(50))
						M.tp += bonus_tp
						M << output("\white Training Points +[bonus_tp]","output2")
					bonus_exp*=M.expm
					M.exp += bonus_exp
					M << output("\white EXP +[applycommas(bonus_exp)]","output2")
					if(src.zenni>10)
						if(M!=src)
							var/zn=src.zenni
							M.zenni+=zn/2
							M << output("\white Zenni +[applycommas(round(zn/2))]","output2")
							src.zenni-=zn/2
			//		var/cpnumber=(1+round(src.level/100))
			//		M.PK_LVLUP(cpnumber)
					if(!M.calledlvlup)
						if(M.exp >= M.tnl)
							spawn(-1)M.Level_Up()
					//spawn(-1) M.Level_Up()
					if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
						M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
						Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
						M.zenni+=src.headvalue
						src.headvalue=0
						var/savefile/B=new("world save files/Bounty.sav")
						B["Bounty"]<<Bounty
			src.kiabsorb=0
			src.buku = 0
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.focus_boxing = 0
			src.dualtrain = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			src.it_lock=1
			spawn(100)src.it_lock=0
			//src.loc = locate(rand(400,420),rand(250,260),7)
			src.loc = locate(410,356,7)
			//src.loc = locate(rand(390,420),rand(225,238),7)
			if(src.in_tourney)
				src.in_tourney=0
			src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
			src.respawnfunction(800)
			if(M.challenger == src && src.challenger == M)
				player <<"\yellow Arena Battle: \white [M] has won the challenge against [src]!"
				M.arena_win += 1
				src.arena_lose += 1
				M << "For winning the challenge, you are rewarded with 7000 training points."
				M.tp += 7000
				src << "For putting up a valiant fight, you are rewarded with 2000 training points."
				src.tp += 2000
				M.loc=locate(400,260,7)
				arena_on=0
				M.it_lock=0
				M.it_blocked=0
				M.challenger = ""
				src.challenger = ""
				M.challenge = 0
				src.challenge = 0
				M.pvpflagged=0
				M.pvptimer=0
		/*	if(src.in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--*/
			src.attack_lock = 0
			src.ki_lock = 0
			src.buku_lock = 0
			src.it_blocked = 1
			spawn(100)src.dead = 0
			src.powerlevel = 50
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.overlays -= 'Halo.dmi'
			src.deaths += 1
			M.pks+=1
			M.pvp_level++
			M.pvp_rating++
			M.Check_PVP()
			BudokaiResign(src)
			Ranking(M)
			if(src==M)
				player <<"<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
			else
				player <<"[T]"
			src.GWUpdate()
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if(src.race == "Majin")
			if(!src.regen_dead)
				src.icon_state = "Dead"
				src.frozen = 1
				src.boxing = 0
				src.focus_boxing = 0
				src.dualtrain = 0
				src.doing = 1
				src.density = 1
				src.attack_lock = 1
				src.ki_lock = 1
				src.it_lock = 1
				src.regen_dead = 1
				src.powerlevel = 0
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				return
			else
				if(M!=src)
					var/bonus_exp = M.level/5
					if(bonus_exp > src.level)
						bonus_exp = src.level
					bonus_exp += rand(20,1000)
					var/bonus_tp = rand(100,250)
		//			var/bonus_sp = 2
			//		var/bonus_sp = 2
					if(istype(M,/mob/PC))
				/*		if(prob(5))
							M.skill_points += bonus_sp
							M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
						if(prob(50))
							M.tp += bonus_tp
							M << output("\white Training Points +[bonus_tp]","output2")
						bonus_exp*=M.expm
						M.exp += bonus_exp
						M << output("\white EXP +[applycommas(bonus_exp)]","output2")
						if(src.zenni>10)
							if(M!=src)
								var/zn=src.zenni
								M.zenni+=zn/2
								M << output("\white Zenni +[applycommas(round(zn/2))]","output2")
								src.zenni-=zn/2
			//			var/cpnumber=(1+round(src.level/100))
			//			M.PK_LVLUP(cpnumber)
						if(!M.calledlvlup)
							if(M.exp >= M.tnl)
								spawn(-1)M.Level_Up()
						//spawn(-1) M.Level_Up()
						if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
							M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
							Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
							M.zenni+=src.headvalue
							src.headvalue=0
							var/savefile/B=new("world save files/Bounty.sav")
							B["Bounty"]<<Bounty
				src.buku = 0
				src.rest = 0
				src.frozen = 0
				src.boxing = 0
				src.focus_boxing = 0
				src.dualtrain = 0
				src.doing = 0
				src.icon_state = ""
				src.density = 1
				src.regen_dead=0
				src.regen=0
				src.powerlevel=50
				src.loc = locate(410,356,7)
				//src.loc = locate(rand(390,420),rand(225,238),7)
			//	src.loc = locate(rand(399,420),rand(350,360),7)
				src.respawnfunction(800)
				src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
				if(M.challenger == src && src.challenger == M)
					player <<"\yellow Arena Battle: \white [M] has won the challenge against [src]!"
					M.arena_win += 1
					src.arena_lose += 1
					M << "For winning the challenge, you are rewarded with 7000 training points."
					M.tp += 7000
					src << "For putting up a valiant fight, you are rewarded with 2000 training points."
					src.tp += 2000
					M.loc=locate(400,260,7)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger = ""
					src.challenger = ""
					M.challenge = 0
					src.challenge = 0
					M.pvpflagged=0
					M.pvptimer=0

		/*		if(src.in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--*/
				src.attack_lock = 0
				src.ki_lock = 0
				src.dead = 1
				src.it_lock = 0
				src.it_blocked = 0
				src.regen_dead = 0
				src.powerlevel = 50
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				src.overlays += 'Halo.dmi'
				src.deaths += 1
				M.pks += 1
				M.pvp_level++
				M.pvp_rating++
				M.Check_PVP()
				BudokaiResign(src)
				Ranking(M)
				src << "Your body was completely Destroyed!"
				src.respawnfunction(800)
				src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
				if(src==M)
					player <<"<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
				else
					player <<"[T]"
				src.GWUpdate()
		else
			if(src.race != "HHHH"&& src.race != "Majin")
				if(src.race=="Alien"&&src.gene=="Pride Trooper")return
				src.regen_dead=0
				if(M.name!=src.name)
					var/bonus_exp = M.level/5
					if(bonus_exp > src.level)
						bonus_exp = src.level
					bonus_exp += rand(20,1000)
					var/bonus_tp = rand(100,250)
		//			var/bonus_sp = 2
			//		var/bonus_sp = 2
					if(istype(M,/mob/PC))
				/*		if(prob(5))
							M.skill_points += bonus_sp
							M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
						if(prob(50))
							M.tp += bonus_tp
							M << output("\white Training Points +[bonus_tp]","output2")
						bonus_exp*=M.expm
						M.exp += bonus_exp
						M << output("\white EXP +[applycommas(bonus_exp)]","output2")
						if(src.zenni>10)
							if(M!=src)
								var/zn=src.zenni
								M.zenni+=zn/2
								M << output("\white Zenni +[applycommas(round(zn/2))]","output2")
								src.zenni-=zn/2
			//			var/cpnumber=(1+round(src.level/100))
			//			M.PK_LVLUP(cpnumber)
						if(!M.calledlvlup)
							if(M.exp >= M.tnl)
								spawn(-1)M.Level_Up()
						//spawn(-1) M.Level_Up()
						if(Bounty.Find("Name: [src.name]([src.headvalue] Zenni)"))
							M << "\white You have killed a wanted player: Zenni +[src.headvalue]"
							Bounty.Remove("Name: [src.name]([src.headvalue] Zenni)")
							M.zenni+=src.headvalue
							src.headvalue=0
							var/savefile/B=new("world save files/Bounty.sav")
							B["Bounty"]<<Bounty
				src.buku = 0
				src.dead = 1
				src.rest = 0
				src.frozen = 0
				src.boxing = 0
				src.focus_boxing = 0
				src.dualtrain = 0
				src.doing = 0
				src.icon_state = ""
				src.density = 1
				src.overlays += 'Halo.dmi'
				src.dead = 1
				src.it_lock = 0
				src.it_blocked = 0
				src.loc = locate(410,356,7)
				//src.loc = locate(rand(390,420),rand(225,238),7)
			//	src.loc = locate(rand(399,420),rand(350,360),7)
				src.respawnfunction(800)
				src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
				if(M.challenger == src && src.challenger == M)
					player <<"\yellow Arena Battle: \white [M] has won the challenge against [src]!"
					M.arena_win += 1
					src.arena_lose += 1
					M << "For winning the challenge, you are rewarded with 7000 training points."
					M.tp += 7000
					src << "For putting up a valiant fight, you are rewarded with 2500 training points."
					src.tp += 2500
					M.loc=locate(400,260,7)
					arena_on=0
					M.it_lock=0
					M.it_blocked=0
					M.challenger = ""
					src.challenger = ""
					M.challenge = 0
					src.challenge = 0
					M.pvpflagged=0
					M.pvptimer=0

		/*		if(src.in_tourney)
					TourneyPeople.Remove(src)
					tourney_count--*/
				src.attack_lock = 0
				src.ki_lock = 0
				src.powerlevel = 50
				src.KO = 0
				src.rage = 0
				src.sight &= ~BLIND
				src.deaths += 1
				M.pks += 1
				M.pvp_level++
				M.pvp_rating++
				M.Check_PVP()
				BudokaiResign(src)
				Ranking(M)
				if(src==M)
					player <<"<FONT color = red>Battle Information:<FONT color = White> [src] has comitted suicide!"
				else
					player <<"[T]"
				src.GWUpdate()
				spawn(1)
					if(src.gravityfieldon)
						src.gravityfieldon=0
						src.GravityFieldCooldown()
mob
	proc
		DeathSacrifice()
			src.attacker=""
			for(var/mob/PC/M2 in oview(12))
				if(M2!=src)
					if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
						M2.witness_deaths ++
						if(!src.gone_ssj)
							spawn(1)M2.Rage_Unleash()
					M2 << "\red You feel your Rage Grow..."
					M2.rage += round(rand(15,25))
					if(M2.rage >= 100)
						M2.rage = 100
			src.deflecting = 0
			src.dodging = 0
			src.blocking = 0
			src.countering = 0
			src.e_db_1 = 0
			src.e_db_2 = 0
			src.e_db_3 = 0
			src.e_db_4 = 0
			src.e_db_5 = 0
			src.e_db_6 = 0
			src.e_db_7 = 0
			src.n_db_1 = 0
			src.n_db_2 = 0
			src.n_db_3 = 0
			src.n_db_4 = 0
			src.n_db_5 = 0
			src.n_db_6 = 0
			src.n_db_7 = 0
			src.b_db_1 = 0
			src.b_db_2 = 0
			src.b_db_3 = 0
			src.b_db_4 = 0
			src.b_db_5 = 0
			src.b_db_6 = 0
			src.b_db_7 = 0
			for(var/obj/Earth_Dragonballs/O1 in src)
				O1.loc = src.loc
			for(var/obj/Namek_Dragonballs/O2 in src)
				O2.loc = src.loc
			for(var/obj/Black_Dragonballs/O3 in src)
				O3.loc = src.loc
			for(var/obj/Equipment/Event_Item/O in src)
				player << "<font color = #ea0000>Event Information: <font color = white>[src.name] dropped [O.name]!"
				O.loc = src.loc
			src.Power_Redefine()
			src.buku = 0
			src.dead = 1
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.focus_boxing = 0
			src.dualtrain = 0
			src.doing = 0
			src.icon_state = ""
			src.density = 1
			if(src.race=="Android")
				src.loc=locate(211,430,6)
			else
				src.loc = locate(410,356,7)
				//src.loc = locate(rand(390,420),rand(225,238),7)
				//src.loc = locate(rand(399,420),rand(350,360),7)
				src.respawnfunction(800)
				src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
	/*		if(src.in_tourney)
				TourneyPeople.Remove(src)
				tourney_count--*/
			src.attack_lock = 0
			src.ki_lock = 0
			src.it_lock = 0
			src.it_blocked = 0

			src.powerlevel = 50
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.overlays += 'Halo.dmi'
			src.deaths += 1
			src.GWUpdate()
			BudokaiResign(src)
mob
	proc
		GRAVITYDeath()
			if(src.powerlevel <= 0)
				player <<"<FONT color = red>Training Information:<FONT color = White> [src] died while training under gravity!"
				src.grav = 0
				src.gravtrain = 0
				src.deflecting = 0
				src.dodging = 0
				src.blocking = 0
				src.countering = 0
				src << "Your body was crushed by the gravity."
				spawn(1) src.Power_Redefine()
				for(var/obj/Earth_Dragonballs/O1 in src)
					O1.loc = src.loc
				for(var/obj/Namek_Dragonballs/O2 in src)
					O2.loc = src.loc
				for(var/obj/Black_Dragonballs/O3 in src)
					O3.loc = src.loc
				for(var/obj/Equipment/Event_Item/O in src)
					player << "<font color = #ea0000>Event Information: <font color = white>[src.name] dropped [O.name]!"
					O.loc = src.loc

				src.meditating = 0
				src.frozen = 0
				src.doing = 0
				src.thrown=0
				spawn(20)src.mtrain=0
				src.undercheck=0

				src.meditating_delay = 0

				if(src.race == "Android")
					src.kiabsorb=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.dualtrain = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1
					src.loc = locate(211,430,6)
					src.attack_lock = 0
					src.ki_lock = 0
					src.it_lock=1
					spawn(100)src.it_lock=0
					src.buku_lock = 0
					src.it_blocked=1
					src.in_hbtc=0
					src.dead = 0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.deaths+=1
				else
					src.regen_dead=0
					src.regen=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.dualtrain = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1

					src.overlays += 'Halo.dmi'
					src.dead = 1
					src.it_lock = 0
					src.it_blocked = 0

					src.loc = locate(410,356,7)
					//src.loc = locate(rand(390,420),rand(225,238),7)
					//src.loc = locate(rand(399,420),rand(350,360),7)
					src.respawnfunction(800)
					src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
					src.attack_lock = 0
					src.ki_lock = 0
					src.buku_lock = 0
					src.in_hbtc=0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.sight &= ~BLIND
					src.deaths+=1
				return


		EXPLOSIONdeath(cause as text)
			if(src.powerlevel <= 0)
				player <<"<FONT color = red>Battle Information:<FONT color = White> [src] was blown up by a [cause]"
				src.grav = 0
				src.deflecting = 0
				src.dodging = 0
				src.blocking = 0
				src.countering = 0

				spawn(1) src.Power_Redefine()
				for(var/obj/Earth_Dragonballs/O1 in src)
					O1.loc = src.loc
				for(var/obj/Namek_Dragonballs/O2 in src)
					O2.loc = src.loc
				for(var/obj/Black_Dragonballs/O3 in src)
					O3.loc = src.loc
				for(var/obj/Equipment/Event_Item/O in src)
					player << "<font color = #ea0000>Event Information: <font color = white>[src.name] dropped [O.name]!"
					O.loc = src.loc

				src.meditating = 0
				src.frozen = 0
				src.doing = 0
				src.thrown=0
				spawn(20)src.mtrain=0
				src.undercheck=0

				src.meditating_delay = 0

				if(src.race == "Android")
					src.kiabsorb=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.dualtrain = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1
					src.loc = locate(211,430,6)
					src.attack_lock = 0
					src.ki_lock = 0
					src.it_lock=1
					spawn(100)src.it_lock=0
					src.buku_lock = 0
					src.it_blocked=1
					src.in_hbtc=0
					src.dead = 0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.deaths+=1
				else
					src.regen_dead=0
					src.regen=0
					src.buku = 0
					src.rest = 0
					src.frozen = 0
					src.boxing = 0
					src.focus_boxing = 0
					src.dualtrain = 0
					src.doing = 0
					src.icon_state = ""
					src.density = 1

					src.overlays += 'Halo.dmi'
					src.dead = 1
					src.it_lock = 0
					src.it_blocked = 0
					src.loc = locate(410,356,7)
					//src.loc = locate(rand(390,420),rand(225,238),7)
				//	src.loc = locate(rand(399,420),rand(350,360),7)
					src.respawnfunction(1200)
					src << "<font size = 2><font color = white><b>Talk to Yemma to be revived or travel to King Kais for training</b></font>"
					src.attack_lock = 0
					src.ki_lock = 0
					src.buku_lock = 0
					src.in_hbtc=0
					src.powerlevel = 50
					src.KO = 0
					src.rage = 0
					src.sight &= ~BLIND
					src.deaths+=1
				return


mob/SPECIAL/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp = round(src.exp)
		var/bonus_tp = rand(100,140)
//		var/bonus_sp = 1
		if(istype(M,/mob/PC))

			if(M.smallshard)
				bonus_exp*=1.25
			if(M.largeshard)
				bonus_exp*=1.5
			if(M.greatshard)
				bonus_exp*=2
			if(M.massshard)
				bonus_exp*=3
			if(M.smallshardz)
				src.zenni*=1.25
			if(M.largeshardz)
				src.zenni*=1.5
			if(M.greatshardz)
				src.zenni*=2
			if(M.massshardz)
				src.zenni*=3
	/*		if(prob(1))
				if(prob(50))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
			if(prob(20))
				if(prob(src.tpc))
					bonus_tp*=2
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<b><font color = red>Training points +[tp]","output2")
				else
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<font color = white>Training points +[tp]","output2")
			bonus_exp*=M.expm
			bonus_exp*=sexp
			M.exp += bonus_exp
			M.zenni += src.zenni
			if(M.hudenabled)
				if(!M.calledlvlup&&!M.calledexphud)
				//	M.calledexphud = 1
				//	spawn(50) M.calledexphud = 0
					spawn() M.updateexp()
			M << output("\white Zenni +[applycommas(src.zenni)]","output2")
			M << output("\white EXP +[applycommas(bonus_exp)]","output2")
			spawn(-1) M.Level_Up()
			if(M.karma == "Good"&&src.karma == "Good")
				M.karma_rating -= 0.1
			if(M.karma == "Good"&&src.karma == "Evil")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Good")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Evil")
				M.karma_rating -= 0.1
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << output("<I>You feel the Good inside of you begin to awaken...","output2")
					M.karma = "Good"
					M.karma_rating = 0

			view(M) << output("<FONT color = #990000>Quest Information:<FONT color = White> [M] defeated [src]!","output2")


			M.kills+=1
			M.Rank_Up()

			del(src)
			..()


/*
/var/gcchecktime = 0

/proc/gcbutcheck(var/datum/item)
	if(!istype(item))
		del(item)
		return
	item.gcchecktime = world.time
	var/timecheck = world.time
	var/itemref = "\ref[item]"
	world << "[itemref]"
	item = null
	spawn (60)
		var/thing = locate(itemref)
		if (!thing || thing.gcchecktime != timecheck)
			return
		del(thing)
		*/



	/*
mob/verb/CHECKREF(mob/M in world)
	var/itemref = "\ref[M]"
	var/itemtag = "\tag[M]"
	world << " ref [itemref]"
	world << "tag [itemtag]"


mob/verb/CHECKVARSmob(mob/M in world)
	var/V
	world << "<B>M: [M]"

	for(V in M.vars)
		usr << "[V] = [M.vars[V]]"
		sleep(1)

mob/verb/CHECKVARSobj(obj/M in world)
	var/V
	world << "<B>M: [M] [M.name]"

	for(V in M.vars)
		usr << "[V] = [M.vars[V]]"
		sleep(1)


mob/verb/DELVARS(mob/M in world)
	var/V
	world << "<B>DELETE VARS M: [M]"

	for(V in M.vars)

		usr << "[V] = [M.vars[V]]"
		V = null
		usr << "<b>[V] = [M.vars[V]]"
		sleep(1)

mob/verb/check_lists()
    // Displays all non-standard lists in the world.
	usr << "Displaying all non-standard lists"
	var/count = 0
	for(var/atom/A in world)
		var/list/var_names = A.vars - "contents" - "overlays" - "underlays" - "vars" - "verbs"
		// all vars except the built in ones that won't cause a problem.
		if(ismob(A)) var_names -= "group"   // mobs also have a built in group var
		for(var/var_name in var_names)
			if(istype(A.vars[var_name], /list))
				count++
				usr << "[A] ([A.type]) at ([A.x], [A.y], [A.z]) has a list called [var_name]."
		sleep(15)
	usr << "[count] non-standard lists found."


mob/verb/deleteallmobs()
	var/count = 0
	for(var/mob/Monster/M in world)
	//	if(M.powerlevel <= 0) continue
		count++
		M.powerlevel = -10000
		M.DeathCheck(src)
		sleep(1)
	world << "<b>[count] mobs deleted"


mob/verb/summondead()
	var/count
	for(var/mob/Monster/M)
		if(!loc)
			count++
			M.loc = src.loc
			M.name = initial(M.name)
		sleep(1)

	world << "[count] monsters weren't GCd"


mob/verb/summondeadfast()
	var/count
	for(var/mob/Monster/M)
		if(!loc)
			count++
			M.loc = src.loc
			M.name = initial(M.name)


	world << "[count] monsters weren't GCd"


/*
atom/var/gcchecktime = 0

atom/proc/gcbutcheck(atom/item)
	if (!istype(item))
		world << "istype false"
		del(item)
		return
	item.gcchecktime = world.time
	var/timecheck = world.time
	var/itemref = "\ref[item]"
	item = null
	spawn (60)
		var/thing = locate(itemref)
		if (!thing || thing:gcchecktime != timecheck)
			return
		del(thing)
		*/


mob/proc/GCcheck(mob/item)
	if(!item)
		world << "[item] doesn't exist"
		return
	//item.gcchecktime = world.time
//	var/timecheck = world.time
	var/itemref = "\ref[item]"
	item = null
	world << "itemref: [itemref]"
	spawn (120)
		var/thing = locate(itemref)
		if (!thing)
			world << "no thing"
			return
		world << "deleted [thing]"
		del(thing)


mob/verb/countblasts()
	var/count
	for(var/obj/blasts/O in world)
		count++
		world << "[O] [O.name] [O.loc]"



	world << "[count] blasts exist"

	*/


mob/Monster/ExplosiveMobs/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp = round(src.exp)
		M.in_hbtc=0
//		var/bonus_tp = rand(100,140)
//		var/bonus_sp = 1
		if(src.name == "Exploding Saibaman")
			M.ExplodingSaibamanKills += 1
			M.ExplodingSaibamanKillsMax += 1
			M.explodecurrentkills += 1
			if(prob(50))
				bonus_exp = M.tnl
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingSaibaReward()
		if(src.name == "Exploding Cell")
			M.ExplodingCellKills += 1
			M.ExplodingCellKillsMax += 1
			M.explodecurrentkillscell += 1
			bonus_exp = M.tnl*rand(1,3)
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingCellReward()
		if(istype(M,/mob/PC))

			if(M.smallshard)
				bonus_exp*=1.25
			if(M.largeshard)
				bonus_exp*=1.5
			if(M.greatshard)
				bonus_exp*=1.75
			if(M.massshard)
				bonus_exp*=2
			if(M.smallshardz)
				src.zenni*=1.25
			if(M.largeshardz)
				src.zenni*=1.5
			if(M.greatshardz)
				src.zenni*=1.75
			if(M.massshardz)
				src.zenni*=2
	/*		if(prob(1))
				if(prob(50))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
		/*
			if(prob(20))
				if(prob(src.tpc))
					bonus_tp*=2
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<b><font color = red>Training points +[tp]","output2")
				else
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<font color = white>Training points +[tp]","output2")
						*/
		//	bonus_exp*=M.expm
		//	bonus_exp*=sexp
			M.exp += bonus_exp
			M.zenni += src.zenni


			if(M.hudenabled)
				if(!M.calledlvlup&&!M.calledexphud)
				//	M.calledexphud = 1
				//	spawn(50) M.calledexphud = 0
					spawn() M.updateexp()
		//	if(M.killrewards)
		//		M << output("\white Zenni +[applycommas(src.zenni)]","output2")
		//		M << output("\white EXP +[applycommas(bonus_exp)]","output2")
		//	spawn(-1) M.Level_Up()
			/*
			if(M.karma == "Good"&&src.karma == "Good")
				M.karma_rating -= 0.1
			if(M.karma == "Good"&&src.karma == "Evil")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Good")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Evil")
				M.karma_rating -= 0.1
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << output("<I>You feel the Good inside of you begin to awaken...","output2")
					M.karma = "Good"
					M.karma_rating = 0

			view(M) << output("<FONT color = #990000>Quest Information:<FONT color = White> [M] defeated [src]!","output2")


*/
			var/klevel = round(20000+(src.level*1))
			if(M.level<=klevel)
				M.kills +=1*s_kill
			if(M.zpvkills > 0)
				M.kills += 1
				M.zpvkills -= 1
				if(M.zpvkills <= 0)
					M << "<font size = 2><b><red>Your zp kill bonus has expired"
			M.Rank_Up()
//			spawn(-1) src.Item_Drop()
			src.dead=1
			if(!M.calledlvlup)
				if(M.exp >= M.tnl)
					spawn(-1)M.Level_Up()


		//	M.Rank_Up()

			del(src)
			..()
















/*

mob/Monster/BeerusMobs/DeathCheck(mob/PC/M)
	world << "death func 1"
	if(src.powerlevel <= 0)
		world << "death func 2"
		var/bonus_exp = round(src.exp)
		M.in_hbtc=0

//		bonus_exp = M.tnl*rand(50,150)
//		var/bonus_tp = rand(100,140)
//		var/bonus_sp = 1
	/*
		if(src.name == "Exploding Saibaman")
			M.ExplodingSaibamanKills += 1
			M.ExplodingSaibamanKillsMax += 1
			M.explodecurrentkills += 1
			if(prob(50))
				bonus_exp = M.tnl
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingSaibaReward()
		if(src.name == "Exploding Cell")
			M.ExplodingCellKills += 1
			M.ExplodingCellKillsMax += 1
			M.explodecurrentkillscell += 1
			bonus_exp = M.tnl*rand(1,3)
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingCellReward()
			*/
		if(istype(M,/mob/PC))

			if(M.smallshard)
				bonus_exp*=1.25
			if(M.largeshard)
				bonus_exp*=1.5
			if(M.greatshard)
				bonus_exp*=1.75
			if(M.massshard)
				bonus_exp*=2
			if(M.smallshardz)
				src.zenni*=1.25
			if(M.largeshardz)
				src.zenni*=1.5
			if(M.greatshardz)
				src.zenni*=1.75
			if(M.massshardz)
				src.zenni*=2
	/*		if(prob(1))
				if(prob(50))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
		/*
			if(prob(20))
				if(prob(src.tpc))
					bonus_tp*=2
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<b><font color = red>Training points +[tp]","output2")
				else
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<font color = white>Training points +[tp]","output2")
						*/
		//	bonus_exp*=M.expm
		//	bonus_exp*=sexp
			if(M.in_party)
				for(var/mob/M2 in player)
					if(M2.party_name==M.party_name)
						//var/exp2=round(src.exp/4)
						if(M2.name == M.name)
							continue
						if(M2.level < 500000)
							bonus_exp = M2.tnl*rand(1,6)
						M2.exp += bonus_exp

					if(!M2.calledlvlup)
						if(M2.exp >= M2.tnl)
							spawn(-1)M2.Level_Up()

						//count++
			if(M.level < 500000)
				bonus_exp = M.tnl*rand(16,40)
			M.exp += bonus_exp
			M.zenni += src.zenni


			if(M.hudenabled)
				if(!M.calledlvlup&&!M.calledexphud)
				//	M.calledexphud = 1
				//	spawn(50) M.calledexphud = 0
					spawn() M.updateexp()


		//	if(M.killrewards)
		//		M << output("\white Zenni +[applycommas(src.zenni)]","output2")
		//		M << output("\white EXP +[applycommas(bonus_exp)]","output2")
		//	spawn(-1) M.Level_Up()
			/*
			if(M+.karma == "Good"&&src.karma == "Good")
				M.karma_rating -= 0.1
			if(M.karma == "Good"&&src.karma == "Evil")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Good")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Evil")
				M.karma_rating -= 0.1
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << output("<I>You feel the Good inside of you begin to awaken...","output2")
					M.karma = "Good"
					M.karma_rating = 0

			view(M) << output("<FONT color = #990000>Quest Information:<FONT color = White> [M] defeated [src]!","output2")


*/
			var/qpgain = rand(2,10)
			src <<output("<B><font size = 1>Quest Points + [qpgain] (Total: [applycommas(src.questpoints)])","default.output2")
			src.questpoints += qpgain

			var/klevel = round(20000+(src.level*1))
			if(M.level<=klevel)
				M.kills +=1*s_kill
			if(M.zpvkills > 0)
				M.kills += 1
				M.zpvkills -= 1
				if(M.zpvkills <= 0)
					M << "<font size = 2><b><red>Your zp kill bonus has expired"
			M.Rank_Up()
			M.statgainmob()
//			spawn(-1) src.Item_Drop()
			src.dead=1
			if(!M.calledlvlup)
				if(M.exp >= M.tnl)
					spawn(-1)M.Level_Up()


		//	M.Rank_Up()

			del(src)
			..()


*/


/*




mob/Monster/BeerusMobs/DeathCheck(mob/PC/M)
	world << "death func 1"
	if(src.powerlevel <= 0)
		world << "death func 2"
		var/bonus_exp = round(src.exp)
		M.in_hbtc=0

//		bonus_exp = M.tnl*rand(50,150)
//		var/bonus_tp = rand(100,140)
//		var/bonus_sp = 1
	/*
		if(src.name == "Exploding Saibaman")
			M.ExplodingSaibamanKills += 1
			M.ExplodingSaibamanKillsMax += 1
			M.explodecurrentkills += 1
			if(prob(50))
				bonus_exp = M.tnl
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingSaibaReward()
		if(src.name == "Exploding Cell")
			M.ExplodingCellKills += 1
			M.ExplodingCellKillsMax += 1
			M.explodecurrentkillscell += 1
			bonus_exp = M.tnl*rand(1,3)
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingCellReward()
			*/
		if(istype(M,/mob/PC))

			if(M.smallshard)
				bonus_exp*=1.25
			if(M.largeshard)
				bonus_exp*=1.5
			if(M.greatshard)
				bonus_exp*=1.75
			if(M.massshard)
				bonus_exp*=2
			if(M.smallshardz)
				src.zenni*=1.25
			if(M.largeshardz)
				src.zenni*=1.5
			if(M.greatshardz)
				src.zenni*=1.75
			if(M.massshardz)
				src.zenni*=2
	/*		if(prob(1))
				if(prob(50))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
		/*
			if(prob(20))
				if(prob(src.tpc))
					bonus_tp*=2
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<b><font color = red>Training points +[tp]","output2")
				else
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<font color = white>Training points +[tp]","output2")
						*/
		//	bonus_exp*=M.expm
		//	bonus_exp*=sexp
			if(M.in_party)
				for(var/mob/M2 in player)
					if(M2.party_name==M.party_name)
						//var/exp2=round(src.exp/4)
						if(M2.name == M.name)
							continue
						if(M2.level < 500000)
							bonus_exp = M2.tnl*rand(1,6)
						M2.exp += bonus_exp

					if(!M2.calledlvlup)
						if(M2.exp >= M2.tnl)
							spawn(-1)M2.Level_Up()

						//count++
			if(M.level < 500000)
				bonus_exp = M.tnl*rand(16,40)
			M.exp += bonus_exp
			M.zenni += src.zenni


			if(M.hudenabled)
				if(!M.calledlvlup&&!M.calledexphud)
				//	M.calledexphud = 1
				//	spawn(50) M.calledexphud = 0
					spawn() M.updateexp()


		//	if(M.killrewards)
		//		M << output("\white Zenni +[applycommas(src.zenni)]","output2")
		//		M << output("\white EXP +[applycommas(bonus_exp)]","output2")
		//	spawn(-1) M.Level_Up()
			/*
			if(M+.karma == "Good"&&src.karma == "Good")
				M.karma_rating -= 0.1
			if(M.karma == "Good"&&src.karma == "Evil")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Good")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Evil")
				M.karma_rating -= 0.1
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << output("<I>You feel the Good inside of you begin to awaken...","output2")
					M.karma = "Good"
					M.karma_rating = 0

			view(M) << output("<FONT color = #990000>Quest Information:<FONT color = White> [M] defeated [src]!","output2")


*/
			var/qpgain = rand(2,10)
			src <<output("<B><font size = 1>Quest Points + [qpgain] (Total: [applycommas(src.questpoints)])","default.output2")
			src.questpoints += qpgain

			var/klevel = round(20000+(src.level*1))
			if(M.level<=klevel)
				M.kills +=1*s_kill
			if(M.zpvkills > 0)
				M.kills += 1
				M.zpvkills -= 1
				if(M.zpvkills <= 0)
					M << "<font size = 2><b><red>Your zp kill bonus has expired"
			M.Rank_Up()
			M.statgainmob()
//			spawn(-1) src.Item_Drop()
			src.dead=1
			if(!M.calledlvlup)
				if(M.exp >= M.tnl)
					spawn(-1)M.Level_Up()


		//	M.Rank_Up()

			del(src)
			..()

			*/




mob/Monster/BeerusMobs/DeathCheck(mob/PC/M)
	if(src.powerlevel <= 0)
		var/bonus_exp = round(src.exp)
		M.in_hbtc=0

//		bonus_exp = M.tnl*rand(50,150)
//		var/bonus_tp = rand(100,140)
//		var/bonus_sp = 1
	/*
		if(src.name == "Exploding Saibaman")
			M.ExplodingSaibamanKills += 1
			M.ExplodingSaibamanKillsMax += 1
			M.explodecurrentkills += 1
			if(prob(50))
				bonus_exp = M.tnl
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingSaibaReward()
		if(src.name == "Exploding Cell")
			M.ExplodingCellKills += 1
			M.ExplodingCellKillsMax += 1
			M.explodecurrentkillscell += 1
			bonus_exp = M.tnl*rand(1,3)
			//if(M.ExplodingSaibamanKills >= M.ExplodingSaibamanKillsMax)
			//if(M.ExplodingSaibamanKills >= 5)
			spawn(-1) M.ExplodingCellReward()
			*/
		if(istype(M,/mob/PC))

			if(M.smallshard)
				bonus_exp*=1.25
			if(M.largeshard)
				bonus_exp*=1.5
			if(M.greatshard)
				bonus_exp*=1.75
			if(M.massshard)
				bonus_exp*=2
			if(M.smallshardz)
				src.zenni*=1.25
			if(M.largeshardz)
				src.zenni*=1.5
			if(M.greatshardz)
				src.zenni*=1.75
			if(M.massshardz)
				src.zenni*=2
	/*		if(prob(1))
				if(prob(50))
					M.skill_points += bonus_sp
					M << "<font color=#3333ff>Skill Points +[bonus_sp]</font>"*/
		/*
			if(prob(20))
				if(prob(src.tpc))
					bonus_tp*=2
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<b><font color = red>Training points +[tp]","output2")
				else
					src.tp += bonus_tp
					if(src.training_on == 1)
						src << output("<font color = white>Training points +[tp]","output2")
						*/
		//	bonus_exp*=M.expm
		//	bonus_exp*=sexp
			if(M.in_party)
				for(var/mob/M2 in player)
					if(M2.party_name==M.party_name)
						//var/exp2=round(src.exp/4)
						if(M2.name == M.name)
							continue
						if(M2.in_party == 0) continue
					//	if(M2.level < 500000)
					//		bonus_exp = M2.tnl*rand(1,6)
						M2.exp += bonus_exp

					if(!M2.calledlvlup)
						if(M2.exp >= M2.tnl)
							spawn(-1)M2.Level_Up()

						//count++
		//	if(M.level < 500000)
		//		bonus_exp = M.tnl*rand(16,40)
			bonus_exp = M.tnl*rand(16,40)
			M.exp += bonus_exp
			M.zenni += src.zenni


			if(M.hudenabled)
				if(!M.calledlvlup&&!M.calledexphud)
				//	M.calledexphud = 1
				//	spawn(50) M.calledexphud = 0
					spawn() M.updateexp()


		//	if(M.killrewards)
		//		M << output("\white Zenni +[applycommas(src.zenni)]","output2")
		//		M << output("\white EXP +[applycommas(bonus_exp)]","output2")
		//	spawn(-1) M.Level_Up()
			/*
			if(M+.karma == "Good"&&src.karma == "Good")
				M.karma_rating -= 0.1
			if(M.karma == "Good"&&src.karma == "Evil")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Good")
				if(M.karma_rating>=100)
					M.karma_rating=100
				else
					M.karma_rating += 0.1
			if(M.karma == "Evil"&&src.karma == "Evil")
				M.karma_rating -= 0.1
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << output("<I>You feel an Evil inside of you begin to awaken...","output2")
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << output("<I>You feel the Good inside of you begin to awaken...","output2")
					M.karma = "Good"
					M.karma_rating = 0

			view(M) << output("<FONT color = #990000>Quest Information:<FONT color = White> [M] defeated [src]!","output2")


*/
			var/qpgain = rand(2,10)
			src <<output("<B><font size = 1>Quest Points + [qpgain] (Total: [applycommas(src.questpoints)])","default.output2")
			src.questpoints += qpgain

			var/klevel = round(20000+(src.level*1))
			if(M.level<=klevel)
				M.kills +=1*s_kill
			if(M.zpvkills > 0)
				M.kills += 1
				M.zpvkills -= 1
				if(M.zpvkills <= 0)
					M << "<font size = 2><b><red>Your zp kill bonus has expired"
			M.Rank_Up()
			M.statgainmob()
//			spawn(-1) src.Item_Drop()
			src.dead=1
			if(!M.calledlvlup)
				if(M.exp >= M.tnl)
					spawn(-1)M.Level_Up()


		//	M.Rank_Up()

			del(src)
			..()