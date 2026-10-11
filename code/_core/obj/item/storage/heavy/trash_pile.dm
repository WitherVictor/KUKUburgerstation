/obj/item/storage/heavy/trash_pile
	name = "垃圾堆"
	desc = "有胆量就翻翻看。"
	desc_extended = "一大堆垃圾，里面有许多丢弃已久的物品。翻找它可能会有危险……"
	icon = 'icons/obj/structure/trash_piles.dmi'
	icon_state = "trash"

	var/loot/desired_loot = /loot/trash_pile

	var/mob/living/advanced/npc/beefman/stored_beefman

/obj/item/storage/heavy/trash_pile/Destroy()
	QDEL_NULL(stored_beefman)
	return ..()

/obj/item/storage/heavy/trash_pile/Finalize()
	. = ..()
	prune_inventory()

/obj/item/storage/heavy/trash_pile/New(var/desired_loc)

	. = ..()

	icon_state = "[initial(icon_state)]_[rand(1,11)]"

	if(z == 1)
		if(prob(20))
			stored_beefman = new(src)
		else if(prob(20))
			new /mob/living/simple/passive/mouse/grey(src.loc)


/obj/item/storage/heavy/trash_pile/Generate()
	if(desired_loot)
		var/loot/L = SSloot.all_loot[desired_loot]
		if(L) L.create_loot_table(src)
	. = ..()

/obj/item/storage/heavy/trash_pile/update_inventory()
	. = ..()
	var/filled_slots = 0
	for(var/k in src.inventories)
		var/obj/hud/inventory/I = k
		filled_slots += length(I.contents)
	if(filled_slots <= 0)
		qdel(src)

/obj/item/storage/heavy/trash_pile/click_self(var/mob/caller)

	. = ..()

	if(. && stored_beefman)
		var/turf/T = get_turf(src)
		T.visible_message(span("danger","一个受到惊扰的血肉人从[src.name]里爬了出来！"))
		stored_beefman.force_move(T)
		stored_beefman.ai.set_objective(caller)
		stored_beefman = null

