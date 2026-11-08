mob
	proc
		chargebu()
			spawn(1)
				set background = 1
				if(src.charges < 0)
					src.charges = 0
					usr << "Your charges has been reset for going under 0!"
				if(src.charges > 10)
					usr << "You have charged too many blasts!"
					src.charges = 0
					src.overlays -= /obj/kiblast2
					src.overlays -= /obj/ren2
					src.overlays -= /obj/kiblast
					src.overlays -= /obj/ren
					call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
					src.kame = 0
					src.frozen = 0
					src.client.show_verb_panel = 1
					src.hideipan = 0
					src.powerlevel.value = 0
					src.Die(usr)
		saibaseedcount()
			spawn(1)
				set background = 1
				while(src.saibaseedt > 0)
					src.saibaseedt--
					sleep(600)
					if(src.saibaseedt <= 0)
						usr << "<B>You can now plant again!"
						src.saibaseedt = null
						break
		wizcount()
			spawn(1)
				set background = 1
				while(src.wizspell > 0)
					sleep(600)
					src.wizspell--
					if(src.wizspell <= 0)
						usr << "<B>You can now cast your spells again!"
						src.wizspell = null
						if(src.shapeshifted )
							src.shapeshifted = 0
						break
		dhealt()
			spawn(1)
				set background = 1
				while(src.dheal > 0)
					sleep(600)
					src.dheal--
					if(src.dheal <= 0)
						src.dheal = null
						break

		sdtc()
			spawn(1)
				set background = 1
				while(src.sdt > 0)
					sleep(600)
					src.sdt--
					if(src.sdt <= 0)
						src << "You can use Self-Destruct again!"
						src.sdt = null
						break
		lqtc()
			spawn(1)
				set background = 1
				while(src.lqt > 0)
					sleep(600)
					src.lqt--
					if(src.lqt <= 0)
						src << "You can use Liquify again!"
						src.lqt = null
						break
		abc()
			spawn(1)
				set background = 1
				while(src.abt > 0)
					sleep(600)
					src.abt--
					if(src.abt <= 0)
						src << "You can use Android Bomb again!"
						src.abt = null
						break
		flametc()
			spawn(1)
				set background = 1
				while(src.flamet > 0)
					sleep(600)
					src.flamet--
					if(src.flamet <= 0)
						src.flamet = null
						src.shield = 0
						src.overlays -= 'icons/flameshield.dmi'
						src << "<B>Your Flame Shield dies down!"
						break

		ssjfullpower()
			spawn(1)
				set background = 1
				while(src.ssjfpt >= 0 && src.ssjfp !=1 && (src.state == "Super Saiyan" || src.state == "Perfect Form (Weighted)" || src.state == "Super Human"))
					if(hbtcuse)
						sleep(3)
						src.ssjfpt--
					else
						sleep(30)
						src.ssjfpt--
					if(src.ssjfpt == 0||src.ssjfpt == -1)
						src.ssjfpt = -10
						src.ssjfp = 1
						src << "You have gained full control over Super Saiyan or Super Perfect Form! Please Revert and transform again to take advantage of your full power!"
						if(frssjfp == null)
							if(!fused && race == "Saiyan")
								frssjfp = "Name: [src.name], Key: [src.key], Month: [getMonth(src)], Year: [getYear(src)]"
								world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Super Saiyan (Full Power)</font></b>"
						if(frcsup == null)
							if(!fused && race == "Android (Biological)")
								frcsup = "Name: [src.name], Key: [src.key], Month: [getMonth(src)], Year: [getYear(src)]"
								world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Super Perfect Form!</font></b>"

						break
					if(src.ssjfpt > 12000)
						src.ssjfpt = 12000
obj
	transes
		transform
			name = "Changling Forms"
			icon = 'icons/techhands.dmi'
			icon_state = "icertrans"
			Click()
				if(usr.race == "Changling")
					if(usr.transforming ||usr.grav > 0)
						alert("You are already transforming/reverting")
					else
						if(usr.state == "Normal"||usr.state == "Form 2"||usr.state == "Form 3"||usr.state == "Form 4"||usr.state == "Form 4 (Full Power)"||usr.state == "Form 5")
							if(usr.state == "Normal")
								switch(alert("What do you wish to do?","Changling Forms","Transform", "Cancel"))
									if("Transform")
										if(usr.meditate  || usr.rest )
											alert("You can not transform while meditating or resting")
											usr.transforming = 0
										else
											usr.transforming = 1
											if(usr.powerlevel.max_value >= 425000)
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into 2nd Form!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/changling_trans_2.wav'
												flick("form2",usr)
												usr.icon = 'icons/ChangeForm2.dmi'
												sleep(9)
												usr.powerlevel.value = usr.powerlevel.max_value * 2
												usr.ki.value = usr.ki.max_value * 1.5
												usr.state = "Form 2"
												if(frcf2 == null)
													if(!usr.fused)
														frcf2 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
														world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 2</font></b>"
												usr.transforming = 0
											else
												usr << "<B>You are too weak to transform!"
												usr.transforming = 0

										if("Cancel")
											usr.transforming = 0
											..()
							if(usr.state == "Form 2"||usr.state == "Form 3"||usr.state == "Form 4"||usr.state == "Form 4 (Full Power)")
								if(usr.transforming ||usr.grav > 0)
									alert("You are already transforming/reverting")
								else
									switch(alert("What do you wish to do?","Changling Forms","Ascend", "Revert", "Cancel"))
										if("Ascend")
											usr.transforming=1
											if(usr.state == "Form 2")
												if(usr.powerlevel.max_value >= 675000)
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into 3rd Form!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/changling_trans_2.wav'
													flick("form3",usr)

													usr.icon = 'icons/ChangeForm3.dmi'
													sleep(9)
													usr.powerlevel.value = usr.powerlevel.max_value * 3.5
													usr.ki.value = usr.ki.max_value * 1.75
													usr.transforming = 0
													usr.state = "Form 3"
													if(frcf3 == null)
														if(!usr.fused)
															frcf3 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
															world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 3</font></b>"
												else
													usr << "<B>You are too weak to ascend to this new level!"
													usr.transforming = 0
											else
												if(usr.state == "Form 3")
													if(usr.powerlevel.max_value >= 950000)
														view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into 4th Form!</FONT><font color = green> *</FONT>"
														view(10) << 'sounds/changling_trans.wav'
														flick("form4",usr)

														usr.icon = 'icons/ChangeForm4.dmi'
														sleep(29)
														usr.powerlevel.value = usr.powerlevel.max_value * 4.5
														usr.ki.value = usr.ki.max_value * 2
														usr.state = "Form 4"
														if(frcf4 == null)
															if(!usr.fused)
																frcf4 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 4</font></b>"
														usr.transforming = 0
													else
														usr << "<B>You are too weak to ascend to this new level!"
														usr.transforming = 0
												else
													if(usr.state == "Form 4")
														if(usr.powerlevel.max_value >= 1200000)
															view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into 4th Form (Full Power)!</FONT><font color = green> *</FONT>"
															view(10) << 'sounds/changling_trans.wav'
															flick("form4power",usr)
															usr.lspecial = 1
															usr.lightningrand2()

															usr.icon = 'icons/ChangeForm5.dmi'
															sleep(29)
															usr.powerlevel.value = usr.powerlevel.max_value * 6
															usr.ki.value = usr.ki.max_value * 2.95
															usr.transforming = 0
															usr.state = "Form 4 (Full Power)"
															if(frcf4fp == null)
																if(!usr.fused)
																	frcf4fp = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																	world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 4 (Full Power)</font></b>"
														else
															usr << "<B>You are too weak to ascend to this new level!"
															usr.transforming = 0
													else
														if(usr.state == "Form 4 (Full Power)")
															if(usr.powerlevel.max_value >= 5200000)
																view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into 5th Form!</FONT><font color = green> *</FONT>"
																view(10) << 'sounds/changling_trans.wav'
																usr.dseffect()
																usr.overlays += 'icons/wind.dmi'
																sleep(92)
																usr.overlays -= 'icons/wind.dmi'
																view(6) << 'sounds/changling_trans_2.wav'
																flick("form5",usr)
																view(6) << 'sounds/changling_trans_3.wav'
																usr.icon = 'icons/ChangeForm6.dmi'
																sleep(50)
																usr.powerlevel.value = usr.powerlevel.max_value * 6.4
																usr.ki.value = usr.ki.max_value * 4
																usr.state = "Form 5"
																if(frcf5 == null)
																	if(!usr.fused)
																		frcf5 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																		world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 5</font></b>"
																usr.transforming = 0
															else
																usr << "<B>You are too weak to ascend to this new level!"
																usr.transforming = 0
										if("Revert")
											if(usr.state == "Form 2"||usr.state == "Form 3"||usr.state == "Form 4"||usr.state == "Form 4 (Full Power)"||usr.state == "Form 5")
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
												view(6) << 'sounds/revert.wav'
												usr.icon = 'icons/changling.dmi'
												usr.state = "Normal"
												usr.transforming = 0
												usr.lspecial = 0
												if(usr.powerlevel.value >= usr.powerlevel.max_value)
													usr.powerlevel.value = usr.powerlevel.max_value
												if(usr.ki.value >= usr.ki.max_value)
													usr.ki.value = usr.ki.max_value
											else
												usr.transforming = 0
												..()
										if("Cancel")
											usr.transforming = 0
											..()
							if(usr.state == "Form 5")
								switch(alert("What do you wish to do?","Changling Forms","Revert","Cancel"))
									if("Revert")
										if(usr.state == "Form 2"||usr.state == "Form 3"||usr.state == "Form 4"||usr.state == "Form 4 (Full Power)"||usr.state == "Form 5")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
											view(6) << 'sounds/revert.wav'
											usr.icon = 'icons/changling.dmi'
											usr.transforming = 0
											usr.state = "Normal"
											usr.lspecial = 0
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.ki.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
										else
											usr.transforming = 0
											..()
									if("Cancel")
										usr.transforming = 0
										..()



				else
					usr << "<B>Only Changlings can use this!"
					usr.transforming = 0
					del(src)
obj/var/radar = 0

obj/tools
	name = "Tools"
	icon = 'icons/tools.dmi'
	icon_state = ""
	density = 1
	layer = 2

obj/guruchair
	name = "Guru's Throne"
	icon = 'icons/guruchair.png'
	icon_state = ""
	density = 1
	layer = 2
obj/kingchair
	name = "Throne"
	icon = 'icons/kingchair.dmi'
	icon_state = ""
	density = 1
	layer = 2
obj/FireChair
	name = "FireThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "FB"
	density = 1
	layer = 2
obj/FireChair2
	name = "FireThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "FT"
	density = 1
	layer = 2
obj/EarthChair
	name = "EarthThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "EB"
	density = 1
	layer = 2
obj/EarthChair2
	name = "EarthThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "ET"
	density = 1
	layer = 2
obj/IceChair
	name = "IceThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "IB"
	density = 1
	layer = 2
obj/IceChair2
	name = "IceThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "IT"
	density = 1
	layer = 2
obj/AirChair
	name = "AirThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "AB"
	density = 1
	layer = 2
obj/AirChair2
	name = "AirThrone"
	icon = 'icons/turfs2.dmi'
	icon_state = "AT"
	density = 1
	layer = 2

obj
	transes
		celltrans
			name = "Cell Forms"
			icon = 'icons/techhands.dmi'
			icon_state = "celltrans"
			Click()
				if(usr.race == "Android (Biological)")
					if(usr.transforming||usr.grav > 0)
						alert("You can not transform/revert right now")
					else
						usr.transforming = 1
						if(usr.state == "Normal"||usr.state == "Semi-Perfect Form"||usr.state == "Perfect Form"||usr.state == "Perfect Form (Weighted)"||usr.state == "Super Perfect Form")
							if(usr.state == "Normal")
								switch(alert("What do you wish to do?","Cell Forms","Transform", "Cancel"))
									if("Transform")
										if(usr.meditate  || usr.rest )
											alert("You can not transform while meditating or resting")
											usr.transforming = 0
										else
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Semi-Perfect Form!</FONT><font color = green> *</FONT>"
											view(6) << 'sounds/celltrans2.wav'
											flick("trans",usr)
											usr.semi = 1
											usr.icon = 'icons/biocell2.dmi'
											usr.powerlevel.max_value = usr.powerlevel.max_value * 1.5
											usr.ki.max_value = usr.ki.max_value * 1.5
											usr.powerlevel.value = usr.powerlevel.max_value
											usr.ki.value = usr.ki.max_value
											usr.transforming = 0
											usr.state = "Semi-Perfect Form"

									if("Cancel")
										usr.transforming = 0
										..()
							if(usr.state == "Semi-Perfect Form"||usr.state == "Perfect Form")
								switch(alert("What do you wish to do?","Cell Forms","Ascend", "Cancel"))
									if("Cancel")
										usr.transforming = 0
									if("Ascend")
										if(usr.state == "Semi-Perfect Form")
											if(usr.powerlevel.max_value >= 1200000 && usr.absorbexp >= 50)
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Perfect Form!</FONT><font color = green> *</FONT>"
												view(6) << 'sounds/celltrans2.wav'
												flick("trans",usr)
												usr.dspecial = 1
												usr.perfect = 1
												usr.semi = 0
												usr.flyingrocks()
												usr.icon = 'icons/biocell3.dmi'
												usr.powerlevel.max_value = usr.powerlevel.max_value * 2.5
												usr.ki.max_value = usr.ki.max_value * 2.5
												usr.powerlevel.value = usr.powerlevel.max_value
												usr.ki.value = usr.ki.max_value
												usr.transforming = 0
												usr.state = "Perfect Form"
												if(frcp == null)
													if(!usr.fused)
														frcp = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
														world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Perfect Cell Form</font></b>"
											else
												usr << "<B>You are too weak to ascend to this new level!"
												usr.transforming = 0
										else
											if(usr.state == "Perfect Form" && !usr.ssjfp)
												if(usr.powerlevel.max_value >= 8600000)
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Perfect Form (Weighted)!</FONT><font color = green> *</FONT>"
													view(6) << 'sounds/celltrans.wav'
													usr.overlays += 'icons/wind.dmi'
													usr.ussjlightning()
													usr.dseffect()
													sleep(100)
													view(6) << 'sounds/celltrans_2.wav'
													Quake_Effect_View(usr, 40, 1)
													usr.lspecial = 1
													usr.lightningrand2()
													usr.overlays -= 'icons/wind.dmi'
													usr.powerlevel.value = usr.powerlevel.max_value * 3
													usr.ki.value = usr.ki.max_value * 4.2
													if(usr.ssjfpt == null)
														usr.ssjfpt = 24000
													usr.ssjfullpower()
													usr.transforming = 0
													usr.state = "Perfect Form (Weighted)"
													if(frcpw == null)
														if(!usr.fused)
															frcpw = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
															world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Perfect (Weighted) Cell Form</font></b>"
												else
													usr << "<B>You are too weak to ascend to this new level!"
													usr.transforming = 0
											else
												if(usr.state == "Perfect Form" && usr.ssjfp)
													if(usr.powerlevel.max_value >= 8600000)
														view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Perfect Form!</FONT><font color = green> *</FONT>"
														view(6) << 'sounds/celltrans.wav'
														usr.transforming = 1
														usr.overlays += 'icons/wind.dmi'
														usr.ssj2lightning()
														usr.overlays += 'icons/cell aura.dmi'
														Quake_Effect_View(usr, 60, 2)
														usr.dseffect()
														usr.flyingrocks()
														sleep(100)
														view(6) << 'sounds/celltrans_2.wav'
														usr.lspecial = 1
														usr.lightningrand2()
														usr.overlays -= 'icons/wind.dmi'
														call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
														bwipeeffect(usr.z)
														usr.powerlevel.value = usr.powerlevel.max_value * 4
														usr.ki.value = usr.ki.max_value * 4.2
														usr.transforming = 0
														usr.state = "Super Perfect Form"
													else
														usr << "<B>You are too weak to ascend to this new level!"
														usr.transforming = 0

							if(usr.state == "Super Perfect Form")
								switch(alert("What do you wish to do?","Cell Forms","Revert", "Cancel"))
									if("Revert")
										view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
										view(6) << 'sounds/revert.wav'
										usr.icon = 'icons/biocell3.dmi'
										usr.state = "Perfect Form"
										usr.lspecial = 0
										usr.dspecial = 0
										usr.lightning = 0
										usr.overlays -= 'icons/cell aura.dmi'
										if(usr.powerlevel.value >= usr.powerlevel.max_value)
											usr.powerlevel.value = usr.powerlevel.max_value
										if(usr.ki.value >= usr.ki.max_value)
											usr.ki.value = usr.ki.max_value
										usr.transforming = 0

									if("Cancel")
										usr.transforming = 0
										..()


							if(usr.state == "Perfect Form (Weighted)")
								switch(alert("What do you wish to do?","Cell Forms","Revert", "Cancel"))
									if("Revert")
										view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
										view(6) << 'sounds/revert.wav'
										usr.icon = 'icons/biocell3.dmi'
										usr.state = "Perfect Form"
										usr.lspecial = 0
										usr.dspecial = 0
										usr.lightning = 0
										usr.transforming = 0
										if(usr.powerlevel.value >= usr.powerlevel.max_value)
											usr.powerlevel.value = usr.powerlevel.max_value
										if(usr.ki.value >= usr.ki.max_value)
											usr.ki.value = usr.ki.max_value

									if("Cancel")
										usr.transforming = 0
										..()

						else
							usr.transforming = 0
							..()
				else
					usr << "<B>Only Biological Androids can use this!"
					usr.transforming = 0
					del(src)
obj
	techs
		enrage
			name = "Enrage"
			icon = 'icons/techhands.dmi'
			icon_state = "enr"
			Click()
				if(usr.anger == 10)
					if(usr.entime )
						usr << "<B>You are too angry at the moment to enrage yourself!"
					if(usr.entime == null||usr.entime == 0)
						view(6) << "<B>[usr] goes into a great rage!!"
						usr.anger = 1
						usr.maxanger = 10
						usr.entime = 1
						usr.icon_state = "ssj"
						usr.powerlevel.value += (rand(1,(usr.powerlevel.max_value)))
						usr.SSJ()
						usr.FB()
						if(usr.kaioken)
							usr.kaioken = 0
							usr.overlays -= /obj/kkauratop
							usr.underlays -= /obj/kkaurabottom
							view(6) << 'sounds/kaioken.wav'
							view(6) << "<FONT COLOR = RED>[usr]: </FONT><FONT SIZE = 3>KAIO-KEN!!!!!"
							sleep(16)
							view(6) << 'sounds/aura.wav'
							usr.underlays += /obj/bigkaioaura/left/bot
							usr.underlays += /obj/bigkaioaura/left/midbot
							usr.underlays += /obj/bigkaioaura/left/midtop
							usr.underlays += /obj/bigkaioaura/left/top
							usr.underlays += /obj/bigkaioaura/right/bot
							usr.underlays += /obj/bigkaioaura/right/midbot
							usr.underlays += /obj/bigkaioaura/right/midtop
							usr.underlays += /obj/bigkaioaura/right/top
							usr.powerlevel.value = usr.powerlevel.value * 2.5
							usr.ki.value = usr.ki.value * 2.5
							usr << "<FONT COLOR = RED><B>Anger Kaio-ken will only last for about 2 minutes before reverting to original Kaio-ken."
							spawn(1200)
								usr.kaioken = 1
								usr.underlays -= /obj/bigkaioaura/left/bot
								usr.underlays -= /obj/bigkaioaura/left/midbot
								usr.underlays -= /obj/bigkaioaura/left/midtop
								usr.underlays -= /obj/bigkaioaura/left/top
								usr.underlays -= /obj/bigkaioaura/right/bot
								usr.underlays -= /obj/bigkaioaura/right/midbot
								usr.underlays -= /obj/bigkaioaura/right/midtop
								usr.underlays -= /obj/bigkaioaura/right/top
								usr.overlays += /obj/kkauratop
								usr.underlays += /obj/kkaurabottom
								usr.kaioken = 1
								usr.kaiokenstrain()
								if(usr.powerlevel.value < usr.powerlevel.max_value)
									usr.powerlevel.value += 0
								if(usr.powerlevel.value >= usr.powerlevel.max_value)
									usr.powerlevel.value = usr.powerlevel.max_value
								if(usr.ki.value < usr.ki.max_value)
									usr.ki.value += 0
								if(usr.ki.value >= usr.ki.max_value)
									usr.ki.value = usr.ki.max_value
								usr << "<FONT COLOR = RED><B>You revert from Anger Kaio-ken!"
						else if(usr.gonessj)
							if(usr.ap < -25)
								if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
									view(6) << 'sounds/evilpowerup.wav'
									usr.icon_state = "ssj"
									sleep(85)
									flick("gonessj", usr)
									usr.powerlevel.value *= 1.1
									usr.ki.value *= 1.1
									var/icon/aura = new('icons/whiteaura.dmi')
									aura.Blend(usr.customauracolor)
									usr.underlays += aura
									usr.icon_state = ""
									view(6) << 'sounds/lssj_trans2.wav'
									usr << "<B><FONT COLOR = BLUE>An aura flickers around your body, as your rage increases."
						sleep(40)
						usr.icon_state = ""
						sleep(rand(1,1200))
						usr.entime = 0
						usr << "<B>You feel yourself calm down."
						if(usr.gonessj)
							if(usr.ap < -25)
								if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
									usr << "<B><FONT COLOR = BLUE>Your aura fades away."
									var/icon/aura = new('icons/whiteaura.dmi')
									aura.Blend(usr.customauracolor)
									usr.underlays -= aura
				else
					usr << "<B>You simply aren't angered enough to enrage yourself!"



obj
	techs
		Tayioken
			name = "Solar Flare"
			icon = 'icons/techhands.dmi'
			icon_state = "foc"
			Click()


				if(usr.zanzoken )
					alert("You can't use this technique, while using Zanzoken.")
				else
					if(usr.tayio )
						alert("You have already used the 'Solar Flare' technique, you need to wait.")
					if(usr.tayio == null||usr.tayio == 0)
						if(usr.ffcht > 0)
							alert("You can't use this yet!")
							return
						else
							view(25) << 'sounds/solarflare.wav'
							view(15) << "<FONT COLOR = RED>[usr]: </FONT>SOLAR FLARE!!!"
							usr.tayio = 1
							for(var/mob/characters/M in oview(6))
								if(M.client)
									M << "<b><font color = red>You are blinded by [usr]'s Solar Flare!"
									sflare(M)
							usr.ffcht += 3
							usr.ffchc()
			verb
				TimeC()
					set name = "Time Counter"
					set category = null
					var/ffch2
					if(usr.ffcht == null)
						ffch2 = "no waiting"
					else
						ffch2 = usr.ffcht
					usr << "You have [ffch2] minutes left before using [src.name] again!"
var
	list
	// Emoticons
		// Emoticons are special, the filtered words are icon_states
		// NOTE: DON'T filter to the original text or it will cause an infinite loop
		emoticons = list( "`roses" , "`mystrod" , "`pearth")			// Smilies
		emoticons2 = list("rose","mystrod","`pearth")		// icon_state of the smilies

obj
	telepath
		verb
			Telepath(mob/characters/M in world, msg as text)
				set category = "Other"
				set name = "Telepathy"
				set desc = "What message do you want to send through telepathy."
				set background = 1
				if(M.npc == 0||M.npc == null)
					if(M.mon == 0||M.mon == null)
						if(M.ignore.Find(usr))
							usr << "[M] has ignored you!"
							return
						else if(usr.mute )
							usr << "You are muted!"
							return
						else
							var/C = msg
							if(usr.gm != 1 && usr.enf != 1)
								//set background = 1
								var/list/replace_list = list("\n\n" = "\n","\n"="..")
								for(var/word in replace_list)
									var/pos = findtext(C,word)
									while(pos)
										C = copytext(C,1,pos) + replace_list[word] + copytext(C,pos+length(word))
										pos = findtext(C,word)
							usr << "<b>----><font color = blue>{{<font color = black>Telepathy<font color = blue>}}<font color = red>:<font color = black> [msg]"
							M << "<b><----<font color = blue>{{<font color = black>Telepathy<font color = blue>}}<font color = red>[usr]:<font color = black> [msg]"
					else
						usr << "<B>You can't use telepathy with a monster."
				else
					usr << "<B>You can't use telepathy with a NPC."

obj
	flicker
		name = "Dragonball Online"
		icon = 'icons/flicker.dmi'
		icon_state = ""
		pixel_step_size = 16
		density = 0
		layer = 9
		New()
			. = ..()
			spawn(100)
				del(src)


obj
	kiblast
		icon = 'icons/turfs2.dmi'
		icon_state = "blst1"
		layer = 9

obj
	kiblast2
		icon = 'icons/turfs2.dmi'
		icon_state = "blst3"
		layer = 9
obj
	blst2
		icon = 'icons/turfs2.dmi'
		icon_state = "blst2"
		layer = 9
obj
	techs
		kblast
			name = "Ki Blast"
			icon = 'icons/techhands.dmi'
			icon_state = "ki"
			Click()


				var/kiperc = usr.ki.max_value * 0.01
				if(usr.zanzoken )
					alert("You can't use 'Ki Blast' while using Zanzoken.")
				else
					if(usr.kame )
						usr << "<B>You are already using a technique."
					else
						if(usr.rest )
							usr << "<B>You can't use an attack while resting."
						else
							if(usr.meditate )
								usr << "<B>You can't use an attack while meditating."
							else
								if(!usr.beam)
									if(usr.blast == "Ki Blast"||usr.blast == 0||usr.blast == null)
										if(usr.ki.value>=kiperc)
											var/damage = (kiperc * 1.25)
											usr.ki.value -= kiperc
											usr.ki.value = round(usr.ki.value)
											if(usr.charges == 2)
												usr.overlays += /obj/kiblast2
											else if(usr.charges == 1)
												usr.overlays += /obj/kiblast
											view(10) << 'sounds/kicharge.wav'
											usr.kame = 1
											usr.charges++
											usr.blast = "Ki Blast"
											usr.blastdmg = damage
											sleep(25)
											usr << "<FONT COLOR = GREEN><I>Ki Blast can now be fired ([usr.charges] Charge(s))."
											usr.kame = 0
											usr.chargebu()
										else
											alert("You do not have enough Ki to use this technique.")
									else
										alert("You can't mix two attacks together!")
								else
									alert("You can't use a beam and a blast at the same time!")
obj
	techs
		renzoku
			name = "Renzoku Energy Dan"
			icon = 'icons/techhands.dmi'
			icon_state = "orki"
			Click()


				var/kiperc = usr.ki.max_value * 0.05
				if(usr.zanzoken )
					alert("You can't use 'Ki Blast' while using Zanzoken.")
				else
					if(usr.kame )
						usr << "<B>You are already using a technique."
					else
						if(usr.rest )
							usr << "<B>You can't use an attack while resting."
						else
							if(usr.meditate )
								usr << "<B>You can't use an attack while meditating."
							else
								if(!usr.beam)
									if(usr.blast == "Renzoku Energy Dan"||usr.blast == 0||usr.blast == null)
										if(usr.ki.value>=kiperc)
											var/damage = (kiperc * 2.5)
											usr.ki.value -= kiperc
											usr.ki.value = round(usr.ki.value)
											if(usr.charges == 2)
												usr.overlays += /obj/ren2
											else if(usr.charges == 1)
												usr.overlays += /obj/ren
											view(10) << 'sounds/kicharge.wav'
											usr.charges++
											usr.blast = "Renzoku Energy Dan"
											usr.blastdmg = damage
											usr << "<FONT COLOR = GREEN><I>Renzoku Energy Dan can now be fired ([usr.charges] Charge(s))."
											usr.chargebu()
										else
											alert("You do not have enough Ki to use this technique.")
									else
										alert("You can't mix together blasts!")
								else
									alert("You can't use a beam and a blast at the same time!")
