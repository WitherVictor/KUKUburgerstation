/turf/simulated/floor/carpet
	name = "地毯"
	icon = 'icons/turf/floor/carpet.dmi'
	desc = "漂亮的地毯地板。"
	icon_state = "floor"
	corner_icons = TRUE
	corner_category = "carpet"
	desc = "铺着地毯的地板。"
	desc_extended = "设计棒极了的地毯，简直毫无瑕疵。"

	footstep = /footstep/carpet

	destruction_turf = /turf/simulated/floor/plating

	exposed = FALSE

	map_color = COLOR_RED

	plane = PLANE_JUNK
	layer = -1000

/turf/simulated/floor/carpet/office
	name = "办公室地毯"
	icon = 'icons/turf/floor/carpet_office.dmi'
	desc = "办公室的地板。"
	desc_extended = "单调的办公室地板；也许隐约有股尿味，也许没有。"
	icon_state = "1"

/turf/simulated/floor/carpet/office/New(var/desired_loc)
	. = ..()
	icon_state = "[rand(1,4)]"
