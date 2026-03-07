world/proc/niceDel()
	for(var/mob/characters/M in world)
		M.client.SaveMob(M)
		Del(M)
	world.Del()
mob/proc/namekregen()
	src.hp+=rand(1,2)
	if(src.hp>src.maxhp)
		src.hp=src.maxhp
	sleep(50)
	spawn()src.namekregen()

//All players
mob/characters/Login()
	spawn()src.Playerwishloop()
	spawn()src.aprise()
	spawn()src.CheatChecker3()
	spawn()src.CheatChecker1()
	spawn()src.CheatChecker2()
	spawn()src.CheatChecker12()
	if(src.race=="Demon")
		src.maxhp=180
		src.hp=180
	src.hp=src.maxhp
	src.overlays-=src.hairicon2
	src.hairicon2=0
	if(src.removeonlogin)
		src.overlays-=src.removeonlogin
		src.removeonlogin=0
	spawn(100)
		if(src.gotnm==0)
			src.gotnm=1
			src.transformations[10]=new/obj/Tran/Nevermind
	if(src.ooverlays)
		src.overlays=0
		src.overlays=src.ooverlays.Copy(1,0)
		src.ooverlays=0
	src.updateminimap=1
	src.layer=MOB_LAYER
	if(src.race=="Changling")
		src.verbs+=/mob/transform/verb/Transform

	if(src.iconswipe==0)
		src.contents=0
		src.overlays=0
		src.customattacks[1]=0
		src.customattacks[2]=0
		src.customattacks[3]=0
		src.customattacks[4]=0
		src.customattacks[5]=0
		src.customattacks[6]=0
		src.customattacks[7]=0
		src.customattacks[8]=0
		src.customattacks[9]=0
		src.customattacks[10]=0
		src.iconswipe=1
	if(src.senzupatch==0)
		src.senzupatch=1
		for(var/obj/senzu/X in src.contents)
			del(X)
		if(src.bankzenni>100000)
			src.bankzenni=100000
		if(src.zenni>100000)
			src.bankzenni=100000

//	if(src.isgold==1)
//		src<<"Thank you for donating to Masterdan! you have now gained gold member status to show off your support to his projects!"
//		src.verbs+=/mob/Admin/verb/ChangeIcon
//		src.verbs+=/mob/Admin/verb/CreateSpecialItemLimited
//		src.verbs+=/mob/Admin/verb/Upload_icon_to_server
	if(src.iconpatchki<=4)
		src.iconpatchki=5
		src.overlays=0

		src.overlays+=src.hairicon
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
		if(src.race=="Changling")
			src.icon = 'changling.dmi'
		if(src.race=="Bio-Android")
			src.icon = 'biocell1.dmi'
		if(src.race=="Buu Demon")
			src.icon= 'buu.dmi'
		if(src.race=="Namek-jin")
			src.icon= 'namek.dmi'
		if(src.race=="Android")
			src.icon = 'bioandroid-two.dmi'
			switch(input("Icon wipe, Android Do you want to customize your skin color or choose a humanoid skin tone?", "Character Creation") in list ("Android", "Humanoid"))
				if("Android")
					var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					src.icon += rgb((red),0,0)
					var/blue = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					src.icon += rgb(0,(blue),0)
					var/green = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
					src.icon += rgb(0,0,(green))
				if("Humanoid")
					switch(input("Gender")in list ("Male", "Female"))
						if("Male")
							switch(input("Skin Color")in list ("White","Tan","Light Brown","Dark Brown","Black"))
								if("White")
									src.icon = 'male-white.dmi'
									src.skincolor="white"
								if("Tan")
									src.icon = 'male.dmi'
									src.skincolor="tan"
								if("Light Brown")
									src.icon = 'male-lightbrown.dmi'
									src.skincolor="lightbrown"
								if("Dark Brown")
									src.icon = 'male-brown.dmi'
									src.skincolor="darkbrown"
								if("Black")
									src.icon = 'male-black.dmi'
									src.skincolor="black"
						if("Female")
							switch(input("Skin Color")in list ("White","Tan","Light Brown","Dark Brown","Black"))
								if("White")
									src.icon = 'female-pale.dmi'
									src.skincolor="fwhite"
								if("Tan")
									src.icon = 'female.dmi'
									src.skincolor="ftan"
								if("Light Brown")
									src.icon = 'female-lightbrown.dmi'
									src.skincolor="flightbrown"
								if("Dark Brown")
									src.icon = 'female-darkbrown.dmi'
									src.skincolor="fdarkbrown"
								if("Black")
									src.icon = 'female-black.dmi'
									src.skincolor="fblack"
	if(src.ssj==1)
		spawn()src.ForceRevert()
	if(src.lat==1)
		src.verbs += /mob/Admin/verb/AdminTeleport
		src.verbs += /mob/Admin/verb/Summon
		src.verbs += /mob/Admin/verb/Unsummon
		src.verbs +=/mob/Admin/verb/Debug
		src.verbs += /mob/Admin/verb/Purify
		src.verbs += /mob/Admin/verb/ChangeIcon
	if(length(src.skillkiusage)==15)
		src.skillkiusage.len+=10
	spawn(10)
		if(src.memloct==1)
			src.loc=locate(src.memloc[1],src.memloc[2],src.memloc[3])
			src.memloc[1]=0
			src.memloc[2]=0
			src.memloc[3]=0
			src.memloct=0
			src.invisibility=0
	if(src.heldwith)
		src.overlays-=src.heldwith
		src.heldwith=0
	if(src.powerlevel>src.maxpowerlevel)
		src.powerlevel=src.maxpowerlevel

	if(src.hasfused==1)
		src<<"<font color=red>Fused characters cannot be loaded</font>"
		sleep(10)
		del(src)

	if(src.client)
		spawn()src.playerloop()
	if(src.race=="Namek-jin")
		spawn()src.namekregen()
	if(src.hp>1000)
		src.hp=1000
	if(src.stamina<0)
		src.stamina=0
	if(src.customattacklearned==1)
		src.verbs+=new/mob/CustomAttackCPL/verb/Create_Move
	var/counter=0
	var/lenname=length(src.name)
	while(counter<=lenname)
		if(text2ascii(src.name,counter)<123)
			counter+=1
		else
			src<<"Bad name :P"
			del(src)
	src.animate_movement=1
	src.checkgm()
	var/count=1
	while(count<=25)
		if(skillkiusage[count]<=0||skillkiusage[count]==null||skillkiusage[count]=="")
			skillkiusage[count]=src.maxki/3
		count+=1
	src.attacking=0
	src.cantitto=0
	for(var/obj/O in src.contents)
		if(O.worn==0)
			O.clothes=""
/*
	if(src.guildwipe==0)
		src.guildwipe=1
		alert(src,"Due to a change in the way guilds are handled, everyones guild will be reset to default.")
		src.guild="None"
		src.ClanLeader=0
		src.Inguild=0
		src.oocname="Player"
*/
	if(src.malepatch==0)
		src.malepatch=1
		alert(src,"Due to a bug caused by moving the hosting files to a new server, you will now get to rechoose your Base Icon, this is a once in a lifetime thing so dont screw around.")
		switch(input("Choose a Gender?", "Character Creation", text) in list ("Male", "Female"))
			if("Male")
				switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Tan", "Light Brown","Dark Brown","Black"))
					if("White (Pale)")
						src.icon = 'male-white.dmi'
						src.skincolor="white"
					if("Tan")
						src.icon = 'male.dmi'
						src.skincolor="tan"
					if("Light Brown")
						src.icon = 'male-lightbrown.dmi'
						src.skincolor="lightbrown"
					if("Dark Brown")
						src.icon = 'male-brown.dmi'
						src.skincolor="darkbrown"
					if("Black")
						src.icon = 'male-black.dmi'
						src.skincolor="black"
			if("Female")
				switch(input("What tint of skin color do you want?", "Character Creation", text) in list ("White (Pale)", "Tan", "Light Brown","Dark Brown","Black"))
					if("White (Pale)")
						src.icon = 'female-pale.dmi'
						src.skincolor="fwhite"
					if("Tan")
						src.icon = 'female.dmi'
						src.skincolor="ftan"
					if("Light Brown")
						src.icon = 'female-lightbrown.dmi'
						src.skincolor="flightbrown"
					if("Dark Brown")
						src.icon = 'female-darkbrown.dmi'
						src.skincolor="fdarkbrown"
					if("Black")
						src.icon = 'female-black.dmi'
						src.skincolor="fblack"
	if(src.x==0||src.y==0||src.z==0)
		src.loc=locate(77,77,1)
	src.client.view=src.savedview
	if(src.frozen==1)
		spawn()src.drain()
	if(src.firstlog==0)
		src.loc=locate(70,80,10)
		src.firstlog=1

	if(src.z == 14)
		src.loc=locate(74,35,10)
	if(src.ozz==1)
		src.revertoozara()
	src.tempmute=0
	src.npp=0
	src.currentipaddress="[src.client.address]"
	src.flight = 0
	src.kame=0
	src.move = 1
	src.invisibility=0
	src.ko = 0
	if(src.ssj==2)
		src.ssj=0
	src.dieprocran=0
	src.whopause=0
	src.hassplit=0
	src.doingstuff=0
	src.timeout=0
	src.ptime = 0
	src.kiin = 0
	if(src.gm>=1)
		src.verbs+=/mob/Admin/verb/Admin_OOC
	src.hitpbag=0
	src.grav = 0
	src.combo = 0
	src.angered = 0
	src.client.show_verb_panel = 1
