Effect
{


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

	//------------------------
	//Mystic Wind Effect
	//------------------------

	MysticWind
	{
		Apply(loc,power,dir)
		{
			var/i
			var/turf/T
			T = loc
			if(T)
				var/mob/PC/M = locate() in T
				if(M)
					step(M,dir)
			if(!T)return
			if(T.density)
				return 0
			//Show the wind
			i = image('windeffect.dmi',loc, dir = get_dir(orig,loc))
			view(12) << i
			spawn(1)
				del(i)
			//Use the base expansion algorithm
			return ..()
		}
	}


	BasicBoom
	{
		Apply(x,y,power,dir)
		{
			var/i
			var/obj/dirt/i2 = new
			var/i3
			var/turf/T
			T = locate(x,y,orig.z)
			//Doesn't go through walls so kill the trail if there is a wall
			if(!T)return
			if(T.density)
				return 0

			//Show the fire
			i = image('fire.dmi',locate(x,y,orig.z))
			view(12) << i
			spawn(1)
				del(i)

			//Damage the terrain
			i3 = image(i2,locate(x,y,orig.z))
			view(12) << i3
			spawn(50)
				del(i3)

			//Use the base expansion algorithm except reduce the
			//power by one so it doesn't go forever
			return ..(x,y,power-1,dir)
		}
	}


}



obj
{
	dirt
	{
		icon = 'Dirt.dmi'
		density = 0
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
			..()
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