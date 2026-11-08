//NOTE: Banning needs to be completed

var
	logged_in_admins[0]
	admin_keys = list("Destroy", "Mercia") //admin keys go here (demo uses Guest)

world
	Topic(T,Addr,Master,Key)
		var/list/params = params2list(T)
		if(!(Key in admin_keys))
			RALog("Unauthorized key [Key](IP:[Addr]) tried to access the remote admin")
			return 0
		if(!(Addr in logged_in_admins) && !(params["action"] == "login" || params["action"] == "logout"))
			RALog("Unconnected client [Addr] tried to access the remote admin")
			return 0
		switch(params["action"])
			if("login")
				if(Addr in logged_in_admins)
					return 0
				else
					logged_in_admins += Addr
					spawn()
						RALog("[Key]@[Addr] has logged in with the Remote Admin")
						RASend(\
{"This server supports:
	-Boot by IP
	-Boot by Key
	-Reboot
	-Shutdown
	-Who"}, Addr)
						RASend("Connected Mobs: ", Addr)
						for(var/client/C)
							RASend("	IP: [C.address?(C.address):("null")]	Key: [C.key?(C.key):("null")]	Name: [C.mob?(C.mob.name):("null")]", Addr)
					return 1
			if("logout")
				if(Addr in logged_in_admins)
					logged_in_admins -= Addr
					RALog("[Key]@[Addr] has logged out of the Remote Admin")
				return 1
			if("boot")
				if(params["key"])
					RALog("[Key] booted [params["key"]].")
					GM_Log("[Key]@[Addr] booted [params["key"]] via remote admin.")
					bootkey(url_decode(params["key"]))
				if(params["ip"])
					RALog("[Key] booted [params["ip"]].")
					GM_Log("[Key]@[Addr] booted [params["ip"]] via remote admin.")
					bootip(url_decode(params["ip"]))
				return 1
			if("reboot")
				RALog("[Key] rebooted the world.")
				GM_Log("[Key]@[Addr] rebooted the world via remote admin.")
				world << "<span class=\"reboot\">World Reboot in 2 seconds!</span>"
				spawn(20)
					RALog("World Reboot.")
					RALogout()
					world.Reboot()
				return 1
			if("shutdown")
				RALog("[Key] shut down the world.")
				GM_Log("[Key]@[Addr] shut down the world via remote admin.")
				world << "<span class=\"shutdown\">World Shutdown in 2 seconds!</span>"
				spawn(20)
					RALog("World Shutdown.")
					RALogout()
					del(world)
				return 1
			if("who")
				RASend("Connected Mobs: ", Addr)
				for(var/client/C)
					RASend("	IP: [C.address?(C.address):("null")]	Key: [C.key?(C.key):("null")]	Name: [C.mob?(C.mob.name):("null")]", Addr)


		. = ..()

proc
	RALog(text) //logs text to logged in remote admin clients
		for(var/addr in logged_in_admins)
			var/topic = "byond://[addr]?"
			topic += list2params(list("action"="log", "text"=text))
			spawn() world.Export(topic)
	RASend(text, addr) //logs text to a logged in remote admin client
		var/topic = "byond://[addr]?"
		topic += list2params(list("action"="log", "text"=text))
		spawn() world.Export(topic)

	RALogout() //logs out connected remote admin clients
		for(var/addr in logged_in_admins)
			var/topic = "byond://[addr]?"
			topic += list2params(list("action"="logout"))
			spawn() world.Export(topic)

	bootkey(key)
		for(var/client/C)
			if(C.ckey == ckey(key))
				del(C)
	bootip(ip)
		for(var/client/C)
			if(C.address == ip)
				del(C)