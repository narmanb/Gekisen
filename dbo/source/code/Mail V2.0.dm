#define DEFAULT_MAIL_ICON 'mail.dmi'

/********************************************************************************************/
/*		Mail System Library Ver 2.0															*/
/*		Written By: Sapphire Magus															*/
/*																							*/
/*		July 11, 2002																		*/
/*																							*/
/*		Comments/questions/criticism - Sapphiremagus@email.com								*/
/*																							*/
/********************************************************************************************/

/********************************************************************************************/
/*	This library is fully functioning without you needing to do anything to your code at	*/
/*	all. The only thing that you need to do is modify your map file. When you go to edit 	*/
/*	it, check under the area listing and you should see an area titled PO. That area is		*/
/*	all you need to give your players the ability to send and recieve mail. When ever		*/
/*	a player enters a post office area (PO), they are shown their mailbox in the browser	*/
/*	screen. This screen is cleared when the player leaves the area.							*/
/*	Requires Deadron's Texthandling Library which can be found at 							*/
/*																							*/
/*						www.byond.com/hub/DM/Library										*/
/*																							*/
/********************************************************************************************/

/********************************************************************************************/
/*	The PO area is what links the mail system to the players. When a player enters a PO 	*/
/*	area, the browser is automatically pointed to their mail box. This does away with the	*/
/*	numerous verbs of the last edition. Players interface with their mail purely through	*/
/*	the browser, no commands or verbs. Of course, some people prefer to use verbs, so I 	*/
/*	them intact incase you wanted to change to a verb based system. However, the verbs		*/
/*	have been reduced to two in number, Mail_Box() and Address_Book(). These take you to	*/
/*	the same browser screen as the default setting. Mostly they're there if you want to		*/
/*	add them to, say, GMs or portable mail devices (like a palm pilot). Anway, if you		*/
/*	dislike having the mail screen come up automatically, simply comment out the noted		*/
/*	lines below and uncomment the commented out lines. Enjoy!								*/
/********************************************************************************************/

area/PO

	Entered(var/mob/M)
		..()
		//M.verbs+= /obj/Post_Office/verb/Mail_Box
		//M.verbs+= /obj/Post_Office/verb/Address_Book
		if(istype(M) && M.client)
			M.Mail()			//Comment out this line to change styles
	Exited(var/mob/M)
		..()
		//M.verbs-= /obj/Post_Office/verb/Mail_Box
		//M.verbs-= /obj/Post_Office/verb/Address_Book
		if(istype(M) && M.client)
			M<<browse("","clear=1")	//Comment out this line to change styles

mob/var/list/p_mail = new/list()		//Adds the mail list variable to the players
mob/var/list/contacts = new/list()		//Adds an 'address book' variable to the players

mob/Login()								/****************************************************/
	..()								/*	Checks for new mail upon Login()				*/
	Query_New_Mail()					/****************************************************/

var/list/postoffice = new/list()		//Main mail list

/********************************************************************************************/
/*	The following two procs are used to maintain the mail list between sessions. 			*/
/*	This only applies to the main mail list. Player mail lists (mob.p_mail) are saved with 	*/
/*	the players (I typically use Deadron's Character Handling Library)						*/
/********************************************************************************************/

proc/SavePO()				/****************************************************************/
	var/savefile/F			/*																*/
	var/Mail/M				/*	SavePO() saves the mail list to the file PO.sav in the		*/
	F = new("PO.sav")		/*	game's directory. The best place to put this is in any		*/
	F << postoffice.len		/*	code where you modify the list contents and in the Del()	*/
	for(M in postoffice)	/*	proc of the game world, before the ..()						*/
		F << M				/****************************************************************/

proc/LoadPO()						/********************************************************/
	var/savefile/F					/*														*/
	var/length						/*	LoadPO loads the mail list from the file PO.save.	*/
	var/i							/*	The best place to put this is in the New() proc		*/
	var/Mail/M						/*	of your game world.									*/
	F = new("PO.sav")				/*														*/
	F >> length						/*														*/
	if(length)						/*														*/
		for(i = 0,i < length,i++)	/*														*/
			F >> M					/*														*/
			postoffice.Add(M)		/********************************************************/