obj
	techs
		rfblast
			name = "Rapid Finger Blast"
			icon = 'icons/techhands.dmi'
			icon_state = "fblast"
			Click()
				var/mob/Target=input("Select a target.","Rapid Finger Blast","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.zanzoken )
						alert("You can't use 'Rapid Finger Blast' while using Zanzoken.")
					else
						if(M.npc )
							usr << "<B>You can't attack NPCs."
						else
							if(usr.rest )
								usr << "<B>You can't use this technique while resting."
							else
								if(usr.meditate )
									usr << "<B>You can't use this technique while meditating."
								else
									if(usr.ki.value>=500)
										usr.ki.value-=500
										usr.overlays += 'icons/galicki.dmi'
										usr.kame = 1
										view(10) << 'sounds/ray_charge.wav'
										sleep(30)
										usr.overlays -= 'icons/galicki.dmi'
										view(10) << 'sounds/ray_fire.wav'
										var/damage=usr.ki.max_value/10 * 2.5
										missile('icons/fingerray.dmi', usr, M)
										sleep(5)
										call(/RoundExplosion/proc/NDBlast)(M.loc,1,2)
										M.powerlevel.value-=damage
										usr.kame = 0
										if(M.mon )
											if(M.powerlevel.value <=0)
												if(M.expkn == null && M.expkk == null)
													M.expkn = "[usr.name]"
													M.expkk = "[usr.key]"

										if(M.powerlevel.value<=0)
											M.Die(usr)
										if(usr.move==0) usr.move=1
									else
										alert("You do not have enough Ki to use this technique.")
				else
					usr << "<B>Target has gone out of sight or there isn't any targets near!"
obj
	techs
		fblast
			name = "Finger Blast"
			icon = 'icons/techhands.dmi'
			icon_state = "fblast"
			Click()
				if(usr.kame )
					usr << "<B>You are already using a technique."
				else
					usr.kame = 1
					var/mob/Target=input("Select a target.","Finger Blast","") as mob in oview(6)
					if((Target in oview(6)) && ismob(Target))
						var/mob/M = Target
						if(usr.zanzoken )
							alert("You can't use 'Finger Blast' while using Zanzoken.")
							usr.kame = 0
						else
							if(M.npc )
								usr << "<B>You can't attack NPCs."
								usr.kame = 0
							else
								if(usr.rest )
									usr << "<B>You can't use this technique while resting."
									usr.kame = 0
								else
									if(usr.meditate )
										usr << "<B>You can't use this technique while meditating."
										usr.kame = 0
									else
										if(usr.ki.value>=100)
											usr.ki.value-=100
											usr.overlays += 'icons/galicki.dmi'
											usr.kame = 1
											view(10) << 'sounds/ray_charge.wav'
											sleep(30)
											usr.overlays -= 'icons/galicki.dmi'
											view(10) << 'sounds/ray_fire.wav'
											var/damage=usr.ki.max_value/10 * 5
											missile('icons/fingerray.dmi', usr, M)
											sleep(5)
											if(!(M && usr)) return
											call(/RoundExplosion/proc/NDBlast)(M.loc,1,2)
											M.powerlevel.value-=damage
											usr.kame = 0
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											if(M.powerlevel.value<=0)
												M.Die(usr)
											if(usr.move==0) usr.move=1
										else
											alert("You do not have enough Ki to use this technique.")
											usr.kame = 0
					else
						usr << "<B>Target has gone out of sight or there isn't any targets near!"
						usr.kame = 0
obj
	techs
		laserf
			name = "Finger Laser"
			icon = 'icons/techhands.dmi'
			icon_state = "flaser"
			Click()
				if(usr.kame )
					usr << "<B>You are already using a technique."
				else
					usr.kame = 1
					var/mob/Target=input("Select a target.","Finger Laser","") as mob in oview(6)
					if((Target in oview(6)) && ismob(Target))
						var/mob/M = Target
						if(usr.zanzoken )
							alert("You can't use 'Finger Laser' while using Zanzoken.")
							usr.kame = 0
						else
							if(M.npc )
								usr << "<B>You can't attack NPCs."
								usr.kame = 0
							else
								if(usr.rest )
									usr << "<B>You can't use this technique while resting."
									usr.kame = 0
								else
									if(usr.meditate )
										usr << "<B>You can't use this technique while meditating."
										usr.kame = 0
									else
										if(usr.ki.value>=100)
											usr.ki.value-=100
											usr.overlays += 'icons/flashki.dmi'
											usr.kame = 1
											view(10) << 'sounds/ray_charge.wav'
											sleep(30)
											usr.overlays -= 'icons/flashki.dmi'
											view(10) << 'sounds/ray_fire.wav'
											var/damage=usr.ki.max_value/10 * 5
											missile('icons/fingerlaser.dmi', usr, M)

											sleep(5)
											M.powerlevel.value-=damage
											usr.kame = 0
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											if(M.powerlevel.value<=0)
												M.Die(usr)
											if(usr.move==0) usr.move=1
										else
											alert("You do not have enough Ki to use this technique.")
											usr.kame = 0
					else
						usr << "<B>Target has gone out of sight or there isn't any targets near!"
						usr.kame = 0
obj
	techs
		dodonpa
			name = "Dodonpa"
			icon = 'icons/techhands.dmi'
			icon_state = "flaser"
			Click()
				var/mob/Target=input("Select a target.","Dodonpa","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.zanzoken )
						alert("You can't use 'Dodonpa' while using Zanzoken.")
					else
						if(M.npc )
							usr << "<B>You can't attack NPCs."
						else
							if(usr.kame )
								usr << "<B>You are already using a technique."
							else
								if(usr.rest )
									usr << "<B>You can't use this technique while resting."
								else
									if(usr.meditate )
										usr << "<B>You can't use this technique while meditating."
									else
										if(usr.ki.value>=100)
											usr.ki.value-=100
											usr.overlays += 'icons/flashki.dmi'
											usr.kame = 1
											view(10) << 'sounds/ray_charge.wav'
											sleep(10)
											usr.overlays -= 'icons/flashki.dmi'
											view(10) << 'sounds/ray_fire.wav'
											var/damage=usr.ki.value/10 * 5 *(usr.focus.value*2)/usr.focus.max_value
											missile('icons/dodonpa.dmi', usr, M)
											sleep(5)
											M.powerlevel.value-=damage
											usr.kame = 0
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											if(M.powerlevel.value<=0)
												M.Die(usr)
											if(usr.move==0) usr.move=1
										else
											usr.kame = 0
											alert("You do not have enough Ki to use this technique.")
				else
					usr.kame = 0
					usr << "<B>Target has gone out of sight or there isn't any targets near!"
obj
	techs
		scatter
			name = "Scatter Shot"
			icon = 'icons/techhands.dmi'
			icon_state = "yewki"
			Click()
				usr << "Retired"
		/*
				if(usr.kame )
					alert("You can't use 'Scatter Shot' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Scatter Shot' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of Ki into this technique!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.frozen = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.ki.value -= amount
									view(6) << 'sounds/kicharge.wav'
									usr.overlays += 'icons/flashki.dmi'
									sleep(20)
									view(6) << 'sounds/renzoku.wav'
									usr.overlays -= 'icons/flashki.dmi'
									var/obj/sshot/blast = new(usr.loc)
									var/obj/sshot/blast2 = new(usr.loc)
									var/obj/sshot/blast3 = new(usr.loc)
									if(usr.dir == NORTH)
										blast.dir = NORTH
										blast2.dir = NORTHWEST
										blast3.dir = NORTHEAST
									if(usr.dir == SOUTH)
										blast.dir = SOUTH
										blast2.dir = SOUTHWEST
										blast3.dir = SOUTHEAST
									if(usr.dir == EAST)
										blast.dir = EAST
										blast2.dir = SOUTHEAST
										blast3.dir = NORTHEAST
									if(usr.dir == WEST)
										blast.dir = WEST
										blast2.dir = SOUTHWEST
										blast3.dir = NORTHWEST
									blast.power = amount * 1.1
									blast2.power = amount * 1.1
									blast3.power = amount * 1.1
									blast.killedBy = usr
									blast2.killedBy = usr
									blast3.killedBy = usr
									walk(blast,blast.dir)
									walk(blast2,blast2.dir)
									walk(blast3,blast3.dir)
									spawn(8)
										if(blast)
											blast.icon = 'icons/scattershot2.dmi'
										if(blast2)
											blast2.icon = 'icons/scattershot2.dmi'
										if(blast3)
											blast3.icon = 'icons/scattershot2.dmi'
									sleep(1)
									usr.move = 1
									usr.kame = 0
									usr.frozen = 0
									usr.attacking = 0
									usr.client.show_verb_panel = 1
									usr.hideipan = 0*/
obj
	sshot
		name = "Scatter Shot"
		icon = 'icons/scattershot.dmi'
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon )
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle:expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,4)
					Obstacle.Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,4)
					del(src)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,4)
					del(src)
