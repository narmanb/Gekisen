var/TotalCPU=0
var/TotalTicks=0
var/HighestCPU=0
var/TotalPlayers=0
var/HighestPlayers=0
var/TicksOver100=0
var/logon=0
proc/LogCPU()
	while(logon)
		TotalTicks+=1
		TotalCPU+=world.cpu
		TotalPlayers+=player.len
		if(world.cpu>=100)	TicksOver100+=1
		if(world.cpu>HighestCPU)	HighestCPU=world.cpu
//		if(onlinePlayers.len>HighestPlayers)	HighestPlayers=player.len
		sleep(0.1)
	world << "CPU Logging disabled"

mob/verb/ResetCPU()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	TotalCPU=0
	TotalTicks=0
	HighestCPU=0
	TotalPlayers=0
	HighestPlayers=0
	TicksOver100=0
	logon=0
	src<<"CPU Logging Reset"

mob/verb/CheckCPU()

	set hidden = 1
	if(usr.key != "Narmanb")
		return
	src<<""
	src<<"Highest CPU: [HighestCPU]%"
	src<<"100% Usage Ticks: [FullNum(TicksOver100)] | Total Ticks: [FullNum(TotalTicks)]"
	var/averageCPU=round(TotalCPU/TotalTicks,0.01)
	var/averagePlayers=round(TotalPlayers/TotalTicks,0.01)
	src<<"<b>Average CPU:</b> [averageCPU]% | <b>Average Players:</b> [averagePlayers]"
	if(averagePlayers)	src<<"<b>Average % per Player:</b> [round(averageCPU/averagePlayers,0.01)]%"
	src<<"<b>Average 100% Ticks:</b> [round(TicksOver100/TotalTicks,0.01)]%"
	src<<""


mob/verb/StartCPUlog()
	set hidden = 1
	if(usr.key != "Narmanb")
		return
	usr << "CPU Logging enabled"
	logon=1
	spawn(-1) LogCPU()