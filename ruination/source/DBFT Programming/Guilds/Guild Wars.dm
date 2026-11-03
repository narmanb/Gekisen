var
	list/Team1 = list()
	list/Team2 = list()
	gwar_on=0
	guild_war_1
	guild_war_2
	guildies1=0
	guildies2=0
	war_member_limit1=0
	war_member_limit2=0
	gwcooldown = 0
mob/GuildLeader
	verb
		Guild_War()
			set category = "Guild"
			if(gwar_on)
				src<<"There is a Guild War currently taking place, try again later."
				return
			gwar_on=1
			var/list/L=new/list()
			for(var/mob/M in player)
				if(M.guild_leader)
					if(!M.in_war)
						L.Add(M)
			L.Add("Cancel")
			L.Remove(usr)
			var/mob/A=input("Challenge who?")in L
			if(A=="Cancel")
				gwar_on=0
				return
			if(A==usr)
				gwar_on=0
				return
			if(!A)
				gwar_on=0
				return
			if(A.in_war)
				return
			if(A.dead)
				gwar_on=0
				return
			if(gwcooldown)
				gwar_on=0
				usr<<"You need to wait a bit longer before doing another guild war"
				return
			if(A.guild == usr.guild)
				usr << "You can't have a guild war with your own guild!"
				gwar_on=0
				return
			switch(alert("Do you wish to challenge [A] the leader of [A.guild]?","","Yes","No"))
				if("No")
					gwar_on=0
					return
				if("Yes")
					var/limit=input("Set the Guild member limit for this Guild War(Max=20")as null | num
					if(limit<=0)
						limit=0
					if(limit>20)
						limit=20
					switch(alert(A,"[usr] has challenged you for a Guild War(Guild members limit: [limit]. Do you accept?","","Yes","No"))
						if("No")
							gwar_on=0
							alert(usr,"[A] Declined!")
							return
						if("Yes")
							alert(usr,"[A] Accepted! Go to the Guild tab and click Guild War Start")
							usr.verbs+=new/mob/GuildLeaderWar/verb/Guild_War_Start
							spawn(1)GuildWarStart(usr,A,limit)
mob/GuildLeaderWar
	verb
		Guild_War_Start()
			set category = "Guild"
			if(!usr.in_war)
				usr<<"You have not registered for war!"
				return
			switch(alert("Do you want to Start or Cancel the war?","","Start","Cancel"))
				if("Start")
					switch(alert("All set up for War?","","Yes","No"))
						if("No")
							return
						else
							for(var/mob/L in player)
								if(L.guild_name==guild_war_2)
									if(L.guild_leader)
										switch(alert(L,"[usr] is ready. Are you ready for War?","","Yes","No"))
											if("No")
												usr<<"[L] isn't ready"
												return
											else
												if(!guildies2||!guildies1)
													for(var/mob/PC/D in world)
														D.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
														D.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
												if(!L.in_war)
													L<<"You have not registered for war!"
													usr<<"[L] has not registered for war!"
													return
												for(var/mob/PC/M in player)
													if(M.in_war)
														if(M.guild==usr.guild)
															M.loc=locate(rand(299,319),rand(198,208),7)
														if(M.guild!=usr.guild)
															M.loc=locate(rand(368,388),rand(115,125),7)
														M.it_lock=1
														M.it_blocked=1
													M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
													M.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
												player <<"<FONT color = red>Server:<FONT color = White> Guild War has Started!"
												gwar_on=1
												return
				else
					gwar_on=0
					guild_war_1=null
					guild_war_2=null
					for(var/mob/PC/M in player)
						if(M.guild_name==guildies1||M.guild_name==guildies2)
							M<<"<center>\white [src] has <font color=red>Cancelled</font> the War!"
						M.in_war=0
						M.verbs-=new/mob/GuildVerbsWar/verb/Guild_War_Join
						M.verbs-=new/mob/GuildLeaderWar/verb/Guild_War_Start
