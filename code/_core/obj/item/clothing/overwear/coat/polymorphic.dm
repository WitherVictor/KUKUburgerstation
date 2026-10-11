/obj/item/clothing/overwear/coat/polymorphic
	name = "夹克"
	desc = "一件不错的夹克。"
	desc_extended = "可以存放一件尺寸不超过2的物品。"
	icon = 'icons/obj/item/clothing/suit/jacket.dmi'

	no_initial_blend = TRUE

	is_container = TRUE
	dynamic_inventory_count = 1

	container_max_size = SIZE_2

	size = SIZE_3

	armor = /armor/cloth/hoodie

	dyeable = TRUE

	polymorphs = list(
		"base" = "#FFFFFF"
	)

	value = 40


/obj/item/clothing/overwear/coat/polymorphic/black
	polymorphs = list(
		"base" = COLOR_BLACK
	)

/obj/item/clothing/overwear/coat/polymorphic/nanotrasen_dark
	polymorphs = list(
		"base" = COLOR_NANOTRASEN_DARK
	)

/obj/item/clothing/overwear/coat/polymorphic/hop
	polymorphs = list(
		"base" = "#006086"
	)
