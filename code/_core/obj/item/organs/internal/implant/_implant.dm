/obj/item/organ/internal/implant
	name = "植入体"
	id = "implant"
	desc = "植入体。"
	icon_state = "lungs"
	attach_flag = BODY_TORSO
	value_burgerbux = 1

/obj/item/organ/internal/implant/on_organ_remove(var/mob/living/advanced/old_owner)
	. = ..()
	if(!qdeleting)
		qdel(src)


/obj/item/organ/internal/implant/head/
	name = "头部植入体"
	id = "implant_head"
	attach_flag = BODY_HEAD

/obj/item/organ/internal/implant/torso
	name = "躯干植入体"
	id = "implant_torso"
	attach_flag = BODY_TORSO

/obj/item/organ/internal/implant/groin
	name = "腹股沟植入体"
	id = "implant_groin"
	attach_flag = BODY_GROIN

/obj/item/organ/internal/implant/hand/left
	name = "左手植入体"
	id = "implant_hand_left"
	attach_flag = BODY_HAND_LEFT
