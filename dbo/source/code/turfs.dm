mob/var/tmp/secalert = 0
turf
	NoZanzokenArea
		nozanzone = 1
turf
	var
		gatherable = 0
		ki = 0

turf
	DblClick()
		if(usr.zanzoken)
			if(usr.move==0)
				usr <<"<b>You can't teleport there at the moment!"
			else
				if(src.density )
					usr <<"<B>You can't teleport to there!"
				else
					if(src.nozanzone )
						usr <<"<B>You can't teleport to there!"
					else
						view(6) << 'sounds/it.wav'
						usr << "<B><FONT COLOR = BLUE>You teleport!"
						var/obj/aimage = new/obj/afterimage(locate(usr.x,usr.y,usr.z))
						aimage.name = "[usr]'s Afterimage"
						aimage.icon = usr.icon
						aimage.overlays = usr.overlays
						aimage.underlays = usr.underlays
						aimage.icon_state = usr.icon_state
						aimage.dir = usr.dir
						aimage.density = 0
						usr.loc=locate(src.x,src.y,src.z)
						spawn(30)
							del(aimage)
turf
	monsterretain
		density = 0
		name = "Monster Retaination Check"
		Entered(var/mob/M)
			if(ismob(M))
				if(M.mon )
					M.loc = locate(M.x,M.y-1,M.z)
					view(M, 6) << "Monster retained."
					return ..()
				else
					return ..()
			else
				del(M)
				return ..()

area
	name = "Dragonball Online"
	gravityred
		icon = 'icons/gravityred.dmi'
		icon_state = ""
		layer = -1
		density = 0
turf
	enterncave
		Entered(var/mob/M)
			if(ismob(M))
				if(M.key !=null)
					var/entr = rand(1,4)
					if(entr == 1)
						M.loc = locate(67,127,20)
						M << "You fell down a hole.."
			else
				del(M)
turf
	leavencave
		Entered(var/mob/M)
			if(ismob(M))
				if(M.key !=null)
					M.loc = locate(114,67,5)
			else
				del(M)
turf
	leave_radpod
		Entered(var/mob/M)
			if(ismob(M))
				if(M.key !=null)
					M.loc = locate(86,14,6)
			else
				del(M)

turf
	ccgravfloor
		icon = 'icons/bluefloor.dmi'
		icon_state = ""
		density = 0
		Entered(var/mob/M)
			if(!istype(M)) return ..()
			if(M.ccuse !=1)
				M.loc = locate(M.hx, M.hy, M.hz)
				M.grav = 0
				alert(M,"You can not enter the CC Grav Room illegally")
turf
	kkwoodenfloor
		icon = 'icons/turfs2.dmi'
		icon_state = "wooden"
		density = 0
/*		Entered(var/mob/M)
			if(M.kkp )
				M.kkp =0*/

	lines
		name = "Dragonball Online"
		icon = 'icons/turfs2.dmi'
		icon_state = "lines"
		layer = 10
		density = 0
obj
	bookcase
		name = "Book Case"
		icon = 'icons/turfs2.dmi'
		icon_state = "bookcase"
		density = 1
		layer = 2

turf
	vase1
		name = "Vase"
		icon = 'icons/turfs2.dmi'
		icon_state = "vase1"
		density = 1
		layer = 2
	vase2
		name = "Vase"
		icon = 'icons/turfs2.dmi'
		icon_state = "vase2"
		density = 1
		layer = 2

turf
	name = "Dragonball Online"
	vvech1
		icon = 'icons/vvech1.png'
		icon_state = ""
		density = 1
	vvech2
		icon = 'icons/vvech2.png'
		icon_state = ""
		density = 1
	vbed
		icon = 'icons/vbed.dmi'
		icon_state = ""
		density = 1
	vboxes
		icon = 'icons/boxstack.dmi'
		icon_state = ""
		density = 1
	vplants
		icon = 'icons/turfs2.dmi'
		icon_state = "vplants"
		density = 1
	vmerchwind
		icon = 'icons/vmerch1.dmi'
		icon_state = ""
		density = 0
	vmercht
		icon = 'icons/turfs2.dmi'
		icon_state = "vmercht"
		density = 1
	vmerchch
		icon = 'icons/turfs2.dmi'
		icon_state = "vmerchch"
		density = 1
	vtile2
		icon = 'icons/turfs2.dmi'
		icon_state = "vtile2"
		density = 0
	vcomput
		icon = 'icons/vcomp.png'
		icon_state = ""
		density = 1
	vcomp1
		icon = 'icons/turfs2.dmi'
		icon_state = "c1"
		density = 1
	vcomp2
		icon = 'icons/turfs2.dmi'
		icon_state = "c2"
		density = 1
	vcomp3
		icon = 'icons/turfs2.dmi'
		icon_state = "c3"
		density = 1
	vcomp4
		icon = 'icons/turfs2.dmi'
		icon_state = "c4"
		density = 1
	vlanding
		icon = 'icons/turfs2.dmi'
		icon_state = "vland"
		density = 0
	shipwin
		icon = 'icons/window.dmi'
		density = 1
	vtree
		icon = 'icons/vtree.png'
		icon_state = ""
		density = 1
		ki = 12
		gatherable = 1
	shipwindow
		icon = 'icons/window.png'
		density = 1
	vfence
		icon = 'icons/turfs2.dmi'
		icon_state = "fence1"
		density = 1
	vfence2
		icon = 'icons/turfs2.dmi'
		icon_state = "fence2"
		density = 0
		layer = 9
	vfloor
		icon = 'icons/turfs2.dmi'
		icon_state = "ffloor"
		density = 0
	vdirt
		icon = 'icons/turfs2.dmi'
		icon_state = "vdirt"
		density = 0
	vdump
		icon = 'icons/vdump.png'
		icon_state = ""
		density = 1
	vhvyarms
		icon = 'icons/turfs2.dmi'
		icon_state = "hvyarms"
		density = 0
		layer = 2
	vbarrel1
		icon = 'icons/turfs2.dmi'
		icon_state = "barrel1"
		density = 1
	vbarrel2
		icon = 'icons/turfs2.dmi'
		icon_state = "barrel2"
		density = 0
		layer = 2
	vmech
		icon = 'icons/turfs2.dmi'
		icon_state = "mech"
		density = 1
	vgrass
		icon = 'icons/turfs2.dmi'
		icon_state = "vgrass"
		density = 0
		gatherable = 1
		ki = 8
	vtile
		icon = 'icons/turfs2.dmi'
		icon_state = "ftile"
		density = 0
	vkeepout
		icon = 'icons/turfs2.dmi'
		icon_state = "kout"
		density = 1
		opacity = 0
	vbuildingtop
		icon = 'icons/turfs2.dmi'
		icon_state = "vtop"
		density = 1
		opacity = 1
	vdbuildingtop
		icon = 'icons/turfs2.dmi'
		icon_state = "vtop"
		opacity = 1
		layer = 9
	vbuilding
		icon = 'icons/turfs2.dmi'
		icon_state = "vmiddle"
		density = 1
	vdbuilding
		icon = 'icons/turfs2.dmi'
		icon_state = "vmiddle"
		opacity = 1
		layer = 9
	woodenfloor
		icon = 'icons/turfs2.dmi'
		icon_state = "wooden"
		density = 0
	airplanewall
		icon = 'icons/airplanewall.dmi'
		icon_state = "wall"
		density = 1
	airplanewall2
		icon = 'icons/airplanewall.dmi'
		icon_state = "window"
		density = 1
	airplanewall3
		icon = 'icons/airplanewall.dmi'
		icon_state = "window2"
		density = 1
	airplanewall4
		icon = 'icons/airplanewall.dmi'
		icon_state = "wall2"
		density = 1
	airplanefloor
		icon = 'icons/airplanefloor.dmi'
		icon_state = "top"
		density = 0
	airplanefloor2
		icon = 'icons/airplanefloor.dmi'
		icon_state = "center"
		density = 0
	airplanefloor3
		icon = 'icons/airplanefloor.dmi'
		icon_state = "bottom"
		density = 0
	airplaneedge
		icon = 'icons/airplaneedge.dmi'
		icon_state = ""
		density = 1
	airplaneedge2
		icon = 'icons/airplaneedge.dmi'
		icon_state = "door"
		density = 1
	airplaneedge3
		icon = 'icons/airplaneedge.dmi'
		icon_state = "t"
		density = 1
	airplaneedge4
		icon = 'icons/airplaneedge.dmi'
		icon_state = "b"
		density = 1
	airplanedoor
		icon = 'icons/airplanedoor.dmi'
		icon_state = ""
		density = 1
	airplanechair
		icon = 'icons/airplanechair.dmi'
		icon_state = "chair"
		density = 1
	airplanechair2
		icon = 'icons/airplanechair.dmi'
		icon_state = "chair1"
		density = 1

