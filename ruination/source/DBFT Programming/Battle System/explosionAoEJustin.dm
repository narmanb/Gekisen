proc
	Explosion(range as num,turf/startloc as turf,obj/blasts/B as obj,dmg as num,mob/nohit as mob)

		if(!range || !startloc) return 0
		//if(B==null)
		//	B:Shooter = nohit
		for(var/atom/A in range(range,startloc))
			if(isarea(A) || istype(A,/obj/blasts/trails)) continue
		//	if(isarea(A))
		//		A.overlays += 'explosion.dmi'
		//		spawn(4) A.overlays -= 'explosion.dmi'
		//		continue
			if(isturf(A))
				A.overlays += 'explosion.dmi'
				spawn(4) A.overlays -= 'explosion.dmi'
				//flick('explosion.dmi',A)
				continue

			if(istype(A,/obj/blasts/))
				if(A == B) continue
				if(A:Shooter==nohit) continue
				if(A:Damage > dmg) continue
				var/txt
				if(B) txt = "[B:Shooter]'s [B] explosion"
				else txt = "an explosion"
				view() << output("<font color=red><font size = 1>[A:Shooter]'s [A:name] is destroyed by [txt]!","default.output2")
				del A
				continue
			if(isobj(A))
//				flick('explosion.dmi')
				continue
			if(ismob(A))
				if(!B || A == nohit) continue
				//if(B:Shooter == A) continue
				if(dmg <= 0)
					dmg = 1
				if(B:Shooter == A)
					var/hitself = dmg/10
					A << output("<b><font size = 1><font color = #007EFF>You hit yourself for [applycommas(hitself)] splash damage!","default.output2")
					A:powerlevel -= hitself
					if(A:powerlevel <= 0)
						A:DeathCheck(A)
					continue

					//dmg = dmg/10
				dmg = round(dmg,1)
				if(A:energy_barrier)
					A:energy_barrier_health -= dmg/10
					view(A) << "<font color = green><b>[A]'s energy barrier took [applycommas(dmg/10)] damage from splash damage!"
					if(A:energy_barrier_health <= 0)
						view(A) << "<font color = green><b>[A]'s energy barrier was shattered by [B:Shooter]'s splash damage!"
						A:energy_barrier=0
						dmg = round(dmg/2)
					else
						dmg = 1


				if(A:iting && A:pvpflagged)
					A:ITstop = 1
					dmg *= 2
					B:Shooter << output("<font size=1><b><font color=yellow>[A]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")
				if(A:race == "Exploding")
					dmg = rand(1,2)
				var/kidef = A:defence*0.4
				var	kidefcalc = round(kidef*(A:ki_res/100))
				dmg -= kidefcalc
				if(dmg < 1)
					dmg = 1
				if(B:Shooter.spar && A:spar)
					var/mindmg = round(A:powerlevel_max*0.01)
					dmg = mindmg
				A:powerlevel -= dmg


		//		if(A:buku)
		//			view(A) << "<b><font color=red>[B:Shooter]'s attack forces [A] to land!</font>"
		//			A:buku = 0
		//			A:density = 1
		//			A:icon_state = ""
		//			A:doing = 0
						//A:buku_lock = 1
						//spawn(100) A:buku_lock = 0
				A << output("<b><font size = 1><font color = #007EFF>[B:Shooter] hit you for [applycommas(dmg)] splash damage!","default.output2")
				if(B:Shooter.splashdmgtext)
					B:Shooter << output("<b><font size = 1><font color = #007EFF>You hit [A] for [applycommas(dmg)] splash damage!","default.output2")
				 //DeathChk
				//continue
				if(istype(A,/mob/PC/))
					spawn(-1) A:PVPflagged(4)
					spawn(-1) B:Shooter.PVPflagged(6)
					if(A:buku)
						view() << "<b><font color=red>[nohit]'s attack forces [A] to land!</font>"
						A:buku = 0
						A:density = 1
						A:icon_state = ""
						A:doing = 0
						if(!A:timeskipeffect)
							A:move_delay = 0.6
					if(A:hudenabled)
						spawn() A:updateHealth()
					if(A:powerlevel <= 0)
						if(B:Shooter.lethalon)
							A:DeathCheck(B:Shooter)
						else
							spawn(-1) B:Shooter.KO(A)
					//	A:DeathCheck(B:Shooter)

				if(A:powerlevel<=0 && istype(A,/mob/Monster/))

					//A:DeathCheck(B:Shooter)
					if(B:Shooter.lethalon)
						A:DeathCheck(B:Shooter)
					else
						spawn(-1) B:Shooter.KO(A)

				if(istype(A,/mob/SPECIAL/))
					if(B:Shooter.lethalon)
						A:DeathCheck(B:Shooter)
					else
						spawn(-1) B:Shooter.KO(A)
					//spawn(-1) A:DeathCheck(B:Shooter)

				continue
				// just disabled this continue



			return