obj
	techs
		eyelaser
			name = "Eye Laser"
			icon = 'icons/techhands.dmi'
			icon_state = "enr"
			Click()


				var/mob/Target=input("Select a target.","Eye Laser","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.zanzoken )
						alert("You can't use 'Eye Laser' while using Zanzoken.")
					else
						if(M.npc )
							usr << "<B>You can't attack NPCs."
						else
							if(usr.kame )
								usr << "<B>You are already using a technique."
							else
								if(usr.rest )
									usr << "<B>You can't use this technique while resting."
								else
									if(usr.meditate )
										usr << "<B>You can't use this technique while meditating."
									else
										if(usr.ki.value>=650)
											usr.ki.value-=650
											usr.kame = 1
											usr.overlays += 'icons/eyeki.dmi'
											view(6) << 'sounds/mas_charge.wav'
											sleep(35)
											view(6) << 'sounds/eye_fire.wav'
											usr.overlays -= 'icons/eyeki.dmi'
											var/damage=usr.ki.max_value/20 * 1.25
											missile('icons/eyelaser.dmi', usr, M)
											sleep(5)
											if(!(M && usr)) return
											call(/RoundExplosion/proc/NDBlast)(M.loc,1,2)
											M.powerlevel.value-=damage
											usr.kame = 0
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											if(M.powerlevel.value<=0)
												M.Die(usr)
											if(usr.move==0) usr.move=1
										else
											alert("You do not have enough Ki to use this technique.")
				else
					usr << "<B>Target has gone out of sight or there isn't any targets near!"

obj
	items
		proc/Restore(mob/M)
			if(worn)
				M.overlays += icon

		fusion
			name = "Fusion Earrings"
			icon = 'icons/poratta.dmi'
			value = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.poratta = 0
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
						usr.poratta = 1
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Fuse()
					set category = null
					switch(alert("What do wish to do?","Fusion Options","Fuse","Avaliable to Fuse","Unavaliable to Fuse"))
						if("Fuse")
							var/mob/M
							for(var/mob/O in get_step(usr,usr.dir))
								M = O
							if(M)
								if(M.poratta )
									if(M.fuseavail )
										if(M.name == usr.name)
											usr.powerlevel.value += 0
										else if(usr.used  || M.used )
											usr << "Please wait a moment"
											return
										else
											switch(input(M,"Would you like to fuse with [usr]?","Fusion",text) in list("No","Yes"))
												if("No")
													usr << "\red [M] has declined to fuse with you!"
													return
												if("Yes")
													switch(alert(M,"Are you sure you want to fuse with [usr]?","Fusion","No","Yes"))
														if("No")
															usr << "\red [M] has declined to fuse with you!"
															return
														if("Yes")
															usr.used = 1
															M.used = 1
															if(M.fused !=1 && !usr.fused)
																var/fusedname = copytext(usr.name, 1, lentext(usr.name)/2+1) + copytext(M.name, lentext(M.name)/2, lentext(M.name)+1)
																usr.random = rand(1,2)
																M.client.SaveMob()
																usr.client.SaveMob()
																usr.overlays.Cut()
																usr.underlays.Cut()
																usr.fused = 1
																M.fused = 1
																usr.hairrestore()
																players << "<B><FONT COLOR = BLUE>[M] and [usr] fuse with the Fusion Earrings to create [fusedname]!!"
																M.icon = ""
																M.density = 0
																M.move = 0
																M.dead = 0
																M.name = "[fusedname]([M.key])"
																usr.name = "[fusedname]([usr.key])"
																usr.CreateName()
																usr.contents += M.contents
																if(usr.race == "Saiyan" && M.race == "Saiyan")
																	var/obj/techs/BKB = new /obj/techs/BBK
																	usr.contents += BKB
																if((usr.race == "Android (Mechanical)" && M.race == "Android (Biological)")||(M.race == "Android (Mechanical)" && usr.race == "Android (Biological)"))
																	var/obj/techs/Spr = new /obj/techs/Spear
																	usr.contents += Spr
																usr.zenni += M.zenni
																var/obj/items/F1 = new /obj/items/fusion
																M.overlays.Cut()
																M.underlays.Cut()
																M.loc=usr
																M.client.eye = usr
																usr.overlays += F1.icon
																F1.worn = 1
																usr.contents += F1
																usr.ki.max_value += M.ki.max_value
																usr.powerlevel.max_value += M.powerlevel.max_value
																usr.ki.max_value = usr.ki.max_value * 4
																usr.powerlevel.max_value = usr.powerlevel.max_value * 4
																usr.powerlevel.value = usr.powerlevel.max_value
																usr.ki.value = usr.ki.max_value
																usr.newb = 0
																usr.zenni = 0
																usr.bzenni = 0
																M.zenni = 0
																M.bzenni = 0
																M.newb = 0
																M.hideipan = 1
																M.powerlevel.max_value = 1
																M.powerlevel.value = 1
																M.ki.max_value = 1
																M.ki.value = 1
																M.client.show_verb_panel = 0
																M.invisibility = 1
																M.kame = 1
																usr.used = 0
																M.used = 0
																M.attacking = 1
																if(M.race == "Half-Saiyan" && usr.race == "Half-Saiyan")
																	var/rp = rand(1.3)
																	if(rp )
																		M.race = "Saiyan"
																		usr.race = "Saiyan"
																	if(rp == 2)
																		M.race = "Half-Saiyan"
																		usr.race = "Half-Saiyan"
																	if(rp == 3)
																		M.race = "Earthling"
																		usr.race = "Earthling"
																if(M.race == "Buu" && (usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Half-Saiyan"||usr.race == "Android (Mechanical)"))
																	var/newicon = 'icons/bioandroid-two.dmi'
																	newicon += rgb(255,175,255)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M.race = "Fused"
																	usr.race = "Fused"
																if(usr.race == "Buu" && (M.race == "Earthling"||M.race == "Saiyan"||M.race == "Half-Saiyan"||M.race == "Android (Mechanical)"))
																	var/newicon = 'icons/bioandroid-two.dmi'
																	newicon += rgb(255,175,255)
																	M.race = "Fused"
																	usr.race = "Fused"
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(findtext(M.race,"Wizard") && (usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Half-Saiyan"||usr.race == "Android (Mechanical)"))
																	var/newicon = 'icons/bioandroid-two.dmi'
																	newicon += rgb(0,160,0)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M.race = "Fused"
																	usr.race = "Fused"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(findtext(usr.race,"Wizard")&& (M.race == "Earthling"||M.race == "Saiyan"||M.race == "Half-Saiyan"||M.race == "Android (Mechanical)"))
																	var/newicon = 'icons/bioandroid-two.dmi'
																	newicon += rgb(0,160,0)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	M.race = "Fused"
																	usr.race = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(usr.race == "Buu" && M.race == "Android (Biological)")
																	var/newicon = 'icons/biocell3.dmi'
																	newicon += rgb(230,145,230)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	M.race = "Fused"
																	usr.race = "Fused"
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(M.race == "Buu" && usr.race == "Android (Biological)")
																	var/newicon = 'icons/biocell3.dmi'
																	newicon += rgb(230,145,230)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M.race = "Fused"
																	usr.race = "Fused"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(usr.race == "Namek"&& (M.race == "Earthling"||M.race == "Saiyan"||M.race == "Half-Saiyan"||M.race == "Android (Mechanical)"))
																	var/newicon = usr.icon
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M.race = "Fused"
																	usr.race = "Fused"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if(M.race == "Namek" && (usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Half-Saiyan"||usr.race == "Android (Mechanical)"))
																	var/newicon = usr.icon
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M.race = "Fused"
																	usr.race = "Fused"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																if((usr.race == "Saiyan"||usr.race == "Earthling"||usr.race == "Android (Mechanical)"||usr.race == "Half-Saiyan") && M.race == "Android (Biological)")
																	var/newicon = 'icons/biocell3.dmi'
																	newicon += rgb(244,166,86)
																	usr.icon = newicon
																	usr.oicon = usr.icon
																	usr.skin = "Fused"
																	M.race = "Fused"
																	usr.race = "Fused"
																	usr << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
																	M << "<B><FONT COLOR = GREEN>Your mix of races cause a difference in appearence!"
														else
															usr.used = 0
															M.used = 0
															alert("Someone is already fused!")

									else
										alert("That person is not avaliable to fuse!")
							else
								alert("You must face your partner!")

						if("Avaliable to Fuse")
							usr.fuseavail = 1
							alert("You are now avaliable to fuse.")

						if("Unavaliable to Fuse")
							usr.fuseavail = 0
							alert("You are not avaliable to fuse.")

obj
	transes
		mystic
			name = "Mystic"
			icon = 'icons/techhands.dmi'
			icon_state = "pwup"
			Click()
				//for(var/obj/transes/ssj/S in usr.contents)
					//del(S)
					//continue
				//for(var/obj/transes/giji/G in usr.contents)
					//del(G)
					//continue


				if(usr.state == "Normal"||usr.state == "Mystic")
					if(usr.transforming ||usr.grav > 0)
						alert("You can not transform/revert right now")
					else
						usr.transforming = 1
						if(usr.state == "Normal")
							switch(alert("What do you wish to do?","Mystic","Transform", "Cancel"))
								if("Cancel")
									usr.transforming = 0
									..()
								if("Transform")
									if(usr.powerlevel.max_value >= 19000000)
										if(usr.meditate  || usr.rest )
											alert("You can not transform while meditating or resting")
											usr.transforming = 0
										else
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Mystic!</FONT><font color = green> *</FONT>"
											usr.lspecial = 1
											usr.move = 0
											usr.wspecial = 1
											usr.dseffect()
											usr.windeffect()
											usr.purplightningrand()
											usr.overlays += 'icons/mysticenrgy.dmi'
											usr.overlays += 'icons/wind.dmi'
											usr.icon_state = "ssj"
											view(25) << 'sounds/mystic_trans.wav'
											sleep(60)
											usr.move = 1
											view(10) << 'sounds/lssj_trans2.wav'
											usr.overlays -= 'icons/mysticenrgy.dmi'
											usr.overlays -= 'icons/wind.dmi'
											usr.icon_state = ""
											usr.mystlightning()
											usr.state = "Mystic"
											usr.underlays += /obj/MysticAuraTop
											usr.underlays += /obj/MysticAuraBottom
											usr.powerlevel.value = usr.powerlevel.max_value * 7.25
											usr.ki.value = usr.ki.max_value * 7.25
											usr.transforming = 0
											usr.state = "Mystic"
											usr.tiredmys()
									else
										usr << "<B>You are too weak to transform!"
						if(usr.state == "Mystic")
							switch(alert("What do you wish to do?","Mystic","Revert", "Cancel"))
								if("Revert")
									view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
									view(5) << 'sounds/revert.wav'
									usr.lspecial = 0
									usr.wspecial = 0
									usr.lightning = 0
									usr.underlays -= /obj/MysticAuraBottom
									usr.underlays -= /obj/MysticAuraTop
									usr.overlays -= 'icons/mysticelec.dmi'
									usr.state = "Normal"
									usr.transforming = 0
									if(usr.powerlevel.value >= usr.powerlevel.max_value)
										usr.powerlevel.value = usr.powerlevel.max_value
									if(usr.ki.value >= usr.ki.max_value)
										usr.ki.value = usr.ki.max_value

								if("Cancel")
									usr.transforming = 0
									..()

				else
					usr.transforming = 0
					..()


mob/proc
	tiredmys()
		spawn()
			set background = 1
			while(src.state == "Mystic")
				sleep(rand(200,800))
				stamina.value -= (rand(1,4))
				if(stamina.value <= 0)
					oview(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src.name] begins to revert from [src.state]!</FONT><font color = green> *</FONT>"
					view(5) << 'sounds/revert.wav'
					usr << "<FONT COLOR = GREEN><B>You revert from 'Mystic' because of the strain on your body."
					lspecial = 0
					wspecial = 0
					underlays -= /obj/MysticAuraBottom
					underlays -= /obj/MysticAuraTop
					overlays -= 'icons/mysticelec.dmi'
					state = "Normal"
					if(powerlevel.value >= powerlevel.max_value)
						powerlevel.restore()
					if(ki.value >= ki.max_value)
						ki.restore()
					transforming = 0
					break

obj/sbombenrgy
	name = "Energy"
	icon = 'icons/sbombenrgy.dmi'
	icon_state = ""
	density = 0
	layer = 9

obj/sbombenrgy2
	name = "Energy"
	icon = 'icons/sbombenrgy.dmi'
	icon_state = "2"
	density = 0
	layer = 9

mob
	proc
		sbombenergy(var/O)
			spawn()
				set background = 1
				while(src.especial )
				{
					var/spot1 = src.x + (rand(-12,12))
					var/spot2 = src.y + (rand(-12,12))
					var/spot3 = src.x + (rand(-12,12))
					var/spot4 = src.y + (rand(-12,12))
					var/obj/sbombenrgy/eff1 = new(locate(spot1, spot2, src.z))
					var/obj/sbombenrgy2/eff2 = new(locate(spot3, spot4, src.z))
					missile(/obj/sbombenrgy,eff1,O)
					missile(/obj/sbombenrgy2,eff2,O)
					del(eff1)
					del(eff2)
					sleep(5)
				}

obj/flyingrocks
	name = "Rocks"
	icon = 'icons/rocks.dmi'
	icon_state = "2"
	density = 0
	layer = 9

mob
	proc
		flyingrocks()
			set background = 1
			spawn()
				if(src.dspecial )
					var/spot1 = src.x + (rand(-12,12))
					var/spot2 = src.y + (rand(-12,12))
					if(spot2 <= 1)
						spot2 = 1
					if(spot1 <= 1)
						spot1 = 1
					if(spot2 <= 149)
						spot2 = 149
					if(spot1 <= 149)
						spot1 = 149
					var/obj/flyingrocks/rocks = new(locate(spot1,spot2,src.z))
					rocks.dir = NORTH
					walk(rocks, rocks.dir)
					spawn(5)
						src.flyingrocks()
					sleep(18)
					del(rocks)
				else
					src.powerlevel.value += 0

mob
	proc
		meleehit()
			set background = 1
			spawn()
				if(src)
					var/obj/flicker/flicker1 = new(locate(src.x-1,src.y-1,src.z))
					flicker1.dir = SOUTHWEST
					var/obj/flicker/flicker2 = new(locate(src.x+1,src.y-1,src.z))
					flicker2.dir = SOUTHEAST
					var/obj/flicker/flicker3 = new(locate(src.x-1,src.y+1,src.z))
					flicker3.dir = NORTHWEST
					var/obj/flicker/flicker4 = new(locate(src.x+1,src.y+1,src.z))
					flicker4.dir = NORTHEAST
					sleep(5)
					step(flicker1, flicker1.dir)
					step(flicker2, flicker2.dir)
					step(flicker3, flicker3.dir)
					step(flicker4, flicker4.dir)
					sleep(5)
					del(flicker1)
					del(flicker2)
					del(flicker3)
					del(flicker4)
					//del(flicker1)
					//del(flicker2)
					//del(flicker3)
					//del(flicker4)
					//del(flicker1)
					//del(flicker2)
					//del(flicker3)
					//del(flicker4)
				else
					for(var/obj/flicker/Z in world)
						if(Z)
							del(Z)
					..()

mob
	proc
		windeffect()
			set background = 1
			spawn()
				while(src.wspecial )
				{
					var/obj/mysticwind/wind1 = new(locate(src.x,src.y-1,src.z))
					wind1.dir = SOUTH
					walk(wind1, wind1.dir)
					var/obj/mysticwind/wind2 = new(locate(src.x,src.y+1,src.z))
					wind2.dir = NORTH
					walk(wind2, wind2.dir)
					var/obj/mysticwind/wind3 = new(locate(src.x+1,src.y,src.z))
					wind3.dir = EAST
					walk(wind3, wind3.dir)
					var/obj/mysticwind/wind4 = new(locate(src.x-1,src.y,src.z))
					wind4.dir = WEST
					walk(wind4, wind4.dir)
					var/obj/mysticwind/wind5 = new(locate(src.x-1,src.y-1,src.z))
					wind5.dir = SOUTHWEST
					walk(wind5, wind5.dir)
					var/obj/mysticwind/wind6 = new(locate(src.x+1,src.y-1,src.z))
					wind6.dir = SOUTHEAST
					walk(wind6, wind6.dir)
					var/obj/mysticwind/wind7 = new(locate(src.x-1,src.y+1,src.z))
					wind7.dir = NORTHWEST
					walk(wind7, wind7.dir)
					var/obj/mysticwind/wind8 = new(locate(src.x+1,src.y+1,src.z))
					wind8.dir = NORTHEAST
					walk(wind8, wind8.dir)
					sleep(1)
					var/obj/mysticwind/wind9 = new(locate(src.x,src.y-1,src.z))
					wind9.dir = SOUTH
					walk(wind9, wind9.dir)
					var/obj/mysticwind/wind10 = new(locate(src.x,src.y+1,src.z))
					wind10.dir = NORTH
					walk(wind10, wind10.dir)
					var/obj/mysticwind/wind11 = new(locate(src.x+1,src.y,src.z))
					wind11.dir = EAST
					walk(wind11, wind11.dir)
					var/obj/mysticwind/wind12 = new(locate(src.x-1,src.y,src.z))
					wind12.dir = WEST
					walk(wind12, wind12.dir)
					var/obj/mysticwind/wind13 = new(locate(src.x-1,src.y-1,src.z))
					wind13.dir = SOUTHWEST
					walk(wind13, wind13.dir)
					var/obj/mysticwind/wind14 = new(locate(src.x+1,src.y-1,src.z))
					wind14.dir = SOUTHEAST
					walk(wind14, wind14.dir)
					var/obj/mysticwind/wind15 = new(locate(src.x-1,src.y+1,src.z))
					wind15.dir = NORTHWEST
					walk(wind15, wind15.dir)
					var/obj/mysticwind/wind16 = new(locate(src.x+1,src.y+1,src.z))
					wind16.dir = NORTHEAST
					walk(wind16, wind16.dir)
					spawn(rand(10,50))
						del(wind1)
						del(wind2)
						del(wind3)
						del(wind4)
						del(wind5)
						del(wind6)
						del(wind7)
						del(wind8)
						del(wind9)
						del(wind10)
						del(wind11)
						del(wind12)
						del(wind13)
						del(wind14)
						del(wind15)
						del(wind16)
					sleep(rand(100,400))
				}

mob
	proc
		dseffect()
			spawn()
				set background = 1
				src << "<B>A cloud of dust surrounds you!"
				var/obj/dusteffect/dust1 = new(locate(src.x,src.y-1,src.z))
				dust1.dir = SOUTH
				var/obj/dusteffect/dust2 = new(locate(src.x,src.y+1,src.z))
				dust2.dir = NORTH
				var/obj/dusteffect/dust3 = new(locate(src.x+1,src.y,src.z))
				dust3.dir = EAST
				var/obj/dusteffect/dust4 = new(locate(src.x-1,src.y,src.z))
				dust4.dir = WEST
				var/obj/dusteffect/dust5 = new(locate(src.x-1,src.y-1,src.z))
				dust5.dir = SOUTHWEST
				var/obj/dusteffect/dust6 = new(locate(src.x+1,src.y-1,src.z))
				dust6.dir = SOUTHEAST
				var/obj/dusteffect/dust7 = new(locate(src.x-1,src.y+1,src.z))
				dust7.dir = NORTHWEST
				var/obj/dusteffect/dust8 = new(locate(src.x+1,src.y+1,src.z))
				dust8.dir = NORTHEAST
				sleep(50)
				src << "<B>The cloud of dust dissappates!"
				del(dust1)
				del(dust2)
				del(dust3)
				del(dust4)
				del(dust5)
				del(dust6)
				del(dust7)
				del(dust8)

mob
	proc
		dseffect2()
			spawn()
				set background = 1
				src << "<B>A cloud of dust surrounds you!"
				var/obj/dusteffect/dust1 = new(locate(src.x,src.y-1,src.z))
				dust1.dir = SOUTH
				var/obj/dusteffect/dust2 = new(locate(src.x,src.y+1,src.z))
				dust2.dir = NORTH
				var/obj/dusteffect/dust3 = new(locate(src.x+1,src.y,src.z))
				dust3.dir = EAST
				var/obj/dusteffect/dust4 = new(locate(src.x-1,src.y,src.z))
				dust4.dir = WEST
				var/obj/dusteffect/dust5 = new(locate(src.x-1,src.y-1,src.z))
				dust5.dir = SOUTHWEST
				var/obj/dusteffect/dust6 = new(locate(src.x+1,src.y-1,src.z))
				dust6.dir = SOUTHEAST
				var/obj/dusteffect/dust7 = new(locate(src.x-1,src.y+1,src.z))
				dust7.dir = NORTHWEST
				var/obj/dusteffect/dust8 = new(locate(src.x+1,src.y+1,src.z))
				dust8.dir = NORTHEAST
				sleep(25)
				src << "<B>The cloud of dust dissappates!"
				del(dust1)
				del(dust2)
				del(dust3)
				del(dust4)
				del(dust5)
				del(dust6)
				del(dust7)
				del(dust8)
obj
	dusteffect
		name = "Dust"
		icon = 'icons/dustaura.dmi'
		icon_state = ""
		density = 0
		layer = 2


obj
	mysticwind
		name = "Wind"
		icon = 'icons/windeffect.dmi'
		icon_state = ""
		density = 0
		layer = 9
		Bump(O)
			del(src)
		New()
			. = ..()
			spawn(100)
				del(src)


obj
	transes
		snj
			name = "Super Namek"
			icon = 'icons/techhands.dmi'
			icon_state = "snj"
			Click()


				if(usr.transforming ||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					if(usr.race == "Namek")
						usr.transforming = 1
						if(usr.state == "Normal"||usr.state == "Super Namek")
							if(usr.state == "Normal")
								switch(alert("What do you wish to do?","Super Namek","Transform", "Cancel"))
									if("Cancel")
										usr.transforming = 0
										..()
									if("Transform")
										if(usr.powerlevel.max_value >= 1200000)
											if(usr.meditate  || usr.rest )
												alert("You can not transform while meditating or resting")
												usr.transforming = 0
											else
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into a Super Namek!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/namek_transform.wav'
												usr.overlays += 'icons/wind.dmi'
												usr.icon_state = "ssj"
												usr.dspecial = 1
												usr.flyingrocks()
												usr.dseffect()
												sleep(65)
												usr.overlays -= 'icons/wind.dmi'
												flick("trans", usr)
												usr.icon = 'icons/namek.dmi'
												sleep(25)
												usr.underlays += /obj/MysticAuraBottom
												usr.underlays += /obj/MysticAuraTop
												view(10) << 'sounds/namek_trans2.wav'
												usr.powerlevel.value = usr.powerlevel.max_value * 4
												usr.ki.value = usr.ki.max_value * 6
												usr.state = "Super Namek"
												usr.transforming = 0
												spawn(22)
													bwipeeffect(usr.z)
												usr.tiredsnj()
										else
											usr << "<B>You are too weak to transform!"
											usr.transforming = 0
							if(usr.state == "Super Namek")
								switch(alert("What do you wish to do?","Super Namek","Revert", "Cancel"))
									if("Cancel")
										usr.transforming = 0
										..()
									if("Revert")
										if(usr.state == "Normal")
											usr << "You are already reverted from the Super Namek form."
											usr.transforming = 0
										else
											if(usr.state == "Super Namek")
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] reverts from Super Namek!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/revert.wav'
												if(usr.skin == "Green")
													usr.icon = 'icons/namek.dmi'
												if(usr.skin == "Dark Green")
													usr.icon = 'icons/namek-dark.dmi'
												usr.dspecial = 0
												usr.underlays -= /obj/MysticAuraBottom
												usr.underlays -= /obj/MysticAuraTop
												usr.state = "Normal"
												if(usr.powerlevel.value >= usr.powerlevel.max_value)
													usr.powerlevel.value = usr.powerlevel.max_value
												if(usr.ki.value >= usr.ki.max_value)
													usr.ki.value = usr.ki.max_value
												usr.transforming = 0
											else
												alert("You can only use this Revert for Super Namek!")
												usr.transforming = 0

					else
						usr << "<B>Only Nameks can use this transformation!"
						usr.transforming = 0
						del(src)

mob/proc
	tiredsnj()
		spawn()
			set background = 1
			while(state == "Super Namek")
				sleep(rand(200,800))
				stamina.value -= (rand(1,3))
				if(stamina.value <= 0)
					oview(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] reverts from Super Namek!</FONT><font color = green> *</FONT>"
					view(10) << 'sounds/revert.wav'
					usr << "<B><FONT COLOR = GREEN>You revert from '[state]' because of the strain on your body."
					if(skin == "Green")
						icon = 'icons/namek.dmi'
					if(skin == "Dark Green")
						icon = 'icons/namek-dark.dmi'
					underlays -= /obj/MysticAuraBottom
					underlays -= /obj/MysticAuraTop
					state = "Normal"
					if(powerlevel.value >= powerlevel.max_value)
						powerlevel.restore()
					if(ki.value >= ki.max_value)
						ki.restore()
					transforming = 0
					break

obj
	transes
		supera
			name = "Super Android"
			icon = 'icons/techhands.dmi'
			icon_state = "kk"
			Click()


				if(usr.transforming == 1||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					usr.transforming = 1
					if(usr.upgrade != 1)
						alert("You can't use this!")
					else
						if(usr.race == "Android (Mechanical)")
							if(usr.state == "Normal"||usr.state == "Super Android")
								if(usr.state == "Normal")
									switch(alert("What do you wish to do?","Super Android","Transform", "Cancel"))
										if("Transform")
											if(usr.meditate == 1 || usr.rest == 1)
												alert("You can not transform while meditating or resting")
												usr.transforming = 0
											else
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to transform into Super Android!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/s17trans2.wav'
												usr.overlays += 'icons/aegetapowerup.dmi'
												usr.icon_state = "ssj"
												usr.lightningrand2()
												usr.lspecial = 1
												sleep(42)
												usr.icon_state = ""
												usr.overlays -= 'icons/aegetapowerup.dmi'
	//											usr.overlays += 'medwind.dmi'
												usr.overlays += new /obj/kkauratop
												usr.underlays += new /obj/kkaurabottom
												view(10) << 'sounds/s17trans.wav'
												usr.powerlevel.value = usr.powerlevel.max_value * 7.25
												usr.ki.value = usr.ki.max_value * 7.25
												usr.transforming = 0
												usr.state = "Super Android"
												spawn(8)
													bwipeeffect(usr.z)

										if("Cancel")
											usr.transforming = 0
											..()

								if(usr.state == "Super Android")
									switch(alert("What do you wish to do?","Super Android","Revert", "Cancel"))
										if("Revert")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
											view(6) << 'sounds/revert.wav'
											usr.lspecial = 0
											usr.overlays -= /obj/kkauratop
											usr.underlays -= /obj/kkaurabottom
	//										usr.overlays -= 'medwind.dmi'
	//										usr.overlays -= 'medwind.dmi'
	//										usr.overlays -= 'medwind.dmi'
	//										usr.overlays -= 'medwind.dmi'
											usr.state = "Normal"
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.ki.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
											usr.transforming = 0
										if("Cancel")
											usr.transforming = 0
											..()

							else
								..()
						else
							usr << "<B>Only Upgraded Changlings and Mechanical Androids can use this!"
							usr.transforming = 0
							del(src)

	transes
		ubuu
			name = "Reincarnation"
			icon = 'icons/techhands.dmi'
			icon_state = "kk"
			Click()


				if(usr.transforming ||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					usr.transforming = 1
					if(usr.race == "Buu"||usr.race == "Earthling")
						if(usr.state == "Normal"||usr.state == "Ubuu")
							if(usr.state == "Normal")
								switch(alert("What do you wish to do?","Ubuu","Transform", "Cancel"))
									if("Transform")
										if(usr.meditate  || usr.rest )
											alert("You can not transform while meditating or resting")
											usr.transforming = 0
										else
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to reincarnate into Ubuu!</FONT><font color = green> *</FONT>"
											view(10) << 'sounds/buu_trans.wav'
											usr.overlays += 'icons/aegetapowerup.dmi'
											usr.icon_state = "ssj"
											usr.lightningrand2()
											usr.lspecial = 1
											usr.overlays += 'icons/medwind.dmi'
											usr.overlays += new /obj/kkauratop
											usr.underlays += new /obj/kkaurabottom
											sleep(125)
											usr.icon_state = ""
											usr.overlays -= 'icons/aegetapowerup.dmi'
											view(10) << 'sounds/buu_trans2.wav'
											usr.powerlevel.value = usr.powerlevel.max_value * 7
											usr.overlays -= /obj/kkauratop
											usr.underlays -= /obj/kkaurabottom
											usr.overlays -= 'icons/medwind.dmi'
											usr.ki.value = usr.ki.max_value * 7
											usr.transforming = 0
											usr.state = "Ubuu"
											usr.icon = 'icons/Ubuu.dmi'

									if("Cancel")
										usr.transforming = 0
										..()

							if(usr.state == "Ubuu")
								switch(alert("What do you wish to do?","Ubuu","Revert", "Cancel"))
									if("Revert")
										view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to reincarnate from Ubuu back to a(n) [usr.race]!</FONT><font color = green> *</FONT>"
										view(6) << 'sounds/revert.wav'
										usr.lspecial = 0
										usr.state = "Normal"
										if(usr.powerlevel.value >= usr.powerlevel.max_value)
											usr.powerlevel.value = usr.powerlevel.max_value
										if(usr.ki.value >= usr.ki.max_value)
											usr.ki.value = usr.ki.max_value
										usr.transforming = 0
										if(usr.race == "Earthling")
											usr.skinrestore()
											usr.hairrestore()
										if(usr.race == "Buu")
											usr.icon = 'icons/buu.dmi'

									if("Cancel")
										usr.transforming = 0
										..()

						else
							..()
					else
						usr << "<B>Only Buus and Earthlings can use this!"
						usr.transforming = 0
						del(src)

obj
	transes
		superh
			name = "Super Human"
			icon = 'icons/techhands.dmi'
			icon_state = "pwdn"
			Click()


				if(usr.transforming ||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					usr.transforming = 1
					if(usr.race == "Earthling")
						if(usr.state == "Normal"||usr.state == "Super Human")
							if(usr.state == "Normal")
								switch(alert("What do you wish to do?","Super Human","Transform", "Cancel"))
									if("Cancel")
										usr.transforming = 0
										return
									if("Transform")
										if(usr.powerlevel.max_value >= 400000)
											if(usr.ssjfp == 0)
												if(usr.meditate  || usr.rest )
													alert("You can not transform while meditating or resting")
													usr.transforming = 0
												else
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Human!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/superh1.wav'
													usr.overlays += 'icons/wind.dmi'
													usr.icon_state = "ssj"
													usr.dspecial = 1
													usr.move = 0
													usr.flyingrocks()
													usr.dseffect()
													sleep(32)
													usr << "<B><FONT COLOR = RED>Your clothes rip apart!"
													usr.overlays.Cut()
													usr.underlays.Cut()
													usr.icon_state = ""
													usr.move = 1
													usr.transforming = 0
													usr.hairrestore()
													usr.CreateName()
													if(usr.majined )
														usr.overlays += 'icons/M.dmi'
													usr.overlays -= 'icons/wind.dmi'
													view(10) << 'sounds/superh2.wav'
													usr.icon = 'icons/superhuman-male.dmi'
													usr.powerlevel.value = usr.powerlevel.max_value * 3
													usr.ki.value = usr.ki.max_value * 3
													usr.state = "Super Human"
													if(usr.dead )
														usr.overlays += 'icons/halo.dmi'
													//spawn(8)
														//bwipeeffect(usr.z)
													usr.tiredsh()
													if(usr.ssjfpt == null)
														usr.ssjfpt = 24000
													usr.ssjfullpower()
											else
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Human (Full Power)!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/superh1.wav'
												usr.overlays += 'icons/wind.dmi'
												usr.icon_state = "ssj"
												usr.dspecial = 1
												usr.move = 0
												usr.flyingrocks()
												usr.dseffect()
												sleep(15)
												usr << "<B><FONT COLOR = RED>Your clothes just barely held on!"
												usr.icon_state = ""
												usr.move = 1
												usr.transforming = 0
												usr.hairrestore()
												usr.CreateName()
												if(usr.majined )
													usr.overlays += 'icons/M.dmi'
												usr.overlays -= 'icons/wind.dmi'
												view(10) << 'sounds/superh2.wav'
												usr.icon = 'icons/superhuman-male.dmi'
												usr.powerlevel.value = usr.powerlevel.max_value * 4
												usr.ki.value = usr.ki.max_value * 4
												usr.state = "Super Human"
												if(usr.dead )
													usr.overlays += 'icons/halo.dmi'
										else
											usr << "<B>You are too weak to transform!"
											usr.transforming = 0
							if(usr.state == "Super Human")
								switch(alert("What do you wish to do?","Super Human","Revert", "Cancel"))
									if("Cancel")
										usr.transforming = 0
										return
									if("Revert")
										view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
										view(10) << 'sounds/revert.wav'
										usr.dspecial = 0
										usr.state = "Normal"
										if(usr.powerlevel.value >= usr.powerlevel.max_value)
											usr.powerlevel.value = usr.powerlevel.max_value
										if(usr.ki.value >= usr.ki.max_value)
											usr.ki.value = usr.ki.max_value
										usr.transforming = 0
										usr.skinrestore()
						else
							usr.transforming = 0
							..()
					else
						usr << "<B>Only Earthlings can use this!"
						usr.transforming = 0
						//del(src)


mob/proc
	tiredsh()
		spawn()
			set background = 1
			while(state == "Super Human")
				sleep(rand(200,400))
				stamina.value -= (rand(1,4))
				if(stamina.value <= 0)
					oview(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to revert from [src.state]!</FONT><font color = green> *</FONT>"
					view(10) << 'sounds/revert.wav'
					dspecial = 0
					usr << "<B><FONT COLOR = GREEN>You revert from 'Super Human' because of the strain on your body!"
					transforming = 0
					skinrestore()
					state = "Normal"
					if(powerlevel.value >= src.powerlevel.max_value)
						powerlevel.restore()
					if(ki.value >= ki.max_value)
						ki.restore()
					break

obj
	transes
		giji
			name = "Giji Super Saiyan"
			icon = 'icons/techhands.dmi'
			icon_state = "ssj"
			Click()


				if(usr.babylearn || usr.mystlearn)
					usr << "You are not suppose to have this!"
					del(src)
				if(usr.transforming ||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					usr.transforming = 1
					if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
						if(usr.meditate  || usr.rest )
							alert("You can not transform while meditating or resting")
							usr.transforming = 0
						else
							if(usr.state == "Normal"||usr.state == "Giji Super Saiyan")
								if(usr.state == "Normal")
									switch(alert("What do you wish to do?","Giji Super Saiyan","Transform", "Cancel"))
										if("Transform")
											if(usr.powerlevel.max_value >= 400000)
												if(usr.meditate  || usr.rest )
													alert("You can not transform while meditating or resting")
													usr.transforming = 0
												else
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Giji Super Saiyan!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/ssj_trans2.wav'
													usr.underlays += /obj/SSAuraBottom
													usr.overlays += /obj/SSAuraTop
													usr.powerlevel.value = usr.powerlevel.max_value * 1.5
													usr.ki.value = usr.ki.max_value * 1.25
													usr.state = "Giji Super Saiyan"
													usr.transforming = 0
											else
												usr << "<B>You are too weak to transform!"
												usr.transforming = 0

										if("Cancel")
											usr.transforming = 0
											..()

								if(usr.state == "Giji Super Saiyan")
									switch(alert("What do you wish to do?","Giji Super Saiyan","Revert", "Cancel"))
										if("Cancel")
											usr.transforming = 0
											..()
										if("Revert")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
											view(10) << 'sounds/revert.wav'
											if(usr.skin == "White (Pale)")
												usr.icon = 'icons/male-white.dmi'
											if(usr.skin == "Tan")
												usr.icon = 'icons/male.dmi'
											if(usr.skin == "Dark Brown")
												usr.icon = 'icons/male-black.dmi'
											if(usr.skin == "Olive")
												usr.icon = 'icons/male-olive.dmi'
											usr.underlays -= /obj/SSAuraBottom
											usr.overlays -= /obj/SSAuraTop
											usr.state = "Normal"
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.ki.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
											usr.transforming = 0

							else
								usr.transforming = 0
								..()

					else
						usr << "<B>Only Saiyans and Half-Saiyans can use this!"
						usr.transforming = 0
						del(src)

mob/proc
	tiredgssj()
		spawn()
			set background = 1
			while(src.state == "Giji Super Saiyan")
				sleep(rand(10,200))
				stamina.value -= rand(10,25)
				if(stamina.value <= 0)
					oview(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to revert from [src.state]!</FONT><font color = green> *</FONT>"
					view(10) << 'sounds/revert.wav'
					usr << "<B><FONT COLOR = GREEN>You revert from 'Giji Super Saiyan' because of the strain on your body."
					underlays -= /obj/SSAuraBottom
					overlays -= /obj/SSAuraTop
					state = "Normal"
					if(powerlevel.value >= powerlevel.max_value)
						powerlevel.restore()
					if(ki.value >= ki.max_value)
						ki.restore()
					transforming = 0


obj
	transes
		lssj
			name = "Legendary Super Saiyan"
			icon = 'icons/techhands.dmi'
			icon_state = "ssj"
			Click()


				if(usr.brollievent != 1 && usr.gm != 1)
					usr <<"<b>YOU CAN NOT USE THIS!!! YOU HAVE NOT COMPLETED THE BROLLI EVENT!!!"
					del(src)
				else
					if(usr.transforming ||usr.grav > 0)
						alert("You can not transform/revert right now")
					else
						usr.transforming = 1
						if(usr.meditate  || usr.rest )
							alert("You can not transform while meditating or resting")
							usr.transforming = 0
						else
							if(usr.state == "Normal"||usr.state == "Legendary Super Saiyan")
								if(usr.state == "Normal")
									switch(alert("What do you wish to do?","Legendary Super Saiyan","Transform", "Cancel"))
										if("Transform")
											if(usr.state == "Normal")
												if(usr.meditate || usr.rest)
													alert("You can not transform while meditating or resting")
													usr.transforming = 0
												else
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Legendary Super Saiyan!</FONT><font color = green> *</FONT>"
													view(25) << 'sounds/lssj_trans1.wav'
													usr.overlays += 'icons/wind.dmi'
													usr.lssjlightning()
													usr.icon_state = "ssj"
													usr.lightningrand()
													usr.lspecial = 1
													usr.dspecial = 1
													usr.flyingrocks()
													usr.dseffect()
													Quake_Effect_View(usr, 100, 3)
													usr.move = 0
													sleep(30)
													usr.underlays += /obj/SSAuraBottom
													usr.overlays += /obj/SSAuraTop
													sleep(65)
													view(25) << 'sounds/lssj_trans2.wav'
													spawn(26)
														bwipeeffect(usr.z)
													usr.move = 1
													usr.lspecial = 0
													usr.lspecial = 1
													usr.dspecial = 0
													usr.dspecial = 1
													usr.icon_state = ""
													usr.overlays -= 'icons/wind.dmi'
													usr.hairremoval()
													usr.overlays += 'icons/hair_legendary_super_Saiyan.dmi'
													usr.lssj = 1
													usr.powerlevel.value = usr.powerlevel.max_value * 9.5
													usr.ki.value = usr.ki.max_value * 9.5
													if(usr.tail )
														var/obj/tail/A = new(null)
														usr.overlays -= A
														var/obj/ssjtail/B = new(null)
														usr.overlays += B
													usr.state = "Legendary Super Saiyan"
													usr.lightningrand2()
													usr.transforming = 0
													usr.tiredlssj()
											else
												alert("You are in another form, you can't transform.")
												usr.transforming = 0
										if("Cancel")
											usr.transforming = 0
											..()
								if(usr.state == "Legendary Super Saiyan")
									switch(alert("What do you wish to do?","Legendary Super Saiyan","Revert", "Cancel"))
										if("Revert")
											if(usr.state == "Normal")
												usr << "You are already reverted from the Legendary Super Saiyan form."
											else
												if(usr.state == "Legendary Super Saiyan")
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/revert.wav'
													usr.lssj = 0
													usr.lspecial = 0
													usr.dspecial = 0
													usr.lightning = 0
													usr.overlays -= 'icons/hair_legendary_super_Saiyan.dmi'
													usr.underlays -= /obj/SSAuraBottom
													usr.overlays -= /obj/SSAuraTop
													usr.hairrestore()
													usr.skinrestore()
													if(usr.tail )
														var/obj/tail/A = new(null)
														usr.overlays += A
														var/obj/ssjtail/B = new(null)
														usr.overlays -= B
													usr.state = "Normal"
													if(usr.powerlevel.value >= usr.powerlevel.max_value)
														usr.powerlevel.value = usr.powerlevel.max_value
													if(usr.powerlevel.value >= usr.ki.max_value)
														usr.ki.value = usr.ki.max_value
													usr.transforming = 0
												else
													alert("You can only use this revert for Legendary Super Saiyan.")
													usr.transforming = 0


mob/proc
	tiredlssj()
		spawn()
			set background = 1
			while(lssj)
				sleep(rand(5,100))
				stamina.value -= (rand(0,10))
				if(src.stamina.value <= 0)
					lssj = 0
					view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to revert from [src.state]!</FONT><font color = green> *</FONT>"
					view(10) << 'sounds/revert.wav'
					powerlevel.value = 0
					ki.value = 0
					lspecial = 0
					dspecial = 0
					state = "Normal"
					skinrestore()
					lightning = 0
					overlays -= 'icons/hair_legendary_super_Saiyan.dmi'
					underlays -= /obj/SSAuraBottom
					overlays -= /obj/SSAuraTop
					hairrestore()
					if(tail)
						var/obj/tail/A = new(null)
						overlays += A
						var/obj/ssjtail/B = new(null)
						overlays -= B
					stamina.value = 0
					usr << "<B><FONT COLOR = YELLOW>You suddenly revert to normal, because of the strain."
					transforming = 0


mob/proc
	kaiokenstrain()
		spawn()
			set background = 1
			while(kaioken)
				sleep(rand(25,100))
				stamina.value -= (rand(1,8))
				if(stamina.value <= 0)
					if(state == "Super Saiyan"||state == "Ultra Super Saiyan"||state == "Super Saiyan")
						view(6) << 'sounds/revert.wav'
						kaioken = 0
						overlays -= /obj/kkauratop
						underlays -= /obj/kkaurabottom
						overlays += /obj/ssauratop
						underlays += /obj/ssaurabottom
						src << "<B><FONT COLOR = RED>You have reverted from Super Kaio-ken because of the strain!"
						if(state == "Ultra Super Saiyan"||state == "Super Saiyan 2")
							dspecial = 1
							flyingrocks()
						if(powerlevel.value >= powerlevel.max_value)
							powerlevel.restore()
						if(ki.value >= ki.max_value)
							ki.restore()
						stamina.value = 0
						kaiokuse = 0
					else
						view(6) << 'sounds/revert.wav'
						kaioken = 0
						dspecial = 0
						overlays -= /obj/kkauratop
						underlays -= /obj/kkaurabottom
						usr << "<B><FONT COLOR = RED>You have reverted from Kaio-ken because of the strain!"
						if(powerlevel.value >= powerlevel.max_value)
							powerlevel.restore()
						if(ki.value >= ki.max_value)
							ki.restore()
						stamina.value = 0
						kaiokuse = 0

obj
	tail
		icon = 'icons/tail.dmi'
		layer = MOB_LAYER + 1

obj
	ssjtail
		icon = 'icons/ssjtail.dmi'
		layer = MOB_LAYER + 2

obj
	babytail
		icon = 'icons/babytail.dmi'
		layer = MOB_LAYER + 2


obj
	items
		flutepiece
			name = "Flute Piece"
			icon = 'icons/turfs.dmi'
			icon_state = "flute"
			New()
				. = ..()
				loc = locate(rand(1, 150),rand(1, 150),pick(1,5,6,7,9,11,12,13,16,17,21))
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
					new /obj/items/flutepiece()

obj
	items
		flute
			icon = 'icons/turfs.dmi'
			icon_state = "flute"
			name = "Tapion's Flute"
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					usr.tapion = 0
					Move(usr)
				Play()
					var/sleeprand = rand(350,800)
					set category = null
					if(usr.ap > 25)
						if(usr.tapion)
							usr << "<B><FONT COLOR = SILVER>You are already playing the flute."
						if(usr.tapion == 0)
							usr.icon_state = "play"
							usr.tapion = 1
							usr.move = 0
							for(var/mob/characters/M in view(6))
								spawn()
									M << "<b><font color = silver>You feel a chill go down your spine as the calming melody of Tapion is played by [usr]."
									M << 'music/tapion.mid'
									view(6) << 'sounds/aura.wav'
									M.underlays += /obj/MysticAuraBottom
									M.overlays += /obj/MysticAuraTop
									if(M.ap < -25)
										M << "<B><FONT COLOR = SILVER>You become stunned by this soothing music."
										M.move = 0
										M.ap++
									sleep(sleeprand)
									if(!M) return
									M << "<FONT COLOR = SILVER><B>The soothing song comes to a halt."
									if(M.ap < -25)
										M.icon_state = ""
										M << 'music/title_off.mid'
										M << sound('music/title.mid',1)
										M.underlays -= /obj/MysticAuraBottom
										M.overlays -= /obj/MysticAuraTop
										M.move = 1
										M.tapion = 0
										if(usr)
											usr.move = 1
									else
										M << "<FONT COLOR = SILVER><B>Your body feels restored."
										M.powerlevel.restore()
										M.ki.restore()
										M.stamina.restore()
										M.icon_state = ""
										M << 'music/title_off.mid'
										M << sound('music/title.mid',1)
										M.underlays -= /obj/MysticAuraBottom
										M.overlays -= /obj/MysticAuraTop
										M.move = 1
										M.tapion = 0
										if(usr)
											usr.move = 1
											usr.tapion = 0
					else
						alert("Your alignment must be Good to use Tapion's Flute.")



obj
	items
		senzu
			icon = 'icons/senzu.dmi'
			name = "Senzu Bean"
			value = 0
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					usr.powerlevel.restore()
					usr.ki.restore()
					usr.stamina.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten a Senzu Bean!"
					usr << "<B>You feel fully restored."
					view(6) << 'sounds/sensu.wav'
					del(src)

obj
	items
		namekfruit
			icon = 'icons/namekfruit.dmi'
			name = "Namekian Fruit"
			value = 125
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					usr.powerlevel.restore()
					usr.ki.restore()
					usr.stamina.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten Namekian Fruit!"
					usr << "<B>You feel fully restored."
					view(6) << 'sounds/sensu.wav'
					del(src)

obj
	items
		apple
			icon = 'icons/apple.dmi'
			name = "Apple"
			value = 50
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.powerlevel.value < usr.powerlevel.max_value)
						usr.powerlevel.add(usr.powerlevel.max_value * 0.00005)
						if(usr.powerlevel.value > usr.powerlevel.max_value)
							usr.powerlevel.restore()
					usr.stamina.add(max(1,round(usr.stamina.max_value/10)))
					if(usr.stamina.value > usr.stamina.max_value)
						usr.stamina.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten a Apple!"
					usr << "<B>You feel slightly restored."
					view(6) << 'sounds/sensu.wav'
					del(src)
obj
	items
		legofchicken
			icon = 'icons/meatleg.dmi'
			name = "Leg of Chicken"
			value = 62
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.powerlevel.value < usr.powerlevel.max_value)
						usr.powerlevel.add(usr.powerlevel.max_value * 0.06)
						if(usr.powerlevel.value > usr.powerlevel.max_value)
							usr.powerlevel.restore()
					usr.stamina.add(5)
					usr << "<B><FONT COLOR = YELLOW>You have eaten a [src]!"
					usr << "<B>You feel slightly restored."
					view(6) << 'sounds/sensu.wav'
					del(src)

obj
	items
		tenticle_eeled_soup
			icon = 'icons/Bowl.dmi'
			name = "tenticle Eeled Soup"
			value = 62
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.powerlevel.value < usr.powerlevel.max_value)
						usr.powerlevel.add(usr.powerlevel.max_value * 0.1)
						if(usr.powerlevel.value > usr.powerlevel.max_value)
							usr.powerlevel.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten a [src]!"
					usr << "<B>You feel slightly restored."
					view(6) << 'sounds/sensu.wav'
					del(src)

obj
	items
		beef
			icon = 'icons/meat.dmi'
			name = "Beef"
			value = 80
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.powerlevel.value < usr.powerlevel.max_value)
						usr.powerlevel.add(usr.powerlevel.max_value * 0.1)
						if(usr.powerlevel.value > usr.powerlevel.max_value)
							usr.powerlevel.restore()
					usr.stamina.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten [src]!"
					usr << "<B>You feel slightly restored."
					view(6) << 'sounds/sensu.wav'
					del(src)



obj
	items
		greenapple
			icon = 'icons/greenapple.dmi'
			name = "Green Apple"
			value = 75
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.powerlevel.value < usr.powerlevel.max_value)
						usr.powerlevel.add(usr.powerlevel.max_value * 0.075)
						if(usr.powerlevel.value > usr.powerlevel.max_value)
							usr.powerlevel.restore()
					usr.stamina.restore()
					usr << "<B><FONT COLOR = YELLOW>You have eaten a Green Apple!"
					usr << "<B>You feel slightly restored."
					view(6) << 'sounds/sensu.wav'
					del(src)

obj
	items
		senzubag
			var/beans = 5
			icon = 'icons/senzubag.dmi'
			name = "Senzu Bag"
			//value = 1500
			value = 1
			Click()
				if(src in usr.contents)
					Take()
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Take()
					set category = null
					set name = "Get Senzu Bean"
					if(src.bu != 1)
						del(src)
					else
						var/stake = input("How many beans do you wish to take out?:","Beans Remaning: [src.beans]") as num
						if(stake > src.beans||stake <= 0)
							alert("You can't take that much out!")
						else
							src.beans -= stake
							for(var/i = stake; i > 0; i--)
								usr.contents += new /obj/items/senzu
							usr << "<B>You take <U>[stake]</U> Senzu Bean from the bag."
							if(src.beans <= 0)
								usr << "<B>The bag has ran out of Senzu Beans, and the bag dissappears."
								del(src)
							else
								usr << "You have [src.beans] Senzu Beans left in the bag."
obj
	items
		ssenzubag
			var/beans = 10
			icon = 'icons/senzubag.dmi'
			name = "Small Senzu Bag"
			//value = 5000
			value = 1
			Click()
				if(src in usr.contents)
					Take()
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Take()
					set category = null
					set name = "Get Senzu Bean"
					if(src.bu != 1)
						del(src)
					else
						var/stake = input("How many beans do you wish to take out?:","Beans Remaning: [src.beans]") as num
						if(stake > src.beans||stake <= 0)
							alert("You can't take that much out!")
						else
							src.beans -= stake
							for(var/i = stake; i > 0; i--)
								usr.contents += new /obj/items/senzu
							usr << "<B>You take <U>[stake]</U> Senzu Bean from the bag."
							if(src.beans <= 0)
								usr << "<B>The bag has ran out of Senzu Beans, and the bag dissappears."
								del(src)
							else
								usr << "You have [src.beans] Senzu Beans left in the bag."
obj
	items
		msenzubag
			var/beans = 25
			icon = 'icons/senzubag.dmi'
			name = "Medium Senzu Bag"
			//value = 12500
			value = 1
			Click()
				if(src in usr.contents)
					Take()
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Take()
					set category = null
					set name = "Get Senzu Bean"
					if(src.bu != 1)
						del(src)
					else
						var/stake = input("How many beans do you wish to take out?:","Beans Remaning: [src.beans]") as num
						if(stake > src.beans||stake <= 0)
							alert("You can't take that much out!")
						else
							src.beans -= stake
							for(var/i = stake; i > 0; i--)
								usr.contents += new /obj/items/senzu
							usr << "<B>You take <U>[stake]</U> Senzu Bean from the bag."
							if(src.beans <= 0)
								usr << "<B>The bag has ran out of Senzu Beans, and the bag dissappears."
								del(src)
							else
								usr << "You have [src.beans] Senzu Beans left in the bag."
obj
	items
		lsenzubag
			var/beans = 50
			icon = 'icons/senzubag.dmi'
			name = "Large Senzu Bag"
			//value = 25000
			value = 1
			Click()
				if(src in usr.contents)
					Take()
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Take()
					set category = null
					set name = "Get Senzu Bean"
					if(src.bu != 1)
						del(src)
					else
						var/stake = input("How many beans do you wish to take out?:","Beans Remaning: [src.beans]") as num
						if(stake > src.beans||stake <= 0)
							alert("You can't take that much out!")
						else
							src.beans -= stake
							for(var/i = stake; i > 0; i--)
								usr.contents += new /obj/items/senzu
							usr << "<B>You take <U>[stake]</U> Senzu Bean from the bag."
							if(src.beans <= 0)
								usr << "<B>The bag has ran out of Senzu Beans, and the bag dissappears."
								del(src)
							else
								usr << "You have [src.beans] Senzu Beans left in the bag."
obj
	items
		hsenzubag
			var/beans = 100
			icon = 'icons/senzubag.dmi'
			name = "Heavy Senzu Bag"
			//value = 50000
			value = 1
			Click()
				if(src in usr.contents)
					Take()
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Take()
					set category = null
					set name = "Get Senzu Bean"
					if(src.bu != 1)
						del(src)
					else
						var/stake = input("How many beans do you wish to take out?:","Beans Remaning: [src.beans]") as num
						if(stake > src.beans||stake <= 0)
							alert("You can't take that much out!")
						else
							src.beans -= stake
							for(var/i = stake; i > 0; i--)
								usr.contents += new /obj/items/senzu
							usr << "<B>You take <U>[stake]</U> Senzu Bean from the bag."
							if(src.beans <= 0)
								usr << "<B>The bag has ran out of Senzu Beans, and the bag dissappears."
								del(src)
							else
								usr << "You have [src.beans] Senzu Beans left in the bag."
obj
	ray
		icon = 'icons/ray.dmi'
		layer = 9

obj
	wover
		icon = 'icons/turfs.dmi'
		icon_state = "wover"
		density = 0
		layer = 9

obj
	WeightTraining100
		name = "Weights (100)"
		icon = 'icons/weight-objs.dmi'
		icon_state = "w100"
		layer = 8
		var
			lift
		verb
			Lift()
				set name = "Lift Weight"
				set category = null
				set src in oview(0)
				if(!lift)
					if(usr.stamina.value >= 5)
						if(usr.flight)
							usr << "You can't lift this weight while flying."
						else
							usr << "<B>You lift [src]."
							usr.stamina.value -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.skexp += rand(0,2)
							usr.Levelup()
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.05
							else
								usr.powerlevel.max_value += 0.025
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.1
							else
								usr.powerlevel.max_value += 0.05
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.1
							else
								usr.powerlevel.max_value += 0.075
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100"
							usr.icon_state = ""
							if(!usr.flightlearn)
								usr.FlightLearn()
							if(!usr.auratechlearn)
								usr.AuraTechLearn()
							if(!usr.kitechlearn)
								usr.KiTechLearn()
							if(!usr.focustechlearn)
								usr.FocusLearn()
					else
						usr << "<B>You feel too tired to lift this weight."
				else
					usr << "This weight is already being lifed by you."

	WeightTraining1000
		name = "Weights (1000)"
		icon = 'icons/weight-objs.dmi'
		icon_state = "w1000"
		layer = 8
		var
			lift
		verb
			Lift1000()
				set name = "Lift Weight"
				set category = null
				set src in oview(0)
				if(!lift)
					if(usr.stamina.value >= 5)
						if(usr.flight)
							usr << "You can't lift this weight while flying."
						else
							usr << "<B>You lift [src]."
							usr.stamina.value -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar1000"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.skexp += rand(0,3)
							usr.Levelup()
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.1
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.2
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.powerlevel.max_value += 0.3
							src.lift = 0
							usr.move = 1
							src.icon_state = "w1000"
							usr.icon_state = ""
							if(!usr.flightlearn)
								usr.FlightLearn()
							if(!usr.auratechlearn)
								usr.AuraTechLearn()
							if(!usr.kitechlearn)
								usr.KiTechLearn()
							if(!usr.focustechlearn)
								usr.FocusLearn()
					else
						usr << "<B>You feel too tired to lift this weight."
				else
					usr << "This weight is already being lifed by you."



turf
	MeditationPad
		name = "Meditation Pad"
		icon = 'icons/turfs.dmi'
		icon_state = "grayfloor"
		verb
			AdvMed()
				set name = "Meditate with Pad"
				set category = null
				set src in oview(0)
				if((usr.state != "Normal" && usr.state != "Semi-Perfect Form" && usr.state != "Perfect Form" &&(usr.state == "Super Saiyan" && usr.ssjfp !=1))||usr.transforming )
					usr << "You can't meditate/rest while being transformed."
					return
				if(usr.training)
					alert("You can't meditate while training.")
				else
					if(usr.flight)
						usr << "You can't meditate while flying."
					else
						if(usr.rest)
							usr << "You can't meditate while resting, or you must wait 10 seconds before meditating."
						else
							if(usr.meditate )
								if(usr.medtime )
									usr << "<B>You need to wait 10 seconds before continuing meditating."
								if(usr.medtime == 0||usr.medtime == null)
									usr << "<B>You relieve your self from your meditiative state."
									usr.medtime = 1
									usr.meditate = 0
									usr.move = 1
									usr.attacking = 0
									usr.frozen = 0
									usr.kame = 0
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									usr.icon_state = ""
									usr.overlays -= 'icons/medwind.dmi'
									view(6) << 'sounds/revert.wav'
									usr << "<b><font color = red>The aura around your body dissappears."
									var/icon/aura = new('icons/whiteaura.dmi')
									aura.Blend(usr.customauracolor)
									usr.underlays -= aura
									sleep(100)
									if(usr)
										usr.medtime = 0
							else
								usr << "<b>You begin to meditate with the Meditation Pad."
								usr.icon_state = "meditate"
								usr.move = 0
								usr.attacking = 1
								usr.kame = 1
								usr.frozen = 1
								usr.client.show_verb_panel = 0
								usr.hideipan = 1
								usr.meditate = 1
								usr.overlays += 'icons/medwind.dmi'
								usr.advmeditate()
								spawn(25)
									var/icon/aura = new('icons/whiteaura.dmi')
									aura.Blend(usr.customauracolor)
									usr.underlays += aura
									view(6) << 'sounds/aura.wav'
									usr << "<b><font color=red>A aura from meditation surrounds your body."

obj/pbag
	name = "Punching Bag"
	icon = 'icons/weight-objs.dmi'
	icon_state = "speed"
	density = 1
	verb
		PBagTrain()
			set name = "Train with Punching Bag"
			set category = null
			set src in oview(1)
			if(usr.flight == 0)
				if(usr.rest == 0)
					if(usr.meditate == 0)
						if(usr.stamina.value > 0)
							if(usr.dir == 4)
								if(usr.training)
									usr << "<B><FONT COLOR = YELLOW>You stop training."
									usr.training = 0
									usr.move = 1
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									if(usr.stamina.value <= 0)
										usr.stamina.value = 0
								else
									if(!usr.training)
										usr.training = 1
										usr << "<B><FONT COLOR = YELLOW>You start to train with the Punching Bag."
										usr.move = 0
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										pbagtrain
										if(usr.training)
											if(usr.stamina.value > 0)
												sleep(9)
												if(!usr) return
												flick("speedhit",src)
												flick("sparfury",usr)
												view(4) << 'sounds/punchhit.wav'
												usr.move = 0
												usr.skexp += rand(1,4)
												usr.Levelup()
												usr.powerlevel.max_value += 1 + usr.powerlevel.max_value * 0.0000028
												usr.stamina.value -= rand(0,3)
												usr.meditate = 0
												usr.rest = 0
												if(usr.flightlearn == 0)
													usr.FlightLearn()
												if(usr.auratechlearn == 0)
													usr.AuraTechLearn()
												if(usr.kitechlearn == 0)
													usr.KiTechLearn()
												if(usr.focustechlearn == 0)
													usr.FocusLearn()
												goto pbagtrain
											else
												usr << "<B><FONT COLOR = YELLOW>You have become tired and stop training."
												usr.training = 0
												usr.move = 1
												usr.icon_state = ""
												usr.client.show_verb_panel = 1
												usr.hideipan = 0
												if(usr.stamina.value <= 0)
													usr.stamina.value = 0
							else
								alert("You aren't facing the correct direction to train with the Punching Bag.")
						else
							alert("You are too tired!")
					else
						alert("You can't meditate and train with the Punching Bag at the same time!.")
				else
					alert("You can't rest and train with the Punching Bag at the same time!")
			else
				alert("You can't be flying and train with the Punching Bag at the same time!")
obj
	Machine
		icon = 'icons/turfs.dmi'
		icon_state = "mach"
		density = 1
		verb
			HitMachine()
				set name = "Hit the Punching Machine"
				set category = null
				set src in oview(1)
				if(usr.flight )
					usr << "You can't hit the Punching Machine while flying."
				if(usr.flight == 0)
					if(usr.rest )
						usr << "You can't rest and hit the Punching Machine at the same time!"
					if(usr.rest == 0)
						if(usr.meditate )
							usr << "You can't meditate and hit the Punching Machine at the same time!"
						if(usr.meditate == 0)
							if(usr.frozen )
								usr << "You are frozen!"
							if(usr.frozen == 0)
								if(usr.dir == 8)
									if(usr.move == 0)
										usr << "You can't do this now."
									if(usr.move )
										view(6) << "<font color = yellow>[usr] prepares to hit the Punching Machine.."
										usr.move = 0
										sleep(rand(10,30))
										if(!usr) return
										flick("weight-training-right", usr)
										if(!usr) return
										flick("mach2", src)
										if(!usr) return
										view(10) << 'sounds/punchhit.wav'
										if(usr.move == 0)
											usr.move = 1
											usr.icon_state = ""
											var/damage = (usr.powerlevel.value / (rand(1,8)))
											damage = round(damage)
											damage += (rand(1,15))
											view(6) << "<font color = green>[usr] hits the punching machine, doing about [damage] damage to it."
											usr.random = rand(0,10)
											if(usr.random>0)
												usr.random = round(damage*0.001*(rand(1,50)))
												usr.zenni += usr.random
												usr.zenni = round(usr.zenni)
												usr << "<font color = red>You recieve [usr.random] Zenni from that punching session."
											else
												usr << "<font color = red>You recieve 0 Zenni from that punching session."
											usr.meditate = 0
											if(usr.flightlearn == 0)
												usr.FlightLearn()
											if(usr.auratechlearn == 0)
												usr.AuraTechLearn()
											if(usr.kitechlearn == 0)
												usr.KiTechLearn()
											if(usr.focustechlearn == 0)
												usr.FocusLearn()
										else
											view(6) << "<font color = green>[usr] hits the punching machine, doing about [usr.powerlevel.value / (rand(2,8))] damage to it."
											usr.move = 1
											usr.icon_state = ""
											usr.meditate = 0
								else
									usr << "<B>You need to face this!"

obj
	whiteaura
		icon = 'icons/mysticaura.dmi'
		icon_state = ""

obj
	kaioaura
		icon = 'icons/kaioaura.dmi'
		icon_state = ""

obj/var
	value = 0
	armor = 0

obj
	items
		saiyan_armor3c3
			name = "Class III Saiyan Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 25000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.6
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		saiyan_armor2c3
			name = "Class III Saiyan Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 25000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.6
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		saiyan_armor1c3
			name = "Class III Saiyan Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 25000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.6
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		saiyan_armor3c2
			name = "Class II Saiyan Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 15000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.5
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		saiyan_armor2c2
			name = "Class II Saiyan Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 15000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.5
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		saiyan_armor1c2
			name = "Class II Saiyan Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 15000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.5
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		saiyan_armor3c1
			name = "Class I Saiyan Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 10000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.45
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		saiyan_armor2c1
			name = "Class I Saiyan Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 10000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.45
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		saiyan_armor1c1
			name = "Class I Saiyan Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 10000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.45
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		earth_armor3c3
			name = "Class III Earth Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 8000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.35
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		earth_armor2c3
			name = "Class III Earth Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 8000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.35
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		earth_armor1c3
			name = "Class III Earth Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 8000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.35
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		earth_armor1c2
			name = "Class II Earth Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 5000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.325
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		earth_armor2c2
			name = "Class II Earth Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 5000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.325
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(src.worn )
						usr << "Not while its being worn."
					if(src.worn == 0)
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		earth_armor3c2
			name = "Class II Earth Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 5000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.325
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		earth_armor1c1
			name = "Class I Earth Armor (Type I)"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			armor = 0
			value = 2500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.25
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		earth_armor2c1
			name = "Class I Earth Armor (Type II)"
			icon = 'icons/saiyanarmor2.dmi'
			worn = 0
			armor = 0
			value = 2500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.25
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		earth_armor3c1
			name = "Class I Earth Armor (Type III)"
			icon = 'icons/saiyanarmor4.dmi'
			worn = 0
			armor = 0
			value = 2500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.25
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c4scoutery
			icon = 'icons/yellow-scouter.dmi'
			name = "Class IV Scouter (Yellow)"
			worn = 0
			value = 2500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c4scouterg
			icon = 'icons/green-scouter.dmi'
			name = "Class IV Scouter (Green)"
			worn = 0
			value = 2500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c4scouterb
			icon = 'icons/blue-scouter.dmi'
			name = "Class IV Scouter (Blue)"
			worn = 0
			value = 2500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c4scouterr
			icon = 'icons/red-scouter.dmi'
			name = "Class IV Scouter (Red)"
			worn = 0
			value = 2500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 85000000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c3scoutery
			icon = 'icons/yellow-scouter.dmi'
			name = "Class III Scouter (Yellow)"
			worn = 0
			value = 1500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						set category = null
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c3scouterb
			icon = 'icons/blue-scouter.dmi'
			name = "Class III Scouter (Blue)"
			worn = 0
			value = 1500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c3scouterg
			icon = 'icons/green-scouter.dmi'
			name = "Class III Scouter (Green)"
			worn = 0
			value = 1500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c3scouterr
			icon = 'icons/red-scouter.dmi'
			name = "Class III Scouter (Red)"
			worn = 0
			value = 1500
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 42500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(100)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(100)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c2scoutery
			icon = 'icons/yellow-scouter.dmi'
			name = "Class II Scouter (Yellow)"
			worn = 0
			value = 1000
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		c2scouterg
			icon = 'icons/green-scouter.dmi'
			name = "Class II Scouter (Green)"
			worn = 0
			value = 1000
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		c2scouterr
			icon = 'icons/red-scouter.dmi'
			name = "Class II Scouter (Red)"
			worn = 0
			value = 1000
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		c2scouterb
			icon = 'icons/blue-scouter.dmi'
			name = "Class II Scouter (Blue)"
			worn = 0
			value = 1000
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 22500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(125)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		c1scouterb
			icon = 'icons/blue-scouter.dmi'
			name = "Class I Scouter (Blue)"
			worn = 0
			value = 750
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c1scouterr
			icon = 'icons/red-scouter.dmi'
			name = "Class I Scouter (Red)"
			worn = 0
			value = 750
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c1scouterg
			icon = 'icons/green-scouter.dmi'
			name = "Class I Scouter (Green)"
			worn = 0
			value = 750
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		c1scoutery
			icon = 'icons/yellow-scouter.dmi'
			name = "Class I Scouter (Yellow)"
			worn = 0
			value = 750
			verb
				Set_Scouter_Radio_Channel()
					set category = "Other"
					if(usr.scouterchannel)
						channels[usr.scouterchannel] -= usr
					usr.scouterchannel = input("Enter a channel","Scouter") as num
					if(usr.scouterchannel < 1 || usr.scouterchannel > 999)
						usr << "That is an invalid channel!"
						usr.scouterchannel = 0
					else
						channels[usr.scouterchannel] += usr
						usr << "Channel set to [usr.scouterchannel]."
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."

				Scan(mob/characters/M in oview(6))
					set category = null
					if(M)
						if(src.worn )
							view(6) << "<font color = yellow><B>[usr] points a scouter at [M]."
							view(6) << 'sounds/scouter.wav'
							if(M.powerlevel.value >= 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = YELLOW>[M]'s powerlevel is unreadable!"
							if(M.powerlevel.value < 12500000)
								usr << "<FONT COLOR = YELLOW>Collecting data from [M].."
								sleep(150)
								usr << "<b><FONT COLOR = GREEN>[M] : [M.powerlevel.value]"
						if(src.worn == 0)
							usr << "You must be wearing it."
					else
						usr << "<B><FONT COLOR = YELLOW>There is no one near by!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Search()
					set category = null
					if(src.worn )
						usr << "<FONT COLOR = YELLOW>Collecting data.."
						sleep(150)
						usr << "<B>Your location: ([usr.x],[usr.y])"
						for(var/mob/characters/M in world)
							if(M.z == usr.z)
								usr << "<FONT COLOR = YELLOW><B>[M.name]'s location: ([M.x],[M.y])"
				 			if(M.z != usr.z)
				 				usr << "<FONT COLOR = YELLOW><B>[M.name]'s location points off to another location!"
					if(src.worn == 0)
						usr << "You must be wearing it."
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		boxing
			name = "Boxing Gloves"
			icon = 'icons/boxing.dmi'
			worn = 0
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		glasses
			name = "Glasses"
			icon = 'icons/glasses.dmi'
			worn = 0
			value = 50
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		bgset
			name = "Boots & Gloves"
			icon = 'icons/blackboot_glove.dmi'
			worn = 0
			value = 150
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		customclothes
			worn = 0
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		cape
			name = "Cape"
			icon = 'icons/clothes-blackcape.dmi'
			worn = 0
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		namekcape
			name = "Namekian Cape"
			icon = 'icons/clothes-blackcape.dmi'
			worn = 0
			armor = 0
			value = 2500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
						usr.armored = 0
						usr.armordmg = 0
					else
						if(usr.armored == 0)
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
							usr.armored = 1
							usr.armordmg = 0.28
						else
							usr << "You can't wear two pieces of armor at the same time!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		underclothing
			name = "Underclothing"
			worn = 0
			icon = 'icons/clothes-blackunder.dmi'
			value = 125
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		gi
			name = "Gi"
			worn = 0
			icon = 'icons/clothes-blackgi.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buugi
			name = "Buu Gi"
			worn = 0
			icon = 'icons/buugi.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buucape
			name = "Buu Cape"
			worn = 0
			icon = 'icons/buucape.dmi'
			value = 500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuboots
			name = "Buu Boots"
			worn = 0
			icon = 'icons/buuboots.dmi'
			value = 300
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuvest
			name = "Buu Vest"
			worn = 0
			icon = 'icons/buuvest.dmi'
			value = 500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuarmor1
			name = "Buu Armor1"
			worn = 0
			icon = 'icons/buuarmor1.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuarmor2
			name = "Buu Armor2"
			worn = 0
			icon = 'icons/buuarmor2.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuarmor3
			name = "Buu Armor3"
			worn = 0
			icon = 'icons/buuarmor3.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		buuunderclothing
			name = "Buu Underclothing"
			worn = 0
			icon = 'icons/BuuUnderclothing1.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		wizardgi
			name = "Wizard Gi"
			worn = 0
			icon = 'icons/wizard gi.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		wizardcape
			name = "Wizard Cape"
			worn = 0
			icon = 'icons/wizard cape.dmi'
			value = 500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		wizardunderclothing
			name = "Wizard Underclothing"
			worn = 0
			icon = 'icons/wizard underclothing.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		wizardbootandgloves
			name = "Wizard Boots & Gloves"
			worn = 0
			icon = 'icons/wizardbootsgloves.dmi'
			value = 300
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)


		vest
			name = "Vest"
			worn = 0
			icon = 'icons/clothes-vest.dmi'
			value = 250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		weightedvest
			name = "Weighted Vest"
			worn = 0
			icon = 'icons/clothes-vest.dmi'
			value = 1250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.weight = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						if(usr.weight == 0)
							src.worn = 1
							usr.weight = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
						else
							usr << "<B>You can't wear two pairs of weighted clothing!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.weight = 0
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		weightedcape
			name = "Weighted Cape"
			worn = 0
			icon = 'icons/clothes-blackcape.dmi'
			value = 1250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.weight = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						if(usr.weight == 0)
							src.worn = 1
							usr.weight = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
						else
							usr << "<B>You can't wear two pairs of weighted clothing!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.weight = 0
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		weightedgi
			name = "Weighted Gi"
			worn = 0
			icon = 'icons/clothes-blackgi.dmi'
			value = 1250
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.weight = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						if(usr.weight == 0)
							src.worn = 1
							usr.weight = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
						else
							usr << "<B>You can't wear two pairs of weighted clothing!"
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.weight = 0
						src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		fusionvest
			name = "Fusion Vest"
			icon = 'icons/fusionvest.dmi'
			worn = 0
			value = 0
			verb
				Wear()
					set category = null
					if(usr.fused &&usr.gm != 1&&usr.enf !=1)
						if(src.worn )
							src.worn = 0
							usr.overlays -= src.icon
							usr.worn -= src
							usr << "You remove the [src.name]."
						else
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
					else
						usr << "<font color = red>You can't wear this!"
						del(src)
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		/*fusionpants
			name = "Fusion Pants"
			icon = 'icons/fusionpants.dmi'
			worn = 0
			value = 0
			verb
				Wear()
					set category = null
					if(usr.fused &&usr.gm != 1&&usr.enf !=1)
						if(src.worn )
							src.worn = 0
							usr.overlays -= src.icon
							usr.worn -= src
							usr << "You remove the [src.name]."
						else
							src.worn = 1
							usr.overlays += src.icon
							usr.worn += src
							usr << "You wear the [src.name]."
					else
						usr << "<font color = red>You can't wear this!"
						del(src)

				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)*/

		ablueprints
			name = "Android Blueprints"
			icon = 'icons/ablueprints.dmi'
			worn = 0
			value = 0
			var
				expkk
				expkn
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.blueprints = 0
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
					usr.blueprints = 1
					usr << "You pick up the Upgrade Blueprints."

		autograph
			name = "Autograph (Mr.Satan)"
			icon = 'icons/auto.dmi'
			worn = 0
			value = 15000
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.auto = 0
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					usr.auto = 1
					Move(usr)
					usr << "You pick up the Autograph (Mr.Satan)."

		dagger
			name = "Dagger"
			icon = 'icons/dagger.dmi'
			worn = 0
			value = 0
			New()
				..()
				src.loc=locate((rand(22,149)),(rand(1,150)),7)
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.auto = 0
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					usr.auto = 1
					Move(usr)
					usr << "You pick up the Dagger."

		journal
			name = "Journal"
			icon = 'icons/journal.dmi'
			worn = 0
			value = 25
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)

				Get()
					set category = null
					set src in oview(1)
					Move(usr)
					usr << "You pick up the Journal."

		dinoeggs
			name = "Dinosaur Eggs"
			icon = 'icons/eggs.dmi'
			value = 1000
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							usr.eggs -= 1
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
					usr.eggs += 1
					usr << "You pick up the Dinosaur Eggs."
		magazine
			name = "Magazine"
			icon = 'icons/magazine.dmi'
			worn = 0
			value = 300
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
						usr.magazine -= 1
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
					usr << "You pick up the Magazine."
					usr.magazine += 1

		saibaseeds
			name = "Saibamen Seeds"
			icon_state = ""
			icon = 'icons/saibaseeds.dmi'
			var/seeds = 6
			verb
				Get()
					set src in oview(1)
					set category = null
					Move(usr)
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)
				Plant()
					set category = null
					if(seeds)
						seeds--
						new /monster/saiyansaga/saibaman(usr)
						view(usr) << "[usr] planted a saibaman!"
				TimeC()
					set category = null
					set name = "Time Counter"
					if(usr.saibaseedt == null)
						usr.saibaseedt = 0
					usr << "You have [usr.saibaseedt] minutes left before you can plant again!"

		gothicbracelets
			name = "Gothic Bracelets"
			icon = 'icons/gothic_bracelets.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/gothic_bracelets.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/gothic_bracelets.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		bluemysticarmor
			name = "Blue Mystic Armor"
			icon = 'icons/clothes-bluekaigi.dmi'
			worn = 0
			value = 7500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/clothes-bluekaigi.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/clothes-bluekaigi.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		redmysticarmor
			name = "Red Mystic Armor"
			icon = 'icons/clothes-redkaigi.dmi'
			worn = 0
			value = 7500
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/clothes-redkaigi.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/clothes-redkaigi.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		kamegi
			name = "Turtle Hermit Training Gi"
			icon = 'icons/kamegi.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/kamegi.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/kamegi.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		kaigi
			name = "King Kai's Training Gi"
			icon = 'icons/kaigi.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/kaigi.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/kaigi.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		gokugi
			name = "Goku's Gi"
			icon = 'icons/gokugi.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/gokugi.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/gokugi.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set src in oview(1)
					Move(usr)

		weightedgokugi
			name = "Goku's Weighted Training Clothing"
			icon = 'icons/gokugi.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(usr.gokuwg != 1)
						usr << "You can't wear this since you did not earned it!"
						del(src)
						return
					else
						if(src.worn )
							src.worn = 0
							usr.weight = 0
							usr.overlays -= 'icons/gokugi.dmi'
							usr.worn -= src
							usr << "You remove the [src.name]."
						else
							src.worn = 1
							if(usr.powerlevel.max_value >= 400000)
								usr.weight = 0
							if(usr.powerlevel.max_value < 4000000)
								usr.weight = 1
							usr.worn += src
							usr.overlays += 'icons/gokugi.dmi'
							usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set src in oview(1)
					Move(usr)

		namekgi
			name = "Namekian Gi"
			icon = 'icons/namekgi.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear the [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		turben
			name = "Turben"
			icon = 'icons/turben.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/turben.dmi'
						usr.worn -= src
						usr << "You remove the [src.name]."


					else
						src.worn = 1
						usr.overlays += 'icons/turben.dmi'
						usr.worn += src
						usr << "You wear the [src.name]."

				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		vegetaarmor
			name = "Vegeta's Armor"
			icon = 'icons/saiyanarmor.dmi'
			worn = 0
			New()
				..()
				src.rx = rand(2,149)
				src.ry = rand(2,149)
				src.loc = locate(src.rx,src.ry,1)
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		redfusionvest
			name = "Red Fusion Vest"
			icon = 'icons/GogetaVest.dmi'
			worn = 0
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= src.icon
						usr.worn -= src
						usr << "You remove [src.name]."
					else
						src.worn = 1
						usr.overlays += src.icon
						usr.worn += src
						usr << "You wear [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		championvest
			name = "Champion Vest"
			icon = 'icons/GogetaVest.dmi'
			worn = 0
			value = 50000
			verb
				Wear()
					set category = null
					if(src.worn )
						src.worn = 0
						usr.overlays -= 'icons/GogetaVest.dmi'
						usr.worn -= src
						usr << "You remove [src.name]."
					else
						src.worn = 1
						usr.overlays += 'icons/GogetaVest.dmi'
						usr.worn += src
						usr << "You wear [src.name]."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being worn."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		trenchcoat
			name = "Trenchcoat"
			icon = 'icons/trenchcoat.dmi'
			worn = 0
			value = 0
			DblClick()
				if(src in usr.contents)
					Wear()
				else
					usr << "[src] must be in your inventory!"
					return

			verb
				Wear()
					set category = null
					if(src in usr.contents)
						if(src.worn )
							if(usr.ckey in admins|| usr.guild=="SNIPERs"|| usr.guild=="Elements of Power")
								src.worn = 0
								usr.overlays -= 'icons/trenchcoat.dmi'
								usr.worn -= src
								usr << "You remove [src.name]."
							else
								usr.worn -= src
								usr << "You can't wear this!"
								del(src)
						else
							src.worn = 1
							usr.overlays += 'icons/trenchcoat.dmi'
							usr.worn += src
							usr << "You wear [src.name]."
					else
						usr << "[src] must be in your inventory!"
						return
				Drop()
					set category = null
					if(src in usr.contents)
						if(usr.fused )
							usr << "You can't drop this!"
							return
						else
							if(src.worn )
								usr << "Not while its being worn."
							if(src.worn == 0)
								switch(alert("ARE YOU SURE YOU WANT TO DROP [src.name]? IT WILL BE DELETED IF DROPPED!","Deletable Drop Item","No","Yes"))
									if("No")
										return
									if("Yes")
										usr << "You have drop deleted [src.name]!"
										del(src)
					else
						usr << "[src] must be in your inventory!"
						return

				Get()
					set category = null
					set src in oview(1)
					Move(usr)

obj/var/tmp/GravID
mob/var/tmp/GravID = 0
obj/var/tmp/highgrav

obj/Gravitron
	name = "Gravitron (Model I)"
	icon = 'icons/grav2.png'
	density = 1
	highgrav = 5000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			if(!usr) return
			howmuch = max(0,howmuch)
			if(howmuch || !howmuch)
				usr.grav = 0
				usr.GravID = 0
				usr.move = 1
				usr << "<b>You flick the switch and the gravity begins to shut down."
			if(howmuch > 1 && howmuch <= highgrav)
				if(usr.grav)
					usr << "<b>Please set the gravity to 0."
					return
				if(!usr.grav)
//					if(usr.state != "Normal")
	//					usr.stamina.value = 0
					if(usr.GravID && (src.GravID != usr.GravID))
						usr << "Sorry but you can only use one gravitron at a time!"
						return
					usr << "<b>The gravition computes and suddenly the room begins to get heavy."
					usr.grav = howmuch
					usr.GravID = src.GravID
					usr.move = 0
					sleep(20)
					if(!usr) return
					usr.playergravity()
			if(howmuch > highgrav)
				usr << "<b>This type of gravitron can't go up that amount of gravity."

obj/Gravitrontwo
	name = "Gravitron (Model II)"
	icon = 'icons/grav2.png'
	density = 1
	highgrav = 10000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			if(!usr) return
			howmuch = max(0,howmuch)
			if(howmuch || !howmuch)
				usr.grav = 0
				usr.GravID = 0
				usr.move = 1
				usr << "<b>You flick the switch and the gravity begins to shut down."
			if(howmuch > 1 && howmuch <= highgrav)
				if(usr.grav)
					usr << "<b>Please set the gravity to 0."
					return
				if(!usr.grav)
//					if(usr.state != "Normal")
	//					usr.stamina.value = 0
					if(usr.GravID && (src.GravID != usr.GravID))
						usr << "Sorry but you can only use one gravitron at a time!"
						return
					usr << "<b>The gravition computes and suddenly the room begins to get heavy."
					usr.grav = howmuch
					usr.GravID = src.GravID
					usr.move = 0
					sleep(20)
					if(!usr) return
					usr.playergravity()
			if(howmuch > highgrav)
				usr << "<b>This type of gravitron can't go up that amount of gravity."

obj/Gravitronthree
	name = "Gravitron (Model III)"
	icon = 'icons/grav2.png'
	density = 1
	highgrav = 50000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			if(!usr) return
			howmuch = max(0,howmuch)
			if(howmuch || !howmuch)
				usr.grav = 0
				usr.GravID = 0
				usr.move = 1
				usr << "<b>You flick the switch and the gravity begins to shut down."
			if(howmuch > 1 && howmuch <= highgrav)
				if(usr.grav)
					usr << "<b>Please set the gravity to 0."
					return
				if(!usr.grav)
//					if(usr.state != "Normal")
	//					usr.stamina.value = 0
					if(usr.GravID && (src.GravID != usr.GravID))
						usr << "Sorry but you can only use one gravitron at a time!"
						return
					usr << "<b>The gravition computes and suddenly the room begins to get heavy."
					usr.grav = howmuch
					usr.GravID = src.GravID
					usr.move = 0
					sleep(20)
					if(!usr) return
					usr.playergravity()
			if(howmuch > highgrav)
				usr << "<b>This type of gravitron can't go up that amount of gravity."

obj/Gravitronfour
	name = "Gravitron (Model IV)"
	icon = 'icons/grav2.png'
	density = 1
	highgrav = 100000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			if(!usr) return
			howmuch = max(0,howmuch)
			if(howmuch || !howmuch)
				usr.grav = 0
				usr.GravID = 0
				usr.move = 1
				usr << "<b>You flick the switch and the gravity begins to shut down."
			if(howmuch > 1 && howmuch <= highgrav)
				if(usr.grav)
					usr << "<b>Please set the gravity to 0."
					return
				if(!usr.grav)
//					if(usr.state != "Normal")
	//					usr.stamina.value = 0
					if(usr.GravID && (src.GravID != usr.GravID))
						usr << "Sorry but you can only use one gravitron at a time!"
						return
					usr << "<b>The gravition computes and suddenly the room begins to get heavy."
					usr.grav = howmuch
					usr.GravID = src.GravID
					usr.move = 0
					sleep(20)
					if(!usr) return
					usr.playergravity()
			if(howmuch > highgrav)
				usr << "<b>This type of gravitron can't go up that amount of gravity."


mob
	proc
		playergravity()
			set background = 1
			spawn()
				while(src && grav != 0)
					stamina.value--
					powerlevel.max_value = round(src.powerlevel.max_value)
					ki.max_value = round(src.ki.max_value)
					if(powerlevel.value < 0)
						src << "You can't use this with a negative PL!"
						src.Die()
					else if(src.rest  || src.meditate ||((src.x >= 30&&src.x<=90)&&(src.y>=1&&src.y<=50)&&src.z == 3))
						src.grav = 0
						usr.GravID = 0
						alert("The gravity begins to shut down.")
						alert("You can't meditate/rest/be at checkin station while using the gravity!")
					else
						if(src.stamina.value <= 0)// && (src.ssjfp != 1 && src.state != "Super Saiyan"))
							src.grav = 0
							usr.GravID = 0
							alert("The gravity begins to shut down.")
							alert("You don't have any stamina to last against the gravity!")
						else
							if(src.immortal ||src.newb )
								src.newb = 0
								alert("You can't use the gravity while being immortal!")
							else
								var/success = rand(1,4)
								if(success==1)
									usr << "<FONT COLOR = GREEN><B>You feel the gravity pull down on you. You seem stronger."
									src.powerlevel.value -= src.grav * (rand(5,30))
									if(src.powerlevel.value <= 0)
										src.Die()
										return
									if(src.powerlevel.value >= 1)
										if(src.weight==0)
											src.powerlevel.max_value += src.grav / (rand(6,11))
											src.ki.max_value += src.grav / (rand(6,11))
											src.stamina.max_value += src.grav / (rand(600,1100))
											client.SaveMob()
										else
											src.powerlevel.max_value += src.grav / (rand(4,9))
											src.ki.max_value += src.grav / (rand(4,9))
											src.stamina.max_value += src.grav / (rand(400,900))
											client.SaveMob()

								else if(success == 2)
									usr << "<FONT COLOR = GREEN><B>You feel yourself getting use to the gravity."
									src.powerlevel.value -= src.grav * (rand(5,30))
									if(src.powerlevel.value <= 0)
										src.Die()
										return
									if(src.powerlevel.value >= 1)
										if(src.weight==0)
											src.powerlevel.max_value += src.grav / (rand(3,8))
											src.ki.max_value += src.grav / (rand(3,8))
											src.stamina.max_value += src.grav / (rand(300,800))
											client.SaveMob()
										else
											src.powerlevel.max_value += src.grav / (rand(1,6))
											src.ki.max_value += src.grav / (rand(1,6))
											src.stamina.max_value += src.grav / (rand(100,600))
											client.SaveMob()
								else if(success == 3)
									usr << "<FONT COLOR = GREEN><B>You feel the full force of the gravity!!"
									src.powerlevel.value -= src.grav * (rand(10,50))
									if(src.powerlevel.value <= 0)
										src.Die()
										return
									if(src.powerlevel.value >= 1)
										if(src.weight==0)
											src.powerlevel.max_value += src.grav / (rand(2,7))
											src.ki.max_value += src.grav / (rand(2,7))
											src.stamina.max_value += src.grav / (rand(200,700))
											client.SaveMob()
										else
											src.powerlevel.max_value += src.grav / (rand(0.5,5))
											src.ki.max_value += src.grav / (rand(0.5,5))
											src.stamina.max_value += src.grav / (rand(50,500))
											client.SaveMob()

								else
									usr << "<FONT COLOR = GREEN><B>You feel the gravity upon you."
									src.powerlevel.value -= src.grav * (rand(4,9))
									if(src.powerlevel.value <= 0)
										src.Die()
										return
									if(src.powerlevel.value >= 1)
										var.rgrav = rand(1,2)
										if(rgrav )
											if(src.weight==0)
												src.powerlevel.max_value += src.grav / (rand(15,20))
												src.ki.max_value += src.grav / (rand(15,20))
												src.stamina.max_value += src.grav / (rand(1500,2000))
												client.SaveMob()
											else
												src.powerlevel.max_value += src.grav / (rand(13,18))
												src.ki.max_value += src.grav / (rand(13,18))
												src.stamina.max_value += src.grav / (rand(1300,1800))
												client.SaveMob()
								sleep(rand(40,80))


obj
	items
		androidscanner
			radar = 1
			icon_state = ""
			icon = 'icons/scanner.dmi'
			name = "Built-In Scanner"
			value = 0
			verb
				Scan(mob/characters/M in view(6))
					set category = null
					if(M.npc )
						alert("You can't scan that.")
					else
						if(M.name == usr.name)
							alert("You can't scan yourself.")
						else if(M.npc  || M.scaninvis )
							alert("You can't scan that!")
						else
							view(6) << "<font color = yellow><B>[usr] begins to scan [M]."
							view(6) << 'sounds/scouter.wav'
							usr << "<FONT COLOR = YELLOW><B>Collecting data."
							sleep(rand(40,80))
							usr << "<FONT COLOR = YELLOW><B>Data collected!"
							usr << "<FONT COLOR = GREEN><B>[M]'s Status"
							usr << "<FONT COLOR = GREEN><b>[M] : [M.powerlevel.value] Powerlevel"
							usr << "<FONT COLOR = GREEN><b>[M] : [M.powerlevel.max_value] Maximum Powerlevel"
							usr << "<FONT COLOR = GREEN><b>[M] : [M.ki.value] Ki"
							usr << "<FONT COLOR = GREEN><b>[M] : [M.ki.max_value] Maximum Ki"

				Search()
					set category = null
					usr << "<FONT COLOR = YELLOW><B>Your current location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<FONT COLOR = YELLOW><B><B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<FONT COLOR = YELLOW><B><b>[M.name]'s location points off into the distance."
		time_capsule
			icon = 'icons/capsule.dmi'
			icon_state = ""
			name = "Capsule (Time Machine)"
			value = 50000
			var/out = 0
			verb
				Use()
					set category = null
					switch(alert("What do you wish to do?","Time Machine","Compress","Decompress"))
						if("Decompress")
							if(out )
								usr << "<FONT COLOR = YELLOW>You can't do this the Time Machine is already out."
							else
								usr.move = 0
								view(3) << "<FONT COLOR = YELLOW>[usr] clicks the Capsule (Time Machine), and throws it onto the ground."
								sleep(15)
								var/obj/timemachine/tmach = new/obj/timemachine(locate(usr.x-1,usr.y-3,usr.z))
								var/obj/t3/part1 = new /obj/t3(tmach.loc)
								part1.loc = locate(tmach.x+2,tmach.y,tmach.z)
								var/obj/t2/part2 = new /obj/t2(tmach.loc)
								part2.loc = locate(tmach.x+1,tmach.y,tmach.z)
								var/obj/t4/part3 = new /obj/t4(tmach.loc)
								part3.loc = locate(tmach.x,tmach.y+1,tmach.z)
								var/obj/t5/part4 = new /obj/t5(tmach.loc)
								part4.loc = locate(tmach.x+1,tmach.y+1,tmach.z)
								var/obj/t6/part5 = new /obj/t6(tmach.loc)
								part5.loc = locate(tmach.x+2,tmach.y+1,tmach.z)
								var/obj/t7/part6 = new /obj/t7(tmach.loc)
								part6.loc = locate(tmach.x,tmach.y+2,tmach.z)
								var/obj/t8/part7 = new /obj/t8(tmach.loc)
								part7.loc = locate(tmach.x+1,tmach.y+2,tmach.z)
								var/obj/t9/part8 = new /obj/t9(tmach.loc)
								part8.loc = locate(tmach.x+1,tmach.y+2,tmach.z)
								var/obj/t10/part9 = new /obj/t10(tmach.loc)
								part9.loc = locate(tmach.x,tmach.y+3,tmach.z)
								var/obj/t11/part10 = new /obj/t11(tmach.loc)
								part10.loc = locate(tmach.x+1,tmach.y+3,tmach.z)
								part1.overlays += 'icons/poof.dmi'
								part2.overlays += 'icons/poof.dmi'
								part3.overlays += 'icons/poof.dmi'
								part4.overlays += 'icons/poof.dmi'
								part5.overlays += 'icons/poof.dmi'
								part6.overlays += 'icons/poof.dmi'
								part7.overlays += 'icons/poof.dmi'
								part8.overlays += 'icons/poof.dmi'
								part9.overlays += 'icons/poof.dmi'
								part10.overlays += 'icons/poof.dmi'
								sleep(16)
								view(3) << "<FONT COLOR = YELLOW>[usr]'s Time Machine appears from out of the smoke."
								part1.overlays -= 'icons/poof.dmi'
								part2.overlays -= 'icons/poof.dmi'
								part3.overlays -= 'icons/poof.dmi'
								part4.overlays -= 'icons/poof.dmi'
								part5.overlays -= 'icons/poof.dmi'
								part6.overlays -= 'icons/poof.dmi'
								part7.overlays -= 'icons/poof.dmi'
								part8.overlays -= 'icons/poof.dmi'
								part9.overlays -= 'icons/poof.dmi'
								part10.overlays -= 'icons/poof.dmi'
								part1.owner = usr.name
								part2.owner = usr.name
								part3.owner = usr.name
								part4.owner = usr.name
								part5.owner = usr.name
								part6.owner = usr.name
								part7.owner = usr.name
								part8.owner = usr.name
								part9.owner = usr.name
								part10.owner = usr.name
								tmach.owner = usr.name
								tmach.name = "[usr]'s Time Machine"
								out = 1
								usr.random = rand(1,4)
								if(usr.random )
									usr.timem = 1
								if(usr.random == 2)
									usr.timem = 2
								if(usr.random == 3)
									usr.timem = 3
								if(usr.random == 4)
									usr.timem = 4
								usr.move = 1
						if("Compress")
							if(out == 0)
								alert("You don't even have a Time Machine to compress.")
							else
								out = 0
								for(var/obj/timemachine/A in world)
									if(A.owner == usr.name)
										del(A)
								for(var/obj/t2/B in world)
									if(B.owner == usr.name)
										del(B)
								for(var/obj/t3/C in world)
									if(C.owner == usr.name)
										del(C)
								for(var/obj/t4/D in world)
									if(D.owner == usr.name)
										del(D)
								for(var/obj/t5/E in world)
									if(E.owner == usr.name)
										del(E)
								for(var/obj/t6/F in world)
									if(F.owner == usr.name)
										del(F)
								for(var/obj/t7/G in world)
									if(G.owner == usr.name)
										del(G)
								for(var/obj/t8/H in world)
									if(H.owner == usr.name)
										del(H)
								for(var/obj/t9/I in world)
									if(I.owner == usr.name)
										del(I)
								for(var/obj/t10/J in world)
									if(J.owner == usr.name)
										del(J)
								for(var/obj/t11/K in world)
									if(K.owner == usr.name)
										del(K)
								view(6) << "<FONT COLOR = YELLOW>The Time Machine dissappears."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)

				Get()
					set category = null
					set src in oview(1)
					Move(usr)
		space_capsule
			icon = 'icons/capsule.dmi'
			icon_state = ""
			name = "Capsule (Space Pod)"
			value = 12500
			verb
				Use()
					set category = null
					switch(alert("What do you wish to do?","Spacepod","Compress","Decompress"))
						if("Decompress")
							if(usr.spout )
								usr << "<FONT COLOR = YELLOW>You can't do this the Space Pod is already out."
							else
								if(usr.dead )
									alert("You can not use this since you are dead!")
								else
									usr.move = 0
									view(3) << "<FONT COLOR = YELLOW>[usr] clicks the Capsule (Space Pod), and throws it onto the ground."
									sleep(15)
									var/obj/spout/spod = new/obj/spout(locate(usr.x,usr.y-1,usr.z))
									spod.overlays += 'icons/poof.dmi'
									sleep(20)
									spod.overlays -= 'icons/poof.dmi'
									usr.spout = 1
									view(3) << "<FONT COLOR = YELLOW>[usr]'s Space Pod appears from out of the smoke."
									usr.random = rand(1,4)
									if(usr.random )
										usr.spacep = 1
									if(usr.random == 2)
										usr.spacep = 2
									if(usr.random == 3)
										usr.spacep = 3
									if(usr.random == 4)
										usr.spacep = 4
									usr.move = 1
									spod.name = "[usr]'s Space Pod"
									spod.master = "[usr]"
						if("Compress")
							if(usr.spout == 0)
								alert("You don't even have a Space Pod to compress.")
							else
								usr.spout = 0
								for(var/obj/spout/O in world)
									if(O.master == usr.name)
										del(O)
								view(6) << "<FONT COLOR = YELLOW>The Space Pod flys into the sky and dissappears."
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y,usr.z)

				Get()
					set category = null
					set src in oview(1)
					Move(usr)


obj
	items
		yemmafruit
			icon = 'icons/turfs.dmi'
			icon_state = "yemmafruit"
			name = "King Yemma's Fruit"
			verb
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)
				Eat()
					set category = null
					if(usr.yemma )
						usr << "<b>You can't eat this, it would have no affect on you."
					else
						usr.yemma = 1
						usr.powerlevel.max_value *= 1.5
						usr.ki.max_value *= 1.5
						usr.powerlevel.value = usr.powerlevel.max_value
						usr.ki.value = usr.ki.max_value
						view(6) << 'sounds/sensu.wav'
						usr << "<b>Your muscles expand, then contract as you feel a mass surge of energy flow within you."
					del(src)

		hopesword2
			name = "\improper HOPE Sword"
			icon = 'icons/swordg.dmi'
			icon_state = ""
			worn = 0
			var/drawed = 0
			verb
				Wear()
					set category = null
					set name = "Wear"
					if(worn)
						if(drawed)
							worn = 0
							usr.overlays -= 'icons/sword.dmi'
							usr.worn -= src
							usr << "You remove [src]."
						else
							usr << "<B>You can't take this off! [src] is drawn!"
					else
						worn = 1
						usr.overlays += 'icons/sword.dmi'
						usr.worn += src
						usr << "You equip [src]."

				Draw_Sword()
					set category = null
					set name = "Draw HOPE Sword"
					if(drawed)
						drawed = 0
						usr.overlays -= 'icons/swordout.dmi'
						for(var/styles/sword/O in usr.contents)
							del(O)
						usr << "You place [src] back in the sheath."
					else
						drawed = 1
						usr.overlays += 'icons/swordout.dmi'
						usr.contents += new /styles/sword
						usr << "You draw [src]."
						view(20) << 'sounds/sword.wav'
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being used."
							for(var/styles/sword/O in usr.contents)
								del(O)
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		zsword
			name = "The Z Sword"
			icon = 'icons/swordg.dmi'
			icon_state = ""
			worn = 0
			var/drawed = 0
			verb
				Wear()
					set category = null
					set name = "Wear"
					if(!usr.pullzsword)
						usr << "You did not rightfully gotten this sword!"
						return
					if(src.worn )
						if(src.drawed == 0)
							src.worn = 0
							usr.overlays -= 'icons/sword.dmi'
							usr.worn -= src
							usr << "You remove the [src.name]."
						else
							usr << "<B>You can't take this off! [src] is drawn!"
					else
						src.worn = 1
						usr.overlays += 'icons/sword.dmi'
						usr.worn += src
						usr << "You equip the [src.name]."

				Draw_Sword()
					set category = null
					set name = "Draw Z Sword"
					if(!usr.pullzsword)
						usr << "You did not rightfully gotten this sword!"
						return
					if(src.drawed )
						src.drawed = 0
						for(var/styles/sword/O in usr.contents)
							del(O)
						usr.overlays -= 'icons/swordout.dmi'
						usr << "You place the Z sword back in the sheath."
					else
						src.drawed = 1
						usr.overlays += 'icons/swordout.dmi'
						usr.contents += new /styles/sword
						usr << "You draw the Z sword."
						view(20) << 'sounds/sword.wav'
				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being used."
						if(src.worn == 0)
							for(var/styles/sword/O in usr.contents)
								del(O)
							src.loc=locate(usr.x,usr.y+1,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

		powerpole
			name = "Power Pole"
			icon = 'icons/powerpoleg.dmi'
			icon_state = ""
			worn = 0
			var/drawed = 0
			value = 250000
			verb
				Wear()
					set category = null
					set name = "Wear"
					if(src.worn )
						if(src.drawed == 0)
							src.worn = 0
							usr.overlays -= 'icons/powerpole.dmi'
							usr.worn -= src
							usr << "You remove the [src.name]."
						else
							usr << "<B>You can't take this off! [src] is drawn!"
					else
						src.worn = 1
						usr.overlays += 'icons/powerpole.dmi'
						usr.worn += src
						usr << "You equip the [src.name]."

				Draw()
					set category = null
					set name = "Draw"
					if(src.drawed )
						src.drawed = 0
						for(var/styles/powerpole/O in usr.contents)
							del(O)
						usr.overlays -= 'icons/powerpoleout.dmi'
						usr.overlays -= 'icons/powerpolego.dmi'
						usr.overlays -= 'icons/powerpolego.dmi'
						usr.overlays += 'icons/powerpole.dmi'
						view(6) << 'sounds/poleaway.wav'
						usr << "You place the Power Pole back in the sheath."
					else
						src.drawed = 1
						usr.overlays -= 'icons/powerpole.dmi'
						usr.overlays += 'icons/powerpolego.dmi'
						usr.overlays += 'icons/powerpoleout.dmi'
						usr.contents += new /styles/powerpole
						usr << "You draw the Power Pole."

				Extend()
					set category = null
					set name = "Extend"
					if(src.drawed )
						if(usr.kame == 0)
							if(usr.move )
								switch(alert("Select a direction for the Power Pole to extend!","Power Pole","North and South", "East and West","Cancel"))
									if("North and South")
										usr.move = 0
										usr.kame = 1
										usr.attacking = 1
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										view(6) << "<FONT COLOR = RED>[usr]: </FONT>POWER POLE EXTEND!"
										view(6) << 'sounds/powerpole.wav'
										sleep(25)
										view(6) << 'sounds/ppextend.wav'
										var/obj/ppole/pole1 = new(usr.loc)
										var/obj/ppole/pole2 = new(usr.loc)
										pole1.power = (usr.powerlevel.value * 0.5)
										pole2.power = (usr.powerlevel.value * 0.5)
										pole1.killedBy = usr
										pole2.killedBy = usr
										pole1.attacker = usr
										pole2.attacker = usr
										pole1.dir = NORTH
										pole2.dir = SOUTH
										walk(pole1, pole1.dir)
										walk(pole2, pole2.dir)
										spawn(250)
											usr.move = 1
											usr.kame = 0
											usr.attacking = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
									if("East and West")
										usr.move = 0
										usr.kame = 1
										usr.attacking = 1
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										view(6) << "<FONT COLOR = RED>[usr]: </FONT>POWER POLE EXTEND!"
										view(6) << 'sounds/powerpole.wav'
										sleep(25)
										view(6) << 'sounds/ppextend.wav'
										var/obj/ppole/pole1 = new(usr.loc)
										var/obj/ppole/pole2 = new(usr.loc)
										pole1.power = (usr.powerlevel.value * 0.5)
										pole2.power = (usr.powerlevel.value * 0.5)
										pole1.killedBy = usr
										pole2.killedBy = usr
										pole1.attacker = usr
										pole2.attacker = usr
										pole1.dir = EAST
										pole2.dir = WEST
										walk(pole1, pole1.dir)
										walk(pole2, pole2.dir)
										spawn(250)
											usr.move = 1
											usr.kame = 0
											usr.attacking = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
									if("Cancel")
										..()
							else
								alert("You are doing something!")
						else
							alert("Your already using this, or you are using a technique!")
					else
						alert("You do not have the Power Pole drawn!")

				Drop()
					set category = null
					if(usr.fused )
						usr << "You can't drop this!"
						return
					else
						if(src.worn )
							usr << "Not while its being used."
						if(src.worn == 0)
							src.loc=locate(usr.x,usr.y,usr.z)
				Get()
					set category = null
					set src in oview(1)
					Move(usr)

obj
	ppoletrail
		name = "Power Pole"
		icon = 'icons/powerpolet.dmi'
		icon_state = "trail"
		density = 1
		layer = 9
		var
			owner

obj
	ppole
		name = "Power Pole"
		icon = 'icons/powerpolet.dmi'
		icon_state = "pole"
		density = 1
		layer = 9
		var
			power
			mob
				characters
					killedBy
			mob
				attacker
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				Obstacle.powerlevel.value -= power
				if(Obstacle.mon )
					if(Obstacle.powerlevel.value <=0)
						if(Obstacle.expkn == null && Obstacle:expkk == null)
							Obstacle.expkn = "[killedBy.name]"
							Obstacle.expkk = "[killedBy.key]"
				Obstacle.Die(killedBy)
				killedBy.kame = 0
				killedBy.move = 1
				killedBy.client.show_verb_panel = 1
				killedBy.hideipan = 1
				killedBy.attacking = 0
				for(var/obj/ppoletrail/O in world)
					if(O.owner==killedBy)
						del(O)
				for(var/obj/ppole/E in world)
					if(E.killedBy==killedBy)
						del(E)
				del(src)
			killedBy.kame = 0
			killedBy.move = 1
			killedBy.client.show_verb_panel = 1
			killedBy.attacking = 0
			for(var/obj/ppoletrail/O in world)
				if(O.owner==killedBy)
					del(O)
			for(var/obj/ppole/E in world)
				if(E.killedBy==killedBy)
					del(E)
			del(src)


obj
	heal
		icon = 'icons/healingpod.png'
		name = "Healing Pod"
		layer = 10
		density = 1
		verb
			Use()
				set src in oview(1)
				set name = "Use"
				set category = ""
				view(6) << "<FONT COLOR = BLUE><B>[usr] enters the Healing Pod."
				usr.loc=locate(src.x,src.y,src.z)
				usr.move = 0
				usr.kame = 1
				usr.heal = 1
				usr.client.show_verb_panel = 0
				sleep(50)
				usr << "<B><FONT COLOR = BLUE>You begin to heal inside the Healing Pod."
				usr.playerheal()

mob/proc
	playerheal()
		spawn()
			set background = 1
			while(src.heal )
			{
				var/podregen = src.powerlevel.max_value * 0.05
				src.powerlevel.value += podregen
				if(src.powerlevel.value >= src.powerlevel.max_value)
					src.powerlevel.value = src.powerlevel.max_value
					src.powerlevel.value += 0
					src.loc=locate(src.x,src.y-1,src.z)
					usr << "<B><FONT COLOR = BLUE>You leave the Healing Pod, fully restored."
					oview(6) << "<B><FONT COLOR = BLUE>[usr] exits the Healing Pod."
					src.client.show_verb_panel = 1
					src.move = 1
					src.heal = 0
					src.kame = 0
				sleep(25)

			}

obj
	halo
		icon = 'icons/halo.dmi'
		layer = 9
obj
	rapidki
		name = "Renzoku Energy Dan"
		icon = 'icons/weight-objs.dmi'
		icon_state = "rblast"
		layer = 9
obj
	ren
		icon = 'icons/rapidki.dmi'
		icon_state = ""
		layer = 9

obj
	ren2
		icon = 'icons/rapidki.dmi'
		icon_state = "2"
		layer = 9

obj
	moon
		name = "False Moon"
		icon = 'icons/fakemoon.dmi'
		layer = 9

obj
	assim
		icon = 'icons/turfs.dmi'
		icon_state = "assim"
		layer = 9
obj
	cheld
		icon = 'icons/chalo.dmi'
		icon_state = "held"
		layer = 9
obj
	erheld
		icon = 'icons/cki.dmi'
		icon_state = "erheld"
		layer = 9

obj
	timeconsole
		name = "Time Machine Console"
		icon = 'icons/computer.dmi'
		icon_state = ""
		density = 1
		verb
			Destination()
				set name = "Use"
				set category = "Time Machine"
				set src in oview(1)
				switch(alert("System: Select a option.","Computer Pilot","Set Timeline","Reset Timeline"))
					if("Set Timeline")
						if(usr.destset )
							alert("You already have a destination set!")
						else
							switch(input("System: Select a timeline.", "Dragonball Online", text) in list ("Trunks's Timeline","Cell's Timeline","Present Timeline","Cancel"))
								if("Present Timeline")
									usr.destset = 1
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Timeline set to Present."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now time warping to Present Timeline."
									sleep(1750)
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Entering portal to Present Timeline."
									sleep(20)
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Portal entrance complete, now at Present Timeline."
									usr.destset = 0
									usr.timeearth = 1

								if("Trunks's Timeline")
									alert("System: Destination unavailable at the moment.")

								if("Cell's Timeline")
									alert("System: Destination unavailable at the moment.")


					if("Reset Timeline")
						if(usr.destset )
							switch(input("System: What was your destination?", "Dragonball Online", text) in list ("Trunks's Timeline","Cell's Timeline","Present Timeline"))
								if("Present Timeline")
									usr.destset = 1
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Timeline set to Present."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now time warping to Present Timeline."
									sleep(1750)
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Entering portal to Present Timeline."
									sleep(20)
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Portal entrance complete, now at Present Timeline."
									usr.destset = 0
									usr.timeearth = 1

								if("Trunks's Timeline")
									alert("System: Destination unavailable at the moment.")

								if("Cell's Timeline")
									alert("System: Destination unavailable at the moment.")
						else
							alert("System: You do not have a destination set!")


turf
	timehatch
		name = "Time Machine Hatch"
		icon = 'icons/hatch.dmi'
		icon_state = "closed"
		opacity = 1
		Entered(var/mob/M)
			if(ismob(M))
				if(usr.destset )
					usr << "<B>You can't leave now!"
				else
					if(usr.timetrunks )
						usr.loc=locate(usr.hx, usr.hy, usr.hz)
						usr.density = 1
						usr.spout = 0
						usr.flight = 0
						usr.landnamek = 0
						usr.landearth = 0
						usr.landyard = 0
						usr.landveg = 0
						usr.timetrunks = 0
						usr.timeearth = 0
						alert("You leave the Time Machine, and end up in the 'Trunks's Timeline'.")
					else
						if(usr.timeearth )
							usr.loc=locate(usr.hx, usr.hy, usr.hz)
							usr.density = 1
							usr.spout = 0
							usr.flight = 0
							usr.landnamek = 0
							usr.landearth = 0
							usr.landyard = 0
							usr.landveg = 0
							usr.timetrunks = 0
							usr.timeearth = 0
							alert("You leave the Time Machine, and end up in the 'Present Timeline'.")
			else
				del(M)
				return

mob
	proc
		spacetravel()
			spawn(1)
				set background = 1
				while(src.spt > 0)
				{
					sleep(100)
					src.spt--
					if(src.spt == 1)
						if(src.destset == 1)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> We have landed at 'Earth'!"
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> Be prepared to be unboarded! The expected time to wait is one minute!"
						if(src.destset == 2)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> We have landed at 'Namek'!"
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> Be prepared to be unboarded! The expected time to wait is one minute!"
						if(src.destset == 3)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> We have landed at 'Yardrat'!"
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> Be prepared to be unboarded! The expected time to wait is one minute!"
						if(src.destset == 4)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> We have landed at 'New Vegeta'!"
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK> Be prepared to be unboarded! The expected time to wait is one minute!"
					if(src.spt <= 0)
						src.spt = null
						if(src.destset == 1)
							src.loc=locate(73,79,1)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>You leave the spacepod and arrive at 'Earth'!"
							src.destset = null
						else if(src.destset == 2)
							src.loc=locate(40,90,5)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>You leave the spacepod and arrive at 'Namek'!"
							src.destset = null
						else if(src.destset == 3)
							src.loc=locate(39,30,16)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>You leave the spacepod and arrive at 'Yardrat'!"
							src.destset = null
						else if(src.destset == 4)
							src.loc=locate(133,20,17)
							usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>You leave the spacepod and arrive at 'New Vegeta'!"
							src.destset = null
						else
							src.loc = locate(hx, hy, hz)
							usr << "Seems like the system had a minor bug and you were taken to your hometown!"
							src.destset = null
				}
obj
	ccsspaceconsole
		name = "Space Pod Console"
		icon = 'icons/turfs.dmi'
		icon_state = "computer"
		density = 1
		verb
			Destination()
				set name = "Use"
				set category = "Space Pod"
				set src in oview(1)
				switch(alert("System: Select a option.","Computer Pilot","Set Destination","Reset Destination"))
					if("Set Destination")
						if(usr.destset )
							alert("You already have a destination set!")
						else
							switch(input("System: Select a destination.", "Dragonball Online", text) in list ("Earth","Namek","Yardrat","New Vegeta","Cancel"))
								if("Earth")
									usr.destset = 1
									usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Earth."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Earth."
									usr.spt = 30
									usr.spacetravel()
								if("Namek")
									usr.destset = 2
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Namek."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Namek."
									usr.spt = 31
									usr.spacetravel()
								if("Yardrat")
									usr.destset = 3
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Yardrat."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Yardrat."
									usr.spt = 34
									usr.spacetravel()
								if("New Vegeta")
									usr.destset = 4
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to New Vegeta."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to New Vegeta."
									usr.spt = 35
									usr.spacetravel()

					if("Reset Destination")
						if(usr.destset >= 1)
							switch(input("System: What was your destination?", "Dragonball Online", text) in list ("Earth","Namek","Yardrat","New Vegeta"))
								if("Earth")
									usr.destset = 1
									usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Earth."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Earth."
									usr.spt = 30
									usr.spacetravel()
								if("Namek")
									usr.destset = 2
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Namek."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Namek."
									usr.spt = 31
									usr.spacetravel()

								if("Yardrat")
									usr.destset = 3
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Yardrat."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Yardrat."
									usr.spt = 34
									usr.spacetravel()
								if("New Vegeta")
									usr.destset = 4
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to New Vegeta."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = "computer"
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to New Vegeta."
									usr.spt = 35
									usr.spacetravel()
						else
							alert("System: You do not have a destination set!")

obj
	spaceconsole
		name = "Space Pod Console"
		icon = 'icons/computer.dmi'
		icon_state = ""
		density = 1
		verb
			Destination()
				set name = "Use"
				set category = "Space Pod"
				set src in oview(1)
				switch(alert("System: Select a option.","Computer Pilot","Set Destination","Reset Destination"))
					if("Set Destination")
						if(usr.destset )
							alert("You already have a destination set!")
						else
							switch(input("System: Select a destination.", "Dragonball Online", text) in list ("Earth","Namek","Yardrat","New Vegeta","Cancel"))
								if("Earth")
									usr.destset = 1
									usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Earth."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Earth."
									usr.spt = 30
									usr.spacetravel()
								if("Namek")
									usr.destset = 2
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Namek."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Namek."
									usr.spt = 31
									usr.spacetravel()
								if("Yardrat")
									usr.destset = 3
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Yardrat."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Yardrat."
									usr.spt = 34
									usr.spacetravel()
								if("New Vegeta")
									usr.destset = 4
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to New Vegeta."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to New Vegeta."
									usr.spt = 35
									usr.spacetravel()

					if("Reset Destination")
						if(usr.destset >= 1)
							switch(input("System: What was your destination?", "Dragonball Online", text) in list ("Earth","Namek","Yardrat","New Vegeta"))
								if("Earth")
									usr.destset = 1
									usr << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Earth."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Earth."
									usr.spt = 30
									usr.spacetravel()
								if("Namek")
									usr.destset = 2
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Namek."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Namek."
									usr.spt = 31
									usr.spacetravel()

								if("Yardrat")
									usr.destset = 3
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to Yardrat."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to Yardrat."
									usr.spt = 34
									usr.spacetravel()
								if("New Vegeta")
									usr.destset = 4
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Destination set to New Vegeta."
									src.icon_state = "process"
									sleep(20)
									src.icon_state = ""
									view(6) << "<B><FONT COLOR = red>System: </B><FONT COLOR = BLACK>Now flying to New Vegeta."
									usr.spt = 35
									usr.spacetravel()
						else
							alert("System: You do not have a destination set!")


turf
	spacehatch
		name = "Space Pod Hatch"
		icon = 'icons/hatch.dmi'
		icon_state = "closed"
		opacity = 1
		Entered(var/mob/M)
			if(ismob(M))
				if(M.destset )
					M << "<B>You're in flight, you don't want to be sucked out do you?"
				else
					if(M.landnamek )
						M.loc=locate(40,90,5)
						M.density = 1
						M.spout = 0
						M.flight = 0
						M.landnamek = 0
						M.landearth = 0
						M.landyard = 0
						M.landveg = 0
						M.client.SaveMob()
						alert(M, "You leave the Space Pod, and end up in 'Namek'.")
					else
						if(M.landearth )
							M.loc=locate(73,79,1)
							M.density = 1
							M.spout = 0
							M.flight = 0
							M.landnamek = 0
							M.landearth = 0
							M.landyard = 0
							M.landveg = 0
							M.client.SaveMob()
							alert(M, "You leave the Space Pod, and end up in 'Earth'.")
						else
							if(M.landyard )
								M.loc=locate(39,30,16)
								M.density = 1
								M.spout = 0
								M.flight = 0
								M.landnamek = 0
								M.landearth = 0
								M.landyard = 0
								M.landveg = 0
								M.client.SaveMob()
								alert(M, "You leave the Space Pod, and end up in 'Yardrat'.")
							else
								if(M.landveg )
									M.loc=locate(133,20,17)
									M.density = 1
									M.spout = 0
									M.flight = 0
									M.landnamek = 0
									M.landearth = 0
									M.landyard = 0
									M.landveg = 0
									M.client.SaveMob()
									alert(M, "You leave the Space Pod, and end up in 'New Vegeta'.")
			else
				del(M)
				return


obj/planet
	name = "King Kai's Planet"
	icon = 'icons/planet.dmi'
	verb
		Jump()
			set src in oview(4)
			set category = "Jump"
			if(usr.jumpingp )
				..()
			else
				switch(rand(1,5))
					if(1)
						usr.jumpingp = 1
						if(usr.flight != 1)
							alert("You try to jump onto King Kai's planet..")
							sleep(8)
							usr.loc=locate(74,76,8)
							usr.jumpingp = 0
							alert("But, you have fell down back to HFIL.")
						else
							alert("You try to jump onto King Kai's planet..")
							sleep(8)
							usr.loc=locate(17,82,3)
							usr.jumpingp = 0
							alert("You flew on to King Kai's planet safely.")
					else
						alert("You try to jump onto King Kai's planet..")
						sleep(8)
						usr.loc=locate(17,82,3)
						usr.jumpingp = 0
						alert("You succesfully jump on to King Kai's planet safely.")
mob/var/tmp/jumpingp
obj/fplanet
	name = "King Kai's Planet"
	icon = 'icons/planet.dmi'
	verb
		Jump()
			set src in oview(4)
			set category = "Jump"
			alert("You can't go back to King Kai's planet!")

turf/lookout
	name = "Kami's Lookout"
	icon = 'icons/kamilookout.dmi'
	icon_state = "1"
	density = 1
	Entered(var/mob/M)
		if(ismob(M))
			alert("You fly up to Kami's Lookout.")
			M.loc=locate(126,98,3)
		else
			del(M)
			return

turf/lookout2
	name = "Kami's Lookout"
	icon = 'icons/kamilookout.dmi'
	icon_state = "2"
	Entered(var/mob/M)
		if(ismob(M))
			alert("You fly up to Kami's Lookout.")
			M.loc=locate(126,98,3)
		else
			del(M)
			return

turf/leave
	name = "Dragonball Online"
	icon = 'icons/turfs.dmi'
	icon_state = "tourneyfloor"
	Entered(var/mob/M)
		if(ismob(M))
			alert("You leave Kami's Lookout.")
			M.loc=locate(33,123,6)
		else
			return

obj
	techs
		Create
			name = "Materialize"
			icon = 'icons/techhands.dmi'
			icon_state = "hand"
			Click()


				switch(input("What do you want to make? (NOTE: This skill takes away your maximum powerlevel to materialize objects.)","Materialize") in list ("Scouters","Armors","Edibles","Cancel"))
					if("Scouters")
						switch(input("Select a scouter you wish to create.","Scouter") in list ("Class I (Red) (1500)","Class I (Blue) (1500)","Class I (Green) (1500)","Class I (Yellow) (1500)","Class II (Red) (3000)","Class II (Blue) (3000)","Class II (Green) (3000)","Class II (Yellow) (3000)","Cancel"))
							if("Class I (Red) (1500)")
								if(usr.powerlevel.max_value < 1500)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 1500)
									var/obj/O = new /obj/items/c1scouterr(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 1500

							if("Class I (Blue) (1500)")
								if(usr.powerlevel.max_value < 1500)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 1500)
									var/obj/O = new /obj/items/c1scouterb(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 1500

							if("Class I (Yellow) (1500)")
								if(usr.powerlevel.max_value < 1500)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 1500)
									var/obj/O = new /obj/items/c1scoutery(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 1500

							if("Class I (Green) (1500)")
								if(usr.powerlevel.max_value < 1500)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 1500)
									var/obj/O = new /obj/items/c1scouterg(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 1500

							if("Class II (Red) (3000)")
								if(usr.powerlevel.max_value < 3000)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 3000)
									var/obj/O = new /obj/items/c2scouterr(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 3000

							if("Class II (Blue) (3000)")
								if(usr.powerlevel.max_value < 3000)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 3000)
									var/obj/O = new /obj/items/c2scouterb(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 3000

							if("Class II (Green) (3000)")
								if(usr.powerlevel.max_value < 3000)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 3000)
									var/obj/O = new /obj/items/c2scouterg(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 3000

							if("Class II (Yellow) (3000)")
								if(usr.powerlevel.max_value < 3000)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 3000)
									var/obj/O = new /obj/items/c2scoutery(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 3000

					if("Edibles")
						switch(input("Select a type of food you wish to create.","Edibles") in list ("Apple (500)","Green Apple (750)","Cancel"))
							if("Apple (500)")
								if(usr.powerlevel.max_value < 500)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 500)
									var/obj/O = new /obj/items/apple(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 500

							if("Green Apple (750)")
								if(usr.powerlevel.max_value < 750)
									alert("You are too weak to create this!")
								if(usr.powerlevel.max_value >= 750)
									var/obj/O = new /obj/items/greenapple(locate(usr.x,usr.y,usr.z))
									view(6) << "<FONT COLOR = BLUE>[usr] creates a [O.name]!"
									usr.powerlevel.max_value -= 750

					if("Armors")
						alert("Not implemented yet!")


obj
	zswordquest
		name="The Z Sword"
		icon = 'icons/turfs.dmi'
		icon_state = "sword"
		density = 1
		verb
			Pull()
				set name = "Pull"
				set category = "The Z Sword"
				set src in oview(2)
				if(usr.pullzsword )
					alert("You have already pulled the sword, out of the rock already.")
				else
					usr.random = rand(1,100)
					if(usr.random == 100)
						if(usr.powerlevel.value > 7500000)
							usr.pullzsword = 1
							alert("You pull the Z Sword out of the rock!")
							usr << "<B>You recieve 'The Z Sword'."
							usr.contents += new /obj/items/zsword
						else
							alert("You feel the sword budge, but you do not have enough strength to pull it out of the rock.")
					else
						usr << "<B>You have failed to pull out the Z Sword."

obj
	techs
		spiritball
			name = "Spirit Ball"
			icon = 'icons/spiritball.dmi'
			icon_state = ""
			Click()


				if(usr.kame )
					alert("You can't use 'Spirit Ball' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Spirit Ball' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							var/dam = input("How much energy do you wish to put in this attack. (You have [usr.ki.value] avaliable for use!)") as num
							if(dam <= 0)
								alert("You can't put that amount of energy into your attack.")
							else
								if(dam > usr.ki.value)
									alert("You can't put that amount of energy into your attack.")
								else
									if(dam <= usr.ki.value)
										usr.ki.value -= dam
										usr.kame = 1
										usr.attacking = 1
										usr.frozen = 1
										usr.move = 0
										usr.client.show_verb_panel = 0
										usr.overlays += /obj/kame
										view(10) << 'sounds/mas_charge.wav'
										var/icon/aura = new('icons/whiteaura.dmi')
										aura.Blend(usr.customauracolor)
										usr.underlays += aura
										view(10) << 'sounds/aura.wav'
										usr << "<b><font color=blue>A aura surrounds your body as you gather energy."
										usr.auratoggle = 1
										usr.move = 0
										sleep(30)
										view(10) << "<FONT COLOR = RED>[usr]:</FONT> SPIRIT."
										sleep(32)
										view(10) << "<FONT COLOR = RED>[usr]:</FONT> BALL!!"
										usr.overlays -= /obj/kame
										usr.underlays -= aura
										view(10) << 'sounds/kifire.wav'
										var/obj/spiritball/blast = new(usr.loc)
										blast.dir = usr.dir
										blast.power = (dam * 5)
										blast.killedBy = usr
										blast.killer = usr
										usr.client.eye = blast
										usr.blast = "Spirit Ball"
										usr.client.perspective = EYE_PERSPECTIVE
										walk(blast, blast.dir)
										spawn(250)
											usr.client.eye = usr
											usr.kame = 0
											usr.attacking = 0
											usr.frozen = 0
											usr.move = 1
											usr.client.show_verb_panel = 1
											usr.blast = 0
											usr.client.perspective = MOB_PERSPECTIVE
											del(blast)
											del(blast)
											del(blast)
obj
	spiritball
		name = "Spirit Ball"
		icon = 'icons/spiritball.dmi'
		icon_state = ""
		density = 1
		layer = 9
		var
			power
			mob
				characters
					killedBy
			mob
				killer
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						killedBy.kame = 0
						killedBy.attacking = 0
						killedBy.frozen = 0
						killedBy.move = 1
						killedBy.client.show_verb_panel = 1
						killedBy.hideipan = 0
						killedBy.client.eye = killer
						killedBy.blast = 0
						killedBy.client.perspective = MOB_PERSPECTIVE
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon )
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle.expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,2)
					killedBy.kame = 0
					killedBy.attacking = 0
					killedBy.frozen = 0
					killedBy.move = 1
					killedBy.client.show_verb_panel = 1
					killedBy.hideipan =  0
					killedBy.client.eye = killer
					killedBy.blast = 0
					killedBy.client.perspective = MOB_PERSPECTIVE
					Obstacle.Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,2)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,2)
				killedBy.kame = 0
				killedBy.attacking = 0
				killedBy.frozen = 0
				killedBy.move = 1
				killedBy.client.show_verb_panel = 1
				killedBy.hideipan = 0
				killedBy.client.eye = killer
				killedBy.blast = 0
				killedBy.client.perspective = MOB_PERSPECTIVE
				del(src)
client
	North()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = NORTH
					walk(Z, Z.dir)
		else
			..()
	South()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = SOUTH
					walk(Z, Z.dir)
		else
			..()
	East()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = EAST
					walk(Z, Z.dir)
		else
			..()
	West()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = WEST
					walk(Z, Z.dir)
		else
			..()
	Northeast()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = NORTHEAST
					walk(Z, Z.dir)
		else
			..()
	Northwest()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = NORTHWEST
					walk(Z, Z.dir)
		else
			..()
	Southeast()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = SOUTHEAST
					walk(Z, Z.dir)
		else
			..()
	Southwest()
		if(mob.blast == "Spirit Ball")
			for(var/obj/spiritball/Z in world)
				if(Z.killer==mob)
					Z.dir = SOUTHWEST
					walk(Z, Z.dir)
		else
			..()
obj
	spout
		name = "Space Pod"
		icon = 'icons/spacepod.dmi'
		icon_state = ""
		density = 1
		var
			master
		verb
			Enter_SP()
				set src in oview(1)
				set name = "Enter Space Pod"
				set category = "Space Pod"
				if(usr.dead )
					usr << "<B>You can't enter the Space Pod, you're dead!"
				else
					if(usr.spacep == 0)
						usr << "<B><FONT COLOR>You can't enter this Space Pod, you do not own it."
					else
						if(usr.spacep )
							usr.oldloc = usr.loc
							usr.loc = locate(22,131,4)
							usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
							usr.spout = 0
							usr.client.SaveMob()
							for(var/obj/spout/O in world)
								if(O.master == usr.name)
									del(O)
						else
							if(usr.spacep == 2)
								usr.oldloc = usr.loc
								usr.loc = locate(129,131,4)
								usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
								usr.spout = 0
								usr.client.SaveMob()
								for(var/obj/spout/O in world)
									if(O.master == usr.name)
										del(O)
							else
								if(usr.spacep == 3)
									usr.oldloc = usr.loc
									usr.loc = locate(22,19,4)
									usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
									usr.spout = 0
									usr.client.SaveMob()
									for(var/obj/spout/O in world)
										if(O.master == usr.name)
											del(O)
								else
									if(usr.spacep == 4)
										usr.oldloc = usr.loc
										usr.loc = locate(129,19,4)
										usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
										usr.spout = 0
										usr.client.SaveMob()
										for(var/obj/spout/O in world)
											if(O.master == usr.name)
												del(O)

obj
	ccsp
		name = "Space Pod"
		icon = 'icons/spacepod.dmi'
		icon_state = ""
		density = 1
		verb
			Enter_SP()
				set src in oview(1)
				set name = "Enter Space Pod"
				set category = "Space Pod"
				var/rnd = rand(1,4)
				if(rnd )
					usr.oldloc = usr.loc
					usr.loc = locate(22,131,4)
					usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
					usr.spout = 0
					usr.client.SaveMob()
					for(var/obj/spout/O in world)
						if(O.master == usr.name)
							del(O)
				else
					if(rnd == 2)
						usr.oldloc = usr.loc
						usr.loc = locate(129,131,4)
						usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
						usr.spout = 0
						usr.client.SaveMob()
						for(var/obj/spout/O in world)
							if(O.master == usr.name)
								del(O)
					else
						if(rnd == 3)
							usr.oldloc = usr.loc
							usr.loc = locate(22,19,4)
							usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
							usr.spout = 0
							usr.client.SaveMob()
							for(var/obj/spout/O in world)
								if(O.master == usr.name)
									del(O)
						else
							if(rnd == 4)
								usr.oldloc = usr.loc
								usr.loc = locate(129,19,4)
								usr << "<FONT COLOR = YELLOW>You enter the Space Pod."
								usr.spout = 0
								usr.client.SaveMob()
								for(var/obj/spout/O in world)
									if(O.master == usr.name)
										del(O)

obj/timemachineproto
	name = "Time Machine (Prototype)"
	icon = 'icons/timemachine.png'
	icon_state = ""
	density = 1
	layer = 9
	Click()
		alert("You look at the Time Machine, it seems in the production stage.")

obj/metalmonitor
	name = "Monitor"
	icon = 'icons/1.png'
	icon_state = ""
	density = 1
	layer = 9

obj/metaltable
	name = "Table"
	icon = 'icons/2.png'
	icon_state = ""
	density = 1
obj/gerometaltable
	name = "Table"
	icon = 'icons/2.png'
	icon_state = ""
	density = 1

obj/metalhookin
	name = "Computer"
	icon = 'icons/3.png'
	icon_state = ""
	density = 1
	verb
		Use()
			set name = "Use"
			set category = "Other"
			set src in oview(1)
			if(usr.race == "Changling")
				if(usr.powerlevel.max_value >= 16000000)
					if(usr.ki.max_value >= 1600000)
						if(usr.state == "Normal")
							alert("You are a Changling and can go through this process.")
							alert("This process will make you stronger and give you some new ablities, however it will remove your transformations and alter your physical look.")
							switch(alert("Do you wish to continue? (This process takes up to 2-5 minutes)","Computer","Yes", "No"))
								if("Yes")
									if(usr.upgrade == 0||usr.upgrade == null)
										for(var/obj/transes/transform/E in usr.contents)
											usr.contents -= E
										for(var/obj/transes/mystic/F in usr.contents)
											usr.contents -= F
										usr.master = ""
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										usr.upgrade = 1
										usr.move = 0
										usr << "<B><FONT COLOR = YELLOW>Beginning process. (DO NOT LOG OFF, YOU HAVE BEEN WARNED)"
										sleep(rand(40,120))
										usr << "<FONT COLOR = RED>You suddenly fall asleep as the process continues."
										usr << sound('sounds/elec.wav',1)
										usr.loc=locate(0,0,0)
										usr << "<FONT COLOR = YELLOW>Adding Built-In Scanner."
										sleep(rand(200,800))
										usr << "<FONT COLOR = YELLOW>Adding Built-In Scanner complete."
										usr.contents += new /obj/items/androidscanner
										usr << "<FONT COLOR = YELLOW>Improving Energy Capablities."
										sleep(rand(400,2000))
										usr << "<FONT COLOR = YELLOW>Improving Energy Capablities complete."
										usr.ki.max_value *= 2
										usr.ki.value = usr.ki.max_value
										usr << "<FONT COLOR = YELLOW>Improving Power Capablities."
										sleep(rand(400,2000))
										usr << "<FONT COLOR = YELLOW>Improving Power Capablities complete."
										usr.powerlevel.max_value *= 2
										usr.powerlevel.value = usr.powerlevel.max_value
										usr << "<FONT COLOR = YELLOW>Process complete."
										usr.icon = 'icons/metal_frieza.dmi'
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr << 'sounds/blank.wav'
										usr.loc=locate(129,131,11)
										usr.move = 1
										usr.name = "Metal [usr.name]"
										usr.client.SaveMob()
										if(frcm == null)
											if(!usr.fused)
												frcm = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
												world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Metal Changling</font></b>"
										usr << "<FONT COLOR = RED>You awaken with new found ablities and strengths."
								else
									alert("You already have been upgraded.")
						else
							alert("You must be in your normal state to begin this process.")
					else
						alert("Your Ki isn't strong enough to handle this process.")
				else
					alert("You aren't strong enough to handle this process.")
			else
				alert("You need to be of the Changling race to use this machine.")




obj/MysticAuraTop
	icon = 'icons/mysticaura_new.dmi'
	icon_state = "top"
	pixel_y = 32
	layer=9
	density = 0

obj/MysticAuraBottom
	icon = 'icons/mysticaura_new.dmi'
	icon_state = "bottom"
	density = 0

obj/SSAuraTop
	icon = 'icons/ssjaura.dmi'
	icon_state = "top"
	pixel_y = 32
	layer=9
	density = 0

obj/SSAuraBottom
	icon = 'icons/ssjaura.dmi'
	icon_state = "bottom"
	density = 0
obj/BlackAuraTop
	icon = 'blackaura.dmi'
	icon_state = "top"
	pixel_y = 32
	layer=9
	density = 0

obj/BlackAuraBottom
	icon = 'blackaura.dmi'
	icon_state = "bottom"
	density = 0

obj/FAuraTop
	icon = 'icons/flameform.dmi'
	icon_state = "top"
	pixel_y = 32
	layer=9
	density = 0

obj/FAuraBottom
	icon = 'icons/flameform.dmi'
	icon_state = "bottom"
	density = 0

obj/ThroneTop
	icon = 'icons/redthrone.dmi'
	icon_state = "top"
	density = 0
	pixel_y = 32
	layer = 9

obj/RedThrone
	name = "Throne"
	icon = 'icons/redthrone.dmi'
	icon_state = ""
	density = 1
	New()
		src.overlays+=new/obj/ThroneTop

obj
	bukuspot
		name="Dragonball Online"
		density=0
		icon='icons/buku.dmi'
		icon_state=""
		pixel_y=-86
		layer=99

obj
	purplightningbolt
		name="Purple Lightning Bolt"
		density=0
		icon='icons/purp_lightning.dmi'
		icon_state="5"
		layer=99
		New()
			src.overlays+=new/obj/purplightpro/pl01
			src.overlays+=new/obj/purplightpro/pl02
			src.overlays+=new/obj/purplightpro/pl03
			src.overlays+=new/obj/purplightpro/pl04

obj
	redlightningbolt
		name="Red Lightning Bolt"
		density=0
		icon='icons/red_lightning.dmi'
		icon_state="5"
		layer=99
		New()
			src.overlays+=new/obj/redlightpro/rl01
			src.overlays+=new/obj/redlightpro/rl02
			src.overlays+=new/obj/redlightpro/rl03
			src.overlays+=new/obj/redlightpro/rl04

obj
	lightningbolt
		name="Lightning Bolt"
		density=0
		icon='icons/lightning.dmi'
		icon_state="5"
		layer=99
		New()
			src.overlays+=new/obj/lightpro/l01
			src.overlays+=new/obj/lightpro/l02
			src.overlays+=new/obj/lightpro/l03
			src.overlays+=new/obj/lightpro/l04

obj
	ssbombprojectile
		name="Absorbed Spirit Bomb"
		density=0
		icon='icons/ssjspiritbomb/ssbomb00.dmi'
		icon_state="big"
		layer=999
		var/power = 500
		New()
			src.overlays+=new/obj/ssbombpro/s01
			src.overlays+=new/obj/ssbombpro/s02
			src.overlays+=new/obj/ssbombpro/s03
			src.overlays+=new/obj/ssbombpro/s04
			src.overlays+=new/obj/ssbombpro/s05
			src.overlays+=new/obj/ssbombpro/s06
			src.overlays+=new/obj/ssbombpro/s07
			src.overlays+=new/obj/ssbombpro/s08

obj
	sbomb
		name="Spirit Bomb"
		density=0
		icon='icons/spiritbomb/sbomb.dmi'
		icon_state=""
		layer=999
		var/power = 500

obj
	sbombprojectile
		name="Spirit Bomb"
		density=0
		icon='icons/spiritbomb/sbomb00.dmi'
		icon_state="big"
		layer=999
		var/power = 500
		New()
			src.overlays+=new/obj/sbombpro/s01
			src.overlays+=new/obj/sbombpro/s02
			src.overlays+=new/obj/sbombpro/s03
			src.overlays+=new/obj/sbombpro/s04
			src.overlays+=new/obj/sbombpro/s05
			src.overlays+=new/obj/sbombpro/s06
			src.overlays+=new/obj/sbombpro/s07
			src.overlays+=new/obj/sbombpro/s08


obj
	smsbombprojectile
		name="Spirit Bomb"
		density=0
		icon='icons/spiritbomb/sbomb00.dmi'
		icon_state="big"
		layer=999
		var/power = 500
		New()
			src.overlays+=new/obj/smsbombpro/s01
			src.overlays+=new/obj/smsbombpro/s02
			src.overlays+=new/obj/smsbombpro/s03
			src.overlays+=new/obj/smsbombpro/s04
			src.overlays+=new/obj/smsbombpro/s05
			src.overlays+=new/obj/smsbombpro/s06
			src.overlays+=new/obj/smsbombpro/s07
			src.overlays+=new/obj/smsbombpro/s08


obj
	msbombprojectile
		name="Spirit Bomb"
		density=0
		icon='icons/spiritbomb/sbomb00.dmi'
		icon_state="big"
		layer=999
		var/power = 500
		New()
			src.overlays+=new/obj/msbombpro/s01
			src.overlays+=new/obj/msbombpro/s02
			src.overlays+=new/obj/msbombpro/s03
			src.overlays+=new/obj/msbombpro/s04
			src.overlays+=new/obj/msbombpro/s05
			src.overlays+=new/obj/msbombpro/s06
			src.overlays+=new/obj/msbombpro/s07
			src.overlays+=new/obj/msbombpro/s08

obj
	dballprojectile
		name="Death Ball"
		density=0
		icon='icons/deathball/dball00.dmi'
		icon_state="big"
		layer=9
		New()
			src.overlays+=new/obj/dballpro/d01
			src.overlays+=new/obj/dballpro/d02
			src.overlays+=new/obj/dballpro/d03
			src.overlays+=new/obj/dballpro/d04
			src.overlays+=new/obj/dballpro/d05
			src.overlays+=new/obj/dballpro/d06
			src.overlays+=new/obj/dballpro/d07
			src.overlays+=new/obj/dballpro/d08

obj
	lightpro
		l01
			icon = 'icons/lightning.dmi'
			icon_state = "1"
			layer=99
			pixel_y = 32
		l02
			icon = 'icons/lightning.dmi'
			icon_state = "2"
			layer=99
			pixel_y = 64

		l03
			icon = 'icons/lightning.dmi'
			icon_state = "3"
			layer=99
			pixel_y = 86
		l04
			icon = 'icons/lightning.dmi'
			icon_state = "4"
			layer=99
			pixel_y = 118

obj
	redlightpro
		rl01
			icon = 'icons/red_lightning.dmi'
			icon_state = "1"
			layer=99
			pixel_y = 32
		rl02
			icon = 'icons/red_lightning.dmi'
			icon_state = "2"
			layer=99
			pixel_y = 64

		rl03
			icon = 'icons/red_lightning.dmi'
			icon_state = "3"
			layer=99
			pixel_y = 86
		rl04
			icon = 'icons/red_lightning.dmi'
			icon_state = "4"
			layer=99
			pixel_y = 118

obj
	purplightpro
		pl01
			icon = 'icons/purp_lightning.dmi'
			icon_state = "1"
			layer=99
			pixel_y = 32
		pl02
			icon = 'icons/purp_lightning.dmi'
			icon_state = "2"
			layer=99
			pixel_y = 64
		pl03
			icon = 'icons/purp_lightning.dmi'
			icon_state = "3"
			layer=99
			pixel_y = 86
		pl04
			icon = 'icons/purp_lightning.dmi'
			icon_state = "4"
			layer=99
			pixel_y = 118

obj
	ssbombpro
		s01
			icon='icons/ssjspiritbomb/ssbomb01.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=32
			layer=9
		s02
			icon='icons/ssjspiritbomb/ssbomb02.dmi'
			icon_state="big"
			pixel_y=32
			layer=9
		s03
			icon='icons/ssjspiritbomb/ssbomb03.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=32
			layer=9
		s04
			icon='icons/ssjspiritbomb/ssbomb04.dmi'
			icon_state="big"
			pixel_x=-32
			layer=9
		s05
			icon='icons/ssjspiritbomb/ssbomb05.dmi'
			icon_state="big"
			pixel_x=32
			layer=9
		s06
			icon='icons/ssjspiritbomb/ssbomb06.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=-32
			layer=9
		s07
			icon='icons/ssjspiritbomb/ssbomb07.dmi'
			icon_state="big"
			pixel_y=-32
			layer=9
		s08
			icon='icons/ssjspiritbomb/ssbomb08.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=-32
			layer=9

obj
	sbombpro
		s01
			icon='icons/spiritbomb/sbomb01.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=32
			layer=9
		s02
			icon='icons/spiritbomb/sbomb02.dmi'
			icon_state="big"
			pixel_y=32
			layer=9
		s03
			icon='icons/spiritbomb/sbomb03.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=32
			layer=9
		s04
			icon='icons/spiritbomb/sbomb04.dmi'
			icon_state="big"
			pixel_x=-32
			layer=9
		s05
			icon='icons/spiritbomb/sbomb05.dmi'
			icon_state="big"
			pixel_x=32
			layer=9
		s06
			icon='icons/spiritbomb/sbomb06.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=-32
			layer=9
		s07
			icon='icons/spiritbomb/sbomb07.dmi'
			icon_state="big"
			pixel_y=-32
			layer=9
		s08
			icon='icons/spiritbomb/sbomb08.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=-32
			layer=9

obj
	msbombpro
		s01
			icon='icons/spiritbomb/sbomb01.dmi'
			icon_state="medium"
			pixel_x=-32
			pixel_y=32
			layer=9
		s02
			icon='icons/spiritbomb/sbomb02.dmi'
			icon_state="medium"
			pixel_y=32
			layer=9
		s03
			icon='icons/spiritbomb/sbomb03.dmi'
			icon_state="medium"
			pixel_x=32
			pixel_y=32
			layer=9
		s04
			icon='icons/spiritbomb/sbomb04.dmi'
			icon_state="medium"
			pixel_x=-32
			layer=9
		s05
			icon='icons/spiritbomb/sbomb05.dmi'
			icon_state="medium"
			pixel_x=32
			layer=9
		s06
			icon='icons/spiritbomb/sbomb06.dmi'
			icon_state="medium"
			pixel_x=-32
			pixel_y=-32
			layer=9
		s07
			icon='icons/spiritbomb/sbomb07.dmi'
			icon_state="medium"
			pixel_y=-32
			layer=9
		s08
			icon='icons/spiritbomb/sbomb08.dmi'
			icon_state="medium"
			pixel_x=32
			pixel_y=-32
			layer=9
obj
	smsbombpro
		s01
			icon='icons/spiritbomb/sbomb01.dmi'
			icon_state="small"
			pixel_x=-32
			pixel_y=32
			layer=9
		s02
			icon='icons/spiritbomb/sbomb02.dmi'
			icon_state="small"
			pixel_y=32
			layer=9
		s03
			icon='icons/spiritbomb/sbomb03.dmi'
			icon_state="small"
			pixel_x=32
			pixel_y=32
			layer=9
		s04
			icon='icons/spiritbomb/sbomb04.dmi'
			icon_state="small"
			pixel_x=-32
			layer=9
		s05
			icon='icons/spiritbomb/sbomb05.dmi'
			icon_state="small"
			pixel_x=32
			layer=9
		s06
			icon='icons/spiritbomb/sbomb06.dmi'
			icon_state="small"
			pixel_x=-32
			pixel_y=-32
			layer=9
		s07
			icon='icons/spiritbomb/sbomb07.dmi'
			icon_state="small"
			pixel_y=-32
			layer=9
		s08
			icon='icons/spiritbomb/sbomb08.dmi'
			icon_state="small"
			pixel_x=32
			pixel_y=-32
			layer=9
obj
	dballpro
		d01
			icon='icons/deathball/dball01.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=32
			layer=9
		d02
			icon='icons/deathball/dball02.dmi'
			icon_state="big"
			pixel_y=32
			layer=9
		d03
			icon='icons/deathball/dball03.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=32
			layer=9
		d04
			icon='icons/deathball/dball04.dmi'
			icon_state="big"
			pixel_x=-32
			layer=9
		d05
			icon='icons/deathball/dball05.dmi'
			icon_state="big"
			pixel_x=32
			layer=9
		d06
			icon='icons/deathball/dball06.dmi'
			icon_state="big"
			pixel_x=-32
			pixel_y=-32
			layer=9
		d07
			icon='icons/deathball/dball07.dmi'
			icon_state="big"
			pixel_y=-32
			layer=9
		d08
			icon='icons/deathball/dball08.dmi'
			icon_state="big"
			pixel_x=32
			pixel_y=-32
			layer=9

obj/atm
	name = "ATM"
	icon = 'icons/atm.dmi'
	icon_state= ""
	density=1
	verb
		Use()
			set src in oview(1)
			set name = "Use"
			set category = "Other"
			if(usr.account)
				var/A=input("Hello, [usr.name]! What do you wish to do?","Bank")in list("Deposit Zenni","Withdraw Zenni","Cancel")//choose to Deposit or Withdraw
				if(A=="Deposit Zenni")
					var/D=input("How much Zenni you want to deposit?","Deposit Zenni") as num
					D=round(D)
					if(D>usr.zenni||isnull(D))
						alert("You do not have that much Zenni to deposit.")
					else if(D<=0)
						alert("You can't deposit less than 1 Zenni.")
						return
					else
						usr.bzenni+=D
						usr.zenni-=D
				if(A=="Withdraw Zenni")
					alert("You currently have [num2text(usr.bzenni,100)] Zenni in your bank account.")//Tells you how much gold you have in the bank.
					var/W=input("Input a amount of Zenni you wish to withdraw.","Withdraw Zenni") as num//type in the amount as a number.
					W=round(W)
					if(W>usr.bzenni||isnull(W))
						alert("You do not have that much Zenni to withdraw.")
					else if(W<=0)
						alert("You can't withdraw less than 1 Zenni.")
						return
					else
						usr.bzenni-=W
						usr.zenni+=W
				if(A=="Cancel")
					alert("Thank you, please come again.")
					return
			else
				var/choice=alert("Greetings, [usr]! Would you like to open a account?","ATM","Yes","No")
				if(choice=="Yes")
					choice=alert("You must have 5,000 Zenni at hand, to open a account. Open a new account?","Proceed","Open a new account","Never mind")
					if(choice=="Open a new account")
						if(usr.zenni>=5000)
							usr.account=1
							alert("Your account has been opened, thank you for using the ATM.")
						else
							alert("You do not have 5,000 Zenni at hand, come back later when you have the money.")
				else
					return


obj
	spells
		immo
			name = "Immolation"
			icon = 'icons/immo.dmi'
			icon_state = ""
			Click()
				if(usr.dead )
					alert("You can't use this while dead!")
				else
					if(usr.wizspell)
						alert("You can't use this yet!")
						return
					var/mob/Target=input("Select a target.","Immolation","") as mob in players
					if(Target in world && ismob(Target))
						var/mob/M = Target
						if(usr.kame )
							alert("You can't use 'Immolation' while using another technique.")
						else
							if(usr.zanzoken )
								alert("You can't use 'Immolation' while using Zanzoken.")
							else
								if(usr.stamina.value < usr.stamina.max_value)
									alert("You are not at full stamina to cast a spell")
								else
									if(usr.move == 0)
										alert("You can't use this spell now!")
									if(usr.move )
										var/amount = input("How much energy do you wish to put into this spell? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
										amount = round(amount)
										if(amount <= 0)
											alert("You can't put this amount of energy into this spell!")
										if(amount >= 1)
											if(amount > usr.ki.value)
												alert("You can't put that amount of Ki into this spell!")
											if(amount <= usr.ki.value)
												usr.ki.value -= amount
												usr.kame = 1
												usr.move = 0
												usr << "<B>You begin to cast the spell!"
												usr.overlays += 'icons/heal.dmi'
												M << "<B>[usr] has targted you for the 'Immolation' spell!"
												sleep(rand(100,200))
												usr.overlays -= 'icons/heal.dmi'
												M.overlays += 'icons/immo.dmi'
												view(6) << 'sounds/flame.wav'
												M.powerlevel.value -= (amount * 2.5)
												if(M.mon )
													if(M.powerlevel.value <=0)
														if(M.expkn == null && M.expkk == null)
															M.expkn = "[usr.name]"
															M.expkk = "[usr.key]"
												M.Die(usr)
												usr.wizspell += rand(5,30)
												usr.wizcount()
												if(M)
													spawn(12)
														M.overlays -= 'icons/immo.dmi'
												usr << "<B>You have successfully casted the spell!"
												usr.kame = 0
												usr.stamina.value = 0
												usr.move = 1

			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					if(usr.wizspell == null)
						usr.wizspell = 0
					usr << "You have [usr.wizspell] minutes left before casting a spell again"
obj
	spells
		fshield
			name = "Flame Shield"
			icon = 'icons/wizard.dmi'
			icon_state = "sparblock"
			Click()


				if(usr.kame )
					alert("You can't use 'Flame Shield' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Flame Shield' while using Zanzoken.")
					else
						if(usr.stamina.value < usr.stamina.max_value)
							alert("You are not at full stamina to cast a spell")
						else
							if(usr.shield )
								switch(alert("Do you want to off your shield?",null,"Yes","No"))
									if("Yes")
										usr.shield = 0
										usr.overlays -= 'icons/flameshield.dmi'
										usr << "<B>Your Flame Shield dies down because lack of Ki!"

							else
								if(usr.move == 0)
									alert("You can't use this spell now!")
								if(usr.move )
									var/amount = (usr.ki.max_value * 0.25)
									if(amount > usr.ki.value)
										alert("You do not have enough Ki to use this spell!")
									if(amount <= usr.ki.value)
										usr.ki.value -= amount
										usr.overlays += 'icons/heal.dmi'
										usr << "<B>You begin to cast the spell!"
										usr.kame = 1
										usr.move = 0
										sleep(rand(100,250))
										usr.move = 1
										usr.kame = 0
										usr.shield = 1
										usr.overlays -= 'icons/heal.dmi'
										usr.overlays += 'icons/flameshield.dmi'
										usr << "<B>You have successfully casted the spell!"
										var/dmg = (amount * 0.1)
										var/kidrain = (amount * 0.5)
										usr.wizspell += rand(3,5)
										usr.wizcount()
										dmg = round(dmg)
										usr.stamina.value = 0
										usr.flamet += 2
										kidrain = round(kidrain)
										usr.fshield(dmg, kidrain)
										usr.flamet += 2
										usr.flametc()

mob
	proc
		fshield(var/dmg=0, var/kidrain=0)
			spawn()
				set background = 1
				while(src.shield )
					if(src.ki.value >= kidrain)
						src.ki.value -= kidrain
						view(6) << 'sounds/flame.wav'
						for(var/mob/characters/M in orange(6))
							M.overlays += 'icons/immo.dmi'
							M.powerlevel.value -= dmg
							if(M.mon )
								if(M.powerlevel.value <=0)
									if(M.expkn == null && M.expkk == null)
										M.expkn = "[usr.name]"
										M.expkk = "[usr.key]"
							M.Die(src)
							src << "<B>You have torched [M] with your Flame Shield!"
							M << "<B>You have been torched by [usr] with the Flame Shield!"
							spawn(12)
								if(M)
									M.overlays -= 'icons/immo.dmi'
								else
									..()
						sleep(75)
						src.fshield(dmg, kidrain)
					else
						src.shield = 0
						src.overlays -= 'icons/flameshield.dmi'
						src << "<B>Your Flame Shield dies down because lack of Ki!"

obj
	spells
		para
			name = "Paralyze"
			icon = 'icons/techhands.dmi'
			icon_state = "enr"
			Click()
				if(usr.wizspell)
					alert("You can't use this yet!")
					return
				if(usr.dead )
					alert("You can't use this while dead!")
				else
					var/mob/Target=input("Select a target.","Paralyze","") as mob in players
					if(Target in world && ismob(Target))
						var/mob/M = Target
						if(usr.kame )
							alert("You can't use 'Paralyze' while using another technique.")
						else
							if(usr.zanzoken )
								alert("You can't use 'Paralyze' while using Zanzoken.")
							else
								if(usr.stamina.value < usr.stamina.max_value)
									alert("You are not at full stamina to cast a spell")
								else
									if(usr.move == 0)
										alert("You can't use this spell now!")
									if(usr.move )
										var/amount = (usr.ki.max_value * 0.025)
										if(amount > usr.ki.value)
											alert("You do not have enough Ki to use this spell!")
										if(amount <= usr.ki.value)
											var/parachance = rand(1,5)
											if(parachance)
												usr.ki.value -= amount
												usr.kame = 1
												usr.move = 0
												usr << "<B>You begin to cast the spell!"
												usr.overlays += 'icons/heal.dmi'
												M << "<B>[usr] has targeted you for the 'Paralyze' spell!"
												sleep(rand(100,200))
												M.move = 0
												if(M.client)
													M.client.show_verb_panel = 0
													usr.hideipan = 1
													M.attacking = 1
													M.move = 0
													M.kame = 1
													M.frozen = 1
												usr.overlays -= 'icons/heal.dmi'
												usr.wizspell += rand(7,12)
												usr.wizcount()
												usr.kame = 0
												usr.move = 1
												usr.stamina.value = 0
												M << "<B>You have been paralyzed by [usr]!"
												spawn(150)
													if(M)
														M.move = 1
														if(M.client)
															M.attacking = 0
															M.move = 0
															M.kame = 0
															M.frozen = 0
											else
												usr.ki.value -= amount
												usr.kame = 1
												usr.move = 0
												usr << "<B>You begin to cast the spell!"
												usr.overlays += 'icons/heal.dmi'
												M << "<B>[usr] has targeted you for the 'Paralyze' spell!"
												sleep(rand(100,200))
												usr.wizspell += rand(7,12)
												usr.wizcount()
												usr << "<B>You have failed to cast the spell!"
												M << "<B>[usr] has failed to cast the spell on you!"
												usr.move = 1
												usr.kame = 0
												usr.stamina.value = 0

			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					if(usr.wizspell == null)
						usr.wizspell = 0
					usr << "You have [usr.wizspell] minutes left before casting a spell again"
obj
	spells
		blind
			name = "Blind"
			icon = 'icons/techhands.dmi'
			icon_state = "foc"
			Click()
				if(usr.wizspell)
					alert("You can't use this yet!")
					return
				if(usr.dead )
					alert("You can't use this while dead!")
				else
					var/mob/Target=input("Select a target.","Blind","") as mob in players
					if(Target in world && ismob(Target))
						var/mob/M = Target
						if(usr.kame )
							alert("You can't use 'Blind' while using another technique.")
						else
							if(usr.zanzoken )
								alert("You can't use 'Blind' while using Zanzoken.")
							else
								if(usr.stamina.value < usr.stamina.max_value)
									alert("You are not at full stamina to cast a spell")
								else
									if(usr.move == 0)
										alert("You can't use this spell now!")
									if(usr.move )
										var/amount = (usr.ki.value * 0.025)
										if(amount > usr.ki.value)
											alert("You can't put that amount of Ki into this spell!")
										if(amount <= usr.ki.value)
											usr.ki.value -= amount
											usr.kame = 1
											usr.move = 0
											usr << "<B>You begin to cast the spell!"
											usr.overlays += 'icons/heal.dmi'
											sleep(rand(50,100))
											M << "<B>[usr] has targeted you for the 'Blind' spell!"
											M.sight = 1
											usr.overlays -= 'icons/heal.dmi'
											usr.kame = 0
											usr.wizspell += rand(1,3)
											usr.wizcount()
											usr.stamina.value = 0
											usr.move = 1
											M << "<B>You have been blinded by [usr]!"
											usr << "<B>You have successfully casted the spell!"
											spawn(100)
												if(M)
													M.sight = 0
obj
	transes
		ssj
			name = "Super Saiyan"
			icon = 'icons/techhands.dmi'
			icon_state = "ssj"
			Click()


				if(usr.babylearn || usr.mystlearn)
					usr << "You are not suppose to have this!"
					del(src)
				if(usr.transforming)
					alert("You can not transform/revert right now")
				else if(usr.ssjfp  && usr.state != "Normal" && usr.state != "Super Saiyan"&&usr.grav > 0)
					alert("You can't transform/revert right now")
				else
					usr.transforming = 1
					if(usr.state == "Normal"||usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2"||usr.state == "Super Saiyan 3"||usr.state == "Super Saiyan 4")
						if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
							if(usr.meditate || usr.rest)
								alert("You can not transform while meditating or resting")
								usr.transforming = 0
							else
								if(usr.state == "Normal")
									switch(alert("What do you wish to do?","Super Saiyan","Transform", "Cancel"))
										if("Cancel")
											usr.transforming = 0
											..()
										if("Transform")
											if(usr.state == "Normal")
												if(usr.powerlevel.max_value >= 900000)
													if(usr.ki.max_value >= 400000)
														if(usr.ssjfp == 0)
															if(usr.stamina.value >= 0.5*(usr.stamina.max_value))
																if(usr.meditate || usr.rest)
																	alert("You can not transform while meditating or resting")
																	usr.transforming = 0
																else
																	view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into a Super Saiyan!</FONT><font color = green> *</FONT>"
																	view(25) << 'sounds/ssj_transform.wav'
																	usr.overlays += 'icons/ssjpowerup.dmi'
																	usr.icon_state = "ssj"
																	usr.dspecial = 1
																	usr.flyingrocks()
																	usr.dseffect()
																	usr.move = 0
																	sleep(35)
																	usr.move = 1
																	usr.icon_state = ""
																	view(25) << 'sounds/ssj_trans2.wav'
																	usr.overlays -= 'icons/ssjpowerup.dmi'
																	usr.hairremoval()
																	usr.ssjhairrestore()
																	usr.underlays += /obj/SSAuraBottom
																	usr.overlays += /obj/SSAuraTop
																	usr.ssjaura = 1
																	usr.state = "Super Saiyan"
																	usr.powerlevel.value = usr.powerlevel.max_value * 2
																	usr.ki.value = usr.ki.max_value * 1.5
																	usr.tiredssj()
																	if(usr.ssjfpt == null)
																		usr.ssjfpt = 24000
																	usr.ssjfullpower()
																	usr.transforming = 0
															else
																usr << "<B>You are too tired to transform!"
																usr.transforming = 0
														else
															view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into a Super Saiyan (Full Power)!</FONT><font color = green> *</FONT>"
															view(25) << 'sounds/ssj_transform.wav'
															usr.overlays += 'icons/ssjpowerup.dmi'
															usr.icon_state = "ssj"
															usr.dspecial = 1
															usr.flyingrocks()
															usr.dseffect()
															usr.move = 0
															sleep(35)
															usr.move = 1
															usr.icon_state = ""
															view(25) << 'sounds/ssj_trans2.wav'
															usr.overlays -= 'icons/ssjpowerup.dmi'
															usr.hairremoval()
															usr.ssjhairrestore()
															usr.underlays += /obj/SSAuraBottom
															usr.overlays += /obj/SSAuraTop
															usr.ssjaura = 1
															usr.state = "Super Saiyan"
															usr.powerlevel.value = usr.powerlevel.max_value * 2.5
															usr.ki.value = usr.ki.max_value * 2
															usr.transforming = 0
													else
														usr << "<B>You do not have enough Ki to transform!"
														usr.transforming = 0
												else
													usr << "<B>You are too weak to transform!"
													usr.transforming = 0
											else
												usr.transforming = 0
												..()

										if("Cancel")
											usr.transforming = 0
											..()
								if(usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2")
									switch(alert("What do you wish to do?","Super Saiyan","Ascend", "Revert", "Cancel"))
										if("Cancel")
											usr.transforming = 0
											..()
										if("Ascend")
											if(usr.state == "Super Saiyan")
												if(usr.powerlevel.max_value >= 2500000)
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] ascends to Ultra Super Saiyan!</FONT><font color = green> *</FONT>"
													view(25) << 'sounds/ssj_trans2.wav'
													usr.ussjlightning()
													usr.powerlevel.value = usr.powerlevel.max_value * 3.75
													usr.ki.value = usr.ki.max_value * 2.5
													usr << "<B><FONT COLOR = RED>You suddenly become slower, by the increase in power. (This only lasts during the Ultra Super Saiyan transformation.)"
													usr.state = "Ultra Super Saiyan"
													if(frssju == null)
														if(!usr.fused)
															frssju = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
															world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Ultra Super Saiyan</font></b>"
													usr.transforming = 0
												else
													usr << "<B>You are too weak to ascend to this new level!"
													usr.transforming = 0
											else
												if(usr.state == "Ultra Super Saiyan")
													if(usr.powerlevel.max_value >= 4200000)
														view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] ascends to Super Saiyan 2!</FONT><font color = green> *</FONT>"
														view(25) << 'sounds/ssj_trans2.wav'
														call(/RoundExplosion/proc/NDBlast)(usr.loc,1,2)
														usr.powerlevel.value = usr.powerlevel.max_value * 5.25
														usr.ki.value = usr.ki.max_value * 3.5
														usr.state = "Super Saiyan 2"
														usr.lightning = 0
														spawn(25)
															usr.ssj2lightning()
														if(!frssj2)
															if(!usr.fused)
																frssj2 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Saiyan 2</font></b>"
														usr.transforming = 0
													else
														usr << "<B>You are too weak to ascend to this new level!"
														usr.transforming = 0
												else
													if(usr.state == "Super Saiyan 2")
														if(usr.powerlevel.max_value >= 15000000)
															view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] ascends to Super Saiyan 3!</FONT><font color = green> *</FONT>"
															view(10) << 'sounds/ssj_firsttrans(Old).wav'
															usr.icon_state = "ssj"
															usr.lspecial = 1
															usr.lightningrand2()
															usr.lightning = 0
															spawn(25)
																usr.ssj3lightning()
															sleep(22)
															Quake_Effect_View(usr, 100, 2)
															call(/RoundExplosion/proc/NDBlast)(usr.loc,1,2)
															sleep(4)
															call(/RoundExplosion/proc/NDBlast)(usr.loc,1,3)
															sleep(4)
															call(/RoundExplosion/proc/NDBlast)(usr.loc,1,4)
															sleep(52)
															view(10) << 'sounds/ssj_firsttrans2(Old).wav'
															sleep(16)
															bwipeeffect(usr.z)
															flick("gonessj",usr)
															usr.icon_state = ""
															usr.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan_long.dmi'
															usr.overlays -= 'icons/hair_super_Saiyan.dmi'
															usr.overlays += 'icons/ssj3.dmi'
															if(usr.tail )
																var/obj/tail/A = new(null)
																usr.overlays -= A
																var/obj/ssjtail/B = new(null)
																usr.overlays += B
															if(usr.dead )
																usr.overlays += /obj/halo
															usr.powerlevel.value = usr.powerlevel.max_value * 7.00
															usr.ki.value = usr.ki.max_value * 5.0
															usr.state = "Super Saiyan 3"
															if(!frssj3)
																if(!usr.fused)
																	frssj3 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																	world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Saiyan 3</font></b>"
															usr.transforming = 0
														else
															usr << "<B>You are too weak to ascend to this new level!"
															usr.transforming = 0
										if("Revert")
											if(usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2"||usr.state == "Super Saiyan 3")
												view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] reverts from [usr.state]!</FONT><font color = green> *</FONT>"
												view(10) << 'sounds/revert.wav'
												usr.lspecial = 0
												usr.dspecial = 0
												usr.ssjaura = 0
												usr.lightning = 0
												usr.overlays -= 'icons/hair_super_Saiyan.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
												usr.overlays -= 'icons/hair_super_Saiyan_long.dmi'
												usr.underlays -= /obj/SSAuraBottom
												usr.overlays -= /obj/SSAuraTop
												usr.hairrestore()
												if(usr.tail)
													var/obj/tail/A = new(null)
													usr.overlays += A
													var/obj/ssjtail/B = new(null)
													usr.overlays -= B
												usr.state = "Normal"
												if(usr.powerlevel.value >= usr.powerlevel.max_value)
													usr.powerlevel.value = usr.powerlevel.max_value
												if(usr.powerlevel.value >= usr.ki.max_value)
													usr.ki.value = usr.ki.max_value
												usr.transforming = 0
								if(usr.state == "Super Saiyan 3")
									switch(alert("What do you wish to do?","Super Saiyan", "Revert", "Cancel"))
										if("Cancel")
											usr.transforming = 0
										if("Revert")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] reverts from [usr.state]!</FONT><font color = green> *</FONT>"
											view(10) << 'sounds/revert.wav'
											usr.lspecial = 0
											usr.dspecial = 0
											usr.ssjaura = 0
											usr.lightning = 0
											usr.overlays -= 'icons/ssj3.dmi'
											usr.underlays -= /obj/SSAuraBottom
											usr.overlays -= /obj/SSAuraTop
											usr.hairrestore()
											if(usr.tail )
												var/obj/tail/A = new(null)
												usr.overlays += A
												var/obj/ssjtail/B = new(null)
												usr.overlays -= B
											usr.state = "Normal"
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.powerlevel.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
											usr.transforming = 0
						else
							usr << "<B>Only Saiyans and Half-Saiyans can use this!"
							usr.transforming = 0
							del(src)
					else
						usr.transforming = 0
						alert("You can only use this transformation when your in your normal state.")
