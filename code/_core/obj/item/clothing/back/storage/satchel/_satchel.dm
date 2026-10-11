/obj/item/clothing/back/storage/satchel/
	name = "挎包"
	desc = "背双肩包简直就是轻度角色扮演！！！"
	desc_extended = "用来携带物品的挎包。容量小于双肩包，但对移动速度的影响最小。"
	icon = 'icons/obj/item/clothing/back/satchel/grey.dmi'


	dynamic_inventory_count = MAX_INVENTORY_X*2

	size = MAX_INVENTORY_X*2*SIZE_2
	container_max_size = SIZE_3

	weight = 5

	value = 30




/obj/item/clothing/back/storage/satchel/loadout/new_player/fill_inventory()
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/storage/emergency(src)
	new /obj/item/pinpointer/landmark(src)
	new /obj/item/pinpointer/mobs(src)
	new /obj/item/clothing/overwear/coat/hoodie/grey(src)
	new /obj/item/weapon/melee/torch/flashlight(src)
	new /obj/item/weapon/ranged/bullet/revolver/detective(src)
	new /obj/item/magazine/clip/revolver/bullet_38(src)
	new /obj/item/bullet_cartridge/revolver_38{amount=6}(src)
	new /obj/item/paper/book/controls(src)
	. = ..()
