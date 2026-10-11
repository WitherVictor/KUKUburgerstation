/mob/living/simple/passive/mouse
	name = "老鼠"
	desc = "吱吱！"
	desc_extended = "一只无害的老鼠。"
	icon = 'icons/mob/living/simple/mouse.dmi'
	icon_state = "mouse_brown"
	damage_type = /damagetype/unarmed/bite/


	health_base = 25
	stamina_base = 50
	mana_base = 25

	stun_angle = 0

	loyalty_tag = "Mouse"
	iff_tag = "Mouse"

	size = SIZE_CRITTER

	blood_type = /reagent/blood/mouse
	blood_volume = 50

/mob/living/simple/passive/mouse/Crossed(atom/movable/O,atom/OldLoc)
	return TRUE

/mob/living/simple/passive/mouse/brown
	name = "田鼠"
	icon_state = "mouse_brown"

/mob/living/simple/passive/mouse/white
	name = "雪鼠"
	icon_state = "mouse_white"

/mob/living/simple/passive/mouse/grey
	name = "维护区老鼠"
	icon_state = "mouse_gray"

/mob/living/simple/passive/mouse/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_sprite()
