/obj/item/weapon/ranged/bullet/revolver/gauss //you know what we need? more gauss
	name = "\improper 2.54x12mm高斯喇叭枪"
	desc = "无政府主义者和匪徒造出的危险变种，用来阻挡责任团的推进。" //I had to, ok?
	desc_extended = "这把武器是倒霉运气和临场巧思的产物。用损坏高斯步枪的回收零件拼成的喇叭枪，体积只有原枪一半，容量只有八分之一，却能打出同样的威力。"
	icon = 'icons/obj/item/weapons/ranged/revolver/gauss_blunder.dmi'
	icon_state = "inventory"
	value = 600

	company_type = "Slavic"

	tier_type = "pistol"

	tier = 2

	shoot_delay = 5

	automatic = FALSE

	bullet_count_max = 1

	shoot_sounds = list('sound/weapons/ranged/rifle/gauss/shoot_short.ogg')

	size = SIZE_2
	weight = 4
	bullet_length_min = 11
	bullet_length_best = 12
	bullet_length_max = 14

	bullet_diameter_min = 1
	bullet_diameter_best = 2.54
	bullet_diameter_max = 3

	heat_per_shot_mod = 2 //i have no idea what this'll do, but I sure hope it doesn't cause heat to go over 0.2
	heat_max = 0.2
	view_punch_mod = 0

	inaccuracy_modifier = 2  // this was previously set to 3 and you literally couldnt hit someone in the torso at melee range with it
	movement_inaccuracy_modifier = 4
	movement_spread_base = 0.3

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/get_static_spread()
	return 0.03

/obj/item/weapon/ranged/bullet/magazine/rifle/gauss_gun/get_skill_spread(var/mob/living/L)
	return max(0.01 - (0.02 * L.get_skill_power(SKILL_RANGED)))
