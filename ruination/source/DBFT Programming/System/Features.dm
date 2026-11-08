//Planet Destruction System
var
	EDestroyKey=null
	EDestroyName=null
proc
	PlanetDestruction(var/mob/PC/Person,var/planet)
		spawn()
			planet = "Earth"
			//player << sound('destructiomus.wav',1)
			player << "<FONT COLOR = RED>Info:</FONT></B> Planet [planet] is going to blow up in <B>5</B> minutes!"
			//Earth = "Destroying"
			EDestroyKey = "[Person.key]"
			EDestroyName = "[Person.name]"
			for(var/area/A in world)
				if(A.z == 1)
					if(istype(A,/area/outside))
						A.density = 0
						A.layer = 99
						A.icon = 'Day & Night.dmi'
						A.icon_state = "night"
			DestructionLightning(planet)
			sleep(3000)
			player << "<FONT COLOR = RED>Info:</FONT></B> Planet Earth has been destroyed by [Person.name]!"
		//	Earth = "Destroyed"
			EDestroyKey = null
			EDestroyName = null
			for(var/mob/PC/M in player)
				if(M.client)
					M.powerlevel = 0
					M.DeathCheck(Person)
			for(var/area/A in world)
				if(A.z == 1)
					if(istype(A,/area/outside))
						A.density = 0
						A.layer = 99
						A.icon = null
						A.icon_state = ""

proc
	DestructionLightning(var/planet)
		set background = 1
		for(var/i=0;i<100;i++)
			spawn() PlanetLightning(planet)
proc
	PlanetLightning(var/Planet)
		set background = 1
		spawn()
			var/spot1 =	rand(1,200)
			var/spot2 = rand(1,200)
			var/bolt = new/obj/LightningBolt(locate(spot1,spot2,1))
			//var/lightsnd = rand(0,1)
			sleep(2)
			/*if(lightsnd == 0)
				oview(bolt) << 'lightning.wav'
			else
				oview(bolt) << 'lightning2.wav'*/
			sleep(12)
			del(bolt)
			spawn()
				if(EDestroyKey)
					PlanetLightning(Planet)
				else
					return

obj
	LightningBolt
		name = "Lightning Bolt"
		density = 0
		icon = 'lightning.dmi'
		icon_state ="5"
		layer = 99
		New()
			src.overlays += new/obj/LightningParts/l01
			src.overlays += new/obj/LightningParts/l02
			src.overlays += new/obj/LightningParts/l03
			src.overlays += new/obj/LightningParts/l04
mob
	proc
		BlueLightningEffect()
			spawn()
				var/spot1 = src.x + (rand(-6,6))
				var/spot2 = src.y + (rand(-6,6))
				var/bolt = new/obj/LightningBolt(locate(spot1,spot2,usr.z))
				//var/lightsnd = rand(0,1)
				sleep(2)
				/*if(lightsnd == 0)
					view(6) << 'lightning.wav'
				else
					view(6) << 'lightning2.wav'*/
				sleep(20)
				del(bolt)
			//	src.BlueLightningEffect()

//Flying Rock System
obj
	Rocks
		name = "Rocks"
		icon = 'flyingdirt.dmi'
		icon_state = ""
		density = 0
		layer = 9
obj
	Rocks2
		name = "Rocks"
		icon = 'flyingdirt.dmi'
		icon_state = "Type2"
		density = 0
		layer = 9

mob
	proc
		RocksTransform()
			spawn()
				set background = 1
				while(src.rocks>0)
					var/spot1 = usr.x + (rand(-4,4))
					var/spot2 = usr.y + (rand(-4,4))
					var/spot3 = usr.x + (rand(-4,4))
					var/spot4 = usr.y + (rand(-4,4))
					var/spot5 = usr.x + (rand(-4,4))
					var/spot6 = usr.y + (rand(-4,4))
					var/spot7 = usr.x + (rand(-4,4))
					var/spot8 = usr.y + (rand(-4,4))
					var/spot9 = usr.x + (rand(-4,4))
					var/spot10 = usr.y + (rand(-4,4))
					var/spot11 = usr.x + (rand(-4,4))
					var/spot12 = usr.y + (rand(-4,4))
					spot2 -= 3
					spot4 -= 3
					spot6 -= 3
					spot8 -= 3
					spot10 -= 3
					spot12 -= 3
					var/obj/Rocks/R1 = new(locate(spot1,spot2,usr.z))
					var/obj/Rocks2/R2 = new(locate(spot3,spot4,usr.z))
					var/obj/Rocks/R3 = new(locate(spot5,spot6,usr.z))
					var/obj/Rocks2/R4 = new(locate(spot7,spot8,usr.z))
					var/obj/Rocks/R5 = new(locate(spot9,spot10,usr.z))
					var/obj/Rocks2/R6 = new(locate(spot11,spot12,usr.z))
					walk(R1, NORTH)
					walk(R2, NORTH)
					walk(R3, NORTH)
					walk(R4, NORTH)
					walk(R5, NORTH)
					walk(R6, NORTH)
					sleep(15)
					sleep(8)
					flick("break1",R1)
					flick("break2",R2)
					flick("break1",R3)
					flick("break2",R4)
					flick("break1",R5)
					flick("break2",R6)
					sleep(12)
					del(R1)
					del(R2)
					del(R3)
					del(R4)
					del(R5)
					del(R6)
					src.rocks=max(0,src.rocks-1)
					if(!rocks)break
					sleep(1)

proc
	Quake_Effect(mob/M,duration,strength=1)
		if(!M.client)return
		spawn(1)
			var/x
			for(x=0;x<duration,x++)
				M.client.eye = get_steps(M,pick(NORTH,SOUTH,EAST,WEST),strength)
				sleep(1)
			M.client.eye=M

mob/proc
	lssj2lightning()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
		spawn() auralightningeff()
	auralightningeff()
		set background = 1
		while(src.lightning)
			var/spot1 =	rand(oview())
			var/spot2 = rand(oview())
			var/bolt = new/obj/LightningBolt(locate(spot1,spot2,1))
			sleep(3)
			del(bolt)
			sleep(rand(10,25))

mob
	proc
		windeffect()
			set background = 1
			spawn()
				while(src.windeffect)
					new /Explosion(new /Effect/MysticWind(src.loc,1,9))
					sleep(rand(10,15))
mob/var
	windeffect = 0
	rocks = 0
	lightning = 0
obj
	auralight

proc
	get_steps(atom/ref,dir,num)
		var/x
		var/turf/T=ref:loc
		if(isturf(ref))
			T=ref
		for(x=0;x<num;x++)
			ref=get_step(ref,dir)
			if(!ref)break
			T=ref
		return T