/status_effect/druggy
	name = "药物迷幻"
	desc = "药物让你陷入了迷幻状态！"
	id = DRUGGY

	minimum = SECONDS_TO_DECISECONDS(10)
	maximum = SECONDS_TO_DECISECONDS(300)
	default_duration = SECONDS_TO_DECISECONDS(60)

	affects_dead = FALSE

/status_effect/druggy/on_effect_added(var/mob/living/owner,var/atom/source,var/magnitude,var/duration,var/stealthy)
	. = ..()
	if(.)
		owner.update_eyes()

/status_effect/druggy/on_effect_removed(var/mob/living/owner,var/magnitude,var/duration)
	. = ..()
	if(.)
		owner.update_eyes()
