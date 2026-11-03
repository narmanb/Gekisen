mob
	NPC
		Videl
			name = "Videl"
			icon_state = "Videl"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 2245332

			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Videl")
					usr.underlays -= usr.aura
					if(!usr.learn_aura)
						usr << "<font color = white>Videl:</font> You must first master your Aura before you can change it's colors!"
						return
					switch(input("Videl: What do you need?")in list("Change My Aura","Custom Color Aura","Never Mind"))
						if("Never Mind")
							return
						if("Change My Aura")
							usr.auradefault=0
							switch(input("Videl: Which aura do you want?")in list("Default Aura","Electric Aura 1","Electric Aura Red","Flame Aura","Never Mind"))

								if("Default Aura")
									usr.auradefault=1
									switch(input("Which color do you want?")in list("Default Color","Black","Blue","Green","Red","Yellow","Purple","Never Mind"))
										if("Default Color")
											usr.overlays -= usr.auraset
											usr.aura_on = 0
											var/icon/I = new/obj/Aura
											usr.auraset = I
											usr.overlays += usr.auraset

										if("Black")
											usr.overlays -= usr.auraset
											usr.aura_on = 0

											usr.auraset = new/obj/AuraBlack //'defaultauraBlack.dmi'
											var/icon/I = new(usr.auraset)
											//I.Shift(WEST,28,0)
											//var/numshift = input("number") as num
											//I.Shift(EAST,numshift,0)
											usr.auraset = I

											usr.overlays += usr.auraset

										if("Blue")
											usr.overlays -= usr.auraset
											usr.aura_on = 0
											usr.auraset = new/obj/AuraBlue //'defaultauraBlue.dmi'
											var/icon/I = new(usr.auraset)
											//I.Shift(WEST,30,0)
										//	I.Shift(EAST,-28,0)
											usr.auraset = I

											usr.overlays += usr.auraset
										if("Green")
											usr.overlays -= usr.auraset
											usr.aura_on = 0
											usr.auraset = new/obj/AuraGreen
											usr.overlays += usr.auraset

										if("Red")
											usr.overlays -= usr.auraset
											usr.aura_on = 0
											usr.auraset = new/obj/AuraRed
											usr.overlays += usr.auraset
										if("Yellow")

											usr.overlays -= usr.auraset
											usr.aura_on = 0
											usr.auraset = new/obj/AuraYellow
											usr.overlays += usr.auraset

										if("Purple")
											usr.overlays -= usr.auraset
											usr.aura_on = 0
											usr.auraset = new/obj/AuraPurple
											usr.overlays += usr.auraset

								if("Electric Aura 1")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									//var/auraeq= new/obj/AuraElec1
									usr.auraset = 'ElecAura1.dmi'

									//var/color1 = color
									//auraeq += color1
									usr.overlays += usr.auraset
								if("Electric Aura Red")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'ElecAuraRed.dmi'
									//var/color1 = color
									//auraeq += color1



									usr.overlays += usr.auraset


								if("Blue Aura")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset= 'SpecialAuraBlue.dmi'
									//var/color1 = color
									//auraeq += color1
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,175),ICON_SUBTRACT)
									usr.auraset = I

									usr.overlays += usr.auraset

								if("Flame Aura")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									//var/auraeq= new/obj/AuraElecRed
									//auraset = new/obj/AuraElecRed
									usr.auraset = 'SpecialFlameAura.dmi'
									//var/color1 = color
									//auraeq += color1

									usr.overlays += usr.auraset

						if("Custom Color Aura")
							switch(input("Videl: Which custom aura do you want? You can choose a color after selection")in list("Custom 1","Custom 2","Custom 3","Custom 4","Custom 5","Custom Flame","Never Mind"))
								if("Custom 1")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'Custom1Aura.dmi'
									var/icon/I = new(usr.auraset)
								//	var/transnum = input("How much transparent",0) as num
									I.Blend(rgb(0,0,0,175),ICON_ADD)
									usr.auraset = I
									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset

								if("Custom 2")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'Custom2Aura.dmi'
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,175),ICON_SUBTRACT)
									usr.auraset = I

									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset

								if("Custom 3")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'Custom3Aura.dmi'
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,175),ICON_SUBTRACT)
									usr.auraset = I
									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset

								if("Custom 4")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'Custom6Aura.dmi'
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,225),ICON_ADD)
									usr.auraset = I
									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset

								if("Custom 5")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'Custom4Aura.dmi'
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,255),ICON_SUBTRACT)
									usr.auraset = I
									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset

								if("Custom Flame")
									usr.overlays -= usr.auraset
									usr.aura_on = 0
									usr.auraset = 'CustomFlameAura.dmi'
									var/icon/I = new(usr.auraset)
									I.Blend(rgb(0,0,0,200),ICON_SUBTRACT)
									usr.auraset = I
									var/color=input("Choose aura color") as color
									usr.auraset += color
									usr.overlays += usr.auraset
							//	var/color=input("Please select a color.") as color
/*
		Videl
			name = "Videl"
			icon_state = "Videl"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 2245332

			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Videl")
					usr.underlays -= usr.aura
					switch(input("Videl: What do you need?")in list("Change my Aura color","Never Mind"))
						if("Never Mind")
							return
						if("Change my Aura color")
							if(usr.learn_aura)
								usr.overlays -= new/obj/Aura
								usr.aura_on = 0
								var/auraeq= new/obj/Aura
								var/color1 = color
								auraeq += color1
								usr.overlays += auraeq
							else
								usr << "<vont color = white>Videl:</font> You must first master your Aura before you can change it's colors!"
								return
								*/