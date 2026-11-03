
mob/var
	plbackup=0
	kibackup=0
	strbackup=0
	defbackup=0


mob/NPC
	Omni_King
		name = "Omni King"
		icon = 'Omni_King.dmi'
		density = 1
		safe = 1
		frozen = 1
		energy_code = 1234567
		New()
			..()
			src.CreateName()
		verb
			Talk()
				set src in oview(1)
				set category = null
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Talked to Vegeta")
				if(usr.talking)
					usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
					return
				if(usr.isrebirthing)
					return
				usr.isrebirthing=1
				usr.talking = 1
				//spawn(30)usr.talking=0
				var/rbornot = 0
				if(usr.rebirths==0 && usr.level >= 50000)
					rbornot = 1
				if(usr.rebirths==1 && usr.level >= 100000)
					rbornot = 1
				if(usr.rebirths==2 && usr.level >= 150000)
					rbornot = 1
				if(usr.rebirths==3 && usr.level >= 200000)
					rbornot = 1
				if(usr.rebirths==4 && usr.level >= 250000)
					rbornot = 1
				if(usr.rebirths==5 && usr.level >= 300000)
					rbornot = 1
				if(usr.rebirths>=6 && usr.level >= 300000)
					rbornot = 1
				/*
				if(usr.rebirths==7 && usr.level >= 400000)
					rbornot = 1
				if(usr.rebirths==8 && usr.level >= 450000)
					rbornot = 1
				if(usr.rebirths==9 && usr.level >= 500000)
					rbornot = 1
				if(usr.rebirths>=10 && usr.level >= 500000)
					rbornot = 1
					*/
				if(rbornot==0)
					usr << "<font color = white><b><BIG>\icon[src]</BIG> Omni King</white> Hi! When you have grown strong enough I will grant you a new life, with greater potential!"
					usr << "<font color = green><b>First rebirth:</b> Level 50,000"
					usr << "<font color = green><b>Rebirths after first rebirth:</b> another 50k from the last rebirths level, maxing out at 300k however you continue to gain Rebirth benefits until 10 rebirths"
				//	usr << "<font color = green><b>Second rebirth:</b> Level 100,000"
				//	usr << "<font color = green><b>Third-???? rebirth:</b> Level 150,000"
					usr << "<font color = red><b>You have rebirthed <font color = yellow>[usr.rebirths]<font color = red> times!</b>"
					spawn(10) usr.talking = 0
					spawn(1) usr.isrebirthing = 0
					return
				else
					switch(input("Would you like to rebirth?") in list ("Yes","No"))
						if("Yes")
							if(usr.in_party)
								usr << "You must leave your party first!"
								usr.talking = 0
								usr.isrebirthing = 0
								return

							spawn(5) usr.talking = 0
							usr.overlays -= usr.hair_icon
							for(var/obj/Technique/T in usr.contents)
								del T
							usr.rebirthtime()
						if("No")
							usr.talking = 0
							usr.isrebirthing = 0

/*

mob/verb/openracepick()
	while(!src.HasCreated)
//		world << "SLEEP"
		if(!usr)
//			usr << "BREAK"
			break
		sleep(20)
	usr.HasCreated = 0
	src.Stat_Point_Window_Refresh()
	winshow(usr,"multis",1)
	src.Stat_Point_Window_Refresh()
	//winshow(usr,"default",1)
*/
mob/proc/rebirthtime()
	src.HasCreated = 0
	winshow(src,"default",0)
	winshow(src,"RaceRebirth",1)


