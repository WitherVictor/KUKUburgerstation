/client/verb/jump_to_player()
	set name = "Jump to Player"
	set category = "View"

	//sortTim(SSliving.all_mobs_with_clients,/proc/cmp_path_asc)

	var/mob/choice = input("你想跳转到谁身边？","跳转到角色") as null|mob in SSliving.all_mobs_with_clients
	if(!choice || choice == mob)
		to_chat(span("warning","选择的角色无效。"))
		return FALSE

	if(is_living(mob))
		if(!(permissions & FLAG_PERMISSION_MODERATOR) && !(permissions & FLAG_PERMISSION_ADMIN))
			to_chat(span("warning", "活着的玩家不能使用幽灵命令。"))
			return FALSE
		to_chat(span("notice", "ADMIN: Skipping living player safety check."))

	var/turf/T = get_turf(choice)
	if(!T)
		to_chat(span("warning","目标所在的地块无效。"))
		return FALSE

	mob.force_move(T)

	to_chat(span("notice","你已跳转到[choice]所在的位置。"))
	if(is_living(mob))
		log_admin("[src.get_debug_name()] jumped to [choice.get_debug_name()]'s (mob) location.")

/client/verb/jump_to_mob()
	set name = "Jump to Mob"
	set category = "View"

	//sortTim(SSliving.all_mobs,/proc/cmp_path_asc)

	var/mob/choice = input("你想跳转到谁身边？","跳转到角色") as null|mob in SSliving.all_mobs
	if(!choice || choice == mob)
		to_chat(span("warning","选择的角色无效。"))
		return FALSE

	if(is_living(mob))
		if(!(permissions & FLAG_PERMISSION_MODERATOR) && !(permissions & FLAG_PERMISSION_ADMIN))
			to_chat(span("warning", "活着的玩家不能使用幽灵命令。"))
			return FALSE
		to_chat(span("notice", "ADMIN: Skipping living player safety check."))

	var/turf/T = get_turf(choice)
	if(!T)
		to_chat(span("warning","地块无效。"))
		return FALSE

	mob.force_move(T)

	to_chat(span("notice","你已跳转到[choice]所在的位置。"))
	if(is_living(mob))
		log_admin("[mob.get_debug_name()] jumped to [choice.get_debug_name()]'s location.")

/client/verb/jump_to_client() // Admin-only
	set name = "Jump to Client"
	set category = "View"

	var/valid_choices = list()
	for(var/k in SSliving.all_mobs_with_clients)
		var/mob/M = k
		if(!M.client)
			continue
		valid_choices[M.client] = M
	valid_choices["Cancel"] = "Cancel"

	var/choice = input("Which client do you wish to jump to?","Jump to Client","Cancel") as null|anything in valid_choices

	if(!choice || choice == "Cancel")
		src.to_chat(span("notice","You decide not to jump to anyone."))
		return FALSE

	var/mob/M = valid_choices[choice]

	if(!M)
		src.to_chat(span("warning","Invalid mob."))
		return FALSE

	var/turf/T = get_turf(M)

	if(!T)
		src.to_chat(span("warning","Invalid turf."))
		return FALSE

	mob.force_move(T)

	to_chat(span("notice","You jumped to [M.client]'s location."))
	if(is_living(mob))
		log_admin("[src.get_debug_name()] jumped to [M.get_debug_name()]'s location.")

/client/verb/orbit_player()
	set name = "Orbit Player"
	set category = "View"

	var/mob/choice = input("你想跟随旁观谁？","跟随旁观角色") as null|mob in SSliving.all_mobs_with_clients
	if(!choice || choice == mob)
		to_chat(span("warning","选择的角色无效。"))
		return FALSE

	if(is_living(mob))
		to_chat(span("warning","活着的角色不能跟随旁观。"))
		return FALSE

	var/turf/T = get_turf(choice)
	if(!T)
		to_chat(span("warning","地块无效。"))
		return FALSE

	if(mob.observing)
		mob.observing.observers -= src
		mob.observing = null

	mob.force_move(T)
	choice.observers += mob
	mob.observing = choice

	to_chat(span("notice","你正在跟随旁观[choice]。"))

/client/verb/orbit_mob()
	set name = "Orbit Mob"
	set category = "View"

	//sortTim(SSliving.all_mobs,/proc/cmp_path_asc)

	var/mob/choice = input("你想跟随旁观谁？","跟随旁观角色") as null|mob in SSliving.all_mobs
	if(!choice || choice == mob)
		to_chat(span("warning","角色无效。"))
		return FALSE

	if(is_living(mob))
		to_chat(span("warning","活着的角色不能跟随旁观。"))
		return FALSE

	var/turf/T = get_turf(choice)
	if(!T)
		to_chat(span("warning","地块无效。"))
		return FALSE

	if(mob.observing)
		mob.observing.observers -= src
		mob.observing = null

	mob.force_move(T)
	choice.observers += mob
	mob.observing = choice

	to_chat(span("notice","你正在跟随旁观[choice]。"))

/client/verb/jump_to_area()
	set name = "Jump to Area"
	set category = "View"

	var/list/coverted_choice = list()
	for(var/k in SSarea.all_areas)
		var/area/A = SSarea.all_areas[k]
		coverted_choice["[A]"] = A

	var/choice = input("你想跳转到哪个区域？","跳转到区域") as null|anything in coverted_choice
	if(!choice)
		to_chat(span("warning","区域无效。"))
		return FALSE

	if(is_living(mob))
		if(!(permissions & FLAG_PERMISSION_MODERATOR) && !(permissions & FLAG_PERMISSION_ADMIN))
			to_chat(span("warning", "活着的玩家不能使用幽灵命令。"))
			return FALSE
		to_chat(span("notice", "ADMIN: Skipping living player safety check."))

	var/area/A = coverted_choice[choice]

	var/turf/T = locate(A.average_x,A.average_y,A.z)
	if(!T)
		to_chat(span("warning","地块无效。"))
		return FALSE

	mob.force_move(T)

	to_chat(span("notice","你已跳转到[A]所在的位置。"))
	log_admin("[src] jumped to [A]'s (area) location.")

/client/verb/view_map()
	set name = "View Map"
	set category = "View"

	var/obj/hud/button/map_background/M_control = locate() in mob.buttons

	if(!mob)
		return

	if(M_control)
		M_control.update_owner(null)
		src.to_chat(span("notice","你关闭了地图。"))
	else
		M_control = new(mob)
		M_control.update_owner(mob)
		src.to_chat(span("notice","你打开了地图。"))
