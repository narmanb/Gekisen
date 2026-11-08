mob/var/tmp
	pvpflagged = 0 // default off, when this is on, statpanel indicator, stamina drain from zanzo etc
	pvptimer = 0 // when 0 pvpflag is taken off
	pvpflagtxt = "-----------"
mob/proc/PVPflagged(n as num)  // 6 = 50 seconds   3 for those who dont initiate it
	if(!src.pvpflagged)
		src.pvpflagged = 1
		src.pvpflagtxt = "<font color = #DC7633><b>Engaged in PVP"
		src << "<font color = #DC7633><b>You have entered into PVP"
		var/image1=icon('HudDBflagged.dmi')
		winset(src, "labelDB", "image = \ref[fcopy_rsc(image1)]")

		src.pvptimer = n
		src.PVPflagtime()
	else
		if(n > src.pvptimer)
			src.pvptimer = n

mob/proc/PVPflagtime()
	while(src.pvptimer > 0)
		if(!src)
			break
		if(src.pvptimer <= 0)
			break
		src.pvptimer--
		//world << "sleep timer [src.pvptimer]"
		sleep(100)
	var/image1=icon('HUDdb.dmi')
	winset(src, "labelDB", "image = \ref[fcopy_rsc(image1)]")

	src.pvpflagged = 0
	src << "<font color = #73C6B6><b>You are no longer flagged for PVP"
	src.pvpflagtxt = "-----------"
/*

mob/verb/testflag(mob/PC/M in world)
	var/num = input("choose num") as num
	M.PVPflagged(num)
	*/


