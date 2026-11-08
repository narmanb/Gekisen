mob/PC
	verb
		Say(T as text)
			set category = "Channels"
			if(src.playerwatch==1)
				PlayerWatch(usr,"Say")
			if(VoteMute.Find(src.key))
				src << "You have been muted!"
				return
			src.CheckChatSpam(T)
			if(channelmute=="All")
				src<<"All chat channels have been muted."
				return
			if(src.saymute)
				src << "You have been muted for Flood Supression"
				return
			if(src.muted && src.GMLevel <= 0)
				src << "You have been muted!"
				return
			if(src.say_delay >= 3)
				src.saymute = 1
				spawn(50) src.saymute = 0
				usr<<"You must wait 5 seconds before using Say again."
				return
			if(!T)
				ChatLog(src,"Say: [T]")
				return
			if(Check_For_Spam(T,SPAM) == TRUE)
				src<<"Please do not use linebreak characters."
				return
			T = html_encode(T)
			if(lentext(T) > 250)
				ChatLog(src,"Say: [T]")
			//	src<<"Your message can not exceed 250 characters."
				src<<"<font color = red><b>Your message can not exceed 150 characters</b><br>Your message: <i>[T]</i>"
				T=copytext(T,1,250)

			view(16)<<"<font color=red>[src.name] says:</font><font color = white> [T]</font>"
			for(var/mob/PC/M in player)
				if(M.hearall)
			//		if(M.heard)return
			//		spawn(1)M.heard=0
			//		M.heard=1
					M<<"Hearall <font color=red>[src.name] says:</font><font color = white> [T]</font>"
	/*
			if(sd_BalloonTails && sd_BalloonTails.len)
				for(var/Tail in sd_BalloonTails)
					del(Tail)

			// show it in a ballon that will be cleared in 15 seconds
			sd_ImprovedWordBalloon(T, src)

			// show the text in everyone's text window
			for(var/mob/M in moblist)
			//			if(M.Window)
			//				M.Window.Append("[src]: [T]")
			*/
			src.say_delay += 1
			sleep(50)
			src.say_delay = 0