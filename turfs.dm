area
	doornodense
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
var/COVER_LAYER = 10


turf
	training_building_door
		icon = 'turfs.dmi'
		icon_state = "zmeditation_door"
		density = 0
//		COVER_LAYER = 10

	TWoodfloor
		icon='TestTurf.dmi'
		icon_state="wood"

	TBasicFloor
		icon='TestTurf.dmi'
		icon_state="o_o"
		density=0
	Tbudo
		icon='TestTurf.dmi'
		icon_state="o_o2"
		density=0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(219,97,16)
	TbudoL
		icon='TestTurf.dmi'
		icon_state="o_o2"
		density=0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(254,13,16)
	Tdesert
		icon='TestTurf.dmi'
		icon_state="o_o2"
		density=0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(230,62,16)
	TdesertL
		icon='TestTurf.dmi'
		icon_state="o_o2"
		density=0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(246,13,16)
	TBasicWall
		density = 1
		opacity = 1
		Enter()
			if(istype(usr,/obj))
				return 1
			else
				return 0
		icon='TestTurf.dmi'
		icon_state="wall"

	TBasicChair
		icon='TestTurf.dmi'
		icon_state="Chair"
	TBasicTable
		icon='TestTurf.dmi'
		icon_state="Table"
		density=1
	Tpillar
		icon='TestTurf.dmi'
		icon_state="Pillertop"
		density=1
	TBottle
		icon='TestTurf.dmi'
		icon_state="Bottle"
		density=1
	Tsteak
		icon='TestTurf.dmi'
		icon_state="Steak"
		density=1
	Tpillar2
		icon='TestTurf.dmi'
		icon_state="Pillerbottom"
		density=1
	TDoor
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.guild == "<FONT COLOR=#00ffff>S</FONT><FONT COLOR=#0af1fb>i</FONT><FONT COLOR=#13e2f>l</FONT><FONT COLOR=#1dd3f2>e</FONT><FONT COLOR=#27c4ed>n</FONT><FONT COLOR=#31b5e9>t</FONT><FONT COLOR=#3aa5e4> </FONT><FONT COLOR=#4496e0>C</FONT><FONT COLOR=#4e87db>u</FONT><FONT COLOR=#5878d6>r</FONT><FONT COLOR=#6169d2>s</FONT><FONT COLOR=#6a5acd>e</FONT>")
					usr.loc=locate(78,160,3)
				else
					usr << "You do not belong here."
					return 0
	TWALL2
		icon = 'TestTurf.dmi'
		icon_state = "wall2"
		density = 0
		opacity=1
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.key=="DRWarrior"||usr.key=="Testament")
					usr<<"Welcome [usr]."
					return 1
				else
					return 0
	TFloor
		icon = 'TestTurf.dmi'
		icon_state = "o_o1"
		density = 0
		opacity=1
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.key=="DRWarrior"||usr.key=="Testament")
					usr<<"Welcome [usr]."
					return 1
				else
					return 0


obj
	SilentCurse
		icon = 'TestTurf.dmi'
		icon_state = "board"
		density = 1
		verb
			Look()
				set src in oview(1)
				set category = "Communication"
				set name = "Read"
				alert("'Welcome [usr], to Silent Curse. The Guild Of Dreams.")
				alert("Guild Owned By Testament, Co-Owned By DRWarrior")
				usr << "Guild items to be given out fairly."
				sleep(10)
				usr << "Recruiter goes to trusted people."
				sleep(10)
				usr << "Last of all, have a great time."
area
	var
		safe=0
		icon/covericon // icon file to use for this area's cover
		covericon_state = ""	// iconstate for the cover
		image/coverimage /* image of the cover, stored with the area so it can be be added or
						 subtracted from from a client's view at will without creating
						 new images. */

	Del()
		if(coverimage) del(coverimage)	// delete lingering images
		..()

	Entered(mob/O)	// O just entered this area
		..()
		// if this area is covered and O is a mob with a client
		if(coverimage && ismob(O) && O:client)
			O:client.images -= coverimage	// remove the coverimage from the client's view

	Exited(O)	// O just exited this area
		..()
		// if this area is covered and O is a mob with a client
		if(coverimage && ismob(O) && O:client)
			O:client << coverimage	// show the coverimage to the client

	New()
		..()
		if(covericon)	// if this area has a covericon
			coverimage = image(covericon,src,covericon_state,COVER_LAYER)	// make a coverimage of the icon
	nopkzone
		safe=1
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=1

	pkzone
		safe=0
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=0
turf
	housewarps
		shopone1E
			Enter()
				usr.Warp(235,162,1)
		shopone2E
			Enter()
				usr.Warp(190,162,1)
		shopone3E
			Enter()
				usr.Warp(127,198,1)
		shopone4E
			Enter()
				usr.Warp(124,161,1)
		shopone5E
			Enter()
				usr.Warp(177,111,1)
		shopone6E
			Enter()
				usr.Warp(202,27,1)
		shopone7E
			Enter()
				usr.Warp(132,230,1)
		shopone1L
			Enter()
				usr.Warp(34,285,22)
		shopone2L
			Enter()
				usr.Warp(49,285,22)
		shopone3L
			Enter()
				usr.Warp(63,285,22)
		shopone4L
			Enter()
				usr.Warp(78,285,22)
		shopone5L
			Enter()
				usr.Warp(92,285,22)
		shopone6L
			Enter()
				usr.Warp(107,285,22)
		shopone7L
			Enter()
				usr.Warp(150,285,22)
		shoponetwoE
			Enter()
				usr.Warp(245,215,1)
		shopthreefourE
			Enter()
				usr.Warp(199,223,1)
		shoponetwoL
			Enter()
				usr.Warp(121,285,22)
		shopthreefourL
			Enter()
				usr.Warp(136,285,22)
		shoptwo1E
			Enter()
				usr.Warp(183,111,1)
		shoptwo2E
			Enter()
				usr.Warp(253,162,1)
		shoptwo3E
			Enter()
				usr.Warp(139,224,1)
		shoptwo1L
			Enter()
				usr.Warp(165,285,22)
		shoptwo2L
			Enter()
				usr.Warp(9,137,22)
		shoptwo3L
			Enter()
				usr.Warp(24,137,22)
		shopthree1E
			Enter()
				usr.Warp(201,162,1)
		shopthree2E
			Enter()
				usr.Warp(255,182,1)
		shopthree3E
			Enter()
				usr.Warp(209,42,1)
		shopthree1L
			Enter()
				usr.Warp(67,137,22)
		shopthree2L
			Enter()
				usr.Warp(82,137,22)
		shopthree3L
			Enter()
				usr.Warp(96,137,22)
		shopfour1E
			Enter()
				usr.Warp(201,35,1)
		shopfour2E
			Enter()
				usr.Warp(116,189,1)
		shopfour1L
			Enter()
				usr.Warp(125,137,22)
		shopfour2L
			Enter()
				usr.Warp(140,137,22)
		shopfiveE
			Enter()
				usr.Warp(166,37,1)
		shopfiveL
			Enter()
				usr.Warp(45,137,22)
		Gym1E
			Enter()
				usr.Warp(126,189,1)
		Gym2E
			Enter()
				usr.Warp(213,230,1)
		Gym3E
			Enter()
				usr.Warp(243,173,1)
		Gym4E
			Enter()
				usr.Warp(195,177,1)
		Gym5E
			Enter()
				usr.Warp(191,111,1)
		Gym6E
			Enter()
				usr.Warp(191,35,1)
		Gym1L
			Enter()
				usr.Warp(10,161,22)
		Gym2L
			Enter()
				usr.Warp(30,161,22)
		Gym3L
			Enter()
				usr.Warp(50,161,22)
		Gym4L
			Enter()
				usr.Warp(69,161,22)
		Gym5L
			Enter()
				usr.Warp(96,161,22)
		Gym6L
			Enter()
				usr.Warp(122,161,22)
		OrangeE
			Enter()
				usr.Warp(185,124,1)
		OrangeL
			Enter()
				usr.Warp(242,241,22)
		GokuE
			Enter()
				usr.Warp(216,82,1)
		GokuL
			Enter()
				usr.Warp(203,249,22)
		GokuE2
			Enter()
				usr.Warp(219,82,1)
		GokuL2
			Enter()
				usr.Warp(215,249,22)
		RoshiE
			Enter()
				usr.Warp(280,15,1)
		RoshiL
			Enter()
				usr.Warp(205,237,22)
		CCe
			Enter()
				usr.Warp(93,190,1)
		CCl
			Enter()
				usr.Warp(156,225,22)
		BulmaE
			Enter()
				usr.Warp(100,190,1)
		BulmaL
			Enter()
				usr.Warp(182,204,22)
		VidelHl
			Enter()
				usr.Warp(5,276,22)
		VidelHe
			Enter()
				usr.Warp(201,119,1)
		TienHl
			Enter()
				usr.Warp(6,292,22)
		TienHe
			Enter()
				usr.Warp(47,262,1)
		KrillinHl
			Enter()
				usr.Warp(5,263,22)
		KrillinHe
			Enter()
				usr.Warp(245,162,1)
		Hl1
			Enter()
				usr.Warp(5,250,22)
		Hl2
			Enter()
				usr.Warp(11,237,22)
		Hl3
			Enter()
				usr.Warp(11,224,22)
		Hl4
			Enter()
				usr.Warp(7,213,22)
		Hl5
			Enter()
				usr.Warp(24,263,22)
		Hl6
			Enter()
				usr.Warp(24,250,22)
		Hl7
			Enter()
				usr.Warp(30,237,22)
		Hl8
			Enter()
				usr.Warp(30,224,22)
		Hl9
			Enter()
				usr.Warp(25,213,22)
		Hl10
			Enter()
				usr.Warp(43,262,22)
		Hl11
			Enter()
				usr.Warp(43,249,22)
		Hl12
			Enter()
				usr.Warp(49,236,22)
		Hl13
			Enter()
				usr.Warp(49,223,22)
		Hl14
			Enter()
				usr.Warp(45,212,22)
		Hl15
			Enter()
				usr.Warp(62,262,22)
		Hl16
			Enter()
				usr.Warp(62,249,22)
		Hl17
			Enter()
				usr.Warp(68,236,22)
		Hl18
			Enter()
				usr.Warp(68,223,22)
		Hl19
			Enter()
				usr.Warp(63,212,22)
		Hl20
			Enter()
				usr.Warp(81,262,22)
		Hl21
			Enter()
				usr.Warp(81,249,22)
		Hl22
			Enter()
				usr.Warp(87,236,22)
		Hl23
			Enter()
				usr.Warp(87,223,22)
		Hl24
			Enter()
				usr.Warp(83,212,22)
		Hl25
			Enter()
				usr.Warp(100,262,22)
		Hl26
			Enter()
				usr.Warp(100,249,22)
		Hl27
			Enter()
				usr.Warp(106,236,22)
		Hl28
			Enter()
				usr.Warp(106,223,22)
		Hl29
			Enter()
				usr.Warp(101,212,22)
		He1
			Enter()
				usr.Warp(127,180,1)
		He2
			Enter()
				usr.Warp(206,227,1)
		He3
			Enter()
				usr.Warp(209,47,1)
		He4
			Enter()
				usr.Warp(181,94,1)
		He5
			Enter()
				usr.Warp(195,41,1)
		He6
			Enter()
				usr.Warp(159,42,1)
		He7
			Enter()
				usr.Warp(180,87,1)
		He8
			Enter()
				usr.Warp(165,50,1)
		He9
			Enter()
				usr.Warp(139,216,1)
		He10
			Enter()
				usr.Warp(135,189,1)
		He11
			Enter()
				usr.Warp(208,247,1)
		He12
			Enter()
				usr.Warp(217,213,1)
		He13
			Enter()
				usr.Warp(174,52,1)
		He14
			Enter()
				usr.Warp(203,127,1)
		He15
			Enter()
				usr.Warp(211,162,1)
		He16
			Enter()
				usr.Warp(209,35,1)
		He17
			Enter()
				usr.Warp(202,238,1)
		He18
			Enter()
				usr.Warp(192,90,1)
		He19
			Enter()
				usr.Warp(210,27,1)
		He20
			Enter()
				usr.Warp(123,222,1)
		He21
			Enter()
				usr.Warp(223,236,1)
		He22
			Enter()
				usr.Warp(176,42,1)
		He23
			Enter()
				usr.Warp(239,182,1)
		He24
			Enter()
				usr.Warp(200,213,1)
		He25
			Enter()
				usr.Warp(129,216,1)
		He26
			Enter()
				usr.Warp(145,220,1)
		He27
			Enter()
				usr.Warp(228,221,1)
		He28
			Enter()
				usr.Warp(196,82,1)
		He29
			Enter()
				usr.Warp(208,31,1)


mob/proc
	Warp(dx,dy,dz)
		if(istype(usr,/mob/characters))
			usr.loc=locate(dx,dy,dz)

obj
	headblock
		var/image/coverimage
		var/covericon='custom_head1.dmi'
		var/covericon_state=""
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
	trailblock
		var/image/coverimage
		var/covericon='custom_trail1.dmi'
		var/covericon_state=""
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
	colorblock1
		var/image/coverimage
		var/covericon='colorblock.dmi'
		var/covericon_state=""
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
	colorblock2
		var/image/coverimage
		var/covericon='colorblock.dmi'
		var/covericon_state=""
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
	previewhead
	previewtrail
	fullstar
		strengthstars
			var/image/coverimage
			var/covericon='Star2.dmi'
			One
				var/covericon_state="3"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Two
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Three
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Four
				var/covericon_state="3"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Five
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
		speedstars
			var/image/coverimage
			var/covericon='Star2.dmi'
			One
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Two
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Three
				var/covericon_state="3"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Four
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Five
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
		rangestars
			var/image/coverimage
			var/covericon='Star2.dmi'
			One
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Two
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Three
				var/covericon_state="3"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
		knockbackstars
			var/image/coverimage
			var/covericon='Star2.dmi'
			One
				var/covericon_state="3"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Two
				var/covericon_state="1"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
			Three
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)

		peircingstars
			var/image/coverimage
			var/covericon='Star2.dmi'
			One
				var/covericon_state="2"
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
		typeframes
			var/image/coverimage
			var/covericon='ztypeframe.dmi'
			var/covericon_state=""
			One
				icon='ztypehoming.dmi'
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
				Click()
					usr.customcpl[10]=1
					for(var/obj/fullstar/typeframes/O in world)
						if(O==src)
							usr:client << O.coverimage
						else
							usr.client.images -= O.coverimage
			Two
				icon='ztypebeam.dmi'
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
				Click()
					usr.customcpl[10]=2
					for(var/obj/fullstar/typeframes/O in world)
						if(O==src)
							usr:client << O.coverimage
						else
							usr.client.images -= O.coverimage
			Three
				icon='ztypepunch.dmi'
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
				Click()
					usr.customcpl[10]=3
					for(var/obj/fullstar/typeframes/O in world)
						if(O==src)
							usr:client << O.coverimage
						else
							usr.client.images -= O.coverimage
			Four
				icon='ztypebomb.dmi'
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
				Click()
					usr.customcpl[10]=4
					for(var/obj/fullstar/typeframes/O in world)
						if(O==src)
							usr:client << O.coverimage
						else
							usr.client.images -= O.coverimage
			Five
				icon='ztypebind.dmi'
				New()
					..()
					if(covericon)	// if this area has a covericon
						coverimage = image(covericon,src,covericon_state,5)
				Click()
					usr.customcpl[10]=5
					for(var/obj/fullstar/typeframes/O in world)
						if(O==src)
							usr:client << O.coverimage
						else
							usr.client.images -= O.coverimage
image/colorbox
image/colorbox2
image/headicon
image/trailicon
turf
	finishcustom
		Click()
			if(usr.infinishmenu==0)
				usr.infinishmenu=1
				if(usr.customcpl[10]==0)
					usr<<"Please choose an attack type first!"
					return
				usr.client.images=0
				usr.customcpl[3]=0
				usr.customcpl[1]=0
				var/head = usr.customcpl[19]
				head+=rgb(usr.customcpl[11],usr.customcpl[12],usr.customcpl[13])
				var/trail = usr.customcpl[20]
				trail+=rgb(usr.customcpl[14],usr.customcpl[15],usr.customcpl[16])
				if(length(name)>20)
					usr<<"That name is too long"
					return

				switch(input("Do you wish to save the [name]??.", "[name]", text) in list ("Save", "Dont Save"))
					if("Save")
						var/one = "Slot 1 ([usr.customattacks[1]])"
						var/two = "Slot 2 ([usr.customattacks[2]])"
						var/three = "Slot 3 ([usr.customattacks[3]])"
						var/four = "Slot 4 ([usr.customattacks[4]])"
						var/five = "Slot 5 ([usr.customattacks[5]])"
						var/six = "Slot 6 ([usr.customattacks[6]])"
						var/seven = "Slot 7 ([usr.customattacks[7]])"
						var/eight = "Slot 8 ([usr.customattacks[8]])"
						var/nine = "Slot 9 ([usr.customattacks[9]])"
						var/ten = "Slot 10 ([usr.customattacks[10]])"
						var/list/menu = new()
						menu += one
						menu += two
						menu += three
						menu += four
						menu += five
						menu += six
						menu += seven
						menu += eight
						menu += nine
						menu += ten
						var/result = input("Choose a skill save slot", ".Custom attack") in menu
						usr.verbs-=typesof(/mob/Customattack/verb)
						if(result==one)
							usr.customattacks[1]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_1(usr,usr.customcpl[8])
						if(result==two)
							usr.customattacks[2]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_2(usr,usr.customcpl[8])
						if(result==three)
							usr.customattacks[3]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_3(usr,usr.customcpl[8])
						if(result==four)
							usr.customattacks[4]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_4(usr,usr.customcpl[8])
						if(result==five)
							usr.customattacks[5]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_5(usr,usr.customcpl[8])
						if(result==six)
							usr.customattacks[6]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_6(usr,usr.customcpl[8])
						if(result==seven)
							usr.customattacks[7]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_7(usr,usr.customcpl[8])
						if(result==eight)
							usr.customattacks[8]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_8(usr,usr.customcpl[8])
						if(result==nine)
							usr.customattacks[9]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_9(usr,usr.customcpl[8])
						if(result==ten)
							usr.customattacks[10]="[usr.ckey].[usr.customcpl[8]]"
						//	new/mob/Customattack/verb/custom_10(usr,usr.customcpl[8])
						spawn()usr.refreshcustomverbs()
						var/savefile/F = new("attacks/[usr.ckey].[usr.customcpl[8]].sav")
						F["icon"]<<head
						F["trail"]<<trail
						F["knockback"]<<usr.customcpl[6]
						F["name"]<<usr.customcpl[8]
						F["peircing"]<<usr.customcpl[7]
						F["range"]<<usr.customcpl[5]
						F["skilllevel"]<<usr.customcpl[9]
						F["speed"]<<usr.customcpl[4]
						F["strength"]<<usr.customcpl[2]
						F["saybefore"]<<usr.customcpl[22]
						F["sayafter"]<<usr.customcpl[23]
						F["type"]<<usr.customcpl[10]
				usr.invisibility=0
				var/emptylist[23]
				usr.customcpl=emptylist
				usr.loc=locate(usr.memloc[1],usr.memloc[2],usr.memloc[3])
				usr.memloct=0
				usr.statbars=1
				usr.nopk=0
				usr.creatingattack=0
				usr.infinishmenu=0

