/gamemode/horde/defense
	name = "围攻防守"
	var/current_wave = 1


/gamemode/horde/defense/add_objectives()
	add_objective(/objective/defense)
	next_objective_update = world.time + 100
	return TRUE


/gamemode/horde/defense/on_waiting()
	var/time_to_display = round_time_next - round_time
	set_status_display("mission","准备\n[get_clock_time(time_to_display)]")
	if(time_to_display >= 0)
		set_message("本轮开始倒计时：[get_clock_time(time_to_display)]",TRUE)
		return TRUE
	state = GAMEMODE_GEARING
	round_time = 0
	round_time_next = HORDE_DELAY_GEARING
	SSshuttle.next_pod_launch = world.time + SECONDS_TO_DECISECONDS(60*10 + 10)
	add_objectives()
	announce(
		"中央指挥部通告",
		"准备登陆",
		"所有登陆人员立即整备，准备保护高价值目标。传送门预计5分钟后启用。",
		ANNOUNCEMENT_STATION,
		//'sound/voice/announcement/landfall_crew_8_minutes.ogg'
	)
	return TRUE

/gamemode/horde/defense/on_gearing()
	var/time_to_display = round_time_next - round_time
	set_status_display("mission","整备\n[get_clock_time(time_to_display)]")
	if(time_to_display >= 0)
		set_message("整备阶段：[get_clock_time(time_to_display)]",TRUE)
		return TRUE
	state = GAMEMODE_BOARDING
	round_time = 0
	round_time_next = HORDE_DELAY_BOARDING
	announce(
		"中央指挥部通告",
		"传送门通行",
		"所有登陆人员立即前往机库，准备通过传送门。传送门将在2分钟后获准开启。",
		ANNOUNCEMENT_STATION,
		//'sound/voice/announcement/landfall_crew_2_minutes.ogg'
	)
	return TRUE

/gamemode/horde/defense/on_boarding()
	var/time_to_display = round_time_next - round_time
	set_status_display("mission","传送\n[get_clock_time(time_to_display)]")
	if(time_to_display >= 0)
		set_message("传送阶段：[get_clock_time(time_to_display)]",TRUE)
		return TRUE
	state = GAMEMODE_LAUNCHING
	round_time = 0
	round_time_next = HORDE_DELAY_LAUNCHING
	announce(
		"中央指挥部任务通告",
		"任务开始",
		"传送门已启用，可以前往作战区域。全体人员获准进入。敌对实体将在5分钟后出现。",
		ANNOUNCEMENT_STATION,
		'sound/voice/announcement/landfall_crew_0_minutes.ogg'
	)
	allow_launch = TRUE
	SSshuttle.next_pod_launch = world.time + SECONDS_TO_DECISECONDS(10)
	return TRUE

/gamemode/horde/defense/on_launching()
	var/time_to_display = round_time_next - round_time
	set_status_display("mission","出发\n[get_clock_time(time_to_display)]")
	if(time_to_display >= 0)
		set_message("出发阶段：[get_clock_time(time_to_display)]",TRUE)
		return TRUE
	state = GAMEMODE_FIGHTING
	round_time = 0
	for(var/k in all_fog)
		var/obj/effect/fog_of_war/F = k
		F.remove()
	for(var/objective/O in crew_active_objectives)
		O.on_gamemode_playable()
	return TRUE
