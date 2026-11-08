mob/Monster/Split_Form
	density = 1
	pk = 1
	New()
		..()
		spawn(600)
			del(src)
		spawn(5)StartPetAI()
	Del()
		var/mob/M=src.owner
		if(M)
			M.splits-=1
			if(M.splits<0)
				M.splits=0
		..()
	proc
		StartPetAI()
			while(src)
				for(var/turf/Floors/Safe_Zone/S in oview(1,src))
					if(S in oview(1,src))
						del(src)
						break
				var/Found = FALSE
				for(var/mob/P in oview(12))
					if(P!=src.owner&&!P.safe&&!P.dead&&P.pk)
						if(get_dist(src,P)>1)
							walk_towards(src,P)
						else
							if(get_dist(src,P)<=1)
								src.Attack2(P)
						Found = TRUE
					else
						for(var/mob/P2 in oview(12))
							if(P!=src.owner&&!P.safe&&!P.dead&&P.pk)
								if(get_dist(src,P)>1)
									walk_towards(src,P)
								else
									if(get_dist(src,P)<=1)
										src.Attack2(P)
								Found = TRUE
					break
				if(Found != TRUE)
					for(var/mob/PC/P3 in oview(12))
						if(P3==src.owner)
							if(get_dist(src,P3)>2)
								walk_towards(src,P3)
						break
				sleep(2)
obj/Technique/SplitForm
	verb/Split_Form()
		set category = "Techniques"
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Split Form")
		if(techs_on==0)
			usr<<"Techniques have currently been disabled"
			return
		if(usr.splits >= 1)
			usr<<"You can't create any more than one Split Form."
			return
		if(usr.challenge)
			usr << "Can't use this in the arena"
			return
		if(!usr.pk)
			usr << "You are not a Combatant!"
			return
		if(usr.dead)
			usr << "You are dead!"
			return
		if(usr.doing)
			return
		else
			usr.doing = 1
			var/mob/Monster/Split_Form/S = new
			S.loc = usr.loc
			S.name = "[usr]'s Split Form"
			S.owner = usr
			S.icon = usr.icon
			S.overlays = usr.overlays
			S.powerlevel = usr.powerlevel / 4
			S.powerlevel_max = usr.powerlevel_max / 4
			S.strength = usr.strength / 4
			S.defence = usr.defence / 4
			S.ki = usr.ki / 4
			S.ki_max = usr.ki_max / 4
			S.speed = usr.speed
			S.level = usr.level / 4
			S.zenni = usr.level / 3
			S.critical = usr.critical / 3
			S.dodge = usr.dodge / 3
			S.counter = usr.counter / 3
			S.block = usr.block / 3
			S.karma = usr.karma
			S.exp = 0
			usr.splits += 1
			sleep(5)
			usr.doing = 0