/obj/item/organ/arm
	name = "右臂"
	id = BODY_ARM_RIGHT
	desc = "一条右臂。"
	icon_state = BODY_ARM_RIGHT
	worn_layer = LAYER_MOB_ARMS
	attach_flag = BODY_TORSO

	enable_wounds = TRUE

	hud_id = "body_arm_right"

	can_be_targeted = TRUE

	target_bounds_x_min = 8
	target_bounds_x_max = 11

	target_bounds_y_min = 15
	target_bounds_y_max = 22

	base_miss_chance = 10

	health_base = 50

	damage_coefficient = 0.75

	has_pain = TRUE

	gib_icon_state = "gibarm"

	has_life = TRUE

	value = 0

/obj/item/organ/arm/left
	name = "左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT
	desc = "一条左臂。"

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Reptile Feral
/obj/item/organ/arm/reptile
	name = "原始蜥蜴人右臂"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

	armor = /armor/reptile

/obj/item/organ/arm/reptile/left
	name = "原始蜥蜴人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Reptile Advanced
/obj/item/organ/arm/reptile_advanced
	name = "蜥蜴人右臂"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'

	armor = /armor/reptile

/obj/item/organ/arm/reptile_advanced/left
	name = "蜥蜴人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Diona
/obj/item/organ/arm/diona
	name = "狄俄娜右臂"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	enable_glow = TRUE
	enable_detail = TRUE

	armor = /armor/diona

/obj/item/organ/arm/diona/left
	name = "狄俄娜左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Cyborg
/obj/item/organ/arm/cyborg
	name = "半机械人右臂"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

/obj/item/organ/arm/cyborg/left
	name = "半机械人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Cyborg2
/obj/item/organ/arm/gopro
	name = "高级半机械人右臂"
	icon = 'icons/mob/living/advanced/species/gopro.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

/obj/item/organ/arm/gopro/left
	name = "高级半机械人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22



//Beefman
/obj/item/organ/arm/beefman
	name = "血肉人右臂"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'

	armor = /armor/beefman

/obj/item/organ/arm/beefman/left
	name = "血肉人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22



//Beefman
/obj/item/organ/arm/skeleton
	name = "骷髅右臂"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'

	armor = /armor/skeleton

	projectile_dodge_chance = 20

	can_gib = FALSE

/obj/item/organ/arm/skeleton/left
	name = "骷髅左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//STANDU
/obj/item/organ/arm/stand
	name = "替身右臂"
	icon = 'icons/mob/living/advanced/species/stand.dmi'

/obj/item/organ/arm/stand/left
	name = "替身左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Monkey
/obj/item/organ/arm/monkey
	name = "猴子右臂"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'

/obj/item/organ/arm/monkey/left
	name = "猴子左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Goblin
/obj/item/organ/arm/goblin
	name = "地精右臂"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'

	armor = /armor/goblin

/obj/item/organ/arm/goblin/left
	name = "地精左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22

//Moth
/obj/item/organ/arm/moth
	name = "蛾人右臂"
	icon = 'icons/mob/living/advanced/species/moth.dmi'

/obj/item/organ/arm/moth/left
	name = "蛾人左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Golem
/obj/item/organ/arm/golem
	name = "魔像右臂"
	icon = 'icons/mob/living/advanced/species/golem.dmi'

/obj/item/organ/arm/golem/left
	name = "魔像左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22


//Abductor
/obj/item/organ/arm/abductor
	name = "绑架者右臂"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'

/obj/item/organ/arm/abductor/left
	name = "绑架者左臂"
	id = BODY_ARM_LEFT
	icon_state = BODY_ARM_LEFT

	hud_id = "body_arm_left"

	target_bounds_x_min = 21
	target_bounds_x_max = 24

	target_bounds_y_min = 15
	target_bounds_y_max = 22
