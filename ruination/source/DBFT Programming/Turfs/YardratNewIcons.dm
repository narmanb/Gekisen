turf/YardratIconsBW
	IconsPack2
		icon = 'YardratIconPack.dmi'
		Turf0001
			icon_state = "1"
			density = 0
		Turf0001alt
			icon_state = "1alt"
			density = 0
		Turf0002
			icon_state = "2"
			density = 1
		Turf0003
			icon_state = "3"
			density = 1
		Turf0004
			icon_state = "4"
			density = 1
		Turf0005
			icon_state = "5"
			density = 1
		Turf0006
			icon_state = "6"
			density = 1
		Turf0007
			icon_state = "7"
			density = 1
		Turf0008
			icon_state = "8"
			density = 1
		Turf0009
			icon_state = "9"
			density = 1
		Turf0010
			icon_state = "10"
			density = 1
		Turf0011
			icon_state = "11"
			density = 1
		Turf0012
			icon_state = "12"
			density = 1
		Turf0013
			icon_state = "13"
			density = 1
		Turf0014
			icon_state = "14"
			density = 1
		Turf0015
			icon_state = "15"
			density = 1
		Turf0016
			icon_state = "16"
			density = 1
		Turf0017
			icon_state = "17"
			density = 1
		Turf0018
			icon_state = "18"
			density = 1
		Turf0019
			icon_state = "19"
			density = 1
		Turf0020
			icon_state = "20"
			density = 1
		Turf0021
			icon_state = "21"
			density = 1
		Turf0022
			icon_state = "22"
			density = 1
		Turf0023
			icon_state = "23"
			density = 1
		Turf0024
			icon_state = "24"
			density = 1
		Turf0025
			icon_state = "25"
			density = 1
		Turf0026
			icon_state = "26"
			density = 1
		Turf0027
			icon_state = "27"
			density = 1
		Turf0028
			icon_state = "28"
			density = 1
		Turf0029
			icon_state = "29"
			density = 1
		Turf0030
			icon_state = "30"
			density = 1
		Turf0031
			icon_state = "31"
			density = 1
		Turf0032
			icon_state = "32"
			density = 1
		Turf0033
			icon_state = "33"
			density = 1
		Turf0034
			icon_state = "34"
			density = 1
		Turf0035
			icon_state = "35"
			density = 1
		Turf0036
			icon_state = "36"
			density = 0
			Enter(atom/movable/A)
				if(istype(A,/mob) && !A.density)
					return 1
				if(istype(A,/mob) && A.density)
					return 0
				if(istype(A,/obj/blasts))
					return 1
