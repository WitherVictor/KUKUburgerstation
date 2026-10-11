/ai/advanced/daddy
	var/next_chat_time = 0
	guard = TRUE

/ai/advanced/daddy/handle_current_objectives(var/tick_rate)

	. = ..()

	if(objective_attack && next_chat_time <= world.time)
		var/list/possible_phrases = list(
			"他回来了。",
			"48活力。66耐力。12记忆力。他妈的16力量。",
			"巨人。巨人。巨人。",
			"体力。生命值。耐力。你想要的一切都有。",
			"怎么，有意见？"
		)
		owner.do_say(pick(possible_phrases))
		next_chat_time = world.time + SECONDS_TO_DECISECONDS(5)

/ai/advanced/daddy/attack_message()
	owner.do_say("砰。")
