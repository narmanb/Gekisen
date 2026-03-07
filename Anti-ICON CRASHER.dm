//made by Masterdan


proc/check_icon(var/icon/A)
	if(!isicon(A))
		return 0
	else
		var/tex=file2text(A)
//		var/findText == findtextEX
		if(findText(tex,"// BEGIN_INTERNALS")||findText(tex,"// END_INTERNALS")\
		||findText(tex,"// BEGIN_FILE_DIR")||findText(tex,"// END_FILE_DIR")\
		||findText(tex,"// BEGIN_PREFERENCES")||findText(tex,"// END_PREFERENCES")\
		||findText(tex,"// BEGIN_INCLUDE")||findText(tex,"// END_INCLUDE"))
			return 0
		else return 1









