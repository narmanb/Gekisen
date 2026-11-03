





mob/var
	Damage
	pierce=0
	tmp/blockin = 0
	tmp/healing = 0
	tmp/paralyze = 0
//	list/BlastList=new()
	//BEAMSTRUGGLE
	tmp/mob/Target		//Monster's current target
	tmp/mob/Shooter
	tmp/chosentarget = 0

//obj/var
//	Damage
mob/var
	tmp
		list/BlastList=new()
obj/var
	shootspeed=1
	traveltile = 0 //which your stepsize hits 32 (8 stepsize into 32 is 4)
	freeze=0
	critblast=0
	hastarget=0
//	pierce=0
obj/blasts
	icon = 'Techs.dmi'
	Del()
	//	usr << "deleted [src] t: [src.Trail]"
		if(src.type==/obj/blasts/trails) return ..()

		return ..()




	Move()
		//if(src.length >= src.mlength){del src;return}

//		if(istype(src,/mob/Destroyable/VAULT))
	//	if(istype(src.loc,/turf/Earth/goodwater)) continue
			//world<<"Oh Noezz!"

		if(src.length >= src.mlength)
			if(src.splashrange>0)
				var/locc = locate(src.x,src.y,src.z)

				Explosion(src.splashrange,locc,src,src.Damage * 0.5,src)

			for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
//			for(var/obj/blasts/trails/T in src.Shooter.BlastList)
//				T.loc = null
//				T.Shooter = null

//				src.Shooter.BlastList -= T




			del src


		//	src.loc = null
		//	src.name = "GC Projectile"
		//	src.Shooter = null
		//	src.Shooter.BlastList -= src


			return
		src.length++
		if(!src.Trail) return ..() //No further override needed if no trails
		if(src.Trail)
			var/objpath="/obj/blasts/trails/[src.name]"
			var/obj/blasts/NewObj=new objpath(src.loc)

			NewObj.dir=src.dir
			NewObj.Shooter=src.Shooter
			NewObj.Shooter.BlastList+=NewObj
//		var/mob/M = locate() in src.loc
//		if(M && !M.density)
//			world << "MOB [M] FOUND BY [src]"
//			src.Bump(M)






/*
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
		if(trg)
			world << "[src] hit [trg]"
			src.Bump(trg)
			*/
/*
			src.beamlist += NewObj //Add to beamlist for later deletion
			for(var/obj/blasts/trails/T in NewObj.Shooter.BlastList) //del(T)
				if(T in src.beamlist)
					spawn(30) del T
		*/
		//	NewObj.beamlist+=NewObj
			//for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
//			for(var/obj/blasts/beamlist/T in src.Shooter.BlastList) //Delete all trails
//				if(T in src.beamlist)
//					spawn(15) del T
		//	spawn(15) del NewObj
		..()

	var
		Damage
		mob/Shooter
		mob/ShooterKey
		Trail
		Effect
		codename
		Tiles
		pierce=0
		cost=2
		splashrange=0
		closetarget=0
		splashdmg=0
		beamlist = list()
		length = 0 //current length
		lengthp = 1//length multiplier
		mlength = 18 //max length
		minpercentdmg = 0.05 // minimum damage of ki attack in percent (default 5%)

	swordslash
		name = "Sword Slash"
		icon = 'Techs.dmi'
		icon_state = "swordslash"
		density = 1
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.Shooter=Owner
			src.mlength=6
			src.beamspeed=2
			src.beamlag=1
			src.pierce = 1
			src.Damage = (Owner.strength * 0.30) * (Owner.weapon_power/100)
			//src.Damage=(rand(Owner.strength,Owner.strength*2.5)+rand(1,usr.powerlevel/900))*10
			//world<<"DMG: [src.Damage]"
			src.Move(loc)
			src.Shooter.BlastList+=src
	kipunch
		name = "Iron Fist"
		Trail=0
		density = 1
		icon = 'blast.dmi'
		icon_state="kipunch"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.Shooter=Owner
			src.mlength=4
	//		src.beamspeed=2
	//		src.beamlag=1
			//src.Damage=(rand(Owner.strength,Owner.strength*2.5)+rand(1,usr.powerlevel/900))*10
			src.Damage= (Owner.strength * 0.45) * (Owner.melee/100)
			//world<<"DMG: [src.Damage]"
			src.Move(loc)
			src.Shooter.BlastList+=src

	shieldsmash
		name = "Shield Smash"
		Trail=0
		density = 1
		icon = 'blast.dmi'
		icon_state="shieldsmash"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.Shooter=Owner
			src.mlength=4
	//		src.beamspeed=2
	//		src.beamlag=1
			//src.Damage=(rand(Owner.strength,Owner.strength*2.5)+rand(1,usr.powerlevel/900))*10
			src.Damage= (Owner.defence * 0.25) * (Owner.durability/100)
			//world<<"DMG: [src.Damage]"
			src.Move(loc)
			src.Shooter.BlastList+=src


	BB
		Trail=0
		density = 1
		icon = 'Burning.dmi'
		//icon_state="blastr"
