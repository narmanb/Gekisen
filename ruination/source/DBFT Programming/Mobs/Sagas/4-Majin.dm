mob
	Saga
		Brolly
			name="{Saga}Brolly"
			icon_state="brolly"
			energy_code= 8665431
			level=12700
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=1300
			zenni=500000
			exp=90000
			karma = "Evil"
			race = "Saiyan"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Saga/Brolly/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=15000
					F.speed=1000
					F.icon_state="brolly1"
					CPS=13
				..()
		Babidi
			name="{Saga}Babidi"
			icon_state="babidi"
			energy_code= 1884592
			level=10000
			powerlevel=200000
			powerlevel_max=200000
			ki=20000000
			ki_max=20000000
			strength=1000
			strength_max=1000
			defence=900
			defence_max=900
			speed=5000
			zenni=5000
			exp=45000
			karma = "Evil"
			race = "Majin"
			CPS=5
		Dabura
			name="{Saga}Dabura"
			icon_state="dabura"
			energy_code= 3446012
			level=11600
			powerlevel=180000000
			powerlevel_max=180000000
			ki=150000000
			ki_max=150000000
			strength=270000000
			strength_max=270000000
			defence=240000000
			defence_max=240000000
			speed=2000
			zenni=50000
			exp=45000
			karma = "Evil"
			race = "Majin"
			CPS=11
		MajinBuu
			name="{Saga}Majin Buu"
			icon_state="majinbuu"
			energy_code= 5200463
			level=12900
			powerlevel=200000000
			powerlevel_max=200000000
			ki=190000000
			ki_max=190000000
			strength=350000000
			strength_max=350000000
			defence=250000000
			defence_max=250000000
			speed=3000
			zenni=80000
			exp=65000
			karma = "Evil"
			race = "Majin"
			has_beam="Candy Ray"
			beam_txt="TURN TO CHOCOLATE"
			beamIS="candyray"
			beamIST="candyrayt"
			CPS=12
			Del()
				if(!src.form_1)
					var/mob/Saga/MajinBuu/F=new
					F.loc=src.loc
					F.form_1=1
					F.level=13000
					F.icon_state="majinbuu1"
					F.CPS=12
				if(src.form_1&&!src.form_2)
					var/mob/Saga/MajinBuu/F=new
					F.loc=src.loc
					F.form_1=1
					F.form_2=1
					F.level=14500
					F.icon_state="majinbuu2"
					F.CPS=13
				if(src.form_2&&!src.form_3)
					var/mob/Saga/MajinBuu/F=new
					F.loc=src.loc
					F.form_1=1
					F.form_2=1
					F.form_3=1
					F.level=16000
					F.icon_state="majinbuu3"
					F.CPS=14
				..()
		Trunks2
			name="{Saga}Trunks"
			icon_state="trunks1"
			energy_code= 2116582
			level=20600
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goten1
			name="{Saga}Goten"
			icon_state="goten1"
			energy_code= 7100532
			level=19000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Goku7
			name="{Saga}Goku"
			icon_state="goku6"
			energy_code= 9152264
			level=22100
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegeta5
			name="{Saga}Vegeta"
			icon_state="vegeta4"
			energy_code= 1408347
			level=22900
			karma = "Good"
			race = "Saiyan"
			has_beam="Final Flash"
			beam_txt="FINAL FLASH"
			beamIS="finalflash"
			beamIST="finalflasht"
		Gotenks1
			name="{Saga}Gotenks"
			icon_state="gotenks1"
			energy_code= 7845961
			level=23500
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Gohan4
			name="{Saga}Gohan"
			icon_state="gohan2"
			energy_code= 1776540
			level=22000
			speed=2000
			karma = "Good"
			race = "Half Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"
		Vegito1
			name="{Saga}Vegito"
			icon_state="vegito1"
			energy_code= 1604578
			level=24000
			speed=1000
			karma = "Good"
			race = "Saiyan"
			has_beam="Kamehameha"
			beam_txt="KAMEHAMEHA"
			beamIS="kamehameha"
			beamIST="kamehamehat"