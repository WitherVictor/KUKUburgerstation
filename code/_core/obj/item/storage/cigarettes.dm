/obj/item/storage/cigarettes
	name = "香烟盒"
	desc = "用来装香烟。"
	desc_extended = "没有品牌标识的香烟盒。"
	icon = 'icons/obj/item/storage/cigarette_packages.dmi'
	icon_state = "blank"

	dynamic_inventory_count = 10
	container_max_slots = 1
	container_max_size = SIZE_1

	container_whitelist = list(
		/obj/item/container/cigarette,
	)

	size = SIZE_2

	max_inventory_x = 5

	var/open = FALSE

	var/obj/item/storage/cigarettes/cigarette_type

	value = 0

/obj/item/storage/cigarettes/click_self(var/mob/activator,location,control,params)

	if(open && activator.attack_flags & CONTROL_MOD_DISARM)
		open = FALSE
		update_sprite()
		return TRUE

	if(!open)
		open = TRUE
		update_sprite()

	. = ..()

/obj/item/storage/cigarettes/update_icon()

	. = ..()

	icon = initial(icon)
	icon_state = initial(icon_state)

	if(open)
		icon_state = "[icon_state]_open"

/obj/item/storage/cigarettes/update_overlays()
	. = ..()
	if(open)
		var/filled_slots = 0
		for(var/k in src.inventories)
			var/obj/hud/inventory/I = k
			filled_slots += length(I.contents)
		var/image/I = new/image(icon,"cig_[filled_slots]")
		add_overlay(I)

/obj/item/storage/cigarettes/update_inventory()
	. = ..()
	update_sprite()

/obj/item/storage/cigarettes/fill_inventory()
	if(cigarette_type)
		for(var/i=1,i<=dynamic_inventory_count,i++)
			new cigarette_type(src)

	desc_extended = "一盒[name]，内含[dynamic_inventory_count]支。经太空食品药品监督管理局批准并监管。盒底小字声明：经销商和制造商对使用本产品造成的任何伤亡概不承担法律责任。"

	. = ..()

/obj/item/storage/cigarettes/red
	name = "\improper 纳米传讯红标香烟"
	cigarette_type = /obj/item/container/cigarette/red
	icon_state = "red"
	value = 10

/obj/item/storage/cigarettes/gold
	name = "\improper 纳米传讯金标香烟"
	cigarette_type = /obj/item/container/cigarette/gold
	icon_state = "gold"
	value = 10

/obj/item/storage/cigarettes/blue
	name = "\improper 柔水香烟"
	cigarette_type = /obj/item/container/cigarette/blue
	icon_state = "blue"
	value = 10

/obj/item/storage/cigarettes/green
	name = "\improper 清新匠香烟"
	cigarette_type = /obj/item/container/cigarette/green
	icon_state = "green"
	value = 10

/obj/item/storage/cigarettes/purple
	name = "\improper 潮流达人香烟"
	cigarette_type = /obj/item/container/cigarette/purple
	icon_state = "purple"
	value = 10

/obj/item/storage/cigarettes/orange
	name = "\improper 西部经典香烟"
	cigarette_type = /obj/item/container/cigarette/orange
	icon_state = "orange"
	value = 10

/obj/item/storage/cigarettes/syndicate
	name = "\improper 辛迪加烟云香烟"
	cigarette_type = /obj/item/container/cigarette/syndicate
	icon_state = "syndicate"
	value = 10

/obj/item/storage/cigarettes/slavic
	name = "\improper 斯拉夫蓝标香烟"
	cigarette_type = /obj/item/container/cigarette/slavic
	icon_state = "slavic"
	value = 10
