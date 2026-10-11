/mob/living/simple/gutlunch
	name = "食腐兽"
	desc = "大自然的吸尘器。"
	desc_extended = "熔岩地带的一种野生生物，以岩石和矿物中的铁、碳、钙为食。据说它几乎什么都吃，连同类和其他生物的尸体也不放过。"
	icon = 'icons/mob/living/simple/gutlunch.dmi'
	icon_state = "1"

	loyalty_tag = "Gutlunch"

	ai = /ai/gutlunch


	damage_type = /damagetype/npc/cow

	blood_type = /reagent/blood/gutlunch
	blood_volume = 300

	health_base = 100
	stamina_base = 50
	mana_base = 25

	size = SIZE_ANIMAL

	stun_angle = 0

/mob/living/simple/gutlunch/post_move(var/atom/old_loc)

	. = ..()

	if(!dead && is_turf(loc) && (ai && !ai.objective_attack) && src.z)
		consume_turf(loc)

/mob/living/simple/gutlunch/update_icon()
	icon = initial(icon)
	if(dead)
		icon_state = "dead"
	else
		var/eaten_length = length(contents)
		icon_state = "[clamp(CEILING(eaten_length/5,1),0,3)]"
	return TRUE

/mob/living/simple/gutlunch/post_death()
	. = ..()
	if(length(contents))
		var/turf/T = get_turf(src)
		if(T)
			T.visible_message(span("notice","[src.name]肚子里的东西全洒了出来！"))
			var/list/valid_turfs = list(T)
			for(var/k in DIRECTIONS_ALL)
				var/turf/GS = get_step(T,k)
				if(GS && GS != T)
					valid_turfs += GS
			for(var/k in contents)
				var/atom/movable/M = k
				var/turf/PT = pick(valid_turfs)
				M.force_move(PT)
	update_sprite()

/mob/living/simple/gutlunch/proc/consume_turf(var/turf/T)

	. = FALSE

	var/eat_limit = 5 //Look, I don't want to know what would happen if someone places 500 items on a single tile.

	for(var/obj/item/I in T.contents) //Second pass.
		if(src.qdeleting || src.dead)
			continue
		if(!I || I.qdeleting)
			continue
		if(eat_limit <= 0)
			break
		if(I.get_value() < 100)
			qdel(I)
		else
			I.force_move(src)
		. = TRUE
		eat_limit--
		CHECK_TICK(50,FPS_SERVER)

	if(.)
		play_sound('sound/effects/gutlunch_eat.ogg',T)
		T.visible_message(span("warning","[src.name]吞掉了[T.name]上的所有东西！"))
		update_sprite()




