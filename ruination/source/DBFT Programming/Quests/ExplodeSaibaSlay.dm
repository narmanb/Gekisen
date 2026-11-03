mob/var
	startedexplodingsaibaquest = 0
	startedexplodingsaibamassacre = 0
	explodingsaibacomplete = 0
mob/NPC/InjuredSaiyan
	name = "Injured Saiyan"
	icon = 'MISCMOBS.dmi'
	icon_state = "explodesaibaquest"
	density = 1
	safe = 1
	frozen = 1
	energy_code = 356153682432
	New()
		..()
		src.CreateName()
	verb/Talk()
		set src in oview(1)
		set category = null
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Injured Saiyan")
		if(usr.talking)
			usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
			return
		switch(alert("I need your help!",,"Exterminate exploding saibamen","Exploding saibaman massacre","Walk away"))
			if("Walk away")
				return
			if("Exploding saibaman massacre")
				usr.talking=1
				if(!usr.startedexplodingsaibamassacre)
					usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Mutated saibamen won't stop coming, there are rumors they have turned many into a yamcha, show them that they're no match for the [usr.race] race and kill 1,000 of them in a single run without dying!"
					usr.startedexplodingsaibamassacre = 1
					usr.contents += new/obj/Quests/InjuredSaiyan/ExplodingSaibaMassacre
					usr.talking=0
					return
				else
					if(usr.explodingsaibacomplete||usr.explodecurrentkills >= 1000)
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Thank you! Here is your reward. Talk to me if you wish to help out more."
						usr.exp+=2500000

						usr << "<font color=white>Exp +2,500,000<br>Quest Points + 200</font>"
						usr.questpoints += 200
						usr.zp+=1
						usr.explodecurrentkills = 0
						usr.startedexplodingsaibamassacre = 0
						usr.explodingsaibacomplete=0
						usr << "<font color=red>You have gained 1 Z Points!</font>"
						usr.Level_Up()
						for(var/obj/Quests/InjuredSaiyan/ExplodingSaibaMassacre/Q)
							del(Q)
						usr.talking=0
						return
					else
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> You killed [applycommas(usr.explodecurrentkills)] on your last run, but you need to kill 1,000!"
						usr.talking=0
			if("Exterminate exploding saibamen")
				usr.talking=1

				if(!usr.startedexplodingsaibaquest)
					usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Mutated saibamen are rapidly multiplying inside this building, I cannot win on my own, please kill 5,000 exploding saibamen for me!"
					usr.startedexplodingsaibaquest = 1
					usr.contents += new/obj/Quests/InjuredSaiyan/ExplodingSaibas
					usr.talking=0
					return
				else
					if(usr.ExplodingSaibamanKills >= 5000)
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> Thank you! Here is your reward. However there is more work to be done, talk to me if you wish to help out more."
						usr.exp+=500000

						usr << "<font color=white>Exp +500,000<br>Quest Points + 50</font>"
						usr.questpoints += 50
						usr.zp+=5
						usr.ExplodingSaibamanKills -= 5000
						usr.startedexplodingsaibaquest = 0
						usr << "<font color=red>You have gained 5 Z Points!</font>"
						usr.Level_Up()
						for(var/obj/Quests/InjuredSaiyan/ExplodingSaibas/Q)
							del(Q)
						usr.talking=0
						return
					else
						usr << "<font color = white><b>\icon[src] Injured Saiyan:</white></b> You have killed [usr.ExplodingSaibamanKills] exploding saibamen!"
						usr.talking=0




obj/Quests/InjuredSaiyan

	ExplodingSaibas
		name = "Exploding Saibamen"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0

		Click()

	//	View_Quest()
	//		set category = null
			var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
<tr>
<td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000></font></div></td>
<td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
  </font></td>
</tr>
<tr>
<td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
<td width=143 height=12><font size=1><font face=Tahoma>Defeat 5,000 exploding saibamen and return for a prize! (killed [usr.ExplodingSaibamanKills] mobs so far)<br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=143 height=12><font face=Tahoma size=1>EXP + 500,000<br>Quest Points + 50<br>ZP + 10</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=143 height=12><font face=Tahoma size=1>Injured Saiyan</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>Mutated saibamen are rapidly multiplying inside this building, I cannot win on my own, please kill 5,000 exploding saibamen for me!<br>This Quest is repeatable </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")


	ExplodingSaibaMassacre
		name = "Exploding Saibamen Massacre"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0

		Click()

	//	View_Quest()
	//		set category = null
			var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
<tr>
<td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000></font></div></td>
<td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [src.name]
  </font></td>
</tr>
<tr>
<td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
<td width=143 height=12><font size=1><font face=Tahoma>Defeat 1,000 exploding saibamen in single run without dying and return for a prize! (killed [usr.explodecurrentkills] on your last run)<br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=143 height=12><font face=Tahoma size=1>EXP + 2,500,000<br>Quest Points + 200<br>ZP + 20</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=143 height=12><font face=Tahoma size=1>Injured Saiyan</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>Mutated saibamen won't stop coming, there are rumors they have turned many into a yamcha, show them that they're no match for the [usr.race] race and kill 1,000 of them in one run!"<br>This Quest is repeatable </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")