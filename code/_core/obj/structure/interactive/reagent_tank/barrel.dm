/obj/structure/interactive/reagent_tank/barrel
	name = "桶"
	desc = "滚啊，滚啊，滚啊。"
	icon = 'icons/obj/structure/barrel.dmi'

	reagents = /reagent_container/big_tank


/obj/structure/interactive/reagent_tank/barrel/oil
	name = "油桶"
	icon_state = "fuel"

/obj/structure/interactive/reagent_tank/barrel/oil/Generate()
	reagents.add_reagent(/reagent/fuel/oil/crude,rand(reagents.volume_max*0.5,reagents.volume_max))
	return ..()

/obj/structure/interactive/reagent_tank/barrel/water
	name = "水桶"
	icon_state = "water"

/obj/structure/interactive/reagent_tank/barrel/water/Generate()
	reagents.add_reagent(/reagent/nutrition/water,rand(reagents.volume_max*0.5,reagents.volume_max))
	return ..()
