obj/structure/interactive/computer/wall
	name = "壁挂电脑"
	desc = "计算墙壁！"
	desc_extended = "没有程序，就是不肯工作。"

	icon_state = "computer_wall"
	var/computer_type = "generic"
	var/keyboard_type = "generic_key"

obj/structure/interactive/computer/wall/Initialize()
	. = ..()
	setup_dir_offsets()
	dir = SOUTH

obj/structure/interactive/computer/wall/Finalize()
	. = ..()
	update_sprite()

obj/structure/interactive/computer/wall/update_overlays()

	. = ..()

	if(computer_type && on)
		var/image/I2 = new/image(initial(icon),computer_type)
		I2.plane = PLANE_LIGHTING
		add_overlay(I2)


	if(keyboard_type)
		var/image/I3 = new/image(initial(icon),keyboard_type)
		I3.plane = PLANE_LIGHTING
		add_overlay(I3)

obj/structure/interactive/computer/wall/dorms
	name = "宿舍登记电脑"
	desc = "登记宿舍。"
	desc_extended = "一台用于登记宿舍的电脑。"

	desired_light_range = 1
	desired_light_power = 1
	desired_light_color = "#00FF00"



/obj/structure/interactive/computer/wall/remote_flight
	name = "远程飞行电脑"
	var/obj/shuttle_controller/desired_shuttle_controller

/obj/structure/interactive/computer/wall/remote_flight/Finalize()
	desired_shuttle_controller = locate(desired_shuttle_controller) in world
	return ..()

/obj/structure/interactive/computer/wall/remote_flight/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	if(desired_shuttle_controller.time_restricted && !SSgamemode.active_gamemode.allow_launch)
		activator.to_chat(span("warning","[desired_shuttle_controller.name]尚未准备好起飞！"))
		return FALSE

	var/list/launch_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
	var/selection = input("确定要让[desired_shuttle_controller.name]起飞吗？","穿梭机控制","取消") as null|anything in launch_choices
	selection = launch_choices[selection]

	if(selection == "Yes")
		if(desired_shuttle_controller.state == SHUTTLE_STATE_LANDED)
			desired_shuttle_controller.state = SHUTTLE_STATE_WAITING
			desired_shuttle_controller.time = 0
			activator.visible_message(span("notice","[activator.name]通过[src.name]安排穿梭机起飞。"),span("notice","你通过[src.name]安排穿梭机起飞。"))
		else
			src.do_say("警告：穿梭机已在航行中。") //TODO: Make this more verbose.
	else
		activator.to_chat(span("notice","你决定不让[desired_shuttle_controller.name]起飞。"))

	return TRUE

/obj/structure/interactive/computer/wall/flight
	name = "飞行控制台"
	desc = "哔哔啵啵。"
	desc_extended = "用于操控设备。这台控制台用于控制穿梭机。"

/obj/structure/interactive/computer/wall/flight/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT
	INTERACT_DELAY(5)

	var/obj/shuttle_controller/SC = locate() in get_area(src)

	if(!SC)
		activator.to_chat(span("warning","错误：未找到穿梭机控制器！"))
		return FALSE

	if(SC.time_restricted && !SSgamemode.active_gamemode.allow_launch)
		activator.to_chat(span("warning","穿梭机尚未准备好起飞！"))
		return FALSE

	var/list/launch_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
	var/selection = input("确定要让这艘穿梭机起飞吗？","穿梭机控制","取消") in launch_choices
	selection = launch_choices[selection]

	if(selection == "Yes")
		if(SC.state == SHUTTLE_STATE_LANDED)
			SC.state = SHUTTLE_STATE_WAITING
			SC.time = 0
			activator.visible_message(span("notice","[activator.name]通过[src.name]安排穿梭机起飞。"),span("notice","你通过[src.name]安排穿梭机起飞。"))
		else
			src.do_say("警告：穿梭机已在航行中。") //TODO: Make this more verbose.
	else
		activator.to_chat(span("notice","你决定不让[SC.name]起飞。"))

	return TRUE
