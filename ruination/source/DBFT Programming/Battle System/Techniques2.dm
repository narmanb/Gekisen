mob
	var
		gravityfielddelay=0
		buffdelay1=0
		buffdelay2=0
		buffdelay3=0
		buffdelay4=0
		buffdelay5=0
		buffdelay6=0
		buff1=0
		buff2=0
		buff3=0
		buff4=0


		manipulationdelay=0
		manipulated=0
		prPL=0
		prKI=0
		prKIDEF=0
		prSTR=0
		prDEF=0
		tmp
			staminabuff=0
			expbuff=0
			gravityfieldon=0
			gravityfieldspam=0
			freeze_delay=0

			burst_delay = 0
			skip_delay = 0
			tyrant_delay = 0

	proc

		Freeze(mob/M)
			for(var/turf/Floors/Safe_Zone/S in view(12))
				if(S in oview(12))
					usr << "Safe Zone!"
					return
			if(M.safe||src.doing||src.buku||src.dead||M.dead || M==src)
				return
			view(12)<<"\white [src] uses their special technique to freeze [M]!"
			M.frozen=1
			M.zanz_lock=1
			M.it_lock=1
			sleep(20)
			if(M)
				M.frozen=0
				M.zanz_lock=0
				M.it_lock=0

		GravityFieldBonus()
			if(src.gravityfieldon)
				spawn(600)
					if(src.gravityfieldon)
						if(src.ki>1000000)
							src.ki-=1000000
							if(src.ki<0)
								src.ki=0
							src.gravityfielddelay+=2
							if(src.gravityfielddelay>=60)
								src.gravityfieldon=0
								spawn(1)src.GravityFieldCooldown()
							else
								for(var/mob/PC/M in view(12))
								//	var/PlLoss=src.level*5
									M << output("You feel [src]'s Gravity Field pull down on you.","default.output2")
								//	if(!M.dead)
								//		M.powerlevel -= PlLoss
								//		M.DeathCheck(src)
									sleep(1)
								for(var/mob/PC/M in view(12))
									if(M.staminaleft < M.staminaleft_max)
										var/boostlvl=src.level
										if(boostlvl>50000)
											boostlvl=50000
								//		M.staminaleft_exp += rand(3,9)
										M.exp += (boostlvl/90)+1
								//		M.staminaleft += 1+((boostlvl/90)*0.8)
										//spawn(1)M.Level_Up()
										//spawn(1)M.Fatigue_Level_Up()
								spawn(600)
									if(src.gravityfieldon)
										src.GravityFieldBonus()
						else
							if(src.gravityfieldon)
								src<<"You have ran out of Ki so sustain the Gravity Field."
								src.gravityfieldon=0
								spawn(1)src.GravityFieldCooldown()
		GravityFieldCooldown()
			if(!src.gravityfieldon)
				spawn(600)
					if(!src.gravityfieldon)
						if(src.gravityfielddelay)
							src.gravityfielddelay-=1
							if(src.gravityfielddelay<0)
								src.gravityfielddelay=0
								return
							spawn(600)
								if(!src.gravityfieldon)
									src.GravityFieldCooldown()
		BuffCooldown1()
			spawn(600)
				if(src.buffdelay1)
					src.buffdelay1-=1
					if(src.buffdelay1<0)
						src.buffdelay1=0
						return
					spawn(600)
						if(src.buffdelay1)
							src.BuffCooldown1()