mob/GuildVerbsWar
	verb
		Guild_War_Join()
			set category = "Guild"
			if(src.dead)
				return
			if(src.in_hbtc)
				usr << "You can't join guild wars while in hbtc!"
				return
			if(!src.in_war)
				switch(alert("Go to War?","","Yes","No"))
					if("No")
						return
					if("Yes")
						if(!gwar_on)
							src<<"The war has been canceled."
							return
						if(src.in_war)return
						if(src.guild_name==guild_war_1)
							if(!war_member_limit1)
								src<<"There are no more open spots!"
								return
						else
							if(!war_member_limit2)
								src<<"There are no more open spots!"
								return
						if(src.guild_name==guild_war_1)
							war_member_limit1-=1
							guildies1++
							Team1.Add(src)
						if(src.guild_name==guild_war_2)
							war_member_limit2-=1
							guildies2++
							Team2.Add(src)
						src.in_war=1
						player <<"<font color=#66ff00>[src] has joined the Guild War!"
						return
			else
				switch(alert("Resign from War?","","Yes","No"))
					if("No")
						return
					if("Yes")
						if(!gwar_on)
							src<<"The war has been canceled."
							return
						if(src.guild_name==guild_war_1)
							war_member_limit1+=1
							guildies1-=1
							Team1.Remove(src)
						if(src.guild_name==guild_war_2)
							war_member_limit2+=1
							guildies2-=1
							Team2.Remove(src)
						src.in_war=0
						player <<"<font color=#66ff00>[src] has resigned the Guild War."
						return

proc
	GuildWarCheck()
		if(gwar_on)
			if(guildies2<=0)
				gwar_on=0
				player <<"<center><FONT color = White>[guild_war_1] has Defeated [guild_war_2]! [guild_war_1] has won 5 Z Points each for their Valiance and Victory.</font></center>"
				guild_war_1=null
				guild_war_2=null
				for(var/mob/PC/M in Team1)
					M.zp += 5
					M.tp += M.level*1.5
					Team1.Remove(M)
					M << "You are rewarded with [M.level*1.5] Training Points & 5 Z Points for your efforts."

				for(var/mob/PC/M in Team2)
					M.tp += M.level
					Team2.Remove(M)
					M << "You are rewarded with [M.level] Training Points for your efforts."
				for(var/mob/PC/M in player)
					if(M.in_war)
						M.loc = locate(400,260,7)
						M.it_lock=0
						M.it_blocked=0
						M.overlays -= 'Halo.dmi'
						M.overlays -= 'Halo.dmi'
						M.overlays -= 'Halo.dmi'
						M.icon_state=""
						M.dead=0
						M.safe=0
				gwcooldown = 1
				spawn(600) gwcooldown=0
			if(guildies1<=0)
				gwar_on=0
				player <<"<center><FONT color = White>[guild_war_2] has Defeated [guild_war_1]! [guild_war_2] has won 5 Z Points and some tps each for their Valiance and Victory.</font></center>"
				guild_war_1=null
				guild_war_2=null
				for(var/mob/PC/M in Team2)
					M.zp += 5
					M.tp += M.level*1.5
					Team2.Remove(M)
					M << "You are rewarded with [M.level*1.5] Training Points & 5 Z Points for your efforts."
				for(var/mob/PC/M in Team1)
					M.tp += M.level
					Team1.Remove(M)
					M << "You are rewarded with [M.level] Training Points for your efforts."
				for(var/mob/PC/M in player)
					if(M.in_war)
						M.loc = locate(400,260,7)
						M.it_lock=0
						M.it_blocked=0
						M.overlays -= 'Halo.dmi'
						M.overlays -= 'Halo.dmi'
						M.overlays -= 'Halo.dmi'
						M.icon_state=""
						M.dead=0
						M.safe=0
proc
	GuildWarStart(mob/A,mob/B,N)
		gwar_on=1
		guildies1=0
		guildies2=0
		guild_war_1=A.guild_name
		guild_war_2=B.guild_name
		A.in_war=1
		B.in_war=1
		war_member_limit1=N-1
		war_member_limit2=N-1
		for(var/mob/PC/C in world)
			C.in_war=0
			if(C.guild == A.guild || C.guild == B.guild)
				C.verbs+=new/mob/GuildVerbsWar/verb/Guild_War_Join
				C << "Get ready for War! To join go to the Guild tab and click Guild War Join."
		player <<"<FONT color = red>Server:<FONT color = White> [A.guild_name] and [B.guild_name] are going to War!"
mob
	proc
		GWUpdate()
			if(src.in_war&&src.z==7)
				if(src.guild_name==guild_war_1)
					guildies1-=1
				if(src.guild_name==guild_war_2)
					guildies2-=1
				GuildWarCheck()