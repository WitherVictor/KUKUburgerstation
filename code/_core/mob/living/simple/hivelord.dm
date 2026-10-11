/mob/living/simple/hivelord
	name = "巢主"
	desc = "来自深渊。"
	desc_extended = "黑暗能量的化身。"
	icon = 'icons/mob/living/simple/hivelord.dmi'
	icon_state = "living"

	ai = /ai/

	health_base = 20
	stamina_base = 10
	mana_base = 10

	damage_type = /damagetype/npc/hivelord


	stun_angle = 0

	iff_tag = "Hell"
	loyalty_tag = "Hell"

	size = SIZE_CRITTER

	blood_type = /reagent/blood/unholy
	blood_volume = 100

	level = 8

/mob/living/simple/hivelord/post_death()
	. = ..()
	icon_state = "dead"
