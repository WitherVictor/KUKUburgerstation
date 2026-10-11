/mob/living/simple/bee
	name = "蜜蜂"
	desc = "什么在嗡嗡响？"
	desc_extended = "别让它蜇到你。"
	icon = 'icons/mob/living/simple/bee.dmi'
	icon_state = "drone"
	damage_type = /damagetype/unarmed/claw

	level = 2

/mob/living/simple/bee/post_death()
	qdel(src)
	return ..()
