#define LOADOUT_LIMIT 5

/savedata/client/loadout
	loaded_data = list()

/savedata/client/loadout/get_file(var/file_id)
	return "loadout.json"


/savedata/client/loadout/New(var/desired_ckey)

	. = ..()

	load()

	var/client/owner = CLIENT(ckey)
	if(owner)
		SSclient.ckey_to_loadout_data[ckey] = src


/savedata/client/loadout/proc/save()
	var/client/owner = CLIENT(ckey)
	var/full_path = "[get_folder()][get_file()]"
	rustg_file_write(json_encode(loaded_data),full_path)
	owner?.to_chat(span("notice","你的装备方案数据已保存。"))
	return TRUE

/savedata/client/loadout/proc/load()
	var/full_path = "[get_folder()][get_file()]"
	if(!fexists(full_path))
		rustg_file_write(json_encode(loaded_data),full_path)
	else
		loaded_data = json_decode(rustg_file_read(full_path))
	return TRUE

/proc/delete_loadout_of_mob(var/mob/living/advanced/player/P,var/name="Default")

	if(!P.ckey || !name)
		return FALSE

	var/savedata/client/loadout/L = SSclient.ckey_to_loadout_data[P.ckey]

	if(!length(L.loaded_data))
		P.to_chat(span("warning","你没有可删除的装备方案！"))
		return FALSE

	if(length(SSclient.ckey_to_loadout_cooldown) && SSclient.ckey_to_loadout_cooldown[P.ckey] > world.time)
		P.to_chat(span("warning","请再等待[CEILING(DECISECONDS_TO_SECONDS(SSclient.ckey_to_loadout_cooldown[P.ckey] - world.time),1)]秒后再删除装备方案！"))
		return FALSE

	L.loaded_data -= name

	L.save()
	SSclient.ckey_to_loadout_cooldown[P.ckey] = world.time + SECONDS_TO_DECISECONDS(10)

/proc/save_loadout_of_mob(var/mob/living/advanced/player/P,var/name="Default")

	if(!P.ckey || !name)
		return FALSE

	if(length(SSclient.ckey_to_loadout_cooldown) && SSclient.ckey_to_loadout_cooldown[P.ckey] > world.time)
		P.to_chat(span("warning","请再等待[CEILING(DECISECONDS_TO_SECONDS(SSclient.ckey_to_loadout_cooldown[P.ckey] - world.time),1)]秒后再保存装备方案！"))
		return FALSE

	var/list/objects_to_check = P.worn_objects.Copy()
	sort_tim(objects_to_check,/proc/cmp_worn_layer_hybrid_asc)
	objects_to_check += P.held_objects

	var/list/final_data_list = list()
	var/final_cost = 0
	for(var/k in objects_to_check)
		var/obj/item/I = k
		var/list/generated_list = I.save_item_data(P,loadout=TRUE)
		if(!length(generated_list))
			P.to_chat(span("warning","[I.name]无法保存到装备方案中。"))
			continue
		if(is_inventory(I.loc))
			var/obj/hud/inventory/I2 = I.loc
			generated_list["original_slot"] = I2.id
		final_data_list += list(generated_list)
		final_cost += I.get_value()

	var/savedata/client/loadout/L = SSclient.ckey_to_loadout_data[P.ckey]

	if(length(L.loaded_data) && L.loaded_data[name])
		if(usr != P)
			return FALSE
		var/list/overwrite_choices = list("是"="Yes","否"="No","取消"="Cancel")
		var/choice = input("已存在名为[name]的装备方案。要覆盖吗？","覆盖装备方案","取消") as null|anything in overwrite_choices
		choice = overwrite_choices[choice]
		if(choice != "Yes")
			return FALSE

	L.loaded_data[name] = list(
		"name" = name,
		"date" = get_date(),
		"time" = get_time(),
		"loadout" = final_data_list,
		"cost" = final_cost
	)

	L.save()
	SSclient.ckey_to_loadout_cooldown[P.ckey] = world.time + SECONDS_TO_DECISECONDS(10)

	return TRUE


/proc/apply_loadout_to_mob(var/mob/living/advanced/player/P,var/name="Default")

	if(!P || !P.ckey || !name)
		return FALSE

	if(length(SSclient.ckey_to_loadout_cooldown) && SSclient.ckey_to_loadout_cooldown[P.ckey] > world.time)
		P.to_chat(span("warning","请再等待[CEILING(DECISECONDS_TO_SECONDS(SSclient.ckey_to_loadout_cooldown[P.ckey] - world.time),1)]秒后再购买装备方案！"))
		return FALSE

	var/savedata/client/loadout/L = SSclient.ckey_to_loadout_data[P.ckey]
	var/list/found_data = L.loaded_data[name]

	if(!found_data)
		CRASH("Tried loading a player-made loadout ([name]) that didn't exist!")

	if(found_data["cost"] > P.currency)
		P.to_chat(span("warning","你的信用点不足，无法购买这套装备方案！"))
		return FALSE

	var/turf/T = get_turf(P)
	var/total_value = 0
	for(var/data in found_data["loadout"])
		var/obj/item/I = load_and_create(P,data,T,loadout=TRUE)
		if(!I)
			continue
		var/obj/hud/inventory/I2 = data["original_slot"] ? P.inventories_by_id[data["original_slot"]] : null
		var/success = I2 ? I2.add_object(I,messages=FALSE,silent=TRUE) : I.quick_equip(P,silent=TRUE)
		if(success)
			total_value += I.get_value()
		else
			P.to_chat(span("warning","[I.name]无法装备。你无需为这件物品付费。"))
			qdel(I)

	P.to_chat(span("notice","本次装备方案扣除了[-P.adjust_currency(-total_value)]信用点。"))
	SSclient.ckey_to_loadout_cooldown[P.ckey] = world.time + SECONDS_TO_DECISECONDS(10)

	return TRUE



