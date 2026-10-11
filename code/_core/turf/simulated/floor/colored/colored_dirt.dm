/turf/simulated/floor/colored/dirt
	name = "泥土"
	color = "#5B4128"
//	layer = LAYER_FLOOR_DIRT //can't +n LAYER_FLOOR_[whatever] for some reason
	layer = LAYER_FLOOR + 0.134
	corner_category = "dirt_soft"

	real_icon = 'icons/turf/floor/ash.dmi'
	real_icon_state = "floor"

	footstep = /footstep/asteroid

	destruction_turf = /turf/simulated/floor/colored/dirt/soil

	move_delay_modifier = 1.05

	material_id = /material/dirt/

	health_base = 300

/turf/simulated/floor/colored/dirt/path
	name = "土路"
	color = "#6B5027"
	layer = LAYER_FLOOR + 0.131
	corner_category = "dirt_path"

/turf/simulated/floor/colored/dirt/cave
	name = "泥土"
	color = "#493C2F"
	layer = LAYER_FLOOR + 0.130
	corner_category = "dirt_cave"

	destruction_turf = /turf/simulated/floor/cave_dirt/

/turf/simulated/floor/colored/dirt/snow
	name = "结霜泥土"
	color = "#D3C6BE" //"#C6B4A9"

/turf/simulated/floor/colored/dirt/jungle
	name = "丛林泥土"
	color = "#4C403A"

/turf/simulated/floor/colored/dirt/soil
	name = "表土"
	color = "#54311B"
	layer = LAYER_FLOOR + 0.132
	corner_category = "soil"

	destruction_turf = /turf/simulated/floor/colored/dirt/cave


/turf/simulated/floor/colored/dirt/soil/rich
	name = "施肥土壤"
	color = "#3D2414"
	layer = LAYER_FLOOR + 0.133
	corner_category = "soil_rich"

	destruction_turf = /turf/simulated/floor/colored/dirt/cave



/turf/simulated/floor/colored/dirt/cake
	name = "蛋糕"
	color = "#F779E6"
	corner_category = "cake"
