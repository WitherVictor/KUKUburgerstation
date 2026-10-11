/obj/item/bullet_cartridge/tranq_11m
	name = "\improper 11.43x25mm麻醉弹"
	desc = "让人睡个好觉，瞄准头部效果最佳。"
	desc_extended = "供使用麻醉弹的枪械装填。"
	rarity = RARITY_COMMON
	icon = 'icons/obj/item/bullet/tranq.dmi'

	amount_max = 5
	amount_max_icon = 5

	bullet_diameter = 11.43
	bullet_length = 25
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol/stealth
	damage_type_bullet = /damagetype/ranged/bullet/tranq_11mm

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.01

	jam_chance = 100 //Required.

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/tranq_11m/surplus
	name = "\improper 库存旧式11.43x25mm麻醉弹"
	damage_type_bullet = /damagetype/ranged/bullet/tranq_11mm/surplus
	misfire_chance = 1
	rarity = RARITY_BROKEN
