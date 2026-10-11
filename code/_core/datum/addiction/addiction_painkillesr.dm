/addiction/painkillers
	name = "止痛药成瘾"
	reagent_name = "止痛药"


/addiction/painkillers/on_life(var/mob/living/advanced/A,var/obj/item/organ/internal/brain/B,var/addiction_value=0,var/withdrawal_value=0)

	if(withdrawal_value >= 15 && prob(withdrawal_value))

		if(prob(25))
			A.to_chat(span("danger","你渴望服用[lowertext(reagent_name)]……"))
		switch(rand(1,3))
			if(1)
				A.brute_regen_buffer -= TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你浑身发痒……"))
			if(2)
				A.tox_regen_buffer -= TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你感到恶心……"))
			if(3)
				A.burn_regen_buffer -= TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你的皮肤起了水疱……"))

	return ..()
