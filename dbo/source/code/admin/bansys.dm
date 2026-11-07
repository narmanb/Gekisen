var
	crban_bannedmsg="<FONT SIZE = 2><FONT COLOR = RED><B>You have been banished from Dragonball Online!</B></FONT>"
	crban_keylist[0]
	crban_iplist[0]
	crban_unbanned[0]

proc/crban_fullban(mob/M, unban_time = 0)
	if (!M || !M.key || !M.client || (M.ckey in admins)) return
	if(!crban_keylist) crban_keylist = list()
	if(!crban_iplist) crban_iplist = list()
	if(!crban_unbanned) crban_unbanned = list()
	crban_key(M.ckey, unban_time)
	crban_IP(M.client.address, unban_time)
	crban_savefile(M.client, unban_time)
	SaveWorld()
	del M

proc/crban_IP(address, unban_time)
	if(!crban_iplist) crban_iplist = list()
	if (!crban_iplist.Find(address) && address && address!="localhost" && address!="128.0.0.1")
		crban_iplist[address] = unban_time

proc/crban_key(key as text, unban_time)
	if(!crban_keylist) crban_keylist = list()
	var/ckey=ckey(key)
	if (!crban_keylist.Find(ckey))
		crban_keylist[ckey]=unban_time

proc/crban_unban(key)
	if(!crban_unbanned) crban_unbanned = list()
	key=ckey(key)
	if (key && crban_keylist.Find(key))
		usr << "<B><FONT COLOR = RED>Key '[key]' unbanned.</B></FONT>"
		crban_keylist.Remove(key)
		crban_unbanned.Add(key)

proc/crban_savefile(client/C, unban_time)
	var/F=C.Import()
	if (F)
		//Update savefile
		var/savefile/S=new(F)
		S["[ckey(world.url)]"] << unban_time
		C.Export(S)
	else
		//New savefile
		var/savefile/S=new()
		S["[ckey(world.url)]"] << unban_time
		C.Export(S)

client/New()
	. = ..()
	if(!(ckey in admins))
		if(!crban_keylist) crban_keylist = list()
		if(!crban_iplist) crban_iplist = list()
		if(!crban_unbanned) crban_unbanned = list()
		if(crban_keylist.Find(ckey))
			if(crban_keylist[ckey] && crban_keylist[ckey] <= world.realtime)
				crban_keylist.Remove(ckey)
				crban_unbanned.Add(ckey)
			else if (key!="Guest")
				crban_IP(address)
				crban_savefile(src)
			src << crban_bannedmsg
			del src

		if (crban_iplist.Find(address))
			if (crban_unbanned.Find(ckey) || (crban_iplist[address] && crban_iplist[address] <= world.realtime))
				//Unban
				crban_iplist.Remove(address)
				crban_unbanned.Add(ckey)
			else
				crban_key(ckey)
				crban_savefile(src)
				src << crban_bannedmsg
				del src

		var/savefile/S=Import()
		if (ckey(world.url) in S)
			//We're savefile banned
			if (crban_unbanned.Find(ckey) || (S[ckey(world.url)] && S[ckey(world.url)] <= world.realtime))
				//Unban
				crban_unbanned.Remove(ckey)
				S[world.url] << -1
				Export(S)
			else
				//Don't unban
				crban_key(ckey)
				crban_IP(address)
				src << crban_bannedmsg
				del src

