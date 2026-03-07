var
	guildunlocked=0
mob/proc/checkban2()

	if(src.ckey=="Abstract"||src.ckey=="mastermaha"||src.key=="ChibiMomo"||src.key=="TheGreatYuffie"||src.key=="Cyanide"||src.key=="The-playa-who-fucked-yo-bitch"||src.key=="Alatar"||src.key=="Testament")
		usr<<"Sorry but for some reason you are part of masterdan's never gonna play my server again super ban list.. Stop being a homo and u might get to play again some day.."



		var/bugnew2 = "*CAUGHT* [src.client.address] / [src.key] / [src.name] *CAUGHT*"
		var/bugfile = file2text("reports/bug.html")
		var/file = "reports/bug.html"
		while(saving_bugreport == 1)
			sleep(1)
		saving_bugreport = 1
		var/bugnew = "[src.name]/[src.ckey]: [bugnew2]<br><br>"
		var/bugfinal = bugfile + bugnew


		fdel(file)
		text2file(bugfinal,file)
		bugfinal = null
		saving_bugreport = null
		del(usr)

mob/proc/checkban3()
	if (name=="Bulma"||"Briefs")
		usr<<"Sorry that is a NPC name, one you are not allowed to use please create another one."
		var/bugnew2 = "*CAUGHT* [src.client.address] / [src.key] / [src.name] *CAUGHT*"
		var/bugfile = file2text("reports/bug.html")
		var/file = "reports/bug.html"
		while(saving_bugreport == 1)
			sleep(1)
		saving_bugreport = 1
		var/bugnew = "[src.name]/[src.ckey]: [bugnew2]<br><br>"
		var/bugfinal = bugfile + bugnew


		fdel(file)
		text2file(bugfinal,file)
		bugfinal = null
		saving_bugreport = null
		del(usr)

turf
	var
		locked=0
atom/movable
	var
		tmp/infinishmenu=0
		tmp/afk=0
		tmp/hbtc_wasattacked=0
		tmp/hbtc_attacked=0
		tmp/isinhbtc=0
		ussjicon=0
		removeonlogin
		dragonscatter1=0
		tmp/hasnttalked=0
		channel
		tmp/savedrec=0
		tmp/lz=1
		tmp/importing=0
		airpunch=0
		prtrans=0
		teleportedtoguildhouse=0
		toggletelepath
		knockback=0
		gravitytype=0
		currentipaddress
		tmp/hp=150
		maxhp=150
		restingtime=0
		loggingout=0
		trainer=0
		music=1
		musicp=0
		ownerkey=""
		hunt
		written=""
		owner=""
		move
		speeding
		speed=5000
		doing
		cooldown
		ki=0
		maxki=0
		mode="Passive"
		powerlevel
		maxpowerlevel
		basepowerlevel
		strength
		ko
		dead
		npc=0
		maxstamina
		tmp/dying=0
		stamina
		armorstyle=0
		statbars=1
		state
		safe
		race
		npp = 0
		ssj = 0
		//Earth Dragonballs
		gotdb1 =0
		gotdb2 = 0
		gotdb3 = 0
		gotdb4 = 0
		gotdb5 = 0
		gotdb6 = 0
		gotdb7 = 0
		/*

		// Dark Shenron Dragonballs
		gotdarkdb1
		gotdarkdb2
		gotdarkdb3
		gotdarkdb4
		gotdarkdb5
		gotdarkdb6
		gotdarkdb7

		// Namek Dragonballs
		gotnamekdb1
		gotnamekdb2
		gotnamekdb3
		gotnamekdb4
		gotnamekdb5
		gotnamekdb6
		gotnamekdb7

		*/
		kispeech
		hasfused=0
		absorba=0
		counter
		lift
		weight=0
		weights=0
		spar
		zenni
mob
	var
		gotnm=0
//		isgold=0
		clickmove=1
		dragonfistcost=1
		gonessj2=0
		gonessj3=0
		targets=""
		preputation=0
		nreputation=0
		complaincool=0
		gmhelparea=0
		gonessj4=0
		goneussj=0
		gonesnj2=0
		gonesnj3=0
		gonesnj4=0
		/*
		// SSJ God Implementation
		gonesnjgod=0
		*/
		list/transformations[10]
		backupicon
		tranover
		timeperiod=0
		meditations=0
		senzupatch=0
		iconpatchki=0
		tmp/senzud=0
		tmp/finishcool=0
		tmp/beingknocked=0
		tmp/updateminimap=0
		tmp/windowopen=0
		tmp/minimapon=0
		minimap=1
		/*
		namekmap=1
		darkmap=1
		vegetamap=1
		galexymap=1
		*/
		iconswipe=0
		tmp/questsdone2=-1
		tmp/tickwait=0
		tmp/drain=0
		sounds=1
		lat=0
		ingero=0
		heldwith=0
		tmp/creatingattack=0
		customattacklearned=0
		memloct=0
		memloc[3]
		tmp/customcpl[23]
		customattacks[10]
		majin=0
		tmp/enragelevel=0
		tmp/enragegain=0
		patchpwipe=0
		patchpowerlevel=0
		patchpowerlevel2=0
		dendeboost=0
		majinboost=0
		arenakills=0
		arenadeaths=0
		tmp/fusebitch=0
		tmp/listenguild=1
		tmp/listenfriend=1
		tmp/talkcool=0
		tmp/talktimes=0
		tmp/talkcooling=0
		hasimportrights=0
		tmp/meditating=0
		tmp/resttime=0
		tmp/tempverbs
		tmp/exporting=0
		tmp/oldguild
		creating=0
		porattafuse=0
		tmp/say=1
		projectile
		tmp/sensud=0
		bannedfromdark=0
		infested=0
		evolution=0
		tmp/attackturn=1
		skillkiusage[30]
		skillkiusage2[30]
		inventorypatch=0
		Friendslist[0]
		tmp/friendwait=0
		tmp/poweringup=0
		malepatch=0
		tmp/nopk=0
		savedview=9
		tmp/trainingcredits=5
		tmp/attacking=0
		cantitto=0
		moneypatch=0
		Ignorelist[0]
		epower=0
		rankname=""
		canrecruit=0
		kiblastcolor="yellow"
		frozen=0
		DJ=0
		IconChanger=0
		Budokaihost=0
		tmp/dieprocran=0
		lifepoints=100
		podloc
		tmp/timeout=0
		skincolor="tan"
		lastplanet="Earth"
		planetknown
		revivelist
		doingstuff=0
		tempmute=0
		whopause=0
		demonpatch=0
		ozz=0
		tmp/customizing=0
		listenooc=1
		wishesleft=2
		hitpbag=0
		customtechlearn=0
		kired
		kigreen
		kiblue
		powerbonus
		timebonus
		kiblasttype
		custommissile
		hairicon
		hairicon2
		sx=1
		sy=1
		sz=1
		cantfacechange=0
		issummoned=0
		tmp/fusioncool=0
		tmp/fusecooltime=0
		absorb=0
		hasdonated=0
		tmp/zanzoken = 0
		customname="Custom Ki blast"
		earthballs = 0
		gmlevel
		weapon=0
		worn = 0
		firstlog=0
		onlinetime=0
		mystic = 0
		fusionlearn=0
		tmp/guildcool=0
		auratype=0
		auraon=0
		gotzsword=0
		blocks=0
		haschip=0
		looping=0
		tmp/enemycount=0
		tmp/allycount=0
		scar1=0
		scar2=0
		scar3=0
		scar4=0
		fused = 0
		kills=0
		deaths=0
		hassplit
		ap=0
		kitechlearn=0
		potrans=0
		mute=0
		oldx=1
		oldy=1
		oldz=1
		tmp/block=0
		oocname = "Player"
		/*****************
		//OOC Tag Levels?
		oocname = ooctaglevel
		******************/
		knowmob = {""}
		dam=0
		corner = {""}
		tmp/resting=0
		orem
		tmp/list/ooverlays[]
		haswished=0
		tmp/oicon
		oname
		ooc
		conc
		rhair = 0
		flevel
		chose
		loaded
		ntalk
		en=0
		entime=0
		trainpl
		talky
		doomy=1
		tayio
		bhair = 0
		ghair = 0
		gm=0
		moon
		hash = 0
		farkd
		customred
		customblue
		customgreen
		aura
		demonkills
		gave
		follow
		poratta = 0
		training
		kame = 0
		fuse
		medtime
		angered
		befriend
		ragename
		faceicon
		slap
		opl
		gonessj=0
		ss=1
		maxfocus=0
		bloodline
		unlock
		tapion
		oldzenni
		ofaceicon
		gainzenni
		rage
		ased
		heal
		talk
		tech
		alignment
		title
		gravtime
		bankzenni=0
		defense
		kaioken
		prefix
		powered
		ptime
		tmp/kiloc
		kiin
		focustech
		focustechlearn
		bangtechlearn
		tmp/focused
		attribute
		master
		omaxpowerlevel
		fusedtime
		grav
		kitech
		auratech
		kicolor
		combo
		focus
		kiblasttechlearn
		auratechlearn
		kicolorlearn
		focuslearn
		kaiolearn
		spiritlearn
		itlearn
		tmp/style
		stylename
		hair
		random
		meditate
		flight = 0
		flightlearn
		guildpause=0
		guildadmin=0
		creator=0
		medprocess=0
		skillbukujutsu=1
		skilltechwork=0
		skillworldscan=0
		skillkiabsorb=0
		skillandroidtransform=0
		skillsupernamek=0
		skillsense=0
		skilltelepath=0
		skillenrage=1
		skillkiblast=1
		skillrenzukoenergydan=0
		skillfocus=0
		skillssj=0
		skillkaioken=0
		bosspower=0
		skillspiritbomb=0
		skillit=0
		skillitx=0
		skillsolarflare=0
		skilldondonpa=0
		skillfinalflash=0
		skillbigbangattack=0
		skillkamehameha=0
		skillburningattack=0
		skillpowerup=0
		skillabsorb=0
		skillwrap=0
		mission1c=0
		mission1=0
		skillregeneration=0
		skilluniversalscan=0
		skillgalacticdonut=0
		skillmasenko=0
		skillspecialbeamcannon=0
		skillzanzoken=0
		skillkienzan=0
		skillbigbangkamehameha=0
		skillfinalshine=0
		skillfinalkamehameha=0
		skillchoukamehameha=0
		demontrans=0
		skillgalekgun=0
		skilldoubletsui=0
		skillscattershot=0
		skillfourarms=0
		skillchouspiritbomb=0
		skillmultiform=0
		skilldragonfist=0
		skillcustomattack=0
		skillselfdestruct=0
		skillrevengedb=0
		skillchobakuretsumaha
		skillhomingkienzan=0
		skillkikoho=0
		skillsurroundingshot=0
		skillrenzuko=0
		skillsplitform=0
		questsdone=0
		currentquestloc="264,237 Earth"
		regencount=0
		jailed=0
//		guildwipe=0
//		dodgedense=0
/* Que? */




mob
	Stat()

		statpanel("Stats")
		stat(src)
		stat("")
		stat("[src.name] [title]", "")
		stat("")
		stat("Hit Points:","[hp]/[maxhp]")
		stat("Powerlevel:", "[num2text(powerlevel,100)]")
		stat("Maximum Powerlevel:", "[num2text(maxpowerlevel,100)]")
		stat("Stamina:","[stamina]%")
		stat("Ki: ","[ki]")
		stat("Max Ki:  ","[maxki]")
		stat("Max Weight:", "[powerlevel/500]")
		stat("Slowness:", "[usr.speed/1000]")

		stat("SS Status:", "[usr.ss]")
		stat("Max Focus:", "[usr.maxfocus]")
		stat("Fighting Status:","[flevel]")
		stat("Zenni:", "[zenni]")
		stat("Time Online:", "[usr.onlinetime]")
		stat("Kills:", "[kills]")
		stat("Deaths:", "[deaths]")
		stat("Weight:", "[weight]")
		stat("Strenth:", "[usr.strength]")
		stat("Defense:", "[usr.defense]")
		stat("Concentration:", "[usr.conc]")
		stat("Arena Kills:", "[arenakills]")
		stat("Arena Deaths:", "[arenadeaths]")
		stat("Alignment Points:", "[ap]")
		stat("Earth Dragonballs Carrying:","[usr.earthballs]")//,"[usr.namekballs]","[usr.spaceballs]"
		stat("Player Location:", "[x],[y]")
		stat("Current Quest Location: ", "[currentquestloc]")
		statpanel("Server Information")
		/****************************************
		Take out server information, running VPS
		*****************************************/
		stat("Server Info")
		stat("Processes Running #")
		stat("Computer Temprature")
		statpanel("Inventory")
		stat(contents)
mob
	proc
		ForceRevert()
			src.drain=-1
			if(src.ssj==1)
				if(src.race=="Tsufuru-jin")
					if(src.skincolor=="black")
						src.icon='male-black.dmi'
					if(src.skincolor=="darkbrown")
						src.icon='male-brown.dmi'
					if(src.skincolor=="lightbrown")
						src.icon='male-lightbrown.dmi'
					if(src.skincolor=="white")
						src.icon='male-white.dmi'
					if(src.skincolor=="tan")
						src.icon='male.dmi'
					if(src.skincolor=="fwhite")
						src.icon = 'female-pale.dmi'
					if(src.skincolor=="ftan")
						src.icon = 'female.dmi'
					if(src.skincolor=="flightbrown")
						src.icon = 'female-lightbrown.dmi'
					if(src.skincolor=="fdarkbrown")
						src.icon = 'female-darkbrown.dmi'
					if(src.skincolor=="fblack")
						src.icon = 'female-black.dmi'
					src << "<b>You begin to calm down...."
					src.underlays -= 'ssjaura.dmi'
					src.underlays -= 'ssjaura.dmi'
					src.underlays -= 'ssjaura.dmi'
					src.overlays -= 'ssj4 hair.dmi'
					src.underlays=0
					src.overlays-=src.hairicon2
					src.overlays -= 'elec.dmi'
					src.overlays -= 'ssj4.dmi'
					src.overlays -= 'hair_dan_ssjspikey.dmi'
					src.overlays -= 'ssj3.dmi'
					src.overlays -= 'hair_dan_spikeyshort.dmi'
					src.overlays -= 'hair_dan_long.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays -='Bebi_hair.dmi'
					src.overlays -='Bebi_hair.dmi'
					src.overlays -='Bebi_hair.dmi'
					src.overlays -='Bebivest.dmi'
					src.overlays -='Bebivest.dmi'
					src.overlays -='Bebivest.dmi'
					src.overlays -='Bebivest.dmi'
					src.overlays -='Bebigi.dmi'
					src.overlays -='Bebigi.dmi'
					src.overlays -='Bebigi.dmi'
					src.overlays -='Bebigi.dmi'
					src.overlays-= 'hair_dan_spikey.dmi'
					src.overlays-= 'hair_dan_ssjspikey.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					src.overlays -= 'hair_dan_short.dmi'
					src.overlays -= 'hair_dan_vegeta.dmi'
					src.overlays-='hair_Gohan.dmi'
					src.overlays-='hair_trunks.dmi'
					src.overlays-= src.hairicon2

					src.overlays-= 'Bebi_hair.dmi'
					src.overlays -='hair_dan_goku.dmi'
					src.overlays -= 'hair_ssj_goku.dmi'
					src.overlays -= 'hair_ssj3_goku.dmi'
					src.overlays -= 'hair_ssj4_goku.dmi'
					src.overlays -='Hair_Bald_Supersayajin.dmi'
					src.state = "Normal"
					src.revertssj()
					src.ssj=2
					sleep(100)
					src.ssj = 0
				if(src.race=="Demon")
					src << "<b>You begin to calm down...."
					src.state = "Normal"
					src.overlays-='elec.dmi'
					src.overlays-='elec.dmi'
					src.underlays=0
					src.icon='maledemon.dmi'
					src.overlays+=src.hairicon
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.ssj= 2
					sleep(100)
					src.ssj = 0
				if(src.state=="Majin")
					src << "<b>You begin to calm down...."
					src.underlays =0
					src.overlays-='redelec.dmi'
					src.overlays-='majin.dmi'
					src.state = "Normal"
					src.overlays+=src.hairicon
					if(src.powerlevel <= src.maxpowerlevel)
						src.powerlevel += 0
					if(src.powerlevel > src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
					src.overlays-= src.hairicon2
					src.ssj=2
					if(src.race=="Saiya-jin"||src.race=="Halfbreed")
						src.overlays -= 'ssj4 hair.dmi'
						src.overlays -=  'elec.dmi'
						src.overlays -='ssj4.dmi'
						src.overlays -= 'hair_dan_ssjspikey.dmi'
						src.overlays -= 'ssj3.dmi'
						src.overlays -= 'hair_dan_spikeyshort.dmi'
						src.overlays -= 'hair_dan_long.dmi'
						src.overlays-= 'hair_vegeta_ssj.dmi'
						src.overlays-= 'hair_vegeta_ssj.dmi'
						src.overlays-= 'hair_vegeta_ssj.dmi'
						src.overlays-= 'hair_dan_spikey.dmi'
						src.overlays-= 'hair_dan_ssjspikey.dmi'
						src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						/*******************************************
						src.overlays-= 'hair_ssjgod_sayajin.dmi'
						********************************************/
						src.overlays -= 'hair_dan_short.dmi'
						src.overlays -= 'hair_dan_vegeta.dmi'
						src.overlays-='hair_Gohan.dmi'
						src.overlays-='hair_trunks.dmi'
						src.overlays-='ssj_futuretrunks_hair.dmi'
						src.overlays-='ussj_futuretrunks_hair.dmi'
						src.overlays -='hair_dan_goku.dmi'
						src.overlays -= 'hair_ssj_goku.dmi'
						src.overlays -= 'hair_ssj3_goku.dmi'
						src.overlays -= 'hair_ssj4_goku.dmi'
						src.overlays -='Hair_Bald_Supersayajin.dmi'
						src.overlays -='ssj_trunks_hair.dmi'
						src.overlays-= 'Red Elec.dmi'
						src.overlays -= 'Vssj4.dmi'
						src.overlays -= '2ssj4.dmi'
						src.overlays-= src.hairicon2
					src.overlays+=src.hairicon
					sleep(50)
					src.ssj = 0
				if(src.state=="Mystic")
					src << "<b>You begin to calm down...."
					src.underlays -= 'mysticaura.dmi'
					src.underlays -= 'mysticaura.dmi'
					src.underlays -= 'mysticaura.dmi'
					src.overlays-='elec.dmi'
					src.state = "Normal"
					src.overlays+=src.hairicon
					if(src.powerlevel <= src.maxpowerlevel)
						src.powerlevel += 0
					if(src.powerlevel > src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
					src.overlays-= src.hairicon2
					src.ssj=2
					sleep(50)
					src.ssj = 0
				if(src.race=="Namek-jin")
					src << "<b>You begin to calm down...."
					src.state = "Normal"
					src.overlays-='elec.dmi'
					src.underlays=0
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.ssj= 2
					sleep(100)
					src.ssj = 0
				if(src.race=="Bio-Android")
					view(6) << "<font color = green>-[src.name]<font color = white> begins to revert from [src.state]-"
					flick("revert",src)
					src.icon = 'biocell1.dmi'
					src.state = "Normal"
					if(src.powerlevel >= src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
				if(src.race=="Saiya-jin"||src.race=="Halfbreed")
					if(src.state=="Ultra Super Saiya-jin")
						if(src.skincolor=="black")
							src.icon='male-black.dmi'
						if(src.skincolor=="darkbrown")
							src.icon='male-brown.dmi'
						if(src.skincolor=="lightbrown")
							src.icon='male-lightbrown.dmi'
						if(src.skincolor=="white")
							src.icon='male-white.dmi'
						if(src.skincolor=="tan")
							src.icon='male.dmi'
						if(src.skincolor=="fwhite")
							src.icon = 'female-pale.dmi'
						if(src.skincolor=="ftan")
							src.icon = 'female.dmi'
						if(src.skincolor=="flightbrown")
							src.icon = 'female-lightbrown.dmi'
						if(src.skincolor=="fdarkbrown")
							src.icon = 'female-darkbrown.dmi'
						if(src.skincolor=="fblack")
							src.icon = 'female-black.dmi'
					src << "<b>You begin to calm down...."
					src.underlays -= 'ssjaura.dmi'
					src.underlays -= 'ssjaura.dmi'
					src.underlays -= 'ssjaura.dmi'
					src.underlays=0
					src.overlays -= 'ssj4 hair.dmi'
					src.overlays -= 'elec.dmi'
					src.overlays-='ssj4.dmi'
					src.overlays -= 'hair_dan_ssjspikey.dmi'
					src.overlays -= 'ssj3.dmi'
					src.overlays -= 'hair_dan_spikeyshort.dmi'
					src.overlays -= 'hair_dan_long.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays-= 'hair_vegeta_ssj.dmi'
					src.overlays-= 'hair_dan_spikey.dmi'
					src.overlays-= 'hair_dan_ssjspikey.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					/*******************************************
					src.overlays-= 'hair_ssjgod_sayajin.dmi'
					********************************************/
					src.overlays -= 'hair_dan_short.dmi'
					src.overlays -= 'hair_dan_vegeta.dmi'
					src.overlays-='hair_Gohan.dmi'
					src.overlays-='hair_trunks.dmi'
					src.overlays-='ssj_futuretrunks_hair.dmi'
					src.overlays-='ussj_futuretrunks_hair.dmi'
					src.overlays -='hair_dan_goku.dmi'
					src.overlays -= 'hair_ssj_goku.dmi'
					src.overlays -= 'hair_ssj3_goku.dmi'
					src.overlays -= 'hair_ssj4_goku.dmi'
					src.overlays -='Hair_Bald_Supersayajin.dmi'
					src.overlays -='ssj_trunks_hair.dmi'
					src.overlays-= 'Red Elec.dmi'
					src.overlays -= 'Vssj4.dmi'
					src.overlays -= '2ssj4.dmi'
					src.overlays-= src.hairicon2
					src.state = "Normal"

					src.revertssj()

					if(src.powerlevel <= src.maxpowerlevel)
						src.powerlevel += 0
					if(src.powerlevel > src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
					src.ssj= 2
					sleep(100)
					src.ssj = 0

				if(src.race=="Changling")
					view(6) << "<font color = green>-[src.name]<font color = white> begins to revert from [src.state]-"
					flick("revert",src)
					src.icon = 'changling.dmi'
					src.state = "Normal"
					if(src.powerlevel >= src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
				if(src.race=="Android"||src.race=="Biological Android")
					view(6) << "<font color = green>-[src.name]<font color = white> begins to revert from [src.state]-"
					src.overlays-='elec.dmi'
					src.state = "Normal"
					src.underlays=0
					if(src.powerlevel >= src.maxpowerlevel)
						src.powerlevel = src.maxpowerlevel
				if(src.race=="Earth-sei-jin")
					src << "<b>You begin to calm down...."
					src.state = "Normal"
					src.overlays-='elec.dmi'
					src.underlays=0
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.ssj= 2
					sleep(100)
					src.ssj = 0
	proc
		playerloop2()
			if(src.maxpowerlevel>1000000 && src.skillitx==0&&usr.itlearn == 1)
				src.skillitx=1
				src<<"You feel a new ability, is now with in reach!!!"
				src.verbs += /mob/itx/verb/Instant_Transmission1

			if(src.maxpowerlevel>200 && src.weights==0)
				src.weights=1
				src<<"You feel a new ability, is now with in reach!!!"
				src.verbs += /mob/itx/verb/Weights1
				src.verbs += /mob/itx/verb/Weights12


	proc
		playerloop()
			src.checkdbz()
			src.hasnttalked++
			if(src.lz!=src.z)
				src.hasnttalked=0
				src.lz=src.z
			if(src.hasnttalked>=1200)
				var/randcode = rand(1,9999)
				src.afk=1
				if((input(src,"Are you there? Please type [randcode]","AFK? type [randcode]")as num)==randcode)
					src.hasnttalked=0
					src.afk=0
				else
					src<<"Sorry you made a mistake, to come back from being AFK click on the Back verb under the Back Tab"
					src.verbs+=/mob/Back/verb/Back

			if(src.hp<30)
				if(src.powerlevel>src.basepowerlevel * (src.hp/30))
					src.powerlevel=src.basepowerlevel * (src.hp/30)
				if(src.powerlevel==0)
					src.powerlevel=1

			/********************************************

			Powerlevel Mashup, change it around,
			confuse the hell out of the players :P <-- dick move...

			*********************************************/

			if(src.maxpowerlevel>300000 && src.gonessj == 0 && (src.race == "Saiya-jin"||src.race == "Halfbreed"))
				src.SSJ()
			if(src.maxpowerlevel>1000000 && src.gonessj2 == 0 && (src.race == "Saiya-jin"||src.race == "Halfbreed"))
				src.SSJ()
			if(src.maxpowerlevel>5000000 && src.gonessj3 == 0 && (src.race == "Saiya-jin"||src.race == "Halfbreed"))
				src.gonessj3 = 1
				src<<"You feel an incredible well of power become available to you..."
				src.transformations[4]=new/obj/Tran/SSJ3
			if(src.gonesnj2==0 && src.maxpowerlevel >= 1000000&& (src.race == "Namek-sei-jin"||src.race == "Namek-jin"))
				src.transformations+=new/obj/Tran/SNJ2
				src.gonesnj2=1
				src<<"You find you are able to delve deeper into this hidden power"
			if(src.gonesnj3==0 && src.maxpowerlevel >= 5000000&& (src.race == "Namek-sei-jin"||src.race == "Namek-jin"))
				src.transformations+=new/obj/Tran/SNJ3
				src.gonesnj3=1
				src<<"You have learned to unlock an incredible new power"
			if(src.gonesnj4==0 && src.maxpowerlevel >= 10000000&& (src.race == "Namek-sei-jin"||src.race == "Namek-jin"))
				src.transformations+=new/obj/Tran/SNJ4
				src.gonesnj4=1
				src<<"You have truly unlocked the secret power imbedded in your Namek Bloodline"
			if(src.maxpowerlevel>600000 && src.goneussj == 0 && (src.race == "Saiya-jin"||src.race == "Halfbreed"))
				src.goneussj = 1
				src<<"You have come to understand your Saiyajin power to the extent that you can now push yourself further and become an Ultimate Super Saiyajin."
				src.transformations[2]=new/obj/Tran/USSJ
			if(src.hp>src.maxhp||src.hp=="NaN")
				src.hp=src.maxhp
			if(src.z==13&&src.timeperiod==0)
				src.timeperiod=1
			if(src.z==1&&src.timeperiod==1)
				src.timeperiod=0
			if(src.questsdone!=src.questsdone2)
				sleep(1)
				src.questsdone2=src.questsdone
				spawn()src.questrefresh()
			if(src.drain!=0)
				src.tickwait+=1
				if(src.tickwait>=5)
					src.tickwait=0
					src.stamina-=src.drain
					if(src.stamina<=0)
						src.ForceRevert()
						src.stamina=0
					if(src.stamina>100)
						src.stamina=100
			if(src.ssj==0&&src.drain!=-1)
				src.drain=-1
			if(src.animate_movement==0)
				sleep(100)
				if(src.animate_movement==0)
					src.animate_movement=1
			if(src.ki>src.maxki)
				src.ki=src.maxki
			if(src.dead==0&&src.ingero==1)
				src.ingero=0
			if(src.creatingattack==1)
				if(src.z!=21)
					sleep(10)
					if(src.creatingattack==1)
						if(src.z!=21)
							src.loc=locate(151,168,21)
			if(src.customattacklearned==0)
				if(src.maxpowerlevel>=50000)
					src.customattacklearned=1
					src.verbs+=new/mob/CustomAttackCPL/verb/Create_Move
					src<<"You have learned to mold your Ki well enough to create your own attacks"
			if(src.loc.loc)
				if(src.loc.loc:safe==1)
					src.nopk=1
				else
					src.nopk=0
			src.maxki=src.maxpowerlevel/500+10
			src.maxki=round(src.maxki)
			src.zenni=round(src.zenni)
			if(src.powerlevel<0)
				src.powerlevel=0
			if(src.maxpowerlevel<0)
				src.maxpowerlevel=0
			if(!src.icon||length(src.icon)<15)
				if(src.skincolor=="black")
					src.icon='male-black.dmi'
				if(src.skincolor=="darkbrown")
					src.icon='male-brown.dmi'
				if(src.skincolor=="lightbrown")
					src.icon='male-lightbrown.dmi'
				if(src.skincolor=="white")
					src.icon='male-white.dmi'
				if(src.skincolor=="tan")
					src.icon='male.dmi'
				if(src.skincolor=="fwhite")
					src.icon = 'female-pale.dmi'
				if(src.skincolor=="ftan")
					src.icon = 'female.dmi'
				if(src.skincolor=="flightbrown")
					src.icon = 'female-lightbrown.dmi'
				if(src.skincolor=="fdarkbrown")
					src.icon = 'female-darkbrown.dmi'
				if(src.skincolor=="fblack")
					src.icon = 'female-black.dmi'
			Hpbarrefresh()
			if(src.client)
				sleep(rand(10,15))
				spawn()src.playerloop()
				spawn()src.playerloop2()




mob
	proc
		Resting()
			sleep(5)
			if(src.resttime==0)
				src.resttime=1
				var/regenrate=1
				while(src.resting == 1)
					src.stamina += rand(1,2)
					src.hp+=regenrate
					regenrate=regenrate*2
					if(src.hp>src.maxhp)
						src.basepowerlevel=src.powerlevel
						src.hp=src.maxhp
					if(src.dead==1)
						src.lifepoints-=1
					src.AuraMake()
					src.timeout=1
					if(src.stamina >= 100)
						src.stamina = 100
					sleep(5)
				regenrate=0
				if(src.resting == 0)
					src.powerlevel += 0
					src.timeout=0
					src.resttime=0
client
	New()
//		src.CheckBan()
		new/obj/healthbar/healthbarseg1(src)
		new/obj/healthbar/healthbarseg2(src)
		new/obj/healthbar/healthbarseg3(src)
		new/obj/minimap/minimap03(src)
		new/obj/minimap/minimap02(src)
		new/obj/minimap/minimap01(src)
		new/obj/minimap/minimap00(src)
		new/obj/minimap/minimap13(src)
		new/obj/minimap/minimap12(src)
		new/obj/minimap/minimap11(src)
		new/obj/minimap/minimap10(src)
		new/obj/minimap/minimap23(src)
		new/obj/minimap/minimap22(src)
		new/obj/minimap/minimap21(src)
		new/obj/minimap/minimap20(src)
		new/obj/minimap/minimap33(src)
		new/obj/minimap/minimap32(src)
		new/obj/minimap/minimap31(src)
		new/obj/minimap/minimap30(src)
		new/obj/minimap/pointer(src)
		/***********************************

		////// Planet Dark //////////

		new/obj/pdarkmap/minimap03(src)
		new/obj/pdarkmap/minimap02(src)
		new/obj/pdarkmap/minimap01(src)
		new/obj/pdarkmap/minimap00(src)
		new/obj/pdarkmap/minimap13(src)
		new/obj/pdarkmap/minimap12(src)
		new/obj/pdarkmap/minimap11(src)
		new/obj/pdarkmap/minimap10(src)
		new/obj/pdarkmap/minimap23(src)
		new/obj/pdarkmap/minimap22(src)
		new/obj/pdarkmap/minimap21(src)
		new/obj/pdarkmap/minimap20(src)
		new/obj/pdarkmap/minimap33(src)
		new/obj/pdarkmap/minimap32(src)
		new/obj/pdarkmap/minimap31(src)
		new/obj/pdarkmap/minimap30(src)
		new/obj/pdarkmap/pointer(src)

		////// Planet Namek //////////

		new/obj/namekmap/minimap03(src)
		new/obj/namekmap/minimap02(src)
		new/obj/namekmap/minimap01(src)
		new/obj/namekmap/minimap00(src)
		new/obj/namekmap/minimap13(src)
		new/obj/namekmap/minimap12(src)
		new/obj/namekmap/minimap11(src)
		new/obj/namekmap/minimap10(src)
		new/obj/namekmap/minimap23(src)
		new/obj/namekmap/minimap22(src)
		new/obj/namekmap/minimap21(src)
		new/obj/namekmap/minimap20(src)
		new/obj/namekmap/minimap33(src)
		new/obj/namekmap/minimap32(src)
		new/obj/namekmap/minimap31(src)
		new/obj/namekmap/minimap30(src)
		new/obj/namekmap/pointer(src)

		////// Planet Vegeta //////////

		new/obj/vegetamap/minimap03(src)
		new/obj/vegetamap/minimap02(src)
		new/obj/vegetamap/minimap01(src)
		new/obj/vegetamap/minimap00(src)
		new/obj/vegetamap/minimap13(src)
		new/obj/vegetamap/minimap12(src)
		new/obj/vegetamap/minimap11(src)
		new/obj/vegetamap/minimap10(src)
		new/obj/vegetamap/minimap23(src)
		new/obj/vegetamap/minimap22(src)
		new/obj/vegetamap/minimap21(src)
		new/obj/vegetamap/minimap20(src)
		new/obj/vegetamap/minimap33(src)
		new/obj/vegetamap/minimap32(src)
		new/obj/vegetamap/minimap31(src)
		new/obj/vegetamap/minimap30(src)
		new/obj/vegetamap/pointer(src)

		////// Galexy //////////

		new/obj/galexymap/minimap03(src)
		new/obj/galexymap/minimap02(src)
		new/obj/galexymap/minimap01(src)
		new/obj/galexymap/minimap00(src)
		new/obj/galexymap/minimap13(src)
		new/obj/galexymap/minimap12(src)
		new/obj/galexymap/minimap11(src)
		new/obj/galexymap/minimap10(src)
		new/obj/galexymap/minimap23(src)
		new/obj/galexymap/minimap22(src)
		new/obj/galexymap/minimap21(src)
		new/obj/galexymap/minimap20(src)
		new/obj/galexymap/minimap33(src)
		new/obj/galexymap/minimap32(src)
		new/obj/galexymap/minimap31(src)
		new/obj/galexymap/minimap30(src)
		new/obj/galexymap/pointer(src)

		************************************/
		new/obj/kibar/kibarseg1(src)
		new/obj/kibar/kibarseg2(src)
		new/obj/kibar/kibarseg3(src)
		new/obj/staminabar/staminabarseg1(src)
		new/obj/staminabar/staminabarseg2(src)

		..()
		if(src.key=="Guest")
			src<<"The Guest key is disabled"
			del(src)
		show_verb_panel = 0
		spawn()src.Saveloop()
		for(var/area/A in world)	// loop through all areas in the world
			if(A.coverimage)	// if the area is covered
				src << A.coverimage	// show the coverimage to this client

		// find the mob's area
		var/area/A = mob.loc
		while(A && !istype(A))
			A = A.loc

		if(A)
			A.Entered(mob)	// remove the coverimage

/********************************

To Fix: Status Bar layer problem,
need to fix layering on maps to
reduce filesize and server strain.

               |
               V

*********************************/

obj
	staminabar
		staminabarseg1
			icon='0stabar.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			//layer=510
			New(client/C)
				screen_loc="7,1"
				C.screen+=src
		staminabarseg2
			icon='0stabar2.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			//layer=510
			New(client/C)
				screen_loc="8,1"
				C.screen+=src
obj
	healthbar
		healthbarseg1
			icon='0hpbar.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			//layer=510
			New(client/C)
				screen_loc="1,1"
				C.screen+=src
		healthbarseg2
			icon='0hpbar2.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			//layer=510
			New(client/C)
				screen_loc="2,1"
				C.screen+=src
		healthbarseg3
			icon='0hpbar3.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			//layer=510
			New(client/C)
				screen_loc="3,1"
				C.screen+=src
obj
	minimap
		var/screenlocation=0
		var/screenlocation2=0
		invisibility=1
		pointer
			icon='minimap.dmi'
			icon_state="marker"
			layer=520
			New(client/C)
				screenlocation=((C.view*2)-3)+1
				screenlocation2=((C.view*2)-3)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap03
			icon='minimap.dmi'
			icon_state="0,3"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-3)+1
				screenlocation2=((C.view*2)-0)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap02
			icon='minimap.dmi'
			icon_state="0,2"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-3)+1
				screenlocation2=((C.view*2)-1)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap01
			icon='minimap.dmi'
			icon_state="0,1"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-3)+1
				screenlocation2=((C.view*2)-2)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap00
			icon='minimap.dmi'
			icon_state="0,0"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-3)+1
				screenlocation2=((C.view*2)-3)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap13
			icon='minimap.dmi'
			icon_state="1,3"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-2)+1
				screenlocation2=((C.view*2)-0)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap12
			icon='minimap.dmi'
			icon_state="1,2"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-2)+1
				screenlocation2=((C.view*2)-1)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap11
			icon='minimap.dmi'
			icon_state="1,1"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-2)+1
				screenlocation2=((C.view*2)-2)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap10
			icon='minimap.dmi'
			icon_state="1,0"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-2)+1
				screenlocation2=((C.view*2)-3)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap23
			icon='minimap.dmi'
			icon_state="2,3"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-1)+1
				screenlocation2=((C.view*2)-0)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap22
			icon='minimap.dmi'
			icon_state="2,2"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-1)+1
				screenlocation2=((C.view*2)-1)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap21
			icon='minimap.dmi'
			icon_state="2,1"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-1)+1
				screenlocation2=((C.view*2)-2)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap20
			icon='minimap.dmi'
			icon_state="2,0"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-1)+1
				screenlocation2=((C.view*2)-3)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap33
			icon='minimap.dmi'
			icon_state="3,3"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-0)+1
				screenlocation2=((C.view*2)-0)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap32
			icon='minimap.dmi'
			icon_state="3,2"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-0)+1
				screenlocation2=((C.view*2)-1)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap31
			icon='minimap.dmi'
			icon_state="3,1"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-0)+1
				screenlocation2=((C.view*2)-2)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
		minimap30
			icon='minimap.dmi'
			icon_state="3,0"
			layer=500
			New(client/C)
				screenlocation=((C.view*2)-0)+1
				screenlocation2=((C.view*2)-3)+1
				screen_loc="[screenlocation],[screenlocation2]"
				C.screen+=src
