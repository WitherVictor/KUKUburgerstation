/mob/living/vehicle/
	name = "载具"
	desc = "可供驾驶员乘坐的大型载具。"

	var/list/mob/living/advanced/passengers //Slot 1 is a driver.
	var/passengers_max = 1

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	opacity = 0
	anchored = FALSE

	layer = LAYER_MOB_BELOW

	var/list/obj/item/equipment = list()

	var/list/vehicle_buttons = list()

	iff_tag = "NanoTrasen"
	loyalty_tag = "NanoTrasen"

	var/list/buttons_to_add = list(
		/obj/hud/button/vehicle/eject,
	)

	blood_type = null

	health = /health/mob/living/vehicle

/mob/living/vehicle/get_examine_details_list()

	. = ..()

	for(var/k in equipment)
		var/obj/item/I = k
		. += div("notice","装有[I.name]。")

/mob/living/vehicle/on_crush(var/message=TRUE)

	for(var/k in passengers)
		var/mob/living/advanced/A = k
		exit_vehicle(A,loc)
		A.on_crush(message)

	qdel(src)

	return TRUE

/mob/living/vehicle/PreDestroy()

	if(passengers)
		for(var/k in passengers)
			var/mob/living/advanced/A = k
			exit_vehicle(A,loc)
		passengers.Cut()

	QDEL_CUT(equipment)

	. = ..()

/mob/living/vehicle/post_death()
	for(var/k in passengers)
		var/mob/living/advanced/A = k
		exit_vehicle(A, get_turf(src))
	explode(get_turf(src),2,src,src)
	return ..()

/mob/living/vehicle/proc/add_buttons(var/mob/living/advanced/A)
	for(var/v in buttons_to_add)
		var/obj/hud/button/B = new v(src)
		B.update_owner(A)
	return TRUE

/mob/living/vehicle/proc/remove_buttons(var/mob/living/advanced/A)
	for(var/k in A.buttons)
		var/obj/hud/button/B = k
		if(B.type in buttons_to_add)
			B.update_owner(null)
	return TRUE

/mob/living/vehicle/proc/attach_equipment(var/mob/activator,var/obj/item/I)
	if(I in equipment)
		return FALSE
	if(I.unremovable)
		return FALSE
	activator?.to_chat(span("notice","[activator.name]将[I.name]安装到[src.name]上。"),span("notice","你将[I.name]安装到[src.name]上。"))
	equipment += I
	I.drop_item(src)
	I.unremovable = TRUE
	update_sprite()

/mob/living/vehicle/proc/unattach_equipment(var/mob/activator,var/obj/item/I)
	if(!(I in equipment))
		return FALSE
	activator?.visible_message(span("notice","[activator.name]从[src.name]上拆下了[I.name]。"),span("notice","你从[src.name]上拆下了[I.name]。"))
	equipment -= I
	I.force_move(get_turf(activator))
	I.unremovable = initial(I.unremovable)
	update_sprite()

/mob/living/vehicle/New(var/desired_loc)
	..()
	passengers = list()
	equipment = list()
	update_sprite()


/mob/living/vehicle/proc/can_attach_weapon(var/mob/activator,var/obj/item/weapon/W)

	if(ai || length(passengers))
		activator?.to_chat(span("warning","载具正在使用，无法安装！"))
		return FALSE
	if(length(equipment) >= 2)
		activator?.to_chat(span("warning","[src.name]装不下更多武器了！"))
		return FALSE

	return TRUE

/mob/living/vehicle/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(activator == src)
		return ..()

	DEFER_OBJECT

	if(is_item(defer_object) && is_living(activator))
		var/mob/living/L = activator
		if(L.intent != INTENT_HARM)
			var/obj/item/I = defer_object
			if(I.flags_tool & FLAG_TOOL_WRENCH)
				INTERACT_CHECK
				INTERACT_CHECK_OBJECT
				INTERACT_DELAY(5)
				if(ai || length(passengers))
					activator.to_chat(span("warning","载具正在使用，无法拆卸！"))
					return TRUE
				if(!length(equipment))
					activator.to_chat(span("warning","[src.name]上没有可拆卸的东西！"))
					return TRUE
				var/atom/movable/choice = input("你想拆下什么？","拆卸装备") as null|anything in equipment
				if(choice && choice in equipment)
					activator?.visible_message(span("notice","[activator.name]从[src.name]上拆下了[choice.name]。"),span("notice","你从[src.name]上拆下了[choice.name]。"))
					unattach_equipment(activator,choice)
				else
					activator.to_chat(span("notice","你决定什么都不拆。"))
				return TRUE

	if(is_inventory(object))
		if(!can_enter_vehicle(activator))
			return TRUE
		PROGRESS_BAR(activator,src,SECONDS_TO_DECISECONDS(3),src::enter_vehicle(),activator)
		PROGRESS_BAR_CONDITIONS(activator,src,src::can_enter_vehicle(),activator)
		return TRUE

	return ..()

