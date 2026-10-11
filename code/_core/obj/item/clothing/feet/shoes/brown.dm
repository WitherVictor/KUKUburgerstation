/obj/item/clothing/feet/shoes/brown
	name = "右脚皮鞋"
	desc = "保护双脚免遭烟头烫伤。"
	desc_extended = "昂贵的棕色皮鞋，很适合侦探。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	icon = 'icons/obj/item/clothing/shoes/brown.dmi'

	armor = /armor/cloth/hard

	size = SIZE_1


	value = 15

/obj/item/clothing/feet/shoes/brown/left
	name = "左脚皮鞋"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
