
/*
mob/PC/verb/AFK_Check()
	set category = "Admin"
	/*if(usr.opendialog==1)
		usr<<"You currently have a dialog open, please finish it before continuing"
		return
	usr.opendialog=1*/
	var/list/Rivals=new/list()
	for(var/mob/PC/N in player)
		if(N.train)
			Rivals.Add(N)
	Rivals.Add("Cancel")
	var/mob/M=input("AFK Check on who?")in Rivals
	if(M=="Cancel")
	//	usr.opendialog=1
		return
	if(!M)
	//	usr.opendialog=1
		return

	if(istype(M,/mob/PC))

	//	usr.challenge = 1
		AdminMessage("[usr] is AFK Checking [M]")
		var/obj/AFKcheck/C=new
		C.afkcheck=M
		C.CheckAFK(M)
	//	usr.opendialog=1
	*/


obj
	AFKcheck
		var/timeafk=30
		var/mob/afkcheck
		New()
			..()
			spawn while(1)
				timeafk-=1
				if(timeafk<=0)
					AdminMessage("[afkcheck] <font color = red> failed</font> AFK Check")
					spawn(-1) afkcheck.UnTraining()
					afkcheck.train = 0
					afkcheck.position = 0
					afkcheck.doing = 0
					afkcheck.frozen = 0
					afkcheck.sscorrect=0
					afkcheck.zpsparcount = 0
					//ssexp=1
					afkcheck.icon_state = ""
					afkcheck.amount=1
					afkcheck.client.images = null
					afkcheck.waiting1 = 0
					winset(afkcheck, "default", "macro = macro1");
					sleep(10)
					del(src)
				sleep(10)
		proc
			CheckAFK(mob/A)
				switch(alert(A,"AFK Check: You have 30 seconds to confirm you are not AFK","AFK Check","Not AFK"))
					if("Not AFK")
						AdminMessage("[A] is not AFK")
						del(src)


obj
	AFKcheck2
		var/timeafk=30
		var/mob/afkcheck
		New()
			..()
			spawn while(1)
				timeafk-=1
				if(timeafk<=0)
					AdminMessage("[afkcheck] <font color = red> failed</font> AFK Check")
					spawn(-1) afkcheck.UnTraining()
					afkcheck.train = 0
					afkcheck.position = 0
					afkcheck.doing = 0
					afkcheck.frozen = 0
					afkcheck.sscorrect=0
					afkcheck.zpsparcount = 0
					//ssexp=1
					afkcheck.icon_state = ""
					afkcheck.amount=1
					afkcheck.client.images = null
					afkcheck.waiting1 = 0
					winset(afkcheck, "default", "macro = macro1");
					sleep(10)
					del(src)
				sleep(10)
		proc
			CheckAFK2(mob/A)
				var/randnum = rand(1000,9999)

				var/afkcheck=input("AFK Check input numbers to pass the test. Number: [randnum]")as num
				if(afkcheck==randnum)
					AdminMessage("[A] is not AFK")
					del(src)
				else
					AdminMessage("[A] input the wrong numbers right numbers: [randnum] input: [afkcheck]")
					src.CheckAFK2(A)

			//	switch(alert(A,"AFK Check: You have 30 seconds to confirm you are not AFK","AFK Check","Not AFK"))
			//		if("Not AFK")
			//			AdminMessage("[A] is not AFK")
			//			del(src)