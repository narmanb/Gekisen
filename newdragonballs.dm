var
	Dragonballx[7]
	Dragonbally[7]
	Dragonballgone=0
	creating=0
	dragonscatter1=0
	dbc=0
world
	proc
		DragonballLoop()
			set background = 1
			var/exists[7]
			exists[1]=0
			exists[2]=0
			exists[3]=0
			exists[4]=0
			exists[5]=0
			exists[6]=0
			exists[7]=0
			if(Dragonballgone>0)
				for(var/obj/dragonballs/X1 in world)
					X1.icon='dragonballout.dmi'
				Dragonballgone--
			else
				for(var/obj/dragonballs/X1 in world)
					X1.icon='dragonball.dmi'
			for(var/obj/dragonballs/earth1/O1 in world)
				exists[1]++
				if(exists[1]>1||dragonscatter1==1)
					del(O1)
			for(var/obj/dragonballs/earth2/O2 in world)
				exists[2]++
				if(exists[2]>1||dragonscatter1==1)
					del(O2)
			for(var/obj/dragonballs/earth3/O3 in world)
				exists[3]++
				if(exists[3]>1||dragonscatter1==1)
					del(O3)
			for(var/obj/dragonballs/earth4/O4 in world)
				exists[4]++
				if(exists[4]>1||dragonscatter1==1)
					del(O4)
			for(var/obj/dragonballs/earth5/O5 in world)
				exists[5]++
				if(exists[5]>1||dragonscatter1==1)
					del(O5)
			for(var/obj/dragonballs/earth6/O6 in world)
				exists[6]++
				if(exists[6]>1||dragonscatter1==1)
					del(O6)
			for(var/obj/dragonballs/earth7/O7 in world)
				exists[7]++
				if(exists[7]>1||dragonscatter1==1)
					del(O7)
			if(exists[1]==0)
				new/obj/dragonballs/earth1(locate(rand(1,300),rand(1,300),5))
			if(exists[2]==0)
				new/obj/dragonballs/earth2(locate(rand(1,150),rand(1,150),19))
			if(exists[3]==0)
				new/obj/dragonballs/earth3(locate(rand(1,300),rand(1,300),8))
			if(exists[4]==0)
				new/obj/dragonballs/earth4(locate(rand(1,150),rand(1,150),19))
			if(exists[5]==0)
				new/obj/dragonballs/earth5(locate(rand(1,150),rand(1,150),19))
			if(exists[6]==0)
				new/obj/dragonballs/earth6(locate(rand(1,300),rand(1,300),5))
			if(exists[7]==0)
				new/obj/dragonballs/earth7(locate(rand(1,300),rand(1,300),1))
				dragonscatter1=0
			for(var/obj/dragonballs/X in world)
				if(X.z==1||X.z==19||X.z==5||X.z==8||X.z!=1||X.z!=19||X.z!=5||X.z!=8)
					Dragonballx[text2num(X.icon_state)]=X.x
					Dragonbally[text2num(X.icon_state)]=X.y
				else if(X.z==0)
					for(var/mob/characters/M in world)
						for(var/obj/dragonballs/L in M.contents)
							if(X==L)
								if(X.z!=rand(200,150))
									Dragonballx[text2num(X.icon_state)]=M.x
									Dragonbally[text2num(X.icon_state)]=M.y
								else
									X.z = 1
									X.x=Dragonballx[text2num(X.icon_state)]
									X.y=Dragonbally[text2num(X.icon_state)]

				else
					X.z = 1
					X.x=Dragonballx[text2num(X.icon_state)]
					X.y=Dragonbally[text2num(X.icon_state)]
			sleep(30)
			spawn()world.DragonballLoop()
mob/danverb/verb/givedragonradar(mob/M as mob in world)
	set category = "Police"
	M.contents+= new/obj/dragonradar
mob/danverb/verb/dbrevive()
	set name = "Dragonball Revive"
	set category = "Police"
	if(Dragonballgone>0)
		Dragonballgone=0
	else
		return
mob/danverb/verb/openguildhouses()
	set category = "Police"
	if(guildunlocked==0)
		guildunlocked=1
		world<<"Guild Doors have become unlocked!"
	else
		guildunlocked=0
		world<<"Guild Doors have locked"
obj/dragonradar
	icon='dragonradar.dmi'
	verb
		Get()
			set category="Communication"
			set src in oview(1)
			Move(usr)
		Drop()
			set category="Communication"
			src.loc=locate(usr.x,usr.y,usr.z)
		Find_Dragonballs()
			set category="Communication"
			usr<<"<font color = yellow><b>DB1([Dragonballx[1]],[Dragonbally[1]],{Namek}) DB2([Dragonballx[2]],[Dragonbally[2]],{Dark}) DB3([Dragonballx[3]],[Dragonbally[3]],{Hell}) DB4([Dragonballx[4]],[Dragonbally[4]],{Dark}) DB5([Dragonballx[5]],[Dragonbally[5]],{Dark}) DB6([Dragonballx[6]],[Dragonbally[6]],{Namek}) DB7([Dragonballx[7]],[Dragonbally[7]],{Earth}) </b></font>"
//Ultimate Item Quests

obj/ultimates
	Majin
	ThirdEye
	MonkDots
	HolyWater
