obj
	CP
		name="Control pad"
		icon='PillarTS.dmi'
		icon_state=""
		Click()
			if(src in view(1))
				for(var/Z in GuildMasters)
					if(Z == src)
						switch(input("What do you wish to do?","Control pad")in list("Add","Remove","Cancel"))
							if("Add")
								var/M=input("Who?","Character selector") as mob in world
								GuildNames.Add(M)
							if("Remove")
								var/X=input("Who?","Character selector") in GuildNames
								GuildNames.Remove(X)
							if("Cancel")
								return
					else
						src<<"\red Access denied!"
mob
	ZSmithSeller
		icon = 'smithy(1).dmi'
		icon_state = "seller"
		name = "Smith ShopKeeper1"
		npc = 1
mob/TS
	ZSmithSeller2
		icon = 'smithy(1).dmi'
		icon_state = "seller2"
		name = "Smith ShopKeeper2"
		npc = 1
	ZSmithapprentice
		icon = 'smithy(1).dmi'
		icon_state = "smith2"
		name = "Smith Apprentice"
		npc = 1
	ZSmithMaster
		icon = 'smithy(1).dmi'
		icon_state = "smith"
		name = "Smith Master"
		npc = 1

	ZFishermanf
		icon = 'zboat.dmi'
		icon_state = "f"
		name = "Fisherman1"
		npc = 1

	ZFishermanb
		icon = 'zboat.dmi'
		icon_state = "b"
		name = "Fisherman2"
		npc = 1

	ZSushiGirl1
		icon = 'fish stuff.dmi'
		icon_state = "woman 1"
		name = "Sushi Girl1"
		npc = 1

	ZSushiGirl2
		icon = 'fish stuff.dmi'
		icon_state = "woman 2"
		name = "Sushi Girl2"
		npc = 1

	ZFarmer
		icon = 'zboat.dmi'
		icon_state = "b1"
		name = "Farmer1"
		npc = 1

	ZFarmer2
		icon = 'zboat.dmi'
		icon_state = "f1"
		name = "Farmer2"
		npc = 1
