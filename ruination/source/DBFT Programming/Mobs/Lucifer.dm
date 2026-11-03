mob
	var
		d_blade_quest = 0
		prince = 0
		gone_prince = 0
mob
	NPC
		Lucifer
			name = "Lucifer"
			icon = 'Demon - Form 5.dmi'
			icon_state = ""
			density = 1
			safe = 1
			frozen = 1
			it_blocked = 1
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Lucifer (D sword)")
					if(usr.d_blade_quest)
						if(usr.karma == "Evil" && usr.karma_rating >= 65)
							if(usr.race == "Demon" && usr.strength >= 50000000)
								if(!usr.gone_prince)
									if(!usr.talking)
										//spawn(30)usr.talking=0
										usr.talking=1
										src.doing = 1
										usr.frozen = 1
										usr << "<font color = red>Lucifer:</font><font color=white> How dare you awaken me from my slumber!</font>"
										sleep(25)
										usr << "<font color = red>Lucifer:</font><font color=white> Hmm... you look not as weak as I thought.</font>"
										sleep(25)
										usr << "<font color = red>Lucifer:</font><font color=white> I can teach you to become more power than you could ever imagine, but it will take time.</font>"
										sleep(10)
										switch(alert("Do you wish to train with Lucifer?","","Yes","No"))
											if("Yes")
												if(usr.doing)
													return
												usr.prince = 1
												usr.frozen = 1
												usr.doing=1
												usr << "<font color = red>Lucifer:</font><font color=white> Channel your rage and hatred. Make it your power.</font>"
											//	spawn(1)usr.DemonRevert()
												sleep(3)
												if(!usr)
													del(src)
													return
												usr.frozen=1
												usr.doing=1
												usr.safe=1
												usr.icon_state="enrage"
												usr.Put_Aura()
												usr << "\red You feel some of your true power begin to flow through you..."
												sleep(1)
												view(20) << "<font color=red>[usr]: <font color=white>RRRRAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHH</font>"
											//	usr.DemonTrans()
												sleep(10)
												view(20) << "<font color=red>[usr]: <font color=white>RRRRAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHH</font>"
											//	usr.DemonTrans()
												sleep(20)
												view(20) << "<font color=red>[usr]: <font color=white>RRRRAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHH</font>"
											//	usr.DemonTrans()
												sleep(40)
												if(!usr)
													del(src)
													return
												view(20) << "<font color=red size=2>[usr]: <font color=white>RRRRAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHH</font>"
											//	spawn(1)usr.DemonTrans()
												if(!usr)
													del(src)
													return
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
												if(usr.race == "Demon")
													usr.gone_prince=1
													usr << "<center><font color=#990000>You have unlocked a new form!</font></center>"
												usr << "\white The ground shakes as your true power is finally unleashed..."
												Explode(new/Effect/BasicBoom(src.loc,1,11))
												usr << "<font color = red>Lucifer:</font><font color=white> Your training is now complete!</font>"
												usr.doing = 0
												usr.frozen = 0
												usr.safe = 0
												usr.prince = 1
											//	usr.form_1 = 1
											//	usr.form_2 = 1
											//	usr.form_3 = 1
											//	usr.form_4 = 1
												usr.frozen = 0
												usr.doing = 0
												usr.icon_state = ""
												usr << "<center><font color=#87ceeb>You have unlocked a new form!</font></center>"
												sleep(10)
												usr.talking=0
												sleep(5)
												if(!usr)
													del(src)
													return
												spawn(1)usr.client.SaveChar()
												sleep(20)
												usr << "<font color = red>Lucifer:</font><font color=white> Use this power to decimate your enemies, and spread the darkness [usr].</font>"
												del(src)
											if("No")
												usr.frozen = 0
												usr.safe = 0
												usr.talking=0
												//del(src)
												return
								else
									usr << "<font color = red>Lucifer:</font><font color=white> I have already taught you this you pathetic recreant!</font>"
									usr.frozen = 0
									usr.safe = 0
									usr.doing=0
									usr.talking=0
								//	del(src)
									return
							else
								usr << "<font color = red>Lucifer:</font><font color=white> You are not strong enough for this you pathetic recreant! HAHAHAHA!</font>"
							//	del(src)
								usr.frozen=0
								usr.doing = 0
								usr.talking=0
								return
						else
							usr << "<font color = red>Lucifer:</font><font color=white> Get out of here before I feast on your soul you wanna-be martyr.</font>"
							src.doing = 0
							usr.frozen=0
							usr.talking=0
							//del(src)
							return