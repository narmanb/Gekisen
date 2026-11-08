mob/var/tmp/list/blackjackHUD
mob/proc/AddBlackjackHUD()
	if(!src.client.screen)	return
	src.ClearBlackjackHUD()
	src.blackjackHUD=list()
	for(var/v in typesof(/obj/Blackjack/HUD)-/obj/Blackjack/HUD)	src.blackjackHUD+=new v
	src.client.screen+=src.blackjackHUD
mob/proc/ClearBlackjackHUD()
	src.client.screen-=src.blackjackHUD

obj/Blackjack/HUD
	layer=11
	CardBG
		icon='BlackjackCardBG.png'
		screen_loc="2,4"
	TotalMaptext
		maptext_width=256
		screen_loc="3,8:8"
		maptext="<b><font color=white>Player Total: 99"
	DealerCardBG
		icon='BlackjackCardBG.png'
		screen_loc="2,10"
	DealerTotalMaptext
		maptext_width=256
		screen_loc="3,14:8"
		maptext="<b><font color=white>Dealer Total: 99"
	HitButton
		icon='BlackjackButtons.dmi'
		icon_state="Hit"
		screen_loc="4,4"
		Click()

			if(GetBlackjackTotal(usr.blackjackHand)>=21)	return
			if(!usr.blackjackCanHit)	return
			usr.BlackjackHit()
			return ..()
			..()
		/*Double_Down
			icon_state="DoubleDown"
			screen_loc="8,4"
			Click()
				if(GetBlackjackTotal(usr.blackjackHand)>=21)	return
				if(!usr.blackjackCanHit)	return
				usr.BlackjackHit()
				if(usr.blackjackCanHit)	usr.EndBlackjack()
				return ..()
		*/
	StayButton
		icon='BlackjackButtons.dmi'
		icon_state="Stay"
		screen_loc="12,4"
		Click()

			if(src.icon_state!="Stay")	return
			src.icon_state="StayGray"
			usr.EndBlackjack()
			return ..()
			..()

mob/var/tmp/list/blackjackMessageHUD
mob/proc/BlackjackMessageHUD()
	src.client.screen-=src.blackjackMessageHUD
	src.blackjackMessageHUD=list()
	for(var/v in typesof(/obj/Blackjack/MessageHUD)-/obj/Blackjack/MessageHUD)	src.blackjackMessageHUD+=new v
	var/list/winParamList=src.BlackjackWinLose()
	var/winReason=winParamList[1]
	var/winMult=winParamList[winReason]
	var/winAmt=round(src.blackjackBet*winMult)
	for(var/obj/Blackjack/MessageHUD/WinLossMsg/M in src.blackjackMessageHUD)
		var/winFontColor="[rgb(64,64,64)]"
		var/whoWon="Tie"
		var/thisProfit=winAmt-blackjackBet
		if(winMult==0)
			whoWon="Dealer Won"
			winFontColor="[rgb(128,0,0)]"
			src.LogBlackjackStat("Losses")
			src.LogBlackjackHand("<font color=[rgb(128,0,0)]>([src.client.computer_id]) [whoWon]: [FullNum(thisProfit)] [src.blackjackCurrency]")
		else if(winMult>=2)
			whoWon="Player Won"
			winFontColor="black"
			src.LogBlackjackStat("Wins")
			src.LogBlackjackHand("([src.client.computer_id]) [whoWon]: [FullNum(thisProfit)] [src.blackjackCurrency]")
		else
			src.LogBlackjackStat("Ties")
			src.LogBlackjackHand("<font color=[rgb(64,64,64)]>([src.client.computer_id]) [whoWon]: [FullNum(src.blackjackBet)] [src.blackjackCurrency]")
		M.maptext="<b><font color=[winFontColor] align=top>[whoWon]\n[winReason]\nProfit: [FullNum(thisProfit)] [src.blackjackCurrency]"
	src.blackjackHandActive=0
	src.BlackjackMoney(winAmt)
	src.client.screen+=src.blackjackMessageHUD
mob/proc/ClearBlackjackMessageHUD()
	src.client.screen-=src.blackjackMessageHUD


obj/Blackjack/MessageHUD/PlayAgain
obj/Blackjack/MessageHUD/ChangeBet
obj/Blackjack/MessageHUD/Quit
obj/Blackjack/MessageHUD
	layer=13
	Background
		screen_loc="7,7"
		icon='BlackjackMsgBG.png'
	WinLossMsg
		screen_loc="7:4,7:4"
		maptext_width=160-8
		maptext_height=160-8
		maptext="<b><font color=white align=top>Test"
	PlayAgain
		screen_loc="8,9"
		icon='BlackjackButtons.dmi'
		icon_state="PlayAgain"
		Click()
			usr.StartBlackJack()
			return ..()
	ChangeBet
		screen_loc="8,8"
		icon='BlackjackButtons.dmi'
		icon_state="ChangeBet"
		Click()
			usr.ChangeBlackjackBet()
			return ..()
	Quit
		screen_loc="8,7"
		icon='BlackjackButtons.dmi'
		icon_state="Quit"
		Click()
			usr.ClearBlackjackHUD()
			usr.isPlayingBlackjack=0
			usr.ClearBlackjackMessageHUD()
			return ..()


proc/FullNum(var/eNum,var/showCommas=1)
	var/negSign
	if(eNum<0)
		eNum*=-1
		negSign="-"
	eNum=num2text(round(eNum),99)
	if(showCommas && length(eNum)>3)
		for(var/i=1;i<=round(length(eNum)/4);i++)
			var/CutLoc=length(eNum)+1-(i*3)-(i-1)
			eNum="[copytext(eNum,1,CutLoc)],[copytext(eNum,CutLoc)]"
	return "[negSign][eNum]"