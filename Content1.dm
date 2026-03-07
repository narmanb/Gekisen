obj
	var
		objo=1

	top
		icon = 'top.dmi'
		density = 0
		layer = MOB_LAYER+3
		pixel_y = 32
	topssj
		icon = 'topssj.dmi'
		density = 0
		layer = MOB_LAYER+3
		pixel_y = 32
	topbebi
		icon = 'topbebi.dmi'
		density = 0
		layer = MOB_LAYER+3
		pixel_y = 32
obj
	small3
		icon='small3.dmi'
	small2
		icon='small2.dmi'
obj
	offsets

		layer=MOB_LAYER
		offsetright10
			pixel_x=10
		offsetleft10
			pixel_x=-10
		offsetup10
			pixel_y=10
		offsetdown10
			pixel_y=-10
		offsetright32
			pixel_x=32
		offsetleft32
			pixel_x=-32
		offsetup32
			pixel_y=32
		offsetdown32
			pixel_y=-32


obj
	sbombprojectile
		name="Spirit Bomb"
		density=0
		icon='sbomb00.dmi'
		icon_state="big"
		layer=MOB_LAYER+10
		var/power = 500
		pixel_step_size=4
		New()
			src.overlays+=new/obj/sbombpro/s01
			src.overlays+=new/obj/sbombpro/s02
			src.overlays+=new/obj/sbombpro/s03
			src.overlays+=new/obj/sbombpro/s04
			src.overlays+=new/obj/sbombpro/s05
			src.overlays+=new/obj/sbombpro/s06
			src.overlays+=new/obj/sbombpro/s07
			src.overlays+=new/obj/sbombpro/s08

obj
	Chouproj
		name="Chou Kamehameha"
		density=0
		npc=4
		layer=MOB_LAYER+3
		pixel_step_size=4


obj
	Crater
		T1
			icon='0Crater2.dmi'
			pixel_x=-16
			pixel_y=16
			layer=3
		T2
			icon='0Crater3.dmi'
			pixel_x=16
			pixel_y=16
			layer=3
		B1
			icon='0Crater4.dmi'
			pixel_x=-16
			pixel_y=-16
			layer=3
		B2
			icon='0Crater5.dmi'
			pixel_x=16
			pixel_y=-16
			layer=3
obj
	Destructable
		name=""
		destructable=1
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
			density = 1
		tree4
			icon = 'turfs.dmi'
			icon_state = "tree4"
			density = 1
		treeb
			icon = 'turfs.dmi'
			icon_state = "treeb"
			density = 1
		tallnamektree1
			icon = 'turfs.dmi'
			icon_state = "tallnamektree1"
			density = 1
		tallnamektree2
			icon = 'turfs.dmi'
			icon_state = "tallnamektree2"
			density = 0
			layer = MOB_LAYER + 1
		earthhouse1
			icon = 'earthhouse.dmi'
			icon_state= "0,0"
			density = 1
		earthhouse4
			icon = 'earthhouse.dmi'
			icon_state= "0,1"
			density = 1
		earthhouse7
			icon = 'earthhouse.dmi'
			icon_state= "0,2"
			density = 1
		earthhouse2
			icon = 'earthhouse.dmi'
			icon_state= "1,0"
			density = 1
		earthhouse5
			icon = 'earthhouse.dmi'
			icon_state= "1,1"
			density = 1
		earthhouse8
			icon = 'earthhouse.dmi'
			icon_state= "1,2"
			density = 1
		earthhouse3
			icon = 'earthhouse.dmi'
			icon_state= "2,0"
			density = 1
		earthhouse6
			icon = 'earthhouse.dmi'
			icon_state= "2,1"
			density = 1
		earthhouse9
			icon = 'earthhouse.dmi'
			icon_state= "2,2"
			density = 1