//	src.powerlevel = src.maxpowerlevel
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
	src.sample_report()
	src.meditate = 0
	src.overlays-= /obj/renzuko
	src.overlays -= /obj/Gdonut
	src.overlays -= /obj/assim
	src.verbs+=/mob/PetControl/verb/Pet_Hunt
	src.verbs+=/mob/PetControl/verb/Pet_Berserk
	src.verbs+=/mob/PetControl/verb/Pet_Passive
	src.verbs+=/mob/PetControl/verb/Pet_Follow
	src.verbs+=/mob/PetControl/verb/Pet_Special
	src.verbs+=/mob/PetControl/verb/Pet_Training
	src.verbs+=/mob/PetControl/verb/Pet_Disband
	src.verbs+=/mob/kiblast/verb/kiblast
	spawn()src.refreshcustomverbs()

	if(src.evolution==2)
		src.verbs += /mob/BebiInfest/verb/Infest
		src.verbs += /mob/BebiInfest/verb/UnInfest
	if(src.evolution==3)
		src.verbs += /mob/Bebi/verb/BebiTransform
		src.verbs += /mob/Bebi/verb/Revert
		src.verbs += /mob/BebiInfest/verb/Infest
		src.verbs += /mob/BebiInfest/verb/UnInfest

	if(src.DJ==1)
		src.verbs += /mob/Admin/verb/Stop_Music
		src.verbs += /mob/Admin/verb/Music
	if(src.IconChanger==1)
		src.verbs += /mob/Admin/verb/ChangeIcon
	if(src.Budokaihost==1)
		src.verbs += /mob/Admin/verb/HostBudokai
		src.verbs += /mob/Admin/verb/EndBudokai
		src.verbs += /mob/Admin/verb/SummonBudokai1
		src.verbs += /mob/Admin/verb/SummonBudokai2
		src.verbs += /mob/Admin/verb/UnsummonBudokai
		src.verbs += /mob/Admin/verb/UnsummonBudokai
		src.verbs += /mob/Admin/verb/WorldAuraOff
	if(src.skillrevengedb==1)
		src.verbs+=/mob/RevengeDeathBall/verb/RevengeDeathBall
	else
		src.verbs-=/mob/RevengeDeathBall/verb/RevengeDeathBall
	if(src.skillscattershot==1)
		src.verbs += /mob/Scattershot/verb/Scattershot
	if(src.customtechlearn==1)
		src.verbs+=/mob/Personalizedattack/verb/Customizeattck
		src.verbs+=/mob/Personalizedattack/verb/Personalattck

	if(src.powerlevel>src.maxpowerlevel)
		src.powerlevel=src.maxpowerlevel
	if(src.race=="Bio-Android")
		src.verbs+=/mob/Absorb/verb/Absorb
		src.verbs+=/mob/Assimilate/verb/Assimilate
		src.verbs+=/mob/celltransform/verb/Transform
		src.regencount = 0
	if(src.race=="Demon")
		if(src.demontrans==1)
			src.verbs+=/mob/Demontrans/verb/Revert
			src.verbs+=/mob/Demontrans/verb/DemonTransform
	if(src.skillsplitform==1)
		src.verbs += /mob/Splitform/verb/Multiply
//	if(src.skilldragonfist==1)
//		src.verbs+=/mob/DragonFist/verb/DragonFist
//	else
//		src.verbs-=/mob/DragonFist/verb/DragonFist
	if(src.skillselfdestruct==1)
		src.verbs+=/mob/SelfDestruct/verb/SelfDestruct
	else
		src.verbs-=/mob/SelfDestruct/verb/SelfDestruct
	if(src.skillkikoho==1)
		src.verbs += /mob/Kikho/verb/Kikho
	else
		src.verbs -= /mob/Kikho/verb/Kikho
	if(src.skillsupernamek==1)
		src.verbs+=/mob/SuperNamek/verb/SN
		src.verbs+=/mob/SuperNamek/verb/Revert
	src.verbs+=/mob/sense/verb/Sense
//	if(src.skillssj==1)
//		src.verbs+=/mob/ssj/verb/Transform
//		src.verbs+=/mob/ssj/verb/Revert
//	if(src.skilltelepath==1)
//		src.verbs+=/mob/telepath/verb/Telepath
	if(src.gonessj == 1)
		src.verbs+=/obj/Tran/verb/Transform
		src.verbs+=/obj/Tran/verb/Revert
	if(src.potrans==1)
		src.verbs+=/mob/Unlockpower/verb/Unlockpotential
		src.verbs+=/mob/Unlockpower/verb/Revert
	if(src.skilldoubletsui==1)
		src.verbs += /mob/DoubleTsuihikidan/verb/DoubleTsuihikidan
	if(src.skillchoukamehameha==1)
		src.verbs +=/mob/ChouKamehameha/verb/ChouKamehameha
//	src.verbs+=/mob/enrage/verb/Enrage

	if(src.skillkiblast==1)
		src.verbs+=/mob/kiblast/verb/kiblast
	if(src.skillandroidtransform==1)
		src.verbs+=/mob/AndroidTransform/verb/AndroidTransform
	if(src.skilltechwork==1)
		src.verbs+=/mob/techwork/verb/Tech_Workings
	if(src.skillkamehameha==1)
		src.verbs += /mob/Kamehameha/verb/Kamehameha
	if(src.skillspiritbomb==1)
		src.verbs += /mob/spiritbomb/verb/sbomb
	if(src.skillbigbangattack==1)
		src.verbs += /mob/BigBang/verb/BigBang
	if(src.skillrenzukoenergydan==1)
		src.verbs += /mob/Renzuko/verb/Renzuko
	if(src.skillgalekgun==1)
		src.verbs += /mob/GalekGun/verb/GalekGun
	if(src.skillfinalflash==1)
		src.verbs += /mob/FinalFlash/verb/FinalFlash
	if(src.skillsolarflare==1)
		src.verbs += /mob/Tayioken/verb/Tayioken
	if(src.skillzanzoken==1)
		src.verbs += /mob/Zanzoken/verb/Zanzoken
//	if(src.skillgalacticdonut==1)
	//	src.verbs += /mob/GalacticDonut/verb/GalacticDonut
	if(src.skillburningattack==1)
		src.verbs += /mob/Burning/verb/Burning
	if(src.skillspecialbeamcannon==1)
		src.verbs += /mob/SpecialBeamCannon/verb/SpecialBeamCannon
	if(src.skillmasenko==1)
		src.verbs += /mob/Masenko/verb/Masenko
	if(src.skilldondonpa==1)
		src.verbs += /mob/DonDonPa/verb/DonDonPa
	if(src.skillworldscan==1)
		src.verbs += /mob/worldscan/verb/World_Scan
	if(src.skilluniversalscan==1)
		src.verbs += /mob/uniscan/verb/Uni_Scan
	if(src.fusionlearn==1)
		src.verbs += /mob/FusionDance/verb/Fuse
	if(src.skillwrap==1)
		src.verbs += /mob/wrap/verb/Wrap
	if(src.skillkiabsorb==1)
		src.verbs += /mob/kiabsorb/verb/Ki_Absorb
	if(src.skillregeneration==1)
		src.verbs += /mob/regen/verb/Regeneration
	src.verbs += /mob/bukujutsu/verb/bukujutsu
	src.verbs += /mob/aura/verb/powerup
	src.verbs += /mob/aura/verb/powerdown
	if(src.skillkaioken==1)
		src.verbs += /mob/Kaioken/verb/Kaioken
	if(src.skillit==1)
		src.verbs += /mob/it/verb/Instant_Transmission
	if(src.skillitx==1)
		src.verbs += /mob/itx/verb/Instant_Transmission1
	if(src.maxpowerlevel>=200000)
		src.verbs += /mob/verb/AttackNormal

	if(src.maxpowerlevel>=1500000)
		src.verbs += /mob/itx/verb/Instant_Transmission2


	if(src.weights==1)
		src.verbs += /mob/itx/verb/Weights1
		src.verbs += /mob/itx/verb/Weights12
//	if(src.skillfocus==1)
	//	src.verbs += /mob/focus/verb/Focus
	if(src.skillkienzan==1)
		src.verbs += /mob/kienzan/verb/Kienzan
	if(src.skillfinalshine==1)
		src.verbs+=/mob/FinalShine/verb/FinalShine
	if(src.skillfinalkamehameha==1)
		src.verbs+=/mob/FinalKamehameha/verb/FinalKamehameha
	if(src.skillbigbangkamehameha==1)
		src.verbs+=/mob/BigBangKamehameha/verb/BigBangKamehameha
	if(src.mystic==1)
		src.verbs += /mob/Mystic/verb/MysticTransform
		src.verbs += /mob/Mystic/verb/MysticRevert
	if(src.majin==1)
		src.verbs += /mob/Majin/verb/MajinTransform
		src.verbs += /mob/Majin/verb/MajinRevert
	if(src.key == "Masterdan")
		src.verbs += /mob/Admin/verb/Oozarutrans

	if(src.key=="Masterdan")
		src.verbs +=/mob/danverb/verb/givedragonradar
		src.verbs+=/mob/danverb/verb/openguildhouses
	if(src.key=="Masterdan")
		src.verbs +=/mob/Admin/verb/MakeBuu
		src.verbs += /mob/Admin/verb/WorldClean
		src.verbs += /mob/Admin/verb/Event
	if(src.key=="Masterdan")
//		src.verbs+=/mob/Admin/verb/Make_GoldMember
		src.verbs+=/mob/Admin/verb/Change_OOCname
		src.verbs+=/mob/Admin/verb/Change_OOCRank
		src.verbs+=/mob/Admin/verb/CreateTurf
		src.verbs+=/mob/Admin/verb/MuteAll
		src.verbs+=/mob/Admin/verb/WorldAuraOff
	if(src.hasimportrights==1)
		src.verbs +=/mob/Admin/verb/Upload_icon_to_server
		src.verbs += /mob/Admin/verb/CreateSpecialItem
	if (src.key=="Masterdan")
		src.verbs +=/mob/PRAdmin/verb/Give_Morpher
		src.verbs +=/mob/PRAdmin/verb/Remove_Morpher
//	if (src.key=="Cyberpirate"||src.key=="Kadajz"||src.key=="Bazanku"||src.key=="Ticky"||src.key=="Team Hybrid"||src.key=="Kadajz")
//		src.verbs +=/mob/keycardadmin/verb/Give_Keycard
//		src.verbs +=/mob/keycardadmin/verb/Remove_Keycard

/*
	var/list/gmchiefs=list()
	var/list/mgms=list()
	var/list/ultimateadmin=list()
	if(fexists("gmlist.sav")==0)
		var/savefile/F = new("gmlist.sav")
		F["gmchiefs"]<<gmchiefs
		F["mgms"]<<mgms
	var/savefile/F = new("gmlist.sav")

	F["gmchiefs"]>>gmchiefs
	F["mgms"]>>mgms
	F["ultimateadmin"]>>ultimateadmin
*/

	if(usr.key=="Masterdan")
		src.gm=5
		src.verbs += /mob/danverb/verb/dbrevive
		src.verbs += /mob/Admin/verb/ShutdownServer
		src.verbs += /mob/Admin/verb/Reboot
		src.verbs += /mob/Admin/verb/I_spy
		src.verbs += /mob/Admin/verb/Stop_spy
	if(usr.key=="Masterdan")
		src.gm=6
		src.verbs += /mob/Admin/verb/MadSkills
//		src.verbs += /mob/Admin/verb/Gmrip
//		src.verbs += /mob/Admin/verb/SMultiply
		src.verbs += /mob/Admin/verb/HostBudokai
		src.verbs += /mob/Admin/verb/SummonBudokai1
		src.verbs += /mob/Admin/verb/SummonBudokai2
		src.verbs += /mob/Admin/verb/UnsummonBudokai
		src.verbs += /mob/Admin/verb/EndBudokai
		src.verbs += /mob/Admin/verb/Oozarutrans
		src.verbs += /mob/Admin/verb/Dragonball_Summon
		src.verbs += /mob/Admin/verb/Music
		src.verbs += /mob/Admin/verb/Stop_Music
		src.verbs += /mob/Admin/verb/Moon_Out
	if(usr.key=="Masterdan")
		src.gm=7
//		src.verbs += /mob/Admin/verb/Kakssuperfantasticverb
		src.verbs += /mob/Admin/verb/Own
		src.verbs += /mob/Admin/verb/Oozarutrans
		src.verbs += /mob/Admin/verb/GiveShinobiband
		src.verbs += /mob/Admin/verb/Moon_Out
		src.verbs += /mob/Admin/verb/DragonballWorldID
		src.verbs += /mob/Admin/verb/AllSay
		src.verbs += /mob/Admin/verb/GM_Giving
		src.verbs += /mob/Ban/verb/BanLog
		src.verbs += /mob/Admin/verb/DevMode
