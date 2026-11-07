/**********************************************************************************************
** Dragoball Online
**  Guild System, version 1
**  guild.dm, created by Kobata 1/18/2005
**  last update: 1/18/2005
***********************************************************************************************/
var/guild/guilds[]


guild
	var
		ids[20][0]
		titles[0]
		name

	New(mob/leader, name)
		. = ..()
		if(!leader) return
		ids[20] += leader.plid
		src.name = name
		for(var/i = 1; i <= 20; i++)
			titles += "Level [i]"
		Check_Guild_Verbs(leader)

	proc
		Check_Guild_Member(id)
			for(var/i = 1; i <= ids.len; i++)
				if(id in ids[i])
					return i
			return 0

		Check_Guild_Verbs(mob/M)
			var/level = Check_Guild_Member(M.plid)
			if(level)
				Add_Guild_Verbs(M, level)
				if(M.title == "Player")
					M.title = "[src]"

		Add_Guild_Verbs(mob/M, level)
			M.guild = src
			for(var/i = 1; i <= level, i++)
				M.verbs += typesof("/guild_verbs/lv[i]/verb")

		Remove_Guild_Verbs(mob/M)
			for(var/i = 1; i <= ids.len, i++)
				M.verbs -= typesof("/guild_verbs/lv[i]/verb")

		Get_Title(mob/M)
			var/level = Check_Guild_Member(M.plid)
			if(level)
				return titles[level]

mob
	var
		tmp
			guild
				guild
	verb
		Create_Guild(name as text)
			set category = "Other"
			if(zenni < 75000)
				alert("You don't have enough zenni!", "Create Guild \"[name]\"")
			else if(src.guild)
				alert("You're already in a guild!", "Create Guild \"[name]\"")
			else
				for(var/guild/G in guilds)
					if(G.name == name)
						alert("There is already a guild with that name!", "Create Guild \"[name]\"")
						return
				guild = new(src, name)
				guilds += guild
				zenni -= 75000
				var/titles = alert("Would you like to set the titles for each guild level?", "Create Guild \"[name]\"", "Yes", "No")
				if(!usr) return
				switch(titles)
					if("Yes")
						var/level = input("Which title would you like to change?", "Create Guild \"[name]\"") as null|anything in guild.titles
						while(level)
							for(var/i = 1; i <= guild.titles.len; i++)
								if(guild.titles[i] == level)
									guild.titles[i] = input("Enter the new title", "Create Guild \"[name]\"", guild.titles[i]) as text
									guild.titles[i] = guild.titles[i]
							level = input("Which title would you like to change?", "Create Guild \"[name]\"") as null|anything in guild.titles