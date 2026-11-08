turf
	name = ""
turf
	var
		ack
turf
	turf
		icon='newhouse.dmi'
		sidewalk1
			icon_state="sidewalk1"
		sidewalk2
			icon_state="sidewalk2"
		sidewalk3
			icon_state="sidewalk3"
		sidewalk4
			icon_state="sidewalk4"
		sidewalk5
			icon_state="sidewalk5"
		sidewalk6
			icon_state="sidewalk6"
		road
			icon_state="road"
		sidewalk7
			icon_state="sidewalk7"
		sidewalk8
			icon_state="sidewalk8"
		sidewalk9
			icon_state="sidewalk9"
		sidewalk10
			icon_state="sidewalk10"
		sidewalk11
			icon_state="sidewalk11"
		sidewalk12
			icon_state="sidewalk12"
		road2grass1
			icon_state="road2grass1"
		road2grass2
			icon_state="road2grass2"
		road2grass3
			icon_state="road2grass3"
		road2grass4
			icon_state="road2grass4"
		road2grass5
			icon_state="road2grass5"
		road2grass6
			icon_state="road2grass6"
		road2grass7
			icon_state="road2grass7"
		road2grass8
			icon_state="road2grass8"

turf
	loginscreen
		icon = 'dbzslog2.bmp'
		layer = MOB_LAYER + 99999999999999999999999999999
	bigbuildingbottom
		icon = 'bigbottom.bmp'
		density = 1
	bigbuildingtop
		icon = 'bigtop.bmp'
		density = 0
		layer = MOB_LAYER + 99999999999999999999999999999
	tourneyturf1
		density = 1
		Entered(mob/characters/M in view(2))
			if(usr.enterdintourney == 1 && M.enterdintourney == 1)
				usr.loc = locate(75,56,1)
				usr.enterdintourney = 0
				usr.intourney = 0
				M.loc = locate(75,56,1)
				M.zenni += 2000
				M.enterdintourney = 0
				M.intourney = 0
				M.verbs += /mob/verb/Finish
				usr.verbs += /mob/verb/Finish
				M<<alert("You won from a ringout! You gain 2000 Zenni!")


	tourneyturf
		Entered()
			usr.ocontents = usr.contents
			usr.verbs -= /mob/verb/Finish
			usr.fly = 0
			if(usr.enterdintourney==1)
				if(usr.intourney == 1)
					return
				else
					usr.loc = locate(76,64,1)
					world<<"<I>[usr.name] has entered the tournament"
					usr.intourney = 1
					usr.verbs += new /mob/training/verb/Punch
					usr.verbs += new /mob/training/verb/Kick
					usr.verbs += new /mob/training/verb/Kiblast
					usr.verbs += new /mob/training/verb/Block
		Exited()
			if(usr.enterdintourney == 0)
				usr.contents = usr.ocontents
				usr.fly = 1
				usr.verbs -= new /mob/training/verb/Punch
				usr.verbs -= new /mob/training/verb/Kick
				usr.verbs -= new /mob/training/verb/Kiblast
				usr.verbs -= new /mob/training/verb/Block

				usr.verbs += /mob/verb/Finish
	newsstand
		icon = 'Newsstand.bmp'
		density = 1
	house1
		icon = 'house.bmp'
		density = 1
	house2
		icon = 'house2.bmp'
	house3
		icon = 'house3.bmp'
		density = 1
	housepart3
		icon = 'house3.bmp'
		density = 0
		layer = MOB_LAYER + 9999999999999999999999999
	building1
		icon = 'top.bmp'
		density = 0
		layer = MOB_LAYER + 9999999999999999999999999
	building2
		icon = 'bottom.bmp'
		density = 0
		layer = MOB_LAYER + 9999999999999999999999999
	computers
		icon = 'Atm.dmi'
		density = 1
		Click()
			if(src in view(1))
				switch(input("What do you wish to do?") in list("View Website","Edit Corner","Edit Clan Corner"))
					if("View Clan Corner")
						usr.Loadclanpage()
					if("Edit Clan Corner")
						if(usr.clanmember == "")
							usr<< "You need to be in a clan"
						else
							usr.clancorner = input(usr,"What do you wish to write in your clan corner. You may use HTML (<br> and <p> to skip lines)","Clan Corner Edit",usr.clancorner) as message

			else
				usr << "You must stand in front of the ATM to use it!"

	sfac
		icon = 'sfac.bmp'
		density = 1
	monastery
		icon = 'monastery.bmp'
		density = 1
