//Client/New { ..(); winshow(src,"skills",0);}
//(if((!winget(src,"skills","is-visible")=="true"))return
Client/New() { ..(); winshow(src,"multis",0); }


mob/var
	Redoing_Stats
	Points=5
	Max_Points=1000
	HasCreated=0

//mob/proc/Set_Minimum_Stats()
//	Minimum_Stats=list("Eff"=KiMod,"Str"=StrMod,"End"=EndMod,"Pow"=PowMod,"Res"=ResMod,\
//	"Off"=OffMod,"Def"=DefMod,"Spd"=SpdMod,"Reg"=Regeneration,"Rec"=Recovery)
mob/verb/M_Points(type as text,skill as text)
	set name=".M_Points"
	set hidden=1
//	alert("1 type [type]  skill  [skill]")
	if(!(skill in list("Powerlevel","Ki","Strength","Defense","Stamina"))) return
//	alert("TWO")
	if(!(winget(usr,"multis","is-visible")=="true")) return
//	alert("THREE")
	if(!(type in list("-","+"))) return
	//if(!(type in list("+"))) return
//	alert("FOUR")
	var/Increase=1
//	alert("2")
	if(type=="-")
		if(Points==Max_Points) return //You cant subtract any more points if points are full
		Increase=-1
	if(type=="+")
		Increase=1
		if(Points==0) return //You cant add any more points if you had none left
//	alert("3")
	if(src.HasCreated!=0)
		usr<< "Error or exploit? You shouldn't be distributing points now"
		//logAndAlertAdmins("[usr] Tried to abuse to abuse a bug and use extra stat points on their character!",2)
		AdminMessage("[usr] \red bugged or tried to exploit stat multis")
		del(usr)
		return
//	alert("4")
	Redoing_Stats=1
	var/max = 10 + rebirths
	//if(src.Race == "Alien")
	//	max = 15
//	alert("CLiCKED max is [max] pl [src.power_multi] ki [src.ki_multi] stam [src.staminaleft_max]")
	if(!src.Redoing_Stats) return
//	alert("5 skill [skill]")
	switch(skill)

		if("Powerlevel")
			if(type=="-")
				if(src.power_multi > 1)
					src.power_multi -= 1
				else
					return
			if(type=="+")
				if(src.power_multi == max)
					alert("You can only put [max] points into this multi")
					return
				else
					src.power_multi += 1
			if(usr) if(client)
				winset(usr,"PowerlevelLab","text=[power_multi]")
		if("Ki")
			if(type=="-")
				if(src.ki_multi > 1)
					src.ki_multi -= 1
				else
					return
			//	if(StrMod<=Minimum_Stats["Str"])
			//		return
			if(type=="+")
				if(src.ki_multi == max)
					alert("You can only put [max] points into this multi")
					return
				else
					src.ki_multi += 1
		//	Raise_Strength(Increase)
			if(usr) if(client)
				winset(usr,"KiLab","text=[ki_multi]")
		if("Strength")
			if(type=="-")
				if(src.strength_multi > 1 )
					src.strength_multi -= 1
				else
					return
			if(type=="+")
				if(src.strength_multi == max)
					alert("You can only put [max] points into this multi")
					return
				else
					src.strength_multi += 1
			//Raise_Durability(Increase)
			if(usr) if(client)
				winset(usr,"StrengthLab","text=[strength_multi]")
		if("Defense")
			if(type=="-")
				if(src.defence_multi > 1)
					src.defence_multi -= 1
				else
					return
			//	if(SpdMod<=Minimum_Stats["Spd"])
			//		return
			if(type=="+")
				if(src.defence_multi == max)
					alert("You can only put [max] points into this multi")
					return
				else
					src.defence_multi += 1
		//	Raise_Speed(Increase)
			if(usr) if(client)
				winset(usr,"DefenseLab","text=[defence_multi]")
		if("Stamina")
			if(type=="-")
				//if(src.staminaleft_max > 1000)
				if(src.staminaleft_max > 600)
					src.staminaleft_max -= 200
			//	if(PowMod<=Minimum_Stats["Pow"])
			//		return
				else
					return
			if(type=="+")
				if(src.staminaleft_max >= 2000)
					alert("Your stamina cannot be raised any further")
					return
				else
					src.staminaleft_max += 200
		//	Raise_Force(Increase)
			if(usr) if(client)
				winset(usr,"StaminaLab","text=[staminaleft_max]")
		else
		//	alert("You really ought to try not to abuse character generation!")
			return

//	alert("Points before [Points]")
	Points-=Increase
	//if(usr) if(client)
//	alert("Points after [Points]")
	winset(usr,"PointsRemaining","text=[Points]")
	return
mob/verb/Done_With_Multis()
	set name=".Done_With_Multis"
	set hidden=1
	if(Points) alert("You still have points!")
	else
	//	usr.WarriorLevelSet()
		usr.HasCreated=1
		winshow(usr,"multis",0)
		winshow(usr,"default",1)
		src.frozen = 0
		src.GMLocked = 0
		return