mob
	proc
		Choose_Base_Rebirth()

			set hidden = 1
			if(src.newrace=="Saibaman"||src.newrace=="Changeling"||src.newrace=="Demon"||src.newrace=="Dragon"||src.newrace=="Heran"||src.newrace=="Kai"||src.newrace=="Konat"||src.newrace=="Majin"||src.newrace=="Majin Wizard"||src.newrace=="Namekian"||src.newrace=="Tuffle"||src.newrace=="Alien")
				src.CreateCharRebirth()
				return
			if(src.newrace=="Feline")
				switch(input("Which type (color) would you like to be? Destructive = Beerus, Chaotic = Darker Tone") in list ("Destructive","Chaotic"))
					if("Destructive")
						src.newskin="Destructive"
					if("Chaotic")
						src.newskin="Chaotic"
				src.CreateCharRebirth()
				return
			if(src.newrace=="Android")
				switch(input("Which type would you like to be? Android, Gluttonous (Android 21)") in list ("Android","Gluttonous (Android 21)"))
					if("Gluttonous (Android 21)")
						src.newtype="Gluttonous"
						switch(input("Choose your base design","Base Design") in list("Tan Female","White Female","Dark Female","Tan Male","White Male","Dark Male"))
							if("Tan Female")
								src.newskin="tanf21"
								src.skin = "tanf21"
								src.gender2 = "female"
							if("White Female")
								src.newskin="whitef21"
								src.skin = "whitef21"
								src.gender2 = "female"
							if("Dark Female")
								src.newskin="darkf21"
								src.skin = "darkf21"
								src.gender2 = "female"
							if("Tan Male")
								src.newskin="tanm21"
								src.skin = "tanm21"
								src.gender2 = "male"
							if("White Male")
								src.newskin="whitem21"
								src.skin = "whitem21"
								src.gender2 = "male"
							if("Dark Male")
								src.newskin="darkm21"
								src.skin = "darkm21"
								src.gender2 = "male"



						switch(input("Choose your hair design","Hair Design") in list("Bald","Goku","Vegeta","Teen Gohan","Adult Gohan","Future Gohan","Hercule","Raditz","Teen Trunks","Female Long","Female Ponytail"))
							if("Bald")
								src.newhair="Bald"
							if("Goku")
								src.newhair="Goku"
							if("Vegeta")
								src.newhair="Vegeta"
							if("Teen Gohan")
								src.newhair="Teen Gohan"
							if("Adult Gohan")
								src.newhair="Adult Gohan"
							if("Future Gohan")
								src.newhair="Future Gohan"
							if("Hercule")
								src.newhair="Herule"
							if("Teen Trunks")
								src.newhair="Teen Trunks"
							if("Female Long")
								src.newhair="Female Long"
							if("Female Ponytail")
								src.newhair="Female Ponytail"
							if("Raditz")
								src.newhair="Raditz"
					//	alert("newskin: [src.newskin]")
						src.CreateCharRebirth()
						return

				//	if("Chaotic")
				//		src.newskin="Chaotic"

			if(src.newrace=="Bio Android")
				switch(input("Choose what color you'd like to be","Biological Android Color") in list("Green","Blue"))
					if("Green")
						src.newskin="green"

					if("Blue")
						src.newskin="blue"
				src.CreateCharRebirth()
				return
			else

				switch(input("Choose your base design","Base Design") in list("Tan Male","White Male","Dark Male","Tan Female","White Female","Dark Female"))
					if("Tan Male")
						src.newskin="tan"
					if("White Male")
						src.newskin="white"
					if("Dark Male")
						src.newskin="dark"
					if("Tan Female")
						src.newskin="tanf"
					if("White Female")
						src.newskin="whitef"
					if("Dark Female")
						src.newskin="darkf"
				switch(input("Choose your hair design","Hair Design") in list("Bald","Goku","Vegeta","Teen Gohan","Adult Gohan","Future Gohan","Hercule","Raditz","Teen Trunks","Female Long","Female Ponytail"))
					if("Bald")
						src.newhair="Bald"
					if("Goku")
						src.newhair="Goku"
					if("Vegeta")
						src.newhair="Vegeta"
					if("Teen Gohan")
						src.newhair="Teen Gohan"
					if("Adult Gohan")
						src.newhair="Adult Gohan"
					if("Future Gohan")
						src.newhair="Future Gohan"
					if("Hercule")
						src.newhair="Herule"
					if("Teen Trunks")
						src.newhair="Teen Trunks"
					if("Female Long")
						src.newhair="Female Long"
					if("Female Ponytail")
						src.newhair="Female Ponytail"
					if("Raditz")
						src.newhair="Raditz"
				src.CreateCharRebirth()
				return




