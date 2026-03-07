#include "dantom\htmllib"
Form/NewCharacter


	form_window = "window=NewCharacter;titlebar=0;can_close=0;can_minimize=0;size=609x609"

	var
		name
		hair_green as num
		hair_red as num
		hair_blue as num
		skincolor
		skincolor_values=list("White","Tan","Light Brown","Dark Brown","Black")
		hairstyle
		hairstyle_values=list("Long","Spikey","Short","Goku","Vegeta","VegetaGT","Gohan","Spikey Long","Trunks","Future Trunks","Long(Female)","Goten","Large Hair","Punk","Yajirobe","Bald")
		facialhair
		facialhair_values=list("None","Goatee","Goat","Mustache")
		gender
		gender_1 = "Male"
		gender_2 = "Female"
		race
		race_1="Earth-sei-jin"
		race_2="Saiya-jin"
		race_3="Half Saiyajin"
		race_4="Namek-sei-jin"
		race_5="Cell Type Bio-Android"
		race_6="Biological Android"
		race_7="Android"
		race_8="Icer/Changling(Freeza Type)"
		race_9="Demon"
		race_10="Tsufuru-jin"
//		race_11="Buu"
//		race_12="Dragon"
//		race_13="Alien"
	//	race_values = list("Earth-sei-jin", "Saiya-jin", "Half Saiyajin","Namek-sei-jin", "Cell Type Bio-Android","Biological Android","Android", "Icer/Changling(Freeza Type)","Demon","Tsufuru-jin")

	Initialize()

		if (!name)	 name = usr.key
		if (!gender) gender = "Male"
		if (!race)	 race = "Saiya-jin"

	//	usr << browse_rsc('createchar.bmp', "createchar.bmp")


	HtmlLayout()
