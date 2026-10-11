/obj/item/bullet_cartridge/shotgun_12/
	name = "\improper 12号鹿弹"
	desc = "一次射出许多小弹丸。"
	desc_extended = "精度较低，一发内含多颗弹丸。"
	icon = 'icons/obj/item/bullet/shotgun.dmi'
	icon_state = "buckshot"

	projectile_count = 6
	base_spread = 0.03

	bullet_diameter = 18.5
	bullet_length = 76.2

	projectile = /obj/projectile/bullet/firearm/shotgun_pellet
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12

	projectile_speed = BULLET_SPEED_LARGE_PROJECTILE

	size = 0.04
	value = 1.6

	inaccuracy_modifier = 1.25

	amount_max = 5
	amount_max_icon = 5

	view_punch_mod = 0.5

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/shotgun_12/get_value()
	. = ..()
	. *= 0.5

/obj/item/bullet_cartridge/shotgun_12/can_be_worn(var/mob/living/advanced/owner,var/obj/hud/inventory/I,var/messages=FALSE)
	return TRUE

/obj/item/bullet_cartridge/shotgun_12/slug
	name = "\improper 12号独头弹"
	rarity = RARITY_UNCOMMON
	desc = "射出一颗大弹丸。"
	desc_extended = "散布较小，每发只有一颗弹丸。"
	icon_state = "slug"

	projectile_count = 1
	base_spread = 0

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/slug

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.04

/obj/item/bullet_cartridge/shotgun_12/slug/surplus
	name = "\improper 库存旧式12号独头弹"
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/slug/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/shotgun_12/slug/cleaning
	name = "\improper 12号清洁独头弹"
	rarity = RARITY_UNCOMMON
	desc = "射出一颗大弹丸。"
	desc_extended = "散布较小，每发只有一颗弹丸，而且还能清洁！"
	icon_state = "oldrubber"

	projectile_count = 1
	base_spread = 0

	projectile = /obj/projectile/bullet/cleaning_shot
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/slug/cleaning

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.04

	caseless = TRUE


/obj/item/bullet_cartridge/shotgun_12/surplus
	name = "\improper 库存旧式12号鹿弹"
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/shotgun_12/fire
	name = "\improper 12号飞龙吐息弹"
	desc = "把一切都点燃。"
	desc_extended = "灌注魔力的霰弹枪弹药，一次射出3发高伤害燃烧弹。别问原理。"
	icon_state = "fire"
	rarity = RARITY_RARE

	projectile_count = 3
	base_spread = 0.01

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/magic/fireball

	projectile_speed = 8

	size = 0.04

	inaccuracy_modifier = 1


/obj/item/bullet_cartridge/shotgun_12/flechette
	name = "\improper 12号箭形弹"
	rarity = RARITY_UNCOMMON
	desc = "一次射出许多小碎片。"
	desc_extended = "精度较低，一发内含多枚弹体。伤害较低，但穿甲能力更强。"
	icon_state = "flechette"

	projectile_count = 5
	base_spread = 0.025

	projectile = /obj/projectile/bullet/firearm/shotgun_flechette
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/flechette

	projectile_speed = BULLET_SPEED_PISTOL_LIGHT

	size = 0.04

	inaccuracy_modifier = 1.1

	penetrations = 1

/obj/item/bullet_cartridge/shotgun_12/flechette/surplus
	name = "\improper 库存旧式12号箭形弹"
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/flechette/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/shotgun_12/rubber // yes i literally just copied the ks-23's rubber slugs shut up
	name = "\improper 12号橡胶独头弹"
	desc = "真男人就该用一大块橡胶狠狠砸过去。"
	desc_extended = "据说致命性较低的橡胶独头弹。会造成剧痛，但实际伤害不高。"
	rarity = RARITY_UNCOMMON
	icon_state = "rubber"

	projectile_count = 1
	base_spread = 0.03

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/rubber_slug



/obj/item/bullet_cartridge/shotgun_12/frag
	name = "\improper 12号破片弹"
	rarity = RARITY_RARE
	desc = "射出一颗大弹丸。"
	desc_extended = "散布较小，每发只有一颗弹丸。"
	icon_state = "slug"

	projectile_count = 1
	base_spread = 0

	projectile = /obj/projectile/bullet/firearm/shotgun_slug
	damage_type_bullet = /damagetype/ranged/bullet/shotgun_12/frag

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.04


/obj/item/bullet_cartridge/shotgun_12/techshot
	name = "\improper 12号科技弹"
	rarity = RARITY_RARE
	desc = "射出一道聚焦激光。"
	desc_extended = "发射聚焦激光的霰弹枪弹药。"
	icon_state = "techshot"

	projectile_count = 1
	base_spread = 0

	projectile = /obj/projectile/bullet/laser/plasma_cutter
	damage_type_bullet = /damagetype/ranged/laser/pulse

	projectile_speed = BULLET_SPEED_PISTOL_HEAVY

	size = 0.04
