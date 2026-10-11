/turf/simulated/floor/cult
	name = "邪教地板"
	icon = 'icons/turf/floor/cult.dmi'
	desc = "一块秘法地板。"
	desc_extended = "这种地板上的图案令人着迷，不过血之邪教的胡闹常常破坏这种氛围。"
	icon_state = "floor1"

	footstep = /footstep/tile

	destruction_turf = /turf/simulated/floor/basalt/

	map_color = COLOR_RED_DARK

	health_base = 500

	wet_floor_icon_state = "tile"

/turf/simulated/floor/cult/New(var/desired_loc)

	icon_state = "floor[rand(1,4)]"

	if(prob(5))
		new/obj/effect/cult_decor/floor(src)

	..()

/turf/simulated/floor/cult/darker
	color = "#AAAAAA"

