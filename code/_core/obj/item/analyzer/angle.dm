/obj/item/analyzer/gps
	name = "GPS定位仪"
	desc = "你在哪儿？"
	desc_extended = "一种先进的GPS定位测距仪，可获取所扫描地块的位置。"

	icon = 'icons/obj/item/analyzers/gps.dmi'
	icon_state = "inventory"
	value = 300
	var/assigned_name
	var/assigned_passkey
	var/secure = FALSE
	var/advanced = FALSE
	var/loadedFromFile = FALSE

	rarity = RARITY_UNCOMMON

/obj/item/analyzer/gps/get_base_value()
	. = ..()
	if(secure)
		. += 100
	if(advanced)
		. += 200

/obj/item/analyzer/gps/Finalize()
	. = ..()
	SSobj.gps_list += src
	if(!assigned_name)
		assigned_name = "\ref[src]"
	if(advanced && !assigned_passkey)
		assigned_passkey = "[lowertext(pick(SStext.first_names_male))]2"
	update_sprite()

/obj/item/analyzer/gps/update_sprite()
	. = ..()
	name = "[initial(name)] ([assigned_name])"

/obj/item/analyzer/gps/get_examine_list(mob/examiner)
	. = ..()
	if(assigned_passkey)
		. += div("notice", "访问密码：[assigned_passkey]")

/obj/item/analyzer/gps/PreDestroy()
	SSobj.gps_list -= src
	. = ..()

/obj/item/analyzer/gps/can_be_scanned(var/mob/activator,var/atom/target)
	return is_turf(target) || (target.loc && is_turf(target.loc))

/obj/item/analyzer/gps/on_scan(var/mob/activator,var/atom/target,location,control,params)

	if(!target)
		activator.to_chat(span("warning","目标无效！"))
		return FALSE
	activator.to_chat(span("notice","距离：[get_dist_advanced(activator,target)]格。"))
	activator.to_chat(span("notice","坐标：([target.x],[target.y],[target.z])。"))
	next_scan = world.time + SECONDS_TO_DECISECONDS(2)

	return TRUE

/obj/item/analyzer/gps/click_self(mob/activator, location, control, params)
	var/choose_function = "Rename"
	if(advanced)
		var/list/function_choices = list("重命名" = "Rename", "更改访问密码" = "Change Passkey", "取消" = "Cancel")
		var/function_choice = input("请选择要使用的功能。","功能选择") as null|anything in function_choices
		if(!function_choice || function_choices[function_choice] == "Cancel")
			return TRUE
		choose_function = function_choices[function_choice]
	switch(choose_function)
		if("Change Passkey")
			if(!advanced)
				activator.to_chat(span("notice","操作被拒绝：此功能仅限高级GPS定位仪。"))
				return TRUE
			var/chosen_passkey = input("请输入新的访问密码。", "设置访问密码") as null|password
			chosen_passkey = police_text(activator.client,chosen_passkey,check_name=TRUE,check_characters=TRUE,min_length=2,max_length=40)
			if(chosen_passkey)
				assigned_passkey = chosen_passkey
				activator.to_chat(span("notice","你将访问密码设为[assigned_passkey]。"))
				play_sound('sound/machines/click.ogg',get_turf(src),range_max=VIEW_RANGE)
			else
				activator.to_chat(span("notice","访问密码无效。"))
		if("Rename")
			var/chosen_name = input("请输入新名称。", "设置名称") as null|text
			chosen_name = police_text(activator.client,chosen_name,check_name=TRUE,check_characters=TRUE,min_length=2,max_length=40)
			if(chosen_name)
				assigned_name = chosen_name
				activator.to_chat(span("notice","你将GPS定位仪的名称设为[chosen_name]。"))
				play_sound('sound/machines/click.ogg',get_turf(src),range_max=VIEW_RANGE)
				update_sprite()
			else
				activator.to_chat(span("notice","名称无效。"))
	return TRUE

/obj/item/analyzer/gps/save_item_data(var/mob/living/advanced/player/P,var/save_inventory = TRUE,var/died=FALSE,var/loadout=FALSE)
	RUN_PARENT_SAFE
	SAVEVAR("assigned_name")
	SAVEVAR("assigned_passkey")

/obj/item/analyzer/gps/load_item_data_post(var/mob/living/advanced/player/P,var/list/object_data,var/loadout=FALSE)
	RUN_PARENT_SAFE
	LOADVAR("assigned_name")
	LOADVAR("assigned_passkey")

/obj/item/analyzer/gps/advanced
	name = "高级GPS定位仪"
	desc_extended = "一种先进的GPS定位测距仪，可获取所指位置的坐标。这款支持安全通信，可设置访问密码。"
	advanced = TRUE
	secure = TRUE
	rarity = RARITY_RARE
