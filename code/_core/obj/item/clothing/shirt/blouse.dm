/obj/item/clothing/shirt/blouse
	name = "女式衬衫"
	desc = "秘书的标准配发服装。"
	desc_extended = "一件领口宽大的衬衫。"
	icon = 'icons/obj/item/clothing/shirts/blouse.dmi'

	item_slot = SLOT_TORSO

	armor = /armor/cloth

	dyeable = TRUE

	polymorphs = list(
		"blouse" = COLOR_WHITE
	)

	value = 1


/obj/item/clothing/shirt/blouse/frill
	name = "条纹女式衬衫"
	desc = "秘书的标准配发服装。"
	desc_extended = "一件领口宽大的衬衫，带有花哨的条纹装饰。"
	polymorphs = list(
		"blouse" = COLOR_GREY,
		"frill" = COLOR_WHITE
	)

/obj/item/clothing/shirt/blouse/frill/black
	polymorphs = list(
		"blouse" = COLOR_BLACK,
		"frill" = COLOR_WHITE
	)

/obj/item/clothing/shirt/blouse/frill/nanotrasen
	polymorphs = list(
		"blouse" = COLOR_NANOTRASEN,
		"frill" = COLOR_WHITE
	)

/obj/item/clothing/shirt/blouse/uniform
	name = "制服女式衬衫"
	desc_extended = "一件制服款女式衬衫。真有哪个部门会把这种衣服作为标准配发服装吗……？"
	polymorphs = list(
		"blouse" = COLOR_WHITE,
		"shoulders" = COLOR_BLACK
	)

/obj/item/clothing/shirt/blouse/random/Generate()
	. = ..()
	for(var/k in polymorphs)
		polymorphs[k] = random_color()
