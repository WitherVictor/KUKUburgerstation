/obj/item/seed
	name = "种子包"
	desc = "这里本该有个种子笑话。"
	desc_extended = "一包种子，种到土里就能长成植物。"

	icon = 'icons/obj/item/seed.dmi'
	icon_state = "seed"

	var/plant_type/plant_type

	var/growth_min = 0
	var/growth_max = 100
	var/growth_produce_max = 200

	var/potency = 20
	var/yield_max = 1
	var/yield_percent = 100
	var/growth_speed = 0.05 //Per decisecond.

	var/delete_after_harvest = TRUE

	value = 0

/obj/item/seed/Finalize()

	var/plant_type/P = SSbotany.all_plant_types[plant_type]

	if(!P)
		log_error("Warning: [src.get_debug_name()] didn't have a valid plant type ([plant_type]).")
		qdel(src)
		return ..()

	name = "[P.name]种子包"
	desc_extended = P.desc
	icon = P.seed_icon
	icon_state = P.seed_icon_state

	return ..()

/obj/item/seed/get_base_value()
	var/plant_type/P = SSbotany.all_plant_types[plant_type]
	if(!P)
		return -1
	. = (P.value * potency) * yield_max * (yield_percent/100)
	. *= (0.1 + growth_speed)
	if(!delete_after_harvest)
		. *= 3
	. += growth_min
	. += max(0,100-growth_max)*0.25
	. += max(0,200-growth_produce_max)*0.25
	. = CEILING(.,1)

/obj/item/seed/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE

	SAVEVAR("icon_state")

	SAVEPATH("plant_type")

	SAVEVAR("growth_min")
	SAVEVAR("growth_max")
	SAVEVAR("growth_produce_max")

	SAVEVAR("potency")
	SAVEVAR("yield_max")
	SAVEVAR("yield_percent")
	SAVEVAR("growth_speed")

	SAVEVAR("delete_after_harvest")


/obj/item/seed/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE

	LOADVAR("icon_state")

	LOADPATH("plant_type")

	LOADVAR("growth_min")
	LOADVAR("growth_max")
	LOADVAR("growth_produce_max")

	LOADVAR("potency")
	LOADVAR("yield_max")
	LOADVAR("yield_percent")
	LOADVAR("growth_speed")

	LOADVAR("delete_after_harvest")


/obj/item/seed/click_on_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_turf(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(1)
		var/turf/T = object
		var/plant_type/P = SSbotany.all_plant_types[plant_type]
		if(!P.allowed_turfs[T.type])
			activator.to_chat(span("warning","你无法将[src.name]种在[T.name]上。"))
			return TRUE
		var/obj/structure/interactive/plant/PL = new(T)
		PL.plant_type = plant_type
		PL.growth_min = growth_min
		PL.growth_max = growth_max
		PL.growth_produce_max = growth_produce_max
		PL.potency = potency
		PL.yield_max = yield_max
		PL.yield_percent = yield_percent
		PL.growth_speed = growth_speed
		PL.delete_after_harvest = delete_after_harvest
		INITIALIZE(PL)
		FINALIZE(PL)
		if(!PL.dead && !PL.qdeleting)
			PL.set_active(TRUE)
		activator.visible_message(span("notice","[activator.name]将[src.name]种进了[T.name]，种下了一株[PL.name]。"),span("notice","你将[src.name]种进了[T.name]，种下了一株[PL.name]。"))
		qdel(src)
		return TRUE

	return ..()


