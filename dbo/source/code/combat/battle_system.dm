mob/var/altatt = 0
mob
	Move()
		if(src.move==0)
			return 0
		return ..()

	proc
		TakeDamage(mob/attacker)
			src.move = 1
			if(istype(src, /mob/other))
				return
			else
				attacker.random = rand(1,5)
				if(src.powerlevel.value >= 1)
					if(attacker.random==1)
						if(attacker.altatt == 1)
							view(1, src) << 'sounds/punchhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = (attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100))
									if(dmg <=0)
										dmg=0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = (attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/armpro = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									if(armpro <= 0)
										src.powerlevel.value -= 0
										src.powerlevel.value = round(src.powerlevel.value)
										src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
										if(src.mon )
											if(src.powerlevel.value <=0)
												if(src.expkn == null && src.expkk == null)
													src.expkn = "[attacker.name]"
													src.expkk = "[attacker.key]"
										src.Die(attacker)
									else
										src.powerlevel.value -= armpro
										src.powerlevel.value = round(src.powerlevel.value)
										if(src.mon )
											if(src.powerlevel.value <=0)
												if(src.expkn == null && src.expkk == null)
													src.expkn = "[attacker.name]"
													src.expkk = "[attacker.key]"
										src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
										src.Die(attacker)

							src.meleehit()
						else
							view(1, src) << 'sounds/punchhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = (attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = (attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									if(dmg <= 0)
										dmg = 0
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
							src.meleehit()
					if(attacker.random == 2)
						if(attacker.altatt )
							view(1, src) << 'sounds/kickhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg=max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg =max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg=max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									src.Die(attacker)
							src.meleehit()
						else
							attacker << 'sounds/kickhit.wav'
							src << 'sounds/kickhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									src.Die(attacker)
							src.meleehit()
					if(attacker.random == 3)
						view(1, src) << 'sounds/punchmiss.wav'
					if(attacker.random == 4)
						if(attacker.altatt )
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg=max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
							src.meleehit()
						else
							view(1, src) << 'sounds/kickhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg=max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
							src.meleehit()
					if(attacker.random == 5)
						if(attacker.altatt )
							view(1, src) << 'sounds/punchhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg=max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
							src.meleehit()
						else
							view(1, src) << 'sounds/punchhit.wav'
							if(src.blocking)
								var/blkrem = rand(1,4)
								if(blkrem == 4)
									view(1, src) << "<font color = red><i>[attacker] throws [src] offguard!"
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src.blocking = 0
									src.icon_state = ""
									src.move = 1
									src.client.show_verb_panel = 1
									src.hideipan = 0
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * ((rand(5,10) - 0.75) / 100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									flick("sparblockhit",src)
									src.Die(attacker)
							else
								if(src.armored==0)
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10)/100)))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
								else
									var/dmg = max(1,(attacker.powerlevel.value * (rand(5,10) - src.armordmg * (rand(0.05,0.15)))))
									src.powerlevel.value -= dmg
									src.powerlevel.value = round(src.powerlevel.value)
									src << "<FONT COLOR = RED>Your armor protects you slightly from [attacker]'s blow!"
									if(src.mon )
										if(src.powerlevel.value <=0)
											if(src.expkn == null && src.expkk == null)
												src.expkn = "[attacker.name]"
												src.expkk = "[attacker.key]"
									src.Die(attacker)
							src.meleehit()

		FlightLearn()
			if(powerlevel.max_value >= 100 && kikn)
				if(flightlearn == 0)
					flightlearn = 1
					skills += new /obj/techs/bukujutsu
					skills += new /obj/techs/swoop
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Bukujustu (Fly)</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Swoop</U>!"

		KiTechLearn()
			if(powerlevel.max_value >= 600 && ki_imp)
				if(kitechlearn == 0)
					kitechlearn = 1
					ki.max_value += 500
					skills += new /obj/techs/kblast
					skills += new /obj/techs/KiBeam
					skills += new /obj/techs/zanzoken
					src << "<FONT COLOR = BLUE><B>You can now use your Ki!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Ki Blast</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Ki Beam</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Zanzoken</U>!"

		AuraTechLearn()
			if(powerlevel.max_value >= 1100 && kicntrl)
				if(auratechlearn == 0)
					auratechlearn = 1
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Power Up</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Power Down</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Sense</U>!"
					skills += new /obj/techs/auraup
					skills += new /obj/techs/auradn
					skills += new /obj/techs/sense
					ki.max_value += 500
		AuraMake()
			if(powerlevel.max_value >= 1600 && auratechlearn)
				if(aura == 0||aura == null)
					alert(src, "You can now customize your AURA color!")
					underlays -= /obj/whiteaura
					aura = 1
					customauracolor = F_Color_Selector.Get_Color()
					contents += new /obj/playeraura

		techcheck()
			set background = 1
			spawn()
				while(tech && (powerlevel.value < powerlevel.max_value))
					src.powerlevel.value += powerlevel.max_value * 0.00025
					sleep(15)
					if(powerlevel.value >= powerlevel.max_value)
						if(state == "Normal")
							powerlevel.value = src.powerlevel.max_value
							src << "<B>You turn OFF your Technical Workings."
							view(4) << sound('sounds/blank.wav',0)
							tech = 0

		regencheck()
			set background = 1
			spawn()
				while(regen && (powerlevel.value < powerlevel.max_value))
					powerlevel.value += powerlevel.max_value * 0.001
					sleep(15)
					if(powerlevel.value >= powerlevel.max_value)
						if(state == "Normal")
							powerlevel.value = powerlevel.max_value
							src << "<B>You begin to feel that you have stopped healing."
							view(4) << sound('sounds/blank.wav',0)
							regen = 0

		Levelup()
			if(skexp >= maxskexp)
				if (skexp >= maxskexp*2.1)
					bonuspoint = 0
					while (skexp>=maxskexp)
						bonuspoint++
						skexp -= maxskexp
					skpts += bonuspoint
					src << "<font color = red><b><i><u>You gained [bonuspoint] skill points!</u></font>"
				else
					skpts += 1
					skexp = skexp-maxskexp
					src << "<font color = red><b><i><u>You gained a skill point!</u></font>"
				if(skexp<0)
					skexp=0

		FocusLearn()
			if(powerlevel.max_value >= 1600 && kicntrl)
				if(focustechlearn == 0)
					focustech = "Aquired"
					focustechlearn = 1
					focused = 0
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Focus</U>!"
					src << "<FONT COLOR = BLUE><B>You have learned the ablity, <U>Enrage</U>!"
					skills += new /obj/techs/focus
					skills += new /obj/techs/enrage

		Dead(mob/killer)

		Die(mob/killedBy)
			set background = 1
			if(!istype(killedBy)) killedBy = null
			spawn()
				if(client)
					client.SaveMob()
				if(deadchecking) return
				deadchecking = 1
				if(istype(src, /monster) && powerlevel.value <= 0)
					Dead(killedBy)
				else
					if(src.powerlevel.value <= 0)
						src.powerlevel.value = 0
						if(src.immortal)
							if(src.grav >= 1)
								src << "<FONT COLOR = RED><B>You suddenly feel like your going to die from the gravity, but immortality prevents you from death! But the force of the gravity was so strong that you returned to your hometown"
								src.move = 0
								src.move = 1
								src.grav = 0
								src.GravID = 0
								src.powerlevel.value = src.powerlevel.max_value * 0.05
								src.loc = locate(hx, hy, hz)

							else if(src.z == 14||src.z == 15||src.z == 18)
								src << "<FONT COLOR = RED><B>You suddenly feel like your going to die from the gravity, but immortality prevents you from death! But the force of the gravity on the planet was so strong that you returned to your hometown!"
								src.move = 0
								src.move = 1
								src.powerlevel.value = src.powerlevel.max_value * 0.05
								src.loc = locate(hx, hy, hz)
							else
								src << "<FONT COLOR = RED><B>You suddenly feel like your going to die, but immortality prevents you from death!"
								src.move = 0
								src.move = 1
								src.powerlevel.value = src.powerlevel.max_value * 0.05
						if(src.strain == 2)
							if(killedBy && killedBy.race == "Pikkon")
								src.strain = 1
								for(var/monster/Pikkon/N in world)
									del(N)
									..()
								..()
							else
								src.strain = 1
								..()
						else
							if(client)
								if(src.grav > 0)
									src.grav = 0
									src.GravID = 0
								if(src.itinvis != 0)
									src.itinvis = 0
								if(src.npc == 0||src.npc == null)
									for(var/mob/characters/M in oview(6))
										spawn(1)
											if(M.befriend == src.name)
												if(!M.angered && !M.dead)
													view(10) << "<FONT COLOR = RED>[M.name]:</FONT> THATS ENOUGH!!!!!!!!!!!!"
													view(10) << "<i><b><font color = red>[M.name] explodes in anger as he sees his best friend die!"
													M.angered = 1
													M.SSJ()
													if(!M) return
													M.FB()
													if(!M) return
													M << "<font color = red><font size = 5>Hate <font color = blue>fills your soul as you see your best friend, [src.name], die infront of you."
													sleep(600)
													M.angered = 0
													M.befriend = ""
													befriend = ""
													if(M.powerlevel.value > M.powerlevel.max_value)
														M.powerlevel.value = M.powerlevel.max_value
											else
												if(!M.angered)
													if(M.ap >= -25 || ap > 25 && M.ap > 25 || ap < -25 && M.ap < -25 || ap <= 25 && ap >= -25 && M.ap <= 25 && M.ap >= -25)
														if(src != M && M != killedBy && !M.dead)
															view(6) << "<b><font color = blue>[M.name]: aaaAAAHHHHH!!!!!!!!!!"
															view(6) << "<i><b><font color = red>[M.name] explodes in anger as a huge white aura surrounds him!"
															view(6) << 'sounds/aura.wav'
															M.anger += 1
															if(M.anger > 10)
																M.anger = 10
															M.powerlevel.value *= 1.05
															M.underlays += new /obj/MysticAuraTop
															M.underlays += new /obj/MysticAuraBottom
															M.angered = 1
															M.SSJ()
															if(!M) return
															M.FB()
															if(!M) return
															M << "<font color = red>Hate <font color = blue>fills your soul as you see [ap>25?"Good":ap<-25?"Evil":"Neutral"] [src.name] die infront of you."
															sleep(100)
															M.underlays -= /obj/MysticAuraTop
															M.underlays -= /obj/MysticAuraBottom
															M.angered = 0
															if(M.powerlevel.value > M.powerlevel.max_value)
																M.powerlevel.value = M.powerlevel.max_value
									if(race == "Android (Mechanical)")
										loc=locate(0,0,0)
										move = 1
										frozen = 1
										attacking = 1
										dead = 1
										client.show_verb_panel = 0
										hideipan = 1
										deaths += 1
										grav = 0
										GravID = 0
										ccuse = 0
										itinvis = 1
										src << "<FONT COLOR = RED><B>You get blown to pieces!"
										src << "<FONT COLOR = RED>You have been brought to Dr. Gero's lab and you begin to get rebuilt!"
										sleep(rand(225,600))
										powerlevel.restore()
										ki.restore()
										loc=locate(60,111,3)
										move = 1
										dead = 0
										itinvis = 0
										frozen = 0
										attacking = 0
										client.show_verb_panel = 1
										hideipan = 0
										if(throwed )
											throwed = 0
											throwedb = null
									else if(race == "Android (Biological)" && !dead && prob(10))
										var/oloc = src.loc
										loc=locate(0,0,0)
										move = 1
										frozen = 1
										attacking = 1
										client.show_verb_panel = 0
										dead = 1
										hideipan = 1
										deaths += 1
										grav = 0
										GravID = 0
										if(throwed )
											throwed = 0
											throwedb = null
										src << "<FONT COLOR = RED><B>Your cells begin to contract & regenerate!"
										sleep(rand(200,475))
										powerlevel.restore()
										ki.restore()
										loc = oloc
										move = 1
										dead = 0
										frozen = 0
										attacking = 0
										client.show_verb_panel = 1
										hideipan = 0
										src << "<FONT COLOR = RED><B>Your cells have become fully regenerated!"
									else
										if(dead)
											if(newb)
												if(z == 3)
													if(!splitformed && killedBy && killedBy.master != name)
														src << "<FONT COLOR = RED><B>You suddenly feel like your going to die, but you're already dead and on King Kai's planet!"
														src.move = 0
														src.move = 1
														src.powerlevel.value = src.powerlevel.max_value * 0.05
														for(var/mob/S in view(5))
															if(killedBy == S)
																if(S.race == "Splitform2")
																	del(S)
														return
													else
														src << "Your splitform had absorbed most of your strength thus killing you on King Kai's Planet"
														del(killedBy)
												if(src.z == 20)
													if(src.splitformed != 1 && killedBy && killedBy.master != src.name)
														src << "<FONT COLOR = RED><B>You suddenly feel like your going to die, but you're a new player!"
														src.move = 0
														src.move = 1
														src.powerlevel.value = src.powerlevel.max_value * 0.05
														for(var/mob/S in view(5))
															if(killedBy == S)
																if(S.race == "Splitform2")
																	del(S)
														return
												else
													//src.kkp = 0
													src.Die()
											if(src.ccuse )
												if(src.z == 3)
													if(src.grav >= 1)
														src.ccuse = 0
														src.grav = 0
														src.GravID = 0
														src.Die()
													else
														src << "<FONT COLOR = RED><B>You suddenly feel like your going to die, but you're protected from death somehow!"
														src.move = 0
														src.move = 1
														src.powerlevel.value = src.powerlevel.max_value * 0.05
														return
												else
													src.ccuse = 0
													src.grav = 0
													src.GravID = 0
													src.Die()
											else
												var/zen
												var/zen1
												if(src.gm == 0 || src.enf == 0)
													var/obj/zennibag/O=new/obj/zennibag(src.loc)
													var/zenamt=(src.zenni*0.10)
													zen1=(zenamt/rand(2,10))
													zen1=round(zen1)
													zen = src.zenni - zen1
													if(zen<=0)
														zen=0
													O.zenni=zen
													src.zenni-=zen
													if(O.zenni <= 0)
														del(O)
													spawn(1200)
														del(O)
												for(var/obj/dragonball/A in src.contents)
													A.loc=(locate(src.x,src.y,src.z))
													range(6)<<"[src] drops <B>[A]."
												for(var/obj/ndragonball/N in src.contents)
													N.loc=(locate(src.x,src.y,src.z))
													range(6)<<"[src] drops <B>[N]."
												if(src.gm == 0 || src.enf == 0)
													range(6)<<"[src] drops <b>[num2text(zen,100)] zenni."
												view(6) << 'sounds/death.wav'
												src << "<B><FONT COLOR = RED>You have died again!"
												src.icon_state = ""
												src.dead = 1
												src.ko = 0
												src.newb = 0
												src.loc=locate(52,10,3)
												src.grav = 0
												src.GravID = 0
												src.density = 1
												src.move = 1
												src.deaths += 1
												if(src.throwed )
													src.throwed = 0
													src.throwedb = null
												src.powerlevel.value = src.powerlevel.max_value
												src.ki.value = src.ki.max_value
												if(killedBy && (src.name != killedBy.name))
													if(src.ap >= 0)
														killedBy.ap -= 10
													else
														killedBy.ap += 10
										if(src.dead == 0)
											if(killedBy && (src.name == killedBy.name))
												view(6) << 'sounds/death.wav'
												view(6) << "<font color = red><i>[src] dies right infront of you!"
												if(killedBy)
													world << "<B><FONT COLOR = GREEN>Info:</B> <FONT COLOR = RED>[src] has been slain by [killedBy]."
													killedBy.move = 1
												else
													world << "<B><FONT COLOR = GREEN>Info:</B> <FONT COLOR = RED>[src] has died!"
											else
												view(6) << 'sounds/death.wav'
												view(6) << "<font color = red><i>[src] dies right infront of you!"
												if(killedBy)
													world << "<B><FONT COLOR = GREEN>Info:</B> <FONT COLOR = RED>[src] has been slain by [killedBy]."
													killedBy.move = 1
												else
													world << "<B><FONT COLOR = GREEN>Info:</B> <FONT COLOR = RED>[src] has died!"
											var/zen
											var/zen1
											if(src.gm == 0 || src.enf == 0)
												var/obj/zennibag/O=new/obj/zennibag(src.loc)
												var/zenamt=(src.zenni*0.025)
												zen1=(zenamt/rand(2,10))
												zen1=round(zen1)
												zen = src.zenni - zen1
												if(zen<=0)
													zen=0
												O.zenni=zen
												src.zenni-=zen
												if(O.zenni <= 0)
													del(O)
												spawn(1200)
													del(O)
											for(var/obj/dragonball/A in src.contents)
												A.loc=(locate(src.x,src.y,src.z))
												range(6)<<"[src] drops <B>[A]."
											for(var/obj/ndragonball/N in src.contents)
												N.loc=(locate(src.x,src.y,src.z))
												range(6)<<"[src] drops <B>[N]."
											if(src.gm == 0 || src.enf == 0)
												range(6)<<"[src] drops <b>[num2text(zen,100)] zenni."
											src.loc=locate(52,10,3)
											src.powerlevel.value = src.powerlevel.max_value
											src.ki.value = src.ki.max_value
											src.icon_state = ""
											src.dead = 1
											src.overlays += 'icons/halo.dmi'
											src.grav = 0
											src.GravID = 0
											src.density = 1
											src.ko = 0
											src.move = 1
											src.deaths += 1
											if(src.throwed )
												src.throwed = 0
												src.throwedb = null
											if(killedBy)
												if(src.ap < -25)
													killedBy.ap += 10
												else
													killedBy.ap -= 10
									var/F = file("kill.log")
									if(killedBy)
										F << "[time2text(world.realtime,"MMM DD hh:mm:ss")]: [src] killed by [killedBy]."
									else
										F << "[time2text(world.realtime,"MMM DD hh:mm:ss")]: [src] died."
				deadchecking = 0

		KO(mob/KOdby)
			if(src.powerlevel.value <= 0 && !src.deadchecking)
				if(istype(src, /monster) && powerlevel.value <= 0)
					deadchecking = 1
					Dead(KOdby)
					deadchecking = 0
					return
				if(src.deathtrans != 1 || (src.deathtrans  && src.client))
					src.powerlevel.value = 0
				view(6) << "<b>[src] is knocked out!!</b>"
				if(!ap < -25 && !dead && prob(5))
					src << "<B><FONT COLOR = RED>You get angered by your weakness."
					src.anger += 1
					if(src.anger > 10)
						src.anger = 10
				if(src.state != "Normal" && usr.state != "Perfect Form (Weighted)" && usr.state != "Super Perfect Form" && !istype(src, /monster))
					src.underlays -= /obj/MysticAuraBottom
					src.underlays -= /obj/MysticAuraTop
					src.underlays -= /obj/SSAuraBottom
					src.overlays -= /obj/SSAuraTop
					src.overlays -= /obj/kkauratop
					src.underlays -= /obj/kkaurabottom
					if(src.powerlevel.value > src.powerlevel.max_value)
						src.powerlevel.restore()
					if(src.ki.value > src.ki.max_value)
						src.ki.restore()
					view(6) << 'sounds/revert.wav'
					src << "You revert back to your normal state by being knocked out"
					src.state = "Normal"
				else if(usr.state == "Perfect Form (Weighted)" || usr.state == "Super Perfect Form")
					if(src.powerlevel.value > src.powerlevel.max_value)
						src.powerlevel.value = src.powerlevel.max_value
					if(src.ki.value > src.ki.max_value)
						src.ki.value = src.ki.max_value
					usr.overlays -= 'icons/cell aura.dmi'
					view(6) << 'sounds/revert.wav'
					src << "You revert back to your normal state by being knocked out"
					src.state = "Perfect Form"
				src.icon_state = ""
				src.ko = 1
				src.move = 0
				src.grav = 0
				src.GravID = 0
				sleep(100)
				src.ko = 0
				src.move = 1
				if(src.powerlevel.value <= 0 && !transforming)
					src.powerlevel.value = 5
				src.random = rand(1,3)
				if(src.random == 3)
					src.powerlevel.max_value += rand(1,2)
				if(src.random == 2)
					src.powerlevel.max_value += rand(0,1)


		FB()
			if(src.gonessj == 0)
				if(src.race == "Buu")
					if(src.powerlevel.max_value >= 320000 && src.ki.max_value >= 225000)
						src.move = 0
						src.frozen = 1
						src.attacking = 1
						src.client.show_verb_panel = 0
						src.hideipan = 1
						src.gonessj = 1
						src << "<b>Steam begins to spurt from your body."
						oview(10) << "<b>Steam begins to spurt from [src]'s body."
						sleep(25)
						src.random = rand(1,2)
						if(src.random == 1)
							src << "<b>You calm down, and return to your normal state."
							src.icon_state = ""
							src.gonessj = 0
							src.move = 1
							src.frozen = 0
							src.attacking = 0
							src.client.show_verb_panel = 1
							src.hideipan = 0
						else
							src << "<b>You begin to transform & change!"
							oview(10) << "<b>[src] begins to transform & change!"
							view(10) << 'sounds/buu_trans.wav'
							flick("kidtofat",src)
							src.icon = 'icons/Fat Buu.dmi'
							sleep(125)
							src << "<B>You have learned, 'Buu Forms'!"
							src.icon = 'icons/buu.dmi'
							src.contents += new /obj/transes/buutransform
							if(!frbf)
								if(!fused)
									frbf = "Name: [name], Key: [key], Month: [getMonth(src)], Year: [getYear(src)]"
									world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Fat Buu</font></b>"
							src.move = 1
							src.frozen = 0
							src.attacking = 0
							src.client.show_verb_panel = 1
							usr.hideipan = 0

		SSJ()
			if(usr.kaioken == 0)
				if(usr.gonessj == 0)
					if(src.race == "Saiyan"||src.race == "Half-Saiyan")
						if(src.powerlevel.max_value >= 350000 && src.ki.max_value >= 25000)
							if(src.giji == 0)
								src.contents += new /obj/transes/giji
								if(!frgssj)
									if(!fused)
										frgssj = "Name: [name], Key: [key], Month: [getMonth(src)], Year: [getYear(src)]"
										world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Giji Super Saiyan</font></b>"
								src << "<FONT COLOR = YELLOW><B>You recieve the Giji Super Saiyan Transformation."
								src.giji = 1
							if(src.powerlevel.max_value >= 1200000 && src.ki.max_value >= 500000)
								src.dir = SOUTH
								src.gonessj = 1
								src.move = 0
								src.frozen = 1
								src.kame = 1
								src.attacking = 1
								src.client.show_verb_panel = 0
								src.hideipan = 1
								src << "<B><FONT COLOR = YELLOW>Power begins to eminate from your body!"
								oview(10) << "<B><FONT COLOR = YELLOW>Power begins to eminate from [src]'s body!"
								view(10) << 'sounds/ssj_transform.wav'
								src.icon_state = "ssj"
								sleep(32)
								src.random = rand(1,3)
								if(src.random == 1)
									src << "<B>You return to your normal state."
									src.icon_state = ""
									src.gonessj = 0
									src.underlays -= /obj/SSAuraBottom
									src.overlays -= /obj/SSAuraTop
									view(10) << 'sounds/revert.wav'
									src.move = 1
									src.frozen = 0
									src.kame = 0
									src.attacking = 0
									src.client.show_verb_panel = 1
									src.hideipan = 0
								else
									view(10) << 'sounds/aura.wav'
									src << "<B><FONT COLOR = YELLOW>A golden aura begins to surround your body."
									oview(10) << "<B><FONT COLOR = YELLOW>A golden aura begins to surround [src]'s body."
									src.underlays += /obj/SSAuraBottom
									src.overlays += /obj/SSAuraTop
									sleep(32)
									src.random = rand(1,3)
									if(src.random == 1)
										src << "<B>You return to your normal state."
										src.icon_state = ""
										src.gonessj = 0
										src.underlays -= /obj/SSAuraBottom
										src.overlays -= /obj/SSAuraTop
										view(10) << 'sounds/revert.wav'
										src.move = 1
										src.frozen = 0
										src.kame = 0
										src.attacking = 0
										src.client.show_verb_panel = 1
										src.hideipan = 0
									else
										src.random = rand(1,10)
										if(src.random == 10)
											src.underlays -= /obj/SSAuraBottom
											src.overlays -= /obj/SSAuraTop
											src << "<B><FONT COLOR = YELLOW>Your golden aura dissappates!"
											oview(10) << "<B><FONT COLOR = YELLOW>[src]'s golden aura dissappates!"
											view(30) << 'sounds/ssj_firsttrans.wav'
											sleep(25)
											view(30) << "<FONT COLOR = RED>[src]:</FONT> <FONT SIZE = 2>aaaaaaaAAHHHHHHHHHHHH!!!!!!!!!!!!"
											view(150) << "<B><FONT COLOR = YELLOW><I>The ground begins to shake immensly from [src]'s power."
											Quake_Effect(src,60,1)
											call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
											for(var/mob/characters/A in oview(150))
												if(A.client)
													Quake_Effect(A,60,1)
											src.lspecial = 1
											src.dspecial = 0
											src.flyingrocks()
											src.lightningrand()
											src.lightningrand()
											sleep(128)
											src.overlays += 'icons/transelec.dmi'
											spawn(13)
												call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
												src.overlays -= 'icons/transelec.dmi'
												src.underlays += /obj/SSAuraBottom
												src.overlays += /obj/SSAuraTop
											sleep(76)
											src.dseffect()
											call(/RoundExplosion/proc/NDBlast)(src.loc,1,4)
											sleep(19)
											flick("gonessj",src)
