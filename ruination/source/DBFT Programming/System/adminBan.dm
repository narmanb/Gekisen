mob/System/Admin/Verbs/TrialGM/

	verb/BanFullban(mob/PC/M as mob in world)
		set desc="(player) Ban a player"
		set category = "Admin"
		if(M == src) return
		if(M.GMLevel > 0)
			src << "You can't ban an admin"
			M << "[src] tried to fullban you"
		// Note: Usually you would want to make sure that M!=src.
		//       Banning yourself is very embarrassing!
		//
		//       I haven't done it here so that you can try out banning yourself
		//       if you REALLY want to.

		if (alert(src,"Do you really want to ban [M]?","Really ban?","Ban","Cancel")=="Ban")
			crban_fullban(M)

	verb/BanIPrangeFB(range as text)
		set category = "Admin"
		var/banned=crban_iprange(range)

		if (banned)
			src << "Successfully banned IP range: [banned]"
		else
			src << "Not a valid IP range: [range]"

	verb/UnbanFB(key as text)
		set category = "Admin"
		set desc="(key) Unban the specified key"
		crban_unban(key)
/*
verb/BanNew(mob/M in world)
		set desc = "(person) Remove a player from your world and don't let them return"
		set category = "Admin"
		if(M == src) return
		if(!M.key)
			usr << "That is not a player."
			return
		var/hash = 0
		if(alert("Are you sure?","Ban [M]:","Yes","No") == "Yes")
			banned += M.key
			if(M.client)
				banned += M.client.address
				del(M.client)
			for(var/mob/O)
				O << "[src] banned [M]."
			world.log << "[src.name] banned [M] ([M.key]) from the world."
			del(M)
	verb/UnbanNew()
		set desc = "() Remove banned keys and IPs from the banned list"
		set category = "Admin"
		var/removal = input("Remove which IP/key from the ban list?","Unban:") as null|anything \
			in banned
		if(!removal) return
		banned -= removal
		for(var/mob/M)
			M << "[src] removed [removal] from the banned list."

*/




var/list/banned
world
	New()
		..()

		var/savefile/F = new ("s_admin.sav")
		F["banned"] >> banned
		if(isnull(banned))
			banned = new /list
	//	F["completelist"] >> completelist
//		if(isnull(completelist))
//			completelist = new /list
	Del()
		var/savefile/F = new ("s_admin.sav")
	//	F["completelist"] << completelist
		F["banned"] << banned
//		F["Bad GM"] << Bad_GM <--- bye
