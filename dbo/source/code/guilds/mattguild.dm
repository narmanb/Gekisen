turf
	monkpod
		icon='icons/spacepod.dmi'
		icon_state=""
		density=1
		verb
			Go_to_Earth()
				set src in view(1)
				usr.loc = locate(72,71,4)
				sleep(3424)
				usr.loc = locate(77,77,1)
	shrineenter
		icon='icons/spacepod.dmi'
		icon_state=""
		density=1
		verb
			Go_to_Shrine()
				set src in view(1)
				usr.loc = locate(56,27,23)
				sleep(2321)
				usr.loc = locate(7,125,23)