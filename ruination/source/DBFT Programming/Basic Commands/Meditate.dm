mob/var/ki_focus=""
mob/var/tmp/mtrain=0
mob/PC/verb/Meditate()
	set category = "Training"
	if(usr.playerwatch==1)
		PlayerWatch(usr,"Meditate")
//	if(src.starttrain)
//		return
	if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
		src<<output("You are already training with another technique","output2")
		return

	if(src.meditating_delay)
		src << output("You must wait before Meditating again","output2")
		return

	if(src.meditating)
		src.meditating_delay = 1
		src.icon_state = ""
		src.meditating = 0
		src.frozen = 0
		src.doing = 0

		src.thrown=0
		spawn(20)src.mtrain=0
		src.undercheck=0
		src << output("You stop meditating.","output2")
		spawn(25)src.meditating_delay = 0
		return
//	if(src.jailed)
//		src << "can't do this while jailed"
//		return
	if(src.staminaleft >= src.staminaleft_max)
		src.undercheck=0
		return
	if(src.doing)
		src.undercheck=0
		return
	if(src.train)
		return
//	src.starttrain=1

//	if(src.transformed||src.inverted||src.form_1||src.form_2||src.form_3||src.form_4||src.form_5||src.form_6)
//		src.frozen = 1
//		src << "You are about to revert before you begin to train"
//		sleep(2)
//		src.RevertProc()
//		src.frozen = 1
//		sleep(35)
//		src.frozen = 0
//	src.starttrain=0
	if(!src.meditating)
		if(usr.learn_invertpower && usr.hasgokubody == 0)
			var/x=input("What will you meditate on?","Meditate")in list("Cancel","Melee","Block","Dodge","Counter","Critical","Durability","Ki Control","Ki Cast","Ki Power","Ki Use","Ki Resistance","Weapon","Weapon Power","Weapon Resistance","Invert Skill","Invert Speed")
			if(x=="Melee")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Melee"
				src << "You will now meditate on Melee"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Block")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Block"
				src << "You will now meditate on Block"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Dodge")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Dodge"
				src << "You will now meditate on Dodge"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Counter")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Counter"
				src << "You will now meditate on Counter"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Critical")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Critical"
				src << "You will now meditate on Critical"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Durability")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Durability"
				src << "You will now meditate on Durability"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Control")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Control"
				src << "You will now meditate on Ki Control"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Power")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Power"
				src << "You will now meditate on Ki Power"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Cast")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Cast"
				src << "You will now meditate on Ki Cast"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Use")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Use"
				src << "You will now meditate on Ki Use"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Resistance")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Resistance"
				src << "You will now meditate on Ki Resistance"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Deflect")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Deflect"
				src << "You will now meditate on Deflect"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon"
				src << "You will now meditate on Weapon"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon Power")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon Power"
				src << "You will now meditate on Weapon Power"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon Resistance")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon Resistance"
				src << "You will now meditate on Weapon Resistance"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Trans Skill")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Trans Skill"
				src << "You will now meditate on Trans Skill"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Trans Speed")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Trans Speed"
				src << "You will now meditate on Trans Speed"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Invert Skill")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Invert Skill"
				src << "You will now meditate on Invert Skill"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Invert Speed")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Invert Speed"
				src << "You will now meditate on Invert Speed"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0
			src.mtrain=1
		else
			var/x=input("What will you meditate on?","Meditate")in list("Melee","Block","Dodge","Counter","Critical","Durability","Ki Control","Ki Cast","Ki Power","Ki Use","Ki Resistance","Weapon","Weapon Power","Weapon Resistance","Trans Skill","Trans Speed")
			if(x=="Melee")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Melee"
				src << "You will now meditate on Melee"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Block")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Block"
				src << "You will now meditate on Block"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Dodge")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Dodge"
				src << "You will now meditate on Dodge"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Counter")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Counter"
				src << "You will now meditate on Counter"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Critical")
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Critical"
				src << "You will now meditate on Critical"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Durability")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Durability"
				src << "You will now meditate on Durability"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Control")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Control"
				src << "You will now meditate on Ki Control"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Power")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Power"
				src << "You will now meditate on Ki Power"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Cast")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Cast"
				src << "You will now meditate on Ki Cast"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Use")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Use"
				src << "You will now meditate on Ki Use"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Ki Resistance")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Ki Resistance"
				src << "You will now meditate on Ki Resistance"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Deflect")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Deflect"
				src << "You will now meditate on Deflect"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon"
				src << "You will now meditate on Weapon"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon Power")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon Power"
				src << "You will now meditate on Weapon Power"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Weapon Resistance")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Weapon Resistance"
				src << "You will now meditate on Weapon Resistance"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Trans Skill")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Trans Skill"
				src << "You will now meditate on Trans Skill"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Trans Speed")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Trans Speed"
				src << "You will now meditate on Trans Speed"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Invert Skill")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Invert Skill"
				src << "You will now meditate on Invert Skill"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0

			if(x=="Invert Speed")
				if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
					src<<"You are already training with another technique"
				if(src.doing)
					src.undercheck=0
					src<<"You are busy at the moment."
					return
				src.ki_focus = "Invert Speed"
				src << "You will now meditate on Invert Speed"
				src.meditating_delay = 1
				src.icon_state = "meditate"
				src.meditating = 1
				src.doing = 1
				src.frozen = 1
				spawn(5) src.Meditate_Gain()
				spawn(25) src.meditating_delay = 0
			src.mtrain=1



