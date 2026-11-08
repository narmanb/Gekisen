mob/var/tmp/loggedin=0
mob/PC/Login()
//	alert("1")
	player += src
//	alert("2")
	spawn(0)src.CheckBan()
	sleep(5)
//	alert("3")
	world.AutoUnbanTimer()
	spawn(1)src.LoginLog()
	var/icount = 0
	for(var/obj/Equipment/E in src)
		icount ++

	for(var/obj/Gym/G in src)
		icount ++
//	for(var/obj/Props/Furnature/GF in src)
//		icount ++
	if(icount>src.inven_max)
		src<<"You have more items in your inventory than the allowed ammount. Take this into attention or you will lose your save file."
//	alert("4")
	spawn(10)src.AdminLoad()
//	alert("5")
	src.PrefixCheck()
//	alert("6")

//	src.CreateName()

	//new/obj/Hud_0(src.client)


	spawn() winset(src, "default", "macro = macro1");
	spawn(20)src.client.AutoSave()
	players++
//	alert("7")
	spawn(50)BudokaiMasterCheck()
	spawn(1)src.DBDelete()
	src.icon_state = ""
	src.sight &= ~BLIND
	src.density=1
	src.sleeping=0
	src.loggedin=1
	src.overlays-='Music Box.dmi'
	src.overlays-=icon('Techs.dmi',"whirlwindspin")
	src.overlays-=icon('Techs.dmi',"distructodisko")
	src.overlays-=icon('Techs.dmi',"kienzandisko")
	src.overlays-=icon('Techs.dmi',"spiritballo")
	src.overlays-=icon('Techs.dmi',"imprisonmentball")
	src.overlays-=icon('Techs.dmi',"demonshackle")
	src.overlays-=icon('Techs.dmi',"fatwrap")
	src.overlays-=icon('Techs.dmi',"galaticdonut")
	src.overlays-=icon('Techs.dmi',"kamehamehaki")
	src.overlays-=icon('Techs.dmi',"kamehameha10ki")
	src.overlays-=icon('Techs.dmi',"finishbusterki")
	src.overlays-=icon('Techs.dmi',"galickgunki")
	src.overlays-=icon('Techs.dmi',"finalflashki")
	src.overlays-=icon('Techs.dmi',"finalshineki")
	src.overlays-=icon('Techs.dmi',"masenkoki")
	src.overlays-=icon('Techs.dmi',"hellblazeki")
	src.overlays-=icon('Techs.dmi',"tribeamki")
	src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
	src.overlays-=icon('Techs.dmi',"fakemoono")
	src.overlays-='Charge Black.dmi'
	src.overlays-='Charge White.dmi'
	src.overlays-='Charge Blue.dmi'
	src.overlays-='Charge Yellow.dmi'
	src.overlays-='Charge Red.dmi'
	src.overlays-='Charge Orange.dmi'
	src.overlays-='Charge Green.dmi'
	src.overlays-='Charge Pink.dmi'
	src.overlays-='Spirit Bomb.dmi'
	src.overlays-='Death Ball.dmi'
	src.overlays-='Super Nova.dmi'
	src.overlays-='newkishield.dmi'
	src.overlays -= 'sonicspinauradash.dmi'


	src.overlays -= 'Power Elec.dmi'
	src.overlays -= 'Elec Blue Small.dmi'
	src.overlays -= 'Elec Blue Small.dmi'
	src.overlays -= 'Elec Blue Small.dmi'
	src.underlays -= src.underlays
	src.underlays -= src.underlays
	src.overlays -= src.aura


	src.overlays -= new/obj/techs/small_spirit_bomb
	src.overlays -= new/obj/techs/small_death_ball
	src.underlays -= src.underlays
//	src.verbs += typesof(/mob/Member/verb/)
	src.overlays -= src.aura
	src.overlays -= src.auraset

	winshow(src,"hudmap",0)
	//src.overlays -= kaioaura
	//src.overlays -= 'KaiokenNewAura.dmi'
	//src.overlays -= icon(src.auraset)
	src.overlays -= 'Full Aura.dmi'
	src.overlays -= 'defaultauraBlack.dmi'
	src.overlays -= 'defaultauraRed.dmi'
	src.add_exp = src.level
//	alert("8")
	if(!src.HasCreated)
	//	src << "You logged out without setting up your character"
//		if(src.rebirths>0)
//			src.BuildCharRebirth()
//		else
		src.BuildChar()

	spawn(1)
		if(src.GMLevel > 2)
			switch(alert("Do you wish to Announce your arrival to the World?","Welcome to DragonBall: Ruination","Yes","No"))
				if("Yes")
					player << "<font color = #66CCCC>Server Information: <font color = white>[src.name] ([src.key]) the [src.gene] [src.race] has joined the server.</font>"
		else
			player << "<font color = #66CCCC>Server Information: <font color = white>[src.name] ([src.key]) the [src.gene] [src.race] has joined the server.</font>"
	spawn(1)src.CHECK()
