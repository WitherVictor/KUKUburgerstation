/obj/item/clothing/feet/shoes/sandal
	name = "右脚凉鞋"
	desc = "任何情况下都不许配袜子穿。"
	desc_extended = "还能提供魔法防护。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	icon = 'icons/obj/item/clothing/shoes/sandal.dmi'

	armor = /armor/cloth/arcane

	size = SIZE_1

	value = 20

	speed_bonus = 0



/obj/item/clothing/feet/shoes/sandal/left
	name = "左脚凉鞋"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)
