//Ppl who edited save files: Uchiha Garbage Man
mob/Login()
	. = ..()
	players += src
	if(char_v_required && (charversion < char_v_required))
		src << "<span class=\"system\">This character cannot be loaded, it is version [charversion], version required: [char_v_required].</span>"
		del(src)
	if(fused )
		powerlevel.value = 1
		powerlevel.max_value = 1
		ki.value = 1
		ki.max_value = 1
		zenni = null
		bzenni = null
		contents = null
	if(istype(src,/mob/characters))
		noname = 0
	spy = null
	GF = 0
	usebl = 0
	immortal = 0
	if(PermShutdownV == 2||world.version != curworldvsn)
		world << "Wrong world version"
		shutdown()
	if(!host)
		if((client.address==world.address || client.address==null || client.address==world.address || client.address=="127.0.0.1"))
			host = "[client.key]"
			host2 = "[src.name]"
			world.name = "Dragonball Online [dbver] - hosted  by [host]"
	world.status = "Dragonball Online - [dbver] - hosted by [host]! <B>Players Online: [players.len]</B>"
	if(powerlevel.value <= 0)
		if(z !=2 && z !=3 && z !=8 && z !=10)
			powerlevel.value = 0
			Die()
	if(powerlevel.max_value < 5)
		powerlevel.max_value = 5
	if(used)
		sleep(rand(200,600))
		used = 0
		src << "You can use it again!"
	useb = 0
	itinvis = 0
	hideipan = 0
	doublekeycheck()
	if(swearb >= 3)
		swearb = null
	if(client)
		client.show_verb_panel = 1
		hideipan = 0
	if(itinvis )
		itinvis = 0
	if(dead && !newb)
		if(z != 2 && z != 3 && z != 10 && z != 20 && z != 14 && z !=8 && z != 15)
			loc = locate(52,9,3)
	if(state != "Normal"||icon)
		state = "Normal"
		if(powerlevel.value > powerlevel.max_value)
			powerlevel.restore()
		if(ki.value > ki.max_value)
			ki.restore()
		if(race == "Changling")
			if(upgrade)
				icon = 'icons/metal_frieza.dmi'
			else
				icon = 'icons/changling.dmi'
		if(race in list("Saiyan","Half-Saiyan","Earthling","Android (Mechanical)"))
			skinrestore()
			hairrestore()
		if(race == "Android (Biological)")
			if(semi)
				icon = 'icons/biocell2.dmi'
				state = "Semi-Perfect Form"
			else if(perfect)
				icon = 'icons/biocell3.dmi'
				state = "Perfect Form"
			else if(!perfect || !semi)
				icon = 'icons/biocell1.dmi'
		if(race == "Buu")
			icon = 'icons/buu.dmi'
		if(race == "Namek")
			icon = 'icons/namek.dmi'
	if(fused)
		del(src)
	spacetravel()
	if(!move)
		move = 1
	if(attacking)
		attacking = 0
	if(kame)
		kame = 0
	if(rest)
		rest = 0
		icon_state = ""
	if(meditate)
		meditate = 0
		icon_state = ""
	if(restime)
		restime = 0
	if(npctalk)
		npctalk = 0
	if(tau)
		tau = 0
	if(transforming != 0)
		transforming = 0
		if(powerlevel.value >= powerlevel.max_value)
			powerlevel.restore()
		if(ki.value >= ki.max_value)
			ki.restore()
	majining = 0
	if(summondrag)
		summondrag = 0
	if(kaiokuse)
		kaiokuse = 0
	if(z == 3 || z == 10)
		if(!dead)
			loc=locate(src.hx,src.hy,src.hz)
			icon_state = ""
			move = 1
			itinvis = 0
			ccuse = 0
	if(ccuse)
		if(!dead)
			loc=locate(hx,hy,hz)
			icon_state = ""
			move = 1
			itinvis = 0
			ccuse = 0
			alert(src,"Your time is up, and you are teleported back to your hometown.")
		else
			loc = locate(52,9,3)
			icon_state = ""
			move = 1
			ccuse = 0
			itinvis = 0
			alert(src,"Your time is up, and you are teleported back to Yemma.")
	move = 1
	ko = 0
	ptime = 0
	kiin = 0
	grav = 0
	combo = 0
	angered = 0
	oicon = src.icon
	tech = 0
	canthrow = 0
	entime = 0
	babychange = 0
	speeding = 0
	powerstruggle = 0
	blast = 0
	sight = 0
	focused = 0
	blastdmg = null
	beam = 0
	immortal = 0
	density = 1
	attacking = 0
	overlays -= /obj/kame
	focused = 0
	ased = 0
	tech = 0
	sbcharge = 0
	heal = 0
	kame = 0
	absorb = 0
	frozen = 0
	tayio = 0
	training = 0
	density = 1
	meditate = 0
	medtime = 0
	throwc = 0
	transforming = 0
	tapion = 0
	entime = 0
	medtime = 0
	move = 1
	sight &= ~BLIND
	absorb = 0
	musicon = 1
	thrown = 0
	blocking = 0
	bubblesdone = 0
	npp = 0
	invisibility = 0
	client.command_text = "> "
	client.eye = src
	src << 'sounds/blank.wav'
	grav = 0
	muted()
	saibaseedcount()
	flametc()
	absorbcount()
	playergravity()
	kaiokenstrain()
	dhealt()
	healcount()
	mutecount()
	oozrevcount()
	oozarucount()
	stamdrain()
	abc()
	ffchc()
	Inact()
	kiregen()
	wizcount()
	flametc()
	mystlearn()
	sdtc()
	lqtc()
	sample_report()
	ccuse = 0
	if(key == "Metal_Mario33")
		title = "<span style=\"color: #DDF; font-weight: bold\">Wind God</span>"
	else if(key == "XxXSonGokouXxX")
		title = "<span style=\"color: #00F; font-weight: bold\">Water Master</span>"
	else if(key == "Synx")
		title = "<span style=\"color: #686868; font-weight: bold\">Shadow</span>"
	else if(key == "MrBubble")
		title = "<span style=\"color: #D5BC15; font-weight: bold\">Guru</span>"
	else if(key == "Ravette" || key == "Mercia")
		title = "<span style=\"color: #A06ACA; font-weight: bold\">Bratling</span>"
	else if(key == "Dragonis")
		title = "<span style=\"color: #FA0000; font-weight: bold\">Sexy</span>"
	else if(key == "GhettoMan")
		title = "<span style=\"color: #FA0000; font-weight: bold\">DBO Terrorist</span>"
	else if(key == "Supreme Knight")
		title = "<span style=\"color: #FA0000; font-weight: bold\">DBO Therapist</span>"
	else if(key == "Ck9162")
		title = "<span style=\"color: #FF6103; font-weight: bold\">Master</span>"
	else if(key == "GhostAnime")
		title = "<span style=\"color: #8A2BE2; font-weight: bold\">Overlord</span>"
	else if(key == "SSJ Nike")
		title = "<span style=\"color: #4447C0; font-weight: bold\">Shoe</span>"
	else if(key == "MerCeNary_SePhirotH")
		title = "<span style=\"color: #00CCFF; font-weight: bold\">DBO Coder</span>"
	else if(ckey in sgms)
		title = "<span style=\"font-weight: bold\">SGM</span>"
	else if(ckey in gms)
		title = "<span style=\"font-weight: bold\">GM</span>"
	else if(ckey in enfs)
		title = "<span style=\"font-weight: bold\">ENF</span>"
	else if(key == host)
		title = "<span style=\"font-weight: bold\">Host</span>"
	else
		title = "Player"

	if(scouterchannel)
		channels[scouterchannel] += src
	if(rebootrequested)
		contents += new /obj/req_reb(src, 1)
	if(radarOn)
		var/obj/O = new   // This code creates the radar object and places it on the client's screen. Note how the object 'follows' the mob around as he moves. This is because the object is 'attached' to the client screen.
		O.name = "Sense Radar"
		O.icon = 'icons/Radar_Blips.dmi'
		O.icon_state = "Radar"
		O.screen_loc = "7,12"
		O.layer = 99
		client.screen += O
		client.radar = O
		radarOn = 1
		Update_Radar()
	if(shield)
		fshield()
	if(race == "Namek")
		growcount()
		growrevcount()
	if(dspecial )
		flyingrocks()
	if(state == "Legendary Super Saiyan")
		lightningrand()
		tiredlssj()
	else if(src.state == "Powered-Up")
		lightningrand2()
	else if(state == "Mystic")
		purplightningrand()
		windeffect()
	else
		lightningrand2()
	//var/obj/transes/mystic/M
	//if(M in contents)
	//	for(var/obj/transes/giji/T in contents)
	//		if(istype(T))
	//			contents -= T
	//	for(var/obj/transes/ssj/T in contents)
	//		if(istype(T))
	//			contents -= T
	if(flight == 0)
		for(var/obj/bukuspot/Z in overlays)
			if(istype(Z))
				del(Z)
	for(var/obj/nsummon/A in contents)
		if(A && istype(A))
			del(A)
	for(var/obj/summon/B in contents)
		if(B && istype(B))
			del(B)
	if(majin)
		verbs += /obj/Majin/verb/North
		verbs += /obj/Majin/verb/South
		verbs += /obj/Majin/verb/East
		verbs += /obj/Majin/verb/West
		verbs += /obj/Majin/verb/Recall
		verbs += /obj/Majin/verb/Force_say
		verbs += /obj/Majin/verb/Force_OOC
		verbs += /obj/Majin/verb/UnMajin
	GMCheck()
	for(var/guild/G in guilds)
		G.Check_Guild_Verbs(src)
	world << "<span class='login'><span class='brackets'>{{</span> [src] has logged in! <span class=\"brackets\">}}</span></span>"
	src << "<FONT SIZE = 1><FONT COLOR = WHITE>Dragonball Online was originally created by Vakir, Destroy, and XxXSonGokouXxX."
	src << "<B><FONT COLOR = WHITE>Welcome [src], to Dragonball Online!</FONT>"
	src.CreateName()
	spawn()
		if(!lefficons || !lefficons[25])
			lefficons = new /list(25)
			for(var/i = 1; i <= 25; i++)
				lefficons[i] = drawleff()
				sleep(rand(10,20))
	spawn()
		if(!mystlefficons ||!mystlefficons[25])
			mystlefficons = new /list(25)
			for(var/i = 1; i <= 25; i++)
				mystlefficons[i] = drawleff(240, 153, 204)
				sleep(rand(10,20))

