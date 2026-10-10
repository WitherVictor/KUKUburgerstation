/obj/item/material/ingot
	name = "材料锭"
	desc = "我是个错误。"

	icon = 'icons/obj/item/material.dmi'
	icon_state = "ingot"

	amount_max = 50
	amount_max_icon = 6

	value = 0

/obj/item/material/ingot/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常材料锭"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]锭"
		desc_extended = "一块[M.display_name]锭，由原矿熔炼或合金加工而成。"
		icon_state = "[M.icon_state_ingot]_[min(CEILING(amount/10,1),amount_max_icon)]"
		color = M.color
	return ..()
