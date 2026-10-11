
/gamemode/nuke_ops/on_life()

	if(time_left > 0)
		time_left--

	if(game_state != 1 && length(active_players) <= 0)
		score = list(
				"NanoTrasen" = 0,
				"Syndicate" = 0
		)
		round = 0
		game_state = 1
		time_left = -1
		return ..()

	switch(game_state)
		if(0)
			set_message("正在设置对局……")
		if(1)
			if(time_left >= 0)
				set_message("对局将在[get_clock_time(time_left)]后开始（[length(teams["Ready"])]名玩家已准备）。")
			else
				set_message("正在等待玩家（[length(teams["Ready"])]/1已准备）……")
		if(2)
			set_message("正在开始对局……")
		if(3)
			set_message("本回合将在[get_clock_time(time_left)]后开始。")
		if(4)
			set_message("采购阶段：[get_clock_time(time_left)]。")
		if(5)
			set_message("纳米传讯：[score["NanoTrasen"]] | [get_clock_time(time_left)] | 辛迪加：[score["Syndicate"]]。")
		if(6)
			set_message("纳米传讯获胜！")
		if(7)
			set_message("辛迪加获胜！")
		if(8)
			set_message("加时赛")


	if(game_state == 1)
		if(length(teams["Ready"]) >= 1)
			if(time_left == -1) time_left = 60
		else
			if(time_left != -1) time_left = -1
		if(time_left == 0)
			round_start()
			return ..()

	if(time_left <= 0)
		switch(game_state)
			if(3)
				time_left = 10
				game_state = 4
				play_sound_global('sound/vr/round_start.ogg',active_players)
			if(4)
				time_left = 600
				game_state = 5
				//play_sound_global('sound/vr/syndicate_objectives.ogg',teams["Syndicate"])
				//play_sound_global('sound/vr/nanotrasen_objectives.ogg',teams["NanoTrasen"])
			if(5)
				if(tracked_nuke && tracked_nuke.nuke_state == 2)
					game_state = 8 //Overtime.
					time_left = 0
					play_sound_global('sound/vr/overtime.ogg',active_players)
				else
					set_winner("NanoTrasen")
			if(6 to 7)
				round_start()

	if(game_state == 5 && !can_play_round())
		for(var/k in active_players)
			var/mob/M = k
			M.to_chat(span("danger","有一队人数不足，正在返回大厅。"))
			on_player_join(M)
		score = list(
				"NanoTrasen" = 0,
				"Syndicate" = 0
		)
		round = 0
		game_state = 1
		time_left = -1

	return TRUE


/gamemode/nuke_ops/proc/check_gamemode_win()

	if(game_state >= 6)
		return FALSE

	if(tracked_nuke.nuke_state >= 2)
		if(tracked_nuke.nuke_state == 4)
			set_winner("Syndicate")
			return TRUE
		else if(tracked_nuke.nuke_state == 3)
			set_winner("NanoTrasen")
			return TRUE
		return FALSE

	if(length(teams["NanoTrasen"]) <= 0)
		set_winner("Syndicate")
		return TRUE
	else if(length(teams["Syndicate"]) <= 0)
		set_winner("NanoTrasen")
		return TRUE

	var/nt_count = 0
	for(var/k in teams["NanoTrasen"])
		var/mob/living/L = k
		if(!L.dead)
			nt_count++
	if(nt_count <= 0)
		set_winner("Syndicate")
		return TRUE

	var/syn_count = 0
	for(var/k in teams["Syndicate"])
		var/mob/living/L = k
		if(!L.dead)
			syn_count++
	if(syn_count <= 0)
		set_winner("NanoTrasen")
		return TRUE
