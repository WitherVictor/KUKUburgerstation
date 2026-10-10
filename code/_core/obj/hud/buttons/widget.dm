/obj/hud/button/widget/

	name = "控件"

	essential = TRUE

	flags_hud = FLAG_HUD_WIDGET

	mouse_opacity = 1

	icon = 'icons/hud/hud.dmi'

	has_quick_function = FALSE

/obj/hud/button/widget/experience
	name = "查看经验"
	desc_extended = "点击此处查看角色的经验。"
	icon_state = "xp_new"
	screen_loc = "RIGHT-1,TOP"

/obj/hud/button/widget/experience/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))

		var/final_text = list()

		var/mob/living/L = activator

		var/job/J
		var/job_rank = 0
		if(is_player(L))
			var/mob/living/advanced/player/P = L
			J = JOB(P.job)
			if(J)
				job_rank = P.job_rank
				final_text += div("bold underlined","岗位：\n")
				final_text += div("notice","[J.get_rank_title(job_rank)]（职级：[job_rank]）\n")

		final_text += div("bold underlined","属性\n")
		for(var/k in L.attributes)
			var/experience/attribute/A = L.attributes[k]
			var/current_level = A.get_current_level()
			var/current_xp = A.get_xp()
			var/last_xp = A.level_to_xp(current_level)
			var/next_xp = A.level_to_xp(min(current_level+1,A.get_max_level()))
			var/information_link = "<a href='?examine=\ref[A]'>?</a>"
			var/bonus = L.get_mob_value(k)
			if(J && J.bonus_attributes[k])
				bonus += J.bonus_attributes[k]*job_rank
			if(bonus)
				bonus = "<b>(+[bonus])</b>"
			else
				bonus = ""
			if(next_xp - last_xp > 0)
				final_text += div("notice","[A.name] ([information_link]): [A.get_current_level(current_level)][bonus]（[current_xp - last_xp]/[next_xp - last_xp] 经验）")
			else
				final_text += div("notice","[A.name] ([information_link]): <b>[A.get_current_level(current_level)][bonus]</b>")

		final_text += div("bold underlined","技能\n")
		for(var/k in L.skills)
			var/experience/skill/A = L.skills[k]
			var/current_level = A.get_current_level()
			var/current_xp = A.get_xp()
			var/last_xp = A.level_to_xp(current_level)
			var/next_xp = A.level_to_xp(min(current_level+1,A.get_max_level()))
			var/information_link = "<a href='?examine=\ref[A]'>?</a>"
			var/prestige_text = ""
			var/bonus = L.get_mob_value(k)
			if(J && J.bonus_skills[k])
				bonus += J.bonus_skills[k]*job_rank
			if(bonus)
				bonus = "<b>(+[bonus])</b>"
			else
				bonus = ""
			if(is_player(L))
				var/mob/living/advanced/player/P = L
				if(P.prestige_count[k])
					prestige_text = " 转生 [P.prestige_count[k]]\Roman"

			if(next_xp - last_xp > 0)
				final_text += div("notice","[A.name] ([information_link]): [A.get_current_level(current_level)][bonus][prestige_text]（[current_xp - last_xp]/[next_xp - last_xp] 经验）")
			else
				final_text += div("notice","[A.name] ([information_link]): <b>[A.get_current_level(current_level)][bonus][prestige_text]</b>")

		for(var/k in final_text)
			L.to_chat(k)


/obj/hud/button/widget/logout
	name = "退出角色"
	desc_extended = "点击此处让角色退出。你只能在休眠舱内退出。退出后，随时可以选择原角色或新角色重新加入。"
	icon_state = "logout_new"
	screen_loc = "RIGHT,TOP"

/obj/hud/button/widget/logout/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_player(activator))
		var/mob/living/advanced/player/P = activator
		P.try_logout()


/obj/hud/button/widget/change_theme
	name = "更改主题"
	desc_extended = "点击此处更改状态界面的主题。"
	icon_state = "theme_new"
	screen_loc = "RIGHT-2,TOP"

/obj/hud/button/widget/change_theme/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	if(!is_player(activator))
		return ..()

	var/mob/living/advanced/player/P = activator

	if(/obj/hud/button/close_color_scheme in P.buttons)
		return ..()

	P.add_color_scheme_buttons()

	return ..()


/obj/hud/button/widget/view_map
	name = "查看地图"
	desc_extended = "点击此处查看当前层的地图。"
	icon_state = "map_new"
	screen_loc = "RIGHT-3,TOP"

/obj/hud/button/widget/view_map/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	var/obj/hud/button/map_background/M_control = locate() in activator.buttons

	if(M_control)
		M_control.update_owner(null)
		activator.to_chat(span("notice","你关闭了地图。"))
	else
		M_control = new(activator)
		M_control.update_owner(activator)
		activator.to_chat(span("notice","你打开了地图。"))
