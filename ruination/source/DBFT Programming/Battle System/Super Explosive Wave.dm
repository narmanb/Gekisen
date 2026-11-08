mob/var/explodepower=2
obj/Technique/SuperExplosionWave
	verb
		Super_Explosion_Wave()
			//var/cost = 50000000+(20000000*usr.kiuse)
			set category = "Techniques"
			//world << "COST [applycommas(cost)]"
			var/curki = round((usr.ki_control * usr.ki_max)/100)
			var/cost = ((curki * 0.1)*(usr.kiuse/100))+25000
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Explosive Wave")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.doing)
				usr<<"You are busy."
				return
			if(usr.ki<cost)
				usr<<"You don't have enough ki!"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.sew_cd)
				usr<<"You must cooldown."
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
				src<<"You can't use this technique while flying"
				return
			else
				usr.doing=1
				usr.frozen=1
				usr.icon_state = "enrage"
				view(8)<<"\white [usr]: SUPER..."
				sleep(5)
				view(8)<<"\white [usr]: EXPLOSION WAVE..."
				sleep(5)
				usr.icon_state = ""
				usr.frozen = 0
				view(8)<<"\white [usr]: ...HAA!!!"

				var/damage = round(usr.ki_max * usr.ki_power / 100 / 3)

				ExplosionSEW(2,usr.loc,damage,usr)

				sleep(5)

		//		usr.ki -= cost
				view(8)<<"\white [usr]: screams in pain as he generates a Massive Ki Explosive around him."

				var/damage3 = round(usr.ki_max * usr.ki_power / 100 / 3)
				ExplosionSEW(3,usr.loc,damage3,usr)
				//usr.ki -= cost


				sleep(5)

				var/damage4 = round(usr.ki_max * usr.ki_power / 100 / 3)
				ExplosionSEW(4,usr.loc,damage4,usr)
		//		usr.ki -= cost


				usr.attackCD = 1
				//usr.ki -= cost
				if(usr.hudenabled)
					spawn() usr.updateki()

				usr.TechCD("sew",82)
				spawn(7) usr.attackCD = 0
				usr.doing=0
				usr.frozen=0
				usr.icon_state = ""
				return





/*
obj/Technique/SuperExplosionWave
	verb
		Super_Explosion_Wave()
			var/cost = 500000000+(20000000*usr.kiuse)
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Explosive Wave")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.doing)
				usr<<"You are busy."
				return
			if(usr.ki<cost)
				usr<<"You don't have enough ki!"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.sew_cd)
				usr<<"You must cooldown."
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
				src<<"You can't use this technique while flying"
				return
			else
				usr.doing=1
				usr.frozen=1
				usr.icon_state = "enrage"
				view(8)<<"\white [usr]: SUPER..."
				sleep(5)
				view(8)<<"\white [usr]: EXPLOSION WAVE..."
				sleep(5)
				view(8)<<"\white [usr]: ...HAA!!!"
				Explode(new /Effect/BasicBoom(src.loc,1,3))
				for(var/mob/M in oview(8,usr))
					//var/damage = round(((usr.ki*usr.ki_power)/100)/3)
					var/damage = round(usr.ki * usr.ki_power / 100 / 3)
					if(istype(M,/mob/PC))
						damage = round(damage/50)
					usr.ki -= cost
					if(!M.dead&&!M.safe&&M.pk)
						var/damage2=(damage-round((M.kidefense*M.ki_res)/125))/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						usr<<output("<font color=yellow>Your explosion damages [M] for [applycommas(damage2)] damage!","output2")
						if(M.client)
							M << output("<font color=red>[usr]'s explosion damages you with [applycommas(damage2)] damage!","output2")
						M.DeathCheck(usr)
				sleep(5)
				usr.ki -= cost
				view(8)<<"\white [usr]: screams in pain as he generates a Massive Ki Explosive around him."
				Explode(new /Effect/BasicBoom(src.loc,1,5))

				for(var/mob/M in oview(8,usr))
					//var/damage3 = round(((usr.ki*usr.ki_power)/100)/3)
					var/damage3 = round(usr.ki * usr.ki_power / 100 / 3)
					if(istype(M,/mob/PC))
						damage3 = round(damage3/50)
					usr.ki -= cost
					if(!M.dead&&!M.safe&&M.pk)
						var/damage2=(damage3-round((M.kidefense*M.ki_res)/125))/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						usr<<output("<font color=yellow>Your explosion damages [M] for [applycommas(damage2)] damage!","output2")
						if(M.client)
							M << output("<font color=red>[usr]'s explosion damages you with [applycommas(damage2)] damage!","output2")
						M.DeathCheck(usr)
				sleep(5)
				Explode(new /Effect/BasicBoom(src.loc,1,7))
				for(var/mob/M in oview(8,usr))
					//var/damage4 = round(((usr.ki*usr.ki_power)/100)/3)
					var/damage4 = round(usr.ki * usr.ki_power / 100 / 3)
					if(istype(M,/mob/PC))
						damage4 = round(damage4/50)
					usr.ki -= cost
					if(!M.dead&&!M.safe&&M.pk)
						var/damage2=(damage4-round((M.kidefense*M.ki_res)/125))/(((2+get_dist(usr,M))/2))
						if(damage2<0)
							damage2=0
						M.powerlevel-=damage2
						usr<<output("<font color=yellow>Your explosion damages [M] for [applycommas(damage2)] damage!","output2")
						if(M.client)
							M << output("<font color=red>[usr]'s explosion damages you with [applycommas(damage2)] damage!","output2")
						M.DeathCheck(usr)
				usr.attackCD = 1
				usr.TechCD("sew",200)
				spawn(7) usr.attackCD = 0
				usr.doing=0
				usr.frozen=0
				usr.icon_state = ""
				return*/