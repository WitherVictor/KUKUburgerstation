/obj/item/clothing/hands/gloves/runic
	name = "符文右手套"
	icon = 'icons/obj/item/clothing/gloves/runic.dmi'
	desc = "金币翻倍啦！"
	desc_extended = "一只很不错的手套。别把另一只弄丢了！"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	armor = /armor/steel/runic

	protection_cold = list(
		BODY_HAND_RIGHT = 1
	)

	size = SIZE_1

	value = 800

	rarity = RARITY_MYTHICAL

/obj/item/clothing/hands/gloves/runic/left
	name = "符文左手套"

	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 1
	)
