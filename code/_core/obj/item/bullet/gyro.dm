/obj/item/bullet_cartridge/gyrojet/
	name = "\improper 20mm旋转火箭弹"
	desc = "火箭飞拳！"
	desc_extended = "供使用旋转火箭弹的手枪和步枪装填。即使制作精良，这种弹药也以哑火率高著称。"
	icon = 'icons/obj/item/bullet/gyrojet.dmi'

	amount_max = 4
	amount_max_icon = 4

	bullet_length = 50
	bullet_diameter = 20

	projectile = /obj/projectile/bullet/gyrojet
	damage_type_bullet = /damagetype/ranged/bullet/gyrojet/


	projectile_speed = TILE_SIZE * 0.9

	misfire_chance = 5

	size = 0.1
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/gyrojet/surplus
	name = "\improper 库存旧式20mm旋转火箭弹"
	misfire_chance = 20
	rarity = RARITY_BROKEN

