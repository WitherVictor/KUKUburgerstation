/turf/simulated/wall/cult
	name = "邪教墙壁"
	desc = "阴森。"
	desc_extended = "一堵用奇异符文金属制成的墙，光是看着它就让你心神不宁。"
	icon = 'icons/turf/wall/cult.dmi'
	icon_state = "wall"
	corner_category = "cult_wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/basalt

	map_color = "#600000"

	health_base = 1500

/turf/simulated/wall/cult/New()
	..()
	if(prob(5))
		new/obj/effect/cult_decor/wall(src)