/********************************************************************************************/
/*	Query_New_Mail() is designed to be used to tell a player if they have new mail in 		*/
/*	their mail list and to do the intial copying of new mail from the main mail list to		*/
/*	the player's mail list upon Login(). This clears the mail list of any mail sent to 		*/
/*	the player while the player was offline.												*/
/********************************************************************************************/

proc/Query_New_Mail()

	var/mob/J = usr								//Assign the user to a variable for further
												//use in the proc


	for(var/Mail/M in postoffice)				//Loop through all the mail in the list

		if(M.Find_Rec(J:name)>0)				//If the user is found in the address list
			M.Remove_Rec(J.name)				//remove the user from the address list,
			var/Mail/X = M
			J.p_mail.Add(X)						//add the mail to the user's mail list
			M.recipients.Remove(J:name)
			X.new_mail = 1						//and mark it as new.

			if(M.recipients.len <= 0)			//If there are no more addresses for that
				postoffice.Remove(M)			//message, delete the message from the mail list.

		/************************************************************************************/
		/*	This next if() statement checks to see if the mail is addressed to everyone		*/
		/*	on the game. If it is, then it is treated somewhat differently. Instead of		*/
		/*	the address list being used to decide who recieves the mail 					*/
		/*	(on the list = recieve mail), it's used to decide who /DOESN'T/ receive mail	*/
		/*	(on the list = do not recieve mail). This is an experimental feature that'd		*/
		/*	I'd like feedback on. Is the ability to mail EVERYONE a good thing? Bad thing?	*/
		/************************************************************************************/


		if(M.Find_Rec(J.name) < 0)				//If the Mail is addressed to ALL
			if(!M.recipients[J:name])			//and the user is not in the address list
				M.recipients.Add(J:name)		//add the user to the list
				M.recipients[J:name] = 1		//and activate it.
				var/Mail/X = M
				J.p_mail.Add(X)					//Add the Mail to the user's mail list
				X.new_mail = 1					//and mark it as new.

	var/nm = 0									//New mail flag

	for(var/Mail/M in J.p_mail)					//If there's new mail
		if(M.new_mail)							//in the player's mail list,
			nm = 1								//set the new mail flag to true


	if(nm)																	//If there's new mail
		J<<"<B><font color = #00FFFF>YOU HAVE NEW MAIL!!</font></B>"		//Let the player know
		J.mail_indicator.New_Mail()

/********************************************************************************************/
/*	The next six procs - Mail(), New_Mail(), Add_Mail(), Remove_Mail(), View_Mail(), 		*/
/*	and Query_Mail() - are all used by the player verbs to access  and manipulate 			*/
/*	their mail. Mail() displays the mail box. New_Mail() composes new mail.					*/
/*	Add_Mail() creates new mail and adds it to the main list. Remove_Mail() does the 		*/
/*	opposite. View_Mail() displays the mail to the player and Query_Mail does essentially 	*/
/*	the same thing as Query_New_Mail() earlier except that it is not called at Login(), 	*/
/*	but whenever the mail box is view by Mail().											*/
/********************************************************************************************/


/********************************************************************************************/
/*									Mail()													*/
/********************************************************************************************/

