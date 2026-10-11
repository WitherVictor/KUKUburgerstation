/obj/item/bullet_cartridge/pulse
	name = "脉冲能量弹"
	desc = "小巧精致的电池，储存的能量足以供一户人家使用一周。"
	desc_extended = "供使用脉冲能量弹的脉冲武器装填。"
	icon = 'icons/obj/item/bullet/pulse_cell.dmi'


	bullet_diameter = 13
	bullet_length = 52
	bullet_color = COLOR_GREEN

	amount_max = 3
	amount_max_icon = 3

	projectile = /obj/projectile/bullet/laser/strong
	damage_type_bullet = /damagetype/ranged/laser/pulse

	projectile_speed = BULLET_SPEED_SNIPER

	size = 0.1

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/pulse/surplus
	name = "\improper 库存旧式脉冲能量弹"
	damage_type_bullet = /damagetype/ranged/laser/pulse/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN
