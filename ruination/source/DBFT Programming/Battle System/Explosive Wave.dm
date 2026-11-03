obj/Technique/ExplosiveWave
	verb
		Explosive_Wave()
		//	var/cost = 500000+(200000*usr.kiuse)

			set category = "Techniques"
			var/curki = round((usr.ki_control * usr.ki_max)/100)
			var/cost = ((curki * 0.02)*(usr.kiuse/100))+1000
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Explosive Wave")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.explosivewave_cd)
				usr<<"You must cooldown."
				return
//			if(usr.tech_cooldown)
//				usr<<"You must cooldown on this technique"
//				return
			if(usr.doing)
				usr<<"You are busy"
				return
			if(usr.frozen)
				usr<<"You can't move right now."
				return
			if(usr.ki<cost)
				usr<<"You don't have enough ki!"
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
//crim 2.61 add tech cooldown of 4 seconds after EW is cast
			usr.doing=1
			usr.frozen=1
			usr.icon_state = "enrage"
			usr.attackCD = 1
			usr.TechCD("explosivewave",40)
			usr.ki -= cost
			if(usr.hudenabled)
				spawn() usr.updateki()
			spawn(7) usr.attackCD = 0
			view(8)<<"\white [usr]: EXPLOSIVE WAVE..."
			sleep(5)
			view(8)<<"\white [usr]: ...HAA!!!"
			Explode(new /Effect/BasicBoom(src.loc,1,3))
			sleep(2)
			Explode(new /Effect/BasicBoom(src.loc,1,5))
			view(8)<<"\white [usr]: screams in pain as he generates a Ki Explosive around him."
			for(var/mob/M in oview(3,usr))
		//	var/damage = round(usr.ki_max * usr.ki_power / 100 / 3)
				var/damage = round( usr.powerlevel * 100 / 100 / 2 )

				if(istype(M,/mob/PC))
					damage = round(damage/25)
					spawn(-1) M.PVPflagged(4)
					spawn(-1) usr.PVPflagged(6)
					M.rage += round(rand(5,10))
					if(M.rage >= 100)
						M.rage = 100
					if(M.iting && M.pvpflagged)
						M.ITstop = 1
						damage *= 2
						usr << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")


				if(!M.dead&&!M.safe&&M.pk)
					var/kidef = M.defence*0.4
					var/kidefcalc = round(kidef*(M.ki_res/100))
					var/damage2=(damage-round(kidefcalc/125)/((2+get_dist(usr,M))/2))
					if(damage2<0)
						damage2=0
					if(M.energy_barrier)
						M.energy_barrier_health -= damage2/10
						view(M) << "<font color = green><b>[M]'s energy barrier took [applycommas(damage2/10)] damage from splash damage!"
						if(M.energy_barrier_health <= 0)
							view(M) << "<font color = green><b>[M]'s energy barrier was shattered by [usr]s explosive wave!!"
							M.energy_barrier=0
							damage2 = round(damage2/2)
						else
							damage2 = 1

						if(M.buku)
							view() << "<b><font color=red>[usr]'s attack forces [M] to land!</font>"
							M.buku = 0
							M.density = 1
							M.icon_state = ""
							M.doing = 0
							if(!M.timeskipeffect)
								M.move_delay = 0.6

					if(M.race == "Exploding")
						damage2 = rand(1,2)
					if(usr.spar && M.spar)
						var/mindmg = round(M.powerlevel_max*0.01)
						damage2 = mindmg
					M.powerlevel-=damage2
					if(M.hudenabled)
						spawn() M.updateHealth()
					usr<<output("<font color=yellow>Your explosion damages [M] for [applycommas(damage2)] damage!","output2")
					if(M.client)
						M << output("<font color=red>[usr]'s explosion damages you with [applycommas(damage2)] damage!","output2")
					if(M.powerlevel <= 0)
						if(usr.lethalon)
							spawn(-1) M.DeathCheck(usr)
						else
							spawn(-1) M.KO(usr)
		//	spawn(40)usr.tech_cooldown=0
		//	usr.tech_cooldown=1
			usr.doing=0
			usr.frozen=0
			usr.icon_state = ""
			return