/*

		BuffCooldown1()
			while(src.buffdelay1)
				src.buffdelay1-=1
				if(src.buffdelay1<0)
					src.buffdelay1=0
					return
				sleep(600)


				if(src.buffdelay1)
					src.buffdelay1-=1
					if(src.buffdelay1<0)
						src.buffdelay1=0
						return
					spawn(600)
						if(src.buffdelay1)
							src.BuffCooldown1()

							*/

		BuffCooldown2()
			spawn(600)
				if(src.buffdelay2)
					src.buffdelay2-=1
					if(src.buffdelay2<0)
						src.buffdelay2=0
						return
					spawn(600)
						if(src.buffdelay2)
							src.BuffCooldown2()
		BuffCooldown3()
			spawn(600)
				if(src.buffdelay3)
					src.buffdelay3-=1
					if(src.buffdelay3<0)
						src.buffdelay3=0
						return
					spawn(600)
						if(src.buffdelay3)
							src.BuffCooldown3()
		BuffCooldown4()
			spawn(600)
				if(src.buffdelay4)
					src.buffdelay4-=1
					if(src.buffdelay4<0)
						src.buffdelay4=0
						return
					spawn(600)
						if(src.buffdelay4)
							src.BuffCooldown4()
		BuffCooldown5()
			spawn(600)
				if(src.buffdelay5)
					src.buffdelay5-=1
					if(src.buffdelay5<0)
						src.buffdelay5=0
						return
					spawn(600)
						if(src.buffdelay5)
							src.BuffCooldown5()
		BuffCooldown6()
			spawn(600)
				if(src.buffdelay6)
					src.buffdelay6-=1
					if(src.buffdelay6<0)
						src.buffdelay6=0
						return
					spawn(600)
						if(src.buffdelay6)
							src.BuffCooldown6()

		Manipulation_Cooldown()
			spawn(600)
				if(src.manipulationdelay)
					src.manipulationdelay-=1
					if(src.manipulationdelay<0)
						src.manipulationdelay=0
						return
					spawn(600)
						if(src.manipulationdelay)
							src.Manipulation_Cooldown()


		BuffDown(T)
			switch(T)
				if("PL")
					spawn(54000)
						src<<"Your Powerlevel is back to normal."
						src.buff1=0
						src.prPL=0
						src.Power_Redefine()
				if("KI")
					spawn(54000)
						src<<"Your Ki is back to normal."
						src.buff2=0
						src.prKIDEF=0
						src.prKI=0
						src.Power_Redefine()
				if("STR")
					spawn(54000)
						src<<"Your Strength is back to normal."
						src.buff3=0
						src.prSTR=0
						src.Power_Redefine()
				if("DEF")
					spawn(54000)
						src<<"Your Defense is back to normal."
						src.buff4=0
						src.prDEF=0
						src.Power_Redefine()
				if("FAT")
					spawn(54000)
						src<<"Your Stamina is back to normal."
						src.staminabuff=0
				if("EXP")
					spawn(54000)
						src<<"Your Exp is back to normal."
						src.expbuff=0

		BuffDownMajin()
			spawn(54000)
				src<<"Your Powerlevel is back to normal."
				src.manipulated=0
				src.prPL=0
				src.prKI=0
				src.prKIDEF=0
				src.prSTR=0
				src.prDEF=0
				src.Power_Redefine()

obj
	Technique

		BlazingBlast
			verb
				Blazing_Blasts()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: BLAZING..."
					sleep(2)
					view(6)<<"\white[usr]: ...BLAST!!! HA!"

					usr.frozen=0
					usr.doing=0


					//var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 20


					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/BlazingBlast/M=new/obj/blasts/BlazingBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		BurstRush
			verb
				Burst_Rush(mob/M in oview(11))
					set category = "Techniques"
					if(usr.frozen)
						return
					if(usr.burst_delay)
						usr << "You must wait to use this again!"
						return
					if(usr.attackCD)
						usr << "You must wait a second to use this"
						return
					if(usr.doing||usr.buku)
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
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in view(10))
							usr << "They are in a Safe Zone!"
							return
					if(!istype(M,/mob/PC)&&!istype(M,/mob/Monster))
						return

					if(usr.ki >= 100000)

						if(usr.burst_delay)
							usr << "You must wait to use this again!"
							return
						usr.staminaleft += 200
						usr.burst_delay = 1
						spawn(120)usr.burst_delay = 0

						view(12) << "\white [usr]: So you think you can run??"
				//		sleep(5)
				//		view(12) << "\white [src]: I DONT THINK SO!!!!"

					//	if(!M in view(11))
					//		return
						usr.attackCD = 1
						spawn(50) usr.attackCD = 0
						M.attackCD = 1
						spawn(50) M.attackCD = 0
						usr.doing=1
						M.doing=1
						usr.ki-=100000
						flick("IT",usr)
					//	if(!M in view(13))
					//		return
						if(M.x&&M.y&&M.z)
							usr.loc=locate(M.x,M.y-1,M.z)
							usr.dir=NORTH
							flick("attack",usr)

						sleep(4)
						if(usr.dead)
							//usr << "<b>BR error"
							usr.doing = 0
							return
						flick("IT",usr)
						if(M.x&&M.y&&M.z)
							usr.loc=locate(M.x-1,M.y,M.z)
							usr.dir=EAST
							flick("attack",usr)
						sleep(4)
						if(usr.dead)
							//usr << "<b>BR error"
							usr.doing = 0
							return
						flick("IT",usr)
						if(M.x&&M.y&&M.z)
							usr.loc=locate(M.x+1,M.y,M.z)
							usr.dir=WEST
							flick("attack",usr)
						spawn() usr.ThrowMob(M, 1, 10, usr.dir)
						/*
						var/attackpower=round(((usr.strength * usr.melee)/100) + (usr.powerlevel / 100))
						var/defensepower=round(((M.defence * M.durability)/100) + (M.powerlevel / 100))
						var/A=round(attackpower-defensepower)

						if(A>0)
							M.powerlevel-=A
							*/
						view() << "<font color=red>[usr] rushes [M]!</font>"
						if(M.buku)
							view() << "<b><font color=red>[usr]'s attack forces [M] to land!</font>"
							M.buku = 0
							M.density = 1
							M.icon_state = ""
							M.doing = 0
							M.move_delay = 0.6


						M.buku_lock = 1
						spawn(100)
							if(M) M.buku_lock = 0

						M.zanz_lock=1
						M.it_lock=1

						spawn(40)
							if(M) M.zanz_lock=0
						spawn(120)
							if(M) M.it_lock=0
				//		sleep(5)
					//	if(!M in view(13))
					//		M.frozen = 0
					//		usr.doing = 0
					//		M.doing = 0

						view() << "<font color=red>[usr] stops [M] from fleeing!</font>"



						usr.doing=0
						M.doing=0
						if(istype(M,/mob/PC))

							M.rage += round(rand(12,15))
							if(M.rage >= 100)
								M.rage = 100
							if(M.iting && M.pvpflagged)
								M.ITstop = 1
							//	damage  2
								//usr << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

							if(M.dead)
								M.frozen=0
								usr.doing=0
								M.doing=0

								return 0
							M.frozen=0
							M.doing=0
							M.move_delay = 2
						//	M.move_delay = 1
							spawn(60) M.move_delay = 0.6

		ElectricRain
			verb
				Electric_Rain()
				//Electric_Rain(mob/M in oview(10))
