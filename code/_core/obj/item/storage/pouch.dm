/obj/item/storage/pouch //For boxes and such, not backpacks.
	name = "小型收纳包"
	desc = "简单的收纳包。"
	desc_extended = "可挂在腰胯或胸前的收纳包。"
	icon = 'icons/obj/item/storage/pouches_new.dmi'

	size = SIZE_2

	is_container = TRUE

	container_max_size = SIZE_2
	dynamic_inventory_count = 1

	inventory_bypass = list(
		/obj/hud/inventory/organs/groin/pocket/right,
		/obj/hud/inventory/organs/groin/pocket/left
	)

	container_priority = -20

/obj/item/storage/pouch/click_on_object(var/mob/activator as mob,var/atom/object,location,control,params)

	if(activator == object && is_advanced(activator))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		if(quick_equip(activator,ignore_hands=TRUE,ignore_held=FALSE,ignore_dynamic=TRUE))
			INTERACT_DELAY(1)
			return TRUE

	return ..()

/obj/item/storage/pouch/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(is_inventory(object)) //Roughly pockets only.
		var/obj/hud/inventory/I = object
		if(I.loc == activator && !I.drag_to_take)
			return click_self(activator,location,control,params)

	. = ..()



/obj/item/storage/pouch/single
	name = "单格大型收纳包"
	desc_extended = "可挂在腰胯或胸前的收纳包，能装下1件尺寸为4的物品，例如大型枪械。"
	icon_state = "single"

	container_max_size = SIZE_4
	dynamic_inventory_count = 1

	size = SIZE_5

	value = 70


/obj/item/storage/pouch/single/black
	color = COLOR_BLACK

/obj/item/storage/pouch/single/brown
	color = COLOR_BROWN

/obj/item/storage/pouch/double
	name = "双格中型收纳包"
	desc_extended = "可挂在腰胯或胸前的收纳包，能装下2件尺寸为3的物品，例如步枪或急救包。"
	icon_state = "double"

	container_max_size = SIZE_3
	dynamic_inventory_count = 2

	size = SIZE_6

	value = 70


/obj/item/storage/pouch/double/black
	color = COLOR_BLACK

/obj/item/storage/pouch/double/brown
	color = COLOR_BROWN

/obj/item/storage/pouch/triple
	name = "三格小型收纳包"
	desc_extended = "可挂在腰胯或胸前的收纳包，能装下3件尺寸为2的物品，例如随身枪械或备用弹药。"
	icon_state = "triple"
	size = SIZE_6

	container_max_size = SIZE_2
	dynamic_inventory_count = 3

	value = 70


/obj/item/storage/pouch/triple/black/
	color = COLOR_BLACK

/obj/item/storage/pouch/triple/brown
	color = COLOR_BROWN

/obj/item/storage/pouch/triple/recruit
	color = COLOR_RECRUIT_DARK
	value_burgerbux = 1

/obj/item/storage/pouch/triple/recruit/gun/fill_inventory()
	new /obj/item/weapon/ranged/bullet/magazine/pistol/laton(src)
	new /obj/item/magazine/pistol_9mm(src)
	new /obj/item/magazine/pistol_9mm(src)
	. = ..()

/obj/item/storage/pouch/triple/recruit/ammo/fill_inventory()
	new /obj/item/magazine/pistol_9mm(src)
	new /obj/item/magazine/pistol_9mm(src)
	new /obj/item/magazine/pistol_9mm(src)
	. = ..()
