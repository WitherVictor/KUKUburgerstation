var/global/allow_loading = TRUE


/savedata/client/mob/proc/get_proper_id_from_filepath(var/file_string)
	var/file_name = get_filename(file_string)
	return replacetext(replacetext(file_name,"character_",""),".json","")


/savedata/client/mob/proc/get_proper_id_from_filename(var/file_string)
	return replacetext(replacetext(file_string,"character_",""),".json","")


/savedata/client/mob/proc/load_most_recent_character()
	var/list/file_paths = get_files()

	var/best_date = 0
	var/best_time = 0
	var/list/best_data

	for(var/v in file_paths)
		v = get_proper_id_from_filename(v)
		var/list/new_loaded_data = load_json_data_from_id(v)
		if(!best_time || time_x_newer_than_y(new_loaded_data["last_saved_date"],new_loaded_data["last_saved_time"],best_date,best_time))
			best_time = new_loaded_data["last_saved_time"]
			best_date = new_loaded_data["last_saved_date"]
			best_data = new_loaded_data

	return best_data


/savedata/client/mob/proc/get_next_character_id()

	var/list/file_numbers = list()

	for(var/v in get_files())
		file_numbers += text2num(get_proper_id_from_filename(v))

	var/best_number = 0
	for(var/i=1,i<=99,i++)
		if(!(i in file_numbers))
			best_number = i
			break

	if(best_number == 0)
		return FALSE
	else if(best_number < 10)
		return "0[best_number]"
	else
		return "[best_number]"


/savedata/client/mob/proc/load_json_data_from_id(var/character_id)

	var/filename = get_file(character_id)
	var/data = rustg_file_read(filename)

	if(!data)
		log_error("FATAL ERROR: NO DATA FOUND FOR [filename] for [ckey].")
		return FALSE

	return json_decode(data)


/savedata/client/mob/proc/write_json_data_to_id(var/character_id,var/json_data)
	json_data["id"] = character_id
	json_data["last_saved_date"] = get_date()
	json_data["last_saved_time"] = get_time()
	var/desired_file = get_file(character_id)
	var/data = json_encode(json_data)
	rustg_file_write(data,desired_file)
	return TRUE


/savedata/client/mob/proc/create_new_character(var/character_id)

	var/client/owner = CLIENT(ckey)

	if(!allow_loading)
		owner?.mob?.to_chat(span("danger","正在清理，暂时无法载入。请稍候。"))
		return FALSE

	if(world_state < STATE_RUNNING)
		owner?.mob?.to_chat(span("warning","本轮正在加载！请稍候！"))
		return FALSE

	if(world_state > STATE_RUNNING)
		owner?.mob?.to_chat(span("warning","本轮正在结束！请等到下一轮！"))
		return FALSE

	var/max_characters = CONFIG("MAXIMUM_PLAYER_SAVES",10)
	if(text2num(character_id) > max_characters)
		owner?.mob?.to_chat(span("warning","你的角色数量已超过允许上限！（[text2num(character_id)-1]/[max_characters]）"))
		return FALSE

	reset_data()
	loaded_data["id"] = character_id

	return TRUE


