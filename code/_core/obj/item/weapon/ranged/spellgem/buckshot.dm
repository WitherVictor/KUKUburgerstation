/obj/item/weapon/ranged/spellgem/buckshot
	name = "鹿弹法术宝石"
	desc = "一切……铅弹的源泉？"
	desc_extended = "发射鹿弹。等等，这不就是魔法霰弹枪吗？"
	icon_state = "damage"

	rarity = RARITY_UNCOMMON

	shoot_delay = 12

	bullet_count = 6
	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE
	spread_per_shot = 5

	projectile = /obj/projectile/bullet/firearm/shotgun_pellet
	ranged_damage_type = /damagetype/ranged/bullet/shotgun_12

	shoot_sounds = list('sound/weapons/ranged/shotgun/doom/shoot.ogg')

	color = "#B0B0CC"
	color_2 = "#CCB0B0"
	color_3 = "#000000"

	value = 2700