obj
	damagenumber
		dmgseg1
			icon='0numbers.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="9,1"
				C.screen+=src
		dmgseg2
			icon='0numbers.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="10,1"
				C.screen+=src
		dmgnum1
			icon='0numbers.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="11,1"
				C.screen+=src
		dmgnum2
			icon='0numbersright.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="11,1"
				C.screen+=src
		dmgnum3
			icon='0numbers.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="12,1"
				C.screen+=src
		dmgnum4
			icon='0numbersright.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="12,1"
				C.screen+=src

obj
	Kikho
		icon='kame11.dmi'
		icon_state = ""
		density = 0
		npc=4
		pixel_step_size=8
obj
	kibar
		kibarseg1
			icon='0kibar.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="4,1"
				C.screen+=src
		kibarseg2
			icon='0kibar2.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="5,1"
				C.screen+=src
		kibarseg3
			icon='0kibar3.dmi'
			icon_state="inv"
			layer=99999999999999999999999
			New(client/C)
				screen_loc="6,1"
				C.screen+=src
/********************************************
                 ^
                 |

To Fix: Continuation of layer problems
Minimap seems fine though but go through
entire section, find others too with layer
issues

*********************************************/


mob
	proc
		Hpbarrefresh()
			if(istype(src,/mob/characters))
				if(src.key!=null)
					if(src.client!=null)
						if(src.race=="Android")
							var/slast=src.stamina
							sleep(5)
							if(slast==src.stamina)
								src.stamina+=1
							src.ki+=rand(src.maxki/500,src.maxki/400)+rand(1,3)
							if(src.ki>src.maxki)
								src.ki=src.maxki
							if(src.stamina>src.maxstamina)
								src.stamina=src.maxstamina
						if(src.minimap==1&&src.z==1)
							var/zscreenlocation=1
							var/zscreenlocation2=1
							if(src.updateminimap==1)
								for(var/obj/minimap/M in src.client.screen)
									if(M.name=="minimap03")
										zscreenlocation=((src.client.view*2)-3)+1
										zscreenlocation2=((src.client.view*2)-0)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap02")
										zscreenlocation=((src.client.view*2)-3)+1
										zscreenlocation2=((src.client.view*2)-1)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap01")
										zscreenlocation=((src.client.view*2)-3)+1
										zscreenlocation2=((src.client.view*2)-2)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap00")
										zscreenlocation=((src.client.view*2)-3)+1
										zscreenlocation2=((src.client.view*2)-3)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap13")
										zscreenlocation=((src.client.view*2)-2)+1
										zscreenlocation2=((src.client.view*2)-0)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap12")
										zscreenlocation=((src.client.view*2)-2)+1
										zscreenlocation2=((src.client.view*2)-1)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap11")
										zscreenlocation=((src.client.view*2)-2)+1
										zscreenlocation2=((src.client.view*2)-2)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap10")
										zscreenlocation=((src.client.view*2)-2)+1
										zscreenlocation2=((src.client.view*2)-3)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap23")
										zscreenlocation=((src.client.view*2)-1)+1
										zscreenlocation2=((src.client.view*2)-0)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap22")
										zscreenlocation=((src.client.view*2)-1)+1
										zscreenlocation2=((src.client.view*2)-1)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap21")
										zscreenlocation=((src.client.view*2)-1)+1
										zscreenlocation2=((src.client.view*2)-2)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap20")
										zscreenlocation=((src.client.view*2)-1)+1
										zscreenlocation2=((src.client.view*2)-3)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap33")
										zscreenlocation=((src.client.view*2)-0)+1
										zscreenlocation2=((src.client.view*2)-0)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap32")
										zscreenlocation=((src.client.view*2)-0)+1
										zscreenlocation2=((src.client.view*2)-1)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap31")
										zscreenlocation=((src.client.view*2)-0)+1
										zscreenlocation2=((src.client.view*2)-2)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"
									if(M.name=="minimap30")
										zscreenlocation=((src.client.view*2)-0)+1
										zscreenlocation2=((src.client.view*2)-3)+1
										M.screen_loc="[zscreenlocation],[zscreenlocation2]"

							if(src.minimapon==0)
								for(var/obj/minimap/M in src.client.screen)
									M.invisibility=0
								src.minimapon=1
							for(var/obj/minimap/pointer/M in src.client.screen)
								var/screenlocation=((src.client.view*2)-3)+1
								var/screenlocation2=((src.client.view*2)-3)+1
								M.pixel_y=1/3*src.y
								M.pixel_x=1/3*src.x
								M.screen_loc="[screenlocation]:[M.pixel_x],[screenlocation2]:[M.pixel_y]"

						else
							if(src.minimapon==1)
								for(var/obj/minimap/M in src.client.screen)
									M.invisibility=1
								src.minimapon=0
						if(statbars==1)
							src.hp=round(src.hp)
							if(src.hp>src.maxhp)
								src.hp=src.maxhp
							src.powerlevel=round(src.powerlevel)
							src.maxpowerlevel=round(src.maxpowerlevel)
							for(var/obj/healthbar/H in src.client.screen)
								if(src.powerlevel==0)
									goto skip
								var/percent
								if(src.maxpowerlevel!=0)
									percent=src.hp
								else
									percent=0
								skip
								var/state
								if(percent>=100)
									state=20
								if(percent>=95&&percent<100)
									state=19
								if(percent>=90&&percent<95)
									state=18
								if(percent>=85&&percent<90)
									state=17
								if(percent>=80&&percent<85)
									state=16
								if(percent>=75&&percent<80)
									state=15
								if(percent>=70&&percent<75)
									state=14
								if(percent>=65&&percent<70)
									state=13
								if(percent>=60&&percent<65)
									state=12
								if(percent>=55&&percent<60)
									state=11
								if(percent>=50&&percent<55)
									state=10
								if(percent>=45&&percent<50)
									state=9
								if(percent>=40&&percent<45)
									state=8
								if(percent>=35&&percent<40)
									state=7
								if(percent>=30&&percent<35)
									state=6
								if(percent>=25&&percent<30)
									state=5
								if(percent>=20&&percent<25)
									state=4
								if(percent>=15&&percent<20)
									state=3
								if(percent>=10&&percent<15)
									state=2
								if(percent>=5&&percent<10)
									state=1
								if(percent>0&&percent<5)
									state=0
								if(percent<=0)
									state=-1
								H.icon_state=num2text(state)
							for(var/obj/kibar/K in src.client.screen)
								if(src.ki==0||src.maxki==0)
									goto skip

								var/percent=(src.ki/src.maxki)*100
								skip
								var/state
								if(percent>=100)
									state=20
								if(percent>=95&&percent<100)
									state=19
								if(percent>=90&&percent<95)
									state=18
								if(percent>=85&&percent<90)
									state=17
								if(percent>=80&&percent<85)
									state=16
								if(percent>=75&&percent<80)
									state=15
								if(percent>=70&&percent<75)
									state=14
								if(percent>=65&&percent<70)
									state=13
								if(percent>=60&&percent<65)
									state=12
								if(percent>=55&&percent<60)
									state=11
								if(percent>=50&&percent<55)
									state=10
								if(percent>=45&&percent<50)
									state=9
								if(percent>=40&&percent<45)
									state=8
								if(percent>=35&&percent<40)
									state=7
								if(percent>=30&&percent<35)
									state=6
								if(percent>=25&&percent<30)
									state=5
								if(percent>=20&&percent<25)
									state=4
								if(percent>=15&&percent<20)
									state=3
								if(percent>=10&&percent<15)
									state=2
								if(percent>=5&&percent<10)
									state=1
								if(percent>0&&percent<5)
									state=0
								if(percent<=0)
									state=-1
								K.icon_state=num2text(state)
							for(var/obj/staminabar/S in src.client.screen)
								var/percent=src.stamina
								var/state
								if(percent>=100)
									state=20
								if(percent>=95&&percent<100)
									state=19
								if(percent>=90&&percent<95)
									state=18
								if(percent>=85&&percent<90)
									state=17
								if(percent>=80&&percent<85)
									state=16
								if(percent>=75&&percent<80)
									state=15
								if(percent>=70&&percent<75)
									state=14
								if(percent>=65&&percent<70)
									state=13
								if(percent>=60&&percent<65)
									state=12
								if(percent>=55&&percent<60)
									state=11
								if(percent>=50&&percent<55)
									state=10
								if(percent>=45&&percent<50)
									state=9
								if(percent>=40&&percent<45)
									state=8
								if(percent>=35&&percent<40)
									state=7
								if(percent>=30&&percent<35)
									state=6
								if(percent>=25&&percent<30)
									state=5
								if(percent>=20&&percent<25)
									state=4
								if(percent>=15&&percent<20)
									state=3
								if(percent>=10&&percent<15)
									state=2
								if(percent>=5&&percent<10)
									state=1
								if(percent>0&&percent<5)
									state=0
								if(percent<=0)
									state=-1
								S.icon_state=num2text(state)
			//	spawn(20)Hpbarrefresh()

mob
	proc
		meditate()
			sleep(50)
			if(src.meditating==0&&usr.afk==0)
				if(src.frozen!=1)
					while(src.meditate == 1 && src.stamina>=1)
						src.meditating=1
						src.move=0
						src.stamina -= rand(1,2)
						src.overlays -= /obj/assim
						src.random = rand(1,2)
						if(meditate == 1)
							src.ap += 4+1
							if(ap >= 100)
								src.ap = 100
						if(src.random == 2)
							src.maxpowerlevel += rand(20,50)
						src.random = rand(1,30)
						src.AuraMake()
						if(src.stamina >= 100)
							src.stamina = 100
						sleep(50)
					if(src.meditate == 0)
						src.powerlevel += 0
						src.move=1
						src.meditating=0

