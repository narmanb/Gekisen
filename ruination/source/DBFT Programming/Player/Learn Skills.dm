mob
	var
		//Race exclusive first few
		learn_kaioken=0  //KAI'S ONLY
		learn_sorcery=0
		learn_SelfDestruct=0
		learn_KiBlast=0
		learn_Absorb=0
		learn_Regenerate=0
		learn_KienzanDisk=0
		learn_Corrupt=0
		learn_FlameBullet=0
		learn_DistructoDisk=0
		learn_FatWrap=0
		learn_CandyRay=0
		learn_Infect=0
		learn_Drain=0
//end of race exclusive
		learn_kamehameha=0
		learn_burst=0

		learn_dimensionsword=0
		learn_distructodisk=0
		learn_kienzandisk=0
		learn_spiritball=0
		learn_aura=0
		learn_karmabomb=0
		learn_explosivewave=0
		learn_SuperExplosionWave=0
		learn_energyfield=0
		learn_angryexplosion=0
		learn_candy=0
		learn_supernova=0
		learn_executionersstrike=0
		learn_bblast=0
		learn_erain=0
		learn_gtyrant=0
		learn_godlyblast=0
		learn_grandsmasher=0
		learn_novablast=0
		learn_omegablast=0
		learn_phantomattack=0
		learn_soulpunisher=0
		learn_starbang=0
		learn_waterjet=0
		learn_zapcannon=0
		learn_dodonpa=0
		learn_deathball=0
		learn_sauzerblade=0
		learn_finalexplosion=0
		learn_giganticmeteor=0
		learn_blastershell=0
		learn_rapidblast=0
		learn_blowup=0
		learn_flameblast=0
		learn_fireki=0
		learn_infernoblitz=0
		learn_arcblast=0
		learn_kicannon=0
		learn_whirlwind=0
		learn_darkblast=0
		learn_darkbomb=0
		learn_bloodbomb=0
		learn_holyblast=0
		learn_lightsphere=0
		learn_deathbeam=0
		learn_demonsword=0
		learn_universalscan=0
		learn_fusiondance=0
		learn_acidbomb=0
		learn_galacticdonut=0
		learn_demonshackle=0
		learn_imprisonmentball=0
		learn_powerup=0
		learn_fakemoon=0
		learn_enrage=0
		learn_sense=0
		learn_finalshine=0
		learn_bigbangattack=0
		learn_finalflash=0
		learn_galickgun=0
		learn_tribeam=0
		learn_solarflare=0
		learn_splitform=0
		learn_swapsplits=0
		learn_specialbeam=0
		learn_lightgrenade=0
		learn_zanzoken=0
		learn_dragonfist=0
		learn_afterimage=0
		learn_it=0
		learn_ssdeadlybomber=0
		learn_fly=0
		learn_hellzonegrenade=0
		learn_genocideattack
		learn_invertpower=0
		learn_deathwave=0
		learn_cherrybomb=0
		learn_finishbuster=0
		learn_burningattack=0
		learn_absorb=0
		learn_assasinate=0
		learn_kiabsorb=0
		learn_regena=0
		learn_revengeball=0
		learn_kishower=0
		learn_sacrifice=0
		learn_adtrain=0
		learn_gravfield=0
		learn_buffpl=0
		learn_buffki=0
		learn_buffstr=0
		learn_buffdef=0
		learn_buffstam=0
		learn_explode=0
		learn_chaosball=0
		learn_acidrain=0
		learn_swordslash=0
		learn_tswordslash=0
		learn_timeskip=0
		learn_glare=0

		learn_burningdragon=0
		learn_damnedshark=0
		learn_deadbeam=0

		//NEW MELEE TECHS
		learn_kipunch=0
		learn_powerdash=0
		learn_push=0
		learn_shieldsmash = 0

		//LEARN GENERIC TECHS

		learn_generic1=0
		learn_generic2=0
		up1 = 0
		up2 = 0
		up3 = 0
		up4 = 0
		up5 = 0
		up6 = 0
		up7 = 0
		up8 = 0
		up9 = 0
		up10 = 0
		up11 = 0
		up12 = 0
		up13 = 0
		up14 = 0
		up15=0

		// AOE Techs
		learn_damagefield=0
		learn_slowfield=0
		learn_healfield=0

		//Flying techs
		learn_tracenuke=0

		learn_focusstep=0

		//
		learn_tkb=0
		learn_mouthblast=0
	proc
		Skill_Gain()

			if(istype(src,/mob/PC))
				if(src.ki_control_mastered)
					if(!src.learn_tkb)
						src.contents += new/obj/Technique/TripleKiBlast
						src << "<center><font color = blue> .:: You learn Triple Ki Blasts ::.</font></center></center>"
						src.learn_tkb=1
				if(src.level > 10000)
					if(!src.learn_focusstep)
						src << "<center><b><font color = red> .:: You learn Focus Step ::.</font></center></center>"
						src << "<b><font color = yellow>Evasive technique. In order to use focus step, hold shift and hit an arrow key. You will teleport a few steps in your chosen direction.<br>Uses a small amount of ki, when flagged for PVP, uses 100 stamina.<br>Cannot use this while flying"
						src.learn_focusstep=1
				if(src.level > 100000)
					if(!src.learn_tracenuke)
						src.contents += new/obj/Technique/TraceNuke
						src << "<center><font color = green> .:: You learn Trace Nuke ::.</font></center></center>"
						src.learn_tracenuke=1
				if(src.race=="Android")
					if(!src.learn_SelfDestruct)
						src.contents += new/obj/Technique/SelfDestruct
						src.learn_SelfDestruct=1
					if(src.level>=16500)
						if(src.gene == "Gluttonous")
							if(!src.learn_candy)
								src << "<center><font color = white> .:: You learn Candy Ray  ::.</font></center></center>"
								src.contents += new/obj/Technique/CandyRay
								src.learn_candy=1
					if(src.level>=5000)
						if(!src.learn_universalscan)
							src << "<center><font color = white> .:: You learn Universal Scan  ::.</font></center></center>"
							src.contents += new/obj/Technique/UniversalScan
							src.learn_universalscan = 1
					if(src.level>=7500)
						if(!src.learn_kiabsorb)
							src << "<center><font color = white> .:: You learn Ki Absorb  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiAbsorb
							src.learn_kiabsorb=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=10000)
						if(!src.learn_dodonpa)
							src << "<center><font color = white> .:: You learn Dodonpa  ::.</font></center></center>"
							src.contents += new/obj/Technique/Dodonpa
							src.learn_dodonpa=1

				if(src.race=="Bio Android")
					if(!src.learn_Regenerate)
						src.contents += new/obj/Technique/Regenerate
						src.learn_Regenerate=1
					if(!src.learn_Absorb)
						src.contents += new/obj/Technique/Absorb
						src.learn_Absorb=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=24000)
						if(!src.learn_energyfield)
							src << "<center><font color = white> .:: You learn Energy Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/EnergyField
							src.learn_energyfield = 1

				if(src.race=="Changeling")
					if(!src.learn_KienzanDisk)
						src.contents += new/obj/Technique/KienzanDisk
						src.learn_KienzanDisk=1
					if(src.level>=6500)
						if(!src.learn_imprisonmentball)
							src << "<center><font color = white> .:: You learn Imprisonment Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/ImprisonmentBall
							src.learn_imprisonmentball = 1
					if(src.level>=8000)
						if(!src.learn_deathwave)
							src << "<center><font color = white> .:: You learn Death Wave  ::.</font></center></center>"
							src.contents += new/obj/Technique/DeathWave
							src.learn_deathwave = 1
					if(src.level>=12000)
						if(!src.learn_sauzerblade)
							src << "<center><font color = white> .:: You learn Sauzer Blade  ::.</font></center></center>"
							src.contents += new/obj/Technique/SauzerBlade
							src.learn_sauzerblade = 1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
