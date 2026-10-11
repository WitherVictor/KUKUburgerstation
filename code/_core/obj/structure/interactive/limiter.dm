/obj/structure/interactive/limiter/
	name = "传送带限流器"
	desc = "嘶——。"
	desc_extended = "一种特殊装置，将传送带单格上的物品数量限制为一个。"
	icon = 'icons/obj/structure/conveyor.dmi'
	icon_state = "limiter"

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC
	collision_dir = 0x0

/obj/structure/interactive/limiter/Initialize()

	if(.)
		collision_dir = dir

	return ..()
