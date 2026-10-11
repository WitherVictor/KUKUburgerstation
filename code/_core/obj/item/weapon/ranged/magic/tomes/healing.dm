/obj/item/weapon/ranged/magic/tome/heal
	name = "治疗法术典籍"
	desc = "伤口消消乐。"
	desc_extended = "使用时消耗法力。治疗影响3x3区域内的目标，包括施法者。"
	cost_mana = 50

	icon = 'icons/obj/items/weapons/ranged/magic/tomes/healing.dmi'

	associated_skill = SKILL_PRAYER

	projectile = /obj/projectile/bullet/mass_heal

	shoot_sounds = list('sounds/weapons/magic/heal.ogg')

	projectile_speed = 1

/obj/item/weapon/ranged/magic/tome/heal/get_static_spread() //Base spread
	return 0

/obj/item/weapon/ranged/magic/tome/heal/get_skill_spread(var/mob/living/L) //Base spread
	return 0
