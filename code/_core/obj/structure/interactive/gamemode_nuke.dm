/obj/structure/interactive/nukies_nuke
	name = "核弹"
	desc = "炸弹已安放。"
	desc_extended = "一枚威力强大的核弹。辛迪加需要将其运至指定区域，纳米传讯则要阻止其爆炸。核弹解锁后会固定在原地，启动引爆程序后开始倒计时。"

	icon = 'icons/obj/structure/nuke.dmi'
	icon_state = "base"

	anchored = FALSE
	density = TRUE

	collision_flags = FLAG_COLLISION_WALL

	bullet_block_chance = 0

	var/nuke_state = 0
	//0 = idle
	//1 = unlocked
	//2 = armed
	//3 = disarmed
	//4 = exploded

	var/next_explode = -1

	var/area/nuke_area

/obj/structure/interactive/nukies_nuke/think()

	if(next_explode <= -1)
		return FALSE

	var/time_left = FLOOR(next_explode - world.time,1)

	var/should_play = FALSE
	switch(time_left)
		if(0 to 30)
			should_play = !(time_left % 2)
		if(30 to 100)
			should_play = !(time_left % 5)
		if(100 to 200)
			should_play = !(time_left % 10)
		if(200 to 300)
			should_play = !(time_left % 20)
		if(300 to 600)
			should_play = !(time_left % 25)

	maptext = "<center>[CEILING(time_left/10,1)]</center>"

	if(should_play)
		play_sound('sound/effects/double_beep.ogg',get_turf(src))

	if(next_explode <= world.time)
		nuke_explode()
		return FALSE

	return TRUE

/obj/structure/interactive/nukies_nuke/get_examine_list(var/mob/examiner)
	. = ..()

	if(is_living(examiner))
		var/mob/living/L = examiner
		if(L.loyalty_tag == "Syndicate")
			. += div("notice","[src.name]显示，它只能固定在<b>[nuke_area.name]</b>。")

/obj/structure/interactive/nukies_nuke/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(istype(object,/obj/item/disk/nuke))
		INTERACT_CHECK
		INTERACT_DELAY(20)
		var/mob/living/L = caller

		if(L.loyalty_tag != "Syndicate")
			L.to_chat(span("notice","你不知道该如何使用它！"))
		else if(nuke_state == 0)
			if(can_unlock(L))
				unlock(L)
		else
			caller.to_chat(span("warning","[src.name]已经解锁！"))

		return TRUE

	if(istype(object,/obj/hud/inventory))
		INTERACT_CHECK
		INTERACT_DELAY(10)
		if(nuke_state == 1) //Arm it!
			if(can_arm(caller))
				caller.visible_message(span("danger","[caller.name]开始启动[src.name]的引爆程序！"),span("warning","你开始启动[src.name]的引爆程序！"))
			PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(8),src::arm(),caller)
			PROGRESS_BAR_CONDITIONS(caller,src,src::can_arm(),caller)
		else if(nuke_state == 2) //Disarm it!
			if(can_disarm(caller))
				caller.visible_message(span("danger","[caller.name]开始解除[src.name]的引爆程序！"),span("warning","你开始解除[src.name]的引爆程序！"))
			PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(8),src::disarm(),caller)
			PROGRESS_BAR_CONDITIONS(caller,src,src::can_disarm(),caller)


		return TRUE

/obj/structure/interactive/nukies_nuke/proc/can_unlock(var/mob/living/caller)

	INTERACT_CHECK_NO_DELAY(src)

	if(!istype(SSgamemode.active_gamemode,/gamemode/nuke_ops/))
		return FALSE

	if(nuke_area != get_area(src))
		return FALSE

	return TRUE

/obj/structure/interactive/nukies_nuke/proc/can_disarm(var/mob/living/caller)

	INTERACT_CHECK_NO_DELAY(src)

	if(caller.loyalty_tag != "NanoTrasen")
		return FALSE

	if(nuke_state != 2)
		return FALSE

	return TRUE


/obj/structure/interactive/nukies_nuke/proc/can_arm(var/mob/living/caller)

	INTERACT_CHECK_NO_DELAY(src)

	if(caller.loyalty_tag != "Syndicate")
		return FALSE

	if(nuke_state != 1)
		return FALSE

	return TRUE

/obj/structure/interactive/nukies_nuke/proc/unlock(var/mob/living/caller)
	caller.visible_message(span("danger","[caller.name]解锁了[src.name]！"),span("warning","你解锁了[src.name]。"))
	nuke_state = 1
	anchored = TRUE
	return TRUE

/obj/structure/interactive/nukies_nuke/proc/arm(var/mob/living/caller)
	caller.visible_message(span("danger","[caller.name]启动了[src.name]的引爆程序！"),span("warning","你启动了[src.name]的引爆程序。"))
	nuke_state = 2
	next_explode = world.time + 1200 //Decieconds
	if(istype(SSgamemode.active_gamemode,/gamemode/nuke_ops/))
		var/gamemode/nuke_ops/NO = SSgamemode.active_gamemode
		play_sound_global('sound/vr/bomb_planted_alt.ogg',NO.active_players)
		var/area/A = get_area(src)
		for(var/k in NO.active_players)
			var/mob/living/L = k
			L.to_chat(span("danger","[src.name]已在[A.name]安放！"))
	START_THINKING(src)
	return TRUE

/obj/structure/interactive/nukies_nuke/proc/disarm(var/mob/caller)
	caller.visible_message(span("danger","[caller.name]解除了[src.name]的引爆程序！"),span("warning","你解除了[src.name]的引爆程序。"))
	nuke_state = 3
	if(istype(SSgamemode.active_gamemode,/gamemode/nuke_ops/))
		var/gamemode/nuke_ops/NO = SSgamemode.active_gamemode
		play_sound_global('sound/vr/bomb_disarmed.ogg',NO.active_players)
		NO.check_gamemode_win()
	return TRUE

/obj/structure/interactive/nukies_nuke/proc/nuke_explode()
	visible_message(span("danger","[src.name]爆炸了！"))
	nuke_state = 4
	if(istype(SSgamemode.active_gamemode,/gamemode/nuke_ops/))
		var/gamemode/nuke_ops/NO = SSgamemode.active_gamemode
		NO.check_gamemode_win()
	next_explode = -1
	return TRUE
