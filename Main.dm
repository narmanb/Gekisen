/////////////////////////////
// Find text & Sort Text variables for fix
/////////////////////////////
/*

var/findText == findtextEX
var/sortText == sorttextEX
var/findtextEX// = findText
var/sorttextEX// = sortText
var/ckeyEx// = cKey
var/cKey == ckeyEx
*/

var/saving_bugreport
mob
	var/list/admins = list("Masterdan","Kadajz","Cyberpirate")
	verb
		BugReport()
			set name = "Add Report"
			set category = "Communication"
			if(usr.key=="Masterdan"||usr.key=="Zero_Tiger"||usr.key=="SSJ3Spike"||usr.key=="Zucrois"||usr.key=="DBZRaziel"||usr.key=="LSSJ Vegetto"||src.key=="Bazanku"||src.key=="Ticky"||src.key=="Kadajz"||usr.key=="Cyberpirate")
				var/S = input("","Bug Report") in list("Add Report","Edit Report","Check Reports","Cancel")
				switch(S)
					if("Add Report")
						goto ADDBUG
					if("Edit Report")
						var/op = input("Check what","CheckReport") in list("Bug","Suggestion","Flaw","Cancel")
						if(op == "Cancel") return
						var/F
						switch(op)
							if("Bug") F = file2text("reports/bug.html")
							if("Suggestion") F = file2text("reports/suggestion.html")
							if("Flaw") F = file2text("reports/flaw.html")
						var/N = input("Edit Reports","Edit Reports",F) as message|null
						var/file
						switch(op)
							if("Bug") file = "reports/bug.html"
							if("Suggestion") file = "reports/suggestion.html"
							if("Flaw") file = "reports/flaw.html"
						fdel(file)
						text2file(N,file)
						N = null
						return
					if("Check Reports")
						var/op = input("Check what","CheckReport") in list("EditLog","Bug","Suggestion","Flaw","Save Editlog","Cancel")
						if(op == "Cancel") return
						var/bugfile
						switch(op)
							if("Bug") bugfile = file2text("reports/bug.html")
							if("Suggestion") bugfile = file2text("reports/suggestion.html")
							if("Flaw") bugfile = file2text("reports/flaw.html")
							if("EditLog") bugfile = file2text("reports/editlog.html")
							if("Save Editlog")
								var/efile= ("reports/editlog.html")
								usr << ftp(efile)
						usr << browse(bugfile)
						return
					else return
			ADDBUG
			var/op = input("What do you have to report","Report Selection") in list("Bug","Suggestion","Flaw","Cancel")
			if(op == "Cancel") return
			var/bugnew2
			var/bugfile
			var/file
			switch(op)
				if("Bug")
					bugnew2 = input("Any details on the bug you've found","Bug Report") as message|null
					if(bugnew2 == null) return
					bugfile = file2text("reports/bug.html")
					file = "reports/bug.html"
				if("Suggestion")
					bugnew2 = input("Any details on your suggestion","Suggestion") as message|null
					if(bugnew2 == null) return
					bugfile = file2text("reports/suggestion.html")
					file = "reports/suggestion.html"
				if("Flaw")
					bugnew2 = input("Any details on the flaw","Flaw Report") as message|null
					if(bugnew2 == null) return
					bugfile = file2text("reports/flaw.html")
					file = "reports/flaw.html"
			while(saving_bugreport == 1)
				sleep(1)
			saving_bugreport = 1
			var/bugnew = "[usr.name]/[usr.ckey]: [bugnew2]<br><br>"
			var/bugfinal = bugfile + bugnew
			fdel(file)
			text2file(bugfinal,file)
			bugfinal = null
			saving_bugreport = null
			return

//////////////////////////////
// FindtextEX Error Error Fix
//////////////////////////////
/*
proc/findtextEX(proc/findText)
	if findText(findText == findtextEX)
	return
proc/sorttextEX(proc/sortText)
	if sortText(sortText == sorttextEX)
	return
proc/ckeyEx(proc/cKey)
	if cKey(cKey == ckeyEX)
	return
*/