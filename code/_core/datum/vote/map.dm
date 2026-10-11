/vote/map //Vote instance
	name = "地图投票" //The name of the vote. Usually the question.
	options = list() //Just a list of possible choices.
	option_display_names = list("Island" = "海岛")
	time_limit = 30 //In seconds.

/vote/map/New()

	for(var/k in horde_maps)
		options += k

	return ..()


/vote/map/on_result(var/winner,var/list/results)

	if(!winner)
		broadcast_to_clients(span("danger","投票失败！将使用默认地图“海岛”……"))
		winner = "Island"

	rustg_file_write(winner,NEXT_MAP_FILE)

	return TRUE
