mob/verb
	Change_Channel(c as text)
		set category = "Communication"
		usr.channel=c
		usr<<"You have joined Channel [c]"
	Csay(msg as text)
		set category = "Communication"
		if(usr.mute==1||usr.tempmute==1)
			usr<<"Your Muted"

		else
			if(usr.name!=""&&usr.channel!="")
				usr.talkcool=20
				usr.talktimes+=1
				if(usr.talktimes>=8)
					usr<<"<font color = red> <B><u> Ok man, you need to stop with the Caffeine here. Give it a little break ok?</b></u></font>"
					usr.tempmute=1
					sleep(100)
					usr<<"<font color = blue> <i><u> Do you feel better now buddy?</b></u></font>"
					usr.tempmute=0
					usr.talktimes=0
				if(usr.talkcooling==0)
					spawn()usr.talkcool()
				if(length(msg) <= 500&&usr.say==1)
					usr.say=0
					for(var/mob/characters/M in world)
						if(M.channel==usr.channel)
							if(findText("[M.Ignorelist]","[usr]")==0)
								M<<"<b><font color = red>[usr]<font color = white> CSays:<font color = white> [html_encode(msg)]"
					sleep(2)
					usr.say=1
				else
					world<<"[html_encode(usr.name)]/[usr.key] tried to spam"
					usr.tempmute=1
					sleep(200)
					usr.tempmute=0
