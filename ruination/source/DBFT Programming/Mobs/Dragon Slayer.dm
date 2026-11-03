mob/var/dragonkills = 0
mob/var/dragon_slayer_start = 0
mob/var/dragon_slayer_complete = 0

mob/NPC/Dragon_Slayer
	icon_state = "Dragon Slayer"
	name = "Dragon Slayer"
	density = 1
	safe = 1
	it_blocked = 1
	energy_code = 4956437
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(8)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to DraGON sLAYER")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			if(usr.fused)
				return
			spawn(30)usr.talking=0
			usr.talking = 1
			if(!usr.dragon_slayer_start)
				usr << "<font color = white>Dragon Slayer:</font> I'm really getting sick of all these Dragons roaming around. Hmm...."
				sleep(5)
				usr << "<font color = white>Dragon Slayer:</font> Do me a favor. Slay 20 of these damn Dragons and I will give you a nice reward."
				sleep(15)
				if(!usr)return
				switch(alert("Slay the Dragons?","Quest: Dragon Slayer","Yes","Not Yet"))
					if("Yes")
						usr.dragon_slayer_start = 1
						usr.talking = 0
						usr << "<font color = white>Dragon Slayer:</font> Outstanding! Kill the Dragons!"
					else
						usr << "<font color = white>Dragon Slayer:</font> Dammit. Guess I better get back to work then."
						usr.talking = 0
						return
			else
				if(!usr.dragon_slayer_complete)
					if(usr.dragonkills >= 20)
						usr << "<font color = white>Dragon Slayer:</font> Wow. I honestly didn't think you would be sucessful.... Well then, as promised, Heres a Massive Zenni Shard I found one of the Dragons had."
						usr.dragon_slayer_complete = 1
						var/obj/Equipment/Buff_Items/PMZ_Shard/O = new
						O.Move(usr)
						usr.talking = 0
					else
						usr << "<font color = white>Dragon Slayer:</font> You still aren't ready, keep Training!"
						usr.talking = 0
						return