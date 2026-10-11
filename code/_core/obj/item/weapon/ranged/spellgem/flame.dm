/obj/item/weapon/ranged/spellgem/flame
	name = "火焰流法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "喷出一道能够点燃目标的火焰流。"
	icon_state = "damage"

	rarity = RARITY_RARE

	shoot_delay = 3

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.75 - 1

	projectile = /obj/projectile/magic/lesser_fire
	ranged_damage_type = /damagetype/ranged/magic/flame

	shoot_sounds = list('sound/weapons/magic/firestream.ogg')

	color = "#FF934A"
	color_2 = "#FF521F"
	color_3 = "#FF521F"

	value = 800

	spread_per_shot = 16
