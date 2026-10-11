/mob/living/simple/fairy
	name = "精灵"
	desc = "嘿，听我说！"
	desc_extended = "再听这该死的东西吵上一秒，你就要把自己的耳膜掏出来了……虽然你也不知道该怎么掏。"
	icon = 'icons/mob/living/simple/fairy.dmi'
	icon_state = "living"

	damage_type = /damagetype/npc/fairy

	ai = /ai/

	health_base = 2500
	stamina_base = 5000
	mana_base = 50

	value = 1000

	size = SIZE_ANIMAL

	movement_delay = DECISECONDS_TO_TICKS(1)

	loyalty_tag = "Meme"
	iff_tag = "Meme"

	blood_type = /reagent/medicine/mana_potion

	level = 16

/mob/living/simple/fairy/post_death()
	. = ..()
	icon_state = "dead"
	if(. && !qdeleting)
		var/turf/T = get_turf(src)
		if(T) CREATE(/obj/item/clothing/back/wings/fairy,T)
