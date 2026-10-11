/obj/item/weapon/ranged/magic/tome/fireball
	name = "火球法术典籍"
	desc = "像个混蛋一样，往长走廊里发射火球。"
	desc_extended = "使用时消耗法力。"
	cost_mana = 50
	shoot_delay = 8

	icon = 'icons/obj/item/weapons/ranged/magic/tomes/fireball.dmi'

	projectile = /obj/projectile/magic/fireball
	ranged_damage_type = /damagetype/ranged/magic/fireball

	shoot_sounds = list('sound/weapons/magic/fireball.ogg')

	projectile_speed = TILE_SIZE*0.75 - 1

	value = 600
