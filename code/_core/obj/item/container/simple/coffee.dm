/obj/item/container/simple/can/coffee/
	name = "\improper 空咖啡杯"
	icon_state = "coffee"
	open = TRUE

/obj/item/container/simple/can/coffee/black
	name = "\improper 硬派黑咖啡"
	desc = "纯咖啡。"
	value = 1

/obj/item/container/simple/can/coffee/black/Generate()
	reagents.add_reagent(/reagent/nutrition/energy/coffee,reagents.volume_max,T0C + 96)
	open = FALSE
	return ..()


//Regular espresso isn't here as that's a proper drink

/obj/item/container/simple/can/coffee/freedomno
	name = "\improper 硬派太空自由式咖啡"
	desc = "兑了热水的浓缩咖啡。"
	value = 1

/obj/item/container/simple/can/coffee/freedomno/Generate()
	reagents.add_reagent(/reagent/nutrition/energy/coffee/espresso,reagents.volume_max*0.25,T0C + 96)
	reagents.add_reagent(/reagent/nutrition/water,reagents.volume_max*0.75,T0C + 96)
	open = FALSE
	return ..()


/obj/item/container/simple/can/coffee/latte
	name = "\improper 硬派小拿铁"
	desc = "加了热奶油的浓缩咖啡。"
	value = 1

/obj/item/container/simple/can/coffee/latte/Generate()
	reagents.add_reagent(/reagent/nutrition/energy/coffee/espresso,reagents.volume_max*0.25,T0C + 96)
	reagents.add_reagent(/reagent/nutrition/cream,reagents.volume_max*0.75,T0C + 96)
	open = FALSE
	return ..()
