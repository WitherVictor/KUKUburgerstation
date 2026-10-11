/mob/living/simple/passive/penguin
	name = "企鹅"
	desc = "身穿正装的鸟。"
	desc_extended = "一只无害的小动物。至少看起来如此。"
	icon = 'icons/mob/living/simple/passive.dmi'
	icon_state = "penguin"
	damage_type = /damagetype/unarmed/bite/


	value = 50

	health_base = 25
	stamina_base = 50
	mana_base = 25

	butcher_contents = list(
		/obj/item/container/edible/dynamic/chicken/raw_penguin/,
		/obj/item/container/edible/dynamic/chicken/raw_penguin/
	)

	size = SIZE_ANIMAL

	loyalty_tag = "Penguin"
	iff_tag = "Penguin"

	blood_type = /reagent/blood/chicken
	blood_volume = 400

/mob/living/simple/passive/penguin/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_sprite()
