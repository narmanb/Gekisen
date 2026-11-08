obj
	cellabsorb
		verb
			CellAbsorb(mob/characters/M in view(1))
				set name = "Cell Absorb"
				set category = "Fighting"
				if(absorb == 1)
					usr<<"You are already proccessing your absorbtion"
				else
					if(M.key)
						if(M.ko == 1)
							if(M.name == usr.name)
								usr<<"You cannot absorb yourself"
							else
								if(((usr.strength +usr.speed + usr.defense)/3) >= ((M.strength +M.speed + M.defense)/3) )
									world<<"Watch out, [usr] is absorbing [M] into his being!"
									if(usr.state == "Form Two" || usr.state == "Normal")
										usr.icon_state = "sparblock"
										sleep(6)
										usr.icon_state = ""
									usr.maxhealth += M.maxhealth / 3
									usr.maxhealth = round(usr.maxhealth)
									usr.maxpowerlevel += M.maxpowerlevel / 3
									usr.maxpowerlevel = round(usr.maxpowerlevel)
									usr.level += M.level / 3
									usr.level = round(usr.level)
									usr.strength += M.strength / 3
									usr.strength = round(usr.strength)
									usr.defense += M.defense / 3
									usr.defense = round(usr.defense)
									usr.speed += M.speed / 3
									usr.speed = round(usr.speed)
									M.health = 0
									M.Die()
								else
									usr<<"You cannot absorb anyone stronger than you"
						else
							usr<<"You can not absorb someone that isn't knocked out"
					else
						usr<<"You cannot absorb monsters, they are not worthy."
obj
	kiabsorb
		icon = 'skills.dmi'
		icon_state = "kiabsorb"
		layer = MOB_LAYER+99999999999999999999999999999999999999999999999999999999999999999
obj
	AndroidTransform
		verb
			AndroidTransform()
				set category="Fighting"
				set name ="Super Android Transform"
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Super","Revert","None"))
					if("Super")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 300000 && usr.chips>=10)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
							//	usr.oicon=usr.icon
								usr.icon = 'USupersayajin.dmi'
								var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
								usr.icon += rgb((red),0,0)
								var/blue = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
								usr.icon += rgb(0,(blue),0)
								var/green = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
								usr.icon += rgb(0,0,(green))
								usr.powerlevel = usr.maxpowerlevel * 3
								usr.state = "Super Android"
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."


					if("Revert")
						if(usr.state == "Normal")
							usr << "You are reverted already."
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							usr.icon = usr.oicon

							usr.state = "Normal"
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel

obj
	Vegeta
		icon = 'Vegeta.dmi'
		density = 1
turf
	stairs2
		icon = 'tiles.dmi'
		icon_state = "stairs1"
		density = 0

obj
	transform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Form Four","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(((usr.strength +usr.speed + usr.defense)/3) >= 30)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form2",usr)
								usr.icon = 'ChangeForm2.dmi'
								usr.strength += 25
								usr.defense += 20
								usr.state = "Form Two"
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")
							if(((usr.strength +usr.speed + usr.defense)/3) >= 70)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form3",usr)
								usr.icon = 'ChangeForm3.dmi'
								usr.strength += 25
								usr.defense += 15
								usr.speed += 10
								usr.state = "Form Three"
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."

					if("Form Four")
						if(usr.state == "Form Three")
							if(((usr.strength +usr.speed + usr.defense)/3) >= 100)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form4",usr)
								usr.icon = 'ChangeForm4.dmi'
								usr.strength += 20
								usr.defense += 15
								usr.speed += 30
								usr.state = "Form Four"
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form Three."
					if("Revert")
						if(usr.state == "Normal")
							usr << "You are reverted already."
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'changling.dmi'
							if(usr.state == "Form Two")
								usr.strength -= 25
								usr.defense -= 20
							if(usr.state == "Form Three")
								usr.strength -= 50
								usr.defense -= 35
								usr.speed -= 10
							if(usr.state == "Form Four")
								usr.strength -= 70
								usr.defense -= 50
								usr.speed -= 40
							usr.state = "Normal"
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
obj
	celltransform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("trans",usr)
								usr.icon = 'Cell1.dmi'
								usr.strength += 20
								usr.defense += 15
								usr.state = "Form Two"

							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")
							if(((usr.strength +usr.speed + usr.defense)/3) >= 75)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("trans",usr)
								usr.icon = 'Cell2.dmi'
								usr.strength += 30
								usr.defense += 20
								usr.speed += 30
								usr.state = "Form Three"
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."

					if("Revert")
						if(usr.icon == "Cell.dmi")
							usr << "You are reverted already."
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'Cell.dmi'
							if(usr.state == "Form Two")
								usr.strength -= 20
								usr.defense -= 15
							if(usr.state == "Form Three")
								usr.strength -= 50
								usr.defense -= 35
								usr.speed -= 30
							usr.state = "Normal"
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel


obj
	enrage
		verb
			Enrage()
				set category = "Fighting"
				if(usr.entime == 1)
					usr << "You are still too angry..."
				else
					if(usr.ssj == null||usr.ssj == 0 && usr.kaioken == 0||usr.kaioken == null)
						usr << "<font face = Arial><font size = 2><font color = silver>You begin to get enraged....remembering all the hateful things in your past......"
						usr.powerlevel += 1
						usr.entime = 1
						usr.icon_state = "ssj"
						usr.powerlevel += (rand(1,(usr.maxpowerlevel)))
						usr.FormTwo()
						usr.SSJ()
						usr.SNJ()
						sleep(40)
						usr.icon_state = ""
						sleep(rand(1,100))
						usr.entime = 0
						usr << "You begin to calm..."
						usr.powerlevel=usr.maxpowerlevel
					else
						usr << "You are strained (using Super Saiyan or Kaioken?)."
obj
	SayajinTail
		verb
			WrapTail()
				set name="Wrap Tail"
				set category="Inventory"
				usr <<"You wrap your tail"
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
			Unwrap()
				set category="Inventory"
				usr <<"You unwrap your tail"
				usr.overlays+='tail.dmi'
obj/techs
	Tayioken
		verb
			Tayioken()
				set category = "Fighting"
				if(usr.tayio == 1)
					usr << "You need to wait..."
				if(usr.tayio == null||usr.tayio == 0)
					view(6) << "<b><font color = red>TAYIOKEN!!!"
					usr.tayio = 1
					for(var/mob/characters/M in oview(6))
						M << "<font color = green>You are blinded by [usr]'s Tayioken!"
						M:sight = 1
					sleep(rand(1,5))
					for(var/mob/M in world)
						M:sight = 0
					usr.tayio = 0
obj
	Absorb
		verb
			Absorb()
				set category = "Fighting"
				for(var/mob/characters/M in oview(1))
					if(usr.absorb == 1)
						usr << "You need to wait..."
					if(usr.absorb == null||usr.absorb == 0 && M.npc==0)
						if(usr.state == "Form Three")
							usr <<"You cant absorb in that stage"
						else
							view(6) << "<font color = green>[usr.name] is stealing energy"
							usr.absorb = 1
							M << "<font color = green>[usr.name] is stealing your powerlevel!!!"
							absorba=usr.maxpowerlevel/rand(50,100)
							M.powerlevel-=absorba
							usr.powerlevel+=absorba
							usr.contents += new /obj/celltransform
							sleep(rand(50,200))
							usr.absorb = 0



obj
	user
		icon = 'male.dmi'
obj/techs
	telepath
		verb
			Telepath(mob/characters/M in oview(150), msg as text)
				set category = "Communication"
				usr << "<b>----><font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>:<font color = white> [msg]"
				M << "<b><----<font color = blue>{{<font color = white>Telepathy<font color = blue>}}<font color = red>[usr]:<font color = white> [msg]"


