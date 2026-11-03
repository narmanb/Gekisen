

mob/NPC
	Prisoner1
		name = "Prisoner"
		icon = 'seshicons.dmi'
		icon_state = "prisoner1"
		density = 1
		safe = 1
		frozen = 1
		it_blocked = 1
		energy_code = 123456432
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(3)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Prisoner")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG>[src]:</white></b> It's not worth breaking the rules.."

	Prisoner2
		name = "Prisoner"
		icon = 'seshicons.dmi'
		icon_state = "prisoner2"
		density = 1
		safe = 1
		frozen = 1
		it_blocked = 1
		energy_code = 432156432
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Prisoner")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG>[src]:</white></b> You can't even self train in here!"


	PrisonGuard
		name = "Prison Guard"
		icon = 'seshicons.dmi'
		icon_state = "prison gaurd"
		density = 1
		safe = 1
		frozen = 1
		it_blocked = 1
		energy_code = 123456432
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(3)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Prison Guard")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(30)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG>[src]:</white></b> ......."


obj/JailCell
	icon = 'seshicons.dmi'
	CellLeft
		icon_state = "door left"
		density = 1
	CellRight
		icon_state = "door right"
		density = 1

	Cage
		icon_state = "cage"
		density = 1

	Cage2
		icon_state = "cage2"
		density = 1


	Phone
		icon_state = "phone"
		density = 1
		verb/Use()
			set src in oview(3)
			set category = "ESCAPE"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Tried to use Phone")
			if(usr.talking)
				usr<<"You must wait before you can fail to escape again"
				return
			usr.talking=1
			spawn(100)usr.talking=0
			if(usr.jailed)
				view(usr) << "<b>Hahaha you don't get to make any phone calls in this jail, you think escaping was gonna be that easy?"
			else
				usr << "when a jailed player tries to use a phone they get mocked :)"