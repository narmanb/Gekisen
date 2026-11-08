var
	admins[] = list("carlosmasiso19")
	sgms[0]
	gms[0]
	enfs[0]

mob
	proc
		GMCheck()
			Remove_Verbs()
			if(ckey in admins)
				src << "<b>Admins, if you DO give out quest info, put it on world chat.</b>"
				Add_Admin_Verbs()
			if(ckey in sgms)
				src << "<b>SGMs, please note that you are NOT to give out information on quests!</b>"
				Add_SGM_Verbs()
			else if(ckey in gms)
				src << "<b>GMs, please note that you are NOT to give out information on quests!</b>"
				Add_GM_Verbs()
			else if(ckey in enfs)
				src << "<b>ENFs, please note that you are NOT to give out information on quests!</b>"
				Add_Enf_Verbs()
			if(key == host)
				Add_Host_Verbs()


		Add_Admin_Verbs()
			verbs += typesof(/mob/admin/verb) + typesof(/mob/SGM/verb) + typesof(/mob/GM/verb) + typesof(/mob/enf/verb)
		Add_SGM_Verbs()
			verbs += typesof(/mob/SGM/verb) + typesof(/mob/GM/verb) + typesof(/mob/enf/verb)
		Add_GM_Verbs()
			verbs += typesof(/mob/GM/verb) + typesof(/mob/enf/verb)
		Add_Enf_Verbs()
			verbs += typesof(/mob/enf/verb)
		Add_Host_Verbs()
			verbs += typesof(/mob/host/verb) + typesof(/mob/enf/verb) + typesof(/mob/admin/verb) + typesof(/mob/SGM/verb) + typesof(/mob/GM/verb)

		Remove_Verbs()
			verbs -= typesof(/mob/admin/verb) + typesof(/mob/SGM/verb) + typesof(/mob/GM/verb) + typesof(/mob/enf/verb)