/*					if(src.level>=16000)
						if(!src.learn_fusiondance)
							src << "<center><font color = white> .:: You learn Fusion Dance  ::.</font></center></center>"
							src.contents += new/obj/Technique/FusionDance
							src.learn_fusiondance=1
					if(src.level>=37500)
						if(!src.learn_supernova)
							src << "<center><font color = white> .:: You learn Super Nova  ::.</font></center></center>"
							src.contents += new/obj/Technique/SuperNova
							src.learn_supernova=1*/

				if(src.race=="Demon")
					if(!src.learn_Corrupt)
						src.contents += new/obj/Technique/Corrupt
						src.learn_Corrupt=1
					if(src.level>=6500)
						if(!src.learn_demonshackle)
							src << "<center><font color = white> .:: You learn Demon Shackle  ::.</font></center></center>"
							src.contents += new/obj/Technique/DemonShackle
							src.learn_demonshackle=1
/*					if(src.level>=8500)
						if(!src.learn_flameblast)
							src << "<center><font color = white> .:: You learn Hell Blaze  ::.</font></center></center>"
							src.contents += new/obj/Technique/FlameBlast
							src.learn_flameblast=1*/
					if(src.level>=9500)
						if(!src.learn_demonsword)
							src << "<center><font color = white> .:: You learn Demon Sword  ::.</font></center></center>"
							src.contents += new/obj/Technique/DemonSword
							src.learn_demonsword=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Flame Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/FlameShower
							src.learn_kishower=1
					if(src.level>=40000)
						if(!src.learn_dimensionsword)
							src << "<center><font color = white> .:: You learn Dimension Sword Attack  ::.</font></center></center>"
							src.contents += new/obj/Technique/DimensionSwordAttack
							src.learn_dimensionsword=1

				if(src.race=="Dragon")
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=37500)
						if(!src.learn_karmabomb)
							src << "<center><font color = white> .:: You learn Negative Karma Bomb  ::.</font></center></center>"
							src.contents += new/obj/Technique/KarmaBomb
							src.learn_karmabomb = 1
					if(src.level >= 40000)
						if(!src.learn_omegablast)
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Omega Blast</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/OmegaBlast
							src.learn_omegablast=1

				if(src.race=="Half Saiyan")
					if(src.level >= 2500)
						if(!src.learn_fakemoon)
							src << "<center><font color = white> .:: You learn Fake Moon ::.</font></center></center>"
							src.contents += new/obj/Technique/FakeMoon
							src.learn_fakemoon = 1
					if(src.level>=6500)
						if(!src.learn_galacticdonut)
							src << "<center><font color = white> .:: You learn Galactic Donut  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticDonut
							src.learn_galacticdonut = 1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Shine Missile  ::.</font></center></center>"
							src.contents += new/obj/Technique/ShineMissile
							src.learn_kishower = 1
					if(src.level>=30000)
						if(!src.learn_finalexplosion)
							src << "<center><font color = white> .:: You learn Final Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinalExplosion
							src.learn_finalexplosion = 1

				if(src.race=="Heran")
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
/*
Crimzon bugfix patch 2.6
removed grandsmasher
					if(src.level >= 32000)
						if(!src.learn_grandsmasher)
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Grand Smasher</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/GrandSmasher
							src.learn_grandsmasher=1
*/

				if(src.race=="Human")
					if(!src.learn_damagefield)
						src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamageField
						src.learn_damagefield=1
					if(src.gene=="Bloodthirsty")
						if(!src.learn_Drain)
							src.contents += new/obj/Technique/Drain
							src.learn_Drain=1
					if(src.level>=10000)
						if(!src.learn_dodonpa)
							src << "<center><font color = white> .:: You learn Dodonpa  ::.</font></center></center>"
							src.contents += new/obj/Technique/Dodonpa
							src.learn_dodonpa=1
					if(!src.learn_DistructoDisk)
						src.contents += new/obj/Technique/DistructoDisk
						src.learn_DistructoDisk=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
