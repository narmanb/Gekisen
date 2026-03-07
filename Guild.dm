mob/var/guild = "None"
mob/var/ClanLeader = 0
mob/var/Inguild = 0
mob/verb/Create_Guild()
	set category = "Guild"
	if(usr.ClanLeader == 1)
		usr << "Sorry, your already a leader for a guild."
		return
	else
		if(usr.Inguild == 1||usr.guildpause==1)
			usr << "Sorry, your already in a guild."
			return
		else
			var/name1 = input("What would you like to name your guild?(if you attempt to use html to add size you get booted)") as text|null
			for(var/mob/M in world)
				if(M.guildadmin == 1)
					switch(input(M,"Will you allow [usr] to make his guild [name1]?","Guild") in list("Yes","No"))
						if("Yes")
							usr.guild = name1
							usr.oocname=usr.guild
							usr.ClanLeader = 1
							usr.Inguild=1
							usr<<"Your guild has been certified!"
							world<<"<b><font color=white><font face=tahoma><font size=1>Guild Info: <font color=yellow>[usr] creates [usr.guild]!"
						if("No")
							usr<<"Your guild has been rejected, wait before making a new one."
							usr.guildpause=1
							sleep(1000)
							usr.guildpause=0

mob/verb/Guild_Invite(mob/M in world)
	set category = "Guild"
	set popup_menu = 1
	if(usr.guildpause==0)
		if(usr.Inguild == 0)
			usr << "Sorry, your not the Leader, so you can-not invite anyone."
			return
		else
			if(usr.ClanLeader == 0&&usr.canrecruit==0)
				usr << "Create a Guild!"
				return
			else
				if(alert("Are you sure you want to invite [M] to your guild?","Invite [M]?","Yes","No") == "Yes")
					switch(input(M,"Would you like to join [usr]'s Guild?","Guild") in list("Yes","No"))
						if("Yes")
							M.guild = usr.guild
							M << "You Join, [usr]'s Guild The: [usr.guild]"
							usr << "<B>[M] has Joined your guild!"
							world<<"<b><font color=white><font face=tahoma><font size=1>Guild Info: <font color=yellow>[M] has joined [usr.guild]!"
							M.ClanLeader=0
							M.Inguild = 1
							M.canrecruit=0
							M.oocname=usr.guild
						if("No")
							usr << "[M]: I will not join your guild!"
							usr.guildpause=1
							sleep(1000)
							usr.guildpause=0
mob/verb/Leave_Guild()
	set category="Guild"
	switch(input("Do you really want to leave your guild?", "Guild", text) in list ("Yes","No"))
		if("Yes")
			if(usr.Inguild==1)
				usr.Inguild=0
				world<<"<b><font color=white><font face=tahoma><font size=1>Guild Info: <font color=yellow>[usr] has left [usr.guild]!"
				usr.rankname=""
				usr.canrecruit=0
				usr.oocname="Player"
				usr <<"You have left your guild"
				usr.guild="None"
				if(usr.ClanLeader==1)
					usr.ClanLeader=0
					usr << "Guild Dispatched"
mob/verb/Transfer_leadership(mob/M in world)
	set category="Guild"
	set popup_menu = 1
	switch(input("Do you really want to give ownership of your guild away?", "Guild", text) in list ("Yes","No"))
		if("Yes")
			if(usr.ClanLeader==1 && usr.guild==M.guild)
				usr.ClanLeader=0
				M.ClanLeader=1
				M<<"[usr] has transfered ownership of his guild to you"
				usr<<"Guild leadership has been lost."

