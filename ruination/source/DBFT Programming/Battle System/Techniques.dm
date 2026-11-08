obj
	var
		tmp
			exploded=0
		canfuse=0
mob
	var
		kiuse=120
		kill=1
		tmp
			beaming=0
			binded=0
			tech_cooldown=0
			killer=""
			attackCD = 0

	proc
		ThousandSlash()
			var/combocount=0
			src.icon_state="swordcombo"
			comboagain
			var/thousanddmg
			var/randPL = round(usr.powerlevel*0.05)
			var/randSTR = round(usr.strength*0.35)
			var/dmgdef = 0
			thousanddmg = round((randPL + randSTR) * usr.weapon_power/100)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return

				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return

				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				step(M,src.dir)
				M.dir=get_dir(M,src)
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				M.powerlevel-= dmgdef
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1

				M.powerlevel-= dmgdef
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
			//	M.powerlevel-=round((src.strength*src.weapon_power)/1000)
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1
				M.powerlevel-= dmgdef
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				step(M,src.dir)
				M.dir=get_dir(M,src)
				//M.powerlevel-=round((src.strength*src.weapon_power)/1000)
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1
				M.powerlevel-= dmgdef
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				M.DeathCheck(src)
			flick("IT",src)
			src.frozen=0
			step(src,src.dir)
			src.frozen=1
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1
				M.powerlevel-= dmgdef
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				//M.powerlevel-=round((src.strength*src.weapon_power)/1000)
				M.DeathCheck(src)
			sleep(2)
			for(var/mob/M in get_step(src,src.dir))
				if(!M)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.KO)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.dead)
					src << "You are dead"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(src.FuseFollower)
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.safe)
					src << "[M] is safe and cannot be attacked"
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				if(M.dead)
					src << "[M] is dead."
					src.doing=0
					src.frozen=0
					src.icon_state=""
					return
				//M.powerlevel-=round((src.strength*src.weapon_power)/1000)
				dmgdef = thousanddmg - (M.defence * (M.weapon_resistance/100))
				if(dmgdef < 1)
					dmgdef = 1
				M.powerlevel-= dmgdef
				if(istype(M,/mob/PC))
					spawn(-1) M.PVPflagged(4)
					spawn(-1) src.PVPflagged(6)
				view() << output("<font color=red><font size = 1>[src] hit [M] for [applycommas(dmgdef)] with thousand sword slash!","default.output2")
				M.DeathCheck(src)
			sleep(2)
			combocount+=1
			if(combocount>3)
				src.icon_state="swordcombo6"
				sleep(20)
				src.doing=0
				src.frozen=0
				src.icon_state=""

				return
			else
				goto comboagain
obj
	var
		TargetList=list()
		setpower=500
		clashable=0
		clashing=0
		tmp
			clashrush=1
	Technique
		ThousandSwordSlash
			verb
				Thousand_Swordslash()
					//var/cost = 5000000+(4000000*usr.kiuse)

					set category = "Techniques"
					set name = "Thousand Swordslash"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+20000
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Thousand Sword Slot")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return

					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.thousandslash_cd)
						usr<<"You must cooldown."
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.ki-=cost
					usr.TechCD("thousandslash",20)
					usr.staminaleft += 100
					usr.doing=1
					usr.frozen=1
					usr.weapon_exp += 1 + round(usr.level/2000)
					usr.Weapon_Level()
					if(prob(usr.weapon))
						usr.weapon_exp += 3 + round(usr.level/500)
						usr.Weapon_Level()
						usr.ThousandSlash()
					else
						usr.doing=0
						usr.frozen=0
						return