//Crimson update patch 2.6
// Removed Majin Incarnate bug from fusion
					if(src.level>=16500)
						if(src.gene == "Majin Incarnate")
							if(!src.learn_candy)
								src << "<center><font color = white> .:: You learn Candy Ray  ::.</font></center></center>"
								src.contents += new/obj/Technique/CandyRay
								src.learn_candy=1

				if(src.race=="Kai")
					if(!src.learn_kaioken)
						src.contents += new/obj/Technique/Kaioken
						src << "<center><font color = white> .:: You learn Kaioken  ::.</font></center></center>"
						src.learn_kaioken=1
					if(src.gene == "Pure Blooded")
						if(!src.learn_damagefield)
							src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/DamageField
							src.learn_damagefield=1
						if(!src.learn_healfield)
							src << "<center><font color = white> .:: You learn Heal Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/HealField
							src.learn_healfield=1
						if(src.level>=5000)
							if(!src.learn_sacrifice)
								src << "<center><font color = white> .:: You learn Sacrifice  ::.</font></center></center>"
								src.contents += new/obj/Technique/Sacrifice
								src.learn_sacrifice=1
				//		if(src.level>=7500)
				//			if(!src.learn_buffstam)
				//				src << "<center><font color = white> .:: You learn Buff Stamina  ::.</font></center></center>"
				//				src.contents += new/obj/Technique/BuffStamina
				//				src.learn_buffstam=1
						if(src.level>=10000)
							if(!src.learn_buffdef)
								src << "<center><font color = white> .:: You learn Buff Defense  ::.</font></center></center>"
								src.contents += new/obj/Technique/BuffDefense
								src.learn_buffdef=1

						if(src.level>=15000)
							if(!src.learn_buffstr)
								src << "<center><font color = white> .:: You learn Buff Strength  ::.</font></center></center>"
								src.contents += new/obj/Technique/BuffStrength
								src.learn_buffstr=1
						if(src.level>=20000)
							if(!src.learn_buffki)
								src << "<center><font color = white> .:: You learn Buff Ki  ::.</font></center></center>"
								src.contents += new/obj/Technique/BuffKi
								src.learn_buffki=1
						if(src.level>=25000)
							if(!src.learn_buffpl)
								src << "<center><font color = white> .:: You learn Buff Powerlevel  ::.</font></center></center>"
								src.contents += new/obj/Technique/BuffPowerlevel
								src.learn_buffpl=1
						if(src.level>=15000)
							if(!src.learn_adtrain)
								src << "<center><font color = white> .:: You learn Advanced Training  ::.</font></center></center>"
								src.contents += new/obj/Technique/AdvancedTraining
								src.learn_adtrain=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=17500)
						if(!src.learn_gravfield)
							src << "<center><font color = white> .:: You learn Gravity Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/GravityField
							src.learn_gravfield=1

				if(src.race=="Majin")
					if(!src.learn_Regenerate)
						src.contents += new/obj/Technique/Regenerate
						src.learn_Regenerate=1
					if(!src.learn_FatWrap)
						src.contents += new/obj/Technique/FatWrap
						src.learn_FatWrap=1
					if(!src.learn_CandyRay)
						src.contents += new/obj/Technique/CandyRay
						src.learn_CandyRay=1
					if(src.level>=25000)
						if(!src.learn_angryexplosion)
							src << "<center><font color = white> .:: You learn Angry Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/AngryExplosion
							src.learn_angryexplosion=1
					if(src.level>=30000)
						if(!src.learn_genocideattack)
							src<<"<center><font color = white> .:: You learn Genocide Attack  ::.</font></center></center>"
							src.contents += new/obj/Technique/GenocideAttack
							src.learn_genocideattack=1
				if(src.race == "Majin Wizard")
					if(!learn_sorcery)
						src << "<center><font color = white> .:: You learn Majin Sorcery  ::.</font></center></center>"
						src.contents += new/obj/Technique/MajinSorcery
						src.learn_sorcery=1
					if(!src.learn_damagefield)
						src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamageField
						src.learn_damagefield=1
					if(!src.learn_slowfield)
						src << "<center><font color = white> .:: You learn Slow Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/SlowField
						src.learn_slowfield=1
					if(src.level>=15000)
						if(!src.learn_adtrain)
							src << "<center><font color = white> .:: You learn Advanced Training  ::.</font></center></center>"
							src.contents += new/obj/Technique/AdvancedTraining
							src.learn_adtrain=1
				if(src.race=="Namekian")
					if(!src.learn_Regenerate)
						src.contents += new/obj/Technique/Regenerate
						src.learn_Regenerate=1

					if(src.gene=="Corrupted")
						if(!src.learn_Corrupt)
							src.contents += new/obj/Technique/Corrupt
							src.learn_Corrupt=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
