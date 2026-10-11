/turf/simulated/floor/xeno/
	name = "树脂地板"

	icon = 'icons/turf/floor/icons.dmi'
	icon_state = "xeno"
	desc = "异形用的地板。"
	desc_extended = "不，你不能把树脂地板当烟抽。"

	real_icon = 'icons/turf/floor/resin_1.dmi'
	real_icon_state = "floor"

	corner_icons = TRUE
	corner_category = "xeno"

	footstep = /footstep/resin

	var/glow = FALSE

	layer = LAYER_FLOOR_DECAL

	destruction_turf = /turf/simulated/floor/cave_dirt/

	map_color = "#937EB5"

	health_base = 300

/turf/simulated/floor/xeno/Initialize()
	if(prob(5))
		real_icon = 'icons/turf/floor/resin_4.dmi'
		glow = TRUE
	else
		real_icon = pick('icons/turf/floor/resin_1.dmi','icons/turf/floor/resin_2.dmi','icons/turf/floor/resin_3.dmi')
	if(glow)
		set_light(VIEW_RANGE*0.5,0.25,"#A49EFF")

	. = ..()

