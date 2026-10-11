/obj/item/clothing/hands/gloves/captain
	name = "站长右手套"
	desc = "戴上它，做个混蛋站长。"
	desc_extended = "发给空间站站长的独一无二的华丽手套。别把另一只弄丢了！"
	icon = 'icons/obj/item/clothing/gloves/captain.dmi'

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	armor = /armor/military/medium/captain_gloves

	protection_cold = list(
		BODY_HAND_RIGHT = 1
	)

	size = SIZE_1

	value = 800

	contraband = TRUE

	rarity = RARITY_LEGENDARY

/obj/item/clothing/hands/gloves/captain/left
	name = "站长左手套"
	desc = "戴上它，做个混蛋站长。"
	desc_extended = "发给空间站站长的独一无二的华丽手套。别把另一只弄丢了！"

	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 1
	)
