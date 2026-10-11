/obj/item/clothing/mask/daddy
	name = "真父面具"
	icon = 'icons/obj/item/clothing/masks/daddy.dmi'

	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	desc = "怎么，还想怎样？"
	desc_extended = "刻画着某种父亲形象的巨大面具。戴上后能让你移动得更快。"

	armor = /armor/brass/belt

	size = SIZE_3
	weight = -10

	worn_layer = LAYER_MOB_CLOTHING_ALL

	value = 500

	hidden_organs = list(
		BODY_HEAD = TRUE,
		BODY_HAIR_HEAD = TRUE,
		BODY_HAIR_FACE = TRUE,
		BODY_EYES = TRUE
	)

	item_slot = SLOT_HEAD | SLOT_FACE

	rarity = RARITY_MYTHICAL
