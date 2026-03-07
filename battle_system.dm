mob/test
	density=0
mob
	CustomAttackCPL
		verb
			Create_Move()
				set category = "Fighting"
				set name="-Create Move-"
				if(usr.creatingattack==0&&usr.ingero==0)
					usr.move=0
					usr.creatingattack=-1
					spawn(50)
						usr.creatingattack=1
						usr.move=1
						usr.memloc[1]=usr.x
						usr.memloc[2]=usr.y
						usr.memloc[3]=usr.z
						usr.memloct=1
						sleep(1)
						usr.loc=locate(151,168,21)
						usr.customcpl[3]=1
						usr.invisibility=1
						usr.statbars=0
						var/covericon
						for(var/obj/staminabar/S in usr.client.screen)
							S.icon_state="inv"
						for(var/obj/healthbar/H in usr.client.screen)
							H.icon_state="inv"
						for(var/obj/kibar/K in usr.client.screen)
							K.icon_state="inv"
						for(var/obj/damagenumber/D in usr.client.screen)
							D.icon_state="inv"
						for(var/obj/colorblock1/X1 in world)
							usr:client << X1.coverimage
						for(var/obj/colorblock2/X2 in world)
							usr:client << X2.coverimage
						for(var/obj/headblock/X3 in world)
							covericon='custom_head1.dmi'
							var/image/trailicon/coverimagex=image(covericon,X3,"",6,NORTH)
							usr:client << coverimagex
						for(var/obj/trailblock/X4 in world)
							covericon='custom_trail1.dmi'
							var/image/trailicon/coverimagey=image(covericon,X4,"",6,NORTH)
							usr:client << coverimagey
						usr.customcpl[17]=1
						usr.customcpl[18]=1
						usr.customcpl[9]=1
						usr.customcpl[10]=1
						usr.customcpl[19]='custom_head1.dmi'
						usr.customcpl[20]='custom_trail1.dmi'
						usr.customcpl[1]=3

				else
					usr<<"Hey, your already making an attack."
mob
	NPCs
		npc = 1
		Goku
			icon = 'mobs.dmi'
			icon_state = "Goku"
		Gohan
			icon = 'mobs.dmi'
			icon_state = "gohan"
		Videl
			icon = 'mobs.dmi'
			icon_state = "videl"
		Chichi
			icon = 'Dragonball icons.dmi'
			icon_state = "ChiChi"
		Goten
			icon='Dragonball Icons.dmi'
			icon_state="Goten"
		Yamcha
			icon='Dragonball Icons.dmi'
			icon_state="Yamcha2"
		Puar
			icon='Dragonball Icons.dmi'
			icon_state="Puar"
		Tien
			icon = 'mobs.dmi'
			icon_state = "tienshinhan"
		Choutzu
			icon='Dragonball Icons.dmi'
			icon_state="Chozou"
		Vegeta
			icon = 'mobs.dmi'
			icon_state = "Vegeta"
		Trunks
			icon='Dragonball Icons.dmi'
			icon_state="Trunks5"
		Bulma
			icon = 'mobs.dmi'
			icon_state = "bulma"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hi, Would you like to buy a Dragonball Radar for 1000z?", "Bulma",text) in list ("Yes (1000z)","Explain the Dragonballs","Nevermind"))
						if("Yes (1000z)")
							if(usr.zenni <= 999)
								usr << "<b>You need 1000 zenni!"
							if(usr.zenni >= 1000)
								usr << "<b>You get a Dragon Radar!"
								usr.contents += new /obj/dragonradar
								usr.zenni -= 1000
						if("Explain the Dragonballs")
							usr<<"There are 7 Dragonballs hidden around Earth, leaving the main map will cause you to drop whatever Dragonballs you have.  Dying will also cause you to drop Dragonballs, So with a DragonRadar you can hunt out each Dragonball and choose from many incredible wishes such as Immortality, Power, Wealth, Entrance to the sacred Kaoshin planet, or something silly. "
		Piccolo
			icon = 'mobs.dmi'
			icon_state = "Piccolo"
		Roshi
			icon = 'mobs.dmi'
			icon_state = "roshi"
		Briefs
			icon = 'mobs.dmi'
			icon_state = "briefs"
		Krillin
			icon='Dragonball Icons.dmi'
			icon_state="Krillin"
		Android18
			icon = '18.dmi'
			icon_state = "18"

mob
	verb
		ForgetSkill()
			set category="Fighting"
			set name= "-Forget Skill-"
			var/one = "Slot 1 ([usr.customattacks[1]])"
			var/two = "Slot 2 ([usr.customattacks[2]])"
			var/three = "Slot 3 ([usr.customattacks[3]])"
			var/four = "Slot 4 ([usr.customattacks[4]])"
			var/five = "Slot 5 ([usr.customattacks[5]])"
			var/six = "Slot 6 ([usr.customattacks[6]])"
			var/seven = "Slot 7 ([usr.customattacks[7]])"
			var/eight = "Slot 8 ([usr.customattacks[8]])"
			var/nine = "Slot 9 ([usr.customattacks[9]])"
			var/ten = "Slot 10 ([usr.customattacks[10]])"
			var/cancel="Cancel"
			var/list/menu = new()
			menu += one
			menu += two
			menu += three
			menu += four
			menu += five
			menu += six
			menu += seven
			menu += eight
			menu += nine
			menu += ten
			menu += cancel
			var/numchoose=0
			var/result = input("Forget which skill?", ".Forget attack") in menu
			if(result==one)
				numchoose=1
				usr.verbs-=new/mob/Customattack/verb/custom_1
			if(result==two)
				numchoose=2
				usr.verbs-=new/mob/Customattack/verb/custom_2
			if(result==three)
				numchoose=3
				usr.verbs-=new/mob/Customattack/verb/custom_3
			if(result==four)
				numchoose=4
				usr.verbs-=new/mob/Customattack/verb/custom_4
			if(result==five)
				numchoose=5
				usr.verbs-=new/mob/Customattack/verb/custom_5
			if(result==six)
				numchoose=6
				usr.verbs-=new/mob/Customattack/verb/custom_6
			if(result==seven)
				numchoose=7
				usr.verbs-=new/mob/Customattack/verb/custom_7
			if(result==eight)
				numchoose=8
				usr.verbs-=new/mob/Customattack/verb/custom_8
			if(result==nine)
				numchoose=9
				usr.verbs-=new/mob/Customattack/verb/custom_9
			if(result==ten)
				numchoose=10
				usr.verbs-=new/mob/Customattack/verb/custom_10
			if(result==cancel)
				return
			fdel("attacks/[usr.customattacks[numchoose]].sav")

			usr.customattacks[numchoose]=0
			usr.verbs-=typesof(/mob/Customattack/verb)
			spawn()usr.refreshcustomverbs()

mob
	verb
		TeachSkill(mob/characters/M)
			set category="Fighting"
			set popup_menu = 0
			set name= "-Teach Skill-"
			if(M.client)
				var/one = "Slot 1 ([usr.customattacks[1]])"
				var/two = "Slot 2 ([usr.customattacks[2]])"
				var/three = "Slot 3 ([usr.customattacks[3]])"
				var/four = "Slot 4 ([usr.customattacks[4]])"
				var/five = "Slot 5 ([usr.customattacks[5]])"
				var/six = "Slot 6 ([usr.customattacks[6]])"
				var/seven = "Slot 7 ([usr.customattacks[7]])"
				var/eight = "Slot 8 ([usr.customattacks[8]])"
				var/nine = "Slot 9 ([usr.customattacks[9]])"
				var/ten = "Slot 10 ([usr.customattacks[10]])"
// Make it 5 slots, lets make it harder to choose.... and easier on server load...
				var/cancel="Cancel"
				var/list/menu = new()
				menu += one
				menu += two
				menu += three
				menu += four
				menu += five
				menu += six
				menu += seven
				menu += eight
				menu += nine
				menu += ten
				menu += cancel
				var/numchoose=0
				var/result = input("Choose a skill save slot", ".Teach attack") in menu
				if(result==one)
					numchoose=1
				if(result==two)
					numchoose=2
				if(result==three)
					numchoose=3
				if(result==four)
					numchoose=4
				if(result==five)
					numchoose=5
				if(result==six)
					numchoose=6
				if(result==seven)
					numchoose=7
				if(result==eight)
					numchoose=8
				if(result==nine)
					numchoose=9
				if(result==ten)
					numchoose=10
				if(result==cancel)
					return
				var/savefile/F = new("attacks/[usr.customattacks[numchoose]].sav")
				var/type
				var/name
				var/range
				var/strength
				var/head
				var/trail
				var/knockback
				var/peircing
				var/skilllevel
				var/speed
				var/saybefore
				var/sayafter
				var/icon
				F["type"]>>type
				F["name"]>>name
				F["range"]>>range
				F["strength"]>>strength
				F["icon"]>>head
				F["trail"]>>trail
				F["knockback"]>>knockback
				F["peircing"]>>peircing
				F["skilllevel"]>>skilllevel
				F["speed"]>>speed
				F["saybefore"]>>saybefore
				F["sayafter"]>>sayafter
				F["type"]>>type
				F["icon"]>>icon
				switch(input(M,"[usr] has offered to teach you a skill: [name]/ skill level:[skilllevel]","learn [name]?") in list("Yes","No"))
					if("Yes")
						var/canlearn=0
						if(skilllevel==1&&M.maxpowerlevel>=5000)
							canlearn=1

						if(skilllevel==2&&M.maxpowerlevel>=50000)
							canlearn=1

						if(skilllevel==3&&M.maxpowerlevel>=250000)
							canlearn=1

						if(skilllevel==4&&M.maxpowerlevel>=750000)
							canlearn=1

						if(skilllevel==5&&M.maxpowerlevel>=1500000)
							canlearn=1

						if(skilllevel==6&&M.maxpowerlevel>=5000000)
							canlearn=1

						if(skilllevel==7&&M.maxpowerlevel>=10000000)
							canlearn=1

						if(canlearn==1)
							var/on = "Slot 1 ([M.customattacks[1]])"
							var/tw = "Slot 2 ([M.customattacks[2]])"
							var/thre = "Slot 3 ([M.customattacks[3]])"
							var/fou = "Slot 4 ([M.customattacks[4]])"
							var/fiv = "Slot 5 ([M.customattacks[5]])"
							var/si = "Slot 6 ([M.customattacks[6]])"
							var/seve = "Slot 7 ([M.customattacks[7]])"
							var/eigh = "Slot 8 ([M.customattacks[8]])"
							var/nin = "Slot 9 ([M.customattacks[9]])"
							var/te = "Slot 10 ([M.customattacks[10]])"
							var/list/menu2 = new()
							menu2 += on
							menu2 += tw
							menu2 += thre
							menu2 += fou
							menu2 += fiv
							menu2 += si
							menu2 += seve
							menu2 += eigh
							menu2 += nin
							menu2 += te


							var/result2 = input(M,"Choose a skill save slot", ".Custom attack") in menu2
							if(result2==on)
								M.customattacks[1]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_1
							if(result2==tw)
								M.customattacks[2]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_2
							if(result2==thre)
								M.customattacks[3]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_3
							if(result2==fou)
								M.customattacks[4]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_4
							if(result2==fiv)
								M.customattacks[5]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_5
							if(result2==si)
								M.customattacks[6]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_6
							if(result2==seve)
								M.customattacks[7]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_7
							if(result2==eigh)
								M.customattacks[8]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_8
							if(result2==nin)
								M.customattacks[9]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_9
							if(result2==te)
								M.customattacks[10]="[M.ckey].[name]"
						//		M.verbs+=new/mob/Customattack/verb/custom_10
							M.verbs-=typesof(/mob/Customattack/verb)
							spawn()M.refreshcustomverbs()
							var/savefile/G = new("attacks/[M.ckey].[name].sav")
							G["icon"]<<icon
							G["trail"]<<trail
							G["knockback"]<<knockback
							G["name"]<<name
							G["peircing"]<<peircing
							G["range"]<<range
							G["skilllevel"]<<skilllevel
							G["speed"]<<speed
							G["strength"]<<strength
							G["saybefore"]<<saybefore
							G["sayafter"]<<sayafter
							G["type"]<<type
							M<<"You have learned [name]!!"
							usr<<"[M] has learned [name]!"
						else
							usr<<"[M] isnt strong enough to learn a skill of that level (level:[skilllevel])"
							M<<"You arent strong enough to learn a skill of that level (level:[skilllevel])"


