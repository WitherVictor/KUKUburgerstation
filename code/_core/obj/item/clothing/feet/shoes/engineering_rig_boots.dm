/obj/item/clothing/feet/shoes/engineering
	name = "工程宇航服右靴"
	desc = "不含磁靴。"
	desc_extended = "工程硬式宇航服的配套靴子。别弄丢了！"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/engineering_rig_boots.dmi'

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_RIGHT
	protected_limbs = list(BODY_FOOT_RIGHT)

	armor = /armor/hardsuit/engineering

	size = SIZE_2

	value = 300

	speed_bonus = -0.1

	item_slot_layer = 3

	can_save = FALSE

/obj/item/clothing/feet/shoes/engineering/left
	name = "工程宇航服左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

	can_save = FALSE