//	spawn(20)src.Find_Mobs_In_View()
	..()
mob
	var
		tail_grow_delay=30
		Sub = 0
	proc
		CHECK()
			spawn(10)world.UpdatePlayers()
			src << "<a href=https://discord.gg/JyV62CnTJv>Join Ruinations Discord!</a> https://discord.gg/h2XMRAW"
			src << "<b><font color = green>This game is hosted on a shell server, if you would like to support this game please <A HREF=https://www.paypal.me/CaillanSummerhayes?locale.x=en_AU>click here</A> All donations go toward the server costs."

			//src.move_delay = 1
			if(src.powerlevel<=0)
				src.powerlevel=50
			if(src.ki<=0)
				src.ki=50
			if(src.enraged)
				src.enraged=0
				src.Power_Redefine()
			if(src.trans_delay)
				src.trans_delay = 0
			if(src.smallshard)
				if(!src.smallshardp)
					src.smallshard = 0
			if(src.largeshard)
				if(!src.largeshardp)
					src.largeshard = 0
			if(src.greatshard)
				if(!src.greatshardp)
					src.greatshard = 0
			if(src.massshard)
				if(!massshardp)
					src.massshard = 0
			if(src.smallshards)
				if(!smallshardsp)
					src.smallshards = 0
			if(src.largeshards)
				if(!src.largeshardsp)
					src.largeshards = 0
			if(src.greatshards)
				if(!src.greatshardsp)
					src.greatshards = 0
			if(src.massshards)
				if(!src.massshardsp)
					src.massshards = 0
			if(src.smallshardz)
				if(!smallshardzp)
					src.smallshardz = 0
			if(src.largeshardz)
				if(!src.largeshardzp)
					src.largeshardz = 0
			if(src.greatshardz)
				if(!src.greatshardzp)
					src.greatshardz = 0
			if(src.massshardz)
				if(!src.massshardzp)
					src.massshardz = 0
			if(src.KO)
				src.powerlevel = 50
				src.KO = 0
				src.frozen = 0
	//		if(usr.powerlevel >= ((usr.ki_control * usr.powerlevel_max)/100) && usr.ki >= ((usr.ki_control * usr.ki_max)/100))
	//			spawn(100)usr.Slow_Power_Down()

			src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
			src.ki = round((src.ki_control * src.ki_max)/100)
			src.kidefense = round((src.ki_control * src.kidefense_max)/100)
			src.strength = round((src.ki_control * src.strength_max)/100)
			src.defence = round((src.ki_control * src.defence_max)/100)
			src.speed = round((src.ki_control * src.speed_max)/100)

	//		if(src.hudenabled)
				//winshow(src,"hudmap",1)
			winshow(src,"hudmap",1)
			spawn()
				new/obj/hudMeters/health_01(src.client)
				new/obj/hudMeters/health_02(src.client)
				new/obj/hudMeters/health_03(src.client)
				new/obj/hudMeters/health_04(src.client)

				new/obj/kimeters/ki_01(src.client)
				new/obj/kimeters/ki_02(src.client)
				new/obj/kimeters/ki_03(src.client)
				new/obj/kimeters/ki_04(src.client)
