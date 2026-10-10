/dialogue/npc/soldier/

/dialogue/npc/soldier/get_dialogue_options(var/mob/living/advanced/player/P,var/list/known_options)

	var/mob/living/L = P.dialogue_target

	. = list()

	if(L.following) //If we're following someone
		if(L.following == P) //If we're following the person we're talking to.
			.["hello"] = list(
				"等候命令。NEWLINE#1",
				"*stop following me"
			)
			.["*stop following me"] = list(
				"我会在这里等候。NEWLINE#1",
				"*follow me"
			)
		else //If we're following someone else.
			.["hello"] = list(
				"等候命令。NEWLINE#1",
				"*follow me"
			)
			.["*follow me"] = list(
				"我正在执行[L.following.real_name]的命令，不能跟随你。"
			)
	else //We're not following someone.
		.["hello"] = list(
			"等候命令。NEWLINE#1",
			"*follow me"
		)
		if(length(P.followers) < 3) //They have less than 3 followers
			.["*follow me"] = list(
				"我会跟随你。NEWLINE#1",
				"*stop following me"
			)
		else
			.["*follow me"] = list(
				"跟着你的人已经太多了。"
			)

/dialogue/npc/soldier/set_topic(var/mob/living/advanced/player/P,var/topic)

	. = ..()

	if(!is_living(P.dialogue_target)) return

	var/mob/living/L = P.dialogue_target

	if(!L.ai) return

	switch(topic)
		if("*stop following me")
			if(L in P.followers)
				L.ai.set_move_objective(null)
				L.following = null
				P.followers -= L
		if("*follow me")
			if(length(P.followers) < 2 && !L.following)
				P.followers |= L
				L.following = P
				L.ai.set_move_objective(P,2,astar=TRUE,follow=TRUE)


