/obj/item/storage/heavy/cupboard
	name = "橱柜"
	desc = "里面可能有东西。"
	icon = 'icons/obj/item/storage/house.dmi'
	icon_state = "cupboard"

	max_inventory_x = 6
	dynamic_inventory_count = 6*2

	pixel_y = 32

	color = "#A05120"


/obj/item/storage/heavy/cupboard/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"[initial(icon_state)]_handle")
	I.appearance_flags = appearance_flags | RESET_COLOR
	add_overlay(I)
