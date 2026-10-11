/obj/item/storage/underwear
	name = "内衣盒"
	desc = "盒子里有什么？"
	desc_extended = "一个普通的灰色纸板盒。"

	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "box"

	size = SIZE_3

	is_container = TRUE
	container_max_size = SIZE_2

	dynamic_inventory_count = 4

	value = 10

/obj/item/storage/underwear/fill_inventory()
	new /obj/item/clothing/underbottom/underwear/boxers/random(src)
	new /obj/item/clothing/undertop/underwear/shirt/random(src)
	new /obj/item/clothing/feet/socks/knee(src)
	new /obj/item/clothing/feet/socks/knee(src)
	. = ..()
