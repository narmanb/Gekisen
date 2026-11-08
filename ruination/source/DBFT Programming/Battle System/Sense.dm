obj/Technique/Sense
	verb
		Sense()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Sense")
			if(usr.spam_delay)
				return
			usr.spam_delay=1
			var/huge = 0
			var/strong = 0
			var/weak = 0
			var/ext = 0
			var/mon = 0
			var/god = 0
		//ar/unknown = 0
			var/tot=0
			usr << "\cyan You sense:"
//			var/totaluser = usr.powerlevel + usr.ki + usr.strength + usr.defence
			//for(var/mob/PC/M in player)
			for(var/mob/M in player)
				if(M!=usr)
					tot++
					if(M.level >= usr.level * 10)
						god++
					if(M.level >= usr.level * 8 && M.level < usr.level * 10)
					//if(M.powerlevel>=usr.powerlevel*1000&&M.powerlevel<usr.powerlevel*10000)
						mon++
					if(M.level >= usr.level * 6 && M.level < usr.level * 8)
				//	if(M.powerlevel>=(usr.powerlevel*100&&M.powerlevel+M.ki+M.strength+M.defence<(usr.powerlevel+usr.ki+usr.strength+usr.defence)*1000)
						ext++
				//	if(M.powerlevel+M.ki+M.strength+M.defence>=(usr.powerlevel+usr.ki+usr.strength+usr.defence)*50&&M.powerlevel+M.ki+M.strength+M.defence<(usr.powerlevel+usr.ki+usr.strength+usr.defence)*100)
					if(M.level >= usr.level * 3 && M.level < usr.level * 6)
						huge++
				//	if(M.powerlevel+M.ki+M.strength+M.defence>=(usr.powerlevel+usr.ki+usr.strength+usr.defence)*10&&M.powerlevel+M.ki+M.strength+M.defence<(usr.powerlevel+usr.ki+usr.strength+usr.defence)*50)
					if(M.level >= usr.level && M.level < usr.level * 3)
						strong++
					if(M.level < usr.level)
					//if(M.powerlevel<usr.powerlevel)
						weak++
							/*
					if(total >= totaluser*10)
						god++
					if(total>=totaluser*8&&total<totaluser*10)
						mon++
					if(total>=totaluser*6&&total<totaluser*8)
						ext++
					if(total>=totaluser*3&&total<totaluser*6)
						huge++
					if(total>=totaluser&&total<totaluser*3)
						strong++
					if(total<totaluser)
						weak++
						*/
					/*
					if(M.powerlevel>=usr.powerlevel*10000)
						god++
					if(M.powerlevel>=usr.powerlevel*1000&&M.powerlevel<usr.powerlevel*10000)
						mon++
					if(M.powerlevel>=usr.powerlevel*100&&M.powerlevel<usr.powerlevel*1000)
						ext++
					if(M.powerlevel>=usr.powerlevel*50&&M.powerlevel<usr.powerlevel*100)
						huge++
					if(M.powerlevel>=usr.powerlevel*10&&M.powerlevel<usr.powerlevel*50)
						strong++
					if(M.powerlevel<usr.powerlevel)
						weak++
						*/
			sleep(5)
			if(god>=1)
				usr<<"\cyan [god] <FONT COLOR=#4b0082>G</FONT><FONT COLOR=#410e70>O</FONT><FONT COLOR=#361d5e>D</FONT><FONT COLOR=#2b2b4b>L</FONT><FONT COLOR=#213a38>Y</FONT><FONT COLOR=#164825> </FONT><FONT COLOR=#0b5713>P</FONT><FONT COLOR=#006400>O</FONT><FONT COLOR=#0a5810>W</FONT><FONT COLOR=#134c21>E</FONT><FONT COLOR=#1d3f31>R</FONT><FONT COLOR=#263342>(</FONT><FONT COLOR=#302652>S</FONT><FONT COLOR=#391962>)</FONT><FONT COLOR=#430d73>!</FONT><FONT COLOR=#4b0082>!</FONT>"
			if(mon>=1)
				usr<<"\cyan [mon] <font color = red>MONSTROUS POWER(S)!"
			usr<<"\cyan [ext] <font color = red>Extremely Huge Power(s)!"
			usr<<"\cyan [huge] <font color = yellow>Huge Power(s)!"
			usr<<"\cyan [strong] <font color = green>Strong Power(s)!"
			usr<<"\cyan [weak] <font color = white>Weak Power(s)!"
		//sr << "[unknown] picked up"
			if(tot)
				usr<<"\cyan You are more powerful than [round((weak/tot)*100)]% of the players online.</font>"
				usr<<""
			spawn(25)usr.spam_delay=0
			return



