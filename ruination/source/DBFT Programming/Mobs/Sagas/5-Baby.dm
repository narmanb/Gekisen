mob
	Saga
		Super17
			name="{Saga}Super 17"
			icon_state="super17"
			energy_code= 1554862
			level=18000
			powerlevel=500000000
			powerlevel_max=500000000
			ki=250000000
			ki_max=250000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=1000
			zenni=400000
			exp=75000
			karma = "Evil"
			race = "Android"
			CPS=15
		Baby
			name="{Saga}Baby"
			icon_state="baby"
			energy_code= 5684221
			level=19500
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=3000
			zenni=500000
			exp=90000
			karma = "Evil"
			race = "Tuffle"
			CPS=14
			Del()
				if(!src.form_1)
					var/mob/Saga/Baby/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=21000
					F.icon_state="baby1"
					CPS=15
				if(src.form_1&&!src.form_2)
					var/mob/Saga/Baby/F=new
					F.loc=src.loc
					F.form_1=1
					F.form_2=1
					F.level=22900
					F.icon_state="baby2"
					F.overlays+=new/obj/BabyT
					F.CPS=16
				..()
		Shenron
			name="{Saga}Shenron"
			icon_state="shenron"
			energy_code= 2665478
			level=24000
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=2000
			zenni=500000
			exp=90000
			karma = "Evil"
			race = "Dragon"
			CPS=17
			Del()
				if(!src.form_1)
					var/mob/Saga/Shenron/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=25000
					F.icon_state="shenron1"
					F.CPS=19
				..()
		Goku8
			name="{Saga}Goku"
			icon_state="goku2"
			energy_code= 9152264
			level=22500
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku9
			name="{Saga}Goku"
			icon_state="goku6"
			energy_code= 9152264
			level=23000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku10
			name="{Saga}Goku"
			icon_state="goku7"
			energy_code= 9152264
			level=24000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku11
			name="{Saga}Goku"
			icon_state="goku7"
			energy_code= 9152264
			level=24500
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku12
			name="{Saga}Goku"
			icon_state="goku7"
			energy_code= 9152264
			level=25000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegeta6
			name="{Saga}Vegeta"
			icon_state="vegeta5"
			energy_code= 1408347
			level=23500
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
		Gogeta
			name="{Saga}Gogeta"
			icon_state="gogeta"
			energy_code= 9152264
			level=26000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
obj
	BabyT
		icon='Sagas.dmi'
		icon_state="baby2t"
		pixel_y=32
		layer=500