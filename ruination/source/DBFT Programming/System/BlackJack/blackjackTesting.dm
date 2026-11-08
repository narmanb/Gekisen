mob/var/tmp
	blackjackCurrency="blackjackMoney"
	blackjackBetInPlay=0
	blackjackBet=10

mob/proc/BlackjackMoney(var/thisAmt)
	src.vars[src.blackjackCurrency]+=thisAmt
	src.LogBlackjackStat("Winnings ([src.blackjackCurrency])",thisAmt)

mob/proc/ViewBlackjackStats(var/mobKey)
	var/blackjackSave="BlackjackStatSaves/[mobKey].sav"
	if(fexists(blackjackSave))
		var/mob/M=new()
		M.name=mobKey
		var/savefile/F=new(blackjackSave)
		F["blackjackStats"]>>M.blackjackStats
		F["blackjackHands"]>>M.blackjackHands
		var/HTML="<title>[M]'s Blackjack Stats</title>"
		HTML+="<body bgcolor=black>"
		HTML+="<center><table width=100% bgcolor=green border=1 bordercolor=darkgreen>"
		for(var/v in M.blackjackStats)
			var/thisColor="Black"
			if(M.blackjackStats[v]<0)	thisColor="[rgb(128,0,0)]"
			HTML+="<tr><td align=right width=1% nowrap=nowrap><B>[v]<td nowrap=nowrap><B><font color=[thisColor]>[FullNum(M.blackjackStats[v])]"
		if(src.key=="Dujo13309")
			HTML+="</table><br><table width=100% bgcolor=green border=1 bordercolor=darkgreen>"
			var/handCount=1
			for(var/v in M.blackjackHands)
				HTML+="<tr><td width=1% nowrap=nowrap><b>[handCount++]<td nowrap=nowrap><B>[v]"
		src<<browse(HTML,"window=BlackjackStats")

mob/Topic(href,href_list[])
	if(href_list["action"]=="ViewBlackjackStats" && href_list["userName"])
		usr.ViewBlackjackStats(href_list["userName"])
	return ..()

mob/var/tmp/isPlayingBlackjack
mob/var/tmp/isChangingBlackjackBet
mob/BlackJack_Dealer
//	def=inf
//	kidef=inf
	density=1
	icon='NPCs.dmi'
	//icon_state="Jenemba"
	//icon_state=ra
	verb/Play_Blackjack()
		set src in oview()
		if(usr.isPlayingBlackjack)	return
		if(usr.isChangingBlackjackBet)	return
		usr.ChangeBlackjackBet()
		if(usr)	usr.StartBlackJack()
	verb/View_My_Blackjack_Stats()
		set src in oview()
		usr.ViewBlackjackStats(usr.key)
	verb/View_All_Blackjack_Stats()
		set src in oview()
		var/playerCount=0
		for(var/mob/PC/M in players)
			if(M.isPlayingBlackjack)	playerCount+=1
		var/list/allFiles=flist("BlackjackStatSaves/")
		var/HTML="<title>Blackjack Stats</title>"
		HTML+="<body bgcolor=black link=black alink=black vlink=black>"
		HTML+="<center><table width=100% bgcolor=green border=1 bordercolor=darkgreen>"
		HTML+="<tr><td colspan=100%>[playerCount] playing right now<br>[allFiles.len] Players have played Blackjack:"
		HTML+="<tr><td align=center><i>Player<td><i>W/L/T<td><i>Winnings"
		var/endHTML=""
		var/totalWins=0,totalLosses=0,totalTies=0
		var/list/totalWinningsList=list()
		for(var/v in allFiles)
			var/userName=copytext("[v]",1,length("[v]")-3)
			var/savefile/F=new("BlackjackStatSaves/[v]")
			if(F["blackjackVersion"]!=blackjackVersion)	continue
			var/list/theseStats=F["blackjackStats"]
			var/allWinnings=""
			totalWins+=theseStats["Wins"]
			totalLosses+=theseStats["Losses"]
			totalTies+=theseStats["Ties"]
			for(var/w in theseStats)	if(findtext(w,"Winnings"))
				var/thisAmt=theseStats[w]
				totalWinningsList[w]+=thisAmt
				var/thisColor="Black"
				if(thisAmt<0)	thisColor="[rgb(128,0,0)]"
				allWinnings+="<font color=black>[w]: <font color=[thisColor]>[FullNum(thisAmt)]<br>"
			var/userNameLink="<a href='?src=\ref[src];action=ViewBlackjackStats;userName=[userName]'>[userName]</a>"
			endHTML+="<tr><td align=center width=1% nowrap=nowrap><b>[userNameLink]<td nowrap=nowrap><b>[theseStats["Wins"]]/[theseStats["Losses"]]/[theseStats["Ties"]]<td nowrap=nowrap><b>[allWinnings]"
		var/totalWinnings=""
		for(var/w in totalWinningsList)
			var/thisAmt=totalWinningsList[w]
			var/thisColor="Black"
			if(thisAmt<0)	thisColor="[rgb(128,0,0)]"
			totalWinnings+="<font color=black>[w]: <font color=[thisColor]>[FullNum(thisAmt)]<br>"
		HTML+="<tr><td align=center width=1% nowrap=nowrap><b>Server Totals<td nowrap=nowrap><b>[totalWins]/[totalLosses]/[totalTies]<td nowrap=nowrap><b>[totalWinnings]"
		HTML+=endHTML
		usr<<browse(HTML,"window=BlackjackStats")