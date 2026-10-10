/obj/item/material/trash_cube
	name = "压缩垃圾块"
	desc = "我是个错误。"
	icon = 'icons/obj/item/material.dmi'
	icon_state = "trash_cube"

	amount_max = 50
	amount_max_icon = 3

	crafting_id = "trash_cube"

	material_multiplier = 1

	value = 0

/obj/item/material/trash_cube/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常压缩块"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]压缩块"
		desc_extended = "由[M.display_name]压成的方块，来自垃圾压缩机。"
		color = M.color
	return ..()
