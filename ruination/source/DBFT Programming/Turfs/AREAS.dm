area/Special
	OzzTile
		Enter(var/mob/M)
			if(istype(M,/mob/PC))
				if(M.key == "Ozzking90"||M.key == "Narmanb")
				//if(M.key == "Narmanb")
					return 1
				else
					return
			else
				return



			/*
			if(M.key != "Narmanb")
			//	M << " You are not OzzX!"
				return
			else
				M << "You can pass"
				..()

				*/