/obj/item/storage/loot_box
	name = "战利品箱"
	desc = "抽奖时间到。"
	desc_extended = "一个装满废弃物品的箱子。你怎么又买了一箱真正的垃圾？"
	icon = 'icons/obj/item/storage/death_box.dmi'
	icon_state = "loot"

	value = 1500

	var/loot/desired_loot = /loot/value/medium

	is_container = TRUE
	container_max_size = SIZE_3
	size = SIZE_10
	dynamic_inventory_count = 5


/obj/item/storage/shoebox/black/fill_inventory()
	if(desired_loot) SPAWN_LOOT(desired_loot,src)
	. = ..()

/obj/item/storage/loot_box/Finalize()
	. = ..()
	prune_inventory()

/obj/item/storage/loot_box/update_inventory()
	. = ..()
	for(var/k in src.inventories)
		var/obj/hud/inventory/I = k
		if(length(I.contents))
			return .
	qdel(src)
