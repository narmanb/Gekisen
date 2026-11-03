mob
	var
		trans_exp = 0
		trans_tnl = 75
		trans_lvl = 0
		trans_spd = 51
		trans_mastered = 0
		trans_speed = 0
		transsexp = 0
		transstnl = 75
		transsmastered = 0
		transformed = 0
mob
	proc
		Trans_Level()
			if(src.trans_lvl <= 98)
				if(src.trans_exp >= src.trans_tnl)
					src.trans_exp -= src.trans_tnl
					src.trans_lvl ++
					src << "<center><FONT COLOR=#000080>.</FONT><FONT COLOR=#000780>:</FONT><FONT COLOR=#000e80>:</FONT><FONT COLOR=#001480> </FONT><FONT COLOR=#001b80>T</FONT><FONT COLOR=#002280>r</FONT><FONT COLOR=#002980>a</FONT><FONT COLOR=#003080>n</FONT><FONT COLOR=#003680>s</FONT><FONT COLOR=#003d80>f</FONT><FONT COLOR=#004480>o</FONT><FONT COLOR=#004b80>r</FONT><FONT COLOR=#005180>m</FONT><FONT COLOR=#005880>a</FONT><FONT COLOR=#005f80>t</FONT><FONT COLOR=#006680>i</FONT><FONT COLOR=#006d80>o</FONT><FONT COLOR=#007380>n</FONT><FONT COLOR=#007a80> </FONT><FONT COLOR=#008080>s</FONT><FONT COLOR=#007b80>k</FONT><FONT COLOR=#007480>i</FONT><FONT COLOR=#006e80>l</FONT><FONT COLOR=#006780>l</FONT><FONT COLOR=#006180> </FONT><FONT COLOR=#005a80>i</FONT><FONT COLOR=#005480>n</FONT><FONT COLOR=#004d80>c</FONT><FONT COLOR=#004780>r</FONT><FONT COLOR=#004180>e</FONT><FONT COLOR=#003a80>a</FONT><FONT COLOR=#003480>s</FONT><FONT COLOR=#002d80>e</FONT><FONT COLOR=#002780>d</FONT><FONT COLOR=#002080>!</FONT><FONT COLOR=#001a80> </FONT><FONT COLOR=#001380> </FONT><FONT COLOR=#000d80>:</FONT><FONT COLOR=#000680>:</FONT><FONT COLOR=#000080>.</FONT></center>"
					src.trans_tnl += round(src.trans_tnl * 0.1)
				else
					return
			else
				if(src.trans_mastered == 1)
					return
				else
					src.trans_lvl = 100
					src.trans_spd = 1
					src.trans_mastered = 1
					src << "<center><FONT COLOR=#0000cd>.</FONT><FONT COLOR=#0902c5>:</FONT><FONT COLOR=#1205bc>:</FONT><FONT COLOR=#1c07b3> </FONT><FONT COLOR=#250aaa>T</FONT><FONT COLOR=#2e0ca0>r</FONT><FONT COLOR=#370e97>a</FONT><FONT COLOR=#41118e>n</FONT><FONT COLOR=#4a1385>s</FONT><FONT COLOR=#53167c>f</FONT><FONT COLOR=#5c1873>o</FONT><FONT COLOR=#651a6a>r</FONT><FONT COLOR=#6f1d61>m</FONT><FONT COLOR=#781f58>a</FONT><FONT COLOR=#81214e>t</FONT><FONT COLOR=#8a2445>i</FONT><FONT COLOR=#94263c>o</FONT><FONT COLOR=#9d2933>n</FONT><FONT COLOR=#a52a2a> </FONT><FONT COLOR=#9d2933>s</FONT><FONT COLOR=#95263b>k</FONT><FONT COLOR=#8c2444>i</FONT><FONT COLOR=#83224d>l</FONT><FONT COLOR=#7a2055>l</FONT><FONT COLOR=#721d5e> </FONT><FONT COLOR=#691b66>M</FONT><FONT COLOR=#60196f>a</FONT><FONT COLOR=#571778>s</FONT><FONT COLOR=#4f1480>t</FONT><FONT COLOR=#461289>e</FONT><FONT COLOR=#3d1092>r</FONT><FONT COLOR=#340e9a>e</FONT><FONT COLOR=#2c0ba3>d</FONT><FONT COLOR=#2309ab>!</FONT><FONT COLOR=#1a07b4> </FONT><FONT COLOR=#1105bd>:</FONT><FONT COLOR=#0902c5>:</FONT><FONT COLOR=#0000cd>.</FONT></center>"

		Trans_Speed()
			if(src.trans_speed <= 98)
				if(src.transsexp >= src.transstnl)
					src.transsexp -= src.transstnl
					src.trans_speed ++
					src.trans_spd -= 0.5
					src << "<center><FONT COLOR=#c0c0c0>.</FONT><FONT COLOR=#bac2c1>:</FONT><FONT COLOR=#b3c3c2>:</FONT><FONT COLOR=#adc5c3> </FONT><FONT COLOR=#a6c7c4>T</FONT><FONT COLOR=#9fc9c4>r</FONT><FONT COLOR=#98cac5>a</FONT><FONT COLOR=#91ccc6>n</FONT><FONT COLOR=#8bcec7>s</FONT><FONT COLOR=#84d0c8>f</FONT><FONT COLOR=#7dd1c9>o</FONT><FONT COLOR=#76d3ca>r</FONT><FONT COLOR=#70d5cb>m</FONT><FONT COLOR=#69d7cc>a</FONT><FONT COLOR=#62d8cd>t</FONT><FONT COLOR=#5bdacd>i</FONT><FONT COLOR=#54dcce>o</FONT><FONT COLOR=#4edecf>n</FONT><FONT COLOR=#47dfd0> </FONT><FONT COLOR=#40e0d0>s</FONT><FONT COLOR=#47dfd0>p</FONT><FONT COLOR=#4edecf>e</FONT><FONT COLOR=#54dcce>e</FONT><FONT COLOR=#5bdacd>d</FONT><FONT COLOR=#62d8cd> </FONT><FONT COLOR=#69d7cc>i</FONT><FONT COLOR=#70d5cb>n</FONT><FONT COLOR=#76d3ca>c</FONT><FONT COLOR=#7dd1c9>r</FONT><FONT COLOR=#84d0c8>e</FONT><FONT COLOR=#8bcec7>a</FONT><FONT COLOR=#91ccc6>s</FONT><FONT COLOR=#98cac5>e</FONT><FONT COLOR=#9fc9c4>d</FONT><FONT COLOR=#a6c7c4>!</FONT><FONT COLOR=#adc5c3> </FONT><FONT COLOR=#b3c3c2>:</FONT><FONT COLOR=#bac2c1>:</FONT><FONT COLOR=#c0c0c0>.</FONT></center>"
					src.transstnl += round(src.transstnl * 0.1)
				else
					return
			else
				if(src.transsmastered == 1)
					return
				else
					src.trans_speed = 100
					src.trans_spd = 1
					src.transsmastered = 1
					src << "<center><font color=white> <FONT COLOR=#87cefa>.</FONT><FONT COLOR=#89c5ef>:</FONT><FONT COLOR=#8bbce2>:</FONT><FONT COLOR=#8cb2d6> </FONT><FONT COLOR=#8ea8ca>T</FONT><FONT COLOR=#909ebe>r</FONT><FONT COLOR=#9295b1>a</FONT><FONT COLOR=#948ba5>n</FONT><FONT COLOR=#968199>s</FONT><FONT COLOR=#97788c>f</FONT><FONT COLOR=#996e80>o</FONT><FONT COLOR=#9b6474>r</FONT><FONT COLOR=#9d5b67>m</FONT><FONT COLOR=#9f515b>a</FONT><FONT COLOR=#a1474f>t</FONT><FONT COLOR=#a23d43>i</FONT><FONT COLOR=#a43436>o</FONT><FONT COLOR=#a52a2a>n</FONT><FONT COLOR=#a43436> </FONT><FONT COLOR=#a23d43>s</FONT><FONT COLOR=#a1474f>p</FONT><FONT COLOR=#9f515b>e</FONT><FONT COLOR=#9d5b67>e</FONT><FONT COLOR=#9b6474>d</FONT><FONT COLOR=#996e80> </FONT><FONT COLOR=#97788c>M</FONT><FONT COLOR=#968199>a</FONT><FONT COLOR=#948ba5>x</FONT><FONT COLOR=#9295b1>e</FONT><FONT COLOR=#909ebe>d</FONT><FONT COLOR=#8ea8ca>!</FONT><FONT COLOR=#8cb2d6> </FONT><FONT COLOR=#8bbce2>:</FONT><FONT COLOR=#89c5ef>:</FONT><FONT COLOR=#87cefa>.</FONT> </font></center>"

		Trans_Gain()
			if(src.transformed == 1)
				if(src.form_5 == 1)
					src.trans_exp += 5
					spawn() src.Trans_Level()
					spawn(900-(trans_lvl*7.5)) src.Trans_Gain()
					return
				else
					if(src.form_4 == 1)
						src.trans_exp += rand(4,5)
						spawn() src.Trans_Level()
						spawn(900-(trans_lvl*7.5)) src.Trans_Gain()
						return
					else
						if(src.form_3 == 1)
							src.trans_exp += 3
							spawn() src.Trans_Level()
							spawn(900-(trans_lvl*7.5)) src.Trans_Gain()
							return
						else
							if(src.form_2 == 1)
								src.trans_exp += rand(2,3)
								spawn() src.Trans_Level()
								spawn(900-(trans_lvl*7.5)) src.Trans_Gain()
								return
							else
								if(src.form_1 == 1)
									src.trans_exp += 1
									spawn() src.Trans_Level()
									spawn(900-(trans_lvl*7.5)) src.Trans_Gain()
									return
			else
				return

