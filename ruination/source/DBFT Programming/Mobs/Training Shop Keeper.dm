mob
	NPC
		Training_Shop_Keeper
			name = "Training Shop Keeper"
			icon = 'NPCs - New.dmi'
			icon_state = "Training Shop"
			density = 1
			safe = 1
			frozen = 1
			energy_code=5131581
			New()
				..()
				if(src.z==2)
					src.energy_code=5131582
				if(src.z==3)
					src.energy_code=5131583
				if(src.z==7)
					src.energy_code=0
				if(src.z==8)
					src.energy_code=0
//				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					spawn(30)usr.talking=0
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							if(!usr.sellable_items)
								usr.talking=0
								return
							var/list/Sellable=list()
							for(var/obj/I in usr.contents)
								if(!I.equiped && I.value)
									Sellable.Add(I)
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [applycommas(sell.value/10)] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								if(sell.equiped)
									usr.talking=0
									usr<<"Unequip the item first"
									return
								else
									usr.zenni+=sell.value/10
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									usr.talking=0
									del(sell)
							if(usr.CheckInventory()==TRUE)return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to browse?")in list(/*"Senzu Bean",*/"Shard","Weighted Clothing","Never Mind"))
								if("Senzu Bean")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/price=10000
									var/obj/Equipment/Consumable/Senzu/O = new
									var/snum=input("How many do you want to buy?")as num
									if((snum+usr.inven_min)>usr.inven_max)
										usr << "You don't have space for all those!"
										usr.talking=0
										return
									if(usr.zenni >= (price*snum))
										usr.zenni -= (price*snum)
										O *= snum
										usr.contents += O
										O.value*=2
										usr.talking=0
										O.name = "Senzu Bean"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(price*snum)] zenni!"
										usr.talking=0
										return

								if("Shard")
							/*		switch(input("What kind of shard?")in list("Training Shard","Never Mind"))
										if("Never Mind")
											usr.talking = 0
											return

										if("Stat Shard")
											switch(input("What do you want to buy?")in list("Small PL Shard","Small KI Shard","Small KI DEF Shard","Small STR Shard","Small DEF Shard","Large PL Shard","Large KI Shard","Large KI DEF Shard","Large STR Shard","Large DEF Shard","Never Mind"))
												if("Never Mind")
													usr.talking = 0
													return

												if("Small PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Small KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Small KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Small STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Small DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Small SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

										if("Training Shard")*/
									switch(input("What do you want to buy?")in list("Small EXP Shard","Small Stat Shard","Small Zenni Shard","Large EXP Shard","Large Stat Shard","Large Zenni Shard","Never Mind"))
										if("Never Mind")
											usr.talking = 0
											return

										if("Small EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SEXP_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Small Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Small Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SSTT_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Small Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Small Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SZ_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Small Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LEXP_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Large Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LSTT_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Large Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LZ_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Large Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

								if("Weighted Clothing")
									switch(input("What do you want to buy?")in list("Ankle Weights","Arm Weights","Leg Weights","Wrist Weights","Weighted Armor","Weighted Cape","Weighted Gi","Weighted Turben","Advanced Ankle Weights","Advanced Arm Weights","Advanced Leg Weights","Advanced Wrist Weights","Advanced Weighted Armor","Advanced Weighted Cape","Advanced Weighted Gi","Advanced Weighted Turben","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return

										if("Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Ankle Weight"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Arm Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Leg Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Wrist Weight"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Weighted Armor")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Armor"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Cape"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Gi"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value
												O.value*=0.5
												O.weight=1.8
												usr.talking=0
												O.name = "Weighted Turben"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
												usr.talking=0
												return
										if("Advanced Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Ankle Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Arm Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Leg Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Wrist Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Armor")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Advanced Weighted Armor"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Cape"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Gi"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*8)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*8
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Advanced Weighted Turben"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*8)] zenni!"
												usr.talking=0
												return
								if("Never Mind")
									usr.talking=0
									return

mob
	NPC
		Advanced_Training_Shop_Keeper
			name = "Advanced Training Shop Keeper"
			icon_state = "ShopKeeper5"
			density = 1
			safe = 1
			frozen = 1
			energy_code=6938201
			New()
				..()
				if(src.z==2)
					src.energy_code=6938202
				if(src.z==3)
					src.energy_code=6938203
				if(src.z==7)
					src.energy_code=0
				if(src.z==8)
					src.energy_code=0
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.talking)
						return
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
							if(!usr.sellable_items)
								usr.talking=0
								return
							var/list/Sellable=list()
							for(var/obj/I in usr.contents)
								if(!I.equiped && I.value)
									Sellable.Add(I)
							Sellable.Add("Cancel")
							var/obj/sell=input("What do you want to sell?")as anything in Sellable
							if(sell=="Cancel")
								usr.talking=0
								return
							var/confirm=input("Do you want to sell [sell.name] for [applycommas(sell.value/10)] zenni?")in list("Yes","No")
							if(!sell in usr.contents)
								usr.talking=0
								return
							if(confirm=="No")
								usr.talking=0
								return
							else
								if(sell.equiped)
									usr.talking=0
									usr<<"Unequip the item first."
									return
								else
									usr.zenni+=sell.value/10
									usr.talking=0
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									del(sell)
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to browse?")in list("Shard","Weighted Clothing","Never Mind"))
								if("Shard")
							/*		switch(input("What kind of shard?")in list("Training Shard","Never Mind"))
										if("Stat Shard")
											switch(input("What do you want to buy?")in list("Small PL Shard","Small KI Shard","Small KI DEF Shard","Small STR Shard","Small DEF Shard","Large PL Shard","Large KI Shard","Large KI DEF Shard","Large STR Shard","Large DEF Shard",/*"Great PL Shard","Great KI Shard","Great KI DEF Shard","Great STR Shard","Great DEF Shard",*/"Massive PL Shard","Massive KI Shard","Massive KI DEF Shard","Massive STR Shard","Massive DEF Shard","Never Mind"))
												if("Never Mind")
													usr.talking = 0
													return

												if("Small PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Small KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Small KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Small STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Small DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Small SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/SSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Small Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
														usr.talking=0
														return

												if("Large PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Large SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/LSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Large Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

							/*					if("Great PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Great KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Great KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Great STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Great DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Great SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/GSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Great Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return*/

												if("Massive PL Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MPL_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Powerlevel Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Massive KI Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MKI_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Ki Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Massive KI DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MKIDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Ki Defense Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Massive STR Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MSTR_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Strength Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Massive DEF Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MDEF_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Defence Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

												if("Massive SPD Shard")
													if(usr.inven_min>=usr.inven_max)
														usr<<"You have no space in your inventory."
														usr.talking=0
														return
													var/obj/Equipment/Buff_Items/MSPD_Shard/O = new
													if(usr.zenni >= O.value*5)
														usr.zenni -= O.value*5
														usr.contents += O
														usr.talking=0
														O.name = "Massive Speed Shard"
														usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
														return
													else
														usr << "<font color = white>Shop Keeper:</font> You need [O.value*5] zenni!"
														usr.talking=0
														return

										if("Training Shard")*/
									switch(input("What do you want to buy?")in list("Small EXP Shard","Small Stat Shard","Small Zenni Shard","Large EXP Shard","Large Stat Shard","Large Zenni Shard",/*"Great EXP Shard","Great Stat Shard","Great Zenni Shard",*/"Massive EXP Shard","Massive Stat Shard","Massive Zenni Shard","Permanent Massive EXP Shard","Permanent Massive Stat Shard","Never Mind"))
										if("Never Mind")
											usr.talking = 0
											return

										if("Small EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SEXP_Shard/O = new
											if(usr.zenni >= O.value*2)
												usr.zenni -= O.value*2
												usr.contents += O
												usr.talking=0
												O.name = "Small Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Small Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SSTT_Shard/O = new
											if(usr.zenni >= O.value*2)
												usr.zenni -= O.value*2
												usr.contents += O
												usr.talking=0
												O.name = "Small Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Small Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/SZ_Shard/O = new
											if(usr.zenni >= O.value*2)
												usr.zenni -= O.value*2
												usr.contents += O
												usr.talking=0
												O.name = "Small Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LEXP_Shard/O = new
											if(usr.zenni >= O.value*2.5)
												usr.zenni -= O.value*2.5
												usr.contents += O
												usr.talking=0
												O.name = "Large Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LSTT_Shard/O = new
											if(usr.zenni >= O.value*2.5)
												usr.zenni -= O.value*2.5
												usr.contents += O
												usr.talking=0
												O.name = "Large Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Large Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/LZ_Shard/O = new
											if(usr.zenni >= O.value*2.5)
												usr.zenni -= O.value*2.5
												usr.contents += O
												usr.talking=0
												O.name = "Large Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

							/*			if("Great EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/GEXP_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Great Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Great Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/GSTT_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Great Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Great Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/GZ_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Great Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return*/

										if("Massive EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/MEXP_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Massive Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Massive Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/MSTT_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Massive Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Massive Zenni Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/MZ_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Massive Zenni Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Permanent Massive EXP Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/PMEXP_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Permanent Massive Exp Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return

										if("Permanent Massive Stat Shard")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Buff_Items/PMSTT_Shard/O = new
											if(usr.zenni >= O.value*5)
												usr.zenni -= O.value*5
												usr.contents += O
												usr.talking=0
												O.name = "Permanent Massive Stat Shard"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*5)] zenni!"
												usr.talking=0
												return



								if("Weighted Clothing")
									switch(input("What do you want to buy?")in list("Super Ankle Weights","Super Arm Weights","Super Leg Weights","Super Wrist Weights","Super Weighted Armor","Super Weighted Cape","Super Weighted Gi","Super Weighted Turben","Ultra Ankle Weights","Ultra Arm Weights","Ultra Leg Weights","Ultra Wrist Weights","Ultra Weighted Armor","Ultra Weighted Cape","Ultra Weighted Gi","Ultra Weighted Turben","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return
										if("Super Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Ankle Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Arm Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Leg Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Wrist Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Weighted Armor")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Super Weighted Armor"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Weighted Cape"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Weighted Gi"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Super Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*25)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*25
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Super Weighted Turben"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*25)] zenni!"
												usr.talking=0
												return
										if("Ultra Ankle Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Ankle Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Arm Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Arm Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Leg Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Leg Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Wrist Weights")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Wrist Weights"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Armor")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=2.5
												O.weight=1.8
												usr.talking=0
												O.name = "Ultra Weighted Armor"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Cape")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Weighted Cape"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Gi")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Weighted Gi"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Turben")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*40)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*40
												O.value*=3.5
												O.weight=2.3
												usr.talking=0
												O.name = "Ultra Weighted Turben"
												usr.contents += O
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value*40)] zenni!"
												usr.talking=0
												return
								if("Never Mind")
									usr.talking=0
									return