//New Char protocol, alert box based, this is to be called after selecting new race on race screen.
		CreateCharRebirth()
//Crim fix 2.63 so people cant spam create shells to overload server
//			var/mob/src=new/mob/PC()
		/*
			src.name="PC-[src.key]-PC"
			var/newname = null
			newname=input("What's your name?")as text
			var/lowername=lowertext(newname)
			var/ntxt1=uppertext(copytext(newname,1,2))
			var/ntxt2=copytext(newname,2)
			newname="[ntxt1][ntxt2]"
			if(NameList.Find(lowername))
				alert("[newname] is already in use. Try another name.")
				del(src)
				src.CreateCharRebirth()
				return
			for(var/i=1,i<=lentext(lowername),i++)
				if(Allowed_Letters.Find(copytext(lowername,i,i+1))==0)
					alert(src,"Only letters A-Z are allowed.")
					del(src)
					src.CreateCharRebirth()
					return
			if(lentext(newname) < 2)
				alert("Your name must contain at least 2 characters.")
				del(src)
				src.CreateCharRebirth()
				return

			if(lentext(newname) > 15)
				alert("Your name cannot exceed 15 characters.")
				del(src)
				src.CreateCharRebirth()
				return
			if(isnull(newname) | newname == "" | !newname)
				alert("Your name cannot be blank.")
				del(src)
				src.CreateCharRebirth()
				return
			if(lowername=="pc"||lowername=="cancel"||lowername=="nevermind"||lowername=="")
			// add npc names to the list above to not allow them to be chosen
				alert("That name is not allowed.")
				del(src)
				src.CreateCharRebirth()
				return
			if(isnull(newname) | newname == " " | !newname)
				alert("Your name cannot be blank.")
				del(src)
				src.CreateCharRebirth()
				return
			else
				newname=html_encode(newname)
				var/txt1=uppertext(copytext(newname,1,2))
				var/txt2=copytext(newname,2)
				newname="[txt1][txt2]"
				var/savefile/N = new("world save files/Player Names.sav")
				NameList.Add(lowername)
				N["NameList"]<<NameList
				*/
			switch(src.newrace)
				if("Android")
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.block = 20
					src.dodge = 15
					src.counter = 20
					src.ki_control = 20
					src.ki_power = 15
					src.melee_max = 20
					src.block_max = 20
					src.dodge_max = 15
					src.counter_max = 20
					src.ki_control_max = 20
					src.ki_power_max = 15
					*/
					src.ApplyIconHair()
				if("Bio Android")
					//src.icon='Bio Android - Form 1.dmi'
					if(src.newskin=="green")
						src.icon='Bio Android - Form 1.dmi'
					if(src.newskin=="blue")
						src.icon='Bio Android Blue - Form 1.dmi'

/*					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.block = 15
					src.dodge = 20
					src.counter = 20
					src.durability = 15
					src.ki_control = 20
					src.ki_power = 20
					src.ki_use = 15
					src.melee_max = 20
					src.block_max = 15
					src.dodge_max = 20
					src.counter_max = 20
					src.durability_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.ki_use_max = 15
*/
				if("Bio Warrior")
					src.icon='Normal warior.dmi'
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
				if("Changeling")

			//		if(src.rage_chromosome)
					src.icon='Changling - Form 1.dmi'
			//		if(src.pure_chromosome)
			//			src.icon='Cooler - Form.dmi'
			/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert
					src.newskin = "F"
					src.melee = 15
					src.block = 15
					src.dodge = 15
					src.ki_control = 15
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.block_max = 15
					src.dodge_max = 15
					src.ki_control_max = 15
					src.ki_power_max = 20
					src.reflect_max = 15
