/status_effect/mana_armor
	name = "法力护甲"
	desc = "法力高于上限的一半时，会保护你的生命。保护效果取决于奥术护甲。"
	id = MANA_ARMOR
	maximum = SECONDS_TO_DECISECONDS(300)
	minimum = SECONDS_TO_DECISECONDS(1)

	default_duration = SECONDS_TO_DECISECONDS(30)
	default_magnitude = 10 //Percent of mana taken before health

	affects_dead = FALSE
