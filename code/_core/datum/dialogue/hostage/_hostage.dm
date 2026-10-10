/dialogue/npc/hostage/

/dialogue/npc/hostage/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/mob/living/L = P.dialogue_target

	. = list()

	if(L.following) //If we're following someone
		if(L.following == P) //If we're following the person we're talking to.
			.["hello"] = list(
				"我正在跟随你。NEWLINE#1",
				"*Stop following me."
			)
			.["*Stop following me."] = list(
				"我会在这里等候。"
			)
		else //If we're following someone else.
			.["hello"] = list(
				"我正在跟随别人。NEWLINE#1",
				"*Follow me."
			)
			.["*Follow me."] = list(
				"我正在听从[L.following.real_name]的命令，不能跟随你。"
			)
	else //We're not following someone.
		.["hello"] = list(
			"我现在没有跟随任何人。NEWLINE#1",
			"*Follow me."
		)
		if(length(P.followers) < 2) //They have less than 2 followers
			.["*Follow me."] = list(
				"我会跟随你。"
			)
		else
			.["*Follow me."] = list(
				"已经有人跟着你了。"
			)

/dialogue/npc/hostage/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	var/mob/living/advanced/npc/hostage/L = P.dialogue_target

	if(!L.ai) return

	if(L.hostage)
		switch(topic)
			if("*Stop following me.")
				if(L in P.followers)
					L.ai.set_move_objective(null)
					L.following = null
					P.followers -= L
			if("*Follow me.")
				if(length(P.followers) < 2 && !L.following)
					P.followers += L
					L.ai.set_move_objective(P,2,astar=TRUE,follow=TRUE)
					L.following = P
