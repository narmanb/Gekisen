mob
	proc
		ffchc()
			set background = 1
			spawn(1)
				while(ffcht > 0)
					sleep(600)
					ffcht--
					if(ffcht <= 0)
						src << "<B>You can now use your Solar Flare, Time Freeze, Final Flash and/or Chou Kamehameha technique again!"
						ffcht = 0
						if(tayio )
							tayio = 0
						break
		timefreeze()
			set background = 1
			spawn()
				while(frozen > 0)
					sleep(50)
					ffcht--
					if(ffcht <= 0)
						frozen = 0
						move = 1
						attacking = 0
						client.show_verb_panel = 1
						hideipan = 0
						kame = 0
						src << "<B>You can now move again!"
						break

		absorbcount()
			set background = 1
			spawn(1)
				while(absorbed > 0)
					for(var/obj/techs/playerabsorb/a)
						a.icon_state = "oabs"
					for(var/obj/techs/buuabs/b)
						b.icon_state = "obuuabs"
					absorbed--
					sleep(600)
					if(absorbed <= 0)
						for(var/obj/techs/playerabsorb/a)
							a.icon_state = "abs"
						for(var/obj/techs/buuabs/b)
							b.icon_state = "buuabs"
						usr << "<B>You can now use your Absorb/Eat technique again!"
						absorbed = 0
						break



obj
	techs
		spiritbomb
			name = "Spirit Bomb"
			icon = 'icons/techhands.dmi'
			icon_state = "sbomb"
			Click()


				if(usr.sbcharge )
					alert("You can't use 'Spirit Bomb' your already using it.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Spirit Bomb' while using Zanzoken.")
					else
						if(usr.dead==0)
							var/stage = 1
							var/obj/O = new/obj/sbomb(locate(usr.x,usr.y+2,usr.z))
							usr.icon_state = "sbomb"
							usr.sbcharge = 1
							usr.kame = 1
							usr.frozen = 1
							usr.client.show_verb_panel = 0
							usr.hideipan = 1
							usr.attacking = 1
							usr.especial = 1
							usr.sbombenergy(O)
							usr.sbombenergy(O)
							view(30) << "<FONT COLOR = red>[usr]: </FONT>LET ME HAVE SOME OF YOUR ENERGY.."
							view(30)<< 'sounds/sb_charge.wav'
							start
							if(usr.dead==0)
								var/currentpower=(O:power*1.25)
								currentpower=round(currentpower)
								usr.icon_state = "sbomb"
								usr.move = 0
								if(stage == 5)
									var/opow = O:power
									del(O)
									O = new/obj/smsbombprojectile(locate(usr.x,usr.y+2,usr.z))
									O:power = opow
									O:power += 1000
									oview(6) << "<B><FONT COLOR = BLUE>[usr]'s Spirit Bomb increases in size!"
									usr << "<B><FONT COLOR = BLUE>Your Spirit Bomb increases in size!"
									view(6) << 'sounds/sbombbump.wav'
									usr.sbombenergy(O)
									usr.sbombenergy(O)
								if(stage == 10)
									var/opow = O:power
									del(O)
									O = new/obj/msbombprojectile(locate(usr.x,usr.y+2,usr.z))
									O:power = opow
									O:power += 10000
									oview(6) << "<B><FONT COLOR = BLUE>[usr]'s Spirit Bomb increases in size!"
									usr << "<B><FONT COLOR = BLUE>Your Spirit Bomb increases in size!"
									view(6) << 'sounds/sbombbump.wav'
									usr.sbombenergy(O)
									usr.sbombenergy(O)
								if(stage == 15)
									var/opow = O:power
									del(O)
									O = new/obj/sbombprojectile(locate(usr.x,usr.y+2,usr.z))
									O:power = opow
									O:power += 100000
									oview(6) << "<B><FONT COLOR = BLUE>[usr]'s Spirit Bomb increases in size!"
									usr << "<B><FONT COLOR = BLUE>Your Spirit Bomb increases in size!"
									view(6) << 'sounds/sbombbump.wav'
									usr.sbombenergy(O)
									usr.sbombenergy(O)
								if(usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2")
									usr.sbcharge = 0
									usr.especial = 0
									usr.kame = 0
									usr.frozen = 0
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									usr.attacking = 0
									usr.powerlevel.value += (O:power*1.25)
									usr.ki.value += (O:power*1.25)
									view(30) << 'sounds/db_fire.wav'
									sleep(8)
									del(O)
									var/obj/E = new/obj/sbombprojectile(locate(usr.x,usr.y+1,usr.z))
									sleep(8)
									del(E)
									var/obj/F = new/obj/sbombprojectile(locate(usr.x,usr.y,usr.z))
									sleep(8)
									view(30) << 'sounds/ssj_trans3.wav'
									view(30) << "<B><FONT COLOR = BLUE>[usr] begins to absorb the Spirit Bomb into himself!"
									sleep(65)
									view(30) << "<B><FONT COLOR = BLUE>[usr] has absorbed the power of the Spirit Bomb!"
									view(30) << 'sounds/ssj_trans2.wav'
									usr << "<FONT COLOR = BLUE>This powerup only lasts for 30 seconds."
									del(F)
									var/obj/ssbombprojectile/A = new(null)
									usr.overlays += A
									usr.underlays -= /obj/SSAuraBottom
									usr.overlays -= /obj/SSAuraTop
									usr.overlays -= 'icons/elec.dmi'
									usr.move = 1
									usr.sbcharge = 1
									usr.icon_state = ""
									spawn(300)
										if(usr.powerlevel.value >= usr.powerlevel.max_value)
											usr.powerlevel.restore()
										if(usr.ki.value >= usr.ki.max_value)
											usr.ki.value = usr.ki.max_value
										view(30) << "<B><FONT COLOR = BLUE>[usr] has reverted from the absorbed Spirit Bomb."
										usr.overlays -= A
										usr.underlays += new /obj/SSAuraBottom
										usr.overlays += new /obj/SSAuraTop
										usr.icon_state = ""
										view(6) << 'sounds/revert.wav'
										usr.sbcharge = 0
										if(usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2")
											usr.overlays += 'icons/elec.dmi'
									return
								switch(alert("Do you wish to gather power for the Spirit Bomb, from yourself and others? (Only those with the same alignment as yours will donate energy.)","Spirit Bomb (Power: [num2text(currentpower,100)])","Yes","No","Cancel"))
									if("Yes")
										if(usr.ki.value>=1)
											var/KI=(usr.ki.value*0.025)
											O:power+=KI*(usr.focus.value*2)/usr.focus.max_value
											usr.ki.value-=KI
											usr.ki.value=round(usr.ki.value)
											O:power=round(O:power)
											O:name="Spirit Bomb (Power: [num2text(currentpower,100)])"
											if(stage>=0)
												stage+=1
											usr<<"<B><FONT COLOR = BLUE>You place your energy into the Spirit Bomb."
										else
											usr<<"<B><FONT COLOR = BLUE>You have no more energy to place into the Spirit Bomb."
											usr.ki.value=0
										for(var/mob/F in players)
											if(F!=usr)
												if(F.z==usr.z)
													if(F.ki.value>=1)
														if(usr.ap > 25 && F.ap > 25 || usr.ap < -25 && F.ap < -25 || usr.ap <= 25 && usr.ap >= -25 && F.ap <= 25 && F.ap >= -25)
															F.gatherenergy(usr, O)
										var/TEnergy = 0
										for(var/turf/T in oview(150))
											if(T.z == usr.z)
												if(T.gatherable )
													if(T.ki >= 1)
														TEnergy = 1
														var/TKi=(T.ki * 0.75)
														TKi = round(TKi)
														O:power+=TKi*(usr.focus.value*2)/usr.focus.max_value
														T.ki-=TKi
														T.ki=round(T.ki)
														T.ki+=(TKi*0.25)

										if(TEnergy )
											usr << "<FONT COLOR = BLUE><B>You recieve energy from trees, grass, and other surrondings."
										O:power=round(O:power)
										sleep(15)
										goto start

									if("No")
										switch(alert("Are you sure you want to throw the Spirit Bomb?","Spirit Bomb","Yes","No"))
											if("Yes")
												usr.move = 1
												usr.sbcharge = 0
												usr.especial = 0
												usr.kame = 0
												usr.frozen = 0
												usr.client.show_verb_panel = 1
												usr.hideipan = 0
												usr.attacking = 0
												view(25) << 'sounds/sb_shoot.wav'
												view(25) << "<FONT COLOR = red>[usr]: </FONT>SPIRIT BOMB!!!"
												usr.icon_state=""
												var/obj/spiritbomb/blast = new(usr.loc, usr)
												if(stage >= 5)
													blast.icon = 'icons/spiritbomb/sbomb00.dmi'
													blast.icon_state = "big"
												else
													blast.icon = O.icon
													blast.icon_state = O.icon_state
												blast.overlays = O.overlays
												blast.power = currentpower
												blast.killedBy = usr
												blast.dir = usr.dir
												walk(blast,usr.dir)
												del(O)
											else
												goto start

									if("Cancel")
										del(O)
										usr.icon_state = ""
										usr.move = 1
										usr.sbcharge = 0
										usr.especial = 0
										usr.kame = 0
										usr.frozen = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr.attacking = 0
						else
							alert("You can't use this attack while dead!")

mob
	proc
		gatherenergy(var/mob/characters/owner, var/obj/spiritbomb/sbomb)
			set background = 1
			spawn(1)
				var/alert/ale = new(60)
				switch(ale.Alrt(src, "Do you want to donate energy to [owner]'s Spirit Bomb?","Spirit Bomb","Yes", "No"))
					if("Yes")
						if(sbomb)
							if(src.ki.value>=1)
								var/KI=(src.ki.value*0.025)
								sbomb:power+=KI*(owner.focus.value*2)/owner.focus.max_value
								src.ki.value-=KI
								src.ki.value=round(src.ki.value)
								sbomb:power=round(sbomb:power)
								src<<"<B><FONT COLOR = BLUE>[owner] takes energy from you and puts it into the Spirit Bomb."
								owner<<"<B><FONT COLOR = BLUE>[src] gives you energy to put into the Spirit Bomb."
							else
								src<<"<B><FONT COLOR = BLUE>You try to give energy to [owner]'s Spirit Bomb, but you have no more!"
								..()
						else
							return


obj
	spiritbomb
		name = "Spirit Bomb"
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon )
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle:expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,4)
					Obstacle.Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,4)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,4)
				del(src)

obj
	techs
		deathb
			name = "Death Ball"
			icon = 'icons/techhands.dmi'
			icon_state = "dball"
			Click()


				if(usr.zanzoken )
					alert("You can't use 'Death Ball' while using Zanzoken.")
				else
					if(usr.kame )
						usr << "You are firing something already."
					if(usr.kame == 0)
						usr.kame = 1
						var/dam = input("How much energy do you wish to put into the Death Ball? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
						if(dam <= 0)
							alert("You can't put that amount of Ki into that attack.")
							usr.kame = 0
						else
							if(dam > usr.ki.max_value)
								alert("You can't put that amount of Ki into that attack, because you don't have that much.")
								usr.kame = 0
							else
								if(dam <= usr.ki.max_value)
									usr.icon_state = "sbomb"
									usr.ki.value -= dam
									view(25) << 'sounds/db_charge.wav'
									var/obj/deathball = new /obj/dballprojectile(locate(usr.x,usr.y+2,usr.z))
									usr.attacking = 1
									usr.frozen = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.move = 0
									sleep(85)
									view(50) << 'sounds/db_fire.wav'
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									usr.kame = 0
									usr.move = 1
									usr.attacking = 0
									usr.frozen = 0
									usr.icon_state = ""
									view(6) << "<FONT COLOR = RED>[usr]:</FONT> DEATH BALL!!!"
									var/obj/dball/blast = new(usr.loc, usr.dir)
									blast.power = (dam * (usr.focus.value*6)/usr.focus.max_value)
									blast.killedBy = usr
									blast.overlays = deathball.overlays
									blast.underlays = deathball.underlays
									blast.icon = 'icons/deathball/dball00.dmi'
									blast.dir = usr.dir
									walk(blast,usr.dir)
									del(deathball)
									sleep(1)
									usr.move = 1
obj
	dball
		name = "Death Ball"
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon )
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle.expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
					Obstacle:Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,3)
				del(src)
obj
	spells
		spshf
			name = "Shape Shift"
			icon = 'icons/techhands.dmi'
			icon_state = "shp1"
			Click()


				if(usr.zanzoken )
					alert("You can't use 'Shape Shift' while using Zanzoken.")
				else
					switch(input("Which race do you wish to shape-shift into?", "Shape Shift", text) in list ("Earthling","Half-Saiyan","Saiyan","Namek","Android (Mechanical)","Android (Biological)","Changling","Original Form"))
						if("Earthling")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Earthling."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Buu (Shape: Earthling)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Half-Saiyan")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Half-Saiyan."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Buu (Shape: Half-Saiyan)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Saiyan")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Saiyan."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Buu (Shape: Saiyan)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Namek")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Namek."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/namek.dmi'
								usr.race = "Buu (Shape: Namek)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Android (Mechanical)")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Mechanical Android."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/bioandroid-two.dmi'
								usr.race = "Buu (Shape: Mechanical Android)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Android (Biological)")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Biological Android."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/biocell1.dmi'
								usr.race = "Buu (Shape: Biological Android)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Changling")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Changling."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/changling.dmi'
								usr.race = "Buu (Shape: Changling)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Original Form")
							view(6) << "<font color = red>[usr] shape-shifts back into it's original form."
							flick("shift",usr)
							usr.icon = 'icons/buu.dmi'
							usr.race = "Buu"
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.wizspell == null)
						usr.wizspell = 0
					usr << "You have [usr.wizspell] minutes left before casting a spell again"
obj
	spells
		spshf2
			name = "Shape Shift"
			icon = 'icons/techhands.dmi'
			icon_state = "shp2"
			Click()


				if(usr.zanzoken )
					alert("You can't use 'Shape Shift' while using Zanzoken.")
				else
					switch(input("Which race do you wish to shape-shift into?", "Shape Shift", text) in list ("Earthling","Half-Saiyan","Saiyan","Namek","Android (Mechanical)","Android (Biological)","Changling","Original Form"))
						if("Earthling")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Earthling."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Wizard (Shape: Earthling)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Half-Saiyan")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Half-Saiyan."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Wizard (Shape: Half-Saiyan)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Saiyan")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Earthling."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/male.dmi'
								usr.race = "Wizard (Shape: Saiyan)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Namek")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Namek."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/namek.dmi'
								usr.race = "Wizard (Shape: Namek)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Android (Mechanical)")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Mechanical Android."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/bioandroid-two.dmi'
								usr.race = "Wizard (Shape: Mechanical Android)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Android (Biological)")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Biological Android."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/biocell1.dmi'
								usr.race = "Wizard (Shape: Biological Android)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Changling")
							if(usr.shapeshifted == 0)
								view(6) << "<font color = red>[usr] shape-shifts into a Changling."
								flick("shift",usr)
								usr.shapeshifted = 1
								usr.icon = 'icons/changling.dmi'
								usr.race = "Wizard (Shape: Changling)"
								usr.wizspell += 5
								usr.wizcount()
							else
								alert("You can't shapeshift, you must wait 5 minutes.")
						if("Original Form")
							view(6) << "<font color = red>[usr] shape-shifts back into it's original form."
							flick("shift",usr)
							usr.icon = 'icons/wizard.dmi'
							usr.race = "Wizard"

			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.wizspell == null)
						usr.wizspell = 0
					usr << "You have [usr.wizspell] minutes left before casting a spell again"
obj
	techs
		bt
			name = "Bunkai Teleport"
			icon = 'icons/techhands.dmi'
			icon_state = "it"
			Click()
				if(usr.ap > 0)
					alert("You can't use this!")
					return
				else if(usr.z == 10)
					usr << "<B>You can't use Bunkai Teleport here!"
				else if(usr.dead)
					usr<<"<b>You can't while dead."
				else if(usr.kame)
					alert("You cannot use Bunkai Teleport while using another technique.")
				else
					var/text=input("Input a name to approach.","Bunkai Teleport")
					for(var/mob/M)
						if(M.name==text)
							if(!text)
								usr<<"<b>You could not sense their power."
								return
							else if(M==usr)
								return
							else if(M.z == 10||M.z == 20||M.z == 8||M.z == 3||M.z == 2||M.dead||M.itinvis||M.ccuse||M.hbtcuse||M.z == 15||M.z == 18||M.z == 23)
								usr << "<B>[M] is too far away."
							else if(!M.dead)
								usr<<"<b>You appear before [M]!"
								usr.grav = 0
								view(6) << 'sounds/it2.wav'
								for(var/mob/characters/P in range(1))
									if(P==usr)
										M<<"<b>[usr] blurs in front of you."
										P.loc=locate(M.x,M.y-1,M.z)
										..()
									else if(!P.npp)
										P.loc=locate(M.x,M.y+1,M.z)
										P<<"<b>[usr] brings you to [M] with Bunkai Teleport."
										P.grav = 0
									else
										usr<<"<b>You can't bring [P] with you."
							else
								usr << "<B>[M] is too far away."
obj
	techs
		it
			name = "Instant Transmission"
			icon = 'icons/techhands.dmi'
			icon_state = "it"
			Click()
				if(usr.ap < 0)
					alert("You can't use this!")
					return
				else if(usr.z == 10)
					usr << "<B>You can't use Instant Transmission here!"
				else if(usr.dead)
					usr<<"<b>You can't while dead."
				else if(usr.kame)
					alert("You cannot use Instant Transmission while using another technique.")
				else
					var/text=input("Input a name to approach.","Instant Transmission")
					for(var/mob/M)
						if(M.name==text)
							if(!text)
								usr<<"<b>You could not sense their power."
								return
							else if(M==usr)
								return
							else if(M.z == 10||M.z == 20||M.z == 8||M.z == 3||M.z == 2||M.dead||M.itinvis||M.ccuse||M.hbtcuse||M.z == 15||M.z == 18||M.z == 23)
								usr << "<B>[M] is too far away."
							else if(!M.dead)
								usr<<"<b>You appear before [M]!"
								usr.grav = 0
								view(6) << 'sounds/it2.wav'
								for(var/mob/characters/P in range(1))
									if(P==usr)
										M<<"<b>[usr] blurs in front of you."
										P.loc=locate(M.x,M.y-1,M.z)
									else if(!P.npp)
										P.loc=locate(M.x,M.y+1,M.z)
										P<<"<b>[usr] brings you to [M] with Bunkai Teleport."
										P.grav = 0
									else
										usr<<"<b>You can't bring [P] with you."
							else
								usr << "<B>[M] is too far away."

obj
	techs
		worldscan
			name = "World Sense"
			icon = 'icons/techhands.dmi'
			icon_state = "sense"
			Click()
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<b>------------------"
						usr << "<b><font color = blue>[M]:<font color = red> [M.powerlevel.value] Powerlevel"
						usr << "<b><font color = blue>[M]:<font color = red> [M.ki.value] Ki"
						usr << "<b><font color = blue>[M]: Location: ([M.x],[M.y])"






