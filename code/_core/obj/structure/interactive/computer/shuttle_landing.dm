

/obj/structure/interactive/computer/console/shuttle_landing
	name = "穿梭机降落电脑"
	desc = "按下按钮，就能阻挡所有来访飞船。"
	desc_extended = "一台通用穿梭机降落电脑，用于控制穿梭机能否通过自动驾驶降落在此处。"

	computer_type = "syndishuttle"
	keyboard_type = "syndie_key"

	var/shuttle_number = 0

	var/obj/marker/shuttle_landing/linked_marker


/obj/structure/interactive/computer/console/shuttle_landing/Initialize()
	SSshuttle.global_shuttle_number++
	shuttle_number = SSshuttle.global_shuttle_number //Assign the shuttle landing number.
	SSshuttle.all_shuttle_landing_consoles += src
	. = ..()

/obj/structure/interactive/computer/console/shuttle_landing/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	var/mob/living/L = activator

	if(!linked_marker)
		return ..()

	INTERACT_CHECK

	if(linked_marker.reserved_by_shuttle)
		L.to_chat(span("notice","[src.name]报告：已有穿梭机正在前往此处，或已在此区域降落。"))
		return TRUE

	if(!SSgamemode.active_gamemode?.allow_launch)
		L.to_chat(span("warning","错误：穿梭机尚未准备好起飞。"))
		return TRUE

	var/list/state_labels = list(SHUTTLE_STATE_NONE = "无状态", SHUTTLE_STATE_LAUNCHING = "正在起飞", SHUTTLE_STATE_TRANSIT = "航行中", SHUTTLE_STATE_LANDING = "正在降落", SHUTTLE_STATE_LANDED = "已着陆", SHUTTLE_STATE_WAITING = "准备起飞")
	while(TRUE)
		var/list/choices = list("取消" = "Cancel")

		if(linked_marker.owning_shuttle)
			var/obj/shuttle_controller/SC = linked_marker.owning_shuttle
			if(SC.loyalty_owner != L.loyalty_tag)
				continue
			var/area/A = get_area(SC)
			var/shuttle_text = "[A.name]：[state_labels[SC.state] ? state_labels[SC.state] : SC.state]"
			choices[shuttle_text] = SC
		else
			for(var/k in SSshuttle.all_shuttle_controlers)
				var/obj/shuttle_controller/SC = k
				if(SC.loyalty_owner != L.loyalty_tag)
					continue
				var/area/A = get_area(SC)
				var/shuttle_text = "[A.name]：[state_labels[SC.state] ? state_labels[SC.state] : SC.state]"
				choices[shuttle_text] = SC

		var/desired_choice = input("选择要呼叫的穿梭机。","呼叫穿梭机","取消") as null|anything in choices

		INTERACT_CHECK

		if(!desired_choice || choices[desired_choice] == "Cancel")
			return TRUE

		if(!SSgamemode.active_gamemode.allow_launch)
			L.to_chat(span("warning","错误：穿梭机尚未准备好起飞。"))
			return TRUE

		var/obj/shuttle_controller/SC = choices[desired_choice]
		if(SC.state != SHUTTLE_STATE_LANDED)
			activator.to_chat(span("notice","该穿梭机当前状态：[state_labels[SC.state] ? state_labels[SC.state] : SC.state]。"))
			continue

		if(linked_marker.reserved_by_shuttle)
			L.to_chat(span("notice","[src.name]报告：已有穿梭机正在前往此处，或已在此区域降落。"))
			return TRUE

		var/list/call_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
		desired_choice = input("确定要呼叫这艘穿梭机吗？","呼叫穿梭机","取消") as null|anything in call_choices
		desired_choice = call_choices[desired_choice]

		INTERACT_CHECK

		if(!desired_choice || desired_choice == "Cancel")
			return TRUE

		if(desired_choice == "No")
			continue

		//Only choice: Yes.

		if(SC.set_destination(activator,linked_marker) && SC.start_flight(activator))
			return TRUE

	. = ..()



