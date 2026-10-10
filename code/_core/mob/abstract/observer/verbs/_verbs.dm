/mob/abstract/observer/add_inherent_verbs()

	verbs += /mob/abstract/observer/verb/new_character
	verbs += /mob/abstract/observer/verb/load_character
	verbs += /mob/abstract/observer/verb/load_most_recent_character
	verbs += /mob/abstract/observer/verb/become_antagonist


	if(client)
		client.verbs += /client/verb/jump_to_player
		client.verbs += /client/verb/orbit_player
		client.verbs += /client/verb/jump_to_area
		client.verbs += /client/verb/jump_to_mob
		client.verbs += /client/verb/orbit_mob

	return ..()

/mob/abstract/observer/menu/add_inherent_verbs()
	verbs += /mob/abstract/observer/verb/observe
	return ..()

/mob/abstract/observer/verb/observe()
	set name = "Observe"
	set category = "Menu"

	if(!client)
		return FALSE

	var/list/observe_choices = list("是" = "Yes", "否" = "No", "取消" = "Cancel")
	var/decision = input("确定要旁观吗？你随时可以重新加入游戏。","旁观回合？") as null|anything in observe_choices
	if(!decision || observe_choices[decision] != "Yes")
		return FALSE

	if(type == /mob/abstract/observer/ghost)
		to_chat(span("warning","你已经在旁观了！"))
		return FALSE

	make_ghost()