//					var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0



					usr.doing=1
					usr.frozen=1
					view(6) << "<font color = white>[usr] creates a thunder ball on his hand"
					sleep(3)
					view(6) << "<font color = white>[usr]: Here take this!"
					sleep(2)
					view(6) << "<font color = white>[usr]: ELECTRIC..."
					sleep(1)
					view(6) << "<font color = white>[usr]: RAIN..."
					sleep(1)
					view(6) << "<font color = white>[usr]: HAAAAAA"

					usr.frozen=0
					usr.doing=0


					//var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 35
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/ElectricRain/M=new/obj/blasts/ElectricRain(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		Freeze
			verb
				//Freeze(var/mob/M in oview(12))
				Freeze()
					set category = "Techniques"
					set src = usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in view(12))
							usr << "They are in a Safe Zone!"
							return

					if(usr.freeze_delay)
						usr<<"You must wait until your cooldown is over to use this technique again"
						return
					spawn(25)usr.doing=0
					usr.doing=1
					spawn(300)usr.freeze_delay=0
					usr.freeze_delay=1
					view(12) << "\white [usr]: FREEZE."
				//	if(!M in view(10))
				//		return
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					//src.setpower = round(rand(usr.powerlevel/1000,usr.powerlevel/2000) + (rand(rangeA,rangeB)*usr.ki_power))
					usr.doing=0

					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 5 + round(usr.level/4000)
						usr.Ki_Cast_Level()

						var/obj/blasts/Freeze/M=new/obj/blasts/Freeze(get_step(usr,usr.dir),usr)
					//	var/obj/blasts/kiblast/M = projectile(/obj/blasts/kiblast,usr,usr,usr.dir)
						if(trg)
							M.dmg(trg,usr,M)
							return
						M.Fire2()
					/*
					view(12)<<"\white [usr] uses their special technique to freeze [M]!"
					M.frozen=1
					M.zanz_lock=1
					M.it_lock=1
					sleep(50)
					if(M)
						view(12)<<"[M] has been unfrozen!"
						M.frozen=0
						M.zanz_lock=0
						M.it_lock=0
						*/


		GalacticTyrant
			verb
				Galactic_Tyrant(mob/M in oview(10))
					set category = "Techniques"

					if(usr.burst_delay)
						usr << "You must wait to use this again!"
						return

					if(usr.doing||usr.buku)
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
						if(usr.burst_delay)
							usr << "You must wait to use this again!"
							return
						spawn(400)usr.burst_delay = 0
						usr.burst_delay = 1
						oview(12) << "GET BACK HERE BITCH!!!"
						sleep(20)
						if(!M)return
						M.frozen=1
						usr.doing=1
						M.doing=1

						usr.ki-=200000
						flick("IT",usr)
						if(!M)return
						usr.loc=locate(M.x,M.y-1,M.z)
						usr.dir=NORTH
						var/attackpower=round(((usr.strength * usr.melee)/75) + (usr.powerlevel / 75))
						var/defensepower=round(((M.defence * M.durability)/100) + (M.powerlevel / 100))
						var/A=round(attackpower-defensepower)
						if(!M)return
						if(A>0)
							M.powerlevel-=A
						view() << "<font color=red>[usr] punches [M] in the face!</font>"
						M.KO()
						sleep(5)
						flick("IT",usr)
						usr.loc=locate(M.x-1,M.y,M.z)
						usr.dir=EAST
						if(!M)return
						if(A>0)
							M.powerlevel-=A
						view() << "<font color=red>[usr] punches [M] in the back!</font>"
						M.KO()
						sleep(5)
						usr.doing=0
						usr.doing=0
						if(istype(M,/mob/PC))
							if(M.dead)
								M.frozen=0
								usr.doing=0
								M.doing=0
								usr.doing=0
								return 0
							M.frozen=0
							M.doing=0

		GodlyBlast
			verb
				Godly_Blast()
				//Godly_Blast(mob/M in oview(10))
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.1)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					//usr.tech_cooldown=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					view(6) << "<font color = white>[usr]: TAKE THIS, it's TOO late!"
					sleep(10)
					view(6) << "<font color = white>[usr]: GODLY..."
					sleep(15)
					view(6) << "<font color = white>[usr]: ...BLAST! AHAAA!"

					usr.frozen=0
					usr.doing=0

				//	var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					////usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GodlyBlast/M=new/obj/blasts/GodlyBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*