//		var/mob/creating_character/player = usr

		var/page = {"<body bgcolor=black>
		<table>
		  <tr><td><b><font color=white>Name:</b></td><td>[name]</font></td></tr>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td><b><font color=white>Gender:</font></b></td>
		      <td>
		      [gender_1] <font color=white>Male</font><br>
		      [gender_2] <font color=white>Female</font>
		      </td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td><b><font color=white>Race:</b></td>
		  <td>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rhuman.png">Human [race_1]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rsaiyajin.png">Saiyajin [race_2]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rhalfsaiyajin.png">Half-Saiyajin [race_3]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rnamek.png">Namek [race_4]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rcell.png">Cell Type Android [race_5]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rbioandroid.png">Biological Android [race_6]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/randroid.png">Android [race_7]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/ricer.png">Icer [race_8]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rdemon.png">Demon [race_9]</font><br>
		  <font color=white><img src="http://homepages.ucalgary.ca/~ddvankam/byond/rtsufurujin.png">Tsufurujin [race_10]</font><br>
		  </td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  </table>
		  <br><tr><td><b><font color=white>Skin Color:</b>[skincolor]</font></td>
		  <b><img src="http://homepages.ucalgary.ca/~ddvankam/byond/skincolors.png"><br>

		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		   <br><tr><td><b><font color=white>Hair Style:</b>[hairstyle]</font></td><br>
		  <b><img src="http://homepages.ucalgary.ca/~ddvankam/byond/hairselect.png"><br>

		  <table>
		  <tr><td><b><font color=white>Hair Color(RGB):</b></td><td><font color=white>R</font>[hair_red]<font color=white>G</font>[hair_green]<font color=white>B</font>[hair_blue]</font></td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		   <tr><td><b><font color=white>Facial Hair:</b></td><td>[facialhair]</font></td>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		  <tr><td>&nbsp;</td><td>&nbsp</td></tr>
		   <tr><td>&nbsp;</td><td>[submit]</td></tr>

			</table>
		"}
		return page

	ProcessForm()
		spawn()
			var/char_name = name
			if (!char_name)
				char_name=usr:key
			if(length(char_name) >= 25)
				usr<<"Name to long!"
				char_name=usr:key
			else
				var/counter=0
				var/lenname=length(char_name)
				while(counter<=lenname)
					if(text2ascii(char_name,counter)<123)
						counter+=1
					else
						char_name=usr:key
						counter=lenname+1
			var/mob/new_mob=new/mob


			switch(race)
				if("Demon")
					new_mob = new /mob/characters/demon()
					new_mob.race = "Demon"
					new_mob.icon = 'maledemon.dmi'
					new_mob.hair = "Bald"


				if("Earth-sei-jin")
					new_mob = new /mob/characters/humanjin()
					new_mob.race = "Earth-sei-jin"
					switch(gender)
						if("Male")
							switch(skincolor)
								if("White")
									new_mob.icon = 'male-white.dmi'
									new_mob.skincolor="white"
								if("Tan")
									new_mob.icon = 'male.dmi'
									new_mob.skincolor="tan"
								if("Light Brown")
									new_mob.icon = 'male-lightbrown.dmi'
									new_mob.skincolor="lightbrown"
								if("Dark Brown")
									new_mob.icon = 'male-brown.dmi'
									new_mob.skincolor="darkbrown"
								if("Black")
									new_mob.icon = 'male-black.dmi'
									new_mob.skincolor="black"
						if("Female")
							switch(skincolor)
								if("White")
									new_mob.icon = 'female-pale.dmi'
									new_mob.skincolor="fwhite"
								if("Tan")
									new_mob.icon = 'female.dmi'
									new_mob.skincolor="ftan"
								if("Light Brown")
									new_mob.icon = 'female-lightbrown.dmi'
									new_mob.skincolor="flightbrown"
								if("Dark Brown")
									new_mob.icon = 'female-darkbrown.dmi'
									new_mob.skincolor="fdarkbrown"
								if("Black")
									new_mob.icon = 'female-black.dmi'
									new_mob.skincolor="fblack"

				if("Saiya-jin")
					new_mob = new /mob/characters/saiyajin()
					new_mob.race = "Saiya-jin"
					new_mob.overlays += 'tail.dmi'
					new_mob.contents+= new /obj/SayajinTail
					switch(gender)
						if("Male")
							switch(skincolor)
								if("White")
									new_mob.icon = 'male-white.dmi'
									new_mob.skincolor="white"
								if("Tan")
									new_mob.icon = 'male.dmi'
									new_mob.skincolor="tan"
								if("Light Brown")
									new_mob.icon = 'male-lightbrown.dmi'
									new_mob.skincolor="lightbrown"
								if("Dark Brown")
									new_mob.icon = 'male-brown.dmi'
									new_mob.skincolor="darkbrown"
								if("Black")
									new_mob.icon = 'male-black.dmi'
									new_mob.skincolor="black"
						if("Female")
							switch(skincolor)
								if("White")
									new_mob.icon = 'female-pale.dmi'
									new_mob.skincolor="fwhite"
								if("Tan")
									new_mob.icon = 'female.dmi'
									new_mob.skincolor="ftan"
								if("Light Brown")
									new_mob.icon = 'female-lightbrown.dmi'
									new_mob.skincolor="flightbrown"
								if("Dark Brown")
									new_mob.icon = 'female-darkbrown.dmi'
									new_mob.skincolor="fdarkbrown"
								if("Black")
									new_mob.icon = 'female-black.dmi'
									new_mob.skincolor="fblack"
				if("Tsufuru-jin")
					new_mob = new /mob/characters/tsufurujin()
					new_mob.race = "Tsufuru-jin"
					switch(gender)
						if("Male")
							switch(skincolor)
								if("White")
									new_mob.icon = 'male-white.dmi'
									new_mob.skincolor="white"
								if("Tan")
									new_mob.icon = 'male.dmi'
									new_mob.skincolor="tan"
								if("Light Brown")
									new_mob.icon = 'male-lightbrown.dmi'
									new_mob.skincolor="lightbrown"
								if("Dark Brown")
									new_mob.icon = 'male-brown.dmi'
									new_mob.skincolor="darkbrown"
								if("Black")
									new_mob.icon = 'male-black.dmi'
									new_mob.skincolor="black"
						if("Female")
							switch(skincolor)
								if("White")
									new_mob.icon = 'female-pale.dmi'
									new_mob.skincolor="fwhite"
								if("Tan")
									new_mob.icon = 'female.dmi'
									new_mob.skincolor="ftan"
								if("Light Brown")
									new_mob.icon = 'female-lightbrown.dmi'
									new_mob.skincolor="flightbrown"
								if("Dark Brown")
									new_mob.icon = 'female-darkbrown.dmi'
									new_mob.skincolor="fdarkbrown"
								if("Black")
									new_mob.icon = 'female-black.dmi'
									new_mob.skincolor="fblack"


				if("Half Saiyajin")
					new_mob = new /mob/characters/halfieh()
					new_mob.race = "Halfbreed"
					new_mob.contents += new /obj/SayajinTail
					switch(gender)
						if("Male")
							switch(skincolor)
								if("White")
									new_mob.icon = 'male-white.dmi'
									new_mob.skincolor="white"
								if("Tan")
									new_mob.icon = 'male.dmi'
									new_mob.skincolor="tan"
								if("Light Brown")
									new_mob.icon = 'male-lightbrown.dmi'
									new_mob.skincolor="lightbrown"
								if("Dark Brown")
									new_mob.icon = 'male-brown.dmi'
									new_mob.skincolor="darkbrown"
								if("Black")
									new_mob.icon = 'male-black.dmi'
									new_mob.skincolor="black"
						if("Female")
							switch(skincolor)
								if("White")
									new_mob.icon = 'female-pale.dmi'
									new_mob.skincolor="fwhite"
								if("Tan")
									new_mob.icon = 'female.dmi'
									new_mob.skincolor="ftan"
								if("Light Brown")
									new_mob.icon = 'female-lightbrown.dmi'
									new_mob.skincolor="flightbrown"
								if("Dark Brown")
									new_mob.icon = 'female-darkbrown.dmi'
									new_mob.skincolor="fdarkbrown"
								if("Black")
									new_mob.icon = 'female-black.dmi'
									new_mob.skincolor="fblack"
				if("Namek-sei-jin")
					new_mob = new /mob/characters/namekjin()
					new_mob.hair = "Bald"
					hairstyle="Bald"
					facialhair="None"
					new_mob.race = "Namek-jin"
					new_mob.icon = 'namek.dmi'
				if("Cell Type Bio-Android")
					new_mob.hair = "Bald"
					hairstyle="Bald"
					facialhair="None"
					new_mob = new /mob/characters/bioandroidcell()
					new_mob.race = "Bio-Android"
					new_mob.verbs+= /mob/Absorb/verb/Absorb
					new_mob.skillabsorb=1


				if("Biological Android")
					new_mob = new /mob/characters/bioandroidone()
					new_mob.icon = 'male.dmi'
					new_mob.race = "Biological Android"
					switch(gender)
						if("Male")
							switch(skincolor)
								if("White")
									new_mob.icon = 'male-white.dmi'
									new_mob.skincolor="white"
								if("Tan")
									new_mob.icon = 'male.dmi'
									new_mob.skincolor="tan"
								if("Light Brown")
									new_mob.icon = 'male-lightbrown.dmi'
									new_mob.skincolor="lightbrown"
								if("Dark Brown")
									new_mob.icon = 'male-brown.dmi'
									new_mob.skincolor="darkbrown"
								if("Black")
									new_mob.icon = 'male-black.dmi'
									new_mob.skincolor="black"
						if("Female")
							switch(skincolor)
								if("White")
									new_mob.icon = 'female-pale.dmi'
									new_mob.skincolor="fwhite"
								if("Tan")
									new_mob.icon = 'female.dmi'
									new_mob.skincolor="ftan"
								if("Light Brown")
									new_mob.icon = 'female-lightbrown.dmi'
									new_mob.skincolor="flightbrown"
								if("Dark Brown")
									new_mob.icon = 'female-darkbrown.dmi'
									new_mob.skincolor="fdarkbrown"
								if("Black")
									new_mob.icon = 'female-black.dmi'
									new_mob.skincolor="fblack"
				if("Android")
					new_mob = new /mob/characters/android()
					new_mob.icon = 'bioandroid-two.dmi'
					new_mob.race = "Android"
					switch(input("Do you want to customize your skin color?", "Character Creation") in list ("Yes", "No"))
						if("Yes")
							var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb((red),0,0)
							var/blue = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,(blue),0)
							var/green = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,0,(green))
						if("No")
							switch(gender)
								if("Male")
									switch(skincolor)
										if("White")
											new_mob.icon = 'male-white.dmi'
											new_mob.skincolor="white"
										if("Tan")
											new_mob.icon = 'male.dmi'
											new_mob.skincolor="tan"
										if("Light Brown")
											new_mob.icon = 'male-lightbrown.dmi'
											new_mob.skincolor="lightbrown"
										if("Dark Brown")
											new_mob.icon = 'male-brown.dmi'
											new_mob.skincolor="darkbrown"
										if("Black")
											new_mob.icon = 'male-black.dmi'
											new_mob.skincolor="black"
								if("Female")
									switch(skincolor)
										if("White")
											new_mob.icon = 'female-pale.dmi'
											new_mob.skincolor="fwhite"
										if("Tan")
											new_mob.icon = 'female.dmi'
											new_mob.skincolor="ftan"
										if("Light Brown")
											new_mob.icon = 'female-lightbrown.dmi'
											new_mob.skincolor="flightbrown"
										if("Dark Brown")
											new_mob.icon = 'female-darkbrown.dmi'
											new_mob.skincolor="fdarkbrown"
										if("Black")
											new_mob.icon = 'female-black.dmi'
											new_mob.skincolor="fblack"

				if("Icer/Changling(Freeza Type)")
					new_mob = new /mob/characters/changling()
					new_mob.race = "Changling"
					new_mob.hair = "Bald"
					hairstyle="Bald"
					facialhair="None"
			new_mob.malepatch=1
			new_mob.senzupatch=1
			new_mob.iconpatchki=5
			new_mob.patchpowerlevel=1