/*

obj/Technique/Sense
	verb
		Sense()
			set category = "Techniques"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Sense")
			if(usr.spam_delay)
				return
			usr.spam_delay=1
			var/huge = 0
			var/strong = 0
			var/weak = 0
			var/ext = 0
			var/mon = 0
			var/god = 0
			var/tot=0
			usr << "\cyan You sense:"
			var/totaluser = usr.powerlevel + usr.ki + usr.strength + usr.defence
			for(var/mob/PC/M in player)
				if(M!=usr)
					tot++
					var/total = M.powerlevel + M.ki + M.strength + M.defence
					if(total >= totaluser * 10)
						god++
					if(total>=totaluser*8&&total<totaluser*10)
						mon++
					if(total>=totaluser*6&&total<totaluser*8)
						ext++
					if(total>=totaluser*3&&total<totaluser*6)
						huge++
					if(total>=totaluser&&total<totaluser*3)
						strong++
					if(total<totaluser)
						weak++
					/*
					if(M.powerlevel>=usr.powerlevel*10000)
						god++
					if(M.powerlevel>=usr.powerlevel*1000&&M.powerlevel<usr.powerlevel*10000)
						mon++
					if(M.powerlevel>=usr.powerlevel*100&&M.powerlevel<usr.powerlevel*1000)
						ext++
					if(M.powerlevel>=usr.powerlevel*50&&M.powerlevel<usr.powerlevel*100)
						huge++
					if(M.powerlevel>=usr.powerlevel*10&&M.powerlevel<usr.powerlevel*50)
						strong++
					if(M.powerlevel<usr.powerlevel)
						weak++
						*/
			sleep(5)
			if(god>=1)
				usr<<"\cyan [god] <FONT COLOR=#4b0082>G</FONT><FONT COLOR=#410e70>O</FONT><FONT COLOR=#361d5e>D</FONT><FONT COLOR=#2b2b4b>L</FONT><FONT COLOR=#213a38>Y</FONT><FONT COLOR=#164825> </FONT><FONT COLOR=#0b5713>P</FONT><FONT COLOR=#006400>O</FONT><FONT COLOR=#0a5810>W</FONT><FONT COLOR=#134c21>E</FONT><FONT COLOR=#1d3f31>R</FONT><FONT COLOR=#263342>(</FONT><FONT COLOR=#302652>S</FONT><FONT COLOR=#391962>)</FONT><FONT COLOR=#430d73>!</FONT><FONT COLOR=#4b0082>!</FONT>"
			if(mon>=1)
				usr<<"\cyan [mon] <font color = red>MONSTROUS POWER(S)!"
			usr<<"\cyan [ext] <font color = red>Extremely Huge Power(s)!"
			usr<<"\cyan [huge] <font color = yellow>Huge Power(s)!"
			usr<<"\cyan [strong] <font color = green>Strong Power(s)!"
			usr<<"\cyan [weak] <font color = white>Weak Power(s)!"
			if(tot)
				usr<<"\cyan You are more powerful than [round((weak/tot)*100)]% of the players online.</font>"
				usr<<""
			spawn(25)usr.spam_delay=0
			return

			*/