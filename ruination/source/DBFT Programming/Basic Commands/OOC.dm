var/smiley/S=new
mob/PC
	verb
		OOC(T as text)
			set category = "Channels"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"OOC")
	/*		if(VoteMute.Find(src.key))
				src << "You have been muted!"
				return
			if(AFK_SYS)
				if(src.GMLevel <= 1)
					if(!src.checked_in)
						src.checked_in = 1
						src << "\white You have checked into the AFK Check"
						return
			if(lentext(T)>3)
				src.afktime=0
			src.CheckChatSpam(T)
			src.CheckChatSpamTwo()*/
			if(channelmute!="")
				src<<"All chat channels have been muted."
				return
			if(src.muted)
				src << "You have been muted!"
				return
			if(src.jailed)
				src << "You can't use OOC whilst muted!"
				return
			if(World_Mute&&!src.GMLevel)
				src << "The World is Muted!"
				return
			if(src.oocmute)
				src << "You have been muted!"
				return
			if(src.say_delay >= 3)
				if(!src.GMLevel)
					player <<"<font color = blue>Dragon AI:</font> \white [src.name] has been Automatically Muted for 30 Second for Spamming."
					src.say_delay = 0
					src.oocmute = 1
					spawn(300) src.oocmute = 0
					return
				else
					return
			if(Check_For_Profanity(T,PROFANITY) == TRUE)
				if(!src.GMLevel)
					player <<"<font color = blue>Dragon AI:</font> \white [src.name] has been Automatically Muted for 30 Second for using Profanity."
					src.oocmute = 1
					spawn(300) src.oocmute = 0
					return
				else
					return
			if(!T)
				ChatLog(src,"OOC: [T]")
				return
			T = html_encode(T)
			if(lentext(T) > 300)
				if(!src.GMLevel)
					ChatLog(src,"OOC: [T]")
					src<<"<font color = red><b>Your message can not exceed 300 characters</b><br>Your message: <i>[T]</i>"
					T=copytext(T,1,300)
			if(Check_For_Spam(T,SPAM) == TRUE)
				src<<"Please do not use linebreak characters."
				return
			//T = S.ParseHTML(T)
		//	T=S.ParseHTML(T)
			for(var/mob/PC/M in player)
				if(!src.GMLevel)
					if(M.ooc_on)
						if(src.in_guild)
							M << {"<b><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.guild_name]<b><font color=#6E6E6F>}{[src.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[textcolorname][src.name]<font color = white> OOC: [textcolor]<font size = 1>[T]"}
						else
							if(!src.in_guild)
								M << {"<b><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.title]}<font color = white>[textcolorname][src.name]<font color = white> OOC: [textcolor]<font size = 1>[T]"}
				else
					if(src.in_guild)
						M << {"<b><font color=#4286f4>(GM:[src.GMLevel])</font><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.guild_name]<b><font color=#6E6E6F>}{[src.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[textcolorname][src.name]<font color = white> OOC: [textcolor]<font size = 1>[T]"}
					else
						if(!src.in_guild)
							M << {"<b><font color=#4286f4>(GM:[src.GMLevel])</font><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.title]}<font color = white>[textcolorname][src.name]<font color = white> OOC: [textcolor]<font size = 1>[T]"}
		//	for(var/mob/PGC/M in player)
		//		if(M.hearall)
		//			if(src.in_guild)
		//				M << "Hearall {<b><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.guild_name]<b><font color=#6E6E6F>}{[src.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[src.name] OOC: [textcolor]<font size = 1>[T]"
		//			else
		//				M << "Hearall {<b><font color=red>([src.rank])<b><font color=#6E6E6F>{[src.title]}<font color = white>[src.name] OOC: [textcolor]<font size = 1>[T]"
			src.say_delay += 1
			src.afktime = 0
			sleep(10)
			src.say_delay -= 1
