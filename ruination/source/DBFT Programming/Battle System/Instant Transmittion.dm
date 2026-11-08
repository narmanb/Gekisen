mob/var/it_blocked = 0
mob/var/tmp/iting=0
mob/var/tmp/ITstop=0


obj/Technique/InstantTransmission
	verb/Instant_Transmission()
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Instant Transmission")
		var/ki_cost=500
		if(usr.doing)
			usr << "You are already doing something."
			return
		if(usr.buku)
			return
		if(usr.jailed)
			usr << "can't do this while jailed"
			return
		if(usr.grav > 0)
			return
		if(usr.dead)
			return
		if(usr.in_hbtc||usr.in_herculegym)
			usr << "You cannot use instant transmission right now!"
			return
		if(usr.z >= 8)
			usr << "You cannot use instant transmission while in this zone!"
			return
		if(usr.it_lock)
			usr << "Cannot use this Technique at this time."
			return
		if(usr.ki_lock)
			usr << "Cannot use this Technique at this time."
			return
//To add people to the Android IT List add then here
	//	if(usr.race == "Android"||usr.key=="Crimson Slayer"||usr.key=="Hammerboy"||usr.key == "Hami12"||usr.key == "Narmanb")
		if(usr.it_lock)
			usr << "Cannot use this Technique right now."
			return
		var/list/Menu = list()
		//Menu +=
	//	Menu += "NPCS"
		Menu += "Cancel"
		if(!usr.pvpflagged)
			Menu += "Input Energy Code"
		if(usr.pvpflagged)
			Menu += "EARTH"
		for(var/mob/PC/P in player)
			if(P == usr) continue
			if(P.pvpflagged)
				Menu += P


		for(var/mob/M in world)

		//	if(istype(M,/mob/PC))
		//		if(M.pvpflagged)
					//Menu.Add(M)
		//			Menu += M
		//		if(!M.it_blocked&&M.loggedin&&!M.cloak_eq&&!M.ITBLOCKED)
		///			if(M.name != "PC--PC"||M.z!="5")
		//				Menu.Add(M)
			if(istype(M,/mob/NPC))
				if(!M.it_blocked)
					Menu.Add(M)
		var/mob/M = input("IT to who?","Instant Transmission")in Menu
		if(M=="EARTH")
			var/x = rand(40,60)
			var/y = rand(370,385)
			usr.ITcord(x,y)
			return

		if(M=="Cancel")
			return
		if(M=="Input Energy Code")
			if(usr.pvpflagged)
				usr << "You cannot use energy codes while engaged in pvp!"
				return
			if(usr.ki > ki_cost)
				var/code = input("Which Energy Code do you wish to IT to?")as num
				if(lentext(code) > 7)
					usr << "EC too Long!"
					return
				if(code == usr.energy_code)
					usr << "Thats your EC!"
					return
				if(!code)
					return
				else
					usr.NormalIT(code)
					return
			else
				usr << "You do not have enough Ki!"
				return

		usr.AndroidIT(M)


