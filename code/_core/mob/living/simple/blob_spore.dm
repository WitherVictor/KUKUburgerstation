/mob/living/simple/blob_spore

	name = "异形菌毯孢子"
	desc = "从我脑袋里滚出去！"
	desc_extended = "异形菌毯产生的孢子，移动迅速，脆弱且不稳定。它会附着在智慧生物的头部，注入控制心智的孢子；受害者死亡后便会被彻底控制。"
	icon = 'icons/mob/living/simple/blob.dmi'
	icon_state = "blobpod"

	health_base = 25
	stamina_base = 25
	mana_base = 25

	value = 5

	ai = /ai/blob_spore

	damage_type = /damagetype/npc/blob_spore
	armor = /armor/blob/spore

	size = SIZE_ANIMAL

	movement_delay = DECISECONDS_TO_TICKS(1)

	iff_tag = "Blob"
	loyalty_tag = "Blob"

	stun_angle = 0

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	blood_volume = 100
	blood_type = /reagent/blood/blob

	level = 2

	reagents = /reagent_container/blob

	var/idle = FALSE

	delete_on_death = TRUE

/mob/living/simple/blob_spore/post_move(var/atom/old_loc)
	if(idle)
		idle = FALSE
		icon_state = initial(icon_state)

/mob/living/simple/blob_spore/post_death()

	var/turf/T = get_turf(src)
	if(T)
		reagents.add_reagent(/reagent/toxin/blob_spore,50)
		smoke(T,5,SECONDS_TO_DECISECONDS(3),reagents,src,255)
		var/reagent/R = REAGENT(blood_type)
		create_blood(
			/obj/effect/cleanable/blood/splatter,
			T,
			R.color,
			rand(-TILE_SIZE*0.25,TILE_SIZE*0.25),
			rand(-TILE_SIZE*0.25,TILE_SIZE*0.25)
		)

	. = ..()
