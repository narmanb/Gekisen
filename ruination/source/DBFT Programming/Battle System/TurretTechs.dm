mob/var/tmp/beingslowed=0
obj
	Turret

		var/creator
		var/turtype = 0
		icon = 'Turret.dmi'
		density = 1
		DamageTurret
			icon_state = "dot"
		HealTurret
			icon_state = "heal"
		SlowTurret
			icon_state = "slow"


		New()
//			..()
			layer = MOB_LAYER + 1
			pixel_y = -16
			pixel_x = -16
	//		if(src.turtype == 1)
	//			spawn() src.AoEdmg(src.creator)
		//	spawn(700)del(src)



/*
mob/verb/testturret()

	//var/obj/Turret/M=new/obj/Turret(usr.loc)
	//var/obj/blasts/TenXKamehameha/M=new/obj/blasts/TenXKamehameha(get_step(usr,usr.dir),usr)
	var/obj/Turret/DamageTurret/M=new/obj/Turret/DamageTurret(get_step(usr,usr.dir),usr)
	var/dmg = (usr.powerlevel*0.05) * (usr.ki_power/100)
	M.creator = usr
	M.turtype = 1
	M.AoEdmg(usr,dmg)

mob/verb/healtur()
	var/obj/Turret/HealTurret/M=new/obj/Turret/HealTurret(get_step(usr,usr.dir),usr)
	//var/heall = (usr.ki*0.05) * (usr.ki_power/100)
	M.creator = usr
	M.turtype = 2
	M.AoEheal(usr)

mob/verb/slowtur()
	var/obj/Turret/SlowTurret/M=new/obj/Turret/SlowTurret(get_step(usr,usr.dir),usr)
	//var/heall = (usr.ki*0.05) * (usr.ki_power/100)
	M.creator = usr
	M.turtype = 3
	M.AoEslow(usr)
*/
obj/Technique
	DamageField //1 Demon
		verb
			Damage_Field()
				//var/cost = 10000000+(100000*usr.kiuse)
				set category = "Techniques"
				set src in usr.contents
				var/curki = round((usr.ki_control * usr.ki_max)/100)
				var/cost = ((curki * 0.2)*(usr.kiuse/100))+10000
				if(techs_on==0)
					usr<<"Techniques have currently been disabled"
					return
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						usr << "Safe Zone!"
						return
				if(usr.z == 8)
					usr << "You can't use this here!"
					return
				if(usr.aoefield_cd)
					usr << "You must wait before you can cast another field"
					return
				if(usr.dead)
					usr<<"You are dead."
					return
				if(usr.attackCD)
					//usr << "You must wait a second before you can attack"
					return
				if(usr.doing||usr.buku)
					usr<<"You are doing something."
					return
				if(usr.frozen)
					usr<<"You can't move right now."
					return
				if(usr.ki<cost)
					usr<<"Your ki is too low."
					return
				if(usr.ki_lock)
					src << "You can't use ki right now."
					return
				if(usr.safe)
					usr << "You can't attack right now."
					return
				if(!usr.pk)
					usr << "You are not a Combatant!"
					return
				if(usr.staminaleft>=usr.staminaleft_max)
					usr << "<font color=#ff0000>You are too tired to fight!</font>"
					return
				usr.attackCD = 1
				spawn(6) usr.attackCD = 0
			//	usr.frozen = 1
				usr.icon_state = "spirit bomb"
				view(6)<<"\white[usr] begins casting a Damage Field!"
				sleep(20)
			//	usr.frozen = 0
				usr.icon_state = ""
				usr.ki -= cost
				usr.TechCD("aoefield",220)
				var/obj/Turret/DamageTurret/M=new/obj/Turret/DamageTurret(get_step(usr,usr.dir),usr)
				var/dmg = (usr.powerlevel*0.05) * (usr.ki_power/100)
				M.creator = usr
				M.turtype = 1
				M.AoEdmg(usr,dmg)


	SlowField //1 Demon
		verb
			Slow_Field()
				//var/cost = 10000000+(100000*usr.kiuse)
				set category = "Techniques"
				set src in usr.contents
				var/curki = round((usr.ki_control * usr.ki_max)/100)
				var/cost = ((curki * 0.2)*(usr.kiuse/100))+10000
				if(techs_on==0)
					usr<<"Techniques have currently been disabled"
					return
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						usr << "Safe Zone!"
						return
				if(usr.z == 8)
					usr << "You can't use this here!"
					return
				if(usr.dead)
					usr<<"You are dead."
					return
				if(usr.attackCD)
					//usr << "You must wait a second before you can attack"
					return
				if(usr.doing||usr.buku)
					usr<<"You are doing something."
					return
				if(usr.aoefield_cd)
					usr << "You must wait before you can cast another field"
					return
				if(usr.frozen)
					usr<<"You can't move right now."
					return
				if(usr.ki<cost)
					usr<<"Your ki is too low."
					return
				if(usr.ki_lock)
					src << "You can't use ki right now."
					return
				if(usr.safe)
					usr << "You can't attack right now."
					return
				if(!usr.pk)
					usr << "You are not a Combatant!"
					return
				if(usr.staminaleft>=usr.staminaleft_max)
					usr << "<font color=#ff0000>You are too tired to fight!</font>"
					return
				usr.attackCD = 1
				spawn(6) usr.attackCD = 0
			//	usr.frozen = 1
				usr.icon_state = "spirit bomb"
				view(6)<<"\white[usr] begins casting a Slow Field!"
				sleep(20)
			//	usr.frozen = 0
				usr.icon_state = ""
				usr.ki -= cost
				usr.TechCD("aoefield",220)
				var/obj/Turret/SlowTurret/M=new/obj/Turret/SlowTurret(get_step(usr,usr.dir),usr)
				//var/heall = (usr.ki*0.05) * (usr.ki_power/100)
				M.creator = usr
				M.turtype = 3
				M.AoEslow(usr)

	HealField //1 Demon
		verb
			Heal_Field()
				//var/cost = 10000000+(100000*usr.kiuse)
				set category = "Techniques"
				set src in usr.contents
				var/curki = round((usr.ki_control * usr.ki_max)/100)
				var/cost = ((curki * 0.2)*(usr.kiuse/100))+10000
				if(techs_on==0)
					usr<<"Techniques have currently been disabled"
					return
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						usr << "Safe Zone!"
						return
				if(usr.z == 8)
					usr << "You can't use this here!"
					return
				if(usr.dead)
					usr<<"You are dead."
					return
				if(usr.aoefield_cd)
					usr << "You must wait before you can cast another field"
					return
				if(usr.attackCD)
					//usr << "You must wait a second before you can attack"
					return
				if(usr.doing||usr.buku)
					usr<<"You are doing something."
					return
				if(usr.frozen)
					usr<<"You can't move right now."
					return
				if(usr.ki<cost)
					usr<<"Your ki is too low."
					return
				if(usr.ki_lock)
					src << "You can't use ki right now."
					return
				if(usr.safe)
					usr << "You can't attack right now."
					return
				if(!usr.pk)
					usr << "You are not a Combatant!"
					return
				if(usr.staminaleft>=usr.staminaleft_max)
					usr << "<font color=#ff0000>You are too tired to fight!</font>"
					return
				usr.attackCD = 1
				spawn(6) usr.attackCD = 0
		//		usr.frozen = 1
				usr.icon_state = "spirit bomb"
				view(6)<<"\white[usr] begins casting a Heal Field!"
				sleep(20)
		//		usr.frozen = 0
				usr.icon_state = ""
				usr.ki -= cost
				usr.TechCD("aoefield",220)
				var/obj/Turret/HealTurret/M=new/obj/Turret/HealTurret(get_step(usr,usr.dir),usr)
				//var/heall = (usr.ki*0.05) * (usr.ki_power/100)
				M.creator = usr
				M.turtype = 2
				M.AoEheal(usr)
