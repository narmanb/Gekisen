mob/NPC/

	Dungeon
		name = "Dungeon Master"
		icon= 'Races.dmi'
		icon_state = "Bardock"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 6665555
		New()
			..()
			src.CreateName()
		verb
			Talk()
				set src in oview(8)
				set category = null
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Talked to Dungeon Master")
				if(usr.talking)
					usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
					return
				spawn(50)usr.talking=0
				usr.talking=1
				switch(alert("Would you like to enter the mysterious dungeon??","Dungeon","Yes","No"))
					if("Yes")
						var/Quest=input({"The dungeon is a dangerous place so i will allow your friends to come along
to get your friend to come with you, have them stand on the tiles to your sides
i will then transport them to the dungeon with you"},"Dungeon","I'm Ready","Not Yet")
						if(Quest=="I'm Ready")
							for(var/turf/dungeon/D in view(12))
								for(var/mob/PC/M in player)
									if(M==D.player)
										M.loc= locate(x,y,z)