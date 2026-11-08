mob/verb/ToggleLethal()
	set category = "Combat"
	set name = "Toggle Lethal"
	if(!usr.lethalon)
		usr << "<b>Lethal: <font color = green>On</b>"
		usr << "<i>You will now auto-finish targets that you KO"
		usr.lethalon=1
	else
		usr << "<b>Lethal: <font color = red>Off</b>"
		usr << "<i>You will now have to use Finish verb to kill KO'd targets"
		usr.lethalon=0


mob
	var
		combolimit=2
		combospeed=20000
		lethalon=0
		tmp
			combocount=0
			lastkick="1"
			lastpunch="1"
			lastpk=""
			incombo=0
			thrown=0
			throwing=0
			attacking=0
			attacker=""
			spar=0
			notick = 0
	proc
		RemoveArmor(var/mob/M,var/D)
			if(prob(src.armorblock))
				src << output("\blue Your armor absorbs some of [M]'s attack!","output2")
				M << output("\blue [src]'s armor absorbs some of your attack!","output2")
				src.powerlevel -= D
				for(var/obj/Equipment/Armor/A in src)
					A.condition -= D
					if(A.condition <= 0)
						src << output("\blue Your armor has been destroyed!","output2")
						src.overlays -= A
						src.armor_eq = 0
						src.armor = 0
						src.armorblock=0
						del(A)
		Thrown(var/mob/T)
			if(!src)return
			if(!T)return
			var/fail=70
			if(usr.melee>30)
				fail=60
			if(usr.melee>40)
				fail=50
			if(usr.melee>50)
				fail=40
			if(usr.melee>60)
				fail=30
			if(usr.melee>70)
				fail=20
			if(usr.melee>80)
				fail=10
			if(usr.melee>90)
				fail=5
			if(prob(fail))
				T<<output("\blue You failed to throw [src]!","output2")
				return
			var/atk=T.strength+T.powerlevel*0.05+src.melee
			var/def=src.defence+src.powerlevel*0.05+src.ki*0.05+src.melee*0.8
			if(atk<def)
				T<<output("\blue [src] overpowers your throw!","output2")
				return
			T<<output("\blue You Threw [src]!","output2")
			src<<output("\blue [T] Threw you!","output2")
			var/D=1
			if(atk>def*2)
				D=2
			if(atk>def*3)
				D=3
			if(atk>def*4)
				D=4
			if(atk>def*5)
				D=5
			if(atk>def*6)
				D=6
			if(atk>def*7)
				D=7
			if(atk>def*8)
				D=8
			if(atk>def*9)
				D=9
			if(atk>def*10)
				D=10
			src.icon_state="thrown"
			src.thrown=1
			src.density=0
			src.boxing=0
			src.dualtrain=0
			src.rest=0
			var/DT=T.dir
			var/PT=atk-def
			while(D)
				D-=1
				for(var/atom/A in get_step(src,DT))
					if(istype(A,/obj/Buildings/Door1))
						var/obj/Buildings/Door1/DO=A
						DO.OpenDoor()
					if(istype(A,/obj/Buildings/Door2))
						var/obj/Buildings/Door2/DO=A
						DO.OpenDoor()
					if(A.density)
						src.powerlevel-=PT*(D/10)
						spawn(0)KO(A)
						if(istype(A,/mob))
							var/mob/M=A
							if(M.pk&&!M.safe)
								M.powerlevel-=PT*(D/10)
								spawn(0)KO(M)
						if(istype(A,/obj/Buildings))
							var/obj/O=A
							O.hp-=PT*(D/10)
							spawn(0)O.DestroyIt()
					sleep(0)
					if(A.density)
						src.thrown=0
						src.density=1
						src.icon_state=""
						src.boxing=0
				//		src.dualtrain=0
						D=0
						break
				step(src,DT)
				if(D<=0)
					switch(DT)
						if(NORTH)
							src.dir=SOUTH
						if(SOUTH)
							src.dir=NORTH
						if(EAST)
							src.dir=WEST
						if(WEST)
							src.dir=EAST
						if(NORTHEAST)
							src.dir=SOUTHWEST
						if(NORTHWEST)
							src.dir=SOUTHEAST
						if(SOUTHEAST)
							src.dir=NORTHWEST
						if(SOUTHWEST)
							src.dir=NORTHEAST
					src.thrown=0
					src.density=1
					src.icon_state=""
					src.boxing=0
			//		src.dualtrain=0
					break
				sleep(1)
	PC
		verb
			/*Throw()
				set category = "Combat"
				if(src.playerwatch==1)
					PlayerWatch(src,"Throw")
				if(!src.pk)
					src << output("You are not a Combatant!","output2")
					return
				if(src.doing)
					return
				if(src.throwing)
					return
				if(src.dead)
					src << output("You are dead.","output2")
					return
				if(src.FuseFollower)
					return
				if(src.cooldown)
					return
				if(src.KO)
					return
				if(src.attack_lock)
					return
				if(src.staminaleft>=src.staminaleft_max)
					src << output("<font color=#ff0000>You are too tired to fight!</font>","output2")
					return
				spawn(15)
					src.throwing=0
				var/turf/T=get_step(src,src.dir)
				for(var/mob/M in T)
					if(istype(M,/mob/PC))
						for(var/turf/Floors/Safe_Zone/S in view(12))
							src << output("[M] is in a Safe Zone!","output2")
							return
					if(!M)
						return
					if(!M in T)
						return
					if(M.FuseFollower)
						continue
					if(M.safe)
						src << output("[M] is safe and cannot be attacked.","output2")
						continue
					if(M.dead)
						src << output("[M] is dead.","output2")
						continue
					if(!M.pk)
						src << output("[M] is not a Combatant!","output2")
						continue
					if(ismob(M)&&M.loc)
						M.Thrown(src)
						src.staminaleft += 50*/

			Spar()
				set category = "Combat"
				set name = "Sparring Stance"
				if(src.playerwatch==1)
					PlayerWatch(src,"Spar")
	//			if(src.spam_delay)
	//				src<<output("You must wait a moment.","output2")
	//				return
	//			src.spam_delay=1
				spawn() src.SparStance()


			//AttackNormal(mob/M in get_step(src,src.dir))
			/*
			AttackNormal()
				set category = "Combat"
				set name = "Punch"
				if(src.playerwatch==1)
					PlayerWatch(src,"Punch")
				if(icon_state == "")
					flick("attack",src)
				var/mob/M=locate(/mob) in get_step(src,src.dir)
				if(istype(M,/mob))
					if(M in get_step(src,src.dir))
						if(!M)
							return
						if(src.doing || src.KO)
							return
						if(src.dead)
							src << output("You are dead","output2")
							return
						if(M.FuseFollower)
							return
						if(src.FuseFollower)
							return
						if(M.safe)
							src << output("[M] is safe and cannot be attacked","output2")
							return
						if(M.KO)
							src << output("[M] is already K.O!","output2")
							return
						if(src.cooldown)
							return
						if(src.attack_lock)
							return
						if(src.attackCD)
							return
						if(src.staminaleft>=src.staminaleft_max)
							src << output("<font color=#ff0000>You are too tired to fight!</font>","output2")
							return
						var/attackpower = round((usr.strength * usr.melee / 100) + (usr.powerlevel / 100))
						var/defensepower=round((M.defence * M.durability)/150)
						var/damage=round((attackpower-defensepower)/2)
						var/str = round(rand(500,1000)+src.level*2)
						var/min = round(usr.strength * rand(0.005,0.01))
						if(src.spar)
							attackpower=round((((usr.strength/50) * usr.melee)/100) + (usr.powerlevel / 100))
							defensepower=round(((M.defence/25) * M.durability)/125)
							damage=attackpower-defensepower
						if(damage<=min)
							damage=min
						if(src.weapone)
							damage*=1.05
						if(M.type == /mob/PC)
							for(var/turf/Floors/Safe_Zone/S in view(12))
								if(S in view(8))
									src << output("[M] is in a Safe Zone!","output2")
									return
							if(src.safe)
								src << output("You cannot attack at the moment.","output2")
								return
							if(!src.pk)
								src << output("You are not a Combatant!","output2")
								return
							if(!M.pk)
								src << output("[M] is not a Combatant!","output2")
								return
							if(M.dead)
								src << output("[M] is Dead!","output2")
								return
							if(!M)return
							src.attacking=1
							spawn(4)src.attacking=0
							if(src.SuperSonicCheck(M)==TRUE)
								src.SuperSonicStart(M)
								return
							if(src.attacker==M&&M.spar)
								src.exp+=7
							M.attacker=src
							spawn(20)
								if(M)
									M.attacker=""

				//			if(M.speed >= (src.speed*10))
							if(istype(M,/mob/SPECIAL))
								if(M.sleeping)
									M.AITarget = src
									M.sleeping = 0
									spawn() M:AIBank()
							if(M.armorblock)
								if(prob(M.armorblock))
									flick("attack",src)
									if(M.Dodge_Attack(src,src.strength,M.defence)==TRUE)
										return
									else
										if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
											return
										else
											if(M.Counter_Attack(src,src.strength,M.defence)==TRUE)
												return
									src.melee_exp += 1+round(src.level/1250)
									src.Melee_Level()
									src.staminaleft += 50
									var/damagetotal = round((damage/5)+(src.melee*(src.level*10)))
									M.powerlevel -= damagetotal
									M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
									src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
									M.durability_exp += 1+round(src.level/1500)
									M.Durability_Level()
									if(prob(15))
										src << output("<font color = white>Strength +[str]","output2")
										src.strength_max += str
									if(M.attacktext)
										M << output("\blue Your armor absorbs some of [src]'s attack!","output2")
									if(src.attacktext)
										src << output("\blue [M]'s armor absorbs some of your attack!","output2")
									for(var/obj/Equipment/Armor/A in M.contents)
										A.condition -= damage/5
										if(A.condition <= 0)
											M << output("\blue Your armor has been destroyed!","output2")
											M.overlays -= A
											M.armor_eq = 0
											M.armor = 0
											M.armorblock=0
											del(A)
									if(src.lethalon)
										src.AutoFinish(M)
									else
										M.KO()
									src.cooldown = 1
									spawn(20-round(src.melee/10))src.cooldown = 0

							if(prob(1+(src.critical/10)))
								flick("attack",src)
								if(M.attacktext)
									M << output("\red [src] Attacks you and sends you flying back!","output2")
								if(src.attacktext)
									src << output("\red You Attack [M] with a Critical Hit!","output2")
								var/FallDir = get_dir(src,M)
								src.dir = FallDir
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
								M.frozen-=1
								spawn(10)
									M.frozen+=1
								src.crit_exp += 5+round(src.level/750)
								src.Critical_Level()
								src.staminaleft += 50
								if(prob(15))
									src << output("<font color = white>Strength +[str]","output2")
									src.strength_max += str
								var/damagetotal = round((damage*2)+(src.melee*(src.level*50)))
								M.powerlevel -= damagetotal
								M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
								src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
								M.powerlevel -= damagetotal
								M.durability_exp += 1+round(src.level/1500)
								M.Durability_Level()

								if(src.lethalon)
									src.AutoFinish(M)
								else
									M.KO()
								src.cooldown = 1
								spawn(20-round(src.melee/10))src.cooldown = 0
							else

								flick("attack",src)
								if(M.Dodge_Attack(src,src.strength,M.defence)==TRUE)
									return
								else
									if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
										return
									else
										if(M.Counter_Attack(src,src.strength,M.defence)==TRUE)
											return
								if(M.attacktext)
									M << output("\red [src] Attacks you!","output2")
								if(src.attacktext)
									src << output("\red You Attack [M]!","output2")
								src.melee_exp += 2 + round(src.level/1250)
								src.Melee_Level()
								src.staminaleft += 50
								if(prob(15))
									src << output("<font color = white>Strength +[str]","output2")
									src.strength_max += str
								var/damagetotal = round(damage)+(src.melee*(src.level*25))
								M.powerlevel -= damagetotal
								M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
								src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
								M.powerlevel -= damagetotal
								M.durability_exp += 1+round(src.level/1500)
								M.Durability_Level()

								if(src.lethalon)
									src.AutoFinish(M)
								else
									M.KO()
								src.cooldown = 1
								spawn(20-round(src.melee/10))src.cooldown = 0
						else

							flick("attack",src)
							if(M.attacktext)
								M << output("\red [src] Attacks [M]!","output2")
							if(src.attacktext)
								src << output("\red You Attack [M]!","output2")
							src.melee_exp += 1 + round(src.level/1250)
							src.Melee_Level()3					src.staminaleft += 50
							if(prob(15))
								src << output("<font color = white>Strength +[str]","output2")
								src.strength_max += str
							var/damagetotal = round(damage)+(src.melee*(src.level*25))
							M.powerlevel -= damagetotal
							M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
							src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
							M.powerlevel -= damagetotal
							M.durability_exp += 1+round(src.level/1500)
							M.Durability_Level()

							if(src.lethalon)
								src.AutoFinish(M)
							else
								M.KO()
							src.cooldown = 1
							spawn(20-round(src.melee/10))src.cooldown = 0
*/
			AttackNormal()
				set category = "Combat"
				set name = "Punch"
				if(src.playerwatch==1)
					PlayerWatch(src,"Punch")

				var/mob/M=locate(/mob) in get_step(src,src.dir)
				var/dmgmod = 1
				if(!M)
					M=locate(/mob) in oview(1,src) //try 2
					if(M)
						src.FaceTargetPunch(M)
						dmgmod = 0.20
					else
						return

				//if(src.doing || src.KO)
				if(src.KO||src.focus_boxing||src.boxing)
					return
				if(src.dead)
					src << output("You are dead","output2")
					return
				if(M.FuseFollower)
					return
				if(src.FuseFollower)
					return
				if(src.dualtrain)
					return
				if(M.safe)
					src << output("[M] is safe and cannot be attacked","output2")
					return
				if(M.KO)
					src << output("[M] is already K.O!","output2")
					return
				if(src.cooldown)
					return
				if(src.attack_lock)
					return
				if(src.attackCD||usr.meditating||usr.focus_boxing||usr.boxing)
					return
				if(src.staminaleft>=src.staminaleft_max)
					src << output("<font color=#ff0000>You are too tired to fight!</font>","output2")
					return
				if(istype(M,/mob/Destroyable/VAULT))
					src << output("<font color=#ff0000>You must blow this vault door up with your energy!</font>","output2")
					return
			/*
				if(istype(M,/mob/TrainingObjects/SpeedBag))
					if(usr.attacking)
						usr.attacking=0
						usr.paralyze=0
						return

					usr.cooldown=1
					/*
					var/expmod

					if(usr.clevel<=20)
						expmod= rand(1,3)
					if(usr.clevel>=21&&usr.clevel<=30)
						expmod=rand(2,3)
					if(usr.clevel>=31&&usr.clevel<=40)
						expmod=rand(3,4)
					if(usr.clevel>=41&&usr.clevel<=50)
						expmod=rand(4,5)
					if(usr.clevel>=51&&usr.clevel<=60)
						expmod=rand(5,6)
					if(usr.clevel>=61&&usr.clevel<=80)
						expmod=rand(5,7)
					if(usr.clevel>=81&&usr.clevel<=90)
						expmod=rand(5,9)
					if(usr.clevel>=91&&usr.clevel<=100)
						expmod=rand(6,10)
					if(usr.clevel>100)
						expmod=rand(6,13)+(rand(0,1))
					//usr << "[expmod]"
					expmod = expmod*global.worldexp
					usr.exp+=expmod
					*/
					usr.exp+=rand(1,5)
					//var/bagplgain = 1*global.worldpl
					//usr<<"[bagplgain]"
					//usr.maxpowerlevel+=bagplgain
					//usr.powerlevel_max += rand(10,50)
					usr.staminaleft += rand(1,15)
					//usr<<sound('hitbag.wav',channel=0)
					//usr.icon_state="weight-training-right"
					flick("attack",usr)
					flick("speedbaghit",M)
					if(!usr.calledlvlup)
						usr.Level_Up()
				//	usr.updateStats("exp")
				//	usr.updateBody("powerlevel")
				//	usr.updateBody("stamina")
					sleep(2)
					//usr.icon_state=""
					usr.cooldown=0
					return
					*/
                //Setting defaults, if sparring we're toning down a little  Consider moving this to player stats, so we can reference instead of math every punch.
				var/damagetotal = 0
				var/attackpower = (usr.strength * (usr.melee/100))
				var/randatk = rand(60,100)/100
				attackpower = attackpower * randatk
				//var/attackpower = (src.spar ?  round((((usr.strength/50) * usr.melee)/100) + (usr.powerlevel / 100)) : round((usr.strength * usr.melee / 100) + (usr.powerlevel / 100)))
				var/defensepower = (M.defence * (M.durability/100))
				var/randdef = rand(85,100)/100
				defensepower = defensepower * randdef
				//var/damage = round(attackpower-defensepower)/3
				var/damage = attackpower-defensepower
				var/str = round(rand(10,100)+src.level/2)
				//var/min = round(usr.strength * 0.05)
				var/min = 1
				damagetotal = damage
				//world << "<i>attackpower: [attackpower]  defendpower: [defensepower] <br> damage: [damage]  min: [min]"
		//		if(damage<=min)
		//			damage=min
				damage = damage * dmgmod
				if(istype(M,/mob/SPECIAL/))

					if(M:sleeping)
						M:AITarget = src
						M:sleeping = 0

						M:AIBank()
				if(istype(M,/mob/PC/))
					//world << "mob"
					damagetotal = round(damagetotal/2)
				if(istype(M,/mob/Monster/Peaceful/))
					M:AITarget = src
					M:sleeping = 0
					walk(M,0)
					spawn(-1) M:AIpeaceful()
	/*
				if(!istype(M,/mob/PC))  // ENABLE TO ALLOW PUNCHES IN AIR
					if(src.buku)
						src << output("You cannot attack a mob while flying.","output2")
						return
						*/
				if(src.buku)
					src << output("You cannot attack a mob while flying.","output2")
					return

				if(M.type == /mob/PC)
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in view(8))
							src << output("[M] is in a Safe Zone!","output2")
							return
					if(src.safe)
						src << output("You cannot attack at the moment.","output2")
						return
					if(!src.pk)
						src << output("You are not a Combatant!","output2")
						return
					if(!M.pk)
						src << output("[M] is not a Combatant!","output2")
						return

					if(M.dead)
						src << output("[M] is Dead!","output2")
						return

					if(M.buku)
						view() << "<b><font color=red>[usr]'s attack forces [M] to land!</font>"
						M.buku = 0
						M.density = 1
						M.icon_state = ""
						M.doing = 0
						if(!M.timeskipeffect)
							M.move_delay = 0.6
						M.buku_lock = 1
						spawn(100) M.buku_lock = 0
					if(src.spar && M.spar)
						if(!src.notick && M.KO == 0)
							spawn(-1) src.StatTickOffense(M)
						//	spawn(-1) M.Spar_Ticks()
							src.notick = 1
							spawn(50) src.notick = 0
						//M.notick = 1
						//spawn(30) M.notick = 0
						//if(src.in_hbtc)
						//	damage *= 0.1


					if(!M)return
					//Not sure what this is for
				//	spawn() M.updateHealth()
					if(M.hudenabled)
						spawn() M.updateHealth()
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
					M.rage += round(rand(1,3))
					if(M.rage >= 100)
						M.rage = 100
					if(M.iting && M.pvpflagged)
						M.ITstop = 1
						damage *= 2
						src << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")



					src.attacking=1
					spawn(4)src.attacking=0
					if(M.energy_barrier)
						flick("attack",src)
						damagetotal = round(damage/10)
						M.energy_barrier_health -= damagetotal
						view(M) << "<font color = white><b>[src] punched [M]s energy barrier for [applycommas(damagetotal)]!"
						if(M.energy_barrier_health <= 0)
							view(M) << "<font color = white><b>[M]'s energy barrier was shattered by [src]!"
							M.energy_barrier=0
							damagetotal = round(damage/2)
						else
							return
				//	if(src.SuperSonicCheck(M)==TRUE)
				//		src.SuperSonicStart(M)
				//		return
					if(src.attacker==M&&M.spar)
						src.exp+=7
					M.attacker=src
					spawn(20)
						if(M)
							M.attacker=""

					//Critical and armor Check


					if(prob(1+(src.critical/10)))
					//if(prob(100))
						if(M.attacktext)
							M << output("\red [src] Attacks you and sends you flying back!","output2")
						if(src.attacktext)
							src << output("\red You Attack [M] with a Critical Hit!","output2")
						var/FallDir = get_dir(src,M)
						src.dir = FallDir
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
					//	M.frozen-=1
					//	spawn(10)
					//		M.frozen+=1
						src.crit_exp += 5+round(src.level/750)
						src.Critical_Level()
						damagetotal = round(damage*1.2)
					else if(M.armorblock)
						if(prob(M.armorblock))
							if(M.Dodge_Attack(src,src.strength,M.defence)==TRUE)
								return
							else if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
								return
							else if(M.Counter_Attack(src,src.strength,M.defence)==TRUE)
								return
							if(M.attacktext)
								M << output("\blue Your armor absorbs some of [src]'s attack!","output2")
							if(src.attacktext)
								src << output("\blue [M]'s armor absorbs some of your attack!","output2")
							damagetotal = round(damage/5)//+(src.melee*(src.level*10)))
							for(var/obj/Equipment/Armor/A in M.contents)
								A.condition -= damage/5
								if(A.condition <= 0)
									M << output("\blue Your armor has been destroyed!","output2")
									M.overlays -= A
									M.armor_eq = 0
									M.armor = 0
									M.armorblock=0
									del(A)
					else
						if(M.Dodge_Attack(src,src.strength,M.defence)==TRUE)
							return
						else if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
							return
						else if(M.Counter_Attack(src,src.strength,M.defence)==TRUE)
							return
						if(M.attacktext)
							M << output("\red [src] Attacks you!","output2")
						if(src.attacktext)
							src << output("\red You Attack [M]!","output2")
						damagetotal = round(damage)//+(src.melee*(src.level*25))

                        //We get more exp for hitting players?
						src.melee_exp += 2 + round(src.level/1250)
						src.Melee_Level()

				else
					//we're an npc and need to be announced and damage totaled.
					if(M.attacktext)
						M << output("\red [src] Attacks you!","output2")
					if(src.attacktext)
						src << output("\red You Attack [M]!","output2")
					damagetotal = round(damage)//+(src.melee*(src.level*25))
					src.melee_exp += 1 + round(src.level/1250)
					src.Melee_Level()

				//This stuff always happens no matter what kind of hit

				flick("attack",src)
				src.staminaleft += 1
				if(prob(10))
					src << output("<font color = white>Strength +[str]","output2")
					src.strength_max += str
			/*
				var/randshake = rand(5,8)

				if(randshake == 4)
					M.screen_shake4()
					src << "randshake 4"
				//	src << "color: [M.color]"
					if(!M.color)
						var/randcolor = pick("Invert", "BGR", "Greyscale", "Polaroid", "GRB", "RBG", "BRG", "GBR")
						var/ColorMatrix/c = new("[randcolor]")
					//	animate(src, color = c.matrix, time = 10)
						animate(M, color = c.matrix, time = 8)
						spawn(8) animate(M, color = null, time = 8)
					//	spawn(5) animate(src.screen, color = null, time = 10)
				if(randshake == 5||randshake == 6)
					M.screen_shake4()
					src << "randshake 5"
					animate(M, alpha = 100, time = 5)
					animate(M,alpha = 255, time = 10)

				if(randshake == 7)
					M.screen_shake4()
					src << "randshake 7"
					animate(M, color = "#E74C3C", alpha = 130, time = 5)
					animate(M,alpha = 255, time = 5)

					*/

					/*
					if(!M.color)
						var/randcolor = pick("Invert", "BGR", "Greyscale", "Polaroid", "GRB", "RBG", "BRG", "GBR")
						var/ColorMatrix/c = new("[randcolor]")
					//	animate(src, color = c.matrix, time = 10)
						animate(M, color = c.matrix, alpha = 100, time = 5)
						spawn(5) animate(M, color = null, alpha = 255, time = 5)
					*/


				//M.screen_shake4()


