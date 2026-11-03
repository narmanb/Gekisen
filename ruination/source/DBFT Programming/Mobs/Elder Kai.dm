mob/var/mystic = 0
mob/var/gone_mystic = 0
mob
	NPC
		Elder_Kai
			icon_state = "Elder Kai"
			name = "Elder Kai"
			density=1
			safe=1
			frozen = 1
			ITflag = 1
			it_blocked=1
			talking=0
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Elder Kai")


					if(!usr.gone_mystic)
						if(usr.level < 200000)
							usr << "<font color = white>Elder Kai:</font> You are not strong enough yet to train with me!"
							return

						if(!usr.talking)
						//	spawn(1000)usr.talking=0
							usr.talking=1
							src.doing = 1
							usr << "<font color = white>Elder Kai:</font> Ahhh, I see you are the one who set me free!"
							sleep(25)
							usr << "<font color = white>Elder Kai:</font> You know, I used to train some of the Galaxies Strongest fighters?"
							sleep(25)
							usr << "<font color = white>Elder Kai:</font> If you want, for releasing me, I can teach you how to unlock a Power Deep within?"
							sleep(10)
							switch(alert("Do you wish to train with the Elder Kai?","","Yes","No"))
								if("Yes")
									if(usr.doing)
										return
									if(usr.mystic)
										usr.talking = 0
										usr.doing = 0
										return
									if(usr.form_1||usr.transformed||usr.inverted)
										usr << "<font color=white>Elder Kai: </font>You cannot use this while transformed!"
										usr.talking=0
										usr.doing = 0
										return
									//usr.mystic = 1
									usr.doing=1
									usr << "<font color = white>Elder Kai:</font> Sit child. The training shall begin..."

									sleep(30)
									if(!usr)
									//	del(src)
										return
									usr.frozen=1
									usr.doing=1
									usr.safe=1
									usr.icon_state="rest"
									usr << "\white You feel some of your true power begin to flow through you..."
									sleep(500)
									if(!usr)
									//	del(src)
										return
									usr << "\white You feel some of your true power begin to flow through you..."
									sleep(250)
									if(!usr)
									//	del(src)
										return
									usr << "\white The ground shakes as your true power is finally unleashed..."
									Explode(new/Effect/BasicBoom(src.loc,1,4))
									usr.frozen = 0
									usr.safe = 0

									usr.melee = (usr.melee_max+usr.melee_bonus)
									usr.block = (usr.block_max+usr.block_bonus)
									usr.dodge = (usr.dodge_max+usr.dodge_bonus)
									usr.counter = (usr.counter_max+usr.counter_bonus)
									usr.critical = (usr.critical_max+usr.critical_bonus)
									usr.durability = (usr.durability_max+usr.durability_bonus)
									usr.ki_control = (usr.ki_control_max+usr.ki_control_bonus)
									usr.ki_cast = (usr.ki_cast_max+usr.ki_cast_bonus)
									usr.ki_power = (usr.ki_power_max+usr.ki_power_bonus)
									usr.ki_use = (usr.ki_use_max+usr.ki_use_bonus)
									usr.ki_res = (usr.ki_res_max+usr.ki_res_bonus)
									usr.reflect = (usr.reflect_max+usr.reflect_bonus)
									usr.weapon = (usr.weapon_max+usr.weapon_bonus)
									usr.weapon_power = (usr.weapon_power_max+usr.weapon_power_bonus)
									usr.weapon_resistance = (usr.weapon_resistance_max+usr.weapon_res_bonus)

								//	usr.powerlevel_max+=usr.powerlevel_max*0.2
								//	usr.ki_max+=usr.ki_max*0.2
								//	usr.kidefense_max+=usr.kidefense_max*0.2
								//	usr.strength_max+=usr.strength_max*0.2
								//	usr.defence_max+=usr.defence_max*0.2
								//	usr.speed_max+=usr.speed_max*0.2
									if(usr.form_1||usr.transformed||usr.inverted)
										usr << "<font color=white>Elder Kai: </font>You cannot use this while transformed!"
										usr.frozen=0
										usr.doing=0
										usr.talking=0
										usr.icon_state = ""

										return

									usr.gone_mystic=1

									usr << "<font color = white>Elder Kai:</font> Your training is now complete!"
									usr.doing = 0
									usr.frozen = 0
									usr.safe = 0


									usr << "<center><font color=#87ceeb>You have unlocked a new form!</font></center>"

									var/plgain = usr.powerlevel_max * 0.8
									var/kigain = usr.ki_max * 0.8
									var/strgain = usr.strength_max * 0.8
									var/defgain = usr.defence_max * 0.8
									usr.powerlevel_max += plgain
									usr.ki_max += kigain
									usr.kidefense_max += 25000000
									usr.strength_max += strgain
									usr.defence_max += defgain
									usr.speed_max += 25000000
									usr.talking = 0

									usr << "<font color = green><b>Powerlevel + [applycommas(plgain)]<br>Ki + [applycommas(kigain)]<br>Strength + [applycommas(strgain)]<br>Defense + [applycommas(defgain)]"
										//usr << "<font color = green><b>Powerlevel + [plgain]<br>Ki + [kigain]<br>Strength + [strgain]<br>Defense + [defgain]"
									//usr.staminaleft_max += 15000+(usr.level*10)


									sleep(5)
									if(!usr)
							//			del(src)
										return
									spawn(1)usr.client.SaveChar()
//													if(usr.race == "Half Saiyan")
//														spawn(2)usr.HalfSaiyanTrans()
//													if(usr.race == "Human")
//														spawn(1)usr.HumanTrans()
									sleep(20)
									usr << "<font color = white>Elder Kai:</font> My job here is done. Good luck [usr]."
								//	del(src)
								if("No")
									usr.frozen = 0
									usr.safe = 0
									usr.talking = 0
								//	del(src)
									return