*/
				if("Demon")
					src.icon='Demon - Form 1.dmi'
/*					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.block = 15
					src.dodge = 15
					src.counter = 15
					src.ki_control = 15
					src.ki_power = 15
					src.reflect = 15
					src.weapon = 15
					src.melee_max = 15
					src.block_max = 15
					src.dodge_max = 15
					src.counter_max = 15
					src.ki_control_max = 15
					src.ki_power_max = 15
					src.reflect_max = 15
					src.weapon_max = 15*/

				if("Dragon")
					src.icon='Syn.dmi'

					/*src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.block = 20
					src.dodge = 15
					src.counter = 25
					src.durability = 15
					src.ki_control = 15
					src.ki_power = 15
					src.reflect = 15
					src.melee_max = 15
					src.block_max = 20
					src.dodge_max = 15
					src.counter_max = 25
					src.durability_max = 15
					src.ki_control_max = 15
					src.ki_power_max = 15
					src.reflect_max = 15
					*/
				if("Half Saiyan")

				/*	src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.block = 15
					src.counter = 15
					src.ki_control = 20
					src.ki_power = 15
					src.reflect = 15
					src.melee_max = 15
					src.block_max = 15
					src.counter_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 15
					src.reflect_max = 15
					*/
					src.ApplyIconHair()
				if("Heran")
					src.icon='Bojack.dmi'
					/*src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.block = 15
					src.counter = 20
					src.durability = 15
					src.ki_power = 20
					src.melee_max = 20
					src.block_max = 15
					src.counter_max = 20
					src.durability_max = 15
					src.ki_power_max = 20
					*/
				if("Human")
				/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.block = 20
					src.dodge = 15
					src.counter = 15
					src.ki_control = 15
					src.ki_power = 15
					src.melee_max = 15
					src.block_max = 20
					src.dodge_max = 15
					src.counter_max = 15
					src.ki_control_max = 15
					src.ki_power_max = 15
					*/
					src.ApplyIconHair()
				if("Kai")
					src.icon='Supreme Kai.dmi'
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.dodge = 20
					src.ki_control = 20
					src.ki_power = 15
					src.melee_max = 20
					src.dodge_max = 20
					src.ki_control_max = 20
					src.ki_power_max = 15
					*/
				if("Konat")
					src.icon='Konat - Form 1.dmi'
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.block = 25
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.weapon = 20
					src.melee_max = 20
					src.block_max = 25
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					src.weapon_max = 20
					*/
		/*		if("Hybrid")
					src.icon='LSSJ.dmi'
					src.contents += new/obj/Technique/KiBlast
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert
					src.power_multi = 5
					src.ki_multi = 5
					src.kidefense_multi = 5
					src.strength_multi = 3
					src.defence_multi = 4
					src.speed_multi = 3
					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15*/
				if("Majin")
					src.icon='Majin - Form 0.dmi'
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 25
					src.dodge = 20
					src.counter = 20
					src.durability = 15
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 25
					src.dodge_max = 20
					src.counter_max = 20
					src.durability_max = 15
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
				if("Majin Incarnate")
					src.icon='Uub.dmi'
			/*		src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.dodge = 20
					src.counter = 20
					src.ki_control = 15
					src.ki_power = 25
					src.melee_max = 20
					src.dodge_max = 20
					src.counter_max = 20
					src.ki_control_max = 15
					src.ki_power_max = 25
					*/
				if("Majin Wizard")
					src.icon='Babidi.dmi'
				/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
				if("Namekian")
					src.icon='Namek - Normal.dmi'
				/*	src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.dodge = 15
					src.counter = 15
					src.ki_control = 30
					src.ki_power = 25
					src.melee_max = 15
					src.dodge_max = 15
					src.counter_max = 15
					src.ki_control_max = 30
					src.ki_power_max = 25
					*/
				if("Saibaman")
					src.icon='Saibaman - Form 1.dmi'
					/*
					src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
				if("Saiyan")

					//src.contents += new/obj/Transform/Transform
					//src.contents += new/obj/Transform/Revert
					src.ApplyIconHair()
/*
					src.melee = 20
					src.block = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 15
					src.melee_max = 20
					src.block_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 15
					*/
				if("Tuffle")
					src.icon='Bebi - Form 1.dmi'
				/*	src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 20
					src.block = 20
					src.dodge = 20
					src.ki_control = 25
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 20
					src.block_max = 20
					src.dodge_max = 20
					src.ki_control_max = 25
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
				if("Feline")
				//	if(src.newskin=="Destructive")
					//	src.icon='Beerus.dmi'
					if(src.newskin=="Chaotic")
						src.icon='BeerusChaotic.dmi'
					else
						src.icon='Beerus.dmi'


				/*	src.contents += new/obj/Transform/Transform
					src.contents += new/obj/Transform/Revert

					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					*/
		//		if("Alien")
				//	src.contents += new/obj/Transform/Transform
				//	src.contents += new/obj/Transform/Revert
