/obj/item/clothing/overwear/coat/firefighter
	name = "消防服"
	desc = "用防火来对付火。"
	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT,BODY_HAND_LEFT,BODY_HAND_RIGHT,BODY_LEG_LEFT,BODY_LEG_RIGHT,BODY_FOOT_LEFT,BODY_FOOT_RIGHT)
	desc_extended = "一套十分耐用的隔热消防服，用于抵御消防作业中的各种危险。"
	icon = 'icons/obj/item/clothing/suit/fire.dmi'

	hidden_organs = list(
		BODY_TORSO = TRUE,
		BODY_GROIN = TRUE,
		BODY_ARM_RIGHT = TRUE,
		BODY_ARM_LEFT = TRUE,
		BODY_HAND_RIGHT = TRUE,
		BODY_HAND_LEFT = TRUE,
		BODY_LEG_RIGHT = TRUE,
		BODY_LEG_LEFT = TRUE,
		BODY_FOOT_RIGHT = TRUE,
		BODY_FOOT_LEFT = TRUE
	)

	armor = /armor/leather/fireproof

	size = SIZE_5

	value = 100
