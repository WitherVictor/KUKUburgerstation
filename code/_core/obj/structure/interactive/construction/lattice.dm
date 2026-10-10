/obj/structure/interactive/construction/lattice
	name = "支撑网格"
	desc = "一副金属支撑网格。"
	desc_extended = "再加棒材可以建造格栅，加上板材可以铺成地板。"
	icon_state = "lattice"

	health_base = 50

/obj/structure/interactive/construction/lattice/proc/can_construct_grille(var/mob/activator,var/obj/item/material/rod/R)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(R)

	if(R.amount < 1)
		activator.to_chat(span("warning","建造格栅需要1根棒材！"))
		return FALSE
	if(R.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	if(get_dist(activator,src) > 1)
		activator.to_chat(span("warning","你离得太远了！"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/lattice/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 1),material_id)
	. = ..()
	qdel(src)

/obj/structure/interactive/construction/lattice/proc/construct_grille(var/mob/activator,var/obj/item/material/rod/R)
	var/obj/structure/interactive/construction/grille/G = new(src.loc)
	G.material_id = R.material_id
	G.color = R.color
	INITIALIZE(G)
	GENERATE(G)
	FINALIZE(G)
	activator?.visible_message(span("notice","[activator.name]建造了[G.name]。"),span("notice","你建造了[G.name]。"))
	R.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/lattice/proc/can_construct_reinf_wall(var/mob/activator,var/obj/item/material/sheet/S)

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

/obj/structure/interactive/construction/lattice/proc/construct_floor_plating(var/mob/activator,var/obj/item/material/sheet/S)
	var/turf/simulated/T = src.loc
	T.change_turf(/turf/simulated/floor/plating/,TRUE)
	T.color = S.color
	T.material_id = S.material_id
	activator?.visible_message(span("notice","[activator.name]铺设了[T.name]。"),span("notice","你铺设了[T.name]。"))
	S.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/lattice/proc/can_construct_floor_plating(var/mob/activator,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(istype(src.loc,/turf/simulated/floor/plating/))
		activator.to_chat(span("warning","这里已经铺有地板了！"))
		return FALSE
	if(S.amount < 1)
		activator.to_chat(span("warning","铺设地板需要1张板材！"))
		return FALSE
	if(S.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/lattice/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WIRECUTTER)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			if(src.can_do_destruction(FALSE))
				src.on_destruction(FALSE)
			return TRUE
		if(istype(I,/obj/item/material/rod/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_grille(),activator,object)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_grille(),activator,object)
			return TRUE
		if(istype(I,/obj/item/material/sheet/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_floor_plating(),activator,object)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_floor_plating(),activator,object)
			return TRUE

	return ..()