mob
	Customattack
		verb
			custom_1()
				set category="Fighting"
				usr.Customblast(1)
			custom_2()
				set category="Fighting"
				usr.Customblast(2)
			custom_3()
				set category="Fighting"
				usr.Customblast(3)
			custom_4()
				set category="Fighting"
				usr.Customblast(4)
			custom_5()
				set category="Fighting"
				usr.Customblast(5)
			custom_6()
				set category="Fighting"
				usr.Customblast(6)
			custom_7()
				set category="Fighting"
				usr.Customblast(7)
			custom_8()
				set category="Fighting"
				usr.Customblast(8)
			custom_9()
				set category="Fighting"
				usr.Customblast(9)
			custom_10()
				set category="Fighting"
				usr.Customblast(10)
	proc
		knockbackproc(distance,xdir)
			if(src.beingknocked==0)
				src.beingknocked=1
				var/leftdistance=distance
				while(leftdistance>0)
					sleep(2)
					var/mob/test/test =new (locate(src.x,src.y,src.z))
					test.density=1
					walk(test,xdir,1)
					sleep(1)
					walk(test,0)
					if(test)
						src.loc=locate(test.x,test.y,test.z)

					del(test)
					leftdistance-=1
				src.beingknocked=0

		//	ReLocate(C,src,distance,0.5)
	proc
		Customblast(var/slot)
			if(usr.nopk==0)
				if(usr.kame == 1)
					usr << "<tt>You are currently using a blast"
				if(usr.kame == 0 && usr.move==1)
					var/amount=skillkiusage[(14+slot)]
					var/savefile/F = new("attacks/[usr.customattacks[slot]].sav")
					var/type
					var/name
					var/range
					var/strength
					var/head
					var/trail
					var/knockback
					var/peircing
					var/skilllevel
					var/speed
					var/saybefore
					var/sayafter
					F["type"]>>type
					F["name"]>>name
					F["range"]>>range
					F["strength"]>>strength
					F["icon"]>>head
					F["trail"]>>trail
					F["knockback"]>>knockback
					F["peircing"]>>peircing
					F["skilllevel"]>>skilllevel
					F["speed"]>>speed
					F["saybefore"]>>saybefore
					F["sayafter"]>>sayafter
					F["type"]>>type
					if(knockback>3)
						knockback=3
					if(speed>5)
						speed=5
					if(range>3)
						range=3
					if(strength>5)
						strength=5
					if(amount >= 1)
						if(amount > usr.ki&&type!=5)
							usr<<"You dont have that much ki!"
						if(amount <= usr.ki||type==5)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame = 1
								if(type!=5)
									usr.ki-=amount
								if(usr.powerlevel>usr.maxpowerlevel)
									amount=amount*(usr.powerlevel/usr.maxpowerlevel)
								if(type==1)
									var/mob/M=input("Choose a target","Target")as mob in oview(3+(2*range))
									if(M)
										usr.targets=src
										src=usr.targets
										usr.kame = 1
										usr.overlays += /obj/kame
										if(src.doomy==1) //Que?
										usr.overlays += /obj/kame
										flick("ki",usr)
										view(6) << "<font color = red>[usr]:<font color = white> <tt>[saybefore]"
										sleep(60-(8*speed))
										view(6) << "<font color = red>[usr]:<font color = white> <tt>[sayafter]"
										usr.overlays -= /obj/kame
										if(src.z == usr.z)
											usr.overlays -= /obj/kame
											s_missile(head, usr, src)
											spawn(3)usr.kame = 0
											amount=amount*(200+(30*strength))
											amount=((amount*50)/(src.powerlevel+1))
											if(src.absorb == 1&&peircing==0)
												view(6) << "[src] absorbs [usr]'s Attack!"
												src.ki += amount/300
												if(src.ki>src.maxki)
													src.ki=src.maxki
											else
												if(src.powerlevel >= usr.powerlevel)
													src.random = rand(1,3)
													if(src.random == 3 && peircing==0)
														view(6) << "[src] reflects [usr]'s blast back at him!"
														s_missile('kame6.dmi', src, usr)
														usr.hp= amount
														if(usr)
															var/O = new /obj/crator(usr.loc)
															var/I = new /mob/smoke(usr.loc)
															flick("smoke",I)
															spawn()usr.Die()
															sleep(50)
															del(I)
															//flick("disapear",O:mob)
															sleep(200)
															del(O)
													else
														view(6) << "<font color = red>[usr] shoots a [name] at [src]!!!"
														if(src.block==1 && peircing==0)
															src.hp-= amount /10
														else
															src.hp-= amount
															if(knockback)
																if(src.client||istype(src,/mob/monsters))
																	var/tempknockback=knockback
																	spawn(10)
																		src.knockbackproc((3*tempknockback),usr.dir)
																	knockback=0


												else
													view(6) << "<font color = red>[usr] shoots a [name] at [src]!!!"
													if(src.block==1&& peircing==0)
														src.hp-= amount /10
													else
														src.hp-= amount
														if(knockback)
															if(src.client||istype(src,/mob/monsters))
																src.knockbackproc((3*knockback),usr.dir)
													if(src.race!=null|"")
														var/O = new /obj/crator(src.loc)
														var/I = new /mob/smoke(src.loc)
														flick("smoke",I)
														spawn()src.Die()
														sleep(50)
														del(I)
														//flick("disapear",O:mob)
														sleep(200)
														del(O)
													spawn()usr.KO()
										else
											usr << "<b>You launch your [name], but [M] is out of sight."
											usr.overlays -= /obj/kame
											spawn(3)usr.kame = 0
									else
										usr.kame=0
								if(type==2)
									if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHWEST||usr.dir==SOUTHEAST)
										return
									if(usr.nopk==0)
										usr.kame = 1
										usr.counter=0
										sleep(1)
										var/temp=usr.icon_state
										usr.icon_state="ki"
										view(6) << "<font color = red>[usr]:<font color = white> <tt>[saybefore]"
										var/delay=9-(speed*3)
										if(delay<0)
											delay=0
										sleep(delay)
										view(6) << "<font color = red>[usr]:<font color = white> <tt>[sayafter]"
										amount=amount*(200+(strength*50))
										var/obj/Proj
										if(usr.dir==NORTH)
											Proj = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
										if(usr.dir==EAST)
											Proj = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
										if(usr.dir==SOUTH)
											Proj = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
										if(usr.dir==WEST)
											Proj = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
										Proj.kitype=2
										Proj.icon=head
										Proj.knockback=knockback
										Firestraight(Proj,head,amount,usr.dir,usr,trail,6+(2*range))
										usr.icon_state=temp
								if(type==3)
									usr.kame=1
									usr.timeout=0
									var/obj/overpunch=new /obj
									overpunch.layer=usr.layer+1
									overpunch.dir=usr.dir
									overpunch.icon=head
									usr.overlays+=overpunch
									usr.overlays+=trail
								/*	spawn(100)
										usr.overlays-=overpunch
										usr.overlays-=trail
										if(usr.kame==1)
											spawn(100)
												if(usr.kame==1)
													usr.kame=0
										usr.timeout=0
										killtrails()*/

									var/stepsleft=range+3
									loop
									var/mob/M=locate() in get_step(usr,usr.dir)
									if(M)
										usr.icon_state="sparpunch"

										view(6) << "<font color = red>[usr]:<font color = white> <tt>[sayafter]"
										amount=amount*(300+(50*strength))
										amount=(amount/(M.powerlevel+1))*50
										sleep(5-speed)
										var/obj/dan_projectile/trailz=new/obj/dan_projectile(locate(usr.x,usr.y,usr.z))
										trailz.icon=trail
										trailz.istrail=1

										trailz.dir=usr.dir
										trailz.owner=usr
										killtrails3(usr)
										spawn(20)
											usr.overlays-=overpunch
											usr.overlays-=trail
											usr.kame=0
											usr.density=1
											usr.timeout=0
											usr.icon_state=""
										M.hp-=amount
										var/obj/effectcover=new(M.x,M.y,M.z)
										effectcover.follow(M)
										effectcover.icon=head
										effectcover.icon_state ="cover"
										effectcover.layer=99
										spawn(24)del(effectcover)
										if(knockback)
											if(M.client||istype(M,/mob/monsters))
												M.knockbackproc((3*knockback),usr.dir)
										if(M.race!=null|"")
											if(amount>20)
												spawn()
													var/O = new /obj/crator(M.loc)
													var/I = new /mob/smoke(M.loc)
													flick("smoke",I)
													sleep(50)
													del(I)
													sleep(200)
													del(O)
											spawn()M.Die()
											spawn()usr.KO()
									else
										sleep(5-speed)
										var/obj/dan_projectile/trailz=new/obj/dan_projectile(locate(usr.x,usr.y,usr.z))
										step(usr,usr.dir)
										trailz.dir=usr.dir
										trailz.icon=trail
										trailz.istrail=1
										trailz.owner=usr

										stepsleft-=1
										if(stepsleft>0)
											goto loop
										else
											killtrails3(usr)
											usr.overlays-=overpunch
											usr.overlays-=trail
											sleep(10)
											usr.kame=0
											usr.timeout=0
								if(type==4)
									view(6) << "[usr] begins charging a [name]</u></b>"
									var/obj/snart = new /obj(locate(usr.x,usr.y+1,usr.z))
									snart.icon=head
									snart.owner=usr.key
									usr.kame = 1
									loop
									var/totalsleep=100-(10*speed)
									if(totalsleep<50)
										totalsleep=50
									sleep(totalsleep)

									switch(input("Do you wish to fire the [name]??or continue charging.", "[name]", text) in list ("Fire", "Charge"))
										if ("Fire")
											var/mob/M=input("Choose a target","Target")as mob in oview(4+(3*range))
											del(snart)
											spawn(3)usr.kame = 0
											usr.icon_state=""
											if(M)
												amount=amount*(500+(100*strength))
												amount=(amount/(M.powerlevel+1))*50
												var/inrange=0
												for(var/mob/X in oview(6+(range*3)))
													if(M==X)
														if(M.z==usr.z)
															inrange=1
												if(inrange==1)
													s_missile(head,usr,M)
													sleep(5)
													if(M)
														M.hp-= dam

														if(M.race!=null|"")
															if(amount>20)
																spawn()
																	var/O = new /obj/crator(M.loc)
																	var/I = new /mob/smoke(M.loc)
																	flick("smoke",I)
																	sleep(50)
																	del(I)
																	sleep(200)
																	del(O)
															spawn()M.Die()
															spawn()usr.KO()

										if ("Charge")
											amount+=(amount/10)
											for(var/mob/characters/o in oview(2))
												switch(input(o,"Do you want to help charge [usr]'s [name]?.", "[name]", text) in list ("Yes", "No"))
													if("Yes")
														var/dam2 = input(o,"How much do you wish to put into the [name]?") as num|null
														if(dam2<o.ki&&dam2>0)
															amount+=dam2
															o.ki-=dam2
											goto loop
								if(type==5)
									usr.kame=1
									if(usr.ki>=usr.maxki/5)
										usr.ki-=(usr.maxki/5)
										if(usr.flight == 1)
											usr << "<b>You are too busy to! (You are flying)."
										if(usr.flight == 0)
											var/mob/M=input("Choose a target","Target")as mob in oview(3+(1*range))
											if(M)
												var/atom/kiloc = locate(M.x,M.y,M.z)
												var/projthing=head
												if(trail)
													projthing=trail
												s_missile(projthing,usr,kiloc)
												flick("ki",usr)
												view(6) << "[saybefore]"
												sleep(60-(10*speed))
												if(M.loc.x==kiloc.x && M.loc.y==kiloc.y && M.loc.z == kiloc.z)
													view(6) << "[sayafter]"
													view(6) << "<font color = blue><i>[M] gets held by [usr]'s [name]!!"
													var/usrpowerlevel=usr.powerlevel
													if(usrpowerlevel==null)
														usrpowerlevel=1
													if(usrpowerlevel<=0)
														usrpowerlevel=1
													if(!usrpowerlevel)
														usrpowerlevel=1

													var/mpowerlevel=M.powerlevel
													if(mpowerlevel<=0)
														mpowerlevel=1
													if(!mpowerlevel)
														mpowerlevel=1
													if(mpowerlevel==null)
														mpowerlevel=1
													var/holdtime=(usrpowerlevel/mpowerlevel)*(30+(10*strength))
													if(holdtime>100)
														holdtime=100
													if(holdtime<10)
														holdtime=10
													sleep(5)
													M.move = 0
													M.heldwith=head
													M.overlays += M.heldwith
													sleep(holdtime)
													M.overlays -= M.heldwith
													M.heldwith=0
													M.move = 1

												else
													view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the [name] to miss him!"

									else
										usr<<"Not enough ki!"
									spawn(100)
										usr.kame=0