turf/better
	icon = 'turfs7.dmi'
	turf1
		icon_state="0,5"
	turf2
		icon_state="1,5"
	turf3
		icon_state="0,6"
	turf4
		icon_state="1,6"
	turf5
		icon_state="0,50"
		density=1
	turf6
		icon_state="1,50"
		density=1
	turf7
		icon_state="2,50"
		density=1
	turf8
		icon_state="0,51"
		density=1
		var/pk = 0
	turf9
		icon_state="2,51"
		density=1
	turf10
		icon_state="2,52"
		density=1
	turf11
		icon_state="0,52"
		density=1
	turf12
		icon_state="0,53"
		density=1
	turf13
		icon_state="1,53"
		density=1
	turf14
		icon_state="2,53"
		density=1
	light
		icon_state="light"
		layer = MOB_LAYER + 99999999999999999999
	turf15
		icon_state="0,57"
		layer = MOB_LAYER + 99999999999999999999
	turf16
		icon_state="0,56"
		density = 1
		var/pk = 0
	turf17
		icon_state="6,58"
		density = 1
	turf18
		icon_state="5,58"
		density = 1
	turf19
		icon_state="6,59"
		layer = MOB_LAYER + 99999999999999999999
	turf20
		icon_state="5,59"
		layer = MOB_LAYER + 99999999999999999999
	turf21
		icon_state="2,82"
	turf22
		icon_state="3,83"
	turf23
		icon_state="5,257"
	turf24
		icon_state="2,49"
		density=1
	turf25
		icon_state="0,49"
		density = 1
	turf26
		icon_state="1,49"
		density=1
	turf4_28
		icon_state="4,28"
	turf5_28
		icon_state="5,28"
	turf6_28
		icon_state="6,28"
	turf0_35
		icon_state="0,35"
	turf1_35
		icon_state="1,35"
	turf2_35
		icon_state="2,35"
	turf6_27
		icon_state="6,27"
	turf5_27
		icon_state="5,27"
	turf4_27
		icon_state="4,27"
	turf4_26
		icon_state="4,26"
	turf5_26
		icon_state="5,26"
	turf6_26
		icon_state="6,26"
	turf0_37
		icon_state="0,37"
	turf1_37
		icon_state="1,37"
	turf2_37
		icon_state="2,37"
	turf0_36
		icon_state="0,36"
	turf2_36
		icon_state="2,36"
	turf1_36
		icon_state="1,36"
	turf4_36
		icon_state="4,36"
	turf5_35
		icon_state="5,35"
	turf4_35
		icon_state="4,35"
	turf5_34
		icon_state="5,34"
	turf6_29
		icon_state="6,29"
		density=1
	turf5_29
		icon_state="5,29"
	turf3_26
		icon_state="3,26"
	turf2_26
		icon_state="2,26"
	turf5_46
		icon_state="5,46"
	turf2_44
		icon_state="2,44"
	turf6_51
		icon_state="6,51"
	turf5_175
		icon_state="5,175"
	turf0_183
		icon_state="0,183"
	turf4_182
		icon_state="4,182"
		density=1
	turf1_182
		icon_state="1,182"
	turf0_182
		icon_state="0,182"
	turf0_184
		icon_state="0,184"
		density=1
	turf3_228
		icon_state="3,228"
		density=1
	turf4_229
		icon_state="4,229"
	turf5_229
		icon_state="5,229"
	turf6_229
		icon_state="6,229"
	turf4_230
		icon_state="4,230"
	turf5_230
		icon_state="5,230"
	turf6_230
		icon_state="6,230"
	turf0_4
		icon_state="0,4"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf1_4
		icon_state="1,4"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf2_4
		icon_state="2,4"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf3_4
		icon_state="3,4"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf4_4
		icon_state="4,4"
		density=1
	turf5_4
		icon_state="5,4"
		density=1
	turf2_5
		icon_state="2,5"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf3_5
		icon_state="3,5"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf4_5
		icon_state="4,5"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf5_5
		icon_state="5,5"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf2_6
		icon_state="2,6"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf3_6
		icon_state="3,6"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf4_6
		icon_state="4,6"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf5_6
		icon_state="5,6"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf2_7
		icon_state="2,7"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf3_7
		icon_state="3,7"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf4_7
		icon_state="4,7"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
	turf5_7
		icon_state="5,7"
		layer = MOB_LAYER + 999999999999999999999999999999999999999
turf/lighting
	turfs3

turf
	redblue
		icon = 'turfs.dmi'
		icon_state = "redblue"
	flag
		icon = 'turfs.dmi'
		icon_state = "flag"
		density = 1
		verb
			Salute()
				set category = "Fighting"
				set src in oview(1)
				view(6) << "<font color = red>[usr]<font color = white> salutes</font color = blue> to<font color = red> the <font color = white>American<font color = blue> flag<font color = white>."
	mallsign
		icon = 'mall.bmp'
		layer = MOB_LAYER + 9999999999999999999999999999999999999999999999999999999999999999999999
	mallenter
		icon = 'turfs.dmi'
		icon_state = "door"
		layer = MOB_LAYER + 9999999999999999999999999999999999999999999999999999999999999999999999999999
		Enter()
			usr.loc = locate(/turf/mallexit)
			alert("Welcome to the Mall! You may also find some teachers here as well.... they want to advertise as much as possible I guess.")
	mallexit
		Enter()
			usr.loc = locate(/turf/mallenter)
			usr.loc = locate(usr.x,usr.y-1,usr.z)
			alert("Come again!")
	mallelevator
		icon = 'turfs.dmi'
		icon_state = "comp"
		density = 1
		Click()
			if(usr.loc == locate(67,11,9))
				switch(alert("What floor do you want to go to?","Elevator","2nd","3rd","Top"))
					if("2nd")
						usr.loc = locate(67,30,9)
					if("3rd")
						usr.loc = locate(67,49,9)
					if("Top")
						usr.loc = locate(67,68,9)
				return
			if(usr.loc == locate(67,30,9))
				switch(alert("What floor do you want to go to?","Elevator","1st","3rd","Top"))
					if("1st")
						usr.loc = locate(67,11,9)
					if("3rd")
						usr.loc = locate(67,49,9)
					if("Top")
						usr.loc = locate(67,68,9)
				return
			if(usr.loc == locate(67,49,9))
				switch(alert("What floor do you want to go to?","Elevator","1st","2nd","Top"))
					if("1st")
						usr.loc = locate(67,11,9)
					if("2nd")
						usr.loc = locate(67,30,9)
					if("Top")
						usr.loc = locate(67,68,9)
				return
			else
				switch(alert("What floor do you want to go to?","Elevator","1st","2nd","3rd"))
					if("1st")
						usr.loc = locate(67,11,9)
					if("2nd")
						usr.loc = locate(67,30,9)
					if("3rd")
						usr.loc = locate(67,49,9)
				return

	nofly
		Enter()
			usr.flight = 0
			usr.fly = 0
			usr.density = 1
			usr.icon_state = ""
			return 1
		Exit()
			usr.fly = 1
	pole
		icon = 'turfs.dmi'
		icon_state = "pole"
		density = 1
		verb
			Salute()
				set category = "Fighting"
				view(6) << "<font color = red>[usr]<font color = white> salutes</font color = blue> to<font color = red> the <font color = white>American<font color = blue> flag<font color = white>."
	grass
		icon = 'turfs.dmi'
		icon_state = "grass" //Summer Time
		//icon_state = "snow"  //Winter Time
		density = 0
	buildingtop
		icon = 'turfs.dmi'
		icon_state = "buildingtop"
		density = 1
		opacity = 0
	Bridge1
		icon = 'turfs7.dmi'
		icon_state = "bridge1"
		density = 1
	Bridge2
		icon = 'turfs7.dmi'
		icon_state = "bridge2"
		density = 1
	Bridge3
		icon = 'turfs7.dmi'
		icon_state = "bridge3"
		density = 1
	Rakuraienter
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(usr.clanmember == "Rakurai")
				usr.loc = locate(30,125,12)
				usr << "Welcome home Man."
			else
				usr<< "You are not welcome here"
	Rakuraiexit
		density = 0
		Enter()
			usr.loc = locate(16,75,1)
			usr << "See ya latta Man."
	cantsee
		icon='turfs.dmi'
		icon_state = "cantsee"
		layer = TURF_LAYER
	Bridge4
		icon = 'turfs7.dmi'
		icon_state = "bridge4"
		density = 1
	Bridge
		icon = 'turfs7.dmi'
		icon_state = "bridge"
	Wall
		icon = 'turfs7.dmi'
		icon_state = "wall"
		density = 1
	Wall1
		icon = 'turfs7.dmi'
		icon_state = "wall1"
		density = 1
	Wall2
		icon = 'turfs7.dmi'
		icon_state = "wall2"
		density = 1
	Wall3
		icon = 'turfs7.dmi'
		icon_state = "wall3"
		density = 1
	Wall4
		icon = 'turfs7.dmi'
		icon_state = "wall4"
		density = 1
	Wall5
		icon = 'turfs7.dmi'
		icon_state = "wall5"
		density = 1
	Wall6
		icon = 'turfs7.dmi'
		icon_state = "wall6"
		density = 1
	Wall7
		icon = 'turfs7.dmi'
		icon_state = "wall7"
		density = 1
	Cliff
		icon = 'turfs7.dmi'
		icon_state = "cliff"
		density = 1
