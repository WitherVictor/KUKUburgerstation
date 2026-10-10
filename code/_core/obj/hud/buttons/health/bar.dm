/obj/hud/button/health/bar/
	name = "生命条"
	icon = 'icons/obj/health/base.dmi'
	icon_state = ""
	color = "#FFFFFF"
	var/min = 0
	var/max = 100
	var/current = 0
	var/desired = 0

	var/max_state = 28

	var/should_think = FALSE

/obj/hud/button/health/bar/special_think()

	if(desired > current)
		current = min(current+2,desired,max_state)
		. = TRUE
	else if(desired < current)
		current = max(current-2,desired,0)
		. = TRUE
	else
		. = FALSE

	icon_state = "bar_[current]"

/obj/hud/button/health/bar/update_underlays()
	. = ..()
	var/icon/base = new/icon(initial(icon),"base")
	swap_colors(base)
	var/image/I = new/image(base)
	I.appearance_flags = src.appearance_flags | RESET_COLOR
	add_underlay(I)

/obj/hud/button/health/bar/hp
	name = "生命值"
	id = "health"
	desc = "大致反映你离死亡还有多远。"
	desc_extended = "你的生命值。生命值过低时会进入濒危状态。提升活力可以增加生命值上限。"
	min = 0
	color = "#FF0000"

	screen_loc = "RIGHT-0.25,BOTTOM:12+6"

	flags = FLAGS_HUD_MOB

/obj/hud/button/health/bar/hp/get_examine_list(var/mob/examiner)
	return ..() + div("notice","当前生命值为 [current]，上限为 [max]。")

/obj/hud/button/health/bar/hp/update_stats(var/mob/living/M)

	if(!M || !istype(M.health))
		return ..()

	min = 0
	max = M.health.health_max

	var/mod = (M.health.health_current - M.health.get_loss(PAIN))/max
	desired = FLOOR(mod*max_state, 1)

	. = ..()

/obj/hud/button/health/bar/sp
	name = "体力"
	id = "stamina"
	desc = "大致反映你离身体疲劳还有多远。"
	desc_extended = "你的体力。体力过低时，某些行动将无法进行。降至 0 时，你很可能因精疲力竭而倒下。提升耐力可以增加体力上限。"
	min = 0
	color = "#00ff00"

	screen_loc = "RIGHT,BOTTOM:12+6"

	flags = FLAGS_HUD_MOB

/obj/hud/button/health/bar/sp/get_examine_list(var/mob/examiner)
	return ..() + div("notice","当前体力为 [current]，上限为 [max]。")

/obj/hud/button/health/bar/sp/update_stats(var/mob/living/M)

	if(!M || !istype(M.health))
		return ..()

	min = 0
	max = M.health.stamina_max

	var/mod = M.health.stamina_current/max
	desired = FLOOR(mod*max_state, 1)

	. = ..()

/obj/hud/button/health/bar/mp
	name = "法力"
	id = "mana"
	desc = "大致反映你离精神疲劳还有多远。"
	desc_extended = "你的法力。决定你能施放哪些法术，以及施放的频率。降至 0 时，你很可能因精神耗尽而倒下。提升智慧可以增加法力上限。"
	min = 0
	color = "#0000ff"

	screen_loc = "RIGHT+0.25,BOTTOM:12+6"

	flags = FLAGS_HUD_MOB

/obj/hud/button/health/bar/mp/get_examine_list(var/mob/examiner)
	return ..() + div("notice","当前法力为 [current]，上限为 [max]。")

/obj/hud/button/health/bar/mp/update_stats(var/mob/living/M)

	if(!M || !istype(M.health))
		return ..()

	min = 0
	max = M.health.mana_max

	var/mod = M.health.mana_current/max
	desired = FLOOR(mod*max_state, 1)

	. = ..()
