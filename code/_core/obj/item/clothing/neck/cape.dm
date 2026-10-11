/obj/item/clothing/neck/cape
	name = "披风"
	desc = "是鸟吗？是飞机吗？"
	desc_extended = "装备在颈部槽，为造型增添时尚感。"
	icon = 'icons/obj/item/clothing/suit/cape.dmi'

	item_slot = SLOT_NECK

	protected_limbs = list(BODY_TORSO)

	armor = /armor/cloth/arcane/reduced

	size = SIZE_2

	worn_layer = LAYER_MOB_CLOTHING_NECK_OVER

	dyeable = TRUE

	polymorphs = list(
		"base" = COLOR_WHITE,
		"design" = COLOR_WHITE,
		"trim" = COLOR_WHITE
	)

	value = 60

	item_slot_layer = 3

/obj/item/clothing/neck/cape/wizard
	polymorphs = list(
		"base" = COLOR_PURPLE,
		"design" = COLOR_BLUE,
		"trim" = COLOR_BLUE
	)

/obj/item/clothing/neck/cape/hunter
	polymorphs = list(
		"base" = COLOR_CRIMSON,
		"design" = COLOR_RED_DARK,
		"trim" = COLOR_CRIMSON
	)

/obj/item/clothing/neck/cape/hide
	name = "兽皮披风"
	polymorphs = list(
		"base" = COLOR_BROWN,
		"design" = COLOR_BROWN,
		"trim" = COLOR_BROWN
	)

	armor = /armor/leather

	value = 30

/obj/item/clothing/neck/cape/goliath
	name = "歌利亚斗篷"
	icon = 'icons/obj/item/clothing/suit/goliath_cloak.dmi'
	desc = "是鸟吗？是飞机吗？不，是矿工！"
	desc_extended = "用歌利亚皮制成的防护斗篷。"

	armor = /armor/leather/goliath

	additional_clothing = list(/obj/item/clothing/head/hat/goliath)

	value = 200

	dyeable = FALSE

	rarity = RARITY_UNCOMMON

/obj/item/clothing/neck/cape/black
	polymorphs = list(
		"base" = COLOR_BLACK,
		"design" = COLOR_BLACK,
		"trim" = COLOR_BLACK
	)
