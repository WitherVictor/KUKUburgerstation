/event/space_cop
	name = "Space Cop Investigation"

	probability = 0 //disabled for now

	occurances_max = 1

	var/obj/shuttle_controller/space_cop/associated_shuttle_controller

	var/space_cops_spawned = 0

	duration = -1

	var/next_recall = 0

	var/recalling = FALSE //In the process of recalling

	var/list/mob/living/tracked_space_cops = list()

/event/space_cop/on_start()

	log_debug("Starting Space Cop Event")

	next_recall = world.time + SECONDS_TO_DECISECONDS(rand(300,600))

	associated_shuttle_controller = locate() in world

	if(!associated_shuttle_controller || associated_shuttle_controller.state != SHUTTLE_STATE_LANDED)
		log_debug("Could not start space cop event, no shuttle controller found.")
		return FALSE

	var/list/valid_chairs = list()

	var/area/A = get_area(associated_shuttle_controller)
	for(var/obj/structure/interactive/chair/C in A.contents)
		valid_chairs += C

	for(var/i=1,i<=rand(6,10),i++)
		CHECK_TICK(50,FPS_SERVER*3)
		if(!length(valid_chairs))
			break
		var/obj/structure/interactive/chair/chosen_chair = pick(valid_chairs)
		valid_chairs -= chosen_chair
		var/turf/T = chosen_chair.loc
		var/mob/living/advanced/npc/space_cop/SP = new(T)
		INITIALIZE(SP)
		GENERATE(SP)
		FINALIZE(SP)
		var/ai/advanced/space_cop/AI = SP.ai
		AI.tracked_event = src
		tracked_space_cops += SP

	announce("太空警察","太空警察调查","我们接到报告，称本地区发生了战争罪行，现前来调查。请勿试图杀害调查人员，妨碍我们开展调查。")

	associated_shuttle_controller.state = SHUTTLE_STATE_WAITING
	associated_shuttle_controller.time = 0

	return ..()

/event/space_cop/on_life()

	. = ..()

	if(recalling)
		var/dead_count = 0
		var/shuttle_count = 0
		for(var/mob/living/L in tracked_space_cops)
			if(L.dead || L.qdeleting || !length(L.ai.current_path))
				dead_count++
				continue
			var/area/A1 = get_area(L)
			var/area/A2 = get_area(associated_shuttle_controller)
			if(A1 == A2)
				shuttle_count++

		if(length(tracked_space_cops) == (dead_count + shuttle_count))
			force_end()
			return TRUE

		if(next_recall + SECONDS_TO_DECISECONDS(300) <= world.time)
			force_end()
			return TRUE
	else
		if(next_recall <= world.time)
			recalling = TRUE

			log_debug("Space Cops event is starting their recall.")

			if(!associated_shuttle_controller)
				log_error("Space Cops  Couldn't find an associated shuttle controller for a return trip!")
				return

			var/obj/marker/map_node/N_end = find_closest_node(associated_shuttle_controller)

			if(!N_end)
				log_error("Space Cops Path Error: Couldn't find closet node to [associated_shuttle_controller] for a return trip!")
				return

			for(var/mob/living/L in tracked_space_cops)
				if(L.qdeleting || L.dead || !L.ai)
					continue

				var/obj/marker/map_node/N_start = find_closest_node(L)
				if(!N_start)
					log_error("Space Cops Path Error: Couldn't find closet node to [L.get_debug_name()]!")
					continue

				var/list/obj/marker/map_node/found_path = N_start.find_path(N_end)
				if(!found_path || !length(found_path))
					log_error("Space Cops Path Error: Couldn't find a path from [L.get_debug_name()] to [associated_shuttle_controller.get_debug_name()]!")
					continue

				L.ai.set_path(found_path)
				L.ai.roam = FALSE

/event/space_cop/on_end()
	log_debug("Ending Space Cop Event")

	var/dead_count = 0
	var/mising_count = 0

	for(var/mob/living/L in tracked_space_cops)
		if(L.dead)
			dead_count++
			continue
		if(L.qdeleting)
			mising_count++
			continue
		var/area/A1 = get_area(L)
		var/area/A2 = get_area(associated_shuttle_controller)
		if(A1 != A2)
			mising_count++
			continue

	var/dead_percentage = FLOOR(dead_count/length(tracked_space_cops),0.01)*100

	var/final_message = ""

	if(dead_count)
		final_message += "我们已完成调查。鉴于我方伤亡率达到[dead_percentage]%，可以确认这里确实发生了战争罪行，主要责任方为[english_list(space_cop_tag_shitlist,"无","、","、","、")]。我们将派遣太空士兵处理此事。"
		if("NanoTrasen" in space_cop_tag_shitlist)
			var/event/E = SSevents.all_events[/event/space_military]
			SSevents.trigger_event(E)
	else
		final_message += "我们已完成调查，确认这里没有发生战争罪行。考虑到纳米传讯以往的记录，这个结果倒是相当奇怪。"
		if(mising_count)
			final_message += "因此，我们会留下一部分调查人员，进一步查明情况。"

	final_message = trim(final_message)

	announce("太空警察","太空警察调查",final_message)

	associated_shuttle_controller.state = SHUTTLE_STATE_WAITING
	associated_shuttle_controller.time = 0

	associated_shuttle_controller = null
	tracked_space_cops.Cut()
	recalling = FALSE
	next_recall = 0
	duration = -1
	space_cops_spawned = 0

	return ..()