//				animate(M, alpha = 50, time = 10)
//				spawn(10) animate(M, alpha = 255, time = 10)
				animate(M, alpha = 150, time = 3)

				spawn(3)
					if(M) animate(M, alpha = 255, time = 3)

				if(prob(50))
					M.screen_shake5()


					//src << "screenshake 4"
                //double applying damage?
				if(!src.color)
				//	var/randcolor = pick("BGR", "Polaroid", "GRB", "RBG", "BRG", "GBR")
					var/ColorMatrix/c = new("Polaroid")
				//	animate(src, color = c.matrix, time = 10)
					animate(src, color = c.matrix, time = 3)
					spawn(3) animate(src, color = null, time = 2)

				if(src.spar && M.spar)
					var/mindmg = round(M.powerlevel_max*0.025)
					damagetotal = mindmg
				if(damagetotal < min)
					damagetotal = min
				M.powerlevel -= damagetotal
				if(dmgmod == 1)
					M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
					src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
				else
					M << output("<font color = red><i>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s attack!","default.output2")
					src << output("<font color = green><i>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")

				//M.powerlevel -= damagetotal
				M.durability_exp += 1+round(src.level/1500)
				M.Durability_Level()
				src.cooldown = 1
				var/cdtime = 60-(src.melee/2)
				if(cdtime > 15)
					cdtime = 15
				if(cdtime < 2)
					cdtime = rand(1,3)

				//var/acd = 20-round(src.melee/10)
				//world << "<b><font color = green> YOU PUNCH CD: [acd]"
				spawn(cdtime)
//					src << " [cdtime] cooldown"
					src.cooldown = 0
                //k.o. and lethal check
				if(src.lethalon)
					src.AutoFinish(M)
				else
					KO(M)

			//AttackSword(mob/M in get_step(src,src.dir))
			AttackSword()
				set category = "Combat"
				set name = "Sword Attack"
				//if(!src.demon_blade&&!src.z_sword)
				if(src.weapone == "EMPTY")
					src << output("You don't have a sword equipped!","output2")
					return
				return
				if(src.cooldown||src.attackCD)
					return
				if(src.playerwatch==1)
					PlayerWatch(src,"Sword Attack")
			//	B.loc=get_step(usr,turn(usr.dir,90))
			//	var/mob/M=locate(/mob) in get_step(src,src.dir)
			//	var/mob/L=locate(/mob) in get_step(src,turn(src.dir,90))
			//	var/mob/R=locate(/mob) in get_step(src,turn(src.dir,-90))

			//	if(!M && !R && !L)
			//		world << "nox mobs to hit"
			//		return
			//	else
				//if(M in get_step(src,src.dir))
				if(src.doing || src.KO)
					return
				if(src.dead)
					src << output("You are dead","output2")
					return
				if(src.dualtrain)
					return
			//	if(M.FuseFollower)
			//		return
			//	if(src.FuseFollower)
			//		return
			//	if(M.safe)
			//		src << output("[M] is safe and cannot be attacked","output2")
			//		return
			//	if(M.KO)
			//		src << output("[M] is already K.O!","output2")
			//		return

				if(src.attack_lock)
					return
				if(src.staminaleft>=src.staminaleft_max)
					src << output("<font color=#ff0000>You are too tired to fight!</font>","output2")
					return
				for(var/turf/Floors/Safe_Zone/S in view(8))
					if(S in oview(8))
						src<< "You are in a Safe Zone!"
						return
				src.cooldown = 1

				var/scd = 40-round(src.weapon/5)
		//		world << "<B><font color = yellow> YOU SWING SWORD  CD: [scd]"
				//spawn(50-round(src.weapon/10))	src.cooldown = 0
				spawn(scd) src.cooldown = 0
				//spawn(4) src.cooldown = 0
			//	var/turf/techloc
			//	if(M in get_step(src,src.dir))
			//		techloc = M
				var/turf/techloc = get_step(src.loc,src.dir)

				var/turf/techloc2
				var/turf/techloc3