/*
				new/obj/expmeters/exp_01(src.client)
				new/obj/expmeters/exp_02(src.client)
				new/obj/expmeters/exp_03(src.client)
				new/obj/expmeters/exp_04(src.client)*/

			var/image1=icon('HUDdb.dmi')
			winset(src, "labelDB", "image = \ref[fcopy_rsc(image1)]")
			spawn()
				if(src.hudenabled)
					src.updateHealth()
					src.updateki()
					src.updateexp()


			if(src.kaioken)
				spawn(10)src.Kaio_Strain()
			if(src.race=="Bio Android"||src.race=="Changeling"||src.race=="Demon"||src.race=="Half Saiyan"||src.race=="Human"||src.race=="Kai"||src.race=="Saiyan"||src.race=="Tuffle")
				spawn(30)src.Trans_Gain()
			if(src.race=="Kai"||src.gene=="Kamenian")
				spawn(40)src.GravityFieldCooldown()
				spawn(5)src.BuffCooldown1()
				spawn(10)src.BuffCooldown2()
				spawn(15)src.BuffCooldown3()
				spawn(20)src.BuffCooldown4()
				spawn(25)src.BuffCooldown5()
				spawn(30)src.BuffCooldown6()
			if(src.race=="Majin Wizard")
				spawn(10) src.Manipulation_Cooldown()
				spawn(20) src.BuffCooldown6()
			if(src.fullness>0)
				src.Hunger()
			spawn(1)
				src.CheckGuildVerbs()
				Budokai_Check()

			if(src.key=="kedgegaming")
				if(!src.learn_karmabomb)
					src << "<center><font color = white> .:: You learn Negative Karma Bomb  ::.</font></center></center>"
					src.contents += new/obj/Technique/KarmaBomb
					src.learn_karmabomb = 1
				if(!src.learn_damagefield)
					src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
					src.contents += new/obj/Technique/DamageField
					src.learn_damagefield=1
				if(!src.learn_healfield)
					src << "<center><font color = white> .:: You learn Heal Field  ::.</font></center></center>"
					src.contents += new/obj/Technique/HealField
					src.learn_healfield=1
				if(!src.learn_slowfield)
					src << "<center><font color = white> .:: You learn Slow Field  ::.</font></center></center>"
					src.contents += new/obj/Technique/SlowField
					src.learn_slowfield=1

			//spawn(10)
			//	if(src.legendarysword)
			//		src.overlays-='Legendary Sword.dmi'
			//		src.legendarysword=0
			//		src.strength=src.strength_max
			//		for(var/obj/Technique/Sword_Slash/S in src.contents)
			//			del(S)
			//		for(var/obj/Equipment/LegendarySword/L in src.contents)
			//			L.suffix=null
			//		src.speed=src.speed_max
				//src.HBTC_Countdown()
			spawn(2)
				if(src.buff1||src.buff2||src.buff3||src.buff4)
					src.buff1=0
					src.buff2=0
					src.buff3=0
					src.buff4=0
					src.Power_Redefine()
				src.Tail_Grow()
			spawn(5)
				src.party_name=src.name
				src.in_party = 0
			if(src.in_war)
				src.in_war=0
				src.loc=locate(410,260,7)
				src.it_lock=0
				src.it_blocked=0
			if(src.challenge)
				src.loc=locate(410,260,7)
				src.it_lock=0
				src.it_blocked=0
				src.arena_lose++
			if(src.in_tourney)
				src.loc=locate(410,260,7)
				src.it_lock=0
				src.it_blocked=0
				src.in_tourney=0
		//	if(src.in_hbtc==0)
		//		src.verbs-=new/mob/PC/verb/HBTC_Timer_Check()
		//	else
		//		src.verbs+=new/mob/PC/verb/HBTC_Timer_Check()
			usr.talking=0
			usr.opendialog=0
			usr.strain=0
			usr.ftrain=0
			usr.dtrain=0
			usr.mtrain=0
			animate(usr, color = null, alpha = 255)
			usr.powered=0
			if(usr.pickingtrans && usr.transformed)
				usr.transformed = 0
				usr.pickingtrans = 0
				usr << "logged in trans menu"

		//	if(usr.pickingtrans && usr.invertmenu)
		//		usr.invertmenu = 0
			usr.pickingtrans = 0


		//	if(!usr.transformed&&!usr.inverted)
		//		usr.pickingtrans=0
		//		usr.inverted=0
			//if(src.UI)src.SaiyanRevert()src.UI=0
		//	if(src.in_hbtc)
		//		src.it_blocked=1
		//		src.it_lock=0
			if(usr.selfdestructwait)
				usr.LOGGEDSD()
			if(src.z == 8)
				src.loc=locate(51,450,1)
				src << "You logged out in an exploding mob zone, and have been moved outside"
/*			spawn(15)
				if(night)
					if(src.race=="Saiyan"||src.race=="Half Saiyan")
						if(src.level<75)
							src.OozaruTrans()
				if(!night)
					if(src.race=="Saiyan"||src.race=="Half Saiyan")
						if(src.Oozaru)
							src.Forced_Oozaru_Revert()*/
	//		spawn(40)
	//			for(var/obj/Technique/CustomAttack/A in src)
	//				del(A)
			//	src.contents+=new/obj/Technique/CustomAttack
			//	if(src.race=="Android"||/*src.gonemetal||*/src.ki_control>=99)
			//		spawn(5)src.RegenerateA()
	//		for(var/obj/Props/Furnature/FUR in src)
	//			if(!FUR.invenable)
	//				del(FUR)
	//		for(var/obj/Gym/GY in src)
	//			if(!GY.invenable)
	//				del(GY)
	proc
		Tail_Grow()
			if(src.race=="Saiyan")
				if(!src.has_tail)
					if(src.tail_grow_delay>0)
						src.tail_grow_delay-=1
					else
						if(src.tail_grow_delay<=0)
							if(!src.has_tail)
								src << "<center><font color = white> .:: Your Tail Grew Back ::.</font></center></center>"
								src.overlays+='Tail.dmi'
								src.has_tail=1
					spawn(600)src.Tail_Grow()
				else
					return
	proc
		DBDelete()
			for(var/obj/Earth_Dragonballs/O1 in src)
				del(O1)
			for(var/obj/Namek_Dragonballs/O2 in src)
				del(O2)
			for(var/obj/Black_Dragonballs/O3 in src)
				del(O3)
			return

