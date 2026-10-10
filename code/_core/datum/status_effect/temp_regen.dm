/status_effect/temp_regen
	name = "再生"
	desc = "你的伤口正在愈合！"
	id = TEMP_REGEN
	maximum = SECONDS_TO_DECISECONDS(150)
	minimum = SECONDS_TO_DECISECONDS(1)

	default_duration = SECONDS_TO_DECISECONDS(15)
	default_magnitude = 1

	affects_dead = FALSE

/status_effect/temp_regen/on_effect_life(mob/living/owner, magnitude, duration)

	owner.brute_regen_buffer += magnitude*DECISECONDS_TO_SECONDS(LIFE_TICK_FAST)
	owner.burn_regen_buffer += magnitude*DECISECONDS_TO_SECONDS(LIFE_TICK_FAST)

	. = ..()
