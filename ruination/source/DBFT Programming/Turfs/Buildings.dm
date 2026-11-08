turf
	var
		dbable=0
obj
	var
		invenable=0
turf/hbtc
	icon = 'hbtc.dmi'
	hbtc1
		icon_state="hbtc1"
	hbtc2
		icon_state="hbtc2"
	hbtc3
		icon_state="hbtc3"

turf/Buildings
	icon = 'Buildings.dmi'
	Door
		density = 1
		icon_state = "2-1"
	NamekHouse1
		icon_state="n1"
		density=1
	NamekHouse2
		icon_state="n2"
		density=1
	NamekHouse3
		icon_state="n3"
		density=1
	NamekHouse4
		icon_state="n4"
		density=1
	lHouse1
		icon_state="p1"
		density=1
	lHouse2
		icon_state="p2"
		density=0
		layer = 5
	lHouse3
		icon_state="p3"
		density=0
		layer = 5
	Roof
		icon_state = "roof"
		density = 1
	//	Enter()
	//		return
	Roof2
		icon_state = "roof2"
		density = 1
//		Enter()
///			return
	Roof3
		icon_state = "roof3"
		density = 1
//		Enter()
//			return
	Gold_Roof
		icon_state = "gold roof"
		density = 1
//		Enter()
//			return
	Wall
		density = 1
		icon_state = "wall"
	CC_Logo_1
		icon_state = "1"
		density = 1
	CC_Logo_2
		icon_state = "2"
		density = 1
	CC_Logo_3
		icon_state = "3"
		density = 1
	CC_Logo_4
		icon_state = "4"
		density = 1
	CC_Logo_5
		icon_state = "5"
		density = 1
	CC_Logo_6
		icon_state = "6"
		density = 1
	CC_Logo_7
		icon_state = "7"
		density = 1
	CC_Logo_8
		icon_state = "8"
		density = 1
	CC_Logo_9
		icon_state = "9"
		density = 1
	Stairs_Down
		icon_state = "stairs down"
	Stairs_Up
		icon_state = "stairs up"
	Window
		density = 1
		icon_state = "border"
	Wall2
		density = 1
		icon_state = "wall2"
	Wall3
		density = 1
		icon_state = "wall3"
	Wall4
		density=1
		icon_state="wall4"
	Floor4
		icon_state = "floor4"
	WallGH
		density = 1
		icon_state = "wall"
	Stairs
		icon_state = "stairs up"
	SignShop
		icon_state="sshop"
		density=1
	SignBank
		icon_state="sbank"
		density=1
	SignGym
		icon_state="sgym"
		density=1
	SignBarber
		icon_state="sbarber"
		density=1
mob
    see_invisible = 0
obj
	proc
		SpawnIt(var/T as num)
			sleep(T)
			src.hp=src.hpmax
			src.destroyed=0
			src.density=src.olddense
			src.invisibility=src.oldinvis
			src.icon_state=copytext(src.icon_state,2)
		DestroyIt()
			if(!grass_damage)return
			if(!src.destroyable)return FALSE
			if(src.destroyed)return FALSE
			if(src.hp<=0)
				src.hp=0
				src.olddense=src.density
				src.oldinvis=src.invisibility
				src.destroyed=1
				src.density=0
				src.invisibility=0
				src.icon_state="d[src.icon_state]"
				spawn(0)src.SpawnIt(500)
				return FALSE
			else
				return TRUE

	var
		oldinvis=0
		olddense=0
		hp=150000000
		hpmax=150000000
		destroyable=0
		destroyed=0
turf
	Buildings
		icon = 'Buildings.dmi'
		CC_Logo
			icon_state = "cc logo"
		WallD
			icon_state = "wall"
			density = 1

		Wall2D
			icon_state = "wall2"
			density = 1

		Wall3D
			icon_state = "wall4"
			density = 1

		RoofD
			icon_state = "roof"
			layer = 50

		Roof2D
			icon_state = "roof2"
			layer = 50

		Roof3D
			icon_state = "roof3"
			layer = 50

		Roof
			icon_state = "roof"
			invisibility = 1
			layer = 50

		Roof2
			icon_state = "roof2"
		//	invisibility = 1
			//layer = 50

		Roof3
			icon_state = "roof3"
			invisibility = 1
			layer = 50

