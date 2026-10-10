/obj/hud/button/stat/body
	name = "肢体健康"
	desc = "各肢体的健康状况。"
	desc_extended = "显示当前的大致健康状况。生命值低于 0 时会进入濒危状态，此时容易遭受致命攻击。生命值会随时间恢复，也可以通过药物和食物恢复。"
	id = "body"

	icon = 'icons/hud/hud.dmi'
	icon_state = "invisible"

	screen_loc = "RIGHT,CENTER"

	user_colors = FALSE

	var/list/labeled_overlays = list()

/obj/hud/button/stat/body/Destroy()
	labeled_overlays?.Cut()
	. = ..()

/obj/hud/button/stat/body/update_owner(var/mob/desired_owner)

	. = ..()

	labeled_overlays.Cut()
	vis_contents.Cut()

	//Generate the organs.
	if(. && is_advanced(owner))
		var/mob/living/advanced/A = owner
		for(var/o_id in A.labeled_organs)
			var/obj/item/organ/O = A.labeled_organs[o_id]
			if(!O)
				continue
			if(!O.health)
				continue
			if(!O.hud_id)
				continue
			if(!O.health.health_max)
				continue
			var/obj/hud/I = new
			I.appearance = src.appearance
			I.icon = icon
			I.icon_state = O.hud_id
			I.color = "#000000"
			labeled_overlays[o_id] = I
			add_vis_content(I)
		update()

/obj/hud/button/stat/body/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_living(activator))
		var/mob/living/L = activator
		var/damage_description = L.get_damage_description(activator)
		if(damage_description)
			L.to_chat(damage_description)

	return ..()

/obj/hud/button/stat/body/update()

	if(!is_advanced(owner))
		return FALSE

	var/mob/living/advanced/A = owner

	var/good_color = "#00FF00"
	var/bad_color = "#FF0000"

	if(owner && owner.client)
		var/color_scheme = owner.client.settings.loaded_data["hud_colors"]
		good_color = color_scheme[2]
		bad_color = color_scheme[6]

	for(var/o_id in labeled_overlays)

		var/obj/hud/I = labeled_overlays[o_id]
		var/obj/item/organ/O = A.labeled_organs[o_id]

		if(!O || !O.health || !O.hud_id || O.health.health_max <= 0 && O.broken)
			I.color = "#000000"
			continue

		var/perceived_health_mod = (O.health.health_current + A.pain_regen_buffer*0.25) - max(0,O.health.damage[PAIN] - A.pain_regen_buffer)
		perceived_health_mod = clamp(CEILING( perceived_health_mod / O.health.health_max, 0.01),0,1)

		var/color_mod = "#000000" //Final color
		if(perceived_health_mod <= 0)
			color_mod = "#303030"
		else if(perceived_health_mod >= 1)
			color_mod = good_color
		else
			color_mod = blend_colors(bad_color,good_color,perceived_health_mod*0.9)

		if(I.color == "#000000")
			I.color = color_mod
		else
			animate(I,color=color_mod,time=TICKS_TO_DECISECONDS(LIFE_TICK_FAST))

		labeled_overlays[o_id] = I

	. = ..()


/obj/hud/button/stat/body/get_examine_list(var/mob/examiner)
	return examiner.get_examine_list(examiner)
