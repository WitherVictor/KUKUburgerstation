/obj/item/bullet_cartridge/grenade_40mm/
	name = "40mm高爆榴弹"
	desc = "是什么让我成为优秀的爆破手？"
	desc_extended = "榴弹发射器用高爆弹。"
	icon = 'icons/obj/item/bullet/40mm_high_explosive.dmi'

	amount_max = 1
	amount_max_icon = 1

	bullet_length = 46
	bullet_diameter = 40

	projectile = /obj/projectile/bullet/grenade/he
	damage_type_bullet = /damagetype/ranged/bullet/grenade


	projectile_speed = TILE_SIZE * 0.5

	size = 0.1
	value = 1 //Dummy value.

	caseless = TRUE

/obj/item/bullet_cartridge/grenade_40mm/get_base_value()
	. = ..()
	. += 300

/obj/item/bullet_cartridge/grenade_40mm/hv
	name = "40mm高速榴弹"
	desc = "锁定，装填。"
	desc_extended = "榴弹发射器用高速弹，装药量较少。"
	icon = 'icons/obj/item/bullet/40mm_high_velocity.dmi'

	projectile = /obj/projectile/bullet/grenade/hv
	damage_type_bullet = /damagetype/ranged/bullet/grenade/high_velocity
	projectile_speed = TILE_SIZE - 1

	rarity = RARITY_UNCOMMON

/obj/item/bullet_cartridge/grenade_40mm/du
	name = "40mm微型核榴弹"
	desc = "轰——隆！"
	desc_extended = "榴弹发射器用弹药，搭载小型核装药。"
	icon = 'icons/obj/item/bullet/40mm_uranium.dmi'
	rarity = RARITY_UNCOMMON
	value_burgerbux = 1
	projectile = /obj/projectile/bullet/grenade/du

	rarity = RARITY_RARE


/obj/item/bullet_cartridge/grenade_40mm/rubber
	name = "40mm橡胶弹"
	desc = "嗷，好疼！"
	desc_extended = "榴弹发射器用非致命弹。"
	icon = 'icons/obj/item/bullet/40mm_rubber.dmi'

	projectile = /obj/projectile/bullet/grenade/rubber
	damage_type_bullet = /damagetype/ranged/bullet/grenade/rubber

	rarity = RARITY_UNCOMMON


/obj/item/bullet_cartridge/grenade_40mm/cleaning
	name = "40mm清洁弹"
	desc = "远距离命中，即刻清洁。"
	desc_extended = "在命中处清洁中等面积区域的40mm榴弹。"
	icon = 'icons/obj/item/bullet/40mm_cleaning.dmi'

	projectile = /obj/projectile/bullet/grenade/cleaning
	damage_type_bullet = /damagetype/ranged/bullet/gyrojet/rubber_grenade

	rarity = RARITY_UNCOMMON

/obj/item/bullet_cartridge/grenade_40mm/incendiary
	name = "40mm燃烧弹"
	desc = "需要让那边的一块地方着火时，就用这个。"
	desc_extended = "在命中处点燃小片区域的40mm榴弹。"
	icon = 'icons/obj/item/bullet/40mm_incendiary.dmi'

	projectile = /obj/projectile/bullet/grenade/incendiary

	rarity = RARITY_UNCOMMON