obj/customcplstuff
	talkconfig
		icon='talkicon.dmi'
		Click()
			var/q1=input("Type what you want to say before firing the attack?") as null|text
			usr.customcpl[22]=q1
			var/q2=input("Type what you want to say after firing the attack?") as null|text
			usr.customcpl[23]=q2
	headnext
		icon='right.dmi'
		Click()
			usr.customcpl[17]+=1
			if(usr.customcpl[17]>7)
				usr.customcpl[17]=1
			for(var/obj/headblock/X1 in world)
				var/image/headicon/whitecover=image('white.dmi',X1,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon
				if(usr.customcpl[17]==1)
					covericon='custom_head1.dmi'
				if(usr.customcpl[17]==2)
					covericon='custom_head2.dmi'
				if(usr.customcpl[17]==3)
					covericon='custom_head3.dmi'
				if(usr.customcpl[17]==4)
					covericon='custom_head4.dmi'
				if(usr.customcpl[17]==5)
					covericon='custom_head5.dmi'
				if(usr.customcpl[17]==6)
					covericon='custom_head6.dmi'
				if(usr.customcpl[17]==7)
					covericon='custom_head7.dmi'
				if(usr.customcpl[17]==8)
					covericon=""
				usr.customcpl[19]=covericon
				var/image/headicon/coverimage=image(covericon,X1,"",6,NORTH)
				usr:client.images+= coverimage
	headlast
		icon='left.dmi'
		Click()

			usr.customcpl[17]-=1
			if(usr.customcpl[17]<=0)
				usr.customcpl[17]=7
			for(var/obj/headblock/X1 in world)
				var/image/headicon/whitecover=image('white.dmi',X1,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon
				if(usr.customcpl[17]==1)
					covericon='custom_head1.dmi'
				if(usr.customcpl[17]==2)
					covericon='custom_head2.dmi'
				if(usr.customcpl[17]==3)
					covericon='custom_head3.dmi'
				if(usr.customcpl[17]==4)
					covericon='custom_head4.dmi'
				if(usr.customcpl[17]==5)
					covericon='custom_head5.dmi'
				if(usr.customcpl[17]==6)
					covericon='custom_head6.dmi'
				if(usr.customcpl[17]==7)
					covericon='custom_head7.dmi'
				if(usr.customcpl[17]==8)
					covericon=""
				usr.customcpl[19]=covericon
				var/image/headicon/coverimage=image(covericon,X1,"",6,NORTH)
				usr:client.images+= coverimage
	trailnext
		icon='right.dmi'
		Click()
			usr.customcpl[17]+=1
			if(usr.customcpl[17]>8)
				usr.customcpl[17]=1
			for(var/obj/trailblock/X1 in world)
				var/image/trailicon/whitecover=image('white.dmi',X1,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon
				if(usr.customcpl[17]==1)
					covericon='custom_trail1.dmi'
				if(usr.customcpl[17]==2)
					covericon='custom_trail2.dmi'
				if(usr.customcpl[17]==3)
					covericon='custom_trail3.dmi'
				if(usr.customcpl[17]==4)
					covericon='custom_trail4.dmi'
				if(usr.customcpl[17]==5)
					covericon='custom_trail5.dmi'
				if(usr.customcpl[17]==6)
					covericon='custom_trail6.dmi'
				if(usr.customcpl[17]==7)
					covericon='custom_trail7.dmi'
				if(usr.customcpl[17]==8)
					covericon='custom_trail8.dmi'
				usr.customcpl[20]=covericon
				var/image/trailicon/coverimage=image(covericon,X1,"",6,NORTH)
				usr:client.images+= coverimage
	traillast
		icon='left.dmi'
		Click()
			usr.customcpl[17]-=1
			if(usr.customcpl[17]<=0)
				usr.customcpl[17]=8
			for(var/obj/trailblock/X1 in world)
				var/image/trailicon/whitecover=image('white.dmi',X1,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon
				if(usr.customcpl[17]==1)
					covericon='custom_trail1.dmi'
				if(usr.customcpl[17]==2)
					covericon='custom_trail2.dmi'
				if(usr.customcpl[17]==3)
					covericon='custom_trail3.dmi'
				if(usr.customcpl[17]==4)
					covericon='custom_trail4.dmi'
				if(usr.customcpl[17]==5)
					covericon='custom_trail5.dmi'
				if(usr.customcpl[17]==6)
					covericon='custom_trail6.dmi'
				if(usr.customcpl[17]==7)
					covericon='custom_trail7.dmi'
				if(usr.customcpl[17]==8)
					covericon='custom_trail8.dmi'
				usr.customcpl[20]=covericon
				var/image/trailicon/coverimage=image(covericon,X1,"",6,NORTH)
				usr:client.images+= coverimage
	headinp
		icon='input.dmi'
		Click()
			switch(input("Import Head Icon?.", "Icon", text) in list ("Yes", "No"))
				if("Yes")
					var/icon/econ = input("Pick icon:","Icon") as icon|null
					if(check_icon(econ))
						var/facesize=length(econ)
						var/namesize=length("[econ]")
						if(facesize<=300000||namesize<=15)
							usr.customcpl[19]=econ
							for(var/obj/headblock/X in world)
								var/image/headicon/whitecover=image('white.dmi',X,"",6,NORTH)
								usr:client.images+= whitecover
								var/image/headicon/coverimage=image(econ,X,"",6,NORTH)
								usr:client.images+=coverimage

						else
							usr<<"To big."
					else
						usr<<"That was a corrupt icon"
	trailinp
		icon='input.dmi'
		Click()
			switch(input("Import Trail Icon?.", "Icon", text) in list ("Yes", "No"))
				if("Yes")
					var/icon/econ = input("Pick icon:","Icon") as icon|null
					if(check_icon(econ))
						var/facesize=length(econ)
						var/namesize=length("[econ]")
						if(facesize<=300000||namesize<=15)
							usr.customcpl[20]=econ
							for(var/obj/trailblock/X in world)
								var/image/trailicon/whitecover=image('white.dmi',X,"",6,NORTH)
								usr:client.images+= whitecover
								var/image/trailicon/coverimage=image(econ,X,"",6,NORTH)
								usr:client.images+=coverimage

						else
							usr<<"To big."
					else
						usr<<"That was a corrupt icon"
	headcolorinp
		icon='input.dmi'
		Click()

			var/red= input("Enter RED (0-255).","RGB",0)
			var/green= input("Enter GREEN (0-255).","RGB",0)
			var/blue= input("Enter BLUE (0-255).","RGB",0)
			for(var/image/colorbox/O in usr.client.images)
				del(O)
			usr.customcpl[11]=red
			usr.customcpl[12]=green
			usr.customcpl[13]=blue
			for(var/obj/colorblock1/X1 in world)
				var/covericon='colorblock.dmi'
				covericon += rgb(red,green,blue)
				var/image/colorbox/coverimagecolored=image(covericon,X1,"",6)
				usr:client << coverimagecolored
	previewshow
		icon='show.dmi'
		Click()
			for(var/obj/previewhead/X1 in world)
				var/image/whitecover=image('white.dmi',X1,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon=usr.customcpl[19]
				covericon += rgb(usr.customcpl[11],usr.customcpl[12],usr.customcpl[13])
				var/image/coverimage=image(covericon,X1,"",6,EAST)
				usr:client << coverimage
			for(var/obj/previewtrail/X2 in world)
				var/image/whitecover=image('white.dmi',X2,"",6,NORTH)
				usr:client.images+= whitecover
				var/covericon=usr.customcpl[20]
				covericon += rgb(usr.customcpl[14],usr.customcpl[15],usr.customcpl[16])
				var/image/coverimage=image(covericon,X2,"",6,EAST)
				usr:client << coverimage

	trailcolorinp
		icon='input.dmi'
		Click()
			var/red= input("Enter RED (0-255).","RGB",0)
			var/green= input("Enter GREEN (0-255).","RGB",0)
			var/blue= input("Enter BLUE (0-255).","RGB",0)
			for(var/image/colorbox2/O in usr.client.images)
				del(O)
			usr.customcpl[14]=red
			usr.customcpl[15]=green
			usr.customcpl[16]=blue
			for(var/obj/colorblock2/X1 in world)
				var/covericon='colorblock.dmi'
				covericon += rgb(red,green,blue)
				var/image/colorbox2/coverimagecolored=image(covericon,X1,"",6)
				usr:client << coverimagecolored
	nameinp
		icon='input.dmi'
		Click()
			var/q1=input("What do you want to name your ki attack?") as null|text
			if(q1=="")
				q1="Custom Attack"
			usr.customcpl[8]=q1
	skilllevelinp
		icon='input.dmi'
		Click()

			switch(input("What Skill Level do you want to make this skill, the stat points for the skill is equal to double the skill level plus 1. The higher the skill level the more difficult it is to learn.", "Skill Level") in list ("1(5000pl)","2(50000pl)","3(250000pl)","4(750000pl)","5(1500000pl)","6(5000000pl)","7(10000000pl)"))
				if("1(5000pl)")
					if(usr.maxpowerlevel>=5000)
						usr.customcpl[9]=1
						usr.customcpl[1]=3
				if("2(50000pl)")
					if(usr.maxpowerlevel>=50000)
						usr.customcpl[9]=2
						usr.customcpl[1]=4
				if("3(250000pl)")
					if(usr.maxpowerlevel>=250000)
						usr.customcpl[9]=3
						usr.customcpl[1]=5
				if("4(750000pl)")
					if(usr.maxpowerlevel>=750000)
						usr.customcpl[9]=4
						usr.customcpl[1]=6
				if("5(1500000pl)")
					if(usr.maxpowerlevel>=1500000)
						usr.customcpl[9]=5
						usr.customcpl[1]=7
				if("6(5000000pl)")
					if(usr.maxpowerlevel>=5000000)
						usr.customcpl[9]=6
						usr.customcpl[1]=8
				if("7(10000000pl)")
					if(usr.maxpowerlevel>=10000000)
						usr.customcpl[9]=7
						usr.customcpl[1]=9
			usr.customcpl[2]=0
			usr.customcpl[4]=0
			usr.customcpl[5]=0
			usr.customcpl[6]=0
			usr.customcpl[7]=0
			for(var/obj/fullstar/O in world)
				usr:client.images-=O:coverimage

	powerinc
		icon='up.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[2]<5)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[2]<5)
					usr.customcpl[1]-=1
					usr.customcpl[2]+=1
					for(var/obj/fullstar/strengthstars/O in world)
						if(usr.customcpl[2]>=1&&istype(O,/obj/fullstar/strengthstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=2&&istype(O,/obj/fullstar/strengthstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=3&&istype(O,/obj/fullstar/strengthstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Three))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=4&&istype(O,/obj/fullstar/strengthstars/Four))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Four))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=5&&istype(O,/obj/fullstar/strengthstars/Five))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Five))
								usr.client.images -= O.coverimage
	powerdec
		icon='down.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[2]>0)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[2]>0)
					usr.customcpl[1]+=1
					usr.customcpl[2]-=1
					for(var/obj/fullstar/strengthstars/O in world)
						if(usr.customcpl[2]>=1&&istype(O,/obj/fullstar/strengthstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=2&&istype(O,/obj/fullstar/strengthstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=3&&istype(O,/obj/fullstar/strengthstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Three))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=4&&istype(O,/obj/fullstar/strengthstars/Four))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Four))
								usr.client.images -= O.coverimage
						if(usr.customcpl[2]>=5&&istype(O,/obj/fullstar/strengthstars/Five))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/strengthstars/Five))
								usr.client.images -= O.coverimage
	speedinc
		icon='up.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[4]<5)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[4]<5)
					usr.customcpl[1]-=1
					usr.customcpl[4]+=1
					for(var/obj/fullstar/speedstars/O in world)
						if(usr.customcpl[4]>=1&&istype(O,/obj/fullstar/speedstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=2&&istype(O,/obj/fullstar/speedstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=3&&istype(O,/obj/fullstar/speedstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Three))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=4&&istype(O,/obj/fullstar/speedstars/Four))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Four))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=5&&istype(O,/obj/fullstar/speedstars/Five))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Five))
								usr.client.images -= O.coverimage
	speeddec
		icon='down.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[4]>0)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[4]>0)
					usr.customcpl[1]+=1
					usr.customcpl[4]-=1
					for(var/obj/fullstar/speedstars/O in world)
						if(usr.customcpl[4]>=1&&istype(O,/obj/fullstar/speedstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=2&&istype(O,/obj/fullstar/speedstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=3&&istype(O,/obj/fullstar/speedstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Three))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=4&&istype(O,/obj/fullstar/speedstars/Four))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Four))
								usr.client.images -= O.coverimage
						if(usr.customcpl[4]>=5&&istype(O,/obj/fullstar/speedstars/Five))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/speedstars/Five))
								usr.client.images -= O.coverimage
	rangeinc
		icon='up.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[5]<3)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[1]>0&&usr.customcpl[5]<3)
					usr.customcpl[1]-=1
					usr.customcpl[5]+=1
					for(var/obj/fullstar/rangestars/O in world)
						if(usr.customcpl[5]>=1&&istype(O,/obj/fullstar/rangestars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[5]>=2&&istype(O,/obj/fullstar/rangestars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[5]>=3&&istype(O,/obj/fullstar/rangestars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/Three))
								usr.client.images -= O.coverimage

	rangedec
		icon='down.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[5]>0)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[5]>0)
					usr.customcpl[1]+=1
					usr.customcpl[5]-=1
					for(var/obj/fullstar/rangestars/O in world)
						if(usr.customcpl[5]>=1&&istype(O,/obj/fullstar/rangestars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[5]>=2&&istype(O,/obj/fullstar/rangestars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[5]>=3&&istype(O,/obj/fullstar/rangestars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/rangestars/Three))
								usr.client.images -= O.coverimage
	knockbackinc
		icon='up.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[1]>2&&usr.customcpl[6]<3)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[1]>2&&usr.customcpl[6]<3)
					usr.customcpl[1]-=3
					usr.customcpl[6]+=1
					for(var/obj/fullstar/knockbackstars/O in world)
						if(usr.customcpl[6]>=1&&istype(O,/obj/fullstar/knockbackstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[6]>=2&&istype(O,/obj/fullstar/knockbackstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[6]>=3&&istype(O,/obj/fullstar/knockbackstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/Three))
								usr.client.images -= O.coverimage

	knockbackdec
		icon='down.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[6]>0)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[6]>0)
					usr.customcpl[1]+=3
					usr.customcpl[6]-=1
					for(var/obj/fullstar/knockbackstars/O in world)
						if(usr.customcpl[6]>=1&&istype(O,/obj/fullstar/knockbackstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/One))
								usr.client.images -= O.coverimage
						if(usr.customcpl[6]>=2&&istype(O,/obj/fullstar/knockbackstars/Two))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/Two))
								usr.client.images -= O.coverimage
						if(usr.customcpl[6]>=3&&istype(O,/obj/fullstar/knockbackstars/Three))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/knockbackstars/Three))
								usr.client.images -= O.coverimage
	peircinginc
		icon='up.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[1]>1&&usr.customcpl[7]<1)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[1]>1&&usr.customcpl[7]<1)
					usr.customcpl[1]-=2
					usr.customcpl[7]+=1
					for(var/obj/fullstar/peircingstars/O in world)
						if(usr.customcpl[7]>=1&&istype(O,/obj/fullstar/peircingstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/peircingstars/One))
								usr.client.images -= O.coverimage


	peircingdec
		icon='down.dmi'
		Click()
			if(usr.customcpl[3]&&usr.customcpl[7]>0)
				sleep(1)
				if(usr.customcpl[3]&&usr.customcpl[7]>0)
					usr.customcpl[1]+=2
					usr.customcpl[7]-=1
					for(var/obj/fullstar/peircingstars/O in world)
						if(usr.customcpl[7]>=1&&istype(O,/obj/fullstar/peircingstars/One))
							usr:client << O.coverimage
						else
							if(istype(O,/obj/fullstar/peircingstars/One))
								usr.client.images -= O.coverimage
turf
	name = ""
turf
	var
		ack
atom
	var

		destructable
		destroyspassable=0

turf
	ZVoid
		layer = MOB_LAYER+3
		icon = 'turfs.dmi'
		icon_state = "black"
		density = 1
		opacity = 1
		Enter()
			if(istype(usr,/obj))
				return 1
			else
				return 0


	ZnoFlying
		layer = MOB_LAYER+3
		icon = 'turfs.dmi'
		icon_state = "black"
		density = 1
		opacity = 1
		Enter()
			if(istype(usr,/obj))
				return 1
			else
				return 0


	Zinviswall
		density = 1
		opacity = 0
		Enter()
			if(istype(usr,/obj))
				return 1
			else
				if(istype(usr,/mob/characters))
					usr.loc=locate(74,35,10)
				else
					return 0


	Zgmblock
		density = 1
		opacity = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.key=="TheMax1087"||usr.key=="Garma")
					return 1
				else
					return 0
	Zgmblock2
		density = 1
		opacity = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.gm)
					return 1
				else
					return 0
	computers
		icon = 'Atm.dmi'
		density = 1
		Click()
			if(src in view(1))
				switch(input("What do you wish to do?") in list("View Website","Bank"))
					if("View Website")
						usr.sample_report()
					if("Edit Corner")
						usr.corner = input(usr,"What do you wish to write in your corner. You may use HTML (<br> and <p> to skip lines)","Corner Edit",usr.corner) as message
					if("Bank")
						switch(input("You currently have [usr.bankzenni]z Banked") in list("Withdraw","Deposit"))
							if("Withdraw")
								var/withdraw = input("How much zenni do you wish to withdraw") as num|null
								if(usr.bankzenni>=withdraw && withdraw>0)
									usr.zenni+=withdraw
									usr.bankzenni-=withdraw
							if("Deposit")
								var/deposit = input("How much zenni do you wish to put into the bank") as num|null
								if(usr.zenni>=deposit && deposit>0)
									usr.zenni-=deposit
									usr.bankzenni+=deposit
			else
				usr << "You must stand in front of the ATM to use it!"



	Kingkaimiss
		name = "North Kaio Mission"
		icon = 'mobs.dmi'
		icon_state = "northkaio"
		Enter()
			if(istype(usr,/mob/characters))
				switch(input("Choose a Mission", "Mission Selection",text) in list ("Defeat all the enraged citizens of Hell..{MAXPOWERLEVEL ADVISORY!!}4MILLION!!","Abort!"))
					if("Defeat all the enraged citizens of Hell..{MAXPOWERLEVEL ADVISORY!!}4MILLION!!")
						if(usr.dead)
							return
						else
							if(usr.mission1==0)
								usr.loc=locate(80,210,8)
								sleep(7)
								usr << "You are in Hell you must find the enraged citizens!!..."
								usr.mission1=1
							else
								usr << "You are already doing this mission"
								sleep(7)
								usr << "Returning you to hell..."
								usr.loc=locate(80,210,8)
								return

			else
				return 1

