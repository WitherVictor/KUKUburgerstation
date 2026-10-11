/obj/item/storage/briefcase/syndicate
	name = "黑色公文包"
	desc = "邪恶的黑色公文包。"
	icon_state = "briefcase_dark"

	size = 12

	is_container = TRUE
	container_max_size = 3
	dynamic_inventory_count = 4

/obj/item/storage/briefcase/syndicate/sniper
	name = "辛迪加狙击装备包"
	desc = "满足你的狙击需求。"
	container_max_size = 4
	dynamic_inventory_count = 3

/obj/item/storage/briefcase/syndicate/sniper/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/rifle/heavy_sniper(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/sniper_50(src)
		M.on_spawn()
		M.update_icon()
	return ..()

/obj/item/storage/briefcase/syndicate/smg
	name = "辛迪加冲锋枪装备包"
	desc = "满足你的冲锋枪需求。"
	container_max_size = 3
	dynamic_inventory_count = 4

/obj/item/storage/briefcase/syndicate/smg/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/smg(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/smg_45(src)
		M.on_spawn()
		M.update_icon()
	return ..()

/obj/item/storage/briefcase/syndicate/rifle
	name = "辛迪加突击步枪装备包"
	desc = "满足你的步枪需求。"
	container_max_size = 3
	dynamic_inventory_count = 4

/obj/item/storage/briefcase/syndicate/rifle/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/rifle(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/rifle_223(src)
		M.on_spawn()
		M.update_icon()
	return ..()

/obj/item/storage/briefcase/syndicate/pistol
	name = "辛迪加手枪装备包"
	desc = "满足你的手枪需求。"
	container_max_size = 2
	dynamic_inventory_count = 6

/obj/item/storage/briefcase/syndicate/pistol/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/pistol(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/pistol_10mm(src)
		M.on_spawn()
		M.update_icon()
		inventories[i].add_held_object(M,bypass_checks = TRUE)
	return ..()


/obj/item/storage/briefcase/syndicate/autoshotgun
	name = "辛迪加自动霰弹枪装备包"
	desc = "满足你的霰弹枪需求。"
	container_max_size = 3
	dynamic_inventory_count = 3

/obj/item/storage/briefcase/syndicate/autoshotgun/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/shotgun/bull(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/shotgun_auto(src)
		M.on_spawn()
		M.update_icon()
	return ..()


/obj/item/storage/briefcase/syndicate/revoler
	name = "辛迪加左轮手枪装备包"
	desc = "满足你的左轮手枪需求。"
	container_max_size = 2
	dynamic_inventory_count = 5

/obj/item/storage/briefcase/syndicate/revoler/fill_inventory()
	new /obj/item/weapon/ranged/bullet/revolver/traitor_357(src)
	for(var/i=2,i<=dynamic_inventory_count,i++)
		var/obj/item/magazine/M = new /obj/item/magazine/clip/revolver/bullet_357(src)
		M.on_spawn()
		M.update_icon()
	return ..()
