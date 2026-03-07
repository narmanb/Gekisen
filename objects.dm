obj
	Chr
		icon='turfs.dmi'
		icon_state="chr"
	is
		icon='turfs.dmi'
		icon_state="is"
obj
	var
		clothes
		worn=0
		clothesred
		clothesblue
		clothesgreen
mob
	AndroidTransform
		verb
			AndroidTransform()
				set category="Fighting"
				set name ="Super Android Transform"
				usr.drain=0
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Upgrade 1","Upgrade 2","Upgrade 3","Super Android","Revert","None"))
					if("Super Android")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 9000000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.overlays+='elec.dmi'
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * 5.2)
								var/gainedpowerlevel=usr.powerlevel
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(20)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Super Android"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
								var/masterpoints=usr.maxpowerlevel/9000000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=1
								usr.drain=drain
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 1")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 250000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * 2.2)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(3)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 1"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 2")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 900000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura

								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								var/topowerlevel = (usr.maxpowerlevel * 3.2)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 2"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel

							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 3")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 4500000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								usr.overlays+='elec.dmi'
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * (4.2))
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 3"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								var/masterpoints=usr.maxpowerlevel/4500000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=2
								usr.drain=drain
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."


					if("Revert")
						if(usr.state == "Normal")
							usr << "You are reverted already."
							usr.ssj=0
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							usr.overlays-='elec.dmi'
							usr.ssj=0
							usr.state = "Normal"
							usr.underlays=0
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel

mob
	transform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"

				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Form Four","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 300000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form2",usr)
								usr.icon = 'ChangeForm2.dmi'
								usr.powerlevel = usr.maxpowerlevel * 2
								usr.state = "Form Two"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")

							if(usr.maxpowerlevel >= 1000000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form3",usr)
								usr.icon = 'ChangeForm3.dmi'
								usr.powerlevel = usr.maxpowerlevel * 4
								usr.state = "Form Three"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."

					if("Form Four")
						if(usr.state == "Form Three")
							if(usr.maxpowerlevel >= 4000000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form4",usr)
								usr.icon = 'ChangeForm4.dmi'
								usr.powerlevel = usr.maxpowerlevel * 5
								usr.state = "Form Four"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form Three."
					if("Revert")
						usr.ssj=0
						if(usr.state == "Normal")
							usr << "You are reverted already."
						else
							usr.drain=-1
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'changling.dmi'
							usr.state = "Normal"
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel

mob
	celltransform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Ultra Perfect","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(usr.powerlevel >= 500000 && usr.maxpowerlevel >=400000)
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.underlays+='mysticaura.dmi'
								var/topowerlevel = (usr.maxpowerlevel * 2.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								usr.drain=0

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Form Two"
								flick("transform",usr)
								usr.icon = 'biocell2.dmi'
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")
							if(usr.powerlevel >= 1000000&&usr.maxpowerlevel >=800000)
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.underlays+='mysticaura.dmi'

								var/topowerlevel = (usr.maxpowerlevel * 3.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								usr.drain=0
								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop


								usr.state = "Form Three"
								flick("transform",usr)
								usr.icon = 'biocell3.dmi'
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."
					if("Ultra Perfect")
						if(usr.state == "Form Three")
							if(usr.powerlevel>usr.maxpowerlevel)
								usr.powerlevel=usr.maxpowerlevel
							if(usr.powerlevel >= 4000000 && usr.maxpowerlevel >=3500000)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.state="Transforming"
								flick("sbomb",usr)
								usr.underlays+='mysticaura.dmi'

								var/topowerlevel = (usr.maxpowerlevel * 4.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								var/masterpoints=usr.maxpowerlevel/3500000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=2
								usr.drain=drain
								usr.state = "Ultra Perfect"
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Three."

					if("Revert")
						if(usr.icon == "biobiobiocell3.dmi")
							usr << "You are reverted already."
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'biocell1.dmi'
							usr.state = "Normal"
							usr.drain=-1
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel


/*mob
	enrage
		verb
			Enrage()
				set category = "Fighting"
				if(usr.entime == 1)
					usr << "You are still too angry..."
					sleep(1200)
					if(usr.entime==1)
						usr.entime = 0
						usr << "You begin to calm..."
				else
					if(usr.ssj == null||usr.ssj == 0 && usr.kaioken == 0||usr.kaioken == null)
						usr << "<font face = Arial><font size = 2><font color = silver>You begin to get enraged....remembering all the hateful things in your past......"
						spawn()usr.Getpissed()
						if(usr.sounds==1)
							spawn()usr<<'sounds/powerup.wav'
						for(var/mob/characters/L in oview(4))
							if(L.client)
								if(L.sounds==1)
									spawn()L<<'sounds/powerup.wav'
						usr.entime = 1
						usr.icon_state = "ssj"
						sleep(40)
						usr.icon_state = ""
						sleep(rand(1,1200))
						usr.entime = 0
						usr << "You begin to calm..."
					else
						usr << "You are strained (using Super Saiyan or Kaioken?)."
*/
obj
	SayajinTail
		icon='tail.dmi'
		verb
			Wrap()
				set category="Communication"
				usr <<"You wrap your tail"
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
			Unwrap()
				set category="Communication"
				usr <<"You unwrap your tail"
				usr.overlays+='tail.dmi'
mob
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
						if(M.key!=usr.key)
							M << "<font color = green>You are blinded by [usr]'s Tayioken!"
							M.Blinded()

					sleep(rand(1,100))
					for(var/mob/M in world)
						M:sight = 0
					sleep(100)
					usr.tayio = 0
mob/proc/Blinded()
	src.sight = 1
	sleep(rand(1,40))
	src.sight=0
mob
	Samurai
		icon='samuraobj.dmi'
		icon_state="it"
		density=1

mob
	Absorb
		verb
			Absorb(mob/characters/M in oview(2))
				set category = "Fighting"
				if(usr.absorb == 1)
					usr << "You need to wait..."
				if(usr.absorb == null||usr.absorb == 0 && M.race!="" && M.race!=null&&M.powerlevel>1)
					if(usr.state == "Form Three")
						usr <<"You cant absorb in that stage"
					else
						view(6) << "<font color = green>[usr.name] is stealing energy"
						usr.absorb = 1
						if(usr.sounds==1)
							spawn()usr<<'sounds/regen.wav'
						for(var/mob/characters/L in oview(4))
							if(L.client)
								if(L.sounds==1)
									spawn()L<<'sounds/regen.wav'

						flick("absorb",usr)
						M << "<font color = green>[usr.name] is stealing your powerlevel!!!"
						usr<<"You absorb some of [M]'s powerlevel"
						absorba=usr.maxpowerlevel/rand(10,50)
						if(absorba>M.powerlevel)
							absorba=M.powerlevel
						M.powerlevel-=absorba
						usr.powerlevel+=absorba
						if(M.powerlevel<1)
							M.powerlevel=1
						M.KO()
						sleep(rand(50,200))
						usr.absorb = 0
mob
	BebiInfest
		verb
			Infest(mob/characters/M in oview(2))
				set category = "Fighting"
				if(M.client||!M.client)
					if(usr.infested==0)
						if(M.hp>=800 || M.ko==1)
							view(6) << "<font color = green>[usr.name] Infests [M]!!"
							M << "<font color = green>[usr.name] has Infested you!!!"
							usr<<"You infest [M]"
							if(M.race=="Saiya-jin"||M.race=="Halfbreed")
								usr.evolution=3
								usr.infested=1
								usr.verbs += /mob/Bebi/verb/BebiTransform
								usr.verbs += /mob/Bebi/verb/Revert
								usr.powerlevel= usr.maxpowerlevel
								usr.ssj=0
							else
								usr.infested=1

							usr.icon=M.icon
							usr.skincolor=M.skincolor
							usr.hairicon=M.hairicon
							usr.hair=M.hair
							usr.overlays+=usr.hairicon
							M.hp=1100
							M.Die()
			UnInfest()
				set category = "Fighting"
				if(usr.infested==1)
					usr.evolution=2
					usr.infested=0
					usr.verbs -= /mob/Bebi/verb/BebiTransform
					usr.verbs -= /mob/Bebi/verb/Revert
					usr.icon='bebi2.dmi'
					usr.skincolor=0
					usr.overlays=0
					usr<<"You destroy your host"
	Assimilate
		verb
			Assimilate(mob/characters/M in oview(2))
				set category = "Fighting"
				if(usr.absorb == 1)
					usr << "You need to wait..."
				if(usr.absorb == null||usr.absorb == 0 && M.race!="" && M.race!=null)
					if(usr.state == "Form Three")
						usr <<"You cant assimilate in that stage"
					else
						if(M.hp>=800|| M.ko==1)
							view(6) << "<font color = green>[usr.name] assimilated [M]!!"
							usr.absorb = 1
							flick("assimilate",usr)
							M << "<font color = green>[usr.name] has assimilated you!!!"
							usr<<"You assimilate [M]"
							absorba=usr.maxpowerlevel/rand(3,8)
							M.powerlevel-=absorba
							M.Die()
							usr.powerlevel+=absorba
							usr.verbs += /mob/celltransform/verb/Transform
							sleep(rand(50,200))
							usr.absorb = 0


obj/Tran
	var
		thairicon
		ticon
		toverlay
		taddoverlay
		tunderlay
		prereq=0
		stagereq=""
		boost=1
		ts=0
		tdrain=0
		bebiicon=0
		instant=0
		tname=""
		tmajin=0
		taddelec
	Nevermind
		tname= "Nevermind"
	Mystic
		prereq=0
		instant=1
		boost=5.9
		tunderlay='mysticaura.dmi'
		taddoverlay='elec.dmi'
		tname = "Mystic"
	Majin
		prereq=0
		instant=1
		boost=5.8
		tunderlay='mysticaura.dmi'
		taddoverlay='redelec.dmi'
		tmajin=1
		tname = "Majin"
	Demon1
		prereq=300000
		boost=2.8
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname = "Unlock Inner Evil"

	Demon2
		prereq=1000000
		boost=3.9
		ticon='FATJanemba.dmi'
		tdrain=2
		tname="Fat Janemba"

	Demon3
		prereq=5000000
		boost=4.8
		ticon='Janemba.dmi'
		tdrain=2
		tname="Janemba"

	Demon4
		prereq=10000000
		boost=6.8
		ticon='Janemba.dmi'
		taddoverlay='redelec.dmi'
		tdrain=3
		tname="Super Demon Janemba"

	Cell1
		prereq=300000
		tdrain=0
		boost=2.6
		tname="Genetic Reconstruction"

	Cell2
		prereq=1000000
		tdrain=0
		boost=3.5
		ticon='biocell2.dmi'
		tname="Form 2"


	Cell3
		prereq=5000000
		tdrain=0
		boost=4.5
		ticon='biocell3.dmi'
		tname="Perfect"

	Cell4
		prereq=10000000
		tdrain=4
		boost=6.3
		taddoverlay='redelec.dmi'
		ticon='biocell3.dmi'
		tname="Ultra Perfect"

	Icer1
		prereq=300000
		tdrain=0
		boost=2.8
		ticon='ChangeForm2.dmi'
		tname="Form 2"

	Icer2
		prereq=1000000
		tdrain=0
		boost=3.9
		ticon='ChangeForm3.dmi'
		tname="Form 3"

	Icer3
		prereq=5000000
		tdrain=0
		boost=4.8
		ticon='ChangeForm4.dmi'
		tname="Form 4"

	Icer4
		prereq=10000000
		tdrain=0
		boost=5.9
		taddoverlay='elec.dmi'
		ticon='ChangeForm4.dmi'
		tname="Full Form 4"

	SNJ
		prereq= 300000
		boost=2.7
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek"
	SNJ2
		prereq= 1000000
		boost=3.9
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek 2"
	SNJ3
		prereq= 5000000
		boost=4.8
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek 3"
	SNJ4
		prereq= 10000000
		boost=6.2
		tunderlay='mysticaura.dmi'
		taddelec='elec.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Legendary Super Namek"
	Android1
		prereq= 300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock System Resources 1"
	Android2
		prereq= 1000000
		boost=3.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock System Resources 2"
	Android3
		prereq= 5000000
		boost=4.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="100% Power Unlock"
	SuperAndroid
		prereq= 10000000
		boost=6.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Super Android"
	Human1
		prereq= 300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock Restraints"
	Rage_Human2
		prereq= 1000000
		boost=3.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Rage"
	Spirit_Human2
		prereq= 1000000
		boost=3.5
		tdrain=0
		tname="Minds Eye"
	Human3
		prereq= 5000000
		boost=4.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname = "Focus Power"
	Rage_Human4
		prereq= 10000000
		boost=5.5
		taddelec='redelec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=8
		tname = "Adrenaline Explosion"
	Spirit_Human4
		prereq= 10000000
		boost=5.5
		tdrain=0
		tname = "Mind Discipline Potential Awaken"
	SSJ1
		prereq=300000
		boost=3.1
		tunderlay='ssjaura.dmi'
		ts=1
		tdrain=2
		tname= "Super Saiyajin 1"
	USSJ
		prereq=600000
		boost=3.8
		tunderlay='ssjaura.dmi'
		ts=3
		bebiicon=2
		tdrain=4
		tname= "Ultra Super Saiyajin"
	SSJ2
		prereq=1000000
		boost=4.5
		tunderlay='ssjaura.dmi'
		taddelec='elec.dmi'
		ts=1
		tdrain=3
		tname= "Super Saiyajin 2"
	SSJ3
		prereq=5000000
		boost=5.8
		tunderlay='ssjaura.dmi'
		taddelec='Ssj3 electricity.dmi'
		tdrain=3
		tname= "Super Saiyajin 3"
	SSJ4
		toverlay='ssj4.dmi'
		taddelec='redelec.dmi'
		tunderlay='kaioaura.dmi'
		boost= 6.3
		tdrain=4
		tname= "Super Saiyajin 4"
	/*
	SSJGOD


	*/
	LSSJ
		tdrain=1
		tname="Legendary Super Saiyajin"
		bebiicon=2
		ts=3
		tunderlay='ssjaura.dmi'
		boost=8.0
		instant=1
		prereq=3000000
	Bebi1
		prereq=300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		ts=2
		tdrain=2
		tname="Bebi Assimilation 10%"
	Bebi2
		prereq=1000000
		boost=3.8
		tunderlay='mysticaura.dmi'
		ts=2
		bebiicon=1
		tdrain=3
		tname="Bebi Assimilation 30%"
	Bebi3
		prereq=5000000
		boost=4.9
		tunderlay='mysticaura.dmi'
		toverlay='bebivest.dmi'
		ts=2
		bebiicon=1
		tdrain=4
		tname="Bebi Assimilation 60%"
	Bebi4
		thairicon='Bebi_hair.dmi'
		toverlay='bebigi.dmi'
		prereq=10000000
		boost=5.9
		tunderlay='mysticaura.dmi'
		bebiicon=1
		tdrain=5
		tname="Bebi Assimilation 100%"


	verb
		Revert()
			set category = "Fighting"
			if(usr.ssj==1)
				if(usr.ooverlays)
					usr.overlays=0
					usr.overlays=usr.ooverlays.Copy(1,0)
					usr.ooverlays=0
				if(usr.backupicon)
					usr.icon=usr.backupicon
					usr.backupicon=0
				if(usr.ussjicon==1)
					var/newicon
					if(usr.skincolor=="black")
						newicon='male-black.dmi'
					if(usr.skincolor=="darkbrown")
						newicon='male-brown.dmi'
					if(usr.skincolor=="lightbrown")
						newicon='male-lightbrown.dmi'
					if(usr.skincolor=="white")
						newicon='male-white.dmi'
					if(usr.skincolor=="tan")
						newicon='male.dmi'
					usr.icon=newicon
					usr.ussjicon=0
				usr.overlays-=usr.hairicon2
				usr.overlays-=usr.tranover
				usr.drain=-1
				usr.hairicon2 = 0
				usr.state = "Normal"
				usr.overlays-='majin.dmi'
				usr.revertssj()
				if(usr.powerlevel <= usr.maxpowerlevel)
					usr.powerlevel += 0
				if(usr.powerlevel > usr.maxpowerlevel)
					usr.powerlevel = usr.maxpowerlevel
				usr.ssj= 2
				usr.basepowerlevel=usr.powerlevel
				sleep(100)
				usr.ssj = 0

		Transform()
			set category = "Fighting"
			if(usr.stamina <= 5)
				usr << "You feel too weak to."
			if(usr.stamina >= 6)
				if(usr.ssj==1&&usr.ozz==0)
					if(usr.ooverlays)
						usr.overlays=0
						usr.overlays=usr.ooverlays.Copy(1,0)
						usr.ooverlays=0
					if(usr.backupicon)
						usr.icon=usr.backupicon
						usr.backupicon=0
					usr.overlays-=usr.hairicon2
					usr.overlays-=usr.tranover
					usr.drain=-1
					usr.hairicon2 = 0
					usr.state = "Normal"
					usr.revertssj()
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.ssj = 0
					usr.basepowerlevel=usr.powerlevel
				if(usr.ssj == 0 && usr.kaioken == 0 && usr.transformations && usr.ozz==0)
					usr.ssj=2
					usr.underlays=0
					var/obj/Tran/ctran = input(usr,"Choose a Transformation","Transform")as obj in usr.transformations
					if(ctran)
						if(ctran.tname=="Nevermind")
							usr.ssj=0
							return
						if(!(ctran.stagereq!="" && usr.state!=ctran.stagereq))
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'sounds/powerup.wav'
							usr.underlays+=ctran.tunderlay
							var/topowerlevel = (usr.powerlevel * ctran.boost)
							var/gainedpowerlevel=(usr.powerlevel)
							loop
							usr.powerlevel+=topowerlevel/50
							gainedpowerlevel+=topowerlevel/50
							if((usr.maxpowerlevel/(ctran.prereq+1))<1.5)
								sleep(8)
							else if(ctran.instant==0)
								sleep(4)
							if(gainedpowerlevel<topowerlevel)
								goto loop
							usr.state=ctran.tname
							view(6)<<"[usr] Transformed to [ctran.tname]!!"

							if(ctran.tname== "Super Saiyajin 3")
								usr.loosehair()
								usr.hairicon2=ctran.GetSSJ3hair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.toverlay)
								var/list/temp[]=usr.overlays
								usr.ooverlays=temp.Copy(1,0)
								usr.overlays=0
								usr.overlays+=ctran.toverlay
							if(ctran.thairicon)
								usr.loosehair()
								usr.hairicon2=ctran.thairicon
								usr.overlays+=usr.hairicon2
							if(ctran.ticon)
								usr.backupicon=usr.icon
								usr.icon=ctran.ticon
							if(ctran.ts==1)
								usr.loosehair()
								usr.hairicon2=ctran.GetSSJhair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.ts==3)
								usr.loosehair()
								usr.hairicon2=ctran.GetUSSJhair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.ts==2)
								usr.loosehair()
								usr.hairicon2=ctran.GetBebihair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.bebiicon==1)
								usr.backupicon=usr.icon
								usr.icon= ctran.GetBebiIcon(usr)
							if(ctran.bebiicon==2)
								usr.backupicon=usr.icon
								usr.icon= ctran.GetUSSJIcon(usr)
							if(ctran.tname== "Super Saiyajin 4")
								usr.loosehair()
							if(ctran.taddoverlay)
								usr.tranover=ctran.taddoverlay
								usr.overlays+=usr.tranover
							if(ctran.tname== "Super Saiyajin 4")

								usr.hairicon2=ctran.GetSSJ4hair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.taddelec)
								usr.overlays+=ctran.taddelec
								usr.removeonlogin=ctran.taddelec
								spawn(300)
									usr.overlays-=ctran.taddelec
							var/masterpoints=usr.maxpowerlevel/(ctran.prereq+1)
							var/drain=0
							drain=ctran.tdrain
							if(masterpoints>1.2)
								drain-=1
							if(masterpoints>1.5)
								drain-=1
							if(masterpoints>1.8)
								drain-=1
							if(masterpoints>2)
								drain-=1
							if(masterpoints>2.3)
								drain-=1
							if(masterpoints>2.5)
								drain-=1
							if(masterpoints>2.8)
								drain-=1
							if(masterpoints>3)
								drain-=1
							if(drain<0)
								drain=0
							usr.drain=drain
							usr.ssj=1
							if(ctran.tmajin==1)
								MakeMajin(usr)
							usr.basepowerlevel=usr.powerlevel

						else
							usr<<"To use this Transformation you must first transform to [ctran.stagereq]"

obj/Tran
	proc
		MakeMajin(mob/us)
			var/hairiconx
			if(us.race=="Saiya-jin"||us.race=="Halfbreed")
				us.loosehair()
				us << "<b>You explode in rage as you go Super Saiya-jin 2."
				oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
				if (us.hair=="Spikey Long")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Spikey")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Gohan")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Trunks")
					hairiconx= 'ssj_trunks_hair.dmi'
				if (us.hair=="punk")
					hairiconx= 'hair_punk_ssj.dmi'
				if (us.hair=="kros_long")
					hairiconx= 'hair_kros_long_ssj.dmi'
				if (us.hair=="yajirobe")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="goten")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="radditz")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Future Trunks")
					hairiconx= 'ssj_futuretrunks_hair.dmi'
				if (us.hair=="Long")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Female")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Short")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Vegeta")
					hairiconx = 'hair_dan_vegeta.dmi'
					hairiconx += rgb(180,180,80)
				if (us.hair=="VegetaGT")
					hairiconx = 'hair_dan_vegetagt.dmi'
					hairiconx += rgb(150,150,40)
				if (us.hair=="Goku")
					hairiconx= 'hair_ssj_goku.dmi'
				us.overlays-=us.hairicon
			var/majin='majin.dmi'
			us.tranover=hairiconx
			us.overlays+=majin
			us.overlays+=hairiconx
		GetUSSJIcon(mob/us)
			var/newicon=us.icon
			if(us.skincolor=="black")
				newicon='USupersayajin-black.dmi'
			if(us.skincolor=="darkbrown")
				newicon='USupersayajin-darkbrown.dmi'
			if(us.skincolor=="lightbrown")
				newicon='USupersayajin-lightbrown.dmi'
			if(us.skincolor=="white")
				newicon='USupersayajin-pale.dmi'
			if(us.skincolor=="tan")
				newicon='USupersayajin.dmi'
			us.ussjicon=1
			return newicon
		GetBebiIcon(mob/us)
			var/newicon=us.icon
			if(us.skincolor=="black")
				newicon='bebi-black.dmi'
			if(us.skincolor=="darkbrown")
				newicon='bebi-darkbrown.dmi'
			if(us.skincolor=="lightbrown")
				newicon='bebi-lightbrown.dmi'
			if(us.skincolor=="white")
				newicon='bebi-pale.dmi'
			if(us.skincolor=="tan")
				newicon='bebi.dmi'
			return newicon
		GetSSJ4hair(mob/us)
			var/hairovern
			if (us.hair=="Spikey")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="punk")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="kros_long")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="yajirobe")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="goten")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="radditz")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="Gohan")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Future Trunks")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Trunks")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Female")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Long")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Short")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Vegeta")
				hairovern='ssj4 vegeta.dmi'
			if (us.hair=="VegetaGT")
				hairovern='ssj4 vegeta.dmi'
			if (us.hair=="Goku")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="Spikey Long")
				hairovern='ssj4 hair.dmi'

			return hairovern
		GetSSJ3hair(mob/us)
			var/hairovern
			if (us.hair=="Spikey")
				hairovern='Ssj3 1.dmi'
			if (us.hair=="punk")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="kros_long")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="yajirobe")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="goten")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="radditz")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="Gohan")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Future Trunks")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Trunks")
				hairovern='Ssj3 1.dmi'
			if (us.hair=="Female")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Long")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Short")
				hairovern='ssj3.dmi'
			if (us.hair=="Vegeta")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="VegetaGT")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="Goku")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Spikey Long")
				hairovern='Ssj3 3.dmi'

			return hairovern
		GetSSJhair(mob/us)
			var/hairoverx
			if (us.hair=="Spikey Long")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Spikey")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Long")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Short")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Gohan")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Trunks")
				hairoverx= 'ssj_trunks_hair.dmi'
			if (us.hair=="punk")
				hairoverx= 'hair_punk_ssj.dmi'
			if (us.hair=="kros_long")
				hairoverx= 'hair_kros_long_ssj.dmi'
			if (us.hair=="yajirobe")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="goten")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Future Trunks")
				hairoverx= 'ssj_futuretrunks_hair.dmi'
			if (us.hair=="Female")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Vegeta")
				var/hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(180,180,80)
				hairoverx= hairover
			if (us.hair=="VegetaGT")
				var/hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(150,150,40)
				hairoverx= hairover
			if (us.hair=="Goku")
				hairoverx= 'hair_ssj_goku.dmi'
			if (us.hair=="Bald")
				hairoverx='Hair_Bald_Supersayajin.dmi'
			return hairoverx
		GetUSSJhair(mob/us)
			var/hairoverx
			if (us.hair=="Spikey Long")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Spikey")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Long")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Short")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Gohan")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Trunks")
				hairoverx= 'ssj_trunks_hair.dmi'
			if (us.hair=="punk")
				hairoverx= 'hair_punk_ssj.dmi'
			if (us.hair=="kros_long")
				hairoverx= 'hair_kros_long_ssj.dmi'
			if (us.hair=="yajirobe")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="goten")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Future Trunks")
				hairoverx= 'ssj_futuretrunks_hair.dmi'
			if (us.hair=="Female")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Vegeta")
				var/hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(180,180,80)
				hairoverx= hairover
			if (us.hair=="VegetaGT")
				var/hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(150,150,40)
				hairoverx= hairover
			if (us.hair=="Goku")
				hairoverx= 'hair_ssj_goku.dmi'
			if (us.hair=="Bald")
				hairoverx='Hair_Bald_Supersayajin.dmi'
			return hairoverx
		GetBebihair(mob/us)
			var/hairover
			if (us.hair=="Spikey")
				hairover = 'hair_dan_spikeyshort.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Spikey Long")
				hairover = 'hair_dan_spikey.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Female")
				hairover = 'fem-hair-long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="punk")
				hairover = 'hair_punk.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="kros_long")
				hairover = 'hair_kros_long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="yajirobe")
				hairover = 'hair_yajirobe.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="goten")
				hairover = 'hair_goten.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="radditz")
				hairover = 'hair_radditz.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Long")
				hairover = 'hair_dan_long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Short")
				hairover = 'hair_dan_short.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Gohan")
				hairover = 'hair_Gohan.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Trunks")
				hairover = 'hair_trunks.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Future Trunks")
				hairover = 'Futuretrunkshair.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Vegeta")
				hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="VegetaGT")
				hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Goku")
				hairover = 'hair_dan_goku.dmi'
				hairover += rgb(200,200,200)
			return hairover
