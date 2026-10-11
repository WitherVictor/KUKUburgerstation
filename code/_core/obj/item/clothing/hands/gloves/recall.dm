/obj/item/clothing/hands/gloves/recall
	name = "绑架者传送回归手套"
	desc = "看我凭空消失！"
	desc_extended = "极其先进的技术接口设备。那些该死的外星人就是靠它传送的。真希望你知道怎么用。"
	icon = 'icons/obj/item/clothing/gloves/recall.dmi'

	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)

	can_save = FALSE

	rarity = RARITY_MYTHICAL

	value = 1
