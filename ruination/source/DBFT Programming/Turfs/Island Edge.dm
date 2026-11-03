turf/Earth
	icon = 'Island_Edge.dmi'
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		dbable=1
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_0111
		icon_state = "0111"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	Island_Edge_019
		icon_state = "019"
		density = 1
	goodwater
		icon = 'water4.dmi'
		//icon_state = "goodwater"
		density = 1
		Enter(atom/movable/A)
			..()
			if(istype(A,/obj/blasts))
				var/trg
				var/mob/T=locate(/mob) in get_step(A,A.dir)
				if(T)
					trg = T
				if(trg)
					A:dmg(trg,A:Shooter,A)

				return 1
			if(istype(A,/mob) && !A.density)
				return 1
			if(istype(A,/mob) && A.density)
				return 0
	//		if(istype(A,/obj/blasts))
	//			return 1

			//	world << "[src]"
			//	if(istype(loc, /turf/Grass))
		//		var/turf/T=src.loc
		//		for(var/mob/M in T)
		//			A.Bump(M)
	//			return 1
			if(istype(A,/obj/Tech))
				return 1
			return 1
//		Entered(atom/movable/A)
//			..()
//			var/chkmob = ismob(src.loc)
//			if(chkmob&&istype(A,/obj/blasts))
//				//chkmob:dmg(chkmob,A:Shooter,A)
//				world << "T"
//				A.Bump(chkmob)
		//	if(istype(A,/obj/blasts)&&istype(B,/mob))
		//		A.Bump(B)

/*
	goodwater
		icon = 'water4.dmi'
		//icon_state = "goodwater"
		density = 0
		Enter(atom/movable/A)
	//		if(istype(A,/obj/blasts))
	//			return 1
			..()
	//		if(istype(A,/mob)&&A.buku) return ..()
			//if(istype(A,/mob)&&!A.density) return..()
			//if(!A.density || istype(A,/obj/blasts)||istype(A,/obj/blasts/trails/)) return ..()
			//if(istype(A,/obj/blasts)||istype(A,/obj/blasts/trails/)) return ..()
			if(istype(A,/mob) && !A.density)
				return 1
			if(istype(A,/mob) && A.density)
				return 0
	//		if(istype(A,/obj/blasts))
			//	world << "[src]"
			//	if(istype(loc, /turf/Grass))
		//		var/turf/T=src.loc
		//		for(var/mob/M in T)
		//			A.Bump(M)
	//			return 1
			if(istype(A,/obj/Tech))
				return 1
			return 1*/


	Overlay2
		icon_state = "Overlay2"
		density = 0
	Grass_Edge_1
		name = ""
		icon_state = "grass edge 1"
	Grass_Edge_2
		name = ""
		icon_state = "grass edge 2"
	Grass_Edge_3
		name = ""
		icon_state = "grass edge 3"
	Grass_Edge_4
		name = ""
		icon_state = "grass edge 4"
	Grass_Edge_5
		name = ""
		icon_state = "edge5"
	Grass_Edge_6
		name = ""
		icon_state = "edge4"
	Grass_Edge_7
		name = ""
		icon_state = "edge3"
	Grass_Edge_8
		name = ""
		icon_state = "edge2"
	Spike
		name = "spike"
		icon_state = "spike"
		density = 1
	Rock
		name = ""
		icon_state = "rock"
	Dead_Grass
		name = ""
		icon_state = "dead"
		dbable=1
	Water_Fall
		name = ""
		layer = 50
		icon_state = "wover"
	Water_Fall_Namek
		name = ""
		layer = 50
		icon_state = "wover2"

turf/Trees
	icon = 'Trees.dmi'
	PalmTree1
		icon_state = "palm tree 1"
		layer = 5
	PalmTree2
		icon_state = "palm tree 2"
		layer = 5
	PalmTree3
		icon_state = "palm tree 3"
		layer = 5
	PalmTree4
		icon_state = "palm tree 4"
		layer = 5
	PalmTree5
		icon_state = "palm tree 5"
		layer = 5
	PalmTree6
		icon_state = "palm tree 6"
		layer = 5
	PalmTree7
		icon_state = "palm tree 7"
	PalmTree8
		icon_state = "palm tree 8"
	Tree1
		icon='Tree.dmi'
		icon_state="1"
		density=1
