#if DM_VERSION >= 455
world/map_format = TILED_ICON_MAP
#endif
client/preload_rsc =  1
var/host = null// = "GhostAnime"// Person's key
var/host2 = null// = "GhostAnime"// Person's Alias
var/tmp/dbver = "(v1.3)"
var/loginallowed
var/votesforreboot
var/rebootrequested
var/mob/channels[SCOUTER_MAX][0]
world
	mob = /mob/login
	view = 7
	tick_lag = 1
	version = 22
	name = "Dragonball Online (v1.3)"
	hub = "DBOTeam.DragonballOnline"
	hub_password = "" // removed for the port
	status = "Dragonball Online - hosted by ."//*/
	//loop_checks = 0
	sleep_offline = 1



	New()
		set background = 1
		. = ..()
		world.log = "world.[time2text(world.realtime,"YYYYMMDD")].log"
		world.log << "[time2text(world.realtime,"Day Month DD, YYYY hh:mm:ss")] - Game Started"
		spawn(1)
			LoadWorld()
			loginallowed = 1
		spawn() ndbact()
		spawn() edbact()
		spawn() monster_loop()
		spawn() focus_loop()
		spawn()
			while(1)
				sleep(3100)
				SaveWorld()
				for(var/mob/characters/M in players)
					spawn()
						if(M.client)
							M.client.SaveMob()
	Del()
		SaveWorld()
		world.log << "[time2text(world.realtime,"Day Month DD, YYYY hh:mm:ss")] - Game Closed"
		. = ..()

proc
	focus_loop()
		set background = 1
		while(1)
			for(var/mob/M in players)
				if(!M.meditate)
					M.focus.subtract(0.1)
			sleep(50)

atom/movable/animate_movement = SLIDE_STEPS

client
	default_verb_category = null
mob
	verb
		Request_Reboot()
			set category = "Other"
			if(!rebootrequested)
				votesforreboot = 0
				rebootrequested = 1
				world << "<span style=\"color: red;\">[src] has requested a reboot!</span>"
				for(var/mob/M in players)
					M.contents += new /obj/req_reb(M, 1)
			else
				src << "Someone else has already requested a reboot!"


obj
	req_reb
		New(loc, on)
			. = ..()
			if(!on)
				spawn(5)
					del(src)
/*		verb
			Vote_for_Reboot()
				set category = "Other"
				switch(alert("Do you wish for there to be a reboot?","Request Reboot","Yes","No"))
					if("Yes")
						votesforreboot++
						if(votesforreboot >= (3 * players.len / 4))
							world << "<span class=\"reboot\">World Reboot!</span>"
							for(var/mob/characters/M in players)
								spawn()
									if(M.client)
										M.client.SaveMob()
							world.Reboot()
				del(src)
*/
mob
	verb
		Music()
			set name = "Music On/Off"
			set category = "Other"
			switch(alert("Do you want the Music ON or OFF?","Music","On","Off"))
				if("On")
					if(src.musicon )
						src << "Music is already ON."
					else
						src.musicon = 1
						src << sound('music/title.mid',1)
						src << "Music has been turned ON."
				if("Off")
					if(src.musicon == 0)
						src << "Music is already OFF."
					else
						src.musicon = 0
						src << sound('music/title_off.mid',1)
						src << "Music has been turned OFF."

mob
	verb
		Befriend(mob/characters/M in oview(6))
			set name = "Befriend"
			set category = "Other"
			if(M.client)
				switch(alert("Are you sure you want to befriend [M]? (You can only befriend 1 person.)","Befriend","Yes","No"))
					if("Yes")
						switch(alert(M,"[usr] wants to befriend with you, would like it if [usr] befriended with you?","Befriend","No","Yes"))
							if("No")
								alert(usr,"[M] does not wish to for him/here to befriended!")
								alert(M,"You did not befriended with [usr]!")
								return
							if("Yes")
								usr.befriend = "[M.name]"
								M.befriend = "[usr.name]"
								alert(M, "[usr] has befriended you!")
								alert(usr, "You have befriended [M]!")

					if("No")
						return
			else
				alert("[M] isn't a player!")

mob/proc/Update_Radar()
	spawn()
		set background = 1
		while(radarOn && client && client.radar)
			client.radar.overlays.Cut()
			var/obj/I = new
			I.name = "Sense"
			I.icon = 'icons/Radar_Blips.dmi'
			I.icon_state = "Self"
			I.layer = -9
			client.radar.overlays += I
			for(var/mob/M in world)
				if(get_dist(src,M) < 30 && src.z == M.z && src != M)
					I = new
					I.name = "Sense"
					I.icon = 'icons/Radar_Blips.dmi'
					I.icon_state = "Blip"
					I.layer = -1
					if(M.powerlevel.value < (src.powerlevel.value - (src.powerlevel.value/100)))
						if(M.mon != 1)
							I.icon += rgb(255,220,0)
					else if(M.powerlevel.value > (src.powerlevel.value + (src.powerlevel.value/100)))
						I.icon += rgb(255,0,0)
					else
						I.icon += rgb(0,0,255)
					I.pixel_x = -(src.x - M.x)/2
					I.pixel_y = -(src.y - M.y)/2
					client.radar.overlays += I
			sleep(20)


