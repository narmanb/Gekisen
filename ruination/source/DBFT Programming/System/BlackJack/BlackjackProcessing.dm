obj/Blackjack/Card
	layer=12
	var/cardFace
	var/cardSuit
	var/cardValue
	icon='BlackjackCards.dmi'
	proc/HideCard()
		src.cardValue=0
		src.icon_state="BackRed"
		src.name="Facedown Card"
	proc/ShowCard()
		src.cardValue=blackjackCardFaces[src.cardFace]
		if(!src.cardValue)	src.cardValue=text2num(src.cardFace)
		src.icon_state="[src.cardFace][src.cardSuit]"
		src.name="[src.cardFace] of [src.cardSuit]"

proc/ShuffleList(var/list/L)
	if(!istype(L,/list))	return L
	var/list/shuffledList=list()
	while(L.len)
		var/v=pick(L)
		L-=v
		shuffledList+=v
	return shuffledList

var/list/blackjackCardFaces=list("Ace"=11,"2","3","4","5","6","7","8","9","10","Jack"=10,"Queen"=10,"King"=10)
proc/GeneratePlayingCards()
	var/list/thisDeck=list()
	var/list/cardSuits=list("Clubs","Spades","Diamonds","Hearts")
	for(var/thisSuit in cardSuits)
		for(var/thisFace in blackjackCardFaces)
			var/obj/Blackjack/Card/C=new()
			C.cardFace=thisFace
			C.cardSuit=thisSuit
			C.ShowCard()
			thisDeck+=C
	return thisDeck

mob/var/tmp
	blackjackCanHit
	list/blackjackDeck
	list/blackjackHand
	list/blackjackDealerHand
mob/proc/BlackjackHit(var/forDealer=0)
	var/obj/Blackjack/Card/C=pick(src.blackjackDeck)
	src.blackjackDeck-=C
	if(forDealer)
		src.blackjackDealerHand+=C
		C.screen_loc="[2+src.blackjackDealerHand.len],11:-1"
		if(src.blackjackDealerHand.len==2)	C.HideCard()
		src.UpdateBlackjackDealerTotal()
	else
		src.blackjackHand+=C
		C.screen_loc="[2+src.blackjackHand.len],5:-1"
		var/totalValue=GetBlackjackTotal(src.blackjackHand)
		for(var/obj/Blackjack/HUD/TotalMaptext/T in src.client.screen)	T.maptext="<b><font color=white>Player Total: [totalValue]"
		if(totalValue>=21)	src.EndBlackjack()
	src.blackjackHUD+=C
	src.client.screen+=C

mob/proc/BlackjackWinLose()
	var/list/winParamList=list("Error?"=0)
	var/playerTotal=GetBlackjackTotal(src.blackjackHand)
	var/dealerTotal=GetBlackjackTotal(src.blackjackDealerHand)
	if(playerTotal>21)	winParamList=list("Player Busted"=0)	//winFor="Player Busted ([playerTotal])"
	else if(IsBlackjack(src.blackjackHand))
		if(IsBlackjack(src.blackjackDealerHand))	winParamList=list("Double Blackjack!"=1)	//winFor="Blackjack Ties"
		else
			winParamList=list("Blackjack!"=2.5)	//winFor="Player Blackjack"
			src.LogBlackjackStat("Blackjacks")
	else if(playerTotal==dealerTotal && !IsBlackjack(src.blackjackDealerHand))	winParamList=list("[playerTotal] vs [dealerTotal]"=1)	//winFor="Tie ([playerTotal] : [dealerTotal])"
	else if(playerTotal>dealerTotal)	winParamList=list("[playerTotal] vs [dealerTotal]"=2)	//winFor="Player wins ([playerTotal] : [dealerTotal])"
	else if(dealerTotal>21)	winParamList=list("Dealer Busted"=2)	//winFor="Dealer Busted ([dealerTotal])"
	else
		if(IsBlackjack(src.blackjackDealerHand))	winParamList=list("Dealer Blackjack!"=0)
		else	winParamList=list("[dealerTotal] vs [playerTotal]"=0)	//winFor="Dealer wins ([dealerTotal] : [playerTotal])"
	return winParamList

