/obj/item/weapon/ranged/spellgem/frost
	name = "寒霜喷射法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "短暂喷射一道使目标减速的寒霜。"
	icon_state = "damage"

	rarity = RARITY_RARE

	shoot_delay = 2

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.8 - 1

	projectile = /obj/projectile/magic/frost
	ranged_damage_type = /damagetype/ranged/magic/frost

	shoot_sounds = list('sound/weapons/magic/frost.ogg')

	color = "#0094FF"
	color_2 = "#77C6FF"
	color_3 = "#4D82A8"

	value = 800
