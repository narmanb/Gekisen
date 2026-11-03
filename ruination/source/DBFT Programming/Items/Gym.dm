obj/Gym
	GWeight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=50000000
		invenable=1
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					var/xp = 100
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 50
					var/str_gain = rand(usr.level/2,usr.level)+rand(1,5)+usr.strength_bonus
					if(usr.smallshards)str_gain*=1.25
					if(usr.largeshards)str_gain*=1.5
					if(usr.greatshards)str_gain*=2
					if(usr.massshards)str_gain*=3
					if(prob(50))usr.strength_max += str_gain
					if(prob(10))
						usr << output("\white You feel your Muscles bulge slightly...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					usr.frozen = 0
					usr.Level_Up()
	GTreadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		value=50000000
		invenable=1
		var
			run = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Run_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.run)
					return
				if(usr.hiting)
					return
				else
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					var/xp = 100
					if(usr.smallshard)xp*=1.5
					if(usr.largeshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 15
					usr.staminaleft_exp += round(rand(10,25) + (usr.level/100))
					var/spd_gain = rand(usr.level/2,usr.level)+rand(1,5)+usr.speed_bonus
					if(usr.smallshards)spd_gain*=1.25
					if(usr.largeshards)spd_gain*=1.5
					if(usr.greatshards)spd_gain*=2
					if(usr.massshards)spd_gain*=3
					if(prob(50))usr.speed_max += spd_gain
					usr.Level_Up()
					//usr.Fatigue_Level_Up()
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
	GTraining_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		value=50000000
		invenable=1
		var
			hit = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					if(prob(50))
						usr.melee_exp += 2 + round(usr.level/5000)
						usr.Melee_Level()
					else
						usr.crit_exp += 1 + round(usr.level/7500)
						usr.Critical_Level()
					var/xp = 100
					if(usr.smallshard)xp*=1.5
					if(usr.largeshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
				//	usr<<"<font color = blue>Unarmed Skill has increased to [usr.melee]</font>"
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(25)usr.hiting=0
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr << "You don't have enough ki!"
					return
				if(usr.staminaleft >= usr.staminaleft_max)
					usr << "You are too tired."
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					if(prob(33))
						usr.ki_use_exp += 5 + round(usr.level/5000)
						usr.Ki_Use_Level()
					else
						if(prob(33))
							usr.ki_pow_exp += 3 + round(usr.level/7500)
							usr.Ki_Power_Level()
						else
							if(prob(34))
								usr.ki_con_exp += 2 + round(usr.level/10000)
								usr.Ki_Con_Level()
					var/xp = 100
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
					usr.ki -= rand(20000,50000)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(25)usr.hiting=0
					if(usr.staminaleft>=usr.staminaleft_max)
						usr.staminaleft=usr.staminaleft_max
	GMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=50000000
		invenable=1
		var
			punch = 0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					var/xp = 100
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.staminaleft+=10
					usr.Level_Up()
					usr.frozen = 0
					var/def_gain = rand(usr.level/2,usr.level)+rand(1,5)+usr.defence_bonus
					if(usr.smallshards)def_gain*=1.25
					if(usr.largeshards)def_gain*=1.5
					if(usr.greatshards)def_gain*=2
					if(usr.massshards)def_gain*=3
					if(prob(50))usr.defence_max += def_gain
					if(prob(20))
						usr.durability_exp += 5 + round(usr.level/6000)
						usr.Durability_Level()
					else
						if(prob(20))
							usr.block_exp += 5 + round(usr.level/6000)
							usr.Block_Level()
						else
							if(prob(20))
								usr.dodge_exp += 5 + round(usr.level/8000)
								usr.Dodge_Level()
							else
								if(prob(20))
									usr.count_exp += 5 + round(usr.level/9000)
									usr.Counter_Level()
								else
									usr.crit_exp += 5 + round(usr.level/10000)
									usr.Critical_Level()
					if(prob(10))
						usr << output("\white The machine counters your attack and your defence rises...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	GKiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Ki Machine"
		density = 1
		invenable=1
		value=50000000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				if(src.shots<50)
					spawn(20)src.ShootBlast()
				else
					src.shooting=0
		verb
			Pick_Up()
				set category=null
				set src in oview(1)
				if(usr.CheckInventory()==TRUE)return
				if(!src in oview(1))return
				if(!src.x)return
				usr<<"You picked up the [src.name]."
				src.loc=usr
				GuildCustom.Remove(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr << output("This machine is already turned on.")
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.ki<100000)
					usr << output("You don't have enough ki!")
					return
				if(usr.ki>=5000&&usr.staminaleft<=usr.staminaleft_max-5)
					usr.ki-=100000
					if(!usr.staminabuff)usr.staminaleft+=10
					usr.doing=1
					spawn(3)
						usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							var/boost1=(2*usr.level+rand(50,80))+usr.ki_bonus
							var/boost2=(2*usr.level+rand(50,80))+usr.kidefense_bonus
							if(usr.smallshards)boost1*=1.25
							if(usr.largeshards)boost1*=1.5
							if(usr.greatshards)boost1*=2
							if(usr.massshards)boost1*=3
							if(usr.smallshards)boost2*=1.25
							if(usr.largeshards)boost2*=1.5
							if(usr.greatshards)boost2*=2
							if(usr.massshards)boost2*=3
							if(prob(50))usr.kidefense_max+=boost2
							if(prob(50))usr.ki_max+=boost1*0.5
							if(prob(50))
								usr.ki_res_exp += round(5+(usr.level/5000))
								usr.Ki_Res_Level()
							else
								usr.reflect_exp += round(5+(usr.level/7500))
								usr.Reflect_Level()
							var/xp = 100
							if(usr.smallshard)xp*=1.25
							if(usr.largeshard)xp*=1.5
							if(usr.greatshard)xp*=2
							if(usr.massshard)xp*=3
							if(usr.expbuff)xp *= 2
							usr.exp += xp
							usr.Level_Up()
	AdvancedWeight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "heavy weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "heavy weight-lift"
					usr.icon_state = "Lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "heavy weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"

					var/xp = 1500
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
					usr.Level_Up()
					usr.frozen = 0
					var/str_gain = usr.level+rand(5000,10000)+usr.strength_bonus
					if(usr.smallshards)str_gain*=1.25
					if(usr.largeshards)str_gain*=1.5
					if(usr.greatshards)str_gain*=2
					if(usr.massshards)str_gain*=3
					if(prob(50))usr.strength_max += str_gain
					if(prob(50))
						usr << output("\white You feel your Muscles bulge slightly...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max

	AdvancedMachine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					var/xp = 1500
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					usr.Level_Up()
					usr.frozen = 0
					var/def_gain = usr.level+rand(5000,10000)+usr.defence_bonus
					if(usr.smallshards)def_gain*=1.25
					if(usr.largeshards)def_gain*=1.5
					if(usr.greatshards)def_gain*=2
					if(usr.massshards)def_gain*=3
					if(prob(50))usr.defence_max += def_gain
					if(prob(20))
						usr.durability_exp += 5 + round(usr.level/2000)
						usr.Durability_Level()
					else
						if(prob(20))
							usr.block_exp += 5 + round(usr.level/2000)
							usr.Block_Level()
						else
							if(prob(20))
								usr.dodge_exp += 5 + round(usr.level/3000)
								usr.Dodge_Level()
							else
								if(prob(20))
									usr.count_exp += 5 + round(usr.level/4000)
									usr.Counter_Level()
								else
									usr.crit_exp += 5 + round(usr.level/5000)
									usr.Critical_Level()
					if(prob(50))
						usr << output("\white The machine counters your attack and your defence rises...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Weight
		icon = 'Gym.dmi'
		name="Weight"
		icon_state = "weight"
		value=500000
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			LiftIt()
				set category = "Training"
				set name="Lift"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.lift)
					return
				if(usr.hiting)
					return
				else
					src.lift = 1
					if(!usr)return
					usr.frozen = 1
					usr.doing = 1
					usr.hiting = 1
					src.icon_state = "weight-lift"
					usr.icon_state = "lift"
					sleep(22)
					spawn(5)
						src.lift = 0
					src.icon_state = "weight"
					if(!usr)return
					usr.icon_state = ""
					usr.doing = 0
					usr.hiting = 0
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Weight Lift)"
					var/xp = 1000
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
					usr.Level_Up()
					usr.frozen = 0
					var/str_gain = usr.level+rand(1,5)+usr.strength_bonus
					if(usr.smallshards)str_gain*=1.25
					if(usr.largeshards)str_gain*=1.5
					if(usr.greatshards)str_gain*=2
					if(usr.massshards)str_gain*=3
					if(prob(50))usr.strength_max += str_gain
					if(prob(50))
						usr << output("\white You feel your Muscles bulge slightly...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Treadmill
		icon = 'Gym.dmi'
		name="Treadmill"
		icon_state = "treadmill"
		value=550000
		var
			run = 0
		verb
			Run_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.staminaleft >= usr.staminaleft_max)
					usr << output("You are too tired.","output2")
					return
				if(usr.doing)
					return
				if(src.run)
					return
				if(usr.hiting)
					return
				else
					src.dir=EAST
					src.run = 1
					src.icon_state = "treadmill on"
					usr.doing = 1
					usr.hiting = 1
					var/xp = 100
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 15
					usr.staminaleft_exp += round(rand(10,25) + (usr.level/100))
					var/spd_gain = rand(usr.level/2,usr.level)+rand(1,5)+usr.speed_bonus
					if(usr.smallshards)spd_gain*=1.25
					if(usr.largeshards)spd_gain*=1.5
					if(usr.greatshards)spd_gain*=2
					if(usr.massshards)spd_gain*=3
					if(prob(50))usr.speed_max += spd_gain
					usr.Level_Up()
					//usr.Fatigue_Level_Up()
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
					usr.dir = EAST
					if(!usr)return
					usr.icon_state = "run"
					usr.frozen = 1
					sleep(35)
					src.icon_state = "treadmill"
					src.run = 0
					if(!usr)return
					usr.icon_state = ""
					usr.frozen = 0
					usr.doing = 0
					usr.hiting = 0
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "dummy"
		name="Dummy"
		density = 1
		value=250000
		var
			hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					if(prob(50))
						usr.melee_exp += 5 + round(usr.level/5000)
						usr.Melee_Level()
					else
						usr.crit_exp += 5 + round(usr.level/7500)
						usr.Critical_Level()
					var/xp = 1000
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
			//		usr << output("<font color = blue>Unarmed Skill has increased to [usr.melee]</font>")
					flick("attack",usr)
					spawn(1)usr.Level_Up()
					spawn(25)usr.hiting=0
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(4)
				if(usr.ki <= 0)
					usr << "You don't have enough ki!"
					return
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.hiting)
					return
				else
					usr.hiting = 1
					if(prob(33))
						usr.ki_use_exp += 3.3 + round(usr.level/5000)
						usr.Ki_Use_Level()
					else
						if(prob(33))
							usr.ki_pow_exp += 3.3 + round(usr.level/7500)
							usr.Ki_Power_Level()
						else
							usr.ki_con_exp += 3.4 + round(usr.level/10000)
							usr.Ki_Con_Level()
					var/xp = 100
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(!usr.staminabuff)usr.staminaleft += 10
					usr.ki -= rand(20,50)+usr.level*10
					if(usr.ki<0)
						usr.ki=0
			//		usr << output("<font color = blue>Ki Skill has increased to [usr.ki_skill]</font>")
					missile('Ki Blast.dmi',usr,src)
					spawn(1)usr.Level_Up()
					spawn(25)usr.hiting=0
					if(usr.staminaleft>=usr.staminaleft_max)
						usr.staminaleft=usr.staminaleft_max
	Machine
		icon = 'Gym.dmi'
		icon_state = "machine"
		name="Machine"
		layer = MOB_LAYER + 5
		density = 1
		value=500000
		var
			punch = 0
		verb
			PunchIt()
				set category = "Training"
				set name="Punch Machine"
				set src in oview(1)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(src.punch)
					return
				if(usr.hiting)
					return
				if(usr.dir!=EAST)
					return
				else
					src.punch = 1
					if(!usr)return
					usr.frozen = 1
					usr.hiting = 1
					usr.doing = 1
					src.icon_state = "machine-hit"
					usr.icon_state = "attack"
					sleep(22)
					spawn(5)
						src.punch = 0
					src.icon_state = "machine"
					if(!usr)return
					if(!src in get_step(usr,usr.dir))return
					usr.icon_state = ""
					usr.hiting = 0
					usr.doing = 0
					var/xp = 1000
					if(usr.smallshard)xp*=1.25
					if(usr.largeshard)xp*=1.5
					if(usr.greatshard)xp*=2
					if(usr.massshard)xp*=3
					if(usr.expbuff)xp *= 2
					usr.exp += xp
					if(usr.undercheck)
						var/mob/GMC=usr.checker
						GMC<<"<font size=+1><font color=white>[src] training gain delay: <font color=red>[world.time/10]</font> - (Machine Punch)"
					if(!usr.staminabuff)usr.staminaleft+=10
					usr.Level_Up()
					usr.frozen = 0
					var/def_gain = usr.level+rand(1,5)+usr.defence_bonus
					if(usr.smallshards)def_gain*=1.25
					if(usr.largeshards)def_gain*=1.5
					if(usr.greatshards)def_gain*=2
					if(usr.massshards)def_gain*=3
					if(prob(50))usr.defence_max += def_gain
					if(prob(20))
						usr.durability_exp += 5 + round(usr.level/5000)
						usr.Durability_Level()
					else
						if(prob(20))
							usr.block_exp += 5 + round(usr.level/5000)
							usr.Block_Level()
						else
							if(prob(20))
								usr.dodge_exp += 5 + round(usr.level/6000)
								usr.Dodge_Level()
							else
								if(prob(20))
									usr.count_exp += 5 + round(usr.level/7000)
									usr.Counter_Level()
								else
									usr.crit_exp += 5 + round(usr.level/8000)
									usr.Critical_Level()
					if(prob(10))
						usr << output("\white The machine counters your attack and your defence rises...","output2")
					if(usr.staminaleft >= usr.staminaleft_max)
						usr.staminaleft = usr.staminaleft_max
	Computer
		icon = 'Generator.dmi'
		density = 1
		verb
			Start_Simulation()
				set category = "Training"
				set src in oview(1)
				if(usr.waiting)
					usr << "There is a 15 second delay."
					return
				usr.waiting = 1
				switch(alert("What do you wish to do?","","Clone Fighter","Simulator Fighter","Cancel"))
					if("Cancel")
						usr.waiting=0
						return
					if("Simulator Fighter")
						var/npc_level = input("What Level do you wish to make the Simulation Fighter?")as num
						if(npc_level > usr.level*1.5)
							usr << "\red Level cannot be higher than [round(usr.level*1.5)]."
							usr.waiting = 0
							return
						if(npc_level <= 0)
							usr.waiting = 0
							return
						var/mob/Monster/Simulator_NPC/N = new
						var/pl=(npc_level*npc_level)+rand(50,80)
						var/str=npc_level*(npc_level*50)+rand(50,80)
						var/sp=5-(npc_level/900)
						N.level = npc_level
						N.powerlevel = pl
						N.powerlevel_max = pl
						N.ki = pl*0.95
						N.ki_max = pl*0.95
						N.kidefense=pl*0.7
						N.kidefense_max=pl*0.7
						N.strength = str
						N.strength_max = str
						N.defence = str
						N.defence_max = str
						N.exp = npc_level*0.2
						N.zenni = (npc_level*7)+500
						N.speed = sp
						var/race = rand(1,6)
						var/skin = rand(1,3)
						var/hair = rand(1,6)
						if(race == 1)
							N.icon = 'Bebi - Form 1.dmi'
						if(race == 2)
							N.icon = 'Bio Android - Form 1.dmi'
						if(race == 3)
							N.icon = 'Changling - Form 1.dmi'
						if(race == 4)
							N.icon = 'Namek - Normal.dmi'
						if(race == 5)
							N.icon = 'Buu Evil.dmi'
						if(race == 6)
							if(skin == 1)
								N.icon = 'Male - White.dmi'
							if(skin == 2)
								N.icon = 'Male - Tan.dmi'
							if(skin == 2)
								N.icon = 'Male - Dark.dmi'
							if(hair == 1)
								N.hair_icon='Hair - Goku.dmi'
								N.overlays += N.hair_icon
								N.hair="Goku"
							if(hair == 2)
								N.hair_icon='Hair - Vegeta.dmi'
								N.overlays += N.hair_icon
								N.hair="Vegeta"
							if(hair == 3)
								N.hair_icon='Hair - Teen Gohan.dmi'
								N.hair="Teen Gohan"
								N.overlays += N.hair_icon
							if(hair == 4)
								N.hair_icon='Hair - Adult Gohan.dmi'
								N.hair="Adult Gohan"
								N.overlays += N.hair_icon
							if(hair == 5)
								N.hair_icon='Hair - Future Gohan.dmi'
								N.hair="Future Gohan"
								N.overlays += N.hair_icon
							if(hair == 6)
								N.hair_icon='Hair - Trunks Long.dmi'
								N.hair="Trunks Long"
								N.overlays += N.hair_icon
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)
							if(!usr)return
							usr.waiting = 0
					if("Clone Fighter")
						var/mob/Monster/Simulator_NPC/N = new
						N.level = usr.level
						N.powerlevel = usr.powerlevel
						N.powerlevel_max = usr.powerlevel_max
						N.ki = usr.ki
						N.ki_max = usr.ki_max
						N.kidefense=usr.kidefense
						N.kidefense_max=usr.kidefense_max
						N.strength = usr.strength
						N.strength_max = usr.strength_max
						N.defence = usr.defence
						N.defence_max = usr.defence_max
						N.exp = N.level*0.2
						N.zenni = (usr.level*7)+500
						N.speed = usr.speed_max
						N.loc = locate(usr.x,usr.y-1,usr.z)
						spawn(150)
							if(!usr)return
							usr.waiting = 0
	KiDeflectMachine
		icon = 'Gym.dmi'
		icon_state = "kimachine"
		name="Ki Machine"
		density = 1
		value=600000
		var
			shots=0
			shooting=0
		proc
			ShootBlast()
				src.shots+=1
				var/obj/KiTrainingBlast/A=new
				A.loc=locate(src.x+1,src.y,src.z)
				A.owner=src
				A.power=0
				A.dir=EAST
				if(src.shots<50)
					spawn(20)src.ShootBlast()
				else
					src.shooting=0
		verb
			Place()
				set category=null
				set src in usr.contents
				if(usr.spam_delay)
					return
				usr.spam_delay=1
				var/turf/T=usr.loc
				if(usr.z!=5)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
				for(var/obj/Gym/G in T)
					usr<<"You cannot place that here."
					usr.spam_delay=0
					return
//				for(var/obj/Gravity_Room/Gravity/G in oview(8,usr))
//					usr<<"You cannot place that here."
//					usr.spam_delay=0
//					return
				usr<<"You placed the [src.name]."
				src.loc=usr.loc
				src.lastx=src.x
				src.lasty=src.y
				src.lastz=src.z
				GuildCustom.Add(src)
				var/savefile/S=new("world save files/GuildHouse.sav")
				S["GuildCustom"]<<GuildCustom
				spawn(30)usr.spam_delay=0
			Start_Ki_Training()
				set category = null
				set src in oview(8)
				if(src.shooting)
					usr << output("This machine is already turned on.")
					return
				src.shots=0
				src.shooting=1
				src.ShootBlast()
			Deflect()
				set category = "Training"
				set src in oview(8)
				if(usr.staminaleft >= usr.staminaleft_max)
					return
				if(usr.doing)
					return
				if(usr.ki<1000)
					usr << output("You don't have enough ki!","output2")
					return
				if(usr.ki>=5000&&usr.staminaleft<=usr.staminaleft_max-5)
					usr.ki-=1000
					if(!usr.staminabuff)usr.staminaleft+=10
					usr.doing=1
					spawn(3)
						usr.doing=0
					for(var/obj/KiTrainingBlast/A in get_step(usr,usr.dir))
						if(A.dir==EAST&&usr.dir==WEST)
							A.dir=usr.dir
							var/boost1=(3*usr.level+rand(50,80))+usr.ki_bonus
							var/boost2=(3*usr.level+rand(50,80))+usr.kidefense_bonus
							if(usr.smallshards)boost1*=1.25
							if(usr.largeshards)boost1*=1.5
							if(usr.greatshards)boost1*=2
							if(usr.massshards)boost1*=3
							if(usr.smallshards)boost2*=1.25
							if(usr.largeshards)boost2*=1.5
							if(usr.greatshards)boost2*=2
							if(usr.massshards)boost2*=3
							if(prob(50))usr.kidefense_max+=boost2
							if(prob(50))usr.ki_max+=boost1*0.5
							if(prob(50))
								usr.ki_res_exp += round(5+(usr.level/4000))
								usr.Ki_Res_Level()
							else
								usr.reflect_exp += round(5+(usr.level/6000))
								usr.Reflect_Level()
							var/xp = 100
							if(usr.smallshard)xp*=1.25
							if(usr.largeshard)xp*=1.5
							if(usr.greatshard)xp*=2
							if(usr.massshard)xp*=3
							if(usr.expbuff)xp *= 2
							usr.exp += xp
							usr.Level_Up()
obj
	KiTrainingBlast
		icon='Techs.dmi'
		icon_state="blast"
		layer=100
		range=0
		New()
			..()
			spawn(1)
				while(src)
					var/turf/T=src.loc
					for(var/obj/Gym/G in T)
						del(src)
						break
					if(T.density)
						del(src)
						break
					for(var/mob/M in T)
						del(src)
						break
					step(src,src.dir)
					src.range++
					if(src.range>=20)
						del(src)
						break
					sleep(2)
		Bump()
			del(src)




mob/TrainingObjects/SpeedBag
	name = "Punching Bag"
	icon = 'TrainingObjs.dmi'
	icon_state="speedbag"
	isgravmachine=1
	density=1