client/preload_rsc = "http://homepages.ucalgary.ca/~ddvankam/byond/Gekisen_rsc6.zip"
client
	script = "<STYLE>BODY {background: black; color: white}</STYLE>"

	proc
		Saveloop()
			sleep(600)
			if(istype(src.mob,/mob/characters))
				SaveMob(src)
			sleep(600)
			spawn()Saveloop()

mob/proc/HtmlLayout()
	return \
	{"<html><b><center><body bgcolor=black><font color=white><u><font size=5><font face=verdana>Staff of Dragonball Gekisen:<br><br>
	<font color=red><font size=3></center></u>Masterdan:<font color = white><br><font size = 2> Main Coder<br>Owner<br><br><font size = 3><font color = red>Cyberpirate:<font color = white><br><font size = 2>Host and good guy :)<br><br><font color = Silver>Tye:<font color = white><br><font size = 2>Icon maker and level maker.<br><br><br><font face=arial><font size=1><font color=silver>Browser Function By: Masterdan</html>"}
	return


mob/proc/WeReport()
	return \
	{"<html><b><center><body bgcolor=black><font color=white><font size=5><font face=verdana>How to report a bug:<br><br><font size = 1><font color = silver></u>To report a bug, email  <a href=mailto:danvk@shaw.ca>Masterdan</a>  with the title - 'Bug Report'."}
	return
mob
	verb
		AttackNormal(mob/M in get_step(src,src.dir))
			set category = "Combat"
			set name = "Pinpoint Blow"
			if (istype(src, /mob/other)||istype(src, /mob/tester)||istype(src, /mob/bubb)||M.npc==1||M.npc==10)
				return
			else
				if(src.cooldown==1||src.cooldown==0)
					if(M.hp>=0&&src.cooldown==0)
						src << "..HA!!!"
						goto den
					else
						src << "....Ugh!!"
					/*	var/powerratio = (src.owner:powerlevel)
						powerratio/=src.owner:maxpowerlevel
						powerratio/=2
						powerratio=150*/
					den
						if(src.maxpowerlevel>(M.maxpowerlevel*2)||M.hp<35||M.conc<(src.conc)&&M.hp<M.maxhp/3)

							flick("sparkick",src)
							if(src.sounds==1)
								spawn()src<<'sounds/punchhit.wav'
							if(M.sounds==1)
								spawn()M<<'sounds/punchhit.wav'
							flick("sparpunch",src)
							M << "\red [src] Attacks you and sends you flying back!"
							src << "\red You Attack [M] with a Critical Hit!"
							var/FallDir = get_dir(src,M)
							src.dir = FallDir
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
							M.frozen-=1
							flick("zan",src)

							if(usr.sounds==1)
								spawn()usr<<'sounds/teleport.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'sounds/teleport.wav'
							src.loc=M.loc
							spawn()M.KO()
							spawn()src.Finish(M)
							spawn()
								M.frozen+=1
							M.hp -= round((src.maxhp/5) * 2)
						src.cooldown = 1
						sleep(30)
						src.cooldown = 0