//						if("1B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=15)
//									usr.loc=locate(89,143,10)
//						if("2B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=16)
//									usr.loc=locate(89,127,10)
//						if("3B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=17)
//									usr.loc=locate(89,111,10)
//						if("4B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=18)
//									usr.loc=locate(89,95,10)
//						if("5B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=19)
//									usr.loc=locate(94,79,10)
//						if("6B")
//							if(usr.dead)
//								return
//							else
//								if(usr.questsdone>=20)
//									usr.loc=locate(94,62,10)

	babadiship
		icon = 'babadiship.dmi'
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				switch(input("Choose a Floor", "Elevator",text) in list ("0","1B","2B","3B","4B","5B","6B"))
					if("0")
						if(usr.dead)
							return
						else
							usr.loc=locate(84,78,1)
					if("1B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=15)
								usr.loc=locate(89,143,10)
					if("2B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=16)
								usr.loc=locate(89,127,10)
					if("3B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=17)
								usr.loc=locate(89,111,10)
					if("4B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=18)
								usr.loc=locate(89,95,10)
					if("5B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=19)
								usr.loc=locate(94,79,10)
					if("6B")
						if(usr.dead)
							return
						else
							if(usr.questsdone>=20)
								usr.loc=locate(94,62,10)
			else
				return 1
	babadiship2
		icon = 'babadiship2.dmi'
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				switch(input("Choose a Floor", "Elevator",text) in list ("0","1B","2B","3B","4B","5B","6B"))
					if("0")
						usr.loc=locate(84,78,1)
					if("1B")
						if(usr.questsdone>=15)
							usr.loc=locate(89,143,10)
					if("2B")
						if(usr.questsdone>=16)
							usr.loc=locate(89,127,10)
					if("3B")
						if(usr.questsdone>=17)
							usr.loc=locate(89,111,10)
					if("4B")
						if(usr.questsdone>=18)
							usr.loc=locate(89,95,10)
					if("5B")
						if(usr.questsdone>=19)
							usr.loc=locate(94,79,10)
					if("6B")
						if(usr.questsdone>=20)
							usr.loc=locate(94,62,10)
			else
				return 1
	babadiship4
		icon = 'babadiship.dmi'
		density = 1

	babadiship3
		icon = 'babadiship2.dmi'
		density = 0
	namekhouse
		icon = 'nhouse.dmi'
		density = 1
/*
	Planets
		PlanetVegeta
			icon = ''
			icon_state = ''
			density = 1
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(x,y,z)
				else
					return 1
*/
	Brendan
		teleporter1
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(16,12,21)
				else
					return 1
		teleporter2
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(22,12,21)
				else
					return 1
		teleporter3
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(7,12,21)
				else
					return 1
		teleporter4
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(39,21,21)
				else
					return 1
		teleporter5
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(65,12,21)
				else
					return 1
		teleporter6
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(38,82,21)
				else
					return 1
		teleporter7
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(6,10,21)
				else
					return 1
		teleporter8
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(38,2,21)
				else
					return 1
		teleporter9
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(8,10,21)
				else
					return 1
		teleporter10
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(42,2,21)
				else
					return 1
		teleporter11
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(20,8,21)
				else
					return 1
		teleporter12
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(18,8,21)
				else
					return 1
		teleporter13
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(17,6,21)
				else
					return 1
		teleporter14
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(97,18,21)
				else
					return 1
		teleporter15
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(21,6,21)
				else
					return 1
		teleporter16
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(25,212,21)
				else
					return 1
		teleporter17
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(19,9,21)
				else
					return 1
/*
		teleporterfinal
			density=0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == ""||usr.guild == "")
						usr.loc=locate(2,2,21)
				else if
				else if
				else if
				else if
				else if
				else if
				else if
				else if
				else if
				else if
				else if
					return 1
*/
		teleportersupreme
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(21,128,10)
				else
					return 1
		teleporterx
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(213,207,1)
				else
					return 1
		teleporternamek
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(146,60,5)
				else
					return 1
		teleporteryemma
			density = 0
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "<b><font face=Abbey-Medium><font color=#8B0000><font size=3> TE> Apostles </font></font></font></b>"||usr.guild == "<b><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f70000>:</FONT><FONT COLOR=#ef0000>:</FONT><FONT COLOR=#e60000>i</FONT><FONT COLOR=#de0000>l</FONT><FONT COLOR=#d50000>l</FONT><FONT COLOR=#cd0000>u</FONT><FONT COLOR=#c40000>m</FONT><FONT COLOR=#bc0000>i</FONT><FONT COLOR=#b30000>n</FONT><FONT COLOR=#ab0000>a</FONT><FONT COLOR=#a20000>t</FONT><FONT COLOR=#9a0000>i</FONT><FONT COLOR=#910000>:</FONT><FONT COLOR=#890000>:</FONT><FONT COLOR=#800000>.</FONT></b>")
						usr.loc=locate(51,28,3)
				else
					return 1
		templeleave
			density = 0
			Enter()
				if(usr.timeperiod==0)
					usr.loc=locate(34,135,1)
				if(usr.timeperiod==1)
					usr.loc=locate(110,112,13)
		templeenter
			density = 0
			Enter()
				usr<<"Welcome to the Temple of the Third Eye"
				usr.loc=locate(7,6,21)
		Doorleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Doorleft"
			density = 0
		Doorright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Doorright"
			density = 0
		Carpettopleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpettopleft"
			density = 0
		Carpetleft2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetleft2"
			density = 0
		Carpetbotleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetbotleft"
			density = 0
		Carpettopright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpettopright"
			density = 0
		Carpetbotright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetbotright"
			density = 0
		Carpetbotright2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetbotright2"
			density = 0
		Carpetside
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetside"
			density = 0
		Carpetvert
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetvert"
			density = 0
		Carpetintright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetintright"
			density = 0
		Carpetintleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetintleft"
			density = 0
		Carpetlargecorner1
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlargecorner1"
			density = 0
		Carpetlargecorner2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlargecorner2"
			density = 0
		Carpetlargecorner3
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlargecorner3"
			density = 0
		Carpetlargecorner4
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlargecorner4"
			density = 0
		Carpetlarge1
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge1"
			density = 0
		Carpetlarge2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge2"
			density = 0
		Carpetlarge3
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge3"
			density = 0
		Carpetlarge4
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge4"
			density = 0
		Carpetlarge5
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge5"
			density = 0
		Carpetlarge6
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge6"
			density = 0
		Carpetlarge7
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge7"
			density = 0
		Carpetlarge8
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge8"
			density = 0
		Carpetlarge9
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge9"
			density = 0
		Carpetlarge10
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge10"
			density = 0
		Carpetlarge11
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetlarge11"
			density = 0
		Carpetcross
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetcross"
			density = 0
		Carpettop
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpettop"
			density = 0
		Carpetbottom
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Carpetbottom"
			density = 0
		Tileleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Tileleft"
			density = 0
		Tileright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Tileright"
			density = 0
		Tilehalf
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Tilehalf"
			density = 0
		Torchleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Torchleft"
			density = 1
		Torchright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Torchright"
			density = 1
		BRENDANONLY
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.key=="Cyberpirate"||usr.key=="Kadajz"||usr.key=="Trunks2525"||usr.key=="Team Hybrid")
						return 1
					else
						return 0
				else
					return 1
		darknesscheckban
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.bannedfromdark==0)
						return 1
					else
						return 0
				else
					return 1
		darknessonly
			density=1
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						return 1
					else
						return 0
		marsteronly
			density=1
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.key=="TheMax1087"||usr.key=="Lonin"||usr.key=="RISINGGUNDAM"||usr.key=="Berkbria"||usr.key=="ManiacofArsen"||usr.key=="Marster1990"||usr.key=="Soccer11"||usr.key=="RPGuy"||usr.key=="Gohan3214"||usr.key=="Garma")
						return 1
					else
						return 0
		Stepscenter
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Stepscenter"
			density = 0
		Stepsleft
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Stepsleft"
			density = 0
		Steps1
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Steps1"
			density = 0
		Steps2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Steps2"
			density = 0
		Stepsright
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Stepsright"
			density = 0
		Hole
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Hole"
			density = 0
		PillLDown
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillLDown"
			density = 1
		PillLDown2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillLDown2"
			density = 1
		PillLUp
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillLUp"
			density = 1
		PillLUp2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillLUp2"
			density = 1
		PillRDown
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillRDown"
			density = 1
		PillRDown2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillRDown2"
			density = 1
		PillRUp
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillRUp"
			density = 1
		PillRUp2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "PillRUp2"
			density = 1
		ChairUp
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "ChairUp"
			density = 0
		ChairDown
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "ChairDown"
			density = 0
		Banner
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Banner"
			density = 0
		Banner2
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Banner2"
			density = 0
		Wall
			icon= 'Temple Inside/Brendans Turfs.dmi'
			icon_state = "Wall"
			density = 1
		Doordown
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Doordown"
			density = 0
		Doorup
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Doorup"
			density = 1
		PillLout
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillLout"
			density = 1
		PillLout2
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillLout2"
			density = 1
		PillL
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillL"
			density = 1
		PillL2
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillL2"
			density = 1
		PillRout
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillRout"
			density = 1
		PillRout2
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillRout2"
			density = 1
		PillR
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillR"
			density = 1
		PillR2
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "PillR2"
			density = 1
		Roof
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Roof"
			density = 1
		Roofleft
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Roofleft"
			density = 1
		Roofright
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Roofright"
			density = 1
		Roofback
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Roofback"
			density = 1
		Rooftopleft
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Rooftopleft"
			density = 1
		Rooftopright
			icon= 'Temple Outside/Brendans Turfs.dmi'
			icon_state = "Rooftopright"
			density = 1
	d1
		icon= 'zdamage.dmi'
		icon_state = "d1"
		density = 0
	d2
		icon= 'zdamage.dmi'
		icon_state = "d2"
		density = 0
	d3
		icon= 'zdamage.dmi'
		icon_state = "d3"
		density = 0
	d4
		icon= 'zdamage.dmi'
		icon_state = "d4"
		density = 0
	d5
		icon= 'zdamage.dmi'
		icon_state = "d5"
		density = 0
	d6
		icon= 'zdamage.dmi'
		icon_state = "d6"
		density = 0
	d7
		icon= 'zdamage.dmi'
		icon_state = "d7"
		density = 0
	d8
		icon= 'zdamage.dmi'
		icon_state = "d8"
		density = 0
	d9
		icon= 'zdamage.dmi'
		icon_state = "d9"
		density = 0
	d10
		icon= 'zdamage.dmi'
		icon_state = "d10"
		density = 0
	d11
		icon= 'zdamage.dmi'
		icon_state = "d11"
		density = 0
	d12
		icon= 'zdamage.dmi'
		icon_state = "d12"
		density = 0
	dnamek1
		icon= 'corpses.dmi'
		icon_state = "dnamek1"
		density = 1
	gym
		icon= 'corpses.dmi'
		icon_state = "gym"
		density = 0
		layer=3
	corpseclothes
		clothes1
			icon= 'corpses.dmi'
			icon_state = "clothes1"
			density = 0
		clothes2
			icon= 'corpses.dmi'
			icon_state = "clothes2"
			density = 0
		clothes3
			icon= 'corpses.dmi'
			icon_state = "clothes3"
			density = 0
		clothes4
			icon= 'corpses.dmi'
			icon_state = "clothes4"
			density = 0
		clothes5
			icon= 'corpses.dmi'
			icon_state = "clothes5"
			density = 0
		clothes6
			icon= 'corpses.dmi'
			icon_state = "clothes6"
			density = 0
	dnamek2
		icon= 'corpses.dmi'
		icon_state = "dnamek2"
		density = 1
	redblue
		icon = 'turfs.dmi'
		icon_state = "redblue"

	nofly
		Enter()
			usr.flight = 0
			usr.density = 1
			usr.icon_state = ""
			return 1
	grass
		icon = 'turfs.dmi'
		icon_state = "grass" //Summer Time
		//icon_state = "snow"  //Winter Time
		density = 0
	buildingtopWoCChimp
		name = "Chimp's Statue"
		icon = 'WoC Stats.dmi'
		icon_state = "Chimp"
		density = 1
	buildingtopWoCDouch
		name = "Douch's Statue"
		icon = 'WoC Stats.dmi'
		icon_state = "Douch"
		density = 1
	buildingtopWoCKiba
		name = "Baki's Statue"
		icon = 'WoC Stats.dmi'
		icon_state = "Baki"
		density = 1
	buildingtopWoC
		icon = 'turfs.dmi'
		icon_state = "buildingtop"
		density = 0
		layer=999
	buildingtop
		icon = 'turfs.dmi'
		icon_state = "buildingtop"
		density = 1
	buildingtopright
		icon = 'turfs.dmi'
		icon_state = "buildingtopright"
		density = 1
	buildingtopleft
		icon = 'turfs.dmi'
		icon_state = "buildingtopleft"
		density = 1
	buildingtopdownright
		icon = 'turfs.dmi'
		icon_state = "buildingtopdownright"
		density = 1
	buildingtopdownleft
		icon = 'turfs.dmi'
		icon_state = "buildingtopdownleft"
		density = 1
	Future
		doorentrance
			icon = 'turfs.dmi'
			icon_state = "doorunlocked"
			density = 0
			locked=0
			opacity=0
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(89,1,21)
		leave
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.timeperiod==0)
						usr.loc=locate(218,178,1)
					if(usr.timeperiod==1)
						usr.loc=locate(135,171,13)
		doorunlocked
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						flick("dooropening",src)
						src.icon_state= "doorunlocked"
						src.locked=0
						sleep(50)
						flick("doorclosing",src)
						src.icon_state= "doorlocked"
						src.locked=1
					else
						return 1
		doorpasslocked
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						var/password=input("Enter the password","Passlocked") as num
						if(password==123)
							flick("dooropening",src)
							src.icon_state= "doorunlocked"
							src.locked=0
							sleep(50)
							flick("doorclosing",src)
							src.icon_state= "doorlocked"
							src.locked=1
						else
							usr<<"WRONG"
					else
						return 1
/*		doorlocked1
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						var/keycodes=0
						for(var/obj/keycards/O in usr.contents)
							if(O.name=="Red Keycard"||O.name=="Green Keycard"||O.name=="Blue Keycard"||O.name=="Gold Keycard")
								keycodes=1

						if(keycodes==1)
							flick("dooropening",src)
							src.icon_state= "doorunlocked"
							src.locked=0
							sleep(50)
							flick("doorclosing",src)
							src.icon_state= "doorlocked"
							src.locked=1
						else
							usr<<"*The door beeps and goes silent in refusal*"
							switch(input("Try to hack the door?", "Hack?", text) in list ("Yes","No"))
								if("Yes")
									var/answer=0
									answer+= rand(1,100)
									usr<<"[usr] Starts hacking the door."
									var/tries=0
									loop
									var/number=input("Guess the password","1-100") as num
									if(number==answer)
										usr<<"Hacking Complete"
										flick("dooropening",src)
										src.icon_state= "doorunlocked"
										src.locked=0
										sleep(200)
										flick("doorclosing",src)
										src.icon_state= "doorlocked"
										src.locked=1
										goto end
									if(tries>10)
										usr<<"You have failed to many times and an alarm goes off, security droids quickly arrest you."
										usr.loc=locate(62,34,21)
										usr.powerlevel=1
									if(number<answer)
										usr<<"The password is higher"
									if(number>answer)
										usr<<"The password is lower"
									switch(input("Hack the door, by guessing the password(If you choose No the password randomizes)", "Hack", text) in list ("Yes","No"))
										if("Yes")
											tries+=1
											goto loop
									end
					else
						return 1


		doorlocked2
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						var/keycodes=0
						for(var/obj/keycards/O in usr.contents)
							if(O.name=="Green Keycard"||O.name=="Blue Keycard"||O.name=="Gold Keycard")
								keycodes=1

						if(keycodes==1)
							flick("dooropening",src)
							src.icon_state= "doorunlocked"
							src.locked=0
							sleep(50)
							flick("doorclosing",src)
							src.icon_state= "doorlocked"
							src.locked=1
						else
							usr<<"*The door beeps and goes silent in refusal*"
							switch(input("Try to hack the door?", "Hack?", text) in list ("Yes","No"))
								if("Yes")
									var/answer=0
									answer+= rand(1,200)
									usr<<"[usr] Starts hacking the door."
									var/tries=0
									loop
									var/number=input("Guess the password","1-200") as num
									if(number==answer)
										usr<<"Hacking Complete"
										flick("dooropening",src)
										src.icon_state= "doorunlocked"
										src.locked=0
										sleep(200)
										flick("doorclosing",src)
										src.icon_state= "doorlocked"
										src.locked=1
										goto end
									if(tries>7)
										usr<<"You have failed to many times and an alarm goes off, security droids quickly arrest you."
										usr.loc=locate(62,34,21)
										usr.powerlevel=1
									if(number<answer)
										usr<<"The password is higher"
									if(number>answer)
										usr<<"The password is lower"
									switch(input("Hack the door, by guessing the password(If you choose No the password randomizes)", "Hack", text) in list ("Yes","No"))
										if("Yes")
											tries+=1
											goto loop
									end
					else
						return 1

		doorlocked3
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						var/keycodes=0
						for(var/obj/keycards/O in usr.contents)
							if(O.name=="Green Keycard"||O.name=="Gold Keycard")
								keycodes=1

						if(keycodes==1)
							flick("dooropening",src)
							src.icon_state= "doorunlocked"
							src.locked=0
							sleep(50)
							flick("doorclosing",src)
							src.icon_state= "doorlocked"
							src.locked=1
						else
							usr<<"*The door beeps and goes silent in refusal*"
							switch(input("Try to hack the door?", "Hack?", text) in list ("Yes","No"))
								if("Yes")
									var/answer=0
									answer+= rand(1,400)
									usr<<"[usr] Starts hacking the door."
									var/tries=0
									loop
									var/number=input("Guess the password","1-400") as num
									if(number==answer)
										usr<<"Hacking Complete"
										flick("dooropening",src)
										src.icon_state= "doorunlocked"
										src.locked=0
										sleep(200)
										flick("doorclosing",src)
										src.icon_state= "doorlocked"
										src.locked=1
										goto end
									if(tries>8)
										usr<<"You have failed to many times and an alarm goes off, security droids quickly arrest you."
										usr.loc=locate(62,34,21)
										usr.powerlevel=1
									if(number<answer)
										usr<<"The password is higher"
									if(number>answer)
										usr<<"The password is lower"
									switch(input("Hack the door, by guessing the password(If you choose No the password randomizes)", "Hack", text) in list ("Yes","No"))
										if("Yes")
											tries+=1
											goto loop
									end
					else
						return 1


		doorlocked4
			icon = 'turfs.dmi'
			icon_state = "doorlocked"
			density = 1
			locked=1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					if(locked==1)
						var/keycodes=0
						for(var/obj/keycards/O in usr.contents)
							if(O.name=="Gold Keycard")
								keycodes=1

						if(keycodes==1)
							flick("dooropening",src)
							src.icon_state= "doorunlocked"
							src.locked=0
							sleep(50)
							flick("doorclosing",src)
							src.icon_state= "doorlocked"
							src.locked=1
						else
							usr<<"*The door beeps and goes silent in refusal*"
							switch(input("Try to hack the door?", "Hack?", text) in list ("Yes","No"))
								if("Yes")
									var/answer=0
									answer+= rand(1,1000)
									usr<<"[usr] Starts hacking the door."
									var/tries=0
									loop
									var/number=input("Guess the password","1-1000") as num
									if(number==answer)
										usr<<"Hacking Complete"
										flick("dooropening",src)
										src.icon_state= "doorunlocked"
										src.locked=0
										sleep(200)
										flick("doorclosing",src)
										src.icon_state= "doorlocked"
										src.locked=1
										goto end
									if(tries>10)
										usr<<"You have failed to many times and an alarm goes off, security droids quickly arrest you."
										usr.loc=locate(62,34,21)
										usr.powerlevel=1
									if(number<answer)
										usr<<"The password is higher"
									if(number>answer)
										usr<<"The password is lower"
									switch(input("Hack the door, by guessing the password(If you choose No the password randomizes)", "Hack", text) in list ("Yes","No"))
										if("Yes")
											tries+=1
											goto loop
									end
					else
						return 1
*/
		buildingtopFuture
			icon = 'turfs.dmi'
			icon_state = "Futurebuildingtop"
			density = 1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					return 0
				else
					return 1
		buildingtopsideFuture
			icon = 'turfs.dmi'
			icon_state = "Futurebuildingtop2"
			density = 1
			opacity=1
			Enter()
				if(istype(usr,/mob/characters))
					return 0
				else
					return 1
		buildingsideFuture
			icon = 'turfs.dmi'
			icon_state = "Futurebuildingside"
			density = 1
			Enter()
				if(istype(usr,/mob/characters))
					return 0
				else
					return 1
		buildingsidedoor
			icon = 'turfs.dmi'
			icon_state = "futuredoorarch"
			density = 0
			layer=9

		buildingsideFuture
			icon = 'turfs.dmi'
			icon_state = "Futurebuildingside"
			density = 1
		compleft
			icon = 'turfs.dmi'
			icon_state = "compleft"
			density = 1
		compright
			icon = 'turfs.dmi'
			icon_state = "compright"
			density = 1
		compdown
			icon = 'turfs.dmi'
			icon_state = "compdown"
			density = 1
		compdual
			icon = 'turfs.dmi'
			icon_state = "compdual"
			density = 1
		futureChair
			icon = 'turfs.dmi'
			icon_state = "FutureChair"
			density = 0
		futureChair2
			icon = 'turfs.dmi'
			icon_state = "FutureChair2"
			density = 0
		futureChair3
			icon = 'turfs.dmi'
			icon_state = "FutureChair3"
			density = 0
		futureChair4
			icon = 'turfs.dmi'
			icon_state = "FutureChair4"
			density = 0
		tank
			icon = 'turfs.dmi'
			icon_state = "tank"
			density = 1
		redintank
			icon = 'turfs.dmi'
			icon_state = "redintank"
			density = 1
		Mutant1
			icon = 'turfs.dmi'
			icon_state = "M1"
			density = 0
		Mutant2
			icon = 'turfs.dmi'
			icon_state = "M2"
			density = 0
		Mutant3
			icon = 'turfs.dmi'
			icon_state = "M3"
			density = 0
		Mutant4
			icon = 'turfs.dmi'
			icon_state = "M4"
			density = 0
		locker
			icon = 'turfs.dmi'
			icon_state = "locker"
			density = 1
		barrel
			icon = 'turfs.dmi'
			icon_state = "Barrel"
			density = 1
		ShinraInc
			icon = 'Shinra.dmi'
			density = 1
		futurewindow1
			icon = 'turfs.dmi'
			icon_state = "futurewindow1"
			density = 1
		futurewindow2
			icon = 'turfs.dmi'
			icon_state = "futurewindow2"
			density = 1
		btopbuilding1
			icon = 'turfs.dmi'
			icon_state = "topbuilding1"
			density = 1
		btopbuilding2
			icon = 'turfs.dmi'
			icon_state = "topbuilding2"
			density = 1
		btopbuilding3
			icon = 'turfs.dmi'
			icon_state = "topbuilding3"
			density = 1
		bbottombuilding1
			icon = 'turfs.dmi'
			icon_state = "bottombuilding1"
			density = 1
		bbottombuilding2
			icon = 'turfs.dmi'
			icon_state = "bottombuilding2"
			density = 1
		bbottombuilding3
			icon = 'turfs.dmi'
			icon_state = "bottombuilding3"
			density = 1
		bentrancebuilding1
			icon = 'turfs.dmi'
			icon_state = "entrancebuilding1"
			density = 1
		bentrancebuilding2
			icon = 'turfs.dmi'
			icon_state = "entrancebuilding2"
			density = 1
		bentrancebuilding3
			icon = 'turfs.dmi'
			icon_state = "entrancebuilding3"
			density = 1
		carpet3
			icon = 'turfs.dmi'
			icon_state ="carpet3"
			density = 0
	jailbars
		icon = 'jailhouse-turfs.dmi'
		icon_state="Jail-Bars"
		density = 0
	MarSat//flag
		icon='satellite.dmi'
		density=0
