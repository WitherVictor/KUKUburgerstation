/turf/simulated/wall/hierophant
	name = "大祭司墙壁"
	desc = "紫得很。"
	desc_extended = "一堵用未知金属制成的墙，紫色光纹在表面荡漾。"
	icon = 'icons/turf/wall/hierophant.dmi'
	icon_state = "wall"
	corner_icons = TRUE
	corner_category = "hierophant"

	desired_light_frequency = 1
	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#AA00DC"
	map_color = "#AA00DC"

/turf/simulated/wall/hierophant/Finalize()
	. = ..()
	src.set_light(4,0.25,"#FFFFFF")
