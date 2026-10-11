/obj/item/storage/glovebox/
	name = "手套盒"
	desc = "装有一双配套的手套。"
	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "glovebox"

	size = SIZE_2

	is_container = TRUE
	container_max_size = SIZE_1

	dynamic_inventory_count = 2

	value = 0

/obj/item/storage/glovebox/white
	name = "白手套盒"
	value = 1

/obj/item/storage/glovebox/white/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored(src)
	new /obj/item/clothing/hands/gloves/colored/left(src)
	. = ..()

/obj/item/storage/glovebox/yellow/
	name = "绝缘手套盒"
	desc = "装有一双黄色绝缘手套。"
	value = 1

/obj/item/storage/glovebox/yellow/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored/insulated(src)
	new /obj/item/clothing/hands/gloves/colored/insulated/left(src)
	. = ..()

/obj/item/storage/glovebox/padded/
	name = "加厚手套盒"
	desc = "装有一双黑色加厚手套，非常适合冬季使用。"
	value = 1

/obj/item/storage/glovebox/padded/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored/padded/black(src)
	new /obj/item/clothing/hands/gloves/colored/padded/black/left(src)
	. = ..()


/obj/item/storage/glovebox/brown_padded/
	name = "棕色加厚手套盒"
	desc = "装有一双棕色加厚手套，非常适合工作时使用。"
	value = 1

/obj/item/storage/glovebox/brown_padded/fill_inventory()
	new /obj/item/clothing/hands/gloves/colored/padded/brown(src)
	new /obj/item/clothing/hands/gloves/colored/padded/brown/left(src)
	. = ..()
