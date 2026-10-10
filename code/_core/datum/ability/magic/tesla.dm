/ability/magic/projectile/tesla
	name = "特斯拉电球"
	desc = "向目标发射一枚特斯拉电球。"
	icon_state = "tesla"
	cost = 10
	cooldown = SECONDS_TO_DECISECONDS(10)

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.1 - 1

	projectile_to_shoot = /obj/projectile/magic/tesla
	damage_type = /damagetype/ranged/magic/tesla

	shoot_sound = 'sound/weapons/magic/fireball.ogg'
