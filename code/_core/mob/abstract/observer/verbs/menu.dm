var/global/antag_count = 0

/mob/abstract/observer/verb/load_most_recent_character()
	set name = "Quickload Character"
	set category = "Menu"

	if(world_state < STATE_RUNNING)
		to_chat(span("warning","回合正在加载，请稍等！"))
		return FALSE

	if(world_state > STATE_RUNNING)
		to_chat(span("warning","回合即将结束，请等待下一回合！"))
		return FALSE

	if(!src.client)
		log_error("Attempted to quickload a character without a client!")
		return FALSE

	var/savedata/client/mob/mobdata = MOBDATA(ckey_last)

	var/list/files = mobdata.get_files()

	if(!files || !length(files))
		new_character()
		return FALSE

	var/file_num = mobdata.get_proper_id_from_filename(files[1])

	return src.client.load(mobdata,file_num)

/mob/abstract/observer/verb/load_character()
	set name = "Load Character"
	set category = "Menu"

	if(world_state < STATE_RUNNING)
		to_chat(span("warning","回合正在加载，请稍等！"))
		return FALSE

	if(world_state > STATE_RUNNING)
		to_chat(span("warning","回合即将结束，请等待下一回合！"))
		return FALSE

	var/savedata/client/mob/mobdata = MOBDATA(ckey_last)

	if(!mobdata.has_files())
		to_chat(span("danger","你没有可载入的角色！请先创建新角色。"))
		return

	var/list/name_to_choice = list()

	for(var/file in mobdata.get_files())
		var/filenum = mobdata.get_proper_id_from_filename(file)
		var/list/local_loaded_data = mobdata.load_json_data_from_id(filenum)
		if(!local_loaded_data || !local_loaded_data["name"])
			log_error("FATAL ERROR: Could not generate a valid name for a file! Something is broken! ([file],[filenum])")
			continue
		var/name = "[filenum]: [local_loaded_data["name"]]"
		name_to_choice[name] = filenum

	var/choice = input("选择要载入的角色。") as null|anything in name_to_choice

	if(!choice || !is_valid(src))
		return FALSE

	var/file_num = name_to_choice[choice]
	. = client.load(mobdata,file_num)

/mob/abstract/observer/verb/new_character()
	set name = "New Character"
	set category = "Menu"

	if(client)
		if(world_state < STATE_RUNNING)
			to_chat(span("warning","回合正在加载，请稍等！"))
			return FALSE

		if(world_state > STATE_RUNNING)
			to_chat(span("warning","回合即将结束，请等待下一回合！"))
			return FALSE

		var/savedata/client/mob/mobdata = MOBDATA(ckey_last)

		if(!mobdata)
			log_error("WARNING: [ckey] doesn't have any mobdata!")
			to_chat(span("danger","无法创建新角色！请向 BurgerBB 反馈此问题，并提供你的账号标识 ckey 和错误代码 01，以便排查。重新加入可能解决此问题。"))
			return FALSE

		var/character_id = mobdata.get_next_character_id()

		var/maximum_characters = CONFIG("MAXIMUM_PLAYER_SAVES",10)
		if(text2num(character_id) > maximum_characters)
			src.to_chat(span("warning","你已达到角色数量上限！（[text2num(character_id)-1]/[maximum_characters]）"))
			return FALSE

		if(mobdata.create_new_character(character_id))
			var/turf/T = get_turf(pick(chargen_spawnpoints))
			if(T)
				var/mob/living/advanced/player/P = new(DEBUG_TURF,client)
				P.start_chargen()
				P.save_id = character_id
				P.tutorial = TRUE
				P.update_premiums()
				P.force_move(T)
				stop_music_track(P.client)
				return TRUE

		to_chat(span("danger","无法创建新角色！请向 BurgerBB 反馈此问题，并提供你的账号标识 ckey 和错误代码 02，以便排查。重新加入可能解决此问题。"))
		log_error("WARNING: [ckey] was unable to create a new character!")
		return FALSE



