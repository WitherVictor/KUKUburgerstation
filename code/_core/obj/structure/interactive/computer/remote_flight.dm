var/global/list/obj/structure/interactive/computer/console/remote_flight/all_remote_flight_consoles = list()

/obj/structure/interactive/computer/console/remote_flight
	name = "远程飞行控制台"
	computer_type = "syndishuttle"
	keyboard_type = "syndie_key"

	var/obj/shuttle_controller/desired_shuttle_controller

/obj/structure/interactive/computer/console/remote_flight/Finalize()
	desired_shuttle_controller = locate(desired_shuttle_controller) in world
	all_remote_flight_consoles += src
	return ..()

/obj/structure/interactive/computer/console/remote_flight/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(!is_advanced(caller))
		return ..()

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	if(!SSgamemode.active_gamemode.allow_launch)
		caller.to_chat(span("warning","[desired_shuttle_controller.name]尚未准备好起飞！"))
		return FALSE

	var/list/launch_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
	var/selection = input("确定要让[desired_shuttle_controller.name]起飞吗？","穿梭机控制","取消") as null|anything in launch_choices
	selection = launch_choices[selection]

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(selection == "Yes")
		if(desired_shuttle_controller.state == SHUTTLE_STATE_LANDED)
			desired_shuttle_controller.state = SHUTTLE_STATE_WAITING
			desired_shuttle_controller.time = 0
			caller.visible_message(span("notice","[caller.name]通过[src.name]安排穿梭机起飞。"),span("notice","你通过[src.name]安排穿梭机起飞。"))
		else
			caller.to_chat(span("warning","错误：[desired_shuttle_controller.name]已在航行中。"))
	else
		caller.to_chat(span("notice","你决定不让[desired_shuttle_controller.name]起飞。"))

	return TRUE