mob
	verb
		Skill_List()
			set name = "--Learn Skill--"
			set category = "Fighting"
			var/header1 = "---Level 1--- (5000 pl)"
			var/kamehameha = "Kamehameha (G)"
			var/masenko = "Masenko (P)"
			var/galekgun= "Galek Gun (V)"
			var/dondonpa= "Dondonpa (T)"
			var/doubletsui= "Double Tsuihikidan(K)"
			var/burningattack= "Burning Attack(Tr)"
			var/header2="---Level 2--- (50000pl)"
			var/scattershot="Kakusandan(K)"
			var/fourarms="Shiyoken(T)"
			var/kaoken= "KaoKen(G)"
			var/renzuko= "Renzuko Energy Dan(V)"
			var/chainblast= "Makankosappo(P)"
			var/header3="---Level 3--- (250000pl)"
			var/triblast="Kikoho(T)"
			var/finalflash="Final Flash(V)"
			var/kienzan= "Kienzan(K)"
			var/surroundingshot= "Kakusanyudokodan(P)"
			var/spiritbomb= "Genki Dama(G)"
			var/header4="---Level 4--- (750000pl)"
			var/choukamehameha="Chou Kamehameha(G)"
			var/homingkienzan="Homing Kienzan(K)"
			var/bigbangattack= "Big Bang Attack(V)"
			var/solarflare= "Taiyoken(T)"
			var/header5="---Level 5---(1500000)"
			var/chouspiritbomb="Chou Genki Dama(G)"
			var/chobakuretsumaha="Chobakuretsumaha(P)"
			var/selfdestruct="Self Destruct (V)"
			var/multiform= "Split Form(T)"
			var/finalkamehameha= "Final Kamehameha(VG)"
			var/header6="---Level 6---(5000000)"
			var/customattack="Custom Attack(*)"
			var/bigbangkamehameha= "BigBang Kamehameha(GV)"
			var/finalshine= "Final Shine(V)"
			var/revengedb= "Revenge Death Ball (BV)"
			var/header7="---Level 7---(10000000)"
			var/dragonfist= "Dragon Fist"

			var/cancel="Cancel"
			var/list/menu = new()

			menu += header1
			menu += kamehameha
			menu += masenko
			menu += galekgun
			menu += dondonpa
			menu += doubletsui
			menu += burningattack
			menu += header2
			menu += scattershot
		//	menu += fourarms //Que?
			menu += kaoken
			menu += renzuko
			menu += chainblast
			menu += header3
			menu += triblast
			menu += finalflash
			menu += kienzan
			menu += surroundingshot
			menu += spiritbomb
			menu += header4
			menu += choukamehameha
			menu += homingkienzan
			menu += bigbangattack
			menu += solarflare
			menu += header5
			menu += chouspiritbomb
			menu += chobakuretsumaha
			menu += finalkamehameha
			menu += selfdestruct
			menu += multiform
			menu += header6
			menu += customattack
			menu += bigbangkamehameha
			menu += finalshine
			menu += revengedb
			menu += header7
			menu += dragonfist
			menu += cancel

			var/result = input("Skill List", ".Skills") in menu

			if (result == kamehameha)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=1
					src.skillmasenko=0
					src.skilldondonpa=0
					src.skillburningattack=0
					src.skillgalekgun=0
					src.skilldoubletsui=0
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == masenko)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=0
					src.skillmasenko=1
					src.skilldondonpa=0
					src.skillburningattack=0
					src.skillgalekgun=0
					src.skilldoubletsui=0
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == galekgun)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=0
					src.skillmasenko=0
					src.skilldondonpa=0
					src.skillburningattack=0
					src.skillgalekgun=1
					src.skilldoubletsui=0
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == dondonpa)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=0
					src.skillmasenko=0
					src.skilldondonpa=1
					src.skillburningattack=0
					src.skillgalekgun=0
					src.skilldoubletsui=0
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == doubletsui)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=0
					src.skillmasenko=0
					src.skilldondonpa=0
					src.skillburningattack=0
					src.skillgalekgun=0
					src.skilldoubletsui=1
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == burningattack)
				if(src.maxpowerlevel>=5000)
					src.skillkamehameha=0
					src.skillmasenko=0
					src.skilldondonpa=0
					src.skillburningattack=1
					src.skillgalekgun=0
					src.skilldoubletsui=0
				else
					src<<"You must have at least 5000 base powerlevel to learn that ability."
			if (result == scattershot)
				if(src.maxpowerlevel>=50000)
					src.skillscattershot=1
					src.skillfourarms=0
					src.skillkaioken=0
					src.skillrenzukoenergydan=0
					src.skillspecialbeamcannon=0
				else
					src<<"You must have at least 50000 base powerlevel to learn that ability."
			if (result == fourarms)
				if(src.maxpowerlevel>=50000)
					src.skillscattershot=0
					src.skillfourarms=1
					src.skillkaioken=0
					src.skillrenzukoenergydan=0
					src.skillspecialbeamcannon=0
				else
					src<<"You must have at least 50000 base powerlevel to learn that ability."
			if (result == kaoken)
				if(src.maxpowerlevel>=50000)
					src.skillscattershot=0
					src.skillfourarms=0
					src.skillkaioken=1
					src.skillrenzukoenergydan=0
					src.skillspecialbeamcannon=0
				else
					src<<"You must have at least 50000 base powerlevel to learn that ability."
			if (result == renzuko)
				if(src.maxpowerlevel>=50000)
					src.skillscattershot=0
					src.skillfourarms=0
					src.skillkaioken=0
					src.skillrenzukoenergydan=1
					src.skillspecialbeamcannon=0
				else
					src<<"You must have at least 50000 base powerlevel to learn that ability."
			if (result == chainblast)
				if(src.maxpowerlevel>=50000)
					src.skillscattershot=0
					src.skillfourarms=0
					src.skillkaioken=0
					src.skillrenzukoenergydan=0
					src.skillspecialbeamcannon=1
				else
					src<<"You must have at least 50000 base powerlevel to learn that ability."
			if (result == triblast)
				if(src.maxpowerlevel>=250000)
					src.skillkikoho=1
					src.skillfinalflash=0
					src.skillkienzan=0
					src.skillsurroundingshot=0
					src.skillspiritbomb=0
				else
					src<<"You must have at least 250000 base powerlevel to learn that ability."
			if (result == finalflash)
				if(src.maxpowerlevel>=250000)
					src.skillkikoho=0
					src.skillfinalflash=1
					src.skillkienzan=0
					src.skillsurroundingshot=0
					src.skillspiritbomb=0
				else
					src<<"You must have at least 250000 base powerlevel to learn that ability."
			if (result == kienzan)
				if(src.maxpowerlevel>=250000)
					src.skillkikoho=0
					src.skillfinalflash=0
					src.skillkienzan=1
					src.skillsurroundingshot=0
					src.skillspiritbomb=0
				else
					src<<"You must have at least 250000 base powerlevel to learn that ability."
			if (result == surroundingshot)
				if(src.maxpowerlevel>=250000)
					src.skillkikoho=0
					src.skillfinalflash=0
					src.skillkienzan=0
					src.skillsurroundingshot=1
					src.skillspiritbomb=0
				else
					src<<"You must have at least 250000 base powerlevel to learn that ability."
			if (result == spiritbomb)
				if(src.maxpowerlevel>=250000)
					src.skillkikoho=0
					src.skillfinalflash=0
					src.skillkienzan=0
					src.skillsurroundingshot=0
					src.skillspiritbomb=1
				else
					src<<"You must have at least 250000 base powerlevel to learn that ability."
			if (result == choukamehameha)
				if(src.maxpowerlevel>=750000)
					src.skillchoukamehameha =1
					src.skillhomingkienzan=0
					src.skillbigbangattack =0
					src.skillsolarflare = 0
				else
					src<<"You must have at least 750000 base powerlevel to learn that ability."
			if (result == homingkienzan)
				if(src.maxpowerlevel>=750000)
					src.skillchoukamehameha =0
					src.skillhomingkienzan=1
					src.skillbigbangattack =0
					src.skillsolarflare = 0
				else
					src<<"You must have at least 750000 base powerlevel to learn that ability."
			if (result == bigbangattack)
				if(src.maxpowerlevel>=750000)
					src.skillchoukamehameha =0
					src.skillhomingkienzan=0
					src.skillbigbangattack =1
					src.skillsolarflare = 0
				else
					src<<"You must have at least 750000 base powerlevel to learn that ability."
			if (result == solarflare)
				if(src.maxpowerlevel>=750000)
					src.skillchoukamehameha =0
					src.skillhomingkienzan=0
					src.skillbigbangattack =0
					src.skillsolarflare = 1
				else
					src<<"You must have at least 750000 base powerlevel to learn that ability."
			if (result == chouspiritbomb)
				if(src.maxpowerlevel>=1500000)
					src.skillchouspiritbomb=1
					src.skillchobakuretsumaha=0
				//	src.skillrevengedb=0
					src.skillfinalkamehameha=0
					src.skillselfdestruct=0
					src.skillsplitform=0
				else
					src<<"You must have at least 1500000 base powerlevel to learn that ability."
			if (result == chobakuretsumaha)
				if(src.maxpowerlevel>=1500000)
					src.skillchouspiritbomb=0
					src.skillchobakuretsumaha=1
				//	src.skillrevengedb=0
					src.skillfinalkamehameha=0
					src.skillselfdestruct=0
					src.skillsplitform=0
				else
					src<<"You must have at least 1500000 base powerlevel to learn that ability."
			if (result == finalkamehameha)
				if(src.maxpowerlevel>=1500000)
					src.skillchouspiritbomb=0
					src.skillchobakuretsumaha=0
				//	src.skillrevengedb=1
					src.skillfinalkamehameha=1
					src.skillselfdestruct=0
					src.skillsplitform=0
				else
					src<<"You must have at least 1500000 base powerlevel to learn that ability."
			if (result == selfdestruct)
				if(src.maxpowerlevel>=1500000)
					src.skillchouspiritbomb=0
					src.skillchobakuretsumaha=0
				//	src.skillrevengedb=0
					src.skillfinalkamehameha=0
					src.skillselfdestruct=1
					src.skillsplitform=0
				else
					src<<"You must have at least 1500000 base powerlevel to learn that ability."
			if (result == multiform)
				if(src.maxpowerlevel>=1500000)
					src.skillchouspiritbomb=0
					src.skillchobakuretsumaha=0
				//	src.skillrevengedb=0
					src.skillfinalkamehameha=0
					src.skillselfdestruct=0
					src.skillsplitform=1
				else
					src<<"You must have at least 1500000 base powerlevel to learn that ability."

			if (result == customattack)
				if(src.maxpowerlevel>=5000000)
					src.customtechlearn=1
					src.skillrevengedb=0
					src.skillbigbangkamehameha=0
					src.skillfinalshine=0
				else
					src<<"You must have at least 5000000 base powerlevel to learn that ability."
			if (result == revengedb)
				if(src.maxpowerlevel>=5000000)
					src.customtechlearn=0
					src.skillrevengedb=1
					src.skillbigbangkamehameha=0
					src.skillfinalshine=0
				else
					src<<"You must have at least 5000000 base powerlevel to learn that ability."
			if (result == bigbangkamehameha)
				if(src.maxpowerlevel>=5000000)
					src.customtechlearn=0
					src.skillrevengedb=0
					src.skillbigbangkamehameha=1
					src.skillfinalshine=0
				else
					src<<"You must have at least 5000000 base powerlevel to learn that ability."
			if (result == finalshine)
				if(src.maxpowerlevel>=5000000)
					src.customtechlearn=0
					src.skillrevengedb=0
					src.skillbigbangkamehameha=0
					src.skillfinalshine=1
				else
					src<<"You must have at least 5000000 base powerlevel to learn that ability."
			if (result == dragonfist)
				if(src.maxpowerlevel>=10000000)
					src.skilldragonfist=1
				else
					src<<"You must have at least 10000000 base powerlevel to learn that ability."
			menu += choukamehameha
			menu += homingkienzan
			menu += bigbangattack
			menu += solarflare

			menu += header5
			menu += chouspiritbomb
			menu += chobakuretsumaha
			menu += revengedb
			menu += selfdestruct
			menu += multiform
			menu += header6
			menu += customattack
			menu += header7
			menu += dragonfist
			if(src.skillfinalshine==1)
				src.verbs+=/mob/FinalShine/verb/FinalShine
			else
				src.verbs-=/mob/FinalShine/verb/FinalShine
			if(src.skillfinalkamehameha==1)
				src.verbs+=/mob/FinalKamehameha/verb/FinalKamehameha
			else
				src.verbs-=/mob/FinalKamehameha/verb/FinalKamehameha
			if(src.skillbigbangkamehameha==1)
				src.verbs+=/mob/BigBangKamehameha/verb/BigBangKamehameha
			else
				src.verbs-=/mob/BigBangKamehameha/verb/BigBangKamehameha
			//if(src.skilldragonfist==1)
			//	src.verbs+=/mob/DragonFist/verb/DragonFist
			//else
			//	src.verbs-=/mob/DragonFist/verb/DragonFist
			if(src.skillselfdestruct==1)
				src.verbs+=/mob/SelfDestruct/verb/SelfDestruct
			else
				src.verbs-=/mob/SelfDestruct/verb/SelfDestruct
			if(src.skillkikoho==1)
				src.verbs += /mob/Kikho/verb/Kikho
			else
				src.verbs -= /mob/Kikho/verb/Kikho
			if(src.skillscattershot==1)
				src.verbs += /mob/Scattershot/verb/Scattershot
			else
				src.verbs -= /mob/Scattershot/verb/Scattershot
			if(src.skillrevengedb==1)
				src.verbs+=/mob/RevengeDeathBall/verb/RevengeDeathBall
			else
				src.verbs-=/mob/RevengeDeathBall/verb/RevengeDeathBall

			if(src.skilldoubletsui==1)
				src.verbs += /mob/DoubleTsuihikidan/verb/DoubleTsuihikidan
			else
				src.verbs -= /mob/DoubleTsuihikidan/verb/DoubleTsuihikidan
			if(src.skillsplitform==1)
				src.verbs += /mob/Splitform/verb/Multiply
			else
				src.verbs -= /mob/Splitform/verb/Multiply
			if(src.customtechlearn==1)
				src.verbs+=/mob/Personalizedattack/verb/Customizeattck
				src.verbs+=/mob/Personalizedattack/verb/Personalattck
			else
				src.verbs-=/mob/Personalizedattack/verb/Customizeattck
				src.verbs-=/mob/Personalizedattack/verb/Personalattck
			if(src.skillchoukamehameha==1)
				src.verbs +=/mob/ChouKamehameha/verb/ChouKamehameha
			else
				src.verbs -=/mob/ChouKamehameha/verb/ChouKamehameha
		//	if(src.skillenrage==1)
	//			src.verbs+=/mob/enrage/verb/Enrage
		//	else
		//		src.verbs-=/mob/enrage/verb/Enrage

			if(src.skillkiblast==1)
				src.verbs+=/mob/kiblast/verb/kiblast
			else
				src.verbs-=/mob/kiblast/verb/kiblast
			if(src.skillandroidtransform==1)
				src.verbs+=/mob/AndroidTransform/verb/AndroidTransform
			else
				src.verbs-=/mob/AndroidTransform/verb/AndroidTransform
			if(src.skilltechwork==1)
				src.verbs+=/mob/techwork/verb/Tech_Workings
			else
				src.verbs-=/mob/techwork/verb/Tech_Workings
			if(src.skillkamehameha==1)
				src.verbs += /mob/Kamehameha/verb/Kamehameha
			else
				src.verbs -= /mob/Kamehameha/verb/Kamehameha
			if(src.skillspiritbomb==1)
				src.verbs += /mob/spiritbomb/verb/sbomb
			else
				src.verbs -= /mob/spiritbomb/verb/sbomb
			if(src.skillchouspiritbomb==1)
				src.verbs += /mob/chouspiritbomb/verb/sbomb
			else
				src.verbs -= /mob/chouspiritbomb/verb/sbomb
			if(src.skillbigbangattack==1)
				src.verbs += /mob/BigBang/verb/BigBang
			else
				src.verbs -= /mob/BigBang/verb/BigBang
			if(src.skillrenzukoenergydan==1)
				src.verbs += /mob/Renzuko/verb/Renzuko
			else
				src.verbs -= /mob/Renzuko/verb/Renzuko
			if(src.skillfinalflash==1)
				src.verbs += /mob/FinalFlash/verb/FinalFlash
			else
				src.verbs -= /mob/FinalFlash/verb/FinalFlash
			if(src.skillgalekgun==1)
				src.verbs += /mob/GalekGun/verb/GalekGun
			else
				src.verbs -= /mob/GalekGun/verb/GalekGun

			if(src.skillsolarflare==1)
				src.verbs += /mob/Tayioken/verb/Tayioken
			else
				src.verbs -= /mob/Tayioken/verb/Tayioken
		//	if(src.skillgalacticdonut==1)
			//	src.verbs += /mob/GalacticDonut/verb/GalacticDonut
		//	else
			//	src.verbs -= /mob/GalacticDonut/verb/GalacticDonut
			if(src.skillburningattack==1)
				src.verbs += /mob/Burning/verb/Burning
			else
				src.verbs -= /mob/Burning/verb/Burning
			if(src.skillspecialbeamcannon==1)
				src.verbs += /mob/SpecialBeamCannon/verb/SpecialBeamCannon
			else
				src.verbs -= /mob/SpecialBeamCannon/verb/SpecialBeamCannon
			if(src.skillmasenko==1)
				src.verbs += /mob/Masenko/verb/Masenko
			else
				src.verbs -= /mob/Masenko/verb/Masenko
			if(src.skilldondonpa==1)
				src.verbs += /mob/DonDonPa/verb/DonDonPa
			else
				src.verbs -= /mob/DonDonPa/verb/DonDonPa
			if(src.skillkaioken==1)
				src.verbs += /mob/Kaioken/verb/Kaioken
			else
				src.verbs -= /mob/Kaioken/verb/Kaioken
			if(src.skillkienzan==1)
				src.verbs += /mob/kienzan/verb/Kienzan
			else
				src.verbs -= /mob/kienzan/verb/Kienzan

