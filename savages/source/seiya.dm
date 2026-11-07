mob/Login() // Lets check to see if the players who login are a GM or not.
	..() // Here we do the default procedure
	if(usr.key == "Seiya") // Lets look up a key so we can give out GM verbs
		usr.icon = 'K_ros.dmi'
		usr.overlays -= 'hair_goku.dmi'
		usr.overlays -= 'male.dmi'
		usr.overlays -= 'tail.dmi'
		usr.verbs += /mob/Admin/verb/SSJ5
	else // If the players key is not the same as the persons key which is looked up above then the player does not get the GM verbs.
		..() // Here we do the default procedure

mob/Admin/verb
	SSJ5()
		set category = ("Police") // This sets the verb to the "Administration" panel
		set name = ("SSJ5") // We name this "Delete" verb as "Delete Object" as you will be deleting objects via this verb.
		usr.icon = 'ssj5.dmi'
		usr.state = "ssj5"