obj
	user
		icon = 'male.dmi'

obj
	porattaearings
		name = "Poratta Earrings"
		icon = 'poratta.dmi'
		verb
			Wear()
				set category = "Communication"
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
				set category = "Communication"
				sleep(1)
				if(src.worn == 1||usr.hasfused==1)
					usr << "Not while its being worn."
				if(src.worn == 0&&usr.hasfused==0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication"
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Fuse(mob/characters/M in oview(1))
				set category = "Fighting"
				if(usr.fused==0 && M.fused==0 && usr.ozz==0 && M.ozz==0)
					if(usr.hasfused==1||M.hasfused==1)
						usr<<"Cant fuse while in a fusion"
					else
						if(M.ozz==0)
							if(usr.ozz==1)
								usr<<"Cant fuse yet.."
							else
								var/inrange=0
								switch(input(M,"Would you like to fuse with [usr]?","Poratta Earings") in list("Yes","No"))
									if("Yes")
										for(var/mob/characters/X in oview(1))
											if(X==M)
												inrange=1
										if(inrange==1)
											if(usr.hasfused==0&&M.hasfused==0)
												if(usr.fused==0 && M.==0)
													usr.save()
													M.save()
													M.oldguild=M.guild
													usr.oldguild=usr.guild
													var/list/temp1[] = usr.overlays
													usr.ooverlays=temp1.Copy(1,0)
													usr.overlays=0
													var/list/temp2[] = M.overlays
													M.ooverlays=temp2.Copy(1,0)
													M.overlays=0
													if(usr.dead==1)
														usr.overlays+='halo.dmi'
													var/lead = copytext(usr.name,1,5)
													var/load = copytext(M.name,6)
													usr.overlays+=usr.hairicon
													var/hairoverone = 'hairstrip.dmi'
													hairoverone += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverone
													var/hairoverthree = 'hairstrip2.dmi'
													hairoverthree += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverthree
													view(6) << "<font face = arial><tt>[M] and [usr] are thrown together to make [lead][load]!!!"
													if(usr.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(M.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													usr.oname=usr.name
													M.oname=M.name
													usr.overlays+='elec.dmi'
													usr.name = "<b>[lead][load]</b>"
													M.name = "<b>[lead][load]</b>"
													var/cap
													if(usr.maxpowerlevel>M.maxpowerlevel)
														cap=M.maxpowerlevel * 2
													else
														cap=usr.maxpowerlevel * 2
													usr.omaxpowerlevel=usr.maxpowerlevel
													M.omaxpowerlevel=M.maxpowerlevel
													usr.maxpowerlevel=cap
													M.maxpowerlevel=0
													M.powerlevel=0
													usr.powerlevel=usr.maxpowerlevel
													M.hasfused=1
													usr.hasfused=1
													usr.fused=1
													usr.porattafuse=1
													M.porattafuse=1
													M.fused=1
													M.invisibility=1
													M.follow=usr.name
													M.fusebitch=1
													usr.basepowerlevel=usr.powerlevel
													M.fusionfollow(usr)
										else
											usr<<"You need to be right next to [M]"




obj
	proc
		objfollow(mob/characters/M)
			src.loc = locate(M.x,M.y,M.z)
			sleep(2)
			spawn()src.objfollow(M)
mob
	proc
		fusionfollow(mob/characters/M)
			if(src.hasfused==1)
				src.loc = locate(M.x,M.y,M.z)
				src.ki=0
				src.stamina=0
				src.invisibility=1
				sleep(10)
				spawn()src.fusionfollow(M)
mob
	proc
		fusionfollow2()
			for(var/mob/characters/M in world)
				if(src.follow == M.name)
					src.loc = locate(M.x,M.y,M.z)
					src.ki=0
					src.stamina=0
					src.invisibility=1
					sleep(5)
					spawn()src.fusionfollow2()
				else
					..()



mob
	flerp
		name = "Freaky"
		maxpowerlevel = 75000
		npc=1
		icon = 'mobs.dmi'
		icon_state = "vegetto"



mob
	Mystic
		verb
			MysticTransform()
				set category = "Fighting"
				set name = "Mystic Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are transformed already."
					if(usr.ssj == 0 && usr.kaioken == 0 &&usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
						sleep(15)
						if(usr.ssj==0)
							if(usr.powerlevel < 2500000 && usr.ssj==0)
								usr << "<b>You seem too weak to."
								usr.ssj=0
							if(usr.powerlevel >= 2500000 && usr.ssj==0)
								usr.drain=0
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.ssj = 1
								usr << "<b>Your Aura Grows wildly."
								oview(6) << "<b>**<font color = white>[usr]'s inner potential starts to be unlocked.<font color = white>**"
								usr.underlays += 'mysticaura.dmi'
								usr.state = "Mystic"
								var/multiplier= 1
								if(usr.maxpowerlevel>30000000&&usr.conc>750)
									multiplier= 10.5
								else
									if(usr.maxpowerlevel>4500000&&usr.conc>500)
										multiplier= 8.5
									else
										if(usr.maxpowerlevel>1500000&&usr.conc>250)
											multiplier= 7.5
										else
											if(usr.maxpowerlevel>450000)
												multiplier= 2.5
											if(usr.maxpowerlevel>750000)
												multiplier= 3
											if(usr.maxpowerlevel>1500000)
												multiplier= 3.5
											if(usr.maxpowerlevel>7500000)
												multiplier= 4.5
											if(usr.maxpowerlevel>1500000)
												multiplier= 5.5
								var/topowerlevel = (usr.powerlevel * multiplier)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								sleep(4)
								if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
									goto loop
								usr.basepowerlevel=usr.powerlevel

		verb
			MysticRevert()
				set category = "Fighting"
				set name = "Mystic Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent Mystic."
				if(usr.ssj == 1 && usr.ozz==0)
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'mysticaura.dmi'
					usr.underlays -= 'mysticaura.dmi'
					usr.underlays -= 'mysticaura.dmi'
					usr.overlays-='elec.dmi'
					usr.state = "Normal"
				//	usr.overlays-='hair_dan_spikeyshort.dmi'
				//	usr.overlays+=usr.hairicon
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
				//	usr.overlays-= usr.hairicon2
					usr.ssj=2
					sleep(50)
					usr.ssj = 0
					usr.basepowerlevel=usr.powerlevel
mob
	Majin
		verb
			MajinTransform()
				set category = "Fighting"
				set name = "Majin Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6 && usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
					if(usr.ssj == 1)
						usr << "You are transformed already."
					if(usr.ssj == 0 && usr.kaioken == 0)

						sleep(15)
						if(usr.ssj==0)

							if(usr.powerlevel < 2500000 && usr.ssj==0)
								usr << "<b>You seem too weak to."
								usr.ssj=0
							if(usr.powerlevel >= 2500000 && usr.ssj==0)
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.ssj = 1
								usr.drain=0
								usr << "<b>You feel yourself fall into the darkness.."
								oview(6) << "<b>**<font color = white>[usr]'s hair begins to stand on end and sparks surround him.<font color = white>**"
								usr.underlays += 'mysticaura.dmi'
								usr.overlays+='redelec.dmi'
								usr.state = "Majin"
								var/topowerlevel = (usr.powerlevel+usr.strength * 4)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								sleep(4)
								if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
									goto loop
								if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
									usr.loosehair()
									usr << "<b>You explode in rage as you go Super Saiya-jin 2."
									oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
									if (usr.hair=="Spikey Long")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Spikey")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Gohan")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Trunks")
										usr.overlays += 'ssj_trunks_hair.dmi'
									if (usr.hair=="punk")
										usr.overlays += 'hair_punk_ssj.dmi'
									if (usr.hair=="kros_long")
										usr.overlays += 'hair_kros_long_ssj.dmi'
									if (usr.hair=="yajirobe")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="goten")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="radditz")
										var/hairover = 'hair_radditz.dmi'
										hairover += rgb(160,160,20)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="Future Trunks")
										usr.overlays += 'ssj_futuretrunks_hair.dmi'
									if (usr.hair=="Long")
										var/hairover = 'hair_dan_long.dmi'
										hairover += rgb(160,160,50)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Female")
										var/hairover = 'hair_dan_long.dmi'
										hairover += rgb(160,160,50)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Short")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Vegeta")
										var/hairover = 'hair_dan_vegeta.dmi'
										hairover += rgb(180,180,80)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="VegetaGT")
										var/hairover = 'hair_dan_vegetagt.dmi'
										hairover += rgb(150,150,40)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="Goku")
										usr.overlays += 'hair_ssj_goku.dmi'
									usr.overlays-=usr.hairicon
								usr.overlays+='majin.dmi'
								usr.basepowerlevel=usr.powerlevel

		verb
			MajinRevert()
				set category = "Fighting"
				set name = "Majin Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent Majin."
				if(usr.ssj == 1 && usr.ozz==0)
					usr << "<b>You begin to calm down...."
					usr.underlays =0
					usr.overlays-='redelec.dmi'
					usr.overlays-='majin.dmi'
					usr.state = "Normal"
					usr.overlays+=usr.hairicon
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.overlays-= usr.hairicon2
					usr.ssj=2
					if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
						usr.overlays -= 'ssj4 hair.dmi'
						usr.overlays -= 'elec.dmi'
						usr.overlays-='ssj4.dmi'
						usr.overlays -= 'hair_dan_ssjspikey.dmi'
						usr.overlays -= 'ssj3.dmi'
						usr.overlays -= 'hair_dan_spikeyshort.dmi'
						usr.overlays -= 'hair_dan_long.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_dan_spikey.dmi'
						usr.overlays-= 'hair_dan_ssjspikey.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays -= 'hair_dan_short.dmi'
						usr.overlays -= 'hair_dan_vegeta.dmi'
						usr.overlays-='hair_Gohan.dmi'
						usr.overlays-='hair_trunks.dmi'
						usr.overlays-='ssj_futuretrunks_hair.dmi'
						usr.overlays-='ussj_futuretrunks_hair.dmi'
						usr.overlays -='hair_dan_goku.dmi'
						usr.overlays -= 'hair_ssj_goku.dmi'
						usr.overlays -= 'hair_ssj3_goku.dmi'
						usr.overlays -= 'hair_ssj4_goku.dmi'
						usr.overlays -='Hair_Bald_Supersayajin.dmi'
						usr.overlays -='ssj_trunks_hair.dmi'
						usr.overlays-= 'Red Elec.dmi'
						usr.overlays -= 'Vssj4.dmi'
						usr.overlays -= '2ssj4.dmi'
						usr.overlays-= usr.hairicon2
					usr.overlays+=usr.hairicon
					usr.basepowerlevel=usr.powerlevel
					sleep(50)
					usr.ssj = 0


/*mob
	ssj
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent in SSJ."
				if(usr.ssj == 1&& usr.ozz==0)
					usr.drain=-1
					if(usr.state=="Ultra Super Saiya-jin")
						if(src.skincolor=="black")
							src.icon='male-black.dmi'
						if(src.skincolor=="darkbrown")
							src.icon='male-brown.dmi'
						if(src.skincolor=="lightbrown")
							src.icon='male-lightbrown.dmi'
						if(src.skincolor=="white")
							src.icon='male-white.dmi'
						if(src.skincolor=="tan")
							usr.icon='male.dmi'
						if(src.skincolor=="fwhite")
							src.icon = 'female-pale.dmi'
						if(src.skincolor=="ftan")
							src.icon = 'female.dmi'
						if(src.skincolor=="flightbrown")
							src.icon = 'female-lightbrown.dmi'
						if(src.skincolor=="fdarkbrown")
							src.icon = 'female-darkbrown.dmi'
						if(src.skincolor=="fblack")
							src.icon = 'female-black.dmi'
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays=0
					usr.overlays -= 'ssj4 hair.dmi'
					usr.overlays -= 'elec.dmi'
					usr.overlays-='ssj4.dmi'
					usr.overlays -= 'hair_dan_ssjspikey.dmi'
					usr.overlays -= 'ssj3.dmi'
					usr.overlays -= 'hair_dan_spikeyshort.dmi'
					usr.overlays -= 'hair_dan_long.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-='Ssj3 electricity.dmi'
					usr.overlays-='redelec.dmi'
					usr.overlays-='elec.dmi'
					usr.overlays-='Ssj3 1.dmi'
					usr.overlays-='Ssj3 2.dmi'
					usr.overlays-='Ssj3 3.dmi'
					usr.overlays-='Ssj3 4.dmi'
					usr.overlays-='ssj3.dmi'
					usr.overlays-= 'ssj4 hair.dmi'
					usr.overlays-= '2ssj4.dmi'
					usr.overlays-= 'ssj4 vegeta.dmi'
					usr.overlays-= 'hair_ssj4_goku.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_dan_spikey.dmi'
					usr.overlays-= 'hair_dan_ssjspikey.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays -= 'hair_dan_short.dmi'
					usr.overlays -= 'hair_dan_vegeta.dmi'
					usr.overlays-='hair_Gohan.dmi'
					usr.overlays-='hair_trunks.dmi'
					usr.overlays-='ssj_futuretrunks_hair.dmi'
					usr.overlays-='ussj_futuretrunks_hair.dmi'
					usr.overlays -='hair_dan_goku.dmi'
					usr.overlays -= 'hair_ssj_goku.dmi'
					usr.overlays -= 'hair_ssj3_goku.dmi'
					usr.overlays -= 'hair_ssj4_goku.dmi'
					usr.overlays -='Hair_Bald_Supersayajin.dmi'
					usr.overlays -='ssj_trunks_hair.dmi'
					usr.overlays-= 'Red Elec.dmi'
					usr.overlays -= 'Vssj4.dmi'
					usr.overlays -= '2ssj4.dmi'
					usr.overlays-= usr.hairicon2
					usr.state = "Normal"

					usr.revertssj()

					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0
			Transform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.state!="Mystic"&&usr.state!="Majin")
						if(usr.ssj == 0|1 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj!=2)
								usr.ssj=2
								switch(input("What type of Super Saiyan do you wish to go?") in list("Super Saiyan","USSJ","Super Saiyan 2","Super Saiyan 3","Super Saiyan 4"))
									if("USSJ")
										if(usr.maxpowerlevel >= 600000 /*&& usr.ssj==0*/)

											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											if(usr.powerlevel<1000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel

												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"

												var/topowerlevel = (usr.powerlevel * 3)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s muscles bulge and his pupils disapear.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 3)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(4)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.powerlevel = round(usr.powerlevel)
											usr.loosehair()
											usr << "<b>You explode in rage as you go Ultra Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge and his pupils disapear.<font color = white>**"
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ussj_futuretrunks_hair.dmi'
											if (usr.hair=="Female")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.overlays-=usr.hairicon


											usr.underlays += 'ssjaura.dmi'
											if(usr.skincolor=="black")
												usr.icon='USupersayajin-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='USupersayajin-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='USupersayajin-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='USupersayajin-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='USupersayajin.dmi'

											usr.state = "Ultra Super Saiya-jin"

											usr.stamina-=50
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to go Ultra Super Saiyan."
										end
									if("Super Saiyan")
										if(usr.maxpowerlevel >= 300000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<700000)

												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"

												var/topowerlevel = (usr.powerlevel * 2.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else

												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s Hair stands on end...<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 2.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(4)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/300000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage and you go Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												usr.overlays += 'hair_punk_ssj.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_kros_long_ssj.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj_futuretrunks_hair.dmi'
											if (usr.hair=="Female")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.overlays-=usr.hairicon


											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.powerlevel = round(usr.powerlevel)
										else
											usr << "<b>You feel too weak to go Super Saiyan."
										end
									if("Super Saiyan 2")
										if(usr.maxpowerlevel >= 1000000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											if(usr.powerlevel<700000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"
												oview(6) << "<b>**<font color = red>sparks of power surround [usr]<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 3.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(12)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s Hair stands on end and sparks surround him.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 3.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/1000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage as you go Super Saiya-jin 2."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												usr.overlays += 'hair_punk_ssj.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_kros_long_ssj.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj_futuretrunks_hair.dmi'
											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Female")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											usr.overlays += 'elec.dmi'
											spawn(300)
												usr.overlays-='elec.dmi'
											usr.overlays-=usr.hairicon
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 2"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 2."
										end
									if("Super Saiyan 3")
										if(usr.maxpowerlevel >= 5000000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<20000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and his eyebrows dispatch.<font color = white>**"
												oview(6) << "<b>**<font color = red>Hair grows down to the floor.<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 4.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(15)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair grows long as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s eyebrows dispatch.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 4.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/5000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=1
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 3."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as his eyebrows begin to dispatch.<font color = white>**"
											if (usr.hair=="Spikey")
												usr.overlays+='Ssj3 1.dmi'
											if (usr.hair=="punk")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="kros_long")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="goten")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="radditz")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="Gohan")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Future Trunks")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Trunks")
												usr.overlays+='Ssj3 1.dmi'
											if (usr.hair=="Female")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Long")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Short")
												usr.overlays+='ssj3.dmi'
											if (usr.hair=="Vegeta")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="VegetaGT")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="Goku")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Spikey Long")
												usr.overlays+='Ssj3 3.dmi'

											usr.underlays += 'ssjaura.dmi'
											usr.overlays+= 'Ssj3 electricity.dmi'
											spawn(300)
												usr.overlays-='Ssj3 electricity.dmi'
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.state = "Super Saiya-jin 3"
											usr.overlays-=usr.hairicon



											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 3."
										end
									if("Super Saiyan 4")
										if(usr.maxpowerlevel >=10000000 /*&& usr.ssj==0*/)

											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<50000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn black and [usr]'s muscles bulge.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and red chesthair apears.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr] power increases greatly!.<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 5.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(20)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn black and [usr]'s muscles bulge.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and red chesthair apears.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 5.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(12)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1


											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr.overlays=0
											usr.overlays+= 'redelec.dmi'
											spawn(300)
												usr.overlays-='redelec.dmi'
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 4."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as he grows red hair on his chest.<font color = white>**"
											usr.overlays+='ssj4.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2
											if (usr.hair=="punk")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="goten")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="radditz")
												usr.overlays += 'ssj4 hair.dmi'


											if (usr.hair=="Gohan")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'Futuretrunkshair.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Trunks")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Female")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_long.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2


											if (usr.hair=="Long")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_long.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Short")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_short.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2


											if (usr.hair=="Vegeta")
												usr.hairicon2 = 'ssj4 vegeta.dmi'
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												usr.hairicon2 = 'ssj4 vegeta.dmi'
												usr.overlays+= usr.hairicon2

											if (usr.hair=="Goku")
												usr.hairicon2='2ssj4.dmi'
												usr.overlays += usr.hairicon2
											if (usr.hair=="Spikey Long")

												usr.overlays +='hair_ssj4_goku.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 4"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.overlays-=usr.hairicon
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 4."
										end
					else
						usr << "You are transformed already"*/

