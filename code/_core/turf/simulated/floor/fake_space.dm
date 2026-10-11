/turf/simulated/floor/fake_space
	name = "太空"
	icon = 'icons/turf/space/space.dmi'
	icon_state = "1"
	opacity = 0
	var/generate = TRUE
	plane = PLANE_SPACE

/turf/simulated/floor/fake_space/New(var/desired_loc)
	icon_state = "space"
	return ..()
