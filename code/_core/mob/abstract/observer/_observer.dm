/mob/abstract/observer/
	name = "旁观者"
	desc = "永受诅咒，靠满腔怨气维系灵魂。"
	desc_extended = "在这个世界死去的人会变成这样的存在，随后复活，再一次又一次地死去。"
	icon = 'icons/mob/abstract/ghosts.dmi'
	icon_state = "basic"

	invisibility = INVISIBLITY_GHOST
	see_invisible = INVISIBLITY_GHOST

	layer = LAYER_GHOST

	movement_delay = 1

	var/list/spawning_buttons = list()

	collision_flags = FLAG_COLLISION_ETHEREAL
	collision_bullet_flags = FLAG_COLLISION_BULLET_NONE

	damage_type = null //Just in case.

	sight = SEE_THRU | SEE_PIXELS

/mob/abstract/observer/on_left_click(var/atom/object,location,control,params)
	if(src.click_on_object(src,object,location,control,params))
		return TRUE
	if(object.clicked_on_by_object(src,src,location,control,params))
		return TRUE
	return ..()

/mob/abstract/observer/on_right_click(var/atom/object,location,control,params)
	return on_left_click(object,location,control,params)

/mob/abstract/observer/on_right_down(var/atom/object,location,control,params)
	return on_left_click(object,location,control,params)

/mob/abstract/observer/on_left_down(var/atom/object,location,control,params)
	return on_left_click(object,location,control,params)

/mob/abstract/observer/can_attack(var/atom/attacker,var/atom/victim,var/atom/weapon,var/params,var/damagetype/damage_type)
	return FALSE

/mob/abstract/observer/can_be_attacked(var/atom/attacker,var/atom/weapon,var/params,var/damagetype/damage_type)
	return FALSE

/mob/abstract/observer/Logout()
	. = ..()
	if(src.qdeleting)
		return .
	qdel(src)

/mob/abstract/observer/Initialize()

	. = ..()

	if(!client)
		qdel(src)
		CRASH("Tired to initialize an observer without a client!")

	name = "[ckey]的幽灵"

	for(var/v in spawning_buttons)
		var/obj/hud/button/B = new v(src)
		B.update_owner(src)

	to_chat(span("notice","请使用下方按钮载入已有角色，或创建新角色开始游戏。"))

	for(var/k in SSlanguage.all_languages)
		src.known_languages |= k
