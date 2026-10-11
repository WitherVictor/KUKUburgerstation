/obj/item/clothing/back/storage/backpack/bluespace
	name = "蓝空间次元背包"
	desc = "不建议把头伸进去。"
	desc_extended = "在蓝空间维度中开辟独立储物空间的特殊背包，能装下多得离谱的物品。但它极其沉重，只适合长途搬运物品。"
	icon = 'icons/obj/item/clothing/back/backpack/bluespace.dmi'

	dynamic_inventory_count = MAX_INVENTORY_X*5
	container_max_size = SIZE_5

	size = MAX_INVENTORY_X*5*SIZE_5

	container_blacklist = list(
		/obj/item/clothing/back/storage/backpack/bluespace,
		/obj/item/clothing/back/storage/satchel/bluespace,
		/obj/item/clothing/back/storage/satchel/bluespace/prank,
		/obj/item/clothing/belt/holding
	)

	value = 3000

	rarity = RARITY_MYTHICAL

	speed_bonus = -0.2

	value_burgerbux = 1

/obj/item/clothing/back/storage/satchel/bluespace
	name = "蓝空间次元挎包"
	desc = "等我从跨维度小包里掏出双手剑。"
	desc_extended = "在蓝空间维度中开辟独立储物空间的特殊挎包，能装下多得离谱的物品。它比蓝空间次元背包更小、更轻，但仍十分沉重，只适合长途搬运物品。"

	icon = 'icons/obj/item/clothing/back/satchel/bluespace.dmi'

	dynamic_inventory_count = MAX_INVENTORY_X*4
	container_max_size = SIZE_4

	size = MAX_INVENTORY_X*4*SIZE_4

	container_blacklist = list(
		/obj/item/clothing/back/storage/backpack/bluespace,
		/obj/item/clothing/back/storage/satchel/bluespace,
		/obj/item/clothing/back/storage/satchel/bluespace/prank,
		/obj/item/clothing/belt/holding
	)

	value = 2500

	rarity = RARITY_MYTHICAL

	speed_bonus = -0.1

	value_burgerbux = 1

	rarity = RARITY_RARE

/obj/item/clothing/back/storage/satchel/bluespace/prank
	name = "次元挎包·只装一个"
	desc = "什么鬼，这也太烂了。"
	desc_extended = "恶作剧版次元挎包，受诅咒影响，只能装一个物品。"

	dynamic_inventory_count = 1
	container_max_size = SIZE_9

	size = SIZE_10

	rarity = RARITY_RARE
