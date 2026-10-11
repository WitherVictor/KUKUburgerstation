/obj/item/storage/bags/goodie
	name = "礼品袋"
	icon = 'icons/obj/item/event_bag.dmi'

	dynamic_inventory_count = 9
	max_inventory_x = 3
	container_max_size = 0
	container_max_slots = 1

	loot_open_verb = "unwrap"

/obj/item/storage/bags/goodie/get_base_value()
	return loot_to_generate ? 5 : initial(value)

/obj/item/storage/bags/goodie/halloween
	name = "万圣节礼品袋"
	desc = "不给糖就捣蛋！"
	desc_extended = "一个小袋子，装着万圣节礼物！"
	icon_state = "halloween"

	loot_to_generate = /loot/halloween

	value = 50

	value_burgerbux = 1
