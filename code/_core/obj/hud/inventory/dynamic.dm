/obj/hud/inventory/dynamic
	name = "储物格"
	icon_state = "square_round"

	max_size = -1

	should_draw = FALSE
	drag_to_take = FALSE

	max_slots = 1

	flags_hud = FLAG_HUD_INVENTORY | FLAG_HUD_SPECIAL | FLAG_HUD_CONTAINER

	should_add_to_advanced = FALSE

	var/slot_num = 0

	priority = -100 //Very low priority

/obj/hud/inventory/dynamic/New(var/desired_loc)
	. = ..()
	if(is_atom(desired_loc))
		var/atom/A = desired_loc
		name = "[A.name]的储物格"
	alpha = 0
	mouse_opacity = 0

/obj/hud/inventory/dynamic/sandwich //Special logic for buns

/obj/hud/inventory/dynamic/sandwich/can_slot_object(var/obj/item/I,var/messages = FALSE,var/bypass=FALSE)

	if(src.loc && istype(src.loc.loc,/obj/hud/inventory/dynamic/sandwich/)) //Our sandwich is in of another sandwich. Do not accept items.
		//No message needed.
		return FALSE

	if(istype(I,/obj/item/container/edible/sandwich/))
		var/obj/item/container/edible/sandwich/S = I
		for(var/obj/hud/inventory/I2 in S.inventories)
			if(length(I2.contents))
				if(owner) owner.to_chat(span("warning","你不能把三明治塞进另一个三明治里！这违反了三明治法则！"))
				return FALSE
		if(loc && loc == I)
			return FALSE

		if(max_slots <= 0)
			return FALSE

		if(is_occupied(TRUE))
			if(messages && src.loc)
				owner.to_chat(span("warning","[src.loc.name]已经被占用了！"))
			return FALSE

		if(length(contents) >= max_slots)
			if(messages) owner.to_chat(span("warning","[src.loc.name]里实在塞不下更多物品了！"))
			return FALSE

		return TRUE

	. = ..()


/*
/obj/hud/inventory/dynamic/belt
	var/obj/hud/button/slot/assoc_slot
	priority = -99 //Belt goes before anything else.


/obj/hud/inventory/dynamic/belt/Destroy()
	assoc_slot = null
	. = ..()

/obj/hud/inventory/dynamic/belt/update_stats() //Something was removed/added.
	. = ..()
	if(assoc_slot)
		var/obj/item/I = get_top_object()
		if(I)
			assoc_slot.store_object(I) //Also calls clear_object()
		else
			assoc_slot.clear_object()
*/