/*		New()
			..()
			src.overlays+=new/obj/Tree/Tree2
			src.overlays+=new/obj/Tree/Tree3
			src.overlays+=new/obj/Tree/Tree4
			src.overlays+=new/obj/Tree/Tree5
			src.overlays+=new/obj/Tree/Tree6*/
	OakTree1
		name = "Oak Tree"
		icon_state = "oak tree 1"
		density = 0
		layer = 5

	OakTree2
		name = "Oak Tree"
		icon_state = "oak tree 2"
		density = 0
		layer = 5

	OakTree3
		name = "Oak Tree"
		icon_state = "oak tree 3"
		density = 0
		layer = 5

	OakTree4
		name = "Oak Tree"
		icon_state = "oak tree 4"
		density = 0
		layer = 5

	OakTree5
		name = "Oak Tree"
		icon_state = "oak tree 5"
		density = 1

	OakTree6
		name = "Oak Tree"
		icon_state = "oak tree 6"
		density = 1

	Bush
		name = "Bush"
		icon_state = "bush"
		density = 1

	Flower
		name = "Flower"
		icon_state = "flower"
		density = 0

	Flower2
		name = "Flower2"
		icon_state = "flower2"
		density = 0

	Sky_1_1
		name = "Sky"
		icon_state = "sky 1-1"
		density = 1

	Sky_1_2
		name = "Sky"
		icon_state = "sky 1-2"
		density = 1

	Sky_1_3
		name = "Sky"
		icon_state = "sky 1-3"
		density = 1

	Sky_1_4
		name = "Sky"
		icon_state = "sky 1-4"
		density = 1

	Sky_1_5
		name = "Sky"
		icon_state = "sky 1-5"
		density = 1

	Sky_1_6
		name = "Sky"
		icon_state = "sky 1-6"
		density = 1

	Sky_2_1
		name = "Sky"
		icon_state = "sky 2-1"
		density = 1

	Sky_2_2
		name = "Sky"
		icon_state = "sky 2-2"
		density = 1

	Sky_2_3
		name = "Sky"
		icon_state = "sky 2-3"
		density = 1

	Sky_2_4
		name = "Sky"
		icon_state = "sky 2-4"
		density = 1

	Sky_2_5
		name = "Sky"
		icon_state = "sky 2-5"
		density = 1

	Sky_2_6
		name = "Sky"
		icon_state = "sky 2-6"
		density = 1

	Sky_2_7
		name = "Sky"
		icon_state = "sky 2-7"
		density = 1
obj/Tree
	Tree2
		icon='Tree.dmi'
		icon_state="2"
		density=1
		pixel_x=32
	Tree3
		icon='Tree.dmi'
		icon_state="3"
		layer=50
		pixel_y=32
	Tree4
		icon='Tree.dmi'
		icon_state="4"
		layer=50
		pixel_x=32
		pixel_y=32
	Tree5
		icon='Tree.dmi'
		icon_state="5"
		layer=50
		pixel_y=64
	Tree6
		icon='Tree.dmi'
		icon_state="6"
		layer=50
		pixel_x=32
		pixel_y=64
turf/Namek
	icon = 'Namek Island Edge.dmi'
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		dbable=1
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	Island_Edge_019
		icon_state = "019"
		density = 0
		Enter(atom/movable/A)
			if(istype(A,/mob) && !A.density)
				return 1
			if(istype(A,/mob) && A.density)
				return 0
			if(istype(A,/obj/blasts))
				return 1
	Grass_Edge_1
		icon_state = "grass edge 1"
	Grass_Edge_2
		icon_state = "grass edge 2"
	Grass_Edge_3
		icon_state = "grass edge 3"
	Grass_Edge_4
		icon_state = "grass edge 4"
	Namek_Tree_1
		icon_state = "namek tree 1"
		layer = 10
	Namek_Tree_2
		icon_state = "namek tree 2"
		layer = 10
	Namek_Tree_3
		icon_state = "namek tree 3"
		layer = 10
	Namek_Tree_4
		icon_state = "namek tree 4"
		density = 1
