/obj/item/clothing/glasses/meson
	name = "介子护目镜"
	desc = "介子！"
	desc_extended = "一副近乎魔法的护目镜，让你隔着墙壁看见地板和墙体。"
	icon = 'icons/obj/item/clothing/glasses/meson.dmi'

	armor = /armor/mechanical

	size = SIZE_1

	sight_mod = SEE_TURFS

	value = 100

	item_slot_layer = 2

/obj/item/clothing/glasses/meson/night_vision
	name = "夜视介子护目镜"
	desc = "介子！"
	desc_extended = "一副近乎魔法的护目镜，让你隔着墙壁看见地板和墙体。这款还改善了暗处的视野。"
	icon = 'icons/obj/item/clothing/glasses/meson_night_vision.dmi'


	see_in_dark = VIEW_RANGE + ZOOM_RANGE

	armor = /armor/mechanical/night_vision

	size = SIZE_1

	sight_mod = SEE_TURFS

	value = 200

/obj/item/clothing/glasses/meson/night_vision/pre_pickup(var/atom/old_location,var/obj/hud/inventory/new_location)

	. = ..()

	if(is_inventory(old_location))
		var/obj/hud/inventory/I = old_location
		I.owner?.remove_color_mod("\ref[src]")
		I.owner?.remove_lighting_mod("\ref[src]")

	if(new_location.item_slot & SLOT_FACE)
		var/list/desired_color = list(
			1,1,0,0,
			0,1,0,0,
			0,1,1,0,
			0,0,0,1,
			0,0,0,0
		)
		new_location.owner.add_color_mod("\ref[src]",desired_color)
		new_location.owner.add_lighting_mod("\ref[src]",100)

