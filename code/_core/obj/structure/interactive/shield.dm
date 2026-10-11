/obj/structure/interactive/shield
	name = "护盾墙"
	desc = "科学！"
	desc = "一道神奇的特殊护盾墙，能阻止人员和空气从穿梭机中逸出，却允许带有标记的飞船和穿梭机通过。"
	icon = 'icons/obj/structure/shield_gen.dmi'
	icon_state = "shieldwall"

	collision_flags = FLAG_COLLISION_WALL
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

	collision_dir = NORTH | EAST | SOUTH | WEST

	plane = PLANE_WALL

	density = TRUE

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#0000FF"
