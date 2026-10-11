/obj/item/weapon/ranged/spellgem/inferno
	name = "烈焰法术宝石"
	desc = "一切魔法的源泉。"
	desc_extended = "发射一团火焰，命中后在落点留下危险火场。"
	icon_state = "damage"

	rarity = RARITY_RARE

	shoot_delay = 20

	bullet_count = 1
	projectile_speed = TILE_SIZE*0.4 - 1

	projectile = /obj/projectile/magic/inferno
	ranged_damage_type = /damagetype/ranged/magic/inferno

	shoot_sounds = list('sound/weapons/magic/fireball.ogg')

	color = "#FF6A00"
	color_2 = "#FFD800"
	color_3 = "#FFB200"

	value = 800

/obj/item/weapon/ranged/spellgem/inferno/get_base_value()
	. = ..()
	. += 1000 //For the fire spreading.

/obj/item/weapon/ranged/spellgem/inferno/calculate_mana_cost()
	. = ..()
	. += 25 //For the fire spreading.