turf
	name = "Dragonball Online"
	enternamekshopkeeper
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(134,136,8)
			else
				del(M)
				return
	enterdeshouse
		Entered(var/mob/M)
			if(ismob(M))
				alert("The door seems to be fused shut!")
			else
				del(M)
				return
	enterdeshouse2
		Entered(var/mob/M)
			if(ismob(M))
				alert("You look inside, nothing of interest catches your eye.")
			else
				del(M)
				return
	EnterShip1
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(131,13,8)
			else
				del(M)
				return
	EnterShip2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(132,13,8)
			else
				del(M)
				return
	EnternewShip
		Entered(var/mob/M)
			if(ismob(M))
				alert("Some type of force prevents you from entering!")
			else
				del(M)
				return
	LeaveShip
		icon = 'icons/turfs.dmi'
		icon_state = "gravityenter"
		density = 0
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(125,129,5)
			else
				del(M)
				return
	leavenamekshopkeeper
		icon = 'icons/door.dmi'
		icon_state = ""
		density = 0
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(24,117,5)
			else
				del(M)
				return
	redblue
		icon = 'icons/turfs.dmi'
		icon_state = "redblue"
	grass
		icon = 'icons/turfs.dmi'
		icon_state = "grass"
		density = 0
		gatherable = 1
		ki = 5
	cliffleft
		icon = 'icons/turfs.dmi'
		icon_state = "cliffleft"
		density = 1
	earthhouse
		icon = 'icons/house.png'
		icon_state = ""
		density = 1
	crashedpod
		icon = 'icons/crashpod.png'
		icon_state = ""
		density = 0
		Entered(var/mob/M)
			if(usr.rad_dead == 1)
				if(ismob(M))
					if(M.key !=null)
						M.loc = locate(9,6,24)
				else
					del(M)
	cliffright
		icon = 'icons/turfs.dmi'
		icon_state = "cliffright"
		density = 1
	tourneyfloor
		icon = 'icons/turfs.dmi'
		icon_state = "tourneyfloor"
		density = 0
	friezaship
		icon = 'icons/friezaship.png'
		icon_state = ""
		density = 1
	cliffcut
		icon = 'icons/turfs.dmi'
		icon_state = "cliffcut"
		density = 1
	cliffcut2
		icon = 'icons/turfs.dmi'
		icon_state = "cliffcut2"
		density = 1
	cliffcut3
		icon = 'icons/turfs.dmi'
		icon_state = "cliffcut3"
		density = 1
	topleft
		icon = 'icons/turfs.dmi'
		icon_state = "topleft"
		density = 1
		ki = 2
		gatherable = 1
	namekianhouse
		icon = 'icons/nhouse.png'
		density = 1
	namekianhouse2
		icon = 'icons/nhouse2.png'
		density = 1
	namekiantree
		icon = 'icons/ntree.png'
		density = 1
		ki = 8
		gatherable = 1
	topright
		icon = 'icons/turfs.dmi'
		icon_state = "topright"
		density = 1
		ki = 2
		gatherable = 1
	topmiddle
		icon = 'icons/turfs.dmi'
		icon_state = "topmiddle"
		density = 1
		ki = 2
		gatherable = 1
	topreverse
		icon = 'icons/turfs.dmi'
		icon_state = "topreverse"
		density = 1
		ki = 2
		gatherable = 1
	topreverse2
		icon = 'icons/turfs.dmi'
		icon_state = "topreverse2"
		density = 1
		ki = 2
		gatherable = 1
	topreverse3
		icon = 'icons/turfs.dmi'
		icon_state = "topreverse3"
		density = 1
		ki = 2
		gatherable = 1
	topreverse4
		icon = 'icons/turfs.dmi'
		icon_state = "topreverse4"
		density = 1
		ki = 2
		gatherable = 1
	topreverse5
		icon = 'icons/turfs.dmi'
		icon_state = "topreverse5"
		density = 1
		ki = 2
		gatherable = 1
	gstones
		icon = 'icons/turfs.dmi'
		icon_state = "gstones"
		density = 1
	gstones2
		icon = 'icons/turfs.dmi'
		icon_state = "gstones2"
		density = 1
	buildingtop
		icon = 'icons/turfs.dmi'
		icon_state = "buildingtop"
		density = 1
		opacity = 1
	buildingside
		icon = 'icons/turfs.dmi'
		icon_state = "buildingside"
		density = 1
	doorbuildingside
		icon = 'icons/turfs.dmi'
		icon_state = "buildingside"
		layer = 9
	doorbuildingtop
		icon = 'icons/turfs.dmi'
		icon_state = "buildingtop"
		opacity = 1
		layer = 9
	tournamentside
		icon = 'icons/turfs2.dmi'
		icon_state = "gwall"
		density = 1
	snow
		icon = 'icons/turfs.dmi'
		icon_state = "snow"
		density = 0
	snowbump
		icon = 'icons/turfs.dmi'
		icon_state = "snowbump"
		density = 0
	snowhole
		icon = 'icons/turfs.dmi'
		icon_state = "snowhole"
		density = 0
	icewalk
		icon = 'icons/turfs.dmi'
		icon_state = "icewalk"
		density = 0

	ccsfloor
		icon = 'icons/turfs.dmi'
		icon_state = "ccsf"
		density = 0

	ccswall
		icon = 'icons/turfs.dmi'
		icon_state = "ccsw"
		density = 1

	ccswall2
		icon = 'icons/turfs.dmi'
		icon_state = "ccsw2"
		density = 1

	gkstone
		icon = 'icons/turfs.dmi'
		icon_state = "gkstone"
		density = 0

	ccswall3
		icon = 'icons/turfs.dmi'
		icon_state = "ccsw3"
		density = 1

	ccschair
		icon = 'icons/turfs.dmi'
		icon_state = "chair"
		density = 1

	ccscomputer
		icon = 'icons/turfs.dmi'
		icon_state = "computer"
		density = 1

	ccsscanner
		icon = 'icons/turfs.dmi'
		icon_state = "longrangesense"
		density = 1

	ccstime
		icon = 'icons/turfs.dmi'
		icon_state = "shipinfo"
		density = 1

	snakeway1
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway1"
		density = 1
	snakeway2
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway2"
		density = 1
	snakeway3
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway3"
		density = 1
	snakeway4
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway4"
		density = 1
	sstones
		icon= 'icons/turfs.dmi'
		icon_state = "sstones"
		density = 1
	space
		icon = 'icons/space.dmi'
		icon_state = ""
		density = 1
	flowers
		icon = 'icons/turfs.dmi'
		icon_state = "flowers"
	flowers2
		icon = 'icons/turfs.dmi'
		icon_state = "flowers2"
	bloodpong
		icon = 'icons/turfs.dmi'
		icon_state = "bloodpond"
		density = 1
	bloodpong2
		icon = 'icons/turfs.dmi'
		icon_state = "bpond2"
		density = 1
	bloodpong3
		icon = 'icons/turfs.dmi'
		icon_state = "bpond3"
		density = 1
	bloodfountain
		icon = 'icons/fountain.png'
		icon_state = ""
		density = 1
	hfilfloor
		icon = 'icons/turfs.dmi'
		icon_state = "hfilfloor"
		density = 0
	hfilcliff
		icon = 'icons/turfs.dmi'
		icon_state = "hfilcliff"
		density = 1
	cctop
		icon = 'icons/turfs.dmi'
		icon_state = "cctop"
		density = 1
		opacity = 1
	dcctop
		icon = 'icons/turfs.dmi'
		icon_state = "cctop"
		layer = 9
		opacity = 1
	fromgero
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(56,104,3)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
				return

	entergero
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(110,137,12)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
				return
	gerospot
	ccside
		icon = 'icons/turfs.dmi'
		icon_state = "ccside"
		density = 1
	dccside
		icon = 'icons/turfs.dmi'
		icon_state = "ccside"
		layer = 9
		density = 0
	window
		icon = 'icons/turfs.dmi'
		icon_state = "window"
		density = 1
	ngrass
		icon = 'icons/turfs.dmi'
		icon_state = "ngrass"
		ki = 7
		gatherable = 1
	nwater
		icon = 'icons/turfs.dmi'
		icon_state = "nwater"
		density = 1
		ki = 3
		gatherable = 1
	spaceshipfloor
		icon = 'icons/spacefloor.dmi'
		icon_state = ""
		density = 0
	stones
		icon = 'icons/turfs.dmi'
		icon_state = "stones"
		density = 0
	water
		icon = 'icons/turfs.dmi'
		icon_state = "water"
		density = 1
		ki = 2
		gatherable = 1
	cliff
		icon = 'icons/turfs.dmi'
		icon_state = "cliff"
		density = 1
	cliff2
		icon = 'icons/turfs.dmi'
		icon_state = "cliff"
		density = 0
		Enter(mob/M)
			if(M.flight == 0)
				walk(M,SOUTH,7)
			return 1
	ncliff
		icon = 'icons/turfs.dmi'
		icon_state = "ncliff"
		density = 1
	ntopmiddle
		icon = 'icons/turfs.dmi'
		icon_state = "ntopmiddle"
		density = 1
	tabler
		icon = 'icons/turfs.dmi'
		icon_state = "tabler"
		density = 1
	tablel
		icon = 'icons/turfs.dmi'
		icon_state = "tablel"
		density = 1
	whitefloor
		icon = 'icons/bluefloor.dmi'
		icon_state = ""
		density = 0
	HBTCTile
		icon = 'icons/hbtcfloor.dmi'
		icon_state = ""
		density = 0
	grayfloor
		icon = 'icons/turfs.dmi'
		icon_state = "grayfloor"
		density = 0
	sidewalkn
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	sword
		icon = 'icons/turfs.dmi'
		icon_state = "sword"
		density = 0
	sidewalke
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	tree
		icon = 'icons/NewTree.dmi'
		density = 1
		ki = 6
		gatherable = 1
	tree2
		icon = 'icons/tree2.png'
		density = 1
		ki = 6
		gatherable = 1
	tree3
		icon = 'icons/tree3.png'
		density = 1
		ki = 6
		gatherable = 1
	bush
		icon = 'icons/bush.dmi'
		density = 1
		gatherable = 1
		ki = 5
	sidewalkne
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	sidewalknw
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	sidewalkse
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	sidewalksw
		icon = 'icons/wall.concrete.dmi'
		icon_state = ""
		density = 0
	grayfloor
		icon = 'icons/turfs.dmi'
		icon_state = "grayfloor"
		density = 0
	waterfall
		icon = 'icons/turfs.dmi'
		icon_state = "waterfall"
		density = 0
	cliffopening
		icon = 'icons/turfs.dmi'
		icon_state = "cliffopening"
		density = 0
	cloudtwo
		icon = 'icons/turfs2.dmi'
		icon_state = "cloud2"
		density = 1
		nozanzone = 1
	sand
		icon = 'icons/dirt2.dmi'
		icon_state = ""
		density = 0
	nsand
		icon = 'icons/turfs.dmi'
		icon_state = "npath"
		density = 0
	nhole
		icon = 'icons/turfs.dmi'
		icon_state = "nhole"
		density = 0
		ki = 1
		gatherable = 1
	stairs
		icon = 'icons/turfs.dmi'
		icon_state = "stairs"
		ki = 2
		gatherable = 1
	black
		icon = 'icons/turfs.dmi'
		icon_state = "black"
		density = 1
		opacity = 1
		unblowable = 1
		nozanzone = 1
		Enter()
			return 0
	killblack
		icon = 'icons/turfs.dmi'
		icon_state = "black"
		density = 1
		opacity = 1
		unblowable = 1
		nozanzone = 1
		Enter()
			return 0

	dirt
		icon = 'icons/turfs.dmi'
		icon_state = "dirt"
	carpet
		icon = 'icons/turfs2.dmi'
		icon_state = "carpet"
	snakeway
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway"
	revivesnway
		icon = 'icons/turfs.dmi'
		icon_state = "snakeway"
		Entered(var/mob/M)
			if(ismob(M))
				view(M, 6) << 'sounds/it2.wav'
				M.loc=locate(M.hx, M.hy, M.hz)
				M << "<B><FONT COLOR = RED>You have been transported back to Earth!"
			else
				del(M)
				return

	portal
		icon = 'turfs.dmi'
		icon_state = "portal"
		Entered(var/mob/M)
			if(ismob(M))
				view(M, 6) << 'sounds/it2.wav'
				usr.dead = 0
				usr.immortal = 0
				usr.overlays -= 'icons/halo.dmi'
				M.loc=locate(M.hx, M.hy, M.hz)
				M << "<B><FONT COLOR = RED>You have been transported back to Earth!"
			else
				del(M)
				return


	runway
		icon='icons/guildturfs.dmi'
		icon_state="runway"
		density=0
	snl
		icon = 'icons/turfs.dmi'
		icon_state = "snl"
	snr
		icon = 'icons/turfs.dmi'
		icon_state = "snr"
	snt
		icon = 'icons/turfs.dmi'
		icon_state = "snt"
	snb
		icon = 'icons/turfs.dmi'
		icon_state = "snb"
	cloud
		icon = 'icons/turfs.dmi'
		icon_state = "cloud"
		density = 1
		nozanzone = 1
	sky
		icon = 'icons/Sky.dmi'
		icon_state = "cloud2"
		density = 1
		nozanzone = 1
	sky2
		icon = 'icons/Sky.dmi'
		icon_state = "cloud2"
		density = 1
		nozanzone = 1
		Enter()
			if(usr.flight == 0)
				view(6) << 'sounds/throw.wav'
				usr.immortal = 0
				usr.loc=locate(74,76,8)
				usr << "<B>You have fallen off of Heaven!"
			return 1
	loco
		Entered(var/mob/M)
			if(ismob(M))
				M.x = 85
			else
				del(M)
	loco2
		Entered(var/mob/M)
			if(ismob(M))
				M.x = 106
			else
				del(M)
	loct
		Entered(var/mob/M)
			if(ismob(M))
				M.y = 116
			else
				del(M)
	loct2
		Entered(var/mob/M)
			if(ismob(M))
				M.y = 137
			else
				del(M)

	locenter
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x+2,M.y+2, M.z)
			else
				del(M)

	locenter2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x-2,M.y-2, M.z)
			else
				del(M)

	locenter3
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x-2,M.y+2, M.z)
			else
				del(M)

	locenter4
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x+2,M.y-2, M.z)
			else
				del(M)

	got
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(95,118,2)
			else
				del(M)

	enta
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(9,66,3)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
	enta2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(10,66,3)
				M.density = 1
				M.icon_state = ""
			else
				del(M)

	ente
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(68,1,4)
				M.density = 1
				M.icon_state = ""
			else
				del(M)

	ente2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(69,1,4)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
	ceev
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(125,140,1)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
	ceev2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(3,1,3)
				M.density = 1
				M.icon_state = ""
			else
				del(M)
	healexit
		Entered(var/mob/M)
			if(ismob(M))
				M.heal = 0
				return 1
			else
				del(M)

	gonorth
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,1,6)
			else
				del(M)

	gonorth2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,150,1)
			else
				del(M)
	goYnorth
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,1,22)
			else
				del(M)

	goYsouth2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,150,16)
			else
				del(M)

	goeast
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(1,M.y,7)
			else
				del(M)
	goNeast
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(1,M.y,21)
			else
				del(M)
	goNwest
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(150,M.y,5)
			else
				del(M)
	SatanToEast
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(1,M.y,13)
			else
				del(M)
	EastToSatan
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(150,M.y,6)
			else
				del(M)

	SatanToWest
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(150,M.y,11)
			else
				del(M)
	WestToSatan
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(1,M.y,6)
			else
				del(M)

	goeast2
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(150,M.y,1)
			else
				del(M)
	door
		name = "Door"
		icon = 'icons/door.dmi'
		icon_state = ""
		layer = 9
		Enter(atom/A)
			if(ismob(A) && !istype(A,/monster))
				icon_state="open"
				density=0
				spawn(75)
					density=1
					icon_state=""
				return ..()
			else if(istype(A,/monster))
				density=1
				icon_state=""
				return 0
			else
				del(A)
				return ..()

	vdoor
		name = "Advanced Door"
		icon = 'turfs2.dmi'
		icon_state = "door1"
		layer = 9
		New()
			..()
			src.overlays += /turf/vdoor2
		Enter(atom/A)
			if(ismob(A))
				view(6) << 'sounds/dooropen.wav'
				src.overlays = ""
				src.overlays += /turf/ovdoor2
				src.icon_state="odoor1"
				src.density=0
				src.layer=1
				spawn(75)
					src.overlays = ""
					src.overlays += /turf/vdoor2
					src.density=1
					src.icon_state="door1"
					src.layer=9
				return ..()
			else
				del(A)
				return ..()

	vdoor2
		name = "Advanced Door"
		icon = 'icons/turfs2.dmi'
		icon_state = "door2"
		density = 0
		pixel_y = 32
		layer = 9

	ovdoor2
		name = "Advanced Door"
		icon = 'icons/turfs2.dmi'
		icon_state = "odoor2"
		density = 0
		pixel_y = 32
		layer = 9

	barenter
		name = "Door"
		layer = 9
		//Click()
		Entered(var/mob/M)
			//var/mob/M = usr
			if(ismob(M))
				if(locate(/obj/items/autograph) in usr || usr.squest == 1 )
					M.loc=locate(13,10,3)
					M << "<B>You enter 'DBO Bar'."
				else if(M.throwed )
					M.Die(M.throwedb)
					M.throwed = 0
					M.throwedb = null
				else
					//M << "<B>You get shot by Barkeeper"
					//world << "<B><FONT COLOR = GREEN>Info:</B> <FONT COLOR = RED>[usr] has gotten shot by Barkeepers shotgun!"
					//M.dead += 1
					//M.loc=locate(54,9,3)
					//M.powerlevel.value = M.powerlevel.max_value
					M << "<B>You can't enter, you do not have the autograph!"

			else
				del(M)
				return

	barleave
		name = "Door"
		icon = 'icons/door.dmi'
		icon_state = ""
		layer = 9
		//Click()
		Entered(var/mob/M)
			//var/mob/M = usr
			if(ismob(M))
				M.loc=locate(105,101,6)
				M << "<B>You leave 'DBO Bar'."
			else
				del(M)
				return


	gymenter
		name = "Door"
		icon = 'icons/door.dmi'
		icon_state = ""
		layer = 9
		//Click()
		Entered(var/mob/M)
			//var/mob/M = usr
			if(ismob(M))
				if(locate(/obj/items/autograph) in usr || M.squest == 1)
					M.loc=locate(13,127,3)
					M << "<B>You enter 'Mr. Satan's Gym'."
				else if(M.throwed )
					M.Die(M.throwedb)
					M.throwed = 0
					M.throwedb = null
				else
					M << "<B>You can't enter, you do not have the autograph!"
			else
				del(M)
				return
	gymleave
		name = "Door"
		icon = 'icons/door.dmi'
		icon_state = ""
		layer = 9
		//Click()
		Entered(var/mob/M)
			//var/mob/M = usr
			if(ismob(M))
				M.loc=locate(53,86,6)
				M << "<B>You leave 'Mr. Satan's Gym'."
			else
				del(M)
				return

	gymleave2
		name = "Door"
		icon = 'icons/door.dmi'
		icon_state = ""
		layer = 9
		//Click()
		Entered(var/mob/M)
			//var/mob/M = usr
			if(ismob(M))
				M.loc=locate(54,86,6)
				M << "<B>You leave 'Mr. Satan's Gym'."
			else
				del(M)
				return




	plough
		name="Dragonball Online"
		icon = 'icons/turfs.dmi'
		icon_state = "dirt"
		Click()
			if(src in oview(0))
				if(usr.ktrain >= 2)
					alert("There is no need to Plough the field.")
					return
				else
					usr.plough = rand(1,5)
					if(usr.plough == 5)
						usr.field += 1
						usr << "You plow the field!"
						new /turf/ploughed(src)
					if(usr.field > 31)
						alert("Master Roshi: You have completed ploughing the field! Come talk to me for your next phase of training.")
						usr.ktrain = 2
			else
				usr << "<B>You need to be on the dirt to plough it!"
	ploughed
		name= "Dragonball Online"
		icon = 'icons/ploughed.dmi'
		icon_state = "ploughed"
		New()
			. = ..()
			spawn(150)
				new /turf/plough(src)

	debries
		name= "Dragonball Online"
		icon = 'icons/ploughed.dmi'
		icon_state = "ploughed"

	gravityenter
		icon = 'icons/turfs.dmi'
		icon_state = "gravityenter"
		Click()
			var/mob/M = usr
			if(ismob(M))
				switch(alert("Would you like to enter the Gravity Training Room? (You need 3000 Zenni to enter)","Gravity Training Room","Yes", "No"))
					if("Yes")
						if(M.zenni < 3000)
							alert("You do not have enough Zenni.")
						if(M.zenni >= 3000&&M.throwc != 1)
							if(M.dead )
								M.loc = locate(121,44,3)
								alert("You can't enter since you are dead.")
							else
								M.ccuse = 1
								M.itinvis = 1
								M.icon_state = ""
								M.density = 1
								M.zenni -= 3000
								alert("You enter the Gravity Training Room.")
								M.loc=locate(117,44,3)
								sleep(rand(6000,18000))
								if(!M) return
								if(!M.dead)
									M.loc=locate(M.hx, M.hy, M.hz)
									M.icon_state = ""
									M.move = 1
									M.ccuse = 0
									M.itinvis = 0
									M.grav = 0
									alert("Your time is up, and you are teleported back to your hometown.")
								else
									M.loc = locate(52,9,3)
									M.icon_state = ""
									M.move = 1
									M.ccuse = 0
									M.itinvis = 0
									alert("Your time is up, and you are teleported back to Yemma.")
			else
				del(M)
				return ..()

	gravityexit
		icon = 'icons/turfs.dmi'
		icon_state = "gravityenter"
		Click()
			var/mob/M = usr
			if(ismob(M))
				switch(alert("Are you sure you want to leave?","Gravity Training Room","Yes", "No"))
					if("Yes")
						if(M.dead != 1)
							M.loc=locate(M.hx, M.hy, M.hz)
							M.icon_state = ""
							M.move = 1
							M.itinvis = 0
							M.ccuse = 0
							alert("Your time is up, and you are teleported back to your hometown.")
						if(M.dead )
							M.loc = locate(52,9,3)
							M.icon_state = ""
							M.move = 1
							M.grav = 0
							M.ccuse = 0
							M.itinvis = 0
							alert("Your time is up, and you are teleported back to Yemma.")
					if("No")
						..()
			else
				del(M)
				return
	boulder
		name="Dragonball Online"
		icon = 'icons/boulder.dmi'
		icon_state = "boulder"
		density= 1
		Click()
			if(src in oview(1))
				if(usr.boulder )
					alert("There is no need to push the boulder.")
				else
					usr.random = rand(1,10)
					if(usr.random == 10)
						usr.boulder = 1
						alert("You have complete the Turtle Hermit training. Come to me to learn some techniques.")
					else
						usr << "<B>You have failed to push the Boulder."
			else
				usr << "<B>You need to be closer!"

	webesaiba
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,150,9)
			else
				del(M)

	weentsaiba
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,1,1)
			else
				del(M)
	entcellm
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,79,18)
			else
				del(M)
	extcellm
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(M.x,1,13)
			else
				del(M)

	cclogo
		icon = 'icons/cclogo.dmi'
		density = 0

	ccgrav
		icon = 'icons/gravity.dmi'
		density = 1