mob
	SuperNamek
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.underlays=0
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			SN()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								usr.drain=0
								switch(input("What type of Transformation do you wish to go?") in list("Super Namek","Super Namek 2","Ultra Super Namek","Legendary Super Namek"))
									if("Super Namek")
										if(usr.powerlevel >= 200000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a super namek**.<font color = white>**"

											usr.state = "Super Namek"
											usr.icon='super-namek.dmi'
											var/topowerlevel = (usr.powerlevel * 2.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(4)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to transform."
									if("Super Namek 2")
										if(usr.powerlevel >= 800000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a super namek 2**.<font color = white>**"

											usr.state = "Super Namek 2"
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 3.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(8)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."
									if("Ultra Super Namek")
										if(usr.powerlevel >= 3500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge, and vains pop out of [usr]'s head.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a Ultra super namek**.<font color = white>**"

											usr.state = "Ultra Super Namek"
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 4.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(12)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."
									if("Legendary Super Namek")
										if(usr.powerlevel >= 7000000 && usr.ssj==0)

											usr.drain=2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils disapear.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a legendary super namek**.<font color = white>**"

											usr.state = "Legendary Super Namek"
											usr.overlays+='elec.dmi'
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."

mob
	Unlockpower
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.underlays=0
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			Unlockpotential()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								usr.drain=0
								switch(input("What type of Transformation do you wish to go?") in list("Unlock Potential","Rage","Focus Power","Super"))
									if("Unlock Potential")
										if(usr.powerlevel >= 100000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr.ssj = 1
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils begin to dialate.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr]'s potential is unlocked**.<font color = white>**"

											usr.state = "Potential Unlocked"
											var/topowerlevel = (usr.powerlevel * 2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(3)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Rage")
										if(usr.powerlevel >= 500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] goes into a rage!**.<font color = white>**"

											usr.state = "Rage"
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(6)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Focus Power")
										if(usr.powerlevel >= 2500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] focus' his power!**.<font color = white>**"

											usr.state = "Focused"
											var/topowerlevel = (usr.powerlevel * 4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Super")
										if(usr.powerlevel >= 7500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr.overlays+='elec.dmi'

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											if(usr.race=="Human")
												oview(6) << "<b>**<font color = red>[usr] becomes Super**.<font color = white>**"
											else
												oview(6) << "<b>**<font color = red>[usr] Transforms to his super form.**.<font color = white>**"
											usr.state = "Super"
											var/topowerlevel = (usr.powerlevel * 4.4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."

mob
	Demontrans
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.overlays-='elec.dmi'
					usr.underlays=0
					usr.icon='maledemon.dmi'
					usr.overlays+=usr.hairicon
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			DemonTransform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								switch(input("What type of Transformation do you wish to go?") in list("Unlock Hate","Fat Janemba","Janemba","Super Janemba"))
									if("Unlock Hate")
										if(usr.powerlevel >= 100000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils begin to dialate.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] ulocks his inner evil**.<font color = white>**"

											usr.state = "Potential Unlocked"
											var/topowerlevel = (usr.powerlevel * 2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(3)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Fat Janemba")
										if(usr.powerlevel >= 500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] becomes incredibly large!**.<font color = white>**"

											usr.state = "Rage"
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1


											usr.overlays-=usr.hairicon

											usr.icon='FATJanemba.dmi'
											usr.basepowerlevel=usr.powerlevel
										else
											usr << "<b>You feel too weak to transform."

									if("Janemba")
										if(usr.powerlevel >= 2500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr] colapses into himself.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] shrinks and turns red**.<font color = white>**"

											usr.state = "Focused"
											var/topowerlevel = (usr.powerlevel * 4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1

											usr.overlays-=usr.hairicon
											flick("transform",usr)
											usr.icon='Janemba.dmi'
											usr.basepowerlevel=usr.powerlevel
										else
											usr << "<b>You feel too weak to transform."
									if("Super Janemba")
										if(usr.powerlevel >= 7500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr.overlays+='elec.dmi'

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											if(usr.race=="Human")
												oview(6) << "<b>**<font color = red>[usr] Focuses, and unlocks an incredible ammount of power**.<font color = white>**"
											else
												oview(6) << "<b>**<font color = red>[usr] Transforms to his super form.**.<font color = white>**"
											usr.state = "Super"
											var/topowerlevel = (usr.powerlevel * 4.4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

											usr.overlays-=usr.hairicon
											usr.icon='Janemba.dmi'
										else
											usr << "<b>You feel too weak to transform."

mob
	Bebi
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr.drain=-1
					if(src.skincolor=="black")
						src.icon='male-black.dmi'
					if(src.skincolor=="darkbrown")
						src.icon='male-brown.dmi'
					if(src.skincolor=="lightbrown")
						src.icon='male-lightbrown.dmi'
					if(src.skincolor=="white")
						src.icon='male-white.dmi'
					if(src.skincolor=="tan")
						usr.icon='male.dmi'
					if(src.skincolor=="fwhite")
						src.icon = 'female-pale.dmi'
					if(src.skincolor=="ftan")
						src.icon = 'female.dmi'
					if(src.skincolor=="flightbrown")
						src.icon = 'female-lightbrown.dmi'
					if(src.skincolor=="fdarkbrown")
						src.icon = 'female-darkbrown.dmi'
					if(src.skincolor=="fblack")
						src.icon = 'female-black.dmi'
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'ssj4 hair.dmi'
					usr.underlays=0
					usr.overlays-=usr.hairicon2
					usr.overlays -= 'elec.dmi'
					usr.overlays-='ssj4.dmi'
					usr.overlays -= 'hair_dan_ssjspikey.dmi'
					usr.overlays -= 'ssj3.dmi'
					usr.overlays -= 'hair_dan_spikeyshort.dmi'
					usr.overlays -= 'hair_dan_long.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays-= 'hair_dan_spikey.dmi'
					usr.overlays-= 'hair_dan_ssjspikey.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays -= 'hair_dan_short.dmi'
					usr.overlays -= 'hair_dan_vegeta.dmi'
					usr.overlays-='hair_Gohan.dmi'
					usr.overlays-='hair_trunks.dmi'
					usr.overlays-= usr.hairicon2

					usr.overlays-= 'Bebi_hair.dmi'
					usr.overlays -='hair_dan_goku.dmi'
					usr.overlays -= 'hair_ssj_goku.dmi'
					usr.overlays -= 'hair_ssj3_goku.dmi'
					usr.overlays -= 'hair_ssj4_goku.dmi'
					usr.overlays -='Hair_Bald_Supersayajin.dmi'
					usr.state = "Normal"
					usr.revertssj()
					usr.ssj=2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0
			BebiTransform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.state!="Mystic"&&usr.state!="Majin")
						if(/*usr.ssj == 0 && */usr.kaioken == 0)
							sleep(5)
							if(usr.ssj!=2)
								usr.ssj = 2
								switch(input("What type of Transformation do you wish to go?") in list("Bebi Form 1","Bebi Form 2","Bebi Form 3","Super Bebi"))
									if("Bebi Form 1")
										if(usr.maxpowerlevel >= 300000/* && usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.overlays-=usr.hairicon
											usr.loosehair()
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											usr.underlays += 'mysticaura.dmi'

											usr.state = "Bebi Form 1"
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel=usr.maxpowerlevel
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)

											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(5)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											var/masterpoints=usr.maxpowerlevel/300000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1


										else
											usr << "<b>You feel too weak to transform."
									if("Bebi Form 2")
										if(usr.maxpowerlevel >= 1000000/* && usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.loosehair()
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"

											usr.overlays-=usr.hairicon
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'
										//	usr.icon='bebi.dmi'

											usr.underlays += 'mysticaura.dmi'
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel=usr.maxpowerlevel

											usr.state = "Bebi Form 2"
											var/topowerlevel = (usr.powerlevel * 3.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(8)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											var/masterpoints=usr.maxpowerlevel/1000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1


										else
											usr << "<b>You feel too weak to transform."
									if("Bebi Form 3")
										if(usr.maxpowerlevel >= 5000000/*&& usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 2
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											usr.loosehair()
											usr.overlays-=usr.hairicon
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel = usr.maxpowerlevel
											usr.underlays += 'mysticaura.dmi'
											usr.overlays+='bebivest.dmi'
											usr.state = "Bebi Form 3"
											var/topowerlevel = (usr.powerlevel * 4.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(12)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

											var/masterpoints=usr.maxpowerlevel/5000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=1

											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to transform."
									if("Super Bebi")
										if(usr.maxpowerlevel >= 10000000 /*&& usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 2
											usr.loosehair()
											usr << "<b>You explode in rage as you Super Bebi."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											usr.overlays -= 'hair_dan_spikeyshort.dmi'
											usr.overlays -= 'hair_dan_long.dmi'
											usr.overlays -= 'hair_dan_short.dmi'
											usr.overlays -= 'hair_dan_vegeta.dmi'
											usr.overlays -= 'hair_dan_goku.dmi'
											usr.overlays -= 'hair_dan_spikey.dmi'
											usr.overlays-=usr.hairicon

											usr.overlays+= 'Bebi_hair.dmi'

											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'

											usr.underlays += 'mysticaura.dmi'
											usr.overlays+='bebigi.dmi'
											usr.state = "Super Bebi"
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel = usr.maxpowerlevel
											var/topowerlevel = (usr.powerlevel * 5.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1


											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
										else
											usr << "<b>You feel too weak to transform."
					else
						usr << "You are Transformed already."
	proc
		revertfuse()

			src.ssj = 0


			src.overlays+=src.hairicon


mob
	proc
		revertssj()
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.overlays -= 'ssj4 hair.dmi'
			src.overlays -= 'elec.dmi'
			src.overlays-='ssj4.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'ssj3.dmi'
			src.overlays-= 'hair_vegeta_ssj.dmi'
			src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_dan_spikeyshort.dmi'
			src.overlays -= 'hair_dan_long.dmi'
			src.overlays -= 'hair_dan_short.dmi'
			src.overlays -= 'hair_dan_vegeta.dmi'
			src.overlays-='hair_Gohan.dmi'
			src.overlays-='hair_trunks.dmi'
			src.overlays -='hair_dan_goku.dmi'
			src.overlays -='hair_dan_spikey.dmi'
			src.overlays -='hair_dan_ssjspikey.dmi'
			src.overlays+=src.hairicon
			src.overlays -= 'hair_ssj_goku.dmi'
			src.overlays -= 'hair_ssj3_goku.dmi'
			src.overlays -= 'hair_ssj4_goku.dmi'
			src.overlays -='Hair_Bald_Supersayajin.dmi'
			src.state = "Normal"

			src.ssj = 0


			if(src.powerlevel <= src.maxpowerlevel)
				src.powerlevel += 0
			if(src.powerlevel > src.maxpowerlevel)
				src.powerlevel = src.maxpowerlevel
mob
	proc
		refreshplayer()
			if(src.entime==1)
				src.entime = 0
				src << "You begin to calm..."

mob
	proc
		kaiokenstrain()
			if(src.kaioken == 1)
				sleep(60)
				src.stamina -= (rand(4,5))
				if(src.stamina <= 0)
					usr << "<b>You feel the strain of Kaioken."
					src.stamina = 0
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.underlays -= 'kaioaura.dmi'
					src.kaioken = 0
					src.KO()
				if(src.stamina >= 1)
					src.kaiokenstrain()

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
				set category = "Communication"
				if(usr.tapion==0&&usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
				else
					usr<<"Not while you are playing it!"
			Get()
				set category = "Communication"
				set src in oview(1)
				usr.tapion = 0
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Play()
				set category = "Communication"
				if(usr.tapion == 1)
					usr << "<b>But you feel soothed already..."
				if(usr.tapion == 0)
					usr.icon_state = "play"
					usr.tapion = 1
					usr.underlays += /obj/whiteaura
					spawn()usr << 'tapion.mid'
					usr.move = 1
					for(var/mob/M in view(6))
						if(M.client)
							spawn()
								M << "<b><font color = silver><font size = 1>You feel a chill go down your spine as the calming melody of Tapion is played by [usr]."
								M << 'tapion.mid'
								M.powerlevel = round(M.powerlevel)
								sleep(100)
								M << "<b>The melody drives into your heart. It fills your body with good."
								sleep(1020)
								M << "<b>As the melody stops, you feel your body reguivinate."
								M.stamina = 100
								M.hp=0
								M.icon_state = ""
								M.tapion = 0
/*
obj
	champbelt
*/

obj
	var
		name1
		ammount

obj
	senzu
		icon = 'turfs.dmi'
		icon_state = "senzu"
		name = "Senzu Bean"
		name1="Senzu Bean"
		ammount=1
		New()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[name1] ([src.ammount])"
				if(src.ammount<=0)
					del(src)
				if(src.ammount>10000)
					src.ammount=10000
		verb
			Get()
				set category = "Communication"
				set src in oview(1)
				var/counter=0
				for(var/obj/senzu/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/senzu/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "[O.name1] ([O.ammount])"
						del(src)
			Eat()
				set category = "Communication"
				if(src.ammount>=1&&usr.senzud==0)
					usr.senzud=1
					spawn(200)usr.senzud=0
					src.ammount--
					usr.powerlevel = usr.maxpowerlevel
					usr.stamina = 150
					usr.hp = 0
					usr << "<b>You feel better as you eat a Senzu Bean."
					src.CheckAmount()

obj
	ray
		icon = 'ray.dmi'
		layer = MOB_LAYER + 99





obj
	wover
		icon = 'turfs.dmi'
		icon_state = "wover"
		density = 0
		layer = MOB_LAYER + 44

obj
	Ciasstatue
		icon = '0Ciasstatue.dmi'
		density = 1
		layer = MOB_LAYER + 44


obj
	ki
		icon = 'skills.dmi'
		icon_state = "ki"
		layer = MOB_LAYER + 33

obj
	balls
		icon = 'dbs.dmi'
		icon_state = "balls"
		layer = MOB_LAYER + 1
		density=1
		obj
	dbdr
		icon = 'dbs.dmi'
		icon_state = ""
		layer = MOB_LAYER + 400

obj
	WeightTraining100
		icon = 'weight-objs.dmi'
		icon_state = "w100"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 8*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 2*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 8*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 2*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 9*3
								usr.stamina-=1
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining1000
		icon = 'weight-objs.dmi'
		icon_state = "w1000"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=10000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar1000"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 4*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 4*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 11*3
								usr.stamina-=1
							src.lift = 0
							usr.move = 1
							src.icon_state = "w1000"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining10k
		icon = 'weight-objs.dmi'
		icon_state = "w10k"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=100000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar10k"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 28*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 10*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 28*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 10*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 78*3
								usr.stamina-=2
							else
								usr.maxpowerlevel += 58*3
								usr.stamina-=2
							src.lift = 0
							usr.move = 1
							src.icon_state = "w10k"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining100k
		icon = 'weight-objs.dmi'
		icon_state = "w100k"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=1000000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100k"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 85*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 61*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 85*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 61*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 185*3
								usr.stamina-=3
							else
								usr.maxpowerlevel += 65*3
								usr.stamina-=3
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100k"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining1M
		icon = 'weight-objs.dmi'
		icon_state = "w1M"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=10000000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar1M"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 205*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 170*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 205*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 178*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 200*3
								usr.stamina-=4
							else
								usr.maxpowerlevel += 490*3
								usr.stamina-=3
							src.lift = 0
							usr.move = 1
							src.icon_state = "w1M"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."



obj
	PBag
		icon = 'weight-objs.dmi'
		icon_state = "pbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)

					if(usr.stamina >= 5 && usr.maxpowerlevel>=50000&&usr.afk==0)

						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("pbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=75000)
										usr.maxpowerlevel += 7*3
									if(usr.maxpowerlevel<=250000&&usr.maxpowerlevel>75000)
										usr.maxpowerlevel += 12*3
									if(usr.maxpowerlevel<=500000&&usr.maxpowerlevel>250000)
										usr.maxpowerlevel += 15*3
									if(usr.maxpowerlevel>500000)
										usr.maxpowerlevel += 18*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=75000)
										usr.maxpowerlevel += 11*3
									if(usr.maxpowerlevel<=250000&&usr.maxpowerlevel>75000)
										usr.maxpowerlevel += 14*3
									if(usr.maxpowerlevel<=500000&&usr.maxpowerlevel>250000)
										usr.maxpowerlevel += 18*3
									if(usr.maxpowerlevel>500000)
										usr.maxpowerlevel += 22*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."
obj
	SpeedBag
		icon = 'weight-objs.dmi'
		icon_state = "speed"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("speedhit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=2000)
										usr.maxpowerlevel += 1*3
									if(usr.maxpowerlevel<=10000&&usr.maxpowerlevel>2000)
										usr.maxpowerlevel += 2*3
									if(usr.maxpowerlevel<=30000&&usr.maxpowerlevel>10000)
										usr.maxpowerlevel += 4*3
									if(usr.maxpowerlevel>30000)
										usr.maxpowerlevel += 7*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=2000)
										usr.maxpowerlevel += 2*3
									if(usr.maxpowerlevel<=10000&&usr.maxpowerlevel>2000)
										usr.maxpowerlevel += 3*3
									if(usr.maxpowerlevel<=30000&&usr.maxpowerlevel>10000)
										usr.maxpowerlevel += 6*3
									if(usr.maxpowerlevel>50000)
										usr.maxpowerlevel += 7*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."
obj
	HeavyPBag
		icon = 'weight-objs.dmi'
		icon_state = "heavypbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=500000&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("heavypbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=750000)
										usr.maxpowerlevel += 25*3
									if(usr.maxpowerlevel<=2500000&&usr.maxpowerlevel>750000)
										usr.maxpowerlevel += 41*3
									if(usr.maxpowerlevel<=5000000&&usr.maxpowerlevel>2500000)
										usr.maxpowerlevel += 60*3
									if(usr.maxpowerlevel>5000000)
										usr.maxpowerlevel += 91*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=750000)
										usr.maxpowerlevel += 38*3
									if(usr.maxpowerlevel<=2500000&&usr.maxpowerlevel>750000)
										usr.maxpowerlevel += 54*3
									if(usr.maxpowerlevel<=5000000&&usr.maxpowerlevel>2500000)
										usr.maxpowerlevel += 79*3
									if(usr.maxpowerlevel>5000000)
										usr.maxpowerlevel += 121*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."

obj
	SuperPBag
		icon = 'weight-objs.dmi'
		icon_state = "superpbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=5000000&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("superpbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=6000000)
										usr.maxpowerlevel += 126 *4
									if(usr.maxpowerlevel<=10000000&&usr.maxpowerlevel>6000000)
										usr.maxpowerlevel += 149*4
									if(usr.maxpowerlevel<=20000000&&usr.maxpowerlevel>10000000)
										usr.maxpowerlevel += 175*4
									if(usr.maxpowerlevel>20000000)
										usr.maxpowerlevel += 200*4
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=6000000)
										usr.maxpowerlevel += 155*4
									if(usr.maxpowerlevel<=10000000&&usr.maxpowerlevel>6000000)
										usr.maxpowerlevel += 199*4
									if(usr.maxpowerlevel<=20000000&&usr.maxpowerlevel>10000000)
										usr.maxpowerlevel += 225*4
									if(usr.maxpowerlevel>20000000)
										usr.maxpowerlevel += 260*4
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0

					else
						usr << "You feel to weak to.."
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
				if(usr.flight == 0&&usr.resting==0&&usr.afk==0)
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
								usr.maxpowerlevel += rand(1,4)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								var/damage = (usr.powerlevel / (rand(1,8)))
								damage = round(damage)
								damage += (rand(0,15))
								view(6) << "<font color = blue><i>[usr] hits the machine, doing about [damage] damage to it."
								var/random = rand(1,2)
								if(random == 2)
									if(damage >= 1000000)
										var/oloc
										flick("machdes",src)
										view(6) << "<font color = blue><i>[usr] hits the machine too hard, destroying it!!"
										oloc = locate(src.x,src.y,src.z)
										src.loc=locate(10,150,150)
										var/err = new /obj/machwreck
										usr.zenni += (rand(1,100))
										sleep(rand(1,600))
										usr << "You got some Zenni from that last hit."

										del(err)
										src.loc=locate(oloc:x,oloc:y,oloc:z)
									if(damage < 1000000)
										usr.zenni += (rand(1,10))
										usr << "You got some Zenni from that last hit."

								if(random == 1)
									usr.maxpowerlevel += rand(1,2)


								usr.meditate = 0
							else
								view(6) << "<font color = blue><i>[usr] hits the machine, doing [usr.powerlevel / (rand(2,8))] damage to the machine!"
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
		icon = 'auras.dmi'
		icon_state = "whiteaura"

obj
	kaioaura
		icon = 'auras.dmi'
		icon_state = "kaioaura"

obj
	spar





obj
	halofront
		icon = 'skills.dmi'
		icon_state = "halofront"
		layer = MOB_LAYER + 3
	haloback
		icon = 'skills.dmi'
		icon_state = "haloback"


	blueunderdmi
		icon = 'clothes-blueunder.dmi'
		layer = MOB_LAYER + 1



	blackgidmi
		icon = 'clothes-blackgi.dmi'
		layer = MOB_LAYER + 1
	bluegidmi
		icon = 'clothes-bluegi.dmi'
		layer = MOB_LAYER + 1

	Panties
		name = "Panties"
		icon = 'panties.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'panties.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'panties.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication"
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication"
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"


	orangeunderdmi
		icon = 'clothes-orangeunder.dmi'
		layer = MOB_LAYER + 1


	Customgi
		name = "Custom Gi"
		icon = 'clothes-blackgi2.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-blackgi.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customsaiyajinarmor
		name = "Custom Saiya-jin Armor"
		icon = 'saiyanarmorc.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
			//		usr.overlays =0
			//		usr.revertssj()




					usr << "You remove the [src.name]."
					usr.overlays-= src.clothes

					usr.overlays-='saiyanarmor.dmi'

					usr.overlays-='saiyanarmor2.dmi'

					usr.overlays-='saiyanarmor4.dmi'
					src.clothes=""

				else
					src.worn = 1
					usr.weight+=src.weight
					if(src.armorstyle==0)
						usr.overlays+='saiyanarmor.dmi'
					if(src.armorstyle==1)
						usr.overlays+='saiyanarmor2.dmi'
					if(src.armorstyle==2)
						usr.overlays+='saiyanarmor4.dmi'
					src.clothes = 'saiyanarmor6.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
				switch(input("Which form of saiya-jin armor do you want?","Armor",text) in list("No Sholder Pads","Sholder Pads only","Sholder and Leg Pads","None"))
					if("No Sholder Pads")
						src.armorstyle=0
					if("Sholder Pads only")
						src.armorstyle=1
					if("Sholder and Leg Pads")
						src.armorstyle=2

	SpecialItemPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
			keylocked
			guildlocked
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon

				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(!src.keylocked && !src.guildlocked)
					if(src.worn == 1)
						src.worn = 0
						usr.weight-=src.weight
						usr << "You remove the [src.name]."
						usr.overlays-=tempicon
					else
						src.worn = 1
						usr.weight+=src.weight
						src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
						usr.overlays += tempicon
						usr << "You wear the [src.name]."
				else
					if(src.keylocked==usr.key || src.guildlocked==usr.guild)
						if(src.worn == 1)
							src.worn = 0
							usr << "You remove the [src.name]."
							usr.overlays-=tempicon
						else
							src.worn = 1
							src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
							usr.overlays += tempicon
							usr << "You wear the [src.name]."

			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
					if(src.keylocked)
						del(src)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	SpecialProjectilePrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					usr << "You remove the [src.name]."
					usr.weapon=0
					usr.kiblastcolor="yellow"
				else
					src.worn = 1
					usr << "You wear the [src.name]."
					usr.weapon=1
					usr.kiblastcolor="custom"
					usr.projectile= src.SpecialIcon
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			//vars= clothesred,clothesgreen,clothesblue,special
	SpecialWeaponPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=tempicon
					usr.weapon=0
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += tempicon
					usr << "You wear the [src.name]."
					usr.weapon=1
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			//vars= clothesred,clothesgreen,clothesblue,special
	SpecialUnderPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.underlays-=tempicon
				else
					src.worn = 1
					usr.weight+=src.weight
					src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.underlays += tempicon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	SpecialWeapon
	SpecialItem
	SpecialWeaponProtected
	SpecialItemProtected

	SpecialMorpher
		name = "Morpher"
		icon = 'Morpher.dmi'
		worn = 0
		var
			psuit
			phelm
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr << "You revert."
					usr.overlays=0
					sleep(1)
					usr.overlays=usr.ooverlays
					for(var/obj/O in usr.contents)
						O.worn=0
					usr.revertssj()
				else
					src.worn = 1
					usr.ooverlays=usr.overlays
					sleep(1)
					usr.overlays=0
					usr.overlays += src.phelm
					usr.overlays += src.psuit
					usr << "Its morphin time!!!."
					sleep(1)
					view()<<"[usr] Transforms!!"
			PowerRangers_Teleport()
				set category = "Communication"
				if(usr.z!=20)
					usr<<"Teleporting!"
					usr.loc=locate(105,157,20)
				else
					usr<<"Teleporting!"
					usr.loc=locate(77,77,1)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	DarknessDemonController
		name = "Darkness Demon Controller"
		icon = 'controller.dmi'
		worn = 0
		verb
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Control_Demons()
				set category = "Communication"
				if(usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>"||usr.creator==1)
					for(var/mob/monsters/DarknessDemon/M in oview(10))
						M.owner=usr.key
			Destroy()
				set category = "Communication"
				del(src)

	Customcloak
		name = "Custom Cloak"
		icon = 'kros clothesc.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'kros clothes.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customunder
		name = "Custom under"
		icon = 'clothes-blackunder2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'clothes-blackundergi.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customheadband
		name = "Custom Headband"
		icon = 'head-bandc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'head-band.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	CustomGloves
		name = "Custom Gloves/Boots"
		icon = 'clothes-gloves-bootsc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					usr.weight-=src.weight
					src.worn = 0
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-gloves-boots.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue

	CustomCape
		name = "Custom Cape"
		icon = 'clothes-capec.dmi'
		worn=0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-cape.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	CustomShirt
		name = "Custom Shirt"
		icon = 'clothes-shirtc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'clothes-shirt.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue

	CustomShoes
		name = "Custom shoes"
		icon = 'clothes-shoesc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'clothes-shoes.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Custompants
		name = "Custom Pants"
		icon = 'clothes_custompants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					usr.weight+=src.weight
					src.clothes = 'clothes_blackpants.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	blackgi
		name = "Black Gi"
		icon = 'clothes-blackgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackgi.dmi'
					usr << "You remove the [src.name]."
				else
					usr.weight+=src.weight
					src.worn = 1
					usr.overlays += 'clothes-blackgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluegi
		name = "Blue Gi"
		icon = 'clothes-bluegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-bluegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-bluegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueshoes
		name = "Blue shoes"
		icon = 'clothes-blueshoes.dmi'
		worn = 0

		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blueshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blueshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluegloves
		name = "Blue gloves"
		icon = 'clothes-bluegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-bluegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-bluegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluepants
		name = "Blue pants"
		icon = 'clothes_bluepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_bluepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_bluepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueshirt
		name = "Blue shirt"
		icon = 'clothes-blueshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blueshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blueshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluecape
		name = "Blue cape"
		icon = 'clothes-bluecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-bluecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-bluecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueunder
		name = "Blue under"
		icon = 'clothes-blueunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blueunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blueunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redgi
		name = "Red Gi"
		icon = 'clothes-redgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greengi
		name = "Green Gi"
		icon = 'clothes-greengi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greengi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greengi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitegi
		name = "White Gi"
		icon = 'clothes-whitegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whitegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whitegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangegi
		name = "Orange Gi"
		icon = 'clothes-orangegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplegi
		name = "Purple Gi"
		icon = 'clothes-purplegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purplegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purplegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greygi
		name = "Grey Gi"
		icon = 'clothes-greygi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greygi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greygi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowgi
		name = "Yellow Gi"
		icon = 'clothes-yellowgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackunder
		name = "Black under"
		icon = 'clothes-blackunder.dmi'
		worn = 0

		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redunder
		name = "Red under"
		icon = 'clothes-redunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenunder
		name = "Green under"
		icon = 'clothes-greenunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greenunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greenunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteunder
		name = "White under"
		icon = 'clothes-whiteunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whiteunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeunder
		name = "Orange under"
		icon = 'clothes-orangeunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangeunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleunder
		name = "Purple under"
		icon = 'clothes-purpleunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purpleunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyunder
		name = "Grey under"
		icon = 'clothes-greyunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greyunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greyunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowunder
		name = "Yellow under"
		icon = 'clothes-yellowunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackcape
		name = "Black cape"
		icon = 'clothes-blackcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redcape
		name = "Red cape"
		icon = 'clothes-redcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greencape
		name = "Green cape"
		icon = 'clothes-greencape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greencape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greencape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitecape
		name = "White cape"
		icon = 'clothes-whitecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whitecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whitecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangecape
		name = "Orange cape"
		icon = 'clothes-orangecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplecape
		name = "Purple cape"
		icon = 'clothes-purplecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purplecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purplecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greycape
		name = "Grey cape"
		icon = 'clothes-greycape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greycape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greycape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowcape
		name = "Yellow cape"
		icon = 'clothes-yellowcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackshirt
		name = "Black shirt"
		icon = 'clothes-blackshirt.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redshirt
		name = "Red shirt"
		icon = 'clothes-redshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenshirt
		name = "Green shirt"
		icon = 'clothes-greenshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greenshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greenshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteshirt
		name = "White shirt"
		icon = 'clothes-whiteshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whiteshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeshirt
		name = "Orange shirt"
		icon = 'clothes-orangeshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangeshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleshirt
		name = "Purple shirt"
		icon = 'clothes-purpleshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purpleshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyshirt
		name = "Grey shirt"
		icon = 'clothes-greyshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greyshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greyshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowshirt
		name = "Yellow shirt"
		icon = 'clothes-yellowshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackpants
		name = "Black pants"
		icon = 'clothes_blackpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_blackpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_blackpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redpants
		name = "Red pants"
		icon = 'clothes_redpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_redpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_redpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenpants
		name = "Green pants"
		icon = 'clothes_greenpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_greenpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_greenpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitepants
		name = "White pants"
		icon = 'clothes_whitepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_whitepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_whitepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangepants
		name = "Orange pants"
		icon = 'clothes_orangepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_orangepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_orangepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplepants
		name = "Purple pants"
		icon = 'clothes_purplepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_purplepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_purplepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greypants
		name = "Grey pants"
		icon = 'clothes_greypants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_greypants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_greypants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowpants
		name = "Yellow pants"
		icon = 'clothes_yellowpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes_yellowpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes_yellowpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackgloves
		name = "Black gloves"
		icon = 'clothes-blackgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redgloves
		name = "Red gloves"
		icon = 'clothes-redgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greengloves
		name = "Green gloves"
		icon = 'clothes-greengloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greengloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greengloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitegloves
		name = "White gloves"
		icon = 'clothes-whitegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whitegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whitegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangegloves
		name = "Orange gloves"
		icon = 'clothes-orangegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplegloves
		name = "Purple gloves"
		icon = 'clothes-purplegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purplegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purplegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greygloves
		name = "Grey gloves"
		icon = 'clothes-greygloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greygloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greygloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowgloves
		name = "Yellow gloves"
		icon = 'clothes-yellowgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackshoes
		name = "Black shoes"
		icon = 'clothes-blackshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redshoes
		name = "Red shoes"
		icon = 'clothes-redshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenshoes
		name = "Green shoes"
		icon = 'clothes-greenshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greenshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greenshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteshoes
		name = "White shoes"
		icon = 'clothes-whiteshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whiteshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeshoes
		name = "Orange shoes"
		icon = 'clothes-orangeshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangeshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleshoes
		name = "Purple shoes"
		icon = 'clothes-purpleshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purpleshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyshoes
		name = "Grey shoes"
		icon = 'clothes-greyshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greyshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greyshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowshoes
		name = "Yellow shoes"
		icon = 'clothes-yellowshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackcloak
		name = "Black cloak"
		icon = 'clothes-blackcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-blackcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-blackcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redcloak
		name = "Red cloak"
		icon = 'clothes-redcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-redcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-redcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greencloak
		name = "Green cloak"
		icon = 'clothes-greencloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greencloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greencloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitecloak
		name = "White cloak"
		icon = 'clothes-whitecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-whitecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-whitecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluecloak
		name = "Blue cloak"
		icon = 'clothes-bluecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-bluecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-bluecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangecloak
		name = "Orange cloak"
		icon = 'clothes-orangecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-orangecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-orangecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplecloak
		name = "Purple cloak"
		icon = 'clothes-purplecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-purplecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-purplecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greycloak
		name = "Grey cloak"
		icon = 'clothes-greycloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-greycloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-greycloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowcloak
		name = "Yellow cloak"
		icon = 'clothes-yellowcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'clothes-yellowcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	namekgi
		name = "Namekian Gi"
		icon = 'namekgi.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'namekgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'namekgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	turben
		name = "Turben"
		icon = 'turben.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'turben.dmi'
					usr << "You remove the [src.name]."


				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'turben.dmi'
					usr << "You wear the [src.name]."

			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	cape
		name = "White Cape"
		icon = 'cape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'cape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'cape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	saiyanarmor
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitefp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitefp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitefp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	Freiza_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Freiza Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Vegeta Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Nappa Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Raditz Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Bardock_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Bardock Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Toma_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Toma Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Panboukin_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Panboukin Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Totepo_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Totepo Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Red_Armor
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Red Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Vegeta Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Nappa Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Raditz Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Vegeta Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Nappa Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Saiyajin Armor/Raditz Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Black
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_black.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Blue
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_blue.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Gray
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_gray.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Green
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_green.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Red
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_red.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_White
		name = "Underclothing"
		icon = 'Saiyajin Armor/under_white.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	blacksaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blackfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blackfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blackfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluefp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluefp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluefp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-redfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-redfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-redfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greenfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greenfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greenfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitehp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitehp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitehp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blacksaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blackhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blackhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blackhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluehp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluehp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluehp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-redhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-redhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-redhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greenhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greenhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greenhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitenp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitenp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitenp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blacksaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blacknp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blacknp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blacknp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluenp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluenp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluenp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-rednp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-rednp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-rednp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greennp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greennp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greennp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	royalsaiyan
		name = "Royal Saiya-jin Armor"
		icon = 'saiyanarmor4.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor4.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.weight+=src.weight
					usr.overlays += 'saiyanarmor4.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Shinobiband
		name = "Shinobi Head-band"
		icon = 'shinobi-band.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(usr.guild=="sHiNoBi")
					if(src.worn == 1)
						src.worn = 0
						usr.overlays -= 'shinobi-band.dmi'
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'shinobi-band.dmi'
						usr << "You wear the [src.name]."
				else
					usr<<"You must be in Shinobi to use this item"
					src.worn = 0
					usr.overlays -= 'shinobi-band.dmi'
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Sunglasses
		name = "Sunglasses"
		icon = 'Shades.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'Shades.dmi'

					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'Shades.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackelite
		name = "Elite Saiya-jin Armor (Black)"
		icon = 'saiyanarmor5.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor5.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor5.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	blueelite
		name = "Elite Saiya-jin Armor (Blue)"
		icon = 'saiyanarmor3.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor3.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	custom_armor
		name = "Custom Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"



	elitesaiyanarmor
		name = "Elite Saiya-jin Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	bootglovedmi
		icon = 'gloves-boots.dmi'
		layer = MOB_LAYER + 1

	boxingglove
		name = "Boxing Gloves"
		icon = 'boxing.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'boxing.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'boxing.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"


	GogetaArmor
		name = "Gogeta's Vest"
		icon = 'GogetaVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GogetaVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GogetaVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	keycards
		Red
			name="Red Keycard"
			icon = 'keycards.dmi'
			icon_state="Red"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1)
						src.loc=locate(usr.x,usr.y+1,usr.z)

		Blue
			name="Blue Keycard"
			icon = 'keycards.dmi'
			icon_state="Blue"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1)
						src.loc=locate(usr.x,usr.y+1,usr.z)
		Gold
			name="Gold Keycard"
			icon = 'keycards.dmi'
			icon_state="Gold"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1)
						src.loc=locate(usr.x,usr.y+1,usr.z)
		Green
			name="Green Keycard"
			icon = 'keycards.dmi'
			icon_state="Green"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1)
						src.loc=locate(usr.x,usr.y+1,usr.z)



	GotenkArmor
		name = "Gotenk's Vest"
		icon = 'GotenkVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GotenkVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GotenkVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	bootglove
		name = "White Boots and Gloves"
		icon = 'gloves-boots.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'gloves-boots.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'gloves-boots.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj/Eviltank
	icon='darkcontainer.dmi'
	density=1
	verb
		Check()
			set category ="Command"
			set src in oview(1)
			if(usr.race=="Demon"&&usr.demontrans==0)
				usr<<"This tank is almost full... with that sort of evil energy you could become much stronger."
				switch(input("Do you want to absorb all the evil energy?", "Tank of Evil",text) in list ("Yes","No"))
					if("Yes")
						usr<<"The evil floods into your body, you can now summon this evil to transform"
						usr.demontrans=1
						usr.verbs+=/mob/Demontrans/verb/Revert
						usr.verbs+=/mob/Demontrans/verb/DemonTransform
			else
				usr<<"It seems to be a tank of pure evil, extracted from washed souls."


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
			if(howmuch > 1 && howmuch <= 50000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 50000)
				usr << "<b>The gravitron cannot withstand more than 50000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
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
			if(howmuch > 1 && howmuch <= 150000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 150000)
				usr << "<b>The gravitron cannot withstand more than 150000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj/Gravitronthree
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 400000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 400000)
				usr << "<b>The gravitron cannot withstand more than 400000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj/Gravitronfour
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 1000000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 1000000)
				usr << "<b>The gravitron cannot withstand more than 1000000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1


obj/Gravitronfive
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 1500000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 1500000)
				usr << "<b>The gravitron cannot withstand more than 1500000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1


obj/Gravitronfourspecial
	icon = 'gravchamber.dmi'
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
			if(howmuch > 1 && howmuch <= 1250000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 1250000)
				usr << "<b>The gravitron cannot withstand more than 1250000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj
	JanembaSword
		icon = 'swordz3.dmi'
		layer = MOB_LAYER + 1
		name = "Janemba's Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz3.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	TapionSword
		icon = 'swordz2.dmi'
		layer = MOB_LAYER + 1
		name = "Tapion's Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz2.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	Sword1
		icon = 'swordz.dmi'
		layer = MOB_LAYER + 1
		name = "Z Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Swordsheath
		icon = 'sword.dmi'
		layer = MOB_LAYER + 1
		name = "Sword Sheath"
		verb
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'sword.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'sword.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
obj
	green_scouter
		icon = 'green-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class III Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'green-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'green-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"



obj
	custom_scouter
		icon = 'custom-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Custom Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'custom-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'custom-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	red_scouter
		icon = 'red-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class II Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'red-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'red-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 100000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 100000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	yellow_scouter
		icon = 'yellow-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class IV Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'yellow-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'yellow-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 10000000000000000000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 10000000000000000000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					usr << "<B>[M.name]'s location: ([M.x],[M.y],[M.z])"

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	blue_scouter
		icon = 'blue-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class I Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'blue-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'blue-scouter.dmi'
					usr << "You wear the [src.name]."

			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 50000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 50000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Search()
				set category = "Communication" //was inventory
				if(src.worn == 1)

					usr << "<B>Your location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<b>[M.name]'s location points off into the distance."
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	halo
		icon = 'halo.dmi'
		layer = MOB_LAYER + 1
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
		layer = MOB_LAYER + 2
		//verb
		//	Heal()
		//		set category = "Training"
		//		set src in oview(1)
		//		usr.playerheal()
		//		usr.heal = 1

mob
	proc
		playerheal()
			if(src.heal == 0||null)
				src.powerlevel += 0
			if(src.heal == 1)
				if(src.hp <= 0)
					src.hp=0
					src.heal = 0
				if(src.hp >0)
					src.hp+= 100
					if(src.powerlevel<src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					spawn(1)
						src.playerheal()


obj
	Icecube
		icon = 'ice.dmi'
		icon_state = ""
		layer = MOB_LAYER + 3
		New()
			flick(src,"ice_animation")

obj
	assim
		icon = 'turfs.dmi'
		icon_state = "assim"
		layer = MOB_LAYER + 3

obj
	Gdonut
		icon ='Donut.dmi'
		icon_state ="Donut"
		layer = MOB_LAYER + 3





obj/kitrail3
	icon = 'kametrail2.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail4
	icon = 'kametrail2.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/kitrail5
	icon = 'kametrail3.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail6
	icon = 'kametrail3.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/kitrail7
	icon = 'kametrail4.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail8
	icon = 'kametrail4.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/SpecialBeamCannon
	icon = 'kame4.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/scatter
	icon = 'kamescatter.dmi'
	icon_state=""
	density=0
	npc = 5
	layer = MOB_LAYER+3
	New()
		flick("1",src)
obj/kitrail
	icon = 'kametrail.dmi'
	icon_state=""
	density=0
	npc = 5
	pixel_step_size=8
obj/kitrail2
	icon = 'kametrail.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
	pixel_step_size=8
obj/FinalFlash
	icon = 'kame.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/GalekGun
	icon = 'kame9.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/Tsuihikidan
	icon = 'kame10.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/sbomb
	icon = 'turfs.dmi'
	icon_state = "sbomb"
	density = 0
	pixel_step_size=8
obj/crator
	name=""
	density=0
	npc=2
	New()
		src.underlays+=new/obj/Crater/T1
		src.underlays+=new/obj/Crater/T2
		src.underlays+=new/obj/Crater/B1
		src.underlays+=new/obj/Crater/B2
		spawn()
			sleep(600)
			del(src)
mob/smoke
	icon='0smoke.dmi'
	density = 0
	layer = MOB_LAYER+4
	name=""
	New()
		spawn()
			sleep(80)
			del(src)







obj
	kshoot
		icon = 'turfs.dmi'
		icon_state = "des"

obj
	kien
		icon = 'turfs.dmi'
		icon_state = "des"


mob
	kienzan
		verb
			Kienzan(mob/characters/M in oview(6))
				set name = "Kien-zan"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are currently charging something."
				if(usr.kame == 0 && usr.move==1||usr.kame == null)
					if(usr.nopk==0)
						dam=skillkiusage[9]
						if(dam >= usr.ki)
							usr << "Thats too strong."
						if(dam <= usr.ki &&dam>0)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame=1
								usr.icon_state = "des"
								usr.ki-=dam
								if(usr.powerlevel>usr.maxpowerlevel)
									dam=dam*(usr.powerlevel/usr.maxpowerlevel)
								dam=dam*300
								dam=(dam/(M.powerlevel+1))*50
								if(usr.sounds==1)
									spawn()usr<<'sounds/destructodisc_charge.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/destructodisc_charge.wav'
								sleep(rand(10,20))
								var/snart = new /obj/kien(locate(usr.x,usr.y+1,usr.z))

								sleep(rand(10,30))
								if(usr.sounds==1)
									spawn()usr<<'sounds/disc_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/disc_fire.wav'
								usr <<"Kienzan!!"
								sleep(100)
								del(snart)
								s_missile(/obj/kien,usr,M)
								M.hp-=dam
								usr.icon_state = ""
								M.Die()
								spawn()usr.KO()
								usr.kame=0

					else
						usr<<"This is a no pk zone!!"
mob
	tourneyjoin
		verb
			JoinBudokai()
				set name="Join Budokai"
				set category="Budokai"
				usr.loc=locate(rand(151,170),59,3)
				world<<"[usr] Joins the Budokai"
				usr.verbs -= /mob/tourneyjoin/verb/JoinBudokai



/*
mob
	godform
		verb
			Transform()
				set category = "Fighting"
				if(usr.state == "God")
					usr << "<b>You are transformed already."
				else
					world << "<b><font color = yellow>You feel an incredible power!!!!"
					usr.ooverlays=usr.overlays
					usr.overlays=0
					usr.underlays=0
					flick("godtransform.dmi",usr)
					usr.overlays+='godchair.dmi'
					usr.overlays+='godelec.dmi'
					usr.overlays+='godwind.dmi'
					usr.underlays+='godaura.dmi'

					usr.powerlevel = (usr.powerlevel * 10)
					usr.state="God"


			Revert()
				set category = "Fighting"
				if(usr.state == "Normal")
					usr << "<b>You aren't transformed."
				else
					world << "<b><font color = yellow>You sense a huge power die..."
					usr.state = "Normal"
					usr.overlays=0
					usr.underlays=0
					usr.overlays=usr.ooverlays
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
*/
mob
	proc
		loosehair()
			src.overlays-= src.hairicon
			src.overlays-= src.hairicon
			if(src.state=="Ultra Super Saiya-jin")
				if(src.skincolor=="black")
					src.icon='male-black.dmi'
				if(src.skincolor=="darkbrown")
					src.icon='male-brown.dmi'
				if(src.skincolor=="lightbrown")
					src.icon='male-lightbrown.dmi'
				if(src.skincolor=="white")
					src.icon='male-white.dmi'
				if(src.skincolor=="tan")
					src.icon='male.dmi'
				if(src.skincolor=="fwhite")
					src.icon = 'female-pale.dmi'
				if(src.skincolor=="ftan")
					src.icon = 'female.dmi'
				if(src.skincolor=="flightbrown")
					src.icon = 'female-lightbrown.dmi'
				if(src.skincolor=="fdarkbrown")
					src.icon = 'female-darkbrown.dmi'
				if(src.skincolor=="fblack")
					src.icon = 'female-black.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays=0
			src.overlays -= 'ssj4 hair.dmi'
			src.overlays -= 'elec.dmi'
			src.overlays -='ssj4.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'ssj3.dmi'
			src.overlays -= 'hair_dan_spikeyshort.dmi'
			src.overlays -= 'hair_dan_long.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_dan_spikey.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_dan_short.dmi'
			src.overlays -= 'hair_dan_vegeta.dmi'
			src.overlays -='hair_Gohan.dmi'
			src.overlays -='hair_trunks.dmi'
			src.overlays -='ssj_futuretrunks_hair.dmi'
			src.overlays -='ussj_futuretrunks_hair.dmi'
			src.overlays -='hair_dan_goku.dmi'
			src.overlays -= 'hair_ssj_goku.dmi'
			src.overlays -= 'hair_ssj3_goku.dmi'
			src.overlays -= 'hair_ssj4_goku.dmi'
			src.overlays -='Hair_Bald_Supersayajin.dmi'
			src.overlays -='ssj_trunks_hair.dmi'
			src.overlays -= 'Red Elec.dmi'
			src.overlays -= 'Vssj4.dmi'
			src.overlays -= '2ssj4.dmi'
			src.overlays -= src.hairicon2

/*
obj
	Chr
		icon='turfs.dmi'
		icon_state="chr"
	is
		icon='turfs.dmi'
		icon_state="is"
obj
	var
		clothes
		worn=0
		clothesred
		clothesblue
		clothesgreen
mob
	AndroidTransform
		verb
			AndroidTransform()
				set category="Fighting"
				set name ="Super Android Transform"
				usr.drain=0
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Upgrade 1","Upgrade 2","Upgrade 3","Super Android","Revert","None"))
					if("Super Android")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 9000000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.overlays+='elec.dmi'
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * 5.2)
								var/gainedpowerlevel=usr.powerlevel
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(20)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Super Android"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
								var/masterpoints=usr.maxpowerlevel/9000000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=1
								usr.drain=drain
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 1")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 250000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * 2.2)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(3)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 1"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 2")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 900000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura

								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								var/topowerlevel = (usr.maxpowerlevel * 3.2)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 2"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel

							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."
					if("Upgrade 3")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 4500000)
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr]<font color = white> begins to transform!-"
								usr.state="Transforming"
								if(usr.auratype==0)
									var/aura = 'whiteaura.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==1)
									var/aura = 'whiteaura2.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==2)
									var/aura = 'whiteaura3.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==3)
									var/aura = 'whiteaura4.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								if(usr.auratype==4)
									var/aura = 'whiteaura6.dmi'
									aura += rgb(usr.customred,usr.customgreen,usr.customblue)
									usr.underlays += aura
								usr.overlays+='elec.dmi'
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								var/topowerlevel = (usr.maxpowerlevel * 4.2)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Tier 3"
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								var/masterpoints=usr.maxpowerlevel/4500000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=2
								usr.drain=drain
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You are transformed already!."


					if("Revert")
						if(usr.state == "Normal")
							usr << "You are reverted already."
							usr.ssj=0
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							usr.overlays-='elec.dmi'
							usr.ssj=0
							usr.state = "Normal"
							usr.underlays=0
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel

mob
	transform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"

				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Form Four","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(usr.maxpowerlevel >= 300000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form2",usr)
								usr.icon = 'ChangeForm2.dmi'
								usr.powerlevel = usr.maxpowerlevel * 2
								usr.state = "Form Two"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")

							if(usr.maxpowerlevel >= 1000000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form3",usr)
								usr.icon = 'ChangeForm3.dmi'
								usr.powerlevel = usr.maxpowerlevel * 4
								usr.state = "Form Three"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."

					if("Form Four")
						if(usr.state == "Form Three")
							if(usr.maxpowerlevel >= 4000000)
								usr.drain=0
								usr.ssj=1
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								flick("form4",usr)
								usr.icon = 'ChangeForm4.dmi'
								usr.powerlevel = usr.maxpowerlevel * 5
								usr.state = "Form Four"
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form Three."
					if("Revert")
						usr.ssj=0
						if(usr.state == "Normal")
							usr << "You are reverted already."
						else
							usr.drain=-1
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'changling.dmi'
							usr.state = "Normal"
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel

mob
	celltransform
		verb
			Transform()
				set category = "Fighting"
				set name = "Transform/Revert"
				switch(input("Which form do you wish to Transform/Revert?","Transform",text) in list("Form Two","Form Three","Ultra Perfect","Revert","None"))
					if("Form Two")
						if(usr.state == "Normal")
							if(usr.powerlevel >= 500000 && usr.maxpowerlevel >=400000)
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.underlays+='mysticaura.dmi'
								var/topowerlevel = (usr.maxpowerlevel * 2.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								usr.drain=0

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								usr.state = "Form Two"
								flick("transform",usr)
								usr.icon = 'biocell2.dmi'
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."
						else
							usr << "<b>You must be in Form One."

					if("Form Three")
						if(usr.state == "Form Two")
							if(usr.powerlevel >= 1000000&&usr.maxpowerlevel >=800000)
								if(usr.powerlevel>usr.maxpowerlevel)
									usr.powerlevel=usr.maxpowerlevel
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								usr.state="Transforming"
								usr.underlays+='mysticaura.dmi'

								var/topowerlevel = (usr.maxpowerlevel * 3.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								usr.drain=0
								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop


								usr.state = "Form Three"
								flick("transform",usr)
								usr.icon = 'biocell3.dmi'
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Two."
					if("Ultra Perfect")
						if(usr.state == "Form Three")
							if(usr.powerlevel>usr.maxpowerlevel)
								usr.powerlevel=usr.maxpowerlevel
							if(usr.powerlevel >= 4000000 && usr.maxpowerlevel >=3500000)
								view(6) << "<font color = green>-[usr.name]<font color = white> begins to transform!-"
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.state="Transforming"
								flick("sbomb",usr)
								usr.underlays+='mysticaura.dmi'

								var/topowerlevel = (usr.maxpowerlevel * 4.5)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50

								sleep(8)
								if(gainedpowerlevel<topowerlevel&&usr.state=="Transforming")
									goto loop
								var/masterpoints=usr.maxpowerlevel/3500000
								var/drain=0
								drain=4
								if(masterpoints>1.5)
									drain-=2
								if(masterpoints>2)
									drain-=2
								usr.drain=drain
								usr.state = "Ultra Perfect"
								usr.underlays=0
								if(usr.powerlevel>topowerlevel)
									usr.powerlevel=topowerlevel
								usr.basepowerlevel=usr.powerlevel
							else
								usr << "<i>You still are too weak...."

						else
							usr << "<b>You must be in Form Three."

					if("Revert")
						if(usr.icon == "biobiobiocell3.dmi")
							usr << "You are reverted already."
						else
							view(6) << "<font color = green>-[usr.name]<font color = white> begins to revert from [usr.state]-"
							flick("revert",usr)
							usr.icon = 'biocell1.dmi'
							usr.state = "Normal"
							usr.drain=-1
							if(usr.powerlevel >= usr.maxpowerlevel)
								usr.powerlevel = usr.maxpowerlevel
							usr.basepowerlevel=usr.powerlevel


/*mob
	enrage
		verb
			Enrage()
				set category = "Fighting"
				if(usr.entime == 1)
					usr << "You are still too angry..."
					sleep(1200)
					if(usr.entime==1)
						usr.entime = 0
						usr << "You begin to calm..."
				else
					if(usr.ssj == null||usr.ssj == 0 && usr.kaioken == 0||usr.kaioken == null)
						usr << "<font face = Arial><font size = 2><font color = silver>You begin to get enraged....remembering all the hateful things in your past......"
						spawn()usr.Getpissed()
						if(usr.sounds==1)
							spawn()usr<<'sounds/powerup.wav'
						for(var/mob/characters/L in oview(4))
							if(L.client)
								if(L.sounds==1)
									spawn()L<<'sounds/powerup.wav'
						usr.entime = 1
						usr.icon_state = "ssj"
						sleep(40)
						usr.icon_state = ""
						sleep(rand(1,1200))
						usr.entime = 0
						usr << "You begin to calm..."
					else
						usr << "You are strained (using Super Saiyan or Kaioken?)."
*/
obj
	SayajinTail
		icon='tail.dmi'
		verb
			Wrap()
				set category="Communication"
				usr <<"You wrap your tail"
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -='tail.dmi'
				usr.overlays -= /obj/tail
			Unwrap()
				set category="Communication"
				usr <<"You unwrap your tail"
				usr.overlays+='tail.dmi'
mob
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
						if(M.key!=usr.key)
							M << "<font color = green>You are blinded by [usr]'s Tayioken!"
							M.Blinded()

					sleep(rand(1,100))
					for(var/mob/M in world)
						M:sight = 0
					sleep(100)
					usr.tayio = 0
mob/proc/Blinded()
	src.sight = 1
	sleep(rand(1,40))
	src.sight=0
mob
	Samurai
		icon='samuraobj.dmi'
		icon_state="it"
		density=1

mob
	Absorb
		verb
			Absorb(mob/characters/M in oview(2))
				set category = "Fighting"
				if(usr.absorb == 1)
					usr << "You need to wait..."
				if(usr.absorb == null||usr.absorb == 0 && M.race!="" && M.race!=null&&M.powerlevel>1)
					if(usr.state == "Form Three")
						usr <<"You cant absorb in that stage"
					else
						view(6) << "<font color = green>[usr.name] is stealing energy"
						usr.absorb = 1
						if(usr.sounds==1)
							spawn()usr<<'sounds/regen.wav'
						for(var/mob/characters/L in oview(4))
							if(L.client)
								if(L.sounds==1)
									spawn()L<<'sounds/regen.wav'

						flick("absorb",usr)
						M << "<font color = green>[usr.name] is stealing your powerlevel!!!"
						usr<<"You absorb some of [M]'s powerlevel"
						absorba=usr.maxpowerlevel/rand(10,50)
						if(absorba>M.powerlevel)
							absorba=M.powerlevel
						M.powerlevel-=absorba
						usr.powerlevel+=absorba
						if(M.powerlevel<1)
							M.powerlevel=1
						M.KO()
						sleep(rand(50,200))
						usr.absorb = 0
mob
	BebiInfest
		verb
			Infest(mob/characters/M in oview(2))
				set category = "Fighting"
				if(M.client||!M.client)
					if(usr.infested==0)
						if(M.hp>=800 || M.ko==1)
							view(6) << "<font color = green>[usr.name] Infests [M]!!"
							M << "<font color = green>[usr.name] has Infested you!!!"
							usr<<"You infest [M]"
							if(M.race=="Saiya-jin"||M.race=="Halfbreed")
								usr.evolution=3
								usr.infested=1
								usr.verbs += /mob/Bebi/verb/BebiTransform
								usr.verbs += /mob/Bebi/verb/Revert
								usr.powerlevel= usr.maxpowerlevel
								usr.ssj=0
							else
								usr.infested=1

							usr.icon=M.icon
							usr.skincolor=M.skincolor
							usr.hairicon=M.hairicon
							usr.hair=M.hair
							usr.overlays+=usr.hairicon
							M.hp=150
							M.Die()
			UnInfest()
				set category = "Fighting"
				if(usr.infested==1)
					usr.evolution=2
					usr.infested=0
					usr.verbs -= /mob/Bebi/verb/BebiTransform
					usr.verbs -= /mob/Bebi/verb/Revert
					usr.icon='bebi2.dmi'
					usr.skincolor=0
					usr.overlays=0
					usr<<"You destroy your host"
	Assimilate
		verb
			Assimilate(mob/characters/M in oview(2))
				set category = "Fighting"
				if(usr.absorb == 1)
					usr << "You need to wait..."
				if(usr.absorb == null||usr.absorb == 0 && M.race!="" && M.race!=null)
					if(usr.state == "Form Three")
						usr <<"You cant assimilate in that stage"
					else
						if(M.hp>=800|| M.ko==1)
							view(6) << "<font color = green>[usr.name] assimilated [M]!!"
							usr.absorb = 1
							flick("assimilate",usr)
							M << "<font color = green>[usr.name] has assimilated you!!!"
							usr<<"You assimilate [M]"
							absorba=usr.maxpowerlevel/rand(3,8)
							M.powerlevel-=absorba
							M.Die()
							usr.powerlevel+=absorba
							usr.verbs += /mob/celltransform/verb/Transform
							sleep(rand(50,200))
							usr.absorb = 0


obj/Tran
	var
		thairicon
		ticon
		toverlay
		taddoverlay
		tunderlay
		prereq=0
		stagereq=""
		boost=1
		ts=0
		tdrain=0
		bebiicon=0
		instant=0
		tname=""
		tmajin=0
		taddelec
	Nevermind
		tname= "Nevermind"
	Mystic
		prereq=0
		instant=1
		boost=4.0
		tunderlay='mysticaura.dmi'
		taddoverlay='elec.dmi'
		tname = "Mystic"
	Majin
		prereq=0
		instant=1
		boost=4.0
		tunderlay='mysticaura.dmi'
		taddoverlay='redelec.dmi'
		tmajin=1
		tname = "Majin"
	Demon1
		prereq=300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname = "Unlock Inner Evil"

	Demon2
		prereq=1000000
		boost=3.5
		ticon='FATJanemba.dmi'
		tdrain=2
		tname="Fat Janemba"

	Demon3
		prereq=5000000
		boost=4.5
		ticon='Janemba.dmi'
		tdrain=2
		tname="Janemba"

	Demon4
		prereq=10000000
		boost=5.5
		ticon='Janemba.dmi'
		taddoverlay='redelec.dmi'
		tdrain=3
		tname="Super Demon Janemba"

	Cell1
		prereq=300000
		tdrain=0
		boost=2.5
		tname="Genetic Reconstruction"

	Cell2
		prereq=1000000
		tdrain=0
		boost=3.5
		ticon='biocell2.dmi'
		tname="Form 2"


	Cell3
		prereq=5000000
		tdrain=0
		boost=4.5
		ticon='biocell3.dmi'
		tname="Perfect"

	Cell4
		prereq=10000000
		tdrain=4
		boost=5.5
		taddoverlay='redelec.dmi'
		ticon='biocell3.dmi'
		tname="Ultra Perfect"

	Icer1
		prereq=300000
		tdrain=0
		boost=2.5
		ticon='ChangeForm2.dmi'
		tname="Form 2"

	Icer2
		prereq=1000000
		tdrain=0
		boost=3.5
		ticon='ChangeForm3.dmi'
		tname="Form 3"

	Icer3
		prereq=5000000
		tdrain=0
		boost=4.5
		ticon='ChangeForm4.dmi'
		tname="Form 4"

	Icer4
		prereq=10000000
		tdrain=0
		boost=5.5
		taddoverlay='elec.dmi'
		ticon='ChangeForm4.dmi'
		tname="Full Form 4"

	SNJ
		prereq= 300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek"
	SNJ2
		prereq= 1000000
		boost=3.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek 2"
	SNJ3
		prereq= 5000000
		boost=4.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Super Namek 3"
	SNJ4
		prereq= 10000000
		boost=5.5
		tunderlay='mysticaura.dmi'
		taddelec='elec.dmi'
		tdrain=2
		ticon='super-namek.dmi'
		tname="Legendary Super Namek"
	Android1
		prereq= 300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock System Resources 1"
	Android2
		prereq= 1000000
		boost=3.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock System Resources 2"
	Android3
		prereq= 5000000
		boost=4.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="100% Power Unlock"
	SuperAndroid
		prereq= 10000000
		boost=5.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Super Android"
	Human1
		prereq= 300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Unlock Restraints"
	Rage_Human2
		prereq= 1000000
		boost=3.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname="Rage"
	Spirit_Human2
		prereq= 1000000
		boost=3.5
		tdrain=0
		tname="Minds Eye"
	Human3
		prereq= 5000000
		boost=4.5
		taddelec='elec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=2
		tname = "Focus Power"
	Rage_Human4
		prereq= 10000000
		boost=5.5
		taddelec='redelec.dmi'
		tunderlay='mysticaura.dmi'
		tdrain=8
		tname = "Adrenaline Explosion"
	Spirit_Human4
		prereq= 10000000
		boost=5.5
		tdrain=0
		tname = "Mind Discipline Potential Awaken"
	SSJ1
		prereq=300000
		boost=2.5
		tunderlay='ssjaura.dmi'
		ts=1
		tdrain=2
		tname= "Super Saiyajin 1"
	USSJ
		prereq=600000
		boost=3.0
		tunderlay='ssjaura.dmi'
		ts=3
		bebiicon=2
		tdrain=4
		tname= "Ultra Super Saiyajin"
	SSJ2
		prereq=1000000
		boost=3.5
		tunderlay='ssjaura.dmi'
		taddelec='elec.dmi'
		ts=1
		tdrain=3
		tname= "Super Saiyajin 2"
	SSJ3
		prereq=5000000
		boost=4.5
		tunderlay='ssjaura.dmi'
		taddelec='Ssj3 electricity.dmi'
		tdrain=4
		tname= "Super Saiyajin 3"
	SSJ4
		toverlay='ssj4.dmi'
		taddelec='redelec.dmi'
		tunderlay='kaioaura.dmi'
		boost=5.5
		tdrain=6
		tname= "Super Saiyajin 4"
	LSSJ
		tdrain=1
		tname="Legendary Super Saiyajin"
		bebiicon=2
		ts=3
		tunderlay='ssjaura.dmi'
		boost=6.0
		instant=1
		prereq=3000000
	Bebi1
		prereq=300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		ts=2
		tdrain=2
		tname="Bebi Assimilation 10%"
	Bebi2
		prereq=1000000
		boost=3.5
		tunderlay='mysticaura.dmi'
		ts=2
		bebiicon=1
		tdrain=3
		tname="Bebi Assimilation 30%"
	Bebi3
		prereq=5000000
		boost=4.5
		tunderlay='mysticaura.dmi'
		toverlay='bebivest.dmi'
		ts=2
		bebiicon=1
		tdrain=4
		tname="Bebi Assimilation 60%"
	Bebi4
		thairicon='Bebi_hair.dmi'
		toverlay='bebigi.dmi'
		prereq=10000000
		boost=5.5
		tunderlay='mysticaura.dmi'
		bebiicon=1
		tdrain=5
		tname="Bebi Assimilation 100%"
/*
	buu1
		prereq=300000
		boost=2.5
		tunderlay='mysticaura.dmi'
		ts=2
		tdrain=2
		tname="Bebi Assimilation 10%"
	buu2
		prereq=1000000
		boost=3.5
		tunderlay='mysticaura.dmi'
		ts=2
		bebiicon=1
		tdrain=3
		tname="Bebi Assimilation 30%"
	buu3
		prereq=5000000
		boost=4.5
		tunderlay='mysticaura.dmi'
		toverlay='bebivest.dmi'
		ts=2
		bebiicon=1
		tdrain=4
		tname="Bebi Assimilation 60%"
	buu4
		thairicon='Bebi_hair.dmi'
		toverlay='bebigi.dmi'
		prereq=10000000
		boost=6.0
		tunderlay='mysticaura.dmi'
		bebiicon=1
		tdrain=5
		tname="Bebi Assimilation 100%"
*/

	verb
		Revert()
			set category = "Fighting"
			if(usr.ssj==1)
				if(usr.ooverlays)
					usr.overlays=0
					usr.overlays=usr.ooverlays.Copy(1,0)
					usr.ooverlays=0
				if(usr.backupicon)
					usr.icon=usr.backupicon
					usr.backupicon=0
				if(usr.ussjicon==1)
					var/newicon
					if(usr.skincolor=="black")
						newicon='male-black.dmi'
					if(usr.skincolor=="darkbrown")
						newicon='male-brown.dmi'
					if(usr.skincolor=="lightbrown")
						newicon='male-lightbrown.dmi'
					if(usr.skincolor=="white")
						newicon='male-white.dmi'
					if(usr.skincolor=="tan")
						newicon='male.dmi'
					usr.icon=newicon
					usr.ussjicon=0
				usr.overlays-=usr.hairicon2
				usr.overlays-=usr.tranover
				usr.drain=-1
				usr.hairicon2 = 0
				usr.state = "Normal"
				usr.overlays-='majin.dmi'
				usr.revertssj()
				if(usr.powerlevel <= usr.maxpowerlevel)
					usr.powerlevel += 0
				if(usr.powerlevel > usr.maxpowerlevel)
					usr.powerlevel = usr.maxpowerlevel
				usr.ssj= 2
				usr.basepowerlevel=usr.powerlevel
				sleep(100)
				usr.ssj = 0

		Transform()
			set category = "Fighting"
			if(usr.stamina <= 5)
				usr << "You feel too weak to."
			if(usr.stamina >= 6)
				if(usr.ssj==1&&usr.ozz==0)
					if(usr.ooverlays)
						usr.overlays=0
						usr.overlays=usr.ooverlays.Copy(1,0)
						usr.ooverlays=0
					if(usr.backupicon)
						usr.icon=usr.backupicon
						usr.backupicon=0
					usr.overlays-=usr.hairicon2
					usr.overlays-=usr.tranover
					usr.drain=-1
					usr.hairicon2 = 0
					usr.state = "Normal"
					usr.revertssj()
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.ssj = 0
					usr.basepowerlevel=usr.powerlevel
				if(usr.ssj == 0 && usr.kaioken == 0 && usr.transformations && usr.ozz==0)
					usr.ssj=2
					usr.underlays=0
					var/obj/Tran/ctran = input(usr,"Choose a Transformation","Transform")as obj in usr.transformations
					if(ctran)
						if(ctran.tname=="Nevermind")
							usr.ssj=0
							return
						if(!(ctran.stagereq!="" && usr.state!=ctran.stagereq))
							for(var/mob/characters/L in oview(4))
								if(L.client)
									if(L.sounds==1)
										spawn()L<<'sounds/powerup.wav'
							usr.underlays+=ctran.tunderlay
							var/topowerlevel = (usr.powerlevel * ctran.boost)
							var/gainedpowerlevel=(usr.powerlevel)
							loop
							usr.powerlevel+=topowerlevel/50
							gainedpowerlevel+=topowerlevel/50
							if((usr.maxpowerlevel/(ctran.prereq+1))<1.5)
								sleep(8)
							else if(ctran.instant==0)
								sleep(4)
							if(gainedpowerlevel<topowerlevel)
								goto loop
							usr.state=ctran.tname
							view(6)<<"[usr] Transformed to [ctran.tname]!!"

							if(ctran.tname== "Super Saiyajin 3")
								usr.loosehair()
								usr.hairicon2=ctran.GetSSJ3hair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.toverlay)
								var/list/temp[]=usr.overlays
								usr.ooverlays=temp.Copy(1,0)
								usr.overlays=0
								usr.overlays+=ctran.toverlay
							if(ctran.thairicon)
								usr.loosehair()
								usr.hairicon2=ctran.thairicon
								usr.overlays+=usr.hairicon2
							if(ctran.ticon)
								usr.backupicon=usr.icon
								usr.icon=ctran.ticon
							if(ctran.ts==1)
								usr.loosehair()
								usr.hairicon2=ctran.GetSSJhair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.ts==3)
								usr.loosehair()
								usr.hairicon2=ctran.GetUSSJhair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.ts==2)
								usr.loosehair()
								usr.hairicon2=ctran.GetBebihair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.bebiicon==1)
								usr.backupicon=usr.icon
								usr.icon= ctran.GetBebiIcon(usr)
							if(ctran.bebiicon==2)
								usr.backupicon=usr.icon
								usr.icon= ctran.GetUSSJIcon(usr)
							if(ctran.tname== "Super Saiyajin 4")
								usr.loosehair()
							if(ctran.taddoverlay)
								usr.tranover=ctran.taddoverlay
								usr.overlays+=usr.tranover
							if(ctran.tname== "Super Saiyajin 4")

								usr.hairicon2=ctran.GetSSJ4hair(usr)
								usr.overlays+=usr.hairicon2
							if(ctran.taddelec)
								usr.overlays+=ctran.taddelec
								usr.removeonlogin=ctran.taddelec
								spawn(300)
									usr.overlays-=ctran.taddelec
							var/masterpoints=usr.maxpowerlevel/(ctran.prereq+1)
							var/drain=0
							drain=ctran.tdrain
							if(masterpoints>1.2)
								drain-=1
							if(masterpoints>1.5)
								drain-=1
							if(masterpoints>1.8)
								drain-=1
							if(masterpoints>2)
								drain-=1
							if(masterpoints>2.3)
								drain-=1
							if(masterpoints>2.5)
								drain-=1
							if(masterpoints>2.8)
								drain-=1
							if(masterpoints>3)
								drain-=1
							if(drain<0)
								drain=0
							usr.drain=drain
							usr.ssj=1
							if(ctran.tmajin==1)
								MakeMajin(usr)
							usr.basepowerlevel=usr.powerlevel

						else
							usr<<"To use this Transformation you must first transform to [ctran.stagereq]"

