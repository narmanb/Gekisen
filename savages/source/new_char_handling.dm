
mob/Login()
	CheckBan(src)
	src.loc = locate(77,85,1)
	src.move = 1
	src.ko = 0
	src.blocking = 0
	src.ptime = 0
	src.kiin = 0
	src.grav = 0
	src.combo = 0
	src.angered = 0
//	src.oicon = src.icon
	src.powerlevel = src.maxpowerlevel
	src.tech = 0
	src.gainzenni = 0
	src.slap = 0
	src.styleicon = ""
	src.entime = 0
	src.sight = 0
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.overlays -= /obj/kame
	src.focused = 0
	src.spar = 0
	src.speed = 0
	src.resting = 0
	src.newspaper = 0
	src.icon_state = ""
	src.ased = 0
	src.talk = 1
	src.fusetime = 100
	src.plarper = 1
	src.absorb = 0
	src.flight = 0
	src.tayio = 0
	src.see_invisible = 1
	src.training = 0
	src.density = 1
	src.safe = 0
	src.meditate = 0
	src.medtime = 0
	src.talk = 1
	src.entime = 0
	src.medtime = 0
	src.move = 1
	src:sight = 0
	powerlevelRefresh(src)
	if(src.race == "Bio-Android Cell")
		src.verbs += /obj/cellabsorb/verb/CellAbsorb
	usr << "Please click EXTRA and Reload Corner to view the news, player's corners (little websites)"
	src.loc=locate(77,85,1)








world
	//name = "Dragonball Zeta (Player Server)"
	name = "DBZ Savages"
mob/Logout()
	if(/mob/other/choosing_character)
	else
		world << "<tt><I><font color = green>--[name] the [race] has logged out!--</tt>"
	del(src)