//			new_mob.guildwipe=1
			switch(facialhair)
				if("None")
					..()
				if("Goatee")
					new_mob.overlays += 'black_goatee.dmi'
					..()
				if("Goat")
					new_mob.overlays += 'black_goat.dmi'
					..()
				if("Mustache")
					new_mob.overlays += 'black_mustache.dmi'
					..()
			switch(hairstyle)
				if("Goten")
					new_mob.hair = "goten"
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					var/hairover = 'hair_goten.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Large Hair")
					new_mob.hair = "kros_long"
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					var/hairover = 'hair_kros_long.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Punk")
					new_mob.hair = "punk"
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					var/hairover = 'hair_punk.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Radditz")
					new_mob.hair = "radditz"
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					var/hairover = 'hair_radditz.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Yajirobe")
					new_mob.hair = "yajirobe"
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					var/hairover = 'hair_yajirobe.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Bald")
					new_mob.hair = "Bald"
				if("Short")
					new_mob.hair = "Short"
					var/hairover = 'hair_dan_short.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Gohan")
					new_mob.hair = "Gohan"
					var/hairover = 'hair_Gohan.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Spikey Long")
					new_mob.hair = "Spikey Long"
					var/hairover = 'hair_dan_spikey.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Trunks")
					new_mob.hair = "Trunks"
					var/hairover = 'hair_trunks.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Future Trunks")
					new_mob.hair = "Future Trunks"
					var/hairover = 'Futuretrunkshair.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Spikey")
					new_mob.hair = "Spikey"
					var/hairover = 'hair_dan_spikeyshort.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Long")
					new_mob.hair = "Long"
					var/hairover = 'hair_dan_long.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Goku")
					new_mob.hair = "Goku"
					var/hairover = 'hair_dan_goku.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Vegeta")
					new_mob.hair = "Vegeta"
					var/hairover = 'hair_dan_vegeta.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("VegetaGT")
					new_mob.hair = "VegetaGT"
					var/hairover = 'hair_dan_vegetagt.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
				if("Long(Female)")
					new_mob.hair = "Female"
					var/hairover = 'fem-hair-long.dmi'
					var/hairred =text2num(hair_red)
					var/hairblue =text2num(hair_blue)
					var/hairgreen =text2num(hair_green)
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.hairicon=hairover
					new_mob.overlays += new_mob.hairicon
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 100
			new_mob.dead = 0
			new_mob.maxpowerlevel = 100
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.talk = 1
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.bangtechlearn=0
			new_mob.focustechlearn = 0
			new_mob.flightlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob << browse(null, "window=NewCharacter")
			usr << browse(null, "window=NewCharacter")

			new_mob.random = rand(1,750)
			if(new_mob.random == 75)
				switch(input("You have been born a Buu Demon. Do you wish to keep this? Or continue old character?") in list ("Make Buu Demon","Keep Old Character"))
					if("Make Buu Demon")
						new_mob.move = 1
						new_mob.focused = 0
						new_mob.overlays = 0
						new_mob.powerlevel = 5
						new_mob.maxpowerlevel = 5
						new_mob.strength = 1
						new_mob.rage = 0
						new_mob.rage = 0
						new_mob.stamina = 100
						new_mob.maxstamina = 100
						new_mob.state = ")v(ajin"
						new_mob.kaioken = 0
						new_mob.zenni = 0
						new_mob.faceicon = 'default.dmi'
						new_mob.kitech = "None"
						new_mob.auratech = "None"
						new_mob.kitechlearn = 0
						new_mob.dead = 0
						new_mob.auratechlearn = 0
						new_mob.focustechlearn = 0
						new_mob.kicolor = "None"
						new_mob.focus = "None"
						new_mob.stylename = "Calming"
						new_mob.flightlearn = 0
						new_mob.title = ""
						new_mob.race = "Buu Demon"
						new_mob.icon = 'buu.dmi'
						new_mob.maxpowerlevel += rand(1,15000)
						new_mob.verbs += /mob/wrap/verb/Wrap
						new_mob.verbs +=  /mob/regen/verb/Regeneration
						new_mob.verbs +=  /mob/uniscan/verb/Uni_Scan
						new_mob.verbs += /mob/kiabsorb/verb/Ki_Absorb
						new_mob.verbs +=  /mob/Kaioken/verb/Kaioken
						new_mob.skillwrap=1
						new_mob.skillregeneration=1
						new_mob.skilluniversalscan=1
						new_mob.skillkiabsorb=1
						new_mob.skillkaioken=1
			else
				..()
			new_mob.npp = 0
			new_mob.inventorypatch=1
			new_mob.iconswipe=1
			new_mob.moneypatch=1
			new_mob << sound(null)
			new_mob.name = char_name
			usr.client.mob = new_mob
			new_mob.loc = locate(70,82,10)
			creating=0
			del(src)
			return