/*Hey Kaiju, i want you to copy all the things from if(usr.playerwatch(usr,"Tech Name") dowm to for(var/turf/Floors...
i want to have a seperate cooldown for each technique, i shall attempt to make a cooldown proc that handles all tech cooldowns.
so instead of "
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
do
					if(usr.kiblast_cd)
						usr<<"You must cooldown kiblast."
						return
but change the kiblast to whatever the tech name is that its using then instead of '//usr.tech_cooldown=1'
usr.TechCD("kiblast","select your cooldown in seconds x 10 ie: for a 2 second cooldown on kiblast you would do usr.TechCD("kiblast","20")
Then go to the TechCD proc at the top of the Technique Procs page and add in the following line
if(Tech=="kiblast")
	usr.kiblast_cd=1
	spawn(cd)usr.kiblast_cd=0
do this for all the different techs with the respective tech name.
Then go to the top Technique Procs and after the following line
mob
	var
		tmp
			kiblast_cd=0
			insert new tech_cd=0 <--- right here and then the next on below it
			next new tech_cd=0
*/
		KiBlast
			verb
				Ki_Blast()
					//var/cost = 5000+(200*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.01)*(usr.kiuse/100))+1000

					if(usr.playerwatch==1)
						PlayerWatch(usr,"Ki Blast")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.kiblast_cd)
						usr<<"You must cooldown kiblast."
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
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
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "You are in a Safe Zone!"
							return
					usr.doing=1
					usr.staminaleft += 2
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.TechCD("kiblast","20")
					usr.icon_state="attack"
					spawn(5)usr.icon_state=""
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()

					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					//src.setpower = round(rand(usr.powerlevel/1000,usr.powerlevel/2000) + (rand(rangeA,rangeB)*usr.ki_power))
					usr.doing=0
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/kiblast/M=new/obj/blasts/kiblast(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						//world << "CRIT"
						M.critblast=1
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


/*		FlameBullet
			verb
				Hell_Blitz()
					var/cost = 50000+(2000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Ki Blast")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.kiblast_cd)
						usr<<"You must cooldown kiblast."
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
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
					for(var/turf/Floors/Safe_Zone/S in view(12))
						if(S in oview(12))
							usr << "You are in a Safe Zone!"
							return
					usr.TechCD("kiblast","20")
					usr.icon_state="attack"
					spawn(5)usr.icon_state=""
					//var/obj/Tech/BeamH/A=new
					src.setpower = "100"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 5 + round(usr.level/4000)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Hell Blitz",src.setpower,'Techs.dmi',"blastd",0)
					else
						return*/

		Kamehameha
			verb
				Kamehameha()
					//var/cost = 50000+(10000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000

			//		var/stamcostUse = (usr.ki_use / 100)*50
			//		var/stamCostCast = (usr.ki_cast / 100)*100


			//		25 / stamcost(100) = 10
			//		25 / stamcost(50) = 20
				//	var/cost2 = ((curki * 0.05)*(usr.kiuse/100))+10000
					//world << "Cost: [applycommas(cost)]  cost: [applycommas(cost2)]"
				//	world << "<b><font color=blue>curki: [applycommas(curki)]"
				//	world << "<b><font color=blue>COST: [applycommas(cost)]"
				//	if(usr.playerwatch==1)
				//		PlayerWatch(usr,"Kamehameha")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return

					if(usr.attacking)
						usr<<"You are engaged right now."
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
					//usr.doing=1

					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					/*
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
								*/
				//	usr.frozen=1

			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					////view(8)<<"\white [usr]: KAMEHAMEHA!!!"

					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 10


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/Kamehameha/M=new/obj/blasts/Kamehameha(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()
					//M.Fire3(usr)
					/*
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						var/obj/blasts/Kamehameha/M=new/obj/blasts/Kamehameha(get_step(usr,usr.dir),usr)
						if(trg)
							M.dmg(trg,usr,M)
							return
						M.Fire2()
					else
						return

*/
		X10_Kamehameha
			canfuse=1
			verb
				X10_Kamehameha()
					set name = "KamehamehaX10"
					set src in usr.contents
					set category = "Techniques"
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.10)*(usr.kiuse/100))+50000
				//	world << "<b>curki: [applycommas(curki)]"
				//	world << "<b>COST: [applycommas(cost)]"
					if(usr.playerwatch==1)
						PlayerWatch(usr,"x10 Kamehamaha")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.TenxKamehameha_cd)
						usr<<"You must cooldown."
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
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
					usr.frozen=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.TechCD("10xKamehameha",40)
					usr.overlays+='Charge Red.dmi'
					usr.icon_state="ki2"
					////view(8)<<"\white [usr]: 10x..."


					usr.icon_state="ki3"
					usr.overlays-='Charge Red.dmi'
					spawn(2)
						////view(8)<<"\white [usr]: KAMEHAMEHA!"
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

				//	//var/obj/Tech/BeamH/A=new

					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 30
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
						//usr.FaceTarget()
					var/obj/blasts/TenXKamehameha/M=new/obj/blasts/TenXKamehameha(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		MouthBlast
			canfuse=1
			verb
				Mouth_Blast()
					set name = "Mouth Energy Wave"
					set src in usr.contents
					set category = "Techniques"
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.10)*(usr.kiuse/100))+50000
				//	world << "<b>curki: [applycommas(curki)]"
				//	world << "<b>COST: [applycommas(cost)]"
					if(usr.playerwatch==1)
						PlayerWatch(usr,"x10 Kamehamaha")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.mouthblast_cd)
						usr<<"You must cooldown."
						return
					if(usr.attacking)
						usr<<"You are engaged right now."
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
					usr.frozen=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.TechCD("mouthblast",80)
					//usr.overlays+='Charge Red.dmi'
					usr.icon_state="ki2"
					////view(8)<<"\white [usr]: 10x..."


					usr.icon_state="ki3"
					//usr.overlays-='Charge Red.dmi'
					spawn(2)
						////view(8)<<"\white [usr]: KAMEHAMEHA!"
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

				//	//var/obj/Tech/BeamH/A=new

					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 30
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
						//usr.FaceTarget()
					var/obj/blasts/MouthEnergyWave/M=new/obj/blasts/MouthEnergyWave(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		GalickGun
			canfuse=1
			verb
				Galick_Gun()
					//var/cost = 500000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Galic Gun")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.galickgun_cd)
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
					usr.frozen=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.overlays+='Charge Pink.dmi'
					//src.setpower = round(rand(1750000000,2250000000)+(usr.ki_power*500000000)+(usr.ki/40))
					var/randPL = round(usr.powerlevel*rand(0.05,0.20))
					var/randKI = round(usr.ki*0.3)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.TechCD("galickgun",20)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					////view(8)<<"\white [usr]: GALICK GUN!"
					usr.icon_state="ki3"
					usr.overlays-='Charge Pink.dmi'
					spawn(15)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
					//spawn(25)
					//	usr.tech_cooldown=0
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 20
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/GalickGun/M=new/obj/blasts/GalickGun(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*		ChaosBall
			canfuse=1
			verb
				Chaos_Ball()
					var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Pink.dmi'
					src.setpower = round(rand(75000000,125000000)+(usr.ki_power*51000000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					////view(8)<<"\white [usr]: Chaos..."
					sleep(10)
					////view(8)<<"\white [usr]: Ball..."
					sleep(10)
					////view(8)<<"\white [usr]: HA!"
					usr.icon_state="ki3"
					usr.overlays-='Charge Pink.dmi'
					spawn(15)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackBeam(usr,"Chaos Ball",src.setpower,'Chaos Ball.dmi',0)
					else
						return*/

		FinishBuster
			canfuse=1
			verb
				Finish_Buster()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.08)*(usr.kiuse/100))+20000
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Finish Buster")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.finishbuster_cd)
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
					spawn(8) usr.doing = 0
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					////usr.tech_cooldown=1
					usr.overlays+='Charge Blue.dmi'
					usr.TechCD("finishbuster",30)
	//				src.setpower = round(rand(1500000000,2000000000)+(usr.ki_power*350000000)+(usr.ki/35))
					var/randPL = round(usr.powerlevel*rand(0.05,0.35))
					var/randKI = round(usr.ki*0.20)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					////view(8)<<"\white [usr]: FINISH BUSTER!"

					spawn(2) usr.frozen=0
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					spawn(20)


						usr.icon_state=""

					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FinishBuster/M=new/obj/blasts/FinishBuster(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		FinalFlash
			canfuse=1
			verb
				Final_Flash()
				//	var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.25)*(usr.kiuse/100))+50000

					if(usr.playerwatch==1)
						PlayerWatch(usr,"Final Flash")
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.finalflash_cd)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					usr.TechCD("finalflash",50)


					////view(8)<<"\white [usr]: FINAL..."
				//	usr.icon_state="ff1"
				//	sleep(1)
					////view(8)<<"\white [usr]: FLASH..."
				//	usr.icon_state="ff2"
				//	sleep(1)
				//	//view(8)<<"\white [usr]: HA!"
					//usr.icon_state="ff3"
					spawn(6)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""


					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FinalFlash/M=new/obj/blasts/FinalFlash(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*		FlameBlast
			canfuse=1
			verb
				Hell_Blaze()
					var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					src.setpower = round(rand(75000000,125000000)+(usr.ki_power*48500000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: HELL..."
					sleep(10)
					//view(8)<<"\white [usr]: BLAZE..."
					sleep(10)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					spawn(15)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackBeam(usr,"Hell Blaze",src.setpower,'Techs2.dmi',"hellblaze","hellblazet",0)
					else
						return*/

		FinalShine
			verb
				Final_Shine()
					//var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.20)*(usr.kiuse/100))+40000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.finalshine_cd)
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
					usr.TechCD("finalshine",40)
					usr.doing=1
					usr.frozen=1

					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.overlays+='Charge Green.dmi'

					////view(8)<<"\white [usr]: FINAL..."
					usr.icon_state="ff1"
					sleep(2)
					////view(8)<<"\white [usr]: SHINE..."
					usr.icon_state="ff2"
					sleep(2)
					////view(8)<<"\white [usr]: HA!"
					usr.icon_state="ff3"
					usr.overlays-='Charge Green.dmi'
					spawn(4)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""


					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()

					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/FinalShine/M=new/obj/blasts/FinalShine(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		DeathBeam
			verb
				Death_Beam()
					//var/cost = 5000000+(100000*usr.kiuse)
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.20)*(usr.kiuse/100))+50000
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.deathbeam_cd)
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
					usr.frozen=1

					usr.attackCD = 1
					usr.TechCD("deathbeam",60)
					spawn(6) usr.attackCD = 0

					////view(8)<<"\white [usr]: DEATH BEAM!"

					usr.icon_state="attack"
					spawn(1)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""


					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 25
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DeathBeam/M=new/obj/blasts/DeathBeam(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

		DeathWave
			verb
				Death_Wave()
					//var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.1)*(usr.kiuse/100))+50000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.deathwave_cd)
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
					usr.TechCD("deathwave",40)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.overlays+='Charge Pink.dmi'

					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					////view(8)<<"\white [usr]: DEATH WAVE!"

					usr.frozen=1
					usr.overlays-='Charge Pink.dmi'
					usr.icon_state="ki3"
					spawn(8)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()

					usr.staminaleft += 15
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DeathWave/M=new/obj/blasts/DeathWave(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

		SpecialBeamCannon
			verb
				Special_Beam_Cannon()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.1)*(usr.kiuse/100))+50000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.specialbeamcannon_cd)
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

					usr.TechCD("specialbeamcannon",40)
					usr.frozen=1

					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
//					src.setpower = round(rand(75000000,125000000)+(usr.ki_power*50000000)+(usr.ki/50))
					var/randPL = round(usr.powerlevel*rand(0.05,0.20))
					var/randKI = round(usr.ki*0.35)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					usr.icon_state="sbc1"
					spawn(2)
						usr.icon_state="sbc2"
					////view(8)<<"\white [usr]: SPECIAL BEAM CANNON!"
					spawn(4) usr.icon_state="sbc3"
					spawn(8)
						usr.doing=0

						usr.icon_state=""
					spawn(2) usr.frozen=0

					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 20
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SpecialBeamCannon/M=new/obj/blasts/SpecialBeamCannon(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		Masenko
			canfuse=1
			verb
				Masenko()
					//var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
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
					usr.frozen=1

					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					////view(8)<<"\white [usr]: MASENKO..."
					sleep(4)
					////view(8)<<"\white [usr]: HA!"

					spawn(8)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 15
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/Masenko/M=new/obj/blasts/Masenko(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()




		Dodonpa
			verb
				Dodonpa()
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.35)*(usr.kiuse/100))+35000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.dodonpa_cd)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.TechCD("dodonpa",60)
					usr.frozen=1

					usr.icon_state="ki1"
					//view(8)<<"\white [usr]: DODONPA..."

					spawn(2) //view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					spawn(8)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 60
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/Dodonpa/M=new/obj/blasts/Dodonpa(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()







		CandyRay
			verb
				Candy_Ray()
				//	var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.1)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.candyray_cd)
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
					usr.TechCD("candyray",10)
					usr.frozen=1

					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					//src.setpower = round(rand(100000000,150000000)+(usr.ki_power*49500000)+(usr.ki/200))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
				//	var/randPL = usr.powerlevel*16
				//	var/randKI = round(usr.ki*0.33)
				//	src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.attackCD = 1
					spawn(6)
						usr.frozen=0
						usr.attackCD = 0
					//view(8)<<"\white [usr]: CANDY RAY!"
					usr.icon_state="attack"
					spawn(15)
						usr.doing=0

						usr.icon_state=""
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/CandyRay/M=new/obj/blasts/CandyRay(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

/*
					var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 45
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						A.TechAttackBeam(usr,"Candy Ray",src.setpower,'Techs2.dmi',"candyray","candyrayt","Candy")
					else
						return
*/
		DragonFist
			verb
				Dragon_Fist()
				//	var/cost = 50000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.07)*(usr.kiuse/100))+25000
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

					usr.overlays+='Fist Charge.dmi'
					spawn(3) usr.overlays-='Fist Charge.dmi'
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//view(8)<<"\white [usr]: DRAGON.."

					spawn(2) //view(8)<<"\white [usr]: FIST!"
					flick("attack",usr)
					spawn(20)
						usr.doing=0
						//usr.frozen=0
						usr.icon_state=""
					usr.ki_cast_exp += 4 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 60
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DragonFist/M=new/obj/blasts/DragonFist(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		TriBeam
			verb
				Tri_Beam()
				//	var/cost = 4000000+(100000*usr.kiuse)

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.2)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
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
					//usr.frozen=1
					//usr.tech_cooldown=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0


					usr.icon_state="ki1"
					spawn(4)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: TRIBEAM..."

					spawn(1) //view(8)<<"\white [usr]: HA!"

					spawn(6)
						usr.doing=0
						usr.frozen=0
						usr.icon_state=""

					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 80
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/TriBeam/M=new/obj/blasts/TriBeam(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		LightGrenade
			verb
				Light_Grenade()
				//	var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.lightgrenade_cd)
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
					usr.TechCD("lightgrenade",4)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					usr.overlays+='Charge Yellow.dmi'

					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: LIGHT GRENADE!"
					//usr.frozen=1
					spawn(3)
						usr.overlays-='Charge Yellow.dmi'
						usr.icon_state=""
						usr.frozen=0
						usr.doing=0

					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 15
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/LightGrenade/M=new/obj/blasts/LightGrenade(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


/*		WhirlWindSpin
			verb
				Whirlwind_Spin()
					var/cost = 5000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"whirlwindspin")
					src.setpower = round(rand(75000000,125000000)+(usr.ki_power*51000000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					//view(8)<<"\white [usr]: WHIRLWIND SPIN..."
					sleep(15)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-=icon('Techs.dmi',"whirlwindspin")
					usr.icon_state="attack"
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 450
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Whirlwind Spin",src.setpower,'Techs.dmi',"whirlwindspin",0)
					else
						return*/

		DistructoDisk
			verb
				Distructo_Disk()
					//var/cost = 3500000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.12)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.destructodisk_cd)
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
					usr.TechCD("destructodisk",70)
					//usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"distructodisko")
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					//view(8)<<"\white [usr]: DISTRUCTO..."
					sleep(1)
					//view(8)<<"\white [usr]: DISK!"
					usr.overlays-=icon('Techs.dmi',"distructodisko")
					usr.icon_state="attack"

					spawn(7)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""

					//var/obj/Tech/BeamH/A=new
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 40
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/DestructoDisk/M=new/obj/blasts/DestructoDisk(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()


		KienzanDisk
			verb
				Kienzan_Disk()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.09)*(usr.kiuse/100))+25000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.keizendisk_cd)
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
					usr.TechCD("keizendisk",70)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					usr.overlays+=icon('Techs.dmi',"kienzandisko")


					//view(8)<<"\white [usr]: KIENZAN..."
					sleep(2)
					//view(8)<<"\white [usr]: DISK!"
					usr.overlays-=icon('Techs.dmi',"kienzandisko")
					usr.icon_state="attack"
				//	usr.frozen=1
					spawn(6)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""


					usr.ki_use_exp += 5 + round(usr.level/1500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 40
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T


					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KienzanDisk/M=new/obj/blasts/KienzanDisk(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*		CherryBomb
			verb
				Cherry_Bomb()
					var/cost = 3000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Red.dmi'
					src.setpower = round(rand(50000000,110000000)+(usr.ki_power*40000000)+(usr.ki/150))
			//		src.setpower = rand(70000000,120000000)+round(usr.ki/220)
					//view(8)<<"\white [usr]: CHERRY..."
					sleep(13)
					//view(8)<<"\white [usr]: BOMB..."
					sleep(12)
					//view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2500)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1200)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 450
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/600)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Cherry Bomb",src.setpower,'Blast - Cherry.dmi',"cherrybomb","")
					else
						return

		FireKi
			verb
				Flame_Ki()
					var/cost = 4000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Red.dmi'
					src.setpower = round(rand(100000000,150000000)+(usr.ki_power*52000000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					//view(8)<<"\white [usr]: Flame..."
					sleep(10)
					//view(8)<<"\white [usr]: KI..."
					sleep(10)
					//view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Fire Ki",src.setpower,'Blast - Flame.dmi',"fireki","")
					else
						return
*/
/*		InfernoBlitz
			verb
				Inferno_Blitz()
					var/cost = 60000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Red.dmi'
					src.setpower = round(rand(1500000000,2000000000)+(usr.ki_power*475000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					//view(8)<<"\white [usr]: INFERNO..."
					sleep(13)
					//view(8)<<"\white [usr]: BLITZ..."
					sleep(12)
					//view(8)<<"\white [usr]: HA!"
					usr.icon_state="attack"
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(50)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 1000
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Inferno Blitz",src.setpower,'Blast - Dual Fire Blast.dmi',"infernoblitz","")
					else
						return*/

/*		ArcBlast
			verb
				Arc_Wave()
					var/cost = 4500000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Blue.dmi'
					src.setpower = round(rand(100000000,150000000)+(usr.ki_power*51500000)+(usr.ki/170))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					//view(8)<<"\white [usr]: Arc..."
					sleep(10)
					//view(8)<<"\white [usr]: WAVE..."
					sleep(10)
					//view(8)<<"\white [usr]: HA!"
					usr.frozen=1
					usr.icon_state="attack"
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Arc Wave",src.setpower,'Electric Wave.dmi',"arcwave","")
					else
						return*/

		EnergyCannon
			verb
				Ki_Cannon()
					//var/cost = 4000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+15000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.tech_cooldown)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					usr.overlays+='Charge Green.dmi'
				//	src.setpower = round(rand(75000000,125000000)+(usr.ki_power*50000000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					var/randPL = round(usr.powerlevel*rand(0.05,0.10))
					var/randKI = round(usr.ki*0.10)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					//view(8)<<"\white [usr]: Ki..."
					sleep(2)
					//view(8)<<"\white [usr]: CANNON!"

					usr.icon_state="attack"
					//usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""


					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 15
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/EnergyCannon/M=new/obj/blasts/EnergyCannon(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*		DarkBlast
			verb
				Dark_Blast()
					var/cost = 6000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					src.setpower = round(rand(75000000,120000000)+(usr.ki_power*52500000)+(usr.ki/175))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					//view(8)<<"\white [usr]: Dark..."
					sleep(6)
					//view(8)<<"\white [usr]: KI..."
					sleep(6)
					//view(8)<<"\white [usr]: BLAST..."
					sleep(6)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="attack"
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Dark Ki Blast",src.setpower,'Blast - Dark 2.dmi',"darkkiblast","")
					else
						return

		DarkBomb
			verb
				Dark_Ki_Bomb()
					var/cost = 60000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					src.setpower = round(rand(1750000000,2300000000)+(usr.ki_power*480000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					//view(8)<<"\white [usr]: Dark..."
					sleep(6)
					//view(8)<<"\white [usr]: KI..."
					sleep(6)
					//view(8)<<"\white [usr]: BOMB..."
					sleep(6)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="attack"
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(50)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 1000
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Dark Ki Bomb",src.setpower,'Blast - Dark Small.dmi',"darkbomb","")
					else
						return

		BloodBomb
			verb
				Blood_Bomb()
					var/cost = 60000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge Red.dmi'
					src.setpower = round(rand(2500000000,3000000000)+(usr.ki_power*560000000)+(usr.ki/30))
			//		src.setpower = rand(2500000000,3500000000)+round(usr.ki/80)
					//view(8)<<"\white [usr]: Blood..."
					sleep(7)
					//view(8)<<"\white [usr]: BOMB..."
					sleep(7)
					//view(8)<<"\white [usr]: ATTACK..."
					sleep(7)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Red.dmi'
					usr.icon_state="attack"
					usr.frozen=1
					spawn(20)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(60)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/900)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/400)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 2000
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/220)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Blood Bomb",src.setpower,'Blast of Depravity.dmi',"bloodbomb","")
					else
						return

		HolyBlast
			verb
				Holy_Blast()
					var/cost = 6000000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge White.dmi'
					src.setpower = round(rand(75000000,130000000)+(usr.ki_power*52000000)+(usr.ki/160))
			//		src.setpower = rand(100000000,150000000)+round(usr.ki/200)
					//view(8)<<"\white [usr]: Holy..."
					sleep(12)
					//view(8)<<"\white [usr]: BLAST..."
					sleep(12)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge White.dmi'
					usr.icon_state="attack"
					usr.frozen=1
					spawn(10)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(25)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/2000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 500
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Holy Blast",src.setpower,'Blast - Holy.dmi',"holyblast","")
					else
						return

		LightSphere
			verb
				Light_Sphere()
					var/cost = 60000000+(10000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.tech_cooldown)
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
					//usr.tech_cooldown=1
					usr.overlays+='Charge White.dmi'
					src.setpower = round(rand(1750000000,2250000000)+(usr.ki_power*510000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					//view(8)<<"\white [usr]: Light..."
					sleep(7)
					//view(8)<<"\white [usr]: SPHERE..."
					sleep(7)
					//view(8)<<"\white [usr]: ATTACK..."
					sleep(7)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge White.dmi'
					usr.icon_state="attack"
					usr.frozen=1
					spawn(15)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
					spawn(50)
						usr.tech_cooldown=0
					//var/obj/Tech/BeamH/A=new
					usr.ki_cast_exp += 3 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					usr.staminaleft += 1000
					if(prob(usr.ki_cast/4))
						usr.ki_cast_exp += 6 + round(usr.level/250)
						usr.Ki_Cast_Level()
						//A.TechAttackStraight(usr,"Light Sphere",src.setpower,'Blast - Light.dmi',"lightsphere","")
					else
						return*/

		SSDeadlyBomber
			verb
				SS_Deadly_Bomber()
					//var/cost = 50000000+(20000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.1)*(usr.kiuse/100))+30000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.ssdeadlybomber_cd)
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
					usr.TechCD("ssdeadlybomber",30)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
//					src.setpower = round(rand(2000000000,2500000000)+(usr.ki_power*500000000)+(usr.ki/25))
					usr.frozen=1
					var/randPL = round(usr.powerlevel*rand(0.05,0.35))
					var/randKI = round(usr.ki*0.10)

					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					//view(8)<<"\white [usr]: SS DEADLY BOMBER..."
					sleep(2)
					usr.frozen=0
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="attack"

					spawn(15)

						usr.doing=0
						usr.icon_state=""


					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/SSDeadlyBomber/M=new/obj/blasts/SSDeadlyBomber(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()

		KarmaBomb
			verb
				Negative_Karma_Bomb()
				//	var/cost = 50000000+(20000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.08)*(usr.kiuse/100))+30000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.karmabomb_cd)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
				//	src.setpower = round(rand(1750000000,2250000000)+(usr.ki_power*530000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					usr.TechCD("karmabomb",40)

					//view(8)<<"\white [usr]: NEGATIVE..."
					sleep(2)
					//view(8)<<"\white [usr]: KARMA BOMB!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="attack"
//					usr.frozen=1
					spawn(6)
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""

					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 35
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T

					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/KarmaBomb/M=new/obj/blasts/KarmaBomb(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



		ImprisonmentBall
			verb
				Imprisonment_Ball()
				//	var/cost = 5000000+(20000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.23)*(usr.kiuse/100))+20000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.wrap_cd)
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
					usr.TechCD("wrapattack",80)
					usr.doing=1
					usr.frozen=1

					usr.attackCD = 1
					spawn(8)
						usr.attackCD = 0
						usr.frozen=0
						usr.doing=0
					var/obj/Tech/BindTech/A=new
					usr.ki_use_exp += 4 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
					var/randPL = round(usr.powerlevel*0.01)
					var/randKI = round(usr.ki*0.01)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						A.BindAttack("Imprisonment Ball",'Techs.dmi',"imprisonmentball",src.setpower,usr,"Critical")
					else
						return

		GalacticDonut
			verb
				Galactic_Donut()

					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.23)*(usr.kiuse/100))+20000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.wrap_cd)
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
					usr.attackCD = 1
					usr.TechCD("wrapattack",80)

					usr.doing=1
					usr.frozen=1
					spawn(8)
						usr.attackCD = 0
						usr.frozen=0
						usr.doing=0

					var/obj/Tech/BindTech/A=new

					usr.ki_use_exp += 4 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
					var/randPL = round(usr.powerlevel*0.01)
					var/randKI = round(usr.ki*0.01)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						A.BindAttack("Galactic Donut",'Techs.dmi',"galaticdonut",src.setpower,usr,0)
					else
						return

		DemonShackle
			verb
				Demon_Shackle()
					//var/cost = 5000000+(20000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.23)*(usr.kiuse/100))+20000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.wrap_cd)
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
					usr.attackCD = 1
					usr.TechCD("wrapattack",80)
					usr.doing=1
					usr.frozen=1
					spawn(8)
						usr.attackCD = 0
						usr.frozen=0
						usr.doing=0

					var/obj/Tech/BindTech/A=new

					usr.ki_use_exp += 4 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 40
					var/randPL = round(usr.powerlevel*0.01)
					var/randKI = round(usr.ki*0.01)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						A.BindAttack("Demon Shackle",'Techs.dmi',"demonshackle",src.setpower,usr,0)
					else
						return

		FatWrap
			verb
				Fat_Wrap()
					//var/cost = 5000000+(20000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.23)*(usr.kiuse/100))+20000
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.wrap_cd)
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
					usr.attackCD = 1
					usr.TechCD("wrapattack",80)
					usr.doing=1
					usr.frozen=1

					spawn(8)
						usr.frozen=0
						usr.attackCD = 0
						usr.doing=0

					var/obj/Tech/BindTech/A=new

					usr.ki_use_exp += 4 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
					var/randPL = round(usr.powerlevel*0.01)
					var/randKI = round(usr.ki*0.01)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)

					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						A.BindAttack("Fat Wrap",'Techs.dmi',"fatwrap",src.setpower,usr,0)
					else
						return

		RapidBlast
			verb
				Rapid_Blast()
					var/cost = 50000+(20000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.TechCD("rapidblast",100)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.ki_use_exp += 5 + round(usr.level/1000)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
				//	src.setpower = round(rand(2000000,2500000)+(usr.ki_power*500000)+(usr.ki/100))
			//		src.setpower = rand(2000000,2500000)+round(usr.ki/1000)
					var/randPL = usr.powerlevel*0.01
					var/randKI = usr.ki*0.01
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					spawn(10)
						usr.frozen=0
		//				usr.doing=0
					usr.overlays+='Charge Blue.dmi'
					view(12)<<"\white [usr]: RAPID BLAST!"
					sleep(10)
					usr.overlays-='Charge Blue.dmi'
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/500)
						usr.Ki_Cast_Level()
						var/obj/Tech/KiMissile/A=new
						view(12)<<"\white [usr]: HA!"
						A.icon_state="blastr"
						A.loc=usr.loc
						A.power=round(src.setpower/10)
						//usr.ki-=usr.ki*0.01
						A.owner=usr
						A.dir=usr.dir
						sleep(5)
						var/obj/Tech/KiMissile/B=new
						view(12)<<"\white [usr]: HA!"
						B.icon_state="blastr"
						B.loc=usr.loc
						B.power=round(src.setpower/10)
						//usr.ki-=usr.ki*0.01
						B.owner=usr
						B.dir=usr.dir
						sleep(5)
						var/obj/Tech/KiMissile/C=new
						view(12)<<"\white [usr]: HA!"
						C.icon_state="blastr"
						C.loc=usr.loc
						C.power=round(src.setpower/10)
						//usr.ki-=usr.ki*0.01
						C.owner=usr
						C.dir=usr.dir
						if(usr.level>5000)
							sleep(5)
							var/obj/Tech/KiMissile/D=new
							view(12)<<"\white [usr]: HA!"
							D.icon_state="blastr"
							D.loc=usr.loc
							D.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							D.owner=usr
							D.dir=usr.dir
						if(usr.level>7500)
							sleep(5)
							var/obj/Tech/KiMissile/E=new
							view(12)<<"\white [usr]: HA!"
							E.icon_state="blastr"
							E.loc=usr.loc
							E.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							E.owner=usr
							E.dir=usr.dir
						if(usr.level>10000)
							sleep(5)
							var/obj/Tech/KiMissile/F=new
							view(12)<<"\white [usr]: HA!"
							F.icon_state="blastr"
							F.loc=usr.loc
							F.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							F.owner=usr
							F.dir=usr.dir
						if(usr.level>12500)
							sleep(5)
							var/obj/Tech/KiMissile/G=new
							view(12)<<"\white [usr]: HA!"
							G.icon_state="blastr"
							G.loc=usr.loc
							G.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							G.owner=usr
							G.dir=usr.dir
						if(usr.level>15000)
							sleep(5)
							var/obj/Tech/KiMissile/H=new
							view(12)<<"\white [usr]: HA!"
							H.icon_state="blastr"
							H.loc=usr.loc
							H.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							H.owner=usr
							H.dir=usr.dir
						if(usr.level>17500)
							sleep(5)
							var/obj/Tech/KiMissile/I=new
							view(12)<<"\white [usr]: HA!"
							I.icon_state="blastr"
							I.loc=usr.loc
							I.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							I.owner=usr
							I.dir=usr.dir
						if(usr.level>20000)
							sleep(5)
							var/obj/Tech/KiMissile/J=new
							view(12)<<"\white [usr]: HA!"
							J.icon_state="blastr"
							J.loc=usr.loc
							J.power=round(src.setpower/10)
							//usr.ki-=usr.ki*0.01
							J.owner=usr
							J.dir=usr.dir
						usr.doing=0

					else
						usr.doing=0

						return

		ShineMissile
			verb
				Shine_Missile()
					var/cost = 50000+(50000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.TechCD("rapidblast",100)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 100
				//	src.setpower = round(rand(175000000,225000000)+(usr.ki_power*25000000)+(usr.ki/60))
					var/randPL = usr.powerlevel*0.10
					var/randKI = usr.ki*0.01
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.overlays+='Charge Yellow.dmi'
					view(12)<<"\white [usr]: SHINE..."
					sleep(8)
					view(12)<<"\white [usr]: MISSILE!"
					sleep(1)
					usr.overlays-='Charge Yellow.dmi'
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/350)
						usr.Ki_Cast_Level()
						var/obj/Tech/KiMissile/A=new
						view(12)<<"\white [usr]: HA!"
						A.loc=usr.loc
						A.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						A.owner=usr
						A.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/B=new
						view(12)<<"\white [usr]: HA!"
						B.loc=usr.loc
						B.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						B.owner=usr
						B.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/C=new
						view(12)<<"\white [usr]: HA!"
						C.loc=usr.loc
						C.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						C.owner=usr
						C.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/D=new
						view(12)<<"\white [usr]: HA!"
						D.loc=usr.loc
						D.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						D.owner=usr
						D.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/E=new
						view(12)<<"\white [usr]: HA!"
						E.loc=usr.loc
						E.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						E.owner=usr
						E.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/F=new
						view(12)<<"\white [usr]: HA!"
						F.loc=usr.loc
						F.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						F.owner=usr
						F.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/G=new
						view(12)<<"\white [usr]: HA!"
						G.loc=usr.loc
						G.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						G.owner=usr
						G.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/H=new
						view(12)<<"\white [usr]: HA!"
						H.loc=usr.loc
						H.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						H.owner=usr
						H.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/I=new
						view(12)<<"\white [usr]: HA!"
						I.loc=usr.loc
						I.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						I.owner=usr
						I.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/J=new
						view(12)<<"\white [usr]: HA!"
						J.loc=usr.loc
						J.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						J.owner=usr
						J.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/K=new
						view(12)<<"\white [usr]: HA!"
						K.loc=usr.loc
						K.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						K.owner=usr
						K.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/L=new
						view(12)<<"\white [usr]: HA!"
						L.loc=usr.loc
						L.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						L.owner=usr
						L.dir=usr.dir
						spawn(5)
							usr.doing=0

					else
						spawn(5)
							usr.doing=0

						return

		KiShower
			verb
				Ki_Shower()
					var/cost = 50000+(60000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.TechCD("rapidblast",100)

					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1

					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 125
				//	src.setpower = round(rand(200000000,250000000)+(usr.ki_power*25000000)+(usr.ki/125))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/150)
					var/randPL = usr.powerlevel*0.05
					var/randKI = usr.ki*0.05
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.overlays+='Charge Yellow.dmi'
					view(12)<<"\white [usr]: KI..."
					sleep(10)
					view(12)<<"\white [usr]: SHOWER!"

					usr.overlays-='Charge Yellow.dmi'
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/350)
						usr.Ki_Cast_Level()
						var/obj/Tech/KiMissile/A=new
						view(12)<<"\white [usr]: HA!"
						A.loc=usr.loc
						A.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						A.owner=usr
						A.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/B=new
						view(12)<<"\white [usr]: HA!"
						B.loc=usr.loc
						B.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						B.owner=usr
						B.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/C=new
						view(12)<<"\white [usr]: HA!"
						C.loc=usr.loc
						C.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						C.owner=usr
						C.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/D=new
						view(12)<<"\white [usr]: HA!"
						D.loc=usr.loc
						D.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						D.owner=usr
						D.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/E=new
						view(12)<<"\white [usr]: HA!"
						E.loc=usr.loc
						E.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						E.owner=usr
						E.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/F=new
						view(12)<<"\white [usr]: HA!"
						F.loc=usr.loc
						F.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						F.owner=usr
						F.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/G=new
						view(12)<<"\white [usr]: HA!"
						G.loc=usr.loc
						G.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						G.owner=usr
						G.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/H=new
						view(12)<<"\white [usr]: HA!"
						H.loc=usr.loc
						H.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						H.owner=usr
						H.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/I=new
						view(12)<<"\white [usr]: HA!"
						I.loc=usr.loc
						I.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						I.owner=usr
						I.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/J=new
						view(12)<<"\white [usr]: HA!"
						J.loc=usr.loc
						J.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						J.owner=usr
						J.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/K=new
						view(12)<<"\white [usr]: HA!"
						K.loc=usr.loc
						K.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						K.owner=usr
						K.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/L=new
						view(12)<<"\white [usr]: HA!"
						L.loc=usr.loc
						L.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						L.owner=usr
						L.dir=usr.dir
						spawn(5)
							usr.doing=0

					else
						spawn(5)
							usr.doing=0

						return

		FlameShower
			verb
				Flame_Shower()
					var/cost = 50000+(45000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.doing=1
					//usr.tech_cooldown=1
					usr.TechCD("rapidblast",100)

					usr.ki_use_exp += 5 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 150
					//src.setpower = round(rand(190000000,250000000)+(usr.ki_power*25000000)+(usr.ki/65))
					var/randPL = usr.powerlevel*0.03
					var/randKI = usr.ki*0.02
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.overlays+='Charge Yellow.dmi'
					view(12)<<"\white [usr]: FLAME..."
					sleep(10)
					view(12)<<"\white [usr]: SHOWER!"

					usr.overlays-='Charge Yellow.dmi'
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 6 + round(usr.level/350)
						usr.Ki_Cast_Level()
						var/obj/Tech/KiMissile/A=new
						A.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						A.loc=usr.loc
						A.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						A.owner=usr
						A.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/B=new
						B.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						B.loc=usr.loc
						B.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						B.owner=usr
						B.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/C=new
						C.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						C.loc=usr.loc
						C.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						C.owner=usr
						C.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/D=new
						D.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						D.loc=usr.loc
						D.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						D.owner=usr
						D.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/E=new
						E.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						E.loc=usr.loc
						E.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						E.owner=usr
						E.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/F=new
						F.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						F.loc=usr.loc
						F.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						F.owner=usr
						F.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/G=new
						G.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						G.loc=usr.loc
						G.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						G.owner=usr
						G.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/H=new
						H.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						H.loc=usr.loc
						H.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						H.owner=usr
						H.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/I=new
						I.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						I.loc=usr.loc
						I.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						I.owner=usr
						I.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/J=new
						J.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						J.loc=usr.loc
						J.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						J.owner=usr
						J.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/K=new
						K.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						K.loc=usr.loc
						K.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						K.owner=usr
						K.dir=usr.dir
						sleep(2)
						var/obj/Tech/KiMissile/L=new
						L.icon_state="blastf"
						view(12)<<"\white [usr]: HA!"
						L.loc=usr.loc
						L.power=round(src.setpower/12)
						//usr.ki-=usr.ki*0.02
						L.owner=usr
						L.dir=usr.dir
						spawn(5)
							usr.doing=0

					else
						spawn(5)
							usr.doing=0

						return

		HellZoneGrenade
			verb
				Hell_Zone_Grenade()
					var/cost = 50000+(100000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.attackCD = 1
					usr.TechCD("rapidblast",120)
					spawn(6) usr.attackCD = 0
					usr.doing=1
					//usr.tech_cooldown=1
					usr.ki_cast_exp += 8 + round(usr.level/1000)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 10 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 150
	//				src.setpower = round(rand(1800000000,2300000000)+(usr.ki_power*50000000)+(usr.ki/40))
					var/randPL = usr.powerlevel*0.15
					var/randKI = usr.ki*0.05
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					//usr.frozen=1
					usr.icon_state="spirit bomb"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/Tech/ScatterBlast/A=new
						var/obj/Tech/ScatterBlast/B=new
						var/obj/Tech/ScatterBlast/C=new
						var/obj/Tech/ScatterBlast/D=new
						var/obj/Tech/ScatterBlast/E=new
						var/obj/Tech/ScatterBlast/F=new
						var/obj/Tech/ScatterBlast/G=new
						var/obj/Tech/ScatterBlast/H=new
						var/obj/Tech/ScatterBlast/I=new
						var/obj/Tech/ScatterBlast/J=new
						var/obj/Tech/ScatterBlast/K=new
						var/obj/Tech/ScatterBlast/L=new
						var/obj/Tech/ScatterBlast/M=new
						var/obj/Tech/ScatterBlast/N=new
						var/obj/Tech/ScatterBlast/O=new
						var/obj/Tech/ScatterBlast/P=new
						var/obj/Tech/ScatterBlast/Q=new
						var/obj/Tech/ScatterBlast/R=new
						var/obj/Tech/ScatterBlast/S=new
						var/obj/Tech/ScatterBlast/T=new
						var/obj/Tech/ScatterBlast/U=new
						var/obj/Tech/ScatterBlast/V=new
						var/obj/Tech/ScatterBlast/W=new
						var/obj/Tech/ScatterBlast/X=new
						A.owner=usr
						B.owner=usr
						C.owner=usr
						D.owner=usr
						E.owner=usr
						F.owner=usr
						G.owner=usr
						H.owner=usr
						I.owner=usr
						J.owner=usr
						K.owner=usr
						L.owner=usr
						M.owner=usr
						N.owner=usr
						O.owner=usr
						P.owner=usr
						Q.owner=usr
						R.owner=usr
						S.owner=usr
						T.owner=usr
						U.owner=usr
						V.owner=usr
						W.owner=usr
						X.owner=usr
						view(12)<<"\white [usr]: HA!"
						A.loc=locate(usr.x-4,usr.y+3,usr.z)
						A.dir=NORTHWEST
						A.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						B.loc=locate(usr.x+2,usr.y+5,usr.z)
						B.dir=NORTHEAST
						B.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						C.loc=locate(usr.x,usr.y+2,usr.z)
						C.dir=NORTH
						C.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						D.loc=locate(usr.x-2,usr.y+5,usr.z)
						D.dir=NORTHWEST
						D.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						E.loc=locate(usr.x+4,usr.y+3,usr.z)
						E.dir=NORTHEAST
						E.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						F.loc=locate(usr.x-2,usr.y-2,usr.z)
						F.dir=SOUTHWEST
						F.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						G.loc=locate(usr.x+2,usr.y-5,usr.z)
						G.dir=SOUTHEAST
						G.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						H.loc=locate(usr.x+4,usr.y,usr.z)
						H.dir=EAST
						H.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						I.loc=locate(usr.x-4,usr.y,usr.z)
						I.dir=WEST
						I.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						J.loc=locate(usr.x-2,usr.y-5,usr.z)
						J.dir=SOUTHWEST
						J.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						K.loc=locate(usr.x,usr.y+4,usr.z)
						K.dir=NORTH
						K.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						L.loc=locate(usr.x+2,usr.y-2,usr.z)
						L.dir=SOUTHEAST
						L.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						M.loc=locate(usr.x-2,usr.y+2,usr.z)
						M.dir=NORTHWEST
						M.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						N.loc=locate(usr.x,usr.y-4,usr.z)
						N.dir=SOUTH
						N.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						O.loc=locate(usr.x+2,usr.y+2,usr.z)
						O.dir=NORTHEAST
						O.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						P.loc=locate(usr.x,usr.y-2,usr.z)
						P.dir=SOUTH
						P.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						Q.loc=locate(usr.x-2,usr.y,usr.z)
						Q.dir=WEST
						Q.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						R.loc=locate(usr.x+2,usr.y,usr.z)
						R.dir=EAST
						R.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						S.loc=locate(usr.x+4,usr.y-3,usr.z)
						S.dir=SOUTHEAST
						S.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						T.loc=locate(usr.x-4,usr.y-3,usr.z)
						T.dir=SOUTHWEST
						T.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						U.loc=locate(usr.x,usr.y+6,usr.z)
						U.dir=NORTH
						U.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						V.loc=locate(usr.x-6,usr.y,usr.z)
						V.dir=WEST
						V.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						W.loc=locate(usr.x+6,usr.y,usr.z)
						W.dir=EAST
						W.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						X.loc=locate(usr.x,usr.y-6,usr.z)
						X.dir=SOUTH
						X.power=round(src.setpower/24)
						sleep(15)
						view(12)<<"\white [usr]: SCATTER!"
						spawn(10)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0
					else
						usr.icon_state=""
						spawn(10)
							usr.frozen=0
							usr.doing=0

						return

		GenocideAttack
			verb
				GenocideAttack()
					var/cost = 50000+(200000*usr.kiuse)
					set category = "Techniques"
					set name = "Genocide Attack"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
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
						usr << "You can't use ki right now."
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
					usr.attackCD = 1
					usr.TechCD("rapidblast",120)
					spawn(6) usr.attackCD = 0
					usr.doing=1

					usr.ki_use_exp += 10 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 200
					//src.setpower = round(rand(1750000000,2250000000)+(usr.ki_power*50000000)+(usr.ki/40))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = usr.powerlevel*0.05
					var/randKI = round(usr.ki*0.05)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/Tech/GenocideBlast/A=new
						var/obj/Tech/GenocideBlast/B=new
						var/obj/Tech/GenocideBlast/C=new
						var/obj/Tech/GenocideBlast/D=new
						var/obj/Tech/GenocideBlast/E=new
						var/obj/Tech/GenocideBlast/F=new
						var/obj/Tech/GenocideBlast/G=new
						var/obj/Tech/GenocideBlast/H=new
						var/obj/Tech/GenocideBlast/I=new
						var/obj/Tech/GenocideBlast/J=new
						var/obj/Tech/GenocideBlast/K=new
						var/obj/Tech/GenocideBlast/L=new
						var/obj/Tech/GenocideBlast/M=new
						var/obj/Tech/GenocideBlast/N=new
						var/obj/Tech/GenocideBlast/O=new
						var/obj/Tech/GenocideBlast/P=new
						var/obj/Tech/GenocideBlast/Q=new
						var/obj/Tech/GenocideBlast/R=new
						var/obj/Tech/GenocideBlast/S=new
						var/obj/Tech/GenocideBlast/T=new
						var/obj/Tech/GenocideBlast/U=new
						var/obj/Tech/GenocideBlast/V=new
						var/obj/Tech/GenocideBlast/W=new
						var/obj/Tech/GenocideBlast/X=new
						A.owner=usr
						B.owner=usr
						C.owner=usr
						D.owner=usr
						E.owner=usr
						F.owner=usr
						G.owner=usr
						H.owner=usr
						I.owner=usr
						J.owner=usr
						K.owner=usr
						L.owner=usr
						M.owner=usr
						N.owner=usr
						O.owner=usr
						P.owner=usr
						Q.owner=usr
						R.owner=usr
						S.owner=usr
						T.owner=usr
						U.owner=usr
						V.owner=usr
						W.owner=usr
						X.owner=usr
						view(12)<<"\white [usr]: HA!"
						A.loc=locate(usr.x-2,usr.y+7,usr.z)
						A.dir=WEST
						A.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						B.loc=locate(usr.x+1,usr.y+6,usr.z)
						B.dir=SOUTH
						B.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						C.loc=locate(usr.x-3,usr.y+8,usr.z)
						C.dir=NORTHWEST
						C.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						D.loc=locate(usr.x+1,usr.y+8,usr.z)
						D.dir=NORTH
						D.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						E.loc=locate(usr.x-1,usr.y+6,usr.z)
						E.dir=SOUTH
						E.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						F.loc=locate(usr.x-1,usr.y+8,usr.z)
						F.dir=NORTH
						F.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						G.loc=locate(usr.x+2,usr.y+7,usr.z)
						G.dir=EAST
						G.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						H.loc=locate(usr.x+3,usr.y+8,usr.z)
						H.dir=NORTHEAST
						H.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						I.loc=locate(usr.x,usr.y+5,usr.z)
						I.dir=SOUTHWEST
						I.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						J.loc=locate(usr.x-3,usr.y+6,usr.z)
						J.dir=SOUTHWEST
						J.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						K.loc=locate(usr.x+2,usr.y+5,usr.z)
						K.dir=SOUTHEAST
						K.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						L.loc=locate(usr.x+3,usr.y+6,usr.z)
						L.dir=SOUTHEAST
						L.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						M.loc=locate(usr.x-2,usr.y+5,usr.z)
						M.dir=SOUTHWEST
						M.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						N.loc=locate(usr.x,usr.y+7,usr.z)
						N.dir=SOUTHEAST
						N.power=round(src.setpower/24)
						sleep(2)
						O.loc=locate(usr.x-2,usr.y+3,usr.z)
						O.dir=SOUTHWEST
						O.power=round(src.setpower/24)
						sleep(2)
						P.loc=locate(usr.x+2,usr.y+3,usr.z)
						P.dir=SOUTHWEST
						P.power=round(src.setpower/24)
						sleep(2)
						Q.loc=locate(usr.x-3,usr.y+4,usr.z)
						Q.dir=SOUTHWEST
						Q.power=round(src.setpower/24)
						sleep(2)
						R.loc=locate(usr.x+3,usr.y+4,usr.z)
						R.dir=SOUTHWEST
						R.power=round(src.setpower/24)
						sleep(2)
						S.loc=locate(usr.x-4,usr.y+5,usr.z)
						S.dir=SOUTHWEST
						S.power=round(src.setpower/24)
						sleep(2)
						T.loc=locate(usr.x+4,usr.y+5,usr.z)
						T.dir=SOUTHWEST
						T.power=round(src.setpower/24)
						sleep(2)
						U.loc=locate(usr.x-1,usr.y+4,usr.z)
						U.dir=SOUTHWEST
						U.power=round(src.setpower/24)
						sleep(2)
						V.loc=locate(usr.x+1,usr.y+4,usr.z)
						V.dir=SOUTHWEST
						V.power=round(src.setpower/24)
						sleep(2)
						W.loc=locate(usr.x-4,usr.y+7,usr.z)
						W.dir=SOUTHWEST
						W.power=round(src.setpower/24)
						sleep(2)
						X.loc=locate(usr.x+4,usr.y+7,usr.z)
						X.dir=SOUTHWEST
						X.power=round(src.setpower/24)
						sleep(15)
						usr.icon_state=""
						view(12)<<"\white [usr]: GENOCIDE ATTACK!"
						spawn(10)
							usr.frozen=0
							usr.doing=0

					else
						usr.icon_state=""
						spawn(10)
							usr.frozen=0
							usr.doing=0

						return

		AcidRain
			verb
				Acid_Rain()
					var/cost = 50000+(70000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.rapidblast_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						usr << "You can't use ki right now."
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
					usr.TechCD("rapidblast",120)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1

					usr.ki_use_exp += 10 + round(usr.level/500)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 300
					src.setpower = round(rand(1750000000,2250000000)+(usr.ki_power*50000000)+(usr.ki/40))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = usr.powerlevel*0.1
					var/randKI = round(usr.ki*0.05)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.frozen=1
					usr.icon_state="spirit bomb"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/250)
						usr.Ki_Cast_Level()
						var/obj/Tech/AcidBlast/A=new
						var/obj/Tech/AcidBlast/B=new
						var/obj/Tech/AcidBlast/C=new
						var/obj/Tech/AcidBlast/D=new
						var/obj/Tech/AcidBlast/E=new
						var/obj/Tech/AcidBlast/F=new
						var/obj/Tech/AcidBlast/G=new
						var/obj/Tech/AcidBlast/H=new
						var/obj/Tech/AcidBlast/I=new
						var/obj/Tech/AcidBlast/J=new
						var/obj/Tech/AcidBlast/K=new
						var/obj/Tech/AcidBlast/L=new
						var/obj/Tech/AcidBlast/M=new
						var/obj/Tech/AcidBlast/N=new
						var/obj/Tech/AcidBlast/O=new
						var/obj/Tech/AcidBlast/P=new
						var/obj/Tech/AcidBlast/Q=new
						var/obj/Tech/AcidBlast/R=new
						var/obj/Tech/AcidBlast/S=new
						var/obj/Tech/AcidBlast/T=new
						var/obj/Tech/AcidBlast/U=new
						var/obj/Tech/AcidBlast/V=new
						var/obj/Tech/AcidBlast/W=new
						var/obj/Tech/AcidBlast/X=new
						A.owner=usr
						B.owner=usr
						C.owner=usr
						D.owner+=usr
						E.owner=usr
						F.owner=usr
						G.owner=usr
						H.owner=usr
						I.owner=usr
						J.owner=usr
						K.owner=usr
						L.owner=usr
						M.owner=usr
						N.owner=usr
						O.owner=usr
						P.owner=usr
						Q.owner=usr
						R.owner=usr
						S.owner=usr
						T.owner=usr
						U.owner=usr
						V.owner=usr
						W.owner=usr
						X.owner=usr
						view(12)<<"\white [usr]: HA!"
						A.loc=locate(usr.x-2,usr.y+7,usr.z)
						A.dir=WEST
						A.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						B.loc=locate(usr.x+1,usr.y+6,usr.z)
						B.dir=SOUTH
						B.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						C.loc=locate(usr.x-3,usr.y+8,usr.z)
						C.dir=NORTHWEST
						C.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						D.loc=locate(usr.x+1,usr.y+8,usr.z)
						D.dir=NORTH
						D.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						E.loc=locate(usr.x-1,usr.y+6,usr.z)
						E.dir=SOUTH
						E.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						F.loc=locate(usr.x-1,usr.y+8,usr.z)
						F.dir=NORTH
						F.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						G.loc=locate(usr.x+2,usr.y+7,usr.z)
						G.dir=EAST
						G.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						H.loc=locate(usr.x+3,usr.y+8,usr.z)
						H.dir=NORTHEAST
						H.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						I.loc=locate(usr.x,usr.y+5,usr.z)
						I.dir=SOUTHWEST
						I.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						J.loc=locate(usr.x-3,usr.y+6,usr.z)
						J.dir=SOUTHWEST
						J.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						K.loc=locate(usr.x+2,usr.y+5,usr.z)
						K.dir=SOUTHEAST
						K.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						L.loc=locate(usr.x+3,usr.y+6,usr.z)
						L.dir=SOUTHEAST
						L.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						M.loc=locate(usr.x-2,usr.y+5,usr.z)
						M.dir=SOUTHWEST
						M.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						N.loc=locate(usr.x,usr.y+7,usr.z)
						N.dir=SOUTHEAST
						N.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						O.loc=locate(usr.x-2,usr.y+3,usr.z)
						O.dir=SOUTHWEST
						O.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						P.loc=locate(usr.x+2,usr.y+3,usr.z)
						P.dir=SOUTHWEST
						P.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						Q.loc=locate(usr.x-3,usr.y+4,usr.z)
						Q.dir=SOUTHWEST
						Q.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						R.loc=locate(usr.x+3,usr.y+4,usr.z)
						R.dir=SOUTHWEST
						R.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						S.loc=locate(usr.x-4,usr.y+5,usr.z)
						S.dir=SOUTHWEST
						S.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						T.loc=locate(usr.x+4,usr.y+5,usr.z)
						T.dir=SOUTHWEST
						T.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						U.loc=locate(usr.x-1,usr.y+4,usr.z)
						U.dir=SOUTHWEST
						U.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						V.loc=locate(usr.x+1,usr.y+4,usr.z)
						V.dir=SOUTHWEST
						V.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						W.loc=locate(usr.x-4,usr.y+7,usr.z)
						W.dir=SOUTHWEST
						W.power=round(src.setpower/24)
						sleep(2)
						view(12)<<"\white [usr]: HA!"
						X.loc=locate(usr.x+4,usr.y+7,usr.z)
						X.dir=SOUTHWEST
						X.power=round(src.setpower/24)
						sleep(15)
						usr.icon_state=""
						view(12)<<"\white [usr]: ACID RAIN!"
						spawn(10)
							usr.frozen=0
							usr.doing=0

					else
						usr.icon_state=""
						spawn(10)
							usr.frozen=0
							usr.doing=0

						return

		BurningAttack
			verb
				BurningAttack()
					var/cost = 50000+(200000*usr.kiuse)
					set category = "Techniques"
					set name = "Burning Attack"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
				//	if(usr.tech_cooldown)
				//		usr<<"You must cooldown."
				//		return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.doing=1
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Yellow.dmi'

					usr.ki_use_exp += 10 + round(usr.level/300)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 150
				//	src.setpower = round(rand(1800000000,2300000000)+(usr.ki_power*500000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = round(usr.powerlevel*0.06)
					var/randKI = round(usr.ki*0.15)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: BURNING..."
					sleep(1)
					//view(8)<<"\white [usr]: ATTACK!"
					usr.overlays-='Charge Yellow.dmi'
					usr.icon_state="ki3"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/200)
						usr.Ki_Cast_Level()
						spawn(10)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/BangC/C=new
						var/obj/Tech/BeamH/BangTL/TL=new
						var/obj/Tech/BeamH/BangT/T=new
						var/obj/Tech/BeamH/BangTR/TR=new
						var/obj/Tech/BeamH/BangL/L=new
						var/obj/Tech/BeamH/BangR/R=new
						var/obj/Tech/BeamH/BangBL/BL=new
						var/obj/Tech/BeamH/BangB/B=new
						var/obj/Tech/BeamH/BangBR/BR=new
						C.name="Burning Attack"
						TL.name="Burning Attack"
						T.name="Burning Attack"
						TR.name="Burning Attack"
						L.name="Burning Attack"
						R.name="Burning Attack"
						BL.name="Burning Attack"
						B.name="Burning Attack"
						BR.name="Burning Attack"
						C.owner=usr
						C.loc=usr.loc
						TL.owner=usr
						TL.loc=usr.loc
						T.owner=usr
						T.loc=usr.loc
						TR.owner=usr
						TR.loc=usr.loc
						L.owner=usr
						L.loc=usr.loc
						R.owner=usr
						R.loc=usr.loc
						BL.owner=usr
						BL.loc=usr.loc
						B.owner=usr
						B.loc=usr.loc
						BR.owner=usr
						BR.loc=usr.loc
						C.power=src.setpower
						TL.power=src.setpower
						T.power=src.setpower
						TR.power=src.setpower
						L.power=src.setpower
						R.power=src.setpower
						BL.power=src.setpower
						B.power=src.setpower
						BR.power=src.setpower
						spawn(0)C.UpdateBombTrails()
					else
						spawn(15)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						return

		BigBangAttack
			verb
				BigBangAttack()
					var/cost = 50000000+(15000000*usr.kiuse)
					set category = "Techniques"
					set name = "Big Bang Attack"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
		//			if(usr.tech_cooldown)
		//				usr<<"You must cooldown."
		//				return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Blue.dmi'
					usr.ki_cast_exp += 8 + round(usr.level/500)
					usr.Ki_Cast_Level()
					usr.ki_use_exp += 10 + round(usr.level/300)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 100

			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = round(usr.powerlevel*0.10)
					var/randKI = round(usr.ki*0.20)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: BIG BANG.."
					sleep(1)
					//view(8)<<"\white [usr]: ATTACK!"

					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/200)
						usr.Ki_Cast_Level()
						spawn(10)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/BangC/C=new
						var/obj/Tech/BeamH/BangTL/TL=new
						var/obj/Tech/BeamH/BangT/T=new
						var/obj/Tech/BeamH/BangTR/TR=new
						var/obj/Tech/BeamH/BangL/L=new
						var/obj/Tech/BeamH/BangR/R=new
						var/obj/Tech/BeamH/BangBL/BL=new
						var/obj/Tech/BeamH/BangB/B=new
						var/obj/Tech/BeamH/BangBR/BR=new
						C.icon_state="bb c"
						TL.icon_state="bb tl"
						T.icon_state="bb t"
						TR.icon_state="bb tr"
						L.icon_state="bb l"
						R.icon_state="bb r"
						BL.icon_state="bb bl"
						B.icon_state="bb b"
						BR.icon_state="bb br"
						C.name="Big Bang Attack"
						TL.name="Big Bang Attack"
						T.name="Big Bang Attack"
						TR.name="Big Bang Attack"
						L.name="Big Bang Attack"
						R.name="Big Bang Attack"
						BL.name="Big Bang Attack"
						B.name="Big Bang Attack"
						BR.name="Big Bang Attack"
						C.owner=usr
						C.loc=usr.loc
						TL.owner=usr
						TL.loc=usr.loc
						T.owner=usr
						T.loc=usr.loc
						TR.owner=usr
						TR.loc=usr.loc
						L.owner=usr
						L.loc=usr.loc
						R.owner=usr
						R.loc=usr.loc
						BL.owner=usr
						BL.loc=usr.loc
						B.owner=usr
						B.loc=usr.loc
						BR.owner=usr
						BR.loc=usr.loc
						C.power=src.setpower
						TL.power=src.setpower
						T.power=src.setpower
						TR.power=src.setpower
						L.power=src.setpower
						R.power=src.setpower
						BL.power=src.setpower
						B.power=src.setpower
						BR.power=src.setpower
						spawn(0)C.UpdateBombTrails()
					else
						spawn(15)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						return

		BlasterShell
			verb
				BlasterShell()
					var/cost = 50000000+(15000000*usr.kiuse)
					set category = "Techniques"
					set name = "Blaster Shell"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
				//	if(usr.tech_cooldown)
				//		usr<<"You must cooldown."
				//		return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
						usr<<"You don't have enough ki!"
						return
					if(usr.ki_lock)
						src << "You can't use ki right now."
						return
					if(usr.safe)
						usr << "You can't attack right now."
						return
					if(!usr.pk)
						usr << "Reach level 200000 to be able to use battle techniques."
						return
					if(usr.staminaleft>=usr.staminaleft_max)
						usr << "<font color=#ff0000>You are too tired to fight!</font>"
						return
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.doing=1
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Blue.dmi'

					usr.ki_use_exp += 10 + round(usr.level/300)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 90
					src.setpower = round(rand(1700000000,2150000000)+(usr.ki_power*500000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = usr.powerlevel*0.15
					var/randKI = usr.strength*0.20
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: BLASTER..."
					sleep(2)
					//view(8)<<"\white [usr]: SHELL..."
					sleep(2)
					//view(8)<<"\white [usr]: HA!"
					usr.overlays-='Charge Blue.dmi'
					usr.icon_state="ki3"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/200)
						usr.Ki_Cast_Level()
						spawn(15)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/BangC/C=new
						var/obj/Tech/BeamH/BangTL/TL=new
						var/obj/Tech/BeamH/BangT/T=new
						var/obj/Tech/BeamH/BangTR/TR=new
						var/obj/Tech/BeamH/BangL/L=new
						var/obj/Tech/BeamH/BangR/R=new
						var/obj/Tech/BeamH/BangBL/BL=new
						var/obj/Tech/BeamH/BangB/B=new
						var/obj/Tech/BeamH/BangBR/BR=new
						C.icon_state="bs c"
						TL.icon_state="bs tl"
						T.icon_state="bs t"
						TR.icon_state="bs tr"
						L.icon_state="bs l"
						R.icon_state="bs r"
						BL.icon_state="bs bl"
						B.icon_state="bs b"
						BR.icon_state="bs br"
						C.name="Blaster Shell"
						TL.name="Blaster Shell"
						T.name="Blaster Shell"
						TR.name="Blaster Shell"
						L.name="Blaster Shell"
						R.name="Blaster Shell"
						BL.name="Blaster Shell"
						B.name="Blaster Shell"
						BR.name="Blaster Shell"
						C.owner=usr
						C.loc=usr.loc
						TL.owner=usr
						TL.loc=usr.loc
						T.owner=usr
						T.loc=usr.loc
						TR.owner=usr
						TR.loc=usr.loc
						L.owner=usr
						L.loc=usr.loc
						R.owner=usr
						R.loc=usr.loc
						BL.owner=usr
						BL.loc=usr.loc
						B.owner=usr
						B.loc=usr.loc
						BR.owner=usr
						BR.loc=usr.loc
						C.power=src.setpower
						TL.power=src.setpower
						T.power=src.setpower
						TR.power=src.setpower
						L.power=src.setpower
						R.power=src.setpower
						BL.power=src.setpower
						B.power=src.setpower
						BR.power=src.setpower
						spawn(0)C.UpdateBombTrails()
					else
						spawn(15)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						return

		RevengeDeathBall
			verb
				Revenge_Death_Ball()
					var/cost = 50000000+(15000000*usr.kiuse)
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
		//			if(usr.tech_cooldown)
		//				usr<<"You must cooldown."
		//				return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
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
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					usr.frozen=1
					//usr.tech_cooldown=1
					usr.overlays+='Charge Black.dmi'
					usr.ki_use_exp += 10 + round(usr.level/300)
					usr.Ki_Use_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 150
				//	src.setpower = round(rand(1600000000,23000000000)+(usr.ki_power*500000000)+(usr.ki/35))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/100)
					var/randPL = round(usr.powerlevel*0.25)
					var/randKI = round(usr.ki*0.12)
					src.setpower = round((randPL + randKI) * usr.ki_power/100)
					usr.icon_state="ki1"
					spawn(2)
						usr.icon_state="ki2"
					//view(8)<<"\white [usr]: REVENGE..."
					sleep(2)
					//view(8)<<"\white [usr]: DEATH BALL!"
					usr.overlays-='Charge Black.dmi'
					usr.icon_state="ki3"
					if(prob(usr.ki_cast))
						usr.ki_cast_exp += 12 + round(usr.level/200)
						usr.Ki_Cast_Level()
						spawn(10)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/BangC/C=new
						var/obj/Tech/BeamH/BangTL/TL=new
						var/obj/Tech/BeamH/BangT/T=new
						var/obj/Tech/BeamH/BangTR/TR=new
						var/obj/Tech/BeamH/BangL/L=new
						var/obj/Tech/BeamH/BangR/R=new
						var/obj/Tech/BeamH/BangBL/BL=new
						var/obj/Tech/BeamH/BangB/B=new
						var/obj/Tech/BeamH/BangBR/BR=new
						C.icon_state="rb c"
						TL.icon_state="rb tl"
						T.icon_state="rb t"
						TR.icon_state="rb tr"
						L.icon_state="rb l"
						R.icon_state="rb r"
						BL.icon_state="rb bl"
						B.icon_state="rb b"
						BR.icon_state="rb br"
						C.name="Revenge Death Ball"
						TL.name="Revenge Death Ball"
						T.name="Revenge Death Ball"
						TR.name="Revenge Death Ball"
						L.name="Revenge Death Ball"
						R.name="Revenge Death Ball"
						BL.name="Revenge Death Ball"
						B.name="Revenge Death Ball"
						BR.name="Revenge Death Ball"
						C.owner=usr
						C.loc=usr.loc
						TL.owner=usr
						TL.loc=usr.loc
						T.owner=usr
						T.loc=usr.loc
						TR.owner=usr
						TR.loc=usr.loc
						L.owner=usr
						L.loc=usr.loc
						R.owner=usr
						R.loc=usr.loc
						BL.owner=usr
						BL.loc=usr.loc
						B.owner=usr
						B.loc=usr.loc
						BR.owner=usr
						BR.loc=usr.loc
						C.power=src.setpower
						TL.power=src.setpower
						T.power=src.setpower
						TR.power=src.setpower
						L.power=src.setpower
						R.power=src.setpower
						BL.power=src.setpower
						B.power=src.setpower
						BR.power=src.setpower
						spawn(0)C.UpdateBombTrails()
					else
						spawn(15)
							usr.icon_state=""
							usr.frozen=0
							usr.doing=0

						return

		DimensionSwordAttack
			verb
				Dimension_Sword_Attack()
					//var/cost = 50000+(10000*usr.kiuse)
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.05)*(usr.kiuse/100))+10000
					set category = "Techniques"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.dimensionalswordatk_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
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
					usr.TechCD("dimensionalswordatk",20)
					//usr.frozen=1
					//usr.tech_cooldown=1
					usr.weapon_exp += 3 + round(usr.level/1000)
					usr.Weapon_Level()
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 50
					//src.setpower = round(rand(1800000000,2500000000)+(usr.ki_power*500000000)+(usr.ki/15))
			//		src.setpower = rand(2000000000,2500000000)+round(usr.ki/90)
					var/randPL = round(usr.powerlevel*0.05)
					var/randSTR = round(usr.strength*0.2)
					src.setpower = round((randPL + randSTR) * usr.weapon_power/100)
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0

					//view(8)<<"\white [usr]: DIMENSION..SWORD ATTACK!"

					flick("attack",usr)
					if(prob(usr.weapon))
						usr.ki_use_exp += 5 + round(usr.level/250)
						usr.Ki_Use_Level()
						usr.weapon_exp += 3 + round(usr.level/500)
						usr.Weapon_Level()
						spawn(10)
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/SwordL/L=new
						var/obj/Tech/BeamH/SwordC/C=new
						var/obj/Tech/BeamH/SwordR/R=new
						L.owner=usr
						C.owner=usr
						R.owner=usr
						L.power=round(src.setpower/3)
						C.power=round(src.setpower/3)
						R.power=round(src.setpower/3)
						L.dir=usr.dir
						L.loc=usr.loc
						C.dir=usr.dir
						C.loc=usr.loc
						R.dir=usr.dir
						R.loc=usr.loc
						switch(usr.dir)
							if(NORTHWEST)
								C.dir = NORTH
								C.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTHWEST)
								C.dir = SOUTH
								C.loc=locate(usr.x,usr.y-1,usr.z)
							if(NORTHEAST)
								C.dir = NORTH
								C.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTHEAST)
								C.dir = SOUTH
								C.loc=locate(usr.x,usr.y-1,usr.z)
							if(WEST)
								C.dir = WEST
								C.loc=locate(usr.x-1,usr.y,usr.z)
							if(EAST)
								C.dir = EAST
								C.loc=locate(usr.x+1,usr.y,usr.z)
							if(NORTH)
								C.dir = NORTH
								C.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTH)
								C.dir = SOUTH
								C.loc=locate(usr.x,usr.y-1,usr.z)
						if(C.dir==NORTH)
							L.loc=locate(C.x-1,C.y,C.z)
							R.loc=locate(C.x+1,C.y,C.z)
						if(C.dir==SOUTH)
							L.loc=locate(C.x+1,C.y,C.z)
							R.loc=locate(C.x-1,C.y,C.z)
						if(C.dir==EAST)
							L.loc=locate(C.x,C.y+1,C.z)
							R.loc=locate(C.x,C.y-1,C.z)
						if(C.dir==WEST)
							L.loc=locate(C.x,C.y-1,C.z)
							R.loc=locate(C.x,C.y+1,C.z)
					else
						spawn(5)
							usr.frozen=0
							usr.doing=0

		Sword_Slash
			verb
				Sword_Slash()
					var/curki = round((usr.ki_control * usr.ki_max)/100)
					var/cost = ((curki * 0.005)*(usr.kiuse/100))+500
					set category = "Techniques"
					set name = "Sword Slash"
					set src in usr.contents
					if(techs_on==0)
						usr<<"Techniques have currently been disabled"
						return
					if(usr.dead)
						usr<<"You are dead."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.swordslash_cd)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<=cost)
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
					usr.frozen=1
					usr.TechCD("swordslash",20)
					usr.attackCD = 1
					spawn(1)
						usr.frozen = 0
						usr.doing = 0
					spawn(6) usr.attackCD = 0
					//usr.tech_cooldown=1
					//usr.ki -= cost
					if(usr.hudenabled)
						spawn() usr.updateki()
					usr.staminaleft += 45
					usr.weapon_exp += 1 + round(usr.level/5000)
					usr.Weapon_Level()
					flick("attack",usr)
					var/trg
					var/mob/T=locate(/mob) in get_step(usr,usr.dir)
					if(T)
						trg = T
					if(usr.chosentarget)
						if(!T) spawn(-1) usr.FaceTarget()
					var/obj/blasts/swordslash/M=new/obj/blasts/swordslash(get_step(usr,usr.dir),usr)
					if(prob(usr.ki_cast/4))
						M.critblast=1
					if(trg)
						M.dmg(trg,usr,M)
						return
					M.Fire2()



