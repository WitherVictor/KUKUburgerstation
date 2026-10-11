/obj/item/clothing/feet/shoes/galosh
	name = "右脚胶靴"
	desc = "适合受够了滑倒的你。"
	desc_extended = "亮黄色的清洁工胶靴，采用适合湿滑地面的防滑设计。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/galosh.dmi'

	armor = /armor/leather/hard_boot

	size = SIZE_2


	value = 60

	speed_bonus = 0



/obj/item/clothing/feet/shoes/galosh/left
	name = "左脚胶靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

