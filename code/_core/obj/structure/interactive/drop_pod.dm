/obj/structure/interactive/drop_pod
	name = "轨道空降舱"
	desc = "呀——呼——！"
	desc_extended = "一种从轨道投下的空降舱。"
	icon = 'icons/obj/structure/drop_pod.dmi'
	icon_state = "pod"

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC
	collision_dir = NORTH | EAST | WEST

	bullet_block_chance = 90

	opacity = TRUE

	var/state = POD_IDLE
	var/ttl = SECONDS_TO_DECISECONDS(30)
	interaction_flags = FLAG_INTERACTION_LIVING | FLAG_INTERACTION_NO_TURF_CHECKING

	density = TRUE

/obj/structure/interactive/drop_pod/post_move(var/atom/old_loc)

	. = ..()

	for(var/k in contents)
		var/atom/movable/M = k
		M.post_move(old_loc)



/obj/structure/interactive/drop_pod/Cross(atom/movable/O,atom/oldloc)

	if(state == POD_IDLE)
		return TRUE

	return ..()

/obj/structure/interactive/drop_pod/Uncross(atom/movable/O,atom/newloc)

	if(state == POD_IDLE)
		return TRUE

	return ..()

/obj/structure/interactive/drop_pod/PreDestroy()
	for(var/k in contents)
		var/atom/movable/M = k
		M.force_move(src.loc)
	SSshuttle.all_drop_pods -= src
	. = ..()


/obj/structure/interactive/drop_pod/Finalize()
	SSshuttle.all_drop_pods += src
	return ..()

/obj/structure/interactive/drop_pod/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(state == POD_IDLE) //Lets rock!
		set_state(activator,POD_PRE_LAUNCH)
		return TRUE
	else if(state == POD_PRE_LAUNCH && (activator in contents)) //OH GOD OH FUCK CANCEL.
		set_state(activator,POD_IDLE)
		return TRUE

	return ..()

/obj/structure/interactive/drop_pod/Enter(atom/movable/O, atom/oldloc)

	if(state != POD_IDLE)
		return FALSE

	return ..()

/obj/structure/interactive/drop_pod/Exit(atom/movable/O, atom/newloc)

	if(state != POD_OPENING)
		return FALSE

	return ..()


/obj/structure/interactive/drop_pod/proc/set_state(var/mob/activator,var/desired_state,var/turf/desired_loc) //desired_loc is optional, same with activator.

	if(state == desired_state)
		return FALSE

	if(activator && !is_advanced(activator))
		return FALSE

	switch(desired_state)
		if(POD_IDLE) //Pod is set to IDLE if whoever is inside it cancels.
			icon_state = "pod"
			for(var/k in contents) //Eject everything.
				var/atom/movable/M = k
				M.force_move(src.loc)
		if(POD_PRE_LAUNCH) //Someone tries to move inside.
			if(!activator || activator.loc != src.loc)
				return FALSE
			var/obj/hud/button/map_background/M_background = locate() in activator.buttons
			if(M_background)
				activator.to_chat(span("warning","先关闭当前地图才能进入[src.name]！"))
				return FALSE
			if(!activator.Move(src))
				return FALSE
			M_background = new(activator,desired_pod=src)
			M_background.update_owner(activator)
			icon_state = "pod_closed"
		if(POD_LAUNCHING) //IT BEGINS. We're launching now.
			if(!SSgamemode.active_gamemode.allow_launch)
				activator.to_chat(span("warning","空降地点无效：纳米传讯认为现在发射并不安全！"))
				return FALSE
			if(!desired_loc)
				activator.to_chat(span("warning","空降地点无效：尚未选择空降地点。"))
				return FALSE
			for(var/d in DIRECTIONS_ALL)
				var/turf/T = get_step(desired_loc,d)
				if(!T || T.has_dense_atom)
					activator.to_chat(span("warning","空降地点无效：目标区域存在障碍物。"))
					return FALSE
				if(!T.is_safe() || !T.can_move_to())
					activator.to_chat(span("warning","空降地点无效：该区域不安全。"))
					return FALSE
				var/area/A = T.loc
				if(A.interior)
					activator.to_chat(span("warning","空降地点无效：目标区域存在障碍物。"))
					return FALSE
			icon_state = "none"
			flick("drop_anim",src)
			CALLBACK("set_state_\ref[src]",3,src,src::set_state(),activator,POD_LAUNCHED,desired_loc)
			play_sound('sound/machines/blastdoor.ogg',get_turf(src))
		if(POD_LAUNCHED)
			icon_state = "none"
			CALLBACK("set_state_\ref[src]",20,src,src::set_state(),activator,POD_LANDING,desired_loc)
		if(POD_LANDING)
			SSshuttle.drop_pod_turfs += get_turf(src)
			force_move(desired_loc)
			pixel_z = TILE_SIZE*20
			icon_state = "pod_air"
			animate(src,pixel_z = 0,time=20)
			CALLBACK("set_state_\ref[src]",20,src,src::set_state(),activator,POD_LANDED,desired_loc)
			play_sound('sound/machines/droppod_landing.ogg',get_turf(src))
		if(POD_LANDED)
			icon_state = "pod_closed"
			flick("land_anim",src)
			CALLBACK("set_state_\ref[src]",50,src,src::set_state(),activator,POD_OPENING,desired_loc)
			explode(desired_loc,3,src,src,"NanoTrasen")
		if(POD_OPENING)
			play_sound('sound/machines/droppod_land.ogg',get_turf(src))
			icon_state = "pod"
			for(var/k in contents)
				var/atom/movable/M = k
				M.force_move(src.loc)
			CALLBACK("set_state_\ref[src]",ttl,src,src::set_state(),activator,POD_DESTROY,desired_loc)
		if(POD_DESTROY)
			qdel(src)
	state = desired_state

	return TRUE
