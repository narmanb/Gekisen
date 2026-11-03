mob
	NPC
		Vegeta
			name = "Vegeta"
			icon_state = "Vegeta"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 5484956
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Vegeta")
					spawn(30)usr.talking=0
					if(usr.level>=20000&&!usr.learn_galickgun)
						usr.learn_galickgun=1
						usr.contents+=new/obj/Technique/GalickGun
						usr<<"<center>\white .:: You learn Galick Gun ::."
						return
					if(usr.race=="Saiyan")
						if(usr.level>=32000&&!usr.learn_finalflash)
							usr.learn_finalflash=1
							usr.contents+=new/obj/Technique/FinalFlash
							usr<<"<center>\white .:: You learn Final Flash ::."
							return
						if(usr.level>=40000&&!usr.learn_bigbangattack)
							usr.learn_bigbangattack=1
							usr.contents+=new/obj/Technique/BigBangAttack
							usr<<"<center>\white .:: You learn Big Bang Attack ::."
							return
						if(usr.gene == "Prideful")
							if(usr.level>=40000&&!usr.learn_finalshine)
								usr.learn_finalshine=1
								usr.contents+=new/obj/Technique/FinalShine
								usr<<"<center>\white .:: You learn Final Shine ::."
								return
					if(usr.level<15000)
						usr<<"\white Vegeta:\font Get to level 15,000 and I'll teach you something."
						return
					if(usr.race=="Saiyan")
						if(usr.level<32000)
							usr<<"\white Vegeta:\font Get to level 27,500 and I'll teach you something."
							return
						if(usr.level<40000)
							usr<<"\white Vegeta:\font Get to level 40,000 and I'll teach you something."
							return
						if(usr.gene == "Prideful")
							if(usr.level<40000)
								usr<<"\white Vegeta:\font Get to level 40,000 and I'll teach you something."
								return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Vegeta"
						else
							return