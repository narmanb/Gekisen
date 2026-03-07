
//world/Del()
//	for(var/mob/characters/M in world)
//		spawn()
//			M.save()
//	sleep(50)
//	var/savefile/S=new("cr_full.ban")
//	S["key"] << crban_keylist
//	S["IP"] << crban_iplist
//	S["unban"] << crban_unbanned
//	..()
#define DEBUG
/*
var/findText == findtextEX
var/sortText == sorttextEX
var/findtextEX// = findText
var/sorttextEX// = sortText
var/ckeyEx// = cKey
var/cKey == ckeyEx
*/

obj
	var
		canstruggle=1
		alive=0
		pissofftrails=0
client
	script = "<STYLE>BODY {background: black; color: white}  IMG.icon{width:32;height:32}</STYLE>"
mob/characters
obj/proc
	trailoverlayrefresh(obj/M,mob/characters/sowner)

		var/obj/offsets/offset
		var/hasoverlay=0
		if(M.dir==NORTH)
			offset=new/obj/offsets/offsetdown32
			offset.icon=M.trail

		if(M.dir==SOUTH)
			offset=new/obj/offsets/offsetup32
			offset.icon=M.trail

		if(M.dir==EAST)
			offset=new/obj/offsets/offsetleft32
			offset.icon=M.trail

		if(M.dir==WEST)
			offset=new/obj/offsets/offsetright32
			offset.icon=M.trail

		while(M&&sowner)
			if(M.kistruggle==1)
				for(var/obj/dan_projectile/X in M.loc)
					if(X.istrail==1)
						del(X)
			if((abs(M.x-sowner.x) + abs(M.y-sowner.y))>1 && hasoverlay==0)
				sleep(1)
				M.overlays+=offset
				hasoverlay=1
			else if(hasoverlay&&M.kistruggle==0)
				sleep(2)
				M.overlays-=offset
				hasoverlay=0

			sleep(1)


proc
	Firestraight(obj/M,sicon,sdamage,sdir,mob/characters/sowner,strail,stepsleft,dontrelocate)
		if(dontrelocate!=1)
			M.x=sowner.x
			M.y=sowner.y

		M.pissofftrails=0
		M.alive=1
		var/delaylate=1
		M.z=sowner.z
		if(dontrelocate==1)
			delaylate=0

			M.pissofftrails=0
		M.kistruggle=0
		M.icon=sicon
		M.damage=sdamage
		M.owner=sowner
		var/mob/Mowner = M.owner
		Mowner.cantitto=1
		Mowner.timeout=0
		if(Mowner.client)
			Mowner.icon_state="ki"
		if(sdir==NORTH||sdir==SOUTH||sdir==EAST||sdir==WEST)
			M.dir=sdir
		if(sdir==NORTHEAST||sdir==NORTHWEST)
			M.dir=NORTH
		else if(sdir==SOUTHEAST|sdir==SOUTHWEST)
			M.dir=SOUTH
			Mowner.icon_state=""
		M.trail=strail
		M.stepsleft=stepsleft
		Mowner.kame=0

		var/tempowner=M.owner

		while(stepsleft>0 && M )
			if(M.kitype==2)
				spawn()M.trailoverlayrefresh(M,sowner)

			if(M.z!=Mowner.z)
				goto delete
			if(M)
				for(var/mob/O in get_step(M,M.dir))
					if(istype(O,/mob/characters)||istype(O,/mob/monsters))
						if(O!=M.owner&&O.fusebitch==0)
							M.Kishot(O)
					else
						M.Kihit(O)
				src=M
				if(M.kistruggle==1)
					walk(M,0)
					return
				if(M.kistruggle==0)
					walk(M,M.dir)
					sleep(1)
					spawn()Trailspawn(M,sowner)
					walk(M,0)
					if(delaylate==1)
						sleep(5)
						delaylate=0
					stepsleft-=1
				if(M)
					if(M.kistruggle==1)
						walk(M,0)
						return
		delete
		if(M.kistruggle==1)
			walk(M,0)
			return
		if(strail)
			killtrails(tempowner)
		if(strail)
			killtrails(tempowner)
		Mowner.timeout=0
		if(Mowner.client)
			Mowner.icon_state=""
		Mowner.kame=0
		Mowner.move=1
		Mowner.cantitto=0
		del(M)