turf

	glacier
		icon='glacier.dmi'
		gsnow
			icon_state="snow"
		g1
			icon_state="1"
		g2
			icon_state="2"
		g3
			icon_state="3"
		g4
			icon_state="4"
		g5
			icon_state="5"
		g6
			icon_state="6"
		g7
			icon_state="7"
		g8
			icon_state="8"
		g9
			icon_state="9"
		g10
			icon_state="10"
		g11
			icon_state="11"
		g12
			icon_state="12"
		g13
			icon_state="13"
		g14
			icon_state="14"
		g15
			icon_state="15"
		g16
			icon_state="16"
		g17
			icon_state="17"
		g18
			icon_state="18"
		g19
			icon_state="19"
		g20
			icon_state="20"
		g21
			icon_state="21"
		g22
			icon_state="22"
		g23
			icon_state="23"
		g24
			icon_state="24"
		g25
			icon_state="25"
		g26
			icon_state="26"
		g27
			icon_state="27"
		g28
			icon_state="28"
		g29
			icon_state="29"
		g30
			icon_state="30"
turf
	happygrass
		icon = 'happygrass.dmi'
		density=0
		hgrass
			icon_state=""
		hgrass_e
			icon_state="east"
		hgrass_w
			icon_state="west"
		hgrass_s
			icon_state="south"
		hgrass_n
			icon_state="north"
		hgrass_se
			icon_state="southeast"
		hgrass_nw
			icon_state="northwest"
		hgrass_sw
			icon_state="southwest"
		hgrass_ne
			icon_state="northeast"
turf
	guildroomblock3
		icon = 'turfs.dmi'
		icon_state = "door"
		density = 0
		Enter()
			if(istype(usr,/mob/characters))
				if(usr.key=="ZekeTZ" ||usr.key=="Masterdan"||usr.key=="Masterdan")
					usr<<"You may enter..."
					return 1
				else
					return 0
					usr<<"You cannot enter this room."
			else
				return 1
