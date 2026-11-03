obj/Technique/Infect
	verb/Infect(mob/M in get_step(usr,usr.dir))
		set category = "Techniques"
		if(!M)return
		if(usr.doing)
			usr << "You are already doing something."
			return
		if(usr.dead || M.dead)
			usr << "You cannot attack [M] right now."
			return
		if(usr.safe || M.safe)
			usr << "[M] cannot be attacked right now."
			return
		if(!M.pk)
			usr << "[M] is not a Combatant!"
			return
		if(!usr.pk)
			usr << "You are not a Combatant!"
			return
		if(!M.KO)
			usr << "[M] isn't KO!"
			return
		else
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




			usr.icon_state="spirit bomb"
			usr.infects+=1
		//	if(usr.absorb_kill==10)
		//		usr.contents+=new/obj/Transform/Transform
			usr.doing=1
			usr.frozen=1
			spawn(5)
				usr.icon_state=""
				usr.doing=0
				usr.frozen=0
			M.DeathCheck(usr,"Infect")
mob
	proc
		AbsorbTechs(var/mob/PC/M)
			if(!src.learn_specialbeam&&M.learn_specialbeam)
				src.learn_specialbeam=1
				src.contents+=new/obj/Technique/SpecialBeamCannon
			if(!src.learn_finalflash&&M.learn_finalflash)
				src.learn_finalflash=1
				src.contents+=new/obj/Technique/FinalFlash
			if(!src.learn_finishbuster&&M.learn_finishbuster)
				src.learn_finishbuster=1
				src.contents+=new/obj/Technique/FinishBuster
			if(!src.learn_galickgun&&M.learn_galickgun)
				src.learn_galickgun=1
				src.contents+=new/obj/Technique/GalickGun
			if(!src.learn_deathbeam&&M.learn_deathbeam)
				src.learn_deathbeam=1
				src.contents+=new/obj/Technique/DeathBeam
			if(!src.learn_tribeam&&M.learn_tribeam)
				src.learn_tribeam=1
				src.contents+=new/obj/Technique/TriBeam
			if(!src.learn_hellzonegrenade&&M.learn_hellzonegrenade)
				src.learn_hellzonegrenade=1
				src.contents+=new/obj/Technique/HellZoneGrenade
			if(!src.learn_genocideattack&&M.learn_genocideattack)
				src.learn_genocideattack=1
				src.contents+=new/obj/Technique/GenocideAttack