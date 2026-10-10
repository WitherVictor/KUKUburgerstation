/gamemode/lobby
	name = "大厅"
	desc = "大厅模式。你本不该看到这条信息。"
	hidden = TRUE

	round_time_next = 0

/gamemode/lobby/New()
	. = ..()
	round_time_next = 60 //Wait 60 seconds after load.

/gamemode/lobby/on_life()

	if(state == GAMEMODE_WAITING && round_time_next > 0 && round_time >= round_time_next)
		SSvote.create_vote(/vote/mission)
		round_time_next = -1

	. = ..()