turf
	AMonsterBlocker
		density=0
		Enter()
			if(istype(usr,/mob/monsters))
				return 0
			else
				return 1
	Anewturfwarps
		entergym
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(13,201,1)
		entercheaphouse
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(9,189,1)
		enterdeluxhouse
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(8,173,1)
		entershop
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(130,72,22)
		leaveshop
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(52,182,1)
		leavegym
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(43,191,1)
		leavecheaphouse
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(45,182,1)
		leavedeluxhouse
			Enter()
				if(istype(usr,/mob/characters))
					usr.loc=locate(38,188,1)
	Anewturfseries
		bloodshack
			density=1
			icon='shack.dmi'
			s00
				icon_state="0,0"
			s01
				icon_state="0,1"
			s02
				icon_state="0,2"
			s03
				icon_state="0,3"
			s10
				icon_state="1,0"
			s11
				icon_state="1,1"
			s12
				icon_state="1,2"
			s13
				icon_state="1,3"
			s20
				icon_state="2,0"
			s21
				icon_state="2,1"
			s22
				icon_state="2,2"
			s23
				icon_state="2,3"

			s31
				icon_state="3,1"
			s32
				icon_state="3,2"


		cloud
			density=1
			icon='turfs.dmi'
			icon_state="newclouds"
		tower
			density=0
			icon='tower.dmi'
			layer=MOB_LAYER+5
		wake
			density=1
			icon='turfs.dmi'
			icon_state="wake"
		densityone
			density=1
		blockinvis
			density=1
			Enter()
				return 0
		capsulecorp
			icon='capsulecorp.dmi'
			density=1
		shopsigns
			icon='shopsigns.dmi'
			density=1
			one
				icon_state="1"
			two
				icon_state="2"
			three
				icon_state="4"
			four
				icon_state="3"
			five
				icon_state="5"
		frostgrass
			icon='newturfs.dmi'
			icon_state="frostgrass"
			density=0
		gokuhouse
			icon='gokuhouse.dmi'
			density=1
		rock
			icon='rock.dmi'
			density=1
		rock2
			icon='rock2.dmi'
			density=1
		crack
			icon='crack.dmi'
			density=1
		crack2
			icon='crack2.dmi'
			density=1
		crack3
			icon='crack3.dmi'
			density=1
		crack4
			icon='crack4.dmi'
			density=1
		platform
			icon='platform.dmi'
			density=1
		platform2
			icon='platform2.dmi'
			density=1
		gym
			icon='gym.dmi'
			density=1
		indoor
			buildingtop1
				icon='newturfs.dmi'
				icon_state="buildingtop1"
				density=1
			buildingtop2
				icon='newturfs.dmi'
				icon_state="buildingtop2"
				density=1
			buildingtop3
				icon='newturfs.dmi'
				icon_state="buildingtop3"
				density=1
			bed
				icon='bed.dmi'
				density=1
			bed2
				icon='bed2.dmi'
				density=1
			hardwood1
				icon='newturfs.dmi'
				icon_state="hardwood1"
				density=0
			hardwood2
				icon='newturfs.dmi'
				icon_state="hardwood2"
				density=0
			kitchen
				icon='kitchen.dmi'
				density=1
			tv
				icon='newturfs.dmi'
				icon_state="tv"
				density=1
			tvright
				icon='newturfs.dmi'
				icon_state="tvright"
				density=1
			tvleft
				icon='newturfs.dmi'
				icon_state="tvleft"
				density=1
			tvup
				icon='newturfs.dmi'
				icon_state="tvup"
				density=1
			couch1
				icon='newturfs.dmi'
				icon_state="couch1"
				density=1
			couch2
				icon='newturfs.dmi'
				icon_state="couch2"
				density=1
			couch3
				icon='newturfs.dmi'
				icon_state="couch3"
				density=1
			couch4
				icon='newturfs.dmi'
				icon_state="couch4"
				density=1
			couch5
				icon='newturfs.dmi'
				icon_state="couch5"
				density=1
			couch6
				icon='newturfs.dmi'
				icon_state="couch6"
				density=1
			couch7
				icon='newturfs.dmi'
				icon_state="couch7"
				density=1
			couch8
				icon='newturfs.dmi'
				icon_state="couch8"
				density=1
			couch9
				icon='newturfs.dmi'
				icon_state="couch9"
				density=1
			couch10
				icon='newturfs.dmi'
				icon_state="couch10"
				density=1
			couch11
				icon='newturfs.dmi'
				icon_state="couch11"
				density=1
			couch12
				icon='newturfs.dmi'
				icon_state="couch12"
				density=1
			couch13
				icon='newturfs.dmi'
				icon_state="couch13"
				density=1
			couch14
				icon='newturfs.dmi'
				icon_state="couch14"
				density=1
			couch15
				icon='newturfs.dmi'
				icon_state="couch15"
				density=1
			couch16
				icon='newturfs.dmi'
				icon_state="couch16"
				density=1
			drawer
				icon='drawer.dmi'
				density=1
			carpet
				icon='carpet.dmi'
				density=0
			books1
				icon='newturfs.dmi'
				icon_state="books1"
				density=1
			books2
				icon='newturfs.dmi'
				icon_state="books2"
				density=1
			housewall
				icon='newturfs.dmi'
				icon_state="housewall"
				density=1
			housewall2
				icon='newturfs.dmi'
				icon_state="housewall2"
				density=1
			housewall3
				icon='newturfs.dmi'
				icon_state="housewall3"
				density=1
			housewall4
				icon='newturfs.dmi'
				icon_state="housewall4"
				density=1
			window
				icon='newturfs.dmi'
				icon_state="window"
				density=1
			housewallbottom
				icon='newturfs.dmi'
				icon_state="housewallbottom"
				density=1
			housewalltop
				icon='newturfs.dmi'
				icon_state="housewalltop"
				density=1
			housewallright
				icon='newturfs.dmi'
				icon_state="housewallright"
				density=1
			housewallleft
				icon='newturfs.dmi'
				icon_state="housewallleft"
				density=1
		Cliff
			icon='newturfs.dmi'
			density=1
			Cliffgrass1
				icon_state="grasscliff1"
			Cliffgrass2
				icon_state="grasscliff2"
			Cliffgrass3
				icon_state="grasscliff3"
			Cliffgrass4
				icon_state="grasscliff4"
			Cliff1
				icon_state="cliff"
			Cliff2
				icon_state="cliff2"
			Cliff3
				icon_state="cliff3"
			Cliff4
				icon_state="cliff4"
			Cliff5
				icon_state="cliff5"
			Cliff6
				icon_state="cliff6"
			Cliff7
				icon_state="cliff7"
			Cliff8
				icon_state="cliff8"
			Cliff9
				icon_state="cliff9"
			Cliff10
				icon_state="cliff10"
			Cliff11
				icon_state="cliff11"
			Cliff12
				icon_state="cliff12"
			Cliff13
				icon_state="cliff13"
		Tree
			icon='tree.dmi'
			density=0
			layer=MOB_LAYER+1
		TreeUnder
			icon='tree.dmi'
			density=1
		BulmaHouse
			icon='bulmahouse.dmi'
			density=1
		House
			icon='house.dmi'
			density=1
		House2
			icon='house2.dmi'
			density=1
		House3
			icon='house3.dmi'
			density=1
		House4
			icon='house4.dmi'
			density=1
		House5
			icon='house5.dmi'
			density=1
		House6
			icon='house6.dmi'
			density=1
		Street
			icon='newturfs.dmi'
			density=0
			sidewalk
				icon_state="sidewalk"
			sidewalkleft
				icon_state="sidewalkleft"
			sidewalkright
				icon_state="sidewalkright"
			sidewalkup
				icon_state="sidewalkup"
			sidewalkdown
				icon_state="sidewalkdown"
			sidewalkcornerne
				icon_state="sidewalkcornerne"
			sidewalkcornernw
				icon_state="sidewalkcornernw"
			sidewalkcornerse
				icon_state="sidewalkcornerse"
			sidewalkcornersw
				icon_state="sidewalkcornersw"
			street
				icon_state="street"
			line
				icon_state="line"
			line2
				icon_state="line2"

		desert
			icon='newturfs.dmi'
			density=0
			icon_state="desert"
		Obuilding
			density=1
			Obuilding1
				icon='newturfs.dmi'
				icon_state="Obuilding1"
			Obuilding2
				icon='newturfs.dmi'
				icon_state="Obuilding2"
			Obuilding3
				icon='newturfs.dmi'
				icon_state="Obuilding3"
			Obuilding4
				icon='newturfs.dmi'
				icon_state="Obuilding4"
			Obuilding5
				icon='newturfs.dmi'
				icon_state="Obuilding5"
			Obuilding6
				icon='newturfs.dmi'
				icon_state="Obuilding6"
			Obuilding7
				icon='newturfs.dmi'
				icon_state="Obuilding7"
			Obuilding8
				icon='newturfs.dmi'
				icon_state="Obuilding8"
			Obuilding9
				icon='newturfs.dmi'
				icon_state="Obuilding9"
		Building
			density=1
			building0
				icon='newturfs.dmi'
				icon_state="building0"
			building01
				icon='newturfs.dmi'
				icon_state="building01"
			building02
				icon='newturfs.dmi'
				icon_state="building02"
			building1
				icon='newturfs.dmi'
				icon_state="building1"
			building2
				icon='newturfs.dmi'
				icon_state="building2"
			building3
				icon='newturfs.dmi'
				icon_state="building3"
			building4
				icon='newturfs.dmi'
				icon_state="building4"
			building5
				icon='newturfs.dmi'
				icon_state="building5"
			building6
				icon='newturfs.dmi'
				icon_state="building6"
			building7
				icon='newturfs.dmi'
				icon_state="building7"
			building8
				icon='newturfs.dmi'
				icon_state="building8"
			building9
				icon='newturfs.dmi'
				icon_state="building9"
			building10
				icon='newturfs.dmi'
				icon_state="building10"
			building11
				icon='newturfs.dmi'
				icon_state="building11"
			buildingtop1
				icon='newturfs.dmi'
				icon_state="buildingtop1"
			buildingtop2
				icon='newturfs.dmi'
				icon_state="buildingtop2"
			buildingtop3
				icon='newturfs.dmi'
				icon_state="buildingtop3"
			buildingtop4
				icon='newturfs.dmi'
				icon_state="buildingtop4"
			buildingtop5
				icon='newturfs.dmi'
				icon_state="buildingtop5"
			buildingtop6
				icon='newturfs.dmi'
				icon_state="buildingtop6"
			buildingtop8
				icon='newturfs.dmi'
				icon_state="buildingtop8"
			buildingtop9
				icon='newturfs.dmi'
				icon_state="buildingtop9"
			buildingtop10
				icon='newturfs.dmi'
				icon_state="buildingtop10"

