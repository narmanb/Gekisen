mob/var
	startedexplodingcellquest = 0
	startedexplodingcellmassacre = 0
	explodingcellcomplete = 0
mob/NPC/InjuredHalfSaiyan
	name = "Injured Half Saiyan"
	icon = 'MISCMOBS.dmi'
	icon_state = "explodecellquest"
	density = 1
	safe = 1
	frozen = 1
	energy_code = 356153682423
	New()
		..()
		src.CreateName()
	verb/Talk()
		set src in oview(1)
		set category = null
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Injured Half Saiyan")
		if(usr.talking)
			usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
			return
		switch(alert("I need your help!",,"Exterminate exploding cell juniors","Exploding cell junior massacre","Walk away"))
			if("Walk away")
				return
			if("Exploding cell junior massacre")
				usr.talking=1
				if(!usr.startedexplodingcellmassacre)
					usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> Mutated cell juniors won't stop coming, there are rumors they have turned many into a yamcha, show them that they're no match for the [usr.race] race and kill 2,000 of them in a single run without dying!"
					usr.startedexplodingcellmassacre = 1
					usr.contents += new/obj/Quests/InjuredHalfSaiyan/ExplodingCellMassacre
					usr.talking=0
					return
				else
					if(usr.explodingcellcomplete||usr.explodecurrentkillscell >= 2000)
						usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> Thank you! Here is your reward. Talk to me if you wish to help out more."
						usr.exp+=20000000

						usr << "<font color=white>Exp +20,000,000<br>Quest Points + 500</font>"
						usr.questpoints += 500
						usr.zp+=1
						usr.explodecurrentkillscell = 0
						usr.startedexplodingcellmassacre = 0
						usr.explodingcellcomplete=0
						usr << "<font color=red>You have gained 1 Z Points!</font>"
						usr.Level_Up()
						for(var/obj/Quests/InjuredHalfSaiyan/ExplodingCellMassacre/Q)
							del(Q)
						usr.talking=0
						return
					else
						usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> You killed [applycommas(usr.explodecurrentkillscell)] on your last run, but you need to kill 2,000!"
						usr.talking=0
			if("Exterminate exploding cell juniors")
				usr.talking=1

				if(!usr.startedexplodingcellquest)
					usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> Mutated cell jrs are rapidly multiplying inside this building, I cannot win on my own, please kill 10,000 exploding cell juniors for me!"
					usr.startedexplodingcellquest = 1
					usr.contents += new/obj/Quests/InjuredHalfSaiyan/ExplodingCells
					usr.talking=0
					return
				else
					if(usr.ExplodingCellKills >= 10000)
						usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> Thank you! Here is your reward. However there is more work to be done, talk to me if you wish to help out more."
						usr.exp+=2000000

						usr << "<font color=white>Exp +2,000,000<br>Quest Points + 100</font>"
						usr.questpoints += 100
						usr.zp+=5
						usr.ExplodingCellKills -= 10000
						usr.startedexplodingcellquest = 0
						usr << "<font color=red>You have gained 5 Z Points!</font>"
						usr.Level_Up()
						for(var/obj/Quests/InjuredHalfSaiyan/ExplodingCells/Q)
							del(Q)
						usr.talking=0
						return
					else
						usr << "<font color = white><b>\icon[src] Injured Half Saiyan:</white></b> You have killed [usr.ExplodingCellKills] exploding cell juniors!"
						usr.talking=0




obj/Quests/InjuredHalfSaiyan

	ExplodingCells
		name = "Exploding Cell Juniors"
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
<td width=143 height=12><font size=1><font face=Tahoma>Defeat 10,000 exploding cell juniors and return for a prize! (killed [usr.ExplodingCellKills] mobs so far)<br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=143 height=12><font face=Tahoma size=1>EXP + 2,000,000<br>Quest Points + 100<br>ZP + 10</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=143 height=12><font face=Tahoma size=1>Injured Half Saiyan</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>Mutated cell juniors are rapidly multiplying inside this building, I cannot win on my own, please kill 10,000 exploding cell juniors for me!<br>This Quest is repeatable </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")


	ExplodingCellMassacre
		name = "Exploding Cell Junior Massacre"
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
<td width=143 height=12><font size=1><font face=Tahoma>Defeat 2,000 exploding cell juniors in single run without dying and return for a prize! (killed [usr.explodecurrentkillscell] on your last run)<br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=143 height=12><font face=Tahoma size=1>EXP + 20,000,000<br>Quest Points + 200<br>ZP + 20</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=143 height=12><font face=Tahoma size=1>Injured Half Saiyan</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>Mutated cell juniors won't stop coming, there are rumors they have turned many into a yamcha, show them that they're no match for the [usr.race] race and kill 1,000 of them in one run!"<br>This Quest is repeatable </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")