/*					if(src.level >= 22500)
						if(!src.learn_chaosball)
							src << "<center><font color = white> .:: You learn Chaos Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/ChaosBall
							src.learn_chaosball = 1*/
					if(src.level>=30000)
						if(!src.learn_hellzonegrenade)
							src<<"<center><font color = white> .:: You learn Hell Zone Grenade  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellZoneGrenade
							src.learn_hellzonegrenade=1

				if(src.race=="Alien")
					if(src.gene=="Hitman"&&!src.learn_assasinate)
						src.contents += new/obj/Technique/Assasinate
						src.learn_assasinate=1
					if(src.gene=="Hitman"&&src.assasin_kill>=1000)
						if(!src.learn_timeskip)
							src.contents += new/obj/Technique/TimeSkip
							src.learn_timeskip=1
					if(src.level>=17500)
						if(!src.learn_gravfield)
							src << "<center><font color = white> .:: You learn Gravity Field  ::.</font></center></center>"
							src.contents += new/obj/Technique/GravityField
							src.learn_gravfield=1
					if(src.level>=30000)
						if(!src.learn_hellzonegrenade)
							src<<"<center><font color = white> .:: You learn Hell Zone Grenade  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellZoneGrenade
							src.learn_hellzonegrenade=1
					if(src.gene=="Pride Trooper"&&src.level>=40000)
						if(!src.learn_glare)
							src<<"<center><font color = white> .:: You learn Glare  ::.</font></center></center>"
							src.contents += new/obj/Technique/Glare
							src.learn_glare=1

				if(src.race=="Saibaman")
					if(!src.learn_Infect)
						src.contents += new/obj/Technique/Infect
						src.learn_Infect=1
					if(!src.learn_damagefield)
						src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamageField
						src.learn_damagefield=1
					if(src.level >= 15000)
						if(!src.learn_acidrain)
							src << "<center><font color = white> .:: You learn Acid Rain  ::.</font></center></center>"
							src.contents += new/obj/Technique/AcidRain
							src.learn_acidrain = 1
					if(src.level >= 25000)
						if(!src.learn_blowup)
							src << "<center><font color = white> .:: You learn Blow Up  ::.</font></center></center>"
							src.contents += new/obj/Technique/BlowUp
							src.learn_blowup = 1
/*					if(src.level >= 37500)
						if(!src.learn_acidbomb)
							src << "<center><font color = white> .:: You learn Acid Bomb  ::.</font></center></center>"
							src.contents += new/obj/Technique/AcidBomb
							src.learn_acidbomb = 1*/

				if(src.race=="Saiyan")
					if(src.level>=2500)
						if(!src.learn_fakemoon)
							src << "<center><font color = white> .:: You learn Fake Moon ::.</font></center></center>"
							src.contents += new/obj/Technique/FakeMoon
							src.learn_fakemoon = 1
					if(src.level>=6500)
						if(!src.learn_galacticdonut)
							src << "<center><font color = white> .:: You learn Galactic Donut  ::.</font></center></center>"
							src.contents += new/obj/Technique/GalacticDonut
							src.learn_galacticdonut = 1
/*
Crimzon bug fix patch 2.6
remove gigantic meteor from moves learnt
					if(src.level>=22500)
						if(src.gene == "Legendary")
							if(!src.learn_giganticmeteor)
								src << "<center><font color = white> .:: You learn Gigantic Meteor  ::.</font></center></center>"
								src.contents += new/obj/Technique/GiganticMeteor
								src.learn_giganticmeteor = 1
*/

					if(src.level>=7500)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Shine Missile  ::.</font></center></center>"
							src.contents += new/obj/Technique/ShineMissile
							src.learn_kishower = 1
					if(src.level>=25000)
						if(!src.learn_finalexplosion)
							src << "<center><font color = white> .:: You learn Final Explosion  ::.</font></center></center>"
							src.contents += new/obj/Technique/FinalExplosion
							src.learn_finalexplosion = 1
