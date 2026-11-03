proc/get_general_dir(atom/ref,atom/target)
	if(target.z > ref.z) return UP
	if(target.z < ref.z) return DOWN
	var/d = get_dir(ref,target)
	if(d&d-1)        // diagonal
		var/ax = abs(ref.x - target.x)
		var/ay = abs(ref.y - target.y)
		if(ax >= (ay << 1))      return d & (EAST|WEST)   // keep east/west (4 and 8)
		else if(ay >= (ax << 1)) return d & (NORTH|SOUTH) // keep north/south (1 and 2)
	return d
proc/DirectionText(A)
	switch(A)
		if(1) return "North"
		if(2) return "South"
		if(4) return "East"
		if(5) return "Northeast"
		if(6) return "Southeast"
		if(8) return "West"
		if(9) return "Northwest"
		if(10) return "Southwest"
		else return "On another planet"
obj
	var
		radarlvl=1
		Earth=0
		Namek=0
		Black=0
obj/Equipment
	DragonRadar
		value=20000
		name="Dragon Radar {Level: 1}"
		icon = 'Dragon Radar.dmi'
		icon_state = "DBRadar1"
		Click()
			set category = null
			if(usr.z)
				if(usr.dbrad == 0)
					if(src.radarlvl==1)
						src.Earth=1
						src.Namek=0
						src.Black=0
					if(src.radarlvl==2)
						switch(alert("Are you searching for Earth or Namek Balls?","Dragon Radar","Earth","Namek"))
							if("Earth")
								src.Earth=1
								src.Namek=0
								src.Black=0
							if("Namek")
								src.Earth=0
								src.Namek=1
								src.Black=0
					if(src.radarlvl==3)
						switch(alert("Are you searching for Earth, Namek or Black DragonBalls?","Dragon Radar","Earth","Namek","Black"))
							if("Earth")
								src.Earth=1
								src.Namek=0
								src.Black=0
							if("Namek")
								src.Earth=0
								src.Namek=1
								src.Black=0
							if("Black")
								src.Earth=0
								src.Namek=0
								src.Black=1
					if(src.Earth)
						if(usr.CheckEarthBalls()!=TRUE)
							usr<<"The Earth Dragonballs haven't been spawned."
							return
						if(usr.z != 1)
							usr << "You aren't on Earth!"
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dradar2/hud/s0(usr.client)
						O.screen_loc = "23,23"
					//	O.screen_loc = "NORTH-1,WEST"
						//O.screen_loc = "CENTER,CENTER"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dradar2/hud/radar(usr.client)
						O1.screen_loc = "23,23"
					//	O.screen_loc = "NORTH-1,WEST"
					//	O.screen_loc = "CENTER-5,CENTER"
						O1.layer = 1500
						usr.client.screen += O1

						for(var/obj/Earth_Dragonballs/M in world)
							var/dbdir = get_general_dir(usr,M)
							dbdir = DirectionText(dbdir)
							var/D = M
							if(ismob(M.loc))
								M = M.loc
								if(usr == M)
									usr << "You have [D] in your inventory"
								else
									if(dbdir == "On another planet")
										//world << "M [M] Mz [M.z]"
										switch(M.z)
											if(1)
												dbdir = "on <b>Earth</b>"
											if(2)
												dbdir = "on <b>Namek</b>"
											if(3)
												dbdir = "on <b>Vegeta</b>"
											if(4)
												dbdir = "on <b>Yardrat</b>"
											else dbdir = "on <b>another planet</b>"
									usr << "<b>[M]</b> has <b>[D]</b> [dbdir] at <b>([M.x],[M.y],[M.z])"
							else
								usr<<"<b>[M]</b> is <b>[dbdir]</b> located at ([M.x],[M.y],[M.z])"

