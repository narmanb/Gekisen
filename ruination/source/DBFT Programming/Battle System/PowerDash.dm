mob/var/tmp/dashing=0
obj/afterImage
//	New()
//		spawn() usr.disappearimage()

obj/proc
	disappearimage()
		var/timeH=0
		while(src)
			timeH++
			if(timeH > 1)
				del(src)
				break
			if(src)	sleep(2)
obj/Technique/PowerDash
	verb
		Power_Dash()
			set category = "Combat"
//			if(usr.ki.val>=usr.Ki.max*0.1)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Power Dash")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.dashing)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are busy"
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.dead)
				usr<<"You are dead."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "You are in a Safe Zone!"
					return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(usr.icon_state == "flight"||usr.buku == 1)
				usr<<"You can't use this technique while flying"
				return
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "<font color=#ff0000>You are too tired to fight!</font>"
				return


			usr.PowDash()
			/*
			if(!usr.dashing)
				usr.dashing=1
				world << "2"
				var/turf/t
				switch(usr.dir)
					if(SOUTH)
						t=locate(usr.x,usr.y-10,usr.z)
					if(NORTH)
						t=locate(usr.x,usr.y+10,usr.z)
					if(WEST)
						t=locate(usr.x-10,usr.y,usr.z)
					if(EAST)
						t=locate(usr.x+10,usr.y,usr.z)
					//if(NORTHWEST)
					//	usr.loc=locate(usr.x-8,usr.y+8,usr.z)
					//if(SOUTHWEST)

					//	usr.loc=locate(usr.x-8,usr.y-8,usr.z)
					//if(NORTHEAST)

					//	usr.loc=locate(usr.x+8,usr.y+8,usr.z)
					//if(SOUTHEAST)
					//	usr.loc=locate(usr.x+8,usr.y-8,usr.z)

			//	var/turf/t=locate(/mob) in get_step(src,usr.dir)
				world << "3"
				usr.overlays += 'sonicspinauradash.dmi'
				sleep(1)
				world << "4"
				if(t)
					world << "5"
					usr.attackCD = 1
					spawn(18) usr.attackCD = 0
					if(t.density==0&&!locate(/mob) in t)


						flick("IT",usr)
						usr.move_delay=0
						var/mob/M=locate(/mob) in get_step(usr,usr.dir)

					//	if(M in get_step(src,usr.dir))
					//		if(!M)
							//	return
						//for(var/mob/N in get_step(src,usr.dir))

						usr << output("You get ready to power dash..","default.output2")
						sleep(5)
						var/stopdash=0
						while(stopdash<16)
						//	usr << "M: [M] src: [src] stopdash: [0]"
							for(var/mob/N in get_step(usr,usr.dir))
								if(N)
									stopdash=15
									M = N
									view(usr)<<"[usr] slammed into [M]!"
									break
							//var/obj/afterImage = new /obj()
							var/obj/afterImage/afterImage=new
							afterImage.layer = MOB_LAYER + 5

							afterImage.icon=usr.icon
							afterImage.icon_state=usr.icon_state
							afterImage.overlays=usr.overlays
							afterImage.underlays = usr.underlays
							afterImage.dir=usr.dir
							afterImage.loc = usr.loc
							spawn() afterImage.disappearimage()
							//flick("tele",C)
							//var/retaindir
							//retaindir = usr.dir
							//usr.Move(src)
							//C.dir = retaindir
							step_towards(usr,t,usr.move_delay)
							//walk_towards(src,t,usr.move_delay,usr.move_delay)

						//	stopdash+=1
						//	if(stopdash>=16)
							//	src <<"STOPDASH"
						//	sleep(1)
						if(M in get_step(usr,usr.dir))
						//	src << "YOU HIT [M]!!"
							if(istype(M,/mob/Monster) || istype(M,/mob/PC))
								var/attackpower = round((usr.strength * usr.melee / 100) + (usr.powerlevel / 1000))
								var/defensepower=round((M.defence * M.durability)/150)
								var/damage=round((attackpower-defensepower))
								damage= damage+(usr.melee*(usr.level*50))
								M << output("<font color = red><b> You are hit for <font color = yellow>[applycommas(damage)] damage<font color = red> by [usr]'s power dash!","default.output2")
								usr << output("<font color = red><b> You  hit [M] for <font color = yellow>[applycommas(damage)] damage<font color = red> with your power dash!","default.output2")
								if(usr.lethalon)
									usr.AutoFinish(M)
								else
									M.KO()

						usr.move_delay=1
				usr.overlays -= 'sonicspinauradash.dmi'
				usr.dashing=0
				*/
mob/var/tmp/isdashing=0