/*			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					var/ssjfptt2 = round(usr.ssjfpt/600/20)
					var/ssjfptt3 = round(usr.ssjfpt/200-(usr.ssjfpt/60))
					if(ssjfptt2 == null)
						ssjfptt2 = "?"
					if(ssjfptt3 == null)
						ssjfptt3 = "?"
					usr << "You have about [ssjfptt2] hours and [ssjfptt3] minutes left"*/
mob
	proc
		kiregen()
			spawn()
				set background = 1
				while(src.race == "Android (Mechanical)")
				{
					sleep(rand(150,300))
					if(src.ki.value < src.ki.max_value)
						usr << "<B>Your Ki has been restored back to normal!"
						src.ki.value = src.ki.max_value
				}

mob
	proc
		tiredssj()
			spawn()
				set background = 1
				while((src.state == "Super Saiyan" && src.ssjfp != 1)||src.state == "Ultra Super Saiyan"||src.state == "Super Saiyan 2"||src.state == "Super Saiyan 3"||src.state == "Super Saiyan 4")
				{
					sleep(rand(50,300))
					src.stamina.value -= (rand(1,6))
					if(src.stamina.value <= 0)
						oview(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src.name] reverts from [src.state]!</FONT><font color = green> *</FONT>"
						view(10) << 'sounds/revert.wav'
						usr << "<B><FONT COLOR = GREEN>You revert from '[src.state]' because of the strain on your body."
						src.lspecial = 0
						src.dspecial = 0
						src.lightning = 0
						src.overlays -= 'icons/hair_super_Saiyan.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_vegeta.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_goten.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_goku.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_trunks.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_gohan.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_reccoom.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_mohawk.dmi'
						src.overlays -= 'icons/hair_super_Saiyan_long.dmi'
						src.overlays -= 'icons/ssj3.dmi'
						src.underlays -= /obj/SSAuraBottom
						src.overlays -= /obj/SSAuraTop
						src.hairrestore()
						if(src.tail )
							var/obj/tail/A = new(null)
							src.overlays += A
							var/obj/ssjtail/B = new(null)
							src.overlays -= B
						src.underlays -= /obj/SSAuraBottom
						src.overlays -= /obj/SSAuraTop
						src.state = "Normal"
						if(src.powerlevel.value >= src.powerlevel.max_value)
							src.powerlevel.value = src.powerlevel.max_value
						if(src.powerlevel.value >= src.ki.max_value)
							src.ki.value = src.ki.max_value
						src.transforming = 0
						break
				}