//End
obj/dragonball
	verb
		Eat()
			set category="Digest Outdated Item"
			usr<<"Yummy :)"
			usr.hp+=10
			del(src)
	dragonball1
		icon = 'dragonball.dmi'
		icon_state = "1"
		name = "Dragonball 1"

	dragonball2
		icon = 'dragonball.dmi'
		icon_state = "2"
		name = "Dragonball 2"
	dragonball3
		icon = 'dragonball.dmi'
		icon_state = "3"
		name = "Dragonball 3"
	dragonball4
		icon = 'dragonball.dmi'
		icon_state = "4"
		name = "Dragonball 4"
	dragonball5
		icon = 'dragonball.dmi'
		icon_state = "5"
		name = "Dragonball 5"
	dragonball6
		icon = 'dragonball.dmi'
		icon_state = "6"
		name = "Dragonball 6"
	dragonball7
		icon = 'dragonball.dmi'
		icon_state = "7"
		name = "Dragonball 7"

mob/proc/Playerwishloop()
	if(usr.wishtype)
		if(usr.wishdur>0)
			usr.wishdur-=3
			if(usr.wishtype==1)
				if(usr.powerlevel!=usr.maxpowerlevel*15)
					usr.powerlevel=usr.maxpowerlevel*15
			if(usr.wishtype==3)
				if(usr.stamina!=100)
					usr.stamina=100
		else
			usr.wishtype=0
	sleep(3)
	spawn()usr.Playerwishloop()
mob/var
	wishtype
	wishdur
obj
	Shenron/verb/Summon_Shenlong()
		Dragonballgone=1200
		var/dballs=0
		for(var/obj/dragonballs/S in usr.contents)
			dballs++
		if(dballs==7)
			usr.haswished=0
			dbc=1
			new /obj/balls(locate(usr.x,usr.y-0,usr.z))
			new /obj/dbdr(locate(usr.x,usr.y+1,usr.z))
			for(var/obj/dragonballs/O in world)
				var/randx = rand(1,300)
				var/randy= rand(1,300)
				O.loc=locate(randx,randy,1)
		for(var/obj/balls/C in world)
			if(dbc==1)
				if(C.z==1)
					for(var/area/outside/Y in world)
						Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						Y.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						Y.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						Y.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(1)
						Y.icon= 'black50.dmi'	// add the 50% dither
				if(C.z==5)
					for(var/area/outside2/D in world)
						D.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						D.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						D.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						D.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(1)
						D.icon= 'black50.dmi'	// add the 50% dither

				if(C.z==19)
					for(var/area/outside3/K in world)
						K.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						K.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						K.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						K.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(1)
						K.icon= 'black50.dmi'	// add the 50% dither

				if(C.z!=19||C.z!=5||C.z!=1)
					for(var/area/outside4/G in view(usr))

						G.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						G.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						G.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						G.icon= 'black25.dmi'	// add a 25% dither for a fading effect
						sleep(1)
						G.icon= 'black50.dmi'	// add the 50% dither

			switch(input("What will your wish be?") in list("Zenni","Power","Immortality","Stamina","Panties","Go to Kao-shins Planet"))
				if("Zenni")
					if(usr.haswished==0)
						usr.haswished=1
						usr.zenni+=rand(50000,350000)
						usr<<"Zenni rains from the sky! You catch a lot!"
				if("Power")
					if(usr.haswished==0)
						usr.haswished=1
						usr.wishtype=1
						usr.wishdur = 36000
				if("Immortality")
					if(usr.haswished==0)
						usr.haswished=1
						usr.wishtype=2
						usr.wishdur = 36000
				if("Stamina")
					if(usr.haswished==0)
						usr.haswished=1
						usr.wishtype=3
						usr.wishdur = 36000
				if("Panties")
					if(usr.haswished==0)
						usr.haswished=1
						usr<<"Panties appear in your inventory"
						usr.contents+=new/obj/Panties
				if ("Go to Kao-shins Planet")
					if(usr.haswished==0)
						usr.haswished=1
						usr.loc=locate(22,127,10)
						usr.icon_state = ""
						usr.density = 1
						usr.flight = 0
			usr.verbs -= /obj/Shenron/verb/Summon_Shenlong
			for(var/obj/balls/VA in world)
				del(VA)
			for(var/obj/dbdr/SA in world)
				del(SA)
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
			spawn(10)usr.haswished=0
			world.CdChecker()

obj/dragonballs/earth1
	icon = 'dragonball.dmi'
	icon_state = "1"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth2
	icon = 'dragonball.dmi'
	icon_state = "2"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth3
	icon = 'dragonball.dmi'
	icon_state = "3"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth4
	icon = 'dragonball.dmi'
	icon_state = "4"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth5
	icon = 'dragonball.dmi'
	icon_state = "5"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth6
	icon = 'dragonball.dmi'
	icon_state = "6"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()
obj/dragonballs/earth7
	icon = 'dragonball.dmi'
	icon_state = "7"
	verb
		Get()
			set src in oview(1)
			Move(usr)
			usr.checkdbz()
		Drop()
			src.loc=locate(usr.x,usr.y,usr.z)
			usr.checkdbz()

mob/proc/checkdbz()
	var/dballs=0
	for(var/obj/dragonballs/S in src.contents)
		dballs++
	if(dballs==7 && usr.haswished==0&& Dragonballgone<=0)
		usr.verbs += /obj/Shenron/verb/Summon_Shenlong
	else
		usr.verbs -= /obj/Shenron/verb/Summon_Shenlong




