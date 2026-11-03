mob/var/corrupt_kill = 0
obj/Technique/Corrupt
	verb/Corrupt(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Corrupt")
		if(!M)return
		if(usr.doing)
			usr << "You are doing something already!"
			return
		if(usr.dead || M.dead)
			usr << "A force stops you from attacking [M]"
			return
		if(usr.safe || M.safe)
			usr << "A force stops you from attacking [M]"
			return
		if(!M.pk)
			usr << "[M] is not a Combatant!"
			return
		if(M.FuseFollower)
			return
		if(!usr.pk)
			usr << "You are not a Combatant!"
			return
		if(!M.KO && M.powerlevel > 0)
			usr << "[M] must be knocked out first!"
			return
		else

			usr.doing = 1
			usr.frozen = 1
			spawn(5)
				usr.doing = 0
				usr.frozen = 0
			var/gain = rand(1,3)
			var/gainamount = rand(5,20)
			if(gain == 1)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from corrupting [M]!","output2")
				usr.strength_bonus += gainamount
			if(gain == 2)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from corrupting [M]!","output2")
				usr.defence_bonus += gainamount
			if(gain == 3)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from corrupting [M]!","output2")
				usr.ki_bonus += gainamount

//			if(istype(M,/mob/PC))
		//	usr.defence_max += corrupt
		//	usr << output("<b><font color = green>You got [applycommas(corrupt)] powerlevel from corrupting [M]s soul!","output2")
	//			M.powerlevel_max -= corrupt
			M.powerlevel = 0
			if(M.karma == "Good")
				M.karma_rating -= 5
			if(M.karma == "Evil")
				M.karma_rating += 5
			if(M.karma_rating < 0)
				if(M.karma == "Good")
					M << "<I>You feel an Evil inside of you begin to awaken..."
					M.karma = "Evil"
					M.karma_rating = 0
				else
					M << "<I>You feel the Good inside of you begin to awaken..."
					M.karma = "Good"
					M.karma_rating = 0
			usr.corrupts += 1
			M.DeathCheck(usr,"Corrupt")