/obj/item/storage/secure
	name = "安全通用储物装置"
	desc = "蓝空间科技，老子没必要解释。"
	desc_extended = "又称S.U.S.装置，利用特殊的共享连接储物技术，跨越宇宙与维度存取物品。不过，能存放的物品种类非常有限。 \
	<span class='danger'>警告：此装置只有放在安全蓝空间储物槽中才能正常工作。放错位置可能导致无法取回物品！</span>"

	icon = 'icons/obj/item/storage/secure_box.dmi'
	icon_state = "basic"

	value = 1000

	max_inventory_x = 3
	dynamic_inventory_count = 3*2

	container_max_slots = 1
	container_max_size = SIZE_3

	is_container = TRUE

	size = (3*2*SIZE_3) + SIZE_3
	weight = 50

	dynamic_inventory_type = /obj/hud/inventory/dynamic/secure

	queue_delete_immune = TRUE

	can_save_loadout = FALSE

	save_on_death = TRUE