/*		Enter()
			if(istype(usr,/mob/characters)&&usr.guild=="Night Riderz"||usr.guild=="<b><FONT COLOR=#800000>G</FONT><FONT COLOR=#950000>a</FONT><FONT COLOR=#ab0000>m</FONT><FONT COLOR=#c00000>e</FONT><FONT COLOR=#d50000> </FONT><FONT COLOR=#eb0000>M</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ee0000>d</FONT><FONT COLOR=#db0000>e</FONT><FONT COLOR=#c90000>r</FONT><FONT COLOR=#b70000>a</FONT><FONT COLOR=#a50000>t</FONT><FONT COLOR=#920000>o</FONT><FONT COLOR=#800000>r</FONT></b>")
				usr.overlays-='ccpod.dmi'
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
				usr.podloc=locate(usr.x,usr.y,usr.z)
				usr.loc=locate(173,158,15)
			else
				return 1
*/
	Earth
		icon = 'turfs.dmi'
		icon_state = "earth"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				if(findText("[usr.planetknown]","Earth")==1)
					usr.powerlevel+=0
				else
					usr.planetknown+="Earth "
				usr.overlays-='ccpod.dmi'
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
				usr.podloc=locate(usr.x,usr.y,usr.z)
				if(usr.timeperiod==0)
					usr.loc=locate(131,270,22)
				if(usr.timeperiod==1)
					usr.loc=locate(197,102,13)
				usr.lastplanet="Earth"
			else
				return 1
	Dark
		icon = 'turfs.dmi'
		icon_state = "dark"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				if(findText("[usr.planetknown]","Dark")==1)
					usr.powerlevel+=0
				else
					usr.planetknown+="Dark "
				usr.overlays-='ccpod.dmi'
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
				usr.podloc=locate(usr.x,usr.y,usr.z)
				usr.loc=locate(60,58,19)
				usr.lastplanet="Dark"
			else
				return 1
	Namek
		icon = 'turfs.dmi'
		icon_state = "namek"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				if(findText("[usr.planetknown]","Namek")>=1)
					usr.powerlevel+=0
				else
					usr.planetknown+="Namek "
				usr.overlays-='ccpod.dmi'
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
				usr.podloc=locate(usr.x,usr.y,usr.z)
				usr.loc=locate(76,82,5)
				usr.lastplanet="Namek"
			else
				return 1
	Vegeta
		icon = 'turfs.dmi'
		icon_state = "vegeta"
		density = 1
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
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(48,141,12)
			else
				return 1
	kower4
		icon = 'turfs.dmi'
		icon_state = "ktower4"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(49,141,12)
			else
				return 1
	kower3leave
		icon = 'turfs.dmi'
		icon_state = "ktower3"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(12,6,12)
			else
				return 1
	kower4leave
		icon = 'turfs.dmi'
		icon_state = "ktower4"
		density = 1
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(13,6,12)
			else
				return 1
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
	rosattile_grav
		icon = 'turfs.dmi'
		icon_state = "rosattile"
		density = 0
		Enter(atom/movable/O)
			if(usr.gravitytype==0)
				if(istype(usr,/mob/characters) && usr==O)
					if(usr.grav != 0 && usr.kame==0)
						if(usr.maxpowerlevel<500000000)
							if(usr.grav>usr.maxpowerlevel/1000)
								var/success = rand(1,250)
								if(success == 1 || success == 2)
									usr << "You feel the weight of the room pull down on you, you seem stronger..."
									usr.move=0
									sleep(3)
									usr.move=1
									usr.powerlevel -= usr.grav * (rand(8,70))
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										usr.maxpowerlevel += usr.grav / (rand(10,80))
										usr.maxpowerlevel = round(usr.maxpowerlevel)
										if(usr.grav == 0)
											usr.powerlevel += 0
	blackfloor
		icon = 'turfs.dmi'
		icon_state ="blackfloor"
		density = 0
	carpet
		icon = 'turfs.dmi'
		icon_state ="carpet"
		density = 0
	carpet2
		icon = 'turfs.dmi'
		icon_state ="carpet2"
		density = 0
	carpet3
		icon = 'turfs.dmi'
		icon_state ="carpet3"
		density = 0
	carpet4
		icon = 'turfs.dmi'
		icon_state ="carpet4"
		density = 0
	carpet5
		icon = 'turfs.dmi'
		icon_state ="carpet5"
		density = 0
	awall
		icon = 'arenaturfs.dmi'
		icon_state = "awall"
		density = 1
	awall2
		icon = 'arenaturfs.dmi'
		icon_state = "awall2"
		density = 1
	awall3
		icon = 'arenaturfs.dmi'
		icon_state = "awall3"
		density = 1
	awall4
		icon = 'arenaturfs.dmi'
		icon_state = "awall4"
		density = 1
	awall5
		icon = 'arenaturfs.dmi'
		icon_state = "awall5"
		density = 1
	awall6
		icon = 'arenaturfs.dmi'
		icon_state = "awall6"
		density = 1
	awall7
		icon = 'arenaturfs.dmi'
		icon_state = "awall7"
		density = 1
	awall8
		icon = 'arenaturfs.dmi'
		icon_state = "awall8"
		density = 1
	awall9
		icon = 'arenaturfs.dmi'
		icon_state = "awall9"
		density = 1
	awall10
		icon = 'arenaturfs.dmi'
		icon_state = "awall10"
		density = 1
	awall11
		icon = 'arenaturfs.dmi'
		icon_state = "awall11"
		density = 1
	asign
		icon = 'arenaturfs.dmi'
		icon_state = "sign"
		density = 1
	aground
		icon = 'arenaturfs.dmi'
		icon_state = "ground"
		density = 0
	agrounddiag1
		icon = 'arenaturfs.dmi'
		icon_state = "grounddiag1"
		density = 0
	agrounddiag2
		icon = 'arenaturfs.dmi'
		icon_state = "grounddiag2"
		density = 0
	agrounddiag3
		icon = 'arenaturfs.dmi'
		icon_state = "grounddiag3"
		density = 0
	agrounddiag4
		icon = 'arenaturfs.dmi'
		icon_state = "grounddiag4"
		density = 0
	aground2
		icon = 'arenaturfs.dmi'
		icon_state = "ground2"
		density = 0
	aground3
		icon = 'arenaturfs.dmi'
		icon_state = "ground3"
		density = 0
	aground4
		icon = 'arenaturfs.dmi'
		icon_state = "ground4"
		density = 0
	aground5
		icon = 'arenaturfs.dmi'
		icon_state = "ground5"
		density = 0
	afloor
		icon = 'arenaturfs.dmi'
		icon_state = "floor"
		density = 0
	asteps
		icon = 'arenaturfs.dmi'
		icon_state = "asteps"
		density = 0
	kameenter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(13,3,12)
			else
				return 1
	kameleave
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(43,161,1)
				if(usr.timeperiod==1)
					usr.loc=locate(208,139,13)
			else
				return 1
	Boundaries
		Northboundary
			Enter()
				if(istype(usr,/mob/characters))
					usr.y=1
				else
					return 0
		Southboundary
			Enter()
				if(istype(usr,/mob/characters))
					usr.y=300
				else
					return 0
		Eastboundary
			Enter()
				if(istype(usr,/mob/characters))
					usr.x=1
				else
					return 0
		Westboundary
			Enter()
				if(istype(usr,/mob/characters))
					usr.x=300
				else
					return 0



	Shinobienter
		Enter()
			if(istype(usr,/mob/characters))
				if(guildunlocked==1||usr.guild=="sHiNoBi")
					usr.loc=locate(77,27,15)
				else
					usr<<"You are no Shinobi"
			else
				return 1
	Shinobileave
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(132,263,1)
				if(usr.timeperiod==1)
					usr.loc=locate(198,177,13)
			else
				return 1
	clif
		icon = 'turfs.dmi'
		icon_state = "clif"
		density = 1
	Mountainl
		icon = 'mountain.dmi'
		icon_state = ""
		density = 1
	CellArena
		Arena
			Corner1
			icon = 'zturfs.dmi'
			icon_state = "CellGames"
			density = 0
		Corner1
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,1"
			density = 1
		Corner2
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,2"
			density = 1
		Corner3
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,3"
			density = 1
		Corner4
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,4"
			density = 1
		Corner5
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,5"
			density = 1
		Corner6
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,6"
			density = 1
		Corner7
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner1,7"
			density = 1
		Side
			icon = 'zturfs.dmi'
			icon_state = "CellGamesside2"
			density = 1
		Corner8
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner2.1"
			density = 1
		Corner9
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner2.2"
			density = 1
		Corner10
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner2.3"
			density = 1
		Corner11
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner2.4"
			density = 1
		Pot
			icon = 'zturfs.dmi'
			icon_state = "Pot2"
			density = 1
		Corner12
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner3.1"
			density = 1
		Corner13
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner3.2"
			density = 1
		Corner14
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner3.3"
			density = 1
		Corner15
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner3.4"
			density = 1
		Corner16x
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner3.5"
			density = 1
		Side2
			icon = 'zturfs.dmi'
			icon_state = "CellGamesside3"
			density = 1
		Corner16
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner4,1"
			density = 1
		Corner17
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner4.2"
			density = 1
		Corner18
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner4.3"
			density = 1
		Corner19
			icon = 'zturfs.dmi'
			icon_state = "CellGamescorner4.4"
			density = 1
		bottom
			icon = 'zturfs.dmi'
			icon_state = "CellGamesbottom2"
			density = 1
		top
			icon = 'zturfs.dmi'
			icon_state = "CellGamestop"
			density = 1
		topside
			icon = 'zturfs.dmi'
			icon_state = "CellGamestopside"
			density = 1

	Dirtright
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt right"
		density = 1
	Dirtcliff
		icon = 'dirt.dmi'
		icon_state = "cliff-drop"
		density = 1
	Dirt2
		icon = 'dirt2.dmi'
		icon_state = ""
		density = 0
	Dirtbottom
		icon = 'dirt.dmi'
		icon_state = "cliff-dirt28"
		density = 1
	Dirtup
		icon = 'dirt.dmi'
		icon_state = "dirtup"
		density = 1
	Dirtlefts
		icon = 'mountain.dmi'
		icon_state = "clifflefta"
		density = 1
	Dirtright
		icon = 'dirt.dmi'
		icon_state = "dirtright"
		density = 1

	Dirtleft
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt left"
		density = 1
	mountainDirt
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt1"
		density = 0
	Dirttl
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt tl"
		density = 1
	Dirttr
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt tr"
		density = 1

	Dirtbl
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt bl"
		density = 1
	Dirtbr
		icon = 'mountain.dmi'
		icon_state = "cliff-dirt br"
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
	desert
		icon = 'turfs.dmi'
		icon_state = "desert"
		density = 0
	desertcorner1
		icon = 'turfs.dmi'
		icon_state = "desert-corner1"
		density = 0
	desertcorner2
		icon = 'turfs.dmi'
		icon_state = "desert-corner2"
		density = 0
	desertcorner3
		icon = 'turfs.dmi'
		icon_state = "desert-corner3"
		density = 0
	desertcorner4
		icon = 'turfs.dmi'
		icon_state = "desert-corner4"
		density = 0
	desertside1
		icon = 'turfs.dmi'
		icon_state = "desert-side1"
		density = 0
	desertside2
		icon = 'turfs.dmi'
		icon_state = "desert-side2"
		density = 0
	desertside3
		icon = 'turfs.dmi'
		icon_state = "desert-side3"
		density = 0
	desertside4
		icon = 'turfs.dmi'
		icon_state = "desert-side4"
		density = 0
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
		density = 0
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
	dnamektree1
		icon = 'turfs.dmi'
		icon_state = "dnamektree1"
		density = 1
	dnamektree2
		icon = 'turfs.dmi'
		icon_state = "dnamektree2"
		density = 1
	chair
		icon = 'turfs.dmi'
		icon_state = "chair"
		density = 0
	chair2
		icon = 'turfs.dmi'
		icon_state = "chair2"
		density = 0
	barrel
		icon = 'turfs.dmi'
		icon_state = "barrel"
		density = 1
	namekgrass
		icon = 'turfs.dmi'
		icon_state = "ngrass"
		density = 0
	kamehouse1
		icon = 'turfs.dmi'
		icon_state = "kamehouse1"
		density = 1
	kamehouse2
		icon = 'turfs.dmi'
		icon_state = "kamehouse2"
		density = 0
	kamehouse3
		icon = 'turfs.dmi'
		icon_state = "kamehouse3"
		density = 0
	kamehouse4
		icon = 'turfs.dmi'
		icon_state = "kamehouse4"
		density = 1
	kamehouse5
		icon = 'turfs.dmi'
		icon_state = "kamehouse5"
		density = 1
	kamehouse6
		icon = 'turfs.dmi'
		icon_state = "kamehouse6"
		density = 1
	kamehouse7
		icon = 'turfs.dmi'
		icon_state = "kamehouse7"
		density = 1
	kamehouse8
		icon = 'turfs.dmi'
		icon_state = "kamehouse8"
		density = 1
	kamehouse9
		icon = 'turfs.dmi'
		icon_state = "kamehouse9"
		density = 1
	kamehouse10
		icon = 'turfs.dmi'
		icon_state = "kamehouse10"
		density = 1
	kamehouse11
		icon = 'turfs.dmi'
		icon_state = "kamehouse11"
		density = 1
	kamehouse12
		icon = 'turfs.dmi'
		icon_state = "kamehouse12"
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
	Space
		icon = 'space.dmi'
		density = 0
	brick2
		icon = 'turfs.dmi'
		icon_state = "brick2"
		density = 1
	temple1
		icon = 'turfs.dmi'
		icon_state = "temple1"
		density = 1
	temple2
		icon = 'turfs.dmi'
		icon_state = "temple2"
		density = 1
	temple3
		icon = 'turfs.dmi'
		icon_state = "temple3"
		density = 1
	J1
		icon = 'turfs.dmi'
		icon_state = "J1"
		density = 1
	J2
		icon = 'turfs.dmi'
		icon_state = "J2"
		density = 1
	J3
		icon = 'turfs.dmi'
		icon_state = "J3"
		density = 1
	J4
		icon = 'turfs.dmi'
		icon_state = "J4"
		density = 1
	J5
		icon = 'turfs.dmi'
		icon_state = "J5"
		density = 1
	J6
		icon = 'turfs.dmi'
		icon_state = "J6"
		density = 1
	J7
		icon = 'turfs.dmi'
		icon_state = "J7"
		density = 1
	J8
		icon = 'turfs.dmi'
		icon_state = "J8"
		density = 1
	J9
		icon = 'turfs.dmi'
		icon_state = "J9"
		density = 1
	J10
		icon = 'turfs.dmi'
		icon_state = "J10"
		density = 1
	J11
		icon = 'turfs.dmi'
		icon_state = "J11"
		density = 1
	JW
		icon = 'turfs.dmi'
		icon_state = "JW"
		density = 1
	JW1
		icon = 'turfs.dmi'
		icon_state = "JW1"
		density = 1
	JW2
		icon = 'turfs.dmi'
		icon_state = "JW2"
		density = 1
	JW3
		icon = 'turfs.dmi'
		icon_state = "JW3"
		density = 1
	JW4
		icon = 'turfs.dmi'
		icon_state = "JW4"
		density = 1
	JW5
		icon = 'turfs.dmi'
		icon_state = "JW5"
		density = 0
	J12
		icon = 'turfs.dmi'
		icon_state = "J12"
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
	table4
		icon = 'turfs.dmi'
		icon_state = "table4"
		density = 1
	table5
		icon = 'turfs.dmi'
		icon_state = "table5"
		density = 1
	table6
		icon = 'turfs.dmi'
		icon_state = "table6"
		density = 1
	roof
		icon = 'turfs.dmi'
		icon_state = "roof"
		density = 1
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
	light2
		icon = 'turfs.dmi'
		icon_state = "light2"
		density = 0
	light3
		icon = 'turfs.dmi'
		icon_state = "light3"
		density = 0
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
		density = 1

	cloud3
		icon = 'turfs.dmi'
		icon_state = "newclouds"
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
	buildingsideright
		icon = 'turfs.dmi'
		icon_state = "buildingsideright"
		density = 1
	buildingsideleft
		icon = 'turfs.dmi'
		icon_state = "buildingsideleft"
		density = 1
	buildingsidecenter
		icon = 'turfs.dmi'
		icon_state = "buildingsidecenter"
		density = 1
	entergm
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.gm >= 1)
					usr << "You are a GM!"
					return 1
				else
					usr << "You are not a GM!"
					return 0
			else
				return 1
	blocker
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.gm >= 1)

					return 1
				else

					return 0
			else
				return 1
	newbzoneleave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(86,69,13)
			else
				return 1
	namekgymenter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(98,140,16)
			else
				return 1
	namekgymleave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(63,129,5)
			else
				return 1
	guildleave
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(50,23,1)
				if(usr.timeperiod==1)
					usr.loc=locate(115,94,13)
			else
				return 1
	spawndoor1
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.windowopen==0)
					usr.windowopen=1
					usr.timeperiod=0
					switch(input("Where do you want to spawn?", "Spawn",text) in list ("Meeting Area","Northern Capitol","Western Capitol","Center Capitol","Southern Capitol","Eastern Capitol","Ginger City","Satan City","Nevermind"))
						if("Meeting Area")
							usr.windowopen=0
							usr.loc=locate(204,195,1)
						if("Northern Capitol")
							usr.windowopen=0
							usr.loc=locate(210,227,1)
						if("Western Capitol")
							usr.windowopen=0
							usr.loc=locate(122,188,1)
						if("Center Capitol")
							usr.windowopen=0
							usr.loc=locate(195,170,1)
						if("Southern Capitol")
							usr.windowopen=0
							usr.loc=locate(205,34,1)
						if("Eastern Capitol")
							usr.windowopen=0
							usr.loc=locate(249,166,1)
						if("Ginger City")
							usr.windowopen=0
							usr.loc=locate(132,219,1)
						if("Satan City")
							usr.windowopen=0
							usr.loc=locate(186,117,1)
						if("Nevermind")
							usr.windowopen=0

	Darkness
		dooricon
			icon = 'turfs.dmi'
			icon_state = "door"
			density = 0