/*
					if(prob(usr.weapon))
						usr.ki_use_exp += 3 + round(usr.level/1000)
						usr.Ki_Use_Level()
						usr.weapon_exp += 6 + round(usr.level/2500)
						usr.Weapon_Level()
						spawn(5)
							usr.frozen=0
							usr.doing=0

						var/obj/Tech/BeamH/LSword/L=new
						L.owner=usr
						L.power = round(rand(200000000,250000000)+(usr.ki_power*50000000)+(usr.ki/100))
						var/randPL = round(usr.powerlevel*0.05)
						var/randSTR = round(usr.strength*0.25)
						L.power = round((randPL + randSTR) * usr.melee/100)
				//		L.power=rand(200000000,250000000)+round(usr.ki/250)
						L.dir=usr.dir
						switch(usr.dir)
							if(NORTHWEST)
								L.dir = NORTH
								L.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTHWEST)
								L.dir = SOUTH
								L.loc=locate(usr.x,usr.y-1,usr.z)
							if(NORTHEAST)
								L.dir = NORTH
								L.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTHEAST)
								L.dir = SOUTH
								L.loc=locate(usr.x,usr.y-1,usr.z)
							if(WEST)
								L.dir = WEST
								L.loc=locate(usr.x-1,usr.y,usr.z)
							if(EAST)
								L.dir = EAST
								L.loc=locate(usr.x+1,usr.y,usr.z)
							if(NORTH)
								L.dir = NORTH
								L.loc=locate(usr.x,usr.y+1,usr.z)
							if(SOUTH)
								L.dir = SOUTH
								L.loc=locate(usr.x,usr.y-1,usr.z)
						flick("attack",usr)
					else
						spawn(5)
							usr.frozen=0
							usr.doing=0
							*/

