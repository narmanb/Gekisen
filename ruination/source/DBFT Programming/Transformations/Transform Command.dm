
mob/var/tmp/cantrevert = 0
mob/var/pickingtrans = 0
mob/var
	powerlevel_saved = 0
	ki_saved = 0
	strength_saved = 0
	defence_saved = 0
obj/Transform/Transform
	verb
		Transform()
			set category = "Combat"
			if(usr.inverted||usr.invertmenu)
				usr << "You must revert from invert power before you can transform!"
				return
			if(usr.KO)
				return
			if(usr.spam_delay)
				return
			if(usr.doing)
				usr << "You are already doing something!"
				return
			if(usr.trans_delay)
				usr << "You body is still recovering from transforming!"
				return
			if(usr.powering)
				usr << "You must finish powering up before you can transform!"
				return
			if(usr.Oozaru)
				usr << "You cannot transform while in Oozaru!"
				return
			usr.spam_delay=1
			spawn(13) usr.calcmaxpl()
			spawn(-1) usr.calcmaxpl()
			if(!usr.transformed&&!usr.inverted)
				usr.pickingtrans=1
				//if(usr.powerlevel_max > usr.powerlevel_saved) usr.powerlevel_saved = usr.powerlevel_max
				if(usr.ki_max > usr.ki_saved) usr.ki_saved = usr.ki_max
				if(usr.strength_max > usr.strength_saved) usr.strength_saved = usr.strength_max
				if(usr.defence_max > usr.defence_saved) usr.defence_saved = usr.defence_max


			//spawn(100) usr.BuffReapply()
			if(usr.race != "Namekian" || usr.race != "Majin" || usr.race != "Android")
				if(usr.kaioken && usr.form_1)
					usr << "You relax your Kaioken state"
					usr.kaioken = 0
					usr.kaiokenB = 0
					usr.Power_Redefine()
			if(usr.race == "Android")
				if(usr.gene == "Gluttonous")
					if(usr.trans_delay||usr.inverted)
						return
					usr.trans_delay = 1
					usr.AndroidTrans()
					spawn(5) usr.trans_delay = 0
					usr.spam_delay=0
					return
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay||usr.inverted)
							return
						usr.trans_delay = 1
						usr.AndroidTrans()
						usr.spam_delay=0
					if("No")
						usr.spam_delay=0
						usr.pickingtrans=0
						return
			if(usr.race == "Bio Android")
				if(!usr.form_2)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay||usr.inverted)
								return
							usr.spam_delay=0
							usr.BioTrans()
						else
							usr.pickingtrans=0
							return
				else
					usr.spam_delay=0
					usr.pickingtrans=0
					usr.BioTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Alien")
				if(usr.gene=="Hitman")
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay||usr.inverted)
								return
							usr.spam_delay=0
							usr.AlienTrans()
						else
							usr.pickingtrans=0
							return
				else
					usr.spam_delay=0
					if(!usr.transformed)
						usr.AlienTrans()
			if(usr.race == "Bio Warrior")
				usr.spam_delay=0
				if(!usr.transformed)
					usr.BioWarriorTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Changeling")
				usr.spam_delay=0
				usr.ChanglingTrans()
				spawn(10) usr.cantrevert=0
			if(usr.race == "Demon")
				if(usr.gene == "Malevolent"||usr.gene == "Fomhoire")
					if(!usr.transformed)
						usr.DemonTransMaleOne()
						spawn(10) usr.cantrevert=0
				if(usr.gene == "Vile")
					if(!usr.form_1)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.DemonTrans()
								spawn(10) usr.cantrevert=0
								usr.spam_delay=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return
					else
						usr.spam_delay=0
						usr.DemonTrans()
						spawn(10) usr.cantrevert=0
				if(usr.gene=="Sinister")
					if(!usr.form_2)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.DemonTrans()
								usr.spam_delay=0
								spawn(10) usr.cantrevert=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return
					else
						usr.spam_delay=0
						usr.DemonTrans()
						spawn(10) usr.cantrevert=0
				else
					usr.spam_delay=0
					usr.DemonTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race =="Feline")
				if(usr.gene == "Destructive")
					if(!usr.form_2)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.FelineTrans()
								usr.spam_delay=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return
				if(usr.gene == "Godly")
					if(!usr.form_1)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.FelineTrans()
								usr.spam_delay=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return

			if(usr.race == "Dragon")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay||usr.inverted)
							return
						usr.trans_delay = 1
						usr.DragonTrans()
						usr.spam_delay=0
					if("No")
						usr.spam_delay=0
						usr.pickingtrans=0
						return
			if(usr.race == "Half Saiyan")
				usr.spam_delay=0
				if(!usr.transformed)
					usr.HalfSaiyanTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Heran")
				usr.spam_delay=0
				usr.BojackTrans()
				spawn(10) usr.cantrevert=0
			if(usr.race == "Human")
				if(usr.gene == "Majin Incarnate")
					if(!usr.form_2)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									usr.spam_delay=0
									return
								usr.trans_delay = 1
								usr.HumanTrans()
								usr.spam_delay=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return
					else
						usr.spam_delay=0
						usr.HumanTrans()
						spawn(10) usr.cantrevert=0
				else
					usr.spam_delay=0
					if(!usr.transformed)
						usr.HumanTrans()
						spawn(10) usr.cantrevert=0
			if(usr.race == "Kai")
				if(usr.gene == "Zealot"&& usr.hasgokubody == 0)
					if(!usr.form_1||!usr.form_2)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.KaiTrans()
								usr.spam_delay=0
							if("No")
								usr.spam_delay=0
								usr.pickingtrans=0
								return
					usr.pickingtrans=0
				usr.spam_delay=0

				usr.KaiTrans()
				spawn(10) usr.cantrevert=0
			if(usr.race == "Majin")
				switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
					if("Yes")
						if(usr.trans_delay||usr.inverted)
							return
						usr.trans_delay = 1
						usr.MajinTrans()
						usr.spam_delay=0
					if("No")
						usr.pickingtrans=0
						usr.spam_delay=0
						return
			if(usr.race == "Majin Wizard")
				usr.spam_delay=0
				if(!usr.transformed)
					usr.BabidiTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Namekian")
				if(!usr.form_1)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay||usr.inverted)
								return
							usr.trans_delay = 1
							usr.NamekTrans()
							usr.spam_delay=0
						if("No")
							usr.pickingtrans=0
							usr.spam_delay=0
							return
				else
					usr.spam_delay=0
					usr.NamekTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Saibaman")
				if(usr.gene == "Virulent"||usr.gene=="Godly")
					if(!usr.form_2)
						switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
							if("Yes")
								if(usr.trans_delay||usr.inverted)
									return
								usr.trans_delay = 1
								usr.SaibamanTrans()
								usr.spam_delay=0
							if("No")
								usr.pickingtrans=0
								usr.spam_delay=0
								return
					else
						usr.spam_delay=0

						usr.SaibamanTrans()
				else
					usr.spam_delay=0
					if(!usr.transformed)
						usr.SaibamanTransPB()
						spawn(10) usr.cantrevert=0
			if(usr.race == "Saiyan")
				usr.spam_delay=0
				if(!usr.transformed)
					usr.SaiyanTrans()
					spawn(10) usr.cantrevert=0
			if(usr.race == "Tuffle")
				if(!usr.form_2)
					switch(alert(usr,"Are you sure you want to transform?(non-revertable)","Transform","Yes","No"))
						if("Yes")
							if(usr.trans_delay||usr.inverted)
								return
							usr.spam_delay=0
							usr.TuffleTrans()
						else
							usr.pickingtrans=0
							return
				else
					usr.spam_delay=0

					usr.TuffleTrans()
					spawn(10) usr.cantrevert=0
			usr.doing = 0
			sleep(35)
			usr.trans_delay = 0
			return
