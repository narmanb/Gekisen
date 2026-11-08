mob/var/learn_powerdown = 0
obj/Technique/PowerDown
	verb/Power_Down()
		set category = "Combat"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Power Down")

		if(usr.doing == 1)
			usr << "You are already doing something!"
			return

		if(usr.buku == 1)
			usr << "You cannot Power Down whilst flying!"
			return

		if(usr.KO == 1)
			return

		if(usr.Oozaru == 1)
			usr << "You cannot Power Down whilst in Oozaru"
			return
		if(usr.powering||usr.powered)
			usr << "You cannot do this after recently powering up you must wait a bit"
			return
		if(usr.powerlevel <= 0)
			usr << "You are too weak to Power Down!"
			return
		usr.doing=1
		var/power_down = input("What percentage do you wish to power down to?")as num
		//if(!power_down)
		//	usr.doing = 0
		//	return

		if(usr.powering||usr.powered)
			usr << "You cannot do this after recently powering up you must wait a bit"
			usr.doing = 0
			return
		if(power_down <= 0)
			usr << "You cannot Power Down that much!"
			usr.doing=0
			return
		usr.frozen = 1
//		if(power_down >= usr.powerlevel)
//			usr << "You must Power Up for that!"
//			usr.doing=0
//			returnp


		//		if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100)*0.9)
		//			usr.powerlevel = round((usr.powerlevel_max*usr.ki_control)/100)
		usr.doing = 0
		//var/plget = round(usr.powerlevel/usr.powerlevel_max*100)
		var/plget = round(usr.powerlevel_max*usr.ki_control)/100 * (power_down/100)
		var/kiget = round(usr.ki_max*usr.ki_control)/100 * (power_down/100)
		var/strget = round(usr.strength_max*usr.ki_control)/100 * (power_down/100)
		var/defget = round(usr.defence_max*usr.ki_control)/100 * (power_down/100)
	//	world << "plget [plget]"
	//	world << "pl * plget [applycommas(usr.powerlevel * plget)]"
	//	world << "[applycommas((usr.powerlevel_max*usr.ki_control)/100)]"
		//if(usr.powerlevel * plget < ((usr.powerlevel_max*usr.ki_control)/100))
		var/loweredpower = 0
		if(plget < usr.powerlevel)
		//	usr << "PL before: [applycommas(usr.powerlevel)]    plget [plget]"
			//usr.powerlevel = (usr.powerlevel * (usr.powerlevel_max*usr.ki_control)/100)*plget
			usr.powerlevel = plget
			loweredpower++
		//	usr << "PL after: [applycommas(usr.powerlevel)]    plget [plget]"
		if(kiget < usr.ki)
			usr.ki = kiget
			loweredpower++
		if(strget < usr.strength)
			usr.strength = strget
			loweredpower++
		if(defget < usr.defence)
			usr.defence = defget
			loweredpower++
		if(loweredpower == 0)
			usr << "You can't power down any further!"
			usr.doing = 0
			usr.frozen = 0
			return
	//	f(power_down < usr.powerlevel)
	//		usr << "You lower your Powerlevel and Ki to \white[num2text(power_down,1000)]"

		usr.icon_state = "enrage"
		usr.underlays -= usr.underlays
		usr.overlays -= usr.aura
		usr.overlays -= 'Kaio Aura.dmi'
		usr.aura_on = 0
		view(20) << "\white a Powerlevel drops in the Distance"
		if(usr.hudenabled)
			spawn() usr.updateHealth()
			spawn() usr.updateki()
		sleep(25)
		usr.powered = 0
	//	usr.powerlevel = power_down
	//	if(usr.ki < power_down &&
	//	usr.ki = power_down
	//	usr.strength = power_down
	//	usr.defence = power_down
	//	usr.kidefense = power_down
		usr.frozen = 0
		usr.icon_state = ""
		//sleep(40)
		usr.doing=0
	//	usr.Power_Down_Check()
//		usr.powerlevel = power_down
//		usr.ki = power_down



mob
	proc
		powerdown(n as num)
			var/pldown = (src.powerlevel_max*n)/100
			var/kidown = (src.ki_max*n)/100
			var/kidefdown = (src.kidefense_max*n)/100
			var/strdown = (src.strength_max*n)/100
			var/defdown = (src.defence_max*n)/100
			src.powerlevel = pldown
			src.ki = kidown
			src.kidefense = kidefdown
			src.strength = strdown
			src.defence = defdown
			if(src.hudenabled)
				spawn() src.updateHealth()
				spawn() src.updateki()