area
	mouse_opacity=0
	outside
	inside
	Horde_Point
	BANK_SECURITYRUSH
		Entered(mob/PC/P)
			for(var/mob/SPECIAL/BankSecurity/M in view(P))
				if(M.sleeping)
					//world << "<b>AREA [M] woke up by [P]  [M.name]"
					M.sleeping = 0
					if(!M) return
				//	M.AITarget = src.Shooter
//					//world << "AREA WORKS"
					spawn(-1) M.AIBank()
			sleep(1)
//	EXPLODING_SAIBARUSH
//		Entered(mob/PC/P)
//			for(var/mob/Monster/ExplosiveMobs/M in oview(22))
//				if(M.sleeping)
//					//world << "<b>AREA [M] woke up by [P]  [M.name]"
//					M.sleeping = 0
//					if(!M) return
//				//	M.AITarget = src.Shooter
/////					//world << "AREA WORKS"
	//				world << "entered exploding saibarush"
	//		//		M.AITarget = src  // added this line
	//				spawn(-1) M.AI_Explode()
	//		sleep(1)
	NO_monster
		Enter(mob/M)
			if(istype(M,/mob/Monster))
				return 0
			else
				return ..()
	NOFLY

		Enter(mob/PC/M)
			if(istype(M,/mob/PC))
				if(M.buku)
					return 0
				else
					return 1
			else
				return 1
	house
		Entered(mob/PC/M)
			if(ismob(M))
				M.see_invisible = 0
		Exited(mob/PC/M)
			if(ismob(M))
				M.see_invisible = 1


	No_Pass
		density = 1
		Enter(mob/PC/M)
			if(istype(M,/mob/PC))
				//M.powerlevel=0
				//M.DeathCheck()
				//M<<"Wrong Turn, be careful of entering the void zone, its a dangerous place to go"
				return
			else
				return

	No_Pass_Arena
		density = 1
		Enter(mob/PC/M)
			if(istype(M,/mob/PC))
				if(M.challenge)
				//M.powerlevel=0
				//M.DeathCheck()
				//M<<"Wrong Turn, be careful of entering the void zone, its a dangerous place to go"
					return 0
				else
					return 1
			else
				return 1



