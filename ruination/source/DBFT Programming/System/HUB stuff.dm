world/proc/RecordResults()
	for(var/mob/M in player)
		if(!M.client)return
		if(M)M.UpdateMyRecords()
proc/PLAYER_UPDATE()
	players = 0
	world.RecordResults()
	for(var/mob/PC/C)
		if(C.client)
			players += 1
	spawn(150) PLAYER_UPDATE()
mob/proc/UpdateMyRecords(level, kills)
	var/result=world.GetScores(src.key)
	if(!result)return
	result=params2list(result)
	var/new_records
	new_records["Level"] = max(src.level, text2num(result["Level"]))
	new_records["Kills"] =  max(src.kills, text2num(result["Kills"]))
	world.SetScores(src.key, list2params(new_records))

mob/proc
	Check_PVP()
		if(src.pvp_rating >= 10)
			src.RecordPVP()
	RecordPVP(pvp_level)
		var/result=world.GetScores(src.key)
		if(!result)return
		result=params2list(result)
		var/new_records
		new_records["PVP Level"] = max(src.pvp_level, text2num(result["PVP Level"]))
		world.SetScores(src.key, list2params(new_records))
		src.pvp_rating = 0