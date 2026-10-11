/obj/item/clothing/hands/gloves/colored/gladiator
	name = "角斗士右护手"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	desc = "戴着它跟人搏斗。"
	desc_extended = "用皮革制成的长手套，用来抵挡捅刺。"
	icon = 'icons/obj/item/clothing/gloves/gladiator.dmi'
	color = "#FFFFFF"

	protected_limbs = list(BODY_ARM_RIGHT,BODY_HAND_RIGHT)

	armor = /armor/brass/gloves

	size = SIZE_3

	value = 20

/obj/item/clothing/hands/gloves/colored/gladiator/left
	name = "角斗士左护手"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_ARM_LEFT,BODY_HAND_LEFT)


/obj/item/clothing/hands/gloves/colored/gladiator/gold
	color = COLOR_GOLD


/obj/item/clothing/hands/gloves/colored/gladiator/gold/left
	name = "角斗士左护手"
	desc = "戴着它跟人搏斗。"
	desc_extended = "用皮革制成的长手套，用来抵挡捅刺。"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_ARM_LEFT,BODY_HAND_LEFT)

	color = COLOR_GOLD
