/obj/structure/interactive/fulton
	name = "富尔顿回收气球"
	desc = "正在回收……"
	desc_extended = "一个已部署的富尔顿回收包，即将把某件物品或某个人带上天空。"

	icon = 'icons/obj/effects/fulton.dmi'
	icon_state = "none"

	plane = PLANE_EFFECT
	layer = LAYER_MOB_FLYING

	var/mob/owner
	var/atom/movable/stored_movable

	pixel_y = 16

	mouse_opacity = 1

	anchored = 2

/obj/structure/interactive/fulton/PreDestroy()
	if(stored_movable)
		if(loc)
			stored_movable.force_move(loc)
		else
			qdel(stored_movable)
		stored_movable = null
	. = ..()

/obj/structure/interactive/fulton/Destroy()
	owner = null
	. = ..()

/obj/structure/interactive/fulton/proc/do_invalid_fulton()

	var/turf/T = get_turf(src)

	stored_movable.force_move(T)

	if(is_living(stored_movable))
		var/mob/living/L = stored_movable
		L.add_status_effect(STUN,30,30)

	visible_message(span("danger","[src.name]未能回收[stored_movable.name]！"))

	stored_movable = null

	var/obj/item/fulton_pack/F = new(T)
	INITIALIZE(F)
	F.amount = 1
	FINALIZE(F)

	qdel(src)

	return TRUE



/obj/structure/interactive/fulton/proc/fly_away()
	visible_message(span("danger","[src.name]飞上天空，带走了[stored_movable.name]！"))
	play_sound('sound/effects/fultext_launch.ogg',get_turf(src))
	animate(src,pixel_z = TILE_SIZE*VIEW_RANGE,alpha=0,color="#000000",time=SECONDS_TO_DECISECONDS(1),easing=BACK_EASING | EASE_IN)
	CALLBACK("\ref[src]_sell",SECONDS_TO_DECISECONDS(2),src,src::sell_stored())
	return TRUE

/obj/structure/interactive/fulton/proc/sell_stored()

	. = 0

	if(!stored_movable)
		qdel(src)
		return 0

	if(is_living(stored_movable))
		var/mob/living/L = stored_movable
		if(L.is_player_controlled() && L.loyalty_tag == "NanoTrasen")

			L.to_chat(span("danger","你被卖回了纳米传讯，还被强制补缴了税款！"))
			if(is_player(L))
				var/mob/living/advanced/player/P = L
				. += -P.adjust_currency(-3000)

			//Teleport to station.
			var/obj/structure/interactive/fulton_beacon/FB = locate() in world
			if(FB)
				L.force_move(get_turf(FB))
			else
				log_error("FATAL WARNING: No fulton beacon was found in world!")
				do_invalid_fulton()
				return 0
			return .
		else
			L.to_chat(span("danger","你被俘虏了！下次好运！"))
		. = CEILING(L.get_value(),1)
		L.death(TRUE)
	else
		. = CEILING(stored_movable.get_value(),1)

	if(. && is_player(owner) && owner.client)
		var/mob/living/advanced/player/P = owner
		. = FLOOR(.*0.25,1)
		var/added_funds = P.adjust_currency(.)
		P.to_chat(span("notice","出售[stored_movable.name]后，你分得了[nice_number(added_funds)]信用点。"))

	qdel(stored_movable)
	stored_movable = null
	qdel(src)

/obj/structure/interactive/fulton/proc/can_be_extracted(var/mob/activator,var/atom/movable/M)

	if(is_player(M))
		var/mob/living/advanced/player/P = M
		if(P.loyalty_tag == "NanoTrasen" && P.dead)
			activator.to_chat(span("warning","纳米传讯不接收死去的船员！"))
			return FALSE
		return TRUE

	if(!M.is_safe_to_delete(check_loc = FALSE))
		activator.to_chat(span("warning","似乎有什么阻止了对[M.name]的回收……"))
		return FALSE

	if(istype(M,/obj/structure/interactive/artifact))
		activator.to_chat(span("warning","[M.name]太重，富尔顿回收系统无法将其吊起！"))
		return FALSE
	return TRUE

/obj/structure/interactive/fulton/proc/add_movable(var/mob/activator,var/atom/movable/M)

	if(stored_movable)
		return FALSE

	owner = activator
	stored_movable = M
	M.force_move(src)
	update_sprite()

	activator.visible_message(span("danger","[activator.name]把[src.name]连接到[M.name]上。"),span("warning","你把[src.name]连接到[M.name]上。"))

	if(can_be_extracted(activator,M))
		if(is_living(M))
			var/mob/living/L = M
			if(!L.dead)
				L.rejuvenate() //Might as well.
		CALLBACK("\ref[src]_fly",SECONDS_TO_DECISECONDS(3),src,src::fly_away()) //CLIFF RACEEEEEEEEEEEER
	else
		CALLBACK("\ref[src]_fail",SECONDS_TO_DECISECONDS(3),src,src::do_invalid_fulton())

	animate(src,pixel_z = TILE_SIZE, time=SECONDS_TO_DECISECONDS(2),easing=BOUNCE_EASING)

	play_sound('sound/effects/fultext_deploy.ogg',get_turf(src))

	return TRUE


/obj/structure/interactive/fulton/update_icon()

	. = ..()

	if(stored_movable)
		icon_state = "expand"
	else
		icon_state = "retract"


/obj/structure/interactive/fulton/update_underlays()

	. = ..()

	if(stored_movable)
		var/image/I = new
		I.appearance = stored_movable
		I.pixel_x = initial(stored_movable.pixel_x)
		I.pixel_y = initial(stored_movable.pixel_y) - pixel_y
		I.plane = PLANE_EFFECT
		I.layer = FLOAT_LAYER
		add_underlay(I)
