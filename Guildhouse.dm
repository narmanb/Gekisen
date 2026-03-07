turf
	Seedtile
		icon = 'SeeD.dmi'
		icon_state = "Fancytile"
		density = 0
turf
	dw2
		icon= 'DW2.dmi'
		density=0
turf
	seedwater1
		icon = 'SeeDturfs.dmi'
		icon_state = "a"
		density = 1

turf
	seedwater2
		icon = 'SeeDturfs.dmi'
		icon_state = "b"
		density = 1

turf
	SeeD
		icon = 'SeeD.dmi'
		icon_state = "SeeD"
		density = 0

turf
	Seedwall
		icon = 'SeeD.dmi'
		icon_state = "wall"
		density = 1

turf
	stopper1
		icon = 'SeeDturfs.dmi'
		icon_state = "1"
		density = 1


turf
	stopper2
		icon = 'SeeDturfs.dmi'
		icon_state = "2"
		density = 1

turf
	stopper3
		icon = 'SeeDturfs.dmi'
		icon_state = "3"
		density = 1

turf
	stopper4
		icon = 'SeeDturfs.dmi'
		icon_state = "4"
		density = 1



turf
	SeedStair
		icon = 'SeeDturfs.dmi'
		icon_state = "stair"
		density = 0

obj
	GardenMap
		icon = 'SeeDturfs.dmi'
		icon_state = "0"
		density = 1
		verb
			Look()
				set src in oview(1)
				set category = "Communication"
				set name = "Read"
				alert("'Welcome to Gekisen Garden,  Where you are treated as a member, not a number.' - Headmaster")
				alert("Guild house created by 'Gunblader'")
				usr << "North - Barber and shops"
				sleep(10)
				usr << "East - Newb training room and Kaioshins Gravity Emulator"
				sleep(10)
				usr << "West - SeeD training room and G4 Chamber"
obj
	DSMMap
		icon = 'SeeDturfs.dmi'
		icon_state = "0"
		density = 1
		verb
			Look()
				set src in oview(1)
				set category = "Communication"
				set name = "Read"
				alert("Welcome To Dark Side Mafia,If You Need Assistants Ask Souljah Represent or Mystic AKA Magnum")
obj
	Order_Of_Chaos
		icon = 'SeeDturfs.dmi'
		icon_state = "0"
		density = 1
		verb
			Look()
				set src in oview(1)
				set category = "Communication"
				set name = "Read"
				alert("Welcome To Order Of Chaos... Owner: Koyoto")
obj
	Blood_Bandits
		icon = 'SeeDturfs.dmi'
		icon_state = "0"
		density = 1
		verb
			Look()
				set src in oview(1)
				set category = "Communication"
				set name = "Read"
				alert("Welcome Blood Bandit,.. Owner: Skyler")