/*		door1
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(122,160,19)
				else
					return 1
		door2
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(12,13,19)
				else
					return 1
		door3
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(126,31,19)
				else
					return 1
		door4
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(31,161,19)
				else
					return 1
		door5
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(16,91,19)
				else
					return 1
		revdoor1
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(92,52,20)
				else
					return 1
		revdoor2
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(100,52,20)
				else
					return 1
		revdoor3
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(108,52,20)
				else
					return 1
		revdoor4
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(116,52,20)
				else
					return 1
		revdoor5
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(124,52,20)
				else
					return 1
		fortressdoor
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(108,6,20)
				else
					return 1
		barracksdoor
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(24,2,20)
				else
					return 1
		revfortressdoor
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(83,44,20)
				else
					return 1
		revbarracksdoor
			Enter()
				if(istype(usr,/mob/characters))
					if(usr.guild == "Darkness"||guildunlocked==1||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr.loc=locate(49,44,20)
				else
					return 1
*/


	ddoor16

		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr)
					usr.loc=locate(274,234,16)
				else
					usr << "You are not in this guild"
					return 0
			else
				return 1
	dleave16
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(168,172,1)
			else
				return 1

	guilddoortoRNportal
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				switch(input("Teleport to?", "RN Portal", text) in list ("Budo House","Earth House","East Earth House","Nevermind"))
					if("Budo House")
						usr.loc=locate(18,169,3)
					if("Earth House")
						usr.loc=locate(12,119,20)
					if("East Earth House")
						usr.loc=locate(65,144,16)
			else
				return 1

	guildroomblockpass
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				var/pass = input("Enter a password","Password") as text
				if(usr.dir==NORTH)
					if(pass=="masterdan1337")
						usr.y++
					else
						return 0
				else
					usr.y--

			else
				return 0
	guildroomblockpass2
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				var/pass = input("Enter a password","Password") as text
				if(usr.dir==NORTH)
					if(pass=="smexy")
						usr.y++
					else
						return 0
				else
					usr.y--

			else
				return 0


	gmroomblock
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.gmlevel>1)
					usr<<"Welcome to GM Island, [usr]!"
					return 1
				else
					return 0
					usr<<"Your arent GM, So you cant travel to GM Island!"
			else
				return 1

	guilddoor2secret
		density = 0
		Enter()
			var/adminpass = input(src, "What is the password for the leaderroom?", "Leaderroom Password", null) as text
			if(adminpass=="Night Mother")
				usr.loc=locate(37,247,23)
			else
				usr<<"Access Denied!!"
				return

	guildleave2
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(50,139,1)
				if(usr.timeperiod==1)
					usr.loc=locate(144,94,13)
			else
				return 1
	flowers
		icon = 'turfs.dmi'
		icon_state = "flowers"

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
			if(istype(usr,/mob/characters))
				usr.loc=locate(56,104,3)

				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	togero
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(219,260,1)
				if(usr.timeperiod==1)
					usr.loc=locate(81,205,13)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	wetoon
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(71,71,1)
				usr.density = 1
				usr.flight = 0
				usr.icon_state = ""
				usr.overlays -= /obj/halo
				usr.overlays -= 'halo.dmi'
			else
				return 1
	ccside
		icon = 'turfs.dmi'
		icon_state = "ccside"
		density = 1
	sparleave
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.timeperiod==0)
					usr.loc=locate(85,109,1)
				if(usr.timeperiod==1)
					usr.loc=locate(171,175,13)
				density=1
			else
				return 1

	window
		icon = 'turfs.dmi'
		icon_state = "window"

	ngrass
		icon = 'turfs.dmi'
		icon_state = "ngrass"
	nwater
		icon = 'turfs.dmi'
		icon_state = "nwater"
		density = 1
	stones
		icon = 'turfs.dmi'
		icon_state = "stones"
		density = 0
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
		Enter()
			if(istype(usr,/mob/characters))
				usr.overlays-='halo.dmi'
				usr.dead=0
				usr.loc=locate(74,35,10)
			else
				return 1

	cloudtwo
		icon = 'turfs.dmi'
		icon_state = "cloud2"
		density = 1
	sand
		icon = 'turfs.dmi'
		icon_state = "sand"
		density = 0
	zupdate
		Click()
			usr<<"Updating is important to prevent outdated glitches from being abused. Sorry for the inconvenience"
			usr<<browse("<a href=http://games.byond.com/download/> Byond Windows Download </a>")

	zlogonscreenold
		icon = 'gek1400.png'
	zlogonscreen
		icon = 'gek1401.png'
	zlogonscreen2
		icon = 'geki1402.png'
	zlogonscreenold2
		icon = 'ErrorBuu.png'
	zlogonscreen3
		icon = 'Enter21.png'
		Click()
			var/newmob=new/mob/choosingcharacter(locate(usr.x,usr.y,usr.z))
			usr.client.mob=newmob
			del(usr)
/*	zloginscreen56
		icon = 'enter21.dmi'
		icon_state = 'main'
		density = 1
*/
	zlogonscreen4
		icon = 'Enter21.dmi'
		Click()
			if(usr.creating==0)
				usr.creating=1
				var/newmob=new/mob/choosingcharacter(locate(usr.x,usr.y,usr.z))
				usr.client.mob=newmob
				alert(usr,"1. When making a new <B>Character </b> the Characer creation screen will pop up twice disregard the first one by scrolling down and pressing submit!!{When Making a  new Character}")
				del(usr)

			else
				..()
	znext
		Click()
			usr<<"<center><b><font face=tahoma><font color = yellow>Welcome to Dragonball Gekisen<br><font size=1>Check our Website, Forums and Rules, Check the Byond browser for details!<br><br>"
			usr.loc=locate(166,41,10)
	zback
		Click()
			usr.loc=locate(115,38,10)
	zquit
	//	icon ='quit.dmi'
		Click()
			usr<<"Sorry to see you go :)"
			sleep(50)
			usr.Logout()
	zrules
		//icon ='rules.dmi'
		Click()
			alert(usr,"1. KEEP RESPECT! Respect All of the Dragonball Gekisen, and the Players. Anything any of the GMs say is FINAL. If you disagree with a descision, report to another GM in a calm manor, and it will be sorted out.Problems with Players will also be sorted out fairly. Further more, Dont get GMs angry -.-!")
			alert(usr,"2. NO CUSSING! I'm sure most people swear all the time, but for the sake of other players, refrain from doing so. A slip up here and there will be tolerated for the most part, and try your hardest to keep the swears away from OOC. If you absolutley HAVE to swear, use the SAY verb.")
			alert(usr,"3. NO SEXUAL CONTENT! Anything pertaining to direct sexual content will not be tolerated. This is for the curtiosy of other players. On this note - Sexual Content is that which contains very graphical explanations and such. Mild examples of this will be tolerated, but again, try to keep it out of OOC talk.")

			alert(usr,"4. DO NOT REQUEST GM STATUS. This Angers most of the GM's, as it is commonly asked. Try to remember, the answer will always be No. We are not giving out anything to players or this sort, so dont bother.")

			alert(usr,"5. DO NOT SPAMM! Do not contiuously say the same thing over and over, or bash the server. This will not be tolerated, and punishment will be given out accordingly. Even if you think the server is horribly bad, just leave. Dont bother the people actually playing.")

			alert(usr,"6. DO NOT ASK FOR POWER BOOSTS! Boosts to any stat will not be given out by any GM's, so do not bother to ask. This will result in a mute and can lead to a temp ban if you bother the gm to much.")

			alert(usr,"7. DO NOT FLAME OR CUSS PLAYERS WHILE ON GAME SERVER! If you have a problem with another player, please take it elsewhere. We have no time to deal with petty differences between players, and will not tolerate two people fighting over our game bothering other players. ")
	jailenter
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(175,138,22)
	jailleave
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(207,140,1)

	znew
		icon ='new.dmi'
		Click()
			var/newmob=new/mob/creatingcharacter(locate(usr.x,usr.y,usr.z))
			usr.client.mob=newmob
			del(usr)

	zdelete
	//	icon = 'delete.dmi'
		Click()
			var/newmob=new/mob/deletingcharacter(locate(usr.x,usr.y,usr.z))
			usr.client.mob=newmob
			del(usr)
	zjoin
	//	icon ='join.dmi'
		Click()
			var/newmob=new/mob/choosingcharacter(locate(usr.x,usr.y,usr.z))
			usr.client.mob=newmob
			del(usr)




	kai1
		icon='0Turfs.dmi'
		icon_state="1,2"
		density=1
	kai2
		icon='0Turfs.dmi'
		icon_state="1,3"
		density=1
	kai3
		icon='0Turfs.dmi'
		icon_state="1,4"
		density=1
	kai4
		icon='0Turfs.dmi'
		icon_state="2,1"
		density=1
	kai5
		icon='0Turfs.dmi'
		icon_state="2,2"
		density=1
	kai6
		icon='0Turfs.dmi'
		icon_state="2,3"
		density=1
	kai7
		icon='0Turfs.dmi'
		icon_state="2,4"
		density=1
	kai8
		icon='0Turfs.dmi'
		icon_state="2,5"
		density=1
	kai9
		icon='0Turfs.dmi'
		icon_state="3,1"
		density=1
	kai10
		icon='0Turfs.dmi'
		icon_state="3,2"
		density=1
	kai11
		icon='0Turfs.dmi'
		icon_state="3,3"
		density=1
	kai12
		icon='0Turfs.dmi'
		icon_state="3,4"
		density=1
	kai13
		icon='0Turfs.dmi'
		icon_state="3,5"
		density=1
	kai14
		icon='0Turfs.dmi'
		icon_state="4,1"
		density=1
	kai15
		icon='0Turfs.dmi'
		icon_state="4,2"
		density=1
	kai16
		icon='0Turfs.dmi'
		icon_state="4,3"
		density=1
	kai17
		icon='0Turfs.dmi'
		icon_state="4,4"
		density=1
	kai18
		icon='0Turfs.dmi'
		icon_state="4,5"
		density=1
	kai19
		icon='0Turfs.dmi'
		icon_state="5,1"
		density=1
	kai20
		icon='0Turfs.dmi'
		icon_state="5,2"
		density=1
	kai21
		icon='0Turfs.dmi'
		icon_state="5,3"
		density=1
	kai22
		icon='0Turfs.dmi'
		icon_state="5,4"
		density=1
	turtle
		icon='0Turfs.dmi'
		icon_state="turtle"
		density=1
	kame1
		icon='0Turfs.dmi'
		icon_state="K1"
		density=1
	kame2
		icon='0Turfs.dmi'
		icon_state="K2"
		density=1
	kame3
		icon='0Turfs.dmi'
		icon_state="K3"
		density=1
	kame4
		icon='0Turfs.dmi'
		icon_state="K4"
		density=1
	kame5
		icon='0Turfs.dmi'
		icon_state="K5"
		density=1
	kame6
		icon='0Turfs.dmi'
		icon_state="K6"
		density=1
	kame7
		icon='0Turfs.dmi'
		icon_state="K7"
		density=1
	kame8
		icon='0Turfs.dmi'
		icon_state="K8"
		density=1
	kame9
		icon='0Turfs.dmi'
		icon_state="K9"
		density=1
	kame10
		icon='0Turfs.dmi'
		icon_state="K10"
		density=1
	kame11
		icon='0Turfs.dmi'
		icon_state="K11"
		density=1
	kame12
		icon='0Turfs.dmi'
		icon_state="K12"
		density=1

	maniacktreetop
		icon = 'turfs.dmi'
		icon_state = "maniacktree"
		layer = MOB_LAYER + 1
		density = 0
	maniacktreetrunktop
		icon = 'turfs.dmi'
		icon_state = "maniacktree3"
		layer = MOB_LAYER + 1
		density = 0
	maniacktreetrunk
		icon = 'turfs.dmi'
		icon_state = "maniacktree2"
		layer = MOB_LAYER + 1
		density = 1
	maniacktreebotom
		icon = 'turfs.dmi'
		icon_state = "maniacktree4"
		layer = MOB_LAYER + 1
		density = 1
	maniackgrass
		icon = 'turfs.dmi'
		icon_state = "maniackgrass"
		density = 0
	maniacksign
		icon = 'turfs.dmi'
		icon_state = "maniacksign"
		density = 1
	stairs
		icon = 'turfs.dmi'
		icon_state = "stairs"
	stairs2
		icon = 'turfs.dmi'
		icon_state = "stairs2"
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
	snakelow
		icon = 'turfs.dmi'
		icon_state = "snakelow"
		density = 1
	snakehigh
		icon = 'turfs.dmi'
		icon_state = "snakehigh"
		density = 1
	snakeright
		icon = 'turfs.dmi'
		icon_state = "snakeright"
		density = 1
	snakeleft
		icon = 'turfs.dmi'
		icon_state = "snakeleft"
		density = 1
	snaketurn1
		icon = 'turfs.dmi'
		icon_state = "snaketurn1"
		density = 1
	snaketurn2
		icon = 'turfs.dmi'
		icon_state = "snaketurn2"
		density = 1
	snaketurn3
		icon = 'turfs.dmi'
		icon_state = "snaketurn3"
		density = 1
	snaketurn4
		icon = 'turfs.dmi'
		icon_state = "snaketurn4"
		density = 1
	snaketurn5
		icon = 'turfs.dmi'
		icon_state = "snaketurn5"
		density = 1
	snaketurn6
		icon = 'turfs.dmi'
		icon_state = "snaketurn6"
		density = 1
	snaketurn7
		icon = 'turfs.dmi'
		icon_state = "snaketurn7"
		density = 1
	snaketurn8
		icon = 'turfs.dmi'
		icon_state = "snaketurn8"
		density = 1
	snakefloor
		icon = 'turfs.dmi'
		icon_state = "snakefloor"
		density = 0
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
	Building
	ASamuraiset
		icon = 'samuraobj.dmi'
		temple
			temple1
				icon = 'turfs.dmi'
				icon_state = "temple1"
				density=1
			temple2
				icon = 'turfs.dmi'
				icon_state = "temple2"
				density=1
			temple3
				icon = 'turfs.dmi'
				icon_state = "temple3"
				density=1
			temple4
				icon = 'turfs.dmi'
				icon_state = "temple4"
				density=1
			temple5
				icon = 'turfs.dmi'
				icon_state = "temple5"
				density=1
			temple6
				icon = 'turfs.dmi'
				icon_state = "temple6"
				density=1
			temple7
				icon = 'turfs.dmi'
				icon_state = "temple7"
				density=1
			temple8
				icon = 'turfs.dmi'
				icon_state = "temple8"
				density=1
			temple9
				icon = 'turfs.dmi'
				icon_state = "temple9"
				density=1
			temple10
				icon = 'turfs.dmi'
				icon_state = "temple10"
				density=1
		Buddha
			icon_state="Buddha Statue"
			density=1
		lightning
			icon='lightning2.dmi'
			density=0
		floor
			icon_state="floor"
			density=0
		wall2
			icon_state="wall2"
			density=1
		wall
			icon_state= "wall"
			density=1
		wall3
			icon_state="wall3"
			density=1
		wall4
			icon_state= "wall4"
			density=1
		wall5
			icon_state= "wall5"
			density=1
		wall6
			icon_state= "wall6"
			density=1
		wall7
			icon_state="wall7"
			density=1
		wall8
			icon_state= "wall8"
			density=1
		wall9
			icon_state= "wall9"
			density=1
		wall10
			icon_state= "wall10"
			density=1
		darkness
			icon='turfs.dmi'
			icon_state="darkness"
			density=0
			layer=MOB_LAYER+3
		darkness2
			icon='turfs.dmi'
			icon_state="darkness2"
			density=0
			layer=MOB_LAYER+3
		Padbot
			icon_state="Padbot"
			density=0
		Pad
			icon_state="Pad"
			density=0
		Samurai
			icon_state="Samurai"
			density=1
		Samurai2
			icon_state="Samurai2"
			density=1
		Sign
			icon_state="Sign"
			density=1
		sf
			icon_state="sf"
			density=1
		sw
			icon_state="sw"
			density=1
		se
			icon_state="se"
			density=1
		si
			icon_state="si"
			density=1
		st
			icon_state="st"
			density=1
		sd
			icon_state="sd"
			density=1
		sg
			icon_state="sg"
			density=1
		doors
			enterdoor
				icon_state = "Door"
				density = 1
				locked=1
				opacity=1

	Barbersign
		icon='Barber.dmi'
		density=1

	B1
		icon = 'turfs.dmi'
		icon_state = "B1"
		density = 1
	B2
		icon = 'turfs.dmi'
		icon_state = "B2"
		density = 1
	B3
		icon = 'turfs.dmi'
		icon_state = "B3"
		density = 1
	B4
		icon = 'turfs.dmi'
		icon_state = "B4"
		density = 1
	B5
		icon = 'turfs.dmi'
		icon_state = "B5"
		density = 1
	B7
		icon = 'turfs.dmi'
		icon_state = "B7"
		density = 1
	B7
		icon = 'turfs.dmi'
		icon_state = "B7"
		density = 1
	B8
		icon = 'turfs.dmi'
		icon_state = "B8"
		density = 1
	B9
		icon = 'turfs.dmi'
		icon_state = "B9"
		density = 1
	B10
		icon = 'turfs.dmi'
		icon_state = "B10"
		density = 1
	B11
		icon = 'turfs.dmi'
		icon_state = "B11"
		density = 1
	B12
		icon = 'turfs.dmi'
		icon_state = "B12"
		density = 1
	B13
		icon = 'turfs.dmi'
		icon_state = "B13"
		density = 1
	B14
		icon = 'turfs.dmi'
		icon_state = "B14"
		density = 1
	B15
		icon = 'turfs.dmi'
		icon_state = "B15"
		density = 1
	B16
		icon = 'turfs.dmi'
		icon_state = "B16"
		density = 1
	B17
		icon = 'turfs.dmi'
		icon_state = "B17"
		density = 1
	B18
		icon = 'turfs.dmi'
		icon_state = "B18"
		density = 1
	B19
		icon = 'turfs.dmi'
		icon_state = "B19"
		density = 1
	B19
		icon = 'turfs.dmi'
		icon_state = "B19"
		density = 1
	B20
		icon = 'turfs.dmi'
		icon_state = "B20"
		density = 1
	B21
		icon = 'turfs.dmi'
		icon_state = "B21"
		density = 1
	B22
		icon = 'turfs.dmi'
		icon_state = "B22"
		density = 1
	B23
		icon = 'turfs.dmi'
		icon_state = "B23"
		density = 1
	B24
		icon = 'turfs.dmi'
		icon_state = "B24"
		density = 1
	B25
		icon = 'turfs.dmi'
		icon_state = "B25"
		density = 1
	Head1
		icon = 'turfs.dmi'
		icon_state = "Head1"
	Head2
		icon = 'turfs.dmi'
		icon_state = "Head2"
	Head3
		icon = 'turfs.dmi'
		icon_state = "Head3"
	Head4
		icon = 'turfs.dmi'
		icon_state = "Head4"
	Head5
		icon = 'turfs.dmi'
		icon_state = "Head5"
	Head6
		icon = 'turfs.dmi'
		icon_state = "Head6"
	Head7
		icon = 'turfs.dmi'
		icon_state = "Head7"
	Head8
		icon = 'turfs.dmi'
		icon_state = "Head8"
	Head9
		icon = 'turfs.dmi'
		icon_state = "Head9"
	Head10
		icon = 'turfs.dmi'
		icon_state = "Head10"
	Head11
		icon = 'turfs.dmi'
		icon_state = "Head11"
	Head12
		icon = 'turfs.dmi'
		icon_state = "Head12"
	Head13
		icon = 'turfs.dmi'
		icon_state = "Head13"
	Head14
		icon = 'turfs.dmi'
		icon_state = "Head14"
	Head15
		icon = 'turfs.dmi'
		icon_state = "Head15"
	Head16
		icon = 'turfs.dmi'
		icon_state = "Head16"
	Head17
		icon = 'turfs.dmi'
		icon_state = "Head17"
	Head18
		icon = 'turfs.dmi'
		icon_state = "Head18"
	Head19
		icon = 'turfs.dmi'
		icon_state = "Head19"
	Head20
		icon = 'turfs.dmi'
		icon_state = "Head20"
	Head21
		icon = 'turfs.dmi'
		icon_state = "Head21"
	Head22
		icon = 'turfs.dmi'
		icon_state = "Head22"
	Head23
		icon = 'turfs.dmi'
		icon_state = "Head23"
	Head24
		icon = 'turfs.dmi'
		icon_state = "Head24"
	Head25
		icon = 'turfs.dmi'
		icon_state = "Head25"
	Head26
		icon = 'turfs.dmi'
		icon_state = "Head26"
	Head27
		icon = 'turfs.dmi'
		icon_state = "Head27"
	Head28
		icon = 'turfs.dmi'
		icon_state = "Head28"
	Head29
		icon = 'turfs.dmi'
		icon_state = "Head29"
	Head30
		icon = 'turfs.dmi'
		icon_state = "Head30"
	Head31
		icon = 'turfs.dmi'
		icon_state = "Head31"
	Head32
		icon = 'turfs.dmi'
		icon_state = "Head32"
	Head33
		icon = 'turfs.dmi'
		icon_state = "Head33"
	Head34
		icon = 'turfs.dmi'
		icon_state = "Head34"
	Head35
		icon = 'turfs.dmi'
		icon_state = "Head35"
	Head36
		icon = 'turfs.dmi'
		icon_state = "Head36"
	Head37
		icon = 'turfs.dmi'
		icon_state = "Head37"
	Head38
		icon = 'turfs.dmi'
		icon_state = "Head38"
	Head39
		icon = 'turfs.dmi'
		icon_state = "Head39"
	Head40
		icon = 'turfs.dmi'
		icon_state = "Head40"
	Head41
		icon = 'turfs.dmi'
		icon_state = "Head41"
	Head42
		icon = 'turfs.dmi'
		icon_state = "Head42"
	Head43
		icon = 'turfs.dmi'
		icon_state = "Head43"
	Head44
		icon = 'turfs.dmi'
		icon_state = "Head44"
	Head45
		icon = 'turfs.dmi'
		icon_state = "Head45"
	Head46
		icon = 'turfs.dmi'
		icon_state = "Head46"
	Head47
		icon = 'turfs.dmi'
		icon_state = "Head47"
	Head48
		icon = 'turfs.dmi'
		icon_state = "Head48"
	Head49
		icon = 'turfs.dmi'
		icon_state = "Head49"
	Head50
		icon = 'turfs.dmi'
		icon_state = "Head50"
	Head51
		icon = 'turfs.dmi'
		icon_state = "Head51"
	Head52
		icon = 'turfs.dmi'
		icon_state = "Head52"
	Head53
		icon = 'turfs.dmi'
		icon_state = "Head53"
	Tail1
		icon = 'turfs.dmi'
		icon_state = "Tail1"
	Tail2
		icon = 'turfs.dmi'
		icon_state = "Tail2"
	Tail3
		icon = 'turfs.dmi'
		icon_state = "Tail3"
	Tail4
		icon = 'turfs.dmi'
		icon_state = "Tail4"
	Tail5
		icon = 'turfs.dmi'
		icon_state = "Tail5"
	Tail6
		icon = 'turfs.dmi'
		icon_state = "Tail6"
	Tail7
		icon = 'turfs.dmi'
		icon_state = "Tail7"
	Tail8
		icon = 'turfs.dmi'
		icon_state = "Tail8"
	Tail9
		icon = 'turfs.dmi'
		icon_state = "Tail9"
	Tail10
		icon = 'turfs.dmi'
		icon_state = "Tail10"
	Tail11
		icon = 'turfs.dmi'
		icon_state = "Tail11"
	Tail12
		icon = 'turfs.dmi'
		icon_state = "Tail12"
	Tail13
		icon = 'turfs.dmi'
		icon_state = "Tail13"
	Tail14
		icon = 'turfs.dmi'
		icon_state = "Tail14"
	Tail15
		icon = 'turfs.dmi'
		icon_state = "Tail15"
	Tail16
		icon = 'turfs.dmi'
		icon_state = "Tail16"
	Tail17
		icon = 'turfs.dmi'
		icon_state = "Tail17"
	Tail18
		icon = 'turfs.dmi'
		icon_state = "Tail18"
	Tail19
		icon = 'turfs.dmi'
		icon_state = "Tail19"
	Tail20
		icon = 'turfs.dmi'
		icon_state = "Tail20"
	Tail21
		icon = 'turfs.dmi'
		icon_state = "Tail21"
	Tail22
		icon = 'turfs.dmi'
		icon_state = "Tail22"
	Tail23
		icon = 'turfs.dmi'
		icon_state = "Tail23"
	Tail24
		icon = 'turfs.dmi'
		icon_state = "Tail24"
	Tail25
		icon = 'turfs.dmi'
		icon_state = "Tail25"
	Tail26
		icon = 'turfs.dmi'
		icon_state = "Tail26"
	Tail27
		icon = 'turfs.dmi'
		icon_state = "Tail27"
	Tail28
		icon = 'turfs.dmi'
		icon_state = "Tail28"
	Tail29
		icon = 'turfs.dmi'
		icon_state = "Tail29"
	Tail30
		icon = 'turfs.dmi'
		icon_state = "Tail30"
	Tail31
		icon = 'turfs.dmi'
		icon_state = "Tail31"
	Tail32
		icon = 'turfs.dmi'
		icon_state = "Tail32"
	Tail33
		icon = 'turfs.dmi'
		icon_state = "Tail33"
	Tail34
		icon = 'turfs.dmi'
		icon_state = "Tail34"
	cloud
		icon = 'turfs.dmi'
		icon_state = "cloud"
		density = 1
	gravleave
		Exit()
			if(istype(usr,/mob/characters))
				usr.grav = 0
				return 1
			else
				return 1
	loco
		Enter()
			if(istype(usr,/mob/characters))
				usr.x = 85
			else
				return 1
	loco2
		Enter()
			if(istype(usr,/mob/characters))
				usr.x = 106
			else
				return 1
	loct
		Enter()
			if(istype(usr,/mob/characters))
				usr.y = 116
			else
				return 1
	loct2
		Enter()
			if(istype(usr,/mob/characters))
				usr.y = 137
			else
				return 1

	locenter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x+2,usr.y+2, usr.z)
			else
				return 1

	locenter2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x-2,usr.y-2, usr.z)
			else
				return 1

	locenter3
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x-2,usr.y+2, usr.z)
			else
				return 1

	locenter4
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x+2,usr.y-2, usr.z)
			else
				return 1

	got
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(95,118,2)
			else
				return 1

	enta
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(9,66,3)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	enta2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(10,66,3)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1

	ente
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(68,1,4)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1


	ente2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(69,1,4)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	ceev
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(125,140,1)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	ceev2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(3,1,3)
				usr.density = 1
				usr.icon_state = ""
			else
				return 1
	healexit
		Enter()
			if(istype(usr,/mob/characters))
				usr.heal = 0
				return 1
			else
				return 1
	snow
		icon = 'turfs.dmi'
		icon_state = "snow"
	gonorth
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x,1,6)
			else
				return 1
	gonorth2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x,150,1)
			else
				return 1

	goeast
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(1,usr.y,7)
			else
				return 1

	goeast2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(150,usr.y,1)
			else
				return 1
	podnext
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(125,18,3)
			else
				return 1

	podprevious
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(105,22,3)
			else
				return 1
	podnext2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(143,17,3)
			else
				return 1
	podprevious2
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(125,23,3)
			else
				return 1
	tapiontune
		Enter()
			usr << 'tapion.mid'
			return 1
	Window
		icon = 'Window.dmi'
		density = 1
