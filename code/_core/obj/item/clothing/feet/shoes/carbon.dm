/obj/item/clothing/feet/shoes/carbon_boot
	name = "碳纤维右靴"
	desc = "适合你真想把场面彻底炒热的时候。"
	desc_extended = "带有碳纤维防护层的高科技靴子。稍显笨重，但防护出色。"

	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/carbon.dmi'

	defense_rating = list(
		BLADE = 60,
		BLUNT = 60,
		PIERCE = 60,
		LASER = -60,
		ARCANE = -60,
		PAIN = 60
	)

	size = SIZE_2


	value = 150

	speed_bonus = 0



/obj/item/clothing/feet/shoes/carbon_boot/left
	name = "碳纤维左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

