/gamemode/mission
	name = "任务模式"
	desc = "在太空军抵达之前完成一项重大任务。"
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

	gamemode_horde_data = /horde_data/syndicate

	var/mob/living/interior_corpse_type
	var/mob/living/exterior_corpse_type

	var/list/objectives_left = list()
	var/objectives_max = 2

/gamemode/mission/New()
	var/local_benchmark = true_time()
	log_debug("Spawning missions mobs...")
	. = ..()
	spawn_and_set_enemies()
	if(CONFIG("ENABLE_QUICKSTART", FALSE))
		round_time_next = 1
	else
		round_time_next = 30
	var/benchmark_time = DECISECONDS_TO_SECONDS((true_time() - local_benchmark))
	log_debug("Mission mobs took <b>[benchmark_time]</b> seconds to spawn.")

/gamemode/mission/proc/spawn_and_set_enemies()

	set background = TRUE

	if(!gamemode_horde_data)
		return FALSE

	var/horde_data/HD = SShorde.all_horde_data_types[gamemode_horde_data]

	var/list/area_to_mob_type_whitelist = list()

	var/mission_mobs_created = 0
	for(var/k in mission_mob_markers)
		var/obj/marker/M = k
		if(!M.loc)
			qdel(M)
			CHECK_TICK(50,FPS_SERVER*10)
			continue
		var/turf/T = M.loc
		var/area/A = T.loc

		var/chosen_data
		if(area_to_mob_type_whitelist[A.type])
			chosen_data = area_to_mob_type_whitelist[A.type]
		else if(area_to_mob_type_whitelist[A.parent_type])
			chosen_data = area_to_mob_type_whitelist[A.parent_type]
		else
			chosen_data = pickweight(HD.horde_weights)
			area_to_mob_type_whitelist[A.type] = chosen_data

		if(istext(chosen_data))
			chosen_data = pick(HD.horde_squads[chosen_data])

		var/mob/living/L = new chosen_data(T)
		L.dir = pick(DIRECTIONS_CARDINAL)
		INITIALIZE(L)
		GENERATE(L)
		FINALIZE(L)
		mission_mobs_created++
		qdel(M)
		CHECK_TICK(50,FPS_SERVER*10)

	log_debug("Created [mission_mobs_created] mission mobs.")

	var/corpses_created = 0
	if(interior_corpse_type || exterior_corpse_type)
		for(var/k in corpse_markers)
			var/obj/marker/M = k
			if(!M.loc || !is_turf(M.loc))
				qdel(M)
				CHECK_TICK(50,FPS_SERVER*10)
				continue
			var/turf/T = M.loc
			var/area/A = T.loc
			var/mob/living/advanced/L
			if(A.interior && interior_corpse_type)
				L = new interior_corpse_type(T)
			else
				L = new exterior_corpse_type(T)
			INITIALIZE(L)
			GENERATE(L)
			FINALIZE(L)
			if(!L.has_status_effect(ZOMBIE))
				L.death(silent=TRUE)
				L.enable_chunk_clean = FALSE
				L.make_convincing_corpse()
			L.set_dir(pick(NORTH,EAST,SOUTH,WEST))
			corpses_created++
			qdel(M)
			CHECK_TICK(50,FPS_SERVER*10)

	log_debug("Created [corpses_created] corpses.")





/gamemode/mission/proc/add_objectives()

	var/player_count = length(SSclient.all_clients)

	log_debug("Current player count: [player_count].")

	//Base Objectives.
	objectives_left += /objective/kill_boss

	if(player_count >= 10)
		objectives_left += /objective/kill_rogue
		objectives_left += /objective/hostage
		log_debug("Adding player count 10 objectives.")

	if(player_count >= 30)
		objectives_left += /objective/kill_boss
		log_debug("Adding player count 30 objectives.")

	if(player_count >= 50)
		objectives_left += /objective/kill_boss
		log_debug("Adding player count 50 objectives.")

	if(player_count >= 70)
		objectives_left += /objective/kill_boss
		log_debug("Adding player count 70 objectives.")

	next_objective_update = world.time + 100
	return TRUE


/gamemode/mission/on_continue()


	if(!add_objective(/objective/kill_boss))
		add_objective(/objective/artifact)
		allow_continue = FALSE
	else
		objectives_left += /objective/kill_boss

	objectives_max = 1

	round_time = 0
	round_time_next = 60*30
	stage = 4

	return ..()

/gamemode/mission/proc/announce_lore()
	return TRUE

/gamemode/mission/on_life()

	. = ..()

	if(round_time_next > 0 && round_time >= round_time_next)
		round_time = 0
		stage++
		switch(stage)
			if(1)
				status_display_text = "备装"
				if(CONFIG("ENABLE_QUICKSTART", FALSE))
					round_time_next = 1
					allow_launch = TRUE
					SShorde.enable = TRUE
					SSevents.enable = TRUE
					stage = 3
				else
					round_time_next = 6*60
					announce(
						"中央指挥部任务更新",
						"准备登陆",
						"命令全体登陆船员准备地表作战装备。穿梭机预计将在六分钟后启用。",
						sound_to_play = 'sound/voice/announcement/landfall_crew_6_minutes_shuttle.ogg'
					)
				CALLBACK("\ref[src]_add_objectives",SECONDS_TO_DECISECONDS(10),src,src::add_objectives()) //10 to 60 seconds.
				CALLBACK("\ref[src]_announce_lore",rand(100,600),src,src::announce_lore()) //10 to 60 seconds.
			if(2)
				status_display_text = "准备"
				round_time_next = 1*60
				announce(
					"中央指挥部任务更新",
					"登上空降舱",
					"命令全体登陆船员前往机库，做好空降舱发射准备。一分钟后将准许穿梭机起飞。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_1_minute_shuttle.ogg'
				)
			if(3)
				status_display_text = "就绪"
				round_time_next = 10
				allow_launch = TRUE
				SShorde.enable = TRUE
				SSevents.enable = TRUE
				announce(
					"中央指挥部任务更新",
					"行动开始",
					"穿梭机已准备就绪，可以前往作战区域。准许全体船员出发。",
					sound_to_play = 'sound/voice/announcement/landfall_crew_0_minutes_shuttle.ogg'
				)
			if(4)
				status_display_text = "作战"
				round_time_next = 60*60
			if(5 to INFINITY)
				status_display_text = "投票"
				round_time_next = -1
				if(allow_continue)
					world.end()
				else
					SSvote.create_vote(/vote/continue_round)

	var/time_left = round_time_next - round_time
	if(time_left >= 0)
		status_display_time = get_clock_time(FLOOR(time_left,1))
	else
		status_display_time = null

	if(status_display_text && status_display_time)
		set_status_display("mission","[status_display_text ? status_display_text : "你好"]\n[status_display_time ? status_display_time : "欢迎"]")

	if(stage == 4 && length(crew_active_objectives) <= objectives_max)
		if(length(objectives_left))
			add_objective(objectives_left[1])
			objectives_left.Cut(1,2)
		else
			stage = 5 //No objectives left!
