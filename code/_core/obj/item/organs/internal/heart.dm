/obj/item/organ/internal/heart
	name = "心脏"
	id = BODY_HEART
	icon_state = BODY_HEART
	desc = "将血液泵送至全身。"

	attach_flag = BODY_TORSO

	reagents = /reagent_container/heart

	var/heart_rate = 60 //Resting, Measured in beats per minute

	var/heart_ticks = 0

	has_life = FALSE

	value = 0



/obj/item/organ/internal/heart/robotic
	name = "机械心脏"
