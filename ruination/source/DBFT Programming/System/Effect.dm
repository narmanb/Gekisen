//Lightning Effect System

obj
	LightningParts
		l01
			icon = 'lightning.dmi'
			icon_state = "1"
			layer=99
			pixel_y = 32
		l02
			icon = 'lightning.dmi'
			icon_state = "2"
			layer=99
			pixel_y = 64

		l03
			icon = 'lightning.dmi'
			icon_state = "3"
			layer=99
			pixel_y = 86
		l04
			icon = 'lightning.dmi'
			icon_state = "4"
			layer=99
			pixel_y = 118
obj
	LightningBolt
		name = "Lightning Bolt"
		density = 0
		icon = 'lightning.dmi'
		icon_state ="5"
		layer = 99
		New()
			src.overlays += new/obj/LightningParts/l01
			src.overlays += new/obj/LightningParts/l02
			src.overlays += new/obj/LightningParts/l03
			src.overlays += new/obj/LightningParts/l04


mob
	proc
		screen_shake(n,a=1)
			spawn()
				for(var/i=0,i<n,i++)
					animate(src,pixel_y = rand(-4,4)*a,pixel_x=rand(-4,4)*a,time=2)
					sleep(1)
				animate(src,pixel_y=0,pixel_x=0,time=2)
		screen_shake2()
			spawn()
				//for(var/i=0,i<n,i++)
				animate(src,pixel_y = -1,pixel_x=2,time=2)
				sleep(1)
				animate(src,pixel_y = 1,pixel_x=-2,time=2)
				sleep(1)
				animate(src,pixel_y = -1,pixel_x=-2,time=2)
				sleep(1)
				animate(src,pixel_y = 1,pixel_x=2,time=2)
				sleep(1)
				animate(src,pixel_y=0,pixel_x=0,time=2)

		screen_shake3()
			spawn()
				//for(var/i=0,i<n,i++)
				animate(src,pixel_y = -4,pixel_x=6,time=2)
				sleep(1)
				animate(src,pixel_y = 4,pixel_x=-6,time=2)
				sleep(1)
				animate(src,pixel_y = -4,pixel_x=-6,time=2)
				sleep(1)
				animate(src,pixel_y = 4,pixel_x=6,time=2)
				sleep(1)
				animate(src,pixel_y=0,pixel_x=0,time=2)

		screen_shake4()
			spawn()
				//for(var/i=0,i<n,i++)
				animate(src,pixel_y = -5,pixel_x=5,time=1)
				sleep(1)
				animate(src,pixel_y = 5,pixel_x=-5,time=1)
				sleep(1)
				animate(src,pixel_y = -5,pixel_x=-5,time=1)
				sleep(1)
				animate(src,pixel_y = 5,pixel_x=5,time=1)
				sleep(1)
				animate(src,pixel_y=0,pixel_x=0,time=1)

		screen_shake5()
			spawn()
				//for(var/i=0,i<n,i++)

				animate(src,pixel_y = 1,pixel_x=-2,time=1)
				sleep(1)
				animate(src,pixel_y = -1,pixel_x=2,time=1)
				sleep(1)
				animate(src,pixel_y=0,pixel_x=0,time=1)





atom/proc/BlurFade()
	filters += filter(type = "blur", size = 0)
    // Animating a filter of src
	animate(filters[filters.len], size = 5, time = 10)
    // Switching back to src to animate the next step
	animate(src, alpha = 255, time = 2.5)

atom/proc/Highlight(apply)
    if(apply)
        filters = filter(type="outline", size=1, color=rgb(255,0,0))
    else
        filters = null


//COLOR MATRIX
///turf
//	grass
//		icon       = '1.dmi'
//		icon_state = "grass"



//mob
//con       = '1.dmi'
//con_state = "person"
/*
	verb
		Pick_Color(newColor as color)

			var/ColorMatrix/c = new(newColor)

			animate(client, color = c.matrix, time = 10)

		Pick_ColorSatContBright(s as num, c as num, b as num)

			var/ColorMatrix/cm = new(s, c, b)

			animate(client, color = cm.matrix, time = 10)

		Pick_ColorPreset(newColor in list("Invert", "BGR", "Greyscale", "Sepia", "Black & White", "Polaroid", "Polaroid2", "GRB", "RBG", "BRG", "GBR", "Normal"))

			if(newColor == "Normal")
				animate(client, color = null, time = 10)

			else
				var/ColorMatrix/c = new(newColor)
				animate(client, color = c.matrix, time = 10)



*/
/**
 * matrix related methods
 */


