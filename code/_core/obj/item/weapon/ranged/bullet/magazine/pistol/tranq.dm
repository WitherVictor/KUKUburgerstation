/obj/item/weapon/ranged/bullet/magazine/pistol/tranq
	name = "\improper 11.43mm麻醉手枪"
	desc = "给想找点事做的和平主义者。"
	desc_extended = "多用途消音麻醉手枪，发射特制亚音速11.43mm化学弹药。每次开火后都必须手动上膛。附带的激光指示器让它极为精准。"
	icon = 'icons/obj/item/weapons/ranged/pistol/tranq.dmi'
	icon_state = "inventory"
	value = 1900

	company_type = "Solarian"

	tier = 3

	movement_spread_base = 0
	inaccuracy_modifier = 0.25
	movement_inaccuracy_modifier = 0

	shoot_delay = 3

	automatic = FALSE

	shoot_sounds = list('sound/weapons/ranged/pistol/tranq/shoot.ogg')

	can_wield = FALSE

	size = SIZE_2
	weight = 6

	heat_max = 0.01

	bullet_length_min = 23
	bullet_length_best = 25
	bullet_length_max = 26

	bullet_diameter_min = 11
	bullet_diameter_best = 11.43
	bullet_diameter_max = 12

	shoot_alert = ALERT_LEVEL_NONE

	value_burgerbux = 1

	rarity = RARITY_RARE

/obj/item/weapon/ranged/bullet/magazine/pistol/tranq/get_static_spread()
	return 0

/obj/item/weapon/ranged/bullet/magazine/pistol/tranq/get_skill_spread(var/mob/living/L)
	return max(0,0.005 - (0.02 * L.get_skill_power(SKILL_RANGED)))
