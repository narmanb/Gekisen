/*
centrilised damage proc - beam attacks
var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(M.powerlevel*M.kidefense*M.ki_res*100))
Where the 100 at the end of M.ki.res*100 is the base damage unit aka a ki blast and where 200 is the maximum damage that can be assigned ie: special beam cannon src.power would be 200

for homings the damage calc will be 1/4rd
var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power/4)-round(M.powerlevel*M.kidefense*M.ki_res*100))

for multi tile the damage proc will be 1/3
var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power/3)-round(M.powerlevel*M.kidefense*M.ki_res*100))

*/
mob
	var
		tmp
			kiblast_cd=0
			TenxKamehameha_cd=0
			galickgun_cd=0
			finishbuster_cd=0
			finalflash_cd=0
			finalshine_cd=0
			deathbeam_cd=0
			deathwave_cd=0
			candyray_cd=0
			lightgrenade_cd=0
			destructodisk_cd=0
			keizendisk_cd=0
			karmabomb_cd=0
			ssdeadlybomber_cd=0
			rapidblast_cd=0
			shinemissle_cd=0
			flameshower_cd=0
			specialbeamcannon_cd=0
			hellzonegrenade_cd=0
			genocideattack_cd=0
			dragonfist_cd=0
			dimensionalswordatk_cd=0
			swordslash_cd=0
			thousandslash_cd=0
		//	burstrush_cd=0
			solarflare_cd=0
			wrap_cd=0
			explosivewave_cd=0
			es_cd=0
			sew_cd=0
			generic2_cd=0
			kipunch_cd=0
			dodonpa_cd=0
			aoefield_cd=0
			tracenuke_cd=0
			mouthblast_cd=0

			shieldsmash_cd=0



	proc
		TechCD(Tech,CD)
			if(Tech=="10xKamehameha")
				usr.TenxKamehameha_cd=1
				spawn(CD)usr.TenxKamehameha_cd=0
			if(Tech=="galickgun")
				usr.galickgun_cd=1
				spawn(CD)usr.galickgun_cd=0
			if(Tech=="finishbuster")
				usr.finishbuster_cd=1
				spawn(CD)usr.finishbuster_cd=0
			if(Tech=="finalflash")
				usr.finalflash_cd=1
				spawn(CD)usr.finalflash_cd=0
			if(Tech=="finalshine")
				usr.finalshine_cd=1
				spawn(CD)usr.finalshine_cd=0
			if(Tech=="deathbeam")
				usr.deathbeam_cd=1
				spawn(CD)usr.deathbeam_cd=0
			if(Tech=="deathwave")
				usr.deathwave_cd=1
				spawn(CD)usr.deathwave_cd=0
			if(Tech=="specialbeamcannon")
				usr.specialbeamcannon_cd=1
				spawn(CD)usr.specialbeamcannon_cd=0
			if(Tech=="candyray")
				usr.candyray_cd=1
				spawn(CD)usr.candyray_cd=0
			if(Tech=="lightgrenade")
				usr.lightgrenade_cd=1
				spawn(CD)usr.lightgrenade_cd=0
			if(Tech=="destructodisk")
				usr.destructodisk_cd=1
				spawn(CD)usr.destructodisk_cd=0
			if(Tech=="keizendisk")
				usr.keizendisk_cd=1
				spawn(CD)usr.keizendisk_cd=0
			if(Tech=="karmabomb")
				usr.karmabomb_cd=1
				spawn(CD)usr.karmabomb_cd=0
			if(Tech=="ssdeadlybomber")
				usr.ssdeadlybomber_cd=1
				spawn(CD)usr.ssdeadlybomber_cd=0
			if(Tech=="rapidblast")
				usr.rapidblast_cd=1
				spawn(CD)usr.rapidblast_cd=0
			if(Tech=="dragonfist")
				usr.dragonfist_cd=1
				spawn(CD)usr.dragonfist_cd=0
			if(Tech=="dimensionalswordatk")
				usr.dimensionalswordatk_cd=1
				spawn(CD)usr.dimensionalswordatk_cd=0
			if(Tech=="swordslash")
				usr.swordslash_cd=1
				spawn(CD)usr.swordslash_cd=0
			if(Tech=="thousandslash")
				usr.thousandslash_cd=1
				spawn(CD)usr.thousandslash_cd=0
			/*
			if(Tech=="burstrush")
				usr.burstrush_cd=1
				spawn(CD)usr.burstrush_cd=0
			*/
			if(Tech=="solarflare")
				usr.solarflare_cd=1
				spawn(CD)usr.solarflare_cd=0
			if(Tech=="wrapattack")
				usr.wrap_cd=1
				spawn(CD)usr.wrap_cd=0
			if(Tech=="explosivewave")
				usr.explosivewave_cd=1
				spawn(CD)usr.explosivewave_cd=0
			if(Tech=="explosivewave")
				usr.explosivewave_cd=1
				spawn(CD)usr.explosivewave_cd=0
			if(Tech=="es")
				usr.es_cd=1
				spawn(CD)usr.es_cd=0
			if(Tech=="sew")
				usr.sew_cd=1
				spawn(CD)usr.sew_cd=0
			if(Tech=="kipunch")
				usr.kipunch_cd=1
				spawn(CD)usr.kipunch_cd=0


			if(Tech=="shieldsmash")
				usr.shieldsmash_cd=1
				spawn(CD)usr.shieldsmash_cd=0

			if(Tech=="generic2")
				usr.generic2_cd=1
				spawn(CD)usr.generic2_cd=0
			if(Tech=="dodonpa")
				usr.dodonpa_cd=1
				spawn(CD)usr.dodonpa_cd=0
			if(Tech=="aoefield")
				usr.aoefield_cd=1
				spawn(CD)usr.aoefield_cd=0
			if(Tech=="tracenuke")
				usr.tracenuke_cd=1
				spawn(CD)usr.tracenuke_cd=0

			if(Tech=="mouthblast")
				usr.mouthblast_cd=1
				spawn(CD)usr.mouthblast_cd=0
//The Jiren Glare Tech proc first
/*
O is the owner of the attack
Z is the name of the attack
Power is how much it'll affect the dmg, in this case i dont want any so itll be 0
I is the icon
IS is the icon state
Effect considers criticals etc, maybe remove this one
Targ is the target set via proc
*/

