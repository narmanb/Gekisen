mob/var/banked_zenni = 0
mob
	NPC
		Banker
			name = "Banker"
			icon = 'seshicons.dmi'
			icon_state="Banker"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 5432211
			New()
				..()
				if(src.z==2)
					src.energy_code=5432212
				if(src.z==3)
					src.energy_code=5432213
				if(src.z==4)
					src.energy_code=5432214
				if(src.z==7)
					src.energy_code=0
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Banker")
					if(usr.talking)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					spawn(30)usr.talking=0
					usr.talking = 1
					switch(input("Hello [usr.name]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr << "<font color = white><b>\icon[src] [src.name]: </b>You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to Deposit?")as num
							if(deposit>usr.zenni)
								deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr << "<font color = white><b>\icon[src] [src.name]: </b>[applycommas(deposit)] has been successfully transfered into your Account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr << "<font color = white><b>\icon[src] [src.name]: </b>You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to Withdraw?")as num
							if(withdrawl > usr.banked_zenni)
								withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr << "<font color = white><b>\icon[src] [src.name]: </b>[applycommas(withdrawl)] has been successfully withdrawn from your Account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to Transfer?")as num
							if(transfer > usr.banked_zenni)
								transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in player)
									varPeople += M
								var/varTo = input("Who would you like to Transfer [applycommas(transfer)] Zenni to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr << "<font color = white><b>\icon[src] [src.name]: </b>[applycommas(transfer)] Zenni has been successfully transferred to [varTo]'s account."
									varTo << "<font color = white><b>\icon[src] [src.name]: </b>[applycommas(transfer)] Zenni has been successfully transferred to your account from [usr]."
									AdminMessage("[usr]([usr.key]) transferred [applycommas(transfer)] to [varTo]")
									return
		BankerGH
			name = "Banker"
			icon_state="Banker"
			density = 1
			safe=1
			energy_code=0
			it_blocked=1
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to GH Banker")
					if(usr.talking)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					usr.talking = 1
					switch(input("Hello [usr.name]. What can I do for you today?")in list("Deposit","Withdrawl","Transfer Funds","Cancel"))
						if("Cancel")
							usr.talking=0
							return
						if("Deposit")
							if(usr.zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni!"
								usr.talking=0
								return
							var/deposit = input("How much do you wish to Deposit?")as num
							if(deposit>usr.zenni)
								deposit=usr.zenni
							if(deposit <= 0)
								usr.talking = 0
								return
							else
								usr.zenni -= round(deposit)
								usr.banked_zenni += round(deposit)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [deposit] has been successfully transfered into your Account!"
								return
						if("Withdrawl")
							if(usr.banked_zenni<1)
								usr << "<font color = white>Banker:</font> You don't have any zenni in your account!"
								usr.talking=0
								return
							var/withdrawl = input("How much do you wish to Withdraw?")as num
							if(withdrawl > usr.banked_zenni)
								withdrawl=usr.banked_zenni
							if(withdrawl<=0)
								usr.talking=0
								return
							else
								usr.banked_zenni -= round(withdrawl)
								usr.zenni += round(withdrawl)
								usr.talking = 0
								usr << "<font color = white>Banker:</font> [withdrawl] has been successfully withdrawn from your Account!"
								return
						if("Transfer Funds")
							var/transfer = input("How much do you wish to Transfer?")as num
							if(transfer > usr.banked_zenni)
								transfer=usr.banked_zenni
							if(transfer <= 0)
								usr.talking = 0
								return
							else
								var/varPeople = list()
								for(var/mob/PC/M in player)
									varPeople += M
								var/varTo = input("Who would you like to Transfer [transfer] Zenni to whom?","Transfer Funds") in varPeople + list("Cancel")
								if(varTo == "Cancel" || varTo == "[usr]")
									usr.talking = 0
									return
								else
									usr.banked_zenni -= round(transfer)
									varTo:banked_zenni += round(transfer)
									usr.talking = 0
									usr << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to [varTo]'s account."
									varTo << "<font color = white>Banker:</font> [transfer] Zenni has been successfully transferred to your account from [usr]."
									return

		RichMan
			name = "Rich Man"
			icon = 'seshicons.dmi'
			icon_state="richman"
			density = 1
			safe = 1
			frozen = 1
			energy_code = 23423466635
			New()
				..()
				src.CreateName()
			verb
				Talk()
					set src in oview(2)
					set category=null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Rich Guy")
					if(usr.talking)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					spawn(15)usr.talking=0
					usr.talking = 1
					usr << "<font color = white><b>\icon[src] [src.name]: </b> You can use an ATM anywhere in the game to withdraw or deposit zenni, but if you want to transfer zenni you must see a banker!"


mob/SPECIAL
	BankSecurity


		BankerSecurity0
			name = "Bank Security"
			icon = 'seshicons.dmi'
			icon_state="banksecurity3"
			density = 1
			energy_code = 23423466633

			powerlevel = 5
			powerlevel_max = 5
			ki = 1
			ki_max = 1
			kidefense = 1
			kidefense_max = 1
			speed = 1
			strength = 5
			defence = 5

			karma = "Good"
			race = "Human"
			level = 10
			zenni = 100
			pk = 1
			exp = 5
			melee=100
			block=100
			dodge=100
			counter=100
			critical=100
			durability=100
			ki_control=100
			ki_cast=100
			ki_power=100
			ki_use=100
			ki_res=100
			reflect=100
			weapon=100
			weapon_power=100
			weapon_resistance=100
			sleeping = 1
			New()
				..()
				density=1
				pk=1
				safe=0
				src.CreateName()
				src.initialloc=src.loc
				for(var/area/Horde_Point/H in oview(1,src))
					src.horde_mob=1
					return
			Del()
				if(!halt_repop)
					if(!horde_mob)
						Quest_Repop.Add(src.type)
						Quest_Loc.Add(src.initialloc)
				..()
			verb
				Talk()
					set src in view()
					set category = null
					if(usr.playerwatch==1)
						PlayerWatch(usr,"Talked to Bank Security")
					if(usr.talking)
						usr<<"You are already talking to someone, if this isn't correct go to channels->Mr Fix"
						return
					spawn(15)usr.talking=0
					usr.talking = 1
					usr << "<font color = white><b>\icon[src] [src.name]: </b> Don't try anything funny, we're watching you."


		BankerSecurity1
			name = "Bank Security"
			icon = 'seshicons.dmi'
			icon_state="banksecurity"
			density = 1
			energy_code = 23423466635

			powerlevel = 1000000000 * 1100
			powerlevel_max = 1000000000 * 1100
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 100
			kidefense_max = 1000000000 * 100
			speed = 50000
			strength = 1000000000 * 150
			defence = 1000000000 * 100

			karma = "Good"
			race = "Human"
			level = 3000000
			zenni = 10000*5
			pk = 1
			exp = 400000*5
			melee=100
			block=100
			dodge=100
			counter=100
			critical=100
			durability=100
			ki_control=100
			ki_cast=100
			ki_power=100
			ki_use=100
			ki_res=100
			reflect=100
			weapon=100
			weapon_power=100
			weapon_resistance=100

			New()
				..()
				density=1
				pk=1
				safe=0
				src.CreateName()
				src.initialloc=src.loc
				for(var/area/Horde_Point/H in oview(1,src))
					src.horde_mob=1
					return
			Del()
				if(!halt_repop)
					if(!horde_mob)
						Quest_Repop.Add(src.type)
						Quest_Loc.Add(src.initialloc)
				..()





		BankerSecurity2
			name = "Bank Security"
			icon = 'seshicons.dmi'
			icon_state="banksecurity2"
			density = 1

			energy_code = 23423466635

			powerlevel = 1000000000 * 1300
			powerlevel_max = 1000000000 * 1300
			ki = 200000000
			ki_max = 200000000
			kidefense = 1000000000 * 100
			kidefense_max = 1000000000 * 100
			speed = 50000
			strength = 1000000000 * 100
			defence = 1000000000 * 150
			karma = "Good"
			race = "Human"
			level = 3000000
			zenni = 20000*5
			pk = 1
			exp = 410000*5
			melee=100
			block=100
			dodge=100
			counter=100
			critical=100
			durability=100
			ki_control=100
			ki_cast=100
			ki_power=100
			ki_use=100
			ki_res=100
			reflect=100
			weapon=100
			weapon_power=100
			weapon_resistance=100

			New()
				..()
				density=1
				pk=1
				safe=0
				src.CreateName()
				src.initialloc=src.loc
				for(var/area/Horde_Point/H in oview(1,src))
					src.horde_mob=1
					return

			Del()
				if(!halt_repop)
					if(!horde_mob)
						Quest_Repop.Add(src.type)
						Quest_Loc.Add(src.initialloc)
				..()

		proc
			AIBank()
				if(!AITarget)
					for(var/mob/PC/M in oview(10, src))
						if(M in oview(10, src))
							AITarget = M
							break
				else
					if(get_dist(src, AITarget) > 13)
						AITarget = null
						sleeping = 1
						return
				if(AITarget == null)
					var/mob/PC/p = locate(/mob/PC) in range(12, src)
					if(!p)
						sleeping = 1
						return
				if(get_dist(src, AITarget) > 1)
					step_to(src, AITarget)
					spawn(2)AIBank()
					return
				else
					AttackMOB(AITarget)
					spawn(11)AIBank()
					return
		proc
			AttackMOB(mob/PC/M)
				var/attack_text = rand(1,2)
				var/text
				if(attack_text == 1)
					text = "\red [src] Punches you!"
				if(attack_text == 2)
					text = "\red [src] Kicks you!"
				if(src.KO)
					return
				if(!M)
					return
			//	if(M.buku)
			//		return
				if(M.safe)
					return
				if(M.dead)
					return
				if(!M)
					return
				var/pushornot = rand(1,3)


				if(pushornot <= 1)
					spawn(1)
						src.dir = get_dir(src.loc,M.loc)
						src.Push()
				else
					var/attackpower = src.strength+src.powerlevel*0.1
					if(!M)return
					var/defensepower=(M.defence+(M.powerlevel*0.1)+1)
					var/damage = attackpower-defensepower
					if(!M)return
					var/cdamage = ((src.strength+src.powerlevel*0.1)*2)-defensepower
					if(damage < 1)
						damage = 1
					if(cdamage < 1)
						cdamage = 1
					if(istype(M,/mob/PC))
						if(!M)return
						if(!src)return
						if(prob(M.dodge/5))
							flick("IT",M)
							M.attacker = src.name.
							if(!M)return
							M.dodge_exp += 5+round(M.level/250)
							M.Dodge_Level()
							if(M.attacktext)
								M << output("<font color=green>You dodge [src]'s attack","output2")
							return
						else
							if(!M)return
							if(!src)return
							if(prob(M.block/5))
								M.attacker = src.name
								if(!M)return
								M.powerlevel -= damage/4
								M.block_exp += 5+round(M.level/250)
								M.Block_Level()
								if(M.attacktext)
									M << output("<font color=green>You block [src]'s attack","output2")
								M.DeathCheck(src)
								return
							else
								if(!M)return
								if(!src)return
								if(prob(M.counter/5))
									if(!usr)return
									usr.powerlevel -= ((damage) + (damage *0.30))
									M.count_exp += 5+round(M.level/250)
									M.Counter_Level()
									if(M.attacktext)
										M << output("<font color=green>You counter [src]'s attack","output2")
									usr.DeathCheck(M)
									return
								else
									if(!M)return
									if(!src)return
									if(prob(src.critical))
										if(!M)return
										if(M.attacktext)
											M << output("[text]","output2")
										M.attacker = src.name
										if(!M)return
										M.powerlevel-=cdamage
										M.DeathCheck(src)
										return
									else
										if(!M)return
										if(!src)return
										if(M.attacktext)
											M << output("[text]","output2")
										M.attacker = src.name
										if(!M)return
										M.powerlevel -= damage
										M.DeathCheck(src)
										return