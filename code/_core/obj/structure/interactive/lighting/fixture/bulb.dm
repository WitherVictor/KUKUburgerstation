/obj/structure/interactive/lighting/fixture/bulb
	name = "灯泡灯具"
	desc = "已在太空站附近检测到电磁风暴。请检查所有设备是否存在过载风险。"
	desc_extended = "用于照亮周围区域。"

	icon = 'icons/obj/structure/light_bulb.dmi'

	color = COLOR_LIGHT_BULB

	desired_light_power = 0.5
	desired_light_range = 5
	desired_light_color = null //Set in update_icon
	desired_light_angle = LIGHT_OMNI

	dir_offset = 2

/obj/structure/interactive/lighting/fixture/bulb/Initialize()
	. = ..()
	try_attach_to(turn(src.dir,180))

/obj/structure/interactive/lighting/fixture/bulb/green
	color = "#1ADB1A"

/obj/structure/interactive/lighting/fixture/bulb/red
	color = "#DB1A1A"