obj
	fusion
		name = "Poratta Earrings"
		icon = 'poratta.dmi'
		proc
			Statsrefresh(mob/characters/M in oview(1))
				usr.maxpowerlevel1 = usr.maxpowerlevel
				usr.maxhealth1 = usr.maxhealth
				usr.strength1 = usr.strength
				usr.speed1 = usr.speed
				usr.defense1 = usr.defense
				M.maxpowerlevel1 = usr.maxpowerlevel
				M.maxhealth1 = usr.maxhealth
				M.strength1 = usr.strength
				M.speed1 = usr.speed
				M.defense1 = usr.defense
			Statsrefresh1(mob/characters/M in oview(1))
				usr.maxpowerlevel = usr.maxpowerlevel1
				usr.maxhealth = usr.maxhealth1
				usr.strength = usr.strength1
				usr.speed = usr.speed1
				usr.defense = usr.defense1
				usr.contents -= new /obj/GogetaArmor
				usr.overlays -='GogetaVest.dmi'
				M.pk = M.opk
				usr.start = 0
				M.maxpowerlevel = usr.maxpowerlevel1
				M.maxhealth = usr.maxhealth1
				M.strength = usr.strength1
				M.speed = usr.speed1
				M.defense = usr.defense1

		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'poratta.dmi'
					usr << "You remove the [src.name]."
					usr.poratta = 0
				else
					src.worn = 1
					usr.overlays += 'poratta.dmi'
					usr << "You wear the [src.name]."
					usr.poratta = 1
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
			Fuse(mob/characters/M in oview(1))
				set category = "Extra"
				set name = "FUSION"
				var
					lead = copytext(usr.name,1,5)
					load = copytext(M.name,6)
					lead2 = copytext(usr.name,1,5)
					load2 = copytext(M.name,6)
				if(M.poratta == 1)
					if(usr.race == M.race)
						if(usr.hasfused==0&&M.hasfused==0)
							switch(alert(M,"Do you want to fuse with [usr]?","Fusion","Yes","No"))
								if("Yes")
									usr.hasfused=1
									M.hasfused=1
									view(6) << "[M] and [usr] fuse to make [lead][load]!!!"
									view(6) << "<font face = arial><tt>---===FUSION HA!!!===---"
									M.move = 0
									M.plarper = 1
									M.oname = M.name
									M.oicon = M.icon
									usr.oicon = usr.icon
									M.icon_state = "fuse"
									usr.oname = usr.name
									M.name = "[lead2][load2]"
									usr.name = "[lead][load]"
									usr.contents += new /obj/GogetaArmor
									usr.overlays+='GogetaVest.dmi'
									M.overlays = M.ooverlays
									Statsrefresh()
									usr.opk = usr.pk
									usr.pk = 0
									usr.start = 1
									M.opk = M.pk
									M.pk = 0
									usr.defense += M.defense
									M.loc=locate(usr.x,usr.y,usr.z)
									M.follow = usr.name
									M.fusionfollow()
								if("No")
									alert("He has declined the request")
					else
						usr<<"Sorry, you cannot fuse with anyone of a different race"
			UnFuse(mob/characters/M in view(1))
				set name="FISSION"
				set category = "Extra"
				var
					lead = copytext(usr.name,1,5)
					load = copytext(M.name,6)
					lead2 = copytext(usr.name,1,5)
				if(M.poratta==1)
					if(usr.hasfused == 1&&M.hasfused==1)
						if(M.name == usr.name)
							if(lead2)
								usr<<"Only the leader can do this"
							if(lead)
								M.icon = M.oicon
								usr.icon = usr.oicon
								M.move = 1
								usr.move = 1
								usr.plarper = 0
								M.plarper = 0
								M.name = M.oname
								Statsrefresh1()
								usr.name = usr.oname
								M.loc=locate(usr.x + 1,usr.y,usr.z)
								M.follow = M.name
								usr.icon_state = ""
								M.icon_state = ""
								M.fusionfollow()
								M.contents -= new /obj/GogetaArmor
								M.overlays -='GogetaVest.dmi'
								usr.pk = usr.opk
								M.start = 0
								M.icon_state = ""
								view(6) << "[lead][load] split to make [M] and [usr]!!!"
								view(6) << "<font face = arial><tt>---===AHHH!!!===---"

								usr.hasfused = 0
								M.hasfused = 0
						else
							usr<<"They are not fused with you"
					else
						usr<<"Something is wrong with the name....?"



mob
	proc
		fusionfollow()
			for(var/mob/characters/M in world)
				if(src.follow == usr.name)
					src.loc = usr.loc
					src.dir = usr.dir
					sleep(1)
					src.fusionfollow()
				else
					..()


mob
	flerp
		race = "Earth-sei-jin"
		name = "Freaky"
		maxpowerlevel = 75000
		icon = 'mobs.dmi'
		icon_state = "vegetto"



obj
	Mystic
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are Mystic already."
					if(usr.ssj == 0 && usr.kaioken == 0)
						if(((usr.strength +usr.speed + usr.defense)/3) < 100)
							usr << "<b>You seem too weak to."
						if(((usr.strength +usr.speed + usr.defense)/3) >= 100)
							usr.oicon = usr.icon
							usr.ohair = usr.hair
							usr << "<b>Your Aura Grows wildly."
							oview(6) << "<b>**<font color = white>[usr]'s hair begins to stand on end and sparks surround him.<font color = white>**"
							usr.overlays -= 'hair_black_spikey.dmi'
							usr.overlays -= 'hair_black_long.dmi'
							usr.overlays -= 'hair_black_short.dmi'
							usr.overlays -= 'hair_vegeta.dmi'
							usr.overlays-='hair_Gohan.dmi'
							usr.overlays -= 'hair_goku.dmi'
							usr.overlays += 'hair_black_spikey.dmi'
							usr.overlays += 'myticaura.dmi'
							usr.overlays+='elec.dmi'
							usr.ssj = 1
							usr.ofaceicon = usr.faceicon
							usr.faceicon = 'gohan.bmp'
							usr.state = "Mystic"
							usr.strength += 50
							usr.defense += 35
							usr.speed += 10
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent Mystic."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.overlays -= 'myticaura.dmi'
					usr.overlays -= 'myticaura.dmi'
					usr.overlays -= 'myticaura.dmi'
					usr.overlays-='elec.dmi'
					usr.icon = usr.oicon
					usr.faceicon = usr.ofaceicon
					usr.state = "Normal"
					usr.ssj = 0
					usr.strength -= 50
					usr.defense -= 35
					usr.speed -= 10
					usr.overlays-='hair_black_spikey.dmi'
					if (usr.hair=="Spikey")
						var/hairover = 'hair_black_spikey.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="long")
						var/hairover = 'hair_black_long.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Short")
						var/hairover = 'hair_black_short.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Vegeta")
						var/hairover = 'hair_vegeta.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Gohan")
						var/hairover = 'hair_Gohan.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Goku")
						var/hairover = 'hair_goku.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel

