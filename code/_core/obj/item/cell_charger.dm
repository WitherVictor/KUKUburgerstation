/obj/item/cell_charger
	name = "设备充电座"
	desc = "哇，科技！"
	desc_extended = "强力的设备充电座。装入供电电池并放在地上，再把内部装有电池的设备放到上面即可充电。不含电池。"
	layer = LAYER_OBJ_ITEM - 1
	icon = 'icons/obj/item/cell_charger.dmi'
	value = 300

	var/obj/item/powercell/battery
	var/obj/item/charging_device


	var/sprite_update_delay = 20 //Decisecond interval used in sprite updating.

	density = TRUE

	weight = 6

/obj/item/cell_charger/PreDestroy()
	QDEL_NULL(battery)
	. = ..()

/obj/item/cell_charger/Destroy()
	charging_device = null
	. = ..()

/obj/item/cell_charger/get_battery()
	return battery

/obj/item/cell_charger/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEATOM("battery")

/obj/item/cell_charger/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADATOM("battery")

/obj/item/cell_charger/Finalize()
	update_sprite()
	return ..()

/obj/item/cell_charger/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(battery && is_inventory(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		var/obj/hud/inventory/I = object
		if(I.add_object(battery))
			activator.to_chat(span("warning","你从[src.name]中取出了[battery.name]。"))
			battery.update_sprite()
			battery = null
		else
			activator.to_chat(span("warning","你似乎无法从[src.name]中取出[battery.name]！"))
		update_sprite()
		return TRUE

	if(istype(object,/obj/item/powercell))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(10)
		var/obj/item/PC = object
		if(PC.size > SIZE_3) //Only fits size 3.
			activator.to_chat(span("warning","[PC.name]太大了，装不进[src.name]！"))
			return TRUE
		if(battery)
			activator.to_chat(span("notice","你用手中的[object.name]替换了[src.name]里的[battery.name]。"))
			battery.update_sprite()
			battery.drop_item(get_turf(activator))
		else
			activator.to_chat(span("notice","你把[PC.name]装进了[src.name]。"))
		PC.drop_item(src)
		battery = PC
		update_sprite()
		return TRUE

	return ..()

/obj/item/cell_charger/update_icon()
	. = ..()
	if(battery || istype(loc,/obj/structure/interactive/shop/))
		icon_state = "inventory"
	else
		icon_state = "inventory_open"

/obj/item/cell_charger/proc/check_device_move()

	if(charging_device && charging_device.loc != src.loc)
		visible_message(span("warning","[charging_device.name]断开连接，[src.name]发出哔声。"))
		charging_device.update_sprite()
		HOOK_REMOVE("post_move","cell_charger_post_move_\ref[src]",charging_device)
		charging_device = null
		STOP_THINKING(src)
		sprite_update_delay = initial(sprite_update_delay)
		return FALSE

	return TRUE

/obj/item/cell_charger/Crossed(atom/movable/O,atom/OldLoc)

	. = ..()

	if(!charging_device && is_item(O) && src.z)
		var/obj/item/I = O
		var/obj/item/powercell/B = I.get_battery()
		if(istype(B))
			charging_device = I
			HOOK_ADD("post_move","cell_charger_post_move_\ref[src]",I,src,src::check_device_move())
			visible_message(span("notice","[I.name]放到充电座上，[src.name]叮了一声。"))
			START_THINKING(src)


/obj/item/cell_charger/think()

	. = ..()

	var/obj/item/powercell/B = src.get_battery()
	if(istype(B))
		var/obj/item/powercell/B2 = charging_device.get_battery()
		if(!istype(B2))
			visible_message(span("notice","[src.name]发出两声尖锐的哔声。"))
			return FALSE
		if(B.charge_current > 0)
			var/charge_to_add = min(200,B.charge_current,B2.charge_max - B2.charge_current)
			B2.charge_current += charge_to_add
			B.charge_current -= charge_to_add
			sprite_update_delay--
			if(sprite_update_delay <= 0)
				charging_device.update_sprite()
				sprite_update_delay = initial(sprite_update_delay)
		else
			visible_message(span("warning","[src.name]发出一声低沉的哔声。"))
			return FALSE
	else
		visible_message(span("warning","[src.name]发出两声低沉的哔声。"))
		return FALSE

	if(!charging_device)
		visible_message(span("notice","[src.name]发出清脆的叮声。"))
		return FALSE


/obj/item/cell_charger/get_examine_list(var/mob/activator)

	. = ..()

	if(battery)
		. += div("notice","剩余电量：[battery.charge_current]")

	return
