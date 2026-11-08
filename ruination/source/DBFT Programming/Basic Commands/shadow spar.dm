mob/var/image/TI
mob/var/tmp/train
mob/var/tmp/sscorrect=0
mob/var/tmp/zpsparcount=0
mob/var/direction
mob/var/tmp/response
mob/var/tmp/delayspar=0
mob/var/amount=0
mob/var/L[5]
mob/var/D[5]
mob/var/position=0
mob/var/tmp/waiting1=0
mob/var/image/AU1
mob/var/image/AU2
mob/var/image/AU3
mob/var/image/AU4
mob/var/image/AU5
mob/var/image/AR1
mob/var/image/AR2
mob/var/image/AR3
mob/var/image/AR4
mob/var/image/AR5
mob/var/image/AL1
mob/var/image/AL2
mob/var/image/AL3
mob/var/image/AL4
mob/var/image/AL5
mob/var/image/AD1
mob/var/image/AD2
mob/var/image/AD3
mob/var/image/AD4
mob/var/image/AD5
mob/var/image/A1
mob/var/image/A2
mob/var/image/A3
mob/var/image/LG
mob/var/image/RG
mob/var/image/UG
mob/var/image/DG
mob/PC
	verb
		Shadow_Spar()
			set category="Training"
			if(boxing||rest||dualtrain||doing||focus_boxing||boxing||train||jailed||meditating||buku)return
			if(usr.waiting1)
				usr<<"You must wait to do this again!"
				return
			if(staminaleft>=staminaleft_max)
				usr<<"You are too drained to train!"
				return


	//		winset(usr,"macro1.WEST+Up","command=Training-Left")
	//		winset(usr,"macro1.NORTH+Up","command=Training-Up")
	//		winset(usr,"macro1.SOUTH+Up","command=Training-Down")
	//		winset(usr,"macro1.EAST+Up","command=Training-Right")

		//	winset(src, "macro1.WEST", "name=West+Up","command=Training-Left")
		//	winset(src, "macro1.NORTH", "name=North+Up","command=Training-Up")
		//	winset(src, "macro1.SOUTH", "name=South+Up","command=Training-Down")
		//	winset(src, "macro1.EAST", "name=East+Up","command=Training-Right")
			winset(src, "default", "macro = macroSS");


			train=1

			position=0
			A1 = image('Arrow.dmi',usr,icon_state = "l")
			A1.pixel_y = 32
			A1.pixel_x = -32
			usr << A1
			A2 = image('Arrow.dmi',usr,icon_state = "m")
			A2.pixel_y = 32
			usr << A2
			A3 = image('Arrow.dmi',usr,icon_state = "r")
			A3.pixel_y = 32
			A3.pixel_x = 32
			usr << A3
			doing = 1
			icon_state = "spar fury"
			dir = EAST
			usr<<"You begin to shadow spar with an image of yourself, push the correct arrow keys to train."
			frozen = 1
			sscorrect=0
			usr.waiting1=1
		//	var/mob/monsters/D=new/mob/monsters(get_step(usr,usr.dir),usr)
			//var/obj/afterImage = new /obj()
			var/obj/ShadowSparImage/afterImage=new/obj/ShadowSparImage()
			//var/obj/afterImage/afterImage=new
			afterImage.layer = MOB_LAYER + 1

			afterImage.icon=usr.icon
			afterImage.icon_state= "spar fury"//src.icon_state
			afterImage.overlays=usr.overlays
			afterImage.underlays = usr.underlays
			afterImage.dir=WEST
			afterImage.owner = src
		//	var/randcolor = pick("BGR", "Polaroid", "GRB", "RBG", "BRG", "GBR")
			//var/ColorMatrix/c = new("sepia")
			var/ColorMatrix/c = new("Polaroid")


		//	animate(src, color = c.matrix, time = 10)
			animate(afterImage, alpha = 125, color = c.matrix, time = 6)

				//afterImage.filters += filter(type="blur", size = 0)
		//	afterImage.filters = filter(type="outline", size=1, color = c.matrix)
			//spawn(3) animate(src, color = null, time = 2)
			afterImage.loc = locate(src.x+1,src.y,src.z)
		//	spawn() afterImage.disappearimagespar(src)
			Training()
		//Training_Down()
		SS_Down()
			set hidden = 1
			if(!train)
				return
			delayspar = 1
			if(position==1)
				if(D[1]=="Down")
					position++
					Shadow_Spar2()
					client.images -= AD1
					DG = image('Arrow.dmi',usr,icon_state = "down_gone")
					DG.pixel_y = 32
					DG.pixel_x = -32
					usr << DG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==2)
				if(D[2]=="Down")
					position++
					Shadow_Spar2()
					client.images -= AD2
					DG = image('Arrow.dmi',usr,icon_state = "down_gone")
					DG.pixel_y = 32
					DG.pixel_x = -16
					usr << DG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==3)
				if(D[3]=="Down")
					position++
					Shadow_Spar2()
					client.images -= AD3
					DG = image('Arrow.dmi',usr,icon_state = "down_gone")
					DG.pixel_y = 32
					DG.pixel_x = 0
					usr << DG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==4)
				if(D[4]=="Down")
					position++
					Shadow_Spar2()
					client.images -= AD4
					DG = image('Arrow.dmi',usr,icon_state = "down_gone")
					DG.pixel_y = 32
					DG.pixel_x = 16
					usr << DG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==5)
				if(D[5]=="Down")
					Shadow_Spar2()
				//	client.images -= AD5  //this
					DG = image('Arrow.dmi',usr,icon_state = "down_gone")
					DG.pixel_y = 32
					DG.pixel_x = 32
					usr << DG
					Training()
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
		//	spawn(15) delayspar = 0
		//Training_Left()
		SS_Left()
			set hidden = 1
			if(!train)
				return
			delayspar = 1
			if(position==1)
				if(D[1]=="Left")
					position++
					Shadow_Spar2()
					client.images -= AL1
					LG = image('Arrow.dmi',usr,icon_state = "left_gone")
					LG.pixel_y = 32
					LG.pixel_x = -32
					usr << LG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==2)
				if(D[2]=="Left")
					position++
					Shadow_Spar2()
					client.images -= AL2
					LG = image('Arrow.dmi',usr,icon_state = "left_gone")
					LG.pixel_y = 32
					LG.pixel_x = -16
					usr << LG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==3)
				if(D[3]=="Left")
					position++
					Shadow_Spar2()
					client.images -= AL3
					LG = image('Arrow.dmi',usr,icon_state = "left_gone")
					LG.pixel_y = 32
					LG.pixel_x = 0
					usr << LG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==4)
				if(D[4]=="Left")
					position++
					Shadow_Spar2()
					client.images -= AL4
					LG = image('Arrow.dmi',usr,icon_state = "left_gone")
					LG.pixel_y = 32
					LG.pixel_x = 16
					usr << LG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==5)
				if(D[5]=="Left")
					Shadow_Spar2()
					//client.images -= AL5  //this
					LG = image('Arrow.dmi',usr,icon_state = "left_gone")
					LG.pixel_y = 32
					LG.pixel_x = 32
					usr << LG
					Training()
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()

	//		spawn(15) delayspar = 0
		//Training_Up()
		SS_Up()
			set hidden = 1
			if(!train)
				return
			delayspar = 1
			if(position==1)
				if(D[1]=="Up")
					position++
					Shadow_Spar2()
					client.images -= AU1
					UG = image('Arrow.dmi',usr,icon_state = "up_gone")
					UG.pixel_y = 32
					UG.pixel_x = -32
					usr << UG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==2)
				if(D[2]=="Up")
					position++
					Shadow_Spar2()
					client.images -= AU2
					UG = image('Arrow.dmi',usr,icon_state = "up_gone")
					UG.pixel_y = 32
					UG.pixel_x = -16
					usr << UG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==3)
				if(D[3]=="Up")
					position++
					Shadow_Spar2()
					client.images -= AU3
					UG = image('Arrow.dmi',usr,icon_state = "up_gone")
					UG.pixel_y = 32
					UG.pixel_x = 0
					usr << UG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==4)
				if(D[4]=="Up")
					position++
					Shadow_Spar2()
					client.images -= AU4
					UG = image('Arrow.dmi',usr,icon_state = "up_gone")
					UG.pixel_y = 32
					UG.pixel_x = 16
					usr << UG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==5)
				if(D[5]=="Up")
					Shadow_Spar2()
					//client.images -= AU5  //this
					UG = image('Arrow.dmi',usr,icon_state = "up_gone")
					UG.pixel_y = 32
					UG.pixel_x = 32
					usr << UG
					Training()
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
	//		spawn(15) delayspar = 0
	//	Training_Right()
		SS_Right()
			set hidden = 1
			if(!train)
				return
			delayspar = 1
			if(position==1)
				if(D[1]=="Right")
					position++
					Shadow_Spar2()
					client.images -= AR1
					RG = image('Arrow.dmi',usr,icon_state = "right_gone")
					RG.pixel_y = 32
					RG.pixel_x = -32
					usr << RG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==2)
				if(D[2]=="Right")
					position++
					Shadow_Spar2()
					client.images -= AR2
					RG = image('Arrow.dmi',usr,icon_state = "right_gone")
					RG.pixel_y = 32
					RG.pixel_x = -16
					usr << RG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==3)
				if(D[3]=="Right")
					position++
					Shadow_Spar2()
					client.images -= AR3
					RG = image('Arrow.dmi',usr,icon_state = "right_gone")
					RG.pixel_y = 32
					RG.pixel_x = 0
					usr << RG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==4)
				if(D[4]=="Right")
					position++
					Shadow_Spar2()
					client.images -= AR4
					RG = image('Arrow.dmi',usr,icon_state = "right_gone")
					RG.pixel_y = 32
					RG.pixel_x = 16
					usr << RG
				else
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					spawn(100)if(src)usr.waiting1 = 0
					UnTraining()
			else if(position==5)
				if(D[5]=="Right")
					Shadow_Spar2()
