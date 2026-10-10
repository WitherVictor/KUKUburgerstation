/obj/item/container/simple/beaker/bluespace
	name = "蓝空间烧杯"
	desc = "化学家的最佳伙伴。"
	desc_extended = "极其实用且容量充足的蓝空间烧杯，设计目标是在尽可能小的空间里盛装尽可能多的化学物质。"
	icon = 'icons/obj/item/container/cup/beaker_bluespace.dmi'
	icon_state = "beaker"
	icon_count = 1

	reagents = /reagent_container/beaker/bucket

	size = SIZE_2

	color = COLOR_GREY

	rarity = RARITY_RARE

/obj/item/container/simple/beaker/bluespace/oxygen
	value_burgerbux = 1

/obj/item/container/simple/beaker/bluespace/oxygen/Generate()
	reagents.add_reagent(/reagent/fuel/oxygen,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bluespace/phoron
	value_burgerbux = 1

/obj/item/container/simple/beaker/bluespace/phoron/Generate()
	reagents.add_reagent(/reagent/fuel/phoron,reagents.volume_max)
	return ..()