/*
			for(var/obj/Earth_Dragonballs/M in world)
							if(ismob(M.loc))
								M = M.loc
							var/dbdir = get_general_dir(usr,M)
							dbdir = DirectionText(dbdir)
							if(dbdir == "Own")
								for(var/obj/Earth_Dragonballs/P in player)
									usr << "P [P]  M [M]  Ploc [P.loc]  Mloc [M.loc]"
								usr<<"<b>[M] is holding a dragonball at ([M.x],[M.y],[M.z]) "
							else
								usr<<"<b>[M]</b> is <b>[dbdir]</b> of you located at ([M.x],[M.y],[M.z])"
								*/
						usr << "<br>"
						spawn(5)usr.client.UpdateRadarEarth()

					else if(src.Namek)
						if(usr.CheckNamekBalls()!=TRUE)
							usr<<"The Namek Dragonballs haven't been spawned."
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dradar2/hud/s0(usr.client)
						O.screen_loc = "23,23"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dradar2/hud/radar(usr.client)
						O1.screen_loc = "23,23"
						O1.layer = 1500
						usr.client.screen += O1

						for(var/obj/Namek_Dragonballs/M in world)
							var/dbdir = get_general_dir(usr,M)
							dbdir = DirectionText(dbdir)
							var/D = M
							if(ismob(M.loc))
								M = M.loc
								if(usr == M)
									usr << "You have [D] in your inventory"
								else
									if(dbdir == "On another planet")
										//world << "M [M] Mz [M.z]"
										switch(M.z)
											if(1)
												dbdir = "on <b>Earth</b>"
											if(2)
												dbdir = "on <b>Namek</b>"
											if(3)
												dbdir = "on <b>Vegeta</b>"
											if(4)
												dbdir = "on <b>Yardrat</b>"
											else dbdir = "on <b>another planet</b>"
									usr << "<b>[M]</b> has <b>[D]</b> [dbdir] at <b>([M.x],[M.y],[M.z])"
							else
								usr<<"<b>[M]</b> is <b>[dbdir]</b> located at ([M.x],[M.y],[M.z])"
						spawn(5)usr.client.UpdateRadarNamek()

					else if(src.Black)
						if(usr.CheckBlackBalls()!=TRUE)
							usr<<"The Black Star Dragonballs haven't been spawned."
							return
						usr.dbrad = 1
						var/obj/O = new/obj/dradar2/hud/s0(usr.client)
						O.screen_loc = "23,23"
						O.layer = 1501
						usr.client.screen += O
						usr.client.radar = O
						var/obj/O1 = new/obj/dradar2/hud/radar(usr.client)
						O1.screen_loc = "23,23"
						O1.layer = 1500
						usr.client.screen += O1
						for(var/obj/Black_Dragonballs/B in world)
							var/dbdir = get_general_dir(usr,B)
							dbdir = DirectionText(dbdir)
							var/D = B
							if(ismob(B.loc))
								B = B.loc
								if(usr == B)
									usr << "You have [D] in your inventory"
								else
									if(dbdir == "On another planet")
										//world << "M [M] Mz [M.z]"
										switch(B.z)
											if(1)
												dbdir = "on <b>Earth</b>"
											if(2)
												dbdir = "on <b>Namek</b>"
											if(3)
												dbdir = "on <b>Vegeta</b>"
											if(4)
												dbdir = "on <b>Yardrat</b>"
											else dbdir = "on <b>another planet</b>"
									usr << "<b>[B]</b> has <b>[D]</b> [dbdir] at <b>([B.x],[B.y],[B.z])"
							else
								usr<<"<b>[B]</b> is <b>[dbdir]</b> located at ([B.x],[B.y],[B.z])"
						spawn(5)usr.client.UpdateRadarBlack()
				else
					for(var/obj/dradar2/hud/H in usr.client.screen)
						del(H)
					usr.dbrad = 0
			else
				return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.icon_state = "DBRadar[src.radarlvl]"
					usr << "You have dropped the: <u>[src]</u>."
					for(var/obj/dradar2/hud/H in usr.client.screen)
						del(H)
					usr.dbrad = 0
					usr.inven_min -= 1
					src.loc = usr.loc
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."


