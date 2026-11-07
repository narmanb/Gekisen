var/Ndbsactive = 1
var/nw_ndbuse = 0
proc
	inactivate_Ndbs()
		spawn()
			set background = 1
			for(var/obj/ndragonball/D in world)
				D.icon = 'icons/inactive_namek_dbs.dmi'
	activate_Ndbs()
		spawn()
			set background = 1
			Ndbsactive = 1
			world << "<B><FONT COLOR = GREEN>The Namek Dragonballs have become active!"
			for(var/obj/ndragonball/D in world)
				D.icon = 'icons/namek_dragonball.dmi'
	ndbact()
		spawn()
			set background = 1
			while(ndbtime > 0)
			{
				sleep(600)
				ndbtime--
				if(ndbtime <= 0)
					ndbtime = null
//					ndbmonth = null
					activate_Ndbs()
					break
					return
			}

obj
	nsummon
		verb
			SummonNamekDragon()
				set category = "Namekian Dragonballs"
				set name = "Summon Namekian Dragon"
				if(usr.summondrag )
					usr << "<B>You have already summoned Porunga!"
				if(usr.nw_ndbuse >= 7)
					usr << "You can't not use these!"
					usr.Ndbremove()
					return
				else
					if(usr.ndbqn != 1 || usr.ndbqd != 1)
						alert("You can not use the Namekian Dragonball snice you do not know the words to summon the dragon!")
						return
					var/dbs
					for(var/obj/ndragonball/DB in usr.contents)
						if(istype(DB))
							dbs++
					if(Ndbsactive  && dbs == 7)
						usr.ndballsummon()
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB)) del(DB)
						var/wishes = 3

						var/nw_power = 0
						var/nw_ki = 0
						var/nw_ssj = 0


						usr.summondrag = 1
						Ndbsactive = 0
						usr.nw_ndbuse += 1
						world << "<B><FONT COLOR = GREEN>[usr] has summoned Porunga!"
						usr << "<B><FONT COLOR = GREEN>Porunga:</B> You have collected the seven Dragonballs, any wish within my power shall be granted!"
						viewers(usr.loc,150) << sound('sounds/makewish.wav',0,0,7)
						viewers(usr.loc,150) << 'music/title_off.mid'
						spawn(69)
						viewers(usr.loc,150) << sound('music/dragontheme.wav',1,0,8)
						while(wishes)
							var/wish = input("What is your wish?","Earth Dragonballs") as text
							viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">[usr]</span> : <span class=\"say\">I wish for [wish]!</span>"
							if(findtext(wish,"power"))
								if(nw_power == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									nw_power = 1
									usr.powerlevel.max_value += rand(10000,55000)
							else if(findtext(wish,"ki") || findtext(wish,"energy"))
								if(nw_ki == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									nw_ki = 1
									usr.ki.max_value += rand(10000,75000)
							else if(findtext(wish,"ssj") || findtext(wish,"trans") || findtext(wish,"anger"))
								if(nw_ssj == 0)
									viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
									viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
									wishes--
									nw_ssj = 1
									usr.anger = 10
							else if(findtext(wish,"revive") || findtext(wish,"ressurect"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
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
													M.loc=locate(M.hx, M.hy, M.hz)
													M << "You have been revived"
							else if(findtext(wish,"good"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = 50
							else if(findtext(wish,"neutral"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = 0
							else if(findtext(wish,"evil"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.ap = -50
							else if(findtext(wish,"stance") || findtext(wish,"fighting"))
								viewers(usr.loc,150) << sound('sounds/grantwish.wav',0,0,7)
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It shall be done!</b></span>"
								wishes--
								usr.contents += new /styles/porunga
							else
								viewers() << "<span class=\"chattype\">{<span class=\"title\">Say</span>}</span><span class=\"name\">Porunga</span> : <span class=\"say\"><b>It cannot be done!</b></span>"
						usr.NdbScatter()
					else
						alert("You do not have all seven Namekian Dragonballs collected!")
obj
	items
		ndragonradar
			name = "Namekian Dragon Radar"
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
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
				Locate_NDragonballs()
					set category = null
					set name = "Locate Namek Dragonballs"
					for(var/obj/ndragonball/O in world)
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
								if(usr.x == O.x)
									usr << "<b><font color = red>[O] is directly across from you!"
								if(usr.x < O.x)
									usr << "<b><font color = red>[O] is directly across from you!"
						else
							usr << "[O] can't be detected. (Doesn't exist or is on another map.)"

obj
	ndragonball
		ndragonball1
			name = "Namek Dragonball (1)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "1"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				src.rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")

				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball2
			name = "Namek Dragonball (2)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "2"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball3
			name = "Namek Dragonball (3)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "3"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")



				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball4
			name = "Namek Dragonball (4)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "4"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball5
			name = "Namek Dragonball (5)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "5"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball6
			name = "Namek Dragonball (6)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "6"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)


		ndragonball7
			name = "Namek Dragonball (7)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "7"
			New()
				..()
				src.rx = rand(1,150)
				src.ry = rand(1,150)
				var/rz1 = rand(1,2)
				if(rz1 )
					src.rz = 5
				if(rz1 == 2)
					src.rz = 21
				src.loc = locate(src.rx,src.ry,src.rz)
			verb
				Get()
					set category = null
					set src in oview(1)
					if(Ndbsactive )
						Move(usr)
						var/dbs
						for(var/obj/ndragonball/DB in usr.contents)
							if(istype(DB))
								dbs++
						if(dbs == 7)
							usr.contents += new/obj/nsummon
					else
						alert("You can't pick up the Namekian Dragonballs, they are inactive!")


				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc = locate(usr.x,usr.y,usr.z)
						for(var/obj/nsummon/S in usr.contents)
							if(S)
								del(S)

obj
	nfakedbs
		db1
			name = "Namekian Dragonball (1)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "1"
		db2
			name = "Namekian Dragonball (2)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "2"
		db3
			name = "Namekian Dragonball (3)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "3"
		db4
			name = "Namekian Dragonball (4)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "4"
		db5
			name = "Namekian Dragonball (5)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "5"
		db6
			name = "Namekian Dragonball (6)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "6"
		db7
			name = "Namekian Dragonball (7)"
			icon = 'icons/namek_dragonball.dmi'
			icon_state = "7"

mob
	proc
		ndballsummon()
			set background = 1
			var/ndbone = new/obj/nfakedbs/db1
			var/ndbtwo = new/obj/nfakedbs/db2
			var/ndbthree = new/obj/nfakedbs/db3
			var/ndbfour = new/obj/nfakedbs/db4
			var/ndbfive = new/obj/nfakedbs/db5
			var/ndbsix = new/obj/nfakedbs/db6
			var/ndbseven = new/obj/nfakedbs/db7
			ndbone:loc = locate(src.x-1,src.y+1,src.z)
			ndbtwo:loc = locate(src.x+1,src.y+1,src.z)
			ndbthree:loc = locate(src.x-2,src.y+2,src.z)
			ndbfour:loc = locate(src.x+2,src.y+2,src.z)
			ndbfive:loc = locate(src.x-1,src.y+3,src.z)
			ndbsix:loc = locate(src.x+1,src.y+3,src.z)
			ndbseven:loc = locate(src.x,src.y+2,src.z)


mob
	proc
		NdbScatter()
			spawn(1)
				set background = 1
				src.summondrag = 0
				for(var/obj/nsummon/B in src.contents)
					if(B)
						del(B)
				for(var/obj/ndragonball/O in src.contents)
					if(O)
						del(O)
				for(var/obj/ndragonball/F in world)
					if(F)
						del(F)
				for(var/obj/nfakedbs/Z in world)
					if(Z)
						del(Z)
				src.contents += new /obj/ndragonball/ndragonball1
				src.contents += new /obj/ndragonball/ndragonball2
				src.contents += new /obj/ndragonball/ndragonball3
				src.contents += new /obj/ndragonball/ndragonball4
				src.contents += new /obj/ndragonball/ndragonball5
				src.contents += new /obj/ndragonball/ndragonball6
				src.contents += new /obj/ndragonball/ndragonball7
				world << 'sounds/dbs_flying.wav'
				Ndbsactive = 0
				inactivate_Ndbs()
				ndbtime = 90
				ndbact()
				for(var/obj/ndragonball/O in world)
					world << "<FONT COLOR = GREEN><FONT SIZE = 2>A Namekian Dragonball shoots into the sky!"
					O.loc=locate(rand(1,150),rand(1,150),5)
				spawn(25)
					view(150) << sound('sounds/blank.wav',0,0,8)
					view(150) << sound('music/title.mid',1)
mob
	proc
		Ndbremove()
			spawn(1)
				set background = 1
				src.summondrag = 0
				for(var/obj/nsummon/B in src.contents)
					if(B)
						del(B)
				for(var/obj/ndragonball/O in src.contents)
					if(O)
						del(O)
				for(var/obj/ndragonball/F in world)
					if(F)
						del(F)
				for(var/obj/nfakedbs/Z in world)
					if(Z)
						del(Z)
				src.contents += new /obj/ndragonball/ndragonball1
				src.contents += new /obj/ndragonball/ndragonball2
				src.contents += new /obj/ndragonball/ndragonball3
				src.contents += new /obj/ndragonball/ndragonball4
				src.contents += new /obj/ndragonball/ndragonball5
				src.contents += new /obj/ndragonball/ndragonball6
				src.contents += new /obj/ndragonball/ndragonball7
				world << 'sounds/dbs_flying.wav'
				Ndbsactive = 1
				for(var/obj/ndragonball/O in world)
					world << "<FONT COLOR = GREEN><FONT SIZE = 2>An Active Namekian Dragonball shoots into the sky!"
					O.loc=locate(rand(1,150),rand(1,150),5)
				spawn(25)
					view(150) << sound('sounds/blank.wav',0,0,8)
					view(150) << sound('music/title.mid',1)
