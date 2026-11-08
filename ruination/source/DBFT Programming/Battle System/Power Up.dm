mob
	var
		powering = 0
		powered = 0
		crater_power = 0
		powerupstopoption = 1.5
		howslowpowerdown = 10

obj/Technique/PowerUp
	verb/PowerUp()
		set category = "Combat"
		set name = "Power Up"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Power Up")
		spawn() usr.calcmaxpl()
		if(usr.focus_boxing || usr.boxing)
			return
		if(usr.trans_delay)
			usr << "You cannot power up while transforming"
			return
		if(usr.enraged)
			usr << "You are enraged, you cannot power up!"
			return
		if(usr.Oozaru)
			usr << "You cannot power up while in Oozaru!"
			return
		if(usr.powering == 1)
			usr << "You stop Powering Up"
			usr.frozen = 0
			usr.powering = 0
			usr.doing = 0
			usr.buku_lock = 0
			usr.overlays -= 'Power Elec.dmi'
			usr.overlays -= 'Elec Blue Small.dmi'
			usr.overlays -= 'Elec Blue Small.dmi'
			usr.overlays -= 'Elec Blue Small.dmi'
			usr.underlays -= usr.underlays
			usr.underlays -= usr.underlays
			usr.overlays -= usr.aura
			usr.overlays -= 'Kaio Aura.dmi'
			usr.aura_on = 0
			usr.power_delay = 1
			spawn(50) usr.power_delay = 0
			spawn(50) usr.Slow_Power_DownOff()
			return

		if(usr.doing == 1)
			usr << "You are already doing something!"
			return

		if(usr.powered == 1)
			usr << "There is no reason to power up!"
			return

		if(usr.buku == 1)
			usr << "You cannot Power Up whilst flying!"
			return

		if(usr.KO == 1)
			return

		if(usr.Oozaru == 1)
			usr << "You cannot Power Up whilst in Oozaru"
			return

		if(usr.power_delay == 1)
			usr << "You must wait a moment before using Power Up again!"
			return

		if(usr.staminaleft > usr.staminaleft_max)
			usr << "You are too tired to power up!"
			return

		if(usr.kaioken == 1)
			usr << "You cannot power up while in kaioken!"
			return

			sleep(25)
			usr.power_delay = 0
			return
		else
		//	if(usr.form_1)
		//		usr<<"You can't power up while transformed"
		//		//usr.BuffReapply()
		//		return
			//if(usr.inverted == 0||usr.transformed == 0)
			if((usr.powerlevel >= (((usr.powerlevel_max * usr.ki_control)/100)*usr.powerupstopoption)) && (usr.ki >= (((usr.ki_max * usr.ki_control)/100)*usr.powerupstopoption)))
				usr << "Theres no reason to Power Up!"
				return
			else
				usr.power_delay = 1
				usr.frozen = 1
				usr.powering = 1
				usr.doing = 1
				usr.buku_lock = 1
				usr.icon_state = "enrage"

				view(10) << "<font color=blue><b>[usr] begins to focus their power..</font>"
				usr.Put_Aura()
				usr.overlays += 'Power Elec.dmi'
				usr.aura_on = 1
//				bump
				for(var/mob/M in view(10))
					if(usr.powerlevel >= (M.powerlevel * 2) && !M.isgravmachine)

						var/FallDir = get_dir(usr,M)
						usr.dir = FallDir
						step(M,FallDir)
						switch(FallDir)
							if(NORTH)M.dir = SOUTH
							if(NORTHWEST)M.dir = SOUTHEAST
							if(WEST)M.dir = EAST
							if(SOUTHWEST)M.dir = NORTHEAST
							if(SOUTH)M.dir = NORTH
							if(SOUTHEAST)M.dir = NORTHWEST
							if(EAST)M.dir = WEST
							if(NORTHEAST)M.dir = SOUTHWEST

				usr.Powering_Up()
				if(usr.powerlevel >= 10000000 && usr.powerlevel <= 100000000)
					usr.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(usr.loc,1,3))
		//			for(var/atom/A in range(1,usr))
		//				if(isturf(A))
		//					A.overlays += 'explosion.dmi'
		//					spawn(4) A.overlays -= 'explosion.dmi'
		//					//flick('explosion.dmi',A)
		//					continue
				sleep(25)
				usr.power_delay = 0
				sleep(30)
				if(usr.powerlevel >= 100000000)
					usr.BlueLightningEffect()

					Explode(new /Effect/BasicBoom(usr.loc,1,5))
				sleep(30)
				if(usr.powerlevel >= 1000000000)
					usr.BlueLightningEffect()
					Explode(new /Effect/BasicBoom(usr.loc,1,7))


			//	if(usr.powering == 1)
			//		goto bump
