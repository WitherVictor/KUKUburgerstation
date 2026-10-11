/vote/gamemode //Vote instance
	name = "游戏模式投票" //The name of the vote. Usually the question.
	options = list() //Just a list of possible choices.
	time_limit = 120 //In seconds.

	var/list/gamemode_name_to_type = list()
	weighted_mode = TRUE


/vote/gamemode/New()

	for(var/k in SSgamemode.all_gamemodes)
		var/gamemode/G = k
		if(initial(G.hidden)) continue
		var/game_name = initial(G.name)
		options += game_name
		gamemode_name_to_type[game_name] = G

	return ..()


/vote/gamemode/on_result(var/winner,var/list/results)

	if(winner)
		SSgamemode.set_active_gamemode(gamemode_name_to_type[winner],"voting on_result")
	else
		broadcast_to_clients(span("danger","投票失败！将使用默认围攻模式……"))

	return TRUE