turf // marks this section as a turf part
	wall2// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall2"  // Which icon state to call
		density = 1//density = 1 means u cant walk over the wall. If it was 0 u can

turf // marks this section as a turf part
	wall3// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall3"  // Which icon state to call
		density = 1

turf // marks this section as a turf part
	wall4// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall4"  // Which icon state to call
		density = 1

turf // marks this section as a turf part
	wall5// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall5"  // Which icon state to call
		density = 1

turf // marks this section as a turf part
	ground1// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground1"  // Which icon state to call
turf // marks this section as a turf part
	ground2// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground2"  // Which icon state to call
turf // marks this section as a turf part
	ground3// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground3"  // Which icon state to call
turf // marks this section as a turf part
	ground4// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground4"  // Which icon state to call
turf // marks this section as a turf part
	ground9// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground9"  // Which icon state to call
turf // marks this section as a turf part
	wall6// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall6"  // Which icon state to call
		density = 1

turf // marks this section as a turf part
	wall7// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall7"  // Which icon state to call

turf // marks this section as a turf part
	wall1// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "wall1"  // Which icon state to call

turf // marks this section as a turf part
	stone// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "stone"  // Which icon state to call

turf // marks this section as a turf part
	ground// The name of the turf
		icon = 'tiles.dmi' // Which icon file to open
		icon_state = "ground"  // Which icon state to call
area
    house
        Entered(mob/M)
            if(ismob(M))
                M.see_invisible = 0
        Exited(mob/M)
            if(ismob(M))
                M.see_invisible = 1
