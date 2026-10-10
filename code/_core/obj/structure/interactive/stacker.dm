/obj/structure/interactive/stacker
	name = "堆垛机"
	desc = "把物品堆在一起。"
	desc_extended = "将同类物品尽量合并为达到数量上限的堆叠。"
	icon = 'icons/obj/structure/stacking.dmi'
	icon_state = "stacker"

	pixel_y = 2

	bullet_block_chance = 50

	density = TRUE

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#0000FF"

/obj/structure/interactive/stacker/Crossed(atom/movable/O,atom/OldLoc)

	if(is_item(O))
		stack(O)
		return FALSE

	return ..()

/obj/structure/interactive/stacker/proc/stack(var/obj/item/I)

	if(I.amount_max <= 1) //Not stackable.
		return FALSE

	if(I.amount >= I.amount_max)
		if(I.loc != src.loc)
			I.drop_item(src.loc)
		return FALSE

	I.drop_item(src)

	for(var/obj/item/E in contents) //E for existing
		if(!I || I.qdeleting)
			break
		if(!E || E.qdeleting)
			continue
		if(E == I)
			continue
		if(I.can_transfer_stacks_to(E))
			I.transfer_amount_to(E)
			if(E.amount == E.amount_max)
				E.drop_item(src.loc)
			if(I.qdeleting)
				break
		CHECK_TICK(50,FPS_SERVER)

	return TRUE

/obj/structure/interactive/stacker/clicked_on_by_object(mob/activator, atom/object, location, control, params)
	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				activator.to_chat(span("notice","你松开了堆垛机的固定装置。"))
				anchored = FALSE
			else
				activator.to_chat(span("notice","你固定了堆垛机。"))
				anchored = TRUE
	else
		for(var/obj/item/T in contents)
			T.drop_item(get_turf(activator))
		activator.to_chat(span("notice","你清空了堆垛机。"))
	. = ..()