client
	proc
		UpdateRadarEarth()
			set background=1
			if(!src.mob.dbrad)
				return
			else
				var/icon/R=icon('New Radar.dmi',"radar")
				R.DrawBox(rgb(255,255,255), 33, 33-3, 33, 33+3)
				R.DrawBox(rgb(255,255,255), 33-3, 33, 33+3, 33)
				for(var/obj/Earth_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 32-(src.mob.x/25 - O.x/25)+1
						var/dy = 32-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in player)
					if(M.z == src.mob.z)
						if(M.e_db_1||M.e_db_2||M.e_db_3||M.e_db_4||M.e_db_5||M.e_db_6||M.e_db_7)
							var/dx = 32-(src.mob.x/25 - M.x/25)+1
							var/dy = 32-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				var/obj/X=src.radar
				if(X)
					X.icon = R
				else
					return
				spawn(10)src.UpdateRadarEarth()
		UpdateRadarNamek()
			set background=1
			if(!src.mob.dbrad)
				return
			else
				var/icon/R=icon('New Radar.dmi',"radar")
				R.DrawBox(rgb(255,255,255), 33, 33-3, 33, 33+3)
				R.DrawBox(rgb(255,255,255), 33-3, 33, 33+3, 33)
				for(var/obj/Namek_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 32-(src.mob.x/25 - O.x/25)+1
						var/dy = 32-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in player)
					if(M.z == src.mob.z)
						if(M.e_db_1||M.e_db_2||M.e_db_3||M.e_db_4||M.e_db_5||M.e_db_6||M.e_db_7)
							var/dx = 32-(src.mob.x/25 - M.x/25)+1
							var/dy = 32-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				var/obj/X=src.radar
				if(X)
					X.icon = R
				else
					return
				spawn(10)src.UpdateRadarNamek()
		UpdateRadarBlack()
			set background=1
			if(!src.mob.dbrad)
				return
			else
				var/icon/R=icon('New Radar.dmi',"radar")
				R.DrawBox(rgb(255,255,255), 33, 33-3, 33, 33+3)
				R.DrawBox(rgb(255,255,255), 33-3, 33, 33+3, 33)
				for(var/obj/Black_Dragonballs/O in world)
					if(O.z == src.mob.z)
						var/dx = 32-(src.mob.x/25 - O.x/25)+1
						var/dy = 32-(src.mob.y/25 - O.y/25)+1
						R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
						sleep(1)
				for(var/mob/M in player)
					if(M.z == src.mob.z)
						if(M.e_db_1||M.e_db_2||M.e_db_3||M.e_db_4||M.e_db_5||M.e_db_6||M.e_db_7)
							var/dx = 32-(src.mob.x/25 - M.x/25)+1
							var/dy = 32-(src.mob.y/25 - M.y/25)+1
							R.DrawBox(rgb(255,220,60),dx-1,dy-1,dx+1,dy+1)
							sleep(1)
				var/obj/X=src.radar
				if(X)
					X.icon = R
				else
					return
				spawn(10)src.UpdateRadarBlack()
obj/dradar2/hud
	icon = 'New Radar.dmi'
	s0
		icon_state="radar"
	radar
		icon_state="full radar"
mob/var/tmp
	dbrad = 0
client
	var
		obj/dradar2/radar
mob
	proc
		CheckEarthBalls()
			for(var/obj/Earth_Dragonballs/O in world)
				if(O.dball)
					return TRUE
		CheckNamekBalls()
			for(var/obj/Namek_Dragonballs/O in world)
				if(O.dball)
					return TRUE
		CheckBlackBalls()
			for(var/obj/Black_Dragonballs/O in world)
				if(O.dball)
					return TRUE
world
	proc
		ShutDownRadar()
			for(var/mob/PC/M in player)
				for(var/obj/dradar2/hud/H in M.client.screen)
					del(H)
				M.dbrad = 0

/*
proc/get_general_dir(atom/Loc1, atom/Loc2)
	var/dir = get_dir(Loc1, Loc2)
	switch(dir)
		if(NORTH, EAST, SOUTH, WEST)
			return dir

		if(NORTHEAST, SOUTHWEST)
			var/abs_x = abs(Loc2.x - Loc1.x)
			var/abs_y = abs(Loc2.y - Loc1.y)

			if(abs_y > (2*abs_x))
				return turn(dir,45)
			else if(abs_x > (2*abs_y))
				return turn(dir,-45)
			else
				return dir

		if(NORTHWEST, SOUTHEAST)
			var/abs_x = abs(Loc2.x - Loc1.x)
			var/abs_y = abs(Loc2.y - Loc1.y)

			if(abs_y > (2*abs_x))
				return turn(dir,-45)
			else if(abs_x > (2*abs_y))
				return turn(dir,45)
			else
				return dir

				*/