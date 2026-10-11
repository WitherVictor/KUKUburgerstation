/obj/item/clothing/mask/heretic
	name = "异端面具"
	icon = 'icons/obj/item/clothing/masks/cursed.dmi'
	desc = "你觉得它正凝视着你的灵魂……"
	desc_extended = "一副属于异端的面具，邪门到家了。"

	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	item_slot = SLOT_HEAD | SLOT_FACE
	worn_layer = LAYER_MOB_CLOTHING_ALL

	armor = /armor/dark/arcane/sanity

	size = SIZE_2

	mob_values_add = list(
		ATTRIBUTE_SOUL = 5,
		SKILL_PRAYER = 5
	)

	rarity = RARITY_MYTHICAL

	value = 1