obj
	Tech
		BeamH
			LSword
				icon = 'Techs.dmi'
				icon_state = "swordslash"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Sword Slash",src.power,src.owner)
			SwordL
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "l"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)
			SwordC
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "c"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)
			SwordR
				icon = 'Dimension Sword Attack.dmi'
				icon_state = "r"
				layer=150
				New()
					..()
					spawn(0)
						src.SwordAttack("Dimension Sword Attack",src.power,src.owner)

			BangTL
				icon = 'Burning Attack.dmi'
				icon_state = "ba tl"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangT
				icon = 'Burning Attack.dmi'
				icon_state = "ba t"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangTR
				icon = 'Burning Attack.dmi'
				icon_state = "ba tr"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangL
				icon = 'Burning Attack.dmi'
				icon_state = "ba l"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangC
				icon = 'Burning Attack.dmi'
				icon_state = "ba c"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack(src.name,src.power,src.owner)
			BangR
				icon = 'Burning Attack.dmi'
				icon_state = "ba r"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangBL
				icon = 'Burning Attack.dmi'
				icon_state = "ba bl"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangB
				icon = 'Burning Attack.dmi'
				icon_state = "ba b"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
			BangBR
				icon = 'Burning Attack.dmi'
				icon_state = "ba br"
				layer=150
				New()
					..()
					spawn(0)
						src.BangAttack2(src.name,src.power,src.owner)
		ScatterBlast
			icon='Techs.dmi'
			icon_state="scatter"
			name="Scatter Shot"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		KiMissile
			icon='Techs.dmi'
			icon_state="blast"
			name="Ki Missile"
			New()
				..()
				spawn(1)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		GenocideBlast
			icon='Techs.dmi'
			icon_state="genocide"
			name="Genocide Attack"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)
		AcidBlast
			icon='Techs.dmi'
			icon_state="acid"
			name="Acid Rain"
			New()
				..()
				spawn(63)
					if(!src.owner)
						del(src)
						return
					src.Scatter(src.owner)