Crimzon update 2.6
removed grand smasher as it was bugging herans

		GrandSmasher
			verb
				GrandSmasher()
					var/cost = 50000000+(15000000*usr.kiuse)
					set category = "Techniques"
					set name = "Grand Smasher"
					set src in usr.contents
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<10000)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					//usr.tech_cooldown=1
					src.setpower = round(rand(2000000000,2500000000)+(usr.ki_power*500000000)+(usr.ki/50))
					usr.doing=1
					usr.frozen=1
			//		usr.using=1
					usr.ki_use_exp += 5 + round(usr.level/300)
					usr.Ki_Use_Level()
					////usr.ki -= cost
					usr.staminaleft += 1250
					usr.overlays+='Charge Blue.dmi'
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					view(8)<<"\white [usr]: GRAND..."
					sleep(10)
					view(8)<<"\white [usr]: SMASHER..."
					sleep(12)
					view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/200)
						usr.Ki_Cast_Level()
						usr.frozen=1
						spawn(10)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						spawn(50)
						//	usr.us
						var/obj/Tech/BeamH/BangC/C=new
						var/obj/Tech/BeamH/BangTL/TL=new
						var/obj/Tech/BeamH/BangT/T=new
						var/obj/Tech/BeamH/BangTR/TR=new
						var/obj/Tech/BeamH/BangL/L=new
						var/obj/Tech/BeamH/BangR/R=new
						var/obj/Tech/BeamH/BangBL/BL=new
						var/obj/Tech/BeamH/BangB/B=new
						var/obj/Tech/BeamH/BangBR/BR=new
						C.icon_state="bs c"
						TL.icon_state="bs tl"
						T.icon_state="bs t"
						TR.icon_state="bs tr"
						L.icon_state="bs l"
						R.icon_state="bs r"
						BL.icon_state="bs bl"
						B.icon_state="bs b"
						BR.icon_state="bs br"
						C.name="Grand Smasher"
						TL.name="Grand Smasher"
						T.name="Grand Smasher"
						TR.name="Grand Smasher"
						L.name="Grand Smasher"
						R.name="Grand Smasher"
						BL.name="Grand Smasher"
						B.name="Grand Smasher"
						BR.name="Grand Smasher"
						C.owner=usr
						C.loc=usr.loc
						TL.owner=usr
						TL.loc=usr.loc
						T.owner=usr
						T.loc=usr.loc
						TR.owner=usr
						TR.loc=usr.loc
						L.owner=usr
						L.loc=usr.loc
						R.owner=usr
						R.loc=usr.loc
						BL.owner=usr
						BL.loc=usr.loc
						B.owner=usr
						B.loc=usr.loc
						BR.owner=usr
						BR.loc=usr.loc
						C.power=src.setpower
						TL.power=src.setpower
						T.power=src.setpower
						TR.power=src.setpower
						L.power=src.setpower
						R.power=src.setpower
						BL.power=src.setpower
						B.power=src.setpower
						BR.power=src.setpower
						spawn(0)C.UpdateBombTrails()
					else
						return
