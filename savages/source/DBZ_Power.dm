mob/Login()
	..()
	usr<<"<b>Version: 2"


mob/proc
	textlist(var/textlist)
		writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)
	minitext(mob/m,xp=0 as num,yp=0 as num,mtype,x as num,x2 as num,y as num,y2 as num,t as text)
		if(m.key)
			var/bx=x;//var/by=y
			textlist(t)
			for(var/w in writing)
				var/obj/textmenu/minitext/s=new(m.client)
				s.screen_loc="[x]:[xp],[y]:[yp]"
				s.icon_state=w
				s.name="\proper[w]"
				s.mtype=mtype
				xp+=8
				if(xp >= 32) {/*sleep(0.1);*/xp-=32 ; x++}
				if(x >= x2)
					xp=16
					yp -= 10
					x = bx
					if(yp <= -32)
						yp += 32
						y--
	closetext(mob/m,mtype)
		if(m.key)
			for(var/obj/textmenu/o in m.client.screen)if(o.mtype==mtype)del(o)

obj/textmenu/minitext
	icon='text.dmi'
	layer=MOB_LAYER+999999999999999999999999999999999999999999999999999999999999999999999999999999
	New(client/c) c.screen += src
var/writing
mob/var/textlocx
mob/var/textlocy
obj/var/mtype
mob/var
	oletter
	opx=0
	opy=0
mob/proc
	otextlist(var/textlist)
		oname=list();for(var/t=1,t<=length(textlist),t++)oname+=copytext(textlist,t,t+1);
	overlaytext(mob/m,xp=0 as num,yp=0 as num,mtype,t as text)
		usr.opx=xp;usr.opy=yp
		otextlist(t)
		for(var/w in oname)
			usr.oletter=w
			src.overlays+= new/obj/overlays/otext
			usr.opx+=5
obj/overlays/otext
	icon='otext.dmi'
	layer = 30
	New()
		icon_state="[usr.oletter]"
		pixel_y=usr.opy
		pixel_x=usr.opx
mob/proc/checkpos(mob/m)
	var/t=length(m.name)
	world<<"[t]"
	if(t<9)t=0
	if(t>8&&t<15)t=-8
	if(t>15&&t<21)t=-18
	overlaytext(m,t,10,"name",m.name)//position of the name

mob/verb/say(msg as text)
	set category = "Communication"
	set name="Say"
	for(var/mob/m in view(6))
		m<<"-(<IMG CLASS=icon SRC=\ref[usr.faceicon]>)-([usr])-<font color=white>says: [msg]"





mob
	proc
		Announcements()
			for(var/mob/characters/M in world)
				if(M.key)
					if(M.name)
						usr.counter += "[M.name], "
						if(M.gm)
							usr.gms += "[M.name] "
			var/html="<center><TABLE BORDER=1><TR><TH><html><STYLE>BODY {background: black;  color: white}</STYLE><center><h1><U><font color=yellow>DBZ Savages Announcements<font color=white></u></h1></center><br>* THE GAME IS GREAT!!!!!! OH NO!!!!!!!! It's true, this game has come a long way and it will not stop here, as you can see there is better hud display, soon i will add exp bar and title on the hud. I will also add commands like attack and stuff at the bottom somewhere. Keep a look out, you will get shocked when its all completed!<br><TR>Users in the game: <font color=yellow>[counter] <br><font color=white>GMs online: <font color=gold>[gms]<TABLE CELLSPACING=10>"
			usr<<browse("[html]","window=announcements;size=344x344")
			usr.counter = {""}
			usr.gms = {""}
mob
	verb
		Announcement()
			set name = "Announcements"
			set category = "Extra"
			Announcements()
mob
	Bump(atom/O)  //Calls this when a person bumps into something
		if(istype(O,/obj/door))   //Checks to see if it is a door
			call(/obj/door/proc/tryit)(usr,O)  //Calls the process for asking for the password

obj
	door
		icon = 'turf.dmi'  //Gives the door a password
		icon_state = "doorshut"
		density = 1   //Make door solid  //Make it so you can't see through it
		proc/tryit(var/mob/m,var/obj/door/O)  //Procedure for asking for the password
			set background = 1
			call(/proc/open)(O)  //It calls the procedure for making the door open




proc/open(obj/door/O)
	set background = 1
	O.density = 0  //Allows you to walk through it
	O.opacity = 0  //Allows you to see past it
	flick("opening",O)  //Makes the door appear to be opening
	O.icon_state = "dooropen"  //Door stays open
	sleep(40)  //Waits a while before shutting the door
	flick("closing",O)
	O.icon_state = "doorshut"
	O.density = 1  //Makes it solid again  //Now you can't see inside it
client/Topic(href,href_list)
    ..()


mob/var
	speeding = 0
	rundelay = 4    //Set this to different settings to control how slow the mob walks.

client/Move()
	if(mob.speeding <= 0)
		..()
		sleep(mob.rundelay)
		mob.speeding = 0
	else
		return


mob/Login()
	speeding = 0
	..()
