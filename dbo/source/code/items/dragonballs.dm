var/DBsactive = 1
var/w_edbuse = 0
mob/proc
	immtime()
		spawn()
			set background = 1
			if(src.immortal)
				sleep(9000)
				src << "<FONT COLOR = RED><B>Your immortal power fades away."
				src.immortal = 0
proc
	inactivate_DBs()
		spawn()
			set background = 1
			for(var/obj/dragonball/D in world)
				D.icon = 'icons/dragonballs_inactive.dmi'
	activate_DBs()
		spawn()
			set background = 1
			DBsactive = 1
			world << "<B><FONT COLOR = GREEN>The Dragonballs have become active!"
			for(var/obj/dragonball/D in world)
				D.icon = 'icons/dragonball.dmi'
	edbact()
		spawn()
			set background = 1
			while(edbtime > 0)
			{
				sleep(600)
				edbtime--
				if(edbtime <= 0)
					edbtime = null
					//edbmonth = null
					activate_DBs()
					break
					return
			}
obj
	summon
		verb
			SummonDragon()
				set category = "Dragon Balls"
				set name = "Summon Dragon"
				if(usr.summondrag )
					usr << "<B>You have already summoned Shenron!"
				if(usr.w_edbuse >= 7)
					usr << "You can't not use these!"
					usr.Dbremove()
					return
				else
					var/dbs
					for(var/obj/dragonball/DB in usr.contents)
						if(istype(DB))
							dbs++
					if(DBsactive  && dbs == 7)
						usr.dballsummon()
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB)) del(DB)
						var/wishes = 2

						var/w_power = 0
						var/w_ki = 0
						var/w_ssj = 0

						usr.summondrag = 1
						DBsactive = 0
						usr.w_edbuse += 1
						world << "<B><FONT COLOR = GREEN>[usr] has summoned Shenron!"
						usr << "<B><FONT COLOR = GREEN>Shenron:</B> You have collected the seven Dragonballs, any wish within my power shall be granted!"
						viewers(usr.loc,150) << sound('sounds/makewish.wav',0,0,7)
						viewers(usr.loc,150) << 'music/title_off.mid'
						spawn(69)
						viewers(usr.loc,150) << sound('music/dragontheme.wav',1,0,8)
						while(wishes)
							var/wish = input("What is your wish?","Earth Dragonballs") as text
							viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">[usr]</span> : <span class=\"say\">I wish for [wish]!</span>"
							if(findtext(wish,"power"))
								if(w_power == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									w_power = 1
									usr.powerlevel.max_value += rand(10000,500000)
							else if(findtext(wish,"ki") || findtext(wish,"energy"))
								if(w_ki == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									w_ki = 1
									usr.ki.max_value += rand(10000,700000)
							else if(findtext(wish,"ssj") || findtext(wish,"trans") || findtext(wish,"anger"))
								if(w_ssj == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									w_ssj = 1
									usr.anger = 10
							else if(findtext(wish,"revive") || findtext(wish,"ressurect"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								for(var/mob/M in world)
									if(M.dead)
										spawn()
											var/alert/ask = new(600)
											switch(ask.Alrt(M,"Do you want to be revived?","Revive","No","Yes"))
												if("Yes")
													M.dead = 0
													M.overlays -= /obj/halo
													M.overlays -= 'icons/halo.dmi'
													M.powerlevel.value = M.powerlevel.max_value
													M.ki.value = M.ki.max_value
													M.loc=locate(M.hx,M.hy,M.hz)
													M << "You have been revived"
							else if(findtext(wish,"good"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = 10
							else if(findtext(wish,"neutral"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = 0
							else if(findtext(wish,"evil"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = -10
							else if(findtext(wish,"stance") || findtext(wish,"fighting"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.contents += new /styles/shenron
							else
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Shenron</span> : <span class=\"say\"><b>It cannot be done!</b></span>"
						usr.DbScatter()
					else
						alert("You do not have all seven Dragonballs collected!")
obj
	items
		dragonradar
			name = "Dragon Radar"
			icon = 'icons/turfs.dmi'
			icon_state = "dragonradar"
			radar = 1
			verb
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Drop()
					set category = null
					src.loc = locate(usr.x,usr.y,usr.z)
				Locate_Dragonballs()
					set category = null
					set name = "Locate Dragonballs"
					for(var/obj/dragonball/O in world)
						if(O.z == usr.z)
							if(usr.x > O.x)
								if(usr.y < O.y)
									usr << "<b><font color = red>[O] : <font color = blue>northwestern<font color = red> direction!</font>([O.x],[O.y])"
								if(usr.y > O.y)
									usr << "<b><font color = red>[O] : <font color = blue>southwestern<font color = red> direction!</font>([O.x],[O.y])"
							if(usr.x < O.x)
								if (usr.y < O.y)
									usr << "<b><font color = red>[O] : <font color = blue>northeastern<font color = red> direction!</font>([O.x],[O.y])"
								if (usr.y > O.y)
									usr << "<b><font color = red>[O] : <font color = blue>southeastern<font color = red> direction!</font>([O.x],[O.y])"
							if(usr.x == O.x)
								if(usr.y > O.y)
									usr << "<b><font color = red>[O] is directly across from you!"
								if(usr.y < O.y)
									usr << "<b><font color = red>[O] is directly across from you!"
							if(usr.y == O.y)
								if(usr.x > O.x)
									usr << "<b><font color = red>[O] is directly across from you!"
								if(usr.x < O.x)
									usr << "<b><font color = red>[O] is directly across from you!"
						else
							usr << "[O] can't be detected."

obj
	dragonball
		dragonball1
			name = "Dragonball (1)"
			icon = 'icons/dragonball.dmi'
			icon_state = "1"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")

				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball2
			name = "Dragonball (2)"
			icon = 'icons/dragonball.dmi'
			icon_state = "2"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball3
			name = "Dragonball (3)"
			icon = 'icons/dragonball.dmi'
			icon_state = "3"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")



				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball4
			name = "Dragonball (4)"
			icon = 'icons/dragonball.dmi'
			icon_state = "4"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball5
			name = "Dragonball (5)"
			icon = 'icons/dragonball.dmi'
			icon_state = "5"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball6
			name = "Dragonball (6)"
			icon = 'icons/dragonball.dmi'
			icon_state = "6"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)


		dragonball7
			name = "Dragonball (7)"
			icon = 'icons/dragonball.dmi'
			icon_state = "7"
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.rz1 = rand(1,7)
				if(src.rz1 )
					src.rz = 1
				if(src.rz1 == 2)
					src.rz = 6
				if(src.rz1 == 3)
					src.rz = 7
				if(src.rz1 == 4)
					src.rz = 9
				if(src.rz1 == 5)
					src.rz = 11
				if(src.rz1 == 6)
					src.rz = 12
				if(rz1 == 7)
					src.rz = 13
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(DBsactive )
						Move(usr)
						var/dbs
						for(var/obj/dragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/summon
					else
						alert("You can't pick up the Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/summon/S in usr.contents)
							if(S)
								del(S)

obj
	fakedbs
		db1
			name = "Dragonball (1)"
			icon = 'icons/dragonball.dmi'
			icon_state = "1"
		db2
			name = "Dragonball (2)"
			icon = 'icons/dragonball.dmi'
			icon_state = "2"
		db3
			name = "Dragonball (3)"
			icon = 'icons/dragonball.dmi'
			icon_state = "3"
		db4
			name = "Dragonball (4)"
			icon = 'icons/dragonball.dmi'
			icon_state = "4"
		db5
			name = "Dragonball (5)"
			icon = 'icons/dragonball.dmi'
			icon_state = "5"
		db6
			name = "Dragonball (6)"
			icon = 'icons/dragonball.dmi'
			icon_state = "6"
		db7
			name = "Dragonball (7)"
			icon = 'icons/dragonball.dmi'
			icon_state = "7"

mob
	proc
		dballsummon()
			set background = 1
			spawn(1)
				var/dbone = new/obj/fakedbs/db1
				var/dbtwo = new/obj/fakedbs/db2
				var/dbthree = new/obj/fakedbs/db3
				var/dbfour = new/obj/fakedbs/db4
				var/dbfive = new/obj/fakedbs/db5
				var/dbsix = new/obj/fakedbs/db6
				var/dbseven = new/obj/fakedbs/db7
				dbone:loc = locate(src.x-1,src.y+1,src.z)
				dbtwo:loc = locate(src.x+1,src.y+1,src.z)
				dbthree:loc = locate(src.x-2,src.y+2,src.z)
				dbfour:loc = locate(src.x+2,src.y+2,src.z)
				dbfive:loc = locate(src.x-1,src.y+3,src.z)
				dbsix:loc = locate(src.x+1,src.y+3,src.z)
				dbseven:loc = locate(src.x,src.y+2,src.z)

mob
	proc
		DbScatter()
			set background = 1
			spawn(1)
				src.summondrag = 0
				for(var/obj/summon/B in src.contents)
					if(B)
						del(B)
				for(var/obj/dragonball/O in src.contents)
					if(O)
						del(O)
				for(var/obj/dragonball/F in world)
					if(F)
						del(F)
				for(var/obj/fakedbs/E in world)
					if(E)
						del(E)
				var/dbs[] = newlist(/obj/dragonball/dragonball1, \
					/obj/dragonball/dragonball2, \
					/obj/dragonball/dragonball3, \
					/obj/dragonball/dragonball4, \
					/obj/dragonball/dragonball5, \
					/obj/dragonball/dragonball6, \
					/obj/dragonball/dragonball7)
				world << 'sounds/dbs_flying.wav'
				DBsactive = 0
				inactivate_DBs()
				edbtime = 240
				edbact()
				for(var/obj/dragonball/O in dbs)
					O.rx = rand(2,149)
					O.ry = rand(2,149)
					O.rz1 = rand(1,7)
					if(O.rz1 )
						O.rz = 1
					if(O.rz1 == 2)
						O.rz = 6
					if(O.rz1 == 3)
						O.rz = 7
					if(O.rz1 == 4)
						O.rz = 9
					if(O.rz1 == 5)
						O.rz = 11
					if(O.rz1 == 6)
						O.rz = 12
					if(O == 7)
						O.rz = 13
					O.loc = locate(O.rx,O.ry,O.rz)
					world << "<FONT COLOR = GREEN><FONT SIZE = 2>A Dragonball shoots into the sky!"
				spawn(25)
					viewers(src.loc,150) << sound('sounds/blank.wav',0,0,8)
mob
	proc
		Dbremove()
			set background = 1
			spawn(1)
				src.summondrag = 0
				for(var/obj/summon/B in src.contents)
					if(B)
						del(B)
				for(var/obj/dragonball/O in src.contents)
					if(O)
						del(O)
				for(var/obj/dragonball/F in world)
					if(F)
						del(F)
				for(var/obj/fakedbs/E in world)
					if(E)
						del(E)
				var/dbs[] = newlist(/obj/dragonball/dragonball1, \
					/obj/dragonball/dragonball2, \
					/obj/dragonball/dragonball3, \
					/obj/dragonball/dragonball4, \
					/obj/dragonball/dragonball5, \
					/obj/dragonball/dragonball6, \
					/obj/dragonball/dragonball7)
				world << 'sounds/dbs_flying.wav'
				DBsactive = 1
				for(var/obj/dragonball/O in dbs)
					O.rx = rand(2,149)
					O.ry = rand(2,149)
					O.rz1 = rand(1,7)
					if(O.rz1 )
						O.rz = 1
					if(O.rz1 == 2)
						O.rz = 6
					if(O.rz1 == 3)
						O.rz = 7
					if(O.rz1 == 4)
						O.rz = 9
					if(O.rz1 == 5)
						O.rz = 11
					if(O.rz1 == 6)
						O.rz = 12
					if(O == 7)
						O.rz = 13
					O.loc = locate(O.rx,O.ry,O.rz)
					world << "<FONT COLOR = GREEN><FONT SIZE = 2>An Active Dragonball shoots into the sky!"
				spawn(25)
					viewers(src.loc,150) << sound('sounds/blank.wav',0,0,8)
