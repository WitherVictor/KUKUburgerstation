/obj/structure/interactive/storage
	name = "可搜寻储物设施"
	desc = "类似物品栏，但更好用。"
	var/obj/item/structure_storage/storage

	var/loot/stored_loot
	var/loot/stored_loot_per_instance
	var/list/tracked_instance_ckeys

	anchored = TRUE

/obj/structure/interactive/storage/Destroy()
	. = ..()
	QDEL_NULL(storage)

/obj/structure/interactive/storage/Initialize()
	. = ..()
	storage = new(src)
	INITIALIZE(storage)
	GENERATE(storage)
	FINALIZE(storage)

/obj/structure/interactive/storage/Finalize()
	. = ..()
	if(storage && src.z)
		for(var/obj/item/I in loc.contents)
			storage.add_object_to_src_inventory(null,I)
	if(stored_loot_per_instance)
		tracked_instance_ckeys = list()


/obj/structure/interactive/storage/proc/examine_storage(var/mob/living/advanced/activator) //activator wants to see inside src

	INTERACT_CHECK
	INTERACT_DELAY(10)

	var/turf/T = get_turf(src)
	var/rarity = 0
	if(is_player(activator))
		var/mob/living/advanced/player/P = activator
		rarity = P.get_rarity()

	if(stored_loot)
		var/list/spawned_loot = SPAWN_LOOT(stored_loot,T,rarity)
		for(var/obj/item/I in spawned_loot)
			storage.add_object_to_src_inventory(activator,I,enable_messages = FALSE,bypass = TRUE,silent=TRUE)
		stored_loot = null

	if(stored_loot_per_instance && activator.ckey && !tracked_instance_ckeys[activator.ckey])
		tracked_instance_ckeys[activator.ckey] = TRUE
		var/list/spawned_instance_loot = SPAWN_LOOT(stored_loot_per_instance,T,rarity)
		for(var/obj/item/I in spawned_instance_loot)
			storage.add_object_to_src_inventory(activator,I,enable_messages = FALSE,bypass = TRUE,silent=TRUE)

	activator.clear_inventory_defers() //Remove existing ones.

	var/s=0
	for(var/k in storage.inventories)
		var/obj/hud/inventory/I = k
		activator.add_inventory_defer(I,s)
		s++

	return TRUE


/obj/structure/interactive/storage/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object) && is_advanced(activator))
		examine_storage(activator)
		return TRUE

	. = ..()


/obj/structure/interactive/storage/trash_pile
	name = "垃圾堆"
	desc = "有胆量就翻翻看。"
	desc_extended = "一大堆垃圾，里面夹杂着早已被丢弃的物品。翻找起来可能有危险……"
	icon = 'icons/obj/structure/trash_piles.dmi'
	icon_state = "trash"

	stored_loot = /loot/random/trash/lots
	stored_loot_per_instance = /loot/random/medium

	var/chance_none = 0

/obj/structure/interactive/storage/trash_pile/New(var/desired_loc)

	if(prob(chance_none))
		qdel(src)
		return

	icon_state = "[initial(icon_state)]_[rand(1,10)]"

	. = ..()

/obj/structure/interactive/storage/trash_pile/low_chance
	chance_none = 50

/obj/structure/interactive/storage/trash_pile/station
	stored_loot = /loot/random/trash/lots
	stored_loot_per_instance = /loot/random/low
	chance_none = 0
	var/stored_threat = FALSE

/obj/structure/interactive/storage/trash_pile/station/Finalize()
	. = ..()
	if(prob(50))
		stored_threat = TRUE

/obj/structure/interactive/storage/trash_pile/station/examine_storage(var/mob/living/advanced/activator)

	. = ..()

	if(. && stored_threat && prob(30))
		var/turf/T = get_turf(src)
		stored_threat = FALSE
		if(T)
			var/mob/living/L = pickweight(SSdirty.possible_trash_enemies)
			L = new L(src)
			INITIALIZE(L)
			GENERATE(L)
			FINALIZE(L)
			L.force_move(T)
			if(L.ai)
				L.ai.set_active(TRUE)
			src.visible_message(span("danger","[L.name]从[src.name]里爬了出来！"))




/obj/structure/interactive/storage/safe
	name = "保险箱"
	desc = "里面的东西确实相当保险。"
	desc_extended = "一个坚固的保险箱，设计用于存放重物。"
	icon = 'icons/obj/structure/safe.dmi'
	icon_state = "safe"

	stored_loot = /loot/misc/safe
	stored_loot_per_instance = /loot/random/high

	plane = PLANE_FLOOR_ATTACHMENT
	layer = LAYER_FLOOR_VENT

	var/chance_none = 70

/obj/structure/interactive/storage/safe/New(var/desired_loc)

	if(prob(chance_none))
		qdel(src)
		return

	. = ..()

/obj/structure/interactive/storage/safe/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_inventory(object) && is_advanced(activator))
		icon_state = "safe_open"

/obj/structure/interactive/storage/safe/Finalize()
	. = ..()
	var/obj/structure/interactive/storage/safe/O_safe = locate() in orange(8,src)
	if(O_safe) qdel(src)



/obj/structure/interactive/storage/ammo_pile
	name = "混杂弹药堆"
	desc = "种类繁多，却乱得毫无章法。"
	desc_extended = "好吧，他们总得从某个地方弄到弹药。"
	icon = 'icons/obj/item/bulletbox.dmi'
	icon_state = "ammo"

	stored_loot = /loot/assorted_ammo/lots
	stored_loot_per_instance = /loot/random/magazine

	pixel_y = 7


/obj/structure/interactive/storage/cash_register
	name = "收银机"
	desc = "人都死了，就不算偷了。"
	desc_extended = "一台普通收银机，用于通过一种名为“付现金”的古老方式处理交易。"
	icon = 'icons/obj/structure/register.dmi'
	icon_state = "register"

	stored_loot = /loot/currency/cash_register
	stored_loot_per_instance = /loot/currency/pocket_change

	pixel_y = 10