obj
	ssj
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent in SSJ."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'ssj4-hair.dmi'
					usr.overlays -= 'elec.dmi'
					usr.overlays-='ssj4.dmi'
					usr.icon = usr.oicon
					usr.overlays -= 'hair_super_saiyajin.dmi'
					usr.overlays -= 'ssj3.dmi'
					usr.overlays -= 'hair_black_spikey.dmi'
					usr.overlays -= 'hair_black_long.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays -= 'hair_super_saiyajin2.dmi'
					usr.overlays -= 'ssj4-hair.dmi'
					usr.overlays -= 'ssj4.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays -= 'hair_black_short.dmi'
					usr.overlays -= 'hair_vegeta.dmi'
					usr.overlays-='hair_Gohan.dmi'
					usr.overlays-='hair_ssj4_vegeta.dmi'
					usr.overlays -='hair_goku.dmi'
					usr.overlays -= 'hair_ssj_goku.dmi'
					usr.overlays -= 'hair_ssj3_goku.dmi'
					usr.overlays -= 'hair_ssj4_goku.dmi'
					usr.overlays -='Hair_Bald_Supersayajin.dmi'
					usr.ssj = 0
					if (usr.hair=="Spikey")
						var/hairover = 'hair_black_spikey.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="long")
						var/hairover = 'hair_black_long.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Short")
						var/hairover = 'hair_black_short.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Vegeta")
						var/hairover = 'hair_vegeta.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Goku")
						var/hairover = 'hair_goku.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if (usr.hair=="Gohan")
						var/hairover = 'hair_Gohan.dmi'
						hairover += rgb(rhair,ghair,bhair)
						usr.overlays += hairover
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					if(usr.state == "Super Saiya-jin")
						usr.strength -= 25
						usr.defense -= 20
					if(usr.state == "Ultra Super Saiya-jin")
						usr.strength -= 50
						usr.defense -= 35
						usr.speed -= 10
					if(usr.state == "Super Saiya-jin 2")
						usr.strength -= 70
						usr.defense -= 50
						usr.speed -= 40
					if(usr.state == "Super Saiya-jin 3")
						usr.strength -= 100
						usr.defense -= 70
						usr.speed -= 60
					if(usr.state == "Super Saiya-jin 4")
						usr.strength -= 125
						usr.defense -= 90
						usr.speed -= 100
						if(usr.styleicon == "White")
							usr.icon = 'male-white.dmi'
							usr.styleicon = "White"
						if(usr.styleicon =="Tan")
							usr.icon = 'male.dmi'
							usr.styleicon = "Tan"
						if(usr.styleicon =="Brown")
							usr.icon = 'male-black.dmi'
							usr.styleicon = "Brown"
						if(usr.styleicon =="Olive")
							usr.icon = 'male-olive.dmi'
							usr.styleicon = "Olive"
					usr.state = "Normal"

			Transform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in SSJ already."
					else
						if(usr.race == "Saiya-jin" || usr.race == "Halfbreed")
							if(usr.ssj == 0 && usr.kaioken == 0)
								switch(input("What type of Super Saiyan do you wish to go?") in list("Super Saiyan","USSJ","Super Saiyan 2","Super Saiyan 3","Super Saiyan 4"))
									if("USSJ")
										if(((usr.strength +usr.speed + usr.defense)/3) >= 50)
											usr.oicon=usr.icon
											usr << "<b>You explode in rage as you go Ultra Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him and his body becomes massive.<font color = white>**"
										//	usr.overlays += 'hair_super_saiyajin.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
												usr.overlays -= 'hair_black_spikey.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												hairover += rgb(160,160,50)
												usr.overlays += hairover
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
												usr.overlays -= 'hair_black_short.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.overlays += hairover
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
												usr.overlays -= 'hair_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.icon='USupersayajin.dmi'
											usr.ssj = 1
											usr.strength += 50
											usr.defense += 35
											usr.speed += 10
											usr.ofaceicon = usr.faceicon
									//		usr.faceicon = 'ssjgoku.bmp'
											usr.state = "Ultra Super Saiya-jin "
											if(((usr.strength +usr.speed + usr.defense)/3) >= 100)
												usr.stamina -= 0
											else
												usr.stamina-=10
											usr.tiredssj()
										else
											usr << "<b>You feel too weak to go Super Saiyan."
									if("Super Saiyan")
										if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
											usr.oicon = usr.icon
											usr << "<b>You explode in rage and you go Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_super_saiyajin.dmi'
												usr.overlays -= 'hair_black_spikey.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												hairover += rgb(160,160,50)
												usr.overlays += hairover
												usr.overlays += 'hair_super_saiyajin.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_super_saiyajin.dmi'
												usr.overlays -= 'hair_black_short.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_super_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.overlays += hairover
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
												usr.overlays -= 'hair_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
										//	usr.overlays += 'hair_super_saiyajin.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 1
											usr.strength += 25
											usr.defense += 20
											usr.ofaceicon = usr.faceicon
										//	usr.faceicon = 'ssjgoku.bmp'
											usr.state = "Super Saiya-jin"
											usr.tiredssj()
										else
											usr << "<b>You feel too weak to go Super Saiyan."
									if("Super Saiyan 2")
										if(((usr.strength +usr.speed + usr.defense)/3) >= 75)
											usr.oicon = usr.icon
											usr << "<b>You explode in rage as you go Super Saiya-jin 2."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
										//	usr.overlays += 'hair_super_saiyajin.dmi'
											if (usr.hair=="Spikey")										if (usr.hair=="Spikey")
												usr.overlays += 'hair_super_saiyajin2.dmi'
												usr.overlays -= 'hair_black_spikey.dmi'
											if (usr.hair=="long")
												var/hairover = 'hair_black_long.dmi'
												hairover += rgb(160,160,50)
												usr.overlays += hairover
												usr.overlays += 'hair_super_saiyajin2.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_super_saiyajin2.dmi'
												usr.overlays -= 'hair_black_short.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_super_saiyajin2.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.overlays += hairover
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
												usr.overlays -= 'hair_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.overlays += 'elec.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.ofaceicon = usr.faceicon
											usr.strength += 70
											usr.defense += 50
											usr.speed += 40
										//	usr.faceicon = 'ssj2gohan.bmp'
											usr.ssj = 1
											usr.state = "Super Saiya-jin 2"
											usr.tiredssj()
										else
											usr << "<b>You feel too weak to go Super Saiyan 2."
									if("Super Saiyan 3")
										if(((usr.strength +usr.speed + usr.defense)/3) >= 100)
											usr.oicon = usr.icon
											usr.overlays -= 'hair_black_spikey.dmi'
											usr.overlays -= 'hair_black_long.dmi'
											usr.overlays -= 'hair_black_short.dmi'
											usr.overlays -= 'hair_vegeta.dmi'
											usr.overlays-='hair_Gohan.dmi'
											usr.overlays -='hair_goku.dmi'
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 3."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as his eyebrows begin to dispatch.<font color = white>**"
											usr.overlays += 'ssj3.dmi'
											usr.overlays -= 'hair_black_spikey.dmi'
											usr.overlays -= 'hair_black_long.dmi'
											usr.overlays -= 'hair_black_short.dmi'
											usr.overlays -= 'hair_vegeta.dmi'
											usr.overlays -= 'hair_goku.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 3"
											usr.ofaceicon = usr.faceicon
										//	usr.faceicon = 'ssj2gohan.bmp'
											usr.ssj = 1
											usr.strength += 100
											usr.defense += 70
											usr.speed += 60
											usr.tiredssj()
										else
											usr << "<b>You feel too weak to go Super Saiyan 3."
									if("Super Saiyan 4")
										if(((usr.strength +usr.speed + usr.defense)/3) >=135)
											usr.overlays -= 'hair_black_spikey.dmi'
											usr.overlays -= 'hair_black_long.dmi'
											usr.overlays -= 'hair_black_short.dmi'
											usr.overlays -= 'hair_vegeta.dmi'
											usr.overlays -='hair_Gohan.dmi'
											usr.overlays -='hair_goku.dmi'
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 4."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as he grows red hair on his chest.<font color = white>**"
											usr.oicon = usr.icon
											usr.overlays+='ssj4.dmi'
										//	usr.icon = 'ssj4.dmi'

											if (usr.hair=="Spikey")
												usr.overlays += 'ssj4-hair.dmi'
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(0,0,0)
												usr.overlays += hairover
											if (usr.hair=="Gohan")
												usr.overlays += 'ssj4-hair.dmi'
												var/hairover = 'hair_black_spikey.dmi'
												hairover += rgb(0,0,0)
												usr.overlays += hairover

											if (usr.hair=="long")
												usr.overlays += 'ssj4-hair.dmi'
												var/hairover = 'hair_black_long.dmi'
												hairover += rgb(0,0,0)
												usr.overlays += hairover
											if (usr.hair=="Short")
												usr.overlays += 'ssj4-hair.dmi'
												var/hairover = 'hair_black_short.dmi'
												hairover += rgb(0,0,0)
												usr.overlays += hairover

											if (usr.hair=="Vegeta")
												usr.overlays += 'hair_ssj4_vegeta.dmi'
											if (usr.hair=="Goku")

												usr.overlays +='hair_ssj4_goku.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 4"
											usr.ssj = 1
											usr.strength += 125
											usr.defense += 90
											usr.speed += 100
											usr.tiredssj()
										else
											usr << "<b>You feel too weak to go Super Saiyan 4."
							else
								usr << "You cannot go Super Saiyan while you are using Kaioken."

						else
							usr <<"You Cheater, You aren't a Saiyan, are you??"
mob
	proc
		tiredssj()
			if(usr.key == "Phoenix Man")
				..()
			else
				if(usr.ssj == 1)
					sleep(rand(10,200))
					if(usr.powerlevel >= 150000)
						usr.stamina -= 0
					else
						usr.stamina -= (rand(1,5))
					if(usr.stamina <= 0)
						usr << "<b>You begin to calm down...."
						usr.underlays -= 'ssjaura.dmi'
						usr.underlays -= 'ssjaura.dmi'
						usr.underlays -= 'ssjaura.dmi'
						usr.icon = usr.oicon
						usr.overlays -= 'ssj4-hair.dmi'
						usr.icon=usr.oicon
						usr.overlays -= 'elec.dmi'
						usr.overlays-='ssj4.dmi'
						usr.overlays -= 'hair_super_saiyajin.dmi'
						usr.overlays -= 'ssj3.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays -= 'hair_black_spikey.dmi'
						usr.overlays -= 'hair_black_long.dmi'
						usr.overlays -= 'hair_black_short.dmi'
						usr.overlays -= 'hair_vegeta.dmi'
						usr.overlays-='hair_Gohan.dmi'
						usr.overlays -='hair_goku.dmi'
						usr.overlays -= 'hair_ssj_goku.dmi'
						usr.overlays -= 'hair_ssj3_goku.dmi'
						usr.overlays -= 'hair_ssj4_goku.dmi'
						usr.overlays -='Hair_Bald_Supersayajin.dmi'
						usr.faceicon = usr.ofaceicon
						usr.state = "Normal"
						usr.ssj = 0
						if (usr.hair=="Spikey")
							var/hairover = 'hair_black_spikey.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
						if (usr.hair=="long")
							var/hairover = 'hair_black_long.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
						if (usr.hair=="Short")
							var/hairover = 'hair_black_short.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
						if (usr.hair=="Vegeta")
							var/hairover = 'hair_vegeta.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
						if (usr.hair=="Goku")
							var/hairover = 'hair_goku.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
						if (usr.hair=="Gohan")
							var/hairover = 'hair_Gohan.dmi'
							hairover += rgb(rhair,ghair,bhair)
							usr.overlays += hairover
							if(usr.powerlevel <= usr.maxpowerlevel)
								usr.powerlevel += 0
						usr.strength = usr.strength / 3
						usr.defense = usr.defense / 3
						if(usr.powerlevel > usr.maxpowerlevel)
							usr.powerlevel = usr.maxpowerlevel
							usr.KO()
						if(usr.stamina >= 1)
							usr.tiredssj()
