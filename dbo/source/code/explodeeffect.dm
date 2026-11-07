RoundExplosion//ROUND EXPLOSION - GhostAnime, used originally for DBO
{
	proc
	{
		NDBlast(atom/center,damage,radius)//ignores density
		{
			if(!center) return
			if(radius < 3){radius = 3}
			for(var/turf/T in getcircle(center,radius))
				//var/i
				if(!T)
					return
				if(T.unblowable)//Turfs with this set to one will be ignored
					return
				damage = round(max(0,(damage - 1)))
				if(damage)
					for(var/mob/M in T)
						M.powerlevel.value -= damage * (radius - distance(T,center)) / radius
						M.Die(usr)
				T.density = 0
				T.layer = TURF_LAYER
				T.opacity = 0
				T.overlays = 0

		/*			//Show the fire
				i = image('fire.dmi',loc)
				world << i
				spawn(1)
					del(i)*/

				//Damage the terrain
				T.icon = 'icons/dirt.dmi'

				//restore after 10 mins
				spawn(6000)
					T.density = initial(T.density)
					T.layer = initial(T.layer)
					T.opacity = initial(T.opacity)
					T.overlays = initial(T.overlays)
					T.icon = initial(T.icon)
				//Use the base expansion algorithm
		}



		DBlast(atom/center,damage,radius)//ignores density
		{
			for(var/turf/T in getcircle(center,radius))
				//var/i
				if(!T)
					return
				if(T.density||T.unblowable)//Turfs that are dense or unblowable will be ignored
					return
				damage = round(max(0,(damage - 1)))
				if(damage)
					for(var/mob/M in T)
						M.powerlevel.value -= damage * (radius - distance(T,center)) / radius
						M.Die(usr)
				T.icon = 'icons/dirt.dmi'
				spawn(6000)
					T.density = initial(T.density)
					T.layer = initial(T.layer)
					T.opacity = initial(T.opacity)
					T.overlays = initial(T.overlays)
					T.icon = initial(T.icon)
		}
	}



}




Effect
{

	var
	{
		atom/orig				// The point of origin for the explosion
		speed = 1				// The rate at which the explosion expands in ticks
		basepower = 2			// The strength of the explosion at ground zero
	}

	proc
	{
		Apply(loc,power,dir)	// The function to override in children classes to change behaviour of explosion.
		{
			return power - 1
		}
	}

	New(atom/p_orig, p_speed, p_basepower)
	{
		orig = p_orig
		speed = p_speed
		basepower = p_basepower
	}
	//------------------------
	//Example Effects
	//------------------------

	//------------------------
	//Standard Explosion
	//------------------------

	BasicBoom
	{
		Apply(loc,power,dir)
		{
			var/i
			var/turf/T
			T = loc
			//Doesn't go through walls so kill the trail if there is a wall
			if(T.density)
				return 0

			//Show the fire
			i = image('icons/fire.dmi',loc)
			world << i
			spawn(1)
				del(i)

			//Damage the terrain
			T.icon = 'icons/dirt.dmi'

			//restore after 10 mins
			spawn(6000)
				T.icon = initial(T.icon)

			//Use the base expansion algorithm
			return ..()
		}
	}

	//------------------------
	//Weird Explosion
	//------------------------

	WeirdBoom
	{
		Apply(loc,power,dir)
		{
			var/i
			var/turf/T
			T = loc
			//Doesn't go through walls so kill the trail if there is a wall
			if(T.density)
				return 0

			//Show the fire
			i = image('icons/fire.dmi',loc)
			world << i
			spawn(1)
				del(i)

			//Damage the terrain
			T.icon = 'icons/dirt.dmi'

			//restore after 10 mins
			spawn(6000)
				T.icon = initial(T.icon)

			//There is a chance based on the current power that the explosion just dies
			if(!prob(power/basepower*100))
				return 0

			//Use the base expansion algorithm
			return ..()
		}
	}

	//------------------------
	//Density-Ignoring Explosion
	//------------------------

	SDBoom
	{
		Apply(loc,power,dir)
		{
			var/i
			var/turf/T
			T = loc
			if(T.unblowable)
				return
			T.density = 0
			T.layer = TURF_LAYER
			T.opacity = 0
			T.overlays = 0

			//Show the fire
			i = image('icons/fire.dmi',loc)
			world << i
			spawn(1)
				del(i)

			//Damage the terrain
			T.icon = 'icons/dirt.dmi'

			//restore after 10 mins
			spawn(6000)
				T.density = initial(T.density)
				T.layer = initial(T.layer)
				T.opacity = initial(T.opacity)
				T.overlays = initial(T.overlays)
				T.icon = initial(T.icon)

			//Use the base expansion algorithm
			return ..()
		}
	}


}

Explosion
{

	var
	{
		Explosion/Queue/Q
	}

	New(Effect/theeffect)
	{
		var/loc
		var/pow
		var/dir
		var/dist
		var/lastdist = 0
		var/D

		Q = new()

		var/dirlist[] = list(NORTH,SOUTH,EAST,WEST,NORTHWEST,NORTHEAST,SOUTHWEST,SOUTHEAST)
		var/newpow = theeffect.Apply(theeffect.orig,theeffect.basepower,0)

		//Initialize the starting queue
		for(D in dirlist)
		{
			Q.L.Add(D)
			Q.L.Add(get_step(theeffect.orig,D))
			Q.L.Add(newpow)
			Q.L.Add(1)
		}

		while(Q.L.len)
		{
			dir = Q.Pop()
			loc = Q.Pop()
			pow = Q.Pop()
			dist = Q.Pop()
			if(lastdist != dist)
				if(theeffect.speed >= 0)
					sleep(theeffect.speed)
				lastdist = dist

			if(pow > 0 && loc)
			{
				//If there is only one bit set(ie: Cardinal direction)
				//this will return 0
				newpow = theeffect.Apply(loc,pow,dir)

				if(dir & (dir-1))
				{
					if(dir & NORTH)
					{
						Q.L.Add(NORTH)
						Q.L.Add(get_step(loc,NORTH))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & SOUTH)
					{
						Q.L.Add(SOUTH)
						Q.L.Add(get_step(loc,SOUTH))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & EAST)
					{
						Q.L.Add(EAST)
						Q.L.Add(get_step(loc,EAST))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
					if(dir & WEST)
					{
						Q.L.Add(WEST)
						Q.L.Add(get_step(loc,WEST))
						Q.L.Add(newpow)
						Q.L.Add(dist+1)
					}
				}

				Q.L.Add(dir)
				Q.L.Add(get_step(loc,dir))
				Q.L.Add(newpow)
				Q.L.Add(dist+1)
			}
		}

	}

	Queue
	{
		var/L[]
		New()
		{
			L = new()
		}

		Del()
		{
			del(L)
		}

		proc
		{
			Pop()
			{
				. = L[1]
				L.Cut(1,2)
			}
		}
	}

}