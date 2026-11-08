
mob/verb
	Punch()
		set category = null
		if(!usr) return
		var/mob/M
		for(var/mob/O in get_step(usr,usr.dir))
			if(istype(M, /monster) && (M.ap != 0) && ((usr.ap < 0 && M.ap < 0) || (usr.ap >= 0 && M.ap >= 0)))
				continue
			M = O
		if(M)
			if(usr.zanzoken )
				alert("You can't attack while using Zanzoken.")
			else
				if(M.powerlevel.max_value <= 0&& !M.fused)
					usr << "You can't attack that!"
				else
					if(!usr.currentStyle)
						usr << "You must be in your fighting stance."
					else
						if(M.npc )
							usr << "You can't attack that!"
						if(M.npc == 0||M.npc == null)
							if(usr.npp )
								usr << "If you retrieve this message, please contact GhostAnime or Vakir! (Error #331)"
							if(usr.npp == 0)
								if(usr.ko )
									usr << "You can't attack while your knocked out!"
								if(usr.ko == 0)
									if(M.ko  && !M.deadchecking)
										view(6) << "<b><font color = red>[usr] finishes off [M]!"
										view(6) << 'sounds/meleefinish.wav'
										M.meleehit()
										M.powerlevel.value = 0
										M.ki.value = 0
										M.Die(usr)
										usr.kills += 1
									else if (!M.deadchecking)
										if(usr.attacking == 0)
											usr.attacking = 1
											spawn(usr.attackdelay)
												usr.attacking = 0
											usr.random= rand(1,4)
											if(usr.random )
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/swordhit.wav'
													M << 'sounds/swordhit.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"

													if(prob(usr.currentStyle.critHitChance))
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0

															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/armpro = (usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15))))
																if(armpro <= 0)
																	M.powerlevel.value -= 0
																	M.powerlevel.value = round(M.powerlevel.value)
																	M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
																else
																	M.powerlevel.value -= armpro
																	M.powerlevel.value = round(M.powerlevel.value)
																	M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
												else
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit1.wav'
														M << 'sounds/polehit1.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/punchhit.wav'
														M << 'sounds/punchhit.wav'
														M.meleehit()
													flick("sparfury",usr)
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																var/armpro = (usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15))))
																if(armpro <= 0)
																	if(!M) return
																	M.powerlevel.value -= 0
																	M.powerlevel.value = round(M.powerlevel.value)
																	M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
																else
																	if(!M) return
																	M.powerlevel.value -= armpro
																	M.powerlevel.value = round(M.powerlevel.value)
																	M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(!M) return
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 2)
												if(!M) return
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/swordhit.wav'
													M << 'sounds/swordhit.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													usr.ki.max_value += rand(0,6)
													usr.powerlevel.max_value += rand(0,6)
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													M.KO(usr)
												else
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit2.wav'
														M << 'sounds/polehit2.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/kickhit.wav'
														M << 'sounds/kickhit.wav'
														M.meleehit()
													flick("sparkick",usr)
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(!M) return
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 3)
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/sword.wav'
													M << 'sounds/sword.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													M.KO(usr)
												else
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit1.wav'
														M << 'sounds/polehit1.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/punchhit.wav'
														M << 'sounds/punchhit.wav'
														M.meleehit()
													flick("sparfury",usr)
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 4)
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/punchmiss.wav'
													M << 'sounds/punchmiss.wav'
												else
													if(!M) return
													usr << 'sounds/punchmiss.wav'
													M << 'sounds/punchmiss.wav'
													flick("sparpunch",usr)
										else
											usr.powerlevel.value += 0
									else
										if(!usr.currentStyle)
											usr << "You must be in your fighting stance."
										else
											if(usr.attacking )
												usr.powerlevel.value += 0
											else
												usr.attacking = 1
												spawn(usr.attackdelay)
													if(usr)
														usr.attacking = 0
												view(1) << "<font color = red><i>[usr] punches aimlessly into the air!"
												view(1) << 'sounds/punchmiss.wav'
												flick("sparpunch",usr)

	Kick()
		set category = null
		if(!usr) return
		var/mob/M
		for(var/mob/O in get_step(usr,usr.dir))
			if(istype(M, /monster) && (M.ap != 0) && ((usr.ap < 0 && M.ap < 0) || (usr.ap >= 0 && M.ap >= 0)))
				continue
			M = O
		if(M)
			if(usr.zanzoken )
				alert("You can't attack while using Zanzoken.")
			else
				if(M.powerlevel.max_value <= 0&&!M.fused)
					usr << "You can't attack that!"
				else
					if(!usr.currentStyle)
						usr << "You must be in your fighting stance."
					else
						if(M.npc )
							usr << "You can't attack that!"
						if(M.npc == 0||M.npc == null)
							if(usr.npp )
								usr << "If you retrieve this message, please contact GhostAnime or Vakir! (Error #331)"
							if(usr.npp == 0)
								if(usr.ko )
									usr << "You can't attack while your knocked out!"
								if(usr.ko == 0)
									if(!M) return
									if(M.ko  && !M.deadchecking)
										view(6) << "<b><font color = red>[usr] finishes off [M]!"
										view(6) << 'sounds/meleefinish.wav'
										M.meleehit()
										M.powerlevel.value = 0
										M.ki.value = 0
										M.Die(usr)
										usr.kills += 1
									else if (!M.deadchecking)
										if(!M) return
										if(usr.attacking == 0)
											usr.attacking = 1
											spawn(usr.attackdelay)
												usr.attacking = 0
											usr.random= rand(1,4)
											if(usr.random )
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													view(1) << 'sounds/swordhit.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg=max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
												else
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit1.wav'
														M << 'sounds/polehit1.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/kickhit.wav'
														M << 'sounds/kickhit.wav'
														M.meleehit()
													flick("sparkick",usr)
													if(prob(usr.currentStyle.critHitChance))
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 2)
												if(!M) return
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/swordhit.wav'
													M << 'sounds/swordhit.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
												else
													if(!M) return
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit2.wav'
														M << 'sounds/polehit2.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/kickhit.wav'
														M << 'sounds/kickhit.wav'
														M.meleehit()
													flick("sparkick",usr)
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 3)
												if(!M) return
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/sword.wav'
													M << 'sounds/sword.wav'
													M.meleehit()
													if(M.tail )
														var/cuto = rand(1,150)
														if(cuto == 111)
															M.tail = 0
															M.overlays -= /obj/tail
															M.contents -= /obj/Wraptail
															M.contents -= /obj/Unwraptail
															view(6) << "[usr] cuts off [M]'s tail!"
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
												else
													if(!M) return
													if(isPoleStance(usr.currentStyle))
														if(!M) return
														usr << 'sounds/polehit1.wav'
														M << 'sounds/polehit1.wav'
														M.meleehit()
													else
														if(!M) return
														usr << 'sounds/kickhit.wav'
														M << 'sounds/kickhit.wav'
														M.meleehit()
													flick("sparfury",usr)
													if(prob(usr.currentStyle.critHitChance))
														if(!M) return
														M.powerlevel.value -= usr.powerlevel.value
													else
														if(!M) return
														if(M.blocking)
															if(!M) return
															var/blkrem = rand(1,4)
															if(blkrem == 4)
																if(!M) return
																usr << "<font color = red><i>[usr] throws [M] offguard!"
																M << "<font color = red><i>[usr] throws [M] offguard!"
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M.blocking = 0
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- 0.75 /100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																flick("sparblockhit",M)
														else
															if(!M) return
															if(M.armored==0)
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)/100)))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
															else
																if(!M) return
																var/dmg = max(1,(usr.powerlevel.value * (rand(usr.currentStyle.damagePercentMin,usr.currentStyle.damagePercentMax)- M.armordmg * (rand(5,15)))))
																M.powerlevel.value -= dmg
																M.powerlevel.value = round(M.powerlevel.value)
																M << "<FONT COLOR = RED>Your armor protects you slightly from [usr]'s blow!"
													if(isZanStance(usr.currentStyle))
														if(!M) return
														usr.icon_state = "zan"
														var/rnd = rand(1,4)
														switch(rnd)
															if(1)
																usr.loc = locate(M.x-1,M.y,M.z)
																usr.dir = EAST
																view(6) << 'sounds/it.wav'
															if(2)
																usr.loc = locate(M.x+1,M.y,M.z)
																usr.dir = WEST
																view(6) << 'sounds/it.wav'
															if(3)
																usr.loc = locate(M.x,M.y-1,M.z)
																usr.dir = NORTH
																view(6) << 'sounds/it.wav'
															if(4)
																usr.loc = locate(M.x,M.y+1,M.z)
																usr.dir = SOUTH
																view(6) << 'sounds/it.wav'
														usr.icon_state = ""
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
													if(!M) return
													M.KO(usr)
											if(usr.random == 4)
												if(isSwordStance(usr.currentStyle))
													if(!M) return
													usr << 'sounds/punchmiss.wav'
													M << 'sounds/punchmiss.wav'
												else
													if(!M) return
													usr << 'sounds/punchmiss.wav'
													M << 'sounds/punchmiss.wav'
													flick("sparpunch",usr)
										else
											usr.powerlevel.value += 0
									else
										if(!usr.currentStyle)
											usr << "You must be in your fighting stance."
										else
											if(usr.attacking )
												usr.powerlevel.value += 0
											else
												usr.attacking = 1
												spawn(usr.attackdelay)
													usr.attacking = 0
												usr << "<font color = red><i>[usr] kicks aimlessly into the air!"
												M << "<font color = red><i>[usr] kicks aimlessly into the air!"
												usr << 'sounds/kickmiss.wav'
												M << 'sounds/kickmiss.wav'
												flick("sparkick",usr)

	Throw()
		set category = null
		if(!usr) return
		var/mob/M
		for(var/mob/O in get_step(usr,usr.dir))
			M = O
		if(M)
			if(!M.client)
				alert("You can't throw that!")
			else if(usr.z == 3 || usr.z == 15)
				alert("You can't use this here")
			else
				if(usr.zanzoken )
					alert("You can't attack while using Zanzoken.")
				else
					if(M.powerlevel.max_value <= 0&&!M.fused)
						usr << "You can't attack that!"
					else
						if(M.npc )
							usr << "You can't attack that!"
						if(M.npc == 0||M.npc == null)
							if(usr.npp )
								usr << "If you retrieve this message, please contact GhostAnime or Vakir! (Error #331)"
							if(usr.npp == 0)
								if(usr.ko )
									usr << "You can't attack while your knocked out!"
								if(usr.ko == 0)
									if(usr.attacking == 0)
										if(usr.stamina.value >= 5)
											usr.stamina.value -= 5
											usr.attacking = 1
											spawn(usr.attackdelay * 4)
												usr.attacking = 0
											usr.random= rand(1,4)
											usr << "<font color = red><i>[usr] tries to grab hold of [M]!"
											M << "<font color = red><i>[usr] tries to grab hold of [M]!"
											if(usr.random )
												usr.throwc = 1
												usr.move = 0
												M.move = 0
												usr.client.show_verb_panel = 0
												usr.hideipan = 1
												if(M.client)
													M.client.show_verb_panel = 0
													usr.hideipan = 1
												usr.canthrow = 1
												switch(input("What direction do you want to throw, [M]?","Throw",text) in list("North","South","East","West"))
													if("North")
														if(M && usr)
															view(6) << "<font color = red><i>[usr] throws [M]!"
															view(6) << 'sounds/throw.wav'
															usr.dir = NORTH
															M.icon_state = "buku"
															M.loc=usr.loc
															M.thrown=1
															M.throwpowerlevel = usr.powerlevel.value
															M.throwproc(usr)
															M.dir = NORTH
															M.throwed = 1
															M.throwedb = "[usr.name]"
															walk(M,usr.dir)
														if(usr)
															usr.move = 1
															usr.client.show_verb_panel = 1
															usr.hideipan = 0
															usr.throwc = 0
														if(M)
															M.density = 0
															M.attacking = 0
															M.move = 1

													if("South")
														if(M && usr)
															view(6) << "<font color = red><i>[usr] throws [M]!"
															view(6) << 'sounds/throw.wav'
															usr.dir = SOUTH
															M.icon_state = "buku"
															M.loc=usr.loc
															M.thrown=1
															M.throwpowerlevel = usr.powerlevel.value
															M.throwproc(usr)
															M.dir = SOUTH
															M.throwed = 1
															M.throwedb = "[usr.name]"
															walk(M,usr.dir)
														if(usr)
															usr.move = 1
															usr.client.show_verb_panel = 1
															usr.hideipan = 0
															usr.throwc = 0
														if(M)
															M.density = 0
															M.attacking = 0
															M.move = 1

													if("West")
														if(M && usr)
															view(6) << "<font color = red><i>[usr] throws [M]!"
															view(6) << 'sounds/throw.wav'
															usr.dir = WEST
															M.icon_state = "buku"
															M.loc=usr.loc
															M.thrown=1
															M.throwpowerlevel = usr.powerlevel.value
															M.throwproc(usr)
															M.dir = WEST
															M.throwed = 1
															M.throwedb = "[usr.name]"
															walk(M,usr.dir)
														if(usr)
															usr.move = 1
															usr.client.show_verb_panel = 1
															usr.hideipan = 0
															usr.throwc = 0
														if(M)
															M.density = 0
															M.attacking = 0
															M.move = 1

													if("East")
														if(M && usr)
															view(6) << "<font color = red><i>[usr] throws [M]!"
															view(6) << 'sounds/throw.wav'
															usr.dir = EAST
															M.icon_state = "buku"
															M.loc=usr.loc
															M.thrown=1
															M.throwpowerlevel = usr.powerlevel.value
															M.throwproc(usr)
															M.dir = EAST
															M.throwed = 1
															M.throwedb = "[usr.name]"
															walk(M,usr.dir)
														if(usr)
															usr.move = 1
															usr.client.show_verb_panel = 1
															usr.hideipan = 0
															usr.throwc = 0
														if(M)
															M.density = 0
															M.attacking = 0
															M.move = 1
											else
												usr << "<font color = red><i>[usr] loses hold of [M]!"
												M << "<font color = red><i>[usr] loses hold of [M]!"
												usr.powerlevel.value += 0
												usr.throwc = 0
												M.throwed = 1
												M.throwedb = "[usr.name]"
										else
											usr << "<B>You are too tired!"
									else
										usr.powerlevel.value += 0
		else
			usr << "<B>There is nothing there!"

	Block()
		set category = null
		if(!usr) return
		if(usr.zanzoken == 0)
			if(usr.currentStyle)
				if(usr.blocking == 0)
					view(1) << "<font color = red><i>[usr] throws up his arms and blocks incoming attacks."
					usr.icon_state = "sparblock"
					usr.attacking = 1
					usr.blocking = 1
					usr.move = 0
					usr.client.show_verb_panel = 0
					usr.hideipan = 1
					spawn(250)
						if(usr && usr.blocking )
							view(1) << "<font color = red><i>[usr] throws down his arms."
							usr.blocking = 0
							usr.attacking = 0
							usr.icon_state = ""
							usr.move = 1
							usr.client.show_verb_panel = 1
							usr.hideipan = 0
				else
					view(1) << "<font color = red><i>[usr] throws down his arms."
					usr.blocking = 0
					usr.attacking = 0
					usr.icon_state = ""
					usr.move = 1
					usr.client.show_verb_panel = 1
					usr.hideipan = 0
			else
				usr << "You must be in your fighting stance."
		else
			alert("You can't block while using Zanzoken.")