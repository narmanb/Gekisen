mob/var/tmp/energy_barrier = 0
mob/var/energy_barrier_strength = 0
mob/var/energy_barrier_learn = 0
mob/var/tmp/energy_barrier_delay = 0
mob/var/tmp/energy_barrier_health=0
//mob/var/ki_shield_on = 'Ki Shield.dmi'
//mob/var/ki_shield_on = 'newkishield.dmi'
mob/var/energy_barrier_on = 'EnergyBarrier.dmi'
obj/Technique/EnergyBarrier
	verb/Energy_Barrier()
		set category = "Techniques"
	//	return
		var/cost = 225
		if(usr.playerwatch==1)
			PlayerWatch(usr,"EnergyBarrier")
		if(techs_on==0)
			usr<<"Techniques have currently been disabled"
			return
		if(usr.doing == 1)
			usr << "You are already doing something!"
			return

		if(usr.buku == 1)
			return

		if(usr.dead == 1)
			return
		if(usr.ki_shield||usr.kiabsorb)
			usr << "You cannot use this technique while using Ki Shield or Ki Absorb"
			return
		if(usr.ki_lock == 1)
			usr << "Cannot use this Technique at his time"
			return
		if(usr.energy_barrier_delay)
			usr << "You must wait to use this again"
			return
//		if(((0.1+usr.staminaleft)/usr.staminaleft_max)*100>=100)
//			usr << "You are too tired to use this technique!"
//			return
	//	if(usr.staminaleft<cost)
	//		usr<<"You don't have enough ki!"
	//		return
		if(usr.staminaleft+cost>=usr.staminaleft_max)
			usr << output("<font color=#ff0000>You are too tired to create an energy barrier</font>","output2")
			return
		if(usr.energy_barrier == 0)
			usr << "You create an energy barrier around your body, it should absorb any incoming attacks but won't stay up for long!"
			usr.overlays += usr.energy_barrier_on
			usr.staminaleft+=cost
			usr.energy_barrier = 1
			usr.move_delay=1.6
			usr.energy_barrier_delay=1
			usr.energy_barrier_health = usr.powerlevel_max*2
			spawn() usr.EnergyBarrierManagement()//usr.energy_barrier_delay = 0
			//usr.ki_shield_strength = ((usr.kidefense * usr.ki_control)/ 100)
			//usr.Ki_Cost()
			//usr.kishielddrain()
	//	else
	//		usr << "You stop using your Ki as a Shield"
	//		usr.overlays -= usr.energy_barrier_on
	//		usr.energy_barrier = 0
	//		usr.ki_shield_strength = 0
	//		usr.ki_shield_delay=1
	//		spawn(60) usr.ki_shield_delay = 0

mob/proc
	EnergyBarrierManagement()
		spawn(120) src.energy_barrier = 0
		while(src.energy_barrier)
			//src << "barrier health [applycommas(src.energy_barrier_health)] [round(((0.01+src.energy_barrier_health)/src.powerlevel_max)*100)]%"
			sleep(2)
		src << "<b><font color = green>Your energy barrier broke!"
		src.overlays -= src.energy_barrier_on
		src.move_delay=0.8
		src.energy_barrier=0
		spawn(300) src.energy_barrier_delay = 0
/*		src


mob/proc
	kishielddrain(V as num)
		//var/drain=V  [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%"
		V = 5
		var/drain=0
		while(((0.1+src.staminaleft)/src.staminaleft_max)*100<100&&src.ki_shield)
			var/randdrain = rand(1,4)
			if(randdrain == 1)
				drain = 0.02
			if(randdrain == 2)
				drain = 0.04
			if(randdrain == 2)
				drain = 0.05
			if(randdrain == 2)
				drain = 0.06
			src.staminaleft+=rand(3,6)
			src.staminaleft+=src.staminaleft_max*drain
			src << output("<font size = 1><font color = purple><b>Ki Shield</b><i> Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")
			sleep(45)


		if(((0.1+src.staminaleft)/src.staminaleft_max)*100>=100 || src.ki_shield == 0)
		//if(src.staminaleft > src.staminaleft_max)
			//src << "You are no longer using ki shield!"
			src.ki_shield=0
			src.overlays -= src.ki_shield_on
			src.ki_shield_delay=1
			spawn(60) src.ki_shield_delay = 0

			*/
/*
OLD KI SHIELD COST
mo

	proc/Ki_Cost()
		set background = 1
		var/ki_cost = round(usr.ki_max / 10)

		if(ki_cost <= 0)
			ki_cost = 1

		if(usr.ki_shield_strength <= 0)
			usr.ki_shield_strength = 0

		if(usr.ki_shield == 1)
			if(usr.ki_shield_strength >= 1)
				if(usr.ki >= ki_cost)
					usr.ki -= ki_cost
					spawn(50) usr.Ki_Cost()
				else
					usr << "You do not have enough Ki to sustain the Ki Shield"
					usr.overlays -= usr.ki_shield_on
					usr.ki_shield = 0
					usr.ki_shield_strength = 0
					return
			else
				usr << "Your Ki Shield has broken!"
				usr.overlays -= usr.ki_shield_on
				usr.ki_shield = 0
				usr.ki_shield_strength = 0
				return
		else
			return


			*/