*/
		NovaBlast
			verb
				HeatNovaBlast()
				//HeatNovaBlast(mob/M in oview(12))
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Nova Heat Blast"
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.09)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					//usr.tech_cooldown=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					var/randPL = round(usr.powerlevel*rand(0.05,0.15))
					var/randKI = round(usr.ki*0.1)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					view(6) << "<font color = white>[usr]: Heating..."
					sleep(5)
					view(6) << "<font color = white>[usr]: ...NOVA Wave!"

					usr.frozen=0
					usr.doing=0

					//var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/NovaBlast/M=new/obj/blasts/NovaBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		OmegaBlast
			verb
				Omega_Blast()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.13)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1

					view(6) << "<font color = white>[usr]:</font> OMEGA..."
					sleep(15)
					view(6) << "<font color = white>[usr]:</font> BLAST..."
					sleep(15)
					view(6) << "<font color = white>[usr]:</font> HAAAAAAAAA..."
					spawn(1)
						usr.frozen=0
						usr.doing=0


					//var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/OmegaBlast/M=new/obj/blasts/OmegaBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		PhantomAttack
			verb
				Phantom_Burning_Attack()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Phantom Burning Blast"
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.08)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					//usr.tech_cooldown=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//src.setpower = round(rand(100000000,150000000)+(usr.ki_power*50000000)+(usr.ki/200))
					usr.doing=1
					usr.frozen=1

					view(6)<<"\white[usr]: Phantom Burning Attack!!"
					spawn(1)
						usr.frozen=0
						usr.doing=0

				//	var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T



					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/PhantomAttack/M=new/obj/blasts/PhantomAttack(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		BurningStar
			verb
				Burning_Star()
				//Burning_Star(mob/M in oview(12))
				//	var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					src.setpower = round(rand(100000000,150000000)+(usr.ki_power*50000000)+(usr.ki/200))
					usr.doing=1
					usr.frozen=1
					var/randPL = round(usr.powerlevel*rand(0.05,0.10))
					var/randKI = round(usr.ki*0.15)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					view(6) << "<font color = white>[usr]: ...Burning"
					sleep(10)
					view(6) << "<font color = white>[usr]: ...STAR...BAM!!"
					sleep(15)
					view(6) << "<font color = white>[usr]: HAAAAH!!!!"
					spawn(1)
					usr.frozen=0
					usr.doing=0


//					var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/BurningStar/M=new/obj/blasts/BurningStar(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		SoulPunisher
			verb
				Soul_Punisher()
				//	var/cost = 50000000+(15000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1

					//usr.tech_cooldown=1

					view(6)<<"\white[usr]: SOUL..."
					sleep(12)
					view(6)<<"\white[usr]: ...PUNISHER HAAAAH!"
					spawn(1)
						usr.frozen=0
						usr.doing=0
//					var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/300)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 45
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SoulPunisher/M=new/obj/blasts/SoulPunisher(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		StarBang
			verb
				Star_Bang()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.06)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0


					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Star Bang!"

					usr.frozen=0
					usr.doing=0

				//	var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 10
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/StarBang/M=new/obj/blasts/StarBang(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		WaterJet
			verb
				Water_Jet()
				//Water_Jet(mob/M in oview(10))
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Water Jet Blast"
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.09)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					view(6) << "<font color = white>[usr]: WATER JET..."
					sleep(10)
					view(6) << "<font color = white>[usr]: BLAST!!!"

					usr.frozen=0
					usr.doing=0


				//	var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 15
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/WaterJet/M=new/obj/blasts/WaterJet(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

		ZapCannon
			verb
				Zap_Cannon()
				//	var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Zapping..."
					sleep(12)
					view(6)<<"\white[usr]: ...CANNON! "
					spawn(1)
						usr.frozen=0
						usr.doing=0


					var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 8


					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/400)
						usr.Ki_Cast_Level()
						if(usr.gene == "Legendary")
							A.TechAttackStraight(usr,"Zap Cannon",src.setpower,'Zap Cannon.dmi',"",0)
						else
							A.TechAttackStraight(usr,"Zap Cannon",src.setpower,'Zap Cannon.dmi',"",0)
					else
						return

		GravityField
			verb
				Gravity_Field()
					set category = "Techniques"
					set src in usr.contents
					if(usr.gravityfieldspam)
						usr<<"You must cooldown."
						return
					if(usr.gravityfieldon)
						usr.gravityfieldon=0
						usr.GravityFieldCooldown()
						view(12)<<"\blue [usr] destroyed his Gravity Field."
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					for(var/mob/PC/M in oview(18))
						if(M.race=="Kai"&&M.gravityfieldon)
							usr << "Another Kai is using Gravity Field near you."
							return
					usr.doing=1
					usr.frozen=1
					usr.gravityfieldspam=1
					usr.icon_state="enrage"
					view(12)<<"\blue [usr] starts charging up a Gravity Field."
					spawn(50)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
						if(usr.ki<1000000)
							usr<<"You don't have enough ki!"
							return
						else
							usr.gravityfieldon=1
							view(12)<<"\blue A Gravity Field is created all around [usr]."
							spawn(1)usr.GravityFieldBonus()
					spawn(600)
						usr.gravityfieldspam=0
		Sacrifice
			verb
				Sacrifice()
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in player)
						if(M.dead)
							Rev.Add(M)
					Rev.Remove(usr)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to sacrifice yourself for?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					if(!R.dead)
						usr<<"[R] isn't dead."
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(!R.dead)
								usr<<"[R] isn't dead."
							if(usr.ki<5000000)
								usr<<"You don't have enough ki!"
								return
							else
								usr.ki-=5000000
								R.powerlevel = R.powerlevel_max
								R.overlays -= 'Halo.dmi'
								R.overlays -= 'Halo.dmi'
								R.overlays -= 'Halo.dmi'
								R.dead=0
								R<<"\blue [usr] sacrificed his live for you!"
								usr.powerlevel=0
								usr.DeathSacrifice()
		BuffPowerlevel
			verb
				BuffPowerlevel()
					set category = "Techniques"
					set name = "Buff Powerlevel"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay1)
						usr<<"You must wait [usr.buffdelay1] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
				//	if(usr.kaioken)
				//		usr << "You cannot cast buffs while in kaioken!"
				//		return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff1)
								usr<<"[R]'s Powerlevel is already buffed."
								return
							if(R.manipulated)
								view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
								return
							if(usr.ki<1000000)
								usr<<"You don't have enough ki!"
								return
							else
								var/buff
								if(usr.ki_max > usr.strength_max)
									buff = usr.ki_max*0.25
								else
									buff = usr.strength_max*0.25
								buff = round(buff)
							/*
								if(buff>R.powerlevel)
									buff=R.powerlevel
								for(var/mob/M in player)
									if(M.party_name==R.party_name)

										M<<"\blue [usr] buffed your <font color=silver>Powerlevel by [applycommas(buff)] (120 minutes remain)</font>!"
										usr<<"\blue You buffed [M]'s <font color=silver>Powerlevel by [applycommas(buff)] (120 minutes remain)</font>!"
										M.powerlevel+=buff
										M.buff1=1
										spawn(1)M.BuffDown("PL")

								usr.buffdelay1=60
								usr.BuffCooldown1()
								*/



								if(buff>R.powerlevel_max)
									buff=R.powerlevel_max
								R<<"\blue [usr] buffed your <font color=silver>Powerlevel by [applycommas(buff)] (120 minutes remain)</font>!"
								usr<<"\blue You buffed [R]'s <font color=silver>Powerlevel by [applycommas(buff)] (120 minutes remain)</font>!"
								R.powerlevel+=buff
								R.prPL = buff
								R.buff1=1
								spawn(1)R.BuffDown("PL")
								usr.buffdelay1=60
								usr.BuffCooldown1()
								if(usr != R)
									var/amount = usr.tnl * 15
									usr << "You have gained 15 levels for buffing [R]!"
									usr.exp += amount

		BuffKi
			verb
				BuffKi()
					set category = "Techniques"
					set name = "Buff Ki"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay2)
						usr<<"You must wait [usr.buffdelay2] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
			//		if(usr.kaioken)
			//			usr << "You cannot cast buffs while in kaioken!"
			//			return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff2)
								usr<<"[R]'s Ki is already buffed."
								return
							if(R.manipulated)
								view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
								return
							if(usr.ki<1000000)
								usr<<"You don't have enough ki!"
								return
							else

								var/buff=usr.ki_max*0.25
								buff = round(buff)
								if(buff>R.ki_max)
									buff=R.ki_max
								R.prKI = buff
								R<<"\blue [usr] buffed your <font color=silver>Ki (by [applycommas(buff)] 120 minutes remain)</font>!"
								usr<<"\blue You buffed [R]'s <font color=silver>Ki by [applycommas(buff)] (120 minutes remain)</font>!"
								R.ki+=buff
							//	if(buff>R.kidefense)
							//		buff = R.kidefense
							//	R.prKIDEF = buff
							//	R.kidefense+=buff
								R.buff2=1
								R<<"\blue [usr] buffed your <font color=silver>Ki Defense (by [applycommas(buff)] 120 minutes remain)</font>!"
								usr<<"\blue You buffed [R]'s <font color=silver>Ki Defense by [applycommas(buff)] (120 minutes remain)</font>!"
								spawn(1)R.BuffDown("KI")
								usr.buffdelay2=60
								usr.BuffCooldown2()
								if(usr != R)
									var/amount = usr.tnl * 15
									usr << "You have gained 15 levels for buffing [R]!"
									usr.exp += amount
		BuffStrength
			verb
				BuffStrength()
					set category = "Techniques"
					set name = "Buff Strength"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay3)
						usr<<"You must wait [usr.buffdelay3] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
				//	if(usr.kaioken)
				//		usr << "You cannot cast buffs while in kaioken!"
				//		return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff3)
								usr<<"[R]'s Strength is already buffed."
								return
							if(R.manipulated)
								view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
								return
							if(usr.ki<1000000)
								usr<<"You don't have enough ki!"
								return
							else


								var/buff=usr.ki_max*0.25
								buff = round(buff)
								if(buff>R.strength_max)
									buff=R.strength_max
								R<<"\blue [usr] buffed your <font color=silver>Strength by [applycommas(buff)] (120 minutes remain)</font>!"
								usr<<"\blue You buffed [R]'s <font color=silver>Strength by [applycommas(buff)] (120 minutes remain)</font>!"
								R.strength+=buff
								R.prSTR = buff
								R.buff3=1
								spawn(1)R.BuffDown("STR")
								usr.buffdelay3=60
								usr.BuffCooldown3()
								if(usr != R)
									var/amount = usr.tnl * 15
									usr << "You have gained 15 levels for buffing [R]!"
									usr.exp += amount
		BuffDefense
			verb
				BuffDefense()
					set category = "Techniques"
					set name = "Buff Defense"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay4)
						usr<<"You must wait [usr.buffdelay4] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
				//	if(usr.kaioken)
				//		usr << "You cannot cast buffs while in kaioken!"
				//		return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff4)
								usr<<"[R]'s Defense is already buffed."
								return
							if(R.manipulated)
								view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
								return
							if(usr.ki<1000000)
								usr<<"You don't have enough ki!"
								return
							else

								var/buff=usr.ki_max*0.25
								buff = round(buff)
								if(buff>R.defence_max)
									buff=R.defence_max
								R.buff4=1
								R.prDEF = buff
								R<<"\blue [usr] buffed your <font color=silver>Defense by [applycommas(buff)] (120 minutes remain)</font>!"
								usr<<"\blue You buffed [R]'s <font color=silver>Defense by [applycommas(buff)] (120 minutes remain)</font>!"
								R.defence+=buff
								spawn(1)R.BuffDown("DEF")
								usr.buffdelay4=60
								usr.BuffCooldown4()
								if(usr != R)
									var/amount = usr.tnl * 15
									usr << "You have gained 15 levels for buffing [R]!"
									usr.exp += amount
		BuffStamina
			verb
				BuffStamina()
					set category = "Techniques"
					set name = "Buff Stamina"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay5)
						usr<<"You must wait [usr.buffdelay5] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(R.staminabuff)
								usr<<"[R]'s Stamina is already buffed."
								return
							if(R.manipulated)
								view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
								return
							if(!R)return
							if(usr.ki<5000000)
								usr<<"You don't have enough ki!"
								return
							else
								R.staminabuff=1
								R<<"\blue [usr] buffed your <font color=#0066FF>Stamina</font>! (120 minutes remain)"
								usr<<"\blue you buffed [R] <font color=#0066FF>Stamina</font>! (120 minutes remain)"
								spawn(1)R.BuffDown("FAT")
								usr.buffdelay5=60
								usr.BuffCooldown5()
		AdvancedTraining
			verb
				AdvancedTraining()
					set category = "Techniques"
					set name = "Advanced Training"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.buffdelay6)
						usr<<"You must wait [usr.buffdelay6] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<1000000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1

					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
						//	if(R.manipulated)
						//		view() << "[R]'s stats cannot be buffed while under the majin wizards influence"
						//		return
							if(R.expbuff)
								usr<<"[R]'s Exp is already buffed."
								return
							if(usr.ki<1000000)
								usr<<"You don't have enough ki!"
								return
							else

								R<<"\blue [usr] buffed your <font color=#FFCC00>Exp</font>! (120 minutes remain)"
								usr<<"\blue you buffed [R] <font color=#FFCC00>Exp</font>! (120 minutes remain)"
								R.expbuff=1
								spawn(1)R.BuffDown("EXP")
								usr.buffdelay6=60
								usr.BuffCooldown6()
								if(usr != R)
									var/amount = usr.tnl * 50
									usr << "You have gained 50 levels for buffing [R]!"
									usr.exp += amount

		MajinSorcery
			verb
				MajinSorcery()
					set category = "Techniques"
					set name = "Majin Sorcery"
					set src in usr.contents
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.manipulationdelay)
						usr<<"You must wait [usr.manipulationdelay] minutes."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
				//	if(usr.kaioken)
				//		usr << "You cannot cast buffs while in kaioken!"
				//		return
					if(usr.ki<100000)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't use any techniques right now."
						return
					if(!usr.pk)
						usr << "Reach level 2500 to be able to use battle techniques."
						return
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.icon_state="spirit bomb"
					var/tmp/list/Rev=new/list()
					for(var/mob/PC/M in view(12))
						Rev.Add(M)
					Rev.Add("Cancel")
					var/tmp/mob/R=input("Who do you wish to buff?")as null|anything in Rev
					if(R=="Cancel")
						usr.doing=0
						usr.frozen=0
						usr.tech_cooldown=0
						usr.icon_state=""
						return
					else
						spawn(45)
							usr.doing=0
							usr.frozen=0
							usr.icon_state=""
							usr.tech_cooldown=0
							if(!R)return
							if(R.buff1||R.buff2||R.buff3||R.buff4||R.staminabuff/*||R.expbuff*/)
								usr<<"[R]'s cannot be buffed while they are buffed by a kai!"
								return
							if(usr.ki<100000)
								usr<<"You don't have enough ki!"
								return
							else

								var/buff
								if(R.karma == "Evil")
									buff=usr.powerlevel_max*0.35
								else
									buff=usr.powerlevel_max*0.20
								buff = round(buff)
								var/buffpl=buff
								var/buffki=buff
								var/buffdef=buff
								var/buffstr=buff
							//	var/buffkidef=buff
								if(buffpl>R.powerlevel_max)
									buffpl=R.powerlevel_max
								if(buffki>R.ki_max)
									buffki=R.ki_max
							//	if(buffkidef>R.kidefense)
							//		buffkidef=R.kidefense
								if(buffstr>R.strength_max)
									buffstr=R.strength_max
								if(buffdef>R.defence_max)
									buffdef=R.defence_max

								R.powerlevel+=buffpl
								view() << "<font color = silver><b>[usr] cast their majin sorcery on [R] increasing their power for 1 hour"

								view() << "<font color = silver>[usr] buffed [R]'s Powerlevel by <b>[applycommas(buffpl)]</b>"
								view() << "<font color = silver>[usr] buffed [R]'s Ki by <b>[applycommas(buffki)]</b>"
								view() << "<font color = silver>[usr] buffed [R]'s Strength by <b>[applycommas(buffstr)]</b>"
								//view() << "<font color = silver>[usr] buffed [R]'s Ki Defense by <b>[applycommas(buffkidef)]</b>"
								view() << "<font color = silver>[usr] buffed [R]'s Defense by <b>[applycommas(buffdef)]</b>"

								R.ki+=buffki
								R.strength+=buffstr
								R.defence+=buffdef
//								R.kidefense+=buffkidef
								R.manipulated=1

								R.prPL=buffpl
								R.prKI=buffki
								//R.prKIDEF=buffkidef
								R.prSTR=buffstr
								R.prDEF=buffdef
								R.manipulated=1
								spawn(-1)R.BuffDownMajin()
								usr.manipulationdelay=60
								spawn(-1)usr.Manipulation_Cooldown()
								if(usr != R)
									var/amount = usr.tnl * 50
									usr << "You have gained 50 levels for buffing [R]!"
									usr.exp += amount

								//usr.BuffCooldown1()