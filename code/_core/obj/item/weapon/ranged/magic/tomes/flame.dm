/obj/item/weapon/ranged/magic/tome/flame
	name = "火焰法术典籍"
	desc = "向敌人喷射火焰。"
	desc_extended = "使用时消耗法力。"
	cost_mana = 5

	bullet_count = 5

	shoot_delay = 4

	icon = 'icons/obj/item/weapons/ranged/magic/tomes/flame.dmi'

	projectile = /obj/projectile/magic/lesser_fire

	ranged_damage_type = /damagetype/ranged/magic/flame

	shoot_sounds = list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')

	projectile_speed = TILE_SIZE*0.75 - 1

	value = 600