mob
	var
		lifecycle_delay = 50
		movement_probability = 50


	proc
		Attack(mob/M)
			set background=1
			var/randomx = rand(1,3)
			if(src.ss==0||M.ss==0)
				src.SuperSonicStart(M)
			if(randomx==1)
		 	spawn()
					if(src.attackturn==1)
						sleep(10)
						src.attackturn=0
						sleep(rand(70,100))
						M.attackturn=1
					if(src.attackturn==0)
						sleep(100)
						if(src.attackturn==0)
							sleep(100)
							if(src.attackturn==0)
								sleep(100)
								src.attackturn = 1

				var/damage = src.powerlevel
				if(src&&M)
					M.TakeDamage(src, damage)

	proc
		SuperSonicCheck(mob/M in get_step(src,src.dir))
			if(src.ss==0&&M.ss==0)
				if(src.dir==NORTH&&M.dir==SOUTH)
					src.ss=1
					return TRUE
				if(src.dir==SOUTH&&M.dir==NORTH)
					src.ss=1
					return TRUE
				if(src.dir==EAST&&M.dir==WEST)
					src.ss=1
					return TRUE
				if(src.dir==WEST&&M.dir==EAST)
					src.ss=1
					return TRUE
				if(src.dir==NORTHEAST&&M.dir==SOUTHWEST)
					src.ss=1
					return TRUE
				if(src.dir==SOUTHWEST&&M.dir==NORTHEAST)
					src.ss=1
					return TRUE
				if(src.dir==NORTHWEST&&M.dir==SOUTHEAST)
					src.ss=1
					return TRUE
				if(src.dir==SOUTHEAST&&M.dir==NORTHWEST)
					src.ss=1
					return TRUE
			else
				return FALSE
		SuperSonicStart(mob/M,Times=2)
			set background=1
			var/turf/L1=src.loc
			var/turf/L2=M.loc
			src.doing=1
			M.doing=1
			var/t=Times
			Repeat
			if(t)
				t-=1
				sleep(7)
				if(prob(50))
					spawn(1)
						if(src.sounds==1)
							spawn()src<<'meleestruggleinit.ogg'
						if(M.sounds==1)
							spawn()M<<'strong_hit_01.ogg'
							if(usr.sounds==1)
								spawn()src<<'sounds/teleport.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'meleeflash.ogg'

						for(var/area/outside/Y in view(5))
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside2/D in view(5))
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							D.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside3/K in view(5))
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							K.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside4/G in view(5))
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							G.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						flick("attack",src)
						flick("zan",M)
						flick("zan",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						flick("attack",src)
						flick("IT",M)
						flick("IT",src)
						flick("attack",M)
						if(src.sounds==1)
							spawn()src<<'meleestruggleinit.ogg'
						if(M.sounds==1)
							spawn()M<<'strong_hit_01.ogg'
							if(usr.sounds==1)
								spawn()src<<'sounds/teleport.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'meleeflash.ogg'
										spawn()L<<'sounds/teleport.wav'

						for(var/area/outside/Y in view(5))
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside2/D in view(5))
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							D.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside3/K in view(5))
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							K.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside4/G in view(5))
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							G.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(12)
				src.loc=L1
				M.loc=L2
				sleep(12)
				if(prob(50))
					spawn(1)
					if(src.sounds==1)
						spawn()src<<'meleestruggleinit.ogg'
						if(M.sounds==1)
							spawn()M<<'meleeflash.ogg'
							if(usr.sounds==1)
								spawn()src<<'sounds/teleport.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'strong_hit_01.ogg'
					for(var/area/outside/Y in view(5))
						Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect

					for(var/area/outside2/D in view(5))
						D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						D.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						D.icon= 'blank.dmi'	// add a 25% dither for a fading effect

					for(var/area/outside3/K in view(5))
						K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						K.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						K.icon= 'blank.dmi'	// add a 25% dither for a fading effect

					for(var/area/outside4/G in view(5))
						G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
						G.icon= 'white.dmi'	// add a 25% dither for a fading effect
						sleep(2)
						G.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						flick("attack",src)
						flick("zan",M)
						flick("zan",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						flick("attack",src)
						flick("zan",M)
						flick("zan",src)
						flick("attack",M)
						if(src.sounds==1)
							spawn()src<<'strong_hit_01.ogg'
						if(M.sounds==1)
							spawn()M<<'meleeflash.ogg'
							if(usr.sounds==1)
								spawn()src<<'sounds/teleport.wav'
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'meleestruggleinit.ogg'
										spawn()L<<'sounds/teleport.wav'
						for(var/area/outside/Y in view(5))
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							Y.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							Y.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside2/D in view(5))
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							D.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							D.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside3/K in view(5))
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							K.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							K.icon= 'blank.dmi'	// add a 25% dither for a fading effect

						for(var/area/outside4/G in view(5))
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
							G.icon= 'white.dmi'	// add a 25% dither for a fading effect
							sleep(2)
							G.icon= 'blank.dmi'	// add a 25% dither for a fading effect
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(12)
				src.loc=L1
				M.loc=L2
				src.doing=0
				M.doing=0
				src.frozen=0
				M.frozen=0
				if(t)
					goto Repeat
				else
					src.doing=0
					M.doing=0
					src.frozen=0
					M.frozen=0
					src.ss=1
					M.ss=1
			else
				src.doing=0
				M.doing=0
				src.frozen=0
				M.frozen=0
		Special(mob/M)
			if(findText("[src.owner]","[M.name]")==0)
				var/damage = src.powerlevel/3
				damage=(damage/(M.powerlevel+1))*10
				var/custommissile='kamex.dmi'
				sleep(3)
				view(6)<<"[src.nkispeech]"
				sleep(3)
				custommissile+=rgb(src.ncustomred,src.ncustomgreen,src.ncustomblue)
				s_missile(custommissile, src, M)
				M.hp-=damage
				if(M.hp<=0)
					spawn()M.Die()


		TakeDamage(mob/attacker, damage)
			set background=1
			src=attacker
			var/mob/T=locate() in get_step(attacker,attacker.dir)
			if (istype(src, /mob/other))
				return
			else
				if(src.ss==0)
					src.SuperSonicStart(T)
					return
				if(attacker.owner!=src.name||attacker.mode=="Training"&&attacker)
					attacker.counter=0
					if(attacker.airpunch==1)
						if(attacker.attacking==0 && attacker.ko==0 && attacker.powerlevel>0)
							attacker=src
							src.attacking=1
							var/rr=rand(1,2)
							if(attacker.weapon==1)
								rr=1
								attacker=src
								src.attacking=1
							if(rr==1)
								flick("sparfury",attacker)
								attacker=src
								src.attacking=1
							if(rr==2)
								flick("sparkick",attacker)
								attacker=src
								src.attacking=1



							attacker.attacking=1
							var/mob/M=locate() in get_step(attacker,attacker.dir)
							if(M && M!=attacker) //Que?
							if(src.SuperSonicCheck(M)==TRUE||src.ss==0)
								src.SuperSonicStart(M)
								return
								if(M.nopk==1||attacker.nopk==1)
									attacker<<"This is a no pk zone."
								if(M.nopk==0&&attacker.nopk==0)
									if(istype(M,/mob/monsters/people/randomperson))
										M.Retreat(attacker)
									if(M.creator==1)
										attacker<<"FOOL DONT YOU KNOW THAT I AM THE ALMIGHTY CREATOR?!"
									else
										if(istype(M,/mob/characters)||istype(M,/mob/monsters))
											if(M.ko == 1)
												attacker << "<b>You need to finish him for that."
											if(M.ko == 0)
												if(attacker.ko == 1||attacker.hp==0)
													attacker << "<b>Not while you are knocked out."
												if(attacker.ko == 0&&attacker.powerlevel>0)
													if(attacker.safe == 2)
														attacker << "<b>Not while in a safe area."
													if(attacker.z==10||attacker.z==2&&M.dead==1||attacker.z==3&&attacker.x<140&&M.dead==1||attacker.z==12&&M.dead==1)
														attacker << "<b>They are in a safe area."
													else
														if(M.powerlevel==0)
															M.powerlevel=1
														if(rr==2)
															if(attacker.sounds==1)
																spawn()attacker<<'sounds/kickhit.wav'
															if(M.sounds==1)
																spawn()M<<'sounds/kickhit.wav'
														if(rr==1&&attacker.weapon==0)
															if(attacker.sounds==1)
																spawn()attacker<<'sounds/punchhit.wav'
															if(M.sounds==1)
																spawn()M<<'sounds/punchhit.wav'
														if(rr==1&&attacker.weapon==1)
															if(attacker.sounds==1)
																spawn()attacker<<'slash.wav'
															if(M.sounds==1)
																spawn()M<<'slash.wav'
														var/damg=((attacker.powerlevel)/(M.powerlevel))*2
														if(damg <1)
															damg=1+attacker.strength/(M.defense+M.strength)
														if(damg>40)
															damg=40+attacker.strength/(M.defense+M.strength)
														M<<"<font color = #F19B2E>You were hit for [damg] damage by [attacker]</font>"
														attacker<<"<font color = #FFBA00>You hit [M] for [damg] damage</font>"
														M.hp -= damg
														src=attacker
														if(istype(M,/mob/monsters))
															M.Die()
														else
															M.KO()
														if(attacker.attackturn==1)
															attacker.attackturn=0
															spawn()
																var/gainbonus = attacker.maxpowerlevel
																if(gainbonus>50000000)
																	gainbonus=5000000
																attacker.maxpowerlevel += (gainbonus / 4000)+rand(1,10)
																sleep(rand(30,50))
																if(M)
																	if(M.attackturn==0)
																		M.attackturn=1
																if(attacker.attackturn==0)
																	sleep(100)
																	if(attacker.attackturn==0)
																		sleep(100)
																		if(attacker.attackturn==0)
																			sleep(100)
																			attacker.attackturn = 1
							sleep(10)
							attacker.attacking=0
						else
							sleep(22)
							if(attacker.attacking==1)
								attacker.attacking=0
					else
						if(attacker.attacking==0 && attacker.ko==0 && attacker.powerlevel>0)
							attacker.attacking=1
							var/mob/M=locate() in get_step(attacker,attacker.dir)
							if(M && M!=attacker)
								if(M.nopk==1||attacker.nopk==1)
									attacker<<"This is a no pk zone."
								if(M.nopk==0&&attacker.nopk==0)
									if(istype(M,/mob/monsters/people/randomperson))
										M.Retreat(attacker)
									if(M.creator==1)
										attacker<<"FOOL DONT YOU KNOW THAT I AM THE ALMIGHTY CREATOR?!"
									else
										if(istype(M,/mob/characters)||istype(M,/mob/monsters))
											if(M.ko == 1)
												attacker << "<b>You need to finish him for that."
											if(M.ko == 0)
												if(attacker.ko == 1||attacker.hp==0)
													attacker << "<b>Not while you are knocked out."
												if(attacker.ko == 0&&attacker.powerlevel>0)
													if(attacker.safe == 2)
														attacker << "<b>Not while in a safe area."
													if(attacker.z==10||attacker.z==2&&M.dead==1||attacker.z==3&&attacker.x<140&&M.dead==1||attacker.z==12&&M.dead==1)
														attacker << "<b>They are in a safe area."
													else
														if(M.powerlevel==0)
															M.powerlevel=1
														var/damg=((attacker.powerlevel)/(M.powerlevel))*2
														if(damg <1)
															damg=1+attacker.strength/(M.defense+M.strength)
														if(damg>40)
															damg=40+attacker.strength/(M.defense+M.strength)
														M<<"<font color = #F19B2E>You were hit for [damg] damage by [attacker]</font>"
														attacker<<"<font color = #FFBA00>You hit [M] for [damg] damage</font>"
														if(attacker.weapon==0)
															attacker.random= rand(1,7)

															if(attacker.random == 1)
																if(attacker.sounds==1)
																	spawn()attacker<<'sounds/punchhit.wav'
																if(M.sounds==1)
																	spawn()M<<'sounds/punchhit.wav'
															//	view(2) << "<font color = blue><i>[attacker] throws a fury of punches at [M]!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,30)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 2)
																if(attacker.sounds==1)
																	spawn()attacker<<'sounds/kickhit.wav'
																if(M.sounds==1)
																	spawn()M<<'sounds/kickhit.wav'
															//	view(2) << "<font color = blue><i>[attacker] jump-kicks [M]!"
																flick("sparkick",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 3)
																if(attacker.sounds==1)
																	spawn()attacker<<'sounds/punchhit.wav'
																if(M.sounds==1)
																	spawn()M<<'sounds/punchhit.wav'
															//	view(2) << "<font color = blue><i>[attacker] uppercuts [M]!!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 4)
																if(attacker.sounds==1)
																	spawn()attacker<<'sounds/kickhit.wav'
																if(M.sounds==1)
																	spawn()M<<'sounds/kickhit.wav'
															//	view(2) << "<font color = blue><i>[attacker] sweeps [M]'s feet!"
																flick("sparkick",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 5)
																if(attacker.sounds==1)
																	spawn()attacker<<'sounds/punchhit.wav'
																if(M.sounds==1)
																	spawn()M<<'sounds/punchhit.wav'
															//	view(2) << "<font color = blue><i>[attacker] jabs [M] in the stomach!"
																flick("sparpunch",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 6)
															//	view(2) << "<font color = blue><i>[attacker] staggers, and misses [M]!"
																flick("sparpunch",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
															if(attacker.random == 7)
															//	view(2) << "<font color = blue><i>[attacker] kicks at [M], and misses [M]!"
																flick("sparkick",attacker)
																attacker.maxpowerlevel += rand(0,1)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																sleep(1)
																attacker.attacking=0
														else
															if(attacker.sounds==1)
																spawn()attacker<<'slash.wav'
															if(M.sounds==1)
																spawn()M<<'slash.wav'
															attacker.random= rand(1,7)
															if(attacker.random == 1)
															//	view(2) << "<font color = blue><i>[attacker] Thrusts his sword at [M]!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 2)
															//	view(2) << "<font color = blue><i>[attacker] slashes [M] with full force!!!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 3)
															//	view(2) << "<font color = blue><i>[attacker] uppercuts [M] with his sword!!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 4)
															//	view(2) << "<font color = blue><i>[attacker] slashes [M]'s feet!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 5)
															//	view(2) << "<font color = blue><i>[attacker] jumps and slashes [M]"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																M.powerlevel = round(M.powerlevel)
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
															if(attacker.random == 6)
															//	view(2) << "<font color = blue><i>[attacker] staggers, and misses [M]!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																attacker.maxpowerlevel += rand(0,1)
															if(attacker.random == 7)
															//	view(2) << "<font color = blue><i>[attacker] swipes at [M], and misses [M]!"
																flick("sparfury",attacker)
																if (M.block==1)
																	M.hp -= damg/5
																else
																	M.hp -= damg
																attacker.maxpowerlevel += rand(0,1)
																sleep(1)
																attacker.attacking=0
														if(istype(M,/mob/monsters))
															M.Die()
														else
															M.KO()
														if(attacker.attackturn==1&&attacker.isinhbtc==0)
															attacker.attackturn=0
															spawn()
																var/gainbonus = attacker.maxpowerlevel
																if(gainbonus>50000000)
																	gainbonus=5000000
																attacker.maxpowerlevel += (gainbonus / 4000)+rand(1,10)
																sleep(rand(30,50))
																if(M)
																	if(M.attackturn==0)
																		M.attackturn=1
																if(attacker.attackturn==0)
																	sleep(100)
																	if(attacker.attackturn==0)
																		sleep(100)
																		if(attacker.attackturn==0)
																			sleep(100)
																			attacker.attackturn = 1
														if(attacker.isinhbtc==1)
															attacker.hbtc_attacked++
															M.hbtc_wasattacked++
							sleep(10)
							attacker.attacking=0
						else
							sleep(22)
							if(attacker.attacking==1)
								attacker.attacking=0


		AuraMake()
			if(src.maxpowerlevel >= 350)
				if(src.aura == 0||src.aura == null)
					alert("You will now be able to choose your aura color.")
					src.underlays -= /obj/whiteaura
					src.aura = 1
					var/cred = input("How much red do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cgreen = input("How much green do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					var/cblue = input("How much blue do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
					src.customred = cred
					src.customgreen = cgreen
					src.customblue = cblue
					switch(input("What aura type do you want?", "Aura", text) in list ("Default","Spikey","Fountain","Erratic","Android"))

						if("Default")
							src.auratype=0
						if("Spikey")
							src.auratype=1
						if("Fountain")
							src.auratype=2
						if("Erratic")
							src.auratype=3
						if("Android")
							src.auratype=4




		techcheck()
			if(src.powerlevel >= src.maxpowerlevel)
				src.powerlevel += 0
			if(src.powerlevel < src.maxpowerlevel)
				if(src.tech == 0)
					src.powerlevel += 0
				if(src.tech == 1)
					src.powerlevel += 1
					sleep(5)
					src.techcheck()

		Die(mob/L)
			if(istype(usr,/mob))
				usr.cantitto=0
			else
				if(L)
					usr=L
				else
					usr=new/mob/characters
					usr.name=""
					usr.hp=150
			if(src.resting == 1)
				src.resting=0
				src.icon_state=""
				src.timeout=0
			sleep(1)

			if(src.dieprocran==0&&src.frozen==0)
				sleep(2)
				if(src.dieprocran==0&&src.frozen==0)
					src.dieprocran=1
					if(src.powerlevel=="NaN")
						src.powerlevel=0
					var/mob/U=usr

					var/dying=0
					if(src.hp<=0)
						dying=1


					if((dying==1||src.powerlevel<=0)&&src.race!=null)
						if(src.nopk==1&&U.key!=src.key)
							U<<"This is a no pk zone"
						else
						//	if(src.hasfused==0)
						//		if(src.majinboost)
						//			src.maxpowerlevel-=src.majinboost
						//			src.overlays-='majin.dmi'
						//			src.overlays-='redelec.dmi'
						//			src.majinboost=0
						//		if(src.dendeboost)
						//			src.maxpowerlevel-=src.dendeboost
						//			src.overlays-='elec.dmi'
						//			src.dendeboost=0
							if(src.npp == 0)
								src.timeout=0
								src.move=1
								src.trainpl = (src.maxpowerlevel * 1.5)
								src.trainpl = round(src.trainpl)
								if(src.wishtype==2)
									dying=0
									src.timeout=1
									src.invisibility=1
									sleep(60)
									src.hp=30
									src.powerlevel=src.maxpowerlevel
									src.invisibility=0
									src.timeout=0
									src<<"You have reformed"
									src.ko=0
									return
								if(src.race=="Bio-Android"||src.race=="Buu Demon")
									if(src.regencount<2)
										src.invisibility=1
										src.move=0
										switch(input(src,"Do you want to Regenerate or continue to the afterlife?", "Bio Android Regeneration", text) in list ("Regenerate", "Die"))
											if("Regenerate")
												sleep(100)
												src<<"You feel your cells start to split and reproduce"
												sleep(100)
												src<<"You feel your ki start generating as your vital organs start to regenerate"
												sleep(100)
												src<<"You feel your bones and lungs start to form"
												sleep(100)
												src<<"You feel a pitter patter sound as your heart reforms"
												sleep(100)
												src<<"You start to breath"
												sleep(100)
												src<<"You feel a violent rush of energy"
												sleep(100)
												src<<"You start to sprout arms and legs"
												sleep(100)
												src<<"You feel a burst of energy, and you regrow your body back to its normal size"
												src.invisibility=0
												sleep(100)
												src<<"You wake up and your body has fully regenerated"
												src.move=1
												src.hp=src.maxhp
												src.powerlevel=src.maxpowerlevel * 1.1
												src.regencount+=1
												return
								src.invisibility=0
								src.move=1
								if(src.wishtype!=2)
									if(src.race =="FreeEnemy(NPC)")
										if(src.dead==0)
											src.dead=1
											var/gainpl
											if(src.maxpowerlevel<=20000)
												gainpl=(src.maxpowerlevel/50)+rand(20,50)
												U.zenni+=rand(20,50)
											if(src.maxpowerlevel>20000 && src.maxpowerlevel <100000)
												gainpl = (src.maxpowerlevel/50)+rand(20,50)
												U.zenni+=rand(50,90)
											if(src.maxpowerlevel>100000 && src.maxpowerlevel <500000)
												gainpl = (src.maxpowerlevel/100)+rand(20,50)
												U.zenni+=rand(50,90)
											if(src.maxpowerlevel>500000 && src.maxpowerlevel <2000000)
												gainpl = (src.maxpowerlevel/150)+rand(20,50)
												U.zenni+=rand(50,90)
											if(src.maxpowerlevel>2000000 && src.maxpowerlevel <5000000)
												gainpl = (src.maxpowerlevel/200)+rand(20,50)
												U.zenni+=rand(50,90)
											if(src.maxpowerlevel>5000000)
												gainpl = (src.maxpowerlevel/300)+rand(20,50)
												U.zenni+=rand(50,90)
											var/difference=src.maxpowerlevel-U.powerlevel
											if(U.powerlevel<U.maxpowerlevel)
												difference=src.maxpowerlevel-U.maxpowerlevel
											if(difference<src.maxpowerlevel/-2)
												//pussy
												if(U.powerlevel>U.maxpowerlevel)
													gainpl=gainpl / (U.powerlevel/src.maxpowerlevel)
												else
													gainpl=gainpl / (U.maxpowerlevel/src.maxpowerlevel)
											if(difference>src.maxpowerlevel/2)
												gainpl=gainpl+50
											U.maxpowerlevel+=gainpl
											src.loc=locate(0,0,0)
											src.powerlevel=src.maxpowerlevel
											src.hp=150
											src.overlays=0

											spawn()
												sleep(rand(500,600))
												if(istype(src,/mob/monsters/freerange/Celljr))
													new/mob/monsters/freerange/Celljr(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/Henchman))
													new/mob/monsters/freerange/Henchman(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/Henchman2))
													new/mob/monsters/freerange/Henchman2(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/Henchman3))
													new/mob/monsters/freerange/Henchman3(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/MajinFighter))
													new/mob/monsters/freerange/MajinFighter(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/MajinFighter2))
													new/mob/monsters/freerange/MajinFighter2(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/RRdroid))
													new/mob/monsters/freerange/RRdroid(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/RRsoldier))
													new/mob/monsters/freerange/RRsoldier(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/saibaman))
													new/mob/monsters/freerange/saibaman(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/saibaman2))
													new/mob/monsters/freerange/saibaman2(locate(src:memx,src:memy,src:memz))
												if(istype(src,/mob/monsters/freerange/saibaman3))
													new/mob/monsters/freerange/saibaman3(locate(src:memx,src:memy,src:memz))
												spawn(10)del(src)
											return
									if(src.race =="Killable(NPC)")

										src.loc=locate(0,0,0)
										src.powerlevel=src.maxpowerlevel
										src.hp=150
										src.overlays=0
										U.ap -= 5
										if(U.ap == 100)
											U.ap -= 5
