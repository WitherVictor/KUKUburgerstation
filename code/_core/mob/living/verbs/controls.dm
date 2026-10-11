/mob/living/verb/sneak()
	set name = "Toggle Sneak"
	set category = "Game"
	toggle_sneak(!is_sneaking)

/mob/living/verb/suicide()
	set name = "Suicide"
	set category = "Game"

	var/area/A = get_area(src)

	if(A.flags_area & FLAG_AREA_TUTORIAL)
		var/list/creation_choices = list("是"="Yes","否"="No")
		var/question = input("确定要取消角色创建吗？你的角色不会保存，并将从游戏中删除。","取消角色创建") in creation_choices
		question = creation_choices[question]
		if(question == "Yes" && A.flags_area & FLAG_AREA_TUTORIAL)
			make_ghost()
			qdel(src)
			return TRUE
		return FALSE

	var/list/suicide_choices = list("是"="Yes","否"="No","取消"="Cancel")
	var/choice = input("确定要让角色自杀吗？这将使角色无法被救活。","角色自杀","取消") in suicide_choices
	choice = suicide_choices[choice]

	if(dead)
		to_chat(span("danger","你已经死了！"))
		return FALSE

	if(choice == "Yes")
		death(TRUE)
		visible_message(span("danger","[src.name]自杀了！"),span("danger","你自杀了！"))
		suicide = TRUE
		make_unrevivable()

/mob/living/verb/set_intent_harm()
	set category = "Game"
	set hidden = TRUE
	selected_intent = INTENT_HARM
	update_intent()

/mob/living/verb/set_intent_disarm()
	set category = "Game"
	set hidden = TRUE
	selected_intent = INTENT_DISARM
	update_intent()

/mob/living/verb/set_intent_grab()
	set category = "Game"
	set hidden = TRUE
	selected_intent = INTENT_GRAB
	update_intent()

/mob/living/verb/set_intent_help()
	set category = "Game"
	set hidden = TRUE
	selected_intent = INTENT_HELP
	update_intent()

/mob/living/verb/cycle_intent_clockwise()
	set name = "Cycle Intent Clockwise"
	set category = "Game"

	switch(selected_intent)
		if(INTENT_HELP)
			selected_intent = INTENT_DISARM
		if(INTENT_DISARM)
			selected_intent = INTENT_GRAB
		if(INTENT_GRAB)
			selected_intent = INTENT_HARM
		if(INTENT_HARM)
			selected_intent = INTENT_HELP

	update_intent()

/mob/living/verb/cycle_intent_counter_clockwise()
	set name = "Cycle Intent Counter-Clockwise"
	set category = "Game"

	switch(selected_intent)
		if(INTENT_HELP)
			selected_intent = INTENT_HARM
		if(INTENT_DISARM)
			selected_intent = INTENT_HELP
		if(INTENT_GRAB)
			selected_intent = INTENT_DISARM
		if(INTENT_HARM)
			selected_intent = INTENT_GRAB

	update_intent()

