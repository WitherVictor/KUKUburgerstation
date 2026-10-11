/obj/item/clothing/feet/shoes/miner
	name = "采矿右靴"
	desc = "适合真正热起来的时候。"
	desc_extended = "坚韧的棕色靴子，保护双脚免受灰烬侵害。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/boots_miner.dmi'

	armor = /armor/leather/mining

	size = SIZE_2


	value = 80

/obj/item/clothing/feet/shoes/miner/left
	name = "采矿左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