//											if(src.ap == 0)
//												src.ap -= 5
//													if(src.ap == -100)
//														src.ap = -100

										spawn()
											sleep(rand(500,600))
											if(istype(src,new/mob/monsters/people/randomperson/Male))
												new/mob/monsters/people/randomperson/Male(locate(src:memx,src:memy,src:memz))
											if(istype(src,new/mob/monsters/people/randomperson/Female))
												new/mob/monsters/people/randomperson/Female(locate(src:memx,src:memy,src:memz))
											spawn(10)del(src)
										return

									if(src.race =="Demon(NPC)")
										if(U.mission1==1)
											src.loc=locate(0,0,0)
											src.powerlevel=src.maxpowerlevel
											src.hp=150
											src.overlays=0
											U.ap += 5
											U.demonkills+=1

											if(U.ap == 100)
												U.ap -= 0
	//											if(src.ap == 0)
	//												src.ap -= 5
	//													if(src.ap == -100)
	//														src.ap = -100
											if(U.demonkills==10)
												U.mission1c=1
												U.demonkills=0
												U.mission1=0
												U<<"Mission completed report to North Kai"

										spawn()
											sleep(rand(500,600))
											if(istype(src,new/mob/monsters/demon/randomperson2/Male))
												new/mob/monsters/demon/randomperson2/Male(locate(src:memx,src:memy,src:memz))
											if(istype(src,new/mob/monsters/demon/randomperson2/Female))
												new/mob/monsters/demon/randomperson2/Female(locate(src:memx,src:memy,src:memz))
											spawn(10)del(src)
										return
									if(src.race =="TrainingMutant(NPC)")
										U.zenni += 190
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Mutant")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingPutty(NPC)")
										U.zenni += 190
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Putty")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingTrunks(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Trunks")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingTien(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment
										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Tien")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingKrillin(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment
										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Krillin")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingChozou(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Chozou")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingGoten(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Goten")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingPiccolo(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Piccolo")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingGohan(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Gohan")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingYamcha(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Yamcha")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="TrainingKidTrunks(NPC)")
										U.zenni += 90
										var/difference=src.maxpowerlevel-U.powerlevel
										if(U.powerlevel<U.maxpowerlevel)
											difference=src.maxpowerlevel-U.maxpowerlevel

										var/increment=src.maxpowerlevel/690 + 5
										if(difference<src.maxpowerlevel/-2)
											//pussy
											increment=src.maxpowerlevel/1000+1
											U<<"Might want to consider a bigger challenge."
										if(difference>src.maxpowerlevel/2)
											//Unlikely
											increment=U.maxpowerlevel/750+5
											U<<"Very Impressive"
										if(difference<src.maxpowerlevel/2&&difference>src.maxpowerlevel/-2)
											U<<"Good Fight"
										U.maxpowerlevel+=increment

										src.loc=locate(0,0,0)
										for(var/mob/Trainer/O in oview(20))
											if(O.name=="Chibi Trunks")
												spawn(10)U.loc=locate(O.x,O.y,O.z)
										U.cantitto=0
										sleep(200)
										del(src)
									if(src.race =="Respawnable(NPC)")
										U.zenni += 50
										src.loc=locate(0,0,0)
										sleep(1000)
										del(src)

									if(src.race =="Multiform")
										del(src)
										//if((istype(U, /mob/monsters)))
											//U.LifeCycle()
									if(src.race == "Saibaman")
										U.zenni += 50
										U << "<b>You get 50 zenni from that kill."
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated a Saibaman!"
											var/saibamancount=0
											for(var/mob/monsters/S in world)
												if(S.name=="saibaman")
													if(S.z==18)
														saibamancount+=1
											if(saibamancount==0)
												sleep(200)
												M.loc=locate(47,155,18)
												M.currentquestloc="0,0 Earth"
											//	M.questsdone=2
												M<<"All the Saibamen have been defeated!!"
												M.maxpowerlevel +=300
												var/nappacount=0
												for(var/mob/monsters/X in world)
													if(X.name=="Nappa")
														if(X.z==18)
															nappacount+=1
												if(nappacount==0)
													new /mob/monsters/Nappa(locate(46,171,18))


										sleep(1000)
										del(src)
									if(src.race == "Nappa(NPC)")
										U.zenni += 1500
										U << "<b>You get 1500 zenni from that kill."
										//U.maxpowerlevel += (rand(10,100))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Nappa!"
											sleep(100)
											M<<"Vegeta: Nappa your pathetic."
											sleep(100)
											M.loc=locate(65,155,18)
											M.currentquestloc="0,0 Earth"
											//M.questsdone=2

											M.maxpowerlevel +=300
											var/vegetacount=0
											for(var/mob/monsters/X in world)
												if(X.name=="Vegeta")
													if(X.z==18)
														vegetacount+=1
											if(vegetacount==0)
												new /mob/monsters/Vegeta(locate(64,171,18))
										del(src)
									if(src.race == "Vegeta(NPC)")
										U.zenni += 3000
										U << "<b>You get 3000 zenni from that kill."
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Vegeta!"
											sleep(200)
											M<<"Vegeta: Damn...how can this be"
											M<<"*Vegeta Crawls into his space pod and blasts away*"
											M.loc=locate(139,132,1)
											M.currentquestloc="94,44 Namek"
											M.questsdone=2

											M.maxpowerlevel +=500
										del(src)
									if(src.race == "Kiwi(NPC)")
										U.zenni += 2000
										U << "<b>You get 2000 zenni from that kill."
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Kiwi!"
											sleep(200)
											M.loc=locate(94,43,5)
											M.currentquestloc="16,25 Namek"
											M.questsdone=3
											M<<"Kiwi has been defeated!!"
											M.maxpowerlevel +=300
										del(src)
									if(src.race == "Dodoria(NPC)")
										U.zenni += 3000
										U << "<b>You get 3000 zenni from that kill."
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Dodoria!"
											sleep(200)
											M.loc=locate(16,24,5)
											M.currentquestloc="10,165 Namek"
											M.questsdone=4
											M<<"Dodoria has been defeated!!"
											M.maxpowerlevel +=400
										del(src)
									if(src.race == "Zarbon(NPC)")
										U.zenni += 4000
										U << "<b>You get 4000 zenni from that kill."
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Zarbon!"
											sleep(200)
											M.loc=locate(10,164,5)
											M.currentquestloc="149,164 Namek"
											M.questsdone=6
											M<<"Zarbon has been defeated!!"
											M.maxpowerlevel +=400
										del(src)
									if(src.race == "Guldo(NPC)")
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Guldo!"
											sleep(200)

											M.loc=locate(142,132,18)
											var/recoomcount=0
											for(var/mob/monsters/X in world)
												if(X.name=="Recoom")
													if(X.z==18)
														recoomcount+=1
											if(recoomcount==0)
												new /mob/monsters/Recoom(locate(142,145,18))
										del(src)
									if(src.race == "Recoom(NPC)")
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Recoom!"
											sleep(200)

											M.loc=locate(142,109,18)
											var/jeicecount=0
											var/burtercount=0
											for(var/mob/monsters/X in world)
												if(X.name=="Burter")
													if(X.z==18)
														burtercount+=1
												if(X.name=="Jeice")
													if(X.z==18)
														jeicecount+=1
											if(burtercount==0)
												new /mob/monsters/Burter(locate(146,118,18))
											if(jeicecount==0)
												new /mob/monsters/Jeice(locate(138,118,18))
										del(src)
									if(src.race == "Jeice(NPC)")
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Jeice!"
											sleep(200)
											var/burtercount=0
											for(var/mob/monsters/S in world)
												if(S.name=="Burter")
													if(S.z==18)
														burtercount+=1
											if(burtercount==0)
												M.loc=locate(142,81,18)
												var/ginyucount=0
												for(var/mob/monsters/X in world)
													if(X.name=="Ginyu")
														if(X.z==18)
															ginyucount+=1
												if(ginyucount==0)
													new /mob/monsters/Ginyu(locate(142,92,18))
										del(src)
									if(src.race == "Burter(NPC)")
										//U.maxpowerlevel += (rand(50,300))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Burter!"
											sleep(200)
											var/jeicecount=0
											for(var/mob/monsters/S in world)
												if(S.name=="Jeice")
													if(S.z==18)
														jeicecount+=1
											if(jeicecount==0)
												M.loc=locate(142,81,18)
												var/ginyucount=0
												for(var/mob/monsters/X in world)
													if(X.name=="Ginyu")
														if(X.z==18)
															ginyucount+=1
												if(ginyucount==0)
													new /mob/monsters/Ginyu(locate(142,92,18))
										del(src)
									if(src.race =="Ginyu(NPC)")
										U.zenni +=10000
										U <<"<b>You have defeated the Ginyu force (and gained 10000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=7
											M.maxpowerlevel+=8000
											M<<"You have defeated the Ginyu Force!!"
											sleep(200)
											M.loc=locate(149,162,5)
											M.currentquestloc="168,18 Namek"
										sleep(1000)
										del(src)
									if(src.race =="Friezaform1(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Frieza's first form!!"
											M<<"Freiza: Fool your going to pay now."
											sleep(200)

											M.loc=locate(162,139,18)
											var/Friezaform2count=0
											for(var/mob/monsters/X in world)
												if(X.name=="Frieza2")
													if(X.z==18)
														Friezaform2count+=1
											if(Friezaform2count==0)
												new /mob/monsters/Frieza2(locate(170,139,18))
										del(src)
									if(src.race =="Friezaform2(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Frieza's second form!!"
											M<<"Freiza: I can't believe i have to transform again to defeat you!!."
											sleep(200)

											M.loc=locate(162,116,18)
											var/Friezaform3count=0
											for(var/mob/monsters/X in world)
												if(X.name=="Frieza3")
													if(X.z==18)
														Friezaform3count+=1
											if(Friezaform3count==0)
												new /mob/monsters/Frieza3(locate(170,116,18))
										del(src)
									if(src.race =="Friezaform3(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Frieza's third form!!"
											M<<"Freiza: Now you have done it, i will transform to my final and most powerfull form!!!."
											sleep(200)

											M.loc=locate(166,96,18)
											var/Friezaform4count=0
											for(var/mob/monsters/X in world)
												if(X.name=="Frieza4")
													if(X.z==18)
														Friezaform4count+=1
											if(Friezaform4count==0)
												new /mob/monsters/Frieza4(locate(166,86,18))
										del(src)
									if(src.race =="Friezaform4(NPC)")

										//U.maxpowerlevel += (rand(5000,50000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Frieza's final form!!"
											M<<"You receive 10000 zenni for defeating Frieza's final form!!"
											M<<"Frieza: How can..this..BE!!"
											M.zenni += 10000
											sleep(200)
											M.loc=locate(167,18,5)
											M.questsdone=8
											M.currentquestloc="153,202 Earth"
										del(src)
									if(src.race =="Friezabot(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Frieza!"
											M<<"King Cold: How can this be?!."
											sleep(200)

											M.loc=locate(36,134,18)
											var/kingcoldcount=0
											for(var/mob/monsters/X in world)
												if(X.name=="KingCold")
													if(X.z==18)
														kingcoldcount+=1
											if(kingcoldcount==0)
												new /mob/monsters/KingCold(locate(52,134,18))
										del(src)
									if(src.race =="Kingcold(NPC)")

										//U.maxpowerlevel += (rand(5000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated King Cold!!!!"
											M<<"You receive 10000 zenni for defeating Frieza and King Cold!!"
											M.zenni += 10000
											sleep(200)
											M.loc=locate(153,202,1)
											M.questsdone=9
											M.currentquestloc="168,16 Earth"
										del(src)

									if(src.race =="19(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Android 19!"
											M<<"Gero: How is this possible?!."
											sleep(200)

											M.loc=locate(72,120,18)
											var/gerocount=0
											for(var/mob/monsters/X in world)
												if(X.name=="A20")
													if(X.z==18)
														gerocount+=1
											if(gerocount==0)
												new /mob/monsters/A20(locate(80,120,18))
										del(src)
									if(src.race =="20(NPC)")

										//U.maxpowerlevel += (rand(5000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Dr.Gero!!!!"
											M<<"You receive 8000 zenni for defeating Dr.Gero!!"
											M.zenni += 8000
											sleep(200)
											M.loc=locate(168,16,1)
											M.questsdone=10
											M.currentquestloc="227,215 Earth"
										del(src)
									if(src.race =="18(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Android 18!"
											M<<"Android 18: Wow this one is tough."
											M<<"Android 17: Hmm, my turn."
											sleep(200)

											M.loc=locate(93,116,18)
											var/androidcount=0
											for(var/mob/monsters/X in world)
												if(X.name=="A17")
													if(X.z==18)
														androidcount+=1
											if(androidcount==0)
												new /mob/monsters/A17(locate(106,116,18))
										del(src)
									if(src.race =="17(NPC)")
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Android 17!"
											M<<"Android 17: Damnit, how is he so strong.."
											M<<"Android 18: See what i mean."
											M<<"Android 16: *Sight* I guess I will have to do this."
											sleep(200)

											M.loc=locate(93,95,18)
											var/androidcount=0
											for(var/mob/monsters/X in world)
												if(X.name=="A16")
													if(X.z==18)
														androidcount+=1
											if(androidcount==0)
												new /mob/monsters/A16(locate(106,95,18))
										del(src)
									if(src.race =="16(NPC)")

										//U.maxpowerlevel += (rand(8000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Android 16!!!!"
											M<<"You receive 12000 zenni for defeating the Androids!!"
											M<<"Android 17: Shit lets get the hell out of here."
											M<<"Android 16: This doesnt make any sense.."
											M<<"Android 18: He ruined my good jeans.."
											M.zenni += 12000
											sleep(200)
											M.loc=locate(227,215,1)
											M.questsdone=11
											M.currentquestloc="131,219 Earth"
										del(src)
									if(src.race=="Cell1(NPC)")
										//U.maxpowerlevel += (rand(8000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Cell!!!!"
											M<<"You receive 5000 zenni for defeating Cell!!"
											M<<"Cell:Damn, you wont defeat me after i absorb those androids"
											M<<"*Cell Escapes and is heading for the Androids!*"
											M.zenni += 5000
											sleep(200)
											M.loc=locate(131,219,1)
											M.questsdone=12
											M.currentquestloc="249,53 Earth"
										del(src)
									if(src.race=="Cell2(NPC)")
										//U.maxpowerlevel += (rand(9000,40000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Cell's Second form!!!!!"
											M<<"You receive 5000 zenni for defeating Cell!!"
											M<<"Cell:Ahh, i can't loose now!,I'm to close to perfection.."
											M<<"*Cell Escapes and is heading for Android 18!!*"
											M.zenni += 5000
											sleep(200)
											M.loc=locate(249,53,1)
											M.questsdone=13
											M.currentquestloc="173,216 Earth"
										del(src)
									if(src.race == "Celljr(NPC)")
										U.zenni += 500
										U << "<b>You get 500 zenni from that kill."
										//U.maxpowerlevel += (rand(100,1000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated a Cell Jr!"
											var/saibamancount=0
											for(var/mob/monsters/S in world)
												if(S.name=="Celljr")
													if(S.z==18)
														saibamancount+=1
											if(saibamancount==0)
												M<<"All the Celljr's have been defeated!!"
												sleep(200)
												M.loc=locate(16,71,18)
												M.maxpowerlevel +=300
												var/cellcount=0
												for(var/mob/monsters/X in world)
													if(X.name=="perfectCell")
														if(X.z==18)
															cellcount+=1
												if(cellcount==0)
													new /mob/monsters/perfectCell(locate(16,81,18))
										del(src)
									if(src.race=="Cell3(NPC)")
										//U.maxpowerlevel += (rand(18000,80000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Cell's Perfect Form!!!!!"
											M<<"Cell: AHHHHHH!!!"
											M<<"*Cell Breaks apart and Dies*"
											M<<"You receive 15000 zenni for defeating Cell!!"
											M.zenni += 15000
											sleep(200)
											M.loc=locate(173,216,1)
											M.questsdone=14
											M.currentquestloc="84,77 Earth"
										del(src)
									if(src.race =="Raditz(NPC)")
										U.zenni +=1000
										U <<"<b>You have defeated Raditz (and gained 1000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=1
											M.maxpowerlevel+=300
											M<<"You have defeated Raditz!"
											sleep(200)
											M.loc=locate(264,237,1)
											M.currentquestloc="139,132 Earth"
										sleep(1000)
										del(src)
									if(src.race =="Puipui(NPC)")
										U.zenni +=3000
										U <<"<b>You have defeated PuiPui (and gained 3000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=16
											M.maxpowerlevel+=10000
											M<<"You have defeated Puipui!"
											sleep(200)
											M.loc=locate(89,144,10)
											M.currentquestloc="2B-Babidi's Ship"
										sleep(1000)
										del(src)
									if(src.race == "Spopovich(NPC)")
										//U.maxpowerlevel += (rand(8000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Spopovich!"
											sleep(200)
											var/Yamucount=0
											for(var/mob/monsters/S in world)
												if(S.name=="Yamu")
													if(S.z==18)
														Yamucount+=1
											if(Yamucount==0)
												M.loc=locate(84,77,1)
												M.questsdone=15
												M.currentquestloc="84,79 Earth"
										sleep(1000)
										del(src)
									if(src.race == "Yamu(NPC)")
										//U.maxpowerlevel += (rand(8000,30000))
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))

											M<<"You have defeated Yamu!"
											sleep(200)
											var/Yamucount=0
											for(var/mob/monsters/S in world)
												if(S.name=="Spopovich")
													if(S.z==18)
														Yamucount+=1
											if(Yamucount==0)
												M.loc=locate(84,77,1)
												M.questsdone=15
												M.currentquestloc="84,79Earth"
										sleep(1000)
										del(src)
									if(src.race =="Yakon(NPC)")
										U.zenni +=5000
										U <<"<b>You have defeated Yakon (and gained 5000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=17
											M.maxpowerlevel+=15000
											M<<"You have defeated Yakon!"
											sleep(200)
											M.loc=locate(89,128,10)
											M.currentquestloc="3B-Babidi's Ship"
										sleep(1000)
										del(src)
									if(src.race =="Dabura(NPC)")
										U.zenni +=7000
										U <<"<b>You have defeated Dabura (and gained 7000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=18
											M.maxpowerlevel+=20000
											M<<"You have defeated Dabura!"
											sleep(200)
											M.loc=locate(89,112,10)
											M.currentquestloc="184,258 Earth"
										sleep(1000)
										del(src)
									if(src.race =="MajinVegeta(NPC)")
										U.zenni +=10000
										U <<"<b>You have defeated Majin Vegeta (and gained 10000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=19
											M.maxpowerlevel+=25000
											M<<"You have defeated Majin Vegeta!"
											sleep(50)
											M<<"Vegeta:What.. Have i done."
											sleep(100)
											M.loc=locate(184,258,1)
											M.currentquestloc="97,74 Earth"
										sleep(1000)
										del(src)
									if(src.race =="Babidi(NPC)")
										U.zenni +=10000
										U <<"<b>You have defeated Babidi (and gained 10000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=20
											M.maxpowerlevel+=25000
											M<<"You have defeated Babidi!"
											sleep(30)
											M<<"Babidi: Ahh you think you have won, but look in the sky, Buu has escaped, and without my restraint will destroy the universe!"
											sleep(150)
											M.loc=locate(97,74,1)
											M.currentquestloc="98,78 Earth"
										sleep(1000)
										del(src)
									if(src.race =="Fatbuu(NPC)")
										U.zenni +=10000
										U <<"<b>You have defeated Fatbuu (and gained 10000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=21
											M.maxpowerlevel+=30000

											M<<"You have defeated Fat Buu!"
											sleep(10)
											M <<"<b>Buu: You make Buu, ANGRY!</b>"
											sleep(10)
											M <<"*Steam comes bursting out of Buu's back and a second Buu is formed*"
											sleep(10)
											M <<"<b>FatBuu:No..No no no no no no "
											sleep(10)
											M <<"<b>FatBuu:I need to get out of here!!"
											sleep(10)
											M <<"*FatBuu flies away*"
											sleep(10)
											M <<"<b>SkinnyBuu:Hey get back here!"
											sleep(10)
											sleep(50)
											M.loc=locate(98,78,1)
											M.currentquestloc="72,190 Earth"
										sleep(1000)
										del(src)
									if(src.race =="Skinnybuu(NPC)")
										U.zenni +=10000
										//U.maxpowerlevel+=50000
										U <<"<b>You have defeated Skinnybuu (and gained 10000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=22
											M.maxpowerlevel+=30000
											M<<"You have defeated Skinny Buu!"
											sleep(10)
											M <<"<b>Skinny Buu: Ah your strong...</b>"
											sleep(10)
											M <<"*Skinny Buu uses Food Change on Fat buu and turns him into a Cookie*"
											sleep(10)
											M <<"<b>FatBuu:AHHH"
											sleep(10)
											M <<"*Skinny Buu eats Fat Buu.*"
											sleep(10)
											M <<"*Skinny Buu transforms into Super Buu!*"
											sleep(10)
											M <<"*Super Buu Flies away*"
											sleep(10)
											sleep(50)
											M.loc=locate(72,190,1)
											M.currentquestloc="Kami's Lookout(43,160 Earth)"
										sleep(1000)
										del(src)
									if(src.race =="Superbuu(NPC)")
										U.zenni +=15000
										//U.maxpowerlevel+=100000
										U <<"<b>You have defeated SuperBuu! (and gained 15000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=23
											M.maxpowerlevel+=50000
											M<<"You have defeated Super Buu!"
											sleep(10)
											M <<"<b>SuperBuu: AHHH!!</b>"
											sleep(10)
											M <<"*SuperBuu Emits a lot of steam*"
											sleep(10)
											M <<"*The steam rises and a new Buu is born.*"
											sleep(10)
											M <<"<b>Kaoshin:Oh no. he's reached his most powerfull form, he is pure evil now..</b>"
											sleep(10)
											M <<"*Kid Buu taunts you and then uses Instant Transmission and disapears*"
											sleep(10)
											M <<"*You detect that Kid Buu has gone to Kaoshin's planet!*"
											sleep(10)
											sleep(50)
											M.loc=locate(15,14,12)
											M.currentquestloc="Kaoshin's Planet"
										sleep(1000)
										del(src)
									if(src.race =="Kidbuu(NPC)")
										U.zenni +=30000
										//U.maxpowerlevel+=150000
										U <<"<b>You have defeated KidBuu! (and gained 30000 zenni)"
										src.loc=locate(0,0,0)
										for(var/mob/characters/M in view(6))
											M.questsdone=24
											M.maxpowerlevel+=100000
											M<<"You have defeated Kid Buu!"
											sleep(10)
											M <<"KidBuu: NOOOOOOO!!!!"
											sleep(10)
											M<<"*Buu breaks apart into thousands of pieces and disapears*"
											sleep(10)
											sleep(50)
											M.loc=locate(3,126,10)
											M.currentquestloc="Completed"
										sleep(1000)
										del(src)

									if(src.race == "Saiya-jin (NPC)")
										U.zenni += 2500
										U << "<b>You get 2500 zenni from that kill."
										//U.maxpowerlevel += (rand(1,200))
										src.loc=locate(0,0,0)
										sleep(2000)
										if(src.name=="Raditz")
											new /mob/monsters/Raditz(locate(25,138,1))
										del(src)
									if(src.race == "Enemy(NPC)")
										U.zenni += 100
										src.loc=locate(0,0,0)
										sleep(1000)
										del(src)
									if(src.race == "Janemba(NPC)")
										new /obj/JanembaSword(src.loc)
										src.loc=locate(0,0,0)
										sleep(1000)
										del(src)
									if(src.race == "Trunks(NPC)")
										U<<"Trunks:Ack, you are strong, here take this"
										new /obj/TapionSword(src.loc)
										src.loc=locate(0,0,0)
										sleep(1000)
										del(src)
									if(src.race == "Buu (NPC)")
										U.zenni += 5000
										U << "<b>You get 5000 zenni from that kill."
										//U.maxpowerlevel += (rand(1,1000))
										src.loc=locate(0,0,0)
										sleep(1000)
										del(src)
									else
										if(src.client)
											src.hp=0
											if(src.race == "Android")

												src << "<b>You get blown to pieces, and you begin to get built by Dr. Gero!"
												if(src.name == U.name)
													world << "<b><font color=red><font face=tahoma><font size=1>Death Report: <font color=white>[src] has killed himself!</b>"
												else
													world << "<b><font color=red><font face=tahoma><font size=1>Death Report: <font color=white>[src] has been killed by [U].</b>"
												if(src.zenni>0&&src.gm==0&&src.hasfused==0&&src.client)
													var/O = new /obj/goldbag(src.loc)
													var/zennidrop=src.zenni/10
													O:zenni = zennidrop
													src.zenni -=zennidrop
													usr.meditations=0
													src.icon_state = ""
													src.meditating=0
													src.medprocess=0
													src.move=1
													src.client.SaveMob(src)
												src.deaths+=1
												U.kills+=1
												if(src.ap>0)
													U.ap-=src.ap/10+2
												src.dead=1
												spawn()
													for(var/mob/characters/M in oview(6))
														if(M)
															if(M.befriend == src.name)
																if(M.angered == 1)
																	U.powerlevel += 0
																if(M.angered == 0)
																	view(10) << "<b><font color = blue>[M.name]: THATS ENOUGH!!!!!!!!!!!!"
																	view(10) << "<i><b><font color = red>[M.name] explodes in anger as he sees his best friend die!"
																	M.underlays += /obj/whiteaura
																	M.ragename = src.name
																	spawn()M.Getpissed()
																	sleep(1)
																	spawn()M.Getpissed()
																	M << "<font color = red><font size = 5>Hate <font color = blue>fills your soul as you see your best friend, [src.name], die infront of you."
															else
																if(U.angered == 1)
																	U.powerlevel += 0
																if(U.angered == 0)
																	view(6) << "<b><font color = blue>[M.name]: aaaAAAHHHHH!!!!!!!!!!"
																	view(6) << "<i><b><font color = red>[M.name] explodes in anger as a huge aura surrounds him!"
																	M.underlays += /obj/whiteaura
																	spawn()M.Getpissed()
																	M << "<font color = red>Hate <font color = blue>fills your soul as you see [src.name] die infront of you."
												src.loc=locate(125,145,3)
												src.nopk=1
												src.ingero=1
												src<<"You have been sent here to wait while Dr.Gero rebuilds you."
												sleep(500)
												src.ingero=0
												src.loc=locate(56,111,3)
												src.dead=0
											else
												if(src.dead == 1)

													if(src.name == U.name)
														src<<"You have killed yourself!"
														if(src.zenni>0&&src.gm==0&&src.hasfused==0&&src.client)
															var/O = new /obj/goldbag(src.loc)
															var/zennidrop=src.zenni/10
															O:zenni = zennidrop
															src.zenni -=zennidrop
														src.icon_state = ""
														src.spar = 0
														src.dead = 1
														src.safe = 1
														src.ko = 0

														src.grav = 0
														src.density = 1
														src.powerlevel = src.maxpowerlevel
														src.loc=locate(55,4,3)
														src.nopk=1
														src.hp=src.maxhp
													else
														if(src.z==2||src.z==3&&src.x<140||src.z==12)
														//	U<<"Cant kill here"
															if(src.hp<0)
																src.hp=0
														else
															if(src.zenni>0&&src.gm==0&&src.hasfused==0&&src.client)
																var/O = new /obj/goldbag(src.loc)
																var/zennidrop=src.zenni/10
																O:zenni = zennidrop
																src.zenni -=zennidrop
																src.client.SaveMob(src)
															src << "You have died again!"
															src.icon_state = ""
															src.spar = 0
															src.dead = 1
															src.safe = 1
															src.ko = 0

															src.grav = 0
															src.density = 1
															src.powerlevel = src.maxpowerlevel
															src.loc=locate(55,4,3)
															src.nopk=1
															src.hp=src.maxhp
												if(src.dead == 0)
													if(src.name == U.name)
														view(6) << "<font color = red><i>[src] dies right infront of you!"
														world << "<b><font color=red><font face=tahoma><font size=1>Death Report: <font color=white>[src] has killed himself!</b>"



													else
														view(6) << "<font color = red><i>[src] dies right infront of you!"
														world << "<b><font color=red><font face=tahoma><font size=1>Death Report: <font color=white>[src] has been killed by [U].</b>"
											//		for(var/obj/dragonballs/O in src.contents)
											//			O.loc = locate(src.x,src.y,src.z)
														src.deaths+=1
														U.kills+=1
														if(src.ap>0)
															U.ap-=src.ap/10+2
													if(src.client)
														var/O = new /obj/gutb(src.loc) //Que?
													if(src.zenni>0&&src.hasfused==0)
														var/O = new /obj/goldbag(src.loc)
														var/zennidrop=src.zenni/10
														O:zenni = zennidrop
														src.zenni -=zennidrop
														src.icon_state = ""
														src.meditating=0
														src.medprocess=0
														src.move=1


													spawn()
														for(var/mob/characters/M in oview(6))
															if(M)
																if(M.befriend == src.name)
																	if(M.angered == 1)
																		U.powerlevel += 0
																	if(M.angered == 0)
																		view(10) << "<b><font color = blue>[M.name]: THATS ENOUGH!!!!!!!!!!!!"
																		view(10) << "<i><b><font color = red>[M.name] explodes in anger as he sees his best friend die!"
																		M.underlays += /obj/whiteaura
																		M.ragename = src.name
																		spawn()M.Getpissed()
																		sleep(1)
																		spawn()M.Getpissed()
																		M << "<font color = red><font size = 5>Hate <font color = blue>fills your soul as you see your best friend, [src.name], die infront of you."
																else
																	if(U.angered == 1)
																		U.powerlevel += 0
																	if(U.angered == 0)
																		view(6) << "<b><font color = blue>[M.name]: aaaAAAHHHHH!!!!!!!!!!"
																		view(6) << "<i><b><font color = red>[M.name] explodes in anger as a huge aura surrounds him!"
																		M.underlays += /obj/whiteaura
																		spawn()M.Getpissed()
																		M << "<font color = red>Hate <font color = blue>fills your soul as you see [src.name] die infront of you."
													src.loc=locate(55,4,3)
													src.nopk=1
													src.powerlevel = src.maxpowerlevel
													src.icon_state = ""
													src.spar = 0
													src.safe = 1
													src.dead = 1
													src.icon_state = ""
													src.meditating=0
													src.meditations=0
													src.medprocess=0
													src.move=1
													src.overlays += 'halo.dmi'
													src.grav = 0
													src.density = 1
													src.ko = 0
													src.regencount = 0
												else
													U.powerlevel += 0
						src.dieprocran=0
				if(src.dieprocran==1)
					sleep(50)
					src.dieprocran=0
			if(src.dieprocran==1)
				sleep(50)
				src.dieprocran=0





		KO()
			if(src.resting == 1)
				src.resting=0
				src.icon_state=""
				src.timeout=0
			var/dying=0
			if(src.hp<=0)
				dying=1
			if(dying==1 && (istype(src,/mob/monsters)||src.client))
				view(6) << "<b>[src] is knocked out!!</b>"
				src.ko = 1
				src.move = 0
				src.timeout=1
				src.grav = 0
				sleep(500)
				src.ko = 0
				src.timeout=0
				src.move = 1
		FormTwo()
			if(src.gonessj == null||src.gonessj == 0)
				if(src.race == "Changling")
					if(src.powerlevel >= 100000)
						src << "<b>You begin to feel your body straining...."
						sleep(rand(1,100))
						src << "<b>Your body begins to transform!!"
						flick("form2",src)
						src << "<b>Your clothes cannot fit your body anymore."
						src.icon = 'ChangeForm2.dmi'
						src.gonessj = 1
						src.state = "Form Two"
						src.verbs += /mob/transform/verb/Transform
		SNJ()
			if(src.gonessj == 1)
				src.powerlevel += 0
			if(src.gonessj == 0||src.gonessj == null)
				if(src.race == "Namek-sei-jin"||src.race == "Namek-jin")
					if(src.maxpowerlevel >= 300000)
						src.random = rand(1,4)
						src << "You sense a hidden power about to be released from you...."
						flick("trans",src)
						src.transformations+=new/obj/Tran/SNJ
						src.verbs+=new/obj/Tran/verb/Transform
						src.verbs+=new/obj/Tran/verb/Revert
						src.skillsupernamek=1
						//src.icon = 'super-namek.dmi'
						src.gonessj = 1

					else
						src.powerlevel += 0
				else
					src.powerlevel += 0
			else
				src.powerlevel += 0



		SSJ()
			if(src.kaioken == 1)
				src << "<b>You begin to get angered, but Kaioken strains your body."
			if(src.kaioken == 0)
				if(src.gonessj == 1)
					src.powerlevel += 0
				if(src.gonessj == 0)
					if(src.race == "Saiya-jin"||src.race == "Halfbreed")
						if(src.maxpowerlevel >= 300000)
							src.race = "Saiya-jin"
							src << "<b>Tears start to fill your eyes...."
							oview(6) << "<b>Tears start to fill [src]'s eyes...."
							src.icon_state = "ssj"
							src.gonessj = 1
							src.random = 2
							if(src.random == 2)
								sleep(30)
								src.gonessj = 1
								src << "<b>You understand the extent of Super Saiya-jin!!</b>"
								src << "<b>You get control of your body again."
								src.transformations[1]=new/obj/Tran/SSJ1
								src.verbs+=new/obj/Tran/verb/Transform
								src.verbs+=new/obj/Tran/verb/Revert
								src.skillssj=1
								src.ssj = 0
								src.icon_state=""
				if(src.gonessj2 == 0)
					if(src.race == "Saiya-jin"||src.race == "Halfbreed")
						if(src.maxpowerlevel >= 1000000)
							src.race = "Saiya-jin"
							src << "<b>Tears start to fill your eyes...."
							oview(6) << "<b>Tears start to fill [src]'s eyes...."
							src.icon_state = "ssj"
							src.gonessj = 1
							src.random = 2
							if(src.random == 2)
								src << "<b>Your hair starts to stand on end..."
								oview(6) << "<b>[src]'s hair begins to stand on end..."
								sleep(30)
								src.random = 2
								if(src.random == 2)
									view(30) << "<b>[src]: <font size = 5>aaaAAAHHHHHHHHHHHH!!!!!!!!!!!!"
									view(150) << "The ground begins to shake!!!</b>"
									sleep(20)
									flick("gonessj",src)
									src.icon_state = ""
									src.random = 2
									if(src.random == 2)
										src.gonessj2 = 1
										src << "<b>You learn how to ascend to a Super Saiyajin 2!!</b>"
										src.transformations[3]=new/obj/Tran/SSJ2
										src.ssj = 0





mob/proc
	isDead()
		if (move == 0)
			return 1
		return 0

mob/monsters
	var/sleeptime=10
	var/ornary=0
	var/target="None"
	New()
		..()
		spawn()
			sleep(rand(5,10))
			if(istype(src,/mob/monsters/people)==0)
				src.LifeCycle()
		return
mob/monsters/proc
	LifeCycle()
		src.isnap=0
		if(src.freerange==0||src.freerange==1)
			while(src.move==0)
				sleep(10)
				sleep(rand(5,10))
			if(src.move!=0)
				var/countergo=0
				for(var/mob/characters/OD in oview(6,src))
					if(OD.client)
						countergo=1
				if(countergo==1)
					if(src.z==10||src.z==2||src.z==4||src.z==3&&src.x<140||src.z==12||src.dead==1||src.z==17)
						del(src)
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
					if(src.mode=="Follow")
						for (var/mob/other_mob in oview(15, src))
							if(other_mob.name==src.owner)
								if(other_mob.density==0)
									src.density=0
								step_towards(src,other_mob)
								action_taken = 1
								src.density=1
					if(src.mode=="Hunt")
						for (var/mob/other_mob in oview(8, src))
							if(other_mob.name==src.hunt)
								if(other_mob.density==0)
									src.density=0
								step_towards(src,other_mob)
								action_taken = 1
								src.density=1

					for(var/mob/other_mob in oview(11, src))
						if (other_mob.owner==src.owner|| other_mob.isDead())
							continue
						if(src.mode=="Follow"||src.mode=="Passive")
							action_taken=1
							continue
						if((istype(other_mob, /mob/monsters))||(istype(other_mob, /mob/characters)))
							if(src.mode=="Hunt")
								if(other_mob.name!=src.hunt)
									continue
								else
									if(src.owner!=other_mob.name||src.mode=="Training"&&other_mob)

										Attack(other_mob)
									action_taken = 1
							//for berserk attack close
							else
								if(src.owner!=other_mob.name||src.mode=="Training"&&other_mob)
									Attack(other_mob)
								action_taken = 1

					for (var/mob/characters/other_mob in oview(21, src))
						if (other_mob.owner==src.owner|| other_mob.isDead())
							continue
						if(src.mode=="Follow"||src.mode=="Passive")
							action_taken=1
							continue

						if(src.mode=="Hunt")
							if(src.hunt==other_mob.name)
								step_towards(src, other_mob)
								action_taken = 1
							else
								continue

					//monster battle AI
					if(src.mode=="Berserk")
						for(var/obj/dan_projectile/P in oview(24,src))
							var/l = rand(1,4)
							var/Pdir=P.dir
							sleep(l)
							if(Pdir==NORTH)
								src.x--
								for(var/turf/ZVoid/U in src.loc)
									src.x++
							if(Pdir==SOUTH)
								src.x++
								for(var/turf/ZVoid/U in src.loc)
									src.x--
							if(Pdir==EAST)
								src.y--
								for(var/turf/ZVoid/U in src.loc)
									src.y++
							if(Pdir==WEST)
								src.y++
								for(var/turf/ZVoid/U in src.loc)
									src.y--
						if(src.target=="None")
							for(var/mob/characters/X in oview(24,src))
								spawn()
									sleep(1)
									if(src.target=="None")
										if(X.client)
											src.target="[X.name]"

								action_taken=1
						if(src.target!="None")
							var/cont = 0
							var/mob/mytarget = 0
							for(var/mob/characters/D in oview(25,src))
								if(src.target=="[D.name]")
									cont=1
									mytarget=D

							if(cont==0)
								src.target="None"
							if(cont==1&&mytarget)
								action_taken=1
								for(var/mob/other_mob in oview(25, src))
									if (other_mob.owner==src.owner|| other_mob.isDead())
										continue
								if(abs(mytarget.x-src.x)<=1 && abs(mytarget.y-src.y)<=1)
									//attack range
									var/dice = rand(1,100)
									//evade 47%
									if(dice>=1 && dice<=6)
										if(abs((mytarget.x-1)-src.x)<=1)
											src.loc=locate(mytarget.x-1,mytarget.y,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												walk_to(src,mytarget)
												Attack(mytarget)
										else
											dice=20
									if(dice>=7 && dice<=12)
										if(abs((mytarget.x+1)-src.x)<=1)
											src.loc=locate(mytarget.x+1,mytarget.y,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												Attack(mytarget)
												src.blocks=1
										else
											dice=25

									if(dice>=13 && dice<=18)
										if(abs((mytarget.y-1)-src.y)<=1)
											src.loc=locate(mytarget.x,mytarget.y-1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												walk_to(src,mytarget)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												Attack(mytarget)
										else
											dice=8

									if(dice>=19 && dice<=24)
										if(abs((mytarget.y+1)-src.y)<=1)
											src.loc=locate(mytarget.x,mytarget.y+1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												src.blocks=1
										else
											dice=15
									if(dice>=31 && dice<=45)
										if(abs((mytarget.x+1)-src.x)<=1 && abs((mytarget.y+1)-src.y)<=1)
											src.loc=locate(mytarget.x+1,mytarget.y+1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												walk_to(src,mytarget)
												Attack(mytarget)
										else
											dice=25
									if(dice>=40 && dice<=70)
										if(abs((mytarget.x-1)-src.x)<=1 && abs((mytarget.y-1)-src.y)<=1)
											src.loc=locate(mytarget.x-1,mytarget.y-1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												walk_to(src,mytarget)
												Attack(mytarget)

										else
											dice=32
									if(dice>=31 && dice<=45)
										if(abs((mytarget.x-1)-src.x)<=1 && abs((mytarget.y+1)-src.y)<=1)
											src.loc=locate(mytarget.x-1,mytarget.y+1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
												Attack(mytarget)
										else
											dice=25
									if(dice>=36 && dice<=43)
										if(abs((mytarget.x+1)-src.x)<=1 && abs((mytarget.y-1)-src.y)<=1)
											src.loc=locate(mytarget.x+1,mytarget.y-1,mytarget.z)
											for(var/turf/ZVoid/U in src.loc)
												walk_to(src,mytarget)
												src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
										else
											dice=52
									//melee 50%
									if(dice>=20)
										Attack(mytarget)
										src.loc=locate(mytarget.x,mytarget.y,mytarget.z)
										src.blocks=1
										walk_to(src,mytarget)
									else
										dice=42
									if(dice>=20||mytarget in view(15))
										walk_to(src,mytarget)
									else
										dice=42
									if(dice>=40)
										var/aura = 'whiteaura.dmi'
										src.underlays += aura
										src.powerupenemy()
									else
										dice=52
									//kiblast 13%
									if(dice>=20 && dice <=69)
										if(src.owner!=src.target)
											var/obj/gohere
											if(mytarget.dir==NORTH || mytarget.dir==NORTHEAST)
												gohere=new(locate(mytarget.x,mytarget.y-2,mytarget.z))
											if(mytarget.dir==SOUTH || mytarget.dir==SOUTHEAST)
												Attack(mytarget)
												gohere=new(locate(mytarget.x,mytarget.y+2,mytarget.z))
											if(mytarget.dir==EAST || mytarget.dir==NORTHWEST)
												walk_to(src,mytarget)
												Attack(mytarget)
												gohere=new(locate(mytarget.x-2,mytarget.y,mytarget.z))
											if(mytarget.dir==WEST || mytarget.dir==SOUTHWEST)
												walk_to(src,mytarget)
												Attack(mytarget)
												gohere=new(locate(mytarget.x+2,mytarget.y,mytarget.z))

											var/stuck=20
											var/c=0
											var/mytargetdir=mytarget.dir
											walk_to(src,gohere)
											while(stuck>0 && (src.x!=gohere.x ||src.y!=gohere.y || src.z!=gohere.z))
												stuck--
												sleep(1)
												c++
												if(c>=2)
													c=0
													if(mytargetdir==NORTH || mytargetdir==NORTHEAST)
														gohere.loc=locate(mytarget.x,mytarget.y-2,mytarget.z)
														walk_to(src,mytarget)
													if(mytargetdir==SOUTH || mytargetdir==SOUTHEAST)
														gohere.loc=locate(mytarget.x,mytarget.y+2,mytarget.z)
														walk_to(src,mytarget)
														Attack(mytarget)
													if(mytargetdir==EAST || mytargetdir==NORTHWEST)
														gohere.loc=locate(mytarget.x-2,mytarget.y,mytarget.z)
													if(mytargetdir==WEST || mytargetdir==SOUTHWEST)
														Attack(mytarget)
														gohere.loc=locate(mytarget.x+2,mytarget.y,mytarget.z)
											walk(src,0)
											if(mytarget.x > src.x)
												walk_to(src,mytarget)
											if(mytarget.x<src.x)
												Attack(mytarget)
												walk_to(src,mytarget)
											if(mytarget.y>src.y)
												Attack(mytarget)
												walk_to(src,mytarget)
											if(mytarget.y<src.y)
												walk_to(src,mytarget)
											var/obj/dan_projectile/Mx = new/obj/dan_projectile(locate(src.loc))
											var/amount=(src.powerlevel/50)
											var/projdir = src.dir
											spawn()Firestraight(Mx,'sbomb.dmi',amount,projdir,src,,4)


									var/dice4 = rand(1,125)
									if(dice4==60||dice4==5||dice4==24||dice4==55||dice4==64||dice4==25||dice4==74||dice4==65||dice4==84||dice4==1||dice4==12||dice4==29||dice4==26||dice4==64||dice4==21||dice4==51||dice4==68||dice4==43||dice4==17||dice4==50||dice4==49||dice4==3||dice4==2||dice4==20||dice4==71||dice4==52||dice4==11)
										dice4=24
										walk_to(src,mytarget)											//kiblast 13%
									if(dice>=40 && dice <=73)
										Attack(mytarget)
										walk_to(src,mytarget)
									else
										dice=25
										if(src.owner!=src.target)
											var/obj/gohere
											if(mytarget.dir==NORTH || mytarget.dir==NORTHEAST)
												gohere=new(locate(mytarget.x,mytarget.y-2,mytarget.z))
											if(mytarget.dir==SOUTH || mytarget.dir==SOUTHEAST)
												gohere=new(locate(mytarget.x,mytarget.y+2,mytarget.z))
											if(mytarget.dir==EAST || mytarget.dir==NORTHWEST)
												gohere=new(locate(mytarget.x-2,mytarget.y,mytarget.z))
											if(mytarget.dir==WEST || mytarget.dir==SOUTHWEST)
												gohere=new(locate(mytarget.x+2,mytarget.y,mytarget.z))

											var/stuck=20
											var/c=0
											var/mytargetdir=mytarget.dir
											walk_to(src,gohere)
											while(stuck>0 && (src.x!=gohere.x ||src.y!=gohere.y || src.z!=gohere.z))
												stuck--
												sleep(1)
												c++
												if(c>=2)
													c=0
													if(mytargetdir==NORTH || mytargetdir==NORTHEAST)
														gohere.loc=locate(mytarget.x,mytarget.y-2,mytarget.z)
													if(mytargetdir==SOUTH || mytargetdir==SOUTHEAST)
														gohere.loc=locate(mytarget.x,mytarget.y+2,mytarget.z)
													if(mytargetdir==EAST || mytargetdir==NORTHWEST)
														gohere.loc=locate(mytarget.x-2,mytarget.y,mytarget.z)
													if(mytargetdir==WEST || mytargetdir==SOUTHWEST)
														gohere.loc=locate(mytarget.x+2,mytarget.y,mytarget.z)
											walk(src,0)
											if(mytarget.x > src.x)
												src.dir=EAST
											if(mytarget.x<src.x)
												src.dir=WEST
											if(mytarget.y>src.y)
												src.dir=NORTH
											if(mytarget.y<src.y)
												src.dir=SOUTH
											var/obj/dan_projectile/Mx = new/obj/dan_projectile(locate(src.loc))
											var/amount=(src.powerlevel/50)
											var/projdir = src.dir
											spawn()Firestraight(Mx,'rock5.dmi',amount,projdir,src,,7)

										action_taken = 1

								step_towards(src, mytarget)
								sleep(1)
								action_taken = 1

					if (action_taken)
						sleep(1)
						spawn()LifeCycle()
						return
					else
						if (prob(movement_probability))
							step_rand(src)

						sleep(lifecycle_delay)
						spawn()LifeCycle()
				else
					src.nap()

		if(src.freerange==2)
			while(src.move==0)
				sleep(10)
				sleep(rand(5,10))
			if(src.move!=0)
				var/countergo=0
				for(var/mob/characters/D in oview(26,src))
					if(D.client)
						countergo=1
				if(countergo==1)
					if(src.z==10||src.z==2||src.z==3&&src.x<140||src.z==12||src.dead==1||src.z==17)
						del(src)
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

					for(var/mob/characters/other_mob in oview(1, src))
						if(other_mob)
							Attack(other_mob)
							action_taken = 1

					for (var/mob/characters/other_mob in oview(20, src))

						var/random=rand(1,20)
						if(random==20)
							if(!(abs(other_mob.x-src.x)<=3)&&!(abs(other_mob.y-src.y)<=3))
								Special(other_mob)
								action_taken = 1
						else
							step_towards(src, other_mob)
							sleep(1)
							action_taken = 1

					if (action_taken)
						sleep(1)
						spawn()LifeCycle()
						return
					..()
				else
					src.nap()
	nap()
		sleep(rand(10,30))
		var/inview=0
		for(var/mob/characters/D in oview(35,src))
			if(D.client)
				inview=1
		if(inview==1)
			if(src.isnap==0)
				spawn()src.LifeCycle()
		else
			src.isnap = 1
		return
mob/var/isnap=0