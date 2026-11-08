obj
	Technique
/*
		BurningDragon
			verb
				Burning_Dragon()
					//var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Burning Dragon Fist"
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.dragonfist_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return

					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.doing=1
					usr.TechCD("dragonfist",60)
					usr.frozen=1
					usr.overlays+='Fist Charge.dmi'
					spawn(2) usr.overlays-='Fist Charge.dmi'
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					flick("attack",usr)
					spawn(20)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					usr.ki -= cost
					usr.staminaleft += 1250
					var/trg
					for(var/mob/M in oview(1))
						if(istype(M,/mob/PC)||istype(M,/mob/Monster)||istype(M,/mob/SPECIAL))
							if(usr.dir==NORTH&&M.y==usr.y+1&&M.x==usr.x)
								trg = M
							else if(usr.dir==SOUTH&&M.y==usr.y-1&&M.x==usr.x)
								trg = M
							else if(usr.dir==WEST&&M.x==usr.x-1&&M.y==usr.y)
								trg = M
							else if(usr.dir==EAST&&M.x==usr.x+1&&M.y==usr.y)
								trg = M

					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/blasts/BurningDragon/M=new/obj/blasts/BurningDragon(get_step(usr,usr.dir),usr)
						if(trg)
							M.dmg(trg,usr,M)
							return
						M.Fire2()
						//A.TechAttackBeam(usr,"Dragon Fist",src.setpower,'Techs2.dmi',"dragonfist","dragonfistt","Critical")
					else
						return


		DamnedShark
			verb
				Damned_Shark()
					var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Damned Shark"
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.dragonfist_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.doing=1
					usr.TechCD("dragonfist",60)
					usr.frozen=1
					usr.overlays+='Fist Charge.dmi'
					spawn(2) usr.overlays-='Fist Charge.dmi'
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					flick("attack",usr)
					spawn(20)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					usr.ki -= cost
					usr.staminaleft += 1250
					var/trg
					for(var/mob/M in oview(1))
						if(istype(M,/mob/PC)||istype(M,/mob/Monster)||istype(M,/mob/SPECIAL))
							if(usr.dir==NORTH&&M.y==usr.y+1&&M.x==usr.x)
								trg = M
							else if(usr.dir==SOUTH&&M.y==usr.y-1&&M.x==usr.x)
								trg = M
							else if(usr.dir==WEST&&M.x==usr.x-1&&M.y==usr.y)
								trg = M
							else if(usr.dir==EAST&&M.x==usr.x+1&&M.y==usr.y)
								trg = M

					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/blasts/DamnedShark/M=new/obj/blasts/DamnedShark(get_step(usr,usr.dir),usr)
						if(trg)
							M.dmg(trg,usr,M)
							return
						M.Fire2()
						//A.TechAttackBeam(usr,"Dragon Fist",src.setpower,'Techs2.dmi',"dragonfist","dragonfistt","Critical")
					else
						return


		DeadBeam
			verb
				DeadBeam()
					var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					set name = "Dead Beam"
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.dragonfist_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.doing=1
					usr.TechCD("dragonfist",60)
					usr.frozen=1
					usr.overlays+='Fist Charge.dmi'
					spawn(2) usr.overlays-='Fist Charge.dmi'
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					flick("attack",usr)
					spawn(20)
						usr.doing=0*
						usr.frozen=0
						usr.icon_state=""
					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					usr.ki -= cost
					usr.staminaleft += 1250
					var/trg
					for(var/mob/M in oview(1))
						if(istype(M,/mob/PC)||istype(M,/mob/Monster)||istype(M,/mob/SPECIAL))
							if(usr.dir==NORTH&&M.y==usr.y+1&&M.x==usr.x)
								trg = M
							else if(usr.dir==SOUTH&&M.y==usr.y-1&&M.x==usr.x)
								trg = M
							else if(usr.dir==WEST&&M.x==usr.x-1&&M.y==usr.y)
								trg = M
							else if(usr.dir==EAST&&M.x==usr.x+1&&M.y==usr.y)
								trg = M

					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/blasts/DeadBeam/M=new/obj/blasts/DeadBeam(get_step(usr,usr.dir),usr)
						if(trg)
							M.dmg(trg,usr,M)
							return
						M.Fire2()
						//A.TechAttackBeam(usr,"Dragon Fist",src.setpower,'Techs2.dmi',"dragonfist","dragonfistt","Critical")
					else
						return
						*/

		BlackStorm //1 Demon
			verb
				Black_Storm()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Black Storm!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 7
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/BlackStorm/M=new/obj/blasts/BlackStorm(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		FurryBreaker //1 Demon
			verb
				Furry_Breaker()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Furry Breaker !"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 6
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FurryBreaker/M=new/obj/blasts/FurryBreaker(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		MajinStriker //1  Majin Wizard
			verb
				Majin_Striker()
				//	var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Majin Striker!"  // NAME

					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/MajinStriker/M=new/obj/blasts/MajinStriker(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		KiSoul // Saiyan
			verb
				Ki_Soul_Blast()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Ki Soul Blast!"  // NAME

					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KiSoul/M=new/obj/blasts/KiSoul(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		ImmortalFlame //Dragon333
			verb
				Immortal_Flame()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Immortal Flame!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/ImmortalFlame/M=new/obj/blasts/ImmortalFlame(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		CandyBomb // Majin
			verb
				Candy_Bomb()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Candy Bomb!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/CandyBomb/M=new/obj/blasts/CandyBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		FrostBite //Changling
			verb
				Frost_Bite()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Frost Bite!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FrostBite/M=new/obj/blasts/FrostBite(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		VortexSkip //1
			verb
				Vortex_Skip()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Vortex Skip!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/VortexSkip/M=new/obj/blasts/VortexSkip(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		TrooperBomb //1
			verb
				Trooper_Bomb()
				//	var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Trooper Bomb!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T



					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/TrooperBomb/M=new/obj/blasts/TrooperBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		KiNeedles //1
			verb
				Ki_Needles()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Ki Needles!"  // NAME

					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T




					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KiNeedles/M=new/obj/blasts/KiNeedles(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		AntiMatter //1
			verb
				Anti_Matter()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Anti Matter!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/AntiMatter/M=new/obj/blasts/AntiMatter(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		GigaDrop //1
			verb
				Giga_Drop()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Giga Drop!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GigaDrop/M=new/obj/blasts/GigaDrop(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		StoneToss //1
			verb
				Stone_Toss()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Stone Toss!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/StoneToss/M=new/obj/blasts/StoneToss(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		DragonTempest //1
			verb
				Dragon_Tempest()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Dragon Tempest!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DragonTempest/M=new/obj/blasts/DragonTempest(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		OrbitExplosion //1
			verb
				Orbit_Explosion()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Orbit Explosion!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/OrbitExplosion/M=new/obj/blasts/OrbitExplosion(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		BeamFurry //1
			verb
				Beam_Furry()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Beam Furry!"  // NAME

					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/BeamFurry/M=new/obj/blasts/BeamFurry(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		SoulPierce //1
			verb
				Soul_Pierce()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Soul Pierce!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SoulPierce/M=new/obj/blasts/SoulPierce(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

/*

		FurryBreaker //1
			verb
				Furry_Breaker()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Furry Breaker!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FurryBreaker/M=new/obj/blasts/FurryBreaker(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

*/



		KiSiege //1
			verb
				Ki_Siege()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Ki Siege!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KiSiege/M=new/obj/blasts/KiSiege(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		MysticSpirit //1
			verb
				Mystic_Spirit()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Mystic Spirit!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/MysticSpirit/M=new/obj/blasts/MysticSpirit(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()





		GrandKiBlast //1
			verb
				Grand_Ki_Bomb()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Grand Ki Blast!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GrandKiBlast/M=new/obj/blasts/GrandKiBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		KiPunch
			verb
				Iron_Fist()
					var/cost = 500+(100*usr.kiuse)
					set category = "Combat"
					set name = "Iron Fist"
					set src in usr.contents

					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.kipunch_cd)
						//usr << "You must wait a second before you can attack"
						return

					if(usr.attacking)
						usr<<"You are engaged right now."
						return
					if(usr.doing||usr.burst_delay)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					//usr.doing=1
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(!usr.attackCD)
						usr.attackCD = 1
						spawn(20) usr.attackCD = 0
					//view(8)<<"\white [usr] strikes the air and a surge of energy flies forward"
					usr.TechCD("kipunch",3)
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
				//	usr.ki_use_exp += 5 + round(usr.level/1000)
				//	usr.Ki_Use_Level()
					////usr.ki -= cost
				//	usr.staminaleft+=usr.staminaleft_max*0.002
					usr.staminaleft += 10

					var/obj/blasts/kipunch/M=new/obj/blasts/kipunch(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		shieldsmash
			verb
				Shield_Smash()
					//var/cost = 500+(100*usr.kiuse)
					set category = "Combat"
					set name = "Shield Smash"
					set src in usr.contents

					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.shieldsmash_cd)
						//usr << "You must wait a second before you can attack"
						return

					if(usr.attacking)
						usr<<"You are engaged right now."
						return
					if(usr.doing||usr.burst_delay)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
		//			if(usr.ki<cost)
		//				usr<<"You don't have enough ki!"
		//				return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 2000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					//usr.doing=1
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(!usr.attackCD)
						usr.attackCD = 1
						spawn(20) usr.attackCD = 0
					//view(8)<<"\white [usr] strikes the air and a surge of energy flies forward"
					usr.TechCD("shieldsmash",6)
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
				//	usr.ki_use_exp += 5 + round(usr.level/1000)
				//	usr.Ki_Use_Level()
					//usr.ki -= cost
				//	usr.staminaleft+=usr.staminaleft_max*0.002
					usr.staminaleft += 15

					var/obj/blasts/shieldsmash/M=new/obj/blasts/shieldsmash(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()









		DesolateFlame //1
			verb
				Desolate_Flame()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DesolateFlame/M=new/obj/blasts/DesolateFlame(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()






		BibidiBlaze//1
			verb
				Bibidi_Blaze()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/BibidiBlaze/M=new/obj/blasts/BibidiBlaze(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()





		KiStone //1
			verb
				Ki_Stone()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1

					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KiStone/M=new/obj/blasts/KiStone(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()






		ShenronsWrath //1
			verb
				Shenrons_Wrath()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/ShenronsWrath/M=new/obj/blasts/ShenronsWrath(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()






		MajinRazor //1
			verb
				Majin_Razor()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/MajinRazor/M=new/obj/blasts/MajinRazor(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		DeathBomb //1
			verb
				Death_Bomb()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DeathBomb/M=new/obj/blasts/DeathBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		TimeSoul //1
			verb
				Time_Soul()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/TimeSoul/M=new/obj/blasts/TimeSoul(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		PrideSpazm //1
			verb
				Pride_Spazm()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/PrideSpazm/M=new/obj/blasts/PrideSpazm(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		AndroidBomb //1
			verb
				Android_Bomb()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/AndroidBomb/M=new/obj/blasts/AndroidBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()






		GigaSpear //1
			verb
				Giga_Spear()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GigaSpear/M=new/obj/blasts/GigaSpear(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		NerfMissles //1
			verb
				Nerf_Missles()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/NerfMissles/M=new/obj/blasts/NerfMissles(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		SealBraze //1
			verb
				Seal_Braze()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SealBraze/M=new/obj/blasts/SealBraze(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		DestructiveBlast //1
			verb
				Destructive_Blast()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DestructiveBlast/M=new/obj/blasts/DestructiveBlast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		RageBall //1
			verb
				Rage_Ball()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/RageBall/M=new/obj/blasts/RageBall(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		SaibaStake //1
			verb
				Saiba_Stake()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SaibaStake/M=new/obj/blasts/SaibaStake(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		KamisWisdom //1
			verb
				Kamis_Wisdom()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KamisWisdom/M=new/obj/blasts/KamisWisdom(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		TyrantBlaze //1
			verb
				Tyrant_Blaze()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/TyrantBlaze/M=new/obj/blasts/TyrantBlaze(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		SpiritWisp //1
			verb
				Spirit_Wisp()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SpiritWisp/M=new/obj/blasts/SpiritWisp(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		MasenkoBomb //1
			verb
				Masenko_Bomb()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/MasenkoBomb/M=new/obj/blasts/MasenkoBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()





		LegacyKiDrop //1
			verb
				Legacy_Ki_Drop()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/LegacyKiDrop/M=new/obj/blasts/LegacyKiDrop(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()
/*

		TyrantBlaze //1
			verb
				Tyrant_Blaze()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",40)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/TyrantBlaze/M=new/obj/blasts/TyrantBlaze(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()





*/


		TripleKiBlast//1
			verb
				Triple_Ki_Blasts()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.155)*(usr.kiuse/100))+10000
					if(usr.z == 8)
						cost *= 2
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return

					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 10
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
				//	view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					var/trg=0
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()

					var/turf/techloc = get_step(usr.loc,usr.dir)
					var/turf/techloc2 = get_step(usr,turn(usr.dir,90))
					var/turf/techloc3= get_step(usr,turn(usr.dir,-90))


					var/obj/blasts/TripleKiBlast/N=new(techloc2,usr)
					var/trg2=0
					var/trg3=0
					for(var/mob/M1 in techloc2)
						if(istype(M1,/mob/PC)||istype(M1,/mob/Monster))
							trg2=1
							spawn(2) N.dmg(M1,usr,N)
					if(!trg2)
						//world<<output("[N.name]created","infoPane.infoOutput")
						spawn() N.Fire2()
					var/obj/blasts/TripleKiBlast/O=new(techloc3,usr)
					//O.name="<font color = yellow>KB3"
					for(var/mob/M2 in techloc3)
						if(istype(M2,/mob/PC)||istype(M2,/mob/Monster))
							trg3=1
							spawn() O.dmg(M2,usr,O)
					if(!trg3)
						//world<<output("[O.name]created","infoPane.infoOutput")
						spawn() O.Fire2()
					usr.icon_state=""
					var/obj/blasts/TripleKiBlast/M=new(techloc,usr)
					if(trg)

						M.dmg(trg,usr,M)
						return
					//world<<output("[M.name]created","infoPane.infoOutput")
					//B.loc=get_step(usr,turn(usr.dir,90))
					M.Fire2()



/*
		TripleKiBlast//1
			verb
				Triple_Ki_Blast()
					//var/cost = 10000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.generic2_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("generic2",20)
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view()<<"\white[usr]: [src.name]!"
					//spawn(1)
					usr.frozen=0
					usr.doing=0
					var/trg=0
					for(var/mob/M in oview(1))
						if(istype(M,/mob/PC)||istype(M,/mob/Monster))
							if(usr.dir==NORTH&&M.y==usr.y+1&&M.x==usr.x)
								trg = M
							else if(usr.dir==SOUTH&&M.y==usr.y-1&&M.x==usr.x)
								trg = M
							else if(usr.dir==WEST&&M.x==usr.x-1&&M.y==usr.y)
								trg = M
							else if(usr.dir==EAST&&M.x==usr.x+1&&M.y==usr.y)
								trg = M
					var/turf/techloc = get_step(usr.loc,usr.dir)
					var/turf/techloc2
					var/turf/techloc3

					if(usr.dir==NORTH)
						techloc2 = get_step(locate(usr.x+1,usr.y-1,usr.z),usr.dir)
						techloc3 = get_step(locate(usr.x-1,usr.y-1,usr.z),usr.dir)
					if(usr.dir==SOUTH)
						techloc2 = get_step(locate(usr.x+1,usr.y+1,usr.z),usr.dir)
						techloc3 = get_step(locate(usr.x-1,usr.y+1,usr.z),usr.dir)
					if(usr.dir==EAST)
						techloc2 = get_step(locate(usr.x-1,usr.y-1,usr.z),usr.dir)
						techloc3 = get_step(locate(usr.x-1,usr.y+1,usr.z),usr.dir)
					if(usr.dir==WEST)
						techloc2 = get_step(locate(usr.x+1,usr.y+1,usr.z),usr.dir)
						techloc3 = get_step(locate(usr.x+1,usr.y-1,usr.z),usr.dir)
					var/obj/blasts/kiblast/N=new(techloc2,usr)
					var/trg2=0
					var/trg3=0
					for(var/mob/M1 in techloc2)
						if(istype(M1,/mob/PC)||istype(M1,/mob/Monster))
							trg2=1
							spawn(2) N.dmg(M1,usr,N)
					if(!trg2)
						//world<<output("[N.name]created","infoPane.infoOutput")
						spawn() N.Fire2()
					var/obj/blasts/kiblast/O=new(techloc3,usr)
					O.name="<font color = yellow>KB3"
					for(var/mob/M2 in techloc3)
						if(istype(M2,/mob/PC)||istype(M2,/mob/Monster))
							trg3=1
							spawn() O.dmg(M2,usr,O)
					if(!trg3)
						//world<<output("[O.name]created","infoPane.infoOutput")
						spawn() O.Fire2()
					usr.icon_state=""
					var/obj/blasts/kiblast/M=new(techloc,usr)
					if(trg)

						M.dmg(trg,usr,M)
						return
					//world<<output("[M.name]created","infoPane.infoOutput")
					//B.loc=get_step(usr,turn(usr.dir,90))
					M.Fire2()

*/


/*
		GigaDrop //1
			verb
				Giga_Drop()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Giga Drop!"  // NAME
					spawn(1)
					usr.frozen=0
					usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					usr.ki -= cost
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GigaDrop/M=new/obj/blasts/GigaDrop(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

					*/


		TraceNuke
			verb
				Trace_Nuke()
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.15)*(usr.kiuse/100))+10000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.z==8)
						usr << "You can't use this here!"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tracenuke_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing && !usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<cost)
						usr<<"Your ki is too low."
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "You are not a Combatant!"
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("tracenuke",45)
				//	usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					view(6)<<"\white[usr]: Trace Nuke!"  // NAME
					spawn(1)
						usr.frozen=0
					//	usr.doing=0
					usr.ki_use_exp += 5 + round(usr.level/600)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 5
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/tracenuke/M=new/obj/blasts/tracenuke(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()
