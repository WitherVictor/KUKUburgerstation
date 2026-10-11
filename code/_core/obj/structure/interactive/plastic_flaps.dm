/obj/structure/interactive/plastic_flaps
	name = "气密塑料帘"
	desc = "穿不过去的软帘，这是什么魔法？"
	desc_extended = "号称能阻隔空气的塑料帘，站立的生物无法穿过，躺下后可以通行。"
	anchored = TRUE
	icon = 'icons/obj/structure/plastic_flaps.dmi'
	icon_state = "plastic_flaps"
	plane = PLANE_SCENERY

	bullet_block_chance = 25

	density = TRUE

/obj/structure/interactive/plastic_flaps/Cross(atom/movable/O,atom/oldloc)

	if(is_living(O))
		var/mob/living/L = O
		if(!L.horizontal)
			return FALSE

	return ..()

/obj/structure/interactive/plastic_flaps/clicked_on_by_object(mob/activator, atom/object, location, control, params)
	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				activator.to_chat(span("notice","你解除了塑料帘的固定。"))
				anchored = FALSE
			else
				activator.to_chat(span("notice","你固定了塑料帘。"))
				anchored = TRUE
	. = ..()
