/obj/item/trash
	name = "垃圾"
	desc = "没用了。"
	desc_extended = "包装纸、烟头，以及其他只能回收的残余物。请妥善处理。"
	icon = 'icons/obj/item/trash.dmi'
	icon_state = "candy"
	value = 0

	weight = 0.25

	rarity = RARITY_BROKEN

/obj/item/trash/random/Generate()
	. = ..()
	var/list/states = icon_states(icon)
	icon_state = pick(states)

/obj/item/trash/raisins
	icon_state = "raisins"
	value = 1

/obj/item/trash/candy
	icon_state = "candy"
	value = 1

/obj/item/trash/chips
	icon_state = "chips"
	value = 1

/obj/item/trash/cheese_chips
	icon_state = "cheese_chips"
	value = 1

/obj/item/trash/jerky
	icon_state = "jerky"
	value = 1

/obj/item/trash/syndicate
	icon_state = "syndicate"
	value = 1

/obj/item/trash/butt
	icon_state = "butt"
	value = 1
