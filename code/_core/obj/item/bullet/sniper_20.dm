/obj/item/bullet_cartridge/sniper_20
	name = "\improper 20x117mm狙击弹"
	desc = "当你铁了心要让什么东西死掉时，就用这个。"
	desc_extended = "供使用20x117mm弹药的枪械装填。"
	icon = 'icons/obj/item/bullet/20mm.dmi'

	bullet_diameter = 20
	bullet_length = 117
	bullet_color = COLOR_BULLET

	amount_max = 4
	amount_max_icon = 4

	projectile = /obj/projectile/bullet/firearm/sniper
	damage_type_bullet = /damagetype/ranged/bullet/sniper_20

	projectile_speed = BULLET_SPEED_SNIPER

	size = 0.2

	penetrations = 3

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/sniper_20/surplus
	name = "\improper 库存旧式20x117mm狙击弹"
	damage_type_bullet = /damagetype/ranged/bullet/sniper_20/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/sniper_20/du
	name = "\improper 20x117mm贫铀狙击弹"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/sniper_20/du
