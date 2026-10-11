var/global/list/active_subsystems = list()
var/global/list/all_subsystems = list()
var/global/rollovers = 0
var/global/world_state = STATE_STARTING

#define REBOOT_TIME 60 //In seconds

/world/

	fps = FPS_SERVER
	icon_size = TILE_SIZE
	view = VIEW_RANGE
	map_format = TOPDOWN_MAP
	movement_mode = TILE_MOVEMENT_MODE

	sleep_offline = TRUE

	name = "汉堡站13"
	hub = "Exadv1.spacestation13"
	hub_password = "kMZy3U5jJHSiBQjr"

	cache_lifespan = 7

	turf = /turf/dmm_suite/clear_turf
	area = /area/dmm_suite/clear_area

	maxx = 1
	maxy = 1
	maxz = 1

/world/New()

	sleep_offline = FALSE
	__detect_rust_g()

	if(!rustg_get_version())
		world.log << "FATAL ERROR: Failed to properly load and initalize rust-g. Shutting down!"
		sleep(10)
		shutdown()
		return

	TgsNew(new /datum/tgs_event_handler, TGS_SECURITY_TRUSTED)

	//TODO: Unfuck this.
	createtypecache(/loot)
	createtypecache(/area)
	createtypecache(/area/shuttle)
	createtypecache(/mob)
	createtypecache(/mob/living)
	createtypecache(/mob/living/advanced)
	createtypecache(/mob/living/advanced/player)
	createtypecache(/mob/living/simple)
	createtypecache(/mob/abstract/observer)
	createtypecache(/obj/structure)
	createtypecache(/obj/item)
	createtypecache(/obj/item/container)
	createtypecache(/obj/item/clothing)
	createtypecache(/obj/item/currency)
	createtypecache(/obj/item/organ)
	createtypecache(/obj/item/weapon)
	createtypecache(/obj/item/weapon/ranged)
	createtypecache(/obj/item/weapon/ranged/wand)
	createtypecache(/obj/item/weapon/ranged/bow)
	createtypecache(/obj/item/weapon/ranged/bullet)
	createtypecache(/obj/item/weapon/ranged/bullet/magazine)
	createtypecache(/obj/item/weapon/ranged/spellgem)
	createtypecache(/obj/item/magazine)
	createtypecache(/obj/item/material)
	createtypecache(/obj/item/bullet_cartridge)
	createtypecache(/obj/hud)
	createtypecache(/obj/hud/inventory)
	createtypecache(/turf)
	createtypecache(/turf/simulated)
	createtypecache(/turf/simulated/floor)
	createtypecache(/turf/simulated/floor/tile)
	createtypecache(/turf/simulated/wall)
	createtypecache(/turf/simulated/liquid/water)
	createtypecache(/turf/unsimulated)
	createtypecache(/reagent/nutrition)

	. = ..()

	TgsInitializationComplete()

	life()

	sleep_offline = initial(sleep_offline)


/world/Topic(T,Addr,Master,Keys)
	TGS_TOPIC
	. = ..()

/world/proc/update_server_status()

	var/server_name = CONFIG("SERVER_NAME","汉堡站13非官方服务器")
	var/server_link = CONFIG("SERVER_DISCORD","")
	var/github_name = "SS13 <b>从零打造</b>"
	var/duration = get_clock_time(FLOOR(true_time()/10,1),FORMAT_HOUR | FORMAT_MINUTE)
	var/description = "游戏模式：<b>[SSgamemode.active_gamemode ? SSgamemode.active_gamemode.name : "大厅" ]</b><br>地图：<b>[SSdmm_suite.map_name ? SSdmm_suite.map_name : "星球（[world.maxx]x[world.maxy]）"]</b><br>时长：<b>[duration]</b>"

	//Format it.
	status = "<b><a href='[server_link]'>[server_name]</a>\]</b> ([github_name])<br>[description]"

	var/player_limit_config = CONFIG("PLAYER_LIMIT",0)
	var/connected_players = length(SSclient.all_clients)
	if(player_limit_config > 0 && connected_players + 10 >= player_limit_config)
		status = "[status]<br>玩家：[connected_players]/[player_limit_config]。"

	return TRUE

/world/Del()
	SSdiscord.send_message("Shutting down world...")
	return ..()

/world/proc/play_round_end_sound()
	CHECK_TICK_HARD
	var/chosen_sound = pick(SSsound.round_end_sounds)
	play_sound_global(chosen_sound,SSliving.all_mobs_with_clients)
	sleep(30)
	return TRUE

/world/proc/shutdown_server()
	save()
	play_round_end_sound()
	world_state = STATE_SHUTDOWN
	for(var/k in SSclient.all_clients)
		var/client/C = SSclient.all_clients[k]
		C << "正在关闭服务器……"
	sleep(30)
	shutdown()
	return TRUE

/world/proc/reboot_server()
	save()
	play_round_end_sound()
	world_state = STATE_SHUTDOWN
	for(var/k in SSclient.all_clients)
		var/client/C = SSclient.all_clients[k]
		C << "正在重启服务器。请保持连接，稍后将自动重连。"
	sleep(30)
	Reboot(0)
	return TRUE

/world/Reboot(reason)
	TgsReboot()
	rustg_log_close_all()
	. = ..()

/proc/save_all_globals()
	for(var/k in SSclient.all_clients)
		var/client/C = CLIENT(k)
		if(!C)
			log_error("FATAL ERROR: COULD NOT SAVE THE GLOBALS OF CKEY [k] AS THEY HAD A CKEY ISSUE.")
			continue
		var/savedata/client/globals/G = GLOBALDATA(k)
		if(!G)
			log_error("FATAL ERROR: COULD NOT SAVE THE GLOBALS OF CKEY [k] AS THEY DID NOT HAVE A GLOBAL ASSIGNED.")
			continue
		G.save()

/world/proc/save()
	save_all_globals()
	//save_all_mechs()
	save_deathboxes()
	save_banks()
	save_all_characters()
	return TRUE

/world/proc/save_all_characters()
	for(var/k in SSliving.all_players) ///Players only.
		var/mob/living/advanced/player/P = k
		if(!P)
			log_error("Warning: Tried saving a null player!")
			continue
		if(P.dead)
			continue
		if(P.qdeleting)
			log_error("Warning: Tried saving [P.get_debug_name()], which was qdeleting!")
			continue
		if(!P.ckey_last)
			if(!P.ai) log_error("Warning: Tried saving [P.get_debug_name()] without a ckey_last assigned!")
			continue
		var/savedata/client/mob/M = SSclient.ckey_to_mobdata[P.ckey_last]
		if(M.save_character(P))
			P.to_chat(span("notice","你的角色已自动保存。"))
		else
			P.to_chat(span("danger","保存出错！无法保存你的角色！"))
		CHECK_TICK_HARD

/world/proc/end(var/reason = FALSE, var/shutdown = FALSE)

	if(world_state != STATE_RUNNING)
		log_error("Can't end now!")
		return FALSE

	var/nice_reason = "未知原因"

	world_state = STATE_ROUND_END

	if(!reason)
		var/gamemode/gamemode = SSgamemode.active_gamemode
		var/completed_objectives = length(gamemode.crew_completed_objectives)
		var/failed_objectives = length(gamemode.crew_failed_objectives)
		var/total_objectives = length(gamemode.crew_active_objectives) + completed_objectives + failed_objectives

		if((completed_objectives || failed_objectives) && total_objectives)
			switch((completed_objectives - (failed_objectives * 0.4)) / total_objectives)
				if(-INFINITY to 0)
					reason = WORLD_END_SYNDICATE_VICTORY
				if(0.01 to 0.99)
					reason = WORLD_END_MINOR_NANOTRASEN_VICTORY
				if(1 to INFINITY)
					reason = WORLD_END_NANOTRASEN_VICTORY

		else
			reason = WORLD_END_BORING_VICTORY

	switch(reason)
		if(WORLD_END_SHUTDOWN)
			nice_reason = "管理员整活"

		if(WORLD_END_SYNDICATE_VICTORY)
			nice_reason = "辛迪加胜利"
			announce("中央指挥部任务更新","裂变已寄","任务失败，下次再收拾他们。")

		if(WORLD_END_BORING_VICTORY)
			nice_reason = "中立胜利"
			announce("中央指挥部任务更新","任务……失败？","你们一个目标都没完成，别指望为你们的\"工作\"拿到额外报酬。")

		if(WORLD_END_MINOR_NANOTRASEN_VICTORY)
			nice_reason = "纳米传讯小胜"
			SSpayday.stored_payday += 2500
			SSpayday.trigger_payday()
			announce("中央指挥部任务更新","任务部分成功","你们完成了部分目标，也没搞出太大的烂摊子，所以给你们一点奖金。")

		if(WORLD_END_NANOTRASEN_VICTORY)
			nice_reason = "纳米传讯胜利"
			SSpayday.stored_payday += 5000
			SSpayday.trigger_payday()
			announce("中央指挥部任务更新","任务成功","你们完成了所有目标，也没搞出太大的烂摊子，所以给你们一笔奖金。")

		else
			nice_reason = reason

	play_sound_global('sound/meme/apcdestroyed.ogg',SSliving.all_mobs_with_clients)

	//SSvote.create_vote(/vote/map)

	for(var/mob/living/L as anything in SSliving.all_players)
		if(L.loyalty_tag != "NanoTrasen")
			continue
		if(!L.ckey_last)
			continue
		L.resurrect(FALSE)
		L.add_status_effect(IMMORTAL)
		CHECK_TICK_HARD

	if(shutdown)
		broadcast_to_clients(span("notice","因[nice_reason]，服务器将在[REBOOT_TIME]秒后关闭。角色将在服务器关闭时保存。"))
		CALLBACK("shutdown_world",SECONDS_TO_DECISECONDS(REBOOT_TIME),src,src::shutdown_server())
	else
		broadcast_to_clients(span("notice","因[nice_reason]，服务器将在[REBOOT_TIME]秒后重启。角色将在服务器重启时保存。"))
		CALLBACK("reboot_world",SECONDS_TO_DECISECONDS(REBOOT_TIME),src,src::reboot_server())

	SSdiscord.send_message("Round ended with [length(SSclient.all_clients)] players due to [nice_reason].")

	return TRUE
