/obj/structure/interactive/bed/sleeper/cryo
	name = "深度休眠舱"
	base_color = "#AAAAAA"
	desc = "啊，糟了，我得去冷冻休眠了。"
	desc_extended = "将自己固定在舱内，<u>然后点击‘退出角色’按钮</u>，即可安全退出当前角色。"
	secondary_color = "#00FF00"
	tertiary_color = "#008800"
	var/spawnpoint = TRUE

/obj/structure/interactive/bed/sleeper/cryo/New(var/desired_loc)
	if(spawnpoint) SSobj.cryo_spawnpoints += src
	return ..()

/obj/structure/interactive/bed/sleeper/cryo/PreDestroy()
	. = ..()
	if(spawnpoint)
		SSobj.cryo_spawnpoints -= src

/obj/structure/interactive/bed/sleeper/can_buckle(var/mob/living/advanced/A,var/mob/activator)

	if(!is_player(A))
		return FALSE

	. = ..()

/obj/structure/interactive/bed/sleeper/cryo/buckle(var/mob/living/victim,var/mob/activator,var/silent=FALSE)

	. = ..()

	if(.)
		SSobj.cryo_spawnpoints -= src //Occupied!


/obj/structure/interactive/bed/sleeper/cryo/think()
	. = ..()
	if(is_player(buckled) && !buckled.client && !buckled.dead && !buckled.qdeleting)
		var/mob/living/advanced/player/P = buckled
		var/area/A = get_area(P)
		if(P.can_save(A))
			if(world_state >= STATE_ROUND_END)
				return FALSE
			if(world_state != STATE_RUNNING)
				return FALSE
			P.force_logout()
	if(buckled)
		return TRUE

/obj/structure/interactive/bed/sleeper/cryo/on_close(var/mob/activator)

	. = ..()

	if(.)
		if(!buckled)
			SSobj.cryo_spawnpoints |= src //Unoccupied!


/obj/structure/interactive/bed/sleeper/cryo/no_spawn
	spawnpoint = FALSE

