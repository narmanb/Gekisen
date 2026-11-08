obj
	Flag
		icon='Flag.dmi'
		density=1
		layer=5

		Flag1
//			New()
//				src.loc=locate(133,645,1)
		Flag2
//			New()
//				src.loc=locate(616,328,1)
		Flag3
//			New()
//				src.loc=locate(137,85,1)
		Flag4
//			New()
//				src.loc=locate(391,522,1)
		Flag5
//			New()
//				src.loc=locate(137,85,1)
		Flag6
//			New()
//				src.loc=locate(259,567,6)
		Flag7
//			New()
//				src.loc=locate(352,414,6)
		Flag8
//			New()
//				src.loc=locate(234,97,6)
		Flag9
//			New()
//				src.loc=locate(48,425,4)
		Flag10
//			New()
//				src.loc=locate(553,154,3)
	/*	Flag11
			New()
				src.loc=locate(198,125,3)
		Flag12
			New()
				src.loc=locate(278,75,3)
		Flag13
			New()
				src.loc=locate(379,279,4)
		Flag14
			New()
				src.loc=locate(242,355,4)
		Flag15
			New()
				src.loc=locate(54,251,4)
		Flag16
			New()
				src.loc=locate(310,95,2)
		Flag17
			New()
				src.loc=locate(35,133,1)
		Flag18
			New()
				src.loc=locate(35,133,1)
		Flag19
			New()
				src.loc=locate(35,133,1)
		Flag20
			New()
				src.loc=locate(35,133,1)*/
		FlagLetter1
			icon='FlagFont.dmi'
			icon_state=""
			layer=6
		//	New()
			//	pixel_x=-5
		FlagLetter2
			icon='FlagFont.dmi'
			icon_state=""
			layer=6
		//	New()
		//		pixel_x=5
mob
	proc
		GuildFlag(GuildNumber,FL1,FL2)
			switch(GuildNumber)
				if(1)
					var/obj/Flag/Flag1/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(2)
					var/obj/Flag/Flag2/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(3)
					var/obj/Flag/Flag3/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(4)
					var/obj/Flag/Flag4/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(5)
					var/obj/Flag/Flag5/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(6)
					var/obj/Flag/Flag6/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(7)
					var/obj/Flag/Flag7/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(8)
					var/obj/Flag/Flag8/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(9)
					var/obj/Flag/Flag9/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(10)
					var/obj/Flag/Flag10/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				/*if(11)
					var/obj/Flag/Flag11/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(12)
					var/obj/Flag/Flag12/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(13)
					var/obj/Flag/Flag13/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(14)
					var/obj/Flag/Flag14/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(15)
					var/obj/Flag/Flag15/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj
				if(16)
					var/obj/Flag/Flag16/F=new
					var/obj/Flag/FlagLetter1/L1=new
					var/obj/Flag/FlagLetter2/L2=new
					alert(usr,"Select Flag color")
					var/fr = input("How much Red do you want to put?") as num
					var/fg = input("How much Green do you want to put?") as num
					var/fb = input("How much Blue do you want to put?") as num
					F.icon += rgb(fr,fg,fb)
					alert(usr,"Select Guild Initials color")
					var/lr = input("How much Red do you want to put?") as num
					var/lg = input("How much Green do you want to put?") as num
					var/lb = input("How much Blue do you want to put?") as num
					L1.icon += rgb(lr,lg,lb)
					L2.icon += rgb(lr,lg,lb)
					L1.icon_state=FL1
					L2.icon_state=FL2
					F.overlays+=L1
					F.overlays+=L2
					sleep(5)
					MapObj.Add(F)
					var/savefile/S=new("world save files/Map.sav")
					S["MapObj"]<<MapObj*/
turf
	var
		guild_name = ""
		lastname
