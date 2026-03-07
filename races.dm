mob
	characters
		saiyajin
			icon = 'male.dmi'
			powerlevel = 120
		halfbreed
			icon = 'male.dmi'
			powerlevel = 800
		namekjin
			icon = 'namek.dmi'
		android
			powerlevel = 1000
		changling
			icon = 'changling.dmi'
		humanjin
			icon = 'male.dmi'
			powerlevel = 5
		bioandroidone
			icon = 'male.dmi'
		bioandroidtwo
			icon = 'bioandroid-two.dmi'
		bioandroidthree
			icon = 'bioandroid-one.dmi'
		bioandroidcell
			icon='biocell1.dmi'
			powerlevel=540

		halfieh
			icon = 'male.dmi'
			powerlevel = 5
		halfies
			icon = 'male.dmi'
			powerlevel = 5
		demon
			icon = 'maledemon.dmi'
			powerlevel=100
		tsufurujin
			icon = 'male.dmi'
			powerlevel=100
		TestDummy
			icon= 'male.dmi'
			powerlevel=1000000
			maxpowerlevel= 1000000
			New()
				start
				while(src.hp<=0)
					sleep(10)
				for(var/mob/characters/O in oview(10))
					O<<"Dummy with [src.powerlevel] Powerlevel, Damage Dealt = [src.hp]"
				src.hp=150
				goto start


mob/Move()
	if(src.frozen==1)
		return 0
	var/walkdelay=src.speed/1000
	if(src.flight==1)
		walkdelay-=1
	if(walkdelay<1)
		walkdelay=1
	if(src.speeding<=0)
		.=..()
		if(.)
			src.speeding = 1
			sleep(walkdelay)
			src.speeding = 0
//--------------------------------------------Client Controls--------------------------------------------
client
//-------------------------------------------------North-------------------------------------------------
	North()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			usr.timeout=1
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.powerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,NORTH)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,NORTH)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------South-------------------------------------------------
	South()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			usr.timeout=1
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.powerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,SOUTH)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,SOUTH)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------East-------------------------------------------------
	East()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			usr.timeout=1
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.powerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,EAST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,EAST)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------West-------------------------------------------------
	West()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.powerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,WEST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,WEST)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------Northwest-------------------------------------------------
	Northwest()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.maxpowerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,NORTHWEST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,NORTHWEST)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------Southwest-------------------------------------------------
	Southwest()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.maxpowerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,SOUTHWEST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,SOUTHWEST)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------Northeast-------------------------------------------------
	Northeast()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.maxpowerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,NORTHEAST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,NORTHEAST)
				sleep(2)
			usr.timeout=0
			return
//-------------------------------------------------Southeast-------------------------------------------------
	Southeast()
		if(usr:timeout==0&&usr.move==1&&usr.afk==0)
			if(usr.weight>0)
				if(usr.weight>usr.powerlevel/1000)
					if(usr.weight<=usr.powerlevel/900)
						sleep(5)
					if(usr.weight<=usr.powerlevel/800 && usr.weight>usr.powerlevel/900)
						sleep(6)
					if(usr.weight<=usr.powerlevel/700 && usr.weight>usr.powerlevel/800)
						sleep(7)
					if(usr.weight<=usr.maxpowerlevel/600 && usr.weight>usr.powerlevel/700)
						sleep(8)
					if(usr.weight<=usr.powerlevel/500 && usr.weight>usr.powerlevel/600)
						sleep(10)
					if(usr.weight>usr.powerlevel/500)
						sleep(1)
						usr<<"You cannot lift your own body."
						usr.timeout=0
						return
				var/oldx=usr.x
				var/oldy=usr.y
				var/oldz=usr.z
				var/hasmoved=0
				step(usr,SOUTHEAST)
				if(oldx!=usr.x)
					hasmoved=1
				if(oldy!=usr.y)
					hasmoved=1
				if(oldz!=usr.z)
					hasmoved=0
				if(hasmoved==1)
					if(usr.weight<usr.maxpowerlevel/1000)
						sleep(3)
						usr.maxpowerlevel+=rand(1,2)
					if(usr.weight<100)
						usr.maxpowerlevel+=rand(1,4)
					else if(usr.weight<500&&usr.weight>100)
						if(usr.maxpowerlevel<=300000)
							usr.maxpowerlevel+=rand(2,7)
					else if(usr.weight<1000&&usr.weight>500)
						if(usr.maxpowerlevel<=700000)
							usr.maxpowerlevel+=rand(3,10)
					else if(usr.weight<5000&&usr.weight>1000)
						if(usr.maxpowerlevel<=1500000)
							usr.maxpowerlevel+=rand(7,60)
					else if(usr.weight<10000&&usr.weight>5000)
						if(usr.maxpowerlevel<=7000000)
							usr.maxpowerlevel+=rand(10,80)
					else if(usr.weight<20000&&usr.weight>10000)
						if(usr.maxpowerlevel<=15000000)
							usr.maxpowerlevel+=rand(18,115)
					else if(usr.weight<50000&&usr.weight>20000)
						if(usr.maxpowerlevel<=30000000)
							usr.maxpowerlevel+=rand(30,300)
					else if(usr.weight<100000&&usr.weight>50000)
						if(usr.maxpowerlevel<=75000000)
							usr.maxpowerlevel+=rand(35,580)
					else if(usr.weight>100000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(50,2250)
					else if(usr.weight>180000)
						if(usr.maxpowerlevel>=20000000)
							usr.maxpowerlevel+=rand(30,2899)
			else
				step(usr,SOUTHEAST)
				sleep(2)
			usr.timeout=0
			return
//-----------------------------------------End Client Controls-----------------------------------------