//		var/sb = range(1)

		return



	ExplosionSEW(range as num,turf/startloc as turf,dmg as num,mob/nohit as mob)
		if(!range || !startloc) return 0
		for(var/atom/A in range(range,startloc))
			if(isarea(A) || istype(A,/obj/blasts/trails)) continue
			//if(isarea(A))
				//A.overlays += 'explosion.dmi'
				//spawn(5) A.overlays -= 'explosion.dmi'
				//flick('explosion.dmi',A)
			if(isturf(A))
				A.overlays += 'explosion.dmi'
				spawn(5) A.overlays -= 'explosion.dmi'
				//flick('explosion.dmi',A)
				continue
			if(isobj(A))
				continue

			if(ismob(A))
				if(A == nohit) continue
				if(istype(A,/mob/PC))
					dmg = dmg/50
				var/kidef = A:defence*0.4
				var/kidefcalc = round(kidef*(A:ki_res/100))
				dmg=(dmg-(kidefcalc/400))
				dmg = round(dmg,1)
				if(A:energy_barrier)
					A:energy_barrier_health -= dmg/10
					view(A) << "<font color = green><b>[A]'s energy barrier took [applycommas(dmg/10)] damage from splash damage!"
					if(A:energy_barrier_health <= 0)
						view(A) << "<font color = green><b>[A]'s energy barrier was shattered by [nohit]'s splash damage!"
						A:energy_barrier=0
						dmg = round(dmg/2)
					else
						dmg = 1
				if(dmg <= 0)
					dmg = 1

				if(A:iting && A:pvpflagged)
					A:ITstop = 1
					dmg *= 2
					nohit << output("<font size=1><b><font color=yellow>[A]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")
				if(nohit.spar && A:spar)
					var/mindmg = round(A:powerlevel_max*0.01)
					dmg = mindmg
				A:powerlevel -= dmg
				if(A:hudenabled)
					spawn() A:updateHealth()

			//	A << output("<b><font size = 1><font color = #007EFF>[nohit] hit you for [applycommas(dmg)] splash damage!","default.output2")
			//	nohit << output("<b><font size = 1><font color = #007EFF>You hit [A] for [applycommas(dmg)] splash damage!","default.output2")





				if(nohit.splashdmgtext)
					nohit<<output("<font color=yellow>Your explosion damages [A] for [applycommas(dmg)] damage!","default.output2")
				if(A:client)
					A << output("<font color=red>[nohit]'s explosion damages you with [applycommas(dmg)] damage!","default.output2")
				if(istype(A,/mob/PC/))
					spawn(-1) A:PVPflagged(4)
					spawn(-1) nohit:PVPflagged(6)
					if(A:buku)
						view() << "<b><font color=red>[nohit]'s attack forces [A] to land!</font>"
						A:buku = 0
						A:density = 1
						A:icon_state = ""
						A:doing = 0
						if(!A:timeskipeffect)
							A:move_delay = 0.6
					if(A:powerlevel <= 0)
						if(A:lethalon)
							spawn(-1) A:DeathCheck(nohit)
							//src.Shooter.AutoFinish(Target)
						else

							spawn(-1) A:KO(nohit)
						//A:DeathCheck(nohit)

				if(A:powerlevel<=0 && istype(A,/mob/Monster/))

					A:DeathCheck(nohit)

				if(istype(A,/mob/SPECIAL/))

					A:DeathCheck(nohit)
				continue
				//continue
	//		if(A:powerlevel<=0 && istype(A,/mob/monsters/))
	//			del A
			return
		return


	ExplosionSuicideMobs(range as num,turf/startloc as turf,dmg as num,mob/nohit as mob)
		if(!range || !startloc) return 0

		for(var/atom/A in range(range,startloc))

			if(isarea(A) || istype(A,/obj/blasts/trails)) continue
			//if(isarea(A))
				//A.overlays += 'explosion.dmi'
				//spawn(5) A.overlays -= 'explosion.dmi'
				//flick('explosion.dmi',A)
			if(isturf(A))
				A.overlays += 'explosion.dmi'
				spawn(5) A.overlays -= 'explosion.dmi'
				//flick('explosion.dmi',A)
				continue
			if(isobj(A))
				continue
			if(ismob(A))
			//	if(A == nohit) continue
			//	if(istype(A,/mob/PC))
			//		dmg = dmg/50
				dmg=A:powerlevel_max/2
				dmg = round(dmg,1)
				/*
				if(A:energy_barrier)
					A:energy_barrier_health -= dmg/10
					view(A) << "<font color = green><b>[A]'s energy barrier took [applycommas(dmg/10)] damage from splash damage!"
					if(A:energy_barrier_health <= 0)
						view(A) << "<font color = green><b>[A]'s energy barrier was shattered by [nohit]'s splash damage!"
						A:energy_barrier=0
						dmg = round(dmg/2)
					else
						dmg = 1
				if(dmg <= 0)
					dmg = 1
					*/

			//	if(A:iting && A:pvpflagged)
			//		A:ITstop = 1
			//		dmg *= 2
			//		nohit << output("<font size=1><b><font color=yellow>[A]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")
				A:powerlevel -= dmg
				if(A:client)
					A << output("<font color=red>[nohit]'s explosion damages you with [applycommas(dmg)] damage!","default.output2")
				if(istype(A,/mob/PC/))
					if(A:buku)
						view() << "<b><font color=red>[nohit]'s attack forces [A] to land!</font>"
						A:buku = 0
						A:density = 1
						A:icon_state = ""
						A:doing = 0
						if(!A:timeskipeffect)
							A:move_delay = 0.6
					if(A:powerlevel <= 0)
						spawn() A:DeathCheck(nohit)
					alert("You've been hit")
				continue

			return
		del nohit
		return