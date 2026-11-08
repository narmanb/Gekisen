mob
	var
		tmp
			help
				__help
	proc
		Help(topic)
			if(__help && __help.type != topic)
				__help = null
			if(!__help)
				__help = new topic()
			__help.Process(src)

	Topic(href,href_list[])
		if(href_list["action"] == "help")
			Help(text2path(href_list["topic"]))
		else
			return ..()

help
	var
		template = {"<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>{TITLE}</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<style type="text/css">
			body {background: #000000; color: #ffffff;}
			a {color: #ffffff; text-decoration: none;}
			a:hover {color: #9999ff; text-decoration: underline;}
			div {text-align: center;}
		</style>
	</head>
	<body>
		<div>
			{BODY}
		</div>
	</body>
</html>"}
		name
	proc
		Process(mob/M)
			var/html = template
			var/list/replace_list = list("{TITLE}" = name, "{BODY}" = file2text(".[type].body"), "{USERREF}" = "\ref[M]")
			html = Replace_All(html, replace_list)
			M << browse(html,"window=help;can_close=0;can_minimize=0;can_resize=0;size=500x600;")

	index
		name = "DBO Help - Index"

	faq
		name = "DBO Help - FAQ"

	basics
		name = "DBO Help - Basics"

	credits
		name = "DBO Help - Credits"

	other
		name = "DBO Help - Other"

	problems
		name = "DBO Help - Game Problems"

		npc
			name = "DBO Help - Game Problems"
			Process(mob/M)
				M.npctalk = 0
				return ..()

		trans
			name = "DBO Help - Game Problems"
			Process(mob/M)
				M.transforming = 0
				return ..()

		techs
			name = "DBO Help - Game Problems"
			Process(mob/M)
				M.kame = 0
				return ..()

		move
			name = "DBO Help - Game Problems"
			Process(mob/M)
				M.move = 1
				return ..()

		black
			name = "DBO Help - Game Problems"
			Process(mob/M)
				if(M.dead)
					M.loc = locate(52,9,3)
					M.sight = 0
				else
					M.loc = locate(M.hx, M.hy, M.hz)
					M.sight = 0
				return ..()

	close //this one closes the browser window
		Process(mob/M)
			M << browse(null,"window=help")
			M.__help = null
