mob
	proc
		Gravity(var/mob/PC/M)
			if(M in oview(src))
				spawn(200)
					M.grav=M.level/10
					if(M.grav>5000)M.grav=5000
					for(M in oview(src))
						var/Pl_Loss = M.grav * (rand(50000,100000))
						M << "You feel Gravity pull down on you."
						if(!M.dead)
							M.powerlevel -= Pl_Loss
							M.GRAVITYDeath()
							sleep(1)
					var/grav_check=0
					for(M in oview(src))
						if(M.staminaleft < M.staminaleft_max)
							M.staminaleft_exp += rand(1,5)
							//M.Fatigue_Level_Up()
							M.exp += (((M.weightankle+M.weightarm+M.weightleg+M.weightwrist+M.weightarmor+M.weightcape+M.weightgi+M.weighthead)+(M.z_sword||M.demon_blade))*((M.grav/100)+1))
							if(M.expbuff)M.exp *= 2
							if(!M.staminabuff)M.staminaleft += 1+((M.grav/100)*0.8)
							M.Level_Up()
						M.GRAVITYDeath()
						if(grav_check)return
						spawn(20)grav_check=0
						grav_check = 1
						spawn(100)src.Gravity(M)
						return
			else
				return


mob/Gravity_Room_Gen_II
//	icon = ''
	powerlevel = 1000000000000000000000
	density = 0
	safe = 1
	frozen = 1