client
	proc
		SaveMob()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			if(src.mob)
				if(src.mob.hasfused==0)
					var/char_ckey = cKey(src.mob.name) //Que?
					F["/[ckey]/[char_ckey]"]<<src.mob
		LoadMob(char_ckey)
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			F["/[ckey]/[char_ckey]"]>>src.mob

mob/verb/Ki_Use_Configure()
	set name = "--Ki Use Configure--"
	set category = "Fighting"
	var/list/skilllist = new()
	var/kamehameha = "Kamehameha"
	var/masenko = "Masenko"
	var/galekgun= "Galek Gun"
	var/dondonpa= "Dondonpa"
	var/doubletsui= "Double Tsuihikidan"
	var/burningattack= "Burning Attack"
	var/chainblast= "Makankosappo"
	var/finalflash="Final Flash"
	var/kienzan= "Kienzan"
	var/choukamehameha="Chou Kamehameha"
	var/homingkienzan="Homing Kienzan"
	var/bigbangattack= "Big Bang Attack"
	var/chobakuretsumaha="Chobakuretsumaha"
	var/customattack="Custom Attack"
	var/revengedeathball= "Revenge Death Ball"
	var/dragonfist="Dragonfist"
	var/custom_1="[usr.customattacks[1]]"
	var/custom_2="[usr.customattacks[2]]"
	var/custom_3="[usr.customattacks[3]]"
	var/custom_4="[usr.customattacks[4]]"
	var/custom_5="[usr.customattacks[5]]"
	var/custom_6="[usr.customattacks[6]]"
	var/custom_7="[usr.customattacks[7]]"
	var/custom_8="[usr.customattacks[8]]"
	var/custom_9="[usr.customattacks[9]]"
	var/custom_10="[usr.customattacks[10]]"
	var/cancel="Cancel"
	if(usr.skillkamehameha==1)
		skilllist += kamehameha
	if(usr.skillmasenko==1)
		skilllist += masenko
	if(usr.skillgalekgun==1)
		skilllist += galekgun
	if(usr.skilldondonpa==1)
		skilllist += dondonpa
	if(usr.skilldoubletsui==1)
		skilllist += doubletsui
	if(usr.skillburningattack==1)
		skilllist += burningattack
	if(usr.skillspecialbeamcannon==1)
		skilllist += chainblast
	if(usr.skillfinalflash==1)
		skilllist += finalflash
	if(usr.skillkienzan==1)
		skilllist += kienzan
	if(usr.skillchoukamehameha==1)
		skilllist += choukamehameha
	if(usr.skilldragonfist==1)
		skilllist += dragonfist
	if(usr.skillhomingkienzan==1)
		skilllist += homingkienzan
	if(usr.skillbigbangattack==1)
		skilllist += bigbangattack
	if(usr.skillchobakuretsumaha==1)
		skilllist += chobakuretsumaha
	if(usr.skillrevengedb==1)
		skilllist += revengedeathball
	if(usr.customtechlearn==1)
		skilllist += customattack
	if(usr.customattacks[1])
		skilllist+=custom_1
	if(usr.customattacks[2])
		skilllist+=custom_2
	if(usr.customattacks[3])
		skilllist+=custom_3
	if(usr.customattacks[4])
		skilllist+=custom_4
	if(usr.customattacks[5])
		skilllist+=custom_5
	if(usr.customattacks[6])
		skilllist+=custom_6
	if(usr.customattacks[7])
		skilllist+=custom_7
	if(usr.customattacks[8])
		skilllist+=custom_8
	if(usr.customattacks[9])
		skilllist+=custom_9
	if(usr.customattacks[10])
		skilllist+=custom_10
	skilllist += cancel
	var/kiuse
	var/result = input("Choose Skill", "Skills") in skilllist
	if(result==kamehameha)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[1]=kiuse
	if(result==masenko)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[2]=kiuse
	if(result==galekgun)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[3]=kiuse
	if(result==dondonpa)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[4]=kiuse
	if(result==doubletsui)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[5]=kiuse
	if(result==burningattack)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[6]=kiuse
	if(result==chainblast)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[7]=kiuse
	if(result==finalflash)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[8]=kiuse
	if(result==kienzan)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[9]=kiuse
	if(result==choukamehameha)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[10]=kiuse
	if(result==homingkienzan)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[11]=kiuse
	if(result==bigbangattack)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[12]=kiuse
	if(result==chobakuretsumaha)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[13]=kiuse
	if(result==customattack)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[14]=kiuse
	if(result==custom_1)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[15]=kiuse
	if(result==custom_2)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[16]=kiuse
	if(result==custom_3)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[17]=kiuse
	if(result==custom_4)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[18]=kiuse
	if(result==custom_5)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[19]=kiuse
	if(result==custom_6)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[20]=kiuse
	if(result==custom_7)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[21]=kiuse
	if(result==custom_8)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[22]=kiuse
	if(result==custom_9)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[23]=kiuse
	if(result==custom_10)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[24]=kiuse
	if(result==revengedeathball)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.skillkiusage[25]=kiuse
	if(result==dragonfist)
		kiuse=input("How much Ki do you want to allocate to this skill ?","Ki Use") as num
		if(kiuse<=0)
			kiuse=1
		src.dragonfistcost=kiuse