turf/Guild_Houses
	var/buying=0
	Guild_House1
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name==""||src.guild_name==null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 initials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name=M.guild_name
									for(var/turf/Guild_Houses/Guild_House1/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(1,ini1,ini2)
									M.loc = locate(38,3,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(38,3,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(38,13,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(16,23,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(30,33,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(62,23,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(47,69,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(291,93,1)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
	Guild_House2
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House2/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(2,ini1,ini2)
									M.loc = locate(144,3,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(144,3,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(144,12,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(122,23,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(136,33,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(168,23,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(181,53,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(229,415,1)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House3
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House3/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(3,ini1,ini2)
									M.loc = locate(251,3,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(251,3,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(250,12,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(229,23,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(245,33,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(288,51,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(275,23,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(299,471,2)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House4
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House4/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(4,ini1,ini2)
									M.loc = locate(368,4,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(368,4,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
//&&^&^^^& buying guild house above.... all inside below(except exit code)
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(367,13,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(346,24,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(360,34,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(390,47,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(392,24,5)
		Exit
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(306,210,3)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House5
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House5/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(5,ini1,ini2)
									M.loc = locate(469,4,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(469,4,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(468,13,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(447,24,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(461,34,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(493,24,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(436,43,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(419,25,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House6
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House6/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(6,ini1,ini2)
									M.loc = locate(46,222,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(46,222,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(44,237,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(16,249,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(33,285,5)
				/*sleep(5)
				for(var/mob/Gravity_Room_Gen_II/G in view(12,usr))
					G.Gravity(usr)*/
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(71,249,5)
				/*for(var/mob/Gravity_Room_Gen_II/G in view(12,src))
					G.Gravity(usr)*/
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(56,206,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(437,23,3)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House7
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House7/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(7,ini1,ini2)
									M.loc = locate(220,206,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						src.buying=0
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(220,206,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(220,224,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(174,243,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(206,272,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(273,241,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(223,193,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(301,4,1)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House8
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House8/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(8,ini1,ini2)
									M.loc = locate(420,238,5)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(420,238,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(420,257,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(391,263,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(416,297,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(455,266,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(414,223,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(210,161,6)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House9
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House9/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(9,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(368,4,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(368,4,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(346,24,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(360,34,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(390,24,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(368,13,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(47,424,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House10
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House10/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(10,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(469,4,5)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(469,4,5)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(447,24,5)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(461,34,5)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(493,24,5)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(469,13,5)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(552,153,3)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House11
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House11/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(11,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,141,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,141,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,147,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,147,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,147,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,147,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(195,123,3)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House12
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House12/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(12,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,116,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,116,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,122,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,122,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,122,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,122,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(275,73,3)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House13
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House13/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(13,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,91,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,91,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,97,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,97,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,97,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,97,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(376,277,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House14
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House14/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(14,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,66,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,66,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,72,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,72,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,72,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,72,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(239,353,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House15
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									src.buying=0
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									src.buying=0
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										src.buying=0
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House15/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(15,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,41,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,41,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,47,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,47,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,47,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,47,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(51,249,4)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House16
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									ini1=uppertext(ini1)
									ini2=uppertext(ini2)
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									for(var/turf/Guild_Houses/Guild_House10/H in world)
										H.guild_name=M.guild_name
										GuildHouse.Add(H)
										var/savefile/S=new("world save files/GuildHouse.sav")
										S["GuildHouse"]<<GuildHouse
									M.zenni -= cost
									M << "Purchase Successful!"
									src.buying=0
									spawn(7)M.GuildFlag(16,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "\white Welcome to [src.guild_name] \white Guild House Hall!"
						M.loc = locate(278,166,8)
						M.it_lock = 1
						M.it_blocked = 1
						M.grav=0
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		GuildHall
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(278,166,8)
				M.it_lock = 1
				M.it_blocked = 1
				M.grav=0
		GuildRoom1
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(298,172,8)
		GuildRoom2
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(339,172,8)
		GuildRoom3
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(365,172,8)
		GuildRoom4
			Enter(var/mob/PC/M)
				if(!ismob(M))return
				M.grav=0
				M.it_blocked=1
				M.it_lock=1
				M.loc=locate(380,172,8)
		Exit
			Enter(mob/PC/M)
				if(!ismob(M))return
				M.loc = locate(307,93,2)
				M.it_lock = 0
				M.grav=0
				M.it_blocked=0
				return

	Guild_House17
		var/cost = 1500000000
		Entrance
			Enter(var/mob/PC/M)
				if(istype(M,/mob/PC)==FALSE)return
				if(istype(M,/mob/PC))
					for(var/obj/O in M)
						if(O.dball)
							M<<"You can't bring the Dragonballs in here."
							return
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									switch(ini1)
										if("a")
											ini1="A"
										if("b")
											ini1="B"
										if("c")
											ini1="C"
										if("d")
											ini1="D"
										if("e")
											ini1="E"
										if("f")
											ini1="F"
										if("g")
											ini1="G"
										if("h")
											ini1="H"
										if("i")
											ini1="I"
										if("j")
											ini1="J"
										if("k")
											ini1="K"
										if("l")
											ini1="L"
										if("m")
											ini1="M"
										if("n")
											ini1="N"
										if("o")
											ini1="O"
										if("p")
											ini1="P"
										if("q")
											ini1="Q"
										if("r")
											ini1="R"
										if("s")
											ini1="S"
										if("t")
											ini1="T"
										if("u")
											ini1="U"
										if("v")
											ini1="V"
										if("w")
											ini1="W"
										if("x")
											ini1="X"
										if("y")
											ini1="Y"
										if("z")
											ini1="Z"
									switch(ini2)
										if("a")
											ini2="A"
										if("b")
											ini2="B"
										if("c")
											ini2="C"
										if("d")
											ini2="D"
										if("e")
											ini2="E"
										if("f")
											ini2="F"
										if("g")
											ini2="G"
										if("h")
											ini2="H"
										if("i")
											ini2="I"
										if("j")
											ini2="J"
										if("k")
											ini2="K"
										if("l")
											ini2="L"
										if("m")
											ini2="M"
										if("n")
											ini2="N"
										if("o")
											ini2="O"
										if("p")
											ini2="P"
										if("q")
											ini2="Q"
										if("r")
											ini2="R"
										if("s")
											ini2="S"
										if("t")
											ini2="T"
										if("u")
											ini2="U"
										if("v")
											ini2="V"
										if("w")
											ini2="W"
										if("x")
											ini2="X"
										if("y")
											ini2="Y"
										if("z")
											ini2="Z"
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									M.zenni -= cost
									M << "Purchase Successful!"
									GuildHouse.Add(src)
									sleep(5)
									var/savefile/H=new("world save files/GuildHouse.sav")
									H["GuildHouse"]<<GuildHouse
									spawn(7)M.GuildFlag(17,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "Welcome to [src.guild_name] \white Guild House!"
						M.loc = locate(158,31,9)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		Exit
			Enter(mob/PC/M)
				M.loc = locate(1,1,1)
				M.it_lock = 0
				M.it_blocked = 0
				return

	Guild_House18
		var/cost = 1500000000
		Entrance
			Enter(mob/PC/M)
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									switch(ini1)
										if("a")
											ini1="A"
										if("b")
											ini1="B"
										if("c")
											ini1="C"
										if("d")
											ini1="D"
										if("e")
											ini1="E"
										if("f")
											ini1="F"
										if("g")
											ini1="G"
										if("h")
											ini1="H"
										if("i")
											ini1="I"
										if("j")
											ini1="J"
										if("k")
											ini1="K"
										if("l")
											ini1="L"
										if("m")
											ini1="M"
										if("n")
											ini1="N"
										if("o")
											ini1="O"
										if("p")
											ini1="P"
										if("q")
											ini1="Q"
										if("r")
											ini1="R"
										if("s")
											ini1="S"
										if("t")
											ini1="T"
										if("u")
											ini1="U"
										if("v")
											ini1="V"
										if("w")
											ini1="W"
										if("x")
											ini1="X"
										if("y")
											ini1="Y"
										if("z")
											ini1="Z"
									switch(ini2)
										if("a")
											ini2="A"
										if("b")
											ini2="B"
										if("c")
											ini2="C"
										if("d")
											ini2="D"
										if("e")
											ini2="E"
										if("f")
											ini2="F"
										if("g")
											ini2="G"
										if("h")
											ini2="H"
										if("i")
											ini2="I"
										if("j")
											ini2="J"
										if("k")
											ini2="K"
										if("l")
											ini2="L"
										if("m")
											ini2="M"
										if("n")
											ini2="N"
										if("o")
											ini2="O"
										if("p")
											ini2="P"
										if("q")
											ini2="Q"
										if("r")
											ini2="R"
										if("s")
											ini2="S"
										if("t")
											ini2="T"
										if("u")
											ini2="U"
										if("v")
											ini2="V"
										if("w")
											ini2="W"
										if("x")
											ini2="X"
										if("y")
											ini2="Y"
										if("z")
											ini2="Z"
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									M.zenni -= cost
									M << "Purchase Successful!"
									spawn(5)BanSave()
									spawn(7)M.GuildFlag(18,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "Welcome to [src.guild_name] \white Guild House!"
						M.loc = locate(158,31,9)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		Exit
			Enter(mob/PC/M)
				M.loc = locate(1,1,1)
				M.it_lock = 0
				M.it_blocked = 0
				return

	Guild_House19
		var/cost = 1500000000
		Entrance
			Enter(mob/PC/M)
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									switch(ini1)
										if("a")
											ini1="A"
										if("b")
											ini1="B"
										if("c")
											ini1="C"
										if("d")
											ini1="D"
										if("e")
											ini1="E"
										if("f")
											ini1="F"
										if("g")
											ini1="G"
										if("h")
											ini1="H"
										if("i")
											ini1="I"
										if("j")
											ini1="J"
										if("k")
											ini1="K"
										if("l")
											ini1="L"
										if("m")
											ini1="M"
										if("n")
											ini1="N"
										if("o")
											ini1="O"
										if("p")
											ini1="P"
										if("q")
											ini1="Q"
										if("r")
											ini1="R"
										if("s")
											ini1="S"
										if("t")
											ini1="T"
										if("u")
											ini1="U"
										if("v")
											ini1="V"
										if("w")
											ini1="W"
										if("x")
											ini1="X"
										if("y")
											ini1="Y"
										if("z")
											ini1="Z"
									switch(ini2)
										if("a")
											ini2="A"
										if("b")
											ini2="B"
										if("c")
											ini2="C"
										if("d")
											ini2="D"
										if("e")
											ini2="E"
										if("f")
											ini2="F"
										if("g")
											ini2="G"
										if("h")
											ini2="H"
										if("i")
											ini2="I"
										if("j")
											ini2="J"
										if("k")
											ini2="K"
										if("l")
											ini2="L"
										if("m")
											ini2="M"
										if("n")
											ini2="N"
										if("o")
											ini2="O"
										if("p")
											ini2="P"
										if("q")
											ini2="Q"
										if("r")
											ini2="R"
										if("s")
											ini2="S"
										if("t")
											ini2="T"
										if("u")
											ini2="U"
										if("v")
											ini2="V"
										if("w")
											ini2="W"
										if("x")
											ini2="X"
										if("y")
											ini2="Y"
										if("z")
											ini2="Z"
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									M.zenni -= cost
									M << "Purchase Successful!"
									spawn(5)BanSave()
									spawn(7)M.GuildFlag(19,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "Welcome to [src.guild_name] \white Guild House!"
						M.loc = locate(158,31,9)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		Exit
			Enter(mob/PC/M)
				M.loc = locate(1,1,1)
				M.it_lock = 0
				M.it_blocked = 0
				return

	Guild_House20
		var/cost = 1500000000
		Entrance
			Enter(mob/PC/M)
				if(src.guild_name == "" || src.guild_name == null)
					if(M.in_guild)
						switch(alert(M,"Do you wish to buy this Guild House for [src.cost] Zenni?","Buy Guild House","Yes","No"))
							if("Yes")
								if(src.buying)
									usr<<"Someone is already buying this Guild House"
									return
								src.buying=1
								if(M.zenni < src.cost)
									M << "You dont have enough zenni"
									return
								if(src.guild_name != "")
									M << "This Guild House already belongs to someone"
									return
								else
									var
										initials=input("Type the initials of your Guild(2 inicials)")as null| text
										ini1 = copytext(initials,1,2)
										ini2 = copytext(initials,2,3)
									switch(ini1)
										if("a")
											ini1="A"
										if("b")
											ini1="B"
										if("c")
											ini1="C"
										if("d")
											ini1="D"
										if("e")
											ini1="E"
										if("f")
											ini1="F"
										if("g")
											ini1="G"
										if("h")
											ini1="H"
										if("i")
											ini1="I"
										if("j")
											ini1="J"
										if("k")
											ini1="K"
										if("l")
											ini1="L"
										if("m")
											ini1="M"
										if("n")
											ini1="N"
										if("o")
											ini1="O"
										if("p")
											ini1="P"
										if("q")
											ini1="Q"
										if("r")
											ini1="R"
										if("s")
											ini1="S"
										if("t")
											ini1="T"
										if("u")
											ini1="U"
										if("v")
											ini1="V"
										if("w")
											ini1="W"
										if("x")
											ini1="X"
										if("y")
											ini1="Y"
										if("z")
											ini1="Z"
									switch(ini2)
										if("a")
											ini2="A"
										if("b")
											ini2="B"
										if("c")
											ini2="C"
										if("d")
											ini2="D"
										if("e")
											ini2="E"
										if("f")
											ini2="F"
										if("g")
											ini2="G"
										if("h")
											ini2="H"
										if("i")
											ini2="I"
										if("j")
											ini2="J"
										if("k")
											ini2="K"
										if("l")
											ini2="L"
										if("m")
											ini2="M"
										if("n")
											ini2="N"
										if("o")
											ini2="O"
										if("p")
											ini2="P"
										if("q")
											ini2="Q"
										if("r")
											ini2="R"
										if("s")
											ini2="S"
										if("t")
											ini2="T"
										if("u")
											ini2="U"
										if("v")
											ini2="V"
										if("w")
											ini2="W"
										if("x")
											ini2="X"
										if("y")
											ini2="Y"
										if("z")
											ini2="Z"
									if(M.zenni < src.cost)
										M << "You dont have enough zenni"
										src.buying=0
										return
									if(src.guild_name != "")
										M << "This Guild House already belongs to someone"
										return
									src.guild_name = M.guild_name
									M.zenni -= cost
									M << "Purchase Successful!"
									spawn(5)BanSave()
									spawn(7)M.GuildFlag(20,ini1,ini2)
									return
					else
						M << "You must be in a Guild to buy a Guild House"
						return
				else
					if(src.guild_name == M.guild_name)
						M << "Welcome to [src.guild_name] \white Guild House!"
						M.loc = locate(158,31,9)
						M.it_lock = 1
						M.it_blocked = 1
						return
					else
						M << "This Guild House belongs to [src.guild_name]"
						return
		Exit
			Enter(mob/PC/M)
				M.loc = locate(1,1,1)
				M.it_lock = 0
				M.it_blocked = 0
				return