mob
	admin
		verb
			Boost_Power()
				set category = "Admin"
				powerlevel.max_value += 10000000000
				ki.max_value += 10000000000
				stamina.max_value += 300
				powerlevel.restore()
				ki.restore()
				stamina.restore()

			Play_Song(var/F as sound)
				set category = "Admin"
				set name = "Play Sound/Song"
				world << "<FONT COLOR = GREEN><I>[usr] plays [F] to the world."
				world << F

			MusicStop()
				set name = "Music Stop"
				set category = "Admin"
				world << sound(null)
				world << "[src.name] has stopped the music!"


			Player_Wipe(key as null|text)
				set category = "Admin"
				set desc = "(key)"
				if(!key) return
				switch(input("Are you sure you want to wipe [key]","Wipe [key]") in list("No","Yes"))
					if("Yes")
						key = ckey(key)
						var/firstletter=copytext(key, 1, 2)
						fdel("players/[firstletter]/[key].sav")
						fdel("items/[key].sav")
						usr<<"[key] has been wiped!"
					else
						usr<<"Cancelling the request of wiping [key]!"
						return
			Wipe_All()
				set category = "Admin"
				switch(input("Are you sure you want to wipe the world?","Wipe the world") in list("No","Yes"))
					if("Yes")
						world << "<span class=\"wipe\">Player Wipe in 10 seconds!</span>"
						sleep(100)
						world << "<span class=\"wipe\">Player Wipe Initated!</span>"
						spawn() World_Wipe()
					else
						usr<<"Cancelling the request of wiping the world!"
			Add_GM(key as text)
				set category = "Admin"
				set desc = "(key)"
				gms += ckey(key)
				enfs -= ckey(key)
				GM_Log("[src] gave [key] GM.")
				Recheck_GMs()
			Remove_GM(key as null|anything in gms)
				set category = "Admin"
				set desc = "(key)"
				gms -= ckey(key)
				GM_Log("[src] removed [key]'s GM.")
				Recheck_GMs()

			Add_SGM(key as text)
				set category = "Admin"
				set desc = "(key)"
				sgms += ckey(key)
				gms -= ckey(key)
				enfs -= ckey(key)
				GM_Log("[src] gave [key] SGM.")
				Recheck_GMs()
			Remove_SGM(key as null|anything in sgms)
				set category = "Admin"
				set desc = "(key)"
				sgms -= ckey(key)
				GM_Log("[src] removed [key]'s SGM.")
				Recheck_GMs()
			Add_Enf(key as text)
				set category = "Admin"
				set desc = "(key)"
				enfs += ckey(key)
				GM_Log("[src] gave [key] enf.")
				Recheck_GMs()
			Remove_Enf(key as null|anything in enfs)
				set category = "Admin"
				set desc = "(key)"
				enfs -= ckey(key)
				GM_Log("[src] removed [key]'s enf.")
				Recheck_GMs()

			Create_Anything()
				set category = "Admin"
				var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
				var/L[] = typesof(/atom)

				for(var/X in L)
					//WORKAROUND FOR ABOVE BUG
					switch("[X]")
						if("/atom", "/atom/movable", "/mob/admin", "/mob/enf",
							"/mob/GM", "/mob/host") continue //ignore options of these types
					if(X in typesof(/monster)) continue
					//END OF WORKAROUND

					html += "<a href=byond://?src=\ref[src];action=create;type=[X]>[X]</a><br>"

				usr << browse(html)

			Warp_To_Loc(mob/M in world, x as num, y as num, z as num)
				set category = "Admin"
				set desc = "(player, x, y, z)"
				oviewers(M) << "[M] sudddenly dissappears!"
				M.loc = locate(x, y, z)
				oviewers(M) << "[M] sudddenly appears!"
				M << "You suddenly appear somewhere else.."
				src << "You warped [M] to ([x],[y],[z])"
				GM_Log("[src] warped [M] to ([x],[y],[z])")

			Warp_To_Mob(mob/M in world, mob/T in world)
				set category = "Admin"
				set desc = "(player, mob)"
				oviewers(M) << "[M] sudddenly dissappears!"
				M.loc = locate(T.x, T.y - 1, T.z)
				oviewers(M) << "[M] sudddenly appears!"
				M << "You suddenly appear somewhere else.."
				src << "You warped [M] to [T]"
				GM_Log("[src] warped [M] to [T]")

			Check_P_Techs(mob/M in players)
				set name = "Check Techniques"
				set category = "Admin"
				var/varPackList = list()
				if(locate(/obj) in M:contents)
					for(var/obj/O in M:contents)
						varPackList += O
				else
					src << "[M.name] has an empty pack!"
					return
				var/varPackItem = input("Pick an item from [M:name]'s pack","Check Pack") in varPackList + list("Cancel")
				if(varPackItem != "Cancel")
					if(alert("Would you like to delete [varPackItem:name] from [M:name]'s pack?","[varPackItem:name]","Yes","No") == "Yes")
						GM_Log("[usr] Has Deleted [varPackItem] From [M]'s Techniques.")
						del(varPackItem)

			Check_P_Inventory(mob/M in players)
				set name = "Check Inventory"
				set category = "Admin"
				var/varPackList = list()
				if(locate(/obj/items) in M:contents)
					for(var/obj/items/O in M:contents)
						varPackList += O
				else
					src << "[M.name] has an empty pack!"
					return
				var/varPackItem = input("Pick an item from [M:name]'s pack","Check Pack") in varPackList + list("Cancel")
				if(varPackItem != "Cancel")
					if(alert("Would you like to delete [varPackItem:name] from [M:name]'s pack?","[varPackItem:name]","Yes","No") == "Yes")
						GM_Log("[usr] Has Deleted [varPackItem] From [M]'s Inventory.")
						del(varPackItem)

			Delmob(var/mob/monster in world)
				set name = "Delete Mob"
				set category = "Admin"
				alert("Are you sure you want to delete [monster]? Please note any mob deleted will not return until reboot!","Delete Mob","Yes","No")
				if("Yes")
					GM_Log("[src] Delete-Mob's [monster].")
					del(monster)
				if("No")
					return

			Revive(mob/M in world)
				set category = "Admin"
				set name = "Revive"
				set desc = "Who do you want to revive?"
				if(M.dead == 1)
					switch(alert(M, "Do you want to be revived by [src]?","Revival","Yes", "No"))
						if("Yes")
							src << "<B><FONT COLOR = GREEN>You have revived [M:name]."
							M << "<B><FONT COLOR = GREEN>You have been revived by [src]."
							M.dead = 0
							M.overlays -= /obj/halo
							M.overlays -= 'icons/halo.dmi'
							M.overlays -= /obj/halo
							M.overlays -= 'icons/halo.dmi'
							M.overlays -= /obj/halo
							M.overlays -= 'icons/halo.dmi'
							M.loc=locate(M.hx,M.hy,M.hz)
							GM_Log("[src] revives [M].")
						if("No")
							src << "<B><FONT COLOR = GREEN>[M] did not wanted to be revived"

			Set_Version_Required(ver as num)
				set category = "Admin"
				set desc = "(version)"
				if(ver > curworldvsn || ver < 18)
					src << "Invalid version"
				else
					char_v_required = ver

			Server_Rules(html as message)
				set category = "Admin"
				set desc = "(rules)"
				servrules = html
				for(var/mob/M in world)
					if(M.client)
						M.sample_report()

			View_World_Log()
				set category = "Admin"
				src << browse(Replace(file2text("world.[time2text(world.realtime,"YYYYMMDD")].log"),"\n","<br>"))

			Rename(mob/M as null|mob in players, ID as text)
				set name = "Rename"
				set category="Admin"
				set desc="Change A Mob's ID"
				GM_Log("[src] renames [M] to [ID].")
				M.name=ID

			Ghostform()
				set name = "Ghost form"
				set category = "Admin"
				if(src.GF != 1)
					src.invisibility = 101
					src.density = 0
					src.GF = 1
					src.itinvis = 1
					src.scaninvis = 1
					src << "<font color = red><b>> You are now like a ghost</b></font>"
				else
					src.invisibility = 0
					src.GF = 0
					src.itinvis = 0
					src.scaninvis = 0
					src.density = 1
					src << "<font color = red><b>> You are no longer like a ghost</b></font>"

			View_GM_Log()
				set category = "Admin"
				src << browse(Replace(file2text("gm.log"),"\n","<br>"))

			Edit(atom/O in world)
				set category = "Admin"
				var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
				var/variables[0]

				html += "<h3 align=center>[O.name] ([O.type])</h3>"

				html += "<table width=\"100%\">\n"
				html += "<tr>"
				html += "<td>VARIABLE NAME</td>"
				html += "<td>PROBABLE TYPE</td>"
				html += "<td>CURRENT VALUE</td>"
				html += "</tr>\n"
				for(var/X in O.vars) variables += X


				for(var/X in variables)
					html += "<tr>"
					html += "<td><a href=\"byond://?src=\ref[O];action=edit;var=[X]\">"
					html += X
					html += "</a>"
					html += "</td>"

					html += "<td>[DetermineVarType(O.vars[X])]</td>"
					html += "<td>[DetermineVarValue(O.vars[X])]</td>"
					html += "</tr>"
				html += "</table>"
				usr << browse(html)

			HW()
				set name = "History Wipe"
				set category = "Admin"
				switch(alert("Are you sure you want to wipe out a certain FDBO History Entry?","DBO History Entry","No","Yes"))
					if("No")
						return
					if("Yes")
						var/list/DBOH = list("--Saiyan--", "Oozaru","Giji Super Saiyan","Super Saiyan","Super Saiyan (Full Power)",\
						"Ultra Super Saiyan","Super Saiyan 2","Super Saiyan 3","--Changling--","Form 1","Form 2","Form 3","Form 4",\
						"Form 4 (Full Power)","Form 5","Metal Changling","--Namek--","Super Namek","--Cell--","Semi-Perfect Form",\
						"Perfect Form","Perfect Form (Weighted)","Super Perfect Form","--Human--","Super Human","--Buu--","Fat Buu",\
						"Super Buu","Super Buu (Gotenks)","Super Buu (Gohan)","--Earthling/Buu--","Reincarnation",,"--All--","Mystic",\
						"--Special--","LSSJ","--Cancel--")
						var/DBOHD =input("Select what you want to wipe.","DBO History Wipe","") in DBOH
						switch(DBOHD)
							if("Oozaru")
								frooz = null
							if("Giji Super Saiyan")
								frgssj = null
							if("Super Saiyan")
								frssj1 = null
							if("Super Saiyan (Full Power)")
								frssjfp = null
							if("Ultra Super Saiyan")
								frssju = null
							if("Super Saiyan 2")
								frssj2 = null
							if("Super Saiyan 3")
								frssj3 = null
							if("Form 1")
								frcf1 = null
							if("Form 2")
								frcf2 = null
							if("Form 3")
								frcf3 = null
							if("Form 4")
								frcf4 = null
							if("Form 4 (Full Power)")
								frcf4fp = null
							if("Form 5")
								frcf5 = null
							if("Metal Changling")
								frcm = null
							if("Super Namek")
								frns = null
							if("Semi-Perfect Form")
								frcsp = null
							if("Perfect Form")
								frcp = null
							if("Perfect Form (Weighted)")
								frcpw = null
							if("Super Perfect Form")
								frcsup = null
							if("Super Human")
								frhs = null
							if("Fat Buu")
								frbf = null
							if("Super Buu")
								frbs = null
							if("Super Buu (Gotenks)")
								frbsgt = null
							if("Super Buu (Gohan)")
								frbsgh = null
							if("Reincarnation")
								frreincarnation = null
							if("Mystic")
								frmyst = null
							if("LSSJ")
								frelssj = null
							else
								return
						src << "[DBOHD] has been wiped!"
						GM_Log("[src] has deleted [DBOHD]")

			Permanant_Banish(mob/M as null|mob in players)
				set category = "Admin"
				set desc = "(player)"
				switch(input("Are you sure you want to banish [M] permanantly","Banish [M]") in list("No","Yes"))
					if("Yes")
						src << "You banished [M] permanantly."
						M << "<tt><span class=\"system\">You have been banished permanantly.</span></tt>"
						GM_Log("[src] permanantly banned [M].")
						crban_fullban(M)


	SGM
		verb
			Delete(obj/O in view())
				set category = "Admin"
				set desc = "(object)"
				viewers(O) << "[O] sudddenly dissappears!"
				src << "You deleted [O]"
				GM_Log("[src] deleted [O]")
				del(O)

			Edit(atom/O in world)
				set name = "Edit"
				set category = "Admin"
				set desc = "(thing)"
				var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
				var/variables[0]

				html += "<h3 align=center>[O.name] ([O.type])</h3>"

				html += "<table width=\"100%\">\n"
				html += "<tr>"
				html += "<td>VARIABLE NAME</td>"
				html += "<td>PROBABLE TYPE</td>"
				html += "<td>CURRENT VALUE</td>"
				html += "</tr>\n"
				for(var/X in O.vars) variables += X


				for(var/X in variables)
					html += "<tr>"
					html += "<td><a href=\"byond://?src=\ref[O];action=edit;var=[X]\">"
					html += X
					html += "</a>"
					html += "</td>"

					html += "<td>[DetermineVarType(O.vars[X])]</td>"
					html += "<td>[DetermineVarValue(O.vars[X])]</td>"
					html += "</tr>"
				html += "</table>"
				usr << browse(html)


			Shutdown()
				set category = "Admin"
				var/time = input("How long to shutdown(in seconds)?","Reboot") as num
				time *= 10
				world << "<span class=\"shutdown\">World Shutdown in [time/10] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [3*time/40] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [time/20] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [time/40] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown!</span>"
				for(var/mob/characters/M in players)
					spawn()
						if(M.client)
							M.client.SaveMob()
				GM_Log("[src] shut down the world.")
				del(world)

			Spy(var/mob/M in world)
				set category = "Admin"
				if(src.spy == null)
					src.invisibility= 1
					src.density = 0
					src.client.eye = M
					src.client.perspective = EYE_PERSPECTIVE
					src.spy = 1
					src.GF = 1
					GM_Log("[src] spies on [M].")
				else
					src.invisibility= 0
					src.density = 1
					src.GF = 0
					src.client.eye = usr
					src.client.perspective = MOB_PERSPECTIVE
					src.spy = null

	GM
		verb
			Unsilence(mob/M as null|mob in players)
				set category = "Admin"
				set desc = "(player)"
				if(!M) return
				src << "You unsilenced [M]."
				GM_Log("[src] unmuted [M].")
				M.mutetime = 0
			Unbanish(key as null|anything in crban_keylist)
				set category = "Admin"
				set desc = "(key)"
				if(!key) return
				crban_unban(key)
				src << "You unbanished [key]."
				GM_Log("[src] unbanned [key].")

			Chang_Trans()
				set category = "Admin"
				set desc = "(player)"
				usr.contents += new /obj/transes/transform

			Teleport(mob/M in players)
				set category = "Admin"
				set desc = "(player)"
				oviewers(src) << "[src] sudddenly dissappears!"
				loc = locate(M.x, M.y - 1, M.z)
				oviewers(src) << "[src] sudddenly appears!"
				src << "You teleport to [M]"
				GM_Log("[src] teleported to [M]")