obj
	Quest1Enter
		density=1
		var
			covericon='0enemyzoomedout.dmi'
			covericon_state = "raditz"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Would you like to enter?", "Raditz", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==0)
								usr.loc=locate(8,164,18)
								var/raditzcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Raditz")
										if(M.z==18)
											raditzcount+=1
								if(raditzcount==0)
									new /mob/monsters/Raditz(locate(8,173,18))

							else
								usr<<"You have already defeated Raditz"
				else
					return 1
	Quest2Enter
		density=1
		var
			covericon = 'vegetaicon.dmi'
			covericon_state = ""
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Vegeta and Nappa?", "Vegeta/Nappa", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==1)
								usr.loc=locate(27,155,18)
								var/saibamencount=0
								for(var/mob/monsters/M in world)
									if(M.name=="saibaman")
										if(M.z==18)
											saibamencount+=1
								if(saibamencount==0)
									new /mob/monsters/saibaman(locate(27,170,18))
									new /mob/monsters/saibaman(locate(27,170,18))
									new /mob/monsters/saibaman(locate(27,170,18))

							else
								if(usr.questsdone<1)
									usr<<"It isnt time to fight Vegeta and Nappa"
								if(usr.questsdone>=2)
									usr<<"You have already defeated Vegeta and Nappa"
				else
					return 1
	Quest3Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "kui"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Kiwi?", "Kiwi", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==2)
								usr.loc=locate(79,166,18)
								var/kiwicount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Kiwi")
										if(M.z==18)
											kiwicount+=1
								if(kiwicount==0)
									new /mob/monsters/Kiwi(locate(88,166,18))

							else
								if(usr.questsdone<2)
									usr<<"It isnt time to fight Kiwi"
								if(usr.questsdone>=3)
									usr<<"You have already defeated Kiwi"
				else
					return 1
	Quest4Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "dodoria"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Dodoria?", "Dodoria", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==3)
								usr.loc=locate(99,160,18)
								var/Dodoriacount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Dodoria")
										if(M.z==18)
											Dodoriacount+=1
								if(Dodoriacount==0)
									new /mob/monsters/Dodoria(locate(99,170,18))

							else
								if(usr.questsdone<3)
									usr<<"It isnt time to fight Dodoria"
								if(usr.questsdone>=4)
									usr<<"You have already defeated Dodoria"
				else
					return 1
	Quest5Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "zarbon"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Zarbon?", "Zarbon", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==4)
								usr.loc=locate(118,164,18)
								var/Zarboncount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Zarbon")
										if(M.z==18)
											Zarboncount+=1
								if(Zarboncount==0)
									new /mob/monsters/Zarbon(locate(118,171,18))

							else
								if(usr.questsdone<4)
									usr<<"It isnt time to fight Zarbon"
								if(usr.questsdone>=5)
									usr<<"You have already defeated Zarbon"
				else
					return 1
	//real quest 6 is dragonball collection
	Quest7Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "ginyuforce1"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront the Ginyu force?", "Ginyu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==6)
								usr.loc=locate(142,155,18)
								var/Guldocount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Guldo")
										if(M.z==18)
											Guldocount+=1
								if(Guldocount==0)
									new /mob/monsters/Guldo(locate(142,170,18))

							else
								if(usr.questsdone<6)
									usr<<"It isnt time to fight the Ginyu Force"
								if(usr.questsdone>=7)
									usr<<"You have already defeated the Ginyu Force"
				else
					return 1

	Quest7Enter2
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "ginyuforce2"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront the Ginyu force?", "Ginyu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==6)
								usr.loc=locate(142,155,18)
								var/Guldocount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Guldo")
										if(M.z==18)
											Guldocount+=1
								if(Guldocount==0)
									new /mob/monsters/Guldo(locate(142,170,18))

							else
								if(usr.questsdone<6)
									usr<<"It isnt time to fight the Ginyu Force"
								if(usr.questsdone>=7)
									usr<<"You have already defeated the Ginyu Force"
				else
					return 1
	Quest8Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "frieza1"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Frieza?", "Frieza", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==7)
								usr.loc=locate(162,165,18)
								var/Friezacount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Frieza1")
										if(M.z==18)
											Friezacount+=1
								if(Friezacount==0)
									new /mob/monsters/Frieza1(locate(170,165,18))

							else
								if(usr.questsdone<7)
									usr<<"It isnt time to fight Frieza"
								if(usr.questsdone>=8)
									usr<<"You have already defeated Frieza"
				else
					return 1
	Quest9Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "kingcold"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Frieza/King Cold?", "Frieza/King Cold", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==8)
								usr.loc=locate(7,132,18)
								var/Friezacount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Friezabot")
										if(M.z==18)
											Friezacount+=1
								if(Friezacount==0)
									new /mob/monsters/Friezabot(locate(24,135,18))

							else
								if(usr.questsdone<8)
									usr<<"It isnt time to fight Frieza/King Cold"
								if(usr.questsdone>=9)
									usr<<"You have already defeated Friezabot/King Cold"
				else
					return 1
	Quest10Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "2019"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Gero/Android 19?", "Gero/Android 19", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==9)
								usr.loc=locate(72,134,18)
								var/Androidcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="A19")
										if(M.z==18)
											Androidcount+=1
								if(Androidcount==0)
									new /mob/monsters/A19(locate(80,134,18))

							else
								if(usr.questsdone<9)
									usr<<"It isnt time to fight Gero/Android 19"
								if(usr.questsdone>=10)
									usr<<"You have already defeated Gero/Android 19"
				else
					return 1
	Quest11Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "181716"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Androids??", "Androids", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==10)
								usr.loc=locate(93,135,18)
								var/Androidcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="A18")
										if(M.z==18)
											Androidcount+=1
								if(Androidcount==0)
									new /mob/monsters/A18(locate(106,135,18))

							else
								if(usr.questsdone<10)
									usr<<"It isnt time to fight the Androids"
								if(usr.questsdone>=11)
									usr<<"You have already defeated the Androids"
				else
					return 1
	Quest12Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "Cell1"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Cell??", "Cell", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==11)
								usr.loc=locate(37,97,18)
								var/Androidcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Cell")
										if(M.z==18)
											Androidcount+=1
								if(Androidcount==0)
									new /mob/monsters/Cell(locate(65,103,18))

							else
								if(usr.questsdone<11)
									usr<<"It isnt time to fight Cell"
								if(usr.questsdone>=12)
									usr<<"You have already defeated Cell"
				else
					return 1
	Quest13Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "Cell2"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront ImperfectCell??", "ImperfectCell", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==12)
								usr.loc=locate(43,72,18)
								var/Androidcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="imperfectCell")
										if(M.z==18)
											Androidcount+=1
								if(Androidcount==0)
									new /mob/monsters/imperfectCell(locate(56,72,18))

							else
								if(usr.questsdone<12)
									usr<<"It isnt time to fight Cell"
								if(usr.questsdone>=13)
									usr<<"You have already defeated Cell"
				else
					return 1
	Quest14Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "Cell3"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront PerfectCell??", "PerfectCell", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==13)
								usr.loc=locate(16,95,18)
								var/Androidcount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Celljr")
										if(M.z==18)
											Androidcount+=1
								if(Androidcount==0)
									new /mob/monsters/Celljr(locate(16,107,18))
									new /mob/monsters/Celljr(locate(16,107,18))
									new /mob/monsters/Celljr(locate(16,107,18))
									new /mob/monsters/Celljr(locate(16,107,18))
									new /mob/monsters/Celljr(locate(16,107,18))


							else
								if(usr.questsdone<13)
									usr<<"It isnt time to fight Cell"
								if(usr.questsdone>=14)
									usr<<"You have already defeated Cell"
				else
					return 1
	Quest15Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "yamu"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Yamu and Spopovich??", "Majin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==14)
								usr.loc=locate(97,63,18)
								var/Enemycount=0
								var/Enemycount2=0
								for(var/mob/monsters/M in world)
									if(M.name=="Yamu")
										if(M.z==18)
											Enemycount+=1
								for(var/mob/monsters/M in world)
									if(M.name=="Spopovich")
										if(M.z==18)
											Enemycount2+=1
								if(Enemycount==0)
									new /mob/monsters/Yamu(locate(96,68,18))
								if(Enemycount2==0)
									new /mob/monsters/Spopovich(locate(98,68,18))

							else
								if(usr.questsdone<14)
									usr<<"It isnt time to fight Yamu/Spopovich"
								if(usr.questsdone>=15)
									usr<<"You have already defeated Yamu/Spopovich"
				else
					return 1
	Quest16Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "puipui"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront PuiPui??", "Majin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==15)
								usr.loc=locate(74,72,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="PuiPui")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/PuiPui(locate(74,77,18))
							else
								if(usr.questsdone<15)
									usr<<"It isnt time to fight PuiPui"
								if(usr.questsdone>=16)
									usr<<"You have already defeated PuiPui"
				else
					return 1
	Quest17Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "yakon"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Yakon??", "Majin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==16)
								usr.loc=locate(14,34,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Yakon")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Yakon(locate(14,59,18))
							else
								if(usr.questsdone<16)
									usr<<"It isnt time to fight Yakon"
								if(usr.questsdone>=17)
									usr<<"You have already defeated Yakon"
				else
					return 1
	Quest19Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "majinvegeta"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Majin Vegeta??", "Majin Vegeta", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==18)
								usr.loc=locate(15,12,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="MajinVegeta")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/MajinVegeta(locate(15,27,18))
							else
								if(usr.questsdone<18)
									usr<<"It isnt time to fight Majin Vegeta"
								if(usr.questsdone>=19)
									usr<<"You have already defeated Majin Vegeta"
				else
					return 1
	Quest18Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "dabura"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Dabura??", "Majin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==17)
								usr.loc=locate(40,43,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Dabura")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Dabura(locate(40,50,18))
							else
								if(usr.questsdone<17)
									usr<<"It isnt time to fight Dabura"
								if(usr.questsdone>=18)
									usr<<"You have already defeated Dabura"
				else
					return 1
turf
	BuuEgg
		icon= 'egg.dmi'
		density=1
obj
	Quest20Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "babidi"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront Babidi??", "Majin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==19)
								usr.loc=locate(40,20,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Babidi")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Babidi(locate(40,26,18))
							else
								if(usr.questsdone<19)
									usr<<"It isnt time to fight Babidi"
								if(usr.questsdone>=20)
									usr<<"You have already defeated Babidi"
				else
					return 1
	Quest21Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "fatbuu"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront FatBuu??", "Buu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==20)
								usr.loc=locate(61,44,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Fatbuu")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Fatbuu(locate(61,55,18))
							else
								if(usr.questsdone<20)
									usr<<"It isnt time to fight FatBuu"
								if(usr.questsdone>=21)
									usr<<"You have already defeated FatBuu"
				else
					return 1
	Quest22Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "skinnybuu"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront SkinnyBuu??", "Buu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==21)
								usr.loc=locate(62,16,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Skinnybuu")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Skinnybuu(locate(62,34,18))
							else
								if(usr.questsdone<21)
									usr<<"It isnt time to fight SkinnyBuu"
								if(usr.questsdone>=22)
									usr<<"You have already defeated SkinnyBuu"
				else
					return 1
	Quest23Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "superbuu"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront SuperBuu??", "Buu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==22)
								usr.loc=locate(79,51,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Superbuu")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Superbuu(locate(90,51,18))
							else
								if(usr.questsdone<22)
									usr<<"It isnt time to fight SuperBuu"
								if(usr.questsdone>=23)
									usr<<"You have already defeated SuperBuu"
				else
					return 1
	Quest24Enter
		density=1
		var
			covericon = '0enemyzoomedout.dmi'
			covericon_state = "kidbuu"
			image/coverimage
		New()
			..()
			if(covericon)	// if this area has a covericon
				coverimage = image(covericon,src,covericon_state,5)
		verb
			Fight()
				set src in oview(1)
				set category = "Encounter"
				if(istype(usr,/mob/characters))
					switch(input("Confront KidBuu??", "Buu", text) in list ("Yes","No"))
						if("Yes")
							if(usr.questsdone==23)
								usr.loc=locate(86,21,18)
								var/Enemycount=0
								for(var/mob/monsters/M in world)
									if(M.name=="Kidbuu")
										if(M.z==18)
											Enemycount+=1

								if(Enemycount==0)
									new /mob/monsters/Kidbuu(locate(85,34,18))
							else
								if(usr.questsdone<23)
									usr<<"It isnt time to fight KidBuu"
								if(usr.questsdone>=24)
									usr<<"You have already defeated KidBuu"
				else
					return 1
mob/proc/questrefresh()
	if(src.z!=21)
		sleep(2)
		if(src.questsdone==0)
			for(var/obj/Quest1Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==1)
			for(var/obj/Quest2Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==2)
			for(var/obj/Quest3Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==3)
			for(var/obj/Quest4Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==4)
			for(var/obj/Quest5Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==6)
			for(var/obj/Quest7Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==7)
			for(var/obj/Quest8Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==8)
			for(var/obj/Quest9Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==9)
			for(var/obj/Quest10Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==10)
			for(var/obj/Quest11Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==11)
			for(var/obj/Quest12Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==12)
			for(var/obj/Quest13Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==13)
			for(var/obj/Quest14Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==14)
			for(var/obj/Quest15Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==15)
			for(var/obj/Quest16Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==16)
			for(var/obj/Quest17Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==17)
			for(var/obj/Quest18Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==18)
			for(var/obj/Quest19Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==19)
			for(var/obj/Quest20Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==20)
			for(var/obj/Quest21Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==21)
			for(var/obj/Quest22Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==22)
			for(var/obj/Quest23Enter/O in world)
				src:client << O.coverimage
		if(src.questsdone==23)
			for(var/obj/Quest24Enter/O in world)
				src:client << O.coverimage
turf
	NewbieZoneEnter
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
				usr<<"I cannot leave here until i finish my training, I should talk to my Sensei."
	gravityenter
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
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
								usr.loc=locate(src.x,src.y,src.z)
								usr << "<b>Your time is up."
								usr.icon_state = ""
								usr.move = 1
							if(usr.dead == 1)
								..()
			else
				return 1


	gravityenter2
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
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
								usr.loc=locate(src.x,src.y,src.z)
								usr << "<b>Your time is up."
								usr.icon_state = ""
								usr.move = 1
							if(usr.dead == 1)
								..()
			else
				return 1
	safe
		Enter()
			if(istype(usr,/mob/characters))
				usr.safe = 1
			return  1
	nonsafe
		Enter()
			if(istype(usr,/mob/characters))
				usr.safe = 0
			return  1


	webesaiba
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x,150,9)
			else
				return 1

	weentsaiba
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(usr.x,1,1)
			else
				return 1
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
	icon = 'hair_dan_spikeyshort.dmi'
	icon_state = "hairstrip"
	layer = MOB_LAYER + 10


