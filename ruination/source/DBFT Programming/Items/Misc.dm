/*obj/Equipment/Consumable/PodCapsule
	name =  "Pod Capsule"
	icon = 'Capsule.dmi'
	icon_state = "2"
	Click()
		if(usr.z!=1&&usr.z!=2&&usr.z!=3&&usr.z!=4)
			usr<<"You cannot use this here."
			return
		else
			new/obj/Spaceship/SpacePod(usr.loc)*/
mob
	proc
		Fruit_CD()
			if(src.dblmobcounter||src.dblmob)
				src.dblmobcounter-=1
				if(src.dblmobcounter<0)
					src.dblmobcounter=120
					src.dblmob=0
					src<<"<big>\white Your Fruit of Might has worn off</font>"
					return
				spawn(600)src.Fruit_CD()
mob/var/dblmob=0
mob/var/dblmobcounter=120
obj/Equipment/Consumable/Candy
	name =  ""
	icon = 'Candy.dmi'
	icon_state = ""
	var/candy_pl

	Click()
		if(src in usr:contents)
			if(usr.race == "Majin" || usr.race == "Android")
				usr << "<font color = red>You put [src.name] in your mouth and crunch it down."
				usr.eats += 1
				if(src.candy_pl>250000)
					src.candy_pl=250000
				var/gain = rand(1,3)
				var/gainamount = rand(5,20)
				if(gain == 1)
					usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from eating [src.name]!","output2")
					usr.strength_bonus += gainamount
				if(gain == 2)
					usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from eating [src.name]!","output2")
					usr.defence_bonus += gainamount
				if(gain == 3)
					usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from eating [src.name]!","output2")
					usr.ki_bonus += gainamount

			//	usr.powerlevel_max+=src.candy_pl
				del(src)
			else
				if(usr.race == "Human" && usr.gene == "Majin Incarnate")
					usr << "<font color = red>You put [src.name] in your mouth and crunch it down."
					usr.eats += 1
					if(src.candy_pl>250000)
						src.candy_pl=250000
					var/gain = rand(1,3)
					var/gainamount = rand(5,20)
					if(gain == 1)
						usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from eating [src.name]!","output2")
						usr.strength_bonus += gainamount
					if(gain == 2)
						usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from eating [src.name]!","output2")
						usr.defence_bonus += gainamount
					if(gain == 3)
						usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from eating [src.name]!","output2")
						usr.ki_bonus += gainamount
					del(src)
				else
					del(src)
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
				if(usr.autouseshard)
					src.Click()
			else
				usr << "You are unable to pick up [src.name]."

obj/Equipment/Guild_Item
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.equiped && src.guild == usr.guild_name)
				if(usr.gitems <= 5)
					usr << "You wear the [src.name]."
					suffix = "(Worn)"
					usr.overlays += icon
					usr.gitems+=1
					src.equiped = 1
				else
					usr << "You can only have 5 guild items equipped."
					return
			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.overlays -= icon
				src.equiped = 0
				usr.gitems -= 1
				if(usr.gitems < 0)
					usr.gitems = 0
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(src.guild == usr.guild_name)
				if(Move(usr))
					usr << "You have picked up [src.name]."
					usr.inven_min += 1


				else
					usr << "You are unable to pick up [src.name]."


			else
				usr << "You are not in the guild: [src.guild]."
				return



		Drop()
			set category = null
			if(!src.equiped)
				usr.inven_min -= 1
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
				spawn(1200)
					var/tmp/c=0
					for(var/mob/PC/M in player)
						if(src in M:contents)
							c+=1
					if(c)
						return
					else
						del(src)

			else
				usr << "Cannot drop it while it is equiped."
				return



		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.equiped)
					usr.inven_min -= 1
					del(src)

				else
					usr << "Cannot do that while it is equiped."
					return

			else
				return

mob/var/gitems = 0
obj/Equipment/Guild_Item2
	var/eq = 0
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.eq && src.guild == usr.guild_name)
				if(usr.gitems <= 2)
					usr << "You wear the [src.name]."
					suffix = "(Worn)"
					usr.underlays += icon
					src.eq = 1
					usr.gitems += 1
				else
					usr << "You can only have 3 guild items equipped."
					return

			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.underlays -= icon
				src.eq = 0
				usr.gitems -= 1
				if(usr.gitems < 0)
					usr.gitems = 0
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(src.guild == usr.guild_name)
				if(Move(usr))
					usr << "You have picked up [src.name]."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up [src.name]."
			else
				usr << "You are not in the guild: [src.guild]."
				return
		Drop()
			set category = null
			if(!src.eq)
				usr.inven_min -= 1
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
			else
				usr << "Cannot drop it while it is equiped."
				return
		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.eq)
					usr.inven_min -= 1
					del(src)
				else
					usr << "Cannot do that while it is equiped."
					return
			else
				return
obj/Equipment/Consumable/Chip
	name =  "Chip"
	icon = 'Chip.dmi'
	value = 5000
	Click()
		if(src in usr:contents)
			if(usr.race == "Android")
				usr << "<font color = red>You absorb the chip into your system!"
				usr.chips ++
				usr.defence_max += 10000
				del(src)
				if(usr.chips > 10)
					usr<<"You have enough chips in your system to trans"
				return
			else
				usr << "I have no use for this, but maybe I can sell it."
				return
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
				if(usr.autouseshard)
					src.Click()
			else
				usr << "You are unable to pick up [src.name]."
		Drop()
			set category = null
			usr.inven_min -= 1
			src.loc = usr.loc
			usr << "You have dropped the <u>[src.name]</u>."

