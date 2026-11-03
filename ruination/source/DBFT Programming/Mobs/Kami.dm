mob/var/resets = 0
mob/NPC/Kami
	icon = 'NPCs - New.dmi'
	icon_state = "Kami"
	name = "Kami"
	density = 1
	safe = 1
	frozen = 1
	energy_code = 6574568
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Kami")
		switch(alert("Would you like to reset your kills to 0? (Adds a 1 to training mode)","Kill Reset", "Yes", "No"))
			if("Yes")
				if(usr.kills<0)
					usr.name = "Cheater?!"
					world << "[usr] tried to abuse kami =("
					usr.dead = 1
					usr.frozen = 1
					return
				if(usr.resets==0||usr.resets==""||usr.resets==null)
					if(usr.kills>=20000)
						usr.kills -= 20000
						usr.rank = "Newbie"
						usr.moden+=1
						usr.resets++
						usr<<"You have reset your kills, +1 has been added to your training mode"
						//usr << "<font size = 1><b><font color = red>Your body can now withstand more gravity training"

						/*
						usr.gravmaxplgain += 2000000000
						usr.gravmaxkigain += 2000000000
						usr.gravmaxkidefgain += 200000000
						usr.gravmaxstrgain += 2000000000
						usr.gravmaxdefgain += 200000000
						*/
						return
					else
						usr<<"You need 20k kills"
						return
				if(usr.resets==1)
					if(usr.kills>=25000)
						//usr.kills = 0
						usr.kills -= 25000
						usr.moden+=1
						usr.rank = "Newbie"
						usr.resets++
						usr<<"You have reset your kills, +1 has been added to your training mode"
						//usr << "<font size = 1><b><font color = red>Your body can now withstand more gravity training"
						/*
						usr.gravmaxplgain += 2000000000
						usr.gravmaxkigain += 2000000000
						usr.gravmaxkidefgain += 200000000
						usr.gravmaxstrgain += 2000000000
						usr.gravmaxdefgain += 200000000
						sleep(5)
						usr.gravmaxplgain += 2000000000
						usr.gravmaxkigain += 2000000000
						usr.gravmaxkidefgain += 200000000
						usr.gravmaxstrgain += 2000000000
						usr.gravmaxdefgain += 200000000
						*/
						return
					else
						usr<<"You need 25k kills"
						return
				if(usr.resets>=2)
					if(usr.kills>=30000)
						//usr.kills = 0
						usr.kills -= 30000
						usr.moden+=1
						usr.rank = "Newbie"
						usr.resets++
						usr<<"You have reset your kills, +1 has been added to your training mode"

					//	if(usr.resets==2||usr.resets==3)
							//usr << "<font size = 1><b><font color = red>Your body can now withstand more gravity training"
							/*
							usr.gravmaxplgain += 2000000000
							usr.gravmaxkigain += 2000000000
							usr.gravmaxkidefgain += 200000000
							usr.gravmaxstrgain += 2000000000
							usr.gravmaxdefgain += 200000000
							sleep(5)
							usr.gravmaxplgain += 2000000000
							usr.gravmaxkigain += 2000000000
							usr.gravmaxkidefgain += 200000000
							usr.gravmaxstrgain += 2000000000
							usr.gravmaxdefgain += 200000000
							*/



//						if(usr.resets>3 && usr.resets <= 6)
							/*
							usr << "<font size = 1><b><font color = red>Your body can now withstand more gravity training"
							usr.gravmaxplgain += 2000000000
							usr.gravmaxkigain += 2000000000
							usr.gravmaxkidefgain += 200000000
							usr.gravmaxstrgain += 2000000000
							usr.gravmaxdefgain += 200000000

							sleep(3)
							usr.gravmaxplgain += 2000000000
							usr.gravmaxkigain += 2000000000
							usr.gravmaxkidefgain += 200000000
							usr.gravmaxstrgain += 2000000000
							usr.gravmaxdefgain += 200000000

							sleep(3)
							usr.gravmaxplgain += 2000000000
							usr.gravmaxkigain += 2000000000
							usr.gravmaxkidefgain += 200000000
							usr.gravmaxstrgain += 2000000000
							usr.gravmaxdefgain += 200000000
							*/



						return
					else
						usr<<"You need 30k kills"