/mob/abstract/observer/proc/can_become_antagonist()

	if(!is_observer(src))
		src.to_chat(span("warning","当前已有角色处于载入状态，无法成为对抗角色！"))
		return FALSE

	var/client/C = src.client

	if(!C)
		return FALSE

	var/savedata/client/globals/GD = GLOBALDATA(C.ckey)

	if(!GD || !GD.loaded_data)
		src.to_chat(span("danger","你的账号全局数据似乎出现了异常。请在 Discord 向 Burger 反馈，并提供你的账号标识 ckey，以便修复。"))
		return FALSE

	if(GD.loaded_data["antag_tokens"] <= 0)
		src.to_chat(span("danger","你没有对抗角色代币！正常游玩游戏，然后前往维护区的秘密地点购买代币。"))
		return FALSE

	if(world_state < STATE_RUNNING)
		to_chat(span("warning","回合正在加载，请稍等！"))
		return FALSE

	if(world_state > STATE_RUNNING)
		to_chat(span("warning","回合即将结束，请等待下一回合！"))
		return FALSE

	var/gamemode_state = SSgamemode.active_gamemode.state

	if(gamemode_state >= GAMEMODE_BREAK)
		src.to_chat(span("warning","回合即将结束！"))
		return FALSE

	var/antag_limit = 2 + length(SSliving.all_mobs_with_clients)*0.2

	if(antag_count > antag_limit)
		src.to_chat(span("warning","目前没有可选的对抗角色类型！"))
		return FALSE

	if(length(all_antag_markers) <= 0)
		src.to_chat(span("warning","目前没有可选的对抗角色类型！"))
		return FALSE

	return TRUE

/mob/abstract/observer/verb/become_antagonist()
	set name = "Become Antagonist"
	set category = "Menu"

	if(!can_become_antagonist())
		return FALSE

	var/client/C = src.client

	var/list/antag_confirmation_choices = list("是" = "Yes", "否" = "No", "取消" = "Cancel")
	var/choice = input("确定消耗一枚对抗角色代币，成为对抗角色吗？") as null|anything in antag_confirmation_choices

	if(!choice || antag_confirmation_choices[choice] != "Yes")
		src.to_chat(span("notice","明智的选择。"))
		return FALSE

	var/list/valid_choices = list()
	var/list/antagonist_display_names = list("Syndicate Operative" = "辛迪加特工", "Revolutionary Soldier" = "革命军士兵", "Wizard Federation Wizard" = "巫师联邦巫师", "Mercenary" = "雇佣兵", "Free Golem" = "自由魔像")

	for(var/k_id in all_antag_markers)
		var/list/list_of_markers = list(all_antag_markers[k_id])
		if(!length(list_of_markers))
			continue
		var/display_name = antagonist_display_names[k_id] ? antagonist_display_names[k_id] : k_id
		valid_choices[display_name] = k_id

	var/antagonist_choice = input("你想成为哪一种对抗角色？","选择对抗角色") as null|anything in valid_choices

	if(!antagonist_choice)
		src.to_chat(span("notice","明智的选择。"))
		return FALSE
	antagonist_choice = valid_choices[antagonist_choice]

	if(!length(all_antag_markers))
		src.to_chat(span("warning","有人抢先占用了名额！已经没有对抗角色名额了！"))
		return FALSE

	if(!antagonist_choice || !length(all_antag_markers[antagonist_choice]))
		src.to_chat(span("warning","有人抢先占用了名额！请选择其他对抗角色类型！"))
		return FALSE

	if(!can_become_antagonist())
		return FALSE

	var/savedata/client/globals/GD = GLOBALDATA(C.ckey)
	if(!GD)
		src.to_chat(span("danger","检测到账号全局数据错误。请在 Discord 向 Burger 反馈，错误代码：WEWLAD。重新加入可能解决此问题。"))
		return FALSE

	var/obj/marker/antag/chosen_marker = pick(all_antag_markers[antagonist_choice])
	all_antag_markers[antagonist_choice] -= chosen_marker
	if(!length(all_antag_markers[antagonist_choice]))
		all_antag_markers -= antagonist_choice

	GD.loaded_data["antag_tokens"] -= 1
	src.to_chat(span("notice","你消耗了一枚对抗角色代币，成为对抗角色。你还剩 <b>[GD.loaded_data["antag_tokens"]]</b> 枚对抗角色代币。"))
	GD.save()

	var/savedata/client/mob/mobdata = MOBDATA(C.ckey)
	mobdata.reset_data()

	var/mob/living/advanced/player/antagonist/P = new chosen_marker.spawn_type(get_turf(chosen_marker),C)
	INITIALIZE(P)
	FINALIZE(P)
	P.equip_loadout(P.loadout_to_use,TRUE)
	P.setup_iff()
	stop_music_track(P.client)

	antag_count++
