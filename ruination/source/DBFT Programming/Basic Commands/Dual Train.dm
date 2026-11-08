mob/var/exp_bonus = 0
mob/var/tmp/dualtrain = 0
mob/var/tmp/dtrain = 0
mob
	var
		tmp
			dtpartner=""
mob/PC/verb/Dual_Train()
	set category = "Training"
	//set hidden = 1

	if(usr.playerwatch==1)
		PlayerWatch(usr,"Dual Train")

	if(usr.dt_delay)
		usr << output("You must wait before dual train again","output2")
		return

	if(usr.dualtrain)
		usr.doing = 0
		spawn(20)dtrain = 0
		usr.frozen = 0
		spawn(20)usr.dualtrain = 0
		usr.icon_state = ""
		usr.dtpartner=""
		for(var/mob/DM in player)
			if(DM.dtpartner==usr)
				if(DM.dualtrain)
					DM.doing = 0
					DM.frozen = 0
					spawn(20)DM.dualtrain = 0
					DM.icon_state = ""
					DM.dtpartner=""
		return
	for(var/mob/PC/M in get_step(usr,usr.dir))
//		if(usr.dir != 4 && usr.dir != 6)
//			usr << "You must be beside [M] to dual train!"
//			return
		if(!M)return
		usr.dt_delay = 1
		M.dt_delay = 1
		spawn(70)
			if(usr)
				usr.dt_delay = 0
			if(M)
				M.dt_delay = 0
		if(istype(M,/mob/PC))
			if(usr.staminaleft>=usr.staminaleft_max)
				usr.dtrain=0
				M.dtrain=0
				usr << output("You are too drained to train.","output2")
				M << output("[usr] is too drained to train.","output2")
				return
			if(M.staminaleft>=M.staminaleft_max)
				usr << output("[M] is too drained to train.","output2")
				usr.dtrain=0
				M.dtrain=0
				M << output("You are too drained to train.","output2")
				return
			if(usr.doing)
				src << output("You are already doing something","output2")
				return
			if(M.doing)
				src << output("[M.name] is already doing something","output2")
				return
			if(alert("Are you sure you want to dual train with [M]?","Dual Train with [M]?","Yes","No") == "Yes")
				switch(alert(M,"Would you like to Dual Train with [usr]?","Dual Train","Yes","No"))
					if("Yes")
						if(!usr)
							M.dt_delay = 0
							return
						if(usr.boxing||usr.focus_boxing||usr.meditating)
							usr.dt_delay = 0
							usr.frozen = 0
							return
						if(M.boxing||M.focus_boxing||M.meditating)
							M.dt_delay = 0
							M.frozen = 0
							return
						if(usr in oview(4,M))
							if(!M)return
							if(!usr)return
							if(usr.doing)
								M << output("[usr] is already doing something","output2")
								usr << output("You are already doing something","output2")
								return
							if(M.doing)
								usr << output("[M] is already doing something","output2")
								M << output("You are already doing something","output2")
								return
/*							if(usr.strain||usr.ftrain||M.strain||M.ftrain||usr.mtrain||M.mtrain)
								M<<"One of you is already doing another training method"
								usr<<"One of you is already doing another training method"
								return*/
							for(var/mob/PC/N in get_step(usr,usr.dir))
								if(!N||N!=M)
									usr << output("[M] must be in front of you to dual train","output2")
									return
							if(!M.doing && !usr.doing)
								usr.dualtrain = 1
								usr.dtrain = 1
								M.dtrain = 1
								usr.doing = 1
								usr.dtpartner=M
								M.dtpartner=usr
							//	if(usr.dir == 4)
							//		M.dir = 6
							//	else
							//		M.dir = 4
								M.dir = get_general_dir(M,usr)
								usr.icon_state = "spar fury"
								M.icon_state = "spar fury"
								usr << output("You begin to Dual Train.","output2")
								usr.frozen = 1
								M.dualtrain = 1
								M.doing = 1
								M.icon_state = "spar fury"
								M << output("You begin to Dual Train.","output2")
								M.frozen = 1
								usr.Dual_Train2(M)
								return
					if("No")
						if(usr)
							usr << output("[M] does not want to dual train","output2")
							usr.dt_delay = 0
						M.dt_delay = 0
						return
		else
			usr << output("You can't train with NPC's","output2")
			return
