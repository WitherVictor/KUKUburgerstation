/obj/item/clothing/feet/shoes/runic
	name = "符文右靴"
	desc = "免费给护甲镶边，把精金装备交给我，你尽管放心。"
	desc_extended = "保护脚部的符文金属靴。如果你两只都有，就能保护双脚。"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	worn_layer = LAYER_MOB_CLOTHING_BELT

	icon = 'icons/obj/item/clothing/shoes/runic.dmi'

	armor = /armor/steel/runic

	size = SIZE_2


	value = 60

	speed_bonus = 0

	rarity = RARITY_MYTHICAL



/obj/item/clothing/feet/shoes/runic/left
	name = "符文左靴"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_FOOT
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_FOOT_LEFT)

