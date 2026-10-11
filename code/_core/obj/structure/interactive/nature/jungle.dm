obj/structure/scenery/grass/jungle
	name = "丛林草丛"
	icon = 'icons/obj/structure/flora/jungleflora.dmi'
	icon_state = "grassa1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/grass/jungle/New()
	..()
	switch(rand(1,2))
		if(1)
			icon_state = "grassa[rand(1,5)]"
		if(2)
			icon_state = "grassb[rand(1,5)]"

obj/structure/scenery/grass/jungle_rock
	name = "丛林岩石"
	icon = 'icons/obj/structure/flora/jungleflora.dmi'
	icon_state = "rock1"
	layer = LAYER_FLOOR_SCENERY
	plane = PLANE_FLOOR

obj/structure/scenery/grass/jungle_rock/New()
	..()
	icon_state = "rock[rand(1,5)]"

obj/structure/scenery/merchant_roof
	name = "商贩棚顶"
	icon = 'icons/obj/structure/merchant.dmi'
	icon_state = "merchant"
	layer = LAYER_MOB_FLYING - 0.1
	pixel_z = 6


obj/structure/scenery/bush/stick
	name = "枝条灌木"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "firstbush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/stick/New()
	..()
	icon_state = "firstbush_[rand(1,4)]"

obj/structure/scenery/reeds
	name = "水生芦苇"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "reedbush_1"
	layer = LAYER_MOB_WATER+1
	plane = PLANE_WATER

obj/structure/scenery/reeds/New()
	..()
	icon_state = "reedbush_[rand(1,4)]"

obj/structure/scenery/bush/leafy
	name = "灌木叶丛"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "leafybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/leafy/New()
	..()
	icon_state = "leafybush_[rand(1,3)]"


obj/structure/scenery/bush/pale
	name = "淡色灌木"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "palebush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/pale/New()
	..()
	icon_state = "palebush_[rand(1,4)]"

obj/structure/scenery/bush/stalk
	name = "灌木茎丛"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "stalkybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/stalk/New()
	..()
	icon_state = "stalkybush_[rand(1,3)]"

obj/structure/scenery/bush/grass
	name = "草丛"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "grassybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/grass/New()
	..()
	icon_state = "grassybush_[rand(1,4)]"

obj/structure/scenery/bush/fern
	name = "蕨丛"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "fernybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/fern/New()
	..()
	icon_state = "fernybush_[rand(1,3)]"


obj/structure/scenery/bush/sun
	name = "阳光灌木"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "sunnybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/sun/New()
	..()
	icon_state = "sunnybush_[rand(1,3)]"

obj/structure/scenery/bush/generic
	name = "灌木"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "genericbush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/generic/New()
	..()
	icon_state = "genericbush_[rand(1,4)]"

obj/structure/scenery/bush/pointy
	name = "尖叶灌木"
	icon = 'icons/obj/structure/flora/ausflora.dmi'
	icon_state = "pointybush_1"
	layer = LAYER_FLOOR_SCENERY

obj/structure/scenery/bush/pointy/New()
	..()
	icon_state = "pointybush_[rand(1,4)]"