turf
	kower1
		icon = 'turfs.dmi'
		icon_state = "ktower1"
		density = 1
	kower2
		icon = 'turfs.dmi'
		icon_state = "ktower2"
		density = 1
	kower3
		icon = 'turfs.dmi'
		icon_state = "ktower3"
		density = 1
	kower4
		icon = 'turfs.dmi'
		icon_state = "ktower4"
		density = 1
	kower5
		icon = 'turfs.dmi'
		icon_state = "ktower5"
		density = 1
	kower6
		icon = 'turfs.dmi'
		icon_state = "ktower6"
		density = 1
	kower7
		icon = 'turfs.dmi'
		icon_state = "ktower7"
		density = 1
	kower8
		icon = 'turfs.dmi'
		icon_state = "ktower8"
		density = 1
	kower9
		icon = 'turfs.dmi'
		icon_state = "ktower9"
		density = 1
	kower10
		icon = 'turfs.dmi'
		icon_state = "ktower10"
		density = 1
	kower11
		icon = 'turfs.dmi'
		icon_state = "ktower11"
		density = 1
	kower12
		icon = 'turfs.dmi'
		icon_state = "ktower12"
		density = 1
	kower13
		icon = 'turfs.dmi'
		icon_state = "ktower13"
		density = 1
	kower14
		icon = 'turfs.dmi'
		icon_state = "ktower14"
		density = 1
	kower15
		icon = 'turfs.dmi'
		icon_state = "ktower15"
		density = 1
	kower16
		icon = 'turfs.dmi'
		icon_state = "ktower16"
		density = 1
	kower17
		icon = 'turfs.dmi'
		icon_state = "ktower17"
		density = 1
	kower18
		icon = 'turfs.dmi'
		icon_state = "ktower18"
		density = 1
	kower19
		icon = 'turfs.dmi'
		icon_state = "ktower19"
		density = 1
	kower20
		icon = 'turfs.dmi'
		icon_state = "ktower20"
		density = 1
	kower21
		icon = 'turfs.dmi'
		icon_state = "ktower21"
		density = 1
	kower22
		icon = 'turfs.dmi'
		icon_state = "ktower22"
		density = 1
	kower23
		icon = 'turfs.dmi'
		icon_state = "ktower23"
		density = 1
	kower24
		icon = 'turfs.dmi'
		icon_state = "ktower24"
		density = 1
	rosattile
		icon = 'turfs.dmi'
		icon_state = "rosattile"
		density = 0
	clif
		icon = 'turfs.dmi'
		icon_state = "clif"
		density = 1
	clifpart
		icon = 'turfs.dmi'
		icon_state = "clifpart"
		density = 1
	cliff2
		icon = 'turfs.dmi'
		icon_state = "cliff2"
		density = 1
	cliffside1
		icon = 'turfs.dmi'
		icon_state = "cliff-side1"
		density = 1
	cliffside2
		icon = 'turfs.dmi'
		icon_state = "cliff-side2"
		density = 1
	cliffwater
		icon = 'turfs.dmi'
		icon_state = "cliff-water"
		density = 1
	cliffcorner1
		icon = 'turfs.dmi'
		icon_state = "cliff-corner1"
		density = 1
	cliffcorner2
		icon = 'turfs.dmi'
		icon_state = "cliff-corner2"
		density = 1
	cliffcorner3
		icon = 'turfs.dmi'
		icon_state = "cliff-corner3"
		density = 1
	cliffcorner4
		icon = 'turfs.dmi'
		icon_state = "cliff-corner4"
		density = 1
	cliffcorner5
		icon = 'turfs.dmi'
		icon_state = "cliff-corner5"
		density = 1
	cliffcorner6
		icon = 'turfs.dmi'
		icon_state = "cliff-corner6"
		density = 1
	cliffcorner7
		icon = 'turfs.dmi'
		icon_state = "cliff-corner7"
		density = 1
	cliffcorner8
		icon = 'turfs.dmi'
		icon_state = "cliff-corner8"
		density = 1
	cliffcorner9
		icon = 'turfs.dmi'
		icon_state = "cliff-corner9"
		density = 1
	cliffcorner10
		icon = 'turfs.dmi'
		icon_state = "cliff-corner10"
		density = 1
	cliffcorner11
		icon = 'turfs.dmi'
		icon_state = "cliff-corner11"
		density = 1
	cliffcorner12
		icon = 'turfs.dmi'
		icon_state = "cliff-corner12"
		density = 1
	cliffcorner13
		icon = 'turfs.dmi'
		icon_state = "cliffcorner13"
		density = 1
	desert
		icon = 'turfs.dmi'
		icon_state = "desert"
		density = 0
	desertcorner1
		icon = 'turfs.dmi'
		icon_state = "desert-corner1"
		density = 1
	desertcorner2
		icon = 'turfs.dmi'
		icon_state = "desert-corner2"
		density = 1
	desertcorner3
		icon = 'turfs.dmi'
		icon_state = "desert-corner3"
		density = 1
	desertcorner4
		icon = 'turfs.dmi'
		icon_state = "desert-corner4"
		density = 1
	desertside1
		icon = 'turfs.dmi'
		icon_state = "desert-side1"
		density = 1
	desertside2
		icon = 'turfs.dmi'
		icon_state = "desert-side2"
		density = 1
	desertside3
		icon = 'turfs.dmi'
		icon_state = "desert-side3"
		density = 1
	desertside4
		icon = 'turfs.dmi'
		icon_state = "desert-side4"
		density = 1
	lookout1
		icon = 'turfs.dmi'
		icon_state = "lookout1"
		density = 0
	lookout2
		icon = 'turfs.dmi'
		icon_state = "lookout2"
		density = 0
	lookout3
		icon = 'turfs.dmi'
		icon_state = "lookout3"
		density = 0
	lookout4
		icon = 'turfs.dmi'
		icon_state = "lookout4"
		density = 0
	lookout5
		icon = 'turfs.dmi'
		icon_state = "lookout5"
		density = 0
	lookout6
		icon = 'turfs.dmi'
		icon_state = "lookout6"
		density = 0
	lookoutpole
		icon = 'turfs.dmi'
		icon_state = "lookout-pole"
		density = 1
	kaiplanet
		icon = 'kaiplanet.dmi'
		icon_state = "kaiplanet"
		density = 1
	mountain
		icon = 'turfs.dmi'
		icon_state = "mountain"
		density = 1
	waterfall2a
		icon = 'turfs.dmi'
		icon_state = "waterfall2a"
		density = 1
	waterfall2b
		icon = 'turfs.dmi'
		icon_state = "waterfall2b"
		density = 1
	tree1
		icon = 'turfs.dmi'
		icon_state = "tree1"
		density = 1
	tree2
		icon = 'turfs.dmi'
		icon_state = "tree2"
		density = 1
	tree3
		icon = 'turfs.dmi'
		icon_state = "tree3"
		density = 0
		layer=MOB_LAYER+99999999999999999999999999999999999999999999999999
	tree4
		icon = 'turfs.dmi'
		icon_state = "tree4"
		density = 0
		layer=MOB_LAYER+99999999999999999999999999999999999999999999999999
	treeb
		icon = 'turfs.dmi'
		icon_state = "treeb"
		density = 1
	chair
		icon = 'turfs.dmi'
		icon_state = "chair"
	barrel
		icon = 'turfs.dmi'
		icon_state = "barrel"
		density = 1
	dnamektree1
		icon = 'turfs.dmi'
		icon_state = "dnamektree1"
		density = 1
	dnamektree2
		icon = 'turfs.dmi'
		icon_state = "dnamektree2"
		density = 1
	namekgrass
		icon = 'turfs.dmi'
		icon_state = "ngrass"
		density = 0
	namekhouse1
		icon = 'turfs.dmi'
		icon_state = "namekhouse1"
		density = 1
	namekhouse2
		icon = 'turfs.dmi'
		icon_state = "namekhouse2"
		density = 1
	namekhouse3
		icon = 'turfs.dmi'
		icon_state = "namekhouse3"
		density = 1
	namekhouse4
		icon = 'turfs.dmi'
		icon_state = "namekhouse4"
		density = 1
	namekhouse5
		icon = 'turfs.dmi'
		icon_state = "namekhouse5"
		density = 1
	namekhouse6
		icon = 'turfs.dmi'
		icon_state = "namekhouse6"
		density = 1
	namekhouse7
		icon = 'turfs.dmi'
		icon_state = "namekhouse7"
		density = 1
	namekhouse8
		icon = 'turfs.dmi'
		icon_state = "namekhouse8"
		density = 1
	namekhouse9
		icon = 'turfs.dmi'
		icon_state = "namekhouse9"
		density = 1
	namekhouse10
		icon = 'turfs.dmi'
		icon_state = "namekhouse10"
		density = 1
	tallnamektree1
		icon = 'turfs.dmi'
		icon_state = "tallnamektree1"
		density = 1
	tallnamektree2
		icon = 'turfs.dmi'
		icon_state = "tallnamektree2"
		density = 1
	lightning1
		icon = 'turfs.dmi'
		icon_state = "lightning1"
		density = 0
	lightning2
		icon = 'turfs.dmi'
		icon_state = "lightning2"
		density = 0
	bed1
		icon = 'turfs.dmi'
		icon_state = "bed1"
		density = 1
	bed2
		icon = 'turfs.dmi'
		icon_state = "bed2"
		density = 1
	brick
		icon = 'turfs.dmi'
		icon_state = "brick"
		density = 1
	brick2
		icon = 'turfs.dmi'
		icon_state = "brick2"
		density = 1
	road1
		icon = 'turfs.dmi'
		icon_state = "road1"
		density = 0
	rock
		icon = 'turfs.dmi'
		icon_state = "rock"
		density = 1
	table1
		icon = 'turfs.dmi'
		icon_state = "table1"
		density = 1
	table2
		icon = 'turfs.dmi'
		icon_state = "table2"
		density = 1
	table3
		icon = 'turfs.dmi'
		icon_state = "table3"
		density = 1
	roof
		icon = 'turfs.dmi'
		icon_state = "roof"
		density = 1