var/dmifont/Arial7pt/namefont = new

mob
	Login()
		..()
		CreateName()

mob/proc/CreateName(r=0, g=0, b=0)
	set background = 1
	if(show_name)
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
		if(npc )
			r = 200
			g = 140
			b = 0
		else if(key == "Destroy")
			r = 210
			g = 220
			b = 255
		else if(key == "Synx")
			r = 0
			g = 0
			b = 104
		else if(key == "XxXSonGokouXxX")
			r = 17
			g = 29
			b = 176
		else if(key == "MrBubble")
			r=213
			g=188
			b=21
		else if(key == "Mercia")
			r = 160
			g = 106
			b = 202
		else if(key == "Metal_Mario33")
			r = 0
			g = 230
			b = 0
		else if(key == "Ubuu0105")
			r = 0
			g = 255
			b = 255
		else if(key == "Ck9162")
			r = 255
			g = 97
			b = 3
		else if(key == "SSJ3Brolly")
			r = 255
			g = 0
			b = 128
		else if(key == "SSJ Nike")
			r = 68
			g = 71
			b = 192
		else if(key == "GhettoMan")
			r = 0
			g = 0
			b = 128
		else if(key == "MerCeNary_SePhirotH")
			r = 0
			g = 204
			b = 255
		else if(key == host)
			r = 176
			g = 176
			b = 0
		else if(istype(src, /monster))
			if(ap > 0)
				r = 135
				g = 206
				b = 250
			else
				r = 255
				g = 0
				b = 0
		if(r<255 || g<255 || b<255)
			s.Blend(rgb(r, g, b), ICON_MULTIPLY)
		var/image/I
		for(var/xx = 0, xx < s.w, ++xx)
			var/icon/ic = s.GetIcon(xx, 0)
			if(ic)
				I = image(icon=ic, loc=src, layer=FLOAT_LAYER)
				I.pixel_x = (xx + (1 - s.w) / 2) * 32
				I.pixel_y = 10
				name_img += I

mob
	MouseEntered()
		if(show_name)
			for(var/image/I in name_img)
				usr.client.images += I
		. = ..()
	MouseExited()
		if(show_name)
			for(var/image/I in name_img)
				usr.client.images -= I
		. = ..()

obj/ppole/Move()
	var/obj/ppoletrail/E = new /obj/ppoletrail(src.loc)
	E.dir = src.dir
	E.owner = src.killedBy
	..()

mob/var
	speeding = 0
	frundelay = 1	//Fly Speed Control
	rundelay = 2	//Normal/other Speed Control
	srundelay = 6    //USSJ Speed Control

client/Move()
	if(mob.speeding <= 0)
		if(mob.state != "Ultra Super Saiyan")
			if(usr.flight == 0)
				mob.speeding = 1
				..()
				sleep(mob.rundelay)
				mob.speeding = 0
			else
				mob.speeding = 1
				..()
				sleep(mob.rundelay - mob.frundelay)
				mob.speeding = 0
		else
			if(usr.state == "Ultra Super Saiyan")
				if(usr.flight == 0)
					mob.speeding = 1
					..()
					sleep(mob.srundelay)
					mob.speeding = 0
				else
					mob.speeding = 1
					..()
					sleep(mob.srundelay - mob.frundelay)
					mob.speeding = 0
	else
		return

mob
	proc
		mutecount()
			set background = 1
			spawn(1)
				while(src.spoken)
				{
					sleep(125)
					src.spoken--
					if(src.spoken <= 0)
						usr.spoken = 0
					if(src.chat )
						src.chat = 1
					else
						if(src.spoken <= 0)
							src.spoken = 0
							src.mute = 0
							src.chat = 1
							usr << "<B><FONT COLOR = RED>You have been automatically unmuted!"
				}

proc
/*
	Replace proc
	This replaces word in text with replace
	All three arguments are expected to be text
*/
	Replace(text,word,replace)
		var/pos = findtext(text,word)
		while(pos)
			text = copytext(text,1,pos) + replace + copytext(text,pos+length(word))
			pos = findtext(text,word)
		return text

/*
	Replace All proc
	replace_list: list in the format word = replace
	replaces each word with it's replace entry
*/
	Replace_All(text,replace_list)
		for(var/word in replace_list)
			var/pos = findtext(text,word)
			while(pos)
				text = copytext(text,1,pos) + replace_list[word] + copytext(text,pos+length(word))
				pos = findtext(text,word)
		return text

/*
	ROT13 proc
	Encodes/decodes text using ROT13.
*/
	rot13(text)
		var/encoded = ""
		for(var/i = 1; i <= length(text); i++)
			var/ascii = text2ascii(text, i)
			switch(ascii)
				if(65 to 90)
					ascii = (ascii - 52) % 26 + 65
				if(97 to 122)
					ascii = (ascii - 84) % 26 + 97
			encoded += ascii2text(ascii)
		return encoded

