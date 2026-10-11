/obj/item/clothing/mask/godlike
	name = "神明面具"
	icon = 'icons/obj/item/clothing/masks/god.dmi'

	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	desc = "你怎么可能杀死神？"
	desc_extended = "戴上这副面具后，佩戴者会很难被杀死……前提是你只攻击其头部。"

	armor = /armor/reward

	size = SIZE_7

	pixel_x = -16
	pixel_y = -16

	worn_pixel_x = -16
	worn_pixel_y = -8

	worn_layer = LAYER_MOB_CLOTHING_ALL

	value = 20000
	value_burgerbux = 20000

	item_slot = SLOT_HEAD | SLOT_FACE

	rarity = RARITY_LEGENDARY


/obj/item/clothing/mask/godlike/get_base_value()
	. = ..()
	. += 25000
