//Here be shitcode.
//I need to improve this in the future.

SUBSYSTEM_DEF(horde)
	name = "Horde Subsystem"
	desc = "Handles hordes and whatnot."
	priority = SS_ORDER_LAST
	tick_rate = SECONDS_TO_TICKS(1)
	var/round_time = 0 //In seconds.
	var/round_time_next = 0 //In seconds.
	var/state = HORDE_STATE_PRELOAD

	var/list/tracked_enemies = list()

	var/message_displayed = FALSE

	var/list/possible_horde_targets = list()

	var/total_killed_syndicate = 0

	var/next_hijack_check_time = 0

	var/allow_shuttle_launch = FALSE

	var/list/tracked_objectives = list()
	var/list/failed_objectives = list()

	var/objectives_spawned = FALSE
	var/next_objectives_update = -1
	var/completed_objectives = 0
	var/spawned_objectives = 0
	var/last_update = null
	var/round_end_time = -1

	var/next_threat_update = -1
	var/last_threat_level_warning = 0

	tick_usage_max = 50
	cpu_usage_max = 50

/subsystem/horde/proc/on_killed_syndicate(var/mob/living/L)

	if(!(L in tracked_enemies))
		return FALSE

	total_killed_syndicate++
	tracked_enemies -= L

	return TRUE

/subsystem/horde/proc/get_enemies_to_spawn()
	return clamp(10 + FLOOR(DECISECONDS_TO_SECONDS(world.time)/300,1),0,40) - length(tracked_enemies) //One additional enemy every 5 minutes.

/subsystem/horde/proc/check_hijack()

	if(!ENABLE_HIJACK)
		return FALSE

	/*
	var/area/exterior/grass/village/A = all_areas[/area/exterior/grass/village/]
	if(!A)
		log_error("HORDE MODE: Could not find the village area!")
		return FALSE

	var/desired_player_count = 1

	for(var/mob/living/advanced/player/P in A.contents)
		desired_player_count -= 1

	return desired_player_count > 0
	*/


/subsystem/horde/on_life()

	if(next_objectives_update > 0 && next_objectives_update <= world.time)
		next_objectives_update = -1
		update_objectives()

	if(next_threat_update > 0 && next_threat_update <= world.time)
		check_threat_level()
		next_threat_update = world.time + 600

	round_time++

	if(state == HORDE_STATE_WAITING)
		var/time_to_display = round_time_next - round_time
		set_status_display("mission","准备\n[get_clock_time(time_to_display)]")
		if(time_to_display >= 0)
			set_message("本轮开始倒计时：[get_clock_time(time_to_display)]",TRUE)
			return TRUE
		state = HORDE_STATE_GEARING
		round_time = 0
		round_time_next = HORDE_DELAY_GEARING
		announce("中央指挥部通告","准备登陆","所有登陆人员立即整备，准备地面作战。穿梭机预计[CEILING(HORDE_DELAY_GEARING/60,1)]分钟后启用。",ANNOUNCEMENT_STATION,'sound/voice/station/new_command_report.ogg')

	if(state == HORDE_STATE_GEARING)
		var/time_to_display = round_time_next - round_time
		set_status_display("mission","整备\n[get_clock_time(time_to_display)]")
		if(time_to_display >= 0)
			set_message("整备阶段：[get_clock_time(time_to_display)]",TRUE)
			return TRUE
		state = HORDE_STATE_BOARDING
		round_time = 0
		round_time_next = HORDE_DELAY_BOARDING
		announce("中央指挥部通告","登上穿梭机","所有登陆人员立即前往机库，准备搭乘穿梭机。穿梭机将在[CEILING(HORDE_DELAY_BOARDING/60,1)]分钟后获准起飞。任务目标即将公布。",ANNOUNCEMENT_STATION,'sound/voice/station/new_command_report.ogg')
		next_objectives_update = world.time + 100


	if(state == HORDE_STATE_BOARDING)
		var/time_to_display = round_time_next - round_time
		set_status_display("mission","登机\n[get_clock_time(time_to_display)]")
		if(time_to_display >= 0)
			set_message("登机阶段：[get_clock_time(time_to_display)]",TRUE)
			return TRUE
		state = HORDE_STATE_LAUNCHING
		round_time = 0
		round_time_next = HORDE_DELAY_LAUNCHING
		announce("中央指挥部通告","任务开始","穿梭机整备完毕，可以前往辛迪加领地。立即起飞。",ANNOUNCEMENT_STATION,'sound/voice/station/new_command_report.ogg')
		allow_shuttle_launch = TRUE

	if(state == HORDE_STATE_LAUNCHING)
		var/time_to_display = round_time_next - round_time
		set_status_display("mission","出发\n[get_clock_time(time_to_display)]")
		if(time_to_display >= 0)
			set_message("出发阶段：[get_clock_time(time_to_display)]",TRUE)
			return TRUE
		state = HORDE_STATE_FIGHTING
		round_time = 0
		round_time_next = 0
		announce("中央指挥部通告","辛迪加部队来袭","发现敌军正朝布拉沃登陆区进发。准备迎敌。",ANNOUNCEMENT_STATION,'sound/voice/station/new_command_report.ogg')
		next_threat_update = world.time + 100

	return TRUE