turf/TS
	Bridge1
		icon = 'Bridge1.dmi'
		icon_state = "Bridge1"
		density = 0

	Bridge3
		icon = 'Bridge3.dmi'
		icon_state = "Bridge3"
		density = 0

	Bridge2
		icon = 'Bridge2.dmi'
		icon_state = "Bridge2"
		density = 1

	ZFloor
		icon = 'ZFloor.dmi'
		icon_state = "ZFloor"

	ZDoor
		icon = 'ZDoor.dmi'
		icon_state = "ZDoor"
		density = 1

	ZDoorL
		icon = 'ZDoorL.dmi'
		icon_state = "ZDoorL"
		density = 1

	ZDoorR
		icon = 'ZDoorR.dmi'
		icon_state = "ZDoorR"
		density = 1

	ZDoorOpen
		icon = 'ZDoorOpen.dmi'
		icon_state = "ZDoorOpen"
		layer=MOB_LAYER+3


	ZRoof
		icon = 'ZRoof.dmi'
		icon_state = "ZRoof"
		density = 1

	ZRoofL
		icon = 'ZRoofL.dmi'
		icon_state = "ZRoofL"
		density = 1

	ZRoofR
		icon = 'ZRoofR.dmi'
		icon_state = "ZRoofR"
		density = 1

	ZRoofM
		icon = 'ZRoofM.dmi'
		icon_state = "ZRoofM"
		density = 1

	ZWall
		icon = 'ZWall.dmi'
		icon_state = "ZWall"
		density = 1

	ZWallo
		icon = 'ZWall.dmi'
		icon_state = "ZWall"
		layer=MOB_LAYER+3


	ZWallL
		icon = 'ZWallL.dmi'
		icon_state = "ZWallL"
		density = 1

	ZWallR
		icon = 'ZWallR.dmi'
		icon_state = "ZWallR"
		density = 1

	ZRO
		icon = 'ZRoof.dmi'
		icon_state = "ZRoof"
		layer=MOB_LAYER+3


	Bridge1
		icon = 'Bridge1.dmi'
		icon_state = "Bridge1"

	ZR1
		icon = 'WRoof.dmi'
		icon_state = "WRoof"
		density = 1

	ZR2
		icon = 'WRoof2.dmi'
		icon_state = "WRoof2"
		density = 1

	ZRW
		icon = 'ZRW.dmi'
		icon_state = "ZRW"
		density = 1

	ZGate
		icon = 'ZG.dmi'
		icon_state = "ZG"
		density = 1

	ZGateb
		icon = 'ZGB.dmi'
		icon_state = "ZGB"
		density = 1

	ZGT
		icon = 'ZGT.dmi'
		icon_state = "ZGT"

	ZGT2
		icon = 'ZGT2.dmi'
		icon_state = "ZGT2"

	ZEIW
		icon = 'ZEIW.dmi'
		icon_state = "ZEIW"
		density = 1

	ZEIW2
		icon = 'ZEIW2.dmi'
		icon_state = "ZEIW2"
		density = 1

	ZER2
		icon = 'ZER2.dmi'
		icon_state = "ZER2"
		density = 1

	ZR4
		icon = 'ZR4.dmi'
		icon_state = "ZR4"
		density = 1

	ZEFL
		icon = 'ZEFL.dmi'
		icon_state = "ZEFL"

	ZEWO
		icon = 'ZEWO.dmi'
		icon_state = "ZEWO"
		density = 1

	ZR3
		icon = 'ZR3.dmi'
		icon_state = "ZR3"
		density = 1

	ZWE
		icon = 'ZWE.dmi'
		icon_state = "ZWE"
		density = 1

	ZR4O
		icon = 'ZR4.dmi'
		icon_state = "ZR4"
		layer=MOB_LAYER+3

	ZR10
		icon = 'WRoof.dmi'
		icon_state = "WRoof"
		layer=MOB_LAYER+1

	ZTreetop
		icon = 'ZTreet.dmi'
		icon_state = "ZTreet"
		layer=MOB_LAYER+1

	ZTreebottom
		icon = 'ZTreeb.dmi'
		icon_state = "ZTreeb"
		density = 1

	ZTreebottomh
		icon = 'ZTreeb.dmi'
		icon_state = "ZTreeb"
		density = 0
		layer=MOB_LAYER+1

	ZTreeSmall
		icon = 'ZTrees.dmi'
		icon_state = "ZTrees"
		density = 1

	Zwater
		icon = 'turfs.dmi'
		icon_state = "water"

	JLeft
		icon = 'jhouse20.dmi'
		icon_state = "sleft"
		density = 1

	JRight
		icon = 'jhouse20.dmi'
		icon_state = "sright"
		density = 1


	JFE
		icon = 'jhouse20.dmi'
		icon_state = "floor edge"
		density = 1

	JWall
		icon = 'jhouse20.dmi'
		icon_state = "wall"
		density = 1

	JRoof
		icon = 'jhouse20.dmi'
		icon_state = "roof"
		density = 1

	JFloor
		icon = 'jhouse20.dmi'
		icon_state = "floor"

	JSword2
		icon = 'jhouse20.dmi'
		icon_state = "sword"
		density = 0

	JWall2
		icon = 'jhouse20.dmi'
		icon_state = "wall3"
		density = 1

	JPicture
		icon = 'jhouse20.dmi'
		icon_state = "pic"
		density = 1

	JDesk
		icon = 'jhouse20.dmi'
		icon_state = "desk"
		density = 1

	JBook
		icon = 'jhouse20.dmi'
		icon_state = "book"
		density = 1

	JCandle
		icon = 'jhouse20.dmi'
		icon_state = "candle"
		density = 1


	JShelf
		icon = 'jhouse20.dmi'
		icon_state = "shelf"
		density = 1

	JScroll
		icon = 'jhouse20.dmi'
		icon_state = "scroll"
		density = 1


	JSign
		icon = 'jhouse20.dmi'
		icon_state = "sign"
		density = 1

	JTable
		icon = 'jhouse20.dmi'
		icon_state = "Table"
		density = 1


	JFood
		icon = 'jhouse20.dmi'
		icon_state = "food"
		density = 1

	JTableF
		icon = 'jhouse20.dmi'
		icon_state = "Tablefood"
		density = 1

	ZZRoof
		icon = 'ZzWR.dmi'
		icon_state = "roof"
		density = 1

	ZZWall
		icon = 'ZzWR.dmi'
		icon_state = "wall"
		density = 1

	JRoofO
		icon = 'jhouse20.dmi'
		icon_state = "roof"
		layer=MOB_LAYER+1

	ZZRoofO
		icon = 'ZzWR.dmi'
		icon_state = "roof"
		layer=MOB_LAYER+1

	ZRiceField1
		icon = 'crop stuff.dmi'
		icon_state = "l"

	ZRiceField2
		icon = 'crop stuff.dmi'
		icon_state = "m"

	ZRiceField3
		icon = 'crop stuff.dmi'
		icon_state = "r"

	ZRiceField4
		icon = 'crop stuff.dmi'
		icon_state = "t"

	ZWheat
		icon = 'crop stuff.dmi'
		icon_state = "plants"


	ZER2O
		icon = 'ZER2.dmi'
		icon_state = "ZER2"
		layer=MOB_LAYER+1

	ZWER
		icon = 'ZWER.dmi'
		icon_state = "ZWER"
		density = 1

	Zpillow
		icon = 'pillow.dmi'
		icon_state = "pillow"


	Zpillow2
		icon = 'pillow2.dmi'
		icon_state = "pillow2"

	JFood2
		icon = 'jhouse20.dmi'
		icon_state = "food2"
		density = 1

	Zpillow2t
		icon = 'pillow2.dmi'
		icon_state = "t"


	Zpillowt
		icon = 'pillow.dmi'
		icon_state = "t"


	ZRedBed
		icon = 'platformbed.dmi'
		icon_state = "r"

	ZRedBedb
		icon = 'platformbed.dmi'
		icon_state = "rb"

	ZGoldBed
		icon = 'platformbed.dmi'
		icon_state = "y"

	ZGoldBedb
		icon = 'platformbed.dmi'
		icon_state = "yb"

	ZGreenBed
		icon = 'platformbed.dmi'
		icon_state = "g"


	ZGreenBedb
		icon = 'platformbed.dmi'
		icon_state = "gb"

	ZBlueBed
		icon = 'platformbed.dmi'
		icon_state = "b"


	ZBlueBedb
		icon = 'platformbed.dmi'
		icon_state = "bb"

	ZFire
		icon = 'Stuffz.dmi'
		icon_state = "fire"
		density = 1


	ZShrinet
		icon = 'Stuffz.dmi'
		icon_state = "t"
		layer=MOB_LAYER+1

	ZShrineBL
		icon = 'Stuffz.dmi'
		icon_state = "bl"
		density = 1

	ZShrineL
		icon = 'Stuffz.dmi'
		icon_state = "bl"
		layer=MOB_LAYER+1

	ZShrineBR
		icon = 'Stuffz.dmi'
		icon_state = "br"
		density = 1

	ZShrineR
		icon = 'Stuffz.dmi'
		icon_state = "br"
		layer=MOB_LAYER+1

	ZShrineTL
		icon = 'Stuffz.dmi'
		icon_state = "tl"
		layer=MOB_LAYER+1

	ZShrineTR
		icon = 'Stuffz.dmi'
		icon_state = "tr"
		layer=MOB_LAYER+1

	ZShrineTop
		icon = 'Stuffz.dmi'
		icon_state = "t"
		layer=MOB_LAYER+1

	ZShrineTRS
		icon = 'Stuffz.dmi'
		icon_state = "trs"
		layer=MOB_LAYER+1

	ZShrineTLS
		icon = 'Stuffz.dmi'
		icon_state = "tls"
		layer=MOB_LAYER+1

	ZBar
		icon = 'Stuffz.dmi'
		icon_state = "ZBar"
		density = 1

	ZpillowRed
		icon = 'pillow2.dmi'
		icon_state = "w"


	ZRedThrone
		icon = 'pillow2.dmi'
		icon_state = "throne"


	ZSymbol1
		icon = 'pillow2.dmi'
		icon_state = "1"

	ZSymbol2
		icon = 'pillow2.dmi'
		icon_state = "2"


	ZCurtain
		icon = 'pillow2.dmi'
		icon_state = "c"
		layer=MOB_LAYER+1

	ZCurtain2
		icon = 'pillow2.dmi'
		icon_state = "c2"
		layer=MOB_LAYER+1

	ZCurtain3
		icon = 'pillow2.dmi'
		icon_state = "c3"
		layer=MOB_LAYER+1

	ZCurtain4
		icon = 'pillow2.dmi'
		icon_state = "c4"
		layer=MOB_LAYER+1

	ZARoof
		icon = 'ZAHouse.dmi'
		icon_state = "r"
		density = 1

	ZARoofO
		icon = 'ZAHouse.dmi'
		icon_state = "r"
		layer=MOB_LAYER+1

	ZAWall
		icon = 'ZAHouse.dmi'
		icon_state = "w"
		density = 1

	ZWindow
		icon = 'ZAHouse.dmi'
		icon_state = "wi"
		density = 1

	JSword
		icon = 'jhouse20.dmi'
		icon_state = "sword"
		density = 1

	ZRO2
		icon = 'ZRoof.dmi'
		icon_state = "ZRoof"
		layer = MOB_LAYER + 99999

	JHouseWL2
		icon = 'jhouse36522.dmi'
		icon_state = "jhouse36522"
		density = 1

	JHouseRE2
		icon = 'jhouse36522.dmi'
		icon_state = "roofedge"
		density = 1

	JHouseRE2O
		icon = 'jhouse36522.dmi'
		icon_state = "roofedge"
		layer = MOB_LAYER + 1

	JHouseRF2
		icon = 'jhouse36522.dmi'
		icon_state = "roof"
		density = 1

	JHouseRF2O
		icon = 'jhouse36522.dmi'
		icon_state = "roof"
		layer = MOB_LAYER + 1

	JSWordG
		icon = 'jhouse20.dmi'
		icon_state = "ggg"
		density = 1

	ZStoveTop
		icon = 'furnace2.dmi'
		icon_state = "chimney"
		density = 1

	ZStove
		icon = 'furnace2.dmi'
		icon_state = "stove"
		density = 1

	ZSpearrack
		icon = 'smithy(1).dmi'
		icon_state = "pole arms"
		density = 1

	ZSwordrack
		icon = 'smithy(1).dmi'
		icon_state = "swords"
		density = 1

	ZArmorb
		icon = 'smithy(1).dmi'
		icon_state = "blue display"
		density = 1

	ZArmorr
		icon = 'smithy(1).dmi'
		icon_state = "red display"
		density = 1

	ZArmorg
		icon = 'smithy(1).dmi'
		icon_state = "green display"
		density = 1


	ZArmoro
		icon = 'smithy(1).dmi'
		icon_state = "orange display"
		density = 1


	ZArmorp
		icon = 'smithy(1).dmi'
		icon_state = "purple display"
		density = 1

	ZAnvil
		icon = 'smithy(1).dmi'
		icon_state = "anvil"
		density = 1

	ZArmorgr
		icon = 'smithy(1).dmi'
		icon_state = "grey display"
		density = 1


	ZArmsSign1
		icon = 'smithy(1).dmi'
		icon_state = "smithsign1"
		density = 1

	ZArmsSign2
		icon = 'smithy(1).dmi'
		icon_state = "smithsign2"
		density = 1

	ZBoat
		icon = 'zboat.dmi'
		icon_state = "tail"
		density = 1

	ZBoatt
		icon = 'zboat.dmi'
		icon_state = "head"
		density = 1


	ZTablefish1
		icon = 'fish stuff.dmi'
		icon_state = "fish 1"
		density = 1

	ZTablefish2
		icon = 'fish stuff.dmi'
		icon_state = "fish 2"
		density = 1

	EHouseRoof01
		icon = 'Jhouse123456.dmi'
		icon_state = "roof"
		layer = MOB_LAYER + 1

	EHouseRoof1
		icon = 'Jhouse123456.dmi'
		icon_state = "roof"
		density = 1

	EHouseRoof02
		icon = 'Jhouse123456.dmi'
		icon_state = "roofedge"
		layer = MOB_LAYER + 1

	EHouseRoof2
		icon = 'Jhouse123456.dmi'
		icon_state = "roofedge"
		density = 1

	EHouseWall
		icon = 'Jhouse123456.dmi'
		icon_state = "Jhouse123456"
		density = 1

	ZBigFish
		icon = 'fish.dmi'
		icon_state = "fish"
		density = 1

	ZCartfish
		icon = 'cart fish.dmi'
		icon_state = "cart fish"
		density = 1
