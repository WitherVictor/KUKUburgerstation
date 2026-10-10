/obj/hud/button/sneak
	name = "潜行"
	desc = "潜行者，不许偷偷摸摸！"
	desc_extended = "点击这里切换潜行。潜行会让 NPC 更难发现你；除非你进入其他玩家角色的视线，否则他们也看不到你。潜行移动会消耗体力。"
	icon_state = "sneak_0"
	screen_loc = "RIGHT-3:1,BOTTOM:12"

	var/sneaking = 0

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/sneak/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))
		var/mob/living/L = activator
		L.sneak()
		sneaking = L.is_sneaking


/obj/hud/button/sneak/update_sprite()

	if(owner && owner.client)
		var/client/C = owner.client
		if(C.settings.loaded_data["compact_mode"])
			screen_loc = "RIGHT:1,BOTTOM+2:10"
		else
			screen_loc = initial(screen_loc)

	. = ..()

/obj/hud/button/sneak/update_icon()
	icon_state = "sneak_[sneaking]"
	..()

/obj/hud/button/move
	name = "切换移动方式"
	desc = "谁他妈还慢慢走路啊，笑死。"
	desc_extended = "更改默认的移动姿态。"
	icon_state = "move_1"
	screen_loc = "RIGHT:1-3,BOTTOM:11"

	var/move_mod_button = 0

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/move/update_sprite()

	if(owner && owner.client)
		var/client/C = owner.client
		if(C.settings.loaded_data["compact_mode"])
			screen_loc = "RIGHT,BOTTOM+2:10"
		else
			screen_loc = initial(screen_loc)

	. = ..()

/obj/hud/button/move/update_icon()
	icon_state = "move_[move_mod_button+2]"
	..()

/obj/hud/button/move/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(.)
		if(params[PARAM_ICON_X] && params[PARAM_ICON_Y] && params[PARAM_ICON_Y] >= 10)
			switch(params[PARAM_ICON_X])
				if(1 to 10)
					activator.move_mod_button = -1
				if(12 to 21)
					activator.move_mod_button = 0
				if(23 to 32)
					activator.move_mod_button = 1
		else
			move_mod_button += 1

		if(activator.move_mod_button > 1)
			activator.move_mod_button = -1

		move_mod_button = activator.move_mod_button

		update_sprite()


/obj/hud/button/rest
	name = "休息"
	desc = "上班不许睡觉！"
	desc_extended = "点击这里让角色休息。休息会大幅降低被流弹击中的可能，也让 NPC 更难发现你。"
	icon_state = "rest"
	screen_loc = "RIGHT-2:11,BOTTOM:10+1"

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/rest/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))
		var/mob/living/L = activator
		L.rest()


/obj/hud/button/stand
	name = "替身"
	desc = "召唤或收回你的替身。"
	desc_extended = "点击这里召唤或收回替身。切换到伤害意图，替身才会攻击敌人；帮助意图下不会攻击。"
	icon_state = "stand"
	screen_loc = "RIGHT-2:8,BOTTOM:12+1"

	flags_hud = FLAG_HUD_MOB

/obj/hud/button/stand/clicked_on_by_object(var/mob/activator,var/atom/object,location,control,params)

	. = ..()

	if(. && is_living(activator))
		var/mob/living/L = activator
		if(L.stand && L.stand.linked_stand)
			L.stand.linked_stand.set_enabled(!L.stand.linked_stand.enabled)
		else
			L.to_chat(span("danger","不知为何，你没有替身！"))

