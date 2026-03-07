mob
	RevengeDeathBall
		verb
			RevengeDeathBall()
				set name = "Revenge Death Ball"
				set category = "Fighting"
				if(usr.nopk==0)
					if(usr.dir==NORTHEAST||usr.dir==NORTHWEST||usr.dir==SOUTHEAST||usr.dir==SOUTHWEST)
						return
					if(usr.kame)
						usr << "<tt>You are currently using a blast"
					if(!usr.kame && usr.move)
						var/amount=skillkiusage[25]

						if(amount >= 2000)
							if(amount > usr.ki)
								usr<<"You dont have that much ki!"
							if(amount <= usr.ki)
								if(usr.kame)
									usr<<"You are already firing a blast"
								else
									usr.kame = 1
									var/temp=usr.icon_state
									usr.icon_state="ki"
									sleep(1)
									view(6) << "<font color = red>[usr]:<font color = white> <tt>Revenge Death Ball!!!"
									usr.ki-= amount
									amount=amount*450
									if(usr.kame&&amount/450 <= 15000)
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										usr.move=0
										var/obj/X
										if(usr.dir==NORTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
										if(usr.dir==EAST)
											X = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
										if(usr.dir==SOUTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
										if(usr.dir==WEST)
											X = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
										X.dir=usr.dir
										X.overlays+=new/obj/RevengeDeath1
										X.kitype=2
										Firestraight(X,'revengedeathsmall.dmi',amount,X.dir,usr,'blank.dmi',12)
										usr.icon_state=temp
									else if(usr.kame&&amount/450 > 15000)
										if(usr.powerlevel>usr.maxpowerlevel)
											amount=amount*(usr.powerlevel/usr.maxpowerlevel)
										usr.move=0
										var/obj/X
										if(usr.dir==NORTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y+1,usr.z))
										if(usr.dir==EAST)
											X = new /obj/dan_projectile(locate(usr.x+1,usr.y,usr.z))
										if(usr.dir==SOUTH)
											X = new /obj/dan_projectile(locate(usr.x,usr.y-1,usr.z))
										if(usr.dir==WEST)
											X = new /obj/dan_projectile(locate(usr.x-1,usr.y,usr.z))
										X.dir=usr.dir
										X.overlays+=new/obj/RevengeDeath2
										X.kitype=2
										Firestraight(X,'revengedeath.dmi',amount,X.dir,usr,'blank.dmi',12)
										usr.icon_state=temp
						else
							usr<<"You must use more than 2000 ki for Revenge Death Ball"
						for(var/obj/U in oview(9))
							if(U.npc==5)
								del(U)
						usr.kame=0
obj
	RevengeDeath1
		name="RevengeDeathBall"
		icon='revengedeathsmall.dmi'
		layer=MOB_LAYER+3
	rdtop
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="top"
		pixel_y=32
	rdbottom
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="bottom"
		pixel_y=-32
	rdright
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="right"
		pixel_x=32
	rdleft
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="left"
		pixel_x=-32
	rdupperleft
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="upperleft"
		pixel_y=32
		pixel_x=-32
	rdupperright
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="upperright"
		pixel_y=32
		pixel_x=32
	rdlowerleft
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="lowerleft"
		pixel_y=-32
		pixel_x=-32
	rdlowerright
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="lowerright"
		pixel_y=-32
		pixel_x=32
	RevengeDeath2
		name="RevengeDeathBall"
		icon='revengedeath.dmi'
		icon_state="middle"
		layer=MOB_LAYER+3
		New()
			..()
			overlays+=new/obj/rdtop
			overlays+=new/obj/rdbottom
			overlays+=new/obj/rdleft
			overlays+=new/obj/rdright
			overlays+=new/obj/rdupperleft
			overlays+=new/obj/rdupperright
			overlays+=new/obj/rdlowerright
			overlays+=new/obj/rdlowerleft