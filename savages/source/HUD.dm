mob/proc
	powerlevelRefresh(mob/M as mob)
		if(usr.talking == 1)
			sleep(75)
			usr.talking=0
		for(var/obj/hud/meter1/N in src.client.screen)
			N.num = (health/maxhealth)*N.width
			if(health <= 0)
				N.num = 0
			N.Update()
		for(var/obj/hud/mmeter1/MM in src.client.screen)
			MM.num = (powerlevel/maxpowerlevel)*MM.width
			if(powerlevel <= 0)
				MM.num = 0
			MM.Update()
		for(var/obj/hud/mmeter2/MM2 in src.client.screen)
			MM2.num = (exp/maxexp)*MM2.width
			if(exp <= 0)
				MM2.num = 0
			MM2.Update()
		for(var/obj/hud/bpnumber/B in client.screen) // For var/hpnumber/N in client.screen
			B.icon_state = "[copytext(num2text(round(level),100),B.position,B.position+1)]"
		for(var/obj/hud/nametext/N in client.screen) // For var/hpnumber/N in client.screen
			N.icon_state = "[copytext((name),N.position,N.position+1)]"
		for(var/obj/hud/nametext1/N1 in view(1)) // For var/hpnumber/N in client.screen
			N1.icon_state = "[copytext((name),N1.position,N1.position+1)]"
		for(var/obj/hud/face/F in client.screen)
			F.icon = faceicon
//The hud. AKA. Object
//Login, inwhich will call the HPRefresh. Call the src.HPRefresh() wherever the character gets or looses HP.