mob
	proc
		kaiokenstrain()
			if(usr.kaioken == 1)
				sleep(rand(10,200))
				usr.stamina -= (rand(1,5))
				if(usr.stamina <= 0)
					usr << "<b>You feel the strain of Kaioken."
					usr.stamina = 0
					usr.powerlevel = 0
					usr.underlays -= 'kaioaura.dmi'
					usr.kaioken = 0
					usr.KO()
				if(usr.stamina >= 1)
					usr.kaiokenstrain()



obj
	tail
		icon = 'tail.dmi'
		layer = MOB_LAYER + 5


obj
	flute
		icon = 'turfs.dmi'
		icon_state = "flute"
		name = "Tapion's Flute"
		verb
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				usr.tapion = 0
				Move(usr)
			Play()
				set category = "Inventory"
				if(usr.tapion == 1)
					usr << "<b>But you feel soothed already..."
				if(usr.tapion == 0)
					usr.icon_state = "play"
					usr.tapion = 1
					usr.underlays += /obj/whiteaura
					usr << 'tapion.mid'
					usr.move = 1
					for(var/mob/M in view(6))
						M << "<b><font color = silver><font size = 1>You feel a chill go down your spine as the calming melody of Tapion is played by [usr]."
						M << 'tapion.mid'
						M.powerlevel *= 1.1
						M.powerlevel = round(M.powerlevel)
						sleep(100)
						M << "<b>The melody drives into your heart. It fills your body with good."
						sleep(1020)
						M << "<b>As the melody stops, you feel your body reguivinate."
						M.powerlevel = M.maxpowerlevel
						M.stamina = 100
						M.icon_state = ""
						M.tapion = 0







obj
	tay
		icon = 'tayioken.bmp'
		layer = MOB_LAYER + 99999999999999999999999999999999

obj
	senzu
		icon = 'turfs.dmi'
		icon_state = "senzu"
		name = "Senzu Bean"
		verb
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
			Eat()
				set category = "Inventory"
				usr.powerlevel = usr.maxpowerlevel
				usr.stamina = 150
				usr << "<b>You feel better as you eat a Senzu Bean."
				del(src)
obj
	ray
		icon = 'ray.dmi'
		layer = MOB_LAYER + 99999999999999999999



obj
	maniack
		butteredtoast
			name = "Buttered Toast"
			desc = "Buttered Toast"
			icon = 'maniack.dmi'
			icon_state = "butteredtoast"
			verb
				Eat()
					usr <<"MmmmmMmmmMmmmm.. buttered toast.."
					usr.powerlevel -= 5
					usr.contents -= /obj/maniack/butteredtoast
		GRAVY
			name = "Gravy"
			desc = "Gravy"
			icon = 'maniack.dmi'
			icon_state = "GRAVY"
			verb
				Drink()
					usr <<"MmmmmMmmmMmmmm.. Gravy...."
					usr.powerlevel -= 5
					usr.contents -= /obj/maniack/GRAVY
		BreakDanceSheet
			name = "Sheet"
			desc = "Sheet"
			icon = 'maniack.dmi'
			icon_state = "sheet"
			verb
				Break_Dance_On_Meh()
					set category = "Maniack"
					set src in oview(0)
					if(usr.name == "Maniack")
						flick("breakdance", usr)
						src<<"[usr] busts a move!!"
					else
						usr<<"Yeh cant break dance like Maniack can!!!"
						world <<"[usr] tries to break dance like Maniack but [usr] is too WHITE"

		verb
			ButteredToastMake()
				new /obj/maniack/butteredtoast(loc=usr.x+1,usr.y,usr.z)

			GravyMake()
				new /obj/maniack/GRAVY(loc=usr.x+1,usr.y,usr.z)

obj
	wover
		icon = 'turfs.dmi'
		icon_state = "wover"
		density = 0
		layer = MOB_LAYER + 99999



obj
	ki
		icon = 'skills.dmi'
		icon_state = "ki"
		layer = MOB_LAYER + 99


obj
	WeightTraining100
		icon = 'weight-objs.dmi'
		icon_state = "w100"
		lift = 0
		layer = MOB_LAYER + 99
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0)
					if(usr.stamina >= 5)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 5
								usr.stamina-=1
								usr.exp += 50

							else
								usr.maxpowerlevel += 5
								usr.exp += 10
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 10
								usr.stamina-=1
								usr.exp += 20
							else
								usr.maxpowerlevel += 5
								usr.exp += 10
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 2
								usr.stamina-=1
								usr.exp += 5
							else
								usr.maxpowerlevel += 2
								usr.stamina-=1
								usr.exp += 5
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100"
							usr.icon_state = ""
							usr.FlightLearn()
							usr.KiTechLearn()
							usr.AuraTechLearn()
							usr.FocusLearn()
					if(usr.stamina <= 4)
						usr << "You feel to weak too."
				else
					usr << "Its being lifted already."
				usr.Levelup()



obj
	MeditationPad
		icon = 'turfs.dmi'
		icon_state = "whitefloor"
		verb
			Meditate()
				set category = "Training"
				set src in oview(1)
				if(usr.meditate == 1)
					usr << "You are currently meditating."
				if(usr.meditate==0 &&usr.stamina>=2)
					if(usr.flight == 1)
						usr << "Not while flying."
					if(usr.flight == 0)
						usr.meditate = 1
						usr.icon_state = "meditate"
						usr.move = 0
						sleep(50)
						usr.random = rand(1,4)
						if(usr.random == 1)
							usr << "You have not gained any knowlage from that."
							usr.move = 1
							usr.icon_state = ""
							usr.meditate = 0
						if(usr.random == 4)
							usr << "You have not gained any knowlage from that."
							usr.move = 1
							usr.icon_state = ""
							usr.meditate = 0
						if(usr.random == 2)
							usr << "You feel a bit wiser."
							usr.move = 1
							usr.icon_state = ""
							usr.maxpowerlevel += rand(1,3)
							usr.meditate = 0
						if(usr.random == 3)
							usr << "You have gained superior knowlage."
							usr.move = 1
							usr.icon_state = ""
							usr.maxpowerlevel += rand(2,5)
							usr.meditate = 0
						usr.stamina -= 1
						usr.FlightLearn()
						usr.AuraTechLearn()
						usr.KiTechLearn()
						usr.FocusLearn()
						if(usr.stamina >= usr.maxstamina)
							usr.stamina = 100
						usr.random = rand(1,30)
						if(usr.random == 30)
							usr << "<b><font size = 4>You feel more purified."
							usr.purity += 1
							usr.random = rand(1,29)
						if(usr.random == 29)
							usr << "<b><font size = 4>You feel more honor enter your blood."
							usr.honor += 1
							usr.random = rand(1,28)
						if(usr.random == 28)
							usr << "<b><font size = 4>You get more will to fight."
							usr.will += 1
						else
							usr.powerlevel += 0
obj/newspaper
	name = "News Paper"
	icon = 'tiles.dmi'
	icon_state = "newspaper"
	verb
		ReadPaper()
			set category = "Inventory"
			set name = "Read the Paper"
			var/html="<center><TABLE BORDER=1><TR><TH><html><STYLE>BODY {background: black;  color: white}</STYLE><center><h1><U><font color=yellow>DBZ Power Gazette<font color=white></u></h1></center><br>---8/16/03--- Dbuman's Column:<br>'Hey everyone! the latest news today is... REDOING MAP, i know how people hate old zeta maps, so im working on the first map right now.<br> I am adding new style buildings and such, soon there will be no open walls, just pure buildings that send u to locations! This game is developing quite well!'<TABLE CELLSPACING=10>"
			usr<<browse ("[html]")
		Drop()
			usr.contents -= /obj/newspaper
			src.loc = locate(usr.x,usr.y-1,usr.z)


