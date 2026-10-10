/obj/item/container/edible/dynamic/cake
	name = "糕点面团"
	icon = 'icons/obj/item/consumable/food/cake.dmi'
	icon_state = "dough_ball"
	crafting_id = "pastry_dough"

	cooked_icon_state = "cake"
	raw_icon_state = "dough_ball"

	health = /health/obj/item/misc/

	scale_sprite = FALSE

	reagents = /reagent_container/food/bread

	allow_reagent_transfer_to = TRUE

	var/last_cooked = FALSE

	value = 0

/obj/item/container/edible/dynamic/cake/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(5)

	if(icon_state == raw_icon_state && (icon_state == "dough_flat" || icon_state == "dough_slice"))
		raw_icon_state = "dough_ball"
		cooked_icon_state = "cake"
		activator.visible_message(span("notice","[activator.name]重新捏好了[src.name]。"),span("notice","你重新捏好了[src.name]。"))

	update_sprite()

	return TRUE

/obj/item/container/edible/dynamic/cake/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(icon_state == raw_icon_state && istype(object,/obj/item/container/edible/dynamic/cake)) //IT'S RAW.
		var/obj/item/container/edible/dynamic/bread/B = object
		if(B.icon_state == B.raw_icon_state) //IT'S FUCKING RAW.
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			var/amount_to_transfer = min(reagents.volume_current,B.reagents.volume_max - B.reagents.volume_current)
			if(amount_to_transfer <= 0)
				if(is_living(activator))
					var/mob/living/L = activator
					L.to_chat(span("warning","你无法再往[B.name]里添加面团了！"))
				return TRUE
			if(is_living(activator))
				var/mob/living/L = activator
				L.visible_message(span("notice","[activator.name]将[name]揉进了[B.name]。"),span("notice","你将[name]揉进了[B.name]。"))
			reagents.transfer_reagents_to(B.reagents,amount_to_transfer)
			if(reagents.volume_current <= 0) qdel(src)
			return TRUE

	return ..()


/obj/item/container/edible/dynamic/cake/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/atom/weapon,var/damagetype/DT,var/list/damage_table,var/damage_amount,var/critical_hit_multiplier,var/stealthy=FALSE)

	var/original_volume = reagents.volume_current

	if( (damage_table[BLADE] && !damage_table[BLUNT]) || damage_table[BLADE] > damage_table[BLUNT]) //Cut
		if(icon_state == raw_icon_state) //It's RAW!!!

			if(raw_icon_state == "dough_flat")
				var/pieces = FLOOR(original_volume/10, 1)
				if(pieces <= 1 || original_volume < pieces)
					if(is_living(attacker))
						var/mob/living/L = attacker
						L.to_chat(span("warning","面团太少，无法继续切分！"))
					return FALSE
				raw_icon_state = "dough_slice"
				for(var/i=1,i<=pieces-1,i++)
					var/obj/item/container/edible/dynamic/bread/B = new(get_turf(src))
					B.pixel_x = pixel_x
					B.pixel_y = pixel_y
					B.raw_icon_state = raw_icon_state
					B.cooked_icon_state = cooked_icon_state
					INITIALIZE(B)
					reagents.transfer_reagents_to(B.reagents,original_volume/pieces)
					FINALIZE(B)
					animate(B, pixel_x = pixel_x + rand(-4,4), pixel_y= pixel_y + rand(-4,4), time=5)
				animate(src, pixel_x = pixel_x + rand(-4,4), pixel_y= pixel_y + rand(-4,4), time=5)
				update_sprite() //TODO: Wait, why is the below not enclosed in the above condition statement?
				if(is_living(attacker))
					var/mob/living/L = attacker
					L.visible_message(span("notice","[L.name]将[src.name]切成了几块。"),span("notice","你将[src.name]切成了[pieces]块。"))

			else if(raw_icon_state == "dough_ball")
				if(original_volume > 10)
					var/obj/item/container/edible/dynamic/bread/B = new(get_turf(src))
					B.pixel_x = pixel_x
					B.pixel_y = pixel_y
					INITIALIZE(B)
					reagents.transfer_reagents_to(B.reagents,10)
					FINALIZE(B)
					animate(B, pixel_x = pixel_x + rand(-4,4), pixel_y= pixel_y + rand(-4,4), time=5)
				update_sprite() //TODO: Wait, why is the below not enclosed in the above condition statement?
				if(is_living(attacker))
					var/mob/living/L = attacker
					L.visible_message(span("notice","[L.name]从[src.name]上切下了一小块面团。"),span("notice","你从[src.name]上切下了一小块面团。"))

		//else if(icon_state == "cake") //It's cooked, and a cake.
			//Make cake slices.

	else if( (!damage_table[BLADE] && damage_table[BLUNT]) || damage_table[BLADE] < damage_table[BLUNT]) //Flatten
		if(has_prefix(icon_state,"dough") && raw_icon_state != "dough_flat")
			raw_icon_state = "dough_flat"
			cooked_icon_state = "pie"
			if(is_living(attacker))
				var/mob/living/L = attacker
				L.visible_message(span("notice","[L.name]压平了[src.name]。"),span("notice","你压平了[src.name]。"))
			update_sprite()

	return TRUE

