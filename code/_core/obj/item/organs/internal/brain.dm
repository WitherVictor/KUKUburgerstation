/obj/item/organ/internal/brain
	name = "大脑"
	id = BODY_BRAIN
	icon_state = BODY_BRAIN
	desc = "产生思维。需要含氧血液。"

	attach_flag = BODY_HEAD

	var/list/addictions = list()
	var/list/withdrawal = list()

	health = /health/obj/item/organ

	has_life = TRUE

	value = 0

/obj/item/organ/internal/brain/on_life()

	if(length(addictions) && is_advanced(src.loc))
		var/mob/living/advanced/A = src.loc
		for(var/k in addictions)
			var/addiction/D = SSliving.stored_addictions[k]
			if(addictions[k] <= 0)
				D.on_remove(A,src)
				addictions -= k
				continue
			D.on_life(A,src,addictions[k],withdrawal[k])

	return ..()



/obj/item/organ/internal/brain/on_organ_remove(var/mob/living/advanced/old_owner)
	. = ..()
	if(!old_owner.qdeleting && !old_owner.changing)
		old_owner.make_ghost()
		old_owner.death()


/obj/item/organ/internal/brain/robotic
	name = "机械大脑"
	health = /health/obj/item/organ/synthetic
