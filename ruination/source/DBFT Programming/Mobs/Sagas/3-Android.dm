mob
	Saga
		Android16
			name="{Saga}Android 16"
			icon_state="android16"
			energy_code= 8335462
			level=6500
			powerlevel=40000000
			powerlevel_max=40000000
			ki=200000000
			ki_max=200000000
			strength=65000000
			strength_max=65000000
			defence=67000000
			defence_max=67000000
			speed=2700
			zenni=20000
			exp=30000
			karma = "Evil"
			race = "Android"
			Del()
				if(prob(50))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				..()
		Android17
			name="{Saga}Android 17"
			icon_state="android17"
			energy_code= 1996548
			level=6000
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=35000
			karma = "Evil"
			race = "Android"
			Del()
				if(prob(50))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				..()
		Android18
			name="{Saga}Android 18"
			icon_state="android18"
			energy_code= 7665825
			level=6000
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=36000
			karma = "Evil"
			race = "Android"
			Del()
				if(prob(50))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				..()
		Android19
			name="{Saga}Android 19"
			icon_state="android19"
			energy_code= 8225486
			level=6800
			powerlevel=39000000
			powerlevel_max=39000000
			ki=200000000
			ki_max=200000000
			strength=60000000
			strength_max=60000000
			defence=63000000
			defence_max=63000000
			speed=2700
			zenni=19000
			exp=32000
			karma = "Evil"
			race = "Android"
			Del()
				if(prob(50))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				..()
		Android20
			name="{Saga}Dr. Gero"
			icon_state="android20"
			energy_code= 8114798
			level=6500
			powerlevel=30000000
			powerlevel_max=30000000
			ki=180000000
			ki_max=180000000
			strength=50000000
			strength_max=50000000
			defence=51000000
			defence_max=51000000
			speed=3000
			zenni=17000
			exp=34000
			karma = "Evil"
			race = "Android"
			Del()
				if(prob(50))
					var/obj/O = new/obj/Equipment/Consumable/Chip
					O.loc = src.loc
				..()
		Cell
			name="{Saga}Cell"
			icon_state="cell"
			energy_code= 9788411
			level=7000
			powerlevel=40000000
			powerlevel_max=40000000
			ki=200000000
			ki_max=200000000
			strength=65000000
			strength_max=65000000
			defence=67000000
			defence_max=67000000
			speed=2700
			zenni=25000
			exp=50000
			karma = "Evil"
			race = "Bio Android"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			Del()
				if(!src.form_1)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=8000
					F.form_1=1
					F.icon_state="cell1"
				if(src.form_1&&!src.form_2)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=8500
					F.form_1=1
					F.form_2=1
					F.icon_state="cell2"
				if(src.form_2&&!src.form_3)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.level=9000
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.icon_state="cell2"
					F.overlays+='Elec Blue Big.dmi'
				if(src.form_3&&!src.form_4)
					var/mob/Saga/Cell/F=new
					F.loc=src.loc
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.form_4=1
					F.level=10500
					F.icon_state="cell2"
					F.overlays+='Elec Red Big.dmi'
				..()
		Goku6
			name="{Saga}Goku"
			icon_state="goku4"
			energy_code= 7675482
			level=8500
			speed=3000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegeta4
			name="{Saga}Vegeta"
			icon_state="vegeta4"
			energy_code= 7645113
			level=8000
			speed=3000
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
		Gohan3
			name="{Saga}Gohan"
			icon_state="gohan3"
			energy_code= 1554692
			level=12000
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
			Del()
				if(!src.form_1)
					var/mob/Saga/Gohan3/F=new
					F.loc=src.loc
					F.level=17500
					F.form_1=1
					F.speed=1000
					F.icon_state="gohan4"
				..()