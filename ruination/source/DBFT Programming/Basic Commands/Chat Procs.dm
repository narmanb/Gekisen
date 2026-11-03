mob
	var
		tmp
			lasttext=""
			chatcount=0
			chatcount2=0
		muted=0
		mute_time=0
		sugg_delay=0
		bug_delay=0


var/list/PROFANITY = list("nigger","faggot","fag","F@g","N1gger","Nigg3r","F4gg0t","F4g","F@gg0t","N1gg3r","Nigga","Niggers","N1gg3rs","N1ggers","byond://")
mob/proc/Check_For_Profanity(T as text,var/list/L)
	for(var/V in L)
		if(findtext(T,V))
			return TRUE
var/list/SPAM = list ("\n")
mob/proc/Check_For_Spam(T as text,var/list/L)
	for(var/V in L)
		if(findtext(T,V))
			return TRUE

mob
	proc
		CheckChatSpamTwo()
			src.chatcount2+=1
			spawn(8)src.chatcount2-=1
			if(src.chatcount2>5)
				player <<"<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been automatically muted for spamming."
				src.muted=1
				/*
				BannedSK.Add(src.ckey)
				BannedSA.Add(src.client.address)
				for(var/mob/X in player)
					if(X.GMLevel)
						X<<"<center><font color=blue>(Name: [src])(Key: [src.key])(IP: [src.client.address])"
				player <<"<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been Automatically Banned for Spamming."
				del(src)
				*/
				return

		CheckChatSpam(var/T)
			if(T=="")return
			if(src=="Crimson Slayer"||src=="Cazdogga"||src=="Hazdogga"||src=="Hammerboy")return
			if(T==src.lasttext)
				src.chatcount+=1
				spawn(60)src.chatcount-=1
				if(src.chatcount<0)
					src.chatcount=0
				if(src.chatcount>5)
					player <<"<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been automatically muted for spamming."
					src.muted=1
					/*
					BannedSK.Add(src.ckey)
					BannedSA.Add(src.client.address)
					for(var/mob/X in player)
						if(X.GMLevel)
							X<<"<center><font color=blue>(Name: [src])(Key: [src.key])(IP: [src.client.address])"
					player <<"<font color = #00B211>Dragon AI:</font> \white [src.name]([src.key]) has been Automatically Banned for Spamming."
					del(src)
					*/
					return
			src.lasttext=T


client/script={"<STYLE>
BIG IMG.icon {width: 32px; height: 32px}
SMALL IMG.icon {width: 8px; height: 8px}
IMG.icon {width: 16px; height: 16px}
</STYLE>"}



/*
client/script={"<STYLE>
    BIG IMG.icon {width: 64px; height: 64px}
    IMG.icon {width: 32px; height: 32px}
    small IMG.icon {width: 16px; height: 16px}
</STYLE>"}
*/