/obj/structure/interactive/fax_machine
	name = "传真机"
	desc = "传送数据最便宜的办法！"
	desc_extended = "一件沿用至今的过时古董。看起来似乎不能正常工作。"

	icon = 'icons/obj/structure/fax.dmi'
	icon_state = "idle"

	var/processing = FALSE

	var/obj/item/paper/stored_paper

	pixel_y = 4

/obj/structure/interactive/fax_machine/PreDestroy()
	QDEL_NULL(stored_paper)
	. = ..()

/obj/structure/interactive/fax_machine/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)



	if(is_inventory(object))
		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)
		var/obj/hud/inventory/I = object
		if(stored_paper)
			if(processing)
				activator.to_chat(span("warning","[src.name]正忙于处理文件！"))
				return TRUE
			if(I.add_object(stored_paper))
				visible_message(span("notice","[activator.name]从[src.name]中取出了[stored_paper.name]。"),span("notice","你从[src.name]中取出了[stored_paper.name]。"))
				stored_paper = null
				update_sprite()
		else
			activator.to_chat(span("warning","[src.name]里面是空的！"))
		return TRUE

	if(istype(object,/obj/item/paper/))

		INTERACT_CHECK
		INTERACT_CHECK_OBJECT
		INTERACT_DELAY(5)

		if(stored_paper)
			activator.to_chat(span("warning","[src.name]里面已经有纸了！"))
			return TRUE

		var/obj/item/paper/P = object

		if(!length(P.data))
			activator.to_chat(span("warning","[src.name]拒收了空白的[P.name]！"))
			return TRUE

		if(P.icon != 'icons/obj/item/paper.dmi')
			activator.to_chat(span("warning","[P.name]太大，放不进[src.name]。"))
			return TRUE

		P.drop_item(src)
		stored_paper = P
		processing = TRUE
		update_sprite()
		process_data(activator,P.data)
		CALLBACK("finish_processing_\ref[src]",SECONDS_TO_DECISECONDS(5),src,src::finish_processing(),activator)

		return TRUE

	return ..()

/obj/structure/interactive/fax_machine/update_icon()
	if(stored_paper)
		if(processing)
			icon_state = "send"
		else
			icon_state = "receive"
	else
		icon_state = "idle"
	return ..()


/obj/structure/interactive/fax_machine/proc/process_data(var/mob/activator,var/list/data_to_process = list())
	return TRUE

/obj/structure/interactive/fax_machine/proc/finish_processing(var/mob/activator)
	processing = FALSE
	update_sprite()
	return TRUE

/obj/structure/interactive/fax_machine/cargo/process_data(var/mob/activator,var/list/data_to_process = list())

	var/list/required_data = list(
		"Requisitioners Name", //Real-name of the player. It's basically a lock saying only this person can open it. Leave blank for anyone to open.
		"Item ID", //The unique item ID of the item you're ordering.
		"Quantity" //How much of this item you want.
	)
	var/list/field_labels = list("申请人姓名" = "Requisitioners Name", "物品编号" = "Item ID", "数量" = "Quantity")

	var/list/found_data = list()
	if(length(data_to_process))
		for(var/line in splittext(data_to_process[1],"\n"))
			var/list/split_line = splittext(line,":")
			if(length(split_line) < 2)
				continue
			var/field_label = split_line[1]
			var/desired_key = field_labels[field_label] ? field_labels[field_label] : field_label
			var/found_pos = required_data.Find(desired_key)
			if(!found_pos)
				continue
			var/desired_value = trim(copytext_char(line,length_char(field_label)+2,0))
			found_data[desired_key] = trim(desired_value)

	var/real_quantity = found_data["Quantity"] ? clamp(text2num(found_data["Quantity"]),0,10) : 0
	if(length(found_data) && found_data["Requisitioners Name"] && found_data["Item ID"] && real_quantity)
		var/atom/movable/stored_item = SScargo.cargo_id_to_type[found_data["Item ID"]]
		if(!stored_item)
			activator.visible_message(span("warning","机器嗡嗡作响，红色屏幕上出现了一条错误信息，却在你看清之前消失了。"))
			return ..()
		var/obj/marker/cargo/C = locate() in world
		var/obj/structure/interactive/crate/secure/cargo/SC = new(get_turf(C))
		INITIALIZE(SC)
		FINALIZE(SC)
		for(var/i=1,i<=real_quantity,i++)
			var/atom/movable/M = new stored_item.type(SC)
			INITIALIZE(M)
			GENERATE(M)
			FINALIZE(M)
			M.force_move(SC)

		SC.close()
		SC.lock()
		SC.owner_name = "[found_data["Requisitioners Name"]]"
		SC.name = "安全货箱（[SC.owner_name] [found_data["Item ID"]]）"
		SC.credits_required = CEILING(SC.get_value(),1)
		SC.force_move(SC.loc)
		activator.visible_message(span("warning","机器嗡嗡作响，屏幕亮起绿光。你猜对方已经收到申请了。"))
		return ..()
	else
		activator.visible_message(span("warning","机器嗡嗡作响，接连显示多条错误。你猜自己填错了什么。"))
		return ..()
