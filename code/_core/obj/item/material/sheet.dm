/obj/item/material/sheet
	name = "板材"
	desc = "我是个错误。"
	icon = 'icons/obj/item/material.dmi'
	icon_state = "sheet"

	amount_max = 50
	amount_max_icon = 3

	material_multiplier = 1

	value = 0

/obj/item/material/sheet/update_icon()
	var/material/M = SSmaterials.all_materials[material_id]
	if(!M)
		name = "异常板材"
		log_error("Warning! [src.get_debug_name()] had incorrect material type \"[material_id]\"!")
	else
		name = "[M.display_name]板"
		desc = "只要你把它建好……"
		desc_extended = "一张由[M.display_name]制成的板材，可用于建造和制作物品。"
		icon_state = "[M.icon_state_sheet]_[min(CEILING(amount/10,1),amount_max_icon)]"
		color = M.color
	return ..()

/obj/item/material/sheet/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WIRECUTTER)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(5)
			var/obj/item/material/rod/R = new(get_turf(src))
			R.material_id = material_id
			R.amount = 4
			INITIALIZE(R)
			GENERATE(R)
			FINALIZE(R)
			activator.visible_message(span("notice","[activator.name]将[src.name]剪成了一些[R.name]。"),span("notice","你将[src.name]剪成了4根[R.name]。"))
			add_item_count(-1)
			R.Move(get_turf(I))
			return TRUE
	return ..()