//					if(src.level>=37500)
//						if(src.gene == "Legendary")
////							if(!src.learn_blastershell)
	//							src << "<center><font color = white> .:: You learn Blaster Shell  ::.</font></center></center>"
	//							src.contents += new/obj/Technique/BlasterShell
	//							src.learn_blastershell = 1
					if(src.level >= 40000)
						if(!src.learn_soulpunisher)
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Soul Punisher</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/SoulPunisher
							src.learn_soulpunisher=1

				if(src.race=="Tuffle")
					if(!src.learn_Infect)
						src.contents += new/obj/Technique/Infect
						src.learn_Infect=1
					if(!src.learn_damagefield)
						src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamageField
						src.learn_damagefield=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=37500)
						if(!src.learn_revengeball)
							src.learn_revengeball=1
							src << "<center><font color = white> .:: You learn Revenge Death Ball  ::.</font></center></center>"
							src.contents += new/obj/Technique/RevengeDeathBall

				if(src.race=="Feline")
					if(src.level>=10000)
						if(!src.learn_dodonpa)
							src << "<center><font color = white> .:: You learn Dodonpa  ::.</font></center></center>"
							src.contents += new/obj/Technique/Dodonpa
							src.learn_dodonpa=1
					if(src.level>=15000)
						if(!src.learn_kishower)
							src << "<center><font color = white> .:: You learn Ki Shower  ::.</font></center></center>"
							src.contents += new/obj/Technique/KiShower
							src.learn_kishower=1
					if(src.level>=23000)
						if(!src.learn_hellzonegrenade)
							src<<"<center><font color = white> .:: You learn Hell Zone Grenade  ::.</font></center></center>"
							src.contents += new/obj/Technique/HellZoneGrenade
							src.learn_hellzonegrenade=1
					if(src.level>=30000)
						if(!src.learn_revengeball)
							src << "<center><font color = white> .:: You learn Revenge Ball  ::.</font></center></center>"
							src.learn_revengeball=1
							src.contents += new/obj/Technique/RevengeDeathBall
					if(src.level>=40000)
						if(!src.learn_dimensionsword)
							src << "<center><font color = white> .:: You learn Dimension Sword Attack  ::.</font></center></center>"
							src.learn_dimensionsword=1
							src.contents += new/obj/Technique/DimensionSwordAttack


//all races learn these techs
				if(src.level>=20000)
					if(!src.learn_generic1)
						if(src.race=="Konat")
							src.contents += new/obj/Technique/FurryBreaker
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Furry Breaker</font>  ::.</font></center></center>"

							src.learn_generic1=1
						if(src.race=="Android")
							src.contents += new/obj/Technique/KiNeedles
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Ki Needles</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Bio Android")
							src.contents += new/obj/Technique/GigaDrop
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Giga Drop</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Bio Warrior")
							src.contents += new/obj/Technique/AntiMatter
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Anti Matter</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Changeling")
							src.contents += new/obj/Technique/FrostBite
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Frost Bite</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Demon")
							src.contents += new/obj/Technique/ImmortalFlame
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Immortal Flame</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Dragon")
							src.contents += new/obj/Technique/BlackStorm
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Black Storm</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Half Saiyan")
							src.contents += new/obj/Technique/MysticSpirit
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Mystic Spirit</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Heran") //bojack
							src.contents += new/obj/Technique/StoneToss
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Stone Toss</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Human")
							src.contents += new/obj/Technique/KiSiege
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Ki Siege</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Kai")
							src.contents += new/obj/Technique/GrandKiBlast
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Grand Ki Blast</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Majin")
							src.contents += new/obj/Technique/CandyBomb
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Candy Bomb</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Majin Wizard")
							src.contents += new/obj/Technique/MajinStriker
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Majin Striker</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Namekian")
							src.contents += new/obj/Technique/SoulPierce
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Soul Pierce</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Saibaman")
							src.contents += new/obj/Technique/BeamFurry
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Beam Fury</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Saiyan")
							src.contents += new/obj/Technique/KiSoul
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Ki Soul Blast</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Tuffle")
							src.contents += new/obj/Technique/OrbitExplosion
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Orbital Explosion</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Feline")
							src.contents += new/obj/Technique/DragonTempest
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Dragon Tempest</font>  ::.</font></center></center>"

							src.learn_generic1=1

						if(src.race=="Alien")
							if(src.gene=="Hitman")
								src.contents += new/obj/Technique/VortexSkip
								src << "<center><font color = white> .:: You learn <font color=#cccccc>Vortex Skip</font>  ::.</font></center></center>"

								src.learn_generic1=1

							if(src.gene=="Pride Trooper")
								src.contents += new/obj/Technique/TrooperBomb
								src << "<center><font color = white> .:: You learn <font color=#cccccc>Trooper Bomb</font>  ::.</font></center></center>"

								src.learn_generic1=1




				if(!src.learn_push)
					if(src.level >= 25000)
						src.contents += new/obj/Technique/Push
						src.learn_push=1
						src << "<center><font color = white> .:: You learn Push ::.</font></center></center>"
				if(!src.learn_shieldsmash)
					if(src.level >= 30000)
						src.contents += new/obj/Technique/shieldsmash
						src.learn_shieldsmash=1
						src << "<center><font color = white> .:: You learn Shield Smash ::.</font></center></center>"

				if(!src.learn_kipunch)
					if(src.level >= 50000)
						src.contents += new/obj/Technique/KiPunch
						src.learn_kipunch=1
						src << "<center><font color = white> .:: You learn Iron Fist ::.</font></center></center>"
				if(!src.learn_powerdash)
					if(src.level >= 75000)
						src.contents += new/obj/Technique/PowerDash
						src.learn_powerdash = 1
						src << "<center><font color = white> .:: You learn Power Dash  ::.</font></center></center>"
				if(!src.learn_KiBlast)
					src.contents += new/obj/Technique/KiBlast
					src.learn_KiBlast = 1

				if(src.level >= 250)
					if(!src.learn_sense)
						src << "<center><font color = white> .:: You learn to Sense Energy ::.</font></center></center>"
						src.contents += new/obj/Technique/Sense
						src.learn_sense = 1
				if(src.level >= 500)
					if(!src.learn_aura)
						src << "<center><font color = white> .:: You learn to create an Aura ::.</font></center></center>"
						src.learn_aura=1
						src.contents += new/obj/Technique/Aura
				if(src.level >= 750)
					if(!src.learn_fly)
						src << "<center><font color = white> .:: You learn to Fly ::.</font></center></center>"
						src.contents += new/obj/Technique/Fly
						src.learn_fly = 1
				if(src.level >= 1000)
					if(!src.learn_powerup)
						src << "<center><font color = white> .:: You learn Power Up  ::.</font></center></center>"
						src.contents += new/obj/Technique/PowerUp
						src.learn_powerup = 1
				if(src.level>=1500)
					if(!src.learn_it)
						src << "<center><font color = white> .:: You learn Instant Transmission ::.</font></center></center>"
						src.contents += new/obj/Technique/InstantTransmission
						src.learn_it=1
				if(src.level >= 2000)
					if(!src.learn_enrage)
						src << "<center><font color = white> .:: You learn to Unleash your Rage ::.</font></center></center>"
						src.contents += new/obj/Technique/UnleashRage
						src.learn_enrage = 1
				if(src.level>=2000)
					if(!src.pk)
						player << "<FONT color = #0066ff>Training Information: \white [src] has now become a permanent Combatant."
						src.pk=1
		//		if(!src.race=="Kai")
				if(src.level >= 2500)
					if(!src.learn_rapidblast)
						src << "<center><font color = white> .:: You learn Rapid Blast  ::.</font></center></center>"
						src.contents += new/obj/Technique/RapidBlast
						src.learn_rapidblast = 1

				if(src.level >= 3000)
					if(!src.learn_kamehameha)
						src << "<center><font color = white> .:: You learn Kamehameha  ::.</font></center></center>"
						src.contents += new/obj/Technique/Kamehameha
						src.learn_kamehameha = 1

				if(src.level >= 3500)
					if(!src.learn_explosivewave)
						src << "<center><font color = white> .:: You learn Explosive Wave  ::.</font></center></center>"
						src.contents += new/obj/Technique/ExplosiveWave
						src.learn_explosivewave = 1

