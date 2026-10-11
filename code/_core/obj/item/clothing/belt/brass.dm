/obj/item/clothing/belt/brass
	name = "黄铜腰带"
	icon = 'icons/obj/item/clothing/belts/brass.dmi'
	desc = "赞美拉特瓦尔！"
	desc_extended = "能存放不少物品，取用方便快捷。这条由黄铜制成。"

	is_container = TRUE

	dynamic_inventory_count = MAX_INVENTORY_X

	size = MAX_INVENTORY_X*SIZE_1

	container_max_size = SIZE_2

	armor = /armor/brass/belt

	value = 40

/obj/item/clothing/belt/brass/filled/fill_inventory()
	new /obj/item/weapon/melee/tool/brass/crowbar(src)
	new /obj/item/weapon/melee/tool/brass/multitool(src)
	new /obj/item/weapon/melee/tool/brass/welder(src)
	new /obj/item/weapon/melee/tool/brass/screwdriver(src)
	new /obj/item/weapon/melee/tool/brass/wirecutters(src)
	new /obj/item/weapon/melee/tool/brass/wrench(src)
	. = ..()
