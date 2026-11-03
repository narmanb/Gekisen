mob/var/tmp
	list/blackjackStats
	list/blackjackHands

mob/proc/LogBlackjackStat(var/statName="Wins",var/statAmt=1)
	if(!src.blackjackStats)	src.blackjackStats=list()
	src.blackjackStats[statName]+=statAmt
	src.SaveBlackjackStats()

mob/proc/LogBlackjackHand(var/handInfo)
	if(!src.blackjackHands)	src.blackjackHands=list()
	src.blackjackHands+=handInfo
	src.SaveBlackjackStats()

mob/proc/SaveBlackjackStats()
	var/blackjackSave="BlackjackStatSaves/[src.key].sav"
	if(fexists(blackjackSave))	fdel(blackjackSave)
	var/savefile/F=new(blackjackSave)
	F["blackjackStats"]<<src.blackjackStats
	F["blackjackHands"]<<src.blackjackHands
	F["blackjackVersion"]<<blackjackVersion

mob/proc/LoadBlackjackStats()
	var/blackjackSave="BlackjackStatSaves/[src.key].sav"
	if(fexists(blackjackSave))
		var/savefile/F=new(blackjackSave)
		F["blackjackStats"]>>src.blackjackStats
		F["blackjackHands"]>>src.blackjackHands
		if(F["blackjackVersion"]<2)
			for(var/v in src.blackjackStats)
				if(findtext(v,"winnings"))
					var/firstLoc=findtext(v,"(")+1
					var/endLoc=findtext(v,")")
					var/thisVar=copytext(v,firstLoc,endLoc)
					src<<"[thisVar] -= [FullNum(src.blackjackStats[v])]"
					if(thisVar in src.vars)
						src.vars[thisVar]-=src.blackjackStats[v]
						world.log<<"** Blackjack Reset: [src]: [thisVar] -= [FullNum(src.blackjackStats[v])]"
					else	world.log<<"** Blackjack Reset Error: [thisVar] on [src]: [src.blackjackStats[v]]"
			src<<"Blackjack Reset"
			src.blackjackStats=list()
			fdel(blackjackSave)
			//src.save()