/*				if(src.level >= 5000)
					if(!src.learn_cherrybomb)
						src << "<center><font color = white> .:: You learn <font color=#990000>Cherry Bomb</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/CherryBomb
						src.learn_cherrybomb = 1*/

				if(src.level >= 6500)
					if(!src.learn_swordslash)
						if(src.weapon)
							src << "<center><font color = white> .:: You learn <font color=red>Sword Slash</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/Sword_Slash
							src.learn_swordslash = 1

/*				if(src.level >= 8000)
					if(!src.learn_fireki)
						src << "<center><font color = white> .:: You learn <font color=#ff6600>Fire Ki</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/FireKi
						src.learn_fireki = 1

				if(src.level >= 8500)
					if(!src.learn_arcblast)
						src << "<center><font color = white> .:: You learn <font color=#0000ff>Arc Wave</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/ArcBlast
						src.learn_arcblast = 1

				if(src.level >= 9000)
					if(!src.learn_waterjet)
						src << "<center><font color = white> .:: You learn <font color=#0000ff>Water Jet</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/WaterJet
						src.learn_waterjet=1

				if(src.level >= 9500)
					if(!src.learn_whirlwind)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Whirl Wind Spin</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/WhirlWindSpin
						src.learn_whirlwind = 1*/

				if(src.level >= 10000)
					if(!src.learn_burst)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Burst Rush</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/BurstRush
						src.learn_burst = 1

/*				if(src.level >= 10000)
					if(src.karma == "Evil" && src.karma_rating >= 10)
						if(!src.learn_darkblast)
							src << "<center><font color = white> .:: You learn <font color=#202020>Dark Blast</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/DarkBlast
							src.learn_darkblast = 1

				if(src.level >= 10500)
					if(src.karma == "Good" && src.karma_rating >= 10)
						if(!src.learn_holyblast)
							src << "<center><font color = white> .:: You learn Holy Blast  ::.</font></center></center>"
							src.contents += new/obj/Technique/HolyBlast
							src.learn_holyblast = 1*/
/*
				if(src.level >= 12500)
					if(!src.learn_kicannon)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Ki Cannon</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/EnergyCannon
						src.learn_kicannon = 1
*/
				if(src.level >= 15000)
					if(!src.learn_starbang)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Star Bang</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/StarBang
						src.learn_starbang=1

				if(src.level >= 18000)
					if(!src.learn_bblast)
						src << "<center><font color = white> .:: You learn <font color=#ff6600>Blazing Blast</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/BlazingBlast
						src.learn_bblast=1
