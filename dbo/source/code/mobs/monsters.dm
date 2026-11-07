var
	monster
		monsters[0]

proc
	monster_loop()
		set background = 1
		while(1)
			for(var/monster/M in monsters)
				if(!M.transforming && (!M.dead || istype(M,/monster/train)))
					M.action()
			sleep(10)

monster
	parent_type = /mob
	mon = 1
	npc = 0
	ap = -100
	New()
		. = ..()
		CreateName()
		monsters += src

	var
		mob
			target
		plgivemin = 0
		plgivemax = 0
		kigivemin = 0
		kigivemax = 0
		goldmin = 0
		goldmax = 0
		skexpgivemin = 0
		skexpgivemax = 0
		canfly
		shoot
		Attack

	Dead(mob/killer, delay = 1000)
		//if(killer.ap < 0)
			//return
		if(!istype(killer, /monster))
			killer.powerlevel.max_value += rand(plgivemin, plgivemax)
			killer.ki.max_value += rand(kigivemin, kigivemax)
			killer.skexp += rand(skexpgivemin, skexpgivemax)
			killer.Levelup()
			if(killer.ap>=1000)
				killer.ap=1000
			else
				killer.ap+= 10
		var/obj/zennibag/ZB = new(loc)
		ZB.zenni = rand(goldmin, goldmax)
		respawn(src, delay)



	proc
		action()
			if(target && (!(target in oview(src)) || target.dead))
				target = null
			else if(!target)
				step_rand(src)
				for(var/mob/M in oview(src))
					if((istype(M, /mob/characters) && M.ap >= 0 && M.powerlevel.value<(src.powerlevel.value*40)) || istype(M, /monster/friendly))
						target = M
						if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
							return
						else
							target = null
			else if(get_dist(src, target) <= 1)
				attack(target)
			else if(base_StepTowards(target, 1, 6) < 0)
				if(canfly)
					if(!flight)
						viewers(src) << "[src] flies up into the air!"
						viewers(src) << 'sounds/buku.wav'
						icon_state = "buku"
						loc=locate(x,y+3,z)
						var/obj/bukuspot/A = new(null)
						overlays += A
						density = 0
						flight = 1
						meditate = 0
						rest = 0
						spawn(100)
							viewers(src) << "[src] lands on the ground!"
							viewers(src) << 'sounds/buku_land.wav'
							move = 0
							loc=locate(x,y-3,z)
							var/obj/bukuspot/B = new(null)
							overlays -= B
							move = 1
							density = 1
							flight = 0
							meditate = 0
							rest = 0
							icon_state = ""
					else
						target = null
						for(var/mob/M in oview(src))
							if((istype(M, /mob/characters) && M.ap >= 0 && M.powerlevel.value<(src.powerlevel.value*40)) || istype(M, /monster/friendly))
								target = M
								if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
									return
								else
									target = null

		attack(mob/M)
			M.TakeDamage(src)











	quest
		Pikkon
			name = "(TRAINER) Paikuhan"
			powerlevel = new(67000000)
			dead = 1
			icon = 'icons/pikkon.dmi'
			race = "Unknown"
			ki = new(120000)
			plgivemin = 2010000
			plgivemax = 6030000
			kigivemin = 2010000
			kigivemax = 6030000
			goldmin = 335000
			goldmax = 1675000
			skexpgivemin = 6700
			skexpgivemax = 6700
			powerup = 1
			Dead(mob/killer)
				killer.strain = 3
				killer.sfinish = 1
				. = ..()
		saibaking
			name = "(Quest) SaibaKing"
			icon = 'icons/hard.dmi'
			state = "Normal"
			race = "Saibaman"
			powerlevel = new(1200000)
			ki = new(120000)
			plgivemin = 36000
			plgivemax = 108000
			kigivemin = 36000
			kigivemax = 108000
			goldmin = 6000
			goldmax = 30000
			skexpgivemin = 120
			skexpgivemax = 120
			canfly = 1
			shoot = 1
		tao
			name = "(Quest) Tao Pai Pai"
			icon = 'icons/tao.dmi'
			state = "Normal"
			race = "Cyborg"
			powerlevel = new(400)
			ki = new(120)
			plgivemin = 30
			plgivemax = 60
			kigivemin = 30
			kigivemax = 60
			goldmin = 2
			goldmax = 10
			skexpgivemin = 1
			skexpgivemax = 2
			shot = 1
			powerup = 1
			var
				tao_dead

			Dead(mob/killer)
				if(!tao_dead)
					usr.taodead = 1
					transforming = 1
					powerlevel.value = powerlevel.max_value
					ki.value = ki.max_value
					tao_dead = 1
					ko = 0
					transforming = 0
				else
					view() << "<FONT COLOR = RED>[src]:</FONT> What the!!?.. Noo!!"
					tao_dead = 0
					..(killer, 2000)
		AdultDinosaur
			name = "(Quest) Adult Dinosaur"
			powerlevel = new(1000)
			npp = 0
			dead = 0
			icon = 'icons/dinobird.dmi'
			icon_state = ""
			ko = 0
			npp = 0
			mon = 1
			ssj = 0
			plgivemin = 30
			plgivemax = 90
			kigivemin = 30
			kigivemax = 90
			skexpgivemin = 1
			skexpgivemax = 3
			altatt = 1
			race = "Dinosaur"
			state = "Normal"
			Dead(mob/killer)
				transforming = 1
				powerlevel.value = powerlevel.max_value
				ki.value = ki.max_value
				new /obj/items/dinoeggs(get_step(src,SOUTH))
				ko = 0
				transforming = 0
				..(killer, 1000)
		Dragon
			name = "(ENEMY) Flying Dragon"
			powerlevel = new(32000)
			npp = 0
			dead = 0
			icon = 'icons/dragon.dmi'
			icon_state = ""
			ko = 0
			npp = 0
			mon = 1
			ssj = 0
			plgivemin = 1000
			plgivemax = 3000
			kigivemin = 1000
			kigivemax = 3000
			skexpgivemin = 3
			skexpgivemax = 3
			density = 0
			altatt = 1
			race = "Dragon"
			state = "Normal"
		Brolly
			name = "(Quest) Brolly"
			race = "Saiyan"
			icon = 'icons/brolli.dmi'
			icon_state = "ussj"
			race = "Saiyan"
			powerlevel = new(900000000)
			ki = new(80000000)
			plgivemin = 27000000
			plgivemax = 81000000
			kigivemin = 27000000
			kigivemax = 81000000
			skexpgivemin = 90000
			skexpgivemax = 90000
			canfly = 1

	evil
		JDemon
			name = "(Hell's) Demon"
			race = "Demon"
			icon = 'icons/Jdemon.dmi'
			powerlevel = new(50000000)
			ki = new(8000000)
			plgivemin = 1500000
			plgivemax = 4500000
			kigivemin = 1500000
			kigivemax = 4500000
			goldmin = 250000
			goldmax = 1250000
			skexpgivemin = 5000
			skexpgivemax = 5000
			canfly = 0
			powerup = 1
		snake
			name = "(Enemy) Princess Snake"
			race = "Demon"
			icon = 'icons/Snake.dmi'
			powerlevel = new(20000)
			ki = new(8000)
			plgivemin = 600
			plgivemax = 1800
			kigivemin = 600
			kigivemax = 1800
			goldmin = 100
			goldmax = 500
			skexpgivemin = 2
			skexpgivemax = 2
			canfly = 1
		thug
			name = "(Enemy) Thug"
			race = "Earthling"
			icon = 'icons/thug.dmi'
			powerlevel = new(100)
			ki = new(100)
			plgivemin = 5
			plgivemax = 15
			kigivemin = 5
			kigivemax = 15
			goldmin = 1
			goldmax = 5
			skexpgivemin = 1
			skexpgivemax = 1
			canfly = 0

	saiyansaga
		saibaman
			name = "(Saiyan Saga) Saibaman"
			icon = 'icons/saiba.dmi'
			state = "Normal"
			race = "Saibaman"
			powerlevel = new(600)
			ki = new(120)
			dead = 0
			plgivemin = 25
			plgivemax = 75
			kigivemin = 25
			kigivemax = 75
			goldmin = 4
			goldmax = 20
			skexpgivemin = 1
			skexpgivemax = 1
		raditz
			name = "(Saiyan Saga) Raditz"
			icon = 'icons/RADITZ.dmi'
			state = "Normal"
			race = "Saiyan"
			powerlevel = new(1200)
			ki = new(120)
			plgivemin = 36
			plgivemax = 108
			kigivemin = 36
			kigivemax = 108
			goldmin = 6
			goldmax = 30
			skexpgivemin = 1
			skexpgivemax = 1
			canfly = 1
			shot = 1
			powerup = 1
			var
				radead

			Dead(mob/killer)
				if(!radead)
					usr.rad_dead = 1
					transforming = 1
					powerlevel.value = powerlevel.max_value
					ki.value = ki.max_value
					radead = 1
					ko = 0
					transforming = 0
				else
					view() << "<FONT COLOR = RED>[src]:</FONT> Nooo!!.. It Can't.. be..!"
					radead = 0
					..(killer, 2000)
		nappa
			name = "(Saiyan Saga) Nappa"
			icon = 'icons/gbanappa.dmi'
			state = "Normal"
			race = "Saiyan"
			powerlevel = new(4000)
			ki = new(400)
			plgivemin = 120
			plgivemax = 360
			kigivemin = 120
			kigivemax = 360
			skexpgivemin = 1
			skexpgivemax = 1
			goldmin = 20
			goldmax = 100
			canfly = 1
			shot = 1
			powerup = 1
			var
				sabaimen

			Dead(mob/killer)
				if(!sabaimen)
					transforming = 1
					view() << "<FONT COLOR = RED>[src]:</FONT> Hmph. These'll take care of YOU!"
					view() << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] creates 5 saibamen!</FONT><font color = green> *</FONT>"
					new /monster/saiyansaga/saibaman(get_step(src,EAST))
					new /monster/saiyansaga/saibaman(get_step(src,WEST))
					new /monster/saiyansaga/saibaman(get_step(src,SOUTH))
					new /monster/saiyansaga/saibaman(get_step(src,NORTHEAST))
					new /monster/saiyansaga/saibaman(get_step(src,NORTHWEST))
					powerlevel.value = powerlevel.max_value
					ki.value = ki.max_value
					sabaimen = 1
					ko = 0
					transforming = 0
				else
					sabaimen = 0
					..(killer, 2000)
		vegeta
			name = "(Saiyan Saga) Vegeta"
			icon = 'icons/gbavegeta.dmi'
			New_Tech = "Energy Ring"
			state = "Normal"
			race = "Saiyan"
			powerlevel = new(18000)
			ki = new(1800)
			plgivemin = 2160
			plgivemax = 6480
			kigivemin = 2160
			kigivemax = 6480
			goldmin = 360
			goldmax = 1800
			skexpgivemin = 2
			skexpgivemax = 2
			canfly = 1
			shot = 1
			powerup = 1
			Dead(mob/killer)
				if(state == "Normal")
					transforming = 1
					view() << 'sounds/destruct.wav'
					view() << "<FONT COLOR = RED>[src]:</FONT> Your a very rare fighter indeed.. it's not often that I'm urged to transform because of a low class dog such as yourself!"
					view() << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Oozaru!</FONT><font color = green> *</FONT>"
					state = "Oozaru"
					powerlevel.max_value *= 8
					powerlevel.restore()
					ki.max_value *=  8
					ki.restore()
					icon = 'icons/monkey.dmi'
					icon_state = ""
					overlays.Cut()
					overlays += new /obj/MonkeyTop()
					name = "(Saiyan Saga) Oozaru Vegeta"
					CreateName()
					ko = 0
					transforming = 0
				else
					state = "Normal"
					powerlevel.max_value = 18000
					powerlevel.value = 18000
					ki.max_value = 1800
					ki.value = 1800
					name = "(Saiyan Saga) Vegeta"
					icon = 'icons/gbavegeta.dmi'
					overlays.Cut()
					CreateName()
					killer.fame++
					..(killer, 2000)

	friezasaga
		ginyuforce
			ginyu
				name = "(Freeza Saga) Ginyu"
				icon = 'icons/ginew.dmi'
				race = "Alien"
				powerlevel = new(180000)
				ki = new(12000)
				plgivemin = 5400
				plgivemax = 16200
				kigivemin = 5400
				kigivemax = 16200
				goldmin = 900
				goldmax = 4500
				skexpgivemin = 18
				skexpgivemax = 18
				canfly = 1
				shoot = 1
			jeice
				name = "(Freeza Saga) Jeice"
				icon = 'icons/jiece.dmi'
				race = "Alien"
				powerlevel = new(90000)
				ki = new(5000)
				plgivemin = 2700
				plgivemax = 8100
				kigivemin = 2700
				kigivemax = 8100
				skexpgivemin = 9
				skexpgivemax = 9
				goldmin = 450
				goldmax = 2250
				canfly = 1
				shoot = 1
			burter
				name = "(Freeza Saga) Burter"
				icon = 'icons/baata.dmi'
				race = "Alien"
				powerlevel = new(90000)
				ki = new(5000)
				plgivemin = 2700
				plgivemax = 8100
				kigivemin = 2700
				kigivemax = 8100
				skexpgivemin = 9
				skexpgivemax = 9
				goldmin = 450
				goldmax = 2250
				canfly = 1
				shoot = 1
			recoom
				name = "(Freeza Saga) Recoom"
				icon = 'icons/racoom.dmi'
				race = "Alien"
				powerlevel = new(90000)
				ki = new(5000)
				plgivemin = 2700
				plgivemax = 8100
				kigivemin = 2700
				kigivemax = 8100
				skexpgivemin = 9
				skexpgivemax = 9
				goldmin = 450
				goldmax = 2250
				canfly = 1
				shoot = 1
			guldo
				name = "(Freeza Saga) Guldo"
				icon = 'icons/gurdo.dmi'
				race = "Alien"
				powerlevel = new(40000)
				ki = new(1000)
				plgivemin = 1200
				plgivemax = 3600
				kigivemin = 1200
				kigivemax = 3600
				skexpgivemin = 4
				skexpgivemax = 4
				goldmin = 200
				goldmax = 1000
				canfly = 1
				shoot = 1
			Henchmen
				name = "Henchmen"
				icon = 'icons/henchmen.dmi'
				race = "Alien"
				powerlevel = new(15000)
				ki = new(6000)
				plgivemin = 450
				plgivemax = 1350
				kigivemin = 450
				kigivemax = 1350
				skexpgivemin = 2
				skexpgivemax = 2
				goldmin = 75
				goldmax = 375
				canfly = 0
				shoot = 1
			EliteHenchmen
				name = "Elite Henchmen"
				icon = 'icons/henchmen2.dmi'
				race = "Alien"
				powerlevel = new(40000)
				ki = new(20000)
				plgivemin = 1200
				plgivemax = 3600
				kigivemin = 1200
				kigivemax = 3600
				skexpgivemin = 4
				skexpgivemax = 4
				goldmin = 200
				goldmax = 1000
				canfly = 0
				shoot = 1
			EliteHenchmen2
				name = "High Elite Henchmen"
				icon = 'icons/henchmen2.dmi'
				race = "Mutant Alien"
				powerlevel = new(500000)
				ki = new(60000)
				plgivemin = 15000
				plgivemax = 45000
				kigivemin = 15000
				kigivemax = 45000
				skexpgivemin = 50
				skexpgivemax = 50
				goldmin = 2500
				goldmax = 12500
				canfly = 0
				shoot = 1
			dodoria
				name = "(Freeza Saga) Dodoria"
				icon = 'icons/dodoria.dmi'
				race = "Alien"
				powerlevel = new(22000)
				ki = new(5000)
				plgivemin = 600
				plgivemax = 1980
				kigivemin = 600
				kigivemax = 1980
				skexpgivemin = 2
				skexpgivemax = 2
				goldmin = 110
				goldmax = 550
				canfly = 1
				shoot = 1
			zarbon
				name = "(Freeza Saga) Zarbon"
				icon = 'icons/Zarbon.dmi'
				race = "Alien"
				powerlevel = new(30000)
				ki = new(5000)
				plgivemin = 900
				plgivemax = 2700
				kigivemin = 900
				kigivemax = 2700
				skexpgivemin = 3
				skexpgivemax = 3
				goldmin = 150
				goldmax = 750
				canfly = 1
				shoot = 1
			KingKold
				name = "(Cell Saga) King Kold"
				icon = 'icons/kingkold.dmi'
				race = "Changling"
				powerlevel = new(10000000)
				ki = new(50000)
				plgivemin = 300000
				plgivemax = 900000
				kigivemin = 300000
				kigivemax = 900000
				skexpgivemin = 1000
				skexpgivemax = 1000
				goldmin = 50000
				goldmax = 250000
				canfly = 1
				shoot = 1
			MetalFrieza
				name = "(Cell Saga) Metal Freeza"
				icon = 'icons/metal_frieza.dmi'
				race = "Reconstructed Changling"
				powerlevel = new(9000000)
				ki = new(875000)
				plgivemin = 270000
				plgivemax = 810000
				kigivemin = 270000
				kigivemax = 810000
				skexpgivemin = 900
				skexpgivemax = 900
				goldmin = 45000
				goldmax = 225000
				canfly = 1
				shoot = 1
			Cooler
				name = "(Quest) Cooler"
				icon = 'icons/ChangeForm6.dmi'
				state = "Normal"
				race = "Changling"
				powerlevel = new(15000000)
				ki = new(530000)
				plgivemin = 450000
				plgivemax = 1350000
				kigivemin = 450000
				kigivemax = 1350000
				skexpgivemin = 1500
				skexpgivemax = 1500
				goldmin = 75000
				goldmax = 375000
				canfly = 1
		frieza
			name = "(Freeza Saga) Freeza"
			icon = 'icons/changling.dmi'
			state = "Normal"
			race = "Chang;ing"
			powerlevel = new(530000)
			ki = new(53000)
			plgivemin = 90000
			plgivemax = 270000
			kigivemin = 90000
			kigivemax = 270000
			skexpgivemin = 300
			skexpgivemax = 300
			goldmin = 15000
			goldmax = 75000
			canfly = 1
			shoot = 1
			Dead(mob/killer)
				if(state == "Normal")
					transforming = 1
					view(src) << 'sounds/changling_trans_2.wav'
					view(src) << "<FONT COLOR = RED>[src]: </FONT>Face my next form! My Power Level is now over 1 Million!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into 2nd Form!</FONT><font color = green> *</FONT>"
					flick("form2",src)
					state = "Form 2"
					powerlevel.max_value = 1060000
					powerlevel.value = 1060000
					ki.value = 106000
					ki.max_value =  106000
					icon = 'icons/ChangeForm2.dmi'
					icon_state = ""
					ko = 0
					transforming = 0
				else if(state == "Form 2")
					transforming = 1
					view(src) << 'sounds/changling_trans_2.wav'
					view(src) << "<FONT COLOR = RED>[src]: </FONT>No more play time!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into 3rd Form!</FONT><font color = green> *</FONT>"
					flick("form3",src)
					powerlevel.value = 2120000
					powerlevel.max_value = 2120000
					ki.value = 212000
					ki.max_value =  212000
					icon='icons/ChangeForm3.dmi'
					state = "Form 3"
					ko = 0
					transforming = 0
				else if(state == "Form 3")
					transforming = 1
					view(src) << 'sounds/changling_trans.wav'
					view(src) << "<FONT COLOR = RED>[src]: </FONT>You will not beat me!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into 4th Form (50%)!</FONT><font color = green> *</FONT>"
					flick("form4",src)
					powerlevel.value = 4240000
					powerlevel.max_value = 4240000
					ki.value = 424000
					ki.max_value =  424000
					icon='icons/ChangeForm4.dmi'
					state = "Form 4 (50%)"
					ko = 0
					transforming = 0
				else if(state == "Form 4 (50%)")
					transforming = 1
					view(src) << 'sounds/changling_trans.wav'
					view(src) << "<FONT COLOR = RED>[src]: </FONT>You will meet your end! No one mocks Frieza!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] powers up to 100%!</FONT><font color = green> *</FONT>"
					flick("form4power",src)
					powerlevel.value = 8480000
					powerlevel.max_value = 8480000
					ki.value = 848000
					ki.max_value =  848000
					lspecial = 1
					lightningrand2()
					icon='icons/ChangeForm5.dmi'
					state = "Form 4 (100%)"
					ko = 0
					transforming = 0
				else
					state = "Normal"
					powerlevel.max_value = 530000
					powerlevel.value = 530000
					ki.value = 53000
					ki.max_value =  53000
					lspecial = 0
					icon = 'icons/changling.dmi'
					killer.chq += 2
					killer.fame += 5
					..(killer, 2000)

	cellsaga
		android17
			name = "(Cell Saga) Android 17"
			icon = 'icons/android17.dmi'
			state = "Normal"
			race = "Android"
			powerlevel = new(18000000)
			ki = new(1200000)
			plgivemin = 255000
			plgivemax = 765000
			kigivemin = 255000
			kigivemax = 765000
			skexpgivemin = 850
			skexpgivemax = 850
			goldmin = 42500
			goldmax = 212500
			canfly = 1
		android18
			name = "(Cell Saga) Android 18"
			icon = 'icons/android18.dmi'
			state = "Normal"
			race = "Android"
			powerlevel = new(17000000)
			ki = new(1000000)
			plgivemin = 225000
			plgivemax = 675000
			kigivemin = 225000
			kigivemax = 675000
			skexpgivemin = 750
			skexpgivemax = 750
			goldmin = 37500
			goldmax = 187500
			canfly = 1
		android19
			name = "(Cell Saga) Android 19"
			icon = 'icons/android19.dmi'
			state = "Normal"
			race = "Android"
			powerlevel = new(12000000)
			ki = new(1000000)
			plgivemin = 360000
			plgivemax = 1080000
			kigivemin = 360000
			kigivemax = 1080000
			skexpgivemin = 1200
			skexpgivemax = 1200
			goldmin = 60000
			goldmax = 300000
			canfly = 1
		android20
			name = "(Cell Saga) Android 20"
			icon = 'icons/android20.dmi'
			state = "Normal"
			race = "Android"
			powerlevel = new(14000000)
			ki = new(1000000)
			plgivemin = 420000
			plgivemax = 1260000
			kigivemin = 420000
			kigivemax = 1260000
			skexpgivemin = 1400
			skexpgivemax = 1400
			goldmin = 70000
			goldmax = 350000
			canfly = 1
		celljr
			name = "(Cell Saga) Cell Jr"
			icon = 'icons/cell jr..dmi'
			race = "Cell Spawn"
			powerlevel = new(15000000)
			ki = new(50000)
			plgivemin = 450000
			plgivemax = 1350000
			kigivemin = 450000
			kigivemax = 1350000
			skexpgivemin = 1500
			skexpgivemax = 1500
			goldmin = 75000
			goldmax = 375000
			canfly = 1
		cell
			name = "(Cell Saga) Cell"
			icon = 'icons/biocell1.dmi'
			state = "Normal"
			race = "Android (Biological)"
			powerlevel = new(70000000)
			ki = new(50000000)
			plgivemin = 3000000
			plgivemax = 9000000
			kigivemin = 3000000
			kigivemax = 9000000
			skexpgivemin = 10000
			skexpgivemax = 10000
			goldmin = 500000
			goldmax = 2500000
			canfly = 1
			var
				celljrs

			Dead(mob/killer)
				if(state == "Normal")
					transforming = 1
					view(src) << 'sounds/celltrans2.wav'
					view(src) << "<FONT COLOR = RED>[src]:</FONT> Heh, your pretty strong! But, not enough for my next form!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Semi-Perfect Form!</FONT><font color = green> *</FONT>"
					flick("trans",src)
					powerlevel.max_value = 140000000
					powerlevel.value = 140000000
					ki.value = 100000000
					ki.max_value =  100000000
					icon = 'icons/biocell2.dmi'
					state = "Semi-Perfect"
					name = "(Cell Saga) Semi-Perfect Cell"
					overlays.Cut()
					CreateName()
					icon_state = ""
					ko = 0
					transforming = 0
				else if(state == "Semi-Perfect")
					transforming = 1
					view(src) << 'sounds/celltrans2.wav'
					view(src) << "<FONT COLOR = RED>[src]:</FONT> You will feel the wrath of Cell!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Perfect Form!</FONT><font color = green> *</FONT>"
					flick("trans",src)
					powerlevel.value = 280000000
					powerlevel.max_value = 280000000
					ki.value = 200000000
					ki.max_value =  200000000
					icon='icons/biocell3.dmi'
					state = "Perfect"
					name = "(Cell Saga) Perfect Cell"
					overlays.Cut()
					CreateName()
					ko = 0
					transforming = 0
				else if(state == "Perfect" && !celljrs)
					transforming = 1
					view(src) << "<FONT COLOR = RED>[src]:</FONT> HOW DO YOU LIKE THIS!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] creates 5 Cell Jrs!</FONT><font color = green> *</FONT>"
					new /monster/cellsaga/celljr(get_step(src,EAST))
					new /monster/cellsaga/celljr(get_step(src,WEST))
					new /monster/cellsaga/celljr(get_step(src,SOUTH))
					new /monster/cellsaga/celljr(get_step(src,NORTHEAST))
					new /monster/cellsaga/celljr(get_step(src,NORTHWEST))
					celljrs = 1
					powerlevel.value = powerlevel.max_value
					ki.value = ki.max_value
					ko = 0
					transforming = 0
				else if(state == "Perfect" && celljrs)
					transforming = 1
					view(src) << 'sounds/celltrans.wav'
					view(src) << "<FONT COLOR = RED>[src]:</FONT> YOU'RE NO MATCH FOR ME!"
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Perfect Form (Weighted)!</FONT><font color = green> *</FONT>"
					overlays += 'icons/wind.dmi'
					overlays += 'icons/elec.dmi'
					sleep(100)
					view(src) << 'sounds/celltrans_2.wav'
					overlays -= 'icons/wind.dmi'
					powerlevel.value = 560000000
					powerlevel.max_value = 560000000
					ki.value = 400000000
					ki.max_value =  400000000
					icon='icons/biocell3.dmi'
					state = "Perfect (Weighted)"
					ko = 0
					transforming = 0
				else
					state = "Normal"
					powerlevel.max_value = 70000000
					powerlevel.value = 70000000
					ki.value = 50000000
					ki.max_value =  50000000
					lspecial = 0
					celljrs = 0
					name = "(Cell Saga) Cell"
					icon = 'icons/biocell1.dmi'
					overlays.Cut()
					CreateName()
					killer.fame += 20
					..(killer, 2000)

	buusaga
		buu
			name = "(Buu Saga) Fat Buu"
			icon = 'icons/Fat Buu.dmi'
			state = "Normal"
			race = "Buu"
			New_Tech = "HEA"
			powerlevel = new(1000000000)
			ki = new(100000000)
			plgivemin = 30000000
			plgivemax = 90000000
			kigivemin = 30000000
			kigivemax = 90000000
			skexpgivemin = 100000
			skexpgivemax = 100000
			goldmin = 5000000
			goldmax = 25000000
			canfly = 1
			Dead(mob/killer)
				if(state == "Normal")
					transforming = 1
					view(src) << 'sounds/buu_trans.wav'
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Super Buu!</FONT><font color = green> *</FONT>"
					flick("fattosuper", src)
					powerlevel.max_value = 2000000000
					powerlevel.value = 2000000000
					ki.value = 200000000
					ki.max_value =  200000000
					icon = 'icons/Super Buu.dmi'
					state = "Super Buu"
					name = "(Buu Saga) Super Buu"
					overlays.Cut()
					CreateName()
					icon_state = ""
					ko = 0
					transforming = 0
				else if(state == "Super Buu")
					transforming = 1
					view(src) << 'sounds/buu_trans2.wav'
					sleep(22)
					view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to revert from Super Buu and is now Kid Buu!</FONT><font color = green> *</FONT>"
					view(src) << 'sounds/revert.wav'
					flick("revert",src)
					powerlevel.value = 4000000000
					powerlevel.max_value = 4000000000
					ki.value = 400000000
					ki.max_value =  400000000
					icon='icons/buu.dmi'
					state = "Kid Buu"
					name = "(Buu Saga) Kid Buu"
					overlays.Cut()
					CreateName()
					ko = 0
					transforming = 0
				else
					state = "Normal"
					powerlevel.max_value = 1000000000
					powerlevel.value = 1000000000
					ki.value = 100000000
					ki.max_value =  100000000
					lspecial = 0
					name = "(Buu Saga) Fat Buu"
					icon = 'icons/Fat Buu.dmi'
					overlays.Cut()
					CreateName()
					killer.fame += 50
					..(killer, 2000)
		BabiHench
			name = "(ENEMY) Babidi Henchman"
			icon = 'icons/Majinfighter.dmi'
			race = "Alien"
			powerlevel = new(60000000)
			ki = new(6000000)
			plgivemin = 1800000
			plgivemax = 5400000
			kigivemin = 1800000
			kigivemax = 5400000
			goldmin = 300000
			goldmax = 1500000
			skexpgivemin = 6000
			skexpgivemax = 6000
			canfly = 1

	friendly
		ap = 100
		action()
			if(target && (!(target in oview(src)) || target.dead))
				target = null
			if(!target)
				step_rand(src)
				for(var/mob/M in oview(src))
					if(istype(M, /monster) && !istype(M, /monster/friendly) && !istype(M, /monster/quest) && !istype(M, /monster/train) || (istype(M, /mob/characters) && M.ap < 0 && M.powerlevel.value<(src.powerlevel.value*40)))
						target = M
						if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
							return
						else
							target = null
			else if(get_dist(src, target) <= 1)
				attack(target)
			else if(base_StepTowards(target, 1, 6)  < 0)
				if(canfly)
					viewers(src) << "[src] flies up into the air!"
					viewers(src) << 'sounds/buku.wav'
					icon_state = "buku"
					loc=locate(x,y+3,z)
					var/obj/bukuspot/A = new(null)
					overlays += A
					density = 0
					flight = 1
					meditate = 0
					rest = 0
					spawn(600)
						viewers(src) << "[src] lands on the ground!"
						viewers(src) << 'sounds/buku_land.wav'
						move = 0
						loc=locate(x,y-3,z)
						var/obj/bukuspot/B = new(null)
						overlays -= B
						move = 1
						density = 1
						flight = 0
						meditate = 0
						rest = 0
						icon_state = ""
				else
					target = null
					for(var/mob/M in oview(src))
						if((istype(M, /mob/characters) && M.ap >= 0 && M.powerlevel.value<(src.powerlevel.value*40)) || istype(M, /monster/friendly))
							target = M
							if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
								return
							else
								target = null
		Dead(mob/killer, delay = 1000)
			//if(killer.ap >= 0)
				//return
			if(!istype(killer, /monster))
				killer.powerlevel.max_value += rand(plgivemin, plgivemax)
				killer.ki.max_value += rand(kigivemin, kigivemax)
				killer.skexp += rand(skexpgivemin, skexpgivemax)
				killer.Levelup()
				killer.kills++
				if(killer.ap<=-1000)
					killer.ap=-1000
				else
					killer.ap-= 10
			var/obj/zennibag/ZB = new(loc)
			ZB.zenni = rand(goldmin, goldmax)
			respawn(src, delay)

		saiyansaga
			goku
				name = "(Saiyan Saga) Goku"
				icon = 'icons/male.dmi'
				hair = "Goku"
				state = "Normal"
				race = "Saiyan"
				powerlevel = new(8000)
				ki = new(250)
				plgivemin = 480
				plgivemax = 1440
				kigivemin = 480
				kigivemax = 1440
				skexpgivemin = 2
				skexpgivemax = 2
				goldmin = 80
				goldmax = 400
				canfly = 1
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/gokugi.dmi'

				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						icon_state = "ssj"
						overlays += 'icons/wind.dmi'
						view(src) << 'sounds/kaioken.wav'
						view(src) << "<FONT COLOR = RED>[src]:</FONT> KAIOKEN TIMES 3!!!"
						dspecial = 1
						sleep(27)
						view(src) << 'sounds/aura.wav'
						flyingrocks()
						icon_state = ""
						move = 1
						kaiokuse = 0
						overlays += /obj/kkauratop
						underlays += /obj/kkaurabottom
						overlays -= 'icons/wind.dmi'
						kaioken = 1
						state = "Kaioken"
						powerlevel.max_value *= 3
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 3
						ki.value = ki.max_value
						ko = 0
						transforming = 0
					else
						state = "Normal"
						overlays.Cut()
						CreateName()
						hairrestore()
						overlays += 'icons/gokugi.dmi'
						lspecial = 0
						powerlevel.max_value = 2500
						powerlevel.value = 2500
						ki.value = 250
						ki.max_value =  250
						lspecial = 0
						icon = 'icons/male.dmi'
						killer.fame++
						..(killer, 2000)

			piccolo
				name = "(Saiyan Saga) Piccolo"
				icon = 'icons/log3 piccolo.dmi'
				race = "Namekian"
				powerlevel = new(5000)
				ki = new(500)
				plgivemin = 150
				plgivemax = 450
				kigivemin = 150
				kigivemax = 450
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 25
				goldmax = 125
				canfly = 1
			chaozu
				name = "(Saiyan Saga) Chaozu"
				icon = 'icons/chaozu.dmi'
				powerlevel = new(600)
				ki = new(600)
				plgivemin = 25
				plgivemax = 75
				kigivemin = 25
				kigivemax = 75
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 4
				goldmax = 20
			tenshinhan
				name = "(Saiyan Saga) Tenshinhan"
				icon = 'icons/tenshinhan.dmi'
				powerlevel = new(3000)
				ki = new(600)
				plgivemin = 25
				plgivemax = 75
				kigivemin = 25
				kigivemax = 75
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 4
				goldmax = 20
			yamcha
				name = "(Saiyan Saga) Yamcha"
				icon = 'icons/log3 yamcha.dmi'
				powerlevel = new(1200)
				ki = new(600)
				plgivemin = 25
				plgivemax = 75
				kigivemin = 25
				kigivemax = 75
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 4
				goldmax = 20
			krillin
				name = "(Saiyan Saga) Krillin"
				icon = 'icons/Krillin.dmi'
				powerlevel = new(2000)
				ki = new(600)
				plgivemin = 25
				plgivemax = 75
				kigivemin = 25
				kigivemax = 75
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 4
				goldmax = 20
			gohan
				name = "(Saiyan Saga) Gohan"
				icon = 'icons/pGohan.dmi'
				powerlevel = new(2000)
				ki = new(600)
				plgivemin = 25
				plgivemax = 75
				kigivemin = 25
				kigivemax = 75
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 4
				goldmax = 20
			thug
				name = "(Friendly) Thug"
				race = "Earthling"
				icon = 'icons/thug.dmi'
				powerlevel = new(100)
				ki = new(100)
				plgivemin = 5
				plgivemax = 15
				kigivemin = 5
				kigivemax = 15
				goldmin = 1
				goldmax = 5
				skexpgivemin = 1
				skexpgivemax = 1
				canfly = 0


		friezasaga
			goku
				name = "(Freeza Saga) Goku"
				icon = 'icons/male.dmi'
				hair = "Goku"
				state = "Normal"
				race = "Saiyan"
				powerlevel = new(3000000)
				ki = new(300000)
				plgivemin = 90000
				plgivemax = 270000
				kigivemin = 90000
				kigivemax = 270000
				skexpgivemin = 300
				skexpgivemax = 300
				goldmin = 15000
				goldmax = 75000
				canfly = 1
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/gokugi.dmi'

				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into a Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_transform.wav'
						overlays += 'icons/ssjpowerup.dmi'
						icon_state = "ssj"
						dspecial = 1
						flyingrocks()
						dseffect()
						sleep(35)
						icon_state = ""
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays -= 'icons/ssjpowerup.dmi'
						hairremoval()
						ssjhairrestore()
						underlays += /obj/SSAuraBottom
						overlays += /obj/SSAuraTop
						ssjaura = 1
						state = "Super Saiyan"
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						ko = 0
						transforming = 0
					else
						state = "Normal"
						overlays.Cut()
						CreateName()
						hairrestore()
						overlays += 'icons/gokugi.dmi'
						lspecial = 0
						powerlevel.max_value = 250000
						powerlevel.value = 250000
						ki.value = 25000
						ki.max_value =  25000
						lspecial = 0
						icon = 'icons/male.dmi'
						killer.fame += 5
						..(killer, 2000)

			krillin
				name = "(Freeza Saga) Krillin"
				icon = 'icons/nKrillin.dmi'
				race = "Earthling"
				powerlevel = new(60000)
				ki = new(60000)
				plgivemin = 1800
				plgivemax = 5400
				kigivemin = 1800
				kigivemax = 5400
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 300
				goldmax = 1500
				canfly = 1
			gohan
				name = "(Freeza Saga) Gohan"
				icon = 'icons/nGohan.dmi'
				race = "Half Saiyan"
				powerlevel = new(100000)
				ki = new(100000)
				plgivemin = 3000
				plgivemax = 9000
				kigivemin = 3000
				kigivemax = 9000
				skexpgivemin = 10
				skexpgivemax = 10
				goldmin = 500
				goldmax = 2500
				canfly = 1
			piccolo
				name = "(Freeza Saga) Piccolo"
				icon = 'icons/log3 piccolo.dmi'
				race = "Namekian"
				powerlevel = new(300000)
				ki = new(300000)
				plgivemin = 9000
				plgivemax = 27000
				kigivemin = 9000
				kigivemax = 27000
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 1500
				goldmax = 7500
				canfly = 1
			vegeta
				name = "(Freeza Saga) Vegeta"
				icon = 'icons/gbavegeta.dmi'
				race = "Saiyan"
				powerlevel = new(600000)
				ki = new(600000)
				plgivemin = 18000
				plgivemax = 54000
				kigivemin = 18000
				kigivemax = 54000
				skexpgivemin = 60
				skexpgivemax = 60
				goldmin = 3000
				goldmax = 15000
				canfly = 1

			Namekian
				name = "(Freeza Saga) Namekian"
				icon = 'icons/namek.dmi'
				state = "Normal"
				race =  "Namekian"
				powerlevel = new(2500)
				ki = new(2500)
				plgivemin = 125
				plgivemax = 250
				kigivemin = 125
				kigivemax = 250
				skexpgivemin = 1
				skexpgivemax = 1
				goldmin = 10
				goldmax = 50
				canfly = 1
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/cape.dmi'
			Namekian2
				name = "(Freeza Saga) Warrior Namekian"
				icon = 'icons/namek.dmi'
				state = "Normal"
				race =  "Namekian"
				powerlevel = new(40000)
				ki = new(2500)
				plgivemin = 1200
				plgivemax = 3600
				kigivemin = 1200
				kigivemax = 3600
				skexpgivemin = 4
				skexpgivemax = 4
				goldmin = 200
				goldmax = 1000
				canfly = 0
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/cape.dmi'

		cellsaga
			goku
				name = "(Cell Saga) Goku"
				icon = 'icons/male.dmi'
				hair = "Goku"
				state = "Normal"
				powerlevel = new(30000000)
				ki = new(30000000)
				plgivemin = 1800000
				plgivemax = 5400000
				kigivemin = 1800000
				kigivemax = 5400000
				skexpgivemin = 6000
				skexpgivemax = 6000
				goldmin = 300000
				goldmax = 1500000
				canfly = 1
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/gokugi.dmi'

				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into a Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_transform.wav'
						overlays += 'icons/ssjpowerup.dmi'
						icon_state = "ssj"
						dspecial = 1
						flyingrocks()
						dseffect()
						sleep(35)
						icon_state = ""
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays -= 'icons/ssjpowerup.dmi'
						hairremoval()
						ssjhairrestore()
						underlays += /obj/SSAuraBottom
						overlays += /obj/SSAuraTop
						ssjaura = 1
						state = "Super Saiyan"
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						ko = 0
						transforming = 0
					else if(state == "Super Saiyan")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Ultra Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays += 'icons/elec.dmi'
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						state = "Ultra Super Saiyan"
						ko = 0
						transforming = 0
					else if(state == "Ultra Super Saiyan")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Super Saiyan 2!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_trans2.wav'
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						state = "Super Saiyan 2"
						ko = 0
						transforming = 0
					else
						state = "Normal"
						overlays.Cut()
						CreateName()
						hairrestore()
						overlays += 'icons/gokugi.dmi'
						lspecial = 0
						powerlevel.max_value = 2500000
						powerlevel.value = 2500000
						ki.value = 250000
						ki.max_value =  250000
						lspecial = 0
						icon = 'icons/male.dmi'
						if(killer.race == "Android (Mechanical)")
							var/obj/items/ablueprints/bp = new()
							bp.expkk = killer.key
							bp.expkn = killer.name
							bp.Move(killer)
						killer.fame += 20
						..(killer, 2000)

			gohan
				name = "(Cell Saga) Gohan"
				icon = 'icons/SAGohan.dmi'
				race = "Half Saiyan"
				state = "Normal"
				powerlevel = new(90000000)
				ki = new(90000000)
				plgivemin = 3300000
				plgivemax = 9900000
				kigivemin = 3300000
				kigivemax = 9900000
				skexpgivemin = 11000
				skexpgivemax = 11000
				goldmin = 550000
				goldmax = 2750000
				canfly = 1
				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into a Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_transform.wav'
						overlays += 'icons/ssjpowerup.dmi'
						icon_state = "transform"
						dspecial = 1
						flyingrocks()
						dseffect()
						sleep(14)
						icon_state = ""
						icon = 'icons/SAGohanSS.dmi'
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays -= 'icons/ssjpowerup.dmi'
						underlays += /obj/SSAuraBottom
						overlays += /obj/SSAuraTop
						ssjaura = 1
						state = "Super Saiyan"
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						ko = 0
						transforming = 0
					else if(state == "Super Saiyan")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Super Saiyan 2!</FONT><font color = green> *</FONT>"
						overlays += 'icons/elec.dmi'
						icon_state = "transform"
						sleep(4)
						icon_state = ""
						icon = 'icons/SAGohanSS2.dmi'
						lspecial = 1
						view(25, src) << 'sounds/ssj_trans2.wav'
						powerlevel.max_value *= 3
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 3
						ki.value = ki.max_value
						state = "Super Saiyan 2"
						ko = 0
						transforming = 0
					else
						state = "Normal"
						overlays.Cut()
						underlays.Cut()
						CreateName()
						lspecial = 0
						powerlevel.max_value = 90000000
						powerlevel.value = 90000000
						ki.value = 90000000
						ki.max_value =  90000000
						lspecial = 0
						icon = 'icons/SAGohan.dmi'
						killer.fame += 20
						..(killer, 2000)
			android16
				name = "(Cell Saga) Android 16"
				icon = 'icons/android16.dmi'
				state = "Normal"
				race = "Android"
				powerlevel = new(20000000)
				ki = new(20000000)
				plgivemin = 600000
				plgivemax = 1800000
				kigivemin = 600000
				kigivemax = 1800000
				skexpgivemin = 2000
				skexpgivemax = 2000
				goldmin = 100000
				goldmax = 500000
				canfly = 1
			trunks
				name = "(Cell Saga) Trunks"
				icon = 'icons/TrunksSS.dmi'
				state = "Super Saiyan"
				race = "Half Saiyan"
				powerlevel = new(12000000)
				ki = new(12000000)
				plgivemin = 360000
				plgivemax = 1080000
				kigivemin = 360000
				kigivemax = 1080000
				skexpgivemin = 1200
				skexpgivemax = 1200
				goldmin = 60000
				goldmax = 300000
				canfly = 1
			piccolo
				name = "(Cell Saga) Piccolo"
				icon = 'icons/log3 piccolo.dmi'
				state = "Normal"
				race = "Namekian"
				powerlevel = new(14000000)
				ki = new(14000000)
				plgivemin = 420000
				plgivemax = 1260000
				kigivemin = 420000
				kigivemax = 1260000
				skexpgivemin = 1400
				skexpgivemax = 1400
				goldmin = 70000
				goldmax = 350000
				canfly = 1
			vegeta
				name = "(Cell Saga) Vegeta"
				icon = 'icons/vegeta3.dmi'
				state = "Super Saiyan"
				race = "Saiyan"
				powerlevel = new(15000000)
				ki = new(15000000)
				plgivemin = 450000
				plgivemax = 1350000
				kigivemin = 450000
				kigivemax = 1350000
				skexpgivemin = 1500
				skexpgivemax = 1500
				goldmin = 75000
				goldmax = 375000
				canfly = 1
			krillin
				name = "(Cell Saga) Krillin"
				icon = 'icons/Krillin.dmi'
				race = "Earthling"
				powerlevel = new(7000000)
				ki = new(7000000)
				plgivemin = 210000
				plgivemax = 630000
				kigivemin = 210000
				kigivemax = 630000
				skexpgivemin = 700
				skexpgivemax = 700
				goldmin = 35000
				goldmax = 175000
			tenshinhan
				name = "(Cell Saga) Tenshinhan"
				icon = 'icons/tenshinhan.dmi'
				powerlevel = new(9000000)
				ki = new(9000000)
				plgivemin = 270000
				plgivemax = 810000
				kigivemin = 270000
				kigivemax = 810000
				skexpgivemin = 900
				skexpgivemax = 900
				goldmin = 45000
				goldmax = 225000
			yamcha
				name = "(Cell Saga) Yamcha"
				icon = 'icons/log3 yamcha.dmi'
				powerlevel = new(6000000)
				ki = new(6000000)
				plgivemin = 180000
				plgivemax = 540000
				kigivemin = 180000
				kigivemax = 540000
				skexpgivemin = 600
				skexpgivemax = 600
				goldmin = 30000
				goldmax = 150000


		buusaga
			goku
				name = "(Buu Saga) Goku"
				icon = 'icons/male.dmi'
				hair = "Goku"
				state = "Normal"
				powerlevel = new(250000000)
				ki = new(2500000)
				plgivemin = 60000000
				plgivemax = 180000000
				kigivemin = 60000000
				kigivemax = 180000000
				goldmin = 10000000
				goldmax = 50000000
				skexpgivemin = 200000
				skexpgivemax = 200000
				canfly = 1
				New()
					. = ..()
					hairrestore()
					overlays += 'icons/gokugi.dmi'

				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into a Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_transform.wav'
						overlays += 'icons/ssjpowerup.dmi'
						icon_state = "ssj"
						dspecial = 1
						flyingrocks()
						dseffect()
						sleep(35)
						icon_state = ""
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays -= 'icons/ssjpowerup.dmi'
						hairremoval()
						ssjhairrestore()
						underlays += /obj/SSAuraBottom
						overlays += /obj/SSAuraTop
						ssjaura = 1
						state = "Super Saiyan"
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						ko = 0
						transforming = 0
					else if(state == "Super Saiyan")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Ultra Super Saiyan!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_trans2.wav'
						overlays += 'icons/elec.dmi'
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						state = "Ultra Super Saiyan"
						ko = 0
						transforming = 0
					else if(state == "Ultra Super Saiyan")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Super Saiyan 2!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_trans2.wav'
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						state = "Super Saiyan 2"
						ko = 0
						transforming = 0
					else if(state == "Super Saiyan 2")
						transforming = 1
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] ascends to Super Saiyan 3!</FONT><font color = green> *</FONT>"
						view(25, src) << 'sounds/ssj_firsttrans(Old).wav'
						icon_state = "ssj"
						lspecial = 1
						spawn() lightningrand2()
						sleep(22)
						call(/RoundExplosion/proc/NDBlast)(loc,1,2)
						sleep(10)
						call(/RoundExplosion/proc/NDBlast)(loc,1,3)
						sleep(10)
						call(/RoundExplosion/proc/NDBlast)(loc,1,4)
						sleep(40)
						view(25, src) << 'sounds/ssj_firsttrans2(Old).wav'
						sleep(16)
						bwipeeffect(z)
						flick("gonessj",src)
						overlays.Cut()
						CreateName()
						underlays += /obj/SSAuraBottom
						overlays += /obj/SSAuraTop
						overlays += 'icons/gokugi.dmi'
						overlays += 'icons/ssj3.dmi'
						overlays += 'icons/elec.dmi'
						powerlevel.max_value *= 2
						powerlevel.value = powerlevel.max_value
						ki.max_value *= 2
						ki.value = ki.max_value
						icon_state = ""
						state = "Super Saiyan 3"
						ko = 0
						transforming = 0
					else
						state = "Normal"
						overlays.Cut()
						CreateName()
						hairrestore()
						overlays += 'icons/gokugi.dmi'
						lspecial = 0
						powerlevel.max_value = 250000000
						powerlevel.value = 250000000
						ki.value = 250000000
						ki.max_value =  250000000
						lspecial = 0
						icon = 'icons/male.dmi'
						if(killer.race == "Android (Mechanical)" && killer.abl == 1)
							killer.abl = 2
						killer.fame += 50
						..(killer, 2000)
			buupiccolo
				name = "(Buu Saga) Piccolo"
				icon = 'icons/log3 piccolo.dmi'
				powerlevel = new(260000000)
				ki = new(260000000)
				plgivemin = 7800000
				plgivemax = 23400000
				kigivemin = 7800000
				kigivemax = 23400000
				skexpgivemin = 26000
				skexpgivemax = 26000
				goldmin = 1300000
				goldmax = 6500000
				canfly = 0
			buukrillin
				name = "(Buu Saga) Krillin"
				icon = 'icons/log3 krillin.dmi'
				powerlevel = new(80000000)
				ki = new(50000)
				plgivemin = 135000
				plgivemax = 405000
				kigivemin = 135000
				kigivemax = 405000
				skexpgivemin = 450
				skexpgivemax = 450
				goldmin = 22500
				goldmax = 112500
				canfly = 0
			buuyamcha
				name = "(Buu Saga) Yamcha"
				icon = 'icons/log3 yamcha.dmi'
				powerlevel = new(70000000)
				ki = new(70000000)
				plgivemin = 15000
				plgivemax = 45000
				kigivemin = 15000
				kigivemax = 45000
				skexpgivemin = 50
				skexpgivemax = 50
				goldmin = 2500
				goldmax = 12500
				canfly = 0
			buuvegeta
				name = "(Buu Saga) Vegeta"
				icon = 'icons/vegeta3.dmi'
				powerlevel = new(750000000)
				ki = new(750000000)
				plgivemin = 195000
				plgivemax = 585000
				kigivemin = 195000
				kigivemax = 585000
				skexpgivemin = 650
				skexpgivemax = 650
				goldmin = 32500
				goldmax = 162500
				canfly = 0
			buugohan
				name = "(Buu Saga) Gohan"
				icon = 'icons/Gohan.dmi'
				powerlevel = new(1500000000)
				ki = new(1500000000)
				plgivemin = 45000000
				plgivemax = 135000000
				kigivemin = 45000000
				kigivemax = 135000000
				skexpgivemin = 150000
				skexpgivemax = 150000
				goldmin = 7500000
				goldmax = 37500000
				canfly = 0
			EliteHenchmen
				name = "Traitor Elite Henchmen"
				icon = 'icons/henchmen2.dmi'
				powerlevel = new(500000)
				ki = new(500000)
				plgivemin = 15000
				plgivemax = 45000
				kigivemin = 15000
				kigivemax = 45000
				skexpgivemin = 50
				skexpgivemax = 50
				goldmin = 2500
				goldmax = 12500
				canfly = 0
			Henchmen
				name = "Traitor Henchmen"
				icon = 'icons/henchmen.dmi'
				powerlevel = new(15000)
				ki = new(15000)
				plgivemin = 450
				plgivemax = 1350
				kigivemin = 450
				kigivemax = 1350
				skexpgivemin = 2
				skexpgivemax = 2
				goldmin = 75
				goldmax = 375
				canfly = 0


	train
		var/mob/creator
		Dead(mob/killer, delay = 1000)
			if(!istype(killer, /monster) && killer == creator)
				killer.powerlevel.max_value += rand(plgivemin, plgivemax)
				killer.ki.max_value += rand(kigivemin, kigivemax)
				killer.skexp += rand(skexpgivemin, skexpgivemax)
				killer.Levelup()
			del(src)
		action()
			if(!target)
				if(!creator)
					del(src)
				else
					target = creator
			else if(target.dead != dead || !target.loc)
				del(src)
			else if(get_dist(src, target) <= 1)
				attack(target)
			else
				var/turf/T = get_step_rando(target)
				loc = T

	quest
		Dead(mob/killer, delay = 1000)
			if(!istype(killer, /monster))
				killer.powerlevel.max_value += rand(plgivemin, plgivemax)
				killer.ki.max_value += rand(kigivemin, kigivemax)
			var/obj/zennibag/ZB = new(loc)
			ZB.zenni = rand(goldmin, goldmax)
			respawn(src, delay)
		action()
			if(target && !(target in oview(src)))
				target = null
			else if(!target)
				step_rand(src)
				for(var/mob/M in oview(src))
					if(istype(M, /mob/characters))
						target = M
						if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
							return
						else
							target = null
			else if(get_dist(src, target) <= 1)
				attack(target)
			else if(base_StepTowards(target, 1, 6) < 0)
				if(canfly)
					viewers(src) << "[src] flies up into the air!"
					viewers(src) << 'sounds/buku.wav'
					icon_state = "buku"
					loc=locate(x,y+3,z)
					var/obj/bukuspot/A = new(null)
					overlays += A
					density = 0
					flight = 1
					meditate = 0
					rest = 0
					spawn(600)
						viewers(src) << "[src] lands on the ground!"
						viewers(src) << 'sounds/buku_land.wav'
						move = 0
						loc=locate(x,y-3,z)
						var/obj/bukuspot/B = new(null)
						overlays -= B
						move = 1
						density = 1
						flight = 0
						meditate = 0
						rest = 0
						icon_state = ""
				else
					target = null
					for(var/mob/M in oview(src))
						if(istype(M, /mob/characters))
							target = M
							if(get_dist(src, target) <= 1 || base_StepTowards(target, 1, 6) >= 0)
								return
							else
								target = null
		itinvis = 1
		scaninvis = 1
		ap = 0
		reincarnate
			plgivemin = 1000
			plgivemax = 2000
			kigivemin = 1000
			kigivemax = 2000
			goldmin = 10
			goldmax = 50
			skexpgivemin = 5
			skexpgivemax = 7
			Buu
				name = "(Quest) Fat Buu"
				icon = 'icons/Fat Buu.dmi'
				state = "Normal"
				race = "Buu"
				powerlevel = new(1000000000)
				ki = new(100000000)
				plgivemin = 60000000
				plgivemax = 180000000
				kigivemin = 60000000
				kigivemax = 180000000
				goldmin = 10000000
				goldmax = 50000000
				skexpgivemin = 200000
				skexpgivemax = 200000
				canfly = 1
				Dead(mob/killer)
					if(state == "Normal")
						transforming = 1
						view(src) << 'sounds/buu_trans.wav'
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] transforms into Super Buu!</FONT><font color = green> *</FONT>"
						flick("fattosuper", src)
						powerlevel.max_value = 2000000000
						powerlevel.value = 2000000000
						ki.value = 200000000
						ki.max_value =  200000000
						icon = 'icons/Super Buu.dmi'
						state = "Super Buu"
						name = "(Quest) Super Buu"
						overlays.Cut()
						CreateName()
						icon_state = ""
						ko = 0
						transforming = 0
					else if(state == "Super Buu")
						transforming = 1
						view(src) << 'sounds/buu_trans2.wav'
						sleep(22)
						view(src) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to revert from Super Buu and is now Kid Buu!</FONT><font color = green> *</FONT>"
						view(src) << 'sounds/revert.wav'
						flick("revert",src)
						powerlevel.value = 4000000000
						powerlevel.max_value = 4000000000
						ki.value = 400000000
						ki.max_value =  400000000
						icon='icons/buu.dmi'
						state = "Kid Buu"
						name = "(Quest) Kid Buu"
						overlays.Cut()
						CreateName()
						ko = 0
						transforming = 0
					else
						killer.hbq++
						state = "Normal"
						powerlevel.max_value = 1000000000
						powerlevel.value = 1000000000
						ki.value = 100000000
						ki.max_value =  100000000
						lspecial = 0
						name = "(Quest) Fat Buu"
						icon = 'icons/Fat Buu.dmi'
						overlays.Cut()
						CreateName()
						..(killer, 1000)
			Babidi
				name = "(Quest) Babidi"
				icon = 'icons/wizard.dmi'
				race = "Wizard"
				powerlevel = new(9000000)
				ki = new(900000)
				plgivemin = 270000
				plgivemax = 810000
				kigivemin = 270000
				kigivemax = 810000
				goldmin = 45000
				goldmax = 225000
				skexpgivemin = 900
				skexpgivemax = 900
				canfly = 1
				Dead(mob/killer)
					killer.hbq++
					..(killer, 1000)
			MVegeta
				name = "(Quest) )V(ajin Vegeta"
				race = "Saiyan"
				icon = 'icons/MVegeta.dmi'
				powerlevel = new(900000000)
				ki = new(50000000)
				plgivemin = 27000000
				plgivemax = 81000000
				kigivemin = 27000000
				kigivemax = 81000000
				goldmin = 4500000
				goldmax = 22500000
				skexpgivemin = 90000
				skexpgivemax = 90000
				canfly = 1
				Dead(mob/killer)
					killer.hbq++
					..(killer, 1000)
			Dabura
				name = "(Quest) Dabura"
				race = "Demon"
				icon = 'icons/Dabura.dmi'
				powerlevel = new(400000000)
				ki = new(400000000)
				plgivemin = 12000000
				plgivemax = 36000000
				kigivemin = 12000000
				kigivemax = 36000000
				goldmin = 2000000
				goldmax = 10000000
				skexpgivemin = 40000
				skexpgivemax = 40000
				canfly = 1
				Dead(mob/killer)
					killer.hbq++
					..(killer, 1000)
			Yakon
				name = "(Quest) Yakon"
				icon = 'icons/Yakon.dmi'
				race = "Alien"
				powerlevel = new(250000000)
				ki = new(25000000)
				plgivemin = 7500000
				plgivemax = 22500000
				kigivemin = 7500000
				kigivemax = 22500000
				goldmin = 1250000
				goldmax = 6250000
				skexpgivemin = 25000
				skexpgivemax = 25000
				canfly = 1
				Dead(mob/killer)
					killer.hbq++
					..(killer, 1000)
			PuiPui
				name = "(Quest) Pui Pui"
				icon = 'icons/Puipui.dmi'
				race = "Alien"
				powerlevel = new(75000000)
				ki = new(75000000)
				plgivemin = 2250000
				plgivemax = 6750000
				kigivemin = 2250000
				kigivemax = 6750000
				goldmin = 375000
				goldmax = 1875000
				skexpgivemin = 7500
				skexpgivemax = 7500
				canfly = 1
				Dead(mob/killer)
					killer.hbq++
					..(killer, 1000)

		reincarnate
			itinvis = 1
			scaninvis = 1
			ap = 100
			EGoku
				name = "(Quest) SSJ3 Goku"
				icon = 'icons/EGoku.dmi'
				powerlevel = new(500000000000)
				ki = new(500000000000)
				plgivemin = 15000000000
				plgivemax = 45000000000
				kigivemin = 15000000000
				kigivemax = 45000000000
				goldmin = 2500000000
				goldmax = 12500000000
				skexpgivemin = 50000000
				skexpgivemax = 50000000
				canfly = 0
				Dead(mob/killer)
					killer.fame += 100
					..(killer, 2000)