/*
	ROT47 proc
	Encodes/decodes text using ROT47.
*/
	rot47(text)
		var/encoded = ""
		for(var/i = 1; i <= length(text); i++)
			var/ascii = text2ascii(text, i)
			ascii = (ascii + 14) % 94 + 47
			encoded += ascii2text(ascii)
		return encoded



mob
	proc
		say(C)
			if(!C) return


			(oviewers(src) + src) << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">[src]</span> : <span class=\"say\">[C]</span>"
	verb
		command(C as text)
			set name = ">"
			set hidden = 1
			if(!C)
				return
			if(mute)
				src << "You don't HAVE a mouth!!"
				return


			switch(channel)
				if(NO_CHANNEL)
					src << "You need to select a chat channel!"
				if(SAY_CHANNEL)
					(oviewers(src) + src) << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">[src]</span> : <span class=\"say\">[C]</span>"
				if(WORLD_CHANNEL)
					if(wsayoff == null)
						players << "<span class=\"chattype\">{<span class=\"title\">[title]</span>}</span> <span class=\"name\">[src]</span> : <span class=\"worldsay\">[C]</span>"
					else
						if(wsayoff == 2)
							usr << "<B><FONT COLOR = YELLOW> World Chat is turned off</font></b>"
				if(ROLEPLAY_CHANNEL)
					(oviewers(src) + src) << "<span class=\"roleplay\">*[src] [C]*</span>"
				if(GUILD_CHANNEL)
					if(!usr.guild)
						usr << "You aren't in a guild!"
						usr.channel = NO_CHANNEL
					else
						for(var/mob/M in players)
							if(usr.guild.Check_Guild_Member(M.plid))
								M << "<span class=\"chattype\">{<span class=\"title\">[usr.guild]([usr.guild.Get_Title(usr)])</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(COMMENT_CHANNEL)
					for(var/mob/M in players)
						if((M.ckey in admins) || (M.ckey in sgms) || (M.ckey in gms) || (M.ckey in enfs) || M.key == host)
							if(!M.ignore.Find(usr))
								M << "<span class=\"chattype\">{<span class=\"title\">Suggestions/Comments</span>}</span> <span class=\"name\">[usr]</span> : [C]"
					src << "<span class=\"chattype\">{<span class=\"title\">Suggestions/Comments</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(GM_ENF_CHANNEL)
					for(var/mob/M in players)
						if((M.ckey in admins) || (M.ckey in sgms) || (M.ckey in gms) || (M.ckey in enfs) || M.key == host)
							if(!M.ignore.Find(usr))
								M << "<span class=\"chattype\">{<span class=\"title\">GM/ENF Chat</span> - <span class=\"title\">[title]</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(GM_CHANNEL)
					for(var/mob/M in players)
						if((M.ckey in admins) || (M.ckey in sgms) || (M.ckey in gms))
							if(!M.ignore.Find(usr))
								M << "<span class=\"chattype\">{<span class=\"title\">GM Chat</span> - <span class=\"title\">[title]</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(GM_ENC_WORLD_CHANNEL)
					var/encC = rot13(C)
					for(var/mob/M in players)
						M << "<span class=\"chattype\">{<span class=\"title\">[title]</span>}</span> <span class=\"name\">[src]</span> : <span class=\"worldsay\">[encC]</span>"
						if((M.ckey in admins) || (M.ckey in sgms) || (M.ckey in gms))
							M << "<span class=\"chattype\">{<span class=\"title\">Encoded World Chat</span> - <span class=\"title\">[title]</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(ADMIN_CHANNEL)
					for(var/mob/M in players)
						if(M.key == "Destroy"||M.key == "Metal_Mario33"||M.key == "XxXSonGokouXxX"||M.key == "Vakir"||M.key == "MrBubble"||M.key == "MerCeNary_SePhirotH")
							if(!M.ignore.Find(usr))
								M << "<span class=\"chattype\">{<span class=\"title\">Admin Chat</span> - <span class=\"title\">[title]</span>}</span> <span class=\"name\">[usr]</span> : [C]"
				if(YELL_CHANNEL)
					for(var/mob/M in players)
						if(M.z == usr.z && !M.ignore.Find(usr))
							M << "<span class=\"chattype\">{<span class=\"title\">Yell</span> - <span class=\"title\">[title]</span>}</span> <span class=\"name\">[usr]</span> : <span class=\"yell\">[C]</span>"
				if(SCOUTER_CHANNEL)
					if(!usr.scouterchannel)
						usr << "You need to select a scouter channel!"
						channel = NO_CHANNEL
					else
						channels[usr.scouterchannel] << "<span class=\"chattype\">{<span class=\"title\">Scouter Channel [usr.scouterchannel]</span>}</span> <span class=\"name\">[usr]</span> : <span class=\"scouter\">[C]</span>"
				else
					src << "This channel has not been implemented yet."