obj
	spells
		mindcontrol
			name = "Mind Control"
			icon = 'icons/techhands.dmi'
			icon_state = "foc"
			Click()
				if((usr.ki.max_value <= 800000)||(usr.powerlevel.max_value <= 800000))
					alert("You are not developed enough to use this!")
					return 0
				if(usr.majining )
					alert("You can't use this yet!")
				else
					usr.majining = 1


					var/mob/M
					for(var/mob/O in get_step(usr,usr.dir))
						M = O
					if(M)
						if(usr.majin )
							usr<<"<FONT COLOR = red><B>You already have someone under your control."
							usr.majining = 0
						else
							if(M.bmajined )
								alert("That person can't be Mind Controlled again.")
								usr.majining = 0
							else
								if(M.majined )
									usr<<"<FONT COLOR = red><B>That person has already been placed under control or is under control by someone else."
									usr.majining = 0
								else
									if(!M.client)
										alert("You can't majin them!")
										usr.majining = 0
									else
										if(M.powerlevel.value < usr.powerlevel.value)
											if(usr.majin == 0 && usr.move )
												if(M.majined == 0)
													usr << "<B><FONT COLOR = RED>Attemping to Mind Control, [M] .."
													var/choice = alert(M,"Do you wish to be Mind Controlled by [usr]? (Your powerlevel & ki will increase heavily! Note that when unmajined, you'll loose more powerlevel and ki than given!)","","Yes","No")
													if(choice == "Yes")
														if(usr.majin == 0)
															world << "<B><FONT COLOR = red><FONT SIZE = 2><B>[M] has been Mind Controlled by [usr]!"
															if(usr.majin == 0)
																usr.overlays += 'icons/heal.dmi'
																usr<<"<B><FONT COLOR = red><FONT SIZE = 2><B>You have successfully mind controlled [M.name]!"
																M.oname = M.name
																sleep(1)
																M<<"<B><FONT COLOR = red>You have accepted the Mind Control!"
																M<<"<FONT COLOR = RED>Your power begins to increase!"
																oview(40) << "<B><FONT COLOR = RED>[M] begins to power-up!"
																usr << "<FONT COLOR = RED><B>You begin to power-up!"
																view(20) << 'sounds/buku.wav'
																M.lspecial = 0
																M.majining = 1
																M.lspecial = 1
																M.dspecial = 0
																M.dspecial = 1
																M.flyingrocks()
																M.redlightningrand()
																M.move = 0
																M.client.show_verb_panel = 0
																M.hideipan = 1
																M.kame = 1
																M.attacking = 1
																M.icon_state = "ssj"
																M.loc=locate(M.x,M.y+1,M.z)
																M.loc=locate(M.x,M.y+1,M.z)
																M.loc=locate(M.x,M.y+1,M.z)
																M.overlays += new /obj/bukuspot
																view(40) << 'sounds/ssj_trans4.wav'
																var/icon/aura = new('icons/whiteaura.dmi')
																aura.Blend(M.customauracolor)
																M.underlays += aura
																sleep(98)
																M.icon_state = ""
																M.move = 1
																M.client.show_verb_panel = 1
																M.hideipan = 0
																M.kame = 0
																M.attacking = 0
																M.overlays -= /obj/bukuspot
																M.underlays -= aura
																usr.overlays -= 'icons/heal.dmi'
																M.loc=locate(M.x,M.y-1,M.z)
																M.loc=locate(M.x,M.y-1,M.z)
																M.loc=locate(M.x,M.y-1,M.z)
																M.lspecial = 0
																M.dspecial = 0
																M.name=")V(ajin [M.name]"
																usr.majin=1
																M.bmajined = 1
																M.majined=1
																M.majined2="[usr.key]"
																M.majinc = rand(1.1,1.7)
																M.powerlevel.max_value *= M.majinc
																M.powerlevel.max_value = round(M.powerlevel.max_value)
																M.ki.max_value *= M.majinc
																M.ki.max_value = round(M.ki.max_value)
																M.overlays += 'icons/M.dmi'
																M.majinmaster = "[usr]"
																usr.majining = 0
																M.majining = 0
																M.ap = -150
																usr:verbs += /obj/Majin/verb/North
																usr:verbs += /obj/Majin/verb/South
																usr:verbs += /obj/Majin/verb/East
																usr:verbs += /obj/Majin/verb/West
																usr:verbs += /obj/Majin/verb/Recall
																usr:verbs += /obj/Majin/verb/Force_say
																usr:verbs += /obj/Majin/verb/Force_OOC
																usr:verbs += /obj/Majin/verb/UnMajin
																if(usr.client.address == M.client.address)
																	usr << "\red Please note that when [M] is unmajined, [M] will lose more powerlevel and ki than the boost gave since your IP address is  the same as [M]!"
																	M << "\red Please note that when you are unmajined, you will lose more powerlevel and ki than the boost gave since your IP address is  the same as [usr]!"
																	M.majinc += ((rand(2,9))/10)
																else
																	M.majinc += ((rand(1,3))/10)
														else
															alert("You are already Mind Controlled.")
															usr.majining = 0
													else
														alert(usr, "[M] has refused your try to Mind Control him.")
														usr.majining = 0
												else
													usr<<"<FONT COLOR = red><B>[M] has already been mind controlled by: [M.majined2]!"
													usr.majining = 0
											else
												usr<<"<FONT COLOR = red><B>You have already mind controlled someone."
												usr.majining = 0
										else
											if(M.ki.value < usr.ki.value)
												usr<<"<FONT COLOR = red><B>Your Ki must be stronger than the target."
												usr.majining = 0
											if(M.ki.value >= M.ki.max_value)
												usr<<"<FONT COLOR = red><B>They must be weakened before mind controlling."
												usr.majining = 0
					else
						usr<<"<B>There is no one there!"
						usr.majining = 0
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					if(usr.wizspell == null)
						usr.wizspell = 0
					usr << "You have [usr.wizspell] minutes left before casting a spell again"



