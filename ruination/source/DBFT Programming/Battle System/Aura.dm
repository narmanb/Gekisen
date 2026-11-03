mob
	var
		aura = 'Full Aura.dmi'
		auraset
		auradefault=1
	//	aura = 'Aura, Big.dmi'
obj/Technique/Aura
	verb
		Aura()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Aura")
			if(usr.FuseFollower)
				return
			switch(alert("Switch your aura:","","On","Off"))
				if("On")
					usr.aura_on=1
					//usr.overlays -= new/obj/Aura
					//usr.overlays += new/obj/Aura
					usr.overlays -= usr.auraset
					usr.overlays += usr.auraset
					usr << sound('aura full.wav')
				else
					usr.underlays -= usr.underlays
					usr.overlays -= usr.auraset
					usr.aura_on = 0
//TALL AURAS
//******Saiyan*******
obj/Aura
	icon = 'Full Aura.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32


obj/AuraBlack
	icon = 'defaultauraBlack.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32

obj/AuraBlue
	icon = 'defaultauraBlue.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32


obj/AuraGreen
	icon = 'defaultauraGreen.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32


obj/AuraPurple
	icon = 'defaultauraPurple.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32


obj/AuraRed
	icon = 'defaultauraRed.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32

obj/AuraYellow
	icon = 'defaultauraYellow.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = -32

obj/AuraCustom1
	icon = 'Custom1Aura.dmi'

obj/AuraCustom2
	icon = 'Custom2Aura.dmi'

obj/AuraCustom3
	icon = 'Custom3Aura.dmi'

obj/AuraCustom4
	icon = 'Custom4Aura.dmi'

obj/AuraCustomFlame
	icon = 'CustomFlameAura.dmi'

obj/AuraElec1
	icon = 'ElecAura1.dmi'

obj/AuraElecRed
	icon = 'ElecAuraRed.dmi'

obj/AuraSpecialBlue
	icon = 'SpecialAuraBlue.dmi'

obj/AuraSpecialFlame
	icon = 'SpecialFlameAura.dmi'

obj/Aura/SSJ_Aura
	icon = 'Big Aura.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/SSJ_Aura2

obj/Aura/SSJ_Aura2
	icon = 'Big Aura.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Changlings*****
obj/Aura/Chang_Aura
	icon = 'Big Aura 3.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Chang_Aura2

obj/Aura/Chang_Aura2
	icon = 'Big Aura 3.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Majins*****
obj/Aura/Maj_Aura
	icon = 'Big Aura 2.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Maj_Aura2

obj/Aura/Maj_Aura2
	icon = 'Big Aura 2.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Human*****
obj/Aura/Hum_Aura
	icon = 'Big Aura 4.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Hum_Aura2

obj/Aura/Hum_Aura2
	icon = 'Big Aura 4.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Saibas/Nameks/Bios*****
obj/Aura/Nam_Aura
	icon = 'Big Aura 5.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Nam_Aura2

obj/Aura/Nam_Aura2
	icon = 'Big Aura 5.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Normal Aura******
obj/Aura/Nor_Aura
	icon = 'Big Aura 6.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Nor_Aura2

obj/Aura/Nor_Aura2
	icon = 'Big Aura 6.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//****Androids Aura1******
obj/Aura/And_Aura
	icon = 'Big Aura 7.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/And_Aura2

obj/Aura/And_Aura2
	icon = 'Big Aura 7.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999

//****Androids Aura2******
obj/Aura/And_Aura1
	icon = 'AndroA.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/And_Aura11

obj/Aura/And_Aura11
	icon = 'AndroA.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//******Legendary Saiyan*******
obj/Aura/LSSJ_Aura
	icon = 'Big Aura 10.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/LSSJ_Aura2

obj/Aura/LSSJ_Aura2
	icon = 'Big Aura 10.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 2 **********
obj/Aura/Demon_Aura1
	icon = 'DemonA.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura11

obj/Aura/Demon_Aura11
	icon = 'DemonA.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 3 **********
obj/Aura/Demon_Aura2
	icon = 'DemonA2.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura22

obj/Aura/Demon_Aura22
	icon = 'DemonA2.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

//*******Dmn 4 **********
obj/Aura/Demon_Aura3
	icon = 'DemonA3.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Demon_Aura33

obj/Aura/Demon_Aura33
	icon = 'DemonA3.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

obj/Aura/ssjrSparks
	icon = 'Rosesparks.dmi'
	New()
		pixel_y = 0
		pixel_x = 0


obj/Aura/Kaioken_Aura
	icon = 'KaiokenNew.dmi'
	icon_state = ""
	//pixel_x = 32
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Kaio_Top

obj/Aura/Kaio_Top
	icon = 'KaiokenNew.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0


obj/Aura/Rage_Aura
	icon = 'ssjrageaura.dmi'
	icon_state = ""
	//pixel_x = 32
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/Rage_Top

obj/Aura/Rage_Top
	icon = 'ssjrageaura.dmi'
	icon_state = "top"
	New()
		layer = 999
		pixel_y = 32
		pixel_x = 0

obj/Aura/SSJ_Rose_Aura
	icon = 'SsjRoseAura.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/SSJ_Rose_Aura2

