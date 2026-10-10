/vote/mission //Vote instance
	name = "任务类型投票"
	options = list()
	time_limit = 120

	var/list/gamemode_name_to_type = list()
	weighted_mode = TRUE


/vote/mission/New()

	for(var/k in subtypesof(/gamemode/mission))
		var/gamemode/G = k
		if(initial(G.hidden)) continue
		var/game_name = initial(G.name)
		options += game_name
		gamemode_name_to_type[game_name] = G

	return ..()


/vote/mission/on_result(var/winner,var/list/results)

	if(winner)
		SSgamemode.set_active_gamemode(gamemode_name_to_type[winner],"voting on_result")
	else
		broadcast_to_clients(span("danger","投票失败！默认选择第一个选项。"))
		SSgamemode.set_active_gamemode(gamemode_name_to_type[1],"voting on_result")

	return TRUE
