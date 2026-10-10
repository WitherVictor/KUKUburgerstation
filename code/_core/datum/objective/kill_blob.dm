/objective/kill_blob
	name = "摧毁异形菌毯"
	credit_reward = 1000
	burgerbux_reward = 1
	points_reward = 15

/objective/kill_blob/setup()

	if(!length(possible_blob_locations))
		return FALSE

	return ..()


/objective/kill_blob/get_description()
	return "摧毁[english_list(tracked_atoms,"未知目标","、","、")]。位置：[english_list(get_locations(),"未知","、","、")]。"

/objective/kill_blob/start()
	var/obj/marker/M = pick(possible_blob_locations)
	possible_blob_locations -= M
	var/obj/structure/interactive/blob/core/B = new(get_turf(M))
	B.blob_limit *= 5
	B.fast_grows_left *= 2
	INITIALIZE(B)
	FINALIZE(B)
	tracked_atoms += B
	HOOK_ADD("Destroy","kill_blob_destroy",B,src,src::kill_blob_destroy())
	update()
	return ..()

/objective/kill_blob/proc/kill_blob_destroy(var/obj/structure/interactive/blob/core/B,args)
	update()
	return TRUE

/objective/kill_blob/check_completion()

	for(var/k in tracked_atoms)
		var/obj/structure/interactive/blob/core/B = k
		if(B && !B.qdeleting)
			return ACTIVE

	return COMPLETED
