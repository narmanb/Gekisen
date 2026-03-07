//!! Shinra Inc Keycards !!
/*
obj
	var
		keycards
		Red
			name="Red Keycard"
			icon = 'keycards.dmi'
			icon_state="Red"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1 && usr.guild=="<b><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#1313fa>h</FONT><FONT COLOR=#2727f3>i</FONT><FONT COLOR=#3a3aed>n</FONT><FONT COLOR=#4d4de6>r</FONT><FONT COLOR=#6161e0>a</FONT><FONT COLOR=#7474da> </FONT><FONT COLOR=#8787d3>I</FONT><FONT COLOR=#9a9acd>n</FONT><FONT COLOR=#aeaec6>c</FONT><FONT COLOR=#c0c0c>.</FONT></FONT></b></font>")
						usr.loc=locate(usr.x,usr.y+1,usr.z)
		Blue
			name="Blue Keycard"
			icon = 'keycards.dmi'
			icon_state="Blue"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1 && usr.guild=="<b><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#1313fa>h</FONT><FONT COLOR=#2727f3>i</FONT><FONT COLOR=#3a3aed>n</FONT><FONT COLOR=#4d4de6>r</FONT><FONT COLOR=#6161e0>a</FONT><FONT COLOR=#7474da> </FONT><FONT COLOR=#8787d3>I</FONT><FONT COLOR=#9a9acd>n</FONT><FONT COLOR=#aeaec6>c</FONT><FONT COLOR=#c0c0c>.</FONT></FONT></b></font>")
						src.loc=locate(usr.x,usr.y+1,usr.z)
		Gold
			name="Gold Keycard"
			icon = 'keycards.dmi'
			icon_state="Gold"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1 && usr.guild=="<b><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#1313fa>h</FONT><FONT COLOR=#2727f3>i</FONT><FONT COLOR=#3a3aed>n</FONT><FONT COLOR=#4d4de6>r</FONT><FONT COLOR=#6161e0>a</FONT><FONT COLOR=#7474da> </FONT><FONT COLOR=#8787d3>I</FONT><FONT COLOR=#9a9acd>n</FONT><FONT COLOR=#aeaec6>c</FONT><FONT COLOR=#c0c0c>.</FONT></FONT></b></font>")
						src.loc=locate(usr.x,usr.y+1,usr.z)
		Green
			name="Green Keycard"
			icon = 'keycards.dmi'
			icon_state="Green"
			density=0
			verb
				Get()
					set category = "Communication" //was inventory
					set src in oview(1)
					if(length(usr.contents)<30)
						Move(usr)
					else
						usr<<"Your inventory is full"
				Drop()
					set category = "Communication"
					if(usr.hasfused!=1 && usr.guild=="<b><FONT COLOR=#0000ff>S</FONT><FONT COLOR=#1313fa>h</FONT><FONT COLOR=#2727f3>i</FONT><FONT COLOR=#3a3aed>n</FONT><FONT COLOR=#4d4de6>r</FONT><FONT COLOR=#6161e0>a</FONT><FONT COLOR=#7474da> </FONT><FONT COLOR=#8787d3>I</FONT><FONT COLOR=#9a9acd>n</FONT><FONT COLOR=#aeaec6>c</FONT><FONT COLOR=#c0c0c>.</FONT></FONT></b></font>")
						src.loc=locate(usr.x,usr.y+1,usr.z)

/mob/keycardadmin
	verb
		Give_Keycard(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Choose the keycard you want to give him/her.", "Keycard Giver",text) in list("Red Keycard","Gold Keycard","Blue Keycard","Green Keycard","Cancel"))
				if("Red Keycard")
					M<<"You have got the red keycard from [usr]!"
					M.contents+= new obj/keycards/Red
				if("Blue Keycard")
					M<<"You have got the blue keycard from [usr]!"
					M.contents+= new obj/keycards/Blue
				if("Gold Keycard")
					M<<"You have got the gold keycard from [usr]!"
					M.contents+= new obj/keycards/Gold
				if("Green Keycard")
					M<<"You have got the green keycard from [usr]!"
					M.contents+= new obj/keycards/Green
				if("Cancel")
					return
		Remove_Keycard(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Choose the keycard you want to remove from him/her.", "Keycard Remover",text) in list("Red Keycard","Gold Keycard","Blue Keycard","Green Keycard","Cancel"))
				if("Red Keycard")
					M<<"Your red keycard has been removed by [usr]!"
					M.contents-= obj/keycards/Red
				if("Blue Keycard")
					M<<"Your blue keycard has been removed by [usr]!"
					M.contents-= obj/keycards/Blue
				if("Gold Keycard")
					M<<"Your black keycard has been removed by [usr]!"
					M.contents-= obj/keycards/Gold
				if("Green Keycard")
					M<<"Your green keycard has been removed by [usr]!"
					M.contents-= obj/keycards/Green
				if("Cancel")
					return
*/