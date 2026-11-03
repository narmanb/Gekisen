mob/PC/verb/Rest()
	set category = "Training"
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Rest")
	if(src.rest_delay)
		src << output("You must wait a moment before resting again","output2")
		return
	if(src.meditating)
		return
	if(src.rest)
		src.rest_delay = 1
		src.rest = 0
		src.icon_state = ""
		src.frozen = 0
		src.doing = 0
		src << "You stop resting."
		spawn(20)src.rest_delay = 0
		return
	//if(src.kaioken)
	//	src << "You must revert from kaioken before you can rest!"
	//	return
	if(src.KO)
		return
	if(src.doing)
		return
	/*if(src.ftrain||src.dtrain||src.strain||src.mtrain)
		src<<"You are using a training technique"
		return*/


	if(!src.staminaleft)
		src << output("You are already rested.","output2")
		return
	else
//		if(src.regen)
//			usr << "You cannot rest while regenerating"
//			return
		src.rest_delay = 1
		src.rest = 1
		src.frozen = 1
		src.doing = 1
		src.icon_state = "meditate"
		src << output("<B>You sit down and rest yourself.","output2")
		spawn(15)src.rest_delay = 0
		spawn(10) src.Rest_Gain()
		return
mob/proc/Rest_Gain()
	if(!src.rest)
		return
	else
		if(src.staminaleft<=0)
			src.staminaleft = 0
			src.rest = 0
			src.icon_state = ""
			src.frozen = 0
			src.doing = 0
			src << output("<B>You are fully rested.","output2")
			sleep(50)
			src.rest_delay = 0
			return

		if(!src.rest)
			return
		else
			var/sregainmin = src.staminaleft_max/20
			var/sregainmax = src.staminaleft_max/10
			var/gains = rand(sregainmin,sregainmax)
			var/healing = round((usr.powerlevel_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
			var/healing1= round((usr.ki_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
	//		var/healing2= round((usr.kidefense_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
			var/healing3= round((usr.strength_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
			var/healing4= round((usr.defence_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
		//	var/healing5= round((usr.speed_max / 50) * (((usr.ki_control / 30)*(usr.ki_control/20))+1))
			healing = healing/5
			healing1 = healing1/5
	//		healing2 = healing2/5
			healing3 = healing3/5
			healing4 = healing4/5
			if(src.kaioken)
				gains = gains/rand(3,4)
			if(src.regen)
				gains = gains/rand(3,5)
			if(src.staminaleft > 0)
				src.staminaleft -= gains
				if(usr.powerlevel < ((usr.ki_control * usr.powerlevel_max)/100)*0.25)//  MAYBE MAKE THIS WORK IF SOMEONE IS BELOW 20%?
					usr.powerlevel += healing

				if(usr.ki < ((usr.ki_control * usr.ki_max)/100))
					usr.ki += healing1

	//			if(usr.kidefense < ((usr.ki_control * usr.kidefense_max)/100))
	//				usr.kidefense += healing2

				if(usr.strength < ((usr.ki_control * usr.strength_max)/100))
					usr.strength += healing3

				if(usr.defence < ((usr.ki_control * usr.defence_max)/100))
					usr.defence += healing4

			//	if(usr.speed < ((usr.ki_control * usr.speed_max)/100))
			//		usr.speed += healing5

				if(src.staminaleft < 0)
					src.staminaleft = 0
/*
				if(usr.ki > ((usr.ki_control * usr.ki_max)/100))
					usr.ki = ((usr.ki_control * usr.ki_max)/100)
				if(usr.kidefense > ((usr.ki_control * usr.kidefense_max)/50))
					usr.kidefense = ((usr.ki_control * usr.kidefense_max)/100)
				if(usr.strength > ((usr.ki_control * usr.strength_max)/50))
					usr.strength = ((usr.ki_control * usr.strength_max)/100)
				if(usr.defence > ((usr.ki_control * usr.defence_max)/50))
					usr.defence = ((usr.ki_control * usr.defence_max)/100)
					*/
			if(src.staminaleft <= 0)
				src.staminaleft = 0
				src.rest = 0
				src.icon_state = ""
				src.frozen = 0
				src.doing = 0
				src << output("<b>You are fully rested.","output2")
				sleep(50)
				src.rest_delay = 0
				return
			spawn(rand(4,11))src.Rest_Gain()