/turf/simulated/floor/plating
	name = "钢制底板"

	icon = 'icons/turf/floor/plating.dmi'
	icon_state = "empty"

	footstep = /footstep/plating

	color = COLOR_STEEL
	material_id = /material/steel

	layer = LAYER_FLOOR_PLATING

	exposed = TRUE
	desc = "地板下方的底板。"
	desc_extended = "真正的地板下面还有一层底板。"

	health_base = 1000

	wet_floor_icon_state = "tile"

/turf/simulated/floor/plating/reinforced
	name = "加固底板"
	icon_state = "filled3"
	exposed = FALSE

	destruction_turf = /turf/simulated/floor/plating

	health_base = 2000

/turf/simulated/floor/plating/reinforced/dark
	color = COLOR_STEEL_DARK

/turf/simulated/floor/plating/snow
	name = "积雪底板"
	icon = 'icons/turf/floor/plating.dmi'
	icon_state = "empty"

/turf/simulated/floor/plating/shuttle
	name = "加固底板"
	icon = 'icons/turf/floor/spaceship.dmi'
	icon_state = "plating"
	plane = PLANE_SHUTTLE
	color = COLOR_STEEL

	destruction_turf = /turf/simulated/floor/plating


/turf/simulated/floor/plating/syndicate
	name = "深色钢制底板"
	color = COLOR_STEEL_DARK

/turf/simulated/floor/plating/syndicate/can_move_to(check_contents)
	for(var/obj/structure/interactive/door/vault/syndicate/S in src.contents) // Ghetto anti-heiro staff
		return FALSE
	. = ..()

/turf/simulated/floor/plating/solarian
	name = "太阳系钢制底板"
	color = "#66706C"



/turf/simulated/floor/plating/rev
	name = "着色钢制底板"
	color = "#626A3B"


/turf/simulated/floor/landing
	name = "铝制着陆平台"

	icon = 'icons/turf/floor/landing.dmi'
	icon_state = "1"

	footstep = /footstep/plating

	color = COLOR_GREY_LIGHT
	material_id = /material/aluminium

	layer = LAYER_FLOOR_PLATING

	desc = "地板下方的底板。"
	desc_extended = "真正的地板下面还有一层底板。"

	color = COLOR_GREY

/turf/simulated/floor/landing/is_safe()
	return FALSE

/turf/simulated/floor/landing/New(var/desired_loc)
	. = ..()
	icon_state = "[rand(1,10)]"

/turf/simulated/floor/landing/dark
	color = COLOR_GREY_DARK
