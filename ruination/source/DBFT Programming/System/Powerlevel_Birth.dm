mob
	proc
		Android_Multi()
			src.power_multi = 5
			src.ki_multi = 4
			src.strength_multi = 4
			src.defence_multi = 5
			//src.speed_multi = 4
		Android_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 3
			src.strength_multi -= 4
			src.defence_multi -= 5
			//src.speed_multi -= 4
		Android21_Multi()
			src.power_multi = 4
			src.ki_multi = 4
			src.strength_multi = 4
			src.defence_multi = 2

		Android21_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 2

		Bio_Android_Multi()
			src.power_multi = 4
			src.ki_multi = 3
			//src.kidefense_multi = 3
			src.strength_multi = 5
			src.defence_multi = 5
			//src.speed_multi = 10
		Bio_Android_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 3
			//src.kidefense_multi -= 3
			src.strength_multi -= 5
			src.defence_multi -= 5
			//src.speed_multi -= 10
		Bio_Warrior_Multi()
			src.power_multi = 3
			src.ki_multi = 5
			//src.kidefense_multi = 4
			src.strength_multi = 5
			src.defence_multi = 3
			//src.speed_multi = 12
		Bio_Warrior_Multi_Minus()
			src.power_multi -= 3
			src.ki_multi -= 5
			//src.kidefense_multi -= 4
			src.strength_multi -= 5
			src.defence_multi -= 3
			//src.speed_multi -= 12
		Changeling_Multi()
			src.power_multi = 5
			src.ki_multi = 4
			//src.kidefense_multi = 5
			src.strength_multi = 4
			src.defence_multi = 2
			//src.speed_multi = 10
			if(src.gene == "Pure Blooded")
				src.strength_multi += 1
				src.defence_multi += 1
			if(src.gene == "Rageful")
				src.ki_multi += 1
				src.power_multi += 1
			if(src.gene == "Vindictive")
				src.icon=null
				src.overlays=null
				src.icon='Cooler - Form.dmi'
				src.newskin = "C"
				src.power_multi += 1
				src.defence_multi += 1
			if(src.gene == "Regalis")
				src.power_multi += 2
				src.defence_multi += 1
				src.icon='KC-Form-1.dmi'

		Changeling_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 5
			src.strength_multi -= 4
			src.defence_multi -= 2
			//src.speed_multi -= 10
			if(src.gene == "Pure Blooded")
				src.strength_multi -= 1
				src.defence_multi -= 1
			if(src.gene == "Rageful")
				src.ki_multi -= 1
				src.power_multi -= 1
			if(src.gene == "Vindictive")
				src.power_multi -= 1
				src.defence_multi -= 1
			if(src.gene == "Regalis")
				src.power_multi -= 2
				src.defence_multi -= 1

		Demon_Multi()
			src.power_multi = 5
			src.ki_multi = 4
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 3
			//src.speed_multi = 8


		Demon_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 3
			//src.speed_multi -= 8


		Dragon_Multi()
			src.power_multi = 5
			src.ki_multi = 3
			//src.kidefense_multi = 5
			src.strength_multi = 4
			src.defence_multi = 6
			//src.speed_multi = 12
		Dragon_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 3
			//src.kidefense_multi = 5
			src.strength_multi -= 4
			src.defence_multi -= 6
			//src.speed_multi -= 12
		Half_Saiyan_Multi()
			src.power_multi = 4
			src.ki_multi = 3
			//src.kidefense_multi = 4
			src.strength_multi = 3
			src.defence_multi = 3
			//src.speed_multi = 8
			if(src.gene == "Mystic")
				src.ki_multi += 2
				src.strength_multi -= 1
				src.defence_multi -= 1
			if(src.gene == "Rageful")
				src.ki_multi += 1
				src.strength_multi += 1
				src.power_multi += 1

		Half_Saiyan_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 3
			//src.kidefense_multi -= 4
			src.strength_multi -= 3
			src.defence_multi -= 3
			//src.speed_multi -= 8
			if(src.gene == "Mystic")
				src.ki_multi -= 2
				src.strength_multi += 1
				src.defence_multi += 1
			if(src.gene == "Rageful")
				src.ki_multi -= 1
				src.strength_multi -= 1
				src.power_multi -= 1

		Heran_Multi()
			src.power_multi = 4
			src.ki_multi = 3
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 4
			//src.speed_multi = 5
			if(src.gene == "Pure Blooded")
				src.strength_multi += 1
				src.defence_multi += 1
		Heran_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 3
			//src.kidefense_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 4
			//src.speed_multi -= 5
			if(src.gene == "Pure Blooded")
				src.strength_multi -= 1
				src.defence_multi -= 1
		Human_Multi()
			src.power_multi = 5
			src.ki_multi = 4
			//src.kidefense_multi = 5
			src.strength_multi = 3
			src.defence_multi = 3
			//src.speed_multi = 5
			if(src.gene == "Bloodthirsty")
				src.strength_multi += 2


		Human_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 5
			src.strength_multi -= 3
			src.defence_multi -= 3
			//src.speed_multi -= 5
			if(src.gene == "Bloodthirsty")
				src.strength_multi -= 2



		Kai_Multi()
			src.power_multi = 4
			src.ki_multi = 5
			//src.kidefense_multi = 4
			src.strength_multi = 2
			src.defence_multi = 2
			//src.speed_multi += 5
			if(src.gene=="Zealot")
				src.icon=null
				src.overlays=null
				src.icon='ZealotKai.dmi'
		//		src.overlays += 'Hit Armour.dmi'
				src.strength_multi += 1
				src.defence_multi += 1


		Kai_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 5
			//src.kidefense_multi -= 4
			src.strength_multi -= 2
			src.defence_multi -= 2
			//src.speed_multi -= 5
			if(src.gene=="Zealot")
				src.strength_multi -= 1
				src.defence_multi -= 1
				//src.ki_multi += 1


		Konat_Multi()
			src.power_multi = 5
			src.ki_multi = 3
			//src.kidefense_multi = 4
			src.strength_multi = 5
			src.defence_multi = 3
			//src.speed_multi = 5
		Konat_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 3
			//src.kidefense_multi -= 4
			src.strength_multi -= 5
			src.defence_multi -= 3
			//src.speed_multi -= 5
		Majin_Multi()
			src.power_multi = 5
			src.ki_multi = 3
			//src.kidefense_multi = 4
			src.strength_multi = 3
			src.defence_multi = 4
			//src.speed_multi = 5
		Majin_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 3
			//src.kidefense_multi -= 4
			src.strength_multi -= 3
			src.defence_multi -= 4
			//src.speed_multi -= 5
		Majin_Incar_Multi()
			src.power_multi = 2
			src.ki_multi = 5
			//src.kidefense_multi = 5
			src.strength_multi = 5
			src.defence_multi = 4
			//src.speed_multi = 5
		Majin_Incar_Multi_Minus()
			src.power_multi -= 2
			src.ki_multi -= 5
			//src.kidefense_multi -= 5
			src.strength_multi -= 5
			src.defence_multi -= 4
			//src.speed_multi -= 5
		Majin_Wizard_Multi()
			src.power_multi = 6
			src.ki_multi = 4
			//src.kidefense_multi = 3
			src.strength_multi = 3
			src.defence_multi = 2
			//src.speed_multi = 4
		Majin_Wizard_Multi_Minus()
			src.power_multi -= 6
			src.ki_multi -= 4
			//src.kidefense_multi -= 3
			src.strength_multi -= 3
			src.defence_multi -= 2
			//src.speed_multi -= 4
		Namekian_Multi()
			src.power_multi = 6
			src.ki_multi = 4
			//src.kidefense_multi = 4
			src.strength_multi = 2
			src.defence_multi = 6
			//src.speed_multi = 5
		Namekian_Multi_Minus()
			src.power_multi -= 6
			src.ki_multi -= 4
			//src.kidefense_multi -= 4
			src.strength_multi -= 2
			src.defence_multi -= 6
			//src.speed_multi -= 5
		Saibaman_Multi()
			src.power_multi = 4
			src.ki_multi = 4
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 3
			//src.speed_multi = 5
		Saibaman_Multi_Minus()
			src.power_multi -= 4
			src.ki_multi -= 4
			//src.kidefense_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 3
			//src.speed_multi -= 5
		Saiyan_Multi()
			src.power_multi = 4
			src.ki_multi = 4
			//src.kidefense_multi = 3
			src.strength_multi = 2
			src.defence_multi = 3
			//src.speed_multi = 4
			if(src.gene == "Honourable")
				src.strength_multi += 2
			if(src.gene == "Prideful")
				src.ki_multi += 2

		Saiyan_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 4
			src.strength_multi -= 2
			src.defence_multi -= 3
			//src.speed_multi -= 4
			if(src.gene == "Honourable")
				src.strength_multi -= 2
			if(src.gene == "Prideful")
				src.ki_multi -= 2
		Tuffle_Multi()
			src.power_multi = 5
			src.ki_multi = 4
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 4
			//src.speed_multi = 5
			if(src.gene == "Venerable")
				src.power_multi += 2
				src.ki_multi -= 1
				src.strength_multi -= 1
		Tuffle_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 4
			//src.kidefense_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 4
			//src.speed_multi -= 5
			if(src.gene == "Venerable")
				src.power_multi -= 2
				src.ki_multi += 1
				src.strength_multi += 1
		Feline_Multi()
			src.power_multi = 5
			src.ki_multi = 6
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 3
			//src.speed_multi = 5.5
		Feline_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 6
			//src.kidefense_multi -= 4
			src.strength_multi -= 4
			src.defence_multi -= 3
			//src.speed_multi -= 5.5
		Alien_Multi()
			src.power_multi = 4
			src.ki_multi = 4
			//src.kidefense_multi = 4
			src.strength_multi = 4
			src.defence_multi = 3
			//src.speed_multi = 5

			if(src.gene=="Hitman")
				src.icon=null
				src.overlays=null
				src.icon='Hit.dmi'
				src.overlays += 'Hit Armour.dmi'
			if(src.gene=="Pride Trooper")
				src.icon=null
				src.overlays=null
				src.icon='Jiren.dmi'
				src.overlays += 'Pride Trooper.dmi'


			if(src.gene=="Yardrat")
				src.icon='YardratBase.dmi'
			if(src.gene=="Moro")
				src.icon='Moro Base.dmi'
			if(src.gene=="Kamenian")
				src.icon='Kamenian.dmi'
			if(src.gene=="Rebrianne")
				src.icon = 'rebrianne1.dmi'


			if(src.gene=="Lycanthrope")
				switch(alert("Which Lycanthrope?","Lycanthrope","Basil","Bergamo","Lavender"))
					if("Basil")
						src.icon='Basil.dmi'

					if("Bergamo")
						src.icon='Bergamo.dmi'
					if("Lavender")
						src.icon='Lavender.dmi'

		Alien_Multi_Minus()
			src.power_multi -= 5
			src.ki_multi -= 5
			//src.kidefense_multi -= 4
			src.strength_multi -= 5
			src.defence_multi -= 4
			//src.speed_multi -= 5

		Power_Birth()

			//winshow(usr,"default",0)
