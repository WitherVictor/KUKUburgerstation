/obj/hud/inventory/dynamic/bank
	name = "银行储物格"
	icon_state = "square_round"

	max_size = SIZE_10
	max_slots = 1

	drag_to_take = FALSE

	flags_hud = FLAG_HUD_INVENTORY | FLAG_HUD_SPECIAL | FLAG_HUD_CONTAINER

	should_add_to_advanced = FALSE

	priority = -101

/obj/hud/inventory/dynamic/bank/can_slot_object(var/obj/item/I,var/messages = FALSE,var/bypass=FALSE)

	if(!bypass)
		if(length(I.inventories) && I.size >= SIZE_2)
			if(messages) owner.to_chat(span("warning","银行不允许存放大型容器。"))
			return FALSE

		if(!I.can_save)
			if(messages) owner.to_chat(span("warning","无法存放这类物品。"))
			return FALSE

		if(I.contraband)
			if(messages) owner.to_chat(span("warning","银行拒绝存放违禁品。"))
			return FALSE

	. = ..()
