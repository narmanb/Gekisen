
atom/movable
	var
		absorba=0
		absorb=0
		zanzoken = 0
		earthballs = 0
		speed = 1
		Munlock = 0
		hasfused=0
		gmlevel = 0
		gotdb1 =0
		quest = ""
		counter1 = ""
		healing = 0
		quest1complete = 0
		gotdb2 = 0
		gotdb3 = 0
		catchbubbles = 0
		gotdb4 = 0
		gotdb5 = 0
		talking
		name2
		gotdb6 = 0
		strength2
		defense2
		speed2
		health2
		gotdb7 = 0
		haschip=0
		friend = ""
		oocname = "Player"
		knowmob = {""}
		dam=0
		block=0
		gms = {""}
		newspaper
		lose
		start
		intourney
		ooverlays=""
		opk=0
		ocontents
		enterdintourney = 0
		win = 0
		maxpowerlevel1=0
		strength1=0
		defense1=0
		speed1=0
		maxhealth1=0
		corner = {""}
		powerlevel
		maxpowerlevel
		strength
		defense
		killsaiba = 0
		chips=0
		clanmember = ""
		exp
		account
		bankmoney
		pk = 0
		maxexp
		fly = 1
		hostile
		lock = 1
		mother
		gpoint
		rpoint
		bpoint
		attacking = 0
		clanpage = ""
		clanrank = ""
		saiba
		dying=0
		father
		move
		level = 10
		sbag = 0
		clancorner = {""}
		resting
		ohair
		orem
		fusetime = 100
		haswished=0
		oicon
		oname
		transone
		transtwo
		ooc
		rhair = 0
		flevel
		chose
		ntalk
		ioverlays
		en
		entime
		trainpl
		talky
		tayio
		bhair = 0
		ghair = 0
		ack
		gm
		key = ""
		moon
		hash = 0
		farkd
		customred
		styleicon
		customblue
		customgreen
		aura
		Clanmember = ""
		ooh
		gave
		follow
		plarper
		poratta
		training

		kame = 0
		fuse
		medtime
		angered
		kak
		npc=0
		befriend
		ragename
		faceicon
		nametext1
		slap
		maxbase
		klevel
		plevel
		opl
		gonessj
		counter = {""}
		ssj = 0
		bloodline
		unlock
		tapion
		oldzenni
		ofaceicon
		gainzenni
		rage
		ased
		stamina
		heal
		state
		health
		maxhealth
		talk
		tech
		safe
		maxstamina
		will
		bubbles
		honor
		purity
		race
		alignment
		title
		npp = 0
		gravtime
		zenni
		kaioken
		prefix
		powered
		ko
		blocking
		spar
		ptime
		kiloc
		kiin
		dead
		focustech
		focustechlearn
		bangtechlearn
		focused
		worn
		attribute
		master

		grav
		kitech
		auratech
		kicolor
		combo
		focus
		kitechlearn
		auratechlearn
		kicolorlearn
		focuslearn
		kaiolearn
		spiritlearn
		itlearn
		style
		stylename
		hair

		lift
		random
		meditate

		flight = 0
		flightlearn

mob/proc
	updatee()
		usr.icon = usr.icon
		sleep(5)
mob
	Stat()
		statpanel("[src]'s Stats")
		stat("[src.name] [title]", "")
		stat("Clan Member:","[clanmember]")
		stat("Battle points:","[level]")
		stat("Health:","[src.health]/[src.maxhealth]") // this shows the max and current hp/mana after the stat panel meter
		stat("KI:","[src.powerlevel]/[src.maxpowerlevel]")
		stat("Experience:","[exp]/[maxexp]")
		stat("Strength:","[strength]")
		stat("Defense:","[defense]")
		stat("Speed:","[speed]")
		stat("Stamina:","[stamina]%")
		stat("Zenni:", "[zenni]")
		stat("Current Quest:","[quest]")
		stat("------------------------------------------------------------------------")

mob
	verb
		PK_Mode()
			set category = "Extra"
			if(usr.pk == 0)
				usr.pk = 1
				usr.overlays += 'hostile.dmi'
				usr << "PK Mode has been turned on"
			else
				usr.pk = 0
				usr.overlays -= 'hostile.dmi'
				usr << "PK Mode has been turned off"

	verb/Scoreboard()
		set category = "Extra"
		RankingDisplay(src)


mob
	proc
		Statupdate(mob/monsters/M in world)
			if(M.friend == "[usr]")
				M.strength = usr.strength2
				M.speed = usr.speed2
				M.defense = usr.defense2
			Stat(usr)
mob
	proc
		Levelup()
			if(usr.exp == usr.maxexp||usr.exp >= usr.maxexp)
				usr.exp = 0
				usr.level += 6
				usr.will += rand(2,3)
				usr.honor += rand(2,3)
				usr.purity += rand(2,3)
				usr.maxexp += 200
				usr.health += 15
				usr.maxpowerlevel += 5
				usr.powerlevel = usr.maxpowerlevel
				usr.maxhealth += rand(5,10)
				usr.health = usr.maxhealth
				usr.zenni += rand(100,1000)
				usr << "The Eternal Dragon gives you zenni for your effort"
				client.SaveMob()
				usr.powerlevelRefresh()
			else