client
	Del()
		if(istype(src.mob,/mob/characters))
			src.SaveMob()
		return ..()
mob
	Logout()
		players -= src
		if(scouterchannel)
			channels[scouterchannel] -= src
		doublekeycheck()
		if(istype(src,/mob/characters))
			world << "<span class=\"login\"><span class=\"brackets\">{{</span> [src] has logged out! <span class=\"brackets\">}}</span></span>"
			world.status = "Dragonball Online - [dbver] - hosted by [host]! <B>Players Playing: [players.len]</B>"
			if(src.follow)
				for(var/mob/characters/M in world)
					if(M.name == src.follow)
						return ..()
			for(var/obj/dragonball/O in src.contents)
				if(O)
					del(O)
			for(var/obj/ndragonball/O in src.contents)
				if(O)
					del(O)
			if(!fused)
				del(src)
		return ..()

client/proc/SaveMob()
	if(istype(src.mob, /mob/login))
		return ..()
	else
		if(src.mob.fused )
			return ..()
		else
			var/firstletter=copytext(ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			var/char_ckey = ckey(mob.name)
			F["/[ckey]/[char_ckey]"]<<mob

client/proc/LoadMob(char_ckey)
	var/firstletter=copytext(ckey, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	var/mob/M
	F["/[ckey]/[char_ckey]"]>>M

obj
	charasel
		name = "Dragonball Online"
		layer = OBJ_LAYER + 10

		choosec
			icon = 'icons/transparent.dmi'
			mouse_opacity = 2
			Click()
				if(loginallowed)
					var/mob/login/M = usr
					if(istype(M))
						M.ChooseCharacter()

		deletec
			icon = 'icons/transparent.dmi'
			mouse_opacity = 2
			Click()
				if(loginallowed)
					var/mob/login/M = usr
					if(istype(M))
						M.DeleteCharacter()

		quit
			icon = 'icons/transparent.dmi'
			mouse_opacity = 2
			Click()
				if(loginallowed)
					var/mob/login/M = usr
					if(istype(M))
						del(M)

		newc
			icon = 'icons/transparent.dmi'
			mouse_opacity = 2
			Click()
				if(loginallowed)
					var/mob/login/M = usr
					if(istype(M))
						M.CreateNewCharacter()


Form/create
	var
		name

		race
		race_1 = "Earthling"
		race_2 = "Saiyan"
		race_3 = "Half-Saiyan"
		race_4 = "Namek"
		race_5 = "Android (Biological)"
		race_6 = "Android (Mechanical)"
		race_7 = "Changling"
		race_8 = "Buu"
		race_9 = "Wizard"

		hair
		hair_1 = "Long"
		hair_2 = "Spikey"
		hair_3 = "Short Spikey"
		hair_4 = "Mohawk"
		hair_5 = "Short"
		hair_6 = "Recoome"
		hair_7 = "Goku"
		hair_8 = "Vegeta"
		hair_9 = "Vegito"
		hair_10 = "Trunks"
		hair_11 = "Goten"
		hair_12 = "Gohan"
		hair_13 = "Bald"

		hair_color_rgb
		hair_color_rgb_maxlen = 6

		align
		align_values = list("Good", "Neutral", "Evil")

		profile
		profile_size = "60x5"

		hometown
		hometown_values = list("Satan City", "South City", "North City", \
			"East City", "West City")

	Initialize()
		align = "Neutral"
		hair = "Bald"
		race = "Earthling"
		hometown = "Satan City"
		hair_color_rgb = "000000"

	HtmlLayout()
		usr << browse_rsc('icons/male.dmi',"Earthling.png")
		usr << browse_rsc('icons/male.dmi',"Saiyan.png")
		usr << browse_rsc('icons/male.dmi',"Half-Saiyan.png")
		usr << browse_rsc('icons/namek.dmi',"Namek.png")
		usr << browse_rsc('icons/biocell1.dmi',"Android (Biological).png")
		usr << browse_rsc('icons/male.dmi',"Android (Mechanical).png")
		usr << browse_rsc('icons/changling.dmi',"Changling.png")
		usr << browse_rsc('icons/buu.dmi',"Buu.png")
		usr << browse_rsc('icons/wizard.dmi',"Wizard.png")


		var
			icon
				long_hair = new('icons/hair_black_long.dmi')
				spikey_hair = new('icons/hair_black_spikey.dmi')
				short_spikey_hair = new('icons/gtvegeta.dmi')
				mohawk = new('icons/hair_mohawk.dmi')
				short_hair = new('icons/hair_black_short.dmi')
				recoome_hair = new('icons/hair_reccoom.dmi')
				goku_hair = new('icons/hair_goku.dmi')
				vegeta_hair = new('icons/hair_vegeta.dmi')
				vegito_hair = new('icons/hair_vegito.dmi')
				trunks_hair = new('icons/hair_trunks.dmi')
				goten_hair = new('icons/hair_goten.dmi')
				gohan_hair = new('icons/hair_gohan.dmi')
				bald_hair = new('icons/male.dmi')

		long_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		spikey_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		short_spikey_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		mohawk.Blend('icons/male.dmi',ICON_UNDERLAY)
		short_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		recoome_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		goku_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		vegeta_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		vegito_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		trunks_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		goten_hair.Blend('icons/male.dmi',ICON_UNDERLAY)
		gohan_hair.Blend('icons/male.dmi',ICON_UNDERLAY)

		usr << browse_rsc(long_hair,"Long.png")
		usr << browse_rsc(spikey_hair,"Spikey.png")
		usr << browse_rsc(short_spikey_hair,"Short Spikey.png")
		usr << browse_rsc(mohawk,"Mohawk.png")
		usr << browse_rsc(short_hair,"Short.png")
		usr << browse_rsc(recoome_hair,"Recoome.png")
		usr << browse_rsc(goku_hair,"Goku.png")
		usr << browse_rsc(vegeta_hair,"Vegeta.png")
		usr << browse_rsc(vegito_hair,"Vegito.png")
		usr << browse_rsc(trunks_hair,"Trunks.png")
		usr << browse_rsc(goten_hair,"Goten.png")
		usr << browse_rsc(gohan_hair,"Gohan.png")
		usr << browse_rsc(bald_hair,"Bald.png")
		return \
{"Name: [name] <br>
<br>
Race:<br>
[race_1] <img src="Earthling.png">Earthling<br>
[race_2] <img src="Saiyan.png">Saiyan<br>
[race_3] <img src="Half-Saiyan.png">Half-Saiyan<br>
[race_4] <img src="Namek.png">Namek<br>
[race_5] <img src="Android (Biological).png">Android (Biological)<br>
[race_6] <img src="Android (Mechanical).png">Android (Mechanical)<br>
[race_7] <img src="Changling.png">Changling<br>
[race_8] <img src="Buu.png">Buu<br>
[race_9] <img src="Wizard.png">Wizard<br>
<br>
Hair (OLNY applicable to Earthlings, Saiyans, Half-Saiyans, and Mechanical Androids):<br>
[hair_1] <img src="Long.png">Long<br>
[hair_2] <img src="Spikey.png">Spikey<br>
[hair_3] <img src="Short Spikey.png">Short Spikey<br>
[hair_4] <img src="Mohawk.png">Mohawk<br>
[hair_5] <img src="Short.png">Short<br>
[hair_6] <img src="Recoome.png">Recoome<br>
[hair_7] <img src="Goku.png">Goku<br>
[hair_8] <img src="Vegeta.png">Vegeta<br>
[hair_9] <img src="Vegito.png">Vegito<br>
[hair_10] <img src="Trunks.png">Trunks<br>
[hair_11] <img src="Goten.png">Goten<br>
[hair_12] <img src="Gohan.png">Gohan<br>
[hair_13] <img src="Bald.png">Bald<br>
<br>
Hair Color(rrggbb): [hair_color_rgb]<br>
<br>
Alignment: [align]<br>
<br>
Profile: [profile]<br>
<br>
Hometown: [hometown]<br>
<br>
[submit] [reset]
"}

	GetHtmlDoc()
		var/body = GetHtml()
		return {"<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>DBO Character Creation</title>
<style type="text/css">
body {
	background-color: #CCCCFF;
	color: black;
}
</style>
</head>
<body>
[body]
</body>
</html>
"}

	ProcessForm()
		var/mob/login/user = usr
		if(!istype(user)) return
		usr << browse("","clear=1")
		hair_color_rgb = "#" + hair_color_rgb
		if (!name)
			user.ChooseCharacter()
			return
		else if(length(name) > 20)
			alert("Your name is too long! Your name can only have 20 characters.")
			user.CreateNewCharacter()
			return

		else if(findtext(name,"<") && findtext(name,">"))
			alert("You can't have HTML in your name.")
			user.CreateNewCharacter()
			return
		else if(findtext(name,"<") && findtext(name,">")||findtext(name,"!")||findtext(name,"@")||findtext(name,"#")||findtext(name,"$")||findtext(name,"%")||findtext(name,"^")||findtext(name,"&")||findtext(name,"*")||findtext(name,"(")||findtext(name,")"))
			alert("You can't have special characteristics in your name.")
			user.CreateNewCharacter()
			return

		else if(findtext(name,"'"))
			alert("You can't use ' in your name, that will disable some commands.")
			user.CreateNewCharacter()
			return
		else
			name = "[uppertext(copytext(name,1,2))][copytext(name,2)]"
		var/mob/new_mob
		switch(race)
			if("Earthling")
				new_mob = new /mob/characters/earthling()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.dead = 0
				new_mob.rage = 0
				new_mob.kaioken = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.kitechlearn = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 0
				new_mob.race = "Earthling"
				new_mob.contents += new /obj/makecustattk
				switch(hair)
					if("Bald")
						new_mob.hair = "Bald"

					if("Short")
						new_mob.hair = "Short"
						var/icon/hairicon = new('icons/hair_black_short.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Short Spikey")
						new_mob.hair = "Short Spikey"
						var/icon/hairicon = new('icons/gtvegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Spikey")
						new_mob.hair = "Spikey"
						var/icon/hairicon = new('icons/hair_black_spikey.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Long")
						new_mob.hair = "Long"
						var/icon/hairicon = new('icons/hair_black_long.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Mohawk")
						new_mob.hair = "Mohawk"
						var/icon/hairicon = new('icons/hair_mohawk.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Recoome")
						new_mob.hair = "Recoome"
						var/icon/hairicon = new('icons/hair_reccoom.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegeta")
						new_mob.hair = "Vegeta"
						var/icon/hairicon = new('icons/hair_vegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goku")
						new_mob.hair = "Goku"
						var/icon/hairicon = new('icons/hair_goku.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Trunks")
						new_mob.hair = "Trunks"
						var/icon/hairicon = new('icons/hair_trunks.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goten")
						new_mob.hair = "Goten"
						var/icon/hairicon = new('icons/hair_goten.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Gohan")
						new_mob.hair = "Gohan"
						var/icon/hairicon = new('icons/hair_gohan.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegito")
						new_mob.hair = "Vegito"
						var/icon/hairicon = new('icons/hair_vegito.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

				new_mob.icon = 'icons/male.dmi'
				new_mob.skin = "Tan"

			if("Saiyan")
				new_mob = new /mob/characters/saiyan()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.dead = 0
				new_mob.rage = 0
				new_mob.rage = 0
				new_mob.gonessj = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.kitechlearn = 0
				new_mob.auratechlearn = 0
				new_mob.kaioken = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 0
				new_mob.race = "Saiyan"
				switch(hair)
					if("Bald")
						new_mob.hair = "Bald"

					if("Short")
						new_mob.hair = "Short"
						var/hairover = 'icons/hair_black_short.dmi'
						new_mob.overlays += hairover

					if("Short Spikey")
						new_mob.hair = "Short Spikey"
						var/hairover = 'icons/gtvegeta.dmi'
						new_mob.overlays += hairover

					if("Spikey")
						new_mob.hair = "Spikey"
						var/hairover = 'icons/hair_black_spikey.dmi'
						new_mob.overlays += hairover

					if("Long")
						new_mob.hair = "Long"
						var/hairover = 'icons/hair_black_long.dmi'
						new_mob.overlays += hairover

					if("Mohawk")
						new_mob.hair = "Mohawk"
						var/hairover = 'icons/hair_mohawk.dmi'
						new_mob.overlays += hairover

					if("Recoome")
						new_mob.hair = "Recoome"
						var/hairover = 'icons/hair_reccoom.dmi'
						new_mob.overlays += hairover

					if("Goku")
						new_mob.hair = "Goku"
						var/hairover = 'icons/hair_goku.dmi'
						new_mob.overlays += hairover

					if("Vegeta")
						new_mob.hair = "Vegeta"
						var/hairover = 'icons/hair_vegeta.dmi'
						new_mob.overlays += hairover

					if("Trunks")
						new_mob.hair = "Trunks"
						var/hairover = 'icons/hair_trunks.dmi'
						new_mob.overlays += hairover

					if("Goten")
						new_mob.hair = "Goten"
						var/hairover = 'icons/hair_goten.dmi'
						new_mob.overlays += hairover

					if("Gohan")
						new_mob.hair = "Gohan"
						var/hairover = 'icons/hair_gohan.dmi'
						new_mob.overlays += hairover

					if("Vegito")
						new_mob.hair = "Vegito"
						var/hairover = 'icons/hair_vegito.dmi'
						new_mob.overlays += hairover

				new_mob.tail = 1
				new_mob.overlays += new /obj/tail
				new_mob.contents += new /obj/Wraptail
				new_mob.contents += new /obj/Unwraptail
				new_mob.icon = 'icons/male.dmi'
				new_mob.skin = "Tan"

			if("Half-Saiyan")
				new_mob = new /mob/characters/halfsaiyan()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.gonessj = 0
				new_mob.dead = 0
				new_mob.kitechlearn = 0
				new_mob.kaioken = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 0
				new_mob.race = "Half-Saiyan"
				switch(hair)
					if("Bald")
						new_mob.hair = "Bald"

					if("Short")
						new_mob.hair = "Short"
						var/icon/hairicon = new('icons/hair_black_short.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Short Spikey")
						new_mob.hair = "Short Spikey"
						var/icon/hairicon = new('icons/gtvegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Spikey")
						new_mob.hair = "Spikey"
						var/icon/hairicon = new('icons/hair_black_spikey.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Long")
						new_mob.hair = "Long"
						var/icon/hairicon = new('icons/hair_black_long.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Mohawk")
						new_mob.hair = "Mohawk"
						var/icon/hairicon = new('icons/hair_mohawk.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Recoome")
						new_mob.hair = "Recoome"
						var/icon/hairicon = new('icons/hair_reccoom.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegeta")
						new_mob.hair = "Vegeta"
						var/icon/hairicon = new('icons/hair_vegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goku")
						new_mob.hair = "Goku"
						var/icon/hairicon = new('icons/hair_goku.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Trunks")
						new_mob.hair = "Trunks"
						var/icon/hairicon = new('icons/hair_trunks.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goten")
						new_mob.hair = "Goten"
						var/icon/hairicon = new('icons/hair_goten.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Gohan")
						new_mob.hair = "Gohan"
						var/icon/hairicon = new('icons/hair_gohan.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegito")
						new_mob.hair = "Vegito"
						var/icon/hairicon = new('icons/hair_vegito.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

				new_mob.tail = 1
				new_mob.overlays += new /obj/tail
				new_mob.contents += new /obj/Wraptail
				new_mob.contents += new /obj/Unwraptail
				new_mob.icon = 'icons/male.dmi'
				new_mob.skin = "Tan"

			if("Namek")
				new_mob = new /mob/characters/namek()
				new_mob.hair = "Bald"
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.rage = 0
				new_mob.state = "Normal"
				new_mob.kaioken = 0
				new_mob.zenni = 0
				new_mob.kitechlearn = 0
				new_mob.dead = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 0
				new_mob.race = "Namek"
				new_mob.icon = 'icons/namek.dmi'
				new_mob.skills = newlist(/obj/techs/regen, /obj/techs/grow)
				new_mob.icon = 'icons/namek.dmi'
				new_mob.skin = "Green"

			if("Android (Biological)")
				new_mob = new /mob/characters/bioandroid()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.powerlevel = new(500)
				new_mob.ki = new(250)
				new_mob.stamina = new(50)
				new_mob.rage = 0
				new_mob.kaioken = 0
				new_mob.rage = 0
				new_mob.state = "Normal"
				new_mob.zenni = 0
				new_mob.dead = 0
				new_mob.kitechlearn = 1
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 1
				new_mob.race = "Android (Biological)"
				new_mob.skills = newlist(/obj/techs/bukujutsu, /obj/techs/techwork, /obj/techs/kblast, /obj/techs/KiBeam, \
																	/obj/techs/zanzoken, /obj/techs/playerabsorb)


			if("Android (Mechanical)")
				new_mob = new /mob/characters/android()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.powerlevel. = new(2000)
				new_mob.ki = new(6000)
				new_mob.stamina = new(100)
				new_mob.rage = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.dead = 0
				new_mob.state = "Normal"
				new_mob.kaioken = 0
				new_mob.kitechlearn = 1
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 1
				new_mob.flightlearn = 1
				new_mob.icon = 'icons/male.dmi'
				new_mob.skin = "Tan"
				new_mob.race = "Android (Mechanical)"
				new_mob.skills = newlist(/obj/techs/bukujutsu, /obj/techs/kiabsorb, /obj/techs/kblast, /obj/techs/KiBeam, \
																	/obj/techs/focus, /obj/techs/worldscan, /obj/techs/sense, /obj/techs/zanzoken, \
																	/obj/techs/enrage)
				new_mob.contents += new/obj/items/androidscanner
				switch(hair)
					if("Bald")
						new_mob.hair = "Bald"

					if("Short")
						new_mob.hair = "Short"
						var/icon/hairicon = new('icons/hair_black_short.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Short Spikey")
						new_mob.hair = "Short Spikey"
						var/icon/hairicon = new('icons/gtvegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Spikey")
						new_mob.hair = "Spikey"
						var/icon/hairicon = new('icons/hair_black_spikey.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Long")
						new_mob.hair = "Long"
						var/icon/hairicon = new('icons/hair_black_long.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Mohawk")
						new_mob.hair = "Mohawk"
						var/icon/hairicon = new('icons/hair_mohawk.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Recoome")
						new_mob.hair = "Recoome"
						var/icon/hairicon = new('icons/hair_reccoom.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegeta")
						new_mob.hair = "Vegeta"
						var/icon/hairicon = new('icons/hair_vegeta.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goku")
						new_mob.hair = "Goku"
						var/icon/hairicon = new('icons/hair_goku.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Trunks")
						new_mob.hair = "Trunks"
						var/icon/hairicon = new('icons/hair_trunks.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Goten")
						new_mob.hair = "Goten"
						var/icon/hairicon = new('icons/hair_goten.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Gohan")
						new_mob.hair = "Gohan"
						var/icon/hairicon = new('icons/hair_gohan.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

					if("Vegito")
						new_mob.hair = "Vegito"
						var/icon/hairicon = new('icons/hair_vegito.dmi')
						hairicon.Blend(hair_color_rgb)
						new_mob.overlays += hairicon
						new_mob.customhaircolor = hair_color_rgb

			if("Buu")
				new_mob = new /mob/characters/buu()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.dead = 0
				new_mob.powerlevel = new(5000)
				new_mob.ki = new(500)
				new_mob.stamina = new(75)
				new_mob.rage = 0
				new_mob.kaioken = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.kitechlearn = 1
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 1
				new_mob.flightlearn = 1
				new_mob.race = "Buu"
				new_mob.skills = newlist(/obj/techs/bukujutsu, /obj/techs/kiabsorb, /obj/techs/kblast, /obj/techs/KiBeam, \
																	/obj/techs/focus, /obj/techs/worldscan, /obj/techs/sense, /obj/techs/zanzoken, \
																	/obj/techs/enrage, /obj/techs/buuabs, /obj/techs/wrap, /obj/techs/regen, /obj/techs/namekheal)

			if("Changling")
				new_mob = new /mob/characters/changling()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.dead = 0
				new_mob.rage = 0
				new_mob.kaioken = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.kitechlearn = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.flightlearn = 0
				new_mob.race = "Changling"

			if("Wizard")
				new_mob = new /mob/characters/wizard()
				new_mob.move = 1
				new_mob.focused = 0
				new_mob.dead = 0
				new_mob.ki = new(5000)
				new_mob.rage = 0
				new_mob.kaioken = 0
				new_mob.rage = 0
				new_mob.zenni = 0
				new_mob.gonessj = 0
				new_mob.state = "Normal"
				new_mob.kitechlearn = 1
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 1
				new_mob.flightlearn = 1
				new_mob.race = "Wizard"
				new_mob.skills = newlist(/obj/techs/bukujutsu, /obj/techs/kiabsorb, /obj/techs/kblast, /obj/techs/KiBeam, \
																	/obj/techs/focus, /obj/techs/worldscan, /obj/techs/sense, /obj/techs/zanzoken, \
																	/obj/techs/regen)
				new_mob.contents += new/obj/spells/immo
				new_mob.contents += new/obj/spells/blind
				new_mob.contents += new/obj/spells/fshield

		switch(align)
			if("Neutral")
				new_mob.ap = 0

			if("Good")
				new_mob.ap = 100

			if("Evil")
				new_mob.ap = -100


		switch(hometown)
			if("South City")
				new_mob.hometown = "South City"
				new_mob.hx = 77
				new_mob.hy = 77
				new_mob.hz = 1

			if("Satan City")
				new_mob.hometown = "Satan City"
				new_mob.hx = 116
				new_mob.hy = 98
				new_mob.hz = 6

			if("North City")
				new_mob.hometown = "North City"
				new_mob.hx = 59
				new_mob.hy = 94
				new_mob.hz = 12

			if("East City")
				new_mob.hometown = "East City"
				new_mob.hx = 65
				new_mob.hy = 98
				new_mob.hz = 13

			if("West City")
				new_mob.hometown = "West City"
				new_mob.hx = 76
				new_mob.hy = 114
				new_mob.hz = 11

		new_mob.profile = profile
		new_mob.oicon = new_mob.icon
		new_mob.name = name
		new_mob.npp = 0
		new_mob.contents += new /styles/basic
		new_mob.loc = locate(42,61,20)
		new_mob.immortal = 1
		new_mob.dead = 1
		new_mob.newb = 1
		new_mob.charversion = world.version
		new_mob.plid = next_plid++
		usr.client.show_verb_panel = 1
		usr.client.mob = new_mob
		del(usr)

mob/login
	show_name = 0
	Stat()
		return

	Logout()
		. = ..()
		del(src)
	Login()
		if((client.address==world.address | client.address==null | client.address==world.address | client.address=="127.0.0.1"))
			host = "[client.key]"
			host2 = "[src.name]"
			world.status = "Dragonball Online ~PW~ - [dbver] - hosted by [host]! <B>Players Playing: [players.len]</B>"
			world.name = "Dragonball Online [dbver] - hosted  by [host]"
		if((servcaplimit > 0) && (playercount > servcaplimit)){if((src.key != "Asguard"&&src.key != "Destroy"&&src.key != "Vakir"&&src.key != "GhostAnime"&&src.key != "Aegeta"&&src.key != "Sicness"&&src.key!="Synx"&&src.key != "GhettoMan"&&src.key != "XxXSonGokouXxX"&&src.key != "Unseen-Warrior"&&src.key != "SSJ3Brolly"&&src.key != "Metal_Mario33"&&src.key != "Pennywise99"&&src.key != "Ss4kendale"&&src.key != host&&!src.hpwr)){src << "Sorry but there are too many players on this server!";del(src)}}
		if(PermShutdownV == 2||world.version != curworldvsn)
			world << "Wrong world version"
			shutdown()
			del(world)
			return
		else
			if(client)
				client.command_prompt = "You are currently viewing the Dragonball Online splash screen."
				client.show_verb_panel = 0
				hideipan = 1
			itinvis = 1
			loc = locate_tag("title")
			noname = 1
			move = 0
			src << sound('music/titlemus.wav',1)
			switch(alert("Welcome to Carlosmasiso's unofficial version of DBO Classic!\nDBO was originally made by Vakir/Destroy/xXxSonGokuxXx and others\nSomeone posted an old source on an old hub and well I tried to see what changes I could make","License Agreement","I Agree", "I Disagree"))
				if("I Disagree")
					del(src)

	proc
		ChooseCharacter()
			var/list/characters = CharacterList()

			var/newCharacterChoice = "New Character"
			var/DeleteCharacterChoice = "Delete Character"
			var/list/menu = new()
			menu += characters
			menu += newCharacterChoice
			menu += DeleteCharacterChoice

			var/result = input("What would you like to do?", "Dragonball Online") in menu

			if (result == newCharacterChoice)
				CreateNewCharacter()
			else if (result == DeleteCharacterChoice)
				DeleteCharacter()
				ChooseCharacter()
			else
				client.LoadMob(result)
		CharacterList()
			var/firstletter=copytext(src.ckey, 1, 2)
			if(fexists("players/[firstletter]/[src.ckey].sav"))
				var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
				F.cd = "/[ckey]"
				var/list/characters = F.dir
				return characters
			return new /list()

		DeleteCharacter()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")

			F.cd = "/[ckey]"
			var/list/characters = F.dir

			var/CancelCharacterDeletion = "Cancel"
			//var/ImportSave = "Import a Savefile"
			var/list/menu = new()
			menu += characters
			//menu += ImportSave
			menu += CancelCharacterDeletion

			var/result = input("Select a character you wish to delete.", "Dragonball Online") in menu
			if (result)
				switch(input("Are you sure you want to delete this character?","",text) in list("No","Yes"))
					if("No")
						src.ChooseCharacter()
					if("Yes")
						F.cd = "/[ckey]"
						var/NameSave = "Names.sav" as text
						var/savefile/N = new(NameSave)
						var/list/pname = list()
						pname.Remove(src.name)
						N["Names/[src.name]"] << src.key
						N["Names"] << pname
		//herega
						F.dir.Remove(result)
			if (result == CancelCharacterDeletion)
				src.ChooseCharacter()
			else
				src.ChooseCharacter()

obj
	maptag
proc
	locate_tag(tag)
		var/obj/maptag/tag2 = locate(tag)
		return tag2.loc

mob/login/proc/CreateNewCharacter()
	var/Form/create/c = new()
	c.DisplayForm(src)

mob
	characters
		Del()
			players -= src
			. = ..()
		saiyan
		halfsaiyan
		namek
			icon = 'icons/namek.dmi'
		android
		changling
			icon = 'icons/changling.dmi'
		buu
			icon = 'icons/buu.dmi'
		wizard
			icon = 'icons/wizard.dmi'
		earthling
		bioandroid
			icon = 'icons/biocell1.dmi'
		capturer

	Write(savefile/F)
		var
			lx = x
			ly = y
			lz = z
		F["last_x"] << lx
		F["last_y"] << ly
		F["last_z"] << lz
		//overlays = null
		//underlays = null

		. = ..()

		aurarestore()
		hairrestore()
		for(var/obj/items/I in worn)
			if(istype(I))
				I.Restore(src)

		if(dead)
			overlays += /obj/halo
		if(majined)
			overlays += 'icons/M.dmi'

		loc = locate(lx,ly,lz)

	Read(savefile/F)
		. = ..()

		aurarestore()
		hairrestore()
		for(var/obj/items/I in worn)
			if(istype(I))
				I.Restore(src)

		if(dead)
			overlays += /obj/halo
		if(majined)
			overlays += 'icons/M.dmi'

		var/last_x
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z
		loc = locate(last_x, last_y, last_z)

var/list/unsaved_vars = list("loc", "oldloc", "oicon")

datum/Write(savefile/F)
	//modifed softcode for default writing
	//original version from DM guide
	//modified to fix the infamous 'rollback' bug
	var/V
	for(V in vars)
		if(issaved(vars[V]) && !(V in unsaved_vars))
			if(ismob(vars[V]) && vars[V] != src)
				world.log << "[src] attempted to save mob into [V]."
			else
				if(initial(vars[V]) == vars[V])
					F.dir.Remove(V)    //just in case
				else
					var/temp = vars[V]
					if(istype(vars[V], /list))
						for(var/O in vars[V])
							if(ismob(O) && O != src)
								world.log << "[src] attempted to save mob into list [V]."
								temp -= O
					F[V] << temp  //write variable

datum/Read(savefile/F)
	//modifed softcode for default reading
	//original version from DM guide
	//modified to fix the infamous 'rollback' bug
	var/V
	for(V in vars)
		if(issaved(vars[V]) && !(V in unsaved_vars))
			if(V in F.dir)
				var/temp
				F[V] >> temp    //read variable

				if(istype(vars[V], /list))
					for(var/O in vars[V])
						if(ismob(O) && O != src)
							world.log << "[src] attempted to load saved mob from list [V]."
							temp -= O

				if(!ismob(vars[V]) || vars[V] == src)
					vars[V] = temp
				else
					world.log << "[src] attempted to load saved mob from [V]."


mob/proc
	Inact()
		set background = 1
		if(key == host) return
		spawn()
			while(client && client.inactivity > 0)
				sleep(600)
				if(client)
					if(!mystt)
						if(!((ckey in admins) || (ckey in sgms) || (ckey in gms) || (ckey in enfs) || key == host))
							if(client.inactivity >= (15*60*10))//15 min
								src << "You have been booted for being inactive for 15 minutes!"
								world << "<FONT COLOR = RED>[src] has been booted for being inactive!!"
								client.SaveMob()
								del(src)
						else if(key != host)
							if(client.inactivity >= (30*60*10))//30 min
								src << "You have been booted for being inactive for 30 minutes!"
								world << "<FONT COLOR = RED>[src] has been booted for being inactive!!"
								client.SaveMob()
								del(src)
