/mob/living/simple/bat
	name = "洞穴蝙蝠"
	desc = "阴森森的！"
	desc_extended = "一只极具攻击性的洞穴蝙蝠。"
	icon = 'icons/mob/living/simple/bat.dmi'
	icon_state = "living"

	health_base = 20
	stamina_base = 10
	mana_base = 10

	damage_type = /damagetype/unarmed/bite/

	stun_angle = 0

	iff_tag = "Bat"
	loyalty_tag = "Bat"

	size = SIZE_CRITTER

	blood_type = /reagent/blood/bat
	blood_volume = 100


	level = 4

/mob/living/simple/bat/post_death()
	. = ..()
	icon_state = "dead"

/mob/living/simple/bat/space
	name = "太空蝙蝠"
