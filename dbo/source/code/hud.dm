//HUD Icons and Code by Kobata
//Ki Meter Icon by Ronin (Modified by Kobata)

hud
	parent_type = /obj
	Write(savefile/F)
		return
	Read(savefile/F)
		return

hud
	parent_type = /obj
	icon = 'icons/hud.dmi'
	layer = MOB_LAYER + 10
	name = ""

	left
		icon_state = "left"
		screen_loc = "NORTHWEST"

	center
		icon_state = "center"
		screen_loc = "NORTH, WEST+1 to NORTH, WEST+10"

	right
		icon_state = "right"
		screen_loc = "NORTH, WEST+11"

	button
		layer = MOB_LAYER + 11
		mouse_opacity = 2
		help
			icon_state = "help"
			screen_loc = "NORTH, WEST+4"
			Click()
				usr.Help(/help/index)

		save
			icon_state = "save"
			screen_loc="NORTH, WEST+5"
			Click()
				if(!usr) return
				usr.client.SaveMob()
				usr << "<i><b><font color=\"yellow\">Character Saved!</font></b></i>"

		chat
			icon_state = "chat"
			screen_loc="NORTH, WEST+6"
			Click()
				if(!usr) return
				var/list/options = list ("Regular Chat","Roleplay Chat", "Yell", \
					"Comments/Suggestions", "World Chat")
				if(usr.scouterchannel)
					options += "Scouter Radio"
				if((usr.ckey in admins) || (usr.ckey in sgms) || (usr.ckey in gms) || (usr.ckey in enfs) || usr.key == host)
					options += "GM/ENF Chat"
				if((usr.ckey in admins) || (usr.ckey in sgms) || (usr.ckey in gms))
					options += "GM Chat"
					options += "Encoded World Chat"
				if(usr.key == "Destroy"||usr.key == "Synx"||usr.key == "XxXSonGokouXxX"||usr.key == "Vakir"||usr.key == "MrBubble"||usr.key == "Metal_Mario33")
					options += "Admin Chat"
				if(usr.guild)
					options += "Guild Chat"
				options += "No Chat Channel"
				options += "Cancel"
				switch(input("Select a chat channel.", "Chat Channels", text) in options)
					if("Regular Chat")
						usr.channel = SAY_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Regular Chat'."
					if("World Chat")
						usr.channel = WORLD_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'World Chat'."
					if("Roleplay Chat")
						usr.channel = ROLEPLAY_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Roleplay Chat'."
					if("Guild Chat")
						usr.channel = GUILD_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Guild Chat'."
					if("Comments/Suggestions")
						usr.channel = COMMENT_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Comments/Suggestions'."
					if("GM/ENF Chat")
						usr.channel = GM_ENF_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'GM/ENF Chat'."
					if("GM Chat")
						usr.channel = GM_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'GM Chat'."
					if("Encoded World Chat")
						usr.channel = GM_ENC_WORLD_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Encoded World Chat'."
					if("Admin Chat")
						usr.channel = ADMIN_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Admin Chat'."
					if("Scouter Radio")
						usr.channel = SCOUTER_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Scouter Chat'."
					if("Yell")
						usr.channel = YELL_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You have set your chat channel to 'Yell'."
					if("No Chat Channel")
						usr.channel = NO_CHANNEL
						usr << "<B><FONT COLOR = YELLOW>You no longer have a chat channel set!"

		meditate
			icon_state = "med"
			screen_loc="NORTH, WEST+7"
			Click()
				if(!usr) return
				if(usr.training || usr.meditate == 2 || usr.rest == 2)
					alert("You can't meditate right now.")
				else
					if(usr.flight)
						usr << "You can't meditate while flying."
					else
						if(usr.rest)
							usr << "You can't meditate while resting, or you must wait 10 seconds before meditating."
						else
							if((usr.state != "Normal" && usr.state != "Semi-Perfect Form" && usr.state != "Perfect Form" && (usr.state == "Super Saiyan" && usr.ssjfp !=1))||usr.transforming )
								usr << "You can't meditate/rest while being transformed."
							else
								if(usr.frozen == 0)
									if(usr.medtime)
										usr << "<B>You need to wait 10 seconds before continuing meditating."
									else if(usr.meditate)
										usr << "<B>You relieve your self from your meditiative state."
										usr.medtime = 1
										usr.meditate = 0
										usr.move = 1
										usr.attacking = 0
										usr.kame = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.hideipan = 0
										usr.icon_state = ""
										usr.overlays -= 'icons/medwind.dmi'
										sleep(100)
										if(usr)
											usr.medtime = 0
									else
										usr << "<b>You begin to put your self into a meditative state."
										usr.icon_state = "meditate"
										usr.move = 0
										usr.attacking = 1
										usr.kame = 1
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										usr.meditate = 1
										usr.training = 0
										usr.overlays += 'icons/medwind.dmi'
										usr.meditate()
								else
									alert("You are frozen!")

		rest
			icon_state = "rest"
			screen_loc="NORTH, WEST+8"
			Click()
				if(!usr) return
				if(usr.training || usr.meditate == 2 || usr.rest == 2)
					alert("You can't rest right now.")
				else
					if(usr.flight )
						alert("You can't rest while flying.")
					else
						if(usr.meditate)
							usr << "You can't rest while meditating, or you must wait 10 seconds before resting."
						else
							if((usr.state != "Normal" && usr.state != "Semi-Perfect Form" && usr.state != "Perfect Form" && (usr.state == "Super Saiyan" && usr.ssjfp !=1))||usr.transforming )
								usr << "You can't meditate/rest while being transformed."
							else
								if(usr.frozen == 0)
									if(usr.restime)
										usr << "You need to wait 10 seconds before resting again."
									else if(usr.rest)
										usr << "<b>You stop resting."
										usr.icon_state = ""
										usr.restime = 1
										usr.move = 1
										usr.attacking = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.kame = 0
										usr.rest = 0
										sleep(100)
										if(usr)
											usr.restime = 0
									else
										if(usr.stamina.value >= usr.stamina.max_value)
											usr.stamina.restore()
											usr << "<B>There is no need to rest!"
										else
											usr << "<b>You start resting."
											usr.icon_state = "meditate"
											if(usr.kiultra)
												usr << "<B>You begin to regenerate."
											usr.move = 0
											usr.attacking = 1
											usr.client.show_verb_panel = 0
											usr.hideipan = 1
											usr.kame = 1
											usr.rest = 1
											usr.training = 0
											usr.rest()
								else
									alert("You are frozen!")

		train
			icon_state = "train"
			screen_loc="NORTH, WEST+9"
			Click()
				if(!usr) return
				switch(input("Select a type of training.", "Self-Training",text) in list ("Punches","Kicks","Ki","Stop Training","None"))
					if("Punches")
						if(!usr) return
						if(!usr.rest)
							if(!usr.meditate)
								if(usr.stamina.value)
									if(usr.training)
										usr << "<b>You are currently training. Please select 'Stop Training' under the Training tab."
									else
										usr.training = 1
										usr << "<b>You begin training your punches."
										usr.move = 0
										usr.punchcheck()
								else
									alert("You are too tired to train.")
							else
								alert("You can't train while meditating.")
						else
							alert("You can't train while resting.")
					if("Kicks")
						if(!usr) return
						if(!usr.rest)
							if(!usr.meditate)
								if(usr.stamina.value)
									if(usr.training)
										usr << "<b>You are currently training. Please select 'Stop Training' under the Training tab."
									else
										usr.training = 1
										usr.move = 0
										usr << "<b>You begin training your kicks."
										usr.kickcheck()
								else
									alert("You are too tired to train.")
							else
								alert("You can't train while meditating.")
						else
							alert("You can't train while resting.")
					if("Ki")
						if(!usr) return
						if(!usr.rest)
							if(!usr.meditate)
								if(usr.stamina.value)
									if(usr.training)
										usr << "<b>You are currently training. Please select 'Stop Training' under the Training tab."
									else
										usr.training = 1
										usr.move = 0
										usr.overlays += 'icons/medwind.dmi'
										usr << "<b>You begin training your Ki."
										usr.kicheck()
								else
									alert("You are too tired to train.")
							else
								alert("You can't train while meditating.")
						else
							alert("You can't train while resting.")
					if("Stop Training")
						if(!usr) return
						usr.training = 0
						usr << "<b>You stop training."
						usr.move = 1
						usr.overlays -= 'icons/medwind.dmi'

		teamtrain
			icon_state = "teamtrain"
			screen_loc="NORTH, WEST+10"
			Click()
				if(!usr) return
				var/mob/M
				for(var/mob/O in get_step(usr,usr.dir))
					M = O
				if(M)
					if(!M.mon)
						if(!M.npc)
							if(usr.move)
								if(M.move)
									if(!usr.zanzoken)
										if(!M.zanzoken)
											if(usr.stamina.value >= 2)
												if(M.stamina.value >= 2)
													if(!usr.rest)
														if(!M.rest)
															if(!usr.training)
																if(!M.training)
																	var/alert/acpt = new(100)
																	switch(acpt.Alrt(usr, "Do you want to ask [M] if he/she wants to team train?","Team Train","Yes", "No"))
																		if("Yes")
																			usr << "Asking [M]."
																			var/alert/ask = new(600)
																			switch(ask.Alrt(M, "[usr] wants to train with you, do you accept?","Team Train","Yes", "No"))
																				if("Yes")
																					if(usr.training||M.training) return
																					if(!(usr && M)) return
																					if(usr.dir == NORTH)
																						M.loc = locate(usr.x+1,usr.y,usr.z)
																					if(usr.dir == SOUTH)
																						M.loc = locate(usr.x-1,usr.y,usr.z)
																					if(usr.dir == WEST)
																						M.loc = locate(usr.x,usr.y-1,usr.z)
																					if(usr.dir == EAST)
																						M.loc = locate(usr.x,usr.y+1,usr.z)
																					usr.client.show_verb_panel = 0
																					usr.hideipan = 1
																					usr.hideipan = 1
																					M.client.show_verb_panel = 0
																					M.hideipan = 1
																					M.hideipan = 1
																					usr.icon_state = "sparfury"
																					M.icon_state = "sparfury"
																					usr.training = 1
																					M.training = 1
																					usr.move = 0
																					M.move = 0
																					usr.kame = 1
																					M.kame = 1
																					usr.traineffect(M)
																					while(usr.stamina.value >= 2 && M.stamina.value >= 2)
																						usr.stamina.value -= rand(2,6)
																						M.stamina.value -= rand(2,6)
																						usr.skexp += rand(0,1)
																						M.skexp += rand(0,1)
																						usr.Levelup()
																						M.Levelup()
																						if(prob(50))
																							if(usr.training && M.training && usr.stamina.value >= 2 && M.stamina.value >= 2)
																								usr.powerlevel.max_value += 1+(usr.powerlevel.max_value * 0.0016)
																								usr.ki.max_value += 1+(usr.ki.max_value * 0.0016)
																								usr.stamina.max_value += 1+(usr.stamina.max_value * 0.00016)
																								M.powerlevel.max_value += 1+(M.powerlevel.max_value * 0.0016)
																								M.ki.max_value += 1+(M.ki.max_value * 0.0016)
																								M.stamina.max_value += 1+(M.stamina.max_value * 0.00016)
																						sleep(18)
																					usr << "<B>You have stopped training!"
																					M << "<B>You have stopped training!"
																					usr.icon_state = ""
																					M.icon_state = ""
																					usr.stamina.value = 0
																					M.stamina.value = 0
																					usr.client.show_verb_panel = 1
																					usr.hideipan = 0
																					M.client.show_verb_panel = 1
																					M.hideipan = 0
																					usr.move = 1
																					M.move = 1
																					usr.training = 0
																					M.training = 0
																				if("No")
																					usr << "[M] has declined."
																else
																	usr << "<B>[M] is already training!"
															else
																usr << "<B>You are training already!"
														else
															usr << "<B>[M] is resting!"
													else
														usr << "<B>You are resting!"
												else
													usr << "<B>[M] doesn't have enough stamina!"
											else
												usr << "<B>You do not have enough stamina!"
										else
											usr << "<B>[M] can't team train while using Zanzoken."
									else
										usr << "<B>You can't team train while using Zanzoken."
								else
									usr << "<B>[M] is busy doing something!"
							else
								usr << "<B>Your busy doing something!"
						else
							usr << "<B>[M] is an NPC!"
					else
						usr << "<B>[M] is a Monster!"

	status
		layer = MOB_LAYER + 11
		icon_state = "status"
		screen_loc = "NORTHWEST"
		mouse_opacity = 2
		var
			prev_color
		Click()
			usr << "<b>Powerlevel</b>: [usr.powerlevel.toText()] ([usr.powerlevel.toPercent()]%)"
			usr << "<b>Ki</b>: [usr.ki.toText()] ([usr.ki.toPercent()]%)"
			usr << "<b>Stamina</b>: [usr.stamina.toText()] ([usr.stamina.toPercent()]%)"

	techmenu
		layer = MOB_LAYER + 12
		mouse_opacity = 2
		technext
			screen_loc = "NORTH, WEST+3"
			icon_state = "technext"
			Click()
				var/mob/C = usr
				C.tm.nextTech()
		techprev
			screen_loc = "NORTH, WEST+1"
			icon_state = "techprev"
			Click()
				var/mob/C = usr
				C.tm.prevTech()