obj/Tran
	proc
		MakeMajin(mob/us)
			var/hairiconx
			if(us.race=="Saiya-jin"||us.race=="Halfbreed")
				us.loosehair()
				us << "<b>You explode in rage as you go Super Saiya-jin 2."
				oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
				if (us.hair=="Spikey Long")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Spikey")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Gohan")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Trunks")
					hairiconx= 'ssj_trunks_hair.dmi'
				if (us.hair=="punk")
					hairiconx= 'hair_punk_ssj.dmi'
				if (us.hair=="kros_long")
					hairiconx= 'hair_kros_long_ssj.dmi'
				if (us.hair=="yajirobe")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="goten")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="radditz")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Future Trunks")
					hairiconx= 'ssj_futuretrunks_hair.dmi'
				if (us.hair=="Long")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Female")
					hairiconx= 'hair_dan_longssj.dmi'
				if (us.hair=="Short")
					hairiconx= 'hair_dan_ssjspikey.dmi'
				if (us.hair=="Vegeta")
					hairiconx = 'hair_dan_vegeta.dmi'
					hairiconx += rgb(180,180,80)
				if (us.hair=="VegetaGT")
					hairiconx = 'hair_dan_vegetagt.dmi'
					hairiconx += rgb(150,150,40)
				if (us.hair=="Goku")
					hairiconx= 'hair_ssj_goku.dmi'
				us.overlays-=us.hairicon
			var/majin='majin.dmi'
			us.tranover=hairiconx
			us.overlays+=majin
			us.overlays+=hairiconx
		GetUSSJIcon(mob/us)
			var/newicon=us.icon
			if(us.skincolor=="black")
				newicon='USupersayajin-black.dmi'
			if(us.skincolor=="darkbrown")
				newicon='USupersayajin-darkbrown.dmi'
			if(us.skincolor=="lightbrown")
				newicon='USupersayajin-lightbrown.dmi'
			if(us.skincolor=="white")
				newicon='USupersayajin-pale.dmi'
			if(us.skincolor=="tan")
				newicon='USupersayajin.dmi'
			us.ussjicon=1
			return newicon
		GetBebiIcon(mob/us)
			var/newicon=us.icon
			if(us.skincolor=="black")
				newicon='bebi-black.dmi'
			if(us.skincolor=="darkbrown")
				newicon='bebi-darkbrown.dmi'
			if(us.skincolor=="lightbrown")
				newicon='bebi-lightbrown.dmi'
			if(us.skincolor=="white")
				newicon='bebi-pale.dmi'
			if(us.skincolor=="tan")
				newicon='bebi.dmi'
			return newicon
		GetSSJ4hair(mob/us)
			var/hairovern
			if (us.hair=="Spikey")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="punk")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="kros_long")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="yajirobe")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="goten")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="radditz")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="Gohan")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Future Trunks")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Trunks")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Female")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Long")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Short")
				hairovern='ssj4 hair.dmi'
			if (us.hair=="Vegeta")
				hairovern='ssj4 vegeta.dmi'
			if (us.hair=="VegetaGT")
				hairovern='ssj4 vegeta.dmi'
			if (us.hair=="Goku")
				hairovern='hair_ssj4_goku.dmi'
			if (us.hair=="Spikey Long")
				hairovern='ssj4 hair.dmi'

			return hairovern
		GetSSJ3hair(mob/us)
			var/hairovern
			if (us.hair=="Spikey")
				hairovern='Ssj3 1.dmi'
			if (us.hair=="punk")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="kros_long")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="yajirobe")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="goten")
				hairovern='Ssj3 2.dmi'
			if (us.hair=="radditz")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="Gohan")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Future Trunks")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Trunks")
				hairovern='Ssj3 1.dmi'
			if (us.hair=="Female")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Long")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Short")
				hairovern='ssj3.dmi'
			if (us.hair=="Vegeta")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="VegetaGT")
				hairovern='Ssj3 3.dmi'
			if (us.hair=="Goku")
				hairovern='Ssj3 4.dmi'
			if (us.hair=="Spikey Long")
				hairovern='Ssj3 3.dmi'

			return hairovern
		GetSSJhair(mob/us)
			var/hairoverx
			if (us.hair=="Spikey Long")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Spikey")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Long")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Short")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Gohan")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Trunks")
				hairoverx= 'ssj_trunks_hair.dmi'
			if (us.hair=="punk")
				hairoverx= 'hair_punk_ssj.dmi'
			if (us.hair=="kros_long")
				hairoverx= 'hair_kros_long_ssj.dmi'
			if (us.hair=="yajirobe")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="goten")
				hairoverx= 'hair_dan_ssjspikey.dmi'
			if (us.hair=="Future Trunks")
				hairoverx= 'ssj_futuretrunks_hair.dmi'
			if (us.hair=="Female")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Vegeta")
				var/hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(180,180,80)
				hairoverx= hairover
			if (us.hair=="VegetaGT")
				var/hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(150,150,40)
				hairoverx= hairover
			if (us.hair=="Goku")
				hairoverx= 'hair_ssj_goku.dmi'
			if (us.hair=="Bald")
				hairoverx='Hair_Bald_Supersayajin.dmi'
			return hairoverx
		GetUSSJhair(mob/us)
			var/hairoverx
			if (us.hair=="Spikey Long")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Spikey")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Long")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Short")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Gohan")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Trunks")
				hairoverx= 'ssj_trunks_hair.dmi'
			if (us.hair=="punk")
				hairoverx= 'hair_punk_ssj.dmi'
			if (us.hair=="kros_long")
				hairoverx= 'hair_kros_long_ssj.dmi'
			if (us.hair=="yajirobe")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="goten")
				hairoverx= 'hair_ultrasuper_saiyajin.dmi'
			if (us.hair=="Future Trunks")
				hairoverx= 'ssj_futuretrunks_hair.dmi'
			if (us.hair=="Female")
				hairoverx= 'hair_dan_longssj.dmi'
			if (us.hair=="Vegeta")
				var/hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(180,180,80)
				hairoverx= hairover
			if (us.hair=="VegetaGT")
				var/hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(150,150,40)
				hairoverx= hairover
			if (us.hair=="Goku")
				hairoverx= 'hair_ssj_goku.dmi'
			if (us.hair=="Bald")
				hairoverx='Hair_Bald_Supersayajin.dmi'
			return hairoverx
		GetBebihair(mob/us)
			var/hairover
			if (us.hair=="Spikey")
				hairover = 'hair_dan_spikeyshort.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Spikey Long")
				hairover = 'hair_dan_spikey.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Female")
				hairover = 'fem-hair-long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="punk")
				hairover = 'hair_punk.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="kros_long")
				hairover = 'hair_kros_long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="yajirobe")
				hairover = 'hair_yajirobe.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="goten")
				hairover = 'hair_goten.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="radditz")
				hairover = 'hair_radditz.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Long")
				hairover = 'hair_dan_long.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Short")
				hairover = 'hair_dan_short.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Gohan")
				hairover = 'hair_Gohan.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Trunks")
				hairover = 'hair_trunks.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Future Trunks")
				hairover = 'Futuretrunkshair.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Vegeta")
				hairover = 'hair_dan_vegeta.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="VegetaGT")
				hairover = 'hair_dan_vegetagt.dmi'
				hairover += rgb(200,200,200)
			if (us.hair=="Goku")
				hairover = 'hair_dan_goku.dmi'
				hairover += rgb(200,200,200)
			return hairover
