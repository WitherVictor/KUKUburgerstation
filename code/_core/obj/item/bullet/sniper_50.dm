/obj/item/bullet_cartridge/sniper_50/
	name = "\improper .50狙击弹"
	desc = "一枪狠到连对方的家人都能感受到。"
	desc_extended = "供使用.50弹药的狙击步枪装填。"
	icon = 'icons/obj/item/bullet/50.dmi'


	bullet_diameter = 12.7
	bullet_length = 99
	bullet_color = COLOR_BULLET

	amount_max = 4
	amount_max_icon = 4

	projectile = /obj/projectile/bullet/firearm/sniper
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50

	projectile_speed = BULLET_SPEED_SNIPER

	size = 0.1

	penetrations = 2

	value = 1 //Dummy value.

/obj/item/bullet_cartridge/sniper_50/surplus
	name = "\improper 库存旧式.50狙击弹"
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/surplus
	jam_chance = 1
	value = 0
	rarity = RARITY_BROKEN

/obj/item/bullet_cartridge/sniper_50/du
	name = "\improper .50贫铀狙击弹"
	desc_extended = "供使用.50弹药的狙击步枪装填。这款采用贫铀弹头。"
	rarity = RARITY_RARE
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/du
	value = 120
	penetrations = 3

/obj/item/bullet_cartridge/sniper_50/explosive
	name = "\improper .50爆炸狙击弹"
	icon = 'icons/obj/item/bullet/50_explosive.dmi'
	rarity = RARITY_RARE
	projectile = /obj/projectile/bullet/firearm/sniper/explosive/
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/explosive
	value = 20
	penetrations = 0

/obj/item/bullet_cartridge/sniper_50/ion
	name = "\improper .50离子狙击弹"
	icon = 'icons/obj/item/bullet/50_ion.dmi'
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/ion
	value = 80
	penetrations = 0

/obj/item/bullet_cartridge/sniper_50/incendiary
	name = "\improper .50燃烧狙击弹"
	icon = 'icons/obj/item/bullet/50_incendiary.dmi'
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/incendiary
	value = 60
	penetrations = 0

/obj/item/bullet_cartridge/sniper_50/ap
	name = "\improper .50穿甲狙击弹"
	icon = 'icons/obj/item/bullet/50_ap.dmi'
	rarity = RARITY_UNCOMMON
	damage_type_bullet = /damagetype/ranged/bullet/sniper_50/ap
	value = 28
	penetrations = 3