obj/training/SpeedBag
	icon = 'weight-objs.dmi'
	icon_state = "speed"
	density = 1
	verb
		Punch1()
			set name = "Hit Speedbag"
			set category = "Extra"
			set src in view(1)
			var/expgain = (usr.strength + usr.defense + usr.speed) / 2
			expgain = round(expgain)
			usr.powerlevelRefresh(usr)
			if(usr.flight == 1)
				usr << "Not while flying."
			if(usr.spar == 0)
				usr<<"You need to be in sparring stance"
			if(usr.sbag == 1)
				return
			if(usr.sbag == 0 && usr.spar == 1 && usr.flight == 0)
				if(usr.stamina >= 5)
					var/damage = usr.strength
					var/colour = "gold"
					if(usr.dir == 4)
						flick("speedhit",src)
						usr.icon_state = "sparpunch"
						for(var/obj/training/SpeedBag/M in view(1))
							s_damage(M,damage,colour)
						usr.sbag = 1
						if(usr.speed < 10)
							sleep(7)
						else
							if(usr.speed <= 30)
								sleep(6)
							else
								if(usr.speed <= 70)
									sleep(5)
								else
									if(usr.speed <= 100)
										sleep(4)
									else
										if(usr.speed <= 150)
											sleep(3)
						usr.sbag = 0
						usr.random = rand(1,12)
						if(usr.random)
							if(usr.random == 12)
								usr.stamina-=1
								usr.icon_state = "sparstand"
								usr.exp += expgain
								usr.meditate = 0
								usr.FlightLearn()
								usr.KiTechLearn()
								usr.AuraTechLearn()
								usr.FocusLearn()
								usr.Levelup()
							if(usr.random == 11)
								usr.stamina-=1
								usr.icon_state = "sparstand"
								usr.exp += expgain
								usr.meditate = 0
								usr.FlightLearn()
								usr.KiTechLearn()
								usr.AuraTechLearn()
								usr.FocusLearn()
								usr.Levelup()
							else
								usr.maxpowerlevel += 0
								usr.icon_state = "sparstand"


obj
	Machine
		icon = 'turfs.dmi'
		icon_state = "mach"
		density = 1
		verb
			HitPunchingBagLikeAMuthaFeckaYeahPeepah()
				set name = "Punching Contest"
				set category = "Training"
				set src in oview(1)
				set desc = "Win Zenni!"
				if(usr.flight == 1)
					usr << "Not while flying."
				if(usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0&&usr.resting==0)
					if(usr.dir == 8)
						if(usr.move == 0)
							usr << "Not now."
						if(usr.move == 1)
							view(6) << "<b>[usr] pulls his arm back..."
							usr.move = 0
							sleep(rand(1,60))
							flick("machhit",src)
							flick("weight-training-right", usr)
							if(usr.move == 0)
								usr.move = 1
								usr.icon_state = ""
								var/damage = (usr.powerlevel / (rand(1,8)))
								damage = round(damage)
								damage += (rand(0,15))
								view(6) << "<font color = blue><i>[usr] hits the machine, doing about [damage] damage to it."
								usr.random = rand(1,2)
								if(usr.random == 2)
									if(damage >= 1000000)
										var/oloc
										flick("machdes",src)
										view(6) << "<font color = blue><i>[usr] hits the machine too hard, destroying it!!"
										oloc = src.loc
										src.loc=locate(10,150,150)
										var/err = new /obj/machwreck
										usr.zenni += (rand(1,1000))
										sleep(rand(1,600))
										usr << "You got some Zenni from that last hit."

										del(err)
										src.loc=oloc
									if(damage < 1000000)
										usr.zenni += (rand(1,1000))
										usr << "You got some Zenni from that last hit."

								if(usr.random == 1)
									usr.maxpowerlevel += rand(1,2)


								usr.meditate = 0
								usr.FlightLearn()
								usr.KiTechLearn()
								usr.AuraTechLearn()
								usr.FocusLearn()
							else
								view(6) << "<font color = blue><i>[usr] his the machine, doing [usr.powerlevel / (rand(2,8))] damage to the machine!"
								usr.maxpowerlevel += 0
								usr.move = 1
								usr.icon_state = ""
								usr.meditate = 0

obj
	machwreck
		icon = 'turfs.dmi'
		icon_state = "machdead"
obj
	DragonballStatue
		icon = 'weight-objs.dmi'
		icon_state = "magicball"
		density = 1

obj
	whiteaura
		icon = 'whiteaura.dmi'
		icon_state = ""


obj
	kaioaura
		icon = 'auras.dmi'
		icon_state = "kaioaura"

obj
	shadow
		icon = 'shadow.dmi'
		pixel_y = -32
mob/training
	verb
		Punch(mob/M in oview(1))
			set category = "Extra"
			WinMatch(src)
			LoseMatch()
			var/damage = usr.strength * 1.25 - M.defense
			if(damage <=0)
				damage = 1
			var/colour = "white"
			if(usr.flight == 1)
				usr << "Not while flying!"
			if(usr.resting==1)
				usr<<"Not while resting"
			else
				if(!M.key)
					usr<<"You cannot attack an NPC"
				else
					if(usr.spar == 0)
						usr << "You need to be sparring!"
					else
						if(usr.ko == 1)
							usr << "You are knocked out at the moment..."
						else
							if(usr.block == 1)
								usr << "Not while blocking!"
							else
								if(M.spar == 0)
									usr << "He's not ready to spar."
								else
									if(M.ko == 1)
										usr << "You can't hit a man when he's down..."
									else
										if(M.block == 1)
											usr.random = rand(1,3)
											if(usr.random == 3)
												view(6) << "<font color = blue><i>[usr] breaks [M]'s block and punches him!"
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparpunch"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparpunch"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparpunch"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparpunch"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 75
													usr.Levelup()
											else
												view(6) << "<font color = blue><i>[M] blocks [usr]'s attack!"
										if(M.block == 0)
											usr.random = rand(1,5)
											if(usr.random == 5)
												usr << "<font color = blue><i>[usr] stumbles and misses!"
											if(usr.random == 4)
												usr << "<font color = blue><i>[usr] smashes [M] right in the face!"
												s_damage(M,damage,colour)
												M.stamina -= damage
												M.stamina = round(M.stamina)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparpunch"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparpunch"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparpunch"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparpunch"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 50
													usr.Levelup()
											if(usr.random == 3)
												usr << "<font color = blue><i>[M] counters [usr]'s attack and punches him in the face!"
												s_damage(M,damage,colour)
												M.stamina -= damage
												M.stamina = round(M.stamina)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparpunch"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparpunch"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparpunch"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparpunch"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												usr.exp += 45
												usr.Levelup()
												M.KO()
												WinMatch(src)
											if(usr.random == 2)
												usr << "<font color = blue><i>[usr] punches [M] in the shoulder!"
												s_damage(M,damage,colour)
												M.stamina -= damage
												M.stamina = round(M.stamina)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparpunch"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparpunch"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparpunch"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparpunch"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												usr.exp += 65
												usr.Levelup()
												M.KO()
												WinMatch(src)
											else
												usr << "<font color = blue><i>[usr] punches [M] in the stomach."
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparpunch"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparpunch"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparpunch"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparpunch"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 35
													usr.Levelup()











//kick///