obj/Technique/SolarFlare
	verb
		Solar_Flare()
			set category = "Techniques"
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.solarflare_cd)
				usr<<"You must cooldown."
				return
			if(usr.attackCD)
				//usr << "You must wait a second before you can attack"
				return
			if(usr.doing||usr.buku)
				usr << "You are already doing something."
				return
			if(usr.dead)
				return
			if(usr.ki_lock)
				return
			if(!usr.pk)
				usr << "You are not a Combatant!"
				return
			if(usr.staminaleft>=usr.staminaleft_max)
				usr << "<font color=#ff0000>You are too tired to fight!</font>"
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in view(8))
					usr << "You are in a Safe Zone!"
					return
			if(usr.ki < 50000)
				usr<<"You don't have enough ki!"
				return
			usr.TechCD("solarflare",120)
			var/damage=usr.ki*usr.kiuse/2

			//var/cost=500000+(4000*usr.kiuse)
			usr.ki -= 50000
			usr.frozen = 1
			usr.attackCD = 1
			spawn(6) usr.attackCD = 0
			usr.doing = 1

			view(8) << "<font color = white>[usr]:</font> SOLAR..."
			sleep(10)
			view(8) << "<font color = white>[usr]:</font> FLARE!"
			usr.frozen = 0
			spawn(5)usr.doing = 0
			for(var/mob/M in view(8))
				if(M.pk && !M.dead)
					if(M != usr)
						if((M.ki/3) < damage)
							M << "[usr] has blinded you!"
							M.sight |= BLIND
							sleep(55)
							M.sight &= ~BLIND
			//spawn(35)usr.tech_cooldown=0

