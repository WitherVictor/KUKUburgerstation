//For npcs only.

/status_effect/rage
	name = "狂怒"
	desc = "你怒不可遏！"
	id = RAGE

	minimum = SECONDS_TO_DECISECONDS(5)
	maximum = SECONDS_TO_DECISECONDS(30)
	default_duration = SECONDS_TO_DECISECONDS(10)

	affects_dead = FALSE

/status_effect/rage/on_effect_added(var/mob/living/owner,var/atom/source,var/magnitude,var/duration,var/stealthy)
	. = ..()
	owner.add_status_effect(UNDYING,magnitude,duration,stealthy=TRUE)
	owner.add_status_effect(ADRENALINE,magnitude,duration,stealthy=TRUE)
	owner.do_say("吼啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊！！")
	if(duration == -1 && !owner.is_player_controlled(owner))
		owner.color = "#FF0000"
