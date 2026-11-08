mob
	NPC
		BUFF_NPC
			name = "{NPC} Buff Giver"
			icon = 'Shenron level 4.dmi'
			density = 1
			doing = 0
			safe = 1
			frozen = 1
			energy_code=11111
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(1)
					set category = null
					switch(alert("Do you want the pvp Bonus, if you have leveled it will give reset you??","PVP Bonus","Yes","No"))
						if("Yes")
							usr.powerlevel=100000000000000
							usr.powerlevel_max=100000000000000
							usr.ki=100000000000000
							usr.ki_max=100000000000000
							usr.kidefense=100000000000000
							usr.kidefense_max=100000000000000
							usr.strength=100000000000000
							usr.strength_max=100000000000000
							usr.defence=100000000000000
							usr.defence_max=100000000000000
							usr.speed=100000000000000
							usr.speed_max=100000000000000
							usr.zenni=100000000000000
							usr.melee_max = 100
							usr.block_max = 100
							usr.dodge_max = 100
							usr.counter_max = 100
							usr.critical_max = 100
							usr.durability_max = 100
							usr.ki_control_max = 100
							usr.ki_cast_max = 100
							usr.ki_power_max = 100
							usr.ki_use_max = 100
							usr.ki_res_max = 100
							usr.reflect_max = 100
							usr.weapon_max = 100
							usr.weapon_power_max = 100
							usr.weapon_resistance_max = 100
							usr.zenni=999999999999999999
							usr.level=500000
							usr.tp=999999999
							usr.zp=300
						else
							usr<<"No worries, have a nice day"