turf/logs
	icon = 'icons/logs.dmi'
	icon_state = "firewood"
	density = 1
	layer = 2

turf/kameflowers
	icon = 'icons/flowerbed.dmi'
	icon_state = "flower bed"
	density = 1
	layer = 2
	ki = 12
	gatherable = 1

obj/nrock
	icon = 'icons/nrock.png'
	icon_state = ""
	density = 1

turf/bed1
	icon = 'icons/bed.dmi'
	icon_state = "1"
	density = 1
	layer = 2

turf/bed2
	icon = 'icons/bed.dmi'
	icon_state = "2"
	density = 1
	layer = 2

turf/barrel
	icon = 'icons/barrel.dmi'
	icon_state = ""
	density = 1
	layer = 2

turf/chair
	icon = 'icons/chair.dmi'
	icon_state = ""
	density = 0
	layer = 2

turf
	thougrav
		Entered(var/mob/M)
			if(ismob(M))
				if(M.skuse )
					if(M.stamina.value > 0)
						if(M.powerlevel.max_value >= 700000)
							M.random = rand(1,50)
							if(M.random == 29)
								M.powerlevel.max_value += (rand(1,100))

						if(M.powerlevel.max_value >= 300000&&M.powerlevel.max_value <= 1100000)
							M.random = rand(1,12)
							if(M.random == 1)
								M.powerlevel.value -= (rand(1,300))
							else if(M.random == 2)
								M.stamina.value -= (rand(0,1))
								M.powerlevel.value -= (rand(1,900))
							if(M.powerlevel.value > 0)
								M.powerlevel.max_value += (rand(0,200))
							else
								M.KO()
								view(M,6) << 'sounds/it.wav'
								M.loc=locate(16,82,3)
								M << "<b><FONT COLOR = GREEN>You are sent back to King Kai's because this gravity is too much."

						if(M.powerlevel.max_value < 300000 && M.powerlevel.max_value >= 110001)
							M.random = rand(1,12)
							if(M.random == 1)
								M.powerlevel.value -= (rand(1,5000))
							else if(M.random == 2)
								M.stamina.value -= (rand(0,3))
								M.powerlevel.value -= (rand(1,30000))
							if(M.powerlevel.value > 0)
								M.powerlevel.max_value += (rand(0,150))
							else
								view(M, 6) << 'sounds/it.wav'
								M.loc=locate(16,82,3)
								M << "<b><FONT COLOR = GREEN>You are sent back to King Kai's because this gravity is too much."
						if(M.powerlevel.max_value < 10000)
							M.random = rand(1,12)
							if(M.random == 1)
								M.stamina.value -= (rand(0,3))
								M.powerlevel.value -= (rand(1,50000))
							else if(M.random == 2)
								M.stamina.value -= (rand(0,3))
								M.powerlevel.value -= (rand(1,50000))
							if(M.powerlevel.value > 0)
								M.powerlevel.max_value += (rand(0,25))
							else
								view(M, 6) << 'sounds/it.wav'
								M.loc=locate(16,82,3)
								M << "<b><FONT COLOR = GREEN>You are sent back to King Kai's because this gravity is too much."
						return ..()
					else
						return ..()
				else
					return ..()
