obj/Technique/UniversalScan
	verb
		Universal_Scan(mob/M in world)
			set category = "Techniques"
			src << "Aquiring [M]'s Biological Signal..."
			sleep(25)
			if(!M)return
			usr << "---------------------"
			usr << "<font size = 4>[M]</size>"
			usr << "Race: [M.race]"
			usr << "Level: [applycommas(M.level)]"
			/*
			usr << "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
			usr << "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
			usr << "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
			usr << "Defense: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
			*/
			usr << "Powerlevel: [applycommas(M.powerlevel)] / [applycommas(M.powerlevel_max)]"
			usr << "Ki: [applycommas(M.ki)] / [applycommas(M.ki_max)]"
			usr << "Strength: [applycommas(M.strength)] / [applycommas(M.strength_max)]"
			usr << "Defense: [applycommas(M.defence)] / [applycommas(M.defence_max)]"
		//	usr << "Ki Defense: [applycommas(M.kidefense)] / [applycommas(M.kidefense_max)]"
			usr << ""
			usr << "Melee Skill: [M.melee]"
			usr << "Block Skill: [M.block]"
			usr << "Counter Skill: [M.counter]"
			usr << "Reflect Skill: [M.reflect]"
			usr << "Dodge Skill: [M.dodge]"
			usr << "Critical Skill: [M.critical]"
			usr << "Durability Skill: [M.durability]"
			usr << ""
			usr << "Ki Control Skill: [M.ki_control]"
			usr << "Ki Cast Skill: [M.ki_cast]"
			usr << "Ki Power Skill: [M.ki_power]"
			usr << "Ki Use Skill: [M.ki_use]"
			usr << "Ki Resistance Skill: [M.ki_res]"
			usr << ""
			usr << "Weapon Skill: [M.weapon]"
			usr << "Weapon Power Skill: [M.weapon_power]"
			usr << "Weapon Resistance Skill: [M.weapon_resistance]"
			usr << ""
			usr << "Energy Code: [num2text(M.energy_code,1000000)]"
			usr << "---------------------"
			return