obj/techs
	screen_loc = "NORTH, WEST+2"
	layer = MOB_LAYER + 11

mob
	var
		tmp
			hud/HUD[]
			hud/status
				plmeter
				kimeter
				stammeter
			techmenu/tm
	proc
		ResetHUD()
			if(!client) return
			tm.hide()
			for(var/hud/O in HUD)
				client.screen -= O
			HUD = newlist(/hud/left, /hud/center, /hud/right)
			for(var/type in typesof(/hud/button) - /hud/button)
				HUD += new type()
			plmeter = new()
			kimeter = new()
			stammeter = new()
			for(var/hud/O in HUD)
				client.screen += O
			client.screen += plmeter
			client.screen += kimeter
			client.screen += stammeter
			tm.show()

	Login()
		. = ..()
		if(client && !tm)
			tm = new(src)
		ResetHUD()

	Stat()
		. = ..()
		if(src == usr)
			client.screen -= plmeter
			plmeter.layer = MOB_LAYER + 11
			switch(powerlevel.toPercent())
				if(0 to 25)
					plmeter.icon_state = "statussevere"
				if(25 to 75)
					plmeter.icon_state = "statusdamaged"
				else
					plmeter.icon_state = "statusgood"
			client.screen += plmeter

			client.screen -= kimeter
			kimeter.layer = MOB_LAYER + 12
			if(kimeter.prev_color != customauracolor)
				var/icon/kiicon = new('icons/hud.dmi')
				kiicon.Blend(customauracolor,ICON_MULTIPLY)
				kimeter.icon = kiicon
				kimeter.prev_color = customauracolor
			switch(ki.toPercent())
				if(0 to 25)
					kimeter.icon_state = "kisevere"
				if(25 to 75)
					kimeter.icon_state = "kimedium"
				else
					kimeter.icon_state = "kigood"
			client.screen += kimeter

			client.screen -= stammeter
			stammeter.layer = MOB_LAYER + 13
			switch(stamina.toPercent())
				if(0 to 25)
					stammeter.icon_state = "stamcritical"
				if(25 to 75)
					stammeter.icon_state = "stammedium"
				else
					stammeter.icon_state = "stamgood"
			client.screen += stammeter

