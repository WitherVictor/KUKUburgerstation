/obj/item/clothing/mask/gas
	name = "经典防毒面具"
	icon = 'icons/obj/item/clothing/masks/gasmask.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	desc = "不含氧气。"
	desc_extended = "现代防毒面具，可过滤大多数气体。"

	armor = /armor/military/light/hard/bio

	size = SIZE_2

	rarity = RARITY_UNCOMMON

	value = 1

/obj/item/clothing/mask/gas/mining
	name = "先进防毒面具"
	icon = 'icons/obj/item/clothing/masks/mining.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	desc = "不含氧气。"
	desc_extended = "先进防毒面具，可过滤大多数气体。"

	armor = /armor/military/light/hard/bio/mining

/obj/item/clothing/mask/gas/syndicate
	name = "古老辛迪加防毒面具"
	desc = "令人畏惧。"
	desc_extended = "辛迪加特工曾经使用的老式辛迪加防毒面具。"
	icon = 'icons/obj/item/clothing/masks/gasmask_syndicate.dmi'

	armor = /armor/military/light/hard/tactical

	rarity = RARITY_RARE

/obj/item/clothing/mask/gas/mercenary
	name = "佣兵防毒面具"
	desc = "有利可图。"
	desc_extended = "禁区赏金猎人曾经使用的老式佣兵防毒面具。"
	icon = 'icons/obj/item/clothing/masks/gasmask_merc.dmi'

	armor = /armor/military/light/hard/tactical

/obj/item/clothing/mask/gas/glass
	name = "玻璃面罩防毒面具"
	desc = "看得清脸。"
	desc_extended = "受辐射地铁中的拾荒者曾经使用的老式玻璃面罩防毒面具。"
	icon = 'icons/obj/item/clothing/masks/gasmask_glass.dmi'

/obj/item/clothing/mask/gas/tactical
	name = "战术防毒面具"
	desc = "战术范儿。"
	desc_extended = "特种作战人员曾经使用的老式战术防毒面具。"
	icon = 'icons/obj/item/clothing/masks/gasmask_tactical.dmi'

	armor = /armor/military/light/hard/tactical

/obj/item/clothing/mask/gas/space_cop
	name = "太空警察面具"
	icon = 'icons/obj/item/clothing/masks/space_cop.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_HEAD
	desc = "不含警棍。"
	desc_extended = "太空时代的防毒面具，可过滤大多数气体。"

	armor = /armor/military/light/hard/tactical


/obj/item/clothing/mask/gas/poly
	name = "防毒面具"
	icon = 'icons/obj/item/clothing/masks/gasmask_poly.dmi'
	polymorphs = list(
		"base" = COLOR_WHITE,
		"eyes" = COLOR_WHITE,
		"filter" = COLOR_WHITE
	)
	dyeable = TRUE


/obj/item/clothing/mask/gas/poly/grey
	polymorphs = list(
		"base" = COLOR_METAL,
		"eyes" = COLOR_GREEN,
		"filter" = COLOR_METAL
	)

/obj/item/clothing/mask/gas/poly/nanotrasen
	polymorphs = list(
		"base" = COLOR_BLACK,
		"eyes" = COLOR_NANOTRASEN,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/nt_ops
	polymorphs = list(
		"base" = COLOR_WHITE,
		"eyes" = COLOR_NANOTRASEN,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/syndicate
	polymorphs = list(
		"base" = COLOR_BLACK,
		"eyes" = COLOR_RED,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/space_military
	polymorphs = list(
		"base" = COLOR_WHITE,
		"eyes" = COLOR_BLACK,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/engineering
	polymorphs = list(
		"base" = COLOR_BROWN,
		"eyes" = COLOR_ENGINEERING,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/chemistry
	polymorphs = list(
		"base" = COLOR_METAL,
		"eyes" = COLOR_CHEMISTRY,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/medical
	polymorphs = list(
		"base" = COLOR_SILVER,
		"eyes" = COLOR_MEDICAL,
		"filter" = COLOR_PLASTEEL
	)

/obj/item/clothing/mask/gas/poly/janitor
	polymorphs = list(
		"base" = COLOR_METAL,
		"eyes" = COLOR_PURPLE,
		"filter" = COLOR_METAL
	)

/obj/item/clothing/mask/gas/poly/science
	polymorphs = list(
		"base" = COLOR_WHITE,
		"eyes" = COLOR_SCIENCE,
		"filter" = COLOR_METAL
	)

