
mob
	NPC
		Power_Shop_Keeper
			name = "Power Items Shop Keeper"
			icon = 'NPCs - New.dmi'
			icon_state = "Power Items Shop"
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
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Power Items")
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
							switch(input("What do you want to browse?")in list("Cloak","Never Mind"))

								if("Cloak")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Cloak/O = new
									if(usr.zenni >= O.value)
										var/r=input("How much Red do you want?")as num
										var/g=input("How much Green do you want?")as num
										var/b=input("How much Blue do you want?")as num
										O.icon += rgb(r,g,b)
										usr.zenni -= O.value
										usr.contents += O
										O.power = 1
										O.weight=1.8
										usr.talking=0
										O.name = "Energy Cloak"
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
/*
								if("Enchanted Weighted Clothing")
									switch(input("What do you want to buy?")in list("Ankle Weights of Ki Control","Arm Weights of Ki Control","Leg Weights of Ki Control","Wrist Weights of Ki Control","Weighted Armor of Ki Control","Weighted Cape of Ki Control","Weighted Gi of Ki Control","Weighted Turben of Ki Control","Advanced Ankle Weights of Ki Control","Advanced Arm Weights of Ki Control","Advanced Leg Weights of Ki Control","Advanced Wrist Weights of Ki Control","Advanced Weighted Armor of Ki Control","Advanced Weighted Cape of Ki Control","Advanced Weighted Gi of Ki Control","Advanced Weighted Turben of Ki Control","Super Ankle Weights of Ki Control","Super Arm Weights of Ki Control","Super Leg Weights of Ki Control","Super Wrist Weights of Ki Control","Super Weighted Armor of Ki Control","Super Weighted Cape of Ki Control","Super Weighted Gi of Ki Control","Super Weighted Turben of Ki Control","Ultra Ankle Weights of Ki Control","Ultra Arm Weights of Ki Control","Ultra Leg Weights of Ki Control","Ultra Wrist Weights of Ki Control","Ultra Weighted Armor of Ki Control","Ultra Weighted Cape of Ki Control","Ultra Weighted Gi of Ki Control","Ultra Weighted Turben of Ki Control","Never Mind"))
										if("Never Mind")
											usr.talking=0
											return

										if("Ankle Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Ankle Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Arm Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Arm Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Leg Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Leg Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Wrist Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Wrist Weight of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Weighted Armor of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Weighted Armor of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Weighted Cape of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Weighted Cape of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Weighted Gi of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Weighted Gi of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Weighted Turben of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*50)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*50
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=1
												usr.talking=0
												O.name = "Weighted Turben of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*50] zenni!"
												usr.talking=0
												return
										if("Advanced Ankle Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Ankle Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Arm Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Arm Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Leg Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Leg Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Wrist Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Wrist Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Armor of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Weighted Armor of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Cape of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Weighted Cape of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Gi of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Weighted Gi of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Advanced Weighted Turben of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*100)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*100
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=2
												usr.talking=0
												O.name = "Advanced Weighted Turben of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*100] zenni!"
												usr.talking=0
												return
										if("Super Ankle Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Ankle Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Arm Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Arm Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Leg Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Leg Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Wrist Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Wrist Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Weighted Armor of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Weighted Armor of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Weighted Cape of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Weighted Cape of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Weighted Gi of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Weighted Gi of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Super Weighted Turben of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*160)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*160
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=3
												usr.talking=0
												O.name = "Super Weighted Turben of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*160] zenni!"
												usr.talking=0
												return
										if("Ultra Ankle Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Ankle/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Ankle Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Arm Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Arm/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Arm Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Leg Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Leg/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Leg Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Wrist Weights of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Wrist/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Wrist Weights of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Armor of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Weighted_Armor/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=2.5
												O.weight=1.8
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Weighted Armor of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Cape of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Cape/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Weighted Cape of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Gi of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Gi/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Weighted Gi of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
										if("Ultra Weighted Turben of Ki Control")
											if(usr.inven_min>=usr.inven_max)
												usr<<"You have no space in your inventory."
												usr.talking=0
												return
											var/obj/Equipment/Turben/O = new
											if(usr.zenni >= O.value*250*4)
												var/r=input("How much Red do you want?")as num
												var/g=input("How much Green do you want?")as num
												var/b=input("How much Blue do you want?")as num
												O.icon += rgb(r,g,b)
												usr.zenni -= O.value*250*4
												usr.contents += O
												O.value*=3.5
												O.weight=2.3
												O.enchantment = "Ki Control"
												O.power=4
												usr.talking=0
												O.name = "Ultra Weighted Turben of Ki Control"
												usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
												return
											else
												usr << "<font color = white>Shop Keeper:</font> You need [O.value*250*4] zenni!"
												usr.talking=0
												return
												*/
								if("Never Mind")
									usr.talking=0
									return