obj/techs
	screen_loc = "NORTH, WEST+2"
	layer = MOB_LAYER + 11
	mouse_opacity = 2

	New()
		. = ..()
		CreateName()

	proc/CreateName(r=255, g=255, b=255)
		set background = 1
		name_img = new /list()
		var/lines = round(32 / namefont.height)
		var/txt = namefont.GetLines(html_encode(name), width = 96, maxlines = lines,\
		                            flags = DF_WRAP_ELLIPSIS)
		var/size = namefont.RoundUp32(namefont.GetWidth(txt))
		var/iconset/s = namefont.DrawText(txt, size / 2, 0,\
		                    width = size, maxlines = lines,\
		                    flags = DF_JUSTIFY_CENTER | DF_WRAP_ELLIPSIS,\
		                    icons_x = size / 32, icons_y = 1)
		s.Transparent()
		if(r<255 || g<255 || b<255)
			s.Blend(rgb(r, g, b), ICON_MULTIPLY)
		var/image/I
		for(var/xx = 0, xx < s.w, ++xx)
			var/icon/ic = s.GetIcon(xx, 0)
			if(ic)
				I = image(icon=ic, loc=src, layer=FLOAT_LAYER)
				I.pixel_x = (xx + (1 - s.w) / 2) * 32
				I.pixel_y = -32
				name_img += I

