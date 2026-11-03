mob/var/herculeboost=0
mob/NPC/Hercule
	icon = 'NPCs - New.dmi'
	icon_state = "Hercule"
	name="Hercule"
	density=1
	safe=1
	frozen = 1
	talking=0
	energy_code=5374986
	New()
		..()
		src.CreateName()
	verb
		Talk()
			set category = null
			set src in oview(8)
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Talked to Hercule-Sama")
			if(usr.talking)
				usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
				return
			if(usr.fused)
				return
			if(usr.level < 10000)
				usr << "<font color = white><BIG>\icon[src]</BIG> Hercule:</white> You are not strong enough to train with the champ!"
				return
			usr.talking = 1
			if(usr.herculeboost)
				usr << "<font color = white><BIG>\icon[src]</BIG> Hercule:</white> As a martial arts master, You can't fool me! I know you're flying around using wires and planting bombs to show off!"
				usr << "<font color = white><BIG>\icon[usr]</BIG> [usr.name]</white> (This guy is a moron...)"

				usr.talking = 0
			if(!usr.herculeboost)
				usr << "<font color = white><BIG>\icon[src]</BIG> Hercule:</white> As the World Champion, I can teach you some of what I know."
				sleep(20)
				switch(alert("Train with Hercule?","Can only be done ONCE","Yes","No"))
					if("Yes")
						if(usr.herculeboost)
							usr.talking=0
							return
						usr.herculeboost=1
						usr << "<font color=white>Hercule: </font>Let's. train together."
						usr.frozen=1
						usr.doing=1
						sleep(150)
						var/statbonuses = (usr.rebirths + 1) * usr.moden
						statbonuses *= rand(19,20)
						statbonuses += rand(1000,1500)
						usr.powerlevel_max += 150000
						usr.ki_max += 150000
						usr.kidefense_max += 150000
						usr.strength_max += 150000
						usr.defence_max += 150000
						usr.speed_max += 150000
						usr.powerlevel_bonus += statbonuses
						usr.ki_bonus += statbonuses
						usr.strength_bonus += statbonuses
						usr.defence_bonus += statbonuses


						usr << "<font color = green><b>Your stat bonuses increase by [applycommas(statbonuses)]!"

						//usr.staminaleft_max += 5000+(usr.level*5)
						sleep(150)
						usr << "<font color=white>Hercule: </font>Great."
						sleep(20)
						usr << "<font color=white>Hercule: </font>Looks like our training paid off!"
						sleep(30)
						usr << "<font color=white>Hercule: </font>Ok, see you around [usr]!"
						usr.frozen=0
						usr.doing=0
						usr.talking = 0
					if("No")
						usr << "<font color=white>Hercule: </font>Come back when you want to train with the great Hercule!"
						usr.talking = 0
						return
					//	goto p
		//	p