/*			Create_Items()
				set category = "Admin"
				var/create= input("Select something to create.") in typesof(/obj/items/,/obj/dragonball,/obj/ndragonball/)
				new create(locate(src.x,src.y-1,src.z))
				view(6) << "<FONT COLOR = BLUE><B>[src] creates a [create]!"
				GM_Log("[src] creates [create].")*/

			Create_Items()
				set category = "Admin"
				var/html = "<html><body bgcolor=gray text=#CCCCCC link=white vlink=white alink=white>"
				var/L[] = typesof(/obj/items)

				for(var/X in L)
					html += "<a href=byond://?src=\ref[src];action=create2;type=[X]>[X]</a><br>"
				usr << browse(html)

			View_Kill_Log()
				set category = "Admin"
				src << browse(Replace(file2text("kill.log"),"\n","<br>"))

			wsayc()
				set name = "World Chat On/Off"
				set category = "Admin"
				switch(input("What would you like to do?","World Chat On/Off",text) in list ("World Chat On","World Chat Off","Cancel"))
					if("Cancel")
						return
					if("World Chat On")
						if(wsayoff >= null)
							wsayoff = null
							world << "<b><font color = yellow>[src] Turns the World Chat Back On!"
							GM_Log("[src] enables World Chat!")
						else
							src << "World Chat is already on!"
							return
					if("World Chat Off")
						if(wsayoff != 2)
							wsayoff = 2
							world << "<b><font color = yellow>[src] Turns the World Chat Completely Off!"
							GM_Log("[src] fully disables World Chat!")
						else
							src << "World Chat is already off!"
							return

	enf
		verb
			Vaporize(mob/M as null|mob in players)
				set category = "Admin"
				set desc = "(player)"
				if(!M) return
				view(M) << pick(list("A meteor falls on [M]!", "[M] is struck by lightning!", \
					"[M] turns into dust!", "Babidi chants, and makes [M]'s head explode!", \
					"Cell appears in front of [M], and vaporizes him with a beam!"))
				GM_Log("[src] booted [M].")
				del(M)
			Silence(mob/M as null|mob in players, time in list("1 minute","10 minutes","15 minutes","30 minutes","1 hour"))
				set category = "Admin"
				set desc = "(player, time)"
				if(!M) return
				src << "You silenced [M] for [time]."
				view(M) << "[M]'s mouth suddenly dissappears!"
				GM_Log("[src] muted [M] for [time].")
				M.mute = 1
				switch(time)
					if("1 minute")
						M.mutetime = 6
					if("10 minutes")
						M.mutetime = 60
					if("15 minutes")
						M.mutetime = 90
					if("30 minutes")
						M.mutetime = 180
					if("1 hour")
						M.mutetime = 360
				spawn() M.muted()
			Banish(mob/M as null|mob in players, time in list("1 hour", "2 hours", "6 hours", "12 hours", "1 day", "2 days"))
				set category = "Admin"
				set desc = "(player, time)"
				if(!M) return
				var/unbantime = 0
				switch(time)
					if("1 hour")
						unbantime = world.realtime + 36000
					if("2 hours")
						unbantime = world.realtime + 72000
					if("6 hours")
						unbantime = world.realtime + 216000
					if("12 hours")
						unbantime = world.realtime + 432000
					if("1 day")
						unbantime = world.realtime + 864000
					if("2 days")
						unbantime = world.realtime + 1728000
				src << "You banished [M] for [time]."
				M << "<tt><span class=\"system\">You have been banished for [time].</span></tt>"
				GM_Log("[src] banned [M] for [time].")
				crban_fullban(M, unbantime)

			HideVerbs()
				set category = "Admin"
				usr.Remove_Verbs()
				verbs += /mob/hidden/verb/Unhide

			Reboot()
				set category = "Admin"
				var/time = input("How long to reboot(in seconds)?","Reboot") as num|null
				time = max(time,0)
				time *= 10
				if(time > 0)
					world << "<span class=\"reboot\">World Reboot in [time/10] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [3*time/40] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [time/20] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [time/40] seconds!</span>"
					sleep(time/4)
				world << "<span class=\"reboot\">World Reboot!</span>"
				for(var/mob/characters/M in players)
					spawn()
						if(M.client)
							M.client.SaveMob()
				GM_Log("[src] rebooted the world.")
				world.Reboot()

			View_Double_Key_List()
				set category = "Admin"
				src << seckeylist

	host
		verb
			Add_Enf(key as text)
				set category = "Admin"
				set desc = "(key)"
				enfs += ckey(key)
				GM_Log("[src] gave [key] enf.")
				Recheck_GMs()

			Remove_Enf(key as null|anything in enfs)
				set category = "Admin"
				set desc = "(key)"
				enfs -= ckey(key)
				GM_Log("[src] removed [key]'s enf.")
				Recheck_GMs()

			Unsilence(mob/M as null|mob in players)
				set category = "Admin"
				set desc = "(player)"
				if(!M) return
				src << "You unsilenced [M]."
				GM_Log("[src] unmuted [M].")
				M.mutetime = 0

			Reboot()
				set category = "Admin"
				var/time = input("How long to reboot(in seconds)?","Reboot") as num|null
				time = max(time,0)
				time *= 10
				if(time > 0)
					world << "<span class=\"reboot\">World Reboot in [time/10] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [3*time/40] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [time/20] seconds!</span>"
					sleep(time/4)
					world << "<span class=\"reboot\">World Reboot in [time/40] seconds!</span>"
					sleep(time/4)
				world << "<span class=\"reboot\">World Reboot!</span>"
				for(var/mob/characters/M in players)
					spawn()
						if(M.client)
							M.client.SaveMob()
				GM_Log("[src] rebooted the world.")
				world.Reboot()

			Shutdown()
				set category = "Admin"
				var/time = input("How long to shutdown(in seconds, must be atleast 1 second)?","Reboot") as num|null
				if(!time){return}
				time = max(1,time)
				time *= 10
				world << "<span class=\"shutdown\">World Shutdown in [time/10] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [3*time/40] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [time/20] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown in [time/40] seconds!</span>"
				sleep(time/4)
				world << "<span class=\"shutdown\">World Shutdown!</span>"
				GM_Log("[src] shut down the world.")
				del(world)

			Set_Version_Required(ver as num)
				set category = "Admin"
				set desc = "(version)"
				if(ver > curworldvsn || ver < 18)
					src << "Invalid version"
				else
					char_v_required = ver

			Server_Rules(html as message)
				set category = "Admin"
				set desc = "(rules)"
				servrules = html
				for(var/mob/M in players)
					if(M.client)
						M.sample_report()

			Unbanish(key as null|anything in crban_keylist)
				set category = "Admin"
				set desc = "(key)"
				if(!key) return
				crban_unban(key)
				src << "You unbanished [key]."
				GM_Log("[src] unbanned [key].")
	hidden
		verb
			Unhide()
				set category = "Admin"
				usr.GMCheck()
				verbs -= /mob/hidden/verb/Unhide

