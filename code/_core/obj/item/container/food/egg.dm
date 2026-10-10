/obj/item/container/edible/egg
	name = "鸡蛋"
	desc = "先有鸡还是先有蛋？当然是负责受精的公鸡。"
	desc_extended = "母鸡下的一枚蛋。"
	icon = 'icons/obj/item/consumable/food/meat.dmi'
	icon_state = "egg"

	value = 0

/obj/item/container/edible/egg/chicken
	value = 1

/obj/item/container/edible/egg/chicken/Generate()
	reagents.add_reagent(/reagent/nutrition/egg_white,3)
	reagents.add_reagent(/reagent/nutrition/egg_yellow,3)
	return ..()