mob
	verb
		BattlePointDistribution()
			set name = "Battle Point Distribution"
			set category = "Extra"
			there
			switch(alert("What stats do you want to add onto?",, "Strength","Defense","Speed","Balanced Stats"))
				if("Strength")
					here
					var/amount = input("How much strength do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
					if(amount < 0 || amount > usr.level)
						switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
							if("Yes")
								switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
									if("Yes")
										goto there
									if("No")
										return
							if("No")
								goto here
					else
						usr.strength += amount
						usr.level -= amount
						if(usr.level > 0)
							switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
								if("Yes")
									goto there
								if("No")
									usr<<"Your Strength has increased"
				if("Defense")
					here
					var/amount = input("How much defense do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
					if(amount < 0 || amount > usr.level)
						switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
							if("Yes")
								switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
									if("Yes")
										goto there
									if("No")
										return
							if("No")
								goto here
					else
						usr.defense += amount
						usr.level -= amount
						if(usr.level > 0)
							switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
								if("Yes")
									goto there
								if("No")
									usr<<"Your Defense has increased"
				if("Speed")
					here
					var/amount = input("How much speed do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
					if(amount < 0 || amount > usr.level)
						switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
							if("Yes")
								switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
									if("Yes")
										goto there
									if("No")
										return
							if("No")
								goto here
					else
						usr.speed += amount
						usr.level -= amount
						if(usr.level > 0)
							switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
								if("Yes")
									goto there
								if("No")
									usr<<"Your Speed has increased"
				if("Balanced Stats")
					here
					var/amount = input("How much do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
					amount = round(amount / 3)
					if(amount * 3 > usr.level || amount < 0)
						switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
							if("Yes")
								switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
									if("Yes")
										goto there
									if("No")
										return
							if("No")
								goto here
					else
						usr.strength += amount
						usr.defense += amount
						usr.speed += amount
						usr.level -= amount * 3
						if(usr.level > 0)
							switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
								if("Yes")
									goto there
								if("No")
									usr<<"Your Power has increased"
mob
	bankman
		icon = 'mobs1.dmi'
		icon_state = "bankman"
		verb
			Bank()
				set src in oview(3)
				set category = "Extra"
				usr<<"Welcome to DBZPower Bank!"
				switch(alert("Hello there! What can I do for you?","Deposite","Take Out","Make an Account","Destroy Account"))
					if("Deposite")
						if(usr.account == 1)
							var/amount = input("How much zenni do you wish to put in the bank?") as num|null
							amount = round(amount)
							if(amount >= 0)
								usr.bankmoney += amount
								usr.zenni -= amount
								alert("Thank You for coming! You added [amount] zenni to make your total amount to be [usr.bankmoney]")
							else
								alert("You cannot add [amount] zenni")
						else
							alert("You do not have an account with us.")
					if("Take Out")
						if(usr.account == 1)
							var/amount = input("How much zenni do you wish to take out of the bank?") as num|null
							amount = round(amount)
							if(amount >= 0)
								if(amount > usr.bankmoney)
									alert("You cannot take out more than you have in the bank")
								else
									usr.bankmoney -= amount
									usr.zenni += amount
									alert("Thank You for coming! You took [amount] zenni to make your total amount to be [usr.bankmoney]")
							else
								alert("You cannot take [amount] zenni")
						else
							alert("You do not have an account with us.")
					if("Make an Account")
						if(usr.account == 1)
							alert("You cannot make more than one account")
						else
							alert("You have now created an account with DBZPower Banks, you will be able to acces your account from any bankteller around the world!")
							usr.account = 1
							usr.bankmoney = 0


					if("Destroy Account")
						if(usr.account == 0)
							alert("You cannot destroy whats not there")
						if(usr.account == 1)
							if(usr.bankmoney == 0)
								alert("You now have deactivated your account and will have to create another to use the banks again")
								usr.account = 0
							else
								alert("You still have money in your account, you need to take it out")

mob
	newspaperman
		icon = 'NPCS.dmi'
		icon_state = "newspaperman"
		verb
			newspaperChat()
				set src in oview(1)
				set category = "Communication"
				alert("Hi there young lad! How are you?")
				if(usr.newspaper == 1)
					alert("You can have only one newspaper.")
				else
					alert("Its been a slow day for me too. Do you want to buy a newspaper, it tells you information that you might have missed.")
					alert("The newspaper comes every sunday, so it wont take as long to publish...Please buy a newspaper.")
					switch(alert("Will you buy one?","You have [usr.zenni] to spend","Yes","No"))
						if("Yes")
							if(usr.zenni >= 50)
								alert("Thankyou, you've made my day alot better!")
								usr.contents += new /obj/newspaper
								usr.newspaper = 1
								usr.zenni -= 50
							else
								alert("Sorry You dont have enough money")


						if("No")
							alert("I hope you change your mind in the future...hmf.")

mob
	proc
		Resting()
			if(usr.spar == 1)
				usr<< "You cannot rest while training"
			else
				if(usr.resting == 0)
					usr.powerlevel += 0
				if(usr.resting == 1 && usr.stamina<100)
					usr.stamina += rand(1,10)
					usr.powerlevel += rand(100,500)
					usr.health += rand(1,5)
					usr.FlightLearn()
					usr.AuraTechLearn()
					usr.KiTechLearn()
					usr.FocusLearn()
					usr.AuraMake()
					usr.move=0
					if(usr.stamina >= 100)
						usr.stamina = 100
						usr.resting = 0
					if(usr.powerlevel >= usr.maxpowerlevel)
						usr.powerlevel = usr.maxpowerlevel
						usr.resting = 0
					if(usr.health >= usr.maxhealth)
						usr.health = usr.maxhealth
						usr.resting = 0
					sleep(5)
					usr.Resting()




mob
	verb
		Reload_ClanPage()
			set category = "Extra"
			usr << "You must goto a ATM and use it to view the clanpage."
			Loadclanpage()
		Edit_Corner(msg as text)
			set category = "Extra"
			usr << "You must goto a ATM and use it to edit your clan corner."
			usr.clancorner += "[msg]<br>"
		Remember_Someone(mob/M in oview(1))
			set category = "Fighting"
			if(findText("[usr.knowmob]","[M.name]")==1)
				usr << "You already know [M]!"
			else
				if(istype(M,/mob/monsters/))
					usr << "You try to remember [M], but you can't find any good thoughts!"
				else
					if(M.gm == 1)
						usr << "You cannot remember Gods."
						return
					else
						usr.knowmob += "[M.name] "
						usr << "You try to remember [M], and you succeed!"


		Aura_on()
			set category = "Extra"
			var/aura = 'whiteaura.dmi'
			aura += rgb(usr.customred,usr.customgreen,usr.customblue)
			usr.underlays += aura
		Aura_off()
			set category = "Extra"
			usr.underlays=0
		DropDragonballs()
			set category = "Inventory"

			switch(input("Which dragonball do you want to drop.","Drop",text) in list ("DB1","DB2","DB3","DB4","DB5","DB6","DB7","None"))
				if("DB1")
					if(usr.gotdb1==1)
						usr.gotdb1=0
						new /obj/dragonballs/earth1(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB2")
					if(usr.gotdb2==1)
						usr.gotdb2=0
						new /obj/dragonballs/earth2(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB3")
					if(usr.gotdb3==1)
						usr.gotdb3=0
						new /obj/dragonballs/earth3(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB4")
					if(usr.gotdb4==1)
						usr.gotdb4=0
						new /obj/dragonballs/earth4(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB5")
					if(usr.gotdb5==1)
						usr.gotdb5=0
						new /obj/dragonballs/earth5(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB6")
					if(usr.gotdb6==1)
						usr.gotdb6=0
						new /obj/dragonballs/earth6(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
				if("DB7")
					if(usr.gotdb7==1)
						usr.gotdb7=0
						new /obj/dragonballs/earth7(locate(usr.x,usr.y,usr.z))
						usr << "You let go of the Dragonball"
					else
						usr<<"You dont have this Dragonball"
			checkdbz()
mob
	proc
		meditate()
			if(usr.meditate == 0)
				usr.powerlevel += 0
			if(usr.meditate == 1)
				usr.stamina += rand(1,7)
				usr.random = rand(1,2)
				if(usr.random == 2)
					usr.exp += rand(10,15)
					Levelup()
				usr.random = rand(1,30)
				if(usr.random == 30)
					usr << "<b><font size = 2>You feel more purified."
					usr.purity += 1
					usr.random = rand(1,29)
				if(usr.random == 29)
					usr << "<b><font size = 2>You feel more honor enter your blood."
					usr.honor += 1
					usr.random = rand(1,28)
				if(usr.random == 28)
					usr << "<b><font size = 2>You get more will to fight."
					usr.will += 1
				usr.FlightLearn()
				usr.AuraTechLearn()
				usr.KiTechLearn()
				usr.FocusLearn()
				usr.AuraMake()
				if(usr.stamina >= 100)
					usr.stamina = 100
				sleep(50)
				usr.meditate()
mob
	verb
		Meditate()
			set category = "Extra"
			set name = "Meditate/Rest"
			if(usr.flight == 1)
				usr << "Not while flying."
			if(usr.spar == 1)
				usr<<"Not while Training."
			else
				if(usr.flight == 0)
					if(medtime == 1)
						usr<<"You cant do this"
					else
						if(usr.meditate == 1)
							if(usr.medtime == 0||usr.medtime == null)
								usr << "<b>You stop meditating."
								usr.medtime = 1
								usr.move = 1
								usr.resting = 0
								usr.Resting()
								usr.healing = 0
								usr.icon_state = ""
								usr.meditate = 0
								sleep(50)
								usr.medtime = 0

						else
							usr << "<b>You begin meditating."
							usr.icon_state = "meditate"
							usr.move = 0
							usr.meditate = 1
							usr.meditate()
							usr.resting = 1
							usr.healing = 1
							usr.Resting()
							usr.Levelup()
							usr.Healing()

	proc
		Healing()
			if(usr.healing == 1)
				if(usr.health <= usr.maxhealth)
					sleep(100)
					var/barand = rand(1,5)
					usr.health += barand
				else
					usr.health = usr.maxhealth
			else
				return

mob
	verb
		Who()
			set category = "Communication"
			for(var/mob/characters/M in world)
				if(M.key)
					usr.counter1 += "[M]--"
			usr << "<br><u>Users:</u> [usr.counter1]"
			usr.counter = 0
			for(var/mob/characters/M in world)
				if(M.key)
					usr.counter += 1
			usr << "<br><u>Players Online</u>: <b>[usr.counter]"
			usr.counter = 0

		Credits()
			set category = "Communication"
			usr<<browse(HtmlLayout())


mob
	verb
		drop_gold()
			set category = "Communication"
			set name = "Drop Zenni"
			var/dropgold = input("How much you want to drop?","Drop Gold",) as num
			if(dropgold<=0)
				usr << "You have to drop ATLEAST 1 zenni!"
				return
			if(dropgold>usr:zenni)
				usr << "You dont have that much zenni to drop."
				return
			else
				var/O = new /obj/goldbag(usr.loc)
				O:zenni = dropgold
				usr.zenni -= dropgold
				usr << "You drop  <B>[dropgold]</b> zenni"
				view(6) << "[usr] drops <b>[dropgold] zenni."
				return

obj/goldbag
	name="Gold Bag"
	icon='gold.dmi'
	verb
		Get()
			set src in oview(0)
			usr << "You get <b>[src.zenni]</b> zenni."
			usr:zenni += src.zenni
			del(src)

		Befriend(mob/characters/M in oview(6))
			set name = "Befriend"
			set category = "Communication"
			if(usr.befriend == null)
				if(M.move == 1)
					switch(alert("Are you sure you want to befriend him? You can only befriend one person.","Befriend","Yes","No"))
						if("Yes")
							usr.befriend = M.name
							M << "[usr] has befriended you!"
			else
				usr << "You have befriended already."

mob
	verb
		HelpBook()
			set category = "Communication"
			set name = "Help Book"
			switch(alert("What topic do you wish to learn about?" ,"Skills","Names","How do I...","FAQs","Rules"))
				if("Skills")
					alert("Here are the following natural skills you learn:")
					alert("Flight (Bukujutsu): 100 max powerlevel")
					alert("Power Up: 375 max powerlevel")
					alert("Focus: 425 max powerlevel")
				if("Names")
					alert("Here are a few examples of names:")
					alert("Ijiru Haskushi: Very good (RP based)")
					alert("Drake: Good (RP based)")
					alert("Majin Drako: Okay (RP based)")
					alert("SSJ TONY: Bad (RP based)")
					alert("the majin goku ssj: Very bad (RP based)")
					alert("the ssj majin evil goku4: Banned on sight (RP based)")
				if("How do I...")
					alert("How do I...")
					alert("Power Up?: Learn it")
					alert("Go SSJ?: 100,000 max powerlevel and get angered")
					alert("Fly?: 100 max powerlevel")
					alert("Become a GM?: You dont")
					alert("Change my face icon?: You can only do that at start")
					alert("Get legendary?: You have a 1/1000 chance of getting it")
				if("FAQs")
					alert("Currently being worked on.")
				if("Rules")

					alert("Rules:")
					alert("The GMs, at any time, can alter, change, or view your statistics/name.")
					alert("You must have a capital letter in your name, or else it will be punishable by an altering or changing of a name.")
					alert("You can not have any numbers in your name, unless its part of an Android (Android 17, Number 17, No. 17)")
					alert("If you do abuse a bug, The GMs can alter, change, or ban you. Do not hide bugs from GMs, because we will find out sooner of later. And when we do, and you dont tell us about it, we might remove that feature.")
					alert("Do not ever use any racial slurs. That is automatically punishable by an IP BAN")
					alert("Do not ever complain about 'LAG. Keep it to yourself.")
					alert("Do not bug Dracon on his hotmail account/MSN messenger (unless he says otherwise). He is extremely busy.")
					alert("Do not bug Dracon 'HOW DO I GET SSJ','CAN I BE A GM','CAN I HAVE A POWERBOOST/REBURSEMENT', etc. That is punishable by altering or changing of statistics, or a 'bitchslap'")
					alert("Respect all GMs and their decisions. (Even Maniack).")
					alert("If you do not like this game, dont complain about it. That just shows your ignorance.")
					alert("IGNORANCE IS NOT AN EXCUSE")
					alert("Maniack: On Ketchup Island, you must always be fuzzy")
mob
	verb
		Look(mob/characters/M in view(1))
			set category = "Communication"
			view(6) << "<font color = yellow>*<font color = red>[usr] looks at [M].<font color = yellow>*"
			usr << "<font color = red><center>[M.name]</red></center>"
			usr << "<font color = blue>Current Fighting Style: <IMG CLASS=icon SRC=\ref[usr.style]'> [M.stylename]"
			usr << "<font color = blue>Special Attributes: He is a(n) [M.attribute]."
			if(M.will >= 20 && M.honor >= 20 && M.purity >= 20)
				usr << "<font color = blue>You sense a great hidden power in him."
			if(M.powerlevel > usr.powerlevel)
				usr << "<font color = blue>You sense that [M] is stronger than you."
			if(M.powerlevel == usr.powerlevel)
				usr << "<font color = blue>[M] has the same powerlevel as you."
			if(M.powerlevel < usr.powerlevel)
				usr << "<font color = blue>You sense that [M] is weaker than you."
			if(usr.will >= 20 && usr.honor >= 20 && usr.purity >= 20)
				usr << "<font color = blue>You sense that [M] is at [num2text(M.powerlevel,100)]."
			usr << "<font color = blue>He seems to be a [M.race]."
			usr << "<font color = blue>They appear to be [M.state]."
			if(M.powerlevel >= M.maxpowerlevel)
				usr << "<font color = silver><font face = Arial>You sense that [M] is at full power."
			if(M.powerlevel < M.maxpowerlevel && M.powerlevel > (M.maxpowerlevel / 2))
				usr << "<font color = silver><font face = Arial>You sense that [M] is less than his maximum power."
			if(M.powerlevel <= (M.maxpowerlevel / 2) && M.powerlevel > (M.maxpowerlevel / 4))
				usr << "<font color = silver><font face = Arial>You sense that [M] is hiding most of their power."
			if(M.powerlevel <= (M.maxpowerlevel / 4) && M.powerlevel > (M.maxpowerlevel / 8))
				usr << "<font color = silver><font face = Arial>You sense that [M] is hiding almost all of his power."
			if(M.powerlevel <= (M.maxpowerlevel / 8))
				usr << "<font color = silver><font face = Arial>You sense that [M] has compeletly hidden their power."
			usr << "<font color = black><center>------------------------"
			usr << "<font color = blue><center>(OOC Information)"
			usr << "<font color = blue><center>[M]'s Key: [M.key]"
			if(M.key == "Dracon")
				usr << "<font color = blue><center><i><u>Bow before Dracon, for he is the owner."
			usr << "<font color = black><center>------------------------"

		OOC(T as text)
			set category = "Communication"
			set name = "OOC"
			for(var/mob/M in world)
				if(usr.key == "Dbuman" || usr.key == "Dbzboy23662")
					M << "<font color = blue><B>-<font color = green>Owner<font color = blue><B>-</b><font color = red>--<font color = white>[usr]<font color = red>--<font color = aqua>OOCs:<font color = silver> [T]"
					switch(rand(1,4))
						if(1)
							var/txt2 = "<font size = 1><font color = aqua>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [T]"
							SGS_Spam_log_file.Add(txt2)
						if(2)
							var/txt2 = "<font size = 1><font color = yellow>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [T]"
							SGS_Spam_log_file.Add(txt2)
						if(3)
							var/txt2 = "<font size = 1><font color = green>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [T]"
							SGS_Spam_log_file.Add(txt2)
						if(4)
							var/txt2 = "<font size = 1><font color = red>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [T]"
							SGS_Spam_log_file.Add(txt2)
				else M << "<font color = blue><B>-</b><font color = green>[oocname]<font color = blue><B>-</b><font color = red>--<font color = white>[usr]<font color = red>--<font color = aqua>OOCs:<font color = white> [Safe_Guard(T)]"


mob
	verb
		Finish(mob/characters/M in oview(1))
			set category = "Fighting"
			if(M.ko == 0)
				usr << "<b>He isn't knocked out!"
			if(M.ko == 1)
				if(M.key)
					usr.purity -= 1
					usr.will += 1
					usr.honor -= 1
					usr.zenni += M.zenni
					M.zenni = 0
				else
					usr.purity += 1
					usr.will -= 1
					usr.honor += 1
					usr.zenni += M.zenni
					M.zenni = 0
				usr.random = rand(1,4)
				if(usr.random == 1)
					view(6) << "<b><font color = blue>[usr] picks up [M] by the throat, and snaps his neck."
					M.health = 0
					M.Die()
					usr.move = 0
					sleep(30)
					usr.move = 1
				if(usr.random == 2)
					view(6) << "<b><font color = blue>[usr] stomps down on [M]'s stomach, killing him."
					M.health = 0
					M.Die()
					usr.move = 0
					sleep(30)
					usr.move = 1
				if(usr.random == 3)
					view(6) << "<b><font color = blue>[usr] stomps down on [M]'s neck, breaking his neck and killing him.."
					M.health = 0
					M.Die()
					usr.move = 0
					sleep(30)
					usr.move = 1
				if(usr.random == 4)
					view(6) << "<b><font color = blue>[usr] punches right through [M]'s stomach, killing him!."
					M.health = 0
					M.Die()
					usr.move = 0
					sleep(30)
					usr.move = 1

mob/bubb
	New()
		.=..()
		spawn(1)
			Wander()
	proc/Wander()
		while(src)
			step_rand(src)
			sleep(5)
		spawn(40)
			Wander()
mob/monsters
	var/mob/characters/P
	New()
		.=..()
		spawn(1)
			Wander()
	proc/Wander()
		while(src)
			if (P in oview(3))
				step_towards(src,P)
			if (P in oview(1))
				Bump(P)
			else
				step_rand(src)
				for(P in view(src))
					break
			sleep(15)
		spawn(40)
			Wander()
	Bump(mob/characters/M in view(1))
		if(!M.key)
		else
			if(usr.attacking == 1) usr << "<I><font color = blue>You try to attack, but your already attacking."
			else
				if(usr.friend == "[M]")
					usr<<"You cannot betray your friend"
				else
					if(M.pk == 1)
						if(usr.strength - M.defense > 0)
							var/hit = rand(1,5)
							usr.attacking = 1
							if(hit == 1)
								view() << "<I><font color = blue>[usr] High-kicks [M]"
								usr.icon_state = "kick"
								M.health -= usr.strength - M.defense
							if(hit == 2)
								view() << "<I><font color = blue>[usr] Low-kicks [M]"
								usr.icon_state = "kick"
								M.health -= usr.strength - M.defense
							if(hit == 3)
								view() << "<I><font color = blue>[usr] High-punches [M]"
								usr.icon_state = "punch"
								M.health -= usr.strength - M.defense
							if(hit == 4)
								view() << "<I><font color = blue>[usr] Low-punches [M]"
								usr.icon_state = "punch"
								M.health -= usr.strength - M.defense
							M.Die()
							sleep(15)
							stamina-=2
							usr.attacking = 0
							M.powerlevelRefresh()
							usr.icon_state = ""
							if(hit == 5)
								view() << "<I><font color = blue>[usr] kicks [M], but misses"
							for(var/mob/characters/C in world)
								if(C.friend == "[usr]")
									C.exp += 50

						else
							view() << "<I><Font color = blue>[usr] delt barely any damage to [M]!"
							M.health-=1
							M.powerlevelRefresh()
							M.Die()
							for(var/mob/characters/C in world)
								if(C.friend == "[usr]")
									C.exp += 15
					else
						usr << "They're not a PKer."
mob
	store
		newbie
			icon = 'mobs.dmi'
			icon_state = "newbie"
			name = "A fecking newbie"
			race = "Newbie"
			stylename = "Pooz"
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("hi hi im a newbie and plz plz i want to be a gm plz come on im wearing my dbz jammies and my super thayiaman cape because i want to be just like thaiyaman because im a newbie plz plz ur a gm can i b a gm plz plz end if you dont let me im gonna tell my brotha on you and youll be sorry plz plz wanna buy my game its actually dragonball gt genesis except i added piccolo and now its called dragonball im a faggot because its my game now i just copied the icons and coding from dracon because im a faggot and i took his game and i told all my gay nerdy friends that it was mine")
					alert("(note: This is just humor, it was intended to make fun of the newbies =P, especially the people who copied my game (dont get all fussy(Maniack: Did you say fuzzy?)...no))")
					switch(input("PLZ buy my sheet", "Newbie", text) in list ("A black bean panted blue", "Maniacks buttered toast, without the butter", "The newbies game - Dragonball GT - Im a faggot"))
						if("A black bean panted blue")
							usr << "<b><u>No its mine get out of here plz plz i wanna be a gm"
						if("Maniacks buttered toast, without the butter")
							usr << "<b><u>BUTTERED TOAST!!!"
						if("The newbies game - Dragonball GT - Im a faggot")
							usr << "<b><u>BALLTHS"





mob
	tester
		dummy1
			icon = 'male.dmi'
			icon_state = "sparstand"
			powerlevel = 100
			maxpowerlevel = 100
			blocking = 0
			ko = 0
			alignment = "Good"
			npc = 1
			dead = 0
			spar = 1

		dummy2
			icon = 'male.dmi'
			icon_state = "sparblock"
			powerlevel = 100
			maxpowerlevel = 100
			blocking = 1
			npc = 1
			ko = 0
			alignment = "Good"
			spar = 1
mob
	bubb
		bubbles
			name = "Bubbles the Monkey"
			icon = 'mobs.dmi'
			npc = 1
			move = 1
			movement_probability = 50
			icon_state = "bubbles"
			verb
				Catch()
					set src in view(1)
					set name = "Catch The Monkey"
					set category = "Extra"
					if(!usr.catchbubbles ||usr.catchbubbles == 0)
						alert("King Kaio: You cought my beloved Bubbles! Come talk to me to end your training")
						usr.catchbubbles = 1
					else
						alert("You've cought him already, come talk to me")

mob
	tester
		kingkai
			name = "North Kaio"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "northkaio"
			bubbles=0
			verb
				Go_To_Kaioshin()
					set name = "Go To Kaioshin"
					set category = "Training"
					set src in oview(1)
					switch(alert("Do you want to go to Kaioshin's for extreme training?","Kaioshin's", "Yes","No"))
						if("Yes")
							usr.loc = locate(21,125,10)
						if("No")
							usr<<"Okay, then. You will remain here."
				Return_To_Earth()
					set name = "Return To Earth"
					set category = "Training"
					set src in oview(1)
					if(!usr.catchbubbles||usr.catchbubbles == 0)
						alert("You haven't caught Bubbles yet")
					if(usr.catchbubbles == 1)

						if(usr.talky == 1||usr.talky==0||usr.talky==null)
							if(usr.maxpowerlevel >= 0)
								usr << "<b>You may now return to earth!"
								if(usr.powerlevel >= 250)
									if(usr.kaiolearn == null)
										usr.contents += new /obj/techs/Kaioken
										usr << "<b>Before you leave, I will teach you Kaioken."
										usr.kaiolearn = 1
										usr.kaioken = 0

								if(usr.powerlevel >= 2500)
									if(usr.spiritlearn == null)
										usr.contents += new /obj/techs/spiritbomb
										usr << "<b>Before you leave, I will teach you Spirit Bomb."
										usr.spiritlearn = 1
										usr.kame = 0
								if(usr.powerlevel >= 1000)
									if(usr.itlearn == null)
										usr.contents += new /obj/techs/it
										usr << "<b>Before you leave, I will teach you Instant Transmission."
										usr.itlearn = 1
								usr.loc=locate(70,85,1)
								usr.talky = 0
								usr.overlays -= 'halo.dmi'
								usr.overlays -= /obj/halo
								usr.overlays -= 'halo.dmi'
								usr.overlays -= /obj/halo
								usr.overlays -= 'halo.dmi'
								usr.overlays -= /obj/halo
								usr.dead = 0
								usr.catchbubbles = 0
							else
								usr << "<b>You need to train to [usr.trainpl] powerlevel."

mob
	other
		ache
			icon = 'mobs.dmi'
			icon_state = "ache"
			powerlevel = 5
			npc = 1
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Talk()
					set category = "Communication"
					set src in oview(3)
					alert("My shop is closed")

mob
	melp
		Shopkeeper2
			icon = 'NPCS.dmi'
			icon_state = "Shopkeeper2"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			race = "Human-jin"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Orange Gi","Blue Underclothing","Class IV Scouter","Nothing"))
						if("Orange Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/orangegi
								usr.zenni -= 150

						if("Blue Underclothing")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Orange Gi!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 150

						if("Class IV Scouter")
							if(usr.zenni <= 9999)
								usr << "<b>You need 10000 zenni!"
							if(usr.zenni >= 10000)
								usr << "<b>You get a ClassIV Scouter!"
								usr.contents += new /obj/yellow_scouter
								usr.zenni -= 10000
mob
	melp
		A16
			icon = 'Android 16.dmi'
			npc = 1
			powerlevel = 999999
			maxpowerlevel = 999999
			race = "Android"
			verb
				Buy()
					set src in oview(1)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Android Chip","Nothing"))
						if("Android Chip")
							if(usr.zenni <= 1000 && usr.race=="Android")
								usr << "<b>You need 1000 zenni!"
							if(usr.zenni >= 1000 && usr.race=="Android")
								usr << "<b>You get a new Power Chip!"
								usr.haschip=1
								usr.zenni -= 1000
							if(usr.race=="Android")
								usr<<"Here let me install if for you"
							else
								usr<<"This is only for androids"


mob
	melp
		Vegitto
			icon = 'mobs.dmi'
			icon_state = "vegetto"
			npc = 1
			powerlevel = 999999999
			maxpowerlevel = 999999999
			race = "Sayajin Fusion"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Blue Gi","Orange Underclothing","Portarra Earings(50,000z)","Nothing"))
						if("Blue Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Blue Gi!"
								usr.contents += new /obj/bluegi
								usr.zenni -= 150
						if("Orange Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Orange Underclothing!"
								usr.contents += new /obj/orangeunder
								usr.zenni -= 50
						if("Portarra Earings(50,000z)")
							if(usr.zenni <= 49999)
								usr << "<b>You need 50,000 zenni!"
							if(usr.zenni >= 50000)
								usr << "<b>You get Portarra Earings!"
								usr.contents += new /obj/fusion
								usr.zenni -= 50000

mob
	melp
		Shopkeeper
			icon = 'NPCS.dmi'
			icon_state = "Shopkeeper"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 7
			race = "Changling"
			verb
				Buy()
					set src in oview(3)
					set category = "Communication"
					switch(input("Hello! What do you wish to buy?", "Shopkeeper",text) in list ("Blue Gi","Orange Underclothing","Black Gi","Blue Underclothing","Black Underclothing","Turben","Cape","Namek Gi","White Boots and Gloves","Boxing Gloves","Class I Scouter","Class II Scouter","Class III Scouter", "Senzu Bean","Elite Saiyajin Armor", "Elite Saiyajin Armor (Black)","Elite Saiyajin Armor (Blue)","Royal Saiyajin Armor", "Saiyajin Armor"))
						if("Blue Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Blue Gi!"
								usr.contents += new /obj/bluegi
								usr.zenni -= 150
						if("Orange Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Orange Underclothing!"
								usr.contents += new /obj/orangeunder
								usr.zenni -= 50


						if("Black Gi")
							if(usr.zenni <= 149)
								usr << "<b>You need 150 zenni!"
							if(usr.zenni >= 150)
								usr << "<b>You get a Black Gi!"
								usr.contents += new /obj/blackgi
								usr.zenni -= 150
						if("Blue Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Blue Underclothing!"
								usr.contents += new /obj/blueunder
								usr.zenni -= 50
						if("Black Underclothing")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get a Black Underclothing!"
								usr.contents += new /obj/blackunder
								usr.zenni -= 50
						if("White Boots and Gloves")
							if(usr.zenni <= 49)
								usr << "<b>You need 50 zenni!"
							if(usr.zenni >= 50)
								usr << "<b>You get White Boots and Gloves!"
								usr.contents += new /obj/bootglove
								usr.zenni -= 50
						if("Boxing Gloves")
							if(usr.zenni <= 99)
								usr << "<b>You need 100 zenni!"
							if(usr.zenni >= 100)
								usr << "<b>You get Boxing Gloves!"
								usr.contents += new /obj/boxingglove
								usr.zenni -= 100
						if("Class I Scouter")
							if(usr.zenni <= 1999)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get Class I Scouter!"
								usr.contents += new /obj/blue_scouter
								usr.zenni -= 2000
						if("Class II Scouter")
							if(usr.zenni <= 3999)
								usr << "<b>You need 4000 zenni!"
							if(usr.zenni >= 4000)
								usr << "<b>You get Class II Scouter!"
								usr.contents += new /obj/red_scouter
								usr.zenni -= 4000
						if("Class III Scouter")
							if(usr.zenni <= 7999)
								usr << "<b>You need 8000 zenni!"
							if(usr.zenni >= 8000)
								usr << "<b>You get Class III Scouter!"
								usr.contents += new /obj/green_scouter
								usr.zenni -= 8000

						if("Turben")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Turben!"
								usr.contents += new /obj/turben
								usr.zenni -= 500

						if("Cape")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Cape!"
								usr.contents += new /obj/cape
								usr.zenni -= 500


						if("Namek Gi")
							if(usr.zenni <= 499)
								usr << "<b>You need 500 zenni!"
							if(usr.zenni >= 500)
								usr << "<b>You get a Cape!"
								usr.contents += new /obj/namekgi
								usr.zenni -= 500

						if("Senzu Bean")
							if(usr.zenni <= 4999)
								usr << "<b>You need 5000 zenni!"
							if(usr.zenni >= 5000)
								usr << "<b>You get a Senzu Bean!"
								usr.contents += new /obj/senzu
								usr.zenni -= 5000
						if("Saiyajin Armor")
							if(usr.zenni < 2000)
								usr << "<b>You need 2000 zenni!"
							if(usr.zenni >= 2000)
								usr << "<b>You get a Saiya-jin Armor!"
								usr.contents += new /obj/saiyanarmor
								usr.zenni -= 2000
						if("Elite Saiyajin Armor")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/elitesaiyanarmor
								usr.zenni -= 3000
						if("Royal Saiyajin Armor")
							if(usr.zenni < 4500)
								usr << "<b>You need 4500 zenni!"
							if(usr.zenni >= 4500)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/royalsaiyan
								usr.zenni -= 4500
						if("Elite Saiyajin Armor (Blue)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blueelite
								usr.zenni -= 3000
						if("Elite Saiyajin Armor (Black)")
							if(usr.zenni < 3000)
								usr << "<b>You need 3000 zenni!"
							if(usr.zenni >= 3000)
								usr << "<b>You get a Elite Saiya-jin Armor!"
								usr.contents += new /obj/blackelite
								usr.zenni -= 3000


mob
	other
		Maniack
			icon = 'maniack.dmi'
			icon_state = ""
			npc = 1
			powerlevel = 35000000
			maxpowerlevel = 50000000
			race = "Buttered 'AAA' Android"
			verb
				Talk()
					set category = "Communication"
					set src in oview(3)
					alert("Yarrrr!!! Welcome to the NEW KETCHUP ISLAND! Make yerself at home, and watch the grass fuzzy!")
					alert("If yeh would like some buttered toast I could give yeh some.. and check out meh new item.. GRAVY!")
					alert("Whats new on Ketchup Island? Go see fer yerself! FOLLOW THE GREY ROADS FECKA! :D")
				Ask()
					set category = "Communication"
					set src in oview(3)
					switch(input("Comon, out with eet! What do yeh want?", "Ask Manerk!") in list ("Can I have some buttered toast?", "Can I have some GRAVY?", "Could you break dance for meh?", "Tell me yer wisdom wise one!"))
						if("Can I have some buttered toast?")
							alert("Maniack: Hmmm seems like a plan.. but I want you to think really hard and answer me this question...")
							alert("ARE YOU A NEWBIE???!?!?!?!?")
							switch(input("ARE YOU A NEWBIE???!?!?!?!?", "Ask Manerk!") in list ("Of course not!", "Yeah, why?"))
								if("Of course not!")
									alert("Okie dokie.. one mer question befer yeh get yer buttered toast.. Do you want to be a GM?")
									switch(input("Do you want to be a GM?", "Ask Manerk!") in list ("HELL YES!", "No thanks, can I have my buttered toast?"))
										if("HELL YES!")
											alert("Maniack: YER A NEWBIE! GAWD I HATE IGNORANT NEWBIES!!!!!!")
											usr <<"<font color = red>Maniack's eyes go red and his muscles bulge up with rage!"
											flick("maniackpower",src)
											sleep(18)
											usr<<"Maniack punches you right in the face causing you immediate death!!!!"
											usr.powerlevel = 0
											usr.Die()
											world <<"<font color = red>(Ketchup Island) Maniack: [usr] is a newbie! NO BUTTERED TOAST FER NEWBIES! GAHHHH!!!"
										if("No thanks, can I have my buttered toast?")
											alert("Ye have passed meh test! Here be yer buttered toast!!!")
											usr<<"You get buttered toast! (Yay!)"
											usr.contents += new /obj/maniack/butteredtoast
											world <<"<font color = red>(Ketchup Island) Maniack: [usr] isnt a newbie so [usr] is meh buddy and geets serm buttered toast!"
								if("Yeah, why?")
									alert(">Maniack: YER A NEWBIE! GAWD I HATE IGNORANT NEWBIES!!!!!!")
									usr <<"<font color = red>Maniack's eyes go red and his muscles bulge up with rage!"
									flick("maniackpower",src)
									sleep(18)
									usr<<"Maniack punches you right in the face causing you immediate death!!!!"
									usr.powerlevel = 0
									usr.Die()
									world <<"<font color = red>(Ketchup Island) Maniack: [usr] is a newbie! NO GRAVY FER NEWBIES! GAHHHH!!!"
						if("Can I have some GRAVY?")
							alert("Maniack: Hmmm seems like a plan.. but I want you to think really hard and answer me this question...")
							alert("ARE YOU A NEWBIE???!?!?!?!?")
							switch(input("ARE YOU A NEWBIE???!?!?!?!?", "Ask Manerk!") in list ("Of course not!", "Yeah, why?"))
								if("Of course not!")
									alert("Okie dokie.. one mer question befer yeh get yer GRAVY.. Do you want to be a GM?")
									switch(input("Do you want to be a GM?", "Ask Manerk!") in list ("HELL YES!", "No thanks, can I have my GRAVY?"))
										if("HELL YES!")
											alert("Maniack: YER A NEWBIE! GAWD I HATE IGNORANT NEWBIES!!!!!!")
											usr <<"<font color = red>Maniack's eyes go red and his muscles bulge up with rage!"
											flick("maniackpower",src)
											sleep(18)
											usr<<"Maniack punches you right in the face causing you immediate death!!!!"
											usr.powerlevel = 0
											usr.Die()
											world <<"<font color = red>(Ketchup Island) Maniack: [usr] is a newbie! NO GRAVY FER NEWBIES! GAHHHH!!!"
										if("No thanks, can I have my GRAVY?")
											alert("Ye have passed meh test! Here be yer GRAVY!!!")
											usr<<"You get buttered toast! (Yay!)"
											usr.contents += new /obj/maniack/GRAVY
											world <<"<font color = red>(Ketchup Island) Maniack: [usr] isnt a newbie so [usr] is meh buddy and geets serm GRAVY!"
								if("Yeah, why?")
									alert("<Maniack: YER A NEWBIE! GAWD I HATE IGNORANT NEWBIES!!!!!!")
									usr <<"<font color = red>Maniack's eyes go red and his muscles bulge up with rage!"
									flick("maniackpower",src)
									sleep(18)
									usr<<"Maniack punches you right in the face causing you immediate death!!!!"
									usr.powerlevel = 0
									usr.Die()
									world <<"<font color = red>(Ketchup Island) Maniack: [usr] is a newbie! NO GRAVY FER NEWBIES! GAHHHH!!!"
						if("Tell me yer wisdom wise one!")
							usr.random= rand(1,11)
							if(usr.random == 1)
								alert("Maniack: Yeh can lead a chikin to water but eef eet clucks yer drownin!")
							if(usr.random == 2)
								alert("Maniack: How many times have yeh lost a quarter? Well.. *reaches behind yer head and pulls out a five dollar bill* here ees yer change! *Gives yeh a nickel*")
								usr.zenni += 5
							if(usr.random == 3)
								alert("Maniack: How can meh feet smell eef they dont have a nose?")
							if(usr.random == 4)
								alert("Maniack: When yeh close deh refrigerator, does the light stay on?")
							if(usr.random == 5)
								alert("Maniack: If this is Ketchup Island, where is the Mustard hidden?")
							if(usr.random == 6)
								alert("Maniack: NO ONE CAN BREAK DANCE LIKE MANERK! YEEEEEE HAWWW!!")
								flick("breakdance", src)
							if(usr.random == 7)
								alert("Maniack: Do you smell buttered toast?")
							if(usr.random == 8)
								alert("Maniack: Osama Bin Laden's goat gives him chubby..")
							if(usr.random == 9)
								alert("Maniack: Hey.. where the hell do I make meh buttered toast and gravy.. do you see a toaster? Looks like eet be a mystery..")
							if(usr.random == 10)
								alert("Maniack: Dracon may be deh brains but em deh fecking bronze!")
							if(usr.random == 11)
								alert("Maniack: Well butter meh up and call meh 'Charley'...")
						if("Could you break dance for meh?")
							alert("Maniack: Sure! But eet will cost yeh a nickel! I dance fer nickels!")
							switch(input("Dance fer nickels?", "Ketchup Island") in list ("Yeeeeee!", "Neeeee!"))
								if("Yeeeeee!")
									usr.zenni -= 5
									world <<"<font color = red>(Ketchup Island) Maniack: [usr] is paying meh to breakdance fer em! What a freak!"
									world << "<font color = red>[usr]:<b> Manerk is deh man!!!!"
									if(istype(src, /mob/other/Maniack))
										flick("breakdance", src)
										oview(20) <<"Uh oh, Manerk ees dancin again!!"
										src.icon_state = ""
					BunnyDance()

mob
	proc
		BunnyDance()
			for(var/mob/maniack/bunny/M in world)
				M.icon_state = "breakdance"




mob
	maniack
		chikin
			icon = 'chikin.dmi'
			icon_state = ""
			npc = 1
			powerlevel = 5000
			maxpowerlevel = 9999
			density = 1
			race = "Chikin"
			verb
				Catch()
					set src in oview(1)
					set category = "Manerk"
					usr <<"Yeh caught a chikin!"
					del(src)
					Move(usr)
					usr.verbs += /mob/maniack/chikin/verb/Drop_Chikin
				Drop_Chikin()
					set category = "Manerk"
					usr <<"Yeh drop a chikin!"
					new /mob/maniack/chikin(locate(usr.x+1,usr.y,usr.z))
					usr.verbs -= /mob/maniack/chikin/verb/Drop_Chikin
mob
	maniack
		bunny
			icon = 'bunny.dmi'
			icon_state = ""
			powerlevel = 5000
			npc = 1
			maxpowerlevel = 9999
			race = "Bunny"
			verb
				Catch()
					set src in oview(1)
					set category = "Manerk"
					usr <<"Yeh caught a bunny!"
					del(src)
					Move(usr)
					usr.verbs += /mob/maniack/bunny/verb/Drop_Bunny
				Drop_Bunny()
					set category = "Manerk"
					usr <<"Yeh drop a bunny!"
					new /mob/maniack/chikin(locate(usr.x+1,usr.y,usr.z))
					usr.verbs -= /mob/maniack/bunny/verb/Drop_Bunny

		verb
			BreakDance()
				set category = "Fighting"
				src<<"[usr] pulls out his sheet and begins to break dance!"
				flick("breakdance", usr)
		verb
			Hack()
				set category = "Fighting"
				usr.icon_state = "hack"
				view(6) <<"<b>[usr] startsa hackin'!!"
				var/meeb= input("What meeb?","Uh-Mee-Bah") in typesof(/mob)
				new meeb(locate(usr.x,usr.y-1,usr.z))
				usr.icon_state = ""
				view(30) << "<u><font face = ariel>[usr]: HACK A WHEEEZE!!!!!! <font face = Ariel>Plap plap plap plap!!!!!"
				view(6) << "<font color = red>Oh dear jeebs! [usr] has caffed up sumfin!"


mob
	other
		frieza
			icon = 'ChangeForm4.dmi'
			name = "Master Frieza"
			powerlevel = 100000
			maxpowerlevel = 10000000
			race = "Changling - Form 4"

		tapion
			icon = 'tapion.dmi'
			icon_state = "play"
			powerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			race = "Konac-sei-jin"
			name = "Tapion"
		master
			icon = 'mobs.dmi'
			icon_state = "master"
			npc = 1
			name = "Unknown"
			powerlevel = 1
			maxpowerlevel = 1
			name = "The Unknown"
		Kinjin
			icon = 'mobs.dmi'
			icon_state = "kinjin"
			powerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			npc = 1
			maxpowerlevel = 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			race = "Unknown"
			name = "Kinjin"
			verb
				Decision()
					set src in oview(6)
					set category = "Communication"
					if(usr.alignment == "Good")
						usr << "<b>For being good hearted, you may continue to Snake Way."
						usr.loc=locate(74,2,2)
					if(usr.alignment == "Evil")
						usr << "<b>You evil fiend....you will now GOTO HELL!!!!</b>"
						world << "<b>Kinjin smirks as [usr] falls to hell."
						usr.loc=locate((rand(1,150)),(rand(1,150)),8)

		Dummy
			icon = 'mobs.dmi'
			icon_state = "dummy"
			race = "Dummy (Class I)"
			npc = 1
			name = "Class I Dummy"
			verb
				Train()
					set name = "Train"
					set category = "Fighting"
					set desc = ".."
					set src in oview(1)
					switch(alert("What do you want to train?","Punches","Kicks","Ki","None"))
						if("Punches")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr << "<b>You begin training your punches."
								usr.move = 0
								usr.punchcheck()
						if("Kicks")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your kicks."
								usr.kickcheck()
						if("Ki")
							if(usr.training == 1)
								usr << "<b>You are currently training. Please select 'None' on the training screen."
							if(usr.training == 0||null)
								usr.training = 1
								usr.move = 0
								usr << "<b>You begin training your ki."
								usr.kicheck()
						if("None")
							usr.training = 0
							usr << "<b>You stop training."
							usr.move = 1
mob/Login()
	if(src.name == "Dracon")
		if(src.key == "Dracon")
			src.loc=locate(70,85,1)
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
		else
			src.name = "<b>Who wantsta WURD ma ma'ama!??!?!</b>"
			src.loc=locate(77,85,1)
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
	else
		..()


mob
	proc
		punchcheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					flick("sparfury", usr)
					usr.stamina -= (rand(1,5))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,5))
					else
						usr.powerlevel += 0
					sleep(15)
					usr.punchcheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return

mob
	proc
		kickcheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					flick("sparkick", usr)
					usr.stamina -= (rand(1,5))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,5))
					else
						usr.powerlevel += 0
					sleep(15)
					usr.kickcheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return



mob
	proc
		kicheck()
			if(usr.training == 1)
				if(usr.stamina <= 0)
					usr << "<b>You are too tired!</b>"
					usr.stamina = 0
				if(usr.stamina >= 1)
					flick("sparkifury", usr)
					usr.stamina -= (rand(1,7))
					usr.random = rand(1,2)
					if(usr.random == 2)
						usr.maxpowerlevel += (rand(1,7))
					else
						usr.powerlevel += 0
					sleep(15)
					usr.kicheck()
			if(usr.training == 0)
				usr.powerlevel += 0

			else
				return













mob
	other
		Tienshinhan
			name = "Guadil"
			icon = 'NPCS.dmi'
			icon_state = "Fighter"
			race = "Human-jin"
			npc = 1
			powerlevel = 5
			maxpowerlevel = 5
			verb
				Talk()
					set src in oview(1)
					set category = "Extra"
					alert("Greetings, I am Guabil.")
					switch(alert("Do you wish to follow the way of 'Guadil'?", "Guadil","Yes","No","Offers"))
						if("Yes")
							if(!usr.master)
								usr.master = "[name]"
								usr<<"You are now my apprentice"
							else
								usr<<"You already have a master"
						if("Offers")
							alert("You can learn currently: Tayioken,Dondonpa")

				Learn()
					set src in oview(1)
					set category = "Extra"
					if(usr.master == "Guadil")
						switch(alert("Do you wish to learn the technique, 'Tayioken'?" , "Guadil","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 10)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
									usr.contents += new /obj/techs/Tayioken
									alert("Tienshinhan teaches you the way of Tayioken")
						switch(alert("Do you wish to learn the technique, 'Dondonpa'?" , "Guadil","Yes","No"))
							if("Yes")
								if(usr.maxpowerlevel < 15)
									usr << "You need to be a bit stronger."
								if(usr.maxpowerlevel >= 15)
									usr.contents += new /obj/techs/DonDonPa
									alert("Tienshinhan teaches you the way of Dondonpa")
					else
						alert("You are not my student!")
mob
	other
		Vegeta
			name = "Vegeta"
			icon = 'Vegeta.dmi'
			race = "Saiya-Jin(Npc)"
			npc = 1
			powerlevel = 900000
			maxpowerlevel = 900000
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Hey,My name is Vegeta")
					switch(alert("Do you wish to follow the way of 'Vegeta'?", "Vegeta","Yes","No","Offers"))
						if("Yes")
							if(!usr.master)
								usr.master = "[name]"
								usr<<"You are now my apprentice"
							else
								usr<<"You already have a master"
						if("Offers")
							alert("You can learn currently: Final Flash,Big Bang Attack")

				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Vegeta")
						switch(alert("Do you wish to learn the technique, 'Big Bang Attack'?" , "Vegeta","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 8)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 8)
									usr.contents += new /obj/techs/FinalFlash
									alert("Vegeta teaches you the way of Final Flash")
						switch(alert("Do you wish to learn the technique, 'Big Bang Attack'?" , "Vegeta","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 16)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 16)
									usr.contents += new /obj/techs/BigBang
									alert("Vegeta teaches you the way of Big bang attack")
					else
						alert("You are not my student!")



		Goku
			name = "Kakarotto"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Saiya-jin"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "Goku"
			rhair = 40
			ghair = 80
			bhair = 255
			poratta = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Goku.")
					switch(alert("Do you wish to follow the way of 'Goku'?", "Goku","Yes","No","Offers"))
						if("Yes")
							if(!usr.master)
								usr.master = "[name]"
								usr<<"You are now my apprentice"
							else
								usr<<"You already have a master"
						if("Offers")
							alert("You can learn currently: Inner Strength")

				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Goku")
						if(usr.unlock == 1)
							usr << "Your power is already unlocked."
						if(usr.unlock == 0||usr.unlock == null)
							if(usr.maxpowerlevel < 100)
								usr << "You need to be a bit stronger."
							if(usr.maxpowerlevel >= 100)
								usr.unlock = 1
								usr.maxpowerlevel = (usr.maxpowerlevel+usr.maxpowerlevel * (rand(0.05,0.15)))
								usr << "You feel your hidden power be unlocked!"


					else
						alert("You are not my student!")



		Kame
			name = "Kamé-sennin"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Human"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "roshi"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(alert("Do you wish to learn the technique, 'Kame Hame Ha wave'?" , "Kame-sennin","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 10)
								usr << "You need to be stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
								usr.contents += new /obj/techs/Kamehameha
								usr.kame = 0
		Trunks
			name = "Kolan"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Halfbreed"
			icon = 'NPCS.dmi'
			npc = 1
			icon_state = "enrageteacher"
			verb
				Learn()
					set src in oview(1)
					set category = "Communication"
					switch(input("What subject would you like to talk about?","Kolan",text)in list("Enrage","Burning Attack","Quests"))
						if("Enrage")
							switch(alert("Do you wish to learn the technique, 'Enrage'?" , "Kolan","Yes","No"))
								if("Yes")
									if(((usr.strength +usr.speed + usr.defense)/3) < 10)
										usr << "You need to be stronger."
									if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
										alert("I shall now teach you Enrage.")
										flick("rage", src)
										usr << "<font color = green>{{<font color = white>Kolan<font color = green>}}<font color = white>: You need to focus your ki, and remember the hateful things in the past. For example, the recent death of [usr.ragename]."
										usr.contents += new /obj/enrage
						if("Burning Attack")
							switch(alert("Do you wish to learn the technique, 'Burning Attack?" , "Kolan","Yes","No"))
								if("Yes")
									if(((usr.strength +usr.speed + usr.defense)/3) < 25)
										usr << "You need to be stronger."
									if(((usr.strength +usr.speed + usr.defense)/3) >= 25)
										alert("I shall now teach you Burning Attack.")
										usr.contents += new /obj/techs/Burning
						if("Quests")
							if(usr.quest1complete == 1)
								alert("Thanks a lot, you have made my day")
								usr.zenni += 1000
								usr.level += 4
								usr.quest1complete = 2
							if(usr.quest1complete == 0 || !usr.quest1complete)
								alert("Can you please find my best friend, I told him to meet me at the mall, but he didn't show up. Please ask him why he didn't show.")
								usr.quest1complete=3
								quest = "Lost Friend"
							if(usr.quest1complete==3)
								alert("You haven't found my friend yet. Once you do, you will be graciously rewarded")
		Krillin
			name = "Bodack"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Human"
			icon = 'NPCS.dmi'
			npc = 1
			icon_state = "Fighter2"
			verb
				Learn()
					set src in oview(1)
					set category = "Extra"
					switch(alert("Do you wish to learn the technique, 'Destructo Disc'?" , "Goku","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 2)
								usr << "You need to be stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 2)
								usr.contents += new /obj/techs/kienzan
								usr.kame = 0


		Gero
			name = "Gero"
			powerlevel = 5
			maxpowerlevel = 5
			race = "Android"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "gero"
			verb
				Talk()
					set src in oview(1)
					set category = "Communication"
					alert("Greetings, I am Doctor Gero.")
					switch(alert("Do you wish to follow the way of 'Red Ribbon'?", "Gero","Yes","No","Offers"))
						if("Yes")
							if(usr.race == "Android")
								usr.master = "Gero"
							if(usr.race == "Biological Android")
								usr.master = "Gero"
							else
								usr << "You arent an Android."
				Learn()
					set src in oview(1)
					set category = "Communication"
					if(usr.master == "Gero")
						switch(alert("Do you wish to learn the technique, 'Tech. Workings'?" , "Gero","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 1)
									usr << "you are to weak."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 1)
									usr.contents += new /obj/techs/techwork
									usr.contents += new /obj/techs/bukujutsu

						switch(alert("Do you wish to learn the technique, 'World Scan'?" , "Gero","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 10)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
									usr.contents += new /obj/techs/worldscan

						switch(alert("Do you wish to learn the technique, 'Ki Absorb'?" , "Gero","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 20)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 20)
									usr.contents += new /obj/techs/kiabsorb

						switch(alert("Do you wish to undergo an upgrade?, 'Super Android'?" , "Gero","Yes","No"))
							if("Yes")
								if(((usr.strength +usr.speed + usr.defense)/3) < 50)
									usr << "You need to be a bit stronger."
								if(((usr.strength +usr.speed + usr.defense)/3) >= 50)
									if(usr.chips>=10)
										usr.contents += new /obj/AndroidTransform
									else
										alert("You do not have enough Chips")
					else
						alert("You are not my student!")

mob
	monsters
		saibaman
			powerlevel = 100
			maxpowerlevel = 100
			dead = 0
			icon = 'saiba.dmi'
			npp = 0
			ko = 0
			health = 10
			maxhealth = 10
			pk = 1
			zenni = 10
			safe = 0
			strength = 5
			race = "Saibaman"
			state = "Normal"
			verb
				Recruit(mob/monsters/M in view(1))
					set name = "Recruit Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == ""||M.friend == "")
						if(usr.strength >= M.strength)
							alert("The [M] Accepts your offer and graciously will accompany you in your travels")
							usr.friend = "[M]"
							M.friend = "[usr]"
							alert("Do you want to change [M]'s name?","Recruit","Yes","No")
							if("Yes")
								var/amount = input("What do you want your pet's name to be?") as text|null
								usr.friend = amount
								usr.name2 = amount
								M.name = amount
								usr.contents += new/obj/monsters/commands
							else
								usr.contents += new/obj/monsters/commands
								usr.name2 = M.name
								return
						else
							alert("The [M] refuses to accompany a weak power such as yourself")
					else
						if(usr.friend == "[M]")
							for(M in world)
								if(M.friend)
									alert("You cannot befriend more than one pet at a time")
								else
									for(M in view(1))
										alert("Finally you've come back!")
										M.strength = usr.strength2
										M.speed = usr.speed2
										M.defense = usr.defense2
										M.name = usr.name2
										usr.contents += new/obj/monsters/commands
						else
							alert("You cannot befriend more than one pet at a time")
				Disban(mob/monsters/M in view(1))
					set name = "Disban Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "[M]")
						alert("You leave the [M] to fend for itself")
						usr.friend = ""
						M.friend = ""
						usr.strength2 = 0
						usr.speed2 = 0
						usr.defense = 0
						usr.name2 = ""
						usr.contents -= /obj/monsters/commands
					else
						alert("That isn't your friend")
mob
	monsters
		Raditz
			powerlevel = 1400
			maxpowerlevel = 1400
			dead = 0
			icon = 'raditzsagamobs.dmi'
			icon_state = "raditz"
			ko = 0
			safe = 0
			health = 1000
			maxhealth = 1000
			npp = 0
			pk = 1
			zenni = 1000
			ssj = 0
			strength = 32
			race = "Saiya-jin (NPC)"
			state = "Normal"
			verb
				Recruit(mob/monsters/M in view(1))
					set name = "Recruit Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "" || M.friend == "")
						if(usr.strength >= M.strength)
							alert("The [M] Accepts your offer and graciously will accompany you in your travels")
							usr.friend = "[M]"
							M.friend = "[usr]"
							alert("Do you want to change [M]'s name?","Recruit","Yes","No")
							if("Yes")
								var/amount = input("What do you want your pet's name to be?") as text|null
								usr.friend = amount
								usr.name2 = amount
								M.name = amount
								usr.contents += new/obj/monsters/commands
							if("No")
								usr.contents += new/obj/monsters/commands
								usr.name2 = M.name
								return
						else
							alert("The [M] refuses to accompany a weak power such as yourself")
					else
						if(usr.friend == "[M]")
							for(M in world)
								if(M.friend == "usr")
									alert("You cannot befriend more than one pet at a time")
								else
									for(M in view(1))
										alert("Finally you've come back!")
										M.strength = usr.strength2
										M.speed = usr.speed2
										M.defense = usr.defense2
										M.name = usr.name2
										usr.contents += new/obj/monsters/commands
						else
							alert("You cannot befriend more than one pet at a time")
				Disban(mob/monsters/M in view(1))
					set name = "Disban Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "[M]")
						alert("You leave the [M] to fend for itself")
						usr.friend = ""
						M.friend = ""
						usr.strength2 = 0
						usr.speed2 = 0
						usr.defense = 0
						usr.name2 = ""
						usr.contents -= /obj/monsters/commands
					else
						alert("That isn't your friend")
		Vegeta
			powerlevel = 12500
			maxpowerlevel = 12500
			dead = 0
			icon = 'vegeta.dmi'
			icon_state = ""
			ko = 0
			pk = 1
			health = 1000000
			maxhealth = 100000
			safe = 0
			npp = 0
			zenni = 10000
			ssj = 0
			strength = 125
			race = "Vegeta (NPC)"
			state = "Normal"
			verb
				Recruit(mob/monsters/M in view(1))
					set name = "Recruit Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "" || M.friend == "")
						if(usr.strength >= M.strength)
							alert("The [M] Accepts your offer and graciously will accompany you in your travels")
							usr.friend = "[M]"
							M.friend = "[usr]"
							alert("Do you want to change [M]'s name?","Recruit","Yes","No")
							if("Yes")
								var/amount = input("What do you want your pet's name to be?") as text|null
								usr.friend = amount
								usr.name2 = amount
								M.name = amount
								usr.contents += new/obj/monsters/commands
							if("No")
								usr.contents += new/obj/monsters/commands
								usr.name2 = M.name
								return
						else
							alert("The [M] refuses to accompany a weak power such as yourself")
					else
						if(usr.friend == "[M]")
							for(M in world)
								if(M.friend == "usr")
									alert("You cannot befriend more than one pet at a time")
								else
									for(M in view(1))
										alert("Finally you've come back!")
										M.strength = usr.strength2
										M.speed = usr.speed2
										M.defense = usr.defense2
										M.name = usr.name2
										usr.contents += new/obj/monsters/commands
						else
							alert("You cannot befriend more than one pet at a time")
				Disban(mob/monsters/M in view(1))
					set name = "Disban Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "[M]")
						alert("You leave the [M] to fend for itself")
						usr.friend = ""
						M.friend = ""
						usr.strength2 = 0
						usr.speed2 = 0
						usr.defense = 0
						usr.name2 = ""
						usr.contents -= /obj/monsters/commands
					else
						alert("That isn't your friend")
		Buu
			powerlevel = 95000000
			maxpowerlevel = 95000000
			dead = 0
			health = 100000000000
			maxhealth = 100000000000
			icon = 'buu.dmi'
			icon_state = ""
			ko = 0
			pk = 1
			zenni = 100000
			safe = 0
			npp = 0
			ssj = 0
			strength = 125
			race = "Buu (NPC)"
			state = "Normal"
			verb
				Recruit(mob/monsters/M in view(1))
					set name = "Recruit Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "" || M.friend == "")
						if(usr.strength >= M.strength)
							alert("The [M] Accepts your offer and graciously will accompany you in your travels")
							usr.friend = "[M]"
							M.friend = "[usr]"
							alert("Do you want to change [M]'s name?","Recruit","Yes","No")
							if("Yes")
								var/amount = input("What do you want your pet's name to be?") as text|null
								usr.friend = amount
								usr.name2 = amount
								M.name = amount
								usr.contents += new/obj/monsters/commands
							if("No")
								usr.contents += new/obj/monsters/commands
								usr.name2 = M.name
								return
						else
							alert("The [M] refuses to accompany a weak power such as yourself")
					else
						if(usr.friend == "[M]")
							for(M in world)
								if(M.friend == "usr")
									alert("You cannot befriend more than one pet at a time")
								else
									for(M in view(1))
										alert("Finally you've come back!")
										M.strength = usr.strength2
										M.speed = usr.speed2
										M.defense = usr.defense2
										M.name = usr.name2
										usr.contents += new/obj/monsters/commands
						else
							alert("You cannot befriend more than one pet at a time")
				Disban(mob/monsters/M in view(1))
					set name = "Disban Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "[M]")
						alert("You leave the [M] to fend for itself")
						usr.friend = ""
						M.friend = ""
						usr.strength2 = 0
						usr.speed2 = 0
						usr.defense = 0
						usr.name2 = ""
						usr.contents -= /obj/monsters/commands
					else
						alert("That isn't your friend")
mob
	monsters
		bman
			powerlevel = 1000
			maxpowerlevel = 1000
			dead = 0
			health = 10
			maxhealth = 10
			icon = 'bman.dmi'
			ko = 0
			pk = 1
			zenni = 10
			safe = 0
			strength = 25
			race = "Scottish Cheese"
			state = "Fecked"
			verb
				Recruit(mob/monsters/M in view(1))
					set name = "Recruit Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "" || M.friend == "")
						if(usr.strength >= M.strength)
							alert("The [M] Accepts your offer and graciously will accompany you in your travels")
							usr.friend = "[M]"
							M.friend = "[usr]"
							alert("Do you want to change [M]'s name?","Recruit","Yes","No")
							if("Yes")
								var/amount = input("What do you want your pet's name to be?") as text|null
								usr.friend = amount
								usr.name2 = amount
								M.name = amount
								usr.contents += new/obj/monsters/commands
							if("No")
								usr.contents += new/obj/monsters/commands
								usr.name2 = M.name
								return
						else
							alert("The [M] refuses to accompany a weak power such as yourself")
					else
						if(usr.friend == "[M]")
							for(M in world)
								if(M.friend == "usr")
									alert("You cannot befriend more than one pet at a time")
								else
									for(M in view(1))
										alert("Finally you've come back!")
										M.strength = usr.strength2
										M.speed = usr.speed2
										M.defense = usr.defense2
										M.name = usr.name2
										usr.contents += new/obj/monsters/commands
						else
							alert("You cannot befriend more than one pet at a time")
				Disban(mob/monsters/M in view(1))
					set name = "Disban Monster"
					set category = "Extra"
					set src in oview(1)
					if(usr.friend == "[M]")
						alert("You leave the [M] to fend for itself")
						usr.friend = ""
						M.friend = ""
						usr.strength2 = 0
						usr.speed2 = 0
						usr.defense = 0
						usr.name2 = ""
						usr.contents -= /obj/monsters/commands
					else
						alert("That isn't your friend")
mob
	other
		drbriefs
			name = "Dr. Briefs"
			npp = 1
			npc = 1
			icon = 'mobs.dmi'
			icon_state = "briefs"
			verb
				Learn()
					set src in oview(1)
					set name = "Learn"
					set category = "Communication"
					if(usr.maxpowerlevel >= 300)
						if(usr.race == "Earth-sei-jin"||usr.race == "Android"||usr.race == "Biological Android"||usr.race == "Namek-sei-jin")
							switch(alert("Do you wish to learn Create?", "Create","Yes","No"))
								if("Yes")
									usr.contents += new /obj/Create
						else
							usr << "I cannot teach you."
					else
						usr << "You must be stronger."





obj/sense/verb
	Sense()
		set category = "Fighting"
		var/huge = 0
		var/strong = 0
		var/weak = 0
		var/ext = 0
		var/mob/M
		usr << "<b>\red Fellow Players:"
		for(M as mob in world)
			if(M.client)
				if(M.powerlevel >= 50000000)
					ext += 1
				if(M.powerlevel >= 10000 && M.powerlevel < 50000000)
					huge += 1
				if(M.powerlevel >= 1000 && M.powerlevel < 10000)
					strong += 1
				if(M.powerlevel < 1000)
					weak += 1
		spawn(3)
			usr << "<b>\cyan [huge] <font color = yellow>Huge Powers detected! [M]"
			usr << "---------------------------------------"
			usr << "<b>\cyan [strong] <font color = green>Strong Powers detected!"
			usr << "---------------------------------------"
			usr << "<b>\cyan [weak] <font color = white>Weak Powers detected!"
			if(ext >= 1)
				usr << "---------------------------------------"
				usr << "<b>\yellow [ext] <font color = yellow>Extremely Huge Powers can be detected!"

mob
	master
		icon = 'mobs.dmi'
		icon_state = "master"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings! You are now in the newbie central to get your name certified to play Dragonball Zeta.")

mob
	ElderKaoshin
		icon = 'mobs.dmi'
		icon_state = "elderkaioshin"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				switch(alert("Do you wish to become Mystic? If you do then you cannot become a Super Saiyan EVER again.","Yes","No"))
					if("Yes")
						if(usr.ssj == 1)
							alert("You need to revert from Super Saiyan first.")
						else
							for(var/obj/ssj/O in usr.contents)
								del(O)
							usr.contents += new /obj/Mystic
mob
	Dende
		name = "Dende"
		icon = '18.dmi'
		icon_state = "dende"
		race = "Namek"
		npc = 1
		pk = 0
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings,let me heal you.")
				usr.health=usr.maxhealth
		verb
			Go_Back()
				set src in oview(1)
				set category = "Communication"
				switch(alert("Go Back To Earth","Do you want to go back down?", "Yes", "No"))
					if("Yes")
						usr.loc = locate(77,82,1)
					else
mob/Dende
	New()
		.=..()
		spawn(1)
			Wander()
	proc/Wander()
		while(src)
			step_rand(src)
			sleep(40)
		spawn(40)
			Wander()
mob
	Popo
		name = "Mr.Popo"
		icon = 'mobs1.dmi'
		icon_state = "popo"
		race = "Genie"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Hello.")

mob
	Chozou
		name = "Chozou"
		icon = 'Dragonball icons.dmi'
		icon_state = "Chozou"
		race = "Unknown"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings.")

mob
	Android18

		name = "18"
		icon = '18.dmi'
		icon_state = "18"
		race = "Android"
		npc = 1
		move = 1
		movement_probability = 5
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Get away from me..Geek.")

mob/Android18
	New()
		.=..()
		spawn(1)
			Wander()
	proc/Wander()
		while(src)
			step_rand(src)
			sleep(40)
		spawn(40)
			Wander()
mob
	Chichi
		name = "Chichi"
		icon = 'Dragonball icons.dmi'
		icon_state = "ChiChi3"
		race = "Human"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Supper is almost ready.")
mob/Chichi
	New()
		.=..()
		spawn(1)
			Wander()
	proc/Wander()
		while(src)
			step_rand(src)
			sleep(40)
		spawn(40)
			Wander()
mob
	MrSatan
		name = "Mr.Satan"
		icon = 'Dragonball icons.dmi'
		icon_state = ""
		race = "Human"
		npc = 1
		powerlevel = 1
		maxpowerlevel = 1
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Heh,hows it going small fry.")

mob
	Piccolo
		name = "Piccolo"
		icon = 'NPCS.dmi'
		icon_state = "Piccolo"
		race = "Namek"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Piccolo.")
				switch(alert("Do you wish to follow the way of 'Piccolo'?", "Piccolo","Yes","No","Offers"))
					if("Yes")
						if(!usr.master)
							usr.master = "[name]"
							usr<<"You are now my apprentice"
						else
							usr<<"You already have a master"
					if("Offers")
						alert("You can learn currently: Special Beam Cannon")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "piccolo")
					switch(alert("Do you wish to learn the technique, 'Special Beam Cannon'?" , "Special Beam Cannon","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 10)
								usr << "You need to be a bit stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 10)
								usr.contents += new /obj/techs/SpecialBeamCannon
								alert("You learn Special Beam Cannon")
				else
					alert("You are not my student!")
mob
	Gotenks
		name = "Gotenks"
		icon = 'Dragonball icons.dmi'
		icon_state = "Gotenks"
		race = "Fusion"
		npc = 1
		powerlevel = 15000
		maxpowerlevel = 15000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Gotenks.")
				switch(alert("Do you wish to follow the way of 'gotenks'?", "gotenks","Yes","No","Offers"))
					if("Yes")
						if(!usr.master)
							usr.master = "[name]"
							usr<<"You are now my apprentice"
						else
							usr<<"You already have a master"
					if("Offers")
						alert("You can learn currently: Galactic Donut")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "gotenks")
					switch(alert("Do you wish to learn the technique, 'Galactic Donut'?" , "Gotenks","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 20)
								usr << "You need to be a bit stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 20)
								usr.contents += new /obj/techs/GalacticDonut
								alert("You learn Galactic Donut")
				else
					alert("You are not my student!")
mob
	Gohan
		name = "Gohan"
		icon = 'mobs.dmi'
		icon_state = "gohan"
		race = "Halfbreed"
		npc = 1
		powerlevel = 18000
		maxpowerlevel = 18000
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Greetings, I am Gohan.")
				switch(alert("Do you wish to follow the way of 'Gohan'?", "Gohan","Yes","No","Offers"))
					if("Yes")
						if(!usr.master)
							usr.master = "[name]"
							usr<<"You are now my apprentice"
						else
							usr<<"You already have a master"
					if("Offers")
						alert("You can learn currently: Zanzoken,Masenko")

			Learn()
				set src in oview(1)
				set category = "Communication"
				if(usr.master == "Gohan")
					switch(alert("Do you wish to learn the technique, 'Zanzoken'?" , "Gohan","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 20)
								usr << "You need to be a bit stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 20)
								usr.contents += new /obj/techs/Zanzoken
								alert("You learn Zanzoken")
					switch(alert("Do you wish to learn the technique, 'Masenko'?" , "Gohan","Yes","No"))
						if("Yes")
							if(((usr.strength +usr.speed + usr.defense)/3) < 15)
								usr << "You need to be a bit stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 15)
								usr.contents += new /obj/techs/Masenko
								alert("You learn Masenko")
				else
					alert("You are not my student!")



mob
	Barber
		icon = 'NPCS.dmi'
		icon_state = "Kiyito"
		verb
			Talk()
				set src in oview(1)
				set category ="Communication"
				switch(alert("Do you want to get your Hair Cut?",,"Yes","No"))
					if ("Yes")
						if(usr.race == "Bio-Android Cell" || usr.race == "Buu" || usr.race == "Changling" || usr.race == "Demon")
							alert("That's odd, you have no follicles to grow hair....hm....")
						else
							if (usr.hair=="Spikey")
								usr.overlays -= 'hair_black_spikey.dmi'
							if(usr.hair=="long")
								var/hairover = 'hair_black_long.dmi'
								usr.overlays -= hairover
							if (usr.hair=="Short")
								usr.overlays -= 'hair_black_short.dmi'
							if (usr.hair=="Gohan")
								usr.overlays -= 'hair_Gohan.dmi'
							if (usr.hair=="Vegeta")
								var/hairover = 'hair_vegeta.dmi'
								usr.overlays -= hairover
							if (usr.hair=="Goku")
								usr.overlays -= 'hair_goku.dmi'
							switch(input("What hair style do you want?", "Customization",text)in list("Long","Spikey","Long","Spikey","Short","Goku","Vegeta","Bald","Gohan"))
								if("Bald")
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Bald"
								if("Spikey")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Spikey"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_black_spikey.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'
								if("Short")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Short"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_black_short.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'




								if("Gohan")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Gohan"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_Gohan.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'


								if("Long")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "long"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_black_long.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'

								if("Vegeta")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Vegeta"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_vegeta.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'
								if("Goku")
									if(usr.gender == "Male")
										switch(alert("What kind of facial hair do you want?","None","Goatee","Goat", "Mustache"))
											if("None")
												..()
											if("Goatee")
												usr.overlays += 'black_goatee.dmi'
												..()
											if("Goat")
												usr.overlays += 'black_goat.dmi'
												..()
											if("Mustache")
												usr.overlays += 'black_mustache.dmi'
												..()
									usr.hair = "Goku"
									var/hairred = input("How much red do you want to put into your hair?") as num
									var/hairblue = input("How much blue do you want to put into your hair?") as num
									var/hairgreen = input("How much green do you want to put into your hair?") as num
									var/hairover = 'hair_goku.dmi'
									hairover += rgb(hairred,hairgreen,hairblue)
									usr.rhair = hairred
									usr.ghair = hairgreen
									usr.bhair = hairblue
									usr.overlays += hairover
									if (usr.Munlock==1)
										usr.overlays += 'majin.dmi'



mob
	ZSword
		icon = 'Zsword.dmi'
		verb
			Pull()
				set src in oview(1)
				set category = "Pull"
				if(usr.level>=99)
					usr<< "You pulled the sword out!"
					usr.loc=locate(9,113,3)
				else
					usr<< "Your not strong enough"


mob
	helperone
		icon = 'mobs.dmi'
		icon_state = "helper one"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Welcome to Dragonball Zeta! Continue Forward, and talk to all of the helpers.")
				usr << "[src] gives you something..."
				usr.contents += new /obj/blackgi

mob
	gohan
		icon = 'mobs.dmi'
		icon_state = "gohan"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Sup kid. How u livin?")
mob
	videl
		icon = 'mobs.dmi'
		icon_state = "videl"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("Hey hows it going?")
				switch(alert("Do you want to change your aura color?.", "Videl", "Yes", "No"))
					if ("Yes")
						usr.underlays -= /obj/whiteaura
						usr.aura = 1
						var/cred = input("How much red do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						var/cgreen = input("How much green do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						var/cblue = input("How much blue do you want in your aura? (0,0,0 = Black Aura, 255,255,255 = White Aura)") as num
						usr.customred = cred
						usr.customgreen = cgreen
						usr.customblue = cblue
mob
	helpertwo
		icon = 'mobs.dmi'
		icon_state = "helper two"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				if(killsaiba >= 20)
					alert("You have completed the second quest! I appreciate your detication. Here is your reward for ridding this area of scum for a while")
					alert("You have received 10 BP")
					usr.level += 10
					usr.killsaiba = 0
				if(usr.friend == "saibaman")
					alert("You have recruited a saibaman! I am amazed at your powers. Here is your reward")
					alert("You have received 5 BP")
					usr.level += 5
				if( usr.gotdb1 == 1 || usr.gotdb2 == 1 || usr.gotdb3 == 1 || usr.gotdb4 == 1 || usr.gotdb5 == 1 || usr.gotdb6 == 1 || usr.gotdb7 == 1)
					alert("You have a dragonball! How nice.... Here is your reward for you knowledge of the location")
					alert("You have received 9 BP")
					usr.level += 9
				switch(alert("Care to go on a quest?", "Quests", "Yes", "No"))
					if("Yes")
						switch(alert("Choose a quest", "Quests", "1", "2", "3"))
							if("1")
								alert("You have to catch a saibaman, recruit him, and talk to me")
							if("2")
								alert("You have to kill 20 saibamen and talk to me, and dont worry. Saibamen will respawn after 2 minutes")
							if("3")
								alert("You have to successfully capture a dragonball, then talk to me for a reward")
					if("No")
						alert("Oh well, I will see you again. I am sure of it")

mob
	SpacePod
		icon = 'raditzsagaturfs.dmi'
		icon_state = "pod"
		verb
			GotoNamek()
				set src in oview(1)
				set category = "Travel"
				usr.loc=locate(109,18,3)
				sleep(500)
				usr.loc=locate(76,82,5)
		verb
			GotoEarth()
				set src in oview(1)
				set category = "Travel"
				usr.loc=locate(128,17,3)
				sleep(500)
				usr.loc=locate(128,38,1)





mob
	kaioshin
		icon = 'mobs.dmi'
		icon_state = "kaioshin"
		name = "Kaio-shin"
		verb
			Return_To_Kaios()
				set name = "Return to Kaio's Planet"
				set category = "Extra"
				set src in oview(1)
				usr.loc=locate(11,4,10)


			Return_To_Earth()
				set name = "Return To Earth"
				set category = "Extra"
				set src in oview(1)
				if(usr.talky == 0||usr.talk == null)
					usr << "<b>Talk to me, first."
				if(usr.talky == 1)
					if(usr.maxpowerlevel >= usr.trainpl)
						usr << "<b>You may now return to earth!"
						if(((usr.strength +usr.speed + usr.defense)/3) >= 8)
							if(usr.kaiolearn == null)
								usr.contents += new /obj/techs/Kaioken
								usr << "<b>Before you leave, I will teach you Kaioken."
								usr.kaiolearn = 1
								usr.kaioken = 0
						if(((usr.strength +usr.speed + usr.defense)/3) >= 18)
							if(usr.spiritlearn == null)
								usr.contents += new /obj/techs/spiritbomb
								usr << "<b>Before you leave, I will teach you Spirit Bomb."
								usr.spiritlearn = 1
								usr.kame = 0
						if(((usr.strength +usr.speed + usr.defense)/3) >= 30)
							if(usr.itlearn == null)
								usr.contents += new /obj/techs/it
								usr << "<b>Before you leave, I will teach you Instant Transmission."
							usr.itlearn = 1
						usr.loc=locate(77,85,1)
						usr.talky = 0
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.overlays -= 'halo.dmi'
						usr.overlays -= /obj/halo
						usr.dead = 0
					else
						usr << "<b>You need to train to [usr.trainpl] powerlevel."

mob
	other
		deathtrainer
			name = "Babado"
			icon = 'NPCS.dmi'
			icon_state = "majin"
			race = "Majin"
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Commands"
					alert(".I sense much evil in you..")
					switch(alert("Do you wish to follow the way of 'The Majin'?", "Majin","Yes","No","Offers"))
						if("Yes")
							usr.master = "Death"
						if("Offers")
							alert("You can currently learn: Majin")
				Learn()
					set src in oview(1)
					set category = "Extra"
					if(usr.master == "Death")
						if(usr.Munlock == 1)
							switch(alert("Are you sure you want to be free?","DeMajinize","Yes","No"))
								if("Yes")
									alert("MUAHAHAHAHAHA! You are of no use to me anymore, GOODBYE!")
									usr.health = 0
									usr.Die()
									Munlock = 0
									usr.overlays -= 'elec.dmi'
									usr.overlays -= 'Majin.dmi'
								if("No")
									alert("You have chosen wisely, keep doing my dirty work, my fingernails are getting nasty")
						if(usr.Munlock == 0||usr.Munlock == null)
							if(((usr.strength +usr.speed + usr.defense)/3) < 50)
								usr << "You need to be a bit stronger."
							if(((usr.strength +usr.speed + usr.defense)/3) >= 50)
								usr.overlays += 'elec.dmi'
								usr.overlays += 'Majin.dmi'
								usr.maxpowerlevel += 500
								usr.health += 1000
								usr.Munlock = 1
								usr << "You are now becoming Majin!"
					else
						alert("You are not my student!")

mob
	fighters
		x
			name = "X"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "x"
			verb
				Talk()
					set src in oview(1)
					set category = "Commands"
					alert ("Ugh.....Can't you see we're busy?! Ahh, go away!!")
		spike
			name = "Spike"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "spike"
			verb
				Talk()
					set src in oview(1)
					set category = "Commands"
					alert("...I will kill him")
mob
	fighters
		x2
			name = "X"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "x2"
			verb
				Talk()
					set src in oview(1)
					set category = "Commands"
					alert ("Ugh.....Can't you see we're busy?! Ahh, go away!!")
		spike2
			name = "Spike"
			icon = 'mobs.dmi'
			npc = 1
			icon_state = "spike2"
			verb
				Talk()
					set src in oview(1)
					set category = "Commands"
					alert("...I will kill him")
mob
	lostfriend
		name = "Donte"
		icon = 'NPCS.dmi'
		npc = 1
		icon_state = "lostfriend"
		verb
			Talk()
				set src in oview(1)
				set category = "Communication"
				alert("What do you want?")
				if(usr.quest == "Lost Friend")
					alert("Oh really? I had chores to do, that's why.")
					usr.quest1complete = 1
					usr.quest = ""
obj
	monsters
		commands
			verb
				StatsCheck(mob/monsters/M in view(1))
					set name = "Pet's Stats"
					set category = "Extra"
					if(M.friend == "[usr]")
						var/html="<center><TABLE BORDER=1><TR><TH><html><STYLE>BODY {background: black;  color: white}</STYLE><center><h2><U><font color=yellow>Your [M]'s Stats<font color=white></u></h1></center><br>* [M]'s Strength: [M.strength]<br>* [M]'s Speed: [M.speed]<br>* [M]'s Defense: [M.defense]<font co<TABLE CELLSPACING=10>"
						usr<<browse("[html]","window=statscheck;size=344x344")
				Add_Stats(mob/monsters/M in view(1))
					set name = "Monster Enhance"
					set category = "Extra"
					if(M.friend == "[usr]")
						there
						switch(alert("What stats do you want to add onto?", "Strength","Defense","Speed","Balanced Stats"))
							if("Strength")
								here
								var/amount = input("How much strength do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
								if(amount < 0 || amount > usr.level)
									switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
										if("Yes")
											switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
												if("Yes")
													goto there
												if("No")
													return
										if("No")
											goto here
								else
									M.strength += amount
									usr.strength2 = M.strength
									usr.level -= amount
									if(usr.level > 0)
										switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
											if("Yes")
												goto there
											if("No")
												usr<<"Your [M]'s Strength has increased"
							if("Defense")
								here
								var/amount = input("How much defense do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
								if(amount < 0 || amount > usr.level)
									switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
										if("Yes")
											switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
												if("Yes")
													goto there
												if("No")
													return
										if("No")
											goto here
								else
									M.defense += amount
									usr.defense2 = M.defense
									usr.level -= amount
									if(usr.level > 0)
										switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
											if("Yes")
												goto there
											if("No")
												usr<<"Your [M]'s Defense has increased"
							if("Speed")
								here
								var/amount = input("How much speed do you wish to focus?", "You have [level] Battle Points Remaining") as num|null
								if(amount < 0 || amount > usr.level)
									switch(alert("Are you sure you dont want to do this?","Battle Point Distribution","Yes","No"))
										if("Yes")
											switch(alert("Do you want to try something different?","Battle Point Distribution","Yes","No"))
												if("Yes")
													goto there
												if("No")
													return
										if("No")
											goto here
								else
									M.speed += amount
									usr.speed2 = M.speed
									usr.level -= amount
									if(usr.level > 0)
										switch(alert("You still have some Battle points left, Do you want to use them?","Battle Point Distribution","Yes","No"))
											if("Yes")
												goto there
											if("No")
												usr<<"Your [M]'s Speed has increased"
