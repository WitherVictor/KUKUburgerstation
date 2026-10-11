/obj/item/clothing/hands/gloves/engineering
	name = "工程宇航服右手套"
	desc = "戴着它去太空漫步。"
	desc_extended = "工程硬式宇航服的配套手套。别弄丢了！"
	icon = 'icons/obj/item/clothing/gloves/engineering_rig_gloves.dmi'

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	armor = /armor/hardsuit/engineering

	protection_cold = list(
		BODY_HAND_RIGHT = 2
	)

	size = SIZE_1

	value = 230

	can_save = FALSE

	item_slot_layer = 3

/obj/item/clothing/hands/gloves/engineering/left
	name = "工程宇航服左手套"
	desc = "戴着它去太空漫步。"
	desc_extended = "工程硬式宇航服的配套手套。别弄丢了！"

	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 2
	)

	can_save = FALSE
