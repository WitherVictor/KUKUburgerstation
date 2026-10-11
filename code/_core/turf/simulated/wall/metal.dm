/turf/simulated/wall/metal
	name = "钢墙"
	desc = "有本事就打穿它。"
	desc_extended = "一堵用实心钢材制成的墙，相当坚固。"
	icon = 'icons/turf/wall/metal/nanotrasen.dmi'
	icon_state = "wall"
	corner_icons = TRUE
	corner_category = "wall"

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL
	material_id = /material/steel
	health_base = 1000

	window_blend = TRUE
	reinforced_blend = BLEND_MULTIPLY

/turf/simulated/wall/metal/on_destruction(var/damage = TRUE)

	var/obj/structure/interactive/construction/girder/G = new(src)
	G.material_id = material_id
	G.color = color
	INITIALIZE(G)
	FINALIZE(G)

	create_destruction(src,list(/obj/item/material/sheet/ = 1),material_id)

	. = ..()

/*
/turf/simulated/wall/metal/rusted
	name = "metal wall"
	icon = 'icons/turf/wall/metal_rusty.dmi'
	icon_state = "wall"
	corner_icons = TRUE
*/

/turf/simulated/wall/metal/crew
	color = "#3D4A4A"

/turf/simulated/wall/metal/reinforced
	name = "塑钢加固钢墙"
	desc = "有本事就打穿它。"
	desc_extended = "一堵用塑钢加固的钢墙，非常坚固。"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = COLOR_PLASTEEL
	health_base = 3000

/turf/simulated/wall/metal/reinforced/hull
	name = "精金碳加固塑钢墙"
	desc = "有本事就打穿它。"
	desc_extended = "一堵用精金碳复合材料加固的塑钢墙，极其坚固。"
	reinforced_material_id = /material/adamantium_carbon
	color = "#48482B"
	reinforced_color = COLOR_ADAMANITUM_CARBON
	destruction_turf = null

/*
/turf/simulated/wall/metal/reinforced/rusted
	name = "reinforced metal wall"
	icon = 'icons/turf/wall/metal_reinforced_rusty.dmi'
	icon_state = "wall"
	corner_icons = TRUE
*/

/*
/turf/simulated/wall/metal/colored
	name = "metal wall"
	icon = 'icons/turf/wall/composite_solid.dmi'

/turf/simulated/wall/metal/colored/grey
	color = "#727272"


/turf/simulated/wall/metal/colored/cargo
	color = COLOR_CARGO
*/


/turf/simulated/wall/metal/syndicate
	name = "深色钢墙"
	icon = 'icons/turf/wall/metal/syndicate.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL_DARK
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/syndicate/reinforced
	name = "塑钢加固深色钢墙"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	destruction_turf = null

/turf/simulated/wall/metal/syndicate/reinforced/shuttle
	plane = PLANE_SHUTTLE

/turf/simulated/wall/metal/rev
	name = "着色钢墙"
	icon = 'icons/turf/wall/metal/rev.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = "#626A3B"
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/rev/reinforced
	name = "塑钢加固着色钢墙"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	health_base = 3000


/turf/simulated/wall/metal/shuttle
	name = "穿梭机级钢墙"
	desc = "做好着陆准备。"
	desc_extended = "穿梭机的墙壁。"
	icon = 'icons/turf/wall/metal/shuttle_new.dmi'
	icon_state = "wall"

	plane = PLANE_SHUTTLE

	color = "#FFFFFF"

/turf/simulated/wall/metal/shuttle/off_white
	color = "#A2A6AA"

/turf/simulated/wall/metal/shuttle/dark
	color = COLOR_GREY_DARK
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"

/turf/simulated/wall/metal/circuit
	name = "科技钢墙"
	icon = 'icons/turf/wall/metal/circuit.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating

	color = COLOR_STEEL
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/circuit/reinforced
	name = "加固科技钢墙"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	destruction_turf = null

/turf/simulated/wall/metal/solarian
	name = "太阳系钢墙"
	icon = 'icons/turf/wall/metal/solarian.dmi'
	icon_state = "wall"
	corner_icons = TRUE

	destruction_turf = /turf/simulated/floor/plating/solarian

	color = "#83918C"
	material_id = /material/steel
	health_base = 1000

/turf/simulated/wall/metal/solarian/reinforced
	name = "塑钢加固太阳系钢墙"
	icon_state = "wall_ref"
	reinforced_material_id = /material/plasteel
	reinforced_color = "#FFFFFF"
	health_base = 3000

/turf/simulated/wall/metal/magic
	name = "魔法金属墙"
	color = "#8034B2"
	icon = 'icons/turf/wall/metal/magic.dmi'

/turf/simulated/wall/metal/magic/bananium
	name = "蕉金墙"
	color = "#FFFF00"
