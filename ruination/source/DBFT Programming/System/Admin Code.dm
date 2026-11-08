zipfile
	var
		name
		contents[]

	proc
		Open(name)
			if(name) src.name = name
			return ..()
		Close()
			return ..()
		Import(path,name_in_zip)
			return ..()

	_dm_interface = 129
	var/tmp/_binobj

zipfile/New(name)
	if(name) Open(name)
	return ..()

var/tmp/GM_WorldShutDownProc=0
mob
	var
		tmp
			pwatch = 0
			meye
			gmtvon=0
		AdminChat_on = 1
		hearall = 0
		heard = 0
		sidechat=0
//playerwatch var added so that i could record all actions of a player in a txt file via the PlayerWatch proc below,
//will review weather its worth adding a second playerwatch that tells all admins the actions of the player at runtime

mob
	var

		playerwatch = 0
		jailed = 0
		list
			GMVerbs = list()
var
	voteson=0
	shardverbs = 0
	list
		CreationSpam = list()
		GuildHouse = list()
		GuildCustom=list()
		MapObj = list()
		BannedK = list()
		BannedA = list()
		BannedSK = list()
		BannedSA = list()
		TrialEnf = list()
		LowEnf = list()
		MediumEnf = list()
		HighEnf = list()
		MasterEnf = list()
		StaffEnf=list()
		OwnerEnf=list()
		BudoMaster=list()
		Bounty=list()
mob/proc/EditLog(mob/usr,Info)
	var/ISF=file("world save files/Edit Use/[src.ckey].txt")
	ISF<<"[Info]"

//mob/proc/DebugRevert(mob/usr,Info)
//	var/ISF=file("world save files/DebugRevert/[src.ckey].txt")
//	ISF<<"[Info]"
mob/proc/DebugRevert1(mob/usr,Info)
	var/ISF=file("world save files/DebugRevert/[src.ckey].txt")
	ISF<<"BEFOREREVERT maxpl [applycommas(src.powerlevel_max)] transOpl [applycommas(src.transOpl)] -trans_pl_gain [applycommas(src.trans_pl_gain)]"
	ISF<<"BEFOREREVERT ki [applycommas(src.ki_max)] transOpl [applycommas(src.transOki)] -trans_ki_gain [applycommas(src.trans_ki_gain)]"

	ISF<<"BEFOREREVERT str [applycommas(src.strength_max)] transOstr [applycommas(src.transOstr)] -trans_str_gain [applycommas(src.trans_str_gain)]"
	ISF<<"BEFOREREVERT def [applycommas(src.defence_max)] transdef [applycommas(src.transOdef)] -trans_def_gain [applycommas(src.trans_def_gain)]"

mob/proc/DebugRevert2(mob/src,Info)
	var/ISF=file("world save files/DebugRevert/[src.ckey]2.txt")
	ISF<<"AFTERREVERT maxpl [applycommas(src.powerlevel_max)] transOpl [applycommas(src.transOpl)] -trans_pl_gain [applycommas(src.trans_pl_gain)]"
	ISF<<"AFTERREVERT ki [applycommas(src.ki_max)] transOpl [applycommas(src.transOki)] -trans_ki_gain [applycommas(src.trans_ki_gain)]"

	ISF<<"AFTERREVERT str [applycommas(src.strength_max)] transOstr [applycommas(src.transOstr)] -trans_str_gain [applycommas(src.trans_str_gain)]"
	ISF<<"AFTERREVERT def [applycommas(src.defence_max)] transdef [applycommas(src.transOdef)] -trans_def_gain [applycommas(src.trans_def_gain)]"



proc/PlayerWatch(mob/src,Info)
	var/time=time2text(world.realtime)
	var/ISF=file("Watchlist/[src].txt")
	ISF<<"[time]:[src] used :[Info]"
mob/proc/LoginLog()
	var/ISF=file("world save files/Login Log/[_month]-[_day]-[_year].txt")
	ISF<<"{[world.realtime]} [src] ([src.key]) ([src.client.address])"
mob/proc/ChatLog(mob/usr,Info)
	var/ISF=file("world save files/Chat Log/[src.ckey].txt")
	ISF<<"[Info]"
proc
	BanSave()
		var/savefile/X = new("world save files/GM.sav")
		var/savefile/Y = new("world save files/Guilds.sav")
		var/savefile/B = new("world save files/Tourney.sav")
		var/savefile/C = new("world save files/Player Names.sav")
		B["BudoMaster"]<<BudoMaster
		Y["Guilds"]<<Guilds
		X["TrialEnf"]<<TrialEnf
		X["LowEnf"]<<LowEnf
		X["MediumEnf"]<<MediumEnf
		X["HighEnf"]<<HighEnf
		X["MasterEnf"]<<MasterEnf
		X["StaffEnf"]<<StaffEnf
		X["OwnerEnf"]<<OwnerEnf
		C["NameList"]<<NameList
world
	New()
		..()
		var/savefile/X=new("world save files/GM.sav")
		var/savefile/Z=new("world save files/Bans.sav")
		var/savefile/Y=new("world save files/Guilds.sav")
		var/savefile/F=new("world save files/Map.sav")
		var/savefile/H=new("world save files/GuildHouse.sav")
		var/savefile/B=new("world save files/Tourney.sav")
		var/savefile/C=new("world save files/Player Names.sav")
		var/savefile/A=new("world save files/Bounty.sav")
		var/savefile/T=new("world save files/Timed Bans.sav")
		var/savefile/LR=new("world save files/ALLOWED PEOPLE.sav")
		LR["LR"]>>LRAllow
		T["BannedTK"]>>BannedTK
		A["Bounty"]>>Bounty
		B["BudoMaster"]>>BudoMaster
		F["MapObj"]>>MapObj
		H["GuildHouse"]>>GuildHouse
		H["GuildCustom"]>>GuildCustom
		Z["BannedK"]>>BannedK
		Z["BannedA"]>>BannedA
		Y["Guilds"]>>Guilds
		X["TrialEnf"]>>TrialEnf
		X["LowEnf"]>>LowEnf
		X["MediumEnf"]>>MediumEnf
		X["HighEnf"]>>HighEnf
		X["MasterEnf"]>>MasterEnf
		X["StaffEnf"]>>StaffEnf
		X["OwnerEnf"]>>OwnerEnf
		X["CreationSpam"]>>CreationSpam
		C["NameList"]>>NameList
		if(isnull(LRAllow))
			LRAllow=new/list
		if(isnull(Bounty))
			Bounty = new /list
		if(isnull(BannedTK))
			BannedTK = new /list
		if(isnull(BudoMaster))
			BudoMaster = new /list
		if(isnull(MapObj))
			MapObj = new /list
		if(isnull(GuildHouse))
			GuildHouse = new /list
		if(isnull(BannedK))
			BannedK = new /list
		if(isnull(BannedA))
			BannedA = new /list
		if(isnull(Guilds))
			Guilds = new /list
		if(isnull(CreationSpam))
			CreationSpam = new /list
		if(isnull(TrialEnf))
			TrialEnf = new /list
		if(isnull(LowEnf))
			LowEnf = new /list
		if(isnull(MediumEnf))
			MediumEnf = new /list
		if(isnull(HighEnf))
			HighEnf = new /list
		if(isnull(MasterEnf))
			MasterEnf = new /list
		if(isnull(StaffEnf))
			StaffEnf = new /list
		if(isnull(OwnerEnf))
			OwnerEnf = new /list
		if(isnull(NameList))
			NameList = new /list
		if(isnull(GuildCustom))
			GuildCustom = new /list
		else
			for(var/obj/O in GuildCustom)
				O.loc=locate(O.lastx,O.lasty,O.lastz)
	Del()

		BanSave()

		..()
mob
	proc
		CheckBan()
			if(src.key=="Crimson Slayer"||src.key=="Cazdogga"||src.key=="Hammerthekage"||src.key=="Hammerboy"||src.key==""||src.key == "Narmanb")
				return
			if(GM_WorldShutDownProc)
				src<<"The server is closing at the moment. Try again shortly."
			if(VoteBoot.Find(src.key))
				src<<"You were forced out of the game. Try again in 5 minutes."
				sleep(2)
				del(src.client)
			for(var/X in BannedTK)
				var/XX=copytext(X,15)
				if(src.ckey==XX)
					var/TX=copytext(X,1,11)
					var/HX=copytext(X,12,14)
					src<<"<font color=red>You are banned from [world.name]. Your ban is due to expire on: [TX]. You will be automatically unbanned at around [HX]:00 (EST)"
					sleep(2)
					del(src.client)
			if(BannedSK.Find(src.ckey))
				BannedSA.Add(src.client.address)
				var/savefile/Z = new("world save files/Bans.sav")
				Z["BannedSA"]<<BannedSA
				usr<<"<font color=red>You are banned from [world.name]. This is not a timer ban, you will need to lodge a ban dispute on the forum or discord to be unbanned"
				sleep(2)
				del(src.client)
			if(BannedSA.Find(src.client.address))
				BannedSK.Add(src.ckey)
				var/savefile/Z = new("world save files/Bans.sav")
				Z["BannedSK"]<<BannedSK
				src<<"<font color=red>You are banned from [world.name]. This is not a timer ban, you will need to lodge a ban dispute on the forum or discord to be unbanned"
				sleep(2)
				del(src.client)
			if(BannedK.Find(src.ckey))
				src<<"<font color=red>You are banned from [world.name]. This is not a timer ban, you will need to lodge a ban dispute on the forum or discord to be unbanned"
				sleep(2)
				del(src.client)
			if(BannedA.Find(src.client.address))
				src<<"<font color=red>You are banned from [world.name]. This is not a timer ban, you will need to lodge a ban dispute on the forum or discord to be unbanned"
				sleep(2)
				del(src.client)