mob/characters
	Move()
		if(usr.move==1)
			for(var/mob/monsters/O as mob)
				if(O.isnap)
					O.isnap=0
					if(istype(O,/mob/monsters/people))
						spawn()O:Wander()
					else
						spawn()O:LifeCycle()
		..()
	Logout()
		world<<"<u><b><font color=Green>[src.name]/[src.key] Has logged out.</font color></u></b>"
		src.invisibility=1
		src.musicp=0
	//	src.client.SaveMob()
		src.key="logging out"
		sleep(50)
		del(src)

mob/other/choosing_character
	Login()
		src.client.view=src.savedview
		src.sight = 0
		src.name = ""
		src.loc=locate(146,41,10)
		src.move = 0
	//	src << 'TAU_kurenai.mid'
	//	src << 'dbgt-ending4-machine-gun.mid'
	//	src << 'gekisenintro.wav'
		src.checkban2()
//
mob/creatingcharacter
	var
		Form/NewCharacter/char_form = new()
		error_text = ""
	Login()
		src.name=""
		spawn()
			src.char_form.DisplayForm()
mob/choosingcharacter
	Login()
		src.name=""
		spawn()
			src.ChooseCharacter()
mob/deletingcharacter
	Login()
		src.name=""
		spawn()
			src.DeleteCharacter()