/obj/item/container/edible/dynamic/cake/can_be_attacked(var/atom/attacker,var/atom/weapon,var/params,var/damagetype/damage_type)
	return TRUE

/obj/item/container/edible/dynamic/cake/update_sprite()
	if(reagents)
		color = reagents.color
	return ..()


/obj/item/container/edible/dynamic/cake/update_overlays()

	. = ..()

	if(last_cooked)
		var/icing = FALSE
		var/icing_color = null
		var/icing_amount = 0
		for(var/reagent_type in reagents.stored_reagents)
			var/amount = reagents.stored_reagents[reagent_type]
			var/reagent/R = REAGENT(reagent_type)
			if(istype(R,/reagent/nutrition/icing))
				icing = TRUE
				icing_color = icing_amount ? blend_colors(icing_color,R.color,amount/icing_amount) : R.color
				icing_amount += amount
		if(icing)
			var/image/I = new/image(initial(icon),"[cooked_icon_state]_icing")
			I.appearance_flags = src.appearance_flags | RESET_COLOR
			I.color = icing_color
			I.alpha = clamp((icing_amount/10)*225,100,255)
			add_overlay(I)


/obj/item/container/edible/dynamic/cake/update_icon()

	if(last_cooked)
		return FALSE

	if(!reagents)
		return ..()

	var/total_dough = 0
	var/total_bread = 0

	var/best_dough_reagent_type
	var/best_dough_reagent_amount

	var/best_bread_reagent_type
	var/best_bread_reagent_amount

	var/wetness = 0
	var/wetness_prefix = "完美的"

	var/cooked_percent = 0

	for(var/reagent_type in reagents.stored_reagents)
		var/amount = reagents.stored_reagents[reagent_type]
		var/reagent/R = REAGENT(reagent_type)
		wetness += R.liquid*(amount/reagents.volume_current)
		if(R.flags_reagent & FLAG_REAGENT_RAW)
			total_dough += amount
			if(best_dough_reagent_type && best_dough_reagent_amount >= amount)
				continue
			best_dough_reagent_type = reagent_type
			best_dough_reagent_amount = amount
		if(R.flags_reagent & FLAG_REAGENT_COOKED)
			total_bread += amount
			if(best_bread_reagent_type && best_bread_reagent_amount >= amount)
				continue
			best_bread_reagent_type = reagent_type
			best_bread_reagent_amount = amount

	if(total_dough + total_bread)
		cooked_percent = total_bread / (total_dough + total_bread)

	if(cooked_percent > 0.5) //It's cake

		switch(wetness)
			if(-INFINITY to -20)
				wetness_prefix = "干燥的"
			if(20 to INFINITY)
				wetness_prefix = "湿润的"

		if(best_bread_reagent_type)
			var/reagent/R = REAGENT(best_bread_reagent_type)
			name = "[wetness_prefix][R.name]"
		else
			name = "[wetness_prefix]神秘蛋糕"

	else //It's dough

		switch(wetness)
			if(-INFINITY to -10)
				wetness_prefix = "干燥的"
			if(10 to INFINITY)
				wetness_prefix = "湿漉漉的"

		if(best_dough_reagent_type)
			var/reagent/R = REAGENT(best_dough_reagent_type)
			name = "[wetness_prefix][R.name]"
		else
			name = "[wetness_prefix]神秘糕点"

	if(reagents.volume_current <= 20 && cooked_icon_state == "cake")
		cooked_icon_state = "cup_cake"
		raw_icon_state = "dough_ball_small"

	else if(reagents.volume_current > 20 && cooked_icon_state == "cup_cake")
		cooked_icon_state = "cake"
		raw_icon_state = "dough_ball"

	icon_state = cooked_percent > 0.5 ? cooked_icon_state : raw_icon_state

	if(cooked_percent > 0.5)
		last_cooked = TRUE

	return TRUE
