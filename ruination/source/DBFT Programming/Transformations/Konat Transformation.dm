mob/proc/KonatTrans()
	if(src.doing)
		return
	if(src.cant_trans)
		return
	else
		src.pickingtrans = 0
		if(src.gene == "Pure Blooded")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000)
					src.cant_trans = 1
					src.doing = 1
					src.icon_state="play"
					src.overlays+='Music Box.dmi'
					view(8)<<sound(null)
					view(8)<<sound('Tapion.mid',0)
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					var/push=4
					spawn(1)
						while(push)
							push-=1
							for(var/mob/PC/M in oview(8))
								var/FallDir = get_dir(src,M)
								step(M,FallDir)
								switch(FallDir)
									if(NORTH)M.dir = SOUTH
									if(NORTHWEST)M.dir = SOUTHEAST
									if(WEST)M.dir = EAST
									if(SOUTHWEST)M.dir = NORTHEAST
									if(SOUTH)M.dir = NORTH
									if(SOUTHEAST)M.dir = NORTHWEST
									if(EAST)M.dir = WEST
									if(NORTHEAST)M.dir = SOUTHWEST
							sleep(15)
					sleep(60)
					new/obj/techs/Overlays/Crater_Center(src.loc)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)

					src.melee = (src.melee_max+src.melee_bonus)
					src.block = (src.block_max+src.block_bonus)
					src.dodge = (src.dodge_max+src.dodge_bonus)
					src.counter = (src.counter_max+src.counter_bonus)
					src.critical = (src.critical_max+src.critical_bonus)
					src.durability = (src.durability_max+src.durability_bonus)
					src.ki_control = (src.ki_control_max+src.ki_control_bonus)
					src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
					src.ki_power = (src.ki_power_max+src.ki_power_bonus)
					src.ki_use = (src.ki_use_max+src.ki_use_bonus)
					src.ki_res = (src.ki_res_max+src.ki_res_bonus)
					src.reflect = (src.reflect_max+src.reflect_bonus)
					src.weapon = (src.weapon_max+src.weapon_bonus)
					src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
					src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)
					//50

					src.powerlevel_max *= 7.5
					src.ki_max *= 7.5
					src.kidefense_max *= 7.5
					src.strength_max *= 7.5
					src.defence_max *= 7.5
					src.speed_max *= 7.5
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.overlays-='Music Box.dmi'
					src.overlays += 'Elec White.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					src.spam_delay=0
					src.trans_delay=0
					spawn(40)src.cant_trans = 0
					return
			else
				if(!src.form_2)
					if(!src.doing)
						if(!src.cant_trans)
							if(src.powerlevel_max >= 30000000)
								src.cant_trans = 1
								src.doing = 1
								usr.icon_state="play"
								usr.overlays+='Music Box.dmi'
								view(8)<<sound(null)
								view(8)<<sound('Tapion.mid',0)
								if(src.trans1t!="")
									view(8)<<"\white[src]: \font [src.trans1t]"
								src.frozen = 1
								var/push=4
								spawn(1)
									while(push)
										push-=1
										for(var/mob/PC/M in oview(8))
											var/FallDir = get_dir(src,M)
											step(M,FallDir)
											switch(FallDir)
												if(NORTH)M.dir = SOUTH
												if(NORTHWEST)M.dir = SOUTHEAST
												if(WEST)M.dir = EAST
												if(SOUTHWEST)M.dir = NORTHEAST
												if(SOUTH)M.dir = NORTH
												if(SOUTHEAST)M.dir = NORTHWEST
												if(EAST)M.dir = WEST
												if(NORTHEAST)M.dir = SOUTHWEST
										sleep(15)
								sleep(60)
								new/obj/techs/Overlays/Crater_Center(src.loc)
								src.overlays-='Music Box.dmi'

								src.melee = (src.melee_max+src.melee_bonus)
								src.block = (src.block_max+src.block_bonus)
								src.dodge = (src.dodge_max+src.dodge_bonus)
								src.counter = (src.counter_max+src.counter_bonus)
								src.critical = (src.critical_max+src.critical_bonus)
								src.durability = (src.durability_max+src.durability_bonus)
								src.ki_control = (src.ki_control_max+src.ki_control_bonus)
								src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
								src.ki_power = (src.ki_power_max+src.ki_power_bonus)
								src.ki_use = (src.ki_use_max+src.ki_use_bonus)
								src.ki_res = (src.ki_res_max+src.ki_res_bonus)
								src.reflect = (src.reflect_max+src.reflect_bonus)
								src.weapon = (src.weapon_max+src.weapon_bonus)
								src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
								src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)

								src.powerlevel_max *= 10
								src.ki_max *= 10
								src.kidefense_max *= 10
								src.strength_max *= 10
								src.defence_max *= 10
								src.speed_max *= 10

								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.Big_Aura()
								src.powerlevel = src.powerlevel_max
								src.ki = src.ki_max
								src.kidefense=src.kidefense_max
								src.strength = src.strength_max
								src.defence = src.defence_max
								src.speed = src.speed_max

								src.icon_state = ""
								src.form_2 = 1
								src.frozen = 0
								src.doing = 0
								src.spam_delay=0
								src.safe = 0
								src.trans_delay=0
								return

		if(src.gene == "Brave")
			if(!src.form_1)
				if(src.powerlevel_max >= 25000000)
					src.cant_trans = 1
					src.doing = 1
					src.icon_state="play"
					src.overlays+='Music Box.dmi'
					view(8)<<sound(null)
					view(8)<<sound('Tapion.mid',0)
					if(src.trans1t!="")
						view(8)<<"\white[src]: \font [src.trans1t]"
					src.frozen = 1
					var/push=4
					spawn(1)
						while(push)
							push-=1
							for(var/mob/PC/M in oview(8))
								var/FallDir = get_dir(src,M)
								step(M,FallDir)
								switch(FallDir)
									if(NORTH)M.dir = SOUTH
									if(NORTHWEST)M.dir = SOUTHEAST
									if(WEST)M.dir = EAST
									if(SOUTHWEST)M.dir = NORTHEAST
									if(SOUTH)M.dir = NORTH
									if(SOUTHEAST)M.dir = NORTHWEST
									if(EAST)M.dir = WEST
									if(NORTHEAST)M.dir = SOUTHWEST
							sleep(15)
					sleep(60)
					new/obj/techs/Overlays/Crater_Center(src.loc)
					for(var/obj/Technique/InvertPower/T in src)
						del(T)

					src.melee = (src.melee_max+src.melee_bonus)
					src.block = (src.block_max+src.block_bonus)
					src.dodge = (src.dodge_max+src.dodge_bonus)
					src.counter = (src.counter_max+src.counter_bonus)
					src.critical = (src.critical_max+src.critical_bonus)
					src.durability = (src.durability_max+src.durability_bonus)
					src.ki_control = (src.ki_control_max+src.ki_control_bonus)
					src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
					src.ki_power = (src.ki_power_max+src.ki_power_bonus)
					src.ki_use = (src.ki_use_max+src.ki_use_bonus)
					src.ki_res = (src.ki_res_max+src.ki_res_bonus)
					src.reflect = (src.reflect_max+src.reflect_bonus)
					src.weapon = (src.weapon_max+src.weapon_bonus)
					src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
					src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)

					src.weapon_bonus += 5
					src.weapon_power_bonus += 5
					src.weapon_res_bonus += 5
					src.weapon += 5
					src.weapon_power += 5
					src.weapon_resistance += 5

					src.powerlevel_max *= 8
					src.ki_max *= 8
					src.kidefense_max *= 8
					src.strength_max *= 8
					src.defence_max *= 8
					src.speed_max *= 8
					src.overlays-='Music Box.dmi'
					src.overlays += 'Elec White.dmi'
					src.underlays -= src.underlays
					src.overlays -= src.aura
					src.Big_Aura()
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.kidefense=src.kidefense_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.speed = src.speed_max

					src.icon_state = ""
					src.form_1 = 1
					src.transformed=1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					src.spam_delay=0
					src.trans_delay=0
					spawn(40)src.cant_trans = 0
					return
			else
				if(!src.form_2)
					if(!src.doing)
						if(!src.cant_trans)
							if(src.powerlevel_max >= 30000000)
								src.cant_trans = 1
								src.doing = 1
								usr.icon_state="play"
								usr.overlays+='Music Box.dmi'
								view(8)<<sound(null)
								view(8)<<sound('Tapion.mid',0)
								if(src.trans1t!="")
									view(8)<<"\white[src]: \font [src.trans1t]"
								src.frozen = 1
								var/push=4
								spawn(1)
									while(push)
										push-=1
										for(var/mob/PC/M in oview(8))
											var/FallDir = get_dir(src,M)
											step(M,FallDir)
											switch(FallDir)
												if(NORTH)M.dir = SOUTH
												if(NORTHWEST)M.dir = SOUTHEAST
												if(WEST)M.dir = EAST
												if(SOUTHWEST)M.dir = NORTHEAST
												if(SOUTH)M.dir = NORTH
												if(SOUTHEAST)M.dir = NORTHWEST
												if(EAST)M.dir = WEST
												if(NORTHEAST)M.dir = SOUTHWEST
										sleep(15)
								sleep(60)
								new/obj/techs/Overlays/Crater_Center(src.loc)
								src.overlays-='Music Box.dmi'

								src.melee = (src.melee_max+src.melee_bonus)
								src.block = (src.block_max+src.block_bonus)
								src.dodge = (src.dodge_max+src.dodge_bonus)
								src.counter = (src.counter_max+src.counter_bonus)
								src.critical = (src.critical_max+src.critical_bonus)
								src.durability = (src.durability_max+src.durability_bonus)
								src.ki_control = (src.ki_control_max+src.ki_control_bonus)
								src.ki_cast = (src.ki_cast_max+src.ki_cast_bonus)
								src.ki_power = (src.ki_power_max+src.ki_power_bonus)
								src.ki_use = (src.ki_use_max+src.ki_use_bonus)
								src.ki_res = (src.ki_res_max+src.ki_res_bonus)
								src.reflect = (src.reflect_max+src.reflect_bonus)
								src.weapon = (src.weapon_max+src.weapon_bonus)
								src.weapon_power = (src.weapon_power_max+src.weapon_power_bonus)
								src.weapon_resistance = (src.weapon_resistance_max+src.weapon_res_bonus)


								src.weapon_max += 5
								src.weapon_power_max += 5
								src.weapon_resistance_max += 5
								src.weapon += 5
								src.weapon_power += 5
								src.weapon_resistance += 5


								src.powerlevel_max *= 10
								src.ki_max *= 10
								src.kidefense_max *= 10
								src.strength_max *= 10
								src.defence_max *= 10
								src.speed_max *= 10
								src.underlays -= src.underlays
								src.overlays -= src.aura
								src.Big_Aura()
								src.powerlevel = src.powerlevel_max
								src.ki = src.ki_max
								src.kidefense=src.kidefense_max
								src.strength = src.strength_max
								src.defence = src.defence_max
								src.speed = src.speed_max

								src.icon_state = ""
								src.form_2 = 1
								src.frozen = 0
								src.doing = 0
								src.spam_delay=0
								src.safe = 0
								src.trans_delay=0
								return