/*obj/Technique/DeathBall
	verb/Death_Ball()
		set category = "Techniques"
		if(usr.karma == "Good")
			src << "You must be Evil to use the Death Ball technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "You are in a Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing||usr.buku)
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
			usr << "Reach level 2000 to be able to use battle techniques."
			return
		if(usr.dead)
			usr<<"You must be alive to use this technique"
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Death Ball!"
			//usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_death_ball/O=new
			O.owner=usr
			O.power = round(rand(2000000000,2500000000)+(usr.ki_power*550000000)+(usr.ki/50))
		//	O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Death Ball?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"You don't have enough ki!"
							for(var/obj/techs/small_death_ball/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							//usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"You don't have enough ki!"
								for(var/obj/techs/small_death_ball/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Death Ball Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
						usr << "<font size = -1><B>Your Death Ball is complete!"
						var/obj/techs/Overlays/Death_Ball_Center/S=new
						S.name="Death Ball"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)

obj/Technique/SpiritBomb
	verb/Spirit_Bomb()
		set category = "Techniques"
		if(usr.karma == "Evil")
			src << "You must be Good to use the Spirit Bomb technique"
			return
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "You are in a Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing||usr.buku)
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
			usr << "Reach level 2000 to be able to use battle techniques."
			return
		if(usr.dead)
			usr<<"You must be alive to use this technique"
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Spirit Bomb!"
			//usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_spirit_bomb/O=new
			O.owner=usr
			O.power = round(rand(2000000000,2500000000)+(usr.ki_power*550000000)+(usr.ki/50))
		//	O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Spirit Bomb?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"You don't have enough ki!"
							for(var/obj/techs/small_spirit_bomb/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							//usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"You don't have enough ki!"
								for(var/obj/techs/small_spirit_bomb/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr.frozen=0
						usr.doing=0
						usr.icon_state=""
						usr << "<font size = -1><B>Your Spirit Bomb is complete!"
						var/obj/techs/Overlays/Spirit_Bomb_Center/S=new
						S.name="Spirit Bomb"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)

obj/Technique/SuperNova
	verb/Super_Nova()
		set category = "Techniques"
		var/db_damage = usr.ki*0.45
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "You are in a Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing||usr.buku)
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
			usr << "Reach level 2000 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into a Super Nova!"
			//usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_super_nova/O=new
			O.owner=usr
			O.power = round(rand(2000000000,2500000000)+(usr.ki_power*550000000)+(usr.ki/50))
		//	O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Super Nova?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"You don't have enough ki!"
							for(var/obj/techs/small_super_nova/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							//usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"You don't have enough ki!"
								for(var/obj/techs/small_super_nova/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Super Nova Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Super Nova is complete!"
						var/obj/techs/Overlays/Super_Nova_Center/S=new
						S.name="Super Nova"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)

obj/Technique/AcidBomb
	verb/Acid_Bomb()
		set category = "Techniques"
		var/db_damage = usr.ki*0.55
		if(db_damage < 0)
			db_damage = 100
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in view(8))
				usr << "You are in a Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing||usr.buku)
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
			usr << "Reach level 2000 to be able to use battle techniques."
			return
		if(db_damage > 0)
			usr << "<font size = -1><B>You begin to concentrate your energy into an Acid Bomb!"
			//usr.ki-=db_damage
			usr.frozen = 1
			usr.doing = 1
			usr.icon_state = "spirit bomb"
			var/obj/techs/small_acid_bomb/O=new
			O.owner=usr
			O.power = round(rand(2000000000,2500000000)+(usr.ki_power*500000000)+(usr.ki/50))
	//		O.power=1
			O.loc=usr.loc
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue Charging the Acid Bomb?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.075)
							usr<<"You don't have enough ki!"
							for(var/obj/techs/small_acid_bomb/O2 in world)
								if(O2.owner==usr)
									del(O2)
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.07
							//usr.ki-=usr.ki_max*0.07
							if(usr.ki<=50000)
								usr<<"You don't have enough ki!"
								for(var/obj/techs/small_acid_bomb/O2 in world)
									if(O2.owner==usr)
										del(O2)
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))
								var/chance = rand(1,8)
								if(chance == 6)
									missile('Acid Bomb Energy.dmi', T, src)
									db_damage += usr.ki_max * 0.05
					else
						db_damage+=O.power
						del(O)
						usr.charging=0
						usr.firing_bomb=1
						usr << "<font size = -1><B>Your Acid Bomb is complete!"
						var/obj/techs/Overlays/Acid_Bomb_Center/S=new
						S.name="Super Nova"
						S.loc=locate(usr.x,usr.y+2,usr.z)
						S.range=0
						S.owner=usr
						S.dir=NORTH
						S.power=db_damage
						spawn(5)S.BombShot()
				sleep(45)

obj/Technique/SpiritBall
	verb/Spirit_Ball()
		set category = "Techniques"
		for(var/turf/Floors/Safe_Zone/S in view(8))
			if(S in oview(8))
				usr << "You are in a Safe Zone!"
				return
		if(usr.tech_cooldown)
			usr<<"You must cooldown."
			return
		if(usr.doing||usr.buku)
			usr<<"You are doing something."
			return
		if(usr.frozen)
			usr<<"You can't move right now."
			return
		if(usr.ki<20000)
			usr<<"You don't have enough ki!"
			return
		if(usr.ki_lock)
			usr << "You can't use ki right now."
			return
		if(usr.safe)
			usr << "You can't attack right now."
			return
		if(!usr.pk)
			usr << "Reach level 2000 to be able to use battle techniques."
			return
		var/db_damage=usr.ki*0.3
		if(db_damage>0)
			usr<<"<font size = -1><B>You begin to concentrate your energy into a Spirit Ball!"
			//usr.ki-=usr.ki*0.3
			usr.frozen=1
			usr.doing=1
			usr.icon_state="attack"
			usr.overlays+=icon('Techs.dmi',"spiritballo")
			usr.charging = 1
			sleep(15)
			while(usr.charging)
				switch(alert(usr,"Continue charging your Spirit Ball?","","Yes","No"))
					if("Yes")
						if(usr.ki<=usr.ki_max*0.055)
							usr<<"You don't have enough ki!"
							usr.overlays-=icon('Techs.dmi',"spiritballo")
							usr.charging=0
							usr.frozen=0
							usr.doing=0
							usr.icon_state=""
							break
						else
							db_damage+=usr.ki_max*0.05
							//usr.ki-=usr.ki_max*0.07
							if(usr.ki<=20000)
								usr<<"You don't have enough ki!"
								usr.overlays -= icon('Techs.dmi',"spiritballo")
								usr.charging=0
								usr.frozen=0
								usr.doing=0
								usr.icon_state=""
								break
							for(var/turf/T in oview(src,8))3
								var/chance = rand(1,6)
								if(chance == 6)
									missile('Spirit Bomb Energy.dmi',T,src)
									db_damage += usr.ki_max * 0.05
					else
						usr.overlays-=icon('Techs.dmi',"spiritballo")
						usr.charging=0
						usr.firing_bomb=1
						var/obj/Tech/BeamH/S=new
						S.icon='Techs.dmi'
						S.icon_state="spiritball"
						S.name="Spirit Ball"
						S.range=0
						S.owner=usr
						S.dir=usr.dir
						S.power=db_damage
						S.loc=usr.loc
						spawn(1)S.BombShot()
				sleep(35)*/


