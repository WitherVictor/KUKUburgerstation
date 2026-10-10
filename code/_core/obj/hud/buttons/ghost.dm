/obj/hud/button/new_character/
	name = "创建新角色"
	desc = ""
	desc_extended = "点击这里创建新角色。"
	icon_state = "new_character"
	screen_loc = "CENTER-0.5,BOTTOM:12"

	flags_hud = FLAG_HUD_MOB

	has_quick_function = FALSE

/obj/hud/button/new_character/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		if(!is_observer(activator))
			activator.to_chat(span("notice","当前已有角色处于载入状态，无法创建新角色！"))
			return TRUE

		if(world_state < STATE_RUNNING)
			activator.to_chat(span("notice","游戏尚未加载完毕！"))
			return TRUE

		var/mob/abstract/observer/O = activator
		O.new_character()


/obj/hud/button/load_character/
	name = "载入已有角色"
	desc = ""
	desc_extended = "点击这里载入已有角色。"
	icon_state = "load_character"
	screen_loc = "CENTER+0.5,BOTTOM:12"

	flags_hud = FLAG_HUD_MOB

	has_quick_function = FALSE

/obj/hud/button/load_character/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		if(!is_observer(activator))
			activator.to_chat(span("notice","当前已有角色处于载入状态，无法载入其他角色！"))
			return TRUE
		if(world_state < STATE_RUNNING)
			activator.to_chat(span("notice","游戏尚未加载完毕！"))
			return TRUE
		if(!allow_loading)
			activator.to_chat(span("danger","服务器正在进行清理，暂时无法载入角色。"))
			return TRUE

		var/mob/abstract/observer/O = activator
		O.load_character()


/obj/hud/button/become_antag/
	name = "成为对抗角色"
	desc = "维护区求救。"
	desc_extended = "条件允许时成为对抗角色。对抗角色可以在任务结束后、回合接近尾声时入场。需要一枚对抗角色代币。"
	icon_state = "become_antag"
	screen_loc = "CENTER+1.5,BOTTOM:12"

	flags_hud = FLAG_HUD_MOB

	has_quick_function = FALSE

/obj/hud/button/become_antag/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(is_observer(activator))
		var/mob/abstract/observer/O = activator
		O.become_antagonist()


/obj/hud/button/teleport_to_player/
	name = "旁观玩家"
	desc = ""
	desc_extended = "点击这里旁观一名玩家。"
	icon_state = "square_round_small"
	screen_loc = "CENTER-1.5,BOTTOM:12"

	flags_hud = FLAG_HUD_MOB

	has_quick_function = FALSE

/obj/hud/button/teleport_to_player/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"ghost_overlay")
	add_overlay(I)

/obj/hud/button/teleport_to_player/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		if(!is_observer(activator))
			activator.to_chat(span("notice","只有旁观者才能这样传送！"))
			return TRUE
		if(world_state < STATE_RUNNING)
			activator.to_chat(span("notice","游戏尚未加载完毕！"))
			return TRUE

		var/list/valid_spectators = list()

		for(var/k in SSliving.all_mobs_with_clients)
			var/mob/M = k
			valid_spectators[M.name] = M

		var/mob/selection = input("你想旁观谁？","选择旁观对象") as null|anything in valid_spectators

		if(selection)
			var/mob/M = valid_spectators[selection]
			activator.to_chat(span("notice","你正在旁观[M.name]。"))
			activator.force_move(M.loc)


/obj/hud/button/dead_ghost/
	name = "离开尸体"
	desc = "再见了，残酷的世界。"
	desc_extended = "点击这里放弃身体，之后可以旁观，或使用原角色或其他角色重新加入回合。注意，成为幽灵后将无法被复活！"
	icon_state = "square_round_small"
	screen_loc = "CENTER,BOTTOM:12+2"

	flags_hud = FLAG_HUD_DEAD

	plane = PLANE_HUD_OBJ

	has_quick_function = FALSE

/obj/hud/button/dead_ghost/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(!. || !activator.client)
		return .

	/* VIRUTAL REALITY
	if(istype(activator,/mob/living/advanced/player/virtual))
		if(!SSvirtual_reality || !SSvirtual_reality.current_virtual_reality)
			return .

		var/mob/living/L = activator

		var/virtual_reality/VR = SSvirtual_reality.current_virtual_reality

		var/list/team_list = VR.teams[L.loyalty_tag]
		if(!length(team_list))
			return FALSE
		team_list = team_list.Copy()
		team_list += "Cancel"

		var/mob/living/desired_spectate = input("Who do you wish to spectate?","Spectate","Cancel") as null|anything in team_list
		if(!desired_spectate || desired_spectate == "Cancel")
			return .

		if(!L.dead || desired_spectate.qdeleting)
			activator.to_chat(span("warning","Failed to spectate."))
			return .

		L.client.spectate(desired_spectate)
		return .
	*/

	activator.client.ghost()


/obj/hud/button/dead_ghost/update_overlays()
	. = ..()
	var/image/I = new/image(initial(icon),"ghost_overlay")
	I.appearance_flags = src.appearance_flags | RESET_COLOR
	add_overlay(I)