mob/proc/Dual_Train2(mob/M)
	src.gravtrain = 0
	M.gravtrain = 0
	if(!src||!M)
		if(src)
			src.dtpartner=""
			src.doing = 0
			src.frozen = 0
			src.dualtrain = 0
			src.icon_state = ""
			src.dt_delay = 1
			src.dt_delay = 0
			src.dtrain = 0
		if(M)
			M.doing = 0
			M.frozen = 0
			M.dualtrain = 0
			M.icon_state = ""
			M.dtpartner=""
			M.dt_delay = 1
			M.dt_delay = 0
			M.dtrain = 0
		return
	while(src.dualtrain || M.dualtrain)
		if(!src||!M)
			if(src)
				src.dtpartner=""
				src.doing = 0
				src.frozen = 0
				src.dualtrain = 0
				src.icon_state = ""
				src.dt_delay = 1
				src.dt_delay = 0
				src.dtrain = 0
			if(M)
				M.doing = 0
				M.frozen = 0
				M.dualtrain = 0
				M.icon_state = ""
				M.dtpartner=""
				M.dt_delay = 1
				M.dt_delay = 0
				M.dtrain = 0
			break
		if(src.dead||M.dead)
			M.doing = 0
			M.frozen = 0
			M.dualtrain = 0
			M.icon_state = ""
			M.dtpartner=""
			M.dt_delay = 1
			M.dt_delay = 0
			M.dtrain = 0
			src.dtpartner=""
			src.doing = 0
			src.frozen = 0
			src.dualtrain = 0
			src.icon_state = ""
			src.dt_delay = 1
			src.dt_delay = 0
			src.dtrain = 0
			break

		//	var/expgain = round((rand(5,20)+src.level/250)*src.expm)+(src.in_hbtc*5)+(src.in_herculegym*5)+1
		var/expgain = round((rand(80,100)+src.level/200)*src.expm)+(src.in_hbtc*7)+(src.in_herculegym*5)+1
		var/expgain2 = round((rand(80,100)+M.level/200)*M.expm)+(M.in_hbtc*7)+(M.in_herculegym*5)+1
		//var/tp = rand(1,3)+(src.in_hbtc * rand(2,9))+round(src.level/10000)+moden*3
		var/bonus=((weightankle+weightarm+weightleg+weightarmor+weightcape+weightgi+weighthead+weightwrist)+(z_sword||demon_blade))+1
		if(weightankle||weightarm||weightleg||weightarmor||weightcape||weightgi||weightwrist||z_sword||demon_blade)expgain=round(expgain*bonus)

		var/bonus2=((M.weightankle+M.weightarm+M.weightleg+M.weightarmor+M.weightcape+M.weightgi+M.weighthead+M.weightwrist)+(M.z_sword||M.demon_blade))+1
		if(M.weightankle||M.weightarm||M.weightleg||M.weightarmor||M.weightcape||M.weightgi||M.weightwrist||M.z_sword||M.demon_blade)expgain2=round(expgain2*bonus2)

		var/tp = rand(1,2)+(src.in_hbtc * rand(1,6)+round(src.level/10000)+moden*1)
		var/tp2 = rand(1,2)+(M.in_hbtc * rand(1,6)+round(M.level/10000)+M.moden*1)
		if(src.gravtrain)
			expgain += expgain * 1.5
			expgain += expgain * src.gravtrain
			tp += tp * src.gravtrain
		if(M.gravtrain)
			expgain2 += expgain2 * 1.5
			expgain2 += expgain2 * M.gravtrain
			tp2 += tp2 * M.gravtrain

	//	var/expgain = round((rand(5,20)+src.level/250)*src.expm)+(src.in_hbtc*5)+(src.in_herculegym*5)+1
		/*
		if(src.juniorc)
			expgain*=1.1
			expgain2*=1.1
		if(src.worldc)
			expgain*=1.2
			expgain2*=1.2
		if(src.galacticc)
			expgain*=1.3
			expgain2*=1.3
		if(src.universalc)
			expgain*=1.4
			expgain2*=1.4
		if(src.smallshard)
			expgain*=1.25
			expgain2*=1.25
		if(src.largeshard)
			expgain*=1.5
			expgain2*=1.5
		if(src.greatshard)
			expgain*=2
			expgain2*=2
		if(src.massshard)
			expgain*=3
			expgain2*=3
		if(src.expbuff)
			expgain*=1.2
			expgain2*=1.2
		if(src.in_hbtc)
			expgain*=4
		if(!src.in_hbtc)
			expgain*=3
		if(M.in_hbtc)
			expgain2*=4
		if(!M.in_hbtc)
			expgain2*=3


			*/
		if(src.juniorc)expgain*=1.1
		if(src.worldc)expgain*=1.2
		if(src.galacticc)expgain*=1.3
		if(src.universalc)expgain*=1.4

		if(src.smallshard)expgain*=1.25
		if(src.largeshard)expgain*=1.5
		if(src.greatshard)expgain*=2
		if(src.massshard)expgain*=3

		if(src.expbuff)expgain*=2


		expgain*=1.2
		if(src.in_hbtc)
			expgain*=4
			tp*=2
		else
			expgain*=3
			tp*=2


		if(M.juniorc)expgain2*=1.1
		if(M.worldc)expgain2*=1.2
		if(M.galacticc)expgain2*=1.3
		if(M.universalc)expgain2*=1.4

		if(M.smallshard)expgain2*=1.25
		if(M.largeshard)expgain2*=1.5
		if(M.greatshard)expgain2*=2
		if(M.massshard)expgain2*=3

		if(M.expbuff)expgain2*=2


		expgain2*=1.2
		if(M.in_hbtc)
			expgain2*=4
			tp2*=2
		else
			expgain2*=3
			tp2*=2

		expgain*=sexp
		expgain2*=sexp

		if(M.KO || src.KO)
			break
		if(src.staminaleft >= src.staminaleft_max)
			src << "You are too tired to continue to dual train!"
			M << "[src] is too tired to continue to dual train!"
			break
		if(M.staminaleft >= M.staminaleft_max)
			M << "You are too tired to continue to dual train!"
			src << "[M] is too tired to continue to dual train!"
			break
	//	if(prob(30))
	//		src.staminaleft+=rand(1,7)
	//		M.staminaleft+=rand(1,7)
		src.exp+=expgain
	//	if(expgain > M.tnl/2)
	//		expgain = M.tnl/2
		M.exp+=expgain2
		spawn() src.Character_Up()
		spawn() M.Character_Up()

	/*	if(prob(8))
			if(prob(src.tpc))
				tp*=2
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = red>Training points +[applycommas(tp)]","output2")
			else
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = white>Training points +[applycommas(tp)]","output2")

			if(prob(M.tpc))
				tp*=2
				M.tp += tp
				if(M.training_on == 1)
					M << output("<font color = red>Training points +[applycommas(tp)]","output2")
			else
				M.tp += tp
				if(M.training_on == 1)
					M << output("<font color = white>Training points +[applycommas(tp)]","output2")
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

			if(prob(M.tpc))
				tp2*=2
				M.tp += tp2
				if(M.training_on == 1)
					M << output("<font color = red>Training points +[applycommas(tp2)]","output2")
			else
				M.tp += tp2
				if(M.training_on == 1)
					M << output("<font color = white>Training points +[applycommas(tp2)]","output2")
		if(!M.calledlvlup)
			if(M.exp >= M.tnl)
				spawn()M.Level_Up()
		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()
	/*
		if(!src||!M)
			if(src)
				src.dtpartner=""
				src.doing = 0
				src.frozen = 0
				src.dualtrain = 0
				src.icon_state = ""
				src.dt_delay = 1
				src.dt_delay = 0
				src.dtrain = 0
			if(M)
				M.doing = 0
				M.frozen = 0
				M.dualtrain = 0
				M.icon_state = ""
				M.dtpartner=""
				M.dt_delay = 1
				M.dt_delay = 0
				M.dtrain = 0
			break
*/
		sleep(6)


	if(src)
		src << output("You stop training","output2")

		src.doing = 0
		src.frozen = 0
		src.dualtrain = 0
		src.icon_state = ""
		src.dtpartner=""
		src.dtrain = 0
		src.dt_delay = 1
	if(M)
		M << output("You stop training","output2")
		M.dtpartner=""
		M.doing = 0
		M.frozen = 0
		M.dualtrain = 0
		M.icon_state = ""

		M.dt_delay = 1

		M.dtrain = 0
	spawn(70)
		if(src)
			src.dt_delay = 0
		if(M)
			M.dt_delay = 0