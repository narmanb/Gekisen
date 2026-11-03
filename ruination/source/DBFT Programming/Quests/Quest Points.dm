mob/var
	questpoints = 0
	questpointreward1=0
	questpointreward2=0
	questpointreward3=0
	questpointreward4=0
	questpointreward5=0
	questpointreward6=0
	questpointrewardCell=0


	//questpointrewards = list("Reward1","Reward2","Reward3","Reward4")
mob/NPC
	Quester
		name = "Quester"
		icon = 'MISCMOBS.dmi'
		icon_state = "questpoints"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 356153622472
		New()
			..()
			src.CreateName()

		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Quest Points")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			usr.frozen = 1
		//	spawn(60)usr.talking=0
			usr << "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC</white> Hello!</b><br>Quest points are gained by completing certain quests and other objectives.<br><font color = red>Inside this building, there are dangerous creatures who are multiplying faster than we can handle. For each one of these creatures you kill, you will gain at least 1 point.<br><font color = yellow>You can exchange quest points here for certain one time rewards!"
			usr << "<font color = green><B> You current have [applycommas(usr.questpoints)] Quest Points!"
			sleep(3)

			switch(input("You have [applycommas(usr.questpoints)] Quest Points","Exchange Quest Points?") in list("Yes","No"))
				if("No")
					usr.talking=0
					usr.frozen=0
				if("Yes")
					var/list/menu = list()
				//	if(usr.questpointreward1 == 0)
				//		menu += "ZP + 50 (1,000 points)"
				//	if(usr.questpointreward1 == 1)
				//		menu += "ZP + 100 (2,000 points)"
				//	if(usr.questpointreward1 == 2)
				//		menu += "ZP + 150 (5,000 points)"
				//	if(usr.questpointreward1 == 3)
				//		menu += "ZP + 200 (10,000 points)"
				//	if(usr.questpointreward1 >= 4 && usr.questpointreward1 < 8)
				//		menu += "ZP + 50 (10,000 points)"
				//	if(usr.questpointreward1 >= 8)
				//		menu += "ZP + 50 (50,000 points)"
					if(usr.questpointreward2 == 0)
						menu += "TP + 10,000 (1,000 points)"
					if(usr.questpointreward2 == 1)
						menu += "TP + 50,000 (5,000 points)"
					if(usr.questpointreward2 == 2)
						menu += "TP + 100,000 (10,000 points)"
					if(usr.questpointreward2 == 3)
						menu += "TP + 250,000 (25,000 points)"
					if(usr.questpointreward3 == 0)
						menu += "Training Mode + 1 (10,000 points)"
					if(usr.questpointreward3 == 1)
						menu += "Training Mode + 1 (20,000 points)"
					if(usr.questpointreward3 == 2)
						menu += "Training Mode + 1 (30,000 points)"
					if(usr.questpointrewardCell == 0)
						menu += "Exploding Cell Jr Zone (5,000 points)"

					if(usr.questpointreward4 < 2)
						menu += "Inventory Space + 25 (5,000 points)"
					var/s=locate(/obj/Equipment/Suits/SupermanSuit/) in usr.contents
					if(!s)
						menu += "Superman Suit (2,000 points)"

					var/s1=locate(/obj/Equipment/Dragon_Sword/) in usr.contents
					if(!s1)
						menu += "Dragon Sword (5,000 points)"

					var/s2=locate(/obj/Equipment/Dual_Swords/) in usr.contents
					if(!s2)
						menu += "Dual Swords (5,000 points)"

					var/s3=locate(/obj/Equipment/Suits/GokuBlackSuit/) in usr.contents
					if(!s3)
						menu += "Goku Black Suit (10,000 points)"

					var/s4=locate(/obj/Equipment/Suits/Videl_Saiyaman_Suit/) in usr.contents
					if(!s4)
						menu += "Videl Saiyaman Suit (10,000 points)"

					var/s5=locate(/obj/Equipment/Suits/GreenLanternSuit/) in usr.contents
					if(!s5)
						menu += "Green Lantern Suit (10,000 points)"

					var/s6=locate(/obj/Equipment/Suits/Saitama_Suit/) in usr.contents
					if(!s6)
						menu += "Saitama Suit (20,000 points)"
					menu += "Custom Color Scouter (2,500 points)"





					menu += "Cancel"
					var/gainedwhat = ""
					switch(input("What would you like to exchange quest points for?") in menu)
						if("Cancel")
							usr.talking = 0
							usr.frozen = 0
							return
						if("Inventory Space + 25 (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>Inventory space + 25!"
							usr.inven_max += 25
							usr.questpoints -= 5000
							usr.questpointreward4++
						if("ZP + 50 (1,000 points)")
							if(usr.questpoints < 1000)
								usr.needpoints(1000)
								return
							usr.questpointreward1 = 1
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 50 zp!"
							usr.zp += 50
							usr.questpoints -= 1000
						if("ZP + 100 (2,000 points)")
							if(usr.questpoints < 2000)
								usr.needpoints(2000)
								return
							usr.questpointreward1 = 2
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 100 zp!"
							usr.zp += 100
							usr.questpoints -= 2000
						if("ZP + 150 (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							usr.questpointreward1 = 3
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 150 zp!"
							usr.zp += 150
							usr.questpoints -= 5000


						if("ZP + 200 (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							usr.questpointreward1 = 4
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 200 zp!"
							usr.zp += 200
							usr.questpoints -= 10000

						if("ZP + 50 (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 50 zp!"
							usr.zp += 50
							usr.questpoints -= 10000
							usr.questpointreward1 += 1
						if("ZP + 50 (50,000 points)")
							if(usr.questpoints < 50000)
								usr.needpoints(50000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 50 zp!"
							usr.zp += 50
							usr.questpoints -= 50000
							usr.questpointreward1 += 1

						if("TP + 10,000 (1,000 points)")
							if(usr.questpoints < 1000)
								usr.needpoints(1000)
								return
							usr.questpointreward2 = 1
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 10,000 tp!"
							usr.tp += 10000
							usr.questpoints -= 1000

						if("TP + 50,000 (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							usr.questpointreward2 = 2
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 50,000 tp!"
							usr.tp += 50000
							usr.questpoints -= 5000
						if("TP + 100,000 (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							usr.questpointreward2 = 3
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 100,000 tp!"
							usr.tp += 100000
							usr.questpoints -= 10000
						if("TP + 250,000 (25,000 points)")
							if(usr.questpoints < 25000)
								usr.needpoints(25000)
								return
							usr.questpointreward2 = 4
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You have gained 250,000 tp!"
							usr.tp += 250000
							usr.questpoints -= 25000
						if("Superman Suit (2,000 points)")
							if(usr.questpoints < 2000)
								usr.needpoints(2000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got a Superman suit!"
							var/obj/Equipment/Suits/SupermanSuit/O = new
							usr.contents += O
							usr.questpoints -= 2000


						if("Dragon Sword (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got the Dragon Sword!"
							var/obj/Equipment/Dragon_Sword/O = new
							usr.contents += O
							usr.questpoints -= 5000

						if("Dual Swords (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got Dual Swords!"
							var/obj/Equipment/Dual_Swords/O = new
							usr.contents += O
							usr.questpoints -= 5000

						if("Goku Black Suit (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got Goku Black Suit!"
							var/obj/Equipment/Suits/GokuBlackSuit/O = new
							usr.contents += O
							usr.questpoints -= 10000



						if("Videl Saiyaman Suit (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got Videl Saiyaman Suit!"
							var/obj/Equipment/Suits/Videl_Saiyaman_Suit/O = new
							usr.contents += O
							usr.questpoints -= 10000


						if("Green Lantern Suit (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got Green Lantern Suit!"
							var/obj/Equipment/Suits/GreenLanternSuit/O = new
							usr.contents += O
							usr.questpoints -= 10000


						if("Saitama Suit (20,000 points)")
							if(usr.questpoints < 20000)
								usr.needpoints(20000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got Saitama Suit!"
							var/obj/Equipment/Suits/Saitama_Suit/O = new
							usr.contents += O
							usr.questpoints -= 20000

						if("Custom Color Scouter (2,500 points)")
							if(usr.questpoints < 2500)
								usr.needpoints(2500)
								return
							var/color=input("Choose scouter color") as color
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You got a custom scouter!"
							var/obj/Equipment/Scouter/O = new
							O.name = "Custom Scouter"
							O.icon = 'BkScouter2.dmi'

							//O += color
							O.icon += color
							usr.contents += O
							usr.questpoints -= 2500
/*
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
			*/

						if("Training Mode + 1 (10,000 points)")
							if(usr.questpoints < 10000)
								usr.needpoints(10000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.questpointreward3 = 1
							usr.questpoints -= 10000

						if("Training Mode + 1 (20,000 points)")
							if(usr.questpoints < 20000)
								usr.needpoints(20000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.questpointreward3 = 2
							usr.questpoints -= 20000

						if("Training Mode + 1 (30,000 points)")
							if(usr.questpoints < 30000)
								usr.needpoints(30000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>You increased your mode by 1!"
							usr.moden += 1
							usr.questpointreward3 = 3
							usr.questpoints -= 30000

						if("Exploding Cell Jr Zone (5,000 points)")
							if(usr.questpoints < 5000)
								usr.needpoints(5000)
								return
							gainedwhat = "<font color = white><b><BIG>\icon[src]</BIG> Quest Points NPC: </white><font color = green>Here is a key to enter the forbidden Exploding Cell Jr zone. Be careful"
							usr.questpointrewardCell = 1
							usr.questpoints -= 5000
					usr << "[gainedwhat]"
					usr.frozen = 0
					usr.talking = 0
mob/proc/needpoints(n as num)
	var/mp = n - src.questpoints
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