mob/verb/Boot_Guild(mob/M in world)
	set category="Guild"
	set popup_menu = 1
	if(usr.Inguild == 0)
		usr << "Sorry, your not in a guild."
		return
	else
		if(usr.ClanLeader == 0&&usr.canrecruit==0)
			usr << "You do not have the power to boot members of this guild"
			return
		else
			if(usr.guild==M.guild)
				if(alert("Are you sure you want to boot [M] from your guild?","Boot [M]?","Yes","No") == "Yes")
					if(M.guild == usr.guild)
						if(usr.ClanLeader==1)
							M.canrecruit=0
						if(M.canrecruit!=1)
							if(M.ClanLeader!=1)

								M<<"You've been booted from [usr]'s Guild:[usr.guild]"
								world<<"<b><font color=white><font face=tahoma><font size=1>Guild Info: <font color=yellow>[M] has been booted from [usr.guild]!"
								M.Inguild = 0
								M.oocname="Player"
								M.guild="None"
								M.rankname=""
								M.canrecruit=0
							else
								usr<<"They are the leader! you cannot boot them!"
						else
							usr<<"You do no have the right to boot [M] as they are a recruiter"
					else
						usr<<"They arent even in your guild!"
mob/verb/Rank_Change(mob/M in world,newrank as text)
	set category="Guild"
	set popup_menu = 1
	if(usr.Inguild == 0)
		usr << "Sorry, your not in a guild."
		return
	else
		if(usr.ClanLeader == 0)
			usr << "Your not the leader of this guild"
			return
		else
			if(usr.guild==M.guild)
				if(length(newrank) >= 25)
					usr<<"That rank name is too long, under 25 letters please."
				else
					if(findText("[newrank]","<font")==1||findText("[newrank]","<span")==1)
						usr<<"Font tags are not permitted in Ranks"
					else
						M.rankname=newrank
			else
				usr<<"That person isnt even in your guild!"
mob/verb/Make_Recruiter(mob/M in world)
	set category="Guild"
	set popup_menu = 1
	if(usr.Inguild == 0)
		usr << "Sorry, your not in a guild."
		return
	else
		if(usr.ClanLeader == 0)
			usr << "Your not the leader of this guild"
			return
		else
			if(usr.guild==M.guild)
				M.canrecruit=1
				usr<<"[M] is now a recruiter"
				M<<"[usr] has given you the ability to recruit."
mob/verb/Remove_Recruiter(mob/M in world)
	set category="Guild"
	set popup_menu = 1
	if(usr.Inguild == 0)
		usr << "Sorry, your not in a guild."
		return
	else
		if(usr.ClanLeader == 0)
			usr << "Your not the leader of this guild"
			return
		else
			if(usr.guild==M.guild)
				M.canrecruit=0
				usr<<"[M] is no longer a recruiter"
				M<<"[usr] has removed your ability to recruit"
mob/verb/GuildOOC(msg as text)
	set category = "Guild"
	for(var/mob/characters/M in world)
		if(usr.guild=="None")
			sleep(10)
		else
			if(M.listenguild==1)
				if(M.guild == usr.guild)
//					if(usr.isgold==1)
//						M<<"<font color=Yellow><b>*</b></font><font color = Silver>{{<font color = Blue>[usr.oocname]<font color = Silver>}<font color = aqua>[usr.rankname]<font color = Silver>}<font color = Blue><tt>{{<font color = Silver>[usr]<font color = Blue>}}<font color = white> OOCs:<font color = Yellow> [html_encode(msg)]"
//					else
					M<<"<font color = Silver>{{<font color = Blue>[usr.oocname]<font color = Silver>}<font color = aqua>[usr.rankname]<font color = Silver>}<font color = Blue><tt>{{<font color = Silver>[usr]<font color = Blue>}}<font color = white> OOCs:<font color = Yellow> [html_encode(msg)]"
				if(M.spy)
					M<<"<font color = Silver>{{<font color = Blue>[usr.oocname]<font color = Silver>}<font color = aqua>[usr.rankname]<font color = Silver>}<font color = Blue><tt>{{<font color = Silver>[usr]<font color = Blue>}}<font color = white> OOCs:<font color = Yellow> [html_encode(msg)]"