/subsystem/horde/proc/find_viable_target()

	var/picks_remaining = 4

	while(picks_remaining > 0)
		CHECK_TICK(tick_usage_max,FPS_SERVER*10)
		picks_remaining--
		var/turf/chosen_target = get_turf(pick(possible_horde_targets))
		if(chosen_target.z != 3)
			continue
		var/obj/marker/map_node/N_end = find_closest_node(get_turf(chosen_target))
		if(!N_end)
			continue
		return N_end

	return null

/subsystem/horde/proc/find_viable_spawn()

	var/picks_remaining = 4

	while(picks_remaining > 0)
		CHECK_TICK(tick_usage_max,FPS_SERVER*10)
		picks_remaining--
		var/turf/chosen_spawn = pick(all_syndicate_spawns)
		if(chosen_spawn.z != 3)
			continue
		var/mob/living/advanced/player/P = locate() in range(VIEW_RANGE + ZOOM_RANGE,chosen_spawn)
		if(P)
			continue
		var/obj/marker/map_node/N_start = find_closest_node(get_turf(chosen_spawn))
		if(!N_start)
			log_error("WARNING: [chosen_spawn.get_debug_name()] didn't have a node to spawn enemies!")
			continue
		return N_start

	return null

/subsystem/horde/Initialize()
	state = HORDE_STATE_WAITING
	round_time = 0
	round_time_next = HORDE_DELAY_WAIT
	return ..()

/subsystem/horde/proc/spawn_objectives(var/artifact_count = 1, var/kill_count = 3, var/rescue_count = 1)

	var/desired_spawn_objectives = min(artifact_count,length(possible_objective_spawns))
	var/desired_kill_objectives = min(kill_count,length(SSbosses.living_bosses))
	var/desired_rescue_objectives = min(rescue_count,length(possible_hostage_spawns),length(possible_hostage_types))

	LOG_DEBUG("Making [desired_spawn_objectives] spawn objectives.")
	LOG_DEBUG("Making [desired_kill_objectives] kill objectives.")
	LOG_DEBUG("Making [desired_rescue_objectives] rescue objectives.")

	for(var/i=1,i<=desired_spawn_objectives,i++)
		var/obj/marker/objective_spawn/S = pick(possible_objective_spawns)
		possible_objective_spawns -= S
		var/turf/T = get_turf(S)
		var/obj/structure/interactive/objective/O = new(T)
		INITIALIZE(O)
		GENERATE(O)
		tracked_objectives += O
		spawned_objectives++

	for(var/i=1,i<=desired_rescue_objectives, i++)
		var/obj/marker/hostage_spawn/S = pick(possible_hostage_spawns)
		possible_hostage_spawns -= S
		var/mob/living/advanced/npc/unique/hostage/L = pick(possible_hostage_types)
		possible_hostage_types -= L
		L = new L(get_turf(S))
		INITIALIZE(L)
		var/obj/item/handcuffs/H = new(get_turf(L))
		INITIALIZE(H)
		GENERATE(H)
		L.set_handcuffs(TRUE,H)
		tracked_objectives += L
		spawned_objectives++

	var/list/valid_boss_ids = list()

	for(var/mob/living/L in SSbosses.living_bosses)
		valid_boss_ids += L.id

	for(var/i=1, i<=desired_kill_objectives, i++)
		CHECK_TICK(tick_usage_max,0)
		var/chosen_id = pick(valid_boss_ids)
		valid_boss_ids -= chosen_id
		var/mob/living/L = SSbosses.tracked_bosses[chosen_id]
		HOOK_ADD("post_death","objective_death",L,src,src::queue_objectives_update())
		tracked_objectives += L
		spawned_objectives++

	objectives_spawned = TRUE

	return TRUE

/subsystem/horde/proc/queue_objectives_update()
	next_objectives_update = world.time + 30
	return TRUE

