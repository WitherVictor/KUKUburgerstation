/obj/item/organ/leg
	name = "右腿"
	id = BODY_LEG_RIGHT
	desc = "一个器官。"
	icon_state = BODY_LEG_RIGHT
	worn_layer = LAYER_MOB_LEGS

	attach_flag = BODY_GROIN

	enable_wounds = TRUE

	hud_id = "body_leg_right"

	can_be_targeted = TRUE

	target_bounds_x_min = 12
	target_bounds_x_max = 15

	target_bounds_y_min = 4
	target_bounds_y_max = 8

	base_miss_chance = 10

	health_base = 70

	damage_coefficient = 0.75

	gib_icon_state = "gibleg"

	has_pain = TRUE

	has_life = TRUE

	value = 0

/obj/item/organ/leg/left
	name = "左腿"
	id = BODY_LEG_LEFT
	desc = "一个器官。"
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8

//Reptile
/obj/item/organ/leg/reptile
	name = "原始蜥蜴人右腿"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

	flags_organ = FLAG_ORGAN_BEAST_FEET

	armor = /armor/reptile

/obj/item/organ/leg/reptile/left
	name = "原始蜥蜴人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


//Reptile Advanced
/obj/item/organ/leg/reptile_advanced
	name = "蜥蜴人右腿"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'

	armor = /armor/reptile


/obj/item/organ/leg/reptile_advanced/left
	name = "蜥蜴人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8



//Diona
/obj/item/organ/leg/diona
	name = "狄俄娜右腿"
	icon = 'icons/mob/living/advanced/species/diona.dmi'

	enable_glow = TRUE
	enable_detail = TRUE

	armor = /armor/diona

/obj/item/organ/leg/diona/left
	name = "狄俄娜左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


//Cyborg
/obj/item/organ/leg/cyborg
	name = "半机械人右腿"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic


/obj/item/organ/leg/cyborg/left
	name = "半机械人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8

//Cyborg 2
/obj/item/organ/leg/gopro
	name = "高级半机械人右腿"
	icon = 'icons/mob/living/advanced/species/gopro.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic


/obj/item/organ/leg/gopro/left
	name = "高级半机械人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


/obj/item/organ/leg/beefman
	name = "血肉人右腿"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'

	armor = /armor/beefman

/obj/item/organ/leg/beefman/left
	name = "血肉人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


//Cyborg
/obj/item/organ/leg/skeleton
	name = "骷髅右腿"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'

	armor = /armor/skeleton

	projectile_dodge_chance = 20

	can_gib = FALSE


/obj/item/organ/leg/skeleton/left
	name = "骷髅左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


//Cyborg
/obj/item/organ/leg/monkey
	name = "猴子右腿"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'


/obj/item/organ/leg/monkey/left
	name = "猴子左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


//goblin
/obj/item/organ/leg/goblin
	name = "地精右腿"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'

	armor = /armor/goblin

/obj/item/organ/leg/goblin/left
	name = "地精左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8

//Moth
/obj/item/organ/leg/moth
	name = "蛾人右腿"
	icon = 'icons/mob/living/advanced/species/moth.dmi'


/obj/item/organ/leg/moth/left
	name = "蛾人左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8



/obj/item/organ/leg/golem
	name = "魔像右腿"
	icon = 'icons/mob/living/advanced/species/golem.dmi'


/obj/item/organ/leg/golem/left
	name = "魔像左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8


/obj/item/organ/leg/abductor
	name = "绑架者右腿"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'


/obj/item/organ/leg/abductor/left
	name = "绑架者左腿"
	id = BODY_LEG_LEFT
	icon_state = BODY_LEG_LEFT

	hud_id = "body_leg_left"

	target_bounds_x_min = 17
	target_bounds_x_max = 20

	target_bounds_y_min = 4
	target_bounds_y_max = 8
