var
	curworldvsn = 22
	char_v_required = 21
	PermShutdownV = 0
	servcaplimit = 0
	servrules
	next_plid = 1
	tmp
		playercount = 0
		seckeylist[]
		mob
			players[0]
mob/var/tmp
	deadchecking
	noname
	hpwr=1
	title
	nospawn
	ssjaura
	maura
	ssjaur
	aaura
	throwpowerlevel
	expkn
	expkk
	used
	fuse
	fused
	oldloc
	oicon
	image/name_img[]
	bonuspoint
mob/var
	ekillalert
	phpwr = 0
obj/var
	bu
	worn
	used
obj/techs/var/tmp
	image/name_img[]

turf
	var
		nozanzone
		unblowable

atom/var/tmp
	ogm = 0
	oenf = 0
mob
	var
		icon
			lefficons[]
			mystlefficons[]
		stat
			ki = new(50)
			powerlevel = new(25)
			stamina = new(100)
			focus = new(1000)
		obj/techs/skills[0]
		obj/items/worn[0]
		fame = 0
		show_name = 1
		lightning
		plid
		charversion = 0
		chatsl = 0
		scouterchannel
		mutetime
		eruse
		dheal
		usebl
		gokuwg
		deathtrans
		swearb
		hideipan
		snakeway = 0
		move
		armored = 0
		armordmg = 0
		healing
		auratoggle
		zennied = 0
		restime
		cellq
		charges = 0
		baby = 0
		babychange = 0
		chq
		canthrow = 0
		ap = 0
		blast
		ssjfp = 0
		profile
		blastdmg = 0
		beamdmg = 0
		kamestudent = 0
		projectile
		projdmg
		musicon = 1
		rest = 0
		attackdelay = 5
		attacking = 0
		shield = 0
		mquest = 0
		oname
		coder
		yemma
		entime
		blocking = 0
		thrown = 0
		save = 1
		magazine
		tayio
		hometown = ""
		gm
		ptime
		mon = 0
		spacep
		spout
		swoop = 0
		customauracolor = "#FFFFFF"
		customskincolor
		customhaircolor
		aura
		follow
		poratta
		training
		asking
		absorb
		kame = 0
		tech = 0
		fuselearn
		medtime
		angered
		npc
		befriend
		immortal = 0
		gonessj
		counter
		ssj
		unlock
		tapion
		rage
		ased
		timem = 0
		heal
		state
		race
		spoken = 0
		mute = 0
		npp
		zenni
		kaioken
		prefix
		powered
		ko
		kiin
		kiloc
		dead
		w_edbuse = 0
		w_power = 0
		w_ki = 0
		w_ssj = 0
		nw_power = 0
		nw_ki = 0
		nw_ssj = 0
		nw_ndbuse = 0
		focustech
		focustechlearn
		focused
		attribute
		master
		grav
		combo
		kitechlearn
		auratechlearn
		kicolorlearn
		focuslearn
		kaiolearn
		spiritlearn
		itlearn
		landyard = 0
		hair
		Master
		majin = 0
		random
		meditate = 0
		flight = 0
		flightlearn
		absorbed
		namekheal
		regen
		skin = ""
		kills = 0
		deaths = 0
		bubblestart
		bubblesdone = 0
		agreed = 0
		majined = 0
		majinmaster
		shapeshifted = 0
		destset
		landnamek
		landearth
		upgrade
		spirit = 0
		gotnimbus = 0
		gotnimbus1 = 0
		gotnimbus2 = 0
		yemmafruit = 0
		gozhelp = 0
		fuseavail = 0
		mezleave1 = 0
		account = 0
		bzenni = 10000
		kaitrain = 0
		kaistart = 0
		kaifinish = 0
		splitformed = 0
		splitformpl = 0
		splitnpc
		majined2 = 0
		fusename
		switched = 0
		lssj = 0
		field = 0
		boulder = 0
		plough = 0
		bubbcaught = 0
		gregcaught = 0
		zanzoken = 0
		tail = 0
		ktrain = 0
		sbcharge = 0
		summondrag = 0
		enf = 0
		tq2 = 0
		auto=0
		giji = 0
		tq1 = 0
		bmajined = 0
		oozaru = 0
		train = 0
		blueprints = 0
		absorbexp = 0
		radarOn = 0
		frozen = 0
		dspecial = 0
		pullzsword = 0
		vegetatrain = 0
		styles/currentStyle
		hx
		hy
		hz
		lspecial = 0
		chat = 1
		oozrev = 0
		weight = 0
		itinvis = 0
		wspecial = 0
		squest = 0
		eggs = 0
		especial = 0
		nfuse = 0
		strain = 0
		sfinish = 0
		landveg = 0
		timeearth = 0
		timetrunks = 0
		transforming
		throwc
		hbtcuse
		skuse
		ssjfpt
		kabsorbt
		throwed
		throwedb
		ccuse
		nstartmsg
		nstartmus
		killalert
		gmenfalert
		wizspell
		wkpt
		gkpt
		flamet
		kaiokuse
		channel
		npctalk
		mystt
		majinc
		saibaseedt
		mechquest1
		New_Tech
		tau
		lqt
		sdt
		saiyawq
		sma
		useb
		smwa
		ndbqd
		ndbqn
		scaninvis
		msq
		babylearn
		mystlearn
		changlearn
		earthlearn
		nameklearn
		buuhumanlearn
		tmp/oouse
		macroq
		brollievent
		GF
		spy
		majining
		mystlearning
		nquest
		liquifyout
		auraquest
		currentStylen
		newb
		hbq
		abt
		abl
		seckey
		ffcht
		kiabc
		spt
		hour
		min

		semi=0
		perfect=0

		rad_dead
		gohansaved=0
		talkchi=0
		taodead=0
		tientrain

		quest1
		chi_chi
		goku1=0
		powerup
		shot
		celltrans=0

		skexp=0
		maxskexp=100
		skpts=300

		kikn=0
		ki_imp=0
		kicntrl=0
		kicombt=0
		kiultra=0

obj
	var/tmp
		rx
		ry
		rz
		rz1
		inu
var
	edbtime
	ndbtime
	frooz = null
	frgssj = null
	frssj1 = null
	frssjfp = null
	frssju = null
	frssj2 = null
	frssj3 = null
	frcf1 = null
	frcf2 = null
	frcf3 = null
	frcf4 = null
	frcf4fp = null
	frcf5 = null
	frcm = null
	frns = null
	frcsp = null
	frcp = null
	frcpw = null
	frcsup = null
	frhs = null
	frbf = null
	frbs = null
	frbsgt = null
	frbsgh = null
	frreincarnation = null
	frmyst = null
	frelssj = null
	gmcaptured
	ucaptured