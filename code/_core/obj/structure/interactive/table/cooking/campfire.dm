/obj/structure/table/cooking/bonfire
	name = "篝火"
	desc = "用来烹饪食物。"
	desc_extended = "将物品放在篝火上即可烹饪或加热。"
	icon = 'icons/obj/structure/bonfire.dmi'
	icon_state = "bonfire_warm"

	layer = LAYER_TABLE

	corner_category = null
	corner_icons = FALSE

	collision_flags = FLAG_COLLISION_NONE
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

	anchored = TRUE
	enabled = TRUE

	desired_light_power = 0.5
	desired_light_range = 4
	desired_light_color = "#FF7F00"
