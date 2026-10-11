/obj/item/clothing/mask/mummy
	name = "绷带面罩"
	desc = "实际上不能用来止血。"
	desc_extended = "用布条缠成的面罩。神秘人物、木乃伊和倒了大霉的人都爱这身标志性打扮。"
	icon = 'icons/obj/item/clothing/masks/mummy.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD

	armor = /armor/dark/mummy

	value = 1

	worn_layer = LAYER_MOB_CLOTHING_MASK

	item_slot = SLOT_FACE

	hidden_organs = list(
		BODY_HAIR_HEAD = TRUE,
		BODY_HAIR_FACE = TRUE
	)
