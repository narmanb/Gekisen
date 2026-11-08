mob
	var
		smallshard = 0
		largeshard = 0
		greatshard = 0
		massshard = 0
		smallshards = 0
		largeshards = 0
		greatshards = 0
		massshards = 0
		smallshardz = 0
		largeshardz = 0
		greatshardz = 0
		massshardz = 0
		scooldowne = 0
		scooldowns = 0
		scooldownz = 0
		lcooldowne = 0
		lcooldowns = 0
		lcooldownz = 0
		gcooldowne = 0
		gcooldowns = 0
		gcooldownz = 0
		mcooldowne = 0
		mcooldowns = 0
		mcooldownz = 0
		smallshardp = 0
		largeshardp = 0
		greatshardp = 0
		massshardp = 0
		smallshardsp = 0
		largeshardsp = 0
		greatshardsp = 0
		massshardsp = 0
		smallshardzp = 0
		largeshardzp = 0
		greatshardzp = 0
		massshardzp = 0

		autouseshard=1

//// Mini Shards

obj/Equipment/Buff_Items

	SPL_Shard
		name = "Small Powerlevel Shard"
		icon = 'Shards.dmi'
		icon_state = "SPL"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Mini PL Shard (+3% Maximum PowerLevel)</I>"
				//usr.powerlevel_max *= 1.03
				var gain = round(usr.powerlevel_max*0.01)
				if(gain > 10000)
					gain = 10000
				usr << "<font color = red>You have activated your <I>Mini PL Shard (Powerlevel + [applycommas(gain)])</I>"
				usr.powerlevel_max += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return


		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))


					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."


	SKI_Shard
		name = "Small Ki Shard"
		icon = 'Shards.dmi'
		icon_state = "SKi"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Mini Ki Shard (+2% Maximum Ki)</I>"
			//	usr.ki_max *= 1.02
				var gain = 5
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Bonus + [applycommas(gain)])</I>"
				usr.ki_bonus += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	SKIDEF_Shard
		name = "Small Ki Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "SKiDef"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Mini Ki Defence Shard (+2% Maximum Ki Defence)</I>"
				//usr.kidefense_max *= 1.02
				var gain = round(usr.kidefense_max*0.01)
				if(gain > 10000)
					gain = 10000
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense + [applycommas(gain)])</I>"
				usr.kidefense_max += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	SSTR_Shard
		name = "Small Strength Shard"
		icon = 'Shards.dmi'
		icon_state = "SStr"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)
				//usr << "<font color = red>You have activated your <I>Mini Strength Shard (+2% Maximum Strength)</I>"
				//usr.strength_max *= 1.02
				var gain = 5
				usr << "<font color = red>You have activated your <I>[src.name] (Strength Bonus + [applycommas(gain)])</I>"
				usr.strength_bonus += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	SDEF_Shard
		name = "Small Defense Shard"
		icon = 'Shards.dmi'
		icon_state = "SDef"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)
//				usr << "<font color = red>You have activated your <I>Mini Defence Shard (+2% Maximum Defence)</I>"
				//usr.defence_max *= 1.02

				var gain = 5
				usr << "<font color = red>You have activated your <I>[src.name] (Defense Bonus + [applycommas(gain)])</I>"
				usr.defence_bonus += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	SSPD_Shard
		name = "Small Speed Shard"
		icon = 'Shards.dmi'
		icon_state = "SSpd"
		density = 0

		value = 1000
		equiped = 0

		Click()
			if(src in usr:contents)

				usr << "<font color = red>You have activated your <I>Mini Speed Shard (+2% Maximum Speed)</I>"
				usr.speed_max *= 1.02
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	SEXP_Shard
		name = "Small EXP Shard"
		icon = 'Shards.dmi'
		icon_state = "SExp"
		density = 0

		value = 1000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.largeshard||usr.greatshard||usr.massshard)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.smallshard)
					usr << "<font color = red>You are not ready to use the Small EXP Shard yet! (<font color = white> [(usr.scooldowne) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Small EXP Shard (+25% Exp)</I> for 3 hours."
				usr.smallshard = 1
				usr.scooldowne = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_exp()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	SSTT_Shard
		name = "Small Stat Shard"
		icon = 'Shards.dmi'
		icon_state = "SStat"
		density = 0

		value = 1000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.largeshards||usr.greatshards||usr.massshards)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.smallshards)
					usr << "<font color = red>You are not ready to use the Small Stat Shard yet! (<font color = white> [(usr.scooldowns) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Small Stat Shard (+25% Stats)</I> for 3 Hours."
				usr.smallshards = 1
				usr.scooldowns = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_Stat()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	SZ_Shard
		name = "Small Zenni Shard"
		icon = 'Shards.dmi'
		icon_state = "SZenni"
		density = 0

		value = 1000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.largeshardz||usr.greatshardz||usr.massshardz)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.smallshardz)
					usr << "<font color = red>You are not ready to use the Small Zenni Shard yet! (<font color = white> [(usr.scooldownz) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Small Zenni Shard (+25% Zenni)</I> for 3 Hours."
				usr.smallshardz = 1
				usr.scooldownz = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_zen()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

