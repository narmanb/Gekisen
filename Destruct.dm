mob/SelfDestruct/verb/SelfDestruct()
	set category="Fighting"
	set name ="Self Destruct"
	if(!usr.nopk)
		if(usr.kame)
			usr<<"You are firing something already."
		if(!usr.kame && usr.move&&usr.dead==0&&usr.nopk==0)
			usr.icon_state="ssj"
			usr.move=0
			usr.kame=1
			view(6)<<"[usr] locks himself into an uncontrollable rage of power."
			usr.underlays=0
			if(usr.auratype==0)
				var/aura = 'whiteaura.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==1)
				var/aura = 'whiteaura2.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==2)
				var/aura = 'whiteaura3.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==3)
				var/aura = 'whiteaura4.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			if(usr.auratype==4)
				var/aura = 'whiteaura6.dmi'
				aura += rgb(usr.customred,usr.customgreen,usr.customblue)
				usr.underlays += aura
			usr.auraon=1
			sleep(50)
			var/obj/DestructionAura/F = new ()
			var/obj/DestructionAura/G = new ()
			var/obj/DestructionAura/H = new ()
			var/obj/DestructionAura/I = new ()
			var/obj/DestructionAura/J = new ()
			var/obj/DestructionAura/L = new ()
			var/obj/DestructionAura/A = new ()
			var/obj/DestructionAura/B = new ()
			var/obj/DestructionAura/M2 = new ()
			var/obj/DestructionAura/N = new ()
			var/obj/DestructionAura/O = new ()
			var/obj/DestructionAura/P = new ()
			var/obj/DestructionAura/D = new ()
			var/obj/DestructionAura/E = new ()
			var/obj/DestructionAura/C = new ()
			var/obj/DestructionAura/K = new ()
			var/obj/DestructionAura/Q = new ()
			var/obj/DestructionAura/R = new ()
			var/obj/DestructionAura/S = new ()
			var/obj/DestructionAura/T2 = new ()
			var/obj/DestructionAura/W = new ()
			var/obj/DAUpperRight/X = new ()
			var/obj/DABottomLeft/Y = new ()
			var/obj/DAUpperLeft/Z = new ()
			var/obj/DestructionAura/AB = new ()
			var/obj/DestructionAura/AC = new ()
			var/obj/DestructionAura/AD = new ()
			var/obj/DestructionAura/AE = new ()
			var/obj/DestructionAura/AF = new ()
			var/obj/DestructionAura/AG = new ()
			var/obj/DestructionAura/AH = new ()
			var/obj/DestructionAura/AI = new ()
			var/obj/DestructionAura/AJ = new ()
			var/obj/DestructionAura/AK = new ()
			var/obj/DestructionAura/AL = new ()
			var/obj/DestructionAura/AM = new ()
			var/obj/DestructionAura/AN = new ()
			var/obj/DestructionAura/AO = new ()
			var/obj/DestructionAura/AP = new ()
			var/obj/DestructionAura/AQ = new ()
			var/obj/DestructionAura/AR = new ()
			var/obj/DestructionAura/AS = new ()
			var/obj/DestructionAura/AT = new ()
			var/obj/DestructionAura/AU = new ()
			var/obj/DestructionAura/AV = new ()
			var/obj/DestructionAura/AW = new ()
			var/obj/DestructionAura/AX= new ()
			var/obj/DestructionAura/AY = new ()
			var/obj/DABottomRight/AZ = new ()
			K.loc = locate(usr.x,usr.y,usr.z)
			A.loc = locate(usr.x+1,usr.y,usr.z)
			C.loc = locate(usr.x-1,usr.y,usr.z)
			B.loc = locate(usr.x,usr.y+1,usr.z)
			D.loc = locate(usr.x,usr.y-1,usr.z)
			E.loc = locate(usr.x+1,usr.y+1,usr.z)
			F.loc = locate(usr.x-1,usr.y-1,usr.z)
			G.loc = locate(usr.x-1,usr.y+1,usr.z)
			H.loc = locate(usr.x+1,usr.y-1,usr.z)
			I.loc = locate(usr.x+2,usr.y,usr.z)
			J.loc = locate(usr.x-2,usr.y,usr.z)
			L.loc = locate(usr.x,usr.y+2,usr.z)
			M2.loc = locate(usr.x,usr.y-2,usr.z)
			N.loc = locate(usr.x+2,usr.y+2,usr.z)
			O.loc = locate(usr.x-2,usr.y-2,usr.z)
			P.loc = locate(usr.x-2,usr.y+2,usr.z)
			Q.loc = locate(usr.x+2,usr.y-2,usr.z)
			R.loc = locate(usr.x+3,usr.y,usr.z)
			S.loc = locate(usr.x-3,usr.y,usr.z)
			T2.loc = locate(usr.x,usr.y+3,usr.z)
			W.loc = locate(usr.x,usr.y-3,usr.z)
			X.loc = locate(usr.x+3,usr.y+3,usr.z)
			Y.loc = locate(usr.x-3,usr.y-3,usr.z)
			Z.loc = locate(usr.x-3,usr.y+3,usr.z)
			AB.loc = locate(usr.x-3,usr.y-2,usr.z)
			AC.loc = locate(usr.x+3,usr.y+2,usr.z)
			AD.loc = locate(usr.x+3,usr.y-2,usr.z)
			AE.loc = locate(usr.x-3,usr.y+2,usr.z)
			AF.loc = locate(usr.x+2,usr.y+3,usr.z)
			AG.loc = locate(usr.x-2,usr.y-3,usr.z)
			AH.loc = locate(usr.x-2,usr.y+3,usr.z)
			AI.loc = locate(usr.x+2,usr.y-3,usr.z)
			AJ.loc = locate(usr.x-1,usr.y-2,usr.z)
			AK.loc = locate(usr.x+1,usr.y+2,usr.z)
			AL.loc = locate(usr.x+1,usr.y-2,usr.z)
			AM.loc = locate(usr.x-1,usr.y+2,usr.z)
			AN.loc = locate(usr.x+2,usr.y+1,usr.z)
			AO.loc = locate(usr.x-2,usr.y-1,usr.z)
			AP.loc = locate(usr.x-2,usr.y+1,usr.z)
			AQ.loc = locate(usr.x+2,usr.y-1,usr.z)
			AR.loc = locate(usr.x-1,usr.y-3,usr.z)
			AS.loc = locate(usr.x+1,usr.y+3,usr.z)
			AT.loc = locate(usr.x+1,usr.y-3,usr.z)
			AU.loc = locate(usr.x-1,usr.y+3,usr.z)
			AV.loc = locate(usr.x+3,usr.y+1,usr.z)
			AW.loc = locate(usr.x-3,usr.y-1,usr.z)
			AX.loc = locate(usr.x-3,usr.y+1,usr.z)
			AY.loc = locate(usr.x+3,usr.y-1,usr.z)
			AZ.loc = locate(usr.x+3,usr.y-3,usr.z)
			for(var/mob/M in view(3,usr))
				if(M&&M.client)
					var/SX = new /mob/smoke(M.loc)
					flick("smoke",SX)
					spawn()
						sleep(50)
						del(SX)
					var/damage=(usr.powerlevel/M.powerlevel)*100
					M.hp-=damage
					if(M.hp<=0)
						spawn()M.Die()
			sleep(35)
			usr.icon_state=null
			usr.move=1
			usr.kame=0
			usr.underlays=0
			del(K)
			del(A)
			del(B)
			del(C)
			del(D)
			del(E)
			del(F)
			del(G)
			del(H)
			del(I)
			del(J)
			del(L)
			del(M2)
			del(N)
			del(O)
			del(P)
			del(Q)
			del(R)
			del(S)
			del(T2)
			del(W)
			del(X)
			del(Y)
			del(Z)
			del(AB)
			del(AC)
			del(AD)
			del(AE)
			del(AF)
			del(AG)
			del(AH)
			del(AI)
			del(AJ)
			del(AK)
			del(AL)
			del(AM)
			del(AN)
			del(AO)
			del(AP)
			del(AQ)
			del(AR)
			del(AS)
			del(AT)
			del(AU)
			del(AV)
			del(AW)
			del(AX)
			del(AY)
			del(AZ)
obj
	DestructionAura
		icon='selfdestruct.dmi'
		icon_state="centerarea"
		density=0
		layer=MOB_LAYER+3
		New()
			spawn(100)
				del(src)
			..()
	DAUpperRight
		icon='selfdestruct.dmi'
		icon_state="upperright"
		density=0
		layer=MOB_LAYER+3
		New()
			spawn(100)
				del(src)
			..()
	DAUpperLeft
		icon='selfdestruct.dmi'
		icon_state="upperleft"
		density=0
		layer=MOB_LAYER+3
		New()
			spawn(100)
				del(src)
			..()
	DABottomLeft
		icon='selfdestruct.dmi'
		icon_state="bottomleft"
		density=0
		layer=MOB_LAYER+3
		New()
			spawn(100)
				del(src)
			..()
	DABottomRight
		icon='selfdestruct.dmi'
		icon_state="bottomright"
		density=0
		layer=MOB_LAYER+3
		New()
			spawn(100)
				del(src)
			..()