/obj/marker/landing_decal_left
	name = "landing decal 0"
	icon = 'icons/obj/decal/shuttle_number.dmi'
	icon_state = "0"
	alpha = 200
	initialize_type = INITIALIZE_LATE

	var/obj/structure/interactive/computer/console/shuttle_landing/linked_computer

/obj/marker/landing_decal_left/Finalize()

	. = ..()

	var/obj/structure/interactive/computer/console/shuttle_landing/best_computer
	var/best_distance = INFINITY
	for(var/k in SSshuttle.all_shuttle_landing_consoles)
		var/obj/structure/interactive/computer/console/shuttle_landing/SL = k
		if(!best_computer)
			best_computer = SL
			best_distance = get_dist(SL,src)
			continue
		var/distance = get_dist(SL,src)
		if(distance > best_distance)
			continue
		best_distance = distance
		best_computer = SL

	var/obj/decal/shuttle_number/SN = new(src.loc)
	SN.icon_state = "[FLOOR(best_computer.shuttle_number/10,1)]"
	INITIALIZE(SN)
	GENERATE(SN)
	FINALIZE(SN)


/obj/marker/landing_decal_right
	name = "landing decal 1"
	icon = 'icons/obj/decal/shuttle_number.dmi'
	icon_state = "1"
	alpha = 200
	initialize_type = INITIALIZE_LATE

/obj/marker/landing_decal_right/Finalize()

	. = ..()

	var/obj/structure/interactive/computer/console/shuttle_landing/best_computer
	var/best_distance = INFINITY
	for(var/k in SSshuttle.all_shuttle_landing_consoles)
		var/obj/structure/interactive/computer/console/shuttle_landing/SL = k
		if(!best_computer)
			best_computer = SL
			best_distance = get_dist(SL,src)
			continue
		var/distance = get_dist(SL,src)
		if(distance > best_distance)
			continue
		best_distance = distance
		best_computer = SL

	var/obj/decal/shuttle_number/SN = new(src.loc)
	SN.icon_state = "[best_computer.shuttle_number % 10]"
	INITIALIZE(SN)
	GENERATE(SN)
	FINALIZE(SN)





/obj/marker/shuttle_landing
	name = "landing zone"
	icon = 'icons/obj/markers/markers.dmi'
	icon_state = "spawn"
	initialize_type = INITIALIZE_NORMAL

	var/obj/structure/interactive/computer/console/shuttle_landing/linked_computer

	var/reserved_by_shuttle = FALSE

	var/obj/shuttle_controller/owning_shuttle //Who owns the marker? Applies to bluespace transit areas and base transit areas.

	anchored = 2

/obj/marker/shuttle_landing/proc/set_reserved(var/desired_reserved=TRUE)

	if(reserved_by_shuttle == desired_reserved)
		CRASH("Tried setting [src.get_debug_name()] reserved var to [desired_reserved], but it was already [desired_reserved]!")
		return FALSE

	src.reserved_by_shuttle = desired_reserved

	return TRUE

/obj/marker/shuttle_landing/Finalize()
	. = ..()
	if(!SSdmm_suite.is_pvp_coord(loc.x,loc.y,loc.z,32))
		var/obj/structure/interactive/computer/console/shuttle_landing/best_computer
		var/best_distance = 1 + VIEW_RANGE*2
		for(var/k in SSshuttle.all_shuttle_landing_consoles)
			var/obj/structure/interactive/computer/console/shuttle_landing/SL = k
			if(SL.z != src.z)
				continue
			if(!best_computer)
				best_computer = SL
				best_distance = get_dist(SL,src)
				continue
			var/distance = get_dist(SL,src)
			if(distance > best_distance)
				continue
			best_distance = distance
			best_computer = SL

		if(best_computer)
			best_computer.linked_marker = src
			src.linked_computer = best_computer

		if(!owning_shuttle)
			SSshuttle.all_shuttle_landing_markers += src
