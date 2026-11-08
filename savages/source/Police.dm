
proc/BanGuy(mob/M as mob)//This is a ban code along with a bancheck to see if ur banned victims tried to login and when they do they are deleted instantly
	var/savefile/F = new("Bans.sav")//makes new savefile of people you had banned
	F["[M.key]"] << M.key
proc/CheckBan(mob/M as mob)
	var/savefile/F = new("Bans.sav")
	var/checking
	F["[M.key]"] >> checking
	if(M.key == checking)
		M << "You have been banned!"
		del(M)


//Special SSJ People
mob
	Login()
		..()
		if(src.key == "Dragonslayer4000")
			usr.attribute = "Legendary"
			if(src.race == "Saiya-jin")
				src.alignment = "Good"
				src.overlays = 0
				src.overlays +=  'hair_black_spikey.dmi'
				src.gonessj = 1
				src.ssj = 0
			src.level += 1000
			there
			client.SaveMob()
			usr << "Auto-Saving Character..."
			sleep(10)
			usr << "Auto-Save Complete"
			sleep(500)
			goto there
		else
			if(src.race == "Bio-Android Cell")
				src.contents += new /obj/cellabsorb


mob
	Login()
		powerlevelRefresh(src)
		if(src.key == "Dragonslayer4000"||src.key == "ZARZAK"||src.key == "")//key for the admin verbs to go to replace mine with yours
			if(src.name == ""||src.name == ""||src.name == "")
				src.icon ='Ocean Freeze.dmi'
				src.overlays ='tail.dmi'
				usr.faceicon ='magus.bmp'
				src.state = "Normal"
				src.contents += new /obj/ktrans

			else
				src.powerlevel += 180000
				src.will += 100
				src.honor += 100
				src.purity += 100
				src.race = ""
				src.powerlevel += 0
			src.verbs += /mob/Admin/verb/GM_geticon

			src.attribute = "Enforcer"
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.gm = 1
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0
			src << "Note: have fun with this game."
			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)

		else
			src.powerlevel += 0
		..()
//All players
mob/Login()
	src.loc=locate(70,95,1)
	src.npp=0
	src.flight = 0
	src.kame=0
	src.move = 1
	src.ko = 0
	src.blocking = 0
	src.ptime = 0
	src.kiin = 0
	src.grav = 0
	src.combo = 0
	src.angered = 0
//	src.oicon = src.icon
	src.powerlevel = src.maxpowerlevel
	src.tech = 0
	src.gainzenni = 0
	src.slap = 0
	src.spar = 0
	src.icon_state = ""
	src.gm = 0
	src.ased = 0
	src.absorb = 0
	src.flight = 0
	src.talk = 1
	src.training = 0
	src.density = 1
	src.safe = 0
	src.meditate = 0
	if(usr.race=="Bio-Android")
		src.contents+= new /obj/Absorb
	if(src.race == "Bio-Android Cell")
		src.contents += new /obj/cellabsorb