//// Normal Shards

obj/Equipment/Buff_Items

	LPL_Shard
		name = "Large Powerlevel Shard"
		icon = 'Shards.dmi'
		icon_state = "LPL"
		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Large PL Shard (+10% Maximum PowerLevel)</I>"
				//usr.powerlevel_max *= 1.1
				usr.shards_used ++

				var gain = round(usr.powerlevel_max*0.01)
				if(gain > 50000)
					gain = 50000
				usr << "<font color = red>You have activated your <I>[src.name] (PL + [applycommas(gain)])</I>"
				usr.powerlevel_max += gain

				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LKI_Shard
		name = "Large Ki Shard"
		icon = 'Shards.dmi'
		icon_state = "LKi"

		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Large Ki Shard (+7% Maximum Ki)</I>"
			//	usr.ki_max *= 1.07
				var gain = 10
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Bonus + [applycommas(gain)])</I>"
				usr.ki_bonus += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LKIDEF_Shard
		name = "Large Ki Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "LKiDef"
		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Large Ki Defence Shard (+7% Maximum Ki Defence)</I>"
			//	usr.kidefense_max *= 1.07

				var gain = round(usr.kidefense_max*0.01)
				if(gain > 50000)
					gain = 50000
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense+ [applycommas(gain)])</I>"
				usr.kidefense_max += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LSTR_Shard
		name = "Large Strength Shard"
		icon = 'Shards.dmi'
		icon_state = "LStr"
		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Large Strength Shard (+7% Maximum Strength)</I>"
				//usr.strength_max *= 1.07

				var gain = 10
				usr << "<font color = red>You have activated your <I>[src.name] (Strength Bonus + [applycommas(gain)])</I>"
				usr.strength_bonus += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LDEF_Shard
		name = "Large Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "LDef"
		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Large Defence Shard (+7% Maximum Defence)</I>"
				//usr.defence_max *= 1.07
				var gain = 10
				usr << "<font color = red>You have activated your <I>[src.name] (Defense Bonus + [applycommas(gain)])</I>"
				usr.defence_bonus += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LSPD_Shard
		name = "Large Speed Shard"
		icon = 'Shards.dmi'
		icon_state = "LSpd"
		density = 0

		value = 5000
		equiped = 0

		Click()
			if(src in usr:contents)

				usr << "<font color = red>You have activated your <I>Large Speed Shard (+7% Maximum Speed)</I>"
				usr.speed_max *= 1.07
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	LEXP_Shard
		name = "Large EXP Shard"
		icon = 'Shards.dmi'
		icon_state = "LExp"
		density = 0

		value = 10000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshard||usr.greatshard||usr.massshard)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.largeshard)
					usr << "<font color = red>You are not ready to use the Large EXP Shard yet!(<font color = white> [(usr.lcooldowne) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Large EXP Shard (+50% Exp)</I> for 3 hours."
				usr.largeshard = 1
				usr.lcooldowne = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_exp1()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	LSTT_Shard
		name = "Large Stat Shard"
		icon = 'Shards.dmi'
		icon_state = "LStat"
		density = 0

		value = 10000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshards||usr.greatshards||usr.massshards)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.largeshards)
					usr << "<font color = red>You are not ready to use the Large Stat Shard yet!(<font color = white> [(usr.lcooldowns) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Large Stat Shard (+50% Stats)</I> for 3 Hours."
				usr.largeshards = 1
				usr.lcooldowns = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_stat1()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	LZ_Shard
		name = "Large Zenni Shard"
		icon = 'Shards.dmi'
		icon_state = "LZenni"
		density = 0

		value = 10000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshardz||usr.greatshardz||usr.massshardz)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.largeshardz)
					usr << "<font color = red>You are not ready to use the Large Zenni Shard yet!(<font color = white> [(usr.lcooldownz) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Large Zenni Shard (+50% Zenni)</I> for 3 Hours."
				usr.largeshardz = 1
				usr.lcooldownz = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_zen1()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

