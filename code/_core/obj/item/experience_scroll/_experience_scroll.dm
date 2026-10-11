/obj/item/experience_scroll

	name = "经验卷轴"
	desc = "知识尽在掌中。"
	desc_extended = "阅读后可获得一定经验的特殊卷轴，只能使用一次。"

	icon = 'icons/obj/item/experience_scroll.dmi'
	icon_state = "scroll"

	amount_max = 1

	weight = WEIGHT_0
	size = SIZE_2

	var/overlay_icon_state = "gem"
	var/overlay_color = "#FFFFFF"

	value_burgerbux = 1 //Prevents being sold in vendors or found in random loot.

	rarity = RARITY_MYTHICAL

	var/type_to_give
	var/level_to_give = 3

/obj/item/experience_scroll/Finalize()
	. = ..()
	update_sprite()

/obj/item/experience_scroll/get_base_value() //Subtypes should calculate this.
	return 0

/obj/item/experience_scroll/update_overlays()
	. = ..()
	if(overlay_icon_state)
		var/image/I = new/image(icon,overlay_icon_state)
		if(overlay_color) I.color = overlay_color
		add_overlay(I)

/obj/item/experience_scroll/proc/gain_knowledge(var/mob/living/advanced/A)
	play_sound('sound/ui/friendly.ogg',get_turf(src),range_max=VIEW_RANGE)
	return TRUE

/obj/item/experience_scroll/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!is_advanced(activator) || !activator.is_player_controlled())
		activator.to_chat(span("warning","你看不懂这份卷轴……"))
		return TRUE

	var/mob/living/advanced/A = activator

	if(!A.allow_experience_gains)
		activator.to_chat(span("warning","你看不懂这份卷轴……"))
		return TRUE

	if(gain_knowledge(activator))
		activator.visible_message(span("notice","[activator.name]阅读[src.name]，汲取其中的知识……"),span("notice","你阅读[src.name]，汲取其中的知识……"))
		add_item_count(-1)

	return TRUE