mob
	proc
		PowDash()

			if(!src.dashing)
				src.dashing=1
				src.isdashing=1
				var/turf/t
				var/mob/y
				switch(src.dir)
					if(SOUTH)
						t=locate(src.x,src.y-16,src.z)
					if(NORTH)
						t=locate(src.x,src.y+16,src.z)
					if(WEST)
						t=locate(src.x-16,src.y,src.z)
					if(EAST)
						t=locate(src.x+16,src.y,src.z)
				switch(y)
					if(SOUTH)
						y=locate(src.x,src.y-16,src.z)
					if(NORTH)
						y=locate(src.x,src.y+16,src.z)
					if(WEST)
						y=locate(src.x-16,src.y,src.z)
					if(EAST)
						y=locate(src.x+16,src.y,src.z)
					//if(NORTHWEST)
					//	src.loc=locate(src.x-8,src.y+8,src.z)
					//if(SOUTHWEST)

					//	src.loc=locate(src.x-8,src.y-8,src.z)
					//if(NORTHEAST)

					//	src.loc=locate(src.x+8,src.y+8,src.z)
					//if(SOUTHEAST)
					//	src.loc=locate(src.x+8,src.y-8,src.z)

			//	var/turf/t=locate(/mob) in get_step(src,src.dir)

				src.overlays += 'sonicspinauradash.dmi'

		//		sleep(1)

				if(t||y)

					src.attackCD = 1
					spawn(18) src.attackCD = 0
				//if(t.density==0&&!locate(/mob) in t)


					flick("IT",src)

					var/mob/M=locate(/mob) in get_step(src,src.dir)

				//	if(M in get_step(src,src.dir))
				//		if(!M)
						//	return
					//for(var/mob/N in get_step(src,src.dir))

					src << output("You get ready to power dash..","default.output2")
					src.staminaleft += 100
					src.move_delay=0
					sleep(3) //this was 5
					src.overlays -= 'sonicspinauradash.dmi'
					var/stopdash=0

					while(stopdash<20)
					//	src << "M: [M] src: [src] stopdash: [0]"
						var/obj/O=locate(/obj) in get_step(src,src.dir)
						for(var/mob/N in get_step(src,src.dir))
							if(N)

								stopdash=30
								M = N
								view(src)<<"[src] slammed into [M]!"
								src.move_delay=0.6
								break
						//sleep(1)

						var/obj/afterImage = new /obj()

						//var/obj/afterImage/afterImage=new
						afterImage.layer = MOB_LAYER + 5

						afterImage.icon=src.icon
						afterImage.icon_state= "IT"//src.icon_state
						afterImage.overlays=src.overlays
						afterImage.underlays = src.underlays
						afterImage.dir=src.dir
						afterImage.loc = src.loc
						spawn() afterImage.disappearimage()

						//flick("tele",C)
						//var/retaindir
						//retaindir = src.dir
						//src.Move(src)
						//C.dir = retaindir
						if(O in get_step(src,src.dir))
							if(istype(O,/obj/blasts))

								O:density = 0
								view(14) << "<font color = yellow><b>[src] dashed right through [O]!"
								var/rng = O:splashrange
								var/locc = src.loc
								var/dmg = O:Damage*0.4
								var/beam = O
								Explosion(rng,locc,beam,dmg,beam)
								for(var/obj/blasts/trails/T in view(8)) del(T)
								del O

						step_towards(src,t,src.move_delay)
						//walk_towards(src,t,src.move_delay,src.move_delay)

						stopdash+=1
					//	if(stopdash>=16)
						//	src <<"STOPDASH"
					//	sleep(1)
				//	if(M in get_step(src,src.dir))
					//	src << "YOU HIT [M]!!"

					if(istype(M,/mob/Monster) || istype(M,/mob/PC))
//THIS DAMAGE IS NOT RIGHT  src.Damage = round((randPL + randKI) * Owner.ki_power/100)
						var/attackpower = src.strength * (src.melee / 100)
						//src << "attackpower: [attackpower]"
						var/defensepower= M.defence * (M.durability/100)
						//src << "defensepower: [defensepower]"
						var/damage=round((attackpower-defensepower))*0.60
						//src << "damage ONE: [damage]"
						if(damage < 1)
							damage = 1
						//src << "damage TWO: [damage]"
						damage= damage+(src.level*15)
						//src << "damage THREE: [damage]

						if(istype(M,/mob/PC))
							spawn(-1) M.PVPflagged(4)
							spawn(-1) src.PVPflagged(6)
							M.rage += round(rand(5,10))
							if(M.rage >= 100)
								M.rage = 100
							if(M.iting && M.pvpflagged)
								M.ITstop = 1
								damage *= 2
								src << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")
						if(src.spar)
							var/mindmg = round(M.powerlevel_max*0.1)
							damage = mindmg

						M.powerlevel-=damage
						if(M.hudenabled)
							spawn() M.updateHealth()

						M << output("<font color = red><b>You are hit for <font color = yellow>[applycommas(damage)] damage<font color = red> by [src]'s power dash!","default.output2")
						src << output("<font color = red><b>You  hit [M] for <font color = yellow>[applycommas(damage)] damage<font color = red> with your power dash!","default.output2")
						M.screen_shake(rand(11,13),rand(6,12))
						src.screen_shake(4,5)
						var/ColorMatrix/c = new("Invert")
						animate(src.client, color = c.matrix, time = 5)
						if(M.client)
							animate(M.client, color = c.matrix, time = 5)
							spawn(5) animate(M.client, color = null, time = 5)
						else
							animate(M, color = c.matrix, time = 5)
							spawn(5) animate(M, color = null, time = 5)

						spawn(5) animate(src.client, color = null, time = 5)
						if(src.lethalon)
							src.AutoFinish(M)
						else
							KO(M)


					src.move_delay=0.6
				//src.overlays -= 'sonicspinauradash.dmi'

				src.isdashing=0
				spawn(70) src.dashing=0