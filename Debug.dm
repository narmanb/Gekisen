
#define SPACES					"&nbsp;&nbsp;&nbsp;&nbsp;"

// Debugger release stuff
var/deadron/Debugger/dd_debugger
world/New()
	..()
	dd_debugger = new()
	sleep(100)
//	spawn()LoadBanlist()
	spawn()Worldloop()
	spawn()Destructionloop()
	spawn()Rebootloop()
//	spawn()dateloop()
	spawn()DragonballLoop()
	spawn()CdChecker()
	//spawn(500)CheckCpuUsage()
	return ..()
world/proc/Rebootloop()
	sleep(432000)
	world<<"<b><font color = red>The Server has been up for 12 hours in a row, so an automated reboot will occur to prevent a crash.<b></font>"
	world.Reboot()
world/proc/CheckCpuUsage()
	while(world.cpu<80)
		sleep(20)
//	WorldClean()
//	sleep(100)
	if(world.cpu>=80)
		world.Del()
	else
		spawn()CheckCpuUsage()
world/proc/Destructionloop()
	set background = 1
	for(var/obj/Destructable/X in world)
		if(X.destructable==0)
			X.icon_state=X.oldstate
			X.destructable=1
			X.density=1
	for(var/obj/BigCrater/O in world)
		del(O)
	sleep(10000)
	spawn()Destructionloop()
world/proc/WorldClean()
	set background = 1
	for(var/obj/O in world)
		spawn()
			if(istype(O,/obj/DestructionAura))
				del(O)
			if(istype(O,/obj/DABottomLeft))
				del(O)
			if(istype(O,/obj/DABottomRight))
				del(O)
			if(istype(O,/obj/DAUpperLeft))
				del(O)
			if(istype(O,/obj/DAUpperRight))
				del(O)
			if(istype(O,/obj/dan_projectile))
				del(O)
			if(istype(O,/obj/spl_projectile))
				del(O)
			if(istype(O,/obj/BigCrater))
				del(O)
			if(istype(O,/obj/Crater))
				del(O)
			if(istype(O,/obj/Chouproj))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/GalekGun))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/Gdonut))
				del(O)
			if(istype(O,/obj/Kikho))
				del(O)
			if(istype(O,/obj/Kiblast))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/SpecialBeamCannon))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/Tsuihikidan))
				del(O)
			if(istype(O,/obj/assim))
				del(O)
			if(istype(O,/obj/choutrail))
				del(O)
			if(istype(O,/obj/choutrail2))
				del(O)
			if(istype(O,/obj/kien))
				del(O)
			if(istype(O,/obj/kitrail||istype(O,/obj/kitrail2)||istype(O,/obj/kitrail3)||istype(O,/obj/kitrail4)||istype(O,/obj/kitrail5)||istype(O,/obj/kitrail6)||istype(O,/obj/kitrail7)||istype(O,/obj/kitrail8)))
				del(O)
			if(istype(O,/obj/kshoot))
				del(O)
			if(istype(O,/obj/ray))
				del(O)
			if(istype(O,/obj/sbomb))
				del(O)
			if(istype(O,/obj/sbombprojectile))
				del(O)
			if(istype(O,/mob/smoke))
				del(O)
	for(var/mob/O in world)
		spawn()
			if(istype(O,/mob/monsters))
				del(O)
		//	if(istype(O,/mob/characters))
		//		if(!O.client&&!O.npc)
		//			del(O)
	sleep(1)