proc/GetBlackjackTotal(var/list/thisHand)
	AceAdjusted
	var/handTotal=0
	for(var/obj/Blackjack/Card/V in thisHand)	handTotal+=V.cardValue
	if(handTotal>21)	for(var/obj/Blackjack/Card/C in thisHand)	if(C.cardFace=="Ace" && C.cardValue!=1)
		C.cardValue=1
		goto AceAdjusted
	return handTotal

proc/IsBlackjack(var/list/thisHand)
	var/thisTotal=GetBlackjackTotal(thisHand)
	if(thisTotal==21 && thisHand.len==2)	return 1

mob/proc/UpdateBlackjackDealerTotal()
	var/totalValue=GetBlackjackTotal(src.blackjackDealerHand)
	for(var/obj/Blackjack/HUD/DealerTotalMaptext/T in src.client.screen)	T.maptext="<b><font color=white>Dealer Total: [totalValue]"

mob/proc/ChangeBlackjackBet()
	if(src.blackjackHandActive)	return
	if(src.isChangingBlackjackBet)	return
	src.isChangingBlackjackBet=1
	src.blackjackCurrency=input("Blackjack Currency","Change Blackjack Bet",src.blackjackCurrency) as anything in list("zenni","Z Coins")
	src.blackjackBet=round(input("Amount to bet:\nYou have [FullNum(src.vars[src.blackjackCurrency])] [src.blackjackCurrency]","Change Blackjack Bet",src.blackjackBet) as num)
	if(src.blackjackBet>src.vars[src.blackjackCurrency])	src.blackjackBet=src.vars[src.blackjackCurrency]
	if(src.blackjackBet<0)	src.blackjackBet=0
	src.isChangingBlackjackBet=0

mob/proc/StartBlackJack()
	if(src.blackjackHandActive)	return
	if(src.isChangingBlackjackBet)	return
	if(src.blackjackBet>src.vars[src.blackjackCurrency])	src.blackjackBet=src.vars[src.blackjackCurrency]
	if(src.blackjackBet<0)	src.blackjackBet=0
	src.blackjackHandActive=1
	src.blackjackBetInPlay=src.blackjackBet
	src.BlackjackMoney(-src.blackjackBet)
	src.ClearBlackjackMessageHUD()
	src.AddBlackjackHUD()
	src.blackjackHand=list()
	src.blackjackDealerHand=list()
	src.blackjackDeck=GeneratePlayingCards()
	//src.blackjackDeck=ShuffleList(src.blackjackDeck)
	src.BlackjackHit(1)
	src.BlackjackHit()
	src.BlackjackHit(1)
	src.BlackjackHit()
	src.blackjackCanHit=1
	src.isPlayingBlackjack=1
	src.LogBlackjackStat("Hands Played")

mob/proc/BlackjackDealerAI()
	for(var/obj/Blackjack/Card/C in src.blackjackDealerHand)	C.ShowCard()
	src.UpdateBlackjackDealerTotal()
	while(GetBlackjackTotal(src.blackjackDealerHand)<17)
		src.BlackjackHit(1)

mob/proc/EndBlackjack()
	src.blackjackCanHit=0
	for(var/obj/Blackjack/HUD/HitButton/H in src.client.screen)	H.icon_state="[initial(H.icon_state)]Gray"
	for(var/obj/Blackjack/HUD/StayButton/H in src.client.screen)	H.icon_state="StayGray"
	blackjackBetInPlay=0
	src.BlackjackDealerAI()
	src.BlackjackMessageHUD()

mob/proc/LogoutBlackjackBet()
	if(src.blackjackBetInPlay)
		src.LogBlackjackHand("<font color=[rgb(128,0,0)]>([src.client.computer_id]) Logout: [src.blackjackBetInPlay*-1] [src.blackjackCurrency]")

mob/proc/RefundBlackjackBet()
	if(src.blackjackBetInPlay)
		src.LogBlackjackHand("([src.client.computer_id]) Refunded: [src.blackjackBetInPlay] [src.blackjackCurrency]")
		src.BlackjackMoney(src.blackjackBetInPlay)
		src.blackjackBetInPlay=0