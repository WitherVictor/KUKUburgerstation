/mob/living/advanced/player/proc/try_logout()

	var/savedata/client/mob/mobdata = MOBDATA(ckey_last)

	if(!loc || !client || !mobdata)
		return FALSE

	var/area/A = get_area(src)

	if(world_state >= STATE_ROUND_END)
		src.to_chat(span("warning","回合已结束，现在无法退出！你很快会自动退出。"))
		return FALSE

	if(world_state != STATE_RUNNING)
		src.to_chat(span("warning","游戏尚未运行，现在无法退出！"))
		return FALSE

	if(!buckled_object && tutorial && A.flags_area & FLAG_AREA_TUTORIAL)
		var/list/creation_choices = list("是" = "Yes","否" = "No")
		var/question = input("确定要取消角色创建吗？该角色不会被保存，并将从游戏中删除。","取消角色创建") in creation_choices
		if(question && creation_choices[question] == "Yes" && A.flags_area & FLAG_AREA_TUTORIAL)
			make_ghost()
			qdel(src)
			return TRUE
	else if(can_save(A))
		var/list/logout_choices = list("是" = "Yes","否" = "No","取消" = "Cancel")
		var/question = input("确定要保存并退出吗？","保存并退出") as null|anything in logout_choices
		if(question && logout_choices[question] == "Yes" && can_save(A))
			if(world_state >= STATE_ROUND_END)
				src.to_chat(span("warning","回合已结束，现在无法退出！你很快会自动退出。"))
				return FALSE
			if(world_state != STATE_RUNNING)
				src.to_chat(span("warning","游戏尚未运行，现在无法退出！"))
				return FALSE
			force_logout()
			return TRUE

	return FALSE


