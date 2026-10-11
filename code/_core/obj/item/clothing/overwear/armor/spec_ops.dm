/obj/item/clothing/overwear/armor/spec_ops
	name = "特种行动背心"
	desc = "轻巧耐用。"
	desc_extended = "采用凯夫拉与耐久布复合织物，只有最顶尖的战术行动人员才会使用。"

	icon = 'icons/obj/item/clothing/suit/stealth.dmi'

	size = SIZE_4

	armor = /armor/military/heavy

	protected_limbs = list(BODY_TORSO,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	dyeable = TRUE

	rarity = RARITY_RARE

	value = 1

/obj/item/clothing/overwear/armor/spec_ops/calculate_weight()
	. = ..()
	. *= 0.75
	. = CEILING(.,1)

/obj/item/clothing/overwear/armor/spec_ops/get_base_value()
	. = ..()
	. *= 1.25
	. = CEILING(.,1)

/obj/item/clothing/overwear/armor/spec_ops/black
	color = COLOR_BLACK