/mob/living/vehicle/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(is_hud(object))
		return ..()

	if(!length(params))
		params = list("right" = rand(0,1), "left" = rand(0,1))

	if(params["left"])
		if(length(equipment) >= 1)
			equipment[1].click_on_object(activator,object,location,control,params)
		else
			src.do_say("1号槽位没有装备！")

	if(params["right"])
		if(length(equipment) >= 2)
			equipment[2].click_on_object(activator,object,location,control,params)
		else
			src.do_say("2号槽位没有装备！")

	return TRUE

/mob/living/vehicle/handle_movement(var/adjust_delay = 0) //Runs every tick for players. Runs every decisecond for mobs.

	if(ai)
		return ..()

	if(length(passengers) && passengers[1].move_dir && next_move <= 0)
		var/final_movement_delay = get_movement_delay()
		next_move = round(max(final_movement_delay,next_move + final_movement_delay),0.1)
		glide_size = step_size/next_move
		Move(get_step(src,passengers[1].move_dir),passengers[1].move_dir)
		return TRUE

	if(adjust_delay)
		next_move = max(0,next_move - adjust_delay)

	return FALSE

/mob/living/vehicle/set_dir(var/desired_dir,var/force=FALSE)

	. = ..()

	if(.)
		for(var/k in passengers)
			var/mob/living/L = k
			if(L==src)
				log_error("WARNING: A vehicle was in its own passengers list!")
				continue
			L.set_dir(.)


/mob/living/vehicle/proc/enter_vehicle(atom/movable/Obj,atom/OldLoc)

	if(!is_advanced(Obj))
		return FALSE

	if(dead)
		to_chat(span("warning","[src.name]已被摧毁！"))
		return FALSE

	if(length(passengers) >= passengers_max)
		to_chat(span("warning","[src.name]内的空间不足以容纳[length(passengers) + 1]人！"))
		return FALSE

	var/mob/living/advanced/L = Obj
	L.driving = src
	passengers += L
	L.force_move(src.loc)
	if(L.client)
		L.client.eye = src
	L.has_footsteps = FALSE
	L.invisibility = 100
	L.update_collisions(FLAG_COLLISION_NONE,FLAG_COLLISION_BULLET_NONE)
	add_buttons(L)
	L.show_hud(TRUE,FLAG_HUD_VEHICLE,speed=SECONDS_TO_DECISECONDS(1))
	update_sprite()

	return TRUE

/mob/living/vehicle/post_move()

	. = ..()

	for(var/k in passengers)
		var/atom/movable/M = k
		M.force_move(src.loc)


/mob/living/vehicle/proc/exit_vehicle(atom/movable/Obj, atom/newloc)

	if(!is_advanced(Obj))
		return FALSE

	var/mob/living/advanced/L = Obj
	L.driving = null
	passengers -= L
	if(L.client)
		L.client.eye = L
	L.invisibility = initial(L.invisibility)
	L.has_footsteps = initial(L.has_footsteps)
	L.update_collisions(initial(L.collision_flags),initial(L.collision_bullet_flags))
	remove_buttons(L)
	L.show_hud(FALSE,FLAG_HUD_VEHICLE,speed=0)
	update_sprite()

	return TRUE

/mob/living/vehicle/proc/can_enter_vehicle(var/mob/activator)

	INTERACT_CHECK_NO_DELAY(src)

	if(length(passengers) >= passengers_max)
		activator.to_chat(span("warning","[src.name]已满员！"))
		return FALSE

	if(!is_advanced(activator))
		activator.to_chat(span("warning","你无法进入[src.name]！"))
		return FALSE

	var/mob/living/advanced/A = activator

	if(loyalty_tag && loyalty_tag != A.loyalty_tag)
		activator.to_chat(span("warning","错误：无法识别敌我识别标记。"))
		return FALSE

	return TRUE