//Master GM
mob
	Login()
		CheckBan(src)
		if(src.key=="RaeKwon")
			src << "Get our you faggot"

			del(src)

		if(src.key == "Dragonslayer4000"||src.key == "ZARZAK"||src.key=="Spuppydog14" ||src.key == "X-SSJ4Goku-x"||src.key == "San-Vegetto"||src.key == ""||src.key == ""||src.key == "")
			if(src.name == ""||src.name == ""||src.name==""||src.name=="")
				src.contents += new /obj/ktrans
			src.verbs += /mob/Admin/verb/Dragonball_Summon
			src.verbs += /mob/Admin/verb/Dragonball_Scat
			src.verbs += /mob/Admin/verb/Create
			src.verbs += /mob/Admin/verb/Adminendbudokai
			src.verbs += /mob/Admin/verb/Adminstartbudokai
			src.verbs += /mob/Admin/verb/Deny
			src.verbs += /mob/Admin/verb/Boot
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/AdminKill
			src.verbs += /mob/Admin/verb/DragonballWorldID
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Edit
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/AllSay
			src.verbs += /mob/Admin/verb/PoliceSay
			src.verbs += /mob/Admin/verb/Revive
			src.contents += new /obj/GogetaArmor
			src.verbs += /mob/Admin/verb/PowerBoost
			src.verbs += /mob/Admin/verb/Restore
			src.verbs += /mob/Admin/verb/Purify
			src.verbs += /mob/Admin/verb/Inform
			src.verbs += /mob/Admin/verb/Prices
			src.verbs += /mob/Admin/verb/GiveSSJ
			src.verbs += /mob/Admin/verb/Create
			src.verbs += /mob/Admin/verb/Beetchshlap
			src.verbs += /mob/Admin/verb/MakeBuu
			src.verbs += /mob/Admin/verb/AdminLogout
			src.verbs += /mob/Admin/verb/Reboot
			src.verbs += /mob/Admin/verb/PowerHungrah
			src.verbs += /mob/Admin/verb/sfc
			src.verbs += /mob/Admin/verb/Delete
			src.verbs += /mob/Admin/verb/MadSkills
			src.verbs += /mob/Admin/verb/Funkalize
			src.verbs += /mob/Admin/verb/FunkalizeO
			src.verbs += /mob/Admin/verb/FunkalizeT
			src.verbs += /mob/Admin/verb/Ban
			src.verbs += /mob/Admin/verb/Music
			src.verbs += /mob/Admin/verb/Stop_Music
			src.verbs += /mob/Admin/verb/GM_Giving
			src.verbs += /mob/Admin/verb/Add_Overlay
			src.verbs += /mob/Admin/verb/Add_Underlay
			src.verbs += /mob/Admin/verb/Remove_Overlay
			src.verbs += /mob/Admin/verb/Remove_Underlay
			src.verbs += /mob/Admin/verb/GM_geticon
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.oocname = "Master God"
			src.gm = 1
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0
			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)
mob
	Login()
		..()
		Log(src)
		Checkclan(src)
		CheckBan(src)
		if(src.gmlevel == 4)
			src.verbs += /mob/Admin/verb/Create
			src.verbs += /mob/Admin/verb/Deny
			src.verbs += /mob/Admin/verb/Boot
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/AdminKill
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Edit
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/AllSay
			src.verbs += /mob/Admin/verb/Revive
			src.verbs += /mob/Admin/verb/Adminendbudokai
			src.verbs += /mob/Admin/verb/Adminstartbudokai
			src.verbs += /mob/Admin/verb/PowerBoost
			src.verbs += /mob/Admin/verb/Restore
			src.verbs += /mob/Admin/verb/Purify
			src.verbs += /mob/Admin/verb/Inform
			src.verbs += /mob/Admin/verb/Prices
			src.verbs += /mob/Admin/verb/GiveSSJ
			src.verbs += /mob/Admin/verb/Create
			src.verbs += /mob/Admin/verb/Beetchshlap
			src.verbs += /mob/Admin/verb/MakeBuu
			src.verbs += /mob/Admin/verb/Reboot
			src.verbs += /mob/Admin/verb/PowerHungrah
			src.verbs += /mob/Admin/verb/sfc
			src.verbs += /mob/Admin/verb/Delete
			src.verbs += /mob/Admin/verb/MadSkills
			src.verbs += /mob/Admin/verb/Ban
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.oocname = "Level 4 God"
			src.gm = 1
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0
			world<< "<tt><font color = green>{{**<font color = white>[name] has logged in!<font color = green>**}}</tt>"
			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)
		if(src.gmlevel == 3)
			src.verbs += /mob/Admin/verb/Deny
			src.verbs += /mob/Admin/verb/Boot
			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Edit
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/AllSay
			src.verbs += /mob/Admin/verb/Revive
			src.verbs += /mob/Admin/verb/PowerBoost
			src.verbs += /mob/Admin/verb/Adminendbudokai
			src.verbs += /mob/Admin/verb/Adminstartbudokai
			src.verbs += /mob/Admin/verb/Restore
			src.verbs += /mob/Admin/verb/Inform
			src.verbs += /mob/Admin/verb/Reboot
			src.verbs += /mob/Admin/verb/sfc
			src.verbs += /mob/Admin/verb/Delete
			src.verbs += /mob/Admin/verb/Ban
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.oocname = "Level 3 God"
			src.gm = 1
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0

			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)
		if(src.gmlevel == 2)
			src.verbs += /mob/Admin/verb/Deny
			src.verbs += /mob/Admin/verb/Boot
			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Edit
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/AllSay
			src.verbs += /mob/Admin/verb/Revive
			src.verbs += /mob/Admin/verb/Restore
			src.verbs += /mob/Admin/verb/Inform
			src.verbs += /mob/Admin/verb/Reboot
			src.verbs += /mob/Admin/verb/sfc
			src.verbs += /mob/Admin/verb/Delete
			src.verbs += /mob/Admin/verb/Ban
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.oocname = "Level 2 God"
			src.gm = 1
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0

			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)
		if(src.gmlevel == 1)
			src.verbs += /mob/Admin/verb/Deny

			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/Inform

			src.verbs += /mob/Admin/verb/Ban
			src.loc=locate(70,85,1)
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.combo = 0
			src.angered = 0
			src.oicon = src.icon
			src.powerlevel = src.maxpowerlevel
			src.tech = 0
			src.gainzenni = 0
			src.slap = 0
			src.spar = 0
			src.icon_state = ""
			src.oocname = "Level 1 God"
			src.gm = 1
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0

			if(usr.race == "Android"||usr.race == "Biological Android")
				usr.loc=locate(56,111,3)