//		bigatom_mode = BIGATOM_NOOVERLAYS
		New(loc,mob/Owner)

			src.splashrange = 0
			src.shootspeed = 12
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.05)
			var/randKI = round(Owner.ki*0.05)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.Shooter.BlastList+=src

	kiblast
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state="blastr"
		New(loc,mob/Owner)

			src.splashrange = 0
			src.shootspeed = 12
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.05)
			var/randKI = round(Owner.ki*0.05)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.25)
			src.Move(loc)
			src.Shooter.BlastList+=src

	TripleKiBlast
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state="blastr2"
		New(loc,mob/Owner)

			src.splashrange = 1
			src.shootspeed = 12
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.10)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.Shooter.BlastList+=src
	Kamehameha
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="kamehameha"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner

			var/randPL = Owner.powerlevel*0.10
			var/randKI = Owner.ki*0.15
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	Beam
		Trail=1
		density = 1
		icon = 'blasts2.dmi'
		icon_state="beam"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 2
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.10
			var/randKI = Owner.ki*0.35
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	TenXKamehameha
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="kamehameha10"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 2
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.10
			var/randKI = Owner.ki*0.35
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	MouthEnergyWave

		//name = "Mouth Energy Wave"
		density = 1
		icon = 'Techs2.dmi'
		icon_state="mouthenergywave"
		Trail=1
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.12
			var/randKI = Owner.ki*0.35
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	GalickGun
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="galickgun"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.08
			var/randKI = round(Owner.ki*0.3)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.04
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	FinishBuster
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="finishbuster"
		New(loc,mob/Owner)
			src.shootspeed = 20
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.27
			var/randKI = round(Owner.ki*0.06)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
	FinalFlash
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="finalflash"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.05
			var/randKI = round(Owner.ki*0.4)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	SpecialBeamCannon
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="specialbeamcannon"
		New(loc,mob/Owner)
			src.splashrange = 2
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.23
			var/randKI = round(Owner.ki*0.19)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.5)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.Shooter.BlastList+=src

	FinalShine
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="finalshine"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.07
			var/randKI = round(Owner.ki*0.32)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.03
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src




	BlazingBlast
		Trail=0
		density = 1
		icon = 'Blazing Blast.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.07
			var/randKI = round(Owner.ki*0.15)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.02
			src.Shooter.BlastList+=src

	BurningStar
		Trail=0
		density = 1
		icon = 'ID Techs.dmi'
		icon_state = "8"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.19
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.Shooter.BlastList+=src

	Masenko
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="masenko"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.13
			var/randKI = round(Owner.ki*0.32)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.07
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	DeathBeam
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="deathbeam"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 0
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.3
			var/randKI = round(Owner.ki*0.2)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	DeathWave
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state="deathwave"
		New(loc,mob/Owner)
			src.splashrange = 1
			src.shootspeed = 19
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.2)
			var/randKI = round(Owner.ki*0.3)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.5)
			src.Move(loc)
			src.minpercentdmg = 0.06


	DestructoDisk
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state="distructodisk"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 10
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.24)
			var/randKI = round(Owner.ki*0.10)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.minpercentdmg = 0.09
			src.Move(loc)
		//	src.FollowProjectile()

	Dodonpa
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="deathbeam"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.30)
			var/randKI = round(Owner.ki*0.05)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.minpercentdmg = 0.09
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

			src.Move(loc)

	DragonFist
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="dragonfist"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.mlength=10
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randSTR = round(Owner.strength*0.40)
			src.Damage = round((randPL + randSTR) * Owner.melee/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	TriBeam
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="tribeam"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.12)
			var/randKI = round(Owner.ki*0.08)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.03
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	LightGrenade
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state = "lightgrenade"
		New(loc,mob/Owner)
			src.splashrange = 0

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.15)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.03
			src.Shooter.BlastList+=src

	KienzanDisk
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state = "kienzandisk"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 8
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.25)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.09
			src.Shooter.BlastList+=src
	EnergyCannon
		Trail=0
		density = 1
		icon = 'Spirit Cannon.dmi'
		icon_state = "Spirit Cannon"
		New(loc,mob/Owner)
			src.splashrange = 03
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.10)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.02
			src.Shooter.BlastList+=src

	SSDeadlyBomber
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state = "ssdeadlybomber"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.20
			var/randKI = round(Owner.ki*0.10)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.07
			src.Shooter.BlastList+=src

	KarmaBomb
		Trail=0
		density = 1
		icon = 'Techs.dmi'
		icon_state = "ssdeadlybomber"
		New(loc,mob/Owner)
			src.splashrange = 0

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.17)
			var/randKI = round(Owner.ki*0.10)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.03
			src.Shooter.BlastList+=src

	ElectricRain
		Trail=0
		density = 1
		icon = 'ER.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 28
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.15)
			var/randKI = round(Owner.ki*0.25)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	GodlyBlast
		Trail=0
		density = 1
		icon = 'Godly Blast.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.15)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.07
			src.Shooter.BlastList+=src

	NovaBlast
		Trail=0
		density = 1
		icon = 'Nova Heat Blast.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 18
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.15)
			var/randKI = round(Owner.ki*0.1)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	OmegaBlast
		Trail=0
		density = 1
		icon = 'Omega Blast.dmi'
		New(loc,mob/Owner)
			src.splashrange = 2

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.20)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	PhantomAttack
		Trail=0
		density = 1
		icon = 'ID Techs.dmi'
		icon_state = "8"
		New(loc,mob/Owner)
			src.splashrange = 1

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.7)
			var/randKI = round(Owner.ki*0.15)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.07
			src.Shooter.BlastList+=src


	SoulPunisher
		Trail=0
		density = 1
		icon = 'Soul Punisher.dmi'
		New(loc,mob/Owner)
			src.splashrange = 1

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.13)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	StarBang
		Trail=0
		density = 1
		icon = 'Star Bang.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.05
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	WaterJet
		Trail=0
		density = 1
		icon = 'Water Jet Blast.dmi'
		New(loc,mob/Owner)
			src.splashrange = 0

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.17)
			var/randKI = round(Owner.ki*0.09)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	BurningDragon
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="BurningDragon"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randSTR = round(Owner.strength*0.30)
			src.Damage = round((randPL + randSTR) * Owner.melee/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	DamnedShark
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="DamnedShark"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randSTR = round(Owner.strength*0.30)
			src.Damage = round((randPL + randSTR) * Owner.melee/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	DeadBeam
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="DeadBeam"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randSTR = round(Owner.strength*0.30)
			src.Damage = round((randPL + randSTR) * Owner.melee/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	BlackStorm
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "BlackStorm"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src




	MajinStriker
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "MajinStriker"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	KiSoul
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "KiSoul"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	ImmortalFlame
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "ImmortalFlame"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	CandyBomb
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "CandyBomb"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src


	FrostBite
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "FrostBite"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src


	VortexSkip
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "VortexSkip"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	TrooperBomb
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "TrooperBomb"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	KiNeedles
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "KiNeedles"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	GigaDrop
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "GigaDrop"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src


	AntiMatter
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "AntiMatter"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.mlength=6
			src.beamspeed=1
			src.beamlag = 1
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.01)
			var/randKI = round(Owner.strength*0.15)
			src.Damage = round((randPL + randKI) * Owner.melee/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	StoneToss
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "StoneToss"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	DragonTempest
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "DragonTempest"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	OrbitExplosion
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "OrbitExplosion"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
	BeamFurry
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "BeamFurry"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	SoulPierce
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "SoulPierce"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	FurryBreaker
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "FurryBreaker"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	KiSiege
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "KiSiege"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src

	MysticSpirit
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "MysticSpirit"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src




	GrandKiBlast
		Trail=0
		density = 1
		icon = 'blaststargen.dmi'
		icon_state = "GrandKiBlast"
		New(loc,mob/Owner)
			src.splashrange = 0
			src.shootspeed = 20
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.11)
			var/randKI = round(Owner.ki*0.16)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src



	DesolateFlame
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Desolate Flame"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	BibidiBlaze
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Bibidi Blaze"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	KiStone
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Ki Stone"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
	ShenronsWrath
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Shenrons Wrath"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
	MajinRazor
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Majin Razor"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
	DeathBomb
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Death Bomb"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
	TimeSoul
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Time Soul"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	PrideSpazm
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Pride Spazm"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	AndroidBomb
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Android Bomb"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src



	GigaSpear
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Giga Spear"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	NerfMissles
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Nerf Missles"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 1
			src.mlength=7
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.strength*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage / 25)
			src.Shooter.BlastList+=src


	SealBraze
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Seal Braze"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	DestructiveBlast
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Destructive Blast"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	RageBall
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Rage Ball"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	SaibaStake
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Saiba Stake"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	KamisWisdom
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Kamis Wisdom"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	TyrantBlaze
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Tyrant Blaze"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	SpiritWisp
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Spirit Wisp"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	MasenkoBomb
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Masenko Bomb"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src

	LegacyKiDrop
		Trail=0
		density = 1
		icon = 'blaststargen2.dmi'
		icon_state="Legacy Ki Drop"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 3
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.20)
			var/randKI = round(Owner.ki*0.12)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src



	Freeze
		Trail=0
		density = 1
		icon = 'ice.dmi'
	//	icon_state = "GrandKiBlast"
		New(loc,mob/Owner)
			src.freeze=1
			src.splashrange = 0
			src.shootspeed = 20
			src.beamspeed = 2
			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.0003)
			var/randKI = round(Owner.ki*0.001)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.splashdmg = round(src.Damage * 0.3)
			src.Move(loc)
			src.minpercentdmg = 0.01
			src.Shooter.BlastList+=src


	BigBeamAttack
		density = 1
		icon = 'BigBeamAttack.dmi'
		icon_state="bigbeamattack"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 2
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.10
			var/randKI = round(Owner.ki*0.35)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			//world <<"<b>randpl: [applycommas(randPL)] randki: [applycommas(randKI)] dmg: [applycommas(src.Damage)]<br>"
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
			src.pixel_x = -16
			src.pixel_y = -16

	BigBeamAttack2
		density = 1
		icon = 'BigBeamAttack2.dmi'
		icon_state="bigbeamattack"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.splashrange = 2
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.10
			var/randKI = round(Owner.ki*0.35)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			//world <<"<b>randpl: [applycommas(randPL)] randki: [applycommas(randKI)] dmg: [applycommas(src.Damage)]<br>"
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src
			if(prob(50))
				src.pixel_x = -32
				src.pixel_y = -32


	CandyRay
		Trail=1
		density = 1
		icon = 'Techs2.dmi'
		icon_state="candyray"
		New(loc,mob/Owner)
			src.dir=Owner.dir
			src.Effect = "Candy"
			src.Shooter=Owner
			var/randPL = round(Owner.powerlevel*0.10)
			var/randKI = round(Owner.ki*0.20)
			src.Damage = round((randPL + randKI) * Owner.ki_power/100)
			src.Move(loc)
			src.minpercentdmg = 0.1
			src.splashdmg = round(src.Damage * 0.5)
			src.Shooter.BlastList+=src


	BOMBS
		beamspeed=2
		beamlag=1
		animate_movement = SYNC_STEPS

		BangC
			icon = 'Burning Attack.dmi'
			density = 1
			animate_movement = FORWARD_STEPS
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src

		BangTL
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src
		BangT
			icon = 'Burning Attack.dmi'
			density = 1

			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src
		BangTR
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src


		BangL
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src
		BangR
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src

		BangBL
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src


		BangB
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0

			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src

		BangBR
			icon = 'Burning Attack.dmi'
			density = 1
			Trail=0
			New(loc,mob/Owner)
				src.dir=Owner.dir
				src.Shooter=Owner
				var/randPL = round(Owner.powerlevel*0.20)
				var/randKI = round(Owner.ki*0.20)
				src.Damage = round((randPL + randKI) * Owner.ki_power/100)
				src.Move(loc)
				src.minpercentdmg = 0.1
				src.splashdmg = round(src.Damage * 0.5)
				src.Shooter.BlastList+=src


	tracenuke
		Trail=0
		density = 1
		icon = 'tracenuke.dmi'

		New(loc,mob/Owner)
			src.splashrange = 2

			src.dir=Owner.dir
			src.Shooter=Owner
			var/randPL = Owner.powerlevel*0.1
			//var/randKI = Owner.ki*0.5
			src.Damage = round(randPL) * Owner.ki_power/100
			src.splashdmg = round(src.Damage * 0.5)
			src.Move(loc)
			src.minpercentdmg = 0.05
			src.Shooter.BlastList+=src
			spawn() src.Trace()