//		src.verbs += /mob/Admin/verb/Dodge
		src.verbs += /mob/LVL7Admin/verb/Give_Admin_Verb
		src.verbs += /mob/LVL7Admin/verb/Remove_Admin_Verb
//		src.verbs += /mob/Admin/verb/SMultiply
		src.verbs += /mob/Admin/verb/Max_Stat
		src.verbs += /mob/Admin/verb/Debug
		src.verbs += /mob/Admin/verb/Upload_icon_to_server
		src.verbs += /mob/Admin/verb/Special_Announce
		src.verbs += /mob/Admin/verb/Cleanall
		src.verbs += /mob/Admin/verb/CreateSpecialItem
		src.verbs += /mob/Admin/verb/EndBudokai
		src.verbs += /mob/Admin/verb/Boot
		src.verbs += /mob/Admin/verb/Request_Icon
		src.verbs += /mob/Admin/verb/Request_File
		src.verbs += /mob/Admin/verb/Inform
		src.verbs += /mob/Admin/verb/PowerHungrah
		src.verbs += /mob/Admin/verb/PlayerFreeze
		src.verbs += /mob/Admin/verb/PlayerUnfreeze
		src.verbs += /mob/Admin/verb/PlayerUnfreezeAll
		src.verbs += /mob/Admin/verb/Duplicate
		src.verbs += /mob/Admin/verb/unMute
		src.verbs += /mob/Admin/verb/unMuteAll
		src.verbs += /mob/Admin/verb/ViewUsefullVars
		src.verbs += /mob/Admin/verb/Mute
		src.verbs += /mob/Admin/verb/Dragonball_Scat
		src.verbs += /mob/Admin/verb/Create
		src.verbs += /mob/Admin/verb/AdminTeleport
		src.verbs += /mob/Admin/verb/AdminKill
		src.verbs += /mob/Admin/verb/Summon
		src.verbs += /mob/Admin/verb/Unsummon
		src.verbs += /mob/Admin/verb/Edit
		src.verbs += /mob/Admin/verb/CheckContents
		src.verbs += /mob/Admin/verb/Createmob
		src.verbs += /mob/Admin/verb/Rename
		src.verbs += /mob/Admin/verb/Revive
		src.verbs += /mob/Admin/verb/Restore
		src.verbs += /mob/Admin/verb/Purify
		src.verbs += /mob/Admin/verb/Prices
		src.verbs += /mob/Admin/verb/Create
		src.verbs += /mob/Admin/verb/ChangeOthersIcon
		src.verbs += /mob/Admin/verb/Beetchshlap
		src.verbs += /mob/Admin/verb/sfc
		src.verbs += /mob/Admin/verb/Delete
		src.verbs += /mob/Admin/verb/Funkalize
		src.verbs += /mob/Admin/verb/FunkalizeO
		src.verbs += /mob/Admin/verb/FunkalizeT
		src.verbs += /mob/Admin/verb/Add_Overlay
		src.verbs += /mob/Admin/verb/Add_Underlay
		src.verbs += /mob/Admin/verb/Remove_Overlay
		src.verbs += /mob/Admin/verb/Remove_Underlay
		src.verbs += /mob/Admin/verb/JailPlayer
		src.verbs += /mob/Admin/verb/UnJailPlayer

//	src.HiddenLogin()
	src.PlayerLogin()
	if(src.currentipaddress)
		for(var/mob/characters/X in world)
			if(X.key!=src.key)
				if(X.client && src.client)
					if(X.currentipaddress==src.currentipaddress)
						world<<"<font face=Tahoma><b><font color=yellow><font size=1>Multikey Info: <font color=white>[X]/[X.key] and [src] are from the same IP address"

	if(src.race == "Android" && src.dead==1)
		sleep(500)
		src.ingero=0
		src.loc=locate(56,111,3)
	if(src.dead==1)
		if(src.z==4||src.z==3||src.z==2||src.z==8||src.z==14||src.z==12)
			src.powerlevel+=0
		else
		//	spawn()src.lifepointdrop()
	if(src.gm>=4)
		src.verbs+=/mob/Ban/verb/Ban_Key
		src.verbs+=/mob/Ban/verb/Ban_IP
		src.verbs+=/mob/Ban/verb/Ban_Mob
		src.verbs+=/mob/Ban/verb/Unban_Key
		src.verbs+=/mob/Ban/verb/Unban_IP
		src.verbs+=/mob/Ban/verb/Ban_Who
//	spawn()src.Hpbarrefresh()
//	spawn()src.logging()

mob
	proc
		PlayerLogin()
			if(src.key=="Masterdan")
				world<<"<font face=Tahoma><b><font color=red>Dev</font><font size=1><font color=white><font size=1> Login: <font color=green>[usr.name]/[usr.key] Has logged in!</font></b>"
				usr.restingtime=0
				usr.musicp=0
				spawn()src.musicloop()
				return
			else
				world<<"<font face=Tahoma><b><font color=white><font size=1>Player Login: <font color=green>[usr.name]/[usr.key] Has logged in!</b>"
				usr.restingtime=0
				usr.musicp=0
				spawn()src.musicloop()

/*
mob
	proc
		PlayerLogin()
			if(src.key=="Masterdan"||src.key=="Kadajz"||src.key=="Cyberpirate"||src.key=="Master Koenorotto")
				world<<"<font face=Tahoma><b><font color=white><font size=1>Login Info: <font color=red>Dev </font><font color=green>[usr.name]/[usr.key] Has logged in!</b>"
				usr.restingtime=0
				return
			else
				world<<"<font face=Tahoma><b><font color=white><font size=1>Login Info: <font color=green>[usr.name]/[usr.key] Has logged in!</b>"
				usr.restingtime=0
*/

/*
mob
	proc
		HiddenLogin()
			if(src.key=="Masterdan"||src.key==""||usr.key=="")
				switch(input("Do you want to announce your arrival?", "Arrival Announcement",text) in list("Yes, Announce My Arrival","No, Join Secretly","Quit Gekisen, Just Logout"))
					if("Yes, Announce My Arrival")
						usr.restingtime=0
						world<<"<font face=Tahoma><b><font color=white><font size=1>Login Info: <font color=red>Dev </font><font color=green>[usr.name]/[usr.key] Has logged in!</b>"
					if("No, Join Secretly")
						return
					if("Quit Gekisen, Just Logout")
						src.invisibility=1
						src.key="logging out"
						sleep(50)
						del(src)
			else
				usr.restingtime=0
				world<<"<font face=Tahoma><b><font color=white><font size=1>Login Info: <font color=green>[usr.name]/[usr.key] Has logged in!</b>"
*/


mob/PetControl
	verb
		Pet_Hunt(var/mob/M in oview(6))
			set name ="Split-Attack"
			set popup_menu = 1
			set category = "Splitform Control"
			var/huntname=M.name
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Hunt"
					X.hunt=huntname
		Pet_Berserk()
			set name ="Split-Defend"
			set category = "Splitform Control"
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Berserk"
		Pet_Passive()
			set name ="Split-Passive"
			set category = "Splitform Control"
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Passive"
		Pet_Follow()
			set name ="Split-Follow"
			set category = "Splitform Control"
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Follow"
		Pet_Special(var/mob/M in oview(6))
			set name ="Split-Special"
			set category = "Splitform Control"
			set popup_menu = 1
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Hunt"
					X.hunt=M.name
					if(X.ki>0)
						X.ki-=1
						Special(M)
		Pet_Training()
			set name ="Split-Training"
			set category = "Splitform Control"
			for(var/mob/monsters/X in oview(10))
				if(X.owner==usr.name)
					X.mode="Training"
		Pet_Disband(var/mob/monsters/X in oview(10))
			set name ="Split-Disband"
			set popup_menu = 1
			set category = "Splitform Control"
			if(X.owner==usr.name)
				usr<<"You have booted [X.name] from your party."
				X.loc=locate(0,0,0)
				sleep(1000)
				del(X)

// Decepritate this?
mob/Back/verb/Back()
	set category = "Back"
	var/randcode = rand(1,9999)
	if((input(src,"Are you there? Please type [randcode]","AFK? type [randcode]")as num)==randcode)
		usr.hasnttalked=0
		usr.afk=0
		usr.verbs-=/mob/Back/verb/Back
// End Decepritate comment

mob/Splitform
	verb
		Multiply()
			set name = "Split Form"
			set category = "Fighting"
			if(usr.stamina>=90&&usr.powerlevel>0)
				usr.stamina=0

				if(usr.hassplit == 1)
					usr << "<b>You have used that recently."
				else
					if(usr.flight == 1)
						usr << "<b>You are too busy to! (You are flying)."
/*					if(usr.flight==0)
						usr<<"Split form has been removed, it might come back in a different version. Splitforms cause unneeded lag and hurt gameplay."*/

					if(usr.flight == 0)
						if(usr.z==10||usr.z==2||usr.z==3&&usr.x<140||usr.z==12||usr.dead==1)
							usr.stamina+=90
							if(usr.dead==0)
								usr<<"You cannot use Splitform here"
							else
								usr<<"You cannot use Splitform when you are dead"
						else
							for(var/mob/monsters/bman/M in world)
								if(M.owner==usr.name)
									del(M)
							var/mob/O1=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							var/mob/O2=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							var/mob/O3=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							usr.ki=usr.ki/4
							usr.hassplit=1
							O1.icon=usr.icon
							O1.overlays=usr.overlays
							O1.powerlevel=usr.powerlevel/4
							O1.strength=usr.powerlevel/20
							O1.name="[usr.name]'s multiform"
							O1.owner=usr.name
							O1.mode="Berserk"
							O2.icon=usr.icon
							O2.overlays=usr.overlays
							O2.powerlevel=usr.powerlevel/4
							O2.strength=usr.powerlevel/20
							O2.name="[usr.name]'s multiform"
							O2.owner=usr.name
							O2.mode="Berserk"
							O3.icon=usr.icon
							O3.overlays=usr.overlays
							O3.powerlevel=usr.powerlevel/4
							O3.strength=usr.powerlevel/20
							O3.name="[usr.name]'s multiform"
							O3.owner=usr.name
							O3.mode="Berserk"
							usr.powerlevel=usr.powerlevel/4
							spawn()O1.splitfade()
							spawn()O2.splitfade()
							spawn()O3.splitfade()
							sleep(400)
							usr.hassplit=0

					if(usr.flight == 2)
						if(usr.z==10||usr.z==2||usr.z==3&&usr.x<140||usr.z==12||usr.dead==1)
							usr.stamina+=90
							if(usr.dead==0)
								usr<<"You cannot use Splitform here"
							else
								usr<<"You cannot use Splitform when you are dead"
						else
							for(var/mob/monsters/bman/M in world)
								if(M.owner==usr.name)
									del(M)
							var/mob/O1=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							var/mob/O2=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							var/mob/O3=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
							usr.powerlevel=usr.powerlevel/4
							usr.ki=usr.ki/4
							usr.hassplit=1
							O1.icon=usr.icon
							O1.overlays=usr.overlays
							O1.powerlevel=usr.powerlevel/4
							O1.strength=usr.powerlevel/20
							O1.name="[usr.name]'s multiform"
							O1.owner=usr.name
							O2.icon=usr.icon
							O2.overlays=usr.overlays
							O2.powerlevel=usr.powerlevel/4
							O2.strength=usr.powerlevel/20
							O2.name="[usr.name]'s multiform"
							O2.owner=usr.name
							O3.icon=usr.icon
							O3.overlays=usr.overlays
							O3.powerlevel=usr.powerlevel/4
							O3.strength=usr.powerlevel/20
							O3.name="[usr.name]'s multiform"
							O3.owner=usr.name
							spawn()O1.splitfade()
							spawn()O2.splitfade()
							spawn()O3.splitfade()
							sleep(400)
							usr.hassplit=0
			usr<<"You need at least 90% stamina to use this skill"