mob/proc/Mail()
	var/mob/J = usr
	var/mbox = J.p_mail
	Query_Mail()
	var/H = {"
		<html>
		<body bgcolor = #000000 text = #FFFFFF link=#6600FF vlink=#6600FF>
		"}
	H+="<table width=100%>"
	H+="<tr><td></td><td>SUBJECT</td><td>AUTHOR</td><td>DATE/TIME</td><td>ACTIONS</td></tr>"
	var/cnt = 0
	//for(var/Mail/M in mbox)
	//	cnt++
	//	M.id = cnt
	//	var/a = dd_replacetext(M.author, " ", "+")
	//	if(M.new_mail)
	//		H+="<tr><td><font color=#FFFF00><b>NEW</b></font></td><td><a href=byond://?src=\ref[usr];action=mail_read;ID=[M.id]>[M.title]</a></td><td>[M.author]</td><td>[M.time]</td><td><a href=byond://?src=\ref[usr];action=mail_del;ID=[M.id]>\[DEL]</a> | <a href=byond://?src=\ref[usr];action=mail_add;name=[a]>\[ADD TO ADDRESS BOOK]</a></td></tr>"
	//	else
	//		H+="<tr><td></td><td><a href=byond://?src=\ref[usr];action=mail_read;ID=[M.id]>[M.title]</a></td><td>[M.author]</td><td>[M.time]</td><td><a href=byond://?src=\ref[usr];action=mail_del;ID=[M.id]>\[DEL]</a> | <a href=byond://?src=\ref[usr];action=mail_add;name=[a]>\[ADD TO ADDRESS BOOK]</a></td></tr>"
	H+="</table>"
	H+="<BR><HR><BR>"
	H+="<table width=50%>"
	H+="<tr><td><a href=byond://?src=\ref[usr];action=new_mail;>\[ COMPOSE NEW MAIL ]</a></td><td><a href=byond://?src=\ref[usr];action=address;>\[ ADDRESS BOOK ]</a></td></tr>"
	H+="</table>"
	H+={"
		</body>
		</html>
		"}
	J<<browse(H)
	J.mail_indicator.Clear()

	/****************************************************************************************/
	/*	This proc is what shows the player's their mail boxes and contains the links that	*/
	/*	enable the players to read mail, delete mail, write new mail, and modify their 		*/
	/*	address books.																		*/
	/****************************************************************************************/


/********************************************************************************************/
/*									New_Mail()												*/
/********************************************************************************************/

proc/New_Mail(mob/Mb = usr)

	var/Mail/M = new()
	M.title = input("Subject: ","New Mail") as text
	M.message = input("Write your mail here. Click OK when you're done. Use <br> and ctrl+enter to make a new line","New Mail | [M.title]") as message
	var/rec = input("Send mail to who? <br>\[seperate multiple entries with a ';']<br>use 'address' to include everyone in your address book","New Mail | [M.title]") as text
	//M.recipients = dd_text2list(rec, ";")
	for(var/v in M.recipients)
		if(lowertext(v) == "address")
			M.recipients.Remove(v)
			for(var/x in usr.contacts)
				M.recipients.Add(x)

	for(var/r in M.recipients)
		M.recipients[r] = 1

	Add_Mail(M)
	Mb.Mail()

	/****************************************************************************************/
	/*	This proc simply handles the creation and formating of new mail.					*/
	/****************************************************************************************/


/********************************************************************************************/
/*									Add_Mail()												*/
/********************************************************************************************/

proc/Add_Mail(var/Mail/M)

	if(!M:title)
		M:title = "No Subject"
	//If there's no subject, get a subject

	if(!M:message)
		M:message = "No Content"
		//If there's no message, get a message

	M:author = usr.name
	M:time = time2text(world.realtime,"hh:mm  MMM DD, YYYY")
	postoffice.Add(M)
	for(var/mob/MB as mob in players)
		if(M:recipients[MB.name])
			MB.mail_indicator.New_Mail()
			MB<<"<B><font color = #00FFFF>You have new mail from [M:author] \[[M:title]]!</font></b>"
	//Check everyone currently logged in against the address list. If they're on it, tell
	//them they have new mail.

	SavePO()
	//Save the main list after having modified it


/********************************************************************************************/
/*									Remove_Mail()											*/
/********************************************************************************************/

proc/Remove_Mail(var/ID, mob/Mb = usr)

	if(!ID)
		return
	ID = text2num(ID)
	for(var/Mail/M in usr.p_mail)
		if(M.id == ID)
			usr.p_mail.Remove(M)
	SavePO()
	Mb.Mail()
	//If the number is within the number of messages in the player's mail list, remove the mail.



/********************************************************************************************/
/*									View_Mail()												*/
/********************************************************************************************/

proc/View_Mail(var/ID)
	if(!ID)
		return
	ID = text2num(ID)
	var/Mail/M
	var/mob/J = usr
	for(var/Mail/X in J.p_mail)
		if(X.id == ID)
			M = X
	if(!M) return
	var/L = {"
		<html>
		<head><title>[usr.name]'s Mail | [M.title]</title></head>
		<body bgcolor = #000000 text = #FFFFFF>"}
	L+="<font color = #0000FF>FROM:</font> [M.author]<br>"
	L+="<font color = #0000FF>SUBJ:</font> [M.title]<br>"
	L+="<br><font color = #00FF00>[M.time]</font></br>"
	L+="<hr>"
	L+="[M.message]"
	L+="<hr>"
	L+="<table width=50%>"
	L+="<tr><td><a href=byond://?src=\ref[usr];action=mail>\[ Back to Mail Box] </a></td><td><a href=byond://?src=\ref[usr];action=mail_del;ID=[M.id]>\[ Delete This Message ]</td></tr>"
	L+={"
		</body>
		</html>"}
	usr<<browse(L)
	M.new_mail = 0
//If the message is valid, display it and mark it read



/********************************************************************************************/
/*									Query_Mail()											*/
/********************************************************************************************/

proc/Query_Mail()
	var/mob/J = usr
	//var/lst = {"
	//	<html>
	//	<body bgcolor = #000000 text = #FFFFFF>
	//	<center><h2>Mailbox for [usr.name]</h2></center><hr>"}
	//lst += "<table width = 100%><tr><td><B>NEW</B></td><td><b>#</b></td><td><b>SUBJ</b></td><td><b>AUTHOR</b></td><td><b>TIME/DATE</b></td></tr>"


	/************************************************************************************/
	/*	This proc does basically the EXACT same thing as Query_New_Mail(), except that	*/
	/*	it also displays the player's mail list to them. Only called from the PO area	*/
	/************************************************************************************/


	for(var/Mail/M in postoffice)
		if(M.Find_Rec(J:name)>0)
			M.Remove_Rec(J.name)
			if(M.recipients.len <= 0)
				postoffice.Remove(M)
			var/Mail/X = M
			J.p_mail.Add(X)
			X.id = J.p_mail.len
			X.new_mail = 1

		if(M.Find_Rec(J.name) < 0)
			if(!M.recipients[J:name])
				M.recipients.Add(J:name)
				M.recipients[J:name] = 1
				var/Mail/X = M
				J.p_mail.Add(X)
				X.new_mail = 1


	//if(J.p_mail.len > 0)
	//	for(var/Mail/L in J.p_mail)
	//		cnt++
	//		if(L.new_mail)
	//			lst+="<tr align><td><font color = #ff0000>*</font></td><td>[cnt]</td><td>[L.title]</td><td>[L.author]</td><td>[L.time]</td></tr>"
	//		else
	//			lst+="<tr align><td></td><td>[cnt]</td><td>[L.title]</td><td>[L.author]</td><td>[L.time]</td></tr>"




	//lst+="</table>"
	//if(J.p_mail.len <= 0)
	//	lst += "<center><font size= +3 color=#FFFF00>NO MAIL</font></center>>"
	//lst+={"
	//</body>
	//</html>"}
	//usr<<browse(lst)


/********************************************************************************************/
/*	The next two procs aren't directly involved in the mail handling. Well, one kinda is,	*/
/*	but I'll explain it in a minute. Addresses() works just like Mail() except that it 		*/
/*	displays the player's address book. Topic() is the function that handles all those		*/
/*	link calls and turns them into function calls.											*/
/********************************************************************************************/

proc/Addresses()
	var/mob/J = usr

	var/h = {"
		<html>
		<body bgcolor = #000000 text=#FFFFFF link=#6600FF vlink=#6600FF>
		"}
	h+="<table width=100%>"
	h+="<tr><td>NAME</td><td>DELETE</td></tr>"
	//for(var/x in J.contacts)
		//var/n = dd_replacetext(x, " ", "+")
		//h+="<tr><td>[x]</td><td><a href=byond://?src=\ref[usr];action=del;var=[n]>\[----------]</a></td></tr>"

	//h+="</table>"
	//h+="<br><hr><br>"
	//h+="<table width=50% align=left>"
	//h+="<tr><td><a href=byond://?src=\ref[usr];action=add>\[ Add New Contact ]</a></td><td><a href=byond://?src=\ref[usr];action=mail>\[ Mail Box ]</a></td></tr>"
//	h+="</table>"
	//h+="</body>"
	//h+="</html>"
	//J<<browse(h)



atom/Topic(href,href_list[])
	switch(href_list["action"])
		if("add")				//add an address directly to the address book
			var/n = input("Who do you wish to add to your address book?","Addresses") as null|text
			if(n)
				if(!usr.contacts[n])
					usr.contacts.Add(n)
					usr.contacts[n] = 1
				else
					alert("You already have that name in your address book!","OK")

			Addresses()


		if("del")				//delete an address from your address book
			var/n
			n = href_list["var"]
			switch(alert("Are you sure you want to delete [n] from your address book?","Addresses | Delete","Yes","No"))
				if("Yes")
					usr.contacts.Remove(n)


			Addresses()

		if("mail")				//bring up the mail box screen
			usr.Mail()

		if("address")			//ditto for the address book
			Addresses()

		if("mail_add")			//add an address to your addres book from the mail box
			var/N = href_list["name"]
			if(!usr.contacts[N])
				usr.contacts.Add(N)
				usr.contacts[N] = 1
			else
				alert("You already have that name in your address book!","OK")

			Addresses()



		if("mail_read")			//read mail
			var/ID = href_list["ID"]
			View_Mail(ID)

		if("mail_del")			//delete mail
			var/ID = href_list["ID"]
			Remove_Mail(ID)

		if("new_mail")			//compose new mail
			New_Mail()




/********************************************************************************************/
/*	The Mail atom is the basis of this library. Think of the Mail atom as a real letter		*/
/*	going from one player to another.														*/
/********************************************************************************************/

Mail
	var/message							//The actual content of the letter
	var/author							//Who wrote the letter
	var/title							//The title/subject of the letter
	var/time							//When the letter was written
	var/list/recipients = new/list()	//Who the letter is going to
	var/new_mail = 1					//New Mail Flag
	var/id								//Unique ID

	proc/Query_Rec()					//Functionality proc, not really used
		return recipients

	proc/Find_Rec(var/r)				//Used to determine if
		var/A = 0						//a player's name is on the list or if it's
		if(recipients["ALL"])			//going to ALL
			A = 1

		if(recipients[r] && A == 0)		//If it's not going to ALL and the name is on there
			return 1					//return 1

		else if(A)						//If it IS going to ALL
			return -1					//return -1

		else
			return 0					//If none of the above, return 0 (fail)

	proc/Remove_Rec(var/r)				//Delete a name from the list
		recipients.Remove(r)

obj/mail_indicator
	icon = DEFAULT_MAIL_ICON
	screen_loc = "NORTH-1,WEST+1"
	var/mob/M
	proc
		New_Mail()
			icon_state = "mail_new"
			if(M.client)
				M.client.screen += src
		Clear()
			if(M.client)
				M.client.screen -= src
			icon_state = "mail_default"

mob/var/obj/mail_indicator/mail_indicator = new()

/********************************************************************************************/
/*	The Post_Office object is the other basis of this library. It contains all the verbs	*/
/*	that get added and removed to/from the players.											*/
/********************************************************************************************/

obj/Post_Office

	verb/Mail_Box()						/********************************************************/
		set category = "Mail"			/* Displays the contents of the player's mail box		*/
		set src in oview(1)
		usr.Mail()						/********************************************************/

	verb/Address_Book()
		set category = "Mail"
		set src in oview(1)
		Addresses()


world
	New()							/********************************************************/
		..()						/*														*/
		LoadPO()					/*	Default load/save behavior. Loads on startup and	*/
	Del()							/*	saves before closedown								*/
		SavePO()					/********************************************************/
		..()
