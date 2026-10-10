/obj/item/enchanting_chalk
	name = "附魔粉笔"
	desc = "就像回到了幼儿园！"
	desc_extended = "用这支魔法粉笔绘制附魔符文。使用次数有限。"
	icon = 'icons/obj/item/drawing_chalk.dmi'
	icon_state = "inventory"

	value = 700

	var/uses_left = 7


/obj/item/enchanting_chalk/update_icon()

	icon_state = "[initial(icon_state)]_[uses_left]"

	return ..()

/obj/item/enchanting_chalk/get_base_value()
	. = ..()
	. *= uses_left / initial(uses_left)
	. = CEILING(.,1)

/obj/item/enchanting_chalk/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(object.plane >= PLANE_HUD)
		return ..()

	if(istype(object,/obj/structure/interactive/enchantment_circle/))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		activator.visible_message(span("warning","[activator.name]用[src.name]抹去了[object.name]。"),span("notice","你用[src.name]抹去了[object.name]。"))
		qdel(object)
		return TRUE

	var/turf/T = get_turf(object)

	if(T)

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)

		if(activator.loc != T)
			activator.to_chat(span("warning","你必须在脚下绘制符文！"))
			return TRUE

		for(var/k in DIRECTIONS_ALL)
			var/turf/T2 = get_step(T,k)
			var/atom/occupied = T2.is_occupied(PLANE_FLOOR_ATTACHMENT)
			if(occupied)
				activator.to_chat(span("warning","这里无法绘制附魔法阵，[occupied.name]挡住了位置！"))
				return TRUE

		var/obj/structure/interactive/enchantment_circle/EC = new(T)
		INITIALIZE(EC)
		GENERATE(EC)
		FINALIZE(EC)
		activator.visible_message(span("notice","[activator.name]用[src.name]轻触[T.name]，神奇地画出了[EC.name]。"),span("notice","你用[src.name]轻触[T.name]，神奇地画出了[EC.name]。"))
		uses_left--
		if(uses_left <= 0)
			qdel(src)
		else
			update_sprite()
			value = get_base_value()

		return TRUE

	return ..()