mob/training
	verb
		Kick(mob/M in oview(1))
			set category = "Extra"
			WinMatch(src)
			LoseMatch()
			var/damage = usr.strength * 1.5 - M.defense
			if(damage <=0)
				damage = 1
			var/colour = "white"
			if(usr.flight == 1)
				usr << "Not while flying!"
			else
				if(!M.key)
					usr<<"You cannot attack an NPC"
				else
					if(usr.spar == 0)
						usr << "You need to be sparring!"
					else
						if(usr.ko == 1)
							usr << "You are knocked out at the moment..."
						else
							if(usr.block == 1)
								usr << "Not while blocking!"
							if(usr.block == 0)
								if(M.spar == 0)
									usr << "He's not ready to spar."
								else
									if(M.ko == 1)
										usr << "You can't kick a man when he's down..."
									else
										if(M.block == 1)
											usr.random = rand(1,3)
											if(usr.random == 3)
												view(6) << "<font color = blue><i>[usr] breaks [M]'s block and kicks him!"
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												usr.loc = locate(M.x,M.y-1,M.z)
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparkick"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparkick"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparkick"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparkick"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 100
													usr.Levelup()
											else
												view(6) << "<font color = blue><i>[M] blocks [usr]'s kick!"
										if(M.block == 0)
											usr.random = rand(1,5)
											if(usr.random == 5)
												usr << "<font color = blue><i>[usr] stumbles and misses!"
											if(usr.random == 4)
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												usr.loc = locate(M.x,M.y+1,M.z)
												M.block = 0
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparkick"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparkick"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparkick"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparkick"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												WinMatch(src)
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 75
													usr.Levelup()
											if(usr.random == 3)
												usr << "<font color = blue><i>[M] counters [usr]'s attack and kicks him in the groin!"
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												usr.loc = locate(M.x-1,M.y,M.z)
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparkick"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparkick"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparkick"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparkick"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 85
													usr.Levelup()
											if(usr.random == 2)
												usr << "<font color = blue><i>[usr] kick [M] in the shoulder!"
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												usr.loc = locate(M.x,M.y+1,M.z)
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparkick"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparkick"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparkick"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparkick"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												usr.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 45
													usr.Levelup()
											else
												usr << "<font color = blue><i>[usr] kick [M] in the stomach."
												s_damage(M,damage,colour)
												M.stamina -= damage/2
												M.stamina = round(M.stamina)
												M.block = 0
												usr.loc = locate(M.x+1,M.y,M.z)
												if(M.speed < 10)
													M.icon_state = "sparhit"
													sleep(6)
													M.icon_state = "sparstand"
												else
													if(M.speed <= 30)
														M.icon_state = "sparhit"
														sleep(5)
														M.icon_state = "sparstand"
													else
														if(M.speed <= 70)
															M.icon_state = "sparhit"
															sleep(5)
															M.icon_state = "sparstand"
														else
															if(usr.speed <= 100)
																M.icon_state = "sparhit"
																sleep(4)
																M.icon_state = "sparstand"
												if(usr.speed < 10)
													usr.icon_state = "sparkick"
													usr.attacking = 1
													sleep(6)
													usr.icon_state = "sparstand"
													usr.attacking = 0
												else
													if(usr.speed <= 30)
														usr.icon_state = "sparkick"
														usr.attacking = 1
														sleep(5)
														usr.icon_state = "sparstand"
														usr.attacking = 0
													else
														if(usr.speed <= 70)
															usr.icon_state = "sparkick"
															usr.attacking = 1
															sleep(5)
															usr.icon_state = "sparstand"
															usr.attacking = 0
														else
															if(usr.speed <= 100)
																usr.icon_state = "sparkick"
																usr.attacking = 1
																sleep(4)
																usr.icon_state = "sparstand"
																usr.attacking = 0
												usr.random = rand(1,3)
												M.KO()
												if(usr.random == 3)
													usr.maxpowerlevel += rand(1,3)
													usr.exp += 55
													usr.Levelup()


		Block()
			set category = "Extra"
			if(usr.flight == 1)
				usr << "Not while flying."
			if(usr.resting==1)
				usr<< "Not while resting"
			if(usr.flight == 0&&usr.resting==0)
				if(usr.spar == 0)
					usr << "You need to be in sparring first."
				if(usr.spar == 1)
					if(usr.block == 1)
						usr << "You relieve your blocking."
						view(6) << "<font color = blue><i>[usr] relieves from his blocking."
						usr.block = 0

						usr.icon_state = "sparstand"
					//	usr.style = 'style-calming.dmi'
					//	usr.stylename = "Calming"
					else
						usr << "You put your guards up."
						view(6) << "<font color = blue><i>[usr] puts his guards up."
						usr.move = 0
						usr.block = 1
						usr.icon_state = "sparblock"
						usr.style = 'style-blocking.dmi'
						usr.stylename = "Blocking"
		Spar()
			set category = "Extra"
			WinMatch(src)
			if(usr.flight == 1)
				usr << "Not while flying."
			if(usr.flight == 0)
				if(usr.spar == 1)
					view(6) << "<font color = blue><i>[usr] is done sparring."
					usr.spar = 0
					usr.move = 1
					usr.icon_state = ""
				else
					view(6) << "<font color = blue><i>[usr] begins sparring."
					usr.spar = 1
					usr.move = 0
					usr.icon_state = "sparstand"


		Kiblast(mob/characters/M in oview(4))
			set category = "Extra"
			set name = "Ki Blast"
			WinMatch(src)
			LoseMatch()
			var/damage = usr.strength * 5 - M.defense
			if(damage <=0)
				damage = 2
			var/colour = "yellow"
			if(usr.kiin == 1)
				usr << "You are ki-blasting right now!"
			else
				if(usr.flight == 1)
					usr << "Not while flying!"
				if(usr.resting==1)
					usr<<"Not while Resting"
				else
					if(!M.key)
						usr<<"You cannot attack an NPC"
					else
						if(usr.spar == 0)
							usr << "You need to be sparring!"
						else
							if(usr.ko == 1)
								usr << "You are knocked out at the moment..."
							else
								if(usr.block == 1)
									usr << "Not while blocking!"
								else
									if(M.spar == 0)
										usr << "He's not ready to spar."
									if(M.spar == 1)
										if(M.ko == 1)
											usr << "You can't kick a man when he's down..."
										if(M.ko == 0)
											if(M.block == 1)
												usr.powerlevel -= 100
												usr.kiin = 1
												if(usr.powerlevel <= 0)
													usr.KO()
													usr << "You have been knocked out from a lack of energy."
												if(usr.powerlevel >= 1)
													usr.icon_state = "sparback"
													usr.overlays += /obj/ki
													M.kiloc = M.loc
													sleep(15)
													usr.icon_state = ""
													usr.overlays -= /obj/ki
													usr.exp += 150
													usr.random = rand(1,2)
													if(usr.random == 1)
														if(M.loc == M.kiloc)
															s_missile(/obj/ki, usr, M)
															view(6) << "<font color = blue><i>[M] deflects [usr]'s blast!!"
															sleep(5)
															s_missile(/obj/ki, usr, M)
														else
															view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the ki blast to go by him!"
															s_missile(/obj/ki, usr, M)
															M.loc = locate(M.x,M.y-1,M.z)
													if(usr.random == 2)
														if(M.loc == M.kiloc)
															s_missile(/obj/ki, usr, M)
															view(6) << "<font color = blue><i>[M] deflects [usr]'s blast!!"
															sleep(5)
															s_missile(/obj/ki, usr, M)
														else
															view(6) << "<font color = blue><i>[M] gets hit by the ki-blast as his blocking is dispatched!!"
															s_missile(/obj/ki, usr, M)
															M.overlays += /obj/kihit
															sleep(5)
															M.overlays -= /obj/kihit
															s_damage(M,damage,colour)
															M.stamina -= damage/2
															M.stamina = round(M.stamina)
															M.KO()
															usr.maxpowerlevel += rand(1,15)
												usr.exp += 100
												usr.Levelup()
											if(M.block == 0)
												usr.icon_state = "sparback"
												usr.loc=locate(usr.x+1,usr.y,usr.z)
												usr.overlays += /obj/ki
												M.kiloc = M.loc
												sleep(15)
												usr.icon_state = ""
												usr.overlays -= /obj/ki
												usr.random = rand(1,2)
												if(M.loc == M.kiloc)
													view(6) << "<font color = blue><i>[M] gets hit by the ki-blast of [usr]!!"
													s_missile(/obj/ki, usr, M)
													M.overlays += /obj/kihit
													sleep(5)
													M.overlays -= /obj/kihit
													s_damage(M,damage,colour)
													M.stamina -= damage
													M.stamina = round(M.stamina)
													usr.maxpowerlevel += rand(1,15)
													M.KO()
												else
													view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the ki blast to go by him!"
													s_missile(/obj/ki, usr, M)
													M.loc = locate(M.x,M.y+1,M.z)
													usr.kiin = 0

												usr.exp += 200
												usr.Levelup()





