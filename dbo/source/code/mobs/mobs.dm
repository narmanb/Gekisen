stat
	var
		value
		max_value
		initial_value

	New(val)
		. = ..()
		value = val
		max_value = val
		initial_value = val

	proc
		add(num)
			if(num < 0)
				subtract(-num)
			else
				value = min(max_value, value+num)

		subtract(num)
			if(num < 0)
				add(-num)
			else
				value = max(value-num, 0)

		restore()
			value = max_value

		toPercent()
			return value/max_value*100

		toText()
			return "[round(value, 1)]/[round(max_value, 1)]"

mob
	proc
		sample_report()
			spawn(1)
				src << browse(\
{"<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
<title>DBO Rules</title>
<style type="text/css">
body {
	background: black;
	color: #548AB0;
}
h1, h2 {
	text-align: center;
}
h2 {
	font-size: 1em;
	font-weight: bold;
	text-decoration: underline;
}
</style>
</head>
<body>
<h1>Dragonball Online </h1>
<h2>Basic DBO Rules:</h2>
<ol>
<li>Keep cursing to a minimum.</li>
<li>No insulting of any kind.</li>
<li>No spam killing other players.</li>
<li>English is the official language of DBO. Please do not use any other languages in world chat.</li>
<li>Please use proper spelling and grammar. Do not say things such as "u" or "r"</li>
<li>Please keep the CAP usage to a minimal.</li>
<li>No typing song lyrics in world chat!</li>
<li>No gibberish.</li>
</ol>
<br />
[servrules]
</body>
</html>"})

mob
	proc
		mystlearn()
			set background = 1
			spawn(1)
				while(src.mystt > 0)
				{
					sleep(600)
					src.mystt--
					if(src.mystt > 120)
						src.mystt = null
						break
						return
					if(src.move != 0)
						src.move = 0
					if(src.icon_state != "meditate")
						src.icon_state = "meditate"
					if(src.mystt == 59)
						src.overlays += 'icons/wind.dmi'
						src.underlays += 'icons/mysticaura.dmi'
					if(src.mystt == 30)
						src.overlays -= 'icons/wind.dmi'
						src.underlays -= 'icons/mysticaura.dmi'
						src.underlays += /obj/MysticAuraTop
						src.underlays += /obj/MysticAuraBottom
						src.wspecial = 1
						src.windeffect()
					if(src.mystt <= 0)
						if(src.mystt == null)
							break
						else
							src.underlays -= /obj/MysticAuraTop
							src.underlays -= /obj/MysticAuraBottom
							src.move = 1
							src.wspecial = 0
							src.icon_state = ""
							//for(var/obj/transes/ssj/S in src.contents)
							//	src.contents -= S
							//for(var/obj/transes/giji/E in src.contents)
							//	src.contents -= E
							src.contents += new /obj/transes/mystic
							src.gonessj = 1
							src.mystt = null
							src.mystlearn = 1
							if(!frmyst)
								if(!fused)
									frmyst = "Name: [name], Key: [key], Month: [getMonth(src)], Year: [getYear(src)]"
									world << "<font size = 5><font color = red><b>[src.name] has discovered the transformation: Mystic</font></b>"
							src.mystlearning = 0
							sleep(3000)
							alert("You have learned the Mystic Transformation.")
							break
							return
				}
client/var/obj/radar

mob
	Stat()
		. = ..()
		if(istype(src,/mob/login))
			src.client.command_prompt = "You are currently viewing the Dragonball Online splash screen."
		else
			if(src.follow)
				src.powerlevel.value += 0
			else
				if(istype(src, /mob/characters/))
					var/fstance = currentStyle
					if(fstance == null)
						fstance = "None"
					else
						if(src.icon_state=="")
							spawn(8)
								icon_state = "sparstand"
					if(stamina.value < 0)
						stamina.value = 0
					client.command_prompt = "Dragonball Online, the most advanced Dragonball Z RPG on BYOND!"
					if(hideipan != 1)
						if(statpanel("Vital"))
							stat("-= General Status =-")
							stat(" - Name:", "[name]")
							stat(" - Race:", "[race]")
							stat(" - Hometown:", "[hometown]")
							stat(" - Month:", "[getMonth(src)]")
							stat(" - Year:", "[getYear(src)]")
							stat(" - Inactivity:", "[round(client.inactivity/600)] Minute\s")
							stat("")
							stat("-= Fighting Status =-")
							stat(" - Powerlevel:", "[powerlevel.toText()]")
							stat(" - Ki:", "[ki.toText()]")
							if((ckey in admins)||(ckey in sgms)||(ckey in gms)||(ckey in enfs)||(key == host))
								stat(" - Focus:", "[focus.toText()]")
							stat(" - Skill exp:", "[num2text(skexp,100)] / [num2text(maxskexp,100)]")
							stat(" - Fighting Stance:", "[fstance]")
							stat(" - Stamina:","[stamina.toPercent()]%")
							stat(" - Skill points:", "[skpts]")
							stat(" -ID:","[md5("arwrw54wteg[powerlevel.max_value]996575ydryfgfdf66we4swx[ki.max_value]eawee5rtefsd")]")
							stat("")
							stat("-= Mental Status =-")
							stat(" - Alignment:", "[ap>25?"Good":ap<-25?"Evil":"Neutral"] ([ap>=0?"+":""][ap])")
							stat(" - Anger:", Angercounter)
							stat(" - Fame:", fame)
							stat("")
							stat("-= Misc =-")
							stat(" - Zenni:", "[num2text(src.zenni,100)]")
							stat(" - Banked Zenni:", "[num2text(src.bzenni,100)]")
							stat(" - Kills:", "[kills]")
							stat(" - Deaths:", "[deaths]")

						if((locate(/obj/techs) in skills) && statpanel("Techniques"))
							stat("","Current techniques you have learned:")
							for(var/obj/techs/C in skills)
								if(C)
									stat("",C)

						if((locate(/obj/transes) in contents) && statpanel("Transformations"))
							stat("","Current transformations you have learned:")
							for(var/obj/transes/C in contents)
								if(C)
									stat("",C)

						if(findtext(src.race,"Wizard") && statpanel("Spells"))
							stat("","Current spells you have learned:")
							for(var/obj/spells/I in src.contents)
								if(I)
									stat("",I)

						if(statpanel("Inventory"))
							stat("","Current items in your inventory:")
							for(var/obj/items/O in src.contents)
								if(O)
									stat("",O)
									if(O.worn )
										O.suffix = "<Worn>"
									else
										O.suffix = ""
									if(O.radar )
										O.suffix = "<Location: [src.x], [src.y], [src.z]>"
							for(var/obj/ndragonball/F in src.contents)
								stat("",F)
							for(var/obj/dragonball/D in src.contents)
								stat("",D)

						if((ckey in admins)||(ckey in sgms)||(ckey in gms)||(ckey in enfs)||(key == host))
							if(statpanel("Diagnostics"))
								var/counter = 0
								for(var/client/M)
									counter += 1
								stat("World CPU:","[world.cpu] %")
								stat("World OS:","[world.system_type]")
								stat("")
								stat("World Address:","[world.url]")
								stat("World Time:","[time2text(world.realtime,"Day, Month DD hh:mm:ss YYYY")]")
								stat("Earth Time:", "[Etime] minutes")
								stat("Namek Time:", "[Ntime] minutes")
								stat("Vegeta Time:", "[Vtime] minutes")
								stat("Yardrat Time:", "[Ytime] minutes")
								stat("")
								stat("Earth DBs:", DBsactive?"Active":"Inactive")
								if(!DBsactive)
									stat("Earth DB time to active:", "[edbtime] minutes")
								stat("Namek DBs:", Ndbsactive?"Active":"Inactive")
								if(!Ndbsactive)
									stat("Namek DB time to active:", "[ndbtime] minutes")
								stat("")
								if(rebootrequested)
									stat("Votes for reboot:", "[votesforreboot]/[2 * players.len / 3]([votesforreboot/players.len * 100]%/[2/3*100]%)")
									stat("")
								stat("Players Online:","[counter]")

							if(statpanel("Players"))
								for(var/mob/M in players)
									stat("Name:", M.name)
									stat("Race:", M.race)
									stat("Powerlevel:", "[M.powerlevel.toText()]([M.powerlevel.toPercent()]%)")
									stat("Ki", "[M.ki.toText()]([M.ki.toPercent()]%)")
									stat("Stamina", "[M.stamina.toText()]([M.stamina.toPercent()]%)")
									stat("State:", M.state)
									stat("")

mob
	var
		obj/rages/Angercounter = new()
		anger = 1
		maxanger = 10
	New()

	Stat()
		..()
		src.Angercounter.num = src.anger
		src.Angercounter.UpdateeA()

obj/rages
	name = ""
	icon = 'icons/ragelvl.dmi'
	icon_state = "1"
	var/num = 1
	var/width = 10
	proc/UpdateeA()
		spawn(25)
			if(num < 0)
				num = 0
			else if(num > width)
				num = width
			src.icon_state = "[round(src.num)]"


obj
	afterimage
		name = "Afterimage"
		density = 0

mob
	proc
		rest()
			spawn()
				set background = 1
				while(rest && !client.show_verb_panel && hideipan && !move && !training)
					sleep(rand(10,30))
					stamina.value += stamina.max_value*0.01*rand(3,10)
					if(powerlevel.value >= powerlevel.max_value)
						if(state == "Normal")
							powerlevel.value = powerlevel.max_value
					else
						var/regenamt = powerlevel.max_value * 0.0001
						powerlevel.value += focus.value * regenamt
					if(stamina.value >= stamina.max_value)
						stamina.restore()
						src << "<b>You stop resting."
						icon_state = ""
						move = 1
						attacking = 0
						client.show_verb_panel = 1
						hideipan = 0
						kame = 0
						rest = 0
						sleep(50)
						restime = 0
					if(training)
						rest = 0
						return
				if(!rest)
					client.show_verb_panel = 1
					hideipan = 0
					move = 1
				else if(client.show_verb_panel)
					rest = 0
					hideipan = 0
					move = 1
				else if(!hideipan)
					rest = 0
					client.show_verb_panel = 1
					move = 1
				else if(training)
					rest = 0

		meditate()
			spawn()
				set background = 1
				while(meditate && !client.show_verb_panel && hideipan && !move && !training)
					if(stamina.value>=stamina.max_value)
						stamina.value=stamina.max_value
					else
						stamina.value += stamina.max_value*0.01*rand(1,2)
					if(ki.value<ki.max_value)
						ki.value += ki.max_value*focus.value*0.0001
					focus.add(rand(50,100))
					if(prob(1))
						var/kiin = rand(1,2)
						src << "<b><font size = 2>You feel that you have gained some ki."
						ki.max_value += kiin
					if(!flightlearn)
						FlightLearn()
					if(!auratechlearn)
						AuraTechLearn()
					if(!kitechlearn)
						KiTechLearn()
					if(!focustechlearn)
						FocusLearn()
					if(!aura)
						AuraMake()
					sleep(30)

		advmeditate()
			spawn()
				set background = 1
				while(meditate &&client.show_verb_panel != 1&&hideipan &&src.move == 0&&training == 0)
					if(stamina.value>=stamina.max_value)
						stamina.value=stamina.max_value
					else
						stamina.value += stamina.max_value*0.01*rand(1,12)
					if(ki.value<ki.max_value)
						ki.value += ki.max_value*focus.value*0.0001
					focus.add(rand(60,120))
					if(prob(1))
						var/kiin = rand(3,6)
						src << "<b><font size = 2>You feel that you have gained some ki."
						ki.max_value += kiin
					if(!flightlearn)
						FlightLearn()
					if(!auratechlearn)
						AuraTechLearn()
					if(!kitechlearn)
						KiTechLearn()
					if(!focustechlearn)
						FocusLearn()
					if(!aura)
						AuraMake()
					sleep(35)

		skinrestore()
			spawn()
				set background = 1

				if(src.skin == "Tan")
					src.icon = 'icons/male.dmi'
				else if(src.skin == "Green")
					src.icon = 'icons/namek.dmi'
				else if(src.skin == "Fused")
					src.icon = src.oicon
				else if(src.race == "Changling")
					if(src.upgrade)
						src.icon = 'icons/metal_frieza.dmi'

		aurarestore()
			if(state == "Normal" && auratoggle)
				var/icon/aura = new('icons/whiteaura.dmi')
				aura.Blend(usr.customauracolor)
				underlays += aura
			else if(findtext(state, "Super Saiyan") && !ssjaur)
				underlays += /obj/SSAuraBottom
				overlays  += /obj/SSAuraTop
			else if((state == "Mystic" || state=="Super Namek") && !maura)
				underlays += /obj/MysticAuraBottom
				overlays  += /obj/MysticAuraTop
			else if((state == "Super Android" || state == "Ultra Saiyan") && !aaura)
				underlays += /obj/kkaurabottom
				overlays  += /obj/kkauratop
			else if(state == "Super Perfect Form")
				overlays += 'icons/cell aura.dmi'

		hairrestore()
			spawn()
				set background = 1
				if(findtext(state, "Super Saiyan") && state != "Super Saiyan 3" && state != "Giji Super Saiyan")
					ssjhairrestore()
				else if(state == "Super Saiyan 3")
					overlays += 'icons/ssj3.dmi'
				else if(src.hair == "Spikey")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_black_spikey.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_black_spikey.dmi'
				else if(src.hair == "Trunks")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_trunks.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_trunks.dmi'
				else if(src.hair == "Gohan")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_gohan.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_gohan.dmi'
				else if(src.hair == "Long")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_black_long.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_black_long.dmi'
				else if(src.hair == "Short")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_black_short.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_black_short.dmi'
				else if(src.hair == "Goku")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_goku.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_goku.dmi'
				else if(src.hair == "Vegeta")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_vegeta.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_vegeta.dmi'
				else if(src.hair == "Goten")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_goten.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_goten.dmi'
				else if(src.hair == "Vegito")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_vegito.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_vegito.dmi'
				else if(src.hair == "Recoome")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_reccoom.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_reccoom.dmi'
				else if(src.hair == "Mohawk")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/hair_mohawk.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/hair_mohawk.dmi'
				else if(src.hair == "Short Spikey")
					if(src.customhaircolor)
						var/haircolor = src.customhaircolor
						var/icon/hairicon = new('icons/gtvegeta.dmi')
						hairicon.Blend(haircolor)
						src.overlays += hairicon
					else
						src.overlays += 'icons/gtvegeta.dmi'

	verb
		Who()
			set name = "Who"
			set category = "Other"
			for(var/mob/characters/M in players)
				if(!M.guild)
					usr << "<span class='who'><span class='name'>[M.name]</span> <span class='race'>The [M.race]</span> <span class='key'>([M.key])</span></span>"
				else
					usr << "<span class='who'><span class='name'>[M.name]</span> <span class='race'>The [M.race]</span> <span class='key'>([M.key])</span> <span class='guild'>Guild: <span class='name'>[M.guild]</span> Title: <span class='title'>[M.guild.Get_Title(M)]</span></span></span>"
				usr.counter += 1
			usr << "<span class='who'><span class='online'>Players Online:</span> [counter]</span>"
			usr.counter = 0

obj
	Wraptail
		verb
			Wraptail()
				set name = "Wrap Tail"
				set category = "Other"
				if(usr.tail == 0)
					usr << "You have your tail wrapped already!"
					return
				else
					if(usr.state == "Oozaru" || usr.state == "Golden Oozaru")
						alert("You can't wrap your tail right now!")
						return
					else if(usr.state == "Super Saiyan 3"||usr.state == "Legendary Super Saiyan")
						var/obj/ssjtail/B = new()
						usr.overlays -= B
						usr << "You wrap your tail."
						usr.tail = 0
					else
						var/obj/tail/A = new(null)
						usr.overlays -= A
						usr << "You wrap your tail."
						usr.tail = 0

obj
	Unwraptail
		verb
			Unwraptail()
				set name = "Unwrap Tail"
				set category = "Other"
				if(usr.tail )
					usr << "You have your tail unwrapped already!"
				else
					if(usr.state == "Super Saiyan 3"||usr.state == "Legendary Super Saiyan")
						var/obj/ssjtail/B = new(null)
						usr.overlays += B
						usr << "You unwrap your tail."
						usr.tail = 1
					else
						if(usr.state == "Super Saiyan 4")
							usr << "<B>Your tail is already automatically out!"
						else
							var/obj/tail/A = new()
							usr.overlays += A
							usr << "You unwrap your tail."
							usr.tail = 1
obj
	playeraura
		verb
			playeraura()
				set name = "Aura On/Off"
				set category = "Other"

				if(usr.state =="Giji Super Saiyan"||usr.state == "Super Saiyan"||usr.state == "Legendary Super Saiyan"||usr.state == "Ultra Super Saiyan"||usr.state == "Super Saiyan 2"||usr.state == "Super Saiyan 3"||usr.state == "Super Saiyan 4")
					if(usr.ssjfp )
						if(usr.ssjaur !=1)
							view(6) << 'sounds/revert.wav'
							usr.underlays -= /obj/SSAuraBottom
							usr.overlays -= /obj/SSAuraTop
							usr.ssjaur = 1
							usr << "\red You turn off your [usr.state] Aura"
						else
							view(6) << 'sounds/aura.wav'
							usr.underlays += /obj/SSAuraBottom
							usr.overlays += /obj/SSAuraTop
							usr.ssjaur = 0
							usr << "\red You turn on your [usr.state] Aura"
					else
						usr << "You need full control of Super Saiyan to turn off your aura!"

				else
					if(usr.auraquest)
						if(usr.state == "Mystic"||usr.state=="Super Namek")
							if(usr.maura !=1)
								view(6) << 'sounds/revert.wav'
								usr.underlays -= /obj/MysticAuraBottom
								usr.underlays -= /obj/MysticAuraTop
								usr.maura = 1
								usr << "\red You turn off your [usr.state] Aura"
							else
								view(6) << 'sounds/aura.wav'
								usr.underlays += /obj/MysticAuraTop
								usr.underlays += /obj/MysticAuraBottom
								usr.maura = 0
								usr << "\red You turn on your [usr.state] Aura"

						else if(usr.state == "Bebi Super Saiyan")
							if(usr.ssjaur !=1)
								view(6) << 'sounds/revert.wav'
								usr.underlays -= /obj/SSAuraBottom
								usr.overlays -= /obj/SSAuraTop
								usr.ssjaur = 1
								usr << "\red You turn off your [usr.state] Aura"
							else
								view(6) << 'sounds/aura.wav'
								usr.underlays += /obj/SSAuraBottom
								usr.overlays += /obj/SSAuraTop
								usr.ssjaur = 0
								usr << "\red You turn on your [usr.state] Aura"
						else if(usr.state == "Super Android"||usr.state == "Ultra Saiyan")
							if(usr.aaura != 1)
								view(6) << 'sounds/revert.wav'
								usr.overlays -= /obj/kkauratop
								usr.underlays -= /obj/kkaurabottom
								usr.aaura = 1
								usr << "\red You turn on your [usr.state] Aura"
							else
								view(6) << 'sounds/aura.wav'
								usr.overlays += /obj/kkauratop
								usr.underlays += /obj/kkaurabottom
								usr.aaura = 0
								usr << "\red You turn on your [usr.state] Aura"
						else
							if(usr.auratoggle)
								usr.auratoggle = 0
								view(6) << 'sounds/revert.wav'
								usr << "<b><font color = red>The aura around your body dissappears."
								var/icon/aura = new('icons/whiteaura.dmi')
								aura.Blend(usr.customauracolor)
								usr.underlays -= aura
							else
								var/icon/aura = new('icons/whiteaura.dmi')
								aura.Blend(usr.customauracolor)
								usr.underlays += aura
								view(6) << 'sounds/aura.wav'
								usr << "<b><font color=red>An aura surrounds your body."
								usr.auratoggle = 1
					else
						if(!(usr.state == "Normal" || usr.state == "Semi-Perfect Form" || usr.state == "Perfect Form"))
							alert("You need to complete the aura quest!")
						else
							if(usr.auratoggle)
								usr.auratoggle = 0
								view(6) << 'sounds/revert.wav'
								usr << "<b><font color = red>The aura around your body dissappears."
								var/icon/aura = new('icons/whiteaura.dmi')
								aura.Blend(usr.customauracolor)
								usr.underlays -= aura
							else
								var/icon/aura = new('icons/whiteaura.dmi')
								aura.Blend(usr.customauracolor)
								usr.underlays += aura
								view(6) << 'sounds/aura.wav'
								usr << "<b><font color=red>An aura surrounds your body."
								usr.auratoggle = 1

obj
	ssauragrp
		New()
			src.overlays += new /obj/ssauratop
			src.overlays += new /obj/ssaurabottom

obj
	ssauratop
		icon = 'icons/ssjaura.dmi'
		icon_state = "top"
		layer = 8
		pixel_y = 32

obj
	ssaurabottom
		icon = 'icons/ssjaura.dmi'
		icon_state = "bottom"

obj
	kkauratop
		icon = 'icons/kaioaura.dmi'
		icon_state = "top"
		layer = 9
		pixel_y = 32

obj
	kkaurabottom
		icon = 'icons/kaioaura.dmi'
		icon_state = "bottom"

mob
	verb
		drop_gold()
			set category = "Other"
			set name = "Drop Zenni"
			var/dropgold = input("How much Zenni do you want to drop? (You have [num2text(usr.zenni,100)] Zenni!)","Drop Zenni",) as num
			if(dropgold<=0)
				usr << "You have to drop ATLEAST 1 Zenni!"
				return
			if(usr.fused )
				usr << "You can't drop Zenni!"
				return
			if(dropgold>usr:zenni)
				usr << "You dont have that much Zenni to drop."
				return
			else
				var/O = new /obj/zennibag(usr.loc)
				O:zenni = dropgold
				usr.zenni -= dropgold
				usr << "You drop  <B>[dropgold]</b> zenni"
				view(6) << "[usr] drops <b>[dropgold] zenni."
				view(6) << 'sounds/zenni.wav'
				spawn(1200)
					del(O)
				return

obj/zennibag
	name = "Pile of Zenni"
	icon = 'icons/gold.dmi'
	New()
		. = ..()
		spawn(6000)
			del(src)
	var
		zenni
	verb
		Get()
			set category = null
			set src in oview(1)
			if(!istype(src)) return
			usr << "You get <b>[src.zenni]</b> zenni."
			usr << 'sounds/zenni.wav'
			if(((usr:zenni + src:zenni) >= 1e+30))
				usr:zenni = 1e+30
			else if(((usr:zenni + src:zenni) <= 0))
				usr:zenni = 0
			else
				usr:zenni += src.zenni
				del(src)
		Amount()
			set category = null
			set name = "Check Amount"
			set src in view(6)
			usr << "This pile of zenni contains about [src.zenni] zennies!"
mob
	other
		saiyaman
			name = "(NPC) Great Saiyaman"
			icon = 'icons/saiyaman.dmi'
			npc = 1
			density = 1
			icon_state = ""
			New()
				..()
				spawn(0)
					Wander()
			proc/Wander()
				while(src)
				{
					step_rand(src)
					sleep(25)
				}
			verb/Talk()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					if(usr.race == "Half-Saiyan" && usr.powerlevel.max_value >= 2600000 && usr.sma != 1)
						usr.sma = 1
						usr.npctalk = 0
						alert("Hey, you remind me of myself when I was younger. I hear that Bulma is almost finished making another Saiyaman watch. Maybe ou should visit her sometime?")
					else
						var/rtalk = rand(1,11)
						set src in oview(1)
						set name = "Talk"
						set category = "Other"
						usr.npctalk = 1
						New_Tech = "Cosmic Halo"
						if(rtalk == 1)
							usr.npctalk = 0
							alert("Great Saiyaman: I am the Great Saiyaman!")
						if(rtalk == 2)
							usr.npctalk = 0
							alert("Great Saiyaman: Don't be feared citizen in the city, I'm here to help!")
						if(rtalk == 3)
							usr.npctalk = 0
							alert("Great Saiyaman: Is there troublesome in a city?")
						if(rtalk == 4)
							usr.npctalk = 0
							alert("Great Saiyaman: Are you introuble, citizen?")
						if(rtalk == 5)
							usr.npctalk = 0
							alert("Great Saiyaman: With me here, there's no need for worries!")
						if(rtalk == 6)
							usr.npctalk = 0
							alert("Great Saiyaman: Respect is earned, not given!")
						if(rtalk == 7)
							usr.npctalk = 0
							alert("Great Saiyaman: Be a helpful citizen!")
						if(rtalk == 8)
							usr.npctalk = 0
							alert("Great Saiyaman: Do you sense someone in danger?")
						if(rtalk == 9)
							usr.npctalk = 0
							alert("Great Saiyaman: Hi!  Just passing through!")
						if(rtalk == 10)
							usr.npctalk = 0
							alert("Great Saiyaman: Hmm, evil shall not be toyed with!")
						if(rtalk == 11)
							usr.npctalk = 0
							alert("great Saiyaman: You have [(usr.ssjfpt*6+2 /60/20)] hours left for SSJFP! Hope that helps you with your journey.")
mob
	other
		saiyagirl
			name = "(NPC) Great Saiyagirl"
			icon = 'icons/saiyagirl.dmi'
			npc = 1
			density = 1
			icon_state = ""
			New()
				..()
				spawn(0)
					Wander()
			proc/Wander()
				while(src)
				{
					step_rand(src)
					sleep(25)
				}
			verb/Talk()
				set src in oview(1)
				set name = "Talk"
				set category = "Other"
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					if(usr.race == "Half-Saiyan" && usr.powerlevel.max_value >= 2000000 && usr.smwa != 1)
						usr.smwa = 1
						usr.npctalk = 0
						alert("Hello there, you seem strong. When you get a bit stronger, please talk to Goha. er, I mean Saiyaman")
					var/rtalk = rand(1,11)
					usr.npctalk = 1
					if(rtalk == 1)
						usr.npctalk = 0
						alert("Great Saiyagirl: I am the Great Saiyagirl!")
					if(rtalk == 2)
						usr.npctalk = 0
						alert("Great Saiyagirl: Don't be feared citizen in the city, I'm here to help!")
					if(rtalk == 3)
						usr.npctalk = 0
						alert("Great Saiyagirl: Is there troublesome in a city?")
					if(rtalk == 4)
						usr.npctalk = 0
						alert("Great Saiyagirl: Are you introuble, citizen?")
					if(rtalk == 5)
						usr.npctalk = 0
						alert("Great Saiyagirl: With me here, there's no need for worries!")
					if(rtalk == 6)
						usr.npctalk = 0
						alert("Great Saiyagirl: Respect is earned, not given!")
					if(rtalk == 7)
						usr.npctalk = 0
						alert("Great Saiyagirl: Be a helpful citizen!")
					if(rtalk == 8)
						usr.npctalk = 0
						alert("Great Saiyagirl: Do you sense someone in danger?")
					if(rtalk == 9)
						usr.npctalk = 0
						alert("Great Saiyagirl: Hi!  Just passing through!")
					if(rtalk == 10)
						usr.npctalk = 0
						alert("Great Saiyagirl: Hmm, evil shall not be toyed with!")
					if(rtalk == 11)
						usr.npctalk =0
						alert("Great Saiyagirl: You have [(usr.ssjfpt/7*1.6 /60/20 )] hours left for SSJFP! Hope that helps you with your journey.")

mob
	training
		bubbles
			name = "(NPC) Bubbles the Monkey"
			icon = 'icons/bubblesmonkey.dmi'
			npc = 1
			dead = 1
			density = 1
			icon_state = ""
			New()
				..()
				spawn(0)
					Wander()
			Click()
				if(src in oview(1))
					Catch()
			proc/Wander()
				while(src)
				{
					step_rand(src)
					sleep(10)
				}
			verb/Catch()
				set src in oview(2)
				set name = "Catch"
				set category = null
				if(usr.bubbcaught)
					alert("You have caught me already!")
				else if(usr.kaistart == 1)
					usr.bubbcaught = 1
					usr.kaitrain = 1
					usr.powerlevel.max_value += 300
					usr.ki.max_value += 300
					alert("You have caught Bubbles!")
				else
					alert("You must talk to King Kai, before catching me.")
		gregory
			name = "(NPC) Gregory"
			icon = 'icons/gregory.dmi'
			npc = 1
			dead = 1
			move=1
			density = 1
			icon_state = ""
			New()
				..()
				Wander()
			Click()
				if(src in oview(1))
					Catch()
			proc/Wander()
				while(src)
				{
					step_rand(src)
					sleep(5)
				}
			verb/Catch()
				set src in oview(1)
				set category = null
				set name = "Catch"
				if(usr.gregcaught)
					alert("You have caught me already!")
				else if(usr.kaistart == 2)
					usr.gregcaught = 1
					usr.kaifinish = 1
					usr.powerlevel.max_value += 750
					usr.ki.max_value += 750
					alert("You have caught Gregory!")
				else
					alert("You must talk to King Kai, before catching me.")

mob
	other
		westkai
			name = "(NPC) West Kai"
			icon = 'icons/westkai.dmi'
			icon_state = ""
			npc = 1
			dead = 1
			density = 1
			DblClick()
				if(src in oview(1))
					Talk()
			verb
				Talk()
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						set src in oview(1)
						set name = "Talk"
						set category = "Other"
						usr.npctalk = 1
						alert("West Kai: Greetings, [usr]!")
						if(usr.strain == 3)
							if(usr.sfinish)
								alert("West Kai: Great job, you have completed my training!")
								switch(alert("Do you want to learn the technique, 'Flame Form'?","West Kai","Yes","No"))
									if("Yes")
										usr.skills += new /obj/techs/fform
										usr.kame = 0
										usr.npctalk = 0
										usr.move = 1
										alert("I shall now teach you, 'Flame Form'!")
									if("No")
										usr.npctalk = 0
										alert("West Kai: Alright then!")
							else
								usr.npctalk = 0
								alert("Hmm, you look okay to me!")
						else if(usr.strain == 2)
							switch(alert("Do you wish to restart training with Pikkon again? Please note that the time to reset your fight will take 10-30 UNDISRUPTED minutes!",null,"No","Yes"))
								if("No")
									usr.npctalk = 0
									return
								else
									usr.npctalk = 0
									usr << "You will be notified when you can cmoe back to me and ask to fight against Pikkon!"
									sleep(rand(6000,18000))
									usr.strain = 0
									alert("West Kai: You can come back to me now to fight against Pikkon!")
									return
						else if(usr.strain == 1)
							alert("Please ask Pikkon for his training!")
							usr.npctalk = 0
						else if(!usr.sfinish)
							switch(alert("Do you wish to undergo my training?","West Kai","Yes","No"))
								if("Yes")
									usr.strain = 1
									usr.npctalk = 0
									alert("West Kai: For your first phase of training you need to fight Pikkon, talk to him near the training arena.")

								if("No")
									usr.npctalk = 0
									alert("West Kai: Goodbye!")
						else
							usr.npctalk = 0
							..()

		kabito
			name = "(NPC) Kabito"
			icon = 'icons/kabito.dmi'
			npc = 1
			dead = 1
			density = 1
			icon_state = " "
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk)
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Kabito: Greetings, [usr]")
						usr.npctalk = 0
						switch(input("What are you here for?" , "Kabito", text) in list ("Talk", "Nothing"))
							if("Talk")
								alert("Kabito: Oh the Supreme Kai, You will find him to the north")
							if("Nothing")
								alert("Kabito: Very well, Be on your way!")
		southkai
			name = "(NPC) South Kai"
			icon = 'icons/South Kai.dmi'
			npc = 1
			dead = 1

		kingkai
			name = "King Kai"
			icon = 'icons/mobs.dmi'
			npc = 1
			dead = 1
			density = 1
			icon_state = "kingkai"
			verb
				GrandKai()
					set name = "Go to Grand Kai's Planet"
					set category = "Other"
					set src in oview(1)
					view(6) << 'sounds/it.wav'
					usr.loc=locate(58,20,14)
					usr.icon_state = ""
					usr.density = 1
					usr.flight = 0
//					usr.kkp = 0
					alert("You go to Grand Kai's Planet.")
				SupremeKai()
					set name = "Go to Supreme Kai's Planet"
					set category = "Other"
					set src in oview(1)
					if(usr.powerlevel.max_value <= 350000)
						usr << "<b>You are not strong enough to proceed to advanced training."
					else
						view(6) << 'sounds/it2.wav'
						usr.loc=locate(70,15,15)
						usr.icon_state = ""
						usr.density = 1
						usr.flight = 0
						usr.skuse = 1
//						usr.kkp = 0
						alert("You go to Supreme Kai's Planet.")



				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						if(usr.kaifinish == 0)
							alert("Greetings, I am King Kai.")
							switch(alert("Do you wish to undergo my training?","King Kai","Yes","No"))
								if("Yes")
									if(!usr.kaitrain)
										usr.npctalk = 0
										alert("Alrighty then! Go capture Bubbles then come talk to me again.")
										usr.kaistart = 1
									else
										usr.npctalk = 0
										alert("Alrighty! For your next phase of training, Go capture Gregory then come talk to me again.")
										usr.kaistart = 2

								if("No")
									usr.npctalk = 0
									alert("Very well, then")
						else
							alert("You have completed my training! I will now send you back to earth!")
							usr.npctalk = 0
							usr.move = 0
							if(!usr.kaiolearn)
								usr << "You need 20 skill points!"
								switch(alert("King Kai: Do you wish to learn 'Kaio-ken' & 'Kai Fighting Stance'?","King Kai","Yes", "No"))
									if("Yes")
										if(usr.powerlevel.max_value >= 12000 && usr.skpts >= 20 && usr.kicntrl)
											usr.skills += new /obj/techs/Kaioken
											usr.contents += new /styles/kai
											usr.skpts -= 20
											usr << "<B>You have learned, 'Kaio-ken'!"
											usr << "<B>You have learned, 'Kai Fighting Style'!"
											usr.kaiolearn = 1
											usr.kaioken = 0
										else
											alert("King Kai: You are not skilled enough to learn this!")
							if(!usr.spiritlearn)
								usr << "You need 30 skill points!"
								switch(alert("King Kai: Do you wish to learn 'Spirit Bomb'?","King Kai","Yes", "No"))
									if("Yes")
										if(usr.powerlevel.max_value >= 14000 && usr.skpts >= 30 && usr.kicombt)
											usr.skills += new /obj/techs/spiritbomb
											usr.skpts -= 30
											usr << "<B>You have learned, 'Spirit Bomb'!"
											usr.spiritlearn = 1
											usr.sbcharge = 0
											usr.kame = 0
										else
											alert("King Kai: You are not skilled enough to learn this!")
							usr << "<B><FONT COLOR = BLUE>You have been revived & restored!"
							view(6) << 'sounds/it.wav'
							usr << "<FONT COLOR = RED>[usr]: </FONT>What? I have to run Snake Way again!?"
							usr << "<FONT COLOR = YELLOW>Run back to the beginning of Snake Way to be sent back to your hometown, or if you have a teleportation technique teleport anywhere else to get out of the Otherworld."
							usr.loc=locate(27,99,19)
							usr.bubblesdone = 0
//							usr.kkp = 0
							usr.kaitrain = 0
							usr.kaistart = 0
							usr.snakeway = 1
							usr.kaifinish = 0
							usr.bubbcaught = 0
							usr.gregcaught = 0
							usr.ki.restore()
							usr.powerlevel.restore()
							usr.overlays -= 'icons/halo.dmi'
							usr.overlays -= /obj/halo
							usr.dead = 0
							usr.move = 1
							usr.npctalk = 0
//							usr.kkp = 0
		dende
			name = "(NPC) Dende"
			icon = 'icons/mobs.dmi'
			race = "Namek"
			npc = 1
			icon_state = "dende"
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					switch(input("Dende: Hello, [usr]! What do you need?", "Dende",text) in list ("Talk","Earth Dragonballs","Heal","Learn Techniques","Learn Transformations","Cancel"))
						if("Earth Dragonballs")
							usr.npctalk=0
							if(edbtime == null)
								alert("The Earth Dragonballs are active!")
							else
								alert("The Earth Dragonballs will be active around [edbtime] minutes.")
						if("Talk")
							usr.npctalk = 0
							alert("Dende: You can use the Hyperbolic Time Chamber for training, or you can talk to Piccolo for some techniques!")
							alert("Dende: You have [(usr.ssjfpt/99-2) /60/20] hours left for SSJFP! Hope that helps you with your journey.")

						if("Heal")
							if(usr.dheal > 0)
								usr.npctalk = 0
								alert("You have [usr.dheal] minutes left befre being healed by me again!")
								return
							else
								usr.move = 0
								usr.kame = 1
								usr.attacking = 1
								usr.client.show_verb_panel = 0
								usr.hideipan = 1
								usr.overlays += 'icons/heal.dmi'
								usr << "<B>You begin getting healed by Dende."
								sleep(175)
								usr.powerlevel.restore()
								usr.ki.restore()
								usr.stamina.restore()
								usr.client.show_verb_panel = 1
								usr.hideipan = 0
								usr.attacking = 0
								usr.kame = 0
								usr << "<B>You finish being healed by Dende."
								usr.overlays -= 'icons/heal.dmi'
								usr.move = 1
								usr.npctalk = 0
								usr.dheal = rand(60,120)
								usr.dhealt()
								alert("Dende: If you need more healing, feel free to ask again!")
								return

						if("Learn Techniques")
							if(usr.race == "Namek")
								switch(alert("Dende: Do you wish to learn, 'Heal'?","Dende","Yes", "No"))
									if("Yes")
										if(usr.powerlevel.max_value < 25000)
											usr.npctalk = 0
											alert("Dende: You are too weak to learn this technique!")
										else
											usr.npctalk = 0
											usr.skills += new /obj/techs/namekheal
											usr << "<B>You have learned, 'Heal'!"

							else
								usr.npctalk = 0
								alert("Dende: Sorry, there is nothing for me to teach you!")

						if("Learn Transformations")
							if(usr.race == "Namek")
								switch(alert("Dende: Do you wish to learn, 'Super Namek'?","Dende","Yes", "No"))
									if("Yes")
										if(usr.nameklearn )
											alert("You already learned Super Namek!")
											usr.npctalk =0
										else
											if(usr.powerlevel.max_value < 1200000)
												usr.npctalk = 0
												alert("Dende: You are too weak to learn this transformation!")
											else
												usr.npctalk = 0
												usr.contents += new /obj/transes/snj
												usr.nameklearn = 1
												if(!frns)
													if(!usr.fused)
														frns = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
														world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Namek</font></b>"
												usr << "<B>You have learned, 'Super Namek'!"
							else
								usr.npctalk = 0
								alert("Dende: Sorry, there is nothing for me to teach you!")

						if("Cancel")
							usr.npctalk = 0
							alert("Dende: Goodbye!")
mob
	other
		Man
			icon = 'icons/mobs.dmi'
			icon_state = "man"
			npc = 1
			race = "Earthling"
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1
					if(usr.mquest )
						for(var/obj/items/dagger/O in usr.contents)
							if(O)
								usr.npctalk = 0
								usr.zenni += 300
								usr.powerlevel.max_value += 500
								usr.ki.max_value += 500
								usr << "<B>You recieve 300 Zenni!"
								usr << "<B>You have gained 500 powerlevel!"
								usr << "<B>You have gained 500 ki!"
								del(O)
								usr.mquest = 2
								alert("Man: You have found my dagger! Thanks!")

					else
						if(usr.mquest == 0)
							usr.npctalk = 0
							alert("Man: Hello, [usr]!")
							switch(alert("Can you help me find my dagger?","Man","Yes", "No"))
								if("Yes")
									usr.mquest = 1
									usr.npctalk = 0
									alert("Man: I left the dagger around mountains, I saw some kind of cat-type person there too. We don't want kids getting a knife, so go find it!")

								if("No")
									usr.npctalk = 0
									alert("Man: Heh, alright! Don't blame me if a kid kills himself over finding a dagger!")
						else
							usr.npctalk = 0
							alert("Man: You have already found my dagger!")



mob
	other
		Shopkeeper2
			icon = 'icons/mobs.dmi'
			icon_state = "1"
			npc = 1
			race = "Earthling"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Shopkeeper",text) in list ("Class I Scouter (Red) (1500)","Class I Scouter (Yellow) (1500)","Class I Scouter (Blue) (1500)","Class I Scouter (Green) (1500)","Class II Scouter (Red) (2000)","Class II Scouter (Blue) (2000)","Class II Scouter (Yellow) (2000)","Class II Scouter (Green) (2000)","Cancel"))
							if("Class I Scouter (Red) (1500)")
								if(!usr) return
								if(usr.zenni <= 1499)
									usr << "<b>You need 1500 zenni!"
								if(usr.zenni >= 1500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 1500
									usr << "<b>You get a Class I Scouter (Red)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c1scouterr

							if("Class I Scouter (Yellow) (1500)")
								if(!usr) return
								if(usr.zenni <= 1499)
									usr << "<b>You need 1500 zenni!"
								if(usr.zenni >= 1500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 1500
									usr << "<b>You get a Class I Scouter (Yellow)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c1scoutery

							if("Class I Scouter (Blue) (1500)")
								if(!usr) return
								if(usr.zenni <= 1499)
									usr << "<b>You need 1500 zenni!"
								if(usr.zenni >= 1500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 1500
									usr << "<b>You get a Class I Scouter (Blue)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c1scouterb

							if("Class I Scouter (Green) (1500)")
								if(!usr) return
								if(usr.zenni <= 1499)
									usr << "<b>You need 1500 zenni!"
								if(usr.zenni >= 1500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 1500
									usr << "<b>You get a Class I Scouter (Green)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c1scouterg

							if("Class II Scouter (Green) (2000)")
								if(!usr) return
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2000
									usr << "<b>You get a Class II Scouter (Green)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c2scouterg

							if("Class II Scouter (Red) (2000)")
								if(!usr) return
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2000
									usr << "<b>You get a Class II Scouter (Red)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c2scouterr

							if("Class II Scouter (Yellow) (2000)")
								if(!usr) return
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2000
									usr << "<b>You get a Class II Scouter (Yellow)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c2scoutery

							if("Class II Scouter (Blue) (2000)")
								if(!usr) return
								if(usr.zenni <= 1999)
									usr << "<b>You need 2000 zenni!"
								if(usr.zenni >= 2000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2000
									usr << "<b>You get a Class II Scouter (Blue)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c2scouterb

							if("Cancel")
								alert("Goodbye! Come again!")

					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")
mob
	other
		SaiyanShopkeeper
			icon = 'icons/sci.dmi'
			icon_state = ""
			npc = 1
			dead = 1
			race = "Saiyan"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Saiyan Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Saiyan Shopkeeper",text) in list ("Class I Saiyan Armor (Type I) (20000)","Class I Saiyan Armor (Type II) (20000)","Class I Saiyan Armor (Type III) (20000)","Class II Saiyan Armor (Type I) (30000)","Class II Saiyan Armor (Type II) (30000)","Class II Saiyan Armor (Type III) (30000)","Class III Saiyan Armor (Type I) (50000)","Class III Saiyan Armor (Type II) (50000)","Class III Saiyan Armor (Type III) (50000)","Cancel"))
							if("Class I Saiyan Armor (Type I) (20000)")
								if(!usr) return
								if(usr.zenni <= 19999)
									usr << "<b>You need 20000 zenni!"
								if(usr.zenni >= 20000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 20000
									usr << "<b>You get a Class I Saiyan Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor1c1

							if("Class I Saiyan Armor (Type II) (20000)")
								if(!usr) return
								if(usr.zenni <= 19999)
									usr << "<b>You need 20000 zenni!"
								if(usr.zenni >= 20000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 20000
									usr << "<b>You get a Class I Saiyan Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor2c1

							if("Class I Saiyan Armor (Type III) (20000)")
								if(!usr) return
								if(usr.zenni <= 19999)
									usr << "<b>You need 20000 zenni!"
								if(usr.zenni >= 20000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 20000
									usr << "<b>You get a Class I Saiyan Armor (Type III)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor3c1

							if("Class II Saiyan Armor (Type I) (30000)")
								if(!usr) return
								if(usr.zenni <= 29999)
									usr << "<b>You need 30000 zenni!"
								if(usr.zenni >= 30000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 30000
									usr << "<b>You get a Class II Saiyan Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor1c2

							if("Class II Saiyan Armor (Type II) (30000)")
								if(!usr) return
								if(usr.zenni <= 29999)
									usr << "<b>You need 30000 zenni!"
								if(usr.zenni >= 30000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 30000
									usr << "<b>You get a Class II Saiyan Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor2c2

							if("Class II Saiyan Armor (Type III) (30000)")
								if(!usr) return
								if(usr.zenni <= 29999)
									usr << "<b>You need 30000 zenni!"
								if(usr.zenni >= 30000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 30000
									usr << "<b>You get a Class II Saiyan Armor (Type III)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor3c2

							if("Class III Saiyan Armor (Type I) (50000)")
								if(!usr) return
								if(usr.zenni <= 49999)
									usr << "<b>You need 50000 zenni!"
								if(usr.zenni >= 50000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 50000
									usr << "<b>You get a Class III Saiyan Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor1c3

							if("Class III Saiyan Armor (Type II) (50000)")
								if(!usr) return
								if(usr.zenni <= 49999)
									usr << "<b>You need 50000 zenni!"
								if(usr.zenni >= 50000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 50000
									usr << "<b>You get a Class III Saiyan Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor2c3

							if("Class III Saiyan Armor (Type III) (50000)")
								if(!usr) return
								if(usr.zenni <= 49999)
									usr << "<b>You need 50000 zenni!"
								if(usr.zenni >= 50000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 50000
									usr << "<b>You get a Class III Saiyan Armor (Type III)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/saiyan_armor3c3

							if("Cancel")
								alert("Goodbye! Come again!")

					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")

mob
	other
		SaiyanShopkeeper2
			icon = 'icons/sci.dmi'
			icon_state = ""
			npc = 1
			dead = 1
			race = "Saiyan"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Saiyan Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Saiyan Shopkeeper",text) in list ("Class III Scouter (Red) (3000)","Class III Scouter (Blue) (3000)","Class III Scouter (Yellow) (3000)","Class III Scouter (Green) (3000)","Class IV Scouter (Red) (5000)","Class IV Scouter (Blue) (5000)","Class IV Scouter (Green) (5000)","Class IV Scouter (Yellow) (5000)","Cancel"))
							if("Class III Scouter (Red) (3000)")
								if(!usr) return
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 3000
									usr << "<b>You get a Class III Scouter (Red)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c3scouterr
							if("Class III Scouter (Blue) (3000)")
								if(!usr) return
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 3000
									usr << "<b>You get a Class III Scouter (Blue)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c3scouterb
							if("Class III Scouter (Yellow) (3000)")
								if(!usr) return
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 3000
									usr << "<b>You get a Class III Scouter (Yellow)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c3scoutery
							if("Class III Scouter (Green) (3000)")
								if(!usr) return
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 3000
									usr << "<b>You get a Class III Scouter (Green)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c3scouterg
							if("Class IV Scouter (Red) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get a Class III Scouter (Red)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c4scouterr
							if("Class IV Scouter (Blue) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get a Class III Scouter (Blue)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c4scouterb
							if("Class IV Scouter (Yellow) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get a Class III Scouter (Yellow)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c4scoutery
							if("Class IV Scouter (Green) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get a Class III Scouter (Green)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/c4scouterg

							if("Cancel")
								alert("Goodbye! Come again!")

					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")
mob
	other
		Shopkeeper4
			icon = 'icons/mobs.dmi'
			icon_state = "store"
			npc = 1
			race = "Earthling"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Shopkeeper",text) in list ("Class I Earth Armor (Type I) (5000)","Class I Earth Armor (Type II) (5000)","Class I Earth Armor (Type III) (5000)","Class II Earth Armor (Type I) (10000)","Class II Earth Armor (Type II) (10000)","Class II Earth Armor (Type III) (10000)","Class III Earth Armor (Type I) (16000)","Class III Earth Armor (Type II) (16000)","Class III Earth Armor (Type III) (16000)","Boxing Gloves (500)","Cancel"))
							if("Class I Earth Armor (Type I) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get Class I Earth Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor1c1

							if("Class I Earth Armor (Type II) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get Class I Earth Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor2c1

							if("Class I Earth Armor (Type III) (5000)")
								if(!usr) return
								if(usr.zenni <= 4999)
									usr << "<b>You need 5000 zenni!"
								if(usr.zenni >= 5000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get Class I Earth Armor (Type III)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor3c1

							if("Class II Earth Armor (Type I) (10000)")
								if(!usr) return
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 10000
									usr << "<b>You get Class II Earth Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor1c2

							if("Class II Earth Armor (Type II) (10000)")
								if(!usr) return
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 10000
									usr << "<b>You get Class II Earth Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor2c2

							if("Class II Earth Armor (Type III) (10000)")
								if(!usr) return
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 10000
									usr << "<b>You get Class II Earth Armor (Type III)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor3c2

							if("Class III Earth Armor (Type I) (16000)")
								if(!usr) return
								if(usr.zenni <= 15999)
									usr << "<b>You need 16000 zenni!"
								if(usr.zenni >= 16000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 16000
									usr << "<b>You get Class III Earth Armor (Type I)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor1c3

							if("Class III Earth Armor (Type II) (16000)")
								if(!usr) return
								if(usr.zenni <= 15999)
									usr << "<b>You need 16000 zenni!"
								if(usr.zenni >= 16000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 16000
									usr << "<b>You get Class III Earth Armor (Type II)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/earth_armor2c3

							if("Boxing Gloves (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									usr << "<b>You get Boxing Gloves!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/boxing


							if("Cancel")
								alert("Goodbye! Come again!")

					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")
mob
	other
		Shopkeeper5
			icon = 'icons/mobs.dmi'
			icon_state = ""
			npc = 1
			race = "Earthling"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Shopkeeper",text) in list ("Buu Underclothing (250)","Wizard Underclothing (250)","Buu Gi (250)","Wizard Gi (250)","Buu Cape (500)","Wizard Cape (500)","Buu Vest (500)","Buu Boots & Gloves (300)","Wizard Boots & Gloves (300)","Cancel"))
							if("Wizard Underclothing (250)")
								if(!usr) return
								if(usr.zenni <= 249)
									usr << "<b>You need 250 zenni!"
								if(usr.zenni >= 250)
									usr << "Zenni taken & recieved."
									usr.zenni -= 250
									switch(alert("Do you want to customize the color of the 'Underclothing'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-wizard underclothing.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/wizardunderclothing
											item.icon = clothicon
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/wizardunderclothing

							if("Buu Underclothing (250)")
								if(!usr) return
								if(usr.zenni <= 249)
									usr << "<b>You need 250 zenni!"
								if(usr.zenni >= 250)
									usr << "Zenni taken & recieved."
									usr.zenni -= 250
									switch(alert("Do you want to customize the color of the 'Underclothing'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-BuuUnderclothing1.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/buuunderclothing
											item.icon = clothicon
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/buuunderclothing

							if("Buu Gi (250)")
								if(!usr) return
								if(usr.zenni <= 249)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 250)
									usr << "Zenni taken & recieved."
									usr.zenni -= 250
									switch(alert("Do you want to customize the color of the 'Gi'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-buugi.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/buugi
											item.icon = clothicon
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/buugi

							if("Wizard Gi (250)")
								if(!usr) return
								if(usr.zenni <= 249)
									usr << "<b>You need 250 zenni!"
								if(usr.zenni >= 250)
									usr << "Zenni taken & recieved."
									usr.zenni -= 250
									switch(alert("Do you want to customize the color of the 'Gi'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-wizard gi.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/wizardgi
											item.icon = clothicon
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/wizardgi

							if("Buu Vest (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Vest'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-buuvest.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/buuvest
											item.icon = clothicon
											usr << "<b>You get a Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/buuvest

							if("Buu Cape (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Cape'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-buucape.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/buucape
											item.icon = clothicon
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/buucape

							if("Wizard Cape (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Cape'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-wizard cape.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/wizardcape
											item.icon = clothicon
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/wizardcape

							if("Buu Boots & Gloves (300)")
								if(!usr) return
								if(usr.zenni <= 299)
									usr << "<b>You need 300 zenni!"
								if(usr.zenni >= 300)
									usr << "Zenni taken & recieved."
									usr.zenni -= 300
									switch(alert("Do you want to customize the color of the 'Boots & Gloves'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-buuboots.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/buuboots
											item.icon = clothicon
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/buuboots

							if("Wizard Boots & Gloves (300)")
								if(!usr) return
								if(usr.zenni <= 299)
									usr << "<b>You need 300 zenni!"
								if(usr.zenni >= 300)
									usr << "Zenni taken & recieved."
									usr.zenni -= 300
									switch(alert("Do you want to customize the color of the 'Boots & Gloves'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-wizardbootsgloves.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/wizardbootandgloves
											item.icon = clothicon
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/wizardbootandgloves

							if("Cancel")
								alert("Goodbye! Come again!")
					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")

mob/other
	ChibiGohan
		name = "(NPC) Chibi Gohan"
		icon = 'icons/Baby gohan.dmi'
		npc = 1
		dead = 1
		DblClick()
			if(src in view(1))
				Talk()
		verb
			Talk()
				set src in view(1)
				if(usr.rad_dead)
					if(!usr.gohansaved)
						alert("Please help me. He is scaring me..","Chibi Gohan")
						usr.gohansaved = 1
						sleep(10)
						alert("Please tell my mom that I am okay because you have saved me","Chibi Gohan")
						usr << "<b><font color=red>*Chibi Gohan hugs you*"
						return
				if(usr.gohansaved)
					alert("I'll be heading home soon.","Chibi Gohan")

	Chichi
		icon = 'icons/ChiChi.dmi'
		name = "ChiChi"
		npc = 1
		race = "Earthling"
		DblClick()
			if(src in view(1))
				Talk()
		verb
			Talk()
				set src in view(1)
				if(!usr.gohansaved)
					alert("Help me! Please help me! Someone stole my poor little Gohan! Can you please look for him?","Chi Chi")
					if(!quest1)
						switch(alert("Do you want to look for chibi Gohan?","Quest #1","Yes","No"))
							if("Yes")
								quest1=1
								alert("Oh, why thank you [usr.name]","Chi Chi")
							else
				if(usr.gohansaved)
					if(!usr.talkchi)
						alert("Thank you for finding my precious Gohan!","Chi Chi")
						sleep(10)
						alert("Oh, since you saved my son, have this, it may come in handy when your hungry","Chi Chi")
						usr << "You received a bowl of <b>Tenticle Eeled Soup</b> from Chi Chi"
						usr.contents += new /obj/items/tenticle_eeled_soup
						usr.talkchi = 1
				else
					if(usr.talkchi)
						alert("Hello, how are you doing today?","Chi Chi")

mob
	other
		Korin
			icon = 'icons/mobs.dmi'
			icon_state = "korin"
			npc = 1
			race = null
			Click()


				switch(input("Hey, [usr]! What do you need?", "Korin",text) in list ("Talk","Buy","Sell","Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Korin",text) in list ("Senzu Bean (500)","Senzu Bag (3000)","Small Senzu Bag (10000)","Medium Senzu Bag (25000)","Large Senzu Bag (50000)","Heavy Senzu Bag (100000)","Apple (100)","Green Apple (150)","Power Pole (500000)","Cancel"))
							if("Senzu Bean (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr.zenni -= 500
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Senzu Bean!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/senzu

							if("Power Pole (500000)")
								if(!usr) return
								if(usr.zenni <= 499999)
									usr << "<b>You need 500000 zenni!"
								if(usr.zenni >= 500000)
									usr.zenni -= 500000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Power Pole!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/powerpole

							if("Senzu Bag (3000)")
								if(!usr) return
								if(usr.zenni <= 2999)
									usr << "<b>You need 3000 zenni!"
								if(usr.zenni >= 3000)
									usr.zenni -= 3000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Senzu Bag!"
									view(6) << 'sounds/zenni.wav'
									var/obj/b1 = /obj/items/senzubag
									var/obj/b2 = new b1
									usr.contents += b2
									b2.bu = 1
							if("Small Senzu Bag (10000)")
								if(!usr) return
								if(usr.zenni <= 9999)
									usr << "<b>You need 10000 zenni!"
								if(usr.zenni >= 10000)
									usr.zenni -= 10000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Small Senzu Bag!"
									view(6) << 'sounds/zenni.wav'
									var/obj/b1 = /obj/items/ssenzubag
									var/obj/b2 = new b1
									usr.contents += b2
									b2.bu = 1
							if("Medium Senzu Bag (25000)")
								if(!usr) return
								if(usr.zenni <= 24999)
									usr << "<b>You need 20000 zenni!"
								if(usr.zenni >= 25000)
									usr.zenni -= 25000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Medium Senzu Bag!"
									view(6) << 'sounds/zenni.wav'
									var/obj/b1 = /obj/items/msenzubag
									var/obj/b2 = new b1
									usr.contents += b2
									b2.bu = 1
							if("Large Senzu Bag (50000)")
								if(!usr) return
								if(usr.zenni <= 49999)
									usr << "<b>You need 50000 zenni!"
								if(usr.zenni >= 50000)
									usr.zenni -= 50000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Large Senzu Bag!"
									view(6) << 'sounds/zenni.wav'
									var/obj/b1 = /obj/items/lsenzubag
									var/obj/b2 = new b1
									usr.contents += b2
									b2.bu = 1
							if("Heavy Senzu Bag (100000)")
								if(!usr) return
								if(usr.zenni <= 99999)
									usr << "<b>You need 100000 zenni!"
								if(usr.zenni >= 100000)
									usr.zenni -= 100000
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Heavy Senzu Bag!"
									view(6) << 'sounds/zenni.wav'
									var/obj/b1 = /obj/items/hsenzubag
									var/obj/b2 = new b1
									usr.contents += b2
									b2.bu = 1

							if("Apple (100)")
								if(!usr) return
								if(usr.zenni <= 99)
									usr << "<b>You need 100 zenni!"
								if(usr.zenni >= 100)
									usr.zenni -= 100
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Apple!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/apple

							if("Green Apple (150)")
								if(!usr) return
								if(usr.zenni <= 149)
									usr << "<b>You need 150 zenni!"
								if(usr.zenni >= 150)
									usr.zenni -= 150
									usr << "Zenni taken & recieved."
									usr << "<b>You get a Green Apple!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/greenapple

							if("Cancel")
								alert("Goodbye, come again!")
								..()


					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Talk")
						alert("Korin: Hmmm..")
						alert("Korin: You have [(usr.ssjfpt*7/3) /60/20] hours left for SSJFP! Hope that helps you with your journey.")

mob
	other
		Shopkeeper
			icon = 'icons/mobs.dmi'
			icon_state = ""
			npc = 1
			race = "Earthling"
			Click()


				switch(alert("Hello, [usr]! What do you want to do?","Shopkeeper","Buy", "Sell", "Cancel"))
					if("Buy")
						switch(input("What do you want to buy?", "Shopkeeper",text) in list ("Underclothing (250)","Gi (500)","Weighted Gi (2500)","Cape (500)","Weighted Cape (2500)","Vest (500)","Weighted Vest (2500)","Boots & Gloves (300)","Glasses (100)","Cancel"))
							if("Underclothing (250)")
								if(!usr) return
								if(usr.zenni <= 249)
									usr << "<b>You need 250 zenni!"
								if(usr.zenni >= 250)
									usr << "Zenni taken & recieved."
									usr.zenni -= 250
									switch(alert("Do you want to customize the color of the 'Underclothing'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-blackunder.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/underclothing
											item.icon = clothicon
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Underclothing!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/underclothing

							if("Glasses (100)")
								if(!usr) return
								if(usr.zenni <= 99)
									usr << "<b>You need 100 zenni!"
								if(usr.zenni >= 100)
									usr << "Zenni taken & recieved."
									usr.zenni -= 100
									switch(alert("Do you want to customize the color of the 'Glasses'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/glasses.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/glasses
											item.icon = clothicon
											usr << "<b>You get Glasses!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Glasses!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/glasses


							if("Gi (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Gi'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-blackgi.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/gi
											item.icon = clothicon
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/gi

							if("Vest (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Vest'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-vest.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/vest
											item.icon = clothicon
											usr << "<b>You get a Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/vest

							if("Weighted Vest (2500)")
								if(!usr) return
								if(usr.zenni <= 2499)
									usr << "<b>You need 2500 zenni!"
								if(usr.zenni >= 2500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2500
									switch(alert("Do you want to customize the color of the 'Weighted Vest'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-vest.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/weightedvest
											item.icon = clothicon
											usr << "<b>You get a Weighted Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Weighted Vest!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/weightedvest

							if("Cape (500)")
								if(!usr) return
								if(usr.zenni <= 499)
									usr << "<b>You need 500 zenni!"
								if(usr.zenni >= 500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 500
									switch(alert("Do you want to customize the color of the 'Cape'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-blackcape.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/cape
											item.icon = clothicon
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/cape

							if("Weighted Gi (2500)")
								if(!usr) return
								if(usr.zenni <= 2499)
									usr << "<b>You need 2500 zenni!"
								if(usr.zenni >= 2500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2500
									switch(alert("Do you want to customize the color of the 'Weighted Gi'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-blackgi.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/weightedgi
											item.icon = clothicon
											usr << "<b>You get a Weighted Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Weighted Gi!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/weightedgi

							if("Weighted Cape (2500)")
								if(!usr) return
								if(usr.zenni <= 2499)
									usr << "<b>You need 2500 zenni!"
								if(usr.zenni >= 2500)
									usr << "Zenni taken & recieved."
									usr.zenni -= 2500
									switch(alert("Do you want to customize the color of the 'Weighted Cape'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/clothes-blackcape.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/weightedcape
											item.icon = clothicon
											usr << "<b>You get a Weighted Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get a Weighted Cape!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/weightedcape

							if("Boots & Gloves (300)")
								if(!usr) return
								if(usr.zenni <= 299)
									usr << "<b>You need 300 zenni!"
								if(usr.zenni >= 300)
									usr << "Zenni taken & recieved."
									usr.zenni -= 300
									switch(alert("Do you want to customize the color of the 'Boots & Gloves'?","","Yes", "No"))
										if("Yes")
											if(!usr) return
											var/clothcolor = F_Color_Selector.Get_Color()
											var/icon/clothicon = new('icons/blackboot_glove.dmi')
											clothicon.Blend(clothcolor)
											var/obj/items/item = new /obj/items/bgset
											item.icon = clothicon
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += item
										if("No")
											if(!usr) return
											usr << "<b>You get Boots & Gloves!"
											view(6) << 'sounds/zenni.wav'
											usr.contents += new /obj/items/bgset

							if("Cancel")
								alert("Goodbye! Come again!")
					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Cancel")
						alert("Goodbye! Come again!")

		Bulma
			name = "(NPC) Bulma"
			icon = 'icons/mobs.dmi'
			icon_state = "bulma"
			npc = 1
			race = "Earthling"
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					switch(input("Hey, [usr]! What's up? You want to buy something or just talk?", "Bulma",text) in list ("Talk","Buy","Sell","Cancel"))
						if("Buy")
							usr.npctalk = 0
							switch(input("Hello! What do you wish to buy?", "Bulma",text) in list ("Dragon Radar (10000)","Personal Mail Assistant (5000)","Class III Scouter (Red) (3000)","Class III Scouter (Blue) (3000)","Class III Scouter (Yellow) (3000)","Class III Scouter (Green) (3000)","Cancel"))
								if("Dragon Radar (10000)")
									if(!usr) return
									if(usr.zenni <= 9999)
										usr << "<b>You need 10000 zenni!"
									if(usr.zenni >= 10000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 10000
										usr << "<b>You get a Dragon Radar!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/dragonradar

								if("Personal Mail Assistant (5000)")
									if(!usr) return
									if(usr.zenni < 5000)
										usr << "<b>You need 5000 zenni!"
									else
										usr << "Zenni taken & recieved."
										usr.zenni -= 5000
										usr << "<b>You get a Peronal Mail Assistant!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/PMA

								if("Class III Scouter (Red) (3000)")
									if(!usr) return
									if(usr.zenni <= 2999)
										usr << "<b>You need 3000 zenni!"
									if(usr.zenni >= 3000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 3000
										usr << "<b>You get a Class III Scouter (Red)!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/c3scouterr

								if("Class III Scouter (Blue) (3000)")
									if(!usr) return
									if(usr.zenni <= 2999)
										usr << "<b>You need 3000 zenni!"
									if(usr.zenni >= 3000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 3000
										usr << "<b>You get a Class III Scouter (Blue)!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/c3scouterb

								if("Class III Scouter (Green) (3000)")
									if(!usr) return
									if(usr.zenni <= 2999)
										usr << "<b>You need 3000 zenni!"
									if(usr.zenni >= 3000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 3000
										usr << "<b>You get a Class III Scouter (Green)!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/c3scouterg

								if("Class III Scouter (Yellow) (3000)")
									if(!usr) return
									if(usr.zenni <= 2999)
										usr << "<b>You need 3000 zenni!"
									if(usr.zenni >= 3000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 3000
										usr << "<b>You get a Class III Scouter (Yellow)!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/c3scoutery

								if("Cancel")
									alert("Goodbye, Come again!")
									..()
						if("Sell")
							var/list/Sellable=list()
							for(var/obj/items/O in usr.contents)
								if(!istype(O)) continue
								if(O.value>0)
									Sellable+=O
							var/obj/items/P=input("What do you want to sell?","") in Sellable
							if(!P) return
							switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
								if("Yes")
									if(P && P.worn)
										usr<<"<b>Not while it's being worn."
									else if(P)
										usr<<"<b>You recieve, [P.value] Zenni!"
										usr.zenni+=P.value
										P.loc = locate(0,0,0)
										del(P)

						if("Talk")
							if(usr.race != "Half-Saiyan" && usr.race != "Earthling" )
								alert("Bulma: Me and my Dad are finishing a new experiment as you can see outside Capsule Corp, a Time Machine that allows you to travel through the past. Still has alot of bugs to workout!")
								usr << "<B>As you look away, you see Bulma sigh."
								usr.npctalk = 0
							else
								if(usr.saiyawq )
									alert("Bulma: Me and my Dad are finishing a new experiment as you can see outside Capsule Corp, a Time Machine that allows you to travel through the past. Still has alot of bugs to workout!")
									usr << "<B>As you look away, you see Bulma sigh."
									usr.npctalk = 0
								else
									if(usr.powerlevel.max_value >= 2600000 && usr.sma  && usr.smwa )
										switch(alert("Which sex are you?",null,"Male","Female"))
											if("Male")
												usr.contents += new /obj/items/quest/saiyawatchm
											if("Female")
												usr.contents += new /obj/items/quest/saiyawatchw
										usr.saiyawq = 1
										usr.npctalk = 0
										alert("Bulma: Here, you can have this watch I just designed! Good luck..")
									else
										usr.npctalk = 0
										alert("Oh, hello there. I am working on a small project right now, please come visit me later okay?")

mob
	other
		NamekShopkeeper
			name = "(NPC) Namek Shopkeeper"
			icon = 'icons/mobs.dmi'
			icon_state = "nshopkeeper"
			npc = 1
			race = "Namek"
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					switch(alert("Hello, [usr]! What do you want to do?","Namek Shopkeeper","Buy", "Sell", "Cancel"))
						if("Buy")
							usr.npctalk = 0
							switch(input("What do you want to buy?", "Namek Shopkeeper",text) in list ("Namekian Dragon Radar (2500)","Namekian Cape (5000)","Namekian Gi (250)","Turben (250)","Namekian Fruit (250)","Cancel"))
								if("Namekian Dragon Radar (2500)")
									if(!usr) return
									if(usr.zenni <= 2499)
										usr << "<b>You need 2500 zenni!"
									if(usr.zenni >= 2500)
										usr << "Zenni taken & recieved."
										usr.zenni -= 2500
										usr << "<b>You get a Namekian Dragon Radar!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/ndragonradar

								if("Turben (250)")
									if(!usr) return
									if(usr.zenni <= 249)
										usr << "<b>You need 250 zenni!"
									if(usr.zenni >= 250)
										usr << "Zenni taken & recieved."
										usr.zenni -= 250
										usr << "<b>You get a Turben!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/turben

								if("Namekian Cape (5000)")
									if(!usr) return
									if(usr.zenni <= 4999)
										usr << "<b>You need 5000 zenni!"
									if(usr.zenni >= 5000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 5000
										switch(alert("Do you want to customize the color of the 'Namekian Cape'?","","Yes", "No"))
											if("Yes")
												if(!usr) return
												var/clothcolor = F_Color_Selector.Get_Color()
												var/icon/clothicon = new('icons/clothes-blackcape.dmi')
												clothicon.Blend(clothcolor)
												var/obj/items/item = new /obj/items/namekcape
												item.icon = clothicon
												usr << "<b>You get a Namekian Cape!"
												view(6) << 'sounds/zenni.wav'
												usr.contents += item
											if("No")
												if(!usr) return
												usr << "<b>You get a Namekian Cape!"
												view(6) << 'sounds/zenni.wav'
												usr.contents += new /obj/items/namekcape

								if("Namekian Gi (250)")
									if(!usr) return
									if(usr.zenni <= 249)
										usr << "<b>You need 250 zenni!"
									if(usr.zenni >= 250)
										usr << "Zenni taken & recieved."
										usr.zenni -= 250
										usr << "<b>You get a Namekian Gi!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/namekgi

								if("Namekian Fruit (250)")
									if(!usr) return
									if(usr.zenni <= 249)
										usr << "<b>You need 250 zenni!"
									if(usr.zenni >= 250)
										usr << "Zenni taken & recieved."
										usr.zenni -= 250
										usr << "<b>You get Namekian Fruit!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/namekfruit

								if("Cancel")
									alert("Goodbye, come again!")
									..()


						if("Sell")
							usr.npctalk = 0
							var/list/Sellable=list()
							for(var/obj/items/O in usr.contents)
								if(!istype(O)) continue
								if(O.value>0)
									Sellable+=O
							var/obj/items/P=input("What do you want to sell?","") in Sellable
							if(!P) return
							switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
								if("Yes")
									if(P && P.worn)
										usr<<"<b>Not while it's being worn."
									else if(P)
										usr<<"<b>You recieve, [P.value] Zenni!"
										usr.zenni+=P.value
										P.loc = locate(0,0,0)
										del(P)

						if("Cancel")
							usr.npctalk = 0
							alert("Goodbye, come again!")
							..()


mob
	other
		Frieza
			name = "(NPC) Frieza"
			powerlevel = new(7400000)
			race = "Changling"
			icon = 'icons/friezamob.dmi'
			npc = 1
			icon_state = ""
			dead = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings, I am Frieza.")
						usr.npctalk = 0
						switch(input("Do you wish to follow the way of 'Changling'?", "Frieza",text) in list ("Yes","No"))
							if("Yes")
								if(usr.race == "Changling")
									usr.master = "Frieza"
								else
									usr << "You are not a Changling."
				Learn()
					set src in oview(1)
					set category = "Other"
					if(usr.master == "Frieza")
						switch(input("What do you wish to learn today?" , "Frieza", text) in list ("Transform: Changling","Death Ball","Finger Blast","Eye Laser","Imprisonment","Changling Stance"))
							if("Transform: Changling")
								if(usr.upgrade == 0||usr.upgrade == null)
									if(usr.changlearn )
										alert("You have already learned this!")
									else
										usr << "You need 50 skill points!"
										if(usr.powerlevel.max_value < 425000 && skpts < 49)
											usr << "<b>You need to be stronger."
										if(usr.powerlevel.max_value >= 425000 && skpts > 50)
											usr.contents += new /obj/transes/transform
											usr.skpts -= 50
											usr.changlearn = 1
											if(!frcf1)
												if(!usr.fused)
													frcf1 = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
													world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Changling Form 1</font></b>"
											usr << "You have learned Transform: Changling!"
								else
									alert("You can't learn this.")
							if("Death Ball")
								usr << "You need 60 skill points!"
								if(usr.powerlevel.max_value < 35000)
									usr << "<b>You need to be stronger."
								else if(usr.kills < 60)
									usr << "<b>You have not yet experienced the true joy of killing."
								else if(usr.skpts < 60)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicombt)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/deathb
									usr.skpts -= 60
									usr << "You have learned Death Ball!"

							if("Finger Blast")
								usr << "You need 50 skill points!"
								if(usr.ki.max_value < 10000)
									usr << "<b>Your ki is too weak."
								else if(usr.kills < 50)
									usr << "<b>You have not yet experienced the true joy of killing."
								else if(usr.skpts < 50)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicombt)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/fblast
									usr.skpts -= 50
									usr << "You have learned Finger Blast!"

							if("Eye Laser")
								usr << "You need 20 skill points!"
								if(usr.ki.max_value < 5000)
									usr << "<b>Your ki is too weak."
								else if(usr.kills < 20)
									usr << "<b>You have not yet experienced the true joy of killing."
								else if(usr.skpts < 20)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicombt)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/eyelaser
									usr.skpts -= 20
									usr << "You have learned Eye Laser!"

							if("Imprisonment")
								usr << "You need 30 skill points!"
								if(usr.powerlevel.max_value < 3100)
									usr << "<b>You need to be stronger."
								else if(usr.kills < 30)
									usr << "<b>You have not yet experienced the true joy of killing."
								else if(usr.skpts < 30)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicntrl)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/imprison
									usr.skpts -= 30
									usr << "You have learned Imprisonment!"
							if("Changling Stance")
								if(usr.chq)
									usr << "You need 50 skill points!"
									if(usr.powerlevel.max_value < 87500)
										alert("Frieza: You are too weak.")
									else if(usr.kills < 50)
										usr << "<b>You have not yet experienced the true joy of killing."
									else if(usr.skpts < 50)
										usr << "<b>You don't have enough skill points."
									else
										usr.contents += new /styles/icer
										usr.skpts -= 50
										usr << "<B>You have learned, 'Changling Stance'!"
								else if(!usr.chq)
									alert("Hmm, I shall teach you our sacred race stance if you are able to find and defeat myself!")
					else
						alert("You are not my student!")

		Guldo
			name = "(NPC) Guldo"
			powerlevel = new(10000)
			race = "Mutant"
			icon = 'icons/gurdo.dmi'
			npc = 1
			icon_state = ""
			dead = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings, I am Guldo.")
						usr.npctalk = 0
						switch(input("Do you wish to follow the ways of 'Guldo'?", "Guldo",text) in list ("Yes","No"))
							if("Yes")
								if(findtext(usr.race,"Wizard") || usr.race == "Changling" || usr.race == "Earthling" || findtext(usr.race,"Android"))
									usr.master = "Guldo"
									alert("You are now my student.")
								else
									alert("Your not a Wizard, Changling, Earthling, or Android.")
				Learn()
					set src in oview(1)
					set category = "Other"
					if(usr.master == "Guldo")
						switch(input("What do you wish to learn today?" , "Guldo", text) in list ("Time Freeze","None"))
							if("Time Freeze")
								usr << "You need 30 skill points!"
								if(usr.ki.max_value < 32000)
									alert("Your ki is too weak.")
								else if(usr.kills < 30)
									alert("You have not yet experienced the true joy of killing.")
								else if(usr.skpts < 30)
									alert("You don't have enough skill points.")
								else if(!usr.kicombt)
									alert("You are not skilled enough in ki.")
								else
									usr.skills += new /obj/techs/timefreeze
									usr.skpts -= 30
									alert("I shall now teach you, 'Time Freeze'!")

							if("None")
								alert("Goodbye, then.")
					else
						alert("You are not my student!")

		yemma
			icon = 'icons/yemma.png'
			powerlevel. = new(670000)
			npc = 1
			dead = 1
			density = 1
			race = null
			name = "(NPC) King Yemma"
			noname = 1
			DblClick()
				Talk()
			verb
				Talk()
					set category = null
					if(usr.race == "Saiyan" || usr.race == "Half-Saiyan")
						if(usr.state == "Mystic"||usr.state == "Bebi Super Saiyan")
							if(usr.msq >= 1 && usr.msq < 3)
								alert("Please try to find out what is troubling Mez and Goz!")
								usr.loc=locate(74,76,8)
								return
							else
								if(usr.powerlevel.max_value >= 1000000 && usr.ki.max_value >= 1000000)
									switch(alert("Hmm, you seem powerful. Well, I have a request that you may be able to do. Accept it?",null,"Yes","No"))
										if("No")
											alert("Very well, if you decide to change your mind, please talk to me again")
										if("Yes")
											alert("Goz says that there's a disturbance in HFIL. Please talk to him and find out what's troubling him and Mez!")
											usr.msq = 1
											usr.loc=locate(74,76,8)
											return
					if(usr.ap >= -25 && usr.ap <= 25)
						usr.move = 0
						usr << "<B>King Yemma</B>: Hmm, you haven't done anything bad or good."
						sleep(12)
						switch(rand(1,5))
							if(1)
								usr << "<B>King Yemma</B>: Go to Snake Way!"
								view(6) << 'sounds/it2.wav'
								oview(6) << "<B>King Yemma sends [usr] to Snake Way."
								usr.loc=locate(74,2,2)
								usr << "<B>You have been sent to Snake Way."
								usr.move = 1
							if(2,3)
								usr << "<B>King Yemma</B>: Go to hell!"
								view(6) << 'sounds/it2.wav'
								oview(6) << "<B>King Yemma sends [usr] to hell."
								usr.loc=locate(74,76,8)
								usr << "<B>You have been sent to hell."
								usr.move = 1
							if(4,5)
								usr << "<B>King Yemma</B>: Go to Heaven!"
								view(6) << 'sounds/it2.wav'
								usr.immortal = 1
								oview(6) << "<B>King Yemma sends [usr] to The Air Port."
								usr.loc=locate(144,7,24)
								usr << "<B>You have been sent to the Air port."
								usr.move = 1
					else if(usr.ap > 25)
						view(6) << 'sounds/it2.wav'
						usr.immortal = 1
						switch(rand(1,3))
							if(1)
								usr << "<B>King Yemma</B>: Go to Snake Way!"
								view(6) << 'sounds/it2.wav'
								oview(6) << "<B>King Yemma sends [usr] to Snake Way."
								usr.loc=locate(74,2,2)
								usr << "<B>You have been sent to Snake Way."
							if(2, 3)
								usr << "<B>King Yemma</B>: Go to Heaven!"
								view(6) << 'sounds/it2.wav'
								usr.immortal = 1
								oview(6) << "<B>King Yemma sends [usr] to The Air Port."
								usr.loc=locate(144,7,24)
								usr << "<B>You have been sent to the Air port."
								usr.move = 1
					if(usr.ap < -25)
						view(6) << 'sounds/it2.wav'
						switch(rand(1,3))
							if(1)
								usr << "<B>King Yemma</B>: Go to Snake Way!"
								view(6) << 'sounds/it2.wav'
								oview(6) << "<B>King Yemma sends [usr] to Snake Way."
								usr.loc=locate(74,2,2)
								usr << "<B>You have been sent to Snake Way."
							if(2, 3)
								usr << "<B>King Yemma</B>: Go to hell!"
								view(6) << 'sounds/it2.wav'
								oview(6) << "<B>King Yemma sends [usr] to hell."
								usr.loc=locate(74,76,8)
								usr << "<B>You have been sent to hell."
								usr.move = 1

		Dummy
			icon = 'icons/mobs.dmi'
			icon_state = "dummy"
			race = "Dummy (Class I)"
			npc = 1
			dead = 1
			noname = 1
			name = "Class I Dummy"
			verb
				Train()
					set name = "Train with Dummy"
					set category = null
					set src in oview(1)
					switch(input("What do you want to train?","Training",text) in list ("Punches","Kicks","Ki","None"))
						if("Punches")
							if(usr && usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr << "<b>You begin training your punches."
										usr.move = 0
										usr.punchcheck2()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("Kicks")
							if(usr && usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr.move = 0
										usr << "<b>You begin training your kicks."
										usr.kickcheck2()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("Ki")
							if(usr && usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr.move = 0
										usr << "<b>You begin training your ki."
										usr.kicheck2()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("None")
							usr.training = 0
							usr << "<b>You stop training."
							usr.move = 1

		Dummy2
			icon = 'icons/mobs.dmi'
			icon_state = "dummy2"
			race = "Dummy (Class II)"
			npc = 1
			dead = 1
			noname = 1
			name = "Class II Dummy"
			verb
				TrainII()
					set name = "Train with Dummy"
					set category = null
					set src in oview(1)
					switch(input("What do you want to train?","Training",text) in list ("Punches","Kicks","Ki","None"))
						if("Punches")
							if(usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr << "<b>You begin training your punches."
										usr.move = 0
										usr.punchcheck3()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("Kicks")
							if(usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr.move = 0
										usr << "<b>You begin training your kicks."
										usr.kickcheck3()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("Ki")
							if(usr.rest == 0)
								if(usr.meditate == 0)
									if(usr.training )
										usr << "<b>You are currently training. Please select 'None' on the training screen."
									if(usr.training == 0||null)
										usr.training = 1
										usr.move = 0
										usr << "<b>You begin training your ki."
										usr.kicheck3()
								else
									alert("You can't train while meditating.")
							else
								alert("You can't train while resting.")
						if("None")
							usr.training = 0
							usr << "<b>You stop training."
							usr.move = 1

mob
	proc
		punchcheck()
			spawn()
				set background = 1
				while(training)
					sleep(12)
					if(stamina.value <= 0)
						src << "<B>You have become too tired and have stopped training."
						stamina.value = 0
						move = 1
						training = 0
					else
						flick("sparfury", src)
						view(5) << 'sounds/punchmiss.wav'
						stamina.value -= 5
						skexp += rand(1,3)
						Levelup()
						random = rand(0,2)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0002
							ki.max_value += 1+ki.max_value * 0.0002
							stamina.max_value += 1+stamina.max_value * 0.00004

mob
	proc
		kickcheck()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<B>You have become too tired and have stopped training."
						stamina.value = 0
						move = 1
						training = 0
					else
						flick("sparkick", src)
						view(4) << 'sounds/kickmiss.wav'
						stamina.value -= 2
						skexp += rand(1,3)
						Levelup()
						random = rand(0,2)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0004
							stamina.max_value += 1+stamina.max_value * 0.00004

mob
	proc
		kicheck()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<B>You have become too tired and have stopped training."
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("meditate", src)
						view(4) << 'sounds/deflect.wav'
						stamina.value -= 2
						skexp += rand(1,3)
						Levelup()
						random = rand(0,2)
						if(random)
							ki.max_value += 1+ki.max_value * 0.0004
							stamina.max_value += 1+stamina.max_value * 0.00004

mob
	proc
		punchcheck2()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to punch train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("sparfury", src)
						view(5) << 'sounds/punchmiss.wav'
						stamina.value -= 5
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0004
							ki.max_value += 1+ki.max_value * 0.0004
							stamina.max_value += 1+stamina.max_value * 0.00008

mob
	proc
		kickcheck2()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to kick train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("sparkick", src)
						view(5) << 'sounds/kickmiss.wav'
						stamina.value -= 2
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0008
							stamina.max_value += 1+stamina.max_value * 0.00008

mob
	proc
		kicheck2()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to ki train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("meditate", src)
						view(5) << 'sounds/deflect.wav'
						stamina.value -= 4
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							ki.max_value += 1+ki.max_value * 0.0008
							stamina.max_value += 1+stamina.max_value * 0.00008

mob
	proc
		punchcheck3()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to punch train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("sparfury", src)
						view(5) << 'sounds/punchmiss.wav'
						stamina.value -= 5
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0008
							ki.max_value += 1+ki.max_value * 0.0008
							stamina.max_value += 1+stamina.max_value * 0.00016

mob
	proc
		kickcheck3()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to kick train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("sparkick", src)
						view(5) << 'sounds/kickmiss.wav'
						stamina.value -= 2
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							powerlevel.max_value += 1+powerlevel.max_value * 0.0016
							stamina.max_value += 1+stamina.max_value * 0.00016

mob
	proc
		kicheck3()
			spawn()
				set background = 1
				while(training)
					sleep(15)
					if(stamina.value <= 0)
						src << "<b>You are too tired to ki train.</b>"
						move = 1
						training = 0
						stamina.value = 0
					else
						flick("meditate", src)
						view(5) << 'sounds/deflect.wav'
						stamina.value -= 4
						skexp += rand(3,7)
						Levelup()
						random = rand(0,3)
						if(random)
							ki.max_value += 1+ki.max_value * 0.0016
							stamina.max_value += 1+stamina.max_value * 0.00016

mob
	other
		Tenshinhan
			name = "Tenshinhan"
			icon = 'icons/mobs.dmi'
			icon_state = "tienshinhan"
			race = "Earthling"
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						if(!usr.taodead)
							usr.npctalk = 1
							alert("Tenshinhan: Greetings, [usr].")
							alert("Tenshinhan: Tao's been terrorizing people lately, can you please take him out?, [usr].")
							usr.npctalk = 0
						else
							if(!usr.tientrain)
								if(usr.taodead)
									usr.npctalk = 1
									alert("Tenshinhan: thank you for defeating tao, I shall train you.")
									usr << "<b>*You begin training with Tien*"
									usr.move = 0
									sleep(100)
									usr.powerlevel.max_value += 250
									usr.npctalk = 0
									usr.tientrain = 1
									alert("Tenshinhan: There ya go, you can learn any moves from me anytime!")
									usr.move = 1
									usr << "<b><font color=green>*Quest Completed!*"
								else
							if(usr.tientrain)
								usr.npctalk = 1
								alert("Tenshinhan: Greetings, [usr].")
								usr.npctalk = 0
								switch(input("What technique do you wish to learn?" , "Tenshinhan", text) in list ("Solar Flare","Split-form","Dodonpa","None"))
									if("Solar Flare")
										usr << "You need 10 skill points!"
										if(usr.powerlevel.max_value < 1200)
											usr << "You need to be a bit stronger."
										else if(usr.skpts < 10)
											usr << "You don't have enough skill points."
										else if(!usr.kicntrl)
											usr << "You are not skilled enough in ki."
										else
											usr.skills += new /obj/techs/Tayioken
											usr.skpts -= 10
											alert("I shall now teach you, Solar Flare!")
									if("Split-form")
										usr << "You need 25 skill points!"
										if(usr.powerlevel.max_value < 50000)
											usr << "You need to be a bit stronger."
										else if(usr.skpts < 25)
											usr << "You don't have enough skill points."
										else if(!usr.kicombt)
											usr << "You are not skilled enough in ki."
										else
											usr.skills += new /obj/techs/splitform
											usr.skpts -= 25
											alert("I shall now teach you, Split-form!")

									if("Dodonpa")
										if(usr.race == "Earthling")
											usr << "You need 25 skill points!"
											if(usr.ki.max_value < 26000)
												usr << "Your ki needs to be developed more!"
											else if(usr.skpts < 25)
												usr << "You don't have enough skill points."
											else if(!usr.kicntrl)
												usr << "You are not skilled enough in ki."
											else
												usr.skills += new /obj/techs/dodonpa
												usr.skpts -= 25
												alert("I shall now teach you, Dodonpa!")
										else
											alert("Only Earthlings can learn this technique!")
									if("None")
										..()

		Kame
			name = "Kamé-sennin"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			npc = 1
			density = 1
			icon_state = "roshi"
			verb
				Learn()
					set src in oview(1)
					set category = "Other"
					switch(input("Do you wish to learn 'Super Human'?", "Master Roshi", text) in list ("Yes","No"))
						if("Yes")
							if(usr.race == "Earthling")
								if(usr.earthlearn )
									alert("You already learned this!")
								else
									if(usr.powerlevel.max_value >= 400000)
										usr.move = 0
										usr.move = 1
										usr.contents += new /obj/transes/superh
										if(!frhs)
											if(!usr.fused)
												frhs = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
												world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: Super Human</font></b>"
										usr.kame = 0
										usr.earthlearn = 1
										alert("You have learned the 'Super Human' transformation.")
									else
										alert("You aren't strong enough.")
							else
								alert("You aren't of the Earthling race.")
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Master Roshi: Greetings, [usr]")
						usr.npctalk = 0
						switch(input("Do you wish to undergo my training?", "Master Roshi", text) in list ("Yes","No"))
							if("Yes")
								if(!usr.ktrain)
									if(!usr.magazine)
										alert("Master Roshi: You do not have enough Magazines.")
									else
										usr << "<B>You hand the magazines to Master Roshi."
										usr.magazine = 0
										for(var/obj/items/magazine/O in usr.contents)
											del(O)
										sleep(15)
										alert("Master Roshi: If you wish to continue with your next phase of training, speak to me again.")
										usr.ktrain = 1
								else
									if(usr.ktrain == 1)
										alert("Master Roshi: For your next task, you need to plough the field below me.")
									else if(usr.ktrain == 2)
										if(usr.boulder)
											if(!usr.kicntrl)
												alert("Master Roshi: You must become more skilled in your control of ki before I can teach you.")
											else
												alert("Master Roshi: I shall now teach you the 'Kamehameha' technique, and the 'Turtle Hermit' fighting style!")
												usr.skills += new /obj/techs/Kamehameha
												usr.contents += new /styles/zanstances
												usr.powerlevel.max_value += 175
												usr.ki.max_value += 175
												usr.kamestudent = 1
												usr.ktrain = 3
										else
											alert("Master Roshi: For your next task, you need to push that boulder to the left of me.")
									else
										alert("Master Roshi: There is nothing more I can teach you.")

		Buu
			name = "(NPC) Good Buu"
			race = "Buu"
			icon = 'icons/buumob.dmi'
			icon_state = ""
			npc = 1
			density = 1
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						if(usr.mechquest1 )
							if(locate(/obj/items/quest/techanalyser/t4) in usr)
								alert("Buu: I hope you like my gift!")
								usr.npctalk = 0
								return
							alert("Buu: You look like you're a good person deep within, I like you. Here's a gift!")
							usr.contents += new /obj/items/quest/techanalyser/t4
							usr << "You have recieved Techanlyser Part 4"
							usr.npctalk = 0
						else
							usr.npctalk = 0
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						usr.npctalk = 0
						switch(input("Buu: Buu teach you what?" , "Good Buu", text) in list ("Human Extinction Attack", "Super Ghost Kamikaze Attack (Kamehameha)","Super Ghost Kamikaze Attack (Galit Gun)","Liquify","Nothing"))
							if("Human Extinction Attack")
								if(usr.race == "Buu")
									usr << "You need 120 skill points!"
									if(usr.ki.max_value < 1200000)
										usr << "<B>Your ki isn't developed enough to learn this technique!"
									else if(usr.skpts < 120)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kiultra)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.kame = 0
										usr.skpts -= 120
										usr.skills += new /obj/techs/humangeno
										alert("Buu: Buu teach you, 'Human Extinction Attack'!")
								else
									alert("Buu: Buu you aren't Buu!")
							if("Liquify")
								if(usr.race == "Buu")
									usr << "You need 75 skill points!"
									if(usr.powerlevel.max_value < 15000000)
										usr << "<B>Your PL isn't developed enough to learn this technique!"
									else if(usr.ki.max_value < 25000000)
										usr << "<B>Your Ki isn't developed enough to learn this technique!"
									else if(usr.skpts < 75)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kiultra)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.kame = 0
										usr.skpts -= 75
										usr.skills += new /obj/techs/liquid
										alert("Buu: Buu teach you, 'Liquify'!")
								else
									alert("Buu: Buu you aren't Buu!")

							if("Super Ghost Kamikaze Attack (Kamehameha)")
								if(usr.race == "Buu"||usr.race == "Earthling"||usr.race == "Half-Saiyan")
									usr << "You need 50 skill points!"
									if(usr.ki.max_value < 760000)
										usr << "<B>Your Ki isn't developed enough to learn this technique!"
									else if(usr.skpts < 50)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.kame = 0
										usr.skpts -= 50
										usr.skills += new /obj/techs/sgkkame
										alert("Buu: Buu teach you, 'Super Ghost Kamikaze Attack (Kamehameha)'!")
								else
									alert("Buu: Buu you aren't Buu, Earthling or Half-Saiyan!")
							if("Super Ghost Kamikaze Attack (Galit Gun)")
								if(usr.race == "Buu"||usr.race == "Earthling"||usr.race == "Half-Saiyan")
									usr << "You need 50 skill points!"
									if(usr.ki.max_value < 760000)
										usr << "<B>Your Ki isn't developed enough to learn this technique!"
									else if(usr.skpts < 50)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.kame = 0
										usr.skpts -= 50
										usr.skills += new /obj/techs/sgkgalit
										alert("Buu: Buu teach you, 'Super Ghost Kamikaze Attack (Galit Gun)'!")
								else
									alert("Buu: Buu you aren't Buu, Earthling or Half-Saiyan!")
							if("Nothing")
								alert("Buu: Bye bye!")

		DeadNamek
			name = "(NPC) Dead Namekian"
			race = "Namek"
			icon = 'icons/mobs.dmi'
			icon_state = "deadnamek"
			npc = 1
			density = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						usr.move = 0
						usr << "<B>You kneel beside the Namekian."
						sleep(25)
						usr.move = 1
						alert("Namekian: Damn, Frieza and his men! He is going to destroy the planet!")
						alert("Namekian: You have [(usr.ssjfpt*-2.95) /60/20] hours left for SSJFP! Hope that helps you with your journey.")
						if(usr.race == "Namek")
							if(usr.nfuse == 0)
								switch(alert("Namekian: Do you wish to fuse with me to defeat Frieza?","Dead Namekian","Yes","No"))
									if("Yes")
										usr.move = 0
										usr.nfuse = 1
										usr.client.show_verb_panel = 0
										usr.hideipan = 1
										usr.overlays += 'icons/wind.dmi'
										usr << "<B>You begin to fuse with the Namekian."
										sleep(rand(100,250))
										usr << "You feel your body growing with Ki energy!"
										view(6) << 'sounds/aura.wav'
										usr.underlays += /obj/MysticAuraTop
										usr.underlays += /obj/MysticAuraBottom
										sleep(rand(100,250))
										usr.powerlevel.max_value += 100000
										usr.ki.max_value += 100000
										usr.powerlevel.value = usr.powerlevel.max_value
										usr.ki.value = usr.ki.max_value
										usr.underlays -= /obj/MysticAuraTop
										usr.underlays -= /obj/MysticAuraBottom
										usr << "<B>You have fused with the Namekian."
										usr.overlays -= 'icons/wind.dmi'
										view(6) << "<FONT COLOR = RED>[usr]: </FONT>Yes! I feel reborn, this power increase is amazing!"
										sleep(50)
										usr.move = 1
										usr.client.show_verb_panel = 1
										usr.hideipan = 0
										usr << "<FONT COLOR = RED>[usr]: </FONT>Goodbye, my friend. I will put Frieza to rest once and for all!"
										usr.npctalk = 0
									if("No")
										usr.npctalk = 0
										alert("Namekian: You stubborn fool, you can't defeat Frieza without my help!")
							else
								usr.npctalk = 0
								alert("You have already fused with the Namekian!")
						else
							usr.npctalk = 0
							..()




		Baba
			name = "(NPC) Baba"
			race = "Earthling"
			icon = 'icons/baba.dmi'
			icon_state = ""
			npc = 1
			dead = 1
			itinvis = 1
			density = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Baba: Greetings, [usr]!")
						switch(alert("Do you want to observe someone through my Crystal Ball?", "Baba","Yes", "No"))
							if("Yes")
								usr << "Saving."
								spawn(17)
									usr.client.SaveMob()
									usr << "Saved."
								var/list/obs=list()
								for(var/mob/characters/O in world)
									obs+=O
									if(O.name == usr.name)
										obs-=O
								var/mob/characters/C=input("Who do you want to observe?","Baba") in obs
								if(C)
									var/oloc = usr.loc
									usr << "<B>Now observing, [C]."
									usr.usebl = 1
									usr.invisibility = 1
									usr.dead = 1
									usr.hideipan = 1
									usr.density = 0
									usr.charges = 0
									usr.move = 0
									usr.kame = 1
									usr.client.show_verb_panel = 0
									usr.hideipan = 1
									usr.meditate = 2
									usr.rest = 2
									usr.client.eye = C
									usr.client.perspective = EYE_PERSPECTIVE
									usr << "<B>You have one minute before being restored back your normal self."
									sleep(600)
									usr.client.show_verb_panel = 1
									usr.hideipan = 0
									usr.move = 1
									usr.invisibility = 0
									usr.density = 1
									usr.kame = 0
									usr.client.eye = usr
									usr.loc = oloc
									usr.dead = 0
									usr.hideipan = 0
									usr.meditate = 0
									usr.rest = 0
									usr.usebl = 0
									usr.client.SaveMob()
									usr.client.perspective = MOB_PERSPECTIVE
									usr << "<B>You stop observing, [C]."
									usr.npctalk = 0
								else
									usr << "<B>There are any other players on."

							if("No")
								usr.npctalk = 0
								alert("Baba: You do not understand the forutune telling powers I have!")

		SaiyanScientist
			name = "(NPC) Saiyan Scientist"
			powerlevel. = new(6000)
			npc = 1
			race = "Saiyan"
			icon = 'icons/sci.dmi'
			density = 1
			dead = 1
			icon_state = ""
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					usr.npctalk = 0
					switch(input("Saiyan Shopkeeper: Greetings, [usr]!", "Saiyan Shopkeeper",text) in list ("Talk","Buy","Sell","Cancel"))
						if("Talk")
							switch(alert("Do you wish to learn about 'Planet New Vegeta'?", "Saiyan Scientist","Yes", "No"))
								if("Yes")
									alert("Saiyan Scientist: Very well, then.")
									alert("Saiyan Scientist: As you may already know, the original 'Planet Vegeta' was destroyed by Frieza. All Saiyans were thought to be dead except Vegeta.")
									alert("Saiyan Scientist: Later on, Goku, a Saiyan baby sent out just before the destruction of 'Planet Vegeta' approached Earth.")
									alert("Saiyan Scientist: Several battles have occured with Goku and him saving countless lives of others.")
									alert("Saiyan Scientist: Vegeta, who has reached the same age as his father heard of some new kind of cloning technology on Earth that was recently discovered.")
									alert("Saiyan Scientist: Vegeta decided that he wanted to rebuild the Saiyan race and wish the planet of Vegeta that was destroyed by Frieza back to where it was.")
									alert("Saiyan Scientist: Capsule Corp. then cloned 20 Saiyans, 10 male, 10 female to restablish the 'Planet New Vegeta'.")
									alert("Saiyan Scientist: The Cloned Saiyans then were sent to here, where they increased population rapidly.")
									alert("Saiyan Scientist: Now, Saiyans now are back once again thanks to the Earthlings and their technology, so therefore we share technology and friendship between each other.")
									alert("Saiyan Scientist: Capsule Corp. gave us the ablity to create their Capsule technology which allows a big object, for example a Space Pod into a tiny little capsule.")
									alert("Saiyan Scientist: That's mostly the history between the recreation of 'New Vegeta'.")
									alert("Saiyan Scientist: Now, back to my studies.")
									usr << "<B>You watch the Saiyan Scientist work with the computers."

								if("No")
									alert("Saiyan Scientist: Very well, then. Back to my studies.")
									usr << "<B>You watch the Saiyan Scientist work with the computers."

						if("Buy")
							switch(input("What do you want to buy?", "Saiyan Scientist",text) in list ("Saibamen Seeds (5000)","Capsule (Space Pod) (25000)","Cancel"))
								if("Saibamen Seeds (5000)")
									if(usr.zenni <= 4999)
										usr << "<b>You need 5000 zenni!"
									if(usr.zenni >= 5000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 5000
										usr << "<b>You get Saibamen Seeds!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/saibaseeds

								if("Capsule (Space Pod) (25000)")
									if(usr.zenni <= 24999)
										usr << "<b>You need 25000 zenni!"
									if(usr.zenni >= 25000)
										usr << "Zenni taken & recieved."
										usr.zenni -= 25000
										usr << "<b>You get a Capsule (Space Pod)!"
										view(6) << 'sounds/zenni.wav'
										usr.contents += new /obj/items/space_capsule

								if("Cancel")
									alert("Saiyan Scientist: Alright then, goodbye!")

						if("Sell")
							var/list/Sellable=list()
							for(var/obj/items/O in usr.contents)
								if(!istype(O)) continue
								if(O.value>0)
									Sellable+=O
							var/obj/items/P=input("What do you want to sell?","") in Sellable
							if(!P) return
							switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
								if("Yes")
									if(P && P.worn)
										usr<<"<b>Not while it's being worn."
									else if(P)
										usr<<"<b>You recieve, [P.value] Zenni!"
										usr.zenni+=P.value
										P.loc = locate(0,0,0)
										del(P)


						if("Cancel")
							alert("Saiyan Scientist: Alright then, goodbye!")


		Ki_Trainer1
			name = "(Trainer) Basic Ki Trainer"
			race = "Earthling"
			icon = 'icons/male-white.dmi'
			icon_state = "normal"
			npc = 1
			density = 1
			New()
				. = ..()
				hairrestore()
				overlays += 'icons/clothes-redkaigi.dmi'

			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings [usr]","Ki Trainer")
						var/list/options = list ("Ki Knowledge - 5 skill points","Advanced Ki Knowledge - 10 Skill Points","Cancel")
						switch(input("What do you wish to learn today?" , "Basic Ki Trainer", text) in options)
							if("Ki Knowledge - 5 skill points")
								if(usr.skpts < 5)
									usr << "You need skill points!"
									usr.npctalk = 0

								else if(!usr.kikn && usr.skpts >= 5)
									usr << "You have learned Ki Knowledge!"
									usr.ki.max_value += 50
									usr.kikn = 1
									usr.skpts -= 5
									usr.npctalk = 0

								else if(usr.kikn)
									usr << "You have already learned how to use ki!"
									usr.npctalk = 0

							if("Advanced Ki Knowledge - 10 Skill Points")
								if(!usr.ki_imp && usr.kikn && usr.skpts >= 10)
									usr << "You have learned Advanced Ki Knowledge!"
									usr.ki.max_value += 500
									usr.ki_imp = 1
									usr.skpts -= 10
									usr.npctalk = 0

								else if(usr.ki_imp)
									usr << "You have already learned how to make better use of your ki!"
									usr.npctalk = 0

								else if(usr.skpts < 10)
									usr << "You need skill points!"
									usr.npctalk = 0

								else if(!usr.kikn)
									usr << "You need Ki knowledge!"
									usr.npctalk = 0

							if("Cancel")
								alert("See you later.","Basic Ki trainer")
								usr.npctalk = 0

		Ki_Trainer2
			name = "(Trainer) Advanced Ki Trainer"
			race = "Earthling"
			icon = 'icons/male.dmi'
			icon_state = "normal"
			npc = 1
			density = 1
			New()
				. = ..()
				hairrestore()
				overlays += 'icons/clothes-redkaigi.dmi'
				overlays += 'icons/mysticaura.dmi'

			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings [usr]","Advanced Ki Trainer")
						var/list/options = list ("Ki Control - 20 skill points","Ki Combat - 40 Skill Points","Enhanced Ki Combat - 60 Skill Points","Cancel")
						switch(input("What do you wish to learn today?" , "Ki Trainer", text) in options)
							if("Ki Control - 20 skill points")
								if(!usr.ki_imp)
									usr << "You need Advanced Ki Knowledge!"
									usr.npctalk = 0

								else if(!usr.kicntrl && usr.skpts >= 20)
									usr << "You have learned Ki Control!"
									usr.ki.max_value += 1000
									usr.kicntrl = 1
									usr.skpts -= 20
									usr.npctalk = 0

								else if(usr.skpts < 20)
									usr << "You need skill points!"
									usr.npctalk = 0

								else if(usr.kicntrl)
									usr << "You already learned it!"
									usr.npctalk = 0

							if("Ki Combat - 40 Skill Points")
								if(!usr.kicombt && usr.kicntrl && usr.skpts >= 40)
									usr << "You have learned Ki Combat!"
									usr.ki.max_value += 5000
									usr.kicombt = 1
									usr.skpts -= 40
									usr.npctalk = 0

								else if(usr.kicombt)
									usr << "You already learned it!"
									usr.npctalk = 0

								else if(usr.skpts < 40)
									usr << "You need skill points!"
									usr.npctalk = 0

								else if(!usr.kicntrl)
									usr << "You need Ki Control!"
									usr.npctalk = 0

							if("Enhanced Ki Combat - 60 Skill Points")
								if(!usr.kiultra && usr.kicombt && usr.skpts >= 60)
									usr << "You have learned Enhanced Ki Combat!"
									usr.ki.max_value += 10000
									usr.kiultra = 1
									usr.skpts -= 60
									usr.npctalk = 0

								else if(usr.kiultra)
									usr << "You already learned it!"
									usr.npctalk = 0

								else if(usr.skpts < 60)
									usr << "You need skill points!"
									usr.npctalk = 0

								else if(!usr.kicombt)
									usr << "You need Ki Combat!"
									usr.npctalk = 0

							if("Cancel")
								alert("See you later.","Advanced Ki trainer")
								usr.npctalk = 0

		Goku
			name = "(NPC) Goku"
			race = "Saiyan"
			icon = 'icons/mobs.dmi'
			npc = 1
			density = 1
			icon_state = "gokou"
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings [usr]","Goku")
						switch(input("What are you here for?" , "Goku", text) in list ("Talk","Learn Techniques","Nothing"))
							if("Talk")
								if(usr.kamestudent && !usr.gokuwg)
									alert("Hey, your a student of Master Roshi? Well, maybe you could use some of my clothing for training.","Goku")
									usr.contents += new /obj/items/weightedgokugi
									usr.gokuwg = 1
									usr << "You received <b>Goku's Weighted Training Clothing</b> from Goku"
									if (usr.powerlevel.max_value >= 400000)
										usr << "but you might be too strong to benefit from it..."
									usr.kame = 0
									usr.npctalk = 0
								if(usr.gohansaved)
									if(!usr.goku1)
										alert("Thank you for saving my son.","Goku")
										sleep(10)
										alert("As a reward, I will train you.","Goku")
										usr.goku1 = 1
										usr << "<b><font color=red>*You begin training with Goku*"
										usr.move = 0
										sleep(100)
										usr.powerlevel.max_value += 5000
										alert("There, now you are much more stronger, enjoy","Goku")
										sleep(10)
										alert("Oh!! By the way, heres a senzu bean, it may come in handy.","Goku")
										usr << "You received a <b>Senzu Bean</b> from Goku"
										usr.contents += new /obj/items/senzu
										sleep(10)
										alert("There ya go, see ya later if you need me!","Goku")
										usr << "<b><font color=green>*Quest Completed!*"
										usr.move = 1
										usr.npctalk = 0
									else
										alert("It's a very beautiful day today","Goku")
										usr.npctalk = 0
							else
								if("Learn Techniques")
									var/list/options = list ("Chou Kamehameha","Warp Kamehameha","Kamehameha Torpedos","Fusion Dance","Cancel")
									if(prob(1) && usr.powerlevel.max_value > 1280000000)
										options += "Unlock LSSJ"
									switch(input("What do you wish to learn today?" , "Goku", text) in options)
										if("Chou Kamehameha")
											if(!usr.kamestudent)
												alert("You need to have learned the Kamehaemha first.","Goku")
											else
												usr << "You need 120 skill points!"
												if(usr.powerlevel.max_value < 12000000)
													usr << "<B>Your PL isn't developed enough to learn this technique!"
												else if(usr.skpts < 120)
													usr << "<B>You don't have enough skill points."
												else if(!usr.kiultra)
													usr << "<B>You are not skilled enough in ki."
												else
													usr.skills += new /obj/techs/ChouKamehameha
													usr.skpts -= 120
													alert("You have learned Chou Kamehameha","Learning Techniques")
													usr.kame = 0

										if("Warp Kamehameha")
											if(!usr.kamestudent)
												alert("You need to have learned the Kamehaemha first.","Goku")
											else
												usr << "You need 20 skill points!"
												if(usr.powerlevel.max_value < 2000000)
													usr << "<B>Your PL isn't developed enough to learn this technique!"
												else if(usr.skpts < 20)
													usr << "<B>You don't have enough skill points."
												else if(!usr.kicombt)
													usr << "<B>You are not skilled enough in ki."
												else
													usr.skills += new /obj/techs/wKamehameha
													usr.skpts -= 20
													alert("You have learned Warp Kamehameha","Learning Techniques")
													usr.kame = 0

										if("Kamehameha Torpedos")
											if(!usr.kamestudent)
												alert("You need to have learned the Kamehaemha first.","Goku")
											else
												usr << "You need 10 skill points!"
												if(usr.powerlevel.max_value < 100000)
													usr << "<B>Your PL isn't developed enough to learn this technique!"
												else if(usr.skpts < 10)
													usr << "<B>You don't have enough skill points."
												else if(!usr.kicombt)
													usr << "<B>You are not skilled enough in ki."
												else
													usr.skills += new /obj/techs/kametorp
													usr.skpts -= 10
													usr.kame = 0
										if("Unlock LSSJ")
											if(usr.powerlevel.max_value > 1280000000)
												usr.brollievent = 1
												alert("I have unlocked your ability to become a Legendary Super Saiyan","Goku")
										if("Cancel")
											alert("Goodbye","Goku")
										if("Fusion Dance")
											usr << "You need 50 skill points!"
											if(usr.powerlevel.max_value < 1260000)
												usr << "<B>Your PL isn't developed enough to learn this technique!"
											else if(usr.skpts < 50)
												usr << "<B>You don't have enough skill points."
											else if(!usr.kicntrl)
												usr << "<B>You are not skilled enough in ki."
											else
												usr.skills += new /obj/techs/fdance
												usr.skpts -= 50
												usr.kame = 0
												alert("I shall now teach you the Fusion Dance.","Goku")
								if("Nothing")
									alert("See you later.","Goku")
									usr.npctalk = 0

		Yardrat1
			name = "(NPC) Yardratian"
			icon = 'icons/mobs.dmi'
			icon_state = "yardrat1"
			npc = 1
			dead = 1
			density = 1
			verb
				Talk()
					set name = "Talk"
					set category = "Socal"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings, [usr]!")
						alert("We are reconstructing our planet, so please bare with us.")
						usr.npctalk = 0
						usr << "You need 75 skill points!"
						switch(alert("Are you here to learn the 'Instant Transmission' technique?","Dragonball Online","Yes","No"))
							if("Yes")
								if(usr.ap >= 0)
									if(usr.powerlevel.max_value < 2500000)
										usr << "<B>Your PL isn't developed enough to learn this technique!"
									else if(usr.skpts < 75)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/it
										usr.skpts -= 75
										usr.itlearn = 1
										usr.kame = 0
										alert("I shall now teach you, Instant Transmission.")
								else
									alert("Your full of pure evil, get out of here!")

							if("No")
								alert("Well then, feel free to explore the planet!")



		Vegeta
			name = "(NPC) Vegeta"
			icon = 'icons/vegeta.dmi'
			icon_state = ""
			race = "Saiyan"
			npc = 1
			density = 1
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings, [usr]!")
						if(usr.vegetatrain == 0)
							alert("I seem to have left my armor on our last trip to South City, and I need it back.")
							alert("If you help me find my armor, I will let you use my 'Brute Ray' and I'll train you!")
							switch(alert("Do you have the armor?","Dragonball Online","Yes","No"))
								if("Yes")
									for(var/obj/items/vegetaarmor/E in usr.contents)
										if(E)
											if(usr.vegetatrain == 0)
												alert("You have found my armor! You are now allowed to use the 'Brute Ray' and I will now train you!")
												usr.npctalk = 0
												usr.vegetatrain = 1
												usr << "<B>Vegeta begins training you."
												usr.move = 0
												sleep(250)
												usr.move = 1
												usr.powerlevel.max_value += 10000
												usr.ki.max_value += 5000
												usr.contents += new /obj/items/senzu
												usr << "<B>Vegeta hands you a Senzu Bean!"
												alert("There you go, your strength should be increased now! You are also free to learn techniques from me simply ask!")
												del(E)

								if("No")
									usr.npctalk = 0
									alert("Alright, it should be around South City. Besure to check everywhere!")
						else
							usr.npctalk = 0
							return

				Learn()
					set name = "Learn"
					set category = "Other"
					set src in oview(1)
					if(usr.vegetatrain == 0)
						alert("Get my armor and I'll train you first!")
					else
						if(usr.vegetatrain == 1)
							switch(input("What do you wish to learn today?" , "Vegeta", text) in list ("Big Bang Attack","Final Flash","Galit Gun","Self-Destruct","None"))
								if("Big Bang Attack")
									usr << "You need 30 skill points!"
									if(usr.powerlevel.max_value < 700000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 30)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/BigBang
										usr.skpts -= 30
										alert("I shall now teach you Big Bang Attack.")
								if("Final Flash")
									usr << "You need 200 skill points!"
									if(usr.powerlevel.max_value < 5000000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 200)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kiultra)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/FinalFlash
										usr.skpts -= 200
										alert("I shall now teach you Final Flash.")
								if("Galit Gun")
									usr << "You need 10 skill points!"
									if(usr.powerlevel.max_value < 18000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 10)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicntrl)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/GalicGun
										usr.skpts -= 10
										alert("I shall now teach you Galit Gun.")
								if("Self-Destruct")
									usr << "You need 200 skill points!"
									if(usr.powerlevel.max_value < 12000000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 200)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kiultra)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/selfdestruct
										usr.skpts -= 200
										alert("I shall now teach you Self-Destruct.")

		Gotenks
			name = "(NPC) Gotenks"
			icon = 'icons/mobs.dmi'
			icon_state = "gotenks"
			race = "Fused Saiyan"
			npc = 1
			density = 1
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						switch(input("What do you wish to learn today?" , "Gotenks", text) in list ("Cosmic Halo","Super Ghost Kamikaze Attack","Nothing"))
							if("Cosmic Halo")
								if(usr.race == "Earthling"||usr.race == "Saiyan"||usr.race == "Half-Saiyan")
									usr << "You need 25 skill points!"
									if(usr.powerlevel.max_value < 250000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 25)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/cosmichalo
										usr.skpts -= 25
										alert("I shall now teach you Cosmic Halo.")
									usr.npctalk = 0
								else
									usr.npctalk = 0
									alert("Your not a Saiyan, Half-Saiyan or an Earthling.")

							if("Super Ghost Kamikaze Attack")
								if(usr.race == "Earthling"||usr.race == "Half-Saiyan"||usr.race == "Buu")
									usr << "You need 50 skill points!"
									if(usr.powerlevel.max_value < 1000000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 50)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.npctalk = 0
										usr.skills += new /obj/techs/sgk
										usr.skpts -= 50
										alert("I shall now teach you, Super Ghost Kamikaze Attack.")
									usr.npctalk = 0
								else
									usr.npctalk = 0
									alert("Your not a Half-Saiyan or an Earthling.")

							if("Nothing")
								usr.npctalk = 0
								alert("Gotenks: See ya later!")
		Trunks
			name = "(NPC) Trunks"
			race = "Half-Saiyan"
			icon = 'icons/mobs.dmi'
			npc = 1
			density = 1
			icon_state = "trunkss"
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Trunks: Hello, [usr]!")
						usr.npctalk = 0
						switch(input("Trunks: What technique do you wish to learn?" , "Trunks", text) in list ("Burning Attack","Anger","Nothing"))
							if("Burning Attack")
								usr << "You need 25 skill points!"
								if(usr.race == "Half-Saiyan")
									if(usr.powerlevel.max_value < 250000)
										usr << "<B>You need to be stronger."
									else if(usr.skpts < 25)
										usr << "<B>You don't have enough skill points."
									else if(!usr.kicntrl)
										usr << "<B>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/burning
										usr.skpts -= 25
										alert("I shall now teach you Burning Attack.")
								else
									alert("Your not a Half-Saiyan.")
							if("Anger")
								usr << "<B>You're so mad, you're so mad, you're so mad!!"
								usr.anger = 10

		Yamcha
			name = "(NPC) Yamcha"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			npc = 1
			density = 1
			icon_state = "yamcha"
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Yamcha: Hi, [usr]! What's up?")
						usr.npctalk = 0
						if(usr.race == "Earthling")
							usr << "You need 25 skill points!"
							switch(alert("Yamcha: Do you wish to learn the technique, 'Spirit Ball' ?","Yamcha","Yes", "No"))
								if("Yes")
									if(usr.race == "Earthling")
										if(usr.powerlevel.max_value < 250000)
											usr << "<B>You need to be stronger."
										else if(usr.skpts < 25)
											usr << "<B>You don't have enough skill points."
										else if(!usr.kicombt)
											usr << "<B>You are not skilled enough in ki."
										else
											usr.skills += new /obj/techs/spiritball
											usr.skpts -= 25
											alert("Yamcha: I shall now teach you 'Spirit Ball'.")
									else
										alert("Yamcha: Your not a Earthling.")


								if("No")
									alert("Yamcha: Alrighty, then!")

							usr << "You need 75 skill points!"
							switch(alert("Yamcha: Do you wish to learn the technique, 'Wolf Fang Fist' ?","Yamcha","Yes", "No"))
								if("Yes")
									if(usr.race == "Earthling")
										if(usr.powerlevel.max_value < 750000)
											usr << "<B>You need to be stronger."
										else if(usr.skpts < 75)
											usr << "<B>You don't have enough skill points."
										else
											usr.skills += new /obj/techs/wff
											usr.skpts -= 75
											alert("Yamcha: I shall now teach you 'Wolf Fang Fist'.")
									else
										alert("Yamcha: Your not a Earthling.")


								if("No")
									alert("Yamcha: Alrighty, then!")

		Trainer
			name = "(NPC) Trainer"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			npc = 1
			icon_state = "trainer"
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					if(usr.npctalk)
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						switch(input("What do you wish to learn today?", "Trunks", text) in list ("Adept Fighting Style","Advanced Fighting Style","Nothing"))
							if("Adept Fighting Style")
								usr << "You need 20 skill points!"
								if(usr.ki.max_value < 75000)
									usr << "<b>Your Ki needs to be developed more."
								else if(usr.skpts < 20)
									usr << "<B>You don't have enough skill points."
								else
									usr.contents += new /styles/adept
									usr.skpts -= 20
									alert("I shall now teach you, Adept Fighting Style.")

							if("Advanced Fighting Style")
								usr << "You need 50 skill points!"
								if(usr.ki.max_value < 250000)
									usr << "<b>Your Ki needs to be developed more."
								else if(usr.skpts < 50)
									usr << "<B>You don't have enough skill points."
								else
									usr.contents += new /styles/advanced
									usr.skpts -= 50
									alert("I shall now teach you, Advanced Fighting Style.")
						usr.npctalk = 0
		Krillin
			name = "Krillin"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			icon_state = "krillin"
			npc = 1
			Click()
				if(usr.npctalk)
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1
					alert("Krillin: Hey, [usr]!")
					usr.npctalk = 0


		Pikkon
			name = "(NPC) Pikkon"
			race = "Mutant"
			icon = 'icons/pikkon.dmi'
			npc = 1
			dead = 1
			Click()
				if(src in oview(1))
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1


						switch(input("Pikkon: What do you want, [usr]?", "Pikkon", text) in list ("Talk","Learn Techniques","Training","Cancel"))
							if("Talk")
								usr.npctalk = 0
								alert("Pikkon: Hmph..")

							if("Training")
								alert("Pikkon: Hmph..")
								if(usr.strain)
									if(usr.sfinish == 0)
										alert("Pikkon: So, West Kai's new fighter? Well, let's get started!")
										var/mob/N = new /monster/quest/Pikkon(locate(21,47,14))
										usr << "<B>You have 5 minutes before Pikkon automatically dissappears."
										usr.npctalk = 0
										usr.strain = 2
										spawn(3000)
											if(N)
												if(usr) usr.strain = 1
												del(N)
									else
										usr.npctalk = 0
										..()
								else
									usr.npctalk = 0
									..()

							if("Learn Techniques")
								usr << "<B>This technique costs 15 skill points!"
								switch(alert("Pikkon: Do you want to learn the technique, 'Thunder Flash Attack'?","Pikkon","Yes", "No"))
									if("Yes")
										if(usr.race == "Namek")
											usr << "You need 15 skill points!"
											if(usr.powerlevel.max_value < 55000)
												usr << "<B>You need to be stronger."
											else if(usr.skpts < 12)
												usr << "<B>You don't have enough skill points."
											else if(!usr.kicombt)
												usr << "<B>You are not skilled enough in ki."
											else
												usr.skills += new /obj/techs/ThunderAtt
												usr.skpts -= 15
												usr.kame = 0
												usr << "<B>You have learned, 'Thunder Flash Attack'!"
											usr.npctalk = 0
										else
											alert("Pikkon: Only Nameks can learn this technique!")
											usr.npctalk = 0

									if("No")
										alert("Pikkon: Hmph..")
										usr.npctalk = 0

							if("Cancel")
								alert("Pikkon: Heh, seems like you don't need my great power!")
								usr.npctalk = 0

		Janemba
			name = "(NPC) Janemba"
			race = null
			icon = 'icons/janemba.dmi'
			npc = 1
			dead = 1
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					usr.npctalk = 0
					if(usr.ap <= 0)
						alert("Janemba: Greetings, [usr]!")
						switch(alert("Janemba: Do you want to learn the technique, 'Bunkai Teleport'?","Janemba","Yes", "No"))
							if("Yes")
								if(usr.ap < -25)
									usr << "You need 75 skill points!"
									if(usr.powerlevel.max_value < 750000)
										usr << "<b>You need to be stronger."
									else if(usr.kills < 75)
										usr << "<b>You have not yet experienced the true joy of killing."
									else if(usr.skpts < 75)
										usr << "<b>You don't have enough skill points."
									else if(!usr.kicombt)
										usr << "<b>You are not skilled enough in ki."
									else
										usr.skills += new /obj/techs/bt
										usr.skpts -= 75
										usr.kame = 0
										usr << "<B>You have learned, 'Bunkai Teleport'!"

							if("No")
								alert("Janemba: Very well then.")
					else
						alert("Janemba: Get out of here, you filth!")



		Piccolo
			name = "(NPC) Piccolo"
			race = "Namek"
			icon = 'icons/mobs.dmi'
			icon_state = "piccolo"
			npc = 1
			New_Tech = "Heal"
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					alert("Piccolo: Greetings, [usr]!")
					usr.npctalk = 0
					switch(input("Piccolo: What do you need?" , "Piccolo", text) in list ("Talk","Learn Techniques","Learn Stances","Cancel"))
						if("Talk")
							alert("Piccolo: Remember, many things can be learned from meditation. Besure to do it often!")

						if("Learn Techniques")
							switch(input("Piccolo: What do you want to learn?", "Piccolo", text) in list ("Special Beam Cannon","Hellzone Grenade","Scatter Shot","Eye Laser","Masenko","Cancel"))
								if("Hellzone Grenade")
									switch(alert("Piccolo: Do you want to learn the technique, 'Hellzone Grenade'?","Piccolo","Yes", "No"))
										if("Yes")
											if(usr.race == "Namek"||usr.race == "Earthling")
												usr << "You need 100 skill points!"
												if(usr.ki.max_value < 550000)
													usr << "<b>Your Ki needs to be developed more."
												else if(usr.skpts < 100)
													usr << "<b>You don't have enough skill points."
												else if(!usr.kicombt)
													usr << "<b>You are not skilled enough in ki."
												else
													usr.kame = 0
													usr.skills += new /obj/techs/hellzone
													usr.skpts -= 100
													usr << "<B>You have learned, 'Hellzone Grenade'!"
											else
												alert("Piccolo: Only Namekians and Earthlings can learn this technique!")

										if("No")
											alert("Piccolo: Very well, then!")

								if("Special Beam Cannon")
									switch(alert("Piccolo: Do you want to learn the technique, 'Special Beam Cannon'?","Piccolo","Yes", "No"))
										if("Yes")
											if(usr.race == "Namek"||usr.race == "Android (Biological)")
												usr << "You need 50 skill points!"
												if(usr.ki.max_value < 250000)
													usr << "<b>Your Ki needs to be developed more."
												else if(usr.skpts < 50)
													usr << "<b>You don't have enough skill points."
												else if(!usr.kicombt)
													usr << "<b>You are not skilled enough in ki."
												else
													usr.kame = 0
													usr.skills += new /obj/techs/sbc
													usr.skpts -= 50
													usr << "<B>You have learned, 'Special Beam Cannon'!"
											else
												alert("Piccolo: Only Namekians and Biological Androids can learn this technique!")

										if("No")
											alert("Piccolo: Very well, then!")

								if("Eye Laser")
									switch(alert("Piccolo: Do you want to learn the technique, 'Eye Laser'?","Piccolo","Yes", "No"))
										if("Yes")
											if(usr.race == "Namek")
												usr << "You need 10 skill points!"
												if(usr.ki.max_value < 9800)
													usr << "<b>Your Ki needs to be developed more."
												else if(usr.skpts < 10)
													usr << "<b>You don't have enough skill points."
												else if(!usr.kicntrl)
													usr << "<b>You are not skilled enough in ki."
												else
													usr.kame = 0
													usr.skills += new /obj/techs/eyelaser
													usr.skpts -= 10
													usr << "<B>You have learned, 'Eye Laser'!"
											else
												alert("Piccolo: Only Namekians can learn this technique!")

										if("No")
											alert("Piccolo: Very well, then!")

								if("Masenko")
									switch(alert("Piccolo: Do you want to learn the technique, 'Masenko'?","Piccolo","Yes", "No"))
										if("Yes")
											if(usr.race == "Namek"||usr.race == "Earthling"||usr.race == "Android (Biological)")
												usr << "You need 20 skill points!"
												if(usr.ki.max_value < 12000)
													usr << "<b>Your Ki needs to be developed more."
												else if(usr.skpts < 20)
													usr << "<b>You don't have enough skill points."
												else if(!usr.kicntrl)
													usr << "<b>You are not skilled enough in ki."
												else
													usr.kame = 0
													usr.skills += new /obj/techs/Masenko
													usr.skpts -= 20
													usr << "<B>You have learned, 'Masenko'!"
											else
												alert("You need to be of the Namekian or the Earthling race.")

										if("No")
											alert("Piccolo: Very well, then!")

								if("Scatter Shot")
									switch(alert("Piccolo: Do you want to learn the technique, 'Scatter Shot'?","Piccolo","Yes", "No"))
										if("Yes")
											if(usr.race == "Namek"||usr.race == "Earthling"||usr.race == "Android (Biological)")
												usr << "You need 15 skill points!"
												if(usr.ki.max_value < 50000)
													usr << "<b>Your Ki needs to be developed more."
												else if(usr.skpts < 15)
													usr << "<b>You don't have enough skill points."
												else if(!usr.kicombt)
													usr << "<b>You are not skilled enough in ki."
												else
													usr.kame = 0
													usr.skills += new /obj/techs/scatter
													usr.skpts -= 15
													usr << "<B>You have learned, 'Scatter Shot'!"
											else
												alert("Piccolo: Only Namekians, Earthlings, and Biological Androids can learn this technique!")

										if("No")
											alert("Piccolo: Very well, then!")


						if("Learn Stances")
							switch(alert("Piccolo: Do you want to learn 'Ancient Namekian Stance'?","Piccolo","Yes", "No"))
								if("Yes")
									if(usr.race == "Namek")
										usr << "You need 100 skill points!"
										if(usr.ki.max_value < 1100000)
											usr << "<b>Your Ki needs to be developed more."
										else if(usr.skpts < 100)
											usr << "<b>You don't have enough skill points."
										else if(!usr.kicntrl)
											usr << "<b>You are not skilled enough in ki."
										else
											usr.contents += new /styles/namek
											usr.skpts -= 100
											usr << "<B>You have learned, 'Ancient Namekian Stance'!"
									else
										alert("Piccolo: Only Namekians can learn this stance!")

								if("No")
									alert("Piccolo: Very well, then!")

						if("Cancel")
							alert("Piccolo: Very well, then!")


		SatanBoy
			name = "(NPC) Boy"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			icon_state = "boy"
			npc = 1
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					alert("Boy: Hiya, Welcome to Satan City! Named after the great Martial Arts Champion himself, Mr. Satan! He is my favorite!")
					usr.npctalk = 0





		Tapion
			name = "(NPC) Tapion"
			race = null
			icon = 'icons/tapion.dmi'
			icon_state = ""
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Tapion: Greetings, [usr]!")
						usr.npctalk = 0
						if(usr.tq2 )
							usr.powerlevel.value += 0
						else
							switch(input("Tapion: Have you come here for my flute?", "Tapion's Flute", text) in list ("Yes, I have.","No. I have not."))
								if("Yes, I have.")
									if(usr.ap > 25)
										alert("Tapion: My flute is a powerful object, one that contains healing powers and can turn a person from evil to good.")
										alert("Tapion: However, My flute was destroyed by some very powerful evils, I can forge another one.")
										alert("Tapion: First, destroy the evils that have returned from the dead and find the destroyed flute piece.")
										switch(input("Tapion: Have you found the Flute piece?", "Tapion's Flute", text) in list ("Yes","No"))
											if("Yes")
												for(var/obj/items/flutepiece/F in usr.contents)
													if(F)
														if(usr.tq1 )
															switch(input("Tapion: Do you want me to make a flute from this peice?", "Tapion's Flute", text) in list ("Yes","No"))
																if("Yes")
																	alert("Tapion: The flute has been forged! Thank you for your help hero, and remember only to use this flute for the good.")
																	usr << "<B><FONT COLOR = BLUE>You have recieved 'Tapion's Flute'!"
																	usr.contents += new /obj/items/flute
																	usr << "<FONT COLOR = BLUE>Your body feels restored!"
																	usr.powerlevel.restore()
																	usr.ki.restore()
																	usr.stamina.restore()
																	usr.tq2 = 1
																	usr.tapion = 0
																	del(F)
														else
															switch(input("Tapion: Are you willing to sacrifice some of your blood? (10 million powerlevel will be taken from your Maximum Powerlevel.)", "Tapion's Flute", text) in list ("Yes","No"))
																if("Yes")
																	if(usr.powerlevel.max_value > 10000000)
																		usr.tq1 = 1
																		usr.powerlevel.max_value -= 10000000
																		alert("Tapion: The flute has been forged! Thank you for your help hero, and remember only to use this flute for the good.")
																		usr << "<B><FONT COLOR = YELLOW>You have recieved 'Tapion's Flute'!"
																		usr.contents += new /obj/items/flute
																		usr << "<FONT COLOR = YELLOW>Your body feels restored!"
																		usr.powerlevel.restore()
																		usr.ki.restore()
																		usr.stamina.restore()
																		usr.tq2 = 1
																		usr.tapion = 0
																		del(F)
																	else
																		alert("Tapion: You do not have enough powerlevel to sacrifice enough blood.")
													else
														alert("Tapion: You do not have the Flute piece, go defeat the reborn evils that have taken my flute.")
											else
												alert("Tapion: My flute is only for the good, and this place is for only the good, you must leave now.")
									else
										alert("Tapion: My flute is only for the good, and this place is for only the good, you must leave now.")

		TeenGoten
			name = "(NPC) Teen Goten"
			race = "Half Saiyan"
			icon = 'icons/Teen Goten.dmi'
			icon_state = ""
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					alert("Hmm..I wonder where Feliz is..")


		MrSatan
			name = "(NPC) Mr. Satan"
			race = "Earthling"
			icon = 'icons/Satan.dmi'
			icon_state = ""
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Mr. Satan: YEEEAAHHH! I am Mr. Satan, World Martial Arts champion! No one can beat me!")
						sleep(25)
						usr.npctalk = 0
						if(usr.squest == 0)
							alert("Mr. Satan: Hey, uhh.. someone told me that there's a problem in South City, south of here with a dinosaur attacking someone's house, they want me to go help.")
							alert("Mr. Satan: But, I'm a bit too busy and I'm in alot of pain after fighting Cell.")
							switch(alert("Mr. Satan: Will you help me? If you do, I'll give you admittance to my personal training area and I'll give you my autograph!","Mr. Satan","Yes", "No"))
								if("Yes")
									if(usr.eggs >= 1)
										for(var/obj/items/dinoeggs/E in usr.contents)
											if(E)
												if(usr.squest == 0)
													usr.squest = 1
													usr.eggs = 0
													usr.contents += new /obj/items/autograph
													usr.powerlevel.max_value += 850
													usr.ki.max_value += 475
													usr << "<B>You feel your powerlevel increase!"
													usr << "<B>You feel your ki increase!"
													alert("Mr.Satan: Good, here is your reward.")
													usr << "<B>You recieve a, 'Autograph (Mr.Satan)'"
													usr.auto = 1
													alert("Mr.Satan: Simply show the people next to my training area and they will let you in!")
									else
										alert("Mr. Satan: Bring me back a Dinosaur eggs as proof!")

								if("No")
									alert("Mr. Satan: Ahh, forget you then!")
		NewspaperStand
			name = "(NPC) Newspaper Stand"
			noname = 1
			race = ""
			icon = 'icons/news.png'
			icon_state = ""
			npc = 1
			Click()
				var/html = \
{"<html>
<head>
<title>Newspaper Stand</title>
</head>
<body bgcolor="#000000">
[updates_html]
</body>
</html>"}
				usr << browse(html,"window=nstand;display=1;clear=0;size=425x300;border=1;can_close=1;can_resize=1;can_minimize=1;titlebar=1")

		Brolli
			race = "Saiyan"
			icon = 'icons/brolli.dmi'
			icon_state = ""
			npc = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Brolli: Greetings, I am Brolli.")
						usr.npctalk = 0
						var/list/options = list("Yes","No","Offers")
						if(prob(1) && usr.powerlevel.max_value > 64000000000 && usr.brollievent )
							options += "Learn LSSJ"
						switch(input("Do you wish to follow the way of 'Brolli'?", "Brolli",text) in options)
							if("Yes")
								if(usr.race == "Saiyan"||usr.race == "Half-Saiyan")
									usr.master = "Brolli"
								else
									usr << "You are not a Saiyan or a Half-Saiyan."

							if("Offers")
								alert("You can learn currently: False Moon, Renzoku Energy Dan")
								if(usr.mechquest1 )
									if(locate(/obj/items/quest/techanalyser/t2) in usr)
										alert("Brolli: Why are you still here for?")
										usr.npctalk = 0
										return
									alert("Brolli: Take this and leave filthy android!")
									usr.contents += new /obj/items/quest/techanalyser/t2
									usr << "You have recieved Techanlyser Part 2"
									usr.npctalk = 0
									..()
								else
									usr.npctalk = 0
									..()
							if("Learn LSSJ")
								if(usr.powerlevel.max_value > 64000000000 && usr.brollievent )
									usr.contents += new /obj/transes/lssj
									usr << "<b>Brolli</b>: You can now become a '<font color=blue>Legendary Super Saiyan</font>'"
									if(!frelssj)
										if(!usr.fused && usr.key != "Wu-Wu")
											frelssj = "Name: [usr.name], Key: [usr.key], Month: [getMonth(usr)], Year: [getYear(usr)]"
											world << "<font size = 5><font color = red><b>[usr.name] has discovered the transformation: LSSJ</b></font></font>"
				Learn()
					set src in oview(1)
					set category = "Other"
					if(usr.master == "Brolli")
						switch(input("Do you wish to learn the technique, 'Renzoku Energy Dan'?" , "Brolli", text) in list ("Yes","No"))
							if("Yes")
								usr << "You need 25 skill points!"
								if(usr.ki.max_value < 100000)
									usr << "<b>Your Ki needs to be developed more."
								else if(usr.skpts < 25)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicombt)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/renzoku
									usr.skpts -= 25
							if("No")
								..()

						switch(input("Do you wish to learn the technique, 'False Moon'?" , "Brolli", text) in list ("Yes","No"))
							if("Yes")
								usr << "You need 50 skill points!"
								if(usr.ki.max_value < 26000)
									usr << "<b>Your Ki needs to be developed more."
								else if(usr.skpts < 50)
									usr << "<b>You don't have enough skill points."
								else if(!usr.kicntrl)
									usr << "<b>You are not skilled enough in ki."
								else
									usr.skills += new /obj/techs/moonblast
									usr. -= 50
							if("No")
								..()
					else
						alert("You are not my student!")

		Gero
			name = "Gero"
			race = "Android (Mechanical)"
			icon = 'icons/mobs.dmi'
			New_Tech= "Materialize"
			npc = 1
			icon = 'icons/Dr Gero.dmi'
			icon_state = "Hat"
			New()
				..()
				spawn(0)
					Wander()
			proc/Wander()
				while(src)
				{
					sleep(150)
					for(var/obj/gerometaltable/gbt in view(10))
						walk_towards(src,gbt,10)
						sleep(300)
					for(var/turf/gerospot/gspot in view(10))
						walk_towards(src,gspot,5)
						sleep(300)
					for(var/obj/metaltable/mbt in view(10))
						walk_towards(src,mbt,10)
						sleep(300)
					for(var/turf/gerospot/gspot in view(10))
						walk_towards(src,gspot,5)
						sleep(150)
				}

			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					switch(input("Dr. Gero: Greetings, [usr]? What do you need?", "Dr. Gero",text) in list ("Talk","Android Upgrade","Learn Techniques","Cancel"))
						if("Talk")
							if(usr.race == "Android (Biological)")
								if(usr.cellq == 4)
									alert("Gero: Go get powerful and defeat Goku!!")
									usr.npctalk = 0
								else if(usr.cellq == 3)
									alert("Gero: I see that you have absorbed both Android 17 and 18! It also looks like you forgot how to spawn your Juniors, let me remind you how to.")
									usr.contents += /obj/techs/scj
									alert("Gero: There you go, now take over the world and let them be afraid of the name Red Ribbon Army!")
									usr.cellq = 4
									usr.npctalk = 0
								else if(usr.cellq == 2 || usr.cellq == 1)
									alert("Gero: You are not that powerful yet!")
									usr.npctalk = 0
								else
									alert("Gero: Hmmm, go look  some people to absorb to become powerful than talk to me again. Look for my other androids too!!")
									usr.npctalk = 0
									usr.cellq = 1
							else if(usr.race == "Android (Mechanical)")
								if(usr.mechquest1 != 1 && usr.mechquest1 != 2&& usr.mechquest1 != 3&& usr.mechquest1 != 4)
									switch(alert("Dr.Gero: I have a job for you to do, are you willing to accept it?",null,"Yes","No"))
										if("No")
											alert("Dr.Gero: I thought I had built you to obey me!")
											usr.npctalk = 0
										if("Yes")
											alert("Dr.Gero: Very well. Your objective is to find 5 different pieces for an item known as the \"Techanalyser\". It's importance shall be noted to you later!")
											usr.npctalk = 0
											usr.mechquest1 = 1
								else if(usr.mechquest1 )
									switch(alert("Dr.Gero: Did you got all 5 parts?",null,"Yes","No"))
										if("No")
											alert("Dr.Gero: Very well. Your objective is to find 5 different pieces for an item known as the \"Techanalyser\". It's importance shall be noted to you later!")
											usr.npctalk = 0
										if("Yes")
											for(var/obj/items/quest/techanalyser/t1/t1 in usr.contents)for(var/obj/items/quest/techanalyser/t2/t2 in usr.contents)for(var/obj/items/quest/techanalyser/t3/t3 in usr.contents)for(var/obj/items/quest/techanalyser/t4/t4 in usr.contents)for(var/obj/items/quest/techanalyser/t5/t5 in usr.contents)
												if(t1 && t2 && t3 && t4 && t5)
													usr << "Dr.Gero: Very well, now we shall make the \"Techanalyser\""
													del(t1)
													del(t2)
													del(t3)
													del(t4)
													del(t5)
													for(var/obj/gerometaltable/gbt in view(6))
														var/wb2 = get_dist(src,gbt)
														walk_towards(src,gbt,10)
														sleep(wb2*10)
													usr << "You hear Dr. Gero typing away as well as something that resembles metal being weilded."
													sleep(rand(100,300))
													var/wb = get_dist(src,usr)
													walk_towards(src,usr,5)
													sleep(wb*5)
													usr << "Dr. Gero hands you the \"Techanalyser\"!"
													usr.contents += new /obj/items/quest/techanalyser/ta
													usr << "Dr.Gero: The \"Techanalyser\" is completed. Scan a person with this to learn their technique but remember, everything has a price"
													usr.mechquest1 = 2
													usr.npctalk = 0
													for(var/turf/gerospot/gspot in world)
														var/wb1 = get_dist(src,gspot)
														walk_towards(src,gspot,5)
														sleep(wb1*5)
													return
												else
													alert("Dr Gero: Make sure you get all 5 parts!")
													usr.npctalk = 0
								else if(usr.mechquest1 == 2)
									usr << "Use the techanalyser to help you!"
									usr.npctalk = 0
								else if(usr.mechquest1 == 3)
									if(usr.abl == 3)
										alert("I can't build you another Techanalyser nor can I fix up your bomb!")
										usr.npctalk = 0
									else if(usr.abl == 2)
										alert("Dr. Gero: Good, you have destroyed Goku! Here's you award..hehehe..")
										for(var/obj/gerometaltable/gbt in view(6))
											var/wbt = get_dist(src,gbt)
											walk_towards(src,gbt,5)
											walk_towards(usr,src,5)
											sleep(wbt*5+10)
										var/mx = usr.x
										var/my = usr.y
										var/mz = usr.z
										usr.loc = locate(0,0,0)
										usr << "You hear Dr. Gero opening and putting something inside you."
										sleep(rand(200,600))
										usr.loc = locate(mx,my,mz)
										usr.skills += new /obj/techs/andb/
										usr << "Dr.Gero: You're reward is a bomb inside you. Use it as a final, desperate attack against your enemy. There is a 2 to 4 hour waiting period after that though!"
										usr.abl = 3
										usr.npctalk = 0
										for(var/turf/gerospot/gspot in world)
											var/wbtb = get_dist(src,gspot)
											walk_towards(src,gspot,5)
											walk_towards(usr,src,5)
											sleep(wbtb*5+10)
											walk_to(usr,0)
										return

									else
										usr << "Sorry but I can't build you another Techanalyser but.. destroy Goku and come see me again for a reward!"
										usr.abl = 1
										usr.npctalk = 0

								else
									alert("Dr.Gero: What are you doing back here for? I DEMAND AN ANSWER! Fine, get lost now!")
									usr.npctalk = 0

							else
								alert("Dr. Gero: There is nothing to talk about! Get out of here!")
								usr.npctalk = 0


						if("Learn Techniques")
							if(usr.race == "Android (Biological)")
								switch(input("Do you wish to learn the technique, 'World Sense'?" , "Gero", text) in list ("Yes","No"))
									if("Yes")
										if(usr.powerlevel.max_value < 16000)
											usr.npctalk = 0
											usr << "You need to be a bit stronger."
										if(usr.powerlevel.max_value >= 16000)
											usr.skills += new /obj/techs/worldscan
											usr.npctalk = 0
							else
								alert("Dr. Gero: There is nothing for you to learn!")
								usr.npctalk = 0

						if("Android Upgrade")
							if(usr.upgrade )
								alert("I have already upgraded you!")
								usr.npctalk = 0
							else
								if(usr.race == "Android (Mechanical)")
									switch(alert("Do you want me to upgrade your body?(note by getting this you will not be able to get mystic) (This process takes up to 5 minutes.)","Dr.Gero","Yes","No"))
										if("Yes")
											if(usr.upgrade )
												alert("I have already upgraded you!")
												usr.npctalk = 0
											else
												if(usr.powerlevel.max_value >= 2600000)
													if(usr.blueprints )
														for(var/obj/items/ablueprints/A in usr.contents)
															if(A.expkk != usr.key || A.expkn != usr.name)
																del(A)
																alert("You did not earned this blueprint!")
																return
															else
																usr.npctalk = 0
																usr << "<B><Font color = red>Dr. Gero begins to upgrade your body."
																usr.upgrade = 1
																if(A)
																	del(A)
																usr.move = 0
																usr.sight = 1
																sleep(3000)
																usr.move = 1
																usr.sight = 0
																usr.powerlevel.max_value *= 2.5
																usr.ki.max_value *= 2.5
																usr.contents += new /obj/transes/supera
																usr.skills += new /obj/techs/andskisphere
																usr.skills += new /obj/techs/laserf
																usr << "<B><FONT COLOR = YELLOW>You have learned 'Ki Sphere'."
																usr << "<B><FONT COLOR = YELLOW>You have learned 'Finger Laser'."
																usr << "<B><FONT COLOR = RED>Dr. Gero completes upgrading your body."
																usr.npctalk = 0
																return
														alert("You must have the blueprints!")
														usr.npctalk = 0
														return
													else
														alert("Dr. Gero: You do not have the Blueprints!")
														usr.npctalk = 0
												else
													alert("Dr. Gero: You aren't strong enough!")
													usr.npctalk = 0
								else
									alert("Dr. Gero: Your not a Mechanical Android!")
									usr.npctalk = 0

						if("Cancel")
							alert("Dr. Gero: Remember, walk in the name of the Red Ribbon Army!")
							usr.npctalk = 0



		Oldkaioshin
			name = "(NPC) Old Kaioshin"
			powerlevel. = new(7400000)
			race = "Kaioshin"
			icon = 'icons/olddude.dmi'
			npc = 1
			dead = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Greetings, I am Old Kaioshin.")
						switch(input("Do you wish to follow the way of 'Mystic'?", "Old Kaioshin",text) in list ("Yes","No","Offers"))
							if("Yes")
								if(usr.upgrade == 1)
									if(usr.race == "Android (Mechanical)")
										alert("You can't learn Mystic.")
										usr.npctalk = 0
										usr.master = ""
									else
										usr.master = "Old Kaioshin"
										usr.npctalk = 0
								else
									usr.master = "Old Kaioshin"
									usr.npctalk = 0
							if("Offers")
								alert("I will unlock your ultimate potential in a ritual that takes hours")
								usr.npctalk = 0
							else
								alert("You young folk don't appreciate a true master")
								usr.npctalk = 0

				Learn()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						if(usr.master == "Old Kaioshin")
							if(usr.mystlearn )
								alert("You already learned Mystic!")
								usr.npctalk = 0
							else
								if(usr.mystlearning )
									switch(alert("Do you want stop learning Mystic? You can train again later but you will have to start the time all over again",null,"Yes","No"))
										if("Yes")
											usr.overlays -= 'icons/wind.dmi'
											usr.underlays -= 'icons/mysticaura.dmi'
											usr.underlays -= /obj/MysticAuraTop
											usr.underlays -= /obj/MysticAuraBottom
											usr.move = 1
											usr.wspecial = 0
											usr.icon_state = ""
											usr.mystt = 2000
											usr.mystlearning = 0
											usr.npctalk = 0
											alert("You did not learn the Mystic Transformation.")
											return
										if("No")
											usr.npctalk = 0
											alert("Very well, let's continue training")

								else
									switch(input("Do you wish to learn the technique, 'Mystic\n(You must wait 1-2 hours for the power-up to be completed, and you still lose any form of super saiyan you have)" , "Old Kaioshin", text) in list ("Yes","No"))
										if("Yes")
											if(usr.powerlevel.max_value < 16000000)
												alert("You are too weak to learn this technique.")
												usr.npctalk = 0
											if(usr.powerlevel.max_value >= 16000000)
												usr.mystt += rand(60,120)
												usr.npctalk = 0
												usr.move = 0
												usr.mystlearning = 1
												usr.icon_state = "meditate"
												usr.mystlearn()
						else
							alert("You are not my student!")
							usr.npctalk = 0

		Wizard
			name = "(NPC) Babidi"
			powerlevel. = new(7400000)
			race = "Wizard"
			icon = 'icons/wizard.dmi'
			npc = 1
			dead = 1
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					switch(input("Babidi: Greetings, [usr]? What do you need?", "Babidi",text) in list ("Talk","Learn Spells","Cancel"))
						if("Talk")
							if(findtext(usr.race,"Wizard"))
								usr.npctalk = 0
								alert("Babidi: Remember, learn and use these precious spells to destroy your opponents!")
							else
								usr.npctalk = 0
								alert("Babidi: Get out of here!")

						if("Learn Spells")
							if(findtext(usr.race,"Wizard"))
								if(usr.fused )
									alert("You are fused! Come back and talk to me when you are unfused.. my powers don't work wel with your type of people")
									usr.npctalk = 0
								else
									usr.npctalk = 0
									switch(input("Babidi: What spell do you want to learn?", "Babidi",text) in list ("Mind Control","Paralyze","Cancel"))
										if("Mind Control")
											usr << "You need 80 skill points!"
											switch(alert("Babidi: Are you sure you want to learn 'Mind Control'?","Babidi","Yes", "No"))
												if("Yes")
													if(usr.ki.max_value >= 800000 && usr.powerlevel.max_value >= 800000 && usr.skpts >= 80)
														usr.contents += new /obj/spells/mindcontrol
														usr.skpts -= 80
														usr.npctalk = 0
													else
														alert("Babidi: You have not developed your Ki and/or Powerlevel enough to handle this ablity.")
														usr.npctalk = 0
										if("Paralyze")
											usr << "You need 35 skill points!"
											switch(alert("Babidi: Are you sure you want to learn 'Paralyze'?","Babidi","Yes", "No"))
												if("Yes")
													if(usr.ki.max_value < 35000 && usr.skpts < 34)
														alert("Babidi: You have not developed your Ki enough to handle this ablity.")
														usr.npctalk = 0
													if(usr.ki.max_value >= 35000 && usr.skpts >= 35)
														usr.contents += new /obj/spells/para
														usr.skpts -= 35
														usr.npctalk = 0
							else
								alert("Babidi: You can't learn from me!")
								usr.npctalk = 0

		Guru
			name = "(NPC) Guru"
			powerlevel. = new(100)
			race = "Namek"
			icon = 'icons/mobs.dmi'
			icon_state = "guru"
			npc = 1
			density = 1
			verb
				NDBP()
					set src in oview(1)
					set category = "Other"
					set name = "Namekian Dragonball"
					if(usr.ndbqd  && usr.ndbqn )
						alert("Guru: Thank you for the news about Dende and Nail..even if it was both good and bad. I shall tell tell you the word to summon the dragon in Namekian. It's \"Porunga\"!")
						if(ndbtime == null)
							alert("The Namekian Dragonball are activated right now!")
						else
							alert("The Namekian Dragonball are going to be active around [ndbtime] minutes.")

					else
						alert("Guru: Please help me by finding Nail and Dende. If you do, I shall tell you the password to the Namekian Dragonballs as well as when they are active!")
				Talk()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						alert("Guru: Greetings, I am Guru.")
						switch(input("Do you wish to follow the way of 'Guru'?", "Guru",text) in list ("Yes","No","Offers"))
							if("No")
								usr.npctalk = 0
							if("Yes")
								usr.master = "Guru"
								usr.npctalk = 0
							if("Offers")
								alert("Guru: I can unlock your potential, if you allow me to.")
								usr.npctalk = 0

				Learn()
					set src in oview(1)
					set category = "Other"
					if(usr.npctalk )
						alert("You already are talking to a NPC")
					else
						usr.npctalk = 1
						if(usr.master == "Guru")
							if(usr.unlock )
								usr << "Your power has already been unlocked."
								usr.powerlevel.value = 0
							else
								if(usr.ap < -1)
									usr << "<B>Guru:</B> I won't give people like Frieza power!"
								else
									if(usr.ap >= 0 && usr.chq)
										usr.unlock = 1
										usr.move = 0
										usr.npctalk = 0
										usr << "<B>Guru:</B> I shall now unlock your power!"
										usr.underlays += 'icons/mysticaura.dmi'
										view(6) << 'sounds/aura.wav'
										sleep(30)
										usr << "You feel your body growing with Ki energy!"
										sleep(100)
										usr.powerlevel.max_value *= 2
										usr.ki.max_value *= 2
										usr.move = 1
										usr.powerlevel.value = usr.powerlevel.max_value
										usr.ki.value = usr.ki.max_value
										usr.underlays -= 'icons/mysticaura.dmi'
										view(6) << 'sounds/revert.wav'
										usr << "<B>Guru:</B> Your power has been unlocked!"
										usr.npctalk = 0
									else
										alert("You havn't killed Frieza yet!")
										usr.npctalk = 0

		Goz
			name = "(NPC) Goz"
			race = "Ogre"
			icon = 'icons/goz.dmi'
			npc = 1
			density = 1
			dead = 1
			Click()
				if(usr.npctalk )
					alert("You are already talking an a NPC")
				else
					usr.npctalk = 0


					alert("Goz: If you help Mez retrieve the lost Nimbus clouds, I will give you King Yemma's fruit.")
					if(usr.race == "Saiyan"|| usr.race == "Half-Saiyan")
						if(usr.msq == 4)
							alert("Something seems amiss. I was pretty sure Raditz was here.. how did he came back alive?")
							usr.msq = 5
							..()
						else if(usr.msq )
							alert("So King yemma sent you huh? Well, people in HFIL are getting a bit more chaotic. I believe something is wrong with Earth. Please hurry and try to find out the cause! To quicken your time, I'll send you to King Kai!")
							usr.msq = 2
							usr.loc=locate(17,82,3)
							..()
					if(usr.powerlevel.max_value >= 10000000000)
						switch(alert("Do you want to check out another part of HFIL? Yemma thought we needed some more space *sweatdrops*","Goz","Yes","No"))
							if("No")
								usr.npctalk = 0
								return
							if("Yes")
								usr.loc=locate(82,118,22)
								usr.npctalk = 0
								new /monster/quest/reincarnate/EGoku(locate(34,132,22))
								alert("You may have to kill yourself so please look for the gravitrons there and use it to kill yourself")
								return

		Mez
			name = "(NPC) Mez"
			race = "Ogre"
			icon = 'icons/mez.dmi'
			npc = 1
			poratta = 1
			dead = 1
			Click()
				if(usr.npctalk )
					alert("You already are talking to a NPC")
				else
					usr.npctalk = 1


					if(usr.spirit >= 3)
						if(usr.gotnimbus && usr.gotnimbus1 && usr.gotnimbus2)
							switch(alert("Do you wish to go now?","Mez","Yes","No"))
								if("Yes")
									if(usr.mezleave1 == 0)
										usr.npctalk = 0
										usr.mezleave1 = 1
										usr << "<B>Mez:</B> I shall now transport you back onto SNAKE WAY."
										sleep(10)
										usr << "<B>Goz:</B> Ahh, wait!"
										sleep(15)
										usr << "<B>Goz:</B> 'eres some of King Yemma's fruit fer helpin' Mez."
										usr.contents += new /obj/items/yemmafruit
										usr.spirit = 0
										usr.gotnimbus = 0
										usr.gotnimbus1 = 0
										usr.gotnimbus2 = 0
										sleep(10)
										view(6) << 'sounds/it.wav'
										usr.dead = 0
										usr.overlays -= 'icons/halo.dmi'
										usr.loc=locate(98,96,2)
									else
										usr << "<B>Mez:</B> I shall now transport you back onto SNAKE WAY."
										usr.spirit = 0
										usr.gotnimbus = 0
										usr.gotnimbus1 = 0
										usr.gotnimbus2 = 0
										usr.mezleave1 = 1
										sleep(10)
										view(6) << 'sounds/it.wav'
										usr.npctalk = 0
										usr.dead = 0
										usr.overlays -= 'icons/halo.dmi'
										usr.loc=locate(98,96,2)

								if("No")
									alert("Alright, come back to me when you want to go.")
									usr.npctalk = 0
						else
							alert("You didn't got all the clouds!")
							usr.npctalk = 0
					else
						alert("Mez: Please help me find my three lost Nimbus clouds and I will take you back to SNAKE WAY.")
						usr.npctalk = 0
		Intro
			name = "(NPC) Intro 1"
			race = "Earthling"
			icon = 'icons/male.dmi'
			icon_state = "default"
			npc = 1
			dead = 1
			Click()


				alert("(NPC) Intro 1: Hello and welcome to Dragonball Online! If you need help please use the help button on your HUD (Heads-up Display). You can fight some farm animals to the left, train with a few machines to the right. Or if you want to skip this tutorial go to the other Introduction NPC to the left before the training house. We hope you enjoy Dragonball Online!")
		Intro2
			name = "(NPC) Intro 2"
			race = "Earthling"
			icon = 'icons/male.dmi'
			icon_state = "default"
			npc = 1
			dead = 1
			Click()
				alert("(NPC) Intro 2: Hello! It looks like your ready to venture into the world of Dragonball Online!")
				switch(alert("Are you ready to go? You can never come back here again!","(NPC) Intro 2","Yes","No"))
					if("Yes")
						alert("(NPC) Intro 2: Alright, off ya go!")
						usr.dead = 0
						usr.newb = 0
						usr.immortal = 0
						usr.loc = locate(usr.hx, usr.hy, usr.hz)
						usr << "<B>You have been transported to your hometown!"

					if("No")
						alert("(NPC) Intro 2: Alright, if you want to leave just come back here and talk to me!")
		Barber
			name = "(NPC) Barber"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			icon_state = "barber"
			npc = 1
			Click()
				switch(alert("Do you want me to change your hair?","Barber","Yes","No"))
					if("Yes")
						if(usr.race == "Android (Biological)")
							alert("Sorry, I can't change your hair.")
						else
							if(usr.race == "Buu")
								alert("Sorry, I can't change your hair.")
							else
								if(usr.race == "Changling")
									alert("Sorry, I can't change your hair.")
								else
									if(findtext(usr.race,"Wizard"))
										alert("Sorry, I can't change your hair.")
									else
										if(usr.zenni <= 1499)
											alert("You need more Zenni for me to change your hair. It costs 1,500 zennies for my service.")
										else
											usr.overlays.Cut()
											usr.underlays.Cut()
											usr.skinrestore()
											usr.CreateName()
											usr << "<B>Player overlays & underlays removed."
											usr << "1500 Zenni recieved."
											usr.zenni -= 1500
											switch(input("Select a hair style.", "Dragonball Online", text) in list ("Long","Short Spikey","Spikey","Mohawk","Short","Recoome","Goku","Vegeta","Vegito","Trunks","Goten","Gohan","Bald"))
												if("Bald")
													usr.hair = "Bald"
													alert("Your hair has been changed!")
												if("Short")
													usr.hair = "Short"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_black_short.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Spikey")
													usr.hair = "Spikey"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_black_spikey.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Long")
													usr.hair = "Long"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_black_long.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Short Spikey")
													usr.hair = "Short Spikey"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/gtvegeta.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Mohawk")
													usr.hair = "Mohawk"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_mohawk.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Vegeta")
													usr.hair = "Vegeta"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_vegeta.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Goku")
													usr.hair = "Goku"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_goku.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Trunks")
													usr.hair = "Trunks"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_trunks.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Goten")
													usr.hair = "Goten"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_goten.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Gohan")
													usr.hair = "Gohan"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_gohan.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Vegito")
													usr.hair = "Vegito"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_vegito.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
												if("Recoome")
													usr.hair = "Recoome"
													var/haircolor = F_Color_Selector.Get_Color()
													var/icon/hairicon = new('icons/hair_reccoom.dmi')
													hairicon.Blend(haircolor)
													usr.overlays += hairicon
													usr.customhaircolor = haircolor
													alert("Your hair has been changed!")
					if("No")
						alert("Goodbye then.")

		Aura
			name = "(NPC) Aura"
			race = "Earthling"
			icon = 'icons/mobs.dmi'
			icon_state = "videl"
			npc = 1
			density = 1
			DblClick()
				Talk()
			verb
				Talk()
					var/list/options = list("Yes","No")
					if(usr.zenni > 100 && usr.powerlevel.max_value > 1000000 && prob(5))
					 options += " "
					switch(input("Do you want to change your AURA color?","Aura",text) in options)
						if("Yes")
							if(usr.auratechlearn )
								if(usr.zenni <= 499)
									alert("You need more Zenni for me to change your aura.")
								else
									usr.underlays.Cut()
									usr << "<B>Player underlays removed."
									usr.aura = 1
									usr.customauracolor = F_Color_Selector.Get_Color()
									usr.zenni -= 500
									usr.contents += new /obj/playeraura

							else
								alert("You have not learned the AURA technique yet.")
						if("No")
							alert("Goodbye, then.")
						if(" ")
							if(usr.auraquest)
								alert("As they say, you get what you paid for!")
							else
								switch(alert("Would you like to pay 10 million zennies for me to tell you how to control your aura? I may lower the price for you though..","Aura Control","Yes","Hell No"))
									if("Hell No")
										alert("Very well than..")
									if("Yes")
										if(usr.zenni < 100)
											alert("You need more Zenni! GET OUT YOU FILTY RAT!")
										else
											usr.zenni -= 100
											usr.auraquest = 1
											usr << "(NPC) Aura whispers something to you and you now have the knowledge to control your transformation's aura! And that'll be 100 please and thank you."


		Namekian
			name = "(NPC) Namek Elder"
			race = "Namek"
			icon = 'icons/mobs.dmi'
			icon_state = "elder"
			npc = 1
			density = 1
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					alert("Greetings, I am the elder of Namek and I request that you rid Frieza and the Ginyu force from Namek and Guru will gladly unlock your power!")
					if(usr.mechquest1 )
						if(locate(/obj/items/quest/techanalyser/t3) in usr)
							alert("Has it helped your journey my friend?")
							usr.npctalk = 0
							return
						alert("I found this weird item, it may be of use in your journey!")
						usr.contents += new /obj/items/quest/techanalyser/t3
						usr << "You have recieved Techanlyser Part 3"
						usr.npctalk = 0

mob/other/New()
	.=..()
	src.CreateName()
mob/training/New()
	.=..()
	src.CreateName()

mob
	proc
		monpwup()
			spawn(1)
				set background = 1
				var/plperc = src.powerlevel.max_value * 0.05
				if(src.powerlevel.value<=plperc)
					if(src.move)
						view(6) << "<font color = green>* </FONT><FONT COLOR = BLUE>[src] begins to power up!</FONT><font color = green> *</FONT>"
						view(6) << 'sounds/aura.wav'
						src.underlays += 'icons/mysticaura.dmi'
						src.move = 0
						var/plgain = src.powerlevel.max_value * 0.85
						src.powerlevel.value += plgain
						src.powerlevel.value=round(src.powerlevel.value)
						sleep(50)
						src.move = 1
						sleep(100)
						src.underlays -= 'icons/mysticaura.dmi'
						view(6) << 'sounds/revert.wav'
						src.expkn = null
						src.expkk = null
						..()
					else
						..()
				else
					..()

mob
	other
		drbriefs
			name = "Dr. Briefs"
			npp = 1
			npc = 1
			icon = 'icons/mobs.dmi'
			icon_state = "briefs"
			Click()
				switch(input("Hello, [usr]! Besure to check out our new exhibits!", "Dr. Briefs",text) in list ("Talk","Learn Techniques","Buy","Sell","Cancel"))
					if("Learn Techniques")
						if(usr.race == "Earthling"||usr.race == "Android (Mechanical)"||usr.race == "Android (Biological)"||usr.race == "Namek")
							switch(alert("Dr. Briefs: Do you wish to learn the technique, 'Materialize'?","Dr. Briefs","Yes","No"))
								if("Yes")
									if(usr.powerlevel.max_value >= 80000)
										usr.skills += new /obj/techs/Create
									else
										alert("You need to be stronger.")
								if("No")
									alert("Dr. Briefs: Alright, remember to check things out at Capsule Corp.")
						else
							usr.powerlevel.value += 0

					if("Buy")
						switch(input("Hello! What do you wish to buy?", "Dr. Briefs",text) in list ("Capsule (Space Pod) (25000)"/*,"Capsule (Space Pod) (100000)"*/,"Cancel"))
							if("Capsule (Space Pod) (25000)")
								if(usr.zenni <= 24999)
									usr << "<b>You need 25000 zenni!"
								if(usr.zenni >= 25000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 25000
									usr << "<b>You get a Capsule (Space Pod)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/space_capsule

							if("Capsule (Time Machine) (100000)")
								if(usr.zenni <= 99999)
									usr << "<b>You need 100000 zenni!"
								if(usr.zenni >= 100000)
									usr << "Zenni taken & recieved."
									usr.zenni -= 100000
									usr << "<b>You get a Capsule (Time Machine)!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/time_capsule

							if("Cancel")
								alert("Goodbye, Come again!")
								..()

					if("Sell")
						var/list/Sellable=list()
						for(var/obj/items/O in usr.contents)
							if(!istype(O)) continue
							if(O.value>0)
								Sellable+=O
						var/obj/items/P=input("What do you want to sell?","") in Sellable
						if(!P) return
						switch(alert("Do you want to sell [P] for [round(P.value)]?","[src]","Yes","No"))
							if("Yes")
								if(P && P.worn)
									usr<<"<b>Not while it's being worn."
								else if(P)
									usr<<"<b>You recieve, [P.value] Zenni!"
									usr.zenni+=P.value
									P.loc = locate(0,0,0)
									del(P)

					if("Talk")
						alert("Dr. Briefs: Don't forget to check out the new exhibits and talk to my daughter Bulma.")

					if("Cancel")
						alert("Dr. Briefs: Good bye!")





obj
	techs
		sense
			name = "Sense"
			icon = 'icons/techhands.dmi'
			icon_state = "sense"
			Click()


				if(!usr.radarOn)
					var/obj/O = new   // This code creates the radar object and places it on the client's screen. Note how the object 'follows' the mob around as he moves. This is because the object is 'attached' to the client screen.
					O.name = "Sense Radar"
					O.icon = 'icons/Radar_Blips.dmi'
					O.icon_state = "Radar"
					O.screen_loc = "8,14"
					O.layer = 99
					usr.client.screen += O
					usr.client.radar = O
					usr.radarOn = 1
					usr << "<FONT COLOR = BLUE><B>You begin to sense."
					usr.Update_Radar()
				else
					usr.client.screen -= usr.client.radar
					usr.client.radar = null
					usr.radarOn = 0
					usr << "<FONT COLOR = BLUE><B>You stop sensing."
mob
	other
		straveler
			name = "(NPC) South Traveler"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			density = 1
			npc = 1
			verb
				Talk()
					set src in oview(3)
					set category = "Other"
					alert("Hello! Welcome to South Travel Destinations, where would you like to go?")
					switch(input("Select a destination. (Each trip is a mere 250 Zenni.)", "South Travel Destinations", text) in list ("Satan City","North City","East City","West City","Cancel"))
						if("Satan City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to Satan City.")
								usr.loc = locate(116,98,6)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("North City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to North City.")
								usr.loc = locate(59,94,12)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("East City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to East City.")
								usr.loc = locate(65,98,13)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("West City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to West City.")
								usr.loc = locate(76,114,11)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Cancel")
							alert("Goodbye, and always count on Travel Destinations for your traveling needs!")
							usr.move = 1

mob
	proc
		GKPlane()
			spawn(1)
				set background = 1
				while(src.gkpt > 0)
				{
					sleep(3000)
					src.gkpt--
					if(src.gkpt == 1)
						usr << "<B>Flight Attendant:</B> We have landed on 'Heaven'!"
						usr << "<B>Flight Attendant:</B> Be prepared to be unboarded! The expected time to wait is one minute!"
					if(src.gkpt <= 0)
						src.gkpt = 0
						if(src.dead == 0)
							src.loc = locate(src.hx,src.hy,src.hz)
							usr << "You suddenly wake up! It seems like the plane ride and everything was a dream.."
						else
							src.loc=locate(141,18,20)
							usr << "<B>You appear at 'Heaven'!"
				}


		Hplane()
			spawn(1)
				set background = 1
				sleep(600)
				usr << "<B>Flight Attendant:</B> We have landed on 'Heaven'!"
				usr << "<B>Flight Attendant:</B> Be prepared to be unboarded! The expected time to wait is one minute!"
				sleep(600)
				src.loc=locate(141,18,20)
				usr << "<B>You appear at 'Heaven'!"


turf
	heavenplane
		name = "Plane (Heaven)"
		icon = 'icons/plane.dmi'
		icon_state = ""
		density = 1
		dir = NORTH
		Enter(var/mob/M)
			if(ismob(M))
				switch(alert("Do you want to go to Heaven?","Plane","Yes","No"))
					if("Yes")
						usr.loc=locate(95,144,3)
						usr << "<B>The flight to Heaven is 5 minutes."
						usr << "You will be immediatly teleported when landed."
						usr.gkpt += 4
//				usr.kkp = 0
						usr.Hplane()
					if("No")
						..()
			else
				del(M)
				return

mob
	other
		sstraveler
			name = "(NPC) Satan Traveler"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			density = 1
			npc = 1
			verb
				Talk()
					set src in oview(3)
					set category = "Other"
					alert("Hello! Welcome to Satan Travel Destinations, where would you like to go?")
					switch(input("Select a destination. (Each trip is a mere 250 Zenni.)", "Satan Travel Destinations", text) in list ("South City","North City","East City","West City","Cancel"))
						if("South City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to South City.")
								usr.loc = locate(77,77,1)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("North City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to North City.")
								usr.loc = locate(59,94,12)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("East City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to East City.")
								usr.loc = locate(65,98,13)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("West City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to West City.")
								usr.loc = locate(76,114,11)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Cancel")
							alert("Goodbye, and always count on Travel Destinations for your traveling needs!")
							usr.move = 1

mob
	other
		ntraveler
			name = "(NPC) North Traveler"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			density = 1
			npc = 1
			verb
				Talk()
					set src in oview(3)
					set category = "Other"
					if(usr.npctalk )
						alert("You are already talking an a NPC")
					else
						usr.npctalk = 0
						alert("Hello! Welcome to North Travel Destinations, where would you like to go?")
						switch(input("Select a destination. (Each trip is a mere 250 Zenni.)", "Satan Travel Destinations", text) in list ("South City","Satan City","East City","West City","Cancel"))
							if("South City")
								if(usr.zenni > 249)
									usr.zenni -= 250
									usr << "Zenni recieved."
									alert("You are now being transported to South City.")
									usr.loc = locate(77,77,1)
								else
									alert("You do not have the 250 Zenni to make a trip!")

							if("Satan City")
								if(usr.zenni > 249)
									usr.zenni -= 250
									usr << "Zenni recieved."
									alert("You are now being transported to Satan City.")
									usr.loc = locate(116,98,6)
								else
									alert("You do not have the 250 Zenni to make a trip!")

							if("East City")
								if(usr.zenni > 249)
									usr.zenni -= 250
									usr << "Zenni recieved."
									alert("You are now being transported to East City.")
									usr.loc = locate(65,98,13)
								else
									alert("You do not have the 250 Zenni to make a trip!")

							if("West City")
								if(usr.zenni > 249)
									usr.zenni -= 250
									usr << "Zenni recieved."
									alert("You are now being transported to West City.")
									usr.loc = locate(76,114,11)
								else
									alert("You do not have the 250 Zenni to make a trip!")

							if("Cancel")
								alert("Goodbye, and always count on Travel Destinations for your traveling needs!")
								usr.move = 1

mob
	other
		etraveler
			name = "(NPC) East Traveler"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			density = 1
			npc = 1
			verb
				Talk()
					set src in oview(3)
					set category = "Other"
					alert("Hello! Welcome to East Travel Destinations, where would you like to go?")
					switch(input("Select a destination. (Each trip is a mere 250 Zenni.)", "East Travel Destinations", text) in list ("South City","Satan City","North City","West City","Cancel"))
						if("South City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to South City.")
								usr.loc = locate(77,77,1)
								if(usr.mechquest1 )
									if(locate(/obj/items/quest/techanalyser/t5) in usr)
										alert("Did you found the person yet?")
										return
									alert("North Traveler: Somebody forgot this item and they didn't claimed it yet so here you go! He was last seen going to South City in a weird funny hat with a bow that has two R's.")
									usr.contents += new /obj/items/quest/techanalyser/t5
									usr << "You have recieved Techanlyser Part 5"
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Satan City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to Satan City.")
								usr.loc = locate(116,98,6)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("North City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to North City.")
								usr.loc = locate(59,94,12)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("West City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to West City.")
								usr.loc = locate(76,114,11)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Cancel")
							alert("Goodbye, and always count on Travel Destinations for your traveling needs!")
							usr.move = 1

mob
	other
		wtraveler
			name = "(NPC) West Traveler"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			density = 1
			npc = 1
			verb
				Talk()
					set src in oview(3)
					set category = "Other"
					alert("Hello! Welcome to West Travel Destinations, where would you like to go?")
					switch(input("Select a destination. (Each trip is a mere 250 Zenni.)", "West Travel Destinations", text) in list ("South City","Satan City","North City","East City","Cancel"))
						if("South City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to South City.")
								usr.loc = locate(77,77,1)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Satan City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to Satan City.")
								usr.loc = locate(116,98,6)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("North City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to North City.")
								usr.loc = locate(59,94,12)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("East City")
							if(usr.zenni > 249)
								usr.zenni -= 250
								usr << "Zenni recieved."
								alert("You are now being transported to East City.")
								usr.loc = locate(65,98,13)
							else
								alert("You do not have the 250 Zenni to make a trip!")

						if("Cancel")
							alert("Goodbye, and always count on Travel Destinations for your traveling needs!")
							usr.move = 1
mob
	other
		f1
			name = "(NPC) Fighter 1"
			icon = 'icons/mobs.dmi'
			icon_state = "f1"
			density = 1
			npc = 1

mob
	other
		f2
			name = "(NPC) Fighter 2"
			icon = 'icons/mobs.dmi'
			icon_state = "f2"
			density = 1
			npc = 1

mob/other
	New()
		.=..()

mob
	other
		grandkai
			name = "(NPC) Grand Kai"
			icon = 'icons/grandkai.dmi'
			icon_state = ""
			density = 1
			dead = 1
			npc = 1
			Click()
				if(src in view(1))
					Go_To_Kai()
			verb
				Talk()
					set src in oview(1)
					set category = "Other"
					alert("Grand Kai: Greetings! You have come here to train? Well, feel free to.")
					usr << "You need 15 skill points!"
					switch(input("Are you here to learn the 'Telepathy' technique?", "Grand Kai", text) in list ("Yes","No"))
						if("Yes")
							if(usr.ki.max_value < 50000 && usr.skpts < 14)
								alert("Grand Kai: Your Ki hasn't been developed enough.")
							if(usr.ki.max_value > 50000 && usr.skpts >= 15)
								usr.contents += new /obj/telepath
								usr.skpts -= 15
								usr.kame = 0
								alert("Grand Kai: I shall now teach you the technique, 'Telepathy'.")

				Go_To_Kai()
					set name = "Go to King Kai's Planet"
					set category = "Other"
					set src in oview(1)
					usr.loc=locate(17,82,3)
					view(6) << 'sounds/it.wav'
//					usr.kkp = 1
					alert("You go to King Kai's Planet.")
turf
	hfilsign
		name = "Sign"
		icon = 'icons/sign.dmi'
		icon_state = ""
		density = 1
		Entered(var/mob/M)
			if(ismob(M))
				alert("The sign reads, Welcome to HELL!")
			else
				del(M)
				return

mob
	other
		kaioshin
			icon = 'icons/mobs.dmi'
			icon_state = "kaioshin"
			name = "(NPC) Supreme Kai"
			dead = 1
			npc = 1
			verb
				Talk()
					set name = "Talk"
					set category = "Other"
					set src in oview(1)
					switch(input("Do you wish to recieve the Fusion Earrings? (Pernament Fusion)", "Supreme Kai", text) in list ("Yes","No"))
						if("Yes")
							usr << "<B>You recieve Fusion Earrings!"
							usr.poratta = 1
							usr.contents += new /obj/items/fusion
							alert("This type of fusion is pernament! You will not be able to unfuse.")
						if("No")
							usr << "<B>Very well, then."

				Go_To_Kai()
					set name = "Go to King Kai's Planet"
					set category = "Other"
					set src in oview(1)
					usr.loc=locate(17,82,3)
					view(6) << 'sounds/it.wav'
					usr.skuse = 0
//					usr.kkp = 1
					alert("You go to King Kai's Planet.")

				Buy()
					set src in oview(1)
					set category = "Other"
					switch(input("Hello! What do you wish to buy?", "Supreme Kai",text) in list ("Blue Mystic Armor","Red Mystic Armor","Cancel"))
						if("Blue Mystic Armor")
							if(usr.zenni <= 7499)
								usr << "<b>You need 7500 zenni!"
							if(usr.zenni >= 7500)
								usr << "<b>You get a Blue Mystic Armor!"
								view(6) << 'sounds/zenni.wav'
								usr.contents += new /obj/items/bluemysticarmor
								usr.zenni -= 7500

						if("Red Mystic Armor")
							if(usr.zenni <= 7499)
								usr << "<b>You need 7500 zenni!"
							if(usr.zenni >= 7500)
								usr << "<b>You get a Red Mystic Armor!"
								view(6) << 'sounds/zenni.wav'
								usr.contents += new /obj/items/redmysticarmor
								usr.zenni -= 7500

						if("Cancel")
							alert("Goodbye, come again!")
							..()


mob
	training
		Nimbus
			move = 1
			dead = 1
			New()
				..()
				spawn(1)
					Wander()
			proc/Wander()
				while(src)
				{
					step_rand(src)
					sleep(20)
				}
			Nimbuscloud
				name = "(NPC) Nimbus Cloud 1"
				npc = 1
				dead = 1
				icon = 'icons/cloud.dmi'
				verb/Get()
					set src in oview(2)
					set category = "Capture"
					if(usr.gotnimbus ) alert("You have already captured this cloud.")
					else
						alert("You capture the RUNAWAY Nimbus Cloud.")
						usr.spirit +=1
						usr.gotnimbus = 1
						usr.gozhelp = 1
			Nimbuscloud1
				name = "(NPC) Nimbus Cloud 2"
				npc = 1
				dead = 1
				icon = 'icons/cloud.dmi'
				verb/Get()
					set src in oview(2)
					set category = "Capture"
					if(usr.gotnimbus1 ) alert("You have already captured this cloud.")
					else
						alert("You capture the RUNAWAY Nimbus Cloud.")
						usr.spirit += 1
						usr.gotnimbus1 = 1
						usr.gozhelp = 1
			Nimbuscloud2
				name = "(NPC) Nimbus Cloud 3"
				npc = 1
				dead = 1
				icon = 'icons/cloud.dmi'
				verb/Get()
					set src in oview(2)
					set category = "Capture"
					if(usr.gotnimbus2 ) alert("You have already captured this cloud.")
					else
						alert("You capture the RUNAWAY Nimbus Cloud.")
						usr.spirit +=1
						usr.gotnimbus2 = 1
						usr.gozhelp = 1

monster
	Pikkon
		name = "(TRAINER) Pikkon"
		powerlevel = new(670000000000000)
		deathtrans = 1
		dead = 1
		icon = 'icons/pikkon.dmi'
		npp = 0
		ko = 0
		mon = 1
		race = "Pikkon"
		state = "Normal"
		Dead(mob/killer)
			killer.strain = 3
			killer.sfinish = 1
			. = ..()
		action()
			if(target && !(target in oview(src)))
				target = null
			else if(!target)
				step_rand(src)
				for(var/mob/M in oview(src))
					if(istype(M, /mob/characters))
						target = M
						return
			else if(get_dist(src, target) <= 1)
				attack(target)
			else
				step_to(src, target)

mob/other
	TournyAnnounce
		name = "(NPC) Tournament Announcer"
		race = "Earthling"
		icon = 'icons/mobs.dmi'
		icon_state = "announce"
		npc = 1
		nospawn = 1
		verb
			Talk()
				set src in oview(1)
				set category = "Other"
				alert("Greetings, [usr]")
				switch(alert("Are you here to announce a tournament?","Tournament Announcer","Yes", "No"))
					if("Yes")
						alert("This will cost 250 Zenni to announce this universe-wide event.")
						switch(alert("Do you wish to still do this?","Tournament Announcer","Yes", "No"))
							if("Yes")
								if(usr.zenni > 249)
									usr << "Zenni recieved."
									alert("Now announcing tournament.")
									world << 'sounds/tourny.wav'
									usr << "Announcing."
									world << "<B><FONT COLOR = YELLOW><FONT SIZE = 2>A Tournament has been announced by [usr]!"
									world << "<B><FONT COLOR = YELLOW>You can enter the tournament by using the Enter Tournment verb given to you! The tournament will close in 2 minutes!"
									for(var/mob/characters/M in players)
										if(M.client)
											M.verbs += /mob/Others/verb/EnterTournament
									spawn(1200)
										for(var/mob/characters/M in players)
											if(M.client)
												M.verbs -= /mob/Others/verb/EnterTournament
										world << "<B><FONT COLOR = YELLOW>The tournament has closed!"
									alert("Tournament announced, thank you for your business.")
									if(usr.mechquest1)
										if(locate(/obj/items/quest/techanalyser/t1) in usr)
											return
										alert("Tournament Announcer: Hey, you! I found this on the ground, I think you dropped it.")
										usr.contents += new /obj/items/quest/techanalyser/t1
										usr << "You have recieved Techanlyser Part 1"
								else
									alert("You do not have enough Zenni.")
							if("No")
								alert("Goodbye, then.")
								..()
					if("No")
						alert("Goodbye, then.")
						..()

mob
	Move()
		. = ..()
		if(.)
			checkweight()

	proc
		checkweight()
			set background = 1
			if(!dead && weight && powerlevel.max_value <= 400000)
				stamina.value -= rand(1,3)
				if(stamina.value>0)
					powerlevel.max_value+=1+powerlevel.max_value*0.00009
					stamina.max_value+=1+stamina.max_value*0.00009
				if(stamina.value < -10)
					powerlevel.value = 0
					Die()
					src << "<b>You have died from exaustion, while using your weighed clothing.</b>"


mob
	proc
		throwproc(var/killedBy)
			set background = 1
			spawn(6)
				if(src.thrown )
					var/turf/curturf
					curturf = src.loc
					if(curturf.density)
						view(20) << "<font color = blue><i>[src] slams into a hard object."
						if(src.client)
							src.client.show_verb_panel = 1
							src.hideipan = 0
						src.powerlevel.value -= (src.throwpowerlevel * 0.20)
						src.powerlevel.value = round(src.powerlevel.value)
						if(src.mon )
							if(src.powerlevel.value <=0)
								if(src.expkn == null && src.expkk == null)
									src.expkn = "[usr.name]"
									src.expkk = "[usr.key]"
						src.thrown = 0
						src.move = 0
						src.attacking = 1
						src.density = 1
						view(20) << 'sounds/throwsnd.wav'
						src.icon_state = ""
						call(/RoundExplosion/proc/NDBlast)(src.loc,1,2)
						src.Die(killedBy)
						src.move = 1
						src.throwpowerlevel = null
					else
						src.throwproc()

client
	North()
		if(mob.thrown)
			return 0
		else
			..()
	South()
		if(mob.thrown)
			return 0
		else
			..()
	East()
		if(mob.thrown)
			return 0
		else
			..()
	West()
		if(mob.thrown)
			return 0
		else
			..()
	Northeast()
		if(mob.thrown)
			return 0
		else
			..()
	Northwest()
		if(mob.thrown)
			return 0
		else
			..()
	Southeast()
		if(mob.thrown)
			return 0
		else
			..()
	Southwest()
		if(mob.thrown)
			return 0
		else
			..()

obj/blackwipe
	b25
		name = "Blackness"
		icon = 'icons/blackness/black25.dmi'
		screen_loc = "1,1 to 15,15"
	b50
		name = "Blackness"
		icon = 'icons/blackness/black50.dmi'
		screen_loc = "1,1 to 15,15"
	b100
		name = "Blackness"
		icon = 'icons/blackness/black100.dmi'
		screen_loc = "1,1 to 15,15"

proc
	bwipeeffect(var/Z)
		set background = 1
		view(150) << "<B>The ground wipes away!"
		view(150) << 'sounds/wipe.wav'
		for(var/client/A)
			spawn(1)
				if(A && A.mob && A.mob.z == Z)
					var
						obj
							blackwipe
								b25
									bwe25 = new()
								b50
									bwe50 = new()
								b100
									bwe100 = new()
					if(!A) return
					A.screen += bwe25
					sleep(3)
					if(!A) return
					A.screen -= bwe25
					A.screen += bwe50
					sleep(3)
					if(!A) return
					A.screen -= bwe50
					A.screen += bwe100
					sleep(75)
					if(!A) return
					A.screen -= bwe100
					A.screen += bwe50
					sleep(3)
					if(!A) return
					A.screen -= bwe50
					A.screen += bwe25
					sleep(3)
					if(!A) return
					A.screen -= bwe25


mob
	proc
		traineffect(var/mob/characters/M)
			spawn(1)
				while(training)
					if(M)
						M.meleehit()
						src.meleehit()
						view(6) << 'sounds/meleefinish.wav'
						sleep(rand(25,50))
						var/turf/T = get_step_rando(src)
						T = get_step_rando(T)
						T = get_step_rando(T)
						T = get_step_rando(T)
						T = get_step_rando(T)
						//flick("zan",src)
						//flick("zan",M)
						view(6) << 'sounds/it2.wav'
						if(T)
							loc = T
							M.loc = get_step_rando(src)
							dir = get_dir(src, M)
							M.dir = get_dir(M, src)
					else
						training = 0
					sleep(rand(10,50))
mob
	Others
		verb
			EnterTournament()
				set name = "Enter Tournament"
				set category = "Tournament"
				if(usr.dead == 0)
					view(6) << 'sounds/it.wav'
					world << "<center><B><FONT COLOR = YELLOW>[usr] has enlisted in the Tournament!</B></center>"
					usr.loc=locate(73,75,9)
					usr << "<B>You have been transported to the tournament floor!"
					usr.verbs -= /mob/Others/verb/EnterTournament
				else
					usr << "<B>You can't participate when you are dead!"


obj/solarflare
	s25
		name = "Dragonball Online"
		icon = 'icons/solarflare.dmi'
		icon_state = "25"
		screen_loc = "1,1 to 15,15"
		layer = 999999999999999999999999999999
	s50
		name = "Dragonball Online"
		icon = 'icons/solarflare.dmi'
		icon_state = "50"
		screen_loc = "1,1 to 15,15"
		layer = 999999999999999999999999999999
	s100
		name = "Dragonball Online"
		icon = 'icons/solarflare.dmi'
		icon_state = "100"
		screen_loc = "1,1 to 15,15"
		layer = 999999999999999999999999999999

proc
	sflare(var/mob/M)
		set background = 1
		spawn(1)
			var
				obj
					solarflare
						s25
							swe25 = new()
						s50
							swe50 = new()
						s100
							swe100 = new()
			var/client
				Mcli
			Mcli = M:client
			M = Mcli
			M:screen += swe25
			sleep(3)
			if(!M) return
			M:screen -= swe25
			M:screen += swe50
			sleep(3)
			if(!M) return
			M:screen -= swe50
			M:screen += swe100
			sleep(75)
			if(!M) return
			M:screen -= swe100
			M:screen += swe50
			sleep(3)
			if(!M) return
			M:screen -= swe50
			M:screen += swe25
			sleep(3)
			if(!M) return
			M:screen -= swe25

mob
	other
		pohelper
			name = "(NPC) Post Office Helper"
			icon = 'icons/mobs.dmi'
			icon_state = "shopthree"
			Click()
				alert("Welcome to the DBO Post Office. How may I help you?", "DBO P.O.")
				if(!usr) return
				var/inp = input("How may I help you?", "DBO P.O.") in list("What can you do here?",\
										"How do you send mail?", "I want a Personal Mail Assistant!", "Cancel")
				if(!usr) return
				switch(inp)
					if("What can you do here?")
						alert("At a postoffice, you can send mail, and check your mail. If you have a Personal Mail Assistant, you may check and send mail from anywhere.", "DBO P.O")
					if("How do you send mail?")
						alert("To send mail, you need to have a Personal Mail Assistant or be in a post office. If you want to use your PMA, then click it. In the browser window that pops up, click on \[ COMPOSE NEW MAIL \], and follow the directions on-screen.", "DBO P.O")
					if("I want a Personal Mail Assistant!")
						inp = alert("Personal Mail Assistants cost 5000 zenni, do you wish to buy one?", "DBO P.O.", "Yes", "No")
						if(!usr) return
						switch(inp)
							if("Yes")
								if(usr.zenni < 5000)
									usr << "<b>You need 5000 zenni!"
								else
									usr << "Zenni taken & recieved."
									usr.zenni -= 5000
									usr << "<b>You get a Peronal Mail Assistant!"
									view(6) << 'sounds/zenni.wav'
									usr.contents += new /obj/items/PMA

		custom_clothing
			name = "(NPC) Clothes Maker"
			icon = 'icons/mobs.dmi'
			icon_state = "barber"
			Click()
				var/input1 = alert("Would you like to make a custom clothing item?", "Custom Clothes", "Yes", "No")
				if(!usr) return
				if(input1 == "Yes")
					if(usr.zenni < 5000)
						alert("You need 5000 zenni to make a custom clothing item!", "Custom Clothes")
						return
					else
						usr.zenni -= 5000
						var/obj/items/customclothes/cc = new()
						cc.name = input("What would you like to call this item?","Custom Clothes") as text
						if(!usr) return
						cc.icon = input("Select an icon for your clothes."," Custom Clothes") as icon
						if(!usr) return
						cc.Move(usr)
						src << "You get \a [cc]!"