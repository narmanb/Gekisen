

mob/NPC
	Travel_Guide
		name = "17 - Travel Guide"
		icon = 'travelguide17.dmi'
		density = 1
		safe = 1
		frozen = 1
		energy_code = 7215368234
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Lan Kai aka King Kai")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG> Android 17</white> Are you lost?</b><br>You're standing in front of the safe zone gym.<br>The bank is right across the street, with the number 2 on it<br><br>The building with the number 3 on it is the barbershop<br>The big building with the number 4 on it is the Mall<br>The gravity training center is located in the northeast of the city, it has two 8's on it."





	Gravity_Training_Enthusiast
		name = "Gravity Training Enthusiast"
		icon = 'MISCMOBS.dmi'
		icon_state = "TB"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 7215368234
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to grav train guy")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG> Gravity Training Enthusiast</white> This is the gravity training building</b><br>Each of the four chambers has a different level of gravity. To turn on a gravity machine, a new tab will open up when close enough<br>While gravity is on, you will lose a percent of your Powerlevel each pull, how much depends on which room.<br>You must self train or focus train while gravity training to gain increased <b>exp,tp, and stat ticks</b> how much of an increase depends on the room.<br>The first room is 100x gravity, then 200x, 300x, and 500x. In the 100x room, your stat ticks are increased about 5%, while in the 500x room, they're increased about 25%, however the higher the gravity, the more health you will lose each pull"



	Professional_Mobber
		name = "Professional Mobber"
		icon = 'MISCMOBS.dmi'
		icon_state = "tien"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 7215368214
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to prof mob")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG> Professional Mobber</white></b> The mobs inside this building and the one to the north are very different. They can be destroyed in only one or two attacks but they are on a mission to kill you before you have the chance. They explode when they get close enough, damaging you a percent of your powerlevel, based on how big the explosion was. <br>However you get levels and Quest Points from each kill, which can be exchanged for valuable bonuses and items."