/*
					src.melee = 15
					src.dodge = 15
					src.ki_control = 20
					src.ki_power = 20
					src.reflect = 15
					src.melee_max = 15
					src.dodge_max = 15
					src.ki_control_max = 20
					src.ki_power_max = 20
					src.reflect_max = 15
					*/

	//		src.save_file_1=src.save_file_1
	//		src.save_file_2=src.save_file_2
	//		src.save_file_3=src.save_file_3
		//	src.icon=src.icon
		//	src.hair=src.hair
			//src.overlays+=src.overlays
			src.race=newrace

			src.skin=newskin

			src.hair=newhair
//			src.name=newname
			src.powerlevel=300
			src.powerlevel_max=300
			src.ki=300
			src.ki_max=300
			src.kidefense=300
			src.kidefense_max=300
			src.strength=250
			src.strength_max=250
			src.defence=250
			src.defence_max=250
			src.speed=100
			src.speed_max=100
		//	src.zenni=500
			src.newtype=newtype
		//	src.power_multi = round(src.power_multi/5)
		//	src.ki_multi = round(src.ki_multi/5)
		//	src.kidefense_multi = round(src.kidefense_multi/5)
		//	src.strength_multi = round(src.strength_multi/5)
		//	src.defence_multi = round(src.defence_multi/5)
			src.karma="Good"
			src.karma_rating=1
			/*
			if(src.client.IsByondMember()||src.GMLevel>2)
				src.level=125
				src.pk=1
				src.powerlevel=45000
				src.powerlevel_max=45000
				src.ki=45000
				src.ki_max=45000
				src.kidefense=45000
				src.kidefense_max=45000
				src.strength=30000
				src.strength_max=30000
				src.defence=30000
				src.defence_max=30000
				src.speed=20000
				src.speed_max=20000
				src.zenni=10000
				*/
			if(src.key=="Crimson Slayer"||src.key=="Hammerboy"||src.key=="cazdogga")
		//		src.staminaleft=999999
		//		src.staminaleft_max=999999
				src.exp+=5000
			src.energy_code=rand(0000001,9999999)
			src.Power_Birth()
			spawn(-1) src.BuildCharRebirth()
			sleep(20)

			//if(!src)return   // NEWWAVE


