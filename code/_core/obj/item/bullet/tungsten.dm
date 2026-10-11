/obj/item/bullet_cartridge/tungsten
	name = "钨杆弹"
	desc = "希望用这东西不算战争罪……"
	desc_extended = "用于射击重甲目标的小型钨杆。"
	rarity = RARITY_COMMON
	icon = 'icons/obj/item/bullet/tungsten.dmi'
	amount_max = 5
	amount_max_icon = 5
	icon_state = "t"

	bullet_length = 20
	bullet_diameter = 5

	projectile = /obj/projectile/bullet/tungsten
	damage_type_bullet = /damagetype/ranged/bullet/tungsten

	projectile_speed = BULLET_SPEED_MAX

	size = 0.5

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/tungsten/surplus
	name = "\improper 库存旧式钨杆弹"
	damage_type_bullet = /damagetype/ranged/bullet/tungsten/surplus
	misfire_chance = 1
	rarity = RARITY_BROKEN
