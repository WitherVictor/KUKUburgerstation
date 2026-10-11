/obj/structure/table/cooking/barbecue
	name = "便携电烧烤炉"
	desc = "老天，我只是想烤点东西。"
	desc_extended = "将物品放在烧烤炉上即可烹饪或加热。空手点击可开关烧烤炉。"
	icon = 'icons/obj/structure/bbq.dmi'
	icon_state = "bbq"
	anchored = FALSE
	desired_light_range = VIEW_RANGE*0.2
	desired_light_power = 1
	desired_light_color = "#B82E00"
	desired_light_angle = LIGHT_OMNI
	corner_category = null

	collision_flags = FLAG_COLLISION_WALKING
	collision_bullet_flags = FLAG_COLLISION_BULLET_INORGANIC

	bullet_block_chance = 50

/obj/structure/table/cooking/barbecue/update_atom_light()
	if(enabled)
		set_light(desired_light_range, desired_light_power, desired_light_color,desired_light_angle)
	else
		set_light(FALSE)
	return TRUE

/obj/structure/table/cooking/barbecue/update_icon()
	. = ..()

	icon = initial(icon)
	icon_state = initial(icon_state)

	if(enabled)
		icon_state = "[icon_state]_on"
	else
		icon_state = "[icon_state]_off"

/obj/structure/table/cooking/barbecue/anchored
	anchored = 1