turf
	colorblockborder
		icon='colorblockborder.dmi'
	White
		icon='white.dmi'
	zCustomattackCPL
		icon='Customcpl.png'
obj
	zStar
		starleft
			icon='Star.dmi'
			icon_state="1"
			density=0

		starmid
			density=0
			icon='Star.dmi'
			icon_state="2"
		starright
			density=0
			icon='Star.dmi'
			icon_state="3"
	zStaractivated
		starleft
			icon_state="1"
			density=0
			icon='Star2.dmi'
		starmid
			icon_state="2"
			density=0
			icon='Star2.dmi'
		starright
			icon_state="3"
			density=0
			icon='Star2.dmi'
turf
	ztypebeam
		icon='ztypebeam.dmi'
	ztypehoming
		icon='ztypehoming.dmi'
	ztypebomb
		icon='ztypebomb.dmi'
	ztypefist
		icon='ztypepunch.dmi'
obj
	BigCrater
		name=""
		density=0
		npc=2
		layer=3
		New()
			src.underlays+=new/obj/Crater/T1
			src.underlays+=new/obj/Crater/T2
			src.underlays+=new/obj/Crater/B1
			src.underlays+=new/obj/Crater/B2
			spawn(1200)
				del(src)
obj
	kiblob
		name=""
		density=0
		layer=3
		icon='kiblob.dmi'