//			while(!src.HasCreated)
//				usr << "SLEEP"
///				sleep(20)
		//	alert("OVER")
			src.client.screen=null
		//	if(src.remakes<=0)
		//		src.remake_cooldown = world.realtime + 864000
	 	//continue char creation code
		//	src.remakes++
		//	while(src.HasCreated)
		//	var/savefile/S = new("world save files/Remakes.sav")
		//	S["[src.client.computer_id] cooldown"]<<src.remake_cooldown
		//	S["[src.client.computer_id] remakes"]<<src.remakes
		//	src << "You've got [5-src.remakes] remakes left."
			if(src.client.IsByondMember())
				src<<"<font color=#993333>For being a BYOND member, you have received some zenni and a small increase on your basic attributes.</font>"
			player << "<font color = #66CCCC>Server Information: <font color = white>[src.name] ([src.ckey]) has been reborn!"
		//	src << "<font color=red><font size=3>Welcome to Dragonball: Ruination! Be sure to check out the updated Game Guide."
		//	src << "<font color=red>We are currently . Responsible and knowledgable players to help out newer players. Please apply on the forum.  http://drgonballft.forumotion.net/."
		//	src << "This server is still under development and we would appreciate it if you report all bugs using the bug report verb. That being said, we are also open to your suggestions! Suggestion and Bug Report verbs are in your Channels tab."
			winset(src,"RaceRebirth","is-visible=false")
			winset(src,"default","alpha=255")


