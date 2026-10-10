/obj/item/container/edible/meme_pizza
	name = "传奇菠萝披萨"

	icon = 'icons/obj/item/consumable/food/meme.dmi'
	icon_state = "pizza"

	desc = "谁会往披萨上放水果啊？"
	desc_extended = "名副其实的传奇披萨，吃下后能让你恢复到满生命值。对死者无效。"

	value = 1000

	scale_sprite = FALSE

	var/servings_left = 2

	rarity = RARITY_LEGENDARY

/obj/item/container/edible/meme_pizza/Generate()
	reagents.add_reagent(/reagent/nutrition/bread,10)
	reagents.add_reagent(/reagent/nutrition/cheese/cheddar,5)
	reagents.add_reagent(/reagent/nutrition/tomato,5)
	reagents.add_reagent(/reagent/nutrition/pineapple,5)
	return ..()

/obj/item/container/edible/meme_pizza/update_icon()

	icon_state = initial(icon_state)

	if(servings_left <= 1)
		icon_state = "[icon_state]_half"

	return ..()

/obj/item/container/edible/meme_pizza/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("servings_left")

/obj/item/container/edible/meme_pizza/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("servings_left")

/obj/item/container/edible/meme_pizza/Finalize()
	value = servings_left*0.5*initial(value)
	update_sprite()
	return ..()

/obj/item/container/edible/meme_pizza/get_calculated_bites(var/mob/living/activator,var/total_reagents = 1)
	return servings_left

/obj/item/container/edible/meme_pizza/feed(var/mob/activator,var/mob/living/target)
	. = ..()
	if(.)
		servings_left = 1 //It's always going to be 1 or nothing. If it's nothing, then that might cause issues.
		value = servings_left*0.5*initial(value)
		if(!target.dead) target.rejuvenate()
		update_sprite()