proc
	Firestraights(obj/M,sicon,sdir,obj/Yowner,stepsleft)
		if(M)
			Yowner.x //Que?
			Yowner.y //Que?
		M.owner=Yowner
		var/mob/Mowner = M.owner //Que?
		if(sdir==NORTH||sdir==SOUTH||sdir==EAST||sdir==WEST)
			M.dir=sdir
		if(sdir==NORTHEAST||sdir==NORTHWEST)
			M.dir=NORTH
		else if(sdir==SOUTHEAST|sdir==SOUTHWEST)
			M.dir=SOUTH
		M.stepsleft=stepsleft



		var/tempowner=M.owner
		while(stepsleft>0 && M )
			if(M)
				sleep(5)
				goto delete
		delete
		if(M.kistruggle==1)
			walk(M,0)
			return
			killtrails(tempowner)
			killtrails(tempowner)
		if(M)
			sleep(6)
			del(M)
proc
	Trailspawn(obj/dan_projectile/M,mob/characters/sowner)
		if(M&&sowner)
			if(sowner.z!=M.z||abs(M.x-sowner.x)>20||abs(M.y-sowner.y)>20)
				spawn()killtrails2(sowner)
				return
			if(sowner.z!=M.z||abs(M.x-sowner.x)>20||abs(M.y-sowner.y)>20)
				spawn()killtrails2(sowner)
				return
			if(M.inactive==1)
				spawn()killtrails2(sowner)
				return
			var/strail=M.trail
			if(strail)
				if(M.pissofftrails<=0)
					var/obj/dan_projectile/trail
					var/obj/offset
					if(M.dir==NORTH)
						trail=new/obj/dan_projectile(locate(M.x,M.y-1,M.z))
						offset=new/obj/offsets/offsetdown10
						trail.reliant=M
					if(M.dir==SOUTH)
						trail=new/obj/dan_projectile(locate(M.x,M.y+1,M.z))
						offset=new/obj/offsets/offsetup10
						trail.reliant=M
					if(M.dir==EAST)
						trail=new/obj/dan_projectile(locate(M.x-1,M.y,M.z))
						offset=new/obj/offsets/offsetleft10
						trail.reliant=M
					if(M.dir==WEST)
						trail=new/obj/dan_projectile(locate(M.x+1,M.y,M.z))
						offset=new/obj/offsets/offsetright10
						trail.reliant=M
					if(trail.x!=sowner.x||trail.y!=sowner.y)
						if(M.x==sowner.x &&M.y==sowner.y)
							del(trail)
						else
							trail.icon=M.trail
							offset.icon=trail.icon
							trail.overlays+=offset
							trail.dir=M.dir
							trail.istrail=1
							trail.density=0
							trail.owner=sowner
					else
						del(trail)
					return
				else
					M.pissofftrails--
					return


obj/proc
	Kihit(obj/O)
		if(istype(O,/obj/dan_projectile))
			if (src:kitype==1&&O:kitype==1)
				var/P = new /obj/kiblob(src.loc)
				flick("expload",P)
				spawn()
					sleep(50)
					del(P)
				del(O)
				del(src)
			if(src:kitype==1&&O:kitype!=1)
				var/P = new /obj/kiblob(src.loc)
				flick("expload",P)
				spawn()
					sleep(50)
					del(P)
				del(src)
			if(src:kitype!=1&&O:kitype==1)
				var/P = new /obj/kiblob(O.loc)
				flick("expload",P)
				spawn()
					sleep(50)
					del(P)
				del(O)
			if(O:istrail!=1&&src:kitype!=1&&O:kitype!=1&&src:damage>0&&O:damage>0)
				src.kistruggle=1
				O:kistruggle=1
				if(O.dir==NORTH&&src.dir!=SOUTH||O.dir==SOUTH&&src.dir!=NORTH||O.dir==EAST&&src.dir!=WEST||O.dir==WEST&&src.dir!=EAST)
					return
				if(O.dir==NORTH)
					src.y=O.y+1
				if(O.dir==SOUTH)
					src.y=O.y-1
				if(O.dir==EAST)
					src.x=O.x+1
				if(O.dir==WEST)
					src.x=O.x-1
				Kistruggle(src,O)
		else
			if(istype(O,/obj/Destructable))
				spawn()
					for(var/obj/Destructable/Y in oview(3,src))
						if(Y.destructable==1)
							Y.oldstate=Y.icon_state
							var/I = new /mob/smoke(Y.loc)
							flick("smoke",I)
							spawn()
								sleep(50)
								del(I)
							Y.destructable=0
							Y.density=0
							Y.icon_state="[Y.icon_state]-destroyed"