mob/Admin
	verb
		Add_Overlay(mob/M as mob in world, I as icon)
			set category = "Police"
			M.overlays += I
		Remove_Overlay(mob/M as mob in world, I as icon)
			set category = "Police"
			M.overlays -= I
		Add_Underlay(mob/M as mob in world, I as icon)
			set category = "Police"
			M.underlays += I
		Remove_Underlay(mob/M as mob in world, I as icon)
			set category = "Police"
			M.underlays -= I
		Dragonball_Summon()
			set category = "Police"
			for(var/obj/dragonballs/O in world)
				O.loc = locate(usr.x,usr.y-1,usr.z)
			world << "All the Dragonballs float to [usr]!"
		Dragonball_Scat()
			set category = "Police"
			for(var/obj/dragonballs/O in world)
				var/x = rand(1,150)
				var/y = rand(1,150)
				O.loc = locate(x,y,1)
			world << "All the Dragonballs are scattering thanks to [usr]!"
		GM_Giving(mob/characters/M in world)
			set category = "Police"
			switch(input("What type, what level, etc.") in list("TEMP Level 1","PERM Level 1","PERM Level 2","PERM Level 3","PERM Level 4","Remove GM"))
				if("TEMP Level 1")
					M.verbs += /mob/Admin/verb/Deny

					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/Inform


					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Level 1 God"
					M.gm = 0
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Temporary Level 1 God</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
				if("PERM Level 1")
					M.verbs += /mob/Admin/verb/Deny

					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/Inform


					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Level 1 God"
					M.gm = 1
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Permanant Level 1 God</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
					M.gmlevel = 1
				if("PERM Level 2")
					M.verbs += /mob/Admin/verb/Deny
					M.verbs += /mob/Admin/verb/Boot
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Edit
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/AllSay
					M.verbs += /mob/Admin/verb/Revive
					M.verbs += /mob/Admin/verb/Restore
					M.verbs += /mob/Admin/verb/Inform

					M.verbs += /mob/Admin/verb/sfc
					M.verbs += /mob/Admin/verb/Delete

					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Level 2 God"
					M.gm = 1
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Permanant Level 2 God</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
					M.gmlevel = 2
				if("PERM Level 3")
					M.verbs += /mob/Admin/verb/Deny
					M.verbs += /mob/Admin/verb/Boot
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Edit
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/AllSay
					M.verbs += /mob/Admin/verb/Revive
					M.verbs += /mob/Admin/verb/PowerBoost
					M.verbs += /mob/Admin/verb/Restore
					M.verbs += /mob/Admin/verb/Inform

					M.verbs += /mob/Admin/verb/sfc
					M.verbs += /mob/Admin/verb/Delete

					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Level 3 God"
					M.gm = 1
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Permanant Level 3 God</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
					M.gmlevel = 3
				if("PERM Level 4")
					M.verbs += /mob/Admin/verb/Create
					M.verbs += /mob/Admin/verb/Deny
					M.verbs += /mob/Admin/verb/Boot
					M.verbs += /mob/Admin/verb/Special_Announce
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/AdminKill
					M.verbs += /mob/Admin/verb/Special_Announce
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Edit
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/AllSay
					M.verbs += /mob/Admin/verb/Revive
					M.verbs += /mob/Admin/verb/PowerBoost
					M.verbs += /mob/Admin/verb/Restore
					M.verbs += /mob/Admin/verb/Purify
					M.verbs += /mob/Admin/verb/Inform
					M.verbs += /mob/Admin/verb/Prices
					M.verbs += /mob/Admin/verb/GiveSSJ
					M.verbs += /mob/Admin/verb/Create

					M.verbs += /mob/Admin/verb/MakeBuu

					M.verbs += /mob/Admin/verb/PowerHungrah
					M.verbs += /mob/Admin/verb/sfc
					M.verbs += /mob/Admin/verb/Delete
					M.verbs += /mob/Admin/verb/MadSkills
					M.verbs += /mob/Admin/verb/Ban
					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Level 4 God"
					M.gm = 1
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Permanant Level 4 God</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
					M.gmlevel = 4
				if("Remove GM")
					M.verbs -= /mob/Admin/verb/Create
					M.verbs -= /mob/Admin/verb/Deny
					M.verbs -= /mob/Admin/verb/Boot
					M.verbs -= /mob/Admin/verb/Special_Announce
					M.verbs -= /mob/Admin/verb/AdminTeleport
					M.verbs -= /mob/Admin/verb/AdminKill
					M.verbs -= /mob/Admin/verb/Special_Announce
					M.verbs -= /mob/Admin/verb/Summon
					M.verbs -= /mob/Admin/verb/Edit
					M.verbs -= /mob/Admin/verb/Rename
					M.verbs -= /mob/Admin/verb/AllSay
					M.verbs -= /mob/Admin/verb/Revive
					M.verbs -= /mob/Admin/verb/PowerBoost
					M.verbs -= /mob/Admin/verb/Restore
					M.verbs -= /mob/Admin/verb/Purify
					M.verbs -= /mob/Admin/verb/Inform
					M.verbs -= /mob/Admin/verb/Prices
					M.verbs -= /mob/Admin/verb/GiveSSJ
					M.verbs -= /mob/Admin/verb/Create
					M.verbs -= /mob/Admin/verb/Beetchshlap
					M.verbs -= /mob/Admin/verb/MakeBuu
					M.verbs -= /mob/Admin/verb/Reboot
					M.verbs -= /mob/Admin/verb/PowerHungrah
					M.verbs -= /mob/Admin/verb/sfc
					M.verbs -= /mob/Admin/verb/Delete
					M.verbs -= /mob/Admin/verb/MadSkills
					M.verbs -= /mob/Admin/verb/Ban
					M.loc=locate(70,85,1)
					M.move = 1
					M.ko = 0
					M.blocking = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.oicon = M.icon
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.spar = 0
					M.icon_state = ""
					M.oocname = "Player"
					M.gm = 0
					world << "<tt><font color = green>[M] is now non-gm</tt>"
					M.gmlevel = 0
		Music(S as sound)
			set category = "Police"
			world << sound(S,1)
		Sound(S as sound)
			set category = "Police"
			world << sound(S,0)
		Stop_Music()
			set category = "Police"
			world << sound(null)
		Boot(mob/M in world,reason as message|null)//this will kick an unruly person off your server
			if(usr.client)
				set category = "Police"
				set name = "Boot"
				set desc="(mob, \[reason]) Boot A Bastard"
				if(M == usr)
					usr << "<b>You can't boot yourself!"
					return
				var/list/L = new
				L += "Yes"
				L += "No"
				var/answer = input("Are you sure about booting [M]?") in L
				switch(answer)
					if("Yes")
						M << "You have been booted by [src] because [reason]"
						del(M)
					if("No")
						src << "You changed your mind, hehe!"
			else
				usr << "<b>You can't ban npcs."

		Reboot()//this will reboot your server
			set name="Police Reboot"
			set category="Police"
			world << "<b><i><u><font face=arial><font color=blue><font size=4>Server Rebooting in 5 Seconds!"
			sleep(50)
			world.Reboot()


		Special_Announce(message as message)//this is too make a special announcement
			set category = "Police"
			set name = "Police Announce"
			set desc = "(message) Announce something to all players logged in"
			for(var/mob/characters/M in world)
				M<< "<hr><center><font color=red><b><font size='+1'> Officer [usr] would like to announce:<br></font>\blue [message]</center><hr>"
		AdminTeleport(M as mob in world)//this will teleport you to any mob on the server including the ones you coded in
			set category = "Police"
			set name="Police Teleport"
			usr.x = M:x
			usr.y = M:y-1
			usr.z = M:z
			usr << "You go infront of [M]"
			view(6) << "<b>[usr] jumps out of your pocket!!"

		AdminKill(mob/M as mob in world)//kill someone right in front of you instantly
			set category = "Police"
			set name="Police Kill"
			M.powerlevel = 0
			M.health = 0
			M.Die()

		AdminLogout()//close your server in one click while giving time to let players logout
			set category="Police"
			set name="Police Logout"
			world<<"<b><i><u><font face=arial><font color=red><font size=5>SERVER CLOSING IN 20 SECONDS!!"
			sleep(200)
			world<< "Wurd."
			Logout()
		Adminstartbudokai()
			set category="Police"
			set name= "Budokai Start"
			for(var/mob/characters/M in world)
				M.verbs += new /mob/Admin/verb/Join_Budokai
				M.verbs += new /mob/Admin/verb/Leave_Budokai
			world << "<b> Announcement:</b> The Budokai is Open! Join if you dare!"
		Adminendbudokai()
			set category="Police"
			set name= "Budokai End"
			for(var/mob/characters/M in world)
				if(M.enterdintourney == 1)
					M.enterdintourney = 0
					M.intourney = 0
					M.loc = locate(74,57,1)
				M.verbs -= new /mob/Admin/verb/Join_Budokai
				M.verbs -= new /mob/Admin/verb/Leave_Budokai
			world << "<b> Announcement:</b> The Budokai is Closed! Everyone OUT!"
		Join_Budokai()
			set category="Extra"
			set name="Join Budokai"
			if(usr.enterdintourney == 0)
				world << "<b>Announcement:<b> [usr.name] has entered the Budokai!"
				usr.enterdintourney = 1
				usr.intourney = 0
				usr << "Once you reach the arena you will be teleported in the ring"
				return
			else
				usr << "You've already entered"
		Leave_Budokai()
			set category="Extra"
			set name="Leave Budokai"
			if(usr.enterdintourney == 1)
				world << "<b>Announcement:<b> [usr.name] has left the Budokai!"
				usr.enterdintourney = 0
				usr.intourney = 0
				usr.loc = locate(74,57,1)
				return
			else
				usr << "You've already entered"
		DragonballWorldID(worldid as text)
			set category="Police"
			set desc="Change The World's ID"
			world.name=worldid
		Summon(mob/characters/M in world)
			set category = "Police"
			M << "<b>Officer [usr] has summoned you."
			M:loc = usr.loc
			M:y -= 1
			M.safe = 0

		Edit(obj/O as obj|mob|turf|area in view())
			set category = "Police"
			set desc="(target) Edit a target item's variables"
			var/variable = input("Which var?","Var") in O.vars
			var/default
			var/typeof = O.vars[variable]
			var/dir
			if(variable == "gmlevel")
				usr << "The Master GMs have disabled the var GMLEVEL from changing. This is a GM variable."
				return
			if(isnull(typeof))
				usr << "Unable to determine variable type."

			else if(isnum(typeof))
				usr << "Variable appears to be <b>NUM</b>."
				default = "num"
				dir = 1

			else if(istext(typeof))
				usr << "Variable appears to be <b>TEXT</b>."
				default = "text"

			else if(isloc(typeof))
				usr << "Variable appears to be <b>REFERENCE</b>."
				default = "reference"

			else if(isicon(typeof))
				usr << "Variable appears to be <b>ICON</b>."
				typeof = "\icon[typeof]"
				default = "icon"

			else if(istype(typeof,/atom) || istype(typeof,/datum))
				usr << "Variable appears to be <b>TYPE</b>."
				default = "type"

			else if(istype(typeof,/list))
				usr << "Variable appears to be <b>LIST</b>."
				default = "cancel"

			else if(istype(typeof,/client))
				usr << "Variable appears to be <b>CLIENT</b>."
				default = "cancel"

			else
				usr << "Variable appears to be <b>FILE</b>."
				default = "file"

			usr << "Variable contains: [typeof]"
			if(dir)
				switch(typeof)
					if(1)
						dir = "NORTH"
					if(2)
						dir = "SOUTH"
					if(4)
						dir = "EAST"
					if(8)
						dir = "WEST"
					if(5)
						dir = "NORTHEAST"
					if(6)
						dir = "SOUTHEAST"
					if(9)
						dir = "NORTHWEST"
					if(10)
						dir = "SOUTHWEST"
					else
						dir = null
				if(dir)
					usr << "If a direction, direction is: [dir]"
			var/class = input("What kind of variable?","Variable Type",default) in list("text",
				"num","type","reference","icon","file","restore to default","cancel")

			switch(class)
				if("cancel")
					return

				if("restore to default")
					O.vars[variable] = initial(O.vars[variable])

				if("text")
					O.vars[variable] = input("Enter new text:","Text",\
						O.vars[variable]) as text

				if("num")
					O.vars[variable] = input("Enter new number:","Num",\
						O.vars[variable]) as num

				if("type")
					O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
						in typesof(/obj,/mob,/area,/turf)

				if("reference")
					O.vars[variable] = input("Select reference:","Reference",\
						O.vars[variable]) as mob|obj|turf|area in world

				if("file")
					O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
						as file

				if("icon")
					O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
						as icon

		Rename(mob/M as mob in world, ID as text)
			set category="Police"
			set desc="Change A Mob's ID"
			M.name=ID

		PowerBoost(mob/characters/M as mob in world)
			set category = "Police"
			set name = "Power Boost"
			set desc = "Boost a mobs power."
			M.maxpowerlevel = (usr.maxpowerlevel * 2)
			M.maxpowerlevel = round(usr.maxpowerlevel)
			M.powerlevel = usr.maxpowerlevel
			M << "<b>You have been rewarded!"

		Restore()
			set category = "Police"
			set name = "Restore All"
			for(var/mob/characters/M in world)
				M << "<b>A bright light shines from above as you feel regenerated!"
				M.powerlevel = M.maxpowerlevel
				M.stamina = 100
		Purify(mob/M in world)
			set category = "Police"
			M.alignment = "Good"
			M.loc=locate(71,71,1)
			M.safe = 0
			M << "<b>You feel that you can now be good!</b>"

		GiveSSJ(mob/M in world)
			set category = "Police"
			M.contents += new /obj/ssj
			M.gonessj = 1
			M.ssj = 0
			M.maxpowerlevel += 100000


		Create()
			set category = "Police"
			var/meeb= input("What do you want to make?","Uh-Mee-Bah") in typesof(/mob,/obj)
			new meeb(locate(usr.x,usr.y-1,usr.z))
			switch(input("Wish to COLORIZE?", "Colorize") in list ("Yes","No"))
				if("Yes")
					meeb += rgb(rand(1,255),rand(1,255),rand(1,255))
			view(6) << "[usr] creates a [meeb:name]!"

		Prices(mob/characters/M in world)
			set category = "Police"
			switch(input("What would you like to give to them?","Prices",text) in list("Power Raise","Zenni Raise","Item","None","Embarrass"))
				if("Power Raise")
					var/amount = input("How much power do you wish to give them?", "Prices") as num|null
					M.maxpowerlevel += amount
				if("Zenni Raise")
					var/amount = input("How much zenni do you wish to give them?","Prices") as num|null
					M.zenni += amount
				if("Embarrass")
					var/teext = input("What do you want to make them say over OOC?","Prices") as text|null
					world <<"<font color = teal>{{<font color = white>OOC<font color = teal>}}<font color = green><tt>{{<font color = red>[M]<font color = green>}}<font color = white> : [teext]"

		Beetchshlap(mob/characters/M in world)
			set category = "Police"
			set name = "Bitchslap"
			world << "<font size = 1><font color = silver>A hand decends from the heavens and starts bitchslapping [M]!!!!"
			M.slap = 1
			M.talk = 0
			M.sight = 0
			M.bitchslap()
			sleep(300)
			M.slap = 0
			M.talk = 1
			M.sight = 0
			usr << "<b>Learned ye lesson?"


		MakeBuu(mob/characters/M in world)
			set category = "Police"
			set name = "Make Buu Demon"
			if(M.move == 1)
				M.move = 1
				M.focused = 0
				M.powerlevel = 5
				M.maxpowerlevel = 5
				M.strength = 1
				M.rage = 0
				M.rage = 0
				M.stamina = 100
				M.maxstamina = 100
				M.state = ")v(ajin"
				M.kaioken = 0
				M.zenni = 3000
				M.will = 0
				M.honor = 0
				M.purity = 0
				M.faceicon = 'default.dmi'
				M.kitech = "None"
				M.auratech = "None"
				M.kitechlearn = 0
				M.dead = 0
				M.auratechlearn = 0
				M.focustechlearn = 0
				M.kicolor = "None"
				M.focus = "None"
				M.style = 'style-blocking.dmi'
				M.stylename = "Majin"
				M.flightlearn = 0
				M.title = ""
				M.overlays = 0
				M.race = "Buu Demon"
				M.icon = 'buu.dmi'
				M.maxpowerlevel += rand(1,15000)
				M.contents += new /obj/techs/wrap
				M.contents += new /obj/techs/regen
				M.contents += new /obj/techs/uniscan
				M.contents += new /obj/techs/kiabsorb
				M.contents += new /obj/techs/Kaioken

				M << "You awake as a Buu Demon."
		PowerHungrah()
			set category = "Police"
			set desc = "Who's being a cheater?"
			var/plap = input("What do you want to search for?") as num|null
			for(var/mob/characters/M in world)
				if(M.maxpowerlevel >= plap)
					usr << "<b>[M.name]: [M.maxpowerlevel]/[M.powerlevel]: [M.key]"
				if(M.maxpowerlevel < plap)
					M.powerlevel += 0
		Delete(obj/O in oview(6))
			set category = "Police"
			del(O)
		sfc(mob/characters/M in oview(6))
			set category = "Police"
			set name = "Strip, Freeze, and Cry"
			usr<<"Stop using this!"
			world << "[M] is a feeegpopper!!!"
		MadSkills(mob/characters/M in world)
			set category = "Police"
			M.contents += new/obj/techs/spiritbomb
			M.contents += new/obj/techs/Kamehameha
			M.contents += new/obj/techs/BigBang
			M.contents += new/obj/techs/Renzuko
			M.contents += new/obj/techs/FinalFlash
			M.contents += new/obj/techs/Tayioken
			M.contents += new/obj/techs/Zanzoken
			M.contents += new/obj/techs/GalacticDonut
			M.contents += new/obj/techs/Burning
			M.contents += new/obj/techs/SpecialBeamCannon
			M.contents += new/obj/techs/Masenko
			M.contents += new/obj/techs/DonDonPa
			M.contents += new/obj/techs/
			M.contents += new/obj/techs/worldscan
			M.contents += new/obj/techs/uniscan

			M.contents += new/obj/techs/wrap
			M.contents += new/obj/techs/kiabsorb
			M.contents += new/obj/techs/regen
			M.contents += new/obj/techs/uniscan
			M.contents += new/obj/techs/bukujutsu
			M.contents += new/obj/techs/aura
			M.contents += new/obj/techs/Kaioken
			M.contents += new/obj/techs/focus
			M.contents += new/obj/techs/telepath
			M.contents += new/obj/techs/kienzan
			M.contents += new/obj/techs/it
			M << "Phat."
		Funkalize(mob/characters/M in view(6))
			set category = "Police"
			M.icon += rgb(rand(1,255),rand(1,255),rand(1,255))
			M.name = "FUNKADELIC [M.name]"
			world << "<b>[M] has been <font color = red>F<font color = green>U<font color = blue>N<font color = cyan>K<font color = teal>A<font color = silver>L<font color = yellow>I<font color = red>Z<font color = blue>E<font color = silver>D<font color = white>!!!!"

		FunkalizeO(obj/O in oview(6))
			set category = "Police"
			O.icon += rgb(rand(1,255),rand(1,255),rand(1,255))
			O.name = "FUNKADELIC [O.name]"
			world << "<b>[O] has been <font color = red>F<font color = green>U<font color = blue>N<font color = cyan>K<font color = teal>A<font color = silver>L<font color = yellow>I<font color = red>Z<font color = blue>E<font color = silver>D<font color = white>!!!!"

		FunkalizeT(turf/T in oview(6))
			set category = "Police"
			T.icon += rgb(rand(1,255),rand(1,255),rand(1,255))
			T.name = "FUNKADELIC [T.name]"
			world << "<b>[T] has been <font color = red>F<font color = green>U<font color = blue>N<font color = cyan>K<font color = teal>A<font color = silver>L<font color = yellow>I<font color = red>Z<font color = blue>E<font color = silver>D<font color = white>!!!!"




		Ban(mob/M as mob in world)//this is a sumup of the codeabove
			set name="Ban"
			set category="Police"
			BanGuy(M)
			alert("You banned [M]!","Ban")
			del(M)


		Certify(mob/characters/M in world)
			set category = "Police"
			if(M.ntalk == null)
				usr << "You need to talk to the last newbie helper first."
				M << "[usr] tried to certify you, but you need to talk to the last newbie helper."
			if(M.ntalk == 1)
				M.loc=locate(70,85,1)
				M << "Your name has been certified!!"
				M.safe = 0
				M.npp = 0

		Deny(mob/characters/M in world, msg as text)
			set category = "Police"
			M.loc=locate(0,0,0)
			M << "You have been denied! <b>Reason: [msg]"

		AllSay(msg as text)
			set category = "Police"
			for(var/mob/characters/M in world)
				world <<"<font color = teal>{{<font color = white>OOC<font color = teal>}}<font color = green><tt>{{<font color = red>[M]<font color = green>}}<font color = white> : [msg]"
		PoliceSay(msg as text)
			set category = "Police"
			set name = "Special speak"
			world << "<font color=green>--([oocname])--<font color=yellow><b>[name]</b> <font color=white>Says to his people: [msg]"
		Inform(msg as text)
			set category = "Police"
			world << "<font face = Arial><u>INFO</u>:<font face = New Times Roman><font color = red> [msg]"


		Revive(mob/M in world)
			set category = "Police"
			if(M.dead == 0||M.dead == null)
				usr << "<b>They aren't dead."
			if(M.dead == 1)
				usr << "<b>You revive [M:name]"
				M << "<b>You feel your body getting revived!!!"
				M.dead = 0
				M.overlays -= /obj/halo
				M.overlays -= 'halo.dmi'
				M.overlays -= /obj/halo
				M.overlays -= 'halo.dmi'
				M.overlays -= /obj/halo
				M.overlays -= 'halo.dmi'
				M.loc=locate(70,85,1)

