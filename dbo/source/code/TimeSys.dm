var
	Emonth = "January"
	Esmonth = "jan"
	Etime = 20
	Eyear = 1
	Nmonth = "Enero"
	Nsmonth = "jan"
	Ntime = 10
	Nyear = 1
	Vmonth = "Mutsuki"
	Vsmonth = "jan"
	Vtime = 30
	Vyear = 1
	Ymonth = "Janvier"
	Ysmonth = "jan"
	Ytime = 15
	Yyear = 1

proc
//time loop procs
	TimeE()
		set background = 1
		if(!Eyear || Etime < 0)
			Emonth = "January"
			Esmonth = "jan"
			Etime = 20
			Eyear = 1
		while(1)
		{
			Etime--
			if(!Etime)
				MonE()
				Etime = 20
			sleep(600)
		}

	TimeN()
		set background = 1
		if(!Nyear || Ntime < 0)
			Nmonth = "Enero"
			Nsmonth = "jan"
			Ntime = 20
			Nyear = 1
		while(1)
		{
			Ntime--
			if(!Ntime)
				MonN()
				Ntime = 10
			sleep(600)
		}

	TimeV()
		set background = 1
		if(!Vyear || Vtime < 0)
			Vmonth = "Mutsuki"
			Vsmonth = "jan"
			Vtime = 20
			Vyear = 1
		while(1)
		{
			Vtime--
			if(!Vtime)
				MonV()
				Vtime = 30
			sleep(600)
		}

	TimeY()
		set background = 1
		if(!Yyear || Ytime < 0)
			Ymonth = "Janvier"
			Ysmonth = "jan"
			Ytime = 20
			Yyear = 1
		while(1)
		{
			Ytime--
			if(!Ytime)
				MonY()
				Ytime = 15
			sleep(600)
		}

//these switch the month
	MonE()
		switch(Emonth)
			if("January")
				Emonth = "February"
				Esmonth = "feb"
			if("February")
				Emonth = "March"
				Esmonth = "mar"
			if("March")
				Emonth = "April"
				Esmonth = "apr"
			if("April")
				Emonth = "May"
				Esmonth = "may"
			if("May")
				Emonth = "June"
				Esmonth = "jun"
			if("June")
				Emonth = "July"
				Esmonth = "jul"
			if("July")
				Emonth = "August"
				Esmonth = "aug"
			if("August")
				Emonth = "September"
				Esmonth = "sep"
			if("September")
				Emonth = "October"
				Esmonth = "oct"
			if("October")
				Emonth = "November"
				Esmonth = "nov"
			if("November")
				Emonth = "December"
				Esmonth = "dec"
			else
				Emonth = "January"
				Esmonth = "jan"
				YearE()

	MonN()
		switch(Nmonth)
			if("Enero")
				Nmonth = "Febrero"
				Nsmonth = "feb"
			if("Febrero")
				Nmonth = "Marzo"
				Nsmonth = "mar"
			if("Marzo")
				Nmonth = "Abril"
				Nsmonth = "apr"
			if("Abril")
				Nmonth = "Mayo"
				Nsmonth = "may"
			if("Mayo")
				Nmonth = "Junio"
				Nsmonth = "jun"
			if("Junio")
				Nmonth = "Julio"
				Nsmonth = "jul"
			if("Julio")
				Nmonth = "Agosto"
				Nsmonth = "aug"
			if("Agosto")
				Nmonth = "Septiembre"
				Nsmonth = "sep"
			if("Septiembre")
				Nmonth = "Octubre"
				Nsmonth = "oct"
			if("Octubre")
				Nmonth = "Noviembre"
				Nsmonth = "nov"
			if("Noviembre")
				Nmonth = "Diciembre"
				Nsmonth = "dec"
			else
				Nmonth = "Enero"
				Nsmonth = "jan"
				YearN()

	MonV()
		switch(Vmonth)
			if("Mutsuki")
				Vmonth = "Kisaragi"
				Vsmonth = "feb"
			if("Kisaragi")
				Vmonth = "Yayoi"
				Vsmonth = "mar"
			if("Yayoi")
				Vmonth = "Uzuki"
				Vsmonth = "apr"
			if("Uzuki")
				Vmonth = "Satsuki"
				Vsmonth = "may"
			if("Satsuki")
				Vmonth = "Minazuki"
				Vsmonth = "jun"
			if("Minazuki")
				Vmonth = "Fumizuki"
				Vsmonth = "jul"
			if("Fumizuki")
				Vmonth = "Hazuki"
				Vsmonth = "aug"
			if("Hazuki")
				Vmonth = "Nagatsuki"
				Vsmonth = "sep"
			if("Nagatsuki")
				Vmonth = "Kannazuki"
				Vsmonth = "oct"
			if("Kannazuki")
				Vmonth = "Shimotsuki"
				Vsmonth = "nov"
			if("Shimotsuki")
				Vmonth = "Shiwasu"
				Vsmonth = "dec"
			else
				Vmonth = "Mutsuki"
				Vsmonth = "jan"
				YearV()

	MonY()
		switch(Ymonth)
			if("Janvier")
				Ymonth = "Février"
				Ysmonth = "feb"
			if("Février")
				Ymonth = "Mars"
				Ysmonth = "mar"
			if("Mars")
				Ymonth = "Avril"
				Ysmonth = "apr"
			if("Avril")
				Ymonth = "Mai"
				Ysmonth = "may"
			if("Mai")
				Ymonth = "Juin"
				Ysmonth = "jun"
			if("Juin")
				Ymonth = "Juillet"
				Ysmonth = "jul"
			if("Juillet")
				Ymonth = "Août"
				Ysmonth = "aug"
			if("Août")
				Ymonth = "Septembre"
				Ysmonth = "sep"
			if("Septembre")
				Ymonth = "Octobre"
				Ysmonth = "oct"
			if("Octobre")
				Ymonth = "Novembre"
				Ysmonth = "nov"
			if("Novembre")
				Ymonth = "Décembre"
				Ysmonth = "dec"
			else
				Ymonth = "Janvier"
				Ysmonth = "jan"
				YearY()


//these are called once a 'Year', use them for stuff that happens on a new year :P
//(like dragonballs and stuff)
	YearE()
		Eyear++

	YearN()
		Nyear++

	YearV()
		Vyear++

	YearY()
		Yyear++

	getMonth(mob/M)
		if(M.z == 17)//Nvegeta time
			return Vmonth
		else if(M.z == 5 || M.z == 21)//Namek Time
			return Nmonth
		else if(M.z == 16 || (M.z == 22 && M.y < 74))//Yardrat Time
			return Ymonth
		else // Earth+other places time
			return Emonth

	getShortMon(mob/M)
		if(M.z == 17)//Nvegeta time
			return Vsmonth
		else if(M.z == 5 || M.z == 21)//Namek Time
			return Nsmonth
		else if(M.z == 16 || (M.z == 22 && M.y < 74))//Yardrat Time
			return Ysmonth
		else // Earth+other places time
			return Esmonth

	getYear(mob/M)
		if(M.z == 17)//Nvegeta time
			return Vyear
		else if(M.z == 5 || M.z == 21)//Namek Time
			return Nyear
		else if(M.z == 16 || (M.z == 22 && M.y < 74))//Yardrat Time
			return Yyear
		else //Earth+other places time
			return Eyear
