mob/var/absorb_kill = 0
obj/Technique/Absorb
	verb/Absorb(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Absorb")
		if(!M)return
		if(usr.doing)
			usr << "You are doing something already!"
			return
		if(usr.dead || M.dead)
			usr << "A force stops you from attacking [M]"
			return
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				usr << "You are in a Safe Zone!"
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
			/*
			var/absorb = 0


			if(istype(M,/mob/PC))
				absorb = round(M.powerlevel_max/500)
				if(absorb>50000000)
					absorb=50000000
			if(istype(M,/mob/Monster))
				absorb = round(M.powerlevel_max/500)
				if(absorb>1000000)
					absorb=1000000


			if(absorb > usr.powerlevel_max * 0.05)
				absorb = usr.powerlevel_max * 0.05
				*/
			var/gain = rand(1,3)
			var/gainamount = rand(5,20)
			if(gain == 1)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] strength bonus from absorbing [M]!","output2")
				usr.strength_bonus += gainamount
			if(gain == 2)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] defense bonus from absorbing [M]!","output2")
				usr.defence_bonus += gainamount
			if(gain == 3)
				usr << output("<b><font color = green>You got [applycommas(gainamount)] ki bonus from absorbing [M]!","output2")
				usr.ki_bonus += gainamount
			usr.doing = 1
			usr.frozen = 1
			spawn(5)
				usr.doing = 0
				usr.frozen = 0
		//	usr.powerlevel_max += absorb
		//	usr << output("<b><font color = green>You got [applycommas(absorb)] powerlevel from absorbing [M]!","output2")
			//M.powerlevel_max -= absorb
			M.powerlevel = 0
			usr.absorbs += 1
			M.DeathCheck(usr,"Absorb")