//					client.images -= AR5  //this
					RG = image('Arrow.dmi',usr,icon_state = "right_gone")
					RG.pixel_y = 32
					RG.pixel_x = 32
					usr << RG
					Training()
				else
					spawn(100)if(src)usr.waiting1 = 0
					usr<<"Combo ended! Total: <b>[applycommas(usr.sscorrect)]"
					UnTraining()
		//	spawn(15) delayspar = 0
mob
	proc
		UnTraining()
			train = 0
			position = 0
			doing = 0
			frozen = 0
			sscorrect=0
			zpsparcount = 0
			//ssexp=1
			icon_state = ""
			amount=1
		//	var/count = 0

			for(var/obj/ShadowSparImage/A in world)
		//		count++
				//world << "count [count] [A] [A.owner] [A.name]"
				if(A.owner==src)
					del A
			spawn(3)if(src)client.images = null
			//winset(src,"macro1.WEST","command=.west")
		//	winset(src,"macro1.NORTH","command=.north")
		//	winset(src,"macro1.SOUTH","command=.south")
		//	winset(src,"macro1.EAST","command=.east")
			winset(src, "default", "macro = macro1");
		Training()
			var/i
			amount=1
			//alert("1")

		//	spawn(-1)
		//		client.images -= LG
		//		client.images -= RG
		//		client.images -= UG
		//		client.images -= DG

			switch(src.sscorrect)
				if(100)
					for(var/obj/ShadowSparImage/A in world)
						if(A.owner==src)
							A.alpha = 150
				if(200)
					for(var/obj/ShadowSparImage/A in world)
						if(A.owner==src)
							A.alpha = 175
				if(300)
					for(var/obj/ShadowSparImage/A in world)
						if(A.owner==src)
							A.alpha = 200
				if(400)
					for(var/obj/ShadowSparImage/A in world)
						if(A.owner==src)
							A.alpha = 225
				if(500)
					for(var/obj/ShadowSparImage/A in world)
						if(A.owner==src)
							A.alpha = 250
			if(position==5)
				position=1
				client.images = null
				A1 = image('Arrow.dmi',src,icon_state = "l",layer = FLY_LAYER -1)
				A1.pixel_y = 32
				A1.pixel_x = -32
				src << A1
				A2 = image('Arrow.dmi',src,icon_state = "m")
				A2.pixel_y = 32
				src << A2
				A3 = image('Arrow.dmi',src,icon_state = "r")
				A3.pixel_y = 32
				A3.pixel_x = 32
				src << A3
			//	sleep(1)
			//	alert("2")

			else position++
		//	sleep(2)
			for(i=1, i<=L.len, i++)
				L[i] = rand(1,4)
				//alert("4")
				if(amount==1)
					//alert("AMOUNT 1")
					if(L[i]==1)
						AU1 = image('Arrow.dmi',src,icon_state = "up")
						AU1.pixel_y = 32
						AU1.pixel_x = -32
						src << AU1
						D[i] = "Up"
					else if(L[i]==2)
						AD1 = image('Arrow.dmi',src,icon_state = "down")
						AD1.pixel_y = 32
						AD1.pixel_x = -32
						src << AD1
						D[i] = "Down"
					else if(L[i]==3)
						AL1 = image('Arrow.dmi',src,icon_state = "left")
						AL1.pixel_y = 32
						AL1.pixel_x = -32
						src << AL1
						D[i] = "Left"
					else if(L[i]==4)
						AR1 = image('Arrow.dmi',src,icon_state = "right")
						AR1.pixel_y = 32
						AR1.pixel_x = -32
						src << AR1
						D[i] = "Right"
					amount=2

				else if(amount==2)
					//alert("AMOUNT 2")
					if(L[i]==1)
						AU2 = image('Arrow.dmi',src,icon_state = "up")
						AU2.pixel_y = 32
						AU2.pixel_x = -16
						src << AU2
						D[i] = "Up"
					else if(L[i]==2)
						AD2 = image('Arrow.dmi',src,icon_state = "down")
						AD2.pixel_y = 32
						AD2.pixel_x = -16
						src << AD2
						D[i] = "Down"
					else if(L[i]==3)
						AL2 = image('Arrow.dmi',src,icon_state = "left")
						AL2.pixel_y = 32
						AL2.pixel_x = -16
						src << AL2
						D[i] = "Left"
					else if(L[i]==4)
						AR2 = image('Arrow.dmi',src,icon_state = "right")
						AR2.pixel_y = 32
						AR2.pixel_x = -16
						src << AR2
						D[i] = "Right"
					amount=3
				else if(amount==3)
					//alert("AMOUNT 3")
					if(L[i]==1)
						AU3 = image('Arrow.dmi',src,icon_state = "up")
						AU3.pixel_y = 32
						AU3.pixel_x = 0
						src << AU3
						D[i] = "Up"
					else if(L[i]==2)
						AD3 = image('Arrow.dmi',src,icon_state = "down")
						AD3.pixel_y = 32
						AD3.pixel_x = 0
						src << AD3
						D[i] = "Down"
					else if(L[i]==3)
						AL3 = image('Arrow.dmi',src,icon_state = "left")
						AL3.pixel_y = 32
						AL3.pixel_x = 0
						src << AL3
						D[i] = "Left"
					else if(L[i]==4)
						AR3 = image('Arrow.dmi',src,icon_state = "right")
						AR3.pixel_y = 32
						AR3.pixel_x = 0
						src << AR3
						D[i] = "Right"
					amount=4
				else if(amount==4)
					//alert("AMOUNT 4")
					if(L[i]==1)
						AU4 = image('Arrow.dmi',src,icon_state = "up")
						AU4.pixel_y = 32
						AU4.pixel_x = 16
						src << AU4
						D[i] = "Up"
					else if(L[i]==2)
						AD4 = image('Arrow.dmi',src,icon_state = "down")
						AD4.pixel_y = 32
						AD4.pixel_x = 16
						src << AD4
						D[i] = "Down"
					else if(L[i]==3)
						AL4 = image('Arrow.dmi',src,icon_state = "left")
						AL4.pixel_y = 32
						AL4.pixel_x = 16
						src << AL4
						D[i] = "Left"
					else if(L[i]==4)
						AR4 = image('Arrow.dmi',src,icon_state = "right")
						AR4.pixel_y = 32
						AR4.pixel_x = 16
						src << AR4
						D[i] = "Right"
					amount=5
				else if(amount==5)
					//alert("AMOUNT 5")
					if(L[i]==1)
						AU5 = image('Arrow.dmi',src,icon_state = "up")
						AU5.pixel_y = 32
						AU5.pixel_x = 32
						src << AU5
						D[i] = "Up"
					else if(L[i]==2)
						AD5 = image('Arrow.dmi',src,icon_state = "down")
						AD5.pixel_y = 32
						AD5.pixel_x = 32
						src << AD5
						D[i] = "Down"
					else if(L[i]==3)
						AL5 = image('Arrow.dmi',src,icon_state = "left")
						AL5.pixel_y = 32
						AL5.pixel_x = 32
						src << AL5
						D[i] = "Left"
					else if(L[i]==4)
						AR5 = image('Arrow.dmi',src,icon_state = "right")
						AR5.pixel_y = 32
						AR5.pixel_x = 32
						src << AR5
						D[i] = "Right"
					amount=0
					//alert("AMOUNT OVER")
