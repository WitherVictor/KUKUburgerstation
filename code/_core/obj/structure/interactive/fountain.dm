/obj/structure/interactive/fountain
	name = "魔法喷泉"
	desc = "稍作停留，听我一言。"
	desc_extended = "能为使用者恢复生命值、法力或体力的魔法喷泉，用过一次后就会耗尽。"

	icon = 'icons/obj/structure/fountain.dmi'
	icon_state = "fountain"

	var/fountain_type = 0
	//1 = health
	//2 = mana
	//3 = stamina

	var/filled = FALSE

	desired_light_range = 0.5
	desired_light_power = 1
	desired_light_color = "#FFFFFF"

	pixel_y = 8

/obj/structure/interactive/fountain/Generate()

	if(!fountain_type)
		fountain_type = rand(1,3)

	filled = TRUE

	return ..()

/obj/structure/interactive/fountain/get_examine_list(var/mob/examiner)

	. = ..()

	if(!filled)
		. += div("notice","已经空了。")


/obj/structure/interactive/fountain/Finalize()
	update_sprite()
	return ..()

/obj/structure/interactive/fountain/update_sprite()

	desc_extended = initial(desc_extended)

	switch(fountain_type)
		if(1)
			desc_extended = "[desc_extended]这座恢复生命值。"
		if(2)
			desc_extended = "[desc_extended]这座恢复法力。"
		if(3)
			desc_extended = "[desc_extended]这座恢复体力。"



	return ..()

/obj/structure/interactive/fountain/update_icon()

	icon_state = initial(icon_state)

	if(filled)
		switch(fountain_type)
			if(1)
				icon_state = "[icon_state]_health"
			if(2)
				icon_state = "[icon_state]_mana"
			if(3)
				icon_state = "[icon_state]_stamina"
			else
				set_light(FALSE)

	return ..()


/obj/structure/interactive/fountain/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	var/mob/living/L = activator

	if(filled)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		switch(fountain_type)
			if(1)
				L.brute_regen_buffer = max(L.brute_regen_buffer,200)
				L.burn_regen_buffer = max(L.burn_regen_buffer,200)
				L.tox_regen_buffer = max(L.tox_regen_buffer,200)
			if(2)
				L.mana_regen_buffer = max(L.mana_regen_buffer,600)
			if(3)
				L.stamina_regen_buffer = max(L.stamina_regen_buffer,600)
		visible_message(span("notice","[activator.name]激发了[src.name]的能量，恢复了自身状态。"),span("notice","[activator.name]激发了[src.name]的能量，恢复了自身状态。"))
		filled = FALSE
		update_sprite()
		return TRUE

	return ..()
