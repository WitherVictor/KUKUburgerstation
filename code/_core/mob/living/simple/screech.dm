/mob/living/simple/screech
	name = "尖啸怪"
	desc = "卧槽，我的耳朵！"
	desc_extended = "什么鬼？"
	icon = 'icons/mob/living/simple/screech.dmi'
	icon_state = "screech"
	pixel_x = -16

	health_base = 100
	stamina_base = 100
	mana_base = 100

	value = 1000

	ai =  /ai/

	damage_type = /damagetype/unarmed/bite/

	enable_security_hud = TRUE
	enable_medical_hud = TRUE

	loyalty_tag = "Screech"
	iff_tag = "Screech"

	size = SIZE_HUMAN

	blood_type = /reagent/blood/alien/red
	blood_volume = 400

	level = 19
