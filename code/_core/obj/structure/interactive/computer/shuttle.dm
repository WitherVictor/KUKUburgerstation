obj/structure/interactive/computer/console/flight_control
	name = "飞行控制台"
	desc = "哔哔啵啵。"
	desc_extended = "用于操控设备。这台控制台用于控制穿梭机。"
	computer_type = "syndishuttle"
	keyboard_type = "syndie_key"

obj/structure/interactive/computer/console/flight_control/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_CHECK_OBJECT

	var/obj/shuttle_controller/SC = locate() in get_area(src)

	if(!SC)
		activator.to_chat(span("warning","错误：未找到穿梭机控制器！"))
		return FALSE

	if(SC.time_restricted && !SSgamemode.active_gamemode.allow_launch)
		activator.to_chat(span("warning","错误：穿梭机尚未准备好起飞！"))
		return FALSE

	var/obj/hud/button/map_background/M_background = locate() in activator.buttons
	if(M_background)
		activator.to_chat(span("warning","先关闭当前地图才能使用[src.name]！"))
		return FALSE

	M_background = new(activator,desired_shuttle_controller=SC)
	M_background.update_owner(activator)

obj/structure/interactive/computer/console/flight_control/Finalize()
	. = ..()
	var/obj/shuttle_controller/SC = locate() in get_area(src)
	if(SC)
		var/area/A = get_area(SC)
		name = "\improper [A.name] [initial(name)]"
