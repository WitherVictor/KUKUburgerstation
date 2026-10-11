/obj/item/clothing/feet/shoes/black_boots
	name = "黑色右靴"
	desc = "适合你想让场面稍微热闹一点的时候。"
	desc_extended = "一只黑色战斗靴，保护双脚免受弹片伤害。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/boots.dmi'

	armor = /armor/leather/hard_boot

	size = SIZE_2


	value = 60

	speed_bonus = 0



/obj/item/clothing/feet/shoes/black_boots/left
	name = "黑色左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

