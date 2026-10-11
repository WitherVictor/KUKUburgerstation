/obj/structure/short_wall
	name = "矮墙"
	desc = "低到能看见另一侧。"
	desc = "齐胸高的墙，可以充当简易掩体。"
	icon = 'icons/obj/structure/wall.dmi'
	icon_state = "wall"

	corner_category = "small_wall"
	corner_icons = TRUE

	collision_flags = FLAG_COLLISION_BARICADE
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	plane = PLANE_WALL

	bullet_block_chance = 50

	density = TRUE

	health = /health/construction

	health_base = 400

/obj/structure/short_wall/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/sheet/ = 2),material_id)
	. = ..()
	qdel(src)

/obj/structure/short_wall/wood
	name = "木制矮墙"
	color = "#6F4533"
	corner_category = "wood_wall"
	material_id = /material/wood

/obj/structure/short_wall/wood/dark
	color = "#4C3323"

/obj/structure/short_wall/wood/starting
	color = "#60402C"

/obj/structure/short_wall/brick
	name = "石制矮墙"
	icon = 'icons/obj/structure/stone.dmi'
	corner_category = "stone_wall"
	material_id = /material/steel

/obj/structure/short_wall/sand
	name = "沙土矮墙"
	color = "#CC955F"
	corner_category = "sand_wall"
	material_id = /material/wood
