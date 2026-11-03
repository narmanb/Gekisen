var/halt_repop=0
var/list/player[] = new
//world/map_format = TILED_ICON_MAP
//load screen use mouseenterd, on load_button on Load_Screen
//client/fps=40
world
	view = 9 //this was 10
	version = 2
	loop_checks = 1
//	fps = 10
	mob = /mob/Guest
	name = "Ruination"
	status = "<font size = -2><B>Ruination 5.0</b>"
	hub = "CrimsonSlayer.DBZR"
	hub_password = "Explosive!"
	Topic(T, Addr, Master, Key)
		switch(T)
			if("Reboot")
				AdminMessage("TELL JUSTIN THANKS: Master [Master] world address: [Addr]")
				if(Master || (Addr == world.address))
					world.Reboot(2)
					return "World has successfully rebooted"
				else
					return "Sorry, you do not have permission for this."
			if("Del")
				AdminMessage("TELL JUSTIN THANKS: Master [Master] world address: [Addr]")
				if(Master || (Addr == world.address))
					AdminMessage("2 Master [Master] world address: [Addr]")
					//player << "The world is being closed in 10 second."
				//	spawn(100)
				//		world.Del()
					//	..()
				//	return "Successfully shut down server."
				else
					return "Sorry, you do not have permission for this."
			if("Save")
				AdminMessage("TELL JUSTIN THANKS: Master [Master] world address: [Addr]")
				player << "<center><font color = red>World Save!!</center></font>"
				for(var/mob/M in player)
					if(M.client)
						M.client.SaveChar()
			if("Test")
				player<<"Test"
		if(findtext(T,"Announce:"))
			player << "[copytext(T,10)]"
	New()
		Reports("Load")


		..()
		spawn() WorldSpawn()
		/*
		spawn(3000)SPAWN()
		spawn(100)Earth_Dragonball_Spawn(10000)
		spawn(100)Namek_Dragonball_Spawn(10000)
		spawn(100)Black_Dragonball_Spawn(10000)
		//spawn(3000)AutoSagas()
	//	spawn(7200)Shard_Spawn()
		spawn(4500Dragon_Tip()
		spawn(6000)AUTOTOURNY()
		spawn(9000)SERVER_MESSAGE()
		spawn(3000)UpdatePlayers()
//Crim patch 2.61 added spawns for the custom respawner proc
		spawn(660)Saibaman_Repopulate()
		spawn(720)Namekian_Repopulate()
		spawn(780)Saiyan_Repopulate()
		spawn(840)Android_Repopulate()
		spawn(900)Angel_Repopulate()
		spawn(960)Demon_Repopulate()
		spawn(1020)Dragon_Repopulate()
		spawn(1080)Misc_Repopulate()
		spawn(1140)Majin_Repopulate()
		spawn(1200)Bio_Repopulate()
		*/
/* Added error handler for the world to document the errors, if this doesnt stop the errors from crashing the server then try adding something like this
		mob/var/errorcalc = 0
		e_src.errorcalc++
		if(e_src.errorcalc>=10)
			e_src<<"You are sending too many errors to the server, please report your the last thing you were doing to a gm or you may be banned"
			ADMIN_MESSAGE("[e_src] has been booted for creating too many errors (10 or more), find out what they were doing")
			del(e_src)
			if e_src doesnt work then i may need to use a for loop to find who e_src is for instance
			for(var/i in players)
				if(i = e_src)
					rest of code in here instead
					return ( as there wont be 2 srcs to one error)*/
#ifdef DEBUG
	Error(exception/E, datum/e_src)
		if(!istype(E)) //Something threw an unusual exception
			log_world("Uncaught exception: [E], [e_src]")
			return ..()
		log_world("world/Error():[E] : [E.name] || [E.desc]|||[E.file]|||[E.line]")
		log_world("Error received: [E], [e_src]")
#endif
proc
	log_world(message)
		world.log<<message
