/obj/item/clothing/feet/shoes/tutorial
	name = "教程右靴"
	desc = "也许是删减内容？"
	desc_extended = "你大概不该拥有这东西。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/tutorial_shoes.dmi'

	defense_rating = list(
		BLADE = 40,
		BLUNT = 40,
		PIERCE = 40,
		LASER = -40,
		ARCANE = 40,
		COLD = 40
	)

	size = SIZE_2


	value = 100



/obj/item/clothing/feet/shoes/tutorial/left
	name = "教程左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