mob/proc/Meditate_Gain()
	if(!src.meditating)
		src.undercheck=0
		return
	if(!src.frozen)
		src.undercheck=0
		return
/*	if(src.ftrain||src.dtrain||src.strain||src.train||src.waiting1)
		src<<"You are already training with another technique"
		return*/
	if(src.staminaleft >= src.staminaleft_max)
		src.staminaleft = src.staminaleft_max
		src.meditating = 0
		src.frozen = 0
		src.doing = 0
		src.icon_state = ""
		src.undercheck=0
		return
	sleep(24)
	if(!src.meditating)
		src.undercheck=0
		return
	if(!src.frozen)
		src.undercheck=0
		return
	if(src.dualtrain||src.focus_boxing||src.boxing)
		src.undercheck=0
		src.meditating=0
		src.frozen=0
		src.doing=0
		return

	var/skill_exp = round(5+(src.level/1000))
	skill_exp *= 2
	if(src.gravtrain)
		skill_exp *= 2
	if(src.in_hbtc)
		skill_exp *= 1.5
	if(src.ki_focus=="Melee")
		src.melee_exp += skill_exp
		src.Melee_Level()
	if(src.ki_focus=="Block")
		src.block_exp += skill_exp
		src.Block_Level()
	if(src.ki_focus=="Dodge")
		src.dodge_exp += skill_exp
		src.Dodge_Level()
	if(src.ki_focus=="Counter")
		src.count_exp += skill_exp
		src.Counter_Level()
	if(src.ki_focus=="Critical")
		src.crit_exp += skill_exp
		src.Critical_Level()
	if(src.ki_focus=="Durability")
		src.durability_exp += skill_exp
		src.Durability_Level()
	if(src.ki_focus=="Ki Control")
		src.ki_con_exp += skill_exp
		src.Ki_Con_Level()
	if(src.ki_focus=="Ki Power")
		src.ki_pow_exp += skill_exp
		src.Ki_Power_Level()
	if(src.ki_focus=="Ki Cast")
		src.ki_cast_exp += skill_exp*rand(1,4)
		src.Ki_Cast_Level()
	if(src.ki_focus=="Ki Use")
		src.ki_use_exp += skill_exp
		src.Ki_Use_Level()
	if(src.ki_focus=="Ki Resistance")
		src.ki_res_exp += skill_exp
		src.Ki_Res_Level()
	if(src.ki_focus=="Deflect")
		src.reflect_exp += skill_exp
		src.Reflect_Level()
	if(src.ki_focus=="Weapon")
		src.weapon_exp += skill_exp
		src.Weapon_Level()
	if(src.ki_focus=="Weapon Power")
		src.weapon_power_exp += skill_exp
		src.Weapon_Power_Level()
	if(src.ki_focus=="Weapon Resistance")
		src.weapon_res_exp += skill_exp
		src.Weapon_Res_Level()
	if(src.ki_focus=="Trans Skill")
		src.trans_exp += skill_exp
		src.Trans_Level()
	if(src.ki_focus=="Trans Speed")
		src.transsexp += skill_exp
		src.Trans_Speed()
	if(src.ki_focus=="Invert Skill")
		src.invertexp += skill_exp
		src.Invert_Level()
	if(src.ki_focus=="Invert Speed")
		src.invertsexp += skill_exp
		src.Invert_Speed()
	src.Med_Stats()
	//if(!src.staminabuff)src.staminaleft+=8
	spawn(10)Meditate_Gain()

