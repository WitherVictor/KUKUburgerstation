//Human
/obj/item/organ/eye
	name = "右眼"
	id = BODY_EYE_RIGHT
	desc = "一只眼睛。"
	icon_state = BODY_EYE_RIGHT
	worn_layer = LAYER_MOB_EYE

	attach_flag = BODY_HEAD

	has_dropped_icon = TRUE
	has_dropped_icon_underlay = TRUE

	enable_wounds = FALSE

	var/vision_mod = FLAG_VISION_NONE
	var/sight_mod = 0x0
	var/see_invisible = 0
	var/see_in_dark = 1

	can_be_broken = FALSE

	value = 0

/obj/item/organ/eye/initialize_worn_blends(var/desired_icon_state)
	. = ..()
	add_blend(
		"eye",
		desired_color = "#000000",
		desired_blend = ICON_MULTIPLY,
		desired_type = ICON_BLEND_COLOR,
		desired_should_save = TRUE,
		desired_layer = worn_layer
	)

/obj/item/organ/eye/left
	name = "左眼"
	id = BODY_EYE_LEFT
	desc = "一只眼睛。"
	icon_state = BODY_EYE_LEFT

//Reptile
/obj/item/organ/eye/reptile
	name = "原始蜥蜴人右眼"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

/obj/item/organ/eye/reptile/left
	name = "原始蜥蜴人左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT

//Reptile Advanced
/obj/item/organ/eye/reptile_advanced
	name = "蜥蜴人右眼"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'


/obj/item/organ/eye/reptile_advanced/left
	name = "蜥蜴人左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT



//Cyborg
/obj/item/organ/eye/cyborg
	name = "半机械人右侧光学传感器"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

/obj/item/organ/eye/cyborg/left
	name = "半机械人左侧光学传感器"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT

//Cyborg 2
/obj/item/organ/eye/gopro
	name = "高级半机械人右侧光学传感器"
	icon = 'icons/mob/living/advanced/species/gopro.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

/obj/item/organ/eye/gopro/left
	name = "高级半机械人左侧光学传感器"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT


//Beefman
/obj/item/organ/eye/beefman
	name = "血肉人右眼"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'

/obj/item/organ/eye/beefman/left
	name = "血肉人左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT


//Monkey
/obj/item/organ/eye/monkey
	name = "猴子右眼"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'

/obj/item/organ/eye/monkey/left
	name = "猴子左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT

//goblin
/obj/item/organ/eye/goblin
	name = "地精右眼"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'

/obj/item/organ/eye/goblin/left
	name = "地精左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT

//Moth
/obj/item/organ/eye/moth
	name = "蛾人右眼"
	icon = 'icons/mob/living/advanced/species/moth.dmi'

/obj/item/organ/eye/moth/left
	name = "蛾人左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT

//diona
/obj/item/organ/eye/diona
	name = "狄俄娜右眼"
	icon = 'icons/mob/living/advanced/species/diona.dmi'

/obj/item/organ/eye/diona/left
	name = "狄俄娜左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT


//golem
/obj/item/organ/eye/golem
	name = "魔像右眼"
	icon = 'icons/mob/living/advanced/species/golem.dmi'

/obj/item/organ/eye/golem/left
	name = "魔像左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT


//abductor
/obj/item/organ/eye/abductor
	name = "绑架者右眼"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'

/obj/item/organ/eye/abductor/left
	name = "绑架者左眼"
	id = BODY_EYE_LEFT
	icon_state = BODY_EYE_LEFT
