/obj/item/container/edible/plant
	name = "植物"
	desc = "适合纯素食者。"
	desc_extended = "省钱的秘诀就是：只要不怕中毒，几乎到处都能找到吃的。"

	icon = 'icons/obj/item/consumable/food/plants.dmi'
	icon_state = "slippery"

	crafting_id = /obj/item/container/edible/plant

	consume_verb = "eat"

	var/plant_type/plant_type

	var/growth_min = 0
	var/growth_max = 50
	var/growth_produce_max = 100

	var/potency = 20
	var/yield_max = 1
	var/yield_percent = 100
	var/growth_speed = 5

	var/delete_after_harvest = TRUE

	var/sliced = FALSE

	drop_sound = 'sound/items/drop/herb.ogg'

	scale_sprite = TRUE

	value = 0

/obj/item/container/edible/plant/get_base_value()
	if(!plant_type)
		return 0
	. = ..()

/obj/item/container/edible/plant/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE

	SAVEPATH("plant_type")

	SAVEVAR("growth_min")
	SAVEVAR("growth_max")
	SAVEVAR("growth_produce_max")

	SAVEVAR("potency")
	SAVEVAR("yield_max")
	SAVEVAR("yield_percent")
	SAVEVAR("growth_speed")

	SAVEVAR("delete_after_harvest")

	SAVEVAR("sliced")

/obj/item/container/edible/plant/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE

	LOADPATH("plant_type")

	LOADVAR("growth_min")
	LOADVAR("growth_max")
	LOADVAR("growth_produce_max")

	LOADVAR("potency")
	LOADVAR("yield_max")
	LOADVAR("yield_percent")
	LOADVAR("growth_speed")

	LOADVAR("delete_after_harvest")

	LOADVAR("sliced")

/obj/item/container/edible/plant/Finalize()

	if(plant_type && SSbotany.all_plant_types[plant_type])
		var/plant_type/associated_plant = SSbotany.all_plant_types[plant_type]
		typical_volume = associated_plant.typical_volume
		name = associated_plant.name
		desc = associated_plant.desc
		icon = associated_plant.harvest_icon
		icon_state = associated_plant.harvest_icon_state
	else
		log_error("Warning: [src.get_debug_name()] didn't have a valid plant type.")

	if(sliced)
		scale_sprite = FALSE
		pixel_height = 1
		pixel_height_offset = -1

	. = ..()

	update_sprite()


/obj/item/container/edible/plant/Initialize()

	if(plant_type && SSbotany.all_plant_types[plant_type])
		var/plant_type/associated_plant = SSbotany.all_plant_types[plant_type]
		if(associated_plant.can_slice)
			health = /health/obj/item/misc/

	return ..()

/obj/item/container/edible/plant/update_icon()

	. = ..()

	if(sliced)
		icon = 'icons/obj/item/consumable/food/sliced.dmi'

/obj/item/container/edible/plant/can_be_attacked(var/atom/attacker,var/atom/weapon,var/params,var/damagetype/damage_type)
	return health && !sliced

/obj/item/container/edible/plant/on_damage_received(var/atom/atom_damaged,var/atom/attacker,var/atom/weapon,var/damagetype/DT,var/list/damage_table,var/damage_amount,var/critical_hit_multiplier,var/stealthy=FALSE)

	if(!sliced && ((damage_table[BLADE] && !damage_table[BLUNT]) || damage_table[BLADE] > damage_table[BLUNT])) //Cut
		var/original_volume = reagents.volume_current
		var/turf/T = get_turf(src)
		var/slices_to_create = CEILING(original_volume/5,1)
		for(var/i=1,i<=slices_to_create,i++)
			var/obj/item/container/edible/plant/S = new(T)
			S.growth_min = growth_min
			S.growth_max = growth_max
			S.growth_produce_max = growth_produce_max
			S.potency = FLOOR(potency/5,1)
			S.yield_max = FLOOR(yield_max/5,1)
			S.growth_speed = growth_speed
			S.delete_after_harvest = delete_after_harvest
			S.sliced = TRUE
			S.icon_state = icon_state
			S.plant_type = plant_type
			INITIALIZE(S)
			if(S.reagents) src.reagents.transfer_reagents_to(S.reagents,5)
			FINALIZE(S)
			animate(S,pixel_x=rand(-8,8),pixel_y=rand(-8,8),time=5)
		attacker.visible_message(span("notice","[attacker.name]将[src.name]切成了片。"),span("notice","你将[src.name]切成了片。"))
		qdel(src)

	return ..()

/obj/item/container/edible/plant/nitrogen_flower
	name = "液氮花"
	icon_state = "nitrogen_flower"
	plant_type = /plant_type/nitrogen_flower
	value = 1

/obj/item/container/edible/plant/nitrogen_flower/Generate()
	reagents.add_reagent(/reagent/nitrogen,10)
	return ..()

/obj/item/container/edible/plant/oxygen_fruit
	name = "液氧果"
	icon_state = "oxygen_fruit"
	plant_type = /plant_type/oxygen_fruit
	value = 1

/obj/item/container/edible/plant/oxygen_fruit/Generate()
	reagents.add_reagent(/reagent/fuel/oxygen,10)
	return ..()

/obj/item/container/edible/plant/wheat
	name = "小麦"
	icon_state = "wheat"
	plant_type = /plant_type/wheat
	value = 1

/obj/item/container/edible/plant/wheat/Generate()
	reagents.add_reagent(/reagent/nutrition/wheat_grain,10)
	return ..()

/obj/item/container/edible/plant/sugarcane
	name = "甘蔗"
	icon_state = "sugarcane"
	plant_type = /plant_type/sugarcane
	value = 1

/obj/item/container/edible/plant/sugarcane/Generate()
	reagents.add_reagent(/reagent/nutrition/sugar/cane,10)
	return ..()

/obj/item/container/edible/plant/tomato
	name = "番茄"
	icon_state = "tomato"
	plant_type = /plant_type/tomato
	value = 1

/obj/item/container/edible/plant/tomato/Generate()
	reagents.add_reagent(/reagent/nutrition/tomato,10)
	return ..()

/obj/item/container/edible/plant/lettuce
	name = "生菜"
	icon_state = "lettuce"
	plant_type = /plant_type/lettuce
	value = 1

/obj/item/container/edible/plant/lettuce/Generate()
	reagents.add_reagent(/reagent/nutrition/lettuce,10)
	return ..()


/obj/item/container/edible/plant/chili
	name = "辣椒"
	icon_state = "chilipepper"
	plant_type = /plant_type/chili
	value = 1

/obj/item/container/edible/plant/chili/Generate()
	reagents.add_reagent(/reagent/nutrition/capsaicin,5)
	return ..()
