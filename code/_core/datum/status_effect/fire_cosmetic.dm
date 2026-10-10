/status_effect/fire //This is entirely cosmetic.
	name = "着火"
	desc = "你着火了！"
	id = FIRE
	minimum = 0
	maximum = 300

	minimum = SECONDS_TO_DECISECONDS(5)
	maximum = SECONDS_TO_DECISECONDS(5)
	default_duration = SECONDS_TO_DECISECONDS(5)

/status_effect/fire/on_effect_added(var/mob/living/owner,var/atom/source,var/magnitude,var/duration,var/stealthy)

	. = ..()

	var/initial_fire = owner.on_fire

	if(owner.ignite(magnitude,source) && !initial_fire)
		owner.visible_message(span("danger","[owner.name]着火了！"),span("danger","你着火了！"))
