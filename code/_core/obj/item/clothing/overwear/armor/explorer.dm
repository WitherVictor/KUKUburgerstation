/obj/item/clothing/overwear/armor/explorer_suit
	name = "探索者护甲"
	desc = "货运部，我们需要钻石！"
	desc_extended = "矿工穿着的防护甲，用来抵御巨型生物。附带兜帽，穿戴后空手点击护甲即可将其戴上或放下。"
	icon = 'icons/obj/item/clothing/suit/explorer_suit.dmi'
	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT


	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_HAND_LEFT,BODY_HAND_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT)

	armor = /armor/leather/mining

	additional_clothing = list(
		/obj/item/clothing/head/helmet/full/explorer
	)

	size = SIZE_6

	value = 100

	rarity = RARITY_UNCOMMON
