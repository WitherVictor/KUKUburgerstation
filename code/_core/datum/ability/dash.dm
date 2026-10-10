
//Simple Dash.
/ability/dash
	name = "冲刺"
	desc = "朝角色的移动方向冲刺。静止时，改为朝角色面向的方向冲刺。距离为 4 格。"
	icon_state = "dash"

	resource_type = STAMINA

	var/dash_strength = 4
	cost = 30
	cooldown = SECONDS_TO_DECISECONDS(2)

	category = "Dash"

/ability/dash/on_cast(var/mob/activator,var/atom/target,location,params)
	var/mob/living/L = activator
	L.dash_direction = L.move_dir ? L.move_dir : L.dir
	L.dash_amount = dash_strength
	play_sound('sound/effects/dodge.ogg',get_turf(activator))
	return TRUE


//Controlled Dash
/ability/dash/controlled
	name = "可控冲刺"
	desc = "朝角色面向的方向冲刺，途中可控制方向。距离为 3 格。"
	icon_state = "dash_plus"
	dash_strength = 3
	cooldown = SECONDS_TO_DECISECONDS(5)
	cost = 50

/ability/dash/controlled/on_cast(var/mob/activator,var/atom/target,location,params)
	var/mob/living/L = activator
	L.dash_amount = dash_strength
	play_sound('sound/effects/dodge.ogg',get_turf(activator))
	return TRUE


//Targeted Dash
/ability/dash/targeted
	name = "定点冲刺"
	desc = "朝指定地块冲刺。最远距离为 3 格。"
	icon_state = "dash_targeted"
	dash_strength = 3
	cost = 40
	cooldown = SECONDS_TO_DECISECONDS(3)

	category = "Dash"

/ability/dash/targeted/on_cast(var/mob/activator,var/atom/target,location,params)
	var/mob/living/L = activator
	L.dash_target = target
	L.dash_amount = dash_strength
	play_sound('sound/effects/dodge.ogg',get_turf(activator))
	return TRUE

//Random dash.
/ability/dash/random
	name = "随机冲刺"
	desc = "朝随机方向冲刺。距离为 2 格。"
	icon_state = "dash"
	dash_strength = 2
	cost = 10
	cooldown = SECONDS_TO_DECISECONDS(0.5)

	category = "Dash"

/ability/dash/random/on_cast(var/mob/activator,var/atom/target,location,params)
	var/mob/living/L = activator
	L.dash_direction = pick(DIRECTIONS_ALL)
	L.dash_amount = dash_strength
	play_sound('sound/effects/dodge.ogg',get_turf(activator))
	return TRUE

//Fleeting dash.
/ability/dash/fleeting
	name = "撤离冲刺"
	desc = "朝远离目标位置的方向冲刺。距离为 2 格。"
	icon_state = "dash"
	dash_strength = 2
	cost = 20
	cooldown = SECONDS_TO_DECISECONDS(1)

	category = "Dash"

/ability/dash/fleeting/on_cast(var/mob/activator,var/atom/target,location,params)
	var/mob/living/L = activator
	L.dash_direction = get_dir(target,activator)
	L.dash_amount = dash_strength
	play_sound('sound/effects/dodge.ogg',get_turf(activator))
	return TRUE



