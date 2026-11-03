mob/var/drain_kill = 0
obj/Technique/Drain
	verb/Drain(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Drain")
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
			var/gain = rand(1,3)
			var/gainamount = rand(5,20)
			if(gain == 1)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from draining [M]!","output2")
				usr.strength_bonus += gainamount
			if(gain == 2)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from draining [M]!","output2")
				usr.defence_bonus += gainamount
			if(gain == 3)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from draining [M]!","output2")
				usr.ki_bonus += gainamount
			usr.doing = 1
			usr.frozen = 1
			spawn(5)
				usr.doing = 0
				usr.frozen = 0

			//if(istype(M,/mob/PC))
		//	usr.powerlevel_max += drain
		//	usr << output("<b><font color = green>You got [applycommas(drain)] powerlevel from draining [M]!","output2")
		//		M.powerlevel_max -= drain
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
			usr.drains += 1
			M.DeathCheck(usr,"Drain")