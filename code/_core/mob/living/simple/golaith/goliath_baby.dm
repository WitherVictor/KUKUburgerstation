/mob/living/simple/goliath/baby
	name = "歌利亚幼体"
	desc = "与其说是千禧一代，不如说是‘爆炸婴儿’一代。"
	icon = 'icons/mob/living/simple/lavaland/goliath_baby.dmi'
	icon_state = "baby"
	damage_type = /damagetype/unarmed/claw/


	ai = /ai/

	stun_angle = 0

	health_base = 50

	size = SIZE_CRITTER

	level = 2

/mob/living/simple/goliath/baby/post_death()
	. = ..()
	explode(get_turf(src),3,src,src,loyalty_tag)
	qdel(src)