obj/proc
	AoEdmg(creator,dmg)
		var/blastrange = 3
		var/counter = 15
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays += 'explosionaoe.dmi'
		//	spawn(2) T.overlays -= 'explosion.dmi'

		while(counter>0)

//			for(var/turf/T in range(blastrange,src.loc))
//				T.overlays += 'explosion.dmi'
//				spawn(2) T.overlays -= 'explosion.dmi'
			for(var/mob/M in range(blastrange,src.loc))
				if(M == creator) continue
				spawn(-1) creator:PVPflagged(4)
				spawn(-1) M.PVPflagged(6)
				var/kidef = M.defence*0.4
				var/kidefcalc = round(kidef*(M.ki_res/100))
				var/dmgtotal = round(dmg-kidefcalc)
				//dmg = round(dmg-kidefcalc)
				if(dmgtotal < 1) dmgtotal = 1
				if(creator:spar && M.spar)
					var/mindmg = round(M.powerlevel_max*0.05)
					dmgtotal = mindmg
				M.powerlevel -= dmgtotal
				M << output("You are hit for [applycommas(dmgtotal)] damage by [creator]s damage field!","output2")
				creator << output("You hit [M] for [applycommas(dmgtotal)] with your damage field!","output2")
				if(M.powerlevel <= 0)
					M.DeathCheck(creator)
			counter--
			sleep(4)
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays -= 'explosionaoe.dmi'

		del src
		return


	AoEheal(creator)

		var/blastrange = 3
		var/counter = 8
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays += 'healaoe.dmi'
		while(counter>0)
			var/randheal = rand(1,3)
			if(randheal==1) randheal=0.07
			if(randheal==2) randheal=0.03
			if(randheal==3) randheal=0.13
//			for(var/turf/T in range(blastrange,src.loc))
//				T.overlays += 'healaoe.dmi'
//				spawn(2) T.overlays -= 'healaoe.dmi'
			for(var/mob/M in range(blastrange,src.loc))
			//	if(M == creator) continue
				if(creator:party_name==M.party_name)
					if(M.powerlevel < ((M.powerlevel_max*M.ki_control)/100))
						M.powerlevel+=M.powerlevel_max*randheal
						M << output("<font color = green><b>You feel yourself being healed..","output2")



			counter--
			sleep(8)
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays -= 'healaoe.dmi'
		del src
		return


	AoEslow(creator)
		var/blastrange = 5
		var/counter = 16
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays += 'aoeslow.dmi'
		//	spawn(2) T.overlays -= 'explosion.dmi'

		while(counter>0)
//			for(var/turf/T in range(blastrange,src.loc))
//				T.overlays += 'explosion.dmi'
//				spawn(2) T.overlays -= 'explosion.dmi'
			for(var/mob/M in range(blastrange,src.loc))
				if(M == creator) continue
				if(creator:party_name==M.party_name) continue
				spawn(-1) creator:PVPflagged(4)
				spawn(-1) M.PVPflagged(6)
				M << output("<font color = red>You have been slowed down by [creator]s mind dampener!","output2")
				M.move_delay = 2.4
				M.beingslowed = 1
			counter--
			sleep(3)
		for(var/turf/T in range(blastrange,src.loc))
			T.overlays -= 'aoeslow.dmi'

		for(var/mob/M in world)
			if(M.beingslowed)
				M.move_delay = 0.6
				M.beingslowed = 0
		del src
		return