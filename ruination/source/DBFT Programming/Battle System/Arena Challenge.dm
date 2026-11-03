
mob/var/arenatxt=1
mob/PC/verb/Arena_Challenge()
	set category = "Channels"
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Arena Challenge")
	/*if(usr.opendialog==1)
		usr<<"You currently have a dialog open, please finish it before continuing"
		return
	usr.opendialog=1*/
	var/list/Rivals=new/list()
	for(var/mob/PC/N in player)
		if(N==usr)continue
		if(N.dead)continue
		if(N.z==8)continue
		if(N.grav)continue
		if(N.FuseFollower)continue
		if(!N.challenge_on)continue
		if(!N.pk)continue
		Rivals.Add(N)
	Rivals.Add("Cancel")
	var/mob/M=input("Challenge who?")in Rivals
	if(arena_on)
		usr<<"The arena is currently being used."
		usr.opendialog=1
		return
	if(M=="Cancel")
		usr.opendialog=1
		return
	if(!M)
		usr.opendialog=1
		return
	if(M == usr)
		usr << "You cannot challenge yourself."
		usr.opendialog=1
		return
	if(usr.dead)
		usr << "You are dead."
		usr.opendialog=1
		return
	if(M.FuseFollower)
		usr.opendialog=1
		return
	if(usr.FuseFollower)
		usr.opendialog=1
		return
	if(!M.challenge_on)
		usr << "[M] does not want to be challenged."
		usr.opendialog=1
		return
	if(M.dead)
		usr << "[M] is dead"
		usr.opendialog=1
		return
	if(usr.grav > 0)
		usr.opendialog=1
		return
	if(M.grav > 0)
		usr.opendialog=1
		return
	if(!M.pk)
		usr << "[M] is not a Combatant."
		usr.opendialog=1
		return
	if(!usr.pk)
		usr << "You are not a Combatant."
		usr.opendialog=1
		return
	var/dbsinv = 0
	for(var/obj/O in src)
		if(O.dball)
			dbsinv++
	if(dbsinv>0)
		usr<<"<font color=white>You cannot enter a tournament while holding the dragonballs"
		return
	var/dbsinv2 = 0
	for(var/obj/O in M)
		if(O.dball)
			dbsinv2++
	if(dbsinv2>0)
		usr<<"<font color=white>[M] cannot be challenged while they are holding the dragonballs"
		return
	if(istype(M,/mob/PC))
		arena_on=1
		usr.challenge = 1
		M.challenge = 1
		for(var/mob/X in player)
			if(X.arenatxt)
				X << "\red Arena Info: \white [usr] has challenged [M] for an Arena Battle!"
		var/obj/Challenges/C=new
		C.C1=src
		C.C2=M
		C.ChallengeMob(M,src)
		usr.opendialog=1
	else
		usr << "You can't challenge NPCs."
		arena_on=0
		usr.opendialog=1
		return

obj
	Challenges
		var/time=15
		var/mob/C1
		var/mob/C2
		New()
			..()
			spawn while(1)
				time-=1
				if(time<=0)
					if(C1)
						C1.challenge=0
						C1.challenger=""
					if(C2)
						C2.challenge=0
						C2.challenger=""
					arena_on=0
					for(var/mob/M in player)
						if(M.arenatxt)
							M << "<font color=red>Server: \white [C2] didn't reply to [C1]'s Challenge!"
					del(src)
				sleep(10)
		proc
			ChallengeMob(mob/A,mob/B)
				switch(alert(A,"Do you accept [B]'s Challenge? You have 15 seconds to reply.","Arena Challenge","Accept","Decline"))
					if("Accept")
						if(A.dead)
							A<<"You are dead."
							A.challenge=0
							A.challenger=""
							arena_on=0
							del(src)
						if(B.dead)
							A<<"[B] is dead."
							B.challenge=0
							B.challenger=""
							arena_on=0
							del(src)
						if(!B)
							A.challenge=0
							A.challenger=""
							arena_on=0
							del(src)
						for(var/mob/M in player)
							if(M.arenatxt)
								M << "<font color=red>Server: \white [A] has \green <u>Accepted</u> \white [B]'s Challenge!"
//						B.loc=locate(316,20,1)

//						A.loc=locate(342,20,1)
 						B.loc=locate(281,289,5)
						A.loc=locate(312,289,5)
						B.dir=EAST
						A.dir=WEST
						A.safe=0
						B.safe=0
						A.grav=0
						B.grav=0
						B.challenger=A
						A.challenger=B
						B.in_herculegym = 0
						B.in_hbtc = 0
						A.in_herculegym = 0
						A.in_hbtc = 0
						del(src)
					if("Decline")
						arena_on=0
						A.challenge = 0
						A.challenger = ""
						if(B)
							for(var/mob/M in player)
								if(M.arenatxt)
									M << "<font color=red>Server: \white [A] has \red <u>Declined</u> \white [B]'s Challenge!"
							B.challenger = ""
							B.challenge = 0
						del(src)