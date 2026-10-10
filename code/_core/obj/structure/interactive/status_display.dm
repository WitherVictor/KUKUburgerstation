

/proc/set_status_display(var/status_id,var/message)

	if(!length(SSobj.status_displays))
		return FALSE

	if(!length(SSobj.status_displays[status_id]))
		return FALSE

	for(var/k in SSobj.status_displays[status_id])
		var/obj/structure/interactive/status_display/S = k
		S.set_text(message)

	return TRUE

/obj/structure/interactive/status_display
	name = "状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示相应的文本。"
	icon = 'icons/obj/structure/status_display.dmi'
	icon_state = "icon"

	var/screen_color = "#000000"
	var/frame_color = "#888888"

	plane = PLANE_MOVABLE

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#FFFFFF"

	plane = PLANE_WALL_ATTACHMENT

/obj/structure/interactive/status_display/Initialize()
	. = ..()
	try_attach_to()

/obj/structure/interactive/status_display/update_icon()
	icon_state = null
	return ..()

/obj/structure/interactive/status_display/update_underlays()
	. = ..()
	var/image/I = new(icon,"screen")
	I.color = screen_color
	underlays += I

/obj/structure/interactive/status_display/update_overlays()
	. = ..()
	var/image/I1 = new(icon,"frame")
	I1.color = frame_color
	add_overlay(I1)
	var/image/I2 = new(icon,"reflection")
	add_overlay(I2)


/obj/structure/interactive/status_display/New(var/desired_loc)
	. = ..()
	update_sprite()
	set_text("你好")

/obj/structure/interactive/status_display/proc/set_text(var/desired_text)
	maptext = "<center valign='middle'>[desired_text]</center>"
	return TRUE

/obj/structure/interactive/status_display/local_display/

/obj/structure/interactive/status_display/global_display/
	var/status_id

/obj/structure/interactive/status_display/global_display/Initialize()
	if(status_id)
		if(!SSobj.status_displays[status_id])
			SSobj.status_displays[status_id] = list()
		SSobj.status_displays[status_id] += src
	return ..()

/obj/structure/interactive/status_display/global_display/PreDestroy()
	if(SSobj.status_displays[status_id])
		SSobj.status_displays[status_id] -= src
	. = ..()

/obj/structure/interactive/status_display/global_display/arrivals_01
	name = "抵达穿梭机一号状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示抵达穿梭机的状态。"
	status_id = "arrivals_01"

/obj/structure/interactive/status_display/global_display/arrivals_02
	name = "抵达穿梭机二号状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示抵达穿梭机的状态。"
	status_id = "arrivals_02"


/obj/structure/interactive/status_display/global_display/cargo_inbound
	name = "货运到港状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示货运穿梭机的状态。"
	status_id = "cargo_inbound"

/obj/structure/interactive/status_display/global_display/cargo
	name = "货运状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示驶入的货运穿梭机的状态。"
	status_id = "cargo"

/obj/structure/interactive/status_display/global_display/round
	name = "任务状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示纳米传讯任务的状态。"
	frame_color = "#E5C14B"
	status_id = "mission"

/obj/structure/interactive/status_display/global_display/lz420_elevator
	name = "升降机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示升降机的状态。"
	status_id = "lz420_elevator"

/obj/structure/interactive/status_display/global_display/drop_pod
	name = "空降舱状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示下一批空降舱的发射状态。"
	frame_color = "#2E00AF"
	status_id = "drop_pod"


/obj/structure/interactive/status_display/global_display/alpha
	name = "阿尔法穿梭机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示阿尔法穿梭机的下次起飞状态。"
	status_id = "alpha"

/obj/structure/interactive/status_display/global_display/bravo
	name = "布拉沃穿梭机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示布拉沃穿梭机的下次起飞状态。"
	status_id = "bravo"

/obj/structure/interactive/status_display/global_display/charlie
	name = "查理穿梭机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示查理穿梭机的下次起飞状态。"
	status_id = "charlie"

/obj/structure/interactive/status_display/global_display/delta
	name = "德尔塔穿梭机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示德尔塔穿梭机的下次起飞状态。"
	status_id = "delta"

/obj/structure/interactive/status_display/global_display/debug
	name = "调试穿梭机状态显示屏"
	desc = "美国爆菊"
	desc_extended = "根据设定显示文本。这块屏幕显示调试穿梭机的下次起飞状态。"
	status_id = "debug"
