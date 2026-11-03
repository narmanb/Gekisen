//make new tech eye glare, have it on mouse client click and if its activated it deactivates in 2 seconds, if they double click in that time then it shoots a beam at that area that does aoe like ew
client
	Click(var/X,location,control,params)
		if(istype(X,/obj/Blackjack))
			X:Click()
		if(control=="default.map")
			if(!usr.glare_on)
				return
			if(usr.KO)
				return
			if(usr.binded)
				return
			if(usr.beaming)
				return
			if(usr.gravityfieldon)
				return
			if(usr.grav)
				return
			if(usr.tourny_watch)
				return
			if(usr.regen_dead)
				return
			if(usr.iting)
				return
			if(usr.boxing)
				return
			if(usr.glare_on)
				var/ki_cost = round(500000000+(20000000*usr.kiuse))
				if(usr.ki >= ki_cost)
					usr.ki-=ki_cost
					usr.glare_on=0
					usr.icon_state="attack"
					spawn(5)usr.icon_state=""
					var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 1 + round(usr.level/8000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 1 + round(usr.level/5000)
					usr.Ki_Use_Level()
					usr.staminaleft += 2000
				//	src.setpower = rand(15000,25000)+round(usr.ki/1000)
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 5 + round(usr.level/4000)
						usr.Ki_Cast_Level()
						A.JirenGlareHoming(usr,"Glare","0",'Techs2.dmi',"glare",0,X)
					else
						return

					for(var/mob/Monster/MainMobs/M in oview(12))
						if(M.sleeping)
							M.sleeping = 0
							M.AITarget = usr  // added this line
							if(!M)return
							spawn() M.AI()
					if(usr.z == 8)
						for(var/mob/Monster/ExplosiveMobs/M in oview(19))
							if(M.sleeping)
								M.sleeping = 0
								M.AITarget = usr  // added this line
								if(!M)return
								//spawn() M.AI_Explode()
								spawn() M.Find_AI()

											/*
					for(var/mob/Monster/M in oview(12))
						if(M.sleeping)
							M.sleeping = 0
							spawn(1) M.AI()
					for(var/mob/Saga/S in oview(12))
						if(S.sleeping)
							S.sleeping = 0
							spawn(1) S.SagaAI()
							*/

			else
				return
		..()
obj
	Technique
		Glare
			verb
				Glare()
					set category = "Techniques"

					if(usr.glare_delay)
						usr << "You must wait for Glare to come off cooldown"
						//spawn(160) usr.glare_delay=0
						return

					if(usr.doing)
						usr << "You are already doing something!"
						return

					if(usr.dead)
						return

					if(usr.ki_lock)
						usr << "Cannot use this Technique at his time"
						return

					if(!usr.pk)
						usr << "You are not a Combatant!"
						return

					if(usr.glare_on)
						usr<< "You already have Glare activated"
					else
						spawn(200)
							usr.glare_delay=0
						usr.glare_delay=1
						spawn(20)
							usr.glare_on=0
						usr.glare_on=1

obj/Technique/Assasinate
	verb/Assasinate(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		set name = "Assassinate"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Assassinate")
		if(!M)return
		if(usr.doing)
			usr << "You are doing something already!"
			return
		if(usr.dead || M.dead)
			usr << "A force stops you from attacking [M]"
			return
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				usr << "You are in a Safe Zone!"
		if(usr.safe || M.safe)
			usr << "A force stops you from attacking [M]"
			return
		if(!M.pk)
			usr << "[M] is not a Combatant!"
			return
		if(M.FuseFollower)
			return
		if(!usr.pk)
			usr << "You are not a Combatant!"
			return
		if(!M.KO && M.powerlevel > 0)
			usr << "[M] must be knocked out first!"
			return
		else

			var/gain = rand(1,3)
			var/gainamount = rand(5,20)
			if(gain == 1)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from assassinating [M]!","output2")
				usr.strength_bonus += gainamount
			if(gain == 2)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from assassinating [M]!","output2")
				usr.defence_bonus += gainamount
			if(gain == 3)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from assassinating [M]!","output2")
				usr.ki_bonus += gainamount

			usr.doing = 1
			usr.frozen = 1
			spawn(5)
				usr.doing = 0
				usr.frozen = 0
	//		usr << "<b>You have gained [applycommas(assassinate)] powerlevel for assassinating [M]!"
	//		usr.powerlevel_max += assassinate
		//	M.powerlevel_max -= assassinate
			M.powerlevel = 0
			usr.assasin_kill += 1
			M.DeathCheck(usr,"Assasinate")


mob/var/tmp/timeskipeffect=0
mob/var/tmp/zanz_TS=0
obj
	Technique
		TimeSkip
			verb
				Time_Skip(mob/M in oview(10))
					set category = "Techniques"

					if(usr.skip_delay)
						usr << "You must wait to use this again!"
						return

					if(usr.doing)
						usr << "You are already doing something!"
						return

					if(usr.buku)
						return

					if(usr.dead)
						return

					if(usr.ki_lock)
						usr << "Cannot use this Technique at his time"
						return

					if(!usr.pk)
						usr << "You are not a Combatant!"
						return

					if(!M.pk)
						usr<<"[M] isn't a Combatant!"
					if(M.safe)
						usr<<"This is a safe mob"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in view(12))
							usr << "They are in a Safe Zone!"
							return

					if(usr.ki >= 200000)
						if(usr.skip_delay)
							usr << "You must wait to use this again!"
							return
						spawn(1000)usr.skip_delay = 0
						usr.skip_delay = 1
						usr.attackCD = 1
						spawn(20) usr.attackCD = 0
						if(istype(M,/mob/PC))

							M.rage += round(rand(20,35))
							if(M.rage >= 100)
								M.rage = 100
							if(M.iting && M.pvpflagged)
								M.ITstop = 1
								//damage *= 2
								//src << output("<font size=1><b><font color=yellow>[a]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

						oview(12) << "[usr]: You won't see this coming!!!"
						//M.frozen=1
						M.move_delay = 5 //this might need changed
						M.zanz_TS=1
						M.it_lock=1
						M.timeskipeffect=1

						//sleep(100)
						if(M)
							spawn(150) M.move_delay=0.6
							spawn(200) M.zanz_TS=0
							spawn(150) M.it_lock=0
							spawn(200) M.timeskipeffect=0

						/*
						sleep(2)
						if(!M)return
						M.frozen=1
						usr.doing=1
						M.doing=1

						usr.ki-=200000
						flick("IT",usr)
						if(!M)return
						var/tmp/tempx=usr.x
						var/tmp/tempy=usr.y
						var/tmp/tempz=usr.z
						usr.loc=locate(M.x,M.y+1,M.z)
						usr.dir=SOUTH
						var/A = round(((usr.powerlevel+usr.strength)*1.5)-(M.defence+M.powerlevel))
						if(!M)return
						if(A>0)
							M.powerlevel-=A
						M << "<font color=red>You feel the effect of [usr]'s punch!</font>"
						M.KO()
						sleep(1)
						flick("IT",usr)
						usr.loc=locate(tempx,tempy,tempz)
						sleep(4)
						usr.doing=0
						M.doing=0
						if(istype(M,/mob/PC))
							if(M.dead)
								M.frozen=0
								usr.doing=0
								M.doing=0
								usr.doing=0
								return 0
							M.frozen=0
							M.doing=0
							*/