mob
	proc
		AndroidIT(mob/M)
			for(var/obj/O in src)
				if(O.dball)
					if(M.z!=1&&M.z!=2&&M.z!=3&&M.z!=4)
						src<<"You can't IT there with the Dragonballs."
			//		src<<"The Dragonballs are interfering with your ability to seek energy signals."
						return
			if(src.ki<500)
				src << "You do not have enough Ki!"
				src.it_lock=0
				return
			if(src.z >= 8)
				src << "You cannot use instant transmission while in this zone!"
				return
			if(!M)
				src.it_lock=0
				return
			if(M.name == "PC")
				src.it_lock=0
				return
			if(M.it_blocked||M.ITBLOCKED)
				if(!M.pvpflagged)
					src << "You cannot seem to get a clear lock on [M]'s energy signal..."
					src.it_lock=0
					return
			if(M.safe && src.pvpflagged)
				src << "You cannot IT to [M] while they are in a safe zone!"
				src.it_lock=0
				return
			if(src.doing)
				src << "You are already doing something."
				src.it_lock=0
				return
			if(M == src)
				src << "You Cannot IT to yourself!"
				src.it_lock=0
				return
			if(src.ki_lock||src.it_lock)
				src << "Cannot use this Technique right now."
				src.it_lock=0
				return
			if(M.z=="5"||M.dead||M.in_hbtc||M.challenge||src.challenge||M.in_herculegym)
				src << "[M] is in a faraway and unreachable place, best wait until they are closer to IT to them..."
				src.it_lock=0
				return
			if(src.in_tourney||M.in_tourney)
				src << "[M] is in a tournament right now"
				src.it_lock=0
				return
			else
				if(src.grav <= 0)
					if(!M.it_blocked)
						var/ITtime = 30
						if(src.gene=="Yardrat")
							ITtime -= 15
						if(istype(M,/mob/PC))
							ITtime += 15
							M << "<b><font color = red>You feel <font color = yellow>[src]s<font color = red> energy approaching you rapidly!"
						if(src.pvpflagged)
							if(src.gene=="Yardrat")
								ITtime += 15
							else
								ITtime += 30
							oview(12) << "<B><font color = red>[src]<font color = yellow> is concentrating his energy and attempting to instant transmission!"
						src.frozen=1
						src.gravtrain = 0
						src.doing=1
						src.it_lock=1
						src.zanz_lock=1
						src.ki_lock=1
						src.icon_state = "IT"
						src << "<B>Locating [M]'s energy signal..."
						src.ki -= 500
						sleep(ITtime)

						src << "<B>[M] Found!"

						sleep(6)

						src.icon_state = ""
						if(src.ITstop)
							oview(12) << "<B><font color = red>[src]<font color = blue> was stopped from using instant transmission!"
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							src.ITstop = 0
							return
						if(M.ITflag && src.pvpflagged)
							src << "You can't IT to a safe zone while flagged for pvp!"
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						if(!M)
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						if(M.it_blocked && M.pvpflagged == 0)
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
					/*
						if(M.cloak_eq)
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
							*/
						if(src.dead)
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						if(src.in_hbtc||src.in_herculegym)
							src << "You cannot use instant transmission while in the HBTC!"
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						if(M.in_hbtc||M.in_herculegym)
							src << "You cannot use instant transmission while [M] is in the HBTC!"
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						src.grav = 0
						usr.iting=1
						src.x=M.x
						src.y=M.y
						src.z=M.z
						usr.iting=0
						spawn(60)src.it_lock=0
						src.it_blocked=0
						src.grav = 0
						src.grav_delay = 0
						oview(12) << "<B>[src] appears from nowhere!"
						for(var/mob/Monster/F in oview(12))
							if(F.sleeping)
								F.sleeping = 0
								spawn(1) F.AI()
						for(var/mob/Saga/S in oview(12))
							if(S.sleeping)
								S.sleeping = 0
								spawn(1) S.SagaAI()
						src.icon_state = "IT"
						sleep(6)
						src.icon_state = ""
						src.frozen=0
						src.doing=0
						src.it_lock=0
						src.zanz_lock=0
						src.ki_lock=0
					else
						src << "You can't get a clear lock on [M]'s energy signal..."
						return
		NormalIT(ec)
			if(src.dead)
				return
			if(src.ki<500)
				usr << "You do not have enough Ki!"
				return
			if(src.doing)
				usr << "You are already doing something."
				return
			if(src.buku)
				return
			if(src.grav > 0)
				return
			if(src.dead)
				return
			if(src.in_hbtc)
				return
			if(src.it_lock)
				usr << "Cannot use this Technique at his time."
				return
			if(src.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			else
				for(var/mob/M in world)
					if(M.energy_code==ec)
						for(var/obj/O in src)
							if(O.dball)
								if(M.z!=1&&M.z!=2&&M.z!=3&&M.z!=4)
									src<<"You can't IT there with the Dragonballs."
						//		src<<"The Dragonballs are interfering with your ability to seek energy signals."
									return

						if(M.it_blocked!=1)
							if(M.ITBLOCKED)
								src << "You cannot lock onto [M]'s energy signal"
								return
							if(src.dead)
								return
							src.iting = 1
							src.ki -= 500
							src.frozen=1
							src.doing=1
							src.it_lock=1
							src.zanz_lock=1
							src.ki_lock=1
							src << "<B>Locking onto [M]'s energy signal..."
							sleep(15)
							if(!M)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(M.it_blocked)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(M.z=="5"||M.z=="8")
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src<<"They are Currently Unreachable"
								src.iting = 0
								return

							if(M.cloak_eq)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(src.in_hbtc)
								src << "You cannot use instant transmission while in the HBTC!"
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								return
							if(M.in_hbtc)
								src << "You cannot use instant transmission while [M] is in the HBTC!"
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								return
							if(M.in_herculegym||M.z==9||M.z==10||M.z==11)
								src << "[M] is currently too far away to instant transmission to!"
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0

							if(src.dead)
								src.iting = 0
								return
							src << "<B>[M] Found!"
							src.icon_state = "IT"
							for(var/mob/PC/I in oview(1))
								if(I.it_taken && !I.dead && I.grav <= 0)
									for(var/obj/O in I)
										if(O.dball)
											continue
										else
											I.icon_state = "IT"
											I.grav = 0
											spawn(4)I.loc = src.loc
											spawn(4)I.icon_state = ""
							sleep(3)
							src.icon_state = ""
							if(!M)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(M.it_blocked)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(src.dead)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(M.cloak_eq)
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
								src.iting = 0
								return
							if(M.in_herculegym||M.z==9||M.z==10||M.z==11)
								src << "[M] is currently too far away to instant transmission to!"
								src.frozen=0
								src.doing=0
								src.it_lock=0
								src.zanz_lock=0
								src.ki_lock=0
							src.grav = 0
							src.iting=1
							src.x=M.x
							src.y=M.y
							src.z=M.z
							src.iting=0
							src.it_blocked=0
							src.grav = 0
							src.grav_delay = 0
							oview(8) << "<B>[src] appears from nowhere!"
							src.icon_state = "IT"
							sleep(6)
							src.icon_state = ""
							src.frozen=0
							src.doing=0
							src.it_lock=0
							src.zanz_lock=0
							src.ki_lock=0
							return
						else
							src << "You cannot seem to get a clear lock on [M]'s energy signal..."
							return


mob
	proc
		ITcord(x,y)
			if(src.dead)
				return
			if(src.ki<500)
				usr << "You do not have enough Ki!"
				return
			if(src.doing)
				usr << "You are already doing something."
				return
			if(src.buku)
				return
			if(src.grav > 0)
				return
			if(src.dead)
				return
			if(src.in_hbtc)
				return
			if(src.it_lock)
				usr << "Cannot use this Technique at his time."
				return
			if(src.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			else

					/*
						for(var/obj/O in src)
							if(O.dball)
								if(M.z!=1&&M.z!=2&&M.z!=3&&M.z!=4)
									src<<"You can't IT there with the Dragonballs."
						//		src<<"The Dragonballs are interfering with your ability to seek energy signals."
									return
									*/

				src.iting = 1
				src.ki -= 500
				src.frozen=1
				src.doing=1
				src.it_lock=1
				src.zanz_lock=1
				src.ki_lock=1
				src << "<B>Locking onto Earths energy signal..."
				sleep(30)


				if(src.in_hbtc)
					src << "You cannot use instant transmission while in the HBTC!"
					src.frozen=0
					src.doing=0
					src.it_lock=0
					src.zanz_lock=0
					src.ki_lock=0
					return

				if(src.dead)
					src.iting = 0
					return

				src.icon_state = "IT"
				for(var/mob/PC/I in oview(1))
					if(I.it_taken && !I.dead && I.grav <= 0)
						for(var/obj/O in I)
							if(O.dball)
								continue
							else
								I.icon_state = "IT"
								I.grav = 0
								spawn(4)I.loc = src.loc
								spawn(4)I.icon_state = ""
				sleep(6)
				src.icon_state = ""

				if(src.dead)
					src.frozen=0
					src.doing=0
					src.it_lock=0
					src.zanz_lock=0
					src.ki_lock=0
					src.iting = 0
					return

				src.grav = 0
				src.iting=1
				src.x=x
				src.y=y
				src.z=1
				src.iting=0
				src.it_blocked=0
				src.grav = 0
				src.grav_delay = 0
				oview(8) << "<B>[src] appears from nowhere!"
				src.icon_state = "IT"
				sleep(6)
				src.icon_state = ""
				src.frozen=0
				src.doing=0
				src.it_lock=0
				src.zanz_lock=0
				src.ki_lock=0
				return

