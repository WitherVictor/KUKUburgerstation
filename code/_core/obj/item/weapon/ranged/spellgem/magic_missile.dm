/obj/item/weapon/ranged/spellgem/magic_missile
	name = "魔法飞弹法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射一枚追踪敌人的魔法飞弹，造成奥术伤害。"
	icon_state = "damage"

	rarity = RARITY_COMMON

	shoot_delay = 10

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.25 - 1

	projectile = /obj/projectile/magic/magic_missile
	ranged_damage_type = /damagetype/ranged/magic/magic_missile

	color = "#BAE4FF"
	color_2 = "#FFFFFF"
	color_3 = "#87AAC1"

	shoot_sounds = list('sound/weapons/magic/magic_missile.ogg')
	value = 800
