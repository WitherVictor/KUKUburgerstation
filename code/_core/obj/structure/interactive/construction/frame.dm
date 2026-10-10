/obj/structure/interactive/construction/frame
	name = "框架"
	desc = "一副金属框架。"
	desc_extended = "加上棒材可以建造支撑网格，加上板材可以建造梁架。"
	icon_state = "frame"

	health_base = 25

/obj/structure/interactive/construction/frame/proc/can_construct_girder(var/mob/activator,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(!istype(src.loc,/turf/simulated/floor/plating/))
		activator.to_chat(span("warning","必须先铺好地板才能建造梁架！"))
		return FALSE
	if(S.amount < 1)
		activator.to_chat(span("warning","建造梁架需要1张板材！"))
		return FALSE
	if(S.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/frame/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 1),material_id)
	. = ..()
	qdel(src)

/obj/structure/interactive/construction/frame/proc/construct_girder(var/mob/activator,var/obj/item/material/sheet/S)
	var/obj/structure/interactive/construction/girder/G = new(src.loc)
	G.material_id = S.material_id
	G.color = S.color
	INITIALIZE(G)
	GENERATE(G)
	activator?.to_chat(span("notice","你建造了[G.name]。"))
	S.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/frame/proc/can_construct_lattice(var/mob/activator,var/obj/item/material/rod/R)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(R)

	if(R.amount < 1)
		activator.to_chat(span("warning","建造支撑网格需要1根棒材！"))
		return FALSE
	if(R.material_id != material_id)
		activator.to_chat(span("warning","材料种类不匹配！"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/frame/proc/construct_lattice(var/mob/activator,var/obj/item/material/rod/R)
	var/obj/structure/interactive/construction/lattice/L = new(src.loc)
	L.material_id = R.material_id
	L.color = R.color
	INITIALIZE(L)
	GENERATE(L)
	FINALIZE(L)
	activator?.to_chat(span("notice","你建造了[L.name]。"))
	R.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/frame/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WIRECUTTER)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			if(src.can_do_destruction(FALSE))
				src.on_destruction(FALSE)
			return TRUE
		if(istype(object,/obj/item/material/rod/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_lattice(),activator,object)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_lattice(),activator,object)
			return TRUE
		if(istype(object,/obj/item/material/sheet/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(1),src::construct_girder(),activator,object)
			PROGRESS_BAR_CONDITIONS(activator,src,src::can_construct_girder(),activator,object)
			return TRUE

	return ..()
