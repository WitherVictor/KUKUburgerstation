/obj/structure/table/cooking/grill
	name = "电烤架"
	desc = "用来烹饪食物。"
	desc_extended = "将物品放在烤架上即可烹饪或加热。空手点击可开关烤架。"
	icon = 'icons/obj/structure/table/grill.dmi'
	icon_state = "grill"

	layer = LAYER_TABLE

	corner_category = "table_reinforced"
	corner_icons = FALSE

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

	anchored = TRUE

	pixel_y = 3

/obj/structure/table/cooking/grill/update_icon()
	. = ..()

	icon = initial(icon)
	icon_state = initial(icon_state)

	if(enabled)
		icon_state = "[icon_state]_on"
	else
		icon_state = "[icon_state]_off"
	flick(src,"[icon_state]_anim")