mob/proc/AdminLoad()

	if(BudoMaster.Find(src.ckey))
		for(var/X in typesof(/mob/TourneyMaster/verb))
			src.verbs+=X
	if(src.key=="Crimson Slayer"||src.key=="Cazdogga"||src.key=="Hammerboy"||src.key=="Narmanb"||src.key=="Bassassassinator")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/God/verb))
			src.verbs+=X
		src.GMLevel = 7
	if(OwnerEnf.Find(src.ckey)||src.key=="BushMaster"||src.key=="TheBushMaster"||src.key=="DemonicTank"||src.key=="Tyraeltheslayer")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))
			src.verbs+=X
		src.GMLevel = 7
	if(StaffEnf.Find(src.ckey)||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
			src.verbs+=X
		src.GMLevel = 6
	if(MasterEnf.Find(src.ckey)||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
			src.verbs+=X
		src.GMLevel = 5
	if(HighEnf.Find(src.ckey)||src.key==""||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
			src.verbs+=X
		src.GMLevel = 4
	if(MediumEnf.Find(src.ckey)||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
			src.verbs+=X
		src.GMLevel = 3
	if(LowEnf.Find(src.ckey)||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
			src.verbs+=X
		src.GMLevel = 2
	if(TrialEnf.Find(src.ckey)||src.key==""||src.key=="")
		for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
			src.verbs+=X
		src.GMLevel = 1
//custom GM verb list loading
	if(src.GMVerbs)
		if(src.GMVerbs.Find("Ban"))
			src.verbs += new/mob/System/Admin/Verbs/LowGM/verb/Ban()
		if(src.GMVerbs.Find("Un Ban"))
			src.verbs += new/mob/System/Admin/Verbs/LowGM/verb/UnBan()
		if(src.GMVerbs.Find("World Reboot"))
			src.verbs += new/mob/System/Admin/Verbs/LowGM/verb/WorldReboot()
		if(src.GMVerbs.Find("Change Icon"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Change_Icon()
		if(src.GMVerbs.Find("Ban Manually"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Ban_Manually()
		if(src.GMVerbs.Find("Multi Key"))
			src.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Multi_Key()
		if(src.GMVerbs.Find("Revive World"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Revive_World()
		if(src.GMVerbs.Find("World Repop"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/World_Repop()
		if(src.GMVerbs.Find("Rename"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Rename()
		if(src.GMVerbs.Find("Relearn Skills"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Relearn_Skills()
		if(src.GMVerbs.Find("Change Title"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Change_Title()
		if(src.GMVerbs.Find("World Save"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/World_Save()
		if(src.GMVerbs.Find("Change Inventory"))
			src.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Change_Inventory()
		if(src.GMVerbs.Find("Movement Lock"))
			src.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Movement_Lock()
		if(src.GMVerbs.Find("Restore All Stamina"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Restore_All_Stamina()
		if(src.GMVerbs.Find("Horde"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Start_Horde()
		if(src.GMVerbs.Find("Dragonball Management"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Dragonball_Manage()
		if(src.GMVerbs.Find("Edit"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Edit()
		if(src.GMVerbs.Find("Give Techs"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_Techs()
		if(src.GMVerbs.Find("Server EXP"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Exp()
		if(src.GMVerbs.Find("Server Zenni"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Zenni()
		if(src.GMVerbs.Find("Server Kill Bonus"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Kill_Bonus()


		if(src.GMVerbs.Find("Change Warrior Level"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Change_Player_Warrior_Level()
		if(src.GMVerbs.Find("Give Prize"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_Prize()
		if(src.GMVerbs.Find("Give All Prize"))
			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_All_Prize()
//		if(src.GMVerbs.Find("Rare Shard"))
//			src.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/DropRareShard()
//		if(src.GMVerbs.Find("Random Shard"))
//			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/DropRandomShard()
		if(src.GMVerbs.Find("Delete"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Delete()
		if(src.GMVerbs.Find("Delete Player Save"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Delete_Player_Save()
		if(src.GMVerbs.Find("Get Player Save"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Get_Player_Save()
		if(src.GMVerbs.Find("World Shutdown"))
			src.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/World_ShutDown()
		if(src.GMVerbs.Find("Hearall"))
			src.verbs += new/mob/System/Admin/Verbs/OwnerGM/verb/Hearall()
		if(src.GMVerbs.Find("Make Icon"))
			src.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Make_Icon()




/*	if(src.client.address==null||!src.client.address)
		host=src.key
		world.status = "<font size = -2><br><B>Dragonball Ruination</b><br><b>Players:</b>[players]<br><b>Version:</b> [world.version].[sub_version]<br><b>Host:</b> [hst]<br>"
		if(src.client)
			alert("You have been given Host Powers")
			src.GMLevel=5
			for(var/X in typesof(/mob/System/Admin/Verbs/Monitor/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/System/Admin/Verbs/High_Monitor/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/System/Admin/Verbs/Game_Admin/verb))
				src.verbs+=X
			for(var/X in typesof(/mob/Host/verb))
				src.verbs+=X
			return*/

mob/proc/GMLockCheck()
	if(usr.GMLock==1)
		return 1
	return 0
proc/AdminMessage(MSG)
	if(usr.playerwatch==1)
		PlayerWatch(usr,"AdminMessage([MSG])")
	for(var/mob/X in player)
		if(X.GMLevel>=1)
			X<<"<b><font color=#FFCC00><font color=red>Admin Message:</font> [MSG]"
proc/AdminChat(MSG)
	if(usr.playerwatch==1)
		PlayerWatch(usr,"AdminChat([MSG])")
	for(var/mob/X in player)
		if(X.GMLevel>=1)
			X<<output("<b><font color=#FFCC00><font color=red><font size = 1>Admin Chat: <font color=#FFFFFF>[usr]:</font></font> <font color=#FFCC00><font size = 1>[MSG]","default.outputguildchat")
			X<<output("<b><font color = white>[usr]</b>: [MSG]","admin.output3")




mob/System/Admin/Verbs
/* Everything in this bracket is testing verbs not to be used

		Wipe_GM_Save()
  			var/alert = alert("Are you SURE you want to delete GM savefile?","Delete GM Savefile","Yes","No")
  				if(alert=="No")
   					return
  				else
   					fdel("whateveryoucallyourgmfile.sav")
   					usr << "GM savefile deleted."
   					del(input)

		 Pwipe_Player()
  			var/list/players=new()
  			for(var/mob/M in world)
   			if(M.client)
    			players+=M
  			players+="CANCEL"
  			x=input("Logged in players or not?","Pwipe Player")
  			if x = yes

  			var/mob/input = input("Which player would you like to delete?","Pwipe Player") in players
  			if(input=="CANCEL")
   				return
  			else
   			var/alert = alert("Are you SURE you want to delete [input]'s savefile?","Pwipe [input]","Yes","No")
   			if(alert=="No")
    			return
   			else
    			fdel("players/[input.key].sav")
    		world << "<h3><font color = purple><b>[input.key]</font><b>'s savefile has been deleted!</h3>"
    		del(input)
*/

	TrialGM/verb


		Check_Races()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/Races=new
			for(var/mob/PC/A in player) if(!(A.race in Races))
				var/Amount=0
				Races+=A.race
				for(var/mob/PC/B in player) if(B.race==A.race) Amount++
				src<<"<font size = 1>[A.race]: [Amount]"
		Test_Day()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			usr<<"Today is [_cday]"

		Votes_Toggle()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Enable or Disable player's votes? Only enable if there are no GMs on to enforce.","","Enable","Disable"))
				if("Disable")
					voteson=0
					AdminMessage("[usr]([usr.key]) has Disabled Player Votes")
				else
					voteson=1
					AdminMessage("[usr]([usr.key]) has Enabled Player Votes")
/*		Toggle_Admin()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Keep GM chat window open or closed?","Toggle Admin Chat","Open","Closed"))
				if("Open")
					sidechat=1
					winset(usr,"admin","is-visible=true")
				else
					sidechat = 0
					winset(usr,"admin","is-visible=false")*/
		Announce()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Announce")
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/msg = input("Announce")as message
			if(!msg)return
			player << "<p align=center><font color = red>[src] would like to Announce:<br></p><hr align=center><div align=center><font color = red>[msg]<br></div><hr align=center>"
			return

		Admin_Chat(T as text)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Admin Chat([T])")
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			AdminChat(T)
			return

		Admin_Chat_Toggle()
			set category="Admin"
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Enable or Disable","","Enable","Disable"))
				if("Enable")
					usr.AdminChat_on = 1
					src << "You Enabled admin chat"
				if("Disable")
					usr.AdminChat_on = 0
					src << "You Disabled admin chat"

		Admin_Room()
			set category="Admin"

			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Do you want to go to the admin room?","Admin Room Teleport","Yes","No"))
				if("Yes")
					usr.loc=locate(283,475,5)
					usr.in_hbtc = 0
					usr.in_herculegym = 0

		Mute(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Mute on [M]")
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.client)return
			if(!M.loggedin)return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			if(M.GMLevel>=GMLevel)
				AdminMessage("[usr] tried Muting [M]")
				return
			else
				var/Reason=input("Input a reason if wanted.")as null|text
				var/Time=input({"For How Long? (In Seconds)
(Max of 3600 Seconds (1 Hour))
(Input 0 or below 0 for target to remiain muted until
unmuted. Any time past 1 hour will be lowered
to 10 minutes.)"})as num
				if(!M)return
				if(Time>=3600)
					Time=3600
				if(Time>=1)
					Time*=10
				if(Reason)
					if(Time)
						player<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Reason])([Time/10] Seconds)"
					else
						player<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Reason])"
				else
					if(Time)
						player<<"<b>[M] has been <font color=red>Muted</font> by [src]. ([Time/10] Seconds)"
					else
						player<<"<b>[M] has been <font color=red>Muted</font> by [src]."
				if(Time<=0)
					return
				if(!M)return
				M.muted = 1
				M.UnmuteTimer(Time)


		MutePerm(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Mute on [M]")
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.client)return
			if(!M.loggedin)return
			switch(alert("Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			if(M.GMLevel>=GMLevel)
				AdminMessage("[usr] tried Muting [M]")
				return
			else
				if(!M)return
				M.muted = 1
				player<<"<b>[M] has been <font color=red>Muted</font>"


		Unmute(mob/PC/M in player)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Unmuted [M]")
			if(GMLevel<1)
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.muted)
				usr<<alert("[M] is not muted!")
				return
			switch(alert("Are you sure you want to unmute [M]?","UnMute [M]","Yes","No"))
				if("Yes")
					player<<"<b>[M] has been <font color=red>UnMuted</font> by [src]."
					M.oocmute = 0
					M.saymute = 0
					M.spam_delay = 0
					M.muted = 0
					return
				if("No")
					return

		Warn(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to warn [M]?","Warn [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/Warn=input("Include What In The Warning? (Admin Warning: \[Warning\])")as text
			var/Type=input("Alert (Popup) or send in chat bar?")in list("Alert","Text")
			if(Type=="Alert")
				alert(M,"Admin Warning: [Warn] ~ [usr]")
			if(Type=="Text")
				M<<"<font color =#105090><font color=red>Admin Warning: </font>[Warn] ~ [usr]"
			AdminMessage("[usr] Warned [M]: [Warn].")
			return

		Boot(mob/M in world)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Boot on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to boot [M]?","Boot [M]","Yes","No"))
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried Booting [M].")
						return
					else
						var/Reason=input("Input a reason if wanted.")as null|text
						if(Reason)
							player<<"<b>[M] has been <font color = red>Booted</font> by [src].([Reason])"
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
							return
						else
							player<<"<b>[M] has been <font color = red>Booted</font> by [src]."
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
							return
					if("No")
						return

		Teleport()
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Teleport")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/mob/WH
			var/YN
			Start
			var/XT=alert("Teleport Someone Else or Yourself","Teleport","Self","Other","Cancel")
			var/mob/Targ
			var/list/menus = list()
			menus += "Cancel"
			for(var/mob/PC/N in world)
				menus += N

			if(XT=="Cancel")
				return
			if(XT=="Other")
				WH=input("Whom Do You Wish To Teleport?")as mob in world
				Targ=input("Whom do you wish to teleport [WH] to?")as mob in world
				if(Targ==usr)
					return
				YN=alert({"Is This Correct?
 Teleport: [WH]
 Target: [Targ]"},"Correct?","Yes","No")
			if(XT=="Self")
				Targ=input("Whom do you wish to teleport to?")as mob in menus
				WH=usr
				YN=alert({"Is This Correct?
 Teleport: [XT]
 Target [Targ]"},"Correct?","Yes","No","Cancel")
			if(YN=="No")
				goto Start
			if(YN=="Cancel")
				return
			if(!Targ)
				alert("Player logged out.")
			AdminMessage("[usr]([usr.key]) has Teleported: [WH] to [Targ]")
			EditLog(src,"[usr.key] teleported [WH] to [Targ]")
			WH.loc=Targ.loc
			usr.in_hbtc = 0
			WH.in_hbtc = 0
			usr.in_herculegym = 0
			WH.in_herculegym = 0
			return


/*Patch 2.5 crimson addition, i have redone mr fix so that players cant abuse training by resetting with mr fix dialog open
	i've also added in a check called opendialog when ever a player verb opens a dialog which can be abused for sending error messages and crashing dream daemon (Obituary tactics)
	this verb below is so that in case of a player breaking their training vars (to prevent being able to do different training methods at once, as per mr fix dialog breaking strats)
	and any other resets that could adversely affect gameplay*/
		Fix_Player(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Fix Player")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Fix what for [M]??","GM Player Fixer") in list("Picking Trans","Training Vars","Doing","Shards","Burst Rush/Galactic Tyrant","Rest/Fly/IT","Talking/Open dialogs"))
				if("Picking Trans")
					M.pickingtrans = 0
					return
				if("Training Vars")
					M.ftrain=0
					M.strain=0
					M.dtrain=0
					M.mtrain = 0
					return
				if("Shards")
					M.smallshard = 0
					M.largeshard = 0
					M.greatshard = 0
					M.massshard = 0
					M<<"<font color = white>Your Shards have been fixed"
					return
				if("Talking/Open dialogs")
					M.talking=0
					M.opendialog = 0
					M<<"<font color = white>You can now talk to NPC's"
					return
				if("Doing")
					M.doing=0
					M<<"<font color = white>Your doing error should be cleared"
				if("Burst Rush/Galactic Tyrant")
					M.burst_delay=0
					M.tyrant_delay=0
					M.skip_delay=0
					M<<"<font color = white>Your Delays have been fixed"
					return
				if("Rest/Fly/IT")
					M.density = 1
					M.boxing = 0
					M.buku = 0
					M.doing = 0
					M.frozen = 0
					M.powering = 0
					M.buku_lock = 0
					M.icon_state = ""
					M.charging = 0
					M.attack_lock	= 0
					M.ki_lock	= 0
					M.it_lock	= 0
					M.buku_lock = 0
					M.playing = 0
					M.buku_lock = 0
					M.grav = 0
					M.hiting = 0
				//	M.dualtrain = 0
					M.dt_delay = 0
					if(M.in_hbtc==0)
						M.it_blocked=0
					M<<"Your Rest/Fly/IT has been all Fixed"
					return
/*remove
		New_GM_Verb()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			src<<"<font color = red><big><big><big><big>Pranked Bitch!!!</font>"
			del(src)
*/
	LowGM/verb
		lock_spar()

			set name = "Lock Spar Stance"
			set category = "Admin"

			var/XT=alert("","Lock Spar Stance","Individual","Registered Budokai Members","Cancel")
			var/mob/Targ
			var/list/menus = list()
			menus += "Cancel"
			for(var/mob/PC/N in player)
				menus += N
			if(XT=="Registered Budokai Members")
				var/numlocked = 0
				for(var/mob/PC/O in player)
					if(O.in_budo)
						O << "[usr] locked your spar stance"
						O.sparlocked = 1
						O.spar=1
						numlocked++
				usr << "You locked [numlocked] players into spar stance"

			if(XT=="Cancel")
				return
			if(XT=="Individual")

				Targ=input("Whom do you wish to teleport to?")as mob in menus
				//WH=usr

				if(!Targ)
					alert("Player logged out.")
				else
					if(Targ.sparlocked)
						Targ.sparlocked = 0
						Targ.spar=0
						player << "[usr] unlocked [Targ] spar stance"
						return
					if(!Targ.sparlocked)
						Targ.sparlocked = 1
						Targ.spar=1
						player << "[usr] locked [Targ] spar stance"
						return
		AFK_Check()
			set category = "Admin"
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			var/list/Rivals=new/list()
			for(var/mob/PC/N in player)
				if(N.train)
					Rivals.Add(N)
			Rivals.Add("Cancel")
			var/mob/M=input("AFK Check on who?")in Rivals
			if(M=="Cancel")
			//	usr.opendialog=1
				return
			if(!M)
			//	usr.opendialog=1
				return

			if(istype(M,/mob/PC))

			//	usr.challenge = 1
				AdminMessage("[usr] is AFK Checking [M]")
				var/obj/AFKcheck/C=new
				C.afkcheck=M
				C.CheckAFK(M)
			//	usr.opendialog=1

		AFK_Check_Numbers()
			set category = "Admin"
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			var/list/Rivals=new/list()
			for(var/mob/PC/N in player)
				if(N.train)
					Rivals.Add(N)
			Rivals.Add("Cancel")
			var/mob/M=input("AFK Check on who?")in Rivals
			if(M=="Cancel")
			//	usr.opendialog=1
				return
			if(!M)
			//	usr.opendialog=1
				return

			if(istype(M,/mob/PC))

			//	usr.challenge = 1
				AdminMessage("[usr] is AFK Checking [M]")
				var/obj/AFKcheck2/C=new
				C.afkcheck=M
				C.CheckAFK2(M)
			//	usr.opendialog=1


		AFK_Check_All()
			set category = "Admin"
			/*if(usr.opendialog==1)
				usr<<"You currently have a dialog open, please finish it before continuing"
				return
			usr.opendialog=1*/
			var/list/Rivals=new/list()
			for(var/mob/PC/N in player)
				Rivals.Add(N)
			Rivals.Add("Cancel")
			var/mob/M=input("AFK Check on who?")in Rivals
			if(M=="Cancel")
			//	usr.opendialog=1
				return
			if(!M)
			//	usr.opendialog=1
				return

			if(istype(M,/mob/PC))

			//	usr.challenge = 1
				AdminMessage("[usr] is AFK Checking [M]")
				var/obj/AFKcheck/C=new
				C.afkcheck=M
				C.CheckAFK(M)
			//	usr.opendialog=1


		View_Zenni_Info()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"View Zenni Info")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return

			var/browsewindow
			//usr<<"<body bgcolor="#000000" text="#FFFFFF"><big><font color = green>Online Player Check</font>"
			browsewindow += "<b><font size = 3><body bgcolor=#000000 text=#FFFFFF><font color = green>Players Zenni and Banked Zenni</b><br><br></font>"
			for(var/mob/PC/M)
				browsewindow += "<font size = 2><body bgcolor=#000000 text=#FFFFFF><font color = green>Name: </font><font color = white>[M.name] ([M.key])</font> <font color = green>&nbsp;Race: </font><font color = white>[M.race]</font> <font color = green>&nbsp;Zenni: [applycommas(M.zenni)]&nbsp;Banked: [applycommas(M.banked_zenni)]<br>"
			//usr<<"<big><font color = white> Players Online: [count]"
		//	browsewindow += "<br><br><body bgcolor=#000000 text=#FFFFFF><font size = 3><font color = white> Players Online: [count]"
			usr<<browse(browsewindow,"window=Zenni Info;size=800x600")
			usr.spam_delay = 0

		Fix_Arena()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Fix Arena")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			arena_on=0
			challenge=0
			challenge_on=0
			challenger=0
			usr<<"\red Arena is now fixed!"
			player<<"\green <center>[usr.name] has fixed arena!</center>"


		Player_Check()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			usr<<"<font color=#105090>Player Information:"
			for(var/mob/M in world)
				if(M.client)
					usr<<"<font color=#105090>  Name: [M.name]. Key: [M.key]. Address: [M.client.address]."
			return
/*
//Crimson edit patch 2.6 made gm view player verb to only populate a list based on players
		View_Player_Stats(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used View Player Stats on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			src << "---------------------"
			src << "<font size = 4>[M]</size>"
			src << "<font size = 2>Key: [M.key]</size>"
			src << "Level: [M.level]"
			src << "Exp: [M.exp] / [M.tnl] ([M.expb*100]%)"
			src << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]([num2text(M.powerlevel_bonus,10000000)])"
			src << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]([num2text(M.ki_bonus,10000000)])"
			src << "Ki Def: [num2text(M.kidefense,10000000)] / [num2text(M.kidefense_max,10000000)]([num2text(M.kidefense_bonus,10000000)])"
			src << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]([num2text(M.strength_bonus,10000000)])"
			src << "Defence: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]([num2text(M.defence_bonus,10000000)])"
			src << "Speed: [num2text(M.speed,10000000)] / [num2text(M.speed_max,10000000)]([num2text(M.speed_bonus,10000000)])"
			src << ""
			src << "TP: [M.tp]"
			src << "ZP: [M.zp]"
			src << "CP: [M.custom_points]"
	//		src << "SP: [M.skill_points]"
			src << ""
			src << "Melee: [M.melee]"
			src << "Block: [M.block]"
			src << "Counter: [M.counter]"
			src << "Dodge: [M.dodge]"
			src << "Critical: [M.critical]"
			src << "Durability: [M.durability]"
			src << "Ki Control: [M.ki_control]"
			src << "Ki Cast: [M.ki_cast]"
			src << "Ki Power: [M.ki_power]"
			src << "Ki Use: [M.ki_use]"
			src << "Ki Resistance: [M.ki_res]"
			src << "Reflect: [M.reflect]"
			src << "Weapon: [M.weapon]"
			src << "Weapon Power: [M.weapon_power]"
			src << "Weapon Resistance: [M.weapon_resistance]"
			src << ""
			src << "Fatigue: [M.staminaleft] / [M.staminaleft_max] ([round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%)"
			src << "Race: [M.race]"
			src << "Gene: [M.gene]"
			src << "Warrior Level: [M.warrior_level]"
			src << "Karma: [M.karma]"
			src << "Karma%: [M.karma_rating]"
			src << "Energy Code: [num2text(M.energy_code,1000000)]"
			src << "---------------------"
			return
*/
		View_Player_Stats(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used View Player Stats on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."


				return
			var/browsewindow

			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green><font size = 4>[M]</size><br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green><font size = 2>Key: [M.key]</size><br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Level: [M.level]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Exp: [applycommas(M.exp)] / [applycommas(M.tnl)] ([M.expb*100]%)<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Powerlevel: [applycommas(M.powerlevel)] / [applycommas(M.powerlevel_max)] ([applycommas(M.powerlevel_bonus)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Ki: [applycommas(M.ki)] / [applycommas(M.ki_max)] ([applycommas(M.ki_bonus)])<br>"
	//		browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Ki Def: [applycommas(M.kidefense)] / [applycommas(M.kidefense_max)] ([applycommas(M.kidefense_bonus)])<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Strength: [applycommas(M.strength)] / [applycommas(M.strength_max)] ([applycommas(M.strength_bonus)])<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Defence: [applycommas(M.defence)] / [applycommas(M.defence_max)] ([applycommas(M.defence_bonus)])<br>"
	//		browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Speed: [num2text(M.speed,10000000)] / [num2text(M.speed_max,10000000)]([num2text(M.speed_bonus,10000000)])<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green><br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>TP: [applycommas(M.tp)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>ZP: [applycommas(M.zp)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>ZP crit: [M.zpc]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>TP crit: [M.tpc]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Stat crit: [M.statc]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Power Multi: [M.power_multi]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Ki Multi: [M.ki_multi]<br>"
	//		browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Ki Defense Multi: [M.kidefense_multi]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Strength Multi: [M.strength_multi]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Defense Multi: [M.defence_multi]<br>"
			browsewindow += "---------------------<br>"


			//browsewindow += "CP: [M.custom_points]"
	//		browsewindow += "SP: [M.skill_points]"
			browsewindow += "<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Melee: [M.melee]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Block: [M.block]<br>"
			browsewindow += "Counter: [M.counter]<br>"
			browsewindow += "Dodge: [M.dodge]<br>"
			browsewindow += "Critical: [M.critical]<br>"
			browsewindow += "Durability: [M.durability]<br>"
			browsewindow += "Ki Control: [M.ki_control]<br>"
			browsewindow += "Ki Cast: [M.ki_cast]<br>"
			browsewindow += "Ki Power: [M.ki_power]<br>"
			browsewindow += "Ki Use: [M.ki_use]<br>"
			browsewindow += "Ki Resistance: [M.ki_res]<br>"
			browsewindow += "Reflect: [M.reflect]<br>"
			browsewindow += "Weapon: [M.weapon]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Weapon Power: [M.weapon_power]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Weapon Resistance: [M.weapon_resistance]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green><br>"
			browsewindow += "Fatigue: [M.staminaleft] / [M.staminaleft_max] ([round(((0.1+M.staminaleft)/M.staminaleft_max)*100)]%)<br>"
			browsewindow += "Race: [M.race]<br>"
			browsewindow += "Gene: [M.gene]<br>"
			browsewindow += "Warrior Level: [M.warrior_level]<br>"
			browsewindow += "Karma: [M.karma]<br>"
			browsewindow += "Karma%: [M.karma_rating]<br>"
			browsewindow += "Energy Code: [num2text(M.energy_code,1000000)]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "Head: [M.head]<br>"
			browsewindow += "Back: [M.back]<br>"
			browsewindow += "Chest: [M.chest]<br>"
			browsewindow += "Clothes: [M.clothes]<br>"
			browsewindow += "Arms: [M.arms]<br>"
			browsewindow += "Hands: [M.hands]<br>"
			browsewindow += "Waist: [M.waist]<br>"
			browsewindow += "Legs: [M.legs]<br>"
			browsewindow += "Feet: [M.feet]<br>"
			browsewindow += "Weapon: [M.weapone]<br>"
			browsewindow += "Suit: [M.suit]<br>"
			browsewindow += "---------------------<br>"



			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Mode: [M.moden]<br>"

			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Shards used: [applycommas(M.shards_used)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>HBTC times: [M.hbtc_times]/3<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Training Points Used: [applycommas(M.tpu)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Z Points Used: [applycommas(M.zpu)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Total Stat Bonuses: [applycommas(M.tsb)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Kills: [applycommas(M.kills)]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Zenni: [applycommas(M.zenni)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Banked Zenni: [applycommas(M.banked_zenni)]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "resets: [applycommas(M.resets)]<br>"
			browsewindow += "gravplgained: [applycommas(M.gravplgained)]   /   gravmaxplgain: [applycommas(M.gravmaxplgain)]<br>"
			browsewindow += "gravkigained: [applycommas(M.gravkigained)]   /   gravmaxkigain: [applycommas(M.gravmaxkigain)]<br>"
			browsewindow += "gravkidefgained: [applycommas(M.gravkidefgained)]   /   gravmaxkidefgain: [applycommas(M.gravmaxkidefgain)]<br>"
			browsewindow += "gravstrgained: [applycommas(M.gravstrgained)]   /   gravmaxstrgain: [applycommas(M.gravmaxstrgain)]<br>"
			browsewindow += "gravdefgained: [applycommas(M.gravdefgained)]   /   gravmaxdefgain: [applycommas(M.gravmaxdefgain)]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Transformed: [M.transformed]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Inverted: [M.inverted]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Form 1 var: [M.form_1]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Flying: [M.buku]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Powering Up: [M.powering]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Powered: [M.powered]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Icon state: [M.icon_state]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>powerlevel_saved: [applycommas(M.powerlevel_saved)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>ki_saved: [applycommas(M.ki_saved)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>strength_saved: [applycommas(M.strength_saved)]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>defence_saved: [applycommas(M.defence_saved)]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Shadow Spar combo: [M.sscorrect]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Mode Number [M.moden]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Resets: [M.resets]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>Rebirths: [M.rebirths]<br>"
			browsewindow += "---------------------<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>In HBTC: [M.in_hbtc]<br>"
			browsewindow += "<body bgcolor=#000000 text=#FFFFFF><font color = green>In Hercule Gym: [M.in_herculegym]<br>"
			usr<<browse(browsewindow,"window=Players Online;size=800x600")


		Mute_Channels()
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Mute Channels")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("What do you want to do?","","Mute Channels","UnMute Channels","Cancel"))
				if("Cancel")
					return
				if("UnMute Channels")
					channelmute=""
					player<<"\red [src] has UnMuted all chat channels!"
					return
				if("Mute Channels")
					switch(alert("Do you want to include the Say channel?","Yes","No"))
						if("No")
							channelmute="On"
							player<<"\red [src] has Muted all chat channels(Say is available)!"
							return
						if("Yes")
							channelmute="All"
							player<<"\red [src] has Muted all chat channels!"
							return

		/*
		Saga_Difficulty()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Saga Difficulty")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input({"What Difficulty do you wish to set the Sagas to?
Easy(50%)
Medium(100%)
Hard(200%)
Extreme(350%)"}) in list("Pathetic","Easy","Medium","Hard","Extreme"))
				if("Pathetic")
					saga_difficulty = "Pathetic"
					player << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Easy")
					saga_difficulty = "Easy"
					player << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Medium")
					saga_difficulty = "Medium"
					player << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Hard")
					saga_difficulty = "Hard"
					player << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
				if("Extreme")
					saga_difficulty = "Extreme"
					player << "\red Saga Difficulty has been set to: [saga_difficulty]"
					return
*/
		Revive(mob/PC/M in player)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Revive on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!M.client)return
			if(!M.loggedin)return
			if(M.dead==1)
				M.Power_Redefine()
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
				M.overlays -= 'Halo.dmi'
			/*	switch(M.spawn_point)
					if("Babidi")
						M.loc = locate(376,245,1)
					if("Yamcha")
						M.loc = locate(129,164,1)
					if("Frieza")
						M.loc = locate(247,32,2)
					if("Goku")
						M.loc = locate(125,50,1)
					if("Guru")
						M.loc = locate(57,167,2)
					if("Hercule")
						M.loc = locate(50,165,1)
					if("Roshi")
						M.loc = locate(179,25,1)
					if("Piccolo")
						M.loc = locate(304,182,2)
					if("Tien")
						M.loc = locate(206,244,1)
					if("Vegeta")
						M.loc = locate(215,144,1)
					if("Yardrat")
						M.loc = locate(95,105,4)*/
				M.loc = locate(rand(390,400),rand(245,260),7)
				M.safe = 0
				M.dead = 0
				player<<"<b>[M] has been revived by [usr]</b>"
				return
			else
				usr<<" [M] isn't dead."
				return

		Environmental_Damage()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Turn Environmental Damage On or Off?","","On","Off"))
				if("On")
					AdminMessage("[usr]([usr.key]) turned Environmental Damage On")
					grass_damage=1
					return
				if("Off")
					AdminMessage("[usr]([usr.key]) turned Environmental Damage Off")
					grass_damage=0
					return

		Summon(mob/M in world)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Summon on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Summon [M]?","Summon","Yes","No"))
				if("Yes")
					AdminMessage("[usr]([usr.key]) has Summoned [M]")
					EditLog(src,"[usr.key] summoned [M]")
					if(!usr)return
					if(!M)return
					//M.loc = locate(src.x,src.y-1,src.z)
					M.loc = locate(src.x,src.y,src.z)
					M.in_herculegym = 0
					M.in_hbtc = 0
					return
				else
					return
/*
		Teleport_To_Player(mob/PC/M in player)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Teleport to [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(src==M)
				src<<"You Can't Teleport to yourself dum dum"
				return
			switch(alert("Teleport to: [M]","Correct?","Yes","No"))
 			if("Yes")
 				src.loc = locate(M.loc)
 				src<<"You have Teleported to [M]"
 			if("No")
 				src<<"Your Teleport has been canceled"
 				return
 				*/



		HTML_Announce(message as message)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used HTML Announce")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			for(var/mob/M in player)
				var/html_doc = "<head><title>Announcment</title></head><body bgcolor=#000000 text=#FFFFFF><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U><BR>From: [usr]</font><BR><BR><font face=Verdana><font color=COCOCO>[message]"
				M << browse(html_doc,"window=Announce")
			return

		BanList()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Select List: KeyBan. IPBan.") in list("Key Ban","IP Ban","Timer Ban"))
				if("Key Ban")
					input("Banned List:","Banned List(Key)")as null|anything in BannedK
					input("Banned List:","Banned List(Key Spider)")as null|anything in BannedSK
					return
				if("IP Ban")
					input("Banned List:","Banned List(IP)")as null|anything in BannedA
					input("Banned List:","Banned List(IP Spider)")as null|anything in BannedSA
					return
				if("Timer Ban")
					input("Banned List:","Banned List(Timer)")as null|anything in BannedTK
					return
			return

		UnBan()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used UnBan")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/ListB=input("Unban what?")in list("Key","IP","Cancel")
			if(ListB=="Cancel")
				return
			var/Utype=input("Unban from a list or type it in?")in list("List Unban","Specific Unban","Timer Ban List")
			if(ListB=="IP")
				if(Utype=="Specific Unban")
					var/ipunban = input("Unban wich IP?") as null|text
					if(!ipunban)return
					if(BannedA.Find(ipunban))
						BannedA.Remove(ipunban)
						var/savefile/Z = new("world save files/Bans.sav")
						Z["BannedA"]<<BannedA
						AdminMessage("[src] Unbanned: [ipunban]")
					else
						src<<"IP not found."
					if(BannedSA.Find(ipunban))
						BannedSA.Remove(ipunban)
						var/savefile/Z = new("world save files/Bans.sav")
						Z["BannedSA"]<<BannedSA
						AdminMessage("[src] Unbanned: [ipunban]")
					else
						src<<"IP not found."
				if(Utype=="List Unban")
					var/selected=input("Wich IP do you wish to unban?")as null|anything in BannedA
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedA.Find(selected))
								BannedA.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("world save files/Bans.sav")
								Z["BannedA"]<<BannedA
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("world save files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
			else
				if(Utype=="Timer Ban List")
					var/selected=input("Who do you wish to unban?")as null|anything in BannedTK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							if(BannedTK.Find(selected))
								BannedTK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								var/savefile/Z = new("world save files/Timer Bans.sav")
								Z["BannedTK"]<<BannedTK
				if(Utype=="Specific Unban")
					var/keyunban = input("Unban wich Key?") as null|text
					if(!keyunban)return
					var/ckeyunban=ckey(keyunban)
					for(var/X in BannedTK)
						var/XX=copytext(X,15)
						if(XX==keyunban)
							BannedTK.Remove(X)
							AdminMessage("[src] Unbanned: [ckeyunban]")
							var/savefile/Z = new("world save files/Timer Bans.sav")
							Z["BannedTK"]<<BannedTK
					if(BannedK.Find(ckeyunban))
						BannedK.Remove(ckeyunban)
						AdminMessage("[src] Unbanned: [ckeyunban]")
					else
						src<<"Key not found."
					if(BannedSK.Find(ckeyunban))
						BannedSK.Remove(ckeyunban)
						AdminMessage("[src] Unbanned: [ckeyunban]")
					else
						src<<"Key not found."
					if(CreationSpam.Find("1[ckeyunban]"))
						CreationSpam.Remove("1[ckeyunban]")
					if(CreationSpam.Find("2[ckeyunban]"))
						CreationSpam.Remove("2[ckeyunban]")
					if(CreationSpam.Find("3[ckeyunban]"))
						CreationSpam.Remove("3[ckeyunban]")
					var/savefile/Z = new("world save files/Bans.sav")
					Z["BannedK"]<<BannedK
					Z["BannedSK"]<<BannedSK
					var/savefile/S = new("world save files/GM.sav")
					S["CreationSpam"]<<CreationSpam
					return
				if(Utype=="List Unban")
					var/selected=input("Wich Key do you wish to unban?")as null|anything in BannedK
					if(!selected)return
					switch(alert("Do you wish to unban: [selected] ?","","Yes","No"))
						if("No")
							return
						else
							for(var/X in BannedTK)
								var/XX=copytext(X,15)
								if(XX==selected)
									BannedTK.Remove(X)
									var/savefile/Z = new("world save files/Timer Bans.sav")
									Z["BannedTK"]<<BannedTK
							if(BannedK.Find(selected))
								BannedK.Remove(selected)
								AdminMessage("[src] Unbanned: [selected]")
								if(CreationSpam.Find("1[selected]"))
									CreationSpam.Remove("1[selected]")
								if(CreationSpam.Find("2[selected]"))
									CreationSpam.Remove("2[selected]")
								if(CreationSpam.Find("3[selected]"))
									CreationSpam.Remove("3[selected]")
								var/savefile/Z = new("world save files/Bans.sav")
								Z["BannedK"]<<BannedK
								var/savefile/S = new("world save files/GM.sav")
								S["CreationSpam"]<<CreationSpam
								return

		WorldReboot()
			set category="Admin"
			set name = "World Reboot"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used World Reboot")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to reboot the world?","Reboot World","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			Yes
			var/TTime=input("Enter a number 5-15.")as num
			if(TTime<5||TTime>15)
				return
			AdminMessage("[usr] has innitiated the world reboot.")
			GM_WorldShutDownProc=1
			player<<"<font color=red>Server Reboot enabled. Saving Characters."
			for(var/mob/PC/M in player)
				if(!M.loggedin)continue
				M.client.SaveChar()
				sleep(1)
			sleep(20)
			player<<"<font color=red>Characters Saved!"
			while(TTime>=1)
				if(TTime<=5)
					cantsaveatall=1
				player<<"<center>Server Reboot in [TTime] Seconds."
				TTime-=1
				sleep(10)
			player<<"Rebooting...Safely logging out players."
			for(var/mob/PC/M in player)
				if(!M.client)continue
				if(M==src)continue
				del(M)
				sleep(1)
			sleep(5)
			world.Reboot()


		Ban()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Ban")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/BP=new/list()
			for(var/mob/PC/C in player)
				BP.Add(C)
			BP.Add("Cancel")
			var/mob/M=input("Who do you wish to Ban?")in BP
			if(M=="Cancel")
				return
			if(!M)
				src<<"Target has logged out."
				return
			var/bankey=M.ckey
			var/banip=M.client.address
			switch(alert("Are you sure you want to ban [M]([bankey])?","Ban [M]","Yes","No"))
				if("Yes")
					if(M.GMLevel>=usr.GMLevel)
						AdminMessage("[usr] tried Banning [M] ([bankey]).")
						return
					else
						var/Reason=input("Input a reason.")as text
						var/Type=input("Ban Key or Address?")in list("Key","Address","Both")
						var/timer=input("Do you want to include an auto unban timer?")in list("No","Yes")
						if(timer=="Yes")
							goto skipage
						var/spider=input("Do you wish to Spider Ban(Auto bans new keys and ips that the player may use)?")in list("Normal Ban","Spider Ban")
						skipage
						player<<"<b>[M]([M.key]) has been <font color = red>Banned</font> by [src]. ([Type])([Reason])"
						if(Type=="Key")
							if(timer=="Yes")
								var/list/banyy=list("2016","2017","2018","2019","2020")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the year of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								var/savefile/Z = new("world save files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								del(M)
							else
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedK"]<<BannedK
									del(M)
								if(spider=="Spider Ban")
									BannedSK.Add(bankey)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedSK"]<<BannedSK
									del(M)
						if(Type=="Address")
							if(timer=="Yes")
								var/list/banyy=list("2016","2017","2018","2019","2020")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("world save files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								del(M)
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedA.Add(banip)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedA"]<<BannedA
									del(M)
								else
									BannedSA.Add(banip)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedSA"]<<BannedSA
									del(M)
						if(Type=="Both")
							if(timer=="Yes")
								var/list/banyy=list("2016","2017","2018","2019","2020")
								var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
								var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
								var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
								var/monthban=input("Select the month of the unban:")in banmm
								var/dayban=input("Select the day of the unban:")in bandd
								var/yearban=input("Select the day of the unban:")in banyy
								var/hourban=input("Select the hour of the unban:")in banhh
								var/bantime="[monthban]/[dayban]/[yearban]/[hourban]"
								BannedTK.Add("[bantime] [bankey]")
								BannedTK.Add("[bantime] [banip]")
								var/savefile/Z = new("world save files/Timed Bans.sav")
								Z["BannedTK"]<<BannedTK
								del(M)
							if(timer=="No")
								if(spider=="Normal Ban")
									BannedK.Add(bankey)
									BannedA.Add(banip)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedA"]<<BannedA
									Z["BannedK"]<<BannedK
									del(M)
								if(spider=="Spider Ban")
									BannedSK.Add(M.ckey)
									BannedSA.Add(M.client.address)
									var/savefile/Z = new("world save files/Bans.sav")
									Z["BannedSA"]<<BannedSA
									Z["BannedSK"]<<BannedSK
						if(M)
							for(var/obj/Earth_Dragonballs/O1 in M)
								O1.loc = M.loc
							for(var/obj/Namek_Dragonballs/O2 in M)
								O2.loc = M.loc
							for(var/obj/Black_Dragonballs/O3 in M)
								O3.loc = M.loc
							del(M)
						return
				if("No")
					return

		GM_TV(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used GM TV on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			src.client.eye=M
			src.client.perspective = EYE_PERSPECTIVE
			//src.gmtvon=1
			if(M==usr)
				src.gmtvon=0
			else
				src.gmtvon=1
			return

		GM_TV_OFF()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
		 	src.client.eye=src
			src.client.perspective = EYE_PERSPECTIVE
			src.gmtvon=0
			return
		GM_TV_Unsafe()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used GM TV non Safe")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/PlayerList = list()
			PlayerList += "Cancel"

			for(var/mob/PC/M in player)
			//	var/turf/Floors/Safe_Zone/T = loc
				//if(M.loc=locate(T))
			//	if(ismob(T))

			//	else
			//	if(!M.loc==locate(/turf/Floors/Safe_Zone/))
				if(M.z != 7)
					PlayerList += M
					//PlayerList.Add(M)
			//if(!M)return
			var/mob/T = input("Players outside safezone","GM TV")in PlayerList
			if(T=="Cancel")
				src.client.eye=src
				src.client.perspective = EYE_PERSPECTIVE
				src.gmtvon=0
				return

			src.client.eye=T
			src.client.perspective = EYE_PERSPECTIVE
			if(T==usr)
				src.gmtvon=0
			else
				src.gmtvon=1
			return



		GM_TV_HBTC()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used GM TV non Safe")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/PlayerList = list()
			PlayerList += "Cancel"

			for(var/mob/PC/M in player)
			//	var/turf/Floors/Safe_Zone/T = loc
				//if(M.loc=locate(T))
			//	if(ismob(T))

			//	else
			//	if(!M.loc==locate(/turf/Floors/Safe_Zone/))
				if(M.in_hbtc)
					PlayerList += M
					//PlayerList.Add(M)
			//if(!M)return
			var/mob/T = input("Players outside safezone","GM TV")in PlayerList
			if(T=="Cancel")
				src.client.eye=src
				src.client.perspective = EYE_PERSPECTIVE
				src.gmtvon=0
				return

			src.client.eye=T
			src.client.perspective = EYE_PERSPECTIVE
			if(T==usr)
				src.gmtvon=0
			else
				src.gmtvon=1
			return


	MedGM/verb
//You get to pretend another player has said what you want here, atm its level 3 verb but as its very abusable i might make it level 5.
		View_Reports()
			set category = "Admin"
			winshow(src,"reportview",1)
		Delete_Enemy_Drops()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to delete all item drops on the ground? A quick warning to players would be a good idea","Delete Enemy Drops","Yes","Cancel"))
				if("Cancel")return
				if("Yes")
					usr << "<b><font size = red>Deleting items slowly, do not press again"
					var/count
					for(var/obj/Equipment/M in world)
						if(isturf(M.loc))
							count++
							del M
						sleep(1)
					player << "<b>[count] objects deleted off the ground</b>"

		Delete_Projectiles()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to delete all projectiles and trails? This will delete the ones stuck on the map and the ones players just used","Delete Projectiles","Yes","Cancel"))
				if("Cancel")return
				if("Yes")
					var/count
					for(var/obj/blasts/M in world)
						if(isturf(M.loc))
							count++
							del M
					AdminMessage("[count] projectiles deleted")



		Change_Skin(mob/PC/M in player)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Change Skin")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/nskin=input("Don't abuse this verb. Use it only for people whom's icon got bugged. (f at the end means female)")in list("white","tan","dark","whitef","tanf","darkf")
			M.skin=nskin
			M.Skin_Apply()

		Change_Icon(mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Change Icon")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Would you sure you want to change an icon, it makes you choose a .dmi from YOUR PC to replace the file with!!","CAREFUL OF PROCEEDING","Yes","No"))
				if("Yes")
					var/Change_Icon = input(usr, "Icon","Icon") as icon
					var/statename = input(usr, "What do you want your icon state to be?","Icon State") as text
					M.icon_state = statename
					M.icon = Change_Icon
					return
				if("No")
					return


		Ban_Manually()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Ban Manually")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/ipkey=input("Ban a Key or IP?")in list("Key","IP","Cancel")
			if(ipkey=="Cancel")
				return
			var/k = input("Type in the key or IP you wish to Ban:")as text
			if(k == src.ckey)
				usr << "You sure you want to Ban yourself? NoOb"
				return
			if(k==src.client.address)
				usr << "You sure you want to Ban yourself? NoOb"
				return
			if(!k)
				return
			if(StaffEnf.Find(k)&&usr.GMLevel<7)
				usr<<"You can only ban people with lower GM level than you."
			if(MasterEnf.Find(k)&&usr.GMLevel<6)
				usr<<"You can only ban people with lower GM level than you."
			if(HighEnf.Find(k)&&usr.GMLevel<5)
				usr<<"You can only ban people with lower GM level than you."
			if(MediumEnf.Find(k)&&usr.GMLevel<4)
				usr<<"You can only ban people with lower GM level than you."
			if(LowEnf.Find(k)&&usr.GMLevel<3)
				usr<<"You can only ban people with lower GM level than you."
			if(TrialEnf.Find(k)&&usr.GMLevel<2)
				usr<<"You can only ban people with lower GM level than you."
			for(var/mob/i in player)
				if(k==i.ckey)
					if(i.GMLevel>usr.GMLevel)
						usr<<"You can't Ban someone with a higher GM Level than yourself"
						AdminMessage("[usr]([usr.key]) has tried \red Banning</font> [k]")
/*			if(k == "saiyan_slayer_57"||"crimsonslayer"||"saiyanslayer57")
				switch(alert("Are you 100% sure you want to ban [k]?","","Ban","Cancel"))
					if("Ban")
						if(k.ckey != "saiyan_slayer_57"||"crimsonslayer||"||""||"")
							world << "[k] was <font color = red>Auto Smited</font> for trying to Ban Death."
							BannedA.Add(src.client.address)
							BannedK.Add(src.ckey)
							BanSave()
						if(k)
							for(var/obj/Earth_Dragonballs/O1 in src)
								O1.loc = src.loc
							for(var/obj/Namek_Dragonballs/O2 in src)
								O2.loc = src.loc
							for(var/obj/Black_Dragonballs/O3 in src)
								O3.loc = src.loc
							del(k)
						else
							return
					else
						return*/
			if(k!="crimsonslayer"||k!="cazdogga"||k!="Hammerboy"||k!="Hammerthekage"||k != "Narmanb")
				switch(alert("Spider or Timer?","","Spider","Timer","Cancel"))
					if("Cancel")return
					if("Spider")
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedSK.Add(ck)
						if(ipkey=="IP")
							BannedSA.Add(k)
						BanSave()
					if("Timer")
						var/list/banyy=list("2016","2017","2018","2019","2020")
						var/list/banmm=list("01","02","03","04","05","06","07","08","09","10","11","12")
						var/list/bandd=list("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31")
						var/list/banhh=list("00","01","02","02","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23")
						var/monthban=input("Select the month of the unban:")in banmm
						var/dayban=input("Select the day of the unban:")in bandd
						var/yearban=input("Select the year of the unban:")in banyy
						var/hourban=input("Select the hour of the unban:")in banhh
						var/bantime="[monthban]/[dayban]/[yearban]:[hourban]"
						if(ipkey=="Key")
							var/ck=ckey(k)
							BannedTK.Add("[bantime] [ck]")
						if(ipkey=="IP")
							BannedTK.Add("[bantime] [k]")
						var/savefile/Z = new("world save files/Timed Bans.sav")
						Z["BannedTK"]<<BannedTK
				AdminMessage("[usr]([usr.key]) has \red Banned</font> [k]")
				if(ipkey=="Key")
					for(var/mob/M in player)
						if(M.key==k)del M
				if(ipkey=="IP")
					for(var/mob/M in player)
						if(M.client.address==k)del M
			else
				return
//check to see if K is a logged in person to delete them, if its not then no worries
/*			if()
				del(k)
				return
			else
				return
*/
/*		AFKCheck()
			set category = "Admin"
			set name = "AFK Check"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/tmp/lstafk
			if(!lastafk)
				lstafk="Not performed yet"
			else
				lstafk="[round(((world.time/10)/60)-((lastafk/10)/60))] minutes ago"
			switch(alert("Last AFK Check: [lstafk]. AFK Check? It's best you don't use this verb more than once every hours.","","AFK Check","No"))
				if("No")
					return
				else
					AdminMessage("[src] has started the AFK Checker.")
					world.AFKCHECKSTART()
		AFKCheck_Specific(mob/PC/M in world)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("AFK Check [M]?","","Yes","No"))
				if("Yes")
					switch(alert("Boot or Ban?","","Boot","Ban","Cancel"))
						if("Cancel")return
						if("Boot")
							if(!M)return
							if(!M.client)return
							if(M.loggedin!=1)return
							if(M.GMLevel)
								AdminMessage("[src] tried to AFK Checked [M] (Boot).")
								return
							var/textafk=input("What do you wish the check text to be? Leave blank for default 2 letters.")as text
							if(!M)return
							if(lentext(textafk)>5)
								textafk=copytext(textafk,1,6)
							AdminMessage("[src] has AFK Checked [M] (Boot)(Check Text: [textafk]).")
							spawn(1)M.AFKPOPTIME("BOOT")
							spawn(1)M.AFKPOPSPECIF(textafk)
						if("Ban")
							if(!M)return
							if(!M.client)return
							if(M.loggedin!=1)return
							if(M.GMLevel)
								AdminMessage("[src] tried to AFK Checked [M] (Ban).")
								return
							var/textafk=input("What do you wish the check text to be? Leave blank for default 2 letters.")as text
							if(!M)return
							if(lentext(textafk)>5)
								textafk=copytext(textafk,1,6)
							AdminMessage("[src] has AFK Checked [M] (Ban)(Check Text: [textafk]).")
							spawn(1)M.AFKPOPTIME("BAN")
							spawn(1)M.AFKPOPSPECIF(textafk)
				else
					return
					*/
		/*
		Make_Icon()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used make iocn")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/icon/I=input("Select your Guild Item's icon:")as null|icon
			if(!length(I))
				usr.makingitem=0
				return
			if(length(I) > filesizemax)
				usr << "File is too large. 50kb max."
				usr.makingitem=0
				return
			switch(alert(usr,"Overlay or Underlay?(Overlays show on top of your character's icon \
				and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
				if("Overlay")
					var/obj/Equipment/O = new
					var/N = input("Whats the name?","","Player Item","[usr]'s Item") as text
					if(Check_For_Spam(N,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						usr.makingitem = 0
						return
					if(!N)
						N = "[usr]'s Item"
					if(lentext(N)>15)
						N = "[usr]'s Item"
					if(N == null)
						N = "[usr]'s Item"
					N=html_encode(N)
					O.name = N
					O.icon = I
					O.customequip=1
					usr.contents += O
				//	usr.inven_min += 1
					usr.makingitem = 0
					usr<<"[N] was created successfully!"
					return
				if("Underlay")
					var/obj/Equipment/O = new
					var/N = input("Whats the name?","","Guild Item","[usr]'s Item") as text
					if(Check_For_Spam(N,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						usr.makingitem = 0
						return
					if(!N)
						N = "[usr]'s Item"
					if(lentext(N)>15)
						N = "[usr]'s Item"
					if(N == null)
						N = "[usr]'s Item"
					N=html_encode(N)
					O.name = N
					O.customequip=2
					O.icon = I
					usr.contents += O
				//	usr.inven_min += 1
					usr.makingitem = 0
					usr<<"[N] was created successfully!"
					return
*/


		Make_Icon()
			set category = "Admin"
			if(usr.GMLevel<1)
				return
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used make iocn")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
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
					//		var/px=input("Pixel X Offset","",0)as num
					//		var/py=input("Pixel Y Offset","",0)as num

							O.icon = I
					//		O.pixel_x = px
					//		O.pixel_y = py

							usr.contents += O

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


		Create_Event_Item()
			set category = "Admin"
			if(usr.GMLevel<1)
				return
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used make iocn")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			//set category = "Guild"
			if(usr.makingitem)
				return
			usr.makingitem = 1
			var/icon/I=input("Select your Item's icon:")as null|icon
			if(!length(I))
				usr.makingitem=0
				return
			if(length(I) > filesizemax)
				usr << "File is too large. 50kb max."
				usr.makingitem=0
				return
			switch(alert("Make Event Item?","Make Event Item","Yes","No"))
				if("Yes")
				//	switch(alert(usr,"Overlay or Underlay?(Overlays show on top of your character's icon \
									and Underlays show under your character's icon","","Overlay","Underlay","Cancel"))
				//		if("Overlay")
					var/obj/Equipment/Event_Item/O = new
					var/N = input("Whats the name?","","Admin Item") as text
					if(Check_For_Spam(N,SPAM) == TRUE)
						src<<"Please do not use linebreak characters."
						usr.makingitem = 0
						return
					if(!N)
						N = "Event Item"
					if(lentext(N)>35)
						N="Event Item"
					if(N == null)
						N="Event Item"
					N=html_encode(N)
					O.name = N
					O.icon = I
					usr.contents += O

					usr.makingitem = 0
					AdminMessage("[usr] \red create \font the event item [N]")
					usr<<"[N] was created successfully!"
					return
			if("No")
				usr.makingitem = 0
				return
	/*
		Edit_Remakes(var/mob/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Edit Remakes")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/inputnumber = input("Set remake count to?") as num
			M.remakes = inputnumber
			var/savefile/S = new("world save files/Remakes.sav")
			S["[M.client.computer_id] remakes"]<<inputnumber
			*/

		/*SpeedGearCheck()
			set hidden =1
			set category = "Admin"
			set name = "SpeedGear Check"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			alert("** This doesn't determine if the person does have SpeedGear on, but it checks to see if he/she is gaining more stats than usual. \
			This is how it works. The target must be either self training or lifting weights/punching machines. \
			You will get time shown while the target is under check. All you have to do is subtract two times and compare them \
			with these average delay times: Self Train - 1.1 seconds; Weight Lift 2.7 seconds; Machine Punch: 2.7 seconds. *This \
			is not 100% acurate, specially if there is alot of lag. Always double check before making a decision.*")
			for(var/mob/M in player)
				M.undercheck=0
				M.checker=""
			var/mob/SGC = input("Who do you want to check?")as mob in player
			switch(alert("Check or Stop checking [SGC]?","","Check","Stop"))
				if("Check")
					src<<" In 10 seconds [SGC] will automatically be stopped checking."
					spawn(100)
						if(!SGC)return
						SGC.undercheck=0
						SGC.checker=""
					SGC.undercheck=1
					SGC.checker=src
				else
					SGC.undercheck=0
					SGC.checker=""
					return

		Watch_Player(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!usr.pwatch)
				usr.pwatch=1
				usr.meye=
				usr.ceye=client.eye
				usr.client.perspective=EYE_PERSPECTIVE
				client.eye=M.eye
			else
				client.eye=usr.ceye
				usr.client.perspective=EDGE_PERSPECTIVE
				usr.pwatch=1
				return
			*/



		Revive_World()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Revive World")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Revive the world?","","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in player)
						if(!M.client)continue
						if(!M.loggedin)continue
						if(M.jailed)continue
						if(M.dead)
							M.overlays -= 'Halo.dmi'
							M.overlays -= 'Halo.dmi'
							M.loc = locate(rand(390,420),rand(245,260),7)
							M.safe = 0
							M.dead = 0
							M.it_lock=0
							M.it_blocked=0

					player<<"<b><font color=red>[usr] has revived the world!</b>"
				else
					return

		World_Repop()
			set hidden = 1
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used World Repop")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			return
			if(!halt_repop)
				halt_repop = 1
			else
				halt_repop = 0
			usr << "repop set to [halt_repop]"
			/*
			Saibaman_Repop = null
			Saibaman_Loc = null
			Saibaman_Repop = new/list
			Saibaman_Loc = new/list
			Namekian_Repop = null
			Namekian_Loc = null
			Namekian_Repop = new/list
			Namekian_Loc = new/list
			Saiyan_Repop = null
			Saiyan_Loc = null
			Saiyan_Repop = new/list
			Saiyan_Loc = new/list
			Android_Repop = null
			Android_Loc = null
			Android_Repop = new/list
			Android_Loc = new/list
			Angel_Repop = null
			Angel_Loc = null
			Angel_Repop = new/list
			Angel_Loc = new/list
			Demon_Repop = null
			Demon_Loc = null
			Demon_Repop = new/list
			Demon_Loc = new/list
			Dragon_Repop = null
			Dragon_Loc = null
			Dragon_Repop = new/list
			Dragon_Loc = new/list
			Misc_Repop = null
			Misc_Loc = null
			Misc_Repop = new/list
			Misc_Loc = new/list
			Bio_Repop = null
			Bio_Loc = null
			Bio_Repop = new/list
			Bio_Loc = new/list
			Majin_Repop = null
			Majin_Loc = null
			Majin_Repop = new/list
			Majin_Loc = new/list
			for(var/mob/Monster/M in world)
				del(M)
			world.Repop()

			halt_repop=0*/
			//player<<"<b><font color=yellow>[usr] has repopulated the world!</b>"
			return

		Rename(mob/M as mob in world, ID as text)
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Renamed [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(!ID)return
			if(!M)return
			for(var/mob/N in world)
				if(N.name==""||N.name==null||N.name==0)
					N.name="NameLess"
					usr<<"<font color=red>Found Nameless. Renamed to NameLess. Key: [N.key]"
			var/namecheck=ID
			if(NameList.Find(namecheck))
				alert("For file safety reasons you may not rename using an already taken name. [ID] is taken, please pick another name.")
				return
			AdminMessage("[usr]([usr.key]) has Renamed [M] to [ID]")
			var/savefile/S=new("world save files/Player Names.sav")
			NameList.Remove(M.name)
			M.name=ID
			NameList.Add(namecheck)
			S["NameList"]<<NameList
			usr << "You <font color = green>Changed</font> [M]'s name."
			return

		Relearn_Skills(mob/PC/M in player)
			set category = "Admin"
			set hidden = 1
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			for(var/obj/Technique/T in src.contents)
				del(T)
			learn_executionersstrike=0
			learn_burst=0
			learn_dimensionsword=0
			learn_distructodisk=0
			learn_kienzandisk=0
			learn_spiritball=0
			learn_aura=0
			learn_karmabomb=0
			learn_explosivewave=0
			learn_SuperExplosionWave=0
			learn_energyfield=0
			learn_angryexplosion=0
			learn_candy=0
			learn_supernova=0
			learn_bblast=0
			learn_erain=0
			learn_gtyrant=0
			learn_godlyblast=0
			learn_grandsmasher=0
			learn_novablast=0
			learn_omegablast=0
			learn_phantomattack=0
			learn_soulpunisher=0
			learn_starbang=0
			learn_waterjet=0
			learn_zapcannon=0
			learn_dodonpa=0
			learn_deathball=0
			learn_sauzerblade=0
			learn_finalexplosion=0
			learn_giganticmeteor=0
			learn_blastershell=0
			learn_rapidblast=0
			learn_blowup=0
			learn_flameblast=0
			learn_fireki=0
			learn_infernoblitz=0
			learn_arcblast=0
			learn_kicannon=0
			learn_whirlwind=0
			learn_darkblast=0
			learn_darkbomb=0
			learn_bloodbomb=0
			learn_holyblast=0
			learn_lightsphere=0
			learn_deathbeam=0
			learn_demonsword=0
			learn_universalscan=0
			learn_fusiondance=0
			learn_acidbomb=0
			learn_galacticdonut=0
			learn_demonshackle=0
			learn_imprisonmentball=0
			learn_powerup=0
			learn_fakemoon=0
			learn_enrage=0
			learn_sense=0
			learn_finalshine=0
			learn_bigbangattack=0
			learn_finalflash=0
			learn_galickgun=0
			learn_tribeam=0
			learn_solarflare=0
			learn_splitform=0
			learn_swapsplits=0
			learn_specialbeam=0
			learn_lightgrenade=0
			learn_zanzoken=0
			learn_dragonfist=0
			learn_afterimage=0
			learn_it=0
			learn_ssdeadlybomber=0
			learn_fly=0
			learn_hellzonegrenade=0
			learn_genocideattack = 0
			learn_deathwave=0
			learn_cherrybomb=0
			learn_finishbuster=0
			learn_burningattack=0
			learn_absorb=0
			learn_assasinate=0
			learn_kiabsorb=0
			learn_regena=0
			learn_revengeball=0
			learn_kishower=0
			learn_sacrifice=0
			learn_adtrain=0
			learn_gravfield=0
			learn_buffpl=0
			learn_buffki=0
			learn_invertpower=0
			learn_buffstr=0
			learn_buffdef=0
			learn_buffstam=0
			learn_explode=0
			learn_chaosball=0
			learn_acidrain=0
			learn_swordslash=0
			learn_tswordslash=0
			learn_glare=0
			learn_kipunch=0
			learn_powerdash=0
			learn_push=0

			learn_generic1=0
			learn_generic2=0
			player<<"[src] has fixed [M]'s techniques"
			M<<"Make sure you self train to relearn your techniques"

		Change_Title()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Change Title")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/Menu = list()
			for(var/mob/PC/M in player)
				Menu.Add(M)
			var/mob/M = input("Change who's title?","Change Title") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert("Change [M]'s title?","Change Title","Yes","No"))
					if("Yes")
						var/new_rank = input("Enter [M]'s new title","Admin Change Title") as text | null
						var/rc2=lowertext(new_rank)
						rc2=dd_replacetext(rc2," ","")
						if(src.GuildBanText(BannedGuildText,rc2)==TRUE)
							alert("Only <font color> html tags allowed")
							return
						if(Check_For_Spam(new_rank,SPAM) == TRUE)
							src<<"Please do not use linebreak characters."
							return
						if(findtext(rc2,"fontcolor"))
							if(lentext(rc2)>750)
								alert("New title cannot exceed 750 characters.")
								return
						else
							if(lentext(rc2)>30)
								alert("New title cannot exceed 30 characters.")
								return
						if(!M)return
						AdminMessage("[usr]([usr.key]) has changed [M] title to [new_rank]")
						M.guild_title = new_rank
						M.title = new_rank
						return
					else
						return
/*
		Sagas_Management()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Start or Stop sagas?","","Start","Stop","Cancel"))
				if("Start")
					switch(alert("Good or Evil Sagas?","","Good","Evil","Cancel"))
						if("Cancel")
							return
						if("Evil")
							for(var/mob/Saga/M in world)
								del(M)
							player << "<font color = #990000>Saga Information:<font color=white> Sagas have been Activated!"
							sagas_on=1
							sagas_evil=1
							sagas_good=0
							saga="Not On"
							part="Not On"
							saga_difficulty="Medium"
							saga_episode=0
							saga_spawned=0
							spawn(10)world.SAGA_CHECK()
						if("Good")
						//	src<<"This is under progress."
						//	return
							for(var/mob/Saga/M in world)
								del(M)
							player << "<font color = #990000>Saga Information:<font color=white> Sagas have been Activated!"
							sagas_on=1
							sagas_evil=0
							sagas_good=1
							saga="Not On"
							part="Not On"
							saga_difficulty="Medium"
							saga_episode=0
							spawn(10)world.SAGA_CHECK()
							return
				if("Stop")
					if(sagas_on == 1)
						player << "<font color = #990000>Saga Information:<font color=white> Sagas have been De-Activated!"
						sagas_on=0
						sagas_evil=0
						sagas_good=0
						saga_spawned=0
						saga_episode=0
						saga="Not On"
						part="Not On"
						saga_difficulty="Medium"
						for(var/mob/Saga/M in world)
							del(M)
						return
					else
						usr << "Sagas are not on!"
						return
				if("Cancel")
					return
*/


		World_Movement_Lock()
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used World Movement Lock")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/GoGo=alert("Are you sure you want to lock everyone's movement?","World Movement Lock","Yes","No")
			if(GoGo=="No")
				return
			for(var/mob/M in world)
				if(usr==M) continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not locked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=1
				M.it_lock=1
			player<<"[usr] has locked everyone's movement!"
			return

		World_Movement_UnLock()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/GoGo=alert("Are you sure you want to unlock everyone's movement?","World Movement UnLock","Yes","No")
			if(GoGo=="No")
				return
			for(var/mob/M in world)
				if(usr==M) continue
				if(M.GMLevel>=GMLevel)
					M<<"You were not unlocked because you are an admin equal to or above [usr]'s rank."
					continue
				M.GMLocked=0
				M.it_lock=0
			player<<"[usr] has unlocked everyone's movement!"
			return

		Invisibility()
			set category="Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Invisibility")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/icon/Z=new(usr.icon)
	//		Z.DrawBox(rgb(1,1,1),1,32,11,15)
	//		Z.DrawBox(rgb(255,255,255),5,29,7,19)
	//		Z.DrawBox(rgb(255,255,255),3,29,9,27)
	//		Z.DrawBox(rgb(255,255,255),3,19,9,21)
			if(invisibility==0)
				usr.overlays+=Z
				invisibility=7
				src.density=0
				return
			else
				usr.overlays-=Z
				invisibility=0
				density = 1
				return

		World_Mute()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used World Mute")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Do you want to Mute or UnMute the world?","","Mute","UnMute"))
				if("Mute")
					World_Mute=1
					player<<"\red [src] has Muted the World"
					return
				if("UnMute")
					World_Mute=0
					player<<"\red [src] has Unmuted the World"
					return

		Jail(var/mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Jail on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			M.loc=locate(243,482,5)
		//	M.frozen = 1
			M.it_lock=1
			M.buku_lock=1
			M.doing=1
			M.jailed=1
			M.dead = 1
			//M.overlays += 'jail 1.dmi'

		UnJail(var/mob/PC/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Un Jail on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.jailed)
				M.loc=locate(410,260,7)
				M.frozen = 0
				M.it_lock=0
				M.buku_lock=0
				M.doing=0
				M.jailed=0
				M.dead = 0
			//	M.overlays -= 'jail 1.dmi'

		World_Save()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used World save")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			player << "<center><font color = red>World Save!!</center></font>"
			for(var/mob/PC/M in player)
				if(M.client)
					M.client.SaveChar()

/*		Guild_Name_Edit()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/Menu = list()
			for(var/mob/PC/M in player)
				if(M.in_guild)
					Menu.Add(M)
				else
					return
			var/mob/PC/M = input("Which persons guild name do you want to edit","Guild Name Edit")as null|anything in Menu
			switch(alert("Do you want to change [M.guild_name]?? Be Aware that the guild name will already be in the text edit section - only edit the html?","Rename [M.guild]","Yes","No"))
				if("Yes")
					var/rename1 = input("Edit the html name here","Edit Name",M.guild_name) as text
					AdminMessage("[usr]([usr.key]) has changed the guild name [M.guild_name] to [rename1]")
					Guilds.Remove(M.guild_name)
					M.guild_name=rename1
					Guilds.Add(M.guild_name)
					return
				else
					return
*/
	HighGM/verb
		Multi_Key()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Multi Key")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What do you want to do?","Multy key")in list("MuliKey Check","Toggle MultiKey","Give Permission","Cancel"))
				if("Give Permission")
					var/mob/who = input("Allow who to MultiKey?")as mob in player
					if(who.client)
						switch(alert("Allow [who] to MK or disallow","","Allow","Disallow","Cancel"))
							if("Allow")
								if(!who)return
								who.canMK = 1
								AdminMessage("[usr] allowed [who] to MultiKey")
								return
							if("Disallow")
								if(!who)return
								who.canMK = 0
								AdminMessage("[usr] disallowed [who] to MultiKey")
								return
							if("Cancel")
								return
				if("MuliKey Check")
					var/Found[0]
					for(var/mob/M in player)
						if(Found.Find(M))continue
						if(M.client)
							for(var/mob/M2 in player)
								if(!M2.client)continue
								if(!M2)continue
								if(M == M2)continue
								if(M.client.address == M2.client.address)
									Found += M
									Found += M2
									usr << "<B>\red Match Found!"
									usr << "<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
									usr << "<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
				if("Toggle MultiKey")
					if(!MK)
						MK = 1
						AdminMessage("[usr] turned MultiKey <font color = green>On")
						return
					if(MK==1)
						MK = 0
						AdminMessage("[usr] turned MultiKey <font color = red>Off")
						return
				if("Cancel")
					return
		Fake_Login()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Fake Logout")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			usr << "You have silently logged back into the player list"
			//player << "<font color = #66CCCC>Server Information: <font color = white>[usr] ([usr.key]) has left the server."
			player += usr

		Fake_Logout()
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Fake Logout")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			player << "<font color = #66CCCC>Server Information: <font color = white>[usr] ([usr.key]) has left the server."
			player -= usr

		Change_Inventory(var/mob/M in player)
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Change Inventory on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/varInventoryList = list()
			if(locate(/obj/Equipment) in M:contents)
				for(var/obj/Equipment/O in M:contents)
					varInventoryList += O
			else
				src << "[M:name] has an empty inventory!"
				return
			var/varInventoryItem = input("Pick an item from [M:name]'s inventory to delete","Crimzons Exclusive Inventory Checker") in varInventoryList +list("All Items") + list("Cancel")
			if(varInventoryItem == "Cancel")
				return
			if(varInventoryItem == "All Items")
				var/clicked=0
				for(var/obj/Equipment/O in M:contents)
					O.suffix= null
					if(clicked==0&&O.equiped)
						O.Click()
						clicked++
					del(O)
				clicked=0
				M.head="EMPTY"
				M.back="EMPTY"
				M.chest= "EMPTY"
				M.legs= "EMPTY"
				M.feet= "EMPTY"
				M.arms = "EMPTY"
				M.hands= "EMPTY"
				M.waist = "EMPTY"
				M.underclothes = "EMPTY"
				M.clothes= "EMPTY"
				M.weapone= "EMPTY"
				M.clothes_eq= 0
				M.GItem_eq= 0
				M.gitems=0
				M.scouter = 0
				M.scouter_eq = 0
				M.scouter_channel = 1
				M.armor = 0
				M.armor_eq = 0
				M.under = 0
				M.under_eq = 0
				M.belt= 0
				M.belt_eq= 0
				M.helmet = 0
				M.helmet_eq = 0
				M.gloves = 0
				M.gloves_eq= 0
				M.cloak= 0
				M.cloak_eq= 0
				M.z_sword = 0
				M.demon_blade= 0
				M.radar = 0
				M.hench_equiped = 0
				M.saiyan_equiped = 0
				M.inven_min = 0
				return
			if(alert("Would you like to delete [varInventoryItem:name] from [M:name]'s inventory?","Crimzon's Exclusive Inventory Checker","Yes","No") == "Yes")
				var/clicked=0
				for(var/obj/Equipment/O in M:contents)
					if(O == varInventoryItem)
						if(clicked==0&&O.equiped)
							O.Click()
							clicked++
				clicked=0
				del(varInventoryItem)
				M.inven_min-=1

		Restore_Stamina(mob/PC/M in player)
			set hidden = 1
			set category = "Admin"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Used Restore Stamina on [M]")
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Restore Stamina?","","Restore","Cancel"))
				if("Cancel")
					return
				if("Restore")
					M.staminaleft = 0
					M << "<font color=#808080>[usr] restored your stamina.</font>"

		Stop_Music()//Stop playing the music
			set hidden = 1
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			player << sound(null)

		Play_Music(S as sound)//Play the music
			set hidden = 1
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			player << sound(S)

		Admin_Lock(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(M.GMLock==1)
				usr<<"<font color=red>[M]'s powers are locked!"
				return
			switch(alert("Are you sure you want to lock [M]'s admin powers?","Lock [M]","Yes","No"))
				if("No")
					return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried Locking [M]'s Admin Powers")
						return
					var/Reason=input("What's the Reason?")as text
					M.GMLock=1

					AdminMessage("[usr] \red Locked \font [M]'s Admin Powers. (Reason: [Reason])")
					return

		Admin_UnLock(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers!"
				return
			if(M.GMLock==0)
				usr<<"<font color=red>[M]'s powers aren't locked!"
				return
			switch(alert("Are you sure you want to unlock [M]'s admin powers?","UnLock [M]","Yes","No"))
				if("No")
					return
				if("Yes")
					if(M.GMLevel>=GMLevel)
						AdminMessage("[usr] tried UnLocking [M]'s Admin Powers")
						return
					var/Reason=input("What's the Reason?")as text
					M.GMLock=0
					AdminMessage("[usr] \red UnLocked \font [M]'s Admin Powers. (Reason: [Reason])")
					return

		Movement_Lock(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Lock or UnLock [M]'s movement?","","Lock","UnLock"))
				if("Lock")
					switch(alert("Are you sure you want to lock [M]'s movement?","","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)
								AdminMessage("[usr] tried locking [M]'s movement.")
								return
							else
								var/Reason=input("Input a reason.")as text
								if(Reason)
									player<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font>by [src]. ([Reason])"
								else
									player<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font> by [src]."
								M.GMLocked=1
								M.it_lock=1
								return
						if("No")
							return
				if("UnLock")
					switch(alert("Are you sure you want to UnLock [M]'s movement?","Movement UnLock [M]","Yes","No"))
						if("Yes")
							if(M.GMLevel>=GMLevel&&M!=usr)
								if(!GMLevel==7)
									AdminMessage("[usr] tried UnLocking [M]'s movement.")
							var/Reason=input("Input a reason.")as text
							if(Reason)
								player<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font>by [src]. ([Reason])"
							else
								player<<"<b>[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font> by [src]."
							M.GMLocked=0
							M.it_lock=0
							return
						if("No")
							return

		Fix_Layers(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Fix Overlays or Underlays?","","Overlays","Underlays","Cancel"))
				if("Cancel")
					return
				if("Overlays")
					M.overlays -= M.overlays
					return
				if("Underlays")
					M.underlays -= M.underlays
					if(M.aura_on == 1)
						M.aura_on = 0
					return

		Buff_Resets(mob/PC/M in player)
			set category = "Admin"
			if(M.race == "Kai")
				M.buffdelay1=0
				M.buffdelay2=0
				M.buffdelay3=0
				M.buffdelay4=0
				M.buffdelay5=0
				M.buffdelay6=0
			if(M.race=="Majin Wizard")
				M.manipulationdelay=0
			M.expbuff=0
			M.staminabuff=0
			M.buff1=0
			M.buff2=0
			M.buff3=0
			M.buff4=0
			M.manipulated=0
			usr<<"You have reset [M]'s buffs"

		Turnontitles()
			set category = "Admin"
			set name = "Toggle Tourny Titles"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to toggle Tournament Titles?","Toggle Titles","Yes","No"))
				if("Yes")
					switch(alert("Turn title on or off?","Toggle Titles","On","Off"))
						if("On")
							juniort=1
							worldt=1
							galactict=1
							universalt=1
							world << "<center><FONT COLOR=#6a5acd>T</FONT><FONT COLOR=#6367d1>o</FONT><FONT COLOR=#5b74d5>u</FONT><FONT COLOR=#5280d9>r</FONT><FONT COLOR=#4a8ddd>n</FONT><FONT COLOR=#429ae1>a</FONT><FONT COLOR=#3aa7e5>m</FONT><FONT COLOR=#31b3e8>e</FONT><FONT COLOR=#29c0ec>n</FONT><FONT COLOR=#21cdf0>t</FONT><FONT COLOR=#19daf4> </FONT><FONT COLOR=#10e6f8>T</FONT><FONT COLOR=#08f3fc>i</FONT><FONT COLOR=#00ffff>t</FONT><FONT COLOR=#08f4fc>l</FONT><FONT COLOR=#0fe8f9>e</FONT><FONT COLOR=#17dcf5>s</FONT><FONT COLOR=#1fd1f1> </FONT><FONT COLOR=#26c5ee>A</FONT><FONT COLOR=#2eb9ea>c</FONT><FONT COLOR=#36ade7>t</FONT><FONT COLOR=#3da1e3>i</FONT><FONT COLOR=#4595df>v</FONT><FONT COLOR=#4c89dc>a</FONT><FONT COLOR=#547ed8>t</FONT><FONT COLOR=#5c72d4>e</FONT><FONT COLOR=#6366d1>d</FONT><FONT COLOR=#6a5acd>!</FONT></center>"
						if("Off")
							juniort=0
							worldt=0
							galactict=0
							universalt=0
							world << "<center>Tournament Titles De-activated</center>"
							for(var/mob/PC/M in player)
								M.juniorc=0
								M.worldc=0
								M.galacticc=0
								M.universalc=0
				if("No")
					return
	MasterGM/verb

		Toggle_Bosses()
			set category = "Admin"
			set name = "Toggle Bosses"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to toggle Bosses?","Toggle Bosses","Yes","No"))
				if("Yes")
					switch(alert("Turn Bosses on or off?","Toggle Bosses","On","Off"))
						if("On")
							bosses=1
							world << "<center><font color=#ff3333>Bosses Activated!</font></center>"
							spawn(600)Random_Boss()
						if("Off")
							bosses=0
							world << "<center>Bosses De-activated</center>"
				if("No")
					return

		Summon_Mob()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What Mob would you like to summon?")in list("Charizard","Mewtwo"))
				if("Charizard")
					switch(input("Summon where?")in list("Earth","Namek","Yardrat","Vegeta"))
						if("Earth")
							var/turf/T=locate(rand(1,400),rand(1,400),1)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_2(T)
							world << "<center><FONT COLOR=#708090>C</FONT><FONT COLOR=#738b9d>h</FONT><FONT COLOR=#7797aa>a</FONT><FONT COLOR=#7aa2b7>r</FONT><FONT COLOR=#7eadc5>i</FONT><FONT COLOR=#81b8d2>z</FONT><FONT COLOR=#85c4df>a</FONT><FONT COLOR=#87ceeb>r</FONT><FONT COLOR=#75c4dd>d</FONT><FONT COLOR=#61b8cd> </FONT><FONT COLOR=#4eadbe>h</FONT><FONT COLOR=#3aa2ae>a</FONT><FONT COLOR=#27979f>s</FONT><FONT COLOR=#138b8f> </FONT><FONT COLOR=#008080>l</FONT><FONT COLOR=#118a8e>a</FONT><FONT COLOR=#22949b>n</FONT><FONT COLOR=#339ea9>d</FONT><FONT COLOR=#44a8b6>e</FONT><FONT COLOR=#55b1c4>d</FONT><FONT COLOR=#66bbd1> </FONT><FONT COLOR=#77c5df>o</FONT><FONT COLOR=#87ceeb>n</FONT><FONT COLOR=#85c4df> </FONT><FONT COLOR=#81b8d2>E</FONT><FONT COLOR=#7eadc5>a</FONT><FONT COLOR=#7aa2b7>r</FONT><FONT COLOR=#7797aa>t</FONT><FONT COLOR=#738b9d>h</FONT><FONT COLOR=#708090>!</FONT></center>"
						if("Namek")
							var/turf/T=locate(rand(1,400),rand(1,400),2)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_2(T)
							world << "<center><FONT COLOR=#f5f5f5>C</FONT><FONT COLOR=#e5d3e5>h</FONT><FONT COLOR=#d4b0d4>a</FONT><FONT COLOR=#c38dc3>r</FONT><FONT COLOR=#b369b3>i</FONT><FONT COLOR=#a246a2>z</FONT><FONT COLOR=#912391>a</FONT><FONT COLOR=#800080>r</FONT><FONT COLOR=#791e8b>d</FONT><FONT COLOR=#713c96> </FONT><FONT COLOR=#695aa1>h</FONT><FONT COLOR=#6078ac>a</FONT><FONT COLOR=#5896b7>s</FONT><FONT COLOR=#50b4c2> </FONT><FONT COLOR=#48d1cc>l</FONT><FONT COLOR=#4fb8c3>a</FONT><FONT COLOR=#569eba>n</FONT><FONT COLOR=#5d83b0>d</FONT><FONT COLOR=#6569a7>e</FONT><FONT COLOR=#6c4f9d>d</FONT><FONT COLOR=#733593> </FONT><FONT COLOR=#7a1a8a>o</FONT><FONT COLOR=#800080>n</FONT><FONT COLOR=#912391> </FONT><FONT COLOR=#a246a2>N</FONT><FONT COLOR=#b369b3>a</FONT><FONT COLOR=#c38dc3>m</FONT><FONT COLOR=#d4b0d4>e</FONT><FONT COLOR=#e5d3e5>k</FONT><FONT COLOR=#f5f5f5>!</FONT></center>"
						if("Yardrat")
							var/turf/T=locate(rand(1,400),rand(1,400),4)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_2(T)
							world << "<center><FONT COLOR=#696969>C</FONT><FONT COLOR=#5b7e70>h</FONT><FONT COLOR=#4c9377>a</FONT><FONT COLOR=#3da87e>r</FONT><FONT COLOR=#2dbc86>i</FONT><FONT COLOR=#1ed18d>z</FONT><FONT COLOR=#0fe694>a</FONT><FONT COLOR=#00fa9a>r</FONT><FONT COLOR=#00dc98>d</FONT><FONT COLOR=#00bc94> </FONT><FONT COLOR=#009d91>h</FONT><FONT COLOR=#007e8e>a</FONT><FONT COLOR=#005e8a>s</FONT><FONT COLOR=#003f87> </FONT><FONT COLOR=#001f83>l</FONT><FONT COLOR=#000080>a</FONT><FONT COLOR=#001f83>n</FONT><FONT COLOR=#003f87>d</FONT><FONT COLOR=#005e8a>e</FONT><FONT COLOR=#007e8e>d</FONT><FONT COLOR=#009d91> </FONT><FONT COLOR=#00bc94>o</FONT><FONT COLOR=#00dc98>n</FONT><FONT COLOR=#00fa9a> </FONT><FONT COLOR=#0de995>Y</FONT><FONT COLOR=#1bd78f>a</FONT><FONT COLOR=#28c488>r</FONT><FONT COLOR=#35b282>d</FONT><FONT COLOR=#42a07c>r</FONT><FONT COLOR=#508e76>a</FONT><FONT COLOR=#5d7b6f>t</FONT><FONT COLOR=#696969>!</FONT></center>"
						if("Vegeta")
							var/turf/T=locate(rand(1,400),rand(1,400),3)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_2(T)
							world << "<center><FONT COLOR=#f4a460>C</FONT><FONT COLOR=#d2b165>h</FONT><FONT COLOR=#afbe69>a</FONT><FONT COLOR=#8ccb6e>r</FONT><FONT COLOR=#69d972>i</FONT><FONT COLOR=#46e677>z</FONT><FONT COLOR=#23f37b>a</FONT><FONT COLOR=#00ff7f>r</FONT><FONT COLOR=#1aec7c>d</FONT><FONT COLOR=#34d777> </FONT><FONT COLOR=#4dc373>h</FONT><FONT COLOR=#67ae6e>a</FONT><FONT COLOR=#819a6a>s</FONT><FONT COLOR=#9b8565> </FONT><FONT COLOR=#b47161>l</FONT><FONT COLOR=#cd5c5c>a</FONT><FONT COLOR=#b47161>n</FONT><FONT COLOR=#9b8565>d</FONT><FONT COLOR=#819a6a>e</FONT><FONT COLOR=#67ae6e>d</FONT><FONT COLOR=#4dc373> </FONT><FONT COLOR=#34d777>o</FONT><FONT COLOR=#1aec7c>n</FONT><FONT COLOR=#00ff7f> </FONT><FONT COLOR=#23f37b>V</FONT><FONT COLOR=#46e677>e</FONT><FONT COLOR=#69d972>g</FONT><FONT COLOR=#8ccb6e>e</FONT><FONT COLOR=#afbe69>t</FONT><FONT COLOR=#d2b165>a</FONT><FONT COLOR=#f4a460>!</FONT></center>"
				if("Mewtwo")
					switch(input("Summon where?")in list("Earth","Namek","Yardrat","Vegeta"))
						if("Earth")
							var/turf/T=locate(rand(1,400),rand(1,400),1)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Mewtwo(T)
							world << "<center><FONT COLOR=#ff0000>M</FONT><FONT COLOR=#ff0419>e</FONT><FONT COLOR=#ff0731>w</FONT><FONT COLOR=#ff0b4a>t</FONT><FONT COLOR=#ff0e63>w</FONT><FONT COLOR=#ff127b>o</FONT><FONT COLOR=#ff1493> </FONT><FONT COLOR=#ff2d9b>h</FONT><FONT COLOR=#ff45a3>a</FONT><FONT COLOR=#ff5eab>s</FONT><FONT COLOR=#ff77b4> </FONT><FONT COLOR=#ff90bc>l</FONT><FONT COLOR=#ffa8c4>a</FONT><FONT COLOR=#ffc0cb>n</FONT><FONT COLOR=#ffa8c4>d</FONT><FONT COLOR=#ff90bc>e</FONT><FONT COLOR=#ff77b4>d</FONT><FONT COLOR=#ff5eab> </FONT><FONT COLOR=#ff45a3>o</FONT><FONT COLOR=#ff2d9b>n</FONT><FONT COLOR=#ff1493> </FONT><FONT COLOR=#ff127b>E</FONT><FONT COLOR=#ff0e63>a</FONT><FONT COLOR=#ff0b4a>r</FONT><FONT COLOR=#ff0731>t</FONT><FONT COLOR=#ff0419>h</FONT><FONT COLOR=#ff0000>!</FONT></center>"
						if("Namek")
							var/turf/T=locate(rand(1,400),rand(1,400),2)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Mewtwo(T)
							world << "<center><FONT COLOR=#a9a9a9>M</FONT><FONT COLOR=#a0a594>e</FONT><FONT COLOR=#95a17d>w</FONT><FONT COLOR=#8b9c67>t</FONT><FONT COLOR=#809750>w</FONT><FONT COLOR=#76933a>o</FONT><FONT COLOR=#6b8e23> </FONT><FONT COLOR=#7d8f30>h</FONT><FONT COLOR=#8f913c>a</FONT><FONT COLOR=#a19249>s</FONT><FONT COLOR=#b49355> </FONT><FONT COLOR=#c69462>l</FONT><FONT COLOR=#d8966e>a</FONT><FONT COLOR=#e9967a>n</FONT><FONT COLOR=#d8966e>d</FONT><FONT COLOR=#c69462>e</FONT><FONT COLOR=#b49355>d</FONT><FONT COLOR=#a19249> </FONT><FONT COLOR=#8f913c>o</FONT><FONT COLOR=#7d8f30>n</FONT><FONT COLOR=#6b8e23> </FONT><FONT COLOR=#76933a>N</FONT><FONT COLOR=#809750>a</FONT><FONT COLOR=#8b9c67>m</FONT><FONT COLOR=#95a17d>e</FONT><FONT COLOR=#a0a594>k</FONT><FONT COLOR=#a9a9a9>!</FONT></center>"
						if("Yardrat")
							var/turf/T=locate(rand(1,400),rand(1,400),4)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Mewtwo(T)
							world << "<center><FONT COLOR=#66cdaa>M</FONT><FONT COLOR=#58ccb6>e</FONT><FONT COLOR=#4acac3>w</FONT><FONT COLOR=#3bc8cf>t</FONT><FONT COLOR=#2cc5db>w</FONT><FONT COLOR=#1dc3e7>o</FONT><FONT COLOR=#0fc1f4> </FONT><FONT COLOR=#00bfff>h</FONT><FONT COLOR=#18bdf4>a</FONT><FONT COLOR=#31b9e7>s</FONT><FONT COLOR=#49b6db> </FONT><FONT COLOR=#61b3ce>l</FONT><FONT COLOR=#79b0c2>a</FONT><FONT COLOR=#92acb5>n</FONT><FONT COLOR=#a9a9a9>d</FONT><FONT COLOR=#92acb5>e</FONT><FONT COLOR=#79b0c2>d</FONT><FONT COLOR=#61b3ce> </FONT><FONT COLOR=#49b6db>o</FONT><FONT COLOR=#31b9e7>n</FONT><FONT COLOR=#18bdf4> </FONT><FONT COLOR=#00bfff>Y</FONT><FONT COLOR=#0fc1f4>a</FONT><FONT COLOR=#1dc3e7>r</FONT><FONT COLOR=#2cc5db>d</FONT><FONT COLOR=#3bc8cf>r</FONT><FONT COLOR=#4acac3>a</FONT><FONT COLOR=#58ccb6>t</FONT><FONT COLOR=#66cdaa>!</FONT></center>"
						if("Vegeta")
							var/turf/T=locate(rand(1,400),rand(1,400),3)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Mewtwo(T)
							world << "<center><FONT COLOR=#800000>M</FONT><FONT COLOR=#7e1618>e</FONT><FONT COLOR=#7b2b30>w</FONT><FONT COLOR=#794149>t</FONT><FONT COLOR=#765661>w</FONT><FONT COLOR=#736c79>o</FONT><FONT COLOR=#708090> </FONT><FONT COLOR=#707e8b>h</FONT><FONT COLOR=#6f7a86>a</FONT><FONT COLOR=#6e7780>s</FONT><FONT COLOR=#6c737a> </FONT><FONT COLOR=#6b7074>l</FONT><FONT COLOR=#6a6c6f>a</FONT><FONT COLOR=#696969>n</FONT><FONT COLOR=#6a6c6f>d</FONT><FONT COLOR=#6b7074>e</FONT><FONT COLOR=#6c737a>d</FONT><FONT COLOR=#6e7780> </FONT><FONT COLOR=#6f7a86>o</FONT><FONT COLOR=#707e8b>n</FONT><FONT COLOR=#708090> </FONT><FONT COLOR=#726f7c>V</FONT><FONT COLOR=#755c68>e</FONT><FONT COLOR=#774a53>g</FONT><FONT COLOR=#7a373e>e</FONT><FONT COLOR=#7c2529>t</FONT><FONT COLOR=#7f1215>a</FONT><FONT COLOR=#800000>!</FONT></center>"

				if("Mega Charizard")
					switch(input("Summon where?")in list("Earth","Namek","Yardrat","Vegeta"))
						if("Earth")
							var/turf/T=locate(rand(1,400),rand(1,400),1)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_3(T)
							world << "<FONT COLOR=#0000cd>M</FONT><FONT COLOR=#1619cf>e</FONT><FONT COLOR=#2c31d2>g</FONT><FONT COLOR=#424ad4>a</FONT><FONT COLOR=#5963d6> </FONT><FONT COLOR=#6f7bd8>C</FONT><FONT COLOR=#8594db>h</FONT><FONT COLOR=#9bacdd>a</FONT><FONT COLOR=#b0c4de>r</FONT><FONT COLOR=#acbdc6>i</FONT><FONT COLOR=#a6b6ad>z</FONT><FONT COLOR=#a1ae95>a</FONT><FONT COLOR=#9ba67c>r</FONT><FONT COLOR=#969f63>d</FONT><FONT COLOR=#90974a> </FONT><FONT COLOR=#8b8f32>h</FONT><FONT COLOR=#858819>a</FONT><FONT COLOR=#808000>s</FONT><FONT COLOR=#858819> </FONT><FONT COLOR=#8b8f32>l</FONT><FONT COLOR=#90974a>a</FONT><FONT COLOR=#969f63>n</FONT><FONT COLOR=#9ba67c>d</FONT><FONT COLOR=#a1ae95>e</FONT><FONT COLOR=#a6b6ad>d</FONT><FONT COLOR=#acbdc6> </FONT><FONT COLOR=#b0c4de>o</FONT><FONT COLOR=#9bacdd>n</FONT><FONT COLOR=#8594db> </FONT><FONT COLOR=#6f7bd8>E</FONT><FONT COLOR=#5963d6>a</FONT><FONT COLOR=#424ad4>r</FONT><FONT COLOR=#2c31d2>t</FONT><FONT COLOR=#1619cf>h</FONT><FONT COLOR=#0000cd>!</FONT>"
						if("Namek")
							var/turf/T=locate(rand(1,400),rand(1,400),2)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_3(T)
							world << "<FONT COLOR=#ffffe0>M</FONT><FONT COLOR=#efede2>e</FONT><FONT COLOR=#dfdae4>g</FONT><FONT COLOR=#cec7e6>a</FONT><FONT COLOR=#beb4e8> </FONT><FONT COLOR=#ada1e9>C</FONT><FONT COLOR=#9c8eeb>h</FONT><FONT COLOR=#8c7bed>a</FONT><FONT COLOR=#7b68ee>r</FONT><FONT COLOR=#6e6ce4>i</FONT><FONT COLOR=#6070d9>z</FONT><FONT COLOR=#5374ce>a</FONT><FONT COLOR=#4578c3>r</FONT><FONT COLOR=#377cb7>d</FONT><FONT COLOR=#2980ac> </FONT><FONT COLOR=#1c84a1>h</FONT><FONT COLOR=#0e8896>a</FONT><FONT COLOR=#008b8b>s</FONT><FONT COLOR=#0e8896> </FONT><FONT COLOR=#1c84a1>l</FONT><FONT COLOR=#2980ac>a</FONT><FONT COLOR=#377cb7>n</FONT><FONT COLOR=#4578c3>d</FONT><FONT COLOR=#5374ce>e</FONT><FONT COLOR=#6070d9>d</FONT><FONT COLOR=#6e6ce4> </FONT><FONT COLOR=#7b68ee>o</FONT><FONT COLOR=#8c7bed>n</FONT><FONT COLOR=#9c8eeb> </FONT><FONT COLOR=#ada1e9>N</FONT><FONT COLOR=#beb4e8>a</FONT><FONT COLOR=#cec7e6>m</FONT><FONT COLOR=#dfdae4>e</FONT><FONT COLOR=#efede2>k</FONT><FONT COLOR=#ffffe0>!</FONT>"
						if("Yardrat")
							var/turf/T=locate(rand(1,400),rand(1,400),4)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_3(T)
							world << "<FONT COLOR=#483d8b>M</FONT><FONT COLOR=#415398>e</FONT><FONT COLOR=#3968a5>g</FONT><FONT COLOR=#317eb2>a</FONT><FONT COLOR=#2994bf> </FONT><FONT COLOR=#20a9cc>C</FONT><FONT COLOR=#18bfd9>h</FONT><FONT COLOR=#10d5e6>a</FONT><FONT COLOR=#08eaf3>r</FONT><FONT COLOR=#00ffff>i</FONT><FONT COLOR=#1cfefa>z</FONT><FONT COLOR=#39fbf5>a</FONT><FONT COLOR=#55f9ef>r</FONT><FONT COLOR=#72f7e9>d</FONT><FONT COLOR=#8ef4e4> </FONT><FONT COLOR=#abf2de>h</FONT><FONT COLOR=#c7f0d8>a</FONT><FONT COLOR=#e4edd3>s</FONT><FONT COLOR=#ffebcd> </FONT><FONT COLOR=#e4edd3>l</FONT><FONT COLOR=#c7f0d8>a</FONT><FONT COLOR=#abf2de>n</FONT><FONT COLOR=#8ef4e4>d</FONT><FONT COLOR=#72f7e9>e</FONT><FONT COLOR=#55f9ef>d</FONT><FONT COLOR=#39fbf5> </FONT><FONT COLOR=#1cfefa>o</FONT><FONT COLOR=#00ffff>n</FONT><FONT COLOR=#08eaf3> </FONT><FONT COLOR=#10d5e6>Y</FONT><FONT COLOR=#18bfd9>a</FONT><FONT COLOR=#20a9cc>r</FONT><FONT COLOR=#2994bf>d</FONT><FONT COLOR=#317eb2>r</FONT><FONT COLOR=#3968a5>a</FONT><FONT COLOR=#415398>t</FONT><FONT COLOR=#483d8b>!</FONT>"
						if("Vegeta")
							var/turf/T=locate(rand(1,400),rand(1,400),3)
					//		var/x = rand(1,400)
					//		var/y = rand(1,400)
							new/mob/Monster/MainMobs/Dragon_3(T)
							world << "<FONT COLOR=#7fff00>M</FONT><FONT COLOR=#85ff06>e</FONT><FONT COLOR=#8bff0c>g</FONT><FONT COLOR=#91ff12>a</FONT><FONT COLOR=#97ff18> </FONT><FONT COLOR=#9cff1e>C</FONT><FONT COLOR=#a2ff24>h</FONT><FONT COLOR=#a8ff2a>a</FONT><FONT COLOR=#adff2f>r</FONT><FONT COLOR=#b6fd40>i</FONT><FONT COLOR=#bffa50>z</FONT><FONT COLOR=#c9f761>a</FONT><FONT COLOR=#d2f472>r</FONT><FONT COLOR=#dbf082>d</FONT><FONT COLOR=#e4ed93> </FONT><FONT COLOR=#eeeaa4>h</FONT><FONT COLOR=#f7e7b4>a</FONT><FONT COLOR=#ffe4c4>s</FONT><FONT COLOR=#f7e7b4> </FONT><FONT COLOR=#eeeaa4>l</FONT><FONT COLOR=#e4ed93>a</FONT><FONT COLOR=#dbf082>n</FONT><FONT COLOR=#d2f472>d</FONT><FONT COLOR=#c9f761>e</FONT><FONT COLOR=#bffa50>d</FONT><FONT COLOR=#b6fd40> </FONT><FONT COLOR=#adff2f>o</FONT><FONT COLOR=#a9ff2b>n</FONT><FONT COLOR=#a4ff25> </FONT><FONT COLOR=#9eff20>V</FONT><FONT COLOR=#99ff1b>e</FONT><FONT COLOR=#94ff15>g</FONT><FONT COLOR=#8fff10>e</FONT><FONT COLOR=#89ff0b>t</FONT><FONT COLOR=#84ff05>a</FONT><FONT COLOR=#7fff00>!</FONT>"

		Get_Player_Save()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/list/file_list = flist("player saves/")
			file_list.Add("Cancel")
			var/file_chosen=input("Which file would you like to get??","Get File") in file_list
			if(file_chosen == "Cancel")
				return
			else
				usr<<ftp("player saves/[file_chosen]")
				return

		Delete_Player_Save()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to delete a players save file?","","Yes","No"))
				if("Yes")
					var/list/file_list = flist("player saves/")
					file_list.Add("Cancel")
					var/file_chosen=input("Which save file would you like to delete??","Delete Save File") in file_list
					if(file_chosen == "Cancel")
						return
					else
						var/copied = copytext("[file_chosen]",1,-11)
						for(var/mob/M in player)
							if(M.client&&M.client.ckey==copied)
								del( M)
						fdel("player saves/[file_chosen]")
						usr<<"[copied]'s save file has been deleted"
						AdminMessage("[usr] has deleted [copied]'s save file.")
						return
				if("No")
					return

/*		Real_Life_Effects()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Which Effects?") in list("Day/Night","Weather","Cancel"))
				if("Day/Night")
					src.GMdaycycle()
				if("Weather")
					src.GMWeather()
				if("Cancel")
					return*/

		Delete(M as obj|turf)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Delete?","","Yes","No"))
				if("Yes")
					del(M)
					return
				else
					return

/*		Give_Subscription(mob/M in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Give [M] Sub benefits?","Give Sub","Yes","No"))
				if("Yes")
					M.Sub=1
					return
				if("No")
					return

		Give_World_Subscriptions()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Give the World Sub benefits?","Give World Sub","Yes","No"))
				if("Yes")
					for(var/mob/PC/M in player)
						M.Sub = 1
					world << "[usr] has given the entire world access to Special Gym!!"
					return
				if("No")
					return*/

		World_ShutDown()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/YN=alert("Shutdown the world?","World ShutDown","No","Yes","Disable World Shutdown")
			if(YN=="No")
				return
			if(YN=="Disable World Shutdown")
				var/Stop=alert("Stop World Shutdown?","Stop World ShutDown.","Yes","No")
				if(Stop=="Yes")
					GM_WorldShutDownProc=0
					AdminMessage("[usr] stopped the world shutdown.")
					return
				else
					return
			if(YN=="Yes")
				GM_WorldShutDownProc=1
				player<<"<font color=red>World Shutdown enabled. Saving Characters."
				for(var/mob/PC/M in player)
					if(!M.loggedin)continue
					M.client.SaveChar()
					sleep(1)
				player<<"<font color=red>Characters Saved! World Shutdown in 30 seconds."
				AdminMessage("[usr] has innitiated the world shutdown.")
				sleep(100)
				if(!GM_WorldShutDownProc)
					player<<"<font color=red>World Shutdown disabled."
					return
				player<<"<font color=red>World Shutdown in 20 seconds."
				sleep(100)
				if(!GM_WorldShutDownProc)
					player<<"<font color=red>World Shutdown disabled."
					return
				player<<"<font color=red>World Shutdown in 10 seconds."
				cantsaveatall=1
				sleep(100)
				if(!GM_WorldShutDownProc)
					player<<"<font color=red>World Shutdown disabled."
					return
				player<<"<font color=red>Shutdown."
				sleep(1)
				del(world)

		Restore_All_Stamina()
			set hidden = 1
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Restore everyone's Stamina?","","Restore","Cancel"))
				if("Cancel")
					return
				if("Restore")
					for(var/mob/PC/M in player)
						M.staminaleft=0
					player << "<font color=#00ffff>[usr] has restored everyones stamina.</font>"

		Teleport_2_XYZ()
			set hidden = 1
			set category = "Admin"
			if(GMLockCheck())
				usr<<"font color=red>Your Admin Powers Are Locked."
				return
			var/x=input("Whats the x co ord?","X Co-ord") as num
			if(x<1||x>500)
				usr<<alert("You must enter a number between 1 and 500")
				return
			var/y=input("Whats the y co ord?","Y Co-ord") as num
			if(y<1||y>500)
				usr<<alert("You must enter a number between 1 and 500")
				return
			var/z=input("Whats the z co ord?","Z Co-ord") as num
			if(z<1||z>500)
				usr<<alert("You must enter a number between 1 and 500")
				return
			usr.loc=locate(x,y,z)
			usr<<"Teleport complete"

		Start_Horde()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			usr << "Currently disabled"
			return
			switch(input("Which Horde would you like to start?")in list("Android Horde","Angel Horde","Bio Android Horde","Demon Horde","Kai Horde","Majin Horde","Namekian Horde","Saibaman Horde","Saiyan Horde","Tuffle Horde"))
				if("Android Horde")
					Android_Horde()
				if("Angel Horde")
					Angel_Horde()
				if("Bio Android Horde")
					BioAndroid_Horde()
				if("Demon Horde")
					Demon_Horde()
				if("Kai Horde")
					Kai_Horde()
				if("Majin Horde")
					Majin_Horde()
				if("Namekian Horde")
					Namekian_Horde()
				if("Saiyan Horde")
					Saiyan_Horde()
				if("Saibaman Horde")
					Saiba_Horde()
				if("Tuffle Horde")
					Tuffle_Horde()

		Dragonball_Manage()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Revive, Destroy or Summon?")in list("Revive","Destroy","Summon","Cancel"))
				if("Destroy")
					switch(alert("Destroy the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Destroy wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									for(var/obj/Earth_Dragonballs/O in world)
										del(O)
									return
								if("Namek")
									for(var/obj/Namek_Dragonballs/O in world)
										del(O)
									return
								if("Black Star")
									for(var/obj/Black_Dragonballs/O in world)
										del(O)
									return
								if("Cancel")
									return
						else
							return
				if("Revive")
					alert("The games has an implanted Auto Dragonball Spawner. You might create a chain dragonball spawn. Don't use this verb unless you know what your doing.")
					switch(alert("Revive the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Revive wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									var/lastdb
									if(!lastdbe)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Earth Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbe=world.time
										world.Earth_Dragonball_Spawn(1)
								if("Namek")
									var/lastdb
									if(!lastdbn)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Namekian Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbn=world.time
										world.Namek_Dragonball_Spawn(1)
								if("Black Star")
									var/lastdb
									if(!lastdbb)
										lastdb="Not performed yet"
									else
										lastdb="[round(((world.time/10)/60)-((lastdbe/10)/60))] minutes ago"
									if(alert("Last Black Dragonball Revive was: [lastdb]. Revive Dragonballs?","","Yes","No")=="Yes")
										lastdbb=world.time
										world.Black_Dragonball_Spawn(1)
								if("Cancel")
									return
				if("Summon")
					switch(alert("Summon the Dragonballs?","","Yes","No"))
						if("Yes")
							switch(input("Summon wich?")in list("Cancel","Earth","Namek","Black Star"))
								if("Earth")
									for(var/obj/Earth_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Namek")
									for(var/obj/Namek_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Black Star")
									for(var/obj/Black_Dragonballs/O in world)
										O.loc = locate(usr.x,usr.y,usr.z)
									return
								if("Cancel")
									return
						else
							return

		Server_Message_Update()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/servermsg=input("What do you want the server message to be??(Normally Ruination {Version 4.xx})","Update Server Message","Ruination {Version 4.0}") as text
			world.status = "[servermsg]<br><b>Players:</b> [players]<br>EXP:</b> +[(sexp-1)*100]%<br><b>Zenni:</b> +[(szenni-1)*100]%<br><b>Kill Boost:</b> x[s_kill]"

/*
		DropRandomShard()
			set category = "Admin"
			set name = "Drop Random Shard"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/type=rand(1,30)
			if(prob(33))
				if(type<=10)
					var/obj/Equipment/Buff_Items/SEXP_Shard/O = new
					O.loc = usr.loc
				if(type>10&&type<=20)
					var/obj/Equipment/Buff_Items/SSTT_Shard/O = new
					O.loc = usr.loc
				if(type>20&&type<=30)
					var/obj/Equipment/Buff_Items/SZ_Shard/O = new
					O.loc = usr.loc
			else
				if(prob(33))
					if(type<=10)
						var/obj/Equipment/Buff_Items/LEXP_Shard/O = new
						O.loc = usr.loc
					if(type>10&&type<=20)
						var/obj/Equipment/Buff_Items/LSTT_Shard/O = new
						O.loc = usr.loc
					if(type>20&&type<=30)
						var/obj/Equipment/Buff_Items/LZ_Shard/O = new
						O.loc = usr.loc
				else
					if(type<=10)
						var/obj/Equipment/Buff_Items/MEXP_Shard/O = new
						O.loc = usr.loc
					if(type>10&&type<=20)
						var/obj/Equipment/Buff_Items/MSTT_Shard/O = new
						O.loc = usr.loc
					if(type>20&&type<=30)
						var/obj/Equipment/Buff_Items/MZ_Shard/O = new
						O.loc = usr.loc
						*/
		Race_and_gene_changer()
			set category = "Admin"
			var/tmp/race=input("What do you want your race to be?","Race")
			usr.race=race
			var/tmp/gene=input("What do you want your gene to be?","Gene")
			usr.gene=gene
			usr<<"<big>Your race is [race], your gene is [gene]"
		Turnontitles()
			set category = "Admin"
			set name = "Toggle Tourny Titles"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Are you sure you want to toggle Tournament Titles?","Toggle Titles","Yes","No"))
				if("Yes")
					switch(alert("Turn title on or off?","Toggle Titles","On","Off"))
						if("On")
							juniort=1
							worldt=1
							galactict=1
							universalt=1
							player << "<center><FONT COLOR=#6a5acd>T</FONT><FONT COLOR=#6367d1>o</FONT><FONT COLOR=#5b74d5>u</FONT><FONT COLOR=#5280d9>r</FONT><FONT COLOR=#4a8ddd>n</FONT><FONT COLOR=#429ae1>a</FONT><FONT COLOR=#3aa7e5>m</FONT><FONT COLOR=#31b3e8>e</FONT><FONT COLOR=#29c0ec>n</FONT><FONT COLOR=#21cdf0>t</FONT><FONT COLOR=#19daf4> </FONT><FONT COLOR=#10e6f8>T</FONT><FONT COLOR=#08f3fc>i</FONT><FONT COLOR=#00ffff>t</FONT><FONT COLOR=#08f4fc>l</FONT><FONT COLOR=#0fe8f9>e</FONT><FONT COLOR=#17dcf5>s</FONT><FONT COLOR=#1fd1f1> </FONT><FONT COLOR=#26c5ee>A</FONT><FONT COLOR=#2eb9ea>c</FONT><FONT COLOR=#36ade7>t</FONT><FONT COLOR=#3da1e3>i</FONT><FONT COLOR=#4595df>v</FONT><FONT COLOR=#4c89dc>a</FONT><FONT COLOR=#547ed8>t</FONT><FONT COLOR=#5c72d4>e</FONT><FONT COLOR=#6366d1>d</FONT><FONT COLOR=#6a5acd>!</FONT></center>"
						if("Off")
							juniort=0
							worldt=0
							galactict=0
							universalt=0
							player << "<center>Tournament Titles De-activated</center>"
							for(var/mob/PC/M in player)
								M.juniorc=0
								M.worldc=0
								M.galacticc=0
								M.universalc=0
				if("No")
					return



		Edit(mob/O as obj|mob|turf in world)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(ismob(O))
				if(O.GMLevel>=GMLevel)
					if(!GMLevel==7)
						alert("You can only Edit Admins of a rank lower than your own.")
						return
			switch(alert("Do you wish to edit a set variable or do you want to specify the var?","","Normal Edit","Specify Edit","Cancel"))
				if("Cancel")
					return
				if("Specify Edit")
					var/list/Choices = list()
					var/newvar=input("Whats the name of the var you which to edit?")as text
					for(var/V in O.vars)
						if(V==newvar)
							Choices.Add(newvar)
					Choices.Add("Cancel")
					var/variable = input("Which variable?","Var") in Choices
					if(variable=="Cancel")
						return
					if(variable=="name")
						usr << "Use Rename verb"
						return
					var/default
					var/typeof = O.vars[variable]
					var/dir
					var/b4
					if(isnull(typeof))
						usr << "Unable to determine variable type."
					else if(isnum(typeof))
						usr << "Variable appears to be <b>NUM</b>."
						default = "num"
						dir = 1
					else if(istext(typeof))
						usr << "Variable appears to be <b>TEXT</b>."
						default = "text"
					else if(isloc(typeof))
						usr << "Variable appears to be <b>REFERENCE</b>."
						default = "reference"
					else if(isicon(typeof))
						usr << "Variable appears to be <b>ICON</b>."
						typeof = "\icon[typeof]"
						default = "icon"
					else if(istype(typeof,/atom) || istype(typeof,/datum))
						usr << "Variable appears to be <b>TYPE</b>."
						default = "type"
					else if(istype(typeof,/list))
						usr << "Variable appears to be <b>LIST</b>."
						default = "cancel"
					else if(istype(typeof,/client))
						usr << "Variable appears to be <b>CLIENT</b>."
						default = "cancel"
					else
						usr << "Variable appears to be <b>FILE</b>."
						default = "file"
					usr << "Variable contains: [typeof]"
			//		if(name)
			//			usr << "Use Rename verb"
			//			return
					if(dir)
						switch(typeof)
							if(1)
								dir = "NORTH"
							if(2)
								dir = "SOUTH"
							if(4)
								dir = "EAST"
							if(8)
								dir = "WEST"
							if(5)
								dir = "NORTHEAST"
							if(6)
								dir = "SOUTHEAST"
							if(9)
								dir = "NORTHWEST"
							if(10)
								dir = "SOUTHWEST"
							else
								dir = null
						if(dir)
							usr << "If a direction, direction is: [dir]"
					var/class = input("What kind of variable?","Variable Type",default) in list("text",
						"num","type","reference","icon","file","restore to default","cancel")
					switch(class)
						if("cancel")
							return
						if("restore to default")
							b4=O.vars[variable]
							O.vars[variable] = initial(O.vars[variable])
						if("text")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new text:","Text",\
								O.vars[variable]) as text
						if("num")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new number:","Num",\
								O.vars[variable]) as num
						if("type")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
								in typesof(/obj,/mob,/turf)
						if("reference")
							b4=O.vars[variable]
							O.vars[variable] = input("Select reference:","Reference",\
								O.vars[variable]) as mob|obj|turf in world
						if("file")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
								as file
						if("icon")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
								as icon
					EditLog(src,"Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
				if("Normal Edit")
					var/list/Choices = list("level","exp","powerlevel","powerlevel_max","ki","ki_max","strength","strength_max","defence","defence_max","staminaleft","staminaleft_max","karma","karma_rating","rage","wishes","tp","skill_points","custom_points","zenni")
					for(var/V in O.vars) Choices.Add(V)
					Choices-="key"
					Choices-="ckey"
					Choices-="contents"
					Choices-="verbs"
					Choices-="overlays"
					Choices-="underlays"
					Choices-="GMLevel"
					Choices-="GMLock"
					Choices-="GMLocked"
					Choices-="GM_ChatMute"
					Choices-="vars"
					Choices-="group"
					Choices-="type"
					Choices-="parent_type"
					Choices-="client"
					var/variable = input("Which var?","Var") in Choices
					var/default
					var/typeof = O.vars[variable]
					var/dir
					if(isnull(typeof))
						usr << "Unable to determine variable type."
					else if(isnum(typeof))
						usr << "Variable appears to be <b>NUM</b>."
						default = "num"
						dir = 1
					else if(istext(typeof))
						usr << "Variable appears to be <b>TEXT</b>."
						default = "text"
					else if(isloc(typeof))
						usr << "Variable appears to be <b>REFERENCE</b>."
						default = "reference"
					else if(isicon(typeof))
						usr << "Variable appears to be <b>ICON</b>."
						typeof = "\icon[typeof]"
						default = "icon"
					else if(istype(typeof,/atom) || istype(typeof,/datum))
						usr << "Variable appears to be <b>TYPE</b>."
						default = "type"
					else if(istype(typeof,/list))
						usr << "Variable appears to be <b>LIST</b>."
						default = "cancel"
					else if(istype(typeof,/client))
						usr << "Variable appears to be <b>CLIENT</b>."
						default = "cancel"
					else
						usr << "Variable appears to be <b>FILE</b>."
						default = "file"
					usr << "Variable contains: [typeof]"
					if(dir)
						switch(typeof)
							if(1)
								dir = "NORTH"
							if(2)
								dir = "SOUTH"
							if(4)
								dir = "EAST"
							if(8)
								dir = "WEST"
							if(5)
								dir = "NORTHEAST"
							if(6)
								dir = "SOUTHEAST"
							if(9)
								dir = "NORTHWEST"
							if(10)
								dir = "SOUTHWEST"
							else
								dir = null
						if(dir)
							usr << "If a direction, direction is: [dir]"
					var/class = input("What kind of variable?","Variable Type",default) in list("text",
						"num","type","reference","icon","file","restore to default","cancel")
					var/b4
					switch(class)
						if("cancel")
							return
						if("restore to default")
							b4=O.vars[variable]
							O.vars[variable] = initial(O.vars[variable])
						if("text")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new text:","Text",\
								O.vars[variable]) as text
						if("num")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter new number:","Num",\
								O.vars[variable]) as num
						if("type")
							b4=O.vars[variable]
							O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
								in typesof(/obj,/mob,/turf)
						if("reference")
							b4=O.vars[variable]
							O.vars[variable] = input("Select reference:","Reference",\
								O.vars[variable]) as mob|obj|turf in world
						if("file")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
								as file
						if("icon")
							b4=O.vars[variable]
							O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
								as icon
					EditLog(src,"Edit: Target: [O] - Variable: [variable] - Before edit: [b4] - After edit: [O.vars[variable]]")
					return
/*
		Talk_as_Player(mob/PC/N in player,T as text)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(Check_For_Spam(T,SPAM) == TRUE)
				usr<<"Please do not use linebreak characters."
				return
			for(var/mob/PC/M in player)
				if(!N.GMLevel)
					if(M.ooc_on)
						if(N.in_guild)
							M << {"<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.guild_name]<b><font color=#6E6E6F>}{[N.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"}
						else
							if(!N.in_guild)
								M << {"<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"}
				else
					if(N.GMLevel>=usr.GMLevel)
						usr<<alert("Sorry you have a lower or the same GM Level than [N]")
						return
					if(N.in_guild)
						M << {"<b><font color=#4286f4>(GM:[N.GMLevel])</font><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.guild_name]<b><font color=#6E6E6F>}{[N.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"}
					else
						if(!N.in_guild)
							M << {"<b><font color=#4286f4>[N.GMLevel]</font><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"}
			for(var/mob/PC/M in player)
				if(M.hearall)
					if(N.in_guild)
						M << "Hearall {<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.guild_name]<b><font color=#6E6E6F>}{[N.guild_title]<b></u></s><font color=#6E6E6F>}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"
					else
						M << "Hearall {<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = white>[N.name] OOC: [textcolor]<font size = 1>[T]"
			AdminMessage("[usr] has pretended [N] said: [T]")
*/


	StaffGM/verb

		Delete_file()
			set category = "Admin"
			if(usr.key=="Crimson Slayer"||usr.key=="Cazdogga"||usr.key=="Hammerboy"||usr.key == "Narmanb")
				var/list/file_list = flist("world save files/")
				file_list.Add("Cancel")
				var/file_chosen=input("Which file would you like to delete??","Delete File") in file_list
				if(file_chosen == "Cancel")
					return
				if(file_chosen == "Edit Use/")
					var/list/edit_list = flist("world save files/Edit Use/")
					edit_list.Add("Cancel")
					if(edit_list == "Cancel")
						return
					else
						var/edit_chosen=input("Which file would you like to Delete??","Delete File") in edit_list
						fdel("world save files/Edit Use/[edit_chosen]")
						return
				if(file_chosen == "Login Log/")
					var/list/login_list = flist("world save files/Login Log/")
					login_list.Add("Cancel")
					if(login_list == "Cancel")
						return
					else
						var/login_chosen=input("Which file would you like to Delete??","Delete File") in login_list
						fdel("world save files/Edit Use/[login_chosen]")
						return
				else
					fdel("world save files/[file_chosen]")
					usr << "<b>You have Deleted [file_chosen], you will need to reboot for any changes to take effect!</b>"
					return
			else
				/*
				var/list/file_list = flist("world save files/")
				file_list.Add("Cancel")
				var/file_chosen=input("Which file would you like to delete??","Delete File") in file_list
				if(file_chosen == "Cancel")
					return
				if(file_chosen == "Edit Use/")
					alert("This has been restricted to prevent abuse")
					return
				if(file_chosen == "Login Log/")
					var/list/login_list = flist("world save files/Login Log/")
					login_list.Add("Cancel")
					if(login_list == "Cancel")
						return
					else
						var/login_chosen=input("Which file would you like to Delete??","Delete File") in login_list
						fdel("world save files/Edit Use/[login_chosen]")
						return
				else
					fdel("world save files/[file_chosen]")
					usr << "<b>You have Deleted [file_chosen], you will need to use world save for any changes to take effect!</b>"
					return
					*/

		Reset_Level(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Reset their level?","Reset Level","Yes","No"))
				if("No")
					return
				if("Yes")
					M.level = 1
					M.tnl = 20
					M.mode = "Weak"
					M.up1 = 0
					M.up2 = 0
					M.up3 = 0
					M.up4 = 0
					M.up5 = 0
					M.up6 = 0
					M.up7 = 0
					M.up8 = 0
					M.up9 = 0
					M.up10 = 0
					M.up11 = 0
					M.up12 = 0
					M.up13 = 0
					M.up14 = 0
					M.up15 = 0
					return

		Give_Techs(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Give someone a technique?","Give Tech","Yes","No"))
				if("No")
					return
				if("Yes")
					switch(input("Give someone a technique?","Give Tech")in list("Absorb","Candy Ray","Corrupt","Drain","Infect","Nvm"))
						if("Nvm")
							return
						if("Absorb")
							M.contents += new/obj/Technique/Absorb
							M<<"You have learnt Absorb"
						if("Candy Ray")
							M.contents += new/obj/Technique/CandyRay
							M<<"You have learnt Candy Ray"
						if("Corrupt")
							M.contents += new/obj/Technique/Corrupt
							M<<"You have learnt Corrupt"
						if("Drain")
							M.contents += new/obj/Technique/Drain
							M<<"You have learnt Drain"
						if("Infect")
							M.contents += new/obj/Technique/Infect
							M<<"You have learnt Infect"



		Player_Check()
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/browsewindow

			browsewindow += "<font color=#105090>Player Information:"

		//	usr<<browse(browsewindow,"window=Players Online;size=800x600")
			//usr<<"<font color=#105090>Player Information:"

			for(var/mob/M in player)
				if(M.client)
					browsewindow += "<font color=#105090>  Name: [M.name]. Key: [M.key]. Address: [M.client.address]."
				//	usr<<"<font color=#105090>  Name: [M.name]. Key: [M.key]. Address: [M.client.address]."
			usr<<browse(browsewindow,"window=Player Check;size=800x600")
			return


		Server_Kill_Bonus()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Increase server kill gain to what?? (0 is no kill for a kill, normal is x1, max should be x2%)","Server Exp")in list("x0","x1","x2","x3","x5","x10","x20","x100","Cancel"))
				if("Cancel")
					return
				if("x0")
					s_kill=0
					player << "<center><FONT COLOR=#a0522d>S</FONT><FONT COLOR=#9b5e3a>e</FONT><FONT COLOR=#956b46>r</FONT><FONT COLOR=#8f7753>v</FONT><FONT COLOR=#89845f>e</FONT><FONT COLOR=#84906c>r</FONT><FONT COLOR=#7e9c79> </FONT><FONT COLOR=#78a985>K</FONT><FONT COLOR=#72b592>i</FONT><FONT COLOR=#6cc29e>l</FONT><FONT COLOR=#66cdaa>l</FONT><FONT COLOR=#75d1ae> </FONT><FONT COLOR=#85d4b3>B</FONT><FONT COLOR=#94d8b7>o</FONT><FONT COLOR=#a4dbbc>n</FONT><FONT COLOR=#b3dfc0>u</FONT><FONT COLOR=#c2e2c4>s</FONT><FONT COLOR=#d2e6c9> </FONT><FONT COLOR=#e1e9cd>x</FONT><FONT COLOR=#f1edd2> </FONT><FONT COLOR=#ffefd5>0</FONT></center>"
				if("x1")
					s_kill=1
					player << "<center><FONT COLOR=#8b0000>S</FONT><FONT COLOR=#95191a>e</FONT><FONT COLOR=#9f3233>r</FONT><FONT COLOR=#aa4b4d>v</FONT><FONT COLOR=#b46466>e</FONT><FONT COLOR=#be7d80>r</FONT><FONT COLOR=#c8959a> </FONT><FONT COLOR=#d2aeb3>K</FONT><FONT COLOR=#ddc7cd>i</FONT><FONT COLOR=#e7e0e6>l</FONT><FONT COLOR=#f0f8ff>l</FONT><FONT COLOR=#f2f8fe> </FONT><FONT COLOR=#f3f9fd>B</FONT><FONT COLOR=#f5f9fb>o</FONT><FONT COLOR=#f6f9fa>n</FONT><FONT COLOR=#f8faf8>u</FONT><FONT COLOR=#fafaf6>s</FONT><FONT COLOR=#fbfaf5> </FONT><FONT COLOR=#fdfaf3>x</FONT><FONT COLOR=#fefaf2> </FONT><FONT COLOR=#fffaf0>1</FONT></center>"
				if("x2")
					s_kill=2
					player << "<center><FONT COLOR=#66cdaa>S</FONT><FONT COLOR=#75d1b0>e</FONT><FONT COLOR=#84d4b6>r</FONT><FONT COLOR=#93d8bc>v</FONT><FONT COLOR=#a2dbc2>e</FONT><FONT COLOR=#b1dfc9>r</FONT><FONT COLOR=#bfe3cf> </FONT><FONT COLOR=#cee6d5>K</FONT><FONT COLOR=#ddeadb>i</FONT><FONT COLOR=#ecede1>l</FONT><FONT COLOR=#faf0e6>l</FONT><FONT COLOR=#f6e6d6> </FONT><FONT COLOR=#f2dbc5>B</FONT><FONT COLOR=#edd1b5>o</FONT><FONT COLOR=#e9c6a4>n</FONT><FONT COLOR=#e4bb93>u</FONT><FONT COLOR=#dfb082>s</FONT><FONT COLOR=#dba571> </FONT><FONT COLOR=#d69b61>x</FONT><FONT COLOR=#d29050> </FONT><FONT COLOR=#cd853f>2</FONT></center>"
				if("x3")
					s_kill=3
					player << "<center><FONT COLOR=#ffdead>S</FONT><FONT COLOR=#f6ceb0>e</FONT><FONT COLOR=#ebbcb3>r</FONT><FONT COLOR=#e1abb7>v</FONT><FONT COLOR=#d79aba>e</FONT><FONT COLOR=#cd89bd>r</FONT><FONT COLOR=#c277c0> </FONT><FONT COLOR=#b866c3>K</FONT><FONT COLOR=#ae55c7>i</FONT><FONT COLOR=#a343ca>l</FONT><FONT COLOR=#9932cc>l</FONT><FONT COLOR=#a246d0> </FONT><FONT COLOR=#ac59d4>B</FONT><FONT COLOR=#b56dd9>o</FONT><FONT COLOR=#be80dd>n</FONT><FONT COLOR=#c894e1>u</FONT><FONT COLOR=#d1a8e5>s</FONT><FONT COLOR=#dabbe9> </FONT><FONT COLOR=#e3cfee>x</FONT><FONT COLOR=#ede2f2> </FONT><FONT COLOR=#f5f5f5>3</FONT></center>"
				if("x5")
					s_kill=5
					player << "<center><FONT COLOR=#ff0000>S</FONT><FONT COLOR=#ff1213>e</FONT><FONT COLOR=#ff2527>r</FONT><FONT COLOR=#ff373a>v</FONT><FONT COLOR=#ff494e>e</FONT><FONT COLOR=#ff5c61>r</FONT><FONT COLOR=#ff6e74> </FONT><FONT COLOR=#ff8088>K</FONT><FONT COLOR=#ff929b>i</FONT><FONT COLOR=#ffa5af>l</FONT><FONT COLOR=#ffb6c1>l</FONT><FONT COLOR=#f6aac2> </FONT><FONT COLOR=#eb9cc3>B</FONT><FONT COLOR=#e18fc5>o</FONT><FONT COLOR=#d782c6>n</FONT><FONT COLOR=#cd75c7>u</FONT><FONT COLOR=#c267c8>s</FONT><FONT COLOR=#b85ac9> </FONT><FONT COLOR=#ae4dcb>x</FONT><FONT COLOR=#a33fcc> </FONT><FONT COLOR=#9932cc>5</FONT></center>"
				if("x10")
					s_kill=10
					player << "<center><FONT COLOR=#ff0000>S</FONT><FONT COLOR=#ff1213>e</FONT><FONT COLOR=#ff2527>r</FONT><FONT COLOR=#ff373a>v</FONT><FONT COLOR=#ff494e>e</FONT><FONT COLOR=#ff5c61>r</FONT><FONT COLOR=#ff6e74> </FONT><FONT COLOR=#ff8088>K</FONT><FONT COLOR=#ff929b>i</FONT><FONT COLOR=#ffa5af>l</FONT><FONT COLOR=#ffb6c1>l</FONT><FONT COLOR=#f6aac2> </FONT><FONT COLOR=#eb9cc3>B</FONT><FONT COLOR=#e18fc5>o</FONT><FONT COLOR=#d782c6>n</FONT><FONT COLOR=#cd75c7>u</FONT><FONT COLOR=#c267c8>s</FONT><FONT COLOR=#b85ac9> </FONT><FONT COLOR=#ae4dcb>x</FONT><FONT COLOR=#a33fcc> </FONT><FONT COLOR=#9932cc>10</FONT></center>"
				if("x20")
					s_kill=20
					player << "<center><FONT COLOR=#ff0000>S</FONT><FONT COLOR=#ff1213>e</FONT><FONT COLOR=#ff2527>r</FONT><FONT COLOR=#ff373a>v</FONT><FONT COLOR=#ff494e>e</FONT><FONT COLOR=#ff5c61>r</FONT><FONT COLOR=#ff6e74> </FONT><FONT COLOR=#ff8088>K</FONT><FONT COLOR=#ff929b>i</FONT><FONT COLOR=#ffa5af>l</FONT><FONT COLOR=#ffb6c1>l</FONT><FONT COLOR=#f6aac2> </FONT><FONT COLOR=#eb9cc3>B</FONT><FONT COLOR=#e18fc5>o</FONT><FONT COLOR=#d782c6>n</FONT><FONT COLOR=#cd75c7>u</FONT><FONT COLOR=#c267c8>s</FONT><FONT COLOR=#b85ac9> </FONT><FONT COLOR=#ae4dcb>x</FONT><FONT COLOR=#a33fcc> </FONT><FONT COLOR=#9932cc>20</FONT></center>"
				if("x100")
					s_kill=100
					player << "<center><FONT COLOR=#ff0000>S</FONT><FONT COLOR=#ff1213>e</FONT><FONT COLOR=#ff2527>r</FONT><FONT COLOR=#ff373a>v</FONT><FONT COLOR=#ff494e>e</FONT><FONT COLOR=#ff5c61>r</FONT><FONT COLOR=#ff6e74> </FONT><FONT COLOR=#ff8088>K</FONT><FONT COLOR=#ff929b>i</FONT><FONT COLOR=#ffa5af>l</FONT><FONT COLOR=#ffb6c1>l</FONT><FONT COLOR=#f6aac2> </FONT><FONT COLOR=#eb9cc3>B</FONT><FONT COLOR=#e18fc5>o</FONT><FONT COLOR=#d782c6>n</FONT><FONT COLOR=#cd75c7>u</FONT><FONT COLOR=#c267c8>s</FONT><FONT COLOR=#b85ac9> </FONT><FONT COLOR=#ae4dcb>x</FONT><FONT COLOR=#a33fcc> </FONT><FONT COLOR=#9932cc>100</FONT></center>"

		Server_Exp()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Increase server exp gain to what?? (Normal Max should be +100%)","Server Exp")in list("+0%","+25%","+50%","+75%","+100%","+150%","+200%","+250%","+300%","+400%","+500%","+600%","+700%","+800%","+900%","+1000%","+2000%","+10000%","Cancel"))
				if("Cancel")
					return
				if("+0%")
					sexp=1
					player << "<center><FONT COLOR=#00ff00>S</FONT><FONT COLOR=#0ce017>e</FONT><FONT COLOR=#18bf2f>r</FONT><FONT COLOR=#259f46>v</FONT><FONT COLOR=#317e5d>e</FONT><FONT COLOR=#3d5e75>r</FONT><FONT COLOR=#483d8b> </FONT><FONT COLOR=#3f5978>E</FONT><FONT COLOR=#347564>x</FONT><FONT COLOR=#2a9150>p</FONT><FONT COLOR=#1fac3c> </FONT><FONT COLOR=#15c828>+</FONT><FONT COLOR=#0ae414>0</FONT><FONT COLOR=#00ff00>%</FONT></center>"
				if("+25%")
					sexp=1.25
					player << "<center><FONT COLOR=#191970>S</FONT><FONT COLOR=#34347e>e</FONT><FONT COLOR=#4e4e8d>r</FONT><FONT COLOR=#69699b>v</FONT><FONT COLOR=#8484a9>e</FONT><FONT COLOR=#9f9fb7>r</FONT><FONT COLOR=#b9b9c6> </FONT><FONT COLOR=#d3d3d3>E</FONT><FONT COLOR=#b9b9c6>x</FONT><FONT COLOR=#9f9fb7>p</FONT><FONT COLOR=#8484a9> </FONT><FONT COLOR=#69699b>+</FONT><FONT COLOR=#4e4e8d>2</FONT><FONT COLOR=#34347e>5</FONT><FONT COLOR=#191970>%</FONT></center>"
				if("+50%")
					sexp=1.5
					player << "<center><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#0714e8>e</FONT><FONT COLOR=#0d28d0>r</FONT><FONT COLOR=#143cb8>v</FONT><FONT COLOR=#1b509f>e</FONT><FONT COLOR=#226487>r</FONT><FONT COLOR=#28786f> </FONT><FONT COLOR=#2e8b57>E</FONT><FONT COLOR=#28786f>x</FONT><FONT COLOR=#226487>p</FONT><FONT COLOR=#1b509f> </FONT><FONT COLOR=#143cb8>+</FONT><FONT COLOR=#0d28d0>5</FONT><FONT COLOR=#0714e8>0</FONT><FONT COLOR=#0000ff>%</FONT></center>"
				if("+75%")
					sexp=1.75
					player << "<center><FONT COLOR=#9400d3>S</FONT><FONT COLOR=#910fd7>e</FONT><FONT COLOR=#8e1edb>r</FONT><FONT COLOR=#8a2ddf>v</FONT><FONT COLOR=#863ce3>e</FONT><FONT COLOR=#824be7>r</FONT><FONT COLOR=#7f5aeb> </FONT><FONT COLOR=#7b68ee>E</FONT><FONT COLOR=#7f5aeb>x</FONT><FONT COLOR=#824be7>p</FONT><FONT COLOR=#863ce3> </FONT><FONT COLOR=#8a2ddf>+</FONT><FONT COLOR=#8e1edb>7</FONT><FONT COLOR=#910fd7>5</FONT><FONT COLOR=#9400d3>%</FONT></center>"
				if("+100%")
					sexp=2
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>1</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+150%")
					sexp=2.5
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>1</FONT><FONT COLOR=#176df3>5</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+200%")
					sexp=3
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>2</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+250%")
					sexp=3.5
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>2</FONT><FONT COLOR=#176df3>5</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+300%")
					sexp=4
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>3</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+400%")
					sexp=5
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>4</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+500%")
					sexp=6
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>5</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+600%")
					sexp=7
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>6</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+700%")
					sexp=8
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>7</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+800%")
					sexp=9
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>8</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+900%")
					sexp=10
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>9</FONT><FONT COLOR=#176df3>0</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+1000%")
					sexp=11
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>1</FONT><FONT COLOR=#176df3>00</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+2000%")
					sexp=21
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>2</FONT><FONT COLOR=#176df3>00</FONT><FONT COLOR=#1b7ffa>0</FONT><FONT COLOR=#1e90ff>%</FONT></center>"
				if("+10000%")
					sexp=101
					player << "<center><FONT COLOR=#1e90ff>S</FONT><FONT COLOR=#1b7cf9>e</FONT><FONT COLOR=#1668f1>r</FONT><FONT COLOR=#1253ea>v</FONT><FONT COLOR=#0d3ee3>e</FONT><FONT COLOR=#0929dc>r</FONT><FONT COLOR=#0415d4> </FONT><FONT COLOR=#0000cd>E</FONT><FONT COLOR=#0412d3>x</FONT><FONT COLOR=#0824da>p</FONT><FONT COLOR=#0c36e0> </FONT><FONT COLOR=#1049e7>+</FONT><FONT COLOR=#135bed>1</FONT><FONT COLOR=#176df3>00</FONT><FONT COLOR=#1b7ffa>00</FONT><FONT COLOR=#1e90ff>%</FONT></center>"

		Server_Zenni()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("Increase server zenni gain to what?? (Normal Max should be +100%)","Server Zenni")in list("+0%","+25%","+50%","+75%","+100%","+150%","+200%","+250%","+300%","+400%","+500%","+600%","+700%","+800%","+900%","+1000%","Cancel"))
				if("Cancel")
					return
				if("+0%")
					szenni=1
					player << "<center><FONT COLOR=#696969>S</FONT><FONT COLOR=#696877>e</FONT><FONT COLOR=#6a6586>r</FONT><FONT COLOR=#6a6394>v</FONT><FONT COLOR=#6a61a3>e</FONT><FONT COLOR=#6a5fb1>r</FONT><FONT COLOR=#6a5cc0> </FONT><FONT COLOR=#6a5acd>Z</FONT><FONT COLOR=#6a5cc1>e</FONT><FONT COLOR=#6a5eb5>n</FONT><FONT COLOR=#6a60a8>n</FONT><FONT COLOR=#6a629c>i</FONT><FONT COLOR=#6a648f> </FONT><FONT COLOR=#6a6682>+</FONT><FONT COLOR=#696876>0</FONT><FONT COLOR=#696969>%</FONT></center>"
				if("+25%")
					szenni=1.25
					player << "<center><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#170bfa>e</FONT><FONT COLOR=#2f16f5>r</FONT><FONT COLOR=#4620ef>v</FONT><FONT COLOR=#5e2bea>e</FONT><FONT COLOR=#7536e4>r</FONT><FONT COLOR=#8c41de> </FONT><FONT COLOR=#a44bd9>Z</FONT><FONT COLOR=#ba55d3>e</FONT><FONT COLOR=#a44bd9>n</FONT><FONT COLOR=#8c41de>n</FONT><FONT COLOR=#7536e4>i</FONT><FONT COLOR=#5e2bea> </FONT><FONT COLOR=#4620ef>+</FONT><FONT COLOR=#2f16f5>2</FONT><FONT COLOR=#170bfa>5</FONT><FONT COLOR=#0000ff>%</FONT></center>"
				if("+50%")
					szenni=1.5
					player << "<center><FONT COLOR=#008000>S</FONT><FONT COLOR=#137f1c>e</FONT><FONT COLOR=#257d37>r</FONT><FONT COLOR=#387b53>v</FONT><FONT COLOR=#4a796e>e</FONT><FONT COLOR=#5d768a>r</FONT><FONT COLOR=#6f74a5> </FONT><FONT COLOR=#8272c1>Z</FONT><FONT COLOR=#9370db>e</FONT><FONT COLOR=#8272c1>n</FONT><FONT COLOR=#6f74a5>n</FONT><FONT COLOR=#5d768a>i</FONT><FONT COLOR=#4a796e> </FONT><FONT COLOR=#387b53>+</FONT><FONT COLOR=#257d37>5</FONT><FONT COLOR=#137f1c>0</FONT><FONT COLOR=#008000>%</FONT></center>"
				if("+75%")
					szenni=1.75
					player << "<center><FONT COLOR=#32cd32>S</FONT><FONT COLOR=#3db42d>e</FONT><FONT COLOR=#499b26>r</FONT><FONT COLOR=#548120>v</FONT><FONT COLOR=#5f671a>e</FONT><FONT COLOR=#6a4d13>r</FONT><FONT COLOR=#76340d> </FONT><FONT COLOR=#811a06>Z</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#811a06>n</FONT><FONT COLOR=#76340d>n</FONT><FONT COLOR=#6a4d13>i</FONT><FONT COLOR=#5f671a> </FONT><FONT COLOR=#548120>+</FONT><FONT COLOR=#499b26>7</FONT><FONT COLOR=#3db42d>5</FONT><FONT COLOR=#32cd32>%</FONT></center>"
				if("+100%")
					szenni=2
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>1</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+150%")
					szenni=2.5
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>1</FONT><FONT COLOR=#537fa0>5</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+200%")
					szenni=3
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>2</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+250%")
					szenni=3.5
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>2</FONT><FONT COLOR=#537fa0>5</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+300%")
					szenni=4
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>3</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+400%")
					szenni=5
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>4</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+500%")
					szenni=6
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>5</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+600%")
					szenni=7
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>6</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+700%")
					szenni=8
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>7</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+800%")
					szenni=9
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>8</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+900%")
					szenni=10
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>9</FONT><FONT COLOR=#537fa0>0</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
				if("+1000%")
					szenni=11
					player << "<center><FONT COLOR=#6a5acd>S</FONT><FONT COLOR=#5e6fb4>e</FONT><FONT COLOR=#50849b>r</FONT><FONT COLOR=#439881>v</FONT><FONT COLOR=#36ad67>e</FONT><FONT COLOR=#28c24d>r</FONT><FONT COLOR=#1bd734> </FONT><FONT COLOR=#0deb1a>Z</FONT><FONT COLOR=#00ff00>e</FONT><FONT COLOR=#0cee17>n</FONT><FONT COLOR=#18db2e>n</FONT><FONT COLOR=#24c945>i</FONT><FONT COLOR=#30b65c> </FONT><FONT COLOR=#3ba472>+</FONT><FONT COLOR=#479189>1</FONT><FONT COLOR=#537fa0>00</FONT><FONT COLOR=#5f6cb7>0</FONT><FONT COLOR=#6a5acd>%</FONT></center>"
/*
		DropRareShard()
			set category = "Admin"
			set name = "Drop Rare Shard"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/type=rand(1,50)
			if(prob(33))
				if(type<=10)
					var/obj/Equipment/Buff_Items/SPL_Shard/O = new
					O.loc = usr.loc
				if(type>10&&type<=20)
					var/obj/Equipment/Buff_Items/SKI_Shard/O = new
					O.loc = usr.loc
				if(type>20&&type<=30)
					var/obj/Equipment/Buff_Items/SKIDEF_Shard/O = new
					O.loc = usr.loc
				if(type>30&&type<=40)
					var/obj/Equipment/Buff_Items/SSTR_Shard/O = new
					O.loc = usr.loc
				if(type>40&&type<=50)
					var/obj/Equipment/Buff_Items/SDEF_Shard/O = new
					O.loc = usr.loc
			else
				if(prob(33))
					if(type<=10)
						var/obj/Equipment/Buff_Items/LPL_Shard/O = new
						O.loc = usr.loc
					if(type>10&&type<=20)
						var/obj/Equipment/Buff_Items/LKI_Shard/O = new
						O.loc = usr.loc
					if(type>20&&type<=30)
						var/obj/Equipment/Buff_Items/LKIDEF_Shard/O = new
						O.loc = usr.loc
					if(type>30&&type<=40)
						var/obj/Equipment/Buff_Items/LSTR_Shard/O = new
						O.loc = usr.loc
					if(type>40&&type<=50)
						var/obj/Equipment/Buff_Items/LDEF_Shard/O = new
						O.loc = usr.loc
				else
					if(type<=10)
						var/obj/Equipment/Buff_Items/MPL_Shard/O = new
						O.loc = usr.loc
					if(type>10&&type<=20)
						var/obj/Equipment/Buff_Items/MKI_Shard/O = new
						O.loc = usr.loc
					if(type>20&&type<=30)
						var/obj/Equipment/Buff_Items/MKIDEF_Shard/O = new
						O.loc = usr.loc
					if(type>30&&type<=40)
						var/obj/Equipment/Buff_Items/MSTR_Shard/O = new
						O.loc = usr.loc
					if(type>40&&type<=50)
						var/obj/Equipment/Buff_Items/MDEF_Shard/O = new
						O.loc = usr.loc

*/
		Change_Player_Warrior_Level(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			return
			var/X=input("[M]'s warrior level is currently '[M.warrior_level]', what would you like to change it too?","Edit Warrior Level") in list("Weakling","Low","Medium","High","Elite","Legend","God")
			if(X=="Weakling")
				if(M.warrior_level == "Weakling")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Low")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
				if(M.warrior_level =="Medium")
					M.power_multi -= 1
					M.ki_multi -= 1
					M.kidefense_multi -= 1
					M.strength_multi -= 1
					M.defence_multi -= 1
					M.speed_multi -= 1
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
				if(M.warrior_level =="High")
					M.power_multi -= 1.5
					M.ki_multi -= 1.5
					M.kidefense_multi -= 1.5
					M.strength_multi -= 1.5
					M.defence_multi -= 1.5
					M.speed_multi -= 1.5
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
				if(M.warrior_level =="Elite")
					M.power_multi -= 2
					M.ki_multi -= 2
					M.kidefense_multi -= 2
					M.strength_multi -= 2
					M.defence_multi -= 2
					M.speed_multi -= 2
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
				if(M.warrior_level =="Legend")
					M.power_multi -= 2.5
					M.ki_multi -= 2.5
					M.kidefense_multi -= 2.5
					M.strength_multi -= 2.5
					M.defence_multi -= 2.5
					M.speed_multi -= 2.5
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
				if(M.warrior_level =="God")
					M.power_multi -= 4.5
					M.ki_multi -= 4.5
					M.kidefense_multi -= 4.5
					M.strength_multi -= 4.5
					M.defence_multi -= 4.5
					M.speed_multi -= 4.5
					M.warrior_level = "Weakling"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Weakling"
			if(X=="Low")
				if(M.warrior_level == "Low")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 0.5
					M.ki_multi += 0.5
					M.kidefense_multi += 0.5
					M.strength_multi += 0.5
					M.defence_multi += 0.5
					M.speed_multi += 0.5
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Low"
				if(M.warrior_level =="Medium")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Low"
				if(M.warrior_level =="High")
					M.power_multi -= 1
					M.ki_multi -= 1
					M.kidefense_multi -= 1
					M.strength_multi -= 1
					M.defence_multi -= 1
					M.speed_multi -= 1
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Low"
				if(M.warrior_level =="Elite")
					M.power_multi -= 1.5
					M.ki_multi -= 1.5
					M.kidefense_multi -= 1.5
					M.strength_multi -= 1.5
					M.defence_multi -= 1.5
					M.speed_multi -= 1.5
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Low"
				if(M.warrior_level =="Legend")
					M.power_multi -= 2
					M.ki_multi -= 2
					M.kidefense_multi -= 2
					M.strength_multi -= 2
					M.defence_multi -= 2
					M.speed_multi -= 2
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Low"
				if(M.warrior_level =="God")
					M.power_multi -= 4
					M.ki_multi -= 4
					M.kidefense_multi -= 4
					M.strength_multi -= 4
					M.defence_multi -= 4
					M.speed_multi -= 4
					M.warrior_level = "Low"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
			if(X=="Medium")
				if(M.warrior_level == "Medium")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 1
					M.ki_multi += 1
					M.kidefense_multi += 1
					M.strength_multi += 1
					M.defence_multi += 1
					M.speed_multi += 1
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
				if(M.warrior_level =="Low")
					M.power_multi += 0.5
					M.ki_multi += 0.5
					M.kidefense_multi += 0.5
					M.strength_multi += 0.5
					M.defence_multi += 0.5
					M.speed_multi += 0.5
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"

				if(M.warrior_level =="High")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
				if(M.warrior_level =="Elite")
					M.power_multi -= 1
					M.ki_multi -= 1
					M.kidefense_multi -= 1
					M.strength_multi -= 1
					M.defence_multi -= 1
					M.speed_multi -= 1
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
				if(M.warrior_level =="Legend")
					M.power_multi -= 1.5
					M.ki_multi -= 1.5
					M.kidefense_multi -= 1.5
					M.strength_multi -= 1.5
					M.defence_multi -= 1.5
					M.speed_multi -= 1.5
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
				if(M.warrior_level =="God")
					M.power_multi -= 3.5
					M.ki_multi -= 3.5
					M.kidefense_multi -= 3.5
					M.strength_multi -= 3.5
					M.defence_multi -= 3.5
					M.speed_multi -= 3.5
					M.warrior_level = "Medium"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Medium"
			if(X=="High")
				if(M.warrior_level == "High")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 1.5
					M.ki_multi += 1.5
					M.kidefense_multi += 1.5
					M.strength_multi += 1.5
					M.defence_multi += 1.5
					M.speed_multi += 1.5
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
				if(M.warrior_level =="Low")
					M.power_multi += 1
					M.ki_multi += 1
					M.kidefense_multi += 1
					M.strength_multi += 1
					M.defence_multi += 1
					M.speed_multi += 1
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
				if(M.warrior_level =="Medium")
					M.power_multi += 0.5
					M.ki_multi += 0.5
					M.kidefense_multi += 0.5
					M.strength_multi += 0.5
					M.defence_multi += 0.5
					M.speed_multi += 0.5
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
				if(M.warrior_level =="Elite")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
				if(M.warrior_level =="Legend")
					M.power_multi -= 1
					M.ki_multi -= 1
					M.kidefense_multi -= 1
					M.strength_multi -= 1
					M.defence_multi -= 1
					M.speed_multi -= 1
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
				if(M.warrior_level =="God")
					M.power_multi -= 3
					M.ki_multi -= 3
					M.kidefense_multi -= 3
					M.strength_multi -= 3
					M.defence_multi -= 3
					M.speed_multi -= 3
					M.warrior_level = "High"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to High"
			if(X=="Elite")
				if(M.warrior_level == "Elite")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 2
					M.ki_multi += 2
					M.kidefense_multi += 2
					M.strength_multi += 2
					M.defence_multi += 2
					M.speed_multi += 2
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
				if(M.warrior_level =="Low")
					M.power_multi += 1.5
					M.ki_multi += 1.5
					M.kidefense_multi += 1.5
					M.strength_multi += 1.5
					M.defence_multi += 1.5
					M.speed_multi += 1.5
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
				if(M.warrior_level =="Medium")
					M.power_multi += 1
					M.ki_multi += 1
					M.kidefense_multi += 1
					M.strength_multi += 1
					M.defence_multi += 1
					M.speed_multi += 1
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
				if(M.warrior_level =="High")
					M.power_multi += 0.5
					M.ki_multi += 0.5
					M.kidefense_multi += 0.5
					M.strength_multi += 0.5
					M.defence_multi += 0.5
					M.speed_multi += 0.5
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
				if(M.warrior_level =="Legend")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
				if(M.warrior_level =="God")
					M.power_multi -= 2.5
					M.ki_multi -= 2.5
					M.kidefense_multi -= 2.5
					M.strength_multi -= 2.5
					M.defence_multi -= 2.5
					M.speed_multi -= 2.5
					M.warrior_level = "Elite"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Elite"
			if(X=="Legend")
				if(M.warrior_level == "Legend")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 2.5
					M.ki_multi += 2.5
					M.kidefense_multi += 2.5
					M.strength_multi += 2.5
					M.defence_multi += 2.5
					M.speed_multi += 2.5
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
				if(M.warrior_level =="Low")
					M.power_multi += 2
					M.ki_multi += 2
					M.kidefense_multi += 2
					M.strength_multi += 2
					M.defence_multi += 2
					M.speed_multi += 2
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
				if(M.warrior_level =="Medium")
					M.power_multi += 1.5
					M.ki_multi += 1.5
					M.kidefense_multi += 1.5
					M.strength_multi += 1.5
					M.defence_multi += 1.5
					M.speed_multi += 1.5
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
				if(M.warrior_level =="High")
					M.power_multi += 1
					M.ki_multi += 1
					M.kidefense_multi += 1
					M.strength_multi += 1
					M.defence_multi += 1
					M.speed_multi += 1
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
				if(M.warrior_level =="Elite")
					M.power_multi -= 0.5
					M.ki_multi -= 0.5
					M.kidefense_multi -= 0.5
					M.strength_multi -= 0.5
					M.defence_multi -= 0.5
					M.speed_multi -= 0.5
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
				if(M.warrior_level =="God")
					M.power_multi -= 2
					M.ki_multi -= 2
					M.kidefense_multi -= 2
					M.strength_multi -= 2
					M.defence_multi -= 2
					M.speed_multi -= 2
					M.warrior_level = "Legend"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to Legend"
			if(X=="God")
				if(M.warrior_level == "God")
					usr<<"They are currently this warrior level"
					return
				if(M.warrior_level =="Weakling")
					M.power_multi += 4.5
					M.ki_multi += 4.5
					M.kidefense_multi += 4.5
					M.strength_multi += 4.5
					M.defence_multi += 4.5
					M.speed_multi += 4.5
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"
				if(M.warrior_level =="Low")
					M.power_multi += 4
					M.ki_multi += 4
					M.kidefense_multi += 4
					M.strength_multi += 4
					M.defence_multi += 4
					M.speed_multi += 4
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"
				if(M.warrior_level =="Medium")
					M.power_multi += 3.5
					M.ki_multi += 3.5
					M.kidefense_multi += 3.5
					M.strength_multi += 3.5
					M.defence_multi += 3.5
					M.speed_multi += 3.5
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"
				if(M.warrior_level =="High")
					M.power_multi += 3
					M.ki_multi += 3
					M.kidefense_multi += 3
					M.strength_multi += 3
					M.defence_multi += 3
					M.speed_multi += 3
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"
				if(M.warrior_level =="Elite")
					M.power_multi += 2.5
					M.ki_multi += 2.5
					M.kidefense_multi += 2.5
					M.strength_multi += 2.5
					M.defence_multi += 2.5
					M.speed_multi += 2.5
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"
				if(M.warrior_level =="Legend")
					M.power_multi += 2
					M.ki_multi += 2
					M.kidefense_multi += 2
					M.strength_multi += 2
					M.defence_multi += 2
					M.speed_multi += 2
					M.warrior_level = "God"
					sleep(5)
					usr<<"You have changed [M]'s warrior level to God"

//EDIT SAVE FILE FOR AFK EDITS
		SaveFileEdit()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(src.ckey!="crimsonslayer"||src.ckey != "Narmanb")
				alert("Currently under construction guyths")
				return
			var/list/file_list = flist("Player Saves/")
			var/file_chosen=input("Which file would you like to delete??","Delete File") in file_list
			if(fexists("[file_chosen]"))
				var/savefile/editfile=new("[file_chosen]")
				var/list/editlist=new/list
				editfile>>editlist
				usr<<output("[editfile]","edit.input5")


		GMKill(mob/M in world)
			set category = "Admin"
			set name = "GM Kill"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(istype(M,/mob/NPC))
				usr<<"You can't kill NPCs"
				return
			else
				player << "<font color=red>Battle Information:</font> <font color=white>[usr] farted and killed [M]!</font>"
				if(M.race=="Android")
					M.loc=locate(211,430,6)
					M.dead=1
					M.it_lock = 0
					M.it_blocked = 0
					M.attack_lock = 0
					M.ki_lock = 0
					M.buku_lock = 0
					M.powerlevel = M.powerlevel_max
					M.ki = M.ki_max
					M.KO = 0
					M.boxing = 0
					M.rest = 0
					M.doing = 0
					M.rage = 0
					M.sight &= ~BLIND
					M.deaths+=1
					usr.kills+=1
					spawn(35)M.dead=0
				else
					M.overlays += 'Halo.dmi'
					M.dead = 1
					M.it_lock = 0
					M.it_blocked = 0
					M.loc = locate(rand(390,400),rand(245,260),7)
					M.attack_lock = 0
					M.ki_lock = 0
					M.buku_lock = 0
					M.powerlevel = M.powerlevel_max
					M.ki = M.ki_max
					M.KO = 0
					M.boxing = 0
					M.rest = 0
					M.doing = 0
					M.rage = 0
					M.sight &= ~BLIND
					M.deaths+=1
					usr.kills+=1

		Give_Prize(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What prize do you wish to give?")in list("Cancel","EXP","HBTC Time","Training Points","Wish","Z Points","Zenni"))
				if("Shard Use")
					for (var/obj/Equipment/Buff_Items/O in M.contents)
						if(O.uses <20)
							O.uses++
						else
							M<<"[O.name] is already fully charged"
					player << "<font color=green>[usr] has awarded [M] with 1 Extra Shard Use."
				if("EXP")
					var/prizexp=input("How much exp?")as num
					M.exp += prizexp
					player << "<font color=red>[usr] has awarded [M] with [prizexp] Exp."
				if("HBTC Time")
					M.hbtc_times -= 1
					player << "<font color=red>[usr] has awarded [M] with 1 HBTC Time."
				if("Shard")
					switch(input("What shard would you like to give?")in list("Small","Large","Great","Massive"))
						if("Small")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/SPL_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/SKI_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/SKIDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/SSTR_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/SDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/SEXP_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/SSTT_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/SZ_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Small Zenni Shard."
						if("Large")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/LPL_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/LKI_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/LKIDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/LSTR_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/LDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/LEXP_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/LSTT_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/LZ_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Large Zenni Shard."
						if("Great")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/GPL_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/GKI_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/GKIDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/GSTR_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/GDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/GEXP_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/GSTT_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/GZ_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Great Zenni Shard."
						if("Massive")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/MPL_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/MKI_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/MKIDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/MSTR_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/MDEF_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/MEXP_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/MSTT_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/MZ_Shard/O = new
									M.contents += O
									player << "<font color=red>[usr] has awarded [M] with a Massive Zenni Shard."
				if("Skill Points")
					var/prizesp=input("How many skill points?")as num
					M.skill_points += prizesp
					player << "<font color=blue>[usr] has awarded [M] with [prizesp] Skill Points."
				if("Training Points")
					var/prizetp=input("How many training points?")as num
					M.tp += prizetp
					player << "<font color=blue>[usr] has awarded [M] with [prizetp] Training Points."
				if("Wish")
					switch(input("What wish would you like to give?")in list("Earth","Namek","Black Star"))
						if("Earth")
							M.wishes -= 1
							player << "<font color=red>[usr] has awarded [M] with 1 Earth wish."
						if("Namek")
							M.nwishes -= 1
							player << "<font color=red>[usr] has awarded [M] with 1 Namek wish."
						if("Black Star")
							M.bwishes -= 1
							player << "<font color=red>[usr] has awarded [M] with 1 Black Star wish."
				if("Z Points")
					var/prizezp=input("How many z points?")as num
					M.zp += prizezp
					player << "<font color=cyan>[usr] has awarded [M] with [prizezp] Z Points."
				if("Zenni")
					var/prizez=input("How much zenni?")as num
					M.banked_zenni += prizez
					player << "<font color=yellow>[usr] has awarded [M] with [prizez] Zenni."

		Give_All_Prize()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What prize do you wish to give?")in list("Cancel","EXP","HBTC Time","Training Points","Wish","Shard","Z Points","Zenni"))
				if("EXP")
					var/prizexp=input("How much exp?")as num
					for(var/mob/PC/M in player)
						M.exp += prizexp
					player << "<i><font color=red>[usr] has awarded everyone with [prizexp] Exp."
				if("HBTC Time")
					for(var/mob/PC/M in player)
						M.hbtc_times -= 1
					player << "<font color=red>[usr] has awarded everyone with 1 HBTC Time."
				if("Shard Use")
					for (var/mob/PC/M in player)
						for (var/obj/Equipment/Buff_Items/O in M.contents)
							if(O.uses <20)
								O.uses++
							else
								M<<"[O.name] is already fully charged"
					player << "<font color=green>[usr] has awarded everyone with 1 Extra Shard Use."
				if("Shard")
					switch(input("What shard would you like to give?")in list("Small","Large","Great","Massive"))
						if("Small")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/SPL_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/SKI_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/SKIDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/SSTR_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/SDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										O.name="Small Defence Shard"
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/SEXP_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/SSTT_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/SZ_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Small Zenni Shard."
						if("Large")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/LPL_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/LKI_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/LKIDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/LSTR_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/LDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/LEXP_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/LSTT_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/LZ_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Large Zenni Shard."
						if("Great")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/GPL_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/GKI_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/GKIDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/GSTR_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/GDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/GEXP_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/GSTT_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/GZ_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Great Zenni Shard."
						if("Massive")
							switch(input("What shard would you like to give?")in list("Powerlevel","Ki","Ki Defense","Strength","Defense","Exp","Stat","Zenni"))
								if("Powerlevel")
									var/obj/Equipment/Buff_Items/MPL_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Powerlevel Shard."
								if("Ki")
									var/obj/Equipment/Buff_Items/MKI_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Ki Shard."
								if("Ki Defense")
									var/obj/Equipment/Buff_Items/MKIDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Ki Defense Shard."
								if("Strength")
									var/obj/Equipment/Buff_Items/MSTR_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Strength Shard."
								if("Defense")
									var/obj/Equipment/Buff_Items/MDEF_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Defense Shard."
								if("Exp")
									var/obj/Equipment/Buff_Items/MEXP_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Exp Shard."
								if("Stat")
									var/obj/Equipment/Buff_Items/MSTT_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Stat Shard."
								if("Zenni")
									var/obj/Equipment/Buff_Items/MZ_Shard/O = new
									for(var/mob/PC/M in player)
										M.contents += O
										M.CheckInventory()
									player << "<font color=red>[usr] has awarded everyone with a Massive Zenni Shard."
				if("Skill Points")
					var/prizesp=input("How many skill points?")as num
					for(var/mob/PC/M in player)
						M.skill_points += prizesp
					player << "<i><font color=red>[usr] has awarded everyone with [prizesp] Skill Points."
				if("Training Points")
					var/prizetp=input("How many training points?")as num
					for(var/mob/PC/M in player)
						M.tp += prizetp
					player << "<i><font color=blue>[usr] has awarded everyone with [prizetp] Training Points."
				if("Wish")
					switch(input("What wish would you like to give?")in list("Earth","Namek","Black Star"))
						if("Earth")
							for(var/mob/PC/M in player)
								M.wishes -= 1
							player << "<font color=red>[usr] has awarded everyone with 1 Earth wish."
						if("Namek")
							for(var/mob/PC/M in player)
								M.nwishes -= 1
							player << "<font color=red>[usr] has awarded everyone with 1 Namek wish."
						if("Black Star")
							for(var/mob/PC/M in player)
								M.bwishes -= 1
							player << "<font color=red>[usr] has awarded everyone with 1 Black Star wish."
				if("Z Points")
					var/prizezp=input("How many z points?")as num
					for(var/mob/PC/M in player)
						M.zp += prizezp
					player << "<i><font color=cyan>[usr] has awarded everyone with [prizezp] Z Points."
				if("Zenni")
					var/prizez=input("How much zenni?")as num
					for(var/mob/PC/M in player)
						M.banked_zenni += prizez
					player << "<i><font color=yellow>[usr] has awarded everyone with [prizez] Zenni."

		Level_Player(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/amount=input("How many levels?")as num
			while(amount>0)
				M.exp = M.tnl
				M.Level_Up()
				amount -= 1
				sleep(1)
		Toggle_Techs()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Turn Techniques On or Off","Toggle Techniques","On","Off"))
				if("On")
					techs_on=1
					player<<"[src] has turned Techniques on"
				if("Off")
					techs_on=0
					player<<"[src] has turned of Techniques"

		Demote_Manually()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/L
			if(usr.ckey=="crimsonslayer"||usr.ckey=="HammertheKage"||usr.ckey=="cazdogga"||usr.ckey=="hammerboy"||usr.ckey == "Narmanb")
				L= input("Demote a which level GM")in list("Trial","Low","Medium","High","Master","Staff","Owner","Cancel")
			else
				L= input("Demote a which level GM")in list("Trial","Low","Medium","High","Cancel")
			switch(L)
				if("Cancel")
					return
				if("Trial")
					var/M = input("Demote who?(Trial)")as null|anything in TrialEnf
					switch(alert("Demote [M]?(Trial)","","Yes","No"))
						if("Yes")
							TrialEnf.Remove(M)
						else
							return
				if("Low")
					var/M = input("Demote who?(Low)")as null|anything in LowEnf
					switch(alert("Demote [M]?(Low)","","Yes","No"))
						if("Yes")
							LowEnf.Remove(M)
						else
							return
				if("Medium")
					var/M = input("Demote who?(Medium)")as null|anything in MediumEnf
					switch(alert("Demote [M]?Medium)","","Yes","No"))
						if("Yes")
							MediumEnf.Remove(M)
						else
							return
				if("High")
					var/M = input("Demote who?(High)")as null|anything in HighEnf
					switch(alert("Demote [M]?(High)","","Yes","No"))
						if("Yes")
							HighEnf.Remove(M)
						else
							return
				if("Master")
					var/M = input("Demote who?(Master)")as null|anything in MasterEnf
					switch(alert("Demote [M]?(Master)","","Yes","No"))
						if("Yes")
							MasterEnf.Remove(M)
						else
							return
				if("Staff")
					var/M = input("Demote who?(Staff)")as null|anything in StaffEnf
					switch(alert("Demote [M]?(Staff)","","Yes","No"))
						if("Yes")
							StaffEnf.Remove(M)
						else
							return
				if("Owner")
					var/M = input("Demote who?(Owner)")as null|anything in OwnerEnf
					switch(alert("Demote [M]?(Owner)","","Yes","No"))
						if("Yes")
							OwnerEnf.Remove(M)
						else
							return

		Promote_Admin(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLock==1)
				usr<<"<font color=red>[M]'s Powers Are Locked!"
				return
			if(M.GMLevel>=src.GMLevel)
				usr<<"<font color=red>You can't promote people with higher or equal level as you."
				return
			switch(alert("Are you sure you want to Promote [M]?","Promote [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/GLevel=input("What level of admin do you want to give [M]?")as num
			var/GRank
			if(src.key=="Crimson Slayer"||src.key=="Hammerboy"||src.key == "Narmanb")
				if(GLevel<=0||GLevel>7)
					usr<<alert("Enter a valid number between 1 and 7!")
					return
			else
				if(GLevel<=0||GLevel>5)
					usr<<alert("Enter a valid number between 1 and 5!")
					return
			switch(GLevel)
				if(1) GRank="Trial Enforcer"
				if(2) GRank="Low Enforcer"
				if(3) GRank="Med Enforcer"
				if(4) GRank="High Admin"
				if(5) GRank="Master Admin"
				if(6) GRank="Staff Member"
				if(7) GRank="Game Owner"
			switch(alert({"Is This Correct?
Target: [M] ([M.key])
Selected Rank: [GLevel], [GRank]"},"Promoting Admin","Yes","No"))
				if("Yes")
					goto Next
				if("No")
					return
			Next
			if(GLevel<=M.GMLevel)
				usr<<"They are already above or equal to that rank."
				return
			AdminMessage("[usr] ([usr.key]) has made [M] ([M.key]) a [GRank]([GLevel]). [M] old level: [M.GMLevel]")
			M.RemoveGM()
			sleep(1)
			switch(GLevel)
				if(1)
					TrialEnf.Add(M.ckey)
				if(2)
					LowEnf.Add(M.ckey)
				if(3)
					MediumEnf.Add(M.ckey)
				if(4)
					HighEnf.Add(M.ckey)
				if(5)
					MasterEnf.Add(M.ckey)
				if(6)
					StaffEnf.Add(M.ckey)
				if(7)
					OwnerEnf.Add(M.ckey)
			M.GMLevel = GLevel
			spawn(1)M.AdminLoad()
			spawn(5)BanSave()
			spawn(8)M.client.SaveChar()
			sleep(10)
			alert(M,"[usr] has given you GM powers. Level: [GLevel] Rank: [GRank]")
			return



		Demote_Admin(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(M.GMLevel==0)
				usr<<"<font color=red>[M] has no admin powers."
				return
			if(M.GMLevel>=src.GMLevel)
				if(usr.key!="Crimson Slayer"||usr.key!="Hammerboy"||usr.key!="Cazdogga"||usr.key!="HammertheKage"||usr.key != "Narmanb")
					usr<<"<font color=red>You can't demote people with higher or equal level as you."
					return
			switch(alert("Are you sure you want to Demote [M]?","Demote [M]","Yes","No"))
				if("Yes")
					goto Yes
				if("No")
					return
			return
			Yes
			var/GLevel=input("What level of admin do you want to demote [M] to?")as num
			var/GRank
			if(usr.key=="Crimson Slayer"||usr.key=="Hammerboy"||usr.key=="Cazdogga"||usr.key == "Narmanb")
				if(GLevel<=-1||GLevel>7)
					usr<<alert("Enter a valid number between 0 and 6!")
					goto Yes
			else
				if(GLevel<=-1||GLevel>4)
					usr<<alert("Enter a valid number between 0 and 4!")
					goto Yes
			switch(GLevel)
				if(0) GRank="Player"
				if(1) GRank="Trial Enforcer"
				if(2) GRank="Low Enforcer"
				if(3) GRank="Med Enforcer"
				if(4) GRank="High Admin"
				if(5) GRank="Master Admin"
				if(6) GRank="Co Owner"
			switch(alert({"Is This Correct?
Target: [M] ([M.key])
Selected Rank: [GLevel], [GRank]"},"Demoting Admin","Yes","No"))
				if("Yes")
					goto Next
				if("No")
					return
			Next
			if(M.key=="Crimson Slayer"||M.key=="Cazdogga"||M.ckey=="hammerboy"||M.key == "Narmanb")
				alert("You can't demote the Boss")
				AdminMessage("[usr] ([usr.key]) Tried to demote [M] ([M.key]), best let them know xD")
				return
			if(GLevel>=M.GMLevel)
				usr<<"They are already below or equal to that rank."
				return
			AdminMessage("[usr] ([usr.key]) has demoted [M] ([M.key]) to [GRank]([GLevel]). [M] old level: [M.GMLevel]")
			M.RemoveGM()
			sleep(1)
			switch(GLevel)
				if(1)
					TrialEnf.Add(M.ckey)
				if(2)
					LowEnf.Add(M.ckey)
				if(3)
					MediumEnf.Add(M.ckey)
				if(4)
					HighEnf.Add(M.ckey)
				if(5)
					MasterEnf.Add(M.ckey)
				if(6)
					StaffEnf.Add(M.ckey)
			M.GMLevel = GLevel
			spawn(1)M.AdminLoad()
			spawn(5)BanSave()
			spawn(8)M.client.SaveChar()

		Give_Budokai_Master()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(input("What do you want to do?")in list("Give Budokai Master","Remove Budokai Master","Cancel"))
				if("Cancel")
					return
				if("Give Budokai Master")
					var/list/L=new/list()
					for(var/mob/PC/M in player)
						L.Add(M)
					L.Add("Cancel")
					var/mob/B=input("Give who Budokai Master?")in L
					if(B=="Cancel")
						return
					switch(alert("Give [B] Budokai Master?","","Yes","No"))
						if("Yes")
							BudoMaster.Add(B.ckey)
							for(var/vx in typesof(/mob/TourneyMaster/verb))
								B.verbs+=vx
							AdminMessage("[usr] Gave [B] Budokai Master.")
							spawn(5)BanSave()
						else
							return
				if("Remove Budokai Master")
					var/B=input("Remove who's Budokai Master?")in BudoMaster
					switch(alert("Remove [B]'s Budokai Master?","","Yes","No"))
						if("Yes")
							for(var/mob/PC/M in player)
								if(M.ckey==B)
									for(var/vx in typesof(/mob/TourneyMaster/verb))
										M.verbs-=vx
							BudoMaster.Remove(B)
							AdminMessage("[usr] removed [B] Budokai Master.")
							spawn(5)BanSave()
						else
							return

		Give_Player_Eq_to_Inventory(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/CanMake[]
			var/CCX
			CanMake+=typesof(/obj/Equipment)
			CanMake+="Cancel"
			sleep(2)
			CanMake.Remove(/obj/Equipment/Head)
			CanMake.Remove(/obj/Equipment/Consumable)
			CanMake.Remove(/obj/Equipment/Guild_Item)
			CanMake.Remove(/obj/Equipment/Guild_Item/icon)
			CanMake.Remove(/obj/Equipment/Guild_Item2)
			CanMake.Remove(/obj/Equipment/Guild_Item2/icon)
			CanMake.Remove(/obj/Equipment/Buff_Items)
			CanMake.Remove(/obj/Equipment/Underclothes)
			CanMake.Remove(/obj/Equipment/Ankle)
			CanMake.Remove(/obj/Equipment/Arm)
			CanMake.Remove(/obj/Equipment/Wrist)
			CanMake.Remove(/obj/Equipment/Belts)
			CanMake.Remove(/obj/Equipment/Chest)
			CanMake.Remove(/obj/Equipment)
			CanMake.Remove(/obj/Equipment/Armor)
			CanMake.Remove(/obj/Equipment/Armor/Armor1)
			CanMake.Remove(/obj/Equipment/Armor/Armor2)
			CanMake.Remove(/obj/Equipment/Clothes)
			CanMake.Remove(/obj/Equipment/Gloves)
			CanMake.Remove(/obj/Equipment/Cape)
			CanMake.Remove(/obj/Equipment/Gi)
			CanMake.Remove(/obj/Equipment/Leg)
			CanMake.Remove(/obj/Equipment/Turben)
			CanMake.Remove(/obj/Equipment/Cloak)
			var/NOBJ=input("Create what object?")in CanMake
			if(NOBJ=="Cancel") return
			CCX=NOBJ
			M:contents += new CCX()
			M.CheckInventory()
			usr<<alert("You have placed [NOBJ] in [M]'s inventory")
			return
		Create()
			set category="Admin"
			var/CCX
			var/CanMake[]
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/Type1=input("Select Creation Type")in list("Object","Turf","Mob","Cancel")
			if(Type1=="Object") goto Object
			if(Type1=="Turf")goto Turf
			if(Type1=="Mob")goto Mobile
			return
			Object
			CanMake+=typesof(/obj)
			CanMake+="Cancel"
			var/NOBJ=input("Create what object?")in CanMake
			if(NOBJ=="Cancel") return
			CCX=NOBJ
			new CCX(locate(x,y-1,z))
			return
			Turf
			CanMake+=typesof(/turf)
			CanMake+="Cancel"
			var/NTRF=input("Create what turf?")in CanMake
			if(NTRF=="Cancel") return
			CCX=NTRF
			new CCX(locate(x,y-1,z))
			return
			Mobile
			CanMake+=typesof(/mob/NPC)
			CanMake+=typesof(/mob/Monster)
			CanMake+=typesof(/mob/Saga)
			CanMake+="Cancel"
			var/NMOB=input("Create what Mob?")in CanMake
			if(NMOB=="Cancel") return
			CCX=NMOB
			new CCX(locate(x,y-1,z))
			return

		Rebuild_Player(mob/PC/M in player)
			set category="Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Please note that this verb edits ALL the stats neccecary to rebuild a player, leaving a field empty will leave that stat as it is (IF you type 0 then that stat will be set to 0","REBUILD ALERT!!!","Continue","Cancel"))
				if("Cancel")
					return
				else
					var/rLevel=input("What do you want to set [M]'s Level to?? (Note blank leaves their Level as is)","[M]'s Level Edit") as num
					var/rPowerlevel=input("What do you want to set [M]'s Powerlevel to?? (Note blank leaves their Powerlevel as is)","[M]'s Powerlevel Edit") as num
					var/rKi=input("What do you want to set [M]'s Ki to?? (Note blank leaves their Ki as is)","[M]'s Ki Edit") as num
					var/rKiDefence=input("What do you want to set [M]'s KiDefence to?? (Note blank leaves their KiDefence as is)","[M]'s KiDefence Edit") as num
					var/rStrength=input("What do you want to set [M]'s Strength to?? (Note blank leaves their Strength as is)","[M]'s Strength Edit") as num
					var/rDefence=input("What do you want to set [M]'s Defence to?? (Note blank leaves their Defence as is)","[M]'s Defence Edit") as num
					var/rSpeed=input("What do you want to set [M]'s Speed to?? (Note choose from 1-8 for their steps per second)","[M]'s Speed Edit") as num
					var/rTPC=input("What do you want to set [M]'s TPC to?? (Note blank leaves their TPC as is)","[M]'s TPC Edit") as num
					var/rZPC=input("What do you want to set [M]'s ZPC to?? (Note blank leaves their ZPC as is)","[M]'s ZPC Edit") as num
					var/rTP=input("What do you want to set [M]'s TP to?? (Note blank leaves their TP as is)","[M]'s TP Edit") as num
					var/rZP=input("What do you want to set [M]'s ZP to?? (Note blank leaves their ZP as is)","[M]'s ZP Edit") as num
					var/rSkill=input("What do you want to set [M]'s Inv/Trans skill to?? (Note blank leaves their Inv/Trans skill as is)","[M]'s Inv/Trans skill Edit") as num
					var/rTspeed=input("What do you want to set [M]'s Inv/Trans speed to?? (Note IF YOU WANT 3 SECONDS PUT 30 HERE. 42 would be 4.2 seconds etc","[M]'s Inv/Trans speed Edit") as num
					var/rMelee=input("What do you want to set [M]'s Melee to?? (Note blank leaves their Melee as is)","[M]'s Melee Edit") as num
					var/rBlock=input("What do you want to set [M]'s Block to?? (Note blank leaves their Block as is)","[M]'s Block Edit") as num
					var/rDodge=input("What do you want to set [M]'s Dodge to?? (Note blank leaves their Dodge as is)","[M]'s Dodge Edit") as num
					var/rCounter=input("What do you want to set [M]'s Counter to?? (Note blank leaves their Counter as is)","[M]'s Counter Edit") as num
					var/rCritical=input("What do you want to set [M]'s Critical to?? (Note blank leaves their Critical as is)","[M]'s Critical Edit") as num
					var/rDurability=input("What do you want to set [M]'s Durability to?? (Note blank leaves their Durability as is)","[M]'s Durability Edit") as num
					var/rKicontrol=input("What do you want to set [M]'s Kicontrol to?? (Note blank leaves their Kicontrol as is)","[M]'s Kicontrol Edit") as num
					var/rKicast=input("What do you want to set [M]'s Kicast to?? (Note blank leaves their Kicast as is)","[M]'s Kicast Edit") as num
					var/rKipower=input("What do you want to set [M]'s Kipower to?? (Note blank leaves their Kipower as is)","[M]'s Kipower Edit") as num
					var/rKiuse=input("What do you want to set [M]'s Kiuse to?? (Note blank leaves their Kiuse as is)","[M]'s Kiuse Edit") as num
					var/rKiresist=input("What do you want to set [M]'s Kiresist to?? (Note blank leaves their Kiresist as is)","[M]'s Kiresist Edit") as num
					var/rDeflect=input("What do you want to set [M]'s Deflect to?? (Note blank leaves their Deflect as is)","[M]'s Deflect Edit") as num
					var/rKills=input("What do you want to set [M]'s Kills to?? (Note blank leaves their Kills as is)","[M]'s Kills Edit") as num
					var/rPks=input("What do you want to set [M]'s Pks to?? (Note blank leaves their Pks as is)","[M]'s Pks Edit") as num
					var/rZenni=input("What do you want to set [M]'s Zenni to?? (Note blank leaves their Zenni as is)","[M]'s Zenni Edit") as num
					var/rWishes=input("What do you want to set [M]'s Wishes to?? (Note setting this to 7 means that [M] has used all of their wishes)","[M]'s Wishes Edit") as num
					var/rNWishes=input("What do you want to set [M]'s NWishes to?? (Note setting this to 3 means that [M] has used all of their Namek Wishes)","[M]'s NWishes Edit") as num
					var/rBWishes=input("What do you want to set [M]'s BWishes to?? (Note setting this to 1 means that [M] has used their BSDB Wish)","[M]'s BWishes Edit") as num
					var/rPowerlevelB=input("What do you want to set [M]'s PowerlevelBonus to?? (Note blank leaves their Powerlevel Bonus as is)","[M]'s PowerlevelBonus Edit") as num
					var/rkiBonus=input("What do you want to set [M]'s kiBonus to?? (Note blank leaves their kiBonus as is)","[M]'s ki Bonus Edit") as num
					var/rkiDefenceBonus=input("What do you want to set [M]'s kiDefenceBonus to?? (Note blank leaves their ki Defence Bonus as is)","[M]'s kiDefenceBonus Edit") as num
					var/rStrengthBonus=input("What do you want to set [M]'s StrengthBonus to?? (Note blank leaves their Strength Bonus as is)","[M]'s StrengthBonus Edit") as num
					var/rDefenceBonus=input("What do you want to set [M]'s DefenceBonus to?? (Note blank leaves their Defence Bonus as is)","[M]'s DefenceBonus Edit") as num
					var/rExpBonus=input("What do you want to set [M]'s ExpBonus to?? (Note 1 is 100%, 2 is 200% and so on!!!)","[M]'s ExpBonus Edit") as num
					if(rLevel==""||rLevel==null)
						M.level=M.level
					else
						M.level = rLevel
					if(rPowerlevel==""||rPowerlevel==null)
						M.powerlevel_max=M.powerlevel_max
					else
						M.powerlevel_max = rPowerlevel
					if(rKi==""||rKi==null)
						M.ki_max=M.ki_max
					else
						M.ki_max = rKi
					if(rKiDefence==""||rKiDefence==null)
						M.kidefense_max=M.kidefense_max
					else
						M.kidefense_max = rKiDefence
					if(rStrength==""||rStrength==null)
						M.strength_max=M.strength_max
					else
						M.strength_max = rStrength
					if(rDefence==""||rDefence==null)
						M.defence_max=M.defence_max
					else
						M.defence_max = rDefence
					if(rSpeed==""||rSpeed==null)
						M.speed_max=M.speed_max
					else
						if(rSpeed==1)
							M.speed_max=2500000
							M.speed=2500000
						if(rSpeed==2)
							M.speed_max=25000000
							M.speed=25000000
						if(rSpeed==3)
							M.speed_max=250000000
							M.speed=25000000
						if(rSpeed==4)
							M.speed_max=2500000000
							M.speed=250000000
						if(rSpeed==5)
							M.speed_max=25000000000
							M.speed=25000000000
						if(rSpeed==6)
							M.speed_max=250000000000
							M.speed=250000000000
						if(rSpeed==7)
							M.speed_max=2500000000000
							M.speed=2500000000000
						if(rSpeed==8)
							M.speed_max=25000000000000
							M.speed=25000000000000
					if(rTPC==""||rTPC==null)
						M.tpc=M.tpc
					else
						M.tpc = rTPC
					if(rZPC==""||rZPC==null)
						M.zpc=M.zpc
					else
						M.zpc = rZPC
					if(rTP==""||rTP==null)
						M.tp=M.tp
					else
						M.tp = rTP
					if(rZP==""||rZP==null)
						M.zp=M.zp
					else
						M.zp = rZP
					if(M.race == "Android" || M.race == "Dragon" || M.race == "Konat"|| M.race == "Feline"|| M.race == "Bio Android"|| M.race == "Demon"&&M.gene=="Sinister"|| M.race == "Human"&&M.gene=="Majin Incarnate"|| M.race == "Namekian"||M.race == "Majin"||M.race == "Tuffle")
						if(rSkill==""||rSkill==null)
							M.invertlvl=M.invertlvl
						else
							M.invertlvl = rSkill
						if(rTspeed==""||rTspeed==null)
							M.invertdelay=M.invertdelay
						else
							M.invertdelay = rTspeed
					else
						if(rSkill==""||rSkill==null)
							M.trans_lvl=M.trans_lvl
						else
							M.trans_lvl= rSkill
						if(rTspeed==""||rTspeed==null)
							M.trans_spd=M.trans_spd
						else
							M.trans_spd= rTspeed
					if(rMelee==""||rMelee==null)
						M.melee_max=M.melee_max
					else
						M.melee_max = rMelee
					if(rBlock==""||rBlock==null)
						M.block_max=M.block_max
					else
						M.block_max = rBlock
					if(rDodge==""||rDodge==null)
						M.dodge_max=M.dodge_max
					else
						M.dodge_max = rDodge
					if(rCounter==""||rCounter==null)
						M.counter_max=M.counter_max
					else
						M.counter_max = rCounter
					if(rCritical==""||rCritical==null)
						M.critical_max=M.critical_max
					else
						M.critical_max = rCritical
					if(rDurability==""||rDurability==null)
						M.durability_max=M.durability_max
					else
						M.durability_max = rDurability
					if(rKicontrol==""||rKicontrol==null)
						M.ki_control_max=M.ki_control_max
					else
						M.ki_control_max = rKicontrol
					if(rKicast==""||rKicast==null)
						M.ki_cast_max=M.ki_cast_max
					else
						M.ki_cast_max = rKicast
					if(rKipower==""||rKipower==null)
						M.ki_power_max=M.ki_power_max
					else
						M.ki_power_max = rKipower
					if(rKiuse==""||rKiuse==null)
						M.ki_use_max=M.ki_use_max
					else
						M.ki_use_max = rKiuse
					if(rKiresist==""||rKiresist==null)
						M.ki_res_max=M.ki_res_max
					else
						M.ki_res_max = rKiresist
					if(rDeflect==""||rDeflect==null)
						M.reflect_max=M.reflect_max
					else
						M.reflect_max = rDeflect
					if(rKills==""||rKills==null)
						M.kills=M.kills
					else
						M.kills = rKills
					if(rPks==""||rPks==null)
						M.pks=M.pks
					else
						M.pks = rPks
					if(rZenni==""||rZenni==null)
						M.zenni=M.zenni
					else
						M.zenni = rZenni
					if(rWishes==""||rWishes==null)
						M.wishes=M.wishes
					else
						M.wishes = rWishes
					if(rNWishes==""||rNWishes==null)
						M.nwishes=M.nwishes
					else
						M.nwishes = rNWishes
					if(rBWishes==""||rBWishes==null)
						M.bwishes=M.bwishes
					else
						M.bwishes = rBWishes
					if(rPowerlevelB==""||rPowerlevelB==null)
						M.powerlevel_bonus=M.powerlevel_bonus
					else
						M.powerlevel_bonus = rPowerlevelB
					if(rkiBonus==""||rkiBonus==null)
						M.ki_bonus=M.ki_bonus
					else
						M.ki_bonus = rkiBonus
					if(rkiDefenceBonus==""||rkiDefenceBonus==null)
						M.kidefense_bonus=M.kidefense_bonus
					else
						M.kidefense_bonus = rkiDefenceBonus
					if(rStrengthBonus==""||rStrengthBonus==null)
						M.strength_bonus=M.strength_bonus
					else
						M.strength_bonus = rStrengthBonus
					if(rDefenceBonus==""||rDefenceBonus==null)
						M.defence_bonus=M.defence_bonus
					else
						M.defence_bonus = rDefenceBonus
					if(rExpBonus==""||rExpBonus==null)
						M.expb=M.expb
					else
						M.expb = rExpBonus
					M<<"You have had your stats changed by [src], please self train for a level then revert/invert for all stats to apply"
					src<<"You have edited [M]'s stats to the following:"
					src<<"[M]'s level is [M.level]"
					src<<"[M]'s powerlevel_max is [M.powerlevel_max]"
					src<<"[M]'s ki_max is [M.ki_max]"
					src<<"[M]'s kidefense_max is [M.kidefense_max]"
					src<<"[M]'s strength_max is [M.strength_max]"
					src<<"[M]'s defence_max is [M.defence_max]"
					src<<"[M]'s speed_max is [rSpeed]"
					src<<"[M]'s tpc is [M.tpc]"
					src<<"[M]'s zpc is [M.zpc]"
					src<<"[M]'s tp is [M.tp]"
					src<<"[M]'s zp is [M.zp]"
					src<<"[M]'s invertlvl is [M.invertlvl]"
					src<<"[M]'s invertdelay is [M.invertdelay]"
					src<<"[M]'s melee_max is [M.melee_max]"
					src<<"[M]'s block_max is [M.block_max]"
					src<<"[M]'s dodge_max is [M.dodge_max]"
					src<<"[M]'s counter_max is [M.counter_max]"
					src<<"[M]'s critical_max is [M.critical_max]"
					src<<"[M]'s durability_max is [M.durability_max]"
					src<<"[M]'s ki_control_max is [M.ki_control_max]"
					src<<"[M]'s ki_cast_max is [M.ki_cast_max]"
					src<<"[M]'s ki_power_max is [M.ki_power_max]"
					src<<"[M]'s ki_use_max is [M.ki_use_max]"
					src<<"[M]'s ki_res_max is [M.ki_res_max]"
					src<<"[M]'s reflect_max is [M.reflect_max]"
					src<<"[M]'s kills is [M.kills]"
					src<<"[M]'s pks is [M.pks]"
					src<<"[M] has used [M.wishes] earth wishes"
					src<<"[M] has used [M.nwishes] namek wishes"
					src<<"[M] has used [M.bwishes] BSDB wishes"
					src<<"[M]'s powerlevel_bonus is [M.powerlevel_bonus]"
					src<<"[M]'s ki_bonus is [M.ki_bonus]"
					src<<"[M]'s kidefense_bonus is [M.kidefense_bonus]"
					src<<"[M]'s strength_bonus is [M.strength_bonus]"
					src<<"[M]'s defence_bonus is [M.defence_bonus]"
					src<<"[M]'s exp bonus is [M.expb*100]"
//crim latest edit version 2.23
		Global_Var_Editor()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/globallist=new/list()
			globallist=global.vars
			alert("[globallist]")
			var/number1 = input("Change which global var","Global List") in list(globallist)
			alert("[number1]")
			var/changetext= input("Change global var","",number1)
			globallist=changetext
			/*for(var/x in global.vars)
				globallist.Add(x)
			var/b4
			b4=input("Enter new text:","Text",\
			[variable]) as text*/

/*		Shard_Verbs()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Unlock Shard Verbs?","","Lock","Unlock","Cancel"))
				if("Cancel")
					return
				if("Lock")
					switch(alert("Lock Shard Verbs?","","Lock","Cancel"))
						if("Cancel")
							return
						if("Lock")
							shardverbs = 0
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=red>[usr] has locked all shard verbs.</font></b>"

				if("Unlock")
					switch(input("Which stage to unlock?","Unlock Shards")in list("Small","Large","Great","Massive","Cancel"))
						if("Cancel")
							return
						if("Small")
							shardverbs = 1
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=green>[usr] has unlocked Level 1 shard verbs.</font></b>"
						if("Large")
							shardverbs = 2
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=yellow>[usr] has unlocked Level 2 shard verbs.</font></b>"
						if("Great")
							shardverbs = 3


							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=blue>[usr] has unlocked Level 3 shard verbs.</font></b>"
						if("Massive")
							shardverbs = 4
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=red>[usr] has unlocked Level 4 shard verbs.</font></b>"
*/
//testhere
		Manual_GM_Verbs(mob/PC/M in player)
			set category = "Admin"
			set name = "Manually Assign GM Verbs"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/manualgm=input("Please choose the verb to manually assign to [M]","Manually Assign GM Verbs") in list("Server Kill Bonus","Server EXP","Server Zenni","World Reboot","Ban","Un Ban","Change Icon","Ban Manually","Multi Key","Revive World","World Repop","Rename","Relearn Skills","Change Title","World Save","Change Inventory","Movement Lock","Restore All Stamina","Dragonball Management","Edit","Give Techs","Give Prize","Give All Prize","Delete","Delete Player Save","Get Player Save","World Shutdown","Hearall","Make Icon","Cancel")
			if(manualgm=="World Reboot")
				M.verbs += new/mob/System/Admin/Verbs/LowGM/verb/WorldReboot()
				M.GMVerbs+="World Reboot"
			if(manualgm=="Server Kill Bonus")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Kill_Bonus()
				M.GMVerbs+="Server Kill Bonus"


			if(manualgm=="Ban")
				M.verbs += new/mob/System/Admin/Verbs/LowGM/verb/Ban()
				M.GMVerbs+="Ban"
			if(manualgm=="Un Ban")
				M.verbs += new/mob/System/Admin/Verbs/LowGM/verb/UnBan()
				M.GMVerbs+="Un Ban"
			if(manualgm=="Change Icon")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Change_Icon()
				M.GMVerbs+="Change Icon"
			if(manualgm=="Ban Manually")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Ban_Manually()
				M.GMVerbs+="Ban Manually"
			if(manualgm=="Multi Key")
				M.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Multi_Key()
				M.GMVerbs+="Multi Key"
			if(manualgm=="Revive World")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Revive_World()
				M.GMVerbs+="Revive World"
			if(manualgm=="World Repop")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/World_Repop()
				M.GMVerbs+="World Repop"
			if(manualgm=="Rename")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Rename()
				M.GMVerbs+="Rename"
			if(manualgm=="Relearn Skills")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Relearn_Skills()
				M.GMVerbs+="Relearn Skills"
			if(manualgm=="Change Title")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Change_Title()
				M.GMVerbs+="Change Title"
			if(manualgm=="World Save")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/World_Save()
				M.GMVerbs+="World Save"
			if(manualgm=="Change Inventory")
				M.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Change_Inventory()
				M.GMVerbs+="Change Inventory"
			if(manualgm=="Movement Lock")
				M.verbs += new/mob/System/Admin/Verbs/HighGM/verb/Movement_Lock()
				M.GMVerbs+="Movement Lock"
			if(manualgm=="Restore All Stamina")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Restore_All_Stamina()
				M.GMVerbs+="Restore All Stamina"
			if(manualgm=="Horde")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Start_Horde()
				M.GMVerbs+="Horde"
			if(manualgm=="Dragonball Management")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Dragonball_Manage()
				M.GMVerbs+="Dragonball Management"
			if(manualgm=="Edit")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Edit()
				M.GMVerbs+="Edit"
			if(manualgm=="Give Techs")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_Techs()
				M.GMVerbs+="Give Techs"
			if(manualgm=="Server EXP")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Exp()
				M.GMVerbs+="Server EXP"
			if(manualgm=="Server Zenni")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Server_Zenni()
				M.GMVerbs+="Server Zenni"
			if(manualgm=="Change Warrior level")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Change_Player_Warrior_Level()
				M.GMVerbs+="Change Warrior Level"
			if(manualgm=="Give Prize")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_Prize()
				M.GMVerbs+="Give Prize"
			if(manualgm=="Give All Prize")
				M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/Give_All_Prize()
				M.GMVerbs+="Give All Prize"
	//		if(manualgm=="Rare Shard")
	//			M.verbs += new/mob/System/Admin/Verbs/StaffGM/verb/DropRareShard()
	//			M.GMVerbs+="Rare Shard"
	//		if(manualgm=="Random Shard")
	//			M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/DropRandomShard()
	//			M.GMVerbs+="Random Shard"
			if(manualgm=="Delete")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Delete()
				M.GMVerbs+="Delete"
			if(manualgm=="Delete Player Save")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Delete_Player_Save()
				M.GMVerbs+="Delete Player Save"
			if(manualgm=="Get Player Save")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/Get_Player_Save()
				M.GMVerbs+="Get Player Save"
			if(manualgm=="World Shutdown")
				M.verbs += new/mob/System/Admin/Verbs/MasterGM/verb/World_ShutDown()
				M.GMVerbs+="World Shutdown"
			if(manualgm=="Hearall")
				M.verbs += new/mob/System/Admin/Verbs/OwnerGM/verb/Hearall()
				M.GMVerbs+="Hearall"
			if(manualgm=="Make Icon")
				M.verbs += new/mob/System/Admin/Verbs/MedGM/verb/Make_Icon()
				M.GMVerbs+="Make Icon"

			if(manualgm=="Cancel")
				return

		Manual_Remove_GM_Verbs(mob/PC/M in player)
			set category = "Admin"
			set name = "Manually Remove GM Verbs"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			var/manualgm=input("Please choose the verb to manually assign to [M]","Manually Assign GM Verbs") in list("[M.GMVerbs]")
			if(manualgm=="World Reboot")
				M.verbs -= new/mob/System/Admin/Verbs/LowGM/verb/WorldReboot()
				M.GMVerbs-="World Reboot"
			if(manualgm=="Ban")
				M.verbs -= new/mob/System/Admin/Verbs/LowGM/verb/Ban()
				M.GMVerbs-="Ban"
			if(manualgm=="Un Ban")
				M.verbs -= new/mob/System/Admin/Verbs/LowGM/verb/UnBan()
				M.GMVerbs-="Un Ban"
			if(manualgm=="Change Icon")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Change_Icon()
				M.GMVerbs-="Change Icon"
			if(manualgm=="Ban Manually")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Ban_Manually()
				M.GMVerbs-="Ban Manually"
			if(manualgm=="Multi Key")
				M.verbs -= new/mob/System/Admin/Verbs/HighGM/verb/Multi_Key()
				M.GMVerbs-="Multi Key"
			if(manualgm=="Revive World")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Revive_World()
				M.GMVerbs-="Revive World"
			if(manualgm=="World Repop")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/World_Repop()
				M.GMVerbs-="World Repop"
			if(manualgm=="Rename")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Rename()
				M.GMVerbs-="Rename"
			if(manualgm=="Relearn Skills")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Relearn_Skills()
				M.GMVerbs-="Relearn Skills"
			if(manualgm=="Change Title")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Change_Title()
				M.GMVerbs-="Change Title"
			if(manualgm=="World Save")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/World_Save()
				M.GMVerbs-="World Save"
			if(manualgm=="Change Inventory")
				M.verbs -= new/mob/System/Admin/Verbs/HighGM/verb/Change_Inventory()
				M.GMVerbs-="Change Inventory"
			if(manualgm=="Movement Lock")
				M.verbs -= new/mob/System/Admin/Verbs/HighGM/verb/Movement_Lock()
				M.GMVerbs-="Movement Lock"
			if(manualgm=="Restore All Stamina")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Restore_All_Stamina()
				M.GMVerbs-="Restore All Stamina"
			if(manualgm=="Horde")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Start_Horde()
				M.GMVerbs-="Horde"
			if(manualgm=="Dragonball Management")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Dragonball_Manage()
				M.GMVerbs-="Dragonball Management"
			if(manualgm=="Edit")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Edit()
				M.GMVerbs-="Edit"
			if(manualgm=="Give Techs")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Give_Techs()
				M.GMVerbs-="Give Techs"
			if(manualgm=="Server EXP")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Server_Exp()
				M.GMVerbs-="Server EXP"
			if(manualgm=="Server Zenni")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Server_Zenni()
				M.GMVerbs-="Server Zenni"
			if(manualgm=="Change Warrior level")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Change_Player_Warrior_Level()
				M.GMVerbs-="Change Warrior Level"
			if(manualgm=="Give Prize")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Give_Prize()
				M.GMVerbs-="Give Prize"
			if(manualgm=="Give All Prize")
				M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/Give_All_Prize()
				M.GMVerbs-="Give All Prize"
	//		if(manualgm=="Rare Shard")
	//			M.verbs -= new/mob/System/Admin/Verbs/StaffGM/verb/DropRareShard()
	//			M.GMVerbs-="Rare Shard"
	//		if(manualgm=="Random Shard")
	//			M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/DropRandomShard()
	//			M.GMVerbs-="Random Shard"
			if(manualgm=="Delete")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Delete()
				M.GMVerbs-="Delete"
			if(manualgm=="Delete Player Save")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Delete_Player_Save()
				M.GMVerbs-="Delete Player Save"
			if(manualgm=="Get Player Save")
				M.verbs -= new/mob/System/Admin/Verbs/MasterGM/verb/Get_Player_Save()
				M.GMVerbs-="Get Player Save"

			if(manualgm=="Make Icon")
				M.verbs -= new/mob/System/Admin/Verbs/MedGM/verb/Make_Icon()
				M.GMVerbs -="Make Icon"
	OwnerGM/verb

		Auto_Login_Toggle()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Would you like Auto Login turned on??","Auto Login","On","Off"))
				if("On")
					usr.autologin=1
					usr<<"Auto Login has been enabled"
				else
					usr.autologin=0
					usr<<"Auto Login has been disabled"

		Player_Watch(var/mob/M in player)
			set category = "Admin"
			set name = "Player Watch - Bug Abusers"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			M.playerwatch = 1
			usr<<"You are now watching [M], check the save file for details"
		Hearall()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Activate Hear All?","","Activate","De-Activate","Cancel"))
				if("Cancel")
					return
				if("Activate")
					usr.hearall=1
					usr << "You have activated hear all. You will be able to hear everyones' conversations."
				if("De-Activate")
					usr.hearall=0
					usr << "You have de activated hear all. You will no longer be able to hear everyones' conversations."

/*		Activate_All_Shards()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Activate All Shards?","","Activate","Cancel"))
				if("Cancel")
					return
				if("Activate")
					usr.smallshard=1
					usr.largeshard=1
					usr.greatshard=1
					usr.massshard=1
					usr.smallshards=1
					usr.largeshards=1
					usr.greatshards=1
					usr.massshards=1
					usr.smallshardz=1
					usr.largeshardz=1
					usr.greatshardz=1
					usr.massshardz=1
					usr << "<FONT COLOR=#808080>A</FONT><FONT COLOR=#8b8c8d>l</FONT><FONT COLOR=#97989a>l</FONT><FONT COLOR=#a2a4a6> </FONT><FONT COLOR=#adb0b3>S</FONT><FONT COLOR=#b9bdc0>h</FONT><FONT COLOR=#c4c9cd>a</FONT><FONT COLOR=#cfd5da>r</FONT><FONT COLOR=#dae1e6>d</FONT><FONT COLOR=#e6edf3>s</FONT><FONT COLOR=#f0f8ff> </FONT><FONT COLOR=#e6edf3>A</FONT><FONT COLOR=#dae1e6>c</FONT><FONT COLOR=#cfd5da>t</FONT><FONT COLOR=#c4c9cd>i</FONT><FONT COLOR=#b9bdc0>v</FONT><FONT COLOR=#adb0b3>a</FONT><FONT COLOR=#a2a4a6>t</FONT><FONT COLOR=#97989a>e</FONT><FONT COLOR=#8b8c8d>d</FONT><FONT COLOR=#808080>!</FONT>"



		Edit_MOTD()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Edit Message of the Day?","","Edit","Cancel"))
				if("Cancel")
					return
				if("Edit")
	*/

		Set_Skills(mob/PC/M in player)
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Set Skills?","","Set","Cancel"))
				if("Cancel")
					return
				if("Set")
					switch(input("Set skills to what?","Set Skills") in list ("20","40","60","80","100"))
						if("20")
							M.melee_max = 20
							M.melee_mastered = 0
							M.block_max = 20
							M.block_mastered = 0
							M.dodge_max = 20
							M.dodge_mastered = 0
							M.counter_max = 20
							M.counter_mastered = 0
							M.critical_max = 20
							M.critical_mastered = 0
							M.durability_max = 20
							M.durability_mastered = 0
							M.ki_control_max = 20
							M.ki_control_mastered = 0
							M.ki_cast_max = 20
							M.ki_cast_mastered = 0
							M.ki_power_max = 20
							M.ki_power_mastered = 0
							M.ki_use_max = 20
							M.ki_use_mastered = 0
							M.ki_res_max = 20
							M.ki_res_mastered = 0
							M.reflect_max = 20
							M.reflect_mastered = 0
							M.weapon_max = 20
							M.weapon_mastered = 0
							M.weapon_power_max = 20
							M.weapon_power_mastered = 0
							M.weapon_resistance_max = 20
							M.weapon_res_mastered = 0

						if("40")
							M.melee_max = 40
							M.melee_mastered = 0
							M.block_max = 40
							M.block_mastered = 0
							M.dodge_max = 40
							M.dodge_mastered = 0
							M.counter_max = 40
							M.counter_mastered = 0
							M.critical_max = 40
							M.critical_mastered = 0
							M.durability_max = 40
							M.durability_mastered = 0
							M.ki_control_max = 40
							M.ki_control_mastered = 0
							M.ki_cast_max = 40
							M.ki_cast_mastered = 0
							M.ki_power_max = 40
							M.ki_power_mastered = 0
							M.ki_use_max = 40
							M.ki_use_mastered = 0
							M.ki_res_max = 40
							M.ki_res_mastered = 0
							M.reflect_max = 40
							M.reflect_mastered = 0
							M.weapon_max = 40
							M.weapon_mastered = 0
							M.weapon_power_max = 40
							M.weapon_power_mastered = 0
							M.weapon_resistance_max = 40
							M.weapon_res_mastered = 0

						if("60")
							M.melee_max = 60
							M.melee_mastered = 0
							M.block_max = 60
							M.block_mastered = 0
							M.dodge_max = 60
							M.dodge_mastered = 0
							M.counter_max = 60
							M.counter_mastered = 0
							M.critical_max = 60
							M.critical_mastered = 0
							M.durability_max = 60
							M.durability_mastered = 0
							M.ki_control_max = 60
							M.ki_control_mastered = 0
							M.ki_cast_max = 60
							M.ki_cast_mastered = 0
							M.ki_power_max = 60
							M.ki_power_mastered = 0
							M.ki_use_max = 60
							M.ki_use_mastered = 0
							M.ki_res_max = 60
							M.ki_res_mastered = 0
							M.reflect_max = 60
							M.reflect_mastered = 0
							M.weapon_max = 60
							M.weapon_mastered = 0
							M.weapon_power_max = 60
							M.weapon_power_mastered = 0
							M.weapon_resistance_max = 60
							M.weapon_res_mastered = 0

						if("80")
							M.melee_max = 80
							M.melee_mastered = 0
							M.block_max = 80
							M.block_mastered = 0
							M.dodge_max = 80
							M.dodge_mastered = 0
							M.counter_max = 80
							M.counter_mastered = 0
							M.critical_max = 80
							M.critical_mastered = 0
							M.durability_max = 80
							M.durability_mastered = 0
							M.ki_control_max = 80
							M.ki_control_mastered = 0
							M.ki_cast_max = 80
							M.ki_cast_mastered = 0
							M.ki_power_max = 80
							M.ki_power_mastered = 0
							M.ki_use_max = 80
							M.ki_use_mastered = 0
							M.ki_res_max = 80
							M.ki_res_mastered = 0
							M.reflect_max = 80
							M.reflect_mastered = 0
							M.weapon_max = 80
							M.weapon_mastered = 0
							M.weapon_power_max = 80
							M.weapon_power_mastered = 0
							M.weapon_resistance_max = 80
							M.weapon_res_mastered = 0

						if("100")
							M.melee_max = 100
							M.block_max = 100
							M.dodge_max = 100
							M.counter_max = 100
							M.critical_max = 100
							M.durability_max = 100
							M.ki_control_max = 100
							M.ki_cast_max = 100
							M.ki_power_max = 100
							M.ki_use_max = 100
							M.ki_res_max = 100
							M.reflect_max = 100
							M.weapon_max = 100
							M.weapon_power_max = 100
							M.weapon_resistance_max = 100


/*		Skill_Verbs()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			switch(alert("Unlock Skill Verbs?","","Lock","Unlock","Cancel"))
				if("Cancel")
					return
				if("Lock")
					switch(alert("Lock Skill Verbs?","","Lock","Cancel"))
						if("Cancel")
							return
						if("Lock")
							shardverbs = 0
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=red>[usr] has locked all shard verbs.</font></b>"

				if("Unlock")
					switch(input("Which stage to unlock?","Unlock Shards")in list("Small","Large","Great","Massive","Cancel"))
						if("Cancel")
							return
						if("Small")
							shardverbs = 1
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=green>[usr] has unlocked Level 1 shard verbs.</font></b>"
						if("Large")
							shardverbs = 2
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=yellow>[usr] has unlocked Level 2 shard verbs.</font></b>"
						if("Great")
							shardverbs = 3
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=blue>[usr] has unlocked Level 3 shard verbs.</font></b>"
						if("Massive")
							shardverbs = 4
							for(var/mob/PC/M in player)
								if(M.GMLevel)
									M << "<b><font color=red>[usr] has unlocked Level 4 shard verbs.</font></b>"

		DeleteClones()
			set category="Admin"
			switch(alert("Delete them.","","Auto","Manual","Cancel"))
				if("Cancel")
					return
				if("Auto")
					for(var/mob/M in world)
						if(M.type==/mob/PC)
							if(!M.key)
								del(M)
				if("Manual")
					var/mob/M=input("Who")as mob in world
					switch(alert("Delete [M]?","","Yes","No"))
						if("No")
							return
						else
							del(M)

		Reset_SpamList()
			set category="Admin"
			switch(alert("Do it?","","Yes","No"))
				if("No")
					return
				else
					CreationSpam=new/list()
					var/savefile/X = new("world save files/GM.sav")
					X["CreationSpam"]<<CreationSpam

		BanSenzuAbusers()
			set category="Admin"
			switch(alert("Do it?","","Yes","No"))
				if("No")
					return
				else
					for(var/mob/PC/M in player)
						var/beancount=0
						for(var/obj/Equipment/Consumable/Senzu/S in M.contents)
							beancount++
						if(beancount>60)
							world<<"\red [M] is abusing glitches."
							var/savfl=0
							var/ck=M.client.ckey
							if(M.save_file_1)
								savfl=1
							if(M.save_file_2)
								savfl=2
							if(M.save_file_3)
								savfl=3
							sleep(3)
							M<<"Your save file has been wiped."
							del(M.client)
							sleep(10)
							fdel("world save files2/Player Saves/[ck]/Save File [savfl].sav")
*/

	God/verb
		Talk_as_Player(mob/PC/N in player,T as text)
			set category = "Admin"
			set hidden = 1
			if(src.key != "Narmanb")
				return
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			if(N.GMLevel>=usr.GMLevel)
				usr<<alert("Sorry Pal but you can't use this on higher or the same level Gms for obvious reasons!!")
			if(Check_For_Spam(T,SPAM) == TRUE)
				usr<<"Please do not use linebreak characters."
				return
			for(var/mob/PC/M in player)
				if(!N.GMLevel)
					if(M.ooc_on)
						if(N.in_guild)
							M << {"<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.guild_name]<b><font color=#6E6E6F>}{[N.guild_title]<b></u></s><font color=#6E6E6F>}<font color = [N.textcolorname]>[N.name] OOC: [N.textcolor]<font size = 1>[T]"}
						else
							if(!N.in_guild)
								M << {"<b><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = [N.textcolorname]>[N.name] OOC: [N.textcolor]<font size = 1>[T]"}
				else
					if(N.in_guild)
						M << {"<b><font color=#4286f4>(GM:[N.GMLevel])</font><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.guild_name]<b><font color=#6E6E6F>}{[N.guild_title]<b></u></s><font color=#6E6E6F>}<font color = [N.textcolorname]>[N.name] OOC: [N.textcolor]<font size = 1>[T]"}

					else
						if(!N.in_guild)
				//			M << {"<b><font color=#4286f4>(GM:[N.GMLevel])</font><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = white>[N.name] OOC: [N.textcolor]<font size = 1>[T]"}
							M << {"<b><font color=#4286f4>(GM:[N.GMLevel])</font><font color=red>([N.rank])<b><font color=#6E6E6F>{[N.title]}<font color = [N.textcolorname]>[N.name] OOC: [N.textcolor]<font size = 1>[T]"}

		//	AdminMessage("[usr] has pretended [N] said: [T]")
		Change_Race_and_Gene(mob/PC/M in player)
			set category = "Admin"
			set hidden = 1
			alert("This is under construction, crim, finish this already")
/*			var/race=input("Which Race do you want to change [M.name] to??","Race Chooser") in list ("Android", "Bio Android", "Bio Warrior", "Changeling", "Demon", "Dragon", "Half Saiyan", "Saiyan", "Heran", "Human", "Kai", "Konat", "Majin", "Majin Incarnate", "Majin Wizard", "Namekian", "Saibaman", "Tuffle", "Feline")
			if(M.race == "Android")
				M.contents -=/obj/Transform/Transform
				M.contents -=/obj/Transform/Revert
				M.contents -=/obj/Technique/SelfDestruct
				M.contents -=/obj/Technique/KiBlast
				M.contents -=/obj/Technique/UniversalScan
				M.contents -=/obj/Technique/KiAbsorb
				M.contents -=/obj/Technique/KiShower
				M.learn_universalscan = 0
				M.learn_kiabsorb = 0
				M.learn_kishower = 0
				M.power_multi / 12
				M.ki_multi / 9.5
				M.kidefense_multi / 10
				M.strength_multi / 6.5
				M.defence_multi / 6.5
			if(M.race == "Bio Android")
				M.contents -=/obj/Transform/Transform
				M.contents -=/obj/Transform/Revert
				M.contents -=/obj/Technique/Absorb
				M.contents -=/obj/Technique/KiBlast
				M.contents -=/obj/Technique/Regenerate
				M.contents -=/obj/Technique/KienzanDisk
				M.contents -=/obj/Technique/KiShower
				M.contents -=/obj/Technique/EnergyField
				M.learn_absorb = 0
				M.learn_kiabsorb=0
32				M.learn_kishower=0
				M.learn_kienzandisk=0
				M.learn_energyfield=0
				M.power_multi / 11
				M.ki_multi / 10
				M.kidefense_multi / 10
				M.strength_multi / 7
				M.defence_multi / 5.5
			if(M.race == "Bio Warrior")
				M.contents -=/obj/Transform/Transform
				M.contents -=/obj/Transform/Revert
				M.contents -=/obj/Technique/KiBlast
				M.power_multi / 5
				M.ki_multi / 5
				M.kidefense_multi / 5
				M.strength_multi / 3.5
				M.defence_multi / 3.5
			if(M.race == "Changeling")
				M.contents -=/obj/Transform/Transform
				M.contents -=/obj/Transform/Revert
				M.contents -=/obj/Technique/KienzanDisk
				M.contents -=/obj/Technique/ImprisonmentBall
				M.contents -=/obj/Technique/DeathWave
				M.contents -=/obj/Technique/SauzerBlade
				M.contents -=/obj/Technique/KiShower
				M.contents -=/obj/Technique/FusionDance
				M.contents -=/obj/Technique/SuperNova
				M.learn_imprisonmentball = 0
				M.learn_deathwave=0
				M.learn_kishower=0
				M.learn_kienzandisk=0
				M.learn_sauzerblade=0
				M.learn_fusiondance=0
				M.learn_supernova=0
				M.power_multi / 5.5
				M.ki_multi / 4.5
				M.kidefense_multi / 5
				M.strength_multi / 3.5
				M.defence_multi / 3.5


			M.race = race
			if(race = demon)
				var/gene=input("What gene","Gene Picker") in list ("gene 1","Gene 2")
			if("Android")
				mobcreation.contents += new/obj/Transform/Transform
				mobcreation.contents += new/obj/Technique/KiBlast
				mobcreation.contents += new/obj/Technique/SelfDestruct
				mobcreation.contents += new/obj/Transform/Revert
			if("Bio Android")
				src.icon='Bio Android - Form 1.dmi'
				mobcreation.contents += new/obj/Technique/Absorb
				mobcreation.contents += new/obj/Transform/Transform
				mobcreation.contents += new/obj/Transform/Revert
				mobcreation.contents += new/obj/Technique/KiBlast
				mobcreation.contents += new/obj/Technique/Regenerate
*/
		Get_All_Player_Saves()
			set category = "Admin"
			if(usr.key=="Crimson Slayer"||usr.key=="Cazdogga"||usr.key=="Hammerboy"||usr.key == "Narmanb")
				var/x=input("Which Folder do you want to zip and save","Zip Folder") in list("Player Saves","world save files")
				if(fexists("[x].zip"))fdel("[x].zip") //deletes any old archives to start a new one
				var/zipfile/F = new/zipfile
				F.New("[x].zip") //make the zip file
				var/list/file_list = flist("[x]/") //change to your savefile directory
				for(var/i = 1 to file_list.len)
					F.Import("[x]/[file_list[i]]") //fill in the zip file with every file located in "player saves/"
				F.Close() //make sure file is properly closed before sending
				usr << ftp(F.name) //send to yourself
			else
				usr<<"It appears this verb is still in progress"

/*		World_Name_Update()
			set category = "Admin"
			var/updateworldname=input("What would you like to change the world name to??","Change world name","Dragonball Ruination") as text
			window(default).title = updateworldname*/

		Update_Server(f as file)
			set category = "Admin"
			switch(alert("Shutdown or Restart after update??","Update Server","Shutdown","Restart"))
				if("Shutdown")
					if(usr.key=="Crimson Slayer"||usr.key=="Cazdogga"||usr.key=="Hammerboy"||usr.key == "Narmanb")
						player<<"<font color=red>World Update Incoming. Saving Characters."
						for(var/mob/PC/M in player)
							if(!M.loggedin)continue
							M.client.SaveChar()
							sleep(1)
						player<<"<font color=red>Characters Saved! World Update in 20 seconds."
						AdminMessage("[usr] is updating the server.")
						sleep(100)
						player<<"<font color=red>World Update in 10 seconds."
						cantsaveatall=1
						sleep(100)
						player<<"<font color=red>Shutting Down the World."
						fdel("Dragonball Ruination.dmb")
						fcopy(f,"Dragonball Ruination.dmb")
						del(world)
					else
						usr << "OOOps it looks as if this verb isn't operational yet"
						return
				if("Restart")
					if(usr.key=="Crimson Slayer"||usr.key=="Cazdogga"||usr.key=="Hammerboy"||usr.key == "Narmanb")
						player<<"<font color=red>World Update Incoming. Saving Characters."
						for(var/mob/PC/M in player)
							if(!M.loggedin)continue
							M.client.SaveChar()
							sleep(1)
						player<<"<font color=red>Characters Saved! World Update in 20 seconds."
						AdminMessage("[usr] is updating the server.")
						sleep(100)
						player<<"<font color=red>World Update in 10 seconds."
						cantsaveatall=1
						sleep(100)
						player<<"<font color=red>Rebooting."
						fdel("Dragonball Ruination.dmb")
						fcopy(f,"Dragonball Ruination.dmb")
						world.Reboot()
					else
						usr << "OOOps it looks as if this verb isn't operational yet"
						return


		/*Zombie_Player
			set category = "Admin"
			var/zombieplayer=mob.client
			//crimson add a list for savefiles and choose from savefiles then use zombieplayer.LoadChar(1), set up verb to use training verbs on other players
		*/

/*
		HTML_Test()
			set category = "Admin"

			var/http[] = world.Export("http://s15.zetaboards.com/Dragonball_Ruination/pages/gmlist/")
			if(!http)
				usr << "Failed to connect."
				return

			var/F = http["CONTENT"]
			if(F)
				var/htmlsave=html_encode(file2text(F))
				usr << htmlsave
				var/gmlist= new/list
				gmlist=dd_gmtext2list(htmlsave,"@")
				usr<<"-----------------------------------------------------------"
				for(var/i in gmlist)
					usr<<i
				usr<< gmlist
*/

		Save_File_From_Server()
			set category = "Admin"
			if(usr.key=="Crimson Slayer"||usr.key=="Cazdogga"||usr.key=="Hammerboy"||usr.key == "Narmanb"||usr.key == "Beandog")
				var/list/file_list = flist("world save files/")
				file_list.Add("Cancel")
				var/file_chosen=input("Which file would you like to get??","Get File") in file_list
				if(file_chosen == "Cancel")
					return
				if(file_chosen == "Edit Use/")
					var/list/edit_list = flist("world save files/Edit Use/")
					edit_list.Add("Cancel")
					if(edit_list == "Cancel")
						return
					else
						var/edit_chosen=input("Which file would you like to get??","Get File") in edit_list
						usr<<ftp("world save files/Edit Use/[edit_chosen]")
						return

				if(file_chosen == "DebugRevert/")
					var/list/edit_list = flist("world save files/DebugRevert/")
					edit_list.Add("Cancel")
					if(edit_list == "Cancel")
						return
					else
						var/edit_chosen=input("Which file would you like to get??","Get File") in edit_list
						usr<<ftp("world save files/DebugRevert/[edit_chosen]")
						return


				if(file_chosen == "Login Log/")
					var/list/login_list = flist("world save files/Login Log/")
					login_list.Add("Cancel")
					if(login_list == "Cancel")
						return
					else
						var/login_chosen=input("Which file would you like to get??","Get File") in login_list
						usr<<ftp("world save files/Edit Use/[login_chosen]")
						return
				else
					usr<<ftp("world save files/[file_chosen]")
					return
			else
				usr<<"OOOps it looks as if this verb isn't operational yet"
				return

/*		Backup_Player_Save_file()
			set category = "Admin"
			if(GMLockCheck())
				usr<<"<font color=red>Your Admin Powers Are Locked."
				return
			else


*/
mob/proc/RemoveGM()
	src.GMLevel = 0
	TrialEnf.Remove(src.ckey)
	LowEnf.Remove(src.ckey)
	MediumEnf.Remove(src.ckey)
	HighEnf.Remove(src.ckey)
	MasterEnf.Remove(src.ckey)
	StaffEnf.Remove(src.ckey)
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/God/verb))
		src.verbs-=X

mob/proc/LogOutGM()
	for(var/X in typesof(/mob/System/Admin/Verbs/TrialGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/LowGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MedGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/HighGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/MasterGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/StaffGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/OwnerGM/verb))
		src.verbs-=X
	for(var/X in typesof(/mob/System/Admin/Verbs/God/verb))
		src.verbs-=X
	src.GMLevel = 0


mob/proc/BudokaiMasterCheck()
	if(BudoMaster.Find(src.ckey))
		usr<<"<center>\red You are a Budokai Master."
		for(var/vx in typesof(/mob/TourneyMaster/verb))
			src.verbs+=vx
mob/var/GMLevel=0
mob/var/GMLock=0
mob/var/GM_ChatMute=0
mob/var/tmp/afkchk=0
var/lastafk=0
var/lastdbe=0
var/lastdbn=0
var/lastdbb=0
mob
	proc
		UnmuteTimer(T)
			src.muted=1
			sleep(T)
			if(!src.muted)return
			player<<"<b>[src] has been <font color=red>Unmuted."
			src.muted = 0
world
	proc
		AFKCHECKSTART()
			lastafk=world.time
			for(var/mob/PC/M in player)
				if(M.GMLevel)continue
				if(!M.loggedin)continue
				spawn(1)M.AFKPOP()
			player << "<font color = #00B211>Dragon AI:</font> \white AFK checker has been <font color=green>Initiated</font>."
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>20 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>19 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>18 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>17 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>16 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>15 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>14 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>13 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>12 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>11 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>10 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>9 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>8 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>7 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>6 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>5 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>4 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>3 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>2 seconds"
			sleep(10)
			player<<"\white <center>AFK Boot In: <font color=gray>1 seconds"
			sleep(10)
			player << "<font color = #00B211>Dragon AI:</font> \white AFK checker has <font color=red>Ended</font>."
			world.AFKBOOT()
mob/proc/AFKPOP()
	src.afkchk=1
	var/afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	var/afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2]","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			player << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
			del(src.client)
		else
			src.afkchk=0
	else
		src.afkchk=0
mob/proc/AFKPOPSPECIF(X)
	src.afkchk=1
	var/afkt1
	var/afkt2
	if(!X)
		afkt1=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
		afkt2=pick("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
	else
		afkt1=X
		afkt2=""
	afkt1=uppertext(afkt1)
	afkt2=uppertext(afkt2)
	var/warn=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
	if(!warn||warn==""||warn==null||uppertext(warn)!="[afkt1][afkt2]")
		var/warn2=input(src,"Type in the following box: [afkt1][afkt2] (if you can't answer it in time logout.)","AFK Check")as text
		if(!warn2||warn2==""||warn2==null||uppertext(warn2)!="[afkt1][afkt2]")
			player << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
			del(src.client)
		else
			src.afkchk=0
			AdminMessage("[src] has answered to the AFK check.")
	else
		src.afkchk=0
		AdminMessage("[src] has answered to the AFK check.")
mob/proc/AFKPOPTIME(X)
	player << "<font color = #00B211>Dragon AI:</font> \white [src] you are under AFK check."
	src<<"\white AFK Boot In: <font color=gray>10 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>10 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>9 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>9 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>8 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>8 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>7 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>7 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>6 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>6 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>5 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>5 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>4 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>4 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>3 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>3 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>2 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>2 seconds")
	sleep(10)
	if(!src.afkchk)return
	src<<"\white AFK Boot In: <font color=gray>1 seconds"
	AdminMessage("\white [src] AFK Boot In: <font color=gray>1 seconds")
	sleep(10)
	if(!src.afkchk)return
	if(X=="BAN")
		if(!src.afkchk)return
		player << "<font color=#00B211>Dragon AI:</font> \white [src] has been <font color=red>Banned</font>."
		BannedK.Add(src.ckey)
		var/savefile/Z = new("world save files/Bans.sav")
		Z["BannedK"]<<BannedK
		sleep(2)
		del(src)
	else
		if(!src.afkchk)return
		player << "<font color=#00B211>Dragon AI:</font> \white [src] has been Booted for being Idle."
		del(src.client)
world/proc/AFKBOOT()
	for(var/mob/PC/N in player)
		if(!N.loggedin)continue
		if(N.GMLevel)continue
		if(!N.afkchk)continue
		player << "<font color=#00B211>Dragon AI:</font> \white [N] has been Booted for being Idle."
		del(N.client)
		sleep(1)

mob/proc/PrefixCheck()

	switch(GMLevel)
		if(7)
			if(src.in_guild) return
			switch(alert("Would you like to change your title to default?","Gee Emm Title Change","Yes","No"))
				if("Yes")
					src.title = "<font color=white>Game Owner</font>"
		if(6)
			if(src.in_guild) return
			switch(alert("Would you like to change your title to default?","Gee Emm Title Change","Yes","No"))
				if("Yes")
					src.title = "<font color=white>Co Owner</font>"
		if(5)
			if(src.in_guild) return
			switch(alert("Would you like to change your title to default?","Gee Emm Title Change","Yes","No"))
				if("Yes")
					src.title = "<font color=white>Head Global Administrator</font>"
		if(4)
			if(src.in_guild) return
			switch(alert("Would you like to change your title to default?","Gee Emm Title Change","Yes","No"))
				if("Yes")
					src.title = "<font color=white>Head Administrator</font>"
		if(3) src.title = "<font color=white>Global Moderator</font>"
		if(2) src.title = "<font color=white>Moderator</font>"
		if(1) src.title = "<font color=white>Enforcer</font>"