mob
	proc
		Checktrails(obj/dan_projectile/M)


proc
	Fireonce(obj/M,sicon,sdamage,sdir,mob/sowner,strail,stepsleft)
		if(M)
			if(M.kistruggle==1)
				walk(M,M.dir)
				if(strail)
					var/obj/trail
					var/obj/offset
					if(M.dir==NORTH)
						trail=new/obj/dan_projectile(locate(sowner.x,sowner.y+1,sowner.z))
						offset=new/obj/offsets/offsetdown10
						offset.dir=M.dir
						offset.icon=trail.icon
					if(M.dir==SOUTH)
						trail=new/obj/dan_projectile(locate(sowner.x,sowner.y-1,sowner.z))
						offset=new/obj/offsets/offsetdown10
						offset.dir=M.dir
						offset.icon=trail.icon
					if(M.dir==EAST)
						trail=new/obj/dan_projectile(locate(sowner.x+1,sowner.y,sowner.z))
						offset=new/obj/offsets/offsetleft10
						offset.dir=M.dir
						offset.icon=trail.icon
					if(M.dir==WEST)
						trail=new/obj/dan_projectile(locate(sowner.x-1,sowner.y,sowner.z))
						offset=new/obj/offsets/offsetleft10
						offset.dir=M.dir
						offset.icon=trail.icon
					trail.overlays+=offset
					trail.dir=sdir
					trail.icon=strail
					trail.istrail=1
					trail.density=0
					spawn()
						while(M)
							sleep(3)
						del(trail)
					spawn()
						for(var/obj/dan_projectile/X in oview(15))
							spawn()
								if(X)
									if(X.owner==sowner)
										walk(X,M.dir)
										sleep(1)
										walk(X,0)
					trail.owner=M.owner
			sleep(1)
			walk(M,0)
obj
	var
		oldstate
		kistruggle=0
		trail
		stepsleft=0
		pwner
		istrail=0
		inactive=0
		ender=0
/*
atom
	Click()
		if(usr.move==1&&usr.timeout==0&&usr.frozen==0&&usr.clickmove==1)
			walk_towards(usr,src,1)
			sleep(1)
			walk(usr,0)
*/
atom/movable
	var
		damage=0
		kitype=0
		mob/characters/D