mob/proc
	splitfade()
		sleep(400)
		del(src)
	drain()
		if(src.frozen==1)
			src.move=0
			src.talk = 0
			src.mute=1
			src.ki=0
			src.dead=1
			src.kame = 1
			src.ko = 1
			src.timeout=1
			sleep(100)
			spawn()drain()


mob/Admin
	verb
//		Make_GoldMember(mob/characters/M as mob in world)
//			set category = "Police"
//			set popup_menu = 0
//			usr<<"This is only to be used to reward those who donate to Masterdan"
//			M.isgold=1
//			M<<"Thank you for donating to Masterdan! you have now gained gold member status to show off your support to his projects!"
//			M.verbs+=/mob/Admin/verb/ChangeIcon
//			M.verbs+=/mob/Admin/verb/CreateSpecialItemLimited
//			M.verbs+=/mob/Admin/verb/Upload_icon_to_server
		Max_Stat()
			set category = "Police"
			usr.customcpl[1]=99
			usr<<"*thumbs up*"
		WorldClean()
			set category = "Police"
		//	world.WorldClean()
/*
		Kakssuperfantasticverb()
			set category = "Police"
			view(10)<<"The pure wrath of [src] spawns destructive energy, smiting everything in his sight."
			for(var/mob/M in oview())
				M.dead=0
				var/snart = new /obj/sbombprojectile(locate(usr.x,usr.y+2,usr.z))
				var/dam=99999999999
				usr.icon_state = "sbomb"
				usr.kame = 0
				usr.icon_state=""
				s_missile(snart,usr,M)
				sleep(1)
				spawn(20)
					del(snart)
					if(M)
						M.powerlevel -= dam
						M.hp-= dam
						if(M.powerlevel<=0&&M.race!=null|""||M.hp<=0&&M.race!=null|"")
							var/O = new /obj/crator(M.loc)
							var/I = new /mob/smoke(M.loc)
							M.Die()
							flick("smoke",I)
							sleep(50)
							del(I)
							sleep(200)
							del(O)
*/
		Open_Gmlist()
			usr<< browse(file2text("gmlist.sav"))
		Export_Gmlist()
			usr<< ftp("gmlist.sav","gmlist.sav")
		Addto_Gmlist()
			switch(input("GM Level","GM Level") in list("GM Chief","MGM","Nevermind"))
				if("GM Chief")
					var/savefile/F = new("gmlist.sav")
					var/list/oldlist[]=new()
					F["gmchiefs"]>>oldlist
					var/newguy=input(usr,"Enter the players key","KEY for GM") as text
					var/obj/placeholder=new()
					placeholder.name=newguy
					oldlist+=placeholder
					F["gmchiefs"]<<oldlist
				if("MGM")
					var/savefile/F = new("gmlist.sav")
					var/list/oldlist[]=new()
					F["mgms"]>>oldlist
					var/newguy=input(usr,"Enter the players key","KEY for GM") as text
					var/obj/placeholder=new()
					placeholder.name=newguy
					oldlist+=placeholder
					F["mgms"]<<oldlist
		Removefrom_Gmlist()
			switch(input("GM Level","GM Level") in list("GM Chief","MGM","Nevermind"))
				if("GM Chief")
					var/savefile/F = new("gmlist.sav")
					var/oldlist=list()
					F["gmchiefs"]>>oldlist
					var/newguy=input(usr,"Enter the players key","KEY for GM") as text
					for(var/obj/O in oldlist)
						if(O.name==newguy)
							del(O)
					F["gmchiefs"]<<oldlist
				if("MGM")
					var/savefile/F = new("gmlist.sav")
					var/oldlist=list()
					F["mgm"]>>oldlist
					var/newguy=input(usr,"Enter the players key","KEY for GM") as text
					for(var/obj/O in oldlist)
						if(O.name==newguy)
							del(O)
					F["mgm"]<<oldlist

		Admin_OOC(msg as text)
			set category = "Police"
			for(var/mob/characters/M in world)
				if(usr.gm==0)
					sleep(10)
				else
					if(M.gm)
						M<<"<b><font color = Silver>{{<font color = Green>[usr.oocname]<font color = Silver>}<font color = aqua>[usr.rankname]<font color = Silver>}<font color = Green><tt>{{<font color = Silver>[usr]<font color = Green>}}<font color = white> OOCs:<font color = Yellow> [html_encode(msg)]</b>"

		Debug()
			set category = "Police"
	//		dd_debugger.ControlPanel()
		Duplicate(obj/M as obj in world)
			set name= "Duplicate"
			set category= "Police"
			var/duplicate=new/obj/SpecialItem
			duplicate:name=M.name
			duplicate:icon=M.icon
			usr.contents+=duplicate
		PlayerFreeze(mob/characters/M as mob in world, ID as text)
			set name= "Player Freeze"
			set popup_menu = 1
			set category= "Police"
			if(M.key == "Masterdan"||M.key==""||M.key=="Zucrois"||M.key=="Douch"||M.key=="Bazanku"||M.key=="Valitor"||M.key=="Cyberpirate")
				usr<<"GM's Cannot be frozen!"
			else
				world << "<b><font size=1><font color=yellow>Admin Info: <font color=red>[M] <font color=white>has been frozen because of <font color=red>[ID]"
				world<<"A radiant aura of power emits all over the world, and suddenly a single blast of pure energey arcs through the sky and hits [M] with tremendous force, changing [M] essence indefinately."
				usr.overlays+='lightning.dmi'
				sleep(10)
				s_missile('piece.dmi', usr, M)
			//	M.overlays=0
				sleep(10)
				M.overlays+=new/obj/Icecube
				flick("ice_animation",usr.overlays)
				spawn(100)usr.overlays-='lightning.dmi'
				M.move = 0
				M.timeout = 1
				M.talk = 0
				M.mute=1
				M.kame = 1
				M.ko = 1
				M.frozen=1
				spawn(10)M.drain()

		DevMode()
			set name="Developer Mode"
			set popup_menu = 1
			set category= "Police"
			switch(input("Turn developer mode on?", "Developer Mode Toggle",text) in list("On","Off","Cancel"))
				if("On")
					usr<<"Developer Mode On!"
					usr.npp=1
					usr.creator=1
				if("Off")
					usr<<"Developer Mode Off!"
					usr.npp=0
					usr.creator=0
				if("Cancel")
					return

		JailPlayer(mob/characters/M as mob in world, ID as text)
			set name="Jail Player"
			set popup_menu = 1
			set category= "Police"
			if(M.key == "Masterdan"||M.key==""||M.key=="Zucrois"||M.key=="Douch"||M.key=="Bazanku"||M.key=="Valitor"||M.key=="Cyberpirate")
				usr<<"<b><font color=red>Admin's cannot be jailed!</font><b>"
			else
				world <<"<b><font size=1><font color=yellow>Admin Info:</font> <font color=red>[M]</font> <font color=white>has been jailed for</font> <font color=red>[ID]</font>"
				switch(input("Choose what jail cell you want to send him/her too..", "Cell Chooser",text) in list("Jail Cell 1","Jail Cell 2","Jail Cell 3","Jail Cell 4","Jail Cell 5","Jail Cell 6","Jail Cell 7","Jail Cell 8","Jail Cell 9","Jail Cell 10","Jail Cell 11","Jail Cell 12","Cancel"))
					if("Jail Cell 1")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(167,141,22)
					if("Jail Cell 2")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(160,141,22)
					if("Jail Cell 3")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(153,149,22)
					if("Jail Cell 4")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(153,157,22)
					if("Jail Cell 5")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(162,165,22)
					if("Jail Cell 6")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(171,165,22)
					if("Jail Cell 7")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(180,165,22)
					if("Jail Cell 8")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(188,165,22)
					if("Jail Cell 9")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(197,157,22)
					if("Jail Cell 10")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(197,149,22)
					if("Jail Cell 11")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(189,141,22)
					if("Jail Cell 12")
						M.dead = 1
						M<<"You were jailed by [usr]!"
						M.loc=locate(182,141,22)
					if("Cancel")
						return
		UnJailPlayer(mob/characters/M as mob in world)
			set name="Unjail Player"
			set popup_menu = 1
			set category= "Police"
			world <<"<b><font size=1><font color=yellow>Admin Info:</font> <font color=red>[M]</font> <font color=white>has been unjailed.</font></font>"
			usr.dead = 0
			usr.loc=locate(207,194,1)


		PlayerUnfreeze(mob/characters/M as mob in world)
			set name= "Player UnFreeze"
			set popup_menu = 1
			set category= "Police"
			world<<"[M] has been unfrozen."
			M.overlays-=/obj/Icecube
		//	M.overlays=M.ooverlays
			M.move=1
			M.hp=0
			M.timeout=1
			M.talk = 1
			M.mute=0
			M.kame = 0
			M.ko = 0
			M.frozen=0
		PlayerUnfreezeAll()
			set name= "Player UnFreeze All"
			set category= "Police"
			world<<"[usr] Unfreezes everybody"
			for(var/mob/characters/M as mob in world)
				M.overlays-=/obj/Icecube
			//	M.overlays=M.ooverlays
				M.move=1
				M.talk = 1
				M.mute=0
				M.kame = 0
				M.ko = 0
				M.frozen=0

		Event()
			set name= "Event"
			set category= "Police"
			switch(input("Event Type:.") in list("Winter","Summer","Christmas Trees","Easter","Halloween","Nevermind"))
				if("Winter")
					for(var/turf/M in world)
						if(M.icon=='turfs.dmi')
							M.icon='turfswinter.dmi'
				if("Summer")
					for(var/turf/M in world)
						if(M.icon=='turfswinter.dmi')
							M.icon='turfs.dmi'
