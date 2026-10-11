/obj/item/clothing/uniform/stealth
	name = "作战服"
	desc = "战术酷炫！"
	desc = "用于作战的紧身制服。"
	icon = 'icons/obj/item/clothing/uniforms/stealth.dmi'

	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 10,
		BLUNT = 20,
		PIERCE = 20,
		LASER = -20,
		ARCANE = -20,
		HEAT = 10,
		COLD = 10,
		BOMB = 10
	)

	value = 300

/obj/item/clothing/uniform/stealth/dyeable
	icon = 'icons/obj/item/clothing/uniforms/stealth_white.dmi'
	dyeable = TRUE

/obj/item/clothing/uniform/stealth/dyeable/merc
	color = "#6A778A"


/obj/item/clothing/uniform/stealth/dyeable/virtual
	name = "虚拟作战服"
	desc_extended = "一套厚实的纳米网作战服，能显著提高穿戴者的敏捷。可惜体积偏大，无法与护甲同时穿戴。"
	icon = 'icons/obj/item/clothing/uniforms/virtual_suit.dmi'

	defense_rating = list(
		BLADE = 40,
		BLUNT = 60,
		PIERCE = 60,
		LASER = -60,
		ARCANE = -60,
		HEAT = 40,
		COLD = 40,
		BOMB = 40 //Laugh, and grow fat.
	)

	speed_bonus = 0.25

	item_slot_additional = SLOT_GROIN | SLOT_TORSO_ARMOR
