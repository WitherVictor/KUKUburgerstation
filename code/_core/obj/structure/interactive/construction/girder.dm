/obj/structure/interactive/construction/girder
	name = "梁架"
	desc = "一副金属梁架。"
	desc_extended = "加上板材可以建墙，加上两根棒材可以装门。"
	icon_state = "girder"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC
	density = TRUE

	health_base = 100

	bullet_block_chance = 90


/obj/structure/interactive/construction/girder/proc/can_construct_wall(var/mob/activator,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(istype(src.loc,/turf/simulated/wall/))
		activator.to_chat(span("warning","不知为何，这里已经有一堵墙了……"))
		return FALSE
	if(S.amount < 1)
		activator.to_chat(span("warning","建墙需要1张板材！"))
		return FALSE
	if(S.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	return TRUE
/obj/structure/interactive/construction/girder/proc/can_construct_door(var/mob/activator,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(istype(src.loc,/turf/simulated/wall/))
		activator.to_chat(span("warning","不知为何，这里已经有一堵墙了……"))
		return FALSE
	if(S.amount < 2)
		activator.to_chat(span("warning","装门需要2根棒材！"))
		return FALSE
	if(S.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	return TRUE
/obj/structure/interactive/construction/girder/proc/construct_door(var/mob/activator,var/obj/item/material/sheet/S)
	var/obj/structure/interactive/door/airlock/glass/W = new(src.loc)
	//W.material_id = S.material_id NYI
	//W.color = S.color NYI
	INITIALIZE(W)
	GENERATE(W)
	FINALIZE(W)
	activator?.visible_message(span("notice","[activator.name]安装了[W.name]。"),span("notice","你安装了[W.name]。"))
	S.add_item_count(-2)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/girder/proc/construct_wall(var/mob/activator,var/obj/item/material/sheet/S)
	var/turf/simulated/T = src.loc
	T.change_turf(/turf/simulated/wall/metal/)
	T.material_id = material_id
	T.color = color
	activator?.visible_message(span("notice","[activator.name]建造了[T.name]。"),span("notice","你建造了[T.name]。"))
	S.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/girder/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 1),material_id)
	. = ..()
	qdel(src)


/obj/structure/interactive/construction/girder/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(istype(object,/obj/item/material/sheet/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_wall(),activator,object)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_wall(),activator,object)
		return TRUE
	if(istype(object,/obj/item/material/rod/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_door(),activator,object)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_door(),activator,object)
		return TRUE
	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				activator.to_chat(span("notice","你松开了梁架的固定装置。"))
				anchored = FALSE
			else
				activator.to_chat(span("notice","你固定了梁架。"))
				anchored = TRUE
		if(T.flags_tool & FLAG_TOOL_WIRECUTTER)
			activator.to_chat(span("notice","你拆解了[src.name]。"))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			if(src.can_do_destruction(FALSE))
				src.on_destruction(FALSE)
			return TRUE
		return TRUE
	return ..()
