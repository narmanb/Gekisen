turf
	Passage
		Korins_Tower
			Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(49,188,6)
			Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(303,434,1)

		Gym
			Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.fused)
							return
						M.loc=locate(215,379,8)
						M.it_lock=1
						M.it_blocked=1

			Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						if(M.fused)
							return
						M.loc=locate(148,114,1)
						M.it_lock=0
						M.it_blocked=0

		King_Cold_Spaceship
			Entrance_to_Gym
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.GMLevel>0)
							for(var/obj/O in M.contents)
								if(O.dball)
									M<<"You can't bring the Dragonballs in here."
									return
							if(M.fused)
								return
							M.loc=locate(199,221,7)
							M.it_blocked=1
						else
							M<<"You must be a GM to proceed"
			Exit_to_Spaceship
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.GMLevel>0)
							for(var/obj/O in M.contents)
								if(O.dball)
									M<<"You can't bring the Dragonballs in here."
									return
							if(M.fused)
								return
							M.loc=locate(169,42,7)
							M.it_blocked=1
						else
							M<<"You must be a GM to proceed"


area/SubscriberGym
	Entered(mob/PC/P)
		if(P.Sub)
			for(var/area/SubGym/SG in world)
				P.loc=locate(SG.x,SG.y+1,SG.z)
		else
			alert("Star Club Subscribers only sorry")

area/SubGym
	Entered(mob/PC/P)
		if(P.Sub)
			for(var/area/SubscriberGym/SG in world)
				P.loc=locate(SG.x,SG.y-1,SG.z)
		else
			alert("Star Club Subscribers only sorry")

area/KingColdSpaceship
	Entered(mob/PC/M)
		M.it_blocked=1
	Exited(mob/PC/M)
		M.it_blocked=0