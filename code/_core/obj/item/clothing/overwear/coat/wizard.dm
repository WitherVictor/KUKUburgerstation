/obj/item/clothing/overwear/coat/wizard
	name = "巫师长袍"
	icon = 'icons/obj/item/clothing/suit/wizard.dmi'

	desc = "艾纳斯！！"
	desc_extended = "廉价量产的附魔长袍，能够提供魔法防护。施法并不一定要穿它。"

	armor = /armor/dark/arcane

	size = SIZE_3

	value = 120

	dyeable = TRUE

	polymorphs = list(
		"base" = "#FFFFFF",
		"lightening" = "#FFFFFF",
	)

	no_initial_blend = TRUE

/obj/item/clothing/overwear/coat/wizard/red
	polymorphs = list(
		"base" = COLOR_RED,
		"lightening" = "#FFFFFF",
	)

/obj/item/clothing/overwear/coat/wizard/blue
	polymorphs = list(
		"base" = COLOR_BLUE,
		"lightening" = "#FFFFFF",
	)

/obj/item/clothing/overwear/coat/wizard/real
	name = "正统巫师长袍"
	desc = "货真价实。"
	desc_extended = "一套真正的正统附魔巫师长袍，提供强大的魔法防护，并增强魔法与召唤技能。"

	armor = /armor/cloth/arcane/bonus

	rarity = RARITY_RARE

	mob_values_add = list(
		SKILL_MAGIC = 5,
		SKILL_SUMMONING = 5
	)

/obj/item/clothing/overwear/coat/wizard/real/purple
	polymorphs = list(
		"base" = "#B05FE2",
		"lightening" = "#FFFFFF",
	)

/obj/item/clothing/overwear/coat/wizard/real/blue
	polymorphs = list(
		"base" = "#0751C0",
		"lightening" = "#FFFFFF",
	)

/obj/item/clothing/overwear/coat/wizard/real/red
	polymorphs = list(
		"base" = "#F62A12",
		"lightening" = "#FFFFFF",
	)

/obj/item/clothing/overwear/coat/wizard/real/syndicate
	polymorphs = list(
		"base" = COLOR_BLACK,
		"lightening" = "#FFFFFF",
	)
