/obj/item/clothing/uniform/mummy
	name = "木乃伊裹布"
	desc = "其实不能止血。"
	desc_extended = "想扮成古尸，或者刚遭遇严重事故的人？这套裹布很适合你。"
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET
	icon = 'icons/obj/item/clothing/uniforms/mummy.dmi'


	item_slot = SLOT_TORSO | SLOT_GROIN

	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		BLADE = 10,
		PIERCE = 10,
		LASER = -10,
		ARCANE = 40,
		HEAT = 10,
		COLD = -10,
		HOLY = -40,
		DARK = 40
	)

	value = 120