obj/Transform/Revert
	verb
		Revert()
			set category = "Combat"
			if(usr.doing)
				return
			if(usr.pickingtrans)
				usr << "picking trans, relogging should fix, report to admin either way please"
				return
			if(usr.KO)
				return
			if(usr.trans_delay)
				return
//			if(usr.cantrevert)
//				return
			usr.trans_delay = 1
			usr.doing = 1
			usr.DebugRevert1()
			spawn(13) usr.calcmaxpl()
			//DebugRevert(src,"BEFOREREPORT maxpl [usr.powerlevel_max] transOpl [usr.transOpl] -trans_pl_gain [usr.trans_pl_gain]")
			if(usr.learn_invertpower)
				if(usr.inverted)
					usr.InvertRevert()
			if(usr.race == "Bio Android")
				usr.BioRevert()
			if(usr.race == "Bio Warrior")
				usr.BioWarriorRevert()
			if(usr.race == "Heran")
				usr.BojackRevert()
			if(usr.race == "Changeling")
				usr.ChanglingRevert()
			if(usr.race == "Demon")
				usr.DemonRevert()
			if(usr.race == "Half Saiyan")
				usr.HalfSaiyanRevert()
			if(usr.race == "Human")
				usr.HumanRevert()
			if(usr.race == "Kai")
				if(usr.gene == "Pure Blooded"||usr.gene == "Zealot")
					usr.KaiRevert()

			if(usr.race == "Majin")
				usr.MajinRevert()
			if(usr.race == "Majin Wizard")
				usr.BabidiRevert()
			if(usr.race == "Namekian")
				usr.NamekRevert()
			if(usr.race == "Saibaman")
				usr.SaibamanRevert()
			if(usr.race == "Saiyan")
				usr.SaiyanRevert()
			if(usr.race == "Tuffle")
				usr.TuffleRevert()
			if(usr.race=="Alien")
				if(usr.gene!="Hitman")
					usr.AlienRevert()
			if(usr.race=="Android")
				if(usr.gene=="Gluttonous")
					usr.AndroidRevert()
			usr.underlays-=usr.underlays
			usr.doing=0
			usr.aura_on=0
			sleep(35)
			usr.trans_delay=0
			return
