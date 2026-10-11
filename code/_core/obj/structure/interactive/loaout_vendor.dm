/obj/structure/interactive/loadout_vendor
	name = "装备方案售货机"
	desc = "自2522年起，为死后懊悔提供一站式服务！"
	desc_extended = "一台用于保存纳米传讯雇佣兵成套装备方案的特殊设备。它大概有个很长的正式名称，但大家都叫它装备方案售货机。你可以保存目前的装备搭配，也可以购买之前保存的方案。"
	icon = 'icons/obj/structure/vending.dmi'
	icon_state = "gear"

	density = TRUE
	anchored = TRUE

	collision_flags = FLAG_COLLISION_WALL

	bullet_block_chance = 75

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#0000FF"

	pixel_y = 6


/obj/structure/interactive/loadout_vendor/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	INTERACT_CHECK
	INTERACT_DELAY(10)

	if(!activator.ckey || !is_player(activator))
		return FALSE

	if(length(SSclient.ckey_to_loadout_cooldown) && SSclient.ckey_to_loadout_cooldown[activator.ckey] > world.time)
		activator.to_chat(span("warning","[src.name]正忙！请再等待[CEILING(DECISECONDS_TO_SECONDS(SSclient.ckey_to_loadout_cooldown[activator.ckey] - world.time),1)]秒后再使用！"))
		return TRUE

	var/list/LOADDATA = SSclient.ckey_to_loadout_data[activator.ckey].loaded_data

	var/list/action_choices = list("保存当前装备方案"="Save current loadout","购买已有装备方案"="Load existing loadout","删除已有装备方案"="Delete existing loadout","取消"="Cancel")
	var/list/confirmation_choices = list("是"="Yes","否"="No","取消"="Cancel")
	var/desired_setting = input("你想做什么？", "装备方案售货机", "取消") as null|anything in action_choices
	desired_setting = action_choices[desired_setting]
	INTERACT_CHECK_NO_DELAY(activator)

	if(desired_setting == "Save current loadout")
		desired_setting = input("确定要保存当前装备方案吗？（槽位：[length(LOADDATA)]/[LOADOUT_LIMIT]）","保存装备方案","取消") as null|anything in confirmation_choices
		desired_setting = confirmation_choices[desired_setting]
		INTERACT_CHECK_NO_DELAY(activator)
		if(desired_setting != "Yes")
			activator.to_chat(span("notice","你决定不保存装备方案。"))
			return TRUE
		var/desired_name = input("请为装备方案命名。","装备方案名称") as text
		INTERACT_CHECK_NO_DELAY(activator)
		if(!length(desired_setting))
			activator.to_chat(span("notice","你决定不保存装备方案。"))
			return TRUE
		if(length(LOADDATA) && LOADDATA[desired_setting])
			desired_setting = input("已存在同名装备方案，记录的价值为[LOADDATA[desired_setting]["cost"]]信用点。要用新方案覆盖吗？","覆盖装备方案","取消") as null|anything in confirmation_choices
			desired_setting = confirmation_choices[desired_setting]
			INTERACT_CHECK_NO_DELAY(activator)
			if(desired_setting != "Yes")
				activator.to_chat(span("notice","你决定不保存装备方案。"))
				return TRUE
		save_loadout_of_mob(activator,desired_name)
		return TRUE
	else if(desired_setting == "Load existing loadout")
		if(!length(LOADDATA))
			activator.to_chat(span("notice","你没有可购买的装备方案！请先保存一套！"))
			return TRUE
		var/list/found_loadouts = list()
		for(var/k in LOADDATA)
			var/list/v = LOADDATA[k]
			var/new_name = "[v["name"]]（费用：[v["cost"]]信用点）"
			found_loadouts[new_name] = v["name"]
		found_loadouts["取消"] = "Cancel"
		var/desired_loadout = input("你想购买哪套装备方案？","购买装备方案","取消") as null|anything in found_loadouts
		INTERACT_CHECK_NO_DELAY(activator)
		if(!desired_loadout || found_loadouts[desired_loadout] == "Cancel")
			activator.to_chat(span("notice","你决定不购买装备方案。"))
			return TRUE
		var/actual_loadout = found_loadouts[desired_loadout]
		apply_loadout_to_mob(activator,actual_loadout)
		return TRUE
	else if(desired_setting == "Delete existing loadout")
		if(!length(LOADDATA))
			activator.to_chat(span("notice","你没有可删除的装备方案！"))
			return TRUE
		var/list/found_loadouts = list()
		for(var/k in LOADDATA)
			var/list/v = LOADDATA[k]
			var/new_name = "[v["name"]]（费用：[v["cost"]]信用点）"
			found_loadouts[new_name] = v["name"]
		found_loadouts["取消"] = "Cancel"
		var/desired_loadout = input("你想删除哪套装备方案？","删除装备方案","取消") as null|anything in found_loadouts
		INTERACT_CHECK_NO_DELAY(activator)
		if(!desired_loadout || found_loadouts[desired_loadout] == "Cancel")
			activator.to_chat(span("notice","你决定不删除装备方案。"))
			return TRUE
		var/actual_loadout = found_loadouts[desired_loadout]
		var/confirmation = input("确定要删除装备方案\"[actual_loadout]\"吗？此操作无法撤销！","删除装备方案","取消") as null|anything in confirmation_choices
		confirmation = confirmation_choices[confirmation]
		if(confirmation == "Yes")
			delete_loadout_of_mob(activator,actual_loadout)

	. = ..()
