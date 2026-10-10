/obj/structure/interactive/construction/grille
	name = "格栅"
	desc = "一副金属格栅。"
	desc_extended = "加上玻璃可以装成窗户。"
	icon_state = "grille"

	icon = 'icons/obj/structure/grille.dmi'
	icon_state = "grille"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE
	density = TRUE

	corner_category = "grille"
	corner_icons = TRUE

	health_base = 75

	plane = PLANE_WALL

	bullet_block_chance = 50

	layer = LAYER_OBJ_WINDOW - 0.1

/obj/structure/interactive/construction/grille/proc/can_construct_window(var/mob/activator,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(istype(src.loc,/obj/structure/window/))
		activator.to_chat(span("warning","这里已经有窗户了！"))
		return FALSE
	if(S.amount < 1)
		activator.to_chat(span("warning","安装窗户需要1张玻璃板！"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/grille/proc/construct_window(var/mob/activator,var/obj/item/material/sheet/S)
	var/obj/structure/window/W = new(src.loc)
	W.material_id = S.material_id
	W.color = S.color
	INITIALIZE(W)
	GENERATE(W)
	FINALIZE(W)
	activator?.visible_message(span("notice","[activator.name]安装了[W.name]。"),span("notice","你安装了[W.name]。"))
	S.add_item_count(-1)
	return TRUE

/obj/structure/interactive/construction/grille/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WIRECUTTER)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			if(src.can_do_destruction(FALSE))
				activator.to_chat(span("notice","你拆解了[src.name]。"))
				src.on_destruction(FALSE)
			return TRUE
	if(istype(object,/obj/item/material/sheet))
		var/obj/item/material/sheet/S = object
		if(ispath(S.material_id,/material/glass))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(3),src::construct_window(),activator,object)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_window(),activator,object)
			return TRUE

	return ..()

/obj/structure/interactive/construction/grille/Cross(atom/movable/O,atom/oldloc)
	if(istype(O,/obj/structure/window/)) //Allow windows to easily fit on grilles.
		return TRUE
	return ..()

/obj/structure/interactive/construction/grille/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 2),material_id)
	. = ..()
	qdel(src)

/obj/structure/interactive/construction/grille/plasteel
	name = "塑钢格栅"
	desc = "一副塑钢格栅。"
	color = COLOR_PLASTEEL
	material_id = /material/plasteel
