mob/var
	killsfarm = 0
	startedfarm = 0
mob/NPC
	Farmer
		name = "Farmer"
		icon = 'MISCMOBS.dmi'
		icon_state = "farmerold"
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
				PlayerWatch(usr,"Talked to Farmer")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			usr.talking=1
			spawn(60)usr.talking=0
			if(!usr.startedfarm)
				usr << "<font color = white><b>\icon[src] Farmer:</white></b> There's been all sorts of monsters, I can't farm my property! Kill 10,000 of them and repeat back to me!"
				usr.killsfarm = 0
				usr.startedfarm = 1
				usr.contents += new/obj/Quests/Farmer/kill10k
				return
			else
				if(usr.killsfarm >= 10000)
					usr << "<font color = white><b>\icon[src] Farmer:</white></b> Good riddance! Here is your reward. Talk to me again if would like to go again"
					usr.exp+=200000

					usr << "<font color=white>Exp +200,000</font>"
					usr.zp+=5
					usr.killsfarm = 0
					usr.startedfarm = 0
					usr << "<font color=red>You have gained 5 Z Points!</font>"
					usr.Level_Up()
					for(var/obj/Quests/Farmer/kill10k/Q)
						del(Q)

					return
				else
					usr << "<font color = white><b>\icon[src] Farmer:</white></b> You have killed [usr.killsfarm] monsters!"




obj/Quests/Farmer

	kill10k
		name = "Monster Exterminator"
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
<td width=143 height=12><font size=1><font face=Tahoma>Defeat 10k mobs (any mobs) and return for a prize! (killed [usr.killsfarm] mobs so far)<br>(This quest is repeatable)</font></font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
<td width=143 height=12><font face=Tahoma size=1>EXP + 200,000<br>ZP + 5</font></td>
</tr>
<tr>
<td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
<td width=143 height=12><font face=Tahoma size=1>Farmer</font></td>
</tr>
<tr>
<td colspan=4 height=48><font face=Tahoma size=1>There's been all sorts of monsters, I can't farm my property! Kill 10,000 of them and repeat back to me!<br>This Quest is repeatable </font></td>
</tr>
</table>
"}
			usr << browse(examine_sensu,"window=Hench;size=550x350;border=0;can_resize=0; can_minimize=0;")