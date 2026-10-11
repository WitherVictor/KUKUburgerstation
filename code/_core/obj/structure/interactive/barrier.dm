/obj/structure/interactive/barrier
	name = "充气屏障"
	desc_extended = "占据整格的屏障，可以阻挡来自各个方向的大多数弹体。非常结实。"
	icon = 'icons/obj/structure/barricade.dmi'
	icon_state = "full_tile"

	plane = PLANE_MOVABLE
	collision_flags = FLAG_COLLISION_BARICADE
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC
	density = TRUE

	collision_dir = NORTH | EAST | SOUTH | WEST

	bullet_block_chance = 100

	health = /health/construction/barricade

	health_base = 800

/obj/structure/interactive/barrier/on_destruction(var/damage = TRUE)
	. = ..()
	qdel(src)
