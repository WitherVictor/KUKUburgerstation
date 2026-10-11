/obj/item/clothing/feet/shoes/winter
	name = "冬季右靴"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/winter.dmi'

	armor = /armor/cloth/winter/hard

	protection_cold = list(
		BODY_FOOT_RIGHT = 3,
		BODY_LEG_RIGHT = 1
	)

	size = SIZE_2


	value = 70



/obj/item/clothing/feet/shoes/winter/left
	name = "冬季左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

	protection_cold = list(
		BODY_FOOT_LEFT = 3,
		BODY_LEG_LEFT = 1
	)