//			var/genetype=rand(1,100)
/* Here you want to change the likely hood of getting a gene on a race, so you can change what gene is gotten on what race and add Majin incar and uub to seperate race to make it relevant if you want etc.
	You can also change the % likely hood of getting the gene, it goes between 10 and 100 to select warrior level and from warrior level the chance of getting a better gene are improved
	% Chance as below -
	God - 5%
	Legend - 8%
	Elite - 11%
	Hard - 13%
	Medium - 16%
	Low - 20%
	Weakling - 27%*/

//Weakling warrior level is achieved with a 27% chance



			if(src.newtype=="Gluttonous")
				src.gene="Gluttonous"
				src.Android21_Multi()

			if(src.race == "Android" && src.gene != "Gluttonous")
				switch(alert("Choose your gene","Choose Your Gene","Mechanical","Bionic"))
					if("Mechanical")
						src.gene = "Mechanical"
					else
						src.gene = "Bionic"
				src.Android_Multi()




			if(src.race == "Bio Android")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Perfect"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					else
						src.gene = "Perfect"
				src.Bio_Android_Multi()

			if(src.race == "Bio Warrior")
				switch(alert("Choose your gene","Choose Your Gene","Primitive","Genetically Modified"))
					if("Primitive")
						src.gene = "Primitive"
					else
						src.gene = "Genetically Modified"
				src.Bio_Warrior_Multi()

			if(src.race == "Changeling")
				switch(input("Choose your gene","Choose Your Gene") in list("Rageful","Vindictive","Regalis"))
				//switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Rageful","Vindictive"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					if("Rageful")
						src.gene = "Rageful"
					if("Vindictive")
						src.gene = "Vindictive"
					if("Regalis")
						src.gene = "Regalis"
				src.Changeling_Multi()

			if(src.race == "Demon")
				switch(input("Choose your gene","Choose Your Gene") in list("Malevolent","Vile","Sinister","Fomhoire"))
					if("Malevolent")
						src.gene = "Malevolent"
					if("Vile")
						src.gene = "Vile"
						src.icon = 'Demon - Janemba.dmi'
					if("Sinister")
						src.gene = "Sinister"
					if("Fomhoire")
						src.gene = "Fomhoire"
						src.icon = 'Demon - Form 4.dmi'
						switch(input("Choose your hair type","Hair Type") in list("Goku","Vegeta","Teen Gohan","Adult Gohan","Future Gohan","Hercule","Raditz","Teen Trunks","Female Long","Female Ponytail"))
		//					if("Bald")
		//						src.hair="Bald"
							if("Goku")
								src.hair="Goku"
							if("Vegeta")
								src.hair="Vegeta"
							if("Teen Gohan")
								src.hair="Teen Gohan"
							if("Adult Gohan")
								src.hair="Adult Gohan"
							if("Future Gohan")
								src.hair="Future Gohan"
							if("Hercule")
								src.hair="Herule"
							if("Teen Trunks")
								src.hair="Teen Trunks"
							if("Female Long")
								src.hair="Female Long"
							if("Female Ponytail")
								src.hair="Female Ponytail"
							if("Raditz")
								src.hair="Raditz"

				src.Demon_Multi()

			if(src.race == "Dragon")
				switch(alert("Choose your gene","Choose Your Gene","Fierce","Almighty","Desolate"))
					if("Fierce")
						src.gene = "Fierce"
					if("Almighty")
						src.gene = "Almighty"
					if("Desolate")
						src.gene = "Desolate"
				src.Dragon_Multi()

			if(src.race == "Half Saiyan")
				switch(alert("Choose your gene","Choose Your Gene","Mystic","Legendary","Rageful"))
					if("Mystic")
						src.gene = "Mystic"
					if("Legendary")
						src.gene = "Legendary"
					if("Rageful")
						src.gene = "Rageful"
				src.Half_Saiyan_Multi()

			if(src.race == "Heran")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Primal"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					else
						src.gene = "Primal"
				src.Heran_Multi()

			if(src.race == "Human")

				switch(input("Choose your gene","Choose Your Gene") in list("Pure Blooded","Mystic","Majin Incarnate","Bloodthirsty","Roshi"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					if("Mystic")
						src.gene = "Mystic"
					if("Majin Incarnate")
						src.gene = "Majin Incarnate"
					if("Bloodthirsty")
						src.gene = "Bloodthirsty"
					if("Roshi")
						src.gene = "Roshi"
						if(src.skin=="darkf"||src.skin=="dark")
						//	world << "Dark Roshi"
							src.icon = 'Male Roshi - Dark.dmi'
						if(src.skin=="whitef"||src.skin=="white")
							src.icon = 'Male Roshi - White.dmi'
						if(src.skin=="tanf"||src.skin=="tan")
							src.icon = 'Male Roshi - Tan.dmi'


				src.Human_Multi()

			if(src.race == "Kai")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Zealot"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					else
						src.gene = "Zealot"
				src.Kai_Multi()

			if(src.race == "Konat")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Brave"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					else
						src.gene = "Brave"
				src.Konat_Multi()

			if(src.race == "Majin")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Malicious"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					else
						src.gene = "Malicious"
				src.Majin_Multi()

			if(src.race == "Majin Wizard")
				switch(alert("Choose your gene","Choose Your Gene","Fiendish","Diabolical"))
					if("Fiendish")
						src.gene = "Fiendish"
					else
						src.gene = "Diabolical"

				src.Majin_Wizard_Multi()

			if(src.race == "Majin Incarnate")
				switch(alert("Choose your gene","Choose Your Gene","Fiendish","Diabolical"))
					if("Fiendish")
						src.gene = "Fiendish"
					else
						src.gene = "Diabolical"
				src.Majin_Incar_Multi()

			if(src.race == "Namekian")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Descendant","Corrupted"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					if("Descendant")
						src.gene = "Descendant"
					if("Corrupted")
						src.gene = "Corrupted"
				src.Namekian_Multi()

			if(src.race == "Saibaman")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Virulent","Godly"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					if("Virulent")
						src.gene = "Virulent"
					if("Godly")
						src.gene = "Godly"
				src.Saibaman_Multi()

			if(src.race == "Saiyan")
				//switch(alert("Choose your gene","Choose Your Gene","Honourable","Prideful","Godly"))
				switch(input("Choose your gene","Choose Your Gene") in list("Honourable","Prideful","Legendary","Godly"))
					if("Honourable")
						src.gene = "Honourable"
					if("Prideful")
						src.gene = "Prideful"
					if("Legendary")
						src.gene = "Legendary"
					if("Godly")
						src.gene = "Godly"
				src.Saiyan_Multi()

			if(src.race == "Tuffle")
				switch(alert("Choose your gene","Choose Your Gene","Pure Blooded","Virulent","Venerable"))
					if("Pure Blooded")
						src.gene = "Pure Blooded"
					if("Virulent")
						src.gene = "Virulent"
					if("Venerable")
						src.gene = "Venerable"
						src.icon='Universe 2 Tuffle - Form 1.dmi'
				src.Tuffle_Multi()



			if(src.race == "Feline")
				switch(alert("Choose your gene","Choose Your Gene","Destructive","Godly"))
					if("Destructive")
						src.gene = "Destructive"
					else
						src.gene = "Godly"
				src.Feline_Multi()

			if(src.race == "Alien")
				var/list/menu = list()
				menu += "Hitman"
				menu += "Pride Trooper"
				menu += "Yardrat"
				menu += "Moro"
				menu += "Lycanthrope"
				menu += "Kamenian"
				if(src.rebirths >= 3)
					menu += "Rebrianne"
				switch(input("What type of Alien would you like to be?") in menu)


			//	switch(input("What type of Alien would you like to be?","Pick Alien Gene") in list("Hitman","Pride Trooper","Lycanthrope","Moro","Yardrat","Kamenian"))
					if("Hitman")
						src.gene = "Hitman"
					if("Pride Trooper")
						src.gene = "Pride Trooper"
					if("Yardrat")
						src.gene = "Yardrat"
					if("Moro")
						src.gene = "Moro"

					if("Lycanthrope")
						src.gene = "Lycanthrope"
					if("Kamenian")
						src.gene = "Kamenian"
					if("Rebrianne")
						src.gene = "Rebrianne"


				src.Alien_Multi()
//			alert("SUCCESS")
	//		winset(usr, null,
  //"mainwindow.output.background-color=#ffffff;mainwindow.input.background-color=#ffffff")
//			winset(usr,"multis","is-visible=true")
//			winset(usr,"multis","focus=true")

//			winshow(usr,"multis",1)
//			usr.Stat_Point_Window_Refresh()
		//	alert("You are about to be spawned in the safe zone")
//mob
//	proc
//		WarriorLevelSet()

/*
			var/p = 0
			var/pp = rand(1,100)

			if(pp >= 1 && pp < 30)
				p = rand(100,500)
				src.powerlevel_max = p
			/*
				src.power_multi += 1
				src.ki_multi += 1
				src.kidefense_multi += 1
				src.strength_multi += 1
				src.defence_multi += 1
				src.speed_multi += 1
				*/
				src.expb=1
				src.warrior_level = "Weakling"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"
			if(pp >= 30 && pp < 50)

//Low Powerlevel is achieved with a 20% chance
				p = rand(300,600)
				src.powerlevel_max = p
				src.power_multi += 0.25
				src.ki_multi += 0.25
				src.kidefense_multi += 0.25
				src.strength_multi += 0.25
				src.defence_multi += 0.25
				src.speed_multi += 0.25
				src.expb=0.80
				src.warrior_level = "Low"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

//Medium warrior level is achieved with a 16% chance

			if(pp >= 50 && pp < 68)
				p = rand(400,700)
				src.powerlevel_max = p
				src.power_multi += 0.5
				src.ki_multi += 0.5
				src.kidefense_multi += 0.5
				src.strength_multi += 0.5
				src.defence_multi += 0.5
				src.speed_multi += 0.5
				src.expb=0.6
				src.warrior_level = "Medium"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

//Hard warrior level is achieved with a 13% chance

			if(pp >= 68 && pp < 80)
				p = rand(500,800)
				src.powerlevel_max = p
				src.power_multi += 0.75
				src.ki_multi += 0.75
				src.kidefense_multi += 0.75
				src.strength_multi += 0.75
				src.defence_multi += 0.75
				src.speed_multi += 0.75
				src.expb=0.4
				src.warrior_level = "High"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

//Elite warrior level is achieved with a 11% chance

			if(pp >= 80 && pp < 90)
				p = rand(600,900)
				src.powerlevel_max = p
				src.power_multi += 1
				src.ki_multi += 1
				src.kidefense_multi += 1
				src.strength_multi += 1
				src.defence_multi += 1
				src.speed_multi += 1
				src.expb=0.2
				src.warrior_level = "Elite"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

//Legend warrior level is achieved with a 8% chance

			if(pp >=90  && pp < 97)
				p = rand(800,1000)
				src.powerlevel_max = p
				src.power_multi += 1.25
				src.ki_multi += 1.25
				src.kidefense_multi += 1.25
				src.strength_multi += 1.25
				src.defence_multi += 1.25
				src.speed_multi += 1.25
				src.expb=0.1
				src.warrior_level = "Legend"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

//God warrior level is achieved with a 5% chance

			if(pp >=97 && pp<=100)
				p = rand(1000,2000)
				src.powerlevel_max = p
				src.power_multi += 1.5
				src.ki_multi += 1.5
				src.kidefense_multi += 1.5
				src.strength_multi += 1.5
				src.defence_multi += 1.5
				src.speed_multi += 1.5
				src.warrior_level = "God"
				sleep(5)
				src << "You were born with a Powerlevel of [p]!"

				*/
/*
			if(src.GMLevel>2)
				src.powerlevel_max+=45000
				src.powerlevel+=45000
				src.ki_control+=5
				src.ki_power+=5
				src.reflect+=5
				src.melee+=5
				src.dodge+=5
*/