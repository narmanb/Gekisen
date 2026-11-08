proc/SortByVar(var/list/unsortedList,var/var2SortBy)
	var/list/sortedList=list()
	while(istype(unsortedList,/list) && unsortedList.len)
		var/curHighest=0
		var/atom/highestAtom
		for(var/atom/A in unsortedList)
			if(!(var2SortBy in A.vars))
				world.log<<"SortByVar error: no '[var2SortBy]' var on [A]"
				return list()
			if(!curHighest || A.vars[var2SortBy]>curHighest)
				curHighest=A.vars[var2SortBy]
				highestAtom=A
		unsortedList-=highestAtom
		sortedList+=highestAtom
	return sortedList