turf
	fivegrav
	tengrav
		Entered(mob/M)
			if(ismob(M))
				if(M.stamina.value > 0)
					if(M.powerlevel.max_value >= 16001)
						M.random = rand(1,50)
						if(M.random == 49)
							M << "<b><FONT COLOR = GREEN>You struggle a bit because of the gravity.."
							M.powerlevel.max_value += (rand(1,8))
						if(M.random == 50)
							M << "<b><FONT COLOR = GREEN>You walk on this planet without a problem."

					if(M.powerlevel.max_value >= 1500 && M.powerlevel.max_value <= 10000)
						M.random = rand(1,10)
						if(M.random == 2)
							M.stamina.value -= (rand(0,1))
						M.powerlevel.max_value += (rand(2,12))
						M.KO()
					if(M.powerlevel.max_value < 1500 && M.powerlevel.max_value >= 5000)
						M.random = rand(1,12)
						if(M.random == 2)
							M.stamina.value -= (rand(0,3))
						M.powerlevel.max_value += (rand(12,18))
						M.KO()
					if(M.powerlevel.max_value < 1500)
						M.random = rand(1,12)
						if(M.random == 1)
							M.stamina.value -= (rand(6,12))
						else if(M.random == 2)
							M.stamina.value -= (rand(0,3))
						M.powerlevel.max_value += (rand(14,22))
						M.KO()
					return ..()
				else
					return ..()

