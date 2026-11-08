/*
mob/PC/verb/DodgeMove(var/mob/M)	//Used when dodge mode triggers by an attack
	var/goBehind=rand(1,2)
	usr << "[goBehind]"

	M = get_closest_mob(usr)
	if(M)
		usr << "<font color = red><b>[M] found"
	else
		usr << "no found"

	if(!M)	return
//	if(src.z!=M.z)	return
//	if(src.focusTraining)	return
	//if(M.z==2 || M.z==6 || M.z==3 || M.z==12)	return
//	if((M.x>=134 && M.x<=148) && (M.y>=24 && M.y<=38) && M.z==1)
//		if(tournament!="None")	goBehind=0
	var/dir2use=get_dir(usr,M)
	var/turf/newLoc=get_step(M,dir2use)
	if(!newLoc)	newLoc=usr.loc
	dir2use=get_dir(M,usr)
	if(goBehind && newLoc.Enter(usr))	usr.loc=newLoc
	else	usr.loc=M.loc
	usr.dir=dir2use
	flick("IT",usr)

//	if(dodgeMode!="Yes")	//anything other than a basic dodge
//		src.grabbed=M
//		M.GrabbedBy+=src
//		src.GrabProc()
//	if(dodgeMode=="Blast")	src.Ki_Blast()

*/


//mob/PC/verb/setdodgepoint()
mob/var/tmp/focus_stepCD=0
mob/PC/verb/DodgeDir(d as num)	//Used when dodge mode triggers by an attack
	set hidden = 1
	if(!src.learn_focusstep)
		return
	var/curki = round((usr.ki_control * usr.ki_max)/100)
	var/cost = ((curki * 0.08)*(usr.kiuse/100))+10000
	if(usr.dead)
		usr<<"You are dead."
		return
	if(usr.focus_stepCD)
		//usr << "You must wait a second before you can attack"
		return
	if(usr.doing||usr.buku)
		usr<<"You are doing something."
		return
	if(usr.frozen)
		usr<<"You can't move right now."
		return
	if(usr.ki<cost)
		usr<<"Your ki is too low."
		return
	if(usr.ki_lock)
		src << "You can't use ki right now."
		return
	if(usr.staminaleft>=usr.staminaleft_max)
		usr << "<font color=#ff0000>You are too tired to fight!</font>"
		return
	if(usr.safe)
		usr << "You can't attack right now."
		return
	if(!usr.pk)
		usr << "You are not a Combatant!"
		return
	if(usr.jailed)
		return
	if(usr.staminaleft+100>=usr.staminaleft_max)
		usr << "<font color=#ff0000>You are too tired to use focus step!</font>"
		return
//	if(!usr)	return
	var/turf/t
	switch(d)
		if(2)
			t=locate(usr.x,usr.y-3,usr.z)
		if(8)
			t=locate(usr.x,usr.y+3,usr.z)
		if(4)
			t=locate(usr.x-3,usr.y,usr.z)
		if(6)
			t=locate(usr.x+3,usr.y,usr.z)
//	if(t)
	//var/dir2use=get_dir(usr,M)
//	usr.frozen=1
	if(!t)
		return
	if(!t.x||!t.y||!t.z)
		return
	//world << "d: [d] t: [t] t.loc [t.loc]  t.x [t.x] t.y [t.y] t.z [t.z]"
//	if(!t.x||!t.y||t.z)
//		return
	if(t.density)
		return




//	if(!t.loc in get_step(usr,usr.dir))
//		usr << "Not in view"
//		return
//	if(!usr in view(t.loc))
//		usr << "Not in view"
//		return
	usr.ki-=cost
	flick("IT",usr)
	var/nx = t.x
	var/ny = t.y
	var/nz = t.z
	if(!nx||!ny||!nz)
		return
	var/obj/afterImage = new /obj()

	//var/obj/afterImage/afterImage=new
	afterImage.layer = MOB_LAYER + 5

	afterImage.icon=src.icon
//	afterImage.icon_state= "IT"//src.icon_state
	afterImage.overlays=src.overlays
	afterImage.underlays = src.underlays
	afterImage.dir=src.dir
	afterImage.loc = src.loc
//	afterImage.alpha = 100
//	var/randcolor = pick("BGR", "Polaroid", "GRB", "RBG", "BRG", "GBR")
	//var/ColorMatrix/c = new("sepia")
	var/ColorMatrix/c = new("greyscale")


//	animate(src, color = c.matrix, time = 10)
	animate(afterImage, alpha = 140, color = c.matrix, time = 1)
	spawn(7) afterImage.disappearimage()

	spawn(-1) usr.dir = get_dir(usr,t)
	if(usr.dead)
		AdminMessage("[usr]([usr.key]) focus step glitch dead: [usr.dead] x y x: [usr.x],[usr.y],[usr.z]")
		return
	usr.loc=locate(nx,ny,nz)
	//usr.dir = d
	if(usr.pvpflagged)
		usr.staminaleft += 100


	//usr.Move(t.loc)
	//usr.Move(t.x,t.y,t.z)
	//	usr.loc=locate(t.x,t.y,t.z)
	//usr.loc=locate(t.x,t.y,t.z)
	//usr.loc = t.loc
		//usr.loc = t.loc



//	usr.frozen=0
	//var/turf/O=X

	//			if(istype(O,/turf))
	//				if(!O.x||!O.y||!O.z)


/*

						for(var/mob/N in get_step(src,src.dir))
							if(N)

								stopdash=30
								M = N
								view(src)<<"[src] slammed into [M]!"
								src.move_delay=0.6
								break
						//sleep(1)

						var/obj/afterImage = new /obj()

						//var/obj/afterImage/afterImage=new
						afterImage.layer = MOB_LAYER + 5

						afterImage.icon=src.icon
						afterImage.icon_state= "IT"//src.icon_state
						afterImage.overlays=src.overlays
						afterImage.underlays = src.underlays
						afterImage.dir=src.dir
						afterImage.loc = src.loc
						spawn() afterImage.disappearimage()

				var/turf/t
				var/mob/y
				switch(src.dir)
					if(SOUTH)
						t=locate(src.x,src.y-16,src.z)
					if(NORTH)
						t=locate(src.x,src.y+16,src.z)
					if(WEST)
						t=locate(src.x-16,src.y,src.z)
					if(EAST)
						t=locate(src.x+16,src.y,src.z)

						*/