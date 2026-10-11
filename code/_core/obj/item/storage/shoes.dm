/obj/item/storage/shoebox/
	name = "鞋盒"
	desc = "装着一双配套的鞋子。"
	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "shoebox"

	size = SIZE_3

	is_container = TRUE
	container_max_size = SIZE_2

	dynamic_inventory_count = 2

/obj/item/storage/shoebox/black/
	name = "黑鞋盒"
	desc = "装着一双黑色鞋子。"
	value = 1

/obj/item/storage/shoebox/black/fill_inventory()
	new /obj/item/clothing/feet/shoes/colored/black(src)
	new /obj/item/clothing/feet/shoes/colored/black/left(src)
	. = ..()

/obj/item/storage/shoebox/jackboot/
	name = "黑靴盒"
	desc = "装着一双黑色靴子。"
	value = 1

/obj/item/storage/shoebox/jackboot/fill_inventory()
	new /obj/item/clothing/feet/shoes/black_boots(src)
	new /obj/item/clothing/feet/shoes/black_boots/left(src)
	. = ..()

/obj/item/storage/shoebox/sandal/
	name = "凉鞋盒"
	desc = "装着一双凉鞋。"
	value = 1

/obj/item/storage/shoebox/sandal/fill_inventory()
	new /obj/item/clothing/feet/shoes/sandal(src)
	new /obj/item/clothing/feet/shoes/sandal/left(src)
	. = ..()

/obj/item/storage/shoebox/winter/
	name = "冬靴盒"
	desc = "装着一双冬靴，防寒保暖的好选择。"
	value = 1

/obj/item/storage/shoebox/winter/fill_inventory()
	new /obj/item/clothing/feet/shoes/winter(src)
	new /obj/item/clothing/feet/shoes/winter/left(src)
	. = ..()

/obj/item/storage/shoebox/colored/
	name = "可染色鞋盒"
	desc = "装着一双可以染色的鞋子。"
	value = 1

/obj/item/storage/shoebox/colored/fill_inventory()
	new /obj/item/clothing/feet/shoes/colored(src)
	new /obj/item/clothing/feet/shoes/colored/left(src)
	. = ..()

/obj/item/storage/shoebox/clown/
	name = "小丑鞋盒"
	desc = "装着一双小丑鞋。"
	value = 1

/obj/item/storage/shoebox/clown/fill_inventory()
	new /obj/item/clothing/feet/shoes/clown(src)
	new /obj/item/clothing/feet/shoes/clown/left(src)
	. = ..()

/obj/item/storage/shoebox/duck/
	name = "鸭子拖鞋盒"
	desc = "装着一双会嘎嘎叫的拖鞋。"
	value = 1

/obj/item/storage/shoebox/duck/fill_inventory()
	new /obj/item/clothing/feet/shoes/duck(src)
	new /obj/item/clothing/feet/shoes/duck/left(src)
	. = ..()

/obj/item/storage/shoebox/miner/
	name = "矿工靴盒"
	desc = "装着一双矿工靴。"
	value = 1

/obj/item/storage/shoebox/miner/fill_inventory()
	new /obj/item/clothing/feet/shoes/miner(src)
	new /obj/item/clothing/feet/shoes/miner/left(src)
	. = ..()

/obj/item/storage/shoebox/workboot/
	name = "工作靴盒"
	desc = "装着一双工作靴。"
	value = 1

/obj/item/storage/shoebox/workboot/fill_inventory()
	new /obj/item/clothing/feet/shoes/workboot(src)
	new /obj/item/clothing/feet/shoes/workboot/left(src)
	. = ..()


/obj/item/storage/shoebox/galosh
	name = "胶靴盒"
	desc = "装着一双胶靴。"
	value = 1

/obj/item/storage/shoebox/galosh/fill_inventory()
	new /obj/item/clothing/feet/shoes/galosh(src)
	new /obj/item/clothing/feet/shoes/galosh/left(src)
	. = ..()
