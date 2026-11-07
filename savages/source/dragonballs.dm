obj/dragonballs/earth1
	icon = 'dragonball.dmi'
	icon_state = "1"
	verb/Get()
		if (usr.gotdb1==0)
			set src in oview(1)

			usr.gotdb1=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth2
	icon = 'dragonball.dmi'
	icon_state = "2"
	verb/Get()
		if (usr.gotdb2==0)
			set src in oview(1)

			usr.gotdb2=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth3
	icon = 'dragonball.dmi'
	icon_state = "3"
	verb/Get()
		if (usr.gotdb3==0)
			set src in oview(1)

			usr.gotdb3=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth4
	icon = 'dragonball.dmi'
	icon_state = "4"
	verb/Get()
		if (usr.gotdb4==0)
			set src in oview(1)

			usr.gotdb4=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth5
	icon = 'dragonball.dmi'
	icon_state = "5"
	verb/Get()
		if (usr.gotdb5==0)
			set src in oview(1)

			usr.gotdb5=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth6
	icon = 'dragonball.dmi'
	icon_state = "6"
	verb/Get()
		if (usr.gotdb6==0)
			set src in oview(1)

			usr.gotdb6=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"
obj/dragonballs/earth7
	icon = 'dragonball.dmi'
	icon_state = "7"
	verb/Get()
		if (usr.gotdb7==0)
			set src in oview(1)

			usr.gotdb7=1
			checkdbz()
			src.loc = locate(0,0,0)
			sleep(10000)
			var/x = rand(1,150)
			var/y = rand(1,150)
			src.loc = locate(x,y,1)
		else
			usr<< "You have this one already"

proc/checkdbz()
	usr.earthballs= (usr.gotdb1+usr.gotdb2+usr.gotdb3+usr.gotdb4+usr.gotdb5+usr.gotdb6+usr.gotdb7)
	if(usr.gotdb1==1 && usr.gotdb2==1 && usr.gotdb3==1 && usr.gotdb4==1 && usr.gotdb5==1 && usr.gotdb6==1 && usr.gotdb7==1 && usr.haswished==0)
		usr.verbs += /mob/dbz/verb/Summon_Shenlong
	else
		usr.verbs-= /mob/dbz/verb/Summon_Shenlong

mob/dbz/verb
	Summon_Shenlong()
		usr.verbs -= /mob/dbz/verb/Summon_Shenlong
		usr.random = 2
		dostuff
		if(usr.random == 0)
			usr << "BWAHHHHHHH.....your wishes are complete..."
			usr.gotdb1=0
			usr.gotdb2=0
			usr.gotdb3=0
			usr.gotdb4=0
			usr.gotdb5=0
			usr.gotdb6=0
			usr.gotdb7=0
			usr.earthballs=0
			haswished=1
			return
		else
			usr.random -= 1
			switch(input("What will your wish be?") in list("Power","Zenni","Restore World","Kill Someone","Revive Someone","Go to Kao-shins Planet"))
				if("Power")
					usr.maxpowerlevel += rand(10000,50000)
					usr << "<b>You sense your power increasing greatly!"
				if("Zenni")
					usr.zenni += rand(10000,50000)
					usr << "<b>A pile of zenni falls on you."
				if("Restore World")
					for(var/mob/characters/M in world)
						M << "<b>A bright light shines from above as you feel regenerated!"
						M.powerlevel = M.maxpowerlevel
						M.stamina = 100
				if("Kill Someone")
					var/alreadykilled = 0
					for(var/mob/M in world)
						if(M.key)
							if(M.gm == 0||M.gm == null)
								if(alreadykilled == 0)
									switch(alert(usr,"Do you wish to let [M] be killed?","Confirmation","Yes","No"))
										if("Yes")
											M.powerlevel = 0
											M.Die()
											alreadykilled = 1
				if("Revive Someone")
					var/alreadyrevived = 0
					for(var/mob/M in world)
						if(M.key)
							if(M.gm == 0||M.gm == null)
								if(alreadyrevived == 0)
									switch(alert(usr,"Do you wish to let [M] be revived?","Confirmation","Yes","No"))
										if("Yes")
											if(M.dead == 1)
												M.powerlevel = M.maxpowerlevel
												M.dead = 0
												M.overlays -= /obj/halo
												M.overlays -= 'halo.dmi'
												M.overlays -= /obj/halo
												M.overlays -= 'halo.dmi'
												M.overlays -= /obj/halo
												M.overlays -= 'halo.dmi'
												M.loc=locate(70,85,1)
												alreadyrevived = 1
											else
												usr << "[M] is already alive."

				if ("Go to Kao-shins Planet")
					usr.loc=locate(22,127,10)
					usr.icon_state = ""
					usr.density = 1
					usr.flight = 0

			goto dostuff