obj
	choutrail
		name="Chou Kamehameha"
		density=0
		layer=MOB_LAYER+3
		npc=5
		pixel_step_size=4
		New()
			src.overlays+=new/obj/Choukamehameha/c11
			src.overlays+=new/obj/Choukamehameha/c12
obj
	choutrail2
		name="Chou Kamehameha"
		density=0
		layer=MOB_LAYER+3
		dir=8
		npc=5
		pixel_step_size=4
		New()
			src.overlays+=new/obj/Choukamehameha/c13
			src.overlays+=new/obj/Choukamehameha/c14
obj
	Choukamehameha
		c11
			icon='Choukamehameha.dmi'
			icon_state="1x1"
			pixel_x=-16
			pixel_y=0
			layer=MOB_LAYER+3
		c12
			icon='Choukamehameha.dmi'
			icon_state="1x2"
			pixel_x=16
			pixel_y=0
			layer=MOB_LAYER+3
		c13
			icon='Choukamehameha.dmi'
			icon_state="1x1"
			pixel_y=16
			pixel_x=0
			layer=MOB_LAYER+3
		c14
			icon='Choukamehameha.dmi'
			icon_state="1x2"
			pixel_y=-16
			pixel_x=0
			layer=MOB_LAYER+3
		c21
			icon='Choukamehameha.dmi'
			icon_state="2x1"
			pixel_x=-16
			pixel_y=0
			layer=MOB_LAYER+3
		c22
			icon='Choukamehameha.dmi'
			icon_state="2x2"
			pixel_x=16
			pixel_y=0
			layer=MOB_LAYER+3
		c31
			icon='Choukamehameha.dmi'
			icon_state="3x1"
			pixel_x=-16
			pixel_y=-32
			layer=MOB_LAYER+3
		c32
			icon='Choukamehameha.dmi'
			icon_state="3x2"
			pixel_x=16
			pixel_y=-32
			layer=MOB_LAYER+3
		c23
			icon='Choukamehameha.dmi'
			icon_state="2x1"
			pixel_y=-16
			pixel_x=0
			layer=MOB_LAYER+3
		c24
			icon='Choukamehameha.dmi'
			icon_state="2x2"
			pixel_y=16
			pixel_x=0
			layer=MOB_LAYER+3
		c33
			icon='Choukamehameha.dmi'
			icon_state="3x1"
			pixel_y=-16
			pixel_x=-32
			layer=MOB_LAYER+3
		c34
			icon='Choukamehameha.dmi'
			icon_state="3x2"
			pixel_y=16
			pixel_x=-32
			layer=MOB_LAYER+3
