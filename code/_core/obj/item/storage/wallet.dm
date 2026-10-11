/obj/item/storage/wallet
	name = "钱包"
	desc = "这玩意儿怎么挂到胸前？"
	desc_extended = "一个普普通通的仿皮钱包，用于存放小物件。"

	icon = 'icons/obj/item/storage/wallet.dmi'
	icon_state = "wallet"

	size = SIZE_1

	is_container = TRUE
	container_max_size = SIZE_0

	dynamic_inventory_count = 4

	value = 40

/obj/item/storage/wallet/random_colonist
	loot_to_generate = /loot/zombie_wallet
