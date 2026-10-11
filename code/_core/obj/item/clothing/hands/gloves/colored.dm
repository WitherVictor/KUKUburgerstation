/obj/item/clothing/hands/gloves/colored
	name = "右手套"
	icon_state = "inventory_right"
	icon_state_worn = "worn_right"
	desc = "戴着它扇人耳光。"
	desc_extended = "一只普通手套。希望你还有配对的另一只。"
	icon = 'icons/obj/item/clothing/gloves/regular.dmi'
	color = "#FFFFFF"

	armor = /armor/cloth/

	size = SIZE_1

	value = 20

	dyeable = TRUE

/obj/item/clothing/hands/gloves/colored/left
	name = "左手套"
	desc = "戴着它扇人耳光。"
	desc_extended = "一只普通手套。希望你还有配对的另一只。"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

/obj/item/clothing/hands/gloves/colored/combat
	name = "战斗右手套"
	desc = "戴着它开枪。"
	desc_extended = "一只战斗手套。遗憾的是，它不能让你徒手接子弹，满足你的斯拉夫偏爱。"
	color = "#404040"

	armor = /armor/cloth/hard

	protection_cold = list(
		BODY_HAND_RIGHT = 1
	)

	size = SIZE_1


/obj/item/clothing/hands/gloves/colored/combat/left
	name = "战斗左手套"
	desc = "戴着它开枪。"
	desc_extended = "一只战斗手套。遗憾的是，它不能让你徒手接子弹，满足你的斯拉夫偏爱。"
	color = "#404040"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 1
	)


/obj/item/clothing/hands/gloves/colored/insulated
	name = "绝缘右手套"
	desc = "戴着它破解气闸。"
	desc_extended = "某天有人骂绝缘手套丑得要命，害它成了‘挨骂手套’，不过现在已经不计较了。它还有很强的疲劳伤害防护，鬼知道为什么。"
	color = "#FFFF00"

	armor = /armor/glasses/sunglasses/insulated

	protection_cold = list(
		BODY_HAND_LEFT = 2
	)

	size = SIZE_1

	value = 150

	rarity = RARITY_RARE

/obj/item/clothing/hands/gloves/colored/insulated/left
	name = "绝缘左手套"
	desc = "戴着它破解气闸。"
	desc_extended = "某天有人骂绝缘手套丑得要命，害它成了‘挨骂手套’，不过现在已经不计较了。它还有很强的疲劳伤害防护，鬼知道为什么。"
	color = "#FFFF00"

	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_RIGHT = 2
	)

/obj/item/clothing/hands/gloves/colored/padded
	name = "衬垫战术右手套"
	desc = "戴出战术范儿。"
	desc_extended = "一只有衬垫的手套。搭配更华丽的图标，战术感更足。"
	icon = 'icons/obj/item/clothing/gloves/padded.dmi'

	armor = /armor/military/light

	protection_cold = list(
		BODY_HAND_RIGHT = 3
	)

	size = SIZE_1

	value = 120


/obj/item/clothing/hands/gloves/colored/padded/left
	name = "衬垫战术左手套"
	desc = "戴出战术范儿。"
	desc_extended = "一只有衬垫的手套。搭配更华丽的纹理，战术感更足。"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)

/obj/item/clothing/hands/gloves/colored/padded/black
	color = COLOR_BLACK

/obj/item/clothing/hands/gloves/colored/padded/black/left
	name = "衬垫左手套"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)



/obj/item/clothing/hands/gloves/colored/padded/brown
	name = "衬垫劳保右手套"
	color = COLOR_BROWN

	armor = /armor/leather/mining

/obj/item/clothing/hands/gloves/colored/padded/brown/left
	name = "衬垫劳保左手套"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)


/obj/item/clothing/hands/gloves/colored/padded/merc
	color = "#6C8A97"

/obj/item/clothing/hands/gloves/colored/padded/merc/left
	name = "衬垫战术左手套"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)

/obj/item/clothing/hands/gloves/colored/padded/merc_alt
	color = "#48482D"

/obj/item/clothing/hands/gloves/colored/padded/merc_alt/left
	name = "衬垫战术左手套"
	icon_state = "inventory_left"
	icon_state_worn = "worn_left"

	item_slot = SLOT_HAND
	item_slot_mod = SLOT_MOD_LEFT
	protected_limbs = list(BODY_HAND_LEFT)

	protection_cold = list(
		BODY_HAND_LEFT = 3
	)
