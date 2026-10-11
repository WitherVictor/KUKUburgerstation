/obj/item/weapon/ranged/magic/staff/lavaland
	name = "熔岩法杖"
	desc = "急用时，也可以拿它热汤。"
	desc_extended = "发射特殊熔岩弹体的法杖，可临时制造熔岩坑。施法者与友军不会受到它的伤害。"

	icon = 'icons/obj/item/weapons/ranged/magic/lavaland.dmi'

	shoot_delay = 10

	cost_charge = SOUL_SIZE_UNCOMMON/10
	total_charge = SOUL_SIZE_UNCOMMON

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.75 - 1

	projectile = /obj/projectile/magic/fireball/lava/
	ranged_damage_type = /damagetype/ranged/magic/fireball

	shoot_sounds = list('sound/weapons/magic/fireball.ogg')

	value = 2000

	value_burgerbux = 1

	rarity = RARITY_MYTHICAL

