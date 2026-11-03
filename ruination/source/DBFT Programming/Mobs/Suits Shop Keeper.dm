mob
	NPC
		Suits_Shop_Keeper
			name = "Suits Shop Keeper"
			icon = 'NPCs - New.dmi'
			icon_state="Clothing Shop"
			density = 1
			safe = 1
			frozen = 1
//			energy_code=8453672
			New()
				..()

				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Suits Shop Keeper")
					if(usr.talking)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					spawn(30)usr.talking=0
					usr.talking=1
					switch(input("Hello. How can I help you today?")in list("Buy","Sell","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Sell")
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
									usr << "<font color = white>Shop Keeper:</font> Thank you. Have a nice day."
									usr.talking=0
									del(sell)
							if(usr.CheckInventory()==TRUE)return
						if("Buy")
							if(usr.CheckInventory()==TRUE)
								usr.talking=0
								return
							switch(input("What do you want to buy?")in list("Trunks Suit","Bardock Suit","Green Goku Outfit","Tuffle Blue Armor","Saiyan Cell Saga Armor","Vegito Suit","MK Suit Blue","MK Suit Green","MK Suit Light Blue","MK Suit Orange","MK Suit Purple","MK Suit Red","Anti Goku Suit","Akatsuki Outfit","Tuxedo","Space Suit","Never Mind"))
								if("Trunks Suit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/Trunks_Suit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
								if("Bardock Suit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/Bardock_Suit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
								if("Green Goku Outfit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/GokuSuitGreen/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0
										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
								if("Tuffle Blue Armor")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/TuffleArmorBlue/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
								if("Saiyan Cell Saga Armor")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/SayiansCellsagasArmor/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return
								if("Vegito Suit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/VegitoSuit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.5
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("MK Suit Blue")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitBlue/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("MK Suit Green")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitGreen/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("MK Suit Light Blue")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitLightBlue/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return


								if("MK Suit Orange")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitOrange/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("MK Suit Purple")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitPurple/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("MK Suit Red")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/MKsuitRed/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("Anti Goku Suit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/AntiGokuSuit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("Akatsuki Outfit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/AkatsukiOutfit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "you bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("Tuxedo")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/Tuxedo/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return

								if("Space Suit")
									if(usr.inven_min>=usr.inven_max)
										usr<<"You have no space in your inventory."
										usr.talking=0
										return
									var/obj/Equipment/Suits/SpaceSuit/O = new
									if(usr.zenni >= O.value)
										usr.zenni -= O.value
										usr << "You bought [O] for [applycommas(O.value)] zenni!"
										usr.contents += O
										O.value*=0.1
										O.weight=0
										usr.talking=0

										usr << "<font color = white>Shop Keeper:</font> Thanks for buying!"
										return
									else
										usr << "<font color = white>Shop Keeper:</font> You need [applycommas(O.value)] zenni!"
										usr.talking=0
										return



								if("Never Mind")
									usr.talking=0
									return