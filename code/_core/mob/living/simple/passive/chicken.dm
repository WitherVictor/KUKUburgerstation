/mob/living/simple/passive/chicken
	name = "白鸡"
	desc = "咯咯哒。"
	desc_extended = "一只无害的小动物。"
	icon = 'icons/mob/living/simple/chicken.dmi'
	icon_state = "chicken_white"
	damage_type = /damagetype/npc/chicken

	butcher_contents = list(
		/obj/item/container/edible/dynamic/chicken/raw/,
		/obj/item/container/edible/dynamic/chicken/raw/,
		/obj/item/container/edible/dynamic/chicken/raw/
	)
	size = SIZE_CRITTER

	loyalty_tag = "Chicken"
	iff_tag = "Chicken"

	blood_type = /reagent/blood/chicken
	blood_volume = 100

	health_base = 25
	stamina_base = 50
	mana_base = 25

/mob/living/simple/passive/chicken/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_sprite()

/mob/living/simple/passive/chicken/brown
	name = "棕鸡"
	icon_state = "chicken_brown"

/mob/living/simple/passive/chicken/black
	name = "黑鸡"
	icon_state = "chicken_black"

/mob/living/simple/passive/chicken/black/Initialize()
	. = ..()
	if(prob(1))
		name = "黑色大公鸡"
		desc = "喜剧效果达成。"
