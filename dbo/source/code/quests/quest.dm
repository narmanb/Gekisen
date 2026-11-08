mob
	Bump(atom/O)
		if(istype(O,/mob/HBQe))
			O:tryit(usr)
mob
	HBQe
		icon = 'icons/babidiship.dmi'
		layer = 4
		density = 1
		majined = 1
		npc = 1
		ap = -100
		npp = 1
		itinvis = 1
		scaninvis = 1
		powerlevel. = new(1e+30)
		ki = new(1e+30)
		dead = 1
		immortal = 1
		name = "Mysterious Ship"
		New()
			..()
			var/tmp/z1 = rand(1,12)
			if(z1 == 12)
				src:Move(locate((rand(2,149)),(rand(2,70)),22))

			else
				var/tmp/z2 = rand(1,10)
				if(z2 == 1)
					src:Move(locate(rand(2,149),rand(2,149),1))


				if(z2 == 2)
					src:Move(locate(rand(2,149),rand(2,149),5))


				if(z2 == 3)
					src:Move(locate(rand(2,149),rand(2,149),6))


				if(z2 == 4)
					src:Move(locate(rand(2,149),rand(2,149),7))


				if(z2 == 5)
					src:Move(locate(rand(2,149),rand(2,149),9))


				if(z2 == 6)
					src:Move(locate(rand(2,149),rand(2,149),11))


				if(z2 == 7)
					src:Move(locate(rand(2,149),rand(2,149),12))


				if(z2 == 8)
					src:Move(locate(rand(2,149),rand(2,149),13))


				if(z2 == 10)
					src:Move(locate(rand(2,149),rand(2,149),16))


				if(z2 == 9)
					src:Move(locate(rand(2,149),rand(2,149),21))


		proc/tryit(var/mob/M)
			set background = 1
			if(ismob(M))
				var/rch = rand(1,25)
				if(rch != 1)
					M << "Seems like someone left a ship here.. Oh well, it doesn't catch your attention."
					var/tmp/z1 = rand(1,62)
					if(z1 == 12)
						src:Move(locate((rand(2,149)),(rand(2,70)),22))


					else
						var/tmp/z2 = rand(1,60)
						if(z2 == 1)
							src:Move(locate(rand(2,149),rand(2,149),1))



						if(z2 == 2)
							src:Move(locate(rand(2,149),rand(2,149),5))



						if(z2 == 3)
							src:Move(locate(rand(2,149),rand(2,149),6))



						if(z2 == 4)
							src:Move(locate(rand(2,149),rand(2,149),7))



						if(z2 == 5)
							src:Move(locate(rand(2,149),rand(2,149),9))



						if(z2 == 6)
							src:Move(locate(rand(2,149),rand(2,149),11))



						if(z2 == 7)
							src:Move(locate(rand(2,149),rand(2,149),12))



						if(z2 == 8)
							src:Move(locate(rand(2,149),rand(2,149),13))



						if(z2 == 9)
							src:Move(locate(rand(2,149),rand(2,149),16))



						if(z2 == 10)
							src:Move(locate(rand(2,149),rand(2,149),21))



				else
					M << "Something catches your attention about the ship. It's Babidi's Ship! Geeze, you would think they would've learned to be more secretive!"
					M.loc=locate(109,127,20)
					M.hbq = 1
					M.itinvis = 1
					var/tmp/z1 = rand(1,12)
					if(z1 == 12)
						src:Move(locate((rand(2,149)),(rand(2,70)),22))


					else
						var/tmp/z2 = rand(1,10)
						if(z2 == 0)
							src:Move(locate(rand(2,149),rand(2,149),1))



						if(z2 == 2)
							src:Move(locate(rand(2,149),rand(2,149),5))



						if(z2 == 3)
							src:Move(locate(rand(2,149),rand(2,149),6))



						if(z2 == 4)
							src:Move(locate(rand(2,149),rand(2,149),7))



						if(z2 == 5)
							src:Move(locate(rand(2,149),rand(2,149),9))



						if(z2 == 6)
							src:Move(locate(rand(2,149),rand(2,149),11))



						if(z2 == 7)
							src:Move(locate(rand(2,149),rand(2,149),12))



						if(z2 == 8)
							src:Move(locate(rand(2,149),rand(2,149),13))



						if(z2 == 9)
							src:Move(locate(rand(2,149),rand(2,149),16))



						if(z2 == 10)
							src:Move(locate(rand(2,149),rand(2,149),21))

