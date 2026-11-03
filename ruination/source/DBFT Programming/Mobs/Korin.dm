mob/var/beans = 1
mob/NPC/Korin
	icon_state = "Korin"
	name = "Korin"
	density = 1
	safe = 1
	frozen = 1
	it_blocked=0
	energy_code = 5564321
	New()
		..()
		if(src.z==8)
			src.energy_code=0
		src.CreateName()
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.playerwatch==1)
			PlayerWatch(usr,"Talked to Korin")
		if(usr.talking)
			return
		spawn(30)usr.talking=0
		usr.talking = 1
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		if(usr.beans < 1)
			usr << "<font color = white>Korin:</white> Hey [usr.name], I think this may help you in your training!"
			sleep(25)
			usr << "<font color = #0066FF>Korin puts a Senzu Bean in your hand."
			sleep(25)
			usr << "<font color = white>Korin:</white> Come back later, I may have more for you."
			usr.contents += new/obj/Equipment/Consumable/Senzu
			usr.inven_min ++
			usr.beans --
			usr.talking = 0
			sleep(1200)
			if(!usr)return
			usr.beans = 1
			return
		else
			usr << "<font color = white>Korin:</white> Hey [usr.name], how is your training going?"
			usr.talking = 0
			return
	verb/Buy_Bean()
		set category = null
		set src in oview(1)
		if(usr.CheckInventory()==TRUE)
			usr.talking=0
			return
		var/bcost = 10000
		if(usr.talking)
			return
		usr.talking = 1
		var/x=input("How many Beans did you want") as num
		if ((usr.inven_min+x)>usr.inven_max)
			usr<<"Thats too many beans"
			usr.talking=0
			return
		if(usr.zenni < (bcost * x))
			usr.talking=0
			return

		if(usr.zenni >= (bcost*x))
			if((usr.inven_min + x) < usr.inven_max)
				for(var/y in 1 to x)
					usr.contents += new/obj/Equipment/Consumable/Senzu
					usr.CheckInventory()
				usr << "<font color = #0066FF>Korin puts [x] Senzu Beans in your hand."
				sleep(15)
				if(usr.zenni < (bcost*x))return
				if(!usr)return
				usr << "<font color = white>Korin:</white> Come back later, I may have more for you."
				usr.zenni -= (bcost*x)
				usr.talking = 0
				return
			else
				usr << "<font color = white>Korin:</white> You dont have enough room."
				usr.talking = 0
				return
		else
			usr << "<font color = white>Korin:</white> You need [applycommas(bcost*x)] zenni."
			usr.talking = 0
			return