/*			else
				if((usr.powerlevel >= ((((usr.powerlevel_max * usr.ki_control)/100)*usr.power_maxm)*1.5)) && (usr.ki >= ((((usr.powerlevel_max * usr.ki_control)/100)*usr.ki_maxm)*1.5)))
					usr << "There's no reason to Power Up!"
					return
				else
					usr.power_delay = 1
					usr.frozen = 1
					usr.powering = 1
					usr.doing = 1
					usr.buku_lock = 1
					usr.icon_state = "enrage"
					usr << "You begin to focus your power.."
					usr.underlays += usr.aura
					usr.overlays += 'Power Elec.dmi'
					usr.aura_on = 1

					for(var/mob/M in view(8))
						if(usr.powerlevel >= (M.powerlevel * 10))

							var/FallDir = get_dir(usr,M)
							usr.dir = FallDir
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST

					usr.Powering_Up()
					if(usr.powerlevel >= 100000000 && usr.powerlevel <= 1000000000)
						usr.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(usr.loc,1,3))
					sleep(25)
					usr.power_delay = 0
					sleep(30)
					if(usr.powerlevel >= 1000000000)
						usr.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(usr.loc,1,5))
					sleep(30)
					if(usr.powerlevel >= 10000000000)
						usr.BlueLightningEffect()
						Explode(new /Effect/BasicBoom(usr.loc,1,7))
*/
mob
	proc
		Powering_Up()

			var/healing = round((usr.powerlevel_max / 150) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			var/healing1= round((usr.ki_max / 150) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			//var/healing2= round((usr.kidefense_max / 150) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			var/healing3= round((usr.strength_max / 150) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			var/healing4= round((usr.defence_max / 150) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			//var/healing5= round((usr.speed_max / 75) * (((usr.ki_control / 30)*(usr.ki_control/10))+1))
			if(usr.pvpflagged)
				healing = healing/2
				healing1 = healing1/2
				//healing2 = healing2/2
				healing3 = healing3/2
				healing4 = healing4/2
			if(usr.z == 8)
				healing = healing*0.25
				healing1 = healing1*0.25
				//healing2 = healing2*0.25
				healing3 = healing3*0.25
				healing4 = healing4*0.25
			else
				healing = healing*0.60
				healing1 = healing1*0.60
				//healing2 = healing2*0.75
				healing3 = healing3*0.60
				healing4 = healing4*0.60

			if(usr.powering == 0)
				usr.icon_state = ""
				usr.frozen = 0
				usr.doing = 0
				usr.buku_lock=0
				sleep(50)
				return
				//if((usr.powerlevel >= ((((usr.powerlevel_max*usr.ki_control)/100)*1.1) && (usr.ki >= ((usr.ki_max*usr.ki_control)/100)*1.1)
			//	if(usr.powerlevel >= ((usr.powerlevel_max*usr.ki_control)/100)*1.1 && (usr.ki >= ((usr.ki_max*usr.ki_control)/100)*1.1))
			//if(usr.powerlevel >= ((usr.powerlevel_max*usr.ki_control)/100)*usr.powerupstopoption) // && usr.ki >= ((usr.ki_max*usr.ki_control)/100)*2)
			if((src.powerlevel >= (src.powerlevel_max*src.ki_control)/100)*usr.powerupstopoption && (src.ki >= (src.ki_max*src.ki_control)/100)*usr.powerupstopoption)
				view(10) << "<font color=blue><b>[usr] explodes into Maximum Power!</font>"
				usr.powerlevel = ((usr.powerlevel_max*usr.ki_control)/100)*usr.powerupstopoption
				usr.ki = ((usr.ki_max*usr.ki_control)/100)*usr.powerupstopoption
			//	usr.kidefense = ((usr.kidefense_max*usr.ki_control)/100)*1.5
				usr.strength = ((usr.strength_max*usr.ki_control)/100)*usr.powerupstopoption
				usr.defence = ((usr.defence_max*usr.ki_control)/100)*usr.powerupstopoption
				//usr.speed = ((((usr.speed_max*usr.ki_control)/100)*usr.speed_maxm)*1.5)
				usr.overlays -= 'Power Elec.dmi'
				usr.overlays += 'Elec Blue Small.dmi'
				usr.frozen = 0
				usr.powering = 0
				usr.powered = 1
				usr.doing = 0
				usr.buku_lock = 0
				usr.icon_state = ""
				usr.power_delay = 1
				if(usr.powerupstopoption == 1)
					usr.powerlevel = round((usr.powerlevel_max*usr.ki_control)/100)
					usr.ki = round((usr.ki_max*usr.ki_control)/100)
					usr.strength = round((usr.strength_max*usr.ki_control)/100)
					usr.defence = round((usr.defence_max*usr.ki_control)/100)
					usr.Power_Down_Check()
					spawn(55) usr.power_delay = 0
					return
				//spawn(100+(usr.ki_control*usr.howslowpowerdown)) usr.Slow_Power_Down()
				if(usr.hudenabled)
					spawn() usr.updateHealth()
					spawn() usr.updateki()
				if(usr.howslowpowerdown < 5)
					spawn((usr.ki_control*usr.howslowpowerdown)/2) usr.Slow_Power_Down()
				else
					spawn(usr.ki_control*usr.howslowpowerdown) usr.Slow_Power_Down()
				sleep(200)
				//sleep(300)
				usr.power_delay = 0
				return
			else
				//world << "TEST1  [applycommas(healing)]   [applycommas(healing*8)]"

				//view(10) << "<font color=blue><i>[usr]s power is increasing!</font>"
				if(usr.powerlevel < ((usr.powerlevel_max*usr.ki_control)/100)*usr.powerupstopoption)
					usr.powerlevel += (healing * usr.powerupstopoption)
				if(usr.ki < ((usr.ki_max*usr.ki_control)/100)*usr.powerupstopoption)
					usr.ki += (healing1 * usr.powerupstopoption)
			//	if(usr.kidefense < ((usr.kidefense_max*usr.ki_control)/100)*2)
			//		usr.kidefense += (healing2 * 1.5)
				if(usr.strength < ((usr.strength_max*usr.ki_control)/100)*usr.powerupstopoption)
					usr.strength += (healing3 * usr.powerupstopoption)
				if(usr.defence < ((usr.defence_max*usr.ki_control)/100)*usr.powerupstopoption)
					usr.defence += (healing4 * usr.powerupstopoption)
				//if(usr.speed < (((usr.speed_max*usr.ki_control)/100)*usr.speed_maxm)*1.5))
				//	usr.speed += (healing5 * usr.speed_maxm)
				usr.ki_con_exp += round((usr.level/500)+5)
				usr.Ki_Con_Level()
				if(usr.hudenabled)
					spawn() usr.updateHealth()
					spawn() usr.updateki()
				spawn(12) usr.Powering_Up()
				return
		/*
			else
				if((usr.powerlevel >= (((usr.powerlevel_max * usr.ki_control)/100)*5)) && (usr.ki >= (((usr.ki_max * usr.ki_control)/100)*5)))
					view(8) << "<font color=blue>[usr] explodes into Maximum Power!</font>"
					usr.powerlevel = round(((usr.powerlevel_max * usr.ki_control)/1+00)*5)
					usr.ki = round(((usr.ki_max * usr.ki_control)/100)*5)
					usr.kidefense = round(((usr.kidefense_max * usr.ki_control)/100)*5)
					usr.strength = round(((usr.strength_max * usr.ki_control)/100)*5)
					usr.defence = round(((usr.defence_max * usr.ki_control)/100)*5)
					usr.speed = round(((usr.speed_max * usr.ki_control)/100)*5)
					usr.overlays -= 'Power Elec.dmi'
					usr.overlays += 'Elec Blue Small.dmi'
					usr.frozen = 0
					usr.powering = 0
					usr.powered = 1
					usr.doing = 0
					usr.buku_lock = 0
					usr.icon_state = ""
					usr.power_delay = 1
					spawn(300+(usr.ki_control*10)) usr.Slow_Power_Down()
					sleep(300)
					usr.power_delay = 0
					return
				else
					if(usr.powerlevel < round(((usr.powerlevel_max * usr.ki_control)/100)*5))
						usr.powerlevel += healing
					if(usr.ki < round(((usr.ki_max * usr.ki_control)/100)*5))
						usr.ki += healing1
					if(usr.kidefense < round(((usr.kidefense_max * usr.ki_control)/100)*5))
						usr.kidefense += healing2
					if(usr.strength < round(((usr.strength_max * usr.ki_control)/100)*5))
						usr.strength += healing3
					if(usr.defence < round(((usr.defence_max * usr.ki_control)/100)*5))
						usr.defence += healing4
					if(usr.speed < round(((usr.speed_max * usr.ki_control)/100)*5))
						usr.speed += healing5
					usr.ki_con_exp += round((usr.level/500)+5)
					usr.Ki_Con_Level()
					spawn(12) usr.Powering_Up()
					return
					*/

	proc
		Slow_Power_Down()
			if(usr.powering == 1)
				return
			if(powered == 0)
				return
		//	if(usr.inverted == 0 || usr.transformed == 0)

			if(usr.powerlevel <= ((usr.ki_control * usr.powerlevel_max)/100) && usr.ki <= ((usr.ki_control * usr.ki_max)/100))
			//	usr << "<font color = red>Slow Power Down<b>ONE"
				usr.Power_Down_Check()
				return
			else
			//	usr << "<font color = red>Slow Power Down<b>TWO"
				if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100))
					usr.powerlevel -= round(usr.powerlevel_max / 40)

				if(usr.ki >= ((usr.ki_control * usr.ki_max)/100))
					usr.ki -= round(usr.ki_max/40)

			//	if(usr.kidefense >= ((usr.ki_control * usr.kidefense_max)/100))
			//		usr.kidefense -= round(usr.kidefense_max/40)

				if(usr.strength >= ((usr.ki_control * usr.strength_max)/100))
					usr.strength -= round(usr.strength_max/40)

				if(usr.defence >= ((usr.ki_control * usr.defence_max)/100))
					usr.defence -= round(usr.defence_max/40)

				//if(usr.speed >= ((usr.ki_control * usr.speed_max)/100))
				//	usr.speed -= round(usr.speed_max/40)
				if(usr.hudenabled)
					spawn() usr.updateHealth()
					spawn() usr.updateki()
				spawn(25+usr.howslowpowerdown) usr.Slow_Power_Down()


		Slow_Power_DownOff()
		//	if(usr.powering == 1)
		//		return
		//	if(powered == 0)
		//		return
		//	if(usr.inverted == 0 || usr.transformed == 0)

			if(usr.powerlevel <= ((usr.ki_control * usr.powerlevel_max)/100) && usr.ki <= ((usr.ki_control * usr.ki_max)/100))
			//	usr << "<font color = red>Slow Power Down<b>ONE"
				usr.Power_Down_Check()
				return
			else
			//	usr << "<font color = red>Slow Power Down<b>TWO"
				if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100))
					usr.powerlevel -= round(usr.powerlevel_max / 40)

				if(usr.ki >= ((usr.ki_control * usr.ki_max)/100))
					usr.ki -= round(usr.ki_max/40)

		//		if(usr.kidefense >= ((usr.ki_control * usr.kidefense_max)/100))
		//			usr.kidefense -= round(usr.kidefense_max/40)

				if(usr.strength >= ((usr.ki_control * usr.strength_max)/100))
					usr.strength -= round(usr.strength_max/40)

				if(usr.defence >= ((usr.ki_control * usr.defence_max)/100))
					usr.defence -= round(usr.defence_max/40)

				//if(usr.speed >= ((usr.ki_control * usr.speed_max)/100))
				//	usr.speed -= round(usr.speed_max/40)
				//spawn(1) usr.BuffReapply()
				spawn(30) usr.Slow_Power_DownOff()