/*
	Bump(obj/Target2)
		if(istype(Target2,/obj/blasts)==1 && istype(Target2,/obj/blasts/trails)==0)
			if(istype(Target2,/obj/blasts)&&istype(src,/obj/blasts))
				var/obj/blasts/losebeam
				var/obj/blasts/winbeam
			//	if(src==Target2)
			//		return 1
				if(src.Damage > Target2:Damage)
					src.Damage += Target2:Damage
					winbeam = src
					losebeam = Target2
					viewers(winbeam) << output("<font size = 1><font color = white><b>[Target2:Shooter]'s [Target2] is destroyed by [winbeam.Shooter]'s [winbeam]!","default.output2")
					del losebeam
				if(src.Damage < Target2:Damage)
					Target2:Damage += src.Damage
					winbeam = Target2
					losebeam = src
					viewers(src.Shooter) << output("<font size = 1><font color = white><b>[losebeam.Shooter]'s [losebeam] is destroyed by [Target2:Shooter]'s [Target2]!","default.output2")
					del losebeam
				if(Target2:Damage == src.Damage)
					winbeam = Target2
					viewers(src.Shooter) << output("<font size = 1><font color = white><b>[Shooter]'s [src] and [Target2:Shooter]'s [Target2] destroy each other!","default.output2")
					del Target2
					del src

					return

					*/
	//	if(istype(Target2,/obj/blasts)&&istype(src,/obj/blasts))
	//		if(Target2.dir==src.dir)
	//			src.loc = get_step(src.loc,src.dir)
	//			return
	Bump(mob/Target)

		if(istype(Target,/mob/Destroyable/VAULT))
		//	view(Target) << "[Target] hit by [src]"
			//for(var/mob/NPC/BankSecurity/M in view(src.Shooter))
			if(src.Shooter.BankQuest)

				for(var/mob/SPECIAL/BankSecurity/M in view(src.Shooter))
					if(M.sleeping)
			//			world << "[M] woke up by [src]  [M.name]"
						M.sleeping = 0
						if(!M) return
						M.AITarget = src.Shooter
						spawn(-1) M.AIBank()

				Target.objhp -= 1
				view(Target) << "<b><font color = red>Your attack is weakening the vault door!"
				if(Target.objhp <= 0)

					view(Target) << "<b><font color = yellow>The vault door collapsed from [src.Shooter]s attacks!"
					src.Shooter.VAULTPROGRESS++
					Target.loc=locate(470,440,5)
					Target.objhp = 10
					Target.MoveVaults(Target.x,Target.y,Target.z)
					//del Target
		//	else
		//		src.Shooter << "<font color = blue><b>You better not do this now.."
			Explosion(src.splashrange,src.loc,src,src.splashdmg,src&&Target)
			for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)

		//	src.name = "GC Projectile"
		//	src.Shooter = null
		//	src.Shooter.BlastList -= src
		//	src.loc = null


			del src  //GC
		if(istype(Target,/obj/blasts)&&istype(src,/obj/blasts))
