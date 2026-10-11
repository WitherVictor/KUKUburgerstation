/gamemode/endless
	name = "无尽模式"
	desc = "目前没有任务。想做什么就做什么。"
	hidden = FALSE

	var/last_vote = 0
	var/vote_delay = SECONDS_TO_DECISECONDS(60*60)

	round_time_next = 0

	var/stage = 0
	//0 = starting
	//1 = gearing
	//2 = prepping
	//3 = allowed to launch
	//4 = enemies are spawning
	//5 = voting

	var/status_display_text
	var/status_display_time

	var/pvp_start_time = -1
	var/boredom_warning = FALSE

/gamemode/endless/New()
	. = ..()
	round_time_next = 30


/gamemode/endless/proc/add_objectives()

	var/player_count = length(all_clients)

	log_debug("Current player count: [player_count].")

	//Base Objectives.
	add_objective(/objective/artifact)
	add_objective(/objective/hostage)
	add_objective(/objective/hostage)
	add_objective(/objective/kill_boss)

	if(player_count >= 10)
		add_objective(/objective/hostage)
		log_debug("Adding player count 10 objectives.")

	if(player_count >= 30)
		add_objective(/objective/kill_boss)
		log_debug("Adding player count 30 objectives.")

	if(player_count >= 50)
		add_objective(/objective/kill_boss)
		log_debug("Adding player count 50 objectives.")

	if(player_count >= 70)
		add_objective(/objective/kill_boss)
		log_debug("Adding player count 70 objectives.")

	next_objective_update = world.time + 100
	return TRUE


/gamemode/endless/on_continue()

	add_objective(/objective/artifact)
	add_objective(/objective/kill_boss)

	round_time = 0
	round_time_next = 60*30
	stage = 4

	return ..()

/gamemode/endless/on_life()

	. = ..()

	if(round_time_next > 0 && round_time >= round_time_next)
		round_time = 0
		stage++
		switch(stage)
			if(1)
				status_display_text = "整备"
				round_time_next = 6*60
				announce(
					"中央指挥部任务通告",
					"准备登陆",
					"所有登陆人员立即整备，准备地面作战。穿梭机预计6分钟后启用。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_6_minutes_shuttle.ogg'
				)
			if(2)
				status_display_text = "准备"
				round_time_next = 1*60
				announce(
					"中央指挥部任务通告",
					"空降准备",
					"所有登陆人员立即前往机库，准备空降。穿梭机将在1分钟后获准起飞。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_1_minute_shuttle.ogg'
				)
			if(3)
				status_display_text = "就绪"
				round_time_next = 10
				allow_launch = TRUE
				SShorde.enable = TRUE
				SSevents.enable = TRUE
				announce(
					"中央指挥部任务通告",
					"任务开始",
					"穿梭机整备完毕，可以前往作战区域。全体人员获准出发。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_0_minutes_shuttle.ogg'
				)
			if(4)
				status_display_text = "战斗"
				round_time_next = 60*60
				add_objectives()
			if(5)
				status_display_text = "投票"
				round_time_next = -1
				SSvote.create_vote(/vote/continue_round)

	var/time_left = round_time_next - round_time
	if(time_left >= 0)
		status_display_time = get_clock_time(FLOOR(time_left,1))
	else
		status_display_time = null


	if(status_display_text && status_display_time)
		set_status_display("mission","[status_display_text ? status_display_text : "你好"]\n[status_display_time ? status_display_time : "欢迎"]")
