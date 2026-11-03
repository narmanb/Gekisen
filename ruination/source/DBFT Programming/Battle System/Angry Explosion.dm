obj/Technique/AngryExplosion
	verb
		Angry_Explosion()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Angry Explosion")
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
			if(usr.safe)
				usr << "You can't attack right now."
				return
			if(!usr.pk)
				usr << "Reach level 2500 to be able to use battle techniques."
				return
			for(var/turf/Floors/Safe_Zone/S in view(12))
				if(S in oview(12))
					usr << "You are in a Safe Zone!"
					return
			if(usr.race == "Majin")
				usr.icon_state = "enrage"
				usr.frozen = 1
				usr.doing=1
				usr.tech_cooldown=1
				view(12) << "<font color=white>[usr]: </font>ANGRY!"
				sleep(10)
				view(12) << "<font color=white>[usr]: </font>EXPLOSION!!!"
				sleep(10)
				view(12) << "<font color=white>[usr]: </font>HAAAAA!"
				for(var/turf/Floors/Safe_Zone/S in view(12))
					if(S in oview(12))
						usr << "You are in a Safe Zone!"
						usr.ANGRY()
						return
				for(var/mob/M in oview(4,usr))
					var/damage = round(((usr.ki*usr.ki_power)/100)*2)
					new/obj/techs/Overlays/Crater_Center(src.loc)
					if(!M.dead&&!M.safe&&M.pk)
						var/turf/CL=M.loc
						for(var/turf/Floors/Safe_Zone/SZ in CL)
							continue
						var/damage2=(damage-round((usr.ki*usr.ki_power)/100))/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						M.DeathCheck(usr)
				usr.ANGRY()
				return

mob
	proc
		ANGRY()
			src.powerlevel=50
			src.ki = 0
			src.rest = 0
			src.frozen = 1
			src.boxing = 0
			src.doing = 0
			src.icon_state = "Dead"
			src.regen_dead=1
			spawn(200)src.tech_cooldown=0