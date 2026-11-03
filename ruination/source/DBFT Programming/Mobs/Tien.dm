
mob
	NPC
		Tien
		//	icon = 'NPCs - New.dmi'
		//	icon_state = "Tien"
			icon = 'tien.dmi'
			name = "Tien"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 8876976
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(3)
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Tien")
					if(usr.level>=7500&&!usr.learn_solarflare)
						usr.learn_solarflare=1
						usr.contents+=new/obj/Technique/SolarFlare
						usr<<"<center>\white .: You learn Solar Flare :."
						usr.talking=0
						return
					if(usr.level>=15000&&!usr.learn_splitform)
						usr.learn_splitform=1
						usr.contents+=new/obj/Technique/SplitForm
						usr<<"<center>\white .: You learn Split Form :."
						usr.talking=0
						return
			//		if(usr.race=="Human")
					if(usr.level>=25000&&!usr.learn_tribeam)
						usr.learn_tribeam=1
						usr.contents+=new/obj/Technique/TriBeam
						usr<<"<center>\white .: You learn Tri Beam :."
						usr.talking=0
						return
					if(usr.level<7500)
						usr<<"\white Tien:\font Get to level 7,500 and I'll teach you something."
						return
					if(usr.level<15000)
						usr<<"\white Tien:\font Get to level 15,000 and I'll teach you something."
						return
			//		if(usr.race=="Human")
					if(usr.level<25000)
						usr<<"\white Tien:\font Get to level 25,000 and I'll teach you something."
						return
				Set_Spawn_Point()
					set src in oview(1)
					set category=null
					switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
						if("Yes")
							usr.spawn_point = "Tien"
						else
							return