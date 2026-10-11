//Bosses
/obj/item/contract/boss/Generate()

	if(!reward)
		var/loot/L = LOOT(/loot/lavaland/contract)
		if(L)
			var/list/spawned_loot = L.do_spawn(src)
			if(length(spawned_loot) > 1) //Hacky fallback.
				reward = null
				for(var/k in spawned_loot)
					var/obj/item/I = k
					if(!reward)
						reward = I
					else
						qdel(I)
			else if(length(spawned_loot) == 0)
				reward = /obj/item/coin/adamantium
			else
				reward = spawned_loot[1]
		else
			reward = /obj/item/coin/adamantium

	. = ..()


/obj/item/contract/boss/ash_drake
	name = "契约：击杀灰烬飞龙"
	type_to_check = /mob/living/simple/ash_drake
	objective_text = "已击杀灰烬飞龙"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/bubblegum
	name = "契约：击杀泡泡糖"
	type_to_check = /mob/living/simple/bubblegum
	objective_text = "已击杀泡泡糖"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/can_man
	name = "契约：击杀罐头人"
	type_to_check = /mob/living/simple/can_man
	objective_text = "已击杀罐头人"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/colossus
	name = "契约：击杀巨像"
	type_to_check = /mob/living/simple/colossus
	objective_text = "已击杀巨像"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/herald
	name = "契约：击杀先驱"
	type_to_check = /mob/living/simple/herald
	objective_text = "已击杀先驱"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/hierophant
	name = "契约：击杀大祭司"
	type_to_check = /mob/living/simple/hierophant
	objective_text = "已击杀大祭司"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/leaper
	name = "契约：击杀跃行者"
	type_to_check = /mob/living/simple/leaper
	objective_text = "已击杀跃行者"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/obj/item/contract/boss/queen
	name = "契约：击杀异形女王"
	type_to_check = /mob/living/simple/xeno/queen
	objective_text = "已击杀异形女王"
	value_max = 1
	burgerbux_reward = 5
	value = 0

/*
/obj/item/contract/boss/broodmother
	name = "Kill the Broodmother"
	desc = "Kill the Broodmother."
	type_to_check = /mob/living/simple/goliath/broodmother
	objective_text = "XBroodmothers killed"
	value_max = 1
	burgerbux_reward = 5
*/
