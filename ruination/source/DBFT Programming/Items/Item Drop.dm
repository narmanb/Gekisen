mob/var/tmp/countdrop=0
mob
	proc
		Item_Drop()
			//world << "<b><font color = green>[src] called item drop"
			var/item = rand(1,2)
			var/type = rand(1,8)
			var/power = rand(1,12)
			var/level = src.level//rand(4000,120000)
			//world << "level: [level

			//world << "itemdrop1  item: [item]  type: [type]  level: [level]"
			if(prob(11)) //(was 11
				if(item == 1)
					if(prob(13)) // was 13
						if(type == 1)
							var/obj/O = new/obj/Equipment/Ankle
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100)) // was 70
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Weapon"

								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Ankle Weights of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Ankle Weights of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Ankle Weights of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Ankle Weights of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Ankle Weights"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 2)
							var/obj/O = new/obj/Equipment/Arm
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Weapon"


								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Weapon Power"


								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Arm Weights of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Arm Weights of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Arm Weights of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Arm Weights of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Arm Weights"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 3)
							var/obj/O = new/obj/Equipment/Weighted_Armor
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Weapon"


								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Armor of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Armor of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Armor of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Armor of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Weighted Armor"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 4)
							var/obj/O = new/obj/Equipment/Cape
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Weapon"

								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Cape of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Cape of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Cape of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Cape of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"

							else
								O.enchantment = ""
								O.power = 0
								O.name = "Weighted Cape"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 5)
							var/obj/O = new/obj/Equipment/Gi
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Weapon"

								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Gi of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Gi of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Gi of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Gi of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Weighted Gi"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 6)
							var/obj/O = new/obj/Equipment/Leg
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Weapon"

								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Leg Weights of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Leg Weights of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Leg Weights of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Leg Weights of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Leg Weights"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 7)
							var/obj/O = new/obj/Equipment/Turben
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Weapon"


								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Weighted Turben of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Weighted Turben of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Weighted Turben of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Weighted Turben of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Weighted Turben"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							//	..()
						if(type == 8)
							var/obj/O = new/obj/Equipment/Wrist
							var/r=rand(0,190)
							var/g=rand(0,190)
							var/b=rand(0,190)
							O.icon += rgb(r,g,b)
							if(prob(100))
								if(power == 1)
									O.enchantment = "Melee"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Melee"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Melee"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Melee"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Melee"
								if(power == 2)
									O.enchantment = "Block"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Block"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Block"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Block"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Block"
								if(power == 3)
									O.enchantment = "Dodge"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Dodge"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Dodge"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Dodge"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Dodge"
								if(power == 4)
									O.enchantment = "Counter"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Counter"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Counter"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Counter"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Counter"
								if(power == 5)
									O.enchantment = "Critical"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Critical"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Critical"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Critical"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Critical"

								if(power == 6)
									O.enchantment = "Durability"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Durability"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Durability"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Durability"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Durability"

								if(power == 7)
									O.enchantment = "Ki Power"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Ki Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Ki Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Ki Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Ki Power"
								if(power == 8)
									O.enchantment = "Ki Use"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Ki Use"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Ki Use"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Ki Use"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Ki Use"
								if(power == 9)
									O.enchantment = "Ki Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Ki Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Ki Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Ki Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Ki Resistance"
								if(power == 10)
									O.enchantment = "Weapon"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Weapon"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Weapon"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Weapon"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Weapon"


								if(power == 11)
									O.enchantment = "Weapon Power"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Weapon Power"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Weapon Power"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Weapon Power"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Weapon Power"

								if(power == 12)
									O.enchantment = "Weapon Resistance"
									if(level < 30000)
										O.power = 1
										O.name = "Wrist Weights of Weapon Resistance"
									if(level>=30000&&level<=75000)
										O.power = 2
										O.name = "Advanced Wrist Weights of Weapon Resistance"
									if(level>75000&&level<=200000)
										O.power = 3
										O.name = "Super Wrist Weights of Weapon Resistance"
									if(level>200000)
										O.power = 4
										O.name = "Ultra Wrist Weights of Weapon Resistance"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"
							else
								O.enchantment = ""
								O.power = 0
								O.name = "Wrist Weights"
								O.loc = src.loc
								oview(O) << "<font color = red><b>[src]</b> dropped <b>[O]<b>"

				if(item == 2)

					if(prob(40)) // was 40
						type = rand(2,8)
						if(type == 1)
							if(level<30000)
								var/obj/S = new/obj/Equipment/Buff_Items/SPL_Shard
								S.name = "Small Powerlevel Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>=30000&&level<=75000)
								//world << "ITEMDROP6"
								var/obj/S = new/obj/Equipment/Buff_Items/LPL_Shard
								S.name = "Large Powerlevel Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>75000&&level<=200000)
								var/obj/S = new/obj/Equipment/Buff_Items/GPL_Shard
								S.name = "Great Powerlevel Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>200000)
								var/obj/S = new/obj/Equipment/Buff_Items/MPL_Shard
								S.name = "Massive Powerlevel Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"

						if(type == 2)
							if(level<30000)
								var/obj/S = new/obj/Equipment/Buff_Items/SKI_Shard
								S.name = "Small Ki Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>=30000&&level<=75000)
								var/obj/S = new/obj/Equipment/Buff_Items/LKI_Shard
								S.name = "Large Ki Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>75000&&level<=200000)
								var/obj/S = new/obj/Equipment/Buff_Items/GKI_Shard
								S.name = "Great Ki Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>200000)
								var/obj/S = new/obj/Equipment/Buff_Items/MKI_Shard
								S.name = "Massive Ki Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"

						if(type == 3)
							if(level<30000)
								if(prob(1))
									var/obj/S = new/obj/Equipment/Buff_Items/ZP_Shard
									S.name = "ZP Shard"
									S.loc = src.loc
									oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>=30000&&level<=75000)
								if(prob(2.5))
									var/obj/S = new/obj/Equipment/Buff_Items/ZP_Shard
									S.name = "ZP Shard"
									S.loc = src.loc
									oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>75000&&level<=150000)
								if(prob(5))
									var/obj/S = new/obj/Equipment/Buff_Items/ZP_Shard
									S.name = "ZP Shard"
									S.loc = src.loc
									oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>150000&&level<=500000)
								if(prob(10))
									var/obj/S = new/obj/Equipment/Buff_Items/ZP_Shard
									S.name = "ZP Shard"
									S.loc = src.loc
									oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>500000)
								if(prob(50))
									var/obj/S = new/obj/Equipment/Buff_Items/ZP_Shard
									S.name = "ZP Shard"
									S.loc = src.loc
									oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"

						if(type == 4)
							if(level<30000)
								var/obj/S = new/obj/Equipment/Buff_Items/SSTR_Shard
								S.name = "Small Strength Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>=30000&&level<=75000)
								var/obj/S = new/obj/Equipment/Buff_Items/LSTR_Shard
								S.name = "Large Strength Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>75000&&level<=200000)
								var/obj/S = new/obj/Equipment/Buff_Items/GSTR_Shard
								S.name = "Great Strength Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>200000)
								var/obj/S = new/obj/Equipment/Buff_Items/MSTR_Shard
								S.name = "Massive Strength Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"

						if(type == 5)
							if(level<30000)
								var/obj/S = new/obj/Equipment/Buff_Items/SDEF_Shard
								S.name = "Small Defense Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>=30000&&level<=75000)
								var/obj/S = new/obj/Equipment/Buff_Items/LDEF_Shard
								S.name = "Large Defense Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>75000&&level<=200000)
								var/obj/S = new/obj/Equipment/Buff_Items/GDEF_Shard
								S.name = "Great Defense Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"
							if(level>200000)
								var/obj/S = new/obj/Equipment/Buff_Items/MDEF_Shard
								S.name = "Massive Defense Shard"
								S.loc = src.loc
								oview(S) << "<font color = blue><b>[src]</b> dropped <b>[S]<b>"

						if(type == 6)
							if(prob(10))
								if(level<30000)
									var/obj/S = new/obj/Equipment/Buff_Items/SEXP_Shard
									S.name = "Small Exp Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>=30000&&level<=75000)
									var/obj/S = new/obj/Equipment/Buff_Items/LEXP_Shard
									S.name = "Large Exp Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>75000&&level<=200000)
									var/obj/S = new/obj/Equipment/Buff_Items/GEXP_Shard
									S.name = "Great Exp Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>200000)
									var/obj/S = new/obj/Equipment/Buff_Items/MEXP_Shard
									S.name = "Massive Exp Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"

						if(type == 7)
							if(prob(10))
								if(level<30000)
									var/obj/S = new/obj/Equipment/Buff_Items/SSTT_Shard
									S.name = "Small Stat Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>=30000&&level<=75000)
									var/obj/S = new/obj/Equipment/Buff_Items/LSTT_Shard
									S.name = "Large Stat Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>75000&&level<=200000)
									var/obj/S = new/obj/Equipment/Buff_Items/GSTT_Shard
									S.name = "Great Stat Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>200000)
									var/obj/S = new/obj/Equipment/Buff_Items/MSTT_Shard
									S.name = "Massive Stat Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"

						if(type == 8)
							if(prob(10))
								if(level<30000)
									var/obj/S = new/obj/Equipment/Buff_Items/SZ_Shard
									S.name = "Small Zenni Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>=30000&&level<=75000)
									var/obj/S = new/obj/Equipment/Buff_Items/LZ_Shard
									S.name = "Large Zenni Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>75000&&level<=200000)
									var/obj/S = new/obj/Equipment/Buff_Items/GZ_Shard
									S.name = "Great Zenni Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"
								if(level>200000)
									var/obj/S = new/obj/Equipment/Buff_Items/MZ_Shard
									S.name = "Massive Zenni Shard"
									S.loc = src.loc
									oview(S) << "<font color = yellow><b>[src]</b> dropped <b>[S]<b>"