turf
	Cliffs
		icon = 'Cliffs.dmi'
		density = 0
		CliffCave
			icon_state = "cave"
		CliffT
			icon_state = "t"
			density=1
		CliffTL
			icon_state = "tl"
			density=1
		CliffTR
			icon_state = "tr"
			density=1
		CliffC
			icon_state = "c"
			dbable=1
		CliffCL
			icon_state = "cl"
			density=1
		CliffCR
			icon_state = "cr"
			density=1
		CliffB
			icon_state = "b"
			density=1
		CliffBL
			icon_state = "bl"
			density=1
		CliffBR
			icon_state = "br"
			density=1
		Cliff1
			icon_state = "cliff"
			density=1
		Cliff2
			icon_state = "cliffb"
			density=1
		CliffBL2
			icon_state = "bl2"
			density=1
		CliffBR2
			icon_state = "br2"
			density=1
		IceCliffs
			icon = 'Ice Cliffs.dmi'
			IceCliffCave
				icon_state = "cave"
			IceCliffT
				icon_state = "t"
			IceCliffTL
				icon_state = "tl"
			IceCliffTR
				icon_state = "tr"
			IceCliffC
				icon_state = "c"
				dbable=1
			IceCliffCL
				icon_state = "cl"
				density=1
			IceCliffCR
				icon_state = "cr"
				density=1
			IceCliffB
				icon_state = "b"
			IceCliffBL
				icon_state = "bl"
			IceCliffBR
				icon_state = "br"
			IceCliff1
				icon_state = "cliff"
				density=1
			IceCliff2
				icon_state = "cliffb"
				density=1
			IceCliffBL2
				icon_state = "bl2"
			IceCliffBR2
				icon_state = "br2"
		YardratCliffs
			icon = 'Yardrat Turfs.dmi'
			density=1
			dbable=1
			YardratCliff1
				icon_state = "c1"
			YardratCliff2
				icon_state = "c2"
			YardratCliff3
				icon_state = "c3"
			YardratCliff4
				icon_state = "c4"
			YardratCliff5
				icon_state = "c5"
			YardratCliff6
				icon_state = "c6"
			YardratCliff7
				icon_state = "c7"
			YardratCliff8
				icon_state = "c8"
			YardratCliff9
				icon_state = "c9"
			YardratCliff10
				icon_state = "c10"
			YardratCliff11
				icon_state = "c11"
				dbable=0
			YardratCliff12
				icon_state = "c12"
			YardratCliff13
				icon_state = "c13"
			YardratCliff14
				icon_state = "c14"

	Buildings
		Destroyed
			icon = 'Destroyed Floor.dmi'
			Wall1
				density = 1
				icon_state = "w1"
			Wall2
				density = 1
				icon_state = "w2"
			Wall3
				density = 1
				icon_state = "w3"
			Wall4
				density = 1
				icon_state = "w4"
			Floor1
				icon_state = "1"
				dbable=1
			Floor2
				icon_state = "2"
				dbable=1
			Floor3
				icon_state = "3"
				dbable=1
			Floor4
				icon_state = "4"
				dbable=1
			Floor5
				icon_state = "5"
				dbable=1
			Floor6
				icon_state = "6"
				dbable=1
			Floor7
				icon_state = "7"
				dbable=1
			Floor8
				icon_state = "8"
				dbable=1
			Floor9
				icon_state = "9"
				dbable=1
			Floor10
				icon_state = "10"
				dbable=1
			Floor11
				icon_state = "11"
				dbable=1
			Floor12
				icon_state = "12"
				dbable=1
			Floor13
				icon_state = "13"
				dbable=1
			Floor14
				icon_state = "14"
				dbable=1
			Floor15
				icon_state = "15"
				dbable=1
			Floor16
				icon_state = "16"
				dbable=1
			Floor17
				icon_state = "17"
				dbable=1
obj
	Buildings
		icon = 'Buildings.dmi'
		Door1
			density = 1
			icon_state = "1-1"
			var/open = 0
			layer = 5
			proc
				OpenDoor()
					if(!src.open)
						src.icon_state = "1-2"
						src.density = 0
						sleep(30)
						src.icon_state = "1-1"
						src.density = 1
			Bumped()
				src.OpenDoor()
			Enter()
				if(!src.open)
					return
		Door2
			density = 1
			icon_state = "2-1"
			var/open = 0
			layer = 5
			proc
				OpenDoor()
					if(!src.open)
						src.icon_state = "2-2"
						src.density = 0
						sleep(30)
						src.icon_state = "2-1"
						src.density = 1
			Bumped()
				src.OpenDoor()
			Enter()
				if(!src.open)
					return
		Door3
			icon_state = "2-2"
		Door4
			density = 1
			icon_state = "gold"
turf
	Floors
		icon = 'Floors.dmi'
		name = ""
		Only_Fly
			Enter(var/mob/M)
				if(istype(M,/mob/PC))
					if(M.buku)
						..()
					else
						return
				else
					return
		No_Looking
			density=1
			opacity=1
		No_Zanzo
		BudokaiWatch
		Floor_HBTC
			icon_state = "HBTC"
			density = 0
		Floor_1_1
			icon_state = "floor 1-1"
			dbable=1
			density=0
		Floor_1_2
			icon_state = "floor 1-2"
			dbable=1
		Floor_1_3
			icon_state = "floor 1-3"
			dbable=1
		Floor_1_4
			icon_state = "floor 1-4"
			dbable=1
		Floor_1_5
			icon_state = "floor 1-5"
			dbable=1
		Floor_1_6
			icon_state = "floor 1-6"
			dbable=1
		Floor_1_7
			icon_state = "wooden 1"
			dbable=1
		Floor_1_8
			icon_state = "floor 1-7"
			dbable=1
		Gold_Wood
			icon_state = "gold wood"
			dbable=1
		Gold_Tile
			icon_state = "gold tile"
			dbable=1
		Gravity_Floor
			icon_state = "floor 1-5"
			density = 0
			/*
			Entered(mob/M)
				if(istype(M,/mob/PC))
					for(var/obj/Gravity_Room/Gravity_Control/C in oview(12))
						if(C.gravon)
							if(!M.dead)
								M.powerlevel -= 75*C.grav
								M.GRAVITYDeath()
								var/bonus_exp = 0.1+(C.grav/1000)
								M.exp += bonus_exp
								if(M.expbuff)M.exp+=bonus_exp
								M.Level_Up()
								*/
		No_Walking
			density = 1
			Enter()
				return
		Void_Zone
			density = 1
			opacity = 1
