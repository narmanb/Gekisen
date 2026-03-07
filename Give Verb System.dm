// !! GIVE GM COMMANDS !!

/mob/LVL7Admin
	verb
		Give_Admin_Verb(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Which verb do you want him/her to have?", "Admin Verbs Giver",text) in list("Gm Giving","Host Budokai","Summon Budokai 1","Summon Budokai 2","End Budokai","Own","Oozaru Transform","Give Shinobi Headband","Moon Out","Change World ID","All Say","Shutdown Server","Max Stats","Debug","Upload Icon","Announce","Clean All","Import Item","Boot","Request Icon","Request File","Inform","Reboot","Power Hungrah","Freeze","Unfreeze","World Unfreeze","Duplicate","Unmute","World Unmute","View Stats","Mute","Dragonball Scatter","Dragonball Revive","Create","Teleport","Admin Kill","Summon","Unsummon","Edit","Check Contents","Create Mob","Rename","Revive","Restore","Purify","Prices","Change Others Icon","Bitchslap","Strip, Freeze and Cry","Delete","Add Overlay","Add Underlay","Remove Overlay","Remove Underlay","Admin OOC","Stop Music","Music","Change Icon","Change OOCName","Change OOCRank","Create Turf","World Mute","World Aura Off","Give Morpher","Remove Morpher","World Clean","Event","Cancel"))
				if("Gm Giving")
					M.verbs += /mob/Admin/verb/GM_Giving
				if("Host Budokai")
					M.verbs += /mob/Admin/verb/HostBudokai
				if("Summon Budokai 1")
					M.verbs += /mob/Admin/verb/SummonBudokai1
				if("Summon Budokai 2")
					M.verbs += /mob/Admin/verb/SummonBudokai2
				if("End Budokai")
					M.verbs += /mob/Admin/verb/EndBudokai
//				if("GM Splitform")
//					M.verbs += /mob/Admin/verb/SMultiply
//				if("Dodge")
//					M.verbs += /mob/Admin/verb/Dodge
				if("Own")
					M.verbs += /mob/Admin/verb/Own
				if("Oozaru Transform")
					M.verbs += /mob/Admin/verb/Oozarutrans
				if("Give Shinobi Headband")
					M.verbs += /mob/Admin/verb/GiveShinobiband
				if("Moon Out")
					M.verbs += /mob/Admin/verb/Moon_Out
				if("Change World ID")
					M.verbs += /mob/Admin/verb/DragonballWorldID
				if("All Say")
					M.verbs += /mob/Admin/verb/AllSay
				if("Shutdown Server")
					M.verbs += /mob/Admin/verb/ShutdownServer
//				if("Super Fantastic Spiritbomb")
//					M.verbs += /mob/Admin/verb/Kakssuperfantasticverb
				if("Max Stats")
					M.verbs += /mob/Admin/verb/Max_Stat
				if("Debug")
					M.verbs += /mob/Admin/verb/Debug
				if("Upload Icon")
					M.verbs += /mob/Admin/verb/Upload_icon_to_server
				if("Announce")
					M.verbs += /mob/Admin/verb/Special_Announce
				if("Clean All")
					M.verbs += /mob/Admin/verb/Cleanall
				if("Import Item")
					M.verbs += /mob/Admin/verb/CreateSpecialItem
				if("Boot")
					M.verbs += /mob/Admin/verb/Boot
				if("Request Icon")
					M.verbs += /mob/Admin/verb/Request_Icon
				if("Request File")
					M.verbs += /mob/Admin/verb/Request_File
				if("Inform")
					M.verbs += /mob/Admin/verb/Inform
				if("Reboot")
					M.verbs += /mob/Admin/verb/Reboot
				if("Power Hungrah")
					M.verbs += /mob/Admin/verb/PowerHungrah
				if("Freeze")
					M.verbs += /mob/Admin/verb/PlayerFreeze
				if("Unfreeze")
					M.verbs += /mob/Admin/verb/PlayerUnfreeze
				if("World Unfreeze")
					M.verbs += /mob/Admin/verb/PlayerUnfreezeAll
				if("Duplicate")
					M.verbs += /mob/Admin/verb/Duplicate
				if("Unmute")
					M.verbs += /mob/Admin/verb/unMute
				if("World Unmute")
					M.verbs += /mob/Admin/verb/unMuteAll
				if("View Stats")
					M.verbs += /mob/Admin/verb/ViewUsefullVars
				if("Mute")
					M.verbs += /mob/Admin/verb/Mute
				if("Dragonball Scatter")
					M.verbs += /mob/Admin/verb/Dragonball_Scat
				if("Dragonball Revive")
					M.verbs += /mob/danverb/verb/dbrevive
				if("Create")
					M.verbs += /mob/Admin/verb/Create
				if("Teleport")
					M.verbs += /mob/Admin/verb/AdminTeleport
				if("Admin Kill")
					M.verbs += /mob/Admin/verb/AdminKill
				if("Summon")
					M.verbs += /mob/Admin/verb/Summon
				if("Unsummon")
					M.verbs += /mob/Admin/verb/Unsummon
				if("Edit")
					M.verbs += /mob/Admin/verb/Edit
				if("Check Contents")
					M.verbs += /mob/Admin/verb/CheckContents
				if("Create Mob")
					M.verbs += /mob/Admin/verb/Createmob
				if("Rename")
					M.verbs += /mob/Admin/verb/Rename
				if("Revive")
					M.verbs += /mob/Admin/verb/Revive
				if("Restore")
					M.verbs += /mob/Admin/verb/Restore
				if("Purify")
					M.verbs += /mob/Admin/verb/Purify
				if("Prices")
					M.verbs += /mob/Admin/verb/Prices
				if("Change Others Icon")
					M.verbs += /mob/Admin/verb/ChangeOthersIcon
				if("Bitchslap")
					M.verbs += /mob/Admin/verb/Beetchshlap
				if("Strip, Freeze and Cry")
					M.verbs += /mob/Admin/verb/sfc
				if("Delete")
					M.verbs += /mob/Admin/verb/Delete
//				if("Ban")
//				if("Unban")
				if("Add Overlay")
					M.verbs += /mob/Admin/verb/Add_Overlay
				if("Add Underlay")
					M.verbs += /mob/Admin/verb/Add_Underlay
				if("Remove Overlay")
					M.verbs += /mob/Admin/verb/Remove_Overlay
				if("Remove Underlay")
					M.verbs += /mob/Admin/verb/Remove_Underlay
				if("Admin OOC")
					M.verbs += /mob/Admin/verb/Admin_OOC
				if("Stop Music")
					M.verbs += /mob/Admin/verb/Stop_Music
				if("Music")
					M.verbs += /mob/Admin/verb/Music
				if("Change Icon")
					M.verbs += /mob/Admin/verb/ChangeIcon
				if("Change OOCName")
					M.verbs +=/mob/Admin/verb/Change_OOCname
				if("Change OOCRank")
					M.verbs +=/mob/Admin/verb/Change_OOCRank
				if("Create Turf")
					M.verbs +=/mob/Admin/verb/CreateTurf
				if("World Mute")
					M.verbs +=/mob/Admin/verb/MuteAll
				if("World Aura Off")
					M.verbs +=/mob/Admin/verb/WorldAuraOff
				if("Give Morpher")
					M.verbs +=/mob/PRAdmin/verb/Give_Morpher
				if("Remove Morpher")
					M.verbs +=/mob/PRAdmin/verb/Remove_Morpher
				if("World Clean")
					M.verbs += /mob/Admin/verb/WorldClean
				if("Event")
					M.verbs += /mob/Admin/verb/Event
//				if ("Give Keycard")
//					M.verbs += /mob/keycardadmin/verb/Give_Keycard
//				if ("Remove Keycard")
//					M.verbs += /mob/keycardadmin/verb/Remove_Keycard
				if("Cancel")
					return

// !! REMOVE GM COMMANDS !!

		Remove_Admin_Verb(mob/characters/M as mob in world)
			set category = "Police"
			switch(input("Which verb do you want to remove from him/her list?", "Admin Verbs Remover",text) in list("Gm Giving","Host Budokai","Summon Budokai 1","Summon Budokai 2","End Budokai","Own","Oozaru Transform","Give Shinobi Headband","Moon Out","Change World ID","All Say","Shutdown Server","Max Stats","Debug","Upload Icon","Announce","Clean All","Import Item","Boot","Request Icon","Request File","Inform","Reboot","Power Hungrah","Freeze","Unfreeze","World Unfreeze","Duplicate","Unmute","World Unmute","View Stats","Mute","Dragonball Scatter","Dragonball Revive","Create","Teleport","Admin Kill","Summon","Unsummon","Edit","Check Contents","Create Mob","Rename","Revive","Restore","Purify","Prices","Change Others Icon","Bitchslap","Strip, Freeze and Cry","Delete","Add Overlay","Add Underlay","Remove Overlay","Remove Underlay","Admin OOC","Stop Music","Music","Change Icon","Change OOCName","Change OOCRank","Create Turf","World Mute","World Aura Off","Give Morpher","Remove Morpher","World Clean","Event","Cancel"))
				if("Gm Giving")
					M.verbs -= /mob/Admin/verb/GM_Giving
				if("Host Budokai")
					M.verbs -= /mob/Admin/verb/HostBudokai
				if("Summon Budokai 1")
					M.verbs -= /mob/Admin/verb/SummonBudokai1
				if("Summon Budokai 2")
					M.verbs -= /mob/Admin/verb/SummonBudokai2
				if("End Budokai")
					M.verbs -= /mob/Admin/verb/EndBudokai
//				if("GM Splitform")
//					M.verbs -= /mob/Admin/verb/SMultiply
//				if("Dodge")
//					M.verbs -=/mob/Admin/verb/Dodge
				if("Own")
					M.verbs -= /mob/Admin/verb/Own
				if("Oozaru Transform")
					M.verbs -= /mob/Admin/verb/Oozarutrans
				if("Give Shinobi Headband")
					M.verbs -= /mob/Admin/verb/GiveShinobiband
				if("Moon Out")
					M.verbs -= /mob/Admin/verb/Moon_Out
				if("Change World ID")
					M.verbs -= /mob/Admin/verb/DragonballWorldID
				if("All Say")
					M.verbs -= /mob/Admin/verb/AllSay
				if("Shutdown Server")
					M.verbs -= /mob/Admin/verb/ShutdownServer
//				if("Super Fantastic Spiritbomb")
//					M.verbs -= /mob/Admin/verb/Kakssuperfantasticverb
				if("Max Stats")
					M.verbs -= /mob/Admin/verb/Max_Stat
				if("Debug")
					M.verbs -= /mob/Admin/verb/Debug
				if("Upload Icon")
					M.verbs -= /mob/Admin/verb/Upload_icon_to_server
				if("Announce")
					M.verbs -= /mob/Admin/verb/Special_Announce
				if("Clean All")
					M.verbs -= /mob/Admin/verb/Cleanall
				if("Import Item")
					M.verbs -= /mob/Admin/verb/CreateSpecialItem
				if("Boot")
					M.verbs -= /mob/Admin/verb/Boot
				if("Request Icon")
					M.verbs -= /mob/Admin/verb/Request_Icon
				if("Request File")
					M.verbs -= /mob/Admin/verb/Request_File
				if("Inform")
					M.verbs -= /mob/Admin/verb/Inform
				if("Reboot")
					M.verbs -= /mob/Admin/verb/Reboot
				if("Power Hungrah")
					M.verbs -= /mob/Admin/verb/PowerHungrah
				if("Freeze")
					M.verbs -= /mob/Admin/verb/PlayerFreeze
				if("Unfreeze")
					M.verbs -= /mob/Admin/verb/PlayerUnfreeze
				if("World Unfreeze")
					M.verbs -= /mob/Admin/verb/PlayerUnfreezeAll
				if("Duplicate")
					M.verbs -= /mob/Admin/verb/Duplicate
				if("Unmute")
					M.verbs -= /mob/Admin/verb/unMute
				if("World Unmute")
					M.verbs -= /mob/Admin/verb/unMuteAll
				if("View Stats")
					M.verbs -= /mob/Admin/verb/ViewUsefullVars
				if("Mute")
					M.verbs -= /mob/Admin/verb/Mute
				if("Dragonball Scatter")
					M.verbs -= /mob/Admin/verb/Dragonball_Scat
				if("Dragonball Revive")
					M.verbs -= /mob/danverb/verb/dbrevive
				if("Create")
					M.verbs -= /mob/Admin/verb/Create
				if("Teleport")
					M.verbs -= /mob/Admin/verb/AdminTeleport
				if("Admin Kill")
					M.verbs -= /mob/Admin/verb/AdminKill
				if("Summon")
					M.verbs -= /mob/Admin/verb/Summon
				if("Unsummon")
					M.verbs -= /mob/Admin/verb/Unsummon
				if("Edit")
					M.verbs -= /mob/Admin/verb/Edit
				if("Check Contents")
					M.verbs -= /mob/Admin/verb/CheckContents
				if("Create Mob")
					M.verbs -= /mob/Admin/verb/Createmob
				if("Rename")
					M.verbs -= /mob/Admin/verb/Rename
				if("Revive")
					M.verbs -= /mob/Admin/verb/Revive
				if("Restore")
					M.verbs -= /mob/Admin/verb/Restore
				if("Purify")
					M.verbs -= /mob/Admin/verb/Purify
				if("Prices")
					M.verbs -= /mob/Admin/verb/Prices
				if("Change Others Icon")
					M.verbs -= /mob/Admin/verb/ChangeOthersIcon
				if("Bitchslap")
					M.verbs -= /mob/Admin/verb/Beetchshlap
				if("Strip, Freeze and Cry")
					M.verbs -= /mob/Admin/verb/sfc
				if("Delete")
					M.verbs -= /mob/Admin/verb/Delete
//				if("Ban")
//				if("Unban")
				if("Add Overlay")
					M.verbs -= /mob/Admin/verb/Add_Overlay
				if("Add Underlay")
					M.verbs -= /mob/Admin/verb/Add_Underlay
				if("Remove Overlay")
					M.verbs -= /mob/Admin/verb/Remove_Overlay
				if("Remove Underlay")
					M.verbs -= /mob/Admin/verb/Remove_Underlay
				if("Admin OOC")
					M.verbs -= /mob/Admin/verb/Admin_OOC
				if("Stop Music")
					M.verbs -= /mob/Admin/verb/Stop_Music
				if("Music")
					M.verbs -= /mob/Admin/verb/Music
				if("Change Icon")
					M.verbs -= /mob/Admin/verb/ChangeIcon
				if("Change OOCName")
					M.verbs -=/mob/Admin/verb/Change_OOCname
				if("Change OOCRank")
					M.verbs -=/mob/Admin/verb/Change_OOCRank
				if("Create Turf")
					M.verbs -=/mob/Admin/verb/CreateTurf
				if("World Mute")
					M.verbs -=/mob/Admin/verb/MuteAll
				if("World Aura Off")
					M.verbs -=/mob/Admin/verb/WorldAuraOff
				if("Give Morpher")
					M.verbs -=/mob/PRAdmin/verb/Give_Morpher
				if("Remove Morpher")
					M.verbs -=/mob/PRAdmin/verb/Remove_Morpher
				if("World Clean")
					M.verbs -= /mob/Admin/verb/WorldClean
				if("Event")
					M.verbs -= /mob/Admin/verb/Event
//				if ("Give Keycard")
//					M.verbs -= /mob/keycardadmin/verb/Give_Keycard
//				if ("Remove Keycard")
//					M.verbs -= /mob/keycardadmin/verb/Remove_Keycard
				if("Cancel")
					return