//			if(istype(Target,/obj/blasts/kipunch))
//				del Target
//			if(istype(src,/obj/blasts/kipunch))
//				del src
			if(src.dir==Target.dir)
				return
			if(src.pierce==1 && Target:pierce==1)
				Explosion(1,src.loc,src,src.Damage * 0.1,src&&Target)
				view(Target)<<output("<i>[src.Shooter]'s [src.name] and [Target:Shooter]s [Target:name] collided and destroyed each other!","default.output2")
				if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				//if(Target:Trail)
				for(var/obj/blasts/trails/T in Target:Shooter.BlastList) del(T)
				del src
				del Target
			if(src.pierce==1 && Target:pierce==0)
				Explosion(1,src.loc,src,src.Damage * 0.1,src&&Target)
				view(Target)<<output("<i>[src.Shooter]'s [src.name] destroyed [Target:Shooter]s [Target:name]!","default.output2")
			//	if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				//if(Target:Trail)
				for(var/obj/blasts/trails/T in Target:Shooter.BlastList) del(T)
			//	del src
				del Target
			if(src.pierce==0 && Target:pierce==1)
				Explosion(1,src.loc,src,src.Damage * 0.1,src&&Target)
				view(Target)<<output("<i>[src.Shooter]'s [src.name] was destroyed by [Target:Shooter]s [Target:name]!","default.output2")
				if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				//if(Target:Trail)
			//	for(var/obj/blasts/trails/T in Target:Shooter.BlastList) del(T)
				del src
			//	del Target
			if(Target.Damage>=src.Damage)
				view(Target)<<output("<i>[src.Shooter]'s [src.name] was absorbed by [Target:Shooter]s [Target:name]","default.output2")
				Target:Damage -= round(src.Damage/2)
				if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				del src
			else
				view(src)<<output("<B>[Target:Shooter]'s [Target.name] was absorbed by [src.Shooter]s [src.name]","default.output2")
				src.Damage -= round(Target:Damage/2)
				for(var/obj/blasts/trails/T in Target:Shooter.BlastList) del(T)
				del Target
		//	for(var/A in Target:beamlist) //Delete all trails
		//		del A
		//	for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)

		if(istype(Target,/obj)||istype(Target,/turf))
			Explosion(src.splashrange,src.loc,src,src.splashdmg,src&&Target)

			for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)

	//		src.name = "GC Projectile"
	//		src.Shooter = null
	//		src.Shooter.BlastList -= src
	//		src.loc = null

			del src
		//	src.Shooter.BlastList -= src
		//	src.loc = null

		if(istype(Target,/mob/PC)||istype(Target,/mob/Monster/)||istype(Target,/mob/SPECIAL/))
			if(src.freeze)
				view(12)<<"\white [src] uses their special technique to freeze [Target]!"
				Target.frozen=1
				Target.zanz_lock=1
				Target.it_lock=1
				//var/fTarget = Target
				//spawn() getfrozen(fTarget)
				Target.statusrestore()


			spawn(-1) dmg(Target,src.Shooter,src)
