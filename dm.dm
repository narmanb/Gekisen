mob
	proc

		powerupenemy()
			if(src.bosspower==1)
				if(src.poweringup==0)
					if(src.bosspower==1)
						src.poweringup=1
						var/aura = 'whiteaura.dmi'
						src.underlays += aura

						if(src.sounds==1)
							spawn()src<<'sounds/powerup.wav'
						for(var/mob/characters/L in oview(8))
							if(L.client)
								L << "<B>An aura flickers around [src]."
								if(L.sounds==1)
									spawn()L<<'sounds/powerup.wav'

						kiloop
						if(src.ki<src.maxki)
							src.ki+=src.maxki/8
							src.stamina-=rand(1,10)
							if(src.ki>src.maxki)
								src.ki=src.maxki
							sleep(50)
							src.underlays=0
							goto kiloop