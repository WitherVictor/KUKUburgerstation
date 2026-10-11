/obj/item/clothing/feet/shoes/workboot
	name = "钢头劳保右靴"
	desc = "重物经过，注意避让！"
	desc_extended = "适合繁重作业环境的结实靴子，保护双脚免遭掉落工具砸伤。"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/workboots.dmi'

	armor = /armor/leather/hard_boot

	size = SIZE_2

	value = 120



/obj/item/clothing/feet/shoes/workboot/left
	name = "钢头劳保左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
