mob/var/skill_points = 0

mob/proc/Counter_Attack(mob/M,str,def)
	if(src.countering)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(1+(src.counter/10)))
		if(M.dir==src.dir)
			return FALSE
		src.countering=1
		spawn(10)src.countering=0
		var/damage = (str/10)
		if(damage <= 0)
			damage = 1
		flick("attack",src)
		M << output("\green [src] Counters your attack!","output2")
		src << output("\green You Counter [M]'s attack!","output2")
		src.count_exp += 2+round(src.level/100)
		src.Counter_Level()
		if(src.spar && M.spar)
			var/mindmg = round(M.powerlevel_max*0.025)
			damage = mindmg
		M.powerlevel -= damage
		spawn(1) M.KO()
		return TRUE
	else
		return FALSE

mob/proc/Block_Attack(mob/M,str,def)
	if(src.blocking)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(1+(src.block/5)))
		if(M.dir==src.dir)
			return FALSE
		src.blocking=1
		spawn(10)src.blocking=0
		//var/block_power=def*3
		var/block_power=(str-def)*0.8
		if(block_power<=0)
			block_power = str
		var/damage = (str - block_power)
		if(damage <= 0)
			damage = 0
		flick("block",src)
		M << output("\green [src] Blocks your attack!","output2")
		src << output("\green You Block [M]'s attack!","output2")
		src.block_exp += 2+round(src.level/100)
		src.Block_Level()
		src.powerlevel -= damage
		spawn(1) KO(M)
		return TRUE
	else
		return FALSE

mob/proc/Deflect_Attack(mob/M)
	if(src.deflecting)
		return FALSE
	if(src.doing)
		return FALSE
	if(prob(1+(src.reflect/5)))
		if(M.dir==src.dir)
			return FALSE
		src.deflecting=1
		spawn(10)src.deflecting=0
		flick("attack",src)
		M << output("\green [src] Deflects your attack!","output2")
		src << output("\green You Deflect [M]'s attack!","output2")
		src.reflect_exp += 2+round(src.level/100)
		src.Reflect_Level()
		return TRUE
	else
		return FALSE

mob/proc/Dodge_Attack(mob/M)
	if(src.dodging)
		return
	if(src.doing)
		return
	if(prob(5+(src.dodge/5)))
		src.dodging=1
		spawn(10)src.dodging=0
		flick("IT",src)
		M << output("\green [src] Dodges your attack!","output2")
		src << output("\green You Dodge [M]'s attack!","output2")
		src.dodge_exp += 2+round(src.level/100)
		src.Dodge_Level()
		return TRUE
	else
		return FALSE