//			del src
			return
		if(istype(Target,/mob/NPC))
			var/rng = src.splashrange
			var/locc = Target.loc
			var/dmg = src.splashdmg
			var/beam = src
//			var/beamhit = Target
			Explosion(rng,locc,beam,dmg,beam && Target)
			//Explosion(rng,src,beam,dmg,beam && Target)

		//	Explosion(src.splashrange,src.loc,src,src.Damage * 0.5,src&&Target&&src.Shooter)

			if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)

		//	src.name = "GC Projectile"
		//	src.Shooter = null
		//	src.Shooter.BlastList -= src
		//	src.loc = null


			del src
	proc/dmg(mob/Target as mob,mob/src.Shooter as mob,obj/src.name as obj,src.Effect)
		if(src.Shooter.BankQuest)

			for(var/mob/SPECIAL/BankSecurity/M in view(src.Shooter))
				if(M.sleeping)
		//			world << "[M] woke up by [src]  [M.name]"
					M.sleeping = 0
					if(!M) return
					M.AITarget = src.Shooter
					spawn(-1) M.AIBank()

			Target.objhp -= 1
			view(Target) << "<b><font color = red>Your attack is weakening the vault door!"
			if(Target.objhp <= 0)

				view(Target) << "<b><font color = yellow>The vault door collapsed from [src.Shooter]s attacks!"
				src.Shooter.VAULTPROGRESS++
				Target.loc=locate(470,440,5)
				Target.objhp = 10
				Target.MoveVaults(Target.x,Target.y,Target.z)
				//del Target
	//	else
	//		src.Shooter << "<font color = blue><b>You better not do this now.."
		Explosion(src.splashrange,src.loc,src,src.splashdmg,src&&Target)
		for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
		if(istype(Target,/mob/PC)||istype(Target,/mob/Monster/)||istype(Target,/mob/SPECIAL/))



			if(prob(10))
				src.Shooter.ki_pow_exp += 1 + round(src.Shooter.level/1250)
				//src.Shooter.Ki_Power_Level()


			//src.Damage += src.Damage * 0.25  // RAISING KI POWER BY 15% TO START WITH
			if(src.critblast)
				//world << "<font color = red>[src] just crit [src.critblast]"
				src.Damage += round(src.Damage * 0.35)
	//		world << "<b>DAMAGE: [applycommas(src.Damage)]"
			if(istype(Target,/mob/PC))
				Target.rage += round(rand(1,3))
				if(Target.rage >= 100)
					Target.rage = 100

				if(src.mlength > 10) // this is ki attack
					var/kidef = Target.defence*0.4
					var	/kidefcalc = round(kidef*(Target.ki_res/100))
					src.Damage -= kidefcalc
				else // melee projectile
					var/defcalc = round((Target.defence*(Target.durability/100)) *1)
					src.Damage -= defcalc

				if(src.Shooter.spar && Target.spar)
					if(prob(15) && Target.KO == 0)
						spawn(-1) src.Shooter.Spar_Ticks(Target)
					//spawn(-1) Target.StatTickOffense(src.Shooter)
				//	src.Shooter.notick = 1
				//	spawn(50) src.Shooter.notick = 0
				//	Target.notick = 1
				//	spawn(50) Target.notick = 0
			//		if(src.Shooter.in_hbtc)
			//			src.Damage *= 0.1
				//if(src.Damage < Target.powerlevel_max*src.minpercentdmg)
			/*
				var/mindmg = round(Target.powerlevel_max*src.minpercentdmg)

				if(src.Damage < mindmg)
					if(mindmg > src.Shooter.ki)
						src.Damage = round(src.Shooter.ki)
					else
						src.Damage = mindmg
				if(src.Shooter.spar && Target.spar)
					src.Damage = mindmg
					*/
				var/mindmg = 1
				if(src.Damage < 1)
					src.Damage = 1
				if(src.Shooter.spar && Target.spar)
					src.Damage = mindmg
				if(src.Shooter.energy_barrier||src.Shooter.ki_shield)
					src.Damage = round(src.Damage/2)
					src.Shooter << "You manage to fire off [src.name] while using a defensive tech, but your techs damage has been halved"
											//world << "TWOdamage if less than minimum: [src.Damage]"
				//if(src.Damage < src.Shooter.ki*src.minpercentdmg)
				//	src.Damage = (src.Shooter.ki*src.minpercentdmg)/2
					view(src) << "<font color = white>[src.Shooter]'s [src] barely put a dent in [Target]!"
			//		world << "DODMG FOUR: [dodmg]"
				if(Target.ki_shield)
					view(Target) << "<font color = white><b>[Target]'s ki shield reduced some damage from [src.Shooter]'s [src]!"

					src.Damage = src.Damage*0.65
					//world << " damage after ki shield: [src.Damage]"
				if(Target.energy_barrier)
					Target.energy_barrier_health -= src.Damage
					view(Target) << "<font color = white><b>[Target]'s energy barrier took [applycommas(src.Damage)] damage from [src.Shooter]'s [src]!"
					if(Target.energy_barrier_health <= 0)
						view(Target) << "<font color = white><b>[Target]'s energy barrier was shattered by [src.Shooter]'s [src]!"
						Target.energy_barrier=0
						src.Damage = round(src.Damage/2)
					else
						if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)

					//	src.name = "GC Projectile"
					//	src.Shooter = null
					//	src.Shooter.BlastList -= src
					//	src.loc = null

						del src


		//	world << "damage: [applycommas(src.Damage)]  kidef: [applycommas(round(Target.kidefense*(Target.ki_res/100)))]  Final: [applycommas(dodmg)]"
			else
				var/mindmg = round(Target.powerlevel_max*src.minpercentdmg)
				if(src.Shooter.spar && Target.spar)
					src.Damage = mindmg
				src.Damage = src.Damage -= round(Target.kidefense*(Target.ki_res/100))

			if(src.Damage < 1)
				src.Damage = 1
			if(Target.iting && Target.pvpflagged)
				Target.ITstop = 1
				src.Damage *= 2
				src.Shooter << output("<font size=1><b><font color=yellow>[Target.name]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")
				var/ColorMatrix/c = new("Black & White")
				animate(Target, color = c.matrix, time = 10)
			if(!src.critblast)
				src.Shooter << output("<font size=1><b><font color=blue>You hit [Target.name] for [applycommas(src.Damage)] damage with your [src.name]!","default.output2")
			else
				src.Shooter << output("<font size=1><b><font color=red>Critical hit!<font color=red> [Target.name] took [applycommas(src.Damage)] damage from your [src.name]!","default.output2")
			if(istype(Target,/mob/PC))
				Target << output("<font size=1><b><font color=blue>You are hit for [applycommas(src.Damage)] damage by [src.Shooter.name]'s [src]!","default.output2")
				spawn(-1) Target.PVPflagged(4)
				spawn(-1) src.Shooter.PVPflagged(6)
				if(Target.kiabsorb && Target != src.Shooter)
					var/chkki = (Target.ki/Target.ki_max)*100
					if(chkki < 300)
						Target.ki += src.Damage
						view(Target) << "<font color = white><b>[Target] absorbed some ki from [src.Shooter]'s [src]!"
					else
						Target << output("<font size=1><b><font color=blue>You cannot absorb anymore ki your power is at its limit!","default.output2")
