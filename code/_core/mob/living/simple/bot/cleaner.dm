/mob/living/simple/bot/cleaner
	name = "清洁机器人"
	desc = "法律意义上绝不雷同的清洁机器人，专治脏乱！"
	icon = 'icons/mob/living/simple/cleaner.dmi'
	icon_state = "living"

	loyalty_tag = "NanoTrasen"
	iff_tag = "NanoTrasen"

	ai = /ai/bot/cleaner

	var/owner_ckey

	value = 200

	health_base = 200

/mob/living/simple/bot/cleaner/post_death()

	. = ..()

	if(.)
		icon_state = "dead"

/mob/living/simple/bot/cleaner/post_move(var/atom/old_loc)

	. = ..()

	if(. && loc != old_loc && loc && is_turf(loc))

		var/sucked = FALSE
		var/turf/T = loc

		for(var/obj/effect/cleanable/C in T.contents)
			qdel(C)
			sucked = TRUE

		if(sucked)
			play_sound('sound/effects/portal_suck.ogg',T)
