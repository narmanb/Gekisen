var/list/NameList = list()
var/list/Allowed_Letters = list ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," ")
mob/var/save_file_1 = 0
mob/var/save_file_2 = 0
mob/var/save_file_3 = 0
mob/var/remakes = 0
mob/var/remake_cooldown = 0
mob/var/gender2 = ""
var/htmlmovie={"<!DOCTYPE html>
<HTML>
<HEAD>
<META http-equiv="X-UA-Compatible" content="IE=edge">
</HEAD>
<STYLE>
body {
	background-color: #000000
}
</STYLE>
<BODY>
<iframe width="854" height="480" src="https://www.youtube.com/embed/8eOjHRRawig?rel=0&autoplay=1&loop=1&playlist=" frameborder="0" allowfullscreen></iframe></BODY>

</HTML>"}
/*Sparkz iframe for the custom vid that no workie <iframe width="800" height="450" src="https://www.youtube.com/embed/NhqVzU3HHgs?rel=0&autoplay=1&loop=1&playlist=" frameborder="0" allowfullscreen></iframe></BODY>
<iframe width="854" height="480" src="https://www.youtube.com/embed/o3rmioIteQE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

*/
//Initial load in of the video for the background and checking bans and guest accounts
mob
	Guest
		Login()
			//spawn(10)winset(src,"mapwindow.map","icon-size=32")
		//	alert("A")
			if(findtext(src.key,"Guest"))
				del(src)
				return
		//	alert("B")
			/*Auto Login to test
			if(src.autologin)
				if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
					winset(src,"NLD","is-visible=false")
					winset(src,"Login","is-visible=false")
					src<<output(null,"Login.browser1")
					winset(src,"default","alpha=255")
					src.client.LoadChar(1)
					return*/
			src.CheckBan()
			if(src.MK()==TRUE)
				del(src)
			//alert("C")
			winset(src,"default","alpha=0")
			winset(src,"Login","is-visible=true")
			winset(src,"NLD","is-visible=true")
			winset(src,"NLD","focus=true")
			//alert("D")
			src<< output(htmlmovie,"Login.browser1")
			//alert("E")
//Client procs to be bound to interface buttons of NLD(New, Load, Delete) window, set to hidden so players can view the verbs
//winsets are used to hide the non used windows and show the active windows

mob
	var
		displayicon=""
		autologin=0
		loading=0
		tmp
			newrace=""
			newskin="tan"
			newhair="Bald"
			newtype=""
			clickdelay=0
	verb

		NewCharacter()
			set hidden=1
			usr.save_file_1=1
			if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
				switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 1","Overwrite","Cancel"))
					if("Cancel")
						return
					else
			/*
						if(fexists("world save files/Remakes.sav"))
							var/savefile/S = new("world save files/Remakes.sav")
							S["[usr.client.computer_id] cooldown"]>>src.remake_cooldown
							S["[usr.client.computer_id] remakes"]>>src.remakes
								//Make Char proc
						if(world.realtime > src.remake_cooldown)
							src.remakes = 0
						else
							if(src.remakes>=5)
								var/temp = src.remake_cooldown - world.realtime
								if(temp>36000)
									var/tempH = round((src.remake_cooldown - world.realtime)/36000)
									src << "Remake limit reached. Please wait [tempH] hours before remaking again."
									if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
										winset(src,"NLD","is-visible=false")
										winset(src,"Login","is-visible=false")
										src<<output(null,"Login.browser1")
										winset(src,"default","alpha=255")
										src.client.LoadChar(1)
									return
								else
									var/tempM = round((src.remake_cooldown - world.realtime)/600)
									src << "Remake limit reached. Please wait [tempM] minutes before remaking again."
									if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
										winset(src,"NLD","is-visible=false")
										winset(src,"Login","is-visible=false")
										src<<output(null,"Login.browser1")
										winset(src,"default","alpha=255")
										src.client.LoadChar(1)
									return
									*/
						var/delname=""
						var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
						F["name"]>>delname
						var/savefile/N=new("world save files/Player Names.sav")
						NameList.Remove(lowertext(delname))
						N["NameList"]<<NameList
						winset(src,"NLD","is-visible=false")
						winset(src,"Login","is-visible=false")
						src<<output(null,"Login.browser1")
						winset(src,"Race","is-visible=true")
			else
			/*
				if(fexists("world save files/Remakes.sav"))
					var/savefile/S = new("world save files/Remakes.sav")
					S["[usr.client.computer_id] cooldown"]>>src.remake_cooldown
					S["[usr.client.computer_id] remakes"]>>src.remakes
						//Make Char proc
				if(world.realtime > src.remake_cooldown)
					src.remakes = 0
				else
					if(src.remakes>=5)
						var/temp = src.remake_cooldown - world.realtime
						if(temp>36000)
							var/tempH = round((src.remake_cooldown - world.realtime)/36000)
							src << "Remake limit reached. Please wait [tempH] hours before remaking again."
							return
						else
							var/tempM = round((src.remake_cooldown - world.realtime)/600)
							src << "Remake limit reached. Please wait [tempM] minutes before remaking again."
							return
							*/
				winset(src,"NLD","is-visible=false")
				winset(src,"Login","is-visible=false")
				src<<output(null,"Login.browser1")
				winset(src,"Race","is-visible=true")


		LoadCharacter()
			set hidden = 1
			if(src.loading)return
			src.loading=1
			if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
				winset(src,"NLD","is-visible=false")
				winset(src,"Login","is-visible=false")
				src<<output(null,"Login.browser1")
				winset(src,"default","alpha=255")
				src.client.LoadChar(1)
				spawn(5)src.loading=0
			else
				src<<"<font color=red>Slot 1 is empty!"
				switch(alert("Would you like to create a new save now??","Load Character failed....","Create New Character","Cancel"))
					if("Cancel")
						return
					else
						usr.save_file_1=1
						if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
							switch(alert("Do you want to overwrite your current character?","Overwrite: Slot 1","Overwrite","Cancel"))
								if("Cancel")
									return
								else
								/*
									if(fexists("world save files/Remakes.sav"))
										var/savefile/S = new("world save files/Remakes.sav")
										S["[usr.client.computer_id] cooldown"]>>src.remake_cooldown
										S["[usr.client.computer_id] remakes"]>>src.remakes
											//Make Char proc
									if(world.realtime > src.remake_cooldown)
										src.remakes = 0
									else
										if(src.remakes>=5)
											var/temp = src.remake_cooldown - world.realtime
											if(temp>36000)
												var/tempH = round((src.remake_cooldown - world.realtime)/36000)
												src << "Remake limit reached. Please wait [tempH] hours before remaking again."
												spawn(5)src.loading=0
												if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
													winset(src,"NLD","is-visible=false")
													winset(src,"Login","is-visible=false")
													src<<output(null,"Login.browser1")
													winset(src,"default","alpha=255")
													src.client.LoadChar(1)
													spawn(5)src.loading=0
												return
											else
												var/tempM = round((src.remake_cooldown - world.realtime)/600)
												src << "Remake limit reached. Please wait [tempM] minutes before remaking again."
												spawn(5)src.loading=0
												if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
													winset(src,"NLD","is-visible=false")
													winset(src,"Login","is-visible=false")
													src<<output(null,"Login.browser1")
													winset(src,"default","alpha=255")
													src.client.LoadChar(1)
													spawn(5)src.loading=0
												return
												*/
									var/delname=""
									var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
									F["name"]>>delname
									var/savefile/N=new("world save files/Player Names.sav")
									NameList.Remove(lowertext(delname))
									N["NameList"]<<NameList
									winset(src,"NLD","is-visible=false")
									winset(src,"Login","is-visible=false")
									src<<output(null,"Login.browser1")
									winset(src,"Race","is-visible=true")
									spawn(5)src.loading=0
						else
						/*
							if(fexists("world save files/Remakes.sav"))
								var/savefile/S = new("world save files/Remakes.sav")
								S["[usr.client.computer_id] cooldown"]>>src.remake_cooldown
								S["[usr.client.computer_id] remakes"]>>src.remakes
									//Make Char proc
							if(world.realtime > src.remake_cooldown)
								src.remakes = 0
							else
								if(src.remakes>=5)
									var/temp = src.remake_cooldown - world.realtime
									if(temp>36000)
										var/tempH = round((src.remake_cooldown - world.realtime)/36000)
										src << "Remake limit reached. Please wait [tempH] hours before remaking again."
										spawn(5)src.loading=0
										return
									else
										var/tempM = round((src.remake_cooldown - world.realtime)/600)
										src << "Remake limit reached. Please wait [tempM] minutes before remaking again."
										spawn(5)src.loading=0
										return
										*/
							winset(src,"NLD","is-visible=false")
							winset(src,"Login","is-visible=false")
							src<<output(null,"Login.browser1")
							winset(src,"Race","is-visible=true")
							spawn(5)src.loading=0

		DeleteCharacter()
			set hidden = 1
			src.DeleteChar(1)

		Next()
			set hidden = 1
//			if(src.clickdelay==1)return
//			src.clickdelay=1
			if(src.newrace)
				src.Choose_Base()
				spawn(10)src.clickdelay=0
			else
				src<<alert("Please Choose a race by clicking on one of the races")
				spawn(10)src.clickdelay=0


		NextRebirth()
			set hidden = 1
			if(src.clickdelay==1)return
			src.clickdelay=1
			if(src.newrace)
			//	src.rebirths += 1
			//	src.moden = initial(src.moden)
			//	sleep(2)
			//	src.moden += src.resets

				src.Choose_Base_Rebirth()

				spawn(10)src.clickdelay=0
			else
				src<<alert("Please Choose a race by clicking on one of the races")
				spawn(10)src.clickdelay=0
		Android()
			set hidden = 1
			src.newrace="Android"
			winset(src,"Race.label4","text=")
			winset(src,"Race.label4","image=['AndroidDesc.png']")

		BioAndroid()
			set hidden = 1
			src.newrace="Bio Android"
			winset(src,"Race.label4","image=['BioAndroidDesc.png']")
			winset(src,"Race.label4","text=")

		BioWarrior()
			set hidden = 1
			src.newrace="Bio Warrior"
			winset(src,"Race.label4","image=['UnderReview.png']")
			//winset(src,"Race.label4","image=BioWarriorDesc.png")
			winset(src,"Race.label4","text=")

		Changeling()
			set hidden = 1
			src.newrace="Changeling"
			winset(src,"Race.label4","image=['UnderReview.png']")
			//winset(src,"Race.label4","image=ChangelingDesc.png")
			winset(src,"Race.label4","text=")

		Demon()
			set hidden = 1
			src.newrace="Demon"
			winset(src,"Race.label4","image=['DemonDesc.png']")
			winset(src,"Race.label4","text=")

		Dragon()
			set hidden = 1
			src.newrace="Dragon"
			winset(src,"Race.label4","image=['DragonDesc.png']")
			winset(src,"Race.label4","text=")

		HalfSaiyan()
			set hidden = 1
			src.newrace="Half Saiyan"
			winset(src,"Race.label4","image=['HalfSaiyanDesc.png']")
			winset(src,"Race.label4","text=")

		Heran()
			set hidden = 1
			src.newrace="Heran"
			winset(src,"Race.label4","image=['UnderReview.png']")
			//winset(src,"Race.label4","image=HeranDesc.png")
			winset(src,"Race.label4","text=")

		Human()
			set hidden = 1
			src.newrace="Human"
			winset(src,"Race.label4","image=['HumanDesc.png']")
			winset(src,"Race.label4","text=")

		Kai()
			set hidden = 1
			src.newrace="Kai"
			winset(src,"Race.label4","image=['KaiDesc.png']")
			winset(src,"Race.label4","text=")

		Konat()
			set hidden = 1
			src.newrace="Konat"
			winset(src,"Race.label4","image=['KonatDesc.png']")
			winset(src,"Race.label4","text=")

		Majin()
			set hidden = 1
			src.newrace="Majin"
			winset(src,"Race.label4","image=['MajinDesc.png']")
			winset(src,"Race.label4","text=")

		MajinWizard()
			set hidden = 1
			src.newrace="Majin Wizard"
			winset(src,"Race.label4","image=['UnderReview.png']")
			//winset(src,"Race.label4","image=MajinWizardDesc.png")
			winset(src,"Race.label4","text=")

		Namekian()
			set hidden = 1
			src.newrace="Namekian"
			winset(src,"Race.label4","image=['NamekianDesc.png']")
			winset(src,"Race.label4","text=")

		Saibaman()
			set hidden = 1
			src.newrace="Saibaman"
			winset(src,"Race.label4","image=['SaibamanDesc.png']")
			winset(src,"Race.label4","text=")

		Saiyan()
			set hidden = 1
			src.newrace="Saiyan"
			winset(src,"Race.label4","image=['SaiyanDesc.png']")
			winset(src,"Race.label4","text=")

		Tuffle()
			set hidden = 1
			src.newrace="Tuffle"
			winset(src,"Race.label4","image=['TuffleDesc.png']")
			winset(src,"Race.label4","text=")

		Feline()
			set hidden = 1
			src.newrace="Feline"
			winset(src,"Race.label4","image=['FelineDesc.png']")
			winset(src,"Race.label4","text=")

		Alien()
			set hidden = 1
			src.newrace="Alien"
			winset(src,"Race.label4","image=['AlienDesc.png']")
			winset(src,"Race.label4","text=")

	proc

		DeleteChar(S)
			switch(S)
				if(1)
					if(fexists("Player Saves/[src.ckey]-Slot 1.sav"))
						switch(alert("Do you want to delete your current character?","Delete: Profile","Delete","Cancel"))
							if("Delete")
								var/delname=""
								var/savefile/F=new("Player Saves/[src.ckey]-Slot 1.sav")
								F["name"]>>delname
								var/savefile/N=new("world save files/Player Names.sav")
								NameList.Remove(lowertext(delname))
								N["NameList"]<<NameList
								fdel("Player Saves/[src.ckey]-Slot 1.sav")
								src<<"<font color=red>Profile Deleted!"
								src.client.screen=null
								spawn(15)src.clickdelay=0
							else

								spawn(15)src.clickdelay=0
								return
					else
						src<<"<font color=red>Profile is empty!"
						src.client.screen=null
						spawn(15)src.clickdelay=0

		Choose_Base()

			set hidden = 1
			if(src.newrace=="Saibaman"||src.newrace=="Changeling"||src.newrace=="Demon"||src.newrace=="Dragon"||src.newrace=="Heran"||src.newrace=="Kai"||src.newrace=="Konat"||src.newrace=="Majin"||src.newrace=="Majin Wizard"||src.newrace=="Namekian"||src.newrace=="Tuffle"||src.newrace=="Alien")
				src.CreateChar()
				return
			if(src.newrace=="Feline")
				switch(input("Which type (color) would you like to be? Destructive = Beerus, Chaotic = Darker Tone") in list ("Destructive","Chaotic"))
					if("Destructive")
						src.newskin="Destructive"
					if("Chaotic")
						src.newskin="Chaotic"
				src.CreateChar()
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
						src.CreateChar()
						return

				//	if("Chaotic")
				//		src.newskin="Chaotic"

			if(src.newrace=="Bio Android")
				switch(input("Choose what color you'd like to be","Biological Android Color") in list("Green","Blue"))
					if("Green")
						src.newskin="green"

					if("Blue")
						src.newskin="blue"
				src.CreateChar()
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
				src.CreateChar()
				return

		UpdateDisplayIcon()
			if(src.Oozaru)return
			var/icon/PI = icon(src.icon,"",SOUTH)
			for(var/X in src.overlays)
				PI.Blend(icon(X:icon,"",SOUTH),ICON_OVERLAY)
			for(var/X in src.underlays)
				PI.Blend(icon(X:icon,"",SOUTH),ICON_UNDERLAY)
			src.displayicon=PI

		ApplyIconHair()
			if(src.newskin=="tan")
				src.skin="tan"
				src.icon = 'Male - Tan.dmi'
			if(src.newskin=="white")
				src.skin="white"
				src.icon = 'Male - White.dmi'
			if(src.newskin=="dark")
				src.skin="dark"
				src.icon = 'Male - Dark.dmi'
			if(src.newskin=="tanf")
				src.skin="tanf"
				src.icon = 'Female - Tan.dmi'
			if(src.newskin=="whitef")
				src.skin="whitef"
				src.icon = 'Female - White.dmi'
			if(src.newskin=="darkf")
				src.skin="darkf"
				src.icon = 'Female - Dark.dmi'


			if(src.newskin=="tanf21")
				src.skin="tanf21"
				src.icon = 'Android 21 Female - Tan.dmi'
			if(src.newskin=="whitef21")
				src.skin="whitef21"
				src.icon = 'Android 21 Female - White.dmi'
			if(src.newskin=="darkf21")
				src.skin="darkf21"
				src.icon = 'Android 21 Female - Dark.dmi'


			if(src.newskin=="tanm21")
				src.skin="tanm21"
				src.icon = 'Male - Android 21 Tan.dmi'
			if(src.newskin=="whitem21")
				src.skin="whitem21"
				src.icon = 'Male - Android 21.dmi'
			if(src.newskin=="darkm21")
				src.skin="darkm21"
				src.icon = 'Male - Android 21 Dark.dmi'



			if(src.newhair=="Bald")
				src.hair = "Bald"
			if(src.newhair=="Goku")
				src.hair = "Goku"
				src.hair_icon = 'Hair - Goku.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Vegeta")
				src.hair = "Vegeta"
				src.hair_icon = 'Hair - Vegeta.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Teen Gohan")
				src.hair = "Teen Gohan"
				src.hair_icon = 'Hair - Teen Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Adult Gohan")
				src.hair = "Adult Gohan"
				src.hair_icon = 'Hair - Adult Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Future Gohan")
				src.hair = "Future Gohan"
				src.hair_icon = 'Hair - Future Gohan.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Hercule")
				src.hair = "Hercule"
				src.hair_icon = 'Hair - Hercule.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Raditz")
				src.hair = "Raditz"
				src.hair_icon = 'Hair - Raditz.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Trunks Long")
				src.hair = "Trunks Long"
				src.hair_icon = 'Hair - Trunks Long.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Female Long")
				src.hair = "Female Long"
				src.hair_icon = 'Hair_FemaleLong.dmi'
				src.overlays += src.hair_icon
			if(src.newhair=="Female Ponytail")
				src.hair = "Female Ponytail"
				src.hair_icon = 'HairFemalePonytail.dmi'
				src.overlays += src.hair_icon
			return

//New Char protocol, alert box based, this is to be called after selecting new race on race screen.
		CreateChar()
//Crim fix 2.63 so people cant spam create shells to overload server
			var/mob/mobcreation=new/mob/PC()
			mobcreation.name="PC-[src.key]-PC"
			var/newname = null
			newname=input("What's your name?")as text
			var/lowername=lowertext(newname)
			var/ntxt1=uppertext(copytext(newname,1,2))
			var/ntxt2=copytext(newname,2)
			newname="[ntxt1][ntxt2]"
			if(NameList.Find(lowername))
				alert("[newname] is already in use. Try another name.")
				del(mobcreation)
				src.CreateChar()
				return
			for(var/i=1,i<=lentext(lowername),i++)
				if(Allowed_Letters.Find(copytext(lowername,i,i+1))==0)
					alert(src,"Only letters A-Z are allowed.")
					del(mobcreation)
					src.CreateChar()
					return
			if(lentext(newname) < 2)
				alert("Your name must contain at least 2 characters.")
				del(mobcreation)
				src.CreateChar()
				return

			if(lentext(newname) > 15)
				alert("Your name cannot exceed 15 characters.")
				del(mobcreation)
				src.CreateChar()
				return
			if(isnull(newname) | newname == "" | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateChar()
				return
			if(lowername=="pc"||lowername=="cancel"||lowername=="nevermind"||lowername=="")
			// add npc names to the list above to not allow them to be chosen
				alert("That name is not allowed.")
				del(mobcreation)
				src.CreateChar()
				return
			if(isnull(newname) | newname == " " | !newname)
				alert("Your name cannot be blank.")
				del(mobcreation)
				src.CreateChar()
				return
			else
				newname=html_encode(newname)
				var/txt1=uppertext(copytext(newname,1,2))
				var/txt2=copytext(newname,2)
				newname="[txt1][txt2]"
				var/savefile/N = new("world save files/Player Names.sav")
				NameList.Add(lowername)
				N["NameList"]<<NameList
			switch(src.newrace)
				if("Android")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.block = 20
					mobcreation.dodge = 15
					mobcreation.counter = 20
					mobcreation.ki_control = 20
					mobcreation.ki_power = 15
					mobcreation.melee_max = 20
					mobcreation.block_max = 20
					mobcreation.dodge_max = 15
					mobcreation.counter_max = 20
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 15
					src.ApplyIconHair()
				if("Bio Android")
					//src.icon='Bio Android - Form 1.dmi'
					if(src.newskin=="green")
						src.icon='Bio Android - Form 1.dmi'
					if(src.newskin=="blue")
						src.icon='Bio Android Blue - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.block = 15
					mobcreation.dodge = 20
					mobcreation.counter = 20
					mobcreation.durability = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.ki_use = 15
					mobcreation.melee_max = 20
					mobcreation.block_max = 15
					mobcreation.dodge_max = 20
					mobcreation.counter_max = 20
					mobcreation.durability_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.ki_use_max = 15

				if("Bio Warrior")
					src.icon='Normal warior.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Changeling")
			//		if(src.rage_chromosome)
					src.icon='Changling - Form 1.dmi'
			//		if(src.pure_chromosome)
			//			src.icon='Cooler - Form.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.newskin = "F"
					mobcreation.melee = 15
					mobcreation.block = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 15
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.block_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 15
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15

				if("Demon")
					src.icon='Demon - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.block = 15
					mobcreation.dodge = 15
					mobcreation.counter = 15
					mobcreation.ki_control = 15
					mobcreation.ki_power = 15
					mobcreation.reflect = 15
					mobcreation.weapon = 15
					mobcreation.melee_max = 15
					mobcreation.block_max = 15
					mobcreation.dodge_max = 15
					mobcreation.counter_max = 15
					mobcreation.ki_control_max = 15
					mobcreation.ki_power_max = 15
					mobcreation.reflect_max = 15
					mobcreation.weapon_max = 15
				if("Dragon")
					src.icon='Syn.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.block = 20
					mobcreation.dodge = 15
					mobcreation.counter = 25
					mobcreation.durability = 15
					mobcreation.ki_control = 15
					mobcreation.ki_power = 15
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.block_max = 20
					mobcreation.dodge_max = 15
					mobcreation.counter_max = 25
					mobcreation.durability_max = 15
					mobcreation.ki_control_max = 15
					mobcreation.ki_power_max = 15
					mobcreation.reflect_max = 15
				if("Half Saiyan")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.block = 15
					mobcreation.counter = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 15
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.block_max = 15
					mobcreation.counter_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 15
					mobcreation.reflect_max = 15
					src.ApplyIconHair()
				if("Heran")
					src.icon='Bojack.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.block = 15
					mobcreation.counter = 20
					mobcreation.durability = 15
					mobcreation.ki_power = 20
					mobcreation.melee_max = 20
					mobcreation.block_max = 15
					mobcreation.counter_max = 20
					mobcreation.durability_max = 15
					mobcreation.ki_power_max = 20
				if("Human")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.block = 20
					mobcreation.dodge = 15
					mobcreation.counter = 15
					mobcreation.ki_control = 15
					mobcreation.ki_power = 15
					mobcreation.melee_max = 15
					mobcreation.block_max = 20
					mobcreation.dodge_max = 15
					mobcreation.counter_max = 15
					mobcreation.ki_control_max = 15
					mobcreation.ki_power_max = 15
					src.ApplyIconHair()
				if("Kai")
					src.icon='Supreme Kai.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.dodge = 20
					mobcreation.ki_control = 20
					mobcreation.ki_power = 15
					mobcreation.melee_max = 20
					mobcreation.dodge_max = 20
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 15
				if("Konat")
					src.icon='Konat - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.block = 25
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.weapon = 20
					mobcreation.melee_max = 20
					mobcreation.block_max = 25
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
					mobcreation.weapon_max = 20
		/*		if("Hybrid")
					src.icon='LSSJ.dmi'
					mobcreation.contents += new/obj/Technique/KiBlast
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					mobcreation.power_multi = 5
					mobcreation.ki_multi = 5
					mobcreation.kidefense_multi = 5
					mobcreation.strength_multi = 3
					mobcreation.defence_multi = 4
					mobcreation.speed_multi = 3
					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15*/
				if("Majin")
					src.icon='Majin - Form 0.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 25
					mobcreation.dodge = 20
					mobcreation.counter = 20
					mobcreation.durability = 15
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 25
					mobcreation.dodge_max = 20
					mobcreation.counter_max = 20
					mobcreation.durability_max = 15
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Majin Incarnate")
					src.icon='Uub.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.dodge = 20
					mobcreation.counter = 20
					mobcreation.ki_control = 15
					mobcreation.ki_power = 25
					mobcreation.melee_max = 20
					mobcreation.dodge_max = 20
					mobcreation.counter_max = 20
					mobcreation.ki_control_max = 15
					mobcreation.ki_power_max = 25
				if("Majin Wizard")
					src.icon='Babidi.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Namekian")
					src.icon='Namek - Normal.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.counter = 15
					mobcreation.ki_control = 30
					mobcreation.ki_power = 25
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.counter_max = 15
					mobcreation.ki_control_max = 30
					mobcreation.ki_power_max = 25
				if("Saibaman")
					src.icon='Saibaman - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Saiyan")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert
					src.ApplyIconHair()

					mobcreation.melee = 20
					mobcreation.block = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 15
					mobcreation.melee_max = 20
					mobcreation.block_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 15
				if("Tuffle")
					src.icon='Bebi - Form 1.dmi'
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 20
					mobcreation.block = 20
					mobcreation.dodge = 20
					mobcreation.ki_control = 25
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 20
					mobcreation.block_max = 20
					mobcreation.dodge_max = 20
					mobcreation.ki_control_max = 25
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Feline")
				//	if(src.newskin=="Destructive")
					//	src.icon='Beerus.dmi'
					if(src.newskin=="Chaotic")
						src.icon='BeerusChaotic.dmi'
					else
						src.icon='Beerus.dmi'





					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
				if("Alien")
					mobcreation.contents += new/obj/Transform/Transform
					mobcreation.contents += new/obj/Transform/Revert

					mobcreation.melee = 15
					mobcreation.dodge = 15
					mobcreation.ki_control = 20
					mobcreation.ki_power = 20
					mobcreation.reflect = 15
					mobcreation.melee_max = 15
					mobcreation.dodge_max = 15
					mobcreation.ki_control_max = 20
					mobcreation.ki_power_max = 20
					mobcreation.reflect_max = 15
			mobcreation.save_file_1=src.save_file_1
			mobcreation.save_file_2=src.save_file_2
			mobcreation.save_file_3=src.save_file_3
			mobcreation.icon=src.icon
			mobcreation.hair=src.hair
			mobcreation.overlays+=src.overlays
			mobcreation.race=newrace

			mobcreation.skin=newskin

			mobcreation.hair=newhair
			mobcreation.name=newname
			mobcreation.powerlevel=300
			mobcreation.powerlevel_max=300
			mobcreation.ki=300
			mobcreation.ki_max=300
			mobcreation.kidefense=300
			mobcreation.kidefense_max=300
			mobcreation.strength=250
			mobcreation.strength_max=250
			mobcreation.defence=250
			mobcreation.defence_max=250
			mobcreation.speed=100
			mobcreation.speed_max=100
			mobcreation.zenni=500
			mobcreation.newtype=newtype
		//	mobcreation.power_multi = round(mobcreation.power_multi/5)
		//	mobcreation.ki_multi = round(mobcreation.ki_multi/5)
		//	mobcreation.kidefense_multi = round(mobcreation.kidefense_multi/5)
		//	mobcreation.strength_multi = round(mobcreation.strength_multi/5)
		//	mobcreation.defence_multi = round(mobcreation.defence_multi/5)
			mobcreation.karma="Good"
			mobcreation.karma_rating=1
			/*
			if(src.client.IsByondMember()||src.GMLevel>2)
				mobcreation.level=125
				mobcreation.pk=1
				mobcreation.powerlevel=45000
				mobcreation.powerlevel_max=45000
				mobcreation.ki=45000
				mobcreation.ki_max=45000
				mobcreation.kidefense=45000
				mobcreation.kidefense_max=45000
				mobcreation.strength=30000
				mobcreation.strength_max=30000
				mobcreation.defence=30000
				mobcreation.defence_max=30000
				mobcreation.speed=20000
				mobcreation.speed_max=20000
				mobcreation.zenni=10000
				*/
			if(src.key=="Crimson Slayer"||src.key=="Hammerboy"||src.key=="cazdogga")
		//		mobcreation.staminaleft=999999
		//		mobcreation.staminaleft_max=999999
				mobcreation.exp+=5000
			mobcreation.energy_code=rand(0000001,9999999)
			mobcreation.Power_Birth()
			spawn(-1) mobcreation.BuildChar()
			sleep(20)

			if(!src)return
//			while(!mobcreation.HasCreated)
//				usr << "SLEEP"
///				sleep(20)
		//	alert("OVER")
			src.client.screen=null
			//if(src.remakes<=0)
			//	src.remake_cooldown = world.realtime + 864000
	 	//continue char creation code
			//src.remakes++
		//	while(mobcreation.HasCreated)
		//	var/savefile/S = new("world save files/Remakes.sav")
		//	S["[src.client.computer_id] cooldown"]<<src.remake_cooldown
		//	S["[src.client.computer_id] remakes"]<<src.remakes
		//	src << "You've got [5-src.remakes] remakes left."
			if(src.client.IsByondMember())
				src<<"<font color=#993333>For being a BYOND member, you have received some zenni and a small increase on your basic attributes.</font>"
			player << "<font color = #66CCCC>Server Information: <font color = white>[mobcreation.name] [mobcreation.ckey] has joined the server for the first time!"
		//	src << "<font color=red><font size=3>Welcome to Dragonball: Ruination! Be sure to check out the updated Game Guide."
		//	src << "<font color=red>We are currently . Responsible and knowledgable players to help out newer players. Please apply on the forum.  http://drgonballft.forumotion.net/."
		//	src << "This server is still under development and we would appreciate it if you report all bugs using the bug report verb. That being said, we are also open to your suggestions! Suggestion and Bug Report verbs are in your Channels tab."
			winset(src,"Race","is-visible=false")
			winset(src,"default","alpha=255")

			mobcreation.loc=locate(rand(390,400),rand(245,260),7)
			src.client.mob=mobcreation

			spawn(100)src.client.AutoSave()
			del(src)
mob
	proc
		BuildChar()
			src.frozen = 1
			src.GMLocked = 1
			//alert("build")
			src.Stat_Point_Window_Refresh()
			winset(usr,"multis","is-visible=true")
			winset(usr,"multis","focus=true")

			winshow(usr,"multis",1)
			src.Stat_Point_Window_Refresh()
			while(!src.HasCreated)
		//		world << "SLEEP"
				if(!usr)
		//			usr << "BREAK"
					break
				sleep(20)