/*
			if(Target.healing)
				src.Shooter<<output("<font size=1><font color=red><B>Error:</b> <font color=white>You cannot attack <font color=red>[Target]<font color=white> while <font color=red>[Target]<font color=white> is healing.","default.output2")
				//var/obj/O = src //keep a reference to src
				del src
				//del O
				for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				//for(var/A in losebeam.beamlist) //Delete all trails
				//	del A
				return

				*/
			if(!Target.blockin)
				if(Target.dead)
					if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
					del src
					return
				if(istype(Target,/mob/SPECIAL))
					if(Target.sleeping)
						Target.AITarget = src.Shooter
						Target.sleeping = 0
						Target:AIBank()
				if(istype(Target,/mob/Monster/Peaceful/))
					Target:AITarget = src.Shooter
					Target:sleeping = 0
					walk(Target,0)
					spawn(-1) Target:AIpeaceful()
				var/mindmg = round(Target.powerlevel_max*src.minpercentdmg)
				if(src.Shooter.spar && Target.spar)
					src.Damage = mindmg
				src.Damage = round(src.Damage)
				Target.powerlevel-=src.Damage
				if(Target.hudenabled)
					spawn() Target.updateHealth()



				//Target.paralyze=1

				//spawn(5) Target.paralyze=0

				//flick("explosion",Target)
				var/rng = src.splashrange
				var/locc = Target.loc
				var/dmg = src.splashdmg
				var/beam = src
		//		var/beamhit = Target