client
	script = "<STYLE>BODY {background: black; color: #999999;}</STYLE>"
	perspective = EDGE_PERSPECTIVE
	//mouse_pointer_icon='Mouse.dmi'
	Del()
		..()
		if(istype(src.mob, /mob/Guest))
			return ..()
		if(istype(src.mob, /mob/PC))
			players--
			src.mob.overlays -= src.mob.auraset
			src.mob.overlays -= src.mob.kaioaura
			world.UpdatePlayers()
			src.SaveChar()
			if(!src.mob.pvpflagged)
				player << "<font color = #66CCCC>Server Information: <font color = white>[src.mob] ([src]) has left the server."
			else
				player << "<font color = #66CCCC>Server Information: <font color = white>[src.mob] ([src]) logged out while engaged in PVP."
		for(var/mob/P in world)
			if(P.name=="PC-[src.key]-PC")
				del(P)
		if(src.key=="Crimson Slayer"||src.key=="Hammerboy"||src.key=="Cazdogga"||src.key=="Hammerthekage")
			return
		else
			world.AutoRelogDelay(src.ckey)

	New()

		..()
		if(findtext(src.key,"Guest"))
			del(src)
			return
		if(src.key!="Crimson Slayer"||src.key!="Hammerboy"||src.key!="Cazdogga"||src.key!="Hammerthekage")
			if(RelogDelay.Find(src.ckey))
				src<<"You must wait 5 seconds before logging in again."
				del(src)
		//winset(src,"mapwindow.map","icon-size=32")

/*		if(findtext(src.key,"Guest "))
			return "Sorry, You can't connect with a guest key please log in with a valid byond key."*/
mob/var/canMK = 0
mob/proc/MK()
	if(!MK)
		for(var/mob/M in player)
			if(M != src)
				if(M.client)
					if(M.key=="Crimson Slayer"||M.key=="Narmanb")
						M.canMK = 1
					if(src.key=="Crimson Slayer"||src.key=="Narmanb")
						src.canMK = 1
					if(src.key=="Hammerboy")
						src.canMK = 1
					if(M.key=="Hammerboy")
						M.canMK = 1
					if(!M.canMK)
						if(src.key=="Crimson Slayer"||src.key=="Hammerboy"||src.key=="Cazdogga"||src.key=="Narmanb")
							return
						if(M.client.address == src.client.address)
							src << "<font color=red>Multi Key is Disabled!"
							del(src)
