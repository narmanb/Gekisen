//////////////////////////////////////////Created By Dtwon\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


Effect
{

	var
	{
		atom/orig				// The point of origin for the explosion
		speed = 1				// The rate at which the explosion expands in ticks
		basepower = 10			// The strength of the explosion at ground zero
	}

	proc
	{
		Apply(x,y,power,dir)
		{
			return power
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
			spawn(10)
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







proc

	Explode(Effect/theeffect)

		if(theeffect.orig)
			new /ExplodeNode/CenterAll(theeffect,theeffect.orig.x,theeffect.orig.y,theeffect.basepower)


	ExplodeBM(Effect/theeffect)

		if(theeffect.orig)
			new /ExplodeNode/CenterBM(theeffect,theeffect.orig.x,theeffect.orig.y,theeffect.basepower)



ExplodeNode


	CenterBM

		New(Effect/theeffect,x as num,y as num, power as num)

			if(round(power) > 0)

				power = theeffect.Apply(x,y,power,NORTH)

				new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
				new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
				new /ExplodeNode/Straight(theeffect,x + 1,y,power,EAST)

			del(src)





	CenterAll

		New(Effect/theeffect,x as num,y as num, power as num)

			if(round(power) > 0)

				power = theeffect.Apply(x,y,power,NORTH)

				new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
				new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
				new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
				new /ExplodeNode/Straight(theeffect,x + 1,y,power,EAST)
				new /ExplodeNode/Corner(theeffect,x - 1,y - 1,power,NORTHWEST)
				new /ExplodeNode/Corner(theeffect,x + 1,y - 1,power,NORTHEAST)
				new /ExplodeNode/Corner(theeffect,x - 1,y + 1,power,SOUTHWEST)
				new /ExplodeNode/Corner(theeffect,x + 1,y + 1,power,SOUTHEAST)



			del(src)





	Straight

		New(Effect/theeffect,x as num,y as num, power as num, dir as num)

			var

				tx
				ty


			if(round(power) > 0)

				if(x >= 1 && x <= world.maxx && y >= 1 && y <= world.maxy)
					power = theeffect.Apply(x,y,power,dir)

					switch(dir)

						if(NORTH)
							ty = -1
						if(SOUTH)
							ty = 1
						if(WEST)
							tx = -1
						if(EAST)
							tx = 1

					if(theeffect.speed)
						spawn(theeffect.speed)
							src.New(theeffect,x+tx,y+ty,power,dir)
					else
						src.New(theeffect,x+tx,y+ty,power,dir)

			else
				del(src)



	Corner

		New(Effect/theeffect,x as num,y as num, power as num, dir as num)

			var

				ty
				tx


			if(round(power) > 0)

				if(x >= 1 && x <= world.maxx && y >= 1 && y <= world.maxy)
					power = theeffect.Apply(x,y,power,dir)

					switch(dir)

						if(NORTHEAST)
							ty = -1
							tx = 1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
									new /ExplodeNode/Straight(theeffect,x+1,y,power,EAST)
							else
								new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
								new /ExplodeNode/Straight(theeffect,x+1,y,power,EAST)
						if(SOUTHEAST)
							ty = 1
							tx = 1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
									new /ExplodeNode/Straight(theeffect,x +1,y,power,EAST)
							else
								new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
								new /ExplodeNode/Straight(theeffect,x +1,y,power,EAST)
						if(NORTHWEST)
							ty = -1
							tx = -1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
									new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
							else
								new /ExplodeNode/Straight(theeffect,x,y - 1,power,NORTH)
								new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
						if(SOUTHWEST)
							ty = 1
							tx = -1
							if(theeffect.speed)
								spawn(theeffect.speed)
									new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
									new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)
							else
								new /ExplodeNode/Straight(theeffect,x,y + 1,power,SOUTH)
								new /ExplodeNode/Straight(theeffect,x - 1,y,power,WEST)


					if(theeffect.speed)
						spawn(theeffect.speed)
							src.New(theeffect,x + tx,y + ty,power,dir)
					else
						src.New(theeffect,x + tx,y + ty,power,dir)

			else
				del(src)