obj/hud
	var/num = 0 // current unrounded icon_state number
	var/width // number of frames in your meter, if you have frames 0 = 30 then this is set to 30
	          // even though theres 31 frames.
	face
		icon = 'default.dmi'
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999999
		New(client/C)
			screen_loc = "12,13"
			C.screen+=src

	bpnumber
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999
		icon = 'Letters.dmi'
		icon_state = "0"
		screen_loc = "13,5"
		pixel_y = 16
		var/position = 0
		New(client/C,num_position)
			src.icon -= rgb(255,255,255)
			position = num_position
			screen_loc = "9:[(position-1)*8],13"
			C.screen+=src
	nametext
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999
		icon = 'Letters.dmi'
		icon_state = ""
		screen_loc = "13,5"
		pixel_y = 16
		var/position = 0
		New(client/C,num_position)
			src.icon -= rgb(255,255,255)
			position = num_position
			screen_loc = "11:[(position-1)*8],12"
			C.screen+=src
	nametext1
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999
		icon = 'Letters.dmi'
		icon_state = ""
		pixel_y = 32
		var/position = 0
		New(num_position)
			src.icon -= rgb(255,255,255)
			position = num_position
	meter1 // hud health meter, more frames, larger, and much better detail
		icon = 'bar.dmi'
		icon_state = "10"
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999
		width = 10
		New(client/C)
			screen_loc="2,13" //  where it should appear on the screen
			C.screen+=src

	mmeter1 // hud mana meter
		icon = 'bar.dmi'
		icon_state = "10"
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999
		width = 10
		New(client/C)
			//  where it should appear on the screen
			src.icon -= rgb(125,0,0)  // Strip it of color
			src.icon += rgb(0,0,125)
			screen_loc="4,13"
			C.screen+=src
	mmeter2 // hud mana meter
		icon = 'bar.dmi'
		icon_state = "10"
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999
		width = 10
		New(client/C)
			//  where it should appear on the screen
			src.icon -= rgb(125,0,0)  // Strip it of color
			src.icon += rgb(0,125,0)
			screen_loc="6,13"
			C.screen+=src
	proc/Update()// NOTE: this is the only part of the code made by Spuzzum, I would change it but I see no point in doing this.
				 // NOTE: it also has the original commenting from Spuzzum.
		if(num < 0) //if the meter is negative
			num = 0 //set it to zero
		else if(num > width) //if the meter is over 100%
			num = width //set it to 100%
		src.icon_state = "[round(src.num)]"
	pointer
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999
		icon = 'hud.dmi'
		icon_state = "pointer"
	toolbar_top
		layer = MOB_LAYER+9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'turfs7.dmi'
		icon_state = "toolbartop"
		density = 1
		New(client/C)
			screen_loc = "1,13 to 9,13"
			C.screen += src
	toolbar_top2
		layer = MOB_LAYER+9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'turfs7.dmi'
		icon_state = "toolbartop"
		density = 1
		New(client/C)
			screen_loc = "11,12 to 13,12"
			C.screen += src
	toolbar_textbox
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'turfs.dmi'
		icon_state = "cantsee"
		density = 1
		New(client/C)
			screen_loc = "1,2 to 1,1"
			C.screen += src
	toolbar_corner
		layer = MOB_LAYER+9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "corner"
		density = 1
		New(client/C)
			screen_loc = "10,12"
			C.screen += src
	toolbar_bg
		layer = MOB_LAYER+9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "toolbar_bg"
		density = 1
		New(client/C)
			screen_loc = "11,13 to 13,13"
			C.screen += src
	toolbar_corner2
		layer = MOB_LAYER+9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "corner2"
		density = 1
		New(client/C)
			screen_loc = "10,13"
			C.screen += src

	blackside
		layer = MOB_LAYER+9999999999999999999999999999999
		icon = 'Turfs.dmi'
		icon_state = "blackside"
	HP
		layer = MOB_LAYER+999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		New(client/C)
			screen_loc = "1,13"
			C.screen +=src
	KI
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "ki"
		New(client/C)
			screen_loc = "3,13"
			C.screen +=src
	XP
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "xp"
		New(client/C)
			screen_loc = "5,13"
			C.screen +=src
	BP
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999999999999999999
		icon = 'HP.dmi'
		icon_state = "bp"
		New(client/C)
			screen_loc = "8,13"
			C.screen +=src
	emote
		layer = MOB_LAYER+99999999999999999999999999999999999
		icon = 'hud.dmi'
		icon_state = "emote"
		New(client/C) screen_loc = "9,13", C.screen+=src
		Click() usr.Emote()
	look
		layer = MOB_LAYER+99999999999999999999999999999999999999
		icon = 'hud.dmi'
		icon_state = "look"
		New(client/C) screen_loc = "10,13", C.screen+=src
		Click() usr.Look()
	who
		layer = MOB_LAYER+99999999999999999999999999999999999999999
		icon = 'hud.dmi'
		icon_state = "who"
		New(client/C) screen_loc = "12,13", C.screen+=src
		Click() usr.Who()
	Donate
		layer = MOB_LAYER+9999999999999999999999999999999999
		icon = 'hud.dmi'
		icon_state = "donate"
		New(client/C) screen_loc = "13,13", C.screen+=src

mob/proc
	Emote()
		var/T = input("Role-play somthing to the world.","-= Emote =-") as null|text
		if(!T) return
		else
			world << "<font face = courier><font color = red>*<font color = green> [usr] [Safe_Guard(T)] <font color = red>*"



client
	script = "<STYLE>BODY {background: black; color: white}</STYLE>"
	New()
		..()
		new/obj/hud/toolbar_top(src)
		new/obj/hud/KI(src)
		new/obj/hud/HP(src)
		new/obj/hud/XP(src)
		new/obj/hud/BP(src)
		new/obj/hud/meter1(src)
		new/obj/hud/mmeter1(src)
		new/obj/hud/mmeter2(src)
		new/obj/hud/toolbar_corner(src)
		new/obj/hud/toolbar_bg(src)
		new/obj/hud/toolbar_corner2(src)
		new/obj/hud/toolbar_top2(src)
		new/obj/hud/face(src)
	Del()
		..()

