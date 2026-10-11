/client/Stat()

	if(src.mob)
		statpanel("游戏信息")
		var/revision_string
		if(SSlogging.commit == SSlogging.origin_commit)
			revision_string = SSlogging.commit
		else
			revision_string = "[SSlogging.commit]([SSlogging.origin_commit]"
		var/game_info = "回合编号：[SSlogging.round_id ? SSlogging.round_id : "无"]\n构建版本：[SSlogging.version]\n代码修订：[revision_string])"
		if(SSgamemode && SSgamemode.initialized && SSgamemode.active_gamemode)
			game_info = "[game_info]\n[SSgamemode.active_gamemode.objective_text]"
		else
			game_info = "[game_info]\n没有任务目标。"
		stat(game_info)

	return TRUE
