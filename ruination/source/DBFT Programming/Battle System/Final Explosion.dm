obj/Technique/FinalExplosion
	verb
		Final_Explosion()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Final Explosion")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.tech_cooldown)
				usr<<"You must cooldown."
				return
			if(usr.doing)
				usr<<"You are doing something."
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<50000)
				usr<<"You don't have enough ki!"
				return
			if(usr.ki_lock)
				src << "You can't use ki right now."
				return
			if(usr.tourny)
				usr << "You can't use this right now."
				return
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "Reach level 2500 to be able to use battle techniques."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "Safe Zone!"
					return
			if(usr.race == "Saiyan" || usr.race == "Half Saiyan")
				usr.icon_state = "enrage"
				usr.frozen = 1
				usr.doing=1
				usr.overlays += 'Flash.dmi'
				sleep(40)
				usr.overlays -= 'Flash.dmi'
				new/obj/techs/Overlays/Crater_Center(usr.loc)
				for(var/obj/Earth_Dragonballs/O in usr)
					O.loc = usr.loc
				for(var/obj/Namek_Dragonballs/O in usr)
					O.loc = usr.loc
				for(var/obj/Black_Dragonballs/O in usr)
					O.loc = usr.loc
				usr.e_db_1 = 0
				usr.e_db_2 = 0
				usr.e_db_3 = 0
				usr.e_db_4 = 0
				usr.e_db_5 = 0
				usr.e_db_6 = 0
				usr.e_db_7 = 0
				usr.n_db_1 = 0
				usr.n_db_2 = 0
				usr.n_db_3 = 0
				usr.n_db_4 = 0
				usr.n_db_5 = 0
				usr.n_db_6 = 0
				usr.n_db_7 = 0
				usr.b_db_1 = 0
				usr.b_db_2 = 0
				usr.b_db_3 = 0
				usr.b_db_4 = 0
				usr.b_db_5 = 0
				usr.b_db_6 = 0
				usr.b_db_7 = 0
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						usr << "Safe Zone!"
						usr.DeathCheck(usr)
						return
				for(var/atom/A in range(8,usr))
					if(isarea(A) || istype(A,/obj/blasts/trails)) continue
					if(isarea(A))
						A.overlays += 'explosion.dmi'
						spawn(5) A.overlays -= 'explosion.dmi'

					if(isturf(A))
						A.overlays += 'explosion.dmi'
						spawn(5) A.overlays -= 'explosion.dmi'
						continue


				for(var/mob/M in oview(8,usr))
					var/damage = round(((usr.ki*usr.ki_power)/100)*2)
					if(!M.dead&&!M.safe&&M.pk)
						var/turf/CL=M.loc
						for(var/turf/Floors/Safe_Zone/SZ in CL)
							if(SZ in CL)
								continue
						var/damage2=(damage-round((usr.ki*usr.ki_power)/100))/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						M.DeathCheck(usr)
				usr.powerlevel=0
				usr.DeathCheck(usr)
				return