//			icon = 'Floors.dmi'
//			icon_state = "void"
//			invisibility = 101

			Enter(mob/PC/M)
				if(istype(M,/mob/PC))
				//	if(M.in_hbtc||M.in_herculegym)

					//M.powerlevel=0
					//M.DeathCheck()
				//		player<<"<font size = 2><b><font color = red>[M] was in the void!"
				//		M.loc=locate(58,379,1)
				//		M.in_hbtc = 0
				//		M.in_herculegym = 0
					return
			//		else
			//			return


		Sidewalk_1_1
			icon_state = "1"
			dbable=1
		Sidewalk_1_2
			icon_state = "2"
			dbable=1
		Sidewalk_1_3
			icon_state = "3"
			dbable=1
		Sidewalk_1_4
			icon_state = "4"
			dbable=1
		Sidewalk_1_5
			icon_state = "5"
			dbable=1
		Sidewalk_1_6
			icon_state = "6"
			dbable=1
		Sidewalk_1_7
			icon_state = "7"
			dbable=1
		Sidewalk_1_8
			icon_state = "8"
			dbable=1
		Stairs
			icon_state = "stairs"
		Safe_Zone
			Entered(obj/O)
				if(istype(O,/obj))
					O.power=0.1
					O.range=999
		BudokaiZone
		Craters
			Crater_1
				icon_state = "crater top 1"
			Crater_2
				icon_state = "crater top 2"
			Crater_3
				icon_state = "crater top 3"
			Crater_4
				icon_state = "crater middle 1"
			Crater_5
				icon_state = "crater middle 2"
			Crater_6
				icon_state = "crater middle 3"
			Crater_7
				icon_state = "crater bottom 1"
			Crater_8
				icon_state = "crater bottom 2"
			Crater_9
				icon_state = "crater bottom 3"
			Crater_Small
				icon_state = "small crater"
		Koed
			Yamcha
			icon = 'Yamcha ssg.dmi'
			icon_state = "koed"
			density = 1
obj/techs/Overlays/CraterTrail
	icon = 'Floors.dmi'
	icon_state = "trail"
	layer=MOB_LAYER-1
	New()
		spawn(200)del(src)
obj/techs/Overlays/CraterTrailH
	icon = 'Floors.dmi'
	icon_state = "trailend"
	layer=MOB_LAYER-1
	New()
		spawn(200)del(src)
obj/techs/Overlays/Crater_Center
	icon = 'Floors.dmi'
	icon_state = "crater middle 2"
	layer=MOB_LAYER-1
	New()
		src.overlays += new/obj/techs/Overlays/Crater_Top_Right
		src.overlays += new/obj/techs/Overlays/Crater_Top_Center
		src.overlays += new/obj/techs/Overlays/Crater_Top_Left
		src.overlays += new/obj/techs/Overlays/Crater_Middle_Left
		src.overlays += new/obj/techs/Overlays/Crater_Middle_Right
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Right
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Left
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Center
		spawn(100)del(src)
obj/techs/Overlays/Crater_Top_Right
	icon = 'Floors.dmi'
	icon_state = "crater top 3"
	layer=MOB_LAYER-1
	New()
		pixel_y = 32
		pixel_x = 32
obj/techs/Overlays/Crater_Top_Center
	icon = 'Floors.dmi'
	icon_state = "crater top 2"
	layer=MOB_LAYER-1
	New()
		pixel_y = 32
		pixel_x = 0
obj/techs/Overlays/Crater_Top_Left
	icon = 'Floors.dmi'
	icon_state = "crater top 1"
	layer=MOB_LAYER-1
	New()
		pixel_y = 32
		pixel_x = -32