obj
	proc

		Kishot(mob/O)
			if(O.hp>=0||O)
			/*	var/powerratio = (src.owner:powerlevel)
				powerratio/=src.owner:maxpowerlevel
				powerratio/=2
				powerratio=150*/
				var/amount=(src.damage/(O.powerlevel+1))*150//flagy
				src.damage=0
				var/turf/Boundaries/Eastboundary/C
				if(O.block==1&&O.powerlevel>amount||O.blocks==1&&O.powerlevel>amount)
					O.blocks=0
					O.doomy=2
					O.random = rand(1,4)
					var/obj/Proj
					if(O.dir==NORTH||O.dir==EAST||O.dir==SOUTH||O.dir==WEST)
						Proj = new /obj/dan_projectile

					O.kame=0
					view(6) << "[O] reflects blast away"
					O.overlays+='electricity.dmi'
					O.overlays+='smokers.dmi'
					sleep(4)
					O.overlays-='electricity.dmi'
					O.overlays-='smokers.dmi'

					spawn()RemoveProc(src)
					spawn()killtrails2(src.owner)
				else
					O.hp-= amount
					var/I = new /mob/smoke(O.loc)
					flick("smoke",I)
					var/P = new /obj/kiblob(O.loc)
					flick("expload",P)
					sleep(4)
					del(I)
					O.doomy=1
					O.kame=0
					spawn()
						if(src.knockback)
							if(O.client&&O.doomy!=2||O.density==1&&O.doomy!=2)
								var/knockbackz=3*src.knockback
								spawn(10)O.knockbackproc(knockbackz,src.dir)
								src.knockback=0
								flick("smoke",I)
								O.doomy=1
								O.kame=0
								del(I)

				if(O.hp>=0)
					if(O.hp>=0)
						if(O.density==1&&O.doomy!=2)
							new /obj/crator(O.loc)
							//var/image/I = image('0smoke.dmi',O,"smoke",MOB_LAYER+9)
							if(usr.sounds==1)
								spawn()usr<<'sounds/expload.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'sounds/expload.wav'
				//	world<<I
				if(O.doomy==2)
					return
				else
					var/I = new /mob/smoke(O.loc)
					flick("smoke",I)
					spawn()
					sleep(5)
					del(I)
					O.doomy=1
					O.kame=0
					spawn()Killin(10)

				spawn()O.Die(src.owner)
				if(src.kitype==0)
					spawn()RemoveProc(src)
					spawn()killtrails2(src.owner)
atom/proc
	Killin(time)
		sleep(time)
		del(src)
obj/dan_projectile
	name= ""
	density=1
	layer=MOB_LAYER+3
	animate_movement=1
	var
		obj/reliant

	Del()
		if(src.istrail==0)
			src.alive=0
			src.invisibility=1
			src.loc=locate(1,1,7)
			for(var/obj/dan_projectile/O in world)
				if(O.reliant==src)
					O.invisibility=1
					O.icon=0
					O.loc=locate(0,0,0)
					del(O)
			sleep(1)
		else
			src.icon='blank.dmi'
			src.loc=locate(0,0,0)
			src.invisibility=1
			sleep(100)
		..()
	New()
		if(src.istrail==1)
			sleep(1)
			if(reliant)
				while(reliant.alive)
					sleep(1)
			src.invisibility=1
			src.icon='blank.dmi'
			del(src)
	Bump(atom/O)
		if(istype(O,/mob))
			src.density=0
			spawn(5)
			if(src)
				src.density=1
//obj
//	proc/Bumpki(obj/O)
		if(istype(O,/obj/dan_projectile)&&O)
			var/headon=0
			if(src.dir==NORTH&&O.dir==SOUTH)
				headon=1
			if(src.dir==SOUTH&&O.dir==NORTH)
				headon=1
			if(src.dir==WEST&&O.dir==EAST)
				headon=1
			if(src.dir==EAST&&O.dir==WEST)
				headon=1
			if(headon==1)
				if (src:kitype==1&&O:kitype==1)
					var/P = new /obj/kiblob(src.loc)
					flick("expload",P)
					spawn()
						sleep(50)
						del(P)
					del(O)
					del(src)
				if(src:kitype==1&&O:kitype!=1)
					var/P = new /obj/kiblob(src.loc)
					flick("expload",P)
					spawn()
						sleep(50)
						del(P)
					del(src)
				if(src:kitype!=1&&O:kitype==1)
					var/P = new /obj/kiblob(O.loc)
					flick("expload",P)
					spawn()
						sleep(50)
						del(P)
					del(O)

				if(O:istrail!=1&&src:kitype!=1&&O:kitype!=1&&src:damage>0&&O:damage>0&&src.kistruggle==0&&O:kistruggle==0)
					src.kistruggle=1
					O:kistruggle=1
					if(O.dir==NORTH&&src.dir!=SOUTH||O.dir==SOUTH&&src.dir!=NORTH||O.dir==EAST&&src.dir!=WEST||O.dir==WEST&&src.dir!=EAST)
						return
					if(O.dir==NORTH)
						src.y=O.y+1
					if(O.dir==SOUTH)
						src.y=O.y-1
					if(O.dir==EAST)
						src.x=O.x+1
					if(O.dir==WEST)
						src.x=O.x-1
					sleep(rand(1,4))

					Kistruggle(src,O)
			else
				src.density=0
				sleep(5)
				src.density=1
		else
			if(O)
				if(istype(O,/obj/Destructable))
					spawn()
						for(var/obj/Destructable/Y in oview(3,src))
							if(Y.destructable==1)
								Y.oldstate=Y.icon_state
								var/I = new /mob/smoke(Y.loc)
								flick("smoke",I)
								spawn()
									sleep(50)
									del(I)
								Y.destructable=0
								Y.density=0
								Y.icon_state="[Y.icon_state]-destroyed"

