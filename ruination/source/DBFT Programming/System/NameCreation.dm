obj/Supplemental/NameDisplay
	icon='Alphabet.dmi'
	layer=3
	pixel_y=-10
	New(var/px,var/IS)
		src.pixel_x=px+9
		src.icon_state=IS
atom/proc/CreateName(var/Name2Add)
	if(Name2Add==null)	Name2Add=src.name
	var/letter=" "
	var/spot=0
	for(var/O in src.overlays)
		if(O!=null)
			if(O:name=="NameDisplay")	src.overlays-=O
		else	src.overlays-=O
	while(letter!="")
		spot+=1
		letter=copytext(Name2Add,spot,spot+1)
		if(letter=="")	return
		var/px=(spot*6)-(length(Name2Add)*6)/2
		var/obj/NL=new/obj/Supplemental/NameDisplay(px,letter)
		if(isobj(src))	NL.icon+=rgb(0,120,200)
		src.overlays+=NL