obj
	Majin
		verb
			North()
				set category = "Mind Control"
				set name = "Force - North"
				for(var/mob/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")
						M.dir = 1
						M.client.North()
						M<<"<b>A mysterious force leads you north."
			South()
				set category = "Mind Control"
				set name = "Force - South"
				for(var/mob/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")
						M.dir = 2
						M.client.South()
						M<<"<b>A mysterious force leads you south."
			East()
				set category = "Mind Control"
				set name = "Force - East"
				for(var/mob/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")
						M.dir = 4
						M.client.East()
						M<<"<b>A mysterious force leads you east."
			West()
				set category = "Mind Control"
				set name = "Force - West"
				for(var/mob/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")
						M.dir = 8
						M.client.West()
						M<<"<b>A mysterious force leads you west."

			Recall()
				set category = "Mind Control"
				set name = "Summon"
				for(var/mob/characters/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")
						M.loc=locate(usr.x,usr.y-1,usr.z)
						M<<"<b>You have been summoned by your Master, [usr]!"
						usr << "<B>You have summoned, [M]!"
					else
						usr.powerlevel.value += 0


			Force_OOC()
				set category = "Mind Control"
				set name = "Force - World Say"
				for(var/mob/characters/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")



					else
						..()

			Force_say(msg as text)
				set category = "Mind Control"
				set name = "Force - Say"
				for(var/mob/characters/M in world)
					if(M.majined  && M.majined2 == "[usr.key]")



					else
						..()


			UnMajin(mob/characters/M in world)
				set category = "Mind Control"
				set name = "Relieve of Control"
				if(M.majined &&M.majined2 == usr.key)
					usr:verbs -= /obj/Majin/verb/North
					usr:verbs -= /obj/Majin/verb/South
					usr:verbs -= /obj/Majin/verb/East
					usr:verbs -= /obj/Majin/verb/West
					usr:verbs -= /obj/Majin/verb/Recall
					usr:verbs -= /obj/Majin/verb/Force_say
					usr:verbs -= /obj/Majin/verb/Force_OOC
					usr.majin = 0
					M.powerlevel.max_value /= M.majinc
					M.powerlevel.max_value = round(M.powerlevel.max_value)
					M.ki.max_value /= M.majinc
					M.ki.max_value = round(M.ki.max_value)
					M.majinc = 0
					M.majined = 0
					M.majinmaster = null
					M.majined2 = null
					M.bmajined = 0
					M.Die(usr)
					M.client.SaveMob()
					M.name = M.oname
					sleep(1)
					usr.majin = 0
					usr:verbs -= /obj/Majin/verb/UnMajin
					M.client.SaveMob()
					usr.client.SaveMob()
				else
					usr<<"<B><FONT COLOR = red>That person has not been mind controlled by you."

f_color_selector_handler
	proc
		Get_Color()
			//if(!usr.client)
			//	return null
			//var/mob/M = usr
			//var/f_color_selector/F = new()
			//var/color = F.Get_Color_Sliders(M)
			//del F
			var RGet = null
			var GGet = null
			var BGet = null
			while(RGet == null)
				RGet = input("How much red are you looking for? Pick a number between 0 and 255") as num|null
				if(RGet<0 || RGet>255)
					RGet=null
					alert("Put a number between 0 and 255!")
			while(GGet == null)
				GGet = input("How much green are you looking for?") as num|null
				if(GGet<0 || GGet>255)
					GGet=null
					alert("Put a number between 0 and 255!")
			while(BGet == null)
				BGet = input("How much blue are you looking for?") as num|null
				if(BGet<0 || BGet>255)
					BGet=null
					alert("Put a number between 0 and 255!")
			var/color = rgb(RGet, GGet, BGet)
			return color


f_color_selector
	var
		list/sliders[0]
		list/f_background[0]
		obj/f_color_objects/F_button/F_OK
		obj/f_color_objects/current_rgb_text/Current_RGB_Text
		Current_RGB_Numbers
		Current_Colors
		Current_RGB
		Current_R = 0
		Current_B = 0
		Current_G = 0


	New()
		var/k
		var/l
		for(k=1, k<=6, k++)
			for(l = 1, l<= 4, l++)
				f_background["[k], [l]"] = new /obj/f_color_objects/background()
				var/obj/f_color_objects/background/BG = f_background["[k], [l]"]
				BG.icon = new /icon('icons/F_Select_Background.dmi', "[k],[l]")
				BG.screen_loc = "[k+1], [1+l]"
				BG.layer = 15
		var/m
		for(m=0, m<4, m++)
			sliders["RED_[m]"] = new /obj/f_color_objects/color_slider()
			var/obj/f_color_objects/color_slider/CSR = sliders["RED_[m]"]
			CSR.position = m
			CSR.color = "RED"
			sliders["BLUE_[m]"] = new /obj/f_color_objects/color_slider()
			var/obj/f_color_objects/color_slider/CSB = sliders["BLUE_[m]"]
			CSB.position = m
			CSB.color = "BLUE"
			sliders["GREEN_[m]"] = new /obj/f_color_objects/color_slider()
			var/obj/f_color_objects/color_slider/CSG = sliders["GREEN_[m]"]
			CSG.position = m
			CSG.color = "GREEN"
			sliders["BACKGROUND_[m]"] = new /obj()
			var/obj/O = sliders["BACKGROUND_[m]"]
			O.icon = 'icons/sliders_background.dmi'
			O.screen_loc = "[m + 3], 4"
		var/A
		for(A in sliders )
			if(istype(sliders[A], /obj/f_color_objects/color_slider))
				var/obj/f_color_objects/color_slider/CS = sliders[A]
				CS.icon = new /icon('icons/sliders.dmi', "[CS.color]_[CS.position +1]")
				//CS.icon = new /icon('icons/sliders.dmi', "RED_1")
				CS.screen_loc = "[CS.position+3], 4"
				CS.My_Owner = src
		F_OK = new()
		F_OK.screen_loc = "6, 3"
		F_OK.My_Owner = src
		Current_RGB_Text = new()
		Current_RGB_Text.screen_loc = "4, 3"
		return ..()

	proc
		OK(mob/M)
			Hide(M)
			if(M && M.client)
				M.client.F_Color_Showing = FALSE

		Hide(mob/M)
			del Current_Colors
			del F_OK
			del Current_RGB_Text
			for(var/A in f_background)
				del f_background[A]
			for(var/A in sliders)
				del sliders[A]

		Update(color, value, mob/M)
			switch(color)
				if("RED")
					Current_R = value
					Current_RGB_Text.Update("RED", value)
				if("BLUE")
					Current_B = value
					Current_RGB_Text.Update("BLUE", value)
				if("GREEN")
					Current_G = value
					Current_RGB_Text.Update("GREEN", value)
			var/icon/I = new('icons/blank.dmi')
			Current_RGB = rgb(Current_R, Current_G, Current_B)
			I.Blend(Current_RGB)
			var/obj/f_color_objects/current_color/CC = Current_Colors
			CC.icon = I

		Get_Color_Sliders(mob/M)
			set background = 1
			while(M.client.F_Color_Showing)
				sleep(10)
			M.client.F_Color_Showing = TRUE
			Current_Colors = new /obj/f_color_objects/current_color()
			var/obj/f_color_objects/current_color/CC = Current_Colors
			CC.screen_loc = "3, 3"
			Current_RGB = rgb(0,0,0)
			Show_Sliders(M)
			while(M && M.client && M.client.F_Color_Showing)
				sleep(5)
			del Current_Colors
			return Current_RGB

		Show_Sliders(mob/M)
			M.client.screen += Current_Colors
			M.client.screen += F_OK
			M.client.screen += Current_RGB_Text
			for(var/A in f_background)
				M.client.screen += f_background[A]
			for(var/A in sliders)
				M.client.screen += sliders[A]




obj/f_color_objects

	current_rgb_text
		icon = 'icons/numbers_ones.dmi'
		icon_state = "CODES_BACKGROUND"
		layer = 16
		var
			icon/red_overlay
			icon/green_overlay
			icon/blue_overlay

		proc
			num2alpha(var/N as num)
				switch(N)
					if(1)
						return "ONE"
					if(2)
						return "TWO"
					if(3)
						return "THREE"
					if(4)
						return "FOUR"
					if(5)
						return "FIVE"
					if(6)
						return "SIX"
					if(7)
						return "SEVEN"
					if(8)
						return "EIGHT"
					if(9)
						return "NINE"
					if(0)
						return "ZERO"

			Update(color, value)
				switch(color)
					if("RED")
						overlays -= red_overlay
						red_overlay = Get_Number_Overlay(value)
						red_overlay.Shift(NORTH, 20)
						overlays += red_overlay
					if("GREEN")
						overlays -= green_overlay
						green_overlay = Get_Number_Overlay(value)
						green_overlay.Shift(NORTH, 10)
						overlays += green_overlay
					if("BLUE")
						overlays -= blue_overlay
						blue_overlay = Get_Number_Overlay(value)
						overlays += blue_overlay

			Get_Number_Overlay(value)
				var/icon/total_overlay = new /icon('icons/numbers_ones.dmi', "BLANK")
				if(value >= 100)
					var/icon/temp_icon = new('icons/numbers_ones.dmi', num2alpha((value-(value%100))/100))
					temp_icon.Shift(WEST, 12)
					total_overlay.Blend(temp_icon, ICON_OVERLAY)
				if(value >= 10)
					var/icon/temp_icon = new('icons/numbers_ones.dmi', num2alpha((value -(value-value%100) - value%10)/10))
					temp_icon.Shift(WEST, 6)
					total_overlay.Blend(temp_icon, ICON_OVERLAY)
				var/icon/I = new('icons/numbers_ones.dmi', num2alpha((value - (value-value%10))))
				total_overlay.Blend(I, ICON_OVERLAY)
				return total_overlay

	current_color
		icon = 'icons/blank.dmi'
		layer = 15
	color_slider
		layer = 15
		var
			position
			f_color_selector/My_Owner

		MouseUp(location, icon_x, icon_y)
			My_Owner.Update(color, 2*(icon_x+(32 * position))-2, usr)
			switch(color)
				if("RED")
					del usr.client.F_Color_Red_Mark
					var/icon/I = new('icons/selected_slider.dmi')
					I.Shift(4, icon_x)
					I.Shift(1, 20)
					usr.client.F_Color_Red_Mark = image(I, src, layer = 17)
					usr.client << usr.client.F_Color_Red_Mark
				if("GREEN")
					del usr.client.F_Color_Green_Mark
					var/icon/I = new('icons/selected_slider.dmi')
					I.Shift(4, icon_x)
					I.Shift(1, 10)
					usr.client.F_Color_Green_Mark = image(I, src, layer = 17)
					usr.client << usr.client.F_Color_Green_Mark
				if("BLUE")
					del usr.client.F_Color_Blue_Mark
					var/icon/I = new('icons/selected_slider.dmi')
					I.Shift(4, icon_x)
					usr.client.F_Color_Blue_Mark = image(I, src, layer = 17)
					usr.client << usr.client.F_Color_Blue_Mark
			return ..()

	background
		layer = 14

	F_button
		layer = 15
		var
			f_color_selector/My_Owner
		layer = 15
		icon='icons/button.dmi'
		Click()
			flick("CLICKED", src)
			spawn(3)
				My_Owner.OK(usr)
			return ..()
var/f_color_selector_handler/F_Color_Selector
world
	New()
		spawn(1)
			if(!F_Color_Selector)
				F_Color_Selector = new()
		return ..()

client
	var
		F_Color_Showing = FALSE
		F_Color_Red_Mark
		F_Color_Blue_Mark
		F_Color_Green_Mark

obj
	transes
		buutransform
			name = "Buu Forms"
			icon = 'icons/techhands.dmi'
			icon_state = "buutrans"
			Click()


				if(usr.transforming ||usr.grav > 0)
					alert("You can not transform/revert right now")
				else
					usr.transforming = 1
					if(usr.race == "Buu")
						if(usr.meditate  || usr.rest )
							alert("You can not transform while meditating or resting")
							usr.transforming = 0
						else
							if(usr.state == "Normal"||usr.state == "Fat Buu"||usr.state == "Super Buu"||usr.state == "Super Buu (Gotenks)"||usr.state == "Super Buu (Gohan)")
								if(usr.state == "Normal")
									switch(alert("What do you wish to do?","Buu Forms","Transform", "Cancel"))
										if("Transform")
											if(usr.powerlevel.max_value >= 675000)
												if(usr.meditate  || usr.rest )
													alert("You can not transform while meditating or resting")
													usr.transforming = 0
												else
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Fat Buu!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/buu_trans.wav'
													flick("kidtofat",usr)
													usr.powerlevel.value = usr.powerlevel.max_value * 2
													usr.icon = 'icons/Fat Buu.dmi'
													usr.state = "Fat Buu"
													usr.transforming = 0
											else
												usr << "<B>You are too weak to transform!"
												usr.transforming = 0

										if("Cancel")
											usr.transforming = 0
											..()
								if(usr.state == "Fat Buu"||usr.state == "Super Buu"||usr.state == "Super Buu (Gotenks)"||usr.state == "Super Buu (Gohan)")
									switch(alert("What do you wish to do?","Buu Forms","Ascend", "Revert", "Cancel"))
										if("Cancel")
											usr.transforming = 0
											..()
										if("Ascend")
											if(usr.state == "Fat Buu")
												if(usr.powerlevel.max_value >= 1000000)
													view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Buu!</FONT><font color = green> *</FONT>"
													view(10) << 'sounds/buu_trans2.wav'
													flick("fattosuper",usr)
													usr.powerlevel.value = usr.powerlevel.max_value * 4
													usr.icon = 'icons/Super Buu.dmi'

													if(!frbs)
														if(!usr.fused)
															frbs = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
															world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Buu</font></b>"
													usr.state = "Super Buu"
													usr.transforming = 0
												else
													usr << "<B>You are too weak to ascend to this new level!"
													usr.transforming = 0
											else
												if(usr.state == "Super Buu")
													if(usr.powerlevel.max_value >= 2600000)
														view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Buu (Gotenks)!</FONT><font color = green> *</FONT>"
														view(10) << 'sounds/buu_trans2.wav'
														flick("supertogotenk",usr)
														usr.powerlevel.value = usr.powerlevel.max_value * 5
														usr.icon = 'icons/Gotenk Buu.dmi'
														usr.state = "Super Buu (Gotenks)"
														usr.transforming = 0
														if(!frbsgt)
															if(!usr.fused)
																frbsgt = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Buu (Gotenks)</font></b>"
													else
														usr << "<B>You are too weak to ascend to this new level!"
														usr.transforming = 0
												else
													if(usr.state == "Super Buu (Gotenks)")
														if(usr.powerlevel.max_value >= 12000000)
															view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] transforms into Super Buu (Gohan)!</FONT><font color = green> *</FONT>"
															view(10) << 'sounds/buu_trans2.wav'
															flick("gotenkstogohan",usr)
															usr.lspecial = 1
															usr.purplightningrand()
															usr.powerlevel.value = usr.powerlevel.max_value * 6
															usr.icon = 'icons/Gohan Buu.dmi'
															usr.transforming = 0
															usr.state = "Super Buu (Gohan)"
															if(!frbsgh)
																if(!usr.fused)
																	frbsgh = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																	world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Buu (Gohan)</font></b>"
														else
															usr << "<B>You are too weak to ascend to this new level!"
															usr.transforming = 0
										if("Revert")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
											view(10) << 'sounds/revert.wav'
											usr.lspecial = 0
											usr.icon = 'icons/buu.dmi'
											usr.state = "Normal"
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.ki.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
											usr.transforming = 0

										if("Cancel")
											usr.transforming = 0
											..()

								if(usr.state == "Super Buu (Gohan)")
									switch(alert("What do you wish to do?","Buu Forms","Revert", "Cancel"))
										if("Revert")
											view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to revert from [usr.state]!</FONT><font color = green> *</FONT>"
											view(10) << 'sounds/revert.wav'
											usr.lspecial = 0
											usr.icon = 'icons/buu.dmi'
											usr.state = "Normal"
											if(usr.powerlevel.value >= usr.powerlevel.max_value)
												usr.powerlevel.value = usr.powerlevel.max_value
											if(usr.ki.value >= usr.ki.max_value)
												usr.ki.value = usr.ki.max_value
											usr.transforming = 0

										if("Cancel")
											usr.transforming = 0
											..()



							else
								usr.transforming = 0
								..()
					else
						usr << "<B>Only Buus can use this!"
						usr.transforming = 0
						del(src)

obj/fighterspawn
	name = "Fighter Training Machine"
	icon = 'icons/turfs.dmi'
	icon_state = "saibameen2"
	density = 1
	DblClick()
		if(src in view(1))
			Use()
		else
			return
	verb
		Use()
			set category = "Other"
			set name = "Use"
			set src in oview(1)
			if(src.inu ||usr.used )
				alert("You canot use this right now!")
			else
				src.inu = 1
				usr.used = 1
				alert("This machine allows you to spawn a fighter similar to your own ablities, allowing you to train with it.")
				switch(alert("Do you wish to spawn a fighter? (The fighter will last for 2 minutes before being deleted!)","Machine","Yes","No","Recall Fighter"))
					if("Yes")
						var/monster/train/split = new()
						split.creator = usr
						split.dead = usr.dead
						split.icon = 'icons/male.dmi'
						split.overlays += 'icons/clothes-blueunder.dmi'
						split.overlays += 'icons/clothes-blackgi.dmi'
						split.overlays += 'icons/hair_black_spikey.dmi'
						split.overlays += 'icons/gloves-boots.dmi'
						split.loc = get_step_rando(usr)
						split.powerlevel.value = (usr.powerlevel.max_value >= usr.powerlevel.value)?(usr.powerlevel.max_value * 1.1):(usr.powerlevel.value * 1.1)
						split.powerlevel.max_value = split.powerlevel.value
						split.ki.max_value = (usr.ki.max_value >= usr.ki.value)?(usr.ki.max_value * 1.1):(usr.ki.value * 1.1)
						split.ki.value = split.ki.max_value
						split.kigivemin = max(1, round(usr.powerlevel.max_value * 0.03))
						split.kigivemax = max(1, round(usr.powerlevel.max_value * 0.09))
						split.plgivemin = max(1, round(usr.powerlevel.max_value * 0.03))
						split.plgivemax = max(1, round(usr.powerlevel.max_value * 0.09))
						split.skexpgivemin = max(1, round(usr.powerlevel.max_value * 0.0001))
						split.skexpgivemax = max(1, round(usr.powerlevel.max_value * 0.0001))
						split.name = "Created Fighter"
						viewers() << "The machine animates a fighter for [usr]."
						sleep(rand(200,600))
						usr.used = 0
						src.inu = 0
						if(split) del(split)
						viewers(src) << "[src]: Ready to create another fighter."
					if("No")
						src.inu = 0
						usr.used = 0




obj/Gravitronx
	name = "Gravitron (Model X)"
	icon = 'icons/grav.png'
	density = 1
	highgrav = 300000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
			if(usr.GravID && (src.GravID != usr.GravID))
				usr << "Sorry but you can only use one gravitron at a time!"
				return
			if(!usr) return
			howmuch = max(0,howmuch)
			if(howmuch || !howmuch)
				usr.grav = 0
				usr.GravID = 0
				usr.move = 1
				usr << "<b>You flick the switch and the gravity begins to shut down."
			if(howmuch > 1 && howmuch <= highgrav)
				if(usr.grav)
					usr << "<b>Please set the gravity to 0."
					return
				if(!usr.grav)
//					if(usr.state != "Normal")
	//					usr.stamina.value = 0
					if(usr.GravID && (src.GravID != usr.GravID))
						usr << "Sorry but you can only use one gravitron at a time!"
						return
					usr << "<b>The gravition computes and suddenly the room begins to get heavy."
					usr.grav = howmuch
					usr.GravID = src.GravID
					usr.move = 0
					sleep(20)
					if(!usr) return
					usr.playergravity()
			if(howmuch > highgrav)
				usr << "<b>This type of gravitron can't go up that amount of gravity."
obj/CCGravitronx
	name = "Gravitron (Model X)"
	icon = 'icons/grav.png'
	highgrav = 300000
	New()
		..()
		src.GravID = rand(1,99999)+rand()
	Click()
		if(src in view(usr,1))
			if(usr.ccuse != 1)
				alert("You can't use this gravitron!")
				return
			else

				if(usr.GravID && (src.GravID != usr.GravID))
					usr << "Sorry but you can only use one gravitron at a time!"
					return
				var/howmuch = input("Input an amount of gravity. (NOTE: It is suggested that you train to atleast 1000 powerlevel.)") as num|null
				if(usr.GravID && (src.GravID != usr.GravID))
					usr << "Sorry but you can only use one gravitron at a time!"
					return
				if(!usr) return
				howmuch = max(0,howmuch)
				if(howmuch || !howmuch)
					usr.grav = 0
					usr.GravID = 0
					usr.move = 1
					usr << "<b>You flick the switch and the gravity begins to shut down."
				if(howmuch > 1 && howmuch <= highgrav)
					if(usr.grav)
						usr << "<b>Please set the gravity to 0."
						return
					if(!usr.grav)
//						if(usr.state != "Normal")
	//						usr.stamina.value = 0
						if(usr.GravID && (src.GravID != usr.GravID))
							usr << "Sorry but you can only use one gravitron at a time!"
							return
						usr << "<b>The gravition computes and suddenly the room begins to get heavy."
						usr.grav = howmuch
						usr.GravID = src.GravID
						usr.move = 0
						sleep(20)
						if(!usr) return
						usr.playergravity()
				if(howmuch > highgrav)
					usr << "<b>This type of gravitron can't go up that amount of gravity."

obj/storage
	name = "Storage Chest"
	icon='icons/chest.dmi'
	icon_state = "Chest"
	density=1
	var/list/chest=new()
	verb
		Deposit()
			set category=null
			set src in oview(1)
			var/list/depo=list()
			for(var/obj/items/O in usr.contents)
				depo+=O
			var/obj/items/C=input("What do you want to put into the chest?","Chest") in depo
			if(C==null)
				usr<<"<B>You don't have any items!"
				return 0
			else
				if(!usr.contents.Find(C))
					usr << "<b>That item was already added!</b>"
					return
				usr.contents.Remove(C)
				if(!chest) chest = new /list()
				chest.Add(C)
				usr<<"<B>You put [C] in your chest."
				var/savefile/F=new("items/[usr.ckey].sav")
				F<<chest
				return
		Withdraw()
			set category=null
			set src in oview(1)
			var/savefile/F=new("items/[usr.ckey].sav")
			F>>chest
			var/obj/C=input("What do you want to withdraw?","Chest") in chest
			if(C==null)
				usr<<"<B>There is nothing for you to take."
			else
				usr.contents.Add(C)
				chest.Remove(C)
				usr<<"<B>You put [C] into your inventory."
				F<<chest

obj/vstorage
	name = "Storage Container"
	icon='icons/turfs2.dmi'
	icon_state = "vstor"
	density=1
	var/list/chest=newlist()
	verb
		Deposit()
			set category=null
			set src in oview(1)
			var/list/depo=list()
			for(var/obj/items/O in usr.contents)
				depo+=O
			var/obj/items/C=input("What do you want to put into the chest?","Chest") in depo
			if(C==null)
				usr<<"<B>You don't have any items!"
				return 0
			else
				if(!usr.contents.Find(C))
					usr << "<b>That item was already added!</b>"
					return
				usr.contents.Remove(C)
				if(!chest) chest = new /list()
				chest.Add(C)
				usr<<"<B>You put [C] in your chest."
				var/savefile/F=new("items/[usr.key].sav")
				F<<chest
				return
		Withdraw()
			set category=null
			set src in oview(1)
			var/savefile/F=new("items/[usr.key].sav")
			F>>chest
			var/obj/C=input("What do you want to withdraw?","Chest") in chest
			if(C==null)
				usr<<"<B>There is nothing for you to take."
			else
				usr.contents.Add(C)
				chest.Remove(C)
				usr<<"<B>You put [C] into your inventory."
				F<<chest

obj
	saibamenspawner
		name = "Saibamen Spawner"
		icon = 'icons/turfs.dmi'
		icon_state = "saibameen"
		density = 1
		verb
			Use()
				set category=null
				set name = "Use"
				set src in oview(1)
				alert("Disabled!")
/*				if(src.used == 0)
					switch(alert("Do you want to spawn a Saibamen?","Saibamen Spaner","Yes","No"))
						if("Yes")
							src.used = 1
							var/saibaspawn = input("How many do you want to spawn? (You can spawn up to 4!)") as num|null
							if(saibaspawn <= 0)
								..()
							else
								if(saibaspawn)
									var/mob/saiba1 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
									view(6) << "<FONT COLOR = YELLOW><B>Created one Saibamen for [usr]!"
									spawn(400)
										del(saiba1)
										src.used = 0
								else
									if(saibaspawn==2)
										var/mob/saiba1 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
										var/mob/saiba2 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
										view(6) << "<FONT COLOR = YELLOW><B>Created two Saibamen for [usr]!"
										spawn(400)
											del(saiba1)
											del(saiba2)
											src.used = 0
									else
										if(saibaspawn==3)
											var/mob/saiba1 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
											var/mob/saiba2 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
											var/mob/saiba3 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
											view(6) << "<FONT COLOR = YELLOW><B>Created three Saibamen for [usr]!"
											spawn(400)
												del(saiba1)
												del(saiba2)
												del(saiba3)
												src.used = 0
										else
											if(saibaspawn==4)
												var/mob/saiba1 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
												var/mob/saiba2 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
												var/mob/saiba3 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
												var/mob/saiba4 = new/mob/monsters/msaibamen(locate(src.x,src.y-1,src.z))
												view(6) << "<FONT COLOR = YELLOW><B>Created four Saibamen for [usr]!"
												spawn(400)
													del(saiba1)
													del(saiba2)
													del(saiba3)
													del(saiba4)
													src.used = 0
											else
												if(saibaspawn>4)
													alert("You can't create that amount of Saibamen!")
													..()
				else
					src.used = 0
					alert("This machine is in use already!")
					..()*/

mob
	proc
		ssjhairrestore()
			set background = 1
			if(hair == "Bald")
				overlays += 'icons/hair_super_Saiyan_bald.dmi'
			else if(hair == "Goten")
				overlays += 'icons/hair_super_Saiyan_goten.dmi'
			else if(hair == "Trunks")
				overlays += 'icons/hair_super_Saiyan_trunks.dmi'
			else if(hair == "Gohan")
				overlays += 'icons/hair_super_Saiyan_gohan.dmi'
			else if(hair == "Long")
				overlays += 'icons/hair_super_Saiyan_long.dmi'
			else if(hair == "Vegeta")
				overlays += 'icons/hair_super_Saiyan_vegeta.dmi'
			else if(hair == "Goku")
				overlays += 'icons/hair_super_Saiyan_goku.dmi'
			else if(hair == "Vegito")
				overlays += 'icons/hair_super_Saiyan_goku.dmi'
			else if(hair == "Recoome")
				overlays += 'icons/hair_super_Saiyan_reccoom.dmi'
			else if(hair == "Mohawk")
				overlays += 'icons/hair_super_Saiyan_mohawk.dmi'
			else if(hair == "Short Spikey")
				overlays += 'icons/ssj_gtvegeta.dmi'
			else
				overlays += 'icons/hair_super_Saiyan.dmi'

mob
	proc
		hairremoval()
			set background = 1
			if(src.hair == "Spikey")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_black_spikey.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_black_spikey.dmi'
			else if(src.hair == "Trunks")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_trunks.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_trunks.dmi'
			else if(src.hair == "Gohan")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_gohan.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_gohan.dmi'
			else if(src.hair == "Long")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_black_long.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_black_long.dmi'
			else if(src.hair == "Short")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_black_short.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays += 'icons/hair_black_short.dmi'
			else if(src.hair == "Goku")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_goku.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_goku.dmi'
			else if(src.hair == "Vegeta")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_vegeta.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_vegeta.dmi'
			else if(src.hair == "Goten")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_goten.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_goten.dmi'
			else if(src.hair == "Vegito")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_vegito.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_vegito.dmi'
			else if(src.hair == "Recoome")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_reccoom.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_reccoom.dmi'
			else if(src.hair == "Mohawk")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/hair_mohawk.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/hair_mohawk.dmi'
			else if(src.hair == "Short Spikey")
				if(src.customhaircolor)
					var/haircolor = src.customhaircolor
					var/icon/hairicon = new('icons/gtvegeta.dmi')
					hairicon.Blend(haircolor)
					src.overlays -= hairicon
				else
					src.overlays -= 'icons/gtvegeta.dmi'
obj
	bigkaioaura
		icon = 'icons/bigkaioaura.dmi'
		left
			pixel_x = -16
			bot
				icon_state = "0,0"
			midbot
				pixel_y = 32
				icon_state = "0,1"
				layer = FLOAT_LAYER + 99999
			midtop
				pixel_y = 64
				icon_state = "0,2"
				layer = FLOAT_LAYER + 99999
			top
				pixel_y = 96
				icon_state = "0,3"
				layer = FLOAT_LAYER + 99999
		right
			pixel_x = 16
			bot
				icon_state = "1,0"
			midbot
				pixel_y = 32
				icon_state = "1,1"
				layer = FLOAT_LAYER + 99999
			midtop
				pixel_y = 64
				icon_state = "1,2"
				layer = FLOAT_LAYER + 99999
			top
				pixel_y = 96
				icon_state = "1,3"
				layer = FLOAT_LAYER + 99999

obj
	techs
		scj
			name = "Spawn Cell Junior"
			icon = 'icons/cell jr..dmi'
			Click()
				if(usr.kame )
					alert("You can't use 'Spawn Cell Junior' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Spawn Cell Junior' while using Zanzoken.")
					else
						if(usr.state != "Perfect Form" && usr.state != "Perfect Form (Weighted)")
							alert("You must be in a Perfect Form!")
							return
						else
							if(usr.move == 0)
								alert("You can't use this attack now!")
							if(usr.move )
								var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
								amount = round(amount)
								if(amount <= 0)
									alert("You can't put this amount of Ki into this attack!")
								if(amount >= 1)
									if(amount > usr.ki.value)
										alert("You can't put that amount of Ki into this technique!")
									if(amount <= usr.ki.value)
										usr.ki.value -= amount
										usr.kame = 1
										usr.move = 0
										view(6) << "<FONT COLOR = RED>[usr]: </FONT>Spawn Cell Junior!"
										view(6) << 'sounds/sgklaugh.wav'
										sleep(72)
										usr.move = 1
										usr.icon_state = ""
										view(6) << 'sounds/sgklaugh.wav'
										var/obj/celljrz/G = new(usr.loc)
										G.loc=locate(usr.x,usr.y+1,usr.z)
										walk_towards(G,usr,2)
										G.name = "[usr]'s Cell Jr"
										G.owner = usr
										G.power = (amount * 2.5)
										usr << "<B>Your Cell Jr begins to follow you!"
										usr << "<B>This Cell Jr will be deleted within 2 minutes!"
										sleep(1)
										usr.kame = 0
										spawn(1200)
											del(G)
obj
	celljrz
		name = "Spawn Cell Junior"
		icon = 'icons/cell jr..dmi'
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
				owner
		Click()
			if(src.owner == usr)
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Spawn Cell Junior","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.kame == 0)
						view(6) << "<B>[src] laughs histerically!"
						view(6) << 'sounds/sgklaugh.wav'
						usr.kame = 1
						sleep(31)
						view(6) << "<B>[src] runs after [M]!"
						missile(/obj/celljrz,src,M)
						call(/RoundExplosion/proc/NDBlast)(M.loc,1,4)
						M.powerlevel.value -= power
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[usr.name]"
									M.expkk = "[usr.key]"
						M.Die(killedBy)
						del(src)
					else
						usr << "<B>This Cell Jr is already attacking!"
				else
					usr << "<B>There is anything to attack near here."
			else
				usr << "<B>This isn't yours!"
obj
	t1
		icon = 'icons/timemachine.dmi'
		icon_state = "1"
		density = 1
		name = "Time Machine"
		var
			owner
	t2
		icon_state = "2"
		icon = 'icons/timemachine.dmi'
		density = 1
		name = "Time Machine"
		var
			owner
	t3
		icon_state = "3"
		icon = 'icons/timemachine.dmi'
		density = 1
		name = "Time Machine"
		var
			owner
	t4
		icon_state = "4"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t5
		icon_state = "5"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t6
		icon_state = "6"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t7
		icon_state = "7"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t8
		icon_state = "8"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t9
		icon_state = "9"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t10
		icon_state = "10"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner
	t11
		icon_state = "11"
		icon = 'icons/timemachine.dmi'
		density = 0
		name = "Time Machine"
		layer = 9
		var
			owner

obj
	timemachine
		name = "Time Machine"
		density = 1
		icon = 'icons/timemachine.dmi'
		icon_state = "1"
		var
			owner
		/*New()
			var/obj/t3/part1 = new /obj/t3(src.loc)
			part1.loc = locate(src.x+2,src.y,src.z)
			var/obj/t2/part2 = new /obj/t2(src.loc)
			part2.loc = locate(src.x+1,src.y,src.z)
			var/obj/t4/part3 = new /obj/t4(src.loc)
			part3.loc = locate(src.x,src.y+1,src.z)
			var/obj/t5/part4 = new /obj/t5(src.loc)
			part4.loc = locate(src.x+1,src.y+1,src.z)
			var/obj/t6/part5 = new /obj/t6(src.loc)
			part5.loc = locate(src.x+2,src.y+1,src.z)
			var/obj/t7/part6 = new /obj/t7(src.loc)
			part6.loc = locate(src.x,src.y+2,src.z)
			var/obj/t8/part7 = new /obj/t8(src.loc)
			part7.loc = locate(src.x+1,src.y+2,src.z)
			var/obj/t9/part8 = new /obj/t9(src.loc)
			part8.loc = locate(src.x+1,src.y+2,src.z)
			var/obj/t10/part9 = new /obj/t10(src.loc)
			part9.loc = locate(src.x,src.y+3,src.z)
			var/obj/t11/part10 = new /obj/t11(src.loc)
			part10.loc = locate(src.x+1,src.y+3,src.z)
			part1.overlays += 'icons/poof.dmi'
			part2.overlays += 'icons/poof.dmi'
			part3.overlays += 'icons/poof.dmi'
			part4.overlays += 'icons/poof.dmi'
			part5.overlays += 'icons/poof.dmi'
			part6.overlays += 'icons/poof.dmi'
			part7.overlays += 'icons/poof.dmi'
			part8.overlays += 'icons/poof.dmi'
			part9.overlays += 'icons/poof.dmi'
			part10.overlays += 'icons/poof.dmi'
			sleep(16)
			part1.overlays -= 'icons/poof.dmi'
			part2.overlays -= 'icons/poof.dmi'
			part3.overlays -= 'icons/poof.dmi'
			part4.overlays -= 'icons/poof.dmi'
			part5.overlays -= 'icons/poof.dmi'
			part6.overlays -= 'icons/poof.dmi'
			part7.overlays -= 'icons/poof.dmi'
			part8.overlays -= 'icons/poof.dmi'
			part9.overlays -= 'icons/poof.dmi'
			part10.overlays -= 'icons/poof.dmi'
			part1.owner = owner
			part2.owner = owner
			part3.owner = owner
			part4.owner = owner
			part5.owner = owner
			part6.owner = owner
			part7.owner = owner
			part8.owner = owner
			part9.owner = owner
			part10.owner = owner
*/

obj
	historymachine
		name = "Dragonball Online History Machine"
		icon = 'icons/history.dmi'
		icon_state = ""
		density = 1
		Click()
			var/html
			html += "<html><head><title>Dragonball Online History</title></head><body bgcolor = #000000>"
			html += "<font color = blue><B>Saiyan/Half-Saiyan:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Oozaru:</B> [frooz] <br>"
			html += "<font color = blue><B>First person to discover Giji Super Saiyan:</B> [frgssj] <br>"
			html += "<font color = blue><B>First person to discover Super Saiyan:</B> [frssj1] <br>"
			html += "<font color = blue><B>First person to discover Super Saiyan (Full Power):</B> [frssjfp] <br>"
			html += "<font color = blue><B>First person to discover Ultra Super Saiyan:</B> [frssju] <br>"
			html += "<font color = blue><B>First person to discover Super Saiyan 2:</B> [frssj2] <br>"
			html += "<font color = blue><B>First person to discover Super Saiyan 3:</B> [frssj3] <br>"
			html += "<P>"
			html += "<font color = blue><B>Changling:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Form 1:</B> [frcf1] <br>"
			html += "<font color = blue><B>First person to discover Form 2:</B> [frcf2] <br>"
			html += "<font color = blue><B>First person to discover Form 3:</B> [frcf3] <br>"
			html += "<font color = blue><B>First person to discover Form 4:</B> [frcf4] <br>"
			html += "<font color = blue><B>First person to discover Form 4 (Full Power):</B> [frcf4fp] <br>"
			html += "<font color = blue><B>First person to discover Form 5:</B> [frcf5] <br>"
			html += "<font color = blue><B>First person to discover Metal Changling:</B> [frcm] <br>"
			html += "<P>"
			html += "<font color = blue><B>Namek:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Super Namek:</B> [frns] <br>"
			html += "<P>"
			html += "<font color = blue><B>Android (Biological):</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Semi-Perfect Form:</B> [frcsp] <br>"
			html += "<font color = blue><B>First person to discover Perfect Form:</B> [frcp] <br>"
			html += "<font color = blue><B>First person to discover Perfect Form (Weighted):</B> [frcpw] <br>"
			html += "<font color = blue><B>First person to discover Super Perfect Form:</B> [frcsup] <br>"
			html += "<P>"
			html += "<font color = blue><B>Earthling:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Super Human:</B> [frhs] <br>"
			html += "<P>"
			html += "<font color = blue><B>Buu:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Fat Buu:</B> [frbf] <br>"
			html += "<font color = blue><B>First person to discover Super Buu:</B> [frbs] <br>"
			html += "<font color = blue><B>First person to discover Super Buu (Gotenks):</B> [frbsgt] <br>"
			html += "<font color = blue><B>First person to discover Super Buu (Gohan):</B> [frbsgh] <br>"
			html += "<P>"
			html += "<font color = blue><B>Earthling/Buu:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Reincarnation:</B> [frreincarnation] <br>"
			html += "<P>"
			html += "<font color = blue><B>All:</B>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover Mystic:</B> [frmyst] <br>"
			html += "<P>"
			html += "<font color = blue><B>Special:</B></font>"
			html += "<br>"
			html += "<font color = blue><B>First person to discover LSSJ:</B> [frelssj] <br>"
			html += "<P>"
			html += "<P>"
			html += "<font color = red><B>Please note that blank spots mean it is currently unknown!</B>"
			usr << browse(html,"window=history;display=1;clear=0;size=500x300;border=1;can_close=1;can_resize=1;can_minimize=1;titlebar=1")

obj/items/PMA
	name = "PMA"
	icon = 'icons/PMA.dmi'
	Click()
		usr.Mail()