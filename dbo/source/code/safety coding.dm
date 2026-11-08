proc/doublekeycheck()
	seckeylist = ""
	for(var/mob/gamer in world)
		for(var/mob/gamer2 in world)
			if(gamer.client && gamer2.client && gamer != gamer2)
				if(gamer.client.address == gamer2.client.address)
					gamer.seckey = "[gamer2.key]"
					gamer2.seckey = "[gamer.key]"
					seckeylist += "[gamer2] ([gamer2.key]) - [gamer] ([gamer.key]) - [gamer2.client.address]\n"
				else continue
			else continue