obj
	user
		icon = 'male.dmi'

obj
	porattaearings
		name = "Poratta Earrings"
		icon = 'poratta.dmi'
		verb
			Wear()
				set category = "Communication"
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
				set category = "Communication"
				sleep(1)
				if(src.worn == 1||usr.hasfused==1)
					usr << "Not while its being worn."
				if(src.worn == 0&&usr.hasfused==0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication"
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Fuse(mob/characters/M in oview(1))
				set category = "Fighting"
				if(usr.fused==0 && M.fused==0 && usr.ozz==0 && M.ozz==0)
					if(usr.hasfused==1||M.hasfused==1)
						usr<<"Cant fuse while in a fusion"
					else
						if(M.ozz==0)
							if(usr.ozz==1)
								usr<<"Cant fuse yet.."
							else
								var/inrange=0
								switch(input(M,"Would you like to fuse with [usr]?","Poratta Earings") in list("Yes","No"))
									if("Yes")
										for(var/mob/characters/X in oview(1))
											if(X==M)
												inrange=1
										if(inrange==1)
											if(usr.hasfused==0&&M.hasfused==0)
												if(usr.fused==0 && M.fused==0)
													usr.save()
													M.save()
													M.oldguild=M.guild
													usr.oldguild=usr.guild
													var/list/temp1[] = usr.overlays
													usr.ooverlays=temp1.Copy(1,0)
													usr.overlays=0
													var/list/temp2[] = M.overlays
													M.ooverlays=temp2.Copy(1,0)
													M.overlays=0
													if(usr.dead==1)
														usr.overlays+='halo.dmi'
													var/lead = copytext(usr.name,1,5)
													var/load = copytext(M.name,6)
													usr.overlays+=usr.hairicon
													var/hairoverone = 'hairstrip.dmi'
													hairoverone += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverone
													var/hairoverthree = 'hairstrip2.dmi'
													hairoverthree += rgb(M.rhair,M.ghair,M.bhair)
													usr.overlays+= hairoverthree
													view(6) << "<font face = arial><tt>[M] and [usr] are thrown together to make [lead][load]!!!"
													if(usr.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(usr.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(usr.customred,usr.customgreen,usr.customblue)
														usr.underlays += aura
													if(M.auratype==0)
														var/aura = 'whiteaura.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==1)
														var/aura = 'whiteaura2.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==2)
														var/aura = 'whiteaura3.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==3)
														var/aura = 'whiteaura4.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													if(M.auratype==4)
														var/aura = 'whiteaura6.dmi'
														aura += rgb(M.customred,M.customgreen,M.customblue)
														M.underlays += aura
													usr.oname=usr.name
													M.oname=M.name
													usr.overlays+='elec.dmi'
													usr.name = "<b>[lead][load]</b>"
													M.name = "<b>[lead][load]</b>"
													var/cap
													if(usr.maxpowerlevel>M.maxpowerlevel)
														cap=M.maxpowerlevel * 2
													else
														cap=usr.maxpowerlevel * 2
													usr.omaxpowerlevel=usr.maxpowerlevel
													M.omaxpowerlevel=M.maxpowerlevel
													usr.maxpowerlevel=cap
													M.maxpowerlevel=0
													M.powerlevel=0
													usr.powerlevel=usr.maxpowerlevel
													M.hasfused=1
													usr.hasfused=1
													usr.fused=1
													usr.porattafuse=1
													M.porattafuse=1
													M.fused=1
													M.invisibility=1
													M.follow=usr.name
													M.fusebitch=1
													usr.basepowerlevel=usr.powerlevel
													M.fusionfollow(usr)
										else
											usr<<"You need to be right next to [M]"




obj
	proc
		objfollow(mob/characters/M)
			src.loc = locate(M.x,M.y,M.z)
			sleep(2)
			spawn()src.objfollow(M)
mob
	proc
		fusionfollow(mob/characters/M)
			if(src.hasfused==1)
				src.loc = locate(M.x,M.y,M.z)
				src.ki=0
				src.stamina=0
				src.invisibility=1
				sleep(10)
				spawn()src.fusionfollow(M)
mob
	proc
		fusionfollow2()
			for(var/mob/characters/M in world)
				if(src.follow == M.name)
					src.loc = locate(M.x,M.y,M.z)
					src.ki=0
					src.stamina=0
					src.invisibility=1
					sleep(5)
					spawn()src.fusionfollow2()
				else
					..()



mob
	flerp
		name = "Freaky"
		maxpowerlevel = 75000
		npc=1
		icon = 'mobs.dmi'
		icon_state = "vegetto"



mob
	Mystic
		verb
			MysticTransform()
				set category = "Fighting"
				set name = "Mystic Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are transformed already."
					if(usr.ssj == 0 && usr.kaioken == 0 &&usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
						sleep(15)
						if(usr.ssj==0)
							if(usr.powerlevel < 2500000 && usr.ssj==0)
								usr << "<b>You seem too weak to."
								usr.ssj=0
							if(usr.powerlevel >= 2500000 && usr.ssj==0)
								usr.drain=0
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.ssj = 1
								usr << "<b>Your Aura Grows wildly."
								oview(6) << "<b>**<font color = white>[usr]'s inner potential starts to be unlocked.<font color = white>**"
								usr.underlays += 'mysticaura.dmi'
								usr.state = "Mystic"
								var/multiplier= 1
								if(usr.maxpowerlevel>450000)
									multiplier= 2.5
								if(usr.maxpowerlevel>750000)
									multiplier= 3
								if(usr.maxpowerlevel>1500000)
									multiplier= 3.5
								if(usr.maxpowerlevel>7500000)
									multiplier= 4.5
								if(usr.maxpowerlevel>1500000)
									multiplier= 5.5
								var/topowerlevel = (usr.powerlevel * multiplier)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								sleep(4)
								if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
									goto loop
								usr.basepowerlevel=usr.powerlevel

		verb
			MysticRevert()
				set category = "Fighting"
				set name = "Mystic Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent Mystic."
				if(usr.ssj == 1 && usr.ozz==0)
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'mysticaura.dmi'
					usr.underlays -= 'mysticaura.dmi'
					usr.underlays -= 'mysticaura.dmi'
					usr.overlays-='elec.dmi'
					usr.state = "Normal"
				//	usr.overlays-='hair_dan_spikeyshort.dmi'
				//	usr.overlays+=usr.hairicon
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
				//	usr.overlays-= usr.hairicon2
					usr.ssj=2
					sleep(50)
					usr.ssj = 0
					usr.basepowerlevel=usr.powerlevel
mob
	Majin
		verb
			MajinTransform()
				set category = "Fighting"
				set name = "Majin Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6 && usr.race!="Android"&&usr.race!="Bio-Android"&&usr.race!="Biological Android")
					if(usr.ssj == 1)
						usr << "You are transformed already."
					if(usr.ssj == 0 && usr.kaioken == 0)

						sleep(15)
						if(usr.ssj==0)

							if(usr.powerlevel < 2500000 && usr.ssj==0)
								usr << "<b>You seem too weak to."
								usr.ssj=0
							if(usr.powerlevel >= 2500000 && usr.ssj==0)
								if(usr.sounds==1)
									spawn()usr<<'sounds/powerup.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/powerup.wav'
								usr.ssj = 1
								usr.drain=0
								usr << "<b>You feel yourself fall into the darkness.."
								oview(6) << "<b>**<font color = white>[usr]'s hair begins to stand on end and sparks surround him.<font color = white>**"
								usr.underlays += 'mysticaura.dmi'
								usr.overlays+='redelec.dmi'
								usr.state = "Majin"
								var/topowerlevel = (usr.powerlevel * 4)
								var/gainedpowerlevel=(usr.powerlevel)
								loop
								usr.powerlevel+=topowerlevel/50
								gainedpowerlevel+=topowerlevel/50
								sleep(4)
								if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
									goto loop
								if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
									usr.loosehair()
									usr << "<b>You explode in rage as you go Super Saiya-jin 2."
									oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
									if (usr.hair=="Spikey Long")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Spikey")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Gohan")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Trunks")
										usr.overlays += 'ssj_trunks_hair.dmi'
									if (usr.hair=="punk")
										usr.overlays += 'hair_punk_ssj.dmi'
									if (usr.hair=="kros_long")
										usr.overlays += 'hair_kros_long_ssj.dmi'
									if (usr.hair=="yajirobe")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="goten")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="radditz")
										var/hairover = 'hair_radditz.dmi'
										hairover += rgb(160,160,20)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="Future Trunks")
										usr.overlays += 'ssj_futuretrunks_hair.dmi'
									if (usr.hair=="Long")
										var/hairover = 'hair_dan_long.dmi'
										hairover += rgb(160,160,50)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Female")
										var/hairover = 'hair_dan_long.dmi'
										hairover += rgb(160,160,50)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Short")
										usr.overlays += 'hair_dan_ssjspikey.dmi'
									if (usr.hair=="Vegeta")
										var/hairover = 'hair_dan_vegeta.dmi'
										hairover += rgb(180,180,80)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="VegetaGT")
										var/hairover = 'hair_dan_vegetagt.dmi'
										hairover += rgb(150,150,40)
										usr.hairicon2=hairover
										usr.overlays+= usr.hairicon2
									if (usr.hair=="Goku")
										usr.overlays += 'hair_ssj_goku.dmi'
									usr.overlays-=usr.hairicon
								usr.overlays+='majin.dmi'
								usr.basepowerlevel=usr.powerlevel
		verb
			MajinRevert()
				set category = "Fighting"
				set name = "Majin Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent Majin."
				if(usr.ssj == 1 && usr.ozz==0)
					usr << "<b>You begin to calm down...."
					usr.underlays =0
					usr.overlays-='redelec.dmi'
					usr.overlays-='majin.dmi'
					usr.state = "Normal"
					usr.overlays+=usr.hairicon
					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.overlays-= usr.hairicon2
					usr.ssj=2
					if(usr.race=="Saiya-jin"||usr.race=="Halfbreed")
						usr.overlays -= 'ssj4 hair.dmi'
						usr.overlays -= 'elec.dmi'
						usr.overlays-='ssj4.dmi'
						usr.overlays -= 'hair_dan_ssjspikey.dmi'
						usr.overlays -= 'ssj3.dmi'
						usr.overlays -= 'hair_dan_spikeyshort.dmi'
						usr.overlays -= 'hair_dan_long.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_vegeta_ssj.dmi'
						usr.overlays-= 'hair_dan_spikey.dmi'
						usr.overlays-= 'hair_dan_ssjspikey.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
						usr.overlays -= 'hair_dan_short.dmi'
						usr.overlays -= 'hair_dan_vegeta.dmi'
						usr.overlays-='hair_Gohan.dmi'
						usr.overlays-='hair_trunks.dmi'
						usr.overlays-='ssj_futuretrunks_hair.dmi'
						usr.overlays-='ussj_futuretrunks_hair.dmi'
						usr.overlays -='hair_dan_goku.dmi'
						usr.overlays -= 'hair_ssj_goku.dmi'
						usr.overlays -= 'hair_ssj3_goku.dmi'
						usr.overlays -= 'hair_ssj4_goku.dmi'
						usr.overlays -='Hair_Bald_Supersayajin.dmi'
						usr.overlays -='ssj_trunks_hair.dmi'
						usr.overlays-= 'Red Elec.dmi'
						usr.overlays -= 'Vssj4.dmi'
						usr.overlays -= '2ssj4.dmi'
						usr.overlays-= usr.hairicon2
					usr.overlays+=usr.hairicon
					usr.basepowerlevel=usr.powerlevel
					sleep(50)
					usr.ssj = 0


