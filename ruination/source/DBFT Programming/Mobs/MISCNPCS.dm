

mob/NPC
	Fighter1
		name = "Fighter"
		icon = 'MISCMOBS.dmi'
		icon_state = "fighter1"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 2675368234
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Fighter1")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b>\icon[src] Fighter</white></b> you can train your character by using self train or focus train under the Training tab!<Br>Be sure to read the game guide."

mob/NPC
	Fighter2
		name = "Fighter"
		icon = 'MISCMOBS.dmi'
		icon_state = "fighter"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 35615368234
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to FIGHTER")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b>\icon[src] Fighter</white></b> You can concentrate on the stats you want with self train and focus train, by using the concentrate verb, located in Training tab"