obj
	roof3
		layer = MOB_LAYER + 99
		icon = 'turfs.dmi'
		icon_state = "black"
		density = 0
		invisibility = 1
turf
	healingpod1
		icon = 'turfs.dmi'
		icon_state = "healingpod1"
		density = 1
	healingpod2
		icon = 'turfs.dmi'
		icon_state = "healingpod2"
		density = 0
	healingpod3
		icon = 'turfs.dmi'
		icon_state = "healingpod3"
		density = 1
	healingpod4
		icon = 'turfs.dmi'
		icon_state = "healingpod4"
		density = 1
	weight2
		icon = 'turfs.dmi'
		icon_state = "wieht2"
		density = 0
	clock
		icon = 'turfs.dmi'
		icon_state = "clock"
		density = 1
	light1
		icon = 'turfs.dmi'
		icon_state = "light1"
		density = 0
		layer = MOB_LAYER +999999999999999999999999999
	light2
		icon = 'turfs.dmi'
		icon_state = "light2"
		density = 0
		layer = MOB_LAYER +999999999999999999999999999
	light3
		icon = 'turfs.dmi'
		icon_state = "light3"
		density = 1
	pot
		icon = 'turfs.dmi'
		icon_state = "pot"
		density = 1
	dresser1
		icon = 'turfs.dmi'
		icon_state = "dresser1"
		density = 1
	dresser2
		icon = 'turfs.dmi'
		icon_state = "dresser2"
		density = 1

	roof2
		icon = 'turfs.dmi'
		icon_state = "roof2"
		layer = MOB_LAYER + 99
		density = 1

	laptop
		icon = 'turfs.dmi'
		icon_state = "laptop"
		density = 1
	rock
		icon = 'turfs.dmi'
		icon_state = "rock"
		density = 1
	gba
		icon = 'turfs.dmi'
		icon_state = "gba"
		density = 0
	door
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			usr.loc=locate(/turf/kamehouse3)
	Gokudoor
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			usr.loc=locate(/turf/gokuhouse)
	cloud3
		icon = 'turfs.dmi'
		icon_state = "cloud3"
		density = 1
	snakeway2
		icon = 'turfs.dmi'
		icon_state = "snakeway-tile2"
		density = 0
	snakewaybottom
		icon = 'turfs.dmi'
		icon_state = "snakeway-bottom"
		density = 1
	snakewaytop
		icon = 'turfs.dmi'
		icon_state = "snakeway-top"
		density = 1
	snakewayleft
		icon = 'turfs.dmi'
		icon_state = "snakeway-left"
		density = 1
	snakewayright
		icon = 'turfs.dmi'
		icon_state = "snakeway-right"
		density = 1
	snakewaycorner1
		icon = 'turfs.dmi'
		icon_state = "snakeway-corner1"
		density = 1
	snakewaycorner2
		icon = 'turfs.dmi'
		icon_state = "snakeway-corner2"
		density = 1
	snakewaycorner3
		icon = 'turfs.dmi'
		icon_state = "snakeway-corner3"
		density = 1
	snakewaycorner4
		icon = 'turfs.dmi'
		icon_state = "snakeway-corner4"
		density = 1
	buildingside
		icon = 'turfs.dmi'
		icon_state = "buildingside"
		density = 1
	entergm
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(usr.gm == 1)
				usr << "You are a GM!"
				usr.loc = locate(12,83,12)
				return 1
			else
				usr << "You are not a GM!"
				return 0
	exitgm
		icon = 'turfs.dmi'
		icon_state = ""
		density = 0
		Enter()
			usr.loc = locate(38,31,1)
	saibamachine
		icon = 'turfs.dmi'
		icon_state = "saibameen"
		density = 1
	flowers
		icon = 'turfs.dmi'
		icon_state = "flowers" //Summer Time
		//icon_state = "" //Winter Timooc lol
	bloodpong
		icon = 'turfs.dmi'
		icon_state = "bloodpond"
		density = 1
	cctop
		icon = 'turfs.dmi'
		icon_state = "cctop"
		density = 1
	fromgero
		Enter()
			usr.loc=locate(/turf/togero)
			usr.density = 1
			usr.icon_state = ""
	togero
		Enter()
			usr.loc=locate(/turf/fromgero)
			usr.density = 1
			usr.icon_state = ""
	wetoon
		Enter()
			usr.loc=locate(71,71,1)
			usr.density = 1
			usr.flight = 0
			usr.icon_state = ""
			usr.overlays -= /obj/halo
			usr.overlays -= 'halo.dmi'
	ccside
		icon = 'turfs.dmi'
		icon_state = "ccside"
		density = 1
	sparleave
		Enter()
			usr.icon_state = ""
			usr.spar = 0
			return 1
	window
		icon = 'turfs.dmi'
		icon_state = "window"

	ngrass
		icon = 'turfs.dmi'
		icon_state = "ngrass"
	kamehouse1
		icon = 'turfs6.dmi'
		icon_state = "kamehouse1"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse2
		icon = 'turfs6.dmi'
		icon_state = "kamehouse2"
		density = 0
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse3
		icon = 'turfs6.dmi'
		icon_state = "kamehouse3"
		density = 0
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse4
		icon = 'turfs6.dmi'
		icon_state = "kamehouse4"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse5
		icon = 'turfs6.dmi'
		icon_state = "kamehouse5"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse6
		icon = 'turfs6.dmi'
		icon_state = "kamehouse6"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse7
		icon = 'turfs6.dmi'
		icon_state = "kamehouse7"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse8
		icon = 'turfs6.dmi'
		icon_state = "kamehouse8"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse9
		icon = 'turfs6.dmi'
		icon_state = "kamehouse9"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse10
		icon = 'turfs6.dmi'
		icon_state = "kamehouse10"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse11
		icon = 'turfs6.dmi'
		icon_state = "kamehouse11"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse12
		icon = 'turfs6.dmi'
		icon_state = "kamehouse12"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse13
		icon = 'turfs6.dmi'
		icon_state = "kamehouse13"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	kamehouse14
		icon = 'turfs6.dmi'
		icon_state = "kamehouse14"
		density = 1
		Enter()
			usr.loc=locate(/turf/door)
	nwater
		icon = 'turfs.dmi'
		icon_state = "nwater"
		density = 1
	stones
		icon = 'turfs6.dmi'
		icon_state = "bridge4"
		density = 0
	stones8
		icon = 'turfs7.dmi'
		icon_state = "1"
		density = 0
	stones9
		icon = 'turfs7.dmi'
		icon_state = "2"
		density = 0
	stones10
		icon = 'turfs7.dmi'
		icon_state = "3"
		density = 0
	stones4
		icon = 'turfs7.dmi'
		icon_state = "4"
		density = 0
	stones5
		icon = 'turfs7.dmi'
		icon_state = "5"
		density = 0
	stones6
		icon = 'turfs7.dmi'
		icon_state = "6"
		density = 0
	stones7
		icon = 'turfs7.dmi'
		icon_state = "7"
		density = 0
	stones11
		icon = 'turfs7.dmi'
		icon_state = "8"
		density = 0
	stones12
		icon = 'turfs7.dmi'
		icon_state = "9"
		density = 0
	stones1
		icon = 'turfs6.dmi'
		icon_state = "bridge5"
	stones2
		icon = 'turfs6.dmi'
		icon_state = "bridge6"
	stones3
		icon = 'turfs6.dmi'
		icon_state = "bridge7"
	wallbottom
		icon = 'turfs6.dmi'
		icon_state = "wallbottom"
	tourneyfloor
		icon = 'turfs7.dmi'
		icon_state = "floor3"
	stones4
		icon = 'turfs6.dmi'
		icon_state = "bridge8"
	water
		icon = 'turfs.dmi'
		icon_state = "water"
		density = 1
	cliff
		icon = 'turfs.dmi'
		icon_state = "cliff"
		density = 1
	tabler
		icon = 'turfs.dmi'
		icon_state = "tabler"
		density = 1
	tablel
		icon = 'turfs.dmi'
		icon_state = "tablel"
		density = 1
	whitefloor
		icon = 'turfs.dmi'
		icon_state = "whitefloor"
		density = 0
	sidewalkn
		icon = 'turfs.dmi'
		icon_state = "sidewalkn"
		density = 0
	sword
		icon = 'turfs.dmi'
		icon_state = "sword"
		density = 0
	sidewalke
		icon = 'turfs.dmi'
		icon_state = "sidewalke"
		density = 0
	sidewalkne
		icon = 'turfs.dmi'
		icon_state = "sidewalkne"
		density = 0
	sidewalknw
		icon = 'turfs.dmi'
		icon_state = "sidewalknw"
		density = 0
	sidewalkse
		icon = 'turfs.dmi'
		icon_state = "sidewalkse"
		density = 0
	sidewalksw
		icon = 'turfs.dmi'
		icon_state = "sidewalksw"
		density = 0
	grayfloor
		icon = 'turfs.dmi'
		icon_state = "grayfloor"
		density = 0
	waterfall
		icon = 'turfs.dmi'
		icon_state = "waterfall"
		density = 0
	cliffopening
		icon = 'turfs.dmi'
		icon_state = "cliffopening"
		density = 0
	cloudtwo
		icon = 'turfs.dmi'
		icon_state = "cloud2"
		density = 1
	sand
		icon = 'turfs.dmi'
		icon_state = "sand"
		density = 0
	sign
		icon = 'sign.bmp'
		density = 1
	ketchupislandsign
		icon = 'ketchupisland.bmp'
		density = 1
	maniacktreetop
		icon = 'turfs.dmi'
		icon_state = "maniacktree"
		layer = MOB_LAYER + 99
		density = 0
	maniacktreetrunktop
		icon = 'turfs.dmi'
		icon_state = "maniacktree3"
		layer = MOB_LAYER + 99
		density = 0
	maniacktreetrunk
		icon = 'turfs.dmi'
		icon_state = "maniacktree2"
		layer = MOB_LAYER + 99
		density = 1
	maniacktreebotom
		icon = 'turfs.dmi'
		icon_state = "maniacktree4"
		layer = MOB_LAYER + 99
		density = 1
	maniackgrass
		icon = 'turfs.dmi'
		icon_state = "maniackgrass"
		density = 0
	maniacksign
		icon = 'turfs.dmi'
		icon_state = "maniacksign"
		density = 1
	gokuhouse1
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse1"
		density = 1
	gokuhouse2
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse2"
		density = 1
	gokuhouse3
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse3"
		density = 1
	gokuhouse4
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse4"
		density = 1
	gokuhouse5
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse5"
		density = 1
	gokuhouse6
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse6"
		density = 1
	gokuhouse7
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse7"
		density = 1
	gokuhouse8
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse8"
		density = 1
	gokuhouse9
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse9"
		density = 1
	gokuhouse10
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse10"
		density = 1
	gokuhouse11
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse11"
		density = 1
	gokuhouse12
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse12"
		density = 1
	gokuhouse13
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse13"
		density = 1
	gokuhouse14
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse14"
		density = 1
	gokuhouse15
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse15"
		density = 1
	gokuhouse16
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse16"
		density = 1
	gokuhouse17
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse17"
		density = 1
	gokuhouse18
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse18"
		density = 1
	gokuhouse19
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse19"
		density = 1
	gokuhouse20
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse20"
		density = 1
	gokuhouse21
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse21"
		density = 1
	gokuhouse22
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse22"
		density = 1
	gokuhouse23
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse23"
		density = 1
	gokuhouse
		density = 1
		Enter()
			usr.loc=locate(/turf/Gokudoor)
	gokuhouse25
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse25"
		density = 1
		Enter()
			usr.loc=locate(17,110,3)
	gokuhouse26
		icon = 'gokuhouse.dmi'
		icon_state = "gokuhouse26"
		density = 1
	stairs
		icon = 'turfs.dmi'
		icon_state = "stairs"
	black
		icon = 'turfs.dmi'
		icon_state = "black"
		density = 1
	dirt
		icon = 'turfs.dmi'
		icon_state = "dirt"
	snakeway
		icon = 'turfs.dmi'
		icon_state = "snakeway"
	snl
		icon = 'turfs.dmi'
		icon_state = "snl"
	snr
		icon = 'turfs.dmi'
		icon_state = "snr"
	snt
		icon = 'turfs.dmi'
		icon_state = "snt"
	snb
		icon = 'turfs.dmi'
		icon_state = "snb"
	cloud
		icon = 'turfs.dmi'
		icon_state = "cloud"
		density = 1
	gravleave
		Exit()
			usr.grav = 0
			return 1
	uplevel1
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc = locate(usr.x-2,usr.y+22,usr.z)
	downlevel1
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc = locate(usr.x+2,usr.y-22,usr.z)
	gymexit1
		Enter()
			usr.loc = locate(/turf/gymenter1)
	tourneytext
		icon = 'tourneytext.bmp'
	gymenter1
		Enter()
			usr.loc = locate(/turf/gymexit1)
	uplevel2
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc = locate(usr.x-2,usr.y+22,usr.z)
	downlevel2
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc = locate(usr.x+2,usr.y-22,usr.z)
	gymexit2
		Enter()
			usr.loc = locate(/turf/gymenter2)
	gymenter2
		Enter()
			usr.loc = locate(/turf/gymexit2)
	hbtcexit
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc = locate(/turf/hbtcenter)
	hbtcenter
		Enter()
			usr.loc = locate(/turf/hbtcexit)
	kamiplaceenter
		Enter()
			usr.loc = locate(/mob/Dende)
	loco
		Enter()
			usr.x = 85
	loco2
		Enter()
			usr.x = 106
	loct
		Enter()
			usr.y = 116
	loct2
		Enter()
			usr.y = 137

	locenter
		Enter()
			usr.loc=locate(usr.x+2,usr.y+2, usr.z)

	locenter2
		Enter()
			usr.loc=locate(usr.x-2,usr.y-2, usr.z)

	locenter3
		Enter()
			usr.loc=locate(usr.x-2,usr.y+2, usr.z)

	locenter4
		Enter()
			usr.loc=locate(usr.x+2,usr.y-2, usr.z)

	got
		Enter()
			usr.loc=locate(95,118,2)

	enta
		Enter()
			usr.loc=locate(9,66,3)
			usr.density = 1
			usr.icon_state = ""
	enta2
		Enter()
			usr.loc=locate(10,66,3)
			usr.density = 1
			usr.icon_state = ""

	ente
		Enter()
			usr.loc=locate(68,1,4)

			usr.density = 1
			usr.icon_state = ""
	Void
		icon = 'turfs.dmi'
		icon_state = "black"
		density = 1
		layer = MOB_LAYER+1
	noFlying
		Enter()
			if(usr.flight==1)
				return 1
			else
				usr.fly = 0
				return 0
		Exit()
			usr.fly = 1
	ente2
		Enter()
			usr.loc=locate(69,1,4)
			usr.density = 1
			usr.icon_state = ""
	ceev
		Enter()
			usr.loc=locate(125,140,1)
			usr.density = 1
			usr.icon_state = ""
	ceev2
		Enter()
			usr.loc=locate(3,1,3)
			usr.density = 1
			usr.icon_state = ""
	healexit
		Enter()
			usr.heal = 0
			return 1
	snow
		icon = 'turfs.dmi'
		icon_state = "snow"
	gonorth
		Enter()
			usr.loc=locate(usr.x,1,6)
	gonorth2
		Enter()
			usr.loc=locate(usr.x,150,1)

	goeast
		Enter()
			usr.loc=locate(1,usr.y,7)

	goeast2
		Enter()
			usr.loc=locate(150,usr.y,1)

	tapiontune
		Enter()
			usr << 'tapion.mid'
			return 1

	gravityenter
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			switch(input("Would you like to enter the Gravity Chamber?", "Gravity Chamber", text) in list ("Yes","No"))
				if("Yes")
					if(usr.zenni < 3000)
						usr << "<B>This costs 3000 zenni!"
					if(usr.zenni >= 3000)
						usr.icon_state = ""
						usr.density = 1
						usr.zenni -= 3000
						usr << "Okay! You may enter!"
						usr.loc=locate(109,17,3)
						sleep(3000)
						if(usr.dead == 0||usr.dead == null)
							usr.loc=locate(70,85,1)
							usr << "<b>Your time is up."
							usr.icon_state = ""
							usr.move = 1
						if(usr.dead == 1)
							..()


	gravityenter2
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			switch(input("Would you like to enter the Gravity Chamber?", "Gravity Chamber", text) in list ("Yes","No"))
				if("Yes")
					usr.icon_state = ""
					usr.density = 1
					if(usr.zenni < 3000)
						usr << "<B>This costs 3000 zenni!"
					if(usr.zenni >= 3000)
						usr.icon_state = ""
						usr.density = 1
						usr.zenni -= 3000
						usr << "Okay! You may enter!"
						usr.loc=locate(129,17,3)
						sleep(3000)
						if(usr.dead == 0||usr.dead == null)
							usr.loc=locate(70,85,1)
							usr << "<b>Your time is up."
							usr.icon_state = ""
							usr.move = 1
						if(usr.dead == 1)
							..()
	safe
		Enter()
			usr.safe = 1
			return  1
	nonsafe
		Enter()
			usr.safe = 0
			return  1


	webesaiba
		Enter()
			usr.loc=locate(usr.x,150,9)

	weentsaiba
		Enter()
			usr.loc=locate(usr.x,1,1)