obj
	sbombpro
		s01
			icon='sbomb01.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=32
			layer=MOB_LAYER+6
		s02
			icon='sbomb02.dmi'
			icon_state="big"
			pixel_y=32
			layer=MOB_LAYER+6
		s03
			icon='sbomb03.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=32
			layer=MOB_LAYER+6
		s04
			icon='sbomb04.dmi'
			icon_state="big"
			pixel_x=-32
			layer=MOB_LAYER+10
		s05
			icon='sbomb05.dmi'
			icon_state="big"
			pixel_x=32
			layer=MOB_LAYER+10
		s06
			icon='sbomb06.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=-32
			layer=MOB_LAYER+10
		s07
			icon='sbomb07.dmi'
			icon_state="big"
			pixel_y=-32
			layer=MOB_LAYER+10
		s08
			icon='sbomb08.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=-32
			layer=MOB_LAYER+10


mob
	oozaru
		verb
			Turn_Oozaru()
				set name = "Oozaru Transform"
				set category = "Oozaru"
				if(usr.ozz==0&&usr.race=="Saiya-jin"||usr.ozz==0&&usr.race=="Halfbreed")
					if(usr.hasfused==0)
						usr.Go_Ozzura()
						usr.verbs-=/mob/oozaru/verb/Turn_Oozaru
						usr.verbs-=/mob/oozaru/verb/Turn_SSJ_Oozaru
			Turn_SSJ_Oozaru()
				set name = "Golden Oozaru Transform"
				set category = "Oozaru"
				if(usr.ozz==0&&usr.race=="Saiya-jin"||usr.ozz==0&&usr.race=="Halfbreed")
					if(usr.hasfused==0)
						usr.Go_ssjOzzura()
						if(src.maxpowerlevel>10000000 && src.gonessj4 == 0 && (src.race == "Saiya-jin"||src.race == "Halfbreed"))
							src.gonessj4 = 1
							src<<"The primal power of Oozaru is not foreign to you anymore, you feel as though you can awaken it without a full moon... Finally unlocked, the true ultimate form of a saiyajin: Super Saiyajin 4!!"
							src.transformations+=new/obj/Tran/SSJ4
						usr.verbs-=/mob/oozaru/verb/Turn_SSJ_Oozaru
						usr.verbs-=/mob/oozaru/verb/Turn_Oozaru
			Turn_Bebi_Oozaru()
				set name = "BebiOozaru Transform"
				set category = "Oozaru"
				if(usr.ozz==0&&usr.race=="Tsufuru-jin" && usr.evolution==3 && usr.hasfused==0)
					usr.Go_bebiOzzura()
					usr.verbs-=/mob/oozaru/verb/Turn_Bebi_Oozaru


