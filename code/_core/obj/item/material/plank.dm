/obj/item/material/plank
	name = "厚板"
	desc = "我是个错误。"
	icon = 'icons/obj/item/material.dmi'
	icon_state = "wood"

	amount_max = 50
	amount_max_icon = 3

	drop_sound = 'sound/items/drop/wooden.ogg'

	material_multiplier = 1

	value = 0

/obj/item/material/plank/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常厚板"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]厚板"
		desc = "只要你把它建好……"
		desc_extended = "一块由[M.display_name]制成的厚板，可用于建造和制作物品。"
		icon_state = "[M.icon_state_sheet]_[min(CEILING(amount/10,1),amount_max_icon)]"
		color = M.color
	return ..()