/*
				if(src.level >= 19000)
					if(!src.learn_zapcannon)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Zap Cannon</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/ZapCannon
						src.learn_zapcannon=1 */

				if(src.level >= 20000)
					if(!src.learn_erain)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Electric Rain</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/ElectricRain
						src.learn_erain=1
/*
				if(src.level >= 22000)
					if(!src.learn_gtyrant)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Galactic Tyrant</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/GalacticTyrant
						src.learn_gtyrant=1
					*/
/*
				if(src.level >= 22000)
					if(!src.learn_phantomattack)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Phantom Attack</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/PhantomAttack
						src.learn_phantomattack=1
						*/

/*				if(src.level >= 26000)
					if(src.karma == "Evil" && src.karma_rating >= 25)
						if(!src.learn_darkbomb)
							src << "<center><font color = white> .:: You learn <font color=#202020>Dark Bomb</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/DarkBomb
								src.learn_darkbomb = 1

				if(src.level >= 27000)
					if(src.karma == "Good" && src.karma_rating >= 25)
						if(!src.learn_lightsphere)
							src << "<center><font color = white> .:: You learn Light Sphere Attack  ::.</font></center></center>"
							src.contents += new/obj/Technique/LightSphere
							src.learne_lightsphere = 1*/

				if(src.level >= 17500)
					if(!src.learn_SuperExplosionWave)
						src << "<center><font color = white> .:: You learn Super Explosion Wave  ::.</font></center></center>"
						src.contents += new/obj/Technique/SuperExplosionWave
						src.learn_SuperExplosionWave = 1

				if(src.level >= 30000)
					if(!src.learn_tswordslash)
						if(src.weapon)
							src << "<center><font color = white> .:: You learn <font color=#202020>Thousand Sword Slash</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/ThousandSwordSlash
							src.learn_tswordslash = 1

				if(src.level >= 18000)
					if(!src.learn_executionersstrike)
						if(src.weapon)
							src << "<center><font color = white> .:: You learn <font color=#ffbf80>Executioners Strike</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/ExecutionersStrike
							src.learn_executionersstrike=1

				if(src.level >= 32000)
					if(!src.learn_novablast)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Nova Blast</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/NovaBlast
						src.learn_novablast=1