//Japanese//


	dragon
		icon = 'JapaneseWords.dmi'
		icon_state = "dragon"
		density = 0
	ball
		icon = 'JapaneseWords.dmi'
		icon_state = "ball"
		density = 0

	z
		icon = 'JapaneseWords.dmi'
		icon_state = "z"
		density = 0

obj/hairstrip
	icon = 'hair_black_spikey.dmi'
	icon_state = "hairstrip"
	layer = MOB_LAYER + 10
turf
	thougrav
		Enter()
			if(usr.maxpowerlevel >= 1000000)
				usr.random = rand(1,30)
				if(usr.random == 29)
					usr << "<b>You struggle a bit because of the gravity..."
					usr.maxpowerlevel += (rand(1,25))
					usr.exp += (rand(10,50))
					usr.health -= (rand(1,2))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				if(usr.random == 30)
					usr << "<b>You walk on this planet without a problem."

			if(usr.maxpowerlevel >= 100000 && usr.maxpowerlevel <= 1000000)
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk through the gravity of this planet without a problem."
					usr.health -= (rand(1,2))
					usr.exp += (rand(10,50))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				if(usr.random == 2)
					usr << "<b>You feel a strained walking on this planet."
					usr.stamina -= (rand(0,1))
					usr.exp += (rand(50,100))
					usr.health -= (rand(1,2))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				if(usr.powerlevel > 0)
					usr.maxpowerlevel += (rand(0,20))
					usr.exp += (rand(5,10))
					usr.health -= (rand(1,2))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				else
					usr.KO()
					usr.Die()


			if((usr.strength + usr.defense + usr.speed)/3 >= 40)
				if(usr.stamina <= 0)
					usr.stamina = 0
					usr.KO()
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk through the gravity of this planet without a problem."
					usr.exp += (rand(50,100))
					usr.health -= (rand(1,2))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				if(usr.random == 2)
					usr << "<b>You feel strained walking on this planet."
					usr.stamina -= (rand(0,3))
					usr.exp += (rand(50,100))
					usr.health -= (rand(1,2))
					usr.Levelup()
					usr.powerlevelRefresh()
					usr.KO()
				if(usr.powerlevel > 0)
					usr.maxpowerlevel += (rand(0,15))
				else
					usr.KO()
					usr.Die()


			if(usr.level < 100)
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk on the planet, feeling extremely strained.."
					usr.stamina -= (rand(0,3))
					usr.health -= (rand(1,2))
					usr.exp += (rand(50,100))
					usr.Levelup()
					usr.Die()
				if(usr.random == 2)
					usr << "<b>You feel extremely strained walking on this planet."
					usr.stamina -= (rand(0,3))
					usr.health -= (rand(1,2))
					usr.exp += (rand(50,100))
					usr.Levelup()
					usr.Die()
				if(usr.powerlevel > 0)
					usr.maxpowerlevel += (rand(0,10))
					usr.Die()
				else
					usr.KO()
					usr.Die()

			return 1