mob/var/tmp/clasharrow=""
mob/var/sauzer_blade = 0
mob/var/sword_power = 0
mob/var/demon_sword = 0
mob/var/regen=0
obj/Technique/SauzerBlade
	verb
		Sauzer_Blade()
			set category = "Techniques"
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			var/ki_cost = usr.ki_max * 0.04
			usr.sword_power = usr.strength_max * 0.2
			if(usr.doing||usr.buku)
				src << "You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "You are in a Safe Zone!"
					return
			if(!usr.sauzer_blade)
				if(usr.ki < ki_cost)
					usr << "You do not have enough Ki to sustain the Sauzer Blade."
					return
				usr << "You wear your Sauzer Blade."
				usr.overlays += 'Sauzer Blade.dmi'
				usr.sauzer_blade = 1
				usr.strength += usr.sword_power
				spawn(1)usr.Sauzer_Cost()
			else
				usr << "You stop using your Sauzer Blade."
				usr.overlays -= 'Sauzer Blade.dmi'
				usr.strength -= usr.sword_power
				if(usr.strength < 1)
					usr.strength = 1
				usr.sauzer_blade = 0
				return



mob
	proc/Sauzer_Cost()
		var/ki_cost = usr.ki_max * 0.04
		if(ki_cost <= 0)
			ki_cost = 1
		if(src.sauzer_blade)
			if(src.ki >= ki_cost)
				src.ki -= ki_cost
				sleep(50)
				src.Sauzer_Cost()
			else
				src << "You do not have enough Ki to sustain the Sauzer Blade."
				src.overlays -= 'Sauzer Blade.dmi'
				src.strength -= src.sword_power
				src.sauzer_blade = 0
				return


obj/Technique/DemonSword
	verb
		Demon_Sword()
			set category = "Techniques"
			var/ki_cost = usr.ki_max * 0.05
			if(techs_on==0)
				usr<<"Techniques have currently been disabled"
				return
			if(usr.doing||usr.buku)
				usr << "You are already doing something!"
				return
			if(usr.buku)
				return
			if(usr.ki_lock)
				usr << "Cannot use this Technique at his time."
				return
			for(var/turf/Floors/Safe_Zone/S in view(8))
				if(S in oview(8))
					usr << "You are in a Safe Zone!"
					return
			if(!usr.demon_sword)
				if(usr.ki < ki_cost)
					usr << "You do not have enough Ki to sustain the Demon Sword."
					return
				usr << "You wear your Demon Sword."
				usr.sword_power = usr.strength_max * 0.2
				if(usr.learn_dimensionsword)
					usr.contents += new/obj/Technique/DimensionSwordAttack
				usr.overlays += 'Demon Sword.dmi'
				usr.demon_sword = 1
				usr.strength += usr.sword_power
				spawn(1)usr.DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in usr)
					del(D)
				usr << "You stop using your Demon Sword."
				usr.overlays -= 'Demon Sword.dmi'
				usr.strength -= usr.sword_power
				usr.demon_sword = 0
				return

mob
	proc/DSword_Cost()
		var/ki_cost = usr.ki_max * 0.04
		if(ki_cost <= 0)
			ki_cost = 1
		if(src.demon_sword)
			if(src.ki >= ki_cost)
				src.ki -= ki_cost
				spawn(50)src.DSword_Cost()
			else
				for(var/obj/Technique/DimensionSwordAttack/D in src)
					del(D)
				src << "You do not have enough Ki to sustain the Demon Sword."
				src.overlays -= 'Demon Sword.dmi'
				src.strength -= src.sword_power
				src.tech_cooldown=0
				src.demon_sword = 0
				return
