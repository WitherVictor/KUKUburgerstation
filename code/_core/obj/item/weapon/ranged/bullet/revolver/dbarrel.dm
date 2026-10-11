/obj/item/weapon/ranged/bullet/revolver/dbarrel
	name = "\improper 12号轰天棍"
	desc = "酒保信赖的双管霰弹枪。"
	desc_extended = "双管霰弹枪常被锯短，当作随身副武器使用，代价则由使用者的腕骨承担。"
	icon = 'icons/obj/item/weapons/ranged/dbarrel.dmi'
	icon_state = "inventory"
	value = 400

	company_type = "Solarian"

	tier_type = "shotgun"

	tier = 1

	damage_mod = 0.6
	shoot_delay = 1

	automatic = FALSE

	bullet_count_max = 2

	insert_limit = 2

	shoot_sounds = list('sound/weapons/ranged/shotgun/double_barrel/shoot.ogg')

	size = SIZE_3
	weight = 8

	bullet_length_min = 76
	bullet_length_best = 76.2
	bullet_length_max = 76.4

	bullet_diameter_min = 18
	bullet_diameter_best = 18.5
	bullet_diameter_max = 19

	heat_max = 0.1

	inaccuracy_modifier = 1
	movement_inaccuracy_modifier = 0
	movement_spread_base = 0.02

	rarity = RARITY_COMMON

/obj/item/weapon/ranged/bullet/revolver/dbarrel/get_base_spread()
	return 0.3

/obj/item/weapon/ranged/bullet/revolver/dbarrel/get_static_spread()
	return 0.01

/obj/item/weapon/ranged/bullet/revolver/dbarrel/get_skill_spread(var/mob/living/L)
	return max(0,0.03 - (0.06 * L.get_skill_power(SKILL_RANGED)))
