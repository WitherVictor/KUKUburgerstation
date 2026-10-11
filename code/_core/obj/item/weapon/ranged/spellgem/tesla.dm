/obj/item/weapon/ranged/spellgem/tesla
	name = "特斯拉爆发法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "向随机方向爆发出一阵特斯拉电弧。"
	icon_state = "damage"

	rarity = RARITY_UNCOMMON

	shoot_delay = 3

	bullet_count = 4
	projectile_speed = TILE_SIZE*0.2 - 1
	spread_per_shot = 90

	burst_delay = 15
	max_bursts = 3

	projectile = /obj/projectile/magic/tesla_bolt
	ranged_damage_type = /damagetype/ranged/magic/tesla_shock

	projectile_speed = TILE_SIZE*0.4 - 1
	shoot_sounds = list('sound/effects/tesla.ogg')

	color = "#FFFFFF"
	color_2 = "#E0F2FF"
	color_3 = "#8B969E"

	value = 800

	rarity = RARITY_UNCOMMON

/obj/item/weapon/ranged/spellgem/tesla/get_projectile_offset(var/initial_offset_x,var/initial_offset_y,var/bullet_num,var/bullet_num_max,var/accuracy)
	return list(cos(rand(1,360)),sin(rand(1,360)))
