mob/proc/statgain()
	var/gain = rand(1,25)
	if(src.focus_boxing)
		gain -= 5
	if(gain <= 2)
		var/randstat = rand(1,3)
		if(randstat == 1)
			src.ki_bonus += 1
		if(randstat == 2)
			src.strength_bonus += 1
		if(randstat == 3)
			src.defence_bonus += 1


mob/proc/statgainmob()
	var/gain = rand(1,22)
	if(gain <= 2)
		var/randstat = rand(1,3)
		var/randgain = rand(50,100)
		if(randstat == 1)
			src.ki_bonus += randgain

		if(randstat == 2)
			src.strength_bonus += randgain

		if(randstat == 3)
			src.defence_bonus += randgain