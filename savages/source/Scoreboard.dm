// Do not modify this code unless you know what your doing.

#define DEBUG
/var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black;  color: white}</STYLE><head><title>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Level;Date;}
	New(mob/person)
		if(!person)return
		Name=(usr.name)
		Key=(usr.key)
		Level=((usr.strength + usr.speed + usr.defense)/ 3)
		Date=(time2text(world.realtime))
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=yellow>DBZ Savages Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><font color=blue><B>#</th><th>Name <I>(key)</I></th><th>Power</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u><font fac=arial><STYLE>BODY {color: gold}</STYLE>[(number)]\th</td><td></u>[(player.Name)] <I>([(player.Key)])</I></td><td>[(num2text(round(player.Level)))]</td><td>[(player.Date)]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard;size=524x344")
	Ranking(var/mob/player)
		if(!usr||!usr.client)return
		else
			var/savefile/F=new("levels.sav")
			var/list/level=new()
			F[("stuff")]>>(level)
			if(!level)level=new()
			var{character="[(usr.client.ckey)]/[(usr.name)]"
				score=level.Find(character)
				Rank_Entry/newest=new(usr)
				Rank_Entry/last}
			if(score)
				var/Rank_Entry/old=(level[(character)])
				if(old.Level>=(usr.strength + usr.speed + usr.defense)/ 3)return score
				while(score>1)
					last=level[(level[(score-1)])]
					if(last.Level>=(usr.strength + usr.speed + usr.defense)/ 3)break
					level[(score)]=(level[(score-1)])
					level[(--score)]=(character)
					level[(level[(score+1)])]=(last)
				level[(character)]=(newest)
				F[("stuff")]<<(level)
				return score
			score=(level.len)
			if(score>=10)
				last=(level[(level[(score)])])
				if(last.Level>=(usr.strength + usr.speed + usr.defense)/ 3)return 11
				level[(score)]=(character)
			else score=(level.len+1),level+=(character)
			while(score>1)
				last=(level[(level[(score-1)])])
				if(last.Level>=(usr.strength + usr.speed + usr.defense)/ 3)break
				level[(score)]=(level[(score-1)])
				level[(--score)]=(character)
				level[(level[(score+1)])]=(last)
			level[(character)]=(newest)
			F[("stuff")]<<(level)
			return score