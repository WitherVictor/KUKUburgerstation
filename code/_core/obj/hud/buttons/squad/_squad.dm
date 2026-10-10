/obj/hud/button/squad/main
	name = "小队按钮"
	desc = "这下成《武装突袭》了。"
	desc_extended = "点击此处打开小队菜单。"
	icon = 'icons/hud/hud.dmi'
	icon_state = "squad"
	screen_loc = "LEFT,TOP-2"

	flags_hud = FLAG_HUD_MOB

	alpha = 100

	has_quick_function = FALSE

/obj/hud/button/squad/main/update_icon()

	if(owner && is_player(owner))
		var/mob/living/advanced/player/P = owner
		if(P.current_squad && alpha != 255)
			animate(src,alpha = 255,time=10)
		else if(!P.current_squad && alpha != 100)
			animate(src,alpha = 100,time=10)

	return ..()

/obj/hud/button/squad/main/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_player(activator))
		var/mob/living/advanced/player/P = activator

		if(length(SSsquad.all_squads))

			var/list/squad_table = list()

			squad_table["创建新小队"] = "Create New Squad"

			if(P.current_squad)
				squad_table["离开当前小队"] = "Leave Existing Squad"

			for(var/k in SSsquad.all_squads)
				var/squad/S = k
				var/name_format = "[S.name] ([length(S.members)]/[SQUAD_MEMBERS_MAX])"
				squad_table[name_format] = S

			var/answer = input("你想加入哪个小队？","选择小队",null) as null|anything in squad_table

			if(!P || !answer)
				return FALSE

			if(P.current_squad && squad_table[answer] == "Leave Existing Squad")
				P.current_squad.remove_member(P)
				return ..()

			else if(squad_table[answer] == "Create New Squad")
				new_squad(P)
				return ..()

			else if(answer != "Cancel")
				var/squad/S = squad_table[answer]
				if(S)
					S.add_member(P)
					update_sprite()
				else
					activator.to_chat(span("danger","由于某种原因，该小队不存在。请向 Burger 反馈你无法加入小队 [answer]。"))

		else
			var/list/squad_creation_choices = list("是" = "Yes", "否" = "No", "取消" = "Cancel")
			var/answer = input("目前没有可以加入的小队。你想创建一个小队吗？","创建小队","取消") in squad_creation_choices
			if(answer && squad_creation_choices[answer] == "Yes")
				new_squad(P)


/obj/hud/button/squad/main/proc/new_squad(var/mob/living/advanced/player/P)
	while(P.client)
		var/squad_name = input("请输入小队名称。留空则取消。","创建小队",null) as text|null

		if(squad_name == "Cancel" || squad_name == "Create New Squad" || squad_name == "Cancel")
			P.to_chat(span("danger","你这家伙还挺皮！这个名称无效！"))
			return FALSE

		if(!squad_name)
			return FALSE

		if(P.client)
			squad_name = police_text(P.client,squad_name,check_name=TRUE,check_characters=TRUE,min_length=2,max_length=40)

		if(!squad_name)
			return FALSE

		var/found_name = FALSE
		for(var/k in SSsquad.all_squads)
			var/squad/S = k
			if(S.name == squad_name)
				found_name = TRUE

		if(found_name)
			P.to_chat(span("warning","小队名称“[squad_name]”已被占用！"))
			continue

		var/squad/S = new
		S.name = squad_name
		S.add_member(P)
		S.set_leader(P)
		update_sprite()
		return TRUE

/obj/hud/button/squad/member
	name = "小队成员按钮"
	desc = "代表一名小队成员。"

	icon = 'icons/hud/progress.dmi'
	icon_state = "progress"

	maptext = "成员姓名"
	maptext_width = TILE_SIZE*3
	maptext_y = 8

	screen_loc = "CENTER,CENTER"

	var/mob/living/advanced/player/tracked_mob

/obj/hud/button/squad/member/Destroy()
	tracked_mob = null
	return ..()

/obj/hud/button/squad/member/New(var/desired_loc,var/desired_tracked_mob)
	tracked_mob = desired_tracked_mob
	return ..()

/obj/hud/button/squad/member/update_owner(var/desired_owner)

	. = ..()

	if(.)
		update_sprite()


/obj/hud/button/squad/member/update_underlays()
	. = ..()
	var/icon/I = new(initial(icon),initial(icon_state))
	swap_colors(I)
	underlays += I

/obj/hud/button/squad/member/update_icon()
	. = ..()
	if(tracked_mob && tracked_mob.health)
		var/desired_num = FLOOR((tracked_mob.health.health_current/tracked_mob.health.health_max) * 26, 1)
		icon_state = "bar_[desired_num]"


/obj/hud/button/squad/member/update_sprite()
	maptext = tracked_mob.name
	return ..()
