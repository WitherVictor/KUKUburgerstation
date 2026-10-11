/obj/item/mech_attachment
	name = "机甲设备安装支架"
	desc = "靠它固定。"
	desc_extended = "用于将兼容设备或武器安装到机甲上的专用支架。先将物品装到支架上，再把支架装到机甲上。"
	var/obj/item/attached_item

	value = 300

/obj/item/mech_attachment/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	if(!is_inventory(src.loc))
		return attached_item.click_on_object(caller,object,location,control,params)

	return ..()


/obj/item/mech_attachment/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	object = object.defer_click_on_object(location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool)
			if(I.flags_tool & FLAG_TOOL_SCREWDRIVER)
				unattach(caller)
				return TRUE
		else
			attach(caller,object)
			return TRUE

	return ..()


/obj/item/mech_attachment/update_underlays()

	. = ..()

	if(attached_item)
		add_underlay(attached_item)


/obj/item/mech_attachment/update_sprite()

	. = ..()

	name = initial(name)

	if(attached_item)
		name = "[name] ([attached_item.name])"


/obj/item/mech_attachment/proc/attach(var/mob/caller,var/obj/item/I)
	if(attached_item)
		caller?.to_chat(span("warning","[src.name]上已经装着[attached_item.name]了！"))
		return FALSE
	I.drop_item(src)
	attached_item = I
	caller?.to_chat(span("notice","你将[I.name]装到了[src.name]上。"))
	update_sprite()
	return TRUE

/obj/item/mech_attachment/proc/unattach(var/mob/caller)
	if(!attached_item)
		caller?.to_chat(span("warning","[src.name]上没有可拆下的物品！"))
		return FALSE
	caller?.to_chat(span("notice","你从[src.name]上拆下了[attached_item.name]。"))
	attached_item.force_move(get_turf(src))
	attached_item = null
	update_sprite()
	return TRUE