mob/proc/Med_Stats()



	var/pwrprob = 0
	var/kiprob = 3
//	var/kidprob = 4
	var/strprob = 3
	var/defprob = 4
//	var/spdprob = 3
//	var/stmprob = 3
//	var/stat = rand(1,7)
//	var/pl = round(rand(1,3) + (rand((src.level*0.2),(src.level*0.4))*src.moden)+src.powerlevel_bonus)
//	var/ki = round(rand(1,2) + (rand((src.level*0.1),(src.level*0.3))*src.moden)+src.ki_bonus)
//	var/kid = round(rand(1,2) + (rand((src.level*0.1),(src.level*0.3))*src.moden)+src.kidefense_bonus)
//	var/str = round(rand(1,2) + (rand((src.level*0.1),(src.level*0.3))*src.moden)+src.strength_bonus)
//	var/def = round(rand(1,2) + (rand((src.level*0.1),(src.level*0.3))*src.moden)+src.defence_bonus)
//	var/spd = round(rand(100,150) + (rand((src.level*0.2),(src.level*0.4))*src.moden*0.8)+src.speed_bonus)
//	var/stm = round(rand(20,50)+(src.level/100))

	var/lvlgains = src.level
	if(src.level > 200000)
		lvlgains = 200000
	lvlgains = rand(lvlgains*0.1,lvlgains*0.3)
	var/plvlgains = lvlgains * 2
	var/pl = (rand(1,3) + plvlgains * src.moden) + src.powerlevel_bonus
	var/ki = (rand(1,2) + lvlgains * src.moden) + src.ki_bonus
	var/str = (rand(1,2) + lvlgains * src.moden) + src.strength_bonus
	var/def = (rand(1,2) + lvlgains * src.moden) + src.defence_bonus


	pl = pl * (src.power_multi/5)
	ki = ki * (src.ki_multi/5)
	str = str * (src.strength_multi/5)
	def = def * (src.defence_multi/5)

	pl = round(pl*0.5)
	ki = round(ki*0.5)
	str = round(str*0.5)
	def = round(def*0.5)


	pl = round(pl/15)
	ki = round(ki/30)
//	kid = round(kid/30)
	str = round(str/30)
	def = round(def/30)


	if(src.smallshards)
		pl = round(pl*1.25)
		ki = round(ki*1.25)
//		kid = round(kid*1.25)
		str = round(str*1.25)
		def = round(def*1.25)
//		spd = round(spd*1.5)
//		stm = round(stm*1.5)

	if(src.largeshards)
		pl = round(pl*1.5)
		ki = round(ki*1.5)
//		kid = round(kid*1.5)
		str = round(str*1.5)
		def = round(def*1.5)
//		spd = round(spd*2)
//		stm = round(stm*2)

	if(src.greatshards)
		pl = round(pl*1.75)
		ki = round(ki*1.75)
//		kid = round(kid*1.75)
		str = round(str*1.75)
		def = round(def*1.75)


	if(src.massshards)
		pl = round(pl*2)
		ki = round(ki*2)