/savedata/client/mob/proc/save_character(var/mob/living/advanced/player/A,var/save_inventory = TRUE,var/died=FALSE)

	if(!A)
		usr?.to_chat(span("danger","<h2>保存失败：角色不存在。请向服主提供错误码：1000。</h2>"))
		CRASH("SAVE ERROR: Tried to save a character without an actual character!")

	if(A.qdeleting)
		usr?.to_chat(span("danger","<h2>保存失败：[A.get_debug_name()]正在删除。请向服主提供错误码：1001。</h2>"))
		CRASH("SAVE ERROR: Tried saving a character that was qdeleting!")

	if(A.loc == null)
		usr?.to_chat(span("danger","<h2>保存失败：[A.get_debug_name()]没有有效位置。请向服主提供错误码：1002。</h2>"))
		CRASH("SAVE ERROR: Tried saving a character that had a null loc!")

	if(!istype(A))
		usr?.to_chat(span("danger","<h2>保存失败：[A.get_debug_name()]不是玩家角色。请向服主提供错误码：1003。</h2>"))
		CRASH("SAVE ERROR: Tried to save [A.get_debug_name()], a non-player!")

	if(!A.allow_save)
		usr?.to_chat(span("danger","你无法保存这个角色！"))
		return FALSE

	if(!A.finalized || !A.initialized)
		usr?.to_chat(span("warning","你的角色仍在初始化，暂未保存，以免损坏存档。如果你认为此提示有误，请在Discord上联系Burger。"))
		return FALSE

	A.is_saving = TRUE
	var/list/loaded_data = A.get_mob_data(save_inventory,died)

	. = TRUE
	if(!length(loaded_data))
		A.to_chat(span("danger","严重错误：保存失败！角色数据为空！请联系Burger并说明情况，错误码：2001。"))
		log_error("Tried saving [A.get_debug_name()] with no loaded data!")
		. = FALSE
	else if(!length(loaded_data["organs"]))
		A.to_chat(span("danger","严重错误：保存失败！角色器官数据为空！请联系Burger并说明情况，错误码：2002。"))
		log_error("Tried saving [A.get_debug_name()] with no organ data!")
		. = FALSE
	else if(!length(loaded_data["skills"]))
		A.to_chat(span("danger","严重错误：保存失败！角色技能数据为空！请联系Burger并说明情况，错误码：2003。"))
		log_error("Tried saving [A.get_debug_name()] with no skill data!")
		. =  FALSE
	else if(!length(loaded_data["attributes"]))
		A.to_chat(span("danger","严重错误：保存失败！角色属性数据为空！请联系Burger并说明情况，错误码：2004。"))
		log_error("Tried saving [A.get_debug_name()] with no attribute data!")
		. = FALSE
	else if(write_json_data_to_id(loaded_data["id"],loaded_data))
		if(died)
			A.to_chat(span("notice","你的意识与身体已备份至纳米传讯克隆网络……"))
		else
			A.to_chat(span("notice","角色[A.name]已成功保存。"))
	else
		A.to_chat(span("danger","<h2>保存失败。请向服主提供错误码：2005。</h2>"))
		log_error("Failed to save [A.get_debug_name()] with write_json_data_to_id!")
		. = FALSE

	A.is_saving = FALSE


/savedata/client/mob/proc/delete_character(var/mob/living/advanced/player/A)

	if(!A || !A.ckey || !A.client)
		return

	if(A != usr)
		CRASH("[A.get_debug_name()] is not equal to [usr.get_debug_name()]!")
		return

	var/savedata/client/globals/GD = GLOBALDATA(A.ckey)

	if(!GD)
		CRASH("No globaldata found for [A.ckey]!")
		return

	if(A.save_id != loaded_data["id"])
		CRASH("Save id [A.save_id] is not equal to [src.loaded_data["id"]] for [A.ckey]!")
		return

	var/file_name = get_file(A.save_id)

	if(!fdel(file_name))
		CRASH("Could not delete file [file_name] for [A.ckey]!")
		return FALSE

	var/total_value = A.get_value() + A.currency
	total_value = max(0,total_value)

	if(!GD.loaded_data["stored_experience"])
		GD.loaded_data["stored_experience"] = list()

	GD.loaded_data["stored_currency"] += total_value

	for(var/s_id in A.skills)
		var/experience/skill/S = A.skills[s_id]
		var/amount_to_add = max(0,S.get_xp() - S.level_to_xp(S.default_level))*0.5
		amount_to_add = FLOOR(amount_to_add,1)
		GD.loaded_data["stored_experience"][s_id] += amount_to_add

	for(var/s_id in A.attributes)
		var/experience/attribute/S = A.attributes[s_id]
		var/amount_to_add = max(0,S.get_xp() - S.level_to_xp(S.default_level))*0.5
		amount_to_add = FLOOR(amount_to_add,1)
		GD.loaded_data["stored_experience"][s_id] += amount_to_add

	A.make_ghost()

	qdel(A)

	return TRUE
