mob
	var
		shard1 = "Exp"
		shard2 = "Stat"
		shard3 = "Zenni"
		shard_cd_1 = "0"
		shard_cd_2 = "0"
		shard_cd_3 = "0"
mob
	proc
		Buff_Cooldown_exp()
			set background = 1
			if(!src)return
			if(src.scooldowne == 36000)
				src<<"<big>You have 1 Hour left on your Small Exp shard"
			if(src.scooldowne == 6000)
				src<<"<big>You have 10 Minutes left on your Small Exp shard"
			if(src.scooldowne > 0)
				src.scooldowne -= 600
			if(src.scooldowne <= 0)
				src.scooldowne = 0
				if(src.smallshard)
					src.smallshard = 0
					src << "<big>Your Small Exp shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_exp()

		Buff_Cooldown_Stat()
			set background = 1
			if(!src)return
			if(src.scooldowns == 36000)
				src<<"<big>You have 1 Hour left on your Small Stat shard"
			if(src.scooldowns == 6000)
				src<<"<big>You have 10 Minutes left on your Small Stat shard"
			if(src.scooldowns > 0)
				src.scooldowns -= 600
			if(src.scooldowns <= 0)
				src.scooldowns = 0
				if(src.smallshards)
					src.smallshards = 0
					src << "<big>Your Small Stat shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_Stat()

		Buff_Cooldown_zen()
			set background = 1
			if(!src)return
			if(src.scooldownz == 36000)
				src<<"<big>You have 1 Hour left on your Small Zenni shard"
			if(src.scooldownz == 6000)
				src<<"<big>You have 10 Minutes left on your Small Zenni shard"
			if(src.scooldownz > 0)
				src.scooldownz -= 600
			if(src.scooldownz <= 0)
				src.scooldownz = 0
				if(src.smallshardz)
					src.smallshardz = 0
					src << "<big>Your Small Zenni shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_zen()

		Buff_Cooldown_exp1()
			set background = 1
			if(!src)return
			if(src.lcooldowne == 36000)
				src<<"<big>You have 1 Hour left on your Large Exp shard"
			if(src.lcooldowne == 6000)
				src<<"<big>You have 10 Minutes left on your Large Exp shard"
			if(src.lcooldowne > 0)
				src.lcooldowne -= 600
			if(src.lcooldowne <= 0)
				src.lcooldowne = 0
				if(src.largeshard)
					src.largeshard = 0
					src << "<big>Your Large Exp shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_exp1()

		Buff_Cooldown_stat1()
			set background = 1
			if(!src)return
			if(src.lcooldowns == 36000)
				src<<"<big>You have 1 Hour left on your Large Stat shard"
			if(src.lcooldowns == 6000)
				src<<"<big>You have 10 Minutes left on your Large Stat shard"
			if(src.lcooldowns > 0)
				src.lcooldowns -= 600
			if(src.lcooldowns <= 0)
				src.lcooldowns = 0
				if(src.largeshards)
					src.largeshards = 0
					src << "<big>Your Large Stat shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_stat1()

		Buff_Cooldown_zen1()
			set background = 1
			if(!src)return
			if(src.lcooldownz == 36000)
				src<<"<big>You have 1 Hour left on your Large Zenni shard"
			if(src.lcooldownz == 6000)
				src<<"<big>You have 10 Minutes left on your Large Zenni shard"
			if(src.lcooldownz > 0)
				src.lcooldownz -= 600
			if(src.lcooldownz <= 0)
				src.lcooldownz = 0
				if(src.largeshardz)
					src.largeshardz = 0
					src << "<big>Your Large Zenni shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_zen1()

		Buff_Cooldown_exp2()
			set background = 1
			if(!src)return
			if(src.gcooldowne == 36000)
				src<<"<big>You have 1 Hour left on your Great Exp shard"
			if(src.gcooldowne == 6000)
				src<<"<big>You have 10 Minutes left on your Great Exp shard"
			if(src.gcooldowne > 0)
				src.gcooldowne -= 600
			if(src.gcooldowne <= 0)
				src.gcooldowne = 0
				if(src.greatshard)
					src.greatshard = 0
					src << "<big>Your Great Exp shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_exp2()

		Buff_Cooldown_stat2()
			set background = 1
			if(!src)return
			if(src.gcooldowns == 36000)
				src<<"<big>You have 1 Hour left on your Great Stat shard"
			if(src.gcooldowns == 6000)
				src<<"<big>You have 10 Minutes left on your Great Stat shard"
			if(src.gcooldowns > 0)
				src.gcooldowns -= 600
			if(src.gcooldowns <= 0)
				src.gcooldowns = 0
				if(src.greatshards)
					src.greatshards = 0
					src << "<big>Your Great Stat shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_stat2()

		Buff_Cooldown_zen2()
			set background = 1
			if(!src)return
			if(src.gcooldownz == 36000)
				src<<"<big>You have 1 Hour left on your Massive Zenni shard"
			if(src.gcooldownz == 6000)
				src<<"<big>You have 10 Minutes left on your Massive Zenni shard"
			if(src.gcooldownz > 0)
				src.gcooldownz -= 600
			if(src.gcooldownz <= 0)
				src.gcooldownz = 0
				if(src.greatshardz)
					src.greatshardz = 0
					src << "<big>Your Massive Zenni shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_zen2()

		Buff_Cooldown_exp3()
			set background = 1
			if(!src)return
			if(src.mcooldowne == 36000)
				src<<"<big>You have 1 Hour left on your Massive Exp shard"
			if(src.mcooldowne == 6000)
				src<<"<big>You have 10 Minutes left on your Massive Exp shard"
			if(src.mcooldowne > 0)
				src.mcooldowne -= 600
			if(src.mcooldowne <= 0)
				src.mcooldowne = 0
				if(src.massshard)
					src.massshard = 0
					src << "<big>Your Massive Exp shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_exp3()

		Buff_Cooldown_stat3()
			set background = 1
			if(!src)return
			if(src.mcooldowns == 36000)
				src<<"<big>You have 1 Hour left on your Massive Stat shard"
			if(src.mcooldowns == 6000)
				src<<"<big>You have 10 Minutes left on your Massive Stat shard"
			if(src.mcooldowns > 0)
				src.mcooldowns -= 600
			if(src.mcooldowns <= 0)
				src.mcooldowns = 0
				if(src.massshards)
					src.massshards = 0
					src << "<big>Your Massive Stat shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_stat3()

		Buff_Cooldown_zen3()
			set background = 1
			if(!src)return
			if(src.mcooldownz == 36000)
				src<<"<big>You have 1 Hour left on your Massive Zenni shard"
			if(src.mcooldownz == 6000)
				src<<"<big>You have 10 Minutes left on your Massive Zenni shard"
			if(src.mcooldownz > 0)
				src.mcooldownz -= 600
			if(src.mcooldownz <= 0)
				src.mcooldownz = 0
				if(src.massshardz)
					src.massshardz = 0
					src << "<big>Your Massive Zenni shard has worn off!"
					return
			spawn(600)src.Buff_Cooldown_zen3()

		Shard_Display_Updater()
			set background = 1
			src << output(null, "default.output3")
			sleep(2)
			src<<output({"<br><center><font color = #66ffff>You have [src.shard_cd_1] minutes remaining on your [src.shard1] shard</font><br>
			<font color = #66ff66>You have [src.shard_cd_2] minutes remaining on your [src.shard2] shard</font><br>
			<font color =#ffff00>You have [src.shard_cd_3] minutes remaining on your [src.shard3] shard</font><br></center>"},"default.output3")
			spawn(600)src.Shard_Display_Updater()
			return