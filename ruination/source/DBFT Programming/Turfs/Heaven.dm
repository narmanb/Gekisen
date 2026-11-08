turf
	Heaven
		icon = 'Heaven Cloud.dmi'
		Heaven_Cloud_001
			icon_state = "clouds"
			density = 0

	Passages
		Heaven
			Cave1_Entrance
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in M.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here."
								return
						M.loc=locate(137,66,8)
			Cave1_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc=locate(289,360,1)
