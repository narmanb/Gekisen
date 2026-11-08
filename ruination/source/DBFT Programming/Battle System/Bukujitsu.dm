obj/Technique/Fly
	verb/Fly()
		set category = "Combat"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Fly")
		if(usr.buku_lock||usr.energy_barrier)
			usr << "You cannot fly at the moment."
			return
		if(usr.jailed)
			usr << "can't do this while jailed"
			return

		for(var/turf/Floors/Gravity_Floor/S in view(8))
			if(S in oview(8))
				usr << "You cannot fly here."
				usr.icon_state = ""
				return
		if(usr.buku)
			usr << "You land on the ground from the sky."
			usr.buku = 0
			if(usr.pvpflagged)
				usr.buku_lock = 1
				spawn(25) usr.buku_lock = 0
			usr.density = 1
			usr.doing = 0

			if(!usr.timeskipeffect)
				usr.move_delay = 0.6

			if(usr.Oozaru)
				usr.move_delay = 1.3
			usr.icon_state = ""
			return
		else
			if(usr.ftrain||usr.dtrain||usr.strain||usr.mtrain)return
			if(usr.doing)
				return
			if(usr.staminaleft+50>=usr.staminaleft_max)
				usr << output("<font color=#ff0000>You are too tired to fly!</font>","output2")
				return
			if(usr.z == 8 || usr.z == 10)
				usr << "You cannot fly while in this zone"
				return

			if(usr.pvpflagged)
				usr.staminaleft+=150
			usr.icon_state = "flight"
			usr << "You lift off the ground and take for the sky."
			usr.buku = 1
			usr.density = 0
			usr.doing = 1
			if(usr.Oozaru)
				usr.move_delay = 1
			if(!usr.pvpflagged)
				usr.move_delay=0.3
			if(usr.timeskipeffect)
				usr.move_delay=5
			return