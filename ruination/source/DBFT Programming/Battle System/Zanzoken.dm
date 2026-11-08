mob/var/zanzoken = 0
mob/var/tmp/zanz_lock = 0
mob/var/after_image = 0
obj/Technique/AfterImage
	verb/After_Image()
		set category = "Techniques"
		if(!usr.after_image)
			usr << "You start using your After Image Ability."
			usr.after_image = 1
			usr.zanzoken=0
			return
		if(usr.after_image)
			usr << "You stop using your After Image Ability."
			usr.after_image = 0
			return
obj/Technique/Zanzoken
	verb/Zanzoken()
		set category = "Techniques"
		if(!usr.zanzoken)
			usr << "You start using your Zanzoken Ability."
			usr.zanzoken = 1
			usr.after_image=0
			return

		if(usr.zanzoken)
			usr << "You stop using your Zanzoken Ability."
			usr.zanzoken = 0
			return
obj/After_Image_Mob
	name=""
	icon_state=""
	New()
		..()
		spawn(10)del(src)

client
	DblClick(var/X)

		//usr.DeathCheck()
		if(istype(X,/turf))
			var/turf/O=X
			var/stam_cost = 15
			if(usr.KO)
				return
			if(usr.dualtrain)
				return
			if(usr.binded)
				return
			if(usr.beaming)
				return
			if(usr.gravityfieldon)
				return
			if(usr.GMLocked)
				return
			if(usr.grav)
				return
			if(usr.tourny_watch)
				return
			if(usr.regen_dead)
				return
			if(usr.iting)
				return
			if(usr.jailed)
				return

			if(usr.boxing)
				return
			if(usr.zanz_lock)
				return
			if(usr.jailed)
				usr << "can't do this while jailed"
				return
			if(usr.dead)
				usr << "You can't use this while dead"
			if(usr.zanz_TS)
				if(!usr.zanz_lock)
					usr << "<i>You struggle to move quickly while under the effects of time skip.."
					usr.zanz_lock = 1
					spawn(40) usr.zanz_lock = 0
				else
					usr << "<i>You failed to move to your destination!"
					return

//			if(usr.focus_step)
//				world << "X: [X]   O [O] ox [O.x]"
			/*
				if(!O.x||!O.y||!O.z)
					return
				if(O.ispassage)
					return
				if(istype(O,/turf/Floors/No_Walking))
					return
					*/
//				if(usr.pvpflagged)
//					usr.staminaleft += stam_cost
//				//sleep(2)
//				world << "2"
//				usr.loc=locate(O.x,O.y,O.z)
			if(usr.zanzoken||usr.after_image)
				if(usr.rest||usr.focus_boxing)
					return
				if(usr.tourny1_watch||usr.tourny_watch||usr.gmtvon)
					return
				if(usr.dualtrain)
					return
				if(istype(O,/turf/Floors/No_Zanzo))
					if(!usr.in_arena)
						return
				if(istype(O,/turf/Floors/Void_Zone))
					return
				if(istype(O,/mob))
					return
				if(istype(O,/area))
					return
				if(istype(O,/area/NOFLY))
					return
				if(istype(O,/turf/Floors/No_Walking))
					return
				if(istype(O,/turf/Floors/No_Looking))
					return
				if(istype(O,/turf/SnakeWay/Clouds))
					return
				if(istype(O,/turf/SnakeWay))
					return
				if(istype(O,/turf/Buildings/Wall))
					return
				if(istype(O,/obj/Equipment))
					return
				if(istype(O,/turf/Passages))
					return

				if(istype(O,/obj/After_Image_Mob))
					return
				if(usr.staminaleft>=usr.staminaleft_max)
					usr << "<font color=#ff0000>You are too tired to fight!</font>"
					return
				if(istype(O,/turf))
					if(!O.x||!O.y||!O.z)
						return
					if(O.ispassage)
						return
					if(istype(O,/turf/Floors/No_Walking))
						return
					if(usr.zanzoken)
						//if(usr.frozen)
							//return
						if(usr.ki >= 5000)
							flick("IT",usr)
							if(usr.pvpflagged)
								usr.staminaleft += stam_cost
							sleep(2)
							if(usr.dead)
//								player << "[usr] zanzo glitch"
								AdminMessage("[usr]([usr.key]) zanzo glitch dead: [usr.dead] x y x: [usr.x],[usr.y],[usr.z]")
								return
							usr.loc=locate(O.x,O.y,O.z)
							if(usr.dead)
								//player << "[usr] zanzo glitch"
								AdminMessage("[usr]([usr.key]) zanzo glitch dead: [usr.dead] x y x: [usr.x],[usr.y],[usr.z]")
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
							if(usr.z == 10)
								for(var/mob/Monster/BeerusMobs/M in oview(16))
									if(M.sleeping)
										M.sleeping = 0
										M.AITarget = usr  // added this line
										if(!M)return
										spawn() M.AI_Beerus()

						else
							usr << "You don't have enough Ki!"
							return
					if(usr.after_image)
						if(usr.frozen)
							return
						if(usr.ki >= 100000)
							flick("IT",usr)
							var/obj/After_Image_Mob/C = new
							C.loc = usr.loc
							C.icon = usr.icon
							C.overlays += usr.overlays
							C.underlays += usr.underlays
							C.name = usr.name
							C.dir = usr.dir
							usr.ki -= 10000
							if(usr.pvpflagged)
								usr.staminaleft += stam_cost*2
							if(usr.dead)
								//player << "[usr] zanzo glitch"
								AdminMessage("[usr]([usr.key]) zanzo glitch dead: [usr.dead] x y x: [usr.x],[usr.y],[usr.z]")
								return
							usr.loc=locate(O.x,O.y,O.z)
							if(usr.dead)
								//player << "[usr] zanzo glitch"
								AdminMessage("[usr]([usr.key]) zanzo glitch dead: [usr.dead] x y x: [usr.x],[usr.y],[usr.z]")
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
							if(usr.z == 10)
								for(var/mob/Monster/BeerusMobs/M in oview(16))
									if(M.sleeping)
										M.sleeping = 0
										M.AITarget = usr  // added this line
										if(!M)return
										spawn() M.AI_Beerus()
						else
							usr << "You don't have enough Ki!"
							return
		else
			if(istype(X,/mob))
				if(!istype(X,/mob/NPC))
					usr.chosentarget=X
					usr << "<font color = red><b>[X] selected as target"
					//usr<<"Your are now targeting: <i><font color=white>[X]</i></font>"
			//		usr << "<b>[X]'s stats</b>"
			//		usr << "Powerlevel: [X:powerlevel] / [X:powerlevel_max]"
			//		usr << "Strength: [X:strength] / [X:strength_max]"
			//		usr << "defense: [X:defence] / [X:defence_max]"
					return

//			if(istype(X,/obj/Blackjack))
//				X:Click()
			/*
			if(istype(X,/obj/Blackjack/HUD/HitButton))
				X:Click()
			if(istype(X,/obj/Blackjack/HUD/StayButton))
				X:Click()
			if(istype(X,/obj/Blackjack/MessageHUD/PlayAgain))
				X:Click()
			if(istype(X,/obj/Blackjack/MessageHUD/ChangeBet))
				X:Click()
			if(istype(X,/obj/Blackjack/MessageHUD/Quit))
				X:Click()


*/