//					src.up2 = 1
//					src.expup += 0.1
//					mode = "Easy"
//					moden += 1
			src.mode = initial(src.mode)
			src.moden = initial(src.moden)
			//sleep(1)
			src.moden += src.resets
			src.expup = initial(src.expup)
			src.overlays -= src.hair_icon
			//src.rank = initial(src.rank)
			//src.kills = initial(src.kills)
			src.up1 = initial(src.up1)
			src.up2 = initial(src.up2)
			src.up3 = initial(src.up3)
			src.up4 = initial(src.up4)
			src.up5 = initial(src.up5)
			src.up6 = initial(src.up6)
			src.up7 = initial(src.up7)
			src.up8 = initial(src.up8)
			src.up9 = initial(src.up9)
			src.up10 = initial(src.up10)
			src.up11 = initial(src.up11)
			src.up12 = initial(src.up12)
			src.up13 = initial(src.up13)
			src.up14 = initial(src.up14)
			src.up15 = initial(src.up15)


			src.moden = initial(src.moden)

			src.exp = initial(src.exp)
			src.tnl = initial(src.tnl)

			//sleep(2)
			spawn(2) src.moden += src.resets
			src.tp = 0
			spawn(3) src.moden += src.questpointreward3
			spawn(5) src.moden += src.zpvmode
			src.questpointreward1=0
			src.questpointreward2=0
			//src.questpointreward3=0
			//src.questpointreward4=0
			src.questpointreward5=0
			src.questpointreward6=0
			//src.questpointrewardCell=0


			src.wishes = 0
			src.nwishes = 0
			src.bwishes = 0

			src.inverted = 0
			src.transformed = 0
			src.form_1 = 0
			src.form_2 = 0
			src.form_3 = 0
			src.form_4 = 0
			src.form_5 = 0
			src.form_6 = 0
			src.hasgokubody = 0

			src.learn_freeze = 0
			src.learn_shieldsmash = 0
			src.learn_kaioken=0  //KAI'S ONLY
			src.learn_sorcery=0
			src.learn_SelfDestruct=0
			src.learn_KiBlast=0
			src.learn_Absorb=0
			src.learn_Regenerate=0
			src.learn_KienzanDisk=0
			src.learn_Corrupt=0
			src.learn_FlameBullet=0
			src.learn_DistructoDisk=0
			src.learn_FatWrap=0
			src.learn_CandyRay=0
			src.learn_Infect=0
			src.learn_Drain=0
	//end of race exclusive
			src.learn_kamehameha=0
			src.learn_burst=0

			src.learn_dimensionsword=0
			src.learn_distructodisk=0
			src.learn_kienzandisk=0
			src.learn_spiritball=0
			src.learn_aura=0
			src.learn_karmabomb=0
			src.learn_explosivewave=0
			src.learn_SuperExplosionWave=0
			src.learn_energyfield=0
			src.learn_angryexplosion=0
			src.learn_candy=0
			src.learn_supernova=0
			src.learn_executionersstrike=0
			src.learn_bblast=0
			src.learn_erain=0
			src.learn_gtyrant=0
			src.learn_godlyblast=0
			src.learn_grandsmasher=0
			src.learn_novablast=0
			src.learn_omegablast=0
			src.learn_phantomattack=0
			src.learn_soulpunisher=0
			src.learn_starbang=0
			src.learn_waterjet=0
			src.learn_zapcannon=0
			src.learn_dodonpa=0
			src.learn_deathball=0
			src.learn_sauzerblade=0
			src.learn_finalexplosion=0
			src.learn_giganticmeteor=0
			src.learn_blastershell=0
			src.learn_rapidblast=0
			src.learn_blowup=0
			src.learn_flameblast=0
			src.learn_fireki=0
			src.learn_infernoblitz=0
			src.learn_arcblast=0
			src.learn_kicannon=0
			src.learn_whirlwind=0
			src.learn_darkblast=0
			src.learn_darkbomb=0
			src.learn_bloodbomb=0
			src.learn_holyblast=0
			src.learn_lightsphere=0
			src.learn_deathbeam=0
			src.learn_demonsword=0
			src.learn_universalscan=0
			src.learn_fusiondance=0
			src.learn_acidbomb=0
			src.learn_galacticdonut=0
			src.learn_demonshackle=0
			src.learn_imprisonmentball=0
			src.learn_powerup=0
			src.learn_fakemoon=0
			src.learn_enrage=0
			src.learn_sense=0
			src.learn_finalshine=0
			src.learn_bigbangattack=0
			src.learn_finalflash=0
			src.learn_galickgun=0
			src.learn_tribeam=0
			src.learn_solarflare=0
			src.learn_splitform=0
			src.learn_swapsplits=0
			src.learn_specialbeam=0
			src.learn_lightgrenade=0
			src.learn_zanzoken=0
			src.learn_dragonfist=0
			src.learn_afterimage=0
			src.learn_it=0
			src.learn_ssdeadlybomber=0
			src.learn_fly=0
			src.learn_hellzonegrenade=0
			src.learn_genocideattack=0
			src.learn_invertpower=0
			src.learn_deathwave=0
			src.learn_cherrybomb=0
			src.learn_finishbuster=0
			src.learn_burningattack=0
			src.learn_absorb=0
			src.learn_assasinate=0
			src.learn_kiabsorb=0
			src.learn_regena=0
			src.learn_revengeball=0
			src.learn_kishower=0
			src.learn_sacrifice=0
			src.learn_adtrain=0
			src.learn_gravfield=0
			src.learn_buffpl=0
			src.learn_buffki=0
			src.learn_buffstr=0
			src.learn_buffdef=0
			src.learn_buffstam=0
			src.learn_explode=0
			src.learn_chaosball=0
			src.learn_acidrain=0
			src.learn_swordslash=0
			src.learn_tswordslash=0
			src.learn_timeskip=0
			src.learn_glare=0

			src.learn_burningdragon=0
			src.learn_damnedshark=0
			src.learn_deadbeam=0

			//NEW MELEE TECHS
			src.learn_kipunch=0
			src.learn_powerdash=0
			src.learn_push=0

			//LEARN GENERIC TECHS

			src.learn_generic1=0
			src.learn_generic2=0

			// AOE Techs
			src.learn_damagefield=0
			src.learn_slowfield=0
			src.learn_healfield=0

			//Flying techs
			src.learn_tracenuke=0

			src.learn_focusstep=0

			//
			src.learn_tkb=0

			src.plbackup = src.powerlevel_max
			src.kibackup = src.ki_max
			src.strbackup = src.strength_max
			src.defbackup = src.defence_max

	//		src.powerlevel_bonus = 0
	//		src.ki_bonus = 0
	//		src.strength_bonus = 0
	//		src.defence_bonus = 0
			src.zpu += src.zp

			src.tp = 0
			src.zp = 0

			//quest vars

			src.kk_quest_start = 0
			src.kk_quest_complete = 0
			src.kk_quest_training = 0

			src.potential_unlocked = 0
			src.mystic = 0
			src.gone_mystic = 0
			src.herculeboost = 0
			src.guru_quest_start = 0
			src.guru_quest_complete = 0
			src.thug_kills = 0
			src.guru_boost = 0
			src.gone_majin = 0





			src.powerlevel_saved = 0
			src.ki_saved = 0
			src.strength_saved = 0
			src.defence_saved = 0
        //POWER DOWN

			//if(src.ki_control_max >= 24)
			if(src.learn_powerdown)
				src.learn_powerdown = 1
				src.contents += new/obj/Technique/PowerDown
				src << output("<center><font color = white> .:: You learn Power Down ::.</font></center>","output2")

			src.learn_x10kamehameha = 0


			src.energy_barrier_learn = 0

			src.powerlevel_max = initial(src.powerlevel_max)
			src.ki_max = initial(src.ki_max)
			src.strength_max = initial(src.strength_max)
			src.defence_max = initial(src.defence_max)
			src.level = initial(src.level)

			//buff vars
			src.buffdelay1=0
			src.buffdelay2=0
			src.buffdelay3=0
			src.buffdelay4=0
			src.buffdelay5=0
			src.buffdelay6=0

			src.manipulationdelay=0
			src.expbuff=0
			src.staminabuff=0
			src.buff1=0
			src.buff2=0
			src.buff3=0
			src.buff4=0
			src.manipulated=0

			src.prPL = 0
			src.prKI = 0
			src.prKIDEF = 0
			src.prSTR = 0
			src.prDEF = 0

			//src.absorbs = 0
			//src.corrupts = 0

			src.whisboost2 = 0
			src.gokupotential = 0
			src.isrebirthing = 0
			src.zp += round(src.zpu * 0.1)
			src.zpspent = 0
			src << "<b>You have gained [src.zp] ZP!"
			var/modegain = src.rebirths
			src.moden += modegain
			src << "<b>You have gained [modegain] mode!"
			src.Oozaru = 0
			winshow(src,"default",1)

			src << "<font color = yellow><b><font size = 2>You have been reborn!"

		//up15  rank   kills

		//	src.loc=locate(rand(390,400),rand(245,260),7)
	//		src.client.mob=src

		//	spawn(100)src.client.AutoSave()