world/proc/Worldloop()
	set background = 1
	for(var/mob/characters/X in world)
		if(X.key=="Masterdan")
			X<<"World Refreshing"
	for(var/obj/O in world)
		spawn()
			if(istype(O,/obj/gutb))
				del(O)
			if(istype(O,/obj/dan_projectile))
				del(O)
			if(istype(O,/obj/spl_projectile))
				del(O)
			if(istype(O,/obj/Crater))
				del(O)
			if(istype(O,/obj/Chouproj))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/GalekGun))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/Gdonut))
				del(O)
			if(istype(O,/obj/Kikho))
				del(O)
			if(istype(O,/obj/Kiblast))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/SpecialBeamCannon))
				del(O)
			if(istype(O,/obj/FinalFlash))
				del(O)
			if(istype(O,/obj/Tsuihikidan))
				del(O)
			if(istype(O,/obj/assim))
				del(O)
			if(istype(O,/obj/choutrail))
				del(O)
			if(istype(O,/obj/choutrail2))
				del(O)
			if(istype(O,/obj/kien))
				del(O)
			if(istype(O,/obj/kitrail||istype(O,/obj/kitrail2)||istype(O,/obj/kitrail3)||istype(O,/obj/kitrail4)||istype(O,/obj/kitrail5)||istype(O,/obj/kitrail6)||istype(O,/obj/kitrail7)||istype(O,/obj/kitrail8)))
				del(O)
			if(istype(O,/obj/kshoot))
				del(O)
			if(istype(O,/obj/ray))
				del(O)
			if(istype(O,/obj/sbomb))
				del(O)
			if(istype(O,/obj/sbombprojectile))
				del(O)
			if(istype(O,/mob/smoke))
				del(O)
		sleep(1000)
	for(var/mob/O in world)
		spawn()
			if(istype(O,/mob/monsters)&&!(istype(O,/mob/monsters/freerange))&&!(istype(O,/mob/monsters/people)))
				var/counter=0
				for(var/mob/characters/X in oview(7,O))
					if(X.client)
						counter+=1
				if(counter==0)
					del(O)
			if(istype(O,/mob/characters))
				if(!O.client&&!O.npc)
					del(O)
		sleep(1)
	sleep(500)
	spawn()Worldloop()
