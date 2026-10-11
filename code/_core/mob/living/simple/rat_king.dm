/mob/living/simple/rat_king
	name = "鼠王"
	desc = "地下之王。"
	desc_extended = "某场失败实验产生的罕见变异老鼠。"
	icon = 'icons/mob/living/simple/rat_king.dmi'
	icon_state = "living"

	health_base = 600
	stamina_base = 400
	mana_base = 300

	value = 300

	ai = /ai/

	damage_type = /damagetype/unarmed/claw/

	armor = /armor/demon

	size = SIZE_GIANT

	iff_tag = "Rat"
	loyalty_tag = "Rat"

	blood_type = /reagent/blood/rat
	blood_volume = 400

	level = 22


/mob/living/simple/rat_king/post_death()
	. = ..()
	icon_state = "dead"
