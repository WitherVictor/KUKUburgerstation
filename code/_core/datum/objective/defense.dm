/objective/defense
	name = "保卫超物质"

	var/obj/structure/interactive/supermatter/defend

	credit_reward = 1000
	burgerbux_reward = 1
	points_reward = 10

/objective/defense/on_gamemode_playable()

	announce(
		"中央指挥部任务更新",
		"超物质防卫",
		"我们的蓝空间驱动器已准备就绪，待超物质晶体吸收足够的发射器能量后即可将其传送。请启用发射器，开始充能。",
		ANNOUNCEMENT_STATION
	)

	var/gamemode/G = SSgamemode.active_gamemode

	if(istype(G,/gamemode/horde))
		var/gamemode/horde/H = G
		H.priority_targets |= defend

	return ..()

/objective/defense/proc/get_valid_targets()
	return list(defend)

/objective/defense/proc/has_valid_targets()
	return length(defend) ? TRUE : FALSE

/objective/defense/proc/get_random_target()

	var/list/valid_targets = get_valid_targets()

	if(!length(valid_targets))
		return FALSE

	return pick(valid_targets)

/objective/defense/get_description()
	return "保卫[english_list(tracked_atoms,"未知目标","、","、")]，直到我们能将其安全传送。位置：[english_list(get_locations(),"未知","、","、")]。"

/objective/defense/setup()
	if(!length(possible_supermatter_spawns))
		log_error("No supermatter spawns found for defense objective!")
		return FALSE
	var/obj/marker/S = pick(possible_supermatter_spawns)
	possible_supermatter_spawns -= S
	defend = new /obj/structure/interactive/supermatter(get_turf(S))
	INITIALIZE(defend)
	GENERATE(defend)
	FINALIZE(defend)
	return TRUE

/objective/defense/check_completion()

	if(defend.qdeleting)
		if(defend.charge >= defend.charge_max)
			return COMPLETED
		else
			return FAILED

	return ..()

/objective/defense/proc/defense_Destroy(var/obj/structure/interactive/supermatter/S,args)
	update()
	return TRUE

/objective/defense/start()
	HOOK_ADD("Destroy","defense_Destroy",defend,src,src::defense_Destroy())
	tracked_atoms += defend
	return TRUE
