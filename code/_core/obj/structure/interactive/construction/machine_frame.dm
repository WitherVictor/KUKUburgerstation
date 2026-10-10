/obj/structure/interactive/construction/machine_frame
	name = "机器框架"
	desc = "一副金属机器框架。"
	desc_extended = "复杂机器需要先装入电子元件，其他机器则只需要相应零件。"
	icon_state = "machine_frame"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC
	density = TRUE
	anchored = FALSE
	health_base = 100
	var/electronics = FALSE
	bullet_block_chance = 90

/obj/structure/interactive/construction/machine_frame/proc/make_machine(var/mob/activator,var/obj/item/S,var/machine_to_make)
	var/turf/T = src.loc
	new machine_to_make(T)
	S.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/machine_frame/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 1),material_id)
	. = ..()
	qdel(src)

obj/structure/interactive/construction/machine_frame/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				activator.to_chat(span("notice","你松开了机器框架的固定装置。"))
				anchored = FALSE
			else
				activator.to_chat(span("notice","你固定了机器框架。"))
				anchored = TRUE
	if(istype(object,/obj/item/container/healing/cable))
		var/obj/item/P = object
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("notice","[activator.name]向[src.name]中装入了一些零件。"),span("notice","你向[src.name]中装入了一些零件。"))
		electronics = TRUE
		P.add_item_count(-1)
		return TRUE
	if(istype(object,/obj/item/weapon/melee/tool/pickaxe) && electronics)
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("notice","[activator.name]向[src.name]中装入了一些零件。"),span("notice","你向[src.name]中装入了一些零件。"))
		make_machine(activator,object,/obj/structure/interactive/mining_drill)
		return TRUE
	if(istype(object,/obj/item/material/sheet))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("notice","[activator.name]向[src.name]中装入了一些零件。"),span("notice","你向[src.name]中装入了一些零件。"))
		make_machine(activator,object,/obj/structure/interactive/mining_brace)
		return TRUE
	if(istype(object,/obj/item/crafting_bench/smelter))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("notice","[activator.name]向[src.name]中装入了一些零件。"),span("notice","你向[src.name]中装入了一些零件。"))
		make_machine(activator,object,/obj/structure/interactive/smelter)
		return TRUE
	if(istype(object,/obj/item/material/rod))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("notice","[activator.name]向[src.name]中装入了一些零件。"),span("notice","你向[src.name]中装入了一些零件。"))
		make_machine(activator,object,/obj/structure/interactive/conveyor)
	return ..()
