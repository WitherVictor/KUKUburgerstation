/obj/item/clothing/neck/sorcerer
	name = "术士披风"
	icon = 'icons/obj/item/clothing/suit/sorcerer_cape.dmi'
	desc = "术士的披风，常染成不同颜色来展示对某种魔法的熟练程度。"
	desc_extended = "披风上的颜色代表穿戴者对某种魔法的熟练程度。"

	item_slot = SLOT_NECK


	protected_limbs = list(BODY_TORSO)

	armor = /armor/dark/arcane/light

	size = SIZE_2


	worn_layer = LAYER_MOB_CLOTHING_NECK_OVER

	additional_clothing = list(/obj/item/clothing/head/hat/sorcerer_hood)

	dyeable = TRUE

	value = 200

	item_slot_layer = 3

	can_save = FALSE