mob/quest
	Dende
		icon = 'icons/Dende.dmi'
		dead = 1
		npc = 1
		name = "(NPC) Chibi Dende"
		DblClick()
			if(src in oview(1))
				Talk()
		verb
			Talk()
				if(src in oview(1))
					usr.ndbqd = 1
					alert("Thank you for rescuing me. Please tell Guru that I am okay")
	Nail
		icon = 'icons/Nail.dmi'
		icon_state = "dead"
		dead = 1
		npc = 1
		name = "(NPC) Nail"
		DblClick()
			if(usr.npctalk != 1)
				if(src in oview(1))
					Talk()
			else
				alert("You already are talking to a NPC")
		verb
			Talk()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					if(src in oview(1))
						if(usr.ndbqn != 1)
							usr.ndbqn = 1
							alert("Nail: Argh! I am badly hurt and I fear I won't make it.. please tell Guru that I had tried to protect the dragonballs with all my strength.")
							usr.npctalk = 0
						else
							if(usr.race != "Namek")
								alert("Nail: I don't think I'll be here for much longer now.")
								usr.npctalk = 0
							if(usr.race == "Namek")
								if(usr.nquest == 2)
									usr << "You look at the dead body of Nail.. who gave up his life trying to protect the Namekian Dragonballs."
									usr.npctalk = 0
								else if(usr.nquest )
									var/dbs
									for(var/obj/dragonball/DB in usr.contents)
										if(istype(DB))
											dbs++
									if(dbs == 7)
										for(var/obj/ndragonball/A in usr.contents)
											if(A)
												del(A)
										alert("Thank you..I can now die in peace.but before I go.. I shall fuse my power with you as a thanks.")
										usr.move = 0
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										usr.overlays += 'icons/wind.dmi'
										usr << "<B>You begin to fuse with Nail."
										sleep(rand(100,250))
										usr << "You feel your body growing with Ki energy!"
										view(6) << 'sounds/aura.wav'
										usr.underlays += /obj/MysticAuraTop
										usr.underlays += /obj/MysticAuraBottom
										sleep(rand(100,250))
										usr.powerlevel.max_value *= 1.0625
										usr.ki.max_value *= 1.0625
										usr.underlays -= /obj/MysticAuraTop
										usr.underlays -= /obj/MysticAuraBottom
										usr << "<B>You have fused with Nail."
										usr.overlays -= 'icons/wind.dmi'
										view(6) << "<FONT COLOR = RED>[usr]: </FONT>Yes! I feel reborn, this power increase is amazing!"
										usr<< "Nail gives you some of his power..then lies still."
										sleep(50)
										usr.move = 1
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.nquest = 2
										usr << "<FONT COLOR = RED>[usr]: </FONT>Goodbye, Nail. Atleast your death was not in vain.."
										usr.npctalk = 0
									else
										alert("Nail: Please bring all 7 Namekian dragonballs..")
										usr.npctalk = 0
								else
									usr.nquest = 1
									usr.npctalk = 0
									alert("Nail: Please help me before I pass away. Please bring me all seven namekian dragonballs..before it's too late..")


