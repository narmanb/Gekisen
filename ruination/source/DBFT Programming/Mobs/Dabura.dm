mob/NPC/

	Dabura
		name = "Dabura"
		icon = 'NPCs - New.dmi'
		icon_state = "Dabura"
		density = 1
		safe = 1
		frozen = 1
		energy_code = 2234155
		New()
			..()
			src.CreateName()
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Dabura")
			if(!usr)return
			if(usr.level >= 10 && usr.dead)
				usr << "<font color = white>Dabura:</font> Go back to Snake Way..."
				usr.loc = locate(413,371,7)
				/*if(usr.karma=="Evil"&&usr.karma_rating>=30)
					if(!usr.learn_deathball)
						if(usr.level >= 40000)
							usr.learn_deathball=1
							usr.contents+=new/obj/Technique/DeathBall
							usr << "<font color = white>Dabura:</font> Here's a little something to help with with those that oppose you."
							return*/
			if(usr.level < 10 && !usr.dead)
				usr << "<font color = white>Dabura:</font> Your not even strong enough to go back to Snake Way...Train some more..."
				return
