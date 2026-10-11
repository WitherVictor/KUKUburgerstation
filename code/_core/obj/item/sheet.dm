/obj/item/bedsheet
	name = "床单"
	desc = "睡觉觉。"
	desc_extended = "舒适的亚麻床单，躺在床上时可以盖在身上。"
	icon = 'icons/obj/structure/bed.dmi'
	icon_state = "sheet"
	value = 10

	plane = PLANE_MOVABLE_DEAD
	layer = LAYER_MOB_ABOVE

	pixel_y = 4

	var/static/list/valid_bedsheets = list(
		"grey",
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"purple",
		"brown",
		"black",
		"white"
	)

/obj/item/bedsheet/Finalize()
	. = ..()
	update_sprite()

/obj/item/bedsheet/update_icon()
	. = ..()
	if(icon_state == "sheet")
		icon_state = "sheet[pick(valid_bedsheets)]"
