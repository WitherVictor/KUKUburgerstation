/obj/item/material/pellets
	name = "弹丸"
	desc = "要是有把弹丸枪就好了。"
	icon = 'icons/obj/item/material.dmi'
	icon_state = "pellets"

	amount_max = 500 //They're small.
	amount_max_icon = 3

	value = 0

/obj/item/material/pellets/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常弹丸"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]弹丸"
		desc_extended = "由[M.display_name]制成的弹丸，可用于制作物品。"
		icon_state = "[M.icon_state_rod]_[min(CEILING(amount/10,1),amount_max_icon)]"
		color = M.color
	return ..()
