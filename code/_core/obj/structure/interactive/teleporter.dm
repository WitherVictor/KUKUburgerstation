/obj/structure/interactive/teleporter
	name = "传送机"
	desc = "斯科蒂，把我传送上去！"
	desc_extended = "一台利用近乎瞬时的分子中继，将人或物品传送下去或接收上来的机器。"
	icon = 'icons/obj/structure/telesciencepads.dmi'
	icon_state = "pad-idle"
	var/teleport_cooldown = 0

/obj/structure/interactive/teleporter/clicked_on_by_object(mob/activator, atom/object, location, control, params)

	INTERACT_CHECK
	INTERACT_DELAY(10)
	SPAM_CHECK(10)

	if(!SSgamemode.active_gamemode.allow_launch)
		activator.to_chat(span("warning","传送机还在准备中，请等到获准使用！"))
		return FALSE
	if(teleport_cooldown > world.time)
		activator.to_chat(span("warning","传送机仍在冷却，请稍候再使用！"))
		return FALSE
	if(!length(SSobj.gps_list))
		activator.to_chat(span("warning","当前没有启用的GPS，请稍后再试！"))
		return FALSE
	var/list/teleport_choices = list("发送" = "Send", "接收" = "Receive", "取消" = "Cancel")
	var/choice1 = input("发送还是接收？", "传送方向") in teleport_choices|null
	choice1 = teleport_choices[choice1]
	if(choice1 == "Cancel")
		activator.to_chat(span("notice","你决定不使用传送机。"))
		return FALSE
	var/obj/item/analyzer/gps/choice2 = input("选择用于提供坐标的GPS。", "选择GPS") as null|anything in SSobj.gps_list
	if(!choice2)
		return
	if(choice2.assigned_passkey && choice2.secure)
		var/passwordcheck = input("输入这台GPS的密码。","GPS密码") as null|password
		if(passwordcheck != choice2.assigned_passkey)
			activator.to_chat(span("notice","密码错误。"))
			return FALSE
	var/turf/gpsTURF = get_turf(choice2)
	var/turf/srcTURF = get_turf(src)
	var/turf/activatorTURF = get_turf(activator)
	if(!gpsTURF)
		activator.to_chat(span("warning","这台GPS目前不可用，请稍后再试！"))
		return FALSE
	if(teleport_cooldown > world.time)
		return FALSE
	if(get_dist(srcTURF, activatorTURF) > 1)
		return FALSE
	var/item_counter = 0
	var/second_cooldown = 0
	switch(choice1)
		if("Send")
			for(var/atom/movable/A in srcTURF.contents)
				if(item_counter >= 25)
					break
				if(A.anchored)
					continue
				if(is_living(A))
					var/mob/living/aLiving = A
					if(aLiving.boss)
						continue
					if(!aLiving.health)
						continue
					if(aLiving.ckey_last)
						second_cooldown += 15
					second_cooldown += 3
				if(istype(A, /obj/structure/interactive/crate))
					second_cooldown += 8
				play_sound('sound/effects/sparks4.ogg',get_turf(A),range_max=VIEW_RANGE)
				A.force_move(gpsTURF)
				play_sound('sound/effects/sparks4.ogg',get_turf(A),range_max=VIEW_RANGE)
				item_counter++
				second_cooldown += 2
		if("Receive")
			for(var/atom/movable/A in gpsTURF.contents)
				if(item_counter >= 25)
					break
				if(A.anchored)
					continue
				if(is_living(A))
					var/mob/living/aLiving = A
					if(aLiving.boss)
						continue
					if(!aLiving.health)
						continue
					if(aLiving.ckey_last)
						second_cooldown += 15
					second_cooldown += 3
				if(istype(A, /obj/structure/interactive/crate))
					second_cooldown += 8
				play_sound('sound/effects/sparks4.ogg',get_turf(A),range_max=VIEW_RANGE)
				A.force_move(srcTURF)
				play_sound('sound/effects/sparks4.ogg',get_turf(A),range_max=VIEW_RANGE)
				item_counter++
				second_cooldown += 2
	teleport_cooldown = world.time + SECONDS_TO_DECISECONDS(second_cooldown)
	flick(icon, "pad-beam")
