mob
	NPC
		Trunks
			name = "Trunks"
			icon_state="Trunks"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 7854849
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Trunks")
					if(usr.level>=25000&&!usr.learn_finishbuster)
						usr.learn_finishbuster=1
						usr.contents+=new/obj/Technique/FinishBuster
						usr<<"<center>\white .:: You learn Finish Buster ::."
						return
					if(usr.level<25000)
						usr<<"\white Trunks:\font Get to level 25,000 and I'll teach you something."
						return
					if(usr.race=="Half Saiyan")
						if(usr.level>=40000&&!usr.learn_burningattack)
							usr.learn_burningattack=1
							usr.contents+=new/obj/Technique/BurningAttack
							usr<<"<center>\white .:: You learn Burning Attack ::."
							return
						if(usr.level<40000)
							usr<<"\white Trunks:\font Get to level 40 000 and I'll teach you something."
							return
					else
						usr<<"\white Trunks:\font How are you doing?"
						return