//											src.powerlevel.max_value *= 2
											src.powerlevel.max_value = round(src.powerlevel.max_value)
											src.ki.max_value *= 2
											src.ki.max_value = round(src.ki.max_value)
											src.icon_state = ""
											src.hairremoval()
											src.ssjhairrestore()
											src.underlays += /obj/SSAuraBottom
											src.overlays += /obj/SSAuraTop
											src.CreateName()
											view(10) << 'sounds/s17trans.wav'
											sleep(75)
											src.overlays += 'icons/elec.dmi'
											sleep(75)
											src.random = rand(1,3)
											if(src.random == 1)
												src << "<b>You attempt understand and control the Ultra Super Saiyan transformation, but you fail."
//												src.powerlevel.max_value *= 0.5
												src << "<b>You gain control of your body again."
												src.underlays -= /obj/SSAuraBottom
												src.overlays -= /obj/SSAuraTop
												src.underlays -= 'icons/elec.dmi'
												src.lspecial = 0
												src.dspecial = 0
												src.move = 1
												src.frozen = 0
												src.kame = 0
												src.attacking = 0
												src.client.show_verb_panel = 1
												src.hideipan = 0
												view(10) << 'sounds/revert.wav'
												src.overlays -= 'icons/hair_super_Saiyan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
												src.hairrestore()
												src.gonessj = 0
												src.CreateName()
											else
												src.gonessj = 1
												src << "<b>You understand and control the Ultra Super Saiyan transformation."
												sleep(45)
												src << "<b>You gain control of your body again."
												src.underlays -= /obj/SSAuraBottom
												src.overlays -= /obj/SSAuraTop
												src.lspecial = 0
												src.dspecial = 0
												src.move = 1
												src.frozen = 0
												src.kame = 0
												src.attacking = 0
												src.client.show_verb_panel = 1
												src.hideipan = 0
												src.overlays -= 'icons/hair_super_Saiyan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
												view(10) << 'sounds/revert.wav'
												if(!frssj1)
													if(!fused)
														frssj1 = "Name: [name], Key: [key], Month: [getMonth(src)], Year: [getYear(src)]"
														world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Super Saiyan</font></b>"
												src.contents += new /obj/transes/ssj
												usr.hairrestore()
												src.CreateName()
												src.ssj = 0
										else
											src.underlays -= /obj/SSAuraBottom
											src.overlays -= /obj/SSAuraTop
											src << "<B><FONT COLOR = YELLOW>Your golden aura dissappates!"
											oview(10) << "<B><FONT COLOR = YELLOW>[src]'s golden aura dissappates!"
											view(30) << 'sounds/ssj_firsttrans.wav'
											sleep(25)
											view(30) << "<FONT COLOR = RED>[src]:</FONT> <FONT SIZE = 2>aaaaaaaAAHHHHHHHHHHHH!!!!!!!!!!!!"
											view(150) << "<B><FONT COLOR = YELLOW><I>The ground begins to shake immensly from [src]'s power."
											Quake_Effect(src,60,1)
											call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
											for(var/mob/characters/A in oview(150))
												if(A.client)
													Quake_Effect(A,60,1)
											src.lspecial = 1
											src.dspecial = 0
											src.flyingrocks()
											src.lightningrand()
											src.lightningrand()
											sleep(128)
											src.overlays += 'icons/transelec.dmi'
											spawn(13)
												call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
												src.overlays -= 'icons/transelec.dmi'
												src.underlays += /obj/SSAuraBottom
												src.overlays += /obj/SSAuraTop
											sleep(76)
											src.dseffect()
											call(/RoundExplosion/proc/NDBlast)(src.loc,1,4)
											sleep(19)
											flick("gonessj",src)
											src.icon_state = ""
											src.hairremoval()
											src.ssjhairrestore()
											src.underlays += /obj/SSAuraBottom
											src.overlays += /obj/SSAuraTop
											src.CreateName()
											view(10) << 'sounds/s17trans.wav'
											sleep(50)
											src.random = rand(1,3)
											if(src.random == 1)
												src << "<b>You attempt understand and control the Super Saiyan transformation, but you fail."
												src << "<b>You gain control of your body."
												src.underlays -= /obj/SSAuraBottom
												src.overlays -= /obj/SSAuraTop
												view(10) << 'sounds/revert.wav'
												src.lspecial = 0
												src.dspecial = 0
												src.move = 1
												src.frozen = 0
												src.kame = 0
												src.attacking = 0
												src.client.show_verb_panel = 1
												src.hideipan = 0
												src.overlays -= 'icons/hair_super_Saiyan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
												src.hairrestore()
												src.gonessj = 0
												src.CreateName()
											else
												src.gonessj = 1
												src << "<b>You understand and control the Super Saiyan transformation."
												src << "<b>You gain control of your body again."
												src.underlays -= /obj/SSAuraBottom
												src.overlays -= /obj/SSAuraTop
												sleep(45)
												view(10) << 'sounds/revert.wav'
												if(!frssj1)
													if(!fused)
														frssj1 = "Name: [name], Key: [key], Month: [getMonth(src)], Year: [getYear(src)]"
														world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Super Saiyan</font></b>"
												src.contents += new /obj/transes/ssj
												src.ssj = 0
												src.lspecial = 0
												src.dspecial = 0
												src.move = 1
												src.frozen = 0
												src.kame = 0
												src.attacking = 0
												src.client.show_verb_panel = 1
												src.hideipan = 0
												src.overlays -= 'icons/hair_super_Saiyan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
												src.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
												src.hairrestore()
												src.CreateName()



