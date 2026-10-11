/obj/item/clothing/overwear/coat/winter
	name = "冬季外套"
	desc = "冰山攀登者。"
	desc_extended = "能抵御寒冷，但会让你更怕热。"
	icon = 'icons/obj/item/clothing/suit/winter_coat.dmi'

	armor = /armor/cloth/winter

	protection_cold = list(
		BODY_TORSO = 5,
		BODY_ARM_LEFT = 4,
		BODY_ARM_RIGHT = 4,
		BODY_GROIN = 2
	)

	additional_clothing = list(/obj/item/clothing/head/hat/winter)

	size = SIZE_3


	value = 20

/obj/item/clothing/overwear/coat/winter/bomber
	name = "轰炸机飞行夹克"
	desc = "其实不能防炸弹。"
	desc_extended = "其实不能防炸弹。"
	icon = 'icons/obj/item/clothing/suit/bomberjacket.dmi'
	additional_clothing = null // no hood

	size = SIZE_3

	value = 120
