/obj/item/storage/death_box
	name = "死亡遗物箱"
	desc = "我死了，请重开。"
	desc_extended = "一个特殊的蓝空间箱子，装着上个班次遗失的物品。"

	icon = 'icons/obj/item/storage/death_box.dmi'
	icon_state = "locked"

	size = 1000
	weight = 100

	value = 1000

	var/used = FALSE

	var/owning_mob_name
	var/owning_mob_ckey

	is_container = TRUE

	container_max_slots = 1
	container_max_size = 0

	max_inventory_x = MAX_INVENTORY_X
	dynamic_inventory_count = MAX_INVENTORY_X*6

	value_burgerbux = 1

/obj/item/storage/death_box/get_examine_list(var/mob/examiner)
	. = ..()
	. += div("danger","死亡遗物箱不能存入银行。")
	. += div("danger","任何人都能打开死亡遗物箱，即使不是物主。")

/obj/item/storage/death_box/Finalize()
	. = ..()
	prune_inventory()

/obj/item/storage/death_box/get_examine_list(var/mob/examiner)
	. = ..()
	if(owning_mob_name)
		. += div("notice","这个箱子属于[owning_mob_name]。")

	. += div("notice","共有[length(inventories)]个储物格。")


/obj/item/storage/death_box/Finalize()
	. = ..()
	update_sprite()
	if(owning_mob_name) name = "[initial(name)]（[owning_mob_name]）"

/obj/item/storage/death_box/update_icon()
	. = ..()
	if(used)
		icon_state = "unlocked"
	else
		icon_state = "locked"