deadron/Debugger
	var
		list/extraControlPanelObjects			// Objects you want to add to the list that show up in ControlPanel().
												// Can be passed in new().

	Topic(T)
		var/O = locate(T)
		if (O)
			Debug(O)
			return

		var/list/commands = dd_text2list(T, ":")
		switch(commands[1])
			if ("control_panel")
				ControlPanel()
				return

			if ("savefile")
				var/savefile/F = new(commands[2])
				DebugSavefile(F, commands[3])
				return

			if ("mobs")
				var/all_mobs = 0
				switch(commands[2])
					if ("view")
						DebugMobs(all_mobs)
					if ("all")
						all_mobs = 1
						DebugMobs(all_mobs)
				return

			if ("objs")
				var/all_objs = 0
				switch(commands[2])
					if ("view")
						DebugObjs(all_objs)
					if ("all")
						all_objs = 1
						DebugObjs(all_objs)
				return

			if ("areas")
				DebugAreas()

			if ("turfs")
				DebugTurfs()
		return

	New(controlPanelObjects)
		extraControlPanelObjects = new()
		if (controlPanelObjects)
			extraControlPanelObjects += controlPanelObjects
		return ..()

	proc
		ControlPanel()
			var/page = "<H2>Debug: Var Viewer</H2>"
			page += "Pick an object to examine.<BR><BR>"

			page += "<table border=1 cellpadding=3>"

			page += "<tr>"
			page += "<td><a href=\"byond://#\ref[src]\ref[usr]\">[usr]</a></td>"
			page += "<td>&nbsp;</td>"
			page += "</tr>"

			page += "<tr>"
			var/area/area
			var/usr_loc = usr.loc
			if (usr_loc)
				area = usr.loc:loc
				page += "<td><a href=\"byond://#\ref[src]\ref[area]\">my area</a></td>"
			else
				page += "<td>&nbsp;</td>"

			page += "<td><a href=\"byond://#\ref[src]areas\">all areas</a></td>"
			page += "</tr>"

			if (world.maxx)
				// Only show turf options if there is a map.
				page += "<tr>"
				page += "<td><a href=\"byond://#\ref[src]\ref[usr.loc]\">my turf</a></td>"
				page += "<td><a href=\"byond://#\ref[src]turfs\">turfs in view</a></td>"
				page += "</tr>"

			page += "<tr>"
			page += "<td><a href=\"byond://#\ref[src]mobs:view\">mobs in view</a></td>"
			page += "<td><a href=\"byond://#\ref[src]mobs:all\">all mobs</a></td>"
			page += "</tr>"

			page += "<tr>"
			page += "<td><a href=\"byond://#\ref[src]objs:view\">objs in view</a></td>"
			page += "<td><a href=\"byond://#\ref[src]objs:all\">all objs</a></td>"
			page += "</tr>"
			page += "</table>"

			if (extraControlPanelObjects.len)
				page += "<br><br><br>"
				page += "<table border=1 cellpadding=3>"
				page += "<tr><th>Extra objects</th></tr>"
				var/current
				for (current in extraControlPanelObjects)
					page += "<tr><td><a href=\"byond://#\ref[src]\ref[current]\">[current]</a></td></tr>"
				page += "</table>"
			Browse(page)

		origControlPanel()
			var/page = "<H2>Deadron's Deft Debugger</H2>"
			page += "Pick an object to examine.<BR><BR>"

			var/area/area
			var/usr_loc = usr.loc
			if (usr_loc)
				area = usr.loc:loc
				page += "<a href=\"byond://#\ref[src]\ref[area]\">my area</a> | "

			page += "<a href=\"byond://#\ref[src]areas\">all areas</a><BR>"

			if (world.maxx)
				// Only show turf options if there is a map.
				page += "<a href=\"byond://#\ref[src]\ref[usr.loc]\">my turf</a> | "
				page += "<a href=\"byond://#\ref[src]turfs\">turfs in view</a><BR>"

			page += "<a href=\"byond://#\ref[src]\ref[usr]\">[usr]</a> | "
			page += "<a href=\"byond://#\ref[src]mobs:view\">mobs in view</a> | "
			page += "<a href=\"byond://#\ref[src]mobs:all\">all mobs</a><BR>"

			page += "<a href=\"byond://#\ref[src]objs:view\">objs in view</a> | "
			page += "<a href=\"byond://#\ref[src]objs:all\">all objs</a><BR><BR>"

			var/current
			for (current in extraControlPanelObjects)
				page += "<a href=\"byond://#\ref[src]\ref[current]\">[current]</a><BR>"
			Browse(page)

		Browse(page)
			usr << browse(page)
			// NOW: Have to add navigation.