turf/Namek_New
	icon = 'namek new icon.dmi'
	Left_Edge
		icon_state="left"
	Right_Edge
		icon_state="right"
	Top_Edge
		icon_state="top"
	Bottom_Edge
		icon_state="bottom"
	Top_Left_Edge
		icon_state="topleft"
	Bot_Right_Edge
		icon_state="botright"
	Top_Right_Edge
		icon_state="topright"
	Bot_Left_Edge
		icon_state="botleft"
turf/Yardrat
	icon = 'Yardrat Turfs.dmi'
	Island_Edge_000
		icon_state = "grass"
		dbable=1
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		density = 1
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	yardratturf1
		icon_state = "019"
		density = 1
	Island_Edge_019
		icon_state = "water"
		density = 1
turf/NewYardrat
	icon = 'Yardrat.dmi'
	Yardrat_Water
		icon = 'TurfsZeta.dmi'
		icon_state = "water"
		density = 1
	//	icon_state = "water"
	//	density=1
	Yardrat_Grass_1
		icon_state = "grass a"
	Yardrat_Grass_2
		icon_state = "grass b"
	Yardrat_Grass_3
		icon_state = "grass c"
	Yardrat_Grass_4
		icon_state = "grass d"
	Yardrat_Grass_5
		icon_state = "grass"
	Left_Edge
		icon_state = "left"
		density = 1
	Right_Edge
		icon_state = "right"
		density = 1
	Bot_Edge
		icon_state = "bot"
		density = 1
	Top_Edge
		icon_state = "top"
		density = 1
turf/Yardrat_GH
	icon='Yardrat GuildHouse.dmi'
turf/PlanetVegeta
	icon = 'PlanetVegeta.dmi'
	PVegeta_000
		icon_state = "grass"
		dbable=1
	PVegeta_001
		icon_state = "water"
		density = 1
	PVegeta_002
		icon_state = "002"
		density = 1
	PVegeta_003
		icon_state = "003"
		density = 1
	PVegeta_004
		icon_state = "004"
		density = 1
	PVegeta_005
		icon_state = "005"
		density = 1
	PVegeta_006
		icon_state = "006"
		density = 1
	PVegeta_007
		icon_state = "007"
		density = 1
	PVegeta_008
		icon_state = "008"
		density = 1
	PVegeta_009
		icon_state = "009"
		density = 1
	PVegeta_010
		icon_state = "010"
		density = 1
	PVegeta_011
		icon_state = "011"
		density = 1
	PVegeta_012
		icon_state = "012"
		density = 1
	PVegeta_013
		icon_state = "013"
		density = 1
	PVegeta_014
		icon_state = "014"
		density = 1
	PVegeta_015
		icon_state = "015"
		density = 1
	PVegeta_016
		icon_state = "016"
		density = 1
	PVegeta_017
		icon_state = "017"
		density = 1
	PVegeta_018
		icon_state = "018"
		density = 1
	PVegeta_019
		icon_state = "019"
		density = 1
	PVegeta_020
		icon_state = "020"
		density = 1
	PVegeta_021
		icon_state = "021"
		density = 1
	PVegeta_022
		icon_state = "022"
		density = 1
	PVegeta_023
		icon_state = "023"
		density = 1
	PVegeta_024
		icon_state = "024"
		density = 1
	PVegeta_025
		icon_state = "025"
		density = 1
	PVegeta_026
		icon_state = "026"
		density = 1
	Overlay
		icon_state = "Overlay"
		density = 0