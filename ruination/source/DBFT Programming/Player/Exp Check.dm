mob
	proc
		Exp_Check()

			if(level >= 1000)
				if(src.up1 == 0)
					src.up1 = 1
					src.expup += 0.1
					mode = "Super Easy"
					moden += 1
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered Super Easy Mode!"
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Super Easy Mode")

			if(level >= 2000)
				if(src.up2 == 0)
					src.up2 = 1
					src.expup += 0.1
					mode = "Easy"
					moden += 1
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered Easy Mode!"
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Easy Mode")

			if(level >= 3500)
				if(src.up3 == 0)
					src.up3 = 1
					src.expup += 0.25
					mode = "Medium"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=lime><i>Medium</i> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Medium Mode")

			if(level >= 5000)
				if(src.up4 == 0)
					src.up4 = 1
					src.expup += 0.5
					mode = "Hard"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=red><i>Hard</i> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Hard Mode")

			if(level >= 7500)
				if(src.up5 == 0)
					src.up5 = 1
					src.expup += 1
					mode = "Hardcore"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=red><i><u>Hardcore</i></u><font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Hardcore Mode")

			if(level >= 10000)
				if(src.up6 == 0)
					src.up6 = 1
					src.expup += 1.5
					mode = "Expert"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=#1111ff>Expert<font color=white> Mode!"
					moden += 1

			if(level >= 13500)
				if(src.up7 == 0)
					src.up7 = 1
					src.expup += 2
					mode = "Sensei"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=teal>Sensei<font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Sensei Mode")

			if(level >= 18000)
				if(src.up8 == 0)
					src.up8 = 1
					src.expup += 3
					mode = "Master"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=teal><u>Master</u><font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Master Mode")

			if(level >= 25000)
				if(src.up9 == 0)
					src.up9 = 1
					src.expup += 4
					mode = "Grandmaster"
					player <<"<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=teal><i><u>Grandmaster</i></u><font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Grandmaster Mode")

			if(level >= 36000)
				if(src.up10 == 0)
					src.up10 = 1
					src.expup += 5
					mode = "Champion"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=#00cc00>Champion<font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Champion Mode")

			if(level >= 50000)
				if(src.up11 == 0)
					src.up11 = 1
					src.expup += 5
					mode = "Deity"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <font color=#990000>Deity<font color=white> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Deity Mode")

			if(level >= 70000)
				if(src.up12 == 0)
					src.up12 = 1
					src.expup += 5
					mode = "Demi God"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <FONT COLOR=#006400>D</FONT><FONT COLOR=#16664b>e</FONT><FONT COLOR=#2c6897>m</FONT><FONT COLOR=#4169e1>i</FONT><FONT COLOR=#3269aa> </FONT><FONT COLOR=#216771>G</FONT><FONT COLOR=#116639>o</FONT><FONT COLOR=#006400>d</FONT> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Demi God Mode")

			if(level >= 100000)
				if(src.up13 == 0)
					src.up13 = 1
					src.expup += 5
					mode = "Immortal"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <FONT SIZE=+1><FONT COLOR=#6a5acd>I</FONT><FONT COLOR=#4791de>m</FONT><FONT COLOR=#24c9ef>m</FONT><FONT COLOR=#00ffff>o</FONT><FONT COLOR=#1bd7f3>r</FONT><FONT COLOR=#36ade7>t</FONT><FONT COLOR=#5084da>a</FONT><FONT COLOR=#6a5acd>l</FONT></FONT> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Immortal Mode")

			if(level >= 150000)
				if(src.up14 == 0)
					src.up14 = 1
					src.expup += 5
					mode = "AllFather"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <FONT SIZE=+1><FONT COLOR=#ff00ff>A</FONT><FONT COLOR=#cf2ddc>l</FONT><FONT COLOR=#9e5ab9>l</FONT><FONT COLOR=#6d8795>F</FONT><FONT COLOR=#3cb371>a</FONT><FONT COLOR=#36aa5e>t</FONT><FONT COLOR=#30a04a>h</FONT><FONT COLOR=#299536>e</FONT><FONT COLOR=#228b22>r</FONT> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached AllFather Mode")

			if(level >= 200000)
				if(src.up15 == 0)
					src.up15 = 1
					src.expup += 10
					mode = "Awakened"
					player << "<font color=#0066ff>Training Information:<font color=white> [src] has entered <FONT SIZE=+1><FONT COLOR=#7fff00>A</FONT><FONT COLOR=#a9a9a9>w</FONT><FONT COLOR=#95d555>a</FONT><FONT COLOR=#7fff00>k</FONT><FONT COLOR=#95d555>e</FONT><FONT COLOR=#a9a9a9>n</FONT><FONT COLOR=#95d555>e</FONT><FONT COLOR=#7fff00>d</FONT> Mode!"
					moden += 1
					if(src.playerwatch==1)
						PlayerWatch(src,"Has Reached Awakened Mode")

			//world << "<b>tnl: [src.tnl]   expup: [src.expup]"
		Rank_Up()

			if(kills >= 10 && src.rank == "Newbie")
				src.rank = "Weak"
				src.tp += 100
				src << "<font color=white>Training Points + 100</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Weak!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Weak")

			if(kills >= 25 && src.rank == "Weak")
				src.rank = "Novice"
				src.tp += 200
				src << "<font color=white>Training Points + 200</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Novice!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Novice")

			if(kills >= 50 && src.rank == "Novice")
				src.rank = "Amateur"
				src.tp += 350
				src << "<font color=white>Training Points + 350</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Amateur!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Amateur")

			if(kills >= 100 && src.rank == "Amateur")
				src.rank = "Fighter"
				src.tp += 500
				src << "<font color=white>Training Points + 500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Fighter!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Fighter")

			if(kills >= 200 && src.rank == "Fighter")
				src.rank = "Featherweight"
				src.tp += 1000
				src << "<font color=white>Training Points + 1000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Featherweight!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Featherweight")

			if(kills >= 350 && src.rank == "Featherweight"||kills >= 350 && src.rank == "/")
				src.rank = "Lightweight"
				src.tp += 1500
				src << "<font color=white>Training Points + 1500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Lightweight!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Lightweight")

			if(kills >= 500 && src.rank == "Lightweight")
				src.rank = "Brawler"
				src.tp += 3000
				src << "<font color=white>Training Points + 3000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Brawler!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Brawler")

			if(kills >= 800 && src.rank == "Brawler")
				src.rank = "Heavyweight"
				src.tp += 5000
				src << "<font color=white>Training Points + 5000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Heavyweight!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Heavyweight")

			if(kills >= 1200 && src.rank == "Heavyweight")
				src.rank = "Juggernaut"
				src.tp += 7500
				src << "<font color=white>Training Points + 7500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Juggernaut!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Juggernaught")

			if(kills >= 1800 && src.rank == "Juggernaut")
				src.rank = "Slayer"
				src.tp += 10000
				src << "<font color=white>Training Points + 10000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Slayer!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Slayer")

			if(kills >= 2500 && src.rank == "Slayer")
				src.rank = "Defiler"
				src.tp += 15000
				src << "<font color=white>Training Points + 15,000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Defiler!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Defiler")

			if(kills >= 3600 && src.rank == "Defiler")
				src.rank = "Destroyer"
				src.tp += 17500
				src << "<font color=white>Training Points + 17,500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Destroyer!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Destroyer")

			if(kills >= 5000 && src.rank == "Destroyer")
				src.rank = "Annihilator"
				src.tp += 20000
				src << "<font color=white>Training Points + 20,000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Annihilator!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Annihilator")

			if(kills >= 7000 && src.rank == "Annihilator")
				src.rank = "Decimator"
				src.tp += 22500
				src << "<font color=white>Training Points + 22,500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Decimator!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Decimator")

			if(kills >= 10000 && src.rank == "Decimator")
				src.rank = "Warmonger"
				src.tp += 25000
				src << "<font color=white>Training Points + 25,000</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of Warmonger!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Warmonger")

			if(kills >= 14000 && src.rank == "Warmonger")
				src.rank = "Eradicator"
				src.tp += 27500
				src << "<font color=white>Training Points + 27,500</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of <FONT COLOR=#ffe4b5>E</FONT><FONT COLOR=#e3ac89>r</FONT><FONT COLOR=#c6735b>a</FONT><FONT COLOR=#a8392e>d</FONT><FONT COLOR=#8b0000>i</FONT><FONT COLOR=#a22e24>c</FONT><FONT COLOR=#ba5c49>a</FONT><FONT COLOR=#d1896d>t</FONT><FONT COLOR=#e9b792>or</FONT>!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Eradicator")

			if(kills >= 20000 && src.rank == "Eradicator")
				src.rank = "Executioner"

				if(src.resets < 3)
					src.zp += 5
					src << "<font color=white>Z-Points +5</font>"
				else
					src << "<font color=white>Training Points + 30,000</font>"
					src.tp += 30000
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of <FONT COLOR=#800000>E</FONT><FONT COLOR=#6d1d33>x</FONT><FONT COLOR=#593a66>e</FONT><FONT COLOR=#46579a>c</FONT><FONT COLOR=#3274cd>u</FONT><FONT COLOR=#1e90ff>t</FONT><FONT COLOR=#3274cd>i</FONT><FONT COLOR=#46579a>o</FONT><FONT COLOR=#593a66>n</FONT><FONT COLOR=#6d1d33>e</FONT><FONT COLOR=#800000>r</FONT>!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Executioner")

			if(kills >= 25000 && src.rank == "Executioner"&& src.resets>=1)
				src.rank = "Exterminator"
				src.zp += 10

				src << "<font color=white>Training Points + 50,000</font>"
				src.tp += 50000

				src << "<font color=white>Z-Points +10</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of <FONT COLOR=#ff0000>E</FONT><FONT COLOR=#ff201d>x</FONT><FONT COLOR=#fd413a>t</FONT><FONT COLOR=#fc6156>e</FONT><FONT COLOR=#fa8072>r</FONT><FONT COLOR=#fb675c>m</FONT><FONT COLOR=#fc4d45>i</FONT><FONT COLOR=#fe342e>n</FONT><FONT COLOR=#ff1a17>a</FONT><FONT COLOR=#ff1a17>t</FONT><FONT COLOR=#ff0000>o</FONT><FONT COLOR=#ff0000>r</FONT>!"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Exterminator")

			if(kills >= 30000 && src.rank == "Exterminator"&& src.resets>=2)
				src.rank = "Genocider"
				src.zp += 15
				src << "<font color=white>Z-Points +15</font>"
				player << "<font color=#0066ff>Training Information: <font color=white>[src] has been promoted to the rank of <FONT COLOR=#9acd32>G</FONT><FONT COLOR=#85b55e>e</FONT><FONT COLOR=#6e9c8a>n</FONT><FONT COLOR=#5882b6>o</FONT><FONT COLOR=#4169e1>c</FONT><FONT COLOR=#5882b6>i</FONT><FONT COLOR=#6e9c8a>d</FONT><FONT COLOR=#85b55e>e</FONT><FONT COLOR=#9acd32>r</FONT> !"
				if(src.playerwatch==1)
					PlayerWatch(src,"Has Reached the rank of Genocider")