/*	proc
		Slow_Power_Up()
			if(usr.powering == 1)
				return
			if(usr.transformed == 0 || usr.inverted == 0)
				if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100) && usr.ki >= ((usr.ki_control * usr.ki_max)/100))
					return
				else
					usr.powerlevel +=

*/

	proc
		Power_Down_Check()
/*			if(usr.transformed == 1||usr.inverted == 1)
				if((usr.powerlevel <= ((((usr.powerlevel_max*usr.ki_control)/100)*usr.power_maxm)*1.5)) && (usr.ki <= ((((usr.ki_max*usr.ki_control)/100)*usr.ki_maxm)*1.5)))
					usr.overlays -= 'Elec Blue Small.dmi'
					usr.overlays -= 'Elec Blue Small.dmi'
					usr.overlays -= 'Elec Blue Small.dmi'
					usr.underlays -= usr.underlays
					usr.underlays -= usr.underlays
					usr.overlays -= usr.aura
					usr.powered = 0
					usr.aura_on = 0
					usr.powerlevel = (((usr.powerlevel_max*usr.ki_control)/100)*usr.power_maxm)
					usr.ki = (((usr.ki_max*usr.ki_control)/100)*usr.ki_maxm)
					usr.kidefense = (((usr.kidefense_max*usr.ki_control)/100)*usr.kidefense_maxm)
					usr.strength = (((usr.strength_max*usr.ki_control)/100)*usr.strength_maxm)
					usr.defence = (((usr.defence_max*usr.ki_control)/100)*usr.defence_maxm)
					usr.speed = (((usr.speed_max*usr.ki_control)/100)*usr.speed_maxm)
					usr << "You are now at your base power."
					return
			else*/

			if(usr.powerlevel <= ((usr.powerlevel_max*usr.ki_control)/100) && usr.ki <= ((usr.ki_max*usr.ki_control)/100))

				usr.overlays -= 'Elec Blue Small.dmi'
				usr.overlays -= 'Elec Blue Small.dmi'
				usr.overlays -= 'Elec Blue Small.dmi'
				usr.underlays -= usr.underlays
				usr.underlays -= usr.underlays
				usr.overlays -= usr.aura
				usr.overlays -= 'Kaio Aura.dmi'
				usr.aura_on = 0
				usr.powered = 0
				usr.powering = 0  //added this
				/*
				usr.powerlevel = round((usr.powerlevel_max*usr.ki_control)/100)
				usr.ki = round((usr.ki_max*usr.ki_control)/100)
				usr.kidefense = round((usr.kidefense_max*usr.ki_control)/100)
				usr.strength = round((usr.strength_max*usr.ki_control)/100)
				usr.defence = round((usr.defence_max*usr.ki_control)/100)
				//usr.speed = round((usr.speed_max*usr.ki_control)/100)
				*/

				if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100)*0.9)
					usr.powerlevel = round((usr.powerlevel_max*usr.ki_control)/100)

				if(usr.ki >= ((usr.ki_control * usr.ki_max)/100)*0.9)
					usr.ki = round((usr.ki_max*usr.ki_control)/100)

			//	if(usr.kidefense >= ((usr.ki_control * usr.kidefense_max)/100)*0.9)
			//		usr.kidefense = round((usr.kidefense_max*usr.ki_control)/100)

				if(usr.strength >= ((usr.ki_control * usr.strength_max)/100)*0.9)
					usr.strength = round((usr.strength_max*usr.ki_control)/100)

				if(usr.defence >= ((usr.ki_control * usr.defence_max)/100)*0.9)
					usr.defence = round((usr.defence_max*usr.ki_control)/100)
				usr << "<font color=blue><b>You are now at your base power"
				if(usr.hudenabled)
					spawn() usr.updateHealth()
					spawn() usr.updateki()

				if(usr.transformed||usr.inverted) usr.BuffReapply()
				return