mob/choosingcharacter
	proc
		ChooseCharacter()
			while(1)
				var/list/characters = src.CharacterList()
				var/newCharacterChoice = "New Character"
				var/DeleteCharacterChoice = "Delete Character"
				var/list/menu = new()
				menu += characters
				menu += newCharacterChoice
				menu += DeleteCharacterChoice
				var/result = input(src,"Character Creation", "Dragonball Gekisen") in menu
				if (result == newCharacterChoice)
					var/newmob=new/mob/creatingcharacter(locate(src.x,src.y,src.z))
					src.client.mob=newmob
					del(src)
					return
				if (result == DeleteCharacterChoice)
					var/newmob=new/mob/deletingcharacter(locate(src.x,src.y,src.z))
					src.client.mob=newmob
					del(src)
					return
				else
					if(characters.len>3)
						alert(src,"You have more than the max amount of characters, please delete your unused ones and try again")
					else
						src.client.LoadMob(result)
						del(src)
						return

mob
	proc
		CharacterList()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			F.cd = "/[ckey]"
			var/list/characters = F.dir
			return characters
mob/deletingcharacter
	proc
		DeleteCharacter()
			if(src.client)
				alert("WARNING YOU ARE ABOUT TO CHOOSE A CHARACTER TO DELETE!!!")
				var/firstletter=copytext(src.ckey, 1, 2)
				var/savefile/F = new("players/[firstletter]/[src.ckey].sav")

				F.cd = "/[ckey]"
				var/list/characters = F.dir

				var/CancelCharacterDeletion = "Decline"
				var/list/menu = new()
				menu += characters
				menu += CancelCharacterDeletion

				var/result = input("Delete character", "DELETE") in menu

				if (result)
					F.cd = "/[ckey]"
					F.dir.Remove(result)
				var/newmob=new/mob/choosingcharacter(locate(src.x,src.y,src.z))
				usr.client.mob=newmob
				del(usr)


mob/proc/CreateNewCharacter()
	var/newmob=new/mob/creatingcharacter
	usr.client.mob=newmob
	del(usr)


