/ability/magic/projectile/fireball
	name = "火球术"
	desc = "向目标发射一枚火球。"
	icon_state = "fireball"
	cost = 10
	cooldown = SECONDS_TO_DECISECONDS(8)

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.75 - 1

	projectile_to_shoot = /obj/projectile/magic/fireball/explosive
	damage_type = /damagetype/ranged/magic/fireball

	shoot_sound = 'sound/weapons/magic/fireball.ogg'