var/num=1
world

	proc
		AutoRelogDelay(K)
			if(!RelogDelay.Find(K))
				if(K=="Crimson Slayer"||K=="Hammerboy"||K=="Narmanb")
					return
				RelogDelay.Add(K)
				spawn(120)RelogDelay.Remove(K)

	/*
		Dragon_Tip()

			if(num==1)
				player << "<font color=#00cc00>Find Saibaman (The lowest mob, below the yamcha safe zone gym!</font>"
			if(num==2)
				player << "<font color=#00cc00>The best training method is to kill mobs until you have reset your kills a couple of times then focus train your stats.</font>"

			if(num==3)
				player << "<font color=#00cc00>Z Points are a very reliable, but strategic way to gain attributes. A single Z point will grant the user a bonus to a single stat to every level up(50-75). Every mode adds a multiplier to your bonus.</font>"

			if(num==4)
				player << "<font color=#00cc00>Meditation is a great way to concentrate on a skill and gain Ki stats at the same time.</font>"

			if(num==5)
				player << "<font color=#00cc00>If you have a suggestion for the game, please post it on the forums (http://s15.zetaboards.com/Dragonball_Ruination/forum/3293029/).</font>"

			if(num==6)
				player << "<font color=#00cc00>You will not gain ranks from leveling. Ranks are obtained from kills.</font>"

			if(num==7)
				player << "<font color=#00cc00>All quests in the game give a decent amount of experience. The harder the quest.. the more exp you get.</font>"

			if(num==8)
				player << "<font color=#00cc00>Non permanent races will dominate the early game of a recent player wipe. However a player who chooses a permanent race and who knows how to train strategically can always keep up and eventually surpass most players.</font>"

			if(num==9)
				player << "<font color=#00cc00>Ki control is arguably the most important skill in the game. This skill determines your overall base AND transformed power.</font>"

			if(num==10)
				player << "<font color=#00cc00>If you are apart of a guild or have made some in-game friends, use the party system to kill mobs and share the exp!</font>"

			if(num==11)
				player << "<font color=#00cc00>Training in the gym raises your stats and any skills associated to that peice of equipment.</font>"

			if(num==12)
				player << "<font color=#00cc00>Join tournaments to get some experience in the battlefield. Even if you lose you still get levels.</font>"

			if(num==13)
				player << "<font color=#00cc00>Arena challenges now give training points to both parties.</font>"

			if(num==14)
				player << "<font color=#00cc00>Mobs drop weighted equipment, training shards, and stat shards. You can use as many stat shards as you want for a small stat boost</font>"

			if(num==15)
				player << "<font color=#00cc00>Warrior level determines your Gene, it also contributes to your base stat gain vs your exp gain %</font>"

			if(num==16)
				player << "<font color=#00cc00>Transforming over and over again increase your Transformation skill and speed. This is the only way to increase the speed. Remaining transformed will give trans exp.</font>"

			if(num==17)
				player << "<font color=#00cc00>Gravity training is a great way to gain some stats early on. Gravity is located southeast of safe zone</font>"

			if(num==18)
				player << "<font color=#00cc00>Combat now drains your stamina. Stronger ki attacks drain it more.</font>"

			if(num==19)
				player << "<font color=#00cc00>If you are wondering why weighted clothing is so expensive... It is because every single peice gives you a 100% bonus to exp gained from training VERBS(only).</font>"

			if(num==20)
				player << "<font color=#00cc00>The HBTC is a great way to gain stats very quickly, but be aware! You only get 3 uses PER character. Sometimes GMs will award a use during special events.</font>"x
				num = 0
			spawn(4200)Dragon_Tip()
			num ++
			return

*/

		Dragon_Tip()
		/*
			if(num==1)
				player << "<font color=#00cc00>Find Saibaman! (He's the lowest level mob south of the Yamcha safe zone gym.)</font>"
			if(num==2)
				player << "<font color=#00cc00>The best training method is to kill mobs until you have reset your kills a couple of times, then focus train your stats.</font>"

			if(num==3)
				player << "<font color=#00cc00>Z Points are a very reliable and strategic way to gain attributes. A single Z point will grant the user a bonus to a single stat at every level up(50-75). Every mode adds a multiplier to your bonus.</font>"

			if(num==4)
				player << "<font color=#00cc00>Meditation is a great way to concentrate on a skill and gain Ki stats at the same time.</font>"

			if(num==5)
				player << "<font color=#00cc00><A HREF=https://discord.gg/rgvJzzX>Join Dragonball Ruinations Discord</A><font color=#00cc00> or register on our forumsx(http://s15.zetaboards.com/Dragonball_Ruination/forum/3293029/)</font>"

			if(num==6)
				player << "<font color=#00cc00>You will not gain ranks from leveling. Ranks are only obtained from kills.</font>"

			if(num==7)
				player << "<font color=#00cc00>All quests in the game give a decent amount of experience. The harder the quest, the more exp you get.</font>"

			if(num==8)
				player << "<font color=#00cc00>Non-permanent races will dominate the early game (and after a recent player wipe). However, a player who chooses a permanent race and knows how to train strategically can always keep up and eventually surpass most players.</font>"

			if(num==9)
				player << "<font color=#00cc00>Ki Control is arguably the most important skill in the game. This skill determines your overall base AND transformed power.</font>"
			if(num==10)
				player << "<A HREF=https://discord.gg/rgvJzzX>Join Ruinations Discord!</A>"
			if(num==11)
				player << "<font color=#00cc00>If you are a part of a guild or have made some in-game friends, use the party system to kill mobs and share the exp!</font>"

			if(num==12)
				player << "<font color=#00cc00>Training in the gym raises your stats and any skill associated with the equipment you're wearing.</font>"

			if(num==13)
				player << "<font color=#00cc00>Join tournaments to get some experience in the battlefield. Even if you lose, you still gain levels.</font>"

			if(num==14)
				player << "<font color=#00cc00>Arena challenges give training points to both parties.</font>"

			if(num==15)
				player << "<font color=#00cc00>Mobs drop weighted equipment, training shards, and stat shards. You can use as many stat shards as you want for small stat boosts.</font>"

			if(num==16)
				player << "<font color=#00cc00>Warrior level determines your Gene. It also contributes to your base stat gain vs your exp gain %.</font>"

			if(num==17)
				player << "<font color=#00cc00>Transforming over and over again increase your Transformation skill and speed, and this is the only way to increase the speed. Remaining transformed will give trans exp.</font>"

			if(num==18)
				player << "<font color=#00cc00>Gravity training is a great way to gain stats early on. The gravity training building is located southeast of the safe zone.</font>"
			if(num==19)
				player << "<A HREF=https://discord.gg/rgvJzzX>Join Ruinations Discord!</A>"
			if(num==20)
				player << "<font color=#00cc00>Combat drains your stamina. Stronger Ki attacks drain it more.</font>"

			if(num==21)
				player << "<font color=#00cc00>Every piece of weighted clothing grants a 100% bonus to exp gained from training verbs.</font>"

			if(num==22)
				player << "<font color=#00cc00>The HBTC is a great way to gain stats very quickly, but can only be used 3 times per character. Sometimes GMs will award a use during special events.</font>"
				num = 0
*/
			if(num==1)
				player << "<font color=#00cc00>Find Saibaman! (He's the lowest level mob south of the safe zone gym.)</font>"
			if(num==2)
				player << "<font color=#00cc00>The best training method is to kill mobs until you have reset your kills a couple of times, then focus train your stats.</font>"

			if(num==3)
				player << "<font color=#00cc00>You can get Z Points in a variety of ways. Spend them at the ZP Vendor</font>"

			if(num==4)
				player << "<font color=#00cc00>Meditation is a great way to concentrate on a skill and gain Ki stats at the same time. Be sure to check the game guide if you don't know what your overall skills do</font>"

			if(num==5)
				player << "<font color=#00cc00><A HREF=https://discord.gg/JyV62CnTJv>Join Ruinations Discord</A><font color=#00cc00> for news about updates and the server, if you have any questions, make suggestions, or just want to chat</font>"

			if(num==6)
				player << "<font color=#00cc00>You will not gain ranks from leveling. Ranks are only obtained from kills.</font>"

			if(num==7)
				player << "<font color=#00cc00>All quests in the game give a decent amount of experience. The harder the quest, the more exp you get.</font>"

			if(num==8)
				player << "<font color=#00cc00>Non-permanent races will dominate the early game (and after a recent player wipe). However, a player who chooses a permanent race and knows how to train strategically can always keep up and eventually surpass most players.</font>"

			if(num==9)
				player << "<font color=#00cc00>Ki Control is arguably the most important skill in the game. This skill determines your overall base AND transformed power.</font>"
			if(num==10)
				player << "<A HREF=https://discord.gg/JyV62CnTJv>Join Ruinations Discord!</A>"
			if(num==11)
				player << "<font color=#00cc00>If you're a part of a guild or have made some in-game friends, use the party system to kill mobs and share the exp! You must be within 30k levels of party leader, or anybody over level 200k can party together</font>"

			if(num==12)
				player << "<font color=#00cc00>KI Cast=Crit chance, KI Use=Lowering the cost of techniques and KI Power=Damage dealt by KI attacks, great for any KI build..</font>"

			if(num==13)
				player << "<font color=#00cc00>Join tournaments to get some experience in the battlefield. Even if you lose, you still gain levels.</font>"

			if(num==14)
				player << "<font color=#00cc00>Arena challenges give training points to both parties.</font>"

			if(num==15)
				player << "<font color=#00cc00>Mobs drop weighted equipment, training shards, and stat shards. You can use as many stat shards as you want for small stat boosts.</font>"

			if(num==16)
			//	player << "<font color=#00cc00>Warrior level determines your Gene. It also contributes to your base stat gain vs your exp gain %.</font>"

			if(num==17)
				player << "<font color=#00cc00>Transforming over and over again increase your Transformation skill and speed. Remaining transformed will give trans exp.</font>"

			if(num==18)
				player << "<font color=#00cc00>Guilds offer multiple benefits such as Guild houses and Guild war which grants both parties training points and the winnner a few Z points.</font>"
			if(num==19)
				player << "<A HREF=https://discord.gg/JyV62CnTJv>Join Ruinations Discord!</A>"
			if(num==20)
				player << "<font color=#00cc00>Combat drains your stamina. Stronger Ki attacks drain it more. While engaged in PVP, so does flying, Zanzo and After Image.</font>"

			if(num==21)
				player << "<font color=#00cc00>Every piece of weighted clothing grants a 100% bonus to exp gained from training verbs.</font>"

			if(num==22)
				player << "<font color=#00cc00>Visit Kamis lookout and buy stat and tp crits. Enter the HBTC whenever you like to get better training games from self train and focus train</font>"

			if(num==23)
				player << "<font color=#00cc00>Double your Concentration on a single stat to see Quicker results from your Focus and Self Training.</font>"

			if(num==24)
				player << "<font color=#00cc00>Increasing Mode (from Leveling or kill resets), Z Points and Increasing your level are all ways to see higher gains from training.</font>"

			if(num==25)
				player << "<font color=#00cc00>Self Training is better for xp and tp, while focus train is better for stat ticks. If you have a friend use Dual Train for even more xp</font>"

			if(num==26)
				player << "<font color=#00cc00>Zanzo is learned from Piccolo, when active you can double click screen to teleport, After Image is learned from goku, it leaves a slight image to distract people.</font>"
				num = 0

			spawn(4200)Dragon_Tip()
			num ++
			return

