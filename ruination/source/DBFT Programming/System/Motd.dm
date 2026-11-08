var/motd={"
	<html>
	<title>Motd</title>
	<body>
	<STYLE>BODY{background-color: black; color:white}</STYLE>
	<table cellpadding="0" cellspacing="0" border="0" align="center">
	<td>
	<center><u><font size=4><font color=blue>Ruination</center></u></font></font size><p>

	[motdmessage]<p>
	</td>
	</table>
	</body>
	</html>
	"}
var/motdmessage={"
<center>
Welcome to Dragonball: Ruination Version 2.7.<p>

* The Admin system has been updated, including changes to gm levels*<p>

* Zenni has been removed from Dragonball Wishes *

* Give zenni has been removed as some players were using it to abuse*

* Slight mapping changes have been made *

* The interface has been updated *
</center>
"}

/*
mob/PC/verb/View_Motd()
	set category = "Channels"
	var/motd2={"
		<html>
		<title>Motd</title>
		<body>
		<STYLE>BODY{background-color: black; color:white}</STYLE>
		<center><u><font size=3><font color=blue>Dragonball: Ruination</center></u></font></font size><p>

		[motdmessage]<p>
		</body>
		</html>
		"}
	src<<browse(motd2,"window=Motd;size=340x420;can_close=1;can_resize=1;can_minimize=1")
	*/