turf
	kaioenter
		icon = 'icons/turfs.dmi'
		icon_state = "gravityenter"
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(98,71,3)
			else
				del(M)
				return

turf
	kaioleave
		icon = 'icons/turfs.dmi'
		icon_state = "gravityenter"
		Entered(var/mob/M)
			if(ismob(M))
				M.loc=locate(11,87,3)
			else
				del(M)
				return

turf
	kamehouseleave
		icon = 'icons/door.dmi'
		icon_state = ""
		Entered(var/mob/M)
			if(M)
				M.loc=locate(130,131,9)
				M << "<B>You leave Master Roshi's house."
			else
				return

turf
	yardratturfs
		turf1
			icon = 'icons/yardratturfs.dmi'
			icon_state = "1"
			density = 1

		turf2
			icon = 'icons/yardratturfs.dmi'
			icon_state = "2"
			density = 0

		turf3
			icon = 'icons/yardratturfs.dmi'
			icon_state = "3"
			density = 1

turf
	arenaturfs
		turf1
			icon = 'icons/arenaturfs.dmi'
			icon_state = "1"
			density = 0
		turf2
			icon = 'icons/arenaturfs.dmi'
			icon_state = "2"
			density = 1
		turf3
			icon = 'icons/arenaturfs.dmi'
			icon_state = "3"
			density = 1
		turf4
			icon = 'icons/arenaturfs.dmi'
			icon_state = "4"
			density = 1
		turf5
			icon = 'icons/arenaturfs.dmi'
			icon_state = "5"
			density = 0
		turf6
			icon = 'icons/arenaturfs.dmi'
			icon_state = "6"
			density = 0
		turf7
			icon = 'icons/arenaturfs.dmi'
			icon_state = "7"
			density = 1
		turf8
			icon = 'icons/arenaturfs.dmi'
			icon_state = "8"
			density = 1
		turf9
			icon = 'icons/arenaturfs.dmi'
			icon_state = "9"
			density = 1
		turf10
			icon = 'icons/arenaturfs.dmi'
			icon_state = "10"
			density = 1
		turf11
			icon = 'icons/arenaturfs.dmi'
			icon_state = "11"
			density = 1
		turf12
			icon = 'icons/arenaturfs.dmi'
			icon_state = "12"
			density = 1
		turf13
			icon = 'icons/arenaturfs.dmi'
			icon_state = "13"
			density = 0
			layer = 9
		turf14
			icon = 'icons/arenaturfs.dmi'
			icon_state = "14"
			density = 1
		turf15
			icon = 'icons/arenaturfs.dmi'
			icon_state = "15"
			density = 0
			layer = 9
		turf16
			icon = 'icons/arenaturfs.dmi'
			icon_state = "16"
			density = 1
		turf17
			icon = 'icons/arenaturfs.dmi'
			icon_state = "17"
			density = 1
		turf18
			icon = 'icons/arenaturfs.dmi'
			icon_state = "18"
			density = 1
		turf19
			icon = 'icons/arenaturfs.dmi'
			icon_state = "19"
			density = 1
		turf20
			icon = 'icons/arenaturfs.dmi'
			icon_state = "20"
			density = 1
		turf21
			icon = 'icons/arenaturfs.dmi'
			icon_state = "21"
			density = 1
		turf22
			icon = 'icons/arenaturfs.dmi'
			icon_state = "22"
			density = 1
		turf23
			icon = 'icons/arenaturfs.dmi'
			icon_state = "23"
			density = 1

