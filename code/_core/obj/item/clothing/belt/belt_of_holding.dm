/obj/item/clothing/belt/holding
	name = "次元腰带"
	icon = 'icons/obj/item/clothing/belts/holding.dmi'
	desc = "工程师和医疗兵最爱的工具箱。"
	desc_extended = "在小小的蓝空间袋中存放大量小件物品。"
	value_burgerbux = 1
	is_container = TRUE

	rarity = RARITY_MYTHICAL

	dynamic_inventory_count = MAX_INVENTORY_X * 2

	size = MAX_INVENTORY_X*SIZE_3

	container_max_size = SIZE_3

	armor = /armor/leather

	value = 1000

/obj/item/clothing/belt/holding/get_base_value()
	. = ..()
	. += 1500
