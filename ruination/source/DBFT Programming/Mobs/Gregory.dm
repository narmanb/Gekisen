mob/var/gregory_hit = 0
mob
	NPC
		Gregory
			name = "Gregory"
			icon = 'NPCs2.dmi'
			icon_state = "Gregory"
			density = 1
			safe = 1
			karma = "Good"
		//	move_pattern = "custom"
			race = "???"
			New()
				..()
				src.CreateName()
				spawn() Runaway()
			proc/Runaway()
				while(src)
					var/Found = FALSE
					for(var/mob/PC/P in oview(8)).
						step_away(src,P)
						//walk_away(src,P)
						//walk_rand(src)
						Found = TRUE
						break
					if(Found != TRUE)
						walk_rand(src,0)
						sleep(9)
					sleep(9)
			verb/Hit()
				set src in oview(10)
				set category = "Combat"

				if(src in get_step(usr,usr.dir))
					if(usr.gregory_hit)
						usr << "You have already hit Gregory!"
						return
					else
						usr << "You hit Gregory!"
						usr.powerlevel_max += 2500
						usr.kk_quest_training ++
						usr.gregory_hit = 1
				else
					return