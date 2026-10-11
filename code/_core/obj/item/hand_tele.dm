/obj/item/hand_teleporter
	name = "手持传送器"
	desc = "这能出什么岔子呢？"
	desc_extended = "神奇的手持传送器，专供那些想把这破游戏玩坏的人使用。"

	rarity = RARITY_MYTHICAL
	value = 3000

	var/obj/item/powercell/battery = /obj/item/powercell/

	icon = 'icons/obj/item/hand_tele.dmi'
	icon_state = "inventory"

	var/teleport_cost = CELL_SIZE_BASIC

	weight = 2

/obj/item/hand_teleporter/Generate()

	if(ispath(battery))
		battery = new battery(src)
		INITIALIZE(battery)
		GENERATE(battery)
		FINALIZE(battery)

	return ..()

/obj/item/hand_teleporter/Finalize()

	. = ..()

	if(!istype(battery))
		battery = null

	update_sprite()

	
/obj/item/hand_teleporter/update_icon()

	icon_state = initial(icon_state)

	if(!battery)
		icon_state = "[icon_state]_open"
	else
		var/obj/item/powercell/battery = get_battery()
		if(battery.charge_current < teleport_cost)
			icon_state = "[icon_state]_no_charge"

/obj/item/hand_teleporter/get_battery()
	return battery

/obj/item/hand_teleporter/save_item_data(var/save_inventory = TRUE)
	. = ..()
	SAVEATOM("battery")
	
/obj/item/hand_teleporter/load_item_data_pre(var/mob/living/advanced/player/P,var/list/object_data)
	. = ..()
	LOADATOM("battery")
	
/obj/item/hand_teleporter/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	object = object.defer_click_on_object(location,control,params)

	if(battery && is_inventory(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/hud/inventory/I = object
		if(I.add_held_object(battery))
			caller.to_chat(span("notice","你从[src.name]中取出了[battery.name]。"))
			battery.update_sprite()
			battery = null
		else
			caller.to_chat(span("warning","你似乎无法从[src.name]中取出[battery.name]！"))
		update_sprite()
		return TRUE

	if(istype(object,/obj/item/powercell))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/item/PC = object
		if(PC.size > SIZE_3) //Only fits size 3.
			caller.to_chat(span("warning","[PC.name]太大了，无法装入[src.name]！"))
			return TRUE
		if(battery)
			caller.to_chat(span("notice","你用手中的[object.name]替换了[src.name]里的[battery.name]。"))
			battery.update_sprite()
			battery.drop_item(get_turf(caller))
		else
			caller.to_chat(span("notice","你将[PC.name]装入了[src.name]。"))
		PC.drop_item(src)
		battery = PC
		update_sprite()
		return TRUE

	return ..()

/obj/item/hand_teleporter/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params) //The src is used on the object

	INTERACT_CHECK
	INTERACT_DELAY(10)

	var/obj/item/powercell/PC = get_battery()

	if(ispath(PC))
		caller.to_chat(span("danger","警告：此物品存在故障。请向Burger说明你是如何获得它的。"))
		return FALSE

	if(!PC || PC.charge_current < teleport_cost)
		caller.to_chat(span("warning","[src.name]发出哔声，提示电量不足！"))
		return FALSE

	var/turf/simulated/T = get_turf(object)

	if(!istype(T))
		caller.to_chat(span("danger","传送到这里不安全！"))
		return TRUE

	if(!T.is_safe_teleport())
		caller.to_chat(span("danger","传送到这里不安全！"))
		return FALSE

	var/area/A = T.loc

	if(A && A.flags_area & FLAGS_AREA_NO_TELEPORT)
		caller.to_chat(span("danger","传送到这里不安全！"))
		return FALSE

	caller.force_move(T)
	PC.charge_current -= teleport_cost

	update_sprite()

	return TRUE

/obj/item/hand_teleporter/get_examine_list(var/mob/caller)
	return ..() + div("notice","剩余传送次数：[FLOOR(battery.charge_current/30000,1)]")
