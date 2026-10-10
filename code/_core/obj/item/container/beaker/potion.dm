/obj/item/container/simple/beaker/bottle/large
	name = "大药瓶"
	desc = "卖药的，我要上战场了，只要你最强效的药水。"
	desc_extended = "一个大药瓶，通常用于储存药水。千万别喝没有标签的药水，它们可能让你丧命，或者把你变成青蛙。"
	icon = 'icons/obj/item/container/cup/potion_large.dmi'
	icon_state = "potion"
	icon_count = 16

	reagents = /reagent_container/beaker/bottle/large

	size = SIZE_2

/obj/item/container/simple/beaker/bottle/large/water
	name = "大瓶水"

/obj/item/container/simple/beaker/bottle/large/water/Generate()
	reagents.add_reagent(/reagent/nutrition/water,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/large/milk
	name = "大瓶牛奶"

/obj/item/container/simple/beaker/bottle/large/milk/Generate()
	reagents.add_reagent(/reagent/nutrition/milk,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/large/enzymes
	name = "大瓶酶"

/obj/item/container/simple/beaker/bottle/large/enzymes/Generate()
	reagents.add_reagent(/reagent/enzymes,reagents.volume_max)
	return ..()


/obj/item/container/simple/beaker/bottle/large/health_potion
	name = "大瓶治疗药水"

/obj/item/container/simple/beaker/bottle/large/health_potion/Generate()
	reagents.add_reagent(/reagent/medicine/health_potion,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/large/stamina_potion
	name = "大瓶体力药水"

/obj/item/container/simple/beaker/bottle/large/stamina_potion/Generate()
	reagents.add_reagent(/reagent/medicine/stamina_potion,reagents.volume_max)
	return ..()

/obj/item/container/simple/beaker/bottle/large/mana_potion
	name = "大瓶法力药水"

/obj/item/container/simple/beaker/bottle/large/mana_potion/Generate()
	reagents.add_reagent(/reagent/medicine/mana_potion,reagents.volume_max)
	return ..()


/obj/item/container/simple/beaker/bottle/tiny
	name = "微型药瓶"
	desc = "卖药的，我要上战场了，只要你最强效的药水。"
	desc_extended = "一个微型药瓶，通常用于储存强效化学物质。千万别喝没有标签的药水，它们可能让你丧命，或者把你变成青蛙。"
	icon = 'icons/obj/item/container/cup/bottle_tiny.dmi'
	icon_state = "bottle"
	icon_count = 6

	reagents = /reagent_container/beaker/vial