mob
	proc
		Power_Redefine()
		//	sleep(10)
			spawn(-1) usr.calcmaxpl()
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

			src.powerlevel = round((src.ki_control * src.powerlevel_max)/100)
			src.ki = round((src.ki_control * src.ki_max)/100)
		//	src.kidefense = round((src.ki_control * src.kidefense_max)/100)
			src.strength = round((src.ki_control * src.strength_max)/100)
			src.defence = round((src.ki_control * src.defence_max)/100)
		//	src.speed = round((src.ki_control * src.speed_max)/100)

/*
			if(src.powerlevel_max < 0)
				DebugRevert(src,"AFTERREVERT maxpl [src.powerlevel_max] transOpl [src.transOpl] -trans_pl_gain [src.trans_pl_gain]")
			if(src.ki_max < 0)
				DebugRevert(src,"AFTERREVERT ki [src.ki_max] transOpl [src.transOki] -trans_ki_gain [src.trans_ki_gain]")

			if(src.strength_max < 0)
				DebugRevert(src,"AFTERREVERT str [src.strength_max] transOstr [src.transOstr] -trans_str_gain [src.trans_str_gain]")
			if(src.defence_max < 0)
				DebugRevert(src,"AFTERREVERT def [src.defence_max] transdef [src.transOdef] -trans_str_gain [src.trans_str_gain]")

	*/
		//	src.DebugRevert2(src)


			if(!src.transformed&&!src.inverted)
				return
			if(src.manipulated)
				src.powerlevel+= round(prPL)
				src.ki+= round(prKI)
			//	src.kidefense+= round(prKIDEF)
				src.strength+= round(prSTR)
				src.defence+= round(prDEF)
				src << "<b><font color = red>Buffs reapplied"
				src << "<font color = red><i>Powerlevel + [applycommas(prPL)]"
				src << "<font color = red><i>Ki + [applycommas(prKI)]"
			//	src << "<font color = red><i>Ki Defense + [applycommas(prKIDEF)]"
				src << "<font color = red><i>Strength + [applycommas(prSTR)]"
				src << "<font color = red><i>Defense + [applycommas(prDEF)]"

			if(src.buff1)
				src.powerlevel+= round(prPL)
				src << "<font color = red><i>Powerlevel + [applycommas(prPL)]"

			if(src.buff2)
				src.ki+= round(prKI)
			//	src.kidefense+= round(prKIDEF)
				src << "<font color = red><i>Ki + [applycommas(prKI)]"
			//	src << "<font color = red><i>Ki Defense + [applycommas(prKIDEF)]"

			if(src.buff3)
				src.strength+= round(prSTR)
				src << "<font color = red><i>Strength + [applycommas(prSTR)]"

			if(src.buff4)
				src.defence+= round(prDEF)
				src << "<font color = red><i>Defense + [applycommas(prDEF)]"
			return

		BuffReapply()
			if(src.manipulated)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.powerlevel+= round(prPL)
				src.ki+= round(prKI)
			//	src.kidefense+= round(prKIDEF)
				src.strength+= round(prSTR)
				src.defence+= round(prDEF)
				src << "<b><font color = red>Buffs reapplied"
				src << "<font color = red><i>Powerlevel + [applycommas(prPL)]"
				src << "<font color = red><i>Ki + [applycommas(prKI)]"
			//	src << "<font color = red><i>Ki Defense + [applycommas(prKIDEF)]"
				src << "<font color = red><i>Strength + [applycommas(prSTR)]"
				src << "<font color = red><i>Defense + [applycommas(prDEF)]"

			if(src.buff1)
				src.powerlevel+= round(prPL)
				src << "<font color = red><i>Powerlevel + [applycommas(prPL)]"

			if(src.buff2)
				src.ki+= round(prKI)
			//	src.kidefense+= round(prKIDEF)
				src << "<font color = red><i>Ki + [applycommas(prKI)]"
			//	src << "<font color = red><i>Ki Defense + [applycommas(prKIDEF)]"

			if(src.buff3)
				src.strength+= round(prSTR)
				src << "<font color = red><i>Strength + [applycommas(prSTR)]"

			if(src.buff4)
				src.defence+= round(prDEF)
				src << "<font color = red><i>Defense + [applycommas(prDEF)]"
			return