//		kid = round(kid*2)
		str = round(str*2)
		def = round(def*2)


	if(prob(pwrprob))
	//	if(stat == 1)
		if(prob(src.statc))
			if(pl <= 0)
				pl=rand(1,3)
			pl = round(pl+(pl*(src.statc*0.01)))
			src.powerlevel_max += pl
			if(src.training_on == 1)
				src << output("<font color = red>Powerlevel +[applycommas(pl)]","output2")
		else
			if(pl <= 0)
				pl=rand(1,3)
			src.powerlevel_max += pl
			if(src.training_on == 1)
				src << output("<font color = white>Powerlevel +[applycommas(pl)]","output2")

	if(prob(kiprob))
	//	if(stat == 2)
		if(prob(src.statc))
			if(ki <= 0)
				ki=rand(1,3)
			ki = round(ki+(ki*(src.statc*0.01)))
			src.ki_max += ki
			if(src.training_on == 1)
				src << output("<font color = red>Ki +[applycommas(ki)]","output2")
		else
			if(ki <= 0)
				ki=rand(1,3)
			src.ki_max += ki
			if(src.training_on == 1)
				src << output("<font color = white>Ki +[applycommas(ki)]","output2")

//	if(prob(kidprob))
//	//	if(stat == 3)
//		if(prob(src.statc))
//			if(kid <= 0)
//				kid=rand(1,3)
//			kid = round(kid+(kid*(src.statc*0.01)))
//			src.kidefense_max += kid
//			if(src.training_on == 1)
//				src << output("<font color = red>Ki Defense +[applycommas(kid)]","output2")
//		else
//			if(kid <= 0)
///				kid=rand(1,3)
//			src.kidefense_max += kid
//			if(src.training_on == 1)
//				src << output("<font color = white>Ki Defense +[applycommas(kid)]","output2")

	if(prob(strprob))
	//	if(stat == 4)
		if(prob(src.statc))
			if(str <= 0)
				str=rand(1,3)
			str = round(str+(str*(src.statc*0.01)))
			src.strength_max += str
			if(src.training_on == 1)
				src << output("<font color = red>Strength +[applycommas(str)]","output2")
		else
			if(str<=0)
				str=rand(1,3)
			src.strength_max += str
			if(src.training_on == 1)
				src << output("<font color = white>Strength +[applycommas(str)]","output2")

	if(prob(defprob))
	//	if(stat == 5)
		if(prob(src.statc))
			if(def <= 0)
				def=rand(1,3)
			def = round(def+(def*(src.statc*0.01)))
			src.defence_max += def
			if(src.training_on == 1)
				src << output("<font color = red>Defense +[applycommas(def)]","output2")
		else
			if(def<=0)
				def=rand(1,3)
			src.defence_max += def
			if(src.training_on == 1)
				src << output("<font color = white>Defense +[applycommas(def)]","output2")
/*
	if(prob(spdprob))
	//	if(stat == 6)
		if(prob(src.statc))
			if(spd <= 0)
				spd=rand(25,75)
			spd = round(spd+(spd*(src.statc*0.01)))
			src.speed_max += spd
			if(src.training_on == 1)
				src << output("<font color = red>Speed +[applycommas(spd)]","output2")
		else
			if(spd<=0)
				spd=rand(25,75)
			src.speed_max += spd
			if(src.training_on == 1)
				src << output("<font color = white>Speed +[applycommas(spd)]","output2")

	if(prob(stmprob))
	//	if(stat == 7)
		if(prob(src.statc))
			if(stm <= 0)
				stm=rand(25,75)
			stm = round(stm+(stm*(src.statc*0.01)))
			src.staminaleft_max += stm
			if(src.training_on == 1)
				src << output("<font color = red>Stamina +[applycommas(stm)]","output2")
		else
			src.staminaleft_max += stm
			if(src.training_on == 1)
				src << output("<font color = white>Stamina +[applycommas(stm)]","output2")
*/
	src.calcmaxpl()