turf
	kamehouse
		house1
			icon = 'icons/kamehouse.dmi'
			icon_state = "1"
			density = 1
		house2
			icon = 'icons/kamehouse.dmi'
			icon_state = "2"
			density = 1
		house3
			icon = 'icons/kamehouse.dmi'
			icon_state = "3"
			density = 1
		house4
			icon = 'icons/kamehouse.dmi'
			icon_state = "4"
			density = 1
		house5
			icon = 'icons/kamehouse.dmi'
			icon_state = "5"
			density = 1
		house6
			icon = 'icons/kamehouse.dmi'
			icon_state = "6"
			density = 1
		house7
			icon = 'icons/kamehouse.dmi'
			icon_state = "7"
			density = 1
		house8
			icon = 'icons/kamehouse.dmi'
			icon_state = "8"
			density = 1
		house9
			icon = 'icons/kamehouse.dmi'
			icon_state = "9"
			density = 1
		house10
			icon = 'icons/kamehouse.dmi'
			icon_state = "10"
			density = 0
		house11
			icon = 'icons/kamehouse.dmi'
			icon_state = "11"
			density = 0
			Entered(var/mob/M)
				if(ismob(M))
					M.loc=locate(9,134,8)
					M << "<B>You enter Master Roshi's house."
				else
					del(M)
					return
		house12
			icon = 'icons/kamehouse.dmi'
			icon_state = "12"
			density = 1

