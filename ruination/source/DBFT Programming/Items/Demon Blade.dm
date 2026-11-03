obj/Equipment
	Demon_Blade
		name = "Demon Blade"
		icon = 'Demon Blade.dmi'
		icon_state = "drop"
		var/blade = 'Demon Blade.dmi'
		value = 50000000
		density = 0
		weight = 2.6
		Click()
			if(src in usr:contents)
		/*		if(!src.item_owner)
					switch(alert("This item is not Bio-Linked. Do you wish to Bio-Link it now?","","Yes","No"))
						if("Yes")
							src.item_owner=usr.key*/
				if(usr.strength <= 50000000)
					usr << "<font color=red>You've tried to pick up the Demon Blade, but it's weight overwhelms you."
					return
				else
					if(!usr.demon_blade)
						if(usr.weapone == "EMPTY")
							if(src.item_owner!=usr.key&&src.item_owner)
								usr<<"Error: This item is Bio-Linked to someone."
								return
							usr.overlays += blade
							usr << "You have equipped the <u>[src]</u>."
							suffix = "(Worn)"

							//usr.speed = round(usr.speed - (usr.speed * 0.1))
							usr.demon_blade = 1
							src.equiped = 1
							usr.weightsword = 2
							usr.weapone = src.name
						else
							usr << "Error: You already have something equipped as your Weapon!"
							return
					else
						usr.overlays -= blade
						usr << "You have unequiped the <u>[src]</u>."
						suffix = null
						usr.demon_blade = 0
						usr.weapone = "EMPTY"
						usr.weightsword = 0
						src.equiped = 0

		verb

			Examine()
				set category = null
				var/examine_dblade = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Verdana color=#FF0000>Demon Blade</font></b></td></tr><tr><td width=96 height=12><font size=1 color=red face=Verdana>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Verdana>[condition]</font></b></font><font size=1 face=Verdana> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Verdana size=1 color=#FF0000>Trait</font><font size=1 color=red face=Verdana>:</font></b></td><td width=174 height=12><font face=Verdana size=1>Sadistic Demon Blade</font></b></td></tr><tr><td width=96 height=12><font face=Verdana size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Verdana size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48 style=font-family: Verdana; font-size: 8pt; font-weight: bold><font face=Verdana size=1>Legend says that if the Demon Blade is pulled out, the individual will receive incredible powers. It was located in Hell, stuck within a dark plateau. </font></b></td></tr></table>"
				usr << browse(examine_dblade,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(usr.level < 500)
					usr << "<font color=blue>You need to be level 500 or higher to be able to pick up this Sword."
					return
				if(Move(usr))
					usr << "You have picked up the <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the <u>[src]</u>."

			Drop()
				set category = null
				if(src.equiped == 0)
					src.loc = usr.loc
					usr << "You have dropped the <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop <u>[src.name]</u>, it's already equipped."

			Summon_Lucifer()
				set category = null
				if(usr.race == "Demon")
					if(usr.karma == "Evil" && usr.karma_rating >= 30)
						if(usr.powerlevel_max >= 200000000)
							if(!usr.gone_prince)
								for(var/mob/NPC/N in oview(15))
									if(N.name == "Dabura")
										var/mob/NPC/Lucifer/M = new
										M.owner=usr
										M.loc = usr.loc
						else
							usr<<"You need a base powerlevel of 200,000,000."
							return
					else
						usr<<"You need 30% Evil Karma."
						return
				else
					usr << "You can't summon Lucifer."
					return