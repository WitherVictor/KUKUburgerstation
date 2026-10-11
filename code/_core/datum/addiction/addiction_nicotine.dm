/addiction/nicotine
	name = "尼古丁成瘾"
	reagent_name = "尼古丁"


/addiction/nicotine/on_life(var/mob/living/advanced/A,var/obj/item/organ/internal/brain/B,var/addiction_value=0,var/withdrawal_value=0)

	if(withdrawal_value >= 5 && prob(withdrawal_value))

		if(prob(25))
			A.to_chat(span("danger","你渴望摄入尼古丁……"))
		switch(rand(1,3))
			if(1)
				A.brute_regen_buffer -= TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你浑身发痒……"))
			if(2)
				A.sanity_regen_buffer -= -TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你感到心烦意乱……"))
			if(2)
				A.mental_regen_buffer -= TICKS_TO_DECISECONDS(LIFE_TICK_SLOW)
				A.to_chat(span("warning","你似乎无法集中思考……"))


	return ..()
