/obj/item/bullet_cartridge/bmg_50/
	name = "\improper .50 BMG弹"
	desc = "廉价量产的仿制.50口径子弹。"
	desc_extended = "供使用.50弹药的机枪装填。"
	icon = 'icons/obj/item/bullet/50.dmi'


	bullet_diameter = 12.7
	bullet_length = 99
	bullet_color = COLOR_BULLET

	amount_max = 4
	amount_max_icon = 4

	projectile = /obj/projectile/bullet/firearm/sniper
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50

	projectile_speed = BULLET_SPEED_SNIPER

	size = 0.1

	penetrations = 2

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/bmg_50/surplus
	name = "\improper 库存旧式.50 BMG弹"
	damage_type_bullet = /damagetype/ranged/bullet/bmg_50/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN
