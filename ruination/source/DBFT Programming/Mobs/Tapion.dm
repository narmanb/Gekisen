mob/var/tmp/playing = 0
mob/var/tapionquest1=0
mob/var/tapionquest2=0
mob/NPC/Tapion
	icon = 'NPCs - New.dmi'
	icon_state = "Tapion"
	name = "Tapion"
	density = 1
	safe = 1
	frozen = 1
	energy_code = 4625695
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Tapion")
		if(usr.talking)
			return
		spawn(30)usr.talking=0
		usr.talking=1
		if(usr.race!="Konat")
			if(usr.playing)
				usr << "<font color = white>Tapion:</font> Sorry i only have Quests for Konats"
				usr.talking=0
				return
			else
				usr.talking=0
				usr.playing = 1
				usr << "<font color = white>Tapion:</font> Sorry i only have Quests for Konats"
				sleep(15)
				if(!usr)return
				usr<<sound('Tapion.mid')
				usr << "<font color = white>Tapion's starts playing a soft melody..."
				if(usr.powerlevel<usr.powerlevel_max)
					usr.powerlevel=usr.powerlevel_max
				if(usr.staminaleft>0)
					usr.staminaleft=0
				spawn(3000)
					if(!usr)return
					usr.playing = 0
		else
			if(!usr.tapionquest1)
				switch(alert("Hello [usr]. I have something that might interest you. Long ago, me and my brother were locked \
				away into a Magic Box. That box holds tremendous power inside that only the right person can set free. [usr], \
				do you think you have what it takes?","","Yes","Not yet"))
					if("Yes")
						usr.talking=0
						if(usr.inven_min<usr.inven_max)
							usr.tapionquest1=1
							usr.contents+=new/obj/Equipment/MagicBox
							usr.inven_min += 1
							usr << "<font color = white>Tapion:</font> I believe in you."
						else
							usr << "<font color = white>Tapion:</font> You have no space in your inventory."
							return
					else
						usr.talking=0
						return
			else
				if(!usr.tapionquest2)
					if(usr.level<18000)
						usr << "<font color = white>Tapion:</font> Get to Level 18,000 and I will tell you a story."
						usr.talking=0
						return
					switch(alert("Remember when I told you about the story of the Magic Box? I did not tell you about the reason \
					for us to be locked inside. But now the time is right. A wicked man created an evil creature which feeds it's \
					neverending hunger on peoples fear. That creature could not be stopped. So me and my brother, had to lock \
					ourselfs into the Box, along with the creature. But now..the creature is free again, and it's terrorizing \
					everyone on this planet. [usr], as a last request, could you stop the monster, for everyones sake?","","Yes","No"))
						if("No")
							usr.talking=0
							return
						if("Yes")
							usr.talking=0
							if(usr.inven_min<usr.inven_max)
								usr.tapionquest2=1
								usr.contents+=new/obj/Equipment/LegendarySword
								usr << "<font color = white>Tapion:</font> Take this sword. It's a Legendary Sword made for only one reason: To slay the monster."
							else
								usr << "<font color = white>Tapion:</font> You have no space in your inventory."
								return
				else
					usr.talking=0
					usr << "<font color = white>Tapion:</font> Thank you [usr]."
					return