mob/Click()
	spawn()
		if(src.npc )
			..()
		else
			if(usr.projectile)
				if(usr.projectile == "Big Bang Attack")
					if(usr.usebl )
						alert("You can't use this right now!")
						return
					else
						usr.usebl = 1
						view(6) << 'sounds/bigbang2.wav'
						view(6) << "<FONT COLOR = RED>[usr]:</FONT> ATTACK!!"
						usr.move = 1
						usr.attacking = 0
						usr.frozen = 0
						usr.client.show_verb_panel = 1
						usr.hideipan = 0
						usr.overlays -= /obj/kame
						usr.kame = 0
						usr.Projectile('icons/bigbang.dmi',"Big Bang Attack",usr.projdmg,usr)
						usr.projectile = null
						usr.projdmg = null
						usr.usebl = 0
				else
					if(usr.projectile == "Ki Sphere")
						if(usr.usebl )
							alert("You can't use this right now!")
							return
						else
							usr.usebl = 1
							view(20) << 'sounds/db_fire.wav'
							usr.move = 1
							usr.attacking = 0
							usr.frozen = 0
							usr.client.show_verb_panel = 1
							usr.hideipan = 0
							usr.overlays -= /obj/kame
							usr.kame = 0
							usr.Projectile('icons/bigbang.dmi',"Ki Sphere",usr.projdmg,usr)
							usr.projectile = null
							usr.projdmg = null
							usr.usebl = 0
			else if(usr.blast)
				if(usr.blast == "Ki Blast")
					if(src.name == usr.name)
						usr.usebl = 0
						..()
					else
						if(src.npc )
							usr.usebl = 0
							..()
						else
							if(usr.charges > 1)
								if(usr.usebl )
									alert("You can't use this right now!")
									return
								else if(!src in view(usr))
									alert("You can't do that!")
									return
								else
									usr.usebl = 1
									view(10) << 'sounds/kifire.wav'
									usr.overlays -= /obj/kiblast2
									spawn(5)
										missile(/obj/blst2, usr, src)
									call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
									src.powerlevel.value -= usr.blastdmg
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[usr.name]"
												src.expkk = "[usr.key]"
									src.Die(usr)
									usr.kame = 0
									usr.frozen = 0
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									usr.charges--
									usr.chargebu()
									usr << "<FONT COLOR = GREEN><I>You have [usr.charges] Charge(s) left of Ki Blast."
									usr.usebl = 0
							else
								if(usr.charges )
									if(usr.usebl )
										alert("You can't use this right now!")
										return
									else if(!src in view(usr))
										alert("You can't do that!")
										return
									else
										usr.usebl = 1
										view(10) << 'sounds/kifire.wav'
										usr.overlays -= /obj/kiblast
										spawn(5)
											missile(/obj/blst2, usr, src)
										call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
										src.powerlevel.value -= usr.blastdmg
										if(src.mon )
											if(src.powerlevel.value <=0)
												if(src.expkn == null && src.expkk == null)
													src.expkn = "[usr.name]"
													src.expkk = "[usr.key]"
										src.Die(usr)
										usr.kame = 0
										usr.frozen = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.charges--
										usr.blast = null
										usr.blastdmg = null
										usr << "<FONT COLOR = GREEN><I>You have no more Charges left of Ki Blast."
										usr.usebl = 0
				else
					if(usr.blast == "Renzoku Energy Dan")
						if(src.name == usr.name)
							usr.usebl = 0
							..()
						else
							if(src.npc )
								usr.usebl = 0
								..()
							else
								if(usr.charges > 1)
									if(usr.usebl )
										alert("You can't use this right now!")
										return

									else if(!src in view(usr))
										alert("You can't do that!")
										return
									else
										usr.usebl = 1
										view(10) << 'sounds/kifire.wav'
										usr.overlays -= /obj/ren2
										spawn(5)
											missile(/obj/rapidki, usr, src)
										call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
										src.powerlevel.value -= usr.blastdmg
										if(src.mon )
											if(src.powerlevel.value <=0)
												if(src.expkn == null && src.expkk == null)
													src.expkn = "[usr.name]"
													src.expkk = "[usr.key]"
										src.Die(usr)
										usr.kame = 0
										usr.frozen = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.charges--
										usr.chargebu()
//										step_rand(usr)
										usr << "<FONT COLOR = GREEN><I>You have [usr.charges] Charge(s) left of Renzoku Energy Dan."
										usr.usebl = 0
								else
									if(usr.charges )
										if(usr.usebl )
											alert("You can't use this right now!")
											return
										else if(!src in view(usr))
											alert("You can't do that!")
											return
										else
											usr.usebl = 1
											view(10) << 'sounds/kifire.wav'
											usr.overlays -= /obj/ren
											spawn(5)
												missile(/obj/rapidki, usr, src)
											call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
											src.powerlevel.value -= usr.blastdmg
											if(src.mon )
												if(src.powerlevel.value <=0)
													if(src.expkn == null && src.expkk == null)
														src.expkn = "[usr.name]"
														src.expkk = "[usr.key]"
											src.Die(usr)
											usr.kame = 0
											usr.frozen = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
											usr.charges--
											usr.blast = null
											usr.blastdmg = null
