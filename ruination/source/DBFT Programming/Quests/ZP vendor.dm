mob/var
	zpvkills = 0
	zpvmode = 0
	zpvinventory = 0
	/*
	questpoints = 0
	questpointreward1=0
	questpointreward2=0
	questpointreward3=0
	questpointreward4=0
	questpointreward5=0
	questpointreward6=0
	questpointrewardCell=0
	*/


	//questpointrewards = list("Reward1","Reward2","Reward3","Reward4")
mob/NPC
	ZPVendor
		name = "ZP Vendor"
		icon = 'seshicons.dmi'
		icon_state = "Danny"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 753153622472
		New()
			..()
			src.CreateName()

		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to ZP vendor")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			usr.frozen = 1
		//	spawn(60)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor</white> Hello!</b><br><font color = yellow>Use your zp for special bonuses!"
			usr << "<font color = green><B> You current have [applycommas(usr.zp)] Z Points!"
	//	/	sleep(3)

			switch(input("You have [applycommas(usr.zp)] Z Points","Exchange Z Points?") in list("Yes","No"))
				if("No")
					usr.talking=0
					usr.frozen=0
				if("Yes")
					var/list/menu = list()

					if(usr.zpvkills == 0)
						menu += "+1 Kill per mob for 5000 kills (50 ZP)"

					if(usr.zpvmode == 0)
						menu += "Training Mode + 1 (100 ZP)"
					if(usr.zpvmode == 1)
						menu += "Training Mode + 1 (500 ZP)"
					if(usr.zpvmode == 2)
						menu += "Training Mode + 1 (1,000 ZP)"

					if(usr.zpvinventory == 0)
						menu += "Inventory Space + 25 (10 ZP)"
					menu += "Exchange for stat bonus"
					menu += "Cancel"
					var/gainedwhat = ""
					switch(input("What would you like to exchange z points for?") in menu)
						if("Cancel")
							usr.talking = 0
							usr.frozen = 0
							return
						if("Exchange for stat bonus")
							var/withdrawl = input("How much do you wish to exchange? 1 ZP = 500 stat bonus")as num
							if(withdrawl > usr.zp)
								usr << "You don't have that much ZP!"
								usr.talking = 0
								usr.frozen = 0
								return
							if(withdrawl<=0)
								usr.talking=0
								usr.frozen = 0
								return

							usr.banked_zenni -= round(withdrawl)
							usr.zenni += round(withdrawl)
							var/gain = withdrawl * 500
							usr.ki_bonus += gain
							usr.strength_bonus += gain
							usr.defence_bonus += gain
							usr.talking = 0
							usr.frozen = 0
							usr.zp -= withdrawl
							usr.zpu += withdrawl
							usr << "<font color = green><b>You added [applycommas(gain)] to all of your stat bonuses!"
							return


						if("Inventory Space + 25 (10 ZP)")
							if(usr.zp < 10)
								usr.needzp(10)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor: </white><font color = green>Inventory space + 25!"
							usr.inven_max += 25
							usr.zpvinventory += 1
							usr.zp -= 10
							usr.zpu += 10

							//usr.questpointreward4++
						if("+1 Kill per mob for 5000 kills (50 ZP)")
							if(usr.zp < 50)
								usr.needzp(50)
								return
						//	usr.questpointreward1 = 1
							usr.zpvkills = 5000
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor: </white><font color = green>You will get an extra kill for the next 5,000 kills!"
							usr.zp -= 50
							usr.zpu += 50


						if("Training Mode + 1 (100 ZP)")
							if(usr.zp < 100)
								usr.needzp(100)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.zpvmode = 1
							usr.zp -= 100
							usr.zpu += 100


						if("Training Mode + 1 (500 ZP)")
							if(usr.zp < 500)
								usr.needzp(500)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor: </white><font color = green>You increased your mode by 1!"
							//gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.zpvmode = 2
							usr.zp -= 500
							usr.zpu += 500

						if("Training Mode + 1 (1,000 ZP)")
							if(usr.zp < 1000)
								usr.needzp(1000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> ZP Vendor: </white><font color = green>You increased your mode by 1!"
							//gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.zpvmode = 3
							usr.zp -= 1000
							usr.zpu += 1000

					usr << "[gainedwhat]"
					usr.frozen = 0
					usr.talking = 0
mob/proc/needzp(n as num)
	var/mp = n - src.zp
	src << "You need [applycommas(mp)] more points for that!"
	src.talking = 0
	src.frozen = 0

		/*
				var/list/menu = list(
		if(src.powerlevel_max >= 1000000) menu += "Form 1"
		if(src.powerlevel_max >= 2000000 && trans_lvl < 25) menu += "Form 2"
		if(src.powerlevel_max >= 2000000 && src.trans_lvl >= 25) menu += "Form 3"
		if(src.powerlevel_max >= 25000000) menu += "Form 4"
		if(src.powerlevel_max >= 50000000) menu += "Form 5"

		menu += "Cancel"
		switch(input("Which form would you like to transform to?") in menu)
			if("Form 1")
				var/fn = 1
				src.HalfSaiyanMysticTrain(fn)
			if("Form 2")
				var/fn = 2
				src.HalfSaiyanMysticTrain(fn)
			if("Form 3")
				var/fn = 3
				src.HalfSaiyanMysticTrain(fn)
			if("Form 4")
				var/fn = 4
				src.HalfSaiyanMysticTrain(fn)
			if("Form 5")
				var/fn = 5
				src.HalfSaiyanMysticTrain(fn)
			if("Cancel")
				src.transformed = 0*/