mob
	verb
		Remember_Someone(mob/M in oview(1))
			set category = "Fighting"
			if(findText("[usr.knowmob]","[M.name]")==1)
				usr << "You already know [M]!"
			else
				if(istype(M,/mob/monsters/))
					usr.knowmob += "[M.name] "
					usr << "You try to remember [M], You end up remembering something!!"
				else
					if(M.gm >= 1)
						usr.knowmob += "[M.name] "
						usr << "You try to remember!!! [M], and you succeed!!!!!!!!!"
						return
					else
						if(M.npc!=10)
							usr.knowmob += "[M.name] "
							usr << "You try to remember [M], and you succeed!"
		Aura_on()
			set category = "Fighting"
			usr.underlays=0
			if(usr.auratype==0)
				var/aura = 'whiteaura.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==1)
				var/aura = 'whiteaura2.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==2)
				var/aura = 'whiteaura3.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==3)
				var/aura = 'whiteaura4.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==4)
				var/aura = 'whiteaura6.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			usr.auraon=1
		Aura_off()
			set category = "Fighting"
			usr.underlays=0
			usr.auraon=0
		Meditate()
			set category = "Training"
			if(usr.frozen!=1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<< "Not while resting"
				if(usr.flight == 0&&usr.resting==0)
					if(usr.meditating==1||usr.meditate==1)
						if(usr.medtime == 1)
							usr << "You need to wait 10 seconds before continuing meditating."
						if(usr.medtime == 0&&usr.medprocess==0||usr.medtime == null&&usr.medprocess==0)
							usr << "<b>You stop meditating."
							usr.medtime = 1
							usr.move = 1
							usr.icon_state = ""
							usr.meditate = 0
							usr.meditating=0
							usr.medtime = 0
						else
							usr << "Too focused to think about stopping"

					else
						if(usr.move==1)
							usr << "<b>You begin meditating."
							usr.npp=0
							usr.icon_state = "meditate"
							usr.move = 0
							usr.meditate = 1
							if(usr.meditating==0)
								usr.meditate()
mob
	verb
		MeditationState()
			set name = "MeditationState"
			set category = "Training"
			if(usr.frozen!=1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.meditating==1)
					usr<< "Not while meditating"
				if (usr.resting==1)
					usr<< "Not while resting"
				if(usr.flight == 0&&usr.resting==0)
					if(usr.meditations == 1)
						if(usr.medtime == 0&&usr.medprocess==0||usr.medtime == null&&usr.medprocess==0)
							usr << "<b>You stop what you are doing.."
							usr.move = 1
							usr.meditations=0
						else
							usr << "Too focused to think about stopping"
					else
						if(usr.move==1)
							usr << "<b>You begin calming your mind"
							usr.npp=0
							usr.icon_state = ""
							usr.move = 1
							usr.meditations = 1

		Rest()
			set category = "Training"
			if(usr.frozen!=1)
				if(usr.race=="Android")

					if(usr.flight == 1)
						usr << "Not while flying."
					if(usr.meditate==1)
						usr<<"Not while Meditating"
				//	if(usr.haschip==0)
					//	usr<<"You cant recharge without a Power Chip!!"

					if(usr.flight == 0 && usr.meditate==0)
						if(usr.resting == 1)
							usr << "<b>You stop resting."
							usr.timeout=0
							usr.icon_state = ""
							usr.resting= 0
							usr.resttime=0
							if (usr.attackturn==2)
								usr.attackturn=3
								spawn()
									sleep(300)
									usr.attackturn=1

						else
							if(usr.timeout==0 && usr.move==1)
								usr << "<b>You start Resting."
								usr.npp=0
								usr.icon_state = "meditate"
								usr.timeout = 1
								usr.resting = 1
								usr.attackturn=2
								sleep(20)
								if(!usr.resttime)
									spawn()usr.Resting()

				else

					if(usr.flight == 1)
						usr << "Not while flying."
					if(usr.meditate==1)
						usr<<"Not while Meditating"


					if(usr.flight == 0 && usr.meditate==0)
						if(usr.resting == 1)
							usr << "<b>You stop resting."
							usr.timeout=0
							usr.icon_state = ""
							usr.resting= 0
							usr.resttime=0
							if (usr.attackturn==2)
								usr.attackturn=3
								spawn()
									sleep(300)
									usr.attackturn=1

						else
							if(usr.timeout==0 && usr.move==1)
								usr << "<b>You start Resting."
								usr.icon_state = "meditate"
								usr.timeout = 1
								usr.resting = 1
								usr.attackturn=2
								sleep(20)
								if(usr.resting)
									if(!usr.resttime)
										spawn()usr.Resting()



mob
	proc/talkcool()
		src.talkcooling=1
		while(usr.talkcool>0)
			sleep(1)
			src.talkcool-=1
		src.talktimes=0
		src.talkcooling=0
	verb
		Say(msg as text)
			set category = "Communication"
			if(usr.name!="")
				if(usr.talk == 1&&usr.say==1)
					usr.talkcool=10
					usr.talktimes+=1
					if(usr.talktimes>=8)
						usr<<"<font color = red> <B><u> Step away from the caffine... seriously. Give it a little break ok?</b></u></font>"
						usr.talk=0
						sleep(100)
						usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
						usr.talk=1
						usr.talktimes=0
					if(usr.talkcooling==0)
						spawn()usr.talkcool()
					if(length(msg) <500)
						usr.say=0
						view(6) << "<font size = 5>{<IMG CLASS=icon SRC=\ref[usr.faceicon]>}<font size = 2> [usr]<font color=white> says: <tt>[html_encode(msg)]</tt>"
						for(var/mob/m in world)
							if(m.spy)
								m<< "<font size = 5>{<IMG CLASS=icon SRC=\ref[usr.faceicon]>}<font size = 2> [usr]<font color=white> says: <tt>[html_encode(msg)]</tt>"
						sleep(2)
						usr.say=1




//Options
mob
	verb
		Options()
			set category="Communication"
			switch(input("Select one","Options") in list("Communication Toggles","Combat Style","Minimap On/Off","Remove Overlays","Health Bars","Sound Effects On/Off","Click Move On/Off","Screen Change","Change Face Icon","Change Ki Blast Color","Change Aura","Music Effects On/Off","Cancel"))
				if("Combat Style")
					if(usr.airpunch==0)
						usr.airpunch=1
						usr<<"New Melee Style Activated"
					else
						usr.airpunch=0
						usr<<"Old Melee Style Activated"
				if("Remove Overlays")
					usr.overlays = 0
				if("Minimap On/Off")
					if(usr.minimap==1)
						usr.minimap=0
						usr<<"Minimap Deactivated"
					else if (usr.minimap==0)
						usr.minimap=1

				if("Communication Toggles")
					switch(input("Which one?","Options")in list("Telepath","OOC","Friend OOC","Guild OOC","Cancel"))
						if("Telepath")
							if(usr.toggletelepath==1)
								usr<<"Telepath listening turned on"
								usr.toggletelepath=0
							else
								usr<<"Telepath listening turned off"
								usr.toggletelepath=1
						if("OOC")
							if(usr.listenooc==0)
								usr<<"OOC listening turned on"
								usr.listenooc=1
							else
								usr<<"OOC listening turned off"
								usr.listenooc=0
						if("Friend OOC")
							if(usr.listenfriend==0)
								usr<<"Friend listening turned on"
								usr.listenfriend=1
							else
								usr<<"Friend listening turned off"
								usr.listenfriend=0
						if("Guild OOC")
							if(usr.listenguild==0)
								usr<<"Guild listening turned on"
								usr.listenguild=1
							else
								usr<<"Guild listening turned off"
								usr.listenguild=0
				if("Health Bars")
					if(usr.statbars == 0)
						spawn()usr.Hpbarrefresh()
						usr.statbars=1
					else
						usr.statbars=0
						for(var/obj/staminabar/S in usr.client.screen)
							S.icon_state="inv"
						for(var/obj/healthbar/H in usr.client.screen)
							H.icon_state="inv"
						for(var/obj/kibar/K in usr.client.screen)
							K.icon_state="inv"
						for(var/obj/damagenumber/D in usr.client.screen)
							D.icon_state="inv"
				if("Sound Effects On/Off")
					if(usr.sounds==1)
						usr.sounds=0
						usr<<"Sound Effects have been turned off"
					else if(usr.sounds==0)
						usr.sounds=1
						usr<<"Sound Effects have been turned on"
				if("Music Effects On/Off")
					if(usr.music==1)
						usr.music=0
						usr<<"Music Effects have been turned off"
					else if(usr.music==0)
						usr.music=1
						usr<<"Music Effects have been turned on"
				if("Click Move On/Off")
					if(usr.clickmove==1)
						usr.clickmove=0
					else
						usr.clickmove=1
					usr<<"Toggled ClickMove"
				if("Screen Change")
					switch(input("What screen size", "Screen", text) in list ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"))
						if("1")
							client.view=1
						if("2")
							client.view=2
						if("3")
							client.view=3
						if("4")
							client.view=4
						if("5")
							client.view=5
						if("6")
							client.view=6
						if("7")
							client.view=7
						if("8")
							client.view=8
						if("9")
							client.view=9
						if("10")
							client.view=10
					src.updateminimap=1
					src.savedview=src.client.view
				if("Change Face Icon")
					if(usr.cantfacechange==0)
						switch(input("Do you want to change your face icon?", "Face Icon",text) in list("Yes","No"))
							if("Yes")
								var/class = input("What kind of face icon?","Icon Choose") in list("Icon","Preset Icon","Cancel")
								switch(class)
									if("Icon")
										var/econ = input("Pick icon:(less than 20k)","Icon") as icon
										var/facesize=length(econ)
										if(facesize<=20000)
											if(check_icon(econ))
												usr.faceicon = econ
											else
												usr<<"That icon was corrupt!"
										else
											usr<<"That file is too big"
									if("Preset Icon")
										switch(input("What icon do you want to use?", "Icon Choose") in list ("Goku","Gohan","Vegeta","Trunks","Goten","Kami","Dende","Turles","Vegeta2","Frieza"))
											if("Goku")
												usr.faceicon = 'goku.bmp'
											if("Vegeta")
												usr.faceicon = 'vegeta.bmp'
											if("Gohan")
												usr.faceicon = 'gohan.bmp'
											if("Trunks")
												usr.faceicon = 'trunks.bmp'
											if("Dende")
												usr.faceicon = 'dende.bmp'
											if("Goten")
												usr.faceicon = 'goten.bmp'
											if("Kami")
												usr.faceicon = 'kame.bmp'
											if("Raditz")
												usr.faceicon = 'raditz.bmp'
											if("Turles")
												usr.faceicon = 'turles.bmp'
											if("Vegeta2")
												usr.faceicon = 'vegeta2.bmp'
											if("Frieza")
												usr.faceicon = 'icer.bmp'
				if("Change Ki Blast Color")
					switch(input("What ki color do you want?", "Ki", text) in list ("Default(Yellow)","Orange","Red","Blue","Teal","Purple","Pink","Black","Green","Nevermind"))
						if("Default(Yellow)")
							usr.kiblastcolor="yellow"
						if("Orange")
							usr.kiblastcolor="orange"
						if("Red")
							usr.kiblastcolor="red"
						if("Blue")
							usr.kiblastcolor="blue"
						if("Teal")
							usr.kiblastcolor="teal"
						if("Purple")
							usr.kiblastcolor="purple"
						if("Pink")
							usr.kiblastcolor="pink"
						if("Black")
							usr.kiblastcolor="black"
						if("Green")
							usr.kiblastcolor="green"
				if("Change Aura")
					usr.underlays =0
					usr.aura = 1
					var/cred = input("How much red do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cgreen = input("How much green do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cblue = input("How much blue do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					usr.customred = cred
					usr.customgreen = cgreen
					usr.customblue = cblue
					switch(input("What aura type do you want?", "Aura", text) in list ("Default","Spikey","Fountain","Erratic","Android"))
						if("Default")
							usr.auratype=0
						if("Spikey")
							usr.auratype=1
						if("Fountain")
							usr.auratype=2
						if("Erratic")
							usr.auratype=3
						if("Android")
							usr.auratype=4


//IGNORE OPTIONS
mob
	verb
		Ignore(mob/characters/M in world)
			set category = "Communication"
			set name="Ignore"
			set popup_menu = 1
			for(var/obj/O in usr.Ignorelist)
				if(M.name==O.name)
					usr << "You already have Ignored [M]!"
					counter=1
			if(counter==0)
				if(istype(M,/mob/characters/))
					if(M.gm >= 1)
						usr << "You cannot Ignore Gods."
						return
					else
						if(M.npc!=10)
							var/obj/ignoreie =new()
							ignoreie.name=M.name
							usr.Ignorelist+=ignoreie
							usr << "You have ignored [M]!"


		Ignore_List()
			set category = "Communication"
			set name="Ignore List"
			var/list/L=usr.Ignorelist
			var/length = L.len
			var/page = "<H2>List with [length] items</H2>"
			page += "<table>"
			var/current
			var/count
			for (count = 1, count <= length, count++)
				page += "<tr>"
				current = L[count]

				page += "<td>[count]</td>" +"<td><a href=\"byond://#\ref[src]\ref[current]\">[current]</a></td><td></td>"
				page += "</tr>"
			if (!length)
				page += "<tr><td>\[no items]</td></tr>"
			page += "</table>"
			usr<<browse(page)

		Un_Ignore(mob/characters/M in world)
			set category = "Communication"
			set name="Un-Ignore"
			set popup_menu = 1
			for(var/obj/O in usr.Ignorelist)
				if(O.name==M.name)
					switch(input(usr,"Really remove [M] from your Ignore list?", "Ignore Remove", text) in list ("Yes","No"))
						if("Yes")
							for(var/obj/Xame in usr.Ignorelist)
								if(Xame.name==M.name)
									del(Xame)
							usr<<"[M] is no longer Ignored"
						else
							usr<<"phew"
//FRIEND OPTIONS
		Friend_Add(mob/characters/M in world)
			set category = "Communication"
			set popup_menu = 1
			set name="Friend Add"
			var/counter=0
			if(usr==M)
				return
			for(var/obj/O in usr.Friendslist)
				if(M.name==O.name)
					usr << "You already have Befriended [M]!"
					counter=1

			if(counter==0)
				if(usr.friendwait==0)
					switch(input(M,"[usr] wants to add you to his friends list", "Friend", text) in list ("Accept","Reject"))
						if("Accept")
							if(istype(M,/mob/characters/))
								var/obj/friend =new()
								friend.name=M.name
								usr.Friendslist+=friend
								usr<<"[M] has become your friend!"
						else
							usr<<"[M] has denied your Friend Request"
							usr.friendwait=1
							sleep(1000)
							usr.friendwait=0
		Friend_Remove(mob/characters/M in world)
			set category = "Communication"
			set popup_menu = 1
			set name="Friend Remove"
			for(var/obj/O in usr.Friendslist)
				if(O.name==M.name)
					switch(input(usr,"Really remove [M] from your friends list?", "Friend Remove", text) in list ("Yes","No"))
						if("Yes")
							for(var/obj/Xame in usr.Friendslist)
								if(Xame.name==M.name)
									del(Xame)
							usr<<"[M] is no longer your friend"
						else
							usr<<"phew"

		Friends_List()
			set category = "Communication"
			set name="Friends List"
			var/list/L=usr.Friendslist
			var/length = L.len
			var/page = "<H2>List with [length] items</H2>"
			page += "<table>"
			var/current
			var/count
			for (count = 1, count <= length, count++)
				page += "<tr>"
				current = L[count]

				page += "<td>[count]</td>" +"<td><a href=\"byond://#\ref[src]\ref[current]\">[current]</a></td><td></td>"
				page += "</tr>"
			if (!length)
				page += "<tr><td>\[no items]</td></tr>"
			page += "</table>"
			usr<<browse(page)
		Reputation(mob/characters/M in world)
			set name = "GM Reputation (+/-)"
			set category = "Communication"
			set popup_menu = 0
			if(usr.complaincool<=0)//flagu
				if(M.gm>=1&&(M.client.address!=usr.client.address))
					complaincool=1000
					switch(input("Do you want to give respect to a gm or complain about a gm","Reputation(+/-)",text) in list ("Respect (+)","Complain(-)","Nevermind"))
						if("Respect (+)")
							M.preputation++
						if("Complain(-)")
							M.nreputation++
			else
				usr<<"Wait a while before evaluating another GM"
		Befriend(mob/characters/M in oview(6))
			set name = "Befriend"
			set category = "Communication"
			set popup_menu = 0
			if(M.move == 1)
				switch(input("Are you sure you want to befriend him?.","Befriend",text) in list ("Yes","No"))
					if("Yes")
						usr.befriend = M.name
						M << "[usr] has befriended you!"

//TOGGLES





mob
	verb
		Telepath(mob/characters/M in world, msg as text)
			set category = "Communication"
			set popup_menu = 1
			if(usr.mute==1||usr.tempmute==1)
				usr<<"Your Muted"
			if(M.toggletelepath==1)
				usr<<"[M]'s telepath is toggled."
				M<<"[src] tried to telepath, but your telepath is toggled."
				return
			else
				for(var/mob/characters/m in world)
					if(m.spy)
						m << "<b><----<font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>[usr]:<font color = white> [html_encode(msg)]"
				if(usr.name!=""&&length(msg)>=1)
					usr.talkcool=20
					usr.talktimes+=1
					if(usr.talktimes>=8)
						usr<<"<font color = red> <B><u> Ok man, you need to stop with the Caffeine here. Give it a little break ok?</b></u></font>"
						usr.tempmute=1
						sleep(100)
						usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
						usr.tempmute=0
						usr.talktimes=0
					if(usr.talkcooling==0)
						spawn()usr.talkcool()
					if(length(msg) <= 500&&usr.say==1)
						usr.say=0
						usr << "<b>----><font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>:<font color = white> [html_encode(msg)]"
						M << "<b><----<font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>[usr]:<font color = white> [html_encode(msg)]"
						sleep(3)
						usr.say=1
					else
						world<<"[html_encode(usr.name)]/[usr.key] tried to spam"
						usr.tempmute=1
						sleep(200)
						usr.tempmute=0

		OOC(msg as text)
			set category = "Communication"
			if(usr.mute==1||usr.tempmute==1)
				usr<<"Your Muted"

			else
				if(usr.name!="")
					usr.talkcool=20
					usr.talktimes+=1
					if(usr.talktimes>=8)
						usr<<"<font color = red> <B><u> Ok man, you need to stop with the Caffeine here. Give it a little break ok?</b></u></font>"
						usr.tempmute=1
						sleep(100)
						usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
						usr.tempmute=0
						usr.talktimes=0
					if(usr.talkcooling==0)
						spawn()usr.talkcool()
					if(length(msg) <= 500&&usr.say==1)
						usr.say=0
						for(var/mob/characters/M in world)
							if(M.listenooc==1)
								if(findText("[M.Ignorelist]","[usr]")==0)
//									if(usr.isgold==1)
//										M<<"<b><font color=yellow>*</b></font><font color = teal>{{<font color = white>[usr.oocname]<font color = teal>}<font color = silver>[usr.rankname]<font color = teal>}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> OOCs:<font color = red> [html_encode(msg)]"
//									else
									M<<"<font color = teal>{{<font color = white>[usr.oocname]<font color = teal>}<font color = silver>[usr.rankname]<font color = teal>}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> OOCs:<font color = red> [html_encode(msg)]"
						usr.hasnttalked=0
						sleep(2)
						usr.say=1
					else
						world<<"[html_encode(usr.name)]/[usr.key] tried to spam"
						usr.tempmute=1
						sleep(200)
						usr.tempmute=0

		FriendOOC(msg as text)
			set category = "Communication"
			if(usr.mute==1||usr.tempmute==1)
				usr<<"Your Muted"

			else
				if(usr.name!="")
					usr.talkcool=20
					usr.talktimes+=1
					if(usr.talktimes>=8)
						usr<<"<font color = red> <B><u> Ok man, you need to stop with the Caffeine here. Give it a little break ok?</b></u></font>"
						usr.tempmute=1
						sleep(100)
						usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
						usr.tempmute=0
						usr.talktimes=0
					if(usr.talkcooling==0)
						spawn()usr.talkcool()
					if(length(msg) <= 500&&usr.say==1)
						usr.say=0
						for(var/mob/characters/M in world)
							if(M.listenfriend==1)
								for(var/obj/O in usr.Friendslist)
									if(M.name==O.name)
										M<<"<i><font color = teal>{{<font color = white>Friend Chat<font color = teal>}<font color = silver><font color = teal>}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> OOCs:<font color = red> [html_encode(msg)]</i>"
						usr<<"<font color = teal>{{<font color = white>Friend Chat<font color = teal>}<font color = silver><font color = teal>}<font color = green><tt>{{<font color = red>[usr]<font color = green>}}<font color = white> OOCs:<font color = red> [html_encode(msg)]"
						sleep(2)
						usr.say=1

		RolePlay(msg as text)
			set category = "Communication"
			if(usr.mute==1)
				usr<<"Your Muted"

			else

				if(usr.name!=""&&usr.say==1)
					usr.talkcool=20
					usr.talktimes+=1
					if(usr.talktimes>=8)
						usr<<"<font color = red> <B><u> Ok man, you need to stop with the Caffeine here. Give it a little break ok?</b></u></font>"
						usr.tempmute=1
						sleep(100)
						usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
						usr.tempmute=0
						usr.talktimes=0
					if(usr.talkcooling==0)
						spawn()usr.talkcool()
					usr.say=0
					view(6) << "*<font color = blue><tt>[usr] [html_encode(msg)]</tt><font color = white>*"
					sleep(2)
					usr.say=1

		TrainingList()
			set category="Communication"
			set name = "Training List"
			var/who={"<STYLE>BODY {background: Black; color: White}  IMG.icon{width:32;height:32}</STYLE>
<head><title>Training List</title></head>
<center><font size=5><B>Training List<br></b></font>
<table border="1" cellpadding="4">
<tr align="center"><th colspan="3"><font size=1>Object</th><th><font size=1>Needed PL</th></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>SpeedBag</td><td><font size=2>100 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>PowerBag</td><td><font size=2>50000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>HeavyPBag</td><td><font size=2>500000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>SuperPBag</td><td><font size=2>5000000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>100 Weights</td><td><font size=2>100 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>1000 Weights</td><td><font size=2>10000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>10000 Weights</td><td><font size=2>100000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>100000 Weights</td><td><font size=2>1000000 PL</td></tr>"}
			who+={"<tr align="center"><td colspan="3"><font size=2>1000000 Weights</td><td><font size=2>10000000 PL</td></tr>"}
			src<<browse(who,"window=who,size=500x300,can_resize=0,can_minimize=0")


		GMList()
			set category="Communication"
			set name = "List GM"
			var/who={"<STYLE>BODY {background: Black; color: White}  IMG.icon{width:32;height:32}</STYLE>
<head><title>List GMs</title></head>
<center><font size=5><B>Online Game Moderators<br></b></font>
<table border="1" cellpadding="4">
<tr align="center"><th colspan="3"><font size=1>Name</th><th><font size=1>Key</th><th><font size=1>GM Status</th><th><font size=1>Reputation</th></tr>"}
			for(var/mob/characters/M in world)
				if(M.gm>=1)
					who+={"
		<tr align="center"><td colspan="3"><font size=2>[M.name]</td><td><font size=2>[M.key]</td><td><font size=2>Level [M.gm] GM</td><td><font size=2>Reputation=[((M.preputation-M.nreputation+1)/(M.preputation+M.nreputation+1))*100]%</td></tr>"}
					src<<browse(who,"window=who,size=500x300,can_resize=0,can_minimize=0")

		Who()
			set category="Communication"
			var/online=0
			var/who={"<STYLE>BODY {background: Black; color: White}  IMG.icon{width:32;height:32}</STYLE>
<head><title>Who's Online</title></head>
<center><font size=5><B>Who's Online<br></b></font>
<table border="1" cellpadding="4">
<tr align="center"><th colspan="3"><font size=1>Name</th><th><font size=1>Key</th><th><font size=1>Guild</th><th><font size=1>Online Time</th></tr>"}
			for(var/mob/characters/M in world) who+={"
<tr align="center"><td colspan="3"><font size=2>[M.name]</td><td><font size=2>[M.key]</td><td><font size=2>[M.guild]</td><td><font size=2>[M.onlinetime]</td></tr>"}
			var/mob/M
			for(M in world)
				if(M.key)
					online+=1
			who+={"<tr align="center"><center><td colspan="6"><font size=3>Players Online: [online]</td></tr></table>"}
			src<<browse(who,"window=who,size=500x300,can_resize=0,can_minimize=0")


mob
	verb
		drop_gold()
			set category = "Communication"
			set name = "Drop Zenni"
			var/dropgold = input("How much you want to drop?","Drop Gold",) as num
			if(dropgold<=0)
				usr << "You have to drop ATLEAST 1 zenni!"
				return
			if(dropgold>usr:zenni)
				usr << "You dont have that much zenni to drop."
				return
			else
				if(usr.hasfused!=1)
					var/O = new /obj/goldbag(usr.loc)
					O:zenni = dropgold
					usr.zenni -= dropgold
					usr << "You drop  <B>[dropgold]</b> zenni"
					view(6) << "[usr] drops <b>[dropgold] zenni."
					return

obj/goldbag
	name="Gold Bag"
	icon='gold.dmi'
	layer=2
	verb
		Get()
			set src in oview(0)
			usr << "You get <b>[src.zenni]</b> zenni."
			usr:zenni += src.zenni
			del(src)


mob
	verb
		Look(mob/characters/M in view(6))
			set category = "Communication"
			if(M.key==""||M.key=="Masterdan")
				view(6) << "<font color = yellow>*<font color = red>[usr] looks at [M]'s stats.<font color = yellow>*"
				usr << "<font color = blue>You cant look at my stats you piece of shit, im the almighty creator!"
			else
				view(6) << "<font color = yellow>*<font color = red>[usr] looks at [M].<font color = yellow>*"
				usr << "<font color = red><center>[M.name]</red></center>"
				usr << "<font color = blue>Current Fighting Style: <IMG CLASS=icon SRC=\ref[usr.style]'> [M.stylename]"
				usr << "<font color = blue>Special Attributes: He is a(n) [M.attribute]."
				if(M.powerlevel > usr.powerlevel)
					usr << "<font color = blue>You sense that [M] is stronger than you."
				if(M.powerlevel == usr.powerlevel)
					usr << "<font color = blue>[M] has the same powerlevel as you."
				if(M.powerlevel < usr.powerlevel)
					usr << "<font color = blue>You sense that [M] is weaker than you."
				usr << "<font color = blue>You sense that [M] is at [num2text(M.powerlevel,100)]."
				usr << "<font color = blue>He seems to be a [M.race]."
				usr << "<font color = blue>They appear to be [M.state]."
				if(M.powerlevel >= M.maxpowerlevel)
					usr << "<font color = silver><font face = Arial>You sense that [M] is at full power."
				if(M.powerlevel < M.maxpowerlevel && M.powerlevel > (M.maxpowerlevel / 2))
					usr << "<font color = silver><font face = Arial>You sense that [M] is less than his maximum power."
				if(M.powerlevel <= (M.maxpowerlevel / 2) && M.powerlevel > (M.maxpowerlevel / 4))
					usr << "<font color = silver><font face = Arial>You sense that [M] is hiding most of their power."
				if(M.powerlevel <= (M.maxpowerlevel / 4) && M.powerlevel > (M.maxpowerlevel / 8))
					usr << "<font color = silver><font face = Arial>You sense that [M] is hiding almost all of his power."
				if(M.powerlevel <= (M.maxpowerlevel / 8))
					usr << "<font color = silver><font face = Arial>You sense that [M] has compeletly hidden their power."
				usr << "<font color = black><center>------------------------"
				usr << "<font color = blue><center>(OOC Information)"
				usr << "<font color = blue><center>[M]'s Key: [M.key]"


mob
	verb
		Block()
			set category = "Fighting"
			if(usr.ko==0)
				if(usr.block==1)
					usr<<"You stop blocking"
					usr.block=0
					usr.move=1
					icon_state = ""
				if(usr.block==0)
					usr<<"You start blocking"
					icon_state = "sparblock"
					usr.move=1
					usr.block=1
					sleep (150)
					icon_state = ""
					usr.block=0
					usr.move=1
					usr<<"You stop blocking"



mob
	verb
		Finish(mob/characters/M in oview(2))
			set category = "Fighting"
			set popup_menu = 1
			if(usr.finishcool==0)
				spawn()
					if(M)
						if(M)
							if(usr.nopk==0)
								if(M.ko == 0)
									usr << "<b>He isn't knocked out!"
								if(M.ko == 1)
									usr.random = rand(1,4)
									if(usr.random == 1)
										flick("sparpunch",usr)
										view(6) << "<b><font color = blue>[usr] picks up [M] by the throat, and snaps his neck."
										usr.move = 1
									if(usr.random == 2)
										flick("sparkick",usr)
										view(6) << "<b><font color = blue>[usr] stomps down on [M]'s stomach, killing him."
									if(usr.random == 3)
										flick("sparkick",usr)
										view(6) << "<b><font color = blue>[usr] stomps down on [M]'s neck, breaking his neck and killing him.."
									if(usr.random == 4)
										flick("sparfury",usr)
										view(6) << "<b><font color = blue>[usr] punches right through [M]'s stomach, killing him!."
									M.hp=0
									if(usr.finishcool==0)
										usr.finishcool=1
										M.Die(usr)
									usr.move = 1
				sleep(3)
				if(usr.finishcool!=-1)
					usr.finishcool=0
			else
				usr.finishcool=-1
				sleep(3)
				usr.finishcool=0

mob
	verb
		AttackMob()
			set category = "Fighting"
			set name = "Attack"
			usr.counter=0
			if(usr.airpunch==1)
				if(usr.attacking==0 && usr.ko==0 && usr.powerlevel>0)
					var/rr=rand(1,2)
					if(usr.weapon==1)
						rr=1
					if(rr==1)
						flick("sparfury",usr)
					if(rr==2)
						flick("sparkick",usr)


					usr.attacking=1
					var/mob/M=locate() in get_step(usr,usr.dir)
					if(istype(M,/mob/monsters))
						if(M.mode=="Berserk")
							M:target="[usr.name]"
					if(M && M!=usr)
						if(M.nopk==1||usr.nopk==1)
							usr<<"This is a no pk zone."
						if(M.nopk==0&&usr.nopk==0)
							if(istype(M,/mob/monsters/people/randomperson))
								M.Retreat(usr)
							if(M.creator==1)
								usr<<"FOOL DONT YOU KNOW THAT I AM THE ALMIGHTY CREATOR?!"
							else
								if(istype(M,/mob/characters)||istype(M,/mob/monsters))
									if(M.ko == 1)
										usr << "<b>You need to finish him for that."
									if(M.ko == 0)
										if(usr.ko == 1||usr.hp==0)
											usr << "<b>Not while you are knocked out."
										if(usr.ko == 0&&usr.powerlevel>0)
											if(usr.safe == 2)
												usr << "<b>Not while in a safe area."
											if(src.z==10||src.z==2&&M.dead==1||src.z==3&&src.x<140&&M.dead==1||src.z==12&&M.dead==1)
												usr << "<b>They are in a safe area."
											else
												if(M.powerlevel==0)
													M.powerlevel=1
												if(rr==2)
													if(usr.sounds==1)
														spawn()usr<<'sounds/kickhit.wav'
													if(M.sounds==1)
														spawn()M<<'sounds/kickhit.wav'
												if(rr==1&&usr.weapon==0)
													if(usr.sounds==1)
														spawn()usr<<'sounds/punchhit.wav'
													if(M.sounds==1)
														spawn()M<<'sounds/punchhit.wav'
												if(rr==1&&usr.weapon==1)
													if(usr.sounds==1)
														spawn()usr<<'slash.wav'
													if(M.sounds==1)
														spawn()M<<'slash.wav' //Change sound format? OOG? MP3 support?
												var/damg=((usr.powerlevel)/(M.powerlevel))*2
												if(damg <1)
													damg=1+usr.strength/(M.defense+M.strength)
												if(damg>40)
													damg=40+usr.strength/(M.defense+M.strength)
												M<<"<font color = #F19B2E>You were hit for [damg] damage by [usr]</font>"
												usr<<"<font color = #FFBA00>You hit [M] for [damg] damage</font>"
												M.hp -= damg

												if(istype(M,/mob/monsters))
													M.Die()
												else
													M.KO()
												if(usr.attackturn==1)
													usr.attackturn=0
													spawn()
														var/gainbonus = usr.maxpowerlevel
														if(gainbonus>50000000)
															gainbonus=5000000
														usr.maxpowerlevel += (gainbonus / 4000)+rand(1,10)
														sleep(rand(30,50))
														if(M)
															if(M.attackturn==0)
																M.attackturn=1
														if(usr.attackturn==0)
															sleep(100)
															if(usr.attackturn==0)
																sleep(100)
																if(usr.attackturn==0)
																	sleep(100)
																	usr.attackturn = 1
					sleep(10)
					usr.attacking=0
				else
					sleep(22)
					if(usr.attacking==1)
						usr.attacking=0
			else
				if(usr.attacking==0 && usr.ko==0 && usr.powerlevel>0)
					usr.attacking=1
					var/mob/M=locate() in get_step(usr,usr.dir)
					if(M && M!=usr)
						if(M.nopk==1||usr.nopk==1)
							usr<<"This is a no pk zone."
						if(M.nopk==0&&usr.nopk==0)
							if(istype(M,/mob/monsters/people/randomperson))
								M.Retreat(usr)
							if(M.creator==1)
								usr<<"FOOL DONT YOU KNOW THAT I AM THE ALMIGHTY CREATOR?!"
							else
								if(istype(M,/mob/characters)||istype(M,/mob/monsters))
									if(M.ko == 1)
										usr << "<b>You need to finish him for that."
									if(M.ko == 0)
										if(usr.ko == 1||usr.hp==0)
											usr << "<b>Not while you are knocked out."
										if(usr.ko == 0&&usr.powerlevel>0)
											if(usr.safe == 2)
												usr << "<b>Not while in a safe area."
											if(src.z==10||src.z==2&&M.dead==1||src.z==3&&src.x<140&&M.dead==1||src.z==12&&M.dead==1)
												usr << "<b>They are in a safe area."
											else
												if(M.powerlevel==0)
													M.powerlevel=1
												var/damg=((usr.powerlevel)/(M.powerlevel))*2
												if(damg <1)
													damg=1+usr.strength/(M.defense+M.strength)
												if(damg>40)
													damg=40+usr.strength/(M.defense+M.strength)
												M<<"<font color = #F19B2E>You were hit for [damg] damage by [usr]</font>"
												usr<<"<font color = #FFBA00>You hit [M] for [damg] damage</font>"
												if(usr.weapon==0)
													usr.random= rand(1,7)

													if(usr.random == 1)
														if(usr.sounds==1)
															spawn()usr<<'sounds/punchhit.wav'
														if(M.sounds==1)
															spawn()M<<'sounds/punchhit.wav'
													//	view(2) << "<font color = blue><i>[usr] throws a fury of punches at [M]!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,30)
														sleep(1)
														usr.attacking=0
													if(usr.random == 2)
														if(usr.sounds==1)
															spawn()usr<<'sounds/kickhit.wav'
														if(M.sounds==1)
															spawn()M<<'sounds/kickhit.wav'
													//	view(2) << "<font color = blue><i>[usr] jump-kicks [M]!"
														flick("sparkick",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 3)
														if(usr.sounds==1)
															spawn()usr<<'sounds/punchhit.wav'
														if(M.sounds==1)
															spawn()M<<'sounds/punchhit.wav'
													//	view(2) << "<font color = blue><i>[usr] uppercuts [M]!!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 4)
														if(usr.sounds==1)
															spawn()usr<<'sounds/kickhit.wav'
														if(M.sounds==1)
															spawn()M<<'sounds/kickhit.wav'
													//	view(2) << "<font color = blue><i>[usr] sweeps [M]'s feet!"
														flick("sparkick",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 5)
														if(usr.sounds==1)
															spawn()usr<<'sounds/punchhit.wav'
														if(M.sounds==1)
															spawn()M<<'sounds/punchhit.wav'
													//	view(2) << "<font color = blue><i>[usr] jabs [M] in the stomach!"
														flick("sparpunch",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 6)
													//	view(2) << "<font color = blue><i>[usr] staggers, and misses [M]!"
														flick("sparpunch",usr)
														usr.maxpowerlevel += rand(0,1)
													if(usr.random == 7)
													//	view(2) << "<font color = blue><i>[usr] kicks at [M], and misses [M]!"
														flick("sparkick",usr)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
												else
													if(usr.sounds==1)
														spawn()usr<<'slash.wav'
													if(M.sounds==1)
														spawn()M<<'slash.wav'
													usr.random= rand(1,7)
													if(usr.random == 1)
													//	view(2) << "<font color = blue><i>[usr] Thrusts his sword at [M]!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 2)
													//	view(2) << "<font color = blue><i>[usr] slashes [M] with full force!!!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 3)
													//	view(2) << "<font color = blue><i>[usr] uppercuts [M] with his sword!!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 4)
													//	view(2) << "<font color = blue><i>[usr] slashes [M]'s feet!"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 5)
													//	view(2) << "<font color = blue><i>[usr] jumps and slashes [M]"
														flick("sparfury",usr)
														if (M.block==1)
															M.hp -= damg/5
														else
															M.hp -= damg
														M.powerlevel = round(M.powerlevel)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
													if(usr.random == 6)
													//	view(2) << "<font color = blue><i>[usr] staggers, and misses [M]!"
														flick("sparfury",usr)
														usr.maxpowerlevel += rand(0,1)
													if(usr.random == 7)
													//	view(2) << "<font color = blue><i>[usr] swipes at [M], and misses [M]!"
														flick("sparfury",usr)
														usr.maxpowerlevel += rand(0,1)
														sleep(1)
														usr.attacking=0
												if(istype(M,/mob/monsters))
													M.Die()
												else
													M.KO()
												if(usr.attackturn==1&&usr.isinhbtc==0)
													usr.attackturn=0
													spawn()
														var/gainbonus = usr.maxpowerlevel
														if(gainbonus>50000000)
															gainbonus=5000000
														usr.maxpowerlevel += (gainbonus / 4000)+rand(1,10)
														sleep(rand(30,50))
														if(M)
															if(M.attackturn==0)
																M.attackturn=1
														if(usr.attackturn==0)
															sleep(100)
															if(usr.attackturn==0)
																sleep(100)
																if(usr.attackturn==0)
																	sleep(100)
																	usr.attackturn = 1
												if(usr.isinhbtc==1)
													usr.hbtc_attacked++
													M.hbtc_wasattacked++
					sleep(10)
					usr.attacking=0
				else
					sleep(22)
					if(usr.attacking==1)
						usr.attacking=0







mob
	tester
		dummy1
			icon = 'male.dmi'
			icon_state = "sparstand"
			powerlevel = 100
			maxpowerlevel = 100

			ko = 0
			alignment = "Good"
			npc = 1
			dead = 0


		dummy2
			icon = 'male.dmi'
			icon_state = "sparblock"
			powerlevel = 100
			maxpowerlevel = 100

			npc = 1
			ko = 0
			alignment = "Good"

mob
	bubb
		bubbles
			name = "Bubbles the Monkey"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "bubbles"

mob
	tester
		kingkai
			name = "North Kaio"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "northkaio"
			verb
				Return_To_Earth()
					set name = "Return To Earth"
					set category = "Training"
					set src in oview(1)
					if(usr.dead==0)
						usr << "<b>You may now return to earth!"
						usr.loc=locate(74,35,10)

					else
						usr << "<b>Sorry but your still dead, talk to Baba to go back to Earth Temporarily, and get the dragonballs to wish you back to life."
				Train_me()
					set name = "Train me"
					set category = "Training"
					set src in oview(1)
					if(usr.maxpowerlevel >= 100000)
						if(usr.itlearn == null)
							usr.verbs +=  /mob/it/verb/Instant_Transmission
							usr.skillit=1
							usr << "<b>Ill teach you a very usefull ability, Instant Transmission, Remember any player or NPC, and you can use IT to teleport to them! as long as your alive."
							usr.itlearn = 1
				Complete_mission()
					set name = "Complete a Mission"
					set category = "Missions"
					set src in oview(1)
					if(usr.mission1c==1)
						if(usr.mission1c==1)
							usr.zenni += 10000
							usr.conc+=1
							usr.mission1c=0
							usr << "<b> Good work, you have cleared all the enraged souls, here is your reward.."
							usr << "<b> You gain 10000, zenni, and your concentration increases!!"



mob
	other
		ache
			icon = 'mobs.dmi'
			icon_state = "ache"
			powerlevel = 5
			npc = 1
			maxpowerlevel = 7
			verb
				Talk()
					set category = "Communication"
					set src in oview(3)
					alert("My shop is closed")

mob
	melp
		Shopkeeper2
			icon = 'mobs.dmi'
			icon_state = "shoptwo"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					if(length(usr.contents)<30)
						switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Senzu Bean(5000z)","Turben(500z)","Sunglasses *200*","Class I Scouter(2000z)","Class II Scouter(4000z)","Class III Scouter(8000z)","Class IV Scouter(10000z)","Sword Sheath(10000z)","Nothing"))
							if("Class I Scouter(2000z)")
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "<b>You get Class I Scouter!"
									usr.contents += new /obj/blue_scouter
									usr.zenni -= 2000
							if("Class II Scouter(4000z)")
								if(usr.zenni <= 3999)
									usr << "<b>You need 4000 zenni!"
								if(usr.zenni >= 4000)
									usr << "<b>You get Class II Scouter!"
									usr.contents += new /obj/red_scouter
									usr.zenni -= 4000
							if("Class III Scouter(8000z)")
								if(usr.zenni <= 7999)
									usr << "<b>You need 8000 zenni!"
								if(usr.zenni >= 8000)
									usr << "<b>You get Class III Scouter!"
									usr.contents += new /obj/green_scouter
									usr.zenni -= 8000

							if("Turben(500z)")
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "<b>You get a Turben!"
									usr.contents += new /obj/turben
									usr.zenni -= 500
							if("Senzu Bean(5000z)")
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									var/counter=0
									for(var/obj/senzu/O in usr.contents)
										counter+=1
									if(counter<=0)
										usr.contents += new /obj/senzu
									else
										for(var/obj/senzu/O in usr.contents)
											O.ammount+=1
											O.name= "[O.name1] ([O.ammount])"
									usr << "<b>You get a Senzu Bean!"
									usr.zenni -= 5000
							if("Class IV Scouter(10000z)")
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr << "<b>You get a ClassIV Scouter!"
									usr.contents += new /obj/yellow_scouter
									usr.zenni -= 10000
							if("Sword Sheath(10000z)")
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr << "<b>You get a High Quality Sword Sheath!"
									usr.contents += new /obj/Swordsheath
									usr.zenni -= 10000
							if("Sunglasses *200*")
								if(usr.zenni <= 199)
									usr << "<b>You need 200 zenni!"
								if(usr.zenni >= 200)
									usr << "<b>You get a pair of sunglasses"
									usr.contents += new /obj/Sunglasses
									usr.zenni -= 200
					else
						usr<<"Your inventory is full"

mob
	melp
		Shopkeeper4
			icon = 'mobs.dmi'
			icon_state = "shopfour"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					if(length(usr.contents)<30)
						switch(input("Hello! The items found here can be written in, and then can be traded to other players or placed somewhere","Shopkeeper",text) in list ("Paper *100*","Book *300*","Sign *800*","Nothing"))
							if("Paper *100*")
								if(usr.zenni < 100)
									usr << "<b>You need 100 zenni!"
								if(usr.zenni >= 100)
									usr.zenni-=100
									usr.contents+= new /obj/Paper
							if("Book *300*")
								if(usr.zenni < 300)
									usr << "<b>You need 300 zenni!"
								if(usr.zenni >= 300)
									usr.zenni-=100
									usr.contents+= new /obj/Book

							if("Sign *800*")
								if(usr.zenni < 800)
									usr << "<b>You need 800 zenni!"
								if(usr.zenni >= 800)
									usr.zenni-=100
									usr.contents+= new /obj/Sign
					else
						usr<<"Your inventory is full"
mob
	melp
		Shopkeeper5
			icon = 'mobs.dmi'
			icon_state = "shopfive"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Do you wish to import and buy one of your very own items?","Shopkeeper",text) in list ("Import(50,000 zenni)","No Thanks"))
						if("Import(50,000 zenni)")
							var/goodicon=0
							if(usr.zenni>=50000)
								usr.zenni-=50000
								var/icon/eupload
								switch(input("Do you need to import an icon, or are you going to use an existing imported icon?!","Shopkeeper",text) in list ("Import","Choose Existing"))
									if("Import")
										eupload = input(usr,"Choose Icon to Upload","Icon") as icon|null

										if(check_icon(eupload))
											var/facesize=length(eupload)
											var/namesize=length("[eupload]")
											if(facesize<=300000||namesize<=15)
												goodicon=1
											else
												usr<<"To big."
												return
										else
											usr<<"That was a corrupt icon"
											return
								var/ename
								if(goodicon==1)
									ename = input(usr, "Enter a name for the Item (Used for future reference!)","Name") as text
									var/savefile/F = new("icons/[ename].[usr.key].sav")
									F["icon"]<<eupload
								switch(input("Hello! Choose what Type of Item to create!","Shopkeeper",text) in list ("Clothing/Overlay","Weapon","Aura/Underlay","None"))
									if("Clothing/Overlay")
										var/name
										if(goodicon==0)
											name = input("Enter Name:","Name") as text
										else
											name=ename
										var/O=new/obj/SpecialItemPrototype
										O:SpecialIcon="[name].[usr.key]"
										O:name=name
										usr.contents+= O
									if("Weapon")
										var/name
										if(goodicon==0)
											name = input("Enter Name:","Name") as text
										else
											name=ename
										var/O=new/obj/SpecialWeaponPrototype
										O:SpecialIcon="[name].[usr.key]"
										O:name=name
										usr.contents+= O
									if("Aura/Underlay")
										var/name
										if(goodicon==0)
											name = input("Enter Name:","Name") as text
										else
											name=ename
										var/O=new/obj/SpecialUnderPrototype
										O:SpecialIcon="[name].[usr.key]"
										O:name=name
										usr.contents+= O


obj
	Paper
		icon = 'mobs.dmi'
		icon_state= "Paper"
		npc = 1
		var
			finalized=0
			finalized2=0
		verb
			Writeinpaper()
				set name = "Write"
				set category = "Communication"
				if(src.finalized==0)
					alert("What would you like to write?")
					var/write = input("Text:","text") as text
					src.written=write
				else
					alert("This is Finalized and cannot be changed")

			Finalize()
				set category= "Communication"
				if(src.finalized==0)
					switch(input("Are you sure you wish to Finalize it?","Text",text)in list("Yes","No"))
						if("Yes")
							alert("Please give it a name")
							var/name=input("Name:","text") as text
							src.name=name
							src.finalized=1
				else
					alert("This is Finalized and cannot be changed")

			Readpaper()
				set name = "Read"
				set category = "Communication"
				alert("[src.written]")
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	darkmountain
		name=""
		icon = 'turfs.dmi'
		icon_state = "mountain"
		density = 1
		opacity = 1
	Book
		icon = 'mobs.dmi'
		icon_state= "Book"
		npc = 1
		var
			finalized=0
			finalized2=0
		verb
			Writeinpaper()
				set name = "Write"
				set category = "Communication"
				if(src.finalized==0)
					alert("What would you like to write?")
					var/write = input("Text:","text") as text
					src.written=write
				else
					alert("This is Finalized and cannot be changed")

			Finalize()
				set category= "Communication"
				if(src.finalized==0)
					switch(input("Are you sure you wish to Finalize it?","Text",text)in list("Yes","No"))
						if("Yes")
							alert("Please give it a name")
							var/name=input("Name:","text") as text
							src.name=name
							src.finalized=1
				else
					alert("This is Finalized and cannot be changed")

			Readpaper()
				set name = "Read"
				set category = "Communication"
				alert("[src.written]")
			Drop()
				set category = "Communication" //was inventory
				if(usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	Sign2
		icon = 'mobs.dmi'
		icon_state= "Sign"
		npc = 1
		var
			finalized=0
			finalized2=0
		verb
			Readpaper()
				set name = "Read"
				set category = "Communication"
				alert("This is the Advanced Meditation area")
			ReadSign()
				set name = "Read Sign"
				set category = "Communication"
				set src in oview(1)
				alert("This is the Advanced Meditation area]")

obj
	Sign
		icon = 'mobs.dmi'
		icon_state= "Sign"
		npc = 1
		var
			finalized=0
			finalized2=0
		verb
			Writeinpaper()
				set name = "Write"
				set category = "Communication"
				if(src.finalized==0)
					alert("What would you like to write?")
					var/write = input("Text:","text") as text
					src.written=write
				else
					alert("This is Finalized and cannot be changed")

			Finalize()
				set category= "Communication"
				if(src.finalized==0)
					switch(input("Are you sure you wish to Finalize it?","Text",text)in list("Yes","No"))
						if("Yes")
							alert("Please give it a name")
							var/name=input("Name:","text") as text
							src.name=name
							src.finalized=1
				else
					alert("This is Finalized and cannot be changed")

			Readpaper()
				set name = "Read"
				set category = "Communication"
				alert("[src.written]")
			ReadSign()
				set name = "Read Sign"
				set category = "Communication"
				set src in oview(1)
				alert("[src.written]")
			Drop()
				set category = "Communication" //was inventory
				if(usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Place_Sign()
				set category = "Communication"
				src.finalized2=1
				src.loc=locate(usr.x,usr.y,usr.z)
				src.density=1
			Destroy()
				set category = "Fighting"
				set src in oview(1)
				if(src.finalized==2)
					alert("This Sign cannot be destroyed")
				else
					view(6)<<"[usr] destroys a Sign"
					del(src)

			Get()
				set category = "Communication" //was inventory
				if(src.finalized2==0)
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
mob
	melp
		Shopkeeper3
			icon = 'mobs.dmi'
			icon_state = "shopthree"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					var/obj/O
					var/nextpart=1
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Custom Gi*10k*","Custom Underclothing*10k*","Custom Saiya-jin Armor*10k*","Custom Cloak *10k*","Custom Pants *10k*","Custom Head-band *10k*","Custom Gloves&Shoes *10k*","Custom Shoes *10k*","Custom Cape *10k*","Custom Shirt *10k*","Nothing"))
						if("Nothing")
							nextpart=0
						if("Custom Gi*10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get Custom Gi!!"
								O=new /obj/Customgi
								usr.zenni -= 10000
						if("Custom Underclothing*10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get Custom Underclothes!"
								O=new /obj/Customunder
								usr.zenni -= 10000
						if("Custom Saiya-jin Armor*10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get Custom Saiya-jin armor!"
								O=new /obj/Customsaiyajinarmor
								usr.zenni -= 10000
						if("Custom Cloak *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Cloak"
								O=new /obj/Customcloak
								usr.zenni -= 10000
						if("Custom Pants *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Pants"
								O=new /obj/Custompants
								usr.zenni -= 10000
						if("Custom Head-band *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Headband"
								O=new /obj/Customheadband
								usr.zenni -= 10000
						if("Custom Shirt *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Shirt"
								O=new /obj/CustomShirt
								usr.zenni -= 10000
						if("Custom Cape *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Cape"
								O=new /obj/CustomCape
								usr.zenni -= 10000
						if("Custom Shoes *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Shoes"
								O=new /obj/CustomShoes
								usr.zenni -= 10000
						if("Custom Gloves&Shoes *10k*")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
								nextpart=0
							if(usr.zenni >= 10000)
								usr << "<b>You get a Custom Gloves & Shoes"
								O=new /obj/CustomGloves
								usr.zenni -= 10000
					if(nextpart==1)

						usr.contents += O
mob
	melp
		A16
			icon = 'Android 16.dmi'
			npc = 1
			powerlevel = 999999
			maxpowerlevel = 999999
/*
			if(src.race=="Android"||src.race=="Bio-Android")
				switch(imput(Would you like to recive the special upgrade?) in list("Yes","No","More Information","Cancel"))
*/


mob
	melp
		Shopkeeper_Saiyajin
			icon = 'Npcs.dmi'
			icon_state="shop saiyajin"
			npc = 1
			powerlevel = 12000
			maxpowerlevel = 12000
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					var/obj/O
					if(length(usr.contents)<30)
						var/cost=0
						switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Saiyajin Armor","Under-Clothing","Scouter","White Shoes - 100z","White Gloves - 100z","Nothing"))
							if("Nothing")
								return
							if("White Gloves - 100z")
								cost = 100
								O = new /obj/whitegloves
							if("White Shoes - 100z")
								cost = 100
								O = new /obj/whiteshoes
							if("Scouter")
								cost = 2000
								switch(input("Continued", "Shopkeeper",text) in list ("Red - 2000z","Blue - 2000z","Green - 2000z","Nothing"))
									if("Nothing")
										return
									if("Red - 2000z")
										O = new /obj/red_scouter
									if("Blue - 2000z")
										O = new /obj/blue_scouter
									if("Green - 2000z")
										O = new /obj/green_scouter

							if("Under-Clothing")
								cost=1000
								switch(input("Continued", "Shopkeeper",text) in list ("White - 1000z","Gray - 1000z","Black - 1000z","Blue - 1000z","Red - 1000z","Green - 1000z","Nothing"))
									if("White - 1000z")
										O =new /obj/Under_White
									if("Red - 1000z")
										O =new /obj/Under_Red
									if("Blue - 1000z")
										O =new /obj/Under_Blue
									if("Gray - 1000z")
										O =new /obj/Under_Gray
									if("Black - 1000z")
										O =new /obj/Under_Black
									if("Green - 1000z")
										O =new /obj/Under_Green
									if("Nothing")
										return
							if("Saiyajin Armor")
								switch(input("Continued", "Shopkeeper",text) in list ("Full","Shoulderless","Simple Torso","Nothing"))
									if("Nothing")


									if("Full")
										switch(input("Continued", "Shopkeeper",text) in list ("Freiza Style - 11000z","Vegeta Style - 9000z","Nappa Style - 6000z","Raditz Style - 4500z","Bardock Style - 4000z","Toma Style - 3800z","Totepo Style - 3500z","Panboukin Style - 3000z","Generic (Red) Style - 2000z","Nothing"))
											if("Nothing")
												return

											if("Freiza Style - 11000z")
												O=new /obj/Freiza_Armor
												cost=11000
											if("Vegeta Style - 9000z")
												O=new /obj/Vegeta_Armor
												cost= 9000
											if("Nappa Style - 6000z")
												O=new /obj/Nappa_Armor
												cost= 6000
											if("Raditz Style - 4500z")
												O=new /obj/Raditz_Armor
												cost=4500
											if("Bardock Style - 4000z")
												O=new /obj/Bardock_Armor
												cost= 4000
											if("Toma Style - 3800z")
												O=new /obj/Toma_Armor
												cost= 3800
											if("Panboukin Style - 3000z")
												O=new /obj/Panboukin_Armor
												cost= 3000
											if("Totepo Style - 3500z")
												O=new /obj/Totepo_Armor
												cost= 3500
											if("Generic (Red) Style - 2000z")
												O=new /obj/Red_Armor
												cost= 2000


									if("Shoulderless")
										switch(input("Continued", "Shopkeeper",text) in list ("Vegeta Style - 8000z","Nappa Style - 5000z","Raditz Style - 4000z","Nothing"))
											if("Vegeta Style - 8000z")
												O=new /obj/Vegeta_Armor_Shoulderless
												cost = 8000
											if("Nappa Style - 5000z")
												O=new /obj/Nappa_Armor_Shoulderless
												cost = 5000
											if("Raditz Style - 4000z")
												O=new /obj/Raditz_Armor_Shoulderless
												cost = 4000
											if("Nothing")
												return
									if("Simple Torso")
										switch(input("Continued", "Shopkeeper",text) in list ("Vegeta Style - 8500z","Nappa Style - 5500z","Raditz Style - 4500z","Nothing"))
											if("Vegeta Style - 8500z")
												O=new /obj/Vegeta_Armor_Simple
												cost = 8500
											if("Nappa Style - 5500z")
												O=new /obj/Nappa_Armor_Simple
												cost = 5500
											if("Raditz Style - 4500z")
												O=new /obj/Raditz_Armor_Simple
												cost = 4500
											if("Nothing")
												return

						if(usr.zenni >= cost)
							usr.zenni -= cost
							usr.contents += O
							usr<<"You bought a [O.name] for [cost]"
						else
							usr<<"You dont have enough zenni!"
					else
						usr<<"Your inventory is full"
		Shopkeeper
			icon = 'mobs.dmi'
			icon_state = "store"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					var/obj/O
					var/nextpart=1
					if(length(usr.contents)<30)
						switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Gi *150*","Underclothing *150*","Cloak *200*","Pants *100*","Gloves *50*","Shoes *75*","Cape *350*","Shirt *150*","Nothing"))
							if("Nothing")
								nextpart=0
							if("Gi *150*")
								if(usr.zenni < 150)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/bluegi
										if("Black")
											O=new /obj/blackgi
										if("Red")
											O=new /obj/redgi
										if("Green")
											O=new /obj/greengi
										if("White")
											O=new /obj/whitegi
										if("Orange")
											O=new /obj/orangegi
										if("Purple")
											O=new /obj/purplegi
										if("Grey")
											O=new /obj/greygi
										if("Yellow")
											O=new /obj/yellowgi
									usr << "<b>You got a Gi!!"
									usr.zenni -= 150
							if("Underclothing *150*")
								if(usr.zenni < 150)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/blueunder
										if("Black")
											O=new /obj/blackunder
										if("Red")
											O=new /obj/redunder
										if("Green")
											O=new /obj/greenunder
										if("White")
											O=new /obj/whiteunder
										if("Orange")
											O=new /obj/orangeunder
										if("Purple")
											O=new /obj/purpleunder
										if("Grey")
											O=new /obj/greyunder
										if("Yellow")
											O=new /obj/yellowunder
									usr << "<b>You got underclothing!!"
									usr.zenni -= 150
							if("Saiya-jin Armor (No Pads) *1300*")
								if(usr.zenni < 1300)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White"))
										if("Blue")
											O=new /obj/bluesaiyanarmornp
										if("Black")
											O=new /obj/blacksaiyanarmornp
										if("Red")
											O=new /obj/redsaiyanarmornp
										if("Green")
											O=new /obj/greensaiyanarmornp
										if("White")
											O=new /obj/whitesaiyanarmornp
									usr << "<b>You got Saiya-jin Armor!!"
									usr.zenni -= 1300
							if("Saiya-jin Armor (Sholder Pads) *2000*")
								if(usr.zenni < 2000)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White"))
										if("Blue")
											O=new /obj/bluesaiyanarmorhp
										if("Black")
											O=new /obj/blacksaiyanarmorhp
										if("Red")
											O=new /obj/redsaiyanarmorhp
										if("Green")
											O=new /obj/greensaiyanarmorhp
										if("White")
											O=new /obj/whitesaiyanarmorhp
									usr << "<b>You got Saiya-jin Armor!!"
									usr.zenni -= 2000
							if("Saiya-jin Armor (Sholder and Leg Pads) *2500*")
								if(usr.zenni < 2500)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White"))
										if("Blue")
											O=new /obj/bluesaiyanarmorfp
										if("Black")
											O=new /obj/blacksaiyanarmorfp
										if("Red")
											O=new /obj/redsaiyanarmorfp
										if("Green")
											O=new /obj/greensaiyanarmorfp
										if("White")
											O=new /obj/whitesaiyanarmorfp
									usr << "<b>You got Saiya-jin Armor!!"
									usr.zenni -= 2500
							if("Cloak *200*")
								if(usr.zenni < 200)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/bluecloak
										if("Black")
											O=new /obj/blackcloak
										if("Red")
											O=new /obj/redcloak
										if("Green")
											O=new /obj/greencloak
										if("White")
											O=new /obj/whitecloak
										if("Orange")
											O=new /obj/orangecloak
										if("Purple")
											O=new /obj/purplecloak
										if("Grey")
											O=new /obj/greycloak
										if("Yellow")
											O=new /obj/yellowcloak
									usr << "<b>You got a cloak!!"
									usr.zenni -= 200
							if("Pants *100*")
								if(usr.zenni < 100)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/bluepants
										if("Black")
											O=new /obj/blackpants
										if("Red")
											O=new /obj/redpants
										if("Green")
											O=new /obj/greenpants
										if("White")
											O=new /obj/whitepants
										if("Orange")
											O=new /obj/orangepants
										if("Purple")
											O=new /obj/purplepants
										if("Grey")
											O=new /obj/greypants
										if("Yellow")
											O=new /obj/yellowpants
									usr << "<b>You got a pair of pants!!"
									usr.zenni -= 100

							if("Shirt *150*")
								if(usr.zenni < 150)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/blueshirt
										if("Black")
											O=new /obj/blackshirt
										if("Red")
											O=new /obj/redshirt
										if("Green")
											O=new /obj/greenshirt
										if("White")
											O=new /obj/whiteshirt
										if("Orange")
											O=new /obj/orangeshirt
										if("Purple")
											O=new /obj/purpleshirt
										if("Grey")
											O=new /obj/greyshirt
										if("Yellow")
											O=new /obj/yellowshirt
									usr << "<b>You got a shirt!!"
									usr.zenni -= 150
							if("Cape *350*")
								if(usr.zenni < 350)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/bluecape
										if("Black")
											O=new /obj/blackcape
										if("Red")
											O=new /obj/redcape
										if("Green")
											O=new /obj/greencape
										if("White")
											O=new /obj/whitecape
										if("Orange")
											O=new /obj/orangecape
										if("Purple")
											O=new /obj/purplecape
										if("Grey")
											O=new /obj/greycape
										if("Yellow")
											O=new /obj/yellowcape
									usr << "<b>You got a cape!!"
									usr.zenni -= 350
							if("Shoes *75*")
								if(usr.zenni < 75)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/blueshoes
										if("Black")
											O=new /obj/blackshoes
										if("Red")
											O=new /obj/redshoes
										if("Green")
											O=new /obj/greenshoes
										if("White")
											O=new /obj/whiteshoes
										if("Orange")
											O=new /obj/orangeshoes
										if("Purple")
											O=new /obj/purpleshoes
										if("Grey")
											O=new /obj/greyshoes
										if("Yellow")
											O=new /obj/yellowshoes
									usr << "<b>You got a pair of shoes!!"
									usr.zenni -= 75
							if("Gloves *50*")
								if(usr.zenni < 50)
									usr << "<b>insufficient funds</b>"
									nextpart=0
								else
									switch(input("What color would you like?", "Shopkeeper",text) in list ("Blue","Black","Red","Green","White","Orange","Purple","Grey","Yellow"))
										if("Blue")
											O=new /obj/bluegloves
										if("Black")
											O=new /obj/blackgloves
										if("Red")
											O=new /obj/redgloves
										if("Green")
											O=new /obj/greengloves
										if("White")
											O=new /obj/whitegloves
										if("Orange")
											O=new /obj/orangegloves
										if("Purple")
											O=new /obj/purplegloves
										if("Grey")
											O=new /obj/greygloves
										if("Yellow")
											O=new /obj/yellowgloves
									usr << "<b>You got a pair of gloves!!"
									usr.zenni -= 50
						if(nextpart==1)
							usr.contents += O
					else
						usr<<"Your inventory is full"
		oldShopkeeper
			icon = 'mobs.dmi'
			icon_state = "store"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Blue Gi(150z)","Orange Underclothing(50z)","Black Gi(150z)","Blue Underclothing(50z)","Black Underclothing(50z)","Turben(500z)","Cape(500z)","Namek Gi(500z)","White Boots and Gloves(50z)","Boxing Gloves(100z)","Class I Scouter(2000z)","Class II Scouter(4000z)","Class III Scouter(8000z)", "Senzu Bean(5000z)","Elite Saiyajin Armor(3000z)", "Elite Saiyajin Armor (Black)(3000z)","Elite Saiyajin Armor (Blue)(3000z)","Royal Saiyajin Armor(4500z)", "Saiyajin Armor(2000z)","Nevermind"))
						if("Blue Gi(150z)")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Blue Gi!"
								usr.contents += new /obj/bluegi
								usr.zenni -= 150
						if("Orange Underclothing(50z)")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Orange Underclothing!"
								usr.contents += new /obj/orangeunder
								usr.zenni -= 50
						if("Black Gi(150z)")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Black Gi!"
								usr.contents += new /obj/blackgi
								usr.zenni -= 150
						if("Blue Underclothing(50z)")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Blue Underclothing!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 50
						if("Black Underclothing(50z)")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Black Underclothing!"
								usr.contents += new /obj/blackunder
								usr.zenni -= 50
						if("White Boots and Gloves(50z)")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get White Boots and Gloves!"
								usr.contents += new /obj/bootglove
								usr.zenni -= 50
						if("Boxing Gloves(100z)")
							if(usr.zenni <= 99)
								usr << "<b>You need 100 zenni!"
							if(usr.zenni >= 100)
								usr << "<b>You get Boxing Gloves!"
								usr.contents += new /obj/boxingglove
								usr.zenni -= 100

						if("Cape(500z)")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Cape!"
								usr.contents += new /obj/cape
								usr.zenni -= 500


						if("Namek Gi(500z)")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Namek Gi!"
								usr.contents += new /obj/namekgi
								usr.zenni -= 500


						if("Saiyajin Armor(2000z)")
							if(usr.zenni < 2000)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get a Saiya-jin Armor!"
								usr.contents += new /obj/saiyanarmor
								usr.zenni -= 2000
						if("Elite Saiyajin Armor(3000z)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/elitesaiyanarmor
								usr.zenni -= 3000
						if("Royal Saiyajin Armor(4500z)")
							if(usr.zenni < 4500)
								usr << "<b>You need 4500 zenni!"
							if(usr.zenni >= 4500)
								usr << "<b>You get a Royal Saiya-jin Armor!"
								usr.contents += new /obj/royalsaiyan
								usr.zenni -= 4500
						if("Elite Saiyajin Armor (Blue)(3000z)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blueelite
								usr.zenni -= 3000
						if("Elite Saiyajin Armor (Black)(3000z)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blackelite
								usr.zenni -= 3000



mob
	Statue
		name = "MrSatan Statue"
		icon = 'Dragonball icons.dmi'
		icon_state = "Statue"
		npc = 1
		powerlevel = 1
		maxpowerlevel = 1


mob
	other
		frieza
			icon = 'ChangeForm4.dmi'
			name = "Master Frieza"
			powerlevel = 100000
			maxpowerlevel = 10000000
		tapion
			icon = 'tapion.dmi'
			icon_state = "play"
			powerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			name = "Tapion"
		master
			icon = 'mobs.dmi'
			icon_state = "master"
			npc = 1
			name = "Unknown"
			powerlevel = 1
			maxpowerlevel = 1
			name = "The Unknown"
		Yemma
			icon = 'yemma.dmi'
			powerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			name = "King Yemma"
			verb
				Decision()
					set src in oview(6)
					set category = "Communication"
					if(usr.ap>= 0)
						usr << "You are a good hearted person, you may continue to heaven or if you want you can try to run snake way to try to convince King Kai to train you."
						switch(input("Where do you want to go?","King Yemma",text) in list ("Heaven","King Kais","Im not sure yet"))
							if("King Kais")
								usr << "<b>After speaking to King Yemma you have decided to continue to Snake Way in search of king kai."
								usr.loc=locate(74,2,2)
							if("Heaven")
								usr<<" <b>After speaking to King Yemma you have decided to continue to Heaven."
								usr.loc=locate(69,6,4)
					if(usr.ap< 0)
						usr << "<b>You evil fiend....you will now GO TO HELL!!!!</b>"
						view(6) << "<b>Yemma smirks as [usr] falls to hell." //"Yemma smirks as he stamps the paperwork opening up a portal as [usr] falls to hell to fight their way out"
						usr.loc=locate((rand(1,150)),(rand(1,150)),8)
		kinjin2
			density=0
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					usr<<"*Kinjin ignores you*"
		Dummy
			icon = 'mobs.dmi'
			icon_state = "dummy"
			npc = 1
			name = "Class I Dummy"
			verb
				Train()
					set name = "Train"
					set category = "Fighting"
					set desc = ".."
					set src in oview(1)
					switch(input("What do you want to train?","Training",text) in list ("Punches","Kicks","Ki","None"))
						if("Punches")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr << "<b>You begin training your punches."
								usr.move = 0
								usr.punchcheck()
						if("Kicks")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your kicks."
								usr.kickcheck()
						if("Ki")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your ki."
								usr.kicheck()
						if("None")
							usr.training = 0
							usr << "<b>You stop training."
							usr.move = 1

mob
	proc
		punchcheck()
			if(src.training == 1)
				if(src.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					src.stamina = 0
				if(src.stamina >= 1)
					flick("sparfury", usr)
					src.stamina -= (rand(1,5))
					src.random = rand(1,2)
					if(src.random == 2)
						src.maxpowerlevel += (rand(1,5))
					else
						src.powerlevel += 0
					sleep(15)
					src.punchcheck()
			if(src.training == 0)
				src.powerlevel += 0
			else
				return

mob
	proc
		kickcheck()
			if(src.training == 1)
				if(src.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					src.stamina = 0
				if(src.stamina >= 1)
					flick("sparkick", usr)
					src.stamina -= (rand(1,5))
					src.random = rand(1,2)
					if(src.random == 2)
						src.maxpowerlevel += (rand(1,5))
					else
						src.powerlevel += 0
					sleep(15)
					src.kickcheck()
			if(src.training == 0)
				src.powerlevel += 0
			else
				return

mob
	proc
		kicheck()
			if(src.training == 1)
				if(src.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					src.stamina = 0
				if(src.stamina >= 1)
					flick("sparkifury", usr)
					src.stamina -= (rand(1,7))
					src.random = rand(1,2)
					if(src.random == 2)
						src.maxpowerlevel += (rand(1,7))
					else
						src.powerlevel += 0
					sleep(15)
					src.kicheck()
			if(src.training == 0)
				src.powerlevel += 0
			else
				return

mob
	other
		Tienshinhan
			name = "Tienshinhan"
			icon = 'mobs.dmi'
			icon_state = "tienshinhan"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 5
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("This is the secret Quest Gateway, if you arent Masterdan then shame on you.")

mob
	other
		Vegeta
			name = "Vegeta"
			icon = 'mobs.dmi'
			icon_state = "Vegeta"
			npc = 1
			powerlevel = 900000
			maxpowerlevel = 900000
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Hey,My name is Vegeta")
					switch(input("Do you wish to follow the way of 'Vegeta'?", "Vegeta",text) in list ("Yes","No","Offers"))
						if("Yes")
							usr.master = "Vegeta"
						if("Offers")
							alert("You can learn currently: Final Flash,Big Bang Attack")

				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Vegeta")
						switch(input("Do you wish to learn the technique, 'Big Bang Attack'?" , "Vegeta", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 25000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 25000)
									usr.verbs +=  /mob/FinalFlash/verb/FinalFlash
									usr.skillfinalflash=1
									alert("Vegeta teaches you the way of Final Flash")
						switch(input("Do you wish to learn the technique, 'Big Bang Attack'?" , "Vegeta", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 50000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 50000)
									usr.verbs +=  /mob/BigBang/verb/BigBang
									usr.skillbigbangattack=1
									alert("Vegeta teaches you the way of Big bang attack")
					else
						alert("You are not my student!")



		Goku
			name = "Goku"
			powerlevel = 5
			maxpowerlevel = 5
			icon = 'Npcs.dmi'
			npc = 1
			icon_state = "Goku"
			rhair = 40
			ghair = 80
			bhair = 255
			poratta = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Goku.")
					switch(input("Do you wish to follow the way of 'Goku'?", "Goku",text) in list ("Yes","No","Offers"))
						if("Yes")
							if(usr.race=="Earth-sei-jin")
								usr.master = "Goku"
							else
								usr<<"You must be a human to learn Unlock Potential"
						if("Offers")
							alert("You can learn currently: Unlock Potential")

				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Goku")
						if(usr.potrans == 1)
							usr << "Your power is already unlocked."
						if(usr.potrans == 0||usr.potrans == null)
							if(usr.maxpowerlevel < 100000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 100000 && usr.master == "Goku")
								usr.potrans = 1
								usr.verbs += /mob/Unlockpower/verb/Unlockpotential
								usr.verbs += /mob/Unlockpower/verb/Revert
								usr << "You learn unlock potential!"
					else
						alert("You are not my student!")

		Kame
			name = "Kamé-sennin"
			powerlevel = 5
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "roshi"

		Trunks
			name = "Trunks"
			powerlevel = 5
			maxpowerlevel = 5
			icon = 'trunks.dmi'
			npc = 1
			icon_state = "trunks"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
				/*	switch(input("Do you wish to learn the technique, 'Enrage'?" , "Trunks", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 5500)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 5500)
								alert("I shall now teach you Enrage.")
								flick("rage", src)
								usr << "<font color = green>{{<font color = white>Trunks<font color = green>}}<font color = white>: You need to focus your ki, and remember the hateful things in the past. For example, the recent death of [usr.ragename]."
								usr.verbs += /mob/enrage/verb/Enrage
								usr.skillenrage=1
				*/
					switch(input("Do you wish to learn the technique, 'Burning Attack?" , "Trunks", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 25000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 25000)
								alert("I shall now teach you Burning Attack.")
								usr.verbs += /mob/Burning/verb/Burning
								usr.skillburningattack=1

		Krillin
			name = "Krillin"
			powerlevel = 5
			maxpowerlevel = 5
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "krillin"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("Do you wish to learn the technique, 'Destructo Disc'?" , "Krillin", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 2000)
								usr << "You need to be stronger."
							if(usr.maxpowerlevel >= 2000)
								usr.verbs += /mob/kienzan/verb/Kienzan
								usr.skillkienzan=1
								usr.kame = 0


		Gero
			name = "Gero"
			powerlevel = 5
			maxpowerlevel = 5
			icon = 'Npcs.dmi'
			npc = 1
			icon_state = "gero"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Doctor Gero.")
					switch(input("Do you wish to follow the way of 'Red Ribbon'?", "Gero",text) in list ("Yes","No","Offers"))
						if("Yes")
							if(usr.race == "Biological Android"||usr.race == "Android")
								usr.master = "Gero"
							else
								usr << "You arent an Android."
				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Gero")
						switch(input("Would you like me to install 'Tech. Workings'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 1000)
									usr << "you are to weak."
								if(usr.maxpowerlevel >= 1000)
									usr.verbs += /mob/techwork/verb/Tech_Workings
									usr.verbs += /mob/bukujutsu/verb/bukujutsu
									usr.skillbukujutsu=1
									usr.skilltechwork=1

						switch(input("Would you like me to install 'World Scan'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 1000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 1000)
									usr.verbs += /mob/worldscan/verb/World_Scan
									usr.skillworldscan=1

						switch(input("Would you like me to install, 'Ki Absorb'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 5000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 5000)
									usr.verbs +=  /mob/kiabsorb/verb/Ki_Absorb
									usr.skillkiabsorb=1

						switch(input("Would you like me to install a rather large upgrade?, 'Super Android'?" , "Gero", text) in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 50000)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 50000)
									usr.verbs += /mob/AndroidTransform/verb/AndroidTransform
									usr.skillandroidtransform=1
									alert("In order to be able to start transforming to become a Super Android you need at least 50,000 powerlevel")
					else
						alert("You are not my student!")

mob
	monsters/demon
		randomperson2
			race="Demon(NPC)"
			hp=1200
			powerlevel=8000000
			maxpowerlevel=15000000
			move=1
			blocks=1
			dead = 0
			freerange=1
			npp = 0
			ko = 0
			safe = 0
			attackturn=1
			strength = 19080
			state = "Normal"
			nkispeech="<font color = red>Demon:<font color = white> <tt>:I don't care who you are I will kill you,.!! </tt>"
			ncustomred=244
			ncustomgreen=244
			ncustomblue=244
			New()
				..()
				sleep(rand(5,10))
				src.memx=src.x
				src.memy=src.y
				src.memz=src.z
				spawn()src.Wander2()
				spawn()src.LifeCycle()

			verb
				Talk()
					set category ="Communication"
					set src in oview(1)
					var/randomx=rand(1,10)
					if(randomx==1)
						alert("I will kill you..")
					if(randomx==2)
						alert("...")
					if(randomx==3)
						alert("Eat shit!.")
					if(randomx==4)
						alert("What do you want.You fappy bastard!")
					if(randomx==5)
						alert("Do I know you, Maggot!? Don't mess with me! ")
					if(randomx==6)
						alert("Being an NPC is a cold, shallow life.")
					if(randomx==7)
						alert("Jackass!")
					if(randomx==8)
						alert("It's freaking hot in hell. How would you like to fry.")
					if(randomx==9)
						alert("....I will make you suffer!")
					if(randomx==10)
						alert("You smell like horse turds..!")

			Male
				icon='maledemon.dmi'
				name="Demon(NPC)"
				New()
					var/dice=rand(1,5)
					var/dice2=rand(1,10)
					var/dice3=rand(1,10)
					var/zhairicon
					if(dice2==1)
						zhairicon = 'hair_kros_long.dmi'
					if(dice2==2)
						zhairicon = 'hair_punk.dmi'
					if(dice2==3)
						zhairicon = 'hair_yajirobe.dmi'
					if(dice2==4)
						zhairicon = 0
					if(dice2==5)
						zhairicon = 'hair_dan_spikeyshort.dmi'
					if(dice2==6)
						zhairicon = 'hair_dan_long.dmi'
					if(dice2==7)
						zhairicon = 'hair_dan_short.dmi'
					if(dice2==8)
						zhairicon = 'hair_trunks.dmi'
					if(dice2==9)
						zhairicon = 'hair_dan_spikey.dmi'
					if(dice2==10)
						zhairicon = 'hair_dan_spikeyshort.dmi'
					if(zhairicon)
						if(dice ==1)
							zhairicon += rgb(255,255,153)
						if(dice ==2)
							zhairicon += rgb(51,51,51)
						if(dice ==3)
							zhairicon += rgb(170,0,0)
						if(dice ==4)
							zhairicon += rgb(153,102,0)
						if(dice ==5)
							zhairicon += rgb(51,0,0)
						src.overlays+=zhairicon
					if(dice3==1)
						src.overlays+='clothes-blackshirt.dmi'
					if(dice3==2)
						src.overlays+='clothes-redshirt.dmi'
					if(dice3==3)
						src.overlays+='clothes-blueshirt.dmi'
					if(dice3==4)
						src.overlays+='clothes-greyshirt.dmi'
					if(dice3==5)
						src.overlays+='clothes-blackgi.dmi'
					if(dice3==6)
						src.overlays+='clothes-orangegi.dmi'
					if(dice3==7)
						src.overlays+='clothes-greygi.dmi'
					if(dice3==8)
						src.overlays+= 'clothes-redgi.dmi'
					if(dice3==9)
						src.overlays+= 'clothes-greenshirt.dmi'

					..()
			Female
				icon='female-black.dmi'
				name="Demon(NPC)"
				New()
					var/dice=rand(1,5)
					var/dice2=rand(1,4)
					var/dice3=rand(1,10)
					var/zhairicon
					if(dice2==1)
						zhairicon = 'hair_punk.dmi'
					if(dice2==2)
						zhairicon = 'hair_dan_long.dmi'
					if(dice2==3)
						zhairicon = 'Futuretrunkshair.dmi'
					if(dice2==4)
						zhairicon = 'fem-hair-long.dmi'
					if(zhairicon)
						if(dice ==1)
							zhairicon += rgb(255,255,153)
						if(dice ==2)
							zhairicon += rgb(51,51,51)
						if(dice ==3)
							zhairicon += rgb(170,0,0)
						if(dice ==4)
							zhairicon += rgb(153,102,0)
						if(dice ==5)
							zhairicon += rgb(51,0,0)
						src.overlays+=zhairicon
					if(dice3==1)
						src.overlays+='clothes-blackshirt.dmi'
					if(dice3==2)
						src.overlays+='clothes-redshirt.dmi'
					if(dice3==3)
						src.overlays+='clothes-blueshirt.dmi'
					if(dice3==4)
						src.overlays+='clothes-greyshirt.dmi'
					if(dice3==5)
						src.overlays+='clothes-blackgi.dmi'
					if(dice3==6)
						src.overlays+='clothes-orangegi.dmi'
					if(dice3==7)
						src.overlays+='clothes-greygi.dmi'
					if(dice3==8)
						src.overlays+= 'clothes-redgi.dmi'
					if(dice3==9)
						src.overlays+= 'clothes-greenshirt.dmi'

					..()
			proc/Wander2()
				src.isnap=0
				while(src.move==0)
					sleep(43)
					sleep(rand(15,20))
				if(src.move!=0)
					var/countergo=0
					for(var/mob/characters/D in oview(6,src))
						if(D.client)
							sleep(12)
							countergo=1
					if(countergo==1)
						if (client || isDead())
							sleep(5)
							return
						var/action_taken
						if(src.powerlevel<src.maxpowerlevel)
							var/randomx=rand(1,20)
							if(randomx==20)
								sleep(12)
								src.powerlevel+=src.maxpowerlevel/20
								if(src.powerlevel>src.maxpowerlevel)
									src.powerlevel=src.maxpowerlevel
						step_rand(src)
						sleep(10)
						action_taken = 1
						if (action_taken)
							sleep(12)
							while(src.Retreat())
							sleep(10)
							return
						..()
					else
						sleep(5)
						spawn()src.Wander2()
						sleep(6)
						spawn()src.Wander()

			proc/Wander()
				if(src.target=="None")
					for(var/mob/characters/X in oview(4,src))
						spawn()
							sleep(1)
							if(src.target=="None")
								if(X.client)
									src.target="[X.name]"
				if(src)
					var/cont = 0 //Que?
					var/action_taken
					var/mob/mytarget1 = 0
					for(var/mob/characters/D in oview(10,src))
						if(src.target=="[D.name]")
							cont=1
							mytarget1=D


/************************************************

To Fix / Replace: Find a better dice roll method...

*************************************************/

					var/dice4 = rand(1,125)
					if(dice4==60||dice4==5||dice4==24||dice4==55||dice4==64||dice4==25||dice4==74||dice4==65||dice4==84||dice4==1||dice4==12||dice4==29||dice4==26||dice4==64||dice4==21||dice4==51||dice4==68||dice4==43||dice4==17||dice4==50||dice4==49||dice4==3||dice4==2||dice4==20||dice4==71||dice4==52||dice4==11)
						sleep(7)

						walk_to(src,mytarget1)
						sleep(7)
						src.blocks=1
						walk_to(src,mytarget1)

					if(dice4==37||dice4==15||dice4==14||dice4==55||dice4==64||dice4==25||dice4==74)
						walk_to(src,mytarget1)
						sleep(5)
						src.blocks=0
						sleep(2)
						src.powerupenemy()
						sleep(5)
						sleep(6)
					src.isnap=0
					while(src.move==0)
						sleep(30)
						sleep(rand(15,20))
					if(src.move!=0)
						var/countergo=0
						for(var/mob/characters/D in oview(6,src))
							if(D.client)
								countergo=1
								sleep(12)
						if(countergo==1)
							if (client || isDead())
								sleep(5)
								return
								sleep(12)
							if(src.powerlevel<src.maxpowerlevel)
								var/randomx=rand(1,20)
								if(randomx==20)
									sleep(24)
									src.powerlevel+=src.maxpowerlevel/20
									if(src.powerlevel>src.maxpowerlevel)
										src.powerlevel=src.maxpowerlevel
							walk(src,mytarget1)
							sleep(10)
							action_taken = 1
							if (action_taken)
								sleep(11)
								while(src.Retreat())
								sleep(11)
								spawn()Wander()
								return
							..()
						else
							sleep(12)
							spawn()src.napz()
			proc
				napz()
					sleep(rand(10,30))
					var/inview=0
					for(var/mob/characters/D in oview(10,src))
						if(D.client)
							inview=1
							sleep(12)
					if(inview==1)
						if(src.isnap==0)
							sleep(12)
							spawn()Wander()
					else
						src.isnap = 1
					sleep(12)
					return
mob/monsters
	people
		randomperson
			race="Killable(NPC)"
			hp=200
			powerlevel=4
			maxpowerlevel=4
			move=1
			New()
				..()
				sleep(rand(5,10))
				src.memx=src.x
				src.memy=src.y
				src.memz=src.z
				spawn()src.Wander()
			verb
				Talk()
					set category ="Communication"
					set src in oview(1)
					var/randomx=rand(1,10)
					if(randomx==1)
						alert("Hello")
					if(randomx==2)
						alert("...")
					if(randomx==3)
						alert("Excuse me i have to be going.")
					if(randomx==4)
						alert("What do you want.")
					if(randomx==5)
						alert("Do i know you?")
					if(randomx==6)
						alert("Being an NPC is a cold, shallow life.")
					if(randomx==7)
						alert("Howdy!")
					if(randomx==8)
						alert("Its freaking hot out.")
					if(randomx==9)
						alert("I feel like Potatoes. Yum..")
					if(randomx==10)
						alert("When was the last time you took a shower, god.")

			Male
				icon='male.dmi'
				name="(NPC)"
				New()
					var/dice=rand(1,5)
					var/dice2=rand(1,10)
					var/dice3=rand(1,10)
					var/zhairicon
					if(dice2==1)
						zhairicon = 'hair_kros_long.dmi'
					if(dice2==2)
						zhairicon = 'hair_punk.dmi'
					if(dice2==3)
						zhairicon = 'hair_yajirobe.dmi'
					if(dice2==4)
						zhairicon = 0
					if(dice2==5)
						zhairicon = 'hair_dan_spikeyshort.dmi'
					if(dice2==6)
						zhairicon = 'hair_dan_long.dmi'
					if(dice2==7)
						zhairicon = 'hair_dan_short.dmi'
					if(dice2==8)
						zhairicon = 'hair_trunks.dmi'
					if(dice2==9)
						zhairicon = 'hair_dan_spikey.dmi'
					if(dice2==10)
						zhairicon = 'hair_dan_spikeyshort.dmi'
					if(zhairicon)
						if(dice ==1)
							zhairicon += rgb(255,255,153)
						if(dice ==2)
							zhairicon += rgb(51,51,51)
						if(dice ==3)
							zhairicon += rgb(170,0,0)
						if(dice ==4)
							zhairicon += rgb(153,102,0)
						if(dice ==5)
							zhairicon += rgb(51,0,0)
						src.overlays+=zhairicon
					if(dice3==1)
						src.overlays+='clothes-blackshirt.dmi'
					if(dice3==2)
						src.overlays+='clothes-redshirt.dmi'
					if(dice3==3)
						src.overlays+='clothes-blueshirt.dmi'
					if(dice3==4)
						src.overlays+='clothes-greyshirt.dmi'
					if(dice3==5)
						src.overlays+='clothes-blackgi.dmi'
					if(dice3==6)
						src.overlays+='clothes-orangegi.dmi'
					if(dice3==7)
						src.overlays+='clothes-greygi.dmi'
					if(dice3==8)
						src.overlays+= 'clothes-redgi.dmi'
					if(dice3==9)
						src.overlays+= 'clothes-greenshirt.dmi'

					..()
			Female
				icon='female.dmi'
				name="(NPC)"
				New()
					var/dice=rand(1,5)
					var/dice2=rand(1,4)
					var/dice3=rand(1,10)
					var/zhairicon
					if(dice2==1)
						zhairicon = 'hair_punk.dmi'
					if(dice2==2)
						zhairicon = 'hair_dan_long.dmi'
					if(dice2==3)
						zhairicon = 'Futuretrunkshair.dmi'
					if(dice2==4)
						zhairicon = 'fem-hair-long.dmi'
					if(zhairicon)
						if(dice ==1)
							zhairicon += rgb(255,255,153)
						if(dice ==2)
							zhairicon += rgb(51,51,51)
						if(dice ==3)
							zhairicon += rgb(170,0,0)
						if(dice ==4)
							zhairicon += rgb(153,102,0)
						if(dice ==5)
							zhairicon += rgb(51,0,0)
						src.overlays+=zhairicon
					if(dice3==1)
						src.overlays+='clothes-blackshirt.dmi'
					if(dice3==2)
						src.overlays+='clothes-redshirt.dmi'
					if(dice3==3)
						src.overlays+='clothes-blueshirt.dmi'
					if(dice3==4)
						src.overlays+='clothes-greyshirt.dmi'
					if(dice3==5)
						src.overlays+='clothes-blackgi.dmi'
					if(dice3==6)
						src.overlays+='clothes-orangegi.dmi'
					if(dice3==7)
						src.overlays+='clothes-greygi.dmi'
					if(dice3==8)
						src.overlays+= 'clothes-redgi.dmi'
					if(dice3==9)
						src.overlays+= 'clothes-greenshirt.dmi'

					..()
			proc/Wander()
				src.isnap=0
				while(src.move==0)
					sleep(10)
					sleep(rand(5,10))
				if(src.move!=0)
					var/countergo=0
					for(var/mob/characters/D in oview(6,src))
						if(D.client)
							countergo=1
					if(countergo==1)
						if (client || isDead())
							return
						var/action_taken
						if(src.powerlevel<src.maxpowerlevel)
							var/randomx=rand(1,20)
							if(randomx==20)
								sleep(2)
								src.powerlevel+=src.maxpowerlevel/20
								if(src.powerlevel>src.maxpowerlevel)
									src.powerlevel=src.maxpowerlevel
						step_rand(src)
						sleep(100)
						action_taken = 1
						if (action_taken)
							sleep(1)
							while(src.Retreat())
								sleep(2)
							spawn()Wander()
							return
						..()
					else
						spawn()src.napz()
			proc
				napz()
					sleep(rand(10,30))
					var/inview=0
					for(var/mob/characters/D in oview(10,src))
						if(D.client)
							inview=1
					if(inview==1)
						if(src.isnap==0)
							spawn()Wander()
					else
						src.isnap = 1
					return
mob/proc
	Retreat(mob/D)
		if(src.move!=0&&D)
			if (client || isDead())
				return
			var/stepsleft=8
			while(D&&stepsleft>0)
				step_away(src,D,8)
				sleep(1)
				stepsleft-=1

mob
	var
		nkispeech
		ncustomred
		ncustomgreen
		ncustomblue
	monsters
		var
			freerange=0
			memx=1
			memy=1
			memz=1
		freerange
			freerange=1
			New()
				..()
				sleep(rand(5,10))
				src.memx=src.x
				src.memy=src.y
				src.memz=src.z
			saibaman
				icon = 'saiba.dmi'
				powerlevel = 1000
				maxpowerlevel = 1000
				blocks=1
				dead = 0
				npp = 0
				ko = 0
				safe = 0
				strength = 80
				race = "FreeEnemy(NPC)"
				state = "Normal"
				nkispeech="<font color = red>Saibaman:<font color = white> <tt>:Acid Blast!! </tt>"
				ncustomred=244
				ncustomgreen=244
				ncustomblue=244
			saibaman2
				icon = 'saibared.dmi'
				powerlevel = 3000
				maxpowerlevel = 3000
				dead = 0
				blocks=1
				npp = 0
				ko = 0
				safe = 0
				strength = 240
				race = "FreeEnemy(NPC)"
				state = "Normal"
				nkispeech="<font color = red>Saibaman:<font color = white> <tt>:Acid Blast!! </tt>"
				ncustomred=244
				ncustomgreen=244
				ncustomblue=244
			saibaman3
				icon = 'saibablue.dmi'
				powerlevel = 10000
				blocks=1
				maxpowerlevel = 10000
				dead = 0
				npp = 0
				ko = 0
				safe = 0
				strength = 810
				race = "FreeEnemy(NPC)"
				state = "Normal"
				nkispeech="<font color = red>Saibaman:<font color = white> <tt>:Acid Blast!! </tt>"
				ncustomred=244
				ncustomgreen=244
				ncustomblue=244
			Henchman
				powerlevel = 19000
				maxpowerlevel=19000
				dead = 0
				icon = 'elitehenchmen.dmi'
				icon_state = "henchmen"
				ko = 0
				safe = 0
				npp = 0
				blocks=1
				ssj = 0
				strength = 1000
				race = "FreeEnemy(NPC)"
				state = "Normal"
			Henchman2
				powerlevel = 32000
				maxpowerlevel=32000
				dead = 0
				icon = 'elitehenchmen2.dmi'
				icon_state = "henchmen"
				ko = 0
				safe = 0
				blocks=1
				npp = 0
				ssj = 0
				strength = 1000
				race = "FreeEnemy(NPC)"
				state = "Normal"
			Henchman3
				powerlevel = 76000
				maxpowerlevel=76000
				dead = 0
				blocks=1
				icon = 'elitehenchmen3.dmi'
				icon_state = "henchmen"
				ko = 0
				safe = 0
				npp = 0
				ssj = 0
				strength = 1000
				race = "FreeEnemy(NPC)"
				state = "Normal"
			RRdroid
				powerlevel=200000
				maxpowerlevel=200000
				dead = 0
				icon = 'RRdroid.dmi'
				icon_state = ""
				ko = 0
				blocks=1
				safe = 0
				npp = 0
				ssj = 0
				strength = 1900
				race = "FreeEnemy(NPC)"
				state = "Normal"
			RRsoldier
				powerlevel=500000
				maxpowerlevel=500000
				dead = 0
				icon = 'RRsoldier.dmi'
				icon_state = ""
				ko = 0
				safe = 0
				blocks=1
				npp = 0
				ssj = 0
				strength = 2100
				race = "FreeEnemy(NPC)"
				state = "Normal"
			Celljr
				powerlevel = 200000000
				maxpowerlevel = 400000000
				dead = 0
				icon = 'Cell.jr.dmi'
				icon_state = ""
				ko = 0
				safe = 0
				npp = 0
				blocks=1
				ssj = 0
				strength = 4500
				race = "FreeEnemy(NPC)"
				state = "Normal"
				sleeptime=7
				nkispeech="<font color = red>Celljr:<font color = white> <tt>:Masenko!! </tt>"
				ncustomred=204
				ncustomgreen=51
				ncustomblue=204
			MajinFighter
				powerlevel = 3000000
				maxpowerlevel = 3000000
				dead = 0
				icon = 'majinfighter.dmi'
				icon_state = ""
				ko = 0
				safe = 0
				npp = 0
				blocks=1
				ssj = 0
				strength = 6500
				race = "FreeEnemy(NPC)"
				state = "Normal"
				sleeptime=7
				nkispeech="<font color = red>Majin Fighter:<font color = white> <tt>:Demon Blast!! </tt>"
				ncustomred=204
				ncustomgreen=0
				ncustomblue=0
			MajinFighter2
				powerlevel = 3700000
				maxpowerlevel = 3700000
				dead = 0
				icon = 'majinfighter2.dmi'
				icon_state = ""
				ko = 0
				blocks=1
				safe = 0
				npp = 0
				ssj = 0
				strength = 7000
				race = "FreeEnemy(NPC)"
				state = "Normal"
				sleeptime=7
				nkispeech="<font color = red>Majin Fighter:<font color = white> <tt>:Demon Blast!! </tt>"
				ncustomred=204
				ncustomgreen=0
				ncustomblue=0
		saibaman
			powerlevel = 1000
			maxpowerlevel = 1000
			dead = 0
			icon = 'saiba.dmi'
			npp = 0
			ko = 0
			safe = 0
			strength = 80
			blocks=1
			race = "Saibaman"
			state = "Normal"
			nkispeech="<font color = red>Saibaman:<font color = white> <tt>:Acid Blast!! </tt>"
			ncustomred=244
			ncustomgreen=244
			ncustomblue=244
		saibaman2
			powerlevel = 1000
			maxpowerlevel = 1000
			dead = 0
			icon = 'saiba.dmi'
			npp = 0
			ko = 0
			blocks=1
			safe = 0
			strength = 80
			race = "Enemy(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Saibaman:<font color = white> <tt>:Acid Blast!! </tt>"
			ncustomred=244
			ncustomgreen=244
			ncustomblue=244
mob
	monsters
		owner="09210441515161674"
		mode="Berserk"
		Raditz
			powerlevel = 1400
			maxpowerlevel = 1400
			dead = 0
			icon = 'raditzsagamobs.dmi'
			icon_state = "raditz"
			ko = 0
			safe = 0
			sleeptime=8
			blocks=1
			npp = 0
			ssj = 0
			strength = 120
			nkispeech="<font color = red>Raditz:<font color = white> <tt>:Buster Cannon! </tt>"
			ncustomred=255
			ncustomgreen=201
			ncustomblue=0
			race = "Raditz(NPC)"
			state = "Normal"
		Totepo
			powerlevel = 7100
			maxpowerlevel = 7100
			dead = 0
			icon = 'Dragonball icons.dmi'
			icon_state = "Totepo"
			ko = 0
			blocks=1
			safe = 0
			npp = 0
			ssj = 0
			strength = 720
			nkispeech="<font color = red>Totepo:<font color = white> <tt>:Buster Cannon! </tt>"
			ncustomred=255
			ncustomgreen=201
			ncustomblue=0
			race = "Respawnable(NPC)"
			state = "Normal"
		Celipa
			powerlevel = 4100
			maxpowerlevel = 4100
			dead = 0
			icon = 'Dragonball icons.dmi'
			icon_state = "Celipa"
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			strength = 420
			nkispeech="<font color = red>Celipa:<font color = white> <tt>:Burning Shot! </tt>"
			ncustomred=255
			ncustomgreen=201
			ncustomblue=0
			race = "Respawnable(NPC)"
			state = "Normal"
		Panboukin
			powerlevel = 7400
			maxpowerlevel = 7400
			dead = 0
			icon = 'Dragonball icons.dmi'
			icon_state = "Panboukin"
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			nkispeech="<font color = red>Panpoukin:<font color = white> <tt>:Mouth Blast!! </tt>"
			ncustomred=255
			ncustomgreen=201
			ncustomblue=0
			strength = 740
			race = "Respawnable(NPC)"
			state = "Normal"
		Kiwi
			powerlevel = 24400
			maxpowerlevel = 24400
			dead = 0
			icon = 'Kiwi.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			sleeptime=8
			strength = 1840
			race = "Kiwi(NPC)"
			state = "Normal"
		Henchman
			powerlevel = 9000
			maxpowerlevel=9000
			dead = 0
			icon = 'elitehenchmen.dmi'
			icon_state = "henchmen"
			ko = 0
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			strength = 300
			race = "Respawnable(NPC)"
			state = "Normal"
		Dodoria
			powerlevel = 31000
			maxpowerlevel = 31000
			dead = 0
			icon = 'dodoria.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			blocks=1
			npp = 0
			ssj = 0
			sleeptime=9
			strength = 3100
			race = "Dodoria(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Dodoria:<font color = white> <tt>:Mouth Blast!! </tt>"
			ncustomred=255
			ncustomgreen=0
			ncustomblue=255
		Zarbon
			powerlevel = 61400
			maxpowerlevel = 61400
			dead = 0
			icon = 'Zarbon.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			blocks=1
			npp = 0
			ssj = 0
			strength = 3140
			race = "Zarbon(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Zarbon:<font color = white> <tt>:Crusher Ball!! </tt>"
			ncustomred=238
			ncustomgreen=0
			ncustomblue=0
		Nappa
			powerlevel = 8400
			maxpowerlevel = 8400
			dead = 0
			icon = 'Nappa.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			sleeptime=9
			strength = 740
			nkispeech="<font color = red>Nappa:<font color = white> <tt>:Mouth Blast!!! </tt>"
			ncustomred=255
			ncustomgreen=204
			ncustomblue=0
			race = "Nappa(NPC)"
			state = "Normal"
		Toma
			powerlevel = 8400
			maxpowerlevel = 8400
			dead = 0
			icon = 'Tora.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			strength = 840
			race = "Respawnable(NPC)"
			state = "Normal"
		KingVegeta
			powerlevel = 21400
			maxpowerlevel = 21400
			dead = 0
			blocks=1
			icon = 'kingvegeta.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 2140
			race = "Respawnable(NPC)"
			state = "Normal"
		Bardock
			powerlevel = 19400
			maxpowerlevel = 19400
			dead = 0
			icon = 'Bardock.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 1940
			race = "Respawnable(NPC)"
			state = "Normal"
		Vegeta
			powerlevel = 12500
			maxpowerlevel = 12500
			dead = 0
			icon = 'vegeta.dmi'
			icon_state = ""
			ko = 0
			blocks=1
			safe = 0
			npp = 0
			sleeptime=7
			ssj = 0
			strength = 1250
			nkispeech="<font color = red>Vegeta:<font color = white> <tt>:Galek Gun!!! </tt>"
			ncustomred=153
			ncustomgreen=51
			ncustomblue=153
			race = "Vegeta(NPC)"
			state = "Normal"
		Brolly
			powerlevel = 1081250000
			maxpowerlevel = 2200000000
			dead = 0
			blocks=1
			icon = 'Broly.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 9250
			race = "Respawnable(NPC)"
			state = "Normal"
		Guldo
			powerlevel = 60000
			maxpowerlevel = 60000
			dead = 0
			icon = 'guldo1.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			blocks=1
			npp = 0
			ssj = 0
			sleeptime=8
			strength = 5000
			race = "Guldo(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Guldo:<font color = white> <tt>:Shogekiha!! </tt>"
			ncustomred=255
			ncustomgreen=255
			ncustomblue=255
		Burter
			powerlevel = 100000
			maxpowerlevel = 100000
			dead = 0
			icon = 'Burter.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			sleeptime=8
			blocks=1
			strength = 2000
			race = "Burter(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Burter:<font color = white> <tt>:Tsuihidan!! </tt>"
			ncustomred=255
			ncustomgreen=204
			ncustomblue=51
		Jeice
			powerlevel = 100000
			maxpowerlevel = 100000
			dead = 0
			icon = 'Jeice.dmi'
			icon_state = ""
			ko = 0
			blocks=1
			safe = 0
			npp = 0
			ssj = 0
			sleeptime=8
			strength = 2000
			race = "Jeice(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Jeice:<font color = white> <tt>:Crasher Ball!!! </tt>"
			ncustomred=255
			ncustomgreen=51
			ncustomblue=0
		Recoom
			powerlevel = 130000
			maxpowerlevel = 130000
			dead = 0
			icon = 'Recoom.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			sleeptime=9
			strength = 4900
			nkispeech="<font color = red>Recoom:<font color = white> <tt>:Mouth Blast!! </tt>"
			ncustomred=255
			ncustomgreen=201
			ncustomblue=0
			race = "Recoom(NPC)"
			state = "Normal"
		Ginyu
			powerlevel = 230000
			maxpowerlevel = 230000
			dead = 0
			icon = 'CaptainGinyu.dmi'
			icon_state = "Ginyu"
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 2000
			race = "Ginyu(NPC)"
			blocks=1
			nkispeech="<font color = red>Ginyu:<font color = white> <tt>:Bakurikimaha!! </tt>"
			ncustomred=51
			ncustomgreen=0
			ncustomblue=255
			state = "Normal"

		Frieza1
			powerlevel = 450000
			maxpowerlevel = 450000
			dead = 0
			icon = 'Freiza.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			blocks=1
			hp=250
			ssj = 0
			strength = 4000
			race = "Friezaform1(NPC)"
			state = "Normal"
			sleeptime=7
			nkispeech="<font color = red>Frieza:<font color = white> <tt>:Death Ball! </tt>"
			ncustomred=0
			ncustomgreen=0
			ncustomblue=0
		Frieza2
			powerlevel = 600000
			maxpowerlevel = 1000000
			dead = 0
			icon = 'Freizaform2.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			blocks=1
			hp=350
			npp = 0
			ssj = 0
			sleeptime=8
			strength = 8000
			race = "Friezaform2(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Frieza:<font color = white> <tt>:Daichiretsuzan! </tt>"
			ncustomred=255
			ncustomgreen=255
			ncustomblue=255
		Frieza3
			powerlevel = 800000
			maxpowerlevel = 1100000
			dead = 0
			icon = 'Freizaform3.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			hp=400
			ssj = 0
			blocks=1
			sleeptime=9
			strength = 9000
			race = "Friezaform3(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Frieza:<font color = white> <tt>:Eraser Cannon!! </tt>"
			ncustomred=204
			ncustomgreen=0
			ncustomblue=204
		Frieza4
			powerlevel = 1100000
			maxpowerlevel = 120000000
			dead = 0
			blocks=1
			icon = 'Freizaform4.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			hp=650
			sleeptime=5
			ssj = 0
			strength = 20000
			race = "Friezaform4(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Frieza:<font color = white> <tt>:Frieza Beam! </tt>"
			ncustomred=150
			ncustomgreen=0
			ncustomblue=0
		Friezabot
			powerlevel = 1700000
			maxpowerlevel = 125000000
			dead = 0
			blocks=1
			hp=700
			icon = 'Freizamech.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			sleeptime=6
			strength = 20000
			race = "Friezabot(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Frieza:<font color = white> <tt>:Death Ball! </tt>"
			ncustomred=0
			ncustomgreen=0
			ncustomblue=0
		KingCold
			powerlevel = 110000000
			maxpowerlevel = 500000000
			dead = 0
			icon = 'kingcold.dmi'
			icon_state = ""
			ko = 0
			hp=900
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			sleeptime=7
			strength = 40000
			race = "Kingcold(NPC)"
			state = "Normal"
			nkispeech="<font color = red>King Cold:<font color = white> <tt>:Daichiretsuzan! </tt>"
			ncustomred=255
			ncustomgreen=255
			ncustomblue=255

		A20
			powerlevel = 140100000
			maxpowerlevel = 192100000
			dead = 0
			icon = 'android20.dmi'
			icon_state = ""
			ko = 0
			hp=800
			safe = 0
			npp = 0
			ssj = 0
			sleeptime=6
			strength = 18000
			blocks=1
			race = "20(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Android 20:<font color = white> <tt>:Amplified Energy Blast! </tt>"
			ncustomred=51
			ncustomgreen=153
			ncustomblue=255
		A19
			powerlevel = 180900000
			maxpowerlevel = 190900000
			dead = 0
			icon = 'android19.dmi'
			icon_state = ""
			ko = 0
			hp=840
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			sleeptime=9
			strength = 16000
			race = "19(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Android 19:<font color = white> <tt>:Amplified Energy Blast! </tt>"
			ncustomred=51
			ncustomgreen=153
			ncustomblue=255

		A17
			powerlevel = 506000000
			maxpowerlevel = 502600000
			dead = 0
			icon = 'android17.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			hp=920
			blocks=1
			sleeptime=5
			ssj = 0
			strength =16000
			race = "17(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Android 17:<font color = white> <tt>:Amplified Energy Blast! </tt>"
			ncustomred=51
			ncustomgreen=153
			ncustomblue=255
		A18
			powerlevel = 500400000
			maxpowerlevel = 500400000
			dead = 0
			icon = 'android18.dmi'
			icon_state = ""
			ko = 0
			hp=910
			sleeptime=5
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			strength = 13000
			race = "18(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Android 18:<font color = white> <tt>:Amplified Energy Blast! </tt>"
			ncustomred=51
			ncustomgreen=153
			ncustomblue=255
		A16
			powerlevel = 60080000
			maxpowerlevel = 600280000
			dead = 0
			icon = 'Android 16.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			hp=1000
			safe = 0
			sleeptime=7
			npp = 0
			ssj = 0
			strength = 18000
			race = "16(NPC)"
			state = "Normal"
			nkispeech="<font color = red>Android 16:<font color = white> <tt>:Hells Flash!!! </tt>"
			ncustomred=203
			ncustomgreen=0
			ncustomblue=0
		Celljr
			powerlevel = 2000000
			maxpowerlevel = 466055274
			dead = 0
			icon = 'Cell.jr.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			hp=850
			safe = 0
			npp = 0
			ssj = 0
			strength = 19000
			race = "Celljr(NPC)"
			state = "Normal"
			sleeptime=7
			nkispeech="<font color = red>Cell:<font color = white> <tt>:Masenko!! </tt>"
			ncustomred=204
			ncustomgreen=51
			ncustomblue=204
		Cell
			powerlevel = 605000000
			maxpowerlevel = 690000000
			dead = 0
			icon = 'biocell1.dmi'
			icon_state = ""
			ko = 0
			blocks=1
			hp=1000
			safe = 0
			npp = 0
			ssj = 0
			strength = 50000
			race = "Cell1(NPC)"
			state = "Normal"
			sleeptime=5
			nkispeech="<font color = red>Cell:<font color = white> <tt>:Kamehameha! </tt>"
			ncustomred=51
			ncustomgreen=153
			ncustomblue=255
		imperfectCell
			powerlevel = 703050000
			maxpowerlevel = 779500000
			dead = 0
			icon = 'biocell2.dmi'
			icon_state = ""
			ko = 0
			hp=1300
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			strength = 25000
			race = "Cell2(NPC)"
			state = "Normal"
			sleeptime=6
			nkispeech="<font color = red>Cell:<font color = white> <tt>:Masenko!! </tt>"
			ncustomred=204
			ncustomgreen=51
			ncustomblue=204
		Trunks
			powerlevel = 12500000
			maxpowerlevel = 12500000
			dead = 0
			ko = 0
			blocks=1
			blocks=1
			safe = 0
			npp = 0
			ssj = 0
			strength = 1250000
			race = "Trunks(NPC)"
			icon='Dragonball Icons.dmi'
			icon_state = "Trunks2"
		FutureTrunks
			powerlevel = 1
			maxpowerlevel = 400000001
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			blocks=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingTrunks(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Trunks2"
			nkispeech="<font color = red>Trunks:<font color = white> <tt>:Burning Attack!!!! </tt>"
			ncustomred=100
			ncustomgreen=100
			ncustomblue=0
		Krillin
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			blocks=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingKrillin(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Krillin"
			nkispeech="<font color = red>Krillin:<font color = white> <tt>:Kamehameha!!!!! </tt>"
			ncustomred=10
			ncustomgreen=10
			ncustomblue=180
		Tien
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			blocks=1
			ssj = 0
			strength = 0
			race = "TrainingTien(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Tien"
			nkispeech="<font color = red>Tien:<font color = white> <tt>:HA!!!!! </tt>"
			ncustomred=200
			ncustomgreen=200
			ncustomblue=200
		Chozou
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			blocks=1
			trainer=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingChozou(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Chozou"
			nkispeech="<font color = red>Chozou:<font color = white> <tt>:HA!!!!! </tt>"
			ncustomred=200
			ncustomgreen=200
			ncustomblue=200
		Goten
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			ssj = 0
			blocks=1
			strength = 0
			race = "TrainingGoten(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Goten"
			nkispeech="<font color = red>Goten:<font color = white> <tt>:HIYAAA </tt>"
			ncustomred=100
			ncustomgreen=100
			ncustomblue=200
		Piccolo
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			ssj = 0
			blocks=1
			strength = 0
			race = "TrainingPiccolo(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Piccolo"
			nkispeech="<font color = red>Piccolo:<font color = white> <tt>:RoAA! </tt>"
			ncustomred=100
			ncustomgreen=200
			ncustomblue=100
		Gohan
			powerlevel = 1
			maxpowerlevel = 900000001
			dead = 0
			blocks=1
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingGohan(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Gohan"
			nkispeech="<font color = red>Gohan:<font color = white> <tt>:Masenko! </tt>"
			ncustomred=100
			ncustomgreen=200
			ncustomblue=200
		Mutant
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			blocks=1
			safe = 0
			trainer=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingMutant(NPC)"
			icon='mutant.dmi'
			sleeptime=4
			icon_state = ""
			nkispeech="<font color = red>Mutant:<font color = white> <tt>:Roar! </tt>"
			ncustomred=100
			ncustomgreen=50
			ncustomblue=50
		Putty
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			blocks=1
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingPutty(NPC)"
			icon='Putty.dmi'
			sleeptime=6
			icon_state = ""
			nkispeech="<font color = red>Putty:<font color = white> <tt>:BLUBBLUBBLUB </tt>"
			ncustomred=50
			ncustomgreen=50
			ncustomblue=50
		Putty2
			powerlevel = 1000000
			maxpowerlevel = 1000000
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			npp = 0
			blocks=1
			ssj = 0
			strength = 0
			race = "Enemy(NPC)"
			icon='Putty.dmi'
			sleeptime=6
			icon_state = ""
			nkispeech="<font color = red>Putty:<font color = white> <tt>:BLUBBLUBBLUB </tt>"
			ncustomred=50
			ncustomgreen=50
			ncustomblue=50
		Yamcha
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			blocks=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingYamcha(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Yamcha2"
			nkispeech="<font color = red>Yamcha:<font color = white> <tt>:Wind-Wolf Flare! </tt>"
			ncustomred=200
			ncustomgreen=200
			ncustomblue=200
		KidTrunks
			powerlevel = 1
			maxpowerlevel = 1
			dead = 0
			ko = 0
			safe = 0
			trainer=1
			blocks=1
			npp = 0
			ssj = 0
			strength = 0
			race = "TrainingKidTrunks(NPC)"
			icon='Dragonball Icons.dmi'
			sleeptime=4
			icon_state = "Trunks5"
			nkispeech="<font color = red>Trunks:<font color = white> <tt>:Crasher Ball! </tt>"
			ncustomred=200
			ncustomgreen=200
			ncustomblue=100
		perfectCell
			powerlevel = 90500000
			maxpowerlevel = 900450000
			dead = 0
			icon = 'biocell3.dmi'
			blocks=1
			icon_state = ""
			ko = 0
			hp=1200
			safe = 0
			npp = 0
			ssj = 0
			strength = 45000
			race = "Cell3(NPC)"
			state = "Normal"
			sleeptime=4
			nkispeech="<font color = red>Cell:<font color = white> <tt>:Big-Bang-Attack!!!! </tt>"
			ncustomred=40
			ncustomgreen=100
			ncustomblue=255
		Spopovich
			powerlevel = 360000
			maxpowerlevel = 360000
			dead = 0
			icon = 'spopovitch.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			blocks=1
			ssj = 0
			strength = 3500
			race = "Spopovich(NPC)"
			state = "Normal"
			sleeptime=6
			nkispeech="<font color = red>Spopovich:<font color = white> <tt>:Eraser Cannon!! </tt>"
			ncustomred=204
			ncustomgreen=0
			ncustomblue=204
		Yamu
			powerlevel = 390000
			maxpowerlevel = 390000
			dead = 0
			icon = 'Yamu.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 3000
			race = "Yamu(NPC)"
			state = "Normal"
			sleeptime=4
			nkispeech="<font color = red>Yamu:<font color = white> <tt>:Daichiretsuzan! </tt>"
			ncustomred=255
			ncustomgreen=255
			ncustomblue=255
		PuiPui
			powerlevel = 1470000
			maxpowerlevel = 1470000
			dead = 0
			icon = 'puipui.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			blocks=1
			npp = 0
			ssj = 0
			strength = 4000
			race = "Puipui(NPC)"
			state = "Normal"
			sleeptime=5
			nkispeech="<font color = red>PuiPui:<font color = white> <tt>:Daichiretsuzan! </tt>"
			ncustomred=255
			ncustomgreen=255
			ncustomblue=255
		Yakon
			powerlevel = 30100000
			maxpowerlevel = 35100000
			dead = 0
			icon = 'yakon.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			blocks=1
			strength = 5000
			race = "Yakon(NPC)"
			state = "Normal"
			sleeptime=5
			nkispeech="<font color = red>Yakon:<font color = white> <tt>:Dark Attack! </tt>"
			ncustomred=0
			ncustomgreen=0
			ncustomblue=0
		MajinVegeta
			powerlevel = 7000000
			maxpowerlevel = 1160000000
			dead = 0
			icon = 'VegetaMajin.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			hp=1500
			safe = 0
			npp = 0
			ssj = 0
			strength = 63000
			race = "MajinVegeta(NPC)"
			state = "Normal"
			sleeptime=4
			nkispeech="<font color = red>Majin Vegeta:<font color = white> <tt>:Big-Bang-Attack!!!! </tt>"
			ncustomred=40
			ncustomgreen=100
			ncustomblue=255
		Dabura
			powerlevel = 700000000
			maxpowerlevel = 900000000
			dead = 0
			icon = 'Dabura.dmi'
			blocks=1
			icon_state = ""
			ko = 0
			hp=1200
			safe = 0
			npp = 0
			ssj = 0
			strength = 60000
			race = "Dabura(NPC)"
			state = "Normal"
			sleeptime=4
			nkispeech="<font color = red>Dabura:<font color = white> <tt>:Honoo!!!!! </tt>"
			ncustomred=170
			ncustomgreen=0
			ncustomblue=0
		Babidi
			powerlevel = 4600000
			maxpowerlevel = 4600000
			dead = 0
			icon = 'Babidi.dmi'
			icon_state = ""
			blocks=1
			ko = 0
			safe = 0
			npp = 0
			hp=300
			ssj = 0
			strength = 3000
			race = "Babidi(NPC)"
			state = "Normal"
			sleeptime=6
			nkispeech="<font color = red>Babidi:<font color = white> <tt>:Paparappa!!</tt>"
			ncustomred=0
			ncustomgreen=0
			ncustomblue=200

		Fatbuu
			powerlevel = 900000000
			maxpowerlevel = 1800000000
			dead = 0
			icon = 'BuuMajin.dmi'
			blocks=1
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			hp=2000
			ssj = 0
			strength = 72000
			race = "Fatbuu(NPC)"
			state = "Normal"
			sleeptime=6
			nkispeech="<font color = red>Buu:<font color = white> <tt>:BUUU!!!!</tt>"
			ncustomred=255
			ncustomgreen=0
			ncustomblue=102
		Skinnybuu
			powerlevel = 1000000000
			maxpowerlevel = 2050000000
			dead = 0
			blocks=1
			icon = 'BuuEvil.dmi'
			icon_state = ""
			ko = 0
			hp=3000
			safe = 0
			npp = 0
			ssj = 0
			strength = 78000
			race = "Skinnybuu(NPC)"
			state = "Normal"
			sleeptime=6
			nkispeech="<font color = red>Buu:<font color = white> <tt>: Blaster Cannon..</tt>"
			ncustomred=130
			ncustomgreen=130
			ncustomblue=0

		Superbuu
			powerlevel = 800000000
			maxpowerlevel = 2400000000
			dead = 0
			icon = 'BuuSuper.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			hp=3200
			npp = 0
			blocks=1
			ssj = 0
			strength = 87000
			race = "Superbuu(NPC)"
			state = "Normal"
			sleeptime=3
			nkispeech="<font color = red>Buu:<font color = white> <tt>:Ki Blast!</tt>"
			ncustomred=255
			ncustomgreen=0
			ncustomblue=102
		Kidbuu
			powerlevel = 900000000
			maxpowerlevel = 9000000000
			dead = 0
			icon = 'BuuKid.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			hp=3300
			ssj = 0
			strength = 99000
			race = "Kidbuu(NPC)"
			state = "Normal"
			sleeptime=2
			blocks=1
			nkispeech="<font color = red>Buu:<font color = white> <tt>:Ki Bomb!!!!!</tt>"
			ncustomred=255
			ncustomgreen=0
			ncustomblue=102
		FatJanemba
			powerlevel = 18000000
			maxpowerlevel = 18000000
			dead = 0
			icon = 'FATJanemba.dmi'
			icon_state = ""
			ko = 0
			hp=400
			blocks=1
			safe = 0
			npp = 0
			ssj = 0
			strength = 90000
			race = "Respawnable(NPC)"
			state = "Normal"
		Janemba
			powerlevel = 25000000
			maxpowerlevel = 25000000
			dead = 0
			icon = 'Janemba.dmi'
			icon_state = ""
			ko = 0
			hp=500
			safe = 0
			blocks=1
			npp = 0
			ssj = 0
			strength = 100000
			race = "Janemba(NPC)"
			state = "Normal"
		DarknessDemon
			powerlevel = 30000000
			maxpowerlevel = 30000000
			blocks=1
			dead = 0
			icon = 'Janemba2.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 99900
			race = "Enemy(NPC)"
			state = "Normal"
		mrsatanmonster
			powerlevel = 1200
			maxpowerlevel = 12
			dead = 0
			blocks=1
			icon = 'Dragonball icons.dmi'
			icon_state = ""
			ko = 0
			safe = 0
			npp = 0
			ssj = 0
			strength = 12
			race = "Respawnable(NPC)"
			state = "Normal"

mob
	monsters
		bman
			powerlevel = 1000
			maxpowerlevel = 1000
			npc=7
			dead = 0
			sleeptime = 25
			ko = 0
			safe = 0
			hp=150
			blocks=1
			strength = 25
			sleeptime=25
			race = "Multiform"
			state = "Multiform"
			ki=2
			kispeech="<font color = red>Multiform:<font color = white> <tt>:Ki Blast!</tt>"
			ncustomred=0
			ncustomgreen=0
			ncustomblue=160
			icon='male.dmi'
mob
	other
		drbriefs
			name = "Dr. Briefs"
			npp = 1
			npc = 1
			icon = 'mobs.dmi'
			icon_state = "briefs"



obj/sense/verb
	Sense()
		set category = "Fighting"
		var/huge = 0
		var/strong = 0
		var/weak = 0
		var/ext = 0
		var/mob/M
		usr << "<b>\red Fellow Players:"
		for(M as mob in world)
			if(M.client)
				if(M.powerlevel >= 50000000)
					ext += 1
				if(M.powerlevel >= 10000 && M.powerlevel < 50000000)
					huge += 1
				if(M.powerlevel >= 1000 && M.powerlevel < 10000)
					strong += 1
				if(M.powerlevel < 1000)
					weak += 1
		spawn(3)
			usr << "<b>\cyan [huge] <font color = yellow>Huge Powers detected! [M]"
			usr << "---------------------------------------"
			usr << "<b>\cyan [strong] <font color = green>Strong Powers detected!"
			usr << "---------------------------------------"
			usr << "<b>\cyan [weak] <font color = white>Weak Powers detected!"
			if(ext >= 1)
				usr << "---------------------------------------"
				usr << "<b>\yellow [ext] <font color = yellow>Extremely Huge Powers can be detected!"

mob/sense/verb
	Sense()
		set category = "Fighting"
		var/huge = 0
		var/strong = 0
		var/weak = 0
		var/ext = 0
		var/mob/M
		usr << "<b>\red Fellow Players:"
		for(M as mob in world)
			if(M.client)
				if(M.powerlevel >= 50000000)
					ext += 1
				if(M.powerlevel >= 10000 && M.powerlevel < 50000000)
					huge += 1
				if(M.powerlevel >= 1000 && M.powerlevel < 10000)
					strong += 1
				if(M.powerlevel < 1000)
					weak += 1
		spawn(3)
			usr << "<b>\cyan [huge] <font color = yellow>Huge Powers detected! [M]"
			usr << "---------------------------------------"
			usr << "<b>\cyan [strong] <font color = green>Strong Powers detected!"
			usr << "---------------------------------------"
			usr << "<b>\cyan [weak] <font color = white>Weak Powers detected!"
			if(ext >= 1)
				usr << "---------------------------------------"
				usr << "<b>\yellow [ext] <font color = yellow>Extremely Huge Powers can be detected!"
mob
	Baba
		icon = 'UranaiBaba.dmi'
		npc=10
		verb
			Return_To_Earth()
				set name = "Return To Earth"
				set category = "Communication"
				set src in oview(1)
				if(usr.dead==0)
					usr << "<b>You may now return to earth!"
					usr.loc=locate(74,35,10)
				else
					usr.dead=0
					usr.overlays-='halo.dmi'
					usr.overlays-='halo.dmi'
					usr.overlays-='halo.dmi'
					usr.loc=locate(74,35,10)

mob/proc
	lifepointdrop()
		set background = 1
		sleep(100)
		if(src.dead==1)
			if(src.z==4||src.z==3||src.z==2||src.z==8||src.z==14||src.z==12)
				src.powerlevel+=0
			else
				src.lifepoints-=1
				if(src.lifepoints<=0&&src.dead==1)
					src.powerlevel=-100
					src.Die()
			//	src.lifepointdrop()



mob
	ElderKaoshin
		icon = 'Npcs.dmi'
		icon_state = "eldershin"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.ap>0&&usr.mystic==0&&usr.majin==0&&usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
					switch(input("Do you wish to become Mystic?.") in list ("Yes","No"))
						if("Yes")
							if(usr.ssj == 1)
								alert("You need to revert from Super Saiyan first.")
							else
								usr.verbs += /mob/Mystic/verb/MysticTransform
								usr.verbs += /mob/Mystic/verb/MysticRevert
								usr.mystic=1
			Return_to_Kaoshins_planet()
				set src in oview(1)
				set category = "Communication"
				usr.loc=locate(22,127,10)
mob
	Dende
		name = "Dende"
		icon = 'Npcs.dmi'
		icon_state = "dende"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000




mob
	Trainer
		TrunksTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Trunks2"
			name="Trunks"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 5000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/FutureTrunks/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/FutureTrunks/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		TienTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Tien"
			name="Tien"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 2000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Tien/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Tien/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		KrillinTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Krillin"
			name="Krillin"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 2000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Krillin/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Krillin/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		ChozouTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Chozou"
			name="Chozou"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 2000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1

							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Chozou/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										usr.cantitto=1
										var/mob/monsters/Chozou/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		GotenTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Goten"
			name="Goten"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 2500000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Goten/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Goten/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		PiccoloTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Piccolo"
			name="Piccolo"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 3000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Piccolo/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Piccolo/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		GohanTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Gohan"
			name="Gohan"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 5000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Gohan/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Gohan/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11


									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		YamchaTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Yamcha2"
			name="Yamcha"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 1000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Yamcha/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Yamcha/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11


									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		MutantTrainer
			icon='mutant.dmi'
			icon_state=""
			name="Mutant"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 5000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Mutant/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Mutant/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		PuttyTrainer
			icon='Putty.dmi'
			icon_state=""
			name="Putty"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 5000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/Putty/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/Putty/X=new(locate(O.x+4,O.y,O.z))
										usr<<"BLUBBLUB"
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11

									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
		KidTrunksTrainer
			icon='Dragonball Icons.dmi'
			icon_state="Trunks5"
			name="Chibi Trunks"
			npc=1
			verb
				Train()
					set category = "Training"
					set src in oview(1)
					var/howmuch = input("How much powerlevel would you like [src.name] to be at for your match") as num|null
					if(howmuch < 0)
						usr << "<b>Thats not possible."
					if(howmuch >= 1 && howmuch <= 2000000)
						if(usr.trainingcredits>0)
							usr.trainingcredits-=1
							for(var/turf/TrainerEntrance/O in world)
								if(O.name=="[src.name]-Enter")
									var/count=0
									for(var/mob/monsters/KidTrunks/M in world)
										count=1
									if(count==0)
										usr.loc=locate(O.x-4,O.y,O.z)
										usr.cantitto=1
										if(usr.powerlevel>usr.maxpowerlevel)
											usr.powerlevel=usr.maxpowerlevel
										var/mob/monsters/KidTrunks/X=new(locate(O.x+4,O.y,O.z))
										X.maxpowerlevel=howmuch
										X.powerlevel=howmuch
										X.strength=X.maxpowerlevel/11


									else
										usr<<"Sorry there is already a player training here."
						else
							usr<<"[src]: Im tired, give it a rest before training anymore."
turf
	TrainerEntrance
		TrunksEntrance
			name="Trunks-Enter"
		TienEntrance
			name="Tien-Enter"
		KrillinEntrance
			name="Krillin-Enter"
		ChozouEntrance
			name="Chozou-Enter"
		GotenEntrance
			name="Goten-Enter"
		PiccoloEntrance
			name="Piccolo-Enter"
		GohanEntrance
			name="Gohan-Enter"
		YamchaEntrance
			name="Yamcha-Enter"
		KidTrunksEntrance
			name="Chibi Trunks-Enter"
		PuttyEntrance
			name="Putty-Enter"
		MutantEntrance
			name="Mutant-Enter"

mob
	DrMyu

		name = "Dr. Myuu"
		icon = 'Npcs.dmi'
		icon_state = "myuu"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.evolution==1 && usr.race== "Tsufuru-jin" && usr.powerlevel >= 100000)
					alert("Good, now you have enough power to infest people, as soon as a player is knocked out you can infest him, if you infesta saiyajin or half saiyajin you will be able to transform even further.")
					usr.evolution=2
					usr.icon = 'bebi2.dmi'
					usr.verbs += /mob/BebiInfest/verb/Infest
					usr.verbs += /mob/BebiInfest/verb/UnInfest
				if (usr.evolution==0 && usr.race=="Tsufuru-jin")
					alert("Ah, welcome my Tsufurujin Friend.")
					alert("The Tsufurujin are not strong people, but they have brilliant minds, thanks to this machine, i can even the playing field against those Saiyajins.")
					alert("Its a one time operation, we move your conciousness into a robotic parasite.")
					switch(input("Do you want to become a robot parasite?(The same type as Bebi)", "Bebi Upgrade",text) in list ("Yes","No"))
						if("Yes")
							usr.overlays=0
							usr.hairicon=0
							usr.icon='bebi1.dmi'
							usr.evolution=1

							alert("Once you reach 100,000 powerlevel, come back here and i will help you transform from your larval stage to your parasite stage.")

mob
	Chimp
		density=0
mob
	DarknessGuard
		name = "Darkness Guard"
		icon = 'Janemba3.dmi'
		npc = 1
		powerlevel = 1000000
		maxpowerlevel = 1000000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.bannedfromdark==0)
					alert("You've been blacklisted, get out of here!")
				else
					alert("Your free to roam the planet, keep out of trouble.")

mob
	MrSatan
		name = "Mr.Satan"
		icon = 'Dragonball icons.dmi'
		icon_state = ""

		npc = 1
		powerlevel = 1
		maxpowerlevel = 1
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Heh,hows it going small fry.")
mob
	Zordon
		name = "Zordon"
		icon = 'Zordon.dmi'
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Good work power rangers, *Zordon Powers you up*")
				usr.powerlevel=usr.maxpowerlevel
				usr.stamina=100
				usr.ki=usr.maxki


mob
	Gotenks
		name = "Gotenks"
		icon = 'Dragonball icons.dmi'
		icon_state = "Gotenks"

		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Gotenks.")
				switch(input("Do you wish to follow the way of 'gotenks'?", "gotenks",text) in list ("Yes","No","Offers"))
					if("Yes")
						usr.master = "gotenks"
					if("Offers")
						alert("You can learn currently: Galactic Donut")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "gotenks")
					switch(input("Do you wish to learn the technique, 'Galactic Donut'?" , "Gotenks", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 200000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 200000)
								usr.verbs += /mob/GalacticDonut/verb/GalacticDonut
								usr.skillgalacticdonut=1
								alert("You learn Galactic Donut")
				else
					alert("You are not my student!")
mob
	Gohan
		name = "Gohan"
		icon = 'mobs.dmi'
		icon_state = "gohan"

		npc = 1
		powerlevel = 18000
		maxpowerlevel = 18000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Gohan.")
				switch(input("Do you wish to follow the way of 'Gohan'?", "Gohan",text) in list ("Yes","No","Offers"))
					if("Yes")
						usr.master = "Gohan"
					if("Offers")
						alert("You can learn currently: Masenko")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "Gohan")

					switch(input("Do you wish to learn the technique, 'Masenko'?" , "Gohan", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 25000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 25000)
								usr.verbs += /mob/Masenko/verb/Masenko
								usr.skillmasenko=1
								alert("You learn Masenko")
				else
					alert("You are not my student!")
mob
	Piccolo
		name = "Piccolo"
		icon = 'mobs.dmi'
		icon_state = "Piccolo"

		npc = 1
		powerlevel = 90000
		maxpowerlevel = 90000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Piccolo.")
				switch(input("Do you wish to follow the way of 'Piccolo'?", "Piccolo",text) in list ("Yes","No","Offers"))
					if("Yes")
						usr.master = "Piccolo"
					if("Offers")
						alert("You can learn currently: Special Beam Cannon")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "Piccolo")
					switch(input("Do you wish to learn the technique, 'SPC'?" , "Piccolo", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 25000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 25000)
								usr.verbs += /mob/SpecialBeamCannon/verb/SpecialBeamCannon
								usr.skillspecialbeamcannon=1
								alert("You learn Special Beam Cannon")

				else
					alert("You are not my student!")
mob
	Vegeta
		name = "Vegeta"
		icon = 'mobs.dmi'
		icon_state = "Vegeta"
		npc = 1
		powerlevel = 90000
		maxpowerlevel = 90000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Vegeta.")
				switch(input("Do you wish to follow the way of 'Vegeta'?", "Vegeta",text) in list ("Yes","No","Offers"))
					if("Yes")
						usr.master = "Vegeta"
					if("Offers")
						alert("You can learn currently: Final Flash,Big Bang Attack")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "Vegeta")
					switch(input("Do you wish to learn the technique, 'Final Flash'?" , "Vegeta", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 25000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 25000)
								usr.verbs += /mob/FinalFlash/verb/FinalFlash
								usr.skillfinalflash=1
								alert("You learn Final Flash")
					switch(input("Do you wish to learn the technique, 'Big Bang Attack'?" , "Vegeta", text) in list ("Yes","No"))
						if("Yes")
							if(usr.maxpowerlevel < 45000)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 45000)
								usr.verbs += /mob/BigBang/verb/BigBang
								usr.skillbigbangattack=1
								alert("You learn Big Bang")
				else
					alert("You are not my student!")


mob
	Barber
		icon = 'namek.dmi'
		npc=1
		verb
			RemoveOverlays()
				set src in oview(1)
				set category ="Communication"
				if(usr.ozz==0)
					switch(input("Do you want to loose all of your overlays (Clothing, Hair ect.)??", text) in list ("Yes","No"))
						if ("Yes")
							usr.overlays = 0
							for(var/obj/M in src.contents)
								M.worn=0
							src.weight=0
							if(usr.scar1==1)
								usr.overlays+='scar1.dmi'
							if(usr.scar2==1)
								usr.overlays+='scar2.dmi'
							if(usr.scar3==1)
								usr.overlays+='scar3.dmi'
							if(usr.scar4==1)
								usr.overlays+='eye.dmi'
							if(usr.dead==1)
								usr.overlays+='halo.dmi'
			Change_Skin_Color()
				set src in oview(1)
				set category = "Communication"
				if(usr.race=="Earth-sei-jin"||usr.race=="Saiya-jin"||usr.race=="Halfbreed"||usr.race=="Biological Android"||usr.race=="Android")
					switch(input("You want to change your skin color? What Gender do you want?",text) in list ("Male","Female","No Thanks"))
						if("Male")
							switch(input("Skin Color")in list ("White","Tan","Light Brown","Dark Brown","Black"))
								if("White")
									usr.icon = 'male-white.dmi'
									usr.skincolor="white"
								if("Tan")
									usr.icon = 'male.dmi'
									usr.skincolor="tan"
								if("Light Brown")
									usr.icon = 'male-lightbrown.dmi'
									usr.skincolor="lightbrown"
								if("Dark Brown")
									usr.icon = 'male-brown.dmi'
									usr.skincolor="darkbrown"
								if("Black")
									usr.icon = 'male-black.dmi'
									usr.skincolor="black"
						if("Female")
							switch(input("Skin Color")in list ("White","Tan","Light Brown","Dark Brown","Black"))
								if("White")
									usr.icon = 'female-pale.dmi'
									usr.skincolor="fwhite"
								if("Tan")
									usr.icon = 'female.dmi'
									usr.skincolor="ftan"
								if("Light Brown")
									usr.icon = 'female-lightbrown.dmi'
									usr.skincolor="flightbrown"
								if("Dark Brown")
									usr.icon = 'female-darkbrown.dmi'
									usr.skincolor="fdarkbrown"
								if("Black")
									usr.icon = 'female-black.dmi'
									usr.skincolor="fblack"
			Talk()
				set src in oview(1)
				set category ="Communication"
				switch(input("Do you want to get your Hair Cut?", text) in list ("Yes","No"))

					if ("Yes")
						usr.overlays-=usr.hairicon
						usr.overlays-=usr.hairicon2
						usr.overlays-=usr.hairicon
						usr.overlays-=usr.hairicon2
						usr.overlays-=usr.hairicon
						usr.overlays-=usr.hairicon2
						usr.overlays-='black_mustache.dmi'
						usr.overlays-='black_goatee.dmi'
						usr.overlays-='black_goat.dmi'
						switch(input("What hair style do you want?", "Customization", text) in list ("Long","Spikey","Short","Goku","Vegeta","VegetaGT","Gohan","Spikey Long","Trunks","Future Trunks","Long(Female)","Goten","Large Hair","Punk","Yajirobe","Bald"))


							if("Long(Female)")
								usr.hair = "Female"
								var/hairover = 'fem-hair-long.dmi'
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Bald")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Bald"
								usr.hairicon=0

							if("Trunks")


								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Trunks"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_trunks.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Goten")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "goten"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_goten.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Large Hair")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "kros_long"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_kros_long.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon

							if("Punk")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "punk"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_punk.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon

							if("Radditz")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "radditz"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_radditz.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Yajirobe")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "yajirobe"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_yajirobe.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Future Trunks")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Future Trunks"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'Futuretrunkshair.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Spikey")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Spikey"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_spikeyshort.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Short")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Short"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_short.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Gohan")

								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Gohan"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_Gohan.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Spikey Long")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Spikey Long"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_spikey.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon

							if("Long")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "long"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_long.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("VegetaGT")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "VegetaGT"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_vegetagt.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon

							if("Vegeta")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Vegeta"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_vegeta.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
							if("Goku")
								switch(input("What kind of facial hair do you want?", "Customization", text) in list ("None","Goatee","Goat", "Mustache"))
									if("None")
										..()
									if("Goatee")
										usr.overlays += 'black_goatee.dmi'
										..()
									if("Goat")
										usr.overlays += 'black_goat.dmi'
										..()
									if("Mustache")
										usr.overlays += 'black_mustache.dmi'
										..()
								usr.hair = "Goku"
								var/hairred = input("How much red do you want to put into your hair?") as num
								var/hairblue = input("How much blue do you want to put into your hair?") as num
								var/hairgreen = input("How much green do you want to put into your hair?") as num
								var/hairover = 'hair_dan_goku.dmi'
								hairover += rgb(hairred,hairgreen,hairblue)
								usr.rhair = hairred
								usr.ghair = hairgreen
								usr.bhair = hairblue
								usr.hairicon=hairover
								usr.overlays += usr.hairicon
/*
mob
	proc
		dodgedense()
			if(usr.dodgedense=0)
				if(turf.density=0)

			else if(usr.dodgedense=1 && /turf/ZVoid)
				(/turf/)
					density=1
			return
*/


mob
	ZSword
		npc=1
		icon = 'Zsword.dmi'
		verb
			Pull()
				set src in oview(1)
				set category = "Pull"
				if(usr.powerlevel>=2500000)
					usr<< "You pulled the sword out. It is incredilby heavy. Apon taking it out a strange old Kai is released."

					usr.loc=locate(9,113,3)
					if(usr.gotzsword==0)
						usr.contents += new /obj/Sword1
						usr<<"You got the Z-Sword!!"
						usr.gotzsword=1
				else
					usr<< "Your not strong enough"


mob
	helperone
		icon = 'mobs.dmi'
		npc=10
		icon_state = "helper one"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Welcome to Dragonball Gekisen! Continue Forward, and talk to all of the helpers.")


mob
	gohan
		icon = 'mobs.dmi'
		icon_state = "gohan"
		npc=1
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Sup kid. How u livin?")
mob
	videl
		icon = 'mobs.dmi'
		icon_state = "videl"
		npc=1
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Hey hows it going?")
				switch(input("Do you want to change your aura color?.", "Videl", text) in list ("Yes", "No"))
					if ("Yes")
						usr.underlays -= /obj/whiteaura
						usr.aura = 1
						var/cred = input("How much red do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						var/cgreen = input("How much green do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						var/cblue = input("How much blue do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						usr.customred = cred
						usr.customgreen = cgreen
						usr.customblue = cblue
						switch(input("What aura type do you want?", "Aura", text) in list ("Default","Spikey","Fountain","Erratic","Android"))

							if("Default")
								usr.auratype=0
							if("Spikey")
								usr.auratype=1
							if("Fountain")
								usr.auratype=2
							if("Erratic")
								usr.auratype=3
							if("Android")
								usr.auratype=4
mob
	helpertwo
		icon = 'mobs.dmi'
		icon_state = "helper two"
		npc=10
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Welcome to Dragonball Gekisen!")
				if(usr.gave == null)
					usr << "[src] gives you 500 zenni."
					usr.zenni += 500
					usr.gave = 1
				if(usr.gave == 1)
					usr.powerlevel += 0
obj
	DarknessControlls
		icon = '0Controlls2.dmi'
		verb
			Blacklist_Player(mob/characters/M in world)
				set category = "Darkness"
				set src in oview(1)
				if(usr.key=="Masterdan"||usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
					if(M.key=="Masterdan"||M.guild == "Darkness"||M.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
						usr<<"They are part of Darkness and must be removed before blacklisting."
					else
						M.bannedfromdark=1
						M<<"You've been Blacklisted from Planet Darkness"
				else
					usr<<"You dont have the rights to do that."
			UnBlacklist_Player(mob/characters/M in world)
				set category = "Darkness"
				set src in oview(1)
				if(usr.key=="Masterdan"||usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>")
					M.bannedfromdark=0
					M<<"You've been granted permission to go to Planet Dark"
				else
					usr<<"You dont have the rights to do that."
mob
	Controlls
		npc=1
		icon = '0Controlls.dmi'
		verb
			Pilot_Spacepod()
				set src in oview(1)
				set category = "Travel"
				usr.contents+= new /obj/Spacepod
				usr.overlays+='ccpod.dmi'
				usr.density=1
				if(usr.lastplanet=="Namek")
					usr.loc=locate(21,71,17)
				if(usr.lastplanet=="Earth")
					usr.loc=locate(89,9,17)
				if(usr.lastplanet=="Dark")
					usr.loc=locate(172,4,17)
				if(usr.lastplanet=="Pod")
					usr.loc=locate(usr.podloc:x,usr.podloc:y,usr.podloc:z)
			Set_Destination()
				set src in oview(1)
				set category = "Travel"
				var/Namek = "Namek"
				var/Earth = "Earth"
				var/Dark = "Dark"
				var/Cancel = "Cancel"
				var/list/menu = new()
				menu += Cancel
				menu += Earth
				menu += Dark
				menu += Namek

				var/result = input("Choose a Destination", "Space Pod") in menu
				if (result == Namek)
					if(findText("[usr.planetknown]","Namek")>=1)
						alert("You will arive on namek soon, please enjoy the ride.(If you choose a new destination the flight will start over)")
						sleep(500)
						if(usr.z==3)
							usr.lastplanet="Namek"
							usr.loc=locate(76,82,5)
							for(var/obj/X in usr.contents)
								if(X.name=="Spacepod")
									del(X)
					else
						usr<<"You dont know where Namek is."
				if (result == Earth)
					alert("You will arive on Earth soon, please enjoy the ride.(If you choose a new destination the flight will start over)")
					sleep(500)
					if(usr.z==3)
						usr.lastplanet="Earth"
						if(usr.timeperiod==0)
							usr.loc=locate(131,270,22)
						if(usr.timeperiod==1)
							usr.loc=locate(197,102,13)
						usr.overlays-='ccpod.dmi'
						for(var/obj/X in usr.contents)
							if(X.name=="Spacepod")
								del(X)
				if (result == Dark)
					if(findText("[usr.planetknown]","Dark")>=1)
						alert("You will arive on Planet Dark soon, please enjoy the ride.(If you choose a new destination the flight will start over)")
						sleep(800)
						if(usr.z==3)
							usr.lastplanet="Dark"
							usr.loc=locate(60,58,19)
							for(var/obj/X in usr.contents)
								if(X.name=="Spacepod")
									del(X)
				if (result == Cancel)
					usr.powerlevel+=0
mob
	CCPod
		icon='CCPodx.dmi'
		npc=1
		density=1
		layer=99
		verb
			Enter_SpacePod()
				set src in oview(1)
				set category = "Travel"
				if(usr.z==1)
					usr.lastplanet="Earth"
				if(usr.z==5)
					usr.lastplanet="Namek"
				usr.loc=locate(109,18,3)
				if(findText("[usr.planetknown]","Earth")==1)
					usr.powerlevel+=0
				else
					usr.planetknown+="Earth "
obj
	Spacepod
		icon = 'raditzsagaturfs.dmi'
		icon_state = "pod"
		layer=49
		verb
			Set_Autopilot()
				set category = "Travel"
				usr.overlays-='ccpod.dmi'
				usr.podloc=locate(usr.loc:x,usr.loc:y,usr.loc:z)
				usr.loc=locate(109,21,3)
				usr.lastplanet="Pod"
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
				del(src)
mob
	SpacePod

		icon = 'raditzsagaturfs.dmi'
		icon_state = "pod"
		npc=1
		verb
			Enter_SpacePod()
				set src in oview(1)
				set category = "Travel"
				if(usr.z==1)
					usr.lastplanet="Earth"
				if(usr.z==5)
					usr.lastplanet="Namek"
				usr.loc=locate(109,18,3)
				if(findText("[usr.planetknown]","Earth")==1)
					usr.powerlevel+=0
				else
					usr.planetknown+="Earth "



mob
	helperthree
		name = "Sensei"
		npc=10
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.ntalk==0)
					alert ("Hello [usr], your power has increased so much since you started training here, you are on the road to becoming a great martial arts master like myself.")

				switch(input("What do you want?", "Sensei",text) in list ("I'm done training here","Nevermind"))
					if("I'm done training here")
						if(usr.maxpowerlevel>=100 && usr.maxpowerlevel<400)
							alert("Well, you've gotten pretty strong, but still have much work ahead of yourself. Goodluck [usr].")
						if(usr.maxpowerlevel>=400 && usr.maxpowerlevel<1000)
							alert("Very well, you are one of my best students, you have great potential. Goodluck [usr].")
						if(usr.maxpowerlevel>=1000 && usr.maxpowerlevel<5000)
							alert("Ah, well you are my most prized student, and there is little left i can do for you. Goodluck [usr].")
						if(usr.maxpowerlevel>=5000)
							alert("Very well, you have surpassed even me [usr] and in such a small time. Goodluck [usr].")
						usr.ntalk = 1
						usr.chose = 1
						usr.npp = 0
						usr.move = 1
						usr.icon_state = ""
						usr.resting= 0
						usr.loc=locate(74,35,10)
/*
mob
	helperfour
		name = "Sensei"
		npc=10
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.ntalk==0)
					alert ("Hello [usr], your power has increased so much since you started training here, you are on the road to becoming a great martial arts master like myself.")

				switch(input("What do you want?", "Sensei",text) in list ("I'm done training here","Nevermind"))
					if("I'm done training here")
						if(usr.maxpowerlevel>=100 && usr.maxpowerleve<400)
							alert("Well, you've gotten pretty strong, but still have much work ahead of yourself. Goodluck [usr].")
						if(usr.maxpowerlevel>=400 && usr.maxpowerlevel<1000)
							alert("Very well, you are one of my best students, you have great potential. Goodluck [usr].")
						if(usr.maxpowerlevel>=1000 && usr.maxpowerlevel<5000)
							alert("Ah, well you are my most prized student, and there is little left i can do for you. Goodluck [usr].")
						if(usr.maxpowerlevel>=5000)
							alert("Very well, you have surpassed even me [usr] and in such a small time. Goodluck [usr].")
						usr.ntalk = 1
						usr.chose = 1
						usr.npp = 0
						usr.move = 1
						usr.icon_state = ""
						usr.resting= 0
						usr.loc=locate(74,35,10)

mob
	helperfive
		name = "Sensei"
		npc=10
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.ntalk==0)
					alert ("Hello [usr], your power has increased so much since you started training here, you are on the road to becoming a great martial arts master like myself.")

				switch(input("What do you want?", "Sensei",text) in list ("I'm done training here","Nevermind"))
					if("I'm done training here")
						if(usr.maxpowerlevel>=100 && usr.maxpowerleve<400)
							alert("Well, you've gotten pretty strong, but still have much work ahead of yourself. Goodluck [usr].")
						if(usr.maxpowerlevel>=400 && usr.maxpowerlevel<1000)
							alert("Very well, you are one of my best students, you have great potential. Goodluck [usr].")
						if(usr.maxpowerlevel>=1000 && usr.maxpowerlevel<5000)
							alert("Ah, well you are my most prized student, and there is little left i can do for you. Goodluck [usr].")
						if(usr.maxpowerlevel>=5000)
							alert("Very well, you have surpassed even me [usr] and in such a small time. Goodluck [usr].")
						usr.ntalk = 1
						usr.chose = 1
						usr.npp = 0
						usr.move = 1
						usr.icon_state = ""
						usr.resting= 0
						usr.loc=locate(74,35,10)

mob
	helpersix
		name = "Sensei"
		npc=10
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(usr.ntalk==0)
					alert ("Hello [usr], your power has increased so much since you started training here, you are on the road to becoming a great martial arts master like myself.")

				switch(input("What do you want?", "Sensei",text) in list ("I'm done training here","Nevermind"))
					if("I'm done training here")
						if(usr.maxpowerlevel>=100 && usr.maxpowerleve<400)
							alert("Well, you've gotten pretty strong, but still have much work ahead of yourself. Goodluck [usr].")
						if(usr.maxpowerlevel>=400 && usr.maxpowerlevel<1000)
							alert("Very well, you are one of my best students, you have great potential. Goodluck [usr].")
						if(usr.maxpowerlevel>=1000 && usr.maxpowerlevel<5000)
							alert("Ah, well you are my most prized student, and there is little left i can do for you. Goodluck [usr].")
						if(usr.maxpowerlevel>=5000)
							alert("Very well, you have surpassed even me [usr] and in such a small time. Goodluck [usr].")
						usr.ntalk = 1
						usr.chose = 1
						usr.npp = 0
						usr.move = 1
						usr.icon_state = ""
						usr.resting= 0
						usr.loc=locate(74,35,10)
*/

mob
	kaioshin
		icon = 'mobs.dmi'
		icon_state = "kaioshin"
		name = "Kaio-shin"
		npc=1
		verb
			Return_To_Kaios()
				set name = "Return to Kaio's Planet"
				set category = "Training"
				set src in oview(1)
				usr.loc=locate(95,117,2)


			Learn()
				set name = "Learn"
				set category = "Training"
				set src in oview(1)
				switch(input("Do you wish to learn Fusion Dance?'?", "Shin",text) in list ("Yes","No"))
					if("Yes")
						if(usr.maxpowerlevel>=2000000)
							if (usr.fusionlearn==0)
								usr<<"You learn the Fusion dance!"
								usr.fusionlearn=1
								usr.verbs += /mob/FusionDance/verb/Fuse
							else
								usr<<"You already know it"
						else
							usr<<"You aren't strong enough(2,000,000pl req)"
mob
	other
		deathtrainer
			name = "Babidi"
			icon = 'Dragonball Icons.dmi'
			icon_state = "babidi"
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					if(usr.ap<0&&usr.majin==0&&usr.mystic==0&&usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
						switch(input("Do you wish to become Majin?.") in list ("Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel>=2500000)
									usr.verbs += /mob/Majin/verb/MajinTransform
									usr.verbs += /mob/Majin/verb/MajinRevert
									usr.majin=1
								else
									alert(usr,"Get out of here you weakling! Only the truly powerfull are worthy of my powers")
mob
	bubb
		x
			name = "X"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "x"

	bubb
		spike
			name = "Spike"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "spike"

mob
	bubb
		x2
			name = "X"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "x2"

	bubb
		spike2
			name = "Spike"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "spike2"
	bubb
		verb
			GM_Help_Area()
				set category = "GM Helpdesk"
				set src in oview(1)
				if(usr.gmhelparea==0)
					usr.loc=locate(123,104,3)
					usr.gmhelparea=1
				else if(usr.gmhelparea==1)
					usr.loc=locate(200,194,1)
					usr.gmhelparea=0

obj
	Kiblast
		icon = 'kame7.dmi'
		icon_state = ""
		density = 0
		npc=4
		pixel_step_size=8

mob
	proc
		StaminaGain()
			usr.stamina += rand(1,3)
			sleep(20)
			usr.StaminaGain()
			if(usr.stamina==100)
				return
			if(usr.stamina>100)
				usr.StaminaStop()
				usr.stamina=100
				return

		StaminaStop()
			if(usr.stamina==100)
				return
			if(usr.stamina>100)
				usr.stamina=100

		DamageRecovery()
			var/hprest=(usr.hp / 12)/3
			usr.hp+= hprest
			sleep(20)
			usr.DamageRecovery()
			if(usr.hp<=0)
				return
			if(usr.hp<0)
				usr.DamageStop()
				usr.hp=0

		DamageStop()
			if(usr.hp<=0)
				return
			if(usr.hp<0)
				usr.hp=0
