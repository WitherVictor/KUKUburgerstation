/obj/item/bullet_cartridge/shotgun_23/
	name = "\improper 23x75mmR鹿弹"
	desc = "现在每颗弹丸的弹丸含量增加50%！"
	desc_extended = "为KS23专门设计的鹿弹。"
	icon = 'icons/obj/item/bullet/shotgun_23.dmi'
	icon_state = "23buck"

	projectile_count = 6
	base_spread = 0.06

	bullet_diameter = 23
	bullet_length = 75

	projectile = /obj/projectile/bullet/firearm/shotgun_pellet
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_23

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04

	inaccuracy_modifier = 1.5

	amount_max = 4
	amount_max_icon = 4

	view_punch_mod = 0.5

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/shotgun_23/get_value()
	. = ..()
	. *= 0.5

/obj/item/bullet_cartridge/shotgun_23/can_be_worn(var/mob/living/advanced/owner,var/obj/hud/inventory/I,var/messages=FALSE)
	return TRUE

/obj/item/bullet_cartridge/shotgun_23/slug
	name = "\improper 23x75mmR独头弹"
	desc = "这玩意儿真大！"
	desc_extended = "为KS23专门设计的霰弹枪独头弹。"
	rarity = RARITY_UNCOMMON
	icon_state = "23slug"

	projectile_count = 1
	base_spread = 0.03

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_23/slug

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.04
	value = 4

/obj/item/bullet_cartridge/shotgun_23/fire
	name = "\improper 23x75mmR燃烧弹"
	desc = "我着火了！我着火了！我着火了！"
	desc_extended = "为KS23专门设计的燃烧弹。"
	rarity = RARITY_RARE
	icon_state = "23fire"

	projectile_count = 4
	base_spread = 0.12

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_23/fire

/obj/item/bullet_cartridge/shotgun_23/rubber
	name = "\improper 23x75mmR橡胶独头弹"
	desc = "欢迎来到名为“警察暴力”的国度。"
	desc_extended = "为KS23专门设计的橡胶独头弹。"
	rarity = RARITY_UNCOMMON
	icon_state = "23rubber"

	projectile_count = 1
	base_spread = 0.03

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_23/rubber_slug

