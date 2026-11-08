
/*
view_width = ceil(map_width/tile_width)
view_height = ceil(map_height/tile_height)


buffer_width = floor((view_width*tile_width - map_width)/2)
buffer_height = floor((view_height*tile_height - map_height)/2)
*/

#define floor(x) round(x)
#define ceil(x) (-round(-x))

#define TILE_WIDTH 32
#define TILE_HEIGHT 32
#define MAX_VIEW_TILES 1000   //1100 was before
//var/MAX_VIEW_TILES=600
/*
mob/verb/showmaxtiles()
	world<<"MVT: [MAX_VIEW_TILES]"
	global.MAX_VIEW_TILES = input("CHange MVT",global.MAX_VIEW_TILES) as num
	world<<"MVT: [MAX_VIEW_TILES]  NOW"
*/
client
	var
		view_width
		view_height
		buffer_x
		buffer_y
		map_zoom
		tile_width = 32
		tile_height = 32
	verb
		onResize()
			set hidden = 1
			set waitfor = 0
			var/sz = winget(src,"map","size")
			var/map_width = text2num(sz)
			var/map_height = text2num(copytext(sz,findtext(sz,"x")+1,0))
			map_zoom = 1
			view_width = ceil(map_width/TILE_WIDTH)
			if(!(view_width%2)) ++view_width
			view_height = ceil(map_height/TILE_HEIGHT)
			if(!(view_height%2)) ++view_height

			while(view_width*view_height>MAX_VIEW_TILES)
				view_width = ceil(map_width/TILE_WIDTH/++map_zoom)
				if(!(view_width%2)) ++view_width
				view_height = ceil(map_height/TILE_HEIGHT/map_zoom)
				if(!(view_height%2)) ++view_height

			buffer_x = floor((view_width*tile_width - map_width/map_zoom)/2)
			buffer_y = floor((view_height*tile_height - map_height/map_zoom)/2)

			src.view = "[view_width]x[view_height]"
			winset(src,"map","zoom=[map_zoom];")

mob
	Login()
		client.onResize()
		return ..()