mob/var/tmp/sptp=0
mob/proc/Shadow_Spar2()
	//var/exp_bonus = 71.7
	if(staminaleft>=staminaleft_max)
		src<<"You need to rest to continue training!"
	//	src.overlays += src.rest1
		UnTraining()
		spawn(100)if(src)usr.waiting1 = 0
		return
	else
		/*33
		if(grav_trainer)exp_bonus*=2.5
		if(gravity_train)exp_bonus*=2.5
		if(expbuff)exp_bonus*=2
		if("exp_buff" in src.buffs)exp_bonus*=2
		if(in_hbtc)exp_bonus*=7
		if(in_FC)exp_bonus*=5.5
		if(in_sub)exp_bonus*=8.5
		if(weight>1)exp_bonus*=3.5
		exp += exp_bonus
		src.sttps+=1
		if(src.sttps>=10)
			if(prob(30))
				src.sttps=0
				src.tp += 1
				src << output("<font color = red><b>T<I>raining </I>P<I>oints \yellow +1","output5")
		staminaleft += 3.7
		Level_Up()
		*/
		var/tp = rand(1,3)+(1 * rand(2,9))+round(src.level/10000)+moden*4
		var/z = round(rand(15,600) + src.level/2)
		var/expgain = round((rand(5,20)+src.level/300)*src.expm)+(1*5)+1
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

		//if(src.in_hbtc)
		tp*=3
		expgain*=2
		expgain*=sexp
		z*=szenni
		src.sscorrect++
		var/ssgain = src.sscorrect
		if(ssgain > 500)
			ssgain = 500
		expgain += expgain * (ssgain/100)
		z = z * 2
		tp += tp * (ssgain/50)
		tp = tp/2
		tp = round(tp * 0.4)
	//	src << "Exp + [applycommas(expgain)]"
	/*	for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				tp/2
				expgain/2
				*/
		if(prob(10))
			if(prob(src.tpc))
				tp*=2
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = red>Training points +[applycommas(tp)]","output2")
			else
				src.tp += tp
				if(src.training_on == 1)
					src << output("<font color = white>Training points +[applycommas(tp)]","output2")

		src.zpsparcount++

		if(src.shadowsparinfo)
			src << output("<b><font color = white>Exp + [applycommas(expgain)]		Combo: [applycommas(sscorrect)]","output2")
		//	src << output("<b><font color = white>Combo: [applycommas(sscorrect)]","output2")
	/*
		if(src.zpsparcount >= 1000)
			if(prob(src.zpc))
				src.zp += 2
				src << "<font color=red>You have gained 2 Z Points!</font>"
				src.zpsparcount = 0
			else



				src.zp += 1
				src << "<font color=red>You have gained a Z Point!</font>"
				src.zpsparcount = 0
				*/
		if(prob(20))
			src.zenni += z
		src.exp+=expgain
		if(src.hudenabled)
			if(!src.calledlvlup)
				if(prob(10))
					spawn() src.updateexp()

		if(src.hudenabled)
			if(!src.calledlvlup&&!src.calledexphud)
				src.calledexphud = 1
				spawn(50) src.calledexphud = 0
				spawn() src.updateexp()
		if(src.undercheck)
			var/mob/GMC=src.checker
			GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Self Train)"
		src.Character_Up()
		if(!src.calledlvlup)
			if(src.exp >= src.tnl)
				spawn()src.Level_Up()
		if(prob(1))
			src.staminaleft++

	//	return


//mob/verb/clearim()
//	client.images = null



obj/ShadowSparImage
	name=""
	icon_state=""
	New()
		..()
		//spawn(10)del(src)


obj/proc
	disappearimagespar(mob/P)
//		var/timeH=0
		while(P.train)
			//timeH++
			//if(timeH > 1)
			//	del(src)
			//	break
//			world << "P"
			if(!P||!P.train)
				del src
			if(src)	sleep(50)
		del src