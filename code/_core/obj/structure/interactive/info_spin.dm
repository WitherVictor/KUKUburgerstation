obj/structure/interactive/info_spin
	name = "咨询显示牌"
	desc = "你好，请问怎么切换左右手？"
	desc_extended = "一块标示咨询台的大型全息招牌。也许你能在这里获得帮助？"
	icon = 'icons/obj/structure/info_static.dmi'
	icon_state = "info"
	pixel_y = 10

	plane = PLANE_MOVABLE
	layer = LAYER_LARGE_OBJ

	density = TRUE
	anchored = TRUE

	collision_dir = NORTH | EAST | SOUTH | WEST


obj/structure/interactive/info_spin/Finalize()
	. = ..()
	update_sprite()


obj/structure/interactive/info_spin/update_overlays()
	. = ..()
	var/image/I = new/image('icons/obj/structure/info_speen.dmi',"speen")
	I.alpha = 150
	I.pixel_x = -16
	I.pixel_y = 32
	add_overlay(I)
