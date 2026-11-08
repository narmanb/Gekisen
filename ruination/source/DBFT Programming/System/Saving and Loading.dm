
//var/NameList=list()
client
	proc
		LoadChar(S)
			screen=null
			if(S==1)
				var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
				F["name"] >> src.mob.name
				F["mob"] >> src.mob
				F["x"] >> src.mob.x
				F["y"] >> src.mob.y
				F["z"] >> src.mob.z

		SaveChar()
			if(!src)return
			if(!src.mob)return
			if(!src.mob.loggedin)return
			if(cantsaveatall)return
			if(src.mob.save_file_1)
				var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
				F["name"] << src.mob.name
				F["mob"] << src.mob
				F["x"] << src.mob.x
				F["y"] << src.mob.y
				F["z"] << src.mob.z
				var/savefile/G=new("Backups Saves/[src.ckey]-Slot 1.sav")
				G["name"] << src.mob.name
				G["mob"] << src.mob
				G["x"] << src.mob.x
				G["y"] << src.mob.y
				G["z"] << src.mob.z

//mob/Logout()
//	src.overlays -= src.auraset
//	..()
//	src.overlays -= src.auraset
//	del(src)
mob/PC/Logout()
	player -= src
	TourneyPeople.Remove(src)
	src.LogOutGM()
	src.overlays -= src.auraset
	src.underlays -= src.underlays
	//src.overlays -= kaioaura
	if(src.in_war)
		if(src.guild_name==guild_war_1)
			guildies1-=1
		if(src.guild_name==guild_war_2)
			guildies2-=1
		GuildWarCheck()
	for(var/obj/Earth_Dragonballs/O1 in src)
		O1.loc = src.loc
	for(var/obj/Namek_Dragonballs/O2 in src)
		O2.loc = src.loc
	for(var/obj/Black_Dragonballs/O3 in src)
		O3.loc = src.loc
	for(var/obj/Equipment/Event_Item/O4 in src)
		O4.loc = src.loc
		player << "<font color = #ea0000>Event Information: <font color = white>[src.name] dropped [O4.name]!"
	if(src.train)
		for(var/obj/ShadowSparImage/A in view(10))
			if(A.owner==src)
				del A
	BudokaiResign(src)
	if(src.in_tourney)
		TourneyPeople.Remove(src)
		tourney_count--
	if(src.challenger)
		src.challenger:WinArena("[src.name]")
//	for(var/obj/Tech/T in world)
//		if(T.owner==src)
//			del(T)
	src<<browse(null)
	del(src)
mob
	var
		tmp
			afktime=0
	proc
		WinArena(T)
			src.loc=locate(410,260,7)
			src.it_lock=0
			src.it_blocked=0
			src.arena_win++
			src.challenger=""
			arena_on=0
			src.in_arena=0
			player << "\yellow Arena Battle: \white [src] has won the challenge against [T]!"
client
	proc
		AutoSave()
			set background=1
			if(src.mob.loggedin&&src.mob.client)
				if(cantsaveatall)return
			//	src<<"<font color=red>Server Information:<font color=white> Character Saved!"
				if(!src)return
				if(!src.mob)return
				if(!src.mob.loggedin)return
				if(cantsaveatall)return
				if(src.mob.save_file_1)
					var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
					F["name"] << src.mob.name
					F["mob"] << src.mob
					F["x"] << src.mob.x
					F["y"] << src.mob.y
					F["z"] << src.mob.z
					var/savefile/G=new("Backups Saves/[src.ckey]-Slot 1.sav")
					G["name"] << src.mob.name
					G["mob"] << src.mob
					G["x"] << src.mob.x
					G["y"] << src.mob.y
					G["z"] << src.mob.z
					//src.mob.afktime+=3
				spawn(4000)src.AutoSave()
				return