//// Great Shards

obj/Equipment/Buff_Items

	GPL_Shard
		name = "Great Powerlevel Shard"
		icon = 'Shards.dmi'
		icon_state = "LPL"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Great PL Shard (+20% Maximum PowerLevel)</I>"
				//usr.powerlevel_max *= 1.2
				var gain = round(usr.powerlevel_max*0.01)
				if(gain > 100000)
					gain = 100000
				usr << "<font color = red>You have activated your <I>[src.name] (Powerlevel + [applycommas(gain)])</I>"
				usr.powerlevel_max += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GKI_Shard
		name = "Great Ki Shard"
		icon = 'Shards.dmi'
		icon_state = "LKi"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Great Ki Shard (+15% Maximum Ki)</I>"
			//	usr.ki_max *= 1.15

				var gain = 25
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Bonus + [applycommas(gain)])</I>"
				usr.ki_bonus += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GKIDEF_Shard
		name = "Great Ki Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "LKiDef"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Large Ki Defence Shard (+15% Maximum Ki Defence)</I>"
			//	usr.kidefense_max *= 1.15

				var gain = round(usr.kidefense_max*0.01)
				if(gain > 100000)
					gain = 100000
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense + [applycommas(gain)])</I>"
				usr.kidefense_max += gain

				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GSTR_Shard
		name = "Great Strength Shard"
		icon = 'Shards.dmi'
		icon_state = "LStr"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)

		//		usr << "<font color = red>You have activated your <I>Large Strength Shard (+15% Maximum Strength)</I>"
		//		usr.strength_max *= 1.15

				var gain = 25
				usr << "<font color = red>You have activated your <I>[src.name] (Strength Bonus + [applycommas(gain)])</I>"
				usr.strength_bonus += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GDEF_Shard
		name = "Great Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "LDef"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Large Defence Shard (+15% Maximum Defence)</I>"
			//	usr.defence_max *= 1.15
				var gain = 25
				usr << "<font color = red>You have activated your <I>[src.name] (Defense Bonus + [applycommas(gain)])</I>"
				usr.defence_bonus += gain
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GSPD_Shard
		name = "Great Speed Shard"
		icon = 'Shards.dmi'
		icon_state = "LSpd"
		density = 0

		value = 10000
		equiped = 0

		Click()
			if(src in usr:contents)

				usr << "<font color = red>You have activated your <I>Large Speed Shard (+15% Maximum Speed)</I>"
				usr.speed_max *= 1.15
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	GEXP_Shard
		name = "Great EXP Shard"
		icon = 'Shards.dmi'
		icon_state = "LExp"
		density = 0

		value = 100000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshard||usr.largeshard||usr.massshard)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.greatshard)
					usr << "<font color = red>You are not ready to use the Great EXP Shard yet!(<font color = white> [(usr.gcooldowne) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Great EXP Shard (+100% Exp)</I> for 3 Hours."
				usr.greatshard = 1
				usr.gcooldowne = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_exp2()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	GSTT_Shard
		name = "Great Stat Shard"
		icon = 'Shards.dmi'
		icon_state = "LStat"
		density = 0

		value = 100000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshards||usr.largeshards||usr.massshards)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.greatshards)
					usr << "<font color = red>You are not ready to use the Great Stat Shard yet!(<font color = white> [(usr.gcooldowns) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Great Stat Shard (+100% Stats)</I> for 3 Hours."
				usr.greatshards = 1
				usr.gcooldowns = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_stat2()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	GZ_Shard
		name = "Great Zenni Shard"
		icon = 'Shards.dmi'
		icon_state = "LZenni"
		density = 0

		value = 100000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshardz||usr.largeshardz||usr.massshardz)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.greatshardz)
					usr << "<font color = red>You are not ready to use the Great Zenni Shard yet!(<font color = white> [(usr.gcooldownz) / 600] <font color = red>Minutes remain)"
					return
				usr << "<font color = red>You have activated your <I>Great Zenni Shard (+100% Zenni)</I> for 3 Hours."
				usr.greatshardz = 1
				usr.gcooldownz = 108000
				src.uses -= 1
				if(src.uses < 1)
					usr << "Your shard falls to peices."
					usr.inven_min -= 1
					del(src)
				spawn(600)usr.Buff_Cooldown_zen2()
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

