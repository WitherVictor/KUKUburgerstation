/obj/item/weapon/ranged/magic/tome/frost
	name = "寒霜喷射法术典籍"
	desc = "向敌人喷射寒霜。"
	desc_extended = "使用时消耗法力。"
	cost_mana = 2

	shoot_delay = 15
	burst_delay = 3
	max_bursts = 4

	automatic = TRUE

	icon = 'icons/obj/item/weapons/ranged/magic/tomes/frost.dmi'

	projectile = /obj/projectile/magic/frost

	ranged_damage_type = /damagetype/ranged/magic/frost

	shoot_sounds = list('sound/weapons/magic/frost.ogg')

	projectile_speed = TILE_SIZE*0.5 - 1

	value = 600