obj/Aura/SSJ_Rose_Aura2
	icon = 'SsjRoseAura.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999


obj/Aura/SSJ_Blue_Aura
	icon = 'SSJBauranew.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/SSJ_Blue_Aura2

obj/Aura/SSJ_Blue_Aura2
	icon = 'SSJBauranew.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999

/*

obj/Aura/SSJ_Aura
	icon = 'Big Aura.dmi'
	icon_state = ""
	New()
		pixel_y = 0
		pixel_x = 0
		src.overlays += new/obj/Aura/SSJ_Aura2

obj/Aura/SSJ_Aura2
	icon = 'Big Aura.dmi'
	icon_state = "top"
	New()
		pixel_y = 32
		pixel_x = 0
		layer = 999
//BIG AURAS
obj/Aura/Black
	icon = 'Aura, Big.dmi'
//	icon_states = ('Aura, Big.dmi',mode=1)

obj
	proc/ScaleIcon(obj,a)
		var/icon = a.icon
		a.Scale(96,96)
*/
mob
	proc
		Big_Aura()
			if(src.trans_aura_on)
				src.overlays-=src.aura
				src.underlays-=src.underlays
				src.aura_on = 1
				if(src.race == "Saiyan" && src.gene == "Godly")
					if(src.form_6 == 1)
						src.underlays += new/obj/Aura/SSJ_Blue_Aura
						return

				if(src.race == "Saiyan" || src.race == "Half Saiyan")
					src.underlays += new/obj/Aura/SSJ_Aura
				if(src.race == "Kai" && src.hasgokubody == 1)
					src.underlays += new/obj/Aura/SSJ_Rose_Aura
				if(src.race == "Changeling")
					src.underlays += new/obj/Aura/Chang_Aura
				if(src.race == "Majin")
					src.underlays += new/obj/Aura/Maj_Aura
				if(src.race == "Namekian" || src.race == "Saibaman" || src.race == "Bio Android")
					src.underlays += new/obj/Aura/Nam_Aura
				if(src.race=="Kai")
					if(src.hasgokubody)
						src.underlays += new/obj/Aura/ssjrSparks
					else
						src.underlays += new/obj/Aura/And_Aura1
				if(src.race == "Android")
					if(!src.form_1)
						src.underlays += new/obj/Aura/And_Aura
					if(src.form_1)
						src.underlays += new/obj/Aura/And_Aura1
				if(src.race=="Tuffle"||src.race=="Dragon"||src.race=="Konat")
					src.underlays += new/obj/Aura/Nor_Aura
				if(src.race=="Human")
					src.underlays += new/obj/Aura/Nor_Aura
				if(src.race == "Saiyan" && src.gene == "Legendary")
					src.underlays += new/obj/Aura/LSSJ_Aura
				if(src.race == "Demon")
					if(!src.form_1)
						src.underlays += new/obj/Aura/Demon_Aura1
					if(src.form_1 && !src.form_2)
						src.underlays += new/obj/Aura/Demon_Aura1
					if(src.form_2 && !src.form_3)
						src.underlays += new/obj/Aura/Demon_Aura2
					if(src.form_3 && !src.form_4)
						src.underlays += new/obj/Aura/Demon_Aura3
				return

mob
	proc
		Put_Aura()
			src.aura_on = 1
			if(src.race == "Saiyan" || src.race == "Half Saiyan")
				src.underlays += new/obj/Aura/SSJ_Aura
			if(src.race == "Changeling")
				src.underlays += new/obj/Aura/Chang_Aura
			if(src.race == "Majin")
				src.underlays += new/obj/Aura/Maj_Aura
			if(src.race == "Namekian" || src.race == "Saibaman" || src.race == "Bio Android")
				src.underlays += new/obj/Aura/Nam_Aura
			if(src.race == "Android")
				if(!src.form_1)
					src.underlays += new/obj/Aura/Nor_Aura
				if(src.form_1)
					src.underlays += new/obj/Aura/And_Aura
				if(src.form_2)
					src.underlays += new/obj/Aura/And_Aura1
			if(src.race == "Kai")
		//		if(src.form_1)
				if(src.hasgokubody)
					src.underlays += new/obj/Aura/ssjrSparks
				else
					src.underlays += new/obj/Aura/And_Aura1
			if(src.race == "Tuffle" || src.race == "Dragon"|| src.race == "Konat")
				src.underlays += new/obj/Aura/Nor_Aura
			if(src.race == "Saiyan" && src.gene == "Legendary")
				src.underlays += new/obj/Aura/LSSJ_Aura
			if(src.race == "Demon")
				if(!src.form_1)
					src.underlays += new/obj/Aura/Demon_Aura1
				if(src.form_1 && !src.form_2)
					src.underlays += new/obj/Aura/Chang_Aura
				if(src.form_2 && !src.form_3)
					src.underlays += new/obj/Aura/Demon_Aura1
				if(src.form_3 && !src.form_4)
					src.underlays += new/obj/Aura/Demon_Aura2
				if(src.form_4 && !src.form_5)
					src.underlays += new/obj/Aura/Demon_Aura3
			return