proc
	Recheck_GMs()
		set background = 1
		for(var/mob/M in players)
			M.GMCheck()
	World_Wipe()
		loginallowed = 0
		for(var/client/C)
			del(C)
		for(var/mob/M in players)
			players -= M
			del(M)
		fdel("players/")
		fdel("items/")
		fdel("world.sav")
		fdel("bans.sav")
		fdel("PO.sav")
		world << "<span class=\"wipe\">Player Wipe Complete! Rebooting world..</span>"
		world.Reboot()

mob
	proc
		muted()
			set background = 1
			if(!mutetime) return
			while(mutetime > 0)
				sleep(100)
				mutetime--
			mutetime = 0
			mute = 0
			view(src) << "[src]'s mouth suddenly reappears!"

	Topic(href,href_list[])
		switch(href_list["action"])
			if("create")
				if(!(usr.ckey in admins)) return ..()
				var/new_type = href_list["type"]
				var/atom/O = new new_type(loc)
				usr << "Created a new [O.name]."
				GM_Log("[usr] created a new [O.name].")
			if("create2")
				if(!((usr.ckey in gms) || (usr.ckey in sgms) || (usr.ckey in admins)) || !(text2path(href_list["type"]) in typesof(/obj/items))) return ..()
				var/new_type = href_list["type"]
				var/atom/O = new new_type(loc)
				usr << "Created a new [O.name]."
				GM_Log("[usr] created a new [O.name].")
			if("edit")
				if(!((usr.ckey in sgms) || (usr.ckey in admins))) return ..()
				var/variable = href_list["var"]
				if(variable in list("ckey","key","client","brollievent","grav",\
					"speeding","nw_power","w_power","w_ki","w_ssj","ki","powerlevel","stamina","focus",\
					"frundelay","srundelay","rundelay","attackdelay","yemma","lssj","w_edbuse","nw_ndbuse","nw_ki","nw_ssj",\
					"plgivemin","plgivemax","bu","kigivemin","hbtcuse","kigivemax","goldmin","goldmax","zenni","bzenni","ssjfpt",\
					"ssjfp","anger","unlock","GravID","plid","charversion","move"))
					return
				else if(variable in list("fame"))
					var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything in list("Increase", "Cancel")
					if(!class) return

					var/initial_value = vars[variable]
					switch(class)
						if("Increase")
							vars[variable] += 20
						else
							return

					GM_Log("[usr] modified [src]'s [variable] variable from \
						[DetermineVarValue(initial_value)] to [DetermineVarValue(vars[variable])].")

					usr:Edit(src)

				else if(istype(vars[variable], /list))
					return
				else
					var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
						in list("text","num","type","reference","icon","file","restore to default", "Cancel")

					if(!class) return

					var/initial_value = vars[variable]
					switch(class)
						if("restore to default")
							vars[variable] = initial(vars[variable])
						if("text")
							vars[variable] = input("Enter new text:","Text",vars[variable]) as text
						if("num")
							vars[variable] = input("Enter new number:","Num",vars[variable]) as num
						if("type")
							vars[variable] = input("Enter type:","Type",vars[variable]) \
								in typesof(/atom)
						if("reference")
							vars[variable] = input("Select reference:","Reference", \
								vars[variable]) as mob|obj|turf|area in world
						if("file")
							vars[variable] = input("Pick file:","File",vars[variable]) as file
						if("icon")
							vars[variable] = input("Pick icon:","Icon") as icon
						else
							return

					GM_Log("[usr] modified [src]'s [variable] variable from \
						[DetermineVarValue(initial_value)] to [DetermineVarValue(vars[variable])].")

					usr:Edit(src)

		. = ..()

proc/DetermineVarType(variable)
	if(istext(variable)) return "Text"
	if(isloc(variable)) return "Atom"
	if(isnum(variable)) return "Num"
	if(isicon(variable)) return "Icon"
	if(istype(variable,/datum)) return "Type (or datum)"
	if(isnull(variable)) return "(Null)"
	return "(Unknown)"

proc/DetermineVarValue(variable)
	if(istext(variable)) return "\"[variable]\""
	if(istype(variable,/atom) || (istype(variable,/datum) && ("name" in variable:vars))) return "[variable] ([variable:type])"
	if(isnum(variable))
		return num2text(variable,13)
	if(isnull(variable)) return "null"

	return "- [variable] -"

var/gmlog = file("gm.log")

proc
	GM_Log(message)
		gmlog << "[time2text(world.realtime,"Day Month DD, YYYY hh:mm:ss")] - [message]"
		for(var/mob/M in world)
			if((M.ckey in admins) || (M.ckey in sgms) || (M.key == host))
				M << "GM TRACKER: [time2text(world.realtime,"Day Month DD, YYYY hh:mm:ss")] - [message]"

var/tmp/wsayoff