mob
	proc
		RevertProc()
			if(src.doing)
				return
			if(src.KO)
				return
			if(src.trans_delay)
				return
			src.trans_delay = 1
			src.doing = 1
			if(src.learn_invertpower)
				if(src.inverted)
					src.InvertRevert()
			if(src.race == "Bio Android")
				src.BioRevert()
			if(src.race == "Bio Warrior")
				src.BioWarriorRevert()
			if(src.race == "Heran")
				src.BojackRevert()
			if(src.race == "Changeling")
				src.ChanglingRevert()
			if(src.race == "Demon")
				src.DemonRevert()
			if(src.race == "Half Saiyan")
				src.HalfSaiyanRevert()
			if(src.race == "Human")
				src.HumanRevert()
			if(src.race == "Kai")
				if(src.gene == "Pure Blooded"||src.gene == "Zealot")
					src.KaiRevert()

			if(src.race == "Majin")
				src.MajinRevert()
			if(src.race == "Majin Wizard")
				src.BabidiRevert()
			if(src.race == "Namekian")
				src.NamekRevert()
			if(src.race == "Saibaman")
				src.SaibamanRevert()
			if(src.race == "Saiyan")
				src.SaiyanRevert()
			if(src.race == "Tuffle")
				src.TuffleRevert()
			if(src.race=="Alien")
				if(src.gene!="Hitman")
					src.AlienRevert()


			src.underlays-=src.underlays
			src.doing=0
			src.aura_on=0
			sleep(35)
			src.trans_delay=0
			return