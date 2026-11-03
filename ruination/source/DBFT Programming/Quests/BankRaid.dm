

mob/var
	VAULTPROGRESS=0
	BankQuest=0
	BankQuestCanTake=1
	BankQuestTurnIn=0
	lastcompleteBankRaid=0
	KingVegetaSuit=0
	BrolyMetalSuit=0
mob/NPC/Thief
	icon = 'MISCMOBS.dmi'
	icon_state = "punk"
	name = "Thief"
	powerlevel = 1000000000000000000000
	density = 1
	safe = 1
	frozen = 1
	energy_code = 5756423
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(2)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Thief")


			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			if(usr.fused)
				return
			spawn(30)usr.talking=0
			usr.talking = 1
			if(usr.BankQuestTurnIn)
				usr << "<b>\icon[src]<font color = white>Thief:</font></b> Good, now give me my share and go away"
				usr.exp+=50000
				//world.Repop()
				usr << "<font color=white>Exp +50,000<br>Quest Points += 10</font>"
				usr.zp+=1
				usr.questpoints += 10
				usr.bankCanDoQuest=0
				usr << "<font color=red>You have gained a Z Point!</font>"
				if(!usr.calledlvlup)
					usr.Level_Up()
				usr.talking = 0
				usr.lastcompleteBankRaid = usr.level
				usr.BankQuestCanTake=0
				usr.BankQuest=0
				usr.VAULTPROGRESS=0
				usr.BankQuestTurnIn=0
				var/randchance = rand(1,2) // was 10
				if(randchance == 1 && usr.KingVegetaSuit == 0)
					var/obj/Equipment/Suits/KingVegetaSuit/O = new

					usr << "<b>\icon[src]<font color = white>Thief:</font></b>here's a [O.name] from the loot!"
					usr.contents += O
					usr.KingVegetaSuit = 1
				if(randchance == 2 && usr.BrolyMetalSuit == 0)
					var/rand2 = rand(1,2)
					if(rand2 == 2)
						var/obj/Equipment/Suits/BrolySuit/O = new

						usr << "<b>\icon[src]<font color = white>Thief:</font></b>here's a [O.name] from the loot!"
						usr.contents += O
						usr.BrolyMetalSuit = 1
				usr << "<font color=yellow><b>You can do this quest again after you raise your character level by 10,000</font>"
				for(var/obj/Quests/Thief/Bank_Raid/Q)
					del(Q)
				return
			if(!usr.BankQuest && !usr.BankQuestCanTake)
				usr << "<b>\icon[src]<font color = white>Thief:</font></b> Hey you.. buzz off for now!<br>Check back later when it's safe to rob the bank again."
				return
			if(!usr.BankQuest && usr.BankQuestCanTake)
				usr << "<b>\icon[src]<font color = white>Thief:</font></b> Hey you.. I hear there's some good loot at the back of the bank..I can't get there myself but how about you break in and split it with me, call it a commission fee!"
				sleep(15)
				if(!usr)return
				switch(alert("Accept his offer?","Quest: Bank Raid","Yes","Not Yet"))
					if("Yes")
						usr.BankQuest = 1
						usr.BankQuestCanTake=0
						usr.talking = 0
						usr.contents += new/obj/Quests/Thief/Bank_Raid
						//world.Repop()
						usr << "<b>\icon[src]<font color = white>Thief:</font></b> Glad to hear it! You should be able to blow up the vault doors with any of your ki techniques, but bank security will go after you so be ready.. they are kind of pushy. Meet me back here when you have it done"
					else
						usr << "<b>\icon[src]<font color = white>Thief:</font></b> Think about it, could be rich."
						usr.talking = 0
						return



obj/Quests/Thief

	Bank_Raid
		name = "Bank Raid"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0

		Click()

	//	View_Quest()
	//		set category = null
			var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=650 id=AutoNumber1 height=400>
<tr>
<td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000></font></div></td>
<td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
  </font></td>
</tr>
<tr>
<td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
<td width=300 height=12><font size=1><font face=Tahoma>Blow your way through the bank to the last vault and obtain a random prize! <br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=300 height=12><font face=Tahoma size=1>EXP + 50000<br>Quest Points += 10<br>Random item</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=300 height=12><font face=Tahoma size=1>Thief</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>Hey you.. I hear there's some good loot at the back of the bank..I can't get there myself but how about you break in and
split it with me, call it a commission fee!<br>Note: Vault doors can be destroyed with ki techniques, but when you attack the bank, bank security will get pissed off and try to push you around<br>Note: There are two suits obtainable from this quest, it is a repeatable quest </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=700x450;border=0;can_resize=0; can_minimize=0;")
		verb
			Abandon_Quest()
				set category = null
				switch(alert("Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.BankQuest = 0
						usr.BankQuestCanTake=1
						del(src)
					if("No")
						return

obj/var/clicked=0
obj/QuestEnd
	BankChest
		icon = 'Wooden Items.dmi'
		icon_state = "Treasure"
		density = 1
		verb/Open()
			set category = "QUEST"
			set src in oview(1)
			if(src.clicked)
				return
			src.clicked=1
			spawn(70) src.clicked=0
			if(usr.VAULTPROGRESS>=3)
				usr << "<b>\icon[src] You got the vault treasure, take it back to the Thief to finish the quest!"
				usr.BankQuestTurnIn=1
				return
			if(usr.BankQuest && usr.VAULTPROGRESS<3)
				usr << "<b>\icon[src] You must destroy at least 3 vault doors without leaving the bank or you cannot open the chest!"
				return
			if(usr.BankQuestTurnIn)
				usr << "Go talk to Thief to finish quest"
				return
			if(!usr.BankQuestCanTake)
				usr << "You aren't on the quest"
				return