obj
	Equipment
		MagicBox
			name="Magic Box"
			icon='Music Box.dmi'
			icon_state="box"
			Click()
				if(usr.race == "Konat")
					if(usr.e_db_1&&usr.e_db_2&&usr.e_db_3&&usr.e_db_4&&usr.e_db_5&&usr.e_db_6&&usr.e_db_7)
						for(var/obj/Earth_Dragonballs/O in world)
							del(O)
						usr.e_db_1 = 0
						usr.e_db_2 = 0
						usr.e_db_3 = 0
						usr.e_db_4 = 0
						usr.e_db_5 = 0
						usr.e_db_6 = 0
						usr.e_db_7 = 0
						world << "<font color = green>The Sky Darkens as Shenron is summoned!</font>"
						usr << browse('Shenron.BMP',"display=0")
						usr << browse("<body bgcolor=\"black\"><center><img src=Shenron.BMP><p><font color = \"yellow\" size = 4>You Have Summoned Shenron! </center>")
						spawn(1)world.Earth_Dragonball_Spawn(72000)
						sleep(15)
						usr << browse(null)
						world << "<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs away!</font>"
						usr.contents+=new/obj/Equipment/Flute
						del(src)
						alert("Your wish has been granted!")
					else
						usr<<"Please collect all 7 Earth Dragonballs to use the magic box"
			verb
				Examine()
					set category = null
					var/examine_box = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Verdana color=#FF0000>Magic Box</font></b></td></tr><tr><td width=96 height=12><font size=1 color=green face=Verdana>This looks like it could be opened if it could draw power from 7 powerful items from Earth</font></b>"
					usr << browse(examine_box,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")

		Flute
			icon='Music Box.dmi'
			Click()
				if(usr.inverted)
					usr << "Revert from invert first"
					return
				if(usr.race == "Konat")
					if(!usr.form_1)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay)
									return
								usr.trans_delay = 1
								usr.KonatTrans()
							if("No")
								usr.spam_delay=0
								return
					else
						if(usr.form_1&&!usr.form_2)
							switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
								if("Yes")
									if(usr.trans_delay)
										return
									usr.trans_delay = 1
									usr.KonatTrans()
								if("No")
									usr.spam_delay=0
									return
						else
							if(usr.form_2)
								if(usr.tech_cooldown)
									usr<<"You must cooldown."
									return
								if(usr.doing)
									usr<<"You are doing something."
									return
								if(usr.frozen)
									usr<<"You can't move right now."
									return
								if(usr.ki<50000)
									usr<<"You don't have enough ki!"
									return
								if(usr.ki_lock)
									usr << "You can't use ki right now."
									return
								if(usr.safe)
									usr << "You can't attack right now."
									return
								if(!usr.pk)
									usr << "Reach level 2500 to be able to use battle techniques."
									return
								usr.frozen=1
								usr.doing=1
								usr.icon_state="play"
								usr.overlays+='Music Box.dmi'
								view(8)<<sound(null)
								view(8)<<sound('Tapion.mid',0)
								sleep(60)
								for(var/mob/PC/M in view(8))
									if(M.powerlevel<M.powerlevel_max)
										M.powerlevel=M.powerlevel_max
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								usr.overlays-='Music Box.dmi'