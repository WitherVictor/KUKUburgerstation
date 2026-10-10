/vote/continue_round //Vote instance
	name = "继续本回合吗？" //The name of the vote. Usually the question.
	options = list("Yes","No") //Just a list of possible choices.
	option_display_names = list("Yes" = "是","No" = "否")
	time_limit = 60 //In seconds.


/vote/continue_round/on_result(var/winner,var/list/results)

	if(winner == "No")
		world.end()
	else
		SSgamemode.active_gamemode.on_continue()

	return TRUE
