obj/structure/interactive/computer/console/flight
	name = "飞行控制台"
	desc = "哔哔啵啵。"
	desc_extended = "用于操控设备。这台控制台用于控制穿梭机。"
	computer_type = "syndishuttle"
	keyboard_type = "syndie_key"

obj/structure/interactive/computer/console/flight/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_advanced(caller))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	var/obj/shuttle_controller/SC = locate() in get_area(src)

	if(!SC)
		caller.to_chat(span("warning","未找到穿梭机控制器！"))
		return FALSE

	if(SC.time_restricted && !SSgamemode.active_gamemode.allow_launch)
		caller.to_chat(span("warning","穿梭机尚未准备好起飞！"))
		return FALSE

	var/list/launch_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
	var/selection = input("确定要让这艘穿梭机起飞吗？","穿梭机控制","取消") in launch_choices
	selection = launch_choices[selection]

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(selection == "Yes")
		if(SC.state == SHUTTLE_STATE_LANDED)
			SC.state = SHUTTLE_STATE_WAITING
			SC.time = 0
			caller.to_chat(span("notice","你安排穿梭机准备起飞。"))
		else
			caller.to_chat(span("warning","错误：穿梭机已在航行中。"))

	return TRUE
