/obj/item/bullet_cartridge/gauss
	name = "\improper 2.54x12mm高斯弹"
	desc = "我的弹丸可是钢做的。"
	desc_extended = "材料球与过充三锂电池组合而成的弹药，供高斯武器使用。"
	icon = 'icons/obj/item/bullet/gauss.dmi'

	bullet_diameter = 2.54
	bullet_length = 12
	bullet_color = COLOR_BULLET

	amount_max = 4
	amount_max_icon = 4

	projectile = /obj/projectile/bullet/firearm/pistol/stealth
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun

	projectile_speed = TILE_SIZE-1

	size = 0.04
	value = 1 //Dummy value.

/obj/item/bullet_cartridge/gauss/ap
	name = "\improper 2.54x12mm贫铀球高斯弹"
	icon = 'icons/obj/item/bullet/gauss_ap.dmi'
	rarity = RARITY_UNCOMMON
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun/ap
	penetrations = 3

/obj/item/bullet_cartridge/gauss/explosive
	name = "\improper 2.54x12mm压缩爆晶矿球高斯弹"
	icon = 'icons/obj/item/bullet/gauss_explosive.dmi'
	rarity = RARITY_UNCOMMON
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun/explosive

/obj/item/bullet_cartridge/gauss/ion
	name = "\improper 2.54x12mm铀铁合金球高斯弹"
	icon = 'icons/obj/item/bullet/gauss_ion.dmi'
	rarity = RARITY_UNCOMMON
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun/ion

/obj/item/bullet_cartridge/gauss/incendiary
	name = "\improper 2.54x12mm压缩凝固汽油球高斯弹"
	icon = 'icons/obj/item/bullet/gauss_incendiary.dmi'
	rarity = RARITY_UNCOMMON
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun/incendiary

/obj/item/bullet_cartridge/gauss/surplus
	name = "\improper 库存旧式2.54x12mm生铁球高斯弹"
	damage_type_bullet = /damagetype/ranged/bullet/gauss_gun/surplus
	jam_chance = 1
	rarity = RARITY_BROKEN
