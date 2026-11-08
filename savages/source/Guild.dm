var/list/Clans = list() // The list of clans
mob

	var
		Advanced = 1 // You must have advanced commands to use this

		Clan = ""// Your clan...


	verb
		Create_Clan(msg as text)// Create a clan
			set category = "Clans"// Set the verbs category
			if(usr.gm == 1) // If they have advanced commands...
				for(var/mob/M in view(0))
					if("[msg]" == M.Clan || "[msg]" == M.clanmember)
						usr << "That clan already exists"
					else
						Clans += "[msg]"// Add to the list of clans what they inputed...
						usr << "You have successfully created the new clan '<b><font color = blue>[msg]</font></b>'."
						usr.Clan = "[msg]"
						usr.clanmember = "[msg]"
						usr.clanrank = "Master General"
			else // If not tell them they need to donate
				usr << "You do not have those privileges, to get them, use the donate for privileges verb."


	verb
		Lock_Clan()
			if(usr.clanrank == "Master General")
				set category = "Clans"
				if(usr.clanrank == "Master General")
					if(usr.lock == 0)
						usr.lock = 1
						usr<<"Your clan is now Locked, noone can join"
					else
						usr.lock = 0
						usr<<"You have now Unlocked your clan, people may join at will"
			else
				if(usr.clanmember)
					usr<<"You dont have the right"
				else
					usr<<"Get in a clan"
mob
	verb
		clantalk(t as text)
			set category = "Clans"
			set name = "Clan Chat"
			for(var/mob/M in world)
				if(usr.clanmember)
					if(M.clanmember == usr.Clan || M.Clan == usr.clanmember || M.clanmember == usr.clanmember)
						M << "--[usr.clanrank]<font color=red>--[usr]--<font color=yellow>([usr.clanmember])<font color=white> Says:<font color=green> [t]"
				else
					usr << "You are not in a clan"
mob
	verb
		Join_Clan(var/mob/M in view(1)) // Join a clan
			set category = "Clans" // The category
			if(usr.clanmember == "") // If they're not in  a clan...
				usr.clanmember = input("Pick The Clan To Join","Clan Selection","") in Clans // Input the list of clans to chose from, and make their choice their clan...
				if(M.clanrank == "Master General")
					if(M.lock == 0)
						usr << "You join clan [usr.clanmember]"
						M << "[usr] joined your clan"
						usr.clanrank ="Private"
						usr.clanmember = M.clanmember
					else
						usr<<"They have locked their clan"
						usr.clanmember = ""
				else
					usr<<"He/she cannot approve you"
					usr.clanmember = ""
			else // There already in  a clan
				usr << "You are already in clan [usr.clanmember]."

		Leave_Clan() // Leave a clan
			set category = "Clans"
			if(usr.clanmember == "") // They don't have a clan to leave
				usr << "You're not in a clan."
			if(usr.clanmember) // They left the clan that there in
				usr << "You left clan [usr.clanmember]"
				if(usr.clanrank == "Master General")
					for(var/mob/M in world)
						if(usr.clanrank == "Master General")
							M.clanmember = ""
							M.clanrank =""
							M<<"The Master has left, so you are not in the clan anymore"
						else
				usr.Clan = "" // Set there clan to nullz
				usr.clanmember = ""
				usr.clanrank = ""
	verb
		Rank_set(var/mob/M in world)
			set category = "Clans"
			if(usr.clanmember)
				if(M.clanmember == usr.clanmember)
					if(usr.clanrank == "Master General")

						switch(input("What rank are you going to set Him/Her?","Clan Rank") in list("Private","Corporal","Sargeant","Colonel","General"))
							if("Private")
								if(M.clanrank == "Master General")
									usr << "You cannot change his/her rank because he/she is the Clan Leader"
								else
									M.clanrank = "Private"
							if("Corporal")
								if(M.clanrank == "Master General")
									usr << "You cannot change his/her rank because he/she is the Clan Leader"
								else
									M.clanrank = "Corporal"
							if("Sargeant")
								if(M.clanrank == "Master General")
									usr << "You cannot change his/her rank because he/she is the Clan Leader"
								else
									M.clanrank = "Sargeant"
							if("Colonel")
								if(M.clanrank == "Master General")
									usr << "You cannot change his/her rank because he/she is the Clan Leader"
								else
									M.clanrank = "Colonel"
							if("General")
								if(M.clanrank == "Master General")
									usr << "You cannot change his/her rank because he/she is the Clan Leader"
								else
									M.clanrank = "General"
						M << "You are now a [M.clanrank]"

					else
						usr<<"You do not have permission to change ranks"

				else
					usr<<"That person is not in your Clan."
			else
				usr<< "Get in a clan"
mob
	verb
		Clan_Page()
			set category = "Clans"
			if(usr.clanmember)
				for(var/mob/M in world)
					if(M.clanmember == usr.clanmember)
						if(usr.clanrank == "Master General")
							M.clanpage = usr.clanpage
						Loadclanpage()
			else
				usr << "Get in a clan"

	verb
		Clan_Page_Write()
			set category = "Clans"
			if(usr.clanrank == "Master General")
				usr.clanpage = input(usr,"What Information do you have for your clan. You may use HTML (<br> and <p> to skip lines)","Clan Page Edit",usr.clanpage) as message
			else
				usr.clancorner = input(usr,"What Information do you have for your clan. You may use HTML (<br> and <p> to skip lines)","Clan Page Edit",usr.clancorner) as message


mob
	proc
		Loadclanpage()

			var/A = "<STYLE>BODY {background: black; color: yellow}</STYLE><center>Clan Information:<b><br>"
			for(var/mob/M in world)
				if(src.clanmember == "")
					usr << "You are not in a Clan"
				if(src.clanmember == M.clanmember)
					if(M.key)
						if(M.clanpage == "")
							A+= "[M.Clan] has not created its Clan Page (yet).<br><br>"
						else
							A+= "[M.Clan] Page<br><br>"
							A+= "[M.clanpage]"
							A+= "<br><br>"

						if(!M.clancorner)
							A+= "[M.name] has not created his corner (yet).<br><br>"
						else
							A+= "[M.name]'s Corner<br><br>"
							A+= "[M.clancorner]"
							A+= "<br><br>"
			src << browse(A)

