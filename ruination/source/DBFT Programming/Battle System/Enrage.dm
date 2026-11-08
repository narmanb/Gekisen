obj/Technique/UnleashRage
	verb
		Unleash_Rage()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Unleash Rage")
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.FuseFollower)
				return
			if(usr.in_tourney)
				usr<<"You cannot do this while in a tournament"
				return
			if(usr.kaioken)
				usr << "Your body is under too much stress!"
				return
		//	if(usr.form_2||usr.transformed)
		//		usr << "Your body is enraged from Transforming!"
		//		return
			if(usr.powering||usr.powered)
				usr << "You cannot do this while powering up or recovering from powering up!"
				return
			if(usr.rage >= 15)
				if(usr.enraged)
					usr << "You are already enraged!"
					return
				else
					usr.enraged = 1
					usr << "You feel an Uncontrollable Rage burn through your body!"
					usr.icon_state = "enrage"
					sleep(25)
					var/bonus = usr.powerlevel_max*(usr.rage / 10)
					usr.powerlevel += bonus
					if(usr.hudenabled)
						spawn() usr.updateHealth()
					usr.icon_state = ""
					sleep(300)
					usr.enraged = 0
					usr.rage = 0
					usr.powerlevel -= bonus

					if(usr.powerlevel < 1)
						usr.powerlevel = 1
					if(usr.hudenabled)
						spawn() usr.updateHealth()

					usr << "You calm down..."
			else
				usr << "You don't have enough Rage..."
				return