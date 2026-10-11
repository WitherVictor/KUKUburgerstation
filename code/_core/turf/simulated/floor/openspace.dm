/atom/movable/openspace_backdrop
	icon = 'icons/turf/floor/openspace.dmi'
	icon_state = "openspace_background"
	anchored = 2

/turf/simulated/openspace
	name = "孔洞"
	desc = "掉进兔子洞啦！"
	desc_extended = "通往下层的孔洞，小心摔伤。"
	icon = 'icons/turf/floor/openspace.dmi'
	icon_state = "openspace_background"

	destruction_turf = null

	density = TRUE
	density_down = FALSE

	plane = PLANE_FLOOR_BELOW

	color = COLOR_GREY

/turf/simulated/openspace/Finalize()
	. = ..()
	var/turf/T = locate(x,y,z-1)
	if(T) vis_contents += T

/turf/simulated/openspace/pre_change()
	. = ..()
	vis_contents.Cut()
