/obj/item/material/shard
	name = "碎片"
	desc = "我是个错误。"
	icon = 'icons/obj/item/material.dmi'
	icon_state = "shard"

	amount_max = 1
	amount_max_icon = 1

	material_multiplier = 0.5

	value = 0

/obj/item/material/shard/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常碎片"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]碎片"
		desc_extended = "一块[M.display_name]碎片。"
		color = M.color
		icon_state = "[initial(icon_state)]_[rand(1,3)]"
	return ..()
