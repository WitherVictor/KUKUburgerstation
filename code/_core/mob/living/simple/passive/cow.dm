/mob/living/simple/passive/cow
	name = "奶牛"
	desc = "提供牛奶，也布置家庭作业。"
	desc_extended = "一只无害的动物。"

	icon = 'icons/mob/living/simple/cow.dmi'
	icon_state = "living"

	damage_type = /damagetype/npc/cow

	butcher_contents = list(
		/obj/item/container/edible/dynamic/meat/raw,
		/obj/item/container/edible/dynamic/meat/raw,
		/obj/item/container/edible/dynamic/meat/raw,
		/obj/item/container/edible/dynamic/meat/raw
	)

	size = SIZE_HUMAN

	iff_tag = "Cow"
	loyalty_tag = "Cow"

	blood_type = /reagent/blood/cow
	blood_volume = 750

	health_base = 100
	stamina_base = 50
	mana_base = 25

/mob/living/simple/passive/cow/post_death()
	..()
	icon_state = "dead"
