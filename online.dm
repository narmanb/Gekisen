
//#define DEBUG
area
	outside3	// lay this area on the map anywhere you want it to change from night to day
		layer = 6999999999999999999999999999999999999999999999999999999999999999999	// set this layer above everything else so the overlay obscures everything
		// determines if the area is lit or dark.
		safe=0
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=0
		proc
			daycycle()
				if(dbc==0)
					overlays -= 'black50.dmi'	// remove the 50% dither
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
				else
					if(dbc==1)
						overlays += 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						overlays -= 'black25.dmi'	// remove the dither
						overlays += 'black50.dmi'	// add the 50% dither
				spawn(20) daycycle()	// change the 20 to make longer days and nights


//#define DEBUG
area
	outside2	// lay this area on the map anywhere you want it to change from night to day
		layer = 6999999999999999999999999999999999999999999999999999999999999999999	// set this layer above everything else so the overlay obscures everything
		// determines if the area is lit or dark.
		safe=0
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=0
		proc
			daycycle()
				if(dbc==0)
					overlays -= 'black50.dmi'	// remove the 50% dither
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
				else
					if(dbc==1)
						overlays += 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						overlays -= 'black25.dmi'	// remove the dither
						overlays += 'black50.dmi'	// add the 50% dither
				spawn(20) daycycle()	// change the 20 to make longer days and nights

//#define DEBUG
area
	outside	// lay this area on the map anywhere you want it to change from night to day
		layer = 6999999999999999999999999999999999999999999999999999999999999999999	// set this layer above everything else so the overlay obscures everything
		// determines if the area is lit or dark.
		safe=0
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=0
		proc
			daycycle()
				if(dbc==0)
					overlays -= 'black50.dmi'	// remove the 50% dither
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
				else
					if(dbc==1)
						overlays += 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						overlays -= 'black25.dmi'	// remove the dither
						overlays += 'black50.dmi'	// add the 50% dither
				spawn(20) daycycle()	// change the 20 to make longer days and nights

//#define DEBUG
area
	outside4	// lay this area on the map anywhere you want it to change from night to day
		layer = 6999999999999999999999999999999999999999999999999999999999999999999	// set this layer above everything else so the overlay obscures everything
		safe=0
		Entered(mob/characters/O)
			if(istype(O,/mob/characters))
				O.nopk=0
		proc
			daycycle()
				if(dbc==0)
					overlays -= 'black50.dmi'	// remove the 50% dither
					overlays += 'black25.dmi'	// add a 25% dither for a fading effect
					sleep(3)	// pause a moment
					overlays -= 'black25.dmi'	// remove the dither
				else
					if(dbc==1)
						overlays += 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(3)	// pause a moment
						overlays -= 'black25.dmi'	// remove the dither
						overlays += 'black50.dmi'	// add the 50% dither
				spawn(20) daycycle()	// change the 20 to make longer days and nights


client
	Del()
		SaveMob()
		sleep(100)
		del(mob)
		return ..()



world
	proc
		CdChecker()
			if(dragonscatter1==0)
				dragonscatter1=1
				world<<"<b>the Dragonballs scatter across the universe!!</b>"
				dbc=0
			for(var/area/outside/Y in world)
				Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
				Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
				sleep(2)
				Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect

			for(var/area/outside2/D in world)
				D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
				D.icon= 'white.dmi'	// add a 25% dither for a fading effect
				sleep(2)
				D.icon= 'blank.dmi'	// add a 25% dither for a fading effect

			for(var/area/outside3/K in world)
				K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
				K.icon= 'white.dmi'	// add a 25% dither for a fading effect
				sleep(2)
				K.icon= 'blank.dmi'	// add a 25% dither for a fading effect

			for(var/area/outside4/G in world)
				G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
				G.icon= 'white.dmi'	// add a 25% dither for a fading effect
				sleep(2)
				G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
			sleep(216000)
			spawn()world.CdChecker()




world
	name = "Dragonball Gekisen"
	status = "Dragonball Gekisen - <strong><font color=red>Beta Server</font></strong><strong>: v. 1.50.05</strong>"
world

	mob = /mob/other/choosing_character
	hub = "Masterdan.DBGekisen"
	hub_password = "danrox"
//	hub = "TeamHybrid.DBGekisenROTF"
//	hub_password= "cyber77573"
	view = 6
	tick_lag = 1
	loop_checks = 1
// Gek Login Fix
//	map_format=TILED_ICON_MAP
// End Gek Login Fix