//Crimsons Advanced Monster Respawner
//Crim patch 2.61 Crims advanced monster respawner
		Saibaman_Repopulate()
			if(!Saibaman_Repop)
				spawn(1500)Saibaman_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Saibaman_Repop.len)
					var/saiba=Saibaman_Repop[i]
					new saiba(Saibaman_Loc[i])
				Saibaman_Repop = null
				Saibaman_Loc = null
				Saibaman_Repop = new/list
				Saibaman_Loc = new/list
/* Crim Patch 2.61 testing to prove that the list entries have been cleared
			world<<"saiba repop list has [Saibaman_Repop.len] entries"
			world<<"saiba loc list has [Saibaman_Loc.len] entries"*/
			spawn(1500)Saibaman_Repopulate()
			return

		Namekian_Repopulate()
			if(!Namekian_Repop)
				spawn(1600)Namekian_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Namekian_Repop.len)
					var/namek=Namekian_Repop[i]
					new namek(Namekian_Loc[i])
				Namekian_Repop = null
				Namekian_Loc = null
				Namekian_Repop = new/list
				Namekian_Loc = new/list
			spawn(1600)Namekian_Repopulate()
			return

		Saiyan_Repopulate()
			if(!Saiyan_Repop)
				spawn(1340)Saiyan_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Saiyan_Repop.len)
					var/saiyan=Saiyan_Repop[i]
					new saiyan(Saiyan_Loc[i])
				Saiyan_Repop = null
				Saiyan_Loc = null
				Saiyan_Repop = new/list
				Saiyan_Loc = new/list
			spawn(1340)Saiyan_Repopulate()
			return

		Android_Repopulate()
			if(!Android_Repop)
				spawn(5000)Android_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Android_Repop.len)
					var/droid=Android_Repop[i]
					new droid(Android_Loc[i])
				Android_Repop = null
				Android_Loc = null
				Android_Repop = new/list
				Android_Loc = new/list
			spawn(5000)Android_Repopulate()
			return

		Angel_Repopulate()
			if(!Angel_Repop)
				spawn(2000)Angel_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Angel_Repop.len)
					var/angel=Angel_Repop[i]
					new angel(Angel_Loc[i])
				Angel_Repop = null
				Angel_Loc = null
				Angel_Repop = new/list
				Angel_Loc = new/list
			spawn(2000)Angel_Repopulate()
			return

		Demon_Repopulate()
			if(!Demon_Repop)
				spawn(4150)Demon_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Demon_Repop.len)
					var/demon=Demon_Repop[i]
					new demon(Demon_Loc[i])
				Demon_Repop = null
				Demon_Loc = null
				Demon_Repop = new/list
				Demon_Loc = new/list
			spawn(4150)Demon_Repopulate()
			return

		Dragon_Repopulate()
			if(!Dragon_Repop)
				spawn(2000)Dragon_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Dragon_Repop.len)
					var/drag=Dragon_Repop[i]
					new drag(Dragon_Loc[i])
				Dragon_Repop = null
				Dragon_Loc = null
				Dragon_Repop = new/list
				Dragon_Loc = new/list
			spawn(2000)Dragon_Repopulate()
			return

		Bio_Repopulate()
			if(!Bio_Repop)
				spawn(2500)Bio_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Bio_Repop.len)
					var/bio=Bio_Repop[i]
					new bio(Bio_Loc[i])
				Bio_Repop = null
				Bio_Loc = null
				Bio_Repop = new/list
				Bio_Loc = new/list
			spawn(2500)Bio_Repopulate()
			return

		Misc_Repopulate()
			if(!Misc_Repop)
				spawn(1500)Misc_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Misc_Repop.len)
					var/misc=Misc_Repop[i]
					new misc(Misc_Loc[i])
				Misc_Repop = null
				Misc_Loc = null
				Misc_Repop = new/list
				Misc_Loc = new/list
			spawn(1500)Misc_Repopulate()
			return

		Majin_Repopulate()
			if(!Majin_Repop)
				spawn(2560)Majin_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Majin_Repop.len)
					var/majin=Majin_Repop[i]
					new majin(Majin_Loc[i])
				Majin_Repop = null
				Majin_Loc = null
				Majin_Repop = new/list
				Majin_Loc = new/list
			spawn(2560)Majin_Repopulate()
			return

		Quest_Repopulate()
			if(!Quest_Repop)
				spawn(2100)Quest_Repopulate()
				return
			if(!halt_repop)
			//	for(var/mob/PC/M in player)
			//		alert(M,"MOBS REPOPPING")

				for(var/i=1 to Quest_Repop.len)
					var/questm=Quest_Repop[i]
					new questm(Quest_Loc[i])
				//	sleep(1)

				Quest_Repop = null
				Quest_Loc = null
				Quest_Repop = new/list
				Quest_Loc = new/list
			spawn(2100)Quest_Repopulate()
			return

		Quest_Repopulate2()
			if(!Quest_Repop2)
				spawn(2950)Quest_Repopulate2()
				return
			if(!halt_repop)
			//	for(var/mob/PC/M in player)
			//		alert(M,"MOBS REPOPPING")

				for(var/i=1 to Quest_Repop2.len)
					var/questm2=Quest_Repop2[i]
					new questm2(Quest_Loc2[i])
				//	sleep(1)

				Quest_Repop2 = null
				Quest_Loc2 = null
				Quest_Repop2 = new/list
				Quest_Loc2 = new/list
			spawn(2950)Quest_Repopulate2()
			return

		Rose_Repopulate()
			if(!Rose_Repop)
				spawn(1600)Rose_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Rose_Repop.len)
					var/rosem=Rose_Repop[i]
					new rosem(Rose_Loc[i])

				Rose_Repop = null
				Rose_Loc = null
				Rose_Repop = new/list
				Rose_Loc = new/list
			spawn(1600)Rose_Repopulate()
			return
		NewSaiyan_Repopulate()
			if(!NewSaiyan_Repop)
				spawn(1710)NewSaiyan_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to NewSaiyan_Repop.len)
					var/newsaiyan=NewSaiyan_Repop[i]
					new newsaiyan(NewSaiyan_Loc[i])
				NewSaiyan_Repop = null
				NewSaiyan_Loc = null
				NewSaiyan_Repop = new/list
				NewSaiyan_Loc = new/list
			spawn(1710)NewSaiyan_Repopulate()
			return

		Beerus_Repopulate()
			if(!Beerus_Repop)
				spawn(3100)Beerus_Repopulate()
				return
			if(!halt_repop)
				for(var/i=1 to Beerus_Repop.len)
					var/newsaiyan=Beerus_Repop[i]
					new newsaiyan(Beerus_Loc[i])
				Beerus_Repop = null
				Beerus_Loc = null
				Beerus_Repop = new/list
				Beerus_Loc = new/list
			spawn(3100)Beerus_Repopulate()
			return
		SPAWN()
			set background=1
			players=0
			var/warcount=0
			var/chlger
			var/arenacount=0
			for(var/obj/techs/O in player)
				if(O.owner==null||!O.owner||O.owner=="")
					del(O)
			for(var/mob/M in player)
				if(M.challenger!=""||M.challenger!=null)
					chlger=M.challenger
					for(var/mob/M2 in player)
						if(M2==chlger)
							arenacount++
				if(M.in_war)
					warcount++
				if(M.client)
					players++
			if(!warcount)
				gwar_on=0
			if(!arenacount)
				arena_on=0
			sleep(5)
			_month = time2text(world.realtime,"MM")
			_day = time2text(world.realtime,"DD")
			_hour = time2text(world.realtime,"hh")
			_year = time2text(world.realtime,"YYYY")
			_cday = time2text(world.realtime,"DDD")
			AutoUnbanTimer()
		//	world << "<B><FONT SIZE = 1><FONT COLOR = teal>Welcome To Ruination! Enjoy!"
			spawn(3000)SPAWN()
			return

		AUTOTOURNY()
	//		var/ttype = 1
			if(!tournament)
			/*	if(ttype == 1)
					AutoStartJuniorTourney()
					ttype = 2
				if(ttype == 2)
					AutoStartWorldTourney()
					ttype = 1*/
				AutoStartTourney()
			else
				player<<"<font color=white>Tournament has been cancelled!"
			spawn(6000)AUTOTOURNY()

