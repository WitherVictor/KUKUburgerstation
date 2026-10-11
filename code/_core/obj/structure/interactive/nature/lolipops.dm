obj/structure/scenery/lolipops
	name = "棒棒糖"
	icon = 'icons/obj/structure/flora/lolipops.dmi'
	icon_state = "1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/lolipops/New()
	..()
	icon_state = "[rand(1,4)]"
