/mob/living/simple/blobbernaught

	name = "异形菌毯巨卫"
	desc = "异形菌毯的守护者。"
	desc_extended = "这团庞大的有机物只有一个使命：保护异形菌毯。"
	icon = 'icons/mob/living/simple/blob.dmi'
	icon_state = "blobbernaut"

	health_base = 300
	stamina_base = 100
	mana_base = 50

	value = 50

	ai = /ai/

	damage_type = /damagetype/npc/blobbernaut

	armor = /armor/blob/armored

	size = SIZE_GIANT

	var/obj/structure/interactive/blob/node/linked_node

	movement_delay = DECISECONDS_TO_TICKS(6)

	iff_tag = "Blob"
	loyalty_tag = "Blob"

	stun_angle = 0

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	blood_volume = 750
	blood_type = /reagent/blood/blob

	level = 12

/mob/living/simple/blobbernaught/New(loc,desired_client,desired_level_multiplier,var/obj/structure/interactive/blob/node/desired_node)

	if(desired_node)
		linked_node = desired_node
		linked_node.linked_blobbernaught = src
		color = linked_node.color

	return ..()


/mob/living/simple/blobbernaught/PostInitialize()
	. = ..()
	flick("blobbernaut_produce",src)

/mob/living/simple/blobbernaught/post_death()
	. = ..()
	icon_state = "[initial(icon_state)]_dead"
	flick("blobbernaut_death",src)
	if(linked_node)
		linked_node.linked_blobbernaught = null