techmenu
	var
		mob/C
		cur_index = 1
		obj/techs/cur_skill
		hud/techmenu
			technext/tn = new()
			techprev/tp = new()

	New(mob/CH)
		. = ..()
		C = CH

	proc
		show(client/CL = C.client)
			CL.screen += tn
			CL.screen += tp
			if(C.skills && C.skills.len)
				cur_skill = C.skills[cur_index]
				CL.screen += cur_skill
				for(var/image/I in cur_skill.name_img)
					CL.images += I

		hide(client/CL = C.client)
			CL.screen -= tn
			CL.screen -= tp
			if(cur_skill)
				CL.screen -= cur_skill
				for(var/image/I in cur_skill.name_img)
					CL.images -= I

		refresh(client/CL = C.client)
			if(cur_skill)
				CL.screen -= cur_skill
				for(var/image/I in cur_skill.name_img)
					CL.images -= I
				cur_skill = null
			if(C.skills && C.skills.len)
				cur_skill = C.skills[cur_index]
				CL.screen += cur_skill
				for(var/image/I in cur_skill.name_img)
					CL.images += I

		nextTech()
			if(/*C.move_locked || */!C.skills) return
			cur_index++
			if(cur_index > C.skills.len)
				cur_index = 1
			refresh()

		prevTech()
			if(/*C.move_locked || */!C.skills) return
			cur_index--
			if(cur_index < 1)
				cur_index = C.skills.len
			refresh()