/*			switch(alert("Hi [usr.name]. How can I help you?","","Use Skill Points","Nothing"))
				if("Use Skill Points")
					if(!usr.skill_points)
						usr << "<font color = white>Hercule:</font> You don't have any SPs!"
						usr.talking = 0
						return
					switch(input("Where do you wish to use ur SPs?","SPs")in list("Melee","Block","Dodge","Counter","Critical","Durability","Ki Control","Ki Cast","Ki Power","Ki Use","Ki Resistance","Deflect","Weapon","Weapon Power","Weapon Resistance"))

						if("Melee")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.melee_max < 100)
								usr.melee_max += TP
								usr.melee += TP
								usr << "<font color = white>Hercule:</font> Melee +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.melee_max > 100)
									usr.melee_max = 100
								if(usr.melee > 100)
									usr.melee = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Block")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.block_max < 100)
								usr.block_max += TP
								usr.block += TP
								usr << "<font color = white>Hercule:</font> Block +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.block_max > 100)
									usr.block_max = 100
								if(usr.block > 100)
									usr.block = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Dodge")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.dodge_max < 100)
								usr.dodge_max += TP
								usr.dodge += TP
								usr << "<font color = white>Hercule:</font> Dogde +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.dodge_max > 100)
									usr.dodge_max = 100
								if(usr.dodge > 100)
									usr.dodge = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Counter")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.counter_max < 100)
								usr.counter_max += TP
								usr.counter += TP
								usr << "<font color = white>Hercule:</font> Counter +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.counter_max > 100)
									usr.counter_max = 100
								if(usr.counter > 100)
									usr.counter = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Critical")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.critical_max < 100)
								usr.critical_max += TP
								usr.critical += TP
								usr << "<font color = white>Hercule:</font> Critical +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.critical_max > 100)
									usr.critical_max = 100
								if(usr.critical > 100)
									usr.critical = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Durability")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.durability_max < 100)
								usr.durability_max += TP
								usr.durability += TP
								usr << "<font color = white>Hercule:</font> Durability +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.durability_max > 100)
									usr.durability_max = 100
								if(usr.durability > 100)
									usr.durability = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Ki Control")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.ki_control_max < 100)
								usr.ki_control_max += TP
								usr.ki_control += TP
								usr << "<font color = white>Hercule:</font> Ki Control +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.ki_control_max > 100)
									usr.ki_control_max = 100
								if(usr.ki_control > 100)
									usr.ki_control = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Ki Cast")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.ki_cast_max < 100)
								usr.ki_cast_max += TP
								usr.ki_cast += TP
								usr << "<font color = white>Hercule:</font> Ki Cast +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.ki_cast_max > 100)
									usr.ki_cast_max = 100
								if(usr.ki_cast > 100)
									usr.ki_cast = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Ki Power")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.ki_power_max < 100)
								usr.ki_power_max += TP
								usr.ki_power += TP
								usr << "<font color = white>Hercule:</font> Ki Power +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.ki_power_max > 100)
									usr.ki_power_max = 100
								if(usr.ki_power > 100)
									usr.ki_power = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Ki Use")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.ki_use_max < 100)
								usr.ki_use_max += TP
								usr.ki_use += TP
								usr << "<font color = white>Hercule:</font> Ki Use +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.ki_use_max > 100)
									usr.ki_use_max = 100
								if(usr.ki_use > 100)
									usr.ki_use = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Ki Resistance")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.ki_res_max < 100)
								usr.ki_res_max += TP
								usr.ki_res += TP
								usr << "<font color = white>Hercule:</font> Ki Resistance +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.ki_res_max > 100)
									usr.ki_res_max = 100
								if(usr.ki_res > 100)
									usr.ki_res = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Deflect")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.reflect_max < 100)
								usr.reflect_max += TP
								usr.reflect += TP
								usr << "<font color = white>Hercule:</font> Deflect +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.reflect_max > 100)
									usr.reflect_max = 100
								if(usr.reflect > 100)
									usr.reflect = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Weapon")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.weapon_max < 100)
								usr.weapon_max += TP
								usr.weapon += TP
								usr << "<font color = white>Hercule:</font> Weapon +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.weapon_max > 100)
									usr.weapon_max = 100
								if(usr.weapon > 100)
									usr.weapon = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Weapon Power")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.weapon_power_max < 100)
								usr.weapon_power_max += TP
								usr.weapon_power += TP
								usr << "<font color = white>Hercule:</font> Weapon Power +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.weapon_power_max > 100)
									usr.weapon_power_max = 100
								if(usr.weapon_power > 100)
									usr.weapon_power = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

						if("Weapon Resistance")
							var/TP = input ("How many SPs do u wish to use?") as num
							if(TP > usr.skill_points)
								usr << "<font color = white>Hercule:</font> You don't have that many SPs!"
								usr.talking = 0
								return
							if(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							while(TP == 0 || TP == null || !TP)
								usr.talking = 0
								return
							if(TP < 0)
								usr << "<font color = white>Hercule:</font> You must enter a positive number!"
								usr.talking = 0
								return
							if(usr.weapon_resistance_max < 100)
								usr.weapon_resistance_max += TP
								usr.weapon_resistance += TP
								usr << "<font color = white>Hercule:</font> Weapon Resistance +[TP]%!"
								usr.skill_points -= TP
								usr.talking = 0
								if(usr.weapon_resistance_max > 100)
									usr.weapon_resistance_max = 100
								if(usr.weapon_resistance > 100)
									usr.weapon_resistance = 100
								return
							else
								usr << "<font color = white>Hercule:</font> Already 100%!"
								usr.talking = 0
								return

				else
					usr.talking = 0
					return*/
		Set_Spawn_Point()
			set src in oview(1)
			set category=null
			switch(alert("Set spawn point here?","Spawn Point","Yes","No"))
				if("Yes")
					usr.spawn_point = "Hercule"
				else
					return