obj
	proc/Kistruggle(obj/dan_projectile/O,obj/dan_projectile/M)
		walk(M,0)
		walk(O,0)
		M.density=0
		O.density=0
		var/oinitial=O.damage
		var/minitial=M.damage
		var/totaldamage=O.damage+M.damage
		var/mob/characters/Oowner=O.owner
		var/mob/characters/Mowner=M.owner
		sleep(5)
		start
		if(O && M)
		/*	if(O.inactive)
				spawn()killtrails()
				spawn()Firestraight(M,M.icon,M.damage,M.dir,M.owner,M.trail,10)
				return
			if(M.inactive)
				spawn()killtrails()
				spawn()Firestraight(O,O.icon,O.damage,O.dir,O.owner,O.trail,10)
				return */
			if(!Oowner&&!Mowner)
				spawn()killtrails()
				spawn()RemoveProc(M)
				spawn()RemoveProc(O)
				M.kistruggle=0
				return
			if(!Mowner)
				O.damage=totaldamage
				spawn()killtrails()
				O.density=1
				O.kistruggle=0
				spawn()RemoveProc(M)
				spawn()Firestraight(O,O.icon,O.damage,O.dir,O.owner,O.trail,10,1)
			//	spawn()Leavekilock2(Oowner)
				return
			if(!Oowner)
				M.damage=totaldamage
				spawn()killtrails()
				spawn()RemoveProc(O)
				M.density=1
				M.kistruggle=0
				spawn()Firestraight(M,M.icon,M.damage,M.dir,M.owner,M.trail,10,1)
			//	spawn()Leavekilock(Mowner)
				return
			if(Oowner.z!=O.z)
				M.damage=totaldamage
				spawn()killtrails2(Oowner)
			//	spawn()killtrails2(Mowner)
				spawn()RemoveProc(O)
				M.density=1
				M.kistruggle=0
				spawn()Leavekilock2(Oowner)
				spawn()Firestraight(M,M.icon,M.damage,M.dir,M.owner,M.trail,10,1)
			//	spawn()Leavekilock(Mowner)
				return
			if(Mowner.z!=M.z)
				O.damage=totaldamage
			//	spawn()killtrails2(Oowner)
				spawn()killtrails2(Mowner)
				spawn()RemoveProc(M)
				O.density=1
				O.kistruggle=0
				spawn()Leavekilock2(Mowner)
				spawn()Firestraight(O,O.icon,O.damage,O.dir,O.owner,O.trail,10,1)
			//	spawn()Leavekilock(Oowner)
				return
			var/pdontpushM =0
			var/pdontpushO =0
			if(M.damage<=0)
				while(pdontpushM==0)
					if(((M.dir==NORTH||M.dir==SOUTH)&&abs(M.y-Mowner.y)<=2)||((M.dir==WEST||M.dir==EAST)&&abs(M.x-Mowner.x)<=2))
						pdontpushM=1
					if(pdontpushM==0)
						O.pushback(M)
					sleep(5)
				O.damage=totaldamage
			//	spawn()killtrails2(Oowner)

				O.density=1
				O.kistruggle=0
				spawn()RemoveProc(M)
				spawn()Leavekilock(Mowner)
				spawn()Firestraight(O,O.icon,O.damage,O.dir,O.owner,O.trail,10,1)
			//	spawn()Leavekilock2(Oowner)
				return
			if(O.damage<=0)
				while(pdontpushO==0)
					if(((O.dir==NORTH||O.dir==SOUTH)&&abs(O.y-Oowner.y)<=2)||((O.dir==WEST||O.dir==EAST)&&abs(O.x-Oowner.x)<=2))
						pdontpushO=1
					if(pdontpushO==0)
						M.pushback(O)
					sleep(5)
				M.damage=totaldamage

			//	spawn()killtrails2(Mowner)
				spawn()RemoveProc(O)
				M.density=1
				M.kistruggle=0
				spawn()Leavekilock(Oowner)

				spawn()Firestraight(M,M.icon,M.damage,M.dir,M.owner,M.trail,10,1)
			//	spawn()Leavekilock(Mowner)
				return
			var/dontpushM=0
			var/dontpushO=0
			if(((M.dir==NORTH||M.dir==SOUTH)&&abs(M.y-Mowner.y)<=2)||((M.dir==WEST||M.dir==EAST)&&abs(M.x-Mowner.x)<=2))
				dontpushM=1
			if(((O.dir==NORTH||O.dir==SOUTH)&&abs(O.y-Oowner.y)<=2)||((O.dir==WEST||O.dir==EAST)&&abs(O.x-Oowner.x)<=2))
				dontpushO=1
			if(O)
				if(O.damage>M.damage)
					if(dontpushM==0)
						O.pushback(M)
				else
					var/random=rand(1,3)
					if(random==3)
						if(dontpushM==0)
							O.pushback(M)
				O.damage-=minitial/10
			sleep(5)
			if(M)
				if(M.damage>O.damage)
					if(dontpushO==0)
						M.pushback(O)
				else
					var/random=rand(1,3)
					if(random==3)
						if(dontpushO==0)
							M.pushback(O)
				M.damage-=oinitial/10
			sleep(5)
		if(M&&Mowner.client)
			Mowner.icon_state="ki"
		if(O&&Oowner.client)
			Oowner.icon_state="ki"
		goto start
		sleep(150)
		if(M)
			Firestraight(M,M.icon,M.damage,M.dir,M.owner,M.trail,10,1)
			spawn()Leavekilock(Oowner)
		if(O)
			Firestraight(O,O.icon,O.damage,O.dir,O.owner,O.trail,10,1)
			spawn()Leavekilock(Mowner)
		return

