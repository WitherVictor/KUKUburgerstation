/mob/living/simple/clockwork_marauder
	name = "发条掠夺者"
	desc = "阴森森的！"
	desc_extended = "一缕披上护甲的古老残魂，曾效忠于拉特瓦尔。"
	icon = 'icons/mob/living/simple/clockwork_marauder.dmi'
	icon_state = "living"

	health_base = 500
	stamina_base = 500
	mana_base = 100

	ai = /ai/simple/
	damage_type = /damagetype/melee/spear/ratvar/


	stun_angle = 0

	iff_tag = "Clockwork"
	loyalty_tag = "Clockwork"

	size = SIZE_GIANT

	blood_type = null
	blood_volume = 0

	level = 20

/mob/living/simple/clockwork_marauder/post_death()
	. = ..()
	icon_state = "dead"
