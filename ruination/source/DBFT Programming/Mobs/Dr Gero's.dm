
turf
	Passages
		Guild_Houses
			Guild_House_1_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(46,667,5)
			Guild_House_1_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(132,664,1)
			Guild_House_2_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(418,654,5)
			Guild_House_2_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(614,327,1)
			Guild_House_3_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(161,657,5)
			Guild_House_3_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(115,155,2)
			Guild_House_4_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(300,668,5)
			Guild_House_4_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(390,521,1)
			Guild_House_5_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(574,666,5)
			Guild_House_5_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(136,84,1)
			Guild_House_6_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(38,3,5)
			Guild_House_6_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(258,566,6)
			Guild_House_7_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(144,3,5)
			Guild_House_7_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(351,413,6)
			Guild_House_8_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(251,3,5)
			Guild_House_8_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(233,96,6)
			Guild_House_9_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(368,4,5)
			Guild_House_9_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(47,424,4)
			Guild_House_10_Enter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(469,4,5)
			Guild_House_10_Exit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(552,153,3)
		Dr_Geros
			SsjCaveEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(16,357,7)
			SsjCaveExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc = locate(424,33,1)
			IceCaveEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(50,419,7)
			IceCaveExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						M.loc = locate(385,197,1)
			LabEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						if(M.race == "Android")
							M.it_blocked=1
							M.it_lock=1
							M.loc = locate(211,415,6)
						else
							M << "You have no business in here."
			LabExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(usr.cloak_eq == 1)
							M.loc = locate(133,80,7)
							M.it_lock=0
						else
							M.it_blocked=0
							M.loc = locate(133,80,7)
							M.it_lock=0
			GodCaveEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(71,35,6)
			GodCaveExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(155,448,7)
			SafeZoneEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter the safezone while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(418,225,7)
						M.in_hbtc=0
						M.dir = NORTH
			SafeZoneExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(64,387,1)
						M.in_hbtc=0
						M.dir = SOUTH

			HerculeGymEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter the safezone while you are engaged in PVP!"
							return
						if(M.level < 20000)
							M << "You must be at least level 20,000 to enter Hercules Gym!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(434,4,6)
						M.in_hbtc=0
						M.in_herculegym = 1
						M.dir = NORTH
			HerculeGymExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(70,362,1)
						M.in_hbtc=0
						M.in_herculegym = 0
						M.dir = SOUTH

			ExplodingSaibaEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter this zone while you are engaged in PVP!"
							return
						if(M.buff1||M.buff2||M.buff3||M.buff4||M.manipulated||M.kaioken)
							M << "You cannot enter this zone while buffed!"
							return
						if(M.buku)
							M << "You must land before you can enter this zone!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
					//	M.inexplodezone = 1
					//	M.explodezonedrain()
						M.explodecurrentkills = 0
						M.loc = locate(350,476,8)
						M.dir = SOUTH
			ExplodingSaibaExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(51,448,1)
				//		if(M.explodecurrentkills > 1)
				//			var/qpgain = M.explodecurrentkills/2
				//			M << "<b><font color = yellow>You got [round(qpgain)] quest points for successfully getting out of the zone!"
				//			M.questpoints += qpgain
						player <<"<FONT color = red>Training Information:<FONT color = White> [M] killed [M.explodecurrentkills] exploding saibamen in a single run!"
						if(M.explodecurrentkills >= 1000 && M.startedexplodingsaibamassacre)
							M << "You have completed the Exploding Saibaman Massacre quest! Go see the injured saiyan"
							M.explodingsaibacomplete=1
							return
						M.dir = NORTH

			ExplodingCellEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(!M.questpointrewardCell)
							M << "<b>You don't have the key to enter this zone!"
							return
						if(M.buff1||M.buff2||M.buff3||M.buff4||M.manipulated||M.kaioken)
							M << "You cannot enter this zone while buffed!"
							return
						if(M.pvpflagged)
							M << "<b>You cannot enter this zone while you are engaged in PVP!"
							return
						if(M.buku)
							M << "You must land before you can enter this zone!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
					//	M.inexplodezone = 1
					//	M.explodezonedrain()
						M.explodecurrentkillscell = 0
						M.loc = locate(264,34,8)
						M.dir = NORTH
			ExplodingCellExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(24,488,1)
				//		if(M.explodecurrentkillscell > 1)
				//			var/qpgain = M.explodecurrentkillscell/2
				//			M << "<b><font color = yellow>You got [round(qpgain)] quest points for successfully getting out of the zone!"
				//			M.questpoints += qpgain
						player <<"<FONT color = red>Training Information:<FONT color = White> [M] killed [M.explodecurrentkillscell] exploding cell juniors in a single run!"
						if(M.explodecurrentkillscell >= 1000 && M.startedexplodingcellmassacre)
							M << "You have completed the Exploding Cell Junior Massacre quest! Go see the injured half saiyan"
							M.explodingcellcomplete=1
							return
						M.dir = NORTH


			BarberEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(72,477,5)
						M.dir = NORTH
			BarberExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(83,354,1)
						M.dir = SOUTH

			ShopsEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(35,484,5)
						M.in_hbtc=0
						M.dir = SOUTH
			ShopsExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(47,363,1)
						M.dir = NORTH


			BankEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(485,367,5)
						M.in_hbtc=0
						M.VAULTPROGRESS = 0
						M.dir = SOUTH
			BankExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
//						var/count = 0
//						for(var/mob/Destroyable/VAULT/P in world)
//							count++
					//	if(count <= 1)
					//		world.Repop()
						M.loc = locate(48,387,1)
						M.VAULTPROGRESS = 0
						M.dir = NORTH


			RichHouseEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						if(M.pvpflagged)
							M << "<b>You cannot enter a guild house while you are engaged in PVP!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(124,482,5)
						M.dir = SOUTH

			RichHouseExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
						M.loc = locate(75,409,1)
						M.dir = SOUTH

			BeerusZoneEnter
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
					//	if(!M.questpointrewardCell)
					//		M << "<b>You don't have the key to enter this zone!"
					//		return
					//	if(M.buff1||M.buff2||M.buff3||M.buff4||M.manipulated||M.kaioken)
					//		M << "You cannot enter this zone while buffed!"
					//		return
						if(M.pvpflagged)
							M << "<b>You cannot enter this zone while you are engaged in PVP!"
							return
						if(M.buku)
							M << "You must land before you can enter this zone!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
					//	M.inexplodezone = 1
					//	M.explodezonedrain()
						M.explodecurrentkillscell = 0
						M.loc = locate(158,12,10)
						M.dir = NORTH


			BeerusZoneExit
				Enter(var/mob/PC/M)
					if(istype(M,/mob/PC))
					//	if(!M.questpointrewardCell)
					//		M << "<b>You don't have the key to enter this zone!"
					//		return
					//	if(M.buff1||M.buff2||M.buff3||M.buff4||M.manipulated||M.kaioken)
					//		M << "You cannot enter this zone while buffed!"
					//		return
					//	if(M.pvpflagged)
					//		M << "<b>You cannot enter this zone while you are engaged in PVP!"
					//		return
						if(M.buku)
							M << "You must land before you can enter this zone!"
							return
						for(var/obj/O in usr.contents)
							if(O.dball)
								M<<"You can't bring the Dragonballs in here!"
								return
					//	M.inexplodezone = 1
					//	M.explodezonedrain()
						M.explodecurrentkillscell = 0
						M.loc = locate(309,415,9)
						M.dir = NORTH

