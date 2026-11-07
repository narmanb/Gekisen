/**********************************************************************************************
** Dragoball Online
**  Guild System(Verbs), version 1
**  guildverbs.dm, created by Kobata 1/18/2005
**  last update: 1/18/2005
***********************************************************************************************/
guild_verbs
	var/guild/guild
	var/plid
	New()
		del(src)
	lv1 //normal guild member
		verb
			Guild_Who()
				set category = "Guild"
				set desc = "List people in your guild that are online."
				for(var/mob/M in players)
					if(M.guild == guild)
						src << "[M] - [guild.Get_Title(M)]"
			Leave_Guild()
				set category = "Guild"
				set desc = "Leave your guild."
				if(alert(src, "Are you SURE you want to leave your guild?", "Leave Guild", "Yes", "No") == "Yes")
					var/playersleft = 0
					for(var/list/L in guild.ids)
						for(var/id in L)
							playersleft++
					if(playersleft == 1)
						del(guild)
					else
						if(guild.Check_Guild_Member(plid) == 20 && \
								alert(src, "Would you like to appoint a new leader?", "Leave Guild", "Yes", "No") \
									== "Yes")
							var/list/plids = list()
							for(var/list/L in guild.ids)
								plids += L
							var/newleaderid = input(src, "Enter the player id to give leader.", "Leave Guild") in plids
							guild.ids[guild.Check_Guild_Member(newleaderid)] -= newleaderid
							guild.ids[20] += newleaderid
							for(var/mob/M in players)
								if(M.plid == newleaderid)
									guild.Check_Guild_Verbs(M)
						guild.ids[guild.Check_Guild_Member(plid)] -= plid
						guild = null
	lv15 //can recruit
		verb
			Recruit(mob/M in players)
				set category = "Guild"
				set desc = "(player) Recruit someone to your guild."
				var/guild/G = usr.guild
				var/result = alert(M, "[usr] has invited you to the guild \"[G]\", would you like to join it?",\
					"Guild Invite!", "Yes", "No")
				if(!M) return
				if(result == "Yes")
					if(!M.guild)
						M.guild = G
						G.ids[1] += M.plid
						G.Check_Guild_Verbs(M)
					else
						alert(M, "You're already in a guild!")
	lv19 //can boot people out of the guild
		verb
			ID_List()
				set category = "Guild"
				set desc = "List the player ID of people in your guild(and names of those online)."
				for(var/i = 1; i <= guild.ids.len; i++)
					src << "Level [i] -- [guild.titles[i]]"
					for(var/id in guild.ids[i])
						var/mob/M
						for(M in players)
							if(M.plid == id)
								break
						if(!M)
							src << "[id]"
						else
							src << "[M] - [id]"
			Guild_Boot(id as num)
				set category = "Guild"
				set desc = "(Player ID, New Level) Boot someone out of your guild."
				if(!guild.Check_Guild_Member(id))
					alert(src, "That person is not in your guild!")
					return
				else if(guild.Check_Guild_Member(id) >= guild.Check_Guild_Member(plid))
					alert(src, "You cannot boot people of equal or higher level than you!")
					return
				else
					var/current_lv = guild.Check_Guild_Member(id)
					guild.ids[current_lv] -= id
					for(var/mob/M in players)
						if(M.plid == id)
							guild.Remove_Guild_Verbs(M)
							M.guild = null
	lv20 //leader
		verb
			Change_Member_Level(id as num, new_level in guild.titles)
				set category = "Guild"
				set desc = "(Player ID, New Level) Change the level of someone in your guild."
				if(!guild.Check_Guild_Member(id))
					alert(src, "That person is not in your guild!")
					return
				else if(guild.Check_Guild_Member(id) >= guild.Check_Guild_Member(plid))
					alert(src, "You cannot change the level of people of equal or higher level than you!")
					return
				else
					if(new_level == guild.titles[20])
						if(alert(src, "Are you sure you wish to make the person a guild leader? If you do, \
								then it cannot be undone.", "Level Change", "Yes", "No") == "No")
							return
					var/current_lv = guild.Check_Guild_Member(id)
					guild.ids[current_lv] -= id
					for(var/i = 1; i <= guild.titles.len; i++)
						if(guild.titles[i] == new_level)
							new_level = i
					guild.ids[new_level] += id
					for(var/mob/M in players)
						if(M.plid == id)
							guild.Check_Guild_Verbs(M)
			Set_Titles()
				set category = "Guild"
				set desc = "Set your guild's titles."
				var/level = input(src, "Which title would you like to change?", "Change Titles") as null|anything in guild.titles
				while(level)
					for(var/i = 1; i <= guild.titles.len; i++)
						if(guild.titles[i] == level)
							guild.titles[i] = input(src, "Enter the new title", "Change Titles", guild.titles[i]) as text
					level = input(src, "Which title would you like to change?", "Change Titles") as null|anything in guild.titles