obj/techs/Overlays/Crater_Middle_Left
	icon = 'Floors.dmi'
	icon_state = "crater middle 1"
	layer=MOB_LAYER-1
	New()
		pixel_x = -32
obj/techs/Overlays/Crater_Middle_Right
	icon = 'Floors.dmi'
	icon_state = "crater middle 3"
	layer=MOB_LAYER-1
	New()
		pixel_x = 32
obj/techs/Overlays/Crater_Bottom_Right
	icon = 'Floors.dmi'
	icon_state = "crater bottom 3"
	layer=MOB_LAYER-1
	New()
		pixel_x = 32
		pixel_y = -32
obj/techs/Overlays/Crater_Bottom_Left
	icon = 'Floors.dmi'
	icon_state = "crater bottom 1"
	layer=MOB_LAYER-1
	New()
		pixel_x = -32
		pixel_y = -32
obj/techs/Overlays/Crater_Bottom_Center
	icon = 'Floors.dmi'
	icon_state = "crater bottom 2"
	layer=MOB_LAYER-1
	New()
		pixel_y = -32
obj/techs/Overlays/Crater_Small
	icon = 'Floors.dmi'
	icon_state = "small crater"
	layer=MOB_LAYER-1
	New()
		pixel_y = -8
		spawn(100)del(src)


obj/Props/Furnature
	icon = 'Furnature.dmi'
	name = ""
	MetalDesk1
		icon_state="metaldesk1"
		density=1
	MetalDesk2
		icon_state="metaldesk2"
		density=1
	Computer1
		icon_state="computer1"
		density=1
	Computer2
		icon_state="computer2"
		density=1
	Shelf_1_1
		icon_state = "shelf 1-1"
		density = 1
	Shelf_1_2
		icon_state = "shelf 1-2"
	Shelf_2_1
		icon_state = "shelf 2-1"
		density = 1
	Shelf_2_2
		icon_state = "shelf 2-2"
	Shelf_3_1
		icon_state = "shelf 3-1"
		density = 1
	Shelf_3_2
		icon_state = "shelf 3-2"
	Shelf_4_1
		icon_state = "shelf 4-1"
		density = 1
	Shelf_4_2
		icon_state = "shelf 4-2"
	Desk_1_1
		icon_state = "desk 1-1"
		name="Desk Left End"
		density = 1
		value=1000000
	Desk_1_2
		icon_state = "desk 1-2"
		density = 1
		name="Desk Horizontal"
		value=1000000
	Desk_1_3
		icon_state = "desk 1-3"
		density = 1
		name="Desk Right End"
		value=1000000
	Desk_2_1
		icon_state = "desk 2-1"
		density = 1
		name="Desk Top End"
		value=1000000
	Desk_2_2
		icon_state = "desk 2-2"
		density = 1
		name="Desk Vertical"
		value=1000000
	Desk_2_3
		icon_state = "desk 2-3"
		density = 1
		name="Desk Bottom End"
		value=1000000
	Stool
		icon_state = "stool"
		name="Stool"
		value=500000
	Table
		icon_state = "table"
		density = 1
		name="Square Table"
		value=500000
	Pot
		icon_state = "pot"
		density = 1
	Barrel
		icon_state = "barrel"
		density = 1
	GDesk_1_1
		icon_state = "desk 1-1"
		name="Desk Left End"
		density = 1
		invenable=1
		value=1000000
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GDesk_1_2
		icon_state = "desk 1-2"
		density = 1
		name="Desk Horizontal"
		value=1000000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GDesk_1_3
		icon_state = "desk 1-3"
		density = 1
		name="Desk Right End"
		value=1000000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GDesk_2_1
		icon_state = "desk 2-1"
		density = 1
		name="Desk Top End"
		value=1000000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GDesk_2_2
		icon_state = "desk 2-2"
		density = 1
		name="Desk Vertical"
		value=1000000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GDesk_2_3
		icon_state = "desk 2-3"
		density = 1
		name="Desk Bottom End"
		value=1000000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GStool
		icon_state = "stool"
		name="Stool"
		value=500000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
	GTable
		icon_state = "table"
		density = 1
		name="Square Table"
		value=500000
		invenable=1
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(T.density)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(12,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
turf/OrangeHouse
	icon = 'OH.png'
	density=1

turf/PlanetVegetaB
	icon = 'PlanetVegetaBuilding.dmi'
	PVegetaB_000
		icon_state = "01"
		dbable=1
	PVegetaB_001
		icon_state = "1"
		density = 1
	PVegetab_002
		icon_state = "2"
		density = 1
	PVegetab_003
		icon_state = "3"
		density = 1
	PVegetab_004
		icon_state = "4"
		density = 1
	PVegetab_005
		icon_state = "04"
		density = 1
	PVegetab_006
		icon_state = "05"
		density = 1
	PVegetab_007
		icon_state = "5"
		density = 1
	PVegetab_008
		icon_state = "6"
		density = 1
	PVegetab_009
		icon_state = "7"
		density = 1
	PVegetab_010
		icon_state = "8"
		density = 1
	PVegetab_011
		icon_state = "08"
		density = 1
	PVegetab_012
		icon_state = "9"
		density = 1
	PVegetab_013
		icon_state = "10"
		density = 1
	PVegetab_014
		icon_state = "11"
		density = 1
	PVegetab_015
		icon_state = "12"
		density = 1
	PVegetab_016
		icon_state = "013"
		density = 1
	PVegetab_017
		icon_state = "13"
		density = 1
	PVegetab_018
		icon_state = "14"
		density = 1
	PVegetab_019
		icon_state = "15"
		density = 1
	PVegetab_020
		icon_state = "16"
		density = 1
	PVegetab_021
		icon_state = "016"
		density = 1
	PVegetab_022
		icon_state = "17"
		density = 1
	PVegetab_023
		icon_state = "18"
		density = 1
	PVegetab_024
		icon_state = "19"
		density = 1
	PVegetab_025
		icon_state = "20"
		density = 1
	PVegetab_026
		icon_state = "21"
		density = 1
	PVegetab_027
		icon_state = "22"
		density = 1
	PVegetab_028
		icon_state = "23"
		density = 1
	PVegetab_029
		icon_state = "24"
		density = 1
	PVegetab_030
		icon_state = "25"
		density = 1
	PVegetab_031
		icon_state = "26"
		density = 1
	PVegetab_032
		icon_state = "27"
		density = 1
	PVegetab_033
		icon_state = "28"
		density = 1
	PVegetab_034
		icon_state = "29"
		density = 1
	PVegetab_035
		icon_state = "30"
		density = 1
	PVegetab_036
		icon_state = "31"
		density = 1
	PVegetab_037
		icon_state = "32"
		density = 1
	PVegetab_038
		icon_state = "DOOR"
		density = 0
	PVegetab_039
		icon_state = "door2"
		density = 0
	PVegetab_040
		icon_state = "32"
		density = 1
	PVegetab_ROOF
		icon_state = "ROOF"
		density = 1
	PVegetab_ROOFTOP
		icon_state = "ROOFTOP"
		density = 1
	PVegetab_9SOLID
		icon_state = "9SOLID"
		density = 1
	PVegetab_10SOLID
		icon_state = "10SOLID"
		density = 1
	PVegetab_12SOLID
		icon_state = "12SOLID"
		density = 1
	PVegetab_013SOLID
		icon_state = "013SOLID"
		density = 1
	PVegetab_13SOLID
		icon_state = "13SOLID"
		density = 1
	PVegetab_14SOLID
		icon_state = "14SOLID"
		density = 1
	PVegetab_16SOLID
		icon_state = "16SOLID"
		density = 1
	PVegetab_016SOLID
		icon_state = "016SOLID"
		density = 1
	PVegetab_17SOLID
		icon_state = "17SOLID"
		density = 1
	PVegetab_20SOLID
		icon_state = "20SOLID"
		density = 1
	PVegetab_21SOLID
		icon_state = "21SOLID"
		density = 1
	PVegetab_23SOLID
		icon_state = "23SOLID"
		density = 1

	PVegetab_22SOLID
		icon_state = "23SOLID"
		density = 1

	PVegetab_24SOLID
		icon_state = "24SOLID"
		density = 1