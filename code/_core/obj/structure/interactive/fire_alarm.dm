/obj/structure/interactive/fire_alarm
	name = "火警报警器"
	desc = "‘紧急时拉动’，所以要一直拉个不停。"
	desc_extended = "装饰物，目前没有实际用途。"
	icon = 'icons/obj/structure/fire_alarm.dmi'
	icon_state = "fire_alarm"

	desired_light_range = 0.5
	desired_light_power = 1
	desired_light_color = "#00FF00"

	plane = PLANE_WALL_ATTACHMENT

/obj/structure/interactive/fire_alarm/Initialize()
	try_attach_to()
	setup_dir_offsets()
	return ..()