//											step_rand(usr)
											usr << "<FONT COLOR = GREEN><I>You have no more Charge(s) left of Renzoku Energy Dan."
											usr.usebl = 0
			else if(usr.name == src.name)
				if(usr.beam)
					if(usr.beam == "BBK")
						if(usr.usebl )
							alert("You can't use this right now!")
							return
						else
							usr.usebl = 1
							view(6) << "<font color = red>[usr]:<font color = black> HA!!!"
							view(6) << 'sounds/ha2.wav'
							view(20) << 'sounds/chou_fire.wav'
							usr.overlays -= /obj/kame
							usr.Beam(0,128,226,"Big Bang Kamehameha",usr.beamdmg,usr)
							usr.beam = null
							usr.beamdmg = null
							usr.usebl = 0
					else if(usr.beam == "spear")
						if(usr.usebl )
							alert("You can't use this right now!")
							return
						else
							usr.usebl = 1
							view(6) << "<font color = red>[usr]:<font color = black> ATTACK!!!"
							usr.Beam(0,128,226,"Arrow Charge",usr.beamdmg,usr)
							usr.beam = null
							usr.beamdmg = null
							usr.usebl = 0
					else
						if(usr.beam == "Kamehameha")
							if(usr.usebl )
								alert("You can't use this right now!")
								return
							else
								usr.usebl = 1
								view(6) << "<font color = red>[usr]:<font color = black> HA!!!"
								view(6) << 'sounds/ha2.wav'
								view(20) << 'sounds/chou_fire.wav'
								usr.overlays -= /obj/kame
								usr.Beam(0,128,226,"Kamehameha",usr.beamdmg,usr)
								usr.beam = null
								usr.beamdmg = null
								usr.usebl = 0
						else
							if(usr.beam == "Galit Gun")
								if(usr.usebl )
									alert("You can't use this right now!")
									return
								else
									usr.usebl = 1
									view(15) << 'sounds/galit_fire.wav'
									view(6) << "<font color = red>[usr]:<font color = black> GALIT."
									view(6) << "<font color = red>[usr]:<font color = black> GUN!"
									usr.overlays -= 'icons/galicki.dmi'
									usr.Beam(214,96,180,"Galit Gun",usr.beamdmg,usr)
									usr.beam = null
									usr.beamdmg = null
									usr.usebl = 0
							else
								if(usr.beam == "Masenko")
									if(usr.usebl )
										alert("You can't use this right now!")
										return
									else
										usr.usebl = 1
										view(15) << 'sounds/mas_say2.wav'
										view(15) << 'sounds/mas_fire.wav'
										view(6) << "<font color = red>[usr]:<font color = black> HA!!!!"
										usr.overlays -= 'icons/flashki.dmi'
										usr.Beam(252,242,86,"Masenko",usr.beamdmg,usr)
										usr.beam = null
										usr.beamdmg = null
										usr.usebl = 0
								else
									if(usr.beam == "Burning Attack")
										if(usr.usebl )
											alert("You can't use this right now!")
											return
										else
											usr.usebl = 1
											view(6) << 'sounds/burning_fire.wav'
											usr.overlays -= 'icons/bbki.dmi'
											usr.Beam(250,156,38,"Burning Attack",usr.beamdmg,usr)
											usr.beam = null
											usr.beamdmg = null
											usr.usebl = 0
									else
										if(usr.beam == "Ki Beam")
											if(usr.usebl )
												alert("You can't use this right now!")
												return
											else
												usr.usebl = 1
												view(20) << 'sounds/kifire.wav'
												var/obj/beamstart/cicon = new(null)
												cicon.icon = 'icons/custtom.dmi'
												var/R = 0
												var/G = 0
												var/B = 0
												if(usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Android (Mechanical)"||usr.race == "Half-Saiyan"||usr.race == "Namek")
													R = 0
													G = 128
													B = 226
												if(usr.race == "Changling"||usr.race == "Buu")
													R = 214
													G = 96
													B = 180
												if(usr.race == "Android (Biological)")
													R = 252
													G = 245
													B = 90
												if(findtext(usr.race,"Wizard"))
													R = 0
													G = 178
													B = 0
												cicon.icon += rgb(R,G,B)
												usr.overlays -= cicon
												if(usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Android (Mechanical)"||usr.race == "Half-Saiyan"||usr.race == "Namek")
													usr.Beam(0,128,226,"Ki Beam",usr.beamdmg,usr)
												if(usr.race == "Changling"||usr.race == "Buu")
													usr.Beam(214,96,180,"Ki Beam",usr.beamdmg,usr)
												if(usr.race == "Android (Biological)")
													usr.Beam(252,245,90,"Ki Beam",usr.beamdmg,usr)
												if(findtext(usr.race,"Wizard"))
													usr.Beam(0,178,0,"Ki Beam",usr.beamdmg,usr)
												usr.beam = null
												usr.beamdmg = null
												usr.usebl = 0
										else
											if(usr.beam == "Special Beam Cannon")
												if(usr.usebl )
													alert("You can't use this right now!")
													return
												else
													usr.usebl = 1
													view(6) << 'sounds/sbc2.wav'
													view(6) << "<FONT COLOR = RED>[usr]:</FONT> CANNON!!!"
													usr.overlays-='icons/flashki.dmi'
													usr.CustomBeam('icons/specialbeamcannon.dmi','icons/specialbeamcannon.dmi','icons/specialbeamcannon.dmi',"Special Beam Cannon",usr.beamdmg,usr)
													usr.beam = null
													usr.beamdmg = null
													usr.usebl = 0
											else
												if(usr.beam == "Thunder Flash")
													if(usr.usebl )
														alert("You can't use this right now!")
														return
													else
														usr.usebl = 1
														view(6) << 'sounds/chou_fire.wav'
														usr.overlays-=/obj/kame
														usr.CustomBeam('icons/fire.dmi','icons/fire.dmi','icons/fire.dmi',"Thunder Flash Attack",usr.beamdmg,usr)
														usr.beam = null
														usr.beamdmg = null
														usr.usebl = 0
			else if(usr.name != src.name)
				var/html
				html += "<html><head><title>[src]'s Status</title></head><body bgcolor = #000000>"
				html += "<FONT COLOR = YELLOW><center>[src], the [src.race]</center>"
				html += "<FONT COLOR = YELLOW><center><b>_________________________</b></center>"
				html += "<BR>"
				if(src.kiultra)
					if(src.race == "Android (Mechanical)")
						return
					html += "<font color = blue><FONT SIZE = 1>You sense a great hidden power in him.</font><br>"
				if(src.powerlevel.value > usr.powerlevel.value)
					html += "<font color = blue><FONT SIZE = 1>You sense that [src] is stronger than you.</font><br>"
				else if(src.powerlevel.value == usr.powerlevel.value)
					html += "<font color = blue><FONT SIZE = 1>[src] has the same powerlevel as you.</font><br>"
				else
					html += "<font color = blue><FONT SIZE = 1>You sense that [src] is weaker than you.</font><br>"
				if(usr.kiultra)
					html += "<font color = green><FONT SIZE = 2>You sense that [src] is at [num2text(src.powerlevel.value,100)] Powerlevel.</FONT><br>"
				else
					html += "<font color = green><FONT SIZE = 2>You can't detect the exact powerlevel of [src].</font><br>"
				if(src.ki.value > usr.ki.value)
					html += "<font color = blue><FONT SIZE = 1>You sense that [src] has a higher Ki level than you.</font><br>"
				else if (src.ki.value == usr.ki.value)
					html += "<font color = blue><FONT SIZE = 1>[src] has the same Ki level as you.</font><br>"
				else
					html += "<font color = blue><FONT SIZE = 1>You sense that [src] has a lower Ki level than you.</font><br>"
				if(usr.kiultra)
					html += "<font color = green><FONT SIZE = 2>You sense that [src] is at [num2text(src.ki.value,100)] Ki.</font><br>"
				else
					html += "<font color = green><FONT SIZE = 2>You can't detect the exact ki of [src].</font><br>"
				html += "<font color = green>[src] appears to be in the [state] state.</font><br>"
				html += "<font color = green>[src] follows the intentions of [ap>25?"Good":ap<-25?"Evil":"Neutral"].</font><br>"
				if(src.majined )
					html += "<font color = green>You see that [src] has an )V( on their forehead.</font><br>"
				else
					html += "<font color = green>[src] doesn't seem to be under control.</font><BR>"
				if(src.powerlevel.value > src.powerlevel.max_value)
					html += "<font color = gray><font size = 4>You sense that [src] is overpowered.</font><br>"
				else if(src.powerlevel.value == src.powerlevel.max_value)
					html += "<font color = gray><font size = 4>You sense that [src] is at full power.</font><br>"
				else if(src.powerlevel.value < src.powerlevel.max_value && src.powerlevel.value > (src.powerlevel.max_value / 2))
					html += "<font color = gray><font size = 4>You sense that [src] is less than his maximum power.</font><br>"
				else if(src.powerlevel.value <= (src.powerlevel.max_value / 2) && src.powerlevel.value > (src.powerlevel.max_value / 4))
					html += "<font color = gray><font size = 4>You sense that [src] is hiding most of their power.</font><br>"
				else if(src.powerlevel.value <= (src.powerlevel.max_value / 4) && src.powerlevel.value > (src.powerlevel.max_value / 8))
					html += "<font color = gray><font size = 4>You sense that [src] is hiding almost all of his/her's power.</font><br>"
				else
					html += "<font color = gray><font size = 4>You sense that [src] has compeletly hidden his/her's power.</font><br>"
				html += "<BR>"
				html += "<center><font color = GREEN>(OOC Information)<br></center>"
				html += "<center>[src]'s Key: [src.key]</font><br></center>"
				if(src.profile)
					html += "<center><FONT COLOR = GREEN>[src]'s Character Profile: [src.profile]</font><br></center>"
				if(src.key == "XxXSonGokouXxX"||src.key == "Vakir")
					html += "<center><font color = blue><i><u>Owner of Dragonball Online</u></i></font><br></center>"
				html += "<BR>"
				html += "</body></html>"
				usr << browse(html,"window=examine;display=1;clear=0;size=500x300;border=1;can_close=1;can_resize=1;can_minimize=1;titlebar=1")



client/New()
	..()
	if(src.key == "Guest")
		src << "<B><FONT COLOR = RED>You have been booted from Dragonball Online."
		src << "<B><FONT COLOR = BLUE>Sorry, Guests aren't allowed to join Dragonball Online, please register for your own personal key!."
		del(src)

proc
	respawn(var/monster/M, delay = 1000)
		set background = 1
		if(!M.nospawn)
			if(!initial(M.loc))
				del(M)
				return
			M.loc = null
			M.itinvis = 1
			spawn(delay)
				M.powerlevel = new(M.powerlevel.initial_value)
				M.ki = new(M.powerlevel.initial_value)
				M.loc = initial(M.loc)
				M.icon = initial(M.icon)
				M.state = initial(M.state)
				M.overlays = initial(M.overlays)
				M.dead = initial(M.dead)
				M.itinvis = initial(M.itinvis)
				M.expkn = null
				M.expkk = null
				M.dead = 0
				M.CreateName()
		else
			del(M)

proc
	LoadWorld()
		world << "<span class=\"info\">Loading world data\..."
		var/savefile/S = new("bans.sav")
		S["key"] >> crban_keylist
		S["IP"] >> crban_iplist
		S["unban"] >> crban_unbanned
		world << ".\..."
		sleep(10)
		if (!length(crban_keylist)) crban_keylist=list()
		if (!length(crban_iplist)) crban_iplist=list()
		if (!length(crban_unbanned)) crban_unbanned=list()
		world << ".\..."
		sleep(10)
		var/savefile/F = new("world.sav")
		F["edbtime"] >> edbtime
		F["ndbtime"] >> ndbtime
		world << ".\..."
		sleep(10)
		F["frooz"] >> frooz
		F["frgssj"] >> frgssj
		F["frssj1"] >> frssj1
		F["frssjfp"] >> frssjfp
		F["frssju"] >> frssju
		F["frssj2"] >> frssj2
		F["frssj3"] >> frssj3
		F["frcf1"] >> frcf1
		F["frcf2"] >> frcf2
		F["frcf3"] >> frcf3
		F["frcf4"] >> frcf4
		F["frcf4fp"] >> frcf4fp
		F["frcf5"] >> frcf5
		F["frcm"] >> frcm
		F["frns"] >> frns
		F["frcsp"] >> frcsp
		F["frcp"] >> frcp
		F["frcpw"] >> frcpw
		F["frcsup"] >> frcsup
		F["frhs"] >> frhs
		F["frbf"] >> frbf
		F["frbs"] >> frbs
		F["frbsgt"] >> frbsgt
		F["frbsgh"] >> frbsgh
		F["frreincarnation"] >> frreincarnation
		F["frmyst"] >> frmyst
		F["frelssj"] >> frelssj
		world << ".\..."
		sleep(10)
		F["PermShutdownV"] >> PermShutdownV
		F["servcaplimit"] >> servcaplimit
		F["servrules"] >> servrules
		F["guilds"] >> guilds
		if(!guilds)
			guilds = list()
		world << ".\..."
		sleep(10)
		F["Emonth"] >> Emonth
		F["Esmonth"] >> Esmonth
		F["Etime"] >> Etime
		F["Eyear"] >> Eyear
		F["Nmonth"] >> Nmonth
		F["Nsmonth"] >> Nsmonth
		F["Ntime"] >> Ntime
		F["Nyear"] >> Nyear
		F["Vmonth"] >> Vmonth
		F["Vsmonth"] >> Vsmonth
		F["Vtime"] >> Vtime
		F["Vyear"] >> Vyear
		F["Ymonth"] >> Ymonth
		F["Ysmonth"] >> Ysmonth
		F["Ytime"] >> Ytime
		F["Yyear"] >> Yyear
		world << ".\..."
		sleep(10)
		F["sgms"] >> sgms
		F["gms"] >> gms
		F["enfs"] >> enfs
		F["nextplid"] >> next_plid
		if(!sgms)
			sgms = list()
		if(!gms)
			gms = list()
		if(!enfs)
			enfs = list()
		if(!next_plid)
			next_plid = 1
		spawn(600) TimeE()
		spawn(600) TimeN()
		spawn(600) TimeV()
		spawn(600) TimeY()
		world << "Complete.</span>"

	SaveWorld()
		if(!loginallowed) return
		var/savefile/S = new("bans.sav")
		S["key"] << crban_keylist
		S["IP"] << crban_iplist
		S["unban"] << crban_unbanned
		var/savefile/F = new("world.sav")
		F["edbtime"] << edbtime
		F["ndbtime"] << ndbtime
		F["frooz"] << frooz
		F["frgssj"] << frgssj
		F["frssj1"] << frssj1
		F["frssjfp"] << frssjfp
		F["frssju"] << frssju
		F["frssj2"] << frssj2
		F["frssj3"] << frssj3
		F["frcf1"] << frcf1
		F["frcf2"] << frcf2
		F["frcf3"] << frcf3
		F["frcf4"] << frcf4
		F["frcf4fp"] << frcf4fp
		F["frcf5"] << frcf5
		F["frcm"] << frcm
		F["frns"] << frns
		F["frcsp"] << frcsp
		F["frcp"] << frcp
		F["frcpw"] << frcpw
		F["frcsup"] << frcsup
		F["frhs"] << frhs
		F["frbf"] << frbf
		F["frbs"] << frbs
		F["frbsgt"] << frbsgt
		F["frbsgh"] << frbsgh
		F["frreincarnation"] << frreincarnation
		F["frmyst"] << frmyst
		F["frelssj"] << frelssj
		F["PermShutdownV"] << PermShutdownV
		F["servcaplimit"] << servcaplimit
		F["servrules"] << servrules
		F["guilds"] << guilds
		F["Emonth"] << Emonth
		F["Esmonth"] << Esmonth
		F["Etime"] << Etime
		F["Eyear"] << Eyear
		F["Nmonth"] << Nmonth
		F["Nsmonth"] << Nsmonth
		F["Ntime"] << Ntime
		F["Nyear"] << Nyear
		F["Vmonth"] << Vmonth
		F["Vsmonth"] << Vsmonth
		F["Vtime"] << Vtime
		F["Vyear"] << Vyear
		F["Ymonth"] << Ymonth
		F["Ysmonth"] << Ysmonth
		F["Ytime"] << Ytime
		F["Yyear"] << Yyear
		F["sgms"] << sgms
		F["gms"] << gms
		F["enfs"] << enfs
		F["nextplid"] << next_plid

alert //object for alerts that dissappear after a certain time
	New(delay)
		spawn(delay)
			del(src)

	proc
		Alrt(target = usr, text, title, option1, option2)
			return alert(target, text, title, option1, option2)

proc
	get_step_rando(atom/ref)
		set background = 1
		var/turf/T = get_step_rand(ref)
		while(!T && ref.x > 0)
			var/rx = rand(ref.x-1,ref.x+1)
			var/ry = rand(ref.y-1,ref.y+1)
			T = locate(rx,ry,ref.z)
		return T

proc
	drawleff(r = 0, g = 236, b = 242)
		var
			starty = rand(4,24)
			startx
			curx
			cury = starty
			dir = pick(list(-1,1))
			length = rand(5,10)
			loop = 1
			icon
				aleff = new /icon('transparent.dmi')
				curicon = new /icon('transparent.dmi')
				frames[32]
		if(dir == -1)
			curx = 26
			startx = 26
		if(dir == 1)
			curx = 6
			startx = 6
		while(curx <= 26 && curx >= 6)
			var
				color = rgb(max(0,min(r + rand(-15,15), 255)),max(0,min(g + rand(-15,15), 255)),max(0,min(b + rand(-15,15), 255)))
				icon/frame = new /icon('transparent.dmi')
			frame.DrawBox(color,curx,cury)
			frames[curx] = frame
			if(dir == -1)
				if(curx < startx - length)
					curicon = new /icon('transparent.dmi')
					for(var/i = curx; i <= curx + length; i++)
						var/icon/icon = frames[i]
						curicon.Blend(icon,ICON_OVERLAY)
				else
					curicon.DrawBox(color,curx,cury)
			else if(dir == 1)
				if(curx > startx + length)
					curicon = new /icon('transparent.dmi')
					for(var/i = curx; i >= curx - length; i--)
						var/icon/icon = frames[i]
						curicon.Blend(icon,ICON_OVERLAY)
				else
					curicon.DrawBox(color,curx,cury)
			if(!(loop % 6))
				aleff.Insert(curicon, frame=(loop/6))
			loop++
			if(dir == -1)
				curx--
			else if(dir == 1)
				curx++
			cury += rand(-1,1)
			if(cury > starty + 2)
				cury = starty + 2
			else if(cury < starty - 2)
				cury = starty - 2
			if(cury > 32)
				cury = 32
			else if(cury < 1)
				cury = 1
		return aleff

mob/proc
	ussjlightning()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
	ssj2lightning()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
	ssj3lightning()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
	lssjlightning()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
	auralightningeff()
		set background = 1
		lightning = 1
		while(lightning)
			var/obj/O = new()
			O.layer = MOB_LAYER + 1
			O.icon = lefficons[rand(1,lefficons.len)]
			src.overlays += O
			sleep(3)
			src.overlays -= O
			del(O)
			sleep(rand(10,25))

	mystlightning()
		spawn() mysticauralightningeff()
		spawn() mysticauralightningeff()
		spawn() mysticauralightningeff()
		spawn() mysticauralightningeff()
		spawn() mysticauralightningeff()
		spawn() mysticauralightningeff()
	mysticauralightningeff()
		set background = 1
		lightning = 1
		while(lightning)
			var/obj/O = new()
			O.layer = MOB_LAYER + 1
			O.icon = mystlefficons[rand(1,lefficons.len)]
			src.overlays += O
			sleep(3)
			src.overlays -= O
			del(O)
			sleep(rand(10,25))