mob/verb/GuildChallenge(mob/characters/M in world)
	set category="Guild"
	set name="Declare War"
	set popup_menu = 1
	if(usr.key!=M.key)
		for(var/mob/characters/o in world)
			if(o.z==14)
				usr<<"The Arena is in use, sorry"
			else
				if(usr.Inguild == 1)
					if(usr.ClanLeader==1)

						if(M.guild=="None")
							usr<<"They aren't in a Guild"
						else
							if(usr.guildcool==0)
								usr.guildcool=1

								if(alert(M,"Do you want to go to war with [usr.guild]","War?","Yes","No") == "Yes" && M.key!=null|"")

									for(var/mob/characters/g in world)
										if(g.guild==M.guild)
											g<<"Going to War with [usr.guild]"
											g.oldx=g.x
											g.oldy=g.y
											g.oldz=g.z
											g.loc=locate(67,rand(77,102),14)
										if(g.guild==usr.guild)
											g<<"Going to War with [M.guild]"
											g.oldx=g.x
											g.oldy=g.y
											g.oldz=g.z
											g.loc=locate(97,rand(77,102),14)
									sleep(100)
									var/timer=50
									loop
									usr.allycount=0
									usr.enemycount=0

									for(var/mob/characters/q in world)
										if(q.guild==usr.guild)
											if(q.z == 14)
												usr.allycount+=1
										if(q.guild==M.guild)
											if(q.z == 14)
												usr.enemycount+=1
									if(usr.allycount==0)
										world<<"[M.guild] defeated [usr.guild]!!"

										for(var/mob/characters/x in world)
											if(x.guild==M.guild)
												if(x.z==14)
													x.loc=locate(x.oldx,x.oldy,x.oldz)
										goto done
									if(usr.enemycount==0)
										world<<"[usr.guild] defeated [M.guild]!!"
										for(var/mob/characters/x in world)
											if(x.guild==usr.guild)
												if(x.z==14)
													x.loc=locate(x.oldx,x.oldy,x.oldz)
										goto done
									sleep(100)
									if(usr.allycount>0&&usr.enemycount>0)
										usr<<"Allies:[usr.allycount],Enemies [usr.enemycount]"
										timer-=1
										if(timer<=0)
											for(var/mob/characters/a in world)
												if(a.z==14)
													a.loc=locate(a.oldx,a.oldy,a.oldz)
													a<<"Sorry you ran out of time"
													goto done
										else
											goto loop
									done
									for(var/mob/characters/u in world)
										if(u.z==14)
											u.loc=locate(u.oldx,u.oldy,u.oldz)

							else
								usr<<"You have Challenged somebody recently"

mob/verb/ArenaChallenge(mob/characters/M in world)
	set category="Guild"
	set popup_menu = 1
	if(usr.key!=M.key)
		for(var/mob/characters/o in world)
			if(o.z==14)
				usr<<"The Arena is in use, sorry"
			else
				if(usr.guildcool==0)
					usr.guildcool=1
					if(alert(M,"Do you accept [usr]'s Challenge","Challenge?","Yes","No") == "Yes" && M.key!=null|"")

						usr.oldx=usr.x
						usr.oldy=usr.y
						usr.oldz=usr.z
						M.oldx=M.x
						M.oldy=M.y
						M.oldz=M.z
						usr.loc=locate(66,rand(117,126),14)
						M.loc=locate(77,rand(117,126),14)
						var/timer=30
						loop
						sleep(100)
						if(M)
							if(M.z==14)
								if(usr.z==14)
									timer-=1
									if(timer<=0)
										for(var/mob/characters/a in world)
											if(a.z==14)
												a.loc=locate(a.oldx,a.oldy,a.oldz)
												a<<"Sorry you ran out of time"
												return
									else
										goto loop
								else
									M<<"YOU WIN!"
									M.arenakills++
									usr.arenadeaths++
									world<<"[M] defeated [usr]!!"
									M.loc=locate(M.oldx,M.oldy,M.oldz)
									return
							else
								usr<<"YOU WIN!"
								usr.arenakills++
								M.arenadeaths++
								world<<"[usr] defeated [M]!!"
								usr.loc=locate(usr.oldx,usr.oldy,usr.oldz)
								return

				else
					usr<<"You have Challenged somebody recently"