//		SERVER_MESSAGE()
//			player << "<font color=#FF0000><u>Register on our forums at: http://s15.zetaboards.com/Dragonball_Ruination/index/.</u></font>"
//			spawn(9000)SERVER_MESSAGE()
/*
		AutoSagas()
			var/saga = rand(1,10)
			var/diff = rand(1,5)
			var/reset=1
			if(reset>1)
				reset=0
				sagas_on=0
				sagas_evil=0
				sagas_good=0
				saga_episode=0
				saga_spawned=0
				spawn(12000)AutoSagas()
				return

			if(!sagas_on)
				if(saga < 6)
					for(var/mob/Saga/M in world)
						del(M)
					player <<"<font color = #990000>Saga Information:<font color=white> Sagas have been Activated!"
					sagas_on=1
					sagas_evil=1
					sagas_good=0
					reset=0
					saga="Not On"
					part="Not On"
					if(diff == 1)
						saga_difficulty="Pathetic"
					if(diff == 2)
						saga_difficulty="Easy"
					if(diff == 3)
						saga_difficulty="Medium"
					if(diff == 4)
						saga_difficulty="Hard"
					if(diff == 5)
						saga_difficulty="Extreme"
					saga_episode=0
					saga_spawned=0
					spawn(10)world.SAGA_CHECK()
					spawn(12000)AutoSagas()
					return
				else
					for(var/mob/Saga/M in world)
						del(M)
					player <<"<font color = #990000>Saga Information:<font color=white> Sagas have been Activated!"
					sagas_on=1
					sagas_evil=0
					sagas_good=1
					reset=0
					saga="Not On"
					part="Not On"
					if(diff == 1)
						saga_difficulty="Pathetic"
					if(diff == 2)
						saga_difficulty="Easy"
					if(diff == 3)
						saga_difficulty="Medium"
					if(diff == 4)
						saga_difficulty="Hard"
					if(diff == 5)
						saga_difficulty="Extreme"
					saga_episode=0
					spawn(10)world.SAGA_CHECK()
					spawn(12000)AutoSagas()
					return
			else
				reset ++
				spawn(12000)AutoSagas()
				return
*/

		UpdatePlayers()
			world.status= "<font size = -2><B>Ruination 5.0</b><br><b>Players:</b> [players]<br><b>EXP:</b> +[(sexp-1)*100]%<br><b>Zenni:</b> +[(szenni-1)*100]%<br><b>Kill Boost:</b> x[s_kill]"
			spawn(3000)UpdatePlayers()