obj
	techs
		regen
			name = "Regeneration"
			icon = 'icons/techhands.dmi'
			icon_state = "sense"
			Click()
				if(usr.regen )
					usr << "<B>You begin to feel that you have stopped healing."
					view(4) << sound('sounds/blank.wav',0)
					usr.regen = 0
				else
					if(usr.powerlevel.value >= usr.powerlevel.max_value)
						alert("You can't regenerate, because your at full power.")
					else
						usr << "<B>You begin to feel yourself healing."
						view(4) << sound('sounds/regen.wav',1)
						usr.regen = 1
						usr.regencheck()

obj
	techs
		techwork
			name = "Technical Workings"
			icon = 'icons/techhands.dmi'
			icon_state = "sense"
			Click()
				if(usr.tech )
					usr << "<B>You turn OFF your Technical Workings."
					view(4) << sound('sounds/blank.wav',0)
					usr.tech = 0
				else
					if(usr.powerlevel.value >= usr.powerlevel.max_value)
						alert("You can't use Technical Workings, because your at full health.")
					else
						usr << "<B>You turn ON your Technical Workings."
						view(4) << sound('sounds/regen.wav',1)
						usr.tech = 1
						usr.techcheck()

obj
	techs
		wrap
			name = "Wrap"
			icon = 'icons/techhands.dmi'
			icon_state = "held1"
			Click()
				var/mob/Target=input("Select a target.","Wrap","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(M.npc )
						usr << "<B>You can't use this technique aganist a NPC."
					else
						if(usr.zanzoken )
							alert("You can't use 'Wrap' while using Zanzoken.")
						else
							if(usr.ased )
								usr << "<B>You have already used this technique recently."
							if(usr.ased == 0)
								if(usr.flight )
									alert("You are flying, you can't use this technique.")
								if(usr.flight == 0)
									usr.ased = 1
									M.kiloc = M.loc
									s_missile('icons/assimilate.dmi',usr,M)
									view(6) << "<B><FONT COLOR = RED>[usr.name] launches an Wrap attack at [M.name]!"
									sleep(5)
									if(M.loc == M.kiloc)
										view(6) << "<B><FONT COLOR = RED>[M] is being held by [usr]'s Wrap technique!"
										sleep(5)
										M.move = 0
										M.kame = 1
										M.attacking = 1
										M.frozen = 1
										if(M.client)
											M.client.show_verb_panel = 0
											M.hideipan = 1
										M.overlays += /obj/assim
										sleep(300)
										usr.ased = 0
										if(!M) return
										M.overlays -= /obj/assim
										M.move = 1
										M.frozen = 0
										M.attacking = 0
										M.kame = 0
										if(M.client)
											M.client.show_verb_panel = 0
											M.hideipan = 1
									else
										view(6) << "<font color = blue><i>[M] had stepped out of the way, causing the wrap to go by him!"
										usr.ased = 0
				else
					usr << "<B>Target has gone out of sight or there isn't any targets near!"

obj
	techs
		kiabsorb
			name = "Ki Absorb"
			icon = 'icons/techhands.dmi'
			icon_state = "kiabs"
			Click()
				if(usr.flight )
					usr << "<b>You can't use this technique while flying."
				if(usr.flight == 0)
					if(usr.absorb )
						usr << "<b>You are already waiting to absorb energy."
					if(usr.absorb == 0)
						usr.client.show_verb_panel = 0
						usr.hideipan = 1
						view(6) << "<b><font color = red>[usr.name] holds out his/hers hand, and gets ready to absorb energy."
						usr.absorb = 1
						usr.attacking = 1
						usr.frozen = 1
						usr.move = 0
						if(usr.kabsorbt ==null)
							usr.kabsorbt = rand(3000,6000)
						usr.kabsorbcount()
						sleep(75)
						usr.client.show_verb_panel = 1
						usr.hideipan = 0
						usr << "<B><FONT COLOR = RED>You stop absorbing."
						usr.move = 1
						usr.attacking = 0
						usr.frozen = 0
						usr.absorb = 0
mob
	proc
		kabsorbcount()
			spawn(1)
				set background = 1
				while(src.kabsorbt > 0)
					src.kabsorbt--
					sleep(600)
					if(src.kabsorbt <= 0)
						src << "<B>You have lost the power from your ki absorbtion!"
						src.kabsorbt = null
						if(src.powerlevel.value >= src.powerlevel.max_value)
							src.powerlevel.value = src.powerlevel.max_value
						break
obj
	techs
		bukujutsu
			name = "Bukujustu (Fly)"
			icon = 'icons/techhands.dmi'
			icon_state = "fly"
			Click()
				if(usr.flight )
					usr << "<B>You begin to land."
					viewers() << 'sounds/buku_land.wav'
					usr.move = 0
					usr.loc=locate(usr.x,usr.y-3,usr.z)
					var/obj/bukuspot/B = new(null)
					usr.overlays -= B
					usr.move = 1
					usr.density = 1
					usr.flight = 0
					usr.meditate = 0
					usr.rest = 0
					usr.icon_state = ""
				else if(usr.ki.value >= 2)
					usr << "<B>You begin to achieve flight."
					viewers() << 'sounds/buku.wav'
					usr.icon_state = "buku"
					usr.move = 0
					usr.loc=locate(usr.x,usr.y+3,usr.z)
					var/obj/bukuspot/A = new(null)
					usr.overlays += A
					usr.density = 0
					usr.flight = 1
					usr.meditate = 0
					usr.rest = 0
					usr.move = 1
					usr.flight()
				else
					alert("You do not have enough Ki to fly.")

mob/proc
	flight()
		spawn()
			set background = 1
			while(flight && !usr.kiultra)
				sleep(15)
				usr.ki.value -= 2
				if(usr.ki.value < 2)
					if(usr.loc.type in list(/turf/cloud,/turf/cloudtwo,/turf/sky,/turf/sky2))
						usr << "<B>Your ki has run out, and you fall into hell!"
						usr.loc = locate(74,76,8)
						usr.underlays -= /obj/bukuspot
						view(6) << 'sounds/buku_land.wav'
						usr.density = 1
						usr.flight = 0
						usr.meditate = 0
						usr.ki.value = 0
						usr.rest = 0
						usr.icon_state = ""
					else
						usr << "<B>Your ki has run out, so you land."
						usr.loc=locate(usr.x,usr.y-3,usr.z)
						usr.underlays -= /obj/bukuspot
						view(6) << 'sounds/buku_land.wav'
						usr.density = 1
						usr.flight = 0
						usr.meditate = 0
						usr.ki.value = 0
						usr.rest = 0
						usr.icon_state = ""

obj
	techs
		auraup
			name = "Power Up"
			icon = 'icons/techhands.dmi'
			icon_state = "pwup"
			Click()
				if(usr.ptime )
					alert("You need to wait, before using this skill again.")
				else if(usr.stamina.value < 2)
					alert("You are too tired to power up.")
				else if(usr.powerlevel.toPercent() < 100)
					usr << "<b>You begin to power up.</b>"
					usr.ptime = 1
					var/icon/aura = new('icons/whiteaura.dmi')
					aura.Blend(usr.customauracolor)
					if(usr.state == "Normal")
						usr.auratoggle = 1
						usr.underlays += aura
					while(usr.stamina.value >= 2 && usr.powerlevel.toPercent() < 100)
						usr.stamina.value--
						usr.powerlevel.add(usr.powerlevel.max_value/100)
						sleep(14)
					usr.underlays -= aura
					usr.auratoggle = 0
					usr << "<b>You finish powering up.</b>"
					spawn(300)
						usr.ptime = 0

obj
	techs
		auradn
			name = "Power Down"
			icon = 'icons/techhands.dmi'
			icon_state = "pwdn"
			Click()
				var/amount = input("What powerlevel do you wish to powerdown to?", "Power Down") as num|null
				if(amount >= usr.powerlevel.value)
					usr << "<b>You must power-up for that."
				if(amount < usr.powerlevel.value)
					if(amount < 0)
						usr << "<b>You dont want to die, do you?"
					if(amount >= 1)
						usr << "<b>You lower your powerlevel to <font color = blue>[amount]</font>."
						oview(20) << "<B><font color = blue>You sense a powerlevel drop in the distance."
						usr.powerlevel.value = amount
						usr.underlays -= 'icons/whiteaura.dmi'
						usr.underlays -= /obj/whiteaura

obj
	techs
		focus
			name = "Focus"
			icon = 'icons/techhands.dmi'
			icon_state = "foc"
			Click()
				var/icon/aura = new('icons/whiteaura.dmi')
				aura.Blend(usr.customauracolor)
				if(usr.ptime )
					alert("You can't use this now.")
				if(usr.ptime == 0)
					if(usr.flight )
						alert("You are flying!")
					if(usr.flight == 0)
						if(usr.focused )
							alert("You are already focusing!")
						if(usr.focused == 0)
							var/amount = input("Input a amount of Ki you wish to focus into.", "Focus") as num|null
							if(amount > usr.ki.max_value||amount < 0)
								alert("You can't focus to that amount of Ki.")
							if(amount <= usr.ki.max_value)
								usr.client.show_verb_panel = 0
								usr.hideipan = 1
								usr << "<font color = red><B>You begin to focus your Ki."
								oview(6) << "<FONT COLOR = RED><B>[usr] begins to focus their Ki."
								usr.icon_state = "meditate"
								usr.move = 0
								usr.focused = 1
								sleep(rand(75,500))
								usr.underlays += aura
								view(6) << 'sounds/aura.wav'
								usr << "<font color = red><B>Ki begins to enter your body!"
								oview(6) << "<FONT COLOR = RED><B>Ki begins to enter [usr]'s body!"
								sleep(rand(25,100))
								usr.ki.value = amount
								usr.move = 1
								usr.focused = 0
								usr.icon_state = ""
								usr.underlays -= aura
								usr.client.show_verb_panel = 1
								usr.hideipan = 0
								view(6) << 'sounds/revert.wav'
								usr << "<font color = RED><B>You have focused the amount of Ki you wanted."
								oview(6) << "<FONT COLOR = RED><B>[usr] is done focusing."

mob/var/fform = 0

obj
	techs
		fform
			name = "Flame Form"
			icon = 'icons/techhands.dmi'
			icon_state = "fform"
			Click()
				if(usr.fform == 0)
					usr.fform = 1
					usr << "<B>You begin to power-up!"
					usr.icon_state = "ssj"
					usr.move = 0
					usr.dspecial = 1
					usr.flyingrocks()
					sleep(rand(25,100))
					view(6) << 'sounds/aura.wav'
					usr.move = 1
					usr.icon_state = ""
					usr.overlays += /obj/FAuraTop
					usr.overlays += /obj/FAuraBottom
					usr.powerlevel.value += 350000
					usr.ki.value += 350000
				else
					if(usr.fform )
						usr << "<B>You begin to power-down!"
						usr.dspecial = 0
						sleep(rand(25,100))
						view(6) << 'sounds/revert.wav'
						usr.overlays -= /obj/FAuraTop
						usr.overlays -= /obj/FAuraBottom
						usr.fform = 0
						if(usr.powerlevel.value < usr.powerlevel.max_value)
							usr.powerlevel.value += 0
						if(usr.powerlevel.value >= usr.powerlevel.max_value)
							usr.powerlevel.value = usr.powerlevel.max_value
						if(usr.ki.value < usr.ki.max_value)
							usr.ki.value += 0
						if(usr.ki.value >= usr.ki.max_value)
							usr.ki.value = usr.ki.max_value
obj
	techs
		Kaioken
			name = "Kaio-ken"
			icon = 'icons/techhands.dmi'
			icon_state = "kk"
			Click()
				if(usr.state != "Normal" && usr.state != "Super Saiyan" && usr.state != "Ultra Super Saiyan" && usr.state != "Semi-Perfect Form" && usr.state != "Perfect Form")
					alert("Please revert to use this command")
				else
					usr.transforming = 1
					var/maxkaioken = (usr.powerlevel.max_value / 3750)
					maxkaioken = round(maxkaioken)
					if(maxkaioken > 100)
						maxkaioken = "100"
					if(usr.kaiokuse)
						alert("You may not use KaioKen again yet")
					else
						usr.kaiokuse = 1
						var/amount = input("Please input an amount for Kaio-ken. (Your highest level of Kaio-ken is [maxkaioken]!)") as num|null
						if(!amount || amount <= 1)
							if(usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan")
								usr << "<B><FONT COLOR = RED>You begin to release Super Kaio-ken!"
								sleep(rand(25,100))
								view(6) << 'sounds/revert.wav'
								usr.kaioken = 0
								usr.overlays -= /obj/kkauratop
								usr.underlays -= /obj/kkaurabottom
								usr << "<B><FONT COLOR = RED>You have reverted from Super Kaio-ken!"
								if(usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2")
									usr.dspecial = 1
									usr.flyingrocks()
									usr.overlays += 'icons/elec.dmi'
								if(usr.powerlevel.value < usr.powerlevel.max_value)
									usr.powerlevel.value += 0
								if(usr.powerlevel.value >= usr.powerlevel.max_value)
									usr.powerlevel.value = usr.powerlevel.max_value
								if(usr.ki.value < usr.ki.max_value)
									usr.ki.value += 0
								if(usr.ki.value >= usr.ki.max_value)
									usr.ki.value = usr.ki.max_value
							else
								usr.kaiokuse = 0
								usr << "<B><FONT COLOR = RED>You begin to release Kaio-ken!"
								sleep(rand(25,100))
								view(6) << 'sounds/revert.wav'
								usr.kaioken = 0
								usr.dspecial = 0
								usr.overlays -= /obj/kkauratop
								usr.underlays -= /obj/kkaurabottom
								usr.transforming = 0
								usr.kaiokuse = 0
								usr << "<B><FONT COLOR = RED>You have reverted from Kaio-ken!"
								if(usr.powerlevel.value < usr.powerlevel.max_value)
									usr.powerlevel.value += 0
								if(usr.powerlevel.value >= usr.powerlevel.max_value)
									usr.powerlevel.value = usr.powerlevel.max_value
								if(usr.ki.value < usr.ki.max_value)
									usr.ki.value += 0
								if(usr.ki.value >= usr.ki.max_value)
									usr.ki.value = usr.ki.max_value
						else
							if(amount > 100)
								usr.kaiokuse = 0
								alert("Kaio-ken can't be used past the 100th level!")
							else
								if(amount >= 1)
									if(amount > (usr.powerlevel.max_value / 3750))
										view(6) << "<b>[usr] explodes from the use of Kaioken!"
										usr.kaiokuse = 0
										usr.powerlevel.value = 0
										usr.transforming = 0
										usr.kaiokuse = 0
										usr.ki.value = 0
										usr.Die()
										usr << "You have died, you have exploded from the use of Kaio-ken."
									if(amount <= (usr.powerlevel.max_value / 3750))
										if(usr.kaioken )
											alert("You are already using Kaio-ken!")
											usr.kaiokuse = 0
										if(usr.kaioken == 0)
											if(usr.state == "Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2")
												usr.move = 0
												usr.dspecial = 1
												usr.icon_state = "ssj"
												usr.transforming = 1
												usr.kaiokuse = 0
												usr.overlays += 'icons/wind.dmi'
												view(6) << 'sounds/skaioken.wav'
												view(6) << "<font color = red>[usr]:</FONT> SUPER KAIOKEN TIMES [amount]!!!"
												sleep(27)
												usr.flyingrocks()
												view(6) << 'sounds/aura.wav'
												usr << "<B><FONT COLOR = RED>A red aura surrounds your body, giving you great power!"
												usr.icon_state = ""
												usr.move = 1
												usr.underlays.Cut()
												usr.overlays -= 'icons/elec.dmi'
												usr.overlays += /obj/kkauratop
												usr.underlays += /obj/kkaurabottom
												usr.overlays -= 'icons/wind.dmi'
												usr.kaioken = 1
												amount = round(amount)
												usr.powerlevel.value += (amount * 18000 * (usr.focus.value*2)/usr.focus.max_value)
												usr.ki.value += (amount * 8000 * (usr.focus.value*2)/usr.focus.max_value)
												usr.stamina.value -= (rand(1,30))
												usr.kaiokuse = 0
												usr.kaiokenstrain()
											else
												usr.move = 0
												usr.icon_state = "ssj"
												amount = round(amount)
												view(6) << 'sounds/kaioken.wav'
												view(6) << "<FONT COLOR = RED>[usr]:</FONT> KAIOKEN TIMES [amount]!!!"
												usr.dspecial = 1
												sleep(27)
												usr << "<B><FONT COLOR = RED>A red aura surrounds your body, giving you great power!"
												view(6) << 'sounds/aura.wav'
												usr.flyingrocks()
												usr.icon_state = ""
												usr.move = 1
												usr.transforming = 0
												usr.kaiokuse = 0
												usr.overlays += /obj/kkauratop
												usr.underlays += /obj/kkaurabottom
												usr.overlays -= 'icons/wind.dmi'
												usr.kaioken = 1
												usr.powerlevel.value *= amount/100+(usr.focus.value*2)/usr.focus.max_value
												usr.ki.value *= amount/100+(usr.focus.value*2)/usr.focus.max_value
												usr.stamina.value -= (rand(1,30))
												usr.kaiokenstrain()
												usr.kaiokuse = 0
										else
											usr.powerlevel.value += 0

obj
	kame
		icon = 'icons/turfs.dmi'
		icon_state = "Kame"
		layer = 9

obj
	er1
		icon = 'icons/cki.dmi'
		icon_state = "er1"
		layer = 9
	er2
		icon = 'icons/cki.dmi'
		icon_state = "er2"
		layer = 9
obj
	ccki1
		icon = 'icons/cki.dmi'
		icon_state = ""
		layer = 9

obj
	ccki2
		icon = 'icons/cki.dmi'
		icon_state = "2"
		layer = 9
obj
	techs
		Kamehameha
			name = "Kamehameha"
			icon = 'icons/techhands.dmi'
			icon_state = "kame"
			Click()


				if(usr.kame )
					alert("You can't use 'Kamehameha' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Kamehameha' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.kame = 1
									usr.frozen = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.ki.value -= amount
									view(6) << "<font color = red>[usr]:<font color = black> KA.."
									view(6) << 'sounds/ka.wav'
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									view(6) << 'sounds/me.wav'
									usr.overlays += /obj/kame
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> HA.."
									view(6) << 'sounds/ha.wav'
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									view(6) << 'sounds/me2.wav'
									sleep(12)
									usr.beam = "Kamehameha"
									usr.beamdmg = (amount * 1.2 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Kamehameha can now be fired."
obj
	techs
		BBK
			name = "Big Bang Kamehameha"
			icon = 'icons/techhands.dmi'
			icon_state = "bbkkame"
			Click()


				if(!usr.fused)
					usr << "You can't use '[src.name]'."
					del(src)
				if(usr.kame )
					alert("You can't use '[src.name]' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use '[src.name]' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.kame = 1
									usr.frozen = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.ki.value -= amount
									view(6) << 'sounds/bigbang.wav'
									view(6) << "<font color = red>[usr]:<font color = black> BIG BANG.."
									sleep(6)
									usr.overlays += /obj/kame
									sleep(6)
									view(6) << "<font color = red>[usr]:<font color = black> KA.."
									view(6) << 'sounds/ka.wav'
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									view(6) << 'sounds/me.wav'
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> HA.."
									view(6) << 'sounds/ha.wav'
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									view(6) << 'sounds/me2.wav'
									sleep(12)
									usr.beam = "BBK"
									usr.beamdmg = (amount * 1.5 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Big Bang Kamehameha can now be fired."
obj
	techs
		Spear
			name = "Arrow Charge"
			icon = 'icons/techhands.dmi'
			icon_state = "spear"
			Click()


				if(!usr.fused)
					usr << "You can't use '[src.name]'."
					del(src)
				if(usr.kame )
					alert("You can't use '[src.name]' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use '[src.name]' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.kame = 1
									usr.frozen = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.ki.value -= amount
									view(6) << "<font color = red>[usr]:<font color = black> Arrow.."
									sleep(3)
									view(6) << "<font color = red>[usr]:<font color = black> Charge.."
									sleep(3)
									usr.beam = "spear"
									usr.beamdmg = (amount * 1.7 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>[src.name] can now be fired."

obj
	techs
		GalicGun
			name = "Galit Gun"
			icon = 'icons/techhands.dmi'
			icon_state = "galit"
			Click()


				if(usr.kame )
					alert("You can't use 'Galit Gun' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Galit Gun' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.attacking = 1
									usr.frozen = 1
									usr.kame = 1
									view(15) << 'sounds/galit_charge.wav'
									usr.overlays += 'icons/galicki.dmi'
									view(6) << "<font color = red>[usr]:<font color = black> ENOUGH!"
									sleep(30)
									view(6) << "<font color = red>[usr]:<font color = black> YOU WILL NOT MAKE A FOOL OF ME!"
									usr.beam = "Galit Gun"
									usr.beamdmg = (amount * 1.3 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Galit Gun can now be fired."


obj
	techs
		Masenko
			name = "Masenko"
			icon = 'icons/techhands.dmi'
			icon_state = "yewki"
			Click()


				if(usr.kame )
					alert("You can't use 'Masenko' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Masenko' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.ki.value -= amount
									usr.kame = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.frozen = 1
									view(15) << 'sounds/mas_say.wav'
									view(15) << 'sounds/mas_charge.wav'
									view(6) << "<font color = red>[usr]:<font color = black> MASENKO.."
									usr.overlays += 'icons/flashki.dmi'
									sleep(32)
									usr.beam = "Masenko"
									usr.beamdmg = (amount * 1.8 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Masenko can now be fired."


obj
	techs
		burning
			name = "Burning Attack"
			icon = 'icons/techhands.dmi'
			icon_state = "burning"
			Click()


				if(usr.kame )
					alert("You can't use 'Burning Attack' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Burning Attack' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									usr.kame = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.frozen = 1
									usr.attacking = 1
									usr.overlays += 'icons/bbki.dmi'
									view(6) << 'sounds/burning_charge.wav'
									sleep(30)
									view(6) << 'sounds/burning_say.wav'
									view(6) << "<font color = red>[usr]: <font color = black>BURNING ATTACK!!"
									sleep(28)
									usr.beam = "Burning Attack"
									usr.beamdmg = (amount * 2 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Burning Attack can now be fired."


obj
	techs
		ThunderAtt
			name = "Thunder Flash Attack"
			icon = 'icons/techhands.dmi'
			icon_state = "tflash"
			Click()


				if(usr.kame )
					alert("You can't use 'Thunder Flash Attack' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Thunder Flash Attack' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									usr.kame = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.frozen = 1
									usr.overlays += /obj/kame
									view(10) << 'sounds/thunderflash.wav'
									sleep(62)
									usr << "<FONT COLOR = GREEN><I>Thunder Flash Attack can now be fired."
									usr.beam = "Thunder Flash"
									usr.beamdmg = (amount * 2.5 * (usr.focus.value*2)/usr.focus.max_value)


obj
	techs
		swoop
			name = "Swoop"
			icon = 'icons/techhands.dmi'
			icon_state = "swp"
			Click()
				if(usr.z == 3)
					usr << "<b>You can't do this here!"
				else if(usr.z == 8)
					usr << "<b>You can't do this here!"
				else if(usr.z == 10)
					usr << "<b>You can't do this here!"
				else if(usr.z == 2||usr.z == 4)
					usr << "<b>You can't do this here!"
				else
					if(usr.z == 14)
						usr << "<b>You can't do this here!"
					else
						if(usr.kame )
							alert("You can't use 'Swoop' while using another technique.")
						else
							if(usr.zanzoken )
								alert("You can't use 'Swoop' while using Zanzoken.")
							else
								if(usr.move == 0)
									alert("You can't use this skill now!")
								if(usr.move )
									var/neededki = usr.ki.max_value * 0.10
									if(usr.ki.value >= neededki)
										usr << "<B>You begin to swoop!"
										usr << "<FONT COLOR = BLUE>Press one of the movement buttons to stop swooping, or you will automatically stop swooping in 30 seconds."
										usr.ki.value -= neededki
										usr.ki.value = round(usr.ki.value)
										usr.move = 0
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										usr.dseffect2()
										sleep(25)
										usr.move = 1
										usr.density = 0
										usr.rundelay = 0
										usr.swoop = 1
										usr.flight = 1
										view(6) << 'sounds/swoop.wav'
										usr.icon_state = "buku"
										var/icon/aura = new('icons/whiteaura.dmi')
										aura.Blend(usr.customauracolor)
										usr.underlays += aura
										spawn(300)
											if(usr.swoop)
												usr.underlays -= aura
												usr.flight = 0
												usr.swoop = 0
												usr.rundelay = 2
												usr.icon_state = ""
												usr.client.show_verb_panel = 1
												usr.hideipan = 0
												usr.move = 0
												usr.move = 1
												usr.density = 1
												usr << "<B>You stop swooping!"
										walk(usr, usr.dir)
									else
										alert("You do not have enough Ki to use this skill!")

client
	North()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	South()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	East()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	West()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	Northeast()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	Northwest()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	Southeast()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()
	Southwest()
		if(mob.swoop)
			var/icon/aura = new('icons/whiteaura.dmi')
			aura.Blend(mob.customauracolor)
			usr.underlays -= aura
			usr.move = 1
			usr.flight = 0
			usr.swoop = 0
			usr.icon_state = ""
			usr.client.show_verb_panel = 1
			usr.hideipan = 0
			usr.density = 1
			usr.rundelay = 2
			usr << "<B>You stop swooping!"
		..()

obj
	techs
		BigBang
			name = "Big Bang Attack"
			icon = 'icons/techhands.dmi'
			icon_state = "bbang"
			Click()
				if(usr.kame )
					alert("You can't use 'Big Bang Attack' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Big Bang Attack' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put that amount of Ki into the attack.")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.kame = 1
									usr.attacking = 1
									usr.frozen = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.move = 0
									usr.overlays += /obj/kame
									view(10) << 'sounds/bigbang.wav'
									view(6) << "<font color = red>[usr]:<font color = black> BIG BANG.."
									sleep(15)
									usr << "<FONT COLOR = GREEN><I>Big Bang Attack can now be fired!"
									usr.projectile = "Big Bang Attack"
									usr.projdmg = (amount * 2.5 * (usr.focus.value*2)/usr.focus.max_value)

obj
	techs
		playerabsorb
			name = "Absorb"
			icon = 'icons/techhands.dmi'
			icon_state = "abs"
			Click()
				var/mob/M
				for(var/mob/O in get_step(usr,usr.dir))
					M = O
				if(M)
					if(usr.zanzoken)
						alert("You can't use 'Absorb' while using Zanzoken.")
					else
						if(M.dead)
							alert("You can't absorb dead people.")
						else
							if(M.gm)
								alert("You can't absorb GMs.")
							else
								if(M.splitnpc)
									usr << "<B>You can't absorb Split-forms."
								else
									if(M.npc || istype(M,/monster))
										usr << "<B>You can't absorb NPCs."
									else
										if(M.immortal)
											usr << "<B>You can't absorb immortals!"
										else
											if(usr.powerlevel.max_value <= M.powerlevel.max_value || M.powerlevel.value == 5)
												usr << "<B>You need to be stronger to absorb [M] or [M] needs to be weaker!"
												return
											else
												if(usr.ki.max_value <= M.ki.max_value)
													usr << "<B>You need have more ki to absorb [M]."
													return
												else
													if(usr.absorbed >= 1)
														usr << "<B>You need to wait [usr.absorbed] minutes before absorbing again."
													else
														if(usr.race != "Android (Mechanical)")
															usr.absorbed = rand(30,40)
															usr.absorbexp += 1
															usr.powerlevel.max_value += M.powerlevel.max_value * 0.01
															usr.ki.max_value *= 1.005
														else
															usr.absorbed = rand(60,120)
															usr.absorbexp += 2
															usr.powerlevel.max_value += M.powerlevel.max_value * 0.001
															usr.ki.max_value *= 1.0005
														flick("assimilate",usr)
														usr << "<b><font color = red>You have absorbed [M] into you body. Your power increases."
														M << "<b><font color = red>You have been absorbed by [usr]!"
														world << "<b><font color = red>[M] has been absorbed by [usr]!"
														M.powerlevel.value = 0
														M.Die(usr)
														if(usr.race == "Android (Biological)")
															if(usr.absorbexp >= 25 && !usr.celltrans)
																usr.contents += new /obj/transes/celltrans
																if(!frcsp)
																	if(!usr.fused)
																		frcsp = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
																		world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Semi-Perfect Cell Form</font></b>"
																usr << "<FONT COLOR = RED><B>You have attained the ablity to <U>Transform</U>!"
																usr.celltrans = 1
														usr.absorbcount()
														if(M.mon )
															if(M.client)
																M.powerlevel.value = 0
																M.Die()
															else
																if(M.race == "Android 17 (NPC)")
																	if(usr.cellq )
																		usr.cellq = 2
																if(M.race == "Android 18 (NPC)")
																	if(usr.cellq == 2)
																		usr.cellq = 3
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
																del(M)
				else
					usr << "<B>There is nothing there!"
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.absorbed == null)
						usr.absorbed = 0
					usr << "You have [usr.absorbed] minutes left before you can absorb!"

obj
	techs
		buuabs
			name = "Eat"
			icon = 'icons/techhands.dmi'
			icon_state = "buuabs"
			Click()
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Eat","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.zanzoken)
						alert("You can't use 'Eat' while using Zanzoken.")
					else
						if(M.dead)
							alert("You can't absorb dead people.")
						else
							if(M.gm)
								alert("You can't eat GMs.")
							else
								if(M.npc || istype(M,/monster))
									usr << "<B>You can't eat NPCs."
								else
									if(M.splitnpc)
										usr << "<B>You can't eat Split-forms."
									else
										if(M.immortal)
											usr << "<B>You can't eat immortals!"
										else
											if(usr.powerlevel.max_value <= M.powerlevel.max_value || M.powerlevel.value <= 5)
												usr << "<B>You need to be stronger to eat [M] or [M] needs to be weaker!"
											else
												if(usr.ki.max_value <= M.ki.max_value)
													usr << "<B>You need have more ki to eat [M]."
												else
													if(usr.absorbed >= 1)
														usr << "<B>You need to wait around 45 minutes before eating again."
													else
														usr.absorbed = rand(30,40)
														usr.move = 0
														usr.powerlevel.max_value += M.powerlevel.max_value * 0.01
														usr.ki.max_value += M.ki.max_value * 0.01
														missile('icons/assimilate.dmi',usr,M)
														usr.move = 1
														M.move = 0
														M.overlays += /obj/assim
														M << "<B><FONT COLOR = RED>You are being held by [usr]'s eating technique!"
														missile('icons/assimilate.dmi',M,usr)
														M.overlays -= /obj/assim
														M.move = 1
														usr << "<b><font color = red>You ate [M]. Your power increases."
														M << "<b><font color = red>[usr] ate you!"
														world << "<b><font color = red>[usr] ate [M]!"
														M.powerlevel.value = 0
														M.Die(usr)

														usr.absorbcount()
														if(M.mon )
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
															del(M)
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.absorbed == null)
						usr.absorbed = 0
					usr << "You have [usr.absorbed] minutes left before you can eat!"


mob
	proc
		healcount()
			spawn(1)
				set background = 1
				while(src.namekheal > 0)
				{
					for(var/obj/techs/namekheal/c)
						c.icon_state = "oheal"
					src.namekheal--
					sleep(600)
					if(src.namekheal <= 0)
						for(var/obj/techs/namekheal/c)
							c.icon_state = "heal"
						src << "<B>You can now use your Healing technique again!"
						src.namekheal = null
				}
obj
	techs
		namekheal
			name = "Heal"
			icon = 'icons/techhands.dmi'
			icon_state = "heal"
			Click()
				var/mob/M
				for(var/mob/O in get_step(usr,usr.dir))
					M = O
				if(M)
					if(usr.zanzoken )
						alert("You can't use 'Heal' while using Zanzoken.")
					else
						if(M.npc )
							usr << "You can't heal NPCs."
						else
							if(M.mon )
								usr << "You can't heal monsters."
							else
								if(usr.namekheal >= 1)
									usr << "<B>You can't heal again for 5 minutes."
								else
									M.move = 0
									usr.move = 0
									usr.namekheal = 5
									usr.stamina.value -= 50
									usr.powerlevel.value /= 2
									usr.ki.value /= 2
									usr.overlays += 'icons/heal.dmi'
									view(6) << 'sounds/heal.wav'
									M.overlays += 'icons/heal.dmi'
									usr << "<B>You begin healing [M]."
									M << "<B>You begin getting healed by [usr]."
									sleep(88)
									M.powerlevel.restore()
									M.ki.restore()
									M.stamina.restore()
									usr << "You finish healing [M]."
									M << "<B>You finish being healed by [usr]."
									usr.overlays -= 'icons/heal.dmi'
									M.overlays -= 'icons/heal.dmi'
									usr.move = 1
									M.move = 1
									usr.healcount()
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.namekheal == null)
						usr.namekheal = 0
					usr << "You have [usr.namekheal] minutes left before healing!"

obj
	miscturfs
		New()
			. = ..()
			spawn(600)
				del(src)
		name = "Dragonball Online"
		blastmiddle
			icon = 'icons/choublast.dmi'
			icon_state = "blastmiddle"

		blastleft
			icon = 'icons/choublast.dmi'
			icon_state = "blastleft"

		lblast
			icon = 'icons/choublast.dmi'
			icon_state = "lblast"

		rblast
			icon = 'icons/choublast.dmi'
			icon_state = "rblast"

		blastright
			icon = 'icons/choublast.dmi'
			icon_state = "blastright"

		destroyedleft
			icon = 'icons/choublast.dmi'
			icon_state = "destroyedleft"
			density = 0

		destroyedright
			icon = 'icons/choublast.dmi'
			icon_state = "destroyedright"
			density = 0
		destroyed
			icon = 'icons/choublast.dmi'
			icon_state = "destroyed"
			density = 0

proc
	get_left_dir(atom/A)
		switch(A.dir)
			if(NORTH)
				return WEST
			if(EAST)
				return NORTH
			if(SOUTH)
				return WEST
			if(WEST)
				return NORTH
	get_right_dir(atom/A)
		switch(A.dir)
			if(NORTH)
				return EAST
			if(EAST)
				return SOUTH
			if(SOUTH)
				return EAST
			if(WEST)
				return SOUTH
obj
	ChouBlast
		New()
			. = ..()
			spawn(1800)
				del(src)
		var
			powerlevel
			mob
				attacker
			obj
				miscturfs
					lblast
						ls
					blastmiddle
						ms
						last_middle
					rblast
						rs
					destroyedleft
						dl
					destroyed
						dm
					destroyedright
						dr
		proc/Blast(var/dist,var/speed)
			spawn()
				set background = 1
				ms = new(get_step(src,dir))
				ms.dir = dir
				ls = new(get_step(ms,get_left_dir(ms)))
				ls.dir = dir
				rs = new(get_step(ms,get_right_dir(ms)))
				rs.dir = dir
				last_middle = ms
				for(var/mob/M in ms.loc)
					M.powerlevel.value -= (powerlevel * 1)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				for(var/mob/M in ls.loc)
					M.powerlevel.value -= (powerlevel * 1)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				for(var/mob/M in rs.loc)
					M.powerlevel.value -= (powerlevel * 1)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				spawn(20)
					dl = new /obj/miscturfs/destroyedleft(ls.loc)
					dl.dir = dir
					dm = new /obj/miscturfs/destroyed(ms.loc)
					dm.dir = dir
					dr = new /obj/miscturfs/destroyedright(rs.loc)
					dr.dir = dir
					del(ms)
					del(rs)
					del(ls)
				sleep(speed)
				for(var/i = 0;i < dist;i++)
					var
						obj
							miscturfs
								blastleft
									l
								blastmiddle
									m
								blastright
									r
					m = new(get_step(last_middle,dir))
					m.dir = dir
					l = new(get_step(m,get_left_dir(m)))
					l.dir = dir
					r = new(get_step(m,get_right_dir(m)))
					r.dir = dir
					last_middle = m
					for(var/mob/M in m.loc)
						M.powerlevel.value -= (powerlevel * 1)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					for(var/mob/M in l.loc)
						M.powerlevel.value -= (powerlevel * 1)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					for(var/mob/M in r.loc)
						M.powerlevel.value -= (powerlevel * 1)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					spawn(20)
						dl = new /obj/miscturfs/destroyedleft(l.loc)
						dl.dir = dir
						dm = new /obj/miscturfs/destroyed(m.loc)
						dm.dir = dir
						dr = new /obj/miscturfs/destroyedright(r.loc)
						dr.dir = dir
						del(l)
						del(m)
						del(r)
					sleep(speed)
	techs
		ChouKamehameha
			name = "Chou Kamehameha"
			icon = 'icons/techhands.dmi'
			icon_state = "kame"
			Click()
				if(usr.zanzoken )
					alert("You can't use 'Chou Kamehameha' while using Zanzoken.")
				else
					if(usr.kame == 0)
						if(usr.stamina.value >= 95)
							if(usr.ffcht > 0)
								alert("You can't use this yet!")
								return
							else
								usr.kame = 1
								usr.move = 0
								usr.overlays += /obj/kame
								view(10) << 'sounds/chou_charge.wav'
								view(10) << 'sounds/chou.wav'
								view(10) << "<font color = red>[usr]:<font color = black> CHOU.."
								sleep(10)
								view(10) << 'sounds/ka.wav'
								view(10) << "<font color = red>[usr]:<font color = black> KA.."
								sleep(10)
								view(10) << 'sounds/me.wav'
								view(10) << "<font color = red>[usr]:<font color = black> ME.."
								sleep(10)
								view(10) << 'sounds/ha.wav'
								view(10) << "<font color = red>[usr]:<font color = black> HA.."
								sleep(10)
								view(10) << 'sounds/me2.wav'
								view(10) << "<font color = red>[usr]:<font color = black> ME.."
								sleep(16)
								view(10) << 'sounds/ha2.wav'
								view(10) << "<font color = red>[usr]:<font color = black> HA!!!"
								view(15) << 'sounds/chou_fire.wav'
								usr.overlays -= /obj/kame
								usr.stamina.value -= 95
								usr.kame = 0
								var/obj/ChouBlast/blast = new(usr.loc)
								blast.powerlevel = usr.powerlevel.value * (usr.focus.value*2)/usr.focus.max_value
								blast.attacker = usr
								blast.dir = usr.dir
								spawn(1) blast.Blast(150,2)
								usr.powerlevel.value = 5
								usr.kame = 0
								usr.move = 1
								usr.ffcht += rand(10,15)
								usr.ffchc()
						else
							alert("You are too tired to use this technique.")
					else
						alert("Your already using a technique.")
			verb
				TimeC()
					set name = "Time Counter"
					set category = null
					set src in usr.client.screen
					var/ffch2
					if(usr.ffcht == null)
						ffch2 = "no waiting"
					else
						ffch2 = usr.ffcht
					usr << "You have [ffch2] minutes left before using [src.name] again!"
obj
	miscturfs
		name = "Dragonball Online"
		fblastmiddle
			icon = 'icons/flashblast.dmi'
			icon_state = "blastmiddle"

		fblastleft
			icon = 'icons/flashblast.dmi'
			icon_state = "blastleft"

		flblast
			icon = 'icons/flashblast.dmi'
			icon_state = "lblast"

		frblast
			icon = 'icons/flashblast.dmi'
			icon_state = "rblast"

		fblastright
			icon = 'icons/flashblast.dmi'
			icon_state = "blastright"

		fdestroyedleft
			icon = 'icons/flashblast.dmi'
			icon_state = "destroyedleft"
			density = 0

		fdestroyedright
			icon = 'icons/flashblast.dmi'
			icon_state = "destroyedright"
			density = 0
		fdestroyed
			icon = 'icons/flashblast.dmi'
			icon_state = "destroyed"
			density = 0

obj
	FinalBlast
		New()
			. = ..()
			spawn(1800)
				del(src)
		var
			powerlevel
			mob
				attacker
			obj
				miscturfs
					flblast
						ls
					fblastmiddle
						ms
						last_middle
					frblast
						rs
					fdestroyedleft
						dl
					fdestroyed
						dm
					fdestroyedright
						dr
		proc/Blast(var/dist,var/speed)
			set background = 1
			spawn()
				ms = new(get_step(src,dir))
				ms.dir = dir
				ls = new(get_step(ms,get_left_dir(ms)))
				ls.dir = dir
				rs = new(get_step(ms,get_right_dir(ms)))
				rs.dir = dir
				last_middle = ms
				for(var/mob/M in ms.loc)
					M.powerlevel.value -= (powerlevel * 0.8)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				for(var/mob/M in ls.loc)
					M.powerlevel.value -= (powerlevel * 0.8)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				for(var/mob/M in rs.loc)
					M.powerlevel.value -= (powerlevel * 0.8)
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
				spawn(20)
					dl = new /obj/miscturfs/fdestroyedleft(ls.loc)
					dl.dir = dir
					dm = new /obj/miscturfs/fdestroyed(ms.loc)
					dm.dir = dir
					dr = new /obj/miscturfs/fdestroyedright(rs.loc)
					dr.dir = dir
					del(ms)
					del(rs)
					del(ls)
				sleep(speed)
				for(var/i = 0;i < dist;i++)
					var
						obj
							miscturfs
								fblastleft
									l
								fblastmiddle
									m
								fblastright
									r
					m = new(get_step(last_middle,dir))
					m.dir = dir
					l = new(get_step(m,get_left_dir(m)))
					l.dir = dir
					r = new(get_step(m,get_right_dir(m)))
					r.dir = dir
					last_middle = m
					for(var/mob/M in m.loc)
						M.powerlevel.value -= (powerlevel * 0.8)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					for(var/mob/M in l.loc)
						M.powerlevel.value -= (powerlevel * 0.8)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					for(var/mob/M in r.loc)
						M.powerlevel.value -= (powerlevel * 0.8)
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[attacker.name]"
									M.expkk = "[attacker.key]"
						M.Die(attacker)
					spawn(20)
						dl = new /obj/miscturfs/fdestroyedleft(l.loc)
						dl.dir = dir
						dm = new /obj/miscturfs/fdestroyed(m.loc)
						dm.dir = dir
						dr = new /obj/miscturfs/fdestroyedright(r.loc)
						dr.dir = dir
						del(l)
						del(m)
						del(r)
					sleep(speed)
	techs
		FinalFlash
			name = "Final Flash"
			icon = 'icons/techhands.dmi'
			icon_state = "fflash"
			Click()
				if(usr.zanzoken )
					alert("You can't use 'Final Flash' while using Zanzoken.")
				else
					if(usr.kame == 0)
						if(usr.stamina.value >= 95)
							if(usr.ffcht > 0)
								alert("You can't use this yet!")
								return
							else
								usr.kame = 1
								usr.move = 0
								usr.overlays += 'icons/flashki.dmi'
								view(10) << 'sounds/finalflash.wav'
								view(10) << "<font color = red>[usr]:<font color = black> FINAL.."
								sleep(10)
								view(10) << "<font color = red>[usr]:<font color = black> FLASH!!!"
								usr.overlays -= 'icons/flashki.dmi'
								usr.stamina.value -= 95
								usr.kame = 0
								var/obj/FinalBlast/blast = new(usr.loc)
								blast.powerlevel = usr.powerlevel.value * (usr.focus.value*3)/usr.focus.max_value
								blast.attacker = usr
								blast.dir = usr.dir
								spawn(1) blast.Blast(150,2)
								usr.powerlevel.value = 5
								usr.kame = 0
								usr.move = 1
								usr.ffcht += rand(10,15)
								usr.ffchc()
						else
							alert("You are too tired to use this technique.")
					else
						alert("Your already using a technique.")
			verb
				TimeC()
					set name = "Time Counter"
					set category = null
					set src in usr.client.screen
					var/ffch2
					if(usr.ffcht == null)
						ffch2 = "no waiting"
					else
						ffch2 = usr.ffcht
					usr << "You have [ffch2] minutes left before using [src.name] again!"

mob
	proc
		oozarucount()
			spawn(1)
				set background = 1
				while(src.oozaru > 0)
				{
					src.oozaru--
					sleep(600)
					if(src.oozaru <= 1)
						src << "<B>You can now use False Moon again!"
						src.oozaru = 0
						break
				}

mob
	proc
		oozrevcount()
			spawn(1)
				set background = 1
				while(src.oozrev > 0)
				{
					src.oozrev--
					sleep(600)
					if(src.oozrev <= 1)
						if(src.state == "Oozaru")
							src << "<B>You begin to revert back to your normal state!"
							oview(50) << "<B>[src] has reverted from his Oozaru form!"
							src.skinrestore()
							src.icon_state = ""
							var/obj/MonkeyTop/F = new(null)
							src.overlays -= F
							src.hairrestore()
							if(src.powerlevel.value >= src.powerlevel.max_value)
								src.powerlevel.value = src.powerlevel.max_value
							if(src.ki.value >= src.ki.max_value)
								src.ki.value = src.ki.max_value
							src.state = "Normal"
							src.oozrev = 0
				}

obj/techs
	moonblast
		name = "False Moon"
		icon = 'icons/fakemoon.dmi'
		icon_state = ""
		Click()
			if(usr.tail != 1)
				alert("You can't use this for you do not have a tail!")
				return
			else
				if(usr.oouse )
					alert("You are already using this!")
				else
					usr.oouse = 1
					if(usr.state == "Normal")
						if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
							if(usr.oozaru == 0)
								if(usr.oozrev == 0)
									var/obj/MonkeyTop/F = new(null)
									var/moonb = new /obj/moon(locate(usr.x,usr.y+4,usr.z))
									usr.oozaru = 400
									usr.oozrev = 5
									usr.move = 0
									usr << "<B>You begin to stare at the Moon.."
									view(6) << 'sounds/elec.wav'
									sleep(68)
									del(moonb)
									del(moonb)
									del(moonb)
									usr << "<B>You begin to transform into your Oozaru form!"
									usr << "<B>This form only lasts for 5 minutes, then you will automatically revert!"
									usr.overlays.Cut()
									usr.underlays.Cut()
									usr.CreateName()
									usr.icon = 'icons/monkey.dmi'
									usr.icon_state = ""
									usr.overlays += F
									usr.state = "Oozaru"
									usr << "<B><FONT COLOR = RED>Your clothes rip apart!"
									if(!frooz)
										if(!usr.fused)
											frooz = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
											world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Oozaru</font></b>"
									usr.move = 1
									usr.powerlevel.value *= 5
									usr.ki.value *= 5
									usr.oozarucount()
									usr.oozrevcount()
									usr.oouse = 0
								else
									usr.powerlevel.value += 0
									usr.oouse = 0
							else
								alert("You can't use this technique for another 4 hours.")
								usr.oouse = 0
						else
							alert("You're not a Saiyan silly")
							usr.oouse = 0
					else
						alert("You need to be in your Normal state.")
						usr.oouse = 0
		verb
			TimeC()
				set name = "Time Counter"
				set category = null
				set src in usr.client.screen
				if(usr.oozaru == null)
					usr.oozaru = 0
				if(usr.oozrev == null)
					usr.oozrev = 0
				usr << "You have [usr.oozrev] minutes before you revert"
				usr << "You have [usr.oozaru] minutes before you can use it again"

obj/MonkeyTop
	icon = 'icons/monkey.dmi'
	icon_state = "top"
	layer = 9
	pixel_y = 32
	density = 0

obj
	techs
		zanzoken
			name = "Zanzoken"
			icon = 'icons/techhands.dmi'
			icon_state = "zan"
			Click()
				if(usr.zanzoken==0)
					usr<<"<B><FONT COLOR = BLUE>You activate Zanzoken!"
					usr<<"<FONT COLOR = BLUE>To use Zanzoken simply double-click on a tile for example grass and you will automatically teleport there, leaving a after-image."
					usr.zanzoken=1
				else
					usr<<"<B><FONT COLOR = BLUE>You deactivate Zanzoken!"
					usr.zanzoken=0

client/var/mob_ckey

obj
	techs
		fdance
			name = "Fusion Dance"
			icon = 'icons/techhands.dmi'
			icon_state = "fuse"
			Click()
				var/mob/M
				for(var/mob/O in get_step(usr,usr.dir))
					M = O
				if(M)
					var/yes
					var/client
						Mcli
						Ucli
					if(usr.fused  || usr.race == "Fused")
						alert("You have fused already!")
						return
					else if(usr.used  || M.used )
						usr << "Please wait a moment"
						return
					else
						if(M.fused  || M.race == "Fused" || M.name == usr.name)
							alert("[M] has fused already!")
							return
						else
							if(usr.powerlevel.value != M.powerlevel.value)
								alert(usr,"Your powerlevels are not aligned with eachother!")
								alert(M,"Your powerlevels are not aligned with eachother!")
							else
								usr.used = 1
								M.used = 1
								if(M.race == usr.race||usr.race == "All"||(M.race == "Earthling" && usr.race == "Half-Saiyan")||(usr.race == "Earthling" && M.race == "Half-Saiyan"))
									usr << "Asking [M]."
									yes = alert(M,"Do you want to fuse with [usr]? ([usr]'s Powerlevel: [usr.powerlevel.value])","Fusion Dance","Yes","No")
									if(yes == "Yes")
										if(M.name != usr.name)
											var/fusedname = copytext(usr.name, 1, lentext(usr.name)/2+1) + copytext(M.name, lentext(M.name)/2, lentext(M.name)+1)
											usr.random = rand(1,3)
											Mcli = M.client
											Ucli = usr.client
											Ucli.SaveMob()
											Mcli.SaveMob()
											Ucli.mob_ckey = ckey(usr.name)
											Mcli.mob_ckey = ckey(M.name)
											usr.fused = 1
											M.fused = 1
											view(6) << 'sounds/fusion.wav'
											view(6) << "<FONT COLOR = RED>[M]: </FONT>FU.."
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>FU.."
											sleep(15)
											view(6) << "<FONT COLOR = RED>[M]: </FONT>SION.."
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>SION.."
											sleep(15)
											view(6) << "<FONT COLOR = RED>[M]: </FONT>HA!!"
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>HA!!"
											players << "<B><FONT COLOR = BLUE>[usr] and [M] have completed the 'Fusion Dance' to create [fusedname]!"
											usr.overlays.Cut()
											usr.underlays.Cut()
											usr.hairrestore()
											M.icon = ""
											M.density = 0
											M.move = 0
											M.name = "[fusedname]([M.key])"
											usr.name = "[fusedname]([usr.key])"
											usr.CreateName()
											var/obj/items/F1 = new /obj/items/fusionvest
											usr.overlays += F1.icon
											usr.contents += M.contents
											if(usr.race == "Saiyan" && M.race == "Saiyan")
												var/obj/techs/BKB = new /obj/techs/BBK
												usr.contents += BKB
											usr.zenni += M.zenni
											F1.worn = 1
											M.overlays.Cut()
											M.dead = 0
											M.underlays.Cut()
											M.loc=usr
											M.client.eye = usr
											usr.ki.max_value += M.ki.max_value
											usr.powerlevel.max_value += M.powerlevel.max_value
											usr.powerlevel.value = usr.powerlevel.max_value
											usr.ki.value = usr.ki.max_value
											usr.zenni = 0
											usr.bzenni = 0
											M.zenni = 0
											M.bzenni = 0
											usr.newb = 0
											M.newb = 0
											M.hideipan = 1
											M.powerlevel.max_value = 1
											M.powerlevel.value = 1
											M.ki.max_value = 1
											M.ki.value = 1
											M.client.show_verb_panel = 0
											M.hideipan = 1
											M.invisibility = 1
											M.kame = 1
											M.attacking = 1
											if((M.race == "Earthling" && usr.race == "Half-Saiyan")||(usr.race == "Earthling" && M.race == "Half-Saiyan"))
												var/rh = rand(1,3)
												if(rh )
													M.race = "Earthling"
													usr.race = "Earthling"
												else
													M.race = "Half-Saiyan"
													usr.race = "Half-Saiyan"
											if(M.race == "Half-Saiyan" && usr.race == "Half-Saiyan")
												var/rp = rand(1.3)
												if(rp )
													M.race = "Saiyan"
													usr.race = "Saiyan"
												if(rp == 2)
													M.race = "Half-Saiyan"
													usr.race = "Half-Saiyan"
												if(rp == 3)
													M.race = "Earthling"
													usr.race = "Earthling"
											if(usr.state == "Super Saiyan 4" && M.state == "Super Saiyan 4")
												view(10) << 'sounds/aura.wav'
												for(var/obj/items/fusionvest/A in usr.contents)
													del(A)
												var/obj/items/VEST = new /obj/items/redfusionvest
												usr.overlays += 'icons/ssj4.dmi'
												usr.overlays += VEST.icon
												VEST.worn = 1
												usr.contents += VEST
												usr.overlays -= F1
												usr.hairremoval()
												usr.overlays += 'icons/ssj4.dmi'
												usr.overlays += 'icons/elec.dmi'
												usr.underlays += /obj/SSAuraBottom
												usr.overlays += /obj/SSAuraTop
												usr.powerlevel.value = (usr.powerlevel.max_value * 10)
												usr.used = 0
												M.used = 0
											spawn(3000)
												if(M && Mcli)
													M << "<B><FONT COLOR = RED>Please relogin to Dragonball Online!"
													M.client.show_verb_panel = 1
													M.hideipan = 0
													M.follow = null
													M.move = 1
													M.attacking = 0
													M.kame = 0
													M.training = 0
													spawn()
														loadmobs(Mcli)
												usr.fused = 0
												loadmobs(Ucli)
										else
											usr.used = 0
											M.used = 0
											alert("You can not fuse with a fused character")
								else
									usr.used = 0
									M.used = 0
									alert("You both need to be the exact same RACE.")
				else
					usr << "<B>There is nothing there, or you need to face your partner!"

	proc
		loadmobs(var/client/o)
			o.LoadMob(o.mob_ckey)


mob
	proc
		purplightningrand()
			spawn(1)
				set background = 1
				while(src.lspecial )
				{
					var/spot1 = src.x + (rand(-8,8))
					var/spot2 = src.y + (rand(-8,8))
					var/bolt = new/obj/purplightningbolt(locate(spot1,spot2,src.z))
					view(6) << 'sounds/lightning.wav'
					sleep(22)
					del(bolt)
					sleep(rand(50,650))
				}


mob
	proc
		lightningrand2()
			spawn(1)
				set background = 1
				while(src.lspecial )
				{
					var/spot1 = src.x + (rand(-8,8))
					var/spot2 = src.y + (rand(-8,8))
					var/bolt = new/obj/lightningbolt(locate(spot1,spot2,src.z))
					view(6) << 'sounds/lightning.wav'
					sleep(22)
					del(bolt)
					sleep(rand(50,650))
				}

mob
	proc
		lightningrand()
			spawn(1)
				set background = 1
				while(src.lspecial )
				{
					var/spot1 = src.x + (rand(-8,8))
					var/spot2 = src.y + (rand(-8,8))
					var/bolt = new/obj/lightningbolt(locate(spot1,spot2,src.z))
					view(6) << 'sounds/lightning.wav'
					sleep(21)
					del(bolt)
				}

mob
	proc
		redlightningrand()
			spawn(1)
				set background = 1
				while(src.lspecial )
				{
					var/spot1 = src.x + (rand(-8,8))
					var/spot2 = src.y + (rand(-8,8))
					var/bolt = new/obj/redlightningbolt(locate(spot1,spot2,src.z))
					view(6) << 'sounds/lightning.wav'
					sleep(22)
					del(bolt)
				}



obj
	techs
		cosmichalo
			name = "Cosmic Halo"
			icon = 'icons/techhands.dmi'
			icon_state = "held2"
			Click()
				var/mob/Target=input("Select a target.","Cosmic Halo","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(M.npc )
						usr << "<B>You can't use this technique aganist a NPC."
					else
						if(usr.zanzoken )
							alert("You can't use 'Cosmic Halo' while using Zanzoken.")
						else
							if(usr.ased )
								usr << "You have used this technique recently, you must wait."
							if(usr.ased == 0)
								if(usr.flight )
									alert("You are flying, you can't use this technique.")
								if(usr.flight == 0)
									usr.ased = 1
									usr.move = 0
									usr.frozen = 1
									usr.attacking = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									view(6) << 'sounds/cosmic_charge.wav'
									sleep(24)
									view(6) << "<FONT COLOR = red>[usr]: </font> COSMIC.."
									usr.overlays += /obj/ccki1
									usr.overlays += /obj/ccki2
									sleep(8)
									view(6) << "<FONT COLOR = red>[usr]: </font> HALO!!!"
									sleep(22)
									if(!usr) return
									if(!M)
										usr.overlays -= /obj/ccki1
										usr.overlays -= /obj/ccki2
										return
									view(6) << 'sounds/chou_fire.wav'
									usr.overlays -= /obj/ccki1
									usr.overlays -= /obj/ccki2
									s_missile('icons/chalo.dmi',usr,M)
									view(6) << "<font color = RED><B>[usr.name] commands a Cosmic Halo to wrap around [M.name]!"
									sleep(10)
									if(M in view(6))
										spawn(5)
											usr.move = 1
											usr.frozen = 0
											usr.attacking = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
										view(6) << "<font color = RED><B>[M] is being held by [usr]'s Cosmic Halo technique!"
										sleep(5)
										M.move = 0
										M.kame = 1
										M.attacking = 1
										M.frozen = 1
										if(M.client)
											M.client.show_verb_panel = 0
											M.hideipan = 1
										M.overlays += /obj/cheld
										sleep(150)
										if(!M || !usr) return
										usr.ased = 0
										M.overlays -= /obj/cheld
										M.frozen = 0
										M.move = 1
										M.kame = 0
										M.attacking = 0
										if(M.client)
											M.client.show_verb_panel = 1
											M.hideipan = 0
									else
										view(6) << "<font color = RED><B>[M] has moved out of sight, allowing the Cosmic Halo to go by him!!"
										usr.ased = 0
										usr.move = 1
										usr.frozen = 0
										usr.attacking = 0
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
				else
					usr << "<B>Target has gone out of sight or there isn't any targets near!"
obj
	techs
		energyring
			name = "Energy Ring"
			icon = 'icons/techhands.dmi'
			icon_state = "held2"
			Click()
				if(usr.eruse != 2)
					usr << "You can't use this!"
					del(src)
					return
				else
					var/mob/Target=input("Select a target.","Energy Ring","") as mob in oview(6)
					if((Target in oview(6)) && ismob(Target))
						var/mob/M = Target
						if(M.npc )
							usr << "<B>You can't use this technique aganist a NPC."
						else
							if(usr.zanzoken )
								alert("You can't use 'Energy Ring' while using Zanzoken.")
							else
								if(usr.ased )
									usr << "You have used this technique recently, you must wait."
								if(usr.ased == 0)
									if(usr.flight )
										alert("You are flying, you can't use this technique.")
									if(usr.flight == 0)
										usr.ased = 1
										usr.move = 0
										usr.frozen = 1
										usr.attacking = 1
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										view(6) << 'sounds/energyring.wav'
										view(6) << "<FONT COLOR = red>[usr]: </font> Energy.."
										usr.overlays += /obj/er2
										sleep(5)
										view(6) << "<FONT COLOR = red>[usr]: </font> Ring!!!"
										sleep(39)
										usr.overlays -= /obj/er2
										s_missile('icons/erhalo.dmi',usr,M)
										view(6) << "<font color = RED><B>[usr.name] commands a Energy Ring to wrap around [M.name]!"
										sleep(10)
										if(M in view(6))
											spawn(5)
												usr.move = 1
												usr.frozen = 0
												usr.attacking = 0
												usr.client.show_verb_panel = 1
												usr.hideipan = 0
											view(6) << "<font color = RED><B>[M] is being held by [usr]'s Energy Ring technique!"
											sleep(5)
											M.move = 0
											M.powerlevel.value -= round(M.powerlevel.value * 0.10 * (usr.focus.value*2)/usr.focus.max_value)
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											M.kame = 1
											M.attacking = 1
											M.frozen = 1
											if(M.client)
												M.client.show_verb_panel = 0
												M.hideipan = 1
											M.overlays += /obj/er1
											sleep(150)
											usr.ased = 0
											M.overlays -= /obj/er1
											M.frozen = 0
											M.move = 1
											M.kame = 0
											M.attacking = 0
											if(M.client)
												M.client.show_verb_panel = 1
												M.hideipan = 0
										else
											view(6) << "<font color = RED><B>[M] has moved out of sight, allowing the Energy Ring to go by him!!"
											usr.ased = 0
											usr.move = 1
											usr.frozen = 0
											usr.attacking = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
					else
						usr << "<B>Target has gone out of sight or there isn't any targets near!"

obj
	techs
		splitform
			name = "Split-form"
			icon = 'icons/techhands.dmi'
			icon_state = "split"
			Click()
				if(usr.dead)
					alert("You cannot use splitform while dead!")
					return
				var/monster/train/split = new()
				split.creator = usr
				split.icon = usr.icon
				split.dead = usr.dead
				split.overlays = usr.overlays
				split.underlays = usr.underlays
				split.loc = get_step_rando(usr)
				split.powerlevel.value = (usr.powerlevel.max_value >= usr.powerlevel.value)?(usr.powerlevel.max_value * 0.71):(usr.powerlevel.value * 0.71)
				split.powerlevel.max_value = split.powerlevel.value
				split.ki.max_value = (usr.ki.max_value >= usr.ki.value)?(usr.ki.max_value * 0.71):(usr.ki.value * 0.71)
				split.ki.value = split.ki.max_value
				split.kigivemin = sqrt(usr.ki.max_value / 800)
				split.kigivemax = sqrt(usr.ki.max_value / 400)
				split.plgivemin = sqrt(usr.powerlevel.max_value / 800)
				split.plgivemax = sqrt(usr.powerlevel.max_value / 400)
				split.skexpgivemin = max(1, round(sqrt((usr.powerlevel.max_value / 64000000)**2 + (usr.ki.max_value / 64000000)**2)))
				split.skexpgivemax= max(1, round(sqrt((usr.powerlevel.max_value / 16000000)**2 + (usr.ki.max_value / 16000000)**2)))
				split.name = "[usr]'s Splitform"
				usr.powerlevel.value *= 0.70
				usr.ki.value *= 0.70
				oviewers() << "[usr] creates a splitform!"
				usr << "You made a splitform!"

obj
	techs
		selfdestruct
			name = "Self-Destruct"
			icon = 'icons/techhands.dmi'
			icon_state = "sd"
			Click()
				if(usr.dead )
					alert("You can't use Self-Destruct while dead.")
				else
					if(usr.sdt > 0)
						alert("You can't attack yet")
					else
						if(usr.immortal)
							alert("You can't use Self-Destruct while being immortal.")
						else
							usr.dead = 1
							usr.dseffect()
							usr << "<B>You feel the ground shake around you!"
							Quake_Effect(usr,25,1)
							for(var/mob/characters/A in oview(50))
								if(A.client)
									Quake_Effect(A,25,1)
									A << "<B>You feel the ground shake!"
							sleep(40)
							view(20) << 'sounds/destruct.wav'
							view(20) << "<FONT COLOR = RED>[usr]:</font> YA!!!!!"
							usr.move = 0
							call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
							for(var/mob/characters/C in oview(6,src.loc))
								C.powerlevel.value -= usr.powerlevel.max_value * 0.75 * (usr.focus.value*2)/usr.focus.max_value
								if(C.mon )
									if(C.powerlevel.value <=0)
										if(C.expkn == null && C.expkk == null)
											C.expkn = "[usr.name]"
											C.expkk = "[usr.key]"
								C.Die(usr)
							sleep(15)
							view(6) << 'sounds/death.wav'
							usr.powerlevel.value = 0
							usr.ki.value = 0
							usr.move = 1
							usr.dead = 0
							usr.sdt = 60
							usr.sdtc()
							usr.Die()
			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.sdt == null)
						usr.sdt = 0
					usr << "You have [usr.sdt] minutes left before using Self-Destruct"
obj
	techs
		liquid
			name = "Liquify"
			icon = 'icons/techhands.dmi'
			icon_state = "liq"
			Click()
				var/mob/Target=input("Select a target.","Liquify","") as mob in oview(6)
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.lqt > 0)
						alert("You can't attack yet")
					else
						if(usr.zanzoken)
							alert("You can't use 'Liquify' while using Zanzoken.")
						else
							if(M.npc)
								usr << "<B>You can't Liquify NPCs."
							else
								if(M.splitnpc)
									usr << "<B>You can't eat Split-forms."
								else
									if(M.immortal)
										usr << "<B>You can't Liquify immortals!"
									else
										if(usr.dead)
											alert("You can't use Liquify while dead.")
										else
											if(usr.immortal)
												alert("You can't use Liquify while being immortal.")
											else
												usr.dead = 1
												M.dead = 1
												usr.move = 0
												M.move = 0
												usr.icon_state = "liquid"
												missile('icons/assimilate.dmi',usr,M)
												view(6) << "[usr]: LIQUIFY!!"
												sleep(rand(5,15))
												M.overlays += /obj/assim
												M << "Some of [usr]'s liquid goes inside you.."
												usr << "Some of your liquid parts goes inside [M]'s body"
												M.verbs += /mob/liquify/verb/punchout
												sleep(rand(100,300))
												M.verbs -= /mob/liquify/verb/punchout
												view(20) << 'sounds/destruct.wav'
												view(20) << "<FONT COLOR = RED>[usr]:</font> YA!!!!!"
												if(M.liquifyout == 4)
													M << "Some of the [usr]'s liquid was punched out thus you survived.."
													usr << "[M] had punched your liquid out of their body!"
													M.overlays -= /obj/assim
													usr.icon_state=""
													view(6) << "The liquid punched out from [M] returns back to [usr]!"
													usr.move = 1
													usr.dead = 0
													if(M.mon )
														if(M.powerlevel.value <=0)
															M.expkn = "[usr.name]"
															M.expkk = "[usr.key]"
															M.powerlevel.value = 0
													usr.Die()
													M.move = 1
													M.dead = 0
													M.liquifyout = 0
													M.Die(usr)
													usr.lqt = rand(100,200)
													usr.lqtc()
												else
													if(usr.powerlevel.max_value >= M.powerlevel.max_value && usr.ki.max_value >= M.ki.max_value)
														var/esc = rand(1,5)
														if(esc == 3)
															M << "Some of the [usr]'s liquid inside you increases in you and exlodes, taking away some of your health but atleast you survived.."
															usr << "Some of your liquid parts that was inside [M]'s body increases in size and explodes, but just killing youtself. It seemed that [M] was stronger than you thought."
															call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
															M.overlays -= /obj/assim
															view(6) << 'sounds/death.wav'
															usr.powerlevel.value = 0
															usr.ki.value = 0
															usr.move = 1
															usr.dead = 0
															usr.Die()
															M.powerlevel.value -= usr.powerlevel.max_value
															if(M.mon )
																if(M.powerlevel.value <=0)
																	if(M.expkn == null && M.expkk == null)
																		M.expkn = "[usr.name]"
																		M.expkk = "[usr.key]"
																		M.powerlevel.value = 0
															M.ki.value -= usr.ki.max_value * (usr.focus.value*2)/usr.focus.max_value
															M.move = 1
															M.dead = 0
															if(M.mon)
																if(M.powerlevel.value <=0)
																	if(M.expkn == null && M.expkk == null)
																		M.expkn = "[usr.name]"
																		M.expkk = "[usr.key]"
																		M.powerlevel.value = 0
															M.Die(usr)
															M.liquifyout = 0
															usr.lqt = rand(100,200)
															usr.lqtc()
														else
															M << "Some of the [usr]'s liquid inside you increases in you and exlodes, killing both of you.."
															usr << "Some of your liquid parts that was inside [M]'s body increases in size and explodes, killing both of you"
															call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
															M.overlays -= /obj/assim
															view(6) << 'sounds/death.wav'
															usr.powerlevel.value = 0
															usr.ki.value = 0
															usr.move = 1
															usr.dead = 0
															usr.Die()
															M.powerlevel.value = 0
															M.ki.value = 0
															M.move = 1
															M.dead = 0
															if(M.mon )
																if(M.powerlevel.value <=0)
																	if(M.expkn == null && M.expkk == null)
																		M.expkn = "[usr.name]"
																		M.expkk = "[usr.key]"
																		M.powerlevel.value = 0
															M.Die(usr)
															M.liquifyout = 0
															usr.lqt = rand(100,200)
															usr.lqtc()
													else
														M << "Some of the [usr]'s liquid inside you increases in you and exlodes, killing both of you.."
														usr << "Some of your liquid parts that was inside [M]'s body increases in size and explodes, killing both of you"
														call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
														M.overlays -= /obj/assim
														view(6) << 'sounds/death.wav'
														usr.powerlevel.value = 0
														usr.ki.value = 0
														usr.move = 1
														usr.dead = 0
														usr.Die()
														M.powerlevel.value = 0
														M.ki.value = 0
														M.move = 1
														M.dead = 0
														if(M.mon )
															if(M.powerlevel.value <=0)
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
																	M.powerlevel.value = 0
														M.Die(usr)
														M.liquifyout = 0
														usr.lqt = rand(100,200)
														usr.lqtc()

			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.lqt == null)
						usr.lqt = 0
					usr << "You have [usr.lqt] minutes left before using Liquify"
obj
	techs
		andb
			name = "Android Bomb"
			icon = 'icons/techhands.dmi'
			icon_state = "sd"
			Click()
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Android Bomb","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.abt > 0)
						alert("You can't attack yet")
					else
						if(usr.zanzoken )
							alert("You can't use 'Android Bomb' while using Zanzoken.")
						else
							if(M.npc )
								usr << "<B>You can't Android Bomb NPCs."
							else
								if(M.splitnpc )
									usr << "<B>You can't Android Bomb Split-forms."
								else
									if(M.immortal )
										usr << "<B>You can't Android Bomb immortals!"
									else
										if(usr.dead )
											alert("You can't use Android Bomb while dead.")
										else
											if(usr.immortal)
												alert("You can't use Android Bomb while being immortal.")
											else
												usr.dead = 1
												M.dead = 1
												M.move = 0
												usr.density = 0
												view(20) << "[usr]: You shall not escape from me alive!!"
												view(6) << "[usr]'s sudden loud noice froze [M]!"
												var/wtb = get_dist(usr,M)
												walk_to(usr,M,1,5)
												sleep(wtb*5)
												view(6) << "<font color = red><b>[usr] latches onto [M]!</font>"
												sleep(10)
												usr.move = 0
												walk_to(usr,0)
												usr.density = 1
												view(20) << "<FONT COLOR = RED>[usr]:</font> YOU WILL DIE FROM ME BY THE BOMB THAT'S IMPLANTED INSIDE ME!!! YA!!!!!"
												sleep(rand(30,100))
												view(20) << 'sounds/destruct.wav'
												if(M.powerlevel.max_value >= usr.powerlevel.max_value && M.ki.max_value >= usr.ki.max_value)
													var/esc = rand(1,5)
													if(esc == 3)
														usr << "You use Android Bomb but it seems that the bomb was a bit defective thus [M] lived with some damage!"
														M << "[usr] used Android Bomb but it seems that the bomb was a bit defective thus you lived with some damage!"
														call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
														view(6) << 'sounds/death.wav'
														usr.powerlevel.value = 0
														usr.ki.value = 0
														usr.move = 1
														usr.dead = 0
														usr.Die()
														M.powerlevel.value -= usr.powerlevel.max_value
														if(M.mon )
															if(M.powerlevel.value <=0)
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
																	M.powerlevel.value = 0
														M.ki.value -= usr.ki.max_value
														M.move = 1
														M.dead = 0
														if(M.mon )
															if(M.powerlevel.value <=0)
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
																	M.powerlevel.value = 0
														M.Die(usr)
														usr.abt = rand(120,240)
														usr.abc()
													else
														M << "[usr] commited suicide by using Android Bomb and brining you along for the ride!"
														usr << "You blow up using the Android Bomb also successfully destroying [M]!"
														call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
														view(6) << 'sounds/death.wav'
														usr.powerlevel.value = 0
														usr.ki.value = 0
														usr.move = 1
														usr.dead = 0
														usr.Die()
														M.powerlevel.value = 0
														M.ki.value = 0
														M.move = 1
														M.dead = 0
														if(M.mon )
															if(M.powerlevel.value <=0)
																if(M.expkn == null && M.expkk == null)
																	M.expkn = "[usr.name]"
																	M.expkk = "[usr.key]"
																	M.powerlevel.value = 0
														M.Die(usr)
														usr.abt = rand(120,240)
														usr.abc()

												else
													M << "[usr] commited suicide by using Android Bomb and brining you along for the ride!"
													usr << "You blow up using the Android Bomb also successfully destroying [M]!"
													call(/RoundExplosion/proc/NDBlast)(usr.loc,2,6)
													view(6) << 'sounds/death.wav'
													usr.powerlevel.value = 0
													usr.ki.value = 0
													usr.move = 1
													usr.dead = 0
													usr.Die()
													M.powerlevel.value = 0
													M.ki.value = 0
													M.move = 1
													M.dead = 0
													if(M.mon )
														if(M.powerlevel.value <=0)
															if(M.expkn == null && M.expkk == null)
																M.expkn = "[usr.name]"
																M.expkk = "[usr.key]"
																M.powerlevel.value = 0
													M.Die(usr)
													usr.abt = rand(90,180)
													usr.abc()

			verb
				TimeC()
					set category = null
					set name = "Time Counter"
					set src in usr.client.screen
					if(usr.lqt == null)
						usr.lqt = 0
					usr << "You have [usr.abt] minutes left before using Android Bomb"

obj
	techs
		wKamehameha
			name = "Warp Kamehameha"
			icon = 'icons/techhands.dmi'
			icon_state = "wrpk"
			Click()
				var/list/Players=list()
				for(var/mob/A in players)
					if(A.z != 10&&A.z != 20&&A.z != 8&&A.z != 3&&A.z != 2&&A.dead != 1&&A.itinvis != 1&&A.ccuse != 1&&A.hbtcuse != 1&&A.z != 15&&A.itinvis != 1 && A.dead != 1)
						Players+=A
				var/mob/Target=input("Select a target.","Warp Kamehameha","") as mob in Players
				if((Target in world) && ismob(Target))
					if(usr.z == 10)
						alert("You can't use Warp Kamehameha here!")
					else
						if(usr.dead )
							alert("You can't use 'Warp Kamehameha' while being dead.")
						else
							var/mob/M = Target
							if(usr.kame)
								alert("You can't use 'Kamehameha' while using another technique.")
							else
								if(usr.zanzoken)
									alert("You can't use 'Kamehameha' while using Zanzoken.")
								else
									if(!usr.move)
										alert("You can't use this technique now!")
									else
										usr.kame = 1
										var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
										amount = round(amount)
										if(amount <= 0)
											alert("You can't put this amount of energy into this attack!")
											usr.kame = 0
										if(amount >= 1)
											if(amount > usr.ki.value)
												alert("You can't put that amount of Ki into this technique!")
												usr.kame = 0
											if(amount <= usr.ki.value)
												usr.move = 0
												usr.ki.value -= amount
												usr.beamdmg = amount * (usr.focus.value*4)/usr.focus.max_value
												usr.attacking = 1
												usr.client.show_verb_panel = 0
												usr.hideipan = 1
												usr.frozen = 1
												usr.kame = 1
												view(6) << "<font color = red>[usr]:<font color = black> KA.."
												view(6) << 'sounds/ka.wav'
												sleep(12)
												view(6) << "<font color = red>[usr]:<font color = black> ME.."
												view(6) << 'sounds/me.wav'
												usr.overlays += /obj/kame
												sleep(12)
												view(6) << "<font color = red>[usr]:<font color = black> HA.."
												view(6) << 'sounds/ha.wav'
												sleep(12)
												view(6) << "<font color = red>[usr]:<font color = black> ME.."
												view(6) << 'sounds/me2.wav'
												usr.loc=locate(M.x,M.y-4,M.z)
												view(6) << 'sounds/it.wav'
												usr.dir = NORTH
												sleep(15)
												view(6) << "<font color = red>[usr]:<font color = black> HA!!!"
												view(6) << 'sounds/ha2.wav'
												view(20) << 'sounds/chou_fire.wav'
												usr.overlays -= /obj/kame
												usr.Beam(0,128,226,"Kamehameha",usr.beamdmg,usr)
												usr.kame = 0
												usr.frozen = 0
												usr.grav = 0
												usr.client.show_verb_panel = 1
												usr.hideipan = 0
												usr.attacking = 0
												usr.move = 1

obj
	techs
		andskisphere
			name = "Ki Sphere"
			icon = 'icons/techhands.dmi'
			icon_state = "bbang"
			Click()
				if(usr.kame )
					alert("You can't use 'Ki Sphere' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Ki Sphere' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put that amount of Ki into the attack.")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.kame = 1
									usr.attacking = 1
									usr.frozen = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.move = 0
									view(20) << 'sounds/kicharge.wav'
									usr.overlays += /obj/kame
									sleep(30)
									usr.projectile = "Ki Sphere"
									usr.projdmg = (amount * 8 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<FONT COLOR = GREEN><I>Ki Sphere can now be fired."

obj
	mysticwind
		name = "Wind"
		icon = 'icons/windeffect.dmi'
		icon_state = ""
		density = 1
		layer = 9
		Bump(Obstacle)
			del(src)

obj
	techs
		sgk
			name = "Super Ghost Kamikaze Attack"
			icon = 'icons/techhands.dmi'
			icon_state = "ghos"
			Click()


				if(usr.kame )
					alert("You can't use 'Super Ghost Kamikaze Attack' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Super Ghost Kamikaze Attack' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of Ki into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									view(6) << "<FONT COLOR = RED>[usr]: </FONT>SUPER GHOST KAMIKAZE ATTACK!"
									view(6) << 'sounds/sgk.wav'
									sleep(72)
									usr.move = 1
									usr.icon_state = ""
									view(6) << 'sounds/sgklaugh.wav'
									var/obj/sgkghost/G = new(usr.loc)
									G.loc=locate(usr.x,usr.y+1,usr.z)
									walk_towards(G,usr,2)
									G.name = "[usr]'s Ghost"
									G.owner = usr
									G.power = (amount * 2.5 * (usr.focus.value*2)/usr.focus.max_value)
									usr << "<B>Your ghost begins to follow you!"
									usr << "<B>This ghost will be deleted within 2 minutes!"
									sleep(1)
									usr.kame = 0
									spawn(1200)
										del(G)
obj
	sgkghost
		name = ""
		icon = 'icons/ghost.dmi'
		icon_state = "2"
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
				owner
		Click()
			if(src.owner == usr)
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Super Ghost Kamikaze Attack","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(usr.kame == 0)
						view(6) << "<B>[src] laughs histerically!"
						view(6) << 'sounds/sgklaugh.wav'
						usr.kame = 1
						sleep(31)
						view(6) << "<B>[src] flies after [M]!"
						missile(/obj/sgkghost,src,M)
						call(/RoundExplosion/proc/NDBlast)(M.loc,1,4)
						M.powerlevel.value -= power
						if(M.mon )
							if(M.powerlevel.value <=0)
								if(M.expkn == null && M.expkk == null)
									M.expkn = "[killedBy.name]"
									M.expkk = "[killedBy.key]"
						M.Die(killedBy)
						del(src)
					else
						usr << "<B>This ghost is already attacking!"
				else
					usr << "<B>There is anything to attack near here."
			else
				usr << "<B>This isn't yours!"
obj
	techs
		imprison
			name = "Imprisonment"
			icon = 'icons/techhands.dmi'
			icon_state = "hand"
			Click()
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Imprisonment","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(M.name == usr.name)
						usr << "You can't target yourself!"
					else
						if(M.client)
							if(M.frozen )
								alert("That target already has been imprisoned.")
							else
								M.frozen = 1
								M.move = 0
								M.attacking = 1
								M.kame = 1
								M.client.show_verb_panel = 0
								M.hideipan = 1
								view(6) << "<FONT COLOR = RED>[usr]:</FONT> IMPRISONMENT!"
								view(20) << 'sounds/deflect.wav'
								M.underlays += 'icons/impris.dmi'
								M << "<B>You begin to be held by a strange barrier around your body."
								usr << "<B>You have imprisoned [M], with your Imprisonment technique."
								sleep(rand(25,125))
								M.frozen = 0
								M.move = 1
								M.attacking = 0
								M.kame = 0
								M.client.show_verb_panel = 1
								M.hideipan = 0
								M.underlays -= 'icons/impris.dmi'
								M << "<B>You can now move again, the barrier has left your body!"
						else
							usr << "<B>Your target doesn't seem to be a player."
				else
					usr << "<B>Target has gone out of sight or there isn't any targets near!"


obj
	techs
		timefreeze
			name = "Time Freeze"
			icon = 'icons/techhands.dmi'
			icon_state = "hand"
			Click()
				var/list/Players=list()
				for(var/mob/A in oview(6))
					if(istype(A,/mob/characters)||A.npp==0)
						Players+=A
				var/mob/Target=input("Select a target.","Time Freeze","") as mob in Players
				if((Target in oview(6)) && ismob(Target))
					var/mob/M = Target
					if(M.name == usr.name)
						usr << "You can't target yourself!"
					else
						if(M.client)
							if(M.frozen )
								alert("That target already is frozen.")
							else
								if(usr.ffcht > 0)
									alert("You can't use this right now!")
								else
									M.frozen = 1
									M.move = 0
									M.attacking = 1
									M.client.show_verb_panel = 0
									M.hideipan = 1
									M.kame = 1
									view(6) << "<FONT COLOR = RED>[usr]:</FONT> TIME FREEZE!!!"
									view(20) << 'sounds/timefreeze.wav'
									M << "<B>You begin to be held by a strange force."
									usr << "<B>You have stunned [M], with your Time Freeze technique."
									usr.ffcht += 3
									usr.ffchc()
									M.ffcht += rand(1,3)
									M.timefreeze()

						else
							usr << "<B>Your target doesn't seem to be a player."
			verb
				TimeC()
					set name = "Time Counter"
					set category = null
					set src in usr.client.screen
					var/ffch2
					if(usr.ffcht == null)
						ffch2 = "no waiting"
					else
						ffch2 = usr.ffcht
					usr << "You have [ffch2] minutes left before using [src.name] again!"

#define DISC 1
#define BALL 2
#define BEAM 4
#define BLAST 8
#define WARP 16
#define BLIND 32
#define STUN 64
#define INCDMG 128
#define INCSPD 256

obj/custattkeff
	density = 0

obj/customattk
	var
		attkname
		attkdelay = 20
		list/attkparts[0]
		attkcolor
		attkattribs
	verb
		custattk()
			set name = "Custom Attack"
			set category = "Other"
			var/amount = input(usr,"How much energy do you wish to put into this attack? (You have [num2text(usr.ki.value,100)] avaliable for use!)","[attkname]") as num
			var/icon/i
			var/obj/O = new /obj/custattkeff
			if((attkattribs & DISC) == DISC)
				i = new('icons/custattack.dmi',"disc")
			else if((attkattribs & BALL) == BALL)
				i = new('icons/custattack.dmi',"ball")
			else if((attkattribs & BEAM) == BEAM)
				i = new('icons/custattack.dmi',"beam")
			else if((attkattribs & BLAST) == BLAST)
				i = new('icons/custattack.dmi',"blast")
			i.Blend(attkcolor, ICON_ADD)
			O.icon = i
			if((attkattribs & INCDMG) == INCDMG)
				amount += (amount * 1.25)
			else if((attkattribs & INCSPD) == INCSPD)
				attkdelay = 15
			if((attkattribs & WARP) == WARP)
				//going to copy this from w-kamehameha and modify it.
				var/T = input(usr,"Who do you want to attack?","[attkname]") as text
				var/mob/M
				for(var/mob/B in players)
					if(!T)
						alert("You could not sense that person's life-force.")
						return
					if(B.name==T)
						if(B==usr)
							if(B.z == 20||B.z == 10)
								usr << "<B>[B] is too far away."
							else
								if(B.dead == 0||B.dead == null)
									return
								else
									usr << "<B>[B] is too far away."
						else
							M = B
				if(!M)
					alert("You could not sense that person's life-force.")
					return
				if(usr.zanzoken )
					alert("You can't use '[attkname]' while using Zanzoken.")
				else
					if((attkattribs & WARP) == WARP)
						if(usr.z == 10)
							alert("You can't use this attack here.")
					else
						if(M.npp ||M.npc ||M.npp == null)
							usr << "You can't attack them. They are a newbie."
						if(M.npp == 0)
							if(usr.kame )
								usr << "<tt>You are currently using [attkname]."
							if(usr.kame == 0)
								if(amount <= 0)
									view(6) << "[usr] dies from putting too much energy in his [attkname]."
									usr.powerlevel.value = 0
									usr.Die()
								if(amount >= 1)
									if(amount > usr.ki.value)
										usr.kame = 1
										for(var/p in attkparts)
											view(6) << "<font color = red>[usr]:<font color = black> <tt>[p]"
											sleep(attkdelay)
										usr.powerlevel.value = 0
										usr.kame = 0
										usr.overlays -= /obj/kame
										usr.Die()
									if(amount <= usr.ki.value)
										usr.kame = 1
										for(var/p = 1, p <= attkparts.len, p++)
											if(p == attkparts.len - 1)
												usr.loc=locate(M.x,M.y+1,M.z)
												view(6) << 'sounds/it.wav'
											view(6) << "<font color = red>[usr]:<font color = black> <tt>[attkparts[p]]"
											sleep(attkdelay)
										s_missile(O, usr, M)
										sleep(1)
										usr.kame = 0
										usr.powerlevel.value -= amount * 2
										if(usr.mon )
											if(usr.powerlevel.value <=0)
												if(usr.expkn == null && usr.expkk == null)
													usr.expkn = "[M.name]"
													usr.expkk = "[M.key]"
										if(M.absorb )
											view(6) << "[M] absorbs [usr]'s [attkname]"
											M.kiabc = amount

											if((M.kiabc/2000) >= (M.powerlevel.max_value*5))
												M.powerlevel.value = 0
												M.Die(usr)
												del(src)
											else
												M.powerlevel.value += round(amount/2000)
												M.ki.value += round(amount/2000)
												del(src)
										else
											M.powerlevel.value -= amount * (usr.focus.value*6)/usr.focus.max_value
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											view(6) << "<font color = red>[usr] shoots \a [attkname] at [M]!!!"
										M.Die(usr)
										usr.KO(M)
			else
				//do damage/display here
				var/mob/M = input(usr,"Who do you want to attack?","[attkname]") as mob in oview()
				if(usr.zanzoken )
					alert("You can't use '[attkname]' while using Zanzoken.")
				else
					if(!M || !istype(M)) return
					if(M.npp ||M.npc ||M.npp == null)
						usr << "You can't attack them. They are a newbie."
					if(M.npp == 0)
						if(usr.kame )
							usr << "<tt>You are currently using [attkname]."
						if(usr.kame == 0)
							if(amount <= 0)
								view(6) << "[usr] dies from putting too much energy in his [attkname]."
								usr.powerlevel.value = 0
								usr.Die()
							if(amount >= 1)
								if(amount > usr.ki.value)
									usr.kame = 1
									for(var/p in attkparts)
										view(6) << "<font color = red>[usr]:<font color = black> <tt>[p]"
										sleep(attkdelay)
									usr.powerlevel.value = 0
									usr.kame = 0
									usr.overlays -= /obj/kame
									usr.Die()
								if(amount <= usr.ki.value)
									usr.kame = 1
									for(var/p in attkparts)
										view(6) << "<font color = red>[usr]:<font color = black> <tt>[p]"
										sleep(attkdelay)
									s_missile(O, usr, M)
									sleep(1)
									usr.kame = 0
									usr.powerlevel.value -= amount * (usr.focus.value*4)/usr.focus.max_value
									if(usr.mon )
										if(usr.powerlevel.value <=0)
											if(usr.expkn == null && usr.expkk == null)
												usr.expkn = "[M.name]"
												usr.expkk = "[M.key]"
									if(M.absorb )
										view(6) << "[M] absorbs [usr]'s [attkname]"
										M.kiabc = amount

										if((M.kiabc/2000) >= (M.powerlevel.max_value*5))
											M.powerlevel.value = 0
											M.Die(usr)
											del(src)
										else
											M.powerlevel.value += round(amount/2000)
											M.ki.value += round(amount/2000)
											del(src)
									if(M.absorb == 0)
										M.powerlevel.value -= amount * 2
										if(M.mon )
											if(M.powerlevel.value <=0)
												if(M.expkn == null && M.expkk == null)
													M.expkn = "[usr.name]"
													M.expkk = "[usr.key]"
										view(6) << "<font color = red>[usr] shoots \a [attkname] at [M]!!!"
									M.Die(usr)
									usr.KO(M)
				if((attkattribs & BLIND) == BLIND)
					M.sight |= BLIND
					sleep(30)
					M.sight &= ~BLIND
				else if((attkattribs & STUN) == STUN)
					M.move = 0
					sleep(30)
					M.move = 1

		teach(mob/M in oview(1))
			set name = "Teach Technique"
			set category = "Other"
			if(!M) return
			switch(alert(M,"Do you wish to learn [src.attkname] from [usr]?","Learn","Yes","No"))
				if("Yes")
					var/obj/customattk/O = new
					O.name = src.name
					O.attkname = src.attkname
					O.attkdelay = src.attkdelay
					O.attkparts = src.attkparts
					O.attkcolor = src.attkcolor
					O.attkattribs = src.attkattribs
					for(var/obj/customattk/C in M.contents)
						M.contents -= C
					M.contents += O

obj/makecustattk
	verb
		make()
			set name = "Create Technique"
			set category = "Other"
			var/numparts
			var/obj/customattk/O = new
			O.name = input(usr,"What is your attacks name?","Custom Attack") as text
			O.attkname = O.name
			numparts = input(usr,"How many parts?","Custom Attack") as num
			for(var/i = 0, i < numparts, i++)
				O.attkparts += input(usr,"What do you want to say during this part?","Custom Attack") as text
			O.attkcolor = F_Color_Selector.Get_Color()
			switch(input(usr,"What type of attack do you want?","Custom Attack") in list("Beam","Disc","Ball","Blast"))
				if("Beam")
					O.attkattribs += BEAM
				if("Ball")
					O.attkattribs += BALL
				if("Blast")
					O.attkattribs += BLAST
				if("Disc")
					O.attkattribs += DISC
			switch(input(usr,"Which extra attribute do you want?","Custom Attack") in list("Warp", "Blind", "Stun", "Increased Damage", "Increased Speed"))
				if("Warp")
					O.attkattribs += WARP
				if("Blind")
					O.attkattribs += BLIND
				if("Stun")
					O.attkattribs += STUN
				if("Increased Damage")
					O.attkattribs += INCDMG
				if("Increased Speed")
					O.attkattribs += INCSPD
			usr.contents += O
			usr.contents -= src


obj
	techs
		KiBeam
			name = "Ki Beam"
			icon = 'icons/techhands.dmi'
			icon_state = "ki"
			Click()


				if(usr.kame )
					alert("You can't use 'Ki Beam' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Ki Beam' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.ki.value -= amount
									usr.attacking = 1
									usr.frozen = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.kame = 1
									view(6) << 'sounds/kicharge.wav'
									var/obj/beamstart/cicon = new(null)
									cicon.icon = 'icons/custtom.dmi'
									var/R = 0
									var/G = 0
									var/B = 0
									if(usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Android (Mechanical)"||usr.race == "Half-Saiyan"||usr.race == "Namek")
										R = 0
										G = 128
										B = 226
									if(usr.race == "Changling"||usr.race == "Buu")
										R = 214
										G = 96
										B = 180
									if(usr.race == "Android (Biological)")
										R = 252
										G = 245
										B = 90
									if(findtext(usr.race,"Wizard"))
										R = 0
										G = 178
										B = 0
									cicon.icon += rgb(R,G,B)
									usr.overlays += cicon
									sleep(18)
									usr.beam = "Ki Beam"
									usr.beamdmg = amount * (usr.focus.value*2)/usr.focus.max_value
									usr << "<FONT COLOR = GREEN><I>Ki Beam can now be fired."

obj
	techs
		sbc
			name = "Special Beam Cannon"
			icon = 'icons/techhands.dmi'
			icon_state = "sbc"
			Click()


				if(usr.kame )
					alert("You can't use 'Special Beam Cannon' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Special Beam Cannon' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this technique now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of energy into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.move = 0
									usr.ki.value -= amount
									usr.attacking = 1
									usr.frozen = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.kame = 1
									view(10) << 'sounds/sbc.wav'
									usr.overlays += 'icons/flashki.dmi'
									sleep(15)
									view(6) << "<FONT COLOR = RED>[usr]:</FONT> SPECIAL.."
									sleep(5)
									view(6) << "<FONT COLOR = RED>[usr]:</FONT> BEAM.."
									sleep(9)
									usr << "<FONT COLOR = GREEN><I>Special Beam Cannon can now be fired."
									usr.beam = "Special Beam Cannon"
									usr.beamdmg = (amount * 4.5 * (usr.focus.value*2)/usr.focus.max_value)
obj
	techs
		humangeno
			name = "Human Extinction Attack"
			icon = 'icons/techhands.dmi'
			icon_state = "shp1"
			Click()


				if(usr.kame == 0)
					usr.move = 0
					usr.kame = 1
					alert("The Human Extinction Attack only affects players, if there aren't any on the map you are on, the technique will immediatly stop.")
					usr.kame = 1
					var/dam = input("How much energy do you want to put into this attack? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num
					if(dam>usr.ki.value||dam<=0)
						alert("You can't put that amount of Ki into that attack!")
						usr.kame = 0
					else
						spawn(90)
							view(150) << "<font color = red>[usr]:<font color = black> HUMAN EXTINCTION ATTACK.."
						view(150) << 'sounds/extinctionattack.wav'
						usr.ki.value -= dam
						usr.icon_state = "des"
						sleep(379)
						var/obj/geno/A = new(null)
						usr.overlays += A
						usr.icon_state = "des"
						view(25) << 'sounds/mas_charge.wav'
						sleep(24)
						for(var/mob/characters/M in world)
							if(M.z==usr.z)
								if(M.client)
									if(M.name==usr.name)
										usr.icon_state=""
										usr.move = 1
										usr.kame = 0
										usr.overlays -= A
										..()
									else
										view(25) << 'sounds/mas_fire.wav'
										usr.icon_state=""
										missile(/obj/geno2,usr,M)
										M.powerlevel.value -= dam * 0.01 * (usr.focus.value*8)/usr.focus.max_value
										if(M.mon )
											if(M.powerlevel.value <=0)
												if(M.expkn == null && M.expkk == null)
													M.expkn = "[usr.name]"
													M.expkk = "[usr.key]"
										M.Die(usr)
							else
								usr.powerlevel.value += 0
				else
					alert("You can't use this attack while using another one!")

obj/geno
	name = "Human Extinction Attack"
	icon = 'icons/geno.dmi'
	icon_state = "2"
	density = 0
	layer = 9
	pixel_y=32

obj/geno2
	name = "Human Extinction Attack"
	icon = 'icons/geno.dmi'
	icon_state = ""
	density = 0

obj
	techs
		kametorp
			name = "Kamehameha Torpedos"
			icon = 'icons/techhands.dmi'
			icon_state = "kame"
			Click()


				if(usr.kame )
					alert("You can't use 'Kamehameha Torpedos' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Kamehameha Torpedos' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put that amount of Ki into the attack.")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.kame = 1
									usr.move = 0
									usr.overlays += /obj/kame
									view(6) << 'sounds/kamehametorp.wav'
									view(6) << "<font color = red>[usr]:<font color = black> KA.."
									sleep(6)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									sleep(6)
									view(6) << "<font color = red>[usr]:<font color = black> HA.."
									sleep(6)
									view(6) << "<font color = red>[usr]:<font color = black> ME.."
									sleep(12)
									view(6) << "<font color = red>[usr]:<font color = black> HA!!!"
									usr.move = 1
									usr.overlays -= /obj/kame
									var/obj/kametorp/blast = new(usr.loc, usr.dir)
									if(usr.dir == NORTH)
										blast.loc = locate(usr.x,usr.y+1,usr.z)
									if(usr.dir == SOUTH)
										blast.loc = locate(usr.x,usr.y-1,usr.z)
									if(usr.dir == EAST)
										blast.loc = locate(usr.x+1,usr.y,usr.z)
									if(usr.dir == WEST)
										blast.loc = locate(usr.x-1,usr.y,usr.z)
									blast.power = amount * 1.1 * (usr.focus.value*2)/usr.focus.max_value
									blast.power = round(blast.power)
									usr.overlays -= /obj/kame
									blast.owner = usr
									sleep(1)
									usr.kame = 0
									usr.ki.value -= amount
									spawn(250)
										del(blast)
obj
	kametorp
		name = "Kamehameha Torpedo"
		icon = 'icons/turfs2.dmi'
		icon_state = "torpedo"
		density = 1
		layer = 9
		var
			power
			owner
			firing
		Click()
			if(firing) return
			if(owner==usr)
				var/mob/Target=input("Select a target.","Kamehameha Torpedos","") as mob in oview(6)
				if(!ismob(Target)) return
				switch(alert("Are you sure you want to fire the Kamehameha Torpedo at [Target]?","Kamehameha Torpedos","Yes","No"))
					if("Yes")
						if(Target in oview(6))
							firing = 1
							view(6) << 'sounds/chou_fire.wav'
							var/mob/M = Target
							missile(/obj/ktorpedo,src,M)
							call(/RoundExplosion/proc/NDBlast)(M.loc,1,2)
							M.powerlevel.value -= power
							if(M.mon )
								if(M.powerlevel.value <=0)
									if(M.expkn == null && M.expkk == null)
										M.expkn = "[owner:name]"
										M.expkk = "[owner:key]"
							M.Die(owner)
							del(src)
						else
							usr << "<B>Target has gone out of view!"
							..()

					if("No")
						..()
			else
				usr.powerlevel.value += 0

obj/ktorpedo
	name = "Kamehameha Torpedo"
	icon = 'icons/turfs2.dmi'
	icon_state = "torpedo"
	density = 0
	layer = 9

obj
	techs
		hellzone
			name = "Hellzone Grenade"
			icon = 'icons/techhands.dmi'
			icon_state = "hellz"
			Click()
				if(usr.kame )
					usr << "<B>Your already using another or this technique!"
				else
					usr.kame = 1
					var/mob/Target=input("Select a target.","Hellzone Grenade","") as mob in oview(6)
					if((Target in oview(6)) && ismob(Target))
						var/mob/M = Target
						if(usr.zanzoken )
							alert("You can't use 'Hellzone Grenade' while using Zanzoken.")
						else
							if(usr.move == 0)
								alert("You can't use this attack now!")
							if(usr.move )
								var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
								amount = round(amount)
								if(amount <= 0)
									alert("You can't put that amount of Ki into the attack.")
								if(amount >= 1)
									if(amount > usr.ki.value)
										alert("You can't put that amount of Ki into this technique!")
									if(amount <= usr.ki.value)
										usr.kame = 1
										usr.ki.value -= amount
										M.move = 0
										M.attacking = 1
										M.frozen = 1
										if(M.client)
											M.client.show_verb_panel = 0
											M.hideipan = 1
										M << "<B>You feel immoblized!"
										usr.move = 0
										usr.overlays += /obj/ccki1
										usr.overlays += /obj/ccki2
										view(6) << 'sounds/hellzone.wav'
										sleep(28)
										if(!usr) return
										usr.overlays -= /obj/ccki1
										usr.overlays -= /obj/ccki2
										if(!M) return
										view(6) << "<font color = red>[usr]:<font color = black> SCATTER SHOT!!!"
										var/spot1 = M.x + (rand(-4,4))
										var/spot2 = M.y + (rand(-4,4))
										var/spot3 = M.x + (rand(-4,4))
										var/spot4 = M.y + (rand(-4,4))
										var/spot5 = M.x + (rand(-4,4))
										var/spot6 = M.y + (rand(-4,4))
										var/spot7 = M.x + (rand(-4,4))
										var/spot8 = M.y + (rand(-4,4))
										var/spot9 = M.x + (rand(-4,4))
										var/spot10 = M.y + (rand(-4,4))
										var/spot11 = M.x + (rand(-4,4))
										var/spot12 = M.y + (rand(-4,4))
										var/spot13 = M.x + (rand(-4,4))
										var/spot14 = M.y + (rand(-4,4))
										var/spot15 = M.x + (rand(-4,4))
										var/spot16 = M.y + (rand(-4,4))
										var/spot17 = M.x + (rand(-4,4))
										var/spot18 = M.y + (rand(-4,4))
										var/obj/hellmarker/marker1 = new(M.loc, M.dir)
										var/obj/hellmarker/marker2 = new(M.loc, M.dir)
										var/obj/hellmarker/marker3 = new(M.loc, M.dir)
										var/obj/hellmarker/marker4 = new(M.loc, M.dir)
										var/obj/hellmarker/marker5 = new(M.loc, M.dir)
										var/obj/hellmarker/marker6 = new(M.loc, M.dir)
										var/obj/hellmarker/marker7 = new(M.loc, M.dir)
										var/obj/hellmarker/marker8 = new(M.loc, M.dir)
										var/obj/hellmarker/marker9 = new(M.loc, M.dir)
										marker1.loc = locate(spot1, spot2, M.z)
										marker2.loc = locate(spot3, spot4, M.z)
										marker3.loc = locate(spot5, spot6, M.z)
										marker4.loc = locate(spot7, spot8, M.z)
										marker5.loc = locate(spot9, spot10, M.z)
										marker6.loc = locate(spot11, spot12, M.z)
										marker7.loc = locate(spot13, spot14, M.z)
										marker8.loc = locate(spot15, spot16, M.z)
										marker9.loc = locate(spot17, spot18, M.z)
										missile(/obj/hellgren,usr,marker1)
										marker1.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker2)
										marker2.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker3)
										marker3.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker4)
										marker4.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker5)
										marker5.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker6)
										marker6.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker7)
										marker7.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker8)
										marker8.icon = 'icons/hellgren.dmi'
										sleep(3)
										missile(/obj/hellgren,usr,marker9)
										marker9.icon = 'icons/hellgren.dmi'
										sleep(32)
										usr.kame = 0
										usr.icon_state = "sbomb"
										view(6) << "<font color = red>[usr]:<font color = black> COMBINATION!!"
										sleep(4)
										usr.icon_state = ""
										flick("meditate",usr)
										view(6) << "<font color = red>[usr]:<font color = black> YA!!!!"
										missile(/obj/hellgren,marker1,M)
										missile(/obj/hellgren,marker2,M)
										missile(/obj/hellgren,marker3,M)
										missile(/obj/hellgren,marker4,M)
										missile(/obj/hellgren,marker5,M)
										missile(/obj/hellgren,marker6,M)
										missile(/obj/hellgren,marker7,M)
										missile(/obj/hellgren,marker8,M)
										missile(/obj/hellgren,marker9,M)
										del(marker1)
										del(marker2)
										del(marker3)
										del(marker4)
										del(marker5)
										del(marker6)
										del(marker7)
										del(marker8)
										del(marker9)
										call(/RoundExplosion/proc/NDBlast)(M.loc,1,3)
										M.powerlevel.value -= amount * 2.25 * (usr.focus.value*3)/usr.focus.max_value
										if(M.mon )
											if(M.powerlevel.value <=0)
												if(M.expkn == null && M.expkk == null)
													M.expkn = "[usr.name]"
													M.expkk = "[usr.key]"
										M.Die(usr)
										if(M)
											M.move = 1
											M.attacking = 0
											M.frozen = 0
											if(M.client)
												M.client.show_verb_panel = 1
												M.hideipan = 0
										usr.move = 1
										sleep(1)
										usr.kame = 0
					else
						usr << "<B>Target has gone out of range!"
						usr.kame = 0
obj/hellgren
	name = "Hellzone Grenade"
	icon = 'icons/turfs2.dmi'
	icon_state = "hellzone"
	density = 0
	layer = 9

obj/hellmarker
	name = "Dragonball Online"
	icon = 'icons/turfs2.dmi'
	icon_state = "marker"
	density = 0

obj/GNamekTop
	icon = 'icons/grownamek.dmi'
	icon_state = "top"
	layer = 9
	pixel_y = 32
	density = 0

mob
	proc
		growcount()
			set background = 1
			spawn(1)
				while(src.oozaru > 0)
				{
					src.oozaru--
					sleep(600)
					if(src.oozaru <= 1)
						src << "<B>You can now use Grow again!"
						src.oozaru = 0
						break
				}

mob
	proc
		growrevcount()
			set background = 1
			spawn(1)
				while(src.oozrev > 0)
				{
					src.oozrev--
					sleep(600)
					if(src.oozrev <= 1)
						if(src.state == "Grown Namek")
							src << "<B>You begin to revert back to your normal state!"
							oview(50) << "<B>[src] has reverted from his Grown Namek form!"
							src.overlays.Cut()
							src.underlays.Cut()
							src.skinrestore()
							src.CreateName()
							src.icon_state = ""
							if(src.powerlevel.value >= src.powerlevel.max_value)
								src.powerlevel.restore()
							if(src.ki.value >= src.ki.max_value)
								src.ki.restore()
							src.state = "Normal"
							src.oozrev = 0
				}
obj
	techs
		grow
			name = "Grow"
			icon = 'icons/techhands.dmi'
			icon_state = "grow"
			Click()


				if(usr.state == "Normal")
					if(usr.move )
						if(usr.kame == 0)
							if(usr.oozaru == 0)
								if(usr.race == "Namek")
									usr.oozrev = 5
									usr.oozaru = 10
									view(10) << "<font color = green>* </FONT><FONT COLOR = BLUE>[usr.name] begins to grow!</FONT><font color = green> *</FONT>"
									view(10) << 'sounds/grow.wav'
									usr.icon_state = "ssj"
									usr.overlays += 'icons/wind.dmi'
									sleep(44)
									usr.overlays -= 'icons/wind.dmi'
									view(10) << 'sounds/namek_trans2.wav'
									usr.state = "Grown Namek"
									usr << "<B>This form only lasts for 5 minutes, then you will automatically revert!"
									usr << "<B><FONT COLOR = RED>Your clothes rip apart!"
									usr.overlays.Cut()
									usr.underlays.Cut()
									usr.CreateName()
									var/obj/GNamekTop/A = new(null)
									usr.overlays += A
									usr.icon = 'icons/grownamek.dmi'
									usr.powerlevel.value = usr.powerlevel.max_value * 1.20
									usr.ki.value  = usr.ki.max_value * 1.20
									usr.growrevcount()
									usr.growcount()
								else
									usr.powerlevel.value += 0
							else
								alert("You need to wait an hour before using this again!")
						else
							alert("You are doing something already!")
					else
						alert("You are doing something already!")
				else
					alert("You need to be in your normal state!")

obj
	techs
		sgkkame
			name = "Super Ghost Kamikaze Attack (Kamehameha)"
			icon = 'icons/techhands.dmi'
			icon_state = "ghosk"
			Click()
				if(usr.kame )
					alert("You can't use 'Super Ghost Kamikaze Attack (Kamehameha)' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Super Ghost Kamikaze Attack (Kamehameha)' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of Ki into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									view(6) << "<FONT COLOR = RED>[usr]: </FONT>SUPER GHOST KAMIKAZE ATTACK!"
									view(6) << 'sounds/sgk.wav'
									sleep(72)
									view(6) << 'sounds/sgklaugh.wav'
									var/obj/nghost/ghostA = new(usr.loc)
									var/obj/nghost/ghostB = new(usr.loc)
									var/obj/nghost/ghostC = new(usr.loc)
									if(usr.dir == NORTH)
										ghostA.loc = locate(usr.x, usr.y+1, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y+1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y+1, usr.z)
										ghostA.dir = NORTH
										ghostB.dir = NORTH
										ghostC.dir = NORTH
									if(usr.dir == SOUTH)
										ghostA.loc = locate(usr.x, usr.y-1, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y-1, usr.z)
										ghostA.dir = SOUTH
										ghostB.dir = SOUTH
										ghostC.dir = SOUTH
									if(usr.dir == WEST)
										ghostA.loc = locate(usr.x-1, usr.y, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x-1, usr.y+1, usr.z)
										ghostA.dir = WEST
										ghostB.dir = WEST
										ghostC.dir = WEST
									if(usr.dir == EAST)
										ghostA.loc = locate(usr.x+1, usr.y, usr.z)
										ghostB.loc = locate(usr.x+1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y+1, usr.z)
										ghostA.dir = EAST
										ghostB.dir = EAST
										ghostC.dir = EAST
									sleep(45)
									ghostA.overlays += /obj/kame
									ghostB.overlays += /obj/kame
									ghostC.overlays += /obj/kame
									view(6) << 'sounds/sgkkame.wav'
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> KA.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> KA.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> KA.."
									sleep(10)
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									sleep(10)
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA.."
									sleep(10)
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> ME.."
									sleep(13)
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA!!!"
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA!!!"
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> HA!!!"
									ghostA.overlays -= /obj/kame
									ghostB.overlays -= /obj/kame
									ghostC.overlays -= /obj/kame
									var/obj/smallkame/blast = new(ghostA.loc, ghostA)
									var/obj/smallkame/blast2 = new(ghostB.loc, ghostB)
									var/obj/smallkame/blast3 = new(ghostC.loc, ghostC)
									blast.power = (amount*1.2) * (usr.focus.value*5)/usr.focus.max_value
									blast2.power = (amount*1.2) * (usr.focus.value*5)/usr.focus.max_value
									blast3.power = (amount*1.2) * (usr.focus.value*5)/usr.focus.max_value
									blast.killedBy = usr
									blast2.killedBy = usr
									blast3.killedBy = usr
									view(6) << 'sounds/chou_fire.wav'
									walk(blast,ghostA.dir)
									walk(blast2,ghostB.dir)
									walk(blast3,ghostC.dir)
									sleep(1)
									usr.move = 1
									usr.kame = 0
									spawn(40)
										del(ghostA)
										del(ghostB)
										del(ghostC)


obj
	nghost
		name = ""
		icon = 'icons/ghost.dmi'
		icon_state = "2"
		density = 1
		layer = 9

obj
	smallkame
		name = "Kamehameha"
		icon = 'icons/kame.dmi'
		icon_state = ""
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon )
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle.expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
					Obstacle.Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,3)
				del(src)
obj
	techs
		sgkgalit
			name = "Super Ghost Kamikaze Attack (Galit Gun)"
			icon = 'icons/techhands.dmi'
			icon_state = "ghosg"
			Click()


				if(usr.kame )
					alert("You can't use 'Super Ghost Kamikaze Attack (Galit Gun)' while using another technique.")
				else
					if(usr.zanzoken )
						alert("You can't use 'Super Ghost Kamikaze Attack (Galit Gun)' while using Zanzoken.")
					else
						if(usr.move == 0)
							alert("You can't use this attack now!")
						if(usr.move )
							usr.kame = 1
							var/amount = input("How much energy do you wish to put into it? (You have [num2text(usr.ki.value,100)] avaliable for use!)") as num|null
							amount = round(amount)
							if(amount <= 0)
								alert("You can't put this amount of Ki into this attack!")
								usr.kame = 0
							if(amount >= 1)
								if(amount > usr.ki.value)
									alert("You can't put that amount of Ki into this technique!")
									usr.kame = 0
								if(amount <= usr.ki.value)
									usr.ki.value -= amount
									usr.move = 0
									view(6) << "<FONT COLOR = RED>[usr]: </FONT>SUPER GHOST KAMIKAZE ATTACK!"
									view(6) << 'sounds/sgk.wav'
									sleep(72)
									view(6) << 'sounds/sgklaugh.wav'
									var/obj/nghost/ghostA = new(usr.loc)
									var/obj/nghost/ghostB = new(usr.loc)
									var/obj/nghost/ghostC = new(usr.loc)
									if(usr.dir == NORTH)
										ghostA.loc = locate(usr.x, usr.y+1, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y+1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y+1, usr.z)
										ghostA.dir = NORTH
										ghostB.dir = NORTH
										ghostC.dir = NORTH
									if(usr.dir == SOUTH)
										ghostA.loc = locate(usr.x, usr.y-1, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y-1, usr.z)
										ghostA.dir = SOUTH
										ghostB.dir = SOUTH
										ghostC.dir = SOUTH
									if(usr.dir == WEST)
										ghostA.loc = locate(usr.x-1, usr.y, usr.z)
										ghostB.loc = locate(usr.x-1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x-1, usr.y+1, usr.z)
										ghostA.dir = WEST
										ghostB.dir = WEST
										ghostC.dir = WEST
									if(usr.dir == EAST)
										ghostA.loc = locate(usr.x+1, usr.y, usr.z)
										ghostB.loc = locate(usr.x+1, usr.y-1, usr.z)
										ghostC.loc = locate(usr.x+1, usr.y+1, usr.z)
										ghostA.dir = EAST
										ghostB.dir = EAST
										ghostC.dir = EAST
									sleep(45)
									view(6) << 'sounds/sgkgalit.wav'
									sleep(13)
									ghostA.overlays += 'icons/galicki.dmi'
									ghostB.overlays += 'icons/galicki.dmi'
									ghostC.overlays += 'icons/galicki.dmi'
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GALIT.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GALIT.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GALIT.."
									sleep(8)
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GUN.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GUN.."
									view(6) << "<FONT COLOR = RED>Ghost: </FONT> GUN.."
									sleep(8)
									ghostA.overlays -= 'icons/galicki.dmi'
									ghostB.overlays -= 'icons/galicki.dmi'
									ghostC.overlays -= 'icons/galicki.dmi'
									var/obj/smallgalit/blast = new(ghostA.loc, ghostA)
									var/obj/smallgalit/blast2 = new(ghostB.loc, ghostB)
									var/obj/smallgalit/blast3 = new(ghostC.loc, ghostC)
									blast.power = (amount*1.4) * (usr.focus.value*5)/usr.focus.max_value
									blast2.power = (amount*1.4) * (usr.focus.value*5)/usr.focus.max_value
									blast3.power = (amount*1.4) * (usr.focus.value*5)/usr.focus.max_value
									blast.killedBy = usr
									blast2.killedBy = usr
									blast3.killedBy = usr
									view(6) << 'sounds/bigbang_blast.wav'
									walk(blast,ghostA.dir)
									walk(blast2,ghostB.dir)
									walk(blast3,ghostC.dir)
									sleep(1)
									usr.move = 1
									usr.kame = 0
									spawn(40)
										del(ghostA)
										del(ghostB)
										del(ghostC)

obj
	smallgalit
		name = "Galit Gun"
		icon = 'icons/galicblast.dmi'
		icon_state = ""
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			spawn()
				set background = 1
				if(ismob(Obstacle))
					if(Obstacle.absorb)
						oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
						Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
					if(!Obstacle.absorb)
						Obstacle.powerlevel.value -= power
					if(Obstacle.mon)
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle.expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
						call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
						Obstacle.Die(killedBy)
					del(src)
				else
					if(isobj(Obstacle))
						call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
					else if(isturf(Obstacle))
						call(/RoundExplosion/proc/NDBlast)(Obstacle,1,3)
						del(src)

mob
	proc
		Beam(var/R,var/G,var/B,var/Name,var/Damage,var/mob/characters/Person)
			set background = 1
			spawn(1)
				var/obj/beamstart/start = new(Person.loc, Person.dir)
				var/obj/beamstart/starticon = new(null)
				starticon.icon = start.icon
				starticon.icon_state = start.icon_state
				starticon.icon += rgb(R,G,B)
				start.icon = starticon.icon
				start.icon_state = start.icon_state
				if(Name == "Big Bang Kamehameha")
					start.icon = 'icons/BBK.dmi'
					start.icon_state = "start2"
					start.icon += rgb(R,G,B)
					spawn(7)
						start.icon_state = "start"
						start.icon += rgb(R,G,B)
					starticon.icon = 'icons/BBK.dmi'
					starticon.icon_state = "start2"
					starticon.icon += rgb(R,G,B)
				start.icon_state = start.icon_state
				if(Name == "Arrow Charge")
					start.icon = 'icons/spear.dmi'
					start.icon_state = "start2"
					//start.icon += rgb(R,G,B)
					spawn(7)
						start.icon_state = "start"
					//	start.icon += rgb(R,G,B)
					starticon.icon = 'icons/spear.dmi'
					starticon.icon_state = "start2"
					//starticon.icon += rgb(R,G,B)
				start.owner = Person
				start.dir = Person.dir
				start.loc = Person.loc
				start.name = Name
				del(starticon)
				if(Person.dir == NORTH)
					start.loc = locate(Person.x,Person.y+1,Person.z)
				if(Person.dir == SOUTH)
					start.loc = locate(Person.x,Person.y-1,Person.z)
				if(Person.dir == EAST)
					start.loc = locate(Person.x+1,Person.y,Person.z)
				if(Person.dir == WEST)
					start.loc = locate(Person.x-1,Person.y,Person.z)
				if(Name == "Big Bang Kamehameha")
					sleep(14)
				if(Name == "Arrow Charge")
					sleep(10)
				var/obj/beamblast/blast = new(start.loc, start.dir)
				var/obj/beamblast/blasticon = new(null)
				blasticon.icon = blast.icon
				if(Name == "Big Bang Kamehameha")
					blasticon.icon = 'icons/BBK.dmi'
					blasticon.icon += rgb(R,G,B)
				if(Name == "Arrow Charge")
					blasticon.icon = 'icons/spear.dmi'
					//blasticon.icon += rgb(R,G,B)
				blasticon.icon_state = blast.icon_state
				blasticon.icon += rgb(R,G,B)
				blast.icon = blasticon.icon
				if(Name == "Big Bang Kamehameha")
					blast.icon = 'icons/BBK.dmi'
					blast.icon += rgb(R,G,B)
				if(Name == "Arrow Charge")
					blast.icon = 'icons/spear.dmi'
					//blast.icon += rgb(R,G,B)
				blast.icon_state = blasticon.icon_state
				blast.power = Damage
				blast.killedBy = Person
				blast.dir = Person.dir
				blast.attacker = Person
				blast.R = R
				blast.G = G
				blast.B = B
				blast.name = Name
				walk(blast,Person.dir)
				Person.blast = 1
				del(blasticon)

atom/movable
	var
		beam = 0
		powerstruggle = 0
obj
	beamblast
		name = "None"
		icon = 'icons/customattack.dmi'
		icon_state = "blast"
		density = 1
		layer = 10
		beam = 1
		pixel_step_size = 12
		var
			power
			mob
				characters
					killedBy
			mob
				attacker
			R
			G
			B
			trailed = 0
			trailicon
		Move()
			spawn()
				if(trailed == 0)
					var/obj/beamtrail/E = new /obj/beamtrail(src.loc)
					var/obj/beamtrail/trailicon = new(null)
					trailicon.icon = E.icon
					trailicon.icon_state = E.icon_state
					if(src.name == "Big Bang Kamehameha")
						trailicon.icon = 'icons/BBK.dmi'
						trailicon.icon += rgb(R,G,B)
					if(src.name == "Arrow Charge")
						trailicon.icon = 'icons/spear.dmi'
					trailicon.icon += rgb(R,G,B)
					E.icon = trailicon.icon
					if(src.name == "Big Bang Kamehameha")
						E.icon = 'icons/BBK.dmi'
						E.icon += rgb(R,G,B)
					if(src.name == "Arrow Charge")
						E.icon = 'icons/spear.dmi'
					E.icon_state = trailicon.icon_state
					E.dir = src.dir
					E.owner = src.killedBy
					E.name = src.name
				else
					var/obj/beamtrail/E = new /obj/beamtrail(src.loc)
					var/obj/beamtrail/trailic = new(null)
					trailic.icon = trailicon
					trailic.icon_state = E.icon_state
					E.icon = trailic.icon
					E.icon_state = trailic.icon_state
					E.dir = src.dir
					E.owner = src.killedBy
					E.name = src.name
			..()
		Bump(Obstacle)
			if(ismob(Obstacle))
				var/mob/M = Obstacle
				if(M.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[M] absorbs [attacker]'s blast!"
					Obstacle:kiabc = power

					if((M.kiabc/2000) >= (M.powerlevel.max_value*5))
						M.powerlevel.value = 0
						M.Die(attacker)
						del(src)
					else
						M.powerlevel.value += round(power/2000)
						M.ki.value += round(power/2000)
						if(src.name == "Big Bang Attack")
							M.powerlevel.value = 0
							M.Die(attacker)
						del(src)
					for(var/obj/beamtrail/O in world)
						if(O!=src)
							if(O.owner==killedBy)
								del(O)
					for(var/obj/beamstart/F in world)
						if(F!=src)
							if(F.owner==killedBy)
								del(F)
					killedBy.attacking = 0
					killedBy.frozen = 0
					killedBy.blast = 0
					killedBy.move = 1
					killedBy.kame = 0
					killedBy.client.show_verb_panel = 1
					killedBy.hideipan = 0
					killedBy.client.eye = killedBy
					killedBy.client.perspective = MOB_PERSPECTIVE
				if(!M.absorb)
					call(/RoundExplosion/proc/NDBlast)(M.loc,1,2)
					M.powerlevel.value -= power
					if(M.mon )
						if(M.powerlevel.value <=0)
							if(M.expkn == null && M.expkk == null)
								M.expkn = "[attacker.name]"
								M.expkk = "[attacker.key]"
					M.Die(attacker)
					for(var/obj/beamtrail/O in world)
						if(O!=src)
							if(O.owner==killedBy)
								del(O)
					for(var/obj/beamstart/F in world)
						if(F!=src)
							if(F.owner==killedBy)
								del(F)
					killedBy.attacking = 0
					killedBy.frozen = 0
					killedBy.blast = 0
					killedBy.move = 1
					killedBy.kame = 0
					killedBy.client.show_verb_panel = 1
					killedBy.hideipan = 0
					killedBy.client.eye = killedBy
					killedBy.client.perspective = MOB_PERSPECTIVE
				del(src)
			else
				if(istype(Obstacle, /obj/beamblast))
					var/obj/beamblast/PS = Obstacle
					if(PS && PS.beam )
						if(!src.powerstruggle && !PS.powerstruggle)
							PS.killedBy << "<B><FONT COLOR = BLUE>Your beam has collided with [killedBy]'s Beam!"
							killedBy << "<B><FONT COLOR = BLUE>Your beam has collided with [PS.killedBy]'s Beam!"
							PS.icon_state = "ps"
							src.icon_state = "ps"
							call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
							call(/RoundExplosion/proc/NDBlast)(src.loc,1,3)
							PS.powerstruggle = 1
							src.powerstruggle = 1
							PS.killedBy.powerstruggle = 1
							src.killedBy.powerstruggle = 1
							src.killedBy.client.eye = src
							src.killedBy.client.perspective = EYE_PERSPECTIVE
							PS.killedBy.client.eye = PS
							PS.killedBy.client.perspective = EYE_PERSPECTIVE
							src.Powerstruggle(PS)
						else
							..()
					else
						for(var/obj/beamtrail/O in world)
							if(O!=src)
								if(O.owner==killedBy)
									del(O)
						for(var/obj/beamstart/F in world)
							if(F!=src)
								if(F.owner==killedBy)
									del(F)
						killedBy.attacking = 0
						killedBy.frozen = 0
						killedBy.blast = 0
						killedBy.move = 1
						killedBy.kame = 0
						killedBy.client.show_verb_panel = 1
						killedBy.hideipan = 0
						killedBy.client.eye = killedBy
						killedBy.client.perspective = MOB_PERSPECTIVE
						del(src)
				else
					for(var/obj/beamtrail/O in world)
						if(O!=src)
							if(O.owner==killedBy)
								del(O)
					for(var/obj/beamstart/F in world)
						if(F!=src)
							if(F.owner==killedBy)
								del(F)
					killedBy.attacking = 0
					killedBy.frozen = 0
					killedBy.blast = 0
					killedBy.move = 1
					killedBy.kame = 0
					killedBy.client.show_verb_panel = 1
					killedBy.hideipan = 0
					killedBy.client.eye = killedBy
					killedBy.client.perspective = MOB_PERSPECTIVE
					del(src)


	beamtrail
		name = "None"
		icon = 'icons/customattack.dmi'
		icon_state = "trail"
		density = 0
		layer = 9
		pixel_step_size = 12
		var
			owner

	beamstart
		name = "None"
		icon = 'icons/customattack.dmi'
		icon_state = "start"
		density = 0
		layer = 10
		var
			owner

client
	North()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	South()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	East()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	West()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	Northeast()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	Northwest()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	Southeast()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
	Southwest()
		if(mob.blast )
			if(mob.powerstruggle == 0)
				for(var/obj/beamblast/Z in world)
					if(Z.attacker==mob)
						del(Z)
				for(var/obj/beamtrail/O in world)
					if(O.owner==mob)
						del(O)
				for(var/obj/beamstart/F in world)
					if(F.owner==mob)
						del(F)
				//mob.blast = 0
				mob.move = 1
				mob.kame = 0
				mob.frozen = 0
				mob.attacking = 0
				mob.client.show_verb_panel = 1
				mob.hideipan = 0
			else
				mob << "<FONT COLOR = BLUE>You can't move while in a Powerstruggle!"
		..()
obj
	beamblast
		proc
			Powerstruggle(var/obj/beamblast/O)
				spawn(1)
					set background = 1
					while(src && O)
						if(src.power > O.power)
							var/odir = O.dir
							var/ndir = turn(odir,180)
							O.dir = ndir
							step(O, ndir)
							step(src, src.dir)
							if(!O) return
							O.dir = odir
						if(O.power > src.power)
							var/odir = src.dir
							var/ndir = turn(odir,180)
							src.dir = ndir
							step(src, ndir)
							step(O, O.dir)
							if(!O) return
							src.dir = odir
						src.killedBy.AddPowerBeam(src)
						O.killedBy.AddPowerBeam(O)
						sleep(24)

mob
	proc
		AddPowerBeam(var/obj/beamblast/O)
			spawn(1)
				set background = 1
				if(ki.value > 0)
					var/alert/a = new(24)
					switch(a.Alrt(src, "Do you want to add more power to your beam?","Beam's Current Power: [O.power]", "Yes", "No"))
						if("Yes")
							if(O)
								var/KI=(src.ki.value*0.125)
								O.power+=KI
								src.ki.value-=KI
								src.ki.value=round(src.ki.value)
								O.power=round(O.power)
								src << "<B><FONT COLOR = BLUE>You place more power into the beam!"

mob
	proc
		CustomBeam(var/Icon1,var/Icon2,var/Icon3,var/Name,var/Damage,var/mob/characters/Person)
			set background = 1
			var/obj/beamstart/start = new(Person.loc, Person.dir)
			var/obj/beamstart/starticon = new(null)
			starticon.icon = Icon1
			starticon.icon_state = start.icon_state
			start.icon = starticon.icon
			start.icon_state = start.icon_state
			start.owner = Person
			start.dir = Person.dir
			start.loc = Person.loc
			start.name = Name
			del(starticon)
			start.loc = get_step(Person, Person.dir)
			var/obj/beamblast/blast = new(start.loc, start.dir)
			var/obj/beamblast/blasticon = new(null)
			blasticon.icon = Icon2
			blasticon.icon_state = blast.icon_state
			blast.icon = blasticon.icon
			blast.icon_state = blasticon.icon_state
			blast.power = Damage
			blast.killedBy = Person
			blast.dir = Person.dir
			blast.attacker = Person
			blast.name = Name
			blast.trailed = 1
			blast.trailicon = Icon3
			walk(blast,Person.dir)
			Person.blast = 1
			del(blasticon)

mob
	proc
		Projectile(var/Icon,var/Name,var/Damage,var/mob/characters/Person)
			set background = 1
			var/obj/projblast/blast = new(Person.loc, Person.dir)
			var/obj/projblast/blasticon = new(null)
			blasticon.icon = Icon
			blasticon.icon_state = blast.icon_state
			blast.icon = blasticon.icon
			blast.killedBy = Person
			blast.power = Damage
			blast.name = Name
			blast.dir = Person.dir
			walk(blast,Person.dir)
			del(blasticon)


obj
	projblast
		name = "None"
		density = 1
		layer = 9
		var
			power
			mob
				killedBy
		Bump(mob/Obstacle)
			if(ismob(Obstacle))
				if(Obstacle.absorb)
					oview(src) << "<B><FONT COLOR = BLUE>[Obstacle] absorbs [killedBy]'s blast!"
					Obstacle.kiabc = power

					if((Obstacle.kiabc/2000) >= (Obstacle.powerlevel.max_value*5))
						Obstacle.powerlevel.value = 0
						Obstacle.Die(killedBy)
						del(src)
					else
						Obstacle.powerlevel.value += round(power/2000)
						Obstacle.ki.value += round(power/2000)
						del(src)
				if(!Obstacle.absorb)
					Obstacle.powerlevel.value -= power
					if(Obstacle.mon)
						if(Obstacle.powerlevel.value <=0)
							if(Obstacle.expkn == null && Obstacle.expkk == null)
								Obstacle.expkn = "[killedBy.name]"
								Obstacle.expkk = "[killedBy.key]"
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
					Obstacle.Die(killedBy)
				del(src)
			else
				if(isobj(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle.loc,1,3)
				else if(isturf(Obstacle))
					call(/RoundExplosion/proc/NDBlast)(Obstacle,1,3)
				del(src)
obj
	techs
		wff
			name = "Wolf Fang Fist"
			icon = 'icons/techhands.dmi'
			icon_state = "wff"
			Click()


				var/mob/M
				for(var/mob/O in get_step(usr,usr.dir))
					M = O
				if(M)
					if(usr.stamina.value >= 100)
						if(usr.zanzoken == 0)
							if(usr.move )
								if(M.client)
									if(usr.frozen == 0)
										var/neededki = usr.ki.max_value * 0.25
										if(usr.ki.value >= neededki)
											usr.move = 0
											usr.attacking = 1
											usr.frozen = 1
											usr.kame = 1
											usr.client.show_verb_panel = 0
											usr.hideipan = 1
											M.move = 0
											M.frozen = 1
											M.kame = 1
											M.attacking = 1
											if(M.client)
												M.client.show_verb_panel = 0
												M.hideipan = 1
											usr.stamina.value -= 100
											usr.ki.value -= neededki
											usr.icon_state = "sparstand"
											M << "<B>You feel immoblized!"
											view(6) << 'sounds/wff.wav'
											sleep(32)
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>WOLF.."
											sleep(12)
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>FANG.."
											sleep(18)
											view(6) << "<FONT COLOR = RED>[usr]: </FONT>FIST!!"
											sleep(6)
											flick("sparfury",usr)
											view(6) << 'sounds/meleefinish_wff.wav'
											M.meleehit()
											sleep(8)
											flick("sparkick",usr)
											view(6) << 'sounds/meleefinish_wff.wav'
											M.meleehit()
											sleep(8)
											view(6) << 'sounds/throw.wav'
											M.icon_state = "buku"
											M.loc=usr.loc
											M.thrown=1
											M.density = 0
											M.powerlevel.value -= (usr.powerlevel.value * 0.25)
											M.powerlevel.value = round(M.powerlevel.value)
											if(M.mon )
												if(M.powerlevel.value <=0)
													if(M.expkn == null && M.expkk == null)
														M.expkn = "[usr.name]"
														M.expkk = "[usr.key]"
											M.throwproc(usr)
											M.dir = usr.dir
											M.move = 1
											M.frozen = 0
											usr.move = 1
											usr.attacking = 0
											usr.frozen = 0
											usr.kame = 0
											usr.client.show_verb_panel = 1
											usr.hideipan = 0
											walk(M,M.dir)
										else
											usr << "<B>You do not have enough Ki to complete this technique."
									else
										usr << "<B>You are doing something at the moment."
								else
									alert("You can't attack that")
							else
								usr << "<B>You are doing something at the moment."
						else
							alert("You can't use 'Wolf Fang Fist' while using Zanzoken.")
					else
						usr << "<B>You are too tired!"
				else
					usr << "<B>There's nothing there!"
mob/liquify/verb/
	punchout()
		set name = "Punch the liquid out"
		set category = "Liquify"
		usr << "You punch yourself hoping that it will throw out the Buu liquid in your body!"
		usr.powerlevel.value /= 1.005
		usr.liquifyout = rand(1,7)