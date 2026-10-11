obj/structure/interactive/fence
	name = "围栏"
	desc = "禁止入内。"
	desc_extended = "脆弱的链式铁丝围栏。完好时能拦住移动的物体，但子弹仍可穿过。"
	icon = 'icons/obj/structure/fence.dmi'
	icon_state = "straight"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_NONE

	bullet_block_chance = 0

	pixel_y = 0

	health = /health/construction/

	health_base = 100

	density = TRUE

/obj/structure/interactive/fence/on_destruction(var/damage = TRUE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 4),/material/steel)
	. = ..()
	qdel(src)

obj/structure/interactive/fence/end
	icon_state = "end"

obj/structure/interactive/fence/post
	icon_state = "post"

obj/structure/interactive/fence/corner
	icon_state = "corner"

obj/structure/interactive/fence/door
	icon_state = "door_opened"
	collision_flags = FLAG_COLLISION_NONE
	collision_bullet_flags = FLAG_COLLISION_NONE
