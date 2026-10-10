/obj/item/organ/groin
	name = "腹股沟"
	id = BODY_GROIN
	desc = "一个器官。"
	icon_state = BODY_GROIN_MALE
	worn_layer = LAYER_MOB_GROIN
	inventories = list(
		/obj/hud/inventory/organs/groin,
		/obj/hud/inventory/organs/groin_o,
		/obj/hud/inventory/organs/groin/pocket/right,
		/obj/hud/inventory/organs/groin/pocket/left,
		/obj/hud/inventory/organs/groin/pocket/contract

	)

	attach_flag = BODY_TORSO

	enable_wounds = TRUE

	hud_id = "body_groin"

	can_be_targeted = TRUE

	target_bounds_x_min = 12
	target_bounds_x_max = 20

	target_bounds_y_min = 9
	target_bounds_y_max = 13

	health_base = 50

	damage_coefficient = 0.9

	gib_icon_state = "gibtorso"

	has_life = TRUE

	value = 0

/obj/item/organ/groin/female
	desc = "女性腹股沟。"
	icon_state = BODY_GROIN_FEMALE

//Reptile Feral
/obj/item/organ/groin/reptile
	name = "原始蜥蜴人腹股沟"
	icon = 'icons/mob/living/advanced/species/reptile.dmi'

	armor = /armor/reptile

/obj/item/organ/groin/reptile/female
	icon_state = BODY_GROIN_FEMALE


//Reptile Advanced
/obj/item/organ/groin/reptile_advanced
	name = "蜥蜴人腹股沟"
	icon = 'icons/mob/living/advanced/species/reptile_advanced.dmi'

	armor = /armor/reptile

/obj/item/organ/groin/reptile_advanced/female
	icon_state = BODY_GROIN_FEMALE

//Diona
/obj/item/organ/groin/diona
	name = "狄俄娜腹股沟"
	icon = 'icons/mob/living/advanced/species/diona.dmi'
	icon_state = BODY_GROIN

	enable_glow = TRUE
	enable_detail = TRUE

	armor = /armor/diona

//cyborg
/obj/item/organ/groin/cyborg
	name = "半机械人腹股沟"
	icon = 'icons/mob/living/advanced/species/cyborg.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic

//cyborg2
/obj/item/organ/groin/gopro
	name = "高级半机械人腹股沟"
	icon = 'icons/mob/living/advanced/species/gopro.dmi'

	armor = /armor/cyborg
	health = /health/obj/item/organ/synthetic


//Beefman
/obj/item/organ/groin/beefman
	name = "血肉人腹股沟"
	icon = 'icons/mob/living/advanced/species/beefman.dmi'

	armor = /armor/beefman




//Skeleton
/obj/item/organ/groin/skeleton
	name = "骷髅腹股沟"
	icon = 'icons/mob/living/advanced/species/skeleton.dmi'

	armor = /armor/skeleton

	projectile_dodge_chance = 10

	can_gib = FALSE


//Monkey
/obj/item/organ/groin/monkey
	name = "猴子腹股沟"
	icon = 'icons/mob/living/advanced/species/monkey.dmi'

/obj/item/organ/groin/monkey/female
	icon_state = BODY_GROIN_FEMALE


//goblin
/obj/item/organ/groin/goblin
	name = "地精腹股沟"
	icon = 'icons/mob/living/advanced/species/goblin.dmi'

	armor = /armor/goblin

/obj/item/organ/groin/goblin/female
	icon_state = BODY_GROIN_FEMALE


//Monkey
/obj/item/organ/groin/moth
	name = "蛾人腹股沟"
	icon = 'icons/mob/living/advanced/species/moth.dmi'

/obj/item/organ/groin/moth/female
	icon_state = BODY_GROIN_FEMALE


//Golem
/obj/item/organ/groin/golem
	name = "魔像腹股沟"
	icon = 'icons/mob/living/advanced/species/golem.dmi'



//abductor
/obj/item/organ/groin/abductor
	name = "绑架者腹股沟"
	icon = 'icons/mob/living/advanced/species/abductor.dmi'
