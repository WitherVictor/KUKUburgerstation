/dialogue/npc/burger_challenge


/dialogue/npc/burger_challenge/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	. = list()

	if(SSgamemode.active_gamemode && SSgamemode.active_gamemode.round_time_next > 0 && istype(SSgamemode.active_gamemode,/gamemode/mission))

		.["hello"] = list(
			"嘘。嘿，说你呢。想来个#1吗？",
			"*challenge"
		)

		.["*challenge"] = list(
			"对，一个挑战。街上的酷小子都管它叫“#1”，听着很酷，对吧？",
			"*burger challenge"
		)

		.["*burger challenge"] = list(
			"你问汉堡挑战是什么？就是我会抢走你身上穿戴的全部装备，再把你传送到任务区域的一个完全随机的位置。听起来很酷吧？要#1吗？",
			"take the burger challenge"
		)

		.["take the burger challenge"] = list(
			"这是最后的反悔机会！"
		)

	else

		.["hello"] = list(
			"嘘，等任务公布后再来找我"
		)

/dialogue/npc/burger_challenge/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(topic == "take the burger challenge")
		var/menu/M = get_menu(/menu/dialogue/)
		M.close(P)
		var/list/challenge_choices = list("耶稣啊，一切交给你了！" = "Jesus take the wheel!","想都别想，哈哈" = "NO WAY LOL","取消" = "Cancel")
		var/choice = input(
			P,
			"确定要接受汉堡挑战吗？你当前穿戴和手持的所有装备都将永久丢失，而你会被传送到任务区域内一个随机且可能不安全的位置。继续吗？",
			"最后的机会",
			"取消",
		) as null|anything in challenge_choices
		if(choice && challenge_choices[choice] == "Jesus take the wheel!" && P.dialogue_target && P.dialogue_target.type == /mob/living/advanced/npc/unique/burger_challenge && get_dist(P,P.dialogue_target) <= 2)
			var/turf/T = find_safe_turf_for_event(attempts = 10)
			if(!T)
				P.to_chat(span("warning","出了点问题……"))
				return .
			spawn
				P.force_move(T)
				P.strip_and_delete_items()
				P.to_chat(span("notice","不知怎么的，你来到了这里，浑身赤裸，所有物品都没了。干得漂亮。"))
			return TRUE



