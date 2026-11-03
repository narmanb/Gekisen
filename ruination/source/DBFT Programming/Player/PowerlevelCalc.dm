mob/verb/calcnewmax()
	set hidden = 1
	var/plnew = (usr.strength_max * 0.2) + (usr.ki_max * 0.2) + (usr.defence_max * 0.6)
	world << "[plnew]"
	world << "[applycommas(plnew)]"


mob/proc/calcmaxpl()
	src.powerlevel_max = (src.strength_max * 0.2) + (src.ki_max * 0.2) + (src.defence_max * 0.6)