obj/items/quest/
	icon = 'icons/quest.dmi'
	BuuT
		icon_state = "buut"
		name = "Transporter"
		density = 1
		DblClick()
			if(src in view(1))
				Use()
			else
				return
		verb
			Use()
				if(src in view(1))
					set category = null
					if(usr.useb )
						usr << "You can't use this yet."
						return
					else if(usr.ap < 0)
						usr << "The device doesn't respond to you."
						usr << "You leave."
						usr.useb = 0
						usr.hbq = 0
						usr.itinvis = 0
						usr.loc = locate(usr.hx, usr.hy, usr.hz)
					else
						usr.useb = 1
						if(usr.hbq == 1||usr.hbq == 2)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 2)
										usr.loc = locate(108,113,20)
										usr.hbq = 3
										alert("You go down!")
										return
									else
										usr << "<b><font colour = red>PuiPui: Not so fast! If you think I am going to let you reach Master babidi and desturb his work, you are wrong!</font>"
										new /monster/quest/reincarnate/PuiPui(locate(115,127,20))
										return
						else if(usr.hbq == 3||usr.hbq == 4)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 4)
										usr.loc = locate(108,100,20)
										usr.hbq = 5
										alert("You go down!")
										return
									else
										usr << "<b><font colour = green>Yakon: You are light! And I am hungry, guess someone just ordered me some fast food!</font>"
										new /monster/quest/reincarnate/Yakon(locate(115,113,20))
										return
						else if(usr.hbq == 5||usr.hbq == 6)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 6)
										usr.loc = locate(108,85,20)
										usr.hbq = 7
										alert("You go down!")
										return
									else
										usr << "<b><font colour = red>Dabura: Feh, a weak fighter! You won't win!</font>"
										new /monster/quest/reincarnate/Dabura(locate(115,100,20))
										return
						else if(usr.hbq == 7||usr.hbq == 8)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 8)
										usr.loc = locate(108,71,20)
										usr.hbq = 9
										alert("You go down!")
										return
									else
										usr << "<b><font colour = red>)V(ajin Vegeta: Ha, you think you can win against the mighty Saiyan Prince?!!!</font>"
										new /monster/quest/reincarnate/MVegeta(locate(115,85,20))
										return
						else if(usr.hbq == 9||usr.hbq == 10)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 10)
										usr.loc = locate(108,56,20)
										usr.hbq = 11
										alert("You go down!")
										return
									else
										usr << "<b><font colour = yellow>Babidi: You will not stop me from releasing Majin Buu! NOW YOU WILL SURELY LOOSE!!!</font>"
										new /monster/quest/reincarnate/Babidi(locate(115,71,20))
										return
						else if(usr.hbq == 11||usr.hbq == 12||usr.hbq == 0)
							switch(input("Please pick an option:",null,text) in list("Go down to the next level","Leave","Cancel"))
								if("Cancel")
									usr.useb = 0
									return
								if("Leave")
									switch(alert("Are you sure you want to leave?",null,"No","Yes"))
										if("No")
											usr.useb = 0
											return
										if("Yes")
											usr.useb = 0
											usr.hbq = 0
											usr.itinvis = 0
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											alert("You have left!")
											return
								if("Go down to the next level")
									usr.useb = 0
									if(usr.hbq == 12)
										if(usr.race == "Buu"||usr.race == "Earthling")
											if(usr.ap >= 100)
												if(usr.buuhumanlearn != 1&&usr.buuhumanlearn != 2)
													usr.contents += new /obj/transes/ubuu/
													usr.buuhumanlearn = 1
													if(!frreincarnation)
														if(!usr.fused)
															frreincarnation = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
															world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Reincarnation</font></b>"
													alert("You have gotten the Transformation: Reincarnation!")
													return
												alert("You tried to go down but it seems you can't!")
												usr.buuhumanlearn = 2
												usr.loc = locate(usr.hx, usr.hy, usr.hz)
												usr.hbq = 0
												usr.itinvis = 0
												return
											else
												alert("You are not pure enough to learn Reincarnation!")
												alert("You tried to go down but it seems you can't!")
												usr.loc = locate(usr.hx, usr.hy, usr.hz)
												usr.hbq = 0
												usr.itinvis = 0
										else
											alert("You tried to go down but it seems you can't!")
											usr.loc = locate(usr.hx, usr.hy, usr.hz)
											usr.hbq = 0
											usr.itinvis = 0
											usr.buuhumanlearn = 2
											return
									else
										usr << "<b><font colour = fuchsia>Buu: You will not WIN!!!</font>"
										new /monster/quest/reincarnate/Buu(locate(115,56,20))
										return
						else
							usr.useb = 0
							usr.hbq = 0
							usr.itinvis = 0
							usr.loc = locate(usr.hx, usr.hy, usr.hz)
							alert("You have left!")
							return

	techanalyser/
		t1
			name = "Techanalyser Part 1"
			icon_state = "T1"

			verb
				Drop()
					set category = null
					switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
						if("No")
							return
						if("Yes")
							del(src)


				Get()
					set category = null
					set src in oview(1)
					Move(usr)


		t2
			name = "Techanalyser Part 2"
			icon_state = "T2"

			verb
				Drop()
					set category = null
					switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
						if("No")
							return
						if("Yes")
							del(src)



				Get()
					set category = null
					set src in oview(1)
					Move(usr)


		t3
			name = "Techanalyser Part 3"
			icon_state = "T3"

			verb
				Drop()
					set category = null
					switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
						if("No")
							return
						if("Yes")
							del(src)



				Get()
					set category = null
					set src in oview(1)
					Move(usr)


		t4
			name = "Techanalyser Part 4"
			icon_state = "T4"

			verb
				Drop()
					set category = null
					switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
						if("No")
							return
						if("Yes")
							del(src)



				Get()
					set category = null
					set src in oview(1)
					Move(usr)


		t5
			name = "Techanalyser Part 5"
			icon_state = "T5"

			verb
				Drop()
					set category = null
					switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
						if("No")
							return
						if("Yes")
							del(src)



				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		ta
			name = "Techanalyser"
			icon_state = "Techanalyser"
			DblClick()
				Scan()
			verb
				Drop()
					set category = null
					if(src in usr.contents)
						switch(alert("IF YOU DROP THE [src], IT SHALL BE DELETED, CONTINUE?",null,"No","Yes"))
							if("No")
								return
							if("Yes")
								del(src)
								usr.mechquest1 = 2
					else
						alert("It must be in your inventory")
				Scan(mob/characters/M in oview(6))
					set category = null
					if(src in usr.contents)
						if(usr.mechquest1 != 2)
							alert("You try to figure out how to use the Techanalyser but you have no luck")
						else
							if(usr.tau )
								alert("You are already using the Techanalyser!")
							else
								usr.tau = 1
								switch(alert("Are you sure you want to learn about [M.New_Tech]?",null,"Yes","No"))
									if("No")
										alert("Machine shutting down again")
										usr.tau = 0
									if("Yes")
										if(M.New_Tech == null)
											alert("You can't do this")
											usr.tau = 0
										else
											switch(alert("Do you want to spend 10 battle points to learn [M.New_Tech]?",null,"No","Yes"))
												if("No")
													alert("Machine shutting down again")
													usr.tau = 0
												if("Yes")
													if(M.New_Tech == "Materialize")
														usr.skills += new /obj/techs/Create
													if(M.New_Tech == "Cosmic Halo")
														usr.skills += new /obj/techs/cosmichalo
													if(M.New_Tech == "Heal")
														usr.skills += new /obj/techs/namekheal
													if(M.New_Tech == "Absorb")
														usr.skills += new /obj/techs/playerabsorb
													if(M.New_Tech == "HEA")
														usr.skills += new /obj/techs/humangeno
													if(M.New_Tech == "Burning")
														usr.skills += new /obj/techs/burning
													if(M.New_Tech == "Energy Ring")
														usr.skills += new /obj/techs/energyring
														usr.eruse = 2
													usr.tau = 0
													usr.npctalk = 0
													usr.mechquest1 = 3
													usr << "The Techanalyser suddenly breaks down into dust!"
													del(src)
					else
						alert("[src] must be in your inventory!")

