mob/NPC/MrPopo
	//icon = 'NPCs - New.dmi'
	//icon_state = "Mr.Popo"
	name = "Mr. Popo"
	icon = 'mrpopo.dmi'
	density = 1
	safe = 1
	frozen = 1
	it_blocked=0
	energy_code = 5943361
	New()
		..()
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(3)
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Popo")
		if(usr.talking)
			return
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		switch(input("Hello. How can I help you today?")in list("Increase Stat Crit","Increase Training Point Crit","Cancel"))
			if("Cancel")
				usr.talking=0
				return
			if("Increase Training Point Crit")
				switch(alert("Increase Training Point Crit?","Buy TP Crits","Yes","No"))
					if("Yes")
						var/x=input("How many crits would you like to buy?","Training Point Crit","1") as num
						if((usr.tpc+x)>=101)
							usr<<"That will go over 100, try again"
							return
						if(x>=1)
							var/tmp/cost=2000000*x  // 2,000,000
							switch(alert("That will cost $[applycommas(cost)], is this ok?","Buy TP Crit","Yes","No"))
								if("Yes")
									if(usr.zenni>=cost)
										if(!usr.tpcm)
											usr.zenni-=cost
											usr.tpc +=x
											if(usr.tpc > 99)
												usr.tpcm = 1
												usr<<"<center><FONT COLOR=#800080>T</FONT><FONT COLOR=#870c87>r</FONT><FONT COLOR=#8e198e>a</FONT><FONT COLOR=#962596>i</FONT><FONT COLOR=#9d329d>n</FONT><FONT COLOR=#a43ea4>i</FONT><FONT COLOR=#ab4aab>n</FONT><FONT COLOR=#b357b3>g</FONT><FONT COLOR=#ba63ba> </FONT><FONT COLOR=#c16fc1>P</FONT><FONT COLOR=#c87cc8>o</FONT><FONT COLOR=#d088d0>i</FONT><FONT COLOR=#d795d7>n</FONT><FONT COLOR=#dda0dd>t</FONT><FONT COLOR=#d795d7> </FONT><FONT COLOR=#d088d0>C</FONT><FONT COLOR=#c87cc8>r</FONT><FONT COLOR=#c16fc1>i</FONT><FONT COLOR=#ba63ba>t</FONT><FONT COLOR=#b357b3> </FONT><FONT COLOR=#ab4aab>M</FONT><FONT COLOR=#a43ea4>a</FONT><FONT COLOR=#9d329d>x</FONT><FONT COLOR=#962596>e</FONT><FONT COLOR=#8e198e>d</FONT><FONT COLOR=#870c87>!</FONT><FONT COLOR=#800080>!</FONT></center>"
												return
											usr << "<center><FONT COLOR=#4b0082>T</FONT><FONT COLOR=#570982>r</FONT><FONT COLOR=#631282>a</FONT><FONT COLOR=#6f1c82>i</FONT><FONT COLOR=#7a2582>n</FONT><FONT COLOR=#862e82>i</FONT><FONT COLOR=#923782>n</FONT><FONT COLOR=#9e4182>g</FONT><FONT COLOR=#aa4a81> </FONT><FONT COLOR=#b65381>P</FONT><FONT COLOR=#c25c81>o</FONT><FONT COLOR=#cd6581>i</FONT><FONT COLOR=#d96f80>n</FONT><FONT COLOR=#e57880>t</FONT><FONT COLOR=#f08080> </FONT><FONT COLOR=#e67880>C</FONT><FONT COLOR=#db7080>r</FONT><FONT COLOR=#d06781>i</FONT><FONT COLOR=#c55f81>t</FONT><FONT COLOR=#ba5681> </FONT><FONT COLOR=#af4d81>I</FONT><FONT COLOR=#a44581>n</FONT><FONT COLOR=#983c82>c</FONT><FONT COLOR=#8d3482>r</FONT><FONT COLOR=#822b82>e</FONT><FONT COLOR=#772282>a</FONT><FONT COLOR=#6c1a82>s</FONT><FONT COLOR=#611182>e</FONT><FONT COLOR=#560982>d</FONT><FONT COLOR=#4b0082>!</FONT></center>"
											sleep(10)
											usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
											usr.talking=0
											return
										else
											usr << "<font color=white>Mr. Popo: </font>Your Training Point Crit is maxed."
											usr.talking=0
											return
									else
										usr << "<font color=white>Mr. Popo: </font>You need [applycommas(cost)] zenni!"
										usr.talking=0
										return
								if("No")
									usr << "<font color=white>Mr. Popo: </font>Alright maybe next time, take care."
									usr.talking=0
									return
						if(usr.zenni>=2000000)
							if(!usr.tpcm)
								usr.zenni-=2000000
								usr.tpc +=1
								if(usr.tpc > 99)
									usr.tpcm = 1
									usr<<"<center><FONT COLOR=#800080>T</FONT><FONT COLOR=#870c87>r</FONT><FONT COLOR=#8e198e>a</FONT><FONT COLOR=#962596>i</FONT><FONT COLOR=#9d329d>n</FONT><FONT COLOR=#a43ea4>i</FONT><FONT COLOR=#ab4aab>n</FONT><FONT COLOR=#b357b3>g</FONT><FONT COLOR=#ba63ba> </FONT><FONT COLOR=#c16fc1>P</FONT><FONT COLOR=#c87cc8>o</FONT><FONT COLOR=#d088d0>i</FONT><FONT COLOR=#d795d7>n</FONT><FONT COLOR=#dda0dd>t</FONT><FONT COLOR=#d795d7> </FONT><FONT COLOR=#d088d0>C</FONT><FONT COLOR=#c87cc8>r</FONT><FONT COLOR=#c16fc1>i</FONT><FONT COLOR=#ba63ba>t</FONT><FONT COLOR=#b357b3> </FONT><FONT COLOR=#ab4aab>M</FONT><FONT COLOR=#a43ea4>a</FONT><FONT COLOR=#9d329d>x</FONT><FONT COLOR=#962596>e</FONT><FONT COLOR=#8e198e>d</FONT><FONT COLOR=#870c87>!</FONT><FONT COLOR=#800080>!</FONT></center>"
									return
								usr << "<center><FONT COLOR=#4b0082>T</FONT><FONT COLOR=#570982>r</FONT><FONT COLOR=#631282>a</FONT><FONT COLOR=#6f1c82>i</FONT><FONT COLOR=#7a2582>n</FONT><FONT COLOR=#862e82>i</FONT><FONT COLOR=#923782>n</FONT><FONT COLOR=#9e4182>g</FONT><FONT COLOR=#aa4a81> </FONT><FONT COLOR=#b65381>P</FONT><FONT COLOR=#c25c81>o</FONT><FONT COLOR=#cd6581>i</FONT><FONT COLOR=#d96f80>n</FONT><FONT COLOR=#e57880>t</FONT><FONT COLOR=#f08080> </FONT><FONT COLOR=#e67880>C</FONT><FONT COLOR=#db7080>r</FONT><FONT COLOR=#d06781>i</FONT><FONT COLOR=#c55f81>t</FONT><FONT COLOR=#ba5681> </FONT><FONT COLOR=#af4d81>I</FONT><FONT COLOR=#a44581>n</FONT><FONT COLOR=#983c82>c</FONT><FONT COLOR=#8d3482>r</FONT><FONT COLOR=#822b82>e</FONT><FONT COLOR=#772282>a</FONT><FONT COLOR=#6c1a82>s</FONT><FONT COLOR=#611182>e</FONT><FONT COLOR=#560982>d</FONT><FONT COLOR=#4b0082>!</FONT></center>"
								sleep(10)
								usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
								usr.talking=0
								return
							else
								usr << "<font color=white>Mr. Popo: </font>Your Training Point Crit is maxed."
								usr.talking=0
								return

			if("Increase Z Point Crit")
				switch(alert("Increase Z Point Crit?","Buy Z Crits","Yes","No"))
					if("Yes")
						var/x=input("How many crits would you like to buy?","Z Point Crit","1") as num
						if((usr.zpc+x)>=101)
							usr<<"That will go over 100, try again"
							return
						if(x>=1)
							var/tmp/cost=5000000*x   // 5000000 10mil
							switch(alert("That will cost $[applycommas(cost)], is this ok?","Buy ZP Crit","Yes","No"))
								if("Yes")
									if(usr.zenni>=cost)
										if(!usr.zpcm)
											usr.zenni-=cost
											usr.zpc +=x
											if(usr.zpc > 99)
												usr.zpcm = 1
												usr<<"<center><FONT COLOR=#ff0000>Z</FONT><FONT COLOR=#fc0d10> </FONT><FONT COLOR=#f81921>P</FONT><FONT COLOR=#f42631>o</FONT><FONT COLOR=#f03242>i</FONT><FONT COLOR=#eb3f52>n</FONT><FONT COLOR=#e74b63>t</FONT><FONT COLOR=#e35873> </FONT><FONT COLOR=#df6484>C</FONT><FONT COLOR=#db7093>r</FONT><FONT COLOR=#df6685>i</FONT><FONT COLOR=#e25a76>t</FONT><FONT COLOR=#e64f68> </FONT><FONT COLOR=#ea4459>M</FONT><FONT COLOR=#ee394a>a</FONT><FONT COLOR=#f12d3b>x</FONT><FONT COLOR=#f5222c>e</FONT><FONT COLOR=#f9171e>d</FONT><FONT COLOR=#fc0b0f>!</FONT><FONT COLOR=#ff0000>!</FONT></center>"
												return
											usr << "<center><FONT COLOR=#483d8b>Z</FONT><FONT COLOR=#554992> </FONT><FONT COLOR=#625599>P</FONT><FONT COLOR=#7061a0>o</FONT><FONT COLOR=#7d6da7>i</FONT><FONT COLOR=#8a79ae>n</FONT><FONT COLOR=#9784b6>t</FONT><FONT COLOR=#a490bd> </FONT><FONT COLOR=#b19cc4>C</FONT><FONT COLOR=#bfa8cb>r</FONT><FONT COLOR=#ccb4d2>i</FONT><FONT COLOR=#d8bfd8>t</FONT><FONT COLOR=#ccb4d2> </FONT><FONT COLOR=#bfa8cb>I</FONT><FONT COLOR=#b19cc4>n</FONT><FONT COLOR=#a490bd>c</FONT><FONT COLOR=#9784b6>r</FONT><FONT COLOR=#8a79ae>e</FONT><FONT COLOR=#7d6da7>a</FONT><FONT COLOR=#7061a0>s</FONT><FONT COLOR=#625599>e</FONT><FONT COLOR=#554992>d</FONT><FONT COLOR=#483d8b>!</FONT></center>"
											sleep(10)
											usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
											usr.talking=0
											return
										else
											usr << "<font color=white>Mr. Popo: </font>Your ZP Crit is maxed."
											usr.talking=0
											return
									else
										usr << "<font color=white>Mr. Popo: </font>You need [applycommas(cost)] zenni!"
										usr.talking=0
										return
								if("No")
									usr << "<font color=white>Mr. Popo: </font>Alright maybe next time, take care."
									usr.talking=0
									return
						if(usr.zenni>=5000000)
							if(!usr.zpcm)
								usr.zenni-=5000000
								usr.zpc +=1
								if(usr.zpc > 99)
									usr.zpcm = 1
									usr<<"<center><FONT COLOR=#ff0000>Z</FONT><FONT COLOR=#fc0d10> </FONT><FONT COLOR=#f81921>P</FONT><FONT COLOR=#f42631>o</FONT><FONT COLOR=#f03242>i</FONT><FONT COLOR=#eb3f52>n</FONT><FONT COLOR=#e74b63>t</FONT><FONT COLOR=#e35873> </FONT><FONT COLOR=#df6484>C</FONT><FONT COLOR=#db7093>r</FONT><FONT COLOR=#df6685>i</FONT><FONT COLOR=#e25a76>t</FONT><FONT COLOR=#e64f68> </FONT><FONT COLOR=#ea4459>M</FONT><FONT COLOR=#ee394a>a</FONT><FONT COLOR=#f12d3b>x</FONT><FONT COLOR=#f5222c>e</FONT><FONT COLOR=#f9171e>d</FONT><FONT COLOR=#fc0b0f>!</FONT><FONT COLOR=#ff0000>!</FONT></center>"
									return
								sleep(10)
								usr << "<center><FONT COLOR=#483d8b>Z</FONT><FONT COLOR=#554992> </FONT><FONT COLOR=#625599>P</FONT><FONT COLOR=#7061a0>o</FONT><FONT COLOR=#7d6da7>i</FONT><FONT COLOR=#8a79ae>n</FONT><FONT COLOR=#9784b6>t</FONT><FONT COLOR=#a490bd> </FONT><FONT COLOR=#b19cc4>C</FONT><FONT COLOR=#bfa8cb>r</FONT><FONT COLOR=#ccb4d2>i</FONT><FONT COLOR=#d8bfd8>t</FONT><FONT COLOR=#ccb4d2> </FONT><FONT COLOR=#bfa8cb>I</FONT><FONT COLOR=#b19cc4>n</FONT><FONT COLOR=#a490bd>c</FONT><FONT COLOR=#9784b6>r</FONT><FONT COLOR=#8a79ae>e</FONT><FONT COLOR=#7d6da7>a</FONT><FONT COLOR=#7061a0>s</FONT><FONT COLOR=#625599>e</FONT><FONT COLOR=#554992>d</FONT><FONT COLOR=#483d8b>!</FONT></center>"
								usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
								usr.talking=0
								return
							else
								usr << "<font color=white>Mr. Popo: </font>Your ZP Crit is maxed."
								usr.talking=0
								return


			if("Increase Stat Crit")
				switch(alert("Increase Stat Crit?","Buy Stat Crit","Yes","No"))
					if("Yes")
						var/x=input("How many crits would you like to buy?","Stat Crit","1") as num
						if((usr.statc+x)>=101)
							usr<<"That will go over 100, try again"
							return
						if(x>=1)
							var/tmp/cost=10000000*x    // 10,0000,000
							switch(alert("That will cost $[applycommas(cost)], is this ok?","Buy Stat Crit","Yes","No"))
								if("Yes")
									if(usr.zenni>=cost)
										if(!usr.statcm)
											usr.zenni-=cost
											usr.statc +=x
											if(usr.statc > 99)
												usr.statcm = 1
												usr<<"<center><FONT COLOR=#228b22>S</FONT><FONT COLOR=#1f9a3e>t</FONT><FONT COLOR=#1aa85a>a</FONT><FONT COLOR=#16b775>t</FONT><FONT COLOR=#12c691> </FONT><FONT COLOR=#0dd4ad>C</FONT><FONT COLOR=#09e3c9>r</FONT><FONT COLOR=#04f1e4>i</FONT><FONT COLOR=#00ffff>t</FONT><FONT COLOR=#04f1e4> </FONT><FONT COLOR=#09e3c9>M</FONT><FONT COLOR=#0dd4ad>a</FONT><FONT COLOR=#12c691>x</FONT><FONT COLOR=#16b775>e</FONT><FONT COLOR=#1aa85a>d</FONT><FONT COLOR=#1f9a3e>!</FONT><FONT COLOR=#228b22>!</FONT></center>"
												return
											usr << "<center><FONT COLOR=#3cb371>S</FONT><FONT COLOR=#508756>t</FONT><FONT COLOR=#645a39>a</FONT><FONT COLOR=#782d1d>t</FONT><FONT COLOR=#8b0000> </FONT><FONT COLOR=#93272d>C</FONT><FONT COLOR=#9a4f59>r</FONT><FONT COLOR=#a27686>i</FONT><FONT COLOR=#a99eb2>t</FONT><FONT COLOR=#b0c4de> </FONT><FONT COLOR=#a99eb2>I</FONT><FONT COLOR=#a27686>n</FONT><FONT COLOR=#9a4f59>c</FONT><FONT COLOR=#93272d>r</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#7c2417>a</FONT><FONT COLOR=#6c482e>s</FONT><FONT COLOR=#5c6c44>e</FONT><FONT COLOR=#4c905b>d</FONT><FONT COLOR=#3cb371>!</FONT></center>"
											sleep(10)

											usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
											usr.talking=0
											return
										else
											usr << "<font color=white>Mr. Popo: </font>Your Stat Crit is maxed."
											usr.talking=0
											return
									else
										usr << "<font color=white>Mr. Popo: </font>You need [applycommas(cost)] zenni!"
										usr.talking=0
										return
								if("No")
									usr << "<font color=white>Mr. Popo: </font>Alright maybe next time, take care."
									usr.talking=0
									return
						if(usr.zenni>=10000000)
							if(!usr.statcm)
								usr.zenni-=10000000
								usr.statc +=1
								if(usr.statc > 99)
									usr.statcm = 1
									usr<<"<center><FONT COLOR=#228b22>S</FONT><FONT COLOR=#1f9a3e>t</FONT><FONT COLOR=#1aa85a>a</FONT><FONT COLOR=#16b775>t</FONT><FONT COLOR=#12c691> </FONT><FONT COLOR=#0dd4ad>C</FONT><FONT COLOR=#09e3c9>r</FONT><FONT COLOR=#04f1e4>i</FONT><FONT COLOR=#00ffff>t</FONT><FONT COLOR=#04f1e4> </FONT><FONT COLOR=#09e3c9>M</FONT><FONT COLOR=#0dd4ad>a</FONT><FONT COLOR=#12c691>x</FONT><FONT COLOR=#16b775>e</FONT><FONT COLOR=#1aa85a>d</FONT><FONT COLOR=#1f9a3e>!</FONT><FONT COLOR=#228b22>!</FONT></center>"
									return
								usr << "<center><FONT COLOR=#3cb371>S</FONT><FONT COLOR=#508756>t</FONT><FONT COLOR=#645a39>a</FONT><FONT COLOR=#782d1d>t</FONT><FONT COLOR=#8b0000> </FONT><FONT COLOR=#93272d>C</FONT><FONT COLOR=#9a4f59>r</FONT><FONT COLOR=#a27686>i</FONT><FONT COLOR=#a99eb2>t</FONT><FONT COLOR=#b0c4de> </FONT><FONT COLOR=#a99eb2>I</FONT><FONT COLOR=#a27686>n</FONT><FONT COLOR=#9a4f59>c</FONT><FONT COLOR=#93272d>r</FONT><FONT COLOR=#8b0000>e</FONT><FONT COLOR=#7c2417>a</FONT><FONT COLOR=#6c482e>s</FONT><FONT COLOR=#5c6c44>e</FONT><FONT COLOR=#4c905b>d</FONT><FONT COLOR=#3cb371>!</FONT></center>"
								sleep(10)
								usr << "<font color=white>Mr. Popo: </font>Come see me again for more training."
								usr.talking=0
								return
							else
								usr << "<font color=white>Mr. Popo: </font>Your Stat Crit is maxed."
								usr.talking=0
								return