obj
	proc
		JirenGlareHoming(mob/O,Z,Power,I,IS,Effect,Targ)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range+=1
			src.name=Z
	//		O.ki-=round(O.ki/100)*O.kiuse
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(get_dist(src, Targ) > 0)
					step_to(src, Targ)
					sleep(1)
				else
					src.icon=null
					break
			Explode(new /Effect/BasicBoom(src.loc,1,5))
			for(var/mob/M in view(5,Targ))
				//var/damage3 = round(((O.ki*O.ki_power)/100))
				var/randPL = usr.powerlevel*0.15
				var/randKI = usr.ki*0.15

				var/damage3 = round((randPL + randKI) * usr.ki_power/100)

				var/mindmg = round(M.powerlevel_max*0.1)
				if(usr.spar && M.spar)
					damage3 = mindmg
				if(!M.dead&&!M.safe&&M.pk)
					var/damage2=(damage3-round((M.kidefense*M.ki_res)*0.5))/(((2+get_dist(Targ,M))/2))
					if(damage2<0)
						damage2=0
					if(istype(M,/mob/PC))
						M.rage += round(rand(1,3))
						if(M.rage >= 100)
							M.rage = 100
						if(M.iting && M.pvpflagged)
							M.ITstop = 1
							damage2 *= 2
							src << output("<font size=1><b><font color=yellow>[M]<font color = red> sustained double damage from attempting to instant transmission away!","default.output2")

					M.powerlevel-=damage2
					O<<output("<font color=yellow>Your Glare damages [M] for [damage2] damage!","output2")
					if(M.client)
						M << output("<font color=red>[O]'s glare damages you with [damage2] damage!","output2")
					M.DeathCheck(O)
			del(src)

		Homing(mob/O,Z,Power,I,IS,Effect,mob/M)
			var/ki_cost = round(Power*O.kiuse)
			if(O.ki >= ki_cost)
				O.ki-=ki_cost
				O.ki_cast_exp += 1 + round(usr.level/8000)
				O.Ki_Cast_Level()
				O.ki_use_exp += 1 + round(usr.level/5000)
				O.Ki_Use_Level()
				O.staminaleft += 2000
				if(prob(O.ki_cast))
					O.ki_cast_exp += 5 + round(usr.level/4000)
					O.Ki_Cast_Level()
					//Continue homing setup
					src.owner=O
					src.power=Power
					if(I!=0)
						src.icon=I
					if(IS!=0)
						src.icon_state=IS
					src.range+=1
					src.name=Z
			//		O.ki-=round(O.ki/100)*O.kiuse
					switch(O.dir)
						if(NORTHWEST)
							src.dir = NORTH
							src.loc=locate(O.x,O.y+1,O.z)
						if(SOUTHWEST)
							src.dir = SOUTH
							src.loc=locate(O.x,O.y-1,O.z)
						if(NORTHEAST)
							src.dir = NORTH
							src.loc=locate(O.x,O.y+1,O.z)
						if(SOUTHEAST)
							src.dir = SOUTH
							src.loc=locate(O.x,O.y-1,O.z)
						if(WEST)
							src.dir = WEST
							src.loc=locate(O.x-1,O.y,O.z)
						if(EAST)
							src.dir = EAST
							src.loc=locate(O.x+1,O.y,O.z)
						if(NORTH)
							src.dir = NORTH
							src.loc=locate(O.x,O.y+1,O.z)
						if(SOUTH)
							src.dir = SOUTH
							src.loc=locate(O.x,O.y-1,O.z)
					while(src)
						if(get_dist(src, M) > 0)
							step_to(src, M)
							sleep(1)
						else
							src.icon=null
							break
					if(!M.dead&&!M.safe&&M.pk)
						if(O.dead)return
						//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(M.powerlevel*M.kidefense*M.ki_res*100))
						var/damage = (src.power*rand(0.8,1.2)) - (M.powerlevel+(M.kidefense*M.ki_res/100))
						if(damage<0)
							damage=0

						var/mindmg = round(M.powerlevel_max*0.03)
						if(O.spar && M.spar)
							damage = mindmg

						M.powerlevel-=damage
						O<<output("<font color=yellow>Your [Z] damages [M] for [damage] damage!","output2")
						if(M.client)
							M << output("<font color=red>[O]'s [Z] damages you with [damage] damage!","output2")
						M.DeathCheck(O)
				else
					O<<output("<font color=red>Your [Z] fails!","output2")
					return

		KiAttackStraight(mob/O,Z,Power,I,IS,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range=0
			src.name=Z
	//		O.ki-=round(O.ki/100)*O.kiuse
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!src.owner||src.owner==null||!O)
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				for(var/turf/Floors/Safe_Zone/S in view(1))
					if(S in view(1))
						del(src)
						break
				if(!T.density&&src.power>160)
					if(istype(T,/turf/Earth/Island_Edge_005))
						var/obj/techs/Overlays/CraterTrail/TTrail=new
						TTrail.dir=src.dir
						TTrail.loc=T
				for(var/mob/M in T)
					O.doing=0
					O.frozen=0
					if(M.pk&&!M.safe&&!M.dead)
						//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(M.powerlevel*M.kidefense*M.ki_res*100))
						var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
						if(Effect=="Critical")
							if(prob(40))
								damage*=2
						if(Z=="Distructo Disk"||Z=="Kienzan Disk")
							if(prob(45))
								M.has_tail=0
								M.overlays-='Tail.dmi'
								M.tail_grow_delay=30
								M.Tail_Grow()
						M.powerlevel-=damage
						src.power-=damage
						M.ki_res_exp += 5+round(M.level/1500)
						M.Ki_Res_Level()
						O.ki_pow_exp += 5+round(O.level/1000)
						O.Ki_Power_Level()
						if(M.attacktext)
							M << "<font color = red>[O]'s [src.name] hits you with [damage] damage!"
						if(O.attacktext)
							O << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
						if(O.lethalon)
							M.DeathCheck(O)
						else
							spawn(0)M.KO()
						if(src.power>=160)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=120)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						for(var/obj/Buildings/DE in oview(1,src))
							DE.hp-=src.power
							spawn(0)DE.DestroyIt()
						src.ExplodeDamage(M,1,src.power)
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						for(var/obj/Buildings/DE2 in oview(1,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,1,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N in get_step(src,src.dir))
					//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(N.powerlevel*N.kidefense*N.ki_res*100))
					var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (N.powerlevel+(N.kidefense*N.ki_res/100))
					if(N.kiabsorb)
						var/absorbpower=round(N.powerlevel*N.ki_res)
						if(absorbpower>=damage)
							N.ki+=damage
							if(N.attacktext)
								N << "<font color = red>You absorb [O]'s [src.name] adding [damage] to your ki!"
							if(O.attacktext)
								O << "<font color = red>Your [src.name] was absorbed by [N] adding [damage] to their ki!"
						else
							var/finaldmg=round(damage-absorbpower)
							N.powerlevel-=finaldmg
							src.power-=absorbpower
							N.ki_res_exp += 5+round(N.level/300)
							N.Ki_Res_Level()
							O.ki_pow_exp += 5+round(O.level/200)
							O.Ki_Power_Level()
							if(N.attacktext)
								N << "<font color = red>[O]'s [src.name] hits you with [finaldmg] damage!"
							if(O.attacktext)
								O << "<font color = red>Your [src.name] hits [N] with[finaldmg] damage!"
							if(O.lethalon)
								N.DeathCheck(O)
							else
								spawn(0)N.KO()
						src.TrailDelete()
						break
					else
						if(N.Dodge_Attack(src.owner)==TRUE)
							flick("IT",N)
							switch(src.dir)
								if(WEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(EAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTHWEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTHEAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTHEAST)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTHWEST)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
						else
							if(N.Deflect_Attack(src.owner)==TRUE)
								var/mob/DO=src.owner
								spawn(0)DO.DeleteTrails()
								src.range=0
								src.owner=N
								src.dir=N.dir
						//		N.deflect_exp += 5+round(N.level/1500)
						//		N.Deflect_Level()
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=15)
					if(src.power>=160)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=120)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					for(var/obj/Buildings/DE in oview(1,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,1,src.power)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)

		KiBeam(mob/O,Z,Power,I,IS,IST,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range=0
			src.name=Z
			O.overlays+=icon('Techs.dmi',"[IS]ki")
			src.clashable=1
			O.beaming=1
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!src.owner||src.owner==null||!O)
					for(var/obj/Tech/BeamH/BC in get_step(src,src.dir))
						BC.clashing=1
					for(var/obj/Tech/BR in world)
						if(BR.owner==src.owner)
							del(BR)
					del(src)
					break
				if(!src.clashing)
					src.range+=1
					var/turf/T=src.loc
					if(!T.density&&src.power>160)
						if(istype(T,/turf/Earth/Island_Edge_005))
							var/obj/techs/Overlays/CraterTrail/TTrail=new
							TTrail.dir=src.dir
							TTrail.loc=T
					for(var/mob/M in T)
						if(M.pk&&!M.safe&&!M.dead)
							if(Effect=="Candy")
								//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(M.powerlevel*M.kidefense*M.ki_res*100))
						//		var/damage=round(((usr.ki*usr.ki_power)/1000)-((M.kidefense*M.ki_res)/1250))+src.power
							//	var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
							//	if(damage<src.power)
							//		damage=src.power
								var/damage = src.power
								M.powerlevel-=damage
								src.power-=damage
								M.ki_res_exp += 5+round(M.level/1500)
								M.Ki_Res_Level()
								O.ki_pow_exp += 5+round(O.level/1000)
								O.Ki_Power_Level()
								if(M.attacktext)
									M << "<font color = red>[O]'s [src.name] hits you with [damage] damage!"
								if(O.attacktext)
									O << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
								if(M.powerlevel<=0)
									if(M.race == "Android")
										M.icon_state = ""
										M.doing = 0
										M.frozen = 0
										M.powerlevel = 0
										if(O.lethalon)
											M.DeathCheck(O)
										else
											spawn(0)M.KO()
									else
										var/obj/Equipment/Consumable/Candy/C = new
										C.loc = src.loc
										C.name = "[M.name]'s Candy"
										if(istype(M,/mob/PC))
											C.candy_pl = round(M.powerlevel_max/500)
										C.icon = 'Candy.dmi'
										M.icon_state = ""
										C.loc = M.loc
										//M.powerlevel_max -= round(M.powerlevel_max/500)
										M.powerlevel = 0
										M.DeathCheck(O,"Candy")
								if(src.power<=0)
									O.frozen=0
									O.doing=0
									O.icon_state=""
									src.TrailDelete()
									break
							else
								//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(M.powerlevel*M.kidefense*M.ki_res*100))
						//		var/damage=((O.ki*O.ki_power)/1000)-round((M.kidefense*M.ki_res)/1250)+src.power
								var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))

								if(Effect=="Critical")
									if(prob(40))
										damage*=2
								var/apower=src.power
								if(damage<apower)
									damage=apower
								M.powerlevel-=damage
								src.power-=damage
								M.ki_res_exp += 5+round(M.level/1500)
								M.Ki_Res_Level()
								O.ki_pow_exp += 5+round(O.level/1000)
								O.Ki_Power_Level()
								if(M.attacktext)
									M << "<font color = red>[O]'s [src.name] hits you with [damage] damage!"
								if(O.attacktext)
									O << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
								if(O.lethalon)
									M.DeathCheck(O)
								else
									spawn(0)M.KO()
								if(src.power>=160)
									var/obj/techs/Overlays/Crater_Center/C=new
									C.loc=src.loc
								else
									if(src.power>=120)
										var/obj/techs/Overlays/Crater_Small/C=new
										C.loc=src.loc
								var/drange=1
								for(var/obj/Buildings/DE in oview(drange,src))
									DE.hp-=src.power/(1+get_dist(src,DE))
									spawn(0)DE.DestroyIt()
								src.ExplodeDamage(M,drange,apower)
								if(src.power<=0)
									O.frozen=0
									O.doing=0
									O.icon_state=""
									src.TrailDelete()
									break
						else
							O.frozen=0
							O.doing=0
							O.icon_state=""
							src.TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=src.owner
						if(!DEO.see_invisible)
							if(istype(DE,/obj/Buildings)&&DE.invisibility)
								continue
						DE.hp-=src.power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=src.power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							DEO.frozen=0
							DEO.doing=0
							DEO.icon_state=""
							src.TrailDelete()
							break
					for(var/mob/N in get_step(src,src.dir))
						//var/damage=round(round(O.powerlevel*src.power*O.ki*O.ki_power)-round(N.powerlevel*N.kidefense*N.ki_res*100))
						var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (N.powerlevel+(N.kidefense*N.ki_res/100))
						damage = round(damage)
						if(N.kiabsorb)
							var/absorbpower=round(N.powerlevel*N.ki_res)
							if(absorbpower>=damage)
								N.ki+=damage
								if(N.attacktext)
									N << "<font color = red>You absorb [O]'s [src.name] adding [damage] to your ki!"
								if(O.attacktext)
									O << "<font color = red>Your [src.name] was absorbed by [N] adding [damage] to their ki!"
							else
								var/finaldmg=round(damage-absorbpower)
								N.powerlevel-=finaldmg
								src.power-=absorbpower
								N.ki_res_exp += 5+round(N.level/300)
								N.Ki_Res_Level()
								O.ki_pow_exp += 5+round(O.level/200)
								O.Ki_Power_Level()
								if(N.attacktext)
									N << "<font color = red>[O]'s [src.name] hits you with [finaldmg] damage!"
								if(O.attacktext)
									O << "<font color = red>Your [src.name] hits [N] with[finaldmg] damage!"
								if(O.lethalon)
									N.DeathCheck(O)
								else
									spawn(0)N.KO()
									O.frozen=0
									O.doing=0
									O.icon_state=""
									src.TrailDelete()
									break

						else
							if(N.Dodge_Attack(src.owner)==TRUE)
								flick("IT",N)
								switch(src.dir)
									if(WEST)
										if(prob(50))
											N.loc=locate(N.x,N.y+2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x,N.y-2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(EAST)
										if(prob(50))
											N.loc=locate(N.x,N.y+2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x,N.y-2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(NORTH)
										if(prob(50))
											N.loc=locate(N.x+2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x-2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(SOUTH)
										if(prob(50))
											N.loc=locate(N.x+2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x-2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
							else
								if(N.Deflect_Attack(src.owner)==TRUE)
									var/mob/DO=src.owner
									DO.DeleteTrails()
									src.range=0
									DO.doing=0
									DO.icon_state=""
									DO.frozen=0
									N.doing=1
									N.frozen=1
									N.reflect_exp += 5+round(N.level/1500)
									N.Reflect_Level()
									flick("attack",N)
									src.owner=N
									src.dir=N.dir
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashable)
							if(!C.clashing)
								if(src.dir==NORTH&&C.dir==SOUTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==SOUTH&&C.dir==NORTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==EAST&&C.dir==WEST)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==WEST&&C.dir==EAST)
									C.clashing=1
									src.clashing=1
									goto CLASH
							else
								if(src.dir==C.dir)
									C.power+=src.power
									O.frozen=0
									O.doing=0
									O.icon_state=""
									src.TrailDelete()
									break
								else
									C.power-=src.power*0.6
									O.frozen=0
									O.doing=0
									O.icon_state=""
									src.TrailDelete()
									break
						else
							if(src.power<C.power)
								O.frozen=0
								O.doing=0
								O.icon_state=""
								if(src.power>=160)
									var/obj/techs/Overlays/Crater_Center/CR=new
									CR.loc=src.loc
								else
									if(src.power>=120)
										var/obj/techs/Overlays/Crater_Small/CR=new
										CR.loc=src.loc
								var/drange=1
								C.power-=src.power
								src.ExplodeDamage(0,drange,src.power)
								src.TrailDelete()
								break
					if(src.power<=0)

						O.frozen=0
						O.doing=0
						O.icon_state=""
						src.TrailDelete()
						break
					if(src.range>=20)
						O.frozen=0
						O.doing=0
						O.icon_state=""
						if(src.power>=160)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=120)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
					step(src,src.dir)
					var/obj/Tech/BeamT/B=new
					B.loc=T
					B.power=src.power
					B.dir=src.dir
					B.owner=src.owner
					B.icon=I
					B.icon_state=IST
					sleep(1)
					CLASH
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashing)
							var/mob/KS1=src.owner
							var/mob/KS2=C.owner
							KS1.clasharrow=src.dir
							KS2.clasharrow=C.dir
							var/P1=src.power+src.clashrush
							var/P2=C.power+C.clashrush
							if(P1>P2)
								var/Ap=(src.power*0.1)+rand(1,10)
								var/Cp=(C.power*0.1)+rand(1,10)
								switch(src.dir)
									if(NORTH)
										var/obj/Tech/BeamT/T1=new
										T1.loc=src.loc
										T.icon_state=IST
										T1.owner=src.owner
										T.dir=src.dir
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										src.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										for(T1 in C.loc)
											if(T1.owner==C.owner)
												spawn(3)del(T1)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(SOUTH)
										var/obj/Tech/BeamT/T1=new
										T1.dir=src.dir
										T1.loc=src.loc
										T.icon_state=IST
										T1.owner=src.owner
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										src.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										for(T1 in C.loc)
											if(T1.owner==C.owner)
												spawn(3)del(T1)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(EAST)
										var/obj/Tech/BeamT/T1=new
										T1.loc=src.loc
										T1.dir=src.dir
										T1.icon_state=IST
										T1.owner=src.owner
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										src.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										for(T1 in C.loc)
											if(T1.owner==C.owner)
												spawn(3)del(T1)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(WEST)
										var/obj/Tech/BeamT/T1=new
										T1.loc=src.loc
										T1.dir=src.dir
										T1.icon_state=IST
										T1.owner=src.owner
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										src.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										for(T1 in C.loc)
											if(T1.owner==C.owner)
												spawn(3)del(T1)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
								if(C.range<1)
									var/mob/W=C.owner
									W.UnFreeze(20)
									src.clashing=0
									C.TrailDelete()
									break
								if(src.power<=0)
									var/mob/W=src.owner
									W.frozen=0
									W.doing=0
									W.icon_state=""
									C.clashing=0
									src.TrailDelete()
									break
							if(src.power<=C.power*2)
								sleep(8)
							else
								if(src.power>C.power*2&&src.power<=C.power*5)
									sleep(6)
								else
									if(src.power>C.power*5&&src.power<=C.power*10)
										sleep(4)
									else
										if(src.power>C.power*10)
											sleep(2)
				else
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashing)
							var/mob/KS1=src.owner
							var/mob/KS2=C.owner
							KS1.clasharrow=src.dir
							KS2.clasharrow=C.dir
							var/P1=src.power+src.clashrush
							var/P2=C.power+C.clashrush
							if(P1>P2)
								var/Ap=(src.power*0.1)+rand(1,10)
								var/Cp=(C.power*0.1)+rand(1,10)
								switch(src.dir)
									if(NORTH)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										T.dir=src.dir
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										src.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(SOUTH)
										var/obj/Tech/BeamT/T=new
										T.dir=src.dir
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										src.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(EAST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										src.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(WEST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										src.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
								if(C.range<1)
									var/mob/W=C.owner
									W.UnFreeze(20)
									src.clashing=0
									C.TrailDelete()
									break
								if(src.power<=0)
									var/mob/W=src.owner
									W.frozen=0
									W.doing=0
									W.icon_state=""
									C.clashing=0
									src.TrailDelete()
									break
							if(src.power<=C.power*2)
								sleep(8)
							else
								if(src.power>C.power*2&&src.power<=C.power*5)
									sleep(6)
								else
									if(src.power>C.power*5&&src.power<=C.power*10)
										sleep(4)
									else
										if(src.power>C.power*10)
											sleep(2)
				sleep(1)


//Normal Tech Procs under this
obj
	proc
		TechAttackHoming(mob/O,Z,Power,I,IS,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range=0
			src.name=Z

	//		O.ki-=round(O.ki/100)*O.kiuse
			src.dir=O.dir
			src.loc=O.loc
			while(src)
				if(!O)
					del(src)
					break
				src.range+=1
				src.target=O.target
				var/Found=FALSE
				var/hastarget=0
				for(var/mob/ST in view(8,src))
					if(istype(ST,/mob/NPC))continue
					if(ST.FuseFollower)continue
					if(ST==src.target)
						if(ST.pk&&ST!=O)
							hastarget=1
				for(var/mob/M in view(8,src))
					if(istype(M,/mob/NPC))continue
					if(M.FuseFollower)continue
					if(hastarget)
						walk_towards(src,src.target)
						Found=TRUE
					else
						if(M==O)continue
						if(M.pk)
							if(O.in_guild&&!O.attackguild&&M.guild==O.guild)
								Found=FALSE
							else
								if(O.in_party&&!O.attackparty&&M.party_name==O.party_name)
									Found=FALSE
								else
									walk_towards(src,M)
									Found=TRUE
					break
				if(Found!=TRUE)
					step(src,src.dir)
				var/turf/T=src.loc
				if(!T.density&&src.power>=500000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					if(M!=O||M==O&&src.range>=10)
						spawn(1)
							src.TrailDelete()
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							if(M.kiabsorb)
								var/absorbpower=round(((src.power/1.2)*(M.ki_res))+(M.kidefense))
								var/absorbdamage=round(((O.ki_power*rand(1.0,1.5))-absorbpower)+src.power)
								if(absorbpower>=src.power)
									M.ki+=src.power
								else

									var/mindmg = round(M.powerlevel_max*0.02)
									if(O.spar && M.spar)
										absorbdamage = mindmg

									M.powerlevel-=absorbdamage
									src.power-=absorbdamage
									M.ki_res_exp += 5+round(M.level/300)
									M.Ki_Res_Level()
									O.ki_pow_exp += 5+round(O.level/200)
									O.Ki_Power_Level()
									if(M.attacktext)
										M << "<font color = red>[O]'s [src.name] hits you with [absorbdamage] damage!"
									if(O.attacktext)
										O << "<font color = red>Your [src.name] hits [M] with[absorbdamage] damage!"
									if(O.lethalon)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
							else
								if(M.Dodge_Attack(src.owner)==TRUE)
									flick("IT",M)
									switch(src.dir)
										if(WEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x,M.y-2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(EAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x,M.y-2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(NORTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x-2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(SOUTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x-2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(NORTHWEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x,M.y-2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(NORTHEAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x,M.y-2,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(SOUTHEAST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x-2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
										if(SOUTHWEST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
											else
												M.loc=locate(M.x-2,M.y,M.z)
												M.dodge_exp += 5+round(M.level/2000)
												M.Dodge_Level()
								else
									var/damage=round(((src.power*(rand(1.0,1.5)))-(((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120))))
									damage = round(damage)

								//	var/damage=round((((O.ki*O.ki_power)/1000)-((M.kidefense*M.ki_res)/1250))+src.power)
						//			if(prob(O.ki_cast)

									if(Effect=="Critical")
										if(prob(40))
											damage=round((((src.power*rand(2,3))*(rand(1.0,1.5)))-(((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120))))
									//		damage=(src.power*rand(2,3))-round((M.kidefense*M.ki_res)/1250)
									if(Z=="Kienzan Disk")
										if(prob(5))
											M.has_tail=0
											M.overlays-='Tail.dmi'
											M.tail_grow_delay=30
											M.Tail_Grow()
									if(damage<src.power)
										damage=src.power

									var/mindmg = round(M.powerlevel_max*0.03)
									if(O.spar && M.spar)
										damage = mindmg



									M.powerlevel-=damage
									src.power-=damage
									M.ki_res_exp += 5+round(M.level/1500)
									M.Ki_Res_Level()
									O.ki_pow_exp += 5+round(O.level/1000)
									O.Ki_Power_Level()
									if(M.attacktext)
										M << "<font color = red>[src.owner]'s [src.name] hits you with [damage] damage!"
									if(O.attacktext)
										O << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
									if(O.lethalon)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
						//			else
						//				return
							if(src.power>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							for(var/obj/Buildings/DE in oview(drange,src))
								DE.hp-=src.power/(1+get_dist(src,DE))
								spawn(0)DE.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							if(src.power<=0)
								src.TrailDelete()
								break
						else
							src.TrailDelete()
							break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
			/*		if(src.power>=100000000)
						drange=2
					if(src.power>=5000000000)
						drange=3
					if(src.power>=30000000000)
						drange=4
					if(src.power>=100000000000)
						drange=5
					if(src.power>=5000000000000)
						drange=6
					if(src.power>=10000000000000)
						drange=7
					if(src.power>=500000000000000)
						drange=8*/
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					src.TrailDelete()
					break
				sleep(1)

		TechAttackStraight(mob/O,Z,Power,I,IS,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range=0
			src.name=Z
	//		var/randspd = rand(0,1)
	//		world << "[randspd]"
	//		walk(src,O.dir,randspd)
	//		O.ki-=round(O.ki/100)*O.kiuse

			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)

/*
			while(src)
				if(!src.owner||src.owner==null||!O)
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T.density&&src.power>500000000)
					if(istype(T,/turf/Earth/Island_Edge_005))
						var/obj/techs/Overlays/CraterTrail/TTrail=new
						TTrail.dir=src.dir
						TTrail.loc=T
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					OW.doing=0
					OW.frozen=0
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
						damage = round(damage)
						//var/damage=round(((src.power*(rand(1.0,1.5)))-((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120)))
				//		var/damage=round((((src.power*(OW.ki_power/4))+(OW.ki/100))-(((src.power/2)*(M.ki_res/5))+(M.kidefense/200))))
				//		var/damage=round((((OW.ki*OW.ki_power)/1000)-((M.kidefense*M.ki_res)/1250))+src.power)
						if(Effect=="Critical")
							if(prob(40))
								damage=round((((src.power*rand(2,3))*(rand(1.0,1.5)))-((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120)))
				//				damage=round(((((src.power*rand(2,3))*(OW.ki_power/4))+(OW.ki/100))-(((src.power/2)*(M.ki_res/5))+(M.kidefense/200))))
					//			damage=(src.power*rand(2,3))-round((M.kidefense*M.ki_res)/1250)
						if(Z=="Distructo Disk")
							if(prob(5))
								M.has_tail=0
								M.overlays-='Tail.dmi'
								M.tail_grow_delay=30
								M.Tail_Grow()
						var/apower=src.power
						if(damage<apower)
							damage=apower
						M.powerlevel-=damage
						src.power-=damage
						M.ki_res_exp += 5+round(M.level/1500)
						M.Ki_Res_Level()
						OW.ki_pow_exp += 5+round(OW.level/1000)
						OW.Ki_Power_Level()
						if(M.attacktext)
							M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
						if(OW.attacktext)
							OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
						if(OW.kill)
							M.DeathCheck(OW)
						else
							spawn(0)M.KO()
						if(apower>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
				/*		if(apower>=100000000)
							drange=2
						if(apower>=5000000000)
							drange=3
						if(apower>=30000000000)
							drange=4
						if(apower>=100000000000)
							drange=5
						if(apower>=5000000000000)
							drange=6
						if(apower>=10000000000000)
							drange=7
						if(apower>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE in oview(drange,src))
							DE.hp-=src.power/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						src.ExplodeDamage(M,drange,apower)
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.kiabsorb)
						var/absorbpower=round(((src.power/1.2)*(N.ki_res))+(N.kidefense))
						var/absorbdamage=round(((O.ki_power*rand(1.0,1.5))-absorbpower)+src.power)
						if(absorbpower>=src.power)
							N.ki+=src.power
						else
							N.powerlevel-=absorbdamage
							src.power-=absorbdamage
							N.ki_res_exp += 5+round(N.level/300)
							N.Ki_Res_Level()
							O.ki_pow_exp += 5+round(O.level/200)
							O.Ki_Power_Level()
							if(N.attacktext)
								N << "<font color = red>[O]'s [src.name] hits you with [absorbdamage] damage!"
							if(O.attacktext)
								O << "<font color = red>Your [src.name] hits [N] with[absorbdamage] damage!"
							if(O.kill)
								N.DeathCheck(O)
							else
								spawn(0)N.KO()
						src.TrailDelete()
						break
					else
						if(N.Dodge_Attack(src.owner)==TRUE)
							flick("IT",N)
							switch(src.dir)
								if(WEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(EAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTHWEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(NORTHEAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x,N.y-2,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTHEAST)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
								if(SOUTHWEST)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
									else
										N.loc=locate(N.x-2,N.y,N.z)
										N.dodge_exp += 5+round(N.level/2000)
										N.Dodge_Level()
						else
							if(N.Deflect_Attack(src.owner)==TRUE)
								var/mob/DO=src.owner
								spawn(0)DO.DeleteTrails()
								src.range=0
								src.owner=N
								src.dir=N.dir
						//		N.deflect_exp += 5+round(N.level/1500)
						//		N.Deflect_Level()
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
			/*		if(src.power>=100000000)
						drange=2
					if(src.power>=5000000000)
						drange=3
					if(src.power>=30000000000)
						drange=4
					if(src.power>=100000000000)
						drange=5
					if(src.power>=5000000000000)
						drange=6
					if(src.power>=10000000000000)
						drange=7
					if(src.power>=500000000000000)
						drange=8*/
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					src.TrailDelete()
					break
			//	step(src,src.dir)
			//	step(src,src.dir,1)
				walk(src,src.dir,0,0)
				sleep(1)
				*/

		TechAttackBeam(mob/O,Z,Power,I,IS,IST,Effect)
			src.owner=O
			src.power=Power
			if(I!=0)
				src.icon=I
			if(IS!=0)
				src.icon_state=IS
			src.range=0
			src.name=Z
	//		O.ki-=round(O.ki/100)*O.kiuse
			O.overlays+=icon('Techs.dmi',"[IS]ki")
			src.clashable=1
			O.beaming=1
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)

			while(src)
				if(!src.owner||src.owner==null||!O)
					for(var/obj/Tech/BeamH/BC in get_step(src,src.dir))
						BC.clashing=0
					for(var/obj/Tech/BR in world)
						if(BR.owner==src.owner)
							del(BR)
					del(src)
					break
				if(!src.clashing)
					src.range+=1
					var/turf/T=src.loc
					if(!T.density&&src.power>500000000)
						if(istype(T,/turf/Earth/Island_Edge_005))
							var/obj/techs/Overlays/CraterTrail/TTrail=new
							TTrail.dir=src.dir
							TTrail.loc=T
					for(var/mob/M in T)
						if(M.FuseFollower)continue
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							var/mob/OW=src.owner
							if(Effect=="Candy")
								var/damage = (O.powerlevel+(src.power*rand(0.8,1.0))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
								damage = round(damage)
								//var/damage=round(((src.power*(rand(1.0,1.5)))-(((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120))))
						//		var/damage=round(((usr.ki*usr.ki_power)/1000)-((M.kidefense*M.ki_res)/1250))+src.power
								if(damage<src.power)
									damage=src.power
								M.powerlevel-=damage
								src.power-=damage
								M.ki_res_exp += 5+round(M.level/1500)
								M.Ki_Res_Level()
								OW.ki_pow_exp += 5+round(OW.level/1000)
								OW.Ki_Power_Level()
								if(M.attacktext)
									M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
								if(OW.attacktext)
									OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
								if(M.powerlevel<=0)
									if(M.race == "Android")
										M.icon_state = ""
										M.doing = 0
										M.frozen = 0
										M.powerlevel = 0
										if(OW.lethalon)
											M.DeathCheck(OW)
										else
											spawn(0)M.KO()
									else
										var/obj/Equipment/Consumable/Candy/C = new
										C.loc = src.loc
										C.name = "[M.name]'s Candy"
										if(istype(M,/mob/PC))
											C.candy_pl = round(M.powerlevel_max/500)
										C.icon = 'Candy.dmi'
										M.icon_state = ""
										C.loc = M.loc
										M.powerlevel_max -= round(M.powerlevel_max/500)
										M.powerlevel = 0
										M.DeathCheck(OW,"Candy")
								if(src.power<=0)
									OW.frozen=0
									OW.doing=0
									OW.icon_state=""
									src.TrailDelete()
									break
							else
								var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
								damage = round(damage)
								//var/damage=round(((src.power*(rand(1.0,1.5)))-(((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120))))
						//		var/damage=((O.ki*O.ki_power)/1000)-round((M.kidefense*M.ki_res)/1250)+src.power
								if(Effect=="Critical")
									if(prob(40))
										damage=round((((src.power*rand(1.3,1.7))*(rand(1.0,1.5)))-(((src.power*0.8)*(M.ki_res/4))+(M.kidefense/120))))
								//		damage=((((usr.ki*usr.ki_power)/1000)+src.power)*rand(1.3,1.7))-round(((M.kidefense*M.ki_res)/1250))+(src.power*2)
								var/apower=src.power
								if(damage<apower)
									damage=apower
								M.powerlevel-=damage
								src.power-=damage
								M.ki_res_exp += 5+round(M.level/1500)
								M.Ki_Res_Level()
								OW.ki_pow_exp += 5+round(OW.level/1000)
								OW.Ki_Power_Level()
								if(M.attacktext)
									M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
								if(OW.attacktext)
									OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
								if(OW.lethalon)
									M.DeathCheck(OW)
								else
									spawn(0)M.KO()
								if(apower>=20000000)
									var/obj/techs/Overlays/Crater_Center/C=new
									C.loc=src.loc
								else
									if(src.power>=8000000)
										var/obj/techs/Overlays/Crater_Small/C=new
										C.loc=src.loc
								var/drange=1
					/*			if(apower>=100000000)
									drange=2
								if(apower>=5000000000)
									drange=3
								if(apower>=30000000000)
									drange=4
								if(apower>=100000000000)
									drange=5
								if(apower>=5000000000000)
									drange=6
								if(apower>=10000000000000)
									drange=7
								if(apower>=500000000000000)
									drange=8*/
								for(var/obj/Buildings/DE in oview(drange,src))
									DE.hp-=src.power/(1+get_dist(src,DE))
									spawn(0)DE.DestroyIt()
								src.ExplodeDamage(M,drange,apower)
								if(src.power<=0)
									OW.frozen=0
									OW.doing=0
									OW.icon_state=""
									src.TrailDelete()
									break
						else
							var/mob/OW=src.owner
							OW.frozen=0
							OW.doing=0
							OW.icon_state=""
							src.TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=src.owner
						if(!DEO.see_invisible)
							if(istype(DE,/obj/Buildings)&&DE.invisibility)
								continue
						DE.hp-=src.power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=src.power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							DEO.frozen=0
							DEO.doing=0
							DEO.icon_state=""
							src.TrailDelete()
							break
					for(var/mob/N as mob in get_step(src,src.dir))
						if(N.kiabsorb)
							var/mob/OW=src.owner
							var/absorbpower=round(((src.power/1.2)*(N.ki_res))+(N.kidefense))
							var/absorbdamage=round(((O.ki_power*rand(1.0,1.5))-absorbpower)+src.power)
							if(absorbpower>=src.power)
								N.ki+=src.power
							else
								N.powerlevel-=absorbdamage
								src.power-=absorbdamage
								N.ki_res_exp += 5+round(N.level/300)
								N.Ki_Res_Level()
								OW.ki_pow_exp += 5+round(OW.level/200)
								OW.Ki_Power_Level()
								if(N.attacktext)
									N << "<font color = red>[O]'s [src.name] hits you with [absorbdamage] damage!"
								if(OW.attacktext)
									O << "<font color = red>Your [src.name] hits [N] with[absorbdamage] damage!"
								if(OW.lethalon)
									N.DeathCheck(O)
								else
									spawn(0)N.KO()
							OW.frozen=0
							OW.doing=0
							OW.icon_state=""
							src.TrailDelete()
							break

						else
							if(N.Dodge_Attack(src.owner)==TRUE)
								flick("IT",N)
								switch(src.dir)
									if(WEST)
										if(prob(50))
											N.loc=locate(N.x,N.y+2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x,N.y-2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(EAST)
										if(prob(50))
											N.loc=locate(N.x,N.y+2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x,N.y-2,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(NORTH)
										if(prob(50))
											N.loc=locate(N.x+2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x-2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
									if(SOUTH)
										if(prob(50))
											N.loc=locate(N.x+2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
										else
											N.loc=locate(N.x-2,N.y,N.z)
											N.dodge_exp += 5+round(N.level/2000)
											N.Dodge_Level()
							else
								if(N.Deflect_Attack(src.owner)==TRUE)
									var/mob/DO=src.owner
									DO.DeleteTrails()
									src.range=0
									DO.doing=0
									DO.icon_state=""
									DO.frozen=0
									N.doing=1
									N.frozen=1
									N.reflect_exp += 5+round(N.level/1500)
									N.Reflect_Level()
									flick("attack",N)
									src.owner=N
									src.dir=N.dir
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashable)
							if(!C.clashing)
								if(src.dir==NORTH&&C.dir==SOUTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==SOUTH&&C.dir==NORTH)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==EAST&&C.dir==WEST)
									C.clashing=1
									src.clashing=1
									goto CLASH
								if(src.dir==WEST&&C.dir==EAST)
									C.clashing=1
									src.clashing=1
									goto CLASH
							else
								if(src.dir==C.dir)
									C.power+=src.power
									var/mob/OW=src.owner
									OW.frozen=0
									OW.doing=0
									OW.icon_state=""
									src.TrailDelete()
									break
								else
									C.power-=src.power*0.6
									var/mob/OW=src.owner
									OW.frozen=0
									OW.doing=0
									OW.icon_state=""
									src.TrailDelete()
									break
						else
							if(src.power<C.power)
								var/mob/OW=src.owner
								OW.frozen=0
								OW.doing=0
								OW.icon_state=""
								if(src.power>=20000000)
									var/obj/techs/Overlays/Crater_Center/CR=new
									CR.loc=src.loc
								else
									if(src.power>=8000000)
										var/obj/techs/Overlays/Crater_Small/CR=new
										CR.loc=src.loc
								var/drange=1
					//			var/explosion=src.power+(C.power-src.power)
					/*			if(explosion>=100000000)
									drange=2
								if(explosion>=5000000000)
									drange=3
								if(explosion>=30000000000)
									drange=4
								if(explosion>=100000000000)
									drange=5
								if(explosion>=5000000000000)
									drange=6
								if(explosion>=10000000000000)
									drange=7
								if(explosion>=500000000000000)
									drange=8*/
								C.power-=src.power
								src.ExplodeDamage(0,drange,src.power)
								src.TrailDelete()
								break
					if(src.power<=0)
						var/mob/OW=src.owner
						OW.frozen=0
						OW.doing=0
						OW.icon_state=""
						src.TrailDelete()
						break
					if(src.range>=20)
						var/mob/OW=src.owner
						OW.frozen=0
						OW.doing=0
						OW.icon_state=""
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
					step(src,src.dir)
					var/obj/Tech/BeamT/B=new
					B.loc=T
					B.power=src.power
					B.dir=src.dir
					B.owner=src.owner
					B.icon=I
					B.icon_state=IST
					sleep(1)
					CLASH
				else
					for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
						if(C.clashing)
							var/mob/KS1=src.owner
							var/mob/KS2=C.owner
							KS1.clasharrow=src.dir
							KS2.clasharrow=C.dir
							var/P1=src.power+src.clashrush
							var/P2=C.power+C.clashrush
							if(P1>P2)
								var/Ap=(src.power*0.1)+rand(1,10)
								var/Cp=(C.power*0.1)+rand(1,10)
								switch(src.dir)
									if(NORTH)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										T.dir=src.dir
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										src.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										C.dir=SOUTH
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(SOUTH)
										var/obj/Tech/BeamT/T=new
										T.dir=src.dir
										T.loc=src.loc
										T.icon_state=IST
										T.owner=src.owner
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										sleep(1)
										step(C,NORTH)
										step(src,NORTH)
										src.dir=SOUTH
										sleep(1)
										step(C,SOUTH)
										step(src,SOUTH)
										C.dir=NORTH
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(EAST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										src.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										C.dir=WEST
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
									if(WEST)
										var/obj/Tech/BeamT/T=new
										T.loc=src.loc
										T.dir=src.dir
										T.icon_state=IST
										T.owner=src.owner
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										sleep(1)
										step(C,EAST)
										step(src,EAST)
										src.dir=WEST
										sleep(1)
										step(C,WEST)
										step(src,WEST)
										C.dir=EAST
										for(T in C.loc)
											if(T.owner==C.owner)
												spawn(3)del(T)
										src.power-=Ap
										C.power-=Cp
										C.range-=1
										src.range+=1
								if(C.range<1)
									var/mob/W=C.owner
									W.UnFreeze(20)
									src.clashing=0
									C.TrailDelete()
									break
								if(src.power<=0)
									var/mob/W=src.owner
									W.frozen=0
									W.doing=0
									W.icon_state=""
									C.clashing=0
									src.TrailDelete()
									break
							if(src.power<=C.power*2)
								sleep(8)
							else
								if(src.power>C.power*2&&src.power<=C.power*5)
									sleep(6)
								else
									if(src.power>C.power*5&&src.power<=C.power*10)
										sleep(4)
									else
										if(src.power>C.power*10)
											sleep(2)
				sleep(1)


obj
	proc
		BombShot()
			var/mob/OW=src.owner
			var/oldeye=OW.client.eye
			OW.client.perspective=EYE_PERSPECTIVE
			OW.client.eye=src
			var/maxrange=10
	/*		if(src.power>=30000000)
				maxrange=100
			if(src.power>=75000000)
				maxrange=150
			if(src.power>=100000000)
				maxrange=200
			if(src.power>=130000000)
				maxrange=250
			if(src.power>=180000000)
				maxrange=300*/
			while(src)
				src.range+=1
				step(src,src.dir)
				for(var/mob/M in oview(1,src))
					if(M.safe)continue
					if(M.FuseFollower)continue
					if(M.dead)continue
					if(M!=OW||M==OW&&src.range>=10)
						OW.client.perspective=EDGE_PERSPECTIVE
						OW.client.eye=oldeye
						sleep(1)
						del(src)
						if(M.pk)
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							var/damage=src.power-round(((src.power*0.7)*(M.ki_res/4))+(M.kidefense/120))
							if(damage<src.power)
								damage=src.power

							var/mindmg = round(M.powerlevel_max*0.1)
							if(OW.spar && M.spar)
								damage = mindmg

							M.powerlevel-=damage
							M.ki_res_exp += 5+round(M.level/1500)
							M.Ki_Res_Level()
							OW.ki_pow_exp += 5+round(OW.level/1000)
							OW.Ki_Power_Level()
							if(M.attacktext)
								M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
							if(OW.attacktext)
								OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
							M.DeathCheck(OW)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							for(var/mob/Y in oview(src,drange))
								if(Y!=M)
									if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
										var/damage2=(src.power-round(((src.power*0.7)*(M.ki_res/4))+(M.kidefense/120)))/get_dist(src,Y)

										mindmg = round(Y.powerlevel_max*0.025)
										if(OW.spar && Y.spar)
											damage2 = mindmg

										Y.powerlevel-=damage2

										Y.ki_res_exp += 5+round(Y.level/300)
										Y.Ki_Res_Level()
										if(Y.attacktext)
											Y<<"<font color = red>[OW]'s [src.name]'s explosion damages you with [damage2] damage!"
										Y.DeathCheck(OW)
							for(var/obj/techs/Overlays/B in world)
								if(B.owner==OW)
									del(B)
						else
							OW.doing=0
							OW.frozen=0
							OW.icon_state = ""
							OW.tech_cooldown=0
							for(var/obj/techs/Overlays/B in world)
								if(B.owner==OW)
									del(B)
						break
				if(src.range>=maxrange)
					OW.client.perspective=EDGE_PERSPECTIVE
					OW.client.eye=oldeye
					OW.doing=0
					OW.frozen=0
					OW.icon_state = ""
					OW.tech_cooldown=0
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
			/*		if(src.power>=100000000)
						drange=2
					if(src.power>=5000000000)
						drange=3
					if(src.power>=30000000000)
						drange=4
					if(src.power>=100000000000)
						drange=5
					if(src.power>=5000000000000)
						drange=6
					if(src.power>=10000000000000)
						drange=7
					if(src.power>=500000000000000)
						drange=8*/
					for(var/mob/Y in oview(src,drange))
						if(Y.pk&&!Y.safe&&!Y.FuseFollower&&!Y.dead)
							var/damage=(src.power-round(((src.power*0.7)*(Y.ki_res/4))+(Y.kidefense/120)))/get_dist(src,Y)
							if(damage<1)
								damage=1

							var/mindmg = round(Y.powerlevel_max*0.03)
							if(OW.spar && Y.spar)
								damage = mindmg

							Y.powerlevel-=damage
							Y.ki_res_exp += 5+round(Y.level/1500)
							Y.Ki_Res_Level()
							if(Y.attacktext)
								Y<<"<font color = red>[OW]'s [src.name]'s explosion damages you with [damage] damage!"
							if(OW.lethalon)
								Y.DeathCheck(OW)
							else
								spawn(0)Y.KO()
					del(src)
					for(var/obj/techs/Overlays/B in world)
						if(B.owner==OW)
							del(B)
					break
				sleep(1)

	proc
		ExplodeDamage(mob/M,Range,Damage)
			var/mob/O=src.owner
			if(!O)return
			if(src.exploded)return
			src.exploded=1
			for(var/mob/Y in oview(Range,src))
				if(Y==M)
					if(Y.pk&&!Y.safe&&!Y.dead)
						var/damage=Damage-round(Y.kidefense*Y.ki_res)
						if(damage<1)
							damage=1
						var/mindmg = round(Y.powerlevel_max*0.03)
						if(M.spar && Y.spar)
							damage = mindmg
						Y.powerlevel-=damage
						Y.ki_res_exp += 2+round(Y.level/5000)
						Y.Ki_Res_Level()
						Y<<"<font color = red>[O]'s [src.name]'s explosion damages you with [damage] damage!"
						if(O.lethalon)
							Y.DeathCheck(O)
						else
							spawn(0)Y.KO()

		Scatter(mob/O)
			if(!O)
				del(src)
				return
			src.owner=O
			src.range=0
			while(src)
				if(!src.owner)
					del(src)
					break
				src.target=O.target
				src.range+=1
				var/Found=FALSE
				var/hastarget=0
				for(var/mob/ST in view(12,src))
					if(istype(ST,/mob/NPC))continue
					if(ST.FuseFollower)continue

					if(ST==src.target)
						if(ST.pk&&ST!=O)
							hastarget=1
				for(var/mob/M in view(12,src))
					if(istype(M,/mob/NPC))continue
					if(istype(M,/mob/PC))continue
					if(istype(M,/mob/Monster/ExplosiveMobs))continue
					if(M.FuseFollower)continue
					if(hastarget)
						walk_towards(src,src.target)
						Found=TRUE
					if(!hastarget)
						if(M==O)continue
						if(istype(M,/mob/PC))
							if(O.in_guild&&!O.attackguild&&M.guild==O.guild)
								Found=FALSE
							else
								if(O.in_party&&!O.attackparty&&M.party_name==O.party_name)
									Found=FALSE
								else
									walk_towards(src,M)
									Found=TRUE
						else
							walk_towards(src,M)
							Found=TRUE
					break
				if(Found!=TRUE)
					step(src,src.dir)
				var/turf/T=src.loc
				if(!T.density&&src.power>=50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					if(M!=O||M==O&&src.range>=15)
						spawn(1)del(src)
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							if(M.kiabsorb)
								var/absorbpower=round(((src.power/1.2)*(M.ki_res))+(M.kidefense))
								var/absorbdamage=round(((O.ki_power*rand(1.0,1.5))-absorbpower)+src.power)
								if(absorbpower>=src.power)
									M.ki+=src.power
								else
									M.powerlevel-=absorbdamage
									src.power-=absorbdamage
									M.ki_res_exp += 5+round(M.level/300)
									M.Ki_Res_Level()
									O.ki_pow_exp += 5+round(O.level/200)
									O.Ki_Power_Level()
									if(M.attacktext)
										M << "<font color = red>[O]'s [src.name] hits you with [absorbdamage] damage!"
									if(O.attacktext)
										O << "<font color = red>Your [src.name] hits [M] with[absorbdamage] damage!"
									if(O.lethalon)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
							else
								if(M.Dodge_Attack(src.owner)==TRUE)
									flick("IT",M)
									switch(src.dir)
										if(WEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(EAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(NORTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTH)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(NORTHWEST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(NORTHEAST)
											if(prob(50))
												M.loc=locate(M.x,M.y+2,M.z)
											else
												M.loc=locate(M.x,M.y-2,M.z)
										if(SOUTHEAST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
										if(SOUTHWEST)
											if(prob(50))
												M.loc=locate(M.x+2,M.y,M.z)
											else
												M.loc=locate(M.x-2,M.y,M.z)
								else
									//var/damage=round((src.power-round((M.kidefense*M.ki_res)/125))+(src.power/50))
									var/damage = (O.powerlevel+(src.power*rand(0.6,1.0))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
									damage = round(damage)
									if(damage<src.power)
										damage=src.power
									var/mindmg = round(M.powerlevel_max*0.08)
									if(O.spar && M.spar)
										damage = mindmg

									if(istype(M,/mob/PC))
										damage = round(damage/5000)
									M.powerlevel-=damage
									M.ki_res_exp += 5+round(M.level/1500)
									M.Ki_Res_Level()
									O.ki_pow_exp += 5+round(O.level/1000)
									O.Ki_Power_Level()
									if(M.attacktext)
										M << "<font color = red>[O]'s [src.name] hits you with [damage] damage!"
									if(O.attacktext)
										O << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
									if(O.lethalon)
										M.DeathCheck(O)
									else
										spawn(0)M.KO()
							if(src.power>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE in oview(drange,src))
							DE.hp-=src.power/(1+get_dist(src,DE))
							spawn(0)DE.DestroyIt()
						src.ExplodeDamage(M,drange,src.power)
					break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				if(src.range>=15)
					if(src.power>=20000000)
						var/obj/techs/Overlays/Crater_Center/C=new
						C.loc=src.loc
					else
						if(src.power>=8000000)
							var/obj/techs/Overlays/Crater_Small/C=new
							C.loc=src.loc
					var/drange=1
			/*		if(src.power>=100000000)
						drange=2
					if(src.power>=5000000000)
						drange=3
					if(src.power>=30000000000)
						drange=4
					if(src.power>=100000000000)
						drange=5
					if(src.power>=5000000000000)
						drange=6
					if(src.power>=10000000000000)
						drange=7
					if(src.power>=500000000000000)
						drange=8*/
					for(var/obj/Buildings/DE in oview(drange,src))
						DE.hp-=src.power/(1+get_dist(src,DE))
						spawn(0)DE.DestroyIt()
					src.ExplodeDamage(0,drange,src.power)
					del(src)
					break
				sleep(1)

		BindAttack(Z=0,I=0,IS=0,Power=0,mob/O,Effect=0)
			src.owner=O
	//		O.ki-=O.ki*O.kiuse
			src.power=Power
			src.icon=I
			src.icon_state=IS
			src.range=0
			src.name=Z
			src.dir=O.dir
			src.loc=O.loc
			while(src)
				if(!src.owner)
					del(src)
					break
				src.target=O.target
				src.range+=1
				step(src,src.dir)
				var/turf/T=src.loc
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					spawn(1)
						del(src)
						break
					if(M.pk&&!M.safe&&!M.dead&&!M.binded)
						view(8)<<"\white [O] has binded [M]!"
						M.binded=1
						M.doing+=1
						if(Z=="Imprisonment Ball")
							M.overlays+=icon('Techs.dmi',"imprisonmentball")
						if(Z=="Galactic Donut")
							M.overlays+=icon('Techs.dmi',"galaticdonut")
						if(Z=="Demon Shackle")
							M.overlays+=icon('Techs.dmi',"demonshackle")
						var/damage=(src.power-round((M.kidefense*M.ki_res)/125))
						if(Effect=="Critical")
							if(prob(40))
								damage=(src.power*2-round((M.kidefense*M.ki_res)/125))
						if(damage<=0)
							damage=0
							flick("enrage",M)
							M.overlays-=icon('Techs.dmi',"imprisonmentball")
							M.overlays-=icon('Techs.dmi',"galaticdonut")
							M.overlays-=icon('Techs.dmi',"demonshackle")
							view(8)<<"\white [M] has broken free!"
							M.binded=0
							M.doing-=1
						else
							var/timer=100
							if(damage<M.strength*0.9)
								timer=80
							if(damage<M.strength*0.7)
								timer=60
							if(damage<M.strength*0.5)
								timer=40
							if(damage<M.strength*0.3)
								timer=20
							if(damage<M.strength*0.1)
								timer=10
							if(Z=="Imprisonment Ball")
								spawn(0)M.BindTimer(O,timer,damage/3)
							else
								spawn(0)M.BindTimer(O,timer,0)
				if(src.range>=20)
					del(src)
					break
				sleep(1)

		BangAttack(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
	//		O.ki-=O.ki*O.kiuse
			src.dir=O.dir
			src.loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(src)
					if(!src.owner)
						src.TrailDelete()
						del(src)
						break
					src.range+=1
					var/turf/T=src.loc
					if(!T.density)
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
					for(var/mob/M in T)
						if(M.FuseFollower)continue
						var/mob/OW=src.owner
						if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
							var/damage = (O.powerlevel+(src.power*rand(0.8,1.2))) - (M.powerlevel+(M.kidefense*M.ki_res/100))
							damage = round(damage)
							//var/damage=round(src.power-((M.kidefense*M.ki_res)/125)+(src.power/50))
							var/apower=round(src.power/4)
							if(damage<apower)
								damage=apower

							var/mindmg = round(M.powerlevel_max*0.1)
							if(O.spar && M.spar)
								damage = mindmg

							src.power-=M.powerlevel
							M.powerlevel-=damage
							M.ki_res_exp += 5+round(M.level/1500)
							M.Ki_Res_Level()
							OW.ki_pow_exp += 5+round(OW.level/1000)
							OW.Ki_Power_Level()
							if(M.attacktext)
								M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
							if(OW.attacktext)
								OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
							if(OW.lethalon)
								M.DeathCheck(OW)
							else
								spawn(0)M.KO()
							if(apower>=20000000)
								var/obj/techs/Overlays/Crater_Center/C=new
								C.loc=src.loc
							else
								if(src.power>=8000000)
									var/obj/techs/Overlays/Crater_Small/C=new
									C.loc=src.loc
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							src.ExplodeDamage(M,drange,apower)
							if(src.power<=0)
								src.TrailDelete()
								break
						else
							src.TrailDelete()
							break
					for(var/obj/Buildings/DE in T)
						var/mob/DEO=src.owner
						if(!DEO.see_invisible)
							if(istype(DE,/obj/Buildings)&&DE.invisibility)
								continue
						DE.hp-=src.power
						if(DE.DestroyIt()==TRUE)
							var/drange=1
					/*		if(src.power>=100000000)
								drange=2
							if(src.power>=5000000000)
								drange=3
							if(src.power>=30000000000)
								drange=4
							if(src.power>=100000000000)
								drange=5
							if(src.power>=5000000000000)
								drange=6
							if(src.power>=10000000000000)
								drange=7
							if(src.power>=500000000000000)
								drange=8*/
							for(var/obj/Buildings/DE2 in oview(drange,DE))
								DE2.hp-=src.power/(1+get_dist(src,DE2))
								spawn(0)DE2.DestroyIt()
							src.ExplodeDamage(0,drange,src.power)
							DEO.frozen=0
							DEO.doing=0
							DEO.icon_state=""
							src.TrailDelete()
							break
					if(src.power<=0)
						src.TrailDelete()
						break
					if(src.range>=20)
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
			/*			if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,src))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
					step(src,src.dir)
					sleep(1)

		BangAttack2(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
			src.dir=O.dir
			src.loc=O.loc
			switch(O.dir)
				if(NORTHWEST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHWEST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(NORTHEAST)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTHEAST)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
				if(WEST)
					src.dir = WEST
					src.loc=locate(O.x-1,O.y,O.z)
				if(EAST)
					src.dir = EAST
					src.loc=locate(O.x+1,O.y,O.z)
				if(NORTH)
					src.dir = NORTH
					src.loc=locate(O.x,O.y+1,O.z)
				if(SOUTH)
					src.dir = SOUTH
					src.loc=locate(O.x,O.y-1,O.z)
			while(src)
				if(!src.owner)
					src.TrailDelete()
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T)return
				if(!T.density)
					T.overlays+='Dirt.dmi'
					T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead)
						//var/damage=round((src.power-((M.kidefense*M.ki_res)/125))+(src.power/50))
						var/damage = (src.power*rand(0.8,1.2)) - (M.powerlevel+(M.kidefense*M.ki_res/100))
						damage = round(damage)
						var/apower=round(src.power/4)
						if(damage<apower)
							damage=apower

						var/mindmg = round(M.powerlevel_max*0.1)
						if(O.spar && M.spar)
							damage = mindmg

						src.power-=M.powerlevel
						M.powerlevel-=damage
						M.ki_res_exp += 5+round(M.level/1500)
						M.Ki_Res_Level()
						OW.ki_pow_exp += 5+round(OW.level/1000)
						OW.Ki_Power_Level()
						if(M.attacktext)
							M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
						if(OW.attacktext)
							OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
						if(OW.lethalon)
							M.DeathCheck(OW)
						else
							spawn(0)M.KO()
						if(apower>=20000000)
							var/obj/techs/Overlays/Crater_Center/C=new
							C.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/C=new
								C.loc=src.loc
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						src.ExplodeDamage(M,drange,apower)
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
			/*			if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.kiabsorb)
						var/mob/OW=src.owner
						var/absorbpower=round((N.kidefense*N.ki_res)/125)
						var/absorbdamage=round((src.power-absorbpower)+(src.power/50))
						if(absorbpower>=src.power)
							N.ki+=src.power
							if(N.ki>N.ki_max*2)
								N<<"Your body can't handle anymore ki!"
								N.powerlevel=0
								N.DeathCheck(O)
						else
							N.powerlevel-=absorbdamage
							N.ki_res_exp += 5+round(N.level/1500)
							N.Ki_Res_Level()
							OW.ki_pow_exp += 5+round(OW.level/1000)
							OW.Ki_Power_Level()
							if(N.attacktext)
								N << "<font color = red>[OW]'s [src.name] hits you with [absorbdamage] damage!"
							if(OW.attacktext)
								OW << "<font color = red>Your [src.name] hits [N] with [absorbdamage] damage!"
							if(OW.lethalon)
								N.DeathCheck(OW)
							else
								spawn(0)N.KO()
						src.TrailDelete()
						break
					else
						if(N.Dodge_Attack(src.owner)==TRUE)
							flick("IT",N)
							switch(src.dir)
								if(WEST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
									else
										N.loc=locate(N.x,N.y-2,N.z)
								if(EAST)
									if(prob(50))
										N.loc=locate(N.x,N.y+2,N.z)
									else
										N.loc=locate(N.x,N.y-2,N.z)
								if(NORTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
									else
										N.loc=locate(N.x-2,N.y,N.z)
								if(SOUTH)
									if(prob(50))
										N.loc=locate(N.x+2,N.y,N.z)
									else
										N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
					if(src.power<C.power)
						if(src.power>=20000000)
							var/obj/techs/Overlays/Crater_Center/CR=new
							CR.loc=src.loc
						else
							if(src.power>=8000000)
								var/obj/techs/Overlays/Crater_Small/CR=new
								CR.loc=src.loc
						var/drange=1
				//		var/explosion=src.power+(C.power-src.power)
				/*		if(explosion>=100000000)
							drange=2
						if(explosion>=5000000000)
							drange=3
						if(explosion>=30000000000)
							drange=4
						if(explosion>=100000000000)
							drange=5
						if(explosion>=5000000000000)
							drange=6
						if(explosion>=10000000000000)
							drange=7
						if(explosion>=500000000000000)
							drange=8*/
						C.power-=src.power
						src.ExplodeDamage(0,drange,src.power)
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)

		SwordAttack(Z=0,Power=0,mob/O)
			src.clashable=0
			src.owner=O
			src.power=Power
			src.range=0
			src.name=Z
	//		O.ki-=O.ki*O.kiuse
			src.dir=O.dir
			while(src)
				if(!src.owner)
					src.TrailDelete()
					del(src)
					break
				src.range+=1
				var/turf/T=src.loc
				if(!T)return
				if(!T.density&&src.power>50000000)
					if(istype(src,/turf/Earth/Island_Edge_005))
						T.overlays+='Dirt.dmi'
						T.RemoveDirt(100)
				for(var/mob/M in T)
					if(M.FuseFollower)continue
					var/mob/OW=src.owner
					if(M.pk&&!M.safe&&!M.FuseFollower&&!M.dead&&!M.isgravmachine)
						var/damage=src.power-round((M.kidefense*M.weapon_resistance)/125)
						if(damage<1)
							damage=1
						src.power-=M.powerlevel
						M.powerlevel-=damage
						M.weapon_res_exp += 5+round(M.level/1500)
						M.Weapon_Res_Level()
						if(M.attacktext)
							M << "<font color = red>[OW]'s [src.name] hits you with [damage] damage!"
						if(OW.attacktext)
							OW << "<font color = red>Your [src.name] hits [M] with [damage] damage!"
						if(OW.lethalon)
							M.DeathCheck(OW)
						else
							spawn(0)M.KO()
						if(src.power<=0)
							src.TrailDelete()
							break
					else
						src.TrailDelete()
						break
				for(var/obj/Buildings/DE in T)
					var/mob/DEO=src.owner
					if(!DEO.see_invisible)
						if(istype(DE,/obj/Buildings)&&DE.invisibility)
							continue
					DE.hp-=src.power
					if(DE.DestroyIt()==TRUE)
						var/drange=1
				/*		if(src.power>=100000000)
							drange=2
						if(src.power>=5000000000)
							drange=3
						if(src.power>=30000000000)
							drange=4
						if(src.power>=100000000000)
							drange=5
						if(src.power>=5000000000000)
							drange=6
						if(src.power>=10000000000000)
							drange=7
						if(src.power>=500000000000000)
							drange=8*/
						for(var/obj/Buildings/DE2 in oview(drange,DE))
							DE2.hp-=src.power/(1+get_dist(src,DE2))
							spawn(0)DE2.DestroyIt()
						src.ExplodeDamage(0,drange,src.power)
						DEO.frozen=0
						DEO.doing=0
						DEO.icon_state=""
						src.TrailDelete()
						break
				for(var/mob/N as mob in get_step(src,src.dir))
					if(N.Dodge_Attack(src.owner)==TRUE)
						flick("IT",N)
						switch(src.dir)
							if(WEST)
								if(prob(50))
									N.loc=locate(N.x,N.y+2,N.z)
								else
									N.loc=locate(N.x,N.y-2,N.z)
							if(EAST)
								if(prob(50))
									N.loc=locate(N.x,N.y+2,N.z)
								else
									N.loc=locate(N.x,N.y-2,N.z)
							if(NORTH)
								if(prob(50))
									N.loc=locate(N.x+2,N.y,N.z)
								else
									N.loc=locate(N.x-2,N.y,N.z)
							if(SOUTH)
								if(prob(50))
									N.loc=locate(N.x+2,N.y,N.z)
								else
									N.loc=locate(N.x-2,N.y,N.z)
				for(var/obj/Tech/BeamH/C in get_step(src,src.dir))
					if(src.power<C.power)
						C.power-=src.power
						src.TrailDelete()
						break
				if(src.power<=0)
					src.TrailDelete()
					break
				if(src.range>=20)
					src.TrailDelete()
					break
				step(src,src.dir)
				sleep(1)

obj
	proc
		UpdateBombTrails()
			for(var/obj/Tech/BeamH/BangTL/TL in world)
				if(TL.owner==src.owner)
					TL.loc=locate(src.x-1,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangT/T in world)
				if(T.owner==src.owner)
					T.loc=locate(src.x,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangTR/TR in world)
				if(TR.owner==src.owner)
					TR.loc=locate(src.x+1,src.y+1,src.z)
			for(var/obj/Tech/BeamH/BangL/L in world)
				if(L.owner==src.owner)
					L.loc=locate(src.x-1,src.y,src.z)
			for(var/obj/Tech/BeamH/BangR/R in world)
				if(R.owner==src.owner)
					R.loc=locate(src.x+1,src.y,src.z)
			for(var/obj/Tech/BeamH/BangBL/BL in world)
				if(BL.owner==src.owner)
					BL.loc=locate(src.x-1,src.y-1,src.z)
			for(var/obj/Tech/BeamH/BangB/B in world)
				if(B.owner==src.owner)
					B.loc=locate(src.x,src.y-1,src.z)
			for(var/obj/Tech/BeamH/BangBR/BR in world)
				if(BR.owner==src.owner)
					BR.loc=locate(src.x+1,src.y-1,src.z)
			spawn(1)src.UpdateBombTrails()
		TrailDelete()
			var/mob/M=src.owner
			if(!src)return
			spawn(0)M.TrailDelete2()
			spawn(0)
				for(var/obj/Tech/BeamT/T1 in world)
					if(T1.owner==src.owner)
						del(T1)
				for(var/obj/Tech/T2 in world)
					if(T2.owner==src.owner)
						del(T2)
				for(var/obj/Tech/T3 in world)
					if(T3.owner==src.owner)
						del(T3)
				del(src)

mob
	proc
		UnFreeze(T)
			sleep(T)
			src.beaming=0
			src.frozen=0
			src.doing=0
			src.icon_state=""
		DeleteTrails()
			sleep(0)
			src.overlays-=icon('Techs.dmi',"kamehamehaki")
			src.overlays-=icon('Techs.dmi',"kamehameha10ki")
			src.overlays-=icon('Techs.dmi',"finishbusterki")
			src.overlays-=icon('Techs.dmi',"galickgunki")
			src.overlays-=icon('Techs.dmi',"finalflashki")
			src.overlays-=icon('Techs.dmi',"finalshineki")
			src.overlays-=icon('Techs.dmi',"masenkoki")
			src.overlays-=icon('Techs.dmi',"hellblazeki")
			src.overlays-=icon('Techs.dmi',"tribeamki")
			src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
			src.overlays-=icon('Techs.dmi',"fakemoono")
			src.beaming=0
			for(var/obj/Tech/BeamT/BT in world)
				if(BT.owner==src)
					del(BT)
		TrailDelete2()
			sleep(0)
			src.overlays-=icon('Techs.dmi',"kamehamehaki")
			src.overlays-=icon('Techs.dmi',"kamehameha10ki")
			src.overlays-=icon('Techs.dmi',"finishbusterki")
			src.overlays-=icon('Techs.dmi',"galickgunki")
			src.overlays-=icon('Techs.dmi',"finalflashki")
			src.overlays-=icon('Techs.dmi',"finalshineki")
			src.overlays-=icon('Techs.dmi',"masenkoki")
			src.overlays-=icon('Techs.dmi',"hellblazeki")
			src.overlays-=icon('Techs.dmi',"tribeamki")
			src.overlays-=icon('Techs.dmi',"specialbeamcannonki")
			src.overlays-=icon('Techs.dmi',"fakemoono")
			src.beaming=0
			for(var/obj/Tech/T1 in world)
				if(T1.owner==src)
					del(T1)

obj
	Tech
		icon='Techs.dmi'
		BeamH
			layer=49
			New()
				..()
				spawn(700)del(src)
		BeamT
			layer=48
			New()
				..()
				spawn(700)del(src)
		BindTech
			layer=100
			New()
				..()
				spawn(700)del(src)
		BeamC
			layer=40
			New()
				..()
				spawn(700)del(src)
turf
	proc
		RemoveDirt(T)
			spawn(T)src.overlays-='Dirt.dmi'


//turf
//	Enter(atom/movable/A)
//		if(A.density || !istype(A,/obj/blasts)||!istype(A,/obj/blasts/trails/)) return ..()


		/*
				water
			icon_state="water"
			density=0
			Enter(atom/movable/A)
				if(!A.density || istype(A,/obj/blasts)||istype(A,/obj/blasts/trails/)) return ..()
				*/