/*obj/Technique/KiAbsorb
	verb/Ki_Absorb()
		set category = "Combat"
		if(usr.tech_cooldown)
			return
		//usr.tech_cooldown=1
		spawn((usr.speed/1000)+3)usr.tech_cooldown=0
		if(usr.kiabsorb)
			usr<<"You stop absorbing ki."
			usr.kiabsorb=0
			usr.doing=0
			usr.frozen=0
			usr.icon_state=""
			return
		else
			usr<<"You start absorbing ki."
			usr.kiabsorb=1
			usr.doing=1
			usr.frozen=1
			usr.icon_state="attack"
			return*/
obj/Technique/Regenerate
	verb/Regenerate()
		set category = "Techniques"
		if(usr.race=="Majin")
			if(usr.regen_delay)
				return
			usr.regen_delay = 1
			if(usr.regen)
				usr << "<font color = green><b>You stop Regenerating."
				usr.regen = 0
				spawn(25)usr.regen_delay=0
			else
				if(!usr.regen)
					if(!usr.regen_dead)
						usr << "There is no need to regenerate. (Use this technique when you are KO'd and you will heal to full power)"
						return
					usr << "<font color = green><b>You allow your body to Regenerate."
				//	oview(usr) << "<font color = red><b>[usr] begins to regenerate."
					usr.regen = 1
					spawn(25)usr.regen_delay=0
					spawn(1)usr.Regenerate()
		if(usr.race=="Namekian"||usr.race=="Bio Android"||usr.race=="Alien")
			if(usr.regen_delay)
				return
			usr.regen_delay = 1
			if(usr.regen)
				usr << "<font color = green><b>You stop Regenerating."
				oview(usr) << "<font color = red><i>[usr] stops regenerating."
				usr.regen = 0
				spawn(25)usr.regen_delay=0
			else
				if(!usr.regen)
					//usr << "You allow your body to Regenerate."
					usr << "<font color = green><b>You allow your body to Regenerate."
					oview(usr) << "<font color = red><b>[usr] begins to regenerate."
					usr.regen = 1
					spawn(25)usr.regen_delay=0
					spawn(1)usr.Regenerate()

mob
	var
		tmp/kiabsorb=0
	proc
		BindTimer(var/mob/M,var/T,var/D)
			sleep(T)
			if(!src.binded)
				return
			flick("enrage",src)
			src.overlays-=icon('Techs.dmi',"galaticdonut")
			src.overlays-=icon('Techs.dmi',"demonshackle")
			src.overlays-=icon('Techs.dmi',"imprisonmentball")
			src.binded=0
			src.doing=0
			src.frozen=0
			src.boxing=0
	//		src.dualtrain=0
			view(8)<<"\white [src] has broken free!"
			if(D>=0)
				if(!M)return
				if(src.dead)return
				src.powerlevel-=D
				if(M.kill)
					src.DeathCheck(M)
				else
					spawn(0)src.KO()
			return

		Regenerate()
			if(src.race=="Namekian"||src.race=="Bio Android"||src.race=="Alien")
				if(!src.regen)
					return
				//sleep(10)
				if(!src.regen)
					return
				if(src.staminaleft >= src.staminaleft_max)
					src << output("<b><font color = red>You are too tired to continue regenerating.","output2")
					src.regen=0
					return
				else
					//if(src.powerlevel>=src.powerlevel_max)
					if(src.powerlevel >= ((src.powerlevel_max*src.ki_control)/100) && src.ki >= ((src.ki_max*src.ki_control)/100))
						src.powerlevel=(src.powerlevel_max*src.ki_control)/100
						src.ki = (src.ki_max*src.ki_control)/100
						src<<"<b><font color = yellow>Your body is fully regenerated."
						src.regen=0
						if(src.hudenabled)
							spawn() src.updateHealth()
							spawn() src.updateki()
					else
						if(!src.regen)
							return
						var/topnum = 70
						topnum -= src.power_multi
						topnum -= src.ki_multi
						if(src.z != 8)
							if(src.powerlevel < ((src.powerlevel_max*src.ki_control)/100))
								src.powerlevel+=src.powerlevel_max*0.03
							if(src.ki < ((src.ki_max*src.ki_control)/100))
								src.ki += src.ki_max * 0.05
							if(src.hudenabled)
								spawn() src.updateHealth()
								spawn() src.updateki()
							//src.staminaleft+=src.staminaleft_max*0.06
							src.staminaleft += rand(45,topnum)
						else
							if(src.powerlevel < ((src.powerlevel_max*src.ki_control)/100))
								src.powerlevel+=src.powerlevel_max*0.015
							if(src.ki < ((src.ki_max*src.ki_control)/100))
								src.ki += src.ki_max * 0.025
							src.staminaleft += rand(45,topnum)
							if(src.hudenabled)
								spawn() src.updateHealth()
								spawn() src.updateki()
							//src.staminaleft+=src.staminaleft_max*0.03
						src << output("<font size = 1><i><font color = green>Regenerating, Powerlevel: [round(src.powerlevel/src.powerlevel_max*100)]% Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")
						view(src) << output("<font color = red><b>[src] is regenerating!</b>","output2")
						if(src.staminaleft > src.staminaleft_max)
							src.staminaleft = src.staminaleft_max
						spawn(20)src.Regenerate()
			else
				if(usr.race=="Majin")
					if(!src.regen_dead)
						src << "There is no need to regenerate. (Use this technique when you are KO'd and you will heal to full power)"
						return
					sleep(10)
					if(src.powerlevel >= src.powerlevel_max)
						src << "You body is fully regenerated."
						//src.powerlevel = src.powerlevel_max
						src.regen_delay = 0
						//src.ki = src.ki_max
						src.powerlevel = (src.powerlevel_max*src.ki_control)/100
						src.ki = (src.ki_max*src.ki_control)/100
						if(src.hudenabled)
							spawn() src.updateHealth()
							spawn() src.updateki()
						src.doing = 0
						src.frozen = 0
						src.icon_state = ""
						src.density = 1
						src.buku = 0
						src.regen_dead = 0
						src.add_exp = 0
						spawn(300)src.add_exp = src.level
						src.it_lock = 0
						src.ki_lock = 0
						src.buku_lock = 0
						src.attack_lock = 0
					else
						src.powerlevel += src.powerlevel_max*0.15
						if(src.hudenabled)
							spawn() src.updateHealth()
							spawn() src.updateki()
						src.density = 1
						src.frozen=1
						src.doing=1
						src.icon_state = "Regenerate"
						spawn(5)src.Regenerate()
				/*
				if(usr.race=="Majin")
					if(src.staminaleft >= src.staminaleft_max)
						src << output("<b><font color = red>You are too tired to continue regenerating.","output2")
						return
					else
						if(src.powerlevel>=src.powerlevel_max)
							src.powerlevel=src.powerlevel_max
							src<<"Your body is fully regenerated."
							src.regen=0
						else
							if(!src.regen)
								src.frozen = 0
								return
							src.frozen = 1
							src.powerlevel+=src.powerlevel_max*0.03
							src.staminaleft+=src.staminaleft_max*0.06
							src << output("<font size = 1><font color = green>Regenerating, Powerlevel: [round(src.powerlevel/src.powerlevel_max*100)]% Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")
							if(src.staminaleft > src.staminaleft_max)
								src.staminaleft = src.staminaleft_max
							spawn(15)src.Regenerate()
						//src.icon_state = "Regenerate"
						//spawn(15)src.Regenerate()
*/
		RegenerateA()
			set background=1
			spawn while(1)
				if(src.powerlevel < ((src.powerlevel_max * src.ki_control)/100) && src.ki < ((src.ki_max * src.ki_control)/100))
					if(src.powerlevel < ((src.ki_control * src.powerlevel_max)/100))
						src.powerlevel+=src.powerlevel_max*0.03
					if(src.ki < ((src.ki_control * src.ki_max)/100))
						src.ki+=src.ki_max*0.03
					if(src.kidefense < ((src.ki_control * src.kidefense_max)/100))
						src.kidefense+=src.kidefense_max*0.03
					if(src.strength < ((src.ki_control * src.strength_max)/100))
						src.strength+=src.strength_max*0.03
					if(src.defence < ((src.ki_control * src.defence_max)/100))
						src.defence+=src.defence_max*0.03
					if(src.speed < ((src.ki_control * src.speed_max)/100))
						src.speed+=src.speed_max*0.03

					if(src.powerlevel >= ((src.powerlevel_max * src.ki_control)/100) && src.ki >= ((src.ki_max * src.ki_control)/100))
						src.powerlevel=((src.powerlevel_max * src.ki_control)/100)
						src.ki=((src.ki_max * src.ki_control)/100)
						src.kidefense=((src.kidefense_max * src.ki_control)/100)
						src.strength=((src.strength_max * src.ki_control)/100)
						src.defence=((src.defence_max * src.ki_control)/100)
						src.speed=((src.speed_max * src.ki_control)/100)
				sleep(regens)

obj
	Technique
		BlowUp
			verb
				Blow_Up()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.attackCD)
						//usr << "You must wait a second before you can attack"
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<5000000)
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
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.attackCD = 1
					spawn(6) usr.attackCD = 0
					if(usr.race == "Saibaman")
						usr.icon_state = "enrage"
						usr.frozen = 1
						usr.doing=1
						sleep(30)
						new/obj/techs/Overlays/Crater_Center(usr.loc)
						sleep(10)
						for(var/obj/Earth_Dragonballs/O in usr)
							O.loc = usr.loc
						for(var/obj/Namek_Dragonballs/O in usr)
							O.loc = usr.loc
						for(var/obj/Black_Dragonballs/O in usr)
							O.loc = usr.loc
						usr.e_db_1 = 0
						usr.e_db_2 = 0
						usr.e_db_3 = 0
						usr.e_db_4 = 0
						usr.e_db_5 = 0
						usr.e_db_6 = 0
						usr.e_db_7 = 0
						usr.n_db_1 = 0
						usr.n_db_2 = 0
						usr.n_db_3 = 0
						usr.n_db_4 = 0
						usr.n_db_5 = 0
						usr.n_db_6 = 0
						usr.n_db_7 = 0
						usr.b_db_1 = 0
						usr.b_db_2 = 0
						usr.b_db_3 = 0
						usr.b_db_4 = 0
						usr.b_db_5 = 0
						usr.b_db_6 = 0
						usr.b_db_7 = 0
						for(var/turf/Floors/Safe_Zone/S in view(8))
							if(S in oview(8))
								usr << "Safe Zone!"
								usr.DeathCheck(usr)
								return
						for(var/mob/M in oview(8,usr))
							var/damage = round(rand(2000000000,2500000000)+(usr.ki_power*500000000)+(usr.ki))
							if(!M.dead&&!M.safe&&M.pk)
								var/turf/CL=M.loc
								for(var/turf/Floors/Safe_Zone/SZ in CL)
									if(SZ in CL)
										continue
								var/damage2=(damage-round((M.kidefense*M.ki_res)/125))/(((2+get_dist(usr,M))/2))
								if(damage2<0)
									damage2=0
								M.powerlevel-=damage2
								M.ki_res_exp += 5+round(M.level/100)
								M.Ki_Res_Level()
								M.DeathCheck(usr)
						usr.powerlevel=0
						usr.DeathCheck(usr)
						return

/*
Crimson bug fix patch 2.6
removed gigantic meteor as it bugged legendary power up
		GiganticMeteor
			verb
				Gigantic_Meteor()
					set category = "Techniques"
					if(usr.tech_cooldown)
						usr<<"You must cooldown."
						return
					if(usr.doing||usr.buku)
						usr<<"You are doing something."
						return
					if(usr.frozen)
						usr<<"You can't move right now."
						return
					if(usr.ki<50000)
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
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "You are in a Safe Zone!"
							return
					usr.overlays+='Gigantic Meteor.dmi'
					usr.frozen = 1
					usr.doing=1
					//usr.tech_cooldown=1
					sleep(35)
					usr.overlays-='Gigantic Meteor.dmi'
					sleep(5)
					new/obj/techs/Overlays/Crater_Center(usr.loc)
					for(var/turf/Floors/Safe_Zone/S in view(8))
						if(S in oview(8))
							usr << "Safe Zone!"
							usr.ki=0
							usr.frozen=0
							usr.doing=0
							return
					for(var/mob/M in oview(8,usr))
						var/damage = round(rand(200000000,250000000)+(usr.ki_power*150000000)+(usr.ki/50))
						if(!M.dead&&!M.safe&&M.pk)
							var/turf/CL=M.loc
							for(var/turf/Floors/Safe_Zone/SZ in CL)
								if(SZ in CL)
									continue
							var/damage2=(damage-round((M.kidefense*M.ki_res)/125))/(((2+get_dist(usr,M))/2))
							if(damage2<0)
								damage2=0
							M.powerlevel-=damage2
							M.ki_res_exp += 5+round(M.level/100)
							M.Ki_Res_Level()
							M.DeathCheck(usr)
					usr.ki=0
					usr.frozen=0
					usr.doing=0
					usr.tech_cooldown=0
					return
					*/