obj/Equipment/Consumable/MChip
	name =  "Mega Chip"
	icon = 'Mega Chip.dmi'
	Click()
		if(src in usr:contents)
			if(usr.race == "Android")
				if(usr.gene == "Bionic" || usr.gene == "Gluttonous")
					usr << "<font color = red>You absorb the Mega Chip into your system!"
					usr.mchips ++
					usr.defence_max += 30000
					usr.ki_max += 10000
					del(src)
					if(usr.mchips > 5)
						usr<<"You have enough chips in your system to trans"
					return
				if(usr.gene == "Mechanical")
					usr << "<font color = red>You absorb the Mega Chip into your system!"
					usr.mchips ++
					usr.defence_max += 30000
					usr.ki_max += 10000
					del(src)
					if(usr.mchips > 3)
						usr<<"You have enough chips in your system to trans"
					return
			else
				usr << "I have to use for this..might as well just drop it."
				return
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				usr.inven_min += 1
				if(usr.autouseshard)
					src.Click()
			else
				usr << "You are unable to pick up [src.name]."
		Drop()
			set category = null
			usr.inven_min -= 1
			src.loc = usr.loc
			usr << "You have dropped the <u>[src.name]</u>."



obj/Equipment/Admin_Item
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.equiped)

				usr << "You wear the [src.name]."
				suffix = "(Worn)"
				usr.overlays += icon
				usr.gitems+=1
				src.equiped = 1

			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.overlays -= icon
				src.equiped = 0
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."

			else
				usr << "You are not in the guild: [src.guild]."
				return



		Drop()
			set category = null
			if(!src.equiped)
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
			else
				usr << "Cannot drop it while it is equiped."
				return



		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.equiped)
					del(src)

				else
					usr << "Cannot do that while it is equiped."
					return

			else
				return


obj/Equipment/Admin_Item2
	name =  ""
	icon
	icon_state = ""
	Click()
		if(src in usr:contents)
			if(!src.equiped)

				usr << "You wear the [src.name]."
				suffix = "(Worn)"
				usr.underlays += icon
				src.equiped = 1

			else
				usr << "You remove the [src.name]."
				suffix = null
				usr.underlays -= icon
				src.equiped = 0

	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."

			else
				usr << "You are not in the guild: [src.guild]."
				return



		Drop()
			set category = null
			if(!src.equiped)
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
			else
				usr << "Cannot drop it while it is equiped."
				return



		Destroy()
			set category = null
			if(src in usr:contents)
				if(!src.equiped)

					del(src)

				else
					usr << "Cannot do that while it is equiped."
					return

			else
				return



obj/Equipment/Event_Item
	name =  ""
	icon
	icon_state = ""
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(usr.CheckInventory()==TRUE)return
			if(Move(usr))
				usr << "You have picked up [src.name]."
				player << "<font color = #ea0000>Event Information: <font color = white>[usr.name] picked up [src.name]!"




		Drop()
			set category = null
			if(!src.equiped)
				src.loc = usr.loc
				usr << "You have dropped the: <u>[src.name]</u>."
				player << "<font color = #ea0000>Event Information: <font color = white>[usr.name] dropped [src.name]!"

/*
mob
	verb
		AdminMakeItem()
			if(usr.GMLevel<1)
				return
			//set category = "Guild"
			if(usr.makingitem)
				return
			usr.makingitem = 1
			var/icon/I=input("Select your Admin Item's icon:")as null|icon
			if(!length(I))
				usr.makingitem=0
				return
			if(length(I) > filesizemax)
				usr << "File is too large. 50kb max."
				usr.makingitem=0
				return
			switch(alert("Make Admin Item?","Make Admin Item","Yes","No"))
				if("Yes")
					switch(alert(usr,"Overlay or Underlay?(Overlays show on top of your character's icon \
									and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
						if("Overlay")
							var/obj/Equipment/Admin_Item/O = new
							var/N = input("Whats the name?","","Admin Item") as text
							if(Check_For_Spam(N,SPAM) == TRUE)
								src<<"Please do not use linebreak characters."
								usr.makingitem = 0
								return
							if(!N)
								N = "Admin Item"
							if(lentext(N)>15)
								N="Admin Item"
							if(N == null)
								N="Admin Item"
							N=html_encode(N)
							O.name = N
							O.icon = I
							usr.contents += O
							usr.inven_min += 1
							usr.makingitem = 0
							AdminMessage("[usr] \red create \font the admin item [N]")
							usr<<"[N] was created successfully!"
							return
						if("Underlay")
							var/obj/Equipment/Admin_Item2/O = new
							var/N = input("Whats the name?","","Admin Item") as text
							if(Check_For_Spam(N,SPAM) == TRUE)
								src<<"Please do not use linebreak characters."
								usr.makingitem = 0
								return
							if(!N)
								N = "Admin Item"
							if(lentext(N)>15)
								N= "Admin Item"
							if(N == null)
								N="Admin Item"
							N=html_encode(N)
							O.name = N
							O.icon = I
							usr.contents += O
							usr.inven_min += 1
							usr.makingitem = 0
							usr<<"[N] was created successfully!"
							AdminMessage("[usr] \red create \font the admin item [N]")
							return
						if("Cancel")
							usr.makingitem = 0
							return
				if("No")
					usr.makingitem = 0
					return
					*/