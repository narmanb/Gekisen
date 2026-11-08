mob/var/tmp/ITflag = 0
mob
	NPC
		Fix
			name = "Fix"
			icon = 'mr.fix.dmi'
			icon_state = "Robot"
			density = 1
			safe = 1
			frozen = 1
			ITflag = 1
			energy_code = 1949631
			New()
				..()
				if(src.z==2)
					src.energy_code = 1949632
				if(src.z==3)
					src.energy_code = 1949633
				if(src.z==4)
					src.energy_code = 1949634
				src.CreateName()
			race = "Robot"
			karma = "Neutral"
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Mr Fix")
					switch(input("What do you need help with?")in list("Fix Equipment","Overlays/Underlays","Dead on Earth","Lost Transform verbs","Cancel"))
						if("Cancel")
							return

						if("Lost Transform verbs")
							for(var/obj/Transform/Transform/T1 in usr)
								del(T1)
							for(var/obj/Transform/Revert/T2 in usr)
								del(T2)
							var/obj/Transform/Transform/T1=new
							var/obj/Transform/Revert/T2=new
							T1.loc=usr
							T2.loc=usr
						if("Fix Equipment")

							for(var/obj/O in usr)
								O.suffix=null
								O.equiped=0
							usr.weight=0
							usr.overlays-=usr.overlays
							usr.underlays-=usr.underlays
							usr.head="EMPTY"
							usr.back="EMPTY"
							usr.chest="EMPTY"
							usr.legs="EMPTY"
							usr.feet="EMPTY"
							usr.arms="EMPTY"
							usr.hands="EMPTY"
							usr.waist="EMPTY"
							usr.underclothes="EMPTY"
							usr.clothes="EMPTY"
							usr.suit = "EMPTY"
							usr.weapone = "EMPTY"
				//	usr.suit = "EMPTY"
							usr.clothes_eq=0
							usr.scouter=0
							usr.scouter_eq=0
							usr.armor=0
							usr.armor_eq=0
							usr.under=0
							usr.under_eq=0
							usr.helmet=0
							usr.helmet_eq=0
							usr.gloves=0
							usr.gloves_eq=0
							usr.z_sword=0
							usr.gitems=0
							usr.radar=0
							usr.hench_equiped=0
							usr.saiyan_equiped=0
							usr.sellable_items=0
							usr.weightgi = 0
							usr.weightcape = 0
							usr.weightarmor = 0
							usr.weightarm = 0
							usr.weightleg = 0
							usr.weightankle = 0
							usr.weightwrist = 0
							usr.weighthead = 0
							usr.weightsword = 0
							usr.melee_bonus = 0
							usr.block_bonus = 0
							usr.counter_bonus = 0
							usr.critical_bonus=0
							usr.dodge_bonus = 0
							usr.durability_bonus = 0
							usr.ki_control_bonus=0
							usr.ki_power_bonus=0
							usr.ki_use_bonus=0
							usr.ki_res_bonus=0
							usr.reflect_bonus=0
							usr.ki_cast_bonus = 0
							usr.melee = usr.melee_max
							usr.block = usr.block_max
							usr.dodge = usr.dodge_max
							usr.counter = usr.counter_max
							usr.critical = usr.critical_max
							usr.durability = usr.durability_max
							usr.ki_control = usr.ki_control_max
							usr.ki_power = usr.ki_power_max
							usr.ki_use = usr.ki_use_max
							usr.ki_res = usr.ki_res_max
							usr.reflect = usr.reflect_max
							usr.ki_cast = ki_cast_max

							usr.weapon_res_bonus = 0
							usr.weapon_resistance = usr.weapon_resistance_max
							usr.weapon_bonus = 0
							usr.weapon = usr.weapon_mastered
							usr.weapon_power_bonus = 0
							usr.weapon_power = usr.weapon_power_max


						if("Fix Icon")
							switch(input(usr,"Are you sure?","Fix Icon")in list("Yes","No"))
								if("Yes")
									usr.Skin_Apply()
									switch(usr.race)
										if("Bio Android")
											if(!usr.form_1)
												usr.icon='Bio Android - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Bio Android - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Bio Android - Form 3.dmi'
										if("Majin")
											if(!usr.form_1)
												usr.icon='Majin - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Majin - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Majin - Form 3.dmi'
											if(usr.form_3)
												usr.icon='Majin - Form 4.dmi'
											if(usr.form_4)
												usr.icon='Majin - Form 5.dmi'
										if("Namekian")
											usr.icon='Namek - Normal.dmi'
											if(usr.form_3)
												usr.icon='Namek - Super.dmi'
										if("Konat")
											usr.icon='Konat - Form 1.dmi'
											if(usr.form_3)
												usr.icon='Namek - Super.dmi'
										if("Tuffle")
											usr.icon='Bebi - Form 1.dmi'
											if(usr.form_1)
												usr.icon='Bebi - Form 2.dmi'
											if(usr.form_2)
												usr.icon='Bebi - Form 2.dmi'
											if(usr.form_3)
												usr.icon='Bebi - Form 3.dmi'
											if(usr.form_4)
												usr.icon='Bebi - Form 3.dmi'
										if("Android")
											if(usr.form_1)
												usr.icon='AndroidForm2.dmi'
											if(usr.form_2)
												usr.icon='AndroidForm3.dmi'
										if("Feline")
											usr.icon='Beerus.dmi'
						if("Overlays/Underlays")
							usr.underlays -= usr.underlays
							usr.overlays -= usr.overlays
						//	if(usr.majin)
						//		usr.overlays += 'Majin.dmi'
							if(usr.race == "Saiyan" && usr.has_tail)
								usr.overlays += 'Tail.dmi'
							return

						if("Dead on Earth")
							if(usr.dead == 1)
								usr.loc = locate(75,622,6)
								usr.dead = 1
							else
								usr << "You are not dead, cannot continue."
							return
