//crim 2.61 added aoe strength technique
obj
	Tech
		ExeStrike
			icon='ExStrike.dmi'
			layer=9999
			New()
				..()
				pixel_y = -32
				pixel_x = -32
				spawn(4)del(src)
obj/Technique/ExecutionersStrike
	verb
		Executioners_Strike()
			//var/cost = 500000+(200000*usr.kiuse)
			set category = "Techniques"
			var/curki = round((usr.ki_control * usr.ki_max)/100)
			var/cost = ((curki * 0.025)*(usr.kiuse/200))+2500
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Executioners Strike")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.es_cd)
				usr<<"You must cooldown."
				return
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
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "<font color=#ff0000>You are too tired to fight!</font>"
				return
			else
//crim 2.61 add tech cooldown of 4 seconds after EW is cast
				//usr.ki -= cost
				usr.staminaleft += 10
				usr.attackCD = 1
				usr.TechCD("es",50)
				spawn(7) usr.attackCD = 0
				usr.doing=1
				usr.frozen=1
				usr.icon_state = "enrage"
				view(8)<<"<font color = white>[usr] is preparing for a big attack!!!"
				sleep(5)
				view(8)<<"\white [usr]: EXECUTIONERS STRIKE..."
				sleep(1)
				var/obj/Tech/ExeStrike/E=new
				E.loc = usr.loc
				for(var/mob/M in oview(5,usr))

					//var/damage = round(((usr.strength*usr.melee)/100)/3)
					var/damage = round(usr.strength * usr.melee / 100 / 3)

					if(istype(M,/mob/PC))
						damage = round(damage/50)
						spawn(-1) M.PVPflagged(4)
						spawn(-1) usr.PVPflagged(6)
						M.rage += round(rand(2,4))
						if(M.rage >= 100)
							M.rage = 100
						if(M.iting && M.pvpflagged)
							M.ITstop = 1
							damage *= 2
							usr << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

					if(!M.dead&&!M.safe&&M.pk)
						//var/damage2=(damage-round((M.defence*M.durability)/125))/(((2+get_dist(usr,M))/2))
						var/damage2 = damage - round(M.defence*(M.durability/100)/300)

						if(damage2<0)
							damage2=0
						if(M.race == "Exploding")
							damage2 = rand(0,1)
						if(usr.spar && M.spar)
							var/mindmg = round(M.powerlevel_max*0.01)
							damage2 = mindmg
						M.powerlevel-=damage2
						usr<<output("<font color=yellow>Your attack damages [M] for [applycommas(damage2)] damage!","output2")
						if(M.client)
							M << output("<font color=red>[usr]'s attack damages you with [applycommas(damage2)] damage!","output2")
						if(M.hudenabled)
							spawn() M.updateHealth()
						usr.doing=0
						usr.frozen=0
						if(M.powerlevel <= 0)
							if(usr.lethalon)
								spawn(-1) M.DeathCheck(usr)
							else
								spawn(-1) M.KO(usr)
					//	M.DeathCheck(usr)
				//spawn(50)usr.tech_cooldown=0

				usr.doing=0
				usr.frozen=0
				usr.icon_state = ""
				return