client/proc/SaveMob()
	var/firstletter=copytext(src.ckey, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	var/char_ckey = cKey(src.mob.name)
	F["/[ckey]/[char_ckey]"]<<src.mob
	Ranking(src)
proc/Log()
	var/savefile/F = new("Logfile.sav")
	F["[usr.name]"] << usr.name
	F["[usr.Clan]"] << usr.Clan
proc/Checkclan()
	var/savefile/F = new("Logfile.sav")
	var/clancheck
	F["[usr.name]"] >> clancheck
	F["[usr.Clan]"] >> clancheck
	if(usr.name == clancheck && usr.Clan == clancheck)
		usr << "Your Clan information has been stored"
mob/verb/Clans()
	var/firstletter=copytext(src.name, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	var/char_ckey = cKey(src.name)
	var/counter1
	set category = "Clans"
	F["/[ckey]/[char_ckey]"]<<src
	for(var/mob/characters/M in world)
		if(M.key)
			if(M.clanmember)
				usr<<"<font color=yellow><b>[M.clanmember]</b><font color=blue>---[M.name]---<font color=red>[M.clanrank]"
				counter1 = 0
				if(M.clanmember == usr.clanmember)
					counter1 += 1
				usr<<"Clan members online: [counter1]"



client/proc/LoadMob(char_ckey)
	var/firstletter=copytext(src.ckey, 1, 2)
	var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
	F["/[ckey]/[char_ckey]"]>>src.mob

client/Del()
	if (istype(src.mob, /mob/))
		return ..()

	src.SaveMob()
	return ..()



mob/other/choosing_character
	Login()
		src.loc=locate(111,117,10)
		usr.move = 0
		usr.sight = 0
		spawn(src)
			LoginScreen()
	menucreatecharacter
		icon = 'NPCS.dmi'
		name = "New Character"
		layer = MOB_LAYER + 999999999999999999999999999
		density = 1
		Click()
			if(src in view(6))
				CreateNewCharacter()
	menulogin
		icon = 'NPCS.dmi'
		name = "Login"
		layer = MOB_LAYER + 999999999999999999999999999
		density = 1
		Click()
			if(src in view(6))
				ChooseCharacter()
	menudelete
		icon = 'NPCS.dmi'
		name = "Delete"
		layer = MOB_LAYER + 999999999999999999999999999
		density = 1
		Click()
			if(src in view(6))
				DeleteCharacter()
mob/other/choosing_character
	proc
		LoginScreen()
			var/list/choosechar = "Choose Character"
			var/list/deletechar = "Delete Character"
			var/list/newchar = "New Character"

			var/result = alert("Character Creation","DBZ Power",newchar,deletechar,choosechar)
			if(result == choosechar)
				ChooseCharacter()
			if(result == deletechar)
				DeleteCharacter()
			else
				CreateNewCharacter()
		ChooseCharacter()
			var/list/characters = src.CharacterList()
			var/list/Cancel = "Cancel"
			var/list/menu = new()
			menu += characters
			menu += Cancel

			var/result = input("Character Creation", "DBZ Power") in menu
			if(result == Cancel)
				LoginScreen()
			else
				var/success = src.client.LoadMob(result)

				if (success)
					del(src)
				else
					alert("I like cheese..")
					src.ChooseCharacter()

		CharacterList()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")
			F.cd = "/[ckey]"
			var/list/characters = F.dir
			return characters

		DeleteCharacter()
			var/firstletter=copytext(src.ckey, 1, 2)
			var/savefile/F = new("players/[firstletter]/[src.ckey].sav")

			F.cd = "/[ckey]"
			var/list/characters = F.dir

			var/CancelCharacterDeletion = "Decline"
			var/list/menu = new()
			menu += characters
			menu += CancelCharacterDeletion

			var/result = input("Delete character", "Character Creation") in menu

			if (result)
				F.cd = "/[ckey]"
				F.dir.Remove(result)
			if (result == CancelCharacterDeletion)
				LoginScreen()
			else

mob/other/choosing_character/proc/CreateNewCharacter()

	var/prompt_title = "Character Creation"
	var/help_text = "What is your name? NO HTML or the names on the hud and screen will not display correctly, as well as the scoreboard! "
	var/default_value = ""
	var/char_name = input(src, help_text, prompt_title, default_value) as null|text
	src.overlays += /obj/hud/nametext1
	if (!char_name)
		src.ChooseCharacter()
		return

	var/ckey_name = ckey(char_name)
	var/list/characters = CharacterList()
	if (characters.Find(ckey_name))
		alert("Nope, dont be a faka...")
		src.CreateNewCharacter()
		return

	alert("By pressing 'Ok', you agree to respect Dragonslayer4000! the creator, and also not to steal any coding/icons of this game. This game is copyrighted under a court of law. If you shall steal anything from this game, you shall be fined.")
	alert("Also, please do not SPAM or LAG other people. You dont want to piss Unknown1 off even more....that sadistic little bitch. ^_^ (Im talking to myself....)")
	help_text = "What race do you wish to be?"
	var/list/races = list("Earth-sei-jin", "Saiya-jin", "Halfbreed", "Namek-sei-jin", "Biological Android","Android", "Changling","Demon")
	default_value = "Earth-sei-jin"
	var/char_race = input(src, help_text, prompt_title, default_value) in races
	var/mob/new_mob
	switch(char_race)
		if("Demon")
			new_mob = new /mob/characters/humanjin()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 800
			new_mob.dead = 0
			new_mob.maxpowerlevel = 800
			new_mob.strength = 2
			new_mob.rage = 0
			new_mob.speed = 0
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.zenni = 3000
			new_mob.faceicon = 'default.dmi'
			new_mob.will = 0
			new_mob.exp = 0
			new_mob.maxhealth = 10
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.talk = 1
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.bangtechlearn=0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			new_mob.style = 'style-cosmic.dmi'
			new_mob.stylename = "Demon"
			new_mob.flightlearn = 0
			new_mob.race = "Demon"
			new_mob.title = ""



			switch(alert("What tint of skin color do you want?","Character Creation","Red"))
				if("Red")
					new_mob.icon = 'Janemba.dmi'




		if("Earth-sei-jin")
			new_mob = new /mob/characters/humanjin()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.dead = 0
			new_mob.maxpowerlevel = 5
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.maxhealth = 10
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.zenni = 3000
			new_mob.faceicon = 'default.dmi'
			new_mob.will = 0
			new_mob.speed = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.talk = 1
			new_mob.bangtechlearn =0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Earth-sei-jin"
			new_mob.title = ""

			switch(input("What hair style do you want?", text) in list(,"Long","Spikey","Short","Goku","Vegeta","Bald","Gohan"))

				if("Bald")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Bald"
				if("Gohan")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Gohan"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_Gohan.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover
				if("Short")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Short"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_short.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover




				if("Spikey")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Spikey"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_spikey.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover


				if("Long")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "long"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_long.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover

				if("Vegeta")
					switch(alert("What kind of facial hair do you want?", text) in list ("None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Vegeta"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_vegeta.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue

				if("Goku")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Goku"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_goku.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover
			switch(alert("What Gender do you want?","Character Creation","Female", "Male"))
				if("Male")
					switch(alert("What tint of skin color do you want?", ,"White (Pale)", "Tan", "Dark Brown","Olive"))
						if("White (Pale)")
							new_mob.icon = 'male-white.dmi'
						if("Tan")
							new_mob.icon = 'male.dmi'
						if("Dark Brown")
							new_mob.icon = 'male-black.dmi'
						if("Olive")
							new_mob.icon = 'male-olive.dmi'
				if("Female")
					new_mob.icon='female.dmi'

		if("Saiya-jin")
			new_mob = new /mob/characters/saiyajin()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.strength = 1
			new_mob.dead = 0
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.gonessj = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.honor = 0
			new_mob.speed = 0
			new_mob.gonessj = 0
			new_mob.maxhealth = 10
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.bangtechlearn=0
			new_mob.auratechlearn = 0
			new_mob.kaioken = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Saiya-jin"
			new_mob.overlays += /obj/tail
			new_mob.title = ""
			new_mob.talk = 1

			switch(input("What hair style do you want?", text)in list("Long","Spikey","Short","Goku","Vegeta","Bald","Gohan"))

				if("Bald")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Bald"
				if("Gohan")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Gohan"
					var/hairover = 'hair_Gohan.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover
				if("Short")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Short"
					var/hairover = 'hair_black_short.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover




				if("Spikey")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Spikey"
					var/hairover = 'hair_black_spikey.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover


				if("Long")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "long"
					var/hairover = 'hair_black_long.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover

				if("Vegeta")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Vegeta"
					var/hairover = 'hair_vegeta.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover
				if("Goku")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Goku"
					var/hairover = 'hair_goku.dmi'
					hairover += rgb(0,0,0)
					new_mob.overlays += hairover


			switch(alert("What Gender do you want?","Character Creation","Female", "Male"))
				if("Male")
					switch(alert("What tint of skin color do you want?", ,"White (Pale)", "Tan", "Dark Brown","Olive"))
						if("White (Pale)")
							new_mob.icon = 'male-white.dmi'
							new_mob.styleicon = "White"
						if("Tan")
							new_mob.icon = 'male.dmi'
							new_mob.styleicon = "Tan"
						if("Dark Brown")
							new_mob.icon = 'male-black.dmi'
							new_mob.styleicon = "Brown"
						if("Olive")
							new_mob.icon = 'male-olive.dmi'
							new_mob.styleicon = "Olive"
				if("Female")
					new_mob.icon='female.dmi'




		if("Halfbreed")
			new_mob = new /mob/characters/halfieh()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.gonessj = 0
			new_mob.will = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.maxhealth = 10
			new_mob.honor = 0
			new_mob.speed = 0
			new_mob.state = "Normal"
			new_mob.gonessj = 0
			new_mob.purity = 0
			new_mob.dead = 0
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.bangtechlearn = 0
			new_mob.father = "Unknown"
			new_mob.kaioken = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Saiya-jin"
			new_mob.title = ""
			new_mob.talk = 1
			switch(input("What hair style do you want?", text) in list("Long","Spikey","Short","Goku","Vegeta","Bald","Gohan"))

				if("Bald")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Bald"
				if("Gohan")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Gohan"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_Gohan.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover
				if("Short")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Short"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_short.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover




				if("Spikey")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Spikey"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_spikey.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover


				if("Long")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "long"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_long.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover

				if("Vegeta")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Vegeta"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_vegeta.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue

				if("Goku")
					switch(alert("What kind of facial hair do you want?","Character Creation","None","Goatee","Goat", "Mustache"))
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
					new_mob.hair = "Goku"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_goku.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover

			switch(alert("What Gender do you want?","Character Creation","Female", "Male"))
				if("Male")
					switch(alert("What tint of skin color do you want?", ,"White (Pale)", "Tan", "Dark Brown","Olive"))
						if("White (Pale)")
							new_mob.icon = 'male-white.dmi'
						if("Tan")
							new_mob.icon = 'male.dmi'
						if("Dark Brown")
							new_mob.icon = 'male-black.dmi'
						if("Olive")
							new_mob.icon = 'male-olive.dmi'
				if("Female")
					new_mob.icon='female.dmi'



		if("Namek-sei-jin")

			new_mob = new /mob/characters/namekjin()
			new_mob.hair = "Bald"
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.maxpowerlevel = 5
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.speed = 0
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.state = "Normal"
			new_mob.bangtechlearn=0
			new_mob.kaioken = 0
			new_mob.maxhealth = 10
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.honor = 0
			new_mob.purity = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.dead = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.title = ""
			new_mob.race = "Namek-jin"
			new_mob.icon = 'namek.dmi'
			new_mob.talk = 1
			switch(alert("What tint of skin color do you want?","Character Creation","Green", "Dark Green"))
				if("Green")
					new_mob.icon = 'namek.dmi'
				if("Dark Green")
					new_mob.icon = 'namek-dark.dmi'

		if("Biological Android")
			switch(alert("What type?","Character Creation","Type 001 (Human)","Type000(Cell Type)"))
				if("Type000(Cell Type)")
					usr.icon = 'Cell.dmi'
					new_mob = new /mob/characters/bioanndroidcell()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.powerlevel = 100
					new_mob.maxpowerlevel = 100
					new_mob.strength = 1
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.rage = 0
					new_mob.kaioken = 0
					new_mob.rage = 0
					new_mob.stamina = 100
					new_mob.state = "Normal"
					new_mob.bangtechlearn=0
					new_mob.maxstamina = 100
					new_mob.faceicon = 'default.dmi'
					new_mob.zenni = 3000
					new_mob.will = 0
					new_mob.maxhealth = 10
					new_mob.exp = 0
					new_mob.maxexp = 500
					new_mob.health = 10
					new_mob.defense = 2
					new_mob.speed = 0
					new_mob.dead = 0
					new_mob.honor = 0
					new_mob.purity = 0
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					//new_mob.style = 'style-calming.dmi'
					//new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Bio-Android Cell"
					new_mob.talk = 1



				if("Type 001 (Human)")
					usr.icon = 'male.dmi'
					new_mob = new /mob/characters/bioandroidone()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.powerlevel = 100
					new_mob.maxpowerlevel = 100
					new_mob.strength = 1
					new_mob.rage = 0
					new_mob.rage = 0
					new_mob.bangtechlearn=0
					new_mob.stamina = 100
					new_mob.maxstamina = 100
					new_mob.zenni = 3000
					new_mob.faceicon = 'default.dmi'
					new_mob.state = "Normal"
					new_mob.will = 0
					new_mob.exp = 0
					new_mob.maxexp = 500
					new_mob.health = 10
					new_mob.defense = 2
					new_mob.dead = 0
					new_mob.maxhealth = 10
					new_mob.speed = 0
					new_mob.honor = 0
					new_mob.loc=locate(100,125,10)
					new_mob.purity = 0
					new_mob.kaioken = 0
					new_mob.maxstamina = 100
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					//new_mob.style = 'style-calming.dmi'
					//new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1

					switch(input("What hair style do you want?",text)in list("Long","Spikey","Short","Bald"))

						if("Bald")
							new_mob.hair = "Bald"

						if("Short")
							new_mob.hair = "Short"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_short.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover


						if("Spikey")
							new_mob.hair = "Spikey"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_spikey.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover



						if("Long")
							new_mob.hair = "long"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_long.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover


					switch(alert("What Gender do you want?","Character Creation","Female", "Male"))
						if("Male")
							switch(alert("What tint of skin color do you want?","Character Creation","White (Pale)", "Tan", "Dark Brown","Olive"))
								if("White (Pale)")
									new_mob.icon = 'male-white.dmi'
								if("Tan")
									new_mob.icon = 'male.dmi'
								if("Dark Brown")
									new_mob.icon = 'male-black.dmi'
								if("Olive")
									new_mob.icon = 'male-olive.dmi'
						if("Female")
							new_mob.icon='female.dmi'



				if("Type A001 (Human w/ different skin colors)")
					new_mob = new /mob/characters/bioandroidtwo()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.powerlevel = 100
					new_mob.maxpowerlevel = 100
					new_mob.strength = 1
					new_mob.rage = 0
					new_mob.rage = 0
					new_mob.stamina = 100
					new_mob.maxstamina = 100
					new_mob.zenni = 3000
					new_mob.will = 0
					new_mob.exp = 0
					new_mob.maxhealth = 10
					new_mob.maxexp = 500
					new_mob.health = 10
					new_mob.defense = 2
					new_mob.faceicon = 'default.dmi'
					new_mob.dead = 0
					new_mob.state = "Normal"
					new_mob.kaioken = 0
					new_mob.honor = 0
					new_mob.purity = 0
					new_mob.speed = 0
					new_mob.bangtechlearn=0
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					//new_mob.style = 'style-calming.dmi'
					//new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1
					switch(input("What hair style do you want?",text)in list("Long","Spikey","Short","Bald"))

						if("Bald")
							new_mob.hair = "Bald"

						if("Short")
							new_mob.hair = "Short"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_short.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover



						if("Spikey")
							new_mob.hair = "Spikey"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_spikey.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover



						if("Long")
							new_mob.hair = "long"
							var/hairred = input("How much red do you want to put into your hair?") as num
							var/hairblue = input("How much blue do you want to put into your hair?") as num
							var/hairgreen = input("How much green do you want to put into your hair?") as num
							var/hairover = 'hair_black_long.dmi'
							hairover += rgb(hairred,hairgreen,hairblue)
							new_mob.rhair = hairred
							new_mob.ghair = hairgreen
							new_mob.bhair = hairblue
							new_mob.overlays += hairover




					switch(alert("Do you want to customize your skin color?", "Character Creation","Yes", "No"))
						if("Yes")
							var/red = input("How much red (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb((red),0,0)
							var/blue = input("How much green (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,(blue),0)
							var/green = input("How much blue (out of the RGB) do you want to put in your skin?| (0,0,0) = Black | (255,255,255) = White. |") as num|null
							new_mob.icon += rgb(0,0,(green))
						if("No")
							..()


				if("Type 002 (Blue Dragon)")
					usr.icon = 'bioandroid-one.dmi'
					new_mob = new /mob/characters/bioandroidthree()
					new_mob.move = 1
					new_mob.focused = 0
					new_mob.powerlevel = 100
					new_mob.maxpowerlevel = 100
					new_mob.strength = 1
					new_mob.mother = "None"
					new_mob.father = "None"
					new_mob.rage = 0
					new_mob.maxhealth = 10
					new_mob.kaioken = 0
					new_mob.rage = 0
					new_mob.speed = 0
					new_mob.stamina = 100
					new_mob.state = "Normal"
					new_mob.bangtechlearn=0
					new_mob.maxstamina = 100
					new_mob.faceicon = 'default.dmi'
					new_mob.zenni = 3000
					new_mob.will = 0
					new_mob.exp = 0
					new_mob.maxexp = 500
					new_mob.health = 10
					new_mob.defense = 2
					new_mob.dead = 0
					new_mob.honor = 0
					new_mob.purity = 0
					new_mob.kitech = "None"
					new_mob.auratech = "None"
					new_mob.kitechlearn = 0
					new_mob.auratechlearn = 0
					new_mob.focustechlearn = 0
					new_mob.kicolor = "None"
					new_mob.focus = "None"
					//new_mob.style = 'style-calming.dmi'
					//new_mob.stylename = "Calming"
					new_mob.flightlearn = 0
					new_mob.title = ""
					new_mob.race = "Biological Android"
					new_mob.talk = 1




		if("Android")

			new_mob = new /mob/characters/android()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 100
			new_mob.maxpowerlevel = 100
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.rage = 0
			new_mob.faceicon = 'default.dmi'
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.zenni = 3000
			new_mob.will = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.maxhealth = 10
			new_mob.dead = 0
			new_mob.state = "Normal"
			new_mob.kaioken = 0
			new_mob.mother = "None"
			new_mob.father = "None"
			new_mob.honor = 0
			new_mob.speed = 0
			new_mob.purity = 0
			new_mob.kitech = "None"
			new_mob.bangtechlearn=0
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.title = ""
			new_mob.icon = 'bioandroid-two.dmi'
			new_mob.race = "Android"
			new_mob.talk = 1
			switch(alert("What hair style do you want?","Long","Spikey","Short","Bald"))
				if("Bald")
					new_mob.hair = "Bald"

				if("Short")
					new_mob.hair = "Short"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_short.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover



				if("Spikey")
					new_mob.hair = "Spikey"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_spikey.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover

				if("Long")
					new_mob.hair = "long"
					var/hairred = input("How much red do you want to put into your hair?") as num
					var/hairblue = input("How much blue do you want to put into your hair?") as num
					var/hairgreen = input("How much green do you want to put into your hair?") as num
					var/hairover = 'hair_black_long.dmi'
					hairover += rgb(hairred,hairgreen,hairblue)
					new_mob.rhair = hairred
					new_mob.ghair = hairgreen
					new_mob.bhair = hairblue
					new_mob.overlays += hairover
			switch(alert("What Gender do you want?","Character Creation","Female", "Male"))
				if("Male")
					switch(alert("What tint of skin color do you want?", ,"White (Pale)", "Tan", "Dark Brown","Olive"))
						if("White (Pale)")
							new_mob.icon = 'male-white.dmi'
						if("Tan")
							new_mob.icon = 'male.dmi'
						if("Dark Brown")
							new_mob.icon = 'male-black.dmi'
						if("Olive")
							new_mob.icon = 'male-olive.dmi'
				if("Female")
					new_mob.icon='female.dmi'


		if("Changling")
			new_mob = new /mob/characters/changling()
			new_mob.move = 1
			new_mob.focused = 0
			new_mob.powerlevel = 5
			new_mob.dead = 0
			new_mob.maxpowerlevel = 5
			new_mob.strength = 1
			new_mob.rage = 0
			new_mob.exp = 0
			new_mob.maxexp = 500
			new_mob.health = 10
			new_mob.defense = 2
			new_mob.kaioken = 0
			new_mob.rage = 0
			new_mob.speed = 0
			new_mob.maxhealth = 10
			new_mob.stamina = 100
			new_mob.maxstamina = 100
			new_mob.mother = "Unknown"
			new_mob.father = "Unknown"
			new_mob.bangtechlearn=0
			new_mob.zenni = 3000
			new_mob.faceicon = 'default.dmi'
			new_mob.will = 0
			new_mob.honor = 0
			new_mob.gonessj = 0
			new_mob.state = "Normal"
			new_mob.purity = 0
			new_mob.talk = 1
			new_mob.kitech = "None"
			new_mob.auratech = "None"
			new_mob.kitechlearn = 0
			new_mob.auratechlearn = 0
			new_mob.focustechlearn = 0
			new_mob.kicolor = "None"
			new_mob.focus = "None"
			//new_mob.style = 'style-calming.dmi'
			//new_mob.stylename = "Calming"
			new_mob.flightlearn = 0
			new_mob.race = "Changling"
			new_mob.title = ""


	switch(alert("Do you want a title?","Character Creation","Yes","No"))
		if("Yes")
			var/amount = alert("What do you want your title to be? (You may use HTML, but please end it with </font>).") as text|null
			new_mob.title = amount
		if("No")
			..()

	switch(alert("What alignment do you want? (Its important you know the advantages/disadvantages of each alignment.","Character Creation","Good", "Evil"))
		if("Good")
			usr.alignment = "Good"
			usr.random = rand(1,1000)
			if(usr.random == 1000)
				if(usr.race == "Saiya-jin")
					world << "<b><font color = green>A new Super Saiya-jin has been born."
					usr.overlays = 0
					alert("Your character was born a Super Saiya-jin. Do not delete this character.")
					usr.strength = 100
					usr.powerlevel = 100000
					usr.maxpowerlevel = 100000
					usr.contents += new /obj/ssj
					usr.attribute = "Legendary Super Saiya-jin"
				else
					world << "<b><font color = green>A god has arrived."
					usr.strength = 100
					usr.powerlevel = 100000
					usr.maxpowerlevel = 100000
					alert("Your character was born a legend. Do not delete this character.")
					usr.attribute = "Legend"
			if(usr.random < 999 && usr.random >= 899)
				alert("Elite: You are superiorly strong. You were born in an Elite Family, which gives you advantage. But you will gain will and honor slower.")
				usr.maxpowerlevel += rand(1,1000)
				usr.purity -= rand(1,2)
				usr.honor -= rand(1,2)
				usr.will -= rand(1,2)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Elite Warrior"
			if(usr.random < 898 && usr.random >= 700)
				alert("High-Class Warrior: You are a high-class warrior.You have excellent strength, but you are extremely weak in Ki.")
				usr.maxpowerlevel += rand(1,105)
				usr.powerlevel = usr.maxpowerlevel
				usr.purity += 1
				usr.honor += 1
				usr.will += 1
				usr.attribute = "High-Class Warrior"
			if(usr.random < 699 && usr.random >= 400)
				alert("Medium-Class Warrior: You are a medium-class warrior.You are equal in both Ki and Strength.")
				usr.maxpowerlevel += rand(1,30)
				usr.purity += rand(1,2)
				usr.honor += rand(1,2)
				usr.will += rand(1,2)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Medium-Class Warrior"
			if(usr.random < 399 && usr.random >= 100)
				alert("Low-Class Warrior: You are a low-class warrior. You are weak at start, but will become stronger than most. You have good Will, Honor, and Purity.")
				usr.maxpowerlevel += rand(1,5)
				usr.purity += rand(3,5)
				usr.honor += rand(3,5)
				usr.will += rand(3,5)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Low-Class Warrior"
			if(usr.random < 99 && usr.random >= 1)
				alert("Peasant Warrior: You are a peasant warrior. You are very weak at start, but will become stronger than most. You have awesome Will, Honor, and Purity. The legendary Kakarotto was this.")
				usr.purity += rand(5,10)
				usr.honor += rand(5,10)
				usr.will += rand(5,10)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Peasant Warrior"
		if("Evil")
			usr.alignment = "Evil"
			usr.random = rand(1,1000)
			if(usr.random == 1000)
				if(usr.race == "Saiya-jin")
					world << "<b><font color = green>A new Super Saiya-jin has been born."
					usr.overlays = 0
					alert("Your character was born a Super Saiya-jin. Do not delete this character.")
					usr.strength = 100
					usr.powerlevel = 100000
					usr.maxpowerlevel = 100000
					usr.contents += new /obj/ssj
					usr.attribute = "Legendary Super Saiya-jin"
				else
					world << "<b><font color = green>A god has arrived."
					usr.strength = 100
					usr.powerlevel = 100000
					usr.maxpowerlevel = 100000
					alert("Your character was born a legend. Do not delete this character.")
					usr.attribute = "Legend"
			if(usr.random < 999 && usr.random >= 899)
				alert("Elite: You are superiorly strong. You were born in an Elite Family, which gives you advantage. But you will gain will and honor slower.")
				usr.maxpowerlevel += rand(1,1000)
				usr.purity -= rand(1,2)
				usr.honor -= rand(1,2)
				usr.will -= rand(1,2)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Elite Warrior"
			if(usr.random < 898 && usr.random >= 700)
				alert("High-Class Warrior: You are a high-class warrior.You have excellent strength, but you are extremely weak in Ki.")
				usr.maxpowerlevel += rand(1,105)
				usr.powerlevel = usr.maxpowerlevel
				usr.purity += 1
				usr.honor += 1
				usr.will += 1
				usr.attribute = "High-Class Warrior"
			if(usr.random < 699 && usr.random >= 400)
				alert("Medium-Class Warrior: You are a medium-class warrior.You are equal in both Ki and Strength.")
				usr.maxpowerlevel += rand(1,30)
				usr.purity += rand(1,2)
				usr.honor += rand(1,2)
				usr.will += rand(1,2)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Medium-Class Warrior"
			if(usr.random < 399 && usr.random >= 100)
				alert("Low-Class Warrior: You are a low-class warrior. You are weak at start, but will become stronger than most. You have good Will, Honor, and Purity.")
				usr.maxpowerlevel += rand(1,5)
				usr.purity += rand(3,5)
				usr.honor += rand(3,5)
				usr.will += rand(3,5)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Low-Class Warrior"
			if(usr.random < 99 && usr.random >= 1)
				alert("Peasant Warrior: You are a peasant warrior. You are very weak at start, but will become stronger than most. You have awesome Will, Honor, and Purity. The legendary Kakarotto was this.")
				usr.purity += rand(5,10)
				usr.honor += rand(5,10)
				usr.will += rand(5,10)
				usr.powerlevel = usr.maxpowerlevel
				usr.attribute = "Peasant Warrior"

	switch(alert("What Fighting Style are you?","Character Creation","Kame","Piccolo","Vegeta","Tien"))
		if ("Kame")
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Kame"
		if ("Piccolo")
			new_mob.style = 'style-calming.dmi'
			new_mob.stylename = "Piccolo"
		if ("Vegeta")
			new_mob.style = 'style-blocking.dmi'
			new_mob.stylename = "Vegeta"
		if ("Tien")
			new_mob.style = 'style-blocking.dmi'
			new_mob.stylename = "Tien"
		if ("Gohan")
			new_mob.style = 'style-cosmic.dmi'
			new_mob.stylename = "Gohan"
		if ("Krillin")
			new_mob.style = 'style-cosmic.dmi'
			new_mob.stylename = "Krillin"
	switch(alert("Do you want a face icon?","Character Creation","Yes","No"))
		if("Yes")
			var/class = alert("What kind of face icon?","Icon Choose","Icon","Preset Icon","Cancel")
			switch(class)
				if("Icon")
					var/econ = alert("Pick icon:","Icon") as icon
					new_mob.faceicon = econ
				if("Preset Icon")
					switch(input("What icon do you want to use?", "Icon Choose") in list ("Goku","Gohan","Vegeta","Trunks","Goten","Kami","Dende","Turles","Vegeta2","Frieza"))
						if("Goku")
							new_mob.faceicon = 'goku.bmp'
						if("Vegeta")
							new_mob.faceicon = 'vegeta.bmp'
						if("Gohan")
							new_mob.faceicon = 'gohan.bmp'
						if("Trunks")
							new_mob.faceicon = 'trunks.bmp'
						if("Dende")
							new_mob.faceicon = 'dende.bmp'
						if("Goten")
							new_mob.faceicon = 'goten.bmp'
						if("Kami")
							new_mob.faceicon = 'kame.bmp'
						if("Raditz")
							new_mob.faceicon = 'raditz.bmp'
						if("Turles")
							new_mob.faceicon = 'turles.bmp'
						if("Vegeta2")
							new_mob.faceicon = 'vegeta2.bmp'
						if("Frieza")
							new_mob.faceicon = 'icer.bmp'
	new_mob.random = rand(1,75)
	if(new_mob.random == 75)
		switch(alert("You have been born a Buu Demon. Do you wish to keep this? Or continue old character?","Character Creation","Make Buu Demon","Keep Old Character"))
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
				new_mob.zenni = 3000
				new_mob.will = 0
				new_mob.exp = 0
				new_mob.maxexp = 500
				new_mob.health = 10
				new_mob.maxhealth = 10
				new_mob.defense = 2
				new_mob.speed = 0
				new_mob.honor = 0
				new_mob.purity = 0
				new_mob.faceicon = 'default.dmi'
				new_mob.kitech = "None"
				new_mob.auratech = "None"
				new_mob.kitechlearn = 0
				new_mob.dead = 0
				new_mob.auratechlearn = 0
				new_mob.focustechlearn = 0
				new_mob.kicolor = "None"
				new_mob.focus = "None"
			//	new_mob.style = 'style-calming.dmi'
				new_mob.stylename = "Calming"
				new_mob.flightlearn = 0
				new_mob.title = ""
				new_mob.race = "Buu Demon"
				new_mob.icon = 'buu.dmi'
				new_mob.maxpowerlevel += rand(1,15000)
				new_mob.contents += new /obj/techs/wrap
				new_mob.contents += new /obj/techs/regen
				new_mob.contents += new /obj/techs/uniscan
				new_mob.contents += new /obj/techs/kiabsorb
				new_mob.contents += new /obj/techs/Kaioken
				new_mob.loc = locate(77,85,1)
	else
		..()
		new_mob.loc = locate(77,85,1)
	new_mob.oicon = new_mob.icon
	new_mob.npp = 0
	new_mob.name = char_name
	src.client.mob = new_mob
	new_mob.loc = locate(77,85,1)
	del(src)
	if(stylename=="Vegeta")
		usr.honor+=4
		usr.will+=2
		usr.speed=4
	if(stylename=="Kame")
		usr.purity+=4
		usr.will+=2
		usr.speed=4
	if(stylename=="Piccolo")
		usr.will+=4
		usr.honor+=2
		usr.speed=3
	if(stylename=="Satan")
		stylename="Satan"
		usr.honor+=4
		usr.will+=2
		usr.speed=3
	if(stylename=="Korin")
		stylename="Korin"
		usr.honor+=4
		usr.will+=2
		usr.speed=5
	if(stylename=="Tien")
		stylename="Tien"
		usr.purity+=1
		usr.honor+=3
		usr.will+=2
		usr.speed=4
	if(stylename=="Gohan")
		stylename="Gohan"
		usr.will+=3
		usr.purity+=2
		usr.honor+=1
		usr.speed=2
	if(stylename=="Krillin")
		stylename="Krillin"
		usr.will+=3
		usr.purity+=3
		usr.speed=3
	if(stylename=="DBU")
		stylename="DBU"
		usr.honor+=4
		usr.will+=2
		usr.speed=5

mob
	Login()
		Ranking(src)
		powerlevelRefresh(src)
		if(src.race == "Bio-Android Cell")
			src.verbs += /obj/cellabsorb/verb/CellAbsorb

		..()


	Write(savefile/F)
		..()
		usr.key = src.ckey
		F["last_x"] << x
		F["last_y"] << y
		F["last_z"] << z

	Read(savefile/F)
		..()
		usr.key = src.ckey
		var/last_x
		var/last_y
		var/last_z
		F["last_x"] >> last_x
		F["last_y"] >> last_y
		F["last_z"] >> last_z
		loc = locate(last_x, last_y, last_z)
		if(src.race == "Bio-Android Cell")
			src.verbs += /obj/cellabsorb/verb/CellAbsorb



