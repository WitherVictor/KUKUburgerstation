/obj/item/clothing/hands/gloves/tutorial
	name = "反魔法右臂缠带"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"

	desc = "戴着它挖掘代码里的隐藏内容。"
	desc_extended = "你大概不该拥有这东西。"

	icon = 'icons/obj/item/clothing/gloves/tutorial_gloves.dmi'

	defense_rating = list(
		ARCANE = 80
	)

	size = SIZE_0


	value = 120

/obj/item/clothing/hands/gloves/tutorial/left
	name = "反魔法左臂缠带"
	desc = "戴着它挖掘代码里的隐藏内容。"
	desc_extended = "你大概不该拥有这东西。"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)