//			usr << browse(page, "window=debug;size=300x300")

		DebugMobs(all_mobs = 0)
			var/page = "<a href=\"byond://#\ref[src]control_panel\">\[Debugger control panel]</a><BR><BR>"
			var/mob/M
			if (all_mobs)
				page += "<strong>Mobs in world:</strong><BR>"
				for (M in world)
					page += "<a href=\"byond://#\ref[src]\ref[M]\">[M]</a><BR>"
			else
				page += "<strong>Mobs in view:</strong><BR>"
				for (M in view(usr))
					page += "<a href=\"byond://#\ref[src]\ref[M]\">[M]</a><BR>"
			Browse(page)

		DebugObjs(all_objs = 0)
			var/page
			var/obj/O
			if (all_objs)
				page += "<strong>Objs in world:</strong><BR>"
				for (O in world)
					page += "<a href=\"byond://#\ref[src]\ref[O]\">[O.type]: [O]</a><BR>"
			else
				page += "<strong>Objs in view:</strong><BR>"
				for (O in view(usr))
					page += "<a href=\"byond://#\ref[src]\ref[O]\">[O]</a><BR>"
			Browse(page)

		DebugAreas()
			var/page = "<strong>Areas in world:</strong><BR>"
			var/area/A
			for (A in world)
				page += "<a href=\"byond://#\ref[src]\ref[A]\">[A]</a><BR>"
			Browse(page)

		DebugTurfs()
			var/page = "<strong>Turfs in view:</strong><BR>"
			var/turf/T
			for (T in view(usr))
				page += "x:[T.x] y:[T.y] -- <a href=\"byond://#\ref[src]\ref[T]\">[T]</a><BR>"
			Browse(page)

		Debug(O)
			// Workaround here to lists not being caught by istype() for some reason.
			if (istype(O, /list))
				DebugList(O)
			else if (istype(O, /savefile))
				DebugSavefile(O)
			else
				DebugObject(O)

		DebugList(list/L)
			var/length = L.len
			var/page = "<H2>List with [length] items</H2>"

			page += "<table>"
			var/current
			var/count
			for (count = 1, count <= length, count++)
				page += "<tr>"
				current = L[count]
				page += "<td>[count]</td>" + _outputText(current)
				page += "</tr>"
			if (!length)
				page += "<tr><td>\[no items]</td></tr>"
			page += "</table>"
			Browse(page)

		DebugObject(O)
			var/page = "<H2>[O]</H2>"

			// dd_sortedtextlist() doesn't preserve associated list values so can't just sort the variables list.
			var/list/variables = O:vars
			var/list/sorted_names = dd_sortedtextlist(variables)

			// NOW: Sort this.
			page += "<table border=1 cellpadding=3>"
			page += "<tr><th>Variable name</th><th>Value</th><th>Type</th></tr>"
			var/V
			for(V in sorted_names)
				page += "<tr>"
				var/this_var = variables[V]
				page += "<td>[V]</td>" + _outputText(this_var)
				page += "</tr>"
			page += "</table>"
			Browse(page)

		origDebugObject(O)
			var/page = "<H2>[O]</H2>"
			var/variables = O:vars

			// NOW: Sort this.
			page += "<table>"
			var/V
			for(V in variables)
				page += "<tr>"
				var/this_var = variables[V]
				page += "<td>[V]</td>" + _outputText(this_var)
				page += "</tr>"
			page += "</table>"
			Browse(page)

		DebugSavefile(savefile/F, directory = "/")
			var/page = "<H2>[F]</H2>"
			page += "[directory]<BR><BR>"

			F.cd = directory
			var/list/dirs = F.dir
			if (!dirs.len)
				var/value
				F >> value
				page += "[value]"

				// Handle any additional values in this directory.
				while(value)
					F >> value
					if (value)
						page += "<BR>[value]"
				Browse(page)
				return

			var/current_value
			var/current_dir
			var/list/current_subdirs
			var/current
			for (current in dirs)
				if (directory == "/")
					current_dir = "/[current]"
				else
					current_dir = "[directory]/[current]"

				// See if it is a directory -- if not, it's a value, so show the value.
				F.cd = current_dir
				current_subdirs = F.dir
				if (current_subdirs.len)
					page += "<a href=\"byond://#\ref[src]savefile:[F]:[current_dir]\">[current]</a>[SPACES]\[directory]<BR>"
				else
					F >> current_value
					page += "[current] = <strong>[current_value]</strong>[SPACES]\[value]<BR>"
					while(current_value)
						F >> current_value
						if (current_value)
							page += "<BR>[SPACES][current_value][SPACES]\[value]<BR>"

				// Go back to parent directory.
				F.cd = directory
			Browse(page)

		_outputText(O)
			if (istext(O))
				return "<td><strong>[O]</strong></td><td>\[text]</td>"
			else if (isnum(O))
				return "<td><strong>[O]</strong></td><td>\[number]</td>"
			else if (isnull(O))
				return "<td>&nbsp;</td><td>\[null]</td>"
			else if (istype(O, /list))
				return "<td><a href=\"byond://#\ref[src]\ref[O]\">[O]</a></td><td>\[list]</td>"
			else if (istype(O, /savefile))
				var/directory = "/"
				return "<td><a href=\"byond://#\ref[src]savefile:[O]:[directory]\">[O]</a></td><td>\[savefile]</td>"
			return "<td><a href=\"byond://#\ref[src]\ref[O]\">[O]</a></td><td>\[object]</td>"


