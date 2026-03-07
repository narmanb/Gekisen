// !! MORHPERS FOR POWER RANGERS GUILD !!

obj/powerrangers
	RedMorpher
		name = "Red Morpher"
		icon = 'Morpher.dmi'
		verb
			Red_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Red Ranger.dmi'
					usr.rankname = "<font color=red>Red Ranger</FONT>"
			Red_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Red Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	BlueMorpher
		name = "Blue Morpher"
		icon = 'Morpher.dmi'
		verb
			Blue_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Blue Ranger.dmi'
					usr.rankname = "<font color=blue>Blue Ranger</FONT>"
			Blue_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Blue Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	GreenMorpher
		name = "Green Morpher"
		icon = 'Morpher.dmi'
		verb
			Green_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Green Ranger.dmi'
					usr.rankname = "<font color=green>Green Ranger</FONT>"
			Green_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Green Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	BlackMorpher
		name = "Black Morpher"
		icon = 'Morpher.dmi'
		verb
			Black_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Black Ranger.dmi'
					usr.rankname = "<font color=gray>Black Ranger</FONT>"
			Black_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Black Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	WhiteMorpher
		name = "White Morpher"
		icon = 'Morpher.dmi'
		verb
			White_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'White Ranger.dmi'
					usr.rankname = "<font color=white>White Ranger</FONT>"
			White_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'White Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	YellowMorpher
		name = "Yellow Morpher"
		icon = 'Morpher.dmi'
		verb
			Yellow_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Yellow Ranger.dmi'
					usr.rankname = "<font color=yellow>Yellow Ranger</FONT>"
			Yellow_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Yellow Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

	PinkMorpher
		name = "Pink Morpher"
		icon = 'Morpher.dmi'
		verb
			Pink_Ranger_Transform()
				set category = null
				if(usr.prtrans==1 && usr.guild=="Power Rangers")
					usr<<"You are already transformed into power ranger."
				else
					usr<<"You transform into power ranger!"
					usr.prtrans=1
					usr.overlays += 'Pink Ranger.dmi'
					usr.rankname = "<font color=#FF1493>Pink Ranger</FONT>"
			Pink_Ranger_Revert()
				set category = null
				if(usr.prtrans==0 && usr.guild=="Power Rangers")
					usr<<"You arent transformed into your power ranger state."
				else
					usr<<"You revert from your power ranger state."
					usr.prtrans=0
					usr.overlays -= 'Pink Ranger.dmi'
					usr.rankname = null
			Power_Ranger_HouseTeleporter()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=1
					sleep(50)
					usr.loc=locate(103,158,20)
			Power_Ranger_EarthTeleport()
				set category = null
				if(usr.guild=="Power Rangers")
					usr<<"Teleporting!"
					usr.teleportedtoguildhouse=0
					sleep(50)
					usr.loc=locate(207,195,1)
				else
					usr<<"You arent in Power Rangers!"
					return

obj
	RedRanger
		icon = 'Red Ranger.dmi'
	BlueRanger
		icon = 'Blue Ranger.dmi'
	GreenRanger
		icon = 'Green Ranger.dmi'
	BlackRanger
		icon = 'Black Ranger.dmi'
	WhiteRanger
		icon = 'White Ranger.dmi'
	YellowRanger
		icon = 'Yellow Ranger.dmi'
	PinkRanger
		icon = 'Pink Ranger.dmi'

mob/PRAdmin
	verb
		Give_Morpher(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Choose the morpher you want to give him/her.", "Morpher Giver",text) in list("Red Morpher","Black Morpher","Blue Morpher","Yellow Morpher","White Morpher","Green Morpher","Pink Morpher","Cancel"))
				if("Red Morpher")
					M<<"You have got the red morpher from [usr]!"
					M.contents+= new /obj/powerrangers/RedMorpher
				if("Blue Morpher")
					M<<"You have got the blue morpher from [usr]!"
					M.contents+= new /obj/powerrangers/BlueMorpher
				if("Black Morpher")
					M<<"You have got the black morpher from [usr]!"
					M.contents+= new /obj/powerrangers/BlackMorpher
				if("Green Morpher")
					M<<"You have got the green morpher from [usr]!"
					M.contents+= new /obj/powerrangers/GreenMorpher
				if("White Morpher")
					M<<"You have got the white morpher from [usr]!"
					M.contents+= new /obj/powerrangers/WhiteMorpher
				if("Yellow Morpher")
					M<<"You have got the yellow morpher from [usr]!"
					M.contents+= new /obj/powerrangers/YellowMorpher
				if("Pink Morpher")
					M<<"You have got the pink morpher from [usr]!"
					M.contents+= new /obj/powerrangers/PinkMorpher
				if("Cancel")
					return
		Remove_Morpher(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Choose the morpher you want to remove from him/her.", "Morpher Remover",text) in list("Red Morpher","Black Morpher","Blue Morpher","Yellow Morpher","White Morpher","Green Morpher","Pink Morpher","Cancel"))
				if("Red Morpher")
					M<<"Your red morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/RedMorpher
				if("Blue Morpher")
					M<<"Your blue morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/BlueMorpher
				if("Black Morpher")
					M<<"Your black morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/BlackMorpher
				if("Green Morpher")
					M<<"Your green morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/GreenMorpher
				if("White Morpher")
					M<<"Your white morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/WhiteMorpher
				if("Yellow Morpher")
					M<<"Your yellow morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/YellowMorpher
				if("Pink Morpher")
					M<<"Your black morpher has been removed by [usr]!"
					M.contents-= /obj/powerrangers/PinkMorpher
				if("Cancel")
					return