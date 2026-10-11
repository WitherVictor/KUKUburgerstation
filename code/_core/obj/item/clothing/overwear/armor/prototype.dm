/obj/item/clothing/overwear/armor/prototype
	name = "原型碳纤维护甲"
	desc = "这对所有人都是个秘密。"
	desc_extended = "用硬化碳纤维制成的护甲，目前正由纳米传讯科研部门进行试验。"
	icon = 'icons/obj/item/clothing/suit/captain_suit.dmi'

	worn_layer = LAYER_MOB_CLOTHING_HARDSUIT



	defense_rating = list(
		BLADE = 60,
		BLUNT = 60,
		PIERCE = 60,
		LASER = -60,
		ARCANE = -60,
		PAIN = 60
	)

	size = SIZE_6

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	value = 800