mob/Login()
	..()
	Log(src)
	Checkclan(src)
	if(src.key == "Phoenix Man")
		src.contents += new /obj/GotenkArmor
		src.overlays -= 'tail.dmi'
		src.overlays -= 'tail.dmi'
		src.overlays -= 'tail.dmi'
	if(src.race == "Bio-Android Cell")
		src.verbs += /obj/cellabsorb/verb/CellAbsorb
	usr.underlays += 'shadow.dmi'
	Stat()
	sleep(10)
	world<< "<tt><I><font color = green>--[name] the [race] has logged in!--</tt>"
	usr.verbs += /mob/training/verb/Spar
	usr << "<I><font color=yellow>Whenever you login from now on, there will be an announcements screen poping up instead of only a verb. The game is turning out quite well so watch the announcements!"
	var/bpspot = 1
	while(bpspot<=15)
		new/obj/hud/bpnumber(client,bpspot)
		bpspot ++
	var/namespot = 1
	while(namespot<=15)
		new/obj/hud/nametext(client,namespot)
		namespot ++
	var/name1spot = 1
	while(name1spot<=15)
		usr.overlays += /obj/hud/nametext1
		name1spot ++
	var/t=length(src.name)
	if(t<9)t=0
	if(t>8&&t<15)t=-8
	if(t>15&&t<21)t=-18
	overlaytext(src,t,10,"name",src.name)
	Announcements()
	here
	powerlevelRefresh(src)
	sleep(10)
	goto here
	there
	client.SaveMob()
	usr << "Auto-Saving Character..."
	sleep(10)
	usr << "Auto-Save Complete"
	sleep(1000)
	goto there

mob/Login()
	..()
	var/bpspot = 1
	while(bpspot<=15)
		new/obj/hud/bpnumber(client,bpspot)
		bpspot ++
	src.powerlevelRefresh()
	there
	powerlevelRefresh()
	goto there
//new