/*mob
	ssj
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent in SSJ."
				if(usr.ssj == 1&& usr.ozz==0)
					usr.drain=-1
					if(usr.state=="Ultra Super Saiya-jin")
						if(src.skincolor=="black")
							src.icon='male-black.dmi'
						if(src.skincolor=="darkbrown")
							src.icon='male-brown.dmi'
						if(src.skincolor=="lightbrown")
							src.icon='male-lightbrown.dmi'
						if(src.skincolor=="white")
							src.icon='male-white.dmi'
						if(src.skincolor=="tan")
							usr.icon='male.dmi'
						if(src.skincolor=="fwhite")
							src.icon = 'female-pale.dmi'
						if(src.skincolor=="ftan")
							src.icon = 'female.dmi'
						if(src.skincolor=="flightbrown")
							src.icon = 'female-lightbrown.dmi'
						if(src.skincolor=="fdarkbrown")
							src.icon = 'female-darkbrown.dmi'
						if(src.skincolor=="fblack")
							src.icon = 'female-black.dmi'
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays=0
					usr.overlays -= 'ssj4 hair.dmi'
					usr.overlays -= 'elec.dmi'
					usr.overlays-='ssj4.dmi'
					usr.overlays -= 'hair_dan_ssjspikey.dmi'
					usr.overlays -= 'ssj3.dmi'
					usr.overlays -= 'hair_dan_spikeyshort.dmi'
					usr.overlays -= 'hair_dan_long.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-='Ssj3 electricity.dmi'
					usr.overlays-='redelec.dmi'
					usr.overlays-='elec.dmi'
					usr.overlays-='Ssj3 1.dmi'
					usr.overlays-='Ssj3 2.dmi'
					usr.overlays-='Ssj3 3.dmi'
					usr.overlays-='Ssj3 4.dmi'
					usr.overlays-='ssj3.dmi'
					usr.overlays-= 'ssj4 hair.dmi'
					usr.overlays-= '2ssj4.dmi'
					usr.overlays-= 'ssj4 vegeta.dmi'
					usr.overlays-= 'hair_ssj4_goku.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_dan_spikey.dmi'
					usr.overlays-= 'hair_dan_ssjspikey.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays -= 'hair_dan_short.dmi'
					usr.overlays -= 'hair_dan_vegeta.dmi'
					usr.overlays-='hair_Gohan.dmi'
					usr.overlays-='hair_trunks.dmi'
					usr.overlays-='ssj_futuretrunks_hair.dmi'
					usr.overlays-='ussj_futuretrunks_hair.dmi'
					usr.overlays -='hair_dan_goku.dmi'
					usr.overlays -= 'hair_ssj_goku.dmi'
					usr.overlays -= 'hair_ssj3_goku.dmi'
					usr.overlays -= 'hair_ssj4_goku.dmi'
					usr.overlays -='Hair_Bald_Supersayajin.dmi'
					usr.overlays -='ssj_trunks_hair.dmi'
					usr.overlays-= 'Red Elec.dmi'
					usr.overlays -= 'Vssj4.dmi'
					usr.overlays -= '2ssj4.dmi'
					usr.overlays-= usr.hairicon2
					usr.state = "Normal"

					usr.revertssj()

					if(usr.powerlevel <= usr.maxpowerlevel)
						usr.powerlevel += 0
					if(usr.powerlevel > usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0
			Transform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.state!="Mystic"&&usr.state!="Majin")
						if(usr.ssj == 0|1 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj!=2)
								usr.ssj=2
								switch(input("What type of Super Saiyan do you wish to go?") in list("Super Saiyan","USSJ","Super Saiyan 2","Super Saiyan 3","Super Saiyan 4"))
									if("USSJ")
										if(usr.maxpowerlevel >= 600000 /*&& usr.ssj==0*/)

											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											if(usr.powerlevel<1000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel

												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"

												var/topowerlevel = (usr.powerlevel * 3)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s muscles bulge and his pupils disapear.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 3)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(4)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.powerlevel = round(usr.powerlevel)
											usr.loosehair()
											usr << "<b>You explode in rage as you go Ultra Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge and his pupils disapear.<font color = white>**"
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ussj_futuretrunks_hair.dmi'
											if (usr.hair=="Female")
												usr.overlays += 'hair_ultrasuper_saiyajin.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.overlays-=usr.hairicon


											usr.underlays += 'ssjaura.dmi'
											if(usr.skincolor=="black")
												usr.icon='USupersayajin-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='USupersayajin-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='USupersayajin-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='USupersayajin-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='USupersayajin.dmi'

											usr.state = "Ultra Super Saiya-jin"

											usr.stamina-=50
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to go Ultra Super Saiyan."
										end
									if("Super Saiyan")
										if(usr.maxpowerlevel >= 300000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<700000)

												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"

												var/topowerlevel = (usr.powerlevel * 2.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else

												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s Hair stands on end...<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 2.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(4)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/300000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage and you go Super Saiya-jin."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												usr.overlays += 'hair_punk_ssj.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_kros_long_ssj.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj_futuretrunks_hair.dmi'
											if (usr.hair=="Female")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											if (usr.hair=="Bald")
												usr.overlays +='Hair_Bald_Supersayajin.dmi'
											usr.overlays-=usr.hairicon


											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.powerlevel = round(usr.powerlevel)
										else
											usr << "<b>You feel too weak to go Super Saiyan."
										end
									if("Super Saiyan 2")
										if(usr.maxpowerlevel >= 1000000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											if(usr.powerlevel<700000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly<font color = white>**"
												oview(6) << "<b>**<font color = red>sparks of power surround [usr]<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 3.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(12)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s Hair stands on end and sparks surround him.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 3.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/1000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage as you go Super Saiya-jin 2."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end and spike up as electricity flows around him and a golden aura surrounds him.<font color = white>**"
											if (usr.hair=="Spikey Long")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Gohan")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Trunks")
												usr.overlays += 'ssj_trunks_hair.dmi'
											if (usr.hair=="punk")
												usr.overlays += 'hair_punk_ssj.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += 'hair_kros_long_ssj.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="goten")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(160,160,20)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj_futuretrunks_hair.dmi'
											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Female")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(160,160,50)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Short")
												usr.overlays += 'hair_dan_ssjspikey.dmi'
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(180,180,80)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(150,150,40)
												usr.hairicon2=hairover
												usr.overlays+= usr.hairicon2
											if (usr.hair=="Goku")
												usr.overlays += 'hair_ssj_goku.dmi'
											usr.overlays += 'elec.dmi'
											spawn(300)
												usr.overlays-='elec.dmi'
											usr.overlays-=usr.hairicon
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 2"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 2."
										end
									if("Super Saiyan 3")
										if(usr.maxpowerlevel >= 5000000 /*&& usr.ssj==0*/)
											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<20000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to stand on end as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and his eyebrows dispatch.<font color = white>**"
												oview(6) << "<b>**<font color = red>Hair grows down to the floor.<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 4.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(15)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair grows long as a golden aura surrounds him.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s eyebrows dispatch.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 4.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(8)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/5000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=1
											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 3."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as his eyebrows begin to dispatch.<font color = white>**"
											if (usr.hair=="Spikey")
												usr.overlays+='Ssj3 1.dmi'
											if (usr.hair=="punk")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="kros_long")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="goten")
												usr.overlays+='Ssj3 2.dmi'
											if (usr.hair=="radditz")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="Gohan")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Future Trunks")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Trunks")
												usr.overlays+='Ssj3 1.dmi'
											if (usr.hair=="Female")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Long")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Short")
												usr.overlays+='ssj3.dmi'
											if (usr.hair=="Vegeta")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="VegetaGT")
												usr.overlays+='Ssj3 3.dmi'
											if (usr.hair=="Goku")
												usr.overlays+='Ssj3 4.dmi'
											if (usr.hair=="Spikey Long")
												usr.overlays+='Ssj3 3.dmi'

											usr.underlays += 'ssjaura.dmi'
											usr.overlays+= 'Ssj3 electricity.dmi'
											spawn(300)
												usr.overlays-='Ssj3 electricity.dmi'
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.state = "Super Saiya-jin 3"
											usr.overlays-=usr.hairicon



											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 3."
										end
									if("Super Saiyan 4")
										if(usr.maxpowerlevel >=10000000 /*&& usr.ssj==0*/)

											usr.underlays=0
											usr.underlays += 'ssjaura.dmi'
											usr.ssj = 2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.powerlevel<50000000)
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn black and [usr]'s muscles bulge.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s veins pop out of his head.....<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and red chesthair apears.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr] power increases greatly!.<font color = white>**"


												var/topowerlevel = (usr.powerlevel * 5.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(20)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											else
												if(usr.powerlevel>usr.maxpowerlevel)
													usr.powerlevel=usr.maxpowerlevel
												oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn black and [usr]'s muscles bulge.<font color = white>**"
												oview(6) << "<b>**<font color = red>[usr]'s power grows wildly,and red chesthair apears.<font color = white>**"
												var/topowerlevel = (usr.powerlevel * 5.5)
												var/gainedpowerlevel=(usr.powerlevel)
												loop
												usr.powerlevel+=topowerlevel/50
												gainedpowerlevel+=topowerlevel/50

												sleep(12)
												if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
													goto loop
											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1


											usr.drain=drain
											if(usr.ssj==0)
												goto end
											usr.loosehair()
											usr.overlays=0
											usr.overlays+= 'redelec.dmi'
											spawn(300)
												usr.overlays-='redelec.dmi'
											usr << "<b>You explode in rage as you begin to go Super Saiya-jin 4."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to spike backwards, as he grows red hair on his chest.<font color = white>**"
											usr.overlays+='ssj4.dmi'
											if (usr.hair=="Spikey")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2
											if (usr.hair=="punk")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="kros_long")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="yajirobe")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="goten")
												usr.overlays += '2ssj4.dmi'
											if (usr.hair=="radditz")
												usr.overlays += 'ssj4 hair.dmi'


											if (usr.hair=="Gohan")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Future Trunks")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'Futuretrunkshair.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Trunks")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_spikeyshort.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Female")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_long.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2


											if (usr.hair=="Long")
												usr.overlays += '2ssj4.dmi'
												var/hairover = 'hair_dan_long.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2

											if (usr.hair=="Short")
												usr.overlays += 'ssj4 hair.dmi'
												var/hairover = 'hair_dan_short.dmi'
												usr.hairicon2=hairover

												usr.overlays+= usr.hairicon2


											if (usr.hair=="Vegeta")
												usr.hairicon2 = 'ssj4 vegeta.dmi'
												usr.overlays+= usr.hairicon2
											if (usr.hair=="VegetaGT")
												usr.hairicon2 = 'ssj4 vegeta.dmi'
												usr.overlays+= usr.hairicon2

											if (usr.hair=="Goku")
												usr.hairicon2='2ssj4.dmi'
												usr.overlays += usr.hairicon2
											if (usr.hair=="Spikey Long")

												usr.overlays +='hair_ssj4_goku.dmi'
											usr.underlays += 'ssjaura.dmi'
											usr.state = "Super Saiya-jin 4"
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
											usr.overlays-=usr.hairicon
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to go Super Saiyan 4."
										end
					else
						usr << "You are transformed already"*/