proc/dd_sortedObjectList(list/incoming)
	/*
	   Use binary search to order by dd_SortValue().
	   This works by going to the half-point of the list, seeing if the node in
	   question is higher or lower cost, then going halfway up or down the list
	   and checking again. This is a very fast way to sort an item into a list.
	*/
	var/list/sorted_list = new()
	var/low_index
	var/high_index
	var/insert_index
	var/midway_calc
	var/current_index
	var/current_item
	var/current_item_value
	var/current_sort_object_value
	var/list/list_bottom

	var/current_sort_object
	for (current_sort_object in incoming)
		low_index = 1
		high_index = sorted_list.len
		while (low_index <= high_index)
			// Figure out the midpoint, rounding up for fractions.  (BYOND rounds down, so add 1 if necessary.)
			midway_calc = (low_index + high_index) / 2
			current_index = round(midway_calc)
			if (midway_calc > current_index)
				current_index++
			current_item = sorted_list[current_index]

			current_item_value = current_item:dd_SortValue()
			current_sort_object_value = current_sort_object:dd_SortValue()
			if (current_sort_object_value < current_item_value)
				high_index = current_index - 1
			else if (current_sort_object_value > current_item_value)
				low_index = current_index + 1
			else
				// current_sort_object == current_item
				low_index = current_index
				break

		// Insert before low_index.
		insert_index = low_index

		// Special case adding to end of list.
		if (insert_index > sorted_list.len)
			sorted_list += current_sort_object
			continue

		// Because BYOND lists don't support insert, have to do it by:
		// 1) taking out bottom of list, 2) adding item, 3) putting back bottom of list.
		list_bottom = sorted_list.Copy(insert_index)
		sorted_list.Cut(insert_index)
		sorted_list += current_sort_object
		sorted_list += list_bottom
	return sorted_list


proc/dd_sortedtextlist(list/incoming, case_sensitive = 0)
	// Returns a new list with the text values sorted.
	// Use binary search to order by sortValue.
	// This works by going to the half-point of the list, seeing if the node in question is higher or lower cost,
	// then going halfway up or down the list and checking again.
	// This is a very fast way to sort an item into a list.
	var/list/sorted_text = new()
	var/low_index
	var/high_index
	var/insert_index
	var/midway_calc
	var/current_index
	var/current_item
	var/list/list_bottom
	var/sort_result

	var/current_sort_text
	for (current_sort_text in incoming)
		low_index = 1
		high_index = sorted_text.len
		while (low_index <= high_index)
			// Figure out the midpoint, rounding up for fractions.  (BYOND rounds down, so add 1 if necessary.)
			midway_calc = (low_index + high_index) / 2
			current_index = round(midway_calc)
			if (midway_calc > current_index)
				current_index++
			current_item = sorted_text[current_index]

			if (case_sensitive)
				sort_result = sortText(current_sort_text, current_item)
//				sort_result = sortText(current_sort_text, current_item)
			else
				sort_result = sortText(current_sort_text, current_item)

			switch(sort_result)
				if (1)
					high_index = current_index - 1	// current_sort_text < current_item
				if (-1)
					low_index = current_index + 1	// current_sort_text > current_item
				if (0)
					low_index = current_index		// current_sort_text == current_item
					break

		// Insert before low_index.
		insert_index = low_index

		// Special case adding to end of list.
		if (insert_index > sorted_text.len)
			sorted_text += current_sort_text
			continue

		// Because BYOND lists don't support insert, have to do it by:
		// 1) taking out bottom of list, 2) adding item, 3) putting back bottom of list.
		list_bottom = sorted_text.Copy(insert_index)
		sorted_text.Cut(insert_index)
		sorted_text += current_sort_text
		sorted_text += list_bottom
	return sorted_text


