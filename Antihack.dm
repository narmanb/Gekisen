mob/proc/CheatChecker()
	set background = 1
	if(src.hp<0)
		src.hp=0
	if(src.maxpowerlevel>1000000000000000000000000000000)
		src.maxpowerlevel=1000000000000000000000000000000
	if(src.powerlevel>1000000000000000000000000000000)
		src.powerlevel=1000000000000000000000000000000
	sleep(200)
	spawn()src.CheatChecker()

mob/proc/CheatChecker12()
	var/dicer= rand(1,13)
	if(dicer==5||dicer==6)
		src.ss=0

	else
		src.ss=1
	sleep(80)
	spawn()CheatChecker12()
mob/proc/CheatChecker1()
	if(src.resting!=1&&src.meditating!=1&&src.frozen!=1)
		src.kame=0
		src.move=1
		src.speeding=0
		src.timeout=0
	sleep(20)
	spawn()CheatChecker1()
mob/proc/CheatChecker3()
	if(usr.key)
		src.onlinetime+=1

	sleep(500)
	spawn()src.CheatChecker3()
	sleep(1000)
	spawn()world.Worldloop()

mob/proc/musicloop()
	if(usr.key&&usr.music==1&&usr.musicp==0)
		usr.musicp=1
		//src << sound('7.mid',1,0,10)
	else
		if(usr.key&&usr.music==0&&usr.musicp==1)
			usr.musicp=0
			src << sound(null)
	sleep(30)
	spawn()src.musicloop()


mob/proc/CheatChecker2()
	if(usr.key)
		src.maxfocus=src.maxki/2+(src.defense/3)
		src.maxhp=src.conc+200+(src.maxfocus*(src.maxpowerlevel)/650)/3000000000//flagy
		src.defense=100+src.maxki/30*4+(src.conc+(src.conc*2))//flagy
		src.strength=100+src.maxki/5*4+(src.conc+(src.conc))*1//flagy
		src.speed=7000-(src.maxhp&&src.conc*1)-(src.strength/50*1+(src.conc*1))
		src.overlays-='electricity.dmi'
		src.overlays-='smokers.dmi'
	sleep(20)
	spawn()src.CheatChecker2()

