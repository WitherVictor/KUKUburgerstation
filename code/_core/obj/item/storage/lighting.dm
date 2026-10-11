/obj/item/storage/lighting/
	name = "灯具盒"

	is_container = TRUE
	container_max_size = SIZE_1

	dynamic_inventory_count = MAX_INVENTORY_X*2

	icon = 'icons/obj/item/storage/boxes.dmi'
	icon_state = "largebox"

	value = 0

/obj/item/storage/lighting/tube
	name = "灯管盒"
	value = 1

/obj/item/storage/lighting/tube/fill_inventory()
	for(var/i=1,i<=dynamic_inventory_count,i++)
		new/obj/item/light/tube(src)
	. = ..()

/obj/item/storage/lighting/bulb
	name = "灯泡盒"
	value = 1

/obj/item/storage/lighting/bulb/fill_inventory()
	for(var/i=1,i<=dynamic_inventory_count,i++)
		new/obj/item/light/bulb(src)
	. = ..()
