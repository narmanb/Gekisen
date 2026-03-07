mob/Admin
	verb
		I_spy(mob/M in world)
			set name = "Spy"
			set category = "Police"
			set desc = "Watch any mob in the game."
			src.client.eye = M
			src.client.perspective = EYE_PERSPECTIVE
			src.spy=1

		Stop_spy()
			set name = "Stop Spying"
			set category = "Police"
			src.client.eye=src
			src.client.perspective = MOB_PERSPECTIVE
			src.spy=0

/*		Free_Camera()
			set name = "Free Camera Spy"
			set category = "Police"
			src.client.eye = src.z
			src.client.perspective = Eye_Perspective
			src.freecam=1

		Stop_Camera()
			set name = "Stop Camera Spy"
			set category = "Police"
			src.client.eye=src
			src.client.perspective = MOB_Perspective
			src.freecam=0
*/
atom/movable
	var
	spy=0