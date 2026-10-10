/obj/item/ghost_box
	name = "捕鬼盒"
	desc = "无意侵权。"
	desc_extended = "一种特殊盒子，启动后可以困住从上方“走过”的猎杀幽灵。"

	icon = 'icons/obj/item/ghost_trap.dmi'

	var/active = FALSE

	var/stored_ghost = FALSE

	value = 800

	density = TRUE

/obj/item/ghost_box/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("stored_ghost")

/obj/item/ghost_box/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("stored_ghost")

/obj/item/ghost_box/Finalize()
	update_sprite()
	return ..()

/obj/item/ghost_box/get_base_value()
	. = ..()
	if(stored_ghost)
		. += 10000


/obj/item/ghost_box/Crossed(atom/movable/O,atom/OldLoc)

	if(stored_ghost)
		return ..()

	. = ..()

	if(istype(O,/mob/living/simple/ghost))
		var/mob/living/simple/ghost/G = O
		if(istype(G.ai,/ai/ghost))
			var/ai/ghost/GAI = G.ai
			if(GAI.objective_attack)
				stored_ghost = TRUE
				value = get_base_value()
				update_sprite()
				qdel(G)


/obj/item/ghost_box/click_self(var/mob/activator,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(1)

	if(stored_ghost)
		activator.to_chat(span("warning","[src.name]锁住了！"))
	else if(active)
		activator.to_chat(span("notice","你关闭了[src.name]。"))
		active = FALSE
	else
		activator.to_chat(span("notice","你启动了[src.name]。"))
		active = TRUE

	update_sprite()

	return TRUE

/obj/item/ghost_box/update_icon()

	icon_state = initial(icon_state)

	if(stored_ghost)
		icon_state = "[icon_state]_filled"
	else if(active)
		icon_state = "[icon_state]_on"

	return ..()


