obj/structure/interactive/atmospherics


obj/structure/interactive/atmospherics/vent
	name = "通风口"
	desc = "供应氧气，或者呛人的空气。"
	desc_extended = "装饰物，目前没有实际用途。"
	icon = 'icons/obj/structure/atmos.dmi'
	icon_state = "vent_1"

	desired_light_range = 2
	desired_light_power = 1
	desired_light_color = "#64BEB5"

	plane = PLANE_FLOOR_ATTACHMENT
	layer = LAYER_FLOOR_VENT

obj/structure/interactive/atmospherics/scrubber
	name = "气体过滤器"
	desc = "第四定律：氧气对人类有害。"
	desc_extended = "装饰物，目前没有实际用途。"
	icon = 'icons/obj/structure/atmos.dmi'
	icon_state = "scrubber_1"

	desired_light_range = 2
	desired_light_power = 1
	desired_light_color = "#BE6864"

	plane = PLANE_FLOOR_ATTACHMENT
	layer = LAYER_FLOOR_VENT

obj/structure/interactive/atmospherics/air_alarm
	name = "空气警报器"
	desc = "“紧急时拉下”，所以一直拉就对了。"
	desc_extended = "装饰物，目前没有实际用途。"
	icon = 'icons/obj/structure/atmos.dmi'
	icon_state = "air_alarm"

	desired_light_range = 2
	desired_light_power = 1
	desired_light_color = "#0094FF"

	plane = PLANE_MOVABLE

obj/structure/interactive/atmospherics/air_alarm/Initialize(var/desired_loc)
	try_attach_to()
	setup_dir_offsets()
	return ..()

obj/structure/interactive/atmospherics/air_alarm/PostInitialize()
	. = ..()
	update_sprite()


obj/structure/interactive/atmospherics/air_alarm/update_overlays()
	. = ..()
	var/image/I = new /image(initial(icon),"air_alarm_light")
	I.plane = PLANE_LIGHTING_EFFECT
	add_overlay(I)


obj/structure/interactive/atmospherics/fan
	name = "风扇"
	desc = "第四定律：氧气对人类有害。"
	desc_extended = "装饰物，目前没有实际用途。"
	icon = 'icons/obj/structure/atmos.dmi'
	icon_state = "fan_tiny"

	plane = PLANE_FLOOR
