obj/CityObjects
	density = 1
	ATM1
		icon = 'seshicons.dmi'
		icon_state = "ATM"
		verb/Use_ATM()
			set src in view()
			set category = null
			usr.UseATM()
	ATM2
		icon = 'seshicons.dmi'
		icon_state = "ATM2"
		verb/Use_ATM()
			set src in view()
			set category = null
			usr.UseATM()
		//	..()
		/*
		verb/Use_ATM()
			set src in oview(2)
			set category="ATM"
			spawn(30)usr.talking=0
			usr.talking = 1
			switch(input("You are at an ATM, what would you like to do?")in list("Deposit","Withdrawl","Nothing"))
				if("Cancel")
					usr.talking=0
					return
				if("Deposit")
					if(usr.zenni<1)
						usr << "<font color = white>ATM ERROR:</font> You don't have any zenni!"
						usr.talking=0
						return
					var/deposit = input("How much do you wish to Deposit?")as num
					if(deposit>usr.zenni)
						deposit=usr.zenni
					if(deposit <= 0)
						usr.talking = 0
						return
					else
						usr.zenni -= round(deposit)
						usr.banked_zenni += round(deposit)
						usr.talking = 0
						usr << "<font color = white>ATM:</font> [applycommas(deposit)] has been successfully transfered into your Account!"
						return
				if("Withdrawl")
					if(usr.banked_zenni<1)
						usr << "<font color = white>ATM ERROR:</font> You don't have any zenni in your account!"
						usr.talking=0
						return
					var/withdrawl = input("How much do you wish to Withdraw?")as num
					if(withdrawl > usr.banked_zenni)
						withdrawl=usr.banked_zenni
					if(withdrawl<=0)
						usr.talking=0
						return
					else
						usr.banked_zenni -= round(withdrawl)
						usr.zenni += round(withdrawl)
						usr.talking = 0
						usr << "<font color = white>ATM:</font> [applycommas(withdrawl)] has been successfully withdrawn from your Account!"
						return
*/




	GateLeft
		icon = 'seshicons.dmi'
		icon_state = "gatel"
	GateMiddle
		icon = 'seshicons.dmi'
		icon_state = "gatem"
	GateRight
		icon = 'seshicons.dmi'
		icon_state = "gater"

	Hetap
		Hetap_Vending
			name = "Hetap Machine"
			icon = 'hetapmachine.dmi'
			density = 1
			Top
				icon_state = "cmachine_top"
				name = "Hetap Machine"
			Bttom
				icon_state = "cmachine_bottom"
				name = "Hetap Machine"
				verb/Use()
					set src in view()
					set category = null
					if(usr.talking) return
					usr.talking = 1
					switch(input("Feeling thirsty?")in list("Bottle of Hetap - 10 million Zenni","Orange Hetap - 50 million Zenni","Cancel"))
						if("Cancel")
						if("Orange Hetap - 50 million Zenni")
							usr << "Orange Hetap! Currently out of stock!"
							usr.talking = 0
							return
						if("Bottle of Hetap - 10 million Zenni")
							if(usr.CheckInventory()==TRUE)
								usr << "You have no room in your inventory"
								usr.talking=0
								return
							if(usr.zenni < 10000000)
								usr << "You don't have 10 million zenni!"
								usr.talking = 0
								return
							usr << "<b>You bought a bottle of Hetap!</b><br><i>When consumed it heals you completely and increases your current stats above the normal maximum</i>"
							usr.contents += new/obj/Equipment/Consumable/Hetap
							usr.zenni -= 10000000
							usr.talking = 0


			Sign
				name = "Hetap Sign"
				icon = 'HetapSign2.dmi'
				SignPart
					layer = MOB_LAYER+1
					icon_state = "sign"
				SignShadow
					icon_state = "shadow"
					density = 0



	FOUNTAINNEW
		icon = 'Fountain2.dmi'
		density = 1
		fountaincalm/icon_state = "1"
		fountainwater/icon_state = "2"
		fountaindish/icon_state = "3"
		fountainpump/icon_state = "4"


	MAJOR_FOUNTAIN
		icon = 'hfountain.dmi'
		density = 1
		foun1/icon_state = "foun1"
		foun2/icon_state = "foun2"
		foun3/icon_state = "foun3"
		foun4/icon_state = "foun4"
		foun5/icon_state = "foun5"
		foun6/icon_state = "foun6"
		foun7/icon_state = "foun7"
		foun8/icon_state = "foun8"
		foun9/icon_state = "foun9"
		foun10/icon_state = "foun10"
		foun11/icon_state = "foun11"
		foun12/icon_state = "foun12"











//atom/var/group_name = ""
obj/var/group_name = ""
mob/var/objhp=0
mob/Destroyable
	VAULT
		icon = 'seshicons.dmi'
		icon_state = "vault"
		density = 1
		opacity = 1
		isgravmachine=1
		objhp = 8

		//var
		Enter(mob/PC/M)
			if(istype(M,/mob/PC))
				//M.powerlevel=0
				//M.DeathCheck()
				//M<<"Wrong Turn, be careful of entering the void zone, its a dangerous place to go"
				return
			else
				return

		// create the vis object for each roof instance and
		// make it a member of its specified visiblity group
	//	Enter(mob/PC/M)
	//		if(istype(M,/mob/PC))
	//			return
	//		if(!M.density)
	//			return 0


/*
obj
	proc
		showvault()

			world << "showvault proc"
			src.vis.can_see("VAULTOBJ")

		hidevault()
			world << "hidevault proc"
			src.vis.cant_see("VAULTOBJ")
			*/




mob
	proc
		UseATM()
			spawn(30)src.talking=0
			src.talking = 1
			switch(input("You are at an ATM, what would you like to do?")in list("Deposit","Withdrawl","Nothing"))
				if("Cancel")
					src.talking=0
					return
				if("Deposit")
					if(src.zenni<1)
						src << "<font color = white>ATM ERROR:</font> You don't have any zenni!"
						src.talking=0
						return
					var/deposit = input("How much do you wish to Deposit?")as num
					if(deposit>src.zenni)
						deposit=src.zenni
					if(deposit <= 0)
						src.talking = 0
						return
					else
						src.zenni -= round(deposit)
						src.banked_zenni += round(deposit)
						src.talking = 0
						src << "<font color = white>ATM:</font> [applycommas(deposit)] has been successfully transfered into your Account!"
						return
				if("Withdrawl")
					if(src.banked_zenni<1)
						src << "<font color = white>ATM ERROR:</font> You don't have any zenni in your account!"
						src.talking=0
						return
					var/withdrawl = input("How much do you wish to Withdraw?")as num
					if(withdrawl > src.banked_zenni)
						withdrawl=src.banked_zenni
					if(withdrawl<=0)
						src.talking=0
						return
					else
						src.banked_zenni -= round(withdrawl)
						src.zenni += round(withdrawl)
						src.talking = 0
						src << "<font color = white>ATM:</font> [applycommas(withdrawl)] has been successfully withdrawn from your Account!"
						return