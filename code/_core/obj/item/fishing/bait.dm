/obj/item/fishing/bait
	name = "鱼饵"
	icon = 'icons/obj/item/fishing/bait.dmi'
	drop_sound = 'sound/items/drop/scrap.ogg'
	size = SIZE_0
	weight = 0.5

	amount_max = 25

	polymorphs = list(
		"base" = "#FFFFFF",
		"logo" = "#FFFFFF"
	)

	var/loot/valid_loot_type
	var/nice_bait = FALSE

//Sea
/obj/item/fishing/bait/sea
	name = "海水鱼饵"
	desc = "适合咸咸的水。"
	desc_extended = "海钓用的鱼饵，能钓上些咸水鱼。"
	polymorphs = list(
		"base" = "#3269A8",
		"logo" = "#FFFFFF"
	)
	valid_loot_type = /loot/fishing/sea
	value = 50

/obj/item/fishing/bait/sea/infinite
	name = "无限海水鱼饵"
	desc = "咸到没完。"
	desc_extended = "海钓用的鱼饵，能钓上些咸水鱼。鱼不会偷走它，但断线时仍会丢失。"
	value = 700
	nice_bait = TRUE
	amount_max = 1

	rarity = RARITY_MYTHICAL


//River
/obj/item/fishing/bait/river
	name = "淡水鱼饵"
	desc = "适合清新的淡水。"
	desc_extended = "河钓用的鱼饵，能钓上些鲜活的淡水鱼。"
	polymorphs = list(
		"base" = "#36A2B5",
		"logo" = "#FFFFFF"
	)
	valid_loot_type = /loot/fishing/river
	value = 50

/obj/item/fishing/bait/river/infinite
	name = "无限淡水鱼饵"
	desc = "鱼儿钓不完。"
	desc_extended = "河钓用的鱼饵，能钓上些鲜活的淡水鱼。鱼不会偷走它，但断线时仍会丢失。"
	value = 700
	nice_bait = TRUE
	amount_max = 1

	rarity = RARITY_MYTHICAL

//Lava
/obj/item/fishing/bait/lava
	name = "岩浆鱼饵"
	desc = "趁热来一份！"
	desc_extended = "岩浆钓鱼用的鱼饵。大多数时候钓上来的其实不是鱼，毕竟鱼早被烫死了。"
	polymorphs = list(
		"base" = "#DE6A21",
		"logo" = "#FFFFFF"
	)
	valid_loot_type = /loot/fishing/lava

	rarity = RARITY_RARE
	value = 250