/*var/TimeTill=0
proc/StartCountdown()
	set background = 1
	TimeTill=120
	while(TimeTill)
		sleep(10)
		TimeTill -=1*/

var/list/BannedTK=list("")
var/_day=""
var/_cday=""
var/_hour=""
var/_month=""
var/_year="2018"
world
	proc
		AutoUnbanTimer()
			for(var/X in BannedTK)
				var/unbankey=copytext(X,15)
				var/unbanmonth=copytext(X,1,3)
				var/unbanday=copytext(X,4,6)
				var/unbanyear=copytext(X,7,11)
				var/unbanhour=copytext(X,12,14)
				if(unbanyear<=_year)
					if(unbanmonth<=_month)
						if(unbanday<=_day)
							if(unbanhour<=_hour)
								BannedTK.Remove(X)
								var/savefile/S=new("world save files/Timed Bans.sav")
								S["BannedTK"]<<BannedTK
								AdminMessage("Auto Unban Timer: [unbankey] has been unbanned.")
proc
	dd_hasprefix(text, prefix)
		var/start = 1
		var/end = lentext(prefix) + 1
		return findtext(text, prefix, start, end)
	dd_hassuffix(text, suffix)
		var/start = length(text) - length(suffix)
		if (start) return findtext(text, suffix, start)
	dd_gmtext2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)
			textList += "[buggyText]"
			searchPosition = findPosition + separatorlength
			if (findPosition == 0)
				return textList
			else
				if (searchPosition > textlength)
					textList += ""
					return textList
	dd_replacetext(text, search_string, replacement_string)
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)
	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)
			return
		var/newText = "[the_list[1]]"
		var/count
		for (count = 2, count <= total, count++)
			if (separator) newText += separator
			newText += "[the_list[count]]"
		return newText
	dd_text2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)
			findPosition = findtext(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)
			textList += "[buggyText]"
			searchPosition = findPosition + separatorlength
			if (findPosition == 0)
				return textList
			else
				if (searchPosition > textlength)
					textList += ""
					return textList