turf
	tengrav
		Enter()
			if(usr.maxpowerlevel >=30000)
				usr.random = rand(1,50)
				if(usr.random==1)
					usr << "You walk through the gravity of this planet without a problem"
			if(usr.maxpowerlevel >= 10001)
				usr.random = rand(1,50)
				if(usr.random == 49)
					usr << "<b>You struggle a bit because of the gravity..."
					usr.maxpowerlevel += 1
				if(usr.random == 50)
					usr << "<b>You walk on this planet without a problem."

			if(usr.maxpowerlevel >= 1500 && usr.maxpowerlevel <= 10000)
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk through the gravity of this planet without a problem."
				if(usr.random == 2)
					usr << "<b>You feel a little strained walking on this planet."
					usr.stamina -= (rand(0,1))
				usr.maxpowerlevel += 1
				usr.KO()
			if(usr.maxpowerlevel < 1500 && usr.maxpowerlevel >= 500)
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk through the gravity of this planet without a problem."
				if(usr.random == 2)
					usr << "<b>You feel strained walking on this planet."
					usr.stamina -= (rand(0,3))
				usr.maxpowerlevel += (rand(0,2))
				usr.KO()
			if(usr.maxpowerlevel < 500)
				usr.random = rand(1,12)
				if(usr.random == 1)
					usr << "<B>You walk on the planet, feeling strained.."
					usr.stamina -= (rand(0,3))
				if(usr.random == 2)
					usr << "<b>You feel extremely strained walking on this planet."
					usr.stamina -= (rand(0,3))
				usr.maxpowerlevel += (rand(0,3))
				usr.KO()
			usr.Die()
			return 1

turf
	tengravfirst
		verb
			Jump()
				usr.loc=locate(11,3,10)
				usr <<"You jump to King Kais!"

turf
	kaioenter
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc=locate(98,71,3)

turf
	kaioleave
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			usr.loc=locate(11,10,10)