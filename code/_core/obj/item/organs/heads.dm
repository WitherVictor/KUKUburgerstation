/obj/item/organ/head
	name = "头部"
	id = BODY_HEAD
	desc = "所以，没头了？"
	icon_state = BODY_HEAD_MALE
	worn_layer = LAYER_MOB_HEAD
	inventories = list(
		/obj/hud/inventory/organs/head,
		/obj/hud/inventory/organs/neck,
		/obj/hud/inventory/organs/face,
		/obj/hud/inventory/organs/ear
	)

	attach_flag = BODY_TORSO

	enable_wounds = TRUE

	hud_id = "body_head"

	can_be_targeted = TRUE

	target_bounds_x_min = 12
	target_bounds_x_max = 20

	target_bounds_y_min = 23
	target_bounds_y_max = 29

	base_miss_chance = 20

	health_base = 50

	reagents = /reagent_container/limb

	damage_coefficient = 2

	gib_icon_state = "gibhead"

	has_life = TRUE

	value = 0

/obj/item/organ/head/get_damage_type(var/atom/attacker,var/atom/victim)
	if(attached_organ)
		return /damagetype/unarmed/bite/
	. = ..()

/obj/item/organ/head/female
	icon_state = BODY_HEAD_FEMALE

//Reptile
/obj/item/organ/head/reptile
	name = "原始蜥蜴人头部"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'
	desc = "一个器官。"
	flags_organ = FLAG_ORGAN_BEAST_HEAD

	armor = /armor/reptile

/obj/item/organ/head/reptile/female
	icon_state = BODY_HEAD_FEMALE

//Reptile Advanced
/obj/item/organ/head/reptile_advanced
	name = "蜥蜴人头部"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'
	desc = "一个器官。"
	flags_organ = FLAG_ORGAN_BEAST_HEAD

	armor = /armor/reptile

/obj/item/organ/head/reptile_advanced/female
	icon_state = BODY_HEAD_FEMALE


//Diona
/obj/item/organ/head/diona
	name = "狄俄娜头部"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	icon_state = BODY_HEAD
	desc = "一个器官。"
	flags_organ = FLAG_ORGAN_BEAST_HEAD

	enable_glow = TRUE
	enable_detail = TRUE

	armor = /armor/diona


//cyborg
/obj/item/organ/head/cyborg
	name = "半机械人头部"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'
	desc = "一个器官。"

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

//cyborg 2
/obj/item/organ/head/gopro/
	name = "高级半机械人头部"
	icon = 'icons/mob/living/advanced/species/gopro.dmi'
	desc = "一个器官。"

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic


//beef
/obj/item/organ/head/beefman
	name = "血肉人头部"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'
	desc = "一个器官。"

	armor = /armor/beefman


//skeleton
/obj/item/organ/head/skeleton
	name = "骷髅头部"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'
	desc = "一个器官。"

	armor = /armor/skeleton

	projectile_dodge_chance = 5

	can_gib = FALSE


//skeleton
/obj/item/organ/head/monkey
	name = "猴子头部"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'
	desc = "一个器官。"

/obj/item/organ/head/monkey/female
	icon_state = BODY_HEAD_FEMALE


//skeleton
/obj/item/organ/head/goblin
	name = "地精头部"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'
	desc = "一个器官。"

	armor = /armor/goblin

/obj/item/organ/head/goblin/female
	icon_state = BODY_HEAD_FEMALE


/obj/item/organ/head/moth
	name = "蛾人头部"
	icon = 'icons/mob/living/advanced/species/moth.dmi'
	desc = "一个器官。"

/obj/item/organ/head/moth/female
	icon_state = BODY_HEAD_FEMALE

/obj/item/organ/head/golem
	name = "魔像头部"
	icon = 'icons/mob/living/advanced/species/golem.dmi'
	desc = "一个器官。"

/obj/item/organ/head/abductor
	name = "绑架者头部"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'
	desc = "一个器官。"
