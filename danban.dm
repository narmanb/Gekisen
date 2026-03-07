var
	list/Banlist
	BanLog = "<STYLE>BODY {background: black; color: white; font-size: -1}</STYLE>"
proc
	BanLogs(){var/savefile/F=new("BanLogs/Text.text");F << BanLog}
	LoadLogs(){var/savefile/F=new("BanLogs/Text.text");F>>BanLog}
mob/Ban/verb
	BanLog()
		set category = "Police"
		switch(alert("What would you like to do?","Police","View","Delete"))
			if("View")
				LoadLogs()
				src<<browse("[BanLog]","window=Logs Announcements;size=500x400")
			if("Delete")
				BanLog = "<STYLE>BODY {background: black; color: white; font-size: -1}</STYLE>"
				BanLogs()
banentry
	var
		ip
		k
		dateto
		reason
world/proc/SaveBanlist()
	var/savefile/S=new("banlist")
	S["Banlist"] << Banlist
world/proc/LoadBanlist()
	var/savefile/S=new("banlist")
	S["Banlist"] >> Banlist
	if (!length(Banlist)) Banlist=new/list()

world/proc/dateloop()
	date = round(realtime/51840000)
	sleep(36000)
	spawn()dateloop()
client/proc/CheckBan()
	if(src.key=="Masterdan")
		for(var/banentry/M in Banlist)
			if(M.ip==src.address)
				if(M.dateto  - date <0)
					del(M)
				else
					src<<"<Font color=red>You've been banned [M.reason] for the duration of [M.dateto-date +1]</font>"
					del(src)
			if(M.k==src.key)
				if(M.dateto - date <0)
					del(M)
				else
					src<<"<Font color=red>You've been banned [M.reason] for the duration of [M.dateto-date + 1]</font>"
					del(src)
var/date
mob/Ban/verb
	Ban_Key(k as text)
		set category= "Police"
		var/banentry/X = new/banentry
		var/reason = input("Why is this individual being Banned?", "Reason") as text
	//	Reason.Add(reason)
		var/duration = input("How long will this person be banned for", "Duration in Days") as num
		var/dateto = round(world.realtime/51840000) +duration
	//	Bandur.Add(dateto)
	//	Banlist.Add(k)
		var/addip=""
		X.dateto=dateto
		X.reason=reason
		for(var/mob/characters/X1 in world)
			if(X1.key == k)
				addip=X1.client.address
				X1<<"<Font color=red>You've been banned because of [X.reason] for the duration of [X.dateto-date]</font>"
				del(X1)
	//	Iplist.Add(addip)
		X.ip=addip
		X.k=k
		BanLog += "[X]/[X.k]/[X.ip] was key banned by [usr]/[usr.key]/[usr.client.address]- [reason]<br>"
		BanLogs()
		Banlist.Add(X)
		world.SaveBanlist()
	Ban_IP(ip as text)
		set category= "Police"
		var/banentry/X = new/banentry
		var/reason = input("Why is this individual being Banned?", "Reason") as text
	//	Reason.Add(reason)
		var/duration = input("How long will this person be banned for", "Duration in Days") as num

		var/dateto = round(world.realtime/51840000) +duration
	//	Bandur.Add(dateto)
		var/addkey=""
		X.dateto=dateto
		X.reason=reason
		for(var/mob/characters/X1 in world)
			if(X1.client)
				if(X1.client.address ==ip)
					addkey=X1.key
					X1<<"<Font color=red>You've been banned because of [X.reason] for the duration of [X.dateto-date]</font>"
					del(X1)


		X.ip=ip
		X.k=addkey
		BanLog += "[X]/[X.k]/[X.ip] was IP banned by [usr]/[usr.key]/[usr.client.address]- [reason]<br>"
		BanLogs()
		Banlist.Add(X)
		world.SaveBanlist()

	Ban_Mob(mob/characters/M as mob)
		set category= "Police"
		if(M.client)
			var/banentry/X = new/banentry
			var/reason = input("Why is this individual being Banned?", "Reason") as text
		//	Reason.Add(reason)
			var/duration = input("How long will this person be banned for", "Duration in Days") as num
			var/dateto = round(world.realtime/51840000) +duration
		//	Bandur.Add(dateto)
			//Iplist.Add(M.client.address)
			X.ip=M.client.address
			X.k=M.key
			X.dateto=dateto
			X.reason=reason
			Banlist.Add(X)
			world.SaveBanlist()
			BanLog += "[X]/[X.k]/[X.ip] was banned by [usr]/[usr.key]/[usr.client.address]- [reason]<br>"
			BanLogs()
			M<<"<Font color=red>You've been banned because of [X.reason] for the duration of [X.dateto-date]</font>"
			del(M)
	Unban_Key(k as text)
		set category= "Police"
		if(!k)
			return
		for(var/banentry/M in Banlist)
			if(M.k==k)
				Banlist.Remove(M)
		BanLog += "[k] was unbanned by [usr]/[usr.key]/[usr.client.address]<br>"
		BanLogs()
		world.SaveBanlist()
	Unban_IP(ip as text)
		set category= "Police"
		for(var/banentry/M in Banlist)
			if(M.ip==ip)
				Banlist.Remove(M)
		BanLog += "[ip] was unbanned by [usr]/[usr.key]/[usr.client.address]<br>"
		BanLogs()
		world.SaveBanlist()
	Ban_Who()
		set category= "Police"
		var/who={"<STYLE>BODY {background: Black; color: White}  IMG.icon{width:32;height:32}</STYLE>
<head><title>Who's Banned</title></head>
<table border="1" cellpadding="4">
<tr align="center"><th colspan="3"><font size=1>IP</th><th><font size=1>Key</th><th><font size=1>Duration</th><th><font size=1>Reason</th></tr>"}
		for(var/banentry/M in Banlist)
			who+={"<tr align="center"><td colspan="3"><font size=2>[M.ip]</td><td><font size=2>[M.k]</td><td><font size=2>[M.dateto-date]</td><td><font size=2>[M.reason]</td></tr>"}
		src<<browse(who,"window=who,size=500x300,can_resize=1,can_minimize=0")

/*
mob/PermBan/verb
	Ban_Key(k as text)
		set category= "Police"
		var/reason = input("Why is this individual being Banned?", "Reason") as text
	//	Reason.Add(reason)
		var/dateto = round(world.realtime*99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)
	//	Bandur.Add(dateto)
	//	Banlist.Add(k)
		var/
		X.dateto=dateto
		X.reason=reason
		for(var/mob/characters/X1 in world)
			if(X1.key == k)
				addip=X1.client.address
				X1<<"<Font color=red>You've been banned because of continual disruptance of the game for the duration of permanetly.</font>"
				del(X1)
	//	Iplist.Add(addip)
		X.ip=addip
		X.k=k
		Banlist.Add(X)
*/