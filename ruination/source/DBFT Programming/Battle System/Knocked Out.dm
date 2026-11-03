mob/var/KO = 0
mob/proc
	KO(mob/M)
		if(!M)
			return
		if(M.powerlevel <= 0)
			if(!M.KO)
				view() << output("<b><font color = red>[M.name] has been knocked out!","default.output2")
				M.icon_state = null
				M.KO = 1
				M.frozen = 1
				M.sight |= BLIND
				M.boxing = 0
				M.focus_boxing = 0
				M.train = 0
				M.ftrain = 0
				M.dualtrain = 0
				M.icon_state = ""
				if(M.kaioken)
					M.overlays -= M.kaioaura
					M.kaioken = 0
				if(M.hudenabled)
					spawn() M.updateHealth()
					spawn() M.updateki()
				//var/randcolor = pick("Invert", "Greyscale", "Sepia", "Black & White")
		//		var/randcolor = pick("Invert", "BGR", "Greyscale", "Polaroid", "GRB", "RBG", "BRG", "GBR")
		//	view() << "color = [randcolor]"
				//var/ColorMatrix/c = new("[randcolor]")
				var/ColorMatrix/c = new("Greyscale")
				animate(M, color = c.matrix, time = 10)




			//	M.Power_Redefine()
				sleep(150)
				if(M)
					M.KO = 0
					M.frozen = 0
					M.sight &= ~BLIND
					M.doing = 0
					M.powerlevel = 1+(M.powerlevel_max/100)
					view(10,M) << output("<b><font color = green>[M] regains consciousness!","default.output2")
					animate(M, color = null, alpha = 255, time = 20)
					if(M.hudenabled)
						spawn() M.updateHealth()
						spawn() M.updateki()
					return
		else
			return
	Tired_KO()
		if(src.staminaleft >= src.staminaleft_max)
			src.staminaleft = src.staminaleft_max
			view(8) << output("<b><font color = red>[src.name] has been knocked out from exhaustion!","default.output2")
			if(!src.color)
				var/randcolor = pick("Greyscale", "Sepia", "Black & White")

				var/ColorMatrix/c = new("[randcolor]")
				animate(src, color = c.matrix, alpha = 100, time = 5)
			src.KO = 1
			src.frozen = 1
			if(src.kaioken)
				src.overlays -= src.kaioaura
				src.kaioken = 0
		//	src.overlays -= 'Kaio Aura.dmi'
		//	src.kaioken = 0
		//	src.Power_Redefine()	zz
			src.sight |= BLIND
			src.boxing = 0
			src.focus_boxing = 0
			src.train = 0
			src.dualtrain = 0
			src.icon_state = ""
			sleep(50)
			src.KO = 0
			src.ftrain = 0
			src.train = 0
			src.frozen = 0
			src.sight &= ~BLIND
			//src << "You wake up!"
			view(10) << output("<b><font color = green>[src.name] regains consciousness!","default.output2")
			if(src.hudenabled)
				spawn() src.updateHealth()
				spawn() src.updateki()
			animate(src, color = null, alpha = 255, time = 5)
			return
		else
			return