var
	list
		Parties=list()
mob
	var
		tmp
			party_name=""
			in_party=0
			party_leader=0
			party_member=0
	PC
		verb
			Create_Party()
				set category="Channels"
			//	set hidden = 1
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Create Party")

				if(src.in_party)
					return
			//	src << "<b><font color = red>Temporarily disabled until the new system is created"
				//return
				if(src.spam_delay)
					src<<"You must wait a moment."
					return
				//	src.spam_delay=1

				else
					switch(alert("Do you want to create a party?","","Yes","No"))
						if("No")
							src.spam_delay=0
							return
						else
							var/partyname=input("Type in the Party name with 'NO' HTML(20 characters max).")as text
							partyname = html_encode(partyname)
							if(lentext(partyname) > 20)
								alert("Party name cannot exceed 20 Characters.")
								return
							if(partyname == " "|| partyname == null || !partyname)
								return
							if(Parties.Find(partyname))
								alert("That name is already taken.")
								return
							if(Check_For_Spam(partyname,SPAM) == TRUE)
								src<<"Please do not use linebreak characters."
								return
							switch(alert("Create the party: [partyname]?","Party Create","Yes","No"))
								if("No")
									return
								if("Yes")
									if(Parties.Find(partyname))
										alert("That name is already taken.")
										return
									if(player.Find(partyname))
										alert("The name is taken.")
										return
									src.party_name = partyname
									src.party_leader = 1
									src.in_party = 1
									src.verbs -= new/mob/PC/verb/Create_Party()
									src.verbs += new/mob/PartyVerbs/verb/Party_Boot()
									src.verbs += new/mob/PartyVerbs/verb/Party_Chat()
									src.verbs += new/mob/PartyVerbs/verb/Party_Invite()
									src.verbs += new/mob/PartyVerbs/verb/Party_Members()
									src.verbs += new/mob/PartyVerbs/verb/Party_Leave()
									src.verbs += new/mob/PartyVerbs/verb/BottomList()
									Parties.Add(partyname)
									return
	PartyVerbs
		verb
			Party_Boot()
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Boot")
				var/list/L=new/list()
				for(var/mob/M in player)
					if(M.in_party&&M.party_name==src.party_name&&M!=src)
						L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to Boot from: [src.party_name]?")in L
				if(B=="Cancel")
					return
				if(!B)
					return
				if(B.party_name!=src.party_name)
					return
				if(!src.in_party)
					return
				switch(alert("Do you want to Boot [B] from: [src.party_name]?","","Boot","Cancel"))
					if("Cancel")
						return
					else
						for(var/mob/N in player)
							if(N.party_name==src.party_name)
								N<<"<font color=lime>[src.party_name] Information:<font color=white> [src] Booted [B]!"
						B.in_party=0
						B.party_leader=0
						B.party_member=0
						B.party_name=B.name
						B.verbs += new/mob/PC/verb/Create_Party()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Members()
						B.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
						return
		verb
			BottomList()
				set name = "Move to end of party"
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Boot")
				var/list/L=new/list()
				for(var/mob/M in player)
					//if(M.in_party&&M.party_name==src.party_name&&M!=src)
					if(M.in_party&&M.party_name==src.party_name)
						L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to move to bottom of party from: [src.party_name]?")in L
				if(B=="Cancel")
					return
				if(!B)
					return
				if(B.party_name!=src.party_name)
					return
				if(!src.in_party)
					return
			//	switch(alert("Do you want to Boot [B] from: [src.party_name]?","","Boot","Cancel"))
			//		if("Cancel")
			//			return

				for(var/mob/N in player)
					if(N.party_name==src.party_name)
						N<<"<font color=lime>[src.party_name] Information:<font color=white> [src] moved [B] to bottom of party"
				player -= B
				sleep(3)
				player += B
				return
		verb
			Party_Chat(T as text)
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Chat")
				if(channelmute!="")
					src<<"All chat channels have been muted."
					return
				if(!T)
					alert("Your message may not be blank.")
					return
				T = html_encode(T)
				if(lentext(T) > 500)
					alert("Your message cannot exceed 500 characters.")
					src << "Your message: [T]"
					return
				if(Check_For_Spam(T,SPAM) == TRUE)
					src<<"Please do not use linebreak characters."
					return
				for(var/mob/M in player)
					if(M.party_name==src.party_name)
						M<<"<font color=lime>{[src.party_name]}[src]:<font color=white><font size=-2> [T]"
					if(M.hearall)
						M<<"<b>Hearall </b><font color=lime>{[src.party_name]}[src]:<font color=white><font size=-2> [T]"
				return
			Party_Invite()
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Invite")
				var/list/L=new/list()
				for(var/mob/PC/M in player)
					if(M.in_party)continue
					if(!M.loggedin)continue
					L.Add(M)
				L.Add("Cancel")
				var/mob/B=input("Who do you wish to Invite to: [src.party_name]?")in L
				if(B=="Cancel")
					return
				if(!B)
					return
				if(B.in_party)
					return
				if(!src.in_party)
					return
				switch(alert("Do you want to Invite [B] to: [src.party_name]?","","Invite","Cancel"))
					if("Cancel")
						return
					else
						switch(alert(B,"[src] is inviting you to join: [src.party_name]. Do you accept?","","Join","No"))
							if("No")
								return
							else
								if(!src)
									return
								if(!src.in_party)
									return
								if(B.isrebirthing)
									src << "You cannot invite [B] while they are rebirthing!"
									return
								/*
								var/canjoin = 0
								var/canjoinMin = src.level - 30000
								var/canjoinMax = src.level + 30000
								if(src.level >= 200000)
									canjoinMin = 200000
									canjoinMax = 5000000
								else
									canjoinMin = src.level - 30000
									canjoinMax = src.level + 30000

								if(B.level >= canjoinMin && B.level <= canjoinMax)
									canjoin = 1
								if(canjoin == 0)
									src << "[B] is outside of your partys level range!"
									return
								*/

								B.in_party=1
								B.party_leader=0
								B.party_member=1
								B.party_name=src.party_name
								B.verbs -= new/mob/PC/verb/Create_Party()
								B.verbs += new/mob/PartyVerbs/verb/Party_Chat()
								B.verbs += new/mob/PartyVerbs/verb/Party_Members()
								B.verbs += new/mob/PartyVerbs/verb/Party_Leave()
								for(var/mob/N in player)
									if(N.party_name==src.party_name)
										N<<"<font color=lime>[src.party_name] Information:<font color=white> [src] Invited [B]!"
								return
			Party_Members()
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Members")
				if(src.spam_delay)
					return
				src<<"<font color=lime>---------------<br><font color=white>[src.party_name] Members:"
				for(var/mob/C in player)
					if(C.party_name==src.party_name)
						src<<"<font color=lime>Name: [C.name] - Level: [applycommas(C.level)]"
				src<<"<font color=lime>---------------<br>"
				spawn(40)src.spam_delay=0
			Party_Leave()
				set category="Party"
				if(usr.playerwatch==1)
					PlayerWatch(usr,"Party Leave")
				if(!src.in_party)
					return
				switch(alert("Do you want to leave: [src.party_name]?","","Yes","No"))
					if("Cancel")
						return
					if("No")
						return
					if("Yes")
						if(!src.in_party)
							return
						if(!src.party_leader)
							for(var/mob/M in player)
								if(M.party_name==src.party_name)
									M<<"<font color=lime>[src.party_name] Information:<font color=white> [src] has left the party!"
							src.in_party=0
							src.party_leader=0
							src.party_member=0
							src.party_name=src.name
							src.verbs += new/mob/PC/verb/Create_Party()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Members()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							src.verbs -= new/mob/PartyVerbs/verb/BottomList()
							return
						else
							//Parties.Remove(src.party_name)
							for(var/mob/M in player)
								if(M.party_name==src.party_name)
									M<<"<font color=lime>[src.party_name] Information:<font color=white> [src], the leader, has left the party!"
									M.in_party=0
									M.party_leader=0
									M.party_member=0
									M.party_name=M.name
									M.verbs += new/mob/PC/verb/Create_Party()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Members()
									M.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
									M.verbs -= new/mob/PartyVerbs/verb/BottomList()
							src.in_party=0
							src.party_leader=0
							src.party_member=0
							src.party_name=src.name
							src.verbs += new/mob/PC/verb/Create_Party()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Boot()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Chat()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Invite()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Members()
							src.verbs -= new/mob/PartyVerbs/verb/Party_Leave()
							src.verbs -= new/mob/PartyVerbs/verb/BottomList()
							return