mob
	SuperNamek
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.underlays=0
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			SN()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								usr.drain=0
								switch(input("What type of Transformation do you wish to go?") in list("Super Namek","Super Namek 2","Ultra Super Namek","Legendary Super Namek"))
									if("Super Namek")
										if(usr.powerlevel >= 200000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a super namek**.<font color = white>**"

											usr.state = "Super Namek"
											usr.icon='super-namek.dmi'
											var/topowerlevel = (usr.powerlevel * 2.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(4)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to transform."
									if("Super Namek 2")
										if(usr.powerlevel >= 800000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a super namek 2**.<font color = white>**"

											usr.state = "Super Namek 2"
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 3.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(8)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."
									if("Ultra Super Namek")
										if(usr.powerlevel >= 3500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s eyes begin to turn red.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge, and vains pop out of [usr]'s head.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a Ultra super namek**.<font color = white>**"

											usr.state = "Ultra Super Namek"
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 4.2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(12)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."
									if("Legendary Super Namek")
										if(usr.powerlevel >= 7000000 && usr.ssj==0)

											usr.drain=2
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils disapear.<font color = white>**"

											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] becomes a legendary super namek**.<font color = white>**"

											usr.state = "Legendary Super Namek"
											usr.overlays+='elec.dmi'
											usr.icon='super-namek.dmi'
											usr.ssj = 1
											var/topowerlevel = (usr.powerlevel * 5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50
											usr.basepowerlevel=usr.powerlevel
											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

										else
											usr << "<b>You feel too weak to transform."

mob
	Unlockpower
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.underlays=0
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			Unlockpotential()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								usr.drain=0
								switch(input("What type of Transformation do you wish to go?") in list("Unlock Potential","Rage","Focus Power","Super"))
									if("Unlock Potential")
										if(usr.powerlevel >= 100000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr.ssj = 1
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils begin to dialate.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr]'s potential is unlocked**.<font color = white>**"

											usr.state = "Potential Unlocked"
											var/topowerlevel = (usr.powerlevel * 2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(3)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Rage")
										if(usr.powerlevel >= 500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] goes into a rage!**.<font color = white>**"

											usr.state = "Rage"
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(6)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Focus Power")
										if(usr.powerlevel >= 2500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] focus' his power!**.<font color = white>**"

											usr.state = "Focused"
											var/topowerlevel = (usr.powerlevel * 4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Super")
										if(usr.powerlevel >= 7500000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr.overlays+='elec.dmi'

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											if(usr.race=="Human")
												oview(6) << "<b>**<font color = red>[usr] becomes Super**.<font color = white>**"
											else
												oview(6) << "<b>**<font color = red>[usr] Transforms to his super form.**.<font color = white>**"
											usr.state = "Super"
											var/topowerlevel = (usr.powerlevel * 4.4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."

mob
	Demontrans
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr << "<b>You begin to calm down...."
					usr.state = "Normal"
					usr.overlays-='elec.dmi'
					usr.overlays-='elec.dmi'
					usr.underlays=0
					usr.icon='maledemon.dmi'
					usr.overlays+=usr.hairicon
					if(usr.powerlevel>usr.maxpowerlevel)
						usr.powerlevel=usr.maxpowerlevel
					usr.ssj= 2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0

			DemonTransform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.ssj == 1)
						usr << "You are in Transformed already."
					else
						if(usr.ssj == 0 && usr.kaioken == 0)
							sleep(5)
							if(usr.ssj==0)
								switch(input("What type of Transformation do you wish to go?") in list("Unlock Hate","Fat Janemba","Janemba","Super Janemba"))
									if("Unlock Hate")
										if(usr.powerlevel >= 100000 && usr.ssj==0)
											usr.ssj = 1
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s pupils begin to dialate.<font color = white>**"
											oview(6) << "<b>**<font color = red>a huge Aura consumes [usr], and [usr] ulocks his inner evil**.<font color = white>**"

											usr.state = "Potential Unlocked"
											var/topowerlevel = (usr.powerlevel * 2)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(3)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

										else
											usr << "<b>You feel too weak to transform."
									if("Fat Janemba")
										if(usr.powerlevel >= 500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] becomes incredibly large!**.<font color = white>**"

											usr.state = "Rage"
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1


											usr.overlays-=usr.hairicon

											usr.icon='FATJanemba.dmi'
											usr.basepowerlevel=usr.powerlevel
										else
											usr << "<b>You feel too weak to transform."

									if("Janemba")
										if(usr.powerlevel >= 2500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr] colapses into himself.<font color = white>**"
											oview(6) << "<b>**<font color = red>[usr] shrinks and turns red**.<font color = white>**"

											usr.state = "Focused"
											var/topowerlevel = (usr.powerlevel * 4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(10)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1

											usr.overlays-=usr.hairicon
											flick("transform",usr)
											usr.icon='Janemba.dmi'
											usr.basepowerlevel=usr.powerlevel
										else
											usr << "<b>You feel too weak to transform."
									if("Super Janemba")
										if(usr.powerlevel >= 7500000 && usr.ssj==0)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 1
											if(usr.auratype==0)
												var/aura = 'whiteaura.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==1)
												var/aura = 'whiteaura2.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==2)
												var/aura = 'whiteaura3.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==3)
												var/aura = 'whiteaura4.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											if(usr.auratype==4)
												var/aura = 'whiteaura6.dmi'
												aura += rgb(usr.customred,usr.customgreen,usr.customblue)
												usr.underlays += aura
											usr.overlays+='elec.dmi'

											usr << "<b>You feel yourself transform."
											oview(6) << "<b>**<font color = red>[usr]'s muscles bulge.<font color = white>**"
											if(usr.race=="Human")
												oview(6) << "<b>**<font color = red>[usr] Focuses, and unlocks an incredible ammount of power**.<font color = white>**"
											else
												oview(6) << "<b>**<font color = red>[usr] Transforms to his super form.**.<font color = white>**"
											usr.state = "Super"
											var/topowerlevel = (usr.powerlevel * 4.4)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==1)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											usr.ssj = 1
											usr.basepowerlevel=usr.powerlevel

											usr.overlays-=usr.hairicon
											usr.icon='Janemba.dmi'
										else
											usr << "<b>You feel too weak to transform."

mob
	Bebi
		verb
			Revert()
				set category = "Fighting"
				set name = "Revert"
				if(usr.ssj == 0)
					usr << "<b>You arent transformed."
				if(usr.ssj == 1)
					usr.drain=-1
					if(src.skincolor=="black")
						src.icon='male-black.dmi'
					if(src.skincolor=="darkbrown")
						src.icon='male-brown.dmi'
					if(src.skincolor=="lightbrown")
						src.icon='male-lightbrown.dmi'
					if(src.skincolor=="white")
						src.icon='male-white.dmi'
					if(src.skincolor=="tan")
						usr.icon='male.dmi'
					if(src.skincolor=="fwhite")
						src.icon = 'female-pale.dmi'
					if(src.skincolor=="ftan")
						src.icon = 'female.dmi'
					if(src.skincolor=="flightbrown")
						src.icon = 'female-lightbrown.dmi'
					if(src.skincolor=="fdarkbrown")
						src.icon = 'female-darkbrown.dmi'
					if(src.skincolor=="fblack")
						src.icon = 'female-black.dmi'
					usr << "<b>You begin to calm down...."
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.underlays -= 'ssjaura.dmi'
					usr.overlays -= 'ssj4 hair.dmi'
					usr.underlays=0
					usr.overlays-=usr.hairicon2
					usr.overlays -= 'elec.dmi'
					usr.overlays-='ssj4.dmi'
					usr.overlays -= 'hair_dan_ssjspikey.dmi'
					usr.overlays -= 'ssj3.dmi'
					usr.overlays -= 'hair_dan_spikeyshort.dmi'
					usr.overlays -= 'hair_dan_long.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays-= 'hair_vegeta_ssj.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebi_hair.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebivest.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays -='Bebigi.dmi'
					usr.overlays-= 'hair_dan_spikey.dmi'
					usr.overlays-= 'hair_dan_ssjspikey.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays-= 'hair_ultrasuper_saiyajin.dmi'
					usr.overlays -= 'hair_dan_short.dmi'
					usr.overlays -= 'hair_dan_vegeta.dmi'
					usr.overlays-='hair_Gohan.dmi'
					usr.overlays-='hair_trunks.dmi'
					usr.overlays-= usr.hairicon2

					usr.overlays-= 'Bebi_hair.dmi'
					usr.overlays -='hair_dan_goku.dmi'
					usr.overlays -= 'hair_ssj_goku.dmi'
					usr.overlays -= 'hair_ssj3_goku.dmi'
					usr.overlays -= 'hair_ssj4_goku.dmi'
					usr.overlays -='Hair_Bald_Supersayajin.dmi'
					usr.state = "Normal"
					usr.revertssj()
					usr.ssj=2
					usr.basepowerlevel=usr.powerlevel
					sleep(100)
					usr.ssj = 0
			BebiTransform()
				set category = "Fighting"
				set name = "Transform"
				if(usr.stamina <= 5)
					usr << "You feel too weak to."
				if(usr.stamina >= 6)
					if(usr.state!="Mystic"&&usr.state!="Majin")
						if(/*usr.ssj == 0 && */usr.kaioken == 0)
							sleep(5)
							if(usr.ssj!=2)
								usr.ssj = 2
								switch(input("What type of Transformation do you wish to go?") in list("Bebi Form 1","Bebi Form 2","Bebi Form 3","Super Bebi"))
									if("Bebi Form 1")
										if(usr.maxpowerlevel >= 300000/* && usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.overlays-=usr.hairicon
											usr.loosehair()
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											usr.underlays += 'mysticaura.dmi'

											usr.state = "Bebi Form 1"
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel=usr.maxpowerlevel
											var/topowerlevel = (usr.powerlevel * 3)
											var/gainedpowerlevel=(usr.powerlevel)

											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(5)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											var/masterpoints=usr.maxpowerlevel/300000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1


										else
											usr << "<b>You feel too weak to transform."
									if("Bebi Form 2")
										if(usr.maxpowerlevel >= 1000000/* && usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'

											usr.loosehair()
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"

											usr.overlays-=usr.hairicon
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'
										//	usr.icon='bebi.dmi'

											usr.underlays += 'mysticaura.dmi'
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel=usr.maxpowerlevel

											usr.state = "Bebi Form 2"
											var/topowerlevel = (usr.powerlevel * 3.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(8)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)
											var/masterpoints=usr.maxpowerlevel/1000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=2
											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1


										else
											usr << "<b>You feel too weak to transform."
									if("Bebi Form 3")
										if(usr.maxpowerlevel >= 5000000/*&& usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 2
											usr << "<b>You explode in rage as you transform."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											usr.loosehair()
											usr.overlays-=usr.hairicon
											if (usr.hair=="Spikey")
												var/hairover = 'hair_dan_spikeyshort.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Spikey Long")
												var/hairover = 'hair_dan_spikey.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="punk")
												var/hairover = 'hair_punk.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="kros_long")
												var/hairover = 'hair_kros_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="yajirobe")
												var/hairover = 'hair_yajirobe.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="goten")
												var/hairover = 'hair_goten.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="radditz")
												var/hairover = 'hair_radditz.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if (usr.hair=="Long")
												var/hairover = 'hair_dan_long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Female")
												var/hairover = 'fem-hair-long.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Short")
												var/hairover = 'hair_dan_short.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Gohan")
												var/hairover = 'hair_Gohan.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Trunks")
												var/hairover = 'hair_trunks.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Future Trunks")
												var/hairover = 'Futuretrunkshair.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Vegeta")
												var/hairover = 'hair_dan_vegeta.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="VegetaGT")
												var/hairover = 'hair_dan_vegetagt.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2
											if (usr.hair=="Goku")
												var/hairover = 'hair_dan_goku.dmi'
												hairover += rgb(200,200,200)
												usr.hairicon2=hairover
												usr.overlays+=usr.hairicon2

											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel = usr.maxpowerlevel
											usr.underlays += 'mysticaura.dmi'
											usr.overlays+='bebivest.dmi'
											usr.state = "Bebi Form 3"
											var/topowerlevel = (usr.powerlevel * 4.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(12)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

											var/masterpoints=usr.maxpowerlevel/5000000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=2
											if(masterpoints>2)
												drain-=1

											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1

										else
											usr << "<b>You feel too weak to transform."
									if("Super Bebi")
										if(usr.maxpowerlevel >= 10000000 /*&& usr.ssj==0*/)
											if(usr.sounds==1)
												spawn()usr<<'sounds/powerup.wav'
											for(var/mob/characters/L in oview(4))
												if(L.client)
													if(L.sounds==1)
														spawn()L<<'sounds/powerup.wav'
											usr.ssj = 2
											usr.loosehair()
											usr << "<b>You explode in rage as you Super Bebi."
											oview(6) << "<b>**<font color = red>[usr]'s hair begins to turn white.<font color = white>**"
											usr.overlays -= 'hair_dan_spikeyshort.dmi'
											usr.overlays -= 'hair_dan_long.dmi'
											usr.overlays -= 'hair_dan_short.dmi'
											usr.overlays -= 'hair_dan_vegeta.dmi'
											usr.overlays -= 'hair_dan_goku.dmi'
											usr.overlays -= 'hair_dan_spikey.dmi'
											usr.overlays-=usr.hairicon

											usr.overlays+= 'Bebi_hair.dmi'

											if(usr.skincolor=="black")
												usr.icon='bebi-black.dmi'
											if(usr.skincolor=="darkbrown")
												usr.icon='bebi-darkbrown.dmi'
											if(usr.skincolor=="lightbrown")
												usr.icon='bebi-lightbrown.dmi'
											if(usr.skincolor=="white")
												usr.icon='bebi-pale.dmi'
											if(usr.skincolor=="tan")
												usr.icon='bebi.dmi'

											usr.underlays += 'mysticaura.dmi'
											usr.overlays+='bebigi.dmi'
											usr.state = "Super Bebi"
											if(usr.powerlevel>usr.maxpowerlevel)
												usr.powerlevel = usr.maxpowerlevel
											var/topowerlevel = (usr.powerlevel * 5.5)
											var/gainedpowerlevel=(usr.powerlevel)
											loop
											usr.powerlevel+=topowerlevel/50
											gainedpowerlevel+=topowerlevel/50

											sleep(15)
											if(gainedpowerlevel<topowerlevel&&usr.ssj==2)
												goto loop
											usr.powerlevel = round(usr.powerlevel)

											var/masterpoints=usr.maxpowerlevel/600000
											var/drain=0
											drain=4
											if(masterpoints>1.5)
												drain-=1
											if(masterpoints>2)
												drain-=1


											usr.drain=drain
											usr.basepowerlevel=usr.powerlevel
											sleep(6)
											usr.ssj = 1
										else
											usr << "<b>You feel too weak to transform."
					else
						usr << "You are Transformed already."
	proc
		revertfuse()

			src.ssj = 0


			src.overlays+=src.hairicon


mob
	proc
		revertssj()
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.overlays -= 'ssj4 hair.dmi'
			src.overlays -= 'elec.dmi'
			src.overlays-='ssj4.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'ssj3.dmi'
			src.overlays-= 'hair_vegeta_ssj.dmi'
			src.overlays-= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_dan_spikeyshort.dmi'
			src.overlays -= 'hair_dan_long.dmi'
			src.overlays -= 'hair_dan_short.dmi'
			src.overlays -= 'hair_dan_vegeta.dmi'
			src.overlays-='hair_Gohan.dmi'
			src.overlays-='hair_trunks.dmi'
			src.overlays -='hair_dan_goku.dmi'
			src.overlays -='hair_dan_spikey.dmi'
			src.overlays -='hair_dan_ssjspikey.dmi'
			src.overlays+=src.hairicon
			src.overlays -= 'hair_ssj_goku.dmi'
			src.overlays -= 'hair_ssj3_goku.dmi'
			src.overlays -= 'hair_ssj4_goku.dmi'
			src.overlays -='Hair_Bald_Supersayajin.dmi'
			src.state = "Normal"

			src.ssj = 0


			if(src.powerlevel <= src.maxpowerlevel)
				src.powerlevel += 0
			if(src.powerlevel > src.maxpowerlevel)
				src.powerlevel = src.maxpowerlevel
mob
	proc
		refreshplayer()
			if(src.entime==1)
				src.entime = 0
				src << "You begin to calm..."

mob
	proc
		kaiokenstrain()
			if(src.kaioken == 1)
				sleep(60)
				src.stamina -= (rand(4,5))
				if(src.stamina <= 0)
					usr << "<b>You feel the strain of Kaioken."
					src.stamina = 0
					if(src.powerlevel>src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					src.underlays -= 'kaioaura.dmi'
					src.kaioken = 0
					src.KO()
				if(src.stamina >= 1)
					src.kaiokenstrain()

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
				set category = "Communication"
				if(usr.tapion==0&&usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
				else
					usr<<"Not while you are playing it!"
			Get()
				set category = "Communication"
				set src in oview(1)
				usr.tapion = 0
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Play()
				set category = "Communication"
				if(usr.tapion == 1)
					usr << "<b>But you feel soothed already..."
				if(usr.tapion == 0)
					usr.icon_state = "play"
					usr.tapion = 1
					usr.underlays += /obj/whiteaura
					spawn()usr << 'tapion.mid'
					usr.move = 1
					for(var/mob/M in view(6))
						if(M.client)
							spawn()
								M << "<b><font color = silver><font size = 1>You feel a chill go down your spine as the calming melody of Tapion is played by [usr]."
								M << 'tapion.mid'
								M.powerlevel = round(M.powerlevel)
								sleep(100)
								M << "<b>The melody drives into your heart. It fills your body with good."
								sleep(1020)
								M << "<b>As the melody stops, you feel your body reguivinate."
								M.stamina = 100
								M.hp=150
								M.icon_state = ""
								M.tapion = 0

obj
	var
		name1
		ammount

obj
	senzu
		icon = 'turfs.dmi'
		icon_state = "senzu"
		name = "Senzu Bean"
		name1="Senzu Bean"
		ammount=1
		New()
			spawn()
				src.CheckAmount()
		proc
			CheckAmount()
				src.name= "[name1] ([src.ammount])"
				if(src.ammount<=0)
					del(src)
				if(src.ammount>10000)
					src.ammount=10000
		verb
			Get()
				set category = "Communication"
				set src in oview(1)
				var/counter=0
				for(var/obj/senzu/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/senzu/O in usr.contents)
						O.ammount+=src.ammount
						O.name= "[O.name1] ([O.ammount])"
						del(src)
			Eat()
				set category = "Communication"
				if(src.ammount>=1&&usr.senzud==0)
					usr.senzud=1
					spawn(200)usr.senzud=0
					src.ammount--
					usr.powerlevel = usr.maxpowerlevel
					usr.stamina = 150
					usr.hp = 0
					usr << "<b>You feel better as you eat a Senzu Bean."
					src.CheckAmount()

obj
	ray
		icon = 'ray.dmi'
		layer = MOB_LAYER + 99999999999999999999





obj
	wover
		icon = 'turfs.dmi'
		icon_state = "wover"
		density = 0
		layer = MOB_LAYER + 99999

obj
	Ciasstatue
		icon = '0Ciasstatue.dmi'
		density = 1
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
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 8*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 2*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 8*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 2*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 9*3
								usr.stamina-=1
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining1000
		icon = 'weight-objs.dmi'
		icon_state = "w1000"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=10000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar1000"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 4*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 4*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 15*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 11*3
								usr.stamina-=1
							src.lift = 0
							usr.move = 1
							src.icon_state = "w1000"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining10k
		icon = 'weight-objs.dmi'
		icon_state = "w10k"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=100000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar10k"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 28*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 10*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 28*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 10*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 78*3
								usr.stamina-=2
							else
								usr.maxpowerlevel += 58*3
								usr.stamina-=2
							src.lift = 0
							usr.move = 1
							src.icon_state = "w10k"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining100k
		icon = 'weight-objs.dmi'
		icon_state = "w100k"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=1000000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar100k"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 85*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 61*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 85*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 61*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 185*3
								usr.stamina-=3
							else
								usr.maxpowerlevel += 65*3
								usr.stamina-=3
							src.lift = 0
							usr.move = 1
							src.icon_state = "w100k"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."

obj
	WeightTraining1M
		icon = 'weight-objs.dmi'
		icon_state = "w1M"
		lift = 0
		layer = MOB_LAYER + 1
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(src.lift == 0&&usr.afk==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=10000000)
						if(usr.flight == 1)
							usr << "Not while flying."
						if(usr.flight == 0 && usr.resting==0)
							usr.stamina -= 2
							usr.move = 0
							src.lift = 1
							src.icon_state = "wbar1M"
							usr.icon_state = "weight-lifting"
							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 205*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 170*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 205*3
								usr.stamina-=1
							else
								usr.maxpowerlevel += 178*3

							sleep(10)
							usr.random = rand(1,5)
							if(usr.random == 5)
								usr.maxpowerlevel += 200*3
								usr.stamina-=4
							else
								usr.maxpowerlevel += 490*3
								usr.stamina-=3
							src.lift = 0
							usr.move = 1
							src.icon_state = "w1M"
							usr.icon_state = ""
					if(usr.stamina <= 4)
						usr << "You feel to weak too."



obj
	PBag
		icon = 'weight-objs.dmi'
		icon_state = "pbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)

					if(usr.stamina >= 5 && usr.maxpowerlevel>=50000&&usr.afk==0)

						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("pbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=75000)
										usr.maxpowerlevel += 7*3
									if(usr.maxpowerlevel<=250000&&usr.maxpowerlevel>75000)
										usr.maxpowerlevel += 12*3
									if(usr.maxpowerlevel<=500000&&usr.maxpowerlevel>250000)
										usr.maxpowerlevel += 15*3
									if(usr.maxpowerlevel>500000)
										usr.maxpowerlevel += 18*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=75000)
										usr.maxpowerlevel += 11*3
									if(usr.maxpowerlevel<=250000&&usr.maxpowerlevel>75000)
										usr.maxpowerlevel += 14*3
									if(usr.maxpowerlevel<=500000&&usr.maxpowerlevel>250000)
										usr.maxpowerlevel += 18*3
									if(usr.maxpowerlevel>500000)
										usr.maxpowerlevel += 22*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."
obj
	SpeedBag
		icon = 'weight-objs.dmi'
		icon_state = "speed"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("speedhit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=2000)
										usr.maxpowerlevel += 1*3
									if(usr.maxpowerlevel<=10000&&usr.maxpowerlevel>2000)
										usr.maxpowerlevel += 2*3
									if(usr.maxpowerlevel<=30000&&usr.maxpowerlevel>10000)
										usr.maxpowerlevel += 4*3
									if(usr.maxpowerlevel>30000)
										usr.maxpowerlevel += 7*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=2000)
										usr.maxpowerlevel += 2*3
									if(usr.maxpowerlevel<=10000&&usr.maxpowerlevel>2000)
										usr.maxpowerlevel += 3*3
									if(usr.maxpowerlevel<=30000&&usr.maxpowerlevel>10000)
										usr.maxpowerlevel += 6*3
									if(usr.maxpowerlevel>50000)
										usr.maxpowerlevel += 7*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."
obj
	HeavyPBag
		icon = 'weight-objs.dmi'
		icon_state = "heavypbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=500000&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("heavypbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=750000)
										usr.maxpowerlevel += 25*3
									if(usr.maxpowerlevel<=2500000&&usr.maxpowerlevel>750000)
										usr.maxpowerlevel += 41*3
									if(usr.maxpowerlevel<=5000000&&usr.maxpowerlevel>2500000)
										usr.maxpowerlevel += 60*3
									if(usr.maxpowerlevel>5000000)
										usr.maxpowerlevel += 91*3
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=750000)
										usr.maxpowerlevel += 38*3
									if(usr.maxpowerlevel<=2500000&&usr.maxpowerlevel>750000)
										usr.maxpowerlevel += 54*3
									if(usr.maxpowerlevel<=5000000&&usr.maxpowerlevel>2500000)
										usr.maxpowerlevel += 79*3
									if(usr.maxpowerlevel>5000000)
										usr.maxpowerlevel += 121*3
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0
					else
						usr << "You feel to weak to.."

obj
	SuperPBag
		icon = 'weight-objs.dmi'
		icon_state = "superpbag"
		density = 1
		verb
			HitPunchingBag()
				set name = "Speed Bag"
				set category = "Training"
				set src in oview(1)
				if(usr.flight == 1)
					usr << "Not while flying."
				if (usr.resting==1)
					usr<<"Not while resting"
				if(usr.flight == 0 && usr.resting==0)
					if(usr.stamina >= 5 && usr.maxpowerlevel>=5000000&&usr.afk==0)
						if(usr.dir != SOUTH&&(get_dir(usr,src)==NORTH|EAST|WEST))
							src.dir=get_dir(usr,src)
							if(usr.hitpbag==0)
								usr.hitpbag=1
								flick("superpbaghit",src)
								flick("weight-training-right", usr)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								usr.random = rand(1,5)
								if(usr.random == 1)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=6000000)
										usr.maxpowerlevel += 126 *4
									if(usr.maxpowerlevel<=10000000&&usr.maxpowerlevel>6000000)
										usr.maxpowerlevel += 149*4
									if(usr.maxpowerlevel<=20000000&&usr.maxpowerlevel>10000000)
										usr.maxpowerlevel += 175*4
									if(usr.maxpowerlevel>20000000)
										usr.maxpowerlevel += 200*4
									usr.meditate = 0
								if(usr.random == 2)
									usr.move = 1
									usr.stamina-=1
									usr.icon_state = ""
									if(usr.maxpowerlevel<=6000000)
										usr.maxpowerlevel += 155*4
									if(usr.maxpowerlevel<=10000000&&usr.maxpowerlevel>6000000)
										usr.maxpowerlevel += 199*4
									if(usr.maxpowerlevel<=20000000&&usr.maxpowerlevel>10000000)
										usr.maxpowerlevel += 225*4
									if(usr.maxpowerlevel>20000000)
										usr.maxpowerlevel += 260*4
									usr.meditate = 0
								else
									usr.maxpowerlevel += 0
								sleep(4)
								usr.hitpbag=0

					else
						usr << "You feel to weak to.."
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
				if(usr.flight == 0&&usr.resting==0&&usr.afk==0)
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
								usr.maxpowerlevel += rand(1,4)
								//var/dammage=usr.powerlevel/(rand(20,30))
								//s_damage(src, dammage, "#FF0000")
								var/damage = (usr.powerlevel / (rand(1,8)))
								damage = round(damage)
								damage += (rand(0,15))
								view(6) << "<font color = blue><i>[usr] hits the machine, doing about [damage] damage to it."
								var/random = rand(1,2)
								if(random == 2)
									if(damage >= 1000000)
										var/oloc
										flick("machdes",src)
										view(6) << "<font color = blue><i>[usr] hits the machine too hard, destroying it!!"
										oloc = locate(src.x,src.y,src.z)
										src.loc=locate(10,150,150)
										var/err = new /obj/machwreck
										usr.zenni += (rand(1,100))
										sleep(rand(1,600))
										usr << "You got some Zenni from that last hit."

										del(err)
										src.loc=locate(oloc:x,oloc:y,oloc:z)
									if(damage < 1000000)
										usr.zenni += (rand(1,10))
										usr << "You got some Zenni from that last hit."

								if(random == 1)
									usr.maxpowerlevel += rand(1,2)


								usr.meditate = 0
							else
								view(6) << "<font color = blue><i>[usr] hits the machine, doing [usr.powerlevel / (rand(2,8))] damage to the machine!"
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
		icon = 'auras.dmi'
		icon_state = "whiteaura"

obj
	kaioaura
		icon = 'auras.dmi'
		icon_state = "kaioaura"

obj
	spar





obj
	halofront
		icon = 'skills.dmi'
		icon_state = "halofront"
		layer = MOB_LAYER + 3
	haloback
		icon = 'skills.dmi'
		icon_state = "haloback"


	blueunderdmi
		icon = 'clothes-blueunder.dmi'
		layer = MOB_LAYER + 1



	blackgidmi
		icon = 'clothes-blackgi.dmi'
		layer = MOB_LAYER + 1
	bluegidmi
		icon = 'clothes-bluegi.dmi'
		layer = MOB_LAYER + 1

	Panties
		name = "Panties"
		icon = 'panties.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication"
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'panties.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'panties.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication"
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication"
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"


	orangeunderdmi
		icon = 'clothes-orangeunder.dmi'
		layer = MOB_LAYER + 1


	Customgi
		name = "Custom Gi"
		icon = 'clothes-blackgi2.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					//usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-blackgi.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your gi? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customsaiyajinarmor
		name = "Custom Saiya-jin Armor"
		icon = 'saiyanarmorc.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
			//		usr.overlays =0
			//		usr.revertssj()




					usr << "You remove the [src.name]."
					usr.overlays-= src.clothes

					usr.overlays-='saiyanarmor.dmi'

					usr.overlays-='saiyanarmor2.dmi'

					usr.overlays-='saiyanarmor4.dmi'
					src.clothes=""

				else
					src.worn = 1
					//usr.weight+=src.weight
					if(src.armorstyle==0)
						usr.overlays+='saiyanarmor.dmi'
					if(src.armorstyle==1)
						usr.overlays+='saiyanarmor2.dmi'
					if(src.armorstyle==2)
						usr.overlays+='saiyanarmor4.dmi'
					src.clothes = 'saiyanarmor6.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your armor? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
				switch(input("Which form of saiya-jin armor do you want?","Armor",text) in list("No Sholder Pads","Sholder Pads only","Sholder and Leg Pads","None"))
					if("No Sholder Pads")
						src.armorstyle=0
					if("Sholder Pads only")
						src.armorstyle=1
					if("Sholder and Leg Pads")
						src.armorstyle=2

	SpecialItemPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
			keylocked
			guildlocked
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon

				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(!src.keylocked && !src.guildlocked)
					if(src.worn == 1)
						src.worn = 0
						//usr.weight-=src.weight
						usr << "You remove the [src.name]."
						usr.overlays-=tempicon
					else
						src.worn = 1
						//usr.weight+=src.weight
						src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
						usr.overlays += tempicon
						usr << "You wear the [src.name]."
				else
					if(src.keylocked==usr.key || src.guildlocked==usr.guild)
						if(src.worn == 1)
							src.worn = 0
							usr << "You remove the [src.name]."
							usr.overlays-=tempicon
						else
							src.worn = 1
							src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
							usr.overlays += tempicon
							usr << "You wear the [src.name]."

			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
					if(src.keylocked)
						del(src)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	SpecialProjectilePrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					usr << "You remove the [src.name]."
					usr.weapon=0
					usr.kiblastcolor="yellow"
				else
					src.worn = 1
					usr << "You wear the [src.name]."
					usr.weapon=1
					usr.kiblastcolor="custom"
					usr.projectile= src.SpecialIcon
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			//vars= clothesred,clothesgreen,clothesblue,special
	SpecialWeaponPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=tempicon
					usr.weapon=0
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += tempicon
					usr << "You wear the [src.name]."
					usr.weapon=1
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			//vars= clothesred,clothesgreen,clothesblue,special
	SpecialUnderPrototype
		name = "Customizable item"
		icon = 'Special.dmi'
		worn = 0
		var
			SpecialIcon
		verb
			Wear()
				set category = "Communication" //was inventory
				var/tempicon
				var/savefile/F = new("icons/[src.SpecialIcon].sav")
				F["icon"]>>tempicon
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.underlays-=tempicon
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.icon += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.underlays += tempicon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	SpecialWeapon
	SpecialItem
	SpecialWeaponProtected
	SpecialItemProtected

	SpecialMorpher
		name = "Morpher"
		icon = 'Morpher.dmi'
		worn = 0
		var
			psuit
			phelm
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr << "You revert."
					usr.overlays=0
					sleep(1)
					usr.overlays=usr.ooverlays
					for(var/obj/O in usr.contents)
						O.worn=0
					usr.revertssj()
				else
					src.worn = 1
					usr.ooverlays=usr.overlays
					sleep(1)
					usr.overlays=0
					usr.overlays += src.phelm
					usr.overlays += src.psuit
					usr << "Its morphin time!!!."
					sleep(1)
					view()<<"[usr] Transforms!!"
			PowerRangers_Teleport()
				set category = "Communication"
				if(usr.z!=20)
					usr<<"Teleporting!"
					usr.loc=locate(105,157,20)
				else
					usr<<"Teleporting!"
					usr.loc=locate(77,77,1)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	DarknessDemonController
		name = "Darkness Demon Controller"
		icon = 'controller.dmi'
		worn = 0
		verb
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Control_Demons()
				set category = "Communication"
				if(usr.guild == "Darkness"||usr.guild == "<font face=Comic Sans MS><B><Font Color=#AAAAAA>D<Font Color=#949494>a<Font Color=#7E7E7E>r<Font Color=#686868>k<Font Color=#7E7E7E>n<Font Color=#949494>e<Font Color=#AAAAAA>s<Font Color=#C0C0C0>s</B></font>"||usr.creator==1)
					for(var/mob/monsters/DarknessDemon/M in oview(10))
						M.owner=usr.key
			Destroy()
				set category = "Communication"
				del(src)

	Customcloak
		name = "Custom Cloak"
		icon = 'kros clothesc.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'kros clothes.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customunder
		name = "Custom under"
		icon = 'clothes-blackunder2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'clothes-blackundergi.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Customheadband
		name = "Custom Headband"
		icon = 'head-bandc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'head-band.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	CustomGloves
		name = "Custom Gloves/Boots"
		icon = 'clothes-gloves-bootsc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					//usr.weight-=src.weight
					src.worn = 0
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					//usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-gloves-boots.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue

	CustomCape
		name = "Custom Cape"
		icon = 'clothes-capec.dmi'
		worn=0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					//usr.weight+=src.weight
					src.worn = 1
					src.clothes = 'clothes-cape.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	CustomShirt
		name = "Custom Shirt"
		icon = 'clothes-shirtc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'clothes-shirt.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue

	CustomShoes
		name = "Custom shoes"
		icon = 'clothes-shoesc.dmi'
		worn=0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'clothes-shoes.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	Custompants
		name = "Custom Pants"
		icon = 'clothes_custompants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr << "You remove the [src.name]."
					usr.overlays-=src.clothes
					src.clothes=""
				else
					src.worn = 1
					//usr.weight+=src.weight
					src.clothes = 'clothes_blackpants.dmi'
					src.clothes += rgb(src.clothesred,src.clothesgreen,src.clothesblue)
					usr.overlays += src.clothes
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
			ChangeColors()
				set category = "Communication"
				var/cred = input("How much red do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cgreen = input("How much green do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				var/cblue = input("How much blue do you want in your clothes? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
				src.clothesred = cred
				src.clothesgreen = cgreen
				src.clothesblue = cblue
	blackgi
		name = "Black Gi"
		icon = 'clothes-blackgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackgi.dmi'
					usr << "You remove the [src.name]."
				else
					//usr.weight+=src.weight
					src.worn = 1
					usr.overlays += 'clothes-blackgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluegi
		name = "Blue Gi"
		icon = 'clothes-bluegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-bluegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-bluegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueshoes
		name = "Blue shoes"
		icon = 'clothes-blueshoes.dmi'
		worn = 0

		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blueshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blueshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluegloves
		name = "Blue gloves"
		icon = 'clothes-bluegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-bluegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-bluegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluepants
		name = "Blue pants"
		icon = 'clothes_bluepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_bluepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_bluepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueshirt
		name = "Blue shirt"
		icon = 'clothes-blueshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blueshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blueshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluecape
		name = "Blue cape"
		icon = 'clothes-bluecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-bluecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-bluecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blueunder
		name = "Blue under"
		icon = 'clothes-blueunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blueunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blueunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redgi
		name = "Red Gi"
		icon = 'clothes-redgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greengi
		name = "Green Gi"
		icon = 'clothes-greengi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greengi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greengi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitegi
		name = "White Gi"
		icon = 'clothes-whitegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whitegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whitegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangegi
		name = "Orange Gi"
		icon = 'clothes-orangegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplegi
		name = "Purple Gi"
		icon = 'clothes-purplegi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purplegi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purplegi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greygi
		name = "Grey Gi"
		icon = 'clothes-greygi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greygi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greygi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowgi
		name = "Yellow Gi"
		icon = 'clothes-yellowgi.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackunder
		name = "Black under"
		icon = 'clothes-blackunder.dmi'
		worn = 0

		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redunder
		name = "Red under"
		icon = 'clothes-redunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenunder
		name = "Green under"
		icon = 'clothes-greenunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greenunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greenunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteunder
		name = "White under"
		icon = 'clothes-whiteunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whiteunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeunder
		name = "Orange under"
		icon = 'clothes-orangeunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangeunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleunder
		name = "Purple under"
		icon = 'clothes-purpleunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purpleunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyunder
		name = "Grey under"
		icon = 'clothes-greyunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greyunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greyunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowunder
		name = "Yellow under"
		icon = 'clothes-yellowunder.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowunder.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowunder.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackcape
		name = "Black cape"
		icon = 'clothes-blackcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redcape
		name = "Red cape"
		icon = 'clothes-redcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greencape
		name = "Green cape"
		icon = 'clothes-greencape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greencape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greencape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitecape
		name = "White cape"
		icon = 'clothes-whitecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whitecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whitecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangecape
		name = "Orange cape"
		icon = 'clothes-orangecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplecape
		name = "Purple cape"
		icon = 'clothes-purplecape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purplecape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purplecape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greycape
		name = "Grey cape"
		icon = 'clothes-greycape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greycape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greycape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowcape
		name = "Yellow cape"
		icon = 'clothes-yellowcape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowcape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowcape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackshirt
		name = "Black shirt"
		icon = 'clothes-blackshirt.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redshirt
		name = "Red shirt"
		icon = 'clothes-redshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenshirt
		name = "Green shirt"
		icon = 'clothes-greenshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greenshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greenshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteshirt
		name = "White shirt"
		icon = 'clothes-whiteshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whiteshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeshirt
		name = "Orange shirt"
		icon = 'clothes-orangeshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangeshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleshirt
		name = "Purple shirt"
		icon = 'clothes-purpleshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purpleshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyshirt
		name = "Grey shirt"
		icon = 'clothes-greyshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greyshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greyshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowshirt
		name = "Yellow shirt"
		icon = 'clothes-yellowshirt.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowshirt.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowshirt.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackpants
		name = "Black pants"
		icon = 'clothes_blackpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_blackpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_blackpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redpants
		name = "Red pants"
		icon = 'clothes_redpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_redpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_redpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenpants
		name = "Green pants"
		icon = 'clothes_greenpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_greenpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_greenpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitepants
		name = "White pants"
		icon = 'clothes_whitepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_whitepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_whitepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangepants
		name = "Orange pants"
		icon = 'clothes_orangepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_orangepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_orangepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplepants
		name = "Purple pants"
		icon = 'clothes_purplepants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_purplepants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_purplepants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greypants
		name = "Grey pants"
		icon = 'clothes_greypants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_greypants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_greypants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowpants
		name = "Yellow pants"
		icon = 'clothes_yellowpants.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes_yellowpants.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes_yellowpants.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackgloves
		name = "Black gloves"
		icon = 'clothes-blackgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redgloves
		name = "Red gloves"
		icon = 'clothes-redgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greengloves
		name = "Green gloves"
		icon = 'clothes-greengloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greengloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greengloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitegloves
		name = "White gloves"
		icon = 'clothes-whitegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whitegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whitegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangegloves
		name = "Orange gloves"
		icon = 'clothes-orangegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplegloves
		name = "Purple gloves"
		icon = 'clothes-purplegloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purplegloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purplegloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greygloves
		name = "Grey gloves"
		icon = 'clothes-greygloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greygloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greygloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowgloves
		name = "Yellow gloves"
		icon = 'clothes-yellowgloves.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowgloves.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowgloves.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackshoes
		name = "Black shoes"
		icon = 'clothes-blackshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redshoes
		name = "Red shoes"
		icon = 'clothes-redshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greenshoes
		name = "Green shoes"
		icon = 'clothes-greenshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greenshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greenshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whiteshoes
		name = "White shoes"
		icon = 'clothes-whiteshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whiteshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whiteshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangeshoes
		name = "Orange shoes"
		icon = 'clothes-orangeshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangeshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangeshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purpleshoes
		name = "Purple shoes"
		icon = 'clothes-purpleshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purpleshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purpleshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greyshoes
		name = "Grey shoes"
		icon = 'clothes-greyshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greyshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greyshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowshoes
		name = "Yellow shoes"
		icon = 'clothes-yellowshoes.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowshoes.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowshoes.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackcloak
		name = "Black cloak"
		icon = 'clothes-blackcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-blackcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-blackcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redcloak
		name = "Red cloak"
		icon = 'clothes-redcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-redcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-redcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greencloak
		name = "Green cloak"
		icon = 'clothes-greencloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greencloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greencloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitecloak
		name = "White cloak"
		icon = 'clothes-whitecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-whitecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-whitecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluecloak
		name = "Blue cloak"
		icon = 'clothes-bluecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-bluecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-bluecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	orangecloak
		name = "Orange cloak"
		icon = 'clothes-orangecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-orangecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-orangecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	purplecloak
		name = "Purple cloak"
		icon = 'clothes-purplecloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-purplecloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-purplecloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greycloak
		name = "Grey cloak"
		icon = 'clothes-greycloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-greycloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-greycloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	yellowcloak
		name = "Yellow cloak"
		icon = 'clothes-yellowcloak.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'clothes-yellowcloak.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'clothes-yellowcloak.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	namekgi
		name = "Namekian Gi"
		icon = 'namekgi.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'namekgi.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'namekgi.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	turben
		name = "Turben"
		icon = 'turben.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'turben.dmi'
					usr << "You remove the [src.name]."


				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'turben.dmi'
					usr << "You wear the [src.name]."

			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	cape
		name = "White Cape"
		icon = 'cape.dmi'
		worn = 0
		objo=3
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'cape.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'cape.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	saiyanarmor
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitefp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitefp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitefp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	Freiza_Armor
		name = "Saiya-jin Armor"
		icon = 'Freiza Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor
		name = "Saiya-jin Armor"
		icon = 'Vegeta Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor
		name = "Saiya-jin Armor"
		icon = 'Nappa Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor
		name = "Saiya-jin Armor"
		icon = 'Raditz Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Bardock_Armor
		name = "Saiya-jin Armor"
		icon = 'Bardock Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Toma_Armor
		name = "Saiya-jin Armor"
		icon = 'Toma Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Panboukin_Armor
		name = "Saiya-jin Armor"
		icon = 'Panboukin Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Totepo_Armor
		name = "Saiya-jin Armor"
		icon = 'Totepo Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Red_Armor
		name = "Saiya-jin Armor"
		icon = 'Red Armor.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Vegeta Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Nappa Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor_Shoulderless
		name = "Saiya-jin Armor"
		icon = 'Raditz Armor ns_with legs.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Vegeta_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Vegeta Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Nappa_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Nappa Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Raditz_Armor_Simple
		name = "Saiya-jin Armor"
		icon = 'Raditz Armor ns.dmi'
		worn = 0
		objo=2
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Black
		name = "Underclothing"
		icon = 'under_black.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Blue
		name = "Underclothing"
		icon = 'under_blue.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Gray
		name = "Underclothing"
		icon = 'under_gray.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Green
		name = "Underclothing"
		icon = 'under_green.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_Red
		name = "Underclothing"
		icon = 'under_red.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	Under_White
		name = "Underclothing"
		icon = 'under_white.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= src.icon
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += src.icon
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				Move(usr)
	blacksaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blackfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blackfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blackfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluefp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluefp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluefp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-redfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-redfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-redfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmorfp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greenfp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greenfp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greenfp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitehp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitehp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitehp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blacksaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blackhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blackhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blackhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluehp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluehp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluehp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-redhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-redhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-redhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmorhp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greenhp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greenhp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greenhp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	whitesaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-whitenp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-whitenp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-whitenp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blacksaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-blacknp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-blacknp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-blacknp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	bluesaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-bluenp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-bluenp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-bluenp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	redsaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-rednp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-rednp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-rednp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	greensaiyanarmornp
		name = "Saiya-jin Armor"
		icon = 'saiyanarmor-greennp.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor-greennp.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor-greennp.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	royalsaiyan
		name = "Royal Saiya-jin Armor"
		icon = 'saiyanarmor4.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					//usr.weight-=src.weight
					usr.overlays -= 'saiyanarmor4.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					//usr.weight+=src.weight
					usr.overlays += 'saiyanarmor4.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Shinobiband
		name = "Shinobi Head-band"
		icon = 'shinobi-band.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(usr.guild=="sHiNoBi")
					if(src.worn == 1)
						src.worn = 0
						usr.overlays -= 'shinobi-band.dmi'
						usr << "You remove the [src.name]."
					else
						src.worn = 1
						usr.overlays += 'shinobi-band.dmi'
						usr << "You wear the [src.name]."
				else
					usr<<"You must be in Shinobi to use this item"
					src.worn = 0
					usr.overlays -= 'shinobi-band.dmi'
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Sunglasses
		name = "Sunglasses"
		icon = 'Shades.dmi'
		worn = 0
		objo=1
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'Shades.dmi'

					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'Shades.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	blackelite
		name = "Elite Saiya-jin Armor (Black)"
		icon = 'saiyanarmor5.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor5.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor5.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	blueelite
		name = "Elite Saiya-jin Armor (Blue)"
		icon = 'saiyanarmor3.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor3.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	custom_armor
		name = "Custom Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"



	elitesaiyanarmor
		name = "Elite Saiya-jin Armor"
		icon = 'saiyanarmor2.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'saiyanarmor2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'saiyanarmor2.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	bootglovedmi
		icon = 'gloves-boots.dmi'
		layer = MOB_LAYER + 1

	boxingglove
		name = "Boxing Gloves"
		icon = 'boxing.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'boxing.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'boxing.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"


	GogetaArmor
		name = "Gogeta's Vest"
		icon = 'GogetaVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GogetaVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GogetaVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	GotenkArmor
		name = "Gotenk's Vest"
		icon = 'GotenkVest.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'GotenkVest.dmi'
					usr << "You remove [src.name]."
				else
					src.worn = 1
					usr.overlays += 'GotenkVest.dmi'
					usr << "You wear [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

	bootglove
		name = "White Boots and Gloves"
		icon = 'gloves-boots.dmi'
		worn = 0
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'gloves-boots.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'gloves-boots.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj/Eviltank
	icon='darkcontainer.dmi'
	density=1
	verb
		Check()
			set category ="Command"
			set src in oview(1)
			if(usr.race=="Demon"&&usr.demontrans==0)
				usr<<"This tank is almost full... with that sort of evil energy you could become much stronger."
				switch(input("Do you want to absorb all the evil energy?", "Tank of Evil",text) in list ("Yes","No"))
					if("Yes")
						usr<<"The evil floods into your body, you can now summon this evil to transform"
						usr.demontrans=1
						usr.verbs+=/mob/Demontrans/verb/Revert
						usr.verbs+=/mob/Demontrans/verb/DemonTransform
			else
				usr<<"It seems to be a tank of pure evil, extracted from washed souls."



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

			if(howmuch > 500)
				usr << "<b>The gravitron cannot withstand more than 500x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
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

			if(howmuch > 10000)
				usr << "<b>The gravitron cannot withstand more than 10000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj/Gravitronthree
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 50000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 50000)
				usr << "<b>The gravitron cannot withstand more than 50000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj/Gravitronfour
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 150000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 150000)
				usr << "<b>The gravitron cannot withstand more than 150000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1


obj/Gravitronfive
	icon = 'turfs.dmi'
	icon_state = "gravitynew"
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
			if(howmuch > 1 && howmuch <= 200000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 200000)
				usr << "<b>The gravitron cannot withstand more than 200000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1


obj/Gravitronfourspecial
	icon = 'gravchamber.dmi'
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
			if(howmuch > 1 && howmuch <= 150000)
				if(usr.grav >= 1)
					usr << "<b>Please set the gravity to 0."
				if(usr.grav == 0||usr.grav == null)
					usr << "<b>You hear the machine turn on..."
					usr.grav = howmuch
					sleep(20)

			if(howmuch > 150000)
				usr << "<b>The gravitron cannot withstand more than 150000x gravity."
		Help()
			set category = "Training"
			set src in oview(1)
			alert(usr,"When you set the gravity, the effected room will lower your powerlevel whenever you move and at the same time increase your max powerlevel. This is a great way to train but if you dont take a break you can be killed. (Powerlevel reaches 0).  There are 2 modes of gravity training, Pulse and Gradual, Pulse will effect you less often but will cause more damage to you than gradual and give you a higher increase. Pulse is more dangerous, Gradual on the other hand will effect you less than pulse but happen every time you step and is more safe. Pulse is the name for the old style of gravity chambers (Gekisen 1.19 and earlier) and Gradual is for the newer style. (1.19 and higher.)")
		Gravity_Type()
			set category = "Training"
			set src in oview(1)
			switch(input("Set Gravity Type?(Pulse 1.19 and earlier, Gradual is the style after 1.19)", text) in list ("Pulse","Gradual"))
				if("Pulse")
					usr<<"Switched Gravity Type to Pulse"
					usr.gravitytype=0
				if("Gradual")
					usr<<"Switched Gravity Type to Gradual"
					usr.gravitytype=1
obj
	JanembaSword
		icon = 'swordz3.dmi'
		layer = MOB_LAYER + 1
		name = "Janemba's Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz3.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz3.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	TapionSword
		icon = 'swordz2.dmi'
		layer = MOB_LAYER + 1
		name = "Tapion's Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz2.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz2.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	Sword1
		icon = 'swordz.dmi'
		layer = MOB_LAYER + 1
		name = "Z Sword"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.weapon = 0
					usr.overlays -= 'swordz.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'swordz.dmi'
					usr.weapon = 1
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
	Swordsheath
		icon = 'sword.dmi'
		layer = MOB_LAYER + 1
		name = "Sword Sheath"
		verb
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'sword.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'sword.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
obj
	green_scouter
		icon = 'green-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class III Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'green-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'green-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"



obj
	custom_scouter
		icon = 'custom-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Custom Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'custom-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'custom-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 1000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 1000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	red_scouter
		icon = 'red-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class II Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'red-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'red-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 100000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 100000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					if(M.z == usr.z)
						usr << "<B>[M.name]'s location: ([M.x],[M.y])"
		 			if(M.z != usr.z)
		 				usr << "<b>[M.name]'s location points off into the distance."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	yellow_scouter
		icon = 'yellow-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class IV Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'yellow-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'yellow-scouter.dmi'
					usr << "You wear the [src.name]."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 10000000000000000000000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 10000000000000000000000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Search()
				set category = "Communication" //was inventory
				usr << "<B>Your location: ([usr.x],[usr.y])"
				for(var/mob/characters/M in world)
					usr << "<B>[M.name]'s location: ([M.x],[M.y],[M.z])"

			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"

obj
	blue_scouter
		icon = 'blue-scouter.dmi'
		layer = MOB_LAYER + 1
		name = "Class I Scouter"
		verb
			Wear()
				set category = "Communication" //was inventory
				if(src.worn == 1)
					src.worn = 0
					usr.overlays -= 'blue-scouter.dmi'
					usr << "You remove the [src.name]."
				else
					src.worn = 1
					usr.overlays += 'blue-scouter.dmi'
					usr << "You wear the [src.name]."

			Scan(mob/characters/M in view(6))
				set category = "Communication" //was inventory
				if(src.worn == 1)

					view(6) << "<font color = blue><i>[usr] points a scouter at [M]."
					if(M.powerlevel >= 50000)
						usr << "<b>Your scouter cannot read [M]'s powerlevel."
					if(M.powerlevel < 50000)
						usr << "<b>[M] : [num2text(M.powerlevel,100)]"
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Drop()
				set category = "Communication" //was inventory
				sleep(1)
				if(src.worn == 1)
					usr << "Not while its being worn."
				if(src.worn == 0 && usr.hasfused!=1)
					src.loc=locate(usr.x,usr.y+1,usr.z)
			Search()
				set category = "Communication" //was inventory
				if(src.worn == 1)

					usr << "<B>Your location: ([usr.x],[usr.y])"
					for(var/mob/characters/M in world)
						if(M.z == usr.z)
							usr << "<B>[M.name]'s location: ([M.x],[M.y])"
			 			if(M.z != usr.z)
			 				usr << "<b>[M.name]'s location points off into the distance."
				if(src.worn == 0 && usr.hasfused!=1)
					usr << "You must be wearing it."
			Get()
				set category = "Communication" //was inventory
				set src in oview(1)
				if(length(usr.contents)<30)
					Move(usr)
				else
					usr<<"Your inventory is full"
obj
	halo
		icon = 'halo.dmi'
		layer = MOB_LAYER + 1
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
		layer = MOB_LAYER + 2
		//verb
		//	Heal()
		//		set category = "Training"
		//		set src in oview(1)
		//		usr.playerheal()
		//		usr.heal = 1

mob
	proc
		playerheal()
			if(src.heal == 0||null)
				src.powerlevel += 0
			if(src.heal == 1)
				if(src.hp <= 0)
					src.hp=0
					src.heal = 0
				if(src.hp >0)
					src.hp+= 100
					if(src.powerlevel<src.maxpowerlevel)
						src.powerlevel=src.maxpowerlevel
					spawn(1)
						src.playerheal()


obj
	Icecube
		icon = 'ice.dmi'
		icon_state = ""
		layer = MOB_LAYER + 3
		New()
			flick(src,"ice_animation")

obj
	assim
		icon = 'turfs.dmi'
		icon_state = "assim"
		layer = MOB_LAYER + 3

obj
	Gdonut
		icon ='Donut.dmi'
		icon_state ="Donut"
		layer = MOB_LAYER + 3





obj/kitrail3
	icon = 'kametrail2.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail4
	icon = 'kametrail2.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/kitrail5
	icon = 'kametrail3.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail6
	icon = 'kametrail3.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/kitrail7
	icon = 'kametrail4.dmi'
	icon_state=""
	density=0
	npc = 5
obj/kitrail8
	icon = 'kametrail4.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
obj/SpecialBeamCannon
	icon = 'kame4.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/scatter
	icon = 'kamescatter.dmi'
	icon_state=""
	density=0
	npc = 5
	layer = MOB_LAYER+3
	New()
		flick("1",src)
obj/kitrail
	icon = 'kametrail.dmi'
	icon_state=""
	density=0
	npc = 5
	pixel_step_size=8
obj/kitrail2
	icon = 'kametrail.dmi'
	icon_state=""
	density=0
	npc = 5
	dir=8
	pixel_step_size=8
obj/FinalFlash
	icon = 'kame.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/GalekGun
	icon = 'kame9.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/Tsuihikidan
	icon = 'kame10.dmi'
	icon_state = ""
	density = 0
	npc=4
	pixel_step_size=8
obj/sbomb
	icon = 'turfs.dmi'
	icon_state = "sbomb"
	density = 0
	pixel_step_size=8
obj/crator
	name=""
	density=0
	npc=2
	New()
		src.underlays+=new/obj/Crater/T1
		src.underlays+=new/obj/Crater/T2
		src.underlays+=new/obj/Crater/B1
		src.underlays+=new/obj/Crater/B2
		spawn()
			sleep(600)
			del(src)
mob/smoke
	icon='0smoke.dmi'
	density = 0
	layer = MOB_LAYER+4
	name=""
	New()
		spawn()
			sleep(80)
			del(src)







obj
	kshoot
		icon = 'turfs.dmi'
		icon_state = "des"

obj
	kien
		icon = 'turfs.dmi'
		icon_state = "des"


mob
	kienzan
		verb
			Kienzan(mob/characters/M in oview(6))
				set name = "Kien-zan"
				set category = "Fighting"
				if(usr.kame == 1)
					usr << "You are currently charging something."
				if(usr.kame == 0 && usr.move==1||usr.kame == null)
					if(usr.nopk==0)
						dam=skillkiusage[9]
						if(dam >= usr.ki)
							usr << "Thats too strong."
						if(dam <= usr.ki &&dam>0)
							if(usr.kame==1)
								usr<<"You are already firing a blast"
							else
								usr.kame=1
								usr.icon_state = "des"
								usr.ki-=dam
								if(usr.powerlevel>usr.maxpowerlevel)
									dam=dam*(usr.powerlevel/usr.maxpowerlevel)
								dam=dam*300
								dam=(dam/(M.powerlevel+1))*50
								if(usr.sounds==1)
									spawn()usr<<'sounds/destructodisc_charge.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/destructodisc_charge.wav'
								sleep(rand(10,20))
								var/snart = new /obj/kien(locate(usr.x,usr.y+1,usr.z))

								sleep(rand(10,30))
								if(usr.sounds==1)
									spawn()usr<<'sounds/disc_fire.wav'
								for(var/mob/characters/L in oview(4))
									if(L.client)
										if(L.sounds==1)
											spawn()L<<'sounds/disc_fire.wav'
								usr <<"Kienzan!!"
								sleep(100)
								del(snart)
								s_missile(/obj/kien,usr,M)
								M.hp-=dam
								usr.icon_state = ""
								M.Die()
								spawn()usr.KO()
								usr.kame=0

					else
						usr<<"This is a no pk zone!!"
mob
	tourneyjoin
		verb
			JoinBudokai()
				set name="Join Budokai"
				set category="Budokai"
				usr.loc=locate(rand(151,170),59,3)
				world<<"[usr] Joins the Budokai"
				usr.verbs -= /mob/tourneyjoin/verb/JoinBudokai




mob
	godform
		verb
			Transform()
				set category = "Fighting"
				if(usr.state == "God")
					usr << "<b>You are transformed already."
				else
					world << "<b><font color = yellow>You sense an uneartly power!!!</font></b>"
					usr.ooverlays=usr.overlays
					usr.overlays=0
					usr.underlays=0
					flick("godtransform.dmi",usr)
					usr.overlays+='godelec.dmi'
					usr.overlays+='godwind.dmi'
					usr.underlays+='godaura.dmi'
					usr.powerlevel = (usr.powerlevel * 9999)
					usr.state="God"


			Revert()
				set category = "Fighting"
				if(usr.state == "Normal")
					usr << "<b>You aren't transformed."
				else
					world << "<b><font color = yellow>You sense a huge power fade away...</font></b>"
					usr.state = "Normal"
					usr.overlays=0
					usr.underlays=0
					usr.overlays=usr.ooverlays
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel

mob
	proc
		loosehair()
			src.overlays-= src.hairicon
			src.overlays-= src.hairicon
			if(src.state=="Ultra Super Saiya-jin")
				if(src.skincolor=="black")
					src.icon='male-black.dmi'
				if(src.skincolor=="darkbrown")
					src.icon='male-brown.dmi'
				if(src.skincolor=="lightbrown")
					src.icon='male-lightbrown.dmi'
				if(src.skincolor=="white")
					src.icon='male-white.dmi'
				if(src.skincolor=="tan")
					src.icon='male.dmi'
				if(src.skincolor=="fwhite")
					src.icon = 'female-pale.dmi'
				if(src.skincolor=="ftan")
					src.icon = 'female.dmi'
				if(src.skincolor=="flightbrown")
					src.icon = 'female-lightbrown.dmi'
				if(src.skincolor=="fdarkbrown")
					src.icon = 'female-darkbrown.dmi'
				if(src.skincolor=="fblack")
					src.icon = 'female-black.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays -= 'ssjaura.dmi'
			src.underlays=0
			src.overlays -= 'ssj4 hair.dmi'
			src.overlays -= 'elec.dmi'
			src.overlays -='ssj4.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'ssj3.dmi'
			src.overlays -= 'hair_dan_spikeyshort.dmi'
			src.overlays -= 'hair_dan_long.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_vegeta_ssj.dmi'
			src.overlays -= 'hair_dan_spikey.dmi'
			src.overlays -= 'hair_dan_ssjspikey.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_ultrasuper_saiyajin.dmi'
			src.overlays -= 'hair_dan_short.dmi'
			src.overlays -= 'hair_dan_vegeta.dmi'
			src.overlays -='hair_Gohan.dmi'
			src.overlays -='hair_trunks.dmi'
			src.overlays -='ssj_futuretrunks_hair.dmi'
			src.overlays -='ussj_futuretrunks_hair.dmi'
			src.overlays -='hair_dan_goku.dmi'
			src.overlays -= 'hair_ssj_goku.dmi'
			src.overlays -= 'hair_ssj3_goku.dmi'
			src.overlays -= 'hair_ssj4_goku.dmi'
			src.overlays -='Hair_Bald_Supersayajin.dmi'
			src.overlays -='ssj_trunks_hair.dmi'
			src.overlays -= 'Red Elec.dmi'
			src.overlays -= 'Vssj4.dmi'
			src.overlays -= '2ssj4.dmi'
			src.overlays -= src.hairicon2
*/