turf
	gokuhouse
		name = "Goku's House"
		house1
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse1"
			density = 1
		house2
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse2"
			density = 1
		house3
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse3"
			density = 1
		house4
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse4"
			density = 1
		house5
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse5"
			density = 1
		house6
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse6"
			density = 1
		house7
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse7"
			density = 1
		house8
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse8"
			density = 1
		house9
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse9"
			density = 1
		house10
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse10"
			density = 1
		house11
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse11"
			density = 1
		house12
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse12"
			density = 1
		house13
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse13"
			density = 1
		house14
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse14"
			density = 1
		house15
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse15"
			density = 1
		house16
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse16"
			density = 1
		house17
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse17"
			density = 1
		house18
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse18"
			density = 1
		house19
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse19"
			density = 1
		house20
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse20"
			density = 1
		house21
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse21"
			density = 1
		house22
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse22"
			density = 1
		house23
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse23"
			density = 1
		house24
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse24"
			density = 1
		house25
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse25"
			density = 1
		house26
			icon = 'icons/gokuhouse.dmi'
			icon_state = "gokuhouse26"
			density = 1
turf
	kingkai
		name = "King Kai's House"
		test1
			icon = 'icons/kingkai.dmi'
			icon_state = "1"
			density = 1
		test2
			icon = 'icons/kingkai.dmi'
			icon_state = "2"
			density = 1
		test3
			icon = 'icons/kingkai.dmi'
			icon_state = "3"
			density = 1
		test4
			icon = 'icons/kingkai.dmi'
			icon_state = "4"
			density = 1
		test5
			icon = 'icons/kingkai.dmi'
			icon_state = "5"
			density = 1
		test6
			icon = 'icons/kingkai.dmi'
			icon_state = "6"
			density = 1
		test7
			icon = 'icons/kingkai.dmi'
			icon_state = "7"
			density = 1
		test8
			icon = 'icons/kingkai.dmi'
			icon_state = "8"
			density = 1
		test9
			icon = 'icons/kingkai.dmi'
			icon_state = "9"
			density = 1
		test10
			icon = 'icons/kingkai.dmi'
			icon_state = "10"
			density = 1
		test11
			icon = 'icons/kingkai.dmi'
			icon_state = "11"
			density = 1
		test12
			icon = 'icons/kingkai.dmi'
			icon_state = "12"
			density = 1
		test13
			icon = 'icons/kingkai.dmi'
			icon_state = "13"
			density = 1
		test14
			icon = 'icons/kingkai.dmi'
			icon_state = "14"
			density = 1
		test15
			icon = 'icons/kingkai.dmi'
			icon_state = "15"
			density = 1
		test16
			icon = 'icons/kingkai.dmi'
			icon_state = "16"
			density = 1
		test17
			icon = 'icons/kingkai.dmi'
			icon_state = "17"
			density = 1
		test18
			icon = 'icons/kingkai.dmi'
			icon_state = "18"
			density = 1
		test19
			icon = 'icons/kingkai.dmi'
			icon_state = "19"
			density = 1
		test20
			icon = 'icons/kingkai.dmi'
			icon_state = "20"
			density = 0
			Entered(atom/movable/O)
				if(istype(O,/mob/training/bubbles))
					src << "Abandoning King Kai house entrance."
				else
					if(istype(O,/mob/training/gregory))
						src << "Abandoning King Kai house entrance."
					else
						if(ismob(O))
							O.loc=locate(98,67,3)
						else
							del(O)
							return
		test21
			icon = 'icons/kingkai.dmi'
			icon_state = "21"
			density = 0
			Entered(atom/movable/O)
				if(istype(O,/mob/training/bubbles))
					src << "Abandoning King Kai house entrance."
				else
					if(istype(O,/mob/training/gregory))
						src << "Abandoning King Kai house entrance."
					else
						if(ismob(O))
							O.loc=locate(98,67,3)
						else
							del(O)
							return
		test22
			icon = 'icons/kingkai.dmi'
			icon_state = "22"
			density = 1
		test23
			icon = 'icons/kingkai.dmi'
			icon_state = "23"
			density = 1

turf
	HBTC
		hbtcfloor
			icon = 'icons/turfs.dmi'
			icon_state = "hbtcfloor"
			density = 0

		arch1
			icon = 'icons/turfs.dmi'
			icon_state = "arch1"
			density = 1

		arch2
			icon = 'icons/turfs.dmi'
			icon_state = "arch2"

		hbtcent
			icon = 'icons/turfs.dmi'
			icon_state = "hbtcent"
			density = 0
			Entered(var/mob/M)
				if(ismob(M))
					if(M.powerlevel.max_value < 130000)
						alert("You can't enter the 'Hyperbolic Time Chamber', you aren't strong enough")
					else if(M.throwc )
						alert("You can not enter because you are going to throw someone but did not do already")
					else if(M.throwed )
						M.Die(M.throwedb)
						M.throwed = 0
						M.throwedb = null
					else
						M.loc=locate(65,66,10)
						M.itinvis = 1
						M.hbtcuse = 1
				else
					del(M)
					return


		hbtcleav
			icon = 'icons/turfs.dmi'
			icon_state = "hbtcent"
			density = 0
			Entered(var/mob/M)
				if(ismob(M))
					M.loc=locate(126,113,3)
					M.itinvis = 0
					M.hbtcuse = 0
				else
					del(M)
					return