obj
	halofront
		icon = 'skills.dmi'
		icon_state = "halofront"
		layer = MOB_LAYER + 50
	haloback
		icon = 'skills.dmi'
		icon_state = "haloback"


	blueunderdmi
		icon = 'clothes-blueunder.dmi'
		layer = MOB_LAYER + 99999999999999999999

	blueunder
		name = "Blue Underclothing"
		icon = 'clothes-blueunder.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blueunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blueunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blackunder
		name = "Black Underclothing"
		icon = 'clothes-blackunder.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blackunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blackunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)


	blackgidmi
		icon = 'clothes-blackgi.dmi'
		layer = MOB_LAYER + 99999999999999999999
	bluegidmi
		icon = 'clothes-bluegi.dmi'
		layer = MOB_LAYER + 99999999999999999999

	bluegi
		name = "Blue Gi"
		icon = 'clothes-bluegi.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-bluegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-bluegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	orangeunderdmi
		icon = 'clothes-orangeunder.dmi'
		layer = MOB_LAYER + 99999999999999999999

	orangeunder
		name = "Orange Clothes"
		icon = 'clothes-orangeunder.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-orangeunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-orangeunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blackgi
		name = "Black Gi"
		icon = 'clothes-blackgi.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-blackgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-blackgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	namekgi
		name = "Namekian Gi"
		icon = 'namekgi.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'namekgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'namekgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	turben
		name = "Turben"
		icon = 'turben.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'turben.dmi'
					usr << "You remove the [src.name]."


				else
					src.worn = 1
					usr.overlays += 'turben.dmi'
					usr << "You wear the [src.name]."

			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	cape
		name = "White Cape"
		icon = 'cape.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'cape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'cape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	orangegi
		name = "Orange Gi"
		icon = 'clothes-orangegi.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'clothes-orangegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'clothes-orangegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	saiyanarmor
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	royalsaiyan
		name = "Royal Saiya-jin Armor"
		icon = 'saiyanarmor4.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor4.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor4.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	blackelite
		name = "Elite Saiya-jin Armor (Black)"
		icon = 'saiyanarmor5.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor5.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor5.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	blueelite
		name = "Elite Saiya-jin Armor (Blue)"
		icon = 'saiyanarmor3.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor3.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	custom_armor
		name = "Custom Armor"
		icon = 'saiyanarmor2.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)



	elitesaiyanarmor
		name = "Elite Saiya-jin Armor"
		icon = 'saiyanarmor2.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	bootglovedmi
		icon = 'gloves-boots.dmi'
		layer = MOB_LAYER + 99999999999999999999

	boxingglove
		name = "Boxing Gloves"
		icon = 'boxing.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'boxing.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'boxing.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

	text1
		name = "DBZ"
		icon = 'text.dmi'
		icon_state = "1"
	text2
		name = "POW"
		icon = 'text.dmi'
		icon_state = "2"
	text3
		name = "ER"
		icon = 'text.dmi'
		icon_state = "2a"
	BluePants
		name = "Blue Pants"
		icon = 'bluepants.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'bluepants.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'bluepants.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	DbumanClothes
		name = "Dbuman's Uniform"
		icon = 'dbumanclangi.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'dbumanclangi.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'dbumanclangi.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	GogetaArmor
		name = "Gogeta's Vest"
		icon = 'GogetaVest.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GogetaVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GogetaVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	Androidchip
		name = "Android Chip"
		icon = 'Androidchip.dmi'
		verb
			Absorb()
				if(usr.race == "Android"&&usr.chips<10)
					set category = "Inventory"
					set src in oview(1)
					Move(usr)
					usr.powerlevel+=usr.maxpowerlevel/5
					usr.chips+=1
					var/aura = 'whiteaura.dmi'
					aura += rgb(usr.customred,usr.customgreen,usr.customblue)
					usr.underlays += aura
					usr.overlays+='elec.dmi'

					usr<<"You feel much change inside of you, you become much stronger"
					sleep(5000)
					usr.overlays-='elec.dmi'
					if (usr.powerlevel>=usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel

	GotenkArmor
		name = "Gotenk's Vest"
		icon = 'GotenkVest.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GotenkVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GotenkVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
	bootglove
		name = "White Boots and Gloves"
		icon = 'gloves-boots.dmi'
		layer = MOB_LAYER + 99999999999999999999
		worn = 0
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'gloves-boots.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'gloves-boots.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
//Gravitron//
obj/GravitronIcon
	icon = 'turfs.dmi'
	icon_state = "gravity"
obj/Gravitron
	icon = 'turfs.dmi'
	icon_state = "gravity"
	density = 1
	verb
		Gravity()
			set category = "Training"
			set src in oview(1)
			var/howmuch = input("How much gravity would you like? (Note, it is suggested to be atleast 1000 powerlevel before gravity training.)") as num|null
			if(howmuch < 0)
				usr << "<b>Thats not possible."
			if(howmuch == 1||howmuch == 0)
				usr.grav = 0
				usr << "<b>You turn off the gravity...."
			if(howmuch > 1 && howmuch <= 500)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)
					usr.playergravity()
			if(howmuch > 500)
				usr << "<b>The gravitron cannot withstand more than 500x gravity."

obj/Gravitrontwo
	icon = 'turfs.dmi'
	icon_state = "gravity"
	density = 1
	verb
		Gravity()
			set category = "Training"
			set src in oview(1)
			var/howmuch = input("How much gravity would you like? (Note, it is suggested to be atleast 1000 powerlevel before gravity training.)") as num|null
			if(howmuch < 0)
				usr << "<b>Thats not possible."
			if(howmuch == 1||howmuch == 0)
				usr.grav = 0
				usr << "<b>You turn off the gravity...."
			if(howmuch > 1 && howmuch <= 10000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)
					usr.playergravity()
			if(howmuch > 10000)
				usr << "<b>The gravitron cannot withstand more than 10000x gravity."



mob
	proc
		playergravity()
			if(usr.grav != 0)
				var/success = rand(1,6)
				if(success == 1 || success == 2)
					usr << "You feel the gravity pull down on you. You seem stronger."
					usr.health -= usr.grav * (rand(1,2))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.exp += usr.grav / (rand(1,50))
						usr.exp = round(usr.exp)
						Levelup()
					spawn(40)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()
				if(success == 3 || success == 5)
					usr << "You feel yourself getting use to the gravity."
					usr.health -= usr.grav * (rand(1,3))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.exp += usr.grav / (rand(1,50))
						usr.exp = round(usr.exp)
						Levelup()
					spawn(40)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()
				if(success == 4 || success == 6)
					usr << "You feel the full force of the gravity!!"
					usr.health -= usr.grav * (rand(1,3))
					if(usr.powerlevel <= 0)
						usr.Die()
					if(usr.powerlevel >= 1)
						usr.exp += usr.grav / (rand(1,50))
						usr.exp = round(usr.exp)
						Levelup()
					spawn(40)
						if(usr.grav == 0)
							usr.powerlevel += 0
						else
							usr.playergravity()

				else
					return
				usr.maxpowerlevel += 1
			else
				return



obj
	green_scouter
		icon = 'green-scouter.dmi'
		layer = MOB_LAYER + 99999999999999999999
		name = "Class III Scouter"
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'green-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'green-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	custom_scouter
		icon = 'custom-scouter.dmi'
		layer = MOB_LAYER + 99999999999999999999
		name = "Custom Scouter"
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'custom-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'custom-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	red_scouter
		icon = 'red-scouter.dmi'
		layer = MOB_LAYER + 99999999999999999999
		name = "Class II Scouter"
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'red-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'red-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 100000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 100000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	yellow_scouter
		icon = 'yellow-scouter.dmi'
		layer = MOB_LAYER + 99999999999999999999
		name = "Class IV Scouter"
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'yellow-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'yellow-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 10000000000000000000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 10000000000000000000000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Search()
				set category = "Inventory"
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					usr << "<B>[M.name]'s location: ([M.x],[M.y],[M.z])"

			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)

obj
	blue_scouter
		icon = 'blue-scouter.dmi'
		layer = MOB_LAYER + 99999999999999999999
		name = "Class I Scouter"
		verb
			Wear()
				set category = "Inventory"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'blue-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'blue-scouter.dmi'
					usr << "You wear the [src.name]."

			Scan(mob/characters/M in view(6))
				set category = "Inventory"
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 50000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 50000)
						usr << "<b>[M] : [M.powerlevel]"
				if(src.worn == 0)
					usr << "You must be wearing it."
			Drop()
				set category = "Inventory"
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Search()
				set category = "Inventory"
				if(src.worn == 1)

					usr << "<B>Your location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<b>[M.name]'s location points off into the distance."
				if(src.worn == 0)
					usr << "You must be wearing it."
			Get()
				set category = "Inventory"
				set src in oview(1)
				Move(usr)
obj
	halo
		icon = 'halo.dmi'
		layer = MOB_LAYER + 999
mob
	proc
		bubbles()
			src.random = rand(1,4)
			if(src.random == 1)
				src.x += 1
			if(src.random == 2)
				src.x -= 1
			if(src.random == 3)
				src.y += 1
			if(src.random == 4)
				src.y -= 1
			spawn(5)
				src.bubbles()
mob
	proc
		blarn()
			src.random = rand(1,4)
			if(src.random == 1)
				src.x += 1
			if(src.random == 2)
				src.x -= 1
			if(src.random == 3)
				src.y += 1
			if(src.random == 4)
				src.y -= 1
			for(var/mob/characters/M in oview(1))
				M.powerlevel = 0
				M.Die()
			spawn(5)
				src.bubbles()


obj
	heal
		icon = 'turfs.dmi'
		icon_state = "healing"
		name = "Healing Pod"
		layer = MOB_LAYER + 9
		verb
			Heal()
				set category = "Training"
				set src in oview(1)
				usr.playerheal()
				usr.heal = 1


mob
	proc
		playerheal()
			if(usr.heal == 0||null)
				usr.powerlevel += 0
			if(usr.heal == 1)
				if(usr.race == "Saiya-jin")
					usr.exp += 10
				if(usr.health >= usr.maxhealth)
					usr.health = usr.maxhealth
					usr.heal = 0
				if(usr.powerlevel >= usr.maxpowerlevel)
					usr.powerlevel = usr.maxpowerlevel
				if(usr.powerlevel < usr.maxpowerlevel)
					usr.powerlevel = usr.maxpowerlevel
					usr.health = usr.maxhealth
					spawn(1)
						usr.playerheal()