/*				if(src.level >= 36000)
					if(!src.learn_infernoblitz)
						src << "<center><font color = white> .:: You learn <font color=#ff6600>Inferno Blitz</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/InfernoBlitz
						src.learn_infernoblitz = 1

				if(src.level >= 37000)
					if(src.karma == "Evil" && src.karma_rating >= 50)
						if(!src.learn_bloodbomb)
							src << "<center><font color = white> .:: You learn <font color=#990000>Blood Bomb</font>  ::.</font></center></center>"
							src.contents += new/obj/Technique/BloodBomb
							src.learn_bloodbomb = 1

				if(src.level >= 40000)
					if(!src.learn_godlyblast)
						src << "<center><font color = white> .:: You learn <font color=#cccccc>Godly Blast</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/GodlyBlast
						src.learn_godlyblast=1*/

				if(src.level>=20000)
					if(src.race == "Kai")
						if(src.gene == "Ultimate" || src.gene == "Zealot")
							if(!src.learn_invertpower&&!src.form_1)
								src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
								src.contents += new/obj/Technique/InvertPower
								src.learn_invertpower=1

				if(src.level>=20000)
					if(src.race == "Demon")
						if(src.gene == "Vile" || src.gene == "Sinister")
							if(!src.learn_invertpower&&!src.form_1)
								src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
								src.contents += new/obj/Technique/InvertPower
								src.learn_invertpower=1

				if(src.level>=20000)
					if(src.race == "Human")
						if(src.gene == "Majin Incarnate")
							if(!src.learn_invertpower&&!src.form_1)
								src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
								src.contents += new/obj/Technique/InvertPower
								src.learn_invertpower=1

				if(src.level>=20000)
					if(src.race == "Saibaman")
						if(src.gene == "Virulent"|| src.gene == "Godly")
							if(!src.learn_invertpower&&!src.form_1)
								src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
								src.contents += new/obj/Technique/InvertPower
								src.learn_invertpower=1

				if(src.level>=20000)
					if(src.race == "Bio Android" ||src.race == "Alien" && src.gene == "Hitman" || src.race == "Dragon" || src.race == "Feline" || src.race == "Konat" || src.race == "Majin" || src.race == "Namekian" || src.race == "Tuffle")
						if(!src.learn_invertpower&&!src.form_1)
							src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
							src.contents += new/obj/Technique/InvertPower
							src.learn_invertpower=1
				if(src.level>=20000)
					if(src.race == "Android")
						if(src.gene == "Bionic" || src.gene == "Mechanical")
							if(!src.learn_invertpower&&!src.form_1)
								src << "<center><font color = white> .:: You learn Invert Power  ::.</font></center></center>"
								src.contents += new/obj/Technique/InvertPower
								src.learn_invertpower=1
			/*	if(src.level >= 5)
					if(!src.learn_burningdragon)
						src << "<center><font color = white> .:: You learn <font color=#202020>Burning Dragon</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/BurningDragon
						src.learn_burningdragon = 1

					if(!src.learn_damnedshark)
						src << "<center><font color = white> .:: You learn <font color=#202020>Damned Shark</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamnedShark
						src.learn_damnedshark = 1


					if(!src.learn_deadbeam)
						src << "<center><font color = white> .:: You learn <font color=#202020>Dead Beam</font>  ::.</font></center></center>"
						src.contents += new/obj/Technique/DeadBeam
						src.learn_deadbeam = 1				*/


				if(src.level>=80000)
					if(!src.learn_generic2)
						if(src.race=="Konat")
							src.contents += new/obj/Technique/TyrantBlaze
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Tyrant Blaze</font>  ::.</font></center></center>"

							src.learn_generic2=1
						if(src.race=="Android")
							src.contents += new/obj/Technique/AndroidBomb
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Android Bomb</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Bio Android")
							src.contents += new/obj/Technique/GigaSpear
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Giga Spear</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Bio Warrior")
							src.contents += new/obj/Technique/NerfMissles
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Nerf Missles</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Changeling")
							src.contents += new/obj/Technique/DeathBomb
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Death Bomb</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Demon")
							src.contents += new/obj/Technique/DesolateFlame
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Desolate Flame</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Dragon")
							src.contents += new/obj/Technique/ShenronsWrath
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Shenrons Wrath</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Half Saiyan")
							src.contents += new/obj/Technique/MasenkoBomb
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Masenko Bomb</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Heran") //bojack
							src.contents += new/obj/Technique/SealBraze
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Seal Braze</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Human")
							src.contents += new/obj/Technique/SpiritWisp
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Spirit Wisp</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Kai")
							src.contents += new/obj/Technique/LegacyKiDrop
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Legacy Ki Drop</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Majin")
							src.contents += new/obj/Technique/MajinRazor
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Majin Razor</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Majin Wizard")
							src.contents += new/obj/Technique/BibidiBlaze
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Bibidi Blaze</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Namekian")
							src.contents += new/obj/Technique/KamisWisdom
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Kamis Wisdom</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Saibaman")
							src.contents += new/obj/Technique/SaibaStake
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Saiba Stake</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Saiyan")
							src.contents += new/obj/Technique/KiStone
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Ki Stone</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Tuffle")
							src.contents += new/obj/Technique/RageBall
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Rage Ball</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Feline")
							src.contents += new/obj/Technique/DestructiveBlast
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Destructive Blast</font>  ::.</font></center></center>"

							src.learn_generic2=1

						if(src.race=="Alien")
							if(src.gene=="Hitman")
								src.contents += new/obj/Technique/TimeSoul
								src << "<center><font color = white> .:: You learn <font color=#cccccc>Time Soul</font>  ::.</font></center></center>"

								src.learn_generic2=1

							if(src.gene=="Pride Trooper")
								src.contents += new/obj/Technique/PrideSpazm
								src << "<center><font color = white> .:: You learn <font color=#cccccc>Pride Spazm</font>  ::.</font></center></center>"

								src.learn_generic2=1


				//NEW TECHS

	//DEFENSIVE TECHS
				if(!src.energy_barrier_learn)
					if(src.level>=45000)
						src.energy_barrier_learn = 1
						src.contents += new/obj/Technique/EnergyBarrier

						src << "<center><font color = white> .:: You learn Energy Barrier ::.</font></center>"


				if(src.gene=="Kamenian")
					if(!src.learn_damagefield)
						src << "<center><font color = white> .:: You learn Damage Field  ::.</font></center></center>"
						src.contents += new/obj/Technique/DamageField
						src.learn_damagefield=1
			//		if(src.level>=7500)
			//			if(!src.learn_buffstam)
			//				src << "<center><font color = white> .:: You learn Buff Stamina  ::.</font></center></center>"
			//				src.contents += new/obj/Technique/BuffStamina
			//				src.learn_buffstam=1
					if(src.level>=10000)
						if(!src.learn_buffdef)
							src << "<center><font color = white> .:: You learn Buff Defense  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffDefense
							src.learn_buffdef=1

					if(src.level>=25000)
						if(!src.learn_buffpl)
							src << "<center><font color = white> .:: You learn Buff Powerlevel  ::.</font></center></center>"
							src.contents += new/obj/Technique/BuffPowerlevel
							src.learn_buffpl=1
					if(src.level>=15000)
						if(!src.learn_adtrain)
							src << "<center><font color = white> .:: You learn Advanced Training  ::.</font></center></center>"
							src.contents += new/obj/Technique/AdvancedTraining
							src.learn_adtrain=1

					if(src.level>=100000)
						if(!src.learn_Regenerate)
							src << "<center><font color = white> .:: You learn Regeneration  ::.</font></center></center>"
							src.contents += new/obj/Technique/Regenerate
							src.learn_Regenerate=1


/*
				if(src.level>=13000)
					if(!src.learn_sauzerblade)
						src << "<center><font color = white> .:: You learn Sauzer Blade  ::.</font></center></center>"
						src.contents += new/obj/Technique/SauzerBlade
						src.learn_sauzerblade = 1
						*/

				if(src.gene=="Moro")
					if(src.level>=50000)
						if(!src.learn_mouthblast)
							src.contents += new/obj/Technique/MouthBlast
							src << "<center><font color = white> .:: You learn <font color=#cccccc>Mouth Energy Wave</font>  ::.</font></center></center>"

							src.learn_mouthblast=1