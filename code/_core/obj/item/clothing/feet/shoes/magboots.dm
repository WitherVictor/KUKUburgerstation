/obj/item/clothing/feet/shoes/magboot
	name = "右脚磁靴"
	desc = "防水。"
	desc_extended = "带磁性靴底的厚重靴子，可套在现有鞋子外。设计用于吸附地面，避免失去抓地力后飘入虚空。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/magboots.dmi'

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_RIGHT
	protected_limbs = list(BODY_FOOT_RIGHT)

	armor = /armor/hardsuit/mechanical

	size = SIZE_2

	value = 200

	speed_bonus = -0.2

	item_slot_layer = 3

/obj/item/clothing/feet/shoes/magboot/left
	name = "左脚磁靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)