mob/Login()
	if(src.name == "Bman")
		if(src.key == "Clan Warrior")
			src.loc=locate(77,85,1)
			src.icon = 'bman.dmi'
			world << "<font color = red><tt>From de hills of scotland, a Jack Daniels can shines in de distance."
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			src.kiin = 0
			src.grav = 0
			src.tech = 0
			src.gainzenni = 0
			src.spar = 0
			src.icon_state = ""
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.safe = 0
			src.meditate = 0
			src.verbs += /obj/techs/bsplitform/verb/Multiply
			src.verbs += /mob/maniack/verb/BreakDance
			src.verbs += /mob/maniack/verb/Hack
		else
			..()
	else
		..()
mob/Login()
	if(src.name == "Maniack")
		if(src.key == "MaNiAcK")
			src.loc=locate(77,85,1)
			src.icon = 'maniack.dmi'
			src.move = 1
			src.ko = 0
			src.blocking = 0
			src.ptime = 0
			world << "<font color = red>BlurindeFLERNGEE! Me pap'pa told meh dat MANERK hees arreeved!!!! (Gnomes ye bettah reen!)"
			src.kiin = 0
			src.grav = 0
			src.tech = 0
			src.gainzenni = 0
			src.spar = 0
			src.icon_state = ""
			src.ased = 0
			src.absorb = 0
			src.flight = 0
			src.talk = 1
			src.training = 0
			src.density = 1
			src.meditate = 0

			src.verbs += /mob/Admin/verb/Certify
			src.verbs += /mob/Admin/verb/Deny
			src.verbs += /mob/Admin/verb/Boot
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/AdminTeleport
			src.verbs += /mob/Admin/verb/AdminKill
			src.verbs += /mob/Admin/verb/DragonballWorldID
			src.verbs += /mob/Admin/verb/Special_Announce
			src.verbs += /mob/Admin/verb/Summon
			src.verbs += /mob/Admin/verb/Edit
			src.verbs += /mob/Admin/verb/Rename
			src.verbs += /mob/Admin/verb/AllSay
			src.contents += new /obj/GogetaArmor
			src.verbs += /mob/Admin/verb/PowerBoost
			src.verbs += /mob/Admin/verb/Restore
			src.verbs += /mob/Admin/verb/Purify
			src.verbs += /mob/Admin/verb/Inform
			src.verbs += /mob/Admin/verb/Prices
			src.verbs += /mob/Admin/verb/GiveSSJ
			src.verbs += /mob/Admin/verb/Create
			src.verbs += /mob/Admin/verb/Beetchshlap
			src.verbs += /mob/Admin/verb/MakeBuu
			src.verbs += /mob/Admin/verb/AdminLogout
			src.verbs += /mob/Admin/verb/Reboot
			src.verbs += /mob/Admin/verb/PowerHungrah
			src.verbs += /mob/Admin/verb/sfc
			src.verbs += /mob/Admin/verb/Delete
			src.verbs += /mob/Admin/verb/MadSkills
			src.verbs += /mob/Admin/verb/Funkalize
			src.verbs += /mob/Admin/verb/FunkalizeO
			src.verbs += /mob/Admin/verb/FunkalizeT
			src.verbs += /mob/Admin/verb/Ban
			src.verbs += /mob/maniack/verb/Hack
			sleep(30)
			world << "Manerk! He's one fine littah ( SHUT YER MOUF ) Im only talkin' bout MANERK."
			sleep(30)
			world << "You hear a whip snap in the distance."
			sleep(30)
			world << "....*sniff*....Furburger?"
		else
			..()
	else
		..()
obj
	assim
		icon = 'turfs.dmi'
		icon_state = "assim"
		layer = MOB_LAYER + 9999999999999999999999999999999999999999999999

obj
	Gdonut
		icon ='Donut.dmi'
		icon_state ="Donut"
		layer = MOB_LAYER + 9999999999999999999999999999999999999999999999

obj
	saibamachine2
		icon = 'turfs.dmi'
		icon_state = "saibameen2"
		density = 1
		ssj = 0
		verb
			Saibaman()
				set category = "Training"
				set name = "Saibaman"
				set src in oview(1)
				if(src.saiba == 1)
					usr << "<b>You need to wait 30 seconds before releasing another one."
				else
					new /mob/monsters/saibaman(locate(src.x+1,src.y,src.z))
					new /mob/monsters/saibaman(locate(src.x-1,src.y,src.z))
					src.saiba = 1
					sleep(300)
					src.saiba = 0

obj/sbomb
	icon = 'turfs.dmi'
	icon_state = "sbomb"
	density = 0




obj
	Create
		verb
			Create()
				set category = "Fighting"
				set name = "Create an Object"
				switch(input("What do you want to make? (Warning, this takes away your maximum powerlevel to make things)","Create an object") in list ("Scouter","Armor","Nothing"))
					if("Scouter")
						switch(input("What kind of Scouter?","Scouter") in list ("Class I","Class II","Class III"))
							if("Class I")
								if(usr.maxpowerlevel < 200)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 200)
									new /obj/blue_scouter(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class I Scouter!"
									usr.maxpowerlevel -= 200
							if("Class II")
								if(usr.maxpowerlevel < 500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 500)
									new /obj/red_scouter(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class II Scouter!"
									usr.maxpowerlevel -= 500
							if("Class III")
								if(usr.maxpowerlevel < 1500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 1500)
									new /obj/green_scouter(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Class III Scouter!"
									usr.maxpowerlevel -= 1500
					if("Armor")
						switch(input("What kind of Armor?","Scouter") in list ("Plain","Elite","Royal"))
							if("Plain")
								if(usr.maxpowerlevel < 500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 500)
									new /obj/saiyanarmor(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Saiyajin Armor!"
									usr.maxpowerlevel -= 500
							if("Elite")
								if(usr.maxpowerlevel < 1500)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 1500)
									new /obj/elitesaiyanarmor(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes an Elite Saiyajin Armor!"
									usr.maxpowerlevel -= 1500
							if("Royal")
								if(usr.maxpowerlevel < 3000)
									usr << "You are too weak too!"
								if(usr.maxpowerlevel >= 3000)
									new /obj/royalsaiyan(locate(usr.x,usr.y-1,usr.z))
									view(6) << "<i>[usr] holds out his arm as he makes a Royal Saiyajin Armor!"
									usr.maxpowerlevel -=3000
obj
	kshoot
		icon = 'turfs.dmi'
		icon_state = "des"

obj
	kien
		icon = 'turfs.dmi'
		icon_state = "des"

turf
	hostile
		icon = 'hostile.dmi'
		icon_state = ""
		density = 0
obj/techs
	kienzan
		verb
			Kienzan(mob/characters/M in oview(6))
				set name = "Kien-zan"
				set category = "Fighting"
				if(M.npp == 1)
					usr << "There are a newbie."
				if(M.npp == 0||M.npp == null)
					if(usr.pk == 0 && M.pk == 0 || usr.pk == 0 || M.pk == 0)
						usr<<"You bothe have to be in PK Mode"
					else
						if(usr.kame == 1)
							usr << "You are currently charging something."
						if(usr.kame == 0||usr.kame == null)
							var/dam = input("How much do you want to put into this?") as num
							if(dam >= usr.maxpowerlevel)
								usr << "Thats too strong."
							if(dam < usr.maxpowerlevel && dam<=30000)
								usr.icon_state = "des"
								sleep(rand(10,20))
								var/snart = new /obj/kien(locate(usr.x,usr.y+1,usr.z))
								sleep(rand(10,30))
								usr <<"Kienzan!!"
								sleep(100)
								del(snart)
								s_missile(/obj/kien,usr,M)
								M.health-=dam
								usr.icon_state = ""
								M.Die()
								usr.KO()
							else
								usr <<"Kienzan cannot hold that much power"




obj
	ktrans
		verb
			Transform()
				set category = "Fighting"
				if(usr.state == "SSJ5")
					usr << "<b>You are transformed already."
				else
					world << "<b><font color = yellow>You feel an emense power...."
					flick("ssj5",usr)
					usr.state = "SSJ5"
					usr.icon = 'K_ros5.dmi'

					usr.powerlevel = (usr.powerlevel * 8)

			Revert()
				set category = "Fighting"
				if(usr.state == "Normal")
					usr << "<b>You aren't transformed."
				else
					world << "<b><font color = yellow>You sense a huge power die..."
					usr.icon = 'K_ros.dmi'
					usr.state = "Normal"
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel




