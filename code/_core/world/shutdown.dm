/client/verb/trigger_shutdown()
	set hidden = TRUE
	world.safe_shutdown()
	return TRUE

/world/proc/safe_shutdown()
	var/start_time = world.time
	if(usr)
		broadcast_to_clients("<b>[usr]发起了关服！</b>")
		LOG_ADMIN("Shutdown called by [usr]!")
	broadcast_to_clients("<b>服务器正在关闭……</b>")
	world_state = STATE_SHUTDOWN
	broadcast_to_clients("<b>正在保存所有角色……</b>")
	for(var/mob/living/advanced/player/P in all_players)
		if(P.dead)
			continue
		P.mobdata.save_current_character(force = TRUE)
	broadcast_to_clients("<b>所有角色均已保存。</b>")

	broadcast_to_clients("<b>关服完成，耗时[DECISECONDS_TO_SECONDS(world.time - start_time)]秒。</b>")
	sleep(30)
	del(src)

	return TRUE
