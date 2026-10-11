/mob/living/simple/lobster
	name = "巨型龙虾"
	desc = "这下可没那么“虾”简单了。"
	desc_extended = "一只危险的披甲龙虾，长着与庞大身躯相称的巨钳。"
	icon = 'icons/mob/living/simple/lobster.dmi'
	icon_state = "living"
	damage_type = /damagetype/npc/crab


	health_base = 200
	stamina_base = 200
	mana_base = 100

	value = 200

	butcher_contents = list(
		/obj/item/container/edible/dynamic/fish/raw_lobster/,
		/obj/item/container/edible/dynamic/fish/raw_lobster/
	)

	ai = /ai/

	stun_angle = 0

	armor = /armor/chitin/heavy

	size = SIZE_GIANT

	movement_delay = DECISECONDS_TO_TICKS(6)

	loyalty_tag = "Crab"
	iff_tag = "Crab"

	blood_type = /reagent/blood/crab
	blood_volume = 500

	level = 8

/mob/living/simple/lobster/post_death()
	. = ..()
	icon_state = "dead"
