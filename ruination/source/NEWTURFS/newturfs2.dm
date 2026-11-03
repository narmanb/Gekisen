turf/NEWTURFS2
	icon = 'turfs66.dmi'
	FLOORS
		floor1/icon_state = "floor"
		dirt/icon_state = "dirt"
		floor4/icon_state = "floor4"
		kkd/icon_state = "kkd"
		floor2/icon_state = "1"
		floor3/icon_state = "1234234"
		floor5/icon_state = "4444"
		floor6/icon_state = "4"
		floor7/icon_state = "5"
		floor8/icon_state = "10"
		floor9/icon_state = "11"
		coolfloor2/icon_state = "coolfloor2"
		floor10/icon_state = "13"
		floor11/icon_state = "16"
		floor12/icon_state = "f"
		floor13/icon_state = "s"
		floor14/icon_state = "floor3"
		floor15/icon_state = "floor2"
		coolfloor1/icon_state = "coolfloor1"
		demonsand/icon_state = "demonsand"
		sand/icon_state = "sand"
		grass/icon_state = "grass"
		water
			density = 1
			icon_state = "water"
		lava
			density = 1
			icon_state = "lava"
	WALLS
		density = 1
		wall/icon_state = "wall"
		wallblock/icon_state = "wallblock"
		citywall1/icon_state = "citywall1"
		WallSet1
			wallbottom/icon_state = "6"
			walltop/icon_state = "7"
			wallright/icon_state = "8"
			wallleft/icon_state = "9"
		coolwall1/icon_state = "coolwall1"

	OBJECTS
		density = 1
		chair/icon_state = "chair"
		door1/icon_state = "door1"
		garagedoor/icon_state = "garagedoor"
		closedS1/icon_state = "closedS1"
		TRAFFICLIGHT
			traff1/icon_state = "trf1"
			traff2
				icon_state = "trf2"
				density = 0
				layer = MOB_LAYER+1
		firehydrant/icon_state = "firehy"
		kkd/icon_state = "kkd"
		cokemachine/icon_state = "COKE"
		BENCH
			bench1/icon_state = "bench1"
			bench2/icon_state = "bench2"
		LIGHT
			light1/icon_state = "light1"
			light2
				density = 0
				icon_state = "light2"
				layer = MOB_LAYER+1
		trashcan/icon_state = "trash"
		NEWSTAND
			newstand1/icon_state = "newstand1"
			newstand2/icon_state = "newstand2"
		CARS
			GrayCar
				carfront/icon_state="carfront1"
				carback/icon_state="carback1"
			RedCar
				carfront/icon_state="carfront2"
				carback/icon_state="carback2"
			YellowCar
				carfront/icon_state="carfront3"
				carback/icon_state="carback3"
		books/icon_state="book1"
		well/icon_state="well"
		bush/icon_state = "bush"
		flower2/icon_state = "flower2"
		rocks1/icon_state = "rocks1"
		rocks2/icon_state = "rocks2"
		TREES
			Tree1
				treebotleft/icon_state = "treeleftbot1"
				treebotright/icon_state = "treerightbot1"
				treetopleft
					icon_state = "treelefttop1"
					layer = MOB_LAYER+1
					density = 0
				treetopright
					icon_state = "treerighttop1"
					layer = MOB_LAYER+1
					density = 0
			Tree2
				treebotleft/icon_state = "treeleftbot2"
				treebotright/icon_state = "treerightbot2"
				treetopleft
					icon_state = "treelefttop2"
					layer = MOB_LAYER+1
					density = 0
				treetopright
					icon_state = "treerighttop2"
					layer = MOB_LAYER+1
					density = 0







turf/NEWTURFS3
	Floors
		icon = 'SEREV.dmi'
		purplefloor/icon_state = "purplefloor"
		redstone/icon_state = "redstone"
		redcarpet/icon_state = "redcarpet"
		RedStairSet
			redstairs/icon_state = "redstairs"
			redstairsleft/icon_state = "redstairsleft"
			redstairsmid/icon_state = "redstairsmid"
			redstairsright/icon_state = "redstairsright"
		sandstonefloor/icon_state = "sandstonefloor"
		sandstonefloorornate/icon_state = "sandstonefloorornate"
		cobblefloor/icon_state = "cobblefloor"
		metalfloor/icon_state = "metalfloor"
		metalfloorpanel/icon_state = "metalfloorpanel"
		floorwires
			icon_state = "floorwires"
			density = 1
	WALLS
		icon = 'SEREVWALLS.dmi'
		density = 1
		brickwalltop/icon_state = "brickwalltop"
		roof1/icon_state = "roof1"
		metalwall/icon_state = "metalwall"
		woodwall/icon_state = "woodwall"
		woodwall2/icon_state = "woodwall2"
		woodroof/icon_state = "woodroof"
		blueroof/icon_state = "blueroof"
		grayroof/icon_state = "grayroof"
		greenroof/icon_state = "greenroof"
		redroof/icon_state = "redroof"


	FLOOR_WALL_SET2
		icon = 'Turfs 15.dmi'

		FLOORS
			floor6/icon_state = "floor6"
			floor7/icon_state = "floor7"
			floor8/icon_state = "floor8"
			floor5/icon_state = "floor5"
		WALLS
			density = 1
			wallz/icon_state = "wall2"
			roofz/icon_state = "roof3"


turf/ZETA

	MetalFence
		icon = 'TurfsZeta.dmi'
		fencing
			icon_state="fencing"

		fencing1
			icon_state="fencing1"

		fencing6
			icon_state="fencing6"

		fencing7
			icon_state="fencing7"

		fencing8
			icon_state="fencing8"
		Entered(mob/M)
			if(!istype(M,/mob/PC))
				return 0
			if(istype(M,/mob/PC))
				if(M.buku)..()
				else if(M.dir==EAST||M.dir==NORTHWEST||M.dir==NORTHEAST)
					M.frozen=1
					M.icon_state="meditate"
					M.x+=1
					M<<sound('jump.wav',channel=0)
					sleep(2)
					M.icon_state=""
					sleep(1)
					M.frozen=0
				else if(M.dir==WEST||M.dir==SOUTHWEST||M.dir==SOUTHEAST)
					M.frozen=1
					M.icon_state="meditate"
					M.x-=1
					M<<sound('jump.wav',channel=0)
					sleep(2)
					M.icon_state=""
					sleep(1)
					M.frozen=0
				else if(M.dir==NORTH||M.dir==NORTHWEST||M.dir==NORTHEAST)
					M.frozen=1
					M.icon_state="meditate"
					M.y+=1
					M<<sound('jump.wav',channel=0)
					sleep(2)
					M.icon_state=""
					sleep(1)
					M.frozen=0
				else if(M.dir==SOUTH||M.dir==SOUTHWEST||M.dir==SOUTHEAST)
					M.frozen=1
					M.icon_state="meditate"
					M.y-=1
					M<<sound('jump.wav',channel=0)
					sleep(2)
					M.icon_state=""
					sleep(1)
					M.frozen=0
			//else return
			else return