proc
	killtrails()
		/*beaconfor(var/obj/dan_projectile/X in world)
			if(X.istrail==1)
				del(X)*/
proc
	killtrails2(mob/sowner)
		/*for(var/obj/dan_projectile/X in world)
			if(X.owner==sowner&&X.istrail==1)
				del(X)*/

proc
	killtrails3(mob/sowner)
		for(var/obj/dan_projectile/X in world)
			if(X.owner==sowner&&X.istrail==1)
				del(X)

proc
	KillAheadTrails(obj/dan_projectile/M)
		for(var/obj/dan_projectile/X in oview(15))
			if(X.owner==M.owner)
				if(M.dir==SOUTH)
					if(!X.y>M.y)
						del(X)
				if(M.dir==NORTH)
					if(!X.y<M.y)
						del(X)
				if(M.dir==WEST)
					if(!X.x>M.x)
						del(X)
				if(M.dir==EAST)
					if(!X.x<M.x)
						del(X)
obj
	proc
		pushback(obj/dan_projectile/M)
			if(M)
				if(src.dir==NORTH)
					M.y+=1
					src.y+=1
				if(src.dir==SOUTH)
					M.y-=1
					src.y-=1
				if(src.dir==WEST)
					M.x-=1
					src.x-=1
				if(src.dir==EAST)
					M.x+=1
					src.x+=1
			//	spawn()Trailspawn(M,M.owner)
				spawn()Trailspawn(src,src.owner)

proc
	Leavekilock(mob/M)
		if(M.client)
			M.timeout=0
			M.kame=0
			M.cantitto=0
			M.icon_state=""
proc
	Leavekilock2(mob/M)
		if(M.client)
			M.timeout=0
			M.kame=0
			M.cantitto=0
			M.icon_state=""
			spawn()killtrails2(M)
obj
	proc
		RemoveProc(obj/M)
			del(M)