/*
				if(src.dir==NORTH)
					techloc2 = get_step(locate(src.x+1,src.y-1,src.z),src.dir)
					techloc3 = get_step(locate(src.x-1,src.y-1,src.z),src.dir)
				if(src.dir==SOUTH)
					techloc2 = get_step(locate(src.x+1,src.y+1,src.z),src.dir)
					techloc3 = get_step(locate(src.x-1,src.y+1,src.z),src.dir)
				if(src.dir==EAST)
					techloc2 = get_step(locate(src.x-1,src.y-1,src.z),src.dir)
					techloc3 = get_step(locate(src.x-1,src.y+1,src.z),src.dir)
				if(src.dir==WEST)
					techloc2 = get_step(locate(src.x+1,src.y+1,src.z),src.dir)
					techloc3 = get_step(locate(src.x+1,src.y-1,src.z),src.dir)
					*/
				if(src.dir==NORTH)
					techloc2 = get_step(locate(src.x+1,src.y,src.z),src.dir)
					techloc3 = get_step(locate(src.x-1,src.y,src.z),src.dir)
				if(src.dir==SOUTH)
					techloc2 = get_step(locate(src.x+1,src.y,src.z),src.dir)
					techloc3 = get_step(locate(src.x-1,src.y,src.z),src.dir)
				if(src.dir==EAST)
					techloc2 = get_step(locate(src.x,src.y-1,src.z),src.dir)
					techloc3 = get_step(locate(src.x,src.y+1,src.z),src.dir)
				if(src.dir==WEST)
					techloc2 = get_step(locate(src.x,src.y+1,src.z),src.dir)
					techloc3 = get_step(locate(src.x,src.y-1,src.z),src.dir)
				for(var/mob/M1 in techloc2)
					//world << "M1"
					spawn() src.swordatk(M1)
				//if(L)
				for(var/mob/M2 in techloc3)
					//world << "M2"
					spawn() src.swordatk(M2)
			//	if(R)
				for(var/mob/M3 in techloc)
					//world << "M3"
					src.swordatk(M3)





	proc
		swordatk(mob/M)
			//var/attackpower=round(src.strength * (src.weapon_power/100) + src.powerlevel / 50)
			var/randboost = rand(1,3)
			var/attackpower = (usr.strength * (usr.weapon_power / 100) * randboost)
			var/defensepower=round(M.defence * (M.weapon_resistance/100))
			var/damage=round(attackpower-defensepower)
		//	var/pltick = round(rand(10,100)+src.level)
		//	var/kitick = round(rand(10,100)+src.level)
		//	var/strtick = round(rand(10,100)+src.level)
			var/str = round(rand(10,100)+src.level)
			var/min = round(usr.strength * 0.3)
		//	world << "attackpower: [attackpower]  defendpower: [defensepower] <br> damage: [damage]  min: [min]"
		//	if(damage<=min)
		//		damage=min
		//	world << "[src] HIT [M]"
		//	M.icon = 'Babidi.dmi'
			flick("attack",src)
	//		if(M.Dodge_Attack(src,src.strength,M.defence)==TRUE)
	//			return
	//		else
	//			if(M.Block_Attack(src,src.strength,M.defence)==TRUE)
	//				return
	//			else
	//				if(M.Counter_Attack(src,src.strength,M.defence)==TRUE)
	//					return
			if(istype(M,/mob/PC))
				spawn(-1) M.PVPflagged(4)
				spawn(-1) src.PVPflagged(6)

				M.rage += round(rand(1,3))
				if(M.rage >= 100)
					M.rage = 100
				if(M.iting && M.pvpflagged)
					M.ITstop = 1
					damage *= 2
					src << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

			if(M.attacktext)
				M << output("\red [src] slashes you with their sword!","output2")
			if(src.attacktext)
				src << output("\red You slash [M] with your sword!","output2")
			if(istype(M,/mob/SPECIAL))
				if(M.sleeping)
					M.AITarget = src
					M.sleeping = 0
					spawn() M:AIBank()
			if(M.energy_barrier)
				flick("attack",src)
				damage = round(damage/5)
				M.energy_barrier_health -= damage
				view(M) << "<font color = white><b>[src] slashed [M]s energy barrier for [applycommas(damage)]!"
				if(M.energy_barrier_health <= 0)
					view(M) << "<font color = white><b>[M]'s energy barrier was shattered by [src]!"
					M.energy_barrier=0
					damage = round(damage/2)
				else
					return
			if(!src.notick && M.KO == 0)
				spawn() src.StatTickOffense()
				spawn() M.StatTickDefense()
				src.notick = 1
				spawn(50) src.notick = 0
				M.notick = 1
				spawn(50) M.notick = 0
				if(src.in_hbtc)
					damage *= 0.1

			src.weapon_exp += 2 + round(src.level/1250)
			src.weapon_power_exp += 1 + round(src.level/1250)
			spawn() src.Weapon_Level()
			spawn() Weapon_Power_Level()
			src.staminaleft += 10
			if(prob(15))
				src << output("<font color = white>Strength +[str]","output2")
				src.strength_max += str

			var/damagetotal = round(damage)//+(src.melee*(src.level*25))
			if(src.spar)
				var/mindmg = round(M.powerlevel_max*0.05)
				damagetotal = mindmg
			M.powerlevel -= damagetotal

			M << output("<font color = red>You were hit for <b>[applycommas(damagetotal)]</b> by [src]'s sword attack!","default.output2")
			src << output("<font color = green>You hit [M] for <b>[applycommas(damagetotal)]</b> damage!","default.output2")
			//M.powerlevel -= damagetotal
			M.weapon_res_exp += 1+round(src.level/1500)
			if(M.hudenabled)
				spawn() M.updateHealth()
			spawn() M.Weapon_Res_Level()
			if(src.lethalon)
				src.AutoFinish(M)
			else
				KO(M)
			/*
			if(!M.dead)
				spawn() M.DeathCheck(src)
			src.Level_Up()
			*/




			//KO(M)

	proc
		SuperSonicCheck(mob/M)
			if(src.attacking&&M.attacking)
				if(src.in_tourney==1&&M.in_tourney==1)
					return FALSE
				if(src.dir==NORTH&&M.dir==SOUTH)
					return TRUE
				if(src.dir==SOUTH&&M.dir==NORTH)
					return TRUE
				if(src.dir==EAST&&M.dir==WEST)
					return TRUE
				if(src.dir==WEST&&M.dir==EAST)
					return TRUE
				if(src.dir==NORTHEAST&&M.dir==SOUTHWEST)
					return TRUE
				if(src.dir==SOUTHWEST&&M.dir==NORTHEAST)
					return TRUE
				if(src.dir==NORTHWEST&&M.dir==SOUTHEAST)
					return TRUE
				if(src.dir==SOUTHEAST&&M.dir==NORTHWEST)
					return TRUE
			else
				return FALSE
		SuperSonicStart(mob/M,Times=2)
			var/turf/L1=src.loc
			var/turf/L2=M.loc
			src.doing=1
			M.doing=1
			src.frozen=1
			M.frozen=1
			var/t=Times
			Repeat
			if(t)
				t-=1
				sleep(7)
				if(prob(50))
					spawn(1)
						if(!src||!M)
							src.doing=0
							M.doing=0
							src.frozen=0
							M.frozen=0
							return
						flick("attack",src)
						flick("IT",M)
						flick("IT",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						if(!src||!M)
							src.doing=0
							M.doing=0
							src.frozen=0
							M.frozen=0
							return
						flick("attack",src)
						flick("IT",M)
						flick("IT",src)
						flick("attack",M)
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(5)
				src.loc=L1
				M.loc=L2
				sleep(5)
				if(prob(50))
					spawn(1)
						if(!src||!M)
							src.doing=0
							M.doing=0
							src.frozen=0
							M.frozen=0
							return
						flick("attack",src)
						flick("IT",M)
						flick("IT",src)
						flick("attack",M)
					if(src.x+5&&M.x+5<world.maxx)
						src.loc=locate(src.x+4,src.y,src.z)
						M.loc=locate(M.x+4,M.y,M.z)
					else
						if(src.y+5&&M.y+5<world.maxy)
							src.loc=locate(src.x,src.y+4,src.z)
							M.loc=locate(M.x,M.y+4,M.z)
				else
					spawn(1)
						if(!src||!M)
							src.doing=0
							M.doing=0
							src.frozen=0
							M.frozen=0
							return
						flick("attack",src)
						flick("IT",M)
						flick("IT",src)
						flick("attack",M)
					if(src.y+5&&M.y+5<world.maxy)
						src.loc=locate(src.x,src.y+4,src.z)
						M.loc=locate(M.x,M.y+4,M.z)
					else
						if(src.x+5&&M.x+5<world.maxx)
							src.loc=locate(src.x+4,src.y,src.z)
							M.loc=locate(M.x+4,M.y,M.z)
				sleep(5)
				src.loc=L1
				M.loc=L2
				src.doing=0
				M.doing=0
				src.frozen=0
				M.frozen=0
				if(t)
					goto Repeat
				else
					src.doing=0
					M.doing=0
					src.frozen=0
					M.frozen=0
			else
				src.doing=0
				M.doing=0
				src.frozen=0

				M.frozen=0
//mob/PC/verb/Finish(mob/M in get_step(src,src.dir))
mob/PC/verb/Finish()
	set category = "Combat"
	if(src.playerwatch==1)
		PlayerWatch(src,"Finish")
	var/mob/M=locate(/mob) in get_step(src,src.dir)
	//if(istype(M,/mob))
	//Can we be hit?
	//if(M in get_step(src,src.dir))
	if(!M)
		return
	if(src.dead)
		src<<output("You are dead.","output2")
		return
	if(M.FuseFollower)
		return
	if(src.FuseFollower)
		return
//	for(var/turf/Floors/Safe_Zone/S in view(8))
//		if(S in oview(8))
//			usr << "You are in a Safe Zone!"
	if(M.safe)
		src << output("[M] can't be attacked right now.","output2")
		return
	if(src.finish_delay)
		src << output("You must wait a moment.","output2")
		return
	if(M.KO)
		//src.finish_delay = 1
	//	spawn(3)src.finish_delay = 0

		if(!M.dead)
			M.DeathCheck(src)
			//src.AutoFinish(M)
			return
			//var/gc = get_step(
		//if(!src.calledlvlup)
		//	if(src.exp >= src.tnl)
		//		spawn()src.Level_Up()
		return
	else
		src.finish_delay = 1
		spawn(5)src.finish_delay = 0
		src << output("[M] is not KO yet!","output2")
		return

mob/proc/AutoFinish(mob/M as mob)
	if(!M.dead)
		M.DeathCheck(src)
	if(!src.calledlvlup)
		if(src.exp >= src.tnl)
			spawn()src.Level_Up()
	//src.Level_Up()


mob
	proc
		Melee_Level()
			if(!usr)return
			if(usr.melee_mastered == 1)
				return
			if(usr.melee_exp >= usr.melee_tnl)
				if(usr.melee_max < 99)
					usr.melee_exp -= usr.melee_tnl
					usr.melee_tnl += round(usr.melee_tnl * 0.1)
					usr.melee ++
					usr.melee_max ++
					usr << output("<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#08f57e>:</FONT><FONT COLOR=#0fea7d>:</FONT><FONT COLOR=#17e07b> </FONT><FONT COLOR=#1ed579>M</FONT><FONT COLOR=#26ca78>e</FONT><FONT COLOR=#2dbf76>l</FONT><FONT COLOR=#35b575>e</FONT><FONT COLOR=#3daa73>e</FONT><FONT COLOR=#449f71> </FONT><FONT COLOR=#4c9470>S</FONT><FONT COLOR=#53896e>k</FONT><FONT COLOR=#5b7f6c>i</FONT><FONT COLOR=#62746b>l</FONT><FONT COLOR=#696969>l</FONT><FONT COLOR=#63736b> </FONT><FONT COLOR=#5c7d6c>I</FONT><FONT COLOR=#55876e>n</FONT><FONT COLOR=#4e916f>c</FONT><FONT COLOR=#479b71>r</FONT><FONT COLOR=#40a572>e</FONT><FONT COLOR=#39af74>a</FONT><FONT COLOR=#31ba75>s</FONT><FONT COLOR=#2ac477>e</FONT><FONT COLOR=#23ce78>d</FONT><FONT COLOR=#1cd87a>!</FONT><FONT COLOR=#15e27b> </FONT><FONT COLOR=#0eec7d>:</FONT><FONT COLOR=#07f67e>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>","output2")
				else
					usr.melee ++
					usr.melee_max ++
					usr.melee_mastered =  1
					usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#00f7ee>:</FONT><FONT COLOR=#00eedb>:</FONT><FONT COLOR=#00e5c9> </FONT><FONT COLOR=#00dbb7>M</FONT><FONT COLOR=#00d2a5>e</FONT><FONT COLOR=#00c992>l</FONT><FONT COLOR=#00c080>e</FONT><FONT COLOR=#00b76e>e</FONT><FONT COLOR=#00ae5b> </FONT><FONT COLOR=#00a549>S</FONT><FONT COLOR=#009b37>k</FONT><FONT COLOR=#009225>i</FONT><FONT COLOR=#008912>l</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#008912> </FONT><FONT COLOR=#009225>M</FONT><FONT COLOR=#009b37>A</FONT><FONT COLOR=#00a549>S</FONT><FONT COLOR=#00ae5b>T</FONT><FONT COLOR=#00b76e>E</FONT><FONT COLOR=#00c080>R</FONT><FONT COLOR=#00c992>E</FONT><FONT COLOR=#00d2a5>D</FONT><FONT COLOR=#00dbb7>!</FONT><FONT COLOR=#00e5c9> </FONT><FONT COLOR=#00eedb>:</FONT><FONT COLOR=#00f7ee>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")

		Block_Level()
			if(!usr)return
			if(usr.block_mastered == 1)
				return
			if(usr.block_exp >= block_tnl)
				if(usr.block_max < 99)
					usr.block_exp -= usr.block_tnl
					usr.block_tnl += round(usr.block_tnl * 0.1)
					usr.block ++
					usr.block_max ++
					if(usr.block_exp < 0)
						usr.block_exp = 0
					usr << output("<center><FONT COLOR=#ff1493>.</FONT><FONT COLOR=#f31793>:</FONT><FONT COLOR=#e61a93>:</FONT><FONT COLOR=#d91d92> </FONT><FONT COLOR=#cb2091>B</FONT><FONT COLOR=#be2391>l</FONT><FONT COLOR=#b12690>o</FONT><FONT COLOR=#a42990>c</FONT><FONT COLOR=#972c8f>k</FONT><FONT COLOR=#8a2f8e> </FONT><FONT COLOR=#7d328e>S</FONT><FONT COLOR=#6f358d>k</FONT><FONT COLOR=#62388c>i</FONT><FONT COLOR=#553b8c>l</FONT><FONT COLOR=#483d8b>l</FONT><FONT COLOR=#543b8c> </FONT><FONT COLOR=#61388c>I</FONT><FONT COLOR=#6d368d>n</FONT><FONT COLOR=#79338d>c</FONT><FONT COLOR=#85308e>r</FONT><FONT COLOR=#922d8f>e</FONT><FONT COLOR=#9e2a8f>a</FONT><FONT COLOR=#aa2890>s</FONT><FONT COLOR=#b62590>e</FONT><FONT COLOR=#c32291>d</FONT><FONT COLOR=#cf1f92>!</FONT><FONT COLOR=#db1c92> </FONT><FONT COLOR=#e71a93>:</FONT><FONT COLOR=#f41793>:</FONT><FONT COLOR=#ff1493>.</FONT></center>","output2")
				else
					usr.block ++
					usr.block_max ++
					usr.block_mastered = 1
					usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#121187>:</FONT><FONT COLOR=#24228f>:</FONT><FONT COLOR=#363496> </FONT><FONT COLOR=#48459d>B</FONT><FONT COLOR=#5a56a5>l</FONT><FONT COLOR=#6c67ac>o</FONT><FONT COLOR=#7d79b4>c</FONT><FONT COLOR=#8f8abb>k</FONT><FONT COLOR=#a19bc2> </FONT><FONT COLOR=#b3acca>S</FONT><FONT COLOR=#c5bdd1>k</FONT><FONT COLOR=#d7cfd8>i</FONT><FONT COLOR=#e9e0e0>l</FONT><FONT COLOR=#faf0e6>l</FONT><FONT COLOR=#e9e0e0> </FONT><FONT COLOR=#d7cfd8>M</FONT><FONT COLOR=#c5bdd1>A</FONT><FONT COLOR=#b3acca>S</FONT><FONT COLOR=#a19bc2>T</FONT><FONT COLOR=#8f8abb>E</FONT><FONT COLOR=#7d79b4>R</FONT><FONT COLOR=#6c67ac>E</FONT><FONT COLOR=#5a56a5>D</FONT><FONT COLOR=#48459d>!</FONT><FONT COLOR=#363496> </FONT><FONT COLOR=#24228f>:</FONT><FONT COLOR=#121187>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Dodge_Level()
			if(!usr)return
			if(usr.dodge_mastered == 1)
				return
			if(usr.dodge_exp >= dodge_tnl)
				if(usr.dodge_max < 99)
					usr.dodge_exp -= usr.dodge_tnl
					usr.dodge_tnl += round(usr.dodge_tnl * 0.1)
					usr.dodge ++
					usr.dodge_max ++
					if(usr.dodge_exp < 0)
						usr.dodge_exp = 0
					usr << output("<center><FONT COLOR=#ffb6c1>.</FONT><FONT COLOR=#eeb8c2>:</FONT><FONT COLOR=#dbbac3>:</FONT><FONT COLOR=#c9bbc5> </FONT><FONT COLOR=#b7bdc6>D</FONT><FONT COLOR=#a5bfc7>o</FONT><FONT COLOR=#92c1c8>d</FONT><FONT COLOR=#80c3ca>g</FONT><FONT COLOR=#6ec4cb>e</FONT><FONT COLOR=#5bc6cc> </FONT><FONT COLOR=#49c8cd>S</FONT><FONT COLOR=#37cace>k</FONT><FONT COLOR=#25cbd0>i</FONT><FONT COLOR=#12cdd1>l</FONT><FONT COLOR=#00ced1>l</FONT><FONT COLOR=#11cdd1> </FONT><FONT COLOR=#22ccd0>I</FONT><FONT COLOR=#33cacf>n</FONT><FONT COLOR=#44c8cd>c</FONT><FONT COLOR=#55c7cc>r</FONT><FONT COLOR=#66c5cb>e</FONT><FONT COLOR=#77c3ca>a</FONT><FONT COLOR=#89c2c9>s</FONT><FONT COLOR=#9ac0c8>e</FONT><FONT COLOR=#abbec7>d</FONT><FONT COLOR=#bcbdc6>!</FONT><FONT COLOR=#cdbbc4> </FONT><FONT COLOR=#deb9c3>:</FONT><FONT COLOR=#efb8c2>:</FONT><FONT COLOR=#ffb6c1>.</FONT></center>","output2")
				else
					usr.dodge ++
					usr.dodge_max ++
					usr.dodge_mastered = 1
					usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f40803>:</FONT><FONT COLOR=#e80f07>:</FONT><FONT COLOR=#db170a> </FONT><FONT COLOR=#cf1f0e>D</FONT><FONT COLOR=#c32711>o</FONT><FONT COLOR=#b72e15>d</FONT><FONT COLOR=#ab3618>g</FONT><FONT COLOR=#9e3e1b>e</FONT><FONT COLOR=#92451f> </FONT><FONT COLOR=#864d22>S</FONT><FONT COLOR=#7a5526>k</FONT><FONT COLOR=#6d5d29>i</FONT><FONT COLOR=#61642d>l</FONT><FONT COLOR=#556b2f>l</FONT><FONT COLOR=#61642d> </FONT><FONT COLOR=#6d5d29>M</FONT><FONT COLOR=#7a5526>A</FONT><FONT COLOR=#864d22>S</FONT><FONT COLOR=#92451f>T</FONT><FONT COLOR=#9e3e1b>E</FONT><FONT COLOR=#ab3618>R</FONT><FONT COLOR=#b72e15>E</FONT><FONT COLOR=#c32711>D</FONT><FONT COLOR=#cf1f0e>!</FONT><FONT COLOR=#db170a> </FONT><FONT COLOR=#e80f07>:</FONT><FONT COLOR=#f40803>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")

		Counter_Level()
			if(!usr)return
			if(usr.counter_mastered == 1)
				return
			if(usr.count_exp >= usr.count_tnl)
				if(usr.counter_max < 99)
					usr.count_exp -= usr.count_tnl
					usr.count_tnl += round(usr.count_tnl * 0.1)
					usr.counter ++
					usr.counter_max ++
					usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f6090a>:</FONT><FONT COLOR=#ed1113>:</FONT><FONT COLOR=#e31a1d> </FONT><FONT COLOR=#da2227>C</FONT><FONT COLOR=#d02b30>o</FONT><FONT COLOR=#c6343a>u</FONT><FONT COLOR=#bd3c44>n</FONT><FONT COLOR=#b3454d>t</FONT><FONT COLOR=#aa4d57>e</FONT><FONT COLOR=#a05661>r</FONT><FONT COLOR=#965f6a> </FONT><FONT COLOR=#8d6774>S</FONT><FONT COLOR=#83707e>k</FONT><FONT COLOR=#7a7887>i</FONT><FONT COLOR=#708090>l</FONT><FONT COLOR=#797988>l</FONT><FONT COLOR=#82717f> </FONT><FONT COLOR=#8b6976>I</FONT><FONT COLOR=#94616d>n</FONT><FONT COLOR=#9d5964>c</FONT><FONT COLOR=#a6515b>r</FONT><FONT COLOR=#af4952>e</FONT><FONT COLOR=#b84149>a</FONT><FONT COLOR=#c1383f>s</FONT><FONT COLOR=#ca3036>e</FONT><FONT COLOR=#d3282d>d</FONT><FONT COLOR=#dc2024>!</FONT><FONT COLOR=#e5181b> </FONT><FONT COLOR=#ee1012>:</FONT><FONT COLOR=#f70809>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")
				else


					usr.counter ++
					usr.counter_max ++
					usr.counter_mastered = 1
					usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#090078>:</FONT><FONT COLOR=#130070>:</FONT><FONT COLOR=#1c0067> </FONT><FONT COLOR=#25005f>C</FONT><FONT COLOR=#2f0056>o</FONT><FONT COLOR=#38004d>u</FONT><FONT COLOR=#410045>n</FONT><FONT COLOR=#4b003c>t</FONT><FONT COLOR=#540034>e</FONT><FONT COLOR=#5d002b>r</FONT><FONT COLOR=#670022> </FONT><FONT COLOR=#70001a>S</FONT><FONT COLOR=#790011>k</FONT><FONT COLOR=#830009>i</FONT><FONT COLOR=#8b0000>l</FONT><FONT COLOR=#830009>l</FONT><FONT COLOR=#790011> </FONT><FONT COLOR=#70001a>M</FONT><FONT COLOR=#670022>A</FONT><FONT COLOR=#5d002b>S</FONT><FONT COLOR=#540034>T</FONT><FONT COLOR=#4b003c>E</FONT><FONT COLOR=#410045>R</FONT><FONT COLOR=#38004d>E</FONT><FONT COLOR=#2f0056>D</FONT><FONT COLOR=#25005f>!</FONT><FONT COLOR=#1c0067> </FONT><FONT COLOR=#130070>:</FONT><FONT COLOR=#090078>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Critical_Level()
			if(!usr)return
			if(usr.critical_mastered == 1)
				return
			if(usr.crit_exp >= usr.crit_tnl)
				if(usr.critical_max < 99)
					usr.crit_exp -= usr.crit_tnl
					usr.crit_tnl += round(usr.crit_tnl * 0.1)
					usr.critical ++
					usr.critical_max ++
					usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#fe0104>:</FONT><FONT COLOR=#fc0308>:</FONT><FONT COLOR=#f9040b> </FONT><FONT COLOR=#f7050f>C</FONT><FONT COLOR=#f50713>r</FONT><FONT COLOR=#f30817>i</FONT><FONT COLOR=#f0091b>t</FONT><FONT COLOR=#ee0b1f>i</FONT><FONT COLOR=#ec0c22>c</FONT><FONT COLOR=#ea0d26>a</FONT><FONT COLOR=#e70e2a>l</FONT><FONT COLOR=#e5102e> </FONT><FONT COLOR=#e31132>S</FONT><FONT COLOR=#e11235>k</FONT><FONT COLOR=#de1439>i</FONT><FONT COLOR=#dc143c>l</FONT><FONT COLOR=#de1439>l</FONT><FONT COLOR=#e11235> </FONT><FONT COLOR=#e31132>I</FONT><FONT COLOR=#e5102e>n</FONT><FONT COLOR=#e70e2a>c</FONT><FONT COLOR=#ea0d26>r</FONT><FONT COLOR=#ec0c22>e</FONT><FONT COLOR=#ee0b1f>a</FONT><FONT COLOR=#f0091b>s</FONT><FONT COLOR=#f30817>e</FONT><FONT COLOR=#f50713>d</FONT><FONT COLOR=#f7050f>!</FONT><FONT COLOR=#f9040b> </FONT><FONT COLOR=#fc0308>:</FONT><FONT COLOR=#fe0104>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")
				else
					usr.critical ++
					usr.critical_max ++
					usr.critical_mastered = 1
					usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#001189>:</FONT><FONT COLOR=#002291>:</FONT><FONT COLOR=#00339a> </FONT><FONT COLOR=#0044a2>C</FONT><FONT COLOR=#0055ab>r</FONT><FONT COLOR=#0066b3>i</FONT><FONT COLOR=#0077bc>t</FONT><FONT COLOR=#0089c4>i</FONT><FONT COLOR=#009acd>c</FONT><FONT COLOR=#00abd5>a</FONT><FONT COLOR=#00bcde>l</FONT><FONT COLOR=#00cde6> </FONT><FONT COLOR=#00deef>S</FONT><FONT COLOR=#00eff7>k</FONT><FONT COLOR=#00ffff>i</FONT><FONT COLOR=#00f0f8>l</FONT><FONT COLOR=#00e0f0>l</FONT><FONT COLOR=#00d0e8> </FONT><FONT COLOR=#00c0e0>M</FONT><FONT COLOR=#00b0d8>A</FONT><FONT COLOR=#00a0d0>S</FONT><FONT COLOR=#0090c8>T</FONT><FONT COLOR=#0080c0>E</FONT><FONT COLOR=#0070b8>R</FONT><FONT COLOR=#0060b0>E</FONT><FONT COLOR=#0050a8>D</FONT><FONT COLOR=#0040a0>!</FONT><FONT COLOR=#003098> </FONT><FONT COLOR=#002090>:</FONT><FONT COLOR=#001088>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Durability_Level()
			if(!usr)return
			if(usr.durability_mastered == 1)
				return
			if(usr.durability_exp >= usr.durability_tnl)
				if(usr.durability_max < 99)
					usr.durability_exp -= usr.durability_tnl
					usr.durability_tnl += round(usr.durability_tnl * 0.1)
					usr.durability ++
					usr.durability_max ++
					usr << output("<center><FONT COLOR=#9370db>.</FONT><FONT COLOR=#9a79db>:</FONT><FONT COLOR=#a182dc>:</FONT><FONT COLOR=#a78bdc> </FONT><FONT COLOR=#ae94dd>D</FONT><FONT COLOR=#b59ddd>u</FONT><FONT COLOR=#bca6dd>r</FONT><FONT COLOR=#c3afde>a</FONT><FONT COLOR=#cab8de>b</FONT><FONT COLOR=#d0c1de>i</FONT><FONT COLOR=#d7cadf>l</FONT><FONT COLOR=#ded3df>i</FONT><FONT COLOR=#e5dce0>t</FONT><FONT COLOR=#ece5e0>y</FONT><FONT COLOR=#f2eee0> </FONT><FONT COLOR=#f9f7e0>S</FONT><FONT COLOR=#ffffe0>k</FONT><FONT COLOR=#faf8e0>i</FONT><FONT COLOR=#f3efe0>l</FONT><FONT COLOR=#ede7e0>l</FONT><FONT COLOR=#e6dee0> </FONT><FONT COLOR=#e0d6df>I</FONT><FONT COLOR=#dacddf>n</FONT><FONT COLOR=#d3c5df>c</FONT><FONT COLOR=#cdbcde>r</FONT><FONT COLOR=#c6b4de>e</FONT><FONT COLOR=#c0abdd>a</FONT><FONT COLOR=#b9a3dd>s</FONT><FONT COLOR=#b39add>e</FONT><FONT COLOR=#ad92dc>d</FONT><FONT COLOR=#a689dc> </FONT><FONT COLOR=#a081dc>:</FONT><FONT COLOR=#9978db>:</FONT><FONT COLOR=#9370db>.</FONT></center>","output2")
				else
					usr.durability ++
					usr.durability_max ++
					usr.durability_mastered =  1
					usr << output("<center><FONT COLOR=#2f4f4f>.</FONT><FONT COLOR=#344b4b>:</FONT><FONT COLOR=#394646>:</FONT><FONT COLOR=#3e4141> </FONT><FONT COLOR=#443c3c>D</FONT><FONT COLOR=#493737>u</FONT><FONT COLOR=#4e3232>r</FONT><FONT COLOR=#532d2d>a</FONT><FONT COLOR=#582828>b</FONT><FONT COLOR=#5d2323>i</FONT><FONT COLOR=#621e1e>l</FONT><FONT COLOR=#671919>i</FONT><FONT COLOR=#6d1414>t</FONT><FONT COLOR=#720f0f>y</FONT><FONT COLOR=#770a0a> </FONT><FONT COLOR=#7c0505>S</FONT><FONT COLOR=#800000>k</FONT><FONT COLOR=#7c0505>i</FONT><FONT COLOR=#770909>l</FONT><FONT COLOR=#730e0e>l</FONT><FONT COLOR=#6e1313> </FONT><FONT COLOR=#691818>M</FONT><FONT COLOR=#641c1c>A</FONT><FONT COLOR=#5f2121>S</FONT><FONT COLOR=#5a2626>T</FONT><FONT COLOR=#562a2a>E</FONT><FONT COLOR=#512f2f>R</FONT><FONT COLOR=#4c3434>E</FONT><FONT COLOR=#473838>D</FONT><FONT COLOR=#423d3d>!</FONT><FONT COLOR=#3d4242> </FONT><FONT COLOR=#394747>:</FONT><FONT COLOR=#344b4b>:</FONT><FONT COLOR=#2f4f4f>.</FONT></center>","output2")

		Ki_Con_Level()
			if(!usr)return
			if(usr.ki_control_mastered == 1)
				return
			if(usr.ki_con_exp >= usr.ki_con_tnl)
				if(usr.ki_control_max >= 24)
					if(!usr.learn_powerdown)
						usr.learn_powerdown = 1
						usr.contents += new/obj/Technique/PowerDown
						usr << output("<center><font color = white> .:: You learn Power Down ::.</font></center>","output2")

				if(usr.ki_control_max < 99)
					usr.ki_con_exp -= usr.ki_con_tnl
					usr.ki_con_tnl += round(usr.ki_con_tnl * 0.1)
					usr.ki_control ++
					usr.ki_control_max ++
					usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#00f8f1>:</FONT><FONT COLOR=#00f1e2>:</FONT><FONT COLOR=#00e9d3> </FONT><FONT COLOR=#00e2c4>K</FONT><FONT COLOR=#00dab5>i</FONT><FONT COLOR=#00d3a6> </FONT><FONT COLOR=#00cb97>C</FONT><FONT COLOR=#00c488>o</FONT><FONT COLOR=#00bc78>n</FONT><FONT COLOR=#00b569>t</FONT><FONT COLOR=#00ad5a>r</FONT><FONT COLOR=#00a64b>o</FONT><FONT COLOR=#009e3c>l</FONT><FONT COLOR=#00972d> </FONT><FONT COLOR=#008f1e>S</FONT><FONT COLOR=#00880f>k</FONT><FONT COLOR=#008000>i</FONT><FONT COLOR=#00880f>l</FONT><FONT COLOR=#008f1e>l</FONT><FONT COLOR=#00972d> </FONT><FONT COLOR=#009e3c>I</FONT><FONT COLOR=#00a64b>n</FONT><FONT COLOR=#00ad5a>c</FONT><FONT COLOR=#00b569>r</FONT><FONT COLOR=#00bc78>e</FONT><FONT COLOR=#00c488>a</FONT><FONT COLOR=#00cb97>s</FONT><FONT COLOR=#00d3a6>e</FONT><FONT COLOR=#00dab5>d</FONT><FONT COLOR=#00e2c4>!</FONT><FONT COLOR=#00e9d3> </FONT><FONT COLOR=#00f1e2>:</FONT><FONT COLOR=#00f8f1>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")
				else
					usr.ki_control ++
					usr.ki_control_max ++
					usr.ki_control_mastered = 1
					usr << output("<center><FONT COLOR=#ff00ff>.</FONT><FONT COLOR=#ff10ff>:</FONT><FONT COLOR=#ff20ff>:</FONT><FONT COLOR=#ff30ff> </FONT><FONT COLOR=#ff40ff>K</FONT><FONT COLOR=#ff50ff>i</FONT><FONT COLOR=#ff60ff> </FONT><FONT COLOR=#ff70ff>C</FONT><FONT COLOR=#ff80ff>o</FONT><FONT COLOR=#ff90ff>n</FONT><FONT COLOR=#ffa0ff>t</FONT><FONT COLOR=#ffb0ff>r</FONT><FONT COLOR=#ffc0ff>o</FONT><FONT COLOR=#ffd0ff>l</FONT><FONT COLOR=#ffe0ff> </FONT><FONT COLOR=#fff0ff>S</FONT><FONT COLOR=#ffffff>k</FONT><FONT COLOR=#fff1ff>i</FONT><FONT COLOR=#ffe2ff>l</FONT><FONT COLOR=#ffd3ff>l</FONT><FONT COLOR=#ffc4ff> </FONT><FONT COLOR=#ffb5ff>M</FONT><FONT COLOR=#ffa6ff>A</FONT><FONT COLOR=#ff97ff>S</FONT><FONT COLOR=#ff88ff>T</FONT><FONT COLOR=#ff78ff>E</FONT><FONT COLOR=#ff69ff>R</FONT><FONT COLOR=#ff5aff>E</FONT><FONT COLOR=#ff4bff>D</FONT><FONT COLOR=#ff3cff>!</FONT><FONT COLOR=#ff2dff> </FONT><FONT COLOR=#ff1eff>:</FONT><FONT COLOR=#ff0fff>:</FONT><FONT COLOR=#ff00ff>.</FONT></center>","output2")

		Ki_Power_Level()
			if(!usr)return
			if(usr.ki_power_mastered == 1)
				return
			if(usr.ki_pow_exp >= usr.ki_pow_tnl)
				if(usr.ki_power_max < 99)
					usr.ki_pow_exp -= usr.ki_pow_tnl
					usr.ki_pow_tnl += round(usr.ki_pow_tnl * 0.1)
					usr.ki_power ++
					usr.ki_power_max ++
					usr << output("<center><FONT COLOR=#800080>.</FONT><FONT COLOR=#790880>:</FONT><FONT COLOR=#711080>:</FONT><FONT COLOR=#691880> </FONT><FONT COLOR=#612080>K</FONT><FONT COLOR=#592880>i</FONT><FONT COLOR=#513080> </FONT><FONT COLOR=#493880>P</FONT><FONT COLOR=#414180>o</FONT><FONT COLOR=#384980>w</FONT><FONT COLOR=#305180>e</FONT><FONT COLOR=#285980>r</FONT><FONT COLOR=#206180> </FONT><FONT COLOR=#186980>S</FONT><FONT COLOR=#107180>k</FONT><FONT COLOR=#087980>i</FONT><FONT COLOR=#008080>l</FONT><FONT COLOR=#087980>l</FONT><FONT COLOR=#107180> </FONT><FONT COLOR=#186980>I</FONT><FONT COLOR=#206180>n</FONT><FONT COLOR=#285980>c</FONT><FONT COLOR=#305180>r</FONT><FONT COLOR=#384980>e</FONT><FONT COLOR=#414180>a</FONT><FONT COLOR=#493880>s</FONT><FONT COLOR=#513080>e</FONT><FONT COLOR=#592880>d</FONT><FONT COLOR=#612080>!</FONT><FONT COLOR=#691880> </FONT><FONT COLOR=#711080>:</FONT><FONT COLOR=#790880>:</FONT><FONT COLOR=#800080>.</FONT></center>","output2")
				else
					usr.ki_power ++
					usr.ki_power_max ++
					usr.ki_power_mastered = 1
					usr << output("<center><FONT COLOR=#00ff00>.</FONT><FONT COLOR=#11ef00>:</FONT><FONT COLOR=#22de00>:</FONT><FONT COLOR=#33cd00> </FONT><FONT COLOR=#44bc00>K</FONT><FONT COLOR=#55ab00>i</FONT><FONT COLOR=#669a00> </FONT><FONT COLOR=#778900>P</FONT><FONT COLOR=#897700>o</FONT><FONT COLOR=#9a6600>w</FONT><FONT COLOR=#ab5500>e</FONT><FONT COLOR=#bc4400>r</FONT><FONT COLOR=#cd3300> </FONT><FONT COLOR=#de2200>S</FONT><FONT COLOR=#ef1100>k</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#f01000>l</FONT><FONT COLOR=#e02000>l</FONT><FONT COLOR=#d03000> </FONT><FONT COLOR=#c04000>M</FONT><FONT COLOR=#b05000>A</FONT><FONT COLOR=#a06000>S</FONT><FONT COLOR=#907000>T</FONT><FONT COLOR=#808000>E</FONT><FONT COLOR=#709000>R</FONT><FONT COLOR=#60a000>E</FONT><FONT COLOR=#50b000>D</FONT><FONT COLOR=#40c000>!</FONT><FONT COLOR=#30d000> </FONT><FONT COLOR=#20e000>:</FONT><FONT COLOR=#10f000>:</FONT><FONT COLOR=#00ff00>.</FONT></center>","output2")

		Ki_Use_Level()
			if(!usr)return
			if(usr.ki_use_mastered == 1)
				return
			if(usr.ki_use_exp >= usr.ki_use_tnl)
				if(usr.ki_use_max < 99)
					usr.kiuse -= 1
					usr.ki_use_exp -= usr.ki_use_tnl
					usr.ki_use_tnl += round(usr.ki_use_tnl * 0.1)
					usr.ki_use ++
					usr.ki_use_max ++
					usr << output("<center><FONT COLOR=#800000>.</FONT><FONT COLOR=#790800>:</FONT><FONT COLOR=#711000>:</FONT><FONT COLOR=#691800> </FONT><FONT COLOR=#612000>K</FONT><FONT COLOR=#592800>i</FONT><FONT COLOR=#513000> </FONT><FONT COLOR=#493800>U</FONT><FONT COLOR=#414100>s</FONT><FONT COLOR=#384900>a</FONT><FONT COLOR=#305100>g</FONT><FONT COLOR=#285900>e</FONT><FONT COLOR=#206100> </FONT><FONT COLOR=#186900>S</FONT><FONT COLOR=#107100>k</FONT><FONT COLOR=#087900>i</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#087900>l</FONT><FONT COLOR=#107100> </FONT><FONT COLOR=#186900>I</FONT><FONT COLOR=#206100>n</FONT><FONT COLOR=#285900>c</FONT><FONT COLOR=#305100>r</FONT><FONT COLOR=#384900>e</FONT><FONT COLOR=#414100>a</FONT><FONT COLOR=#493800>s</FONT><FONT COLOR=#513000>e</FONT><FONT COLOR=#592800>d</FONT><FONT COLOR=#612000>!</FONT><FONT COLOR=#691800> </FONT><FONT COLOR=#711000>:</FONT><FONT COLOR=#790800>:</FONT><FONT COLOR=#800000>.</FONT></center>","output2")
				else
					usr.kiuse = 20
					usr.ki_use ++
					usr.ki_use_max ++
					usr.ki_use_mastered = 1
					usr << output("<center><FONT COLOR=#ffff00>.</FONT><FONT COLOR=#efff00>:</FONT><FONT COLOR=#deff00>:</FONT><FONT COLOR=#cdff00> </FONT><FONT COLOR=#bcff00>K</FONT><FONT COLOR=#abff00>i</FONT><FONT COLOR=#9aff00> </FONT><FONT COLOR=#89ff00>U</FONT><FONT COLOR=#77ff00>s</FONT><FONT COLOR=#66ff00>a</FONT><FONT COLOR=#55ff00>g</FONT><FONT COLOR=#44ff00>e</FONT><FONT COLOR=#33ff00> </FONT><FONT COLOR=#22ff00>S</FONT><FONT COLOR=#11ff00>k</FONT><FONT COLOR=#00ff00>i</FONT><FONT COLOR=#10ff00>l</FONT><FONT COLOR=#20ff00>l</FONT><FONT COLOR=#30ff00> </FONT><FONT COLOR=#40ff00>M</FONT><FONT COLOR=#50ff00>A</FONT><FONT COLOR=#60ff00>S</FONT><FONT COLOR=#70ff00>T</FONT><FONT COLOR=#80ff00>E</FONT><FONT COLOR=#90ff00>R</FONT><FONT COLOR=#a0ff00>E</FONT><FONT COLOR=#b0ff00>D</FONT><FONT COLOR=#c0ff00>!</FONT><FONT COLOR=#d0ff00> </FONT><FONT COLOR=#e0ff00>:</FONT><FONT COLOR=#f0ff00>:</FONT><FONT COLOR=#ffff00>.</FONT></center>","output2")

		Ki_Cast_Level()
			if(!usr)return
			if(usr.ki_cast_mastered == 1)
				return
			if(usr.ki_cast_exp >= usr.ki_cast_tnl)
				if(usr.ki_cast_max < 99)
			//		usr.kicast += 1
					usr.ki_cast_exp -= usr.ki_cast_tnl
					usr.ki_cast_tnl += round(usr.ki_cast_tnl * 0.1)
					usr.ki_cast ++
					usr.ki_cast_max ++
					usr << output("<center><FONT COLOR=#2f4f4f>.</FONT><FONT COLOR=#2d524b>:</FONT><FONT COLOR=#2a5645>:</FONT><FONT COLOR=#265940> </FONT><FONT COLOR=#235c3b>K</FONT><FONT COLOR=#206035>i</FONT><FONT COLOR=#1d6330> </FONT><FONT COLOR=#1a662b>C</FONT><FONT COLOR=#166a25>a</FONT><FONT COLOR=#136d20>s</FONT><FONT COLOR=#10701b>t</FONT><FONT COLOR=#0d7415> </FONT><FONT COLOR=#0a7710>S</FONT><FONT COLOR=#067a0b>k</FONT><FONT COLOR=#037e05>i</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#037e05>l</FONT><FONT COLOR=#067a0b> </FONT><FONT COLOR=#0a7710>I</FONT><FONT COLOR=#0d7415>n</FONT><FONT COLOR=#10701b>c</FONT><FONT COLOR=#136d20>r</FONT><FONT COLOR=#166a25>e</FONT><FONT COLOR=#1a662b>a</FONT><FONT COLOR=#1d6330>s</FONT><FONT COLOR=#206035>e</FONT><FONT COLOR=#235c3b>d</FONT><FONT COLOR=#265940> </FONT><FONT COLOR=#2a5645>:</FONT><FONT COLOR=#2d524b>:</FONT><FONT COLOR=#2f4f4f>.</FONT></center>","output2")
				else
					usr.ki_cast ++
					usr.ki_cast_max ++
					usr.ki_cast_mastered = 1
					usr << output("<center><FONT COLOR=#4b0082>.</FONT><FONT COLOR=#500e7e>:</FONT><FONT COLOR=#561b78>:</FONT><FONT COLOR=#5b2973> </FONT><FONT COLOR=#60376d>K</FONT><FONT COLOR=#664568>i</FONT><FONT COLOR=#6b5263> </FONT><FONT COLOR=#70605d>C</FONT><FONT COLOR=#766e58>a</FONT><FONT COLOR=#7b7c52>s</FONT><FONT COLOR=#80894d>t</FONT><FONT COLOR=#869748> </FONT><FONT COLOR=#8ba542>S</FONT><FONT COLOR=#90b33d>k</FONT><FONT COLOR=#96c037>i</FONT><FONT COLOR=#9acd32>l</FONT><FONT COLOR=#96c037>l</FONT><FONT COLOR=#90b33d> </FONT><FONT COLOR=#8ba542>M</FONT><FONT COLOR=#869748>A</FONT><FONT COLOR=#80894d>S</FONT><FONT COLOR=#7b7c52>T</FONT><FONT COLOR=#766e58>E</FONT><FONT COLOR=#70605d>R</FONT><FONT COLOR=#6b5263>E</FONT><FONT COLOR=#664568>D</FONT><FONT COLOR=#60376d>!</FONT><FONT COLOR=#5b2973> </FONT><FONT COLOR=#561b78>:</FONT><FONT COLOR=#500e7e>:</FONT><FONT COLOR=#4b0082>.</FONT></center>","output2")

		Ki_Res_Level()
			if(!usr)return
			if(usr.ki_res_mastered == 1)
				return
			if(usr.ki_res_exp >= usr.ki_res_tnl)
				if(usr.ki_res_max < 99)
					if(usr.ki_res_max >= 49)
						if(!usr.ki_shield_learn)
							usr.ki_shield_learn = 1
							usr.contents += new/obj/Technique/KiShield
							usr << output("<center><font color = white> .:: You learn Ki Shield ::.</font></center>","output2")
							usr << "<center><font color = white> .:: You learn Ki Shield ::.</font></center>"
					usr.ki_res_exp -= usr.ki_res_tnl
					usr.ki_res_tnl += round(usr.ki_res_tnl * 0.1)
					usr.ki_res ++
					usr.ki_res_max ++
					usr << output("<center><FONT COLOR=#bc8f8f>.</FONT><FONT COLOR=#b38f8f>:</FONT><FONT COLOR=#a88e8e>:</FONT><FONT COLOR=#9e8d8d> </FONT><FONT COLOR=#938c8c>K</FONT><FONT COLOR=#898c8c>i</FONT><FONT COLOR=#7e8b8b> </FONT><FONT COLOR=#748a8a>R</FONT><FONT COLOR=#698989>e</FONT><FONT COLOR=#5f8888>s</FONT><FONT COLOR=#548787>i</FONT><FONT COLOR=#4a8686>s</FONT><FONT COLOR=#3f8585>t</FONT><FONT COLOR=#358484>a</FONT><FONT COLOR=#2a8484>n</FONT><FONT COLOR=#208383>c</FONT><FONT COLOR=#158282>e</FONT><FONT COLOR=#0b8181> </FONT><FONT COLOR=#008080>S</FONT><FONT COLOR=#0b8181>k</FONT><FONT COLOR=#158282>i</FONT><FONT COLOR=#208383>l</FONT><FONT COLOR=#2a8484>l</FONT><FONT COLOR=#358484> </FONT><FONT COLOR=#3f8585>I</FONT><FONT COLOR=#4a8686>n</FONT><FONT COLOR=#548787>c</FONT><FONT COLOR=#5f8888>r</FONT><FONT COLOR=#698989>e</FONT><FONT COLOR=#748a8a>a</FONT><FONT COLOR=#7e8b8b>s</FONT><FONT COLOR=#898c8c>e</FONT><FONT COLOR=#938c8c>d</FONT><FONT COLOR=#9e8d8d> </FONT><FONT COLOR=#a88e8e>:</FONT><FONT COLOR=#b38f8f>:</FONT><FONT COLOR=#bc8f8f>.</FONT></center>","output2")
				else
					if(usr.learn_kiabsorb == 0)
						usr.learn_kiabsorb = 1
						usr.contents += new/obj/Technique/KiAbsorb
						usr << output("<center><font color = white> .:: You learn Ki Absorb ::.</font></center>","output2")
				//	usr.ki_res = 100
				//	usr.ki_res_max = 100
					usr.ki_res_mastered = 1
					usr.ki_res ++
					usr.ki_res_max ++
					usr << output("<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#0fff78>:</FONT><FONT COLOR=#1eff71>:</FONT><FONT COLOR=#2dff69> </FONT><FONT COLOR=#3cff62>K</FONT><FONT COLOR=#4bff5a>i</FONT><FONT COLOR=#5aff53> </FONT><FONT COLOR=#69ff4b>R</FONT><FONT COLOR=#78ff44>e</FONT><FONT COLOR=#88ff3c>s</FONT><FONT COLOR=#97ff35>i</FONT><FONT COLOR=#a6ff2d>s</FONT><FONT COLOR=#b5ff26>t</FONT><FONT COLOR=#c4ff1e>a</FONT><FONT COLOR=#d3ff17>n</FONT><FONT COLOR=#e2ff0f>c</FONT><FONT COLOR=#f1ff08>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#f2ff07>S</FONT><FONT COLOR=#e4ff0e>k</FONT><FONT COLOR=#d5ff15>i</FONT><FONT COLOR=#c7ff1c>l</FONT><FONT COLOR=#b9ff24>l</FONT><FONT COLOR=#abff2b> </FONT><FONT COLOR=#9cff32>M</FONT><FONT COLOR=#8eff39>A</FONT><FONT COLOR=#80ff40>S</FONT><FONT COLOR=#72ff47>T</FONT><FONT COLOR=#64ff4e>E</FONT><FONT COLOR=#55ff55>R</FONT><FONT COLOR=#47ff5c>E</FONT><FONT COLOR=#39ff64>D</FONT><FONT COLOR=#2bff6b> </FONT><FONT COLOR=#1cff72>:</FONT><FONT COLOR=#0eff79>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>","output2")
					usr << "<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#0fff78>:</FONT><FONT COLOR=#1eff71>:</FONT><FONT COLOR=#2dff69> </FONT><FONT COLOR=#3cff62>K</FONT><FONT COLOR=#4bff5a>i</FONT><FONT COLOR=#5aff53> </FONT><FONT COLOR=#69ff4b>R</FONT><FONT COLOR=#78ff44>e</FONT><FONT COLOR=#88ff3c>s</FONT><FONT COLOR=#97ff35>i</FONT><FONT COLOR=#a6ff2d>s</FONT><FONT COLOR=#b5ff26>t</FONT><FONT COLOR=#c4ff1e>a</FONT><FONT COLOR=#d3ff17>n</FONT><FONT COLOR=#e2ff0f>c</FONT><FONT COLOR=#f1ff08>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#f2ff07>S</FONT><FONT COLOR=#e4ff0e>k</FONT><FONT COLOR=#d5ff15>i</FONT><FONT COLOR=#c7ff1c>l</FONT><FONT COLOR=#b9ff24>l</FONT><FONT COLOR=#abff2b> </FONT><FONT COLOR=#9cff32>M</FONT><FONT COLOR=#8eff39>A</FONT><FONT COLOR=#80ff40>S</FONT><FONT COLOR=#72ff47>T</FONT><FONT COLOR=#64ff4e>E</FONT><FONT COLOR=#55ff55>R</FONT><FONT COLOR=#47ff5c>E</FONT><FONT COLOR=#39ff64>D</FONT><FONT COLOR=#2bff6b> </FONT><FONT COLOR=#1cff72>:</FONT><FONT COLOR=#0eff79>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>"



		Reflect_Level()
			if(!usr)return
			if(usr.reflect_mastered == 1)
				return
			if(usr.reflect_exp >= usr.reflect_tnl)
				if(usr.reflect_max < 99)
					usr.reflect_exp -= usr.reflect_tnl
					usr.reflect_tnl += round(usr.reflect_tnl * 0.1)
					usr.reflect ++
					usr.reflect_max ++
					usr << output("<center><FONT COLOR=#ffffff>.</FONT><FONT COLOR=#efffff>:</FONT><FONT COLOR=#deffff>:</FONT><FONT COLOR=#cdffff> </FONT><FONT COLOR=#bcffff>D</FONT><FONT COLOR=#abffff>e</FONT><FONT COLOR=#9affff>f</FONT><FONT COLOR=#89ffff>l</FONT><FONT COLOR=#77ffff>e</FONT><FONT COLOR=#66ffff>c</FONT><FONT COLOR=#55ffff>t</FONT><FONT COLOR=#44ffff> </FONT><FONT COLOR=#33ffff>S</FONT><FONT COLOR=#22ffff>k</FONT><FONT COLOR=#11ffff>i</FONT><FONT COLOR=#00ffff>l</FONT><FONT COLOR=#10ffff>l</FONT><FONT COLOR=#20ffff> </FONT><FONT COLOR=#30ffff>I</FONT><FONT COLOR=#40ffff>n</FONT><FONT COLOR=#50ffff>c</FONT><FONT COLOR=#60ffff>r</FONT><FONT COLOR=#70ffff>e</FONT><FONT COLOR=#80ffff>a</FONT><FONT COLOR=#90ffff>s</FONT><FONT COLOR=#a0ffff>e</FONT><FONT COLOR=#b0ffff>d</FONT><FONT COLOR=#c0ffff>!</FONT><FONT COLOR=#d0ffff> </FONT><FONT COLOR=#e0ffff>:</FONT><FONT COLOR=#f0ffff>:</FONT><FONT COLOR=#ffffff>.</FONT></center>","output2")
				else
					usr.reflect ++
					usr.reflect_max ++
					usr.reflect_mastered = 1
					usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#09eff7>:</FONT><FONT COLOR=#11deef>:</FONT><FONT COLOR=#1acde6> </FONT><FONT COLOR=#22bcde>D</FONT><FONT COLOR=#2babd5>e</FONT><FONT COLOR=#349acd>f</FONT><FONT COLOR=#3c89c4>l</FONT><FONT COLOR=#4577bc>e</FONT><FONT COLOR=#4d66b3>c</FONT><FONT COLOR=#5655ab>t</FONT><FONT COLOR=#5f44a2> </FONT><FONT COLOR=#67339a>S</FONT><FONT COLOR=#702291>k</FONT><FONT COLOR=#781189>i</FONT><FONT COLOR=#800080>l</FONT><FONT COLOR=#781189>l</FONT><FONT COLOR=#702291> </FONT><FONT COLOR=#67339a>M</FONT><FONT COLOR=#5f44a2>A</FONT><FONT COLOR=#5655ab>S</FONT><FONT COLOR=#4d66b3>T</FONT><FONT COLOR=#4577bc>E</FONT><FONT COLOR=#3c89c4>R</FONT><FONT COLOR=#349acd>E</FONT><FONT COLOR=#2babd5>D</FONT><FONT COLOR=#22bcde>!</FONT><FONT COLOR=#1acde6> </FONT><FONT COLOR=#11deef>:</FONT><FONT COLOR=#09eff7>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")

		Weapon_Level()
			if(!usr)return
			if(usr.weapon_mastered == 1)
				return
			if(usr.weapon_exp >= usr.weapon_tnl)
				if(usr.weapon_max < 99)
					usr.weapon_exp -= usr.weapon_tnl
					usr.weapon_tnl += round(usr.weapon_tnl * 0.1)
					usr.weapon ++
					usr.weapon_max ++
					usr << output("<center><FONT COLOR=#0000cd>.</FONT><FONT COLOR=#0510cd>:</FONT><FONT COLOR=#0920ce>:</FONT><FONT COLOR=#0e30ce> </FONT><FONT COLOR=#1340ce>W</FONT><FONT COLOR=#1750ce>e</FONT><FONT COLOR=#1c60cf>a</FONT><FONT COLOR=#2171cf>p</FONT><FONT COLOR=#2581cf>o</FONT><FONT COLOR=#2a91d0>n</FONT><FONT COLOR=#2ea1d0> </FONT><FONT COLOR=#33b1d0>S</FONT><FONT COLOR=#38c1d0>k</FONT><FONT COLOR=#3cd1d0>i</FONT><FONT COLOR=#40e0d0>l</FONT><FONT COLOR=#3dd2d0>l</FONT><FONT COLOR=#38c3d0> </FONT><FONT COLOR=#34b4d0>I</FONT><FONT COLOR=#30a5d0>n</FONT><FONT COLOR=#2b96d0>c</FONT><FONT COLOR=#2787cf>r</FONT><FONT COLOR=#2378cf>e</FONT><FONT COLOR=#1e69cf>a</FONT><FONT COLOR=#1a5acf>s</FONT><FONT COLOR=#164bce>e</FONT><FONT COLOR=#113cce>d</FONT><FONT COLOR=#0d2dce> </FONT><FONT COLOR=#091ece>:</FONT><FONT COLOR=#040fcd>:</FONT><FONT COLOR=#0000cd>.</FONT></center>","output2")
				else
					usr.weapon ++
					usr.weapon_max ++
					usr.weapon_mastered =  1
					usr << output("<center><FONT COLOR=#add8e6>.</FONT><FONT COLOR=#a2cad7>:</FONT><FONT COLOR=#95bac6>:</FONT><FONT COLOR=#89abb6> </FONT><FONT COLOR=#7c9ba5>W</FONT><FONT COLOR=#708c95>e</FONT><FONT COLOR=#637c84>a</FONT><FONT COLOR=#576d74>p</FONT><FONT COLOR=#4b5d63>o</FONT><FONT COLOR=#3e4e53>n</FONT><FONT COLOR=#323e42> </FONT><FONT COLOR=#252f32>S</FONT><FONT COLOR=#191f21>k</FONT><FONT COLOR=#0c1011>i</FONT><FONT COLOR=#000000>l</FONT><FONT COLOR=#0c0e0f>l</FONT><FONT COLOR=#171d1f> </FONT><FONT COLOR=#232b2e>M</FONT><FONT COLOR=#2e3a3e>A</FONT><FONT COLOR=#3a484d>S</FONT><FONT COLOR=#46575c>T</FONT><FONT COLOR=#51656c>E</FONT><FONT COLOR=#5d747b>R</FONT><FONT COLOR=#68828b>E</FONT><FONT COLOR=#74919a>D</FONT><FONT COLOR=#809fa9>!</FONT><FONT COLOR=#8baeb9> </FONT><FONT COLOR=#97bcc8>:</FONT><FONT COLOR=#a2cbd8>:</FONT><FONT COLOR=#add8e6>.</FONT></center>","output2")

		Weapon_Power_Level()
			if(!usr)return
			if(usr.weapon_power_mastered == 1)
				return
			if(usr.weapon_power_exp >= usr.weapon_power_tnl)
				if(usr.weapon_power_max < 99)
					usr.weapon_power_exp -= usr.weapon_power_tnl
					usr.weapon_power_tnl += round(usr.weapon_power_tnl * 0.1)
					usr.weapon_power ++
					usr.weapon_power_max ++
					usr << output("<center><FONT COLOR=#228b22>.</FONT><FONT COLOR=#219229>:</FONT><FONT COLOR=#1f9830>:</FONT><FONT COLOR=#1d9f37> </FONT><FONT COLOR=#1ba53e>W</FONT><FONT COLOR=#19ac46>e</FONT><FONT COLOR=#17b34d>a</FONT><FONT COLOR=#15b954>p</FONT><FONT COLOR=#13c05b>o</FONT><FONT COLOR=#10c662>n</FONT><FONT COLOR=#0ecd69> </FONT><FONT COLOR=#0cd370>P</FONT><FONT COLOR=#0ada77>o</FONT><FONT COLOR=#08e17f>w</FONT><FONT COLOR=#06e786>e</FONT><FONT COLOR=#04ee8d>r</FONT><FONT COLOR=#02f494> </FONT><FONT COLOR=#00fa9a>S</FONT><FONT COLOR=#02f594>k</FONT><FONT COLOR=#04ef8e>i</FONT><FONT COLOR=#06e887>l</FONT><FONT COLOR=#08e280>l</FONT><FONT COLOR=#0adc79> </FONT><FONT COLOR=#0cd673>I</FONT><FONT COLOR=#0ecf6c>n</FONT><FONT COLOR=#10c965>c</FONT><FONT COLOR=#12c35f>r</FONT><FONT COLOR=#13bd58>e</FONT><FONT COLOR=#15b751>a</FONT><FONT COLOR=#17b04a>s</FONT><FONT COLOR=#19aa44>e</FONT><FONT COLOR=#1ba43d>d</FONT><FONT COLOR=#1d9e36> </FONT><FONT COLOR=#1f972f>:</FONT><FONT COLOR=#219129>:</FONT><FONT COLOR=#228b22>.</FONT> </center>","output2")
				else
					usr.weapon_power ++
					usr.weapon_power_max ++
					usr.weapon_power_mastered =  1
					usr << output("<center><FONT COLOR=#0000ff>.</FONT><FONT COLOR=#000ff8>:</FONT><FONT COLOR=#001ef1>:</FONT><FONT COLOR=#002de9> </FONT><FONT COLOR=#003ce2>W</FONT><FONT COLOR=#004bda>e</FONT><FONT COLOR=#005ad2>a</FONT><FONT COLOR=#0069cb>p</FONT><FONT COLOR=#0078c3>o</FONT><FONT COLOR=#0088bc>n</FONT><FONT COLOR=#0097b4> </FONT><FONT COLOR=#00a6ad>P</FONT><FONT COLOR=#00b5a5>o</FONT><FONT COLOR=#00c49d>w</FONT><FONT COLOR=#00d396>e</FONT><FONT COLOR=#00e28e>r</FONT><FONT COLOR=#00f187> </FONT><FONT COLOR=#00ff7f>S</FONT><FONT COLOR=#00f286>k</FONT><FONT COLOR=#00e48d>i</FONT><FONT COLOR=#00d595>l</FONT><FONT COLOR=#00c79c>l</FONT><FONT COLOR=#00b9a3> </FONT><FONT COLOR=#00abaa>M</FONT><FONT COLOR=#009cb1>A</FONT><FONT COLOR=#008eb8>S</FONT><FONT COLOR=#0080c0>T</FONT><FONT COLOR=#0072c7>E</FONT><FONT COLOR=#0064ce>R</FONT><FONT COLOR=#0055d5>E</FONT><FONT COLOR=#0047dc>D</FONT><FONT COLOR=#0039e3>!</FONT><FONT COLOR=#002beb> </FONT><FONT COLOR=#001cf2>:</FONT><FONT COLOR=#000ef9>:</FONT><FONT COLOR=#0000ff>.</FONT></center>","output2")

		Weapon_Res_Level()
			if(!usr)return
			if(usr.weapon_res_mastered == 1)
				return
			if(usr.weapon_res_exp >= usr.weapon_res_tnl)
				if(usr.weapon_resistance_max < 99)
					usr.weapon_res_exp -= usr.weapon_res_tnl
					usr.weapon_res_tnl += round(usr.weapon_res_tnl * 0.1)
					usr.weapon_resistance ++
					usr.weapon_resistance_max ++
					usr << output("<center><FONT COLOR=#000000>.</FONT><FONT COLOR=#0d0b0b>:</FONT><FONT COLOR=#1a1717>:</FONT><FONT COLOR=#262222> </FONT><FONT COLOR=#332e2d>W</FONT><FONT COLOR=#403939>e</FONT><FONT COLOR=#4d4544>a</FONT><FONT COLOR=#5a504f>p</FONT><FONT COLOR=#665c5a>o</FONT><FONT COLOR=#736766>n</FONT><FONT COLOR=#807371> </FONT><FONT COLOR=#8d7e7c>R</FONT><FONT COLOR=#9a8988>e</FONT><FONT COLOR=#a69593>s</FONT><FONT COLOR=#b3a09e>i</FONT><FONT COLOR=#c0acaa>s</FONT><FONT COLOR=#cdb7b5>t</FONT><FONT COLOR=#dac3c0>a</FONT><FONT COLOR=#e6cecb>n</FONT><FONT COLOR=#f3dad7>c</FONT><FONT COLOR=#ffe4e1>e</FONT><FONT COLOR=#f3dad7> </FONT><FONT COLOR=#e6cecb>S</FONT><FONT COLOR=#dac3c0>k</FONT><FONT COLOR=#cdb7b5>i</FONT><FONT COLOR=#c0acaa>l</FONT><FONT COLOR=#b3a09e>l</FONT><FONT COLOR=#a69593> </FONT><FONT COLOR=#9a8988>I</FONT><FONT COLOR=#8d7e7c>n</FONT><FONT COLOR=#807371>c</FONT><FONT COLOR=#736766>r</FONT><FONT COLOR=#665c5a>e</FONT><FONT COLOR=#5a504f>a</FONT><FONT COLOR=#4d4544>s</FONT><FONT COLOR=#403939>e</FONT><FONT COLOR=#332e2d>d</FONT><FONT COLOR=#262222> </FONT><FONT COLOR=#1a1717>:</FONT><FONT COLOR=#0d0b0b>:</FONT><FONT COLOR=#000000>.</FONT></center>","output2")
				else
					usr.weapon_resistance ++
					usr.weapon_resistance_max ++
					usr.weapon_res_mastered =  1
					usr << output("<center><FONT COLOR=#f5f5f5>.</FONT><FONT COLOR=#f1eaea>:</FONT><FONT COLOR=#ebdddd>:</FONT><FONT COLOR=#e6d1d1> </FONT><FONT COLOR=#e1c5c5>W</FONT><FONT COLOR=#dbb9b9>e</FONT><FONT COLOR=#d6acac>a</FONT><FONT COLOR=#d1a0a0>p</FONT><FONT COLOR=#cb9494>o</FONT><FONT COLOR=#c68787>n</FONT><FONT COLOR=#c17b7b> </FONT><FONT COLOR=#bb6f6f>R</FONT><FONT COLOR=#b66262>e</FONT><FONT COLOR=#b05656>s</FONT><FONT COLOR=#ab4a4a>i</FONT><FONT COLOR=#a63e3e>s</FONT><FONT COLOR=#a03131>t</FONT><FONT COLOR=#9b2525>a</FONT><FONT COLOR=#961919>n</FONT><FONT COLOR=#900c0c>c</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#900c0c> </FONT><FONT COLOR=#961919>S</FONT><FONT COLOR=#9b2525>k</FONT><FONT COLOR=#a03131>i</FONT><FONT COLOR=#a63e3e>l</FONT><FONT COLOR=#ab4a4a>l</FONT><FONT COLOR=#b05656> </FONT><FONT COLOR=#b66262>M</FONT><FONT COLOR=#bb6f6f>A</FONT><FONT COLOR=#c17b7b>S</FONT><FONT COLOR=#c68787>T</FONT><FONT COLOR=#cb9494>E</FONT><FONT COLOR=#d1a0a0>R</FONT><FONT COLOR=#d6acac>E</FONT><FONT COLOR=#dbb9b9>D</FONT><FONT COLOR=#e1c5c5>!</FONT><FONT COLOR=#e6d1d1> </FONT><FONT COLOR=#ebdddd>:</FONT><FONT COLOR=#f1eaea>:</FONT><FONT COLOR=#f5f5f5>.</FONT></center>","output2")



/*


mob
	proc
		Melee_Level()
			if(!usr)return
			if(usr.melee_exp >= usr.melee_tnl)
				if(usr.melee_max <= 98)
					usr.melee_exp -= usr.melee_tnl
					usr.melee_tnl += round(usr.melee_tnl * 0.1)
					usr.melee ++
					usr.melee_max ++
					usr << output("<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#08f57e>:</FONT><FONT COLOR=#0fea7d>:</FONT><FONT COLOR=#17e07b> </FONT><FONT COLOR=#1ed579>M</FONT><FONT COLOR=#26ca78>e</FONT><FONT COLOR=#2dbf76>l</FONT><FONT COLOR=#35b575>e</FONT><FONT COLOR=#3daa73>e</FONT><FONT COLOR=#449f71> </FONT><FONT COLOR=#4c9470>S</FONT><FONT COLOR=#53896e>k</FONT><FONT COLOR=#5b7f6c>i</FONT><FONT COLOR=#62746b>l</FONT><FONT COLOR=#696969>l</FONT><FONT COLOR=#63736b> </FONT><FONT COLOR=#5c7d6c>I</FONT><FONT COLOR=#55876e>n</FONT><FONT COLOR=#4e916f>c</FONT><FONT COLOR=#479b71>r</FONT><FONT COLOR=#40a572>e</FONT><FONT COLOR=#39af74>a</FONT><FONT COLOR=#31ba75>s</FONT><FONT COLOR=#2ac477>e</FONT><FONT COLOR=#23ce78>d</FONT><FONT COLOR=#1cd87a>!</FONT><FONT COLOR=#15e27b> </FONT><FONT COLOR=#0eec7d>:</FONT><FONT COLOR=#07f67e>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>","output2")
				else
					if(usr.melee_mastered == 1)
						return
					else
						usr.melee = 100
						usr.melee_max = 100
						usr.melee_mastered =  1
						usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#00f7ee>:</FONT><FONT COLOR=#00eedb>:</FONT><FONT COLOR=#00e5c9> </FONT><FONT COLOR=#00dbb7>M</FONT><FONT COLOR=#00d2a5>e</FONT><FONT COLOR=#00c992>l</FONT><FONT COLOR=#00c080>e</FONT><FONT COLOR=#00b76e>e</FONT><FONT COLOR=#00ae5b> </FONT><FONT COLOR=#00a549>S</FONT><FONT COLOR=#009b37>k</FONT><FONT COLOR=#009225>i</FONT><FONT COLOR=#008912>l</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#008912> </FONT><FONT COLOR=#009225>M</FONT><FONT COLOR=#009b37>A</FONT><FONT COLOR=#00a549>S</FONT><FONT COLOR=#00ae5b>T</FONT><FONT COLOR=#00b76e>E</FONT><FONT COLOR=#00c080>R</FONT><FONT COLOR=#00c992>E</FONT><FONT COLOR=#00d2a5>D</FONT><FONT COLOR=#00dbb7>!</FONT><FONT COLOR=#00e5c9> </FONT><FONT COLOR=#00eedb>:</FONT><FONT COLOR=#00f7ee>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")

		Block_Level()
			if(!usr)return
			if(usr.block_exp >= block_tnl)
				if(usr.block_max <= 98)
					usr.block_exp -= usr.block_tnl
					usr.block_tnl += round(usr.block_tnl * 0.1)
					usr.block ++
					usr.block_max ++
					usr << output("<center><FONT COLOR=#ff1493>.</FONT><FONT COLOR=#f31793>:</FONT><FONT COLOR=#e61a93>:</FONT><FONT COLOR=#d91d92> </FONT><FONT COLOR=#cb2091>B</FONT><FONT COLOR=#be2391>l</FONT><FONT COLOR=#b12690>o</FONT><FONT COLOR=#a42990>c</FONT><FONT COLOR=#972c8f>k</FONT><FONT COLOR=#8a2f8e> </FONT><FONT COLOR=#7d328e>S</FONT><FONT COLOR=#6f358d>k</FONT><FONT COLOR=#62388c>i</FONT><FONT COLOR=#553b8c>l</FONT><FONT COLOR=#483d8b>l</FONT><FONT COLOR=#543b8c> </FONT><FONT COLOR=#61388c>I</FONT><FONT COLOR=#6d368d>n</FONT><FONT COLOR=#79338d>c</FONT><FONT COLOR=#85308e>r</FONT><FONT COLOR=#922d8f>e</FONT><FONT COLOR=#9e2a8f>a</FONT><FONT COLOR=#aa2890>s</FONT><FONT COLOR=#b62590>e</FONT><FONT COLOR=#c32291>d</FONT><FONT COLOR=#cf1f92>!</FONT><FONT COLOR=#db1c92> </FONT><FONT COLOR=#e71a93>:</FONT><FONT COLOR=#f41793>:</FONT><FONT COLOR=#ff1493>.</FONT></center>","output2")
				else
					if(usr.block_mastered == 1)
						return
					else
						usr.block = 100
						usr.block_max = 100
						usr.block_mastered = 1
						usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#121187>:</FONT><FONT COLOR=#24228f>:</FONT><FONT COLOR=#363496> </FONT><FONT COLOR=#48459d>B</FONT><FONT COLOR=#5a56a5>l</FONT><FONT COLOR=#6c67ac>o</FONT><FONT COLOR=#7d79b4>c</FONT><FONT COLOR=#8f8abb>k</FONT><FONT COLOR=#a19bc2> </FONT><FONT COLOR=#b3acca>S</FONT><FONT COLOR=#c5bdd1>k</FONT><FONT COLOR=#d7cfd8>i</FONT><FONT COLOR=#e9e0e0>l</FONT><FONT COLOR=#faf0e6>l</FONT><FONT COLOR=#e9e0e0> </FONT><FONT COLOR=#d7cfd8>M</FONT><FONT COLOR=#c5bdd1>A</FONT><FONT COLOR=#b3acca>S</FONT><FONT COLOR=#a19bc2>T</FONT><FONT COLOR=#8f8abb>E</FONT><FONT COLOR=#7d79b4>R</FONT><FONT COLOR=#6c67ac>E</FONT><FONT COLOR=#5a56a5>D</FONT><FONT COLOR=#48459d>!</FONT><FONT COLOR=#363496> </FONT><FONT COLOR=#24228f>:</FONT><FONT COLOR=#121187>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Dodge_Level()
			if(!usr)return
			if(usr.dodge_exp >= dodge_tnl)
				if(usr.dodge_max <= 98)
					usr.dodge_exp -= usr.dodge_tnl
					usr.dodge_tnl += round(usr.dodge_tnl * 0.1)
					usr.dodge ++
					usr.dodge_max ++
					usr << output("<center><FONT COLOR=#ffb6c1>.</FONT><FONT COLOR=#eeb8c2>:</FONT><FONT COLOR=#dbbac3>:</FONT><FONT COLOR=#c9bbc5> </FONT><FONT COLOR=#b7bdc6>D</FONT><FONT COLOR=#a5bfc7>o</FONT><FONT COLOR=#92c1c8>d</FONT><FONT COLOR=#80c3ca>g</FONT><FONT COLOR=#6ec4cb>e</FONT><FONT COLOR=#5bc6cc> </FONT><FONT COLOR=#49c8cd>S</FONT><FONT COLOR=#37cace>k</FONT><FONT COLOR=#25cbd0>i</FONT><FONT COLOR=#12cdd1>l</FONT><FONT COLOR=#00ced1>l</FONT><FONT COLOR=#11cdd1> </FONT><FONT COLOR=#22ccd0>I</FONT><FONT COLOR=#33cacf>n</FONT><FONT COLOR=#44c8cd>c</FONT><FONT COLOR=#55c7cc>r</FONT><FONT COLOR=#66c5cb>e</FONT><FONT COLOR=#77c3ca>a</FONT><FONT COLOR=#89c2c9>s</FONT><FONT COLOR=#9ac0c8>e</FONT><FONT COLOR=#abbec7>d</FONT><FONT COLOR=#bcbdc6>!</FONT><FONT COLOR=#cdbbc4> </FONT><FONT COLOR=#deb9c3>:</FONT><FONT COLOR=#efb8c2>:</FONT><FONT COLOR=#ffb6c1>.</FONT></center>","output2")
				else
					if(usr.dodge_mastered == 1)
						return
					else
						usr.dodge = 100
						usr.dodge_max = 100
						usr.dodge_mastered = 1
						usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f40803>:</FONT><FONT COLOR=#e80f07>:</FONT><FONT COLOR=#db170a> </FONT><FONT COLOR=#cf1f0e>D</FONT><FONT COLOR=#c32711>o</FONT><FONT COLOR=#b72e15>d</FONT><FONT COLOR=#ab3618>g</FONT><FONT COLOR=#9e3e1b>e</FONT><FONT COLOR=#92451f> </FONT><FONT COLOR=#864d22>S</FONT><FONT COLOR=#7a5526>k</FONT><FONT COLOR=#6d5d29>i</FONT><FONT COLOR=#61642d>l</FONT><FONT COLOR=#556b2f>l</FONT><FONT COLOR=#61642d> </FONT><FONT COLOR=#6d5d29>M</FONT><FONT COLOR=#7a5526>A</FONT><FONT COLOR=#864d22>S</FONT><FONT COLOR=#92451f>T</FONT><FONT COLOR=#9e3e1b>E</FONT><FONT COLOR=#ab3618>R</FONT><FONT COLOR=#b72e15>E</FONT><FONT COLOR=#c32711>D</FONT><FONT COLOR=#cf1f0e>!</FONT><FONT COLOR=#db170a> </FONT><FONT COLOR=#e80f07>:</FONT><FONT COLOR=#f40803>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")

		Counter_Level()
			if(!usr)return
			if(usr.count_exp >= usr.count_tnl)
				if(usr.counter_max <= 98)
					usr.count_exp -= usr.count_tnl
					usr.count_tnl += round(usr.count_tnl * 0.1)
					usr.counter ++
					usr.counter_max ++
					usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#f6090a>:</FONT><FONT COLOR=#ed1113>:</FONT><FONT COLOR=#e31a1d> </FONT><FONT COLOR=#da2227>C</FONT><FONT COLOR=#d02b30>o</FONT><FONT COLOR=#c6343a>u</FONT><FONT COLOR=#bd3c44>n</FONT><FONT COLOR=#b3454d>t</FONT><FONT COLOR=#aa4d57>e</FONT><FONT COLOR=#a05661>r</FONT><FONT COLOR=#965f6a> </FONT><FONT COLOR=#8d6774>S</FONT><FONT COLOR=#83707e>k</FONT><FONT COLOR=#7a7887>i</FONT><FONT COLOR=#708090>l</FONT><FONT COLOR=#797988>l</FONT><FONT COLOR=#82717f> </FONT><FONT COLOR=#8b6976>I</FONT><FONT COLOR=#94616d>n</FONT><FONT COLOR=#9d5964>c</FONT><FONT COLOR=#a6515b>r</FONT><FONT COLOR=#af4952>e</FONT><FONT COLOR=#b84149>a</FONT><FONT COLOR=#c1383f>s</FONT><FONT COLOR=#ca3036>e</FONT><FONT COLOR=#d3282d>d</FONT><FONT COLOR=#dc2024>!</FONT><FONT COLOR=#e5181b> </FONT><FONT COLOR=#ee1012>:</FONT><FONT COLOR=#f70809>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")
				else
					if(usr.counter_mastered == 1)
						return
					else
						usr.counter = 100
						usr.counter_max = 100
						usr.counter_mastered = 1
						usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#090078>:</FONT><FONT COLOR=#130070>:</FONT><FONT COLOR=#1c0067> </FONT><FONT COLOR=#25005f>C</FONT><FONT COLOR=#2f0056>o</FONT><FONT COLOR=#38004d>u</FONT><FONT COLOR=#410045>n</FONT><FONT COLOR=#4b003c>t</FONT><FONT COLOR=#540034>e</FONT><FONT COLOR=#5d002b>r</FONT><FONT COLOR=#670022> </FONT><FONT COLOR=#70001a>S</FONT><FONT COLOR=#790011>k</FONT><FONT COLOR=#830009>i</FONT><FONT COLOR=#8b0000>l</FONT><FONT COLOR=#830009>l</FONT><FONT COLOR=#790011> </FONT><FONT COLOR=#70001a>M</FONT><FONT COLOR=#670022>A</FONT><FONT COLOR=#5d002b>S</FONT><FONT COLOR=#540034>T</FONT><FONT COLOR=#4b003c>E</FONT><FONT COLOR=#410045>R</FONT><FONT COLOR=#38004d>E</FONT><FONT COLOR=#2f0056>D</FONT><FONT COLOR=#25005f>!</FONT><FONT COLOR=#1c0067> </FONT><FONT COLOR=#130070>:</FONT><FONT COLOR=#090078>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Critical_Level()
			if(!usr)return
			if(usr.crit_exp >= usr.crit_tnl)
				if(usr.critical_max <= 98)
					usr.crit_exp -= usr.crit_tnl
					usr.crit_tnl += round(usr.crit_tnl * 0.1)
					usr.critical ++
					usr.critical_max ++
					usr << output("<center><FONT COLOR=#ff0000>.</FONT><FONT COLOR=#fe0104>:</FONT><FONT COLOR=#fc0308>:</FONT><FONT COLOR=#f9040b> </FONT><FONT COLOR=#f7050f>C</FONT><FONT COLOR=#f50713>r</FONT><FONT COLOR=#f30817>i</FONT><FONT COLOR=#f0091b>t</FONT><FONT COLOR=#ee0b1f>i</FONT><FONT COLOR=#ec0c22>c</FONT><FONT COLOR=#ea0d26>a</FONT><FONT COLOR=#e70e2a>l</FONT><FONT COLOR=#e5102e> </FONT><FONT COLOR=#e31132>S</FONT><FONT COLOR=#e11235>k</FONT><FONT COLOR=#de1439>i</FONT><FONT COLOR=#dc143c>l</FONT><FONT COLOR=#de1439>l</FONT><FONT COLOR=#e11235> </FONT><FONT COLOR=#e31132>I</FONT><FONT COLOR=#e5102e>n</FONT><FONT COLOR=#e70e2a>c</FONT><FONT COLOR=#ea0d26>r</FONT><FONT COLOR=#ec0c22>e</FONT><FONT COLOR=#ee0b1f>a</FONT><FONT COLOR=#f0091b>s</FONT><FONT COLOR=#f30817>e</FONT><FONT COLOR=#f50713>d</FONT><FONT COLOR=#f7050f>!</FONT><FONT COLOR=#f9040b> </FONT><FONT COLOR=#fc0308>:</FONT><FONT COLOR=#fe0104>:</FONT><FONT COLOR=#ff0000>.</FONT></center>","output2")
				else
					if(usr.critical_mastered == 1)
						return
					else
						usr.critical = 100
						usr.critical_max = 100
						usr.critical_mastered = 1
						usr << output("<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#001189>:</FONT><FONT COLOR=#002291>:</FONT><FONT COLOR=#00339a> </FONT><FONT COLOR=#0044a2>C</FONT><FONT COLOR=#0055ab>r</FONT><FONT COLOR=#0066b3>i</FONT><FONT COLOR=#0077bc>t</FONT><FONT COLOR=#0089c4>i</FONT><FONT COLOR=#009acd>c</FONT><FONT COLOR=#00abd5>a</FONT><FONT COLOR=#00bcde>l</FONT><FONT COLOR=#00cde6> </FONT><FONT COLOR=#00deef>S</FONT><FONT COLOR=#00eff7>k</FONT><FONT COLOR=#00ffff>i</FONT><FONT COLOR=#00f0f8>l</FONT><FONT COLOR=#00e0f0>l</FONT><FONT COLOR=#00d0e8> </FONT><FONT COLOR=#00c0e0>M</FONT><FONT COLOR=#00b0d8>A</FONT><FONT COLOR=#00a0d0>S</FONT><FONT COLOR=#0090c8>T</FONT><FONT COLOR=#0080c0>E</FONT><FONT COLOR=#0070b8>R</FONT><FONT COLOR=#0060b0>E</FONT><FONT COLOR=#0050a8>D</FONT><FONT COLOR=#0040a0>!</FONT><FONT COLOR=#003098> </FONT><FONT COLOR=#002090>:</FONT><FONT COLOR=#001088>:</FONT><FONT COLOR=#000080>.</FONT></center>","output2")

		Durability_Level()
			if(!usr)return
			if(usr.durability_exp >= usr.durability_tnl)
				if(usr.durability_max <= 98)
					usr.durability_exp -= usr.durability_tnl
					usr.durability_tnl += round(usr.durability_tnl * 0.1)
					usr.durability ++
					usr.durability_max ++
					usr << output("<center><FONT COLOR=#9370db>.</FONT><FONT COLOR=#9a79db>:</FONT><FONT COLOR=#a182dc>:</FONT><FONT COLOR=#a78bdc> </FONT><FONT COLOR=#ae94dd>D</FONT><FONT COLOR=#b59ddd>u</FONT><FONT COLOR=#bca6dd>r</FONT><FONT COLOR=#c3afde>a</FONT><FONT COLOR=#cab8de>b</FONT><FONT COLOR=#d0c1de>i</FONT><FONT COLOR=#d7cadf>l</FONT><FONT COLOR=#ded3df>i</FONT><FONT COLOR=#e5dce0>t</FONT><FONT COLOR=#ece5e0>y</FONT><FONT COLOR=#f2eee0> </FONT><FONT COLOR=#f9f7e0>S</FONT><FONT COLOR=#ffffe0>k</FONT><FONT COLOR=#faf8e0>i</FONT><FONT COLOR=#f3efe0>l</FONT><FONT COLOR=#ede7e0>l</FONT><FONT COLOR=#e6dee0> </FONT><FONT COLOR=#e0d6df>I</FONT><FONT COLOR=#dacddf>n</FONT><FONT COLOR=#d3c5df>c</FONT><FONT COLOR=#cdbcde>r</FONT><FONT COLOR=#c6b4de>e</FONT><FONT COLOR=#c0abdd>a</FONT><FONT COLOR=#b9a3dd>s</FONT><FONT COLOR=#b39add>e</FONT><FONT COLOR=#ad92dc>d</FONT><FONT COLOR=#a689dc> </FONT><FONT COLOR=#a081dc>:</FONT><FONT COLOR=#9978db>:</FONT><FONT COLOR=#9370db>.</FONT></center>","output2")
				else
					if(usr.durability_mastered == 1)
						return
					else
						usr.durability = 100
						usr.durability_max = 100
						usr.durability_mastered =  1
						usr << output("<center><FONT COLOR=#2f4f4f>.</FONT><FONT COLOR=#344b4b>:</FONT><FONT COLOR=#394646>:</FONT><FONT COLOR=#3e4141> </FONT><FONT COLOR=#443c3c>D</FONT><FONT COLOR=#493737>u</FONT><FONT COLOR=#4e3232>r</FONT><FONT COLOR=#532d2d>a</FONT><FONT COLOR=#582828>b</FONT><FONT COLOR=#5d2323>i</FONT><FONT COLOR=#621e1e>l</FONT><FONT COLOR=#671919>i</FONT><FONT COLOR=#6d1414>t</FONT><FONT COLOR=#720f0f>y</FONT><FONT COLOR=#770a0a> </FONT><FONT COLOR=#7c0505>S</FONT><FONT COLOR=#800000>k</FONT><FONT COLOR=#7c0505>i</FONT><FONT COLOR=#770909>l</FONT><FONT COLOR=#730e0e>l</FONT><FONT COLOR=#6e1313> </FONT><FONT COLOR=#691818>M</FONT><FONT COLOR=#641c1c>A</FONT><FONT COLOR=#5f2121>S</FONT><FONT COLOR=#5a2626>T</FONT><FONT COLOR=#562a2a>E</FONT><FONT COLOR=#512f2f>R</FONT><FONT COLOR=#4c3434>E</FONT><FONT COLOR=#473838>D</FONT><FONT COLOR=#423d3d>!</FONT><FONT COLOR=#3d4242> </FONT><FONT COLOR=#394747>:</FONT><FONT COLOR=#344b4b>:</FONT><FONT COLOR=#2f4f4f>.</FONT></center>","output2")

		Ki_Con_Level()
			if(!usr)return
			if(usr.ki_con_exp >= usr.ki_con_tnl)

				if(usr.ki_control_max >= 24)
					if(!usr.learn_powerdown)
						usr.learn_powerdown = 1
						usr.contents += new/obj/Technique/PowerDown
						usr << output("<center><font color = white> .:: You learn Power Down ::.</font></center>","output2")
/*
				if(usr.ki_control_max >= 74)
					if(!usr.learn_regena)
						usr.learn_regena = 1
						spawn(30)usr.RegenerateA()
						usr << "<center><font color = white> .:: You learn Passive Energy ::.</font></center>","output2")
*/
				if(usr.ki_control_max <= 98)
					usr.ki_con_exp -= usr.ki_con_tnl
					usr.ki_con_tnl += round(usr.ki_con_tnl * 0.1)
					usr.ki_control ++
					usr.ki_control_max ++
					usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#00f8f1>:</FONT><FONT COLOR=#00f1e2>:</FONT><FONT COLOR=#00e9d3> </FONT><FONT COLOR=#00e2c4>K</FONT><FONT COLOR=#00dab5>i</FONT><FONT COLOR=#00d3a6> </FONT><FONT COLOR=#00cb97>C</FONT><FONT COLOR=#00c488>o</FONT><FONT COLOR=#00bc78>n</FONT><FONT COLOR=#00b569>t</FONT><FONT COLOR=#00ad5a>r</FONT><FONT COLOR=#00a64b>o</FONT><FONT COLOR=#009e3c>l</FONT><FONT COLOR=#00972d> </FONT><FONT COLOR=#008f1e>S</FONT><FONT COLOR=#00880f>k</FONT><FONT COLOR=#008000>i</FONT><FONT COLOR=#00880f>l</FONT><FONT COLOR=#008f1e>l</FONT><FONT COLOR=#00972d> </FONT><FONT COLOR=#009e3c>I</FONT><FONT COLOR=#00a64b>n</FONT><FONT COLOR=#00ad5a>c</FONT><FONT COLOR=#00b569>r</FONT><FONT COLOR=#00bc78>e</FONT><FONT COLOR=#00c488>a</FONT><FONT COLOR=#00cb97>s</FONT><FONT COLOR=#00d3a6>e</FONT><FONT COLOR=#00dab5>d</FONT><FONT COLOR=#00e2c4>!</FONT><FONT COLOR=#00e9d3> </FONT><FONT COLOR=#00f1e2>:</FONT><FONT COLOR=#00f8f1>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")
				else
					if(usr.ki_control_mastered == 1)
						return
					else
						usr.ki_control = 100
						usr.ki_control_max = 100
						usr.ki_control_mastered = 1
						usr << output("<center><FONT COLOR=#ff00ff>.</FONT><FONT COLOR=#ff10ff>:</FONT><FONT COLOR=#ff20ff>:</FONT><FONT COLOR=#ff30ff> </FONT><FONT COLOR=#ff40ff>K</FONT><FONT COLOR=#ff50ff>i</FONT><FONT COLOR=#ff60ff> </FONT><FONT COLOR=#ff70ff>C</FONT><FONT COLOR=#ff80ff>o</FONT><FONT COLOR=#ff90ff>n</FONT><FONT COLOR=#ffa0ff>t</FONT><FONT COLOR=#ffb0ff>r</FONT><FONT COLOR=#ffc0ff>o</FONT><FONT COLOR=#ffd0ff>l</FONT><FONT COLOR=#ffe0ff> </FONT><FONT COLOR=#fff0ff>S</FONT><FONT COLOR=#ffffff>k</FONT><FONT COLOR=#fff1ff>i</FONT><FONT COLOR=#ffe2ff>l</FONT><FONT COLOR=#ffd3ff>l</FONT><FONT COLOR=#ffc4ff> </FONT><FONT COLOR=#ffb5ff>M</FONT><FONT COLOR=#ffa6ff>A</FONT><FONT COLOR=#ff97ff>S</FONT><FONT COLOR=#ff88ff>T</FONT><FONT COLOR=#ff78ff>E</FONT><FONT COLOR=#ff69ff>R</FONT><FONT COLOR=#ff5aff>E</FONT><FONT COLOR=#ff4bff>D</FONT><FONT COLOR=#ff3cff>!</FONT><FONT COLOR=#ff2dff> </FONT><FONT COLOR=#ff1eff>:</FONT><FONT COLOR=#ff0fff>:</FONT><FONT COLOR=#ff00ff>.</FONT></center>","output2")

		Ki_Power_Level()
			if(!usr)return
			if(usr.ki_pow_exp >= usr.ki_pow_tnl)
				if(usr.ki_power_max <= 98)
					usr.ki_pow_exp -= usr.ki_pow_tnl
					usr.ki_pow_tnl += round(usr.ki_pow_tnl * 0.1)
					usr.ki_power ++
					usr.ki_power_max ++
					usr << output("<center><FONT COLOR=#800080>.</FONT><FONT COLOR=#790880>:</FONT><FONT COLOR=#711080>:</FONT><FONT COLOR=#691880> </FONT><FONT COLOR=#612080>K</FONT><FONT COLOR=#592880>i</FONT><FONT COLOR=#513080> </FONT><FONT COLOR=#493880>P</FONT><FONT COLOR=#414180>o</FONT><FONT COLOR=#384980>w</FONT><FONT COLOR=#305180>e</FONT><FONT COLOR=#285980>r</FONT><FONT COLOR=#206180> </FONT><FONT COLOR=#186980>S</FONT><FONT COLOR=#107180>k</FONT><FONT COLOR=#087980>i</FONT><FONT COLOR=#008080>l</FONT><FONT COLOR=#087980>l</FONT><FONT COLOR=#107180> </FONT><FONT COLOR=#186980>I</FONT><FONT COLOR=#206180>n</FONT><FONT COLOR=#285980>c</FONT><FONT COLOR=#305180>r</FONT><FONT COLOR=#384980>e</FONT><FONT COLOR=#414180>a</FONT><FONT COLOR=#493880>s</FONT><FONT COLOR=#513080>e</FONT><FONT COLOR=#592880>d</FONT><FONT COLOR=#612080>!</FONT><FONT COLOR=#691880> </FONT><FONT COLOR=#711080>:</FONT><FONT COLOR=#790880>:</FONT><FONT COLOR=#800080>.</FONT></center>","output2")
				else
					if(usr.ki_power_mastered == 1)
						return
					else
						usr.ki_power = 100
						usr.ki_power_max = 100
						usr.ki_power_mastered = 1
						usr << output("<center><FONT COLOR=#00ff00>.</FONT><FONT COLOR=#11ef00>:</FONT><FONT COLOR=#22de00>:</FONT><FONT COLOR=#33cd00> </FONT><FONT COLOR=#44bc00>K</FONT><FONT COLOR=#55ab00>i</FONT><FONT COLOR=#669a00> </FONT><FONT COLOR=#778900>P</FONT><FONT COLOR=#897700>o</FONT><FONT COLOR=#9a6600>w</FONT><FONT COLOR=#ab5500>e</FONT><FONT COLOR=#bc4400>r</FONT><FONT COLOR=#cd3300> </FONT><FONT COLOR=#de2200>S</FONT><FONT COLOR=#ef1100>k</FONT><FONT COLOR=#ff0000>i</FONT><FONT COLOR=#f01000>l</FONT><FONT COLOR=#e02000>l</FONT><FONT COLOR=#d03000> </FONT><FONT COLOR=#c04000>M</FONT><FONT COLOR=#b05000>A</FONT><FONT COLOR=#a06000>S</FONT><FONT COLOR=#907000>T</FONT><FONT COLOR=#808000>E</FONT><FONT COLOR=#709000>R</FONT><FONT COLOR=#60a000>E</FONT><FONT COLOR=#50b000>D</FONT><FONT COLOR=#40c000>!</FONT><FONT COLOR=#30d000> </FONT><FONT COLOR=#20e000>:</FONT><FONT COLOR=#10f000>:</FONT><FONT COLOR=#00ff00>.</FONT></center>","output2")

		Ki_Use_Level()
			if(!usr)return
			if(usr.ki_use_exp >= usr.ki_use_tnl)
				if(usr.ki_use_max <= 98)
					usr.kiuse -= 1
					usr.ki_use_exp -= usr.ki_use_tnl
					usr.ki_use_tnl += round(usr.ki_use_tnl * 0.1)
					usr.ki_use ++
					usr.ki_use_max ++
					usr << output("<center><FONT COLOR=#800000>.</FONT><FONT COLOR=#790800>:</FONT><FONT COLOR=#711000>:</FONT><FONT COLOR=#691800> </FONT><FONT COLOR=#612000>K</FONT><FONT COLOR=#592800>i</FONT><FONT COLOR=#513000> </FONT><FONT COLOR=#493800>U</FONT><FONT COLOR=#414100>s</FONT><FONT COLOR=#384900>a</FONT><FONT COLOR=#305100>g</FONT><FONT COLOR=#285900>e</FONT><FONT COLOR=#206100> </FONT><FONT COLOR=#186900>S</FONT><FONT COLOR=#107100>k</FONT><FONT COLOR=#087900>i</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#087900>l</FONT><FONT COLOR=#107100> </FONT><FONT COLOR=#186900>I</FONT><FONT COLOR=#206100>n</FONT><FONT COLOR=#285900>c</FONT><FONT COLOR=#305100>r</FONT><FONT COLOR=#384900>e</FONT><FONT COLOR=#414100>a</FONT><FONT COLOR=#493800>s</FONT><FONT COLOR=#513000>e</FONT><FONT COLOR=#592800>d</FONT><FONT COLOR=#612000>!</FONT><FONT COLOR=#691800> </FONT><FONT COLOR=#711000>:</FONT><FONT COLOR=#790800>:</FONT><FONT COLOR=#800000>.</FONT></center>","output2")
				else
					if(usr.ki_use_mastered == 1)
						return
					else
						usr.kiuse = 20
						usr.ki_use = 100
						usr.ki_use_max = 100
						usr.ki_use_mastered = 1
						usr << output("<center><FONT COLOR=#ffff00>.</FONT><FONT COLOR=#efff00>:</FONT><FONT COLOR=#deff00>:</FONT><FONT COLOR=#cdff00> </FONT><FONT COLOR=#bcff00>K</FONT><FONT COLOR=#abff00>i</FONT><FONT COLOR=#9aff00> </FONT><FONT COLOR=#89ff00>U</FONT><FONT COLOR=#77ff00>s</FONT><FONT COLOR=#66ff00>a</FONT><FONT COLOR=#55ff00>g</FONT><FONT COLOR=#44ff00>e</FONT><FONT COLOR=#33ff00> </FONT><FONT COLOR=#22ff00>S</FONT><FONT COLOR=#11ff00>k</FONT><FONT COLOR=#00ff00>i</FONT><FONT COLOR=#10ff00>l</FONT><FONT COLOR=#20ff00>l</FONT><FONT COLOR=#30ff00> </FONT><FONT COLOR=#40ff00>M</FONT><FONT COLOR=#50ff00>A</FONT><FONT COLOR=#60ff00>S</FONT><FONT COLOR=#70ff00>T</FONT><FONT COLOR=#80ff00>E</FONT><FONT COLOR=#90ff00>R</FONT><FONT COLOR=#a0ff00>E</FONT><FONT COLOR=#b0ff00>D</FONT><FONT COLOR=#c0ff00>!</FONT><FONT COLOR=#d0ff00> </FONT><FONT COLOR=#e0ff00>:</FONT><FONT COLOR=#f0ff00>:</FONT><FONT COLOR=#ffff00>.</FONT></center>","output2")

		Ki_Cast_Level()
			if(!usr)return
			if(usr.ki_cast_exp >= usr.ki_cast_tnl)
				if(usr.ki_cast_max <= 98)
			//		usr.kicast += 1
					usr.ki_cast_exp -= usr.ki_cast_tnl
					usr.ki_cast_tnl += round(usr.ki_cast_tnl * 0.1)
					usr.ki_cast ++
					usr.ki_cast_max ++
					usr << output("<center><FONT COLOR=#2f4f4f>.</FONT><FONT COLOR=#2d524b>:</FONT><FONT COLOR=#2a5645>:</FONT><FONT COLOR=#265940> </FONT><FONT COLOR=#235c3b>K</FONT><FONT COLOR=#206035>i</FONT><FONT COLOR=#1d6330> </FONT><FONT COLOR=#1a662b>C</FONT><FONT COLOR=#166a25>a</FONT><FONT COLOR=#136d20>s</FONT><FONT COLOR=#10701b>t</FONT><FONT COLOR=#0d7415> </FONT><FONT COLOR=#0a7710>S</FONT><FONT COLOR=#067a0b>k</FONT><FONT COLOR=#037e05>i</FONT><FONT COLOR=#008000>l</FONT><FONT COLOR=#037e05>l</FONT><FONT COLOR=#067a0b> </FONT><FONT COLOR=#0a7710>I</FONT><FONT COLOR=#0d7415>n</FONT><FONT COLOR=#10701b>c</FONT><FONT COLOR=#136d20>r</FONT><FONT COLOR=#166a25>e</FONT><FONT COLOR=#1a662b>a</FONT><FONT COLOR=#1d6330>s</FONT><FONT COLOR=#206035>e</FONT><FONT COLOR=#235c3b>d</FONT><FONT COLOR=#265940> </FONT><FONT COLOR=#2a5645>:</FONT><FONT COLOR=#2d524b>:</FONT><FONT COLOR=#2f4f4f>.</FONT></center>","output2")
				else
					if(usr.ki_cast_mastered == 1)
						return
					else
				//		usr.kicast = 100
						usr.ki_cast = 100
						usr.ki_cast_max = 100
						usr.ki_cast_mastered = 1
						usr << output("<center><FONT COLOR=#4b0082>.</FONT><FONT COLOR=#500e7e>:</FONT><FONT COLOR=#561b78>:</FONT><FONT COLOR=#5b2973> </FONT><FONT COLOR=#60376d>K</FONT><FONT COLOR=#664568>i</FONT><FONT COLOR=#6b5263> </FONT><FONT COLOR=#70605d>C</FONT><FONT COLOR=#766e58>a</FONT><FONT COLOR=#7b7c52>s</FONT><FONT COLOR=#80894d>t</FONT><FONT COLOR=#869748> </FONT><FONT COLOR=#8ba542>S</FONT><FONT COLOR=#90b33d>k</FONT><FONT COLOR=#96c037>i</FONT><FONT COLOR=#9acd32>l</FONT><FONT COLOR=#96c037>l</FONT><FONT COLOR=#90b33d> </FONT><FONT COLOR=#8ba542>M</FONT><FONT COLOR=#869748>A</FONT><FONT COLOR=#80894d>S</FONT><FONT COLOR=#7b7c52>T</FONT><FONT COLOR=#766e58>E</FONT><FONT COLOR=#70605d>R</FONT><FONT COLOR=#6b5263>E</FONT><FONT COLOR=#664568>D</FONT><FONT COLOR=#60376d>!</FONT><FONT COLOR=#5b2973> </FONT><FONT COLOR=#561b78>:</FONT><FONT COLOR=#500e7e>:</FONT><FONT COLOR=#4b0082>.</FONT></center>","output2")

		Ki_Res_Level()
			if(!usr)return
			if(usr.ki_res_exp >= usr.ki_res_tnl)
				if(usr.ki_res_max <= 98)
					if(usr.ki_res_max >= 49)
						if(!usr.ki_shield_learn)
							usr.ki_shield_learn = 1
							usr.contents += new/obj/Technique/KiShield
							usr << output("<center><font color = white> .:: You learn Ki Shield ::.</font></center>","output2")
							usr << "<center><font color = white> .:: You learn Ki Shield ::.</font></center>"
					usr.ki_res_exp -= usr.ki_res_tnl
					usr.ki_res_tnl += round(usr.ki_res_tnl * 0.1)
					usr.ki_res ++
					usr.ki_res_max ++
					usr << output("<center><FONT COLOR=#bc8f8f>.</FONT><FONT COLOR=#b38f8f>:</FONT><FONT COLOR=#a88e8e>:</FONT><FONT COLOR=#9e8d8d> </FONT><FONT COLOR=#938c8c>K</FONT><FONT COLOR=#898c8c>i</FONT><FONT COLOR=#7e8b8b> </FONT><FONT COLOR=#748a8a>R</FONT><FONT COLOR=#698989>e</FONT><FONT COLOR=#5f8888>s</FONT><FONT COLOR=#548787>i</FONT><FONT COLOR=#4a8686>s</FONT><FONT COLOR=#3f8585>t</FONT><FONT COLOR=#358484>a</FONT><FONT COLOR=#2a8484>n</FONT><FONT COLOR=#208383>c</FONT><FONT COLOR=#158282>e</FONT><FONT COLOR=#0b8181> </FONT><FONT COLOR=#008080>S</FONT><FONT COLOR=#0b8181>k</FONT><FONT COLOR=#158282>i</FONT><FONT COLOR=#208383>l</FONT><FONT COLOR=#2a8484>l</FONT><FONT COLOR=#358484> </FONT><FONT COLOR=#3f8585>I</FONT><FONT COLOR=#4a8686>n</FONT><FONT COLOR=#548787>c</FONT><FONT COLOR=#5f8888>r</FONT><FONT COLOR=#698989>e</FONT><FONT COLOR=#748a8a>a</FONT><FONT COLOR=#7e8b8b>s</FONT><FONT COLOR=#898c8c>e</FONT><FONT COLOR=#938c8c>d</FONT><FONT COLOR=#9e8d8d> </FONT><FONT COLOR=#a88e8e>:</FONT><FONT COLOR=#b38f8f>:</FONT><FONT COLOR=#bc8f8f>.</FONT></center>","output2")
				else
					if(usr.ki_res_mastered == 1)
						return
					else
						if(usr.learn_kiabsorb == 0)
							usr.learn_kiabsorb = 1
							usr.contents += new/obj/Technique/KiAbsorb
							usr << output("<center><font color = white> .:: You learn Ki Absorb ::.</font></center>","output2")
						usr.ki_res = 100
						usr.ki_res_max = 100
						usr.ki_res_mastered = 1
						usr << output("<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#0fff78>:</FONT><FONT COLOR=#1eff71>:</FONT><FONT COLOR=#2dff69> </FONT><FONT COLOR=#3cff62>K</FONT><FONT COLOR=#4bff5a>i</FONT><FONT COLOR=#5aff53> </FONT><FONT COLOR=#69ff4b>R</FONT><FONT COLOR=#78ff44>e</FONT><FONT COLOR=#88ff3c>s</FONT><FONT COLOR=#97ff35>i</FONT><FONT COLOR=#a6ff2d>s</FONT><FONT COLOR=#b5ff26>t</FONT><FONT COLOR=#c4ff1e>a</FONT><FONT COLOR=#d3ff17>n</FONT><FONT COLOR=#e2ff0f>c</FONT><FONT COLOR=#f1ff08>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#f2ff07>S</FONT><FONT COLOR=#e4ff0e>k</FONT><FONT COLOR=#d5ff15>i</FONT><FONT COLOR=#c7ff1c>l</FONT><FONT COLOR=#b9ff24>l</FONT><FONT COLOR=#abff2b> </FONT><FONT COLOR=#9cff32>M</FONT><FONT COLOR=#8eff39>A</FONT><FONT COLOR=#80ff40>S</FONT><FONT COLOR=#72ff47>T</FONT><FONT COLOR=#64ff4e>E</FONT><FONT COLOR=#55ff55>R</FONT><FONT COLOR=#47ff5c>E</FONT><FONT COLOR=#39ff64>D</FONT><FONT COLOR=#2bff6b> </FONT><FONT COLOR=#1cff72>:</FONT><FONT COLOR=#0eff79>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>","output2")
						usr << "<center><FONT COLOR=#00ff7f>.</FONT><FONT COLOR=#0fff78>:</FONT><FONT COLOR=#1eff71>:</FONT><FONT COLOR=#2dff69> </FONT><FONT COLOR=#3cff62>K</FONT><FONT COLOR=#4bff5a>i</FONT><FONT COLOR=#5aff53> </FONT><FONT COLOR=#69ff4b>R</FONT><FONT COLOR=#78ff44>e</FONT><FONT COLOR=#88ff3c>s</FONT><FONT COLOR=#97ff35>i</FONT><FONT COLOR=#a6ff2d>s</FONT><FONT COLOR=#b5ff26>t</FONT><FONT COLOR=#c4ff1e>a</FONT><FONT COLOR=#d3ff17>n</FONT><FONT COLOR=#e2ff0f>c</FONT><FONT COLOR=#f1ff08>e</FONT><FONT COLOR=#ffff00> </FONT><FONT COLOR=#f2ff07>S</FONT><FONT COLOR=#e4ff0e>k</FONT><FONT COLOR=#d5ff15>i</FONT><FONT COLOR=#c7ff1c>l</FONT><FONT COLOR=#b9ff24>l</FONT><FONT COLOR=#abff2b> </FONT><FONT COLOR=#9cff32>M</FONT><FONT COLOR=#8eff39>A</FONT><FONT COLOR=#80ff40>S</FONT><FONT COLOR=#72ff47>T</FONT><FONT COLOR=#64ff4e>E</FONT><FONT COLOR=#55ff55>R</FONT><FONT COLOR=#47ff5c>E</FONT><FONT COLOR=#39ff64>D</FONT><FONT COLOR=#2bff6b> </FONT><FONT COLOR=#1cff72>:</FONT><FONT COLOR=#0eff79>:</FONT><FONT COLOR=#00ff7f>.</FONT></center>"

		Reflect_Level()
			if(!usr)return
			if(usr.reflect_exp >= usr.reflect_tnl)
				if(usr.reflect_max <= 98)
					usr.reflect_exp -= usr.reflect_tnl
					usr.reflect_tnl += round(usr.reflect_tnl * 0.1)
					usr.reflect ++
					usr.reflect_max ++
					usr << output("<center><FONT COLOR=#ffffff>.</FONT><FONT COLOR=#efffff>:</FONT><FONT COLOR=#deffff>:</FONT><FONT COLOR=#cdffff> </FONT><FONT COLOR=#bcffff>D</FONT><FONT COLOR=#abffff>e</FONT><FONT COLOR=#9affff>f</FONT><FONT COLOR=#89ffff>l</FONT><FONT COLOR=#77ffff>e</FONT><FONT COLOR=#66ffff>c</FONT><FONT COLOR=#55ffff>t</FONT><FONT COLOR=#44ffff> </FONT><FONT COLOR=#33ffff>S</FONT><FONT COLOR=#22ffff>k</FONT><FONT COLOR=#11ffff>i</FONT><FONT COLOR=#00ffff>l</FONT><FONT COLOR=#10ffff>l</FONT><FONT COLOR=#20ffff> </FONT><FONT COLOR=#30ffff>I</FONT><FONT COLOR=#40ffff>n</FONT><FONT COLOR=#50ffff>c</FONT><FONT COLOR=#60ffff>r</FONT><FONT COLOR=#70ffff>e</FONT><FONT COLOR=#80ffff>a</FONT><FONT COLOR=#90ffff>s</FONT><FONT COLOR=#a0ffff>e</FONT><FONT COLOR=#b0ffff>d</FONT><FONT COLOR=#c0ffff>!</FONT><FONT COLOR=#d0ffff> </FONT><FONT COLOR=#e0ffff>:</FONT><FONT COLOR=#f0ffff>:</FONT><FONT COLOR=#ffffff>.</FONT></center>","output2")
				else
					if(usr.reflect_mastered == 1)
						return
					else
						usr.reflect = 100
						usr.reflect_max = 100
						usr.reflect_mastered = 1
						usr << output("<center><FONT COLOR=#00ffff>.</FONT><FONT COLOR=#09eff7>:</FONT><FONT COLOR=#11deef>:</FONT><FONT COLOR=#1acde6> </FONT><FONT COLOR=#22bcde>D</FONT><FONT COLOR=#2babd5>e</FONT><FONT COLOR=#349acd>f</FONT><FONT COLOR=#3c89c4>l</FONT><FONT COLOR=#4577bc>e</FONT><FONT COLOR=#4d66b3>c</FONT><FONT COLOR=#5655ab>t</FONT><FONT COLOR=#5f44a2> </FONT><FONT COLOR=#67339a>S</FONT><FONT COLOR=#702291>k</FONT><FONT COLOR=#781189>i</FONT><FONT COLOR=#800080>l</FONT><FONT COLOR=#781189>l</FONT><FONT COLOR=#702291> </FONT><FONT COLOR=#67339a>M</FONT><FONT COLOR=#5f44a2>A</FONT><FONT COLOR=#5655ab>S</FONT><FONT COLOR=#4d66b3>T</FONT><FONT COLOR=#4577bc>E</FONT><FONT COLOR=#3c89c4>R</FONT><FONT COLOR=#349acd>E</FONT><FONT COLOR=#2babd5>D</FONT><FONT COLOR=#22bcde>!</FONT><FONT COLOR=#1acde6> </FONT><FONT COLOR=#11deef>:</FONT><FONT COLOR=#09eff7>:</FONT><FONT COLOR=#00ffff>.</FONT></center>","output2")

		Weapon_Level()
			if(!usr)return
			if(usr.weapon_exp >= usr.weapon_tnl)
				if(usr.weapon_max <= 98)
					usr.weapon_exp -= usr.weapon_tnl
					usr.weapon_tnl += round(usr.weapon_tnl * 0.1)
					usr.weapon ++
					usr.weapon_max ++
					usr << output("<center><FONT COLOR=#0000cd>.</FONT><FONT COLOR=#0510cd>:</FONT><FONT COLOR=#0920ce>:</FONT><FONT COLOR=#0e30ce> </FONT><FONT COLOR=#1340ce>W</FONT><FONT COLOR=#1750ce>e</FONT><FONT COLOR=#1c60cf>a</FONT><FONT COLOR=#2171cf>p</FONT><FONT COLOR=#2581cf>o</FONT><FONT COLOR=#2a91d0>n</FONT><FONT COLOR=#2ea1d0> </FONT><FONT COLOR=#33b1d0>S</FONT><FONT COLOR=#38c1d0>k</FONT><FONT COLOR=#3cd1d0>i</FONT><FONT COLOR=#40e0d0>l</FONT><FONT COLOR=#3dd2d0>l</FONT><FONT COLOR=#38c3d0> </FONT><FONT COLOR=#34b4d0>I</FONT><FONT COLOR=#30a5d0>n</FONT><FONT COLOR=#2b96d0>c</FONT><FONT COLOR=#2787cf>r</FONT><FONT COLOR=#2378cf>e</FONT><FONT COLOR=#1e69cf>a</FONT><FONT COLOR=#1a5acf>s</FONT><FONT COLOR=#164bce>e</FONT><FONT COLOR=#113cce>d</FONT><FONT COLOR=#0d2dce> </FONT><FONT COLOR=#091ece>:</FONT><FONT COLOR=#040fcd>:</FONT><FONT COLOR=#0000cd>.</FONT></center>","output2")
				else
					if(usr.weapon_mastered == 1)
						return
					else
						usr.weapon = 100
						usr.weapon_max = 100
						usr.weapon_mastered =  1
						usr << output("<center><FONT COLOR=#add8e6>.</FONT><FONT COLOR=#a2cad7>:</FONT><FONT COLOR=#95bac6>:</FONT><FONT COLOR=#89abb6> </FONT><FONT COLOR=#7c9ba5>W</FONT><FONT COLOR=#708c95>e</FONT><FONT COLOR=#637c84>a</FONT><FONT COLOR=#576d74>p</FONT><FONT COLOR=#4b5d63>o</FONT><FONT COLOR=#3e4e53>n</FONT><FONT COLOR=#323e42> </FONT><FONT COLOR=#252f32>S</FONT><FONT COLOR=#191f21>k</FONT><FONT COLOR=#0c1011>i</FONT><FONT COLOR=#000000>l</FONT><FONT COLOR=#0c0e0f>l</FONT><FONT COLOR=#171d1f> </FONT><FONT COLOR=#232b2e>M</FONT><FONT COLOR=#2e3a3e>A</FONT><FONT COLOR=#3a484d>S</FONT><FONT COLOR=#46575c>T</FONT><FONT COLOR=#51656c>E</FONT><FONT COLOR=#5d747b>R</FONT><FONT COLOR=#68828b>E</FONT><FONT COLOR=#74919a>D</FONT><FONT COLOR=#809fa9>!</FONT><FONT COLOR=#8baeb9> </FONT><FONT COLOR=#97bcc8>:</FONT><FONT COLOR=#a2cbd8>:</FONT><FONT COLOR=#add8e6>.</FONT></center>","output2")

		Weapon_Power_Level()
			if(!usr)return
			if(usr.weapon_power_exp >= usr.weapon_power_tnl)
				if(usr.weapon_power_max <= 98)
					usr.weapon_power_exp -= usr.weapon_power_tnl
					usr.weapon_power_tnl += round(usr.weapon_power_tnl * 0.1)
					usr.weapon_power ++
					usr.weapon_power_max ++
					usr << output("<center><FONT COLOR=#228b22>.</FONT><FONT COLOR=#219229>:</FONT><FONT COLOR=#1f9830>:</FONT><FONT COLOR=#1d9f37> </FONT><FONT COLOR=#1ba53e>W</FONT><FONT COLOR=#19ac46>e</FONT><FONT COLOR=#17b34d>a</FONT><FONT COLOR=#15b954>p</FONT><FONT COLOR=#13c05b>o</FONT><FONT COLOR=#10c662>n</FONT><FONT COLOR=#0ecd69> </FONT><FONT COLOR=#0cd370>P</FONT><FONT COLOR=#0ada77>o</FONT><FONT COLOR=#08e17f>w</FONT><FONT COLOR=#06e786>e</FONT><FONT COLOR=#04ee8d>r</FONT><FONT COLOR=#02f494> </FONT><FONT COLOR=#00fa9a>S</FONT><FONT COLOR=#02f594>k</FONT><FONT COLOR=#04ef8e>i</FONT><FONT COLOR=#06e887>l</FONT><FONT COLOR=#08e280>l</FONT><FONT COLOR=#0adc79> </FONT><FONT COLOR=#0cd673>I</FONT><FONT COLOR=#0ecf6c>n</FONT><FONT COLOR=#10c965>c</FONT><FONT COLOR=#12c35f>r</FONT><FONT COLOR=#13bd58>e</FONT><FONT COLOR=#15b751>a</FONT><FONT COLOR=#17b04a>s</FONT><FONT COLOR=#19aa44>e</FONT><FONT COLOR=#1ba43d>d</FONT><FONT COLOR=#1d9e36> </FONT><FONT COLOR=#1f972f>:</FONT><FONT COLOR=#219129>:</FONT><FONT COLOR=#228b22>.</FONT> </center>","output2")
				else
					if(usr.weapon_power_mastered == 1)
						return
					else
						usr.weapon_power = 100
						usr.weapon_power_max = 100
						usr.weapon_power_mastered =  1
						usr << output("<center><FONT COLOR=#0000ff>.</FONT><FONT COLOR=#000ff8>:</FONT><FONT COLOR=#001ef1>:</FONT><FONT COLOR=#002de9> </FONT><FONT COLOR=#003ce2>W</FONT><FONT COLOR=#004bda>e</FONT><FONT COLOR=#005ad2>a</FONT><FONT COLOR=#0069cb>p</FONT><FONT COLOR=#0078c3>o</FONT><FONT COLOR=#0088bc>n</FONT><FONT COLOR=#0097b4> </FONT><FONT COLOR=#00a6ad>P</FONT><FONT COLOR=#00b5a5>o</FONT><FONT COLOR=#00c49d>w</FONT><FONT COLOR=#00d396>e</FONT><FONT COLOR=#00e28e>r</FONT><FONT COLOR=#00f187> </FONT><FONT COLOR=#00ff7f>S</FONT><FONT COLOR=#00f286>k</FONT><FONT COLOR=#00e48d>i</FONT><FONT COLOR=#00d595>l</FONT><FONT COLOR=#00c79c>l</FONT><FONT COLOR=#00b9a3> </FONT><FONT COLOR=#00abaa>M</FONT><FONT COLOR=#009cb1>A</FONT><FONT COLOR=#008eb8>S</FONT><FONT COLOR=#0080c0>T</FONT><FONT COLOR=#0072c7>E</FONT><FONT COLOR=#0064ce>R</FONT><FONT COLOR=#0055d5>E</FONT><FONT COLOR=#0047dc>D</FONT><FONT COLOR=#0039e3>!</FONT><FONT COLOR=#002beb> </FONT><FONT COLOR=#001cf2>:</FONT><FONT COLOR=#000ef9>:</FONT><FONT COLOR=#0000ff>.</FONT></center>","output2")

		Weapon_Res_Level()
			if(!usr)return
			if(usr.weapon_res_exp >= usr.weapon_res_tnl)
				if(usr.weapon_resistance_max <= 98)
					usr.weapon_res_exp -= usr.weapon_res_tnl
					usr.weapon_res_tnl += round(usr.weapon_res_tnl * 0.1)
					usr.weapon_resistance ++
					usr.weapon_resistance_max ++
					usr << output("<center><FONT COLOR=#000000>.</FONT><FONT COLOR=#0d0b0b>:</FONT><FONT COLOR=#1a1717>:</FONT><FONT COLOR=#262222> </FONT><FONT COLOR=#332e2d>W</FONT><FONT COLOR=#403939>e</FONT><FONT COLOR=#4d4544>a</FONT><FONT COLOR=#5a504f>p</FONT><FONT COLOR=#665c5a>o</FONT><FONT COLOR=#736766>n</FONT><FONT COLOR=#807371> </FONT><FONT COLOR=#8d7e7c>R</FONT><FONT COLOR=#9a8988>e</FONT><FONT COLOR=#a69593>s</FONT><FONT COLOR=#b3a09e>i</FONT><FONT COLOR=#c0acaa>s</FONT><FONT COLOR=#cdb7b5>t</FONT><FONT COLOR=#dac3c0>a</FONT><FONT COLOR=#e6cecb>n</FONT><FONT COLOR=#f3dad7>c</FONT><FONT COLOR=#ffe4e1>e</FONT><FONT COLOR=#f3dad7> </FONT><FONT COLOR=#e6cecb>S</FONT><FONT COLOR=#dac3c0>k</FONT><FONT COLOR=#cdb7b5>i</FONT><FONT COLOR=#c0acaa>l</FONT><FONT COLOR=#b3a09e>l</FONT><FONT COLOR=#a69593> </FONT><FONT COLOR=#9a8988>I</FONT><FONT COLOR=#8d7e7c>n</FONT><FONT COLOR=#807371>c</FONT><FONT COLOR=#736766>r</FONT><FONT COLOR=#665c5a>e</FONT><FONT COLOR=#5a504f>a</FONT><FONT COLOR=#4d4544>s</FONT><FONT COLOR=#403939>e</FONT><FONT COLOR=#332e2d>d</FONT><FONT COLOR=#262222> </FONT><FONT COLOR=#1a1717>:</FONT><FONT COLOR=#0d0b0b>:</FONT><FONT COLOR=#000000>.</FONT></center>","output2")
				else
					if(usr.weapon_res_mastered == 1)
						return
					else
						usr.weapon_resistance = 100
						usr.weapon_resistance_max = 100
						usr.weapon_res_mastered =  1
						usr << output("<center><FONT COLOR=#f5f5f5>.</FONT><FONT COLOR=#f1eaea>:</FONT><FONT COLOR=#ebdddd>:</FONT><FONT COLOR=#e6d1d1> </FONT><FONT COLOR=#e1c5c5>W</FONT><FONT COLOR=#dbb9b9>e</FONT><FONT COLOR=#d6acac>a</FONT><FONT COLOR=#d1a0a0>p</FONT><FONT COLOR=#cb9494>o</FONT><FONT COLOR=#c68787>n</FONT><FONT COLOR=#c17b7b> </FONT><FONT COLOR=#bb6f6f>R</FONT><FONT COLOR=#b66262>e</FONT><FONT COLOR=#b05656>s</FONT><FONT COLOR=#ab4a4a>i</FONT><FONT COLOR=#a63e3e>s</FONT><FONT COLOR=#a03131>t</FONT><FONT COLOR=#9b2525>a</FONT><FONT COLOR=#961919>n</FONT><FONT COLOR=#900c0c>c</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#900c0c> </FONT><FONT COLOR=#961919>S</FONT><FONT COLOR=#9b2525>k</FONT><FONT COLOR=#a03131>i</FONT><FONT COLOR=#a63e3e>l</FONT><FONT COLOR=#ab4a4a>l</FONT><FONT COLOR=#b05656> </FONT><FONT COLOR=#b66262>M</FONT><FONT COLOR=#bb6f6f>A</FONT><FONT COLOR=#c17b7b>S</FONT><FONT COLOR=#c68787>T</FONT><FONT COLOR=#cb9494>E</FONT><FONT COLOR=#d1a0a0>R</FONT><FONT COLOR=#d6acac>E</FONT><FONT COLOR=#dbb9b9>D</FONT><FONT COLOR=#e1c5c5>!</FONT><FONT COLOR=#e6d1d1> </FONT><FONT COLOR=#ebdddd>:</FONT><FONT COLOR=#f1eaea>:</FONT><FONT COLOR=#f5f5f5>.</FONT></center>","output2")
*/
mob/proc
	SparStance()
		if(src.sparlocked)
			src << "An admin has locked you into spar stance. It will be unlocked when you relog or they unlock it"
			return
		if(src.spar)
			src.spar=0
			view(8)<<output("\white <b>[src] is no longer in a sparring stance.","output2")
			AdminMessage("[src]([src.key]) no longer in spar stance")

			//spawn(25)src.spam_delay=0
		else
			src.spar=1
			AdminMessage("[src]([src.key]) is now in spar stance")
			view(8)<<output("\white <b>[src] is now in a sparring stance.","output2")
			src << output("<font color = red><b>You are now in a sparring stance</b><br>While sparring you will match your power with your opponents, making damage percent based. This is useful for training with another player","output2")
			//spawn(25)src.spam_delay=0

mob/var/tmp
	sparlocked=0
	/*
mob/verb
	lockspar()
		set hidden = 1
		if(src.key != "Narmanb" && src.key != "ZeliusXD")
			return
		var/XT=alert("","Lock Spar Stance","Individual","Registered Budokai Members","Cancel")
		var/mob/Targ
		var/list/menus = list()
		menus += "Cancel"
		for(var/mob/PC/N in player)
			menus += N
		if(XT=="Registered Budokai Members")
			var/numlocked = 0
			for(var/mob/PC/O in player)
				if(O.in_budo)
					O << "[src] locked your spar stance"
					O.sparlocked = 1
					O.spar=1
					numlocked++
			src << "You locked [numlocked] players into spar stance"

		if(XT=="Cancel")
			return
		if(XT=="Individual")

			Targ=input("Whom do you wish to teleport to?")as mob in menus
			//WH=usr

			if(!Targ)
				alert("Player logged out.")
			else
				if(Targ.sparlocked)
					Targ.sparlocked = 0
					Targ.spar=0
					player << "[src] unlocked [Targ] spar stance"
					return
				if(!Targ.sparlocked)
					Targ.sparlocked = 1
					Targ.spar=1
					player << "[src] locked [Targ] spar stance"
					return

*/