mob
	Write(savefile/F)
		..()
		F["last_x"] << x
		F["last_y"] << y
		F["last_z"] << z


	Read(savefile/F)
		..()
		var/last_x
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z
		loc = locate(last_x, last_y, last_z)

	proc
		aprise()
			set background = 1
			if(src.dieprocran==1)
				sleep(30)
				src.dieprocran=0
			sleep(10)
			spawn()src.oozarucheck()
			src.earthballs= (src.gotdb1+src.gotdb2+src.gotdb3+src.gotdb4+src.gotdb5+src.gotdb6+src.gotdb7)
			sleep(1000)
			if(src.dieprocran==1)
				sleep(30)
				src.dieprocran=0
			src.guildpause=0
			if(src.client)
				if(client.inactivity<=2000)
					src.trainingcredits+=1
					if(src.trainingcredits>5)
						src.trainingcredits=5
					src.ap+=1
			src.guildcool=0
			src.complaincool--
			if(src.zenni>10000000)
				src.zenni=10000000

			if(src.ap>100)
				src.ap=100
			if(src.ap<-100)
				src.ap=-100
			if(src.ap=="NaN")
				src.ap=0
			if(src.powerlevel=="NaN")
				src.powerlevel=1
			src.ap=round(src.ap)
			if(src.fused==1&&src.porattafuse==0)
				spawn(4000)
					if(src.fused==1&&src.porattafuse==0)
						src.fused=0
						src.overlays=0
						src.overlays=src.ooverlays.Copy(1,0)
						src.state = "Normal"
						src.underlays=0
						src.name=src.oname
						src.maxpowerlevel=src.omaxpowerlevel
						src.powerlevel=src.maxpowerlevel
						src.invisibility=0
						src<< "The Fusion wore off"
						src.fusioncool=1
						src.fusebitch=0
						src.hasfused=0

			if(src.fusioncool==1)
				spawn(4000)
					src.fusioncool=0

			spawn()aprise()

	proc
		oozarucheck()
			var/random=rand(1,20)
			if(random==9&&src.race=="Halfbreed"||random==9&&src.race=="Saiya-jin")
				src<<"The full moon has come out"
				src.verbs+=/mob/oozaru/verb/Turn_Oozaru
				if(src.maxpowerlevel>=10000000)
					src.verbs+=/mob/oozaru/verb/Turn_SSJ_Oozaru
			else
				src.verbs-=/mob/oozaru/verb/Turn_Oozaru
				src.verbs-=/mob/oozaru/verb/Turn_SSJ_Oozaru
				src.revertoozara()
			if(random==9&&src.race=="Tsufuru-jin")
				src<<"The full moon has come out"
				if(src.maxpowerlevel>=10000000 && src.evolution==3)
					src.verbs+=/mob/oozaru/verb/Turn_Bebi_Oozaru
			else
				src.verbs-=/mob/oozaru/verb/Turn_Bebi_Oozaru
				src.revertoozara()
	proc
		checkgm()
			if(src.gmlevel<=0)
				if(src.powerlevel<0)
					src.powerlevel=0
			else
				if(src.gmlevel == 4)
					src.verbs += /mob/Admin/verb/PlayerFreeze
					src.verbs += /mob/Admin/verb/PlayerUnfreeze
					src.verbs += /mob/Admin/verb/PlayerUnfreezeAll
					src.verbs += /mob/Admin/verb/Request_Icon
					src.verbs += /mob/Admin/verb/Request_File
					src.verbs += /mob/Admin/verb/Duplicate
					src.verbs += /mob/Admin/verb/Duplicate
					src.verbs += /mob/Admin/verb/Own
					src.verbs += /mob/Admin/verb/Dragonball_Summon
					src.verbs += /mob/Admin/verb/unMute
					src.verbs += /mob/Admin/verb/unMuteAll
					src.verbs += /mob/Admin/verb/Mute
					src.verbs += /mob/Admin/verb/Dragonball_Scat
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/CreateSpecialItem
					src.verbs += /mob/Admin/verb/Boot
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/AdminTeleport
					src.verbs += /mob/Admin/verb/AdminKill
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/Summon
					src.verbs += /mob/Admin/verb/Unsummon
					src.verbs += /mob/Admin/verb/Edit
					src.verbs +=/mob/Admin/verb/Debug
					src.verbs += /mob/Admin/verb/Createmob
					src.verbs += /mob/Admin/verb/Rename
					src.verbs += /mob/Admin/verb/Revive
					src.verbs += /mob/Admin/verb/PowerBoost
					src.verbs += /mob/Admin/verb/Restore
					src.verbs += /mob/Admin/verb/Purify
					src.verbs += /mob/Admin/verb/Inform
					src.verbs += /mob/Admin/verb/Prices
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/ChangeOthersIcon
					src.verbs += /mob/Admin/verb/Beetchshlap
					src.verbs += /mob/Admin/verb/PowerHungrah
					src.verbs += /mob/Admin/verb/sfc
					src.verbs += /mob/Admin/verb/Delete
					src.verbs += /mob/Admin/verb/MadSkills
					src.verbs += /mob/Admin/verb/Add_Overlay
					src.verbs += /mob/Admin/verb/Add_Underlay
					src.verbs += /mob/Admin/verb/Remove_Overlay
					src.verbs += /mob/Admin/verb/Remove_Underlay
				//	src.oocname = "<font color=yellow>Level 4 God</font>"
					src.gm = 4

				if(src.gmlevel == 3)
					src.verbs +=/mob/Admin/verb/Debug
					src.verbs += /mob/Admin/verb/unMute
					src.verbs += /mob/Admin/verb/Mute
					src.verbs += /mob/Admin/verb/Dragonball_Scat
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/CreateSpecialItem
					src.verbs += /mob/Admin/verb/Boot
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/AdminTeleport
					src.verbs += /mob/Admin/verb/AdminKill
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/Summon
					src.verbs += /mob/Admin/verb/Unsummon
					src.verbs += /mob/Admin/verb/Edit
					src.verbs += /mob/Admin/verb/Createmob
					src.verbs += /mob/Admin/verb/Rename
					src.verbs += /mob/Admin/verb/Revive
					src.verbs += /mob/Admin/verb/PowerBoost
					src.verbs += /mob/Admin/verb/Restore
					src.verbs += /mob/Admin/verb/Purify
					src.verbs += /mob/Admin/verb/Inform
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/ChangeOthersIcon
					src.verbs += /mob/Admin/verb/Beetchshlap
					src.verbs += /mob/Admin/verb/MakeBuu
					src.verbs += /mob/Admin/verb/PowerHungrah
					src.verbs += /mob/Admin/verb/sfc
					src.verbs += /mob/Admin/verb/Delete
					src.verbs += /mob/Admin/verb/MadSkills
					src.verbs += /mob/Admin/verb/Add_Overlay
					src.verbs += /mob/Admin/verb/Add_Underlay
					src.verbs += /mob/Admin/verb/Remove_Overlay
					src.verbs += /mob/Admin/verb/Remove_Underlay

			//		src.oocname = "<font color=silver>Level 3 God</font>"
					src.gm = 3

				if(src.gmlevel == 2)
					src.verbs +=/mob/Admin/verb/Debug
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/CreateSpecialItem
					src.verbs += /mob/Admin/verb/Boot
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/AdminTeleport
					src.verbs += /mob/Admin/verb/AdminKill
					src.verbs += /mob/Admin/verb/Special_Announce
					src.verbs += /mob/Admin/verb/Summon
					src.verbs += /mob/Admin/verb/Unsummon
					src.verbs += /mob/Admin/verb/Edit
					src.verbs += /mob/Admin/verb/Createmob
					src.verbs += /mob/Admin/verb/Rename
					src.verbs += /mob/Admin/verb/Revive
					src.verbs += /mob/Admin/verb/Restore
					src.verbs += /mob/Admin/verb/Purify
					src.verbs += /mob/Admin/verb/Inform
					src.verbs += /mob/Admin/verb/Create
					src.verbs += /mob/Admin/verb/ChangeOthersIcon
					src.verbs += /mob/Admin/verb/Beetchshlap
					src.verbs += /mob/Admin/verb/PowerHungrah
					src.verbs += /mob/Admin/verb/sfc
					src.verbs += /mob/Admin/verb/Delete
					src.verbs += /mob/Admin/verb/MadSkills
					src.verbs += /mob/Admin/verb/Add_Overlay
					src.verbs += /mob/Admin/verb/Add_Underlay
					src.verbs += /mob/Admin/verb/Remove_Overlay
					src.verbs += /mob/Admin/verb/Remove_Underlay

				//	src.oocname = "<font color=green>Level 2 God</font>"
					src.gm = 2

				if(src.gmlevel == 1)
					src.verbs +=/mob/Admin/verb/Debug
					src.verbs += /mob/Admin/verb/AdminTeleport
					src.verbs += /mob/Admin/verb/Summon
					src.verbs += /mob/Admin/verb/Unsummon
					src.verbs += /mob/Admin/verb/Inform
					src.verbs += /mob/Admin/verb/Revive
					src.verbs += /mob/Admin/verb/Beetchshlap
					src.verbs += /mob/Admin/verb/Special_Announce

				//	src.oocname = "<font color=white>Level 1 God</font>"
					src.gm = 1



	proc
		sample_report()
			src << "<b><font size = 1><font color = silver><center>Gekisen made by Masterdan."
			sleep(4)
			src << "<b><center><font size =1><font color=red>Being Updated by a new Dragonball Gekisen Staff!"
			sleep(2)
			src << "<b><center><font size=-1>Check the BYOND Browser for the website, transformation and rule information!"
			var/A = {"<font size = 1><font face=arial><Center><STYLE>
			BODY {background: black; color: white; font-size: 10px;}
			.fontsizet{font-size: 10px;}
			.trans-red{color:#FF0000;font-size:10px;;valign:top;}
			.trans-white{color:#FFFFFF;font-size:10px;;valign:top;}
			.trans-align{valign:top;}
			.rules-c{font-color:#FFFFFF;font-size:10px;}
			.fi{font-color:#FFFFFF;font-size:10px;}
			</STYLE>
			<div calss="headertxt" align="center">
			<strong><font size = 1><font color = silver><center>Gekisen Engine made by: MasterDan."</strong><br/>
			<strong><font size =1><font color=red>Being Updated by a new Dragonball Gekisen Staff!"</strong><br/>
			CORNERS:<br>
			Every Player/GM is having their own corner! Players and GMs can post stuff there for them whats new, suggestions, etc... ONLY players logged in's corners will be shown.<br><br>
			"}


			for(var/mob/M in world)
				if(M.key)
					if(!M.corner)
						A+= "[M.name] has not created his corner (yet).<br><br>"
					else
						A+= "[M.name]'s Corner<br><br>"
						A+= "[M.corner]"
						A+= "<br><br>"

			src << browse(A)

		//
