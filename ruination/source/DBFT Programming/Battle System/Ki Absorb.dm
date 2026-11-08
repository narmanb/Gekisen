mob/var/absorbing = 0
mob/var/tmp/ki_absorb_delay = 0
obj/Technique/KiAbsorb

	verb
		Ki_Absorb()
			set category = "Techniques"
			set name = "KiAbsorb"
			if(usr.playerwatch==1)
				PlayerWatch(usr,"Ki Absorb")
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
			if(usr.ki_shield||usr.energy_barrier)
				usr << "You cannot use this technique while using Ki Shield or Energy Barrier"
				return
			if(usr.ki_lock == 1)
				usr << "Cannot use this Technique at his time"
				return
			if(usr.ki_absorb_delay)
				usr << "You must wait to use this again"
				return
			if(((0.1+usr.staminaleft)/usr.staminaleft_max)*100>=100)
				usr << "You are too tired to use this technique!"
				return

			if(usr.kiabsorb == 0)
				usr << "You focus your energy, you will now absorb ki from being damaged"
				usr.kiabsorb = 1
				usr.ki_absorb_delay=1
				spawn(60) usr.ki_absorb_delay = 0
				//usr.ki_shield_strength = ((usr.kidefense * usr.ki_control)/ 100)
				//usr.Ki_Cost()
				usr.kiabsorbdrain()
			else
				usr << "You stop absorbing ki"

				usr.kiabsorb = 0
				usr.ki_absorb_delay = 1
				spawn(60) usr.ki_shield_delay = 0






mob/proc
	kiabsorbdrain()
		//var/drain=V  [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%"
		//V = 5
		var/drain=0
		while(((0.1+src.staminaleft)/src.staminaleft_max)*100<100&&src.kiabsorb)
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
			src << output("<font size = 1><font color = purple><b>Ki Absorb</b><i> Fatigue: [round(((0.1+src.staminaleft)/src.staminaleft_max)*100)]%","output2")
			sleep(40)


		if(((0.1+src.staminaleft)/src.staminaleft_max)*100>=100 || src.kiabsorb == 0)
		//if(src.staminaleft > src.staminaleft_max)
			//src << "You are no longer using ki shield!"
			src.kiabsorb=0

			src.ki_absorb_delay=1
			spawn(60) src.ki_absorb_delay = 0