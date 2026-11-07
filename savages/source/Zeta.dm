

world
	mob = /mob/other/choosing_character/
	hub = "Dragonslayer4000.DragonballSavages"
	view = 6
	tick_lag = 2
	loop_checks = 1
	name = "DragonBall Savages: -= Version 1 =-"
	version = 3
client
	script = "<STYLE>BODY {background: black; color: white}  IMG.icon{width:32;height:32}</STYLE>"
client
	verb
		Save()
			set category = "Communication"
			SaveMob()
			usr << "Saving Character..."
			sleep(10)
			usr << "Save Complete"
mob
	Login()
		..()
		src.loc = locate(70,82,1)
		npp = 0