proc
	/**
	 * Multiply two color matrices, they have to be same size.
	 *
	 * @param mat1   first list or color matrix to multiply
	 * @param mat2   second list or color matrix to multiply
     * @return resultMatrix new color matrix list multiplication result
	 */
	matrixMultiply(list/mat1, list/mat2)

		if(istype(mat1, /ColorMatrix))
			mat1 = mat1:matrix

		if(istype(mat2, /ColorMatrix))
			mat2 = mat2:matrix

		if(mat1.len != mat2.len || mat1.len < 9) return

		var/rowSize = mat1.len % 3 == 0 ? 3 : 4
		var/colSize = mat1.len / rowSize

		var/resultMatrix[mat1.len]

		var/i1
		var/i2
		for(var/i = 1 to colSize)
			i1 = (i - 1) * rowSize + 1

			for(var/j = 1 to rowSize)
				i2 = j

				var/result = 0

				for(var/k = 1 to rowSize)

					result += mat1[i1 + (k - 1)] * mat2[i2]
					i2     += rowSize

				resultMatrix[(i - 1) * rowSize + j] = result

		return resultMatrix


/**
 * a color matrix datum
 */

ColorMatrix

	var
		list/matrix
		combined = 1

		const
			lumR = 0.3086 //  or  0.2125
			lumG = 0.6094 //  or  0.7154
			lumB = 0.0820 //  or  0.0721

	/**
	 * Constructs a color matrix
	 *
	 * @param mat        a color, preset name, saturation number or a color matrix list
	 * @param contrast   color matrix contrast
	 * @param brightness color matrix brightness
	 */
	New(mat, contrast = 1, brightness = null)
		..()

		if(istext(mat))

			SetPreset(mat)

			if(!matrix)
				SetColor(mat, contrast, brightness)
			else

		else if(isnum(mat))

			SetSaturation(mat, contrast, brightness)
		else
			matrix = mat

	proc
		/**
		 * Resets color matrix list
		 *
		 */
		Reset()
			matrix = list(1,0,0,
						  0,1,0,
						  0,0,1)

		/**
		 * Returns a new color matrix list with given contrast
		 *
		 * @param contrast  color matrix new contrast
		 * @return mat      a new matrix with altered contrast
		 */
		Get(contrast = 1)

			var/list/mat = matrix
			mat = mat.Copy()

			for(var/i = 1 to min(mat.len, 12))
				mat[i] *= contrast

			return mat

		/**
		 * Sets new color matrix list based on saturation
		 * You can also set contrast and brightness
		 *
		 * @param s  saturation
		 * @param c  optional contrast
		 * @param b  optional brightness
		 */
		SetSaturation(s, c = 1, b = null)
			var
				sr = (1 - s) * lumR
				sg = (1 - s) * lumG
				sb = (1 - s) * lumB

			matrix = list(c * (sr + s), c * (sr),     c * (sr),
						  c * (sg),     c * (sg + s), c * (sg),
						  c * (sb),     c * (sb),     c * (sb + s))

			SetBrightness(b)

		/**
		 * Sets color matrix brightness
		 *
		 * @param brightness  new brightness
		 */
		SetBrightness(brightness)
			if(brightness == null) return

			if(!matrix)
				Reset()


			if(matrix.len == 9 || matrix.len == 16)
				matrix += brightness
				matrix += brightness
				matrix += brightness

				if(matrix.len == 16)
					matrix += 0

			else if(matrix.len == 12)
				for(var/i = matrix.len to matrix.len - 3 step -1)
					matrix[i] = brightness

			else if(matrix.len == 3)
				for(var/i = matrix.len - 1 to matrix.len - 4 step -1)
					matrix[i] = brightness

		/**
		 * Converts 2 digit hex to decimal value
		 *
		 * @param hex     hex to convert
		 * @return 0-255  decimal value
		 */
		hex2value(hex)
			var/num1 = copytext(hex, 1, 2)
			var/num2 = copytext(hex, 2)

			if(isnum(text2num(num1)))
				num1 = text2num(num1)
			else
				num1 = text2ascii(lowertext(num1)) - 87

			if(isnum(text2num(num1)))
				num2 = text2num(num1)
			else
				num2 = text2ascii(lowertext(num2)) - 87

			return num1 * 16 + num2

		/**
		 * Creates a color matrix based off a color
		 *
		 * @param color      color to base new matrix on
		 * @param contrast   optional contrast
		 * @param brightness optional brightness
		 */
		SetColor(color, contrast = 1, brightness = null)

			var/rr = hex2value(copytext(color, 2, 4)) / 255
			var/gg = hex2value(copytext(color, 4, 6)) / 255
			var/bb = hex2value(copytext(color, 6, 8)) / 255

			rr = round(rr * 1000) / 1000 * contrast
			gg = round(gg * 1000) / 1000 * contrast
			bb = round(bb * 1000) / 1000 * contrast

			matrix = list(rr, gg, bb,
						  rr, gg, bb,
						  rr, gg, bb)

			SetBrightness(brightness)

		/**
		 * Sets color matrix list from a preset
		 *
		 * @param preset  preset to set
		 */
		SetPreset(preset)
			switch(lowertext(preset))
				if("invert")
					matrix = list(-1,0,0,
		                          0,-1,0,
		                          0,0,-1,
		                          1,1,1)
				if("greyscale")
					matrix = list(0.33,0.33,0.33,
		                          0.59,0.59,0.59,
		                          0.11,0.11,0.11)
				if("sepia")
					matrix = list(0.393,0.349,0.272,
		                          0.769,0.686,0.534,
		                          0.189,0.168,0.131)
				if("black & white")
					matrix = list(1.5,1.5,1.5,
		                          1.5,1.5,1.5,
		                          1.5,1.5,1.5,
		                          -1,-1,-1)
				if("polaroid")
					matrix = list(1.438,-0.062,-0.062,
		                          0.122,1.378,-0.122,
		                          0.016,-0.016,1.483,
		                          -0.03,0.05,-0.02)


				if("polaroid2")
					matrix = list(1.444,-0.062,-0.062,
		                          0.122,1.51,-0.122,
		                          0.016,-0.016,1.62,
		                          -0.03,0.05,-0.02)



					matrix = list(0,0,1,
		                          0,1,0,
		                          1,0,0)
				if("brg")
					matrix = list(0,0,1,
		                          1,0,0,
		                          0,1,0)
				if("gbr")
					matrix = list(0,1,0,
		                          0,0,1,
		                          1,0,0)
				if("grb")
					matrix = list(0,1,0,
		                          1,0,0,
		                          0,0,1)
				if("rbg")
					matrix = list(1,0,0,
		                          0,0,1,
		                          0,1,0)
				if("rgb")
					matrix = list(1,0,0,
		                          0,1,0,
		                          0,0,1)

		/**
		 * Sets color matrix list to an average of two lists
		 * it will not combine if the given list/matrix is using alpha while this one doesn't
		 *
		 * @param mat  matrix or list to combine with this one
		 */
		Combine(list/mat)
			if(!matrix) return

			if(istype(mat, /ColorMatrix))
				mat = mat:matrix

			if(mat.len % 3 != matrix.len % 3 || mat.len < 9 || matrix.len < 9) return

			for(var/i = 1 to matrix.len)
				matrix[i] = ((matrix[i] * combined) + mat[i]) / (combined + 1)

			combined++

		/**
		 * Removes previously combined color matrix list
		 * it will not split if the given list/matrix is using alpha while this one doesn't
		 *
		 * @param mat  matrix to remove from this one
		 */
		Split(list/mat)
			if(!matrix) return

			if(istype(mat, /ColorMatrix))
				mat = mat:matrix

			if(mat.len % 3 != matrix.len % 3 || mat.len < 9 || matrix.len < 9) return

			for(var/i = 1 to matrix.len)
				matrix[i] = ((matrix[i] * combined) - mat[i]) / (combined - 1)

			combined--

