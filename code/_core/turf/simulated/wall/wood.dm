/turf/simulated/wall/wood
	name = "木墙"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它。"
	icon = 'icons/turf/wall/wood.dmi'
	icon_state = "wall"
	corner_icons = TRUE
	corner_category = "wall"

	color = "#A07D5E"

	destruction_turf = /turf/simulated/floor/plating

	material_id = /material/wood
	health_base = 500

	window_blend = TRUE
	reinforced_blend = BLEND_MULTIPLY

/turf/simulated/wall/wood/on_destruction(var/damage = TRUE)

	var/obj/structure/interactive/construction/girder/G = new(src)
	G.material_id = material_id
	G.color = color
	INITIALIZE(G)
	FINALIZE(G)

	create_destruction(src,list(/obj/item/material/plank = 1),material_id)

	. = ..()


/turf/simulated/wall/wood/brown
	color = "#6F4533"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它。"

/turf/simulated/wall/wood/rich
	color = "#53331E"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它。它的品质似乎比大多数木墙更好。"

/turf/simulated/wall/wood/boat
	color = "#423022"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它。它是船体的一部分。"

/turf/simulated/wall/wood/boat/starting
	color = "#724C34"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它。它是船体的一部分。"

/turf/simulated/wall/wood/rev //for the rev base, more HP
	color = "#724C34"
	desc = "一堵木制的墙。"
	desc_extended = "一堵木制的墙，某个家伙造了它，可能是斯拉夫人。也可能不是。"
	health_base = 2000