proc/dd_sortedTextList(list/incoming)
	var/case_sensitive = 1
	return dd_sortedtextlist(incoming, case_sensitive)


datum/proc/dd_SortValue()
	return "[src]"

proc
	///////////////////
	// Reading files //
	///////////////////
	dd_file2list(file_path, separator = "\n")
		var/file
		if (isfile(file_path))
			file = file_path
		else
			file = file(file_path)
		return dd_text2list(file2text(file), separator)


    ////////////////////
    // Replacing text //
    ////////////////////
	dd_replacetext(text, search_string, replacement_string)
		// A nice way to do this is to split the text into an array based on the search_string,
		// then put it back together into text using replacement_string as the new separator.
		var/list/textList = dd_text2list(text, search_string)
		return dd_list2text(textList, replacement_string)


	dd_replaceText(text, search_string, replacement_string)
		var/list/textList = dd_text2List(text, search_string)
		return dd_list2text(textList, replacement_string)


    /////////////////////
	// Prefix checking //
	/////////////////////
	dd_hasprefix(text, prefix)
		var/start = 1
		var/end = lentext(prefix) + 1
		return findText(text, prefix, start, end)

	dd_hasPrefix(text, prefix)
		var/start = 1
		var/end = lentext(prefix) + 1
		return findText(text, prefix, start, end)
//		return findtextEX(text, prefix, start, end)


    /////////////////////
	// Suffix checking //
	/////////////////////
	dd_hassuffix(text, suffix)
		var/start = length(text) - length(suffix)
		if (start) return findText(text, suffix, start)

	dd_hasSuffix(text, suffix)
		var/start = length(text) - length(suffix)
		if (start) return findText(text, suffix, start)

	/////////////////////////////
	// Turning text into lists //
	/////////////////////////////
	dd_text2list(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findText(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			else
				if (searchPosition > textlength)							// Found separator at very end of string.
					textList += ""											// So add empty element.
					return textList

	dd_text2List(text, separator)
		var/textlength      = lentext(text)
		var/separatorlength = lentext(separator)
		var/list/textList   = new /list()
		var/searchPosition  = 1
		var/findPosition    = 1
		var/buggyText
		while (1)															// Loop forever.
			findPosition = findText(text, separator, searchPosition, 0)
			buggyText = copytext(text, searchPosition, findPosition)		// Everything from searchPosition to findPosition goes into a list element.
			textList += "[buggyText]"										// Working around weird problem where "text" != "text" after this copytext().

			searchPosition = findPosition + separatorlength					// Skip over separator.
			if (findPosition == 0)											// Didn't find anything at end of string so stop here.
				return textList
			else
				if (searchPosition > textlength)							// Found separator at very end of string.
					textList += ""											// So add empty element.
					return textList

	dd_list2text(list/the_list, separator)
		var/total = the_list.len
		if (total == 0)														// Nothing to work with.
			return

		var/newText = the_list[1]
		var/count
		for (count = 2, count <= total, count++)
			newText += separator
			newText += the_list[count]
		return newText

	dd_centertext(message, length)
		var/new_message = message
		var/size = length(message)
		if (size == length)
			return new_message
		if (size > length)
			return copytext(new_message, 1, length + 1)

		// Need to pad text to center it.
		var/delta = length - size
		if (delta == 1)
			// Add one space after it.
			return new_message + " "

		// Is this an odd number? If so, add extra space to front.
		if (delta % 2)
			new_message = " " + new_message
			delta--

		// Divide delta in 2, add those spaces to both ends.
		delta = delta / 2
		var/spaces = ""
		for (var/count = 1, count <= delta, count++)
			spaces += " "
		return spaces + new_message + spaces

	dd_limittext(message, length)
		// Truncates text to limit if necessary.
		var/size = length(message)
		if (size <= length)
			return message
		else
			return copytext(message, 1, length + 1)