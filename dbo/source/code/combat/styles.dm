
styles
	parent_type = /obj
	var
		damagePercentMax
		damagePercentMin
		critHitChance

	verb
		Change_Style()
			set name = "Combat Stance"
			set category = "Other"
			switch(alert("What do you wish to do?","Combat Stance","Enter Combat Stance", "End Combat Stance", "None"))
				if("Enter Combat Stance")
					if(usr.stamina.value <= 0)
						usr << "You are too exhausted to be in a stance!"
						usr.currentStyle = null
						usr.currentStylen = null
						usr.stamina.value = 0
						usr.icon_state = ""
					else
						if(src.name == "Porunga Stance")
							if(usr.powerlevel.max_value < 1000000000 || usr.ki.max_value < 50000000)
								usr << "You are too weak for this stance!"
								for(var/styles/porunga/P in usr.contents)
									del(P)
								return
						if(src.name == "Shenron Stance")
							if(usr.powerlevel.max_value < 1000000000 || usr.ki.max_value < 50000000)
								usr << "You are too weak for this stance!"
								for(var/styles/shenron/S in usr.contents)
									del(S)
								return
						usr.currentStyle = src
						usr.currentStylen = "[src.name]"
						usr.icon_state = "sparstand"
						usr.stamdrain()
				if("End Combat Stance")
					usr.currentStyle = null
					usr.currentStylen = null
					usr.icon_state = ""
					usr.stamdrain()

//look for ki absorb stuff and make it 1/500
styles
	basic
		name = "Basic Stance"
		damagePercentMin = 1
		damagePercentMax = 5
		critHitChance = 0
	advanced
		name = "Advanced Stance"
		damagePercentMin = 2.5
		damagePercentMax = 10
		critHitChance = 5
	adept
		name = "Adept Stance"
		damagePercentMin = 2
		damagePercentMax = 7.5
		critHitChance = 0
	zanstances
		name = "Turtle Hermit Stance"
		damagePercentMin = 1.5
		damagePercentMax = 6
		critHitChance = 0
	kai
		name = "Kai Stance"
		damagePercentMin = 1.5
		damagePercentMax = 6
		critHitChance = 15
	namek
		name = "Namekian Stance"
		damagePercentMin = 2.5
		damagePercentMax = 15
		critHitChance = 5
	icer
		name = "Changling Stance"
		damagePercentMin = 2
		damagePercentMax = 10
		critHitChance = 6
	sword
		name = "Sword Stance"
		damagePercentMin = 5
		damagePercentMax = 12.5
		critHitChance = 2.5
	powerpole
		name = "Power Pole Stance"
		damagePercentMin = 7.5
		damagePercentMax = 15
		critHitChance = 5
	shenron
		name = "Shenron Stance"
		damagePercentMin = 12
		damagePercentMax = 17
		critHitChance = 20
	porunga
		name = "Porunga Stance"
		damagePercentMin = 10
		damagePercentMax = 22
		critHitChance = 25

mob
	proc
		stamdrain()
			set background = 1
			spawn()
				set background = 1
				while(stamina.value > 0 && currentStyle != null)
					if(currentStylen == "Basic Stance")
						stamina.value -= 1
					if(currentStylen == "Advanced Stance")
						stamina.value -= 10
					if(currentStylen == "Adept Stance")
						stamina.value -= 9
					if(currentStylen == "Turtle Hermit Stance")
						stamina.value -= 5
					if(currentStylen == "Kai Stance")
						stamina.value -= 7
					if(currentStylen == "Namekian Stance")
						stamina.value -= 3
					if(currentStylen == "Changling Stance")
						stamina.value -= 8
					if(currentStylen == "Sword Stance")
						stamina.value -= 10
					if(currentStylen == "Power Pole Stance")
						stamina.value -= 14
					if(currentStylen == "Shenron Stance")
						stamina.value -= 20
					if(currentStylen == "Porunga Stance")
						stamina.value -= 25
					if(stamina.value <= 0)
						break
					sleep(rand(200,1000))
				if(stamina.value <= 0)
					src << "<B>You feel exhausted by being in your stance too long!"
					currentStyle = null
					stamina.value = 0
					icon_state = ""
					currentStylen = null