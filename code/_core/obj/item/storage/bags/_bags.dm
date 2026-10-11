/obj/item/storage/bags //These are things that always has a container whitelist.
	name = "专用收纳袋"
	icon = 'icons/obj/item/storage/bags.dmi'
	icon_state = "mining"

/obj/item/storage/bags/botany
	name = "植物收纳袋"
	desc = "园艺高手的绿色袋子。"
	desc_extended = "专为存放植物和种子设计的大号绿色袋子，最多可容纳60件植物与种子。"
	icon_state = "botany"

	dynamic_inventory_count = 6
	container_max_size = SIZE_2
	container_max_slots = 10
	container_whitelist = list(
		/obj/item/seed,
		/obj/item/container/edible/plant
	)

	value = 30

/obj/item/storage/bags/botany/processor
	name = "种子加工袋"
	desc = "加工出你的种子。"
	desc_extended = "一种特殊袋子，可以将放入的植物加工成种子。"
	icon_state = "botany_processor"

	value = 100

/obj/item/storage/bags/botany/processor/click_self(var/mob/activator,location,control,params)

	if(activator.attack_flags & CONTROL_MOD_DISARM)
		INTERACT_CHECK
		INTERACT_DELAY(10)
		process_plants(activator)
		return TRUE

	return ..()

/obj/item/storage/bags/botany/processor/proc/process_plants(var/mob/activator)

	var/process_count = 0

	var/turf/T = get_turf(src)

	for(var/k in inventories)
		CHECK_TICK(50,FPS_SERVER*4)
		var/obj/hud/inventory/I = k
		for(var/obj/item/container/edible/plant/P in I.contents)
			CHECK_TICK(50,FPS_SERVER*2)
			if(!P.plant_type)
				continue
			if(P.loc != I)
				continue
			var/plant_type/PT = SSbotany.all_plant_types[P.plant_type]
			var/obj/item/seed/S = new(T)
			INITIALIZE(S)
			S.icon = PT.seed_icon
			S.icon_state = PT.seed_icon_state

			S.plant_type = P.plant_type

			S.growth_min = P.growth_min
			S.growth_max = P.growth_max
			S.growth_produce_max = P.growth_produce_max

			S.potency = P.potency
			S.yield_max = P.yield_max
			S.growth_speed = S.growth_speed

			FINALIZE(S)
			qdel(P)
			I.add_object(S,FALSE,TRUE,silent=TRUE) //We add the object to this item's inventory.
			process_count++

	activator.to_chat(span("notice","你将[process_count]件植物加工成了种子。"))

	return TRUE

/obj/item/storage/bags/blacksmithing
	name = "锻造材料袋"
	desc = "开个玩笑……除非你当真？"
	desc_extended = "专为存放材料锭设计的大号黑色袋子，每格可容纳最多100个材料锭。"
	icon_state = "blacksmithing"

	value = 400

	container_max_size = SIZE_2
	dynamic_inventory_count = 8
	container_max_slots = 2
	container_whitelist = list(
		/obj/item/material/ingot
	)

	value = 100




/obj/item/storage/bags/chemistry
	name = "化学用品袋"
	desc_extended = "专为存放药品设计的大号白橙色袋子，可容纳烧杯、药片和注射器。"
	icon_state = "chemistry"

	dynamic_inventory_count = 6
	container_max_size = SIZE_2
	container_max_slots = 10
	container_whitelist = list(
		/obj/item/container/simple/beaker,
		/obj/item/container/edible/pill,
		/obj/item/container/syringe
	)

	value = 30