//			del(src)

mob
	proc
		BuildCharRebirth()
			src.frozen = 1
			src.GMLocked = 1
			//alert("build")
			src.rebirths += 1
			src.Points = 5
			src.zpcap += 100
//			alert("rebirths: [src.rebirths]  points [src.Points]")
			if(src.rebirths < 30)
				src.Points += src.rebirths
			else
				src.Points += 30

			src.expb += 0.4
			src.expm += 0.4
			if(src.expb >= 2)
				src.expb = 2
				src.expm = 3
				src.expbm = 1
				/*
							usr.expb += pl
							usr.expm += pl
							if(usr.expb >= 5)
								usr.expb = 5
								usr.expm = 6
								usr.expbm = 1

								*/
//			alert("rebirths: [src.rebirths]  points [src.Points]")

		//	src.powerlevel_bonus = 0
		//	src.ki_bonus = 0
		//	src.strength_bonus = 0
		//	src.defence_bonus = 0
			src.staminaleft_max = 1000
			sleep(1)
			src.Stat_Point_Window_Refresh()
			sleep(5)
			winset(usr,"multis","is-visible=true")
			winset(usr,"multis","focus=true")

			winshow(usr,"multis",1)
			src.Stat_Point_Window_Refresh()
			/*
			while(!src.HasCreated)
		//		world << "SLEEP"
				if(!usr)
		//			usr << "BREAK"
					break
				sleep(20)
				*/