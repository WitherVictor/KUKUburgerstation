/obj/item/bullet_cartridge/shotgun_20/
	name = "\improper 20号鹿弹"
	desc = "一次射出许多小弹丸。"
	desc_extended = "精度较低，一发内含多颗弹丸。"
	icon = 'icons/obj/item/bullet/shotgun_20.dmi'
	icon_state = "buckshot"

	projectile_count = 5
	base_spread = 0.03

	bullet_diameter = 15.6
	bullet_length = 88.9

	projectile = /obj/projectile/bullet/firearm/shotgun_pellet
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_20

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04
	value = 1.6

	inaccuracy_modifier = 1.25

	amount_max = 5
	amount_max_icon = 5

	view_punch_mod = 0.5

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/shotgun_20/get_value()
	. = ..()
	. *= 0.5

/obj/item/bullet_cartridge/shotgun_20/can_be_worn(var/mob/living/advanced/owner,var/obj/hud/inventory/I,var/messages=FALSE)
	return TRUE

/obj/item/bullet_cartridge/shotgun_20/slug
	name = "\improper 20号独头弹"
	rarity = RARITY_UNCOMMON
	desc = "射出一颗大弹丸。"
	desc_extended = "散布较小，每发只有一颗弹丸。"
	icon_state = "slug"

	projectile_count = 1
	base_spread = 0

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_20/slug

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.04
	value = 1.8

/obj/item/bullet_cartridge/shotgun_20/slug/surplus
	name = "\improper 库存旧式20号独头弹"
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/slug/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/shotgun_20/surplus
	name = "\improper 库存旧式20号鹿弹"
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_20/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/shotgun_20/cursed
	name = "\improper 20号诅咒弹"
	desc = "一次射出许多小魔法阵。"
	desc_extended = "弹壳上布满神秘符文，闻起来还有海水的味道？？？"
	icon_state = "buckshot"

	projectile_count = 7
	base_spread = 0.03

	projectile = /obj/projectile/magic/chaos
	damage_type_bullet = /damagetype/ranged/magic/chaos

	projectile_speed = TILE_SIZE*0.2 - 1

	size = 0.04
	value = 1.6

	inaccuracy_modifier = 1.25

	rarity = RARITY_RARE