/*

mob/var/tmp/craterCooldown

obj/debris
	density=0
	bound_width=1
	bound_height=1
	Crater
		layer=2.1
		mouse_opacity=0
		icon='crater.dmi'
		icon_state="0,0"
		New()
			spawn(50)	src.loc=null
	Ship_Crater	//iuno?
		density=0
		icon='crater.dmi'
/*
mob/proc/GetKiPercent()
	var/kiNeeded=round((src.ki*(src.kipercentage/100)))
	if(kiNeeded<1)	kiNeeded=1
	return kiNeeded
*/
mob/proc/CraterSpawn(var/turf/craterLoc,var/isDeadly=1)
	spawn(1)
	//	if(src.z==2)	return
	//	if(src.z==6 || src.z==12)	return
	//	if(src.z==14)	return
		if(!craterLoc)	return
	//	if(!src || src.formcraters!="Yes")	return
	//	if(src.craterCooldown || !src.GetKey())	return
		//src.craterCooldown=1
	//	spawn(10)	src.craterCooldown=0
		for(var/mob/PC/M in view(world.view+2,craterLoc))
		//	if(M.GetKey() && M.hearauras=="On")
		//		M<<sound('explosion.wav')
		//var/craterDamage=src.GetKiPercent()
		var/createrDamage = 1
	/*
		for(var/mob/M in oview(craterLoc))
			if(M.PlayerPKCheck(src))
				if(isDeadly && get_dist(craterLoc,M)<=2)
					M.TakeDamage(craterDamage-M.kidef,src)
				if(!M)	continue
				if(M.pl<craterDamage && M.kidef<craterDamage)
					spawn(-1)	for(var/i=1; i<=4; i++)
						if(get_dist(M,craterLoc)<world.view)	step_away(M,craterLoc)
						sleep(0.5)
						*/
		for(var/x=-2; x<=2; x++)
			for(var/y=-2; y<=2; y++)
				var/turf/newLoc=locate(craterLoc.x+x,craterLoc.y+y,craterLoc.z)
				if(newLoc)
					var/obj/debris/Crater/newPart=new(newLoc)
					if(newLoc.name=="goodwater" || newLoc.name=="Turf0036")	newPart.icon='watercrater.dmi'
					//if(newLoc.destructable=="Yes")
					debris(newLoc,"ground")
					newPart.icon_state="[x+2],[y+2]"

					*/