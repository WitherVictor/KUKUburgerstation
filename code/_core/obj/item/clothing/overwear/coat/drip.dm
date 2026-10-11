/obj/item/clothing/overwear/coat/drip
	name = "潮流外套"
	icon = 'icons/obj/item/clothing/suit/drip.dmi'

	desc = "不惜一切代价。"
	desc_extended = "大概是你能找到的最昂贵的衣服。有什么用吗？大概没有。"

	is_container = TRUE
	dynamic_inventory_count = 2
	container_max_size = SIZE_2

	size = SIZE_3

	armor = /armor/cloth/hoodie

	rarity = RARITY_LEGENDARY

	value = 1

/obj/item/clothing/overwear/coat/drip/get_base_value()
	. = ..()
	. += 20000