/*
		SMultiply()
			set name = "Super-Split Form"
			set category = "Fighting"
			if(usr.hassplit == 999)
				usr << "<b>You have used that recently."
			else
				if(usr.flight == 1)
					usr << "<b>You are too busy to! (You are flying)."
				if(usr.flight == 0)
					var/mob/O1=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
					var/mob/O2=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
					var/mob/O3=new /mob/monsters/bman (locate(usr.x,usr.y+1,usr.z))
					usr.powerlevel=usr.powerlevel
					usr.ki=usr.ki
					usr.hassplit=0
					usr.stamina=usr.stamina
					O1.icon=usr.icon
					O1.overlays=usr.overlays
					O1.powerlevel=usr.powerlevel/4
					O1.strength=usr.powerlevel/20
					O1.name="[usr.name]'s multiform"
					O1.owner=usr.name
					O2.icon=usr.icon
					O2.overlays=usr.overlays
					O2.powerlevel=usr.powerlevel/4
					O2.strength=usr.powerlevel/20
					O2.name="[usr.name]'s multiform"
					O2.owner=usr.name
					O3.icon=usr.icon
					O3.overlays=usr.overlays
					O3.powerlevel=usr.powerlevel/4
					O3.strength=usr.powerlevel/20
					O3.name="[usr.name]'s multiform"
					O3.owner=usr.name
					spawn()
						sleep(4000)
						del(O1)
						del(O2)
						del(O3)
						usr.hassplit=0
*/
/*
		Dodge()
			set name = "Dodge"
			set category = "Fighting"
			if(usr.dir == 1)
				flick("zan",usr)
				step(usr,NORTHEAST)
				step(usr,NORTHWEST)
				usr.dir = 2
			else if(usr.dir == 8)
				flick("zan",usr)
				step(usr,SOUTHWEST)
				step(usr,NORTHWEST)
				usr.dir = 4
			else if(usr.dir == 4)
				flick("zan",usr)
				step(usr,SOUTHEAST)
				step(usr,NORTHEAST)
				usr.dir = 8
			else if(usr.dir == 2)
				flick("zan",usr)
				step(usr,SOUTHEAST)
				step(usr,SOUTHWEST)
				usr.dir = 1
			else if(usr.dir == SOUTHEAST)
				flick("zan",usr)
				step(usr,EAST)
				step(usr,SOUTHEAST)
				usr.dir = 8
			else if(usr.dir == SOUTHWEST)
				flick("zan",usr)
				step(usr,WEST)
				step(usr,SOUTHWEST)
				usr.dir = 4
			else if(usr.dir == NORTHWEST)
				flick("zan",usr)
				step(usr,NORTH)
				step(usr,NORTHWEST)
				usr.dir = 2
			else if(usr.dir == NORTHEAST)
				flick("zan",usr)
				step(usr,NORTH)
				step(usr,NORTHEAST)
				usr.dir = 2

*/
/*
		Dodge()
//			set name = "Dodge"
//			set category = "Fighting"
			if(usr.dodgedense=1)
				set name = "Dodge"
				set category = "Fighting"
					usr<<"There is something in the way!"
				return
			else if(usr.dodgedense=0)
					set name = "Dodge"
					set category = "Fighting"
					if(usr.dir == 1)
						flick("zan",usr)
						usr.loc=locate(usr.x,(usr.y+2),usr.z)
						usr.dir = 2
					else if(usr.dir == 8)
						flick("zan",usr)
						usr.loc=locate((usr.x-2),usr.y,usr.z)
						usr.dir = 4
					else if(usr.dir == 4)
						flick("zan",usr)
						usr.loc=locate((usr.x+2),usr.y,usr.z)
						usr.dir = 8
					else if(usr.dir == 2)
						flick("zan",usr)
						usr.loc=locate(usr.x,(usr.y-2),usr.z)
						usr.dir = 1
					else if(usr.dir == 5)
						flick("zan",usr)
						usr.loc=locate((usr.x+2),(usr.y+2),usr.z)
						usr.dir = 10
					else if(usr.dir == 6)
						flick("zan",usr)
						usr.loc=locate((usr.x+2),(usr.y-2),usr.z)
						usr.dir = 9
					else if(usr.dir == 9)
						flick("zan",usr)
						usr.loc=locate((usr.x-2),(usr.y+2),usr.z)
						usr.dir = 6
					else if(usr.dir == 10)
						flick("zan",usr)
						usr.loc=locate((usr.x-2),(usr.y-2),usr.z)
						usr.dir = 5
*/
		CheckContents(mob/M as mob in world)
			set name= "Inventory Remove"
			set category = "Police"
			set popup_menu = 1
			var/xcontents = input("Contents","Contents") in M.contents
			M.contents-=xcontents
		Upload_icon_to_server()
			set category = "Police"
			var/eupload = input(usr,"Choose Icon to Upload","Icon") as icon
			var/goodicon=0
			if(check_icon(eupload))
				var/facesize=length(eupload)
				if(facesize<=300000)
					goodicon=1
				else
					usr<<"To big."
			else
				usr<<"That was a corrupt icon"
			if(goodicon==1)
				var/ename = input(usr, "Enter a name for the Icon for future reference","Name") as text
				var/savefile/F = new("icons/[ename].sav")
				F["icon"]<<eupload
		SaveAll()
			set category = "Police"
			for(var/mob/characters/M in world)
				var/firstletter=copytext(M.ckey, 1, 2)
				var/savefile/F = new("players/[firstletter]/[M.ckey].sav")
				Write(F)
		Own(mob/M as mob in world)
			set category = "Police"
			set popup_menu = 0
			set desc = "Makes an npc your ally"
			M.owner+="[usr.name] "
		Request_Icon(mob/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			switch(input(M,"[usr.name] is giving you permission to send them an Icon","Accept?") in list("Yes","No"))
				if("Yes")
					var/efile = input(M,"Choose Icon to Give to Admin:[usr.name]","Icon") as icon
					usr << ftp(efile)
				else
					usr<<"You have been REJECTED"
		Request_File(mob/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			switch(input(usr,"Send or Request","?") in list("Send","Request"))
				if("Request")

					switch(input(M,"[usr.name] is giving you permission to send them a File","Accept?") in list("Yes","No"))
						if("Yes")
							var/efile = input(M,"Choose File to Give to Admin:[usr.name]","File") as file
							usr << ftp(efile)
						else
							usr<<"You have been REJECTED"
				if("Send")
					var/efile = input(usr,"Choose File to Give to [M]","File") as file
					M << ftp(efile)
		Add_Overlay(mob/M as mob in world, I as icon)
			set category = "Police"
			set popup_menu = 0
			M.overlays += I
		Remove_Overlay(mob/M as mob in world, I as icon)
			set category = "Police"
			set popup_menu = 0
			M.overlays -= I
		Add_Underlay(mob/M as mob in world, I as icon)
			set category = "Police"
			set popup_menu = 0
			M.underlays += I
		Remove_Underlay(mob/M as mob in world, I as icon)
			set category = "Police"
			set popup_menu = 0
			M.underlays -= I
		Dragonball_Summon()
			set category = "Police"
			for(var/obj/dragonballs/O in world)
				O.loc = locate(usr.x,usr.y-1,usr.z)
			world << "All the Dragonballs float to [usr]!"
		Dragonball_remove()
			set category = "Police"
			for(var/mob/characters/M in world)
				M.gotdb1=0
				M.gotdb2=0
				M.gotdb3=0
				M.gotdb4=0
				M.gotdb5=0
				M.gotdb6=0
				M.gotdb7=0
			for(var/obj/dragonballs/O in world)
				O.loc = locate(usr.x,usr.y-1,usr.z)
			world << "All the Dragonballs turn to stone because of [usr]!"
		Dragonball_Scat()
			set category = "Police"
			for(var/obj/dragonballs/O in world)
				world.CdChecker()
				O.loc = locate(x,y,1)
			world << "All the Dragonballs are scattering thanks to [usr]!"
		GM_Giving(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 1
			switch(input("What type, what level, etc.") in list("Perm Special Item Maker","Perm IconChanger","Perm DJ","Perm Budokai Host","Temp Budokai Host","Temp DJ","Temp IconChanger","TEMP Level 1","PERM Level 1","PERM Level 2","PERM Level 3","PERM Level 4","Remove GM"))

				if("Temp DJ")
					M.verbs += /mob/Admin/verb/Stop_Music

					M.verbs += /mob/Admin/verb/Music
				if("Temp IconChanger")

					M.verbs += /mob/Admin/verb/ChangeIcon
				if("Temp Budokai Host")
					M.verbs += /mob/Admin/verb/HostBudokai
					M.verbs += /mob/Admin/verb/EndBudokai
					M.verbs += /mob/Admin/verb/SummonBudokai1
					M.verbs += /mob/Admin/verb/SummonBudokai2
				if("Perm Special Item Maker")
					M.verbs +=/mob/Admin/verb/Upload_icon_to_server
					M.verbs += /mob/Admin/verb/CreateSpecialItem
					M.hasimportrights=1
				if("Perm DJ")
					M.verbs += /mob/Admin/verb/Stop_Music
					M.verbs += /mob/Admin/verb/Music
					M.DJ=1
				if("Perm IconChanger")

					M.verbs += /mob/Admin/verb/ChangeIcon
					M.IconChanger=1
				if("Perm Budokai Host")
					M.verbs += /mob/Admin/verb/HostBudokai
					M.verbs += /mob/Admin/verb/EndBudokai
					M.verbs += /mob/Admin/verb/SummonBudokai1
					M.verbs += /mob/Admin/verb/SummonBudokai2
					M.Budokaihost=1
				if("LAT")
					M.lat=1
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Unsummon
					M.verbs +=/mob/Admin/verb/Debug
					M.verbs += /mob/Admin/verb/Purify
					M.verbs += /mob/Admin/verb/ChangeIcon
				if("TEMP Level 1")
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Unsummon
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/Inform


					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0
					M.verbs +=/mob/Admin/verb/Debug
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.icon_state = ""
					M.oocname = "<font color=green>Level 1 God</font>"
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
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Unsummon
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/Inform
					M.verbs +=/mob/Admin/verb/Debug

					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0
					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0
					M.icon_state = ""
					M.oocname = "<font color=white>Lower Admin Team</font>"
					M.gm = 1
					M.ased = 0
					M.absorb = 0
					M.flight = 0
					M.talk = 1
					M.training = 0
					M.density = 1
					M.safe = 0
					M.meditate = 0
					world << "<tt><font color = green>[M] is now Permanant LAT</tt>"
					if(M.race == "Android"||M.race == "Biological Android")
						M.loc=locate(56,111,3)
					M.gmlevel = 1
				if("PERM Level 2")
					M.verbs +=/mob/Admin/verb/Debug
					M.verbs += /mob/Admin/verb/unMute
					M.verbs += /mob/Admin/verb/Mute
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

					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0

					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0

					M.icon_state = ""
					M.oocname = "<font color=red>Level 2 God</font>"
					M.gm = 2
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
					M.verbs +=/mob/Admin/verb/Debug
					M.verbs += /mob/Admin/verb/unMute
					M.verbs += /mob/Admin/verb/Mute
					M.verbs += /mob/Admin/verb/Boot
					M.verbs += /mob/Admin/verb/AdminTeleport
					M.verbs += /mob/Admin/verb/Summon
					M.verbs += /mob/Admin/verb/Unsummon
					M.verbs += /mob/Admin/verb/Edit
					M.verbs += /mob/Admin/verb/Rename
					M.verbs += /mob/Admin/verb/AllSay
					M.verbs += /mob/Admin/verb/Revive
					M.verbs += /mob/Admin/verb/PowerBoost
					M.verbs += /mob/Admin/verb/Restore
					M.verbs += /mob/Admin/verb/Inform

					M.verbs += /mob/Admin/verb/sfc
					M.verbs += /mob/Admin/verb/Delete

					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0

					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0

					M.icon_state = ""
					M.oocname = "<font color=silver>Level 3 God</font>"
					M.gm = 3
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
					M.verbs +=/mob/Admin/verb/Debug
					M.verbs += /mob/Admin/verb/Create
					M.verbs += /mob/Admin/verb/CreateSpecialItem
					M.verbs += /mob/Admin/verb/unMute
					M.verbs += /mob/Admin/verb/Mute
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
					M.verbs += /mob/Admin/verb/Create

					M.verbs += /mob/Admin/verb/MakeBuu

					M.verbs += /mob/Admin/verb/PowerHungrah
					M.verbs += /mob/Admin/verb/sfc
					M.verbs += /mob/Admin/verb/Delete
					M.verbs += /mob/Admin/verb/MadSkills
					M.verbs += /mob/Admin/verb/Own
					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0

					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0

					M.icon_state = ""
					M.oocname = "<font color=yellow>Level 4 God</font>"
					M.gm = 4
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
					M.verbs -=/mob/Admin/verb/Debug
					M.verbs -= /mob/Admin/verb/unMute
					M.verbs -= /mob/Admin/verb/Mute
					M.verbs -= /mob/Admin/verb/Create
					M.verbs -= /mob/Admin/verb/CreateSpecialItem
					M.verbs -= /mob/Admin/verb/Boot
					M.verbs -= /mob/Admin/verb/Special_Announce
					M.verbs -= /mob/Admin/verb/AdminTeleport
					M.verbs -= /mob/Admin/verb/AdminKill
					M.verbs -= /mob/Admin/verb/Special_Announce
					M.verbs -= /mob/Admin/verb/Summon
					M.verbs -= /mob/Admin/verb/Unsummon
					M.verbs -= /mob/Admin/verb/Edit
					M.verbs -= /mob/Admin/verb/Rename
					M.verbs -= /mob/Admin/verb/AllSay
					M.verbs -= /mob/Admin/verb/Revive
					M.verbs -= /mob/Admin/verb/PowerBoost
					M.verbs -= /mob/Admin/verb/Restore
					M.verbs -= /mob/Admin/verb/Purify
					M.verbs -= /mob/Admin/verb/Inform
					M.verbs -= /mob/Admin/verb/Prices
					M.verbs -= /mob/Admin/verb/Create
					M.verbs -= /mob/Admin/verb/Beetchshlap
					M.verbs -= /mob/Admin/verb/MakeBuu
					M.verbs -= /mob/Admin/verb/Reboot
					M.verbs -= /mob/Admin/verb/PowerHungrah
					M.verbs -= /mob/Admin/verb/sfc
					M.verbs -= /mob/Admin/verb/Delete
					M.verbs -= /mob/Admin/verb/MadSkills

					M.verbs -= /mob/Admin/verb/Stop_Music
					M.verbs -= /mob/Admin/verb/Own

					M.verbs -= /mob/Admin/verb/Music
					M.loc=locate(74,35,10)
					M.move = 1
					M.ko = 0

					M.ptime = 0
					M.kiin = 0
					M.grav = 0
					M.combo = 0
					M.angered = 0
					M.powerlevel = M.maxpowerlevel
					M.tech = 0
					M.gainzenni = 0
					M.slap = 0

					M.icon_state = ""
					M.oocname = "Player"
					M.gm = 0
					world << "<tt><font color = green>[M] is now non-gm</tt>"
					M.gmlevel = 0
		Gmrip(O in view())
			set category = "Police"
			usr << ftp(O:icon)
		Music(S as sound)
			set category = "Police"
			world << sound(S,1)
		Sound(S as sound)
			set category = "Police"
			world << sound(S,0)
		Stop_Music()
			set category = "Police"
			world << sound(null)
		Boot(mob/M as mob in world, ID as text)//this will kick an unruly person off your server
			set popup_menu = 1
			if(usr.client)
				set category = "Police"
				set name = "Boot"
				if(M == usr)
					usr << "<b>You can't boot yourself!"
					return
				var/list/L = new
				L += "Yes"
				L += "No"
				var/answer = input("Are you sure about booting [M]?") in L
				switch(answer)
					if("Yes")
						world<<"<b><font size=1><font color=yellow>Admin Info: <font color=red>[M] <font color=white>has been booted because of <font color=red>[ID]"
						del(M)
					if("No")
						src << "You changed your mind about booting [M]."
			else
				usr << "<b>You can't boot npcs."

		Reboot()//this will reboot your server
			set name="Police Reboot"
			set category="Police"
			switch(input("REBOOT THE SERVER?! ARE YOU SURE?! Rebooting rarely fixes any lag, and inconveniences many players.", text) in list ("Yes", "No"))
				if("Yes")
					world << "<b><i><u><font face=arial><font color=blue><font size=4>Server Rebooting in 5 Seconds!"
					sleep(50)
					world.Reboot()


		Special_Announce(message as message)//this is too make a special announcement
			set category = "Police"
			set name = "Police Announce"
			set desc = "(message) Announce something to all players logged in"
			for(var/client/C)
				C.mob << "<hr><center><font color=red><b><font size='+1'> Officer [usr] would like to announce:<br></font>\blue [message]</center><hr>"
		AdminTeleport(M as mob in world)//this will teleport you to any mob on the server including the ones you coded in
			set category = "Police"
			set popup_menu = 1
			set name="Police Teleport"
			if(usr.z==17)
				usr.overlays-='ccpod.dmi'
				usr.podloc=locate(usr.x,usr.y,usr.z)
				usr.lastplanet="Pod"
				for(var/obj/X in usr.contents)
					if(X.name=="Spacepod")
						del(X)
			usr.x = M:x
			usr.y = M:y-1
			usr.z = M:z
			usr << "You go infront of [M]"
			view(6) << "<b>[usr] teleports to you..."

		AdminKill(mob/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			set name="Police Kill"
			M.powerlevel = 0
			M.Die()

		ShutdownServer()
			set category="Police"
			set name="Shutdown Server"
			switch(input("CLOSE THE SERVER?! ARE YOU SURE?!", text) in list ("Yes", "No"))
				if("Yes")
					world<<"<b><i><u><font face=arial><font color=red><font size=5>SERVER CLOSING IN 20 SECONDS!!"
					sleep(200)
					world.niceDel()


		DragonballWorldID(worldid as text)
			set category="Police"
			set desc="Change The World's ID"
			world.name=worldid
		Summon(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 1
			M << "<b>Officer [usr] has summoned you."
			M.sy=M.y
			M.sx=M.x
			M.sz=M.z
			M:loc = locate(usr.x,usr.y,usr.z)
			M:y -= 1
			M.safe = 0
			M.issummoned=1
		Unsummon(mob/characters/M in world)
			set popup_menu = 1
			set category = "Police"
			if(M.issummoned==1)
				M.loc=locate(M.sx,M.sy,M.sz)
				M<< "<b>Officer [usr] has unsummoned you."
				M.issummoned=0
			else
				usr<<"[M] has not been summoned"




		Editold(obj/O as obj|mob|turf|area in view())
			set category = "Police"
			set popup_menu = 0
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

		Change_OOCname(mob/M as mob in world, ID as text)
			set category="Police"
			set popup_menu = 0
			set name="Change OOCName"
			set desc="Change A Mob's ID"
			M.oocname=ID
		Change_OOCRank(mob/M as mob in world, ID as text)
			set category="Police"
			set popup_menu = 0
			set name="Change OOCRank"
			set desc="Change A Mob's ID"
			M.rankname=ID
		Rename(mob/M as mob in world, ID as text)
			set category="Police"
			set popup_menu = 0
			set desc="Change A Mob's ID"
			M.name=ID
		ViewUsefullVars(mob/M as mob in world)
			set popup_menu = 0
			set category="Police"
			usr << "<b>-------[M]-------"
			usr << "<b><font color = blue>Powerlevel:<font color = green> [num2text(M.powerlevel,100)]/[num2text(M.maxpowerlevel,100)]"
			usr << "<b><font color = blue>Location:<font color = green> [M.x],[M.y],[M.z]"
			usr << "<b><font color = blue>OOCname:<font color = green> [M.oocname]"
			usr << "<b><font color = blue>Ki:<font color = green> [M.ki]/[M.maxki]"
			usr << "<b><font color = blue>Stamina:<font color = green> [M.stamina]/[M.maxstamina]"
			usr << "<b><font color = blue>Onlinetime:<font color = green> [M.onlinetime]"
			usr << "<b><font color = blue>Icon:<font color = green> [M.icon]"
			usr << "<b><font color = blue>Icon_State:<font color = green> [M.icon_state]"


		PowerBoost(mob/characters/M as mob in world)
			set category = "Police"
			set popup_menu = 0
			set name = "Power Boost"
			set desc = "Boost a mobs power."
			usr<<"Removed sorry"

		SummonBudokai1(mob/characters/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			set name= "Budokai Summon Spot 1"
			M.loc=locate(156,53,3)
			M <<"<b> YOUR TURN TO FIGHT!</b>"
		SummonBudokai2(mob/characters/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			set name= "Budokai Summon Spot 2"
			M.loc=locate(165,53,3)
			M <<"<b> YOUR TURN TO FIGHT!</b>"
		UnsummonBudokai(mob/characters/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			set name= "Budokai Unsummon"
			M.loc=locate(rand(151,170),59,3)
		HostBudokai()

			set category = "Police"
			set name = "Host Budokai"
			set desc = "Hosts a Tourney."
			for(var/mob/characters/M in world)
				M<<"<b>A BUDOKAI IS BEING HOSTED BY [usr].CLICK THE JOIN BUDOKAI VERB TO ENTER!</b>"
				M.verbs += /mob/tourneyjoin/verb/JoinBudokai
		EndBudokai()
			set category = "Police"
			set name = "End Budokai"
			set desc = "Ends a Tourney."
			for(var/mob/characters/M in world)
				M<<"<b>Enlisting time in the Budokai has ended"
				M.verbs -= /mob/tourneyjoin/verb/JoinBudokai
		Cleanall()
			set category = "Police"
			set name = "Clean All"
			set desc = "Cleans up all the Craters"
			for(var/obj/M in world)
				if(M.npc==4)
					del(M)
				if(M.npc==2)
					del(M)


		Restore(mob/M as mob in world)
			set category = "Police"
			set popup_menu = 1
			set name = "Restore Player"
			M << "<b>A bright light shines from above as you feel regenerated!"
			M.powerlevel = M.maxpowerlevel
			M.stamina = 100
			M.ki=M.maxki
			M.hp=M.maxhp
		Moon_Out()
			set category = "Police"
			set name = "Moon Out"
			for(var/mob/characters/M in world)
				if(M.race=="Saiya-jin"||M.race=="Halfbreed")
					M<<"The full moon has come out"
					M.verbs+=/mob/oozaru/verb/Turn_Oozaru
					if(M.maxpowerlevel>10000000)
						M.verbs+=/mob/oozaru/verb/Turn_SSJ_Oozaru
				if(M.maxpowerlevel>10000000 && M.race=="Tsufuru-jin" && M.evolution==3)
					M.verbs+=/mob/oozaru/verb/Turn_Bebi_Oozaru


		Purify(mob/M in world)
			set category = "Police"
			set popup_menu = 1
			M.alignment = "Good"
			M.loc=locate(207,195,1)
			M.safe = 0
			M << "<b>You feel that you can now be good!</b>"

		GiveShinobiband(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 1
			M.contents+= new /obj/Shinobiband

		GiveCustomgi(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			M.contents+= new /obj/Customgi

		GiveCustomunder(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			M.contents+= new /obj/Customunder
		GiveCustomsaiyajinarmor(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			M.contents+= new /obj/Customsaiyajinarmor


		CreateSpecialItemLimited()
			set name = "Create Special Item For Yourself"
			set category = "Police"
			switch(input("What type of Item is it?","Item Type",text) in list("Clothing/Overlay","Weapon","Aura/Underlay","None"))
				if("Clothing/Overlay")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>1)
						usr<<"Thats to many, 1 at a time is the max."
						ammount=10
					while(ammount>0)
						var/O=new/obj/SpecialItemPrototype
						O:SpecialIcon=econ
						O:name=name
						O:keylocked=usr.key
						usr.contents+= O
						ammount-=1
						sleep(1)

				if("Weapon")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>1)
						usr<<"Thats to many, 1 is the max."
						ammount=1
					while(ammount>0)
						var/O=new/obj/SpecialWeaponPrototype
						O:SpecialIcon=econ
						O:name=name
						O:keylocked=usr.key
						usr.contents+= O
						ammount-=1
						sleep(1)
				if("Aura/Underlay")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>1)
						usr<<"Thats to many, 1 is the max."
						ammount=1
					while(ammount>0)
						var/O=new/obj/SpecialUnderPrototype
						O:SpecialIcon=econ
						O:name=name
						O:keylocked=usr.key
						usr.contents+= O
						ammount-=1
						sleep(1)

		CreateSpecialItem()
			set name = "Create Special Item"
			set category = "Police"
			switch(input("What type of Item is it?","Item Type",text) in list("Clothing/Overlay","Weapon","Aura/Underlay","None"))
				if("Clothing/Overlay")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>10)
						usr<<"Thats to many, 10 is the max."
						ammount=10
					while(ammount>0)
						var/O=new/obj/SpecialItemPrototype
						O:SpecialIcon=econ
						O:name=name
						usr.contents+= O
						ammount-=1
						sleep(1)

				if("Weapon")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>10)
						usr<<"Thats to many, 10 is the max."
						ammount=10
					while(ammount>0)
						var/O=new/obj/SpecialWeaponPrototype
						O:SpecialIcon=econ
						O:name=name
						usr.contents+= O
						ammount-=1
						sleep(1)
				if("Aura/Underlay")
					var/econ = input("Enter the Name that coresponds to your custom icon","Icon Name") as text
					var/name = input("Enter Name:","Name") as text
					var/ammount= input("Amount","Amount") as num
					if(ammount>10)
						usr<<"Thats to many, 10 is the max."
						ammount=10
					while(ammount>0)
						var/O=new/obj/SpecialUnderPrototype
						O:SpecialIcon=econ
						O:name=name
						usr.contents+= O
						ammount-=1
						sleep(1)


		Create()
			set name = "Create Obj"
			set category = "Police"
			var/meeb= input("What do you want to make?","Create Object") in typesof(/obj)
			new meeb(locate(usr.x,usr.y-1,usr.z))
		CreateTurf()
			set name = "Create Turf"
			set category = "Police"
			var/meeb= input("What do you want to make?","Create Turf") in typesof(/turf)
			new meeb(locate(usr.x,usr.y-1,usr.z))
		Createmob()
			set name = "Create Mob"
			set category = "Police"
			var/meeb= input("What do you want to make?","Create Mob") in typesof(/mob)
			new meeb(locate(usr.x,usr.y-1,usr.z))
		Prices(mob/characters/M in world)
			set popup_menu = 1
			set category = "Police"
			switch(input("What would you like to give to them?","Prices",text) in list("Power Raise","Zenni Raise","Item","None","Embarrass"))
				if("Power Raise")
					var/amount = input("How much power do you wish to give them?", "Prices") as num|null
					var/oldmax=M.maxpowerlevel
					M.maxpowerlevel += amount
					var/bugnew2 = "[usr.client.address] / [usr.client.key] Boosted with Prices [M.name]/[M.key] ([M.currentipaddress]): Powerlevel by [amount], [M]'s old powerlevel was [oldmax], now its [M.maxpowerlevel]"
					var/bugfile = file2text("reports/editlog.html")
					var/file = "reports/editlog.html"
					while(saving_bugreport == 1)
						sleep(1)
					saving_bugreport = 1
					var/bugnew = "[usr.name]: [bugnew2]<br><br>"
					var/bugfinal = bugfile + bugnew
					fdel(file)
					text2file(bugfinal,file)
					bugfinal = null
					saving_bugreport = null

				if("Zenni Raise")
					var/amount = input("How much zenni do you wish to give them?","Prices") as num|null
					M.zenni += amount
					var/bugnew2 = "[usr.client.address] / [usr.client.key] Boosted with Prices [M.name]/[M.key] ([M.currentipaddress]): Zenni by [amount]"
					var/bugfile = file2text("reports/editlog.html")
					var/file = "reports/editlog.html"
					while(saving_bugreport == 1)
						sleep(1)
					saving_bugreport = 1
					var/bugnew = "[usr.name]: [bugnew2]<br><br>"
					var/bugfinal = bugfile + bugnew
					fdel(file)
					text2file(bugfinal,file)
					bugfinal = null
					saving_bugreport = null

				if("Embarrass")
					if(M.gm!=5)
						var/teext = input("What do you want to make them say over OOC?","Prices") as text|null
						world <<"<font color = teal>{{<font color = white>[M.oocname]<font color = teal>}<font color = silver>[M.rankname]<font color = teal>}<font color = green><tt>{{<font color = red>[M]<font color = green>}}<font color = white> OOCs:<font color = red> [html_encode(teext)]"
					else
						usr<<"Stop screwing around, dont embarass gms.. Punk."

		Oozarutrans()
			set category = "Police"
			usr.Go_Ozzura()
		Beetchshlap(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			set name = "Bitchslap"
			world << "<font size = 1><font color = silver>A hand decends from the heavens and starts bitchslapping [M]!!!!"
			M.powerlevel=0
		Mute(mob/characters/M in world, ID as text)
			set category = "Police"
			set popup_menu = 0
			set name = "Mute"
			world << "<font color=silver>A hand raises from hell and breaks <font color=red>[M] <font color=silver>jaw for <font color=red>[ID]"
			M.talk=0
			M.mute=1
		unMute(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			set name = "UnMute"
			world << "<font size = 1><font color = silver>[M] is unmuted..."
			M.talk=1
			M.mute=0
		unMuteAll()
			set category = "Police"
			set name = "UnMute World"
			world << "<font size = 1><font color = silver>The world has been unmuted..."
			for(var/mob/characters/M in world)
				M.talk=1
				M.mute=0
		MuteAll()
			set category = "Police"
			set name = "Mute World"
			world << "<font size = 1><font color = silver>The world has been muted by [usr]!"
			for(var/mob/characters/M in world)
				M.talk=0
				M.mute=1

		MakeBuu(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			set name = "Make Buu Demon"
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
			M.zenni = 0
			M.faceicon = 'default.dmi'
			M.kitech = "None"
			M.auratech = "None"
			M.kitechlearn = 0
			M.dead = 0
			M.auratechlearn = 0
			M.focustechlearn = 0
			M.kicolor = "None"
			M.focus = "None"
			M.stylename = "Majin"
			M.flightlearn = 0
			M.title = ""
			M.overlays = 0
			M.race = "Buu Demon"
			M.icon = 'buu.dmi'
			M.maxpowerlevel += rand(1,15000)
			M.verbs += new /mob/wrap/verb/Wrap()
			M.skillwrap=1
			M.skillregeneration=1
			M.skilluniversalscan=1
			M.skillkiabsorb=1
			M.skillkaioken=1
			M << "You awake as a Buu Demon."

		PowerHungrah()
			set category = "Police"
			set desc = "Who's being a fuck face?"
			var/plap = input("What do you want to search for?") as num|null
			for(var/mob/characters/M in world)
				if(M.maxpowerlevel >= plap)
					usr << "<b>[M.name]: [num2text(M.maxpowerlevel,100)]/[num2text(M.powerlevel,100)]: [M.key]"
				if(M.maxpowerlevel < plap)
					M.powerlevel += 0
		Delete(obj/O in oview(6))
			set category = "Police"
			del(O)
		sfc(mob/characters/M in oview(6))
			set popup_menu = 1
			set category = "Police"
			set name = "Strip, Freeze, and Cry"
			M.move=0
			world << "[M] is a feeegpopper!!!"

		WorldAuraOff()
			set category = "Police"
			set name = "World Aura Off"
			view(10) << "<font size = 1><font color = silver>All aura's has been turned off by [usr]!"
			for(var/mob/characters/M in world)
				M.underlays = 0

		MadSkills(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
			/*M.verbs += /mob/spiritbomb/verb/sbomb
			M.verbs += /mob/Kamehameha/verb/Kamehameha
			M.verbs += /mob/BigBang/verb/BigBang
			M.verbs += /mob/Renzuko/verb/Renzuko
			M.verbs += /mob/FinalFlash/verb/FinalFlash
			M.verbs += /mob/Tayioken/verb/Tayioken
			M.verbs += /mob/Zanzoken/verb/Zanzoken
			M.verbs += /mob/GalacticDonut/verb/GalacticDonut
			M.verbs += /mob/Burning/verb/Burning
			M.verbs += /mob/SpecialBeamCannon/verb/SpecialBeamCannon
			M.verbs += /mob/Masenko/verb/Masenko
			M.verbs += /mob/DonDonPa/verb/DonDonPa
			M.verbs += /mob/worldscan/verb/World_Scan
			M.verbs += /mob/uniscan/verb/Uni_Scan
			M.verbs += /mob/FusionDance/verb/Fuse
			M.verbs += /mob/wrap/verb/Wrap
			M.verbs += /mob/kiabsorb/verb/Ki_Absorb
			M.verbs += /mob/regen/verb/Regeneration
			M.verbs += /mob/bukujutsu/verb/bukujutsu
			M.verbs += /mob/aura/verb/powerup
			M.verbs += /mob/aura/verb/powerdown
			M.verbs += /mob/Kaioken/verb/Kaioken
			M.verbs += /mob/focus/verb/Focus
	//		M.verbs += /mob/telepath/verb/Telepath
			M.verbs += /mob/kienzan/verb/Kienzan
			M.verbs += /mob/it/verb/Instant_Transmission
			M.skillbukujutsu=1
			M.skilltechwork=1
			M.skillworldscan=1
			M.skillkiabsorb=1
			M.skillandroidtransform=1
			M.skillsupernamek=1
			M.skillsense=1
			M.skilltelepath=1
			M.skillenrage=1
			M.skillkiblast=1
			M.skillrenzukoenergydan=1
			M.skillfocus=1
			M.skillssj=1
			M.skillkaioken=1
			M.skillspiritbomb=1
			M.skillit=1
			M.skillsolarflare=1
			M.skilldondonpa=1
			M.skillfinalflash=1
			M.skillbigbangattack=1
			M.skillkamehameha=1
			M.skillburningattack=1
			M.skillpowerup=1
			M.skillabsorb=1
			M.skillwrap=1
			M.skillregeneration=1
			M.skilluniversalscan=1
			M.skillgalacticdonut=1
			M.skillmasenko=1
			M.skillspecialbeamcannon=1
			M.skillzanzoken=1
			M.verbs+=/mob/Absorb/verb/Absorb
			M.verbs+=/mob/celltransform/verb/Transform
			M.verbs+=/mob/Bebi/verb/BebiTransform
			M.verbs+=/mob/Bebi/verb/Revert
			M.verbs+=/mob/SuperNamek/verb/SN
			M.verbs+=/mob/SuperNamek/verb/Revert
			M.verbs+=/mob/sense/verb/Sense
			M.verbs+=/mob/ssj/verb/Transform
			M.verbs+=/mob/ssj/verb/Revert
		//	M.verbs+=/mob/telepath/verb/Telepath
			M.verbs+=/mob/transform/verb/Transform
			M.verbs+=/mob/Unlockpower/verb/Unlockpotential
			M.verbs+=/mob/Unlockpower/verb/Revert
//			M.verbs+=/mob/enrage/verb/Enrage
			M.verbs+=/mob/kiblast/verb/kiblast
			M.verbs+=/mob/AndroidTransform/verb/AndroidTransform
			M.verbs+=/mob/techwork/verb/Tech_Workings
			M.verbs += /mob/Kamehameha/verb/Kamehameha
			M.verbs += /mob/spiritbomb/verb/sbomb
			M.verbs += /mob/BigBang/verb/BigBang
			M.verbs += /mob/Renzuko/verb/Renzuko
			M.verbs += /mob/FinalFlash/verb/FinalFlash
			M.verbs += /mob/Tayioken/verb/Tayioken
			M.verbs += /mob/Zanzoken/verb/Zanzoken
			M.verbs += /mob/GalacticDonut/verb/GalacticDonut
			M.verbs += /mob/Burning/verb/Burning
			M.verbs += /mob/SpecialBeamCannon/verb/SpecialBeamCannon
			M.verbs += /mob/Masenko/verb/Masenko
			M.verbs += /mob/DonDonPa/verb/DonDonPa
			M.verbs += /mob/worldscan/verb/World_Scan
			M.verbs += /mob/uniscan/verb/Uni_Scan
			M.verbs += /mob/FusionDance/verb/Fuse
			M.verbs += /mob/wrap/verb/Wrap
			M.verbs += /mob/kiabsorb/verb/Ki_Absorb
			M.verbs += /mob/regen/verb/Regeneration
			M.verbs += /mob/bukujutsu/verb/bukujutsu
			M.verbs += /mob/aura/verb/powerup
			M.verbs += /mob/aura/verb/powerup
			M.verbs += /mob/Kaioken/verb/Kaioken
			M.verbs += /mob/it/verb/Instant_Transmission
			M << "Cool."
			*/


		Funkalize(mob/M in view(10))
			set category = "Police"
			set popup_menu = 0
			var/red = input("Choose RED 0-255", "RED") as num
			var/green = input("Choose GREEN 0-255", "GREEN") as num
			var/blue = input("Choose BLUE 0-255", "BLUE") as num
			M.icon += rgb(red,green,blue)

		FunkalizeO(obj/O in oview(10))
			set category = "Police"
			set popup_menu = 0
			var/red = input("Choose RED 0-255", "RED") as num
			var/green = input("Choose GREEN 0-255", "GREEN") as num
			var/blue = input("Choose BLUE 0-255", "BLUE") as num
			O.icon += rgb(red,green,blue)
		FunkalizeT(turf/T in oview(10))
			set category = "Police"
			set popup_menu = 0
			var/red = input("Choose RED 0-255", "RED") as num
			var/green = input("Choose GREEN 0-255", "GREEN") as num
			var/blue = input("Choose BLUE 0-255", "BLUE") as num
			T.icon += rgb(red,green,blue)

		AllSay(msg as text)
			set category = "Police"
			usr<<"Removed due to large population"
		//	for(var/mob/characters/M in world)
			//	world <<"<font color = teal>{{<font color = white>OOC<font color = teal>}}<font color = green><tt>{{<font color = red>[M]<font color = green>}}<font color = white> : [msg]"

		Inform(msg as text)
			set category = "Police"
			world << "<font face = Arial><u>INFO</u>:<font face = New Times Roman><font color = red> [msg]"
		ChangeIcon()
			set category = "Police"
			switch(input("Change icon?.", "Icon", text) in list ("Yes", "No"))
				if("Yes")
					var/econ = input("Pick icon:","Icon") as icon
					if(check_icon(econ))
						var/facesize=length(econ)
						if(facesize<=300000)
							usr.icon = econ
						else
							usr<<"To big."
					else
						usr<<"That was a corrupt icon"
		ChangeOthersIcon(mob/characters/M in world)
			set category = "Police"
			set popup_menu = 0
		/*	switch(input("Change icon?.", "Icon", text) in list ("Yes", "No"))

				if("Yes")
					var/econ = input("Pick icon:","Icon") as icon
					M.icon = econ*/
		Revive(mob/M in world)
			set category = "Police"
			set popup_menu = 1
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
				M.loc=locate(74,35,10)
		Unfuseall()
			set category="Police"
			for(var/mob/characters/M in world)
				M.fusedtime=1
				M <<"Time speeds up"
		Edit(atom/movable/O in world)
			set desc = "(object) Modify/examine the variables of any object"
			set category = "Police"
			set popup_menu = 1
			var/html = "<html><body bgcolor=black text=#CCCCCC link=white vlink=white alink=white></html>"
			var/variables[0]

			html += "<h3 align=center>[O.name] ([O.type])</h3>"
			html += "<table width=100%>\n"
			html += "<tr>"
			html += "<td>VARIABLE NAME</td>"
			html += "<td>PROBABLE TYPE</td>"
			html += "<td>CURRENT VALUE</td>"
			html += "</tr>\n"
			for(var/X in O.vars) variables += X
			//Protect the key var for mobs, since that's a pretty important var!
			variables -= "key"
			variables -= "gm"
			variables -= "gmlevel"
			if(usr.key!="Masterdan")
				usr.powerlevel+=0
			for(var/X in variables)
				html += "<tr>"
				html += "<td><a href=byond://?src=\ref[O];action=edit;var=[X]>"
				html += X
				html += "</a>"
				if(!issaved(O.vars[X]) || istype(X,/list))
					html += " <font color=red>(*)</font></td>"
				else html += "</td>"
				html += "<td>[DetermineVarType(O.vars[X])]</td>"
				html += "<td>[DetermineVarValue(O.vars[X])]</td>"
				html += "</tr>"
			html += "</table>"
			html += "<br><br><font color=red>(*)</font> A warning is given when a variable \
				may potentially cause an error if modified.  If you ignore that warning and \
				continue to modify the variable, you alone are responsible for whatever \
				mayhem results!</body></html>"
			usr << browse(html)

atom/movable
	Topic(href,href_list[])
		switch(href_list["action"])
			if("edit")
				var/variable = href_list["var"]
				var/class = input(usr,"Change [variable] to what?","Variable Type") as null|anything \
					in list("text","num","type","reference","icon","file","restore to default")
				if(!class) return
				switch(class)
					if("restore to default")

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name] ([src.currentipaddress]):[variable] to its default"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
						src.vars[variable] = initial(src.vars[variable])
					if("text")
						var/before=src.vars[variable]
						src.vars[variable] = input("Enter new text:","Text",src.vars[variable]) as text
						var/after=src.vars[variable]

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name]  ([src.currentipaddress]):[variable]:[before] to [after]"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
					if("num")
						var/before=src.vars[variable]
						src.vars[variable] = input("Enter new number:","Num",src.vars[variable]) as num
						var/after=src.vars[variable]

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name]  ([src.currentipaddress]):[variable]:[before] to [after]"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
					if("type")
						src.vars[variable] = input("Enter type:","Type",src.vars[variable]) \
							in typesof(/atom)

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name]  ([src.currentipaddress]):[variable]'s type"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
					if("reference")
						var/before=src.vars[variable]
						src.vars[variable] = input("Select reference:","Reference", \
							src.vars[variable]) as mob|obj|turf|area in world
						var/after=src.vars[variable]

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name]  ([src.currentipaddress]):[variable]:[before] to [after]"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
					if("file")
						var/before=src.vars[variable]
						src.vars[variable] = input("Pick file:","File",src.vars[variable]) \
							as file
						var/after=src.vars[variable]

						var/bugnew2 = "[usr.client.address] / [usr.client.key]  Edited [src.name]  ([src.currentipaddress]):[variable]:[before] to [after]"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
					if("icon")
						var/before=src.vars[variable]
						src.vars[variable] = input("Pick icon:","Icon",src.vars[variable]) \
							as icon
						var/after=src.vars[variable]

						var/bugnew2 = "[usr.client.address] / [usr.client.key] Edited [src.name]  ([src.currentipaddress]):[variable]:[before] to [after]"
						var/bugfile = file2text("reports/editlog.html")
						var/file = "reports/editlog.html"
						while(saving_bugreport == 1)
							sleep(1)
						saving_bugreport = 1
						var/bugnew = "[usr.name]: [bugnew2]<br><br>"
						var/bugfinal = bugfile + bugnew


						fdel(file)
						text2file(bugfinal,file)
						bugfinal = null
						saving_bugreport = null
		. = ..()

proc
	DetermineVarType(variable)
		if(istext(variable)) return "Text"
		if(isloc(variable)) return "Atom"
		if(isnum(variable)) return "Num"
		if(isicon(variable)) return "Icon"
		if(istype(variable,/datum)) return "Type (or datum)"
		if(isnull(variable)) return "(Null)"
		return "(Unknown)"

proc
	DetermineVarValue(variable)
		if(istext(variable)) return "\"[variable]\""
		if(isloc(variable)) return "<i>[variable:name]</i> ([variable:type])"
		if(isnum(variable))
			return variable
		if(isnull(variable)) return "null"
		return "- [variable] -"