/subsystem/horde/proc/update_objectives()

	if(state == HORDE_STATE_BREAK)
		return FALSE

	if(!objectives_spawned)
		spawn_objectives()

	var/additional_text = ""

	var/objective_text = ""
	for(var/atom/A in tracked_objectives)
		if(isobj(A))
			var/obj/O = A
			if(istype(O,/obj/structure/interactive/objective))
				objective_text += "回收[O.name]。\[<b>[O.qdeleting ? "已完成" : "进行中"]</b>\]<br>"
			else
				objective_text += "摧毁[O.name]。\[<b>[O.qdeleting ? "已完成" : "进行中"]</b>\]<br>"
			if(O.qdeleting)
				completed_objectives++
				tracked_objectives -= O
		else if(is_living(A))
			var/mob/living/L = A
			if(istype(L,/mob/living/advanced/npc/unique/hostage/))
				var/mob/living/advanced/npc/unique/hostage/H = L
				if(H.qdeleting)
					objective_text += "营救[H.name]。\[<b>失败</b>\]<br>"
					additional_text += "看来船员们搞砸得太彻底，[H.name]连尸体都找不回来了。<br>"
					completed_objectives++
					tracked_objectives -= L
				else
					objective_text += "营救[H.name]。\[<b>[!H.hostage ? "已完成" : "进行中"]</b>\]<br>"
					if(!H.hostage)
						if(H.dead)
							additional_text += "送回来的[H.name]已经死亡。鉴于这场悲剧，船员们无法获得奖金。<br>"
						else
							additional_text += "[H.name]已平安归来，船员们将获得3000信用点奖金。<br>"
							SSpayday.stored_payday += 3000
						completed_objectives++
						tracked_objectives -= L
			else
				objective_text += "击杀[L.name]。\[<b>[L.dead ? "已完成" : "进行中"]</b>\]<br>"
				if(L.dead)
					completed_objectives++
					tracked_objectives -= L

	last_update = objective_text

	for(var/obj/hud/button/objectives/B in all_objective_buttons)
		B.set_stored_text(last_update)
		if(B.owner)
			B.owner.to_chat(span("notice","你的任务目标已更新！"))

	if(additional_text)
		objective_text = "[objective_text]<br>[additional_text]"


	announce(
		"中央指挥部通告",
		"任务目标更新",
		"[objective_text]",
		ANNOUNCEMENT_STATION,
		'sound/voice/station/new_command_report.ogg'
	)

	if(completed_objectives >= spawned_objectives)
		var/possible_spawn_objectives = length(possible_objective_spawns)
		var/possible_kill_objectives = length(SSbosses.living_bosses)

		if(possible_spawn_objectives && possible_kill_objectives)
			state = HORDE_STATE_BREAK
			SSvote.create_vote(/vote/continue_round)
			return TRUE
		else
			broadcast_to_clients(span("vote","已无可生成的任务目标，因此直接结束本轮，无需投票！"))
			tick_rate = 0 //Stop horde processing.
			world.end(WORLD_END_NANOTRASEN_VICTORY)

	return FALSE


//100 equals failure.
//Warns at 75, 50, and 25.
//0 is neutral.
/subsystem/horde/proc/get_threat_level()

	. = 0

	for(var/mob/living/L in tracked_enemies) //Every syndicate in an area that you're supposed to defend increases the threat level by 2, except in cases where they've been dead for less than 60 seconds, which reduces it by 1.
		if(L.dead)
			if(L.time_of_death + 600 >= world.time)
				. -= 1
			continue
		var/area/A = get_area(L)
		if(A && !A.defend)
			continue
		. += 2

	for(var/mob/living/advanced/player/P in all_players) //Every living playing defending reduces the threat level by 1.
		if(P.dead || P.qdeleting)
			continue
		if(istype(P,/mob/living/advanced/player/antagonist/))
			. += 5
			continue
		var/area/A = get_area(P)
		if(!A.defend)
			continue
		. -= 1

	. -= completed_objectives*10 //Every objective completed reduces the threat level by 10.

	. += FLOOR(DECISECONDS_TO_SECONDS(world.time)/60,2) //Every 60 seconds is two points.


/subsystem/horde/proc/check_threat_level()

	var/threat_level = get_threat_level()

	var/reported_threat_level = clamp(round(threat_level,25),0,100)

	if(reported_threat_level != last_threat_level_warning && abs(reported_threat_level - last_threat_level_warning) >= 15)
		var/increase = reported_threat_level > last_threat_level_warning
		last_threat_level_warning = reported_threat_level
		switch(reported_threat_level)
			if(0)
				set_status_display("mission","警报：\n绿色")
				announce("紧急警报系统","威胁已解除","警报：威胁等级设为绿色。演习代号：渐隐。")
			if(25 to 50)
				set_status_display("mission","警报：\n蓝色")
				if(increase)
					announce("紧急警报系统","威胁等级上升","警报：威胁等级升至蓝色。演习代号：再次审视。")
				else
					announce("紧急警报系统","威胁等级下降","警报：威胁等级降至蓝色。演习代号：再次审视。")
			if(50 to 75)
				set_status_display("mission","警报：\n琥珀")
				if(increase)
					announce("紧急警报系统","威胁等级上升","警报：威胁等级升至琥珀色。演习代号：路边酒馆。\n所有地面小队务必集中完成任务目标，并守住阿尔法—布拉沃登陆区。")
				else
					announce("紧急警报系统","威胁等级下降","警报：威胁等级降至琥珀色。演习代号：路边酒馆。\n所有地面小队务必继续专注于任务目标，并守住阿尔法—布拉沃登陆区。")
			if(75 to 99)
				set_status_display("mission","警报：\n红色")
				announce("紧急警报系统","威胁等级上升","警报：威胁等级升至红色。演习代号：马拉松冲刺。任务很可能失败。\n所有地面小队务必集中完成任务目标。违抗命令可能导致信用点损失或死亡。")
			if(100)
				set_status_display("mission","警报：\n黑色")
				announce("紧急警报系统","威胁等级上升","警报：威胁等级升至黑色。演习代号：手枪上膛。任务即将失败。\n正在启动消防员协议，并下达撤离命令。蓝空间炮将在5分钟后上线。")

	return threat_level