mob/proc/Stat_Point_Window_Refresh()
	winset(usr,"PointsRemaining","text=[Points]")
//	winset(src,"Race BP","text=\"This race has [BPMod]x Battle Power Gain\"")
	winset(usr,"PowerlevelLab","text=[power_multi]")
	winset(usr,"StrengthLab","text=[strength_multi]")
	winset(usr,"DefenseLab","text=[defence_multi]")
	winset(usr,"KiLab","text=[ki_multi]")
	winset(usr,"StaminaLab","text=[staminaleft_max]")
	//	winset(src,"Resistance","text=[ResMod]")
	//	winset(src,"Offense","text=[OffMod]")
	//	winset(src,"Defense","text=[DefMod]")
	//	winset(src,"Regeneration","text=[Regeneration]")
	//	winset(src,"Recovery","text=[Recovery]")
/*
mob/proc/Raise_Energy(Amount=1)
	KiMod+=(Minimum_Stats["Eff"]*0.1)*Amount
mob/proc/Raise_Speed(Amount=1)
	SpdMod+=(Minimum_Stats["Spd"]*0.1)*Amount
mob/proc/Raise_Strength(Amount=1)
	StrMod+=(Minimum_Stats["Str"]*0.1)*Amount
mob/proc/Raise_Durability(Amount=1)
	EndMod+=(Minimum_Stats["End"]*0.1)*Amount
mob/proc/Raise_Force(Amount=1)
	PowMod+=(Minimum_Stats["Pow"]*0.1)*Amount
mob/proc/Raise_Resistance(Amount=1)
	ResMod+=(Minimum_Stats["Res"]*0.1)*Amount
mob/proc/Raise_Offense(Amount=1)
	OffMod+=(Minimum_Stats["Off"]*0.1)*Amount
mob/proc/Raise_Defense(Amount=1)
	DefMod+=(Minimum_Stats["Def"]*0.1)*Amount
mob/proc/Raise_Regeneration(Amount=1)
	Regeneration+=(Minimum_Stats["Reg"]*0.1)*Amount
mob/proc/Raise_Recovery(Amount=1)
	Recovery+=(Minimum_Stats["Rec"]*0.1)*Amount
mob/proc/Racial_Stats()
//	if(race == "Android")
//		return
//	else
	Points = 6
	Max_Points = 6
	if(Race == "Alien")
		Points+=45
		Max_Points += 45
	if(Race == "Half-Saiyan")
		Points+=25
		Max_Points += 25
	if(Race == "Quarter Saiyan")
		Points+=25
		Max_Points += 25
	if(Race == "1/16th Saiyan")
		Points+=25
		Max_Points += 25
	Set_Minimum_Stats()
	Stat_Point_Window_Refresh()
	if(src) if(client)
		winshow(src,"multiss",1)
		while(src && client && (winget(src,"multis","is-visible")=="true"))
			sleep(1)
	src.Redoing_Stats = 1
	*/
/*
obj/Redo_Stats
	var/Last_Redo=0
	verb/Redo_Stats()
		set category="Other"
		if(Last_Redo+5>Year)
			usr<<"You can not do this til year [Last_Redo+5]"
			return
		usr.Redoing_Stats=1
		Last_Redo=Year
		usr.Redo_Stats()
mob/proc/Redo_Stats()
	set category="Other"
	Redoing_Stats=1
	Expand_Revert()
	Cancel_Focus()
	Cancel_Expand()
	Cancel_LimitBreaker()
	KaiokenRevert()
	Majin_Revert()
	Mystic_Revert()
	Third_Eye_Revert()
	var/Reverts=5
	while(Reverts)
		Reverts-=1
		Cancel_Transformation()
	MaxKi/=KiMod
	Off/=OffMod
	Def/=DefMod
	KiMod=Minimum_Stats["Eff"]
	SpdMod=Minimum_Stats["Spd"]
	StrMod=Minimum_Stats["Str"]
	EndMod=Minimum_Stats["End"]
	PowMod=Minimum_Stats["Pow"]
	ResMod=Minimum_Stats["Res"]
	OffMod=Minimum_Stats["Off"]
	DefMod=Minimum_Stats["Def"]
	Regeneration=Minimum_Stats["Reg"]
	Recovery=Minimum_Stats["Rec"]
	Racial_Stats()
	MaxKi*=KiMod
	Off*=OffMod
	Def*=DefMod
	Redoing_Stats=0
	*/
/*
mob/verb/checkmultis()
	alert("PL: [usr.power_multi]    ki: [usr.ki_multi]    str: [usr.strength_multi]    def: [usr.defence_multi]    stam: [usr.staminaleft_max]  hascreated : [usr.HasCreated]")

mob/verb/refresh()
	usr.Stat_Point_Window_Refresh()
	*/