//				world << "TWO: Target [Target] Shooter [src.Shooter] obj [src.name]"

				if(Target.powerlevel<=0)
					//world << "[mobshooting]"
					//var/shooter = src.Shooter
				//	if(shooter:exp >= shooter:tnl)
				//		spawn() shooter:Level_Up()

					if(src.Effect=="Candy")
						if(Target.powerlevel <= 0)
							var/obj/Equipment/Consumable/Candy/C = new
							C.loc = Target.loc
							C.name = "[Target.name]'s Candy"
							if(istype(Target,/mob/PC))
								C.candy_pl = round(Target.powerlevel_max/500)
							C.icon = 'Candy.dmi'
							Target.icon_state = ""
							C.loc = Target.loc
							//M.powerlevel_max -= round(M.powerlevel_max/500)
							Target.powerlevel	 = 0
							Target.DeathCheck(src.Shooter,"Candy")
							if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
							del src
					if(src.Shooter.lethalon)
						Target.DeathCheck(src.Shooter)
						//src.Shooter.AutoFinish(Target)
					else
						spawn(-1) src.Shooter.KO(Target)
					//Target.DeathCheck(src.Shooter)

				if(src.splashrange>0)
//
					//Explosion(rng,locc,beam,dmg,beam && Target)
					Explosion(rng,locc,beam,dmg,beam && Target)
					if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
					//for(var/obj/blasts/T in src.Shooter.BlastList) del(T)

				//var/obj/O = src //keep a reference to src
				//src = null
//				world << "THREE: Target [Target] Shooter [src.Shooter] obj [src.name]"
			else
				view(Target) << "<font size=1><b><font color=aqua>[Target.name]<font color=red> blocked<font color=yellow> [src.Shooter.name]'s<font color=green> [src.name]<font color=red>!"
//				var/obj/O = src //keep a reference to src
				//src = null
				//for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
				//del O
		if(istype(Target,/mob/PC)||istype(Target,/mob/Monster/)||istype(Target,/mob/SPECIAL/))Target.paralyze=0
		if(src.Trail) for(var/obj/blasts/trails/T in src.Shooter.BlastList) del(T)
	//	for(var/A in losebeam.beamlist) //Delete all trails
	//		del A
	//	for(var/obj/blasts/T in src.Shooter.BlastList) del(T)

	//x	src.name = "GC Projectile"
	//	src.Shooter = null
	//	src.Shooter.BlastList -= src
	//	src.loc = null



		if(src)
			del src
		/*
			src.name = "Adeadblast"
			src.Shooter.BlastList -= src
			src.Shooter = null

			src.loc = null
			*/

		//keep a reference to src
		//src = null
		//world << "src: [src]"
//		world << "O: [O]"
		//del src
				//M.loc = locate(293,293,2)
		//M.dead = 0
		//M.exp = initial(M.exp)
		//M.powerlevel = initial(M.powerlevel)
		//spawn(350) M.loc = initial(M.loc)



		return
	/*
	trails
		icon = 'blast.dmi'
		Kamehameha/icon_state = "kametrail"
		BigBang/icon_state = "bigbangtrail"
		SpecialBeamCannon/icon_state = "sbctrail"
		*/
	trails
		name="trail"
		density=0
	//ar/obj/blasts/mainbeam //"father" var
		animate_movement = SYNC_STEPS
		layer = OBJ_LAYER-1
		icon = 'Techs2.dmi'
		Kamehameha/icon_state = "kamehamehat"
		SpecialBeamCannon/icon_state = "specialbeamcannont"
		GalickGun/icon_state = "galickgunt"
		TenXKamehameha/icon_state = "kamehameha10t"
		FlameBlast/icon_state = "flameblastt"
		FinishBuster/icon_state = "finishbustert"
		DeathBeam/icon_state = "deathbeamt"
		DragonFist/icon_state = "dragonfistt"
		FinalShine/icon_state = "finalshinet"
		HellBlaze/icon_state = "hellblazet"
		Masenko/icon_state = "masenkot"
		FinalFlash/icon_state = "finalflasht"
		TriBeam/icon_state = "tribeamt"
		BurningDragon/icon_state = "BurningDragont"
		DamnedShark/icon_state = "BurningDragont"
		DeadBeam/icon_state = "DeadBeamt"
		Dodonpa/icon_state = "deathbeamt"
		CandyRay/icon_state = "candyrayt"
		MouthEnergyWave
			icon = 'Techs2.dmi'
			icon_state = "mouthenergywavet"
		BigBeamAttack
			icon = 'BigBeamAttack.dmi'
			icon_state = "bigbeamattackt"
		Beam
			icon = 'blasts2.dmi'
			icon_state = "beamt"



//var/beamlag=0
//var/beamspeed=1
obj/var
	beamlag = 0
	beamspeed = 1