turf
	milgrav
		Entered(var/mob/M)
			if(ismob(M))
				if(M.hbtcuse &&M.stamina.value > 0)
					M.random = rand(1,50)
					if(M.random == 49)
						M << "<b><FONT COLOR = GREEN>You struggle a bit because of the gravity.."
						M.powerlevel.max_value += 56
						M.ki.max_value += 53
					else if(M.random == 50)
						M << "<b><FONT COLOR = GREEN>You walk in this area without a problem."
					if(M.powerlevel.max_value >= 250000 && M.powerlevel.max_value <= 400000)
						M.random = rand(1,12)
						M.stamina.value -= (rand(0,1))
						if(M.random == 2)
							M.stamina.value -= (rand(0,2))
						M.powerlevel.max_value += 88
						M.ki.max_value += 89
						M.KO()
					if(M.powerlevel.max_value >= 175000 && M.powerlevel.max_value <= 250000)
						M.random = rand(1,12)
						M.stamina.value -= (rand(0,3))
						if(M.random == 2)
							M.stamina.value -= (rand(0,5))
						M.powerlevel.max_value += (rand(11,62))
						M.ki.max_value += (rand(4,14))
						M.KO()
					if(M.powerlevel.max_value < 175000)
						M.random = rand(1,12)
						M.stamina.value -= (rand(1,10))
						if(M.random == 1)
							M.stamina.value -= (rand(6,12))
						else if(M.random == 2)
							M.stamina.value -= (rand(0,5))
						M.powerlevel.max_value += (rand(112,276))
						M.ki.max_value += (rand(42,58))
						M.KO()
					return ..()
				else
					return ..()
			else
				return ..()

turf
	title
		icon = 'icons/title.png'
		density = 1

obj
	name = "Dragonball Online"
	bench
		benchm
			icon = 'icons/bench.dmi'
			icon_state = ""
			density = 1

		benchl
			icon = 'icons/bench.dmi'
			icon_state = "l"
			density = 1

		benchr
			icon = 'icons/bench.dmi'
			icon_state = "r"
			density = 1

turf
	name = "Dragonball Online"
	fence1
		icon = 'icons/fence.dmi'
		icon_state = "1"
		density = 1
	fence2
		icon = 'icons/fence.dmi'
		icon_state = "2"
		density = 1
	fence3
		icon = 'icons/fence.dmi'
		icon_state = "3"
		density = 1
	fence4
		icon = 'icons/fence.dmi'
		icon_state = "4"
		density = 1
	fence5
		icon = 'icons/fence.dmi'
		icon_state = "5"
		density = 1
	fence6
		icon = 'icons/fence.dmi'
		icon_state = "6"
		density = 1
	fence7
		icon = 'icons/fence.dmi'
		icon_state = "7"
		density = 1
	fence8
		icon = 'icons/fence.dmi'
		icon_state = "8"
		density = 1
	fence9
		icon = 'icons/fence.dmi'
		icon_state = "9"
		density = 1
	fence10
		icon = 'icons/fence.dmi'
		icon_state = "10"
		density = 1
	fence11
		icon = 'icons/fence.dmi'
		icon_state = "11"
		density = 1
	fence12
		icon = 'icons/fence.dmi'
		icon_state = "12"
		density = 1

turf
	farmsign1
		name = "Sign"
		icon = 'icons/sign.dmi'
		icon_state = ""
		density = 1
		Entered(var/mob/M)
			if(ismob(M))
				alert("The sign reads, Please leave this area to new players to train, thank you! - Vakir")
			else
				del(M)
				return
turf
	batcave1
		icon = 'icons/turfs.dmi'
		icon_state = "cliffopening"
		density = 0
		Entered(var/mob/M)
			if(ismob(M))
				M.loc = locate(21,115, 20)
				M << "<B>You enter the cave."
			else
				del(M)
				return
turf
	lbatcave1
		icon = 'icons/turfs.dmi'
		icon_state = "grass"
		density = 0
		Entered(var/mob/M)
			if(ismob(M))
				M.loc = locate(13,62,1)
				M << "<B>You leave the cave."
			else
				del(M)
				return

turf
	PO
		icon = 'PO.dmi'

	helldoorr
		layer = 9
		density = 0
		Enter(var/mob/M)
			if(ismob(M))
				if(usr.key == "Synx"||"Mercia"||"Chibi Gokou"||"Clifor"||"<font color=#ffffff>A</font><font color=#fffffe>z</font><font color=#fffffb>u</font><font color=#fffff9>m</font><font color=#fffff7>a</font><font color=#fffff5> </font><font color=#fffff2>N</font><font color=#fffff0>i</font><font color=#f0f0e3>n</font><font color=#e0e0d5>j</font><font color=#d0d0c7>a</font><font color=#c0c0b9> </font><font color=#b0b0aa>C</font><font color=#a0a09c>l</font><font color=#90908e>a</font><font color=#808080>n</font>"||"Arnelius")
					usr << "<B>You've Enter The Shadow Kingdom"
					usr.loc=locate(13,122,24)
					usr.itinvis = 1
				else if(usr.throwed == 1)
					usr.powerlevel.value = 0
					usr.Die(usr.throwedb)
					usr.throwed = 0
					usr.throwedb = null
			else
				del(M)
				return ..()
	helldoorl
		layer = 9
		density = 0
		Enter(var/mob/M)
			if(ismob(M))
				usr << "<B>Do not seek to follow in the footsteps of the wise.Seek what they sought."
				if(usr.dead ==1)
					usr.loc=locate(52,10,3)
				if(usr.dead !=1)
					usr.loc=locate(46,52,6)
				usr.itinvis = 0
			else
				del(M)
				return ..()

	clifdoorent
		layer = 9
		density = 0
		Enter(var/mob/M)
			if(ismob(M))
				if(usr.key == "Clifor"||"Arnelius"||"Synx")
					usr << "<B>Welcome Home"
					usr.loc=locate(128,132,24)
					usr.itinvis = 1
				else if(usr.throwed == 1)
					usr.powerlevel.value = 0
					usr.Die(usr.throwedb)
					usr.throwed = 0
					usr.throwedb = null
			else
				del(M)
				return ..()
	clifdoorl
		layer = 9
		density = 0
		Enter(var/mob/M)
			if(ismob(M))
				usr << "<B>Come Back soon."
				if(usr.dead ==1)
					usr.loc=locate(52,10,3)
				if(usr.dead !=1)
					usr.loc=locate(57,52,6)
				usr.itinvis = 0
			else
				del(M)
				return ..()