turf
	medichamber
		Entered()
			if(usr.meditations==1)
				if(istype(usr,/mob/characters) && usr)
					var/success1 = rand(1,2)
					if(usr.meditating!=1 &&usr.maxpowerlevel>1000000&&success1==1&&usr.meditations==1)
						usr.medprocess=1
						usr.meditating=1
						usr.icon_state = "meditate"
						usr.move=0
						usr << "You are meditating, focusing your concentration, and cannot move.."
						sleep(100)


						var/success2 = rand(1,55)
						if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success2==1&&usr.meditations==1&&usr.medprocess==1)
							usr.conc+=1
							usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
							usr << "You leave your meditiation state"
							usr.meditations=0
							usr.meditating=0
							usr.icon_state = ""
							usr.medprocess=0
							usr.move=1
						else
							var/success3 = rand(1,45)
							if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success3==2&&usr.meditations==1&&usr.medprocess==1)
								usr.conc+=1
								usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
								usr << "You leave your meditiation state"
								usr.meditations=0
								usr.meditating=0
								usr.icon_state = ""
								usr.medprocess=0
								usr.move=1
							else
								var/success4 = rand(1,105)
								if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success4==5&&usr.meditations==1&&usr.medprocess==1)
									usr.conc+=2
									usr << "You are meditating, focusing your concentration, and Succeed gaining +2 Concentration"
									usr << "You leave your meditiation state"
									usr.meditations=0
									usr.meditating=0
									usr.icon_state = ""
									usr.medprocess=0
									usr.move=1
								else
									var/success5 = rand(1,4000)
									if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success5==48&&usr.meditations==1&&usr.medprocess==1)
										usr.conc+=rand(20,50)
										usr << "You are meditating, focusing your concentration, and Succeed gaining 20+ to +50 Concentration"
										usr << "You leave your meditiation state"
										usr.meditations=0
										usr.meditating=0
										usr.icon_state = ""
										usr.medprocess=0
										usr.move=1
									else
										var/success6 = rand(1,150)
										if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success6==10&&usr.meditations==1&&usr.medprocess==1)
											usr.conc+=9
											usr << "You are meditating, focusing your concentration, and Succeed gaining +9 Concentration"
											usr << "You leave your meditiation state"
											usr.meditations=0
											usr.meditating=0
											usr.icon_state = ""
											usr.medprocess=0
											usr.move=1
										else
											var/success7 = rand(1,95)
											if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success7==12&&usr.meditations==1&&usr.medprocess==1)
												usr.conc+=1
												usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
												usr << "You leave your meditiation state"
												usr.meditations=0
												usr.meditating=0
												usr.icon_state = ""
												usr.medprocess=0
												usr.move=1
											else
												var/success8 = rand(1,190)
												if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success8==4&&usr.meditations==1&&usr.medprocess==1)
													usr.conc+=rand(1, 8)
													usr << "You are meditating, focusing your concentration, and Succeed gaining 1+ to 8+ Concentration"
													usr << "You leave your meditiation state"
													usr.meditations=0
													usr.meditating=0
													usr.icon_state = ""
													usr.medprocess=0
													usr.move=1
												else
													var/success9 = rand(1,35)
													if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success9==19&&usr.meditations==1&&usr.medprocess==1)
														usr.conc+=1
														usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
														usr << "You leave your meditiation state"
														usr.meditations=0
														usr.meditating=0
														usr.icon_state = ""
														usr.medprocess=0
														usr.move=1
													else
														var/success10 = rand(1,35)
														if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success10==24&&usr.meditations==1&&usr.medprocess==1)
															usr.conc+=1
															usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
															usr << "You leave your meditiation state"
															usr.meditations=0
															usr.meditating=0
															usr.icon_state = ""
															usr.medprocess=0
															usr.move=1
														else
															var/successretain1 = 4
															if(usr.maxpowerlevel>1000000&&usr.conc>=40&&usr.meditating==1&&successretain1==4&&usr.meditations==1&&usr.medprocess==1)
																usr.conc+=0
																usr << "You are meditating, focusing your concentration, you feel uneasy, but continue to focus"
																usr << "You retain your meditiation state"
																sleep(50)

															if(usr.conc<=39)
																usr.meditations=0
																usr.icon_state = ""
																usr.meditating=0
																usr.medprocess=0
																usr.move=1
																usr << "You are meditating, focusing your concentration, and fail to keep your mind focused!"
																usr << "You leave your meditiation state"

															else
																var/success12 = rand(1,190)
																if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success12==97&&usr.meditations==1&&usr.medprocess==1)
																	usr.conc+=rand(1, 8)
																	usr << "You are meditating, focusing your concentration, and Succeed gaining 1+ to 8+ Concentration"
																	usr << "You leave your meditiation state"
																	usr.meditations=0
																	usr.meditating=0
																	usr.icon_state = ""
																	usr.medprocess=0
																	usr.move=1
																else
																	var/successretain =3
																	if(usr.maxpowerlevel>1000000&&usr.conc>=40&&usr.meditating==1&&successretain==3&&usr.meditations==1&&usr.medprocess==1)
																		usr.conc+=0
																		usr << "You are meditating, focusing your concentration, you feel uneasy, but continue to focus"
																		usr << "You retain your meditiation state"
																		sleep(50)
																		goto tean1


																		tean1
																		if(usr.conc<=39)
																			usr.meditations=0
																			usr.icon_state = ""
																			usr.meditating=0
																			usr.medprocess=0
																			usr.move=1
																			usr << "You are meditating, focusing your concentration, and fail to keep your mind focused!"
																			usr << "You leave your meditiation state"

																		else
																			var/success14 = rand(1,35)
																			if(usr.maxpowerlevel>1000000&&usr.meditating==1&&success14==35&&usr.meditations==1&&usr.medprocess==1)
																				usr.conc+=1
																				usr << "You are meditating, focusing your concentration, and Succeed gaining +1 Concentration"
																				usr << "You leave your meditiation state"
																				usr.meditations=0
																				usr.meditating=0
																				usr.icon_state = ""
																				usr.medprocess=0
																				usr.move=1
																			else
																				usr.meditations=0
																				usr.icon_state = ""
																				usr.meditating=0
																				usr.medprocess=0
																				usr.move=1
																				usr << "You are meditating, focusing your concentration, and fail to keep your mind focused!"
																				usr << "You leave your meditiation state"

	gravchamber
		Enter(atom/movable/O)
			if(usr.gravitytype==0)
				if(istype(usr,/mob/characters) && usr==O)
					if(usr.grav != 0 && usr.kame==0)
						if(usr.maxpowerlevel<500000000)
							if(usr.grav>usr.maxpowerlevel/1000)
								var/success = rand(1,250)
								if(success == 1 || success == 2)
									usr << "You feel the gravity pull down on you. You seem stronger."
									usr.move=0
									sleep(3)
									usr.move=1
									usr.powerlevel -= usr.grav * (rand(8,70))
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)

										usr.maxpowerlevel += usr.grav / (rand(10,80))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 3 || success == 5)
									usr << "You feel yourself getting used to the gravity."
									usr.move=0
									sleep(1)
									usr.move=1
									usr.powerlevel -= usr.grav * (rand(8,120))
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										usr.maxpowerlevel += usr.grav / (rand(10,90))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 4 || success == 6)
									usr << "You feel the full force of the gravity!!"
									usr.powerlevel -= usr.grav * (rand(8,120))
									usr.move=0
									sleep(5)
									usr.move=1
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										usr.maxpowerlevel += usr.grav / (rand(10,150))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0
							else
								var/success = rand(1,150)
								if(success == 1 || success == 2)
									usr << "You feel the gravity pull down on you, you feel used to the gravity."
									usr.powerlevel -= usr.grav * (rand(4,15))
									usr.move=0
									sleep(2)
									usr.move=1
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)

										usr.maxpowerlevel += usr.grav / (rand(20,180))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 3 || success == 5)
									usr << "You feel the gravity pull down on you, you feel used to the gravity."
									usr.move=0
									sleep(1)
									usr.move=1
									usr.powerlevel -= usr.grav * (rand(4,15))
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										usr.maxpowerlevel += usr.grav / (rand(20,120))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 4 || success == 6)
									usr <<"You feel the gravity pull down on you, you feel used to the gravity."
									usr.move=0
									sleep(3)
									usr.move=1
									usr.powerlevel -= usr.grav * (rand(4,15))
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										usr.maxpowerlevel += usr.grav / (rand(20,220))
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


						else
							var/success = rand(1,150)
							if(success == 1 || success == 2)
								usr << "The gravity doesnt even bother you"
								usr.powerlevel -= 100
								if(usr.powerlevel <= 0)
									usr.Die()
								if(usr.powerlevel >= 1)

									usr.maxpowerlevel += 100
									usr.maxpowerlevel = round(usr.maxpowerlevel)

									if(usr.grav == 0)
										usr.powerlevel += 0

					else
						return 1

					return 1
				else
					return 1
			else
				if(istype(usr,/mob/characters) && usr==O)
					if(usr.grav != 0 && usr.kame==0)
						if(usr.maxpowerlevel<500000000)
							if(usr.grav>usr.maxpowerlevel/1000)
								var/success = rand(1,6)
								if(success == 1 || success == 2)
									var/message=rand(1,100)
									if(message==100)
										usr << "You feel the gravity pull down on you. You seem stronger."
										usr.move=0
										sleep(3)
										usr.move=1
									usr.powerlevel -= usr.grav * (rand(14,20))/25
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										if(usr.ssj!=1)
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/15
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										else
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/40
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 3 || success == 5)
									usr.powerlevel -= usr.grav * (rand(14,20))/25
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										if(usr.ssj!=1)
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/15
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										else
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/40
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0


								if(success == 4 || success == 6)
									usr.powerlevel -= usr.grav * (rand(14,20))/25
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)
										if(usr.ssj!=1)
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/15
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										else
											if(usr.grav>50)
												usr.maxpowerlevel += 13+(usr.grav / (rand(40,50)))/40
											if(usr.grav<=50)
												usr.maxpowerlevel += 4+(usr.grav / 5)
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0
							else
								var/success = rand(1,150)
								if(success == 1 || success == 2)
									usr<<"This Gravity Barely Effects you!"
									usr.powerlevel -= usr.grav * (rand(8,15))/25
									if(usr.powerlevel <= 0)
										usr.Die()
									if(usr.powerlevel >= 1)

										usr.maxpowerlevel += 1+(usr.grav / (rand(40,50)))/40
										usr.maxpowerlevel = round(usr.maxpowerlevel)

										if(usr.grav == 0)
											usr.powerlevel += 0
						else
							var/success = rand(1,150)
							if(success == 1 || success == 2)
								usr << "The gravity doesnt even bother you"
								usr.powerlevel -= 100
								if(usr.powerlevel <= 0)
									usr.Die()
								if(usr.powerlevel >= 1)

									usr.maxpowerlevel += 1+(usr.grav / (rand(40,50)))/40
									usr.maxpowerlevel = round(usr.maxpowerlevel)

									if(usr.grav == 0)
										usr.powerlevel += 0

					else
						return 1

					return 1
				else
					return 1

turf
	thougrav
		Entered(atom/movable/O)
			if(istype(usr,/mob/characters)&& usr==O)
				if(usr.maxpowerlevel >= 1000000)
					usr.random = rand(1,30)
					if(usr.random == 29)
						usr << "<b>You struggle a bit because of the gravity..."
						usr.maxpowerlevel += (rand(1,25))
					if(usr.random == 30)
						usr << "<b>You walk on this planet without a problem."

				if(usr.maxpowerlevel >= 100000 && usr.maxpowerlevel <= 1000000)
					usr.random = rand(1,12)
					if(usr.random == 1)
						usr << "<B>You walk through the gravity of this planet without a problem."
						usr.powerlevel -= (rand(1,300))
					if(usr.random == 2)
						usr << "<b>You feel a strained walking on this planet."
						usr.stamina -= (rand(0,1))
						usr.powerlevel -= (rand(1,900))
					if(usr.powerlevel > 0)
						usr.maxpowerlevel += (rand(0,20))
					else
						spawn()usr.KO()
						usr.loc=locate(139,4,12)
						usr << "<b>You are sent back to Kaios because this gravity is too much."

				if(usr.maxpowerlevel < 100000 && usr.maxpowerlevel >= 10001)
					usr.random = rand(1,12)
					if(usr.random == 1)
						usr << "<B>You walk through the gravity of this planet without a problem."
						usr.powerlevel -= (rand(1,500))
					if(usr.random == 2)
						usr << "<b>You feel strained walking on this planet."
						usr.stamina -= (rand(0,3))
						usr.powerlevel -= (rand(1,300))
					if(usr.powerlevel > 0)
						usr.maxpowerlevel += (rand(0,15))
					else
						spawn()usr.KO()
						usr.loc=locate(139,4,12)
						usr << "<b>You are sent back to Kaios because this gravity is too much."

				if(usr.maxpowerlevel < 10000)
					usr.random = rand(1,12)
					if(usr.random == 1)
						usr << "<B>You walk on the planet, feeling extremely strained.."
						usr.stamina -= (rand(0,3))
						usr.powerlevel -= (rand(1,10000))
					if(usr.random == 2)
						usr << "<b>You feel extremely strained walking on this planet."
						usr.stamina -= (rand(0,3))
						usr.powerlevel -= (rand(1,10000))
					if(usr.powerlevel > 0)
						usr.maxpowerlevel += (rand(0,10))
					else
						spawn()usr.KO()
						usr.loc=locate(139,4,12)
						usr << "<b>You are sent back to Kaios because this gravity is too much."

				return 1
turf
	tengrav
		Entered(atom/movable/O)
			if(istype(usr,/mob/characters) && usr==O)
				if(usr.maxpowerlevel >=30000)
					usr.random = rand(1,50)
					if(usr.random==1)
						usr << "You walk through the gravity of this planet without a problem"
				if(usr.maxpowerlevel >= 10001&& usr.maxpowerlevel <30000)
					usr.random = rand(1,50)
					if(usr.random == 49)
						usr << "<b>You struggle a bit because of the gravity..."
						usr.maxpowerlevel += 1
					if(usr.random == 50)
						usr << "<b>You walk on this planet without a problem."

				if(usr.maxpowerlevel > 1500 && usr.maxpowerlevel <= 10000)
					usr.random = rand(1,12)
					if(usr.random == 1)
						usr << "<B>You walk through the gravity of this planet without a problem."
					if(usr.random == 2)
						usr << "<b>You feel a little strained walking on this planet."
						usr.stamina -= (rand(0,1))
					usr.maxpowerlevel += 1
					usr.KO()
				if(usr.maxpowerlevel <= 1500 && usr.maxpowerlevel >= 500)
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
				return 1

turf
	tengravfirst
		verb
			Jump()
				usr.loc=locate(139,4,12)
				usr <<"You jump to  King Kais!"

turf
	kaioenter
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(98,71,3)
			else
				return 1
turf
	tolab
		icon = 'turfs.dmi'
		icon_state = "door"
		Enter()
			if(usr.race!= "Tsufuru-jin")
				usr<<"Sorry Tsufuru-jin only."
			else
				usr.loc=locate(11,71,21)
	leavelab
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(85,99,1)
			else
				return 1
turf
	tosparroom
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.maxpowerlevel>15000000)
					usr<<"Sorry you've gotten to strong for this division"
				else
					usr.loc=locate(24,147,20)
			else
				return 1
turf
	tileleave
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		density=0
turf
	kaioleave
		icon = 'turfs.dmi'
		icon_state = "gravityenter"
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(139,7,12)
			else
				return 1

turf/TDBTeleports
	topbuildingenter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(26,105,23)
			else
				return 1
	topbuildingleave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(37,264,23)
			else
				return 1

	shop1enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(22,10,23)
			else
				return 1
	shop1leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(64,254,23)
			else
				return 1
	shop2enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(45,10,23)
			else
				return 1
	shop2leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(25,234,23)
			else
				return 1
	shop3enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(68,10,23)
			else
				return 1
	shop3leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(68,210,23)
			else
				return 1

	shop4enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(91,10,23)
			else
				return 1
	shop4leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(23,254,23)
			else
				return 1
	shop5enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(22,33,23)
			else
				return 1
	shop5leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(69,223,23)
			else
				return 1
	shop6enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(45,33,23)
			else
				return 1
	shop6leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(43,223,23)
			else
				return 1
	shop7enter
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(68,33,23)
			else
				return 1
	shop7leave
		Enter()
			if(istype(usr,/mob/characters))
				usr.loc=locate(34,207,23)
			else
				return 1