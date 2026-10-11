/mob/living/simple/arachnid
	name = "巨型蛛形生物"
	desc = "丛林之王。"
	desc_extended = "一种巨大的四足食肉生物。"
	icon = 'icons/mob/living/simple/jungle/arachnid.dmi'
	icon_state = "living"
	damage_type = /damagetype/unarmed/claw/

	pixel_x = -16

	value = 1000

	ai = /ai/

	stun_angle = 0

	butcher_contents = list(
		/obj/item/container/edible/dynamic/meat/raw_arachnid,
		/obj/item/container/edible/dynamic/meat/raw_arachnid,
		/obj/item/container/edible/dynamic/meat/raw_arachnid,
		/obj/item/container/edible/dynamic/meat/raw_arachnid,
		/obj/item/container/edible/dynamic/meat/raw_arachnid,
		/obj/item/container/edible/dynamic/meat/raw_arachnid
	)

	armor = /armor/arachnid

	iff_tag = "Jungle"
	loyalty_tag = "Jungle"

	health_base = 500
	stamina_base = 250
	mana_base = 250

	movement_delay = DECISECONDS_TO_TICKS(2)

	size = SIZE_GIANT

	enable_medical_hud = FALSE
	enable_security_hud = FALSE

	blood_type = /reagent/blood/arachnid
	blood_volume = 2000

	object_size = 2

	level = 19

/mob/living/simple/arachnid/Finalize()
	. = ..()
	add_status_effect(REST,-1,-2, force = TRUE)
	update_sprite()

/mob/living/simple/arachnid/post_death()
	. = ..()
	update_sprite()

/mob/living/simple/arachnid/handle_transform(var/force=FALSE)
	. = ..()
	if(.)
		update_sprite()

/mob/living/simple/arachnid/update_icon()

	. = ..()

	if(dead)
		icon_state = "dead"
	else if(has_status_effect(REST))
		icon_state = "inactive"
	else if(horizontal)
		icon_state = "stun"
	else
		icon_state = "living"

/mob/living/simple/arachnid/sand
	name = "巨型沙地蛛形生物"
	desc = "沙地之王。"
	desc_extended = "一种巨大的四足食肉生物。"
	icon = 'icons/mob/living/simple/jungle/arachnid_sand.dmi'

	level = 24

	iff_tag = "Desert"
	loyalty_tag = "Desert"

	armor = /armor/arachnid/sand