/*client
	DblClick()
		if(usr.splits==1)
			walk_to("[usr]'s Split Form",src)
		..()*/
/*	Click(O as obj)
		if(O:name==usr.name)
			return
		else
			if(istype(O,/mob))
				var/info = {"<body background="http://i43.tinypic.com/167s1fq.png" text=#000000><font family="Palatino Linotype"
	<br>(Character Name/Key): [O:name]/[O:key]<br>(Character Race): [O:race]<hr><br>(PVP Level): [O:pvp_level]<br>(Guild Information): [O:guild_name]<br>([O:name]'s Zenni): [O:zenni]<br><hr><title>Character Information</title>
	"}
				if(usr.charinfo)
					usr << browse(info,"window=Hench;size=370x240;border=0;can_resize=0; can_minimize=0;")
				else
					..()
			else
				..()*/

world/proc
	WorldSpawn()
		spawn(3000)SPAWN()
		spawn(100)Earth_Dragonball_Spawn(10000)
		spawn(100)Namek_Dragonball_Spawn(10000)
		spawn(100)Black_Dragonball_Spawn(10000)
		//spawn(3000)AutoSagas()
	//	spawn(7200)Shard_Spawn()
		spawn(4500)Dragon_Tip()
		spawn(6000)AUTOTOURNY()
//		spawn(9000)SERVER_MESSAGE()
		spawn(3000)UpdatePlayers()
//Crim patch 2.61 added spawns for the custom respawner proc

		spawn(660)Saibaman_Repopulate()
		spawn(720)Namekian_Repopulate()
		spawn(780)Saiyan_Repopulate()
		spawn(840)Android_Repopulate()
		spawn(900)Angel_Repopulate()
		spawn(960)Demon_Repopulate()
		spawn(1020)Dragon_Repopulate()
		spawn(1080)Misc_Repopulate()
		spawn(1140)Majin_Repopulate()
		spawn(1200)Bio_Repopulate()
		spawn(1260)Quest_Repopulate()
		spawn(1320)Rose_Repopulate()
		spawn(1380)NewSaiyan_Repopulate()
	//	spawn(1450)Beerus_Repopulate()
	//	spawn(1440)Quest_Repopulate2() EXPLOSIVE CELLS
