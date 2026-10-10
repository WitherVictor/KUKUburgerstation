/client/verb/ghost()
	set name = "Ghost"
	set desc = "放弃身体，成为幽灵。"
	set category = "Game"

	if(is_player(mob))
		var/mob/living/advanced/player/P = mob
		if(P.allow_save)
			var/obj/structure/interactive/bed/sleeper/S = locate() in P.loc.contents
			var/in_sleeper = istype(S,/obj/structure/interactive/bed/sleeper/cryo/no_spawn) || istype(S,/obj/structure/interactive/bed/sleeper/cryo)
			if(in_sleeper)
				var/list/confirmation_choices = list("是" = "Yes","否" = "No")
				var/choice = input("确定要保存角色并进入冷冻休眠吗？你的物品和角色都会保存。","冷冻休眠","否") in confirmation_choices | null
				if(choice && confirmation_choices[choice] == "Yes")
					if(P.dead)
						return FALSE
					var/savedata/client/mob/mobdata = MOBDATA(ckey)
					if(mobdata)
						mobdata.save_character(P)
					P.make_ghost()
					qdel(P)
					return TRUE
				return FALSE

	if(!mob || !is_living(mob))
		to_chat(span("warning","你没有可以放弃的身体！"))
		return FALSE

	var/mob/living/L = mob

	if(!L.dead)
		to_chat(span("warning","活着时不能放弃身体！"))
		return FALSE

	var/list/confirmation_choices = list("是" = "Yes","否" = "No")
	var/choice = input("确定要放弃身体，成为幽灵吗？这样做之后，你将无法再被复活。","放弃身体","否") in confirmation_choices | null
	if(!choice || confirmation_choices[choice] != "Yes")
		return FALSE

	L.make_unrevivable()

	return TRUE


/client/verb/stop_sound()
	set name = "Stop Sounds"
	set category = "Game"
	mob << sound(null)
	to_chat(span("warning","已停止播放所有声音。"))


/client/verb/check_objectives()
	set name = "Check Objectives"
	set category = "Game"

	if(!SSgamemode || !SSgamemode.active_gamemode)
		to_chat(span("warning","游戏尚未准备就绪！"))
		return FALSE

	if(!mob)
		to_chat(span("warning","你没有控制有效的角色！"))
		return FALSE


	var/display_crew_objectives = is_observer(mob) || !istype(mob,/mob/living/advanced/player/antagonist/)
	var/display_antagonist_objectives = is_observer(mob) || istype(mob,/mob/living/advanced/player/antagonist/)

	var/gamemode/G = SSgamemode.active_gamemode

	if(display_crew_objectives)
		to_chat("<br><h2>进行中的船员目标</h2>")
		if(length(G.crew_active_objectives))
			for(var/k in G.crew_active_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有进行中的船员目标。")

		to_chat("<br><h2>已完成的船员目标</h2>")
		if(length(G.crew_completed_objectives))
			for(var/k in G.crew_completed_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有已完成的船员目标。")

		to_chat("<br><h2>失败的船员目标</h2>")
		if(length(G.crew_failed_objectives))
			for(var/k in G.crew_failed_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有失败的船员目标。")

	if(display_antagonist_objectives)
		to_chat("<br><h2>进行中的对抗角色目标</h2>")
		if(length(G.antagonist_active_objectives))
			for(var/k in G.antagonist_active_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有进行中的对抗角色目标。")

		to_chat("<br><h2>已完成的对抗角色目标</h2>")
		if(length(G.antagonist_completed_objectives))
			for(var/k in G.antagonist_completed_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有已完成的对抗角色目标。")

		to_chat("<br><h2>失败的对抗角色目标</h2>")
		if(length(G.antagonist_failed_objectives))
			for(var/k in G.antagonist_failed_objectives)
				var/objective/O = k
				to_chat(O.get_description())
		else
			to_chat("没有失败的对抗角色目标。")



	return TRUE

/client/verb/examine_atom(var/atom/A as anything)
	set name = "Examine"
	set category = "Game"
	if(!A) return
	return examine(A)