///// Massive Shards

obj/Equipment/Buff_Items

	MPL_Shard
		name = "Massive Powerlevel Shard"
		icon = 'Shards.dmi'
		icon_state = "MPL"
		density = 0

		value = 2000000
		equiped = 0

		Click()
			if(src in usr:contents)
				//usr << "<font color = red>You have activated your <I>Massive PL Shard (+50% Maximum PowerLevel)</I>"
			//	usr.powerlevel_max *= 1.5

				var gain = round(usr.powerlevel_max*0.01)
				if(gain > 200000)
					gain = 200000
				usr << "<font color = red>You have activated your <I>[src.name] (Powerlevel + [applycommas(gain)])</I>"
				usr.powerlevel_max += gain
/*
				var gain = 200000
				if(usr.level<20000000)
					usr << "<font color = red>You have activated your <I>[src.name] (Powerlevel + 1,000,000,000)</I>"
					usr.powerlevel_max += 20000000000
				else
					usr << "<font color = red>You have activated your <I>[src.name] (Powerlevel + 10,000,000,000)</I>"
					usr.powerlevel_max += gain
					usr.powerlevel_max += gain
					usr.powerlevel_max += gain
					usr.powerlevel_max += gain
					usr.powerlevel_max += gain
					*/
				usr.inven_min -= 1
				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MKI_Shard
		name = "Massive Ki Shard"
		icon = 'Shards.dmi'
		icon_state = "MKi"
		density = 0

		value = 2000000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Massive Ki Shard (+40% Maximum Ki)</I>"
				//usr.ki_max *= 1.4
				var gain = 50
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Bonus + [applycommas(gain)])</I>"
				usr.ki_bonus += gain

				/*
				var gain = 200000
				if(usr.level<2000000)
					usr << "<font color = red>You have activated your <I>[src.name] (Ki + 1,000,000,000)</I>"
					usr.ki_max += 2000000000
				else

					usr << "<font color = red>You have activated your <I>[src.name] (Ki + 10,000,000,000)</I>"
					usr.ki_max += gain
					usr.ki_max += gain
					usr.ki_max += gain
					usr.ki_max += gain
					usr.ki_max += gain
					*/
				usr.inven_min -= 1

				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MKIDEF_Shard
		name = "Massive Ki Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "MKiDef"
		density = 0

		value = 2000000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Massive Ki Defence Shard (+40% Maximum Ki Defence)</I>"
				//usr.kidefense_max *= 1.4
			/*
				var gain = 50000
				if(usr.level<5000000)
					usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense + 1,000,000,000)</I>"
					usr.kidefense_max += 5000000000
				else
					usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense + 10,000,000,000)</I>"
					usr.kidefense_max += gain
					usr.kidefense_max += gain
					usr.kidefense_max += gain
					usr.kidefense_max += gain
					usr.kidefense_max += gain
					*/
				var gain = round(usr.kidefense_max*0.01)
				if(gain > 200000)
					gain = 200000
				usr << "<font color = red>You have activated your <I>[src.name] (Ki Defense + [applycommas(gain)])</I>"
				usr.kidefense_max += gain
				usr.inven_min -= 1

				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MSTR_Shard
		name = "Massive Strength Shard"
		icon = 'Shards.dmi'
		icon_state = "MStr"
		density = 0

		value = 2000000
		equiped = 0

		Click()
			if(src in usr:contents)

				//usr << "<font color = red>You have activated your <I>Massive Strength Shard (+40% Maximum Strength)</I>"
				//usr.strength_max *= 1.4
			/*
				var gain = 50000
				if(usr.level<5000000)
					usr << "<font color = red>You have activated your <I>[src.name] (Strength + 1,000,000,000)</I>"
					usr.strength_max += 5000000000
				else
					usr << "<font color = red>You have activated your <I>[src.name] (Strength + 10,000,000,000)</I>"
					usr.strength_max += gain
					usr.strength_max += gain
					usr.strength_max += gain
					usr.strength_max += gain
					usr.strength_max += gain
					*/
				var gain = 50
				usr << "<font color = red>You have activated your <I>[src.name] (Strength Bonus + [applycommas(gain)])</I>"
				usr.strength_bonus += gain
				usr.inven_min -= 1
				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MDEF_Shard
		name = "Massive Defence Shard"
		icon = 'Shards.dmi'
		icon_state = "MDef"
		density = 0

		value = 2000000
		equiped = 0

		Click()
			if(src in usr:contents)

			//	usr << "<font color = red>You have activated your <I>Massive Defence Shard (+40% Maximum Defence)</I>"
			//	usr.defence_max *= 1.4
				/*
				var gain = 50000
				if(usr.level<5000000)
					usr << "<font color = red>You have activated your <I>[src.name] (Defense + 1,000,000,000)</I>"
					usr.defence_max += 5000000000
				else
					usr << "<font color = red>You have activated your <I>[src.name] (Defense + 10,000,000,000)</I>"
					usr.defence_max += gain
					usr.defence_max += gain
					usr.defence_max += gain
					usr.defence_max += gain
					usr.defence_max += gain
					*/
				var gain = 50
				usr << "<font color = red>You have activated your <I>[src.name] (Defense Bonus + [applycommas(gain)])</I>"
				usr.defence_bonus += gain
				usr.inven_min -= 1
				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MSPD_Shard
		name = "Massive Speed Shard"
		icon = 'Shards.dmi'
		icon_state = "MSpd"
		density = 0

		value = 50000
		equiped = 0

		Click()
			if(src in usr:contents)

				usr << "<font color = red>You have activated your <I>Massive Speed Shard (+40% Maximum Speed)</I>"
				usr.defence_max *= 1.4
				usr.shards_used ++
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	MEXP_Shard
		name = "Massive EXP Shard"
		icon = 'Shards.dmi'
		icon_state = "MExp"
		density = 0

		value = 1000000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshard||usr.largeshard||usr.greatshard)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshard && usr.massshardp)
					usr << "<font color = red>You have already used a permashard."
					return
				if(usr.massshard && !usr.massshardp)
					usr << "<font color = red>You are not ready to use the Massive EXP Shard yet!(<font color = white> [(usr.mcooldowne) / 600] <font color = red>Minutes remain)"
					return
				else
					usr << "<font color = red>You have activated your <I>Massive EXP Shard (+200% Exp)</I> for 3 Hours."
					usr.massshard = 1
					usr.mcooldowne = 108000
					src.uses -= 1
					if(src.uses < 1)
						usr << "Your shard falls to peices."
						usr.inven_min -= 1
						del(src)
					spawn(600)usr.Buff_Cooldown_exp3()
					return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	MSTT_Shard
		name = "Massive Stat Shard"
		icon = 'Shards.dmi'
		icon_state = "MStat"
		density = 0

		value = 1000000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshards||usr.largeshards||usr.greatshards)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshards && usr.massshardsp)
					usr << "<font color = red>You have already used a permashard."
					return
				if(usr.massshards && !usr.massshardsp)
					usr << "<font color = red>You are not ready to use the Massive Stat Shard yet!(<font color = white> [(usr.mcooldowns) / 600] <font color = red>Minutes remain)"
					return
				else
					usr << "<font color = red>You have activated your <I>Massive Stat Shard (+200% Stats)</I> for 3 Hours."
					usr.massshards = 1
					usr.mcooldowns = 108000
					src.uses -= 1
					if(src.uses < 1)
						usr << "Your shard falls to peices."
						usr.inven_min -= 1
						del(src)
					spawn(600)usr.Buff_Cooldown_stat3()
					return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	MZ_Shard
		name = "Massive Zenni Shard"
		icon = 'Shards.dmi'
		icon_state = "MZenni"
		density = 0

		value = 1000000000
		equiped = 0
		uses = 20

		Click()
			if(src in usr:contents)
				if(usr.smallshardz||usr.largeshardz||usr.greatshardz)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshardz && usr.massshardzp)
					usr << "<font color = red>You have already used a permashard."
					return
				if(usr.massshardz && !usr.massshardzp)
					usr << "<font color = red>You are not ready to use the Massive Zenni Shard yet!(<font color = white> [(usr.mcooldownz) / 600] <font color = red>Minutes remain)"
					return
				else
					usr << "<font color = red>You have activated your <I>Massive Zenni Shard (+200% Zenni)</I> for 3 Hours."
					usr.massshardz = 1
					usr.mcooldownz = 108000
					src.uses -= 1
					if(src.uses < 1)
						usr << "Your shard falls to peices."
						usr.inven_min -= 1
						del(src)
					spawn(600)usr.Buff_Cooldown_zen3()
					return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

			Examine()
				set category = null
				usr << "[src.name]"
				usr << "Charges: [src.uses]"

	PMEXP_Shard
		name = "Permanent Massive EXP Shard"
		icon = 'Shards.dmi'
		icon_state = "MExp"
		density = 0

		value = 10000000000
		equiped = 0

		Click()
			if(src in usr:contents)
				if(usr.massshard)
					usr << "<font color = red>You must wait until your current shard has expired to use this!</font>"
					return
				if(usr.smallshard||usr.largeshard||usr.greatshard||usr.massshard)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshard && usr.massshardp)
					usr << "<font color = red>You have already used a permashard."
					return
				usr << "<font color = red>You have activated your <I>PERMANENT Massive EXP Shard (+200% Exp)</I> forever."
				usr.massshard = 1
				usr.massshardp = 1
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	PMSTT_Shard
		name = "Permanent Massive Stat Shard"
		icon = 'Shards.dmi'
		icon_state = "MStat"
		density = 0

		value = 10000000000
		equiped = 0

		Click()
			if(src in usr:contents)
				if(usr.smallshards||usr.largeshards||usr.greatshards||usr.massshards)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshards && usr.massshardsp)
					usr << "<font color = red>You have already used a permashard."
					return
				usr << "<font color = red>You have activated your <I>PERMANENT Massive Stat Shard (+200% Stats)</I> forever."
				usr.massshards = 1
				usr.massshardsp = 1
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	PMZ_Shard
		name = "Permanent Massive Zenni Shard"
		icon = 'Shards.dmi'
		icon_state = "MZenni"
		density = 0

		value = 10000000000
		equiped = 0

		Click()
			if(src in usr:contents)
				if(usr.smallshardz||usr.largeshardz||usr.greatshardz||usr.massshardz)
					usr << "<font color = red>You can only use one shard at a time!</font>"
					return
				if(usr.massshardz && usr.massshardzp)
					usr << "<font color = red>You have already used a permashard."
					return
				usr << "<font color = red>You have activated your <I>PERMANENT Massive Zenni Shard (+200% Zenni)</I> forever."
				usr.massshardz = 1
				usr.massshardzp = 1
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."

	ZP_Shard
		name = "ZP Shard"
		icon = 'Shards.dmi'
		icon_state = "ZPshard"
		density = 0

		value = 100000
		equiped = 0

		Click()
			if(src in usr:contents)
				//usr << "<font color = red>You have activated your <I>Mini Strength Shard (+2% Maximum Strength)</I>"
				//usr.strength_max *= 1.02

				var gain = rand(1,5)

				usr << "<font color = red>You have activated your <I>[src.name] (ZP + [applycommas(gain)])</I>"
				usr.zp += gain
				//usr.zpu++
				usr.shards_used ++
				usr.inven_min -= 1
				del(src)
				return

		verb

			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.CheckInventory()==TRUE)return
				if(Move(usr))
					usr << "You have picked up the: <u>[src]</u>."
					usr.inven_min += 1
					if(usr.autouseshard)
						src.Click()
				else
					usr << "You are unable to pick up the: <u>[src]</u>."

			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr << "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr << "You are unable to drop: <u>[src.name]</u>, it's already equipped."