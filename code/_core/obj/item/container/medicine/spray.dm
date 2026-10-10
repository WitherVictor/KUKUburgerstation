/obj/item/container/spray
	name = "医疗喷雾"
	desc = "喷完就祈祷吧。"
	desc_extended = "一种喷雾，可用于浸润绷带或混入药膏来增强效果，也可直接喷在伤口上。当然，无论怎么用，都要先确认里面装的是药物，而不是强腐蚀酸。"

	icon = 'icons/obj/item/container/spray.dmi'
	icon_state = "spray"

	var/icon_count = 8

	var/glass_color = "#FFFFFF"

	reagents = /reagent_container/spray/medical

	value = 5

/obj/item/container/spray/update_overlays()

	. = ..()

	var/image/I_liquid = new/image(initial(icon),"liquid_[CEILING(clamp(reagents.volume_current/reagents.volume_max,0,1)*icon_count,1)]")
	I_liquid.appearance_flags = RESET_COLOR
	I_liquid.color = reagents.color
	add_overlay(I_liquid)

	var/image/I_glass = new/image(icon,"glass")
	I_glass.appearance_flags = RESET_COLOR
	I_glass.color = glass_color
	add_overlay(I_glass)



/obj/item/container/spray/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	if(istype(object,/obj/item/container/healing))
		var/obj/item/container/healing/M = object
		var/reagent_transfer = min(5,reagents.volume_current)
		if(reagent_transfer <= 0)
			activator.to_chat(span("warning","[src.name]已经空了！"))
			return TRUE
		if(M.reagents.volume_current >= M.reagents.volume_max)
			activator.to_chat(span("warning","[M.name]已经装满了！"))
			return TRUE
		reagents.transfer_reagents_to(M.reagents,reagent_transfer, activator = activator)
		activator.visible_message(span("warning","[activator.name]用[src.name]喷洒[M.name]，使其浸润。"),span("notice","你用[src.name]喷洒[M.name]，使其浸润。"))
		return TRUE

	if(is_advanced(object) && is_advanced(activator))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(2)
		var/mob/living/advanced/victim = object
		var/mob/living/advanced/attacker = activator

		if(victim != attacker && reagents.contains_lethal && !allow_hostile_action(attacker.loyalty_tag,victim))
			attacker.to_chat(span("warning","你的忠诚标记阻止你伤害[victim.name]！"))
			return FALSE

		var/list/new_x_y = attacker.get_current_target_cords(params)

		params[PARAM_ICON_X] = new_x_y[1]
		params[PARAM_ICON_Y] = new_x_y[2]

		var/obj/item/organ/O = victim.get_object_to_damage(attacker,src,null,params,TRUE,TRUE)

		if(!O || !O.health || !O.reagents)
			return TRUE

		var/reagent_transfer = min(5,reagents.volume_current)
		if(reagent_transfer <= 0)
			activator.to_chat(span("warning","[src.name]已经空了！"))
			return TRUE

		reagents.transfer_reagents_to(O.reagents,reagent_transfer, activator = activator)

		if(activator == O.loc)
			activator.visible_message(span("notice","[activator.name]用[src]喷洒了自己的[O.name]。"),span("notice","你用[src.name]喷洒了自己的[O.name]。"))
		else
			activator.visible_message(span("warning","[activator.name]用[src]喷洒了[O.loc.name]的[O.name]。"),span("notice","你用[src.name]喷洒了[O.loc.name]的[O.name]。"))

		update_sprite()

		play_sound('sound/effects/window_spray.ogg',get_turf(victim))

		return TRUE


	return ..()
