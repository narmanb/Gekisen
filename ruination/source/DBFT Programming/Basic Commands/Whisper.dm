mob/PC
	verb
		Whisper()
			set category = "Channels"
			src.afktime=0
			if(src.playerwatch==1)
				PlayerWatch(src,"Whisper")
			if(VoteMute.Find(src.key))
				src << "You have been muted!"
				return
			if(channelmute!="")
				src<<"All chat channels have been muted."
				return
			var/list/L
			L = list("font size")
			var/varPeople = list()
			for(var/mob/PC/M in player)
				if(M.client)
					if(M.wisper_on)
						varPeople += M
			var/varTo = input("Who would you like to Whisper?","Whisper") in varPeople + list("Cancel")
			if(varTo == "Cancel")
				src.opendialog=0
				return
			var/varSay = input("What would you like to say to [varTo]?","Whisper") as text|null
			src.CheckChatSpam(varSay)
			if(src.muted)
				src << "You have been muted!"
				src.opendialog=0
				return

			if(World_Mute == 1 && src.GMLevel <= 0)
				src << "The World is Muted!"
				src.opendialog=0
				return
			for(var/X in L)
				if(findtext(varSay,X))
					alert("You may not change your font size.")
					src.opendialog=0
					return
			if(!varSay)
				ChatLog(src,"Wisper: [varSay]")
				src.opendialog=0
				return

			if(varTo:wisper_on)
				src << "<font color = purple>To [varTo:name]: [varSay]"
		//		for(var/mob/PC/M in player)
		//			if(M.hearall)
		//				M << "Hearall <font color = #F819F5>(GM) <font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
			else
				src<<"<font color = purple>[varTo:name]'s whispers are OFF."
			if(src.GMLevel > 0)
				varTo << "<font color = #F819F5>(GM) <font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
				for(var/mob/PC/M in player)
					if(M.hearall)
						M << "Hearall <font color = green><font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
			else
				if(varTo:wisper_on)
					varTo << "<font color = #F819F5><font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
					for(var/mob/PC/M in player)
						if(M.hearall)
							M << "Hearall <font color = green><font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]"
				else
					src<<"<font color = purple>[varTo:name]'s whisper are OFF."
			src.opendialog=0