mob
	proc
		Go_Ozzura()
			if(src.ozz==0&&src.race=="Saiya-jin"||src.ozz==0&&src.race=="Halfbreed")
				if(src.powerlevel>src.maxpowerlevel)
					src.powerlevel=src.maxpowerlevel
				oview(6)<<"<b>[src] begins to grow tremendously!"
				view(6)<<"<b>[src]: grows hair and becomes Oozaru"
				src.ozz = 1
				src.ssj=1
				src.powerlevel *= 5
			//	src.client.show_verb_panel=0
				var/list/temp[]=src.overlays
				src.ooverlays=temp.Copy(1,0)
				src.overlays=0
				src.icon='bottom.dmi'
				src.overlays += new/obj/top
				src.state = "Oozaru"
				sleep(3600)
			//	src.mooned=0
				src.verbs-=/mob/oozaru/verb/Turn_Oozaru
				src.revertoozara()
		Go_ssjOzzura()
			if(src.ozz==0&&src.race=="Saiya-jin"||src.ozz==0&&src.race=="Halfbreed")
				if(src.powerlevel>src.maxpowerlevel)
					src.powerlevel=src.maxpowerlevel
				oview(6)<<"<b>[src] begins to grow tremendously!"
				view(6)<<"<b>[src]: grows hair and becomes Oozaru"
				src.ozz = 1
				src.ssj=1
				var/list/temp[]=src.overlays
				src.ooverlays=temp.Copy(1,0)
				src.powerlevel *= 8
			//	src.client.show_verb_panel=0
				src.overlays=0
				src.icon='bottomssj.dmi'
				src.overlays += new/obj/topssj
				src.state = "Oozaru"
				sleep(3600)
			//	src.mooned=0
				src.verbs-=/mob/oozaru/verb/Turn_Oozaru
				src.verbs-=/mob/oozaru/verb/Turn_SSJ_Oozaru
				src.revertoozara()
		Go_bebiOzzura()
			if(src.ozz==0&&src.race=="Tsufuru-jin")
				if(src.powerlevel>src.maxpowerlevel)
					src.powerlevel=src.maxpowerlevel
				oview(6)<<"<b>[src] begins to grow tremendously!"
				view(6)<<"<b>[src]: grows hair and becomes Oozaru"
				src.ozz = 1
				src.ssj=1
				src.powerlevel *= 8
			//	src.client.show_verb_panel=0
				var/list/temp[]=src.overlays
				src.ooverlays=temp.Copy(1,0)
				src.overlays=0
				src.icon='bottombebidmi.dmi'
				src.overlays += new/obj/topbebi
				src.state = "Oozaru"
				sleep(3600)
			//	src.mooned=0
				src.verbs-=/mob/oozaru/verb/Turn_Bebi_Oozaru
				src.revertoozara()

mob
	proc
		revertoozara()
			if(src.ozz == 1 && src)
				src.overlays = 0
				if(src.skincolor=="black")
					src.icon='male-black.dmi'
				else if(src.skincolor=="darkbrown")
					src.icon='male-brown.dmi'
				else if(src.skincolor=="lightbrown")
					src.icon='male-lightbrown.dmi'
				else if(src.skincolor=="white")
					src.icon='male-white.dmi'
				else if(src.skincolor=="tan")
					src.icon='male.dmi'
				else if(src.skincolor=="fwhite")
					src.icon = 'female-pale.dmi'
				else if(src.skincolor=="ftan")
					src.icon = 'female.dmi'
				else if(src.skincolor=="flightbrown")
					src.icon = 'female-lightbrown.dmi'
				else if(src.skincolor=="fdarkbrown")
					src.icon = 'female-darkbrown.dmi'
				else if(src.skincolor=="fblack")
					src.icon = 'female-black.dmi'
				else
					src.icon='male.dmi'
				if(src.ooverlays)src.overlays=src.ooverlays.Copy(1,0)
				src.ooverlays=0
				src.ozz = 0
				src.ssj=0
				if(src.powerlevel>src.maxpowerlevel)
					src.powerlevel=src.maxpowerlevel
				src.state = "Normal"
			else
				if(src.ozz ==1)
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.ozz=0





	ozzy
		icon = 'bottom.dmi'
		density = 1
		New()
			src.overlays += new/obj/top