obj/items/quest/
	saiyawatchm
		name = "Saiyaman Watch"
		icon = 'icons/quest.dmi'
		icon_state = "saiyawatch"
		DblClick()
			if(src in usr.contents)
				Wear()
			else
				alert("The Saiyaman Watch must be in your inventory!")
		verb
			Wear()
				set category = null
				if(src in usr.contents)
					if(usr.race != "Half-Saiyan")
						alert("You are not a Half-Saiyan, you can't use this!")
					else
						if(src.worn )
							src.worn = 0
							usr.skinrestore()
							usr.hairrestore()
							usr << "You press the button on the [src.name] and the costume comes off."
						else
							src.worn = 1
							usr.icon = 'icons/saiyaman.dmi'
							usr.hairremoval()
							usr << "You press the button on the [src.name] and the costume comes on."
				else
					alert("[src] must be in your inventory!")
			Drop()
				set category = null
				if(usr.fused )
					usr << "You can't drop this!"
					return
				else
					if(src.worn )
						usr << "Not while its being worn."
					if(src.worn == 0)
						src.loc=locate(usr.x,usr.y,usr.z)
			Get()
				set category = null
				set src in oview(1)
				Move(usr)
	saiyawatchw
		name = "Saiyagirl Watch"
		icon = 'icons/quest.dmi'
		icon_state = "saiyawatch"
		Click()
			if(src in usr.contents)
				Wear()
			else
				alert("The Saiyaman Watch must be in your inventory!")
		verb
			Wear()
				set category = null
				usr << "Retired"
				del(src)
				/*if(src in usr.contents)
					if(usr.race != "Half-Saiyan")
						alert("You are not a Half-Saiyan, you can't use this!")
					else
						if(src.worn )
							src.worn = 0
							usr.skinrestore()
							usr.hairrestore()
							usr << "You press the button on the [src.name] and the costume comes off."
						else
							src.worn = 1
							usr.icon = 'icons/saiyagirl.dmi'
							if(usr.hair == "Short")
								usr.overlays -= 'icons/hair_black_short.dmi'
							if(usr.hair == "Spikey")
								usr.overlays -= 'icons/hair_black_spikey.dmi'
							if(usr.hair == "Long")
								usr.overlays -= 'icons/hair_black_long.dmi'
							if(usr.hair == "Short Spikey")
								usr.overlays -= 'icons/gtvegeta.dmi'
							if(usr.hair == "Mohawk")
								usr.overlays -= 'icons/hair_mohawk.dmi'
							if(usr.hair == "Vegeta")
								usr.overlays -= 'icons/hair_vegeta.dmi'
							if(usr.hair == "Goku")
								usr.overlays -= 'icons/hair_goku.dmi'
							if(usr.hair == "Trunks")
								usr.overlays -= 'icons/hair_trunks.dmi'
							if(usr.hair == "Goten")
								usr.overlays -= 'icons/hair_goten.dmi'
							if(usr.hair == "Gohan")
								usr.overlays -= 'icons/hair_gohan.dmi'
							if(usr.hair == "Vegito")
								usr.overlays -= 'icons/hair_vegito.dmi'
							if(usr.hair == "Recoome")
								usr.overlays -= 'icons/hair_reccoom.dmi'
							usr << "You press the button on the [src.name] and the costume comes on."
				else
					alert("[src] must be in your inventory!")*/
			Drop()
				set category = null
				if(usr.fused )
					usr << "You can't drop this!"
					return
				else
					if(src.worn )
						usr << "Not while its being worn."
					if(src.worn == 0)
						src.loc=locate(usr.x,usr.y,usr.z)
			Get()
				set category = null
				set src in oview(1)
				Move(usr)
