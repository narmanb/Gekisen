mob
	var
		whisfed=0
		whisboost=0
		whisboost2=0
		gone_ssjg=0
mob/NPC/Whis
	icon = 'Whis.dmi'
	icon_state = ""
	name="Whis"
	density=1
	safe=1
	frozen = 1
	talking=0
	energy_code=5664026
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(8)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Whis - Boost")
			if(usr.level < 200000)
				usr << "<font color = white><BIG>\icon[src]</BIG> Whis:</white> When you are powerful enough I will take you to Lord Beerus's planet to train"
				return
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			if(usr.fused)
				return
			usr.talking = 1
			if(usr.z != 9)
				switch(alert("Would you like me to teleport you to Beerus's planet to train?","Go to Planet Beerus","Yes","No"))
					if("Yes")
						usr.icon_state = "IT"
						sleep(20)
						usr.icon_state = ""
						usr.talking = 0
						usr.loc = locate(317,409,9)
					if("No")
						usr.talking = 0
			else
				switch(alert("Would you like me to teleport you back to Earth?","Go to Planet Earth","Yes","No"))
					if("Yes")
						usr.icon_state = "IT"
						sleep(20)
						usr.icon_state = ""
						usr.talking = 0
						usr.loc = locate(452,42,1)
					if("No")
						usr.talking = 0


	/*		if(!usr.whisfed)
				usr << "<font color=white>Whis: </font>Greetings Earthling!"
				sleep(20)
				usr << "<font color=white>Whis: </font>I would love to chat but I am starving."
				sleep(20)
				usr << "<font color=white>Whis: </font>Maybe if you bring me some delicious Earth food I will train you."
				usr.talking=0
				return
			else*/
			return
			if(!usr.whisboost2)
				if(usr.karma == "Good" && usr.karma_rating >= 50)
					usr.talking = 1
					usr << "<font color=white>Whis: </font>Greetings Earthling!"
					sleep(20)
					usr << "<font color=white>Whis: </font>Hmmm, you could become very strong with my help."
					sleep(20)
					usr << "<font color=white>Whis: </font>Your meager understanding is what holds you back."
					sleep(20)
					usr << "<font color=white>Whis: </font>Would you like me to train you?"
					sleep(5)
					switch(alert("Train with Whis?","Can only be done ONCE","Yes","No"))
						if("Yes")
							if(usr.whisboost2)
								talking=0
								return
							usr.whisboost2=1
							usr << "<font color=white>Whis: </font>I hope you're ready..."
							usr.frozen=1
							usr.doing=1
							usr.icon_state = "meditate"
							sleep(300)
							var/plgain = usr.powerlevel_max * 0.30
							var/kigain = usr.ki_max * 0.30
							var/strgain = usr.strength_max * 0.30
							var/defgain = usr.defence_max * 0.30
							usr.powerlevel_max += plgain
							usr.ki_max += kigain
							usr.kidefense_max += 25000000
							usr.strength_max += strgain
							usr.defence_max += defgain
							usr.speed_max += 25000000
							spawn(60)
								usr << "<font color = green><b>Powerlevel + [applycommas(plgain)]<br>Ki + [applycommas(kigain)]<br>Strength + [applycommas(strgain)]<br>Defense + [applycommas(defgain)]"
							//usr.staminaleft_max += 15000+(usr.level*10)

							usr.whisboost2=1
							sleep(10)
							usr << "<font color=white>Whis: </font>Well, well."
							sleep(20)
							usr << "<font color=white>Whis: </font>Looks like our training paid off, Earthling."
							sleep(30)
							usr << "<font color=white>Whis: </font>Ok, see you around [usr]!"
							usr.frozen=0
							usr.doing=0
							usr.icon_state = ""
							usr.talking=0
						if("No")
							usr.talking=0
							return
				else
					usr << "<font color=white>Whis: </font>If you wish to live you will leave my presence, foul creature!"
					usr.talking=0
					return
			else
				usr << "<font color=white>Whis: </font>Nice day, eh?"
				usr.talking=0
				return

/*		Feed_Whis()
			set category = null
			set src in oview(8)
			if(usr.talking)
				return
			if(usr.fused)
				return
			usr.talking = 1
			if(!usr.whisfed)
				usr << "<font color=white>Whis: </font>What's this?!"
				sleep(20)
				usr << "<font color=white>Whis: </font>Glorious Earthly treats? YUM!!"
				sleep(20)
				usr.whisfed=1
				usr << "<font color=white>Whis: </font>MMMMMM.. now that I have had a delicious treat, I will train you if you wish."

				switch(alert("Train with Whis?","Can only be done ONCE","Yes","No"))
					if("Yes")
						usr << "<font color=white>Whis: </font>I hope you're ready..."
						usr.frozen=1
						usr.doing=1
						sleep(150)
						usr.powerlevel_max += round(usr.powerlevel_max*0.5)+20000000
						usr.ki_max += round(usr.ki_max*0.5)+20000000
						usr.kidefense_max += round(usr.kidefense_max*0.5)+15000000
						usr.strength_max += round(usr.strength_max*0.5)+2000000
						usr.defence_max += round(usr.defence_max*0.5)+2000000
						usr.speed_max += round(usr.speed_max*0.5)+2000000
						usr.staminaleft_max += 5000+(usr.level*25)
						usr.whisboost=1
						sleep(150)
						usr << "<font color=white>Whis: </font>Well, well."
						sleep(20)
						usr << "<font color=white>Whis: </font>Looks like our training paid off, Earthling."
						sleep(30)
						usr << "<font color=white>Whis: </font>Ok, see you around [usr]!"
						usr.frozen=0
						usr.doing=0
						usr.talking=0
					if("No")
						usr.talking=0
						usr << "<font color=white>Whis: </font>Alright, come back if you change your mind!"
						return*/