obj/proc
	Fire2()
		walk(src,src.dir,src.beamlag,src.beamspeed)

	Fire3(mob/M)
		if(M.chosentarget)
			if(get_dist(M,M.chosentarget)<12)
				var/target = get_general_dir(M,M.chosentarget)
				M.dir = target
				src.dir = target
				walk(src,src.dir,src.beamlag,src.beamspeed)
				return


		walk(src,src.dir,src.beamlag,src.beamspeed)


//	FireTrace()
		//walk(src,src.dir,src.beamlag,src.beamspeed)

mob/proc
	FaceTarget()
		if(get_dist(src,src.chosentarget)>0)
			if(get_dist(src,src.chosentarget)<16)
				src.dir = get_general_dir(src,src.chosentarget)
			return
//		else
//			src.chosentarget=0

	FaceTargetOLD2()
		if(get_dist(src,src.chosentarget)>2)
			if(get_dist(src,src.chosentarget)<16)
				src.dir = get_general_dir(src,src.chosentarget)
			return
//		else
//			src.chosentarget=0

	FaceTargetPunch(mob/M)
		if(get_dist(src,M)<=1)
			src.dir = get_general_dir(src,M)
			return


	FaceTarget2()
		if(get_dist(src,src.chosentarget)<12)
			src.dir = get_general_dir(src,src.chosentarget)
			return

	FaceTargetOLD()
		if(get_dist(src,src.chosentarget)<12)
			var/target = get_dir(src,src.chosentarget)
			src.dir = target
			return



proc
	getfrozen(mob/M as mob)
		sleep(20)
		M.frozen=0
		M.zanz_lock=0
		M.it_lock=0

mob/proc
	statusrestore()
		spawn(20)
			src.frozen = 0
			src.zanz_lock = 0
			src.it_lock = 0
		return

mob/proc
	MoveVaults(ex as num, ey as num, ez as num)
		//var/initx = ex
		//var/inity = ey
		//var/initz = ez
		ex = initial(src.x)
		ey = initial(src.y)
		ez = initial(src.z)

		src.loc=locate(0,0,0)
		spawn(1000)

			src.loc=locate(ex,ey,ez)



mob
	verb
		ChooseTarget()
			set name = "Choose Target"
			set category = "Combat"
			var/list/TargetMenu = list()


			for(var/mob/M in oview(14))
				TargetMenu.Add(M)
			//if(!M)return
			TargetMenu += "Cancel"
			var/mob/T = input("Who would you like to target?","Choose Target")in TargetMenu
			if(T=="Cancel")
				usr << "You now have no target selected"
				usr.chosentarget = null
				return
			usr << "<font color = red><b>[T] selected as target"
			usr.chosentarget = T


		AutoTarget()
			set name = "Auto Target"
			set category = "Combat"
//			var/list/TargetMenu = list()


			var/T
			T = get_closest_mob(usr)
			if(T)
				usr << "<font color = red><b>[T] selected as target"
				usr.chosentarget = T
			else
				usr << "No target selected"
				usr.chosentarget = null




//...
proc/get_closest_mob(mob/M)
   //returns closest spawnpoint turf to death_turf
	var
		mob/closestmob
		closest_dist = 50 //high value for the 1st iteration
	for(var/mob/T in oview(14))
		var/distance = get_dist(M,T)
		if(distance < closest_dist)
			closestmob = T
			closest_dist = distance
	return closestmob


obj/blasts/proc
	Trace()
	//	world << "1"
		while(src)
		//	step(src,src.dir,src.beamlag,src.beamspeed)
	//		world << "2"
			for(var/mob/M in view(2,src))
	//			world << "3"
				if(M != src.Shooter)
			//		world << "[M] self"

					view(4,src) << "[M] located! Detonating..."
					sleep(1)
					var/locc = locate(src.x,src.y,src.z)
					Explosion(src.splashrange,locc,src,src.splashdmg,src)
					del src
			sleep(2)
		/*
	FollowProjectile()
	//	world << "1"
		while(src)
		//	step(src,src.dir,src.beamlag,src.beamspeed)
	//		world << "2"
			if(src.hastarget)
				world << "H"
				continue
			else
				src.hastarget = 0

			for(var/mob/M in view(3,src))
	//			world << "3"
				if(M != src.Shooter)
			//		world << "[M] self"

					src.hastarget = M
					view(4,src) << "[M] located!"
					src.dir = get_general_dir(src,src.hastarget)

					//sleep(1)
					//var/locc = locate(src.x,src.y,src.z)
					//Explosion(src.splashrange,locc,src,src.splashdmg,src)
					//del src

			sleep(2)
			*/

	FollowProjectile()
		while(src)
			for(var/mob/M in view(8,src))
			//	if(istype(M,/mob/NPC))continue
			//	if(M.FuseFollower)continue
				if(!M || !hastarget)
					continue
				if(M != src.Shooter)
					hastarget = M

				if(hastarget)
					walk_towards(src,src.target)

			sleep(3)





/*
	Trace()
		world << "1"
		while(src)
		//	step(src,src.dir,src.beamlag,src.beamspeed)
			world << "2"
			for(var/mob/PC/M in view(3))
				if(M == src.Shooter)
			//		world << "[M] self"
					continue
				world << "found [M]"
				var/locc = locate(src.x,src.y,src.z)
				Explosion(src